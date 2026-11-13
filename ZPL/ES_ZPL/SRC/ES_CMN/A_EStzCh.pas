unit A_EStzCh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles, Mask;

type
  TFormFirstChildStZ = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    meNewSh: TMaskEdit;
    Label11: TLabel;
    edNewNm: TEdit;
    Label12: TLabel;
    meOldSh: TMaskEdit;
    Label13: TLabel;
    edOldNm: TEdit;
    Label14: TLabel;
    meChldSh: TMaskEdit;
    Label15: TLabel;
    edChldNm: TEdit;
    bBtnOK: TBitBtn;
    bBtnCancel: TBitBtn;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeShifrExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MeShifrEnter(Sender: TObject);
    procedure edNewNmEnter(Sender: TObject);
    procedure edNewNmExit(Sender: TObject);
    procedure edOldNmEnter(Sender: TObject);
    procedure meOldShExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddChildStZ(var cOldShStZ, cNewShStZ, cNewChldSh,
                      cOldNmStZ, cNewNmStZ, cNewChldNm : string) : boolean;

const SECTION = 'A_EStzCh';

var
  FormFirstChildStZ: TFormFirstChildStZ;

implementation

{$R *.DFM}

uses A_Const;

//------------------------------------------------------------------------------
function AddChildStZ(var cOldShStZ, cNewShStZ, cNewChldSh,
                      cOldNmStZ, cNewNmStZ, cNewChldNm : string) : boolean;
begin
  Result := false;
  with TFormFirstChildStZ.Create(Application) do begin
    Caption := 'Ввод дочернего элемента:';
    meNewSh.Text := cNewShStZ;
    edNewNm.Text := cNewNmStZ + ' (ИЗМЕНИТЕ!)';
    meOldSh.Text := cOldShStZ;
    edOldNm.Text := cOldNmStZ;
    meChldSh.Text := cNewChldSh;
    edChldNm.Text := 'Полное название нового дочернего элемента (ИСПРАВЬТЕ!).';
    if ShowModal = mrOK then begin
      cNewShStZ := meNewSh.Text;
      cNewNmStZ := edNewNm.Text;
      cOldShStZ := meOldSh.Text;
      cOldNmStZ := edOldNm.Text;
      cNewChldSh := meChldSh.Text;
      cNewChldNm := edChldNm.Text;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFirstChildStZ.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wl', 100);
    Top  := ReadInteger(SECTION, 'wt', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFirstChildStZ.FormClose(Sender: TObject;
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
procedure TFormFirstChildStZ.MeShifrEnter(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormFirstChildStZ.MeShifrExit(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormFirstChildStZ.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormFirstChildStZ.edNewNmEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormFirstChildStZ.edNewNmExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormFirstChildStZ.meOldShExit(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormFirstChildStZ.edOldNmEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clInfoBk;
end;

end.
