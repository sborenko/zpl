unit MemOrdSynth;

interface

uses
  DB, DBTables, TTF160_TLB, z_DMAccMap, DateLib, F6Report;

type
    // VNU:
    // -2   несуществующий. Используем как инициатор печати заголовка
    //      группы VNU
    // -1   для группы больничных (только за сч.СС)
    // 0    вид 1210 СреднДляМобилизованных
    // 1    виды начислений
    // 2    виды удержаний
    // 3    прочие (удалил все)
    // 4    выплаты и долги (коп., ПМ, ТМ)

  TMemOrdSynth = class(TF6Report)
  private
    Final: Boolean;
    CdsSPZ, CdsPrp: TDataSet;
    DtProc: TDateTime;
    PrtCaption: ShortString;
    UseParentAcc: Boolean;

    QryCmn, QryPrpMinZP: TQuery;
    RepDate: TDate;

    RptAccFldNm, RptAcc, ZplAcc: ShortString;

    Dt_2009_04: TDateTime;

    DmAccMap: TDMAccMap;
    MapInfo: TMapInfo;

    CellFormat: IF1CellFormat;

    FirstAcc, NewVNUGrp: Boolean;

    PrcCmn, PrcPps, PrcBln, PrcDkr, PrcDgv,

    TtlAcc, TtlGrpVNU, TtlPrp,
    SmVidN, SmDolgTM, SmDolgPM,
    SmVNU_1, SmVNU0, SmVNU1, SmVNU2, SmVNU3, SmVNU4, SmVNU5: Double;

    NPP: Integer;

    procedure PrintAccnt;
    procedure PrintAccHead;
    procedure PrintAccSaldo;
    procedure PrintAccPrp;
    procedure PrintAccDebt;
    procedure PrintAccFoot(Accnt: ShortString);

    procedure PrintVNU(VNU: Integer);
    procedure PrintVNUGrpHead;
    procedure PrintVNUGrpFoot(VNU: Integer);

    procedure PrintVidN(VidN: ShortString);
    procedure PrintBanks;

    procedure PrintPrpESV;
    procedure PrintPrpMinZP;

    function GetVidNStr(VidN: ShortString; Proc: Double): ShortString;

    procedure OpenPrpMinZPQry;
  protected
    procedure InitReport; override;
    procedure InitBook; override;
    procedure PrintHeader; override;
    procedure PrintBody; override;
    procedure PrintFooter; override;
  public
    class procedure Run(Final: Boolean; CdsSPZ, CdsPrp: TDataSet;
      DtProc: TDateTime; PrtCaption: ShortString;
      UseParentAcc: Boolean = false);
  end;

implementation

uses
  Controls, Forms, Graphics, Math, SysUtils, Variants, a_Const,
  a_DM, a_Lib, z_DM, z_Main, QryLib, ZplLib;

//------------------------------------------------------------------------------
class procedure TMemOrdSynth.Run(
  Final: Boolean;
  CdsSPZ, CdsPrp: TDataSet;
  DtProc: TDateTime;
  PrtCaption: ShortString;
  UseParentAcc: Boolean = false
);
var
  Report: TMemOrdSynth;
begin
  Screen.Cursor := crHourGlass;

  Report := TMemOrdSynth.Create;
  Report.Final := Final;
  Report.CdsSPZ := CdsSPZ;
  Report.CdsPrp := CdsPrp;
  Report.DtProc := DtProc;
  Report.PrtCaption := PrtCaption;
  Report.UseParentAcc := UseParentAcc;

  with Report do begin
    DmAccMap := TDMAccMap.Create(nil);

    QryCmn := TQuery.Create(nil);
    QryPrpMinZP := TQuery.Create(nil);

    // Поскольку из CdsSPZ печатаются только VNU до 5-й включительно,
    // Сразу фильтруем ненужные
    with CdsSPZ do begin
      Filter := 'VNU < 5';
      Filtered := true;
    end;

    RepDate := DateUtils.Decode(DtProc);

    Print;
    Preview;

    CdsSPZ.Filtered := false;

    DmAccMap.Free;

    QryCmn.Free;
    QryPrpMinZP.Free;
    Free;
  end;

  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.InitReport;
begin
  inherited InitReport;
  MaxColNum := 8;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.InitBook;
begin
  inherited InitBook;
  Book.ShowGridLines := false;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintHeader;
