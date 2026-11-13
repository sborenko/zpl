unit DateLib;

interface

uses
  DB, DBClient;

type
  TPeriod = record
    Start,
    Finish: TDateTime;
  end;

  TPeriods = array of TPeriod;

  TDay = (Sunday = 1, Monday, Tuesday, Wendesday, Thirthday, Friday, Saturday);

  TDate = record
    Year, Mnth, Day: word
  end;

  TCompareResult = (FirstIsSmaller, BothAreEqual, FirstIsLarger);

  DateUtils = class
    public
      class function Today: TDateTime;
      class function ThisMonth: TDateTime;

      class function DateYear(date: TDateTime): integer;
      class function DateMonth(date: TDateTime): integer;
      class function DateDay(date: TDateTime): integer;

      class function CreateEmptyPeriod(Value: TDateTime = 0): TPeriod;
      class function InitPeriod(Start, Finish: TDateTime): TPeriod; overload;
      class function InitPeriod(Start, Finish: TDate): TPeriod; overload;
      class function PeriodIsEmpty(period: TPeriod): boolean;
      class function MonthOfQuarter(month: integer): integer; overload;
      class function MonthOfQuarter(date: TDateTime): integer; overload;
      class function Quarter(month: integer): integer; overload;
      class function Quarter(date: TDateTime): integer; overload;
      class function FirstMnthOfQuart(Quart: integer): integer;
      class function BeginOfMonth(date: TDateTime): TDateTime;
      class function BeginOfQuarter(day: TDateTime): TDateTime;
      class function BeginOfYear(date: TDateTime): TDateTime;
      class function EndOfMonth(date: TDateTime): TDateTime;
      class function PeriodStartIsOpen(period: TPeriod): boolean;
      class function PeriodIsFinished(period: TPeriod): boolean;
      class function PeriodIsBothOpen(period: TPeriod): boolean;
      class function PeriodsAreEqual(Period1, Period2: TPeriod): boolean;
      class function PeriodsAreIntersected(period1, period2: TPeriod): boolean;
      class function PeriodsAreAdjucent(period1, period2: TPeriod): boolean;
      class function EventIsBeforePeriod(event: TDateTime; period: TPeriod): boolean;
      class function EventIsInPeriod(event: TDateTime; period: TPeriod): boolean;
      class function EventIsAfterPeriod(event: TDateTime; period: TPeriod): boolean;
      class function EventIsAdjucentToFinish(Event: TDateTime; Period: TPeriod): boolean;
      class function IntersectPeriods(Period1, Period2: TPeriod): TPeriod;
      class function JoinPeriods(period1, period2: TPeriod;
        JoinAdjucent: boolean = true): TPeriod; overload;

      class function SubtractPeriods(
        Minuend, Subtrahend: TPeriod): TPeriods; overload;
      class procedure SubtractPeriods(
        Minuend, Subtrahend: TPeriod; var Result: TPeriods); overload;

      class function DaysCount(Period: TPeriod): integer; overload;
      class function DaysCount(Start, Finish: TDateTime): integer; overload;

      class function WeekDay(Date: TDateTime): TDay;

      class function InitDate(Year, Mnth: word; Day: word = 1): TDate;
      class function Encode(Date: TDate): TDateTime;
      class function Decode(Date: TDateTime): TDate;

      class procedure CreatePeriodsCDS(CDS: TClientDataSet;
        StartFieldName: string; FinishFieldName: string);

      class procedure IntersectDataSet(DataSet: TDataSet;
        BegFldName, EndFldName: string; Period: TPeriod;
        DeleteNonIntersect: boolean = false);

      class function DaysCount(DataSet: TDataSet;
        BegFldName,EndFldName: string): integer; overload;

      class function SplitToSpans(Period: TPeriod; dsDivider: TDataSet;
        StartFieldName, FinishFieldName: string): TClientDataSet;

      class function PrevMonth(Date: TDateTime; MnthCount: word = 1): TDateTime;
      class function NextMonth(Date: TDateTime; MnthCount: word = 1): TDateTime;

      class function CompareDates(Year1, Year2, Month1, Month2: Word;
        Day1: Word = 1; Day2: Word = 1): TCompareResult;

      class function GetPeriodBetween(DtBeg, DtEnd: TDateTime): TPeriod;
      class function GetPeriod(DtBeg, DtEnd: TDateTime): TPeriod;

      class function RusMnth(Mnth: Word): ShortString;
  end;

implementation

uses
  SysUtils, Math, DebugLib;

