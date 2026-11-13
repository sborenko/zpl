unit z_PFCr21_DM;

interface

uses
  SysUtils, Classes, DB, DBTables, DBClient, Math, z_PFCr21_types, ProgressManager, RangeLib;

type
  TRecNadb = record
    Range: TDateRange;
    PidBeg: string;
    PidEnd: string;
    PidZv: string;

    ZO, DogCPH, VS,
    KdOsnUvoln,
    KdDlzhn: SmallInt;

    Valid: boolean;
  end;

  TDMPF21 = class(TDataModule)
    qryNU: TQuery;
    cdsSpov: TClientDataSet;
    cdsSpovNR: TAutoIncField;
    cdsSpovPERIOD_M: TIntegerField;
    cdsSpovPERIOD_Y: TIntegerField;
    cdsSpovUKR_GROMAD: TIntegerField;
    cdsSpovST: TIntegerField;
    cdsSpovNUMIDENT: TStringField;
    cdsSpovZO: TSmallintField;
    cdsSpovPAY_TP: TIntegerField;
    cdsSpovPAY_MNTH: TIntegerField;
    cdsSpovPAY_YEAR: TIntegerField;
    cdsSpovOTK: TSmallintField;
    cdsSpovExp: TSmallintField;
    cdsSpovNRC: TIntegerField;
    cdsSpovNRM: TIntegerField;
    cdsSpovTabN: TIntegerField;
    cdsSpovKd_VP: TSmallintField;
    cdsSpovKd_PTV: TSmallintField;
    cdsSpovKd_Nzp: TSmallintField;
    cdsSpovKd_Np: TSmallintField;
    cdsSpovState: TSmallintField;
    cdsSpovInv: TSmallintField;
    cdsSpovZaMG: TDateField;
    cdsSpovNPD: TSmallintField;
    cdsSpovIsWrk: TBooleanField;
    cdsSpovIsBln: TBooleanField;
    cdsSpovIsOtp: TBooleanField;
    cdsSpovIsDekr: TBooleanField;
    cdsSpovIsOtp3: TBooleanField;
    cdsSpovIsOtp6: TBooleanField;
    cdsSpovSm1210: TFloatField;
    cdsSpovSmCmn: TFloatField;
    cdsSpovSmPmCmn: TFloatField;
    cdsSpovSmOtpCmn: TFloatField;
    cdsSpovSmDCmn: TFloatField;
    cdsSpovSmPmDCmn: TFloatField;
    cdsSpovSmDOtpCmn: TFloatField;
    cdsSpovSmPCmn: TFloatField;
    cdsSpovsvPCmn: TFloatField;
    cdsSpovSmPrpCmn: TFloatField;
    cdsSpovSmPrpInvCmn: TFloatField;
    cdsSpovSmPps: TFloatField;
    cdsSpovSmPmPps: TFloatField;
    cdsSpovSmOtpPps: TFloatField;
    cdsSpovSmDPps: TFloatField;
    cdsSpovSmPmDPps: TFloatField;
    cdsSpovSmDOtpPps: TFloatField;
    cdsSpovSmPPps: TFloatField;
    cdsSpovsvPPps: TFloatField;
    cdsSpovSmPrpPps: TFloatField;
    cdsSpovSmPrpInvPps: TFloatField;
    cdsSpovSmBln: TFloatField;
    cdsSpovSmDBln: TFloatField;
    cdsSpovSmPBln: TFloatField;
    cdsSpovsvPBln: TFloatField;
    cdsSpovSmPrpBln: TFloatField;
    cdsSpovSmDekr: TFloatField;
    cdsSpovSmDDekr: TFloatField;
    cdsSpovSmPDekr: TFloatField;
    cdsSpovsvPDekr: TFloatField;
    cdsSpovSmPrpDekr: TFloatField;
    cdsSpovDtBDekr: TDateField;
    cdsSpovDtEDekr: TDateField;
    cdsSpovDtBegDekr: TDateField;
    cdsSpovDtEndDekr: TDateField;
    cdsSpovSmDgv: TFloatField;
    cdsSpovSmDDgv: TFloatField;
    cdsSpovSmPDgv: TFloatField;
    cdsSpovsvPDgv: TFloatField;
    cdsSpovSmPrpDgv: TFloatField;
    cdsSpovSmVozvr: TFloatField;
    cdsSpovSmDVozvr: TFloatField;
    cdsSpovSmPVozvr: TFloatField;
    cdsSpovSmOtp: TFloatField;
    cdsSpovSmDOtp: TFloatField;
    cdsSpovSmPOtp: TFloatField;
    cdsSpovSmPrpOtp: TFloatField;
    cdsSpovDPR: TDateField;
    cdsSpovDZR: TDateField;
    cdsSpovKdInMes: TSmallintField;
    cdsSpovKD: TSmallintField;
    cdsSpovNum_Nak: TStringField;
    cdsSpovDt_Nak: TDateField;
    cdsSpovDtBOtp3: TDateField;
    cdsSpovDtEOtp3: TDateField;
    cdsSpovDtBOtp6: TDateField;
    cdsSpovDtEOtp6: TDateField;
    cdsSpovSm8711: TFloatField;
    cdsSpovSm8712: TFloatField;
    cdsSpovSm8713: TFloatField;
    cdsSpovSm8715: TFloatField;
    cdsSpovSm8716: TFloatField;
    cdsSpovSm8717: TFloatField;
    qryPeek: TQuery;
    cdsT6: TClientDataSet;
    cdsT6MySort: TSmallintField;
    cdsT6MyType: TStringField;
    cdsT6MyZaMG: TDateField;
    cdsT6Period_M: TSmallintField;
    cdsT6Period_Y: TSmallintField;
    cdsT6ZO: TSmallintField;
    cdsT6Pay_TP: TSmallintField;
    cdsT6Pay_Mnth: TSmallintField;
    cdsT6Pay_Year: TSmallintField;
    cdsT6Kd_Np: TSmallintField;
    cdsT6Kd_Nzp: TSmallintField;
    cdsT6Kd_PTV: TSmallintField;
    cdsT6Kd_VP: TSmallintField;
    cdsT6Sum_Total: TFloatField;
    cdsT6Sum_Max: TFloatField;
    cdsT6Sum_Ins: TFloatField;
    cdsT6Sum_Diff: TFloatField;
    cdsT6Sum_Narah: TFloatField;
    cdsT6OTK: TSmallintField;
    cdsT6NPD: TSmallintField;
    cdsT6EXP: TSmallintField;
    cdsT6NumIdent: TStringField;
    cdsT6LN: TStringField;
    cdsT6NM: TStringField;
    cdsT6FTN: TStringField;
    cdsT6St: TSmallintField;
    cdsT6Ukr_Gromad: TSmallintField;
    cdsT6NRC: TSmallintField;
    tbl_05: TTable;
    tbl_06: TTable;
    tbl_07: TTable;

  private
    reportPeriod: TDateRange;

    procedure ProcessEmployee;
    procedure ProcessZaMG(nTabN: integer; dZaMG: TDateTime);
    procedure AccumulateTotals(dZaMG: TDateTime; var r: TRecTotals);

    procedure Pishem(nTabN: integer; dZaMG: TDateTime; r: TRecTotals);
    procedure SbrosToSpov13;
    procedure CopyToTbl_06;

    procedure PushToSpov(nTabN: integer; cds: TClientDataSet; recT6: TRecD1T6);

    function MyLocate(cNUMIDENT, cPROF, cPID, cPID_ZV: string;
      dSTART_DT, dEND_DT: TDateTime;
      nZO, nDOG_CPH, nPIR, nVS: integer): boolean;

    procedure WriteToTbl05(nTabN : integer; nMM, nYYYY,
      nZO, nDogCPH, nOldKdOK, nNewKdOK : SmallInt;
      cTIN, cFam, cIma, cOtch, cPidZv : ShortString;
      dStartDt, dEndDt : TDateTime; cPID: ShortString; nIsPerevod: integer;
      nVnutrSovm: integer);

    procedure WriteToTbl06(recT6: TRecD1T6;
      nOTK, nZO, nPay_TP, nPay_Mnth, nPay_Year,
      nKdNP, nKdNZP, nKdPTV, nKdVP,
      nNRC, nNRM, nExp: SmallInt;
      nSmTotal, nSmMax, nSmIns, nSmDiff, nSmNarah : double);

    procedure WriteToTbl07(nTabN: integer; dZaMG: TDateTime; recT6: TRecD1T6; cPID: string;
      nNormZ, nHH, nMM, nNorma, nSeason: integer);

    procedure WriteNadb(nTabN: integer; cTin, cFam, cIma, cOtch: string; recNadb: TRecNadb);

    function InitD5T5: TRecD5T5;
    function InitD1T6: TRecD1T6;

    procedure FillT6Pere(nTabN: integer; var recT6: TRecD1T6);
    procedure FillT6NU(var recT6: TRecD1T6);

    function PeekUpi(nTabN: integer): boolean;
    function PeekPrmUv(nTabN: integer; dOnDate: TDateTime): boolean;
    function PeekPere(nTabN: integer; dOnDate: TDateTime; bExact: boolean): boolean;
    function PeekPrevPereForPrmUv(nTabN: integer; dOnDate: TDateTime): boolean;
    function PeekNadb(nTabN: integer; cVidN: string; dOnDate: TDateTime): boolean;
    function PeekVidN(cVidN: string): boolean;
    function PeekOsnUvoln(nOsnUvoln: integer): boolean;
    function PeekDekr(nTabN, nSpecNr: integer): boolean;

  public
    procedure RunD1T6(reportPeriod: TDateRange; progressHandler: TProgressHandler);
  end;

var
  DMPF21: TDMPF21;

