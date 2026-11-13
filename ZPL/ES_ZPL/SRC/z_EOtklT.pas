unit z_EOtklT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons;

type
  TFormEOtklTools = class(TForm)
    grBoxVidN: TGroupBox;
    rBtnVidNPred: TRadioButton;
    rBtnVidNEmpty: TRadioButton;
    grBoxObj: TGroupBox;
    rBtnObjEmpty: TRadioButton;
    rBtnObjPred: TRadioButton;
    rBtnObjPere: TRadioButton;
    grBoxSpZ: TGroupBox;
    rBtnSpZEmpty: TRadioButton;
    rBtnSpZPred: TRadioButton;
    rBtnSpZPere: TRadioButton;
    grBoxZaMG: TGroupBox;
    rBtnZaMGCurrent: TRadioButton;
    rBtnZaMGPred: TRadioButton;
    grBoxNotes: TGroupBox;
    rBtnNotesEmpty: TRadioButton;
    rBtnNotesPred: TRadioButton;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    grBoxSumma: TGroupBox;
    rBtnSummaEmpty: TRadioButton;
    rBtnSummaPred: TRadioButton;
    grBoxDtBeg: TGroupBox;
    rBtnDatesEmpty: TRadioButton;
    rBtnDatesPred: TRadioButton;
    GroupBox2: TGroupBox;
    rBtnChasuEmpty: TRadioButton;
    rBtnChasuPred: TRadioButton;
    rBtnDatesPeriod: TRadioButton;
    rBtnChasuCalc: TRadioButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SetOtklEnv(var bPredVidN, bEmptyVidN, bPereObj, bPredObj, bEmptyObj,
                         bPereSpZ, bPredSpZ, bEmptySpZ, bPredZaMG, bCurZaMG,
                          bPeriodDates, bPredDates, bEmptyDates,
                           bCalcChasu, bPredChasu, bEmptyChasu,
                            bPredSumma, bEmptySumma,
                             bPredNotes, bEmptyNotes : boolean) : boolean;

const SECTION = 'z_EOtklT';

var
  FormEOtklTools: TFormEOtklTools;

implementation

uses A_Const, Z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function SetOtklEnv(var bPredVidN, bEmptyVidN, bPereObj, bPredObj, bEmptyObj,
                         bPereSpZ, bPredSpZ, bEmptySpZ, bPredZaMG, bCurZaMG,
                          bPeriodDates, bPredDates, bEmptyDates,
                           bCalcChasu, bPredChasu, bEmptyChasu,
                            bPredSumma, bEmptySumma,
                             bPredNotes, bEmptyNotes : boolean) : boolean;
begin
  Result := false;
  FormEOtklTools := TFormEOtklTools.Create(Application);
  with FormEOtklTools do begin
    rBtnVidNPred.Checked    := bPredVidN;
    rBtnVidNEmpty.Checked   := bEmptyVidN;
    rBtnObjEmpty.Checked    := bEmptyObj;
    rBtnObjPred.Checked     := bPredObj;
    rBtnObjPere.Checked     := bPereObj;
    rBtnSpZEmpty.Checked    := bEmptySpZ;
    rBtnSpZPred.Checked     := bPredSpZ;
    rBtnSpZPere.Checked     := bPereSpZ;
    rBtnZaMGCurrent.Checked := bCurZaMG;
    rBtnZaMGPred.Checked    := bPredZaMG;
    rBtnDatesPeriod.Checked := bPeriodDates;
    rBtnDatesPred.Checked   := bPredDates;
    rBtnDatesEmpty.Checked  := bEmptyDates;
    rBtnChasuCalc.Checked   := bCalcChasu;
    rBtnChasuPred.Checked   := bPredChasu;
    rBtnChasuEmpty.Checked  := bEmptyChasu;
    rBtnSummaPred.Checked   := bPredSumma;
    rBtnSummaEmpty.Checked  := bEmptySumma;
    rBtnNotesEmpty.Checked  := bEmptyNotes;
    rBtnNotesPred.Checked   := bPredNotes;
    Caption := 'Значения, подставляемые в поля новой записи "по-умолчанию"';
    if ShowModal = mrOk then begin
      bPredVidN    := rBtnVidNPred.Checked;
      bEmptyVidN   := rBtnVidNEmpty.Checked;
      bEmptyObj    := rBtnObjEmpty.Checked;
      bPredObj     := rBtnObjPred.Checked;
      bPereObj     := rBtnObjPere.Checked;
      bEmptySpZ    := rBtnSpZEmpty.Checked;
      bPredSpZ     := rBtnSpZPred.Checked;
      bPereSpZ     := rBtnSpZPere.Checked;
      bCurZaMG     := rBtnZaMGCurrent.Checked;
      bPredZaMG    := rBtnZaMGPred.Checked;
      bPeriodDates := rBtnDatesPeriod.Checked;
      bPredDates   := rBtnDatesPred.Checked;
      bEmptyDates  := rBtnDatesEmpty.Checked;
      bCalcChasu   := rBtnChasuCalc.Checked;
      bPredChasu   := rBtnChasuPred.Checked;
      bEmptyChasu  := rBtnChasuEmpty.Checked;
      bPredSumma   := rBtnSummaPred.Checked;
      bEmptySumma  := rBtnSummaEmpty.Checked;
      bEmptyNotes  := rBtnNotesEmpty.Checked;
      bPredNotes   := rBtnNotesPred.Checked;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtklTools.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 400);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtklTools.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
