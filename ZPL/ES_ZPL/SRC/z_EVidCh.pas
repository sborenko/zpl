unit z_EVidCh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles, Mask;

type
  TFormAddChildVid = class(TForm)
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

function AddChildVid(var cOldShifr, cNewShifr, cNewChldSh,
                           cOldName,  cNewName,  cNewChldNm : string) : boolean;

const SECTION = 'z_EVidCh';

var
  FormAddChildVid: TFormAddChildVid;


implementation

{$R *.DFM}

uses A_Const;

//------------------------------------------------------------------------------
function AddChildVid(var cOldShifr, cNewShifr, cNewChldSh,
                           cOldName,  cNewName,  cNewChldNm : string) : boolean;
begin
  Result := false;
  with TFormAddChildVid.Create(Application) do begin
    Caption := 'Ввод первого дочернего элемента:';
    meOldSh.Text := cOldShifr;
    edOldNm.Text := cOldName;
    meNewSh.Text := cNewShifr;
    edNewNm.Text := cNewName;
    if cNewChldSh = '' then
      meChldSh.Text := 'Введите!'
    else
      meChldSh.Text := cNewChldSh;
    if cNewChldNm = '' then
      edChldNm.Text := '(ИСПРАВЬТЕ!) Полное название нового дочернего элемента.'
    else
      edChldNm.Text := cNewChldNm;
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
//------------------------------------------------------------------------------
procedure TFormAddChildVid.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wl', 100);
    Top  := ReadInteger(SECTION, 'wt', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddChildVid.FormClose(Sender: TObject;
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
procedure TFormAddChildVid.meNewShExit(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAddChildVid.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormAddChildVid.meNewShEnter(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddChildVid.meOldShExit(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormAddChildVid.edOldNmExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormAddChildVid.edNewNmEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddChildVid.edNewNmExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

end.
