unit CalcComp2023;

interface

uses
  DateLib;

const
  Jan1St2023 = 44927; // 1 янв.2023
  Sep12Th2023 = 45181; // 12 сен.2023
  Dec31St2023 = 45291; // 31 дек.2023

  Comp2023LogName = 'Compens2023.log';

type

  TAvrg2023 = record
    SumTotal: Double;
    DaysTotal: Integer;
  end;

  Compens2023 = class
  private
    class procedure LoadAssigns(EmplId: Integer; Period: TPeriod);
//    class procedure ProcessAssignmnt(CalcPeriod: TPeriod);
    class procedure ProcessPeriod(EndDate: TDateTime);
    class procedure ProcessMonth(BegDate, EndDate: TDateTime);
    class procedure ProcessSalary(
      BegDate, EndDate: TDateTime; MinSal: Double);
    class procedure StartLog;
    class procedure WriteLog(BegDate, EndDate,
      MnthDays, SalDays, Paymnts, AssSal, MinSal, PartSal: ShortString);
    class procedure EndLog;
  public
    class function CalcDayAvrgMinZp(
      EmplId: Integer; VacatBegDate: TDateTime): TAvrg2023;
    class function CalcDayAvrgLastSal(
      EmplId: Integer; VacatBegDate: TDateTime): TAvrg2023;
  end;

implementation

uses
  DbTables, LogLib, Math, MathLib, QryLib, SalaryLib, SysUtils, TextLib;

var
  QryAssigns, QryMinSals: TQuery;
  CurAssDate: TDateTime;
  CurSalary: Double;
  CurWorkTimePerc: Integer;
  Average: TAvrg2023;

//------------------------------------------------------------------------------
// С 12.09.23 начало действовать постановление о расчёте предшествующих месяцев
// по доходам 23-го года. Если доходов в 23-м не было, компенсации считаются
// по МинЗП. С 01.01.24 расчёт возвращается К предыдущим 12 месяцам.
//------------------------------------------------------------------------------
class function Compens2023.CalcDayAvrgMinZp(
  EmplId: Integer;
  VacatBegDate: TDateTime): TAvrg2023;
var
  EmplPeriod, CalcPeriod, AssgnPeriod,
  Period: TPeriod;
  QryEmplmnt: TQuery;
begin
  // Открываем протокол расчёта
  StartLog;

  // Выбираем последнее перемещение на дату расчёта компенсации.
  Period := DateUtils.InitPeriod(VacatBegDate, VacatBegDate);
  QryEmplmnt := TQuery.Create(nil);
  QryUtils.InitQuery(QryEmplmnt);
  SalaryUtils.SelectAssigns(QryEmplmnt, EmplId, Period, true, false);

  with DateUtils do begin
    // Получаем отрезок соответствующего приёма/увольнения в 2023-м году
    with QryEmplmnt do begin
      if RecordCount > 0 then
        EmplPeriod := InitPeriod(FieldByName('Dt_Priem').AsDateTime,
          FieldByName('Dt_Uvoln').AsDateTime)
      else
        EmplPeriod := CreateEmptyPeriod;

      Free;
    end;

    CalcPeriod :=
      IntersectPeriods(EmplPeriod, InitPeriod(Jan1St2023, Dec31St2023));

    if not PeriodIsEmpty(CalcPeriod) then begin
      LoadAssigns(EmplId, CalcPeriod);

      CurAssDate := CalcPeriod.Start;
      CurSalary := 0;
      CurWorkTimePerc := 100;

      with QryAssigns do
      while not Eof do begin
        AssgnPeriod.Start := CurAssDate;
        AssgnPeriod.Finish := FieldByName('Dt_Beg').AsDateTime - 1;

        if not PeriodIsEmpty(AssgnPeriod) then begin
          ProcessPeriod(AssgnPeriod.Finish);
          CurAssDate := FieldByName('Dt_Beg').AsDateTime;
        end;

        CurSalary := FieldByName('OklTrf').AsFloat;

        CurWorkTimePerc := FieldByName('PrcWrkTime').AsInteger;
        if CurWorkTimePerc = 0 then
          CurWorkTimePerc := 100;

        Next;
      end;

      // Обработка конца последнего приёма/увольнения
      ProcessPeriod(CalcPeriod.Finish);

      QryAssigns.Free;
      QryMinSals.Free;
    end;
  end;

  // Закрываем протокол расчёта
  EndLog;

  Result := Average;
end;

