unit Appx4GrantsStage;

interface

uses
  TopLevelStage, IFaceProgressState;

type
  TAppx4GrantsStage = class(TTopLevelStage)
  private
    procedure DisplayProc(AppxName: ShortString;
      Year, Quarter, Month, CurrRow, RowsTotal, StepsTotal: integer;
      StepName, StepState: ShortString);
  public
    procedure Start(ProgressState: IProgressState); override;

    function StageName: ShortString; override;
    function StageItemsTotal: integer; override;

    procedure Process; override;
  end;

implementation

uses
  DateLib, DModAppx4Grants, Forms, ReportSpov, SysUtils;

//------------------------------------------------------------------------------
procedure TAppx4GrantsStage.Start(ProgressState: IProgressState);
begin
  // Appx4GrantStage specific actions ...

  inherited Start(ProgressState);
end;

//------------------------------------------------------------------------------
function TAppx4GrantsStage.StageName: ShortString;
begin
  Result := 'Формирование Приложения 4 "Стипендии".';
end;

//------------------------------------------------------------------------------
function TAppx4GrantsStage.StageItemsTotal: integer;
begin
  Result := 1;
end;

//------------------------------------------------------------------------------
procedure TAppx4GrantsStage.Process;
var
  RepMnth: TDateTime;
begin
  with SpovReport do begin
    RepMnth := EncodeDate(Year, Mnth, 1);

    with DateUtils do
      TDmAppx4Grant.Run(InitPeriod(RepMnth, EndOfMonth(RepMnth)),
        SpovReport.OutputPath, Appx4StpFileName, DisplayProc);
  end;

  inherited Process;
end;

//------------------------------------------------------------------------------
procedure TAppx4GrantsStage.DisplayProc(AppxName: ShortString;
  Year, Quarter, Month, CurrRow, RowsTotal, StepsTotal: integer;
  StepName, StepState: ShortString);
begin
  Application.ProcessMessages;
end;

end.
