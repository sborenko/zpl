unit z_qPere;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DB, Mask, DBCtrls, DBClient,
  ExtCtrls, ComCtrls;

type
  TFormQryPere = class(TForm)
    dbeNwDtBeg: TDBEdit;
    panelMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sBtnObj: TSpeedButton;
    sBtnKatP: TSpeedButton;
    dbeNwKdObj: TDBEdit;
    dbeNwKdKatP: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    ChBoxKdObj: TCheckBox;
    ChBoxKdKatP: TCheckBox;
    dtPicDtBeg: TDateTimePicker;
    grBoxOklTrf: TGroupBox;
    dbeNwOklTrf: TDBEdit;
    rBtnEmptyOklTrf: TRadioButton;
    rBtnFixedOklTrf: TRadioButton;
    rBtnProcOklTrf: TRadioButton;
    rBtnOldOklTrf: TRadioButton;
    dbeProcOklTrf: TDBEdit;
    PanelRound: TPanel;
    LabelHowRound: TLabel;
    rBtnRoundMinus: TRadioButton;
    rBtnRoundPlus: TRadioButton;
    rBtnIntNorm: TRadioButton;
    rBtnRoundNorm: TRadioButton;
    chBox8802: TCheckBox;
    CheBoxBM: TCheckBox;
    dbeDtBM: TDBEdit;
    CheckTrKn: TCheckBox;
    cdsTmp: TClientDataSet;
    cdsTmpNwDtBeg: TDateField;
    cdsTmpDtPrikaza: TDateField;
    cdsTmpNrPrikaza: TStringField;
    cdsTmpNwKdObj: TSmallintField;
    cdsTmpNwKdKatP: TSmallintField;
    cdsTmpNwOklTrf: TFloatField;
    cdsTmpProcOklTrf: TFloatField;
    cdsTmpDtBM: TDateField;
    dsrcTmp: TDataSource;
    grpBoxPrikaz: TGroupBox;
    Label5: TLabel;
    dbeDtPrikaza: TDBEdit;
    Label6: TLabel;
    dbeNrPrikaza: TDBEdit;
    Label4: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNwDtBegEnter(Sender: TObject);
    procedure dbeNwDtBegExit(Sender: TObject);
    procedure ChBoxEnter(Sender: TObject);
    procedure ChBoxExit(Sender: TObject);
    procedure dtPicDtBegEnter(Sender: TObject);
    procedure dtPicDtBegExit(Sender: TObject);
    procedure rBtnOklTrfClick(Sender: TObject);
    procedure rBtnRoundClick(Sender: TObject);
    procedure dtPicDtBegChange(Sender: TObject);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure cdsTmpNwKdObjValidate(Sender: TField);
    procedure cdsTmpNwKdKatPValidate(Sender: TField);
    procedure sBtnObjClick(Sender: TObject);
    procedure dbeNwKdObjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sBtnKatPClick(Sender: TObject);
    procedure dbeNwKdKatPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cdsTmpProcOklTrfValidate(Sender: TField);
    procedure CheckBoxEnter(Sender: TObject);
    procedure CheckBoxExit(Sender: TObject);
    procedure cdsTmpDtBMSetText(Sender: TField; const Text: String);
    procedure CheBoxBMClick(Sender: TObject);
  private
    { Private declarations }
    d_SvNwDtBeg, d_SvDtPrikaza : TDateTime;
    n_SvProcOklTrf : double;
    c_SvNwNrPrikaza : ShortString;
    procedure SetOklTrfEnv;
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function GetQryPere(var dNwDtBeg, dDtBM, dDtPrikaza : TDateTime;
                    var nNwKdObj, nNwKdKatP, nOklTrfCase, nRoundCase : SmallInt;
                    var nProcOklTrf, nNwOklTrf : double;
                    var cNwNrPrikaza, cDtBM : ShortString;
                 var bBM, bOldKdObj, bOldKdKatP, bAdd8802, bTrKn : boolean)  : boolean;

const SECTION = 'z_qPere';

var
  FormQryPere: TFormQryPere;

