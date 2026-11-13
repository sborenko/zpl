unit a_UsrZpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TFormEAUsrZpl = class(TForm)
    Label1: TLabel;
    dbeKdUsr: TDBEdit;
    Label2: TLabel;
    dbeKdSps: TDBEdit;
    Label3: TLabel;
    dbeNotes: TDBEdit;
    Label4: TLabel;
    dbeShSps: TDBEdit;
    Label5: TLabel;
    dbeNmSps: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnKdSps: TSpeedButton;
    procedure sBtnKdSpsClick(Sender: TObject);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    bEditMode : boolean;
  public
    { Public declarations }
  end;

function EAUsrsZpl : boolean;

const SECTION = 'a_UsrZpl';

var
  FormEAUsrZpl: TFormEAUsrZpl;

implementation

uses a_Const, a_Dm, a_Usrs2, a_ShKSps;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAUsrsZpl : boolean;
begin
  Result := false;
  FormEAUsrZpl := TFormEAUsrZpl.Create(Application);
  with FormEAUsrZpl do begin
    if dbeKdUsr.DataSource.DataSet.State = dsInsert then
      bEditMode := false
    else
      bEditMode := true;
    if bEditMode then
      Caption := 'Редактирование записи'
    else
      Caption := 'Новая запись';
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrZpl.sBtnKdSpsClick(Sender: TObject);
var nKdSps : integer; cShSps, cNmSps : string;
begin
  dbeKdSps.SetFocus;
  nKdSps := dbeKdSps.Field.AsInteger;
  if GetKdSps(nKdSps, cShSps, cNmSps) {a_ShKSps} then begin
    dbeKdSps.Field.AsInteger := nKdSps;
    dbeShSps.ReadOnly := false;
    dbeShSps.Text := cShSps;
    dbeShSps.ReadOnly := true;
    dbeNmSps.ReadOnly := false;
    dbeNmSps.Text := cNmSps;
    dbeNmSps.ReadOnly := true;
    dbeNotes.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrZpl.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrZpl.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrZpl.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left := ReadInteger(SECTION, 'wL', 450);
	  Top  := ReadInteger(SECTION, 'wT', 450);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrZpl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
	  Free;
  end;
end;

end.
