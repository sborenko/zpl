unit SickPregCmn;

interface

uses Db, DbTables, DbClient, StdCtrls, SysUtils, CustDateUtils;

const
  PREGNANCY = 1;

  PREGNANCY_STANDARD = 8;
  PREGNANCY_DIGITAL  = 2;

  PAPER_PROF_SICK = 2;
  PAPER_ACCIDENT = 4;

  DIGIT_ACCIDENT = 11;
  DIGIT_PROF_SICK = 12;
type
  TBlnType = (BlnTypeStandard, BlnTypeDigital, BlnTypeAll);

  TSrednDnevn = record
    nSumTtOsn, nSumTtSovm,
    nDaysOsn, nDaysSovm,
    nSrDnOsn, nSrDnSovm: double;
  end;

  TBlnUtils = class
  public
    class function BlankSrednDnevn: TSrednDnevn;

    class function DigitalToBlnType(cDigital: ShortString): TBlnType;
    class function BlnTypeToDigital(eBlnType: TBlnType): ShortString;
    class function GetBlnReason(BlnType: TBlnType; Reason: SmallInt): SmallInt;

    class function PeekVBlnBySpecNR(Query: TQuery; SpecNR: integer): boolean;

    class function CalcAverages(QryRBln: TDataSet;
      RestoreEnableControls: boolean = true): TSrednDnevn;
    class procedure DisplayAverages(ListIsCont, Use12Mnth: boolean;
      LblTopAvrg, LblMidAvrg, LblBtmAvrg: TLabel;
      Values: TSrednDnevn);

    class function IsAccident(Digital: ShortString; Reason: SmallInt): Boolean;
  end;

implementation

uses
  Math, a_Lib, a_Const, z_DM, QryUtils, NumUtils;

//------------------------------------------------------------------------------
// Обнуление средне-дневных значений
//------------------------------------------------------------------------------
class function TBlnUtils.BlankSrednDnevn: TSrednDnevn;
begin
  Result.nSumTtOsn  := 0;
  Result.nSumTtSovm := 0;
  Result.nDaysOsn   := 0;
  Result.nDaysSovm  := 0;
  Result.nSrDnOsn   := 0;
  Result.nSrDnSovm  := 0;
end;

//------------------------------------------------------------------------------
class function TBlnUtils.DigitalToBlnType(cDigital: ShortString): TBlnType;
begin
  if cDigital = 'N' then
    Result := BlnTypeStandard
  else if cDigital = 'Y' then
    Result := BlnTypeDigital
  else
    Result := BlnTypeAll;
end;

//------------------------------------------------------------------------------
class function TBlnUtils.BlnTypeToDigital(eBlnType: TBlnType): ShortString;
begin
  if eBlnType = BlnTypeStandard then
    Result := 'N'
  else if eBlnType = BlnTypeDigital then
    Result := 'Y'
  else
    Result := '';
end;

//------------------------------------------------------------------------------
class function TBlnUtils.GetBlnReason(BlnType: TBlnType; Reason: SmallInt): SmallInt;
begin
  Result := 0;

  case Reason of
  PREGNANCY:
    if BlnType = BlnTypeStandard then
      Result := PREGNANCY_STANDARD
    else
      Result := PREGNANCY_DIGITAL;
  end;
end;

//------------------------------------------------------------------------------
class function TBlnUtils.PeekVBlnBySpecNR(Query: TQuery; SpecNR: integer): boolean;
begin
  InitQuery(Query);

  with Query do begin
    SQL.Add('select * from Z_VBln where Spec_NR = :SpecNR');
    ParamByName('SpecNR').AsInteger := SpecNR;
    Open;
    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
// Показать средне-дневные
//------------------------------------------------------------------------------
class procedure TBlnUtils.DisplayAverages(
  ListIsCont, Use12Mnth: boolean;
  LblTopAvrg, LblMidAvrg, LblBtmAvrg: TLabel;
  Values: TSrednDnevn);
