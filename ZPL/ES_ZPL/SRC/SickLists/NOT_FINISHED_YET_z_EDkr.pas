unit z_EDkr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, DBTables, IniFiles, ComCtrls, ExtCtrls,
  Buttons, Math, Mask, DBCtrls, Grids, DBGrids, Menus, DModSickPregn;

type
  String3 = string[3];
  String4 = string[4];

  TFormEDkr = class(TForm)
    dsrcVBln: TDataSource;
    qryTmp: TQuery;
    tblRBln: TTable;
    DsrcBlnResume: TDataSource;
    tblRBlnDtProc: TDateField;
    tblRBlnDtBeg: TDateField;
    tblRBlnDtEnd: TDateField;
    tblRBlnCntDays: TSmallintField;
    tblRBlnCntChas: TFloatField;
    tblRBlnSmm: TFloatField;
    tblRBlnNotes: TStringField;
    tblRBlnSpec_NR: TIntegerField;
    DsrcRBln: TDataSource;
    PanelLeft: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelProcOpl: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BtnVidN: TSpeedButton;
    sBtnObj: TSpeedButton;
    sBtnKatP: TSpeedButton;
    Label12: TLabel;
    sBtnSPZ: TSpeedButton;
    LabelCntDays: TLabel;
    dbeDtPrik: TDBEdit;
    dbeDtEnd: TDBEdit;
    dbeProcOpl: TDBEdit;
    dbeShObj: TDBEdit;
    dbeShKatP: TDBEdit;
    dbeNotes: TDBEdit;
    DbeShVidN: TDBEdit;
    dbeSPZ: TDBEdit;
    dbeNrList: TDBEdit;
    dbeCntDays: TDBEdit;
    dbeDtBeg: TDBEdit;
    LabelFamIO: TLabel;
    PanelBottom: TPanel;
    BtnVvod: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnStep2: TSpeedButton;
    sBtnStep3: TSpeedButton;
    popMnu: TPopupMenu;
    popHead: TMenuItem;
    popNuDetails: TMenuItem;
    sBtnStep1: TSpeedButton;
    LabelTabN: TLabel;
    DbeTabN: TDBEdit;
    BtnUpi: TSpeedButton;
    sBtnPrt: TSpeedButton;
    bBtnPereschet: TBitBtn;
    sBtnCalendar: TSpeedButton;
    DbeVidN: TDBEdit;
    tblRBlnVIDN: TStringField;
    rGrpAlgoritm: TGroupBox;
    RBtnByLastOkl: TRadioButton;
    LbxFilter: TListBox;
    dbChBoxNchBudMes: TDBCheckBox;
    LabelNchBudMes: TLabel;
    DBChBoxListCont: TDBCheckBox;
    dbeStgCmn: TDBEdit;
    dbeStg12: TDBEdit;
    LabelCmnStg: TLabel;
    LabelStg12: TLabel;
    sBtnPredList: TSpeedButton;
    tblRBlnShVidN: TStringField;
    BtnNew: TBitBtn;
    tblSvRBln: TTable;
    sBtnRecalcPred: TSpeedButton;
    sBtnStornOtp: TSpeedButton;
    qryOtkl: TQuery;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklDTSTORN: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklShVidN: TStringField;
    qryOtklOLDKDVIDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklOLDKDOBJ: TSmallintField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklNOTES: TStringField;
    qryOtklPRR: TSmallintField;
    qryOtklPRPV: TSmallintField;
    qryOtklKTO: TSmallintField;
    qryOtklPRKR: TSmallintField;
    qryOtklSPEC_NR: TIntegerField;
    qryOtklDTVDPV: TDateTimeField;
    qryOtklNRVDPV: TIntegerField;
    qryOtklMYNOTES: TStringField;
    qryOtklSPECPS: TIntegerField;
    qryOtklPBNK: TSmallintField;
    qryOtklSTORN: TStringField;
    dsrcOtkl: TDataSource;
    cdsF8: TClientDataSet;
    cdsF8NR: TAutoIncField;
    cdsF8ZaMesGod: TDateField;
    cdsF8SvDtBeg: TDateField;
    cdsF8StornDtBeg: TDateField;
    cdsF8SvDtEnd: TDateField;
    cdsF8StornDtEnd: TDateField;
    cdsF8StornFull: TBooleanField;
    dsrcF8: TDataSource;
    qryTmpOtp: TQuery;
    popOtkl: TPopupMenu;
    popOtklStornPart: TMenuItem;
    popOtklDelStorn: TMenuItem;
    qryStorn: TQuery;
    qryStornNR: TIntegerField;
    qryStornKDSPS: TSmallintField;
    qryStornDTPROC: TDateTimeField;
    qryStornZAMESGOD: TDateTimeField;
    qryStornDTSTORN: TDateTimeField;
    qryStornTABN: TIntegerField;
    qryStornVIDN: TStringField;
    qryStornShVidN: TStringField;
    qryStornOLDKDVIDN: TSmallintField;
    qryStornCHAS: TFloatField;
    qryStornSUMMA: TFloatField;
    qryStornOLDKDOBJ: TSmallintField;
    qryStornKDOBJ: TSmallintField;
    qryStornKDKATP: TSmallintField;
    qryStornDT_BEG: TDateTimeField;
    qryStornDT_END: TDateTimeField;
    qryStornPDN: TSmallintField;
    qryStornKDSPZ: TSmallintField;
    qryStornNOTES: TStringField;
    qryStornPRR: TSmallintField;
    qryStornPRPV: TSmallintField;
    qryStornKTO: TSmallintField;
    qryStornPRKR: TSmallintField;
    qryStornSPEC_NR: TIntegerField;
    qryStornDTVDPV: TDateTimeField;
    qryStornNRVDPV: TIntegerField;
    qryStornMYNOTES: TStringField;
    qryStornSPECPS: TIntegerField;
    qryStornPBNK: TSmallintField;
    qryStornSTORN: TStringField;
    qryStornSVDTBEG: TDateTimeField;
    qryStornSVDTEND: TDateTimeField;
    dsrcStorn: TDataSource;
    updStorn: TUpdateSQL;
    TblDM: TTable;
    tblDbg: TTable;
    qryTmp2: TQuery;
    LabelLastDtPriem: TLabel;
    LabelMsgDtPriem: TLabel;
    Label6: TLabel;
    dbePrBln: TDBEdit;
    BtnPrBln: TSpeedButton;
    dbeNmPrBln: TDBEdit;
    RBtnByLast12m: TRadioButton;
    GrBoxSps: TGroupBox;
    RBtnAllSps: TRadioButton;
    RBtnOwnSpsOnly: TRadioButton;
    Label7: TLabel;
    dbeKdTemu: TDBEdit;
    dbeNmTemu: TDBEdit;
    sBtnKdTemu: TSpeedButton;
    DbeKdSpZ: TDBEdit;
    dbeSerList: TDBEdit;
    dbePredNR: TDBEdit;
    dbePredDt: TDBEdit;
    tblRBlnSmmSovm: TFloatField;
    DBChBoxDigital: TDBCheckBox;
    QryPeek: TQuery;
    PanelRight: TPanel;
    Splitter1: TSplitter;
    PanelRBottom: TPanel;
    PanelResults: TPanel;
    LabelMsgOsn: TLabel;
    LabelMsgSvm: TLabel;
    LabelMsgCmn: TLabel;
    sBtnBackToBln: TSpeedButton;
    DbgrBlnResume: TDBGrid;
    PanelRTop: TPanel;
    PageControl1: TPageControl;
    TabByMes: TTabSheet;
    DbgrRBln: TDBGrid;
    TabByOkl: TTabSheet;
    LabelRSrOkl: TLabel;
    dbgrRSrOkl: TDBGrid;
    TabStornOtp: TTabSheet;
    Splitter2: TSplitter;
    dbgrOtkl: TDBGrid;
    dbgrStorn: TDBGrid;
    LbxStornRec: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbEditEnter(Sender: TObject);
    procedure DbEditExit(Sender: TObject);
    procedure BtnVidNClick(Sender: TObject);
    procedure sBtnObjClick(Sender: TObject);
    procedure sBtnKatPClick(Sender: TObject);
    procedure sBtnSPZClick(Sender: TObject);
    procedure qryVBlnAfterPost(DataSet: TDataSet);
    procedure qryVBlnAfterDelete(DataSet: TDataSet);
    procedure qryVBlnBeforePost(DataSet: TDataSet);
    procedure dbeDtBegExit(Sender: TObject);
    procedure dbeDtEndExit(Sender: TObject);
    procedure qryRBlnCalcFields(DataSet: TDataSet);
    procedure sBtnStep1Click(Sender: TObject);
    procedure sBtnStep2Click(Sender: TObject);
    procedure sBtnStep3Click(Sender: TObject);
    procedure dbgridDblClick(Sender: TObject);
    procedure DsrcRBlnDataChange(Sender: TObject; Field: TField);
    procedure qryRBlnAfterPost(DataSet: TDataSet);
    procedure BtnUpiClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure BtnVvodClick(Sender: TObject);
    procedure bBtnPereschetClick(Sender: TObject);
    procedure DbeVidNKeyDown(Sender: TObject; var Key: Word;
                                                Shift: TShiftState);
    procedure dbeShObjKeyDown(Sender: TObject; var Key: Word;
                                                Shift: TShiftState);
    procedure dbeShKatPKeyDown(Sender: TObject; var Key: Word;
                                                Shift: TShiftState);
    procedure dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                Shift: TShiftState);
    procedure sBtnCalendarClick(Sender: TObject);
    procedure qryVBlnDTLISTSetText(Sender: TField; const Text: String);
    procedure dbgridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbeCntDaysExit(Sender: TObject);
    procedure RBtnByLastOklClicr(Sender: TObject);
    procedure dbChBoxNchBudMesEnter(Sender: TObject);
    procedure dbChBoxNchBudMesExit(Sender: TObject);
    procedure DbeTabNExit(Sender: TObject);
    procedure sBtnPredListClick(Sender: TObject);
    procedure qryVBlnCalcFields(DataSet: TDataSet);
    procedure DBChBoxListContClick(Sender: TObject);
    procedure tblRBlnCalcFields(DataSet: TDataSet);
    procedure BtnNewClick(Sender: TObject);
    procedure dbeStgCmnKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure sBtnRecalcPredClick(Sender: TObject);
    procedure sBtnStornOtpClick(Sender: TObject);
    procedure sBtnBackToBlnClick(Sender: TObject);
    procedure popOtklStornPartClick(Sender: TObject);
    procedure popOtklDelStornClick(Sender: TObject);
    procedure qryStornCalcFields(DataSet: TDataSet);
    procedure qryStornNewRecord(DataSet: TDataSet);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrGridEnter(Sender: TObject);
    procedure dbgrGridExit(Sender: TObject);
    procedure dbgrOtklDblClick(Sender: TObject);
    procedure qryOtklCalcFields(DataSet: TDataSet);
    procedure dbgrStornDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnPrBlnClick(Sender: TObject);
    procedure qryVBlnPRBLNValidate(Sender: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RBtnByLast12mClick(Sender: TObject);
    procedure qryRBlnNewRecord(DataSet: TDataSet);
    procedure qryVBlnVIDNValidate(Sender: TField);
    procedure qryViNuCalcFields(DataSet: TDataSet);
    procedure DbgrRBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnKdTemuClick(Sender: TObject);
    procedure dbeKdTemuExit(Sender: TObject);
    procedure DBChBoxDigitalClick(Sender: TObject);
    procedure RBtnAllSpsClick(Sender: TObject);
    procedure RBtnOwnSpsOnlyClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DsrcRBlnUpdateData(Sender: TObject);
  private
    PredefTabN: integer;
    PredefVidN: ShortString;
    Predef12Mnth: boolean;
    PredefAllSps: boolean;
    PredefDigital: boolean;
    PredefKdSpz: integer;

    Data: TDmSickPregn;
    ReadOnly: boolean;
    SalaryRecalc: boolean;
    NonModalIsActive: boolean;

    procedure NewSickList(TabN: integer);
    procedure ExistingSickList(ReadOnly: boolean);

    procedure SetStep(Step: integer);

    procedure RefreshFamIO;
    procedure RefreshAlhorithm;
    procedure RefreshScope;
    procedure AdjustPrevList;
    procedure RefreshAverages;

    procedure AdjustControls;
    procedure RefreshNonDataAware;

    procedure EnablePrevList(Enable: boolean);

    procedure OnDtBegChanged;

    procedure RaschetByOkl;
    procedure RaschetBy12mes;
    procedure RaschetByPredList;  // рассчитать по сумме среднего из пред.листка

    procedure RaschetSrDnByOkl;
    procedure RaschetSrDnBy12mes;

    procedure RaspredBlnPoMes;

    procedure FillQryRBlnBy12Mes(nTabN, nSpecNR: integer;
      dDtBegBln, dDtBegPerioda, dDtEndPerioda : TDateTime);
    procedure FillQryRBlnByOkl(nTabN : integer);

    procedure tblRBlnAdd(
        dDtProc, dDtB, dDtE: TDateTime;
        cVidN: string4;
        nCntDays, nCntChas, nSmmOsn, nSmmSovm: double;
        cNotes : string);

    procedure AddTblRBlnToOtkl;
    procedure DeleteFromOtklOldRecords(n_SpecNR : integer);
    procedure SetSteps;
    procedure SaveResults;
    procedure SaveQry_RBln;
    procedure SaveQry_RBlnInPredList(nPredSpecNR : integer);
    procedure DelTmpTables;
    procedure AdjustPageControlTabs;
    procedure AdjustRBlnColumns;
    function MyChecNakladka(dChkBeg, dChkEnd : TDateTime;
                                              var nSpecNR : integer) : boolean;
    procedure OpenQryOtkl(nTabN, nSpec_NR: integer);
    procedure OpenQryStorn(nTabN, nSpec_NR: integer);
    procedure SetDbgrOtklColumns;
    procedure SetDbgrStornColumns;
    procedure PrepareTblDM;
    function RabotalInMes(nTabN : integer; dDtBegM : TDateTime) : boolean;
    function GetDtLastPrm(nTabN : integer; dDtBegBln : TDateTime) : TDateTime;

    procedure CalcDayAverages;

    procedure ReadIniFile;
    procedure WriteIniFile;
  public
    class function Run(var TabN: integer; SpecNR: integer;
      bShowTabN, ParamReadOnly : boolean;
      out ParamSalaryRecalc: boolean) : boolean;

  end;

const SECTION = 'Z_EDkr';

var
  FormEDkr: TFormEDkr;

implementation

uses A_Const, A_DM, A_Lib, Z_DM, Z_Main, z_GtQUpi, z_TVids, Z_TObj, z_TUpi,
     Z_GtPers, A_SBU, A_ShwErr, Z_ShNuMG, Z_CmnPrt, Z_Calend, z_PrBln,
     z_BlnPrd, z_EOtpP, z_ShwTem, BlnDkrCommon, CustDateUtils, CustStruct;

const
  DATE_2015_07_04 = 42189;

{$R *.dfm}

//------------------------------------------------------------------------------
// #Run
// TabN сделан var'ом, чтобы можно было разыскать введенный TabN из z_ShBln.
//------------------------------------------------------------------------------
class function TFormEDkr.Run(
  var TabN: integer;
  SpecNR: integer;
  bShowTabN, ParamReadOnly: boolean;
  out ParamSalaryRecalc: boolean) : boolean;
begin
  Result := false;

  with TFormEDkr.Create(nil) do begin
    Data := TDmSickPregn.Create(SpecNr);
    ReadOnly := ParamReadOnly;
    PredefTabN := TabN;

    if SpecNr = 0 then begin
      Caption := 'Декретные [новая запись]';
      NewSickList(TabN)
    end else
      ExistingSickList(ReadOnly);

    AdjustControls;
    RefreshNonDataAware;

    Result := ShowModal = mrOk;

    if Result then begin
      ParamSalaryRecalc := true;
      TabN := Data.GetTabN;
    end;

    Data.Free;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.FormCreate(Sender: TObject);
var
  nY, nM, nD: word;
  nOtpSpecNR: integer;
  bIsNakladka: boolean;
begin
  ReadIniFile;

  if FileExists(cDirVids + 'RsBln09.vid') then
    DbgrRBln.Columns.LoadFromFile(cDirVids + 'RsBln09.vid');
  if FileExists(cDirVids + 'RsBln02.vid') then
    DbgrBlnResume.Columns.LoadFromFile(cDirVids + 'RsBln02.vid');
  if FileExists(cDirVids + 'RsBlnOkl.vid') then
    dbgrRSrOkl.Columns.LoadFromFile(cDirVids + 'RsBlnOkl.vid');

  NonModalIsActive := false;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  ErrList: TStringList;
begin
  Data.Save;
  ErrList := Data.GetErrors;

  if (ModalResult = mrOk) and (ErrList.Count > 0) then begin
    ShowErrors(ErrList);
    CanClose := false;
  end;

  if CanClose then begin
    if NonModalIsActive then
      FormShowNuMG.Close;
    if bIsFormMyCalendar then
      FormMyCalendar.Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;

  DbgrRBln.Columns.SaveToFile(cDirVids + 'RsBln09.vid');
  DbgrBlnResume.Columns.SaveToFile(cDirVids + 'RsBln02.vid');
  dbgrRSrOkl.Columns.SaveToFile(cDirVids + 'RsBlnOkl.vid');
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.NewSickList(TabN: integer);
begin
  Data.AddNewSickList(
    TabN, DbeVidN.Field.AsString, DbeKdSpz.Field.AsInteger,
      RBtnByLast12m.Checked, RBtnAllSps.Checked, DBChBoxDigital.Checked);

  SetStep(1);
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.SetStep(Step: integer);
begin
  AdjustPageControlTabs;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.OnDtBegChanged;
begin
  LabelLastDtPriem.Caption := '';
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.DsrcRBlnUpdateData(Sender: TObject);
begin
  RefreshAverages;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.ExistingSickList(ReadOnly: boolean);
begin
  if ReadOnly then
    Caption := 'Декретные [только просмотр]'
  else begin
    Caption := 'Декретные [редактирование записи]';

    // Отключить элементы ввода...
  end;

  Data.EditSickList;
end;

//------------------------------------------------------------------------------
// Создание нового больничного непосредственно из формы.
//------------------------------------------------------------------------------
procedure TFormEDkr.BtnNewClick(Sender: TObject);
var
  ErrList: TStringList;
begin
  Data.Save;
  ErrList := Data.GetErrors;

  if ErrList.Count = 0 then begin
    if NonModalIsActive then
      FormShowNuMG.Close;

    NewSickList(PredefTabN)
  end else
    ShowErrors(ErrList);
end;

//------------------------------------------------------------------------------
// Завершение.
//------------------------------------------------------------------------------
procedure TFormEDkr.BtnVvodClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------
// Устанавливает видимость, редактируемость, конфигурацию grid'ов.
//------------------------------------------------------------------------------
procedure TFormEDkr.AdjustControls;
begin
  AdjustPageControlTabs;

  AdjustPrevList;
  AdjustRBlnColumns;

  RBtnByLast12m.Checked := Data.Use12Mnth;
  RBtnByLastOkl.Checked := not RBtnByLast12m.Checked;

  RBtnAllSps.Checked := Data.AllSps;
  RBtnOwnSpsOnly.Checked := not RBtnAllSps.Checked;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.AdjustPrevList;
begin
  EnablePrevList(Data.GetPrevSpecNr = 0);
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.AdjustRBlnColumns;
var
  I: SmallInt;
  FieldName: ShortString;
begin
  for I := 0 to DbgrRBln.Columns.Count - 1 do begin
    FieldName := UpperCase(DbgrRBln.Columns[i].FieldName);

    if (FieldName = 'MYFOXFLD') or (FieldName = 'SPEC_NR') then
      DbgrRBln.Columns[i].Visible := bFlagDbg;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RefreshNonDataAware;
begin
  RefreshFamIO;
  RefreshAlhorithm;
  RefreshScope;

  RefreshAverages;
end;

//------------------------------------------------------------------------------
// Включ./выкл. элементы предыдущего листа.
//------------------------------------------------------------------------------
procedure TFormEDkr.EnablePrevList(Enable: boolean);
begin
  dbePredNR.Visible := Enable;
  dbePredDt.Visible := Enable;
  sBtnRecalcPred.Visible := Enable;
  sBtnPredList.Visible := Enable;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RBtnByLast12mClick(Sender: TObject);
begin
  Data.Use12Mnth := true;
  AdjustPageControlTabs;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RBtnByLastOklClicr(Sender: TObject);
begin
  Data.Use12Mnth := false;
  AdjustPageControlTabs;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RBtnAllSpsClick(Sender: TObject);
begin
  Data.AllSps := true;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RBtnOwnSpsOnlyClick(Sender: TObject);
begin
  Data.AllSps := false;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.DbeTabNExit(Sender: TObject);
var
  TabN: integer;
begin
  TabN := DbeTabN.Field.AsInteger;
  LabelFamIO.Caption := Data.GetFamIO;
  (Sender as TDBEdit).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.BtnUpiClick(Sender: TObject);
var
  TabN: integer;
  FamIO, Dummy: string;
begin
  DbeTabN.SetFocus;
  TabN := DbeTabN.Field.AsInteger;

  if GetUpiTabN(TabN, Dummy, Dummy, Dummy, FamIO, Dummy) then begin
    DbeTabN.Field.AsInteger := TabN;
    LabelFamIO.Caption := FamIO;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.DbeVidNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    BtnVidN.Click;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.BtnVidNClick(Sender: TObject);
var
  VidNInfo: TVidNInfo;
  DummyInt: integer;
  Selected: boolean;
begin
  DbeShVidN.SetFocus;

  VidNInfo.VidN := DbeTabN.Field.AsString;

  if TFormTVids.GetPayTypeInfo(VidNInfo, DummyInt, Selected, LbxFilter) then
    DbeTabN.Field.AsString := VidNInfo.VidN;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.tblRBlnAdd(
  dDtProc, dDtB, dDtE: TDateTime;
  cVidN: string4;
  nCntDays, nCntChas, nSmmOsn, nSmmSovm: double;
  cNotes: string);
begin
  with tblRBln do begin
    Append;
    tblRBlnDtProc.AsDateTime := dDtProc;
    tblRBlnVidN.AsString := cVidN;
    tblRBlnDtBeg.AsDateTime := dDtB;
    tblRBlnDtEnd.AsDateTime := dDtE;
    tblRBlnCntDays.AsFloat := nCntDays;
    tblRBlnCntChas.AsFloat := nCntChas;
    tblRBlnSmm.AsFloat := nSmmOsn;
    tblRBlnSmmSovm.AsFloat := nSmmSovm;
    tblRBlnNotes.AsString := cNotes;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.SaveResults;
var
  cLogMsg : string;
  bIsListCont: boolean;
begin
  with qryVBln do begin
    cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
               ', VidN = ' + FieldByName('VidN').AsString +
               ', DtProc = ' + FieldByName('DtProc').AsString +
               ', DtBeg = ' + FieldByName('DtBeg').AsString +
               ', CntDays = ' + FieldByName('CntDays').AsString +
               ', SrDnevn = ' + FieldByName('SmSrDn').AsString;

    FieldByName('SmBln').AsFloat :=
      RoundTo(FieldByName('SmSrdn').AsFloat *
      FieldByName('ProcOpl').AsFloat / 100, -2) *
      FieldByName('CntDays').AsInteger;

    FieldByName('Shema').AsInteger := 2;
    bIsListCont := qryVBlnListCont.AsString = '1';
    Post;
    DmMain.AddLog(Now, n_TabN, 'Ввод декретных', gc_AppNmUsr, 'Z_vBln', cLogMsg);
    // WHAT THE FUCK?
    // nTabN := FieldByName('TabN').AsInteger;
    // Close;
    // Open;
    // Locate('TabN', nTabN, []);
  end;
  // Становится известной переменная n_SpecNR
  if not bIsListCont then
      SaveQry_RBln
  else if bIsListCont then
    SaveQry_RBlnInPredList(qryVBln.FieldByName('PredSpec_NR').AsInteger);
  AddTblRBlnToOtkl;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.bBtnPereschetClick(Sender: TObject);
var cLogMsg : string; nTabN : integer;
begin
  bVvodClick := true;
  //Сохранить расчет в Z_VBln и в Z_Otkl
  with qryVBln do begin
    nTabN := FieldByName('TabN').AsInteger;
    cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
               ', VidN = ' + FieldByName('VidN').AsString +
               ', DtProc = ' + FieldByName('DtProc').AsString +
               ', DtBeg = ' + FieldByName('DtBeg').AsString +
               ', CntDays = ' + FieldByName('CntDays').AsString +
               ', SrDnevn = ' + FieldByName('SmSrDn').AsString;
    FieldByName('SmBln').AsFloat := RoundTo(FieldByName('SmSrdn').AsFloat *
                                         FieldByName('CntDays').AsInteger *
                                      FieldByName('ProcOpl').AsFloat / 100, -2);
    Post;
    DmMain.AddLog(Now, nTabN, 'Ввод декретных', gc_AppNmUsr, 'Z_vBln', cLogMsg);
  end;
  // Становится известной n_SpecNR
  if not (qryVBlnListCont.AsString = '1') then
    SaveQry_RBln;
  AddTblRBlnToOtkl;
  bVvodClick  := false;
  b_Pereschet := true;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.SaveQry_RBlnInPredList(nPredSpecNR : integer);
var bIsMinus : boolean;
begin
  with qryRBln do begin
    DisableControls;
    Filtered := false;
    First;
    while not Eof do begin
      bIsMinus := FieldByName('MyFoxFld').AsInteger = -1;
      if bEditMode and bIsFoxFilter and bIsMinus then
        Delete
      else begin
        Edit;
        FieldByName('Spec_NR').AsInteger := nPredSpecNr;
        Post;
        Next;
      end;
    end;
  end;
  if qryRBln.UpdatesPending then
    qryRBln.ApplyUpdates;
//  if qryStorn.Active and qryStorn.UpdatesPending then
//    qryStorn.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.AddTblRBlnToOtkl;
var
  i, j, nY, nM, nD, n_Y, n_M, n_D, nPrKr : word;
  nSum: double;
  cSovm: string;

  procedure WriteToOtkl;
  begin
    with tblRBln do begin
      qryTmp.ParamByName('nKdSps').AsInteger := gl_nAppKdSpsUsr;
      qryTmp.ParamByName('dDtProc').AsDateTime := Today;
      qryTmp.ParamByName('nTabN').AsInteger := n_TabN;
      qryTmp.ParamByName('nKdObj').AsInteger :=
                                    qryVBln.FieldByName('KdObj').AsInteger;
      qryTmp.ParamByName('nKdKatP').AsInteger :=
                                   qryVBln.FieldByName('KdKatP').AsInteger;
      qryTmp.ParamByName('dDt_Beg').AsDateTime :=
                                           FieldByName('DtBeg').AsDateTime;
      qryTmp.ParamByName('dDt_End').AsDateTime :=
                                           FieldByName('DtEnd').AsDateTime;
      qryTmp.ParamByName('cVidN').AsString := FieldByName('VidN').AsString;
      qryTmp.ParamByName('nPdn').AsInteger := 1;
      qryTmp.ParamByName('nChas').AsFloat := FieldByName('CntChas').AsFloat;
      qryTmp.ParamByName('nSumma').AsFloat := nSum;
      qryTmp.ParamByName('nKdSPZ').AsInteger :=
                                    qryVBln.FieldByName('KdSPZ').AsInteger;
      qryTmp.ParamByName('cNOTES').AsString := 'SpNR=' + IntToStr(n_SpecNr);
      qryTmp.ParamByName('nPRPV').AsInteger := 1;
      qryTmp.ParamByName('nKTO').AsInteger := 0;
      qryTmp.ParamByName('nPRKR').AsInteger := nPrKr;
      DecodeDate(FieldByName('DtBeg').AsDateTime, n_Y, n_M, n_D);
      qryTmp.ParamByName('dZAMESGOD').AsDateTime := EncodeDate(n_Y, n_M, 1);
      qryTmp.ParamByName('nSPEC_NR').AsInteger := n_SpecNr;
      qryTmp.ParamByName('SOVM').AsString := cSovm;
      
      qryTmp.ExecSQL;
    end;
  end;

begin
  DecodeDate(Today, nY, nM, nD);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Otkl (KdSps, DTPROC, TABN, KDOBJ, ' +
            ' KDKATP, DT_BEG, DT_END, VIDN, PDN, CHAS, ' +
            ' SUMMA, KDSPZ, NOTES, PRPV, KTO, PRKR, ' +
            ' ZAMESGOD, SPEC_NR, SOVM) ');
    SQL.Add(' Values (:nKdSps, :dDTPROC, :nTABN, :nKDOBJ, ' +
            ' :nKDKATP, :dDT_BEG, :dDT_END, :cVidN, :nPDN, ' +
            ' :nCHAS, :nSUMMA, :nKDSPZ, :cNOTES, ' +
            ' :nPRPV, :nKTO, :nPRKR, :dZAMESGOD, :nSPEC_NR, :SOVM) ');
    Prepare;
  end;
  with tblRBln do begin
    First;
    i := 0;
    while not Eof do begin
      for j := 1 to 2 do begin
        if j = 1 then begin
          nSum := FieldByName('Smm').AsFloat;
          cSovm := '';
        end else begin
          nSum := FieldByName('SmmSovm').AsFloat;
          cSovm := 'Y';
        end;

        if (j = 1) or (j = 2) and (nSum <> 0) then begin
          Inc(i);
          if (i = 1) and (qryVBlnDtBeg.AsDateTime > dDtBegNextMes) and
                          dbChBoxNchBudMes.Checked and
                            (FieldByName('DtBeg').AsDateTime > dDtBegNextMes) then
            nPrKr := 1  // делать начисления от 01-ММ-ГГГГ до начала больничных
          else
            nPrKr := 0;

          WriteToOtkl;
        end;
      end;
      Next;
    end;
  end;
  with qryTmp do begin
    if Prepared then
      UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  if qryStorn.Active and qryStorn.UpdatesPending then
    qryStorn.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryVBlnAfterPost(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryVBln]);
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryVBlnAfterDelete(DataSet: TDataSet);
begin
  ;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryVBlnBeforePost(DataSet: TDataSet);