//------------------------------------------------------------------------------
// Создать пустой (невалидный) интервал
// Нужен, например, чтобы вернуть результат пересечения или объединения
// непересекающихся интервалов
//------------------------------------------------------------------------------
class function DateUtils.CreateEmptyPeriod(Value: TDateTime = 0): TPeriod;
begin
  with Result do begin
    if Value = 0 then
      Start := Now
    else
      Start := Value;
      
    Finish := Start - 1;
  end;
end;

//------------------------------------------------------------------------------
// *** Создать интервал
//------------------------------------------------------------------------------
class function DateUtils.InitPeriod(start, finish: TDateTime): TPeriod;
begin
  Result.start := start;
  Result.finish := finish;
end;

// ***
class function DateUtils.InitPeriod(Start, Finish: TDate): TPeriod;
begin
  Result := InitPeriod(Encode(Start), Encode(Finish));
end;

// *** Период пуст
class function DateUtils.PeriodIsEmpty(Period: TPeriod): boolean;
begin
  Result := PeriodIsFinished(Period) and (Period.Finish < Period.Start);
end;

// *** Получить год даты
class function DateUtils.DateYear(date: TDateTime): integer;
var
  year, dummyWord: word;
begin
  DecodeDate(date, year, dummyWord, dummyWord);
  Result := year;
end;

// *** Получить месяц года
class function DateUtils.DateMonth(date: TDateTime): integer;
var
  month, dummyWord: word;
begin
  DecodeDate(date, dummyWord, month, dummyWord);
  Result := month;
end;

// *** Получить день месяца
class function DateUtils.DateDay(date: TDateTime): integer;
var
  day, dummyWord: word;
begin
  DecodeDate(date, dummyWord, dummyWord, day);
  Result := day;
end;

// *** Получить месяц квартала
class function DateUtils.MonthOfQuarter(month: integer): integer;
begin
  Result := (month - 1) mod 3 + 1;
end;

// *** Получить месяц квартала
class function DateUtils.MonthOfQuarter(date: TDateTime): integer;
begin
  Result := MonthOfQuarter(DateMonth(date));
end;

// *** Получить квартал месяца
class function DateUtils.Quarter(month: integer): integer;
begin
  Result := (month - 1) div 3 + 1;
end;

// *** Первый месяц квартала
class function DateUtils.FirstMnthOfQuart(Quart: integer): integer;
begin
  Result := (Quart - 1) * 3 + 1;
end;

// *** Получить квартал даты
class function DateUtils.Quarter(date: TDateTime): integer;
begin
  Result := Quarter(DateMonth(date));
end;

// *** Получить начало месяца
class function DateUtils.BeginOfMonth(date: TDateTime): TDateTime;
var
  year, month, dummyWord: word;
begin
  DecodeDate(date, year, month, dummyWord);
  Result := EncodeDate(year, month, 1);
end;

// *** Получить начало квартала
class function DateUtils.BeginOfQuarter(day: TDateTime): TDateTime;
var
  year, month, dummyWord: word;
begin
  DecodeDate(Now, year, month, dummyWord);
  Result := EncodeDate(year, (Quarter(month) - 1) * 3 + 1, 1);
end;

// *** Получить начало года
class function DateUtils.BeginOfYear(date: TDateTime): TDateTime;
begin
  Result := EncodeDate(DateYear(date), 12, 1);
end;

// *** Получить конец месяца
class function DateUtils.EndOfMonth(date: TDateTime): TDateTime;
begin
  Result := NextMonth(date, 1) - 1;
end;

// *** Диапазон открыт с начала
class function DateUtils.PeriodStartIsOpen(period: TPeriod): boolean;
begin
  Result := Period.Start = 0;
end;

// *** Диапазон открыт с конца
class function DateUtils.PeriodIsFinished(period: TPeriod): boolean;
begin
  Result := period.finish <> 0;
end;

// *** Диапазон открыт с обеих сторон
class function DateUtils.PeriodIsBothOpen(period: TPeriod): boolean;
begin
  Result := DateUtils.PeriodStartIsOpen(period) and not PeriodIsFinished(period);
end;

// *** Периоды равны
class function DateUtils.PeriodsAreEqual(Period1, Period2: TPeriod): boolean;
begin
  Result := (Period1.Start = Period2.Start) and (Period1.Finish = Period2.Finish);
end;

// *** Событие произошло до начала периода
class function DateUtils.EventIsBeforePeriod(event: TDateTime; period: TPeriod): boolean;
begin
  Result := (event <> 0) and (event < period.start);
end;

// *** Событие находится внутри диапазона
class function DateUtils.EventIsInPeriod(event: TDateTime; period: TPeriod): boolean;
begin
  Result := (event >= period.start) and
    ((event <= period.finish) or not PeriodIsFinished(period));
