unit z_PfRs21T6;

interface

uses
  Classes, DBTables, DBClient,
  sb_DateUtils;

type
  TUpiRec = record
    TIN,
    Fam, Ima, Otch,
    Gender: string;
  end;

  TNuRec = record
    VidN: string;
    Period: TPeriod;
  end;

  TT6Rec = record
    PERIOD_M,       // ключ
    PERIOD_Y,       // ключ
    PAY_MNTH,       // ключ
    PAY_YEAR: word; // ключ
    UKR_GROMAD,
    ST: integer;
    NUMIDENT,       // ключ
    LN,
    NM,
    FTN: string;
    ZO,             // ключ
    PAY_TP,         // ключ
    KD_NP,
    KD_NZP,
    KD_PTV,
    KD_VP: integer;
    SUM_TOTAL,
    SUM_MAX,
    SUM_DIFF,
    SUM_INS,
    SUM_NARAH: double;
    OTK,            // ключ
    EXP,            // ключ
    NRC,            // ключ
    NRM,
    OZN: integer;
  end;

  TT7D6Rec = record
  end;

  TTotals = record
    periodWrk,
    periodDekr,
    periodOtp3,
    periodOtp6: TPeriod;

    nSmCmn,
    nSmDCmn,
    nSmPmCmn,
    nSmPmDCmn,
    nSmPCmn,
    nSvPCmn,
    nSmPrpCmn,

    nSmPps,
    nSmDPps,
    nSmPmPps,
    nSmPmDPps,
    nSmPPps,
    nSvPPps,
    nSmPrpPps,

    nSmOtpCmn,
    nSmDOtpCmn,
    nSmPrpInvCmn,
    nSmOtpPps,
    nSmDOtpPps,
    nSmPrpInvPps,

    nSmBln,
    nSmDBln,
    nSmPBln,
    nSvPBln,
    nSmPrpBln,

    nSmDekr,
    nSmDDekr,
    nSmPDekr,
    nSvPDekr,
    nSmPrpDekr,

    nSmDgv,
    nSmDDgv,
    nSmPDgv,
    nSvPDgv,
    nSmPrpDgv,

    // nSmPmPrpInvCmn,

    nSmVozvr,
    nSmDVozvr,
    nSmPVozvr,

    nSm1210,

    nSm8711,
    nSm8712,
    nSm8713,
    nSm8715,
    nSm8716,
    nSm8717: double;

    cPidZv: string;

    nKdNpBln,
    nKdNpDkr,
    nKdNzp,
    nKdPTV: integer;

    bIsWrk,
    bIsInv,
    bIsBln,
    bIsOtp,
    bIsDekr,
    bIsOtp3,
    bIsOtp6,
    bIsPps: boolean;

    nOTK: integer;
    nNPC: integer;
  end;

  TSpovT6Runner = class
  private
    qry_PrmUv,
    qry_Pere,
    qry_NU,
    qry_IsWrk,
    qry_Peek: TQuery; // запрос для выборки начислений/удержаний

    cds_Spov,
    cds_PTV_PPS,
    cds_T6,
    cds_Prc: TClientDataset;

    TblT6,
    TblT7: TTable;

    period_Report: TPeriod; // отчётный период
    b_SpsOnly: boolean; // обрабатывать только заданные табельные номера
    s_TabNums: TStrings; // список табельных номеров

    n_NUCurRow: integer;

    UpiRec: TUpiRec;

    constructor Create(qryNU: TQuery; reportPeriod: TPeriod; spsOnly: boolean; tabNums: TStrings);
    procedure OpenQryNU;
    procedure Start;

    procedure ProcessNU;
    procedure AccumulateTotals(r: TTotals; recNU: TNuRec; nSumma: double);
    procedure WriteToCdsSpov(nTabN: integer; dZaMG: TDateTime; r: TTotals);
    procedure SbrosToSpov13;
    procedure CopyToTbl_06;

    procedure CreOpenCdsPtv_PPS(nTabN : integer; dZaMG : TDateTime);
    procedure AddRecInCdsID_TabN(nTabN : integer; cID : ShortString);

    procedure AddRecInCdsT6(nMySort, nOTK, nZO, nPAY_TP, nPAY_MNTH, nPAY_YEAR,
      nKD_NP, nKD_NZP, nKD_PTV, nKD_VP, nNPC, nEXP: SmallInt;
      nSUM_TOTAL, nSUM_MAX, nSUM_INS, nSUM_DIFF, nSUM_NARAH: double;
      cMyType: ShortString; dZaMG: TDateTime);

    procedure WriteToTbl06(recT6: TT6Rec;
      nOTK, nZO, nPay_TP, nPay_Mnth, nPay_Year,
      nKdNP, nKdNZP, nKdPTV, nKdVP,
      nNRC, nNRM, nExp: SmallInt;
      nSmTotal, nSmMax, nSmIns, nSmDiff, nSmNarah : double);

    procedure WriteToTbl07(nTabN: integer; dZaMG: TDateTime; recT6: TT6Rec; cPID: string;
      nNormZ, nHH, nMM, nNorma, nSeason: integer);

    function IsInvalid(nPRR : SmallInt) : boolean;

    class function InitNuRec: TNuRec;
    function InitT6Rec: TT6Rec;
    function InitTotals: TTotals;

    procedure DisplayProgressT67(nCurRow, nRowsTotal: integer;
      cStepName, cState: string);

    function GetT6KeyValues: TT6Rec;
    function GetActualWrkPeriod(periodZaMesGod: TPeriod): TPeriod;
    function GetKdPTV(nTabN: integer; dZaMG: TDateTime): TPeriod;

  public
    class procedure Process(
      qryNU: TQuery;
      reportPeriod: TPeriod;
      spsOnly: boolean;
      tabNums: TStrings);
  end;

implementation

uses
  SysUtils, Math, Variants, A_CONST, A_LIB, Z_DM, z_PfRs21Cmn, sb_Peeks;

const
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

  OTK_TRUD_KN_YES = 1; // Трудовая книжка на предприятии
  OTK_NO_TRUD_KN = 0;  // Иначе

  VIDN_CHILD_3Y = '5011'; // Уход за детьми до 3х лет
  VIDN_CHILD_6Y = '5012'; // Уход за детьми до 6ти лет

  PAY_TP_CPH = 1;         // Договорные
  PAY_TP_OTP = 10;        // Суммы отпускных
  PAY_TP_DIF_MIN_ZP = 13; // Разница между мин.з/п и факт.нач.

//------------------------------------------------------------------------------
// Вызов обработчика
//------------------------------------------------------------------------------
class procedure TSpovT6Runner.Process(
  qryNU: TQuery;
  reportPeriod: TPeriod;
  spsOnly: boolean;
  tabNums: TStrings);
var
  runner: TSpovT6Runner;
begin
  runner := TSpovT6Runner.Create(qryNU, reportPeriod, spsOnly, tabNums);
  runner.Start;
  runner.Free;
end;

//------------------------------------------------------------------------------
// Конструктор
//------------------------------------------------------------------------------
constructor TSpovT6Runner.Create(
  qryNU: TQuery;
  reportPeriod: TPeriod;
  spsOnly: boolean;
  tabNums: TStrings);
begin
  Self.qry_NU := qryNU;
  Self.period_Report := reportPeriod;
  Self.b_SpsOnly := spsOnly;
  Self.s_TabNums := tabNums;
end;

//------------------------------------------------------------------------------
// Запуск выполнения
//------------------------------------------------------------------------------
procedure TSpovT6Runner.Start;
begin
  OpenQryNU;
  n_NUCurRow := 0;

  with qry_NU do begin
    DisplayProgressT67(n_NUCurRow, RecordCount, 'Обработка начислений/удержаний', 'Начало');
    ProcessNU;
    DisplayProgressT67(n_NUCurRow, RecordCount, 'Обработка начислений/удержаний', 'Окончание');
  end;

  ReleaseQuery(qry_NU);
end;

//------------------------------------------------------------------------------
// Выборка начислений/удержаний для таблицы6/приложение1
//------------------------------------------------------------------------------
procedure TSpovT6Runner.OpenQryNU;
begin
  InitQuery(qry_Nu);

  with qry_Nu do begin
    SQL.Add('Set generator My_Gen_ID to 0');
    ExecSQL;

    InitQuery(qry_Nu);
    SQL.Add(
      'select ' +
        'Gen_Id(My_Gen_ID, 1) as NR, ' +
        'n.ZaMesGod, n.DtProc, ' +
        'u.Fam, u.Ima, u.Otch, u.ID, u.Pol, ' +
        'n.TabN, ' +
        'n.VidN, n.ShVidN, ' +
        'Round(Sum(n.Summa), 2) Summa, ' +
        'n.Dt_Beg, n.Dt_End, ' +
        'n.KdKatP, n.PdN, n.PRR, n.PrPv, n.Kto, n.PrKr, n.Spov, ' +
        'n.Sp_PF, n.Bolnic, n.CBudg, n.Sovm ' +
      'from ' +
        'viNu_Main n ' +
        'left join z_Upi u on u.TabN = n.TabN ' +
      'where (' +
        'not u.id is null and u.id <> "" and ' +
        'n.DtProc >= :dDtBeg and n.DtProc <= :dDtEnd and ' +
        '(' +
            // Средняя ЗП по мобилизации. Т.е., мобилизован
            // (либо через Надбавки, либо через Отклонения
            'n.VidN = "1210" ' +
            // Неоплачиваемые виды: невыясн.прич., прогулы, отпуска б/опл.
            'or n.VidN in ("5002","5003","5004","5005","5006","5011","5012") and n.Chas > 0 ' +
            'or ' +
            '(' +
                // Все начисления (кроме Прочих, которые фактически являются удержаниями)
                'n.VidN < "5000" and not n.VidN in ("2705","2723","2724") ' +
                // ЕСВ (удержания)
                'or n.VidN >= "6201" and n.VidN <= "6216" ' +
                // Взносы с предприятия: Сверхпороги и ЕСВ
                'or n.VidN in (' +
                  '"8606","8607","8608","8609","8610","8681","8682","8683", ' +
                  '"8684","8685","8686","8687","8688","8691") ' +
            ') and n.Sp_PF = "1" ' +
            // Различные ДоМинЗП и ЕСВ с ДоМинЗП
            'or n.VidN >= "8711" and n.VidN <= "8717" ' +
        ') ' +
        // Декретные
        'or n.VidN = "2602" and n.DtProc >= :dDtBeg and n.DtProc <= :dDtEnd) '
    );

    if b_SpsOnly and (s_TabNums.Count > 0) then
      SQL.Add('and n.TabN in (' + s_TabNums.Text + ') ');

    SQL.Add(
      'group by ' +
        'n.ZaMesGod, n.DtProc, u.Fam, u.Ima, u.Otch, u.ID, ' +
        'u.Pol, n.TabN, n.VidN, n.ShVidN, n.Dt_Beg, n.Dt_End, ' +
        'n.KdKatP, n.PdN, n.PRR, n.PrPv, n.Kto, n.PrKr, n.Spov, ' +
        'n.Sp_PF, n.Bolnic, n.CBudg, n.Sovm ' +
      'order by u.ID, n.ZamesGod, n.VidN, n.KdKatP desc, n.PRR'
    );

    ParamByName('dDtBeg').AsDateTime := period_Report.start;
    ParamByName('dDtEnd').AsDateTime := period_Report.finish;
    Open;

    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'qryPfNu.sql');
  end; {with}
end; {OpenQryNU}