implementation

uses Variants, A_Lib, Z_DM, DateUtils;

const
  GROMAD_UKR = 1;

  PERIOD_TYPE_MONTH = 1;
  PERIOD_TYPE_QUARTER = 2;
  PERIOD_TYPE_YEAR = 3;

  KAT_PERS_PPS = 1;          // Проф.преп.сост.
  KAT_PERS_GR_PRAV_DOG = 13; // Гражд.прав.договор

  T5_ZO_TR_KN = 1;    // Наёмные работники (трудовая книжка)
  T5_ZO_NO_TR_KN = 2; // Наёмные работники (без трудовой книжки)
  T5_ZO_CPH = 3;      // Лица, выполняющие работы по ГПД (гражд.прав.договор)
  T5_ZO_OTP_6Y = 4;   // Лица, которым предост.отпуск по уходу за реб.до 6 лет
  T5_ZO_DEKR = 5;     // Лица, которым предост.отпуск по беременности и родам
  T5_ZO_OTP_3Y = 6;   // Лица, которым предост.отпуск по уходу за реб.до 6 лет

  T6_ZO_CMN = 1;         // Общие основания
  T6_ZO_INV = 2;         // Инвалид
  T6_ZO_CHILD_CARE = 20; // Уход за ребёнком
  T6_ZO_PPS = 25;        // Проф.преп.сост.
  T6_ZO_CPH = 26;        // Гражд.прав.дог.
  T6_ZO_BOLN = 29;       // Больнич.
  T6_ZO_PPS_INV = 32;    // Пр.преп.сост.инвалид
  T6_ZO_BOLN_INV = 36;   // Больничн.инв.
  T6_ZO_DEKR = 42;       // Декретные
  T6_ZO_DEKR_INV = 43;   // Декр.инв.
  T6_ZO_MOB = 47;        // Мобилизованный

  PAY_TP_CPH = 1;         // Договорные
  PAY_TP_OTP = 10;        // Суммы отпускных
  PAY_TP_DIF_MIN_ZP = 13; // Разница между мин.з/п и факт.нач.

  PERE_OSN_SOTR = 0;  // Основной сотрудник
  PERE_VNSH_SOVM = 1; // Внешний совместитель
  PERE_VNTR_SOVM = 3; // Внутренний совместитель

  VIDN_FLAG_SOVM = '1'; // Совместительский вид начисления

  OTK_TRUD_KN_YES = 1; // Трудовая книжка на предприятии
  OTK_NO_TRUD_KN = 0;  // Иначе

  // Коды статей увольнения:
  OSN_UVOLN_SOVM = 3; // Для совместителей
  OSN_UVOLN_CPH = 41; // Для договорников

  VIDN_CHILD_3Y = '5011'; // Уход за детьми до 3х лет
  VIDN_CHILD_6Y = '5012'; // Уход за детьми до 6ти лет


{$R *.dfm}

//------------------------------------------------------------------------------
procedure TDMPF21.RunD1T6(reportPeriod: TDateRange; progressHandler: TProgressHandler);
begin
  Self.reportPeriod := reportPeriod;

  with qryNu do begin
    First;

    while not Eof do begin
      ProcessEmployee();

      SbrosToSpov13;
      cdsSpov.Close;

      CopyToTbl_06;
    end; {while Eof}
  end; {with qryNU}
end; {Hybrid}

//------------------------------------------------------------------------------
procedure TDMPF21.ProcessEmployee;
var
  nTabN: integer;
  rT6: TRecD1T6;
  cPol: ShortString;

  dZaMG: TDateTime;
begin
  with qryNu do begin
    nTabN := FieldByName('TabN').AsInteger;
    rT6.NUMIDENT := Trim(FieldByName('ID').AsString);

    cdsSpov.CreateDataSet;
    cdsSpov.IndexName := 'OnZoExp';

    cPol := FieldByName('Pol').AsString;
    if (cPol = 'М') or (cPol = 'Ч') or (cPol = 'м') or (cPol = 'ч') then
      rT6.ST := 1
    else
      rT6.ST := 0;

    // OpenQryPrmUv(nTabN, d_CurPeriodEnd);
    // OpenQryPere(nTabN, d_CurPeriodEnd);

    while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
      dZaMG := FieldByName('ZaMesGod').AsDateTime;

      ProcessZaMG(nTabN, dZaMG);
    end; {while TabN}
  end; {with qryNU}
end;

//------------------------------------------------------------------------------
procedure TDMPF21.ProcessZaMG(nTabN: integer; dZaMG: TDateTime);
var
  rOsn, rSovm: TRecTotals;
  r: ^TRecTotals;

  dDtPrm, dDtUvln, dDPR, dDZR: TDateTime;

  cNr_Pr_Prm, cNr_Pr_Uv: ShortString;
  dDt_Pr_Prm, dDt_Pr_Uv: TDateTime;

  cNmCds: string;
  nCntDaysInMes: SmallInt;

