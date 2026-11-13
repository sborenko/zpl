unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DModMain, ExtCtrls, ComCtrls;

type
  TFrmMain = class(TForm)
    PnlAdmin: TPanel;
    GrpBoxScope: TGroupBox;
    RadioAllEmpl: TRadioButton;
    RadioEmplId: TRadioButton;
    EdtEmplId: TEdit;
    LblZipPath: TLabel;
    EdtZipPath: TEdit;
    BtnZipPath: TBitBtn;
    LblWarPath: TLabel;
    EdtWarPath: TEdit;
    BtnWarPath: TBitBtn;
    GrpSteps: TGroupBox;
    ChBoxBackup: TCheckBox;
    ChBoxUnzip: TCheckBox;
    ChBoxPrepare: TCheckBox;
    PnlUser: TPanel;
    LblDate: TLabel;
    DatePicker: TDateTimePicker;
    MemInfo: TMemo;
    PnlButtons: TPanel;
    BtnRun: TBitBtn;
    BtnExit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioSelectEmplClick(Sender: TObject);
    procedure EdtPathExit(Sender: TObject);
    procedure BtnPathClick(Sender: TObject);
    procedure BtnRunClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
  private
    RanAsAdmin: Boolean;

    procedure CheckAllEmpl;
    procedure CheckEmplId;
    procedure ToggleEdtEmplId(Value: Boolean);

    procedure ShowProgress(Level: Integer; Msg: ShortString;
      NewLine: Boolean = true);
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  AppCmn, FormLib, IniFiles, DateLib, PathLib, TextLib;

const
  IniFileName = 'PrepareSuspend.ini';
  SectionName = 'FormMain';

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TFrmMain.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
begin
  // Режим администратора
  RanAsAdmin := LowerCase(ParamStr(1)) = 'admin';
  PnlAdmin.Visible := RanAsAdmin;

  IniFile := TIniFile.Create(PathUtils.GetExePath + IniFileName);

  with IniFile do begin
    FormUtils.ReadIniFile(Self, IniFile, SectionName);

    // Сотрудники
    if ReadBool(SectionName, 'AllEmpl', true) then
      CheckAllEmpl
    else
      CheckEmplId;
    EdtEmplId.Text := ReadString(SectionName, 'EmplId', '');

    // Каталоги
    EdtZipPath.Text := ReadString(SectionName, 'ZipPath',
      // Backup'ы основной базы данных
      '\\S1B\(D) Disk_D\OPI_S0_Bkp_01\');
    EdtWarPath.Text := ReadString(SectionName, 'WarPath',
      // Рабочая папка зарплаты "Война"
      '\\S0B\D\BUH_WAR\');

    // Шаги
    ChBoxBackup.Checked := ReadBool(SectionName, 'RunBackup', true);
    ChBoxUnzip.Checked := ReadBool(SectionName, 'RunUnzip', true);
    ChBoxPrepare.Checked := ReadBool(SectionName, 'RunPrepare', true);

    Free;
  end;

  ActiveControl := BtnRun;
end;

//------------------------------------------------------------------------------
procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(PathUtils.GetExePath + IniFileName);

  with IniFile do begin
    FormUtils.WriteIniFile(Self, IniFile, SectionName);

    // Сотрудники
    WriteBool(SectionName, 'AllEmpl', RadioAllEmpl.Checked);
    WriteString(SectionName, 'EmplId', EdtEmplId.Text);

    // Каталоги
    WriteString(SectionName, 'ZipPath', EdtZipPath.Text);
    WriteString(SectionName, 'WarPath', EdtWarPath.Text);

    // Шаги
    WriteBool(SectionName, 'RunBackup', ChBoxBackup.Checked);
    WriteBool(SectionName, 'RunUnzip', ChBoxUnzip.Checked);
    WriteBool(SectionName, 'RunPrepare', ChBoxPrepare.Checked);

    Free;
  end;
end;

//------------------------------------------------------------------------------
// Запуск обработки
//------------------------------------------------------------------------------
procedure TFrmMain.BtnRunClick(Sender: TObject);
var
  Date: TDate;
  EmplId: ShortString;
  Steps: StepSet;
begin
  BtnRun.Enabled := false;

  with DateUtils do begin
    Date := Decode(DatePicker.Date);
    Date.Day := 1;

    // Сотрудники
    if RadioAllEmpl.Checked or not RanAsAdmin then
      EmplId := ''
    else
      EmplId := EdtEmplId.Text;

    // Шаги для выполнения
    Steps := [];
    if ChBoxBackup.Checked or not RanAsAdmin then
      Steps := Steps + [StepBackupWar];
    if ChBoxUnzip.Checked or not RanAsAdmin then
      Steps := Steps + [StepUnpackZip];
    if ChBoxPrepare.Checked or not RanAsAdmin then
      Steps := Steps + [StepPrepSuspEmpls];

    try
      // Запуск подготовки "приостановленных сотрудников"
      with PathUtils do
      if TDmMain.Run(Encode(Date), EmplId,
        EndWithSlash(EdtZipPath.Text), EndWithSlash(EdtWarPath.Text),
        Steps, ShowProgress)
      then
        ActiveControl := BtnExit;
    except
    end;

    BtnRun.Enabled := true;
  end;
end;

//------------------------------------------------------------------------------
// Индикация прогресса. Callback
//------------------------------------------------------------------------------
procedure TFrmMain.ShowProgress(
  Level: Integer;
  Msg: ShortString;
  NewLine: Boolean = true);
begin
  Msg := TextUtils.PadLeft(Msg, ' ', Length(Msg) + Level * 3);

  with MemInfo, Lines do
    if NewLine then
      Add(Msg)
    else
      Lines[Count - 1] := Msg;
end;

//------------------------------------------------------------------------------
// Выбор каталогов
//------------------------------------------------------------------------------
procedure TFrmMain.BtnPathClick(Sender: TObject);
var
  Edit: TEdit;
  Path: String;
  BrowseTitle: ShortString;
begin
  if Sender = BtnZipPath then begin
    Edit := EdtZipPath;
    BrowseTitle := 'Выбор папки с архивами БД';
  end else begin
    Edit := EdtWarPath;
    BrowseTitle := 'Выбор папки БД "Война"';
  end;

  // Path := PathUtils.SelectFolder(Edit.Text);
  Path := PathUtils.BrowseForFolder(BrowseTitle, Edit.Text);

  if Path <> '' then
    Edit.Text := Path;
end;

//------------------------------------------------------------------------------
// Выбор сотрудников
//------------------------------------------------------------------------------
procedure TFrmMain.RadioSelectEmplClick(Sender: TObject);
begin
  if Sender = RadioAllEmpl then
    ToggleEdtEmplId(false)
  else
    ToggleEdtEmplId(true);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmMain.CheckAllEmpl;
begin
  RadioAllEmpl.Checked := true;
  ToggleEdtEmplId(false);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmMain.CheckEmplId;
begin
  RadioEmplId.Checked := true;
  ToggleEdtEmplId(true);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmMain.ToggleEdtEmplId(Value: Boolean);
begin
  with EdtEmplId do begin
    Enabled := Value;

    if Enabled then
      Color := clWindow
    else
      Color := clBtnFace;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmMain.EdtPathExit(Sender: TObject);
var
  Path: ShortString;
begin
  Path := (Sender as TEdit).Text;

  if not DirectoryExists(Path) then
    ShowMessage('Папка ' + Path + ' не существует.');
end;

//------------------------------------------------------------------------------
procedure TFrmMain.BtnExitClick(Sender: TObject);
begin
  with DmMain do
  if Running then
    Cancel
  else
    Close;
end;

end.
