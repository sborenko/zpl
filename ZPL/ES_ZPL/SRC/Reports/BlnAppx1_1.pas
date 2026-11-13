unit BlnAppx1_1;

interface

uses
  DbTables, F6Report;

type
  TBlnAppx1Res = record
    DaysSick: Integer;
    SumSick: Double;
    DaysPregn: Integer;
    SumPregn: Double;
  end;

  TPrtBlnAppx1 = class(TF6Report)
  private
    DtProc: TDateTime;
    ReqNum: integer;
    QryVBln: TQuery;

    NPP: Integer;
    SmTtsCmn, SmTtsFnd: Double;
    Totals: TBlnAppx1Res;

    procedure ProcessOtkl(Sovm: ShortString);

  protected
    procedure InitReport; override;
    procedure InitBook; override;

    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;
  public
    class function Run(
      DtProc: TDateTime; QryVBln: TQuery; ReqNum: integer): TBlnAppx1Res;
  end;


implementation

uses
  SysUtils, Graphics, Math, TTF160_TLB,
  a_Const, a_Lib, z_Dm, PrintUtils, QryLib;

const
  PAPER_SICK_REASON_CHERN = 3;

//------------------------------------------------------------------------------
class function TPrtBlnAppx1.Run(
  DtProc: TDateTime; QryVBln: TQuery; ReqNum: integer): TBlnAppx1Res;
var
  Report: TPrtBlnAppx1;
begin
  Report := TPrtBlnAppx1.Create;

  Report.DtProc := DtProc;
  Report.ReqNum := ReqNum;
  Report.QryVBln := QryVBln;

  QryVBln.DisableControls;

  with Report do begin
    Print;
    Preview;

    Result := Totals;
    Free;
  end;

  QryVBln.EnableControls;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx1.InitReport;
begin
  inherited InitReport;

  MaxColNum := 22;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx1.InitBook;
begin
  inherited InitBook;

  with Book do begin
    ColWidth[1]  := Round( 4 * ColUnit);
    ColWidth[2]  := Round(23 * ColUnit);
    ColWidth[3]  := Round(12 * ColUnit);
    ColWidth[4]  := Round(15 * ColUnit);
    ColWidth[5]  := Round(11 * ColUnit);
    ColWidth[6]  := Round(6  * ColUnit);
    ColWidth[7]  := Round(8  * ColUnit);
    ColWidth[8]  := Round(9  * ColUnit);
    ColWidth[9]  := Round(6  * ColUnit);
    ColWidth[10] := Round(6  * ColUnit);
    ColWidth[11] := Round(10 * ColUnit);
    ColWidth[12] := Round(10 * ColUnit);
    ColWidth[13] := Round(7  * ColUnit);
    ColWidth[14] := Round(7  * ColUnit);
    ColWidth[15] := Round(12 * ColUnit);
    ColWidth[16] := Round(12 * ColUnit);
    ColWidth[21] := Round(7  * ColUnit);
    ColWidth[22] := Round(7  * ColUnit);
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx1.PrintHeader;
var
  CellFormat: IF1CellFormat;
  CurCol: Integer;