begin
  with qryNu do begin
    rOsn := InitTotals;
    rOsn.nOTK := 1;
    rSovm := InitTotals;
    rSovm.nOTK := 0;

    // Определить даты начала (DPR) и конца (DZR) работы для этого месяца
    // по таблице Приемов/Увольнений
    // GetDprDzr(dZaMG, MyLastDOM(dZaMG), dDPR, dDZR);
    // if dDPR = 0 then
    //   dDPR := dMyDPR; // Заведомо дико большая дата
    rOsn.dDPR := dDPR;
    rSovm.dDPR := dDPR;
    rOsn.dDZR := dDZR;
    rSovm.dDZR := dDZR;

    // rOsn.bIsWrk  := GetIsWrk(nTabN, dZaMG, dDtPrm, dDtUvln);
    rSovm.bIsWrk  := rOsn.bIsWrk;

    // rOsn.bIsInv  := IsInvalid(FieldByName('PRR').AsInteger);
    rSovm.bIsInv := rOsn.bIsInv;

    if PeekPere(nTabN, dZaMG, true) then begin
      rOsn.nNPC := qryPeek.FieldByName('NPD').AsInteger;
      rSovm.nNPC := rOsn.nNPC;
    end;

    // nCntDaysInMes := MyLastDayOM(dZaMG);
    if rOsn.nKdPTV > nCntDaysInMes then
      rOsn.nKdPTV := nCntDaysInMes;
    if rSovm.nKdPTV > nCntDaysInMes then
      rSovm.nKdPTV := nCntDaysInMes;

    while (FieldByName('TabN').AsInteger = nTabN) and
        (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin

      if FieldByName('Sovm').AsString = '1' then
        r := @rSovm
      else
        r := @rOsn;

      r.bIsPps := FieldByName('KdKatP').AsInteger = 1;
      {PRR = 0,1,2 - не инвалиды (ZO = 1); 3,5,7 - инвалиды (ZO = 2)}
      // r.bIsInv := IsInvalid(FieldByName('PRR').AsInteger);

      AccumulateTotals(dZaMG, r^);

      {<= больничных}
      {if (cVidN < '2605') and (cVidN <> '2602')  then begin
        // пытаюсь решить что-то с датами начала (dDPR)
        //                                     и окончания (dDZR) работы
        if (r.dDPR = dMyDPR) and (FieldByName('Dt_Beg').AsDateTime > 0) then
          r.dDPR := Min(r.dDPR, FieldByName('Dt_Beg').AsDateTime);
        if (r.dDZR = 0) and (FieldByName('Dt_End').AsDateTime > 0) then
          r.dDZR := Max(r.dDZR, FieldByName('Dt_End').AsDateTime);
      end;}

      // r.nKdPTV := GetKdPTV(nTabN, dZaMG, cNr_Pr_Prm, dDt_Pr_Prm,
      //                    cNr_Pr_Uv, dDt_Pr_Uv);

      HandleProgress;

      Next;
    end; {while nTabN, dZaMG}

    Pishem(nTabN, dZaMG, rOsn);
    Pishem(nTabN, dZaMG, rSovm);
  end; {with qryNU}
end;

//------------------------------------------------------------------------------
procedure TDMPF21.AccumulateTotals(dZaMG: TDateTime; var r: TRecTotals);
var
  cVidN: string;
  nSumma: double;
begin
  with qryNu do begin
    cVidN  := FieldByName('VidN').AsString;
    nSumma := FieldByName('Summa').AsFloat;

    if (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008') then begin // "договорные" виды
      if (FieldByName('SP_PF').AsString = '1') then
        r.nSmDDgv := r.nSmDDgv + nSumma;
      r.nSmDgv := r.nSmDgv + nSumma;

    end else if (cVidN = '1210') then // средн.з/п.мобилиз.
      r.nSm1210 := r.nSm1210 + nSumma

    // отпускн., кроме неиспольз.
    else if (((cVidN > '2400') and (cVidN < '2500')) or (cVidN = '1810')) then begin
      r.bIsOtp := true;

      if FieldByName('KdKatP').AsInteger = 1 then
        r.nSmOtpPps := r.nSmOtpPps + nSumma
      else
        r.nSmOtpCmn := r.nSmOtpCmn + nSumma;

      if FieldByName('SP_PF').AsString = '1' then
        if FieldByName('KdKatP').AsInteger = 1 then
          r.nSmDOtpPps := r.nSmDOtpPps + nSumma
        else
          r.nSmDOtpCmn := r.nSmDOtpCmn + nSumma;

    end else if (cVidN > '2600') and (cVidN < '2700') then begin // больн.+декр.
      if cVidN = '2602' then begin // декретные
        r.bIsDekr  := true;

        if not FieldByName('Dt_Beg').IsNull and not FieldByName('Dt_End').IsNull then
          r.nKdNpDkr := r.nKdNpDkr +
            Round((FieldByName('Dt_End').AsDateTime - FieldByName('Dt_Beg').AsDateTime + 1));

        r.dDtBDekr := FieldByName('Dt_Beg').AsDateTime;
        r.dDtEDekr := FieldByName('Dt_End').AsDateTime;

        if FieldByName('DtProc').AsDateTime = reportPeriod.Start {dZaMG} then begin
          r.nSmDekr  := r.nSmDekr + nSumma;
          r.nSmDDekr := r.nSmDDekr + nSumma;
        end;

      end else begin // больничные
        r.bIsBln  := true;

        if not FieldByName('Dt_Beg').IsNull and not FieldByName('Dt_End').IsNull then
          r.nKdNpBln := r.nKdNpBln +
            Round((FieldByName('Dt_End').AsDateTime - FieldByName('Dt_Beg').AsDateTime + 1));

        r.nSmBln  := r.nSmBln  + nSumma;
        r.nSmDBln := r.nSmDBln + nSumma;
      end;

    end else if (cVidN < '5000') then begin // все остальные виды начислений
        if nSumma > 0 then begin
          // начисленные положит.суммы (должны "уйти" в ЗаМГ месяца отчёта)
          if (FieldByName('KdKatP').AsInteger <> 1) {не ППС} then begin
            r.nSmPmCmn := r.nSmPmCmn + nSumma;
            if (FieldByName('SP_PF').AsString = '1') then
              r.nSmPmDCmn := r.nSmPmDCmn + nSumma;
          end else {ППС} begin
            r.nSmPmPps := r.nSmPmPps + nSumma;
            if (FieldByName('SP_PF').AsString = '1') then
              r.nSmPmDPps := r.nSmPmDPps + nSumma;
          end;
        end else begin
          // начисленные отрицат.суммы (должны остаться в "своих" ЗаМГ)
          if (FieldByName('KdKatP').AsInteger = 1) {ППС} then begin
            r.nSmPps := r.nSmPps + nSumma;
            if (FieldByName('SP_PF').AsString = '1') then
              r.nSmDPps := r.nSmDPps + nSumma;
          end else {не ППС} begin
            r.nSmCmn := r.nSmCmn + nSumma;
            if (FieldByName('SP_PF').AsString = '1') then
              r.nSmDCmn := r.nSmDCmn + nSumma;
          end;
        end;

    end else if (cVidN = '5005') and
        not FieldByName('Dt_Beg').IsNull and not FieldByName('Dt_End').IsNull then // неоплачиваемые виды
      r.nKdNzp := r.nKdNzp +
        Round((FieldByName('Dt_End').AsDateTime - FieldByName('Dt_Beg').AsDateTime + 1))

    else if (cVidN = '5011') {ОтпДо3лет} then begin
      r.bIsOtp3  := true;
      r.dDtBOtp3 := FieldByName('Dt_Beg').AsDateTime;
      r.dDtEOtp3 := FieldByName('Dt_End').AsDateTime;
    end else if (cVidN = '5012') {ОтпДо6лет} then begin
      r.bIsOtp6  := true;
      r.dDtBOtp6 := FieldByName('Dt_Beg').AsDateTime;
      r.dDtEOtp6 := FieldByName('Dt_End').AsDateTime;

    end else if (cVidN = '6201') then  // уд.в ЕСВ с общ.видов с сотр.
      r.nSmPCmn := r.nSmPCmn - nSumma
    else if (cVidN = '6206') then  // уд.в ЕСВ с ППС-видов с сотр.
      r.nSmPPps := r.nSmPPps - nSumma
    else if (cVidN = '6211') then {begin} // уд.в ЕСВ с Bln-видов
        r.nSmPBln := r.nSmPBln - nSumma
    else if (cVidN = '6212') then begin // уд.в ЕСВ с Dkr-видов
      if FieldByName('DtProc').AsDateTime = reportPeriod.Start then
        r.nSmPDekr := r.nSmPDekr - nSumma; end
    else if (cVidN = '6216') then  // уд.в ЕСВ с дгв-видов с сотр.
      r.nSmPDgv := r.nSmPDgv - nSumma

    else if (cVidN = '8606') then
      r.nSvPCmn := r.nSvPCmn + nSumma
    else if (cVidN = '8607') then
      r.nSvPPps := r.nSvPPps + nSumma
    else if (cVidN = '8608') then
      r.nSvPBln := r.nSvPBln + nSumma
    else if (cVidN = '8609') then
      r.nSvPDekr := r.nSvPDekr + nSumma
    else if (cVidN = '8610') then
      r.nSvPDgv := r.nSvPDgv + nSumma
    else if (cVidN = '8681') then  // с предпр.
      r.nSmPrpCmn := r.nSmPrpCmn - nSumma
    else if (cVidN = '8682') then  // с предпр.
      r.nSmPrpPps := r.nSmPrpPps - nSumma
    else if (cVidN = '8683') then  // с предпр.
      r.nSmPrpInvCmn := r.nSmPrpInvCmn - nSumma
    else if (cVidN = '8684') then  // с предпр.
      r.nSmPrpInvPps := r.nSmPrpInvPps - nSumma
    else if (cVidN = '8685') or (cVidN = '8686') then  // с предпр.
      r.nSmPrpBln := r.nSmPrpBln - nSumma
    else if (cVidN = '8687') or (cVidN = '8688') then  // с предпр.
      r.nSmPrpDekr := r.nSmPrpDekr - nSumma
    else if (cVidN = '8691') then  // с предпр.
      r.nSmPrpDgv := r.nSmPrpDgv - nSumma

    else if (cVidN = '8711') and (dZaMG = reportPeriod.Start) then // ЕсвПрпДоМинЗплОбщ
      r.nSm8711 := r.nSm8711 + nSumma
    else if (cVidN = '8712') and (dZaMG = reportPeriod.Start) then // ЕсвПрпДоМинЗплППС
      r.nSm8712 := r.nSm8712 + nSumma
    else if (cVidN = '8713') and (dZaMG = reportPeriod.Start) then // СмДоМинЗп_1 (36.3%)
      r.nSm8713 := r.nSm8713 + nSumma
    else if (cVidN = '8715') then // ЕсвПрпДоМинЗплБлн
      r.nSm8715 := r.nSm8715 + nSumma
    else if (cVidN = '8716') then   // ЕсвПрпДоМинЗплДекр
      r.nSm8716 := r.nSm8716 + nSumma
    else if (cVidN = '8717') then   // СмДоМинЗп_2 (33,2%)
      r.nSm8717 := r.nSm8717 + nSumma;
  end; {with qryNU}
end;

//------------------------------------------------------------------------------
procedure TDMPF21.Pishem(nTabN: integer; dZaMG: TDateTime; r: TRecTotals);
var
  bPishem: boolean;
  cPidZv: string;
  nYear, nMnth, dummyWord: word;
  nCntDaysInMes: integer;
begin
  bPishem := (nTabN <> 0) and
    ((r.nKdNpBln > 0) or (r.nKdNpDkr > 0) or (r.nKdNzp > 0) or (r.nKdPTV > 0) or
    (r.nSm1210 <> 0) or (r.nSmCmn <> 0) or (r.nSmDCmn <> 0) or (r.nSmPCmn <> 0) or
    (r.nSvPCmn <> 0) or (r.nSmPrpCmn <> 0) or (r.nSmPrpInvCmn <> 0) or
    (r.nSmPmCmn <> 0) or (r.nSmPmDCmn <> 0) or
    (r.nSmPps <> 0) or (r.nSmDPps <> 0) or (r.nSmPPps <> 0) or
    (r.nSvPPps <> 0) or (r.nSmPrpPps <> 0) or (r.nSmPrpInvPps <> 0) or
    (r.nSmPmPps <> 0) or (r.nSmPmDPps <> 0) or
    (r.nSmBln <> 0) or (r.nSmDBln <> 0) or (r.nSmPBln <> 0) or
    (r.nSmDekr <> 0) or (r.nSmDDekr <> 0) or (r.nSmPDekr <> 0) or
    (r.nSvPBln <> 0) or (r.nSmPrpBln <> 0) or (r.nSmDgv <> 0) or
    (r.nSmDDgv <> 0) or (r.nSmPDgv <> 0) or (r.nSvPDgv <> 0) or (r.nSmPrpDgv <> 0) or
    (r.nSmOtpCmn <> 0) or (r.nSmDOtpCmn <> 0) or
    (r.nSmOtpPps <> 0) or (r.nSmDOtpPps <> 0) or
    (r.nSmVozvr <> 0) or (r.nSmDVozvr <> 0) or (r.nSmPVozvr <> 0) or
    (r.nSm8711 <> 0) or (r.nSm8712 <> 0) or (r.nSm8713 <> 0) or
    (r.nSm8715 <> 0) or (r.nSm8716 <> 0) or (r.nSm8717 <> 0) or
    r.bIsPps or r.bIsDekr or r.bIsOtp3 or r.bIsOtp6);

  if bPishem {одну запись в cdsSpov по TabN, ZaMG} then begin
    nCntDaysInMes := DaysPerMonth(dZaMG);

    cPidZv := 'qwerty';

    cdsSpov.Append;

    cdsSpov.FieldByName('TabN').AsInteger    := nTabN;
    cdsSpov.FieldByName('ZaMG').AsDateTime   := dZaMG;
    cdsSpov.FieldByName('IsWrk').AsBoolean   := r.bIsWrk;

    if r.bIsInv then
      cdsSpov.FieldByName('Inv').AsInteger := 1
    else
      cdsSpov.FieldByName('Inv').AsInteger := 0;

    DecodeDate(dZaMG, nYear, nMnth, dummyWord);
    cdsSpov.FieldByName('PAY_MNTH').AsInteger := nMnth;
    cdsSpov.FieldByName('PAY_YEAR').AsInteger := nYear;

    if r.bIsInv {nInv = 7} then
      cdsSpov.FieldByName('ZO').AsInteger   := 2
    else
      cdsSpov.FieldByName('ZO').AsInteger   := 1;

    cdsSpov.FieldByName('OTK').AsInteger  := r.nOTK;

    if r.bIsPps then
      cdsSpov.FieldByName('Exp').AsInteger  := 1
    else
      cdsSpov.FieldByName('Exp').AsInteger  := 0;

    if r.nSm1210 <> 0 then
      cdsSpov.FieldByName('Sm1210').AsFloat := RoundTo(r.nSm1210, -2);

    if r.nSmCmn <> 0 then
      cdsSpov.FieldByName('SmCmn').AsFloat  := RoundTo(r.nSmCmn, -2);
    if r.nSmDCmn <> 0 then
      cdsSpov.FieldByName('SmDCmn').AsFloat := RoundTo(r.nSmDCmn, -2);

    if r.nSmPmCmn <> 0 then
      cdsSpov.FieldByName('SmPmCmn').AsFloat   := RoundTo(r.nSmPmCmn, -2);
    if r.nSmPmDCmn <> 0 then
      cdsSpov.FieldByName('SmPmDCmn').AsFloat  := RoundTo(r.nSmPmDCmn, -2);

    if r.nSmOtpCmn <> 0 then
      cdsSpov.FieldByName('SmOtpCmn').AsFloat  := RoundTo(r.nSmOtpCmn, -2);
    if r.nSmDOtpCmn <> 0 then
      cdsSpov.FieldByName('SmDOtpCmn').AsFloat := RoundTo(r.nSmDOtpCmn, -2);
    if r.nSmPCmn <> 0 then
      cdsSpov.FieldByName('SmPCmn').AsFloat  := RoundTo(r.nSmPCmn, -2);
    if r.nSvPCmn <> 0 then
      cdsSpov.FieldByName('SvPCmn').AsFloat  := RoundTo(r.nSvPCmn, -2);
    if r.nSmPrpCmn <> 0 then
      cdsSpov.FieldByName('SmPrpCmn').AsFloat := RoundTo(r.nSmPrpCmn, -2);
    if r.nSmPrpInvCmn <> 0 then
      cdsSpov.FieldByName('SmPrpInvCmn').AsFloat :=
                                            RoundTo(r.nSmPrpInvCmn, -2);

    if (r.nSmPps <> 0) or r.bIsPps then
      cdsSpov.FieldByName('SmPps').AsFloat    := RoundTo(r.nSmPps, -2);
    if (r.nSmDPps <> 0) or r.bIsPps then
      cdsSpov.FieldByName('SmDPps').AsFloat   := RoundTo(r.nSmDPps, -2);

    if r.nSmPmPps <> 0 then
      cdsSpov.FieldByName('SmPmPps').AsFloat   := RoundTo(r.nSmPmPps, -2);
    if r.nSmPmDPps <> 0 then
      cdsSpov.FieldByName('SmPmDPps').AsFloat  := RoundTo(r.nSmPmDPps, -2);

    if r.nSmOtpPps <> 0 then
      cdsSpov.FieldByName('SmOtpPps').AsFloat := RoundTo(r.nSmOtpPps, -2);
    if r.nSmDOtpPps <> 0 then
      cdsSpov.FieldByName('SmDOtpPps').AsFloat := RoundTo(r.nSmDOtpPps, -2);
    if (r.nSmPPps <> 0) or r.bIsPps then
      cdsSpov.FieldByName('SmPPps').AsFloat  := RoundTo(r.nSmPPps, -2);
    if (r.nSvPPps <> 0) or r.bIsPps then
      cdsSpov.FieldByName('SvPPps').AsFloat  := RoundTo(r.nSvPPps, -2);
    if (r.nSmPrpPps <> 0) or r.bIsPps then
      cdsSpov.FieldByName('SmPrpPps').AsFloat :=
                                               RoundTo(r.nSmPrpPps, -2);
    if r.nSmPrpInvPps <> 0 then
      cdsSpov.FieldByName('SmPrpInvPps').AsFloat :=
                                            RoundTo(r.nSmPrpInvPps, -2);
    if r.nSmBln <> 0 then
      cdsSpov.FieldByName('SmBln').AsFloat    := RoundTo(r.nSmBln, -2);
    if r.nKdNpBln <> 0 then
      cdsSpov.FieldByName('Kd_Np').AsInteger  := r.nKdNpBln;
    if r.nSmDBln <> 0 then
      cdsSpov.FieldByName('SmDBln').AsFloat  := RoundTo(r.nSmDBln, -2);
    if r.nSmPBln <> 0 then
      cdsSpov.FieldByName('SmPBln').AsFloat  := RoundTo(r.nSmPBln, -2);
    if r.nSvPBln <> 0 then
      cdsSpov.FieldByName('SvPBln').AsFloat  := RoundTo(r.nSvPBln, -2);
    if r.nSmPrpBln <> 0 then
      cdsSpov.FieldByName('SmPrpBln').AsFloat :=
                                               RoundTo(r.nSmPrpBln, -2);

    if r.nSmDekr <> 0 then
      cdsSpov.FieldByName('SmDekr').AsFloat   := RoundTo(r.nSmDekr, -2);
    if r.nKdNpDkr <> 0 then
      cdsSpov.FieldByName('Kd_VP').AsInteger  := r.nKdNpDkr;
    if r.nSmDDekr <> 0 then
      cdsSpov.FieldByName('SmDDekr').AsFloat := RoundTo(r.nSmDDekr, -2);
    if r.nSmPDekr <> 0 then
      cdsSpov.FieldByName('SmPDekr').AsFloat := RoundTo(r.nSmPDekr, -2);
    if r.nSvPDekr <> 0 then
      cdsSpov.FieldByName('SvPDekr').AsFloat := RoundTo(r.nSvPDekr, -2);
    if r.nSmPrpDekr <> 0 then
      cdsSpov.FieldByName('SmPrpDekr').AsFloat :=
                                               RoundTo(r.nSmPrpDekr, -2);
    if (r.nSmDekr <> 0) {or bIsDekr} then begin
      cdsSpov.FieldByName('IsDekr').AsBoolean   := r.bIsDekr;
      //cdsSpov.FieldByName('SmDekr').AsFloat     := RoundTo(nSmDekr, -2);
      cdsSpov.FieldByName('DtBDekr').AsDateTime := r.dDtBDekr;
      cdsSpov.FieldByName('DtEDekr').AsDateTime := r.dDtEDekr;
    end;
    if r.nSmDgv <> 0 then
      cdsSpov.FieldByName('SmDgv').AsFloat   := RoundTo(r.nSmDgv, -2);
    if r.nSmDDgv <> 0 then
      cdsSpov.FieldByName('SmDDgv').AsFloat  := RoundTo(r.nSmDDgv, -2);
    if r.nSmPDgv <> 0 then
      cdsSpov.FieldByName('SmPDgv').AsFloat  := RoundTo(r.nSmPDgv, -2);
    if r.nSvPDgv <> 0 then
      cdsSpov.FieldByName('SvPDgv').AsFloat  := RoundTo(r.nSvPDgv, -2);
    if r.nSmPrpDgv <> 0 then
      cdsSpov.FieldByName('SmPrpDgv').AsFloat :=
                                               RoundTo(r.nSmPrpDgv, -2);
    if r.nSmOtp <> 0 then
      cdsSpov.FieldByName('SmOtp').AsFloat   := RoundTo(r.nSmOtp, -2);
    if r.nSmDOtp <> 0 then
      cdsSpov.FieldByName('SmDOtp').AsFloat  := RoundTo(r.nSmDOtp, -2);
    if r.nSmPOtp <> 0 then
      cdsSpov.FieldByName('SmPOtp').AsFloat  := RoundTo(r.nSmPOtp, -2);
    if r.nSmVozvr <> 0 then
      cdsSpov.FieldByName('SmVozvr').AsFloat := RoundTo(r.nSmVozvr, -2);
    if r.nSmDVozvr <> 0 then
      cdsSpov.FieldByName('SmDVozvr').AsFloat :=
                                                RoundTo(r.nSmDVozvr, -2);
    if r.nSmPVozvr <> 0 then
      cdsSpov.FieldByName('SmPVozvr').AsFloat :=
                                                RoundTo(r.nSmPVozvr, -2);
    if r.bIsOtp3 then begin
      cdsSpov.FieldByName('IsOtp3').AsBoolean   := r.bIsOtp3;
      cdsSpov.FieldByName('DtBOtp3').AsDateTime := r.dDtBOtp3;
      cdsSpov.FieldByName('DtEOtp3').AsDateTime := r.dDtEOtp3;
    end;
    if r.bIsOtp6 then begin
      cdsSpov.FieldByName('IsOtp6').AsBoolean   := r.bIsOtp6;
      cdsSpov.FieldByName('DtBOtp6').AsDateTime := r.dDtBOtp6;
      cdsSpov.FieldByName('DtEOtp6').AsDateTime := r.dDtEOtp6;
    end;
    if r.dDPR > 0 then
      cdsSpov.FieldByName('DPR').AsDateTime  := r.dDPR;
    if r.dDZR > 0 then
      cdsSpov.FieldByName('DZR').AsDateTime  := r.dDZR;
    if (r.dDPR > 0) and (r.dDZR > 0) then
      cdsSpov.FieldByName('KD').AsInteger  := Round(r.dDZR - r.dDPR) + 1;

    //if nCntDaysInMes <> 0 then
    cdsSpov.FieldByName('KdInMes').AsInteger := nCntDaysInMes;

    if r.bIsBln then
      cdsSpov.FieldByName('IsBln').AsBoolean   := r.bIsBln;
    if r.bIsOtp and ((r.nSmOtpPps <> 0) or (r.nSmOtpCmn <> 0)) then
      cdsSpov.FieldByName('IsOtp').AsBoolean   := r.bIsOtp;
    if r.nSm8711 <> 0 then
      cdsSpov.FieldByName('Sm8711').AsFloat   := RoundTo(r.nSm8711, -2);
    if r.nSm8712 <> 0 then
      cdsSpov.FieldByName('Sm8712').AsFloat   := RoundTo(r.nSm8712, -2);
    if r.nSm8713 <> 0 then
      cdsSpov.FieldByName('Sm8713').AsFloat   := RoundTo(r.nSm8713, -2);
    if r.nSm8715 <> 0 then
      cdsSpov.FieldByName('Sm8715').AsFloat   := RoundTo(r.nSm8715, -2);
    if r.nSm8716 <> 0 then
      cdsSpov.FieldByName('Sm8716').AsFloat   := RoundTo(r.nSm8716, -2);
    if r.nSm8717 <> 0 then
      cdsSpov.FieldByName('Sm8717').AsFloat   := RoundTo(r.nSm8717, -2);

    {
    cdsSpov.FieldByName('State').AsInteger := r.ST;
    cdsSpov.FieldByName('Num_Nak').AsString  := ''; // cNumNak;
    cdsSpov.FieldByName('Dt_Nak').AsString   := ''; // cDtNak;
    }
    if r.nKdNzp > nCntDaysInMes then
      r.nKdNzp := nCntDaysInMes;

    if r.nKdNzp <> 0 then
      cdsSpov.FieldByName('Kd_Nzp').AsInteger  := r.nKdNzp;

    if (r.nKdPTV <> 0) {and (dZaMG = d_DtBeg)} and r.bIsWrk then
      cdsSpov.FieldByName('Kd_PTV').AsInteger  := r.nKdPTV;

    if r.nNPC > 0 then
      cdsSpov.FieldByName('NPD').AsInteger := r.nNPC;

    cdsSpov.Post;
  end;
end; {Pishem}

//------------------------------------------------------------------------------
procedure TDMPF21.SbrosToSpov13;
begin
end;

//------------------------------------------------------------------------------
procedure TDMPF21.CopyToTbl_06;
begin
end;

//------------------------------------------------------------------------------
function TDMPF21.PeekUpi(
  nTabN : integer): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add('select * from z_UPI where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
function TDMPF21.PeekPrmUv(nTabN: integer; dOnDate: TDateTime): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select first 1 * ' +
      'from z_PrmUv ' +
      'where TabN = :nTabN ' +
        'and Dt_Priem <= :OnDate ' +
      'order by Dt_Priem desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('OnDate').AsDateTime := dOnDate;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
function TDMPF21.PeekPere(nTabN: integer; dOnDate: TDateTime; bExact: boolean): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select first 1 * from z_Pere ' +
      'where TabN = :TabN ' +
        'and Dt_Beg <= :OnDate ' +
      'order by Dt_Beg desc');

    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('OnDate').AsDateTime := dOnDate;
    Open;

    Result := RecordCount > 0;

    if not Result and not bExact then begin
      InitQuery(qryPeek);
      
      SQL.Add(
        'select first 1 * from z_Pere ' +
        'where TabN = :TabN ' +
      'order by Dt_Beg');
      ParamByName('TabN').AsInteger := nTabN;
      Open;
    end;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
// nOnDate - дата текущего перемещения
//------------------------------------------------------------------------------
function TDMPF21.PeekPrevPereForPrmUv(
  nTabN: integer;
  dOnDate: TDateTime): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select first 1 * ' +
      'from z_Pere p ' +
        'left join z_PrmUv u on u.TabN = p.TabN ' +
      'where ' +
        'p.TabN = :TabN ' +
        'and p.Dt_Beg <= :OnDate - 1 ' +
        'and u.Dt_Priem = ( ' +
          'select Max(Dt_Priem) ' +
          'from z_PrmUv ' +
          'where TabN = p.TabN and Dt_Priem <= p.Dt_Beg) ' +
        'and (:OnDate <= u.Dt_Uvoln or u.Dt_Uvoln is null) ' +
        'order by Dt_Beg desc');

    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('OnDate').AsDateTime := dOnDate;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
function TDMPF21.PeekNadb(nTabN: integer; cVidN: string; dOnDate: TDateTime): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select first 1 * from z_Nadb ' +
      'where TabN = :TabN ' +
        'and VidN = :VidN ' +
        'and Dt_Beg <= :OnDate ' +
        'and (Dt_End is null or Dt_End >= :OnDate) ' +
      'order by Dt_Beg desc');
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('VidN').AsString := cVidN;
    ParamByName('OnDate').AsDateTime := dOnDate;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