//------------------------------------------------------------------------------
function VidIsChildCare(cVidN: string): boolean;
begin
  Result := (cVidN = VIDN_CHILD_3Y) or (cVidN = VIDN_CHILD_6Y);
end;

//------------------------------------------------------------------------------
function VidIsBoln(cVidN: string): boolean;
begin
  Result := (cVidN > '2600') and (cVidN < '2700');
end;

//------------------------------------------------------------------------------
function VidIsDekr(cVidN: string): boolean;
begin
  Result := cVidN = '2602';
end;

//------------------------------------------------------------------------------
function VidIsMobiliz(cVidN: string): boolean;
begin
  Result := cVidN = '1210';
end;

//------------------------------------------------------------------------------
function VidIsDogovr(cVidN: string): boolean;
begin
  Result := (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008');
end;

//------------------------------------------------------------------------------
function TSpovT6Runner.GetT6KeyValues: TT6Rec;
var
  nPrcWrkTime: double;
  bVidIsSovm: boolean;
  recNU: TNuRec;
  periodZaMG: TPeriod;
  dummyWord: word;
begin
  with qry_NU do begin
    Result := InitT6Rec;
    Result.NUMIDENT := FieldByName('TIN').AsString;

    DecodeDate(
      FieldByName('DtProc').AsDateTime, Result.PERIOD_Y, Result.PERIOD_M, dummyWord);
    DecodeDate(
      FieldByName('ZaMesGod').AsDateTime, Result.PAY_YEAR, Result.PAY_MNTH, dummyWord);

    // Дальнейшие значения ключей зависят от совместительства вида начисл./удерж.
    recNU.VidN := FieldByName('VidN').AsString;
    recNU.period := TDateUtils.InitPeriod(
      FieldByName('Dt_Beg').AsDateTime, FieldByName('Dt_End').AsDateTime);

    // Выясняем совместительство вида
    bVidIsSovm := false;
    if TPeekQuery.PeekVidN(qry_Peek, recNU.VidN) then
      if qry_Peek.FieldByName('Sovm').AsString = '1' then
        bVidIsSovm := true;

    // Выбираем значения из перемещений
    if TPeekQuery.PeekPere(qry_Peek,
        FieldByName('TabN').AsInteger, FieldByName('DtBeg').AsDateTime, true) then begin
      // ППС
      with qry_Peek do
        if FieldByName('KdKatP').AsInteger = KAT_PERS_PPS then
          Result.EXP := 1;

      // Для несовместительски видов - тоже из перемещений
      if not bVidIsSovm then
        // Неполный рабочий день
        nPrcWrkTime := qry_Pere.FieldByName('PrcWrkTime').AsInteger;
        if (nPrcWrkTime <> 0) and (nPrcWrkTime <> 100) then
          Result.NRC := 1;

        // Трубовая книжка - на предприятии
        if qry_Peek.FieldByName('Sovm').AsInteger = 0 then
          Result.OTK := 1;
    end;

    // Для совместительски видов
    if bVidIsSovm then begin
      Result.OTK := 0;
      Result.NRC := 1;
    end;

    // Тип записи
    if VidIsChildCare(recNU.VidN) then
      Result.ZO := T6_ZO_CHILD_CARE

    else if VidIsBoln(recNU.VidN) then
      if qry_Peek.FieldByName('Inv').AsInteger = 0 then
        Result.ZO := T6_ZO_BOLN
      else
        Result.ZO := T6_ZO_BOLN_INV

    else if VidIsDekr(recNU.VidN) then
      if qry_Peek.FieldByName('Inv').AsInteger = 0 then
        Result.ZO := T6_ZO_DEKR
      else
        Result.ZO := T6_ZO_DEKR_INV

    else if VidIsMobiliz(recNU.VidN) then
      Result.ZO := T6_ZO_MOB

    else if VidIsDogovr(recNU.VidN) then
      Result.ZO := T6_ZO_CPH

    else if Result.EXP = 1 then
      if qry_Peek.FieldByName('Inv').AsInteger = 0 then
        Result.ZO := T6_ZO_CMN
      else
        Result.ZO := T6_ZO_INV
    else
      if qry_Peek.FieldByName('Inv').AsInteger = 0 then
        Result.ZO := T6_ZO_PPS
      else
        Result.ZO := T6_ZO_PPS_INV;

    Result.PAY_TP := 0;
  end;
end;

//------------------------------------------------------------------------------
procedure TSpovT6Runner.ProcessNU;
var
  nTabN: integer;

  rOsn, rSovm: TTotals;
  r: ^TTotals;

  recNU: TNURec;
  recT6: TT6Rec;

  nSumma: double;

  periodZaMG,
  periodActualWrk: TPeriod;
begin
  with qry_Nu do begin
    First;

    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;

      // Записываем пару таб.н/налоговый
      // Где-то это используеся для получения табельного по налоговому
      AddRecInCdsID_TabN(nTabN, UpiRec.TIN);

      // cdsSpov заново создаётся для каждого таб.н
      with cds_Spov do begin
        if Active then
          Close;
        CreateDataSet;
        IndexName := 'OnZoExp';
      end; {with}

      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        // Определяем значения ключевых полей таблицы 6
        recT6 := GetT6KeyValues;

        // Определить даты начала и конца работы в месяце
        // по таблице Приемов/Увольнений
        periodActualWrk := GetActualWrkPeriod(periodZaMG);
        rOsn.nKdPTV := TDateUtils.DaysCount(periodActualWrk);
        rSovm.nKdPTV := rOsn.nKdPTV;

        rOsn.bIsWrk := rOsn.nKdPTV > 0;
        rSovm.bIsWrk  := rSovm.nKdPTV > 0;

        rOsn.bIsInv  := IsInvalid(FieldByName('PRR').AsInteger);
        rSovm.bIsInv := rOsn.bIsInv;

        // Совместительство вида начисления/удержания
        if FieldByName('Sovm').AsString = '1' then
          r := @rSovm
        else
          r := @rOsn;

        r^.bIsPps := FieldByName('KdKatP').AsInteger = 1;
        r^.bIsInv := IsInvalid(FieldByName('PRR').AsInteger);

        nSumma := FieldByName('Summa').AsFloat;

        // Собираем суммы
        AccumulateTotals(r^, recNU, nSumma);

        if (recNU.VidN < '2605') and (recNU.VidN <> '2602') {<= больничных} then begin
          // Период работы в отчётном месяце равен нулю
          // Видимо, случай, когда доначислили уволившемуся человеку
          // Принимаем рабочий период равным периоду начисления
          r^.periodWrk := recNU.period;
        end;

        Inc(n_NUCurRow);
        DisplayProgressT67(n_NUCurRow, RecordCount, 'Обработка начислений/удержаний', '');

        WriteToCdsSpov(nTabN, periodZaMG.start, rOsn);
        WriteToCdsSpov(nTabN, periodZaMG.start, rSovm);

        Next;
      end; {while TabN}

      if bFlagDbg and b_SpsOnly then begin
        cds_Spov.SaveToFile(cDirTemp +
          IntToStr(TDateUtils.MonthOfQuarter(periodZaMG.start)) +
          '_' + IntToStr(nTabN) + '.cds');
      end;

      // Закончилась разработка ТабНр'а - сбросить данные в СПОВ-таблицы,
      SbrosToSpov13;

      if bFlagDbg then begin
        cds_T6.SaveToFile(cDirTemp + IntToStr(TDateUtils.MonthOfQuarter(periodZaMG.start)) +
          '_' + IntToStr(nTabN) + 't6.cds');
      end;

      CopyToTbl_06;
    end; {while Eof}
  end; {with qry_NU}

  if bFlagDbg and cds_Prc.Active and (cds_Prc.RecordCount > 0) then
    cds_Prc.SaveToFile(cDirTemp + 'TmpPrc.cds');
end; {ProcessNU}

//------------------------------------------------------------------------------
// Накапливаем суммы
//------------------------------------------------------------------------------
procedure TSpovT6Runner.AccumulateTotals(
  r: TTotals;
  recNU: TNuRec;
  nSumma: double);
begin
  with qry_NU do begin
    // "договорные" виды. Накапливаем сумму и сумму в ПФ, если подлежит
    if VidIsDogovr(recNU.VidN) then begin
      r.nSmDgv := r.nSmDgv + nSumma;
      if (FieldByName('SP_PF').AsString = '1') then
        r.nSmDDgv := r.nSmDDgv + nSumma;

    // мобилизация
    end else if VidIsMobiliz(recNU.VidN) then
      r.nSm1210 := r.nSm1210 + nSumma

    // отпускные
    else if (recNU.VidN > '2400') and (recNU.VidN < '2500') or (recNU.VidN = '1810') then begin
      r.bIsOtp := true;
      if FieldByName('KdKatP').AsInteger = 1 then
        r.nSmOtpPps := r.nSmOtpPps + nSumma
      else
        r.nSmOtpCmn := r.nSmOtpCmn + nSumma;

      if FieldByName('SP_PF').AsString = '1' then begin
        if FieldByName('KdKatP').AsInteger = 1 then
          r.nSmDOtpPps := r.nSmDOtpPps + nSumma
        else
          r.nSmDOtpCmn := r.nSmDOtpCmn + nSumma;
      end;

    // все больничные
    end else if VidIsBoln(recNU.VidN) then begin
      if VidIsDekr(recNU.VidN) then begin // декретные - вид 2602
        r.bIsDekr := true;
        r.periodDekr := recNU.period;
        r.nKdNpDkr := r.nKdNpDkr + TDateUtils.DaysCount(r.periodDekr);
        r.nSmDekr  := r.nSmDekr + nSumma;
        r.nSmDDekr := r.nSmDDekr + nSumma;
      end else begin // больничные, не декретные
        r.bIsBln  := true;
        r.nSmBln  := r.nSmBln  + nSumma;
        r.nSmDBln := r.nSmDBln + nSumma;
        r.nKdNpBln := r.nKdNpBln + TDateUtils.DaysCount(recNU.period);
      end;

    // все остальные виды начислений
    end else if recNU.VidN < '5000' then begin
      if nSumma > 0 then begin
        // начисленные положит.суммы (должны "уйти" в ЗаМГ месяца отчёта)

        if FieldByName('KdKatP').AsInteger = 1 {ППС} then begin
          r.nSmPmPps := r.nSmPmPps + nSumma;
          if (FieldByName('SP_PF').AsString = '1') then
            r.nSmPmDPps := r.nSmPmDPps + nSumma;
        end else begin
          r.nSmPmCmn := r.nSmPmCmn + nSumma;
          if FieldByName('SP_PF').AsString = '1' then
            r.nSmPmDCmn := r.nSmPmDCmn + nSumma;
        end
      end else begin
        // начисленные отрицат.суммы (должны остаться в "своих" ЗаМГ)

        if (FieldByName('KdKatP').AsInteger <> 1) {ППС} then begin
          r.nSmPps := r.nSmPps + nSumma;
          if FieldByName('SP_PF').AsString = '1' then
            r.nSmDPps := r.nSmDPps + nSumma;
        end else begin
          r.nSmCmn := r.nSmCmn + nSumma;
          if (FieldByName('SP_PF').AsString = '1') then
            r.nSmDCmn := r.nSmDCmn + nSumma;
        end;
      end

    // отпуска
    end else if recNU.VidN = '5005' then // НеоплОтп
      r.nKdNZp := r.nKdNzp + TDateUtils.DaysCount(recNU.period)
    else if recNU.VidN = '5011' then begin // ОтпДо3лет
      r.bIsOtp3  := true;
      r.periodOtp3 := recNU.period;
    end else if recNU.VidN = '5012' then begin // ОтпДо6лет
      r.bIsOtp6  := true;
      r.periodOtp6 := recNU.period;

    // ЕСВ
    end else if recNU.VidN = '6201' then // ЕСВ с общ.видов с сотр.
      r.nSmPCmn := r.nSmPCmn - nSumma
    else if recNU.VidN = '6206' then  // ЕСВ с ППС-видов с сотр.
      r.nSmPPps := r.nSmPPps - nSumma
    else if recNU.VidN = '6211' then // ЕСВ с Bln-видов
      r.nSmPBln := r.nSmPBln - nSumma
    else if recNU.VidN = '6212' then begin // ЕСВ с Dkr-видов
      r.nSmPDekr := r.nSmPDekr - nSumma; end
    else if recNU.VidN = '6216' then  // уд.в ЕСВ с дгв-видов с сотр.
      r.nSmPDgv := r.nSmPDgv - nSumma

    // сверхпороги
    else if recNU.VidN = '8606' then
      r.nSvPCmn := r.nSvPCmn + nSumma
    else if recNU.VidN = '8607' then
      r.nSvPPps := r.nSvPPps + nSumma
    else if recNU.VidN = '8608' then
      r.nSvPBln := r.nSvPBln + nSumma
    else if recNU.VidN = '8609' then
      r.nSvPDekr := r.nSvPDekr + nSumma
    else if (recNU.VidN = '8610') then
      r.nSvPDgv := r.nSvPDgv + nSumma

    // налоги с предпр.
    else if recNU.VidN = '8681' then
      r.nSmPrpCmn := r.nSmPrpCmn - nSumma
    else if recNU.VidN = '8682' then
      r.nSmPrpPps := r.nSmPrpPps - nSumma
    else if recNU.VidN = '8683' then
      r.nSmPrpInvCmn := r.nSmPrpInvCmn - nSumma
    else if recNU.VidN = '8684' then
      r.nSmPrpInvPps := r.nSmPrpInvPps - nSumma
    else if (recNU.VidN = '8685') or (recNU.VidN = '8686') then
      r.nSmPrpBln := r.nSmPrpBln - nSumma
    else if (recNU.VidN = '8687') or (recNU.VidN = '8688') then
      r.nSmPrpDekr := r.nSmPrpDekr - nSumma
    else if recNU.VidN = '8691' then
      r.nSmPrpDgv := r.nSmPrpDgv - nSumma

    // ЕСВ предприятия
    else if recNU.VidN = '8711' then //ЕсвПрпДоМинЗплОбщ
      r.nSm8711 := r.nSm8711 + nSumma
    else if recNU.VidN = '8712' then // ЕсвПрпДоМинЗплППС
      r.nSm8712 := r.nSm8712 + nSumma
    else if recNU.VidN = '8713' then // СмДоМинЗп_1 (22%)
      r.nSm8713 := r.nSm8713 + nSumma
    else if recNU.VidN = '8715' then // ЕсвПрпДоМинЗплБлн
      r.nSm8715 := r.nSm8715 + nSumma
    else if recNU.VidN = '8716' then // ЕсвПрпДоМинЗплДекр
      r.nSm8716 := r.nSm8716 + nSumma
    else if recNU.VidN = '8717' then // СмДоМинЗп_2 (22%)
      r.nSm8717 := r.nSm8717 + nSumma;
  end; {with}
end; {AccumulateTotals}

//------------------------------------------------------------------------------
procedure TSpovT6Runner.WriteToCdsSpov(
  nTabN: integer;
  dZaMG: TDateTime;
  r: TTotals);
var
  cPidZv: string;
  nYear, nMnth, dummyWord: word;
  nCntDaysInMes: integer;

  function IsValuable: boolean;
  begin
    Result :=
      (r.nKdNpBln > 0) or (r.nKdNpDkr > 0) or (r.nKdNzp > 0) or (r.nKdPtv > 0) or
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
      r.bIsPps or r.bIsDekr or r.bIsOtp3 or r.bIsOtp6;
  end;

begin
(*
  if not IsValuable then
    Exit;

  nCntDaysInMes := MyLastDayOM(dZaMG);
  cPidZv := '';

  with cds_Spov do begin
    Append;

    FieldByName('TabN').AsInteger := nTabN;
    FieldByName('ZaMG').AsDateTime := dZaMG;
    FieldByName('IsWrk').AsBoolean := r.bIsWrk;

    if r.bIsInv then
      FieldByName('Inv').AsInteger := 1
    else
      FieldByName('Inv').AsInteger := 0;

    DecodeDate(dZaMG, nYear, nMnth, dummyWord);
    FieldByName('PAY_MNTH').AsInteger := nMnth;
    FieldByName('PAY_YEAR').AsInteger := nYear;

    if r.bIsInv then
      FieldByName('ZO').AsInteger := 2
    else
      FieldByName('ZO').AsInteger := 1;

    FieldByName('OTK').AsInteger := r.nOTK;

    if r.bIsPps then
      FieldByName('Exp').AsInteger := 1
    else
      FieldByName('Exp').AsInteger := 0;

    FieldByName('Sm1210').AsFloat := RoundTo(r.nSm1210, -2);
    FieldByName('SmCmn').AsFloat := RoundTo(r.nSmCmn, -2);
    FieldByName('SmDCmn').AsFloat := RoundTo(r.nSmDCmn, -2);

    FieldByName('SmPmCmn').AsFloat := RoundTo(r.nSmPmCmn, -2);
    FieldByName('SmPmDCmn').AsFloat := RoundTo(r.nSmPmDCmn, -2);

    FieldByName('SmOtpCmn').AsFloat := RoundTo(r.nSmOtpCmn, -2);
    FieldByName('SmDOtpCmn').AsFloat := RoundTo(r.nSmDOtpCmn, -2);

    FieldByName('SmPCmn').AsFloat := RoundTo(r.nSmPCmn, -2);
    FieldByName('SvPCmn').AsFloat := RoundTo(r.nSvPCmn, -2);
    FieldByName('SmPrpCmn').AsFloat := RoundTo(r.nSmPrpCmn, -2);
    FieldByName('SmPrpInvCmn').AsFloat := RoundTo(r.nSmPrpInvCmn, -2);

    FieldByName('SmPps').AsFloat := RoundTo(r.nSmPps, -2);
    FieldByName('SmDPps').AsFloat := RoundTo(r.nSmDPps, -2);

    FieldByName('SmPmPps').AsFloat := RoundTo(r.nSmPmPps, -2);
    FieldByName('SmPmDPps').AsFloat := RoundTo(r.nSmPmDPps, -2);

    FieldByName('SmOtpPps').AsFloat := RoundTo(r.nSmOtpPps, -2);
    FieldByName('SmDOtpPps').AsFloat := RoundTo(r.nSmDOtpPps, -2);
    FieldByName('SmPPps').AsFloat := RoundTo(r.nSmPPps, -2);
    FieldByName('SvPPps').AsFloat := RoundTo(r.nSvPPps, -2);
    FieldByName('SmPrpPps').AsFloat := RoundTo(r.nSmPrpPps, -2);
    FieldByName('SmPrpInvPps').AsFloat := RoundTo(r.nSmPrpInvPps, -2);
    FieldByName('SmBln').AsFloat := RoundTo(r.nSmBln, -2);
    FieldByName('Kd_Np').AsInteger := r.nKdNpBln;
    FieldByName('SmDBln').AsFloat := RoundTo(r.nSmDBln, -2);
    FieldByName('SmPBln').AsFloat  := RoundTo(r.nSmPBln, -2);
    FieldByName('SvPBln').AsFloat  := RoundTo(r.nSvPBln, -2);
    FieldByName('SmPrpBln').AsFloat := RoundTo(r.nSmPrpBln, -2);

    FieldByName('SmDekr').AsFloat := RoundTo(r.nSmDekr, -2);
    FieldByName('Kd_VP').AsInteger := r.nKdNpDkr;
    FieldByName('SmDDekr').AsFloat := RoundTo(r.nSmDDekr, -2);
    FieldByName('SmPDekr').AsFloat := RoundTo(r.nSmPDekr, -2);
    FieldByName('SvPDekr').AsFloat := RoundTo(r.nSvPDekr, -2);
    FieldByName('SmPrpDekr').AsFloat := RoundTo(r.nSmPrpDekr, -2);

    if r.nSmDekr <> 0 then begin
      FieldByName('IsDekr').AsBoolean := r.bIsDekr;
      FieldByName('DtBDekr').AsDateTime := r.periodDekr.start;
      FieldByName('DtEDekr').AsDateTime := r.periodDekr.finish;
    end;

    FieldByName('SmDgv').AsFloat  := RoundTo(r.nSmDgv, -2);
    FieldByName('SmDDgv').AsFloat := RoundTo(r.nSmDDgv, -2);
    FieldByName('SmPDgv').AsFloat := RoundTo(r.nSmPDgv, -2);
    FieldByName('SvPDgv').AsFloat := RoundTo(r.nSvPDgv, -2);
    FieldByName('SmPrpDgv').AsFloat := RoundTo(r.nSmPrpDgv, -2);
    FieldByName('SmOtp').AsFloat := RoundTo(r.nSmOtp, -2);
    FieldByName('SmDOtp').AsFloat := RoundTo(r.nSmDOtp, -2);
    FieldByName('SmPOtp').AsFloat := RoundTo(r.nSmPOtp, -2);
    FieldByName('SmVozvr').AsFloat := RoundTo(r.nSmVozvr, -2);
    FieldByName('SmDVozvr').AsFloat := RoundTo(r.nSmDVozvr, -2);
    FieldByName('SmPVozvr').AsFloat := RoundTo(r.nSmPVozvr, -2);

    if r.bIsOtp3 then begin
      FieldByName('IsOtp3').AsBoolean := r.bIsOtp3;
      FieldByName('DtBOtp3').AsDateTime := r.periodOtp3.start;
      FieldByName('DtEOtp3').AsDateTime := r.periodOtp3.finish;
    end;

    if r.bIsOtp6 then begin
      FieldByName('IsOtp6').AsBoolean := r.bIsOtp6;
      FieldByName('DtBOtp6').AsDateTime := r.periodOtp6.start;
      FieldByName('DtEOtp6').AsDateTime := r.periodOtp6.finish;
    end;

    if TDateUtils.PeriodIsValid(r.periodWrk) then begin
      FieldByName('DPR').AsDateTime := r.periodWrk.start;
      FieldByName('DZR').AsDateTime := r.periodWrk.finish;
      FieldByName('KD').AsInteger := TDateUtils.DaysCount(r.periodWrk);
    end;

    FieldByName('KdInMes').AsInteger := nCntDaysInMes;
    FieldByName('IsBln').AsBoolean := r.bIsBln;

    if r.bIsOtp and ((r.nSmOtpPps <> 0) or (r.nSmOtpCmn <> 0)) then
      FieldByName('IsOtp').AsBoolean   := r.bIsOtp;

    FieldByName('Sm8711').AsFloat   := RoundTo(r.nSm8711, -2);
    FieldByName('Sm8712').AsFloat   := RoundTo(r.nSm8712, -2);
    FieldByName('Sm8713').AsFloat   := RoundTo(r.nSm8713, -2);
    FieldByName('Sm8715').AsFloat   := RoundTo(r.nSm8715, -2);
    FieldByName('Sm8716').AsFloat   := RoundTo(r.nSm8716, -2);
    FieldByName('Sm8717').AsFloat   := RoundTo(r.nSm8717, -2);

    FieldByName('State').AsInteger := recT6.St;
    FieldByName('Num_Nak').AsString  := ''; // cNumNak;
    FieldByName('Dt_Nak').AsString   := ''; // cDtNak;

    FieldByName('Kd_Ptv').AsInteger  := r.nKdPTV;
    FieldByName('Kd_Nzp').AsInteger  := r.nKdNzp;
    FieldByName('NPD').AsInteger := r.nNPC;

    Post;
  end; {with}
*)
end; {WriteToCdsSpov}

//------------------------------------------------------------------------------
procedure TSpovT6Runner.SbrosToSpov13;
var
  recT6: TT6Rec;
nSm1210,
    nSmCmn, nSmDCmn, nSmPCmn, nSvPCmn, nSmOtpCmn, nSmDOtpCmn, nSmPOtpCmn,
    nSmPmCmn, nSmPmDCmn,
    nSmPps, nSmDPps, nSmPPps, nSvPPps, nSmOtpPps, nSmDOtpPps, nSmPOtpPps,
    nSmPmPps, nSmPmDPps,
    nSmBln, nSmDBln, nSmPBln, nSvPBln,
    nSmDgv, nSmDDgv, nSmPDgv, nSvPDgv,
    nSmOtp, nSmDOtp, nSmPOtp,
    nSmDekr, nSmDDekr, nSmPDekr, nSvPDekr : double;
    // В случае, если есть отпускные суммы, надо перераспределить
    // nSmPCmn и nSmPPps в пропорциях ...
    nSmCmn2, nSmDCmn2, nSmPCmn2, nSmPrpCmn2,
    nSmPps2, nSmDPps2, nSmPPps2, nSmPrpPps2,
    nSmOtp2, nSmDOtp2, nSmPOtp2, nSmPrpOtp2,
                   nSmCPO, nSmDCPO, nSmPCPO, nSmUdeln : double;
    nSm8711, nSm8712, nSm8713, nSm8715, nSm8716, nSm8717,
                                 nSmDiff, nSmNarah : double; // для ДМЗ
    bSvDmzCmn, bSvDmzPps, bSvDmzBln, bSvDmzDekr : boolean;
    nSmPrpCmn, nSmPrpInvCmn, nSmPrpOtpCmn,
    nSmEPrp, nSmPrpPps, nSmPrpInvPps, nSmPrpOtpPps,
    nSmPrpBln, nSmPrpDekr, nSmPrpDekrInv, nSmPrpDgv : double;
    nExp, nTmpExp, nZO, nTmpZO, nUkrGr, nState, nMySort, nMySort2 : SmallInt;
    nNormZ, nHH, nMM, nSeason, nNorma, nCntDayInZaMG : SmallInt;
    nY, nM, nD, nStartDt, nStopDt, nDays, nPayTp, nPayMnth, nPayYear : word;
    bIsWrk, bIsDekr, bIsRecBln, bIsOtp, bIsOtp3, bIsOtp6 : boolean;
    dZaMG, dDtPrm, dDtUvln, dDtEMes : TDateTime;
    cNumNak, cDtNak : ShortString;
    nTabN : integer;
    nKdNp, nKdNzp, nKdPTV, nKdDkr, nNPD : SmallInt;
    bSavedKdNzp, // записано ли к-во дней без сохранения з/пл
    bSvNRC,      // записано ли в поле NRC признак неповного робочого часу)
    bSavedKdPTV, // записано ли к-во дней перебування в трудовых видносынах
                 // (пишется только в одну из записей отчётного месяца)
                 bIsSmCmn, bIsSmPps, bIsSmPmCmn, bIsSmPmPps, bIsSmDgv : boolean;

    DummyWord: word;
    nOTK: integer;
    nSum, nSumD: double;
    nFnpc, // флаг неполн.раб.дня
    nDptv, nMaxDays, nPm, nPy: integer;
    nGenZO: integer; // Основное zo - 1 или 25
    bUvolen: boolean; // Сотрудник на момент расчёта уволен
begin
(*
  DecodeDate(period_Report.start, recT6.Period_Y, recT6.Period_M, DummyWord);

  with cds_T6 do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end; {with}

  with cds_Spov do begin
    First;

    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      dZaMG := FieldByName('ZaMG').AsDateTime;

      bSavedKdNzp := false;
      bSvNRC := false;

      bSavedKdPTV := false;
      bSvDmzCmn   := false;
      bSvDmzPps   := false;
      bSvDmzBln   := false;
      bSvDmzDekr  := false;

      nStartDt := 0;
      nStopDt  := 0;
      nDays    := 0;
      nNormZ   := 0;
      nHH      := 0;
      nMM      := 0;
      nSeason  := 0;
      nNorma   := MyLastDayOM(d_DtBeg);

      nKdDkr   := 0;

      nZO := FieldByName('ZO').AsInteger; // Тип застрахованой особы
                                                   // 1 - все, 2 - инвалиды

      nNPD := FieldByName('NPD').AsInteger; // призн. неполн. раб. дня
      nOTK := FieldByName('OTK').AsInteger;
      nExp := FieldByName('Exp').AsInteger; // ППС - 1, иначе - 0
      if nExp = 1 then
        nGenZO := T6_ZO_PPS
      else
        nGenZO := T6_ZO_CMN;
      nState   := FieldByName('State').AsInteger;

      nSm1210 := FieldByName('Sm1210').AsFloat;
      nSmCmn  := FieldByName('SmCmn').AsFloat;
      nSmDCmn := FieldByName('SmDCmn').AsFloat;
      nSmPCmn := FieldByName('SmPCmn').AsFloat;
      nSvPCmn := FieldByName('SvPCmn').AsFloat;

      nSmPmCmn := FieldByName('SmPmCmn').AsFloat;
      nSmPmDCmn := FieldByName('SmPmDCmn').AsFloat;

      nSmPmPps := FieldByName('SmPmPps').AsFloat;
      nSmPmDPps := FieldByName('SmPmDPps').AsFloat;

      nSmOtpCmn  := FieldByName('SmOtpCmn').AsFloat;
      nSmDOtpCmn := FieldByName('SmDOtpCmn').AsFloat;
      nSmPOtpCmn := 0;
      nSmOtpPps  := FieldByName('SmOtpPps').AsFloat;
      nSmDOtpPps := FieldByName('SmDOtpPps').AsFloat;
      nSmPOtpPps := 0;

      nSmOtp  := FieldByName('SmOtp').AsFloat;
      nSmDOtp := FieldByName('SmDOtp').AsFloat;
      nSmPOtp := FieldByName('SmPOtp').AsFloat;
      nSmDgv  := FieldByName('SmDgv').AsFloat;
      nSmDDgv := FieldByName('SmDDgv').AsFloat;
      nSmPDgv := FieldByName('SmPDgv').AsFloat;
      nSvPDgv := FieldByName('SvPDgv').AsFloat;
      nSmBln  := FieldByName('SmBln').AsFloat;

      nSmDBln := FieldByName('SmDBln').AsFloat;
      nSmPBln := FieldByName('SmPBln').AsFloat;
      nSvPBln := FieldByName('SvPBln').AsFloat;
      nSmDCmn := nSmDCmn - nSvPCmn;
///      nSmDPps := nSmDPps - nSvPPps;
      nSmDDgv := nSmDDgv - nSvPDgv;
      nSmDBln := nSmDBln - nSvPBln;

      bIsDekr := FieldByName('IsDekr').AsBoolean;
      nSmDekr := FieldByName('SmDekr').AsFloat;
      nSmDDekr := FieldByName('SmDDekr').AsFloat;
      nSmPDekr := FieldByName('SmPDekr').AsFloat;
      nSvPDekr := FieldByName('svPDekr').AsFloat;
      nSmDDekr := nSmDDekr - nSvPDekr;

      nSmPrpCmn     := FieldByName('SmPrpCmn').AsFloat;
      nSmPrpInvCmn  := FieldByName('SmPrpInvCmn').AsFloat;
      nSmPrpPps     := FieldByName('SmPrpPps').AsFloat;
      nSmPrpInvPps  := FieldByName('SmPrpInvPps').AsFloat;
      nSmPrpBln     := FieldByName('SmPrpBln').AsFloat;
      nSmPrpDekr    := FieldByName('SmPrpDekr').AsFloat;
      nSmPrpDekrInv := 0;
      nSmPrpDgv     := FieldByName('SmPrpDgv').AsFloat;

      nSm8711 := FieldByName('Sm8711').AsFloat;
      nSm8712 := FieldByName('Sm8712').AsFloat;
      nSm8713 := FieldByName('Sm8713').AsFloat;
      nSm8715 := FieldByName('Sm8715').AsFloat;
      nSm8716 := FieldByName('Sm8716').AsFloat;
      nSm8717 := FieldByName('Sm8717').AsFloat;

      bIsOtp  := FieldByName('IsOtp').AsBoolean;
      bIsOtp3 := FieldByName('IsOtp3').AsBoolean;
      bIsOtp6 := FieldByName('IsOtp6').AsBoolean;

      //nPayTp   := 0;
      bIsRecBln := false;
      bIsDekr   := false;
      bIsOtp    := false;
      bIsOtp3   := false;
      bIsOtp6   := false;
      nCntDayInZaMG := MyLastDayOM(dZaMG);
      DecodeDate(dZaMG, nPayYear, nPayMnth, nD);
      cNumNak := FieldByName('Num_Nak').AsString;
      cDtNak  := FieldByName('Dt_Nak').AsString;
      if dZaMG < d_DtBeg then
        nMySort := 10
      else if dZaMG = d_DtBeg then
        nMySort := 20
      else {if dZaMG > d_DtBeg then}
        nMySort := 30;
      if (dZaMG = d_DtBeg) then begin
        if not FieldByName('DPR').IsNull then
          DecodeDate(FieldByName('DPR').AsDateTime, nY, nM, nStartDt);
        if not FieldByName('DZR').IsNull then
          DecodeDate(FieldByName('DZR').AsDateTime, nY, nM, nStopDt);
        if (nStartDt <> 0) and (nStopDt <> 0) then
          nDays := nStopDt - nStartDt + 1;
      end;
      bIsWrk := GetIsWrk(nTabN, dZaMG, dDtPrm, dDtUvln);
      nSmPps  := FieldByName('SmPps').AsFloat;
      nSmDPps := FieldByName('SmDPps').AsFloat;
      nSmPPps := FieldByName('SmPPps').AsFloat;
      nSvPPps := FieldByName('SvPPps').AsFloat;
      bIsSmPps := (nSmPps <> 0) or (nSmDPps <> 0) or (nSmPPps <> 0) or
                                         (nSmPmPps <> 0) or (nSvPPps <> 0);


      if ((nExp = 1) {ППС} or (bIsSmPps)) and
                                    bIsWrk and (dZaMG = d_DtBeg) then begin
        CreOpenCdsPTV_PPS(nTabN, dZaMG);
        cdsPTV_PPS.First;
        while not cdsPTV_PPS.Eof do begin
          cNumNak := cdsPTV_PPSNum_Nak.AsString;
          cDtNak  := cdsPTV_PPSDt_Nak.AsString;

          AddRecInTbl_07(c_PID, cNumNak, cDtNak,
            cdsPTV_PPSStart_Dt.AsInteger, cdsPTV_PPSStop_Dt.AsInteger,
            cdsPTV_PPSDays.AsInteger, nNormZ, nHH, nMM, nNorma); {"СпецСтаж"}

          cdsPTV_PPS.Next;
        end;
      end;

      // .................................................................
      // Если bIsOtp, то т.к. суммы удержаний в ЕСВ и ПрпЕСВ из отпускных
      // "сидят" в соответствующих суммах Общих или ППСовских, нужно их
      // оттуда "вытащить" и записать в SmOtp, SmDOtp, SmPOtp, SmPrpOtp
      // .................................................................

      if (nSmDOtpCmn <> 0) then begin
        if ((nSmDOtpCmn + nSmDCmn) = 0) or (nSmDCmn = 0)
                             {значит всё пришлось на отпуск} then begin
          nSmPOtpCmn := nSmPCmn;
          nSmPCmn := 0;
          nSmPrpOtpCmn := nSmPrpCmn + nSmPrpInvCmn;
          nSmPrpCmn := 0; end
        else if ((nSmDCmn <> 0) and (nSmDOtpCmn <> 0)) then begin
          nSmPOtpCmn := RoundTo(nSmPCmn / (nSmDOtpCmn + nSmDCmn) * nSmDOtpCmn, -2);
          nSmPCmn := RoundTo(nSmPCmn - nSmPOtpCmn, -2);
          nSmPrpCmn := nSmPrpCmn + nSmPrpInvCmn;
          nSmPrpOtpCmn := RoundTo(nSmPrpCmn /
                                   (nSmDOtpCmn + nSmDCmn) * nSmDOtpCmn, -2);
          nSmPrpCmn := RoundTo(nSmPrpCmn - nSmPrpOtpCmn, -2);
        end;
      end;

      if (nSmDOtpPps <> 0) then begin
        if ((nSmDOtpPps + nSmDPps) = 0) or (nSmDPps = 0)
                         {значит всё пришлось на отпуск} then begin
          nSmPOtpPps := nSmPPps;
          nSmPPps := 0;
          nSmPrpOtpPps := nSmPrpPps;
          nSmPrpPps := 0; end
        else if ((nSmDPps <> 0) and (nSmDOtpPps <> 0)) then begin
          // Разобраться в этой каше переменных и как они проходят в результат
          nSmPOtpPps := RoundTo(nSmPPps / (nSmDOtpPps + nSmDPps) * nSmDOtpPps, -2);
          nSmPPps := RoundTo(nSmPPps - nSmPOtpPps, -2);
          nSmPrpOtpPps := RoundTo(nSmPrpPps / (nSmDOtpPps + nSmDPps) * nSmDOtpPps, -2);
          nSmPrpPps := RoundTo(nSmPrpPps - nSmPrpOtpPps, -2);
        end;
      end;

      bIsSmCmn := (nSmCmn <> 0) or (nSmDCmn <> 0) or (nSmPCmn <> 0) or
                                                                (nSvPCmn <> 0);
      bIsSmPps := (nSmPps <> 0) or (nSmDPps <> 0) or (nSmPPps <> 0) or
                                                                (nSvPPps <> 0);

      bIsSmPmCmn := (nSmPmCmn <> 0) or (nSmPmDCmn <> 0);
      bIsSmPmPps := (nSmPmPps <> 0) or (nSmPmDPps <> 0);

      bIsSmDgv := (nSmDgv <> 0) or (nSmDDgv <> 0) or (nSmPDgv <> 0) or
                                                                (nSvPDgv <> 0);

      nKdNp   := FieldByName('Kd_Np').AsInteger;
      if nKdNp > nCntDayInZaMG then
        nKdNp := nCntDayInZaMG;

      nKdNzp  := FieldByName('Kd_Nzp').AsInteger;
      nKdPTV  := FieldByName('Kd_PTV').AsInteger;
      nKdDkr  := FieldByName('Kd_VP').AsInteger;

      if not (bIsSmPps or bIsSmPmPps or bIsSmCmn or bIsSmPmCmn or
          (nSmDgv <> 0) or (nSmDDgv <> 0) or (nSmOtpCmn <> 0) or
          (nSmDOtpCmn <> 0) or (nSmPOtpCmn <> 0) or (nSmOtpPps <> 0) or
          (nSmDOtpPps <> 0) or (nSmPOtpPps <> 0)) then
        nKdPtv := 0;

      // Признак уволенности для определения, можно ли переносить положительные
      // суммы предыдущих месяцев в расчётный
      bUvolen := false;
      if PeekPrmUv(nTabN, d_CurPeriodBeg) then
        if (qryPeek.FieldByName('Dt_Uvoln').AsDateTime < d_CurPeriodBeg)
            and (qryPeek.FieldByName('Dt_Uvoln').AsDateTime <> 0) then
          bUvolen := true;

      // ППС.

      if bIsSmPps or bIsSmPmPps then begin
        nMySort2 := nMySort + 1;

        if nZO = 1 then {ППС}
          nTmpZO := 25
        else {Инв.ППС}
          nTmpZO := 32;


        nSum := nSmPps + nSmPmPps;
        nSumD := nSmDPps + nSmPmDPps;

        // Чтобы оставить положительную сумму в "своём" месяце
        // (как в случае с уволенными), нужно тип платежа
        // установить во что-то отличное от 0.
        nPayTP := 0;
        if bUvolen and (nSum >= 0) then
          nPayTP := 1;

        nSmEPrp := Max(0, RoundEsv(SmNarah(dZaMG, nSumD, nExp, nTmpZO, nPayTp)));

        nFnpc := nNPD;
        nDptv := nKdPtv;
        nPm := nPayMnth;
        nPy := nPayYear;

        if (nSum >= 0) and not bUvolen then begin // перенос в текущий
          // В случае переноса внутренних совместительских сумм
          // прошлых месяцев в текущий, нужно добавить
          // запись с пустыми суммами за прошлый месяц
          if nOTK = 0 then
            AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPm, nPy,
              0, nKdNzp, nDptv, 0, nFnpc, 1, 0, 0, 0, 0, 0,
              'Pps', dZaMG);

          nMaxDays := MyLastDayOM(d_CurPeriodBeg);
          nFnpc := Min(nFnpc, nMaxDays);
          nDptv := Min(nDptv, nMaxDays);
          nPm := n_PeriodM;
          nPy := n_PeriodY;
        end;

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPm, nPy,
            0, nKdNzp, nDptv, 0, nFnpc, 1, nSum, nSumD, nSmPPps, 0, nSmEPrp,
            'Pps', dZaMG);

        nKdPTV := 0;
        nNPD := 0;

        if nSm8712 <> 0 then begin
          // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
          nPayTP := 13;

          AddRecInCdsT6(nMySort2, nOTK, nGenZO, nPayTP, nPayMnth, nPayYear,
            0, nKdNzp, nKdPTV, 0, nNPD, 1, 0, 0, 0, nSm8713, -nSm8712,
            'Pps', dZaMG);

          bSvDmzPps := true;
        end;

        bSavedKdNzp := true;
        nKdNzp := 0;
        bSavedKdPTV := true;
        nKdPTV := 0;
      end;

      // Общие основания

      if bIsSmCmn or bIsSmPmCmn then begin
        nMySort2 := nMySort + 2;

        nSum := nSmCmn + nSmPmCmn;
        nSumD := nSmDCmn + nSmPmDCmn;

        nPayTP := 0;
        // Чтобы оставить положительную сумму в "своём" месяце (как в случае с уволенными),
        // нужно тип платежа установить во что-то отличное от 0.
        if bUvolen and (nSum >= 0) then
          nPayTP := 1;

        nSmEPrp := RoundEsv(SmNarah(dZaMG, nSumD, nExp, nZO, nPayTp));

        nFnpc := nNPD;
        nDptv := nKdPtv;
        nPm := nPayMnth;
        nPy := nPayYear;
        if (nSum >= 0) and not bUvolen then begin // перенос в текущий

          // В случае переноса совместительских сумм
          // прошлых месяцев в текущий, нужно добавить
          // запись с пустыми суммами за прошлый месяц
          if nOTK = 0 then
            AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPm, nPy,
              0, nKdNzp, nDptv, 0, nFnpc, 0, 0, 0, 0, 0, 0,
              'Cmn', dZaMG);

          nMaxDays := MyLastDayOM(d_CurPeriodBeg);
          nFnpc := Min(nFnpc, nMaxDays);
          nDptv := Min(nDptv, nMaxDays);
          nPm := n_PeriodM;
          nPy := n_PeriodY;
        end;

        if nZO = 1 then
          nSmNarah := nSmPrpCmn
        else
          if bIsOtp then
            nSmNarah := nSmPrpCmn
          else
            nSmNarah := nSmPrpInvCmn;

        AddRecInCdsT6(nMySort2, nOTK, nZO, nPayTP, nPm, nPy,
          0, nKdNzp, nDptv, 0, nFnpc, 0, nSum, nSumD, nSmPCmn, 0, nSmEPrp,
          'Cmn', dZaMG);

        nKdPTV := 0;
        nNPD := 0;

        if nSm8711 <> 0 then begin
          // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
          nPayTP := 13;

          AddRecInCdsT6(nMySort2, nOTK, nGenZO, nPayTP, nPayMnth, nPayYear,
            0, nKdNzp, nKdPTV, 0, nNPD, 0, 0, 0, 0, nSm8713, -nSm8711,
            'Cmn', dZaMG);

          bSvDmzCmn := true;
        end;

        bSavedKdNzp := true;
        nKdNzp := 0;
        bSavedKdPTV := true;
        nKdPTV := 0;
        nNPD := 0;
      end;

      if bSavedKdNzp then
        nKdNzp := 0;

      if (nSmDgv <> 0) or (nSmDDgv <> 0) or
                                  (nSmPDgv <> 0) or (nSvPDgv <> 0) then begin
        nTmpZO := 26;
        nPayTP := 0;
        nMySort2 := nMySort + 4;
        nSmDiff := 0;
        nSmNarah := nSmPrpDgv;
        nKdNzp := 0;          /////////////////
        nSmEPrp := RoundEsv(SmNarah(dZaMG, nSmDDgv, 0, nTmpZO, nPayTp));

        AddRecInCdsT6(nMySort2, OTK_NO_TRUD_KN, T6_ZO_CPH, PAY_TP_CPH, nPayMnth, nPayYear,
          0, nKdNzp, nKdPTV, 0, nNPD, 0, nSmDgv, nSmDDgv, nSmPDgv, nSmDiff, nSmEPrp,
          'Dgv', dZaMG);

        bSavedKdNzp := true;
        bSavedKdPTV := true;
        nKdPTV := 0;
        nNPD := 0;
      end;

      if bSavedKdNzp then
        nKdNzp := 0;

      if (nSmOtpCmn <> 0) or (nSmDOtpCmn <> 0) or (nSmPOtpCmn <> 0) then begin
        nTmpExp := 0;
        if nZO = 1 then begin  {все}
