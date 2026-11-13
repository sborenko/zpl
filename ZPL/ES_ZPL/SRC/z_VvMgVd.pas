unit z_VvMgVd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB, Grids,
  DBGrids, DBClient, ComCtrls, DBTables;

type
  String4 = string[4];
  String15 = string[15];
  TFormVvSpsDlg = class(TForm)
    cdsObj: TClientDataSet;
    cdsKatP: TClientDataSet;
    dsrcObj: TDataSource;
    dsrcKatP: TDataSource;
    cdsKatPNR: TAutoIncField;
    cdsKatPKdKatP: TSmallintField;
    cdsKatPShKatP: TStringField;
    cdsKatPNmKatP: TStringField;
    cdsObjNR: TAutoIncField;
    cdsObjKdObj: TIntegerField;
    cdsObjShObj: TStringField;
    cdsObjNmObj: TStringField;
    cdsObjAIndx: TIntegerField;
    cdsObjPIndx: TIntegerField;
    cdsObjLvl: TIntegerField;
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    cdsTmpVidN: TStringField;
    cdsTmpShVidN: TStringField;
    cdsTmpSmPrc: TFloatField;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    PanelBottom: TPanel;
    SplitterObjKatP: TSplitter;
    dbgrKatP: TDBGrid;
    dbgrObj: TDBGrid;
    LbxFilter: TListBox;
    Label1: TLabel;
    sBtnObj: TSpeedButton;
    sBtnObjClear: TSpeedButton;
    Label2: TLabel;
    sBtnKatP: TSpeedButton;
    sBtnKatPClear: TSpeedButton;
    Panel1: TPanel;
    bBtnCancel1: TBitBtn;
    sBtnNext1: TSpeedButton;
    Panel2: TPanel;
    sBtnNext2: TSpeedButton;
    bBtnCancel2: TBitBtn;
    sBtnBack2: TSpeedButton;
    Panel3: TPanel;
    sBtnNext3: TSpeedButton;
    sBtnBack3: TSpeedButton;
    bBtnCancel3: TBitBtn;
    Panel4: TPanel;
    sBtnBack4: TSpeedButton;
    bBtnCancel: TBitBtn;
    bBtnOk: TBitBtn;
    PanelTs2: TPanel;
    grBoxSumma: TGroupBox;
    rBtnEmpty: TRadioButton;
    rBtnPrcVida: TRadioButton;
    rBtnPrcOkl: TRadioButton;
    rBtnConstSum: TRadioButton;
    grBoxVidSredstv: TGroupBox;
    rBtnVsBudget: TRadioButton;
    rBtnVsSpecSr: TRadioButton;
    Label3: TLabel;
    rBtnVvodOtkl: TRadioButton;
    PanelSumVid: TPanel;
    LabelVidN: TLabel;
    dbeVidN: TDBEdit;
    dbeShVidN: TDBEdit;
    sBtnVidN: TSpeedButton;
    LabelSmPrc: TLabel;
    dbeSmPrc: TDBEdit;
    PanelDopOtkl: TPanel;
    Label6: TLabel;
    dbeShObjOtkl: TDBEdit;
    sBtnObjOtkl: TSpeedButton;
    Label7: TLabel;
    dbeKatPOtkl: TDBEdit;
    sBtnKatPOtkl: TSpeedButton;
    Label8: TLabel;
    dbeSPZOtkl: TDBEdit;
    sBtnSpzOtkl: TSpeedButton;
    DBComboZaMesGodOtkl: TDBComboBox;
    dbeDtBegOtkl: TDBEdit;
    dbeDtEndOtkl: TDBEdit;
    dbeChasOtkl: TDBEdit;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeSummaOtkl: TDBEdit;
    dbePdNOtkl: TDBEdit;
    dbeNotesOtkl: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cdsTmpVidNOtkl: TStringField;
    cdsTmpShVidNOtkl: TStringField;
    cdsTmpKdKatPOtkl: TSmallintField;
    cdsTmpShKatPOtkl: TStringField;
    cdsTmpKdSpzOtkl: TSmallintField;
    cdsTmpSchBuOtkl: TStringField;
    cdsTmpZaMesGodOtkl: TDateField;
    cdsTmpDt_BegOtkl: TDateField;
    cdsTmpDt_EndOtkl: TDateField;
    cdsTmpSummaOtkl: TFloatField;
    cdsTmpPdnOtkl: TSmallintField;
    cdsTmpNotesOtkl: TStringField;
    Label15: TLabel;
    cdsTmpKdObjOtkl: TSmallintField;
    cdsTmpShObjOtkl: TStringField;
    cdsTmpChasOtkl: TFloatField;
    Label16: TLabel;
    sBtnObjOtklClear: TSpeedButton;
    sBtnKatPOtklClear: TSpeedButton;
    sBtnSpzOtklClear: TSpeedButton;
    dbeVidNOtkl: TDBEdit;
    dbeShVidNOtkl: TDBEdit;
    sBtnVidNOtkl: TSpeedButton;
    Label17: TLabel;
    qryTmp: TQuery;
    dbgrOtkl: TDBGrid;
    cdsOtkl: TClientDataSet;
    dsrcOtkl: TDataSource;
    cdsOtklNR: TAutoIncField;
    cdsOtklKdSps: TSmallintField;
    cdsOtklDtProc: TDateField;
    cdsOtklZaMesGod: TDateField;
    cdsOtklTabN: TIntegerField;
    cdsOtklVidN: TStringField;
    cdsOtklChas: TFloatField;
    cdsOtklSumma: TFloatField;
    cdsOtklKdObj: TSmallintField;
    cdsOtklKdKatP: TSmallintField;
    cdsOtklDt_Beg: TDateField;
    cdsOtklDt_End: TDateField;
    cdsOtklPdN: TSmallintField;
    cdsOtklKdSpZ: TSmallintField;
    cdsOtklKdPSCH: TSmallintField;
    cdsOtklNotes: TStringField;
    Label4: TLabel;
    rBtnPrcByNU: TRadioButton;
    rBtnVsBoth: TRadioButton;
    Label18: TLabel;
    Label19: TLabel;
    procedure sBtnObjClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnKatPClick(Sender: TObject);
    procedure sBtnObjClearClick(Sender: TObject);
    procedure sBtnKatPClearClick(Sender: TObject);
    procedure rBtnClick(Sender: TObject);
    procedure dbeEnter(Sender: TObject);
    procedure dbeVidNExit(Sender: TObject);
    procedure dbeSmPrcExit(Sender: TObject);
    procedure sBtnVidNClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PageControl1Resize(Sender: TObject);
    procedure sBtnNext1Click(Sender: TObject);
    procedure sBtnBack2Click(Sender: TObject);
    procedure sBtnNext2Click(Sender: TObject);
    procedure sBtnNext3Click(Sender: TObject);
    procedure sBtnBack4Click(Sender: TObject);
    procedure sBtnBack3Click(Sender: TObject);
    procedure sBtnObjOtklClick(Sender: TObject);
    procedure sBtnKatPOtklClick(Sender: TObject);
    procedure sBtnSpzOtklClick(Sender: TObject);
    procedure sBtnObjOtklClearClick(Sender: TObject);
    procedure sBtnKatPOtklClearClick(Sender: TObject);
    procedure sBtnSpzOtklClearClick(Sender: TObject);
    procedure sBtnVidNOtklClick(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure DBComboZaMesGodOtklEnter(Sender: TObject);
    procedure DBComboZaMesGodOtklExit(Sender: TObject);
    procedure cdsTmpZaMesGodOtklSetText(Sender: TField; const Text: String);
    procedure cdsTmpZaMesGodOtklValidate(Sender: TField);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure cdsTmpDt_EndOtklValidate(Sender: TField);
    procedure cdsTmpDt_BegOtklValidate(Sender: TField);
    procedure dbeVidNOtklExit(Sender: TObject);
    procedure cdsTmpVidNOtklValidate(Sender: TField);
  private
    { Private declarations }
    nHeight, nHeightDlg, nHeightPanelBott, n_KdSps, n_KdUsr, n_NrVed : integer;
    c_VidN, c_KEKV : String4;
    c_ShVidN : String15;
    d_DtPrc, d_DtVed : TDateTime;
    bOtklNewRec, bOtklVvodInZaMesGod,
                 bOtklVvodInDtBeg, bOtklVvodInDtEnd : boolean;
    procedure SetSumCase;
    function CheckVvod : boolean;
    function CheckVvod2 : boolean;
    procedure SetPanelTs2Place;
{
    procedure AddCdsOtklRecord(nTabN : integer;
                          nKdSps, nKdObj, nKdKatP, nKdSpZ : SmallInt;
                          dDtProc, dZaMesGod : TDateTime;
                          cVidN : String4;  cDtBeg, cDtEnd,
                                 cChas, cSumma, cPdN, cNotes : ShortString);
}
  public
    { Public declarations }
  end;

function VvSpsDlg(nKdSps, nKdUsr, nNrVed : integer; dDtVed, dDtPrc : TDateTime;
                            mLstObj, mLstKatP : TStringList;
                               var cVidN : string4; var nSmPrc : double;
                                                var nSumCase : word) : boolean;

const SECTION = 'z_VvMgVd';

var
  FormVvSpsDlg: TFormVvSpsDlg;

implementation

uses a_Const, a_Lib, z_Main, z_DM, z_TObj, z_GtPers, A_SBU, z_TVids,
     A_ShwErr, z_VvMvOt;

{$R *.dfm}

//------------------------------------------------------------------------------
function VvSpsDlg(nKdSps, nKdUsr, nNrVed : integer; dDtVed, dDtPrc : TDateTime;
                            mLstObj, mLstKatP : TStringList;
                               var cVidN : string4; var nSmPrc : double;
                                                var nSumCase : word) : boolean;
var cZaMesGod : shortString; n : integer;
begin
  Result := false;
  FormVvSpsDlg := TFormVvSpsDlg.Create(Application);
  with FormVvSpsDlg do begin
    d_DtPrc := dDtPrc;
    n_KdSps := nKdSps;
    n_KdUsr := nKdUsr;
    n_NrVed := nNrVed;
    d_DtVed := dDtVed;
    cdsTmp.FieldByName('PdnOtkl').AsInteger := 1;
    cdsTmp.FieldByName('ZaMesGodOtkl').AsDateTime := d_DtPrc;
    cZaMesGod := Copy(DateToStr(d_DtPrc), 4, 7);
    n := DBComboZaMesGodOtkl.Items.IndexOf(cZaMesGod);
    if n >= 0 then
      DBComboZaMesGodOtkl.ItemIndex := n;
    Caption := 'Задание для ведомости';
    if ShowModal = mrOk then begin
      if rBtnEmpty.Checked or rBtnConstSum.Checked or
                         rBtnPrcOkl.Checked or rBtnPrcByNU.Checked or
                                                rBtnPrcVida.Checked then begin
        if cdsObj.Active and (cdsObj.RecordCount > 0) then with cdsObj do begin
          First;
          while not Eof do begin
            mLstObj.Add(FieldByName('KdObj').AsString);
            Next;
          end;
        end;
        if cdsKatP.Active and (cdsKatP.RecordCount > 0) then with cdsKatP do begin
          First;
          while not Eof do begin
            mLstKatP.Add(FieldByName('KdKatP').AsString);
            Next;
          end;
        end;
        cVidN := cdsTmp.FieldByName('VidN').AsString;
        nSmPrc := cdsTmp.FieldByName('SmPrc').AsFloat;
        if rBtnEmpty.Checked then
          nSumCase := 1
        else if rBtnConstSum.Checked then
          nSumCase := 2
        else if rBtnPrcOkl.Checked then
          nSumCase := 3
        else if rBtnPrcByNU.Checked then
          nSumCase := 4
        else
          nSumCase := 5;
        Result := true; end
      else if rBtnVvodOtkl.Checked then begin
        nSumCase := 6;
        Result := true;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnNext2Click(Sender: TObject);
var cSQL, cZaMG, cChasOtkl, cSummaOtkl,
    cDtBegOtkl, cDtEndOtkl, cVidNOtkl, cPdnOtkl, cNotesOtkl : string;
    i : integer;
begin
  grBoxSumma.SetFocus;
  if (rBtnVvodOtkl.Checked) and (not CheckVvod2) then
    Exit;
  // Если выбраны варианты "Сумма к выплате" с 1-го по 5-й, заполняю
  // mLstObj, mLstKatP, cVidN, nSmPrc, nSumCase и возвращаюсь в z_MegVed
  if rBtnEmpty.Checked or rBtnConstSum.Checked or
               rBtnPrcOkl.Checked or rBtnPrcByNu.Checked or
                                        rBtnPrcVida.Checked then begin
    ModalResult := mrOk;
    Exit;
  end;
  // Если выбран 6-й вариант: Создать временную таблицу отклонений по заданным
  // KdObj, KdKatP создать список, ввести в него заданное отклонение,
  // просчитать, выбрать начисленные суммы, показать результат и,
  // если ОК - подключить в ведомость.
  with cdsOtkl do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  cSQL := 'Select S.TabN as S_TABN, s.KdObj as s_KdObj, ' +
          ' s.KdSps as s_KdSps, P.* from Z_SPS S ' +
          ' Left Outer join GET_PERE(S.TabN, S.DtProc) p on 1 = 1' +
          ' where s.DtProc = :d_DtPrc ';
  if cdsObj.Active and (cdsObj.RecordCount > 0) then with cdsObj do begin
    First;
    i := 0;
    cSQL := cSQL + ' and s.KdObj in (';
    while not Eof do begin
      cSQL := cSQL + FieldByName('KdObj').AsString;
      Inc(i);
      if i < RecordCount then
        cSQL := cSQL + ', ';
      Next;
    end;
    cSQL := cSQL + ')';
  end;
  if cdsKatP.Active and (cdsKatP.RecordCount > 0) then with cdsKatP do begin
    First;
    i := 0;
    cSQL := cSQL + ' and s.KdKatP in (';
    while not Eof do begin
      cSQL := cSQL + FieldByName('KdKatP').AsString;
      Inc(i);
      if i < RecordCount then
        cSQL := cSQL + ', ';
      Next;
    end;
    cSQL := cSQL + ')';
  end;
  if MakeMegVedOtkl(n_KdUsr, n_NrVed, d_DtVed,
                    cdsTmp.FieldByName('VidN').AsString,
                    cdsTmp.FieldByName('VidNOtkl').AsString,
                    d_DtPrc, cSQL, IntToStr(n_KdSps),
                    cdsTmp.FieldByName('KdObjOtkl').AsString,
                    cdsTmp.FieldByName('KdKatPOtkl').AsString,
                    cdsTmp.FieldByName('KdSpZOtkl').AsString,
                    cdsTmp.FieldByName('ZaMesGodOtkl').AsString,
                   cdsTmp.FieldByName('Dt_BegOtkl').AsString,
                  cdsTmp.FieldByName('Dt_EndOtkl').AsString,
                 cdsTmp.FieldByName('ChasOtkl').AsString,
                cdsTmp.FieldByName('SummaOtkl').AsString,
               cdsTmp.FieldByName('PdnOtkl').AsString,
              cdsTmp.FieldByName('NotesOtkl').AsString) {z_VvMvOt} then begin
    // вернуть в z_MegVed вказивку: ведомость создана и нужно переоткрыть qryVed

    ModalResult := mrOk;
  end;
//  PageControl1.ActivePage := ts3;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnObjClick(Sender: TObject);
var nKdSps, nKdObj : integer; bWasUpdated : boolean;
begin
  nKdSps := nAppKdSpsUsr;
  nKdObj := 0;
  with cdsObj do begin
    if not Active then begin
      CreateDataSet;
      Open;
      IndexName := 'cdsObjOnKdObj';
    end;
  end;
  if VuborObj(nKdSps, nKdObj, cdsObj, bWasUpdated) {z_TObj} then begin
  end;
  if cdsObj.Active and (cdsObj.RecordCount > 0) then
    sBtnObj.Font.Style := [fsBold]
  else
    sBtnObj.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer;
begin
  nKdKatP := 0;
  with cdsKatP do begin
    if not Active then begin
      CreateDataSet;
      IndexName := 'cdsKatPOnKdKatP';
      Open;
    end;
  end;
  if Nabor2KatPers(nKdKatP, cdsKatP) {z_GtPers} then begin
  end;
  if cdsKatP.Active and (cdsKatP.RecordCount > 0) then
    sBtnKatP.Font.Style := [fsBold]
  else
    sBtnKatP.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.FormCreate(Sender: TObject);
var nRBtn, nVidSredstv : word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    dbgrKatP.Height  := ReadInteger(SECTION, 'grKatPH', 125);
    Height   := ReadInteger(SECTION, 'wH', 580);
    nRBtn    := ReadInteger(SECTION, 'nRBtn', 1);
    nVidSredstv := ReadInteger(SECTION, 'nVS', 1);
    c_VidN   := ReadString(SECTION, 'cVidN', '');
    c_ShVidN := ReadString(SECTION, 'cShVidN', '');
    Free;
  end;
  bOtklNewRec := false;
  bOtklVvodInZaMesGod := false;
  bOtklVvodInDtBeg := false;
  bOtklVvodInDtEnd := false;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  ts3.TabVisible := false;
  ts4.TabVisible := false;
  PageControl1.ActivePage := ts1;
  PanelDopOtkl.Top := PanelSumVid.Top;
  PanelTs2.Height := 415;
  if FileExists(cDirVids + 'CmboZaMG.lbx') then
    dbComboZaMesGodOtkl.Items.LoadFromFile(cDirVids + 'CmboZaMG.lbx');
  if FileExists(cDirVids + 'vvmgvd1.vid') then
    dbgrObj.Columns.LoadFromFile(cDirVids + 'vvmgvd1.vid');
  if FileExists(cDirVids + 'vvmgvd2.vid') then
    dbgrKatP.Columns.LoadFromFile(cDirVids + 'vvmgvd2.vid');
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
  end;
  rBtnVsBoth.Enabled := false;
  if nVidSredstv = 1 then
    rBtnVsBudget.Checked := true
  else if nVidSredstv = 2 then
    rBtnVsSpecSr.Checked := true
  else
    rBtnVsBoth.Checked := true;
  if nRBtn = 1 then
    rBtnEmpty.Checked := true
  else if nRBtn = 2 then
    rBtnConstSum.Checked := true
  else if nRBtn = 3 then
    rBtnPrcOkl.Checked := true
  else if nRBtn = 4 then
    rBtnPrcByNU.Checked := true
  else if nRBtn = 5 then
    rBtnPrcVida.Checked := true
  else
    rBtnVvodOtkl.Checked := true;
  SetSumCase;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrObj.Columns.SaveToFile(cDirVids + 'vvmgvd1.vid');
  dbgrKatP.Columns.SaveToFile(cDirVids + 'vvmgvd2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteString(SECTION, 'c_VidN', c_VidN);
    WriteString(SECTION, 'c_ShVidN', c_ShVidN);
    if PanelBottom.Visible then begin
      WriteInteger(SECTION, 'wHBott', PanelBottom.Height);
      WriteInteger(SECTION, 'grKatPH', dbgrKatP.Height);
    end;
    if rBtnVsBudget.Checked then
      WriteInteger(SECTION, 'nVS', 1)
    else if rBtnVsSpecSr.Checked then
      WriteInteger(SECTION, 'nVS', 2)
    else
      WriteInteger(SECTION, 'nVS', 3);
    if rBtnEmpty.Checked then
      WriteInteger(SECTION, 'nRBtn', 1)
    else if rBtnConstSum.Checked then
      WriteInteger(SECTION, 'nRBtn', 2)
    else if rBtnPrcOkl.Checked then
      WriteInteger(SECTION, 'nRBtn', 3)
    else if rBtnPrcByNU.Checked then
      WriteInteger(SECTION, 'nRBtn', 4)
    else if rBtnPrcVida.Checked then
      WriteInteger(SECTION, 'nRBtn', 5)
    else
      WriteInteger(SECTION, 'nRBtn', 6);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnObjClearClick(Sender: TObject);
begin
  if cdsObj.Active and (cdsObj.RecordCount > 0) then with cdsObj do begin
    DisableControls;
    First;
    while not Eof do begin
      Delete;
    end;
    EnableControls;
  end;
  sBtnObj.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnKatPClearClick(Sender: TObject);
begin
  if cdsKatP.Active and (cdsKatP.RecordCount > 0) then with cdsKatP do begin
    DisableControls;
    First;
    while not Eof do begin
      Delete;
    end;
    EnableControls;
  end;
  sBtnKatP.Font.Style := [];
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.rBtnClick(Sender: TObject);
begin
  SetSumCase;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.dbeVidNOtklExit(Sender: TObject);
begin
  dbeVidN.Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.cdsTmpVidNOtklValidate(Sender: TField);
var cDummy, cShVidN : string; cVidN : string4;
begin
  cVidN := cdsTmpVidNOtkl.AsString;
  if ((cVidN >= '2400') and (cVidN < '2500')) {отпускные} or
          ((cVidN >= '2600') and (cVidN < '2700')) {больничнные} then
    Raise Exception.Create('Не предусмотрен ввод отпускных или больничных')
  else begin
    cShVidN := DmMain.VidN2ShVidN(cVidN, cDummy);
    cdsTmpShVidNOtkl.AsString := cShVidN;
  end;
end;


//  dbeShVidN.Field.AsString :=
//                        DmMain.VidN2ShVidN(dbeVidN.Field.AsString, cDummy);
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.dbeVidNExit(Sender: TObject);
begin
  if rBtnEmpty.Checked or rBtnPrcOkl.Checked then
    (Sender as TDBEdit).Color := clBtnFace
  else
    (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.dbeSmPrcExit(Sender: TObject);
begin
  if rBtnEmpty.Checked then
    (Sender as TDBEdit).Color := clBtnFace
  else
    (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.SetSumCase;
begin
  dbeVidN.Enabled    := false;
  dbeShVidN.Enabled  := false;
  dbeSmPrc.Enabled   := false;
  LabelVidN.Enabled  := false;
  LabelSmPrc.Enabled := false;
  sBtnVidN.Enabled   := false;
  dbeVidN.Color      := clBtnFace;
  dbeShVidN.Color    := clBtnFace;
  dbeSmPrc.Color     := clBtnFace;
  cdsTmp.FieldByName('VidN').AsString := '';
  cdsTmp.FieldByName('ShVidN').AsString := '';
  cdsTmp.FieldByName('SmPrc').AsString := '';
  PanelDopOtkl.Visible := false;
  PanelSumVid.Visible := true;
  if rBtnConstSum.Checked then begin
    dbeVidN.Enabled    := false;
    dbeShVidN.Enabled  := false;
    dbeSmPrc.Enabled   := true;
    LabelVidN.Enabled  := false;
    LabelSmPrc.Enabled := true;
    sBtnVidN.Enabled   := false;
    dbeVidN.Color      := clBtnFace;
    dbeShVidN.Color    := clBtnFace;
    dbeSmPrc.Color     := clWindow;
    LabelSmPrc.Caption := 'Задайте единую сумму для колонки:';
    cdsTmp.FieldByName('SmPrc').AsString := ''; end
  else if rBtnPrcVida.Checked then begin
    dbeVidN.Enabled    := true;
    dbeShVidN.Enabled  := true;
    dbeSmPrc.Enabled   := true;
    LabelVidN.Enabled  := true;
    LabelSmPrc.Enabled := true;
    sBtnVidN.Enabled   := true;
    dbeVidN.Color      := clWindow;
    dbeShVidN.Color    := clWindow;
    dbeSmPrc.Color     := clWindow;
    LabelSmPrc.Caption := 'Задайте процент от суммы по виду:';
    cdsTmp.FieldByName('VidN').AsString := c_VidN;
    cdsTmp.FieldByName('ShVidN').AsString := c_ShVidN;
    cdsTmp.FieldByName('SmPrc').AsFloat := 100; end
  else if rBtnPrcOkl.Checked then begin
    dbeVidN.Enabled    := false;
    dbeShVidN.Enabled  := false;
    dbeSmPrc.Enabled   := true;
    LabelVidN.Enabled  := false;
    LabelSmPrc.Enabled := true;
    sBtnVidN.Enabled   := false;
    dbeVidN.Color      := clBtnFace;
    dbeShVidN.Color    := clBtnFace;
    dbeSmPrc.Color     := clWindow;
    LabelSmPrc.Caption := 'Задайте процент от оклада:';
    cdsTmp.FieldByName('SmPrc').AsFloat := 50; end
  else if rBtnPrcByNU.Checked then begin
    dbeVidN.Enabled    := false;
    dbeShVidN.Enabled  := false;
    dbeSmPrc.Enabled   := true;
    LabelVidN.Enabled  := false;
    LabelSmPrc.Enabled := true;
    sBtnVidN.Enabled   := false;
    dbeVidN.Color      := clBtnFace;
    dbeShVidN.Color    := clBtnFace;
    dbeSmPrc.Color     := clWindow;
    LabelSmPrc.Caption := 'Задайте процент от начисленных сумм:';
    cdsTmp.FieldByName('SmPrc').AsFloat := 50; end
  else if rBtnVvodOtkl.Checked then begin
    PanelSumVid.Visible := false;
    PanelDopOtkl.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnVidNClick(Sender: TObject);
var cDum : string; cDum1 : string1;
    nDum : integer; bWasUpdated : boolean;
begin
  dbeShVidN.SetFocus;
  with cdsTmp do begin
    c_VidN := FieldByName('VidN').AsString;
    if GetVidN(c_VidN, c_KEKV, c_ShVidN, cDum, cDum1, cDum1, cDum1, cDum1, cDum1,
                  cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1,
                  cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1,
                  cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1,
                          nDum, bWasUpdated, LbxFilter) {z_TVids} then begin
      FieldByName('VidN').AsString := c_VidN;
      FieldByName('ShVidN').AsString := c_ShVidN;
      dbeSmPrc.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormVvSpsDlg.CheckVvod : boolean;
var mListErr : TStringList; cVidN : string4;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if rBtnConstSum.Checked and
           (cdsTmp.FieldByName('SmPrc').IsNull or
                   (cdsTmp.FieldByName('SmPrc').AsFloat <= 0)) then
    mListErr.Add('Заказаная единая сумма для всех не корректна');
  if rBtnPrcOkl.Checked and
           (cdsTmp.FieldByName('SmPrc').IsNull or
                   (cdsTmp.FieldByName('SmPrc').AsFloat <= 0)) then
    mListErr.Add('Заказаный процент от оклада не корректный');
  if rBtnPrcByNU.Checked and
           (cdsTmp.FieldByName('SmPrc').IsNull or
                   (cdsTmp.FieldByName('SmPrc').AsFloat <= 0)) then
    mListErr.Add('Заказаный процент от начислений не корректный');
  if rBtnPrcVida.Checked and
           (cdsTmp.FieldByName('VidN').IsNull or
                   (cdsTmp.FieldByName('VidN').AsString = '')) then
    mListErr.Add('Нет вида для выборки');
  if rBtnPrcVida.Checked and
           (cdsTmp.FieldByName('SmPrc').IsNull or
                   (cdsTmp.FieldByName('SmPrc').AsFloat <= 0)) then
    mListErr.Add('Не введен процент для выборки по виду');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      bBtnOk.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.PageControl1Resize(Sender: TObject);
begin
  SetPanelTs2Place;
//  PanelTs2.Top := Round((ts2.Height - Panelts2.Height) / 2) - 20;  // 10;
//  PanelTs2.Left := Round((ts2.Width - Panelts2.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.SetPanelTs2Place;
begin
  PanelTs2.Top := Round((ts2.Height - Panelts2.Height) / 2) - 20;  // 10;
  PanelTs2.Left := Round((ts2.Width - Panelts2.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnNext1Click(Sender: TObject);
begin
  SetPanelTs2Place;
  PageControl1.ActivePage := ts2;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnBack2Click(Sender: TObject);
begin
  PageControl1.ActivePage := ts1;
end;
(*
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.AddCdsOtklRecord(nTabN : integer;
                          nKdSps, nKdObj, nKdKatP, nKdSpZ : SmallInt;
                          dDtProc, dZaMesGod : TDateTime;
                          cVidN : String4;  cDtBeg, cDtEnd,
                                 cChas, cSumma, cPdN, cNotes : ShortString);
begin
  with cdsOtkl do begin
    Append;
    FieldByName('TabN').AsInteger := nTabN;
    FieldByName('KdSps').AsInteger := nKdSps;
    FieldByName('KdObj').AsInteger := nKdObj;
    FieldByName('KdKatP').AsInteger := nKdKatP;
    FieldByName('KdSpZ').AsInteger := nKdSpZ;
    FieldByName('DtProc').AsDateTime := dDtProc;
    FieldByName('ZaMesGod').AsDateTime := dZaMesGod;
    FieldByName('VidN').AsString := cVidN;
    FieldByName('Dt_Beg').AsString := cDtBeg;
    FieldByName('Dt_End').AsString := cDtEnd;
    FieldByName('Chas').AsString := cChas;
    FieldByName('Summa').AsString := cSumma;
    FieldByName('PdN').AsString := cPdN;
    FieldByName('Notes').AsString := cNotes;
    Post;
  end;
end;
*)
//------------------------------------------------------------------------------
function TFormVvSpsDlg.CheckVvod2 : boolean;
var mListErr : TStringList; cVidN : string4;
begin
  // Проверка только для случая rBtnVvodOtkl.Checked - ввод отклонения
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if cdsTmp.FieldByName('VidNOtkl').IsNull then
    mListErr.Add('Не выбран вид начисления по отклонению');
  // Надо сделать проверку для дат начала и конца (смотря для каких видов)
  if cdsTmp.FieldByName('SummaOtkl').IsNull then
    mListErr.Add('Не введена сумма отклонения')
  else if cdsTmp.FieldByName('SummaOtkl').AsFloat <= 0 then
    mListErr.Add('Нужна положительная сумма болше нуля');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnBack3Click(Sender: TObject);
begin
  PageControl1.ActivePage := ts2;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnNext3Click(Sender: TObject);
begin
  PageControl1.ActivePage := ts4;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnBack4Click(Sender: TObject);
begin
  PageControl1.ActivePage := ts3;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnVidNOtklClick(Sender: TObject);
var cDum : string; cVidN, cKEKV : string4; cShVidN : string15; cDum1 : string1;
    nDum : integer; bWasUpdated : boolean;
begin
  dbeShVidNOtkl.SetFocus;
  with cdsTmp do begin
    cVidN := FieldByName('VidNOtkl').AsString;
    if GetVidN(cVidN, cKEKV, cShVidN, cDum, cDum1, cDum1, cDum1, cDum1, cDum1,
                  cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1,
                  cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1,
                  cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1, cDum1,
                          nDum, bWasUpdated, LbxFilter) {z_TVids} then begin
      FieldByName('VidNOtkl').AsString := cVidN;
      FieldByName('ShVidNOtkl').AsString := cShVidN;
      dbeShObjOtkl.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnObjOtklClick(Sender: TObject);
var nKdObj : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  dbeShObjOtkl.SetFocus;
  nKdObj := cdsTmp.FieldByName('KdObjOtkl').AsInteger;
  if GetKdObj(nKdSps, nKdObj, cShObj, cNmObj, bWasUpdated) {z_TObj} then begin
    cdsTmp.FieldByName('KdObjOtkl').AsInteger := nKdObj;
    cdsTmp.FieldByName('ShObjOtkl').AsString := cShObj;
    dbeKatPOtkl.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnObjOtklClearClick(Sender: TObject);
begin
  cdsTmp.FieldByName('KdObjOtkl').AsString := '';
  cdsTmp.FieldByName('ShObjOtkl').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnKatPOtklClick(Sender: TObject);
var nKdKatP : integer; cNmKatP, cShKatP : string;
begin
  dbeKatPOtkl.SetFocus;
  nKdKatP := cdsTmp.FieldByName('KdKatPOtkl').AsInteger;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {Z_GtPers} then begin
    cdsTmp.FieldByName('KdKatPOtkl').AsInteger := nKdKatP;
    cdsTmp.FieldByName('ShKatPOtkl').AsString := cShKatP;
    dbeSpzOtkl.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnKatPOtklClearClick(Sender: TObject);
begin
  cdsTmp.FieldByName('KdKatPOtkl').AsString := '';
  cdsTmp.FieldByName('ShKatPOtkl').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnSpzOtklClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSBU : string;
begin
  dbeSpzOtkl.SetFocus;
  with cdsTmp do begin
    nKdSPZ := FieldByName('KdSpzOtkl').AsInteger;
    cSchBU := FieldByName('SchBuOtkl').AsString;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSpzOtkl').AsInteger  := nKdSPZ;
      FieldByName('SchBuOtkl').AsString := cSchBU;
      DBComboZaMesGodOtkl.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.sBtnSpzOtklClearClick(Sender: TObject);
begin
  cdsTmp.FieldByName('KdSpzOtkl').AsString := '';
  cdsTmp.FieldByName('SchBuOtkl').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.DBComboZaMesGodOtklEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.DBComboZaMesGodOtklExit(Sender: TObject);
var dDtBeg, dDtEnd : TDateTime; nBudget : double;
    nY, nM, nD : word; nCntDay, nCntWorkDay : integer;
begin
  with cdsTmp do begin
    dDtBeg := FieldByName('ZaMesGodOtkl').AsDateTime;
    DecodeDate(dDtBeg, nY, nM, nD);
    nBudget := DmMain.Budget(nY, nM, nCurCntDay, nCurCntWorkDay);
    dDtEnd := MyLastDOM(dDtBeg);
    FieldByName('Dt_BegOtkl').AsDateTime := dDtBeg;
    FieldByName('Dt_EndOtkl').AsDateTime := dDtEnd;
    FieldByName('ChasOtkl').AsFloat := nBudget;
  end;
  (Sender as TDBComboBox).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.cdsTmpZaMesGodOtklSetText(Sender: TField;
                                                           const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyMesGod(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := '01-' + Text;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.cdsTmpZaMesGodOtklValidate(Sender: TField);
var dInputDate : TDateTime; nBudget : double; nY, nM, nD : word;
    nCntDay, nCntWorkDay : integer;
begin
  bOtklVvodInZaMesGod := true;
  dInputDate := Sender.AsDateTime;
  DecodeDate(dInputDate, nY, nM, nD);
  with cdsTmp do begin
    FieldByName('Dt_BegOtkl').AsDateTime := d_DtPrc;
    FieldByName('Dt_EndOtkl').AsDateTime := MyLastDOM(d_DtPrc);
    nBudget := DmMain.Budget(nY, nM, nCurCntDay, nCurCntWorkDay);
    FieldByName('ChasOtkl').AsFloat := nBudget;
  end;
  bOtklVvodInZaMesGod := false;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.DateFieldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.cdsTmpDt_BegOtklValidate(Sender: TField);
var dDtBeg, dDtEnd : TDateTime;
begin
  if bOtklNewRec or bOtklVvodInZaMesGod or bOtklVvodInDtEnd then
    Exit;
  bOtklVvodInDtBeg    := true;
  bOtklNewRec         := false;
  bOtklVvodInZaMesGod := false;
  bOtklVvodInDtEnd    := false;
  if (Sender.AsString = '') or
         (cdsTmp.FieldByName('Dt_EndOtkl').AsString = '') then
    cdsTmp.FieldByName('ChasOtkl').AsFloat := 0
  else with cdsTmp do begin
    dDtBeg := Sender.AsDateTime;
    if (dDtBeg > MyLastDOM(FieldByName('ZaMesGodOtkl').AsDateTime)) or
        (dDtBeg < MyFirstDOM(FieldByName('ZaMesGodOtkl').AsDateTime)) then
      Raise Exception.
              Create('Дата должна быть в пределах текущего месяца')
    else begin
      dDtEnd := FieldByName('Dt_EndOtkl').AsDateTime;
      FieldByName('ChasOtkl').AsFloat := DmMain.CountWorkChas(dDtBeg, dDtEnd);
    end;
  end;
  bOtklVvodInDtBeg := false;
end;
//------------------------------------------------------------------------------
procedure TFormVvSpsDlg.cdsTmpDt_EndOtklValidate(Sender: TField);
var dDtBeg, dDtEnd : TDateTime;
begin
  if bOtklNewRec or bOtklVvodInZaMesGod or bOtklVvodInDtBeg then
    Exit;
  bOtklVvodInDtEnd    := true;
  bOtklNewRec         := false;
  bOtklVvodInZaMesGod := false;
  bOtklVvodInDtBeg    := false;
  if (Sender.AsString = '') or
           (cdsTmp.FieldByName('Dt_BegOtkl').AsString = '') then
    cdsTmp.FieldByName('ChasOtkl').AsFloat := 0
  else with cdsTmp do begin
    dDtEnd := Sender.AsDateTime;
    if (dDtEnd > MyLastDOM(FieldByName('ZaMesGodOtkl').AsDateTime)) or
        (dDtEnd < MyFirstDOM(FieldByName('ZaMesGodOtkl').AsDateTime)) then
      Raise Exception.
              Create('Дата должна быть в пределах текущего месяца')
    else begin
      dDtBeg := FieldByName('Dt_BegOtkl').AsDateTime;
      FieldByName('ChasOtkl').AsFloat := DmMain.CountWorkChas(dDtBeg, dDtEnd);
    end;
  end;
  bOtklVvodInDtEnd := false;
end;

end.
