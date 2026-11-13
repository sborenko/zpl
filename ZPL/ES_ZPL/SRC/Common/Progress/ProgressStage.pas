unit ProgressStage;

interface

uses
  Classes, IFaceProgressState;

type
  TProgressStage = class
  protected
    Parent: TProgressStage;
    Level: integer;
    _StageName: ShortString;
    CurStageIndx: integer;

    ProgressState: IProgressState;

    procedure Execute; virtual;
    procedure RestoreParentState;
  public
    constructor Create(Parent: TProgressStage);
    procedure Start(ProgressState: IProgressState); virtual;

    function StageName: ShortString; virtual;
    function StageItemsTotal: integer; virtual; abstract;

    function KeepProcess: Boolean; virtual;

    procedure Process; virtual;
    procedure SetStateStarted; virtual;
    procedure SetStateFinished; virtual;
    procedure SetStateCanceled; virtual;
  end;

implementation

uses
  TextLib;

//------------------------------------------------------------------------------
constructor TProgressStage.Create(Parent: TProgressStage);
begin
  Self.Parent := Parent;

  if Parent = nil then
    Level := 0
  else
    Level := Parent.Level + 1;
end;

//------------------------------------------------------------------------------
procedure TProgressStage.Start(ProgressState: IProgressState);
begin
  Self.ProgressState := ProgressState;

  CurStageIndx := 0;
  SetStateStarted;

  Execute;

  if ProgressState.StageIsCanceled then
    SetStateCanceled
  else
    SetStateFinished;

  RestoreParentState;
end;

//------------------------------------------------------------------------------
function TProgressStage.StageName: ShortString;
begin
  Result := _StageName;

  if Parent <> nil then
    Result := TextUtils.ConcatStr(Parent.StageName, Result, ' ');
end;

//------------------------------------------------------------------------------
procedure TProgressStage.Execute;
begin
  with ProgressState do 
    while KeepProcess do begin
      if StageIsCanceled then
        exit;

      Process;

      // Этот Cancel мог сделать и DoWhatYouNeed,
      // если его логика это предусматривает.
      if StageIsCanceled then
        exit;

      UpdateStageProgress(CurStageIndx);
    end;
end;

//------------------------------------------------------------------------------
function TProgressStage.KeepProcess: Boolean;
begin
  Result := CurStageIndx < StageItemsTotal;
end;

//------------------------------------------------------------------------------
procedure TProgressStage.Process;
begin
  Inc(CurStageIndx);
end;

//------------------------------------------------------------------------------
procedure TProgressStage.SetStateStarted;
begin
  ProgressState.SetStageStarted(Level, StageName, StageItemsTotal, false);
end;

//------------------------------------------------------------------------------
procedure TProgressStage.SetStateFinished;
begin
  ProgressState.SetStageFinished(Level, StageName, false);
end;

//------------------------------------------------------------------------------
procedure TProgressStage.SetStateCanceled;
begin
  ProgressState.SetStageCanceled(Level, StageName, false);
end;

//------------------------------------------------------------------------------
procedure TProgressStage.RestoreParentState;
begin
  if Parent <> nil then
    with Parent do
      ProgressState.RestoreProgress(CurStageIndx, StageItemsTotal)
end;

end.