//          if nExp <> 1 then    {не ППС}
//            nTmpZO := 1        {не ППС}
//          else
//            nTmpZO := 25; {ППС} end
          nTmpZO := 1; end
        else if nZO = 2 then begin {Инв}
          nTmpZO := 2;
//          if nExp <> 1 then    {Инв не ППС}
//            nTmpZO := 2        {Инв не ППС}
//          else
//            nTmpZO := 32;      {ИнвППС}
        end;
        nPayTP := 10;
        nMySort2 := nMySort + 3;
        nSmDiff := 0;
        nSmNarah := nSmPrpOtpCmn;
        nSmEPrp := RoundEsv(SmNarah(dZaMG, nSmDOtpCmn, nExp, nTmpZO, nPayTp));

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPayMnth, nPayYear,
          0, nKdNzp, nKdPTV, 0, nNPD, nTmpExp, nSmOtpCmn, nSmDOtpCmn, nSmPOtpCmn, nSmDiff, nSmEPrp,
          'Otp', dZaMG);

        nKdPTV := 0;
        nNPD := 0;
        if not bSvDmzCmn and (nSm8711 <> 0) then begin
          // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
          nPayTP := 13;

          AddRecInCdsT6(nMySort2, nOTK, nGenZO, nPayTP, nPayMnth, nPayYear,
            0, nKdNzp, nKdPTV, 0, nNPD, 0, 0, 0, 0, nSm8713, -nSm8711,
            'Otp', dZaMG);

          bSvDmzCmn := true;
        end;
        bSavedKdNzp := true;
        bSavedKdPTV := true;
        nKdPTV := 0;
        nNPD := 0;
      end;

      nTmpExp := 0;

      if (nSmOtpPps <> 0) or (nSmDOtpPps <> 0) or (nSmPOtpPps <> 0) then begin
        if nZO = 1 then begin  {все}
          nTmpZO := 25;        {ППС}         // nSmPrpOtpPps
          nTmpExp := 1; end
        else if nZO = 2 then begin {Инв}
          nTmpZO := 32;      {ИнвППС}
          nTmpExp := 1; end
        else begin
          ;
        end;
        nPayTP := 10;
        nMySort2 := nMySort + 3;
        nSmDiff := 0;
        nSmNarah := nSmPrpOtpPps;
        nSmEPrp := RoundEsv(SmNarah(dZaMG, nSmDOtpPps, nExp, nTmpZO, nPayTp));

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPayMnth, nPayYear,
          0, nKdNzp, nKdPTV, 0, nNPD, nTmpExp, nSmOtpPps, nSmDOtpPps, nSmPOtpPps, nSmDiff, nSmEPrp,
          'Otp', dZaMG);

        nKdPTV := 0;
        nNPD := 0;
        if not bSvDmzPps and (nSm8712 <> 0) then begin
          // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
          nPayTP := 13;

          AddRecInCdsT6(nMySort2, nOTK, nGenZO, nPayTP, nPayMnth, nPayYear,
            0, nKdNzp, nKdPTV, 0, nNPD, nTmpExp, 0, 0, 0, nSm8713, -nSm8712,
            'Otp', dZaMG);

          bSvDmzPps := true;
        end;
        bSavedKdNzp := true;
        bSavedKdPTV := true;
        nKdPTV := 0;
        nNPD := 0;
      end;

      if bSavedKdNzp then
        nKdNzp := 0;

      if (nSmBln <> 0) or (nSmDBln <> 0) or
                                   (nSmPBln <> 0) or (nSvPBln <> 0) then begin
        if nZO = 1 then       {все}
          nTmpZO := 29        {больничные для всех, кроме инвалидов}
        else if nZO = 2 then  {Инв}
          nTmpZO := 36;       {больничные всех инвалидов}
        nPayTP := 0;
        nSmBln := nSmBln - nSvPBln;
        nMySort2 := nMySort + 5;
        nSmDiff := 0;