function TDMPF21.PeekVidN(cVidN: string): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select * from z_KdVidN ' +
      'where VidN = :VidN');
    ParamByName('VidN').AsString := cVidN;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
function TDMPF21.PeekOsnUvoln(nOsnUvoln: integer): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select * from Z_PidZviln ' +
      'where Code = :Code');
    ParamByName('Code').AsInteger := nOsnUvoln;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
function TDMPF21.PeekDekr(nTabN, nSpecNr: integer): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select v.Notes, v.NrList, v.DtList ' +
      'from z_otkl o ' +
        'left join z_vbln v on v.spec_nr = o.spec_nr ' +
      'where ' +
        'o.tabn = :TabN and ' +
        'o.dt_beg >= :DtBeg and o.dt_end <= :DtEnd ' +
        'and o.vidn = "2602"');

    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('DtBeg').AsDateTime := reportPeriod.Start;
    ParamByName('DtEnd').AsDateTime := reportPeriod.Finish;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
// Формирует SPOV cds
//------------------------------------------------------------------------------
procedure TDMPF21.PushToSpov(nTabN: integer; cds: TClientDataSet; recT6: TRecD1T6);
var
  dZaMG: TDateTime;
  cVidN: string;
  nSumma: double;

  bUvolen, bCPH: boolean;

  // *** /
  procedure IncSumma(fld: TField; nSumma: double);
  begin
    fld.AsFloat := fld.AsFloat + nSumma;
  end;

  // *** /
  procedure IncDays(fld: TField; nDays: integer);
  begin
    fld.AsInteger := fld.AsInteger + nDays;
  end;

  // *** /
  function CalcDays(dBeg, dEnd: TField): integer;
  begin
    Result := 0;
    if not dBeg.IsNull and not dEnd.IsNull then
      Result := Round(dEnd.AsDateTime - dBeg.AsDateTime + 1);
  end;