begin
  with Book do begin
    TextRC[CurRow, MaxColNum] := PrtCaption;
    RowHeight[CurRow] := Round(1.2 * ColUnit);
    SetSelection(CurRow, MaxColNum, CurRow, MaxColNum);
    FontUnderLine := true;
    SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0);
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintBody;
begin
  if UseParentAcc then
    RptAccFldNm := 'PSch'
  else
    RptAccFldNm := 'SchBU';

  Dt_2009_04 := EncodeDate(2009, 4, 1);

  Form_Dm.GetEsvPrc(DtProc, PrcCmn, PrcPps, PrcBln, PrcDkr, PrcDgv);

  CdsSPZ.DisableControls;
  CdsPrp.DisableControls;

  // Сортировка CdsSPZ - 'PSch;SchBU;VNU;VidN'
  with CdsSPZ do begin
    First;
    FirstAcc := true;

    ZplAcc := '6511';                // до 2017 г. '661';

    while not Eof do begin
      if not FirstAcc then begin
        // С новой страницы
        Inc(CurRow);
        Book.AddRowPageBreak(CurRow);
      end;

      RptAcc := FieldByName(RptAccFldNm).AsString;
      PrintAccnt;
      
      FirstAcc := false;
    end;
  end;

  CdsSPZ.EnableControls;
  CdsPrp.EnableControls;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintAccnt;
var
  AccNm: ShortString;
begin
  with Book, CdsSPZ do begin
    AccNm := Form_Dm.SchBu22NmSbu(RptAcc);
    // Mapping счётов. Ольга
    MapInfo := DMAccMap.MapAccounts(RptAcc, AccNm, BaseAcc);

    // Суммы по группам видов начисления внутри счёта
    SmVNU_1 := 0;
    SmVNU0 := 0;
    SmVNU1 := 0;
    SmVNU2 := 0;
    SmVNU3 := 0;
    SmVNU4 := 0;
    SmVNU5 := 0;

    PrintAccHead;
    // Нумерация внутри начислений и удержаний
    NPP := 0;
    NewVNUGrp := true;
    
    // Начисления и удержания
    while (FieldByName(RptAccFldNm).AsString = RptAcc) and not Eof do begin
      PrintVNU(FieldByName('VNU').AsInteger);

      // Группы ЕСВ печатаем из CdsPrp
      if FieldByName('VNU').AsInteger > 4 then
        break;
    end;

    // Сальдо по начислениям и удержаниям
    PrintAccSaldo;

    // Обязательные платежи с предприятия
    PrintAccPrp;

    // Долги прошлого и текущего месяца
    PrintAccDebt;
    PrintAccFoot(RptAcc);
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintVNU(VNU: Integer);
begin
  with Book, CdsSPZ do begin
    // Начинается группа VNU. Печатаем заголовок
    if NewVNUGrp then begin
      PrintVNUGrpHead;
      TtlGrpVNU := 0;
      NewVNUGrp := false;
    end;

    while (FieldByName(RptAccFldNm).AsString = RptAcc)
      and (FieldByName('VNU').AsInteger = VNU) and not Eof do
    begin
      PrintVidN(FieldByName('VidN').AsString);

      if VNU = -1 then       // больничные (и детские)
        SmVnu_1 := SmVnu_1 + SmVidN
      else if VNU = 0 then   // вид 1210 СрДляМобилизованных
        SmVnu0 := SmVnu0 + SmVidN
      else if VNU = 1 then   // начисления
        SmVnu1 := SmVnu1 + SmVidN
      else if VNU = 2 then   // удержания
        SmVnu2 := SmVnu2 - SmVidN
      else if VNU = 3 then   // бывш. прочие
        SmVnu3 := SmVnu3 - SmVidN
      else if VNU = 4 then   // выплаты
        SmVnu4 := SmVnu4 - SmVidN;
    end;

    // Завершилась группа VNU, печатаем итог
    if Eof or
      (VNU < 2) and (FieldByName('VNU').AsInteger >= 2)
        and ((SmVnu_1 <> 0) or (SmVnu0 <> 0) or (SmVnu1 <> 0))
      or (VNU < 5) and (FieldByName('VNU').AsInteger >= 5)
        and ((SmVnu2 <> 0) or (SmVnu3 <> 0) or (SmVnu4 <> 0))
    then begin
      PrintVNUGrpFoot(VNU);
      NewVNUGrp := true;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintVidN(VidN: ShortString);
var
  KrSch, KEKV, VidNNm, Msg: ShortString;
  VNU: Integer;
  SmSldPN, SmTmp: Double;
