unit DateLib;

interface

uses
  DB, DBClient;

const
  INFINITY = 0;

type
  TEvent = TDateTime;

  TPeriod = record
    Start,
    Finish: TDateTime;
  end;
  TSpan = TPeriod;

  TPeriods = array of TPeriod;
  TSpans = TPeriods;

  TWeek = (Sunday = 1, Monday, Tuesday, Wendesday, Thirthday, Friday, Saturday);
  TRusWeek = (RusMon = 1, RusTue, RusWed, RusThu, RusFri, RusSat, RusSun);

  TDate = record
    Year, Mnth, Day: word
  end;

  TCompareResult = (FirstIsSmaller, BothAreEqual, FirstIsLarger);

  DateUtils = class
    private
      class function CheckEventSpanDef(Event: TEvent; Span: TSpan): Boolean;
      class function CheckSpansDef(Span1, Span2: TSpan): Boolean;
      class function Day(DateTime: TDateTime): TDateTime;
    public
      class function Today: TDateTime;
      class function ThisMonth: TDateTime;

      class function DateYear(date: TDateTime): Word;
      class function DateMonth(date: TDateTime): Word;
      class function DateDay(date: TDateTime): Word;

      class function CreateEmptyPeriod(Value: TDateTime = 0): TPeriod;
      class function CreatePeriod(Start, Finish: TDateTime): TPeriod;

      class function InitPeriod(Value: TDateTime = 0): TPeriod; overload;
      class function InitPeriod(Start, Finish: TDateTime): TPeriod; overload;
      class function InitPeriod(Start, Finish: TDate): TPeriod; overload;

      class function CreateMnthPeriod(Mnth: TDateTime): TPeriod;

      class function BeginOfMonth(Date: TDateTime): TDateTime;
      class function EndOfMonth(Date: TDateTime): TDateTime;
      class function MonthCnt(BegDt, EndDt: TDateTime): Integer;

      class function BeginOfQuarter(Date: TDateTime): TDateTime;
      class function EndOfQuarter(Date: TDateTime): TDateTime;

      class function MonthOfQuarter(month: integer): integer; overload;
      class function MonthOfQuarter(date: TDateTime): integer; overload;
      class function Quarter(month: integer): integer; overload;
      class function Quarter(date: TDateTime): integer; overload;
      class function FirstMnthOfQuart(Quart: integer): integer;

      class function BeginOfYear(Date: TDateTime): TDateTime;
      class function EndOfYear(Date: TDateTime): TDateTime;

      class function PeriodIsEmpty(Period: TPeriod): Boolean;
      class function PeriodStartIsOpen(Period: TPeriod): Boolean;
      class function PeriodIsFinished(Period: TPeriod): Boolean;
      class function PeriodIsEndless(Period: TPeriod): Boolean;
      class function PeriodsAreEqual(Period1, Period2: TPeriod): Boolean;
      class function PeriodsAreIntersected(Period1, Period2: TPeriod): Boolean;
      class function PeriodsAreAdjucent(Period1, Period2: TPeriod): Boolean;

      class function EventIsDef(Event: TDateTime): Boolean;
      class function EventsAreAdjucent(Event1, Event2: TDateTime): Boolean;

      class function EventIsBeforePeriod(
        Event: TDateTime; Period: TPeriod): Boolean;
      class function EventIsInPeriod(
        Event: TDateTime; Period: TPeriod): Boolean;
      class function EventIsAfterPeriod(
        Event: TDateTime; Period: TPeriod): Boolean;
      class function EventIsAdjucentToStart(
        Event: TDateTime; Period: TPeriod): Boolean;
      class function EventIsAdjucentToFinish(
        Event: TDateTime; Period: TPeriod): Boolean;

      class function IntersectPeriods(Period1, Period2: TPeriod): TPeriod;
      class function JoinPeriods(period1, period2: TPeriod;
        JoinAdjucent: boolean = true): TPeriod;

      class function SubtractPeriods(
        Minuend, Subtrahend: TPeriod): TPeriods; overload;
      class procedure SubtractPeriods(
        Minuend, Subtrahend: TPeriod; var Result: TPeriods); overload;

      class function SubtractHasHead(
        Residual: TPeriods; Subtrahend: TPeriod): Boolean;
      class function SubtractHasTail(
        Residual: TPeriods; Subtrahend: TPeriod): Boolean;
      class function GetSubtractHead(Residual: TPeriods): TPeriod;
      class function GetSubtractTail(Residual: TPeriods): TPeriod;

      class function YearDaysCnt(Year: Word): Integer;
      class function DaysCount(Period: TPeriod): integer; overload;
      class function DaysCount(Start, Finish: TDateTime): integer; overload;

      class function WeekDay(Date: TDateTime): TWeek;
      class function RusWeekDay(Date: TDateTime): TRusWeek;

      class function InitDate(Year, Mnth: word; Day: word = 1): TDate;
      class function Encode(Date: TDate): TDateTime;
      class function Decode(Date: TDateTime): TDate;

      class procedure CreatePeriodsCDS(CDS: TClientDataSet;
        StartFieldName: string; FinishFieldName: string);

      class procedure IntersectDataSet(DataSet: TDataSet;
        BegFldName, EndFldName: string; Period: TPeriod;
        DeleteNonIntersect: boolean = false);

      class function DaysCount(DataSet: TDataSet;
        BegFldName,EndFldName: ShortString): Integer; overload;

      class function SplitToSpans(Period: TPeriod; dsDivider: TDataSet;
        StartFieldName, FinishFieldName: string): TClientDataSet;

      class function PrevMonth(Date: TDateTime; MnthCount: Word = 1): TDateTime;
      class function NextMonth(Date: TDateTime; MnthCount: Word = 1): TDateTime;

      class function CompareDates(Year1, Year2, Month1, Month2: Word;
        Day1: Word = 1; Day2: Word = 1): TCompareResult;

      class function GetPeriodBetween(DtBeg, DtEnd: TDateTime): TPeriod;
      class function GetPeriod(DtBeg, DtEnd: TDateTime): TPeriod;

      class function RusMnth(Mnth: Word): ShortString;

      class function Milliseconds: Integer; overload;
      class function Milliseconds(Start, Finish: TDateTime): Integer; overload;
      class function MillisecOfThisHour: Integer;

      class function ConvertDate(StrDate: ShortString): TDateTime;

      class function IntToRome(Mnth: Integer): ShortString;
      class function MnthToRome(Mnth: Integer): ShortString;
  end;

