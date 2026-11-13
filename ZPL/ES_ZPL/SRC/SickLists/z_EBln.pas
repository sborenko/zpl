
// Вид 2601 (уход) платится только из фонда. 5-дневку выключаем и запрещаем
// Вид 2604 с причиной = 3, 4, 5 - (уход) ведёт себя так-же как и 2601
// Вид 2603 (5-дневка) 5-дневку включаем и запрещаем, фонд выключаем и запрещаем

unit z_EBln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, IniFiles, ComCtrls, ExtCtrls, Buttons,
  Math, Mask, DBCtrls, Grids, DBGrids, Menus, DBClient,
  DateLib, SickPregCmn, Provider, DisPregDays;

type
  String3 = string[3];
  String4 = string[4];

  TFormEBln = class(TForm)
    qryVBln: TQuery;
    dsrcVBln: TDataSource;
    updVBln: TUpdateSQL;
    qryVBlnNR: TIntegerField;
    qryVBlnDTPROC: TDateTimeField;
    qryVBlnTABN: TIntegerField;
    qryVBlnDTBEG: TDateTimeField;
    qryVBlnDTEND: TDateTimeField;
    qryVBlnPROCOPL: TFloatField;
    qryVBlnKDOBJ: TSmallintField;
    qryVBlnKDKATP: TSmallintField;
    qryVBlnNOTES: TStringField;
    qryVBlnShVidN: TStringField;
    qryVBlnShObj: TStringField;
    qryVBlnShKatP: TStringField;
    qryVBlnCNTDAYS: TSmallintField;
    qryVBlnCNTCHAS: TFloatField;
    qryVBlnSMSRDN: TFloatField;
    qryVBlnSPEC_NR: TIntegerField;
    qryVBlnNRLIST: TStringField;
    qryVBlnDTLIST: TDateTimeField;
    qryVBlnSMBLN: TFloatField;
    qryVBlnALGRASCH: TSmallintField;
    qryVBlnKDSPZ: TSmallintField;
    qryVBlnSPZ: TStringField;
    qryVBlnVIDN: TStringField;
    qryVBlnKDSPS: TSmallintField;
    qryVBlnNCHBUDMES: TStringField;
    qryVBlnDAY5FIRST: TStringField;
    qryVBlnLISTCONT: TStringField;
    qryVBlnPREDSPEC_NR: TIntegerField;
    qryVBlnPredNr: TStringField;
    qryVBlnPredDt: TDateField;
    qryVBlnLNKSTOTP: TIntegerField;
    qryVBlnPRBLN: TSmallintField;
    qryVBlnNmPrBln: TStringField;
    qryVBlnSHEMA: TSmallintField;
    qryVBlnKDTEMU: TSmallintField;
    qryVBlnNmTemu: TStringField;
    qryVBlnSTGCMN: TFloatField;
    qryVBlnSTG12: TFloatField;
    qryVBlnSERLIST: TStringField;
    qryVBlnOLDKDVIDN: TSmallintField;
    qryVBlnPredSer: TStringField;
    qryVBlnDIGITAL: TStringField;
    qryVBlnAct_Dt: TDateTimeField;
    qryVBlnAct_Num: TStringField;
    tblRBlnDtProc: TDateField;
    tblRBlnDtBeg: TDateField;
    tblRBlnDtEnd: TDateField;
    tblRBlnCntDays: TSmallintField;
    tblRBlnCntChas: TFloatField;
    tblRBlnSmm: TFloatField;
    tblRBlnNotes: TStringField;
    tblRBlnSpec_NR: TIntegerField;
    qryTmp: TQuery;
    tblRBln: TTable;
    dsrcRBln: TDataSource;
    qryRBln: TQuery;
    dsrc_RBln: TDataSource;
    upd_RBln: TUpdateSQL;
    qryRBlnNR: TIntegerField;
    qryRBlnSPEC_NR: TIntegerField;
    qryRBlnZAMESGOD: TDateTimeField;
    qryRBlnSMZARABOTKA: TFloatField;
    qryRBlnKOEFZP: TFloatField;
    qryRBlnSmZpKoef: TFloatField;
    PanelLeft: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    sBtnVidN: TSpeedButton;
    sBtnObj: TSpeedButton;
    sBtnKatP: TSpeedButton;
    Label12: TLabel;
    sBtnSPZ: TSpeedButton;
    LabelCntDays: TLabel;
    dbeDtPrik: TDBEdit;
    dbeDtEnd: TDBEdit;
    dbeShObj: TDBEdit;
    dbeShKatP: TDBEdit;
    dbeShVidN: TDBEdit;
    dbeSPZ: TDBEdit;
    dbeNrList: TDBEdit;
    dbeCntDays: TDBEdit;
    dbeDtBeg: TDBEdit;
    LabelFamIO: TLabel;
    PanelRight: TPanel;
    Splitter1: TSplitter;
    qryRBlnRusMesGod: TStringField;
    PanelBottom: TPanel;
    bBtnVvod: TBitBtn;
    bBtnCancel: TBitBtn;
    BtnStep2: TBitBtn;
    sBtnStep3: TSpeedButton;
    PanelRBottom: TPanel;
    PanelResults: TPanel;
    LblTopAvrg: TLabel;
    LblMidAvrg: TLabel;
    dbgrRBln: TDBGrid;
    PanelRTop: TPanel;
    popMnu: TPopupMenu;
    popHead: TMenuItem;
    popNuDetails: TMenuItem;
    sBtnStep1: TSpeedButton;
    LabelTabN: TLabel;
    dbeTabN: TDBEdit;
    sBtnUpi: TSpeedButton;
    sBtnPrt: TSpeedButton;
    bBtnPereschet: TBitBtn;
    sBtnCalendar: TSpeedButton;
    dbeVidN: TDBEdit;
    tblRBlnVIDN: TStringField;
    rGrpAlgoritm: TGroupBox;
    rBtnByLastOkl: TRadioButton;
    qryRBlnKDSPS: TSmallintField;
    PageControl: TPageControl;
    tsBy12Mes: TTabSheet;
    tsByOkl: TTabSheet;
    dbgr_RBln: TDBGrid;
    dbgrRSrOkl: TDBGrid;
    LabelRSrOkl: TLabel;
    LbxFilter: TListBox;
    dbChBoxNchBudMes: TDBCheckBox;
    LabelNchBudMes: TLabel;
    qryRBlnTABN: TIntegerField;
    tblRBlnShVidN: TStringField;
    bBtnNew: TBitBtn;
    tblSvRBln: TTable;
    qryRBlnMYFOXFLD: TSmallintField;
    qryRBlnNMPOKAZ: TStringField;
    qryRBlnVIDN: TStringField;
    qryRBlnSUMPROC: TFloatField;
    qryRBlnSP: TStringField;
    qryRBlnShVidN: TStringField;
    sBtnRecalcPred: TSpeedButton;
    tsStornOtp: TTabSheet;
    sBtnStornOtp: TSpeedButton;
    Splitter2: TSplitter;
    DbgrOtkl: TDBGrid;
    DbgrStorn: TDBGrid;
    sBtnBackToBln: TSpeedButton;
    PopOtkl: TPopupMenu;
    PopOtklStorn: TMenuItem;
    PopOtklUnstorn: TMenuItem;
    LbxStornRec: TListBox;
    tblDbg: TTable;
    qryTmp2: TQuery;
    LabelLastDtPriem: TLabel;
    LabelMsgDtPriem: TLabel;
    Label6: TLabel;
    dbePrBln: TDBEdit;
    sBtnPrBln: TSpeedButton;
    dbeNmPrBln: TDBEdit;
    qryRBlnCNTDAYS: TFloatField;
    rBtnByLast12m: TRadioButton;
    GrBoxSps: TGroupBox;
    rBtnAllSps: TRadioButton;
    rBtnOnlyCurSps: TRadioButton;
    qryRBlnSM_SVM: TFloatField;
    qryRBlnCNTDAYS_SVM: TFloatField;
    qryRBlnSMVZACHET_SVM: TFloatField;
    qryRBlnSMVZACHET_CMN: TFloatField;
    LblBtmAvrg: TLabel;
    Label7: TLabel;
    dbeNmTemu: TDBEdit;
    sBtnKdTemu: TSpeedButton;
    dbeKdTemu: TDBEdit;
    dbeKdSpZ: TDBEdit;
    QryVBlnTree: TQuery;
    dbeSerListC: TDBEdit;
    tblRBlnSmmSovm: TFloatField;
    DBChBoxDigital: TDBCheckBox;
    QryPeek: TQuery;
    PanelOther: TPanel;
    sBtnPredList: TSpeedButton;
    LabelProcOpl: TLabel;
    Label11: TLabel;
    LabelPredListNr: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label9: TLabel;
    dbePredDt: TDBEdit;
    dbePredNR: TDBEdit;
    dbePredSer: TDBEdit;
    dbeProcOpl: TDBEdit;
    dbeNotes: TDBEdit;
    DBChBoxContList: TDBCheckBox;
    dbeStagL12: TDBEdit;
    dbeStagCmn: TDBEdit;
    PanelAct: TPanel;
    DBEActDt: TDBEdit;
    LblActDt: TLabel;
    Label14: TLabel;
    DBEActNum: TDBEdit;
    qryRBlnSmVZachet: TFloatField;
    GrpBxDays: TGroupBox;
    PrincDays: TFrameDisPregDays;
    SupplDays: TFrameDisPregDays;
    qryVBlnDayFlags: TWordField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure sBtnVidNClick(Sender: TObject);
    procedure sBtnObjClick(Sender: TObject);
    procedure sBtnKatPClick(Sender: TObject);
    procedure sBtnSPZClick(Sender: TObject);
    procedure qryVBlnAfterPost(DataSet: TDataSet);
    procedure qryVBlnBeforePost(DataSet: TDataSet);
    procedure dbeDtBegExit(Sender: TObject);
    procedure dbeDtEndExit(Sender: TObject);
    procedure qryRBlnCalcFields(DataSet: TDataSet);
    procedure sBtnStep1Click(Sender: TObject);
    procedure BtnStep2Click(Sender: TObject);
    procedure sBtnStep3Click(Sender: TObject);
    procedure dbgridDblClick(Sender: TObject);
    procedure dsrc_RBlnDataChange(Sender: TObject; Field: TField);
    procedure qryRBlnAfterPost(DataSet: TDataSet);
    procedure sBtnUpiClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure bBtnVvodClick(Sender: TObject);
    procedure bBtnPereschetClick(Sender: TObject);
    procedure dbeShVidNKeyDown(Sender: TObject; var Key: Word;
                                                Shift: TShiftState);
    procedure dbeVidNKeyDown(Sender: TObject; var Key: Word;
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
    procedure dbChBoxNchBudMesEnter(Sender: TObject);
    procedure dbChBoxNchBudMesExit(Sender: TObject);
    procedure dbeTabNExit(Sender: TObject);
    procedure sBtnPredListClick(Sender: TObject);
    procedure qryVBlnCalcFields(DataSet: TDataSet);
    procedure DBChBoxContListClick(Sender: TObject);
    procedure tblRBlnCalcFields(DataSet: TDataSet);
    procedure bBtnNewClick(Sender: TObject);
    procedure dbePredNRKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure sBtnRecalcPredClick(Sender: TObject);
    procedure sBtnStornOtpClick(Sender: TObject);
    procedure sBtnBackToBlnClick(Sender: TObject);
    procedure PopOtklStornClick(Sender: TObject);
    procedure PopOtklUnstornClick(Sender: TObject);
    procedure DbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrGridEnter(Sender: TObject);
    procedure dbgrGridExit(Sender: TObject);
    procedure DbgrStornDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPrBlnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rBtnByLast12mClick(Sender: TObject);
    procedure qryRBlnNewRecord(DataSet: TDataSet);
    procedure dbgr_RBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnKdTemuClick(Sender: TObject);
    procedure dbeKdTemuExit(Sender: TObject);
    procedure rBtnByLastOklClick(Sender: TObject);
    procedure dsrc_RBlnUpdateData(Sender: TObject);
    procedure ChBoxDaysClick(Sender: TObject);
    procedure qryVBlnDTBEGChange(Sender: TField);
    procedure qryVBlnDTENDChange(Sender: TField);
    procedure qryVBlnLISTCONTChange(Sender: TField);
    procedure qryVBlnPRBLNChange(Sender: TField);
    procedure PopOtklPopup(Sender: TObject);

  private
    n_TabN: integer;
    c_FamIO: string;
    n_SpecNR : integer;
    b_ShowTabN: boolean;
    b_Pereschet, b_PereschetPredLista,
    b_CanUpd: boolean;

    n_AlgRasch: SmallInt;
    n_CurrentStep: integer;

    d_BlnDtProc : TDateTime;
    d_DtBegNextMes : TDateTime;  // Дата начала следующего за d_BlnDtProc месяца
    b_EditMode : boolean;
    b_BlnIsSovm : boolean;   // Больн. совместителям (виды "2621" - "2625")
    n_LastKdSPZ : integer;
    _LastVidN : string4;
    nCntDnejForRBln : double;       // К-во дней в месяце для расчета по окладу
    bVvodClick : boolean;           // нажата кнопка "Ввод" (чтобы не делать
                                    // расчет среднедневного заработка)
    bQryRBlnFilled: boolean;        // чтобы не делать расчет среднедневного
                                    // заработка, пока считываются 6 месяцев
    bIsFoxFilter : boolean;
    bTabNBySBtnUpi : boolean;
    _DigitalIsOn: boolean;
    mSvTabSheet : TTabSheet;        // запомнить акт. TabSheet перед -> на tsStornOtp
    dDt150704 : TDateTime;

    r_SrednDnevn: TSrednDnevn;
    PanelOtherOriginalTop: integer;

    // Количество больничных дней за счёт предприятия
    EntprDaysMax: Integer;

    procedure CommonInit;
    procedure InitNew;
    procedure InitEdit;
    procedure CalcVariables;

    procedure AddNewBlnRec(TabN: Integer);

    procedure SetCurrentStep(nStep: integer);

    procedure RefreshControls;
    procedure SetControlsColor(color: TColor);
    function PredListExists: boolean;

    function GetSrednDnevn: double;

    procedure CreateRBlnTable;

    procedure LoadSrDn;
    procedure LoadSrDnByPredList;  // рассчитать по сумме среднего из пред.листка
    procedure LoadSrDnByOkl;

    procedure FillQryRBlnByOkl(nTabN : integer);
    procedure FillTblRBln;

    procedure Raschet;
    procedure RaschetByOkl;
    procedure RaschetBy12mes;

    procedure OpenQryVBln(nSpecNR : integer);
    procedure OpenQryRBln(nSpecNR : integer);
//    procedure OpenQryOtkl(nTabN, nSpec_NR: integer);
//    procedure OpenQryStorn(nTabN, nSpec_NR: integer);
//    procedure PrepareQryStorn;

    function  CheckStep1 : boolean;

    procedure tblRBlnAdd(dDtProc, dDtB, dDtE : TDateTime;
              cVidN : string4;
              nCntDays, nCntChas, nSmmOsn, nSmmSovm : double; cNotes : string);
    procedure SaveToOtkl;
    procedure DeleteFromOtklOldRecords(n_SpecNR : integer);
    procedure ApplyStepToControls;
    procedure SaveResults;
    procedure SaveQry_RBln;
    procedure SaveQry_RBlnInPredList(nPredSpecNR : integer);
    procedure DelTmpTables;
    procedure DelRBlnTable;
    procedure HideRBlnDebugColumns;
    procedure SetDbgrOtklColumns;
    procedure SetDbgrStornColumns;
    function GetLastDtPrm(TabN: integer; DtBegBln: TDateTime): TDateTime;

    function PrevBlnEntprDays(PrevSpecNR, SpecNR: integer): integer;
    procedure OpenVBlnTree;
    function GetVBlnRoot(PrevSpecNR: integer): integer;
    function PassVBlnTree(NodeSpecNR, ExcludeSpecNR: integer): integer;

    procedure ShowHidePanelAct;
    procedure DisplayAverages;

    function InitDayFlags: Integer;
    function EntprDaysOnly: Boolean;
    function FundDaysOnly: Boolean;
    function SupplAvailable: Boolean;
    procedure AdjustSupplFlags;
    procedure ApplyDayFlags;
    procedure HandleSupplChange;

    procedure SelectVidN;
    procedure CheckProcOpl;
    function GetEntprDaysMax(VidN: ShortString): Integer;

  public
    class function AddEdtBln(var nTabN: integer; cFamIO: ShortString;
  nSpecNR: integer; bShowTabN, bCanUpd: boolean; var bPereschet: boolean): boolean;

  end;

const SECTION = 'Z_EBln';

var
  FormEBln: TFormEBln;
  bIsFormShowNuMGBln : boolean;

implementation

uses
  a_Const, a_DM, a_Lib, a_SBU, a_ShwErr,
  z_DM, z_Main, z_GtQUpi, z_TVids, z_TObj, z_TUpi, z_GtPers, z_ShNuMG,
  z_CmnPrt, z_Calend, z_BlnPrd, z_EOtpP, z_PrBln, z_ShwTem,
  NumUtils, QryLib, ErrorUtils, AppSettings, CalcBy12Mnth,
  DModSickPreg, RptSickLastMnth, DModVacatStorn, FormVacatStorn;

{$R *.dfm}

//------------------------------------------------------------------------------
// Создание и открытие диалога редактирования больничного листа
// nTabN сделан var'ом, чтобы можно было разыскать введенный TabN из z_ShBln
//------------------------------------------------------------------------------
class function TFormEBln.AddEdtBln(
  var nTabN: integer; cFamIO: ShortString;
  nSpecNR: integer; bShowTabN, bCanUpd: boolean; var bPereschet: boolean): boolean;
begin
  Result := false;

  DmSickPreg := TDmSickPreg.Create(nil);

  FormEBln := TFormEBln.Create(Application);

  with FormEBln do begin
    // Применить параметры
    n_TabN     := nTabN;
    c_FamIO    := cFamIO;
    b_ShowTabN := bShowTabN;
    b_CanUpd   := bCanUpd;
    n_SpecNR   := nSpecNR;

    if nSpecNR = 0 then // Ввод нового больничного
      InitNew
    else // Редактирование существующего
      InitEdit;

    CalcVariables;
    RefreshControls;

    // Завершение
    if ShowModal = mrOk then begin
      bPereschet := b_Pereschet;
      nTabN := n_TabN;
      Result := true;
    end;

    DelTmpTables;
    Free;
  end;

  DmSickPreg.Free;
end;

//------------------------------------------------------------------------------
// Создание формы
//------------------------------------------------------------------------------
procedure TFormEBln.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 420);
    Width  := ReadInteger(SECTION, 'wW', 555);

    _LastVidN    := ReadString(SECTION, 'cLastVidN', '2604');
    n_LastKdSPZ  := ReadInteger(SECTION, 'nLastKdSPZ', 1209);
    n_AlgRasch   := ReadInteger(SECTION, 'nAlgRsh', 12);

    _DigitalIsOn := ReadBool(SECTION, 'Digital', false);

    Free;
  end;

  if FileExists(cDirVids + 'RsBln09.vid') then
    dbgr_RBln.Columns.LoadFromFile(cDirVids + 'RsBln09.vid');
  if FileExists(cDirVids + 'RsBln011.vid') then
    dbgrRBln.Columns.LoadFromFile(cDirVids + 'RsBln011.vid');
  if FileExists(cDirVids + 'RsBlnOkl.vid') then
    dbgrRSrOkl.Columns.LoadFromFile(cDirVids + 'RsBlnOkl.vid');
    
  if FileExists(cDirVids + 'RsBlnOtkl.vid') then
    DbgrOtkl.Columns.LoadFromFile(cDirVids + 'RsBlnOtkl.vid');
  if FileExists(cDirVids + 'RsBlnStorn.vid') then
    DbgrStorn.Columns.LoadFromFile(cDirVids + 'RsBlnStorn.vid');

  tsBy12Mes.TabVisible := false;
  tsByOkl.TabVisible := false;
  tsStornOtp.TabVisible := false;

  PanelOtherOriginalTop := PanelOther.Top;
  ShowHidePanelAct;

  // Модуль сторнирования отпусков
  DmVacatStorn := TDmVacatStorn.Create(nil);