implementation

uses a_Const, z_Dm, z_Main, z_TObj, a_Lib, Z_GtPers, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetQryPere(var dNwDtBeg, dDtBM, dDtPrikaza : TDateTime;
                   var nNwKdObj, nNwKdKatP, nOklTrfCase, nRoundCase : SmallInt;
                   var nProcOklTrf, nNwOklTrf : double;
                  var cNwNrPrikaza, cDtBM : ShortString;
                 var bBM, bOldKdObj, bOldKdKatP, bAdd8802, bTrKn: boolean)  : boolean;
begin
  Result := false;
  FormQryPere := TFormQryPere.Create(Application);
  with FormQryPere do begin
    Caption := 'Задание на новые перемещения';
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      if d_SvNwDtBeg <> 0 then begin
        cdsTmpNwDtBeg.AsDateTime := d_SvNwDtBeg;
        dtPicDtBeg.Date := d_SvNwDtBeg; end
      else begin
        dtPicDtBeg.Date := Date;
        cdsTmpNwDtBeg.AsDateTime := Date;
      end;
      chBox8802.Visible := false; // Решил отдать это дело программе
                      // cdsTmpNwDtBeg.AsDateTime < dCtrlDate;
      if d_SvDtPrikaza <> 0 then
        cdsTmpDtPrikaza.AsDateTime := d_SvDtPrikaza
      else
        cdsTmpDtPrikaza.AsDateTime := Date;
      if n_SvProcOklTrf <> 0 then
        cdsTmpProcOklTrf.AsFloat := n_SvProcOklTrf;
      cdsTmpNrPrikaza.AsString := c_SvNwNrPrikaza;
    end;
    if ShowModal = mrOk then begin
      bBm          := CheBoxBM.Checked;
      bTrKn        := CheckTrKn.Checked;
      dNwDtBeg     := dtPicDtBeg.Date;
      dDtPrikaza   := cdsTmpDtPrikaza.AsDateTime;
      nNwKdObj     := cdsTmpNwKdObj.AsInteger;
      nNwKdKatP    := cdsTmpNwKdKatP.AsInteger;
      nProcOklTrf  := cdsTmpProcOklTrf.AsFloat;
      bOldKdObj    := ChBoxKdObj.Checked;
      bOldKdKatP   := ChBoxKdKatP.Checked;
      nNwOklTrf    := cdsTmpNwOklTrf.AsFloat;
      cNwNrPrikaza := cdsTmpNrPrikaza.AsString;
      cDtBM        := cdsTmpDtBM.AsString;
      if rBtnOldOklTrf.Checked then
        nOklTrfCase := 1
      else if rBtnEmptyOklTrf.Checked then
        nOklTrfCase := 2
      else if rBtnFixedOklTrf.Checked then
        nOklTrfCase := 3
      else
        nOklTrfCase := 4;
      if nOklTrfCase = 4 then begin
        if rBtnIntNorm.Checked then
          nRoundCase := 1
        else if rBtnRoundNorm.Checked then
          nRoundCase := 2
        else if rBtnRoundMinus.Checked then
          nRoundCase := 3
        else if rBtnRoundPlus.Checked then
          nRoundCase := 4; end
      else
        nRoundCase := 0;
      bAdd8802 := true; // Решил отдать это дело программе
               // chBox8802.Visible and (cdsTmpNwDtBeg.AsDateTime < dCtrlDate);
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.FormCreate(Sender: TObject);
var nRoundCase, nOklTrfCase : SmallInt;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    nOklTrfCase := ReadInteger(SECTION, 'nOklCs', 1);
    nRoundCase  := ReadInteger(SECTION, 'nRndCs', 2);
    ChBoxKdObj.Checked := ReadBool(SECTION, 'bOldKdObj', true);
    ChBoxKdKatP.Checked := ReadBool(SECTION, 'bOldKdKatP', true);
    d_SvNwDtBeg := ReadDate(SECTION, 'dSvDtB', 0);
    d_SvDtPrikaza := ReadDate(SECTION, 'dSvDtPr', 0);
    n_SvProcOklTrf := ReadFloat(SECTION, 'nSvPrcOT', 0);
    c_SvNwNrPrikaza := ReadString(SECTION, 'cSvNrPr', '');
    Free;
  end;
  if nOklTrfCase = 1 then
    rBtnOldOklTrf.Checked := true
  else if nOklTrfCase = 2 then
    rBtnEmptyOklTrf.Checked := true
  else if nOklTrfCase = 3 then
    rBtnFixedOklTrf.Checked := true
  else
    rBtnProcOklTrf.Checked := true;
  SetOklTrfEnv;
  if nRoundCase = 1 then
    rBtnIntNorm.Checked := true
  else if nRoundCase = 2 then
    rBtnRoundNorm.Checked := true
  else if nRoundCase = 3 then
    rBtnRoundMinus.Checked := true
  else
    rBtnRoundPlus.Checked := true;
