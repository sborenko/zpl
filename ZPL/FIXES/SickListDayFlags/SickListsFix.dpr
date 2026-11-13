program SickListsFix;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  DbTables,
  QryLib in '..\..\..\Common\QryLib.pas',
  DateLib in '..\..\..\Common\DateLib.pas',
  DebugLib in '..\..\..\Common\DebugLib.pas',
  DsLib in '..\..\..\Common\DsLib.pas',
  TextLib in '..\..\..\Common\TextLib.pas',
  LogLib in '..\..\..\Common\LogLib.pas',
  DModMain in 'DModMain.pas' {DmMain: TDataModule};

begin
  with TDmMain.Create(nil) do
    Free;
end.

