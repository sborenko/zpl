unit RangeLib;

interface

type
  TRange = record
    Start,
    Finish: TDateTime;
  end;

function InitRange(start, finish: TDateTime): TRange;
function EventIsInRange(event: TDateTime; range: TRange): boolean;
function RangeIsFinished(range: TRange): boolean;
function RangesAreIntersected(range1, range2: TRange): boolean;
function UniteRanges(range1, range2: TRange): TRange;

implementation

uses Math, SysUtils;

// *** //
function Day(date: TDateTime): integer;
var
  day, dummyWord: word;
begin
  DecodeDate(date, dummyWord, dummyWord, day);
  Result := day;
end;

// *** //
function Month(date: TDateTime): integer;
var
  month, dummyWord: word;
begin
  DecodeDate(date, dummyWord, month, dummyWord);
  Result := month;
end;

// *** //
function Quarter(month: integer): integer; overload;
begin
  Result := (month - 1) mod 3 + 1;
end;

// *** //
function Quarter(date: TDateTime): integer; overload;
begin
  Result := (Month(date) - 1) mod 3 + 1;
end;

// *** //
function Year(date: TDateTime): integer;
var
  year, dummyWord: word;
begin
  DecodeDate(date, year, dummyWord, dummyWord);
  Result := year;
end;

// *** //
function BeginOfMonth(day: TDateTime): TDateTime;
var
  year, month, dummyWord: word;
begin
  DecodeDate(Now, year, month, dummyWord);
  Result := EncodeDate(year, month, 1);
end;

// *** //
function BeginOfQuarter(day: TDateTime): TDateTime;
var
  year, month, dummyWord: word;
begin
  DecodeDate(Now, year, month, dummyWord);
  Result := EncodeDate(year, (Quarter(month) - 1) * 3 + 1, 1);
end;

// *** //
function BeginOfYear(date: TDateTime): TDateTime;
begin
  Result := EncodeDate(Year(date), 12, 1);
end;


// *** //
function EmptyRange: TRange;
begin
  Result.start := Now + 1;
  Result.finish := Now - 1;
end;

// *** //
function InitRange(start, finish: TDateTime): TRange;
begin
  Result.start := start;
  Result.finish := finish;
end;

// *** //
function RangeIsEmpty(range: TRange): boolean;
begin
  Result := (range.start > range.finish) and (range.finish > 0);
end;

// *** //
function RangeStartIsOpen(range: TRange): boolean;
begin
  Result := range.start = 0;
end;

// *** //
function RangeIsFinished(range: TRange): boolean;
begin
  Result := range.finish <> 0;
end;

// *** //
function RangeIsInfinit(range: TRange): boolean;
begin
  Result := RangeStartIsOpen(range) and not RangeIsFinished(range);
end;

// *** //
function EventIsInRange(event: TDateTime; range: TRange): boolean;
begin
  Result := (event >= range.start) and
    ((event <= range.finish) or not RangeIsFinished(range));
end;

// *** //
function RangesAreIntersected(range1, range2: TRange): boolean;
begin
  Result := EventIsInRange(range1.start, range2) or
    EventIsInRange(range2.start, range1);
end;

// *** //
function IntersectRanges(range1, range2: TRange): TRange;
begin
  if RangesAreIntersected(range1, range2) then begin
    Result.start := Max(range1.start, range2.start);
    if range1.finish = 0 then
      Result.finish := range2.finish
    else if range2.finish = 0 then
      Result.finish := range1.finish
    else
      Result.finish := Min(range1.finish, range2.finish);
  end;
end;

// *** //
function UniteRanges(range1, range2: TRange): TRange;
begin
  if RangesAreIntersected(range1, range2) then begin
    Result.start := Min(range1.start, range2.start);
    if range1.finish = 0 then
      Result.finish := range1.finish
    else if range2.finish = 0 then
      Result.finish := range2.finish
    else
      Result.finish := Max(range1.finish, range2.finish);
  end;
end;

end.
