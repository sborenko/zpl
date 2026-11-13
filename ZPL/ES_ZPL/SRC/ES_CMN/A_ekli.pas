unit A_EKli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TFormKliEdit = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    edNmKli: TEdit;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    chBoxChangeNmRSch: TCheckBox;
    MemoNotes: TMemo;
    Label13: TLabel;
    Label2: TLabel;
    edAdres: TEdit;
    Label4: TLabel;
    edOkpo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edNmKliEnter(Sender: TObject);
    procedure edNmKliExit(Sender: TObject);
    procedure MemoNotesEnter(Sender: TObject);
    procedure MemoNotesExit(Sender: TObject);
    procedure edOkpoEnter(Sender: TObject);
    procedure edOkpoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EdtKlient(var cNmKli, cOkpo, cNotes, cAdres : string;
             bIsRSch : boolean; var bEdtRSch : boolean) : boolean;
var
  FormKliEdit: TFormKliEdit;

const SECTION = 'A_EKli';

implementation

{$R *.DFM}

uses A_Const;

//------------------------------------------------------------------------------
function EdtKlient(var cNmKli, cOkpo, cNotes, cAdres : string;
             bIsRSch : boolean; var bEdtRSch : boolean) : boolean;
begin
  Result := false;
  FormKliEdit := TFormKliEdit.Create(Application);
  with FormKliEdit do begin
    edNmKli.Text := cNmKli;
    edAdres.Text := cAdres;
    edOkpo.Text  := cOkpo;
    MemoNotes.Text := cNotes;
    chBoxChangeNmRSch.Checked := false;
    if bIsRSch then
      chBoxChangeNmRSch.Visible := true
    else
      chBoxChangeNmRSch.Visible := false;
    if ShowModal = mrOk then begin
      Result   := true;
      cNmKli   := edNmKli.Text;
      cAdres   := edAdres.Text;
      cOkpo    := edOkpo.Text;
      cNotes   := MemoNotes.Text;
      bEdtRSch := chBoxChangeNmRSch.Checked;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliEdit.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliEdit.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliEdit.FormCloseQuery(Sender: TObject;
                                           var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and (edNmKli.Text = '') then begin
    ModalResult := mrNone;
    CanClose := false;
    MessageDlg('Ќазвание клиента не может быть пустым.', mtError, [mbOk], 0);
    edNmKli.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKliEdit.edNmKliEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormKliEdit.edNmKliExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormKliEdit.MemoNotesEnter(Sender: TObject);
begin
  (Sender as TMemo).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormKliEdit.MemoNotesExit(Sender: TObject);
begin
  (Sender as TMemo).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormKliEdit.edOkpoEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormKliEdit.edOkpoExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

end.
