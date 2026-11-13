unit a_EKSps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TFormEAKdSps = class(TForm)
    Label1: TLabel;
    dbeKdSps: TDBEdit;
    Label2: TLabel;
    dbeShSps: TDBEdit;
    Label3: TLabel;
    dbeNmSps: TDBEdit;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure dbeKdSpsEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EAKdSps : boolean;

const SECTION = 'a_EKSps';

var
  FormEAKdSps: TFormEAKdSps;

implementation

uses a_Const, a_Dm{, z_Main};

{$R *.dfm}

//------------------------------------------------------------------------------
function EAKdSps : boolean;
begin
  Result := false;
  FormEAKdSps := TFormEAKdSps.Create(Application);
  with FormEAKdSps do begin
    if dbeKdSps.DataSource.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdSps.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdSps.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdSps.dbeKdSpsEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdSps.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdSps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
