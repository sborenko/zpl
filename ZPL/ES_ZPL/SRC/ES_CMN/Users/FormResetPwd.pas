unit FormResetPwd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, DModUser;

type
  TFrmResetPwd = class(TForm)
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    LblUser: TLabel;
    LblLogin: TLabel;
    LblEmpl: TLabel;
    PanelAccess: TPanel;
    ChBoxActive: TCheckBox;
    ChBoxResetPwd: TCheckBox;
    QryUPI: TQuery;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    {DMdUser: TDMdUser;}
    Notification: ShortString;
  public
    class function Show(UserId: integer): boolean;
  end;

var
  FrmResetPwd: TFrmResetPwd;

implementation

uses
  A_Const, QryUtils, NameUtils;

{$R *.dfm}

//-----------------------------------------------------------------------------
class function TFrmResetPwd.Show(UserId: integer): boolean;
begin
  FrmResetPwd := TFrmResetPwd.Create(Application);
  {FrmResetPwd.}DMdUser := TDMdUser.CreateDMod(FrmResetPwd, UserId);

  with FrmResetPwd do begin
    Notification := '';
    Result := ShowModal = mrOk;

    if Notification <> '' then
      ShowMessage(Notification);

    Free;
  end; {with}
end;

procedure TFrmResetPwd.FormShow(Sender: TObject);
begin
  with DMdUser do begin
    LblLogin.Caption := Login;

    with QryUPI do
      if TQryUtils.PeekUPI(QryUPI, TabN) then begin
        LblEmpl.Caption := FieldByName('Fam').AsString + ' ' +
          TNameUtils.FirstInitial(FieldByName('Ima').AsString) +
          TNameUtils.Initial(FieldByName('Otch').AsString);
      end; {if}

    ChBoxActive.Checked := UserIsActive;
    ChBoxActive.SetFocus;
  end; {with}
end;

//-----------------------------------------------------------------------------
procedure TFrmResetPwd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  AdminUpdResult: TAdminUpdResult;
begin
  if ModalResult = mrOk then
    AdminUpdResult := DMdUser.AdminUpdate(ChBoxActive.Checked, ChBoxResetPwd.Checked);
end;

end.
