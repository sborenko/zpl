unit z_CpFlds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ExtCtrls, StdCtrls, Buttons;

type
  TFormCopyFlds = class(TForm)
    chBoxTabN: TCheckBox;
    chBoxVidN: TCheckBox;
    chBoxZaMG: TCheckBox;
    chBoxDtBeg: TCheckBox;
    chBoxDtEnd: TCheckBox;
    chBoxChas: TCheckBox;
    chBoxSumma: TCheckBox;
    chBoxPdN: TCheckBox;
    chBoxKdSpZ: TCheckBox;
    chBoxKdObj: TCheckBox;
    chBoxKdKatP: TCheckBox;
    chBoxNotes: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetOtklCopyFlds(var bTabN, bVidN, bZaMG, bDtBeg, bDtEnd, bChas, bSumma,
                    bPdN, bKdSpZ, bKdObj, bKdKatP, bNotes : boolean) : boolean;

const SECTION = 'z_CpFlds';
var
  FormCopyFlds: TFormCopyFlds;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetOtklCopyFlds(var bTabN, bVidN, bZaMG, bDtBeg, bDtEnd, bChas, bSumma,
                    bPdN, bKdSpZ, bKdObj, bKdKatP, bNotes : boolean) : boolean;
begin
  Result := false;
  FormCopyFlds := TFormCopyFlds.Create(Application);
  with FormCopyFlds do begin
    chBoxTabN.Checked   := bTabN;
    chBoxVidN.Checked   := bVidN;
    chBoxZaMG.Checked   := bZaMG;
    chBoxDtBeg.Checked  := bDtBeg;
    chBoxDtEnd.Checked  := bDtEnd;
    chBoxChas.Checked   := bChas;
    chBoxSumma.Checked  := bSumma;
    chBoxPdN.Checked    := bPdN;
    chBoxKdSpZ.Checked  := bKdSpZ;
    chBoxKdObj.Checked  := bKdObj;
    chBoxKdKatP.Checked := bKdKatP;
    chBoxNotes.Checked  := bNotes;
    Caption := 'Выбор копируемых полей';
    if ShowModal = mrOk then begin
      bTabN   := chBoxTabN.Checked;
      bVidN   := chBoxVidN.Checked;
      bZaMG   := chBoxZaMG.Checked;
      bDtBeg  := chBoxDtBeg.Checked;
      bDtEnd  := chBoxDtEnd.Checked;
      bChas   := chBoxChas.Checked;
      bSumma  := chBoxSumma.Checked;
      bPdN    := chBoxPdN.Checked;
      bKdSpZ  := chBoxKdSpZ.Checked;
      bKdObj  := chBoxKdObj.Checked;
      bKdKatP := chBoxKdKatP.Checked;
      bNotes  := chBoxNotes.Checked;
      Result  := false;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCopyFlds.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCopyFlds.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
