program PrepareSuspend;

uses
  Forms,
  AppCmn in 'Src\AppCmn.pas',
  DATABASENAME in '..\War_Zpl\Src\DATABASENAME.pas',
  DModMain in 'Src\DModMain.pas' {DmMain: TDataModule},
  FileOper in 'Src\FileOper.pas',
  FormMain in 'Src\FormMain.pas' {FrmMain},
  MonthEmplList in 'Src\MonthEmplList.pas',
  A_Const in '..\..\Zpl\Es_Zpl\Src\Es_Cmn\A_Const.pas',
  A_Lib in '..\..\Zpl\Es_Zpl\Src\Es_Cmn\A_Lib.pas',
  NumUtils in '..\..\Zpl\Es_Zpl\Src\Es_Cmn\Utils\NumUtils.pas',
  DsLib in '..\..\..\..\Common\DsLib.pas',
  QryLib in '..\..\..\..\Common\QryLib.pas',
  CdsLib in '..\..\..\..\Common\CdsLib.pas',
  DateLib in '..\..\..\..\Common\DateLib.pas',
  DebugLib in '..\..\..\..\Common\DebugLib.pas',
  TextLib in '..\..\..\..\Common\TextLib.pas',
  PathLib in '..\..\..\..\Common\PathLib.pas',
  FileLib in '..\..\..\..\Common\FileLib.pas',
  ZipLib in '..\..\..\..\Common\ZipLib.pas',
  FormLib in '..\..\..\..\Common\FormLib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