implementation

uses
  DateUtils, Math, SysUtils;

//------------------------------------------------------------------------------
// Дата без времени
//------------------------------------------------------------------------------
class function DateUtils.Day(DateTime: TDateTime): TDateTime;
begin
  // Decode/Encode - чтобы избавиться от часов/минут
  Result := Encode(Decode(DateTime));
end;

//------------------------------------------------------------------------------
// Сегодня
//------------------------------------------------------------------------------
class function DateUtils.Today: TDateTime;
begin
  Result := Day(Now);
end;

//------------------------------------------------------------------------------
class function DateUtils.ThisMonth: TDateTime;
begin
  Result := BeginOfMonth(Today)
end;

//------------------------------------------------------------------------------
// Создать пустой (невалидный) интервал
// Нужен, например, чтобы вернуть результат пересечения или объединения
// непересекающихся интервалов
//------------------------------------------------------------------------------
class function DateUtils.InitPeriod(Value: TDateTime = 0): TPeriod;
begin
  Result := CreateEmptyPeriod(Value);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class function DateUtils.CreateEmptyPeriod(Value: TDateTime = 0): TPeriod;
begin
  with Result do begin
    if Value = 0 then
      Start := Today
    else
      Start := Day(Value);
      
    Finish := Start - 1;
  end;
end;

//------------------------------------------------------------------------------
// *** Создать интервал
//------------------------------------------------------------------------------
class function DateUtils.CreatePeriod(Start, Finish: TDateTime): TPeriod;
begin
  Result := InitPeriod(Start, Finish);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class function DateUtils.InitPeriod(Start, Finish: TDateTime): TPeriod;
begin
  Result.Start := Start;
  Result.Finish := Finish;
end;

// ***
class function DateUtils.InitPeriod(Start, Finish: TDate): TPeriod;
begin
  Result := InitPeriod(Encode(Start), Encode(Finish));
