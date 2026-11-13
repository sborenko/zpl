unit z_VbOKS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBClient, StdCtrls, Buttons, Mask, DBCtrls,
  DBTables, ExtCtrls;

type
  TFormVbOKS = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cdsTmp: TClientDataSet;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    rBtnSovmNo: TRadioButton;
    rBtnSovmYes: TRadioButton;
    rBtnSovmAll: TRadioButton;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnObj: TSpeedButton;
    sBtnKatP: TSpeedButton;
    sBtnSpz: TSpeedButton;
    lbxObj: TListBox;
    lbxKatP: TListBox;
    lbxSpz: TListBox;
    dsrcTmp: TDataSource;
    cdsTmpF_Int: TIntegerField;
    cdsTmpF_Float: TFloatField;
    chBoxProverka: TCheckBox;
    sBtnObjClear: TSpeedButton;
    sBtnKatPClear: TSpeedButton;
    sBtnSpzClear: TSpeedButton;
    qryNU: TQuery;
    GroupBox4: TGroupBox;
    rBtnSch01: TRadioButton;
    rBtnSch02: TRadioButton;
    rBtnSch03: TRadioButton;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnObjClick(Sender: TObject);
    procedure sBtnObjClearClick(Sender: TObject);
    procedure sBtnKatPClick(Sender: TObject);
    procedure sBtnKatPClearClick(Sender: TObject);
    procedure sBtnSpzClick(Sender: TObject);
    procedure sBtnSpzClearClick(Sender: TObject);
    procedure bBtnOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    n_KdSps : integer;
    d_DtProc : TDateTime;
  public
    { Public declarations }
  end;

function VuborOKS(nKdSps : integer; dDtProc : TDateTime) : boolean;

const SECTION = 'z_VbOKS';

var
  FormVbOKS: TFormVbOKS;

implementation

uses a_Const, z_Main, z_DM, z_TObj, z_GtPers, a_SBU, z_VdMsg0, z_MkVed;

{$R *.dfm}

//------------------------------------------------------------------------------
function VuborOKS(nKdSps : integer; dDtProc : TDateTime) : boolean;
begin
  Result := false;
  FormVbOKS := TFormVbOKS.Create(Application);
  with FormVbOKS do begin
    n_KdSps := nKdSps;
    d_DtProc := dDtProc;
    lbxObj.Clear;
    lbxKatP.Clear;
    lbxSpz.Clear;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.FormCreate(Sender: TObject);
