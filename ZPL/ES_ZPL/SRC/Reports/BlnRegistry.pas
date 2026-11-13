unit BlnRegistry;

interface

uses
  Db, DbClient, DbTables, F6Report;

type
  TRecTotals = record
    Days1st5,
    DaysFund: Integer;

    Sum1st5,
    SumFund: Double;
  end;

  TBlnRegistry = class(TF6Report)
  private
    DtProc: TDateTime;
    ForPlanDept: Boolean;

    QryVBln,
    QryBlnDetails,
    QryPere,
    QryPos: TQuery;

    CdsDetails,
    CdsRes: TClientDataSet;

    ListHandFix: Boolean;

    PageTotals, RepTotals: TRecTotals;
    CurPageLine, CurPage,
    CurRow, CurCol, Npp: integer;

    CurTabN, CurPosId: Integer;

    constructor Create(
      ParamDtProc: TDateTime; ForPlanDept: Boolean); reintroduce;

    destructor Destroy; override;

    function OpenQryVBln: TQuery;
    procedure OpenQryBlnDetails(EmplId: integer; DtBeg, DtEnd: TDateTime;
      PayType: String; SpsId: Integer);
    function CreateDetailsCds: TClientDataSet;
    function CreateCdsRes: TClientDataSet;

    procedure PrepQryPere;
    procedure PrepQryPos;
    procedure LoadPosInfo;
    function ShouldPrintPosInfo: Boolean;

    procedure CheckHandFix;

    procedure PrintReportHeader;
    procedure StartNewPage;
    procedure PrintSickList;
    procedure CompletePage;
    procedure PrintReportTotals;

    procedure ProcessSickList;
    procedure ProcessListDetail;

    procedure UpdateListTotals(Supplmnt, RowHandFix: Boolean;
      PayType: ShortString; Days: Integer; Sum: Double);
    procedure UpdatePageTotals(
      PayType: ShortString; Days: Integer; Sum: Double);
    procedure UpdatePayTypeTotals(
      MainPayType, PayType: ShortString; Days: Integer; Sum: Double);

    class function InitTotals: TRecTotals;

  protected
      procedure InitReport; override;
      procedure InitBook; override;

  public
    class procedure Run(DtProc: TDateTime; ForPlanDept: Boolean);

    procedure Print; override;
  end;

implementation

uses
  Controls, Forms, Graphics, SysUtils, TTF160_TLB, a_Const, a_Lib, z_Dm,
  PrintUtils, QryLib, NumUtils, CdsLib, Variants, DateLib;

const
  MAX_PAGE_LINES = 31;

//------------------------------------------------------------------------------
// Выполнение отчёта.
//------------------------------------------------------------------------------
class procedure TBlnRegistry.Run(
  DtProc: TDateTime;
  ForPlanDept: Boolean
);
begin
  Screen.Cursor := crHourGlass;

  with TBlnRegistry.Create(DtProc, ForPlanDept) do begin
    QryVBln := OpenQryVBln;
    QryBlnDetails := TQuery.Create(nil);

    if ForPlanDept then begin
      PrepQryPere;
      PrepQryPos;
    end;

    CdsDetails := CreateDetailsCds;
    CdsRes := CreateCdsRes;

    Print;
    Preview;

    Free;
  end;

  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
constructor TBlnRegistry.Create(ParamDtProc: TDateTime; ForPlanDept: Boolean);
begin
  Self.DtProc := ParamDtProc;
  Self.ForPlanDept := ForPlanDept;

  inherited Create;
end;

//------------------------------------------------------------------------------
destructor TBlnRegistry.Destroy;
begin
  QryVBln.Free;
  QryBlnDetails.Free;

  if ForPlanDept then begin
    QryPere.Free;
    QryPos.Free;
  end;

  CdsDetails.Free;
  CdsRes.Free;
end;

//------------------------------------------------------------------------------
// Выбор больничных.
//------------------------------------------------------------------------------
function TBlnRegistry.OpenQryVBln: TQuery;
begin
  Result := TQuery.Create(nil);

  with Result, QryUtils do begin
    InitQuery(Result);

    SQL.Add(
      'select vb.*, up.Id, up.Fam, up.Ima, up.Otch ' +
      'from z_VBln vb '  +
        'left join z_UPI up on up.TabN = vb.TabN ' +
      'where vb.DtProc = :DtProc ' +
      'order by vb.TabN, vb.DtBeg, vb.VidN');
    ParamByName('DtProc').AsDateTime := DtProc;
    Open;
  end; {with}