begin
  with Book do begin
    TextRC[CurRow, 1] := 'І. Допомога по тимчасовій непрацездатності';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
    Inc(CurRow);

    Inc(CurRow);
    RowHeight[CurRow] := Round(4 * ColUnit);
    RowHeight[CurRow + 1] := Round(11 * ColUnit);

    CellFormat := CreateNewCellFormat;
    CellFormat.MergeCells := true;
    CellFormat.WordWrap   := true;

    CurCol := 1;
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := '№ з/п';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Прізвище';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Власне ім''я';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'По батькові (за наявності)';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Реєстраційний номер облікової картки платника ' +
      'податків або серія (за наявності) та номер паспорта громадянина ' +
      'України';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Основ.місце роботи-1;сумісництво-2;' +
      'фіз.особа-підпр.-3;за цивільн-прав.догов.-4';

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow, CurCol + 2);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Дані листка непрцездатності';
    TextRC[CurRow + 1, CurCol]  := 'серія *';
    TextRC[CurRow + 1, CurCol + 1] := 'номер';
    TextRC[CurRow + 1, CurCol + 2] := 'первинний(1), продовження(2)';

    Inc(CurCol, 3);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Причина непрацездатності **';
    SetSelection(CurRow, CurCol, CurRow, CurCol);
    FontSize := 8;

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow, CurCol + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Період непрацездатності';
    TextRC[CurRow + 1, CurCol] := 'з (дата)';
    TextRC[CurRow + 1, CurCol + 1] := 'по (дата)';

    Inc(CurCol, 2);
    SetSelection(CurRow, CurCol, CurRow, CurCol + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Кількість днів, що підлягають оплаті';
    TextRC[CurRow + 1, CurCol] := 'Всього';
    TextRC[CurRow + 1, CurCol + 1] := 'у т.ч. за рахунок коштів Пенсійного ' +
      'фонду України';

    Inc(CurCol, 2);
    SetSelection(CurRow, CurCol, CurRow, CurCol + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Сума (в гривнях з копійками)';
    TextRC[CurRow + 1, CurCol] := 'всього';
    TextRC[CurRow + 1, CurCol + 1] := 'у т.ч. за рахунок коштів Пенсійного ' +
      'фонду України';

    Inc(CurCol, 2);
    SetSelection(CurRow, CurCol, CurRow, CurCol + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'У тому числі посраждалим на ЧАЕС';
    TextRC[CurRow + 1, CurCol] := 'дні';
    TextRC[CurRow + 1, CurCol + 1] := 'сума (в гривнях з копійками)';

    Inc(CurCol, 2);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Номер посвічення ЧАЕС';
    SetSelection(CurRow, CurCol, CurRow, CurCol);
    FontSize := 8;

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow + 1, CurCol);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol] := 'Дата направлення на МСЕК (за наявності)';
    SetSelection(CurRow, CurCol, CurRow, CurCol);
    FontSize := 8;

    Inc(CurCol);
    SetSelection(CurRow, CurCol, CurRow, CurCol + 1);
    SetCellFormat(CellFormat);
    TextRC[CurRow, CurCol]     := 'Страховий стаж (у повних місяцях)';
    TextRC[CurRow + 1, CurCol]   := 'загальний';
    TextRC[CurRow + 1, CurCol + 1] := 'за останні 12 місяців';

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
    TextRC[CurRow, 19] := '19';
    TextRC[CurRow, 20] := '20';
    TextRC[CurRow, 21] := '21';
    TextRC[CurRow, 22] := '22';
    TextRC[CurRow, 23] := '23';
    TextRC[CurRow, 24] := '24';

    SetSelection(CurRow, 1, CurRow, MaxColNum + 2);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx1.PrintBody;
begin
  with Book do begin
    with QryVBln do begin
      if ReqNum = -1 then
        First // Печать общего протокола, независимо от номера заявки
      else
        // Печать протокола для заданного номера заявки.
        // Выполнение First обеспечивает вызывающая процедура
        ;

      while not Eof and (
        (FieldByName('NrZ').AsInteger = ReqNum) or (ReqNum = -1)) do
      begin
        ProcessOtkl(''); // Основные
        ProcessOtkl('Y'); // Совместительские

        Next;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx1.PrintFooter;
var
  Msg: String;
begin
  with Book do begin
    Inc(CurRow);
    TextRC[CurRow, 1] := 'ВСЬОГО: ';
    SetSelection(CurRow, 1, CurRow, 9);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignBottom, 0);
    NumberRC[CurRow, 15] := SmTtsCmn;
    NumberRC[CurRow, 16] := SmTtsFnd;
    SetSelection(CurRow, 15, CurRow, 16);
    FormatFixed2;

    SetSelection(CurRow, 1, CurRow, MaxColNum + 2);
    FontBold := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    Inc(CurRow);

    Inc(CurRow, 2);
    Msg := '* Не застосовується для листка непрацездатності сформованого/' +
      'виданого в Електронному реєстрі листків непрацездатності.';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := '** Причина непроцездатності відобажаєтьс за даними листка '        +
      'непроцездатності:';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := 'виданого на паперовому носії: ' +
      '1 - загальне захворювання; ' +
      '3 - захворювання внаслідок аварії на ЧАЄС; ' +
      '5 - невиробничі травми; ' +
      '6 - контакт з хворими на інфекційні захворювання та ' +
        'бактеріоносійство; ' +
      '7 - санаторно-курортне лікування; ';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg :=
      '9 - ортопедичне протезування; ' +
      '10 - догляд; ' +
      '11 - ізоляція від COVID-19';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg := 'сформованого/виданого в Електронному реєстрі листків ' +
      'непрацездатності: ' +
      '1 - тимчасова непрацездатність внаслідок захворювання або травми, що ' +
        'не пов''язані з нещасними випадками на виробництві; ' +
      '3 - необідність догляду за хворою дитиною; ';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg :=
      '4 - необідність догляду за дитиною віком до трьох років або ' +
        'дитиною віком до 18 років у разі хвороби матері або іншої особи, ' +
        'яка доглядає за такою дитиною; ' +
      '5 - необідність догляду за хворим членом сім''ї; ';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg :=
      '6 - карантин, встановлений відповідно до законодавства; ' +
      '7 - перебування в самоізоляції, обсервації під час дії карантину, ' +
        'встановленного Кабінетом Міністрів України з метою запобігання ' +
        'поширенню острої респіраторної хвороби COVID-19, спричиненної ';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg :=
        'коронавірусом SARS-CoV-2; ' +
      '8 - тимчасове переведення застрахованої особи відповідно до ' +
        'медичного висновку на легку, нижчеоплачувану роботу; ' +
      '9 - перебування у відділенні санаторно-курортного закладу; ';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow);
    Msg :=
      '10 - протезування з поміщенням у стаціонар протезно-ортопедичного ' +
        'підприємства.';
    TextRC[CurRow, 2] := Msg;

    Inc(CurRow, 4);
    TextRC[CurRow, 2]  := 'Кериівник/уповноважена особа';
    TextRC[CurRow, 6]  := 'підпис';
    TextRC[CurRow, 10] := 'Власне ім''я ПРІЗВИЩЕ';
  end;