end;

//------------------------------------------------------------------------------
// Период пуст, если он окончен и окончание меньше начала.
//------------------------------------------------------------------------------
class function DateUtils.PeriodIsEmpty(Period: TPeriod): Boolean;
begin
  Result := PeriodIsFinished(Period) and (Period.Finish < Period.Start);
end;

//------------------------------------------------------------------------------
class function DateUtils.CreateMnthPeriod(Mnth: TDateTime): TPeriod;
begin
  Result.Start := BeginOfMonth(Mnth);
  Result.Finish := EndOfMonth(Mnth);
end;

//------------------------------------------------------------------------------
// Получить год даты
//------------------------------------------------------------------------------
class function DateUtils.DateYear(date: TDateTime): Word;
var
  year, dummyWord: word;
begin
  DecodeDate(date, year, dummyWord, dummyWord);
  Result := year;
end;

//------------------------------------------------------------------------------
// Получить месяц года
//------------------------------------------------------------------------------
class function DateUtils.DateMonth(date: TDateTime): Word;
var
  month, dummyWord: word;
begin
  DecodeDate(date, dummyWord, month, dummyWord);
  Result := month;
end;

//------------------------------------------------------------------------------
// Получить день месяца
//------------------------------------------------------------------------------
class function DateUtils.DateDay(date: TDateTime): Word;
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

//------------------------------------------------------------------------------
// Получить начало месяца
//------------------------------------------------------------------------------
class function DateUtils.BeginOfMonth(Date: TDateTime): TDateTime;
var
  CustDate: TDate;
begin
  Assert(EventIsDef(Date));

  CustDate := Decode(Date);
  CustDate.Day := 1;

  Result := Encode(CustDate);
end;

//------------------------------------------------------------------------------
// Получить начало квартала
//------------------------------------------------------------------------------
class function DateUtils.BeginOfQuarter(Date: TDateTime): TDateTime;
var
  CustDate: TDate;
begin
  Assert(EventIsDef(Date));

  CustDate := Decode(Date);
  CustDate.Mnth := (Quarter(CustDate.Mnth) - 1) * 3 + 1;

  Result := Encode(CustDate);
end;

//------------------------------------------------------------------------------
// Получить начало квартала
//------------------------------------------------------------------------------
class function DateUtils.EndOfQuarter(Date: TDateTime): TDateTime;
begin
  Date := BeginOfQuarter(Date);
  Date := NextMonth(Date, 2);
  Result := EndOfMonth(Date);
end;

//------------------------------------------------------------------------------
// Получить начало года
//------------------------------------------------------------------------------
class function DateUtils.BeginOfYear(Date: TDateTime): TDateTime;
begin
  Assert(EventIsDef(Date));

  Result := EncodeDate(DateYear(Date), 1, 1);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class function DateUtils.EndOfYear(Date: TDateTime): TDateTime;
begin
  Assert(EventIsDef(Date));

  Result := EncodeDate(DateYear(Date), 12, 31);
end;

//------------------------------------------------------------------------------
// Получить конец месяца
//------------------------------------------------------------------------------
class function DateUtils.EndOfMonth(Date: TDateTime): TDateTime;
begin
  Assert(EventIsDef(Date));

  Result := NextMonth(Date) - 1;
end;

//------------------------------------------------------------------------------
class function DateUtils.MonthCnt(BegDt, EndDt: TDateTime): Integer;
var
  Date1, Date2: TDate;
begin
  Date1 := Decode(BegDt);
  Date2 := Decode(EndDt);
  Result := (Date2.Year - Date1.Year) * 12 + Date2.Mnth - Date1.Mnth;
end;

//------------------------------------------------------------------------------
// Событие определено если его значение отличается от нуля.
//------------------------------------------------------------------------------
class function DateUtils.EventIsDef(Event: TDateTime): Boolean;
begin
  Result := Event <> 0;
end;

//------------------------------------------------------------------------------
// Событие смежно с другим событием если оба определены и их значения отличаются
// на единицу.
//------------------------------------------------------------------------------
class function DateUtils.EventsAreAdjucent(
  Event1, Event2: TDateTime): Boolean;
begin
  Result := EventIsDef(Event1) and EventIsDef(Event2)
    and ((Event1 + 1 = Event2) or (Event1 - 1 = Event2));
