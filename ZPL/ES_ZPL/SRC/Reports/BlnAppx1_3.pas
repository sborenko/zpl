unit BlnAppx1_3;

interface

uses
  DBTables, F6Report;

type
  TBlnAppx3Res = record
    Days: integer;
    Sum: double;
  end;

  TRptBlnAppx3 = class(TF6Report)
  private
    DtProc: TDateTime;
    ReqNum: Integer;
    QryBln: TQuery;

    QryOtkl: TQuery;

    NPP: Integer;
    Totals: TBlnAppx3Res;

    procedure ProcessOtkl(Sovm: ShortString);

  protected
    procedure InitReport; override;
    procedure InitBook; override;

    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;

  public
    class function Run(
      DtProc: TDateTime; NrZ: integer; QryBln: TQuery): TBlnAppx3Res;
  end;

implementation

uses
  Forms, Graphics, SysUtils, TTF160_TLB, a_Const, a_Lib, z_DM, z_FssTvp,
  PrintUtils, QryLib;

//--------------------------------------------------------------------------------------------------
class function TRptBlnAppx3.Run(
  DtProc: TDateTime;
  NrZ: integer;
  QryBln: TQuery
): TBlnAppx3Res;
var
  Report: TRptBlnAppx3;
begin
  Report := TRptBlnAppx3.Create;

  Report.DtProc := DtProc;
  Report.ReqNum := NrZ;
  Report.QryBln := QryBln;

  QryBln.DisableControls;

  with Report do begin
    QryOtkl := TQuery.Create(nil);

    Print;
    Preview;

    Result := Totals;

    QryOtkl.Free;
    Free;
  end;

  QryBln.EnableControls;
end;

//--------------------------------------------------------------------------------------------------
procedure TRptBlnAppx3.InitReport;
begin
  inherited InitReport;

  MaxColNum := 15;
end;

//--------------------------------------------------------------------------------------------------
procedure TRptBlnAppx3.InitBook;
begin
  inherited InitBook;

  with Book do begin
    DefaultFontSize := 9;

    ColWidth[1]  := Round( 4 * ColUnit);
    ColWidth[2]  := Round(13 * ColUnit);
    ColWidth[3]  := Round(13 * ColUnit);
    ColWidth[4]  := Round(15 * ColUnit);
    ColWidth[5]  := Round(12 * ColUnit);
    ColWidth[6]  := Round(10 * ColUnit);
    ColWidth[7]  := Round( 9 * ColUnit);
    ColWidth[8]  := Round(10 * ColUnit);
    ColWidth[9]  := Round( 8 * ColUnit);
    ColWidth[10] := Round(20 * ColUnit);
    ColWidth[11] := Round(10 * ColUnit);
    ColWidth[12] := Round( 9 * ColUnit);
    ColWidth[13] := Round( 9 * ColUnit);
    ColWidth[14] := Round( 5 * ColUnit);
    ColWidth[15] := Round(10 * ColUnit);
  end;
end;

//--------------------------------------------------------------------------------------------------
procedure TRptBlnAppx3.PrintHeader;
var
  CellFormat: IF1CellFormat;
  ColNum: Integer;