//------------------------------------------------------------------------------
// Расчёт по последнему окладу
//------------------------------------------------------------------------------
class function Compens2023.CalcDayAvrgLastSal(
  EmplId: Integer; VacatBegDate: TDateTime): TAvrg2023;
begin
  // Протокол расчёта
  StartLog;

  LoadAssigns(EmplId, DateUtils.InitPeriod(VacatBegDate, VacatBegDate));

  with QryAssigns, DateUtils do begin
    CurAssDate := Max(Jan1St2023,
      BeginOfMonth(FieldByName('Dt_Priem').AsDateTime));
    CurSalary := FieldByName('OklTrf').AsFloat;

    ProcessPeriod(EndOfMonth(PrevMonth(VacatBegDate)));
  end;

  QryAssigns.Free;

  // Протокол расчёта
  EndLog;

  Result := Average;
end;

//------------------------------------------------------------------------------
// Если будет указан однодневный период, QryAssigns выберет только актуальное
// перемещение. Если период, то все перемещения за период
//------------------------------------------------------------------------------
class procedure Compens2023.LoadAssigns(
  EmplId: Integer;
  Period: TPeriod);
begin
  with Average do begin
    SumTotal := 0;
    DaysTotal := 0;
  end;

  QryAssigns := TQuery.Create(nil);
  QryUtils.InitQuery(QryAssigns);
  SalaryUtils.SelectAssigns(QryAssigns, EmplId, Period);

  // Готовим запрос для выборки минимальных зарплат
  QryMinSals := TQuery.Create(nil);
  QryUtils.InitQuery(QryMinSals);
  SalaryUtils.PrepareSelMinSals(QryMinSals);
end;

//------------------------------------------------------------------------------
// Обработка перемещения.
//------------------------------------------------------------------------------
(*
class procedure Compens2023.ProcessAssignmnt(CalcPeriod: TPeriod);
var
  EmplPeriod: TPeriod;
  AssDate: TDateTime;
  Salary: Double;
begin
  with QryAssigns, DateUtils do begin
    EmplPeriod := IntersectPeriods(
      InitPeriod(
        FieldByName('Dt_Priem').AsDateTime,
        FieldByName('Dt_Uvoln').AsDateTime),
      CalcPeriod);

    AssDate := Max(Jan1St2023, FieldByName('Dt_Beg').AsDateTime);

    {
    // Преобразование ниже переносит перемещения, сделанные не 1-го числа
    // на 1-е число следующего месяца. Т.е., если оклад поменяется в середине
    // месяца, в расчёт он берётся начиная со следующего
    Date := Decode(AssDate);
    with Date do
    if Day > 1 then
      AssDate := NextMonth(AssDate);
    }

    Salary := FieldByName('OklTrf').AsFloat;

    if PeriodsAreEqual(EmplPeriod, CurEmplPeriod) then begin
      // Перемещение относится к текущему приёму/увольнению.
      if Salary <> CurSalary then
        // Поменялся оклад. Рассчитываем с текущими значениями
        ProcessPeriod(AssDate - 1);
    end else
      // Перемещение либо совсем первое ...
      if not PeriodIsEmpty(CurEmplPeriod) then
        // ... либо относится к следующему приёму/увольнению.
        // Обрабатываем конец текущего приёма/увольнения
        ProcessPeriod(CurEmplPeriod.Finish);

    // Устанавливаем значения для следующей итерации
    CurEmplPeriod := EmplPeriod;
    CurAssDate := AssDate;
    CurSalary := Salary;
    CurWorkTimePerc := FieldByName('PrcWrkTime').AsInteger;
    if CurWorkTimePerc = 0 then
      CurWorkTimePerc := 100;
  end;
end;
*)
//------------------------------------------------------------------------------
// Период действия перемещения может охватывать несколько месяцев.
// Обрабатываем каждый отдельно. Началом периода всегда является дата
// текущего перемещения CurAssDate.
//------------------------------------------------------------------------------
class procedure Compens2023.ProcessPeriod(EndDate: TDateTime);
var
  Date, MnthBeg, MnthEnd: TDateTime;
begin
  // CurAssDate может оказаться большим EndDate из-за переноса эффективной даты
  // с не 1-го числа месяца перемещения на 1-е число следующего месяца
  if CurAssDate > EndDate then
    exit;

  Date := CurAssDate;

  with DateUtils do
  repeat
    if Date = CurAssDate then
      // Первый месяц периода. Берём дату начала периода
      MnthBeg := CurAssDate
    else
      // Следующий месяц. Берём дату начала месяца
      MnthBeg := BeginOfMonth(Date);

    if EndOfMonth(Date) = EndOfMonth(EndDate) then
      // Последний месяц периода. Берём дату окончания периода
      MnthEnd := EndDate
    else
      // Следующий месяц. Берём дату окончания месяца
      MnthEnd := EndOfMonth(Date);

    ProcessMonth(MnthBeg, MnthEnd);
    Date := NextMonth(Date);
  until Date > BeginOfMonth(EndDate);
