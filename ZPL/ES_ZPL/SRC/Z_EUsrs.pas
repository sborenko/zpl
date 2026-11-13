unit Z_EUsrs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, IniFiles, Buttons, DB;

type
  TFormEAUsrs = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEditEnter(Sender: TObject);
    procedure DBEditExit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EAUsr : boolean;

const SECTION = 'z_EUsrs';

var
  FormEAUsrs: TFormEAUsrs;

implementation

uses A_Const, Z_Main{, Z_Usrs};

{$R *.dfm}

//------------------------------------------------------------------------------
function EAUsr : boolean;
begin
  Result := false;
(*
  FormEAUsrs := TFormEAUsrs.Create(Application);
  with FormEAUsrs do begin
    if FormUsers.tblUsrs.State = dsInsert then
      Caption := 'Новый пользователь'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrs.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrs.DBEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrs.DBEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrs.DBLookupComboBox1Enter(Sender: TObject);
begin
  (Sender as TDBLookupComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrs.DBLookupComboBox1Exit(Sender: TObject);
begin
  (Sender as TDBLookupComboBox).Color := clWindow;
end;

end.