end;

//------------------------------------------------------------------------------
// Событие произошло до начала периода если оно предшествует началу периода.
//------------------------------------------------------------------------------
class function DateUtils.EventIsBeforePeriod(
  Event: TDateTime;
  Period: TPeriod): Boolean;
begin
  Result := CheckEventSpanDef(Event, Period);

  if not Result then
    exit;

  Result := Event < Period.Start;
end;

//------------------------------------------------------------------------------
// Событие произошло после завершения периода если конец периода предшествует
// событию.
//------------------------------------------------------------------------------
class function DateUtils.EventIsAfterPeriod(
  Event: TDateTime;
  Period: TPeriod): Boolean;
begin
  Result := CheckEventSpanDef(Event, Period);

  if not Result then
    exit;

  Result := Event > Period.Finish;
end;

//------------------------------------------------------------------------------
class function DateUtils.EventIsInPeriod(
  Event: TDateTime;
  Period: TPeriod): Boolean;
begin
  Result := CheckEventSpanDef(Event, Period);

  if not Result then
    exit;

  Result := (Event >= Period.Start)
    and ((Event <= Period.Finish) or not PeriodIsFinished(Period));
end;

//------------------------------------------------------------------------------
// Событие смежно с концом периода периода и следует
//------------------------------------------------------------------------------
class function DateUtils.EventIsAdjucentToStart(
  Event: TDateTime;
  Period: TPeriod): Boolean;
begin
  Result := CheckEventSpanDef(Event, Period);

  if not Result then
    exit;

  Result := Event = Period.Start - 1;
end;

//------------------------------------------------------------------------------
// Событие смежно с концом периода периода и следует
//------------------------------------------------------------------------------
class function DateUtils.EventIsAdjucentToFinish(
  Event: TDateTime;
  Period: TPeriod): Boolean;
begin
  Result := CheckEventSpanDef(Event, Period);

  if not Result then
    exit;

  Result := Event = Period.Finish + 1;
end;

//------------------------------------------------------------------------------
// Диапазон открыт с начала если его начало нулевое.
//------------------------------------------------------------------------------
class function DateUtils.PeriodStartIsOpen(Period: TPeriod): Boolean;
begin
  Result := not EventIsDef(Period.Start);
end;

//------------------------------------------------------------------------------
// Диапазон открыт с конца если его окончание нулевое.
//------------------------------------------------------------------------------
class function DateUtils.PeriodIsFinished(Period: TPeriod): Boolean;
begin
  Result := EventIsDef(Period.Finish);
end;

//------------------------------------------------------------------------------
// Период бесконечен если оба конца открыты.
//------------------------------------------------------------------------------
class function DateUtils.PeriodIsEndless(Period: TPeriod): Boolean;
begin
  Result := PeriodStartIsOpen(Period) and not PeriodIsFinished(Period);
end;

//------------------------------------------------------------------------------
// Периоды равны
//------------------------------------------------------------------------------
class function DateUtils.PeriodsAreEqual(
  Period1, Period2: TPeriod): Boolean;
begin
  Result := PeriodIsEmpty(Period1) and PeriodIsEmpty(Period2)
    or (Period1.Start = Period2.Start) and (Period1.Finish = Period2.Finish);
end;

//------------------------------------------------------------------------------
// Диапазоны пересекаются
//------------------------------------------------------------------------------
class function DateUtils.PeriodsAreIntersected(
  Period1, Period2: TPeriod): Boolean;
begin
  Result := CheckSpansDef(Period1, Period2);

  if not Result then
    exit;

  Result :=
    PeriodIsEndless(Period1) or PeriodIsEndless(Period2)
    or EventIsInPeriod(Period1.Start, Period2)
    or EventIsInPeriod(Period1.Finish, Period2)
    or EventIsInPeriod(Period2.Start, Period1)
    or EventIsInPeriod(Period2.Finish, Period1);
end;

//------------------------------------------------------------------------------
// Периоды смежны
//------------------------------------------------------------------------------
class function DateUtils.PeriodsAreAdjucent(
  Period1, Period2: TPeriod): Boolean;
