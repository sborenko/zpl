unit A_ESbuCh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles, Mask;

type
  TFormChildSbu = class(TForm)
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    edNewNm: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    meNewSh: TMaskEdit;
    Label7: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    meOldSh: TMaskEdit;
    Label5: TLabel;
    edOldNm: TEdit;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label11: TLabel;
    meChldSh: TMaskEdit;
    edChldNm: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure meNewShExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure meNewShEnter(Sender: TObject);
    procedure meOldShExit(Sender: TObject);
    procedure edOldNmExit(Sender: TObject);
    procedure edNewNmEnter(Sender: TObject);
    procedure edNewNmExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddChildSbu(var cOldShifr, cNewShifr, cNewChldSh,
                      cOldName,  cNewName,  cNewChldNm : ShortString) : boolean;

const SECTION = 'A_ESbuCh';

var
  FormChildSbu: TFormChildSbu;


implementation

{$R *.DFM}

uses A_Const;

//----------------------------------------------------------------
function AddChildSbu(var cOldShifr, cNewShifr, cNewChldSh,
                      cOldName,  cNewName,  cNewChldNm : ShortString) : boolean;
begin
  result := false;
  with TFormChildSbu.Create(Application) do begin
    Caption := 'Ввод дочернего элемента:';
    meOldSh.Text := cOldShifr;
    edOldNm.Text := cOldName;
    meNewSh.Text := cNewShifr;
    edNewNm.Text := cNewName;
    meChldSh.Text := 'Введите!';
    edChldNm.Text := '(ИСПРАВЬТЕ!) Полное название нового дочернего элемента.';
    if ShowModal = mrOK then begin
      cNewShifr := meNewSh.Text;
      cNewName := edNewNm.Text;
      cOldShifr := meOldSh.Text;
      cOldName := edOldNm.Text;
      cNewChldSh := meChldSh.Text;
      cNewChldNm := edChldNm.Text;
      Result := true;
    end;
    Free;
  end;
end;
//----------------------------------------------------------------
procedure TFormChildSbu.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wl', 100);
    Top  := ReadInteger(SECTION, 'wt', 250);
    Free;
  end;
end;
//----------------------------------------------------------------
procedure TFormChildSbu.FormClose(Sender: TObject;
                                       var Action: TCloseAction);
begin
  if ModalResult = mrOK then
                        with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wl', Left);
    WriteInteger(SECTION, 'wt', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu.meNewShExit(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu.meNewShEnter(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu.meOldShExit(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu.edOldNmExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu.edNewNmEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu.edNewNmExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

end.