///        nSmNarah := nSmPrpBln;
        nSmEPrp := RoundEsv(SmNarah(dZaMG, nSmDBln, nExp, nTmpZO, nPayTp));

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPayMnth, nPayYear,
          nKdNp, nKdNzp, nKdPTV, 0, nNPD, nExp, nSmBln, nSmDBln, nSmPBln, nSmDiff, nSmEPrp,
          'Bln', dZaMG);

        nKdPTV := 0;
        nNPD := 0;
        if nSm8715 <> 0 then begin
          // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
          nPayTP := 13;

          AddRecInCdsT6(nMySort2, nOTK, nGenZO, nPayTP, nPayMnth, nPayYear,
            0, nKdNzp, nKdPTV, 0, nNPD, 0, 0, 0, 0, nSm8717, -nSm8715,
            'Bln', dZaMG);

          bSvDmzBln := true;
        end;
        bSavedKdNzp := true;
        bSavedKdPTV := true;
        nKdPTV := 0;
        nNPD := 0;
      end;

      if bSavedKdNzp then
        nKdNzp := 0;

      if ((nSmDekr <> 0) or (nSmDDekr <> 0) or (nSmPDekr <> 0) or
                                     (nSvPDekr <> 0) or bIsDekr)  then begin
        // если были в этом же месяце отпускные, то декретные в тбл.6 не писались
        if nZO = 1 then
          nTmpZO := 42  {все Инв}
        else if nZO = 2 then
          nTmpZO := 43;      {ИнвППС}
        nPayTP := 0;  // Не пишется PayTp = 10
        nMySort2 := nMySort + 7;
        if d_DtBeg < d_20130701 then
          nSmDekr := 0;
        nKdDkr := FieldByName('Kd_VP').AsInteger; // ('Kd_PTV').AsInteger;
        if not bSavedKdPTV and (dZaMG >= d_DtBeg) then
          nKdPtv := nKdDkr;
        nSmDiff := 0;
