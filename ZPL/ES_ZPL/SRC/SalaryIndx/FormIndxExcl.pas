unit FormIndxExcl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TFrmIndxExcl = class(TForm)
    LblDtBeg: TLabel;
    LblDtEnd: TLabel;
    PanelBottom: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    LblNotes: TLabel;
    DbeDtBeg: TDBEdit;
    DbeDtEnd: TDBEdit;
    DbeNotes: TDBEdit;
    DbeTabN: TDBEdit;
    EdtFIO: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    class function Modify(Add: Boolean; FIO: ShortString): Boolean;
  end;

implementation

uses
  a_Const, DateLib, DModEmplIndx, IniFiles;

const
  SECTION = 'IndxExclRec';

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFrmIndxExcl.Modify(Add: Boolean; FIO: ShortString): Boolean;
var
  FrmIndxExcl: TFrmIndxExcl;
begin
  FrmIndxExcl := TFrmIndxExcl.Create(nil);

  with FrmIndxExcl do begin
    EdtFIO.Text := FIO;
    
    if Add then
      DmIndxExcl.Add
    else
      DmIndxExcl.Edit;

    Result := ShowModal = mrOk;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmIndxExcl.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', Left);
    Top  := ReadInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmIndxExcl.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  ErrMsg: String;
begin
  CanClose := ModalResult = mrCancel;

  if not CanClose then begin
    CanClose := DmIndxExcl.Save(ErrMsg);

    if not CanClose then
      ShowMessage(ErrMsg);
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmIndxExcl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.

