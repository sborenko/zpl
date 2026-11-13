unit A_EStZ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles, Mask, DBCtrls, DB,
  DBTables;

type
  TFormEStz = class(TForm)
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    Label2: TLabel;
    Bevel1: TBevel;
    StaticTextNmCurrent: TStaticText;
    Label3: TLabel;
    dbeName: TDBEdit;
    dbeShifr: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeEnter(Sender: TObject);
  private
    b_EditMode : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

function AddEdtStZ(cMsg : string) : boolean;

const SECTION = 'A_EStZ';

var
  FormEStz: TFormEStz;


implementation

{$R *.DFM}

uses A_Const, A_DM, a_StZ;

//------------------------------------------------------------------------------
function AddEdtStZ(cMsg : string) : boolean;
begin
  Result := false;
  with TFormEStz.Create(Application) do begin
    b_EditMode := dbeShifr.DataSource.State = dsEdit;
    if b_EditMode then
      Caption := 'Редактирование:'
    else
      Caption := 'Новый элемент:';
    StaticTextNmCurrent.Caption := cMsg;
    Label2.Caption := 'Шифр элемента';
    if ShowModal = mrOK then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEStz.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wl', 100);
    Top  := ReadInteger(SECTION, 'wt', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEStz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOK then with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wl', Left);
    WriteInteger(SECTION, 'wt', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEStz.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEStz.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEStz.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
;
end;

end.