var bDbgQryOtklActive, bDbgQryStornActive : boolean;
    nStornCntRec : SmallInt; nQryOtklSpecNR : integer;
begin
  if rBtnByLast12m.Checked then
    qryVBln.FieldByName('AlgRasch').AsInteger := 12
  else
    qryVBln.FieldByName('AlgRasch').AsInteger := 1;
  if qryVBln.State = dsInsert then begin // новая запись
    n_SpecNr := DmMain.NewSpec_NR;
    qryVBln.FieldByName('Spec_NR').AsInteger := n_SpecNR; end
  else begin                             // редактирование записи
    n_SpecNr := qryVBln.FieldByName('Spec_NR').AsInteger;
    DeleteFromOtklOldRecords(n_SpecNR);
  end;
  bDbgQryOtklActive := qryOtkl.Active;
  bDbgQryStornActive := qryStorn.Active;
  if bDbgQryOtklActive then
    nQryOtklSpecNR := qryOtklSpec_NR.AsInteger
  else
    nQryOtklSpecNR := 0;
  if bDbgQryStornActive then
    nStornCntRec := qryStorn.RecordCount
  else
    nStornCntRec := 0;
  if bDbgQryOtklActive and bDbgQryStornActive and (nStornCntRec > 0) then
    qryVBln.FieldByName('LnkStOtp').AsInteger := nQryOtklSpecNR
  else
    qryVBln.FieldByName('LnkStOtp').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.DeleteFromOtklOldRecords(n_SpecNR : integer);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from Z_OTKL where Spec_NR = :nSpecNR');
    ParamByName('nSpecNR').AsInteger := n_SpecNR;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.qryRBlnCalcFields(DataSet: TDataSet);
