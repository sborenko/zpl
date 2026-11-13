program Df4Update;

uses
  Forms,
  FormMain in 'FormMain.pas' {Form1},
  DModMain in 'DModMain.pas' {DmMain: TDataModule},
  A_Const in 'A_Const.pas',
  DateLib in 'Common\DateLib.pas',
  QryLib in 'Common\QryLib.pas',
  DebugLib in 'Common\DebugLib.pas',
  DsLib in 'Common\DsLib.pas',
  DATABASENAME in 'Common\DATABASENAME.pas',
  TextLib in 'Common\TextLib.pas',
  CdsLib in 'Common\CdsLib.pas',
  PathLib in 'Common\PathLib.pas',
  TblLib in 'Common\TblLib.pas',
  LogLib in 'Common\LogLib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