end;

// *** Событие произошло после завершения периода
class function DateUtils.EventIsAfterPeriod(event: TDateTime; period: TPeriod): boolean;
begin
  Result := event > period.finish;;
end;

// *** Событие смежно с концом периода периода
class function DateUtils.EventIsAdjucentToFinish(Event: TDateTime; Period: TPeriod): boolean;
begin
  Result := PeriodIsFinished(Period) and (Event = Period.Finish + 1);
end;

// *** Диапазоны пересекаются
class function DateUtils.PeriodsAreIntersected(Period1, Period2: TPeriod): boolean;
begin
  Result := not PeriodIsEmpty(Period1) and not PeriodIsEmpty(Period2)
    and (EventIsInPeriod(Period1.Start, Period2)
      or EventIsInPeriod(Period2.Start, Period1));
end;

//------------------------------------------------------------------------------
// Определить смежность периодов.
//------------------------------------------------------------------------------
class function DateUtils.PeriodsAreAdjucent(Period1, Period2: TPeriod): boolean;
begin
  DebugUtils.Check(
    PeriodIsEmpty(Period1) and not PeriodIsEmpty(Period2)
    or not PeriodIsEmpty(Period1) and not PeriodIsEmpty(Period2) and (Period1.Start < Period2.Start),
    'Первый период может быть пустым. Тогда второй - Если оба - непустые, ' +
    'предполагается хронологическая последовательность начал периодов.'
    );

  Result :=  not PeriodIsEmpty(Period1) and not PeriodIsEmpty(Period2)
    and (PeriodIsFinished(Period1) and (Period1.Finish + 1 = Period2.Start)
      or not PeriodStartIsOpen(Period1) and (Period1.Start - 1 = Period2.Finish));
end;

//------------------------------------------------------------------------------
// Получить пересечение диапазонов
//------------------------------------------------------------------------------
class function DateUtils.IntersectPeriods(period1, period2: TPeriod): TPeriod;
begin
  if PeriodsAreIntersected(period1, period2) then begin
    Result.start := Max(period1.start, period2.start);

    if not PeriodIsFinished(period1) then
      Result.finish := period2.finish
    else if not PeriodIsFinished(period2) then
      Result.finish := period1.finish
    else
      Result.finish := Min(period1.finish, period2.finish);
  end else
    Result := CreateEmptyPeriod;
end;

//------------------------------------------------------------------------------
// Получить объединение периодов.
// Если один из периодов - пустой, результатом объединения становится другой.
// Если периоды пересекаются или являются смежными, обрабатываем начала и концы.
// Иначе - пусто.
//------------------------------------------------------------------------------
class function DateUtils.JoinPeriods(
  Period1, Period2: TPeriod;
  JoinAdjucent: boolean = true): TPeriod;
begin
  if PeriodIsEmpty(Period1) then
    Result := Period2
  else if PeriodIsEmpty(Period2) then
    Result := Period1
  else if PeriodsAreIntersected(Period1, Period2) or
      JoinAdjucent and PeriodsAreAdjucent(Period1, Period2) then begin
    Result.Start := Min(Period1.Start, Period2.Start);

    if not PeriodIsFinished(Period1) then
      Result.Finish := Period1.Finish
    else if not PeriodIsFinished(Period2) then
      Result.Finish := Period2.Finish
    else
      Result.Finish := Max(Period1.Finish, Period2.Finish);
  end else
    Result := CreateEmptyPeriod;
end;

//------------------------------------------------------------------------------
// Вычесть периоды
//------------------------------------------------------------------------------
class function DateUtils.SubtractPeriods(
  Minuend, Subtrahend: TPeriod): TPeriods;
begin
  SetLength(Result, 0);
  SubtractPeriods(Minuend, Subtrahend, Result);
end;

//------------------------------------------------------------------------------
class procedure DateUtils.SubtractPeriods(
  Minuend, Subtrahend: TPeriod;
  var Result: TPeriods);
var
  Period: TPeriod;