end; {OpenQryVBln}

//------------------------------------------------------------------------------
// Выбор начислений/удержаний по больничному.
//------------------------------------------------------------------------------
procedure TBlnRegistry.OpenQryBlnDetails(
  EmplId: integer;
  DtBeg, DtEnd: TDateTime;
  PayType: String;
  SpsId: Integer
);
begin
  with QryBlnDetails, QryUtils do begin
    InitQuery(QryBlnDetails);

    // Полагаем, что больничные листы пересекаться не могут.
    SQL.Add(
      'select n.*, b.Spec_Nr SickListSpecNr ' +
      'from z_Nu n ' +
        'left join z_VBln b on b.TabN = n.TabN ' +
          'and b.Spec_Nr = n.Spec_Nr ' +
      'where n.TabN = :TabN ' +
        'and n.KdSps = :KdSps ' +
        'and n.Dt_Beg >= :DtBeg ' +
        'and n.Dt_End <= :DtEnd ' +
        'and n.DtProc = :DtProc ' +
        // SB 23.3.2026 По аналогии, наверное, и 2606
        'and n.VidN in ("2603", "2606", "' + PayType + '") ' +
      'order by n.Sovm, n.VidN, n.Dt_Beg');

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('KdSps').AsInteger := SpsId;
    ParamByName('DtBeg').AsDateTime := DtBeg;
    ParamByName('DtEnd').AsDateTime := DtEnd;
    ParamByName('DtProc').AsDateTime := DtProc;
    Open;
  end; {with}
end; {OpenQryBlnDetails}

//------------------------------------------------------------------------------
function TBlnRegistry.CreateDetailsCds: TClientDataSet;
begin
  Result := TClientDataSet.Create(nil);
  with Result, FieldDefs do begin
    Add('Supplmnt', ftBoolean); // Совместительская сумма.
    Add('HandFix', ftBoolean); // Признак ручной правки.
    Add('Days1st5', ftSmallInt);
    Add('Sum1st5', ftFloat);
    Add('DaysFund', ftSmallInt);
    Add('SumFund', ftFloat);
    CreateDataSet;

    with IndexDefs.AddIndexDef do begin
      Name := 'Primary';
      Fields := 'Supplmnt;HandFix';
      DescFields := 'HandFix';
    end;
    IndexName := 'Primary';

    Open;
  end;
end;

//------------------------------------------------------------------------------
// Создание набора для итогов по видам начисления.
//------------------------------------------------------------------------------
function TBlnRegistry.CreateCdsRes: TClientDataSet;
begin
  Result := TClientDataSet.Create(nil);

  with Result do begin
    FieldDefs.Add('NR', ftAutoInc);
    FieldDefs.Add('VidN', ftString, 4);
    FieldDefs.Add('Days1st5', ftSmallInt);
    FieldDefs.Add('Sum1st5', ftFloat);
    FieldDefs.Add('DaysFund', ftSmallInt);
    FieldDefs.Add('SumFund', ftFloat);
    CreateDataSet;

    AddIndex('OnVidN', 'VidN', []);
    Open;

    IndexName := 'OnVidN';
  end;
end; {CreateCdsRes}

//------------------------------------------------------------------------------
// Формирование отчёта.
//------------------------------------------------------------------------------
procedure TBlnRegistry.Print;
begin
  CurRow := 1;
  CurCol := 1;
  PrintReportHeader;

  Npp := 0;
  RepTotals := InitTotals;

  CurPage := 0;
  StartNewPage;

  with QryVBln do
  while not Eof do begin
    if CurPageLine >= MAX_PAGE_LINES then begin
      CompletePage;

      Inc(CurRow);
      Book.AddRowPageBreak(CurRow);

      StartNewPage;
    end;

    ProcessSickList;

    if ForPlanDept then
      LoadPosInfo;

    PrintSickList;

    CdsDetails.EmptyDataSet;

    Next;
  end;

  CompletePage;

  if CurPageLine >= MAX_PAGE_LINES - 4 - cdsRes.RecordCount then begin
    Inc(CurRow);
    Book.AddRowPageBreak(CurRow);
  end;

  Inc(CurRow);
  PrintReportTotals;
