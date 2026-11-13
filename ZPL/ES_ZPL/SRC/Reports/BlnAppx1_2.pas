unit BlnAppx1_2;

interface

uses
  DbTables, F6Report;

type
  TBlnAppx2Res = record
    DaysCmn: Integer;
    SumCmn: Double;
    DaysPregn: Integer;
    SumPregn: Double;
  end;

  TPrtBlnAppx2 = class(TF6Report)
  private
    DtProc: TDateTime;
    ReqNum: integer;
    QryVBln: TQuery;

    QryNU: TQuery;
    Totals: TBlnAppx2Res;

    NPP: Integer;
    SmTtsFnd: Double;

    procedure ProcessOtkl(Sovm: ShortString);

  protected
    procedure InitReport; override;
    procedure InitBook; override;

    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;

  public
    class function Run(
      DtProc: TDateTime; QryVBln: TQuery; ReqNum: integer): TBlnAppx2Res;
  end;


implementation

uses
  SysUtils, Graphics, Math, TTF160_TLB, a_Const, a_Lib, z_Dm, QryLib;

//------------------------------------------------------------------------------
class function TPrtBlnAppx2.Run(
  DtProc: TDateTime;
  QryVBln: TQuery;
  ReqNum: integer
): TBlnAppx2Res;
var
  Report: TPrtBlnAppx2;
begin
  Report := TPrtBlnAppx2.Create;
  Report.DtProc := DtProc;
  Report.ReqNum := ReqNum;
  Report.QryVBln := QryVBln;

  with Report do begin
    QryNU := TQuery.Create(nil);

    Print;
    Preview;
    Result := Totals;

    QryNU.Free;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx2.InitReport;
begin
  inherited InitReport;

  MaxColNum := 18; // + 2; Дополнительные два для Оксаны
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx2.InitBook;
begin
  inherited InitBook;

  with Book do begin
    DefaultFontSize := 9;
    
    ColWidth[ 1] := Round( 4 * ColUnit);
    ColWidth[ 2] := Round(23 * ColUnit);
    ColWidth[ 3] := Round(12 * ColUnit);
    ColWidth[ 4] := Round(15 * ColUnit);
    ColWidth[ 5] := Round(11 * ColUnit);
    ColWidth[ 6] := Round( 6 * ColUnit);
    ColWidth[ 7] := Round( 8 * ColUnit);
    ColWidth[ 8] := Round( 9 * ColUnit);
    ColWidth[ 9] := Round( 6 * ColUnit);
    ColWidth[10] := Round( 6 * ColUnit);
    ColWidth[11] := Round(10 * ColUnit);
    ColWidth[12] := Round(10 * ColUnit);
    ColWidth[13] := Round( 7 * ColUnit);
    ColWidth[14] := Round(12 * ColUnit);
    ColWidth[15] := Round( 7 * ColUnit);
    ColWidth[16] := Round(12 * ColUnit);
    ColWidth[17] := Round(12 * ColUnit);
    ColWidth[18] := Round( 7 * ColUnit);
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx2.PrintHeader;
var
  CellFormat: IF1CellFormat;
  ColNum: Integer;
begin
  with Book do begin
    CellFormat := CreateNewCellFormat;
    CellFormat.MergeCells := true;
    CellFormat.WordWrap   := true;

    TextRC[CurRow, 1] := 'II. Допомога по вагітності та пологах"';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

    Inc(CurRow);
    RowHeight[CurRow] := Round(4 * ColUnit);
    RowHeight[CurRow + 1] := Round(11 * ColUnit);

    ColNum := 1;
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := '№ з/п';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Прізвище';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Власне iм''я';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'По батькові (за наявності)';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Реєстраціонний номер облікової картки платника ' +
      'податків або серія (за наявності) та номер паспорта громадянина ' +
      'України';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Основ.місце роботи-1;сумісництво-2;' +
      'фіз.особа-підпр.-3;за цивільн-прав.догов.-4';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow, ColNum + 2);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Дані листка непрцездатності';
    TextRC[CurRow + 1, ColNum]   := 'серія *';
    TextRC[CurRow + 1, ColNum + 1] := 'номер';
    TextRC[CurRow + 1, ColNum + 2] := 'первинний(1), продовження(2)';

    Inc(ColNum, 3);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Причина непрацездатності **';
    SetSelection(CurRow, ColNum, CurRow, ColNum);
    FontSize := 8;

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow, ColNum + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Період непрацездатності';
    TextRC[CurRow + 1, ColNum] := 'з (дата)';
    TextRC[CurRow + 1, ColNum + 1] := 'по (дата)';

    Inc(ColNum, 2);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Кількість днів, що підлягають оплаті ' +
      '(всього за рахунок коштів Пенсійного фонду України)';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Сума (в гривнях з копійками) ' +
      '(всього за рахунок коштів Пенсійного фонду України)';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow, ColNum + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'У тому числі посраждалим на ЧАЕС';
    TextRC[CurRow + 1, ColNum] := 'дні';
    TextRC[CurRow + 1, ColNum + 1] := 'сума (в гривнях з копійками)';

    Inc(ColNum, 2);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Номер посвічення ЧАЕС';
    SetSelection(CurRow, ColNum, CurRow, ColNum);
    FontSize := 8;

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] :=
      'Страховий стаж (у повних місяцях) за останні 12 місяців';

    SetSelection(CurRow, 1, CurRow + 1, MaxColNum);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow, 2);
    TextRC[CurRow,  1] := '1';
    TextRC[CurRow,  2] := '2';
    TextRC[CurRow,  3] := '3';
    TextRC[CurRow,  4] := '4';
    TextRC[CurRow,  5] := '5';
    TextRC[CurRow,  6] := '6';
    TextRC[CurRow,  7] := '7';
    TextRC[CurRow,  8] := '8';
    TextRC[CurRow,  9] := '9';
    TextRC[CurRow, 10] := '10';
    TextRC[CurRow, 11] := '11';
    TextRC[CurRow, 12] := '12';
    TextRC[CurRow, 13] := '13';
    TextRC[CurRow, 14] := '14';
    TextRC[CurRow, 15] := '15';
    TextRC[CurRow, 16] := '16';
    TextRC[CurRow, 17] := '17';
    TextRC[CurRow, 18] := '18';

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx2.PrintBody;
var
  Msg: ShortString;
