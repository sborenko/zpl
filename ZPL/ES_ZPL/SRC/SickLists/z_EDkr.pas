unit z_EDkr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, IniFiles, ComCtrls, ExtCtrls, Buttons,
  Math, Mask, DBCtrls, Grids, DBGrids, Menus, DBClient, SickPregCmn;

type
  String3 = string[3];
  String4 = string[4];
  TFormEDkr = class(TForm)
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
    qryTmp: TQuery;
    tblRBln: TTable;
    dsrcRBln: TDataSource;
    tblRBlnDtProc: TDateField;
    tblRBlnDtBeg: TDateField;
    tblRBlnDtEnd: TDateField;
    tblRBlnCntDays: TSmallintField;
    tblRBlnCntChas: TFloatField;
    tblRBlnSmm: TFloatField;
    tblRBlnNotes: TStringField;
    qryVBlnSMSRDN: TFloatField;
    qryVBlnSPEC_NR: TIntegerField;
    tblRBlnSpec_NR: TIntegerField;
    qryVBlnALGRASCH: TSmallintField;
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelProcOpl: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    sBtnVidN: TSpeedButton;
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
    sBtnStep2: TSpeedButton;
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
    qryVBlnNRLIST: TStringField;
    qryVBlnDTLIST: TDateTimeField;
    qryVBlnSMBLN: TFloatField;
    bBtnPereschet: TBitBtn;
    sBtnCalendar: TSpeedButton;
    qryVBlnKDSPZ: TSmallintField;
    qryVBlnSPZ: TStringField;
    dbeVidN: TDBEdit;
    qryVBlnVIDN: TStringField;
    tblRBlnVIDN: TStringField;
    rGrpAlgoritm: TGroupBox;
    rBtnByLastOkl: TRadioButton;
    qryVBlnKDSPS: TSmallintField;
    qryRBlnKDSPS: TSmallintField;
    PageControl1: TPageControl;
    tsBy_N_mes: TTabSheet;
    tsByOkl: TTabSheet;
    dbgr_RBln: TDBGrid;
    dbgrRSrOkl: TDBGrid;
    LabelRSrOkl: TLabel;
    LbxFilter: TListBox;
    dbChBoxNchBudMes: TDBCheckBox;
    LabelNchBudMes: TLabel;
    qryVBlnNCHBUDMES: TStringField;
    qryRBlnTABN: TIntegerField;
    qryVBlnDAY5FIRST: TStringField;
    DBChBoxListCont: TDBCheckBox;
    qryVBlnLISTCONT: TStringField;
    qryVBlnPREDSPEC_NR: TIntegerField;
    dbeStgCmn: TDBEdit;
    dbeStg12: TDBEdit;
    LabelCmnStg: TLabel;
    LabelStg12: TLabel;
    qryVBlnPredNr: TStringField;
    qryVBlnPredDt: TDateField;
    sBtnPredList: TSpeedButton;
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
    dbgrOtkl: TDBGrid;
    dbgrStorn: TDBGrid;
    sBtnBackToBln: TSpeedButton;
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
    LbxStornRec: TListBox;
    qryVBlnLNKSTOTP: TIntegerField;
    TblDM: TTable;
    tblDbg: TTable;
    qryTmp2: TQuery;
    LabelLastDtPriem: TLabel;
    LabelMsgDtPriem: TLabel;
    Label6: TLabel;
    dbePrBln: TDBEdit;
    sBtnPrBln: TSpeedButton;
    qryVBlnPRBLN: TSmallintField;
    qryVBlnNmPrBln: TStringField;
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
    qryVBlnSHEMA: TSmallintField;
    qryViNu: TQuery;
    qryViNuVIDN: TStringField;
    qryViNuSHVIDN: TStringField;
    qryViNuTABN: TIntegerField;
    qryViNuKDSPS: TSmallintField;
    qryViNuPSCH: TStringField;
    qryViNuLVL: TSmallintField;
    qryViNuSCHBU: TStringField;
    qryViNuDTPROC: TDateTimeField;
    qryViNuZAMESGOD: TDateTimeField;
    qryViNuCHAS: TFloatField;
    qryViNuSUMMA: TFloatField;
    qryViNuVID_KDSPZ: TSmallintField;
    qryViNuVID_SPZ: TStringField;
    qryViNuVID_KDSCHDT: TSmallintField;
    qryViNuVID_SCHDT: TStringField;
    qryViNuVID_KDSCHKT: TSmallintField;
    qryViNuVID_SCHKT: TStringField;
    qryViNuVID_KEKV: TStringField;
    qryViNuNR: TIntegerField;
    qryViNuDT_BEG: TDateTimeField;
    qryViNuDT_END: TDateTimeField;
    qryViNuKDOBJ: TSmallintField;
    qryViNuKDKATP: TSmallintField;
    qryViNuKDSPZ: TSmallintField;
    qryViNuPDN: TSmallintField;
    qryViNuOZN_PILG: TStringField;
    qryViNuNOTES: TStringField;
    qryViNuPRR: TSmallintField;
    qryViNuPRPV: TSmallintField;
    qryViNuKTO: TSmallintField;
    qryViNuPRKR: TSmallintField;
    qryViNuMYNOTES: TStringField;
    qryViNuSPECPS: TIntegerField;
    qryViNuSPEC_NR: TIntegerField;
    qryViNuDTVDPV: TDateTimeField;
    qryViNuNRVDPV: TIntegerField;
    qryViNuKDBNK: TSmallintField;
    qryViNuSTORN: TStringField;
    qryViNuZP13: TStringField;
    qryViNuOTP: TStringField;
    qryViNuBLN: TStringField;
    qryViNuOTPUSKN: TStringField;
    qryViNuBOLNIC: TStringField;
    qryViNuSPRM: TStringField;
    qryViNuSSRK: TStringField;
    qryViNuCPRM: TStringField;
    qryViNuDETI: TStringField;
    qryViNuDETIM: TStringField;
    qryViNuDETIK: TStringField;
    qryViNuDETIG: TStringField;
    qryViNuIND: TStringField;
    qryViNuDHD: TStringField;
    qryViNuOKLFND: TStringField;
    qryViNuCBUDG: TStringField;
    qryViNuSNDB: TStringField;
    qryViNuSPDN: TStringField;
    qryViNuSWSB: TStringField;
    qryViNuSPRF: TStringField;
    qryViNuSPENS: TStringField;
    qryViNuSALIM: TStringField;
    qryViNuCNDB: TStringField;
    qryViNuSSOCSTRAH: TStringField;
    qryViNuSBZR: TStringField;
    qryViNuSP_PF: TStringField;
    qryViNuSP_FSTVP: TStringField;
    qryViNuSP_FSNV: TStringField;
    qryViNuSP_FZ: TStringField;
    qryViNuSOVM: TStringField;
    qryViNuSPOV: TStringField;
    qryViNuNdbDtBeg: TDateTimeField;
    qryViNuNdbDtEnd: TDateTimeField;
    LblBtmAvrg: TLabel;
    qryViNuDKR: TStringField;
    qryVBlnKDTEMU: TSmallintField;
    Label7: TLabel;
    dbeKdTemu: TDBEdit;
    dbeNmTemu: TDBEdit;
    sBtnKdTemu: TSpeedButton;
    dbeKdSpZ: TDBEdit;
    qryVBlnNmTemu: TStringField;
    qryVBlnSERLIST: TStringField;
    dbeSerList: TDBEdit;
    qryVBlnOLDKDVIDN: TSmallintField;
    qryVBlnSTGCMN: TFloatField;
    qryVBlnSTG12: TFloatField;
    qryVBlnDTZ: TDateTimeField;
    qryVBlnNRZ: TIntegerField;
    dbePredNR: TDBEdit;
    dbePredDt: TDBEdit;
    tblRBlnSmmSovm: TFloatField;
    DBChBoxDigital: TDBCheckBox;
    qryVBlnDIGITAL: TStringField;
    QryPeek: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure sBtnVidNClick(Sender: TObject);
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
    procedure rBtnByLast6mClick(Sender: TObject);
    procedure dbChBoxNchBudMesEnter(Sender: TObject);
    procedure dbChBoxNchBudMesExit(Sender: TObject);
    procedure dbeTabNExit(Sender: TObject);
    procedure sBtnPredListClick(Sender: TObject);
    procedure qryVBlnCalcFields(DataSet: TDataSet);
    procedure DBChBoxListContClick(Sender: TObject);
    procedure tblRBlnCalcFields(DataSet: TDataSet);
    procedure bBtnNewClick(Sender: TObject);
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
    procedure sBtnPrBlnClick(Sender: TObject);
    procedure qryVBlnPRBLNValidate(Sender: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rBtnByLast12mClick(Sender: TObject);
    procedure qryRBlnNewRecord(DataSet: TDataSet);
    procedure qryVBlnVIDNValidate(Sender: TField);
    procedure qryViNuCalcFields(DataSet: TDataSet);
    procedure dbgr_RBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnKdTemuClick(Sender: TObject);
    procedure dbeKdTemuExit(Sender: TObject);
    procedure DBChBoxDigitalClick(Sender: TObject);
    procedure dsrc_RBlnUpdateData(Sender: TObject);
    procedure popOtklPopup(Sender: TObject);
  private
    Averages: TSrednDnevn;

    d_BlnDtProc : TDateTime;
    dDtBegNextMes : TDateTime;  // Дата начала следующего за d_BlnDtProc месяца
    bEditMode : boolean;
    b_Pereschet, b_CanUpd : boolean;
    b_ShowTabN : boolean;   // Видеть или нет поле dbeTabN, его Label и sBtnUpi
    bBlnIsSovm : boolean;   // Больн. совместителям (виды "2621" - "2625")
    n_TabN : integer;
    {n_LastVidN,} n_LastKdSPZ : integer;
    c_LastVidN : string4;
    c_FamIO : string;
    n_SpecNR : integer;
    bClickStep1, bClickStep2, bClickStep3 : boolean;
    bStep12, bStep32 : boolean;        // чтобы знать, откуда жмем на sBtnStep2
    nPredSrednee: double;
    // n_SmSrDn, n_SmSrDnSovm: double;
    bIsPredList : boolean;
    nCntDnejForRBln : double;       // К-во дней в месяце для расчета по окладу
    bVvodClick : boolean;           // нажата кнопка "Ввод" (чтобы не делать
                                    // расчет среднедневного заработка)
    bQry_RBlnReady : boolean;       // чтобы не делать расчет среднедневного
                                    // заработка, пока считываются 6 месяцев
    bIsFoxFilter : boolean;
    bTabNBySBtnUpi : boolean;
    b5DayOn : boolean;        // Выделять ли из больничных по видам 2604 и 2605
    bIsCopyRBln : boolean;
    bPereschetPredLista : boolean;
    mSvTabSheet : TTabSheet; // запомнить акт. TabSheet перед -> на tsStornOtp
    bAddStornAuto : boolean;
    n_AlgRasch : SmallInt;
    dDt150704 : TDateTime;

    SavedDigitalIsOn: boolean;

    procedure Set5Day_ListCont;
    procedure qryVBlnAddRec(nTabN : integer);
    procedure OpenQryVBln(nSpecNR : integer);
    procedure OpenQryRBln(nSpecNR : integer);
    function  CheckStep1 : boolean;

    procedure RaschetByOkl;
    procedure RaschetBy12mes;
    procedure RaschetByPredList;  // рассчитать по сумме среднего из пред.листка

    procedure RaschetSrDnByOkl;

    procedure RaspredBlnPoMes;

    procedure DisplayAverages;

    procedure FillQryRBlnByOkl(nTabN : integer);

    procedure AddToTblRBln(dDtProc, dDtB, dDtE: TDateTime;
      cVidN: string4; nCntDays, nCntChas, nSmmOsn, nSmmSovm: double;
      cNotes: string);

    procedure AddTblRBlnToOtkl;
    procedure DeleteFromOtklOldRecords(n_SpecNR : integer);
    procedure SetSteps;
    procedure SaveResults;
    procedure SaveQry_RBln;
    procedure SaveQry_RBlnInPredList(nPredSpecNR : integer);
    procedure DelTmpTables;
    procedure SetPageControlTabs;
    procedure SetDbgr_RBlnColumns;
    function MyChecNakladka(dChkBeg, dChkEnd : TDateTime;
                                              var nSpecNR : integer) : boolean;
    procedure OpenQryOtkl(nTabN, nSpec_NR: integer);
    procedure OpenQryStorn(nTabN, nSpec_NR: integer);
    procedure SetDbgrOtklColumns;
    procedure SetDbgrStornColumns;
    function RabotalInMes(nTabN : integer; dDtBegM : TDateTime) : boolean;
    function GetDtLastPrm(nTabN : integer; dDtBegBln : TDateTime) : TDateTime;

  public
    class function Run(var nTabN : integer; cFamIO : ShortString;
                            nSpecNR : integer; bShowTabN, bCanUpd : boolean;
                                           var bPereschet : boolean) : boolean;
  end;

const SECTION = 'Z_EDkr';

var
  FormEDkr: TFormEDkr;
  bIsFormShowNuMGDkr : boolean;

  g_dDtProc: TDateTime;

implementation

uses A_Const, A_DM, A_Lib, Z_DM, Z_Main, z_GtQUpi, z_TVids, Z_TObj, z_TUpi,
     Z_GtPers, A_SBU, A_ShwErr, Z_ShNuMG, Z_CmnPrt, Z_Calend, z_PrBln,
     z_BlnPrd, z_EOtpP, z_ShwTem, CalcBy12Mnth, DateLib, RptSickLastMnth,
     DModVacatStorn, FormVacatStorn;

{$R *.dfm}

//------------------------------------------------------------------------------
// nTabN сделан var'ом, чтобы можно было разыскать введенный TabN из z_ShBln
//------------------------------------------------------------------------------
class function TFormEDkr.Run(
  var nTabN: integer;
  cFamIO: ShortString;
  nSpecNR: integer;
  bShowTabN, bCanUpd: boolean;
  var bPereschet: boolean) : boolean;
var
  nY, nM, nD: word;
  nOtpSpecNR: integer;
//  bIsNakladka: boolean;
begin
  Result := false;
  FormEDkr := TFormEDkr.Create(Application);

  g_dDtProc := dDtProc;

  with FormEDkr do begin
    bIsFoxFilter := false;
    bTabNBySBtnUpi := false;
    nCntDnejForRBln := 25.2;
    b_Pereschet := false;
    b_CanUpd := bCanUpd;
    bPereschetPredLista := false;
    bIsFormShowNuMGDkr := false;
    n_TabN := nTabN;
    c_FamIO := cFamIO;
    b_ShowTabN := bShowTabN;
    n_SpecNR := nSpecNR;
    bQry_RBlnReady := false;
    bVvodClick := false;
    bClickStep1 := false;
    bClickStep2 := false;
    bClickStep3 := false;
    bStep12 := false;
    bStep32 := false;
    LabelFamIO.Caption := cFamIO;
    LabelTabN.Visible := bShowTabN;
    dbeTabN.Visible  := bShowTabN;
    sBtnUpi.Visible := bShowTabN;
    bBtnNew.Visible := bShowTabN;
    bIsCopyRBln := false;
    dDt150704 := EncodeDate(2015,7,4);

    if nSpecNR = 0 then begin {новый ввод}
      Caption := 'Декретные [новая запись]';
      d_BlnDtProc := g_dDtProc;
      qryVBlnAddRec(nTabN);
      bClickStep1 := true;
      bClickStep2 := false;
      bClickStep3 := false;
      sBtnStep1.Enabled := false;
      sBtnStep2.Enabled := true;
      sBtnStep3.Enabled := false;
      SetSteps;
      dbgr_RBln.ReadOnly := not b_CanUpd;
      dbgrRSrOkl.ReadOnly := not b_CanUpd;
      bEditMode := false;
    end else begin
      OpenQryVBln(nSpecNR);

      d_BlnDtProc := qryVBlnDTPROC.AsDateTime;
      Set5Day_ListCont;

      if qryVBlnListCont.AsString = '1' then begin
        // Редактирование продолжения листа.
        // На экран можно вызвать записи из Z_RBln для первичного
        // листка, но без возможности редактирования (если не
        // нажмет кнопку "Шаг1" и не выключит DBChBoxListCont)
        OpenQryRBln(qryVBlnPredSpec_NR.AsInteger);
        RaschetByPredList;
      end else begin
        // Редактирование начального листа
        OpenQryRBln(nSpecNR);

        if qryVBlnAlgRasch.AsInteger = 1 {по окладу} then
          RaschetSrDnByOkl
        else begin
          Averages := TBlnUtils.CalcAverages(QryRBln);
          DisplayAverages;
        end;
      end;

      RaspredBlnPoMes;

      dbgr_RBln.ReadOnly := not b_CanUpd;
      dbgrRSrOkl.ReadOnly := not b_CanUpd;

      if bCanUpd then begin
        Caption := 'Декретные [редактирование записи]';
        bClickStep1 := false;
        bClickStep2 := false;
        bClickStep3 := true;
        sBtnStep1.Enabled := true;
        sBtnStep2.Enabled := true;
        sBtnStep3.Enabled := false; end
      else begin
        Caption := 'Декретные [только просмотр]';
        bClickStep1 := false;
        bClickStep2 := false;
        bClickStep3 := true;
        sBtnStep1.Enabled := false;
        sBtnStep2.Enabled := false;
        sBtnStep3.Enabled := false;
        PanelLeft.Enabled := false;
        dbgr_RBln.ReadOnly := true;
        bBtnVvod.Visible := false;
        bBtnCancel.Caption := 'Выход';

        if DmVacatStorn.LoadOverlap(n_TabN,
          qryVBlnDtBeg.AsDateTime, qryVBlnDtEnd.AsDateTime
        )
        then begin
          // найти отпуск и вызвать его на tsStornOtp
          OpenQryOtkl(nTabN, nOtpSpecNR);
          OpenQryStorn(nTabN, nOtpSpecNR);
          SetDbgrOtklColumns;
          SetDbgrStornColumns;
          sBtnStornOtp.Enabled := true;
          dbgrOtkl.Enabled := false;
          dbgrStorn.Enabled := false;
        end;
      end;

      SetSteps;
      bEditMode := true;
    end; {if}

    DecodeDate(d_BlnDtProc, nY, nM, nD);
    nM := nM + 1;
    if nM > 12 then begin
      nM := 1;
      nY := nY + 1;
    end;

    dDtBegNextMes := EncodeDate(nY, nM, 1);
    bBlnIsSovm := false;
    if not dbeVidN.Field.IsNull then begin
      if DmMain.qryVidN_LU.Locate('VidN', dbeVidN.Field.AsString, []) then
        bBlnIsSovm := DmMain.qryVidN_LU.FieldByName('Sovm').AsString = '1';
    end;

    SetDbgr_RBlnColumns;

    if ShowModal = mrOk then begin
      bPereschet := b_Pereschet;
      nTabN := n_TabN;
      Result := true;
    end;

    DelTmpTables;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.RaschetByPredList;
begin
  // можно показать (а можно и не показывать) расчет для пред. листка
  with tblRBln do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
    CreateTable;
    Open;
  end;

  Averages := TBlnUtils.CalcAverages(QryRBln);
  DisplayAverages;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.Set5Day_ListCont;
begin
  if dbChBoxListCont.Checked then begin
    dbePredNR.Visible := true;
    dbePredDt.Visible := true;
    sBtnRecalcPred.Visible := true;
    sBtnPredList.Visible := true;
  end else begin
    dbePredNR.Visible := false;
    dbePredDt.Visible := false;
    sBtnRecalcPred.Visible := false;
    sBtnPredList.Visible := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.DBChBoxListContClick(Sender: TObject);
begin
  Set5Day_ListCont;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.DelTmpTables;
begin
  if bFlagDbg then
    Exit;
  with tblRBln do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.OpenQryVBln(nSpecNR : integer);
begin
  bBlnIsSovm := false;
  InitQuery(qryVBln);
  with qryVBln do begin
    SQL.Add('Select * from Z_VBln where (Spec_NR = :nSpecNR)');
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    Open;
    if DmMain.qryVidN_LU.Locate('VidN', FieldByName('VidN').AsString, []) then
        bBlnIsSovm := DmMain.qryVidN_LU.FieldByName('Sovm').AsString = '1';
    if FieldByName('AlgRasch').AsInteger = 12 then begin
      rBtnByLast12m.Checked := true;
      rBtnByLastOkl.Checked := false; end
    else if FieldByName('AlgRasch').AsInteger = 6 then begin
      rBtnByLast12m.Checked := false;
      rBtnByLastOkl.Checked := false; end
    else begin
      rBtnByLast12m.Checked := false;
      rBtnByLastOkl.Checked := true;
    end;
    SetPageControlTabs;
    Edit;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.OpenQryRBln(nSpecNR : integer);
begin
  InitQuery(qryRBln);
  with qryRBln do begin
    SQL.Add(
      'select r.*, Cast(-1 As SmallInt) As MyFoxFld ' +
      'from Z_RBln r ' +
      'where r.Spec_NR = :SpecNR ' +
      'order by NR');
    ParamByName('SpecNR').AsInteger := nSpecNR;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.qryVBlnAddRec(nTabN : integer);
var
  nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr : integer;
  nOklTrf, nAvans, nProcLG : double;
  cSpAv : string1;
  cDolgnost, cNrPrikaza : string;
  dDtPrikaza : TDateTime;
  bPens, bSovm, bPrfs : boolean;  nInv : SmallInt;
  dDtBM, dDtEM : TDateTime; nCntWDays, nCntWChas : double;
begin
  DmMain.GetPereInf(nTabN, g_dDtProc, nKdObj, nKdKatP,
    nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr, nOklTrf, nAvans, nProcLG,
    cSpAv, cDolgnost, cNrPrikaza, dDtPrikaza, bPens, bSovm, bPrfs, nInv);

  InitQuery(qryVBln);
  with qryVBln do begin
    SQL.Add('Select * from Z_VBln where (Spec_NR = 0)');
    Open;
    Append;

    dDtBM := g_dDtProc;
    dDtEM := myLastDOM(g_dDtProc);
    bBlnIsSovm := false;

    if c_LastVidN  <> '' then begin
      qryVBlnVidN.AsString := c_LastVidN;
      if DmMain.qryVidN_LU.Locate('VidN', c_LastVidN, []) then
        bBlnIsSovm := DmMain.qryVidN_LU.FieldByName('Sovm').AsString = '1';
    end;

    if ((qryVBlnVidN.AsString = '2604') or (qryVBlnVidN.AsString = '2605')
        or (qryVBlnVidN.AsString = '2624') or (qryVBlnVidN.AsString = '2625'))
        and b5DayOn then
      qryVBlnDay5First.AsString := '1'
    else
      qryVBlnDay5First.AsString := '0';

    qryVBlnTabN.AsInteger    := nTabN;

    if SavedDigitalIsOn then
      qryVBlnDIGITAL.AsString := 'Y'
    else
      qryVBlnDIGITAL.AsString := 'N';

    with TBlnUtils do begin
      qryVBlnPrBln.AsInteger := GetBlnReason(DigitalToBlnType(qryVBlnDIGITAL.AsString), PREGNANCY);
    end;
    qryVBlnListCont.AsString := '0';
    qryVBlnKdSps.AsInteger   := gl_nAppKdSpsUsr; // nKdSps;
    qryVBlnDtProc.AsDateTime := g_dDtProc;
    qryVBlnDtBeg.AsDateTime  := dDtBM;
    qryVBlnDtEnd.AsDateTime  := dDtEM;
    qryVBlnDtList.AsDateTime := dDtBM;        // dDtProc
    qryVBlnNrList.AsString   := 'xxx';

    if rBtnByLast12m.Checked then
      DmMain.GetCntWrkDaysBln(dDtBM, dDtEM, nCntWDays, nCntWChas, 'dkr');

    qryVBlnCntDays.AsInteger  := Round(nCntWDays);
    qryVBlnCntChas.AsFloat    := nCurBudget;
    qryVBlnTabN.AsInteger     := nTabN;
    qryVBlnKdObj.AsInteger    := nKdObj;
    qryVBlnKdKatP.AsInteger   := nKdKatP;
    qryVBlnKdSPZ.AsInteger    := nKdSpz;
    qryVBlnProcOpl.AsFloat    := 100;
    qryVBlnNchBudMes.AsString := '0';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.FormCreate(Sender: TObject);
begin
  DmVacatStorn := TDmVacatStorn.Create(nil);

  bIsPredList := false;
  LabelMsgDtPriem.Caption := '';
  LabelLastDtPriem.Caption := '';
  LblTopAvrg.Caption := '';
  LblMidAvrg.Caption := '';
  LblBtmAvrg.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 420);
    Width  := ReadInteger(SECTION, 'wW', 555);
    c_LastVidN  := '2602';
    n_LastKdSPZ := ReadInteger(SECTION, 'nLastKdSPZ', 1209);
    n_AlgRasch := ReadInteger(SECTION, 'nAlgRsh', 12);
    b5DayOn := false;

    SavedDigitalIsOn := ReadBool(SECTION, 'Digital', false);

    Free;
  end;
  tsBy_N_mes.TabVisible := false;
  tsByOkl.TabVisible := false;
  tsStornOtp.TabVisible := false;
  rBtnByLast12m.Checked := n_AlgRasch = 12;
  rBtnByLastOkl.Checked := n_AlgRasch = 1;
  SetPageControlTabs;
  if FileExists(cDirVids + 'RsBln09.vid') then
    dbgr_RBln.Columns.LoadFromFile(cDirVids + 'RsBln09.vid');
  if FileExists(cDirVids + 'RsBln02.vid') then
    dbgrRBln.Columns.LoadFromFile(cDirVids + 'RsBln02.vid');
  if FileExists(cDirVids + 'RsBlnOkl.vid') then
    dbgrRSrOkl.Columns.LoadFromFile(cDirVids + 'RsBlnOkl.vid');
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgr_RBln.Columns.SaveToFile(cDirVids + 'RsBln09.vid');
  dbgrRBln.Columns.SaveToFile(cDirVids + 'RsBln02.vid');
  dbgrRSrOkl.Columns.SaveToFile(cDirVids + 'RsBlnOkl.vid');
  if bIsFormMyCalendar then
    FormMyCalendar.Close;
  if bIsFormShowNuMGDkr then
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
    WriteString(SECTION, 'cLastVidN',
               dbeVidN.DataSource.DataSet.FieldByName('VidN').AsString);
    WriteInteger(SECTION, 'nLastKdSPZ',
               dbeVidN.DataSource.DataSet.FieldByName('KdSPZ').AsInteger);

    WriteBool(SECTION, 'Digital', qryVBlnDIGITAL.AsString = 'Y');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbeShVidNKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVidN.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbeVidNKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVidN.Click;
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
procedure TFormEDkr.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.dbEditExit(Sender: TObject);
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
procedure TFormEDkr.sBtnUpiClick(Sender: TObject);
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
procedure TFormEDkr.dbeTabNExit(Sender: TObject);
begin
  if bTabNBySBtnUpi then
    Exit;
  // TabN не выбран из спр-ка сотрудников, а введен в dbeTabN
  n_TabN := qryVBln.FieldByName('TabN').AsInteger;
  LabelFamIO.Caption := DmMain.TabN2FamIO(n_TabN);  {z_Dm}
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnVidNClick(Sender: TObject);
var cVidN, p_KEKV : string4; p_ShVidN : string15; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                     p_KdSpZ : integer; bWasUpdated : boolean;
begin
  dbeShVidN.SetFocus;
  with dbeVidN.DataSource.DataSet as TQuery do begin
    if bEditMode then
      cVidN := FieldByName('VidN').AsString
    else
      cVidN := c_LastVidN;
    if GetVidN(cVidN, p_KEKV, p_ShVidN, p_NmVidN,
               p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
               p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
               p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
               p_SAlim, p_SSocStrah, p_SBzr, p_CNdb, p_Sp_PF, p_Sp_FSTVP,
               p_Sp_FSNV, p_Sp_FZ, p_KdSpZ, bWasUpdated, LbxFilter) {z_TVids}
                                                                    then begin
      bBlnIsSovm := (p_Sovm = '1');
      if bWasUpdated then begin
        DmMain.qryVidN_LU.Close;
        DmMain.qryVidN_LU.Open;
      end;
      if bBlnIsSovm and rBtnByLastOkl.Checked then begin
        ShowMessage('Совместительские больничные по последнему ' +
                                             'окладу не рассчитываются');
        dbeShVidN.SetFocus;
        Exit; end
      else begin
        if not (State in [dsInsert, dsEdit]) then
          Edit;
        FieldByName('VidN').AsString := cVidN;
        if ((qryVBlnVidN.AsString = '2604') or
               (qryVBlnVidN.AsString = '2605') or
                  (qryVBlnVidN.AsString = '2624') or
                     (qryVBlnVidN.AsString = '2625')) and b5DayOn then
          qryVBlnDay5First.AsString := '1'
        else
          qryVBlnDay5First.AsString := '0';
        dbePrBln.SetFocus;
        Set5Day_ListCont;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnPrBlnClick(Sender: TObject);
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
function TFormEDkr.CheckStep1 : boolean;
var mListErr : TStringList;
begin
  Result := true;
  dbeNotes.SetFocus;
  mListErr := TStringList.Create;
  mListErr.Clear;

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
  if (dbeNrList.Text = '') then
    mListErr.Add('Нет номера б/листка');