end;

//------------------------------------------------------------------------------
// Закрытие формы
//------------------------------------------------------------------------------
procedure TFormEBln.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Модуль сторнирования отпусков
  DmVacatStorn.Free;
  
  if bIsFormMyCalendar then
    FormMyCalendar.Close;
  if bIsFormShowNuMGBln then
    FormShowNuMG.Close;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if rBtnByLast12m.Checked then
      WriteInteger(SECTION, 'nAlgRsh', 12)
    else
      WriteInteger(SECTION, 'nAlgRsh', 1);

    WriteInteger(SECTION, 'GrRBlnH', PanelRTop.Height);
    WriteString(SECTION, 'cLastVidN', _LastVidN);
    WriteInteger(SECTION, 'nLastKdSPZ',
               dbeVidN.DataSource.DataSet.FieldByName('KdSPZ').AsInteger);

    WriteBool(SECTION, 'Digital', qryVBlnDIGITAL.AsString = 'Y');
    Free;
  end;

  dbgr_RBln.Columns.SaveToFile(cDirVids + 'RsBln09.vid');
  dbgrRBln.Columns.SaveToFile(cDirVids + 'RsBln011.vid');
  dbgrRSrOkl.Columns.SaveToFile(cDirVids + 'RsBlnOkl.vid');

  DbgrOtkl.Columns.SaveToFile(cDirVids + 'RsBlnOtkl.vid');
  DbgrStorn.Columns.SaveToFile(cDirVids + 'RsBlnStorn.vid');
end;

//------------------------------------------------------------------------------
// Инициализация в случае создания нового больничного
//------------------------------------------------------------------------------
procedure TFormEBln.InitNew;
begin
  Caption := 'Больничные [новая запись]';

  d_BlnDtProc := dDtProc;

  AddNewBlnRec(n_TabN);

  CheckProcOpl;
  EntprDaysMax := GetEntprDaysMax(QryVBlnVidN.AsString);
  ApplyDayFlags;

  CommonInit;

  SetCurrentStep(1);
end;