begin
  with Book do begin
    TextRC[CurRow, 2] := 'ІII. Допомога по тимчасовій непрацездатності ' +
      'внаслідок нещасного випадку або професійного захворювання';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    CellFormat := CreateNewCellFormat;
    CellFormat.MergeCells := true;
    CellFormat.WordWrap   := true;

    Inc(CurRow);
    RowHeight[CurRow] := Round(5 * ColUnit);
    RowHeight[CurRow + 1] := Round(9 * ColUnit);

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
    TextRC[CurRow, ColNum] := 'Власне ім''я';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'По батькові(за наявності)';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := '№ страхового свідоцтва (реєстраціонний номер ' +
      'облікової картки платника податків) або серія (за наявності) та ' +
      'номер паспорта громадянина України)';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow + 1, ColNum);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Основне місце роботи-1;сумісництво-2;' +
      'фіз.особа-підпр.-3;за цивільн-прав.догов.-4';

    Inc(ColNum);
    SetSelection(CurRow, ColNum, CurRow, ColNum + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Дані акту про нещасний випадок або професійне ' +
      'захворювання';
    TextRC[CurRow + 1, ColNum]   := 'дата';
    TextRC[CurRow + 1, ColNum + 1] := 'номер';

    Inc(ColNum, 2);
    SetSelection(CurRow, ColNum, CurRow, ColNum + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum] := 'Дані листка непрцездатності';
    TextRC[CurRow + 1, ColNum]   := 'серія *';
    TextRC[CurRow + 1, ColNum + 1] := 'номер';

    Inc(ColNum, 2);
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
    SetSelection(CurRow, ColNum, CurRow, ColNum + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, ColNum]     := 'Страхова виплата';
    TextRC[CurRow + 1, ColNum]   := 'дні';
    TextRC[CurRow + 1, ColNum + 1] := 'сума в гривнях з копійками';

    Inc(CurRow, 2);
    TextRC[CurRow, 1] := '1';
    TextRC[CurRow, 2] := '2';
    TextRC[CurRow, 3] := '3';
    TextRC[CurRow, 4] := '4';
    TextRC[CurRow, 5] := '5';
    TextRC[CurRow, 6] := '6';
    TextRC[CurRow, 7] := '7';
    TextRC[CurRow, 8] := '8';
    TextRC[CurRow, 9] := '9';
    TextRC[CurRow,10] := '10';
    TextRC[CurRow,11] := '11';
    TextRC[CurRow,12] := '12';
    TextRC[CurRow,13] := '13';
    TextRC[CurRow,14] := '14';
    TextRC[CurRow,15] := '15';

    SetSelection(CurRow-2, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//--------------------------------------------------------------------------------------------------
procedure TRptBlnAppx3.PrintBody;
begin
  with QryBln do begin
    if ReqNum = -1 then
      First // Печать общего протокола, независимо от номера заявки
    else
      // Печать протокола для заданного номера заявки.
      // Выполнение First обеспечивает вызывающая процедура
      ;

    while not Eof
      and ((FieldByName('NrZ').AsInteger = ReqNum) or (ReqNum = -1)) do
    begin
      ProcessOtkl(''); // Основные
      ProcessOtkl('Y'); // Совместительские

      Next;
    end;
  end;
end;

//--------------------------------------------------------------------------------------------------
procedure TRptBlnAppx3.PrintFooter;
var
  Msg: ShortString;
begin
  with Book do begin
    Inc(CurRow);
    TextRC[CurRow, 1] := 'ВСЬОГО: ';
    SetSelection(CurRow, 1, CurRow, MaxColNum - 2);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    NumberRC[CurRow, 14] := Totals.Days;
    NumberRC[CurRow, 15] := Totals.Sum;
    SetSelection(CurRow, 15, CurRow, 15);
    FormatFixed2;

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow, 2);
    Msg := '* Не застосовується для листка непрацездатності сформованого/' +
      'виданого в Електронному реєстрі листків непрацездатності.';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := '** Причина непроцездатності відобажаєтьс за даними листка ' +
      'непроцездатності:';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := 'виданого на паперовому носії: ' +
      '2 - професійне захворювання та його наслідки; ' +
      '4 - нещасний випадок на виробництві та його наслідки';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := 'сформованого/виданого в Електронному реєстрі листків ' +
      'непрацездатності: ' +
      '11 - тимчасова непрецездатність внаслідок нещасного випадоку на ' +
        'виробництві; ';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := '12 - тимчасова непрецездатність внаслідок професійного ' +
      'захворювання';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow, 4);
    TextRC[CurRow, 2]  := 'Кериівник/уповноважена особа ';
    TextRC[CurRow, 6]  := 'підпис';
    TextRC[CurRow, 10] := 'Власне ім''я ПРІЗВИЩЕ';
  end;
end;

//--------------------------------------------------------------------------------------------------
procedure TRptBlnAppx3.ProcessOtkl(Sovm: ShortString);
var
  Fam, Ima, Otch, INN, SerList, NrList, ActNum: ShortString;
  ZO: SmallInt;
  SpecNR: integer;
  DtBeg, DtEnd, ActDt : TDateTime;
  PrBln: Integer;

  CntWorkDays, CntWorkChas: Double;
  Days, DaysFnd: SmallInt;
  Smm, SmmFnd: Double;

  cDtBeg, cDtEnd: ShortString;
