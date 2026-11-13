program Df4Update;

uses
  Forms,
  FormMain in 'FormMain.pas' {Form1},
  DModMain in 'DModMain.pas' {DmMain: TDataModule},
  QryUtils in '..\LIB\QryUtils.pas',
  CustDateUtils in '..\LIB\CustDateUtils.pas',
  DebugUtils in '..\LIB\DebugUtils.pas',
  A_Const in '..\ZP\ES_CMN\A_Const.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDmMain, DmMain);
  Application.Run;
end.
