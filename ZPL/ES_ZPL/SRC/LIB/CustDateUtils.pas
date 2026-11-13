unit CustDateUtils;

interface

uses DB, DBClient;

type
  TPeriod = record
    Start,
    Finish: TDateTime;
  end;

  TDay = (Sunday = 1, Monday, Tuesday, Wendesday, Thirthday, Friday, Saturday);

  TDate = record
    Year, Mnth, Day: word
  end;

  TSchedule = array of TPeriod;

  TCompareResult = (FirstIsSmaller, BothAreEqual, FirstIsLarger);

  TDateUtils = class
    public
      class function Today: TDateTime;
      class function ThisMonth: TDateTime;

      class function CreatePeriod: TPeriod;
      class function InitPeriod(start, finish: TDateTime): TPeriod;
      class function PeriodIsEmpty(period: TPeriod): boolean;
      class function PeriodIsNormalized(period: TPeriod): boolean;
      class function Day(date: TDateTime): integer;
      class function Month(date: TDateTime): integer;
      class function MonthOfQuarter(month: integer): integer; overload;
      class function MonthOfQuarter(date: TDateTime): integer; overload;
      class function Quarter(month: integer): integer; overload;
      class function Quarter(date: TDateTime): integer; overload;
      class function FirstMnthOfQuart(Quart: integer): integer;
      class function Year(date: TDateTime): integer;
      class function BeginOfMonth(Date: TDateTime): TDateTime;
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
      class function IntersectPeriods(period1, period2: TPeriod): TPeriod;
      class function JoinPeriods(period1, period2: TPeriod): TPeriod; overload;
      class function SubtractPeriods(Minuend, Subtrahend: TPeriod): TSchedule;

      class function DaysCount(period: TPeriod): integer; overload;
      class function DaysCount(start, finish: TDateTime): integer; overload;

      class function WeekDay(Date: TDateTime): TDay;

      class function Encode(Date: TDate): TDateTime;
      class function Decode(Date: TDateTime): TDate;

      class procedure CreatePeriodsCDS(CDS: TClientDataSet;
        StartFieldName: string = 'Start'; FinishFieldName: string = 'Finish');

      class procedure JoinPeriods(Period: TPeriod; PeriodsDS: TDataSet;
        StartFieldName: string = 'Start'; FinishFieldName: string = 'Finish'); overload;

      class function DaysCount(DS: TDataSet; Period: TPeriod;
        StartFieldName: string = 'Start'; FinishFieldName: string = 'Finish'): integer; overload;

      class function SplitToSpans(Period: TPeriod; dsDivider: TDataSet;
        StartFieldName, FinishFieldName: string): TClientDataSet;

      class function NextMonth(dDate: TDateTime; nMonthCount: word = 1): TDateTime;
      class function PrevMonth(dDate: TDateTime; nMonthCount: word = 1): TDateTime;

      class function CompareDates(Year1, Year2, Month1, Month2: Word;
        Day1: Word = 1; Day2: Word = 1): TCompareResult;
  end;

implementation

uses
  SysUtils, Math, DebugUtils;

//------------------------------------------------------------------------------
// Создать пустой (невалидный) интервал
// Нужен, например, чтобы вернуть результат пересечения или объединения
// непересекающихся интервалов
//------------------------------------------------------------------------------
class function TDateUtils.CreatePeriod: TPeriod;
begin
  with Result do begin
    Start := Now;
    Finish := Start - 1;
  end;
end;

//------------------------------------------------------------------------------
// *** Создать интервал
//------------------------------------------------------------------------------
class function TDateUtils.InitPeriod(start, finish: TDateTime): TPeriod;
begin
  Result.start := start;
  Result.finish := finish;
end;

// *** Период пуст
class function TDateUtils.PeriodIsEmpty(Period: TPeriod): boolean;
begin
  Result := PeriodIsFinished(Period) and (Period.Finish < Period.Start);
end;

// *** Период нормализован
class function TDateUtils.PeriodIsNormalized(Period: TPeriod): boolean;
begin
  Result := Period.Start <= Period.Finish;