//------------------------------------------------------------------------------
// Инициализация в случае редактирования существующего больничного
//------------------------------------------------------------------------------
procedure TFormEBln.InitEdit;
begin
  if b_CanUpd then
    Caption := 'Больничные [редактирование записи]'
  else begin
    Caption := 'Больничные [только просмотр]';
    bBtnCancel.Caption := 'Выход';
  end;

  // Читаем текущий больничный
  OpenQryVBln(n_SpecNR);

  d_BlnDtProc := qryVBlnDTPROC.AsDateTime;
  n_AlgRasch := qryVBln.FieldByName('AlgRasch').AsInteger;

  CheckProcOpl;
  EntprDaysMax := GetEntprDaysMax(QryVBlnVidN.AsString);

  with DmSickPreg do
  if qryVBlnDTPROC.AsDateTime < NewBehaviourDate then begin
    // Для совместимости со старыми больничными.
    if qryVBlnDay5First.AsString = '1' then
      SetDayFlags(DAYS_PRINC_ENT or DAYS_SUPPL_ENT, 1)
    else
      SetDayFlags(DAYS_PRINC_ENT or DAYS_SUPPL_ENT, 0);

    SetDayFlags(DAYS_PRINC_FND or DAYS_SUPPL_FND, 1);

    // Подправляем флаги для совместительских видов
    AdjustSupplFlags;
  end else
    SetDayFlags(qryVBlnDayFlags.AsInteger);

  // Применяем флаги к CheckBox'ам
  ApplyDayFlags;

  if DmMain.qryVidN_LU.Locate('VidN', qryVBln.FieldByName('VidN').AsString, []) then
    b_BlnIsSovm := DmMain.qryVidN_LU.FieldByName('Sovm').AsString = '1';

  if (qryVBlnListCont.AsString = '1') and not qryVBlnSmSrdn.IsNull then begin
    LoadSrDnByPredList;
  end else begin
    OpenQryRBln(qryVBlnSPEC_NR.AsInteger);
    LoadSrDn;
  end;

  CommonInit;
  SetCurrentStep(3);

  FillTblRBln;

  if not b_CanUpd then begin
    if DmVacatStorn.LoadOverlap(n_TabN,
      qryVBlnDtBeg.AsDateTime, qryVBlnDtEnd.AsDateTime)
    then begin
      SetDbgrOtklColumns;
      SetDbgrStornColumns;
      sBtnStornOtp.Enabled := true;
      dbgrOtkl.Enabled := false;
      dbgrStorn.Enabled := false;
    end;
  end;

  b_EditMode := true;
end; {InitEdit}

//------------------------------------------------------------------------------
// Общая инициализация
//------------------------------------------------------------------------------
procedure TFormEBln.CommonInit;
var
  Shift: integer;
begin
  LabelFamIO.Caption := c_FamIO;
  LabelMsgDtPriem.Caption := '';
  LabelLastDtPriem.Caption := '';

  LblTopAvrg.Caption := '';
  LblMidAvrg.Caption := '';
  LblBtmAvrg.Caption := '';

  LabelTabN.Visible := b_ShowTabN;
  dbeTabN.Visible  := b_ShowTabN;
  sBtnUpi.Visible := b_ShowTabN;
  bBtnNew.Visible := b_ShowTabN;

  if not b_ShowTabN then begin
    Shift := LabelFamIO.Left - LabelTabN.Left;
    LabelFamIO.Left := LabelFamIO.Left - Shift;
    LabelFamIO.Width := LabelFamIO.Width + Shift;
  end;

  // Режим расчёта: 12 мес./посл.оклад
  rBtnByLast12m.Checked := n_AlgRasch = 12;
  rBtnByLastOkl.Checked := n_AlgRasch = 1;

  // Является ли больничный продолжением
  DBChBoxContList.Checked := qryVBlnListCont.AsString = '1';

  dDt150704 := EncodeDate(2015,7,4);
  nCntDnejForRBln := 25.2;

  HideRBlnDebugColumns;
end;

//------------------------------------------------------------------------------
// Расчёт переменных
//------------------------------------------------------------------------------
procedure TFormEBln.CalcVariables;
var
  nY, nM, nD : word;
begin
  // Расчёт даты начала следующего месяца
  DecodeDate(d_BlnDtProc, nY, nM, nD);
  nM := nM + 1;
  if nM > 12 then begin
    nM := 1;
    nY := nY + 1;
  end;
  d_DtBegNextMes := EncodeDate(nY, nM, 1);

  // Признак совместительского больничного
  b_BlnIsSovm := false;
  if not dbeVidN.Field.IsNull then begin
    if DmMain.qryVidN_LU.Locate('VidN', dbeVidN.Field.AsString, []) then
      b_BlnIsSovm := DmMain.qryVidN_LU.FieldByName('Sovm').AsString = '1';
  end;
end;

//------------------------------------------------------------------------------
// Заполнение RBln при способе расчёта по окладу
//------------------------------------------------------------------------------
procedure TFormEBln.FillQryRBlnByOkl(nTabN : integer);
const
  CNT_DAYS = 30.44;
var
  dDtBegBln: TDateTime;
  nOklTrf: double;
  nSO : integer;
  cVidN : ShortString;
begin
  QryUtils.InitQuery(qryRBln);

  with qryRBln do begin
    SQL.Add(
      'select r.*, Cast(-1 As SmallInt) As MyFoxFld ' +
      'from Z_RBln r where r.Spec_NR = :SpecNR');
    ParamByName('SpecNR').AsInteger := n_SpecNR;
    Open;
    Filter := 'MyFoxFld <> -1';
    Filtered := true;
  end;

  bIsFoxFilter := true;

  nOklTrf := 0;
  nSO := 1;

  cVidN := qryVBln.FieldByName('VidN').AsString;
  dDtBegBln := qryVBln.FieldByName('DtBeg').AsDateTime;

  // Определить оклад на начало больничного. Надбавки не брать - Ольга 10-12-2007
  // В поле CntDays подставить к-во рабочих дней в месяце начала больничного

  QryUtils.InitQuery(qryTmp);
  with qryTmp do begin
    SQL.Add(
      'select * from Z_Pere ' +
      'where TabN = :TabN and Dt_beg <= :DtBegBln ' +
      'order by dt_Beg desc, NR desc');
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('DtBegBln').AsDateTime := dDtBegBln;
    Open;

    while not Eof do begin
      if FieldByName('Dt_Beg').AsDateTime <= dDtBegBln then begin
        nOklTrf := FieldByName('OklTrf').AsFloat;
        nSO := FieldByName('SO').AsInteger;
        Break;
      end;
      Next;
    end;
  end;
  QryUtils.ReleaseQuery(qryTmp);

  if nOklTrf <> 0 then begin
    qryRBln.Append;
    qryRBlnTABN.AsInteger := nTabN;
    if nSO = 1 then
      qryRBlnNmPokaz.AsString := 'Оклад'
    else if nSO = 2 then
      qryRBlnNmPokaz.AsString := 'Тариф'
    else
      qryRBlnNmPokaz.AsString := 'nSO=' + IntToStr(nSO) + '?';
    qryRBlnSumProc.AsFloat    := nOklTrf;
    qryRBlnSmVZachet.AsFloat  := nOklTrf;
    qryRBlnSmZarabotka.AsFloat  := nOklTrf;
    qryRBlnCntDays.AsFloat    := CNT_DAYS;
    qryRBln.Post;
  end;
end; {FillQryRBlnByOkl}

//------------------------------------------------------------------------------
// Записать в отклонения, разбрасывая по-месячно
//------------------------------------------------------------------------------
procedure TFormEBln.FillTblRBln;
var
  BlnPeriod, MnthPeriod, BlnInMnth: TPeriod;
  BegOfMnth: TDateTime;

  UseEntprDays: Boolean;
  EntprVidN: ShortString;
  FundDayCnt, EntprDayCnt, EntprDaysRemain, I, SickDay: Integer;
  FundHours, EntprDayHours, SickHrs: Double;

  SumOsn, SumSovm: double;

  Mnth, DummyWord: word;
begin
  qryVBlnSmSrDn.AsFloat := GetSrednDnevn;

  CreateRBlnTable;

  with DmSickPreg do
  UseEntprDays :=
    DayFlagIsSet(DAYS_PRINC_ENT) or DayFlagIsSet(DAYS_SUPPL_ENT);

  // Остаток доступных дней за счёт предприятия по результатам предыдущих
  // больничных в цепочке продолжений
  EntprDaysRemain := Max(0, EntprDaysMax -
    PrevBlnEntprDays(qryVBlnPREDSPEC_NR.AsInteger, qryVBlnSPEC_NR.AsInteger));

  with DateUtils do begin
    // Общий период больничного
    BlnPeriod := InitPeriod(
      qryVBlnDtBeg.AsDateTime, qryVBlnDtEnd.AsDateTime);

    // Первый месяц, на который "ложится" больничный.
    MnthPeriod := InitPeriod(
      BeginOfMonth(BlnPeriod.Start), EndOfMonth(BlnPeriod.Start));

    while true do begin
      FundDayCnt := 0;
      FundHours := 0;

      EntprDayCnt := 0;
      EntprDayHours := 0;

      // Часть больничного, которая "легла" на текущий месяц.
      BlnInMnth := IntersectPeriods(MnthPeriod, BlnPeriod);

      if PeriodIsEmpty(BlnInMnth) then
        // Весь больничный обработан.
        break;

      // Собираем часы и дни.
      for I := 0 to DateUtils.DaysCount(BlnInMnth) - 1 do begin
        // DmMain.CheckDayForBln(Date, SickDay, SickHrs, 'blk');
        SickDay := 1;
        SickHrs := 8;

        if UseEntprDays and (EntprDayCnt < EntprDaysRemain) then begin
          EntprDayCnt := EntprDayCnt + SickDay;
          EntprDayHours := EntprDayHours + SickHrs;
        end else begin
          FundDayCnt := FundDayCnt + SickDay;
          FundHours := FundHours + SickHrs;
        end;
      end;

      DecodeDate(BlnInMnth.Start, DummyWord, Mnth, DummyWord);

      // Пишем дни за счёт предприятия
      if EntprDayCnt > 0 then begin
        SumOsn := 0;
        if DmSickPreg.DayFlagIsSet(DAYS_PRINC_ENT) then
          SumOsn := EntprDayCnt * TNumUtils.RoundToKopeck(
            r_SrednDnevn.nSrDnOsn * qryVBlnProcOpl.AsFloat / 100);

        SumSovm := 0;
        if DmSickPreg.DayFlagIsSet(DAYS_SUPPL_ENT) then
          SumSovm := EntprDayCnt * TNumUtils.RoundToKopeck(
            r_SrednDnevn.nSrDnSovm * qryVBlnProcOpl.AsFloat / 100);

        if TBlnUtils.IsAccident(
          QryVBlnDIGITAL.AsString, QryVBlnPRBLN.AsInteger)
        then
          // 17-дневка по произв.заболев.
          EntprVidN := '2606'
        else
          // 5-дневка по общим заболев.
          EntprVidN := '2603';

        tblRBlnAdd(dDtProc, BlnInMnth.Start, BlnInMnth.Start + EntprDayCnt - 1,
          EntprVidN, EntprDayCnt, EntprDayHours, SumOsn, SumSovm,
          MesRus(Mnth));

        EntprDaysRemain := EntprDaysRemain - EntprDayCnt;
      end;

      // Пишем дни за счёт пенсионного фонда
      if FundDayCnt > 0 then begin
        SumOsn := 0;
        if DmSickPreg.DayFlagIsSet(DAYS_PRINC_FND) then
          SumOsn := FundDayCnt * TNumUtils.RoundToKopeck(
            r_SrednDnevn.nSrDnOsn * qryVBlnProcOpl.AsFloat / 100);

        SumSovm := 0;
        if DmSickPreg.DayFlagIsSet(DAYS_SUPPL_FND) then
          SumSovm := FundDayCnt * TNumUtils.RoundToKopeck(
            r_SrednDnevn.nSrDnSovm * qryVBlnProcOpl.AsFloat / 100);

        tblRBlnAdd(dDtProc, BlnInMnth.Start + EntprDayCnt, BlnInMnth.Finish,
          qryVBlnVidN.AsString, FundDayCnt, FundHours, SumOsn, SumSovm,
          MesRus(Mnth)
        );
      end;

      qryVBln.FieldByName('CntChas').AsFloat := EntprDayHours + FundHours;

      // Берём следующий месяц.
      BegOfMnth := NextMonth(MnthPeriod.Start);
      MnthPeriod := InitPeriod(BegOfMnth, EndOfMonth(BegOfMnth));
    end;
  end;
