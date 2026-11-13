unit Appx4Stage;

interface

uses
  TopLevelStage, IFaceProgressState, Dm_D4_1DF;

type
  TAppx4Stage = class(TTopLevelStage)
  private
    ReportCurMnth: TDateTime;
    DmAppx4: TDmD41DF;

    Mnth: Integer;

    SubStepName, SubStepState: ShortString;

    procedure InitData;
    procedure FreeData;

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
  SysUtils, Forms, ReportSpov, DateLib, TblLib;

const
  // MNTH_COUNT = 3;
  // С 1.1.2025 - помесячно
  MNTH_COUNT = 1;

//------------------------------------------------------------------------------
procedure TAppx4Stage.InitData;
begin
  DmAppx4 := TDmD41DF.Create(nil);

  with SpovReport do
    // ReportCurMnth := EncodeDate(Year, DateUtils.FirstMnthOfQuart(Quart), 1);
    // С 1.1.2025 - помесячно
    ReportCurMnth := EncodeDate(Year, Mnth, 1);

  Mnth := 0;
  SubStepName := '';
  SubStepState := '';
end;

//------------------------------------------------------------------------------
procedure TAppx4Stage.FreeData;
begin
  DmAppx4.Free;
end;

//------------------------------------------------------------------------------
procedure TAppx4Stage.Start(ProgressState: IProgressState);
begin
  InitData;
  inherited Start(ProgressState);
  FreeData;
end;

//------------------------------------------------------------------------------
function TAppx4Stage.StageName: ShortString;
begin
  Result := 'Формирование Приложения 4.';
end;

//------------------------------------------------------------------------------
function TAppx4Stage.StageItemsTotal: integer;
begin
  Result := MNTH_COUNT;
end;

//------------------------------------------------------------------------------
procedure TAppx4Stage.Process;
var
  ReportPeriod: TPeriod;
begin
  // Чтобы обработать только один месяц, добавляем условие:
  // IF CurStageIndx = <МЕСЯЦ> THEN // Значение месяца: от 0 до 2.
  // IF CurStageIndx = 0 THEN
  with DateUtils do begin
    ReportPeriod := InitPeriod(ReportCurMnth, EndOfMonth(ReportCurMnth));

    with SpovReport do
      DmAppx4.Run(ReportPeriod.Start, ReportPeriod.Finish,
        SpovReport.OutputPath, Appx4FileName, EmplIds, DisplayProc);

    ReportCurMnth := NextMonth(ReportCurMnth);
  end;

  inherited Process;
end;

//------------------------------------------------------------------------------
procedure TAppx4Stage.DisplayProc(AppxName: ShortString;
  Year, Quarter, Month, CurrRow, RowsTotal, StepsTotal: integer;
  StepName, StepState: ShortString);
begin
  if Month <> Mnth then begin
    if Mnth <> 0 then
      ProgressState.WriteMessage(
        Level + 1, 'Окончание месяца ' + IntToStr(Mnth));

    Mnth := Month;
    SubStepName := '';
    SubStepState := '';
    ProgressState.WriteMessage(Level + 1, 'Начало месяца ' +
      // С 1.1.2025 - помесячно
      // IntToStr(Mnth));
      // Здесь использовался месяц квартала
      // Поскольку теперь логичнее выводить месяц года, то пересчитаем:
      IntToStr(Quarter * 1 + Mnth - 1));
  end;

  if StepName <> SubStepName then begin
    if SubStepName <> '' then
      ProgressState.WriteMessage(Level + 2, 'Окончание этапа ' + SubStepName);

    SubStepName := StepName;
    SubStepState := '';
    ProgressState.WriteMessage(Level + 2, 'Начало этапа ' + SubStepName);
  end;

  Application.ProcessMessages;
end;

end.
