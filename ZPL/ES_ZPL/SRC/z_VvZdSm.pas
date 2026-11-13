unit z_VvZdSm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls;

type
  TFormVvZdSm = class(TForm)
    bBrnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    rBtnVsBudget: TRadioButton;
    rBtnVsSpecSr: TRadioButton;
    rBtnVsDp: TRadioButton;
    rBtnVsRz: TRadioButton;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function VvodZdNaVuborku(var bPSch801, bPSch811,
                                    bPSch801dp, bSch801rz : boolean) : boolean;

const SECTION = 'z_VvZdSm';

var
  FormVvZdSm: TFormVvZdSm;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function VvodZdNaVuborku(var bPSch801, bPSch811,
                                    bPSch801dp, bSch801rz : boolean) : boolean;
begin
  Result := false;
  FormVvZdSm := TFormVvZdSm.Create(Application);
  with FormVvZdSm do begin
    Caption := 'Задание на выборку';
    if ShowModal = mrOk then begin
      bPSch801   := rBtnVsBudget.Checked;
      bPSch811   := rBtnVsSpecSr.Checked;
      bPSch801dp := rBtnVsDp.Checked;
      bSch801rz  := rBtnVsRz.Checked;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvZdSm.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    rBtnVsBudget.Checked := ReadBool(SECTION, 'bBudg', true);
    rBtnVsSpecSr.Checked := ReadBool(SECTION, 'bSpec', false);
    rBtnVsDp.Checked := ReadBool(SECTION, 'bVsDp', false);
    rBtnVsRz.Checked := ReadBool(SECTION, 'bVsRz', true);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvZdSm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if ModalResult = mrOk then begin
      WriteBool(SECTION, 'bBudg', rBtnVsBudget.Checked);
      WriteBool(SECTION, 'bSpec', rBtnVsSpecSr.Checked);
      WriteBool(SECTION, 'bVsDp', rBtnVsDp.Checked);
      WriteBool(SECTION, 'bVsRz', rBtnVsRz.Checked);
    end;
  end;
end;

end.
