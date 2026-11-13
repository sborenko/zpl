unit WorkTime;

interface

uses
  SysUtils, Classes, DB, DBTables, CustDateUtils;

type
  TDataWorkTime = class(TDataModule)
    Query: TQuery;
  private
    procedure OpenQuery(Period: TPeriod);
  public
    function GetWorkDays(Period: TPeriod): integer;
    function GetWorkHours(Period: TPeriod): double;
    function CollectBlnDays(
      Period: TPeriod;
      DaysToCollect: integer;
      var LastDate: TDateTime;
      var Hours: double;
      Option: ShortString = 'blk'): integer;

    procedure GetBlnDaySummary(
      Date: TDateTime;
      var DayCnt: integer;
      var Hours: double;
      Option: ShortString);
  end;

var
  DataWorkTime: TDataWorkTime;

implementation

uses
  A_Const, A_Lib, QryUtils;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TDataWorkTime.OpenQuery(Period: TPeriod);
begin
  TQryUtils.InitQuery(Query);

  with Query do begin
    ParamByName('DtBeg').AsDateTime := Period.Start;
    ParamByName('DtEnd').AsDateTime := Period.Finish;
    Open;
  end;
end;

//------------------------------------------------------------------------------
// ѕолучить количество рабочих дней в периоде
//------------------------------------------------------------------------------
function TDataWorkTime.GetWorkDays(Period: TPeriod): integer;
begin
  Result := 0;
  OpenQuery(Period);

  with Query do begin
    while not Eof do begin
      if FieldByName('Rab_Chas').AsFloat > 0 then
        Inc(Result);
      Next;
    end;
  end;

  TQryUtils.ReleaseQuery(Query);
end;

//------------------------------------------------------------------------------
// ѕолучить количество рабочих часов в периоде
//------------------------------------------------------------------------------
function TDataWorkTime.GetWorkHours(Period: TPeriod): double;
begin
end;

//------------------------------------------------------------------------------
// Ќабрать количество рабочих дней в периоде.
// DaysToCollect задаЄт количество требуемых дней.
// ¬озвращает количество набранных дней.
//------------------------------------------------------------------------------
function TDataWorkTime.CollectBlnDays(
  Period: TPeriod;
  DaysToCollect: integer;
  var LastDate: TDateTime;
  var Hours: double;
  Option: ShortString): integer;
var
  Date: TDateTime;
  I, DayCnt: integer;
  DayHours: double;
begin
  Result := 0;
  OpenQuery(Period);

  for I := 0 to TDateUtils.DaysCount(Period) - 1 do begin
    Date := Period.Start + I;
    GetBlnDaySummary(Date, DayCnt, DayHours, Option);

    if DayCnt > 0 then begin
      Inc(Result);
      LastDate := Date;

      Dec(DaysToCollect);
      if DaysToCollect < 1 then
        break;
    end;
  end;

  TQryUtils.ReleaseQuery(Query);
end;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TDataWorkTime.GetBlnDaySummary(
  Date: TDateTime;      // Day to obtain information on.
  var DayCnt: integer;  // 0 either 1, depending on this day is working or not.
  var Hours: double;
  Option: ShortString); // Work hours: usually 0, 7 or 8.
var
  DayOfWeek: integer;
begin
  DayCnt := 0;
  Hours  := 0;

  with Query do begin
    if Locate('E_Day', Date, []) then begin
      Hours := FieldByName('Rab_Chas').AsFloat;

      if (Option = 'blk') or (Option = 'dkr') then
        // ƒней всЄ равно 1, т.к. нужны кадендарные,
        // а часов - сколько есть, т.к. нужны дл€ отклонений
        DayCnt := 1
      else
        if Hours = 0 then
          DayCnt := 0
        else
          DayCnt := 1;
    end else begin   {в зависимости от дн€ недели}
      DayOfWeek := RusDayOfWeek(Date);

      if DayOfWeek > 5 then begin // суббота или воскресенье
        if (Option = 'bln') then begin
          Hours := 0;
          DayCnt := 0;
        end else begin
          Hours := 0;
          DayCnt := 1;
        end;
      end else begin // рабочие дни
        Hours := nAppCnrWrkChasInDay;
        DayCnt  := 1;
      end;
    end;
  end;
end;

end.