var
  nY, nM, dummyWord : word; cNmVidN : string;
begin
  qryRBlnSmZpKoef.AsFloat :=
    RoundTo(qryRBlnSmZarabotka.AsFloat * qryRBlnKoefZp.AsFloat, -2);

  DecodeDate(qryRBlnZaMesGod.AsDateTime, nY, nM, dummyWord);
  qryRBlnRusMesGod.AsString := Copy(MesRus(nM), 1, 3) + ' ' + IntToStr(nY);

  if not qryRBlnVidN.IsNull and (qryRBlnVidN.AsString <> '') then
    qryRBlnShVidN.AsString := DmMain.VidN2ShVidN(qryRBlnVidN.AsString, cNmVidN);
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnStep1Click(Sender: TObject);
begin
  bClickStep1 := true;
  bClickStep2 := false;
  bClickStep3 := false;
  sBtnStep1.Enabled := false;
  sBtnStep2.Enabled := true;
  sBtnStep3.Enabled := false;
  SetSteps;
  bBtnVvod.Enabled := false;
  bBtnNew.Enabled := bBtnVvod.Enabled;
  bBtnPereschet.Enabled := false;
  LabelLastDtPriem.Caption := '';
  LabelMsgOsn.Caption := '';
  LabelMsgSvm.Caption := '';
  LabelMsgCmn.Caption := '';
  sBtnStornOtp.Enabled := false;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnStep2Click(Sender: TObject);
begin
  if NonModalIsActive then
    FormShowNuMG.Close;
  if bClickStep1 {переходим с 1 на 2} then begin
    if not CheckStep1 then  // всё ли заполнено на 1-й страничке
      Exit;
    if (qryVBlnListCont.AsString = '1') and bIsPredList then begin
      RaschetByPredList; end
    else if rBtnByLast12m.Checked then
      RaschetBy12mes
    else
      RaschetByOkl;
  end;
  bClickStep1 := false;
  bClickStep2 := true;
  bClickStep3 := false;
  sBtnStep1.Enabled := true;
  sBtnStep2.Enabled := false;
  sBtnStep3.Enabled := true;
  SetSteps;
  bBtnVvod.Enabled      := false;
  bBtnNew.Enabled       := bBtnVvod.Enabled;
  bBtnPereschet.Enabled := false;
  sBtnStornOtp.Enabled  := false;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnStep3Click(Sender: TObject);
var bIsNakladka : boolean; nSpecNR : integer;
    dChkBeg, dChkEnd : TDateTime;
begin
  bClickStep1 := false;
  bClickStep2 := false;
  bClickStep3 := true;
  sBtnStep1.Enabled := false;
  sBtnStep2.Enabled := true;
  sBtnStep3.Enabled := false;
  sBtnRecalcPred.Enabled := false;
  RaspredBlnPoMes;
  SetSteps;
  bBtnVvod.Enabled := true;
  bBtnNew.Enabled := bBtnVvod.Enabled;
  bBtnPereschet.Enabled := true;
  // проверить, не пересекаются ли периоды больничных с какими либо отпусками
  // Если ДА, дать возможность сторнировать отпуск, с которым пересеклись
  dChkBeg := qryVBlnDtBeg.AsDateTime;
  dChkEnd := qryVBlnDtEnd.AsDateTime;
  bIsNakladka := MyChecNakladka(dChkBeg, dChkEnd, nSpecNR);
  if bIsNakladka then begin
    // найти отпуск и вызвать его на tsStornOtp
    OpenQryOtkl(n_TabN, nSpecNR);
    OpenQryStorn(n_TabN, nSpecNR);
    SetDbgrOtklColumns;
    SetDbgrStornColumns;
    sBtnStornOtp.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.OpenQryOtkl(nTabN, nSpec_NR: integer);