end;

//------------------------------------------------------------------------------
// Количество бюджетных дней в предыдущих больничных, продолжением которых
// является нынешний.
//------------------------------------------------------------------------------
function TFormEBln.PrevBlnEntprDays(PrevSpecNR, SpecNR: integer): integer;
begin
  Result := 0;

  if PrevSpecNR = 0 then
    exit;

  OpenVBlnTree;

  with QryVBlnTree do begin
    if (Locate('Spec_NR', PrevSpecNR, [])) then
      Result := PassVBlnTree(PrevSpecNR, SpecNR)
    else
      TError.WriteError(AppSetts.AppName, 'TFormEBln', 'PrevBlnFiveDays',
        'z_VBln. Не найден PredSpec_NR ' + IntToStr(PrevSpecNR));
  end;

  QryUtils.ReleaseQuery(QryVBlnTree);
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TFormEBln.GetVBlnRoot(PrevSpecNR: integer): integer;
begin
  Result := PrevSpecNR;

  if PrevSpecNR = 0 then
    exit;

  OpenVBlnTree;

  with QryVBlnTree do
    while true do begin
      if Locate('Spec_NR', PrevSpecNR, []) then begin
        PrevSpecNR := FieldByName('PredSpec_NR').AsInteger;

         if (PrevSpecNR = 0 {root}) or (PrevSpecNR = Result {cycle}) then
          break;

        Result := PrevSpecNR;
      end else begin
        TError.WriteError(AppSetts.AppName, 'TFormEBln', 'GetVBlnRoot',
          'z_VBln. Не найден PredSpec_NR ' + IntToStr(PrevSpecNR));
        break;
      end;

      Next;
    end;

  QryUtils.ReleaseQuery(QryVBlnTree);
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
procedure TFormEBln.OpenVBlnTree;
begin
  QryUtils.InitQuery(QryVBlnTree);

  with QryVBlnTree do begin
    SQL.Text :=
      'select * ' +
      'from z_VBln ' +
      'where TabN = :TabN ' +
        'and DtBeg < :DtBeg';
      
    ParamByName('TabN').AsInteger := qryVBlnTABN.AsInteger;
    ParamByName('DtBeg').AsDateTime := qryVBlnDTBEG.AsDateTime;
    Open;
  end;
end;

//------------------------------------------------------------------------------
// Рекурсивный обход дерева связей больничных листов.
// ExcludeSpecNR: дочерние элементы передают себя родительским, чтобы они
// исключили их при обходе дочерних. Родительские передают себя дочерним.
// Если родителю не передать дочерний исказится информация о часах.
// Если родитель не передаст себя, получим переполнение стека.
//------------------------------------------------------------------------------
function TFormEBln.PassVBlnTree(NodeSpecNR, ExcludeSpecNR: integer): integer;
var
  NR, SpecNR: integer;
begin
  with QryVBlnTree do begin
    NR := FieldByName('NR').AsInteger;

    // Свои дни
    Result := Trunc(
      FieldByName('DtEnd').AsDateTime - FieldByName('DtBeg').AsDateTime + 1);

    SpecNR := FieldByName('PredSpec_NR').AsInteger;

    if (SpecNR <> ExcludeSpecNR) and (SpecNR <> 0) then
      if Locate('Spec_NR', SpecNR, []) then
        // "Родительские" дни.
        Result := Result +
          PassVBlnTree(SpecNR, NodeSpecNR)
      else
        TError.WriteError(AppSetts.AppName, 'TFormEBln', 'PassVBlnTree',
          'z_VBln. Не найден PredSpec_NR ' + IntToStr(SpecNR));

    // Дочерние дни.
    Locate('PredSpec_NR', NodeSpecNR, []);

    while (FieldByName('PredSpec_NR').AsInteger = NodeSpecNR) and not Eof do
    begin
      SpecNR := FieldByName('Spec_NR').AsInteger;

      if SpecNR <> ExcludeSpecNR then
        Result := Result + PassVBlnTree(SpecNR, NodeSpecNR);

      Next;
    end;

    Locate('NR', NR, []);
  end;
end;

//------------------------------------------------------------------------------
// Получение средне-дневного по пред.мес.
//------------------------------------------------------------------------------
procedure TFormEBln.LoadSrDnByPredList;
begin
  OpenQryRBln(qryVBlnPredSpec_NR.AsInteger);
  LoadSrDn;
end; {LoadSrDnByPredList}

//------------------------------------------------------------------------------
// Получение средне-дневных
//------------------------------------------------------------------------------
procedure TFormEBln.LoadSrDn;
begin
  if qryVBlnAlgRasch.AsInteger = 1 then
    LoadSrDnByOkl
  else
    r_SrednDnevn := TBlnUtils.CalcAverages(QryRBln);
end;

//------------------------------------------------------------------------------
// Расчёт по окладу. Совместительские суммы игнорируются.
//------------------------------------------------------------------------------
procedure TFormEBln.LoadSrDnByOkl;
begin
  r_SrednDnevn := TBlnUtils.BlankSrednDnevn;

  with qryRBln do begin
    if RecordCount > 0 then begin
      r_SrednDnevn.nSumTtOsn := qryRBlnSmVZachet.AsFloat;
      r_SrednDnevn.nDaysOsn := qryRBlnCntDays.AsFloat;
    end;
  end;

  if r_SrednDnevn.nDaysOsn > 0 then
    r_SrednDnevn.nSrDnOsn :=
      RoundTo(r_SrednDnevn.nSumTtOsn / r_SrednDnevn.nDaysOsn, -2);
end; {LoadSrDnByOkl}

//------------------------------------------------------------------------------
procedure TFormEBln.CreateRBlnTable;
begin
  DelRBlnTable;
  with tblRBln do begin
    CreateTable;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.DelTmpTables;
begin
  DelRBlnTable;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.DelRBlnTable;
begin
  with tblRBln do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.OpenQryVBln(nSpecNR : integer);
begin
  b_BlnIsSovm := false;

  QryUtils.InitQuery(qryVBln);
  with qryVBln do begin
    SQL.Add('Select * from Z_VBln where (Spec_NR = :nSpecNR)');
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    Open;
    Edit;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.OpenQryRBln(nSpecNR : integer);
begin
  QryUtils.InitQuery(qryRBln);
  with qryRBln do begin
    SQL.Add(
      'select r.*, Cast(-1 As SmallInt) As MyFoxFld ' +
      'from Z_RBln r where Spec_NR = :SpecNR order by NR');
    ParamByName('SpecNR').AsInteger := nSpecNR;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.AddNewBlnRec(TabN: Integer);
var
  nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double;
    cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs : boolean;  nInv : SmallInt;
    dDtBM, dDtEM : TDateTime; nCntWDays, nCntWChas : double;
begin
  DmMain.GetPereInf(TabN, dDtProc, nKdObj, nKdKatP, nSO, nPdNlg, nKolMin,
    nKdSpz, nRang, nRazr, nOklTrf, nAvans, nProcLG, cSpAv, cDolgnost,
    cNrPrikaza, dDtPrikaza, bPens, bSovm, bPrfs, nInv);

  QryUtils.InitQuery(qryVBln);

  with qryVBln do begin
    SQL.Add('Select * from Z_VBln where Spec_NR = 0');
    Open;

    if _LastVidN <> '' then begin
      qryVBlnVidN.AsString := _LastVidN;
      if DmMain.qryVidN_LU.Locate('VidN', _LastVidN, []) then
        b_BlnIsSovm := DmMain.qryVidN_LU.FieldByName('Sovm').AsString = '1';
    end;

    qryVBlnTabN.AsInteger := TabN;

    if _DigitalIsOn then
      qryVBlnDIGITAL.AsString := 'Y'
    else
      qryVBlnDIGITAL.AsString := 'N';

    dDtBM := dDtProc;
    dDtEM := myLastDOM(dDtProc);

    qryVBlnListCont.AsString := '0';
    qryVBlnKdSps.AsInteger    := gl_nAppKdSpsUsr; // nKdSps;
    qryVBlnDtProc.AsDateTime  := dDtProc;
    qryVBlnDtBeg.AsDateTime   := dDtBM;
    qryVBlnDtEnd.AsDateTime   := dDtEM;
    qryVBlnAlgRasch.AsInteger := n_AlgRasch;
    qryVBlnDtList.AsDateTime  := dDtBM;        // dDtProc
    qryVBlnNrList.AsString    := 'xxx';

    if qryVBlnAlgRasch.AsInteger = 12 then
      DmMain.GetCntWrkDaysBln(dDtBM, dDtEM, nCntWDays, nCntWChas, 'blk');

    qryVBlnCntDays.AsInteger  := Round(nCntWDays);
    qryVBlnCntChas.AsFloat    := nCurBudget;
    qryVBlnKdObj.AsInteger    := nKdObj;
    qryVBlnKdKatP.AsInteger   := nKdKatP;
    qryVBlnKdSPZ.AsInteger    := nKdSpz;
    qryVBlnProcOpl.AsFloat    := 100;
    qryVBlnNchBudMes.AsString := '0';

    QryVBlnDayFlags.AsInteger := InitDayFlags;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.dbeShVidNKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    SelectVidN;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbeVidNKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    SelectVidN;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbeShObjKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObj.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbeShKatPKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKatP.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                        Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZ.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbePredNRKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnPredList.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbeDtBegExit(Sender: TObject);
var dDtB, dDtE, dDum : TDateTime;
    nKdObj, nKdKatP, nKdSpZ, nDum : integer;
    cDum : string;
    nFloatDum : double; cSpAv : string1; bDum : boolean; nInv : SmallInt;
    nCntWDays, nCntWChas : double;
