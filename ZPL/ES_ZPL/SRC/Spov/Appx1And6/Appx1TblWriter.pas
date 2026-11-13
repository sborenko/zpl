unit Appx1TblWriter;

interface

uses
  Db, Variants, Appx1And6Stage, Appx1And6MnthStage, DsLib, ReportSpov;

type
  Appx1Writer = class
  private
    class function FindFitToMerge: boolean;
    class procedure MergeDecisionProc(
      TblAppx1Rec: TDataSet; var Decision: TEnumDecision);

    class function KeysAreMergeable(TblAppx1Rec: TDataSet): boolean;
    class function ZoIsStatic(Rec: TDataSet): boolean;
    class function ZoIsActive(Rec: TDataSet): boolean;

    class procedure MergeRecords;
    class procedure MergeIntVals(FldName: ShortString);
    class procedure LogLostValue(FldName: ShortString; Value: ShortString);

    class procedure SumToAppx1Tbl(Appx1Rec: TDataSet);

    class procedure WriteDiseaseDays;
    class procedure WriteNonPayDays;
    class procedure WriteEmplmntDays;
    class procedure WritePregnDays;
    class procedure WriteNrcFlag;

    //..........................................................................
//    class function GetAppx1Keys: ShortString;
//    class function GetAppx1KeyValues(Appx1Rec: TDataSet): TVariantArray;

    //... CALLBACK .............................................................
    class function NonPayDaysFilter(Appx1Rec, NonPayRec: TDataSet): boolean;
    class function MoveFldFilter(FldName: ShortString): boolean;
//    class function KeyCompareFldFilter(FldName: ShortString): boolean;

    //... CONVERT ..............................................................
    class function GenderToSt(Gender: string): integer;

  public
    class procedure SetEnvironment(SpovReport: TSpovReport;
      Appx1And6Stage: TAppx1And6Stage;
      Appx1And6MnthStage: TAppx1And6MnthStage);

    class procedure AddOrUpdateAppx1Tbl(ParamAppx1Rec: TDataSet);

    class function SumsAreZero(Appx1Rec: TAppx1Rec): boolean; overload;
    class function SumsAreZero(Appx1Rec: TDataSet): boolean; overload;
    class function CountDaysTotalAndDelete(DataSet: TDataSet;
      BegFldName, EndFldName: ShortString; PayMnth, PayYear: word;
      FilterFunc: TDoubleSetFunc = nil): integer;
  end;

implementation

uses
  SysUtils, DateLib, LogLib, MathLib, Appx6TblWriter;

var
  Report: TSpovReport;
  AppxStage: TAppx1And6Stage;
  MnthStage: TAppx1And6MnthStage;
  CurEmplSsn: ShortString;
  Appx1Rec: TDataSet;

//------------------------------------------------------------------------------
class procedure Appx1Writer.SetEnvironment(
  SpovReport: TSpovReport;
  Appx1And6Stage: TAppx1And6Stage;
  Appx1And6MnthStage: TAppx1And6MnthStage);
begin
  Report := SpovReport;
  
  AppxStage := Appx1And6Stage;
  MnthStage := Appx1And6MnthStage;
end;

//------------------------------------------------------------------------------
class procedure Appx1Writer.AddOrUpdateAppx1Tbl(ParamAppx1Rec: TDataSet);
var
  AllKeysFit,
  FitToMerge: Boolean;
  Keys: ShortString;
  KeyValues: array of Variant;