begin
  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Otkl where TabN = :nTabN and ' +
               ' Spec_NR = :nSpec_NR and ' +
               ' (Storn is NULL or not Storn = "Y")');
    SQL.Add(' order by ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.OpenQryStorn(nTabN, nSpec_NR: integer);
begin
  with qryStorn do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select o.Dt_Beg as SvDtBeg, ' +
            ' o.Dt_End as SvDtEnd, o.* ' +
            ' from Z_Otkl o where o.TabN = :nTabN and ' +
            ' o.Spec_NR = :nSpec_NR and (o.Storn = "Y")');
    SQL.Add(' order by ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    Open;
    with cdsF8 do begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
    while not Eof do begin
      cdsF8.Append;
      cdsF8.FieldByName('ZaMesGod').AsString := qryStornZaMesGod.AsString;
      if qryOtkl.Locate('ZaMesGod', qryStornZaMesGod.AsDateTime, []) then begin
        cdsF8.FieldByName('SvDtBeg').AsString := qryOtklDt_Beg.AsString;
        cdsF8.FieldByName('SvDtEnd').AsString := qryOtklDt_End.AsString;
      end;
      cdsF8.FieldByName('StornDtBeg').AsString := qryStornDt_Beg.AsString;
      cdsF8.FieldByName('StornDtEnd').AsString := qryStornDt_End.AsString;
      if (cdsF8.FieldByName('SvDtBeg').AsDateTime =
                   cdsF8.FieldByName('StornDtBeg').AsDateTime) and
            (cdsF8.FieldByName('SvDtEnd').AsDateTime =
                   cdsF8.FieldByName('StornDtEnd').AsDateTime) then
        cdsF8.FieldByName('StornFull').AsString := 'T'
      else
          cdsF8.FieldByName('StornFull').AsString := 'F';
      cdsF8.Post;
      LbxStornRec.Items.Add(qryStornZaMesGod.AsString);
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
function TFormEDkr.MyChecNakladka(dChkBeg, dChkEnd : TDateTime;
                                              var nSpecNR : integer) : boolean;
var i{, nCntSpecNR} : SmallInt; nSvSpecNR : integer;
begin
  Result := false;
  //nCntSpecNR := 0;
  nSvSpecNR := 0;
  i := 0;
  with qryTmpOtp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Otkl where TabN = :nTabN and VidN > "2400" and ' +
            ' VidN < "2500" and (not Spec_NR is NULL) and ' +
            ' ((Dt_Beg Between :dChkBeg and :dChkEnd) or ' +
            '  (Dt_End Between :dChkBeg and :dChkEnd) or ' +
            '  (:dChkBeg Between Dt_Beg and Dt_End) or ' +
            '  (:dChkEnd Between Dt_Beg and Dt_End)) ' +
            ' order by DtProc, ZaMesGod');
    ParamByName('nTabN').AsInteger := n_TabN;
    ParamByName('dChkBeg').AsDateTime := dChkBeg;
    ParamByName('dChkEnd').AsDateTime := dChkEnd;
    Open;
    while not Eof do begin
      Inc(i);
      Result := true;
      if i = 1 then begin
        //Inc(nCntSpecNR);
        nSvSpecNR := FieldByName('Spec_NR').AsInteger;
      end;
      //if FieldByName('Spec_NR').AsInteger <> nSvSpecNR then
      //  Inc(nCntSpecNR);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
    nSpecNR := nSvSpecNR; // Пока надеюсь, что встретится только
  end;                    // один отпуск. Потом дело покажет.
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnStornOtpClick(Sender: TObject);
begin
  LabelMsgOsn.Visible := false;
  LabelMsgSvm.Visible := false;
  LabelMsgCmn.Visible := false;
  sBtnStornOtp.Enabled := false;
  sBtnStep2.Enabled := false;
  sBtnPrt.Enabled := false;
  mSvTabSheet := PageControl1.ActivePage;
  PageControl1.ActivePage := tsStornOtp;
  sBtnBackToBln.Visible := true;
  if b_CanUpd then
    dbgrOtkl.SetFocus;
  DbgrBlnResume.Enabled := false;
  DbgrBlnResume.Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnBackToBlnClick(Sender: TObject);
begin
  PageControl1.ActivePage := mSvTabSheet;
  DbgrBlnResume.Enabled := true;
  sBtnBackToBln.Visible := false;
  LabelMsgOsn.Visible := true;
  LabelMsgSvm.Visible := true;
  LabelMsgCmn.Visible := true;
  sBtnStep2.Enabled := true;
  sBtnPrt.Enabled := true;
  sBtnStornOtp.Enabled := true;
  DbgrBlnResume.Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.SetSteps;
begin
  if bClickStep1 then begin
    PanelLeft.Enabled    := true;
    DbgrRBln.Enabled    := false;
    PanelRBottom.Enabled := false;
    rGrpAlgoritm.Enabled := true;
    dbeDtBeg.Color   := clWindow;
    dbeCntDays.Color := clBtnFace;
    dbeDtEnd.Color   := clWindow;
    dbeSerList.Color := clWindow;
    dbeNrList.Color  := clWindow;
    dbeDtPrik.Color  := clWindow;
    dbeVidN.Color    := clWindow;
    dbeVidN.Color    := clWindow;
    dbeShVidN.Color  := clWindow;
    dbeProcOpl.Color := clWindow;
    dbeShObj.Color   := clWindow;
    dbeShKatP.Color  := clWindow;
    dbeSPZ.Color     := clWindow;
    dbeNotes.Color   := clWindow;
    DbgrRBln.Color  := clBtnFace;
    DbgrBlnResume.Color   := clBtnFace;

    dbePrBln.Color   := clWindow;
    dbeKdTemu.Color  := clWindow;
    dbeStgCmn.Color  := clWindow;
    dbeStg12.Color   := clWindow;

    if rBtnByLast12m.Checked then
      PageControl1.ActivePage := tsBy_N_mes
    else
      PageControl1.ActivePage := tsByOkl;
    sBtnPrt.Visible  := false; end
  else if bClickStep2 then begin
    PanelLeft.Enabled    := false;
    DbgrRBln.Enabled    := not DBChBoxListCont.Checked; //  true;
    PanelRBottom.Enabled := false;
    rGrpAlgoritm.Enabled := false;
    dbeDtBeg.Color   := clBtnFace;
    dbeCntDays.Color := clBtnFace;
    dbeDtEnd.Color   := clBtnFace;
    dbeSerList.Color  := clBtnFace;
    dbeNrList.Color  := clBtnFace;
    dbeDtPrik.Color  := clBtnFace;
    dbeVidN.Color    := clBtnFace;
    dbeVidN.Color    := clBtnFace;
    dbeShVidN.Color  := clBtnFace;
    dbeProcOpl.Color := clBtnFace;
    dbeShObj.Color   := clBtnFace;
    dbeShKatP.Color  := clBtnFace;
    dbeSPZ.Color     := clBtnFace;
    dbeNotes.Color   := clBtnFace;
    dbePrBln.Color   := clBtnFace;
    dbeKdTemu.Color  := clBtnFace;
    dbeStgCmn.Color  := clBtnFace;
    dbeStg12.Color   := clBtnFace;
    if not DBChBoxListCont.Checked then
      DbgrRBln.Color  := clWindow;
    DbgrBlnResume.Color   := clBtnFace;
    if rBtnByLast12m.Checked then
      PageControl1.ActivePage := tsBy_N_mes
    else
      PageControl1.ActivePage := tsByOkl;
    sBtnPrt.Visible  := false; end
  else if bClickStep3 then begin
    PanelLeft.Enabled    := false;
    DbgrRBln.Enabled    := false;
    PanelRBottom.Enabled := true;
    rGrpAlgoritm.Enabled := false;
    dbeDtBeg.Color   := clBtnFace;
    dbeCntDays.Color := clBtnFace;
    dbeDtEnd.Color   := clBtnFace;
    dbeSerList.Color  := clBtnFace;
    dbeNrList.Color  := clBtnFace;
    dbeDtPrik.Color  := clBtnFace;
    dbeVidN.Color    := clBtnFace;
    dbeVidN.Color    := clBtnFace;
    dbeShVidN.Color  := clBtnFace;
    dbeProcOpl.Color := clBtnFace;
    dbeShObj.Color   := clBtnFace;
    dbeShKatP.Color  := clBtnFace;
    dbeSPZ.Color     := clBtnFace;
    dbeNotes.Color   := clBtnFace;
    DbgrRBln.Color  := clBtnFace;
    DbgrBlnResume.Color   := clWindow;
    dbePrBln.Color   := clBtnFace;
    dbeKdTemu.Color  := clBtnFace;
    dbeStgCmn.Color  := clBtnFace;
    dbeStg12.Color   := clBtnFace;
    sBtnPrt.Visible  := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RaschetBy12mes;
var
  dDtEnd12, dDtBegPerioda, dDtEndPerioda, dDtBegBln, dDtLastPrm: TDateTime;
  nY, nM, nD: word;
  i, nSpecNR: integer;
begin
  with tblRBln do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
    CreateTable;
    Open;
  end;

  dDtBegBln := qryVBln.FieldByName('DtBeg').AsDateTime;
  dDtLastPrm := GetDtLastPrm(n_TabN, dDtBegBln);

  // Определить даты DtProc для 12 предыдущих месяцев
  DecodeDate(dDtBegBln, nY, nM, nD);
  dDtEnd12 := EncodeDate(nY, nM, 1) - 1;
  DecodeDate(dDtEnd12, nY, nM, nD);
  dDtEndPerioda := EncodeDate(nY, nM, 1);
  for i := 1 to 11 do begin
    nM := nM - 1;
    if nM = 0 then begin
      nM := 12;
      nY := nY - 1;
    end;
  end;

  nSpecNR := n_SpecNR;
  dDtBegPerioda := EncodeDate(nY, nM, 1);
  LabelLastDtPriem.Caption := DateToStr(dDtLastPrm);
  dDtBegPerioda := Max(dDtBegPerioda, dDtLastPrm);
  DecodeDate(dDtBegPerioda, nY, nM, nD);
  dDtBegPerioda := EncodeDate(nY, nM, 1); // случай, если принят не 1-го числа)

  if dDtBegPerioda < dDtLastPrm then begin
    // Если dDtBegPerioda < dDtLastPrm, нужно:
    // - если dDtLastPrm начинается с 1-го числа месяца - период начинать с неё
    // - если не с 1-го числа - то со следуюшего месяца
    DecodeDate(dDtLastPrm, nY, nM, nD);
    if nD = 1 then
      dDtBegPerioda := dDtLastPrm
    else begin
      nM := nM + 1;
      if nM = 13 then begin
        nM := 1;
        nY := nY + 1;
      end;
      dDtBegPerioda := EncodeDate(nY, nM, 1);
    end;
  end;

  bQry_RBlnReady := false;

  // Выбираем сведения для расчета больничных
  FillQryRBlnBy12Mes(n_TabN, nSpecNR, dDtBegBln, dDtBegPerioda, dDtEndPerioda);

  bQry_RBlnReady := true;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.PrepareTblDM;
begin
  with tblDM do begin
    if Active then Close;
    if Exists then DeleteTable;
    CreateTable;
    Open;
  end;
end;
//------------------------------------------------------------------------------
function TFormEDkr.RabotalInMes(nTabN : integer; dDtBegM : TDateTime): boolean;
begin
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from Z_PrmUv where Tabn = :nTabN and ' +
            ' dt_Priem <= :dDtBegM and ' +
            ' (dt_Uvoln is NULL or dt_Uvoln >= :dDtBegM)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegM').AsDateTime := dDtBegM;
    Open;
    Result := RecordCount > 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormEDkr.GetDtLastPrm(nTabN : integer;
                                              dDtBegBln : TDateTime): TDateTime;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from z_PrmUv where TabN = :nTabN and ' +
            ' Dt_Priem <= :dDtBegBln order by Dt_Priem desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegBln').AsDateTime := dDtBegBln;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('Dt_Priem').AsDateTime;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.FillQryRBlnBy12Mes(
  nTabN, nSpecNR: integer;
  dDtBegBln, dDtBegPerioda, dDtEndPerioda: TDateTime);
var
  cVidN : string4;
  nY, nM, nD : word;
  dDtMes, dDtTmp, dDtBM, dDtEM, dDtBegSovm, dDtEndSovm: TDateTime;
  nCntDM, nSmZpKoef, nSmForBln, nSmD, nCntDSovm, nDummy,
  nSmForBlnSovm, nSmForBlnSovmTt, nCntDSovmTt: double;
  nCntDaysBln: integer;
  nCntWrkChas : double;
  cDtTmp, cTmp, cPref : ShortString;
  bIsPlusBdg, bIsMinusBdg: boolean;
  nIsZachet : SmallInt;
  nnSredneDnevnoe: double;