begin
  qryVBln.FieldByName('DtList').AsString := qryVBln.FieldByName('DtBeg').AsString;

  if not MyEmptyDate(qryVBln.FieldByName('DtBeg').AsString)
      and (qryVBlnVidN.AsString = '2602')
      and (qryVBln.FieldByName('DtBeg').AsDateTime > d_DtBegNextMes) then begin
    LabelNchBudMes.Enabled   := true;
    dbChBoxNchBudMes.Visible := true;
  end else begin
    LabelNchBudMes.Enabled   := false;
    dbChBoxNchBudMes.Visible := false;
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
      DmMain.GetCntWrkDaysBln(dDtB, dDtE, nCntWDays, nCntWChas, 'blk')
    else if rBtnByLastOkl.Checked then
      DmMain.GetCntWrkDaysBln(dDtB, dDtE, nCntWDays, nCntWChas, 'blk');
    qryVBln.FieldByName('CntDays').AsInteger := Round(nCntWDays);
  end;
  if not MyEmptyDate(qryVBln.FieldByName('DtBeg').AsString) then begin
    if qryVBln.FieldByName('DtBeg').AsDateTime >= dDt150704 then begin
//      rBtnByLast12m.Checked := true;
      LabelCntDays.Caption := 'Календ.дней';
      dbeCntDays.Hint := 'Количество календарных больничных дней'; end
    else if qryVBln.FieldByName('DtBeg').AsDateTime < dDt150704 then begin
      LabelCntDays.Caption := 'Рабоч.дней';
      dbeCntDays.Hint := 'Количество рабочих больничных дней';
    end;
  end;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbeDtEndExit(Sender: TObject);
var nCntWDays, nCntWChas : double; dDtB, dDtE : TDateTime;
begin
    if MyEmptyDate((Sender as TDBEdit).Text) then
    qryVBln.FieldByName('CntDays').AsString := ''
  else begin
    dDtB := qryVBlnDtBeg.AsDateTime;
    dDtE := qryVBlnDtEnd.AsDateTime;
    if rBtnByLast12m.Checked then
      DmMain.GetCntWrkDaysBln(dDtB, dDtE, nCntWDays, nCntWChas, 'blk')
    else if rBtnByLastOkl.Checked then
      DmMain.GetCntWrkDaysBln(dDtB, dDtE, nCntWDays, nCntWChas, 'blk');
    qryVBln.FieldByName('CntDays').AsInteger := Round(nCntWDays);
  end;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.sBtnUpiClick(Sender: TObject);
var nTabN : integer; cFam, cIma, cOtch, cFamIO, cDum : string;
begin
  bTabNBySBtnUpi := true;
  dbeTabN.SetFocus;
  nTabN := qryVBln.FieldByName('TabN').AsInteger;
  if GetUpiTabN(nTabN, cFam, cIma, cOtch, cFamIO, cDum) {z_GtQUpi} then begin
    n_TabN := nTabN;
    qryVBln.FieldByName('TabN').AsInteger   := n_TabN;
    LabelFamIO.Caption := cFamIO;
    dbeShVidN.SetFocus;
  end;
  bTabNBySBtnUpi := false;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbeTabNExit(Sender: TObject);
begin
  if bTabNBySBtnUpi then Exit;
  // TabN не выбран из спр-ка сотрудников, а введен в dbeTabN
  n_TabN := qryVBln.FieldByName('TabN').AsInteger;
  LabelFamIO.Caption := DmMain.TabN2FamIO(n_TabN);  {z_Dm}
  (Sender as TDBEdit).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.sBtnVidNClick(Sender: TObject);
begin
  SelectVidN;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.sBtnPrBlnClick(Sender: TObject);
var
  eBlnType: TBlnType;
  nPrBln : SmallInt;
  cNmPrBln : ShortString;
begin
  dbePrBln.SetFocus;
  nPrBln := qryVBlnPrBln.AsInteger;

  if DBChBoxDigital.Checked then
    eBlnType := BlnTypeDigital
  else
    eBlnType := BlnTypeStandard;

  // z_PrBln
  if GetPrBln(eBlnType, nPrBln, cNmPrBln) then begin
    dbePrBln.Field.AsInteger := nPrBln;
    dbeDtBeg.SetFocus;

    InitDayFlags;
    ApplyDayFlags;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.sBtnObjClick(Sender: TObject);
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
procedure TFormEBln.sBtnKatPClick(Sender: TObject);
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
procedure TFormEBln.sBtnSPZClick(Sender: TObject);
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
function TFormEBln.CheckStep1 : boolean;
var mListErr : TStringList;
    cVidN    : ShortString;
begin
  Result     := true;
  // dbeNotes.SetFocus;
  mListErr   := TStringList.Create;
  mListErr.Clear;

  cVidN      := qryVBlnVidN.AsString;

  b_BlnIsSovm := (cVidN = '2621') or (cVidN = '2623') or (cVidN = '2624') or
                   (cVidN = '2625');
  if cVidN = '2602' then
    mListErr.Add('Декретные начисляются по пункту "- декретные" меню "Добавить"')
  else
    if b_BlnIsSovm and rBtnByLastOkl.Checked then
       mListErr.Add('Совместительские больничные по последнему окладу ' +
                    'не рассчитываются');
  if dbeTabN.Visible and (dbeTabN.Field.IsNull or
                         (dbeTabN.Field.AsInteger = 0)) then
    mListErr.Add('Не заполнено поле "Табельный номер"');
  if dbePrBln.Field.IsNull then
    mListErr.Add('Не заполнено поле "Причина нетрудоспособности."');
  if (dbeCntDays.Text = '') or (qryVBlnCntDays.AsFloat <= 0) then
    mListErr.Add('Количество дней должно быть больше нуля');
  if MyEmptyDate(dbeDtBeg.Text) then
    mListErr.Add('Нет даты начала больничного');
  if MyEmptyDate(dbeDtEnd.Text) then
    mListErr.Add('Нет даты окончания больничного');
  if (not MyEmptyDate(dbeDtBeg.Text)) and
         (not MyEmptyDate(dbeDtEnd.Text)) and
          (qryVBlnDtBeg.AsDateTime > qryVBlnDtEnd.AsDateTime) then
    mListErr.Add('Дата окончания меньше даты начала');
  { Должна позволять пустое поле. Бормотина.
  if (dbeSerListC.Text = '') then
    mListErr.Add('Нет серии б/листка');}
  if (dbeNrList.Text = '') then
    mListErr.Add('Нет номера б/листка');
  if qryVBlnProcOpl.AsFloat <= 0 then
    mListErr.Add('Процент оплаты должен быть больше нуля');
  if (qryVBlnListCont.AsString = '1') and not PredListExists then
    mListErr.Add('Нет предыдущего больничного листка');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    // dbeDtBeg.SetFocus;
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.tblRBlnAdd(dDtProc, dDtB, dDtE : TDateTime;
                               cVidN : string4;
                               nCntDays, nCntChas, nSmmOsn, nSmmSovm : double;
                               cNotes : string);
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
procedure TFormEBln.bBtnNewClick(Sender: TObject);
begin
  if bIsFormShowNuMGBln then begin
    FormShowNuMG.Close;
    Application.ProcessMessages;
  end;

  bVvodClick := true;
  SaveResults;   // Сохранить расчет в Z_VBln и в Z_Otkl

  bVvodClick  := false;
  b_Pereschet := false;

  n_TabN := 0;
  InitNew;

  b_EditMode := false;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.SaveResults;
var cLogMsg : string; nTabN : integer;
begin
  with qryVBln do begin
    nTabN := FieldByName('TabN').AsInteger;
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
    FieldByName('DayFlags').AsInteger := DmSickPreg.GetDayFlags;

    Post;
    DmMain.AddLog(Now, nTabN, 'Ввод больничных', gc_AppNmUsr, 'Z_vBln', cLogMsg);
  end;

  // Становится известной переменная n_SpecNR
  if not (qryVBlnListCont.AsString = '1') then
    SaveQry_RBln
  else if (qryVBlnListCont.AsString = '1') and b_PereschetPredLista then
    SaveQry_RBlnInPredList(qryVBln.FieldByName('PredSpec_NR').AsInteger);

  SaveToOtkl;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.bBtnPereschetClick(Sender: TObject);
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
    DmMain.AddLog(Now, nTabN, 'Ввод больничных', gc_AppNmUsr, 'Z_vBln', cLogMsg);
  end;
  // Становится известной n_SpecNR
  if not (qryVBlnListCont.AsString = '1') then
    SaveQry_RBln;
  SaveToOtkl;
  bVvodClick  := false;
  b_Pereschet := true;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.SaveQry_RBlnInPredList(nPredSpecNR : integer);
var bIsMinus : boolean;
begin
  with qryRBln do begin
    DisableControls;
    Filtered := false;
    First;
    while not Eof do begin
      bIsMinus := FieldByName('MyFoxFld').AsInteger = -1;
      if b_EditMode and bIsFoxFilter and bIsMinus then
        Delete
      else begin
        Edit;
        FieldByName('Spec_NR').AsInteger := nPredSpecNr;
        Post;
        Next;
      end;
    end;
    EnableControls;
  end;
  if qryRBln.UpdatesPending then
    qryRBln.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.SaveQry_RBln;
begin
  with qryRBln do begin
    DisableControls;
    Filtered := false;
    First;
    while not Eof do begin
      if b_EditMode and bIsFoxFilter and (FieldByName('MyFoxFld').AsInteger = -1) then
        Delete
      else begin
        Edit;
        FieldByName('Spec_NR').AsInteger := n_SpecNr;
        Post;
        Next;
      end;
    end;
    EnableControls;
  end;
  if qryRBln.UpdatesPending then
    qryRBln.ApplyUpdates;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.SaveToOtkl;
var
  i, j, nY, nM, nD, n_Y, n_M, n_D, nPrKr : word;
  nSum: double;
  cSovm: string;

  procedure WriteToOtkl;
  begin
    with tblRBln do begin
      qryTmp.ParamByName('nKdSps').AsInteger := gl_nAppKdSpsUsr; //nKdSps;
      qryTmp.ParamByName('dDTPROC').AsDateTime := dDtProc;
      qryTmp.ParamByName('nTABN').AsInteger := n_TabN;
      qryTmp.ParamByName('nKdTemu').AsInteger :=
                                    qryVBln.FieldByName('KdTemu').AsInteger;
      qryTmp.ParamByName('nKDOBJ').AsInteger :=
                                    qryVBln.FieldByName('KdObj').AsInteger;
      qryTmp.ParamByName('nKDKATP').AsInteger :=
                                   qryVBln.FieldByName('KdKatP').AsInteger;
      qryTmp.ParamByName('dDT_BEG').AsDateTime :=
                                           FieldByName('DtBeg').AsDateTime;
      qryTmp.ParamByName('dDT_END').AsDateTime :=
                                           FieldByName('DtEnd').AsDateTime;
      qryTmp.ParamByName('cVIDN').AsString := FieldByName('VidN').AsString;
      qryTmp.ParamByName('nPDN').AsInteger := 1;
      qryTmp.ParamByName('nCHAS').AsFloat := FieldByName('CntChas').AsFloat;
      qryTmp.ParamByName('nSUMMA').AsFloat := nSum;
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
  DecodeDate(dDtProc, nY, nM, nD);

  QryUtils.InitQuery(QryTmp);

  with QryTmp do begin
    SQL.Add('Insert into Z_Otkl (KdSps, DTPROC, TABN, KdTemu, KDOBJ, ' +
            ' KDKATP, DT_BEG, DT_END, VIDN, PDN, CHAS, ' +
            ' SUMMA, KDSPZ, NOTES, PRPV, KTO, PRKR, ' +
            ' ZAMESGOD, SPEC_NR, SOVM) ');
    SQL.Add(' Values (:nKdSps, :dDTPROC, :nTABN, :nKdTemu, :nKDOBJ, ' +
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
          if (i = 1) and (qryVBlnDtBeg.AsDateTime > d_DtBegNextMes) and
                        dbChBoxNchBudMes.Checked and
                          (FieldByName('DtBeg').AsDateTime > d_DtBegNextMes) then
            nPrKr := 1  // делать начисления от 01-ММ-ГГГГ до начала больничных
          else
            nPrKr := 0;

          WriteToOtkl;
        end;
      end;
      Next;
    end;
  end;

  QryUtils.ReleaseQuery(QryTmp);

  // Сторнирование отпусков
  with DmVacatStorn do
    ApplyStorn;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.qryVBlnBeforePost(DataSet: TDataSet);
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
end;
//------------------------------------------------------------------------------
procedure TFormEBln.qryVBlnAfterPost(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryVBln]);
end;
//------------------------------------------------------------------------------
procedure TFormEBln.DeleteFromOtklOldRecords(n_SpecNR : integer);
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
procedure TFormEBln.qryRBlnCalcFields(DataSet: TDataSet);
var nY, nM, nD : word; cNmVidN : string;
begin
  qryRBlnSmZpKoef.AsFloat :=
    qryRBlnSmZarabotka.AsFloat *
    {qryRBlnKoefZp.AsFloat} // не будет работать для уже созданных
    // больничных с неправильным KoefZp в z_RBln.
    // поэтому используем ProcOpl из z_VBln
    RoundTo(qryVBlnProcOpl.AsFloat / 100, -2);

  DecodeDate(qryRBlnZaMesGod.AsDateTime, nY, nM, nD);

  qryRBlnRusMesGod.AsString := Copy(MesRus(nM), 1, 3) + ' ' + IntToStr(nY);

  if not qryRBlnVidN.IsNull and (qryRBlnVidN.AsString <> '') then
    qryRBlnShVidN.AsString := DmMain.VidN2ShVidN(qryRBlnVidN.AsString, cNmVidN);
