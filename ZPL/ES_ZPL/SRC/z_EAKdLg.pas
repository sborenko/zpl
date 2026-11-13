unit z_EAKdLg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TFormEAKdLgt = class(TForm)
    Label1: TLabel;
    dbeKdLgt: TDBEdit;
    Label2: TLabel;
    dbeOznPilg: TDBEdit;
    Label3: TLabel;
    dbeShLg: TDBEdit;
    Label4: TLabel;
    dbeNmLg: TDBEdit;
    Label5: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCacel: TBitBtn;
    procedure dbeKdLgtEnter(Sender: TObject);
    procedure dbeKdLgtExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EAKdLgt : boolean;

const SECTION = 'z_EAKdLg';

var
  FormEAKdLgt: TFormEAKdLgt;

implementation

uses A_DM, a_Const, z_Dm, z_Main, z_GtKdLg;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAKdLgt : boolean;
begin
  Result := false;
  FormEAKdLgt := TFormEAKdLgt.Create(Application);
  with FormEAKdLgt do begin
    if dbeKdLgt.DataSource.State = dsInsert then begin
      Caption := 'Новая льгота'; end
    else begin
      Caption := 'Редактирование льготы';
      dbeKdLgt.ReadOnly := true;
      dbeKdLgt.Color := clBtnFace;
      dbeKdLgt.OnEnter := nil;
      dbeKdLgt.OnExit  := nil;
      dbeKdLgt.TabStop := false;
    end;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdLgt.dbeKdLgtEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdLgt.dbeKdLgtExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdLgt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdLgt.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and ((dbeOznPilg.Field.AsString = '') or
               (dbeShLg.Field.AsString = '') or
                         (dbeNmLg.Field.AsString = '')) then begin
    ModalResult := mrNone;
    CanClose := false;
    dbeOznPilg.SetFocus;
    ShowMessage('Обязательно надо заполнить Ознаку, Шифр и Название льготы');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAKdLgt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