begin
  {
   Часто случается, что в рабочем месяце какое-то количество дней закрыли
   неоплачиваемым видом, а в след. месяце на эти дни появился больничный.
   Чтобы выбраться из такой ситуации, горожу таблицу tblDM, в которой буду
   делать разборки с полями:
    - DtMes      - Даты, подходящие для зачета по сути вида отпуск
    - IsNeoplVid - на этот день нашелся неоплачиваемый вид
    - IsPlusBdg  -              нашелся вид, бюджетный с ПЛЮС-часами
    - IsMinusBdg -              нашелся вид, бюджетный с МИНУС-часами
    - IsZachet   - по трем IsПолей решить, брать день в зачет или нет
  }
  // Поискать последнюю дату приема (т.к., если увольнялся и вновь принят, то
  // отсчет идет от даты последнего приема).

  with tblDM do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    TableName := 'BlnDtMss.db';  // индексов нет
    if Exists then DeleteTable;
  end;

  with qryRBln do begin
    DisableControls;
    // пересоздать на случай, если делается повторно Шаг2
    InitQuery(qryRBln);
    SQL.Add(
      'select r.*, Cast(-1 As SmallInt) As MyFoxFld ' +
      'from Z_RBln r ' +
      'where r.Spec_NR = :SpecNR');
    ParamByName('SpecNR').AsInteger := nSpecNR;
    Open;
  end; {with qryRBln}

  InitQuery(qryViNu);
  with qryViNu do begin
    SQL.Add(
      'select * ' +
      'from ViNuMain ' +
      'where TabN = :TabN and ZaMesGod >= :DtPeriodBeg and ' +
        'ZaMesGod <= :DtPeriodEnd and VidN < "6000" ');
    if rBtnOnlyCurSps.Checked then   // выбирать только по "своему" списку
      SQL.Add('and KdSps = :KdSps ');
    SQL.Add('order by ZaMesGod, VidN');
    ParamByName('DtPeriodBeg').AsDateTime := dDtBegPerioda;
    ParamByName('DtPeriodEnd').AsDateTime := dDtEndPerioda;
    ParamByName('TabN').AsInteger  := n_TabN;
    if rBtnOnlyCurSps.Checked then
      ParamByName('KdSps').AsInteger := gl_nAppKdSpsUsr;
    Open;

    First;
    nSmZpKoef := 0;
    nSmD := 0;
    nSmForBlnSovmTt := 0;
    nCntDSovmTt := 0;
    qryRBln.Filter := 'MyFoxFld <> -1';
    bIsFoxFilter := true;
    qryRBln.Filtered := true;
    while not Eof do begin
      dDtMes := FieldByName('ZaMesGod').AsDateTime;
      DecodeDate(dDtMes, nY, nM, nD);
      dDtBM := EncodeDate(nY, nM, 1);
      dDtEM := myLastDOM(dDtBM);
      //DmMain.GetCntWrkDaysBln(dDtBM, dDtEM, nCntDM, nCntCM, 'blk');
      //DmMain.CheckDayForBln(dDtMes, nCntBlnDay, cCase);
      nSmForBln := 0;
      nSmForBlnSovm := 0;
      dDtTmp := dDtMes;

      PrepareTblDM;  // и заполняю в tblDM поле DtMes "больничными" датами
      while dDtTmp <= dDtEM do begin  // в месяце
        cDtTmp := DateToStr(dDtTmp);
        DmMain.CheckDayForBln(dDtTmp, nCntDaysBln, nCntWrkChas, 'dkr');
        if nCntDaysBln > 0 then begin
          tblDM.Append;
          tblDM.FieldByName('DtMes').AsDateTime := dDtTmp;
          tblDM.Post;
        end;
        dDtTmp := dDtTmp + 1;
      end;  // заполнил

      dDtBegSovm := MyLastDom(dDtMes);
      dDtEndSovm := 0;
      //if bFlagDbg and (DateToStr(dDtMes) = '01-08-2015') then
      //  ShowMessage('ZaMesGod = ' + DateToStr(dDtMes));
      while (FieldByName('ZaMesGod').AsDateTime = dDtMes) and not Eof do begin
        cVidN := FieldByName('VidN').AsString;
        if (FieldByName('Dkr').AsString = '1') or
                     (cVidN = '1206') {За дни в командировке} or
            ((cVidN >= '2400') and (cVidN < '2500')) {отпускные} then begin
                                                     {СмВида включ. в СмДляБлн}
          if FieldByName('Sovm').AsString <> '1' then
            nSmForBln := nSmForBln + FieldByName('Summa').AsFloat
          else if (FieldByName('Dkr').AsString = '1') then begin
            // --------------------------------------------------------------
            // Тут не только о надбавках, - могут быть и, например, отпускные
            // Надо бы НеНадбавки обрабатывать как-то иначе 19-11-2015 !!!!!!
            //                 То же и в больничных !!!!!!!
            // --------------------------------------------------------------
            nSmForBlnSovm := nSmForBlnSovm + FieldByName('Summa').AsFloat;
            if not MyEmptyDate(FieldByName('Dt_Beg').AsString) then
              dDtBegSovm := Min(dDtBegSovm, FieldByName('Dt_Beg').AsDateTime);
            if not MyEmptyDate(FieldByName('Dt_End').AsString) then
              dDtEndSovm := Max(dDtEndSovm, FieldByName('Dt_End').AsDateTime);
            // Min и Max использую потому, что может быть несколько записей
          end;
          dDtTmp := FieldByName('Dt_Beg').AsDateTime;
          while dDtTmp <= FieldByName('Dt_End').AsDateTime do begin
            if tblDM.Locate('DtMes', dDtTmp, []) then begin
              tblDM.Edit; // наращиваю "очки" в поле NoVid
              tblDM.FieldByName('NoVid').AsInteger := 1;
              tblDM.Post;
            end;
            dDtTmp := dDtTmp + 1;
          end;
        end;
        if FieldByName('Dt_Beg').IsNull or FieldByName('Dt_End').IsNull or
                   (cVidN = '2406') or (cVidN = '2411') {неисп.отпуска} or
                   (cVidN >= '5007') {неопл., кроме НеполнРабДн} then begin
          Next;
          Continue;
        end;
        if ((cVidN >= '2600') and (cVidN < '2700')) {больничные} or
                ((cVidN >= '5000') and (cVidN < '5100')) {неоплач.} then begin
          dDtTmp := FieldByName('Dt_Beg').AsDateTime;
          while dDtTmp <= FieldByName('Dt_End').AsDateTime do begin
            if tblDM.Locate('DtMes', dDtTmp, []) then begin
              tblDM.Edit; // наращиваю "очки" в поле NoVid
              tblDM.FieldByName('NoVid').AsInteger :=     {НеОплВид}
                        tblDM.FieldByName('NoVid').AsInteger - 1;
              tblDM.Post;
            end;
            dDtTmp := dDtTmp + 1;
          end; end
        else if (FieldByName('CBudg').AsString = '1') and
                       not FieldByName('Dt_Beg').IsNull and
                        (FieldByName('Dt_Beg').AsDateTime <> 0) and
                         not FieldByName('Dt_End').IsNull and
                          (FieldByName('Dt_End').AsDateTime <> 0) then begin
          dDtTmp := FieldByName('Dt_Beg').AsDateTime;
          bIsPlusBdg := false;
          bIsMinusBdg := false;
          if not FieldByName('Chas').IsNull then begin
            if FieldByName('Chas').Value >= 0 then
              bIsPlusBdg := true
            else
              bIsMinusBdg := true;
          end;
          if bIsPlusBdg or bIsMinusBdg then
                    while dDtTmp <= FieldByName('Dt_End').AsDateTime do begin
            if tblDM.Locate('DtMes', dDtTmp, []) then begin
              tblDM.Edit;
              if bIsMinusBdg then
                tblDM.FieldByName('MinusB').AsInteger :=
                                tblDM.FieldByName('MinusB').AsInteger - 1
              else
                tblDM.FieldByName('PlusB').AsInteger :=
                                 tblDM.FieldByName('PlusB').AsInteger + 1;
              tblDM.Post;
            end;
            dDtTmp := dDtTmp + 1;
          end;
        end;
        Next;
      end; {while ZaMesGod qryViNu}

      nCntDM := 0;
      tblDM.First;
      while not tblDM.Eof do begin // подсчитываю "очки" ЗА и ПРОТИВ
        nIsZachet := tblDM.FieldByName('PlusB').AsInteger +
                           tblDM.FieldByName('MinusB').AsInteger +
                                 tblDM.FieldByName('NoVid').AsInteger;
        if nIsZachet > 0 then
          nCntDM := nCntDM + 1;
        tblDM.Next;
      end; {while tblDM}

      if bFlagDbg then begin
        tblDbg.DatabaseName := cDirTemp;
        cPref := Copy(DateToStr(dDtMes), 7, 4) + Copy(DateToStr(dDtMes), 4, 2);
        cTmp := 'b_' + cPref;
        tblDbg.TableName := cTmp + '.db';
        tblDbg.BatchMove(tblDM, batCopy);
      end;

      if nCntDM < 0 then
        nCntDM := 0;

      if not RabotalInMes(nTabN, dDtMes) then begin
        nCntDM := 0;
        nSmForBln := 0;
      end;

      qryRBln.Append;
      qryRBlnKdSps.AsInteger := gl_nAppKdSpsUsr; //nKdSps;
      qryRBlnTabN.AsInteger  := n_TabN;
      qryRBlnZaMesGod.AsDateTime := dDtMes;
      qryRBlnSmZarabotka.AsFloat := RoundTo(nSmForBln, -2);
      qryRBlnKoefZp.AsFloat := 1;
      qryRBlnCntDays.AsFloat := nCntDM;

      nSmD := nSmD + nCntDM;
      nSmForBlnSovm := RoundTo(nSmForBlnSovm, -2);
      qryRBlnSm_Svm.AsFloat := nSmForBlnSovm;
      qryRBlnSmVZachet_Svm.AsFloat := RoundTo(nSmForBlnSovm, -2);
      qryRBlnSmVZachet_Cmn.AsFloat := qryRBlnSmZarabotka.AsFloat +
                                         qryRBlnSmVZachet_Svm.AsFloat;
      if (dDtBegSovm <> 0) and (dDtEndSovm <> 0) then
        DmMain.GetCntWrkDaysBln(dDtBegSovm, dDtEndSovm,
                                                  nCntDSovm, nDummy, 'dkr')
      else
        nCntDSovm := 0; // nCntDM; // как по неСовместительским видам
      if nSmForBlnSovm > 0 then
        qryRBlnCntDays_Svm.AsFloat := nCntDSovm;
      nSmZpKoef := nSmZpKoef + RoundTo(qryRBlnSmZpKoef.AsFloat, -2);
      nSmForBlnSovmTt := nSmForBlnSovmTt + nSmForBlnSovm;
      nCntDSovmTt := nCntDSovmTt + nCntDSovm;
    end; {while qryViNU}
  end; {with qryViNU}
  ReleaseQuery(qryViNU);

  qryRBln.First;
  qryRBln.EnableControls;

  n_SmSrDn := 0;
  n_SmSrDnSovm := 0;

  if nSmD <> 0 then
    n_SmSrDn := RoundTo(nSmZpKoef / nSmD, -2);
  if nCntDSovmTt <> 0 then
    n_SmSrDnSovm := RoundTo(nSmForBlnSovmTt / nCntDSovmTt, -2);
  nnSredneDnevnoe := n_SmSrDn + n_SmSrDnSovm;

  LabelMsgOsn.Caption :=
    'СммЗаработков = ' + FloatToStr(nSmZpKoef) +
    '; Дней = ' + FloatToStr(nSmD) +
    '; СрДн. = ' + FloatToStr(n_SmSrDn);
  LabelMsgSvm.Caption :=
    'СммЗарабСовм = ' + FloatToStr(nSmForBlnSovmTt) +
    '; ДнСовм = ' + FloatToStr(nCntDSovmTt) +
    '; СрДнСовм = ' + FloatToStr(n_SmSrDnSovm);
  LabelMsgCmn.Caption :=
    'Общее СреднеДневное = ' + FloatToStr(n_SmSrDn)
    + ' + ' + FloatToStr(n_SmSrDnSovm)
    + ' = ' + FloatToStr(nnSredneDnevnoe);
end;  {FillQryRBlnBy12Mes}

//------------------------------------------------------------------------------
procedure TFormEDkr.RaschetByOkl;
begin
  bQry_RBlnReady := false;
  with tblRBln do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
    CreateTable;
    Open;
  end;
  // Выбрать сведения для расчета больничных по окладу
  bQry_RBlnReady := false;
  FillQryRBlnByOkl(n_TabN);
  bQry_RBlnReady := true;
  RaschetSrDnByOkl;
  bQry_RBlnReady := true;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.FillQryRBlnByOkl(nTabN : integer);