//  if MyEmptyDate(dbeDtPrik.Text) then
//    mListErr.Add('Нет даты б/листка');
  if qryVBlnProcOpl.AsFloat <= 0 then
    mListErr.Add('Процент оплаты должен быть больше нуля');
  if (qryVBlnListCont.AsString = '1') and not bIsPredList then
    mListErr.Add('Нет предыдущего больничного листка');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    dbeDtBeg.SetFocus;
    Result := false;
  end;
  mListErr.Destroy;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.AddToTblRBln(
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
end; {AddToTblRBln}

//------------------------------------------------------------------------------
procedure TFormEDkr.bBtnVvodClick(Sender: TObject);
begin
  if bIsFormShowNuMGDkr then begin
    FormShowNuMG.Close;
    Application.ProcessMessages;
  end;
  bVvodClick := true;
  SaveResults;   // Сохранить расчет в Z_VBln и в Z_Otkl
  bVvodClick  := false;
  b_Pereschet := false;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.bBtnNewClick(Sender: TObject);
begin
  if bIsFormShowNuMGDkr then begin
    FormShowNuMG.Close;
    Application.ProcessMessages;
  end;
  bVvodClick := true;
  SaveResults;   // Сохранить расчет в Z_VBln и в Z_Otkl
  // TytContinue !!!!!
  bVvodClick  := false;
  b_Pereschet := false;
//  ModalResult := mrOk;
  qryVBlnAddRec(0);
  bClickStep1 := true;
  bClickStep2 := false;
  bClickStep3 := false;
  sBtnStep1.Enabled := false;
  sBtnStep2.Enabled := true;
  sBtnStep3.Enabled := false;
  SetSteps;
  bEditMode := false;
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
  else if bIsListCont and bPereschetPredLista then
    SaveQry_RBlnInPredList(qryVBln.FieldByName('PredSpec_NR').AsInteger);
    
  AddTblRBlnToOtkl;

  // Сторнирование отпусков
  with DmVacatStorn do begin
    if ModalResult = mrOk then
      ApplyStorn;
    Free;
  end;
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
procedure TFormEDkr.SaveQry_RBln;
begin
  with qryRBln do begin
    DisableControls;
    Filtered := false;
    First;
    while not Eof do begin
      if bEditMode and bIsFoxFilter and
                        (FieldByName('MyFoxFld').AsInteger = -1) then
        Delete
      else begin
        Edit;
        FieldByName('Spec_NR').AsInteger := n_SpecNr;
        Post;
        Next;
      end;
    end;
  end;
  if qryRBln.UpdatesPending then
    qryRBln.ApplyUpdates;
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
      qryTmp.ParamByName('dDtProc').AsDateTime := g_dDtProc;
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
  DecodeDate(g_dDtProc, nY, nM, nD);
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
//  if qryStorn.Active and qryStorn.UpdatesPending then
//    qryStorn.ApplyUpdates;
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
    RoundTo(qryRBlnSmZarabotka.AsFloat * qryRBlnKoefZp.AsFloat / 100, -2);

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
  LabelMsgDtPriem.Caption := '';
  LabelLastDtPriem.Caption := '';
  LblTopAvrg.Caption := '';
  LblMidAvrg.Caption := '';
  LblBtmAvrg.Caption := '';
  sBtnStornOtp.Enabled := false;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnStep2Click(Sender: TObject);
begin
  if bIsFormShowNuMGDkr then
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

  // bIsNakladka := MyChecNakladka(dChkBeg, dChkEnd, nSpecNR);
  // if bIsNakladka then begin
  if DmVacatStorn.LoadOverlap(n_TabN,
    qryVBlnDtBeg.AsDateTime, qryVBlnDtEnd.AsDateTime)
  then begin
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
  LblTopAvrg.Visible := false;
  LblMidAvrg.Visible := false;
  LblBtmAvrg.Visible := false;
  sBtnStornOtp.Enabled := false;
  sBtnStep2.Enabled := false;
  sBtnPrt.Enabled := false;
  mSvTabSheet := PageControl1.ActivePage;
  PageControl1.ActivePage := tsStornOtp;
  sBtnBackToBln.Visible := true;
  if b_CanUpd then
    dbgrOtkl.SetFocus;
  dbgrRBln.Enabled := false;
  dbgrRBln.Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnBackToBlnClick(Sender: TObject);
begin
  PageControl1.ActivePage := mSvTabSheet;
  dbgrRBln.Enabled := true;
  sBtnBackToBln.Visible := false;
  LblTopAvrg.Visible := true;
  LblMidAvrg.Visible := true;
  LblBtmAvrg.Visible := true;
  sBtnStep2.Enabled := true;
  sBtnPrt.Enabled := true;
  sBtnStornOtp.Enabled := true;
  dbgrRBln.Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.SetSteps;
begin
  if bClickStep1 then begin
    PanelLeft.Enabled    := true;
    dbgr_RBln.Enabled    := false;
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
    dbgr_RBln.Color  := clBtnFace;
    dbgrRBln.Color   := clBtnFace;

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
    dbgr_RBln.Enabled    := not DBChBoxListCont.Checked; //  true;
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
      dbgr_RBln.Color  := clWindow;
    dbgrRBln.Color   := clBtnFace;
    if rBtnByLast12m.Checked then
      PageControl1.ActivePage := tsBy_N_mes
    else
      PageControl1.ActivePage := tsByOkl;
    sBtnPrt.Visible  := false; end
  else if bClickStep3 then begin
    PanelLeft.Enabled    := false;
    dbgr_RBln.Enabled    := false;
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
    dbgr_RBln.Color  := clBtnFace;
    dbgrRBln.Color   := clWindow;
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
  i: integer;
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

  dDtBegPerioda := EncodeDate(nY, nM, 1);
  LabelMsgDtPriem.Caption := 'Дата приема:';
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

  TCalc12Mnth.FillQryRBlnBy12Mes(QryVBln, QryRBln,
    DateUtils.InitPeriod(dDtBegPerioda, dDtEndPerioda),
    rBtnOnlyCurSps.Checked, bIsFoxFilter);

  Averages := TBlnUtils.CalcAverages(QryRBln);
  DisplayAverages;

  bQry_RBlnReady := true;
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
      qryRBlnSmZarabotka.AsFloat  := nOklTrf;
      qryRBlnCntDays.AsFloat    := 30.44;
      qryRBln.Post;
    end;
  end; {with}
  ReleaseQuery(qryTmp);
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

  qryVBlnSmSrDn.AsFloat := Averages.nSumTtOsn + Averages.nSumTtSovm;
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
        nSmmOsn := RoundTo(Averages.nSrDnOsn *
          qryVBlnProcOpl.AsFloat / 100, -2) * nCntDays;

        nSmmSovm := RoundTo(Averages.nSrDnSovm *
          qryVBlnProcOpl.AsFloat / 100, -2) * nCntDays;

        AddToTblRBln(g_dDtProc, dDtBeg, dDtEnd - 1, qryVBlnVidN.AsString,
          nCntDays, nCntChas, nSmmOsn, nSmmSovm, MesRus(nMnthBeg));

        qryVBlnCntChas.AsFloat := qryVBlnCntChas.AsFloat + nCntChas;
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

  qryVBlnSmSrDn.AsFloat := Averages.nSrDnOsn + Averages.nSrDnSovm; // 20.03.2023
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
procedure TFormEDkr.dsrc_RBlnDataChange(Sender: TObject; Field: TField);
begin
  if bIsFormShowNuMGDkr and (dsrc_RBln.State = dsBrowse) then
    FormShowNuMG.ShowWorkDaysInMG(qryRBln.FieldByName('ZaMesGod').AsDateTime);
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.qryRBlnAfterPost(DataSet: TDataSet);
begin
  if bQry_RBlnReady and not bVvodClick then begin
    if rBtnByLast12m.Checked then
      Averages := TBlnUtils.CalcAverages(QryRBln)
    else
      RaschetSrDnByOkl;
  end;
end;

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
      nSmSrMes := nSmSrMes + qryRBlnSmZarabotka.AsFloat;
      nCntDays := qryRBlnCntDays.AsFloat;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;

  Averages := TBlnUtils.BlankSrednDnevn;
  with Averages do begin // 20.03.2023
    nSumTtOsn := nSmSrMes;
    nDaysOsn  := nCntDays;
  end;
  Averages.nSrDnOsn := RoundTo(nSmSrMes / nCntDays, -2);
  DisplayAverages;
end; {RaschetSrDnByOkl}

//------------------------------------------------------------------------------
procedure TFormEDkr.sBtnPrtClick(Sender: TObject);
begin
  if rBtnByLast12m.Checked {по 12-ти мес.} then
    F6_PrtBln12m(n_TabN, c_FamIO, qryVBln, qryRBln, tblRBln, '12m') {z_CmnPrt}
  else {по окладу}
    // F6_PrtBln(n_TabN, c_FamIO, qryVBln, qryRBln, tblRBln, 'okl'); {z_CmnPrt}
    TRptSickLastMnth.Run(n_TabN, c_FamIO, qryVBln, qryRBln, tblRBln);
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
procedure TFormEDkr.rBtnByLast12mClick(Sender: TObject);
begin
  SetPageControlTabs;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.rBtnByLast6mClick(Sender: TObject);
begin
  SetPageControlTabs;
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
    rSrednDnevn := TBlnUtils.CalcAverages(qryRBln);
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
procedure TFormEDkr.SetDbgr_RBlnColumns;
var i : SmallInt; cFldNm : ShortString;
begin
  for i := 0 to dbgr_RBln.Columns.Count-1 do begin
    cFldNm := UpperCase(dbgr_RBln.Columns[i].FieldName);
    if (cFldNm = 'MYFOXFLD') or (cFldNm = 'SPEC_NR') then
      dbgr_RBln.Columns[i].Visible := bFlagDbg;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.popOtklPopup(Sender: TObject);
var
  DataSet: TDataSet;
begin
  DataSet := DbgrStorn.DataSource.DataSet;

  PopOtklStornPart.Enabled := (DataSet.RecordCount > 0)
    and (DataSet.FieldByName('Storn').AsString <> 'Y');

  PopOtklDelStorn.Enabled := (DataSet.RecordCount > 0)
    and not PopOtklStornPart.Enabled;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEDkr.popOtklStornPartClick(Sender: TObject);
var dRMes, dZaMG, dSvDtBeg, dSvDtEnd : TDateTime;
    nCurOklTrf, nSmSrDn, nSmOtp : double;
    cRK, cVidN : ShortString; nCntDays : SmallInt;
begin
  TFrmVacatStorn.StornVacatPart;
  exit;
(*
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
*)
end;
//------------------------------------------------------------------------------
procedure TFormEDkr.popOtklDelStornClick(Sender: TObject);
var dZaMG : TDateTime; i : SmallInt;
begin
  if MessageDlg(
    'Отменить сторнирование?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    DmVacatStorn.UnstornRec;
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
{
    if not (gdFocused in State) then begin
      i := LbxStornRec.Items.IndexOf(qryOtklZaMesGod.AsString);
      if i >= 0 then
        Font.Color := clBlue;
}
      if (UpperCase(Column.FieldName) = 'DT_BEG')
        or (UpperCase(Column.FieldName) = 'DT_END')
      then
        Font.Style := [fsBold]
      else
        Font.Style := [];
//    end;
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
var
  Field: TField;
begin
  with dbgrStorn.Canvas do begin
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
procedure TFormEDkr.dbgr_RBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
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
    dOnDate := g_dDtProc;                                    //по умолчанию
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
procedure TFormEDkr.DBChBoxDigitalClick(Sender: TObject);
var
  BlnType: TBlnType;
begin
  with TBlnUtils do
    if qryVBln.State in [dsInsert, dsEdit] then begin
      if DBChBoxDigital.Checked then
        BlnType := BlnTypeDigital
      else
        BlnType := BlnTypeStandard;

      qryVBlnPrBln.AsInteger := GetBlnReason(BlnType, PREGNANCY);
      qryVBlnNmPrBln.AsString := DmMain.PrBln2NmPrBln(BlnType, qryVBlnPrBln.AsInteger);
    end;
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.DisplayAverages;
begin
  TBlnUtils.DisplayAverages(DBChBoxListCont.Checked, rBtnByLast12m.Checked,
    LblTopAvrg, LblMidAvrg, LblBtmAvrg, Averages);
end;

//------------------------------------------------------------------------------
procedure TFormEDkr.dsrc_RBlnUpdateData(Sender: TObject);
begin
  Averages := TBlnUtils.CalcAverages(QryRBln);
  DisplayAverages;
end;

end.