end;

// *** Получить день месяца
class function TDateUtils.Day(date: TDateTime): integer;
var
  day, dummyWord: word;
begin
  DecodeDate(date, dummyWord, dummyWord, day);
  Result := day;
end;

// *** Получить месяц года
class function TDateUtils.Month(date: TDateTime): integer;
var
  month, dummyWord: word;
begin
  DecodeDate(date, dummyWord, month, dummyWord);
  Result := month;
end;

// *** Получить месяц квартала
class function TDateUtils.MonthOfQuarter(month: integer): integer;
begin
  Result := (month - 1) mod 3 + 1;
end;

// *** Получить месяц квартала
class function TDateUtils.MonthOfQuarter(date: TDateTime): integer;
begin
  Result := MonthOfQuarter(Month(date));
end;

// *** Получить квартал месяца
class function TDateUtils.Quarter(month: integer): integer;
begin
  Result := (month - 1) div 3 + 1;
end;

// *** Первый месяц квартала
class function TDateUtils.FirstMnthOfQuart(Quart: integer): integer;
begin
  Result := (Quart - 1) * 3 + 1;
end;

// *** Получить квартал даты
class function TDateUtils.Quarter(date: TDateTime): integer;
begin
  Result := Quarter(Month(date));
end;

// *** Получить год даты
class function TDateUtils.Year(date: TDateTime): integer;
var
  year, dummyWord: word;
begin
  DecodeDate(date, year, dummyWord, dummyWord);
  Result := year;
end;

// *** Получить начало месяца
class function TDateUtils.BeginOfMonth(Date: TDateTime): TDateTime;
var
  Year, Mnth, DummyWord: word;
begin
  if Date = 0 then
    Result := 0
  else begin
    DecodeDate(Date, Year, Mnth, DummyWord);
    Result := EncodeDate(Year, Mnth, 1);
  end;
end;

// *** Получить начало квартала
class function TDateUtils.BeginOfQuarter(day: TDateTime): TDateTime;
var
  year, month, dummyWord: word;
begin
  DecodeDate(Now, year, month, dummyWord);
  Result := EncodeDate(year, (Quarter(month) - 1) * 3 + 1, 1);
end;

// *** Получить начало года
class function TDateUtils.BeginOfYear(date: TDateTime): TDateTime;
begin
  Result := EncodeDate(Year(date), 12, 1);
end;

// *** Получить конец месяца
class function TDateUtils.EndOfMonth(date: TDateTime): TDateTime;
begin
  Result := NextMonth(date, 1) - 1;
end;

// *** Диапазон открыт с начала
class function TDateUtils.PeriodStartIsOpen(period: TPeriod): boolean;
begin
  Result := Period.Start = 0;
end;

// *** Диапазон открыт с конца
class function TDateUtils.PeriodIsFinished(period: TPeriod): boolean;
begin
  Result := period.finish <> 0;
end;

// *** Диапазон открыт с обеих сторон
class function TDateUtils.PeriodIsBothOpen(period: TPeriod): boolean;
begin
  Result := TDateUtils.PeriodStartIsOpen(period) and not PeriodIsFinished(period);
end;

// *** Периоды равны
class function TDateUtils.PeriodsAreEqual(Period1, Period2: TPeriod): boolean;
begin
  Result := (Period1.Start = Period2.Start) and (Period1.Finish = Period2.Finish);
end;

// *** Событие произошло до начала периода
class function TDateUtils.EventIsBeforePeriod(event: TDateTime; period: TPeriod): boolean;
begin
  Result := (event <> 0) and (event < period.start);
end;

// *** Событие находится внутри диапазона
class function TDateUtils.EventIsInPeriod(event: TDateTime; period: TPeriod): boolean;
begin
  Result := (event >= period.start) and
    ((event <= period.finish) or not PeriodIsFinished(period));
end;

// *** Событие произошло после завершения периода
class function TDateUtils.EventIsAfterPeriod(event: TDateTime; period: TPeriod): boolean;
begin
  Result := event > period.finish;;
end;