///        nSmNarah := nSmPrpDekr;
        nSmEPrp := RoundEsv(SmNarah(dZaMG, nSmDDekr, nExp, nTmpZO, nPayTp));

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPayMnth, nPayYear,
          0, nKdNzp, nKdPTV, nKdDkr, nNPD, nExp, nSmDekr, nSmDDekr, nSmPDekr, nSmDiff, nSmEPrp,
          'Dkr', dZaMG);

        nKdPTV := 0;
        nNPD := 0;
        if not bSvDmzDekr and (nSm8716 <> 0) then begin
          // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
          nPayTP := 13;

          AddRecInCdsT6(nMySort2, nOTK, nGenZO, nPayTP, nPayMnth, nPayYear,
            0, nKdNzp, nKdPTV, 0,  nNPD, 0, 0, 0, 0, nSm8717, -nSm8716,
            'Dkr', dZaMG);

          bSvDmzDekr := true;
          nNPD := 0;
        end;
      end;

      if (nSm1210 <> 0) then begin
        nTmpZO := 48;
        nPayTP := 0;
        nMySort2 := nMySort + 4;
        nSmDiff := 0;
        nSmNarah := 0;

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPayMnth, nPayYear,
          0, nKdNzp, nKdPTV, 0, nNPD, nExp, nSm1210, 0, 0, nSmDiff, nSmNarah,
          'Mob', dZaMG);

        bSavedKdNzp := true;