begin
  Appx1Rec := ParamAppx1Rec;

  CurEmplSsn := AppxStage.QryEmplList.FieldByName('Id').AsString;

  AllKeysFit := false;
  FitToMerge := false;

  Keys := 'NUMIDENT;PAY_MNTH;PAY_YEAR;ZO;PAY_TP;OTK;EXP';
  with Appx1Rec do
    KeyValues := VarArrayOf([CurEmplSsn,
      FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger,
      FieldByName('ZO').AsInteger, FieldByName('PAY_TP').AsInteger,
      FieldByName('OTK').AsInteger, FieldByName('EXP').AsInteger]);

  with Report, TblAppx1, AppxStage, MnthStage.ReportDate do begin
    if Locate(Keys, KeyValues, []) then
      AllKeysFit := true
    else
      // Ищем возможность объединить записи, если одна из них -
      // с пустыми суммами.
      if FindFitToMerge then
        FitToMerge := true;

    if AllKeysFit or FitToMerge then begin
        Edit;
        if FitToMerge then
          MergeRecords;
    end else begin
      Append;

      FieldByName('PERIOD_M').AsInteger := Mnth;
      FieldByName('PERIOD_Y').AsInteger := Year;

      if QryEmplList.FieldByName('UkrCitiz').AsString = 'Y' then
        FieldByName('UKR_GROMAD').AsInteger := 1
      else
        FieldByName('UKR_GROMAD').AsInteger := 0;

      FieldByName('ST').AsInteger :=
        GenderToSt(QryEmplList.FieldByName('Pol').AsString);
      FieldByName('NUMIDENT').AsString :=
        QryEmplList.FieldByName('Id').AsString;
      FieldByName('LN' ).AsString  :=
        AnsiUpperCase(Trim(QryEmplList.FieldByName('Fam').AsString));
      FieldByName('NM' ).AsString  :=
        AnsiUpperCase(Trim(QryEmplList.FieldByName('Ima').AsString));
      FieldByName('FTN').AsString :=
        AnsiUpperCase(Trim(QryEmplList.FieldByName('Otch').AsString));

      DsUtils.CopyRecord(Appx1Rec, TblAppx1, nil, MoveFldFilter);
    end;

    WriteDiseaseDays;
    WriteNonPayDays;
    // Это работает:
    // !!! WriteEmplmntDays;
    // но KD_PTV пишется в совместительскую запись, поскольку она в сортировке
    // предшествует основной. Переносим запись KD_PTV в CdsAppx1Inter.
    // Будем искать возможность сначала зписать в основную не 13-ю,
    // затем - в совмест. не 13-ю, затем - в любую за текущий месяц.
    WritePregnDays;

    // Пишем суммы.
    SumToAppx1Tbl(Appx1Rec);

    WriteNrcFlag;

    Post;

    if FieldByName('EXP').AsInteger = 1 then begin
      // Пишем ППС в 6-ю таблицу.
      with Report do
        Appx6Writer.WriteEmployee(TblAppx6, TblAppx1, MnthStage.CdsEmplmntDays);
    end;
  end;
end;

//------------------------------------------------------------------------------
class procedure Appx1Writer.MergeRecords;
begin
  with Report, TblAppx1 do begin
    // Активное ZO при слиянии перезаписывает статическое.
    if ZoIsActive(Appx1Rec) then
      FieldByName('ZO').AsInteger := Appx1Rec.FieldByName('ZO').AsInteger;

    MergeIntVals('PAY_TP');

    MergeIntVals('KD_NP');
    MergeIntVals('KD_NZP');
    MergeIntVals('KD_PTV');
    MergeIntVals('KD_VP');
{
    MergeFloatVals('SUM_TOTAL');
    MergeFloatVals('SUM_MAX');
    MergeFloatVals('SUM_DIFF');
    MergeFloatVals('SUM_INS');
    MergeFloatVals('SUM_NARAH');
}
  end;
end;
//..............................................................................
class procedure Appx1Writer.MergeIntVals(FldName: ShortString);
begin
  with Report, TblAppx1 do
    if FieldByName(FldName).AsInteger = 0 then
      FieldByName(FldName).AsInteger := Appx1Rec.FieldByName(FldName).AsInteger
    else
      if Appx1Rec.FieldByName(FldName).AsInteger <> 0 then
        LogLostValue(FldName, Appx1Rec.FieldByName(FldName).AsString);
end;
//..............................................................................
class procedure Appx1Writer.LogLostValue(
  FldName: ShortString;
  Value: ShortString);