var
  dDtBegBln: TDateTime;
  nOklTrf: double;
  nSO: integer;
  nSmMinZp: double;
begin
  InitQuery(qryRBln);
  with qryRBln do begin
    SQL.Add(
      'select r.*, Cast(-1 As SmallInt) As MyFoxFld ' +
      'from Z_RBln r ' +
      'where r.Spec_NR = :SpecNR');
    ParamByName('SpecNR').AsInteger := n_SpecNR;
    Open;
  end;

  qryRBln.Filter := 'MyFoxFld <> -1';
  bIsFoxFilter := true;
  qryRBln.Filtered := true;

  dDtBegBln := qryVBln.FieldByName('DtBeg').AsDateTime;

  nOklTrf := 0;
  nSO := 1;

  // Определить оклад и надбавки на начало больничного
  // Надбавки не брать - Ольга 10-12-2007
  // т.о. будет только одна запись с окладом. В поле CntDays подставить к-во
  // рабочих дней в месяце начала больничного
  InitQuery(qryTmp);
  with qryTmp do begin
    SQL.Add(
      'select * ' +
      'from Z_Pere ' +
      'where TabN = :TabN and Dt_Beg <= :DtBeg ' +
      'order by Dt_Beg desc, NR desc');
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('DtBeg').AsDateTime := dDtBegBln;
    Open;
    if not Eof then begin
      nOklTrf := FieldByName('OklTrf').AsFloat;
      nSO := FieldByName('SO').AsInteger;
    end;

    nSmMinZp := Form_Dm.GetMinZp2(dDtBegBln);
    nOklTrf := Max(nOklTrf, nSmMinZp);

    if nOklTrf <> 0 then begin
      qryRBln.Append;
      qryRBlnTabN.AsInteger     := nTabN;
      if nSO = 1 then
        qryRBlnNmPokaz.AsString := 'Оклад'
      else if nSO = 2 then
        qryRBlnNmPokaz.AsString := 'Тариф'
      else
        qryRBlnNmPokaz.AsString := 'nSO=' + IntToStr(nSO) + '?';

      qryRBlnSumProc.AsFloat    := nOklTrf;
      qryRBlnSmVZachet.AsFloat  := nOklTrf;
      qryRBlnCntDays.AsFloat    := 30.44;
      qryRBln.Post;
    end;
  end; {with}
  ReleaseQuery(qryTmp);
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RaschetByPredList;
begin
  CalcDayAverages;

  // можно показать (а можно и не показывать) расчет для пред. листка
  with tblRBln do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
    CreateTable;
    Open;
  end;

  LabelMsgOsn.Caption := 'В расчет принимаются средние предыдущего листка:';
  if n_SmSrDn <> 0 then
    LabelMsgCmn.Caption := 'Основн.зп = ' + FloatToStr({nPredSrednee}n_SmSrDn);
  if n_SmSrDn <> 0 then
    LabelMsgSvm.Caption := 'Совмест.зп = ' + FloatToStr(n_SmSrDnSovm);
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RaspredBlnPoMes;
var
  nCntDays, nCntChas, nSmmOsn, nSmmSovm: double;
  dDtBeg, dDtEnd: TDateTime;
  nCntWrkDay: integer;
  nCntWrkChas: double;
  nYearBeg, nMnthBeg, nYearEnd, nMnthEnd, dummyWord : word;
begin
  with tblRBln do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
    CreateTable;
    Open;
  end;

  // Записать в отклонения, разбрасывая по-месячно

  // qryVBlnSmSrDn.AsFloat := nnSredneDnevnoe;
  qryVBlnSmSrDn.AsFloat := n_SmSrDn;
  qryVBlnCntChas.AsFloat := 0;

  dDtBeg  := qryVBlnDtBeg.AsDateTime;
  dDtEnd  := dDtBeg;
  DecodeDate(dDtBeg, nYearBeg, nMnthBeg, dummyWord);
  nCntDays  := 0;
  nCntChas  := 0;
  while (dDtEnd <= qryVBlnDtEnd.AsDateTime + 1) do begin
    DecodeDate(dDtEnd, nYearEnd, nMnthEnd, dummyWord);

    if (nYearEnd <> nYearBeg) or (nMnthEnd <> nMnthBeg)
        or (dDtEnd = qryVBlnDtEnd.AsDateTime + 1) then begin

      // перешли в следующий месяц - записать цифры предыдущего,
      // либо дошли до qryVBlnDtEnd.AsDateTime+1 - записать насчитанное

      if (nCntDays <> 0) then begin
        nSmmOsn := RoundTo(n_SmSrDn * qryVBlnProcOpl.AsFloat / 100, -2) * nCntDays;
        nSmmSovm := RoundTo(n_SmSrDnSovm * qryVBlnProcOpl.AsFloat / 100, -2) * nCntDays;

        tblRBlnAdd(Today, dDtBeg, dDtEnd - 1, qryVBlnVidN.AsString,
          nCntDays, nCntChas, nSmmOsn, nSmmSovm, MesRus(nMnthBeg));

        qryVBlnCntChas.AsFloat  := qryVBlnCntChas.AsFloat  + nCntChas;
      end;

      // Начать новый период (следующий месяц)
      dDtBeg := dDtEnd;
      DecodeDate(dDtBeg, nYearBeg, nMnthBeg, dummyWord);

      nCntChas := 0;
      nCntDays := 0;
    end;

    // Узнать сколько рабочих дней и сколько рабочих часов в dDtEnd
    DmMain.CheckDayForBln(dDtEnd, nCntWrkDay, nCntWrkChas, 'dkr');

    nCntChas := nCntChas + nCntWrkChas;
    nCntDays := nCntDays + nCntWrkDay;
    dDtEnd := dDtEnd + 1;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.dbGridDblClick(Sender: TObject);
var dMaxDtProc : TDateTime; nY, nM, nD : word; bKalendarn : boolean;
begin
  bKalendarn := rBtnByLast12m.Checked;
  DecodeDate(qryVBln.FieldByName('DtBeg').AsDateTime, nY, nM, nD);
  dMaxDtProc := EncodeDate(nY, nM, 1);
  ShowNuZaMGDkr(c_FamIO, n_TabN, dMaxDtProc, dsrc_RBln, bKalendarn); {Z_ShNuMG}
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.DsrcRBlnDataChange(Sender: TObject; Field: TField);
begin
  if NonModalIsActive and (dsrc_RBln.State = dsBrowse) then
    FormShowNuMG.ShowWorkDaysInMG(qryRBln.FieldByName('ZaMesGod').AsDateTime);
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.qryRBlnAfterPost(DataSet: TDataSet);
begin
  if bQry_RBlnReady and not bVvodClick then begin
    if rBtnByLast12m.Checked then
      RaschetSrDnBy12mes
    else
      RaschetSrDnByOkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.RaschetSrDnBy12mes;
var
  dZaMesGod: TDateTime;
  nSmZpKoef, nCntDays, nSmZpSovm, nCntDaysSovm: double;
begin
  with qryRBln do begin
    nSmZpKoef := 0;
    nCntDays := 0;
    n_SmSrDn := 0;
    nSmZpSovm := 0;
    nCntDaysSovm := 0;
    n_SmSrDnSovm := 0;

    DisableControls;
    dZaMesGod := FieldByName('ZaMesGod').AsDateTime;
    First;
    while not Eof do begin
      nSmZpKoef := nSmZpKoef + RoundTo(FieldByName('SmZpKoef').AsFloat, -2);
      nCntDays := nCntDays + RoundTo(FieldByName('CntDays').AsFloat, -2);
      nSmZpSovm := nSmZpSovm + RoundTo(FieldByName('Sm_Svm').AsFloat, -2);
      nCntDaysSovm  := nCntDaysSovm + RoundTo(FieldByName('CntDays_Svm').AsFloat, -2);
      Next;
    end;
    Locate('ZaMesGod', dZaMesGod, []);
    EnableControls;

    if nCntDays > 0 then
      n_SmSrDn := RoundTo(nSmZpKoef / nCntDays, -2);
    if nCntDaysSovm > 0 then
      n_SmSrDnSovm := RoundTo(nSmZpSovm / nCntDaysSovm, -2);
    //nnSredneDnevnoe := n_SmSrDn + n_SmSrDnSovm; // Private'ное nSredneDnevnoe

    LabelMsgOsn.Caption :=
      'СммЗаработков = ' + FloatToStr(nSmZpKoef)
      + '; Дней = ' + FloatToStr(nCntDays)
      + '; СрДн. = ' + FloatToStr(n_SmSrDn);
    LabelMsgSvm.Caption :=
      'СммЗарабСовм = ' + FloatToStr(nSmZpSovm)
      + '; ДнСовм = ' + FloatToStr(nCntDaysSovm)
      + '; СрДнСовм = ' + FloatToStr(n_SmSrDnSovm);
    LabelMsgCmn.Caption :=
      'Общее СреднеДневное = ' + FloatToStr(n_SmSrDn)
      + ' + ' + FloatToStr(n_SmSrDnSovm)
      + ' = ' + FloatToStr({nnSredneDnevnoe}n_SmSrDn + n_SmSrDnSovm);
  end; {with}
end; {RaschetSrDnBy12mes}

//------------------------------------------------------------------------------
procedure TFormEDkr.RaschetSrDnByOkl;
var nSmSrMes, nCntDays : double; nSvNR : integer;
begin
  nCntDays := 0;
  with qryRBln do begin
    nSvNR := qryRBlnNR.AsInteger;
    DisableControls;
    First;
    nSmSrMes := 0;
    while not Eof do begin
      nSmSrMes := nSmSrMes + qryRBlnSmVZachet.AsFloat;
      nCntDays := qryRBlnCntDays.AsFloat;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  //nnSredneDnevnoe := RoundTo(nSmSrMes / nCntDays, -2);
  n_SmSrDn := RoundTo(nSmSrMes / nCntDays, -2);
  LabelMsgOsn.Caption := 'СммВЗачет = ' + FloatToStr(nSmSrMes) +
                         '; ДнейВЗачёт = ' + FloatToStr(nCntDays) +
                         // '; СрДн. = ' + FloatToStr(nnSredneDnevnoe);
                         '; СрДн. = ' + FloatToStr(n_SmSrDn);
  LabelMsgCmn.Caption := '';
end; {RaschetSrDnByOkl}

