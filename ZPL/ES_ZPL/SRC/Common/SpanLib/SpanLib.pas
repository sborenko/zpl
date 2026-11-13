unit SpanLib;

interface

uses
  Classes, Db, DbClient, DateLib, PeriodIter;

type
  TIntersectNotifyFunc = procedure (
    TPeriodIter1, PeriodIter2: TPeriodIter; Period: TPeriod) of object;
  TSubtractNotifyFunc = procedure (
    TPeriodIter1, PeriodIter2: TPeriodIter; Periods: TPeriods) of object;

  TCycleActionProc = procedure of object;

  TSpanIter = class
  private
    PeriodIter1, PeriodIter2: TPeriodIter;

    IntersectNotifier: TIntersectNotifyFunc;
    SubtractNotifier: TSubtractNotifyFunc;

    procedure OuterCycle(ActionProc: TCycleActionProc);
    procedure InnerCycle(ActionProc: TCycleActionProc);
    procedure ExecIntersect;
    procedure ExecSubtract;

  public
    constructor Create(
      PeriodIter1, PeriodIter2: TPeriodIter);

    procedure Intersect(Notifier: TIntersectNotifyFunc); overload;
    procedure IntersectCurrent(Notifier: TIntersectNotifyFunc); overload;
    procedure Subtract(Notifier: TSubtractNotifyFunc); overload;
    procedure SubtractCurrent(Notifier: TSubtractNotifyFunc); overload;
  end;

implementation

//------------------------------------------------------------------------------
constructor TSpanIter.Create(PeriodIter1, PeriodIter2: TPeriodIter);
begin
  inherited Create;
  Self.PeriodIter1 := PeriodIter1;
  Self.PeriodIter2 := PeriodIter2;
end;

//------------------------------------------------------------------------------
procedure TSpanIter.Intersect(Notifier: TIntersectNotifyFunc);
begin
  Self.IntersectNotifier := Notifier;
  OuterCycle(ExecIntersect);
end;

procedure TSpanIter.IntersectCurrent(Notifier: TIntersectNotifyFunc);
begin
  Self.IntersectNotifier := Notifier;
  InnerCycle(ExecIntersect);
end;

//------------------------------------------------------------------------------
procedure TSpanIter.Subtract(Notifier: TSubtractNotifyFunc);
begin
  Self.SubtractNotifier := Notifier;
  OuterCycle(ExecSubtract);
end;

//------------------------------------------------------------------------------
procedure TSpanIter.SubtractCurrent(Notifier: TSubtractNotifyFunc);
begin
  Self.SubtractNotifier := Notifier;
  InnerCycle(ExecSubtract);
end;

//------------------------------------------------------------------------------
procedure TSpanIter.OuterCycle(ActionProc: TCycleActionProc);
begin
  with PeriodIter1 do begin
    First;
    while not Eof do begin
      InnerCycle(ActionProc);
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TSpanIter.InnerCycle(ActionProc: TCycleActionProc);
begin
  with PeriodIter2 do begin
    First;
    while not Eof do begin
      ActionProc;
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TSpanIter.ExecIntersect;
var
  Period: TPeriod;
begin
  with DateUtils do begin
    Period := IntersectPeriods(PeriodIter1.CurItem, PeriodIter2.CurItem);
    
    if Assigned(IntersectNotifier) then
      IntersectNotifier(PeriodIter1, PeriodIter2, Period);
  end;
end;

//------------------------------------------------------------------------------
procedure TSpanIter.ExecSubtract;
var
  Periods: TPeriods;
begin
  SetLength(Periods, 0);
  with DateUtils do begin
    Periods :=
      DateUtils.SubtractPeriods(PeriodIter1.CurItem, PeriodIter2.CurItem);

    if Assigned(SubtractNotifier) then
      SubtractNotifier(PeriodIter1, PeriodIter2, Periods);
  end;
end;

end.