begin
  with Book do begin
    NPP := 0;
    SmTtsFnd := 0;

    with QryVBln do begin
      if ReqNum = -1 then
        First // Печать общего протокола, независимо от номера заявки
      else
        // Печать протокола для заданного номера заявки.
        // Выполнение First обеспечивает вызывающая процедура
        ;

      while not Eof and ((FieldByName('NrZ').AsInteger = ReqNum) or (ReqNum = -1)) do begin
        // Основные
        ProcessOtkl('');
        // Совместительские
        ProcessOtkl('Y');

        Next;
      end;

      Inc(CurRow);
      TextRC[CurRow, 1] := 'ВСЬОГО: ';
      SetSelection(CurRow, 1, CurRow, 9);
      SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);

      NumberRC[CurRow,14] := SmTtsFnd;
      SetSelection(CurRow, 14, CurRow, 14);
      FormatFixed2;

      SetSelection(CurRow, 1, CurRow, MaxColNum);
      FontBold := true;
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      Inc(CurRow);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx2.PrintFooter;
var
  Msg: ShortString;
begin
  with Book do begin
    Inc(CurRow, 2);
    Msg := '* Не застосовується для листка непрацездатності сформованого/' +
      'виданого в Електронному реєстрі листків непрацездатності.';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := '** Причина непроцездатності відобажаєтьс за даними листка ' +
      'непроцездатності:';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := 'виданого на паперовому носії: 8 - вагітність та пологи;';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := 'сформованого/виданого в Електронному реєстрі листків ' +
      'непрацездатності: 2 - вагітність та пологи;';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow, 4);
    TextRC[CurRow, 2]  := 'Керівник/уповноважена особа';
    TextRC[CurRow, 6]  := 'підпис';
    TextRC[CurRow, 10] := 'Власне ім''я ПРІЗВИЩЕ';
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx2.ProcessOtkl(Sovm: ShortString);
var
  TabN, SpecNR, SpsId: Integer;
  VidN, Fam, Ima, Otch, INN, SerList, NrList: ShortString;
  DtBeg, DtEnd : TDateTime;
  cDtBeg, cDtEnd: ShortString;
  ZO, PrBln, Cont, Stage12: Integer;
  Digital: Boolean;

  WorkDaysCnt, WorkHoursCnt: Double;
  Days, DaysBln, DaysFnd, DaysChern: SmallInt;
  Smm, SmmBln, SmmFnd, SmmChern: Double;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure OpenQryNU;
  begin
    InitQuery(QryNU);

    with QryNU do begin
      SQL.Add(
        'select VidN, Dt_Beg, Dt_End, Chas, Summa ' +
        'from z_NU ' +
        'where TabN = :TabN ' +
          'and KdSps = :KdSps ' +
          'and DtProc = :DtProc ' +
          'and VidN in ("' + VidN + '") ' +
          'and Dt_Beg >= :DtBeg and Dt_End <= :DtEnd'
      );
      if Sovm = 'Y' then
        SQL.Add(
          'and Sovm = "Y"'
        )
      else
        SQL.Add(
          'and (Sovm = "" or Sovm = "0" or Sovm is NULL)'
        );
      SQL.Add(
        'order by Dt_Beg'
      );
      ParamByName('TabN').AsInteger := TabN;
      ParamByName('KdSps').AsInteger := SpsId;
      ParamByName('DtProc').AsDateTime := DtProc;
      ParamByName('DtBeg').AsDateTime := DtBeg;
      ParamByName('DtEnd').AsDateTime := DtEnd;

      Open;
    end;
  end;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