end;

//------------------------------------------------------------------------------
procedure TFormEBln.sBtnStep1Click(Sender: TObject);
begin
  SetCurrentStep(1);
  LabelMsgDtPriem.Caption := '';
  LabelLastDtPriem.Caption := '';
  LblTopAvrg.Caption := '';
  LblMidAvrg.Caption := '';
  LblBtmAvrg.Caption := '';
  sBtnStornOtp.Enabled := false;
  RefreshControls;
  qryRBln.Close;
  tblRBln.Close;
  bBtnVvod.Enabled := false;  
end;

//------------------------------------------------------------------------------
// #Step2Click
//------------------------------------------------------------------------------
procedure TFormEBln.BtnStep2Click(Sender: TObject);
begin
  if bIsFormShowNuMGBln then
    FormShowNuMG.Close;

  if n_CurrentStep = 1 then begin
    if CheckStep1 {всё ли заполнено на 1-й страничке} then begin
      if (qryVBlnListCont.AsString = '1') and PredListExists then
        LoadSrDnByPredList
      else
        Raschet;

      SetCurrentStep(2);
    end
  end else
    SetCurrentStep(2);

  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.sBtnStep3Click(Sender: TObject);
var
  dChkBeg, dChkEnd : TDateTime;
begin
  sBtnRecalcPred.Enabled := false;

  LoadSrDn;
  FillTblRBln;

  // проверить, не пересекаются ли периоды больничных с какими либо отпусками
  // Если ДА, дать возможность сторнировать отпуск, с которым пересеклись
  dChkBeg := qryVBlnDtBeg.AsDateTime;
  dChkEnd := qryVBlnDtEnd.AsDateTime;

  if DmVacatStorn.LoadOverlap(n_TabN, dChkBeg, dChkEnd) then begin
    SetDbgrOtklColumns;
    SetDbgrStornColumns;
    sBtnStornOtp.Enabled := true;
  end;

  SetCurrentStep(3);
  RefreshControls;

  bBtnVvod.Enabled := true;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.SetCurrentStep(nStep: integer);
begin
  n_CurrentStep := nStep;

  ApplyStepToControls;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.bBtnVvodClick(Sender: TObject);
begin
  if bIsFormShowNuMGBln then begin
    FormShowNuMG.Close;
    Application.ProcessMessages;
  end;
  bVvodClick := true;

  SaveResults;   // Сохранить расчет в Z_VBln и в Z_Otkl
  bBtnVvod.Enabled := false;

  bVvodClick  := false;
  b_Pereschet := false;
  ModalResult := mrOk;
end;

{
//------------------------------------------------------------------------------
procedure TFormEBln.OpenQryOtkl(nTabN, nSpec_NR: integer);
begin
  QryUtils.InitQuery(QryOtkl);

  with QryOtkl do begin
    SQL.Add(
      'select * ' +
      'from Z_Otkl ' +
      'where TabN = :nTabN ' +
        'and Spec_NR = :nSpec_NR ' +
        'and (Storn is NULL or not Storn = "Y") ' +
      ' order by ZaMesGod'
    );
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.PrepareQryStorn;
begin
  QryUtils.InitQuery(QryStorn);

  with QryStorn do begin
    SQL.Add(
      'select o.Dt_Beg SvDtBeg, ' +
        'o.Dt_End SvDtEnd, ' +
        'o.* ' +
      'from Z_Otkl o ' +
      'where o.TabN = :TabN ' +
        'and o.Spec_NR = :Spec_NR ' +
        'and o.Storn = "Y" ' +
      'order by TabN, Spec_Nr, ZaMesGod'
    );
//    ParamByName('TabN').AsInteger := nTabN;
//    ParamByName('Spec_NR').AsInteger := nSpec_NR;
    Prepare;
    Open;
  end;
end;
}

//------------------------------------------------------------------------------
{
procedure TFormEBln.OpenQryStorn(nTabN, nSpec_NR: integer);
begin
  QryUtils.InitQuery(QryStorn);

  with QryStorn do begin
    SQL.Add(
      'select o.Dt_Beg SvDtBeg, ' +
        'o.Dt_End SvDtEnd, ' +
        'o.* ' +
      'from Z_Otkl o ' +
      'where o.TabN = :TabN ' +
        'and o.Spec_NR = :Spec_NR ' +
        'and o.Storn = "Y" ' +
      'order by TabN, Spec_Nr, ZaMesGod'
    );
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('Spec_NR').AsInteger := nSpec_NR;
    Open;

    with cdsF8 do begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;

    while not Eof do begin
      cdsF8.Append;
      cdsF8.FieldByName('ZaMesGod').AsString := qryStornZaMesGod.AsString;
      if QryVacat.Locate('ZaMesGod', qryStornZaMesGod.AsDateTime, [])
      then begin
        cdsF8.FieldByName('SvDtBeg').AsString := QryVacatDt_Beg.AsString;
        cdsF8.FieldByName('SvDtEnd').AsString := QryVacatDt_End.AsString;
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
}

//------------------------------------------------------------------------------
procedure TFormEBln.sBtnStornOtpClick(Sender: TObject);
begin
  LblTopAvrg.Visible := false;
  LblMidAvrg.Visible := false;
  LblBtmAvrg.Visible := false;
  sBtnStornOtp.Enabled := false;
  BtnStep2.Enabled := false;
  sBtnPrt.Enabled := false;

  mSvTabSheet := PageControl.ActivePage;
  PageControl.ActivePage := tsStornOtp;
  
  sBtnBackToBln.Visible := true;
  if b_CanUpd then
    dbgrOtkl.SetFocus;
  dbgrRBln.Enabled := false;
  dbgrRBln.Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.sBtnBackToBlnClick(Sender: TObject);
begin
  PageControl.ActivePage := mSvTabSheet;
  dbgrRBln.Enabled := true;
  sBtnBackToBln.Visible := false;
  LblTopAvrg.Visible := true;
  LblMidAvrg.Visible := true;
  LblBtmAvrg.Visible := true;
  BtnStep2.Enabled := true;
  sBtnPrt.Enabled := true;
  sBtnStornOtp.Enabled := true;
  dbgrRBln.Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.Raschet;
begin
  if rBtnByLastOkl.Checked then
    RaschetByOkl
  else
    RaschetBy12mes;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.RaschetByOkl;
begin
  bQryRBlnFilled := false;
  FillQryRBlnByOkl(n_TabN);
  bQryRBlnFilled := true;

  LoadSrDnByOkl;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.RaschetBy12mes;
var
  Period: TPeriod;
  dBegBln, dLastPrm: TDateTime;
begin
  dBegBln := QryVBln.FieldByName('DtBeg').AsDateTime;
  dLastPrm := GetLastDtPrm(n_TabN, dBegBln);

  LabelMsgDtPriem.Caption := 'Дата приема:';
  LabelLastDtPriem.Caption := DateToStr(dLastPrm);

  Period := TCalc12Mnth.Get12MnthPeriod(n_TabN, dBegBln);

  with QryRBln do begin
    DisableControls;

    bQryRBlnFilled := false;
    TCalc12Mnth.FillQryRBlnBy12Mes(
      QryVBln, QryRBln, Period, rBtnOnlyCurSps.Checked, bIsFoxFilter);
    bQryRBlnFilled := true;

    EnableControls;
  end;

  r_SrednDnevn := TBlnUtils.CalcAverages(QryRBln);
end;

//------------------------------------------------------------------------------
function TFormEBln.GetLastDtPrm(TabN: integer; DtBegBln: TDateTime): TDateTime;
begin
  Result := 0;

  with QryTmp, QryUtils do begin
    InitQuery(QryTmp);

    SQL.Add(
      'select First 1 * ' +
      'from z_PrmUv ' +
      'where TabN = :TabN ' +
        'and Dt_Priem <= :DtBegBln ' +
      'order by Dt_Priem desc');
    ParamByName('TabN').AsInteger := TabN;
    ParamByName('DtBegBln').AsDateTime := DtBegBln;
    Open;

    if RecordCount > 0 then
      Result := FieldByName('Dt_Priem').AsDateTime;

    ReleaseQuery(QryTmp);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.dbGridDblClick(Sender: TObject);
var dMaxDtProc : TDateTime; nY, nM, nD : word; bKalendarn : boolean;
begin
  bKalendarn := rBtnByLast12m.Checked;
  DecodeDate(qryVBln.FieldByName('DtBeg').AsDateTime, nY, nM, nD);
  dMaxDtProc := EncodeDate(nY, nM, 1);
  ShowNuZaMGBln(c_FamIO, n_TabN, dMaxDtProc, dsrc_RBln, bKalendarn); {Z_ShNuMG}
end;

//------------------------------------------------------------------------------
procedure TFormEBln.dsrc_RBlnDataChange(Sender: TObject; Field: TField);
begin
  if bIsFormShowNuMGBln and (dsrc_RBln.State = dsBrowse) then
    FormShowNuMG.ShowWorkDaysInMG(qryRBln.FieldByName('ZaMesGod').AsDateTime);
end;

//------------------------------------------------------------------------------
// Перерасчёт после исправления суммы в qryRBln
//------------------------------------------------------------------------------
procedure TFormEBln.qryRBlnAfterPost(DataSet: TDataSet);
begin
  if bQryRBlnFilled and not bVvodClick then begin
    LoadSrDn;
    RefreshControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.sBtnPrtClick(Sender: TObject);