begin
  with Book, CdsSPZ do begin
    VNU := FieldByName('VNU').AsInteger;
    VidNNm := FieldByName('NmVidN').AsString;
    
    SmVidN := 0;
    SmSldPN := 0;

    while (FieldByName(RptAccFldNm).AsString = RptAcc)
      and (FieldByName('VNU').AsInteger = VNU)
      and (FieldByName('VidN').AsString = VidN) and not Eof do
    begin
      KEKV := FieldByName('Vid_KEKV').AsString;
      KrSch := FieldByName('KrSch').AsString;

      SmVidN := SmVidN + FieldByName('Smm').AsFloat;

      if (VidN = '6001') and (FieldByName('My_NR').AsInteger = -111) then
        SmSldPN := FieldByName('Smm').AsFloat
      else if (VidN = '2723') or (VidN = '6623') then
        // возврат и удержание копеек - просто пропускю
      else if VidN = '2724' then
        SmDolgTM := SmDolgTM + FieldByName('Smm').AsFloat
      else if VidN = '6624' then
        SmDolgPM := SmDolgPM - FieldByName('Smm').AsFloat
      // будет плюсовым, хотя удерж.
      else if VidN < '6000' then begin
        TtlGrpVNU := TtlGrpVNU + FieldByName('Smm').AsFloat;
        TtlAcc := TtlAcc + FieldByName('Smm').AsFloat;
      end else if VidN < '8600' then begin
        TtlGrpVNU := TtlGrpVNU - FieldByName('Smm').AsFloat;
        TtlAcc := TtlAcc - FieldByName('Smm').AsFloat;
      end;

      Next;
    end;

    if ((VidN < '5000') or (VidN >= '6000')) and (VidN < '8600')
      and (VidN <> '2723') and (VidN <> '2724')
      and (VidN <> '6623') and (VidN <> '6624') then
    begin
      Inc(CurRow);
      Inc(NPP);
      NumberRC[CurRow, 1] := NPP;

      TextRC[CurRow, 2] := VidN;
      SetSelection(CurRow, 2, CurRow, 2);
      SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);

      Msg := VidNNm;
      if (VidN = '6001') and (SmSldPN <> 0) then begin
        SmTmp := SmSldPN - SmVidN;
        Msg := Msg + ' (' + FloatToStrF(SmTmp, ffNumber, 18, 2);
        if SmSldPN > 0 then
          Msg := Msg + ' - '
        else
          Msg := Msg + ' + ';
        SmSldPN := Abs(SmSldPN);
        Msg := Msg + FloatToStrF(SmSldPN, ffNumber, 18, 2) + ' = ';
        Msg := Msg + FloatToStrF(-SmVidN, ffNumber, 18, 2) + ')';
      end else if VidN = '6201' then
        Msg := Msg + ' ' + GetVidNStr(VidN, PrcCmn)
      else if VidN = '6206' then
        Msg := Msg + ' ' + GetVidNStr(VidN, PrcPps)
      else if VidN = '6211' then
        Msg := Msg + ' ' + GetVidNStr(VidN, PrcBln)
      else if VidN = '6212' then
        Msg := Msg + ' ' + GetVidNStr(VidN, PrcDkr)
      else if VidN = '6216' then
        Msg := Msg + ' ' + GetVidNStr(VidN, PrcDgv);

      TextRC[CurRow, 3] := Msg;
      SetSelection(CurRow, 3, CurRow, 4);
      CellFormat := CreateNewCellFormat;
      CellFormat.MergeCells := true;
      CellFormat.WordWrap := false;
      SetCellFormat(CellFormat);
      FontSize := 8;

      if VNU < 2 then
        TextRC[CurRow, 5] := DMAccMap.MapAccounts(KrSch, '', AccrualAcc).Accnt
      else
        TextRC[CurRow, 5] := ZplAcc;
      SetColWidthAuto(CurRow, 5, CurRow, 5, false);

      if (VNU <= 1) or (VNU > 1)
        or (Pos(VidN,'6001,6021,6201,6206,6211,6212,6216,6303,6304,' +
          '6501,6601,6602,6707,7509,7511,8611,8612') > 0)
      then
        // иначе будет разблюдовка по КЕКВ
        TextRC[CurRow, 6] := KEKV;

      if VNU < 2 then
        //начисления (больн, детск. = 0; остальн. = 1)
        TextRC[CurRow, 7] := ZplAcc
      else
        // виды удержаний и выплаты
        TextRC[CurRow, 7] := KrSch;

      SetSelection(CurRow, 5, CurRow, 7);
      SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);

      if VidN < '6000' then
        NumberRC[CurRow, 8] := SmVidN
      else
        NumberRC[CurRow, 8] := -SmVidN;
      SetSelection(CurRow, 8, CurRow, 8);
      FormatFixed2;

      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      SetRowHeightAuto(CurRow, 1, CurRow, MaxColNum, true);

      // Вставить раскладку по банкам
      if VidN = '7511' then
        PrintBanks;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintBanks;
var
  SmBnk101, SmBnkOther: Double;
  BnkCnt: Integer;
  Msg: ShortString;
