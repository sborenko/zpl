unit z_ESovm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, IniFiles, DBCtrls, Db,
  DBClient, DBTables;

type
  TFormEASovm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edShSovm: TEdit;
    edNmSovm: TEdit;
    edNotes: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EASovm(var cShSovm, cNmSovm, cNotes : string;
                                                 bNewRec : boolean) : boolean;

const SECTION = 'Z_ESovm';

var
  FormEASovm: TFormEASovm;

implementation

uses A_Const, A_ShwErr;

{$R *.DFM}

//------------------------------------------------------------------------------
function EASovm(var cShSovm, cNmSovm, cNotes : string;
                                                 bNewRec : boolean) : boolean;
begin
  Result := false;
  FormEASovm := TFormEASovm.Create(Application);
  with FormEASovm do begin
    if bNewRec then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    edShSovm.Text := cShSovm;
    edNmSovm.Text := cNmSovm;
    edNotes.Text  := cNotes;
    if ShowModal = mrOk then begin
      cShSovm := edShSovm.Text;
      cNmSovm := edNmSovm.Text;
      cNotes  := edNotes.Text;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASovm.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASovm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASovm.EditEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEASovm.EditExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
function TFormEASovm.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (edShSovm.Text = '') then
    mListErr.Add('Нет шифра вида совместительства');
  if (edNmSovm.Text = '') then
    mListErr.Add('Нет названия совместительства');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEASovm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    CanClose := false;
    ModalResult := mrNone;
    edShSovm.SetFocus;
  end;
end;

end.
