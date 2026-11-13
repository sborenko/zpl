unit CustThread;

interface

uses
  Classes;

type
  TBasePayload = class;

  THandler = procedure of object;

  TCustThread = class(TThread)
  private
    Payload: TBasePayload;
  protected
    procedure Execute; override;
  public
    class function Run(Param: TBasePayload): TCustThread;
  end;

  TBasePayload = class
  private
    Thread: TCustThread;
  protected
    Handler: THandler;
  public
    constructor Create(Param: THandler); virtual;
    procedure SetThread(Param: TCustThread);
    procedure Run;
  end;

implementation

//--------------------------------------------------------------------------------------------------
class function TCustThread.Run(Param: TBasePayload): TCustThread;
begin
  Result := TCustThread.Create(true);

  // При приоритетах выше tpNormal окно не получает управления вообще.
  // При Idle'е задержек с отрисовкой и управлением окном не видно.
  Result.Priority := tpIdle;

  Result.Payload := Param;
end;

//--------------------------------------------------------------------------------------------------
procedure TCustThread.Execute;
begin
  with Payload do begin
    SetThread(Self);
    Run;
    Free;
  end;
end;

//--------------------------------------------------------------------------------------------------
constructor TBasePayload.Create(Param: THandler);
begin
  Handler := Param;
end;

//--------------------------------------------------------------------------------------------------
procedure TBasePayload.SetThread(Param: TCustThread);
begin
  Thread := Param;
end;

//--------------------------------------------------------------------------------------------------
procedure TBasePayload.Run;
begin
  while true do begin
    with Thread do begin
      if Terminated then
        exit;

      Payload.Handler;
    end;
  end;
end;

end.

