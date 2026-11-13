unit UsrSelf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DBCtrls, DB, Mask, DBTables;

type
  TFrmUsrSelf = class(TForm)
    bBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    DBEPwd: TDBEdit;
    Label5: TLabel;
    DBENotes: TDBEdit;
    QryUsr: TQuery;
    DSrcUsr: TDataSource;
    UpdSQLUsr: TUpdateSQL;
    DBEUserId: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeNmUsrEnter(Sender: TObject);
    procedure dbeNmUsrExit(Sender: TObject);
  private
    function CheckVvod : boolean;
  public
    class procedure Run(UserId: integer);
  end;

const SECTION = 'a_EUsrs';

var
  FrmUsrSelf: TFrmUsrSelf;

implementation

uses a_Const, A_ShwErr, a_ShKSps, a_EUsrs, QryUtils;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmUsrSelf.Run(UserId: integer);
begin
  FrmUsrSelf := TFrmUsrSelf.Create(Application);

  with FrmUsrSelf do begin
    TQryUtils.InitQuery(QryUsr);
    with QryUsr do begin
      SQL.Add(
        'select KdUsr, NmUsr, PswUsr, Notes ' +
        'from Usrs ' +
        'where KdUsr = :KdUsr');
      ParamByName('KdUsr').AsInteger := UserId;
      Open;
    end;

    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmUsrSelf.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmUsrSelf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if CheckVvod then
      with QryUsr do begin
        ApplyUpdates;
        CommitUpdates;
      end
    else begin
      ModalResult := mrNone;
      CanClose := false;
      DBEUserId.SetFocus;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmUsrSelf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

//------------------------------------------------------------------------------
function TFrmUsrSelf.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;

  mListErr := TStringList.Create;
  mListErr.Clear;

  if (DBEUserId.Text = '') then
    mListErr.Add('Не введен пользователь');

  if (DBEPwd.Text = '') then
    mListErr.Add('Не введен пароль');

  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;

  mListErr.Destroy;
end;

//------------------------------------------------------------------------------
procedure TFrmUsrSelf.dbeNmUsrEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFrmUsrSelf.dbeNmUsrExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
