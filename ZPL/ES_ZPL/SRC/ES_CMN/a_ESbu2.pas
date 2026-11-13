unit a_ESbu2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles, Mask;

type
  TFormChildSbu2 = class(TForm)
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
    Label10: TLabel;
    Label12: TLabel;
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

function AddChildSbuNew(var cOldShifr, cNewShifr,
                                  cOldName,  cNewName : ShortString) : boolean;

const SECTION = 'a_ESbu2';

var
  FormChildSbu2: TFormChildSbu2;


implementation

{$R *.DFM}

uses A_Const;

//----------------------------------------------------------------
function AddChildSbuNew(var cOldShifr, cNewShifr,
                                  cOldName,  cNewName : ShortString) : boolean;
begin
  Result := false;
  with TFormChildSbu2.Create(Application) do begin
    Caption := 'Ввод дочернего элемента:';
    meOldSh.Text := cOldShifr;
    edOldNm.Text := cOldName;
    meNewSh.Text := cNewShifr;
    edNewNm.Text := cNewName;
    if ShowModal = mrOK then begin
      cOldShifr := meOldSh.Text;
      cOldName  := edOldNm.Text;
      cNewShifr := meNewSh.Text;
      cNewName  := edNewNm.Text;
      Result := true;
    end;
    Free;
  end;
end;
//----------------------------------------------------------------
procedure TFormChildSbu2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wl', 400);
    Top  := ReadInteger(SECTION, 'wt', 400);
    Free;
  end;
end;
//----------------------------------------------------------------
procedure TFormChildSbu2.FormClose(Sender: TObject;
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
procedure TFormChildSbu2.meNewShExit(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu2.meNewShEnter(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu2.meOldShExit(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu2.edOldNmExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu2.edNewNmEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChildSbu2.edNewNmExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;

end.