begin
  with Book do begin
    ZplUtils.GetSmByBnk(QryCmn,
      RptAcc, DtProc, Dt_2009_04, SmBnk101, SmBnkOther, false);

    if DtProc < Dt_2009_04 then begin
      if (SmBnk101 <> 0) or (SmBnkOther <> 0) then begin
        Inc(CurRow);
        TextRC[CurRow, 3] := 'В т.ч в ИмексБанк';
        SetSelection(CurRow, 3, CurRow, 7);
        SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
        NumberRC[CurRow, 8] := -SmBnk101;
        SetSelection(CurRow, 8, CurRow, 8);
        FormatFixed2;
        SetSelection(CurRow, 1, CurRow, MaxColNum);
        SetBorder(1,1,1,1,1,0, clBlack,clBlack,clBlack,clBlack,clBlack);
        FontItalic := true;
        FontSize := 8;

        Inc(CurRow);
        TextRC[CurRow, 3] := 'в інші банки';
        SetSelection(CurRow, 3, CurRow, 7);
        SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
        NumberRC[CurRow, 8] := -SmBnkOther;
        SetSelection(CurRow, 8, CurRow, 8);
        FormatFixed2;
        SetSelection(CurRow, 1, CurRow, MaxColNum);
        SetBorder(1,1,1,1,1,0, clBlack,clBlack,clBlack,clBlack,clBlack);
        FontItalic := true;
        FontSize := 8;
      end;
    end else begin
      with QryCmn do begin
        First;
        BnkCnt := 1;

        while not QryCmn.Eof do begin
          Inc(CurRow);

          if BnkCnt = 1 then
            Msg := 'В т.ч. в банки:'
          else
            Msg := '';
          TextRC[CurRow, 3] := Msg;
          SetSelection(CurRow, 3, CurRow, 4);
          SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

          TextRC[CurRow, 5] := QryCmn.FieldByName('ShBnk').AsString;
          SetSelection(CurRow, 5, CurRow, 7);
          SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

          NumberRC[CurRow, 8] := -QryCmn.FieldByName('Smm').AsFloat;
          SetSelection(CurRow, 8, CurRow, 8);
          FormatFixed2;

          SetSelection(CurRow, 1, CurRow, MaxColNum);
          SetBorder(1,1,1,1,1,0, clBlack,clBlack,clBlack,clBlack,clBlack);
          FontItalic := true;
          FontSize := 8;

          BnkCnt := BnkCnt + 1;
          QryCmn.Next;
        end;
      end;

      QryUtils.ReleaseQuery(QryCmn);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintAccSaldo;
var
  SmSaldo: Double;
begin
  with Book do begin
    Inc(CurRow);
    TextRC[CurRow, 1] := 'Сальдо на кінець місяця:';
    SetSelection(CurRow, 1, CurRow, 4);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    NumberRC[CurRow, 7] := SmDolgTM - SmDolgPM;
    SetSelection(CurRow, 7, CurRow, 7);
    FormatFixed2;

    SmSaldo := SmVNU_1 + SmVNU0 + SmVNU1 - SmVNU2 - SmVNU3 - SmVNU4;
    SmSaldo := RoundTo(SmSaldo, -2);

    if SmSaldo = 0 then begin
      TextRC[CurRow, 8] := '0.00';
      SetSelection(CurRow, 8, CurRow, 8);
      SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0); end
    else begin
      NumberRC[CurRow, 8] := SmSaldo;
      SetSelection(CurRow, 7, CurRow, 8);
      FormatFixed2;
    end;

    SetColWidthAuto(CurRow, 7, CurRow, 8, false);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
// Долги прошлого и текущего месяца
//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintAccDebt;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure PrintDebt(Text: ShortString; Sum: Double);
  begin
    with Book do begin
      Inc(CurRow);
      TextRC[CurRow, 4] := Text;
      SetSelection(CurRow, 4, CurRow, 4);
      SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0);
      NumberRC[CurRow, 7] := Sum;
      SetSelection(CurRow, 7, CurRow, 7);
      FormatFixed2;
      SetSelection(CurRow, 4, CurRow, 7);
      FontSize := 8;
      FontItalic := true;
      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    end;
  end;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
begin
  if (SmDolgTM <> 0) or (SmDolgPM <> 0) then
    with Book do begin
      Inc(CurRow);
      TextRC[CurRow, 3] := 'Довідка:';
      SetSelection(CurRow, 3, CurRow, 4);
      CellFormat := CreateNewCellFormat;
      CellFormat.MergeCells := true;
      CellFormat.WordWrap   := false;
      SetCellFormat(CellFormat);
      SetSelection(CurRow, 3, CurRow, 3);
      SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);
      FontSize := 8;
      FontItalic := true;
      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

      if SmDolgPM <> 0 then
        PrintDebt('Погашення заборг. за минулий місяць:', -SmDolgPM);

      if SmDolgTM <> 0 then
        PrintDebt('В борг поточного місяця:', SmDolgTM);
    end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintAccPrp;