begin
  with QryBln do begin
    Fam  := FieldByName('Fam').AsString;
    Ima  := FieldByName('Ima').AsString;
    Otch := FieldByName('Otch').AsString;
    INN  := FieldByName('ID').AsString;

    ZO := FieldByName('Sovm').AsInteger;
    case ZO of
      0: ZO := 1;
      1: ZO := 2;
      3: ZO := 4;
    end;

    ActDt := FieldByName('Act_Dt').AsDateTime;
    ActNum  := FieldByName('Act_Num').AsString;

    NrList  := FieldByName('NrList').AsString;
    SerList := FieldByName('SerList').AsString;

    DtBeg  := FieldByName('DtBeg').AsDateTime;
    DtEnd  := FieldByName('DtEnd').AsDateTime;

    PrBln  := FieldByName('Prichina').AsInteger;
    SpecNR := FieldByName('Spec_NR').AsInteger;

    DaysFnd := 0;
    SmmFnd  := 0;

    // Собираем итоги по отклонениям
    TFormFssTvp.OpenQryOtkl(QryOtkl, SpecNr, Sovm);

    with QryOtkl do
    while not Eof do begin
      DmMain.GetCntWrkDaysBln(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime, CntWorkDays, CntWorkChas, 'blk');

      Days := Round(CntWorkDays);
      Smm := FieldByName('Summa').AsFloat;

      // по травмам и проф.заболев. за счёт пенс. фонда идут дни и суммы
      // по виду 2605, а засчёт предприятия - по виду 2606
      if FieldByName('VidN').AsString <> '2606' then
      begin
        DaysFnd := DaysFnd + Days;
        SmmFnd := SmmFnd + Smm;
      end;

      Next;
    end;

    ReleaseQuery(QryOtkl);

    // Печатаем итоги
    if (Abs(SmmFnd) >= 0.001) and (DaysFnd <> 0) then begin
      Inc(CurRow);
      Inc(NPP);

      with Book do begin
        NumberRC[CurRow, 1] := NPP;
        SetSelection(CurRow, 1, CurRow, 1);
        SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);

        TextRC[CurRow, 2] := Fam;
        TextRC[CurRow, 3] := Ima;
        TextRC[CurRow, 4] := Otch;
        TextRC[CurRow, 5] := INN;

        if Sovm = '' then
          // основные деньги
          TextRC[CurRow, 6] := IntToStr(ZO)
        else
          // совместительские деньги
          TextRC[CurRow, 6] := IntToStr(2);

        SetSelection(CurRow, 6, CurRow, 6);
        SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0);

        if ActDt <> 0 then begin
          cDtBeg := DateToStr(ActDt);
          TextRC[CurRow, 7] := Copy(cDtBeg, 1, 2) + '.' +
            Copy(cDtBeg, 4, 2) + '.' + Copy(cDtBeg, 7, 4);
        end;
        TextRC[CurRow, 8] := ActNum;

        TextRC[CurRow, 9] := SerList;
        TextRC[CurRow, 10] := NrList;

        NumberRC[CurRow, 11] := PrBln;
        SetSelection(CurRow, 11, CurRow, 11);
        SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);

        cDtBeg := DateToStr(DtBeg);
        TextRC[CurRow, 12] := Copy(cDtBeg, 1, 2) + '.' +
          Copy(cDtBeg, 4, 2) + '.' + Copy(cDtBeg, 7, 4);

        cDtEnd := DateToStr(DtEnd);
        TextRC[CurRow, 13] := Copy(cDtEnd, 1, 2) + '.' +
          Copy(cDtEnd, 4, 2) + '.' + Copy(cDtEnd, 7, 4);

        if DaysFnd <> 0 then
          NumberRC[CurRow, 14] := DaysFnd;

        if SmmFnd <> 0 then
          NumberRC[CurRow, 15] := SmmFnd;
        SetSelection(CurRow, 15, CurRow, 15);
        FormatFixed2;

        SetSelection(CurRow, 1, CurRow, MaxColNum);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      end;

      Totals.Days := Totals.Days + DaysFnd;
      Totals.Sum  := Totals.Sum + SmmFnd;
    end;
  end;
end;

end.
