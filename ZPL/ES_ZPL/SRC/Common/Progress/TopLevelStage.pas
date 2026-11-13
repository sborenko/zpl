unit TopLevelStage;

interface

uses
  ProgressStage;

type
  TTopLevelStage = class(TProgressStage)
  public
    procedure SetStateStarted; override;
    procedure SetStateFinished; override;
    procedure SetStateCanceled; override;
  end;

implementation

//------------------------------------------------------------------------------
procedure TTopLevelStage.SetStateStarted;
begin
  ProgressState.SetStageStarted(Level, StageName, StageItemsTotal, true);
end;

//------------------------------------------------------------------------------
procedure TTopLevelStage.SetStateFinished;
begin
  ProgressState.SetStageFinished(Level, StageName, true);
end;

//------------------------------------------------------------------------------
procedure TTopLevelStage.SetStateCanceled;
begin
  ProgressState.SetStageCanceled(Level, StageName, true);
end;

end.
