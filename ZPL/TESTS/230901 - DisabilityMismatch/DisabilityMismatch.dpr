program DisabilityMismatch;

uses
  Forms,
  FormMain in 'FormMain.pas' {FrmMain},
  DModMain in 'DModMain.pas' {DmMain: TDataModule},
  DateLib in '..\..\..\..\Common\DateLib.pas',
  DebugLib in '..\..\..\..\Common\DebugLib.pas',
  QryLib in '..\..\..\..\Common\QryLib.pas',
  DsLib in '..\..\..\..\Common\DsLib.pas',
  SpanLib in '..\..\..\..\Common\SpanLib.pas',
  TextLib in '..\..\..\..\Common\TextLib.pas',
  FormProgress in '..\..\..\..\Common\Progress\FormProgress.pas' {FrmProgress},
  IFaceProgress in '..\..\..\..\Common\Progress\IFaceProgress.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDmMain, DmMain);
  Application.CreateForm(TFrmProgress, FrmProgress);
  Application.Run;
end.
