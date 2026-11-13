unit FormChngPwd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, DModUser;

type
  TFrmChngPwd = class(TForm)
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    LblUser: TLabel;
    EdtLogin: TEdit;
    Panel1: TPanel;
    LblNewPwd: TLabel;
    LblNewPwd2: TLabel;
    LblShowPwd: TLabel;
    EdtNewPwd: TEdit;
    EdtNewPwd2: TEdit;
    ChBoxShowPwd: TCheckBox;
    QryUPI: TQuery;
    LblPerson: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EdtNewPwdChange(Sender: TObject);
    procedure EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChBoxShowPwdClick(Sender: TObject);
  private
    {DMdUser: TDMdUser;}
    Notification: ShortString;

    procedure ApplyPwdVisibility;
    procedure PrepareNotification(SelfUpdResult: TSelfUpdResult);
  public
    class function Show(UserId: integer): boolean;
  end;

var
  FrmChngPwd: TFrmChngPwd;

implementation

uses
  A_Const, QryUtils, FormResetPwd;

{$R *.dfm}

//-----------------------------------------------------------------------------
class function TFrmChngPwd.Show(UserId: integer): boolean;
begin
  FrmChngPwd := TFrmChngPwd.Create(Application);
  {FrmChngPwd.}DMdUser := TDMdUser.CreateDMod(FrmResetPwd, UserId);

  with FrmChngPwd do begin
    Notification := '';
    Result := ShowModal = mrOk;

    if Notification <> '' then
      ShowMessage(Notification);

    Free;
  end; {with}
end;

procedure TFrmChngPwd.FormShow(Sender: TObject);
begin
  with DMdUser do begin
    EdtLogin.Text := Login;
    EdtNewPwd.SetFocus;

      if TQryUtils.PeekUPI(QryUPI, DMdUser.TabN) then
        with QryUPI do
          LblPerson.Caption := FieldByName('Fam').AsString
            + ' ' + FieldByName('Ima').AsString
            + ' ' + FieldByName('Otch').AsString;
    end; {with}

  ApplyPwdVisibility;
end;

//-----------------------------------------------------------------------------
procedure TFrmChngPwd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  SelfUpdResult: TSelfUpdResult;
begin
  if ModalResult = mrOk then
    if EdtNewPwd2.Text <> EdtNewPwd.Text then begin
      ShowMessage('¬ведЄнные значени€ парол€ не совпадают.');
      CanClose := false;
    end else begin
      SelfUpdResult := DMdUser.SelfUpdate(Trim(EdtLogin.Text), Trim(EdtNewPwd.Text));

      PrepareNotification(SelfUpdResult);
    end;
end;

//-----------------------------------------------------------------------------
procedure TFrmChngPwd.ApplyPwdVisibility;
begin
  if ChBoxShowPwd.Checked then begin
    EdtNewPwd.PasswordChar := #0;
    EdtNewPwd2.PasswordChar := #0;

    EdtNewPwd2.Text := EdtNewPwd.Text;
  end else begin
    EdtNewPwd.PasswordChar := '*';
    EdtNewPwd2.PasswordChar := '*';
  end;

  EdtNewPwd2.Enabled := not ChBoxShowPwd.Checked;
end;

//-----------------------------------------------------------------------------
procedure TFrmChngPwd.EditEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;

//-----------------------------------------------------------------------------
procedure TFrmChngPwd.EditExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

//-----------------------------------------------------------------------------
procedure TFrmChngPwd.EdtNewPwdChange(Sender: TObject);
begin
  if ChBoxShowPwd.Checked then
    EdtNewPwd2.Text := EdtNewPwd.Text;
end;

//-----------------------------------------------------------------------------
procedure TFrmChngPwd.EditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BtnOk.Click
  else if Key = VK_ESCAPE then
    Close;
end;

//-----------------------------------------------------------------------------
procedure TFrmChngPwd.ChBoxShowPwdClick(Sender: TObject);
begin
  ApplyPwdVisibility;
end;

//-----------------------------------------------------------------------------
procedure TFrmChngPwd.PrepareNotification(SelfUpdResult: TSelfUpdResult);
var
  FirstLetter, OtherLetters: ShortString;
begin
  Notification := '';

  if not (SelfUpdResult.LoginChanged or SelfUpdResult.PwdChanged) then begin
    Notification := 'Ћогин и пароль не измен€лись.';
    exit;
  end;

  if SelfUpdResult.LoginChanged then
    Notification := 'логин ';

  if SelfUpdResult.PwdChanged then begin
    if Notification <> '' then
      Notification := Notification + 'и ';

    Notification := Notification + 'пароль ';
  end;

  if SelfUpdResult.LoginChanged and SelfUpdResult.PwdChanged then
    Notification := Notification + 'изменены.'
  else
    Notification := Notification + 'изменЄн.';

  FirstLetter := AnsiUpperCase(Copy(Notification, 1, 1));
  OtherLetters := Copy(Notification, 2, Length(Notification) - 1);
  Notification := FirstLetter + OtherLetters;
end;

end.