begin
{
  DebugUtils.Check(
    PeriodIsEmpty(Period1) and not PeriodIsEmpty(Period2)
    or not PeriodIsEmpty(Period1) and not PeriodIsEmpty(Period2) and (Period1.Start < Period2.Start),
    'Первый период может быть пустым. Тогда второй - Если оба - непустые, ' +
    'предполагается хронологическая последовательность начал периодов.'
    );
}
    
  with Period1 do
    Result := not PeriodIsEmpty(Period1) and not PeriodIsEmpty(Period2)
      and (PeriodIsFinished(Period1) and (Finish + 1 = Period2.Start)
        or not PeriodStartIsOpen(Period1) and (Start = Period2.Finish + 1));
end;

//------------------------------------------------------------------------------
// Получить пересечение диапазонов
//------------------------------------------------------------------------------
class function DateUtils.IntersectPeriods(Period1, Period2: TPeriod): TPeriod;
begin
  if PeriodsAreIntersected(Period1, Period2) then begin
    Result.start := Max(Period1.Start, Period2.Start);

    if not PeriodIsFinished(Period1) then
      Result.Finish := period2.Finish
    else if not PeriodIsFinished(Period2) then
      Result.Finish := Period1.Finish
    else
      Result.finish := Min(Period1.Finish, Period2.Finish);
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
  var Result: TPeriods
);
var
  Period: TPeriod;
begin
  SetLength(Result, 0);

  // Уменьшаемое -  пусто, оставляем разницу пустой
  if PeriodIsEmpty(Minuend) then
    exit;

  // Вычитаемое -  пусто ...
  if PeriodIsEmpty(Subtrahend)
    // ... или периоды не пересекаются
    or not PeriodsAreIntersected(Minuend, Subtrahend) then
  begin
    // разница равна уменьшаемому
    SetLength(Result, 1);
    Result[0] := Minuend;
    exit;
  end;

  if EventIsInPeriod(Subtrahend.Start, Minuend) then begin
    // Начало вычитаемого лежит в уменьшаемом.
    Period.Start := Minuend.Start;
    Period.Finish := Subtrahend.Start - 1;

    // В случае совпадения начал результат окажется пустым

    if not PeriodIsEmpty(Period) then begin
      SetLength(Result, 1);
      Result[0] := Period;
    end;
  end;

  if EventIsInPeriod(Subtrahend.Finish, Minuend) then begin
    // Конец вычитаемого лежит в уменьшаемом.
    Period := Minuend;
    Period.Start := Subtrahend.Finish + 1;

    // В случае совпадения концов результат окажется пустым

    if not PeriodIsEmpty(Period) then begin
      SetLength(Result, Length(Result) + 1);
      Result[Length(Result) - 1] := Period;
    end;
  end;
end;

//------------------------------------------------------------------------------
class function DateUtils.SubtractHasHead(
  Residual: TPeriods;
  Subtrahend: TPeriod): Boolean;
begin
  Result :=
    (Length(Residual) = 2) or (Length(Residual) = 1) and
      // Период без начала не может создавать "голову"
      not PeriodStartIsOpen(Subtrahend) and
      // Неоконченный период не может быть "головой"
      PeriodIsFinished(Residual[0]) and
      // Взаимное расположение
      (Residual[0].Finish < Subtrahend.Start);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class function DateUtils.SubtractHasTail(
  Residual: TPeriods;
  Subtrahend: TPeriod): Boolean;
begin
  Result :=
    (Length(Residual) = 2) or (Length(Residual) = 1) and
      // Неоконченный период без не может создавать "хвост"
      PeriodIsFinished(Subtrahend) and
      // Период без начала не может быть "хвостом"
      not PeriodStartIsOpen(Residual[0]) and
      // Взаимное расположение
      (Residual[0].Start > Subtrahend.Finish);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class function DateUtils.GetSubtractHead(Residual: TPeriods): TPeriod;
begin
  Result := Residual[0];
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class function DateUtils.GetSubtractTail(Residual: TPeriods): TPeriod;
begin
  Result := Residual[Length(Residual) - 1]
end;

//------------------------------------------------------------------------------
// Получить количество дней в году
//------------------------------------------------------------------------------
class function DateUtils.YearDaysCnt(Year: Word): Integer;
begin
  if Year mod 4 = 0 then
    Result := 366
  else
    Result := 365;