begin
  if rBtnByLast12m.Checked {по 12-ти мес.} then
    F6_PrtBln12m(n_TabN, c_FamIO, qryVBln, qryRBln, tblRBln, '12m') {z_CmnPrt}
  else    {по окладу}
    // F6_PrtBln(n_TabN, c_FamIO, qryVBln, qryRBln, tblRBln, 'okl'); {z_CmnPrt}
    TRptSickLastMnth.Run(n_TabN, c_FamIO, qryVBln, qryRBln, tblRBln);
end;
//------------------------------------------------------------------------------
procedure TFormEBln.sBtnCalendarClick(Sender: TObject);
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
procedure TFormEBln.qryVBlnDTLISTSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbgridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbeCntDaysExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.rBtnByLastOklClick(Sender: TObject);
begin
  if (qryVBln.State = dsInsert) or (qryVBln.State = dsEdit) then
    qryVBlnAlgRasch.AsInteger := 1;

  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.rBtnByLast12mClick(Sender: TObject);
var
  nCntWDays, nCntWChas : double;
begin
  DmMain.GetCntWrkDaysBln(
    qryVBlnDtBeg.AsDateTime, qryVBlnDtEnd.AsDateTime, nCntWDays, nCntWChas, 'blk');

  if (qryVBln.State = dsInsert) or (qryVBln.State = dsEdit) then begin
    qryVBlnAlgRasch.AsInteger := 12;
    qryVBlnCntDays.AsInteger  := Round(nCntWDays);
  end;

  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.DBChBoxContListClick(Sender: TObject);
begin
  // Принудительно устанавливаем значение поля, поскольку стандартное обновление
  // сработает только по потере checkbox'ом фокуса 
  with Sender As TDbCheckBox, Field do begin
    DataSet.Edit;

    if Checked then
      AsString := '1'
    else
      AsString := '0';
  end;

  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.sBtnPredListClick(Sender: TObject);
var
  nPredSpecNR: integer;
begin
  dbePredNr.SetFocus;
  nPredSpecNR := qryVBlnPredSpec_NR.AsInteger;

  if GetPredList(n_TabN, qryVBlnDtBeg.AsDateTime, nPredSpecNR) {z_BlnPrd} then begin
    nPredSpecNR := GetVBlnRoot(nPredSpecNR);
    qryVBlnPredSpec_NR.AsInteger := nPredSpecNR;

    if TBlnUtils.PeekVBlnBySpecNR(QryPeek, nPredSpecNR) then begin
      qryVBlnSTGCMN.AsFloat := QryPeek.FieldByName('STGCMN').AsFloat;
      qryVBlnSTG12.AsFloat := QryPeek.FieldByName('STG12').AsFloat;
    end;
    QryUtils.ReleaseQuery(QryPeek);

    OpenQryRBln(nPredSpecNR);
    qryRbln.Filtered := false;
    LoadSrDn;

    if dbeProcOpl.Enabled then
      dbeProcOpl.SetFocus;
  end;

  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.dbChBoxNchBudMesEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbChBoxNchBudMesExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.qryVBlnCalcFields(DataSet: TDataSet);