begin
  OpenPrpMinZPQry;

  if CdsPrp.Locate(RptAccFldNm, Trim(RptAcc), [])
    or (QryPrpMinZP.RecordCount > 0) then
  begin
    with Book do begin
      Inc(CurRow, 2);
      TextRC[CurRow, 1] := 'О б о в` я з к о в і   п л а т е ж і :';
      SetSelection(CurRow - 1, 1, CurRow, MaxColNum);
      SetBorder(1,0,0,0,0,0,clBlack,clBlack,clBlack,clBlack,clBlack);

      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
      FontBold := true;
      FontUnderLine := true;

      TtlPrp := 0;

      PrintPrpESV;
      PrintPrpMinZP;

      Inc(CurRow);
      RowHeight[CurRow] := Round(0.3 * ColUnit);
      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1,0,0,0,0,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      Inc(CurRow);
      SetSelection(CurRow, 1, CurRow, MaxColNum-1);
      SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
      TextRC[CurRow, 1] := 'Всього обов`язкових платежів:';
      FontBold := true;
      NumberRC[CurRow, 8] := TtlPrp;
      SetSelection(CurRow, 8, CurRow, 8);
      FormatFixed2;
      SetSelection(CurRow, 1, CurRow, MaxColNum);
      FontBold := true;
      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      Inc(CurRow);
      RowHeight[CurRow] := Round(0.3 * ColUnit);
      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1,0,0,0,0,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintPrpESV;
var
  PrpPrcCmn, PrpPrcBln, PrpPrcBlnInv, PrpPrcDgv, PrpPrcInv, Perc,
  SmAccESV, SmGrp, SmFor, SmSvPrg, SmTo: Double;
  Grp, GrpRecCnt: Integer;
  VidN, KrAcc, Msg, TmpStr: ShortString;
begin
  // Проценты для начисления ЕСВ
  Form_Dm.GetEsvPrpPrc(
    DtProc, PrpPrcCmn, PrpPrcBln, PrpPrcBlnInv, PrpPrcDgv, PrpPrcInv);

  with Book, CdsPrp do begin
    First;

    KrAcc := '';
    NPP := 0;
    SmAccESV := 0;

    while (FieldByName(RptAccFldNm).AsString = RptAcc) and not Eof do begin
      if FieldByName('Grp').AsInteger = 1 then begin
        // пропустить записи удержаний с сотр. Grp = 1
        Next;
        continue;
      end;

      Grp := FieldByName('Grp').AsInteger;
      GrpRecCnt := 0;
      SmGrp := 0;

      while (FieldByName(RptAccFldNm).AsString = RptAcc)
        and (FieldByName('Grp').AsInteger = Grp) and not Eof do
      begin
        GrpRecCnt := GrpRecCnt + 1;

        VidN := cdsPrp.FieldByName('VidN').AsString;

        Perc := 0;
        if (VidN = '8681') or (VidN = '8682') then
          Perc := PrpPrcCmn
        else if (VidN = '8683') or (VidN = '8684') then
          Perc := PrpPrcInv
        else if VidN = '8685' then
          Perc := PrpPrcBln
        else if VidN = '8686' then
          Perc := PrpPrcBlnInv
        else if VidN = '8691' then
          Perc := PrpPrcDgv;

        Inc(CurRow);
        Inc(NPP);
        NumberRC[CurRow, 1] := NPP;
        SetSelection(CurRow, 3, CurRow, 4);
        CellFormat := CreateNewCellFormat;
        CellFormat.MergeCells := true;
        CellFormat.WordWrap   := false;
        SetCellFormat(CellFormat);

        SmFor := FieldByName('SmFor').AsFloat;
        SmSvPrg := FieldByName('SmSvPrg').AsFloat;

        Msg := Copy(FieldByName('VidNotes').AsString, 4, 20) + ' ' +
          FloatToStr(Perc) + '%:';
        Msg := Msg + ' (' + FloatToStrF(SmFor, ffFixed, 18, 2);
        if SmSvPrg <> 0 then begin
          Msg := Msg + ' - ' + FloatToStrF(SmSvPrg, ffFixed, 18, 2);
          Msg := Msg + ' = ' + FloatToStrF(SmFor - SmSvPrg, ffFixed, 18, 2);
        end;
        Msg := Msg + ')';

        TextRC[CurRow, 2] := VidN;
        TextRC[CurRow, 3] := Msg;
        SetSelection(CurRow, 3, CurRow, 3);
        FontSize := 8;

        TextRC[CurRow, 5] := DMAccMap.MapAccounts(RptAcc, '', PaymentAcc).Accnt;
        SetColWidthAuto(CurRow, 5, CurRow, 5, false);

        if DmMain.QryVidN_LU.Locate('VidN', VidN, []) then begin
          TextRC[CurRow, 6] := DmMain.qryVidN_LU.FieldByName('KEKV').AsString;

          TmpStr := DmMain.KdSbu2SchBU(
            DmMain.QryVidN_LU.FieldByName('KdSpZ').AsInteger);

          if TmpStr <> '' then
            KrAcc := TmpStr;

          TextRC[CurRow, 7] := KrAcc;
          SetSelection(CurRow, 5, CurRow, 7);
          SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);
        end;

        //------  исправляем сумму в ЕСВ на расчётную  ------
        SmTo := RoundTo((SmFor - SmSvPrg) * Perc / 100, -2);
        //---------------------------------------------------

        SmGrp := SmGrp + SmTo;
        SmAccESV := SmAccESV + SmTo;
        TtlPrp := TtlPrp + SmTo;

        NumberRC[CurRow, 8] := SmTo;
        SetSelection(CurRow, 8, CurRow, 8);
        FormatFixed2;
        SetSelection(CurRow, 1, CurRow, MaxColNum);
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

        Next;
      end;

      if GrpRecCnt > 1 then begin
        Inc(CurRow);
        TextRC[CurRow, 1] := 'Всього:';
        SetSelection(CurRow, 1, CurRow, 7);
        SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
        NumberRC[CurRow, 8] := SmGrp;
        SetSelection(CurRow, 8, CurRow, 8);
        FormatFixed2;
        SetSelection(CurRow, 1, CurRow, MaxColNum);
        FontItalic := true;
        SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
      end;
    end;

    if (NPP > 0) then begin
      Inc(CurRow);
      TextRC[CurRow, 1] := 'Всього по рахунку ' + KrAcc + ':';
      SetSelection(CurRow, 1, CurRow, MaxColNum-1);
      FontItalic := true;
      FontSize := 8;
      CellFormat := CreateNewCellFormat;
      CellFormat.AlignHorizontal := F1HAlignRight;
      CellFormat.AlignVertical := F1VAlignCenter;
      CellFormat.MergeCells := true;
      CellFormat.WordWrap := false;
      CellFormat.FontBold := false;
      SetCellFormat(CellFormat);

      NumberRC[CurRow, 8] := SmAccESV;
      SetSelection(CurRow, 8, CurRow, 8);
      FontItalic := true;
      FormatFixed2;
      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintPrpMinZp;