//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnPrtClick(Sender: TObject);
begin
  if rBtnByLast12m.Checked {по 12-ти мес.} then
    F6_PrtBln12m(n_TabN, c_FamIO, qryVBln, qryRBln, tblRBln, '12m') {z_CmnPrt}
  else {по окладу}
    F6_PrtBln(n_TabN, c_FamIO, qryVBln, qryRBln, tblRBln, 'okl'); {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnCalendarClick(Sender: TObject);
begin
  if not bIsFormCalendar then
    ShowMyCalendar    {Z_Calend}
  else begin
    if FormMyCalendar.WindowState = wsMinimized then
      FormMyCalendar.WindowState := wsNormal;
    FormMyCalendar.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryVBlnDTLISTSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbgridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbeCntDaysExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.SetPageControlTabs;
var dDtB, dDtE : TDateTime; nCntWDays, nCntWChas : double;
begin
  dDtB := qryVBlnDtBeg.AsDateTime;
  dDtE := qryVBlnDtEnd.AsDateTime;
  if rBtnByLast12m.Checked then begin
    PageControl1.ActivePage := tsBy_N_mes; {она общая для обоих случаев}
    sBtnStep2.Hint := 'Получение информации за прошлые месяцы и корректировка';
    DmMain.GetCntWrkDaysBln(dDtB, dDtE, nCntWDays, nCntWChas, 'dkr');
    if (qryVBln.State = dsEdit) or (qryVBln.State = dsInsert) then begin
      qryVBlnAlgRasch.AsInteger := 12;
      qryVBlnCntDays.AsInteger  := Round(nCntWDays);
    end
  end else begin
    PageControl1.ActivePage := tsByOkl;
    if (qryVBln.State = dsEdit) or (qryVBln.State = dsInsert) then
      qryVBlnAlgRasch.AsInteger := 1;
    sBtnStep2.Hint := 'Получение информации об окладе и надбавках и расчет среднего';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbChBoxNchBudMesEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbChBoxNchBudMesExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnPredListClick(Sender: TObject);
var
  nTabN, nPredSpecNR: integer;
  dNewDtBeg : TDateTime;
  rSrednDnevn: TSrednDnevn;
begin
  dbePredNr.SetFocus;
  nTabN        := qryVBlnTabN.AsInteger;
  nPredSpecNR := qryVBlnPredSpec_NR.AsInteger;
  dNewDtBeg    := qryVBlnDtBeg.AsDateTime;
  if GetPredList(nTabN, dNewDtBeg, nPredSpecNR) {z_BlnPrd} then begin
    qryVBlnPredSpec_NR.AsInteger := nPredSpecNR;
    bIsPredList := true;

    if TBlnUtils.PeekVBlnBySpecNR(QryPeek, nPredSpecNR) then begin
      qryVBlnSTGCMN.AsFloat := QryPeek.FieldByName('STGCMN').AsFloat;
      qryVBlnSTG12.AsFloat := QryPeek.FieldByName('STG12').AsFloat;
    end;
    ReleaseQuery(QryPeek);

    OpenQryRBln(nPredSpecNR);
    rSrednDnevn := TBlnUtils.QuerySrDnevn(qryRBln);
    nPredSrednee := rSrednDnevn.nSrDnOsn;
    dbeProcOpl.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryVBlnCalcFields(DataSet: TDataSet);
begin
  qryVBlnSPZ.AsString := Form_Dm.KdSbu2SchBU(qryVBlnKdSpZ.AsInteger);

  qryVBlnNmPrBln.AsString := DmMain.PrBln2NmPrBln(
    TBlnUtils.DigitalToBlnType(qryVBlnDIGITAL.AsString), qryVBlnPrBln.AsInteger);

  qryVBlnPredNR.AsString  := '';
  qryVBlnPredDt.AsString  := '';

  if (qryVBlnListCont.AsString = '1') and (not qryVBlnPredSpec_NR.IsNull) then
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from Z_VBln where Spec_NR = :nPredSpec_NR');
      ParamByName('nPredSpec_NR').AsInteger := qryVBlnPredSpec_NR.AsInteger;
      Open;
      if RecordCount <> 0 then begin
        qryVBlnPredNR.AsString := FieldByName('NrList').AsString;
        qryVBlnPredDt.AsString := FieldByName('DtList').AsString;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;

  if not qryVBlnKdTemu.IsNull and (qryVBlnKdTemu.AsInteger > 0) then
    qryVBlnNmTemu.AsString := DmMain.KdTemu2NmTemu(qryVBlnKdTemu.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.tblRBlnCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  tblRBlnShVidN.AsString := DmMain.VidN2ShVidN(tblRBlnVidN.AsString, cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnRecalcPredClick(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.popOtklStornPartClick(Sender: TObject);
var dRMes, dZaMG, dSvDtBeg, dSvDtEnd : TDateTime;
    nCurOklTrf, nSmSrDn, nSmOtp : double;
    cRK, cVidN : ShortString; nCntDays : SmallInt;
begin
  // Для корректной дальнейшей работы работы нужны данные из Z_ROtkl
  nCurOklTrf := 0;
  nSmSrDn := 0;
  nSmOtp := 0;
  cRK := 'K';  // Lat
  nCntDays := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_VOtp where Spec_NR = :nSpec_NR');
    ParamByName('nSpec_NR').AsInteger := qryOtklSpec_NR.AsInteger;
    Open;
    if RecordCount > 0 then begin
      nCurOklTrf := FieldByName('CurOklTrf').AsFloat;
      nSmSrDn := FieldByName('SmSrDn').AsFloat;
      nSmOtp := FieldByName('SmOtp').AsFloat;
      cRK := FieldByName('RK').AsString;
      nCntDays := FieldByName('CntDays').AsInteger;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  dRMes := qryOtklDtProc.AsDateTime;
  dZaMG := qryOtklZaMesGod.AsDateTime;
  dSvDtBeg := qryOtklDt_Beg.AsDateTime;
  dSvDtEnd := qryOtklDt_End.AsDateTime;
  if qryStorn.Locate('ZaMesGod', dZaMG, []) then with qryStorn do begin
    Edit;
    if AddStornPart(qryStorn, dZaMG, dSvDtBeg, dSvDtEnd,
                    nCurOklTrf, nSmSrDn, nSmOtp, cRK, nCntDays) {z_EOtpP} then
      Post
    else
      Cancel; end
  else with qryStorn do begin
    bAddStornAuto := true;
    Append;
    cVidN := qryOtklVidN.AsString;
    qryStornKdSps.AsString := qryOtklKdSps.AsString;
    qryStornDtProc.AsDateTime := dRMes;
    qryStornDtStorn.AsDateTime := d_BlnDtProc;
    qryStornZaMesGod.AsDateTime := dZaMG;
    qryStornTabN.AsString := qryOtklTabN.AsString;
    qryStornVidN.AsString := cVidN; // у записи СТОРНО вид остается тот же
    qryStornChas.AsFloat := -qryOtklChas.AsFloat; // часы и сумма отрицательные
    qryStornSumma.AsFloat := -qryOtklSumma.AsFloat;  // и в поле STORN "Y"
    qryStornKdObj.AsString := qryOtklKdObj.AsString;
    qryStornKdKatP.AsString := qryOtklKdKatP.AsString;
    qryStornDt_Beg.AsString := qryOtklDt_Beg.AsString;
    qryStornSvDtBeg.AsString := qryOtklDt_Beg.AsString;
    qryStornDt_End.AsString := qryOtklDt_End.AsString;
    qryStornSvDtEnd.AsString := qryOtklDt_End.AsString;
    qryStornPdn.AsString := qryOtklPdn.AsString;
    qryStornKdSpZ.AsString := qryOtklKdSpZ.AsString;
    qryStornNotes.AsString := 'под Блн';
    qryStornSpec_NR.AsString := qryOtklSpec_NR.AsString;
    qryStornMyNotes.AsString := 'ForBln';
    qryStornStorn.AsString := 'Y';
    if AddStornPart(qryStorn, dZaMG, dSvDtBeg, dSvDtEnd, nCurOklTrf,
                           nSmSrDn, nSmOtp, cRK, nCntDays) {z_EOtpP} then begin
      Post;
      LbxStornRec.Items.Add(qryOtklZaMesGod.AsString);
      cdsF8.Append; // Добавляется полная копия записи qryOtkl
      cdsF8.FieldByName('ZaMesGod').AsString := qryStornZaMesGod.AsString;
      cdsF8.FieldByName('SvDtBeg').AsString := qryOtklDt_Beg.AsString;
      cdsF8.FieldByName('SvDtEnd').AsString := qryOtklDt_End.AsString;
      cdsF8.FieldByName('StornDtBeg').AsString := qryOtklDt_Beg.AsString;
      cdsF8.FieldByName('StornDtEnd').AsString := qryOtklDt_End.AsString;
      cdsF8.FieldByName('StornFull').AsString := 'F';
      cdsF8.Post;
      dbgrOtkl.Refresh; end
    else
      Cancel;
    bAddStornAuto := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.popOtklDelStornClick(Sender: TObject);
var dZaMG : TDateTime; i : SmallInt;
begin
  dZaMG := qryOtklZaMesGod.AsDateTime;
  if qryStorn.Locate('ZaMesGod', dZaMG, []) then begin
    qryStorn.Delete;
    if cdsF8.Locate('ZaMesGod', dZaMG, []) then
      cdsF8.Delete;
    i := LbxStornRec.Items.IndexOf(qryOtklZaMesGod.AsString);
    if i >= 0 then
      LbxStornRec.Items.Delete(i);
    dbgrOtkl.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryOtklCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  qryOtklShVidN.AsString := DmMain.VidN2ShVidN(qryOtklVidN.AsString, cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryStornCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  qryStornShVidN.AsString := DmMain.VidN2ShVidN(qryStornVidN.AsString,cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryStornNewRecord(DataSet: TDataSet);
begin
  if not bAddStornAuto then
    qryStorn.Cancel;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var i : Smallint;
begin
  with dbgrOtkl.Canvas do begin
    if not (gdFocused in State) then begin
      i := LbxStornRec.Items.IndexOf(qryOtklZaMesGod.AsString);
      if i >= 0 then
        Font.Color := clBlue;
      if (UpperCase(Column.FieldName) = 'DT_BEG') or
                         (UpperCase(Column.FieldName) = 'DT_END') then
        Font.Style := [fsBold];
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.SetDbgrOtklColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrOtkl.Columns.Count-1 do begin
    with dbgrOtkl.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SPEC_NR') or (cUpper = 'MYNOTES') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.SetDbgrStornColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrStorn.Columns.Count-1 do begin
    with dbgrStorn.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SPEC_NR') or (cUpper = 'MYNOTES') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbgrStornDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrStorn.Canvas do begin
    if not (gdFocused in State) then begin
      if ((Column.FieldName = 'SUMMA') or (Column.FieldName = 'CHAS')) and
                                              (Column.Field.Value < 0) then
        Font.Color := clRed;
      if (Column.FieldName = 'DT_BEG') or (Column.FieldName = 'DT_END') then
        Font.Style := [fsBold];
    end;
  end;
  dbgrStorn.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbgrGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbgrGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbgrOtklDblClick(Sender: TObject);
var dRMes, dZaMG : TDateTime; cVidN : ShortString; i : SmallInt;
begin
  dRMes := qryOtklDtProc.AsDateTime;
  dZaMG := qryOtklZaMesGod.AsDateTime;
  cVidN := qryOtklVidN.AsString;
  if not qryStorn.Locate('DtProc;ZaMesGod',
                     VarArrayOf([dRMes, dZaMG]), []) then
    popOtklStornPartClick(Self)
  else begin
    dZaMG := qryOtklZaMesGod.AsDateTime;
    if qryStorn.Locate('ZaMesGod', dZaMG, []) then begin
      qryStorn.Delete;
      if cdsF8.Locate('ZaMesGod', dZaMG, []) then
        cdsF8.Delete;
      i := LbxStornRec.Items.IndexOf(qryOtklZaMesGod.AsString);
      if i >= 0 then
        LbxStornRec.Items.Delete(i);
      dbgrOtkl.Refresh;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где  нужно,  пользуйтесь  контекстными  меню');
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryRBlnNewRecord(DataSet: TDataSet);
begin
  if bQry_RBlnReady then
    qryRBln.Cancel;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryVBlnVIDNValidate(Sender: TField);
begin
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryViNuCalcFields(DataSet: TDataSet);
var nNdbSpecNR : integer;  dNdbDtBeg, dNdbDtEnd : TDateTime;
begin
  if (qryViNuSovm.AsString = '1') and (qryViNuSpec_NR.AsInteger > 0) then begin
    nNdbSpecNR := qryViNuSpec_NR.AsInteger;
    if DmMain.GetNdbDates(nNdbSpecNR, dNdbDtBeg, dNdbDtEnd) then begin
      qryViNuNdbDtBeg.AsDateTime := dNdbDtBeg;
      qryViNuNdbDtEnd.AsDateTime := dNdbDtEnd;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.DbgrRBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin  // Чхала она на этот DrawColumnCell ??? !!!
  with DbgrBlnResume.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if ((cFldNm = 'SM_SVM') or (cFldNm = 'CNTDAYS_SVM')) and not
           Column.Field.IsNull and (Column.Field.AsFloat <> 0) then
        Font.Color := clRed;
      if (cFldNm = 'SM_SVM') or (cFldNm = 'CNTDAYS_SVM') then begin
        Font.Style := [fsItalic];
        Brush.Color := clYellow;
      end;
    end;
  end;
  DbgrRBln.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnKdTemuClick(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
begin
  dbeKdTemu.SetFocus;
  with dbeKdTemu.DataSource.DataSet as TQuery do begin
    nKdTemu := dbeKdTemu.Field.AsInteger;
    cNmTemu := dbeNmTemu.Field.AsString;
    if GetTemu(nKdTemu, nKdPSch, cNmTemu, cPSch) {z_ShwTem} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      dbeKdTemu.Field.AsInteger := nKdTemu;
      dbeNmTemu.Field.AsString  := cNmTemu;
      dbeKdSpZ.Field.AsInteger  := nKdPSch;
      dbeSpZ.Field.AsString     := cPSch;
      dbeKdTemu.OnExit := NIL;
      dbeSpZ.SetFocus;
      dbeKdTemu.OnExit := dbeKdTemuExit;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbeKdTemuExit(Sender: TObject);
var
  nKdTemu, nKdPSch, nKdSpZ: SmallInt;
  cNmTemu, cPSch, cSchBU: ShortString;
  nTabN : integer; dOnDate : TDateTime;
begin
  if not dbeKdTemu.Field.IsNull then begin  // поставить в dbeKdSpZ и в
    nKdTemu := dbeKdTemu.Field.AsInteger;   // dbeSpZ "темные" значения счёта
    if CheckKdTemu(nKdTemu, nKdPSch, cNmTemu, cPSch) {z_ShwTem} then begin
      dbeNmTemu.Field.AsString := cNmTemu;
      dbeKdSpZ.Field.AsInteger  := nKdPSch;
      dbeSpZ.Field.AsString     := cPSch;
      (Sender as TDBEdit).Color := clWindow;
      dbeSpZ.SetFocus; end
    else begin
      DbeKdTemu.SetFocus;
      ShowMessage('Нет темы "' + IntToStr(nKdTemu) + '" в справочнике тем');
    end; end
  else begin  // в dbeKdSpZ и в dbeSpZ "перемещенские" значения счета
    dOnDate := Today;                                    //по умолчанию
    nTabN := dbeTabN.Field.AsInteger;
    if Form_Dm.GetSpZByPere(nTabN, dOnDate, nKdSpZ, cSchBU) then begin
      dbeNmTemu.Field.AsString := '';
      dbeKdSpZ.Field.AsInteger := nKdSpZ;
      dbeSpZ.Field.AsString    := cSchBU;
      (Sender as TDBEdit).Color := clWindow;
      dbeSpZ.SetFocus;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.CalcDayAverages;
var
  DaysFullTime, DaysPartTime: double;
  SmVZachetOsn: double;
begin
  // QryRBln уже открыт
  // Считаем среднедневные для основных сумм и совместительских.

  n_SmSrDn := 0;
  n_SmSrDnSovm := 0;

  DaysFullTime := 0;
  DaysPartTime := 0;

  with QryRBln do begin
    First;

    while not Eof do begin
      SmVZachetOsn := FieldByName('SmVZachet_Cmn').AsFloat - FieldByName('SmVZachet_Svm').AsFloat;

      // Такое может быть для расчётов "по окладу".
      // Проблема в том, что при расчёте по 12-ти мес. и по окладу суммы ложатся в разные
      // поля. По 12-мес. - в SmVZachet_Cmn и SmVZachet_Svm, по окл. - в SmVZachet.
      if SmVZachetOsn = 0 then
        SmVZachetOsn := FieldByName('SmVZachet').AsFloat;

      n_SmSrDn := n_SmSrDn + SmVZachetOsn;
      n_SmSrDnSovm := n_SmSrDnSovm + FieldByName('SmVZachet_Svm').AsFloat;

      DaysFullTime := DaysFullTime + FieldByName('CntDays').AsFloat;
      DaysPartTime := DaysPartTime + FieldByName('CntDays_Svm').AsFloat;

      Next;
    end; {Eof}

    if DaysFullTime <> 0 then
      n_SmSrDn := RoundTo(n_SmSrDn / DaysFullTime, -2)
    else
      n_SmSrDn := 0;

    if DaysPartTime <> 0 then
      n_SmSrDnSovm := RoundTo(n_SmSrDnSovm / DaysPartTime, -2)
    else
      n_SmSrDnSovm := 0;
  end; {QryRBln}
end; {CalcDayAverages}

//------------------------------------------------------------------------------
procedure TFormEDkr.RefreshFamIO;
begin
  LabelFamIO.Caption := Data.GetFamIO;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RefreshAlhorithm;
begin
  rBtnByLast12m.Checked := Data.GetAlgRasch = 12;
  rBtnByLastOkl.Checked := not rBtnByLast12m.Checked;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RefreshScope;
begin
  rBtnOnlyCurSps.Checked := Data.GetUsrList <> 0;
  rBtnAllSps.Checked := not rBtnOnlyCurSps.Checked;
end;

//------------------------------------------------------------------------------
// Обновляет средние значения.
//------------------------------------------------------------------------------
procedure TFormEDkr.RefreshAverages;
var
  SrednDnevn: TSrednDnevn;
begin
  SrednDnevn := Data.GetAverages;
end;

//------------------------------------------------------------------------------
// При переходе на цифровой декретный и обратно, меняем код и название.
//------------------------------------------------------------------------------
procedure TFormEDkr.DBChBoxDigitalClick(Sender: TObject);
var
  BlnType: TBlnType;
begin
  if DBChBoxDigital.Checked then
    BlnType := BlnTypeDigital
  else
    BlnType := BlnTypeStandard;

  Data.
    QryVBlnPrBln.AsInteger := TBlnUtils.GetBlnReason(BlnType, PREGNANCY);
    QryVBlnNmPrBln.AsString :=
      DmMain.PrBln2NmPrBln(BlnType, QryVBlnPrBln.AsInteger);
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.DBChBoxListContClick(Sender: TObject);
begin
  EnablePrevList(DBChBoxListCont.Checked);
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.dbeShObjKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObj.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbeShKatPKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKatP.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                        Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZ.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbeStgCmnKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnPredList.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.DbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.DbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbeDtBegExit(Sender: TObject);
var dDtB, dDtE, dDum : TDateTime;
    nKdObj, nKdKatP, nKdSpZ, nDum : integer;
    cDum : string;
    nFloatDum : double; cSpAv : string1; bDum : boolean; nInv : SmallInt;
    nCntWDays, nCntWChas : double;
begin
//  Сказано, что ДатаЛистка ВСЕГДА та же, что и ДатаНачала больничного
  qryVBln.FieldByName('DtList').AsString :=
                                      qryVBln.FieldByName('DtBeg').AsString;
  if not MyEmptyDate(qryVBln.FieldByName('DtBeg').AsString) and
                               (qryVBlnVidN.AsString = '2602') and
          (qryVBln.FieldByName('DtBeg').AsDateTime > dDtBegNextMes) then begin
    LabelNchBudMes.Enabled   := true;
    dbChBoxNchBudMes.Enabled := true; end
  else begin
    LabelNchBudMes.Enabled   := false;
    dbChBoxNchBudMes.Enabled := false;
  end;
  dDtB := qryVBln.FieldByName('DtBeg').AsDateTime;
  DmMain.GetPereInf(n_TabN, dDtB, nKdObj, nKdKatP, nDum, nDum, nDum,
                         nKdSpZ, nDum, nDum, nFloatDum, nFloatDum, nFloatDum,
                              cSpAv, cDum, cDum, dDum, bDum, bDum, bDum, nInv);
  qryVBln.FieldByName('KdObj').AsInteger  := nKdObj;
  qryVBln.FieldByName('KdKatP').AsInteger := nKdKatP;
  qryVBln.FieldByName('KdSpZ').AsInteger  := nKdSpZ;
  if MyEmptyDate(qryVBln.FieldByName('DtList').AsString) then
      qryVBln.FieldByName('DtList').AsString :=
                                         qryVBln.FieldByName('DtBeg').AsString;
  if not MyEmptyDate(qryVBln.FieldByName('DtBeg').AsString) and
        not MyEmptyDate(qryVBln.FieldByName('DtEnd').AsString) then begin
    dDtE := qryVBln.FieldByName('DtEnd').AsDateTime;
    if rBtnByLast12m.Checked then
      DmMain.GetCntWrkDaysBln(dDtB, dDtE, nCntWDays, nCntWChas, 'dkr')
    else
      DmMain.GetCntWrkDaysBln(dDtB, dDtE, nCntWDays, nCntWChas, 'blk');
    qryVBln.FieldByName('CntDays').AsInteger := Round(nCntWDays);
  end;
  if not MyEmptyDate(qryVBln.FieldByName('DtBeg').AsString) then begin
    if qryVBln.FieldByName('DtBeg').AsDateTime >= dDt150704 then begin
//      rBtnByLast12m.Checked := true;
      LabelCntDays.Caption := 'Календ.дней';
      dbeCntDays.Hint := 'Количество календарных больничных дней'; end
    else if qryVBln.FieldByName('DtBeg').AsDateTime < dDt150704 then begin
//      rBtnByLast6m.Checked := true;
      LabelCntDays.Caption := 'Рабоч.дней';
      dbeCntDays.Hint := 'Количество рабочих больничных дней';
    end;
  end;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbeDtEndExit(Sender: TObject);
var nCntWDays, nCntWChas : double; dDtB, dDtE : TDateTime;
begin
  if MyEmptyDate((Sender as TDBEdit).Text) then
    qryVBln.FieldByName('CntDays').AsString := ''
  else begin
    dDtB := qryVBlnDtBeg.AsDateTime;
    dDtE := qryVBlnDtEnd.AsDateTime;
    if rBtnByLast12m.Checked or rBtnByLastOkl.Checked then
      DmMain.GetCntWrkDaysBln(dDtB, dDtE, nCntWDays, nCntWChas, 'dkr');
    qryVBln.FieldByName('CntDays').AsInteger := Round(nCntWDays);
  end;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.BtnPrBlnClick(Sender: TObject);
var
  eBlnType: TBlnType;
  nPrBln: SmallInt;
  cNmPrBln: ShortString;
begin
  dbePrBln.SetFocus;
  nPrBln := qryVBlnPrBln.AsInteger;

  if DBChBoxDigital.Checked then
    eBlnType := BlnTypeDigital
  else
    eBlnType := BlnTypeStandard;

  if GetPrBln(eBlnType, nPrBln, cNmPrBln) {z_PrBln} then begin
    dbePrBln.Field.AsInteger := nPrBln;
    dbeDtBeg.SetFocus;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.qryVBlnPRBLNValidate(Sender: TField);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnObjClick(Sender: TObject);
var nKdObj, nKdSpZ : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  dbeShObj.SetFocus;
  nKdObj := dbeShObj.DataSource.DataSet.FieldByName('KdObj').AsInteger;
  if GetKdObj(nKdObj, nKdSpZ, cNmObj, cShObj, bWasUpdated) {Z_TObj} then begin
    dbeShObj.DataSource.DataSet.FieldByName('KdObj').AsInteger := nKdObj;
    dbeShKatP.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer; cNmKatP, cShKatP : string;
begin
  dbeShKatP.SetFocus;
  nKdKatP := dbeShKatP.DataSource.DataSet.FieldByName('KdKatP').AsInteger;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {Z_GtPers} then begin
    dbeShKatP.DataSource.DataSet.FieldByName('KdKatP').AsInteger := nKdKatP;
    dbeKdTemu.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnSPZClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSPZ.SetFocus;
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSPZ := FieldByName('KdSPZ').AsInteger;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSPZ').AsInteger := nKdSPZ;
      dbeNrList.SetFocus;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Файлы инициализации.
//------------------------------------------------------------------------------
procedure TFormEDkr.ReadIniFile;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 420);
    Width  := ReadInteger(SECTION, 'wW', 555);

    PredefVidN := ReadString(SECTION, 'cLastVidN', '2602');
    Predef12Mnth := ReadInteger(SECTION, 'nAlgRsh', 12) = 12;
    PredefAllSps := ReadBool(SECTION, 'AllSps', false);;
    PredefDigital := ReadBool(SECTION, 'Digital', false);
    PredefKdSpz := ReadInteger(SECTION, 'nLastKdSPZ', 1209);

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.WriteIniFile;
var
  AlgRasch: integer;
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);

    WriteString(SECTION, 'cLastVidN', PredefVidN);

    if rBtnByLast12m.Checked then
      AlgRasch := 12
    else;
      AlgRasch := 1;
    WriteInteger(SECTION, 'nAlgRsh', AlgRasch);

    WriteBool(SECTION, 'AllSps', RBtnAllSps.Checked);
    WriteBool(SECTION, 'Digital', DBChBoxDigital.Checked);
    WriteInteger(SECTION, 'nLastKdSPZ', PredefKdSpz);

    Free;
  end;
end;

end.