begin
  SetLength(Result, 0);

  if not PeriodsAreIntersected(Minuend, Subtrahend) then begin
    // Не пересекаются: уменьшаемое остаётся нетронутым.
    SetLength(Result, 1);
    Result[0] := Minuend;
  end else begin
    if EventIsInPeriod(Subtrahend.Start, Minuend) then begin
      // Начало вычитаемого лежит в уменьшаемом.
      Period.Start := Minuend.Start;
      Period.Finish := Subtrahend.Start - 1;

      if not PeriodIsEmpty(Period) then begin
        // Если начала не совпадают, добавляем период.
        SetLength(Result, 1);
        Result[0] := Period;
      end
    end;

    if DateUtils.EventIsInPeriod(Subtrahend.Finish, Minuend) then begin
      // Конец вычитаемого лежит в уменьшаемом.
      Period.Start := Subtrahend.Finish + 1;
      Period.Finish := Minuend.Finish;

      if not PeriodIsEmpty(Period) then begin
        // Если концыы не совпадают, добавляем период.
        SetLength(Result, Length(Result) + 1);
        Result[Length(Result) - 1] := Period;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
// *** Получить количество дней в периоде
//------------------------------------------------------------------------------
class function DateUtils.DaysCount(Period: TPeriod): integer;
begin
  if PeriodStartIsOpen(Period) or not PeriodIsFinished(Period) then
    Result := MaxInt
  else
    Result := Max(0, DaysCount(Period.Start, Period.Finish));
end;

//------------------------------------------------------------------------------
class function DateUtils.DaysCount(Start, Finish: TDateTime): integer;
begin
  Result := Trunc(Finish - Start) + 1;
end;

//------------------------------------------------------------------------------
class function DateUtils.WeekDay(Date: TDateTime): TDay;
begin
  Result := TDay(DayOfWeek(Date));
end;

//------------------------------------------------------------------------------
// *** Создать CDS для накопления периодов
//------------------------------------------------------------------------------
class procedure DateUtils.CreatePeriodsCDS(
  CDS: TClientDataSet;
  StartFieldName, FinishFieldName: string);
var
  IndexDef: TIndexDef;
begin
  with CDS do begin
    if Active then
      Close;

    with FieldDefs do begin
      if IndexOf(StartFieldName) = -1 then
        FieldDefs.Add(StartFieldName, ftDateTime);

      if IndexOf(FinishFieldName) = -1 then
        FieldDefs.Add(FinishFieldName, ftDateTime);
    end;

    CreateDataSet;

    IndexDefs.Clear;
    IndexDef := IndexDefs.AddIndexDef;
    IndexDef.Name := 'OnStartFinish';
    IndexDef.Fields := StartFieldName + ';' + FinishFieldName;
    IndexName := 'OnStartFinish';

    Open;
  end;
end; {CreatePeriodsCDS}

//------------------------------------------------------------------------------
// Разбивает период, заданный параметрами dPeriodBeg, dPeriodEnd на отрезки
// отрезками набора dsDivider.
// Результирующий TClientDataSet будет содержать отрезки, дополняющие dsDivider до полного
// периода dPeriodBeg - dPeriodEnd.
//------------------------------------------------------------------------------
class function DateUtils.SplitToSpans(Period: TPeriod; dsDivider: TDataSet;
  StartFieldName, FinishFieldName: string): TClientDataSet;
begin
  Result := TClientDataSet.Create(nil);
  dsDivider.First;

  // Пропускаем отрезки предшествующие периоду
  while not dsDivider.Eof do
    if dsDivider.FieldByName(FinishFieldName).AsDateTime <= Period.Start then
      dsDivider.Next
    else
      break;

  while not dsDivider.Eof do begin
    // Заканчиваем, если отрезок dsDivider'а вышел за пределы периода
    if dsDivider.FieldByName(StartFieldName).AsDateTime >= Period.Finish then
      break;

    if dsDivider.FieldByName(StartFieldName).AsDateTime > Period.Start then begin
      // Добавляем отрезок в результат
      Result.Insert;
      Result.FieldByName('Begin').AsDateTime := Period.Start;
      Result.FieldByName('End').AsDateTime := dsDivider.FieldByName(StartFieldName).AsDateTime;

      // Обновляем начало периода
      Period.Start := dsDivider.FieldByName(FinishFieldName).AsDateTime;
      dsDivider.Next;
    end;
  end;

  if Period.Start < Period.Finish then begin
    Result.Insert;
    Result.FieldByName('Begin').AsDateTime := Period.Start;
    Result.FieldByName('End').AsDateTime := Period.Finish;
  end;
end;

//------------------------------------------------------------------------------
class procedure DateUtils.IntersectDataSet(
  DataSet: TDataSet;
  BegFldName, EndFldName: string;
  Period: TPeriod;
  DeleteNonIntersect: boolean = false);
var
  BegField, EndField: TField;
  RecPeriod: TPeriod;
  IntersectIsEmpty: boolean;
