unit ProgressManager;

interface

type
  TProcessStartHandler = procedure of object;
  TProgressHandler = procedure of object;
  TProcessFinishHandler = procedure of object;

  procedure HandleProcessStart;
  procedure HandleProgress;
  procedure HandleProcessFinish;

implementation

procedure HandleProcessStart;
begin
end;

procedure HandleProgress;
begin
end;

procedure HandleProcessFinish;
begin
end;

end.
