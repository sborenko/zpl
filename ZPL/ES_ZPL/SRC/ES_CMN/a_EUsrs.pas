unit a_EUsrs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DBCtrls, DB, Mask;

type
  TFormEAUsers = class(TForm)
    bBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    dbeNmUsr: TDBEdit;
    Label2: TLabel;
    dbeKdKatUsr: TDBEdit;
    Label3: TLabel;
    dbePswUsr: TDBEdit;
    Label5: TLabel;
    dbeNotes: TDBEdit;
    dbChBoxOnOff: TDBCheckBox;
    dbeKdSps: TDBEdit;
    sBtnKdSps: TSpeedButton;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeNmUsrEnter(Sender: TObject);
    procedure dbeNmUsrExit(Sender: TObject);
    procedure sBtnKdSpsClick(Sender: TObject);
    procedure dbeKdSpsExit(Sender: TObject);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EAUser(dsrc_Users : TDataSource) : boolean;

const SECTION = 'a_EUsrs';

var
  FormEAUsers: TFormEAUsers;

implementation

uses a_Const, A_ShwErr, a_ShKSps;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAUser(dsrc_Users : TDataSource) : boolean;
begin
  Result := false;
  FormEAUsers := TFormEAUsers.Create(Application);
  with FormEAUsers do begin
    dbeNmUsr.DataSource := dsrc_Users;
    dbePswUsr.DataSource := dsrc_Users;
    dbeKdKatUsr.DataSource := dsrc_Users;
    dbeKdSps.DataSource := dsrc_Users;
    dbeNotes.DataSource := dsrc_Users;
    dbChBoxOnOff.DataSource := dsrc_Users;
    if dbeNmUsr.DataSource.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsers.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEAUsers.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dbeNmUsr.Text = '') then
    mListErr.Add('Не введен пользователь');
  if (dbePswUsr.Text = '') then
    mListErr.Add('Не введен пароль');
  if (dbeKdKatUsr.Text = '') then
    mListErr.Add('Не введена категория пользователя');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsers.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeNmUsr.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsers.dbeNmUsrEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsers.dbeNmUsrExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsers.dbeKdSpsExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsers.sBtnKdSpsClick(Sender: TObject);
var nKdSps : integer; cShSps, cNmSps : string;
begin
  dbeKdSps.SetFocus;
  nKdSps := dbeKdSps.Field.AsInteger;
  if GetKdSps(nKdSps, cShSps, cNmSps) {a_ShKSps} then begin
    dbeKdSps.Field.AsInteger := nKdSps;
    dbeNotes.SetFocus;
  end;
end;

end.