begin
  LogUtils.Log('NUMIDENT: ' + CurEmplSsn + '; ' + FldName + ': ' + Value);
end;

//------------------------------------------------------------------------------
class procedure Appx1Writer.SumToAppx1Tbl(Appx1Rec: TDataSet);
begin
  with Report.TblAppx1 do begin
    FieldByName('SUM_TOTAL').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_TOTAL').AsFloat, 2) +
      MathUtils.Round(Appx1Rec.FieldByName('SUM_TOTAL').AsFloat, 2), 2);

    FieldByName('SUM_MAX').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_MAX').AsFloat, 2) +
      MathUtils.Round(Appx1Rec.FieldByName('SUM_MAX').AsFloat, 2), 2);

    FieldByName('SUM_DIFF').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_DIFF').AsFloat, 2) +
      MathUtils.Round(Appx1Rec.FieldByName('SUM_DIFF').AsFloat, 2), 2);

    FieldByName('SUM_INS').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_INS').AsFloat, 2) +
      MathUtils.Round(Appx1Rec.FieldByName('SUM_INS').AsFloat, 2), 2);

    FieldByName('SUM_NARAH').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_NARAH').AsFloat, 2) +
      MathUtils.Round(Appx1Rec.FieldByName('SUM_NARAH').AsFloat, 2), 2);
  end;
end;

//------------------------------------------------------------------------------
class procedure Appx1Writer.WriteDiseaseDays;
var
  DaysCount: SmallInt;
begin
  with Report.TblAppx1 do
    if (FieldByName('ZO').AsInteger = ZO_DISEASE)
        or (FieldByName('ZO').AsInteger = ZO_DISABLE_DISEASE) then begin

      DaysCount := CountDaysTotalAndDelete(
        MnthStage.CdsDiseaseDays, 'Dt_Beg', 'Dt_End',
        FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger);

      if DaysCount <> 0 then
        FieldByName('KD_NP').AsInteger := DaysCount;
    end;
end;
// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
class procedure Appx1Writer.WriteNonPayDays;
var
  DaysCount: SmallInt;
begin
  with Report.TblAppx1 do begin
    DaysCount := CountDaysTotalAndDelete(
      MnthStage.CdsNonPayDays, 'Dt_Beg', 'Dt_End',
      FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger,
      NonPayDaysFilter);

    if DaysCount <> 0 then
      FieldByName('KD_NZP').AsInteger := DaysCount;
  end;
end;
// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
class procedure Appx1Writer.WriteEmplmntDays;
var
  DaysCount: SmallInt;
begin
  with Report.TblAppx1, MnthStage do
    // KD_PTV пишем только один раз и только для текущего месяца или,
    // в случае ZO = ZO_PREGN или ZO_DISABLE_PREGN - для каждого месяца.
    if (FieldByName('PAY_MNTH').AsInteger = ReportDate.Mnth)
        and (FieldByName('PAY_YEAR').AsInteger = ReportDate.Year)
        or (FieldByName('ZO').AsInteger = ZO_PREGN)
        or (FieldByName('ZO').AsInteger = ZO_DISABLE_PREGN) then begin

      DaysCount := CountDaysTotalAndDelete(
        CdsPtvDays, 'Dt_Priem', 'Dt_Uvoln',
        FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger);

      if DaysCount <> 0 then
        FieldByName('KD_PTV').AsInteger := DaysCount;
    end;
end;
// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
class procedure Appx1Writer.WritePregnDays;
var
  DaysCount: SmallInt;
begin
  with Report.TblAppx1 do
    if (FieldByName('ZO').AsInteger = ZO_PREGN)
        or (FieldByName('ZO').AsInteger = ZO_DISABLE_PREGN) then begin

      DaysCount := CountDaysTotalAndDelete(
        MnthStage.CdsPregnDays, 'Dt_Beg', 'Dt_End',
        FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger);

      FieldByName('KD_VP').AsInteger := DaysCount;
    end;
