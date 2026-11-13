unit FormLogin;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, DB, Dialogs, ExtCtrls, IniFiles, DBTables;

type
  TFrmLogin = class(TForm)
    Label1: TLabel;
    EdtLogin: TEdit;
    LblPwd: TLabel;
    EdtPwd: TEdit;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Bevel1: TBevel;
    Image2: TImage;
    ChBoxSaveLogin: TCheckBox;
    LblPwd2: TLabel;
    EdtPwd2: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditEnter(Sender: TObject);
    procedure EdtLoginExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtLoginChange(Sender: TObject);

  private
    AppName: ShortString;
    LastLogin : ShortString;
    cDirExe: string;

    FormOriginHeight: integer;
    PwdReset: boolean;

    InputIsAllowed: boolean;
    NotificationEnabled: boolean;

    procedure UpdateDlgStatus;
    procedure CheckInputAllowed;
    function CheckPwd: boolean;
    procedure DoLogin;

    procedure SetHints;

  public
    class function Show(
      cApplication: ShortString): boolean;
  end;

const
  SECTION = 'a_Ch2Psw';
  INI_FILE_NAME = 'MyIni.ini';

var
  FrmLogin: TFrmLogin;

implementation

uses
  AppSettings, AppUtils, DModLogin;

const
  ACCESS_DENIED    = 'Доступ запрещён.';
  NO_ACCESS_TO_APP = 'Нет доступа к приложению';
  CALL_ADMIN       = 'Обратитесь к администратору.';

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFrmLogin.Show(cApplication: ShortString): boolean;
begin
  FrmLogin := TFrmLogin.Create(Application);

  with FrmLogin do begin
    AppName := cApplication;

    Result := ShowModal = mrOk;

    if Result then begin
      DataLogin.PrepareGlobalData(EdtLogin.Text);
    end;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  DataLogin := TDataLogin.Create(Self);

  with TIniFile.Create(cDirExe + INI_FILE_NAME) do begin
    ChBoxSaveLogin.Checked := ReadBool(SECTION, 'bSvNmUsr', false);
    LastLogin := ReadString(SECTION, 'NmUser', '');
    Free;
  end;

  NotificationEnabled := true;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.FormShow(Sender: TObject);
begin
  FormOriginHeight := Height;

  if ChBoxSaveLogin.Checked then begin
    EdtLogin.Text := LastLogin;
    if EdtLogin.Text <> '' then
      ActiveControl := EdtPwd
    else
      ActiveControl := EdtLogin;
  end else begin
    EdtLogin.Text := '';
    EdtLogin.SetFocus;
  end;

  UpdateDlgStatus;
  SetHints;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.CheckInputAllowed;
begin
  with DataLogin do
    InputIsAllowed := not LoginExists or LoginIsActive or (UserCurrentPwd <> '');

  EdtPwd.Enabled := InputIsAllowed;
  EdtPwd2.Enabled := InputIsAllowed;
  BtnOk.Enabled := InputIsAllowed;

  if InputIsAllowed then begin
    EdtPwd.Color := clWindow;
    EdtPwd2.Color := clWindow;
  end else begin
    EdtPwd.Color := clBtnFace;
    EdtPwd2.Color := clBtnFace;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.UpdateDlgStatus;
begin
  DataLogin.OpenLoginQry(EdtLogin.Text);
  CheckInputAllowed();

  with DataLogin do
    PwdReset := LoginExists and LoginIsActive and (UserCurrentPwd = '');

  if PwdReset then
    Caption := 'Регистрация'
  else
    Caption := 'Вход';

  LblPwd2.Visible := PwdReset;
  EdtPwd2.Visible := PwdReset;

  if PwdReset then
    Height := FormOriginHeight
  else
    FrmLogin.Height := FormOriginHeight - 23;

  if not InputIsAllowed and NotificationEnabled then begin
    ShowMessage(ACCESS_DENIED + ' ' + CALL_ADMIN);
    NotificationEnabled := false;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if CheckPwd then begin
        if not DataLogin.LoginIsActive then begin
          ShowMessage(ACCESS_DENIED + ' ' + CALL_ADMIN);
          CanClose := false;

        end else if not DataLogin.AppIsAvailable(AppName) then begin
          ShowMessage(NO_ACCESS_TO_APP + '. ' + CALL_ADMIN);
          CanClose := false;

        end else begin
          DoLogin;
        end;
    end else
      CanClose := false;
  end;
end;

//------------------------------------------------------------------------------
function TFrmLogin.CheckPwd: boolean;
var
  Pwd: ShortString;
begin
  Pwd := Trim(EdtPwd.Text);

  if PwdReset then
    Result := (Pwd <> '') and (Trim(EdtPwd2.Text) = Pwd)
  else
    Result := DataLogin.CheckPwd(Pwd);
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.DoLogin;
begin
  AppSetts.UserId := DataLogin.GetUserId;

  if PwdReset then
    DataLogin.UpdatePwd(AppSetts.UserId, Trim(EdtLogin.Text), Trim(EdtPwd.Text));

  with TIniFile.Create(cDirExe + INI_FILE_NAME) do begin
    WriteBool(SECTION, 'bSvNmUsr', ChBoxSaveLogin.Checked);
    WriteString(SECTION, 'NmUser', EdtLogin.Text);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.EditEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.EditExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.EdtLoginExit(Sender: TObject);
begin
  EditExit(Sender);
  UpdateDlgStatus;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.SetHints;
begin
  EdtPwd.Hint := TAppUtils.KeyboardLayout.CyrAbbr + '; ';

  if TAppUtils.KeyCapsState = CapsOn then
    EdtPwd.Hint := EdtPwd.Hint + 'Загл.'
  else
    EdtPwd.Hint := EdtPwd.Hint + 'Стр.';

  EdtPwd2.Hint := EdtPwd.Hint;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.EdtLoginChange(Sender: TObject);
begin
  NotificationEnabled := true;
end;

//------------------------------------------------------------------------------
procedure TFrmLogin.EditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SetHints;
end;

end.