//        bSavedKdPTV := true;
        nKdPTV := 0;
        nNPD := 0;
      end;

      // КОСТЫЛЬ ???
      if nTmpZO = 0 then
        nTmpZO := nGenZO;

      if bSavedKdNzp then
        nKdNzp := 0;
      nMySort2 := 7; // Взял с потолка - разобраться, как надо !!!!
      if not bSvDmzCmn and (nSm8711 <> 0) then begin
        // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
        nPayTP := 13;

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPayMnth, nPayYear,
          0, nKdNzp, nKdPTV, 0, nNPD, 0, 0, 0, 0, nSm8713, -nSm8711,
          '', dZaMG);

        bSvDmzCmn := true;
        nNPD := 0;
      end;

      if not bSvDmzPps and (nSm8712 <> 0) then begin
        // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
        nPayTP := 13;

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPayMnth, nPayYear,
          0, nKdNzp, nKdPTV, 0, nNPD, 0, 0, 0, 0, nSm8713, -nSm8712,
          '', dZaMG);

        bSvDmzPps := true;
        nNPD := 0;
      end;

      if not bSvDmzBln and (nSm8715 <> 0) then begin
        // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
        nPayTP := 13;

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPayMnth, nPayYear,
          0, nKdNzp, nKdPTV, 0, nNPD, 0, 0, 0, 0, nSm8717, -nSm8715,
          '', dZaMG);

        bSvDmzBln := true;
        nNPD := 0;
      end;

      if not bSvDmzDekr and (nSm8716 <> 0) then begin
        // Если НеполнРабДень, nPayTP = 13 Сделать функцию проверки !!!!!!
        nPayTP := 13;

        AddRecInCdsT6(nMySort2, nOTK, nTmpZO, nPayTP, nPayMnth, nPayYear,
          0, nKdNzp, nKdPTV, 0, nNPD, 0, 0, 0, 0, nSm8717, -nSm8716,
          '', dZaMG);

        bSvDmzDekr := true;
///        nNPD := 0;
      end;

      // Отпускницы по содержанию детей До3лет и До6лет не должны
      // показываться в таблице 6
      Next;
    end;
  end;
*)
end;

//------------------------------------------------------------------------------
procedure TSpovT6Runner.CopyToTbl_06;
var
  // Fix 18:18 16-07-2021
  // Для записи KD_PTV только единожды для каждого табельного номера и платёжного периода
  cCurrNUMIDENT: string;
  nCurrPAY_YEAR,
  nCurrPAY_MNTH,
  nCurrKD_PTV: integer;
  bKD_PTVWritten: boolean;