var nSovmCase, nSchemeCase : word;
begin
  Caption := 'Задание на формирование ведомости';
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 100);
    nSovmCase := ReadInteger(SECTION, 'nSovmCase', 1);
    nSchemeCase := ReadInteger(SECTION, 'nSchCase', 3);
    chBoxProverka.Checked := ReadBool(SECTION, 'bCheck', true);
    Free;
  end;
  if nSovmCase = 2 then
    rBtnSovmNo.Checked := true
  else if nSovmCase = 3 then
    rBtnSovmYes.Checked := true
  else
    rBtnSovmAll.Checked := true;
  if nSchemeCase = 1 then
    rBtnSch01.Checked := true
  else if nSchemeCase = 2 then
    rBtnSch02.Checked := true
  else
    rBtnSch03.Checked := true;
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if rBtnSovmNo.Checked then
      WriteInteger(SECTION, 'nSovmCase', 2)
    else if rBtnSovmYes.Checked then
      WriteInteger(SECTION, 'nSovmCase', 3)
    else
      WriteInteger(SECTION, 'nSovmCase', 1);
    if rBtnSch01.Checked then
      WriteInteger(SECTION, 'nSchCase', 1)
    else if rBtnSch02.Checked then
      WriteInteger(SECTION, 'nSchCase', 2)
    else
      WriteInteger(SECTION, 'nSchCase', 3);
    WriteBool(SECTION, 'bCheck', chBoxProverka.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.sBtnObjClick(Sender: TObject);
var nKdSps, nKdObj : integer; mLstObj : TStringList; bWasUpdated : boolean;
begin
  nKdSps := nAppKdSpsUsr;
  nKdObj := 0;
  mLstObj := TStringList.Create;
(*
  if NaborObj(nKdSps, nKdObj, mLstObj, bWasUpdated) {z_TObj} then begin
    LbxObj.Clear;
    LbxObj.Items.Assign(mLstObj);
    if LbxObj.Items.Count > 0 then
      sBtnObj.Font.Style := [fsBold]
    else
      sBtnObj.Font.Style := [];
  end;
*)
  mLstObj.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.sBtnObjClearClick(Sender: TObject);
begin
  LbxObj.Clear;
  if LbxObj.Items.Count > 0 then
    sBtnObj.Font.Style := [fsBold]
  else
    sBtnObj.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer;
begin
  nKdKatP := 0;
  if NaborKatPers(nKdKatP, LbxKatP.Items) {z_GtPers} then begin
  end;
  if LbxKatP.Items.Count > 0 then
    sBtnKatP.Font.Style := [fsBold]
  else
    sBtnKatP.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.sBtnKatPClearClick(Sender: TObject);
begin
  LbxKatP.Clear;
  if LbxKatP.Items.Count > 0 then
    sBtnKatP.Font.Style := [fsBold]
  else
    sBtnKatP.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.sBtnSpzClick(Sender: TObject);
var nKdSbu : integer; mLstSpz : TStringList;
begin
  nKdSbu := 0;
  mLstSpz := TStringList.Create;
  if NaborSBU(nKdSBU, mLstSpz) {a_SBU} then begin
    LbxSpz.Clear;
    LbxSpz.Items.Assign(mLstSpz);
    if LbxSpz.Items.Count > 0 then
      sBtnSpz.Font.Style := [fsBold]
    else
      sBtnSpz.Font.Style := [];
  end;
  mLstSpz.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.sBtnSpzClearClick(Sender: TObject);
begin
  LbxSpz.Clear;
  if LbxSpz.Items.Count > 0 then
    sBtnSpz.Font.Style := [fsBold]
  else
    sBtnSpz.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.bBtnOkClick(Sender: TObject);
var nCaseSovm, nCaseScheme : integer;
begin
  // Надо уточнять с Ольгой, что понимать:
  // 1 - Под "выбрать по KdObj" -
  //        понимаем - те которые оказались в текущем месяце в списке
  //          выбранного KdObj, независимо от какого KdObj ему начислены деньги
  // 2 - под "выбрать по KatP" -
  //        понимаем - выбрать из Z_SPS текущего месяца
  //          сотрудников с заданными КатПерс
  // 3 - под "выбрать по СБУ" -  (пока ничего не сообразю)
  //        пока пробую понимать - выбрать из NU начисления с указанными СБУ
  if bFlagDbg then begin
    LbxObj.Items.SaveToFile(cDirVids + 'VbVdObj.lbx');
    LbxKatP.Items.SaveToFile(cDirVids + 'VbVdKatP.lbx');
    LbxSpz.Items.SaveToFile(cDirVids + 'VbVdSbu.lbx');
  end;
  if rBtnSovmYes.Checked then
    nCaseSovm := 3
  else if rBtnSovmNo.Checked then
    nCaseSovm := 2
  else
    nCaseSovm := 1;
  if rBtnSch01.Checked then
    nCaseScheme := 1
  else if rBtnSch02.Checked then
    nCaseScheme := 2
  else
    nCaseScheme := 3;                                 {z_MkVed}
  MakeVed(d_DtProc, LbxObj, LbxKatP, LbxSpz, n_KdSps, nCaseSovm, nCaseScheme);
end;
//------------------------------------------------------------------------------
procedure TFormVbOKS.SpeedButton1Click(Sender: TObject);
begin
  ShowVedMsg00;  {z_VdMsg0}
end;

end.
