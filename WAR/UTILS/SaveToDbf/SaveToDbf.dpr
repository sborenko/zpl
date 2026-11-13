program SaveToDbf;

uses
  Forms,
  FormMain in 'FormMain.pas' {Form1},
  DsLib in '..\..\Common\DsLib.pas',
  DateLib in '..\..\Common\DateLib.pas',
  DebugLib in '..\..\Common\DebugLib.pas',
  PathLib in '..\..\Common\PathLib.pas',
  TextLib in '..\..\Common\TextLib.pas',
  QryLib in '..\..\Common\QryLib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
