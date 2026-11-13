unit z_MgDpZd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, ExtCtrls, Buttons;

type
  TFormMgDpZd = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    rBtnCase1: TRadioButton;
    rBtnCase2: TRadioButton;
    Bevel1: TBevel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetDopMgVedInf(var nCaseZd : word) : boolean;

const SECTION = 'z_MgDpZd';

var
  FormMgDpZd: TFormMgDpZd;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetDopMgVedInf(var nCaseZd : word) : boolean;
begin
  Result := false;
  FormMgDpZd := TFormMgDpZd.Create(Application);
  with FormMgDpZd do begin
    Caption := 'Выбор варианта подключения сумм';
    if ShowModal = mrOk then begin
      if rBtnCase1.Checked then
        nCaseZd := 1
      else
        nCaseZd := 2;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMgDpZd.FormCreate(Sender: TObject);
var n_CaseZd : word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    n_CaseZd := ReadInteger(SECTION, 'nCsZd', 1);
    Free;
  end;
  rBtnCase1.Checked := (n_CaseZd = 1);
  rBtnCase2.Checked := not rBtnCase1.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormMgDpZd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if rBtnCase1.Checked then
      WriteInteger(SECTION, 'nCsZd', 1)
    else
      WriteInteger(SECTION, 'nCsZd', 2);
    Free;
  end;
end;

end.