begin
  with QryVBln, QryUtils do begin
    TabN := FieldByName('TabN').AsInteger;
    Fam  := FieldByName('Fam').AsString;
    Ima  := FieldByName('Ima').AsString;
    Otch := FieldByName('Otch').AsString;
    INN  := FieldByName('ID').AsString;
    SpsId := FieldByName('KdSps').AsInteger;

    VidN := FieldByName('VidN').AsString;

    ZO := FieldByName('Sovm').AsInteger;
    case ZO of
      0: ZO := 1;
      1: ZO := 2;
      3: ZO := 4;
    end;

    NrList  := FieldByName('NrList').AsString;
    SerList := FieldByName('SerList').AsString;

    DtBeg := FieldByName('DtBeg').AsDateTime;
    DtEnd := FieldByName('DtEnd').AsDateTime;

    Stage12  := FieldByName('Stg12').AsInteger;

    if FieldByName('ListCont').IsNull then
      Cont := 1
    else
      Cont := FieldByName('ListCont').AsInteger + 1;

    Digital := FieldByName('Digital').AsString = 'Y';
    PrBln   := FieldByName('Prichina').AsInteger;
    SpecNR  := FieldByName('Spec_NR').AsInteger;

    DaysBln   := 0;
    DaysFnd   := 0;
    DaysChern := 0;

    SmmBln   := 0;
    SmmFnd   := 0;
    SmmChern := 0;

    OpenQryNU;

    with QryNU do
    while not Eof do begin
      DmMain.GetCntWrkDaysBln(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime,
        WorkDaysCnt, WorkHoursCnt, 'blk');

      Days := Round(WorkDaysCnt);
      // Issue 221012 <<<
      if FieldByName('Summa').AsFloat < 0 then
        Days := -Abs(Days);
      // Issue 221012 >>>

      Smm := FieldByName('Summa').AsFloat;

      DaysBln := DaysBln + Days;
      SmmBln := SmmBln + Smm;

      DaysFnd := DaysFnd + Days;
      SmmFnd := SmmFnd + Smm;

      Totals.DaysCmn   := Totals.DaysCmn + Days;
      Totals.SumCmn    := Totals.SumCmn + Smm;
      Totals.DaysPregn := Totals.DaysPregn + Days;
      Totals.SumPregn  := Totals.SumPregn + Smm;

      Next;
    end;

    ReleaseQuery(QryNU);

    if Abs(SmmBln) >= 0.001 then begin
      Inc(CurRow);
      Inc(NPP);

      with Book do begin
        NumberRC[CurRow, 1] := NPP;
        TextRC[CurRow, 2] := Fam;
        TextRC[CurRow, 3] := Ima;
        TextRC[CurRow, 4] := Otch;
        TextRC[CurRow, 5] := INN;

        if Sovm = '' then
          TextRC[CurRow, 6] := IntToStr(ZO)
        else
          // совместительские деньги
          TextRC[CurRow, 6] := IntToStr(2);

        TextRC[CurRow, 7] := SerList;
        TextRC[CurRow, 8] := NrList;
        TextRC[CurRow, 9] := IntToStr(Cont);

        SetSelection(CurRow, 2, CurRow, 4);
        SetAlignment(F1HAlignLeft, false, F1VAlignBottom, 0);
        SetSelection(CurRow, 6, CurRow, 6);
        SetAlignment(F1HAlignCenter, false, F1VAlignBottom, 0);
        SetSelection(CurRow, 9, CurRow, 10);
        SetAlignment(F1HAlignCenter, false, F1VAlignBottom, 0);

        NumberRC[CurRow, 10] := PrBln;

        cDtBeg := DateToStr(DtBeg);
        TextRC[CurRow, 11] := Copy(cDtBeg, 1, 2) + '.' +
          Copy(cDtBeg, 4, 2) + '.' + Copy(cDtBeg, 7, 4);

        cDtEnd := DateToStr(DtEnd);
        TextRC[CurRow, 12] := Copy(cDtEnd, 1, 2) + '.' +
          Copy(cDtEnd, 4, 2) + '.' + Copy(cDtEnd, 7, 4);

        if DaysFnd <> 0 then
          NumberRC[CurRow, 13] := DaysFnd;

        if SmmFnd <> 0 then
          NumberRC[CurRow, 14] := SmmFnd;

        SetSelection(CurRow, 14, CurRow, 14);
        FormatFixed2;

        // Чернобыльские
        if DaysChern <> 0 then
          NumberRC[CurRow, 15] := DaysChern;
        if SmmChern <> 0 then
          NumberRC[CurRow, 16] := SmmChern;

        NumberRC[CurRow, 18] := Stage12;

        SetSelection(CurRow, 1, CurRow, MaxColNum);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      end;

      SmTtsFnd := SmTtsFnd + SmmFnd;
    end;
  end;
end;

end.