end;

//------------------------------------------------------------------------------
class procedure Appx1Writer.WriteNrcFlag;
begin
  // if (CdsAppx1.FieldByName('PAY_TP').AsInteger <> PAY_TP_OTP) and
  //    (CdsAppx1.FieldByName('PAY_TP').AsInteger <> PAY_TP_DIF_MIN_ZP) then
  // Временно ставим всем видам истинное значение NRC и исключаем из сравнения.

    with Report.TblAppx1 do begin
//      Edit;
      FieldByName('NRC').AsInteger :=
        Appx1Rec.FieldByName('NRC').AsInteger;
//      Post;
    end;
end;

//------------------------------------------------------------------------------
// Если PAY_TP пришедшей записи - нулевой и есть существующая запись
// с ненулевым PAY_TP и такими же ключами, и наоборот: если PAY_TP
// пришедшей записи - ненулевой и есть существующая запись с такими же
// ключами, и нулевым PAY_TP, дописываем пришедшую в существующую.
//------------------------------------------------------------------------------
class function Appx1Writer.FindFitToMerge: boolean;
var
  Keys: ShortString;
  KeyValues: array of Variant;
begin
  Keys := 'NUMIDENT;PAY_MNTH;PAY_YEAR;OTK;EXP';
  with Appx1Rec do
    KeyValues := VarArrayOf([CurEmplSsn,
      FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger,
      FieldByName('OTK').AsInteger, FieldByName('EXP').AsInteger]);

  with Report, TblAppx1 do begin
    Locate(Keys, KeyValues, []);
    Result := DsUtils.EnumAndDecide(TblAppx1, MergeDecisionProc) = EnumSuccess;
  end;
end;
//..............................................................................
class procedure Appx1Writer.MergeDecisionProc(
  TblAppx1Rec: TDataSet;
  var Decision: TEnumDecision);
var
  PayMnth, PayYear: Word;
  Numident: ShortString;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function CountNon13th(DataSet: TDataSet): Word;
  var
    Mark: TBookmark;
  begin
    Result := 0;

    with DataSet do begin
      Mark := GetBookmark;

      Locate('NUMIDENT;PAY_MNTH;PAY_YEAR',
        VarArrayOf([Numident, PayMnth, PayYear]), []);

      while not Eof and (FieldByName('NUMIDENT').AsString = Numident)
          and (FieldByName('PAY_MNTH').AsInteger = PayMnth)
          and (FieldByName('PAY_YEAR').AsInteger = PayYear) do begin

        if FieldByName('PAY_TP').AsInteger <> PAY_TP_DIF_MIN_ZP then
          Inc(Result);

        Next;
      end;

      GotoBookmark(Mark);
      FreeBookmark(Mark);
    end;
  end;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function RecIsMergeable(ZeroRec, NomineeRec: TDataSet): Boolean;
  begin
    // Особый случай - объединение с типом 13: PAY_TP_DIF_MIN_ZP.
    if (NomineeRec.FieldByName('PAY_TP').AsInteger = PAY_TP_DIF_MIN_ZP) then
      // 13-й тип не может сливаться с пустыхой, если у пустыхи
      // установлен KD_PTV. Иначе, 13-я становится обладателем KD_PTV.
      // Но, если нет других записей в этом отчётном периоде, которые
      // останутся без KD_PTV из-за того, что его перехватила 13-я, то
      // сливать всё-таки можно.
      Result := (ZeroRec.FieldByName('KD_PTV').AsInteger = 0)
          or {(CountNon13th(ZeroRec) = 1) // 1 - это сама нулевая
          and} (CountNon13th(NomineeRec) = 1)
    else
      Result := true;
  end;