var
  SmPrpMinZP, SmVidN, Sm22Perc: Double;
  VidN: ShortString;
begin
  with Book, QryPrpMinZP do
  if RecordCount > 0 then begin
    Inc(CurRow);
    RowHeight[CurRow] := Round(0.3 * ColUnit);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,0,0,0,0,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow);
    TextRC[CurRow, 1] := 'Обов`язкові платежі до рівня мінімальної з/пл:';
    SetSelection(CurRow, 1, CurRow, MaxColNum - 1);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontItalic := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    First;
    NPP := 0;
    SmPrpMinZP := 0;

    while not Eof do begin
      Inc(CurRow);

      Inc(NPP);
      NumberRC[CurRow, 1] := NPP;

      VidN := FieldByName('VidN').AsString;
      TextRC[CurRow, 2] := VidN;
      TextRC[CurRow, 3] := FieldByName('NmVidN').AsString;

      SmVidN := -FieldByName('SMM').AsFloat;

      if (VidN <> '8713') and (VidN <> '8717') then begin
        SetSelection(CurRow, 3, CurRow, 4);
        CellFormat := CreateNewCellFormat;
        CellFormat.MergeCells := true;
        CellFormat.WordWrap   := false;
        SetCellFormat(CellFormat);

        TextRC[CurRow, 5] :=
          DMAccMap.MapAccounts(RptAcc, '', PaymentAcc).Accnt;
        TextRC[CurRow, 6] := FieldByName('Vid_KEKV').AsString;
        TextRC[CurRow, 7] := FieldByName('Vid_SPZ').AsString;

        SetSelection(CurRow, 5, CurRow, 7);
        SetAlignment(F1HAlignCenter, false, F1VAlignCenter, 0);

        NumberRC[CurRow, 8] := SmVidN;

        SmPrpMinZP := SmPrpMinZP + SmVidN;
        TtlPrp := TtlPrp + SmVidN;
      end else begin
        TextRC[CurRow, 3] := FieldByName('NmVidN').AsString;
        NumberRC[CurRow, 4] := FieldByName('SMM').AsFloat;

        // Sm22Perc := FieldByName('SMM').AsFloat * 0.22;
        // SmPrpMinZP := SmPrpMinZP + Sm22Perc;
        // TtlPrp := TtlPrp + Sm22Perc;
        // ??? NumberRC[CurRow - 1, 8] := Sm22Perc;
      end;

      SetSelection(CurRow, 8, CurRow, 8);
      FormatFixed2;
      SetSelection(CurRow, 1, CurRow, MaxColNum);
      SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);

      Next;
    end;

    Inc(CurRow);
    TextRC[CurRow, 1] := 'Всього обов`язкових платежів до рівня ' +
      'мінімальної з/пл:';
    SetSelection(CurRow, 1, CurRow, 7);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontItalic := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    NumberRC[CurRow, 8] := SmPrpMinZP;
    SetSelection(CurRow, 8, CurRow, 8);
    FormatFixed2;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontItalic := true;
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintAccHead;
var
  Msg: ShortString;