begin
  qryVBlnSPZ.AsString := Form_Dm.KdSbu2SchBU(qryVBlnKdSpZ.AsInteger);

  qryVBlnNmPrBln.AsString := DmMain.PrBln2NmPrBln(
    TBlnUtils.DigitalToBlnType(qryVBlnDIGITAL.AsString), qryVBlnPrBln.AsInteger);

  ShowHidePanelAct;

  qryVBlnPredSer.AsString := '';
  qryVBlnPredNR.AsString := '';
  qryVBlnPredDt.AsString := '';

  if (qryVBlnListCont.AsString = '1') and (not qryVBlnPredSpec_NR.IsNull) then begin
    QryUtils.InitQuery(qryTmp);
    with qryTmp do begin
      SQL.Add('Select * from Z_VBln where Spec_NR = :nPredSpec_NR');
      ParamByName('nPredSpec_NR').AsInteger := qryVBlnPredSpec_NR.AsInteger;
      Open;
      if RecordCount <> 0 then begin
        qryVBlnPredSer.AsString := FieldByName('SerList').AsString;
        qryVBlnPredNR.AsString  := FieldByName('NrList').AsString;
        qryVBlnPredDt.AsString  := FieldByName('DtList').AsString;
      end;
    end;
    QryUtils.ReleaseQuery(qryTmp);
  end;

  if not qryVBlnKdTemu.IsNull and (qryVBlnKdTemu.AsInteger > 0) then
    qryVBlnNmTemu.AsString := DmMain.KdTemu2NmTemu(qryVBlnKdTemu.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormEBln.tblRBlnCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  tblRBlnShVidN.AsString := DmMain.VidN2ShVidN(tblRBlnVidN.AsString, cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormEBln.sBtnRecalcPredClick(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
procedure TFormEBln.PopOtklPopup(Sender: TObject);
var
  DataSet: TDataSet;
begin
  DataSet := DbgrStorn.DataSource.DataSet;

  PopOtklStorn.Enabled := (DataSet.RecordCount > 0)
    and (DataSet.FieldByName('Storn').AsString <> 'Y');

  PopOtklUnstorn.Enabled := (DataSet.RecordCount > 0)
    and not PopOtklStorn.Enabled;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEBln.PopOtklStornClick(Sender: TObject);
begin
  TFrmVacatStorn.StornVacatPart;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEBln.PopOtklUnstornClick(Sender: TObject);
begin
  if MessageDlg(
    'Отменить сторнирование?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    DmVacatStorn.UnstornRec;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.DbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState
);
begin
  with DbgrOtkl.Canvas do
    if (UpperCase(Column.FieldName) = 'DT_BEG')
      or (UpperCase(Column.FieldName) = 'DT_END')
    then
      Font.Style := [fsBold]
    else
      Font.Style := [];

  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEBln.SetDbgrOtklColumns;
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
procedure TFormEBln.SetDbgrStornColumns;
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
procedure TFormEBln.DbgrStornDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Field: TField;
begin
  with DbgrStorn.Canvas do begin
    if not (gdFocused in State) then begin
      if ((Column.FieldName = 'SUMMA') or (Column.FieldName = 'CHAS')) and
                                              (Column.Field.Value < 0) then
        Font.Color := clRed;
      if (Column.FieldName = 'DT_BEG') or (Column.FieldName = 'DT_END') then
        Font.Style := [fsBold];
    end;

    Field := Column.Field;

    if (Field <> nil)
      // поле будет = nil для вычисляемых полей
        and (Field.DataSet.FieldByName('Storn').AsString = 'Y')
        and not (gdFocused in State) then
      Brush.Color := clMoneyGreen;
  end;

  dbgrStorn.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
procedure TFormEBln.dbgrGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.dbgrGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEBln.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где  нужно,  пользуйтесь  контекстными  меню');
end;

//------------------------------------------------------------------------------
// Предотвращает добавление записей в данные для расчёта
//------------------------------------------------------------------------------
procedure TFormEBln.qryRBlnNewRecord(DataSet: TDataSet);
begin
  if bQryRBlnFilled then
    qryRBln.Cancel;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.dbgr_RBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin  // Чхала она на этот DrawColumnCell ??? !!!
  with dbgrRBln.Canvas do begin
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
  dbgr_RBln.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEBln.sBtnKdTemuClick(Sender: TObject);
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
procedure TFormEBln.dbeKdTemuExit(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
    nTabN : integer; dOnDate : TDateTime;
    nKdSpZ: SmallInt; cSchBU: ShortString;
begin
  if not dbeKdTemu.Field.IsNull then begin  // поставить в dbeKdSpZ и в
    nKdTemu := dbeKdTemu.Field.AsInteger;   // dbeSpZ "темные" значения сёчёта
    if CheckKdTemu(nKdTemu, nKdPSch, cNmTemu, cPSch) {z_ShwTem} then begin
      dbeNmTemu.Field.AsString := cNmTemu;
      dbeKdSpZ.Field.AsInteger  := nKdPSch;
      dbeSpZ.Field.AsString     := cPSch;
//      edSpZ.Text                := cPSch;
      (Sender as TDBEdit).Color := clWindow;
      dbeSpZ.SetFocus; end
    else begin
      DbeKdTemu.SetFocus;
      ShowMessage('Нет темы "' + IntToStr(nKdTemu) + '" в справочнике тем');
    end; end
  else begin  // в dbeKdSpZ и в dbeSpZ "перемещенские" значения счета
    dOnDate := dDtProc;                                    //по умолчанию
    nTabN := dbeTabN.Field.AsInteger;
    if Form_Dm.GetSpZByPere(nTabN, dOnDate, nKdSpZ, cSchBU) then begin
      dbeNmTemu.Field.AsString := '';
      dbeKdSpZ.Field.AsInteger := nKdSpZ;
      dbeSpZ.Field.AsString    := cSchBU;
      (Sender as TDBEdit).Color := clWindow;
      dbeSpZ.SetFocus;
    end;
  end;
 (Sender as TDBEdit).Color := clWindow;
end;

//------------------------------------------------------------------------------
// #PredListExists Является ли данный больничный продолжением
//------------------------------------------------------------------------------
function TFormEBln.PredListExists: boolean;
begin
  Result := qryVBlnPREDSPEC_NR.AsInteger <> 0;
end;

//------------------------------------------------------------------------------
// #RefreshControls Перерисовка элементов формы
//------------------------------------------------------------------------------
procedure TFormEBln.RefreshControls;
var
  FontColor: TColor;
begin
  // Левая панель
  PanelLeft.Enabled    := b_CanUpd and (n_CurrentStep = 1);
  rGrpAlgoritm.Enabled := n_CurrentStep = 1;

  ApplyDayFlags;

  if dbChBoxContList.Checked then
    FontColor := clWindowText
  else
    FontColor := clBtnFace;

  dbePredSer.Font.Color := FontColor;
  dbePredNR.Font.Color  := FontColor;
  dbePredDt.Font.Color  := FontColor;

  sBtnPredList.Enabled := dbChBoxContList.Checked;

  // Правая сторона

  if rBtnByLastOkl.Checked then
    PageControl.ActivePage := tsByOkl
  else
    PageControl.ActivePage := tsBy12Mes;

  // Расчёты средне-дневных
  DisplayAverages;

  PanelRBottom.Enabled := n_CurrentStep = 3;

  // Управление шагом обработки
  sBtnStep1.Enabled := n_CurrentStep > 1;
  BtnStep2.Enabled := n_CurrentStep <> 2;
  sBtnStep3.Enabled := n_CurrentStep = 2;

  // Сохранение больничного
  bBtnVvod.Visible := b_CanUpd;

  // Создание нового больничного прямо из диалога редактирования текущего
  bBtnNew.Enabled := n_CurrentStep = 3;

  // Какой-то ПЕРЕРАСЧЁТ
  bBtnPereschet.Enabled := n_CurrentStep = 3;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.ApplyStepToControls;
begin
  dbgr_RBln.Enabled :=
    b_CanUpd and (n_CurrentStep = 2) and not DBChBoxContList.Checked;
  dbgrRSrOkl.Enabled :=
    b_CanUpd and (n_CurrentStep = 2) and not DBChBoxContList.Checked;

  if n_CurrentStep = 1 then begin
    dbgr_RBln.Color  := clBtnFace;
    dbgrRBln.Color   := clBtnFace;
    dbgrRSrOkl.Color := clBtnFace;

    SetControlsColor(clWindow);
    sBtnPrt.Visible := false;

  end else if n_CurrentStep = 2 then begin
    SetControlsColor(clBtnFace);

    if not DBChBoxContList.Checked then begin
      dbgr_RBln.Color  := clWindow;
      dbgrRSrOkl.Color := clWindow;
    end;

    dbgrRBln.Color := clBtnFace;

    if rBtnByLast12m.Checked then
      PageControl.ActivePage := tsBy12Mes
    else
      PageControl.ActivePage := tsByOkl;
    sBtnPrt.Visible  := false;

  end else {nCurrentStep = 3} begin
    dbgr_RBln.Color  := clBtnFace;
    dbgrRBln.Color   := clWindow;

    SetControlsColor(clBtnFace);

    sBtnPrt.Visible  := true;
  end;
end;

//------------------------------------------------------------------------------
// Установка цвета элементов редактирования
//------------------------------------------------------------------------------
procedure TFormEBln.SetControlsColor(color: TColor);
begin
  dbeDtBeg.Color   := color;
  dbeDtEnd.Color   := color;
  dbeKdTemu.Color  := color;
  dbeSerListC.Color:= color;
  dbeNrList.Color  := color;
  dbeDtPrik.Color  := color;
  dbeStagCmn.Color := color;
  dbeStagL12.Color := color;
  dbePrBln.Color   := color;
  dbeProcOpl.Color := color;
  dbeNotes.Color   := color;
end;

//------------------------------------------------------------------------------
// Получение общего средне-дневного
//------------------------------------------------------------------------------
function TFormEBln.GetSrednDnevn: double;
begin
  Result := r_SrednDnevn.nSrDnOsn + r_SrednDnevn.nSrDnSovm;
end;

//------------------------------------------------------------------------------
// Скрывает отладочные столбцы
//------------------------------------------------------------------------------
procedure TFormEBln.HideRBlnDebugColumns;
var
  i: SmallInt;
  cFldNm: ShortString;
begin
  for i := 0 to dbgr_RBln.Columns.Count - 1 do begin
    cFldNm := UpperCase(dbgr_RBln.Columns[i].FieldName);

    if (cFldNm = 'MYFOXFLD') or (cFldNm = 'SPEC_NR') then
      dbgr_RBln.Columns[i].Visible := bFlagDbg;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.ShowHidePanelAct;
begin
  PanelAct.Visible := (qryVBlnPRBLN.AsInteger = 11) or (qryVBlnPRBLN.AsInteger = 12);
  if PanelAct.Visible then
    PanelOther.Top := PanelOtherOriginalTop
  else
    PanelOther.Top := PanelOtherOriginalTop - PanelAct.Height;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.dsrc_RBlnUpdateData(Sender: TObject);
begin
  r_SrednDnevn := TBlnUtils.CalcAverages(QryRBln);
  DisplayAverages;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.DisplayAverages;
begin
  TBlnUtils.DisplayAverages(DBChBoxContList.Checked, rBtnByLast12m.Checked,
    LblTopAvrg, LblMidAvrg, LblBtmAvrg, r_SrednDnevn);
end;

//------------------------------------------------------------------------------
procedure TFormEBln.ChBoxDaysClick(Sender: TObject);
var
  Mask, Value: Word;
begin
  Mask := 0;

  if Sender = PrincDays.ChBoxEntDays then
    Mask := DAYS_PRINC_ENT
  else if Sender = PrincDays.ChBoxFndDays then
    Mask := DAYS_PRINC_FND
  else if Sender = SupplDays.ChBoxEntDays then
    Mask := DAYS_SUPPL_ENT
  else if Sender = SupplDays.ChBoxFndDays then
    Mask := DAYS_SUPPL_FND;

  Value := 0;

  if (Sender as TCheckBox).Checked then
    Value := Mask;

  DmSickPreg.SetDayFlags(Mask, Value);
end;

//------------------------------------------------------------------------------
function TFormEBln.InitDayFlags: Integer;
begin
  with DmSickPreg do begin
    // Устанавливаем все флаги
    SetDayFlags(
      DAYS_PRINC_ENT or DAYS_SUPPL_ENT or DAYS_PRINC_FND or DAYS_SUPPL_FND);

    // Определяем флаги в зависимости от вида начисления

    if FundDaysOnly then
      // Выключаем флаги дней предприятия
      SetDayFlags(DAYS_PRINC_ENT or DAYS_SUPPL_ENT, 0);

    if EntprDaysOnly then
      // Выключаем флаги дней пенсионного фонда
      SetDayFlags(DAYS_PRINC_FND or DAYS_SUPPL_FND, 0);

    // Уточняем флаги в зависимости от наличия совместительства
    AdjustSupplFlags;

    Result := GetDayFlags;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TFormEBln.EntprDaysOnly: Boolean;
begin
  // SB 23.3.2026 Эти виды напрямую вводиться не должны. Они автоматически
  // расчитываются при обработке видов 2604 и 2605. Но если вдруг бухг. ввведёт,
  // дневные флаги ставим в только "за счёт предприятия"
  Result := (QryVBlnVidN.AsString = '2603') or (QryVBlnVidN.AsString = '2606');
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TFormEBln.FundDaysOnly: Boolean;
var
  PayType: ShortString;
  SickReason: Integer;
  Digital: Boolean;
begin
  PayType := QryVBlnVidN.AsString;
  SickReason := QryVBlnPrBln.AsInteger;
  Digital := QryVBlnDigital.AsBoolean;

  Result :=
    // Больничные по уходу (2601) оплачиваются только из фонда
    (PayType = '2601')
    // Если причиной любого больничного вида поставили уход,
    // обработка такая же, как и у вида 2601
    or Digital and (SickReason >= 3) and (SickReason <= 5)
    or not Digital and (SickReason = 10);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEBln.AdjustSupplFlags;
begin
  if not SupplAvailable then
    // Выключаем совместительские флаги
    DmSickPreg.SetDayFlags(DAYS_SUPPL_ENT or DAYS_SUPPL_FND, 0)
  else
    // Не трогаем
    ;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TFormEBln.SupplAvailable: Boolean;
var
  EmplId,
  Algorithm: Integer;
  SickBeg: TDateTime;
  SupplPeriod: TPeriod;
begin
  EmplId := QryVBlnTabN.AsInteger;
  Algorithm := QryVBlnAlgRasch.AsInteger;
  SickBeg := QryVBlnDtBeg.AsDateTime;

  if Algorithm = 12 then begin
    SupplPeriod := TCalc12Mnth.Get12MnthPeriod(EmplId, SickBeg);

    Result := DmSickPreg.EmplHasSupplPayTypes(EmplId, SupplPeriod);
  end else
    Result := false;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEBln.ApplyDayFlags;
var
  SupplAvail: Boolean;
begin
  with DmSickPreg do begin
    PrincDays.ChBoxEntDays.Caption := IntToStr(EntprDaysMax) + ' Предпр.';
    PrincDays.ChBoxEntDays.Checked := DayFlagIsSet(DAYS_PRINC_ENT);
    PrincDays.ChBoxFndDays.Checked := DayFlagIsSet(DAYS_PRINC_FND);

    SupplDays.ChBoxEntDays.Caption := IntToStr(EntprDaysMax) + ' Предпр.';
    SupplDays.ChBoxEntDays.Checked := DayFlagIsSet(DAYS_SUPPL_ENT);
    SupplDays.ChBoxFndDays.Checked := DayFlagIsSet(DAYS_SUPPL_FND);

    SupplAvail := SupplAvailable;

    PrincDays.ChBoxEntDays.Enabled := true; // not FundDaysOnly;
    SupplDays.ChBoxEntDays.Enabled := SupplAvail; // PrincDays.ChBox5Days.Enabled and SupplAvail;

    PrincDays.ChBoxFndDays.Enabled := true; // not First5DaysOnly;
    SupplDays.ChBoxFndDays.Enabled := SupplAvail; // PrincDays.ChBoxFund.Enabled and SupplAvail;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEBln.HandleSupplChange;
var
  SupplAvail: Boolean;
begin
  AdjustSupplFlags;

  SupplAvail := SupplAvailable;

  with SupplDays do begin
    ChBoxEntDays.Enabled := true; // not FundDaysOnly and SupplAvail;
    ChBoxFndDays.Enabled := SupplAvail; // not First5DaysOnly and SupplAvail;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.qryVBlnDTBEGChange(Sender: TField);
begin
  HandleSupplChange;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEBln.qryVBlnDTENDChange(Sender: TField);
begin
  HandleSupplChange;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// PrBln - продолжение больничного листа
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEBln.QryVBlnPrBlnChange(Sender: TField);
begin
  InitDayFlags;
  ApplyDayFlags;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEBln.qryVBlnLISTCONTChange(Sender: TField);
begin
  if Sender.AsString = '0' then
    qryVBlnPREDSPEC_NR.AsInteger := 0;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.SelectVidN;
var
  VidN, p_KEKV : string4; p_ShVidN : string15; p_NmVidN : string;
  p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
  p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
  p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
  p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
  p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
  p_KdSpZ : integer; bWasUpdated: Boolean;
begin
  dbeShVidN.SetFocus;

  with dbeVidN.DataSource.DataSet as TQuery do begin
    if b_EditMode then
      VidN := FieldByName('VidN').AsString
    else
      VidN := _LastVidN;

    // z_TVids
    if GetVidN(VidN, p_KEKV, p_ShVidN, p_NmVidN,
      p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
      p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
      p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
      p_SAlim, p_SSocStrah, p_SBzr, p_CNdb, p_Sp_PF, p_Sp_FSTVP,
      p_Sp_FSNV, p_Sp_FZ, p_KdSpZ, bWasUpdated, LbxFilter
    )
    then begin
      _LastVidN := VidN;

      b_BlnIsSovm := (p_Sovm = '1');
      if bWasUpdated then begin
        DmMain.qryVidN_LU.Close;
        DmMain.qryVidN_LU.Open;
      end;

      if b_BlnIsSovm and rBtnByLastOkl.Checked then begin
        ShowMessage('Совместительские больничные по последнему ' +
                                             'окладу не рассчитываются');
        dbeShVidN.SetFocus;
        Exit;
      end else begin
        if not (State in [dsInsert, dsEdit]) then
          Edit;

        FieldByName('VidN').AsString := VidN;

        CheckProcOpl;
        EntprDaysMax := GetEntprDaysMax(VidN);

        InitDayFlags;
        ApplyDayFlags;

        dbePrBln.SetFocus;
        RefreshControls;
      end;
    end;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEBln.CheckProcOpl;
var
  Accident: Boolean;
begin
  with DbeVidN.DataSource.DataSet do begin
    Accident := FieldByName('VidN').AsString = '2605';

    if Accident then
      FieldByName('ProcOpl').AsInteger := 100;

    DbeProcOpl.Enabled := not Accident;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TFormEBln.GetEntprDaysMax(VidN: ShortString): Integer;
begin
  if VidN = '2605' then
    Result := ACCIDENT_DAYS_MAX
  else
    Result := SICK_DAYS_MAX;
end;

end.
