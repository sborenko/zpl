unit IFaceProgressState;

interface

type
  IProgressState = interface
    procedure SetStagesTotal(ProcessName: ShortString; Total: integer);

    procedure SetStageStarted(Level: integer; StageName: ShortString;
      MaxValue: integer; StageIsTopLevel: boolean; Comment: string = '');
    procedure SetStageFinished(Level: integer; StageName: ShortString;
      StageIsTopLevel: boolean; Comment: string = '');
    procedure SetStageCanceled(Level: integer; StageName: ShortString;
      StageIsTopLevel: boolean; Comment: string = '');
    function StageIsCanceled: boolean;

    procedure ResetProgress(MaxValue: integer);
    procedure RestoreProgress(CurValue, MaxValue: integer);

    procedure UpdateStageProgress(Comment: string = ''); overload;
    procedure UpdateStageProgress(CurValue: integer;
      Comment: string = ''); overload;

    procedure WriteMessage(Level: integer; Message: string);
  end;

implementation

end.