end;

//------------------------------------------------------------------------------
procedure TBlnRegistry.PrepQryPere;
begin
  QryPere := QryUtils.CreateQuery;
  QryUtils.PreparePeekAssign(QryPere);
end;

//------------------------------------------------------------------------------
procedure TBlnRegistry.PrepQryPos;
begin
  QryPos := QryUtils.CreateQuery;
  QryUtils.PreparePeekPosition(QryPos);
end;

//------------------------------------------------------------------------------
procedure TBlnRegistry.LoadPosInfo;
begin
  with QryPere do begin
    Close;
    ParamByName('EmplId').AsInteger := QryVBln.FieldByName('TabN').AsInteger;
    ParamByName('OnDate').AsDateTime := QryVBln.FieldByName('DtBeg').AsDateTime;
    Open;
  end;

  with QryPos do begin
    Close;
    ParamByName('PosId').AsInteger := QryPere.FieldByName('NewKdOk').AsInteger;
    Open;
  end;
end;

//------------------------------------------------------------------------------
// Обработка отдельного больничного.
//------------------------------------------------------------------------------
procedure TBlnRegistry.ProcessSickList;
begin
  with QryVBln do begin
    OpenQryBlnDetails(FieldByName('TabN').AsInteger,
      FieldByName('DtBeg').AsDateTime, FieldByName('DtEnd').AsDateTime,
      FieldByName('VidN').AsString, FieldByName('KdSps').AsInteger);
  end;

  CheckHandFix;

  with QryBlnDetails do begin
    First;
    while not Eof do begin
      ProcessListDetail;
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TBlnRegistry.CheckHandFix;
begin
  ListHandFix := false;

  with QryBlnDetails do begin
    First;

    while not Eof do begin
      ListHandFix := FieldByName('SickListSpecNr').AsInteger <>
        FieldByName('Spec_Nr').AsInteger;

      if ListHandFix then
        break;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Обработка элемента больничного.
//------------------------------------------------------------------------------
procedure TBlnRegistry.ProcessListDetail;
var
  Supplmnt, RowHandFix: Boolean;
  PayType: ShortString;
  Days: integer;
  Sum: double;
begin
  with QryBlnDetails, DateUtils do begin
    Supplmnt := FieldByName('Sovm').AsString = 'Y';

    PayType := FieldByName('VidN').AsString;

    if ListHandFix then
      Days := 0
    else
      Days := DaysCount(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime);

    Sum := FieldByName('Summa').AsFloat;

    RowHandFix := FieldByName('SickListSpecNr').AsInteger <>
      FieldByName('Spec_Nr').AsInteger;
  end;

  UpdateListTotals(Supplmnt, RowHandFix, PayType, Days, Sum);
  UpdatePageTotals(PayType, Days, Sum);
  UpdatePayTypeTotals(
    QryVBln.FieldByName('VidN').AsString, PayType, Days, Sum);
end;

//------------------------------------------------------------------------------
procedure TBlnRegistry.UpdateListTotals(
  Supplmnt, RowHandFix: Boolean;
  PayType: ShortString;
  Days: Integer;
  Sum: Double);
begin
  with CdsDetails do begin
    if not Locate('Supplmnt;HandFix', VarArrayOf([Supplmnt, RowHandFix]), [])
    then begin
      Append;
      FieldByName('Supplmnt').AsBoolean := Supplmnt;
      FieldByName('HandFix').AsBoolean := RowHandFix;
    end else
      Edit;

    // SB 23.3.2026 По аналогии, наверное, и 2606
    if (PayType = '2603') or (PayType = '2606') then begin
      FieldByName('Days1st5').AsInteger :=
        FieldByName('Days1st5').AsInteger + Days;
      FieldByName('Sum1st5').AsFloat := FieldByName('Sum1st5').AsFloat + Sum;
    end else begin
      FieldByName('DaysFund').AsInteger :=
        FieldByName('DaysFund').AsInteger + Days;
      FieldByName('SumFund').AsFloat := FieldByName('SumFund').AsFloat + Sum;
    end;

    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TBlnRegistry.UpdatePageTotals(
  PayType: ShortString;
  Days: Integer;
  Sum: Double);