begin
  with Values do begin
    if ListIsCont then begin
      LblTopAvrg.Caption :=
        'В расчёт принимается среднее предыдущего листка.';
      LblMidAvrg.Caption := '';
      LblBtmAvrg.Caption :=
        'Общее Среднедневное = ' + FloatToStr(nSrDnOsn + nSrDnSovm);
    end else if Use12Mnth then begin
      LblTopAvrg.Caption :=
        'Осн. в зачёт = ' + FloatToStr(nSumTtOsn) +
        '; Осн. дней = ' + FloatToStr(nDaysOsn) +
        '; Осн. ср.дн = ' + FloatToStr(nSrDnOsn);
      LblMidAvrg.Caption :=
        'Совм. в зачёт = ' + FloatToStr(nSumTtSovm) +
        '; Совм. дней = ' + FloatToStr(nDaysSovm) +
        '; Совм. ср.дн = ' + FloatToStr(nSrDnSovm);
      LblBtmAvrg.Caption :=
        'Общее Среднедневное = ' + FloatToStr(nSrDnOsn + nSrDnSovm);
    end else begin
      LblTopAvrg.Caption := '';
      LblMidAvrg.Caption :=
        'В зачёт = ' + FloatToStr(nSumTtOsn) +
        '; Дней = ' + FloatToStr(nDaysOsn) +
        '; Ср.-дн = ' + FloatToStr(nSrDnOsn);
      LblBtmAvrg.Caption := '';
    end;
  end; {with}
end;

//------------------------------------------------------------------------------
// Расчёт средних по z_RBln.
//------------------------------------------------------------------------------
class function TBlnUtils.CalcAverages(
  QryRBln: TDataSet;
  RestoreEnableControls: boolean = true): TSrednDnevn;
var
  Position: TDateTime;
  SumFullTime: double;
begin
  Result := TBlnUtils.BlankSrednDnevn;

  with QryRBln, Result do begin
    DisableControls;

    Position := FieldByName('ZaMesGod').AsDateTime;

    First;
    while not Eof do begin
      SumFullTime := FieldByName('SmZarabotka').AsFloat;

      // Такое может быть для расчётов "по окладу".
      // Проблема в том, что при расчёте по 12-ти мес. и по окладу суммы
      // ложатся в разные поля. По 12-мес. - в SmVZachet_Cmn и SmVZachet_Svm,
      // по окл. - в SmZarabotka.

      if Abs(SumFullTime) < 0.001 then
        SumFullTime := FieldByName('SmZarabotka').AsFloat;

      nSumTtOsn := nSumTtOsn + SumFullTime;

      nDaysOsn := nDaysOsn + QryRBln.FieldByName('CntDays').AsFloat;

      nSumTtSovm := nSumTtSovm + QryRBln.FieldByName('Sm_Svm').AsFloat;
      nDaysSovm  := nDaysSovm + QryRBln.FieldByName('CntDays_Svm').AsFloat;

      Next;
    end;

    Locate('ZaMesGod', Position, []);

    if RestoreEnableControls then
      EnableControls;

    if nDaysOsn = 0 then
      nSrDnOsn := 0
    else
      // nSrDnOsn := RoundTo(nSumTtOsn / nDaysOsn, -2);
      // issue 240424
      nSrDnOsn := TNumUtils.RoundToKopeck(nSumTtOsn / nDaysOsn);

    if nDaysSovm = 0 then
      nSrDnSovm := 0
    else
      // nSrDnSovm := RoundTo(nSumTtSovm / nDaysSovm, -2);
      // issue 240424
      nSrDnSovm := TNumUtils.RoundToKopeck(nSumTtSovm / nDaysSovm);
  end; {with}
end; {CalcAverages}

//------------------------------------------------------------------------------
class function TBlnUtils.IsAccident(
  Digital: ShortString;
  Reason: SmallInt
): Boolean;
begin
  if Digital = 'Y' then
    Result := (Reason = DIGIT_PROF_SICK) or (Reason = DIGIT_ACCIDENT)
  else
    Result := (Reason = PAPER_PROF_SICK) or (Reason = PAPER_ACCIDENT);
end;

end.

