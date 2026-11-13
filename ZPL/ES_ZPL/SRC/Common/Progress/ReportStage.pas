//
// СПОВ - система персоніфікованого обліку відомостей
//

unit ReportStage;

interface

uses
  ProgressStage, IFaceProgressState, DateLib;

type
  TAppx = (Appx5, Appx1And6, Appx4, Appx4Grants);
  TAppxSet = array of TAppx;

  TReportStage = class(TProgressStage)
  public
    // Реализация IProgressProcess:
    procedure Start(ProgressState: IProgressState); override;
    function StageName: ShortString; override;
    function StageItemsTotal: integer; override;
    procedure DoWhatYouNeed; override;
  end;

implementation

uses
  DModSpov, Appx5Stage, Appx1And6Stage, Appx4Stage, Appx4GrantsStage;

//------------------------------------------------------------------------------
procedure TReportStage.Start(ProgressState: IProgressState);
begin
  // Инициируем состояние этапа.
  ProgressState.SetStagesTotal(StageName, StageItemsTotal);

  inherited Start(ProgressState);

  if not ProgressState.StageIsCanceled then
    ProgressState.WriteMessage(Level,
      'Путь к результирующим файлам: ' + DmSpov.OutputPath);
end;

//------------------------------------------------------------------------------
function TReportStage.StageName: ShortString;
begin
  Result := 'Формирование DBF-файлов для СПОВ';
end;

//------------------------------------------------------------------------------
function TReportStage.StageItemsTotal: integer;
begin
  Result := Length(DmSpov.AppxSet);
end;

//------------------------------------------------------------------------------
procedure TReportStage.DoWhatYouNeed;
var
  Stage: TProgressStage;
begin
  case DmSpov.AppxSet[CurStageItem] of
    Appx5:
      Stage := TAppx5Stage.Create(Self);
    Appx1And6:
      Stage := TAppx1And6Stage.Create(Self);
    Appx4:
      Stage := TAppx4Stage.Create(Self);
    else
      Stage := TAppx4GrantsStage.Create(Self);
  end;

  Stage.Start(ProgressState);
  Stage.Free;

  inherited DoWhatYouNeed;
end;

end.