begin
  // SB 23.3.2026 По аналогии, наверное, и 2606
  if (PayType = '2603') or (PayType = '2606') then begin
    PageTotals.Days1st5 := PageTotals.Days1st5 + Days;
    PageTotals.Sum1st5 := PageTotals.Sum1st5 + Sum;
  end else begin
    PageTotals.DaysFund := PageTotals.DaysFund + Days;
    PageTotals.SumFund := PageTotals.SumFund + Sum;
  end;
end;

//------------------------------------------------------------------------------
procedure TBlnRegistry.UpdatePayTypeTotals(
  MainPayType, PayType: ShortString;
  Days: Integer;
  Sum: Double);
begin
  with CdsRes do begin
    if not Locate('VidN', MainPayType, []) then begin
      Append;
      FieldByName('VidN').AsString := MainPayType;
    end else
      Edit;

    // SB 23.3.2026 По аналогии, наверное, и 2606
    if (PayType = '2603') or (PayType = '2606') then begin
      FieldByName('Days1st5').AsInteger :=
        FieldByName('Days1st5').AsInteger + Days;
      FieldByName('Sum1st5').AsFloat := FieldByName('Sum1st5').AsFloat + Sum;
    end else begin
      FieldByName('DaysFund').AsInteger :=
        FieldByName('DaysFund').AsInteger + Days;
      FieldByName('SumFund').AsFloat := FieldByName('SumFund').AsFloat + Sum;
    end;

    Post;
  end;
end;

//------------------------------------------------------------------------------
// Печать заголовка отчёта.
//------------------------------------------------------------------------------
procedure TBlnRegistry.PrintReportHeader;
var
  Date: TDate;
begin
  with Book do begin
    TextRC[CurRow, 1] := 'Національний університет "Одеська політехніка"';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontSize := 11;
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    Inc(CurRow, 2);
    TextRC[CurRow, 1] := 'Реєстр лікарняних листів';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    Inc(CurRow);
    Date := DateUtils.Decode(DtProc);
    TextRC[CurRow, 1] :=
      'за ' + UkrMes(Date.Mnth) + ' ' + IntToStr(Date.Year) + ' р.';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
  end; {with}
end; {PrintReportHeader}

//------------------------------------------------------------------------------
// Начало новой страницы.
//------------------------------------------------------------------------------
procedure TBlnRegistry.StartNewPage;
var
  mCellFormat : IF1CellFormat;
begin
  with Book do begin
    Inc(CurPage);

    Inc(CurRow);
    TextRC[CurRow, MaxColNum] := 'Стр. ' + IntToStr(CurPage);
    SetSelection(CurRow, MaxColNum, CurRow, MaxColNum);
    SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);

    Inc(CurRow);
    CurCol := 1;
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := true;
    SetCellFormat(mCellFormat);
    TextRC[CurRow, CurCol] := '№ з/п';

    Inc(CurCol);
    TextRC[CurRow, CurCol] := 'Таб. номер';
    SetSelection(CurRow, CurCol, CurRow, CurCol);
    FontBold := true;

    TextRC[CurRow + 1, CurCol] := '№ лікарн. листа';
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := true;
    SetCellFormat(mCellFormat);
    TextRC[CurRow, CurCol] := 'ІНН';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := true;
    SetCellFormat(mCellFormat);
    TextRC[CurRow, CurCol] := 'П.І.Б.';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := true;
    SetCellFormat(mCellFormat);
    TextRC[CurRow, CurCol] := 'Початок Кінець';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := true;
    SetCellFormat(mCellFormat);
    TextRC[CurRow, CurCol] := 'Кільк. календ. днів';

    Inc(CurCol);
    TextRC[CurRow, CurCol] := 'Відс. опл.';
    SetSelection(CurRow, CurCol, CurRow, CurCol);
    FontSize := 8;
    FontItalic := true;

    TextRC[CurRow + 1, CurCol] := 'Варт. одного дня';
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := true;
    SetCellFormat(mCellFormat);
    TextRC[CurRow, CurCol] := 'Нарах. всього';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow, CurCol + 1);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := false;
    SetCellFormat(mCellFormat);
    TextRC[CurRow, CurCol] := 'В тому числі';

    Inc(CurRow);
    TextRC[CurRow, CurCol] := 'за рах. підпр.';

    Inc(CurCol);
    TextRC[CurRow, CurCol] := 'за рах. ПФУ';
    SetSelection(CurRow, CurCol - 1, CurRow, CurCol);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);

    Inc(CurCol);
    SetSelection(CurRow - 1, CurCol, CurRow, CurCol);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := true;
    SetCellFormat(mCellFormat);
    TextRC[CurRow - 1, CurCol] := 'Вид';

    Inc(CurCol);
    SetSelection(CurRow - 1, CurCol, CurRow, CurCol);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := true;
    SetCellFormat(mCellFormat);
    TextRC[CurRow - 1, CurCol] := 'Нр З';

    Inc(CurCol);
    SetSelection(CurRow - 1, CurCol, CurRow, CurCol);
    mCellFormat := CreateNewCellFormat;
    mCellFormat.AlignHorizontal := F1HAlignCenter;
    mCellFormat.AlignVertical := F1VAlignCenter;
    mCellFormat.MergeCells := true;
    mCellFormat.WordWrap := true;
    SetCellFormat(mCellFormat);
    TextRC[CurRow - 1, CurCol] := 'Дт З';

    if ForPlanDept then begin
      Inc(CurCol);
      SetSelection(CurRow - 1, CurCol, CurRow, CurCol);
      mCellFormat := CreateNewCellFormat;
      mCellFormat.AlignHorizontal := F1HAlignCenter;
      mCellFormat.AlignVertical := F1VAlignCenter;
      mCellFormat.MergeCells := true;
      mCellFormat.WordWrap := true;
      SetCellFormat(mCellFormat);
      TextRC[CurRow - 1, CurCol] := 'Посада';
    end;

    SetSelection(CurRow - 1, 1, CurRow, MaxColNum);
    SetBorder(1, 1, 1, 1, 1, 0, clBlack, clBlack, clBlack, clBlack, clBlack);

    CurPageLine := 0;
    PageTotals := InitTotals;
  end;