begin
  with Appx1Rec do begin
    Numident := FieldByName('NUMIDENT').AsString;
    PayMnth := FieldByName('PAY_MNTH').AsInteger;
    PayYear := FieldByName('PAY_YEAR').AsInteger;
  end;

  with TblAppx1Rec do begin
    if (FieldByName('NUMIDENT').AsString <> Numident)
        or (FieldByName('PAY_YEAR').AsInteger <> PayYear)
        or (FieldByName('PAY_MNTH').AsInteger <> PayMnth)
        or Eof then
      Decision := EnumFailed
    else
      // Определяем, можно ли объединить записи.
      if KeysAreMergeable(TblAppx1Rec) and (
          (Appx1Rec.FieldByName('PAY_TP').AsInteger = PAY_TP_DEFAULT)
            and SumsAreZero(Appx1Rec)
            and RecIsMergeable(Appx1Rec, TblAppx1Rec)
          or (FieldByName('PAY_TP').AsInteger = PAY_TP_DEFAULT)
            and SumsAreZero(TblAppx1Rec))
            and RecIsMergeable(TblAppx1Rec, Appx1Rec)
      then
      Decision := EnumSuccess;
  end;
end;
//..............................................................................
// Накладываться и дополнять поля друг друга могут, например,
// ZO_CMN и ZO_DISEASE, но не могут ZO_PPS и ZO_CMN.
//..............................................................................
class function Appx1Writer.KeysAreMergeable(TblAppx1Rec: TDataSet): boolean;
begin
  Result := ((TblAppx1Rec.FieldByName('ZO').AsInteger =
        Appx1Rec.FieldByName('ZO').AsInteger)
      or ZoIsStatic(TblAppx1Rec) and ZoIsActive(Appx1Rec)
      or ZoIsStatic(Appx1Rec) and ZoIsActive(TblAppx1Rec))
    and (TblAppx1Rec.FieldByName('OTK').AsInteger =
        Appx1Rec.FieldByName('OTK').AsInteger)
    and (TblAppx1Rec.FieldByName('EXP').AsInteger =
        Appx1Rec.FieldByName('EXP').AsInteger);
end;
//..............................................................................
class function Appx1Writer.ZoIsStatic(Rec: TDataSet): boolean;
begin
  Result := Rec.FieldByName('ZO').AsInteger in
    [ZO_CMN, ZO_DISABLE, ZO_PPS, ZO_DISABLE_PPS];
end;
//..............................................................................
class function Appx1Writer.ZoIsActive(Rec: TDataSet): boolean;
begin
  Result := not ZoIsStatic(Rec);
end;
{
//..............................................................................
class function Appx1Writer.GetAppx1Keys: ShortString;
begin
  Result := 'NUMIDENT;PAY_MNTH;PAY_YEAR;ZO;PAY_TP;OTK;EXP';
end;
//..............................................................................
class function Appx1Writer.GetAppx1KeyValues(Appx1Rec: TDataSet): TVariantArray;
begin
  with Appx1Rec do
    Result := VarArrayOf([CurEmplSsn,
      FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger,
      FieldByName('ZO').AsInteger, FieldByName('PAY_TP').AsInteger,
      FieldByName('OTK').AsInteger, FieldByName('EXP').AsInteger]);
end;
}
(*
//..............................................................................
// По NUMIDENT не сравниваем: его нет в Appx1Rec в точке вызова.
// По нему делаем только Locate.
//..............................................................................
class function Appx1Writer.KeyCompareFldFilter(FldName: ShortString): boolean;
begin
  Result := {(FldName = 'NUMIDENT') or} {(FldName = 'ZO') or}
   (FldName = 'PAY_MNTH') or (FldName = 'PAY_YEAR')
    or (FldName = 'OTK') or (FldName = 'EXP');
end;
*)
//------------------------------------------------------------------------------
// DataSet - набор данных, в котором считаем дни.
// BegFldName, EndFldName - названия полей начала и конца периода.
// Mnth, Year - поскольку в наборе данных находятся данные для разных периодов,
// указывают - записи за какой период нужно обрабатывать.
// Исходим из того, что записи упорядочены по началу периода.
//------------------------------------------------------------------------------
class function Appx1Writer.CountDaysTotalAndDelete(
  DataSet: TDataSet;
  BegFldName, EndFldName: ShortString;
  PayMnth, PayYear: Word;
  FilterFunc: TDoubleSetFunc): Integer;