// *** Событие смежно с концом периода периода
class function TDateUtils.EventIsAdjucentToFinish(Event: TDateTime; Period: TPeriod): boolean;
begin
  Result := PeriodIsFinished(Period) and (Event = Period.Finish + 1);
end;

// *** Диапазоны пересекаются
class function TDateUtils.PeriodsAreIntersected(Period1, Period2: TPeriod): boolean;
begin
  Result := not PeriodIsEmpty(Period1) and not PeriodIsEmpty(Period2)
    and (EventIsInPeriod(Period1.Start, Period2)
      or EventIsInPeriod(Period2.Start, Period1));
end;

//------------------------------------------------------------------------------
// Определить смежность периодов.
//------------------------------------------------------------------------------
class function TDateUtils.PeriodsAreAdjucent(Period1, Period2: TPeriod): boolean;
begin
  TDebug.Check(
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
class function TDateUtils.IntersectPeriods(period1, period2: TPeriod): TPeriod;
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
    Result := CreatePeriod;
end;

//------------------------------------------------------------------------------
// Получить объединение диапазонов
//------------------------------------------------------------------------------
class function TDateUtils.JoinPeriods(Period1, Period2: TPeriod): TPeriod;
begin
  if PeriodIsEmpty(Period1) then
    // Если первый период - пустой, результатом объединения становится второй.
    Result := Period2
  else if PeriodsAreIntersected(Period1, Period2) or
      PeriodsAreAdjucent(Period1, Period2) then begin
    Result.Start := Min(Period1.Start, Period2.Start);

    if not PeriodIsFinished(Period1) then
      Result.Finish := Period1.Finish
    else if not PeriodIsFinished(Period2) then
      Result.Finish := Period2.Finish
    else
      Result.Finish := Max(Period1.Finish, Period2.Finish);
  end else
    Result := Period1;
end;

//------------------------------------------------------------------------------
// Вычесть периоды
//------------------------------------------------------------------------------
class function TDateUtils.SubtractPeriods(Minuend, Subtrahend: TPeriod): TSchedule;
var
  Period: TPeriod;
begin
  SetLength(Result, 0);

  Subtrahend := IntersectPeriods(Minuend, Subtrahend);

  if PeriodIsEmpty(Subtrahend) then begin
    SetLength(Result, 1);
    Result[0] := Minuend;
  end else begin
    if EventIsInPeriod(Subtrahend.Start, Minuend) then begin
      Period.Start := Minuend.Start;
      Period.Finish := Subtrahend.Start - 1;

      if not PeriodIsEmpty(Period) then begin
        SetLength(Result, 1);
        Result[0] := Period;
      end
    end;

    if TDateUtils.EventIsInPeriod(Subtrahend.Finish, Minuend) then begin
      Period.Start := Subtrahend.Finish + 1;
      Period.Finish := Minuend.Finish;

      if not PeriodIsEmpty(Period) then begin
        SetLength(Result, Length(Result) + 1);
        Result[Length(Result) - 1] := Period;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
// *** Получить количество дней в периоде
//------------------------------------------------------------------------------
class function TDateUtils.DaysCount(period: TPeriod): integer;
begin
  if PeriodStartIsOpen(period) or not PeriodIsFinished(period) then
    Result := MaxInt
  else
    Result := Max(0, Trunc(period.finish - period.start + 1));
end;

//------------------------------------------------------------------------------
class function TDateUtils.DaysCount(start, finish: TDateTime): integer;
begin
  Result := DaysCount(InitPeriod(start, finish));
end;

//------------------------------------------------------------------------------
class function TDateUtils.WeekDay(Date: TDateTime): TDay;
begin
  Result := TDay(DayOfWeek(Date));
end;

//------------------------------------------------------------------------------
// *** Создать CDS для накопления периодов
//------------------------------------------------------------------------------
class procedure TDateUtils.CreatePeriodsCDS(
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
class function TDateUtils.SplitToSpans(Period: TPeriod; dsDivider: TDataSet;
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

// ***
// Объединяет период, заданный параметром Period с периодами содержащимися в PeriodsDS.
// Если не произошло объединения ни с одним из периодов, Period добавляется в PeriodsDS.
// Таким образом, PeriodsDS всегда содержит набор непересекающихся периодов и должен быть
// проиндексирован по полям StartFieldName и FinishFieldName.
// ***
class procedure TDateUtils.JoinPeriods(
  Period: TPeriod; PeriodsDS: TDataSet;
  StartFieldName, FinishFieldName: string);
var
  Span: TPeriod;
  Joined: boolean;
begin
  if not PeriodIsEmpty(Period) then
    exit;

  Joined := false;

  with PeriodsDS do begin
    First;

    while not Eof do begin
      Span := InitPeriod(FieldByName(StartFieldName).AsDateTime,
        FieldByName(FinishFieldName).AsDateTime);

      if PeriodsAreIntersected(Period, Span) then begin
        if Joined {не первое объединение} then
          // Удаляем текущую, чтобы не возникали пересекающиеся периоды,
          Delete;// при этом откатываемся на предыдущую запись.

        Period := JoinPeriods(Period, Span);

        Edit;
        FieldByName(StartFieldName).AsDateTime := Period.Start;
        FieldByName(FinishFieldName).AsDateTime := Period.Finish;
        Post;

        Joined := true;
      end else if EventIsAfterPeriod(Period.Start, Span) then
        break;

      Next;
    end;

    if not Joined then begin
      Insert;
      FieldByName(StartFieldName).AsDateTime := Period.Start;
      FieldByName(FinishFieldName).AsDateTime := Period.Finish;
      Post;
    end;
  end;
end;

// ***
class function TDateUtils.DaysCount(
  DS: TDataSet;
  Period: TPeriod;
  StartFieldName: string = 'Start'; FinishFieldName: string = 'Finish'): integer;
begin
  Result := 0;

  with DS do begin
    First;

    while not Eof do begin
      Result := Result + DaysCount(
        IntersectPeriods(
          InitPeriod(
            FieldByName(StartFieldName).AsDateTime, FieldByName(FinishFieldName).AsDateTime),
            Period));

      Next;
    end;
  end; {with}
end;

// ***
class function TDateUtils.PrevMonth(dDate: TDateTime; nMonthCount: word): TDateTime;
var
  nMonth, nYear, nDummyWord, I: word;
begin
  DecodeDate(dDate, nYear, nMonth, nDummyWord);

  for I := 1 to nMonthCount do
    if nMonth = 1 then begin
      nMonth := 12;
      nYear := nYear - 1;
    end else
      nMonth := nMonth - 1;

  Result := EncodeDate(nYear, nMonth, 1);
end;

// ***
class function TDateUtils.NextMonth(dDate: TDateTime; nMonthCount: word): TDateTime;
var
  nMonth, nYear, nDummyWord, I: word;
begin
  DecodeDate(dDate, nYear, nMonth, nDummyWord);

  for I := 1 to nMonthCount do
    if nMonth = 12 then begin
      nMonth := 1;
      nYear := nYear + 1;
    end else
      nMonth := nMonth + 1;

  Result := EncodeDate(nYear, nMonth, 1);
end;

// ***
// ***
class function TDateUtils.Today: TDateTime;
begin
  Result := Date;
end;

// ***
// ***
class function TDateUtils.ThisMonth: TDateTime;
begin
  Result := BeginOfMonth(Today)
end;

//------------------------------------------------------------------------------
class function TDateUtils.CompareDates(Year1, Year2, Month1, Month2: Word;
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
// Преобразовывает структуру TDate в TDateTime
//------------------------------------------------------------------------------
class function TDateUtils.Encode(Date: TDate): TDateTime;
begin
  Result := EncodeDate(Date.Year, Date.Mnth, Date.Day);
end;

//------------------------------------------------------------------------------
// Преобразовывает TDateTime в структуру TDate
//------------------------------------------------------------------------------
class function TDateUtils.Decode(Date: TDateTime): TDate;
begin
  DecodeDate(Date, Result.Year, Result.Mnth, Result.Day);
end;

end.