end;

//------------------------------------------------------------------------------
// Печать отдельного больничного листа.
//------------------------------------------------------------------------------
procedure TBlnRegistry.PrintSickList;
var
  EmplId,
  Days1st5, DaysFund: Integer;
  Sum1st5, SumFund: Double;
  HandFix: Boolean;
  StartRow, I: integer;
begin
  Inc(Npp);

  HandFix := false;
  StartRow := CurRow + 1;

  with QryVBln, Book do begin
    NumberRC[StartRow, 1] := Npp;

    EmplId := QryVBln.FieldByName('TabN').AsInteger;

    with CdsDetails do begin
      First;

      while not Eof do begin
        Inc(CurRow);
        NumberRC[CurRow, 2] := EmplId;
        TextRC[CurRow, 3] := QryVBln.FieldByName('Id').AsString;

        TextRC[CurRow + 1, 2] :=
          QryVBln.FieldByName('SerList').AsString + ' ' +
          QryVBln.FieldByName('NrList').AsString;

        TextRC[CurRow, 4] := DmMain.TabN2FamIO(EmplId);
        SetSelection(CurRow, 4, CurRow, 4);
        FontBold := true;

        TextRC[CurRow, 5] := DateToStr(QryVBln.FieldByName('DtBeg').AsDateTime);
        TextRC[CurRow + 1, 5] := DateToStr(QryVBln.FieldByName('DtEnd').AsDateTime);

        Days1st5 := FieldByName('Days1st5').AsInteger;
        DaysFund := FieldByName('DaysFund').AsInteger;
        Sum1st5 := FieldByName('Sum1st5').AsFloat;
        SumFund := FieldByName('SumFund').AsFloat;

        if FieldByName('HandFix').AsBoolean then
          HandFix := true;

        if not HandFix then begin
          NumberRC[CurRow, 6] := Days1st5 + DaysFund;
          SetSelection(CurRow, 6, CurRow, 6);
          FormatFixed;

          TextRC[CurRow + 1, 6] := '(' +
            IntToStr(Days1st5) + ' + '  + IntToStr(DaysFund) + ')';

          NumberRC[CurRow, 7] := QryVBln.FieldByName('ProcOpl').AsFloat;
          SetSelection(CurRow, 7, CurRow, 7);
          FontSize := 8;
          FontItalic := true;

          if Days1st5 + DaysFund <> 0 then begin
            NumberRC[CurRow + 1, 7] := TNumUtils.RoundToKopeck(
              (Sum1st5 + SumFund) / (Days1st5 + DaysFund));
            SetSelection(CurRow, 7, CurRow + 1, 7);
            FormatFixed2;
          end;
        end;

        NumberRC[CurRow, 8] := Sum1st5 + SumFund;
        SetSelection(CurRow, 8, CurRow, 8);
        FormatFixed2;

        NumberRC[CurRow, 9] := Sum1st5;
        NumberRC[CurRow, 10] := SumFund;
        SetSelection(CurRow, 9, CurRow, 10);
        FormatFixed2;

        TextRC[CurRow, 11] := QryVBln.FieldByName('VidN').AsString;
        SetSelection(CurRow, 1, CurRow + 1, MaxColNum);
        SetBorder(1, 1, 1, 1, 0, 0, clBlack, clBlack, clBlack, clBlack, clBlack);

        // Номер заявки
        if not QryVBln.FieldByName('NrZ').IsNull then begin
          NumberRC[CurRow, 12] :=  QryVBln.FieldByName('NrZ').AsInteger;
          SetSelection(CurRow, 12, CurRow, 12);
          SetAlignment(F1HAlignCenter, false, F1VAlignBottom, 0);
        end;

        // Дата заявки
        if not QryVBln.FieldByName('DtZ').IsNull then
          TextRC[CurRow, 13] := DateToStr(QryVBln.FieldByName('DtZ').AsDateTime);

        if FieldByName('Supplmnt').AsBoolean then begin
          SetSelection(CurRow, 1, CurRow, MaxColNum);
          FontItalic := true;
        end;

        if ShouldPrintPosInfo then begin
          TextRC[CurRow, 14] := QryPos.FieldByName('NameOk').AsString;
          SetColWidthAuto(CurRow, 14, CurRow, 14, false);
        end;

        Inc(CurRow);
        // Т.к. заняли 2 строки
        Inc(CurPageLine, 2);

        Next;
      end;
    end;

    if HandFix then begin
      TextRC[StartRow, 5] := 'Корекція';
      for I := StartRow + 1 to CurRow do
        TextRC[I, 5] := ' ';
      SetSelection(StartRow, 5, CurRow, 6);
      SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
      FontBold := true;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TBlnRegistry.ShouldPrintPosInfo: Boolean;