begin
  with Book do begin
    Inc(CurRow);
    TextRC[CurRow, 1] := 'Національний унiверситет "Одеська полiтехнiка"';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontSize := 10;
    FontBold := true;

    Inc(CurRow);
    TextRC[CurRow, 1] := 'ЄДРПОУ 43861328';
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    Inc(CurRow, 2);
    Msg := '';
    if MapInfo.MemOrdNm <> '' then begin
      Msg := 'Меморіальний ордер' + ' № ' + MapInfo.MemOrdNm;
      TextRC[CurRow, 1] := Msg;
    end;
    RowHeight[CurRow] := Round(1.2 * ColUnit);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontSize := 10;
    FontBold := true;

    Inc(CurRow);
    TextRC[CurRow, 1] := 'Рахунок ' + MapInfo.Accnt + ' ' + MapInfo.AccNm;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    Inc(CurRow);
    TextRC[CurRow, 1] :=
      'за ' + UkrMes(RepDate.Mnth) + ' ' + IntToStr(RepDate.Year) + ' року';
    RowHeight[CurRow] := Round(1.2 * ColUnit);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    FontSize := 10;
    FontBold := true;

    Inc(CurRow);
    CurCol := 1;
    TextRC[CurRow, CurCol] := '№ з/п';
    ColWidth[CurCol] := Round(4 * ColUnit);

    Inc(CurCol);
    TextRC[CurRow, CurCol] := 'Вид';
    ColWidth[CurCol] := Round(5 * ColUnit);

    Inc(CurCol);
    TextRC[CurRow, CurCol] := 'Найменування';
    ColWidth[CurCol] := Round(35 * ColUnit);
    ColWidth[CurCol + 1] := Round(10 * ColUnit);
    SetSelection(CurRow, CurCol, CurRow, CurCol + 1);
    CellFormat := CreateNewCellFormat;
    CellFormat.MergeCells := true;
    CellFormat.WordWrap := false;
    SetCellFormat(CellFormat);

    Inc(CurCol, 2);
    TextRC[CurRow, CurCol] := 'Дебет рахунку';
    ColWidth[CurCol] := Round(8 * ColUnit);

    Inc(CurCol);
    TextRC[CurRow, CurCol] := 'КЕКВ';
    ColWidth[CurCol] := Round(7 * ColUnit);

    Inc(CurCol);
    TextRC[CurRow, CurCol] := 'Кредит рахунку';
    ColWidth[CurCol] := Round(8 * ColUnit);

    Inc(CurCol);
    TextRC[CurRow, CurCol] := 'Сума';
    ColWidth[CurCol] := Round(15 * ColUnit);

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenter, true, F1VAlignCenter, 0);
    RowHeight[CurRow] := Round(2 * ColUnit);
    SetBorder(1, 1, 1, 1, 1, 0, clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintAccFoot(Accnt: ShortString);
begin
  with Book do
  if NPP > 0 then begin
    Inc(CurRow);
    RowHeight[CurRow] := Round(1.5 * ColUnit);
    TextRC[CurRow, 1] := 'Всього обертів за М/О';
    SetSelection(CurRow, 1, CurRow, MaxColNum-1);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);

    NumberRC[CurRow, 8] := RoundTo(
      SmVnu_1 + SmVnu0 + SmVnu1 + SmVnu2 + SmVnu3 + SmVnu4 + TtlPrp, -2);
      
    SetSelection(CurRow, MaxColNum, CurRow, MaxColNum);
    SetAlignment(F1HAlignRight, false, F1VAlignCenter, 0);
    FormatFixed2;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    FontBold := true;
    FontSize := 11;
    SetColWidthAuto(CurRow, 8, CurRow, 8, false);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintVNUGrpHead;
var
  VNU: Integer;