//  dbeNwDtBeg.Visible := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeNrPrikaza.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormQryPere.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if rBtnProcOklTrf.Checked and
           (cdsTmpProcOklTrf.IsNull or (cdsTmpProcOklTrf.AsInteger = 0)) then
    mListErr.Add('Нет процента изменения оклада');
  if rBtnFixedOklTrf.Checked and
       (cdsTmpNwOklTrf.IsNull or (cdsTmpNwOklTrf.AsInteger <= 0)) then
    mListErr.Add('Плохая сумма нового оклада');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if rBtnOldOklTrf.Checked then
      WriteInteger(SECTION, 'nOklCs', 1)
    else if rBtnEmptyOklTrf.Checked then
      WriteInteger(SECTION, 'nOklCs', 2)
    else if rBtnFixedOklTrf.Checked then
      WriteInteger(SECTION, 'nOklCs', 3)
    else
      WriteInteger(SECTION, 'nOklCs', 4);
    if rBtnIntNorm.Checked then
      WriteInteger(SECTION, 'nRndCs', 1)
    else if rBtnRoundNorm.Checked then
      WriteInteger(SECTION, 'nRndCs', 2)
    else if rBtnRoundMinus.Checked then
      WriteInteger(SECTION, 'nRndCs', 3)
    else
      WriteInteger(SECTION, 'nRndCs', 4);
    WriteBool(SECTION, 'bOldKdObj', ChBoxKdObj.Checked);
    WriteBool(SECTION, 'bOldKdKatP', ChBoxKdKatP.Checked);
    if cdsTmp.Active and not cdsTmpNwDtBeg.IsNull then
      WriteDate(SECTION, 'dSvDtB', cdsTmpNwDtBeg.AsDateTime);
    if cdsTmp.Active and not cdsTmpDtPrikaza.IsNull then
      WriteDate(SECTION, 'dSvDtPr', cdsTmpDtPrikaza.AsDateTime);
    if cdsTmp.Active and not cdsTmpProcOklTrf.IsNull then
      WriteFloat(SECTION, 'nSvPrcOT', cdsTmpProcOklTrf.AsFloat);
    if cdsTmp.Active and not cdsTmpNrPrikaza.IsNull then
      WriteString(SECTION, 'cSvNrPr', cdsTmpNrPrikaza.AsString);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.dbeNwDtBegEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.dbeNwDtBegExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.ChBoxEnter(Sender: TObject);