begin
  Result := ForPlanDept
    and ((QryVBln.FieldByName('TabN').AsInteger <> CurTabN)
      or (QryPos.FieldByName('KdOk').AsInteger <> CurPosId));

  if Result then begin
    CurTabN := QryVBln.FieldByName('TabN').AsInteger;
    CurPosId := QryPos.FieldByName('KdOk').AsInteger; 
  end;
end;

//------------------------------------------------------------------------------
// Завершение страницы.
//------------------------------------------------------------------------------
procedure TBlnRegistry.CompletePage;
begin
  if (PageTotals.Sum1st5 <> 0) or (PageTotals.SumFund <> 0) then begin
    with Book do begin
      Inc(CurRow);

      TextRC[CurRow, 3] := 'Всього по листу';
      SetSelection(CurRow, 3, CurRow, 6);
      SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

      NumberRC[CurRow, 8] := PageTotals.Sum1st5 + PageTotals.SumFund;
      NumberRC[CurRow, 9] := PageTotals.Sum1st5;
      NumberRC[CurRow, 10] := PageTotals.SumFund;

      SetSelection(CurRow, 8, CurRow, 10);
      FormatFixed2;
      SetColWidthAuto(CurRow, 8, CurRow, 10, false);

      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1, 1, 1, 1, 0, 0, clBlack, clBlack, clBlack, clBlack, clBlack);

//      Inc(CurRow);
//      AddRowPageBreak(CurRow);

      RepTotals.Days1st5 := RepTotals.Days1st5 + PageTotals.Days1st5;
      RepTotals.DaysFund := RepTotals.DaysFund + PageTotals.DaysFund;

      RepTotals.Sum1st5 := RepTotals.Sum1st5 + PageTotals.Sum1st5;
      RepTotals.SumFund := RepTotals.SumFund + PageTotals.SumFund;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Печать итогов по отчёту.
//------------------------------------------------------------------------------
procedure TBlnRegistry.PrintReportTotals;
var
  PayType: ShortString;
  DummyString: string;