begin
  with qryNU do begin
    cVidN := FieldByName('VidN').AsString;
    dZaMG := FieldByName('ZaMesGod').AsDateTime;
    nSumma := FieldByName('Summa').AsFloat;

    bUvolen := false;
    if PeekPrmUv(nTabN, FieldByName('DtProc').AsDateTime) then
      if (qryPeek.FieldByName('Dt_Uvoln').AsDateTime < FieldByName('DtProc').AsDateTime)
      and (qryPeek.FieldByName('Dt_Uvoln').AsDateTime <> 0) then
        bUvolen := true;

    bCPH := FieldByName('KdKatP').AsInteger = KAT_PERS_GR_PRAV_DOG;
(* SB
    // Положительные суммы предыдущих месяцев плюсуются в текущий месяц
    // Отрицательные остаются в своих
    if (dZaMG < reportPeriod.Start) and (nSumma > 0) and not bUvolen and not bCPH
        and not VidIsOtpOsn(cVidN) and not VidIsOtpSovm(cVidN)
        and not VidIsBln(qryNU) and (cVidN <> '2602') {декрет} then begin
      recT6.PAY_MNTH := recT6.PERIOD_M;
      recT6.PAY_YEAR := recT6.PERIOD_Y;
    end;

    // Дни труд.отнош. - только если нач. за отчётный месяц или декрет.
    if ((dZaMG = d_CurPeriodBeg) or (cVidN = '2602')) and (nSumma <> 0)
        and (recT6.PAY_TP <> PAY_TP_DIF_MIN_ZP) then
      UpdatePTV(recT6);

    if cds.Locate('ZO;Pay_Tp;Pay_Mnth;Pay_Year;OTK;Exp;NRC' {;NRM},
        VarArrayOf([recT6.ZO, recT6.PAY_TP, recT6.PAY_MNTH, recT6.PAY_YEAR,
        recT6.OTK, recT6.EXP, recT6.NRC{, recT6.NRM}]),
        []) then begin
      cds.Edit;

      // Если NRM уже установлен в 1, перезаписывать нельзя.
      if cds.FieldByName('NRM').AsInteger = 0 then
        cds.FieldByName('NRM').AsInteger := recT6.nrm;

    end else begin
      cds.Append;

      cds.FieldByName('ZO').AsInteger := recT6.ZO;
      cds.FieldByName('Pay_Tp').AsInteger := recT6.PAY_TP;
      cds.FieldByName('Pay_Mnth').AsInteger := recT6.PAY_MNTH;
      cds.FieldByName('Pay_Year').AsInteger := recT6.PAY_YEAR;
      cds.FieldByName('OTK').AsInteger := recT6.OTK;
      cds.FieldByName('Exp').AsInteger := recT6.EXP;
      cds.FieldByName('NRC').AsInteger := recT6.NRC;
      cds.FieldByName('NRM').AsInteger := recT6.NRM;

      cds.FieldByName('TabN').AsInteger := nTabN;
      cds.FieldByName('ZaMG').AsDateTime := dZaMG;
    end;

    // договорные виды
    if (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008') then begin
      // Входит в число видов для пенс.фонда (ЕСВ)
      if (FieldByName('SP_PF').AsString = '1') then
        IncSumma(cds.FieldByName('SmDDgv'), nSumma);

      IncSumma(cds.FieldByName('SmDgv'), nSumma);

    // ср.зп по мобилизации
    end else if (cVidN = '1210') then
      IncSumma(cds.FieldByName('Sm1210'), nSumma)

    else if (cVidN = '5005') and  // неоплачиваемые виды
        not FieldByName('Dt_Beg').IsNull and not FieldByName('Dt_End').IsNull then
      cds.FieldByName('Kd_Nzp').AsInteger := CalcDays(FieldByName('Dt_Beg'), FieldByName('Dt_End'))

    else if (cVidN = '8711') and (dZaMG = d_CurPeriodBeg) then // ЕсвПрпДоМинЗплОбщ
      IncSumma(cds.FieldByName('Sm8711'), nSumma)

    else if (cVidN = '8712') and (dZaMG = d_CurPeriodBeg) then // ЕсвПрпДоМинЗплППС
      IncSumma(cds.FieldByName('Sm8712'), nSumma)

    else if (cVidN = '8713') and (dZaMG = d_CurPeriodBeg) then // СмДоМинЗп_1 (36.3%)
      IncSumma(cds.FieldByName('Sm8713'), nSumma)

    else if (cVidN = '8715') then // ЕсвПрпДоМинЗплБлн
      IncSumma(cds.FieldByName('Sm8715'), nSumma)

    else if (cVidN = '8716') then // ЕсвПрпДоМинЗплДекр
      IncSumma(cds.FieldByName('Sm8716'), nSumma)

    else if (cVidN = '8717') then   // СмДоМинЗп_2 (33,2%)
      IncSumma(cds.FieldByName('Sm8717'), nSumma)

    else if (cVidN > '2600') and (cVidN < '2700') then // все больнич.
      if cVidN = '2602' then begin //декретные - вид 2602
        IncDays(cds.FieldByName('KD_VP'),
          CalcDays(FieldByName('Dt_Beg'), FieldByName('Dt_End')));

        cds.FieldByName('DtBDekr').AsDateTime := FieldByName('Dt_Beg').AsDateTime;
        cds.FieldByName('DtEDekr').AsDateTime := FieldByName('Dt_End').AsDateTime;

        if FieldByName('DtProc').AsDateTime = d_CurPeriodBeg then begin
          IncSumma(cds.FieldByName('SmDekr'), nSumma);
          IncSumma(cds.FieldByName('SmDDekr'), nSumma);
        end;
      end else begin // больничные, не декретные

        IncSumma(cds.FieldByName('KD_NP'),
          Round(FieldByName('Dt_End').AsDateTime - FieldByName('Dt_Beg').AsDateTime + 1));

        IncSumma(cds.FieldByName('SmBln'), nSumma);
        IncSumma(cds.FieldByName('SmDBln'), nSumma);
      end
    else if (cVidN = '5011') {ОтпДо3лет} then begin

      // ******** recTotals.bOtp3 := true;

      cds.FieldByName('DtBOtp3').AsDateTime := FieldByName('Dt_Beg').AsDateTime;
      cds.FieldByName('DtEOtp3').AsDateTime := FieldByName('Dt_End').AsDateTime;

    end else if (cVidN = '5012') {ОтпДо6лет} then begin
      // ******** recTotals.bOtp6 := true;

      cds.FieldByName('DtBOtp6').AsDateTime := FieldByName('Dt_Beg').AsDateTime;
      cds.FieldByName('DtEOtp6').AsDateTime := FieldByName('Dt_End').AsDateTime;

    end else if (cVidN = '6201') then  // удерж. в ЕСВ с общ.видов с сотр.
      IncSumma(cds.FieldByName('SmPCmn'), -nSumma)

    else if (cVidN = '6206') then  // удерж. в ЕСВ с ППС-видов с сотр.
      IncSumma(cds.FieldByName('SmPPPS'), -nSumma)

    else if (cVidN = '6211') then {begin} // удерж. в ЕСВ с Bln-видов
      IncSumma(cds.FieldByName('SmPBln'), -nSumma)

    else if (cVidN = '6212') then begin // удерж. в ЕСВ с Dkr-видов
      if FieldByName('DtProc').AsDateTime = d_CurPeriodBeg then
        IncSumma(cds.FieldByName('SmPDekr'), -nSumma);

    end else if (cVidN = '6216') then  // удерж в ЕСВ с дгв-видов с сотр.
      IncSumma(cds.FieldByName('SmPDgv'), -nSumma)

    else if (cVidN = '8681') then  // с предпр.
      IncSumma(cds.FieldByName('SmPrpCmn'), -nSumma)

    else if (cVidN = '8682') then  // с предпр.
      IncSumma(cds.FieldByName('SmPrpPPS'), -nSumma)

    else if (cVidN = '8683') then  // с предпр.
      IncSumma(cds.FieldByName('SmPrpInvCmn'), -nSumma)

    else if (cVidN = '8684') then  // с предпр.
      IncSumma(cds.FieldByName('SmPrpInvPPS'), -nSumma)

    else if (cVidN = '8685') or (cVidN = '8686') then  // с предпр.
      IncSumma(cds.FieldByName('SmPrpBln'), -nSumma)

    else if (cVidN = '8687') or (cVidN = '8688') then  // с предпр.
      IncSumma(cds.FieldByName('SmPrpDekr'), -nSumma)

    else if (cVidN = '8691') then  // с предпр.
      IncSumma(cds.FieldByName('SmPrpDgv'), -nSumma)

    else if (cVidN = '8606') then
      IncSumma(cds.FieldByName('SvPCmn'), nSumma)

    else if (cVidN = '8607') then
      IncSumma(cds.FieldByName('SvPPPS'), nSumma)

    else if (cVidN = '8608') then
      IncSumma(cds.FieldByName('SvPBln'), nSumma)

    else if (cVidN = '8609') then
      IncSumma(cds.FieldByName('SvPDekr'), nSumma)

    else if (cVidN = '8610') then
      IncSumma(cds.FieldByName('SvPDgv'), nSumma)

    else if (cVidN > '2400') and (cVidN < '2500') or (cVidN = '1810') then begin //неиспользов.

      // ******** recTotals.bOtp := true;

      if FieldByName('KdKatP').AsInteger = 1 then
        IncSumma(cds.FieldByName('SmOtpPPS'), nSumma)
      else
        IncSumma(cds.FieldByName('SmOtpCmn'), nSumma);

      if (FieldByName('SP_PF').AsString = '1') then
        if FieldByName('KdKatP').AsInteger = 1 then
          IncSumma(cds.FieldByName('SmDOtpPPS'), nSumma)
        else
          IncSumma(cds.FieldByName('SmDOtpCmn'), nSumma);

    end else if (cVidN < '5000') then begin // все остальные виды начислений
      if nSumma > 0 then begin
        // начисленные положит.суммы (должны "уйти" в ЗаМГ месяца отчёта)
        if (FieldByName('KdKatP').AsInteger = 1) {ППС} then begin
          IncSumma(cds.FieldByName('SmPmPPS'), nSumma);
          if (FieldByName('SP_PF').AsString = '1') then
            IncSumma(cds.FieldByName('SmPmDPPS'), nSumma);
        end else {не ППС} begin
          IncSumma(cds.FieldByName('SmPmCmn'), nSumma);
          if (FieldByName('SP_PF').AsString = '1') then
            IncSumma(cds.FieldByName('SmPmDCmn'), nSumma);
        end
      end else begin
        // начисленные отрицат.суммы (должны остаться в "своих" ЗаМГ)
        if (FieldByName('KdKatP').AsInteger = 1) {ППС} then begin
          IncSumma(cds.FieldByName('SmPPS'), nSumma);
          if (FieldByName('SP_PF').AsString = '1') then
            IncSumma(cds.FieldByName('SmDPPS'), nSumma);
        end else {не ППС} begin
          IncSumma(cds.FieldByName('SmCmn'), nSumma);
          if (FieldByName('SP_PF').AsString = '1') then
            IncSumma(cds.FieldByName('SmDCmn'), nSumma);
        end;
      end;
    end;

    cds.Post;
*)
  end; {with qryNU}
end; {PushToSpov}

//------------------------------------------------------------------------------
function TDMPF21.MyLocate(
  cNUMIDENT, cPROF, cPID, cPID_ZV: string;
  dSTART_DT, dEND_DT: TDateTime;
  nZO, nDOG_CPH, nPIR, nVS: integer): boolean;
var
  NUMIDENT, PROF, PID, PID_ZV: string;
  START_DT, END_DT: TDateTime;
  ZO, DOG_CPH, PIR, VS: integer;
begin
  with tbl_05 do begin
    First;
    Result := false;

    while not EOF do begin
      NUMIDENT := FieldByName('NUMIDENT').AsString;
      PROF := FieldByName('PROF').AsString;
      PID := FieldByName('PID').AsString;
      PID_ZV := FieldByName('PID_ZV').AsString;
      START_DT := FieldByName('START_DT').AsDateTime;
      END_DT := FieldByName('END_DT').AsDateTime;
      ZO := FieldByName('ZO').AsInteger;
      DOG_CPH := FieldByName('DOG_CPH').AsInteger;
      PIR := FieldByName('PIR').AsInteger;
      VS := FieldByName('VS').AsInteger;

      Result := NUMIDENT = cNUMIDENT;
      Result := Result and (PROF = cPROF);
      Result := Result and (PID = cPID);
      Result := Result and (PID_ZV = cPID_ZV);
      Result := Result and (START_DT = dSTART_DT);
      Result := Result and (END_DT = dEND_DT);
      Result := Result and (ZO = nZO);
      Result := Result and (DOG_CPH = nDOG_CPH);
      Result := Result and (PIR = nPIR);
      Result := Result and (VS = nVS);

      if Result then
        break;

      Next;
    end; {while}
  end; {with}
end;

//------------------------------------------------------------------------------
// Запись в таблицу 5
//------------------------------------------------------------------------------
procedure TDMPF21.WriteToTbl05(
  nTabN : integer;
  nMM, nYYYY, nZO, nDogCPH : SmallInt;
  nOldKdOK, nNewKdOK : SmallInt;
  cTIN, cFam, cIma, cOtch, cPidZv : ShortString;
  dStartDt, dEndDt: TDateTime; cPID: ShortString;
  nIsPerevod: integer;
  nVnutrSovm: integer);
var
  cDolgnOK, cCode, cD_zkpp, cNameD, cNameFull: ShortString;
  dOnDate: TDateTime;
  bLocate: boolean;
begin
  cD_zkpp := ''; cNameD := ''; cNameFull := '';

  with tbl_05 do begin
    if nZO in [T5_ZO_TR_KN, T5_ZO_NO_TR_KN] then begin
      if ((cPidZv = 'Інша') or (AnsiUpperCase(Copy(cPidZv, 1, 3)) = 'СТ.')) then
        DmMain.GetOkRkvzt(nOldKdOK, cDolgnOK, cCode, cD_zkpp, cNameD, cNameFull)
      else
        DmMain.GetOkRkvzt(nNewKdOK, cDolgnOK, cCode, cD_zkpp, cNameD, cNameFull);

      cNameFull := CyrUpper(Copy(cNameFull, 1, 1)) + Copy(cNameFull, 2, Length(cNameFull) - 1);
      cDolgnOk := CyrUpper(Copy(cDolgnOk, 1, 1)) + Copy(cDolgnOk, 2, Length(cDolgnOk) - 1);

      {cNameFull := 'Керівник допризовної підготовки (військовий керівник)';
      cCode := '1229.7';
      cDolgnOk := 'Енохімік';}
    end;


    bLocate := MyLocate(cTIN, cCode, cPID, cPidZv,
      dStartDt, dEndDt, nZO,nDogCPH,nIsPerevod, nVnutrSovm);

    if not bLocate then begin

      cPidZv := Trim(cPidZv);

      If (nZO = 3) then begin
        if dStartDt > 0 then
          dOnDate := dStartDt
        else if dEndDt > 0 then
          dOnDate := dEndDt
        else
          dOnDate := reportPeriod.Start;

        { SB
        with qryTmp2 do begin
          if Active then Close;
          DataBaseName := CESMAIN;
          SQL.Clear;
          SQL.Add('Select first 1 * from z_Pere where TabN = :nTabN and ' +
                  ' Dt_Beg <= :dOnDate order by Dt_Beg desc');
          ParamByName('nTabN').AsInteger := nTabN;
//          ParamByName('dOnDate').AsDateTime := d_CurPeriodBeg;
          ParamByName('dOnDate').AsDateTime := dOnDate;
          Open;

          If RecordCount > 0 then begin
            If FieldByName('KdKatp').AsInteger <> 13 then
             nDogCPH := 1;
          end;
          Close;
          SQL.Clear;
          DataBaseName := '';
        end;
        }
      end;

      Append;

      FieldByName('PERIOD_M').AsInteger   := nMM;
      FieldByName('PERIOD_Y').AsInteger   := nYYYY;
      FieldByName('UKR_GROMAD').AsInteger := GROMAD_UKR;
      FieldByName('ZO').AsInteger         := nZO;
      FieldByName('DOG_CPH').AsInteger    := nDogCPH;
      FieldByName('NUMIDENT').AsString    := cTin;
      FieldByName('LN').AsString          := cFam;
      FieldByName('NM').AsString          := cIma;
      FieldByName('FTN').AsString         := cOtch;

      if dStartDt <> 0 then
        FieldByName('START_DT').AsDateTime := dStartDt;

      if dEndDt <> 0 then
        FieldByName('END_DT').AsDateTime   := dEndDt;

      FieldByName('NRM_DT').AsString      := ''; // всегда
      FieldByName('PID_ZV').AsString      := cPidZv;
      FieldByName('PNR').AsString         := cNameFull;
      FieldByName('Prof').AsString        := cCode;
      FieldByName('Pos').AsString         := cDolgnOk;
      FieldByName('PID').AsString         := cPid;
      FieldByName('VZV').AsString         := ''; // всегда
      FieldByName('VS').AsInteger         := nVnutrSovm;
      FieldByName('PIR').AsInteger        := nIsPerevod;
      // FieldByName('OZN').AsInteger        := 0; // Ничего не пишем

      Post;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Запись в таблицу 6
//------------------------------------------------------------------------------
procedure TDMPF21.WriteToTbl06(
  recT6: TRecD1T6;
  nOTK, nZO, nPay_TP, nPay_Mnth, nPay_Year,
  nKdNP, nKdNZP, nKdPTV, nKdVP,
  nNRC, nNRM, nExp: SmallInt;
  nSmTotal, nSmMax, nSmIns, nSmDiff, nSmNarah : double);
var
  nDays: integer;
begin
  nDays := MyLastDayOM(EncodeDate(nPAY_YEAR, nPAY_MNTH, 1));

  with tbl_06 do begin
    if not Locate('NUMIDENT;PERIOD_M;PERIOD_Y;ZO;PAY_TP;PAY_MNTH;PAY_YEAR;OTK;EXP;NRC',
        VarArrayOf([recT6.numident,recT6.period_m,recT6.period_y,nZO,nPay_tp,
        nPay_mnth,nPay_year,nOtk,nExp,nNRC]), []) then
      Append
    else
      Edit;

    FieldByName('PERIOD_M').AsInteger := recT6.period_m; // Месяц отчётного периода
    FieldByName('PERIOD_Y').AsInteger := recT6.period_y; // Год отчётного периода

    FieldByName('UKR_GROMAD').AsInteger := recT6.ukr_gromad; // Гражданство

    FieldByName('ST').AsInteger      := recT6.st;       // Пол
    FieldByName('NUMIDENT').AsString := recT6.numident; // Налоговый номер
    FieldByName('LN').AsString       := recT6.ln;       // Фамилия
    FieldByName('NM').AsString       := recT6.nm;       // Имя
    FieldByName('FTN').AsString      := recT6.ftn;      // Отчество

    FieldByName('ZO').AsInteger      := nZO;       // Тип отчётной особы

    if nPay_TP <> 0 then
      FieldByName('PAY_TP').AsInteger := nPay_TP;   // Тип начисления

    FieldByName('PAY_MNTH').AsInteger := nPay_Mnth; // Месяц начислений
    FieldByName('PAY_YEAR').AsInteger := nPay_Year; // Год начислений

    FieldByName('KD_NP').AsInteger := Min(nDays,
      FieldByName('KD_NP').AsInteger + nKdNP);       // Дней неработоспособности

    FieldByName('KD_NZP').AsInteger := Min(nDays,
      FieldByName('KD_NZP').AsInteger + nKdNZP);     // Неоплачиваемых дней

    FieldByName('KD_PTV').AsInteger := Min(nDays,
      FieldByName('KD_PTV').AsInteger + nKdPTV);    // Дней в трудовых отношениях

    FieldByName('KD_VP').AsInteger := Min(nDays,
      FieldByName('KD_VP').AsInteger + nKdVP);      // Декретных дней

    FieldByName('SUM_TOTAL').AsFloat :=
      FieldByName('SUM_TOTAL').AsFloat + nSmTotal;  // Общая сумма начисленной зарплаты

    FieldByName('SUM_MAX').AsFloat :=
      FieldByName('SUM_MAX').AsFloat + nSmMax;      // Сумма на которую нач. ед.взнос

    FieldByName('SUM_INS').AsFloat :=
      FieldByName('SUM_INS').AsFloat + nSmIns;      // Сумма удержанного единого взноса

    FieldByName('SUM_DIFF').AsFloat :=
      FieldByName('SUM_DIFF').AsFloat + nSmDiff;    // Разница между мин. з/п. и фактич.

    FieldByName('SUM_NARAH').AsFloat :=
      FieldByName('SUM_NARAH').AsFloat + nSmNarah;  // Сумма начисленного единого взноса

    FieldByName('OTK').AsInteger := nOTK; // Трудовая книжка на предприятии
    FieldByName('EXP').AsInteger := nExp; // Спецстаж
    FieldByName('NRC').AsInteger := nNRC; // Неполный рабочий день
    FieldByName('NRM').AsInteger := 0;    // Новое рабочее место

    Post;
  end;
end; {WriteToTbl06}

//------------------------------------------------------------------------------
// Пишем в таблицу 7
//------------------------------------------------------------------------------
procedure TDMPF21.WriteToTbl07(
  nTabN: integer;
  dZaMG: TDateTime;
  recT6: TRecD1T6;
  cPID: string;
  nNormZ,
  nHH, nMM, nNorma, nSeason: integer);
begin
(*
  with tbl_07 do begin
    if not locate('numident;c_pid;hh;mm;norma_1;seazon',
        VarArrayOf([recT6.numident, cPId, nHH, nMM, nNorma, nSeason]), []) then begin

      // Пребывание в трудовых отношениях
      CreOpenCdsPTV_PPS(nTabN, dZaMG);

      cdsPTV_PPS.First;

      while not cdsPTV_PPS.Eof do begin
        Append;

        FieldByName('Period_M').AsInteger   := recT6.period_m;
        FieldByName('Period_Y').AsInteger   := recT6.period_y;
        FieldByName('Ukr_Gromad').AsInteger := recT6.ukr_gromad;
        FieldByName('NumIdent').AsString    := recT6.numident;
        FieldByName('LN').AsString          := recT6.ln;
        FieldByName('NM').AsString          := recT6.nm;
        FieldByName('FTN').AsString         := recT6.ftn;
        FieldByName('C_PID').AsString       := cPId;
        FieldByName('Start_Dt').AsInteger   := cdsPTV_PPSStart_Dt.AsInteger;
        FieldByName('Stop_Dt').AsInteger    := cdsPTV_PPSStop_Dt.AsInteger;
        FieldByName('Days').AsInteger       := cdsPTV_PPSDays.AsInteger;
        FieldByName('HH').AsInteger         := nHH;
        FieldByName('MM').AsInteger         := nMM;
        FieldByName('Norma_1').AsInteger    := nNorma;
        FieldByName('Num_Nak').AsString     := ''; // всегда пусто cdsPTV_PPSNum_Nak.AsString;
        FieldByName('Dt_Nak').AsString      := ''; // всегда пусто cdsPTV_PPSDt_Nak.AsString;
        FieldByName('Seazon').AsInteger     := 0;  // всегда пусто nSeason;

        Post;

        cdsPTV_PPS.Next;
      end; {while}
    end; {if}
  end; {with}
*)
end; {WriteToTbl07}

//------------------------------------------------------------------------------
procedure TDMPF21.WriteNadb(
  nTabN: integer;
  cTin, cFam, cIma, cOtch: string;
  recNadb: TRecNadb);
var
  nYB, nMB, nYE, nME, dummyWord: word;
begin
  // В результате слияний надбавок вышли на ситуацию, когда и начало и конец диапазона
  // лежат вне отчётного периода. Ничего не пишем
  if (recNadb.Range.Start = 0) and (recNadb.Range.Finish = 0) then
    exit;

  // Основание должно быть указано всегда. Нет одного - используем другое
  if Trim(recNadb.PidBeg) = '' then
    recNadb.PidBeg := recNadb.PidEnd;
  if Trim(recNadb.PidEnd) = '' then
    recNadb.PidEnd := recNadb.PidBeg;

  DecodeDate(recNadb.Range.Start, nYB, nMB, dummyWord);
  DecodeDate(recNadb.Range.Finish, nYE, nME, dummyWord);

  // Если обе даты заданы и относятся к разным месяцам, разносим на две записи
  if (recNadb.Range.Start <> 0) and (recNadb.Range.Finish <> 0) and
      ((nYB <> nYE) or (nMB <> nME)) then begin
    WriteToTbl05(nTabN, nMB, nYB, recNadb.ZO, recNadb.DogCPH, recNadb.KdDlzhn, recNadb.KdDlzhn,
      cTIN, cFam, cIma, cOtch, '', recNadb.Range.Start, 0,
      recNadb.PidBeg, 0, recNadb.VS);

    WriteToTbl05(nTabN, nME, nYE, recNadb.ZO, recNadb.DogCPH, recNadb.KdDlzhn, recNadb.KdDlzhn,
      cTIN, cFam, cIma, cOtch, recNadb.PidZv, 0, recNadb.Range.Finish,
      recNadb.PidEnd, 0, recNadb.VS);
  end else begin
    // Если либо одна из дат опущена, либо обе относятся к одному месяцу, пишем одной записью
    WriteToTbl05(nTabN, nMB, nYB, recNadb.ZO, recNadb.DogCPH, recNadb.KdDlzhn, recNadb.KdDlzhn,
      cTIN, cFam, cIma, cOtch, recNadb.PidZv, recNadb.Range.Start, recNadb.Range.Finish,
      recNadb.PidEnd, 0, recNadb.VS);
  end;
end;

//------------------------------------------------------------------------------
function TDMPF21.InitD5T5: TRecD5T5;
var
  dummyWord: word;
begin
  DecodeDate(reportPeriod.Start, Result.PERIOD_Y, Result.PERIOD_M, dummyWord);
  // Result.UKR_GROMAD := GROMAD_UKR;
  Result.ZO := 0;
  Result.DOG_CPH := 0;
  Result.NUMIDENT := '';
  Result.LN := '';
  Result.NM := '';
  Result.FTN := '';
  Result.START_DT := 0;
  Result.END_DT := 0;
  // Result.NRM_DT := '';
  Result.PID_ZV := '';
  // Result.PNR := '';
  // Result.PROF := '';
  // Result.POS := '';
  Result.PID := '';
  // Result.VZV := '';
  Result.VS := 0;
  Result.PIR := 0;
  // Result.OZN := 0;
end; {InitD5T5}

//------------------------------------------------------------------------------
function TDMPF21.InitD1T6: TRecD1T6;
var
  dummyWord: word;
begin
  DecodeDate(reportPeriod.Start, Result.PERIOD_Y, Result.PERIOD_M, dummyWord);
  Result.UKR_GROMAD := GROMAD_UKR;
  Result.ST := 0;
  Result.NUMIDENT := '';
  Result.LN := '';
  Result.NM := '';
  Result.FTN := '';
  Result.ZO := T6_ZO_CMN;
  Result.PAY_TP := 0;
  Result.PAY_MNTH := 0;
  Result.PAY_YEAR := 0;
  Result.KD_NP := 0;
  Result.KD_NZP := 0;
  Result.KD_PTV := 0;
  Result.KD_VP := 0;
  Result.SUM_TOTAL := 0;
  Result.SUM_MAX := 0;
  Result.SUM_DIFF := 0;
  Result.SUM_INS := 0;
  Result.SUM_NARAH := 0;
  Result.OTK := 1;
  Result.EXP := 0;
  Result.NRC := 0;
  Result.NRM := 0;
  Result.OZN := 0;
end; {InitD1T6}

//------------------------------------------------------------------------------
// Заполняет часть полей для таблицы 6 из перемещенй
// Заполняемые поля: period_m, period_y, zo, otk, exp, nrc, nrm
//------------------------------------------------------------------------------
procedure TDMPF21.FillT6Pere(nTabN: integer; var recT6: TRecD1T6);
var
  dOnDate: TDateTime;
  dummyWord: Word;
begin
  with qryNU do begin
    DecodeDate(FieldByName('DtProc').AsDateTime, recT6.PERIOD_Y, recT6.PERIOD_M, dummyWord);

    dOnDate := FieldByName('Dt_Beg').AsDateTime;
    if dOnDate = 0 then
      dOnDate := FieldByName('ZaMesGod').AsDateTime;

    if PeekPere(FieldByName('TabN').AsInteger, dOnDate, false) then
      with qryPeek do begin
        // ППС или общая категорияд
        recT6.EXP := KatPToExp(FieldByName('KdKatP').AsInteger);

      if FieldByName('Inv').AsInteger <> 0 then begin
        if recT6.EXP = 1 then
          recT6.ZO := T6_ZO_PPS_INV
        else
          recT6.ZO := T6_ZO_INV
      end else begin
        if recT6.EXP = 1 then
          recT6.ZO := T6_ZO_CMN
        else
          recT6.ZO := T6_ZO_PPS
      end;

        recT6.OTK := SovmToOTK(FieldByName('Sovm').AsInteger);

        // Неполный рабочий день
        if (FieldByName('PrcWrkTime').AsInteger <> 0)
            and (FieldByName('PrcWrkTime').AsInteger <> 100) then
        recT6.NRC := 1;

        // Новое рабочее место. ВСЕГДА ПУСТО
        // if not PeekPrevPereForPrmUv(nTabN, FieldByName('Dt_Beg').AsDateTime) then
        //   recT6.nrm := 1;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Заполняет поля Приложения 1:
// - уточняет ранее заполненные на основании z_pere;
// - заполняет на основании qryNU.
//------------------------------------------------------------------------------
procedure TDMPF21.FillT6NU(var recT6: TRecD1T6);
var
  cVidN: string;
  nKdKatP: integer;
  nY, nM, dummyWord: Word;
begin
  with qryNU do begin
    DecodeDate(FieldByName('ZaMesGod').AsDateTime, nY, nM, dummyWord);
    recT6.PAY_MNTH := nM;
    recT6.PAY_YEAR := nY;

    cVidN := FieldByName('VidN').AsString;
    nKdKatP := FieldByName('KdKatP').AsInteger;

    if (recT6.ZO <> T6_ZO_INV) and (recT6.ZO <> T6_ZO_PPS_INV) then begin
      if cVidN = '2602' then // Декрет
        recT6.ZO := T6_ZO_DEKR
      else if (cVidN = '5011') or (cVidN = '5012') then // Уход за ребёнком
        recT6.ZO := T6_ZO_CHILD_CARE
      else if cVidN = '1210' then // Средняя з/п по мобилизации
        recT6.ZO := T6_ZO_MOB

      else if nKdKatP = KAT_PERS_PPS then
        recT6.ZO := T6_ZO_PPS
      else if NUIsCPH then
        recT6.ZO := T6_ZO_CPH
      else
        recT6.ZO := T6_ZO_CMN;
    end;

    if (cVidN >= '2401') and (cVidN <= '2411') then
      recT6.PAY_TP := PAY_TP_OTP
    else if (cVidN = '8711' ) or (cVidN = '8712' ) or (cVidN = '8713' ) or
        (cVidN = '8714' ) or (cVidN = '8715' ) or (cVidN = '8716' ) or (cVidN = '8717' ) then
      recT6.PAY_TP := PAY_TP_DIF_MIN_ZP;

    if NUIsCPH then
      recT6.PAY_TP := 1;

    if NUIsSovm or NUIsCPH then
      recT6.OTK := 0;
  end;
end; {FillT6NU}

end.