begin
  (Sender as TCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.ChBoxExit(Sender: TObject);
begin
  (Sender as TCheckBox).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.dtPicDtBegEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.dtPicDtBegExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.rBtnOklTrfClick(Sender: TObject);
begin
  SetOklTrfEnv;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.SetOklTrfEnv;
begin
  if rBtnOldOklTrf.Checked or rBtnEmptyOklTrf.Checked then begin
    dbeNwOklTrf.Enabled := false;
    dbeNwOklTrf.Color := clBtnFace;
    dbeProcOklTrf.Enabled := false;
    dbeProcOklTrf.Color := clBtnFace;
    LabelHowRound.Enabled := false;
    rBtnIntNorm.Enabled := false;
    rBtnRoundNorm.Enabled := false;
    rBtnRoundMinus.Enabled := false;
    rBtnRoundPlus.Enabled := false; end
  else if rBtnFixedOklTrf.Checked then begin
    dbeNwOklTrf.Enabled := true;
    dbeNwOklTrf.Color := clWindow;
    dbeProcOklTrf.Enabled := false;
    dbeProcOklTrf.Color := clBtnFace;
    LabelHowRound.Enabled := false;
    rBtnIntNorm.Enabled := false;
    rBtnRoundNorm.Enabled := false;
    rBtnRoundMinus.Enabled := false;
    rBtnRoundPlus.Enabled := false; end
  else if rBtnProcOklTrf.Checked then begin
    dbeNwOklTrf.Enabled := false;
    dbeNwOklTrf.Color := clBtnFace;
    dbeProcOklTrf.Enabled := true;
    dbeProcOklTrf.Color := clWindow;
    LabelHowRound.Enabled := true;
    rBtnIntNorm.Enabled := true;
    rBtnRoundNorm.Enabled := true;
    rBtnRoundMinus.Enabled := true;
    rBtnRoundPlus.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.rBtnRoundClick(Sender: TObject);
begin
  ;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.dtPicDtBegChange(Sender: TObject);
begin
  cdsTmpNwDtBeg.AsDateTime := dtPicDtBeg.Date;
  if myEmptyDate(cdsTmpDtPrikaza.AsString) then
    cdsTmpDtPrikaza.AsDateTime := dtPicDtBeg.Date;
  chBox8802.Visible := false; // Решил отдать это дело программе
                       // cdsTmpNwDtBeg.AsDateTime < dCtrlDate;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.DateFieldSetText(Sender: TField;
                                                      const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.cdsTmpNwKdObjValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean; cShObj : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := DmMain.IsKdObjInDic(StrToInt(cText), cShObj);
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике подразделения ' + cText);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.sBtnObjClick(Sender: TObject);
var nKdObj, nObjKdSpZ : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  dbeNwKdObj.SetFocus;
  nKdObj := cdsTmpNwKdObj.AsInteger;
  if GetKdObj(nKdObj, nObjKdSpZ,
                             cShObj, cNmObj, bWasUpdated) {z_TObj} then begin
    cdsTmpNwKdObj.AsInteger := nKdObj;
    dbeNwKdKatP.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.dbeNwKdObjKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
 if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
   sBtnObjClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.cdsTmpNwKdKatPValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean; cShKatP : string;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := (DmMain.KdKatP2NmKatP(StrToInt(cText), cShKatP) > '');
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике категории персонала ' + cText);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer; cNmKatP, cShKatP : string;
begin
  dbeNwKdKatP.SetFocus;
  nKdKatP := cdsTmpNwKdKatP.AsInteger;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {Z_GtPers} then begin
    cdsTmpNwKdKatP.AsInteger := nKdKatP;
    grBoxOklTrf.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.dbeNwKdKatPKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
begin
 if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
   sBtnKatPClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.cdsTmpProcOklTrfValidate(Sender: TField);
var nProc : SmallInt;
begin
  nProc := cdsTmpProcOklTrf.AsInteger;
  if (nProc > 100) or (nProc < -100) then
    Raise  Exception.Create('Задан слишком большой процент "' +
                                  IntToStr(nProc) + '"');
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.CheckBoxEnter(Sender: TObject);
begin
  (Sender as TCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.CheckBoxExit(Sender: TObject);
begin
  (Sender as TCheckBox).Color := clBtnFace;
//  dbeDtBM.Visible := cheBoxBM.Checked;
//  if cheBoxBM.Checked then
//    dbeDtBM.SetFocus;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.cdsTmpDtBMSetText(Sender: TField;
  const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormQryPere.CheBoxBMClick(Sender: TObject);
begin
  dbeDtBM.Visible := cheBoxBM.Checked;
  if cheBoxBM.Checked then
    dbeDtBM.SetFocus;
end;

end.
