unit PeriodStage;

interface

uses
  ProgressStage, IFaceProgressState, DateLib;

type
  TPeriodStage = class(TProgressStage)
  protected
    ReportPeriod: TPeriod;
  public
    procedure Init(ReportPeriod: TPeriod); virtual;
  end;

implementation

//------------------------------------------------------------------------------
procedure TPeriodStage.Init(ReportPeriod: TPeriod);
begin
  Self.ReportPeriod := ReportPeriod;
end;

end.