end;

//------------------------------------------------------------------------------
// Получить количество дней в периоде
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
class function DateUtils.WeekDay(Date: TDateTime): TWeek;
begin
  Result := TWeek(DayOfWeek(Date));
end;

//------------------------------------------------------------------------------
class function DateUtils.RusWeekDay(Date: TDateTime): TRusWeek;
var
  Day: Word;
begin
  Day := DayOfWeek(Date);

  if Day = 1 then
    Result := TRusWeek(7)
  else
    Result := TRusWeek(Day - 1);
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
  BegFldName, EndFldName: ShortString
): Integer;
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
class function DateUtils.PrevMonth(
  Date: TDateTime;
  MnthCount: Word = 1): TDateTime;
var
  Year, Mnth, DummyWord, I: word;
begin
  Assert(Date <> 0);

  DecodeDate(Date, Year, Mnth, DummyWord);

  for i := 1 to mnthcount do
    if mnth = 1 then begin
      mnth := 12;
      dec(year);
    end else
      dec(mnth);
  
  result := encodedate(year, mnth, 1);
end;

//------------------------------------------------------------------------------
class function DateUtils.NextMonth(
  Date: TDateTime;
  MnthCount: Word = 1): TDateTime;
var
  Year, Mnth, DummyWord, I: Word;
begin
  Assert(Date <> 0);
  
  DecodeDate(Date, Year, Mnth, DummyWord);
    
  for I := 1 to MnthCount do
    if Mnth = 12 then begin
      Mnth := 1;
      Inc(Year);
    end else
      Inc(Mnth);
    
  Result := EncodeDate(Year, Mnth, 1);
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

//------------------------------------------------------------------------------
class function DateUtils.Milliseconds: Integer;
begin
  Result := Milliseconds(PrevMonth(Now, 12), Now);
end;

//------------------------------------------------------------------------------
class function DateUtils.Milliseconds(Start, Finish: TDateTime): Integer;
begin
  Result := MilliSecondsBetween(Start, Finish);
end;

//------------------------------------------------------------------------------
class function DateUtils.MillisecOfThisHour: Integer;
begin
  Result := MilliSecondOfTheHour(Now);
end;

//------------------------------------------------------------------------------
class function DateUtils.ConvertDate(StrDate: ShortString): TDateTime;
var
  Fs: TFormatSettings;
begin
  GetLocaleFormatSettings(0, Fs);

  if Pos(Fs.DateSeparator, StrDate) = 0 then
    // Если текущий разделитель дат не соответствует разделителю в пришедшей
    // строке даты, переформатируем её.
    StrDate :=
      Copy(StrDate, 1, 2) + Fs.DateSeparator +
      Copy(StrDate, 4, 2) + Fs.DateSeparator +
      Copy(StrDate, 7, Length(StrDate) - 7 + 1);

  Result := StrToDate(StrDate, Fs);
end;

//------------------------------------------------------------------------------
class function DateUtils.IntToRome(Mnth: Integer): ShortString;
begin
  Result := MnthToRome(Mnth);
end;

//------------------------------------------------------------------------------
class function DateUtils.MnthToRome(Mnth: Integer): ShortString;
begin
  Result := '';

  case Mnth of
    1:
      Result := 'I';
    2:
      Result := 'II';
    3:
      Result := 'III';
    4:
      Result := 'IV';
    5:
      Result := 'V';
    6:
      Result := 'VI';
    7:
      Result := 'VII';
    8:
      Result := 'VIII';
    9:
      Result := 'IX';
    10:
      Result := 'X';
    11:
      Result := 'XI';
    12:
      Result := 'XII';
  end;
end;

//------------------------------------------------------------------------------
class function DateUtils.CheckEventSpanDef(Event: TEvent; Span: TSpan): Boolean;
begin
  Result := EventIsDef(Event) and not PeriodIsEmpty(Span);
end;

//------------------------------------------------------------------------------
class function DateUtils.CheckSpansDef(Span1, Span2: TSpan): Boolean;
begin
  Result := not PeriodIsEmpty(Span1) and not PeriodIsEmpty(Span2);
end;

end.

