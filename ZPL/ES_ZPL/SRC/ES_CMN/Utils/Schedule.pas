unit Schedule;

interface

uses CustDateUtils;

type
  TCalendar = class(TObject)
  private
    Schedule: TSchedule;
  public
    constructor Create; overload; virtual;
    constructor Create(Period: TPeriod); overload;
    destructor Destroy; override;

    procedure AddSchedule(Schedule: TSchedule);
    procedure AddPeriod(Period: TPeriod);
    procedure InsertPeriod(Index: integer; Period: TPeriod);
    procedure DeletePeriod(Index: integer);

    function GetPeriod(Index: integer): TPeriod;
    function Last: TPeriod;

    function LastIndex: integer;

    procedure SubtractPeriod(Period: TPeriod);
  end;

implementation

// ***
// Конструктор
// ***
constructor TCalendar.Create;
begin
  SetLength(Schedule, 0);
end;

constructor TCalendar.Create(Period: TPeriod);
begin
  SetLength(Schedule, 1);
  Schedule[0] := Period;
end;

destructor TCalendar.Destroy;
begin
  SetLength(Schedule, 0);
end;

// ***
// ***
procedure TCalendar.AddSchedule(Schedule: TSchedule);
var
  I: integer;
begin
  for I := 0 to Length(Schedule) - 1 do
    AddPeriod(Schedule[I]);
end;

// ***
// Добавить период
// ***
procedure TCalendar.AddPeriod(Period: TPeriod);
var
  Len: integer;
begin
  Len := Length(Schedule) + 1;
  SetLength(Schedule, Len);
  Schedule[Len - 1] := Period;
end;

// ***
// Вставить период
// ***
procedure TCalendar.InsertPeriod(Index: integer; Period: TPeriod);
var
  Len, I: integer;
begin
  Len := Length(Schedule) + 1;
  SetLength(Schedule, Len);
  for I := Len - 2 to Index do
    Schedule[I + 1] := Schedule[I];
  Schedule[Index] := Period;
end;

// ***
// Вычесть период из расписания
// ***
procedure TCalendar.SubtractPeriod(Period: TPeriod);
var
  I: integer;
  Minuend, Result: TPeriod;
begin
  for I := 0 to Length(Schedule) - 1 do begin
    Minuend := Schedule[I];
    Result := Minuend;
    if TDateUtils.EventIsInPeriod(Period.Start, Result) then begin
      Result.Finish := Period.Start - 1;
      Schedule[I] := Result;
    end;

    Result := Minuend;
    if TDateUtils.EventIsInPeriod(Period.Finish, Result) then begin
      Result.Start := Period.Finish + 1;
      InsertPeriod(I + 1, Result);
    end;

    if TDateUtils.EventIsInPeriod(Minuend.Start, Period) and
        TDateUtils.EventIsInPeriod(Minuend.Finish, Period) then
      DeletePeriod(I);
  end;
end; 

// ***
// Последний элемент
// ***
function TCalendar.Last: TPeriod;
begin
  Result := GetPeriod(LastIndex);
end;

// ***
// Получить период
// ***
function TCalendar.GetPeriod(Index: integer): TPeriod;
begin
  Result := Schedule[Index];
end;

// ***
// Индекс последнего элемента
// ***
function TCalendar.LastIndex: integer;
begin
  Result := Length(Schedule) - 1;
end;

// ***
// Удалить период
// ***
procedure TCalendar.DeletePeriod(Index: integer);
var
  Len, I: integer;
begin
  Len := Length(Schedule);
  for I := Index + 1 to Len - 1 do
    Schedule[I - 1] := Schedule[I];
  SetLength(Schedule, Len - 1);
end;

end.