end;

//------------------------------------------------------------------------------
procedure TPrtBlnAppx1.ProcessOtkl(
  Sovm: ShortString
);
var
  VidN: ShortString;
  TabN, SpsId: Integer;
  DtBeg, DtEnd: TDateTime;
  Fam, Ima, Otch, INN, SerList, NrList: ShortString;
  nStgCmn, nStg12: SmallInt;

  cDtBeg, cDtEnd: ShortString;
  ZO,
  Contin,
  PrBln: Integer;
  Digital: Boolean;
  Msg: String;
  OutFileName: ShortString;

  nCntWorkDays, nCntWorkChas: double;
  Days, DaysCmn, DaysFund, DaysChern: Integer;
  Smm, SmmCmn, SmmFund, SmmChern: Double;
  Query: TQuery;
begin
  with QryVBln do begin
    TabN := FieldByName('TabN').AsInteger;
    Fam  := FieldByName('Fam').AsString;
    Ima  := FieldByName('Ima').AsString;
    Otch := FieldByName('Otch').AsString;
    INN   := FieldByName('ID').AsString;
    SpsId := FieldByName('KdSps').AsInteger;

    VidN := FieldByName('VidN').AsString;

    ZO := FieldByName('Sovm').AsInteger;
    Case ZO of
      0: ZO := 1;
      1: ZO := 2;
      3: ZO := 4;
    end;

    NrList  := FieldByName('NrList').AsString;
    SerList := FieldByName('SerList').AsString;

    DtBeg  := FieldByName('DtBeg').AsDateTime;
    DtEnd  := FieldByName('DtEnd').AsDateTime;
    nStgCmn := FieldByName('StgCmn').AsInteger;
    nStg12  := FieldByName('Stg12').AsInteger;

    If FieldByName('ListCont').IsNull then
      Contin := 1
    else
      Contin := FieldByName('ListCont').AsInteger + 1;

    PrBln  := FieldByName('Prichina').AsInteger;
    Digital := FieldByName('Digital').AsString = 'Y';
  end;

  DaysCmn  := 0;
  DaysFund  := 0;
  DaysChern := 0;

  SmmCmn  := 0;
  SmmFund  := 0;
  SmmChern := 0;

  Query := TQuery.Create(nil);
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select VidN, Dt_Beg, Dt_End, Chas, Summa ' +
      'from z_NU ' +
      'where TabN = :TabN ' +
        'and KdSps = :KdSps ' +
        'and DtProc = :DtProc ' +
        // основной вид за сч.пенс.фонд. и 5-ти дневка за сч.предпр. 
        'and VidN in ("' + VidN + '", "2603") ' +
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

    while not Eof do begin
      DmMain.GetCntWrkDaysBln(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime,
        nCntWorkDays, nCntWorkChas, 'blk');

      Days := Round(nCntWorkDays);
      // Issue 221012 <<<
      if FieldByName('Summa').AsFloat < 0 then
        Days := -Abs(Days);
      // Issue 221012 >>>

      Smm := FieldByName('Summa').AsFloat;

      DaysCmn := DaysCmn + Days;
      SmmCmn := SmmCmn + Smm;

      // дни за счёт пенс.фонда
      // SB 23.3.2026 По аналогии, наверное, и 2606
      if (FieldByName('VidN').AsString <> '2603')
        and (FieldByName('VidN').AsString <> '2606') then
      begin
        DaysFund := DaysFund + Days;
        SmmFund := SmmFund + Smm;

        Totals.DaysSick := Totals.DaysSick + Days;
        Totals.SumSick := Totals.SumSick + Smm;
      end;

      Next;
    end;
  end;

  QryUtils.ReleaseQuery(Query);
  Query.Free;

  // В бумажных б/л:
  if (PrBln = PAPER_SICK_REASON_CHERN) and not Digital then begin
    // чернобыльские
    DaysChern := Days;
    SmmChern := Smm;
  end;

  if Abs(SmmCmn) >= 0.001 then begin
    Inc(CurRow);
    Inc(NPP);

    with Book do begin
      NumberRC[CurRow, 1] := Npp;
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

      TextRC[CurRow, 7] := SerList;
      TextRC[CurRow, 8] := NrList;
      TextRC[CurRow, 9] := IntToStr(Contin);
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

      NumberRC[CurRow, 13] := DaysCmn;
      if DaysFund <> 0 then
        NumberRC[CurRow, 14] := DaysFund;

      NumberRC[CurRow, 15] := SmmCmn;
      if SmmFund <> 0 then
        NumberRC[CurRow, 16] := SmmFund;

      SetSelection(CurRow, 15, CurRow, 16);
      FormatFixed2;

      // Чернобыльские
      if DaysChern <> 0 then
        NumberRC[CurRow, 17] := DaysChern;
      if SmmChern <> 0 then
        NumberRC[CurRow, 18] := SmmChern;

      NumberRC[CurRow, 21] := nStgCmn;
      NumberRC[CurRow, 22] := nStg12;

      if DaysCmn <> 0 then
        NumberRC[CurRow, 23] := RoundTo(SmmCmn / DaysCmn, -2);
      if DaysFund <> 0 then
        NumberRC[CurRow, 24] := RoundTo(SmmFund / DaysFund, -2);

      SetSelection(CurRow, 23, CurRow, 24);
      FormatFixed2;

      SetSelection(CurRow, 1, CurRow, MaxColNum + 2);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    end;

    SmTtsCmn := SmTtsCmn + SmmCmn;
    SmTtsFnd := SmTtsFnd + SmmFund;
  end;
end;

end.
