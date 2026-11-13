program FixEsvEntpr;

uses
  Forms,
  QryLib in '..\..\..\..\..\Common\QryLib.pas',
  DsLib in '..\..\..\..\..\Common\DsLib.pas',
  DateLib in '..\..\..\..\..\Common\DateLib.pas',
  TextLib in '..\..\..\..\..\Common\TextLib.pas',
  FormMain in 'SRC\FormMain.pas' {FrmMain},
  DATABASENAME in 'SRC\DATABASENAME.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