begin
(*
  cdsT6.First;

  // Fix 18:18 16-07-2021
  cCurrNUMIDENT := '';
  nCurrKD_PTV := 0;
  bKD_PTVWritten := false;

  while not cdsT6.Eof do begin
    with tblT6 do begin
      Inc(nNum06);

      if cdsT6.FieldByName('NUMIDENT').AsString <> cCurrNUMIDENT then begin
        cCurrNUMIDENT := cdsT6.FieldByName('NUMIDENT').AsString;
        nCurrPAY_YEAR := cdsT6.FieldByName('PAY_YEAR').AsInteger;
        nCurrPAY_MNTH := cdsT6.FieldByName('PAY_MNTH').AsInteger;
        nCurrKD_PTV := cdsT6.FieldByName('Kd_PTV').AsInteger;
        bKD_PTVWritten := false;
      end;

      if (nCurrPAY_YEAR <> cdsT6.FieldByName('PAY_YEAR').AsInteger) or
          (nCurrPAY_MNTH <> cdsT6.FieldByName('PAY_MNTH').AsInteger) then begin
        nCurrPAY_YEAR := cdsT6.FieldByName('PAY_YEAR').AsInteger;
        nCurrPAY_MNTH := cdsT6.FieldByName('PAY_MNTH').AsInteger;
        nCurrKD_PTV := cdsT6.FieldByName('Kd_PTV').AsInteger;
        bKD_PTVWritten := false;
      end;

( *    bCPH := FieldByName('KdKatP').AsInteger = KAT_PERS_GR_PRAV_DOG;

    // Положительные суммы предыдущих месяцев плюсуются в текущий месяц
    // Отрицательные остаются в своих
    if (dZaMG < d_CurPeriodBeg) and (nSumma > 0) and r.bIsWrk and not bCPH
        and not VidIsOtpOsn(cVidN) and not VidIsOtpSovm(cVidN)
        and not VidIsBln(qryNU) and (cVidN <> '2602') {декрет} then begin
      recT6.PAY_MNTH := recT6.PERIOD_M;
      recT6.PAY_YEAR := recT6.PERIOD_Y;
    end;

    // Дни труд.отнош. - только если нач. за отчётный месяц или декрет.
    if ((dZaMG = d_CurPeriodBeg) or (cVidN = '2602')) and (nSumma <> 0)
        and (recT6.PAY_TP <> PAY_TP_DIF_MIN_ZP) then
      UpdatePTV(recT6);
* )

      // if not Locate('NUMIDENT;PERIOD_M;PERIOD_Y;ZO;PAY_TP;PAY_MNTH;PAY_YEAR;OTK;EXP;NRC',
      // Fix 16:53 16-07-2021
      // Исключаем НеполныйРабочийДень из ключей.
      if not Locate('NUMIDENT;PERIOD_M;PERIOD_Y;ZO;PAY_TP;PAY_MNTH;PAY_YEAR;OTK;EXP',
          VarArrayOf(
            [cdsT6.FieldByName('NumIdent').AsString,
            cdsT6.FieldByName('Period_M').AsInteger,
            cdsT6.FieldByName('Period_Y').AsInteger,
            cdsT6.FieldByName('ZO').AsInteger,
            cdsT6.FieldByName('Pay_TP').AsInteger,
            cdsT6.FieldByName('Pay_Mnth').AsInteger,
            cdsT6.FieldByName('Pay_Year').AsInteger,
            cdsT6.FieldByName('OTK').AsInteger,
            cdsT6.FieldByName('EXP').AsInteger
            {, cdsT6.FieldByName('NPD').AsInteger}
            // Fix 16:53 16-07-2021
            // Исключаем НеполныйРабочийДень из ключей.
            ]), []) then
        Append
      else
        Edit;

      FieldByName('Period_M').AsInteger   := cdsT6.FieldByName('Period_M').AsInteger;
      FieldByName('Period_Y').AsInteger   := cdsT6.FieldByName('Period_Y').AsInteger;
      FieldByName('Ukr_Gromad').AsInteger := cdsT6.FieldByName('Ukr_Gromad').AsInteger;
      FieldByName('NumIdent').AsString    := cdsT6.FieldByName('NumIdent').AsString;
      FieldByName('ST').AsInteger         := cdsT6.FieldByName('St').AsInteger;
      FieldByName('LN').AsString          := cdsT6.FieldByName('LN').AsString;
      FieldByName('NM').AsString          := cdsT6.FieldByName('NM').AsString;
      FieldByName('FTN').AsString         := cdsT6.FieldByName('FTN').AsString;
      FieldByName('ZO').AsInteger         := cdsT6.FieldByName('ZO').AsInteger;
      FieldByName('OTK').AsInteger        := cdsT6.FieldByName('OTK').AsInteger;
      FieldByName('EXP').AsInteger        := cdsT6.FieldByName('EXP').AsInteger;

      if cdsT6.FieldByName('Pay_TP').AsInteger <> 0 then
        FieldByName('PAY_TP').AsInteger   := cdsT6.FieldByName('Pay_TP').AsInteger;
      FieldByName('Pay_Mnth').AsInteger   := cdsT6.FieldByName('Pay_Mnth').AsInteger;
      FieldByName('Pay_Year').AsInteger   := cdsT6.FieldByName('Pay_Year').AsInteger;

      // Fix 16:53 16-07-2021
      // Теперь запись с НеполнымРабочимДнём будет перезаписывать поле с ПолнымРабочимДнём
      if cdsT6.FieldByName('NPD').AsInteger <> 0 then
        FieldByName('NRC').AsInteger      := cdsT6.FieldByName('NPD').AsInteger;

      if (cdsT6.FieldByName('OTK').AsInteger = 0) then
          if (cdsT6.FieldByName('Pay_TP').AsInteger = PAY_TP_OTP)
              or (cdsT6.FieldByName('Pay_TP').AsInteger = PAY_TP_DIF_MIN_ZP) then
            FieldByName('NRC').AsInteger := 0
          else
            FieldByName('NRC').AsInteger := 1;

      // if cdsT6.FieldByName('Kd_NP').AsInteger <> 0 then
      FieldByName('Kd_NP').AsInteger := Max(FieldByName('Kd_NP').AsInteger,
        cdsT6.FieldByName('Kd_NP').AsInteger);

      // if cdsT6.FieldByName('Kd_NZP').AsInteger <> 0 then
      FieldByName('Kd_NZP').AsInteger := Max(FieldByName('Kd_NZP').AsInteger,
        cdsT6.FieldByName('Kd_NZP').AsInteger);

      // FieldByName('Kd_PTV').AsInteger := Max(FieldByName('Kd_PTV').AsInteger,
      //  cdsT6.FieldByName('Kd_PTV').AsInteger);
      // Fix 18:18 16-07-2021
      // Пишем Kd_PTV только единожды для текущего табельного номера и платёжного периода
      nCurrKD_PTV := Max(nCurrKD_PTV, cdsT6.FieldByName('Kd_PTV').AsInteger);
      //
      if (cdsT6.FieldByName('KD_PTV').AsInteger <> 0)
          and (cdsT6.FieldByName('OTK').AsInteger = 1)
          and not bKD_PTVWritten then begin
        FieldByName('KD_PTV').AsInteger := nCurrKD_PTV;
        bKD_PTVWritten := true;
      end;

      // if cdsT6.FieldByName('Kd_VP').AsInteger <> 0 then
      FieldByName('Kd_VP').AsInteger := Max(FieldByName('Kd_VP').AsInteger,
        cdsT6.FieldByName('Kd_VP').AsInteger);

      FieldByName('Sum_Total').AsFloat    := FieldByName('Sum_Total').AsFloat +
        cdsT6.FieldByName('Sum_Total').AsFloat;
      FieldByName('Sum_Max').AsFloat      := FieldByName('Sum_Max').AsFloat +
        cdsT6.FieldByName('Sum_Max').AsFloat;
      FieldByName('Sum_Ins').AsFloat      := FieldByName('Sum_Ins').AsFloat +
        cdsT6.FieldByName('Sum_Ins').AsFloat;
      FieldByName('Sum_Diff').AsFloat     := FieldByName('Sum_Diff').AsFloat +
        cdsT6.FieldByName('Sum_Diff').AsFloat;
      FieldByName('Sum_Narah').AsFloat    := FieldByName('Sum_Narah').AsFloat +
        cdsT6.FieldByName('Sum_Narah').AsFloat;

      Post;
    end;
    cdsT6.Next;

    if (cdsT6.Eof or (cdsT6.FieldByName('NumIdent').AsString <> cCurrNUMIDENT)
        or (nCurrPAY_YEAR <> cdsT6.FieldByName('PAY_YEAR').AsInteger)
        or (nCurrPAY_MNTH <> cdsT6.FieldByName('PAY_MNTH').AsInteger))
        and not bKD_PTVWritten then begin
      // tbl_06 спозиционирована на поеследней добавленной записи для данного табельного номера
      tbl_06.Edit;
      tbl_06.FieldByName('KD_PTV').AsInteger := nCurrKD_PTV;
      tbl_06.Post;
    end;
  end;
*)
end;

//------------------------------------------------------------------------------
procedure TSpovT6Runner.AddRecInCdsT6(nMySort, nOTK, nZO, nPAY_TP, nPAY_MNTH, nPAY_YEAR,
  nKD_NP, nKD_NZP, nKD_PTV, nKD_VP, nNPC, nEXP: SmallInt;
  nSUM_TOTAL, nSUM_MAX, nSUM_INS, nSUM_DIFF, nSUM_NARAH: double;
  cMyType: ShortString; dZaMG: TDateTime);
var
  nYear, nMnth, dummyWord: word;
begin
(*
  DecodeDate(d_CurPeriodBeg, nYear, nMnth, dummyWord);

  with cdsT6 do begin
    if (nPay_Year < nYear) or (nPay_Year = nYear) and (nPay_Mnth < nMnth) then // SB FIX
      nKD_PTV := 0;

    {
    if (nPay_TP = PAY_TP_OTP) or (nPay_TP = PAY_TP_DIF_MIN_ZP) then begin
      nKD_PTV := 0;
      nKD_NZP := 0;
    end;
    }

    Append;
    FieldByName('MySort').AsInteger     := nMySort;
    FieldByName('MyType').AsString      := cMyType;
    FieldByName('MyZaMG').AsDateTime    := dZaMG;
    FieldByName('Period_M').AsInteger   := nMnth;
    FieldByName('Period_Y').AsInteger   := nYear;
    FieldByName('Ukr_Gromad').AsInteger := GROMAD_UKR;
    FieldByName('St').AsInteger         := n_Gender;
    FieldByName('NumIdent').AsString    := c_TIN;
    FieldByName('LN').AsString          := c_Fam;
    FieldByName('NM').AsString          := c_Ima;
    FieldByName('FTN').AsString         := c_Otch;
    FieldByName('ZO').AsInteger         := nZO;
    FieldByName('Pay_TP').AsInteger     := nPay_TP;
    FieldByName('Pay_Mnth').AsInteger   := nPay_Mnth;
    FieldByName('Pay_Year').AsInteger   := nPay_Year;
    if nKD_NP <> 0 then
      FieldByName('Kd_Np').AsInteger    := nKD_NP;
    if nKD_NZP <> 0 then
      FieldByName('Kd_Nzp').AsInteger   := nKD_NZP;
    if nKD_PTV <> 0 then
      FieldByName('Kd_PTV').AsInteger   := nKD_PTV;
    if nKD_VP <> 0 then
      FieldByName('Kd_VP').AsInteger    := nKD_VP;
    FieldByName('Sum_Total').AsFloat    := nSUM_TOTAL;
    FieldByName('Sum_Max').AsFloat      := nSUM_MAX;
    FieldByName('Sum_Ins').AsFloat      := nSUM_INS;
    if nSUM_DIFF <> 0 then
      FieldByName('Sum_Diff').AsFloat   := nSUM_DIFF;
    if (nSUM_NARAH <> 0) and (nSUM_MAX <> 0) then begin
      FieldByName('Sum_Narah').AsFloat  := nSUM_NARAH; end
    else
      FieldByName('Sum_Narah').AsFloat  := nSUM_NARAH;
    FieldByName('OTK').AsInteger        := nOTK;
    FieldByName('NPD').AsInteger        := nNPC;
    FieldByName('EXP').AsInteger        := nEXP;
    Post;
  end;
*)
end;

//------------------------------------------------------------------------------
// Заполняет CDS периодами работы в течение заданного месяца
//------------------------------------------------------------------------------
procedure TSpovT6Runner.CreOpenCdsPtv_PPS(
  nTabN: integer;
  dZaMG: TDateTime);
var
 // dDPR, dDZR даты начала и окончания работы
  dDtEOM, dDPR, dDZR: TDateTime;
  nY, nM, nD: word;