var
  SumPeriod, RecPeriod, JoinPeriod: TPeriod;
  RecPeriodBeg: TDate;
begin
  Result := 0;

  with DataSet, DateUtils do begin
    SumPeriod := CreateEmptyPeriod;

    First;

    while not Eof do begin
      RecPeriodBeg := Decode(FieldByName(BegFldName).AsDateTime);

      // DmSpov.TblAppx1 - запись финальной таблицы, для которой считаем дни.
      // Из неё функция фильтрации берёт нужные параметры.
      if (not Assigned(FilterFunc) or FilterFunc(Report.TblAppx1, DataSet))
          and (RecPeriodBeg.Mnth = PayMnth)
          and (RecPeriodBeg.Year = PayYear) then begin

        RecPeriod := InitPeriod(FieldByName(BegFldName).AsDateTime,
          FieldByName(EndFldName).AsDateTime);

        JoinPeriod := JoinPeriods(SumPeriod, RecPeriod);

        if PeriodIsEmpty(JoinPeriod) then begin
          Result := Result + DateUtils.DaysCount(SumPeriod);
          SumPeriod := RecPeriod;
        end else
          SumPeriod := JoinPeriod;

        // Обработанные записи удаляем.
        // Получить количество дней по периоду можно лишь единожды.
        Delete;
      end else
        Next;
    end;

    Result := Result + DateUtils.DaysCount(SumPeriod);
  end;
end;

//------------------------------------------------------------------------------
class function Appx1Writer.NonPayDaysFilter(
  Appx1Rec, NonPayRec: TDataSet): boolean;
begin
  with NonPayRec do
  Result :=
    (FieldByName('OTK').AsInteger = Appx1Rec.FieldByName('OTK').AsInteger)
    and (FieldByName('Weight').AsInteger > 0);
end;

//------------------------------------------------------------------------------
class function Appx1Writer.MoveFldFilter(FldName: ShortString): boolean;
begin
  Result := not ({(FldName = 'KD_PTV') or}
    (FldName = 'SUM_TOTAL') or  (FldName = 'SUM_MAX')
    or (FldName = 'SUM_DIFF') or (FldName = 'SUM_INS')
    or (FldName = 'SUM_NARAH') or (FldName = 'NRC'));
end;

//------------------------------------------------------------------------------
// Пол ZP в пол SPOV.
//------------------------------------------------------------------------------
class function Appx1Writer.GenderToSt(Gender: string): integer;
begin
  Result := 0;
  Gender := AnsiUpperCase(Gender);

  if (Gender = 'М') or (Gender = 'Ч') then
    Result := 1;
end;

//------------------------------------------------------------------------------
class function Appx1Writer.SumsAreZero(Appx1Rec: TAppx1Rec): boolean;
begin
  with Appx1Rec do
    Result := (SUM_TOTAL = 0)
      and (SUM_MAX = 0) and (SUM_DIFF = 0)
      and (SUM_INS = 0) and (SUM_NARAH = 0);
end;

//------------------------------------------------------------------------------
class function Appx1Writer.SumsAreZero(Appx1Rec: TDataSet): boolean;
begin
  with Appx1Rec do
    Result := (MathUtils.Round(FieldByName('SUM_TOTAL').AsFloat, 2) = 0)
      and (MathUtils.Round(FieldByName('SUM_MAX').AsFloat, 2) = 0)
      and (MathUtils.Round(FieldByName('SUM_DIFF').AsFloat, 2) = 0)
      and (MathUtils.Round(FieldByName('SUM_INS').AsFloat, 2) = 0)
      and (MathUtils.Round(FieldByName('SUM_NARAH').AsFloat, 2) = 0);
end;

end.