begin
  with DataSet do begin
    First;

    while not Eof do begin
      BegField := FieldByName(BegFldName);
      EndField := FieldByName(EndFldName);

      RecPeriod := IntersectPeriods(
        InitPeriod(BegField.AsDateTime, EndField.AsDateTime), Period);

      IntersectIsEmpty := PeriodIsEmpty(RecPeriod);

      if not IntersectIsEmpty then begin
        Edit;
        BegField.AsDateTime := RecPeriod.Start;
        EndField.AsDateTime := RecPeriod.Finish;
        Post;
      end;

      if IntersectIsEmpty and DeleteNonIntersect then
        Delete
      else
        Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
class function DateUtils.DaysCount(
  DataSet: TDataSet;
  BegFldName, EndFldName: string): integer;
begin
  Result := 0;

  with DataSet do begin
    First;

    while not Eof do begin
      Result := Result + DaysCount(
        FieldByName(BegFldName).AsDateTime, FieldByName(EndFldName).AsDateTime);
        
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
class function DateUtils.PrevMonth(Date: TDateTime; MnthCount: word): TDateTime;
var
  Mnth, Year, DummyWord, I: word;
begin
  DecodeDate(Date, Year, Mnth, DummyWord);

  for I := 1 to MnthCount do
    if Mnth = 1 then begin
      Mnth := 12;
      Dec(Year);
    end else
      Dec(Mnth);

  Result := EncodeDate(Year, Mnth, 1);
end;

//------------------------------------------------------------------------------
class function DateUtils.NextMonth(Date: TDateTime; MnthCount: word): TDateTime;
var
  Mnth, Year, DummyWord, I: word;
begin
  DecodeDate(Date, Year, Mnth, DummyWord);

  for I := 1 to MnthCount do
    if Mnth = 12 then begin
      Mnth := 1;
      Inc(Year);
    end else
      Inc(Mnth);

  Result := EncodeDate(Year, Mnth, 1);
end;

// ***
// ***
class function DateUtils.Today: TDateTime;
begin
  Result := Date;
end;

// ***
// ***
class function DateUtils.ThisMonth: TDateTime;
begin
  Result := BeginOfMonth(Today)
end;

//------------------------------------------------------------------------------
class function DateUtils.CompareDates(Year1, Year2, Month1, Month2: Word;
  Day1: Word = 1; Day2: Word = 1): TCompareResult;
begin
  if (Year1 < Year2) or ((Year1 = Year2)
      and ((Month1 < Month2) or (Month1 = Month2) and (Day1 < Day2))) then
    Result := FirstIsSmaller
  else if (Year1 = Year2) and (Month1 = Month2) and (Day1 = Day2) then
    Result := BothAreEqual
  else
    Result := FirstIsLarger;
end;

//------------------------------------------------------------------------------
class function DateUtils.InitDate(Year, Mnth: word; Day: word = 1): TDate;
begin
  Result.Year := Year;
  Result.Mnth := Mnth;
  Result.Day := Day;
end;

//------------------------------------------------------------------------------
// Преобразовывает структуру TDate в TDateTime
//------------------------------------------------------------------------------
class function DateUtils.Encode(Date: TDate): TDateTime;
begin
  Result := EncodeDate(Date.Year, Date.Mnth, Date.Day);
end;

//------------------------------------------------------------------------------
// Преобразовывает TDateTime в структуру TDate
//------------------------------------------------------------------------------
class function DateUtils.Decode(Date: TDateTime): TDate;
begin
  DecodeDate(Date, Result.Year, Result.Mnth, Result.Day);
end;

//------------------------------------------------------------------------------
// Для одной и той-же даты даст пустой период.
// Фактически - не включает конец периода.
//------------------------------------------------------------------------------
class function DateUtils.GetPeriodBetween(DtBeg, DtEnd: TDateTime): TPeriod;
begin
  Result := InitPeriod(DtBeg, DtEnd - 1);
end;

//------------------------------------------------------------------------------
// Для одной и той-же даты даст однодневный период.
//------------------------------------------------------------------------------
class function DateUtils.GetPeriod(DtBeg, DtEnd: TDateTime): TPeriod;
begin
  Result := InitPeriod(DtBeg, DtEnd);
end;

//------------------------------------------------------------------------------
class function DateUtils.RusMnth(Mnth: Word): ShortString;
begin
  case Mnth of
     1: Result := 'январь';
     2: Result := 'февраль';
     3: Result := 'март';
     4: Result := 'апрель';
     5: Result := 'май';
     6: Result := 'июнь';
     7: Result := 'июль';
     8: Result := 'август';
     9: Result := 'сентябрь';
    10: Result := 'октябрь';
    11: Result := 'ноябрь';
    12: Result := 'декабрь';
  end;
end;

end.