begin
(*
  dDtEOM := MyLastDOM(dZaMG);

  with cdsPTV_PPS do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;

  InitQuery(qryIsWrk);

  with qryIsWrk do begin
    SQL.Add(
      'select * from z_PrmUv ' +
      'where TabN = :nTabN ' +
        'and Dt_Priem <= :DtEnd ' +
        'and (Dt_Uvoln is NULL or Dt_Uvoln >= :DtBeg) ' +
      'order by Dt_Priem');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('DtBeg').AsDateTime := dZaMG;
    ParamByName('DtEnd').AsDateTime := dDtEOM;
    Open;

    while not Eof do begin
      if FieldByName('Dt_Priem').AsDateTime <= dZaMG then
        dDPR := dZaMG
      else
        dDPR := FieldByName('Dt_Priem').AsDateTime;

      if FieldByName('Dt_Uvoln').IsNULL then
        dDZR := dDtEOM
      else
        dDZR := Min(dDtEOM, FieldByName('Dt_Uvoln').AsDateTime);

      cdsPTV_PPS.Append;

      cdsPTV_PPS.FieldByName('TabN').AsInteger := nTabN;

      DecodeDate(dDPR, nY, nM, nD);
      cdsPTV_PPS.FieldByName('Start_Dt').AsInteger := nD;

      DecodeDate(dDZR, nY, nM, nD);
      cdsPTV_PPS.FieldByName('Stop_Dt').AsInteger  := nD;

      cdsPTV_PPS.FieldByName('Days').AsInteger :=
        cdsPTV_PPS.FieldByName('Stop_Dt').AsInteger -
        cdsPTV_PPS.FieldByName('Start_Dt').AsInteger + 1;

      if not FieldByName('Dt_Uvoln').IsNULL
          and (FieldByName('Dt_Uvoln').AsDateTime <= dDtEOM) then begin
        cdsPTV_PPS.FieldByName('Num_Nak').AsString := FieldByName('Nr_PrUvoln').AsString;
        cdsPTV_PPS.FieldByName('Dt_Nak').AsString  := FieldByName('Dt_PrUvoln').AsString;
      end else begin
        cdsPTV_PPS.FieldByName('Num_Nak').AsString := FieldByName('Nr_Prikaza').AsString;
        cdsPTV_PPS.FieldByName('Dt_Nak').AsString  := FieldByName('Dt_Prikaza').AsString;
      end;

      cdsPTV_PPS.Post;
      Next;
    end;
  end;

  ReleaseQuery(qryIsWrk);
*)
end;

//------------------------------------------------------------------------------
// Добавляем пару значений: табельный номер - налоговый номер
// Используется для того, чтобы по налоговому номеру получить табельный
//------------------------------------------------------------------------------
procedure TSpovT6Runner.AddRecInCdsID_TabN(nTabN: integer; cID: ShortString);
begin
(*
  with cdsId_TabN do begin
    if not Locate('ID', cID, []) then begin
      Append;
      cdsId_TabNTabN.AsInteger := nTabN;
      cdsId_TabNID.AsString := cID;
      Post;
    end;
  end;
*)
end;

//------------------------------------------------------------------------------
// Финал. Запись в таблицу 6
//------------------------------------------------------------------------------
procedure TSpovT6Runner.WriteToTbl06(
  recT6: TT6Rec;
  nOTK, nZO, nPay_TP, nPay_Mnth, nPay_Year,
  nKdNP, nKdNZP, nKdPTV, nKdVP,
  nNRC, nNRM, nExp: SmallInt;
  nSmTotal, nSmMax, nSmIns, nSmDiff, nSmNarah : double);
var
  nDays: integer;
begin
  nDays := MyLastDayOM(EncodeDate(nPAY_YEAR, nPAY_MNTH, 1));

  with TblT6 do begin
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
procedure TSpovT6Runner.WriteToTbl07(
  nTabN: integer;
  dZaMG: TDateTime;
  recT6: TT6Rec;
  cPID: string;
  nNormZ,
  nHH, nMM, nNorma, nSeason: integer);

begin
(*
  with TblT7 do begin
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
        FieldByName('Start_Dt').AsInteger   := cdsPTV_PPS.FieldByName('Start_Dt').AsInteger;
        FieldByName('Stop_Dt').AsInteger    := cdsPTV_PPS.FieldByName('Stop_Dt').AsInteger;
        FieldByName('Days').AsInteger       := cdsPTV_PPS.FieldByName('Days').AsInteger;
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
function TSpovT6Runner.IsInvalid(nPRR : SmallInt) : boolean;
begin
  { PRR = 0,1,2 - не инвалиды (ZO = 1); 3,5,7 - инвалиды (ZO = 2) }
  Result := false;
  if (nPRR in [3,4,7]) then
    Result := true;
end;

//------------------------------------------------------------------------------
class function TSpovT6Runner.InitNuRec: TNuRec;
begin
  Result.VidN := '';
  Result.Period := TDateUtils.CreatePeriod;
end;

//------------------------------------------------------------------------------
function TSpovT6Runner.InitT6Rec: TT6Rec;
var
  dummyWord: word;
begin
  DecodeDate(period_Report.start, Result.PERIOD_Y, Result.PERIOD_M, dummyWord);
  Result.UKR_GROMAD := 0;
  Result.ST := 0;
  Result.NUMIDENT := '';
  Result.LN := '';
  Result.NM := '';
  Result.FTN := '';
  Result.ZO := 0;
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
  Result.OTK := 0;
  Result.EXP := 0;
  Result.NRC := 0;
  Result.NRM := 0;
  Result.OZN := 0;
end; {InitT6Rec}

//------------------------------------------------------------------------------
function TSpovT6Runner.InitTotals: TTotals;
begin
(*
  Result.nOTK := 0;
  Result.nNPC := 0;

  Result.nSm1210 := 0;
  Result.nSmCmn := 0;
  Result.nSmDCmn := 0;
  Result.nSmOtpCmn := 0;
  Result.nSmDOtpCmn := 0;
  Result.nSmPCmn := 0;
  Result.nSvPCmn := 0;
  Result.nSmPrpCmn := 0;
  Result.nSmPrpInvCmn := 0;
  Result.nSmPps := 0;
  Result.nSmDPps := 0;
  Result.nSmOtpPps := 0;
  Result.nSmDOtpPps := 0;
  Result.nSmPPps := 0;
  Result.nSvPPps := 0;
  Result.nSmPrpPps := 0;
  Result.nSmPrpInvPps := 0;

  Result.nSmPmCmn := 0;
  Result.nSmPmDCmn := 0;
  // Result.nSmPmPCmn := 0;
  // Result.nPmSvPCmn := 0;
  // Result.nSmPmPrpCmn := 0;
  // Result.nSmPmPrpInvCmn := 0;

  Result.nSmPmPps := 0;
  Result.nSmPmDPps := 0;
  // Result.nSmPmPPps := 0;
  // Result.nPmSvPPps := 0;
  // Result.nSmPmPrpPps := 0;
  // Result.nSmPmPrpInvPps := 0;

  Result.nSmBln := 0;
  Result.nSmDBln := 0;
  Result.nSmPBln := 0;
  Result.nSvPBln := 0;
  Result.nSmPrpBln := 0;

  Result.nSmDDekr := 0;
  Result.nSmPDekr := 0;
  Result.nSvPDekr := 0;
  Result.nSmPrpDekr := 0;

  Result.nSmDgv := 0;
  Result.nSmDDgv := 0;
  Result.nSmPDgv := 0;
  Result.nSvPDgv := 0;
  Result.nSmPrpDgv := 0;
  Result.nSmOtp := 0;
  Result.nSmDOtp := 0;
  Result.nSmPOtp := 0;

  Result.nSmVozvr := 0;
  Result.nSmDVozvr := 0;
  Result.nSmPVozvr := 0;

  Result.nSmDekr := 0;

  Result.nSm8711 := 0;
  Result.nSm8712 := 0;
  Result.nSm8713 := 0;
  Result.nSm8715 := 0;
  Result.nSm8716 := 0;
  Result.nSm8717 := 0;

  Result.bIsWrk := false;
  Result.bIsInv := false;
  Result.bIsBln  := false;
  Result.bIsOtp  := false;
  Result.bIsDekr := false;
  Result.bIsOtp3 := false;
  Result.bIsOtp6 := false;
  Result.bIsPps := false;

  Result.cPidZv := '';

  Result.nKdNpBln := 0;
  Result.nKdNpDkr := 0;
  Result.nKdNzp := 0;
  Result.nKdPTV := 0;

  Result.dDtBDekr := 0;
  Result.dDtEDekr := 0;

  Result.dDtBOtp3 := 0;
  Result.dDtEOtp3 := 0;
  Result.dDtBOtp6 := 0;
  Result.dDtEOtp6 := 0;
  Result.dDPR := 0;
  Result.dDZR := 0;
*)
end;

//------------------------------------------------------------------------------
function TSpovT6Runner.GetActualWrkPeriod(periodZaMesGod: TPeriod): TPeriod;
begin
  // Определить даты начала и конца работы в периоде.
  // Если принят до начала периода и не уволен или уволен
  // после окончания периода - должны вернуться dDtBegMG и dDtEndMG. Если уволен до
  // dDtBegMG или принят после dDtEndMG - должны вернуться нулевые даты.
  // Иначе - даты ограниченные приемом и увольнением. qryPrmUv открывается
  // запросом:
  // Select * from z_PrmUv where TabN = :nTabN and
  //           Dt_Priem <= :dDtEnd order by Dt_Priem, NR (прямая сортировка)
  // где :dDtEnd - это конец месяца персонификации        =================
(*
  dDPR := 0;
  dDZR := 0;
  with qryPrmUv do begin
    Last;
    while not Bof do begin
      if not FieldByName('Dt_Priem').IsNull and
               (FieldByName('Dt_Priem').AsDateTime <= dDtEndMG) then begin
        dDPR := Max(FieldByName('Dt_Priem').AsDateTime, dDtBegMG);
        if FieldByName('Dt_Uvoln').IsNull or
                    (FieldByName('Dt_Uvoln').AsDateTime >= dDtEndMG) then
          dDZR := dDtEndMG
        else if (FieldByName('Dt_Uvoln').AsDateTime >= dDtBegMG) and
                   (FieldByName('Dt_Uvoln').AsDateTime <= dDtEndMG) then
          dDZR := Min(dDtEndMG, FieldByName('Dt_Uvoln').AsDateTime);
        Break;
      end;
      Prior;
    end;
  end;
*)
end;

//------------------------------------------------------------------------------
function TSpovT6Runner.GetKdPTV(nTabN: integer; dZaMG: TDateTime): TPeriod;
var
  dDtEndM, dDPR, dDZR: TDateTime;
begin
(*
  Result := 0;
  dDtEndM := MyLastDOM(dZaMG);
  with qryIsWrk do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from  Z_ISWRK(:nTabN, :dOnDate)');
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('dOnDate').AsDateTime := dZaMG;
    Open;
    cNr_Pr_Prm   := FieldByName('Nr_Pr_Prm').AsString;
    dDt_Pr_Prm   := FieldByName('Dt_Pr_Prm').AsDateTime;
    cNr_Pr_Uv    := FieldByName('Nr_Pr_Uv').AsString;
    dDt_Pr_Uv    := FieldByName('Dt_Pr_Uv').AsDateTime;
    while not Eof do begin
      if FieldByName('Dt_Priem').AsDateTime <= dZaMG then
        dDPR := dZaMG
      else
        dDPR := FieldByName('Dt_Priem').AsDateTime;
      if FieldByName('Dt_Uvoln').IsNULL then
        dDZR := dDtEndM
      else
        dDZR := Min(dDtEndM, FieldByName('Dt_Uvoln').AsDateTime);
      Result := Result + Round(dDZR - dDPR) + 1;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
*)
end;

//------------------------------------------------------------------------------
// Вывод информации о ходе выполнения
//------------------------------------------------------------------------------
procedure TSpovT6Runner.DisplayProgressT67(nCurRow, nRowsTotal: integer;
  cStepName, cState: string);
var
  nMonth, dummyWord: word;
begin
//  DecodeDate(d_CurPeriodBeg, dummyWord, nMonth, dummyWord);
  // DisplayProgress('Приложения 1, 6', n_Year, n_Quarter, nMonth, nCurRow, nRowsTotal, 0,
//    cStepName, cState);
end;

(*
        if (cPol = 'М') or (cPol = 'Ч') or (cPol = 'м') or (cPol = 'ч') then
          n_Gender := 1
        else
          n_Gender := 0;
*)

end.