begin
  if Npp > 0 then
    with Book do begin
      Inc(CurRow);

      TextRC[CurRow, 1] := 'Всего л./лист, шт ' + IntToStr(Npp);
      SetSelection(CurRow, 1, CurRow, 4);
      SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

      NumberRC[CurRow, 6] := RepTotals.Days1st5 + RepTotals.DaysFund;
      SetSelection(CurRow, 6, CurRow, 6);
      FormatFixed;

      NumberRC[CurRow, 8] := RepTotals.Sum1st5 + RepTotals.SumFund;
      NumberRC[CurRow, 9] := RepTotals.Sum1st5;
      NumberRC[CurRow, 10] := RepTotals.SumFund;
      SetSelection(CurRow, 8, CurRow, 10);
      FormatFixed2;
      SetColWidthAuto(CurRow, 8, CurRow, 10, false);

      TextRC[CurRow + 2, 6] := '(' + IntToStr(RepTotals.Days1st5) +
        ' + ' + IntToStr(RepTotals.DaysFund) + ')';

      with CdsRes do
        if RecordCount > 0 then begin
          Inc(CurRow, 2);
          TextRC[CurRow, 1] := 'Складові по видам нарахування:';

          First;
          while not Eof do begin
            PayType := FieldByName('VidN').AsString;

            Inc(CurRow);
            TextRC[CurRow, 3] := PayType +
              ' - ' + DmMain.VidN2ShVidN(PayType, DummyString);

            TextRC[CurRow, 6] := '(' +
              IntToStr(FieldByName('Days1st5').AsInteger) + ' + ' +
              IntToStr(FieldByName('DaysFund').AsInteger)  + ')';

            NumberRC[CurRow, 8] := FieldByName('Sum1st5').AsFloat +
              FieldByName('SumFund').AsFloat;
            NumberRC[CurRow, 9] := FieldByName('Sum1st5').AsFloat;
            NumberRC[CurRow, 10] := FieldByName('SumFund').AsFloat;
            SetSelection(CurRow, 8, CurRow, 10);
            FormatFixed2;
            SetColWidthAuto(CurRow, 8, CurRow, 10, false);

            Next;
          end; {while}
        end; {if}
    end; {with}
end; {PrintReportTotals}

//------------------------------------------------------------------------------
procedure TBlnRegistry.InitReport; 
begin
  inherited InitReport;

  MaxColNum := 13;

  if ForPlanDept then
    Inc(MaxColNum);
end;

//------------------------------------------------------------------------------
procedure TBlnRegistry.InitBook;
begin
  inherited InitBook;

  with Book do begin
    ShowGridLines    := false;
    PrintLandscape   := true;

    ColWidth[1]  := Round( 4 * ColUnit);  // nPp
    ColWidth[2]  := Round( 9 * ColUnit);  // TabN & NrList
    ColWidth[3]  := Round(11 * ColUnit);  // ИНН
    ColWidth[4]  := Round(21 * ColUnit);  // FamIO
    ColWidth[5]  := Round(10 * ColUnit);  // DtBeg & DtEnd
    ColWidth[6]  := Round( 8 * ColUnit);  // CntDays
    ColWidth[7]  := Round( 8 * ColUnit);  // SmSrDn & ProcOpl
    ColWidth[8]  := Round(10 * ColUnit);  // НачислВсего
    ColWidth[9]  := Round(10 * ColUnit);  // в т.ч. из Собств.Ср-в
    ColWidth[10] := Round(10 * ColUnit);  // в т.ч. из СоцСтраха
    ColWidth[11] := Round( 5 * ColUnit);  // ВидНачисления
    ColWidth[12] := Round( 5 * ColUnit);  // № заявки в ФСС
    ColWidth[13] := Round(10 * ColUnit);  // Дата заяки в ФСС

    if ForPlanDept then
      ColWidth[14] := Round(20 * ColUnit);  // Должность
  end;
end;

//------------------------------------------------------------------------------
// Инициализация значений.
//------------------------------------------------------------------------------
class function TBlnRegistry.InitTotals: TRecTotals;
begin
  with Result do begin
    Days1st5 := 0;
    DaysFund := 0;

    Sum1st5 := 0;
    SumFund := 0;
  end;
end;

end.