begin
  with CdsSPZ, Book do begin
    VNU := FieldByName('VNU').AsInteger;

    Inc(CurRow);

    if VNU < 2 then
      // Заголовок начислений
      TextRC[CurRow, 1] := 'Кредит рахунку ' + ZplAcc + ' в дебет рахунку:'
    else if VNU = 2 then
      // Заголовок удержаний
      TextRC[CurRow, 1] := 'Дебет рахунку ' + ZplAcc + ' в кредит рахунку:';

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetAlignment(F1HAlignCenterAcrossCells, false, F1VAlignCenter, 0);
    SetBorder(1,0,0,0,0,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    FontBold := true;
    FontUnderLine := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintVNUGrpFoot(VNU: Integer);
begin
  with Book do begin
    Inc(CurRow);

    TextRC[CurRow, 1] := 'Всього по рахунку ' +
      DMAccMap.MapAccounts(RptAcc, '', BaseAcc).Accnt + ':';
    SetSelection(CurRow, 1, CurRow, 7);
    CellFormat := CreateNewCellFormat;
    with CellFormat do begin
      AlignHorizontal := F1HAlignRight;
      AlignVertical := F1VAlignCenter;
      MergeCells := true;
      WordWrap := false;
      FontBold := false;
      FontItalic := true;
      FontSize := 8;
    end;
    SetCellFormat(CellFormat);

    NumberRC[CurRow, 8] := TtlGrpVNU;
    SetSelection(CurRow, 8, CurRow, 8);
    FormatFixed2;
    FontItalic := true;

    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    Inc(CurRow);
    RowHeight[CurRow] := Round(0.3 * ColUnit);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,0,0,0,0,0,clBlack,clBlack,clBlack,clBlack,clBlack);

    Inc(CurRow);
    if VNU < 2 then
      TextRC[CurRow, 1] := 'Всього по видах нарахування:'
    else
      TextRC[CurRow, 1] := 'Всього по видах утримання:';

    SetSelection(CurRow, 1, CurRow, MaxColNum - 1);
    CellFormat := CreateNewCellFormat;
    CellFormat.AlignHorizontal := F1HAlignCenter;
    CellFormat.AlignVertical := F1VAlignCenter;
    CellFormat.MergeCells := true;
    CellFormat.WordWrap := false;
    CellFormat.FontBold := true;
    SetCellFormat(CellFormat);

    NumberRC[CurRow, 8] := TtlGrpVNU;
    SetSelection(CurRow, 8, CurRow, 8);
    FormatFixed2;
    FontBold := true;
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,1,1,1,1,0,clBlack,clBlack,clBlack,clBlack,clBlack);
    
    Inc(CurRow);
    SetSelection(CurRow, 1, CurRow, MaxColNum);
    SetBorder(1,0,0,0,0,0,clBlack,clBlack,clBlack,clBlack,clBlack);
  end;
end;

//------------------------------------------------------------------------------
function TMemOrdSynth.GetVidNStr(
  VidN: ShortString;
  Proc: Double
): ShortString;
var
  SmFor, SmSvPrg: Double;
begin
  if CdsPrp.Locate(
    RptAccFldNm + ';VidN', VarArrayOf([RptAcc, VidN]), []) then
  begin
    SmFor := CdsPrp.FieldByName('SmFor').AsFloat;
    SmSvPrg := CdsPrp.FieldByName('SmSvPrg').AsFloat;

    Result := FloatToStr(Proc) + '% (' +
      FloatToStrF(SmFor, ffFixed, 18, 2);
    if SmSvPrg <> 0 then begin
      Result := Result + ' - ' + FloatToStrF(SmSvPrg, ffFixed, 18, 2);
      Result := Result + ' = ' + FloatToStrF(SmFor - SmSvPrg, ffFixed, 18, 2);
    end;
    Result := Result + ')';
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.OpenPrpMinZPQry;
begin
  QryUtils.InitQuery(QryPrpMinZP);

  with QryPrpMinZP do begin
    SQL.Text :=
      'select n.VidN, kv.ShVidN, kv.NmVidN, n.Vid_SPZ, ' +
        'n.Vid_KEKV, Round(Sum(n.Summa), 2) SMM ' +
      'from ViNuMain n ' +
        'left join z_KdVidN kv on kv.VidN = n.VidN ' +
      'where n.DtProc = :DtProc ' +
        'and n.VidN > "8710" ' +
        'and n.VidN < "8720" ' +
        'and n.' + RptAccFldNm + ' = :RptAcc ' +
      'group by n.VidN, kv.ShVidN, kv.NmVidN, n.Vid_SPZ, n.Vid_KEKV';

    ParamByName('DtProc').AsDateTime := DtProc;
    ParamByName('RptAcc').AsString := RptAcc;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TMemOrdSynth.PrintFooter;
begin
  with Book do begin
    Inc(CurRow, 3);
    TextRC[CurRow, MaxColNum] :=
      'Заступник головнго бухгалтера ____________ ' + Form_Dm.KdUsr2FioUsr(102);
    SetSelection(CurRow, MaxColNum, CurRow, MaxColNum);
    SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);

    Inc(CurRow, 3);
    TextRC[CurRow, MaxColNum] :=
      'Бухгалтер ____________ ' + Form_Dm.KdUsr2FioUsr(nAppKdUsr);
    SetSelection(CurRow, MaxColNum, CurRow, MaxColNum);
    SetAlignment(F1HAlignRight, false, F1VAlignBottom, 0);
  end;
end;

end.