end;

//------------------------------------------------------------------------------
// Решаем какую из зарплат использовать: установленную или минимальную.
// Размер минимальной зарплаты устанавливается только раз в месяц и действует
// на протяжениии всего месяца. Поэтому размер выборки - максимум одна запись
//------------------------------------------------------------------------------
class procedure Compens2023.ProcessMonth(BegDate, EndDate: TDateTime);
var
  MinSal: Double;
begin
  // Выбираем минимальную зарплату заданного месяца
  SalaryUtils.SelectMinSals(
    QryMinSals, DateUtils.InitPeriod(BegDate, EndDate));

  with QryMinSals do
  MinSal := RoundTo(FieldByName('MinZp2').AsFloat * CurWorkTimePerc / 100, -2);

  ProcessSalary(BegDate, EndDate, MinSal);
end;

//------------------------------------------------------------------------------
// Определяем долю зарплаты в месяце для заданного периода и накапливаем
// результат
//------------------------------------------------------------------------------
class procedure Compens2023.ProcessSalary(
  BegDate, EndDate: TDateTime;
  MinSal: Double);
var
  FullDays, SalDays: Integer;
  ActualSal, PartSal: Double;
begin
  with DateUtils do begin
    FullDays := DaysCount(BeginOfMonth(BegDate), EndOfMonth(EndDate));
    SalDays := DaysCount(BegDate, EndDate);
  end;

  ActualSal := Max(CurSalary, MinSal);

  with Average do begin
    PartSal := MathUtils.Round(ActualSal * SalDays / FullDays, 2);
    SumTotal := SumTotal + PartSal;
    DaysTotal := DaysTotal + SalDays;
  end;

  WriteLog(DateToStr(BegDate), DateToStr(EndDate),
    IntToStr(FullDays), IntToStr(SalDays),
    FloatToStrF(0, ffNumber, 3, 2),
    FloatToStrF(CurSalary, ffNumber, 10, 2),
    FloatToStrF(MinSal, ffNumber, 10, 2),
    FloatToStrF(PartSal, ffNumber, 10, 2));
end;

//------------------------------------------------------------------------------
class procedure Compens2023.StartLog;
begin
  with LogUtils, TextUtils do begin
    StartLogging(Comp2023LogName);
    WriteLog(
      'Дт.Нач', 'Дт.Оконч', 'Мес', 'Дн', 'Факт', 'Окл', 'Мин ЗП', 'В расч');
    WriteLog(
      PadRight('', '-', 10), PadRight('', '-', 10),
      PadRight('', '-', 3), PadRight('', '-', 3), PadRight('', '-', 4),
      PadRight('', '-', 9), PadRight('', '-', 9), PadRight('', '-', 9));
  end;
end;

//------------------------------------------------------------------------------
class procedure Compens2023.EndLog;
begin
  with Average, LogUtils, TextUtils do begin
    WriteLog(PadRight('', '-', 10), PadRight('', '-', 10),
      PadRight('', '-', 3), PadRight('', '-', 3), PadRight('', '-', 4),
      PadRight('', '-', 9), PadRight('', '-', 9), PadRight('', '-', 9));
    WriteLog('', '', '', IntToStr(DaysTotal),
      '', '', '', FloatToStrF(SumTotal, ffNumber, 10, 2));
    EndLogging;
  end;
end;

//------------------------------------------------------------------------------
class procedure Compens2023.WriteLog(
  BegDate, EndDate, MnthDays, SalDays,
  Paymnts, AssSal, MinSal, PartSal: ShortString);
begin
  with TextUtils do
  LogUtils.Log(
    PadRight(BegDate, ' ', 10) + '  ' + PadRight(EndDate, ' ', 10) +
    '  ' + PadLeft(MnthDays, ' ', 3) + ' ' + PadLeft(SalDays, ' ', 3) +
    '  ' + PadLeft(Paymnts, ' ', 4) +
    ' ' + PadLeft(AssSal, ' ', 10) +
    ' ' + PadLeft(MinSal, ' ', 10) +
    ' ' + PadLeft(PartSal, ' ', 10));
end;

end.
