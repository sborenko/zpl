unit z_Rs5;

// Этапы записи результатов расчёта:
// - TblNuAdd ;
// - SvTblNuToTblSvRes ;
// - SaveSchetResults ;
// - AddRecInZ_Nu ;

INTERFACE

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, DBClient, DB, DBTables, Buttons, ExtCtrls, Grids,
  Math, DBGrids, ComCtrls, StdCtrls, IniFiles, Provider, Menus,
  Mask, DBCtrls, DateLib;

const
  MIN_GRP_NUM = 0;
  MAX_GRP_NUM = 10;

  SPS_NICH = 6;

type
  string15 = string[15];
  string10 = string[10];
  string3  = string[3];
  String4  = string[4];              // tblMdDayOkl

  TGrpSovm = record
    nPrcWrkTime: double;
    nSum: double;
    // nShare: double;
  end;

  TSpanArr = array of TSpan;

  TSpanKey = record
    // Ключ пока что - только код объекта, дальше возможно будут усложнения
    KdSps,
    KdObj: Integer;
    Sovm: Boolean;
  end;

  TKeySpan = record
    // вызвано тем, что человек может иметь неоплачиваемый совм.отпуск только
    // по одному подразделению, а надбавки - по нескольким. Так что, нужно
    // периоды и надбавок и неоплачиваемых видов накапливать и обрабатывать
    // по ключам.
    Key: TSpanKey;
    Spans: TSpanArr;
  end;

  TKeySpanArr = array of TKeySpan;

  string1  = string[1];
  TFormRs5 = class(TForm)
    tblMD: TTable;
    qryOtkl: TQuery;
    qryPere: TQuery;
    qryNadb: TQuery;
    qryUdrg: TQuery;
    qryTmp: TQuery;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    dsrcOtkl: TDataSource;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    dsrcMD: TDataSource;
    dbgrPere: TDBGrid;
    Splitter2: TSplitter;
    dbgrPeriodu: TDBGrid;
    Splitter3: TSplitter;
    qryPrmUv: TQuery;
    tblMDNR: TAutoIncField;
    tblMDDtMes: TDateField;
    tblMDKdObj: TIntegerField;
    tblMDKdKatP: TIntegerField;
    tblMDKdSPZ: TIntegerField;
    tblMDSO: TIntegerField;
    tblMDCmbOkl: TStringField;
    tblMDSpec_NR: TIntegerField;
    tblMDOklTrf: TFloatField;
    tblMDPrcWrkTime: TFloatField;
    tblMDCntWrkChs: TFloatField;
    tblMDPdNlg: TSmallintField;
    tblMDSovm: TSmallintField;
    tblMDPr_Pens: TSmallintField;
    tblMDPrfs: TSmallintField;
    tblMDInv: TSmallintField;
    tblMDRang: TSmallintField;
    tblMDRazr: TSmallintField;
    tblMDProcLg: TFloatField;
    tblMDKdSps: TSmallintField;
    tblMDRabotalPrp: TBooleanField;
    tblMDRabotalSps: TBooleanField;
    qryCmbOkl: TQuery;
    Panel2: TPanel;
    dbgrMD: TDBGrid;
    dsrcPrmUv: TDataSource;
    tblNu: TTable;
    sBtnPart1: TSpeedButton;
    tblPeriodu: TTable;
    dsrcPeriodu: TDataSource;
    tblPerioduNR: TAutoIncField;
    tblPerioduDtProc: TDateField;
    tblPerioduZaMesGod: TDateField;
    tblPeriodunSpecPS: TIntegerField;
    tblPerioduNuCntFakt: TFloatField;
    tblPerioduNuCntInPS: TFloatField;
    tblPerioduNuAvgSpecPS: TFloatField;
    tblPerioduOtklCntFakt: TFloatField;
    tblPerioduOtklCntInPS: TFloatField;
    tblPerioduOtklAvgSpecPS: TFloatField;
    tblPerioduRequiredPS: TBooleanField;
    tblPerioduObrab: TBooleanField;
    tblPerioduNote: TStringField;
    dsrcNU: TDataSource;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklVIDN: TStringField;
    qryOtklPDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
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
    qryOtklNR_1: TIntegerField;
    qryOtklVIDN_1: TStringField;
    qryOtklSHVIDN: TStringField;
    qryOtklNMVIDN: TStringField;
    qryOtklAINDX: TSmallintField;
    qryOtklPINDX: TSmallintField;
    qryOtklLVL: TSmallintField;
    qryOtklINDX: TSmallintField;
    qryOtklHSCH: TStringField;
    qryOtklOLDKDVIDN: TSmallintField;
    qryOtklNOSHOW: TStringField;
    qryOtklZP13: TStringField;
    qryOtklOTP: TStringField;
    qryOtklBLN: TStringField;
    qryOtklOTPUSKN: TStringField;
    qryOtklBOLNIC: TStringField;
    qryOtklSPRM: TStringField;
    qryOtklCPRM: TStringField;
    qryOtklDETI: TStringField;
    qryOtklDETIM: TStringField;
    qryOtklDETIK: TStringField;
    qryOtklDETIG: TStringField;
    qryOtklIND: TStringField;
    qryOtklDHD: TStringField;
    qryOtklOKLFND: TStringField;
    qryOtklCBUDG: TStringField;
    qryOtklSNDB: TStringField;
    qryOtklSPDN: TStringField;
    qryOtklSPRF: TStringField;
    qryOtklSPENS: TStringField;
    qryOtklSALIM: TStringField;
    qryOtklCNDB: TStringField;
    qryOtklSSOCSTRAH: TStringField;
    qryOtklSBZR: TStringField;
    qryOtklLITTLEHLP: TStringField;
    qryOtklKDSPZ_1: TSmallintField;
    qryOtklOLDSZATR: TStringField;
    qryOtklSP_PF: TStringField;
    qryOtklSP_FSTVP: TStringField;
    qryOtklSP_FSNV: TStringField;
    qryOtklSP_FZ: TStringField;
    qryOtklSOVM: TStringField;
    qryOtklSPOV: TStringField;
    qryOtklKEKV: TStringField;
    cdsAlim: TClientDataSet;
    qryTmp2: TQuery;
    tblMDIsBln: TBooleanField;
    qryZNu: TQuery;
    updZNu: TUpdateSQL;
    qryZNuNR: TIntegerField;
    qryZNuDTPROC: TDateTimeField;
    qryZNuZAMESGOD: TDateTimeField;
    qryZNuTABN: TIntegerField;
    qryZNuVIDN: TStringField;
    qryZNuCHAS: TFloatField;
    qryZNuSUMMA: TFloatField;
    qryZNuDT_BEG: TDateTimeField;
    qryZNuDT_END: TDateTimeField;
    qryZNuKDSPS: TSmallintField;
    qryZNuKDOBJ: TSmallintField;
    qryZNuKDKATP: TSmallintField;
    qryZNuKDSPZ: TSmallintField;
    qryZNuPDN: TSmallintField;
    qryZNuNOTES: TStringField;
    qryZNuPRR: TSmallintField;
    qryZNuPRPV: TSmallintField;
    qryZNuKTO: TSmallintField;
    qryZNuPRKR: TSmallintField;
    qryZNuMYNOTES: TStringField;
    qryZNuSPECPS: TIntegerField;
    qryZNuSPEC_NR: TIntegerField;
    qryZNuOLDKDOBJ: TSmallintField;
    qryZNuOLDKDVIDN: TSmallintField;
    qryZNuDTVDPV: TDateTimeField;
    qryZNuNRVDPV: TIntegerField;
    qryZNuKDBNK: TSmallintField;
    qryZNuOZN_PILG: TStringField;
    qryZNuKDTEMU: TSmallintField;
    qryZNuSovm: TStringField;
    qryZNuStorn: TStringField;
    LabelDbgMsg: TLabel;
    sBtnPart2: TSpeedButton;
    sBtnSaveRes: TSpeedButton;
    tblPerioduAllBM: TBooleanField;
    tblMDAllBM: TBooleanField;
    qryOtklOLDKDOBJ: TSmallintField;
    qryOtklOLDKDVIDN_1: TSmallintField;
    PanelNmTblNU: TPanel;
    qryTblPrp: TQuery;
    qryTPdn: TQuery;
    cdsTmp: TClientDataSet;
    cdsOKS: TClientDataSet;
    dsrcOKS: TDataSource;
    cdsPrp: TClientDataSet;
    qryOtklPBNK: TSmallintField;
    qryOtklSTORN: TStringField;
    sBtnTblNuFilter: TSpeedButton;
    tblMDIsBdgZan: TBooleanField;
    dbgrOtkl: TDBGrid;
    Splitter1: TSplitter;
    cdsCmbOkl: TClientDataSet;
    tblMDRMes: TDateField;
    sBtnOpenOldNU: TSpeedButton;
    ts4: TTabSheet;
    dbgrSvRes: TDBGrid;
    tblSvRes: TTable;
    dsrcSvRes: TDataSource;
    tblSvResNR: TAutoIncField;
    tblSvResDtProc: TDateField;
    tblSvResZaMesGod: TDateField;
    tblSvResTabN: TIntegerField;
    tblSvResVidN: TStringField;
    tblSvResChas: TFloatField;
    tblSvResSumma: TFloatField;
    tblSvResDt_Beg: TDateField;
    tblSvResDt_End: TDateField;
    tblSvResKdSps: TSmallintField;
    tblSvResKdObj: TSmallintField;
    tblSvResKdKatP: TSmallintField;
    tblSvResKdSpZ: TSmallintField;
    tblSvResPdN: TSmallintField;
    tblSvResNotes: TStringField;
    tblSvResPRR: TSmallintField;
    tblSvResPrPV: TSmallintField;
    tblSvResKto: TSmallintField;
    tblSvResPrKr: TSmallintField;
    tblSvResMyNotes: TStringField;
    tblSvResSpecPS: TIntegerField;
    tblSvResSpec_NR: TIntegerField;
    tblSvResDtVdPV: TDateField;
    tblSvResNrVdPV: TIntegerField;
    tblSvResStorn: TStringField;
    tblSvResStep: TSmallintField;
    tblSvResSAlim: TStringField;
    tblSvResShVidN: TStringField;
    sBtnObrOtkl: TSpeedButton;
    sBtnLbxPeriodu: TSpeedButton;
    qryOtklDTSTORN: TDateTimeField;
    tblSvResCBudg: TStringField;
    qryOtklKDBNK: TSmallintField;
    tblSvResKdBnk: TSmallintField;
    qryPrcEsv: TQuery;
    qryPrcEsvPrp: TQuery;
    Panel3: TPanel;
    dbgrNU: TDBGrid;
    SplitterEsv: TSplitter;
    tblSvResOzn_Pilg: TStringField;
    cdsSmPdn: TClientDataSet;
    tblMDIsInKmd: TBooleanField;
    qryInv: TQuery;
    qryNdbOtkl: TQuery;
    cdsNwSm: TClientDataSet;
    cdsNwSmNR: TAutoIncField;
    cdsNwSmDtPrc: TDateField;
    cdsNwSmZaMesGod: TDateField;
    cdsNwSmKdSps: TSmallintField;
    cdsNwSmKdObj: TSmallintField;
    cdsNwSmKdKatP: TSmallintField;
    cdsNwSmKdSpZ: TSmallintField;
    cdsNwSmOldSm: TFloatField;
    cdsNwSmNewSm: TFloatField;
    cdsNwSmSmFor: TFloatField;
    cdsNwSmPRR: TSmallintField;
    qryOtklNDBE: TStringField;
    qryOtklDKR: TStringField;
    qryOtklSSRK: TStringField;
    qryOtklSWSB: TStringField;
    qryOtklKDSCHDT: TSmallintField;
    qryOtklKDSCHKT: TSmallintField;
    qryNeoplVids: TQuery;
    sBtnF8: TSpeedButton;
    qryDbg: TQuery;
    dspDbg: TDataSetProvider;
    cdsDbg: TClientDataSet;
    dsrcDbg: TDataSource;
    cdsDbgNR: TAutoIncField;
    cdsDbgDtProc: TDateField;
    cdsDbgZaMesGod: TDateField;
    cdsDbgKdSps: TSmallintField;
    cdsDbgKdObj: TSmallintField;
    cdsDbgKdKatP: TSmallintField;
    cdsDbgKdSpZ: TSmallintField;
    cdsDbgSchBU: TStringField;
    cdsDbgsOldCmn: TFloatField;
    cdsDbgcNewCmn: TFloatField;
    cdsDbgsSgmCmn: TFloatField;
    cdsDbgsvPrgCmn: TFloatField;
    cdsDbgsOldPps: TFloatField;
    cdsDbgsNewPPs: TFloatField;
    cdsDbgsSgmPps: TFloatField;
    cdsDbgsvPrgPps: TFloatField;
    cdsDbgsOldBln: TFloatField;
    cdsDbgsNewBln: TFloatField;
    cdsDbgsSgmBln: TFloatField;
    cdsDbgsvPrgBln: TFloatField;
    cdsDbgsOldDkr: TFloatField;
    cdsDbgsNewDkr: TFloatField;
    cdsDbgsSgmDkr: TFloatField;
    cdsDbgsvPrgDkr: TFloatField;
    cdsDbgsOldDgv: TFloatField;
    cdsDbgsNewDgv: TFloatField;
    cdsDbgsSgmDgv: TFloatField;
    cdsDbgsvPrgDgv: TFloatField;
    cdsDbgsOldWSb: TFloatField;
    cdsDbgsNewWSb: TFloatField;
    cdsDbgsSgmWSb: TFloatField;
    cdsDbgPrr: TSmallintField;
    cdsOKSNR: TAutoIncField;
    cdsOKSDtPrc: TDateField;
    cdsOKSZaMesGod: TDateField;
    cdsOKSKdSps: TSmallintField;
    cdsOKSKdObj: TSmallintField;
    cdsOKSKdKatP: TSmallintField;
    cdsOKSKdSpZ: TSmallintField;
    cdsOKSPRR: TSmallintField;
    cdsOKSsForCmn: TFloatField;
    cdsOKSsNwCmn: TFloatField;
    cdsOKSsSgmCmn: TFloatField;
    cdsOKSsvPrgCmn: TFloatField;
    cdsOKSsForPps: TFloatField;
    cdsOKSsNwPps: TFloatField;
    cdsOKSsSgmPps: TFloatField;
    cdsOKSsvPrgPps: TFloatField;
    cdsOKSsForBln: TFloatField;
    cdsOKSsNwBln: TFloatField;
    cdsOKSsSgmBln: TFloatField;
    cdsOKSsvPrgBln: TFloatField;
    cdsOKSsForDkr: TFloatField;
    cdsOKSsNwDkr: TFloatField;
    cdsOKSsSgmDkr: TFloatField;
    cdsOKSsvPrgDkr: TFloatField;
    cdsOKSsForDgv: TFloatField;
    cdsOKSsNwDgv: TFloatField;
    cdsOKSsSgmDgv: TFloatField;
    cdsOKSsvPrgDgv: TFloatField;
    cdsOKSSchBU: TStringField;
    LbxF8: TListBox;
    PanelSelTts: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelOldSm: TLabel;
    LabelNewSm: TLabel;
    LabelD__Sm: TLabel;
    sBtnClosePanelSelTts: TSpeedButton;
    popNu: TPopupMenu;
    popF8: TMenuItem;
    popUnSelAll: TMenuItem;
    popShwTts: TMenuItem;
    cdsOKSMetka: TBooleanField;
    sBtnCheckOks: TSpeedButton;
    cdsOKSStep: TSmallintField;
    cdsOKSsForPrf: TFloatField;
    cdsOKSsNwPrf: TFloatField;
    cdsOKSsForWSb: TFloatField;
    cdsOKSsNwWSb: TFloatField;
    cdsOKSsForPdnC: TFloatField;
    cdsOKSsNwPdnC: TFloatField;
    cdsOKSsForPdnD: TFloatField;
    cdsOKSsNwPdnD: TFloatField;
    cdsOks2: TClientDataSet;
    cdsOks2NR: TAutoIncField;
    cdsOks2VidN: TStringField;
    cdsOks2ShVidN: TStringField;
    cdsOks2KdSps: TSmallintField;
    cdsOks2KdObj: TSmallintField;
    cdsOks2KdKatP: TSmallintField;
    cdsOks2KdSpZ: TSmallintField;
    cdsOks2SchBU: TStringField;
    cdsOks2Sp_PF: TStringField;
    cdsOks2SPdn: TStringField;
    cdsOks2SPrf: TStringField;
    cdsOks2SWSb: TStringField;
    cdsOks2MyNotes: TStringField;
    cdsOks2SmOld: TFloatField;
    cdsOks2SmNew: TFloatField;
    cdsOks2SmDelta: TFloatField;
    cdsOks2RMes: TDateField;
    cdsOks2PrcECmn: TFloatField;
    cdsOks2PrcEPps: TFloatField;
    cdsOks2PrcEBln: TFloatField;
    cdsOks2PrcEDkr: TFloatField;
    cdsOks2PrcEDgv: TFloatField;
    cdsOks2PrcECmnPrp: TFloatField;
    cdsOks2PrcEBlnPrp: TFloatField;
    cdsOks2PrcEDkrPrp: TFloatField;
    cdsOks2PrcEDgvPrp: TFloatField;
    cdsOks2PrcPdnCmn: TFloatField;
    cdsOks2PrcPdnDgv: TFloatField;
    cdsOks2PrcPrfs: TFloatField;
    cdsOks2PrcWSb: TFloatField;
    dbgrOks2: TDBGrid;
    dsrcOks2: TDataSource;
    Splitter4: TSplitter;
    sBtnOks2Filter: TSpeedButton;
    qryOks2: TQuery;
    cdsOks2PrcEInvPrp: TFloatField;
    cdsOks2PrcEBlnInvPrp: TFloatField;
    cdsOks2PrcEDkrInvPrp: TFloatField;
    cdsOks2SmMinZp: TFloatField;
    cdsOks2SmProgMin: TFloatField;
    cdsZ_NU: TClientDataSet;
    dsrcZ_NU: TDataSource;
    ts5: TTabSheet;
    dbgrZ_NU: TDBGrid;
    cdsZ_NUNR: TAutoIncField;
    cdsZ_NUDtProc: TDateField;
    cdsZ_NUZaMesGod: TDateField;
    cdsZ_NUTabN: TIntegerField;
    cdsZ_NUVidN: TStringField;
    cdsZ_NUChas: TFloatField;
    cdsZ_NUSumma: TFloatField;
    cdsZ_NUDt_Beg: TDateField;
    cdsZ_NUDt_End: TDateField;
    cdsZ_NUKdSps: TSmallintField;
    cdsZ_NUKdObj: TSmallintField;
    cdsZ_NUKdKatP: TSmallintField;
    cdsZ_NUKdSpZ: TSmallintField;
    cdsZ_NUPdN: TSmallintField;
    cdsZ_NUNotes: TStringField;
    cdsZ_NUPrr: TSmallintField;
    cdsZ_NUPrPV: TSmallintField;
    cdsZ_NUKto: TSmallintField;
    cdsZ_NUPrKr: TSmallintField;
    cdsZ_NUMyNotes: TStringField;
    cdsZ_NUSpecPS: TIntegerField;
    cdsZ_NUSpec_NR: TIntegerField;
    cdsZ_NUOldKdObj: TSmallintField;
    cdsZ_NUOldKdVidN: TSmallintField;
    cdsZ_NUDtVdPv: TDateField;
    cdsZ_NUNrVdPv: TIntegerField;
    cdsZ_NUKdBnk: TSmallintField;
    sBtnPredSave: TSpeedButton;
    cdsZ_NUOzn_Pilg: TStringField;
    cdsZ_NUShVidN: TStringField;
    cdsOks3: TClientDataSet;
    dsrcOks3: TDataSource;
    cdsOks3RMes: TDateField;
    cdsOks3KdSps: TSmallintField;
    cdsOks3KdObj: TSmallintField;
    cdsOks3KdSpZ: TSmallintField;
    cdsOks3SchBU: TStringField;
    cdsOks3PrcECmn: TFloatField;
    cdsOks3PrcEPps: TFloatField;
    cdsOks3PrcEBln: TFloatField;
    cdsOks3PrcEDkr: TFloatField;
    cdsOks3PrcEDgv: TFloatField;
    cdsOks3PrcECmnPrp: TFloatField;
    cdsOks3PrcEInvPrp: TFloatField;
    cdsOks3PrcEBlnPrp: TFloatField;
    cdsOks3PrcEBlnInvPrp: TFloatField;
    cdsOks3PrcEDkrPrp: TFloatField;
    cdsOks3PrcEDkrInvPrp: TFloatField;
    cdsOks3PrcEDgvPrp: TFloatField;
    cdsOks3svPrgCmn: TFloatField;
    cdsOks3svPrgPps: TFloatField;
    cdsOks3svPrgBln: TFloatField;
    cdsOks3svPrgDgv: TFloatField;
    cdsOks3KdKatP: TSmallintField;
    cdsOks2Prr: TSmallintField;
    cdsOks3Prr: TSmallintField;
    dbgrOks3: TDBGrid;
    dbgrOKS: TDBGrid;
    Splitter5: TSplitter;
    LbxPeriodu: TListBox;
    cdsOks2RepMes: TDateField;
    cdsOks2ZaMG: TDateField;
    cdsOks3ZaMG: TDateField;
    cdsOks3RepMes: TDateField;
    cdsOks3sNwCmn: TFloatField;
    cdsOks3sNwPps: TFloatField;
    cdsOks3sNwBln: TFloatField;
    cdsOks3sNwDkr: TFloatField;
    cdsOks3sNwDgv: TFloatField;
    cdsOks3sNwCmnPrp: TFloatField;
    cdsOks3sNwInvPrp: TFloatField;
    cdsOks3sNwBlnPrp: TFloatField;
    cdsOks3sNwBlnInvPrp: TFloatField;
    cdsOks3sNwDkrPrp: TFloatField;
    cdsOks3sNwDkrInvPrp: TFloatField;
    cdsOks3sNwDgvPrp: TFloatField;
    sBtnOtklNuToExcel: TSpeedButton;
    popNuSep1: TMenuItem;
    popNuPrtTable: TMenuItem;
    popPrtCdsZNU: TMenuItem;
    qryIsPolnMesByPrmUv: TQuery;
    qryOtklKDTEMU: TSmallintField;
    cdsOKSKdTemu: TSmallintField;
    tblSvResKdTemu: TSmallintField;
    cdsOks2KdTemu: TSmallintField;
    cdsOks3KdTemu: TSmallintField;
    cdsZ_NUKdTemu: TSmallintField;
    cdsNwSmKdTemu: TSmallintField;
    tblMDKdTemu: TSmallintField;
    cdsDoMZ: TClientDataSet;
    cdsDoMZNR: TAutoIncField;
    cdsDoMZVIDN: TStringField;
    cdsDoMZSUMMA: TFloatField;
    cdsDoMZKdObj: TSmallintField;
    cdsDoMZKdKatP: TSmallintField;
    cdsDoMZKdSPZ: TSmallintField;
    cdsDoMZMyNotes: TStringField;
    cdsDoMZSpec_NR: TIntegerField;
    qrySovm: TQuery;
    cdsSovm: TClientDataSet;
    dspSovm: TDataSetProvider;
    qryNdbInf: TQuery;
    tblNuNR: TIntegerField;
    tblNuDTPROC: TDateTimeField;
    tblNuZAMESGOD: TDateTimeField;
    tblNuTABN: TIntegerField;
    tblNuVIDN: TStringField;
    tblNuOLDCH: TFloatField;
    tblNuOLDSM: TFloatField;
    tblNuDT_BEG: TDateTimeField;
    tblNuDT_END: TDateTimeField;
    tblNuKDSPS: TSmallintField;
    tblNuKDTEMU: TSmallintField;
    tblNuKDOBJ: TSmallintField;
    tblNuKDKATP: TSmallintField;
    tblNuKDSPZ: TSmallintField;
    tblNuSCHBU: TStringField;
    tblNuPSCH: TStringField;
    tblNuPDN: TSmallintField;
    tblNuNOTES: TStringField;
    tblNuPRR: TSmallintField;
    tblNuPRPV: TSmallintField;
    tblNuKTO: TSmallintField;
    tblNuPRKR: TSmallintField;
    tblNuMYNOTES: TStringField;
    tblNuSPECPS: TIntegerField;
    tblNuSPEC_NR: TIntegerField;
    tblNuCHAS: TFloatField;
    tblNuSUMMA: TFloatField;
    tblNuDTVDPV: TDateTimeField;
    tblNuNRVDPV: TIntegerField;
    tblNuD_CH: TFloatField;
    tblNuD_SM: TFloatField;
    tblNuOZN_PILG: TStringField;
    tblNuKDBNK: TSmallintField;
    tblNuNR_1: TIntegerField;
    tblNuVIDN_1: TStringField;
    tblNuOLDKDVIDN: TSmallintField;
    tblNuSHVIDN: TStringField;
    tblNuNMVIDN: TStringField;
    tblNuAINDX: TSmallintField;
    tblNuPINDX: TSmallintField;
    tblNuLVL: TSmallintField;
    tblNuINDX: TSmallintField;
    tblNuHSCH: TStringField;
    tblNuNDBE: TStringField;
    tblNuNOSHOW: TStringField;
    tblNuZP13: TStringField;
    tblNuOTP: TStringField;
    tblNuBLN: TStringField;
    tblNuDKR: TStringField;
    tblNuOTPUSKN: TStringField;
    tblNuBOLNIC: TStringField;
    tblNuSPRM: TStringField;
    tblNuCPRM: TStringField;
    tblNuSSRK: TStringField;
    tblNuDETI: TStringField;
    tblNuDETIM: TStringField;
    tblNuDETIK: TStringField;
    tblNuDETIG: TStringField;
    tblNuIND: TStringField;
    tblNuDHD: TStringField;
    tblNuOKLFND: TStringField;
    tblNuCBUDG: TStringField;
    tblNuSNDB: TStringField;
    tblNuSPDN: TStringField;
    tblNuSWSB: TStringField;
    tblNuSPRF: TStringField;
    tblNuSPENS: TStringField;
    tblNuSALIM: TStringField;
    tblNuCNDB: TStringField;
    tblNuSSOCSTRAH: TStringField;
    tblNuSBZR: TStringField;
    tblNuLITTLEHLP: TStringField;
    tblNuKDSPZ_1: TSmallintField;
    tblNuOLDSZATR: TStringField;
    tblNuSP_PF: TStringField;
    tblNuSP_FSTVP: TStringField;
    tblNuSP_FSNV: TStringField;
    tblNuSP_FZ: TStringField;
    tblNuSOVM: TStringField;
    tblNuSPOV: TStringField;
    tblNuKEKV: TStringField;
    tblNuKDSCHDT: TSmallintField;
    tblNuKDSCHKT: TSmallintField;
    tblNuD__Smm: TFloatField;
    tblNuD__Chs: TFloatField;
    tblNuGRP: TSmallintField;
    cdsDoMZGrp: TSmallintField;
    cdsDoMZSmBySovm: TFloatField;
    cdsDoMZSmDelta: TFloatField;
    cdsDoMZKdSps: TSmallintField;
    cdsDoMZKdTemu: TSmallintField;
    PanelTotals: TPanel;
    cdsPerePrd: TClientDataSet;
    cdsMD: TClientDataSet;
    cdsPerePrdNR: TAutoIncField;
    cdsPerePrdDtBeg: TDateField;
    cdsPerePrdSpecNR: TIntegerField;
    cdsPerePrdPrcWrkTime: TFloatField;
    cdsPerePrdOklTrf: TFloatField;
    cdsPerePrdisInKmd: TStringField;
    cdsPerePrdIsOtp: TStringField;
    cdsPerePrdIsOtpSovm: TStringField;
    cdsPerePrdIsBln: TStringField;
    qryMD: TQuery;
    dspMd: TDataSetProvider;
    tblMDSmMinZp: TFloatField;
    tblMDSmDoMZ: TFloatField;
    tblMDSmNdb: TFloatField;
    tblMDSmNdbSovm: TFloatField;
    tblMDDayOklTrf: TFloatField;
    Splitter6: TSplitter;
    tblMDIsOtp: TSmallintField;
    tblMDIsOtpSovm: TSmallintField;
    tblMDIsneopl: TBooleanField;
    qryPrN: TQuery;
    cdsZ_NUGrp: TSmallintField;
    tblNuPrc_WT: TFloatField;
    tblMDLockBlnOsn: TIntegerField;
    tblMDLockBlnSovm: TIntegerField;
    tblSvResSovm: TStringField;
    qryOtklOtkl_Sovm: TStringField;
    tblNUStorn: TStringField;
    tblMDNeoplSovmSps6: TBooleanField;
    tblMDIsOtpSovmSps6: TSmallintField;
    tblMDBlnSovmSps6: TBooleanField;
    tblNuNuSovm: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPart1Click(Sender: TObject);
    procedure sBtnPart2Click(Sender: TObject);
    procedure ShwTotals;
    procedure sBtnSaveResClick(Sender: TObject);
    procedure dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tblNuBeforePost(DataSet: TDataSet);
    procedure tblNuCalcFields(DataSet: TDataSet);
    procedure cdsOKSCalcFields(DataSet: TDataSet);
    procedure cdsOKFloatFieldGetText(Sender: TField; var Text: String;
                                                          DisplayText: Boolean);
    procedure sBtnTblNuFilterClick(Sender: TObject);
    procedure sBtnOpenOldNUClick(Sender: TObject);
    procedure sBtnObrOtklClick(Sender: TObject);
    procedure dbgrSvResDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tblSvResCalcFields(DataSet: TDataSet);
    procedure sBtnLbxPerioduClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgridEnter(Sender: TObject);
    procedure dbgridExit(Sender: TObject);
    procedure sBtnF8Click(Sender: TObject);
    procedure dbgrNUKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sBtnClosePanelSelTtsClick(Sender: TObject);
    procedure popShwTtsClick(Sender: TObject);
    procedure popUnSelAllClick(Sender: TObject);
    procedure popNuPopup(Sender: TObject);
    procedure dbgrOKSDblClick(Sender: TObject);
    procedure dbgrOKSDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnCheckOksClick(Sender: TObject);
    procedure MadeNewEsvEqualOldEsv(bEsv, bEsvPrp : boolean);
    procedure sBtnOks2FilterClick(Sender: TObject);
    procedure sBtnPredSaveClick(Sender: TObject);
    procedure cdsZ_NUCalcFields(DataSet: TDataSet);
    procedure dbgrZ_NUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnOtklNuToExcelClick(Sender: TObject);
    procedure popNuPrtTableClick(Sender: TObject);
    procedure popPrtCdsZNUClick(Sender: TObject);
    procedure GetSmForSvPorogi(var nSmFSvP, nSmCmnFSvP, nSmPpsFSvP,
                                   nSmBlnFSvp, nSmDkrFSvP, nSmDgvFSvP : double);
    procedure dbgrSvResKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    _EsvSps: Integer;

    nPrcWT    : double; // Процент рабочего времени из перемещений
    pn_KdTemu : SmallInt;
    dMesPeremen : TDateTime; // месяц, с которого внедряется новая схема счета
    dMesPeremenNICH : TDateTime; // то же для НИЧ'евцев или пересекающихся с НИЧ

    nMaxNuNR : integer;
    // объявляю тут переменные, которые будут постоянно встречаться (начало)

    n_WrkChasMes: double;
    bbb_CmbOkl: boolean;
    nnn_Summa: double;

    // группа для выемки информации о виде начисления из KdVidN

    // группа Pere для выемки информации из Pere
    nPereKdSps, nPereKdObj, nPereKdKatP,
                nPereSO, nPerePdNlg, nPereKolMin, nPereKdSpz : integer;
    nPereOklTrf, nPereAvans : double;
    cPereSpAv : string1;
    cPereDolgnost, cPereNrPrikaza : string;
    dPereDtPrikaza : TDateTime;
    bPerePens, bPereSovm, bPerePrfs : boolean;
    nPereInv : SmallInt;

    // группа для выемки информации из TPdn
    nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG, nProgMinCM, {nSmSvPrg,}
                                      nPrgLg, nProcLg, nSm2660,
                                        nSmLg100, nSmLg150, nSmLg200 : double;
    // объявляю тут переменные, которые будут постоянно встречаться (конец)

    b_Pereschet : boolean;
    bIsAlimentu, bIsPerevodu : boolean;
    dDtPereloma : TDateTime;
    cNmTblPeriodu, cNmTblMd, cNmTblNU, cNmTblSvRes : ShortString;
    n_TN : integer;
    c_FamIO : string;
    d_SysCtrl : TDateTime; // 01 число системного месяца
    d_DtCtrl : TDateTime;  // Месяц, который пришел из вызывающей процедуры
                           // и к которому будут подключаться результаты счета
    d_20110101 : TDateTime; // месяц изменения расчета в ПФ (появился ЕСВ)
    d_20111201 : TDateTime; // появился вид 8686 - ЕсвПрпБлнИнв
                            // (ЕСВ предприятия с Блн инвалидов)
    dDt07_01_01, dDt09_01_01, dDt11_08_01, dDt11_09_01,
                 dDt13_10_01 : TDateTime; // Даты, начиная с которых есть
                                          // особенности при некоторых расчетах
    d_MesBegWSb : TDateTime; // Начало удержания ВоенСбора - EncodeDate(2014,8,1)
    d_20150101 : TDateTime; // В ЕСВ стали испольоваться виды с 8711 по 8716
    d_20160101 : TDateTime; // Новые порядки  при расчётах удержаний в ЕСВ
                            // с сотрудников и взносов в ЕсвПрп с предприятия
    nDbgCycle : integer;
    c_OznPilg : ShortString;  // для сбора примененных ОзнакПильг

    aGrpSovm: Array [MIN_GRP_NUM..MAX_GRP_NUM] of TGrpSovm;

    // Делалось для случаев, когда несколько совместительских надбавок,
    // но в отпуске продолжать считать одну из них. Для такой надбавки
    // в диалоге редактирования выставляется флаг "Игнорировать неопл. отпуск"
    NopaySovmVacArr, PaySovmVacArr: TKeySpanArr;
    // Периоды отпуска по уходу за ребёнком
    // В такие периоды будем продолжать считать совместительские надбавки
    ChildCareVacArr: TSpanArr;

    PeekQuery: TQuery;

//    procedure GetSvPorogi(nSmFor, nSmPfMax, nSmECmnFor, nSmEPpsFor,
//                                  nSmEBlnFor, nSmEDkrFor, nSmEDgvFor : double;
//                 var nSvPECmn, nSvPEPps, nSvPEBln, nSvPEDkr, nSvPEDgv : double);
    function CalcMonth(nTabN : integer; dRMes : TDateTime) : boolean;
    procedure CreOpenWrkTables(nTabN: integer);
    procedure OpenMesQueries(nTabN : integer; dRMes : TDateTime);
    procedure CreOpenTblPeriodu(nTabN : integer; cNmTblPeriodu : string);
    procedure CreOpenTblMd(nTabN : integer; dRMes : TDateTime;   {создается в
                      начале каждого периода (месяцы/дни)}  cNmtblMd : string);
    procedure CreOpenOldNU(nTabN : integer; dRMes : TDateTime);
    procedure FillOksInPart01;  // В процессе Part01
    procedure ObrOtkl(nTabN : integer; dRMes : TDateTime);
    procedure R_Default(nTabN : integer; dRMes :TDateTime);
    procedure CreOpenCdsCmbOkl(nSpec_NR : integer);
    procedure GetSmPfMax(dAnyDate : TDateTime; var nSmPfMax : double);


//
    function GetSmMinZp(dAnyDate : TDateTime) : double;




    function GetPrcWSb(dAnyDate : TDateTime) : double;

    // Получение данных о пороговых и налоговых суммах
    function LocateTaxInfo(OnDate: TDateTime): TDataSet;
    procedure GetPdnInfo(dAnyDate: TDateTime; var nPrcPdn, nPrcPdn2,
      nMinZpNG, nMinZpCM, nProgMinNG, nProgMinCM, nPrgLg, nProcLg,
      nSm2660, nSmLg100,nSmLg150, nSmLg200 : double);

    procedure GetSm1517(nSmCmnFX, nSmDgvFX, nSmMin10 : double;
                          var nSmCmn15 , nSmCmn17, nSmDgv15, nSmDgv17 : double);
    procedure SetSvPorogi(nSmFor, nSmPfMax, nSmECmnFor, nSmEPpsFor,
                                  nSmEBlnFor, nSmEDkrFor, nSmEDgvFor : double;
                 var nSvPECmn, nSvPEPps, nSvPEBln, nSvPEDkr, nSvPEDgv : double);
    procedure GetSmEsv(dZaMG : TDateTime;
                var nSmUdEsvCmn, nSmUdEsvPps, nSmUdEsvBln, nSmUdEsvDgv: double);

    // Получение данных о текущей позиции сотрудника
    function LocatePereInfo(OnDate: TDateTime): TDataSet;
    procedure LocalGetPereInf(nTabN : integer; dRMes : TDateTime;
                                var n_KdSps, n_KdObj, n_KdKatP, n_SO,
                                    n_PdNlg, n_KolMin, n_KdSpZ : integer;
                                var nPrcWT, nOklTrf, nAvans : double;
                                var cSpAv : string1;
                                var cDolgnost, cNrPrikaza : string;
                                var dDtPrikaza : TDateTime;
                                var bPens, bSovm, bPrfs : boolean;
                                var nInv : SmallInt);
    procedure R_ByUderg(nTabN : integer; dRMes : TDateTime);
    function SumUdrg(nTabN : integer; cVidN : string4;
                               var nSmPsb : double; dRMes : TDateTime) : double;
    procedure GetPrcEsv(dZaMG : TDateTime; var nPrcECmn, nPrcEPps,
                                         nPrcEBln, nPrcEDkr, nPrcEDgv : double);
    procedure GetPrcEsvPrp(dZaMG : TDateTime; var nPrcECmn, nPrcEInv,
                                     nPrcEBln, nPrcEBlnInv,
                                      nPrcEDkr, nPrcEDkrInv, nPrcEDgv : double);
    procedure R_Esv2016(nTabN : integer; dRMes : TDateTime);

    procedure QryInvPrepare;
    function IsInvalid(nTabN : integer; dZaMG : TDateTime) : boolean;
    procedure R_Prfs(nTabN : integer; dRMes : TDateTime);
    function SumPrfs(nTabN : integer; var cVidN : string4;
                                 dRMes : TDateTime; nSmForXX : double) : double;
    procedure R_PdNlg(nTabN : integer; dRMes : TDateTime);
    procedure R_WSb(nTabN : integer; dRMes : TDateTime);
    function SumWSb(nTabN : integer; var cVidN : string4;
                                 dRMes : TDateTime; nSmForXX : double) : double;

    procedure TblNuAdd(d_DtPrc, dZaMesGod, dDtBeg, dDtEnd : TDateTime;
      cVidN : string4; n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPdN,
      nPrPV, nPRR, n_KdSpZ : integer;
      nChas, nSumma, nPrcWrkTime, nPrcSovm : double;
      cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg : ShortString;
      nGrp, nSpecNR : integer; nKdBnk : SmallInt;
      Sovm, Storn: ShortString);

    procedure SvTblNuToTblSvRes(dRMes : TDateTime);
    procedure AddRecToTblSvRes(nTabN : integer; dDtPrc, dZaMG : TDateTime;
      nDChs, nDSmm : double; cVidN, cDt_Beg, cDt_End,
      cKdSps, cKdTemu, cKdObj, cKdKatP, cKdSpZ, cPdN, cNotes,
      cPRR, cPrPV, cKto, cPrKr, cMyNotes, cSpecPS,
      cSpec_NR, cDtVdPV, cNrVdPV, cStorn, cSAlim,
      cOznPilg, cCBudg, cKdBnk, Sovm: ShortString);
    procedure DelTmpTables;
    procedure Part01(nTabN : Integer; dRMes : TDateTime);
    procedure Part02(nTabN : Integer; dRMes : TDateTime);
    procedure RaschetOtkl(nTabN, nSpecNR : integer; cVidN : string4;
                                    dZaMG, dDtBeg, dDtEnd : TDateTime;
                                                 var nChOtkl, nSmOtkl : double);
    procedure CalcDoMZ(RMes: TDateTime);
    procedure CalcDoMZSovm(RMes: TDateTime);
    procedure RaschetDolga(d_DtCtrl : TDateTime);
    procedure AddInPeriodu(dDtProc, dZaMesGod : TDateTime; nPrKr,
                                nNSpecPS, nNuCntFakt, nNuCntInPS, nOtklCntFakt,
                                    nOtklCntInPS : integer;
                                         nNuAvgSpecPS, nOtklAvgSpecPS : double);
    procedure CalcAlimony(TabN: Integer; MnthYear: TDateTime);
    procedure R_Perevod(nTabN : integer; dZaMesGod : TDateTime);
    function GetSmPsbAlim(nKdPst : SmallInt; dZaMG : TDateTime;
                                                  nSmForPsb : double) : double;
    function GetSmPsbPvd(nKdPst : SmallInt; dZaMG : TDateTime;
                                                     nSmPvd : double) : double;
    procedure SetDaysBdgZanInTblMD(cVidN : ShortString;
                                       dOtklZaMG, dDtBeg, dDtEnd : TDateTime;
                                          bZaniato : boolean; nPrcWT : double);

    function CalcBlnHoursForCurOtkl(CalcPeriod: TPeriod): integer;
    function SplitSickToEffPeriods: TPeriods;

    procedure AddRecInZ_Nu(dRMes, dZaMG, dDt_Beg, dDt_End : TDateTime;
        nChas, nSumma : double;
        nTabN, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ,
        nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR : integer;
        cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV,
        cOznPilg, cKdBnk, Sovm, Storn: ShortString);

    procedure AddRecInCdsZ_Nu(dRMes, dZaMG, dDt_Beg, dDt_End : TDateTime;
                           nChas, nSumma : double;
                        nTabN, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ,
                        nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR : integer;
                        cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV,
                                                cOznPilg, cKdBnk : ShortString);
    function GetPereKdSpZ(dDtMes : TDateTime) : integer;

    function GetSmPM(VidN: ShortString; OnDate: TDateTime; TabN: Integer;
      Chas: Double): Double;

    procedure ObrNadbSpsb3(nTabN : integer; dRMes : TDateTime);
    procedure SetTblNuFilter;
    procedure SetLbxPerioduVisible;

    procedure R_NdbSingleOkl(nTabN: integer; dRMes: TDateTime);
    procedure R_NdbCmbOkl(nTabN: integer; dRMes: TDateTime;
      FirstPartSal: Boolean; PartSalId, nCmbOklKdSPZ, nCmbOklKdObj: integer;
      nSumma, nChas: double);
    procedure CalcNdb(RMes: TDateTime);
    procedure R_NdbBySmmPrc(VidN: ShortString; AllowSpan: TPeriod;
      VidIsSovm, VidInSmDoMZ: Boolean; SpsRsch: Integer; SumProcNdb: Double;
      var ChNdb, SmNdb: Double);

    procedure OpenQryNadb(nTabN: integer; dRMesBeg: TDateTime);

    procedure GetSmPfFzSs(nTabN : integer; dZaMG : TDateTime;
                                 var nSmOldPfFzSsCmn, nSmOldPfFzSsDgv : double);
    procedure ShwSelTts;

    procedure GetSmForPrfs(dRMes : TDateTime; var nOldSmForXX, nNewSmForXX,
                                                   nOldSmXX, nNewSmXX : double);
    procedure GetSmForWSb(dRMes : TDateTime; var nOldSmForXX, nNewSmForXX,
                                                   nOldSmXX, nNewSmXX : double);
    procedure GetSmForPdn(dRMes: TDateTime;
                var nOldSmCmnFX, nOldSmDgvFX, nNewSmCmnFX, nNewSmDgvFX,
                    nOldSmCmnXX, nOldSmDgvXX, nNewSmCmnXX, nNewSmDgvXX: double);
    procedure AddRecInCdsOks2(dRMes : TDateTime);
    procedure GetAnyValues(dRepMes : TDateTime; var nPrcECmn, nPrcEPps,
                           nPrcEBln, nPrcEDkr, nPrcEDgv, nPrcECmnPrp,
                           nPrcEInvPrp, nPrcEBlnPrp, nPrcEBlnInvPrp,
                           nPrcEDkrPrp, nPrcEDkrInvPrp, nPrcEDgvPrp,
                           nPrcPdnCmn, nPrcPdnDgv, nPrcPrfs, nPrcWSb,
                           nMinZp, nProgMin : double);
    procedure CreOpenCdsOks2(dRMes : TDateTime);
    procedure SetOks2Filter;
    procedure CreOpenCdsOks3(dRmes : TDateTime);
    procedure AddRecInCdsOks3(dRmes : TDateTime);
    procedure SaveSchetResults(nTabN : integer; dRMes : TDateTime);
    procedure PredSaveResults(nTabN : integer; dRMes : TDateTime);
    procedure GetSmsDoMinZp(dDtZaMG: TdateTime; var nSmXxDoMinZp,
                nSmCmnFor, nSmPpsFor, nSmBlnFor, nSmDkrFor,
                nNwSmCmnF, nNwSmPpsF, nNwSmBlnF, nNwSmDkrF : double);
    function WorksInMes(nTabN : integer; dInMes : TDateTime) : boolean;
    function IsPolnMesByPrmUv(nTabN : integer; dZaMG : TDateTime) : boolean;
    function GetPrcWT(nSpecNR: integer; var nPrcWT: double): boolean;
    procedure AddRecInCdsDoMZ(nSmBySovm, nSmDelta, nSmDopl:double;
              nKdSps, nKdTemu,
              nKdObj, nKdKatP, nKdSpz, nGrp : smallint;
              nSpecNR: integer; cVidn, cMyNotes: shortString);

    function GetCmbOkl(nSpec_NR : integer) : double;

    procedure InitGrpSovm;
    procedure AddGrpSovm(nGrpN: SmallInt; {nGrpChas, }nGrpSum, nGrpPrcWrkTime: double);

    procedure RschDoMinZp(nTabN: integer; var nNdbSovmChas, nNdbSovmSum: double);

    procedure SetDaysVacat(RMes, DtBeg, DtEnd: TDateTime;
      Supplmnt: Boolean; Sps: Word; Storn: Boolean);
    procedure SetDaysSick(RMes, DtBeg, DtEnd: TDateTime;
      Supplmnt: Boolean; Sps: Word);
    procedure SetDaysNonPay(VidN: ShortString;
      RMes, DtBeg, DtEnd: TDateTime; Supplmnt: Boolean; Sps: Word;
      Storn: Boolean);

    procedure SetNadbToMD(nTabN: integer; dRMes: TDateTime);
    procedure SetNadbOtklToMD(RMes: TDateTime; DataSet: TDataSet;
      Supplmnt: Boolean);
    procedure LockBlnInMD(RaschMes: TDateTime);
    procedure Set_5011_5012_ToMD(dRMes, dNadbBeg, dNadbEnd: TDateTime);
    procedure SetKmdToMD(dRMes, dDtBeg, dDtEnd : TDateTime; bValue: boolean);
    procedure SetTblMdFlag(cFieldName: string; dRMes, dDtBeg, dDtEnd: TDateTime;
        cTemplate: string; bValue: boolean);

    function DayIsSick(Supplmnt: Boolean; Sps: Integer): Boolean;
    function DayIsVacat(Key: TSpanKey): Boolean;
    function DayIsNonPay(Supplmnt: Boolean; Sps: Integer): Boolean;

    function VacatFldName(Supplmnt: Boolean; Sps: Integer): ShortString;

    function VidIsOtpOsn(cVidN: string): boolean;
    function VidIsOtpSovm(cVidN: string): boolean;
    function VidIsBln(dataSet: TDataSet): boolean;
    class function VidIsKmd(cVidN: string): boolean;
    function VidIsNICh(VidN: ShortString): boolean;
    class function SqlVidIsNICh: ShortString;

    procedure SetEsvSps(Sps: Integer);
    property EsvSps: Integer read _EsvSps write SetEsvSps;

    procedure ClearKeySpanArr(var Arr: TKeySpanArr);
    procedure ClearSpanArr(var Arr: TSpanArr);

    procedure ProcKeySpan(var Arr: TKeySpanArr; Key: TSpanKey;
      RMes: TDateTime; DataSet: TDataSet);
    procedure ProcSpan(var Arr: TSpanArr; RMes: TDateTime; DataSet: TDataSet);

    function FindKeySpanDay(Arr: TKeySpanArr; Key: TSpanKey;
      Day: TDateTime): Boolean;
    function FindSpanDay(Arr: TSpanArr; Day: TDateTime): Boolean;

    function CreateSpanKey(KdSps, KdObj: Integer;
      Sovm: Boolean): TSpanKey;

    function SpanIndxByKey(Arr: TKeySpanArr; Key: TSpanKey): Integer;
    function SpanKeysAreEqual(Key1, Key2: TSpanKey): Boolean;

    procedure AddSpan(var Arr: TSpanArr; Span: TSpan);
    procedure SubstSpan(var Arr: TSpanArr; Span: TSpan);

    function IgnNoPayVac(Key: TSpanKey; CalcDay: TDateTime): Boolean;
    function IgnChildCareVac(CalcDay: TDateTime): Boolean;
  end;

function StartRs5(
  bFromMainForm : boolean; nTabN: integer;
  cFamIO : string; dDtCtrl : TDateTime): Boolean;

const SECTION = 'Z_Rs4';

var
  FormRs5: TFormRs5;

implementation

uses
  A_Const, A_Lib, A_DM,
  Z_DM, Z_Main, Z_CmnPrt, Z_AuditDataModule,
  NumUtils, QryLib, VidNUtils;

{$R *.dfm}

//------------------------------------------------------------------------------
function StartRs5(
  bFromMainForm : boolean;
  nTabN : integer;
  cFamIO : string;
  dDtCtrl : TDateTime
): Boolean;
var dRMes : TDateTime; nY, nM, nD : word;
begin
  if DmAudit.AuditIsEnabled then
    DmAudit.RunAuditForEmployee(nTabN, dDtCtrl);

  FormRs5 := TFormRs5.Create(Application);

  with FormRs5 do begin
    pn_KdTemu := 789;
    dMesPeremen := EncodeDate(2007, 6, 1);
    dMesPeremenNICH := EncodeDate(2007, 12, 1);
    d_20110101 := EncodeDate(2011,  1, 1);
    d_20111201 := EncodeDate(2011, 12, 1);
    d_20150101 := EncodeDate(2015,  1, 1);
    d_20160101 := EncodeDate(2016,  1, 1);

    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select distinct KdSps from z_nu ' +
                           ' where (TabN = :nTabN) and ZaMesGod >= :dMes');
      ParamByName('nTabn').AsInteger := nTabN;
      ParamByName('dMes').AsDateTime := dMesPeremen;
      Open;
      while not Eof do begin
        if FieldByName('KdSps').AsInteger = 6 then begin
          dMesPeremen := dMesPeremenNICH;
          Break;
        end;
        Next;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;

    nMaxNuNR := 0;
    nDbgCycle := 0;
    b_Pereschet := false;
    n_TN := nTabN;
    c_FamIO := cFamIO;
    DecodeDate(Date, nY, nM, nD);
    d_SysCtrl := EncodeDate(nY, nM, 1);
    d_DtCtrl  := dDtCtrl;
    bIsAlimentu := false;
    bIsPerevodu := false;
    if not DmMain.cdsEDays.Active then // создать/открыть cds ЭкзоДней
      DmMain.CreOpenCdsEDays;
    // Создание вспомогательных таблиц,  в т.ч. tblPeriodu, в которой
    CreOpenWrkTables(nTabN); // собираются месяцы, требующие перерасчета с под-
                             // ключением к результатам текущего месяца d_DtCtrl
    QryInvPrepare;
    if bFlagDbg then begin
      LabelDbgMsg.Caption := 'Периодов ' + IntToStr(tblPeriodu.RecordCount);
      ShowModal; end
    else with tblPeriodu do begin
      First;
      while not Eof do begin
        if bFromMainForm then begin
          FormZpMain.StatusBar.Panels[0].Text := cFamIO + '. Расчет за ' +
                                  Copy(FieldByName('ZaMesGod').AsString, 4, 7);
          Application.ProcessMessages;
        end;

        //==========================================
        dRMes := FieldByName('ZaMesGod').AsDateTime;
// SB 30.1.2026
// УСЛОВИЕ ДЛЯ ПЕРЕРАСЧЁТА ППС В ЯНВАРЕ 2026 ГОДА
// IF DRMES = 46023 THEN
        CalcMonth(n_TN, dRMes);
        //==========================================

        if bFromMainForm then begin
          FormZpMain.StatusBar.Panels[0].Text := '';
          Application.ProcessMessages;
        end;
        Next;
      end;
      if bIsAlimentu then
        CalcAlimony(nTabN, d_DtCtrl);
      if bIsPerevodu then
        R_Perevod(nTabN, d_DtCtrl);
      RaschetDolga(d_DtCtrl);
      SaveSchetResults(n_TN, d_DtCtrl);
    end;
    Result := true;
    DelTmpTables;
    Free;
  end; {with}

  if DmAudit.AuditIsEnabled then begin
    DmAudit.AuditForEmployeeEnded;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.CalcMonth(nTabN : integer; dRMes : TDateTime) : boolean;
// Повторяется столько раз, сколько встретилось периодов с RequiredPS
var
  nY, nM, nD: word;
begin
  if dRMes = d_DtCtrl then
    b_Pereschet := false
  else
    b_Pereschet := true;
  dDtPereloma := EncodeDate(2004, 1, 1);
  DecodeDate(dRMes, nY, nM, nD);
  if bFlagDbg then begin
    dsrcPeriodu.DataSet := tblPeriodu;
    dsrcNU.DataSet  := tblNU;
    Caption := 'Рассчитываем месяц ' + DateToStr(dRMes) +
      ' в ' + DateToStr(d_DtCtrl);
  end;

  ClearKeySpanArr(NopaySovmVacArr);
  ClearKeySpanArr(PaySovmVacArr);
  ClearSpanArr(ChildCareVacArr);

  OpenMesQueries(nTabN, dRMes); // открываются все Query под текущий месяц
  CreOpenTblMd(nTabN, dRMes, cNmtblMd); // Создаётся и заполняется tblMd
  Part01(nTabN, dRMes);

  CreOpenCdsOks2(dRMes);
  CreOpenCdsOks3(dRMes);
  Part02(nTabN, dRMes);

  Result := true;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnOpenOldNUClick(Sender: TObject);
var
  MnthYear: TDateTime;
  Date: TDate;
begin
  sBtnOpenOldNU.Enabled := false;

  Inc(nDbgCycle);

  with TblPeriodu do begin
    if nDbgCycle = 1 then
      First
    else
      Next;

    MnthYear := FieldByName('ZaMesGod').AsDateTime;

    Date := DateUtils.Decode(MnthYear);

    LabelDbgMsg.Caption := 'Период ' +
      IntToStr(nDbgCycle) + ' / ' + IntToStr(RecordCount) + ': ' +
      MesRus(Date.Mnth) + ' ' + IntToStr(Date.Year);
  end;

  OpenMesQueries(n_TN, MnthYear);
  CreOpenTblMd(n_TN, MnthYear, cNmtblMd);
  CreOpenOldNU(n_TN, MnthYear);

  sBtnObrOtkl.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnObrOtklClick(Sender: TObject);
begin
  // перемещением по tblPeriodu командует (выше) sBtnOpenOldNU, поэтому
  // тут есть уверенность, что sBtnOpenOldNU уже стоит на нужном периоде
  sBtnObrOtkl.Enabled := false;
  ObrOtkl(n_TN, tblPeriodu.FieldByName('ZaMesGod').AsDateTime);
  sBtnPart1.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnPart1Click(Sender: TObject);
var cMsg : string; nY, nM, nD : word; dRMes : TDateTime;
begin
  if nDbgCycle <= tblPeriodu.RecordCount then begin
    sBtnPart1.Enabled := false;
    dRMes := tblPeriodu.FieldByName('ZaMesGod').AsDateTime;
    //===============================================================
    Part01(n_TN, dRMes);
    //===============================================================
    DecodeDate(dRMes, nY, nM, nD);
    cMsg := 'Периодов ' + IntToStr(tblPeriodu.RecordCount) + ', выполнен: ' +
                          IntToStr(nDbgCycle) + '-й (' + MesRus(nM) +  ' ' +
                          IntToStr(nY) + ' г.)';
    LabelDbgMsg.Caption := cMsg;
    if nDbgCycle <= tblPeriodu.RecordCount then
      sBtnPart2.Enabled:= true;
    CreOpenCdsOks2(dRMes);
    CreOpenCdsOks3(dRMes);
  end;
  //cdsMd.SaveToFile('c:\t_e_m_p\bor_' + IntToStr(nDbgCycle) + '.cds');
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnPart2Click(Sender: TObject);
begin
  Part02(n_TN, tblPeriodu.FieldByName('ZaMesGod').AsDateTime);
  sBtnPart2.Enabled := false;
  if nDbgCycle < tblPeriodu.RecordCount then
    sBtnOpenOldNU.Enabled:= true
  else begin
    if bIsAlimentu then
      CalcAlimony(n_TN, d_DtCtrl);
    if bIsPerevodu then
      R_Perevod(n_TN, d_DtCtrl);
    RaschetDolga(d_DtCtrl);

    // Мне можно
    if (d_DtCtrl = d_SysCtrl) or (nAppKdUsr = 101) then
      sBtnSaveRes.Enabled := true;

    //sBtnPredSave.Enabled := sBtnSaveRes.Enabled;
    ShwTotals; // В конце Part02 заполняется tblSvRes - подбиваю итоги
    LabelDbgMsg.Caption := 'Следующий шаг: SaveSchetResults';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.ShwTotals;
var nSmNach, nSmVupl, nSmUdrg, nSmDolga : double; cMsg : ShortString;
begin
  with tblSvRes do begin
    DisableControls;
    First;
    nSmNach := 0;
    nSmVupl := 0;
    nSmUdrg := 0;
    nSmDolga := 0;
    while not Eof do begin
      if FieldByName('VidN').AsString < '7600' then begin
        if (FieldByName('VidN').AsString = '2724') then
          nSmDolga := nSmDolga + FieldByName('Summa').AsFloat
        else if (FieldByName('VidN').AsString < '6000') then
          nSmNach := nSmNach + FieldByName('Summa').AsFloat
        else if (FieldByName('VidN').AsString < '7500') then
          nSmUdrg := nSmUdrg + FieldByName('Summa').AsFloat
        else
          nSmVupl := nSmVupl + FieldByName('Summa').AsFloat;
      end;
      Next;
    end;
    EnableControls;
    { if (nSmNach <> 0) or (nSmVupl <> 0) or (nSmUdrg <> 0) or
                                                  (nSmDolga <> 0) then begin }
      cMsg := 'Rs5   Начисл.: ' + FloatToStrF(nSmNach, ffCurrency, 18, 2) +
              '  Удерж.: ' + FloatToStrF(-nSmUdrg, ffCurrency, 18, 2);
      if nSmVupl <> 0 then
        cMsg := cMsg + '  Выпл.: ' + FloatToStrF(-nSmVupl, ffCurrency, 18, 2);
      if nSmDolga <> 0 then
        cMsg := cMsg + '  ВДолгТМ: ' + FloatToStrF(nSmDolga, ffCurrency, 18, 2);
      cMsg := cMsg + '  К выпл.: ' +
                        FloatToStrF(nSmNach + nSmUdrg + nSmVupl + nSmDolga,
                                                        ffCurrency, 18, 2) + '  ';
      PanelTotals.Caption := cMsg;
    { end; }
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnSaveResClick(Sender: TObject);
begin
  SaveSchetResults(n_TN, d_DtCtrl);
  Close;
  Application.ProcessMessages;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.R_Perevod(nTabN : integer; dZaMesGod : TDateTime);
var cVidN : string4;
    nSmForPvd, nSmUshlo, nSmPvd, nSmPsb : double;
    cNomDoc : string; nSpec_NR, nKdPst, nPdn, nPrPv : integer;
    n_KdSps, n_KdTemu,
             n_KdObj, n_KdKatP, n_SO, n_PdNlg, n_KolMin, n_KdSpZ : integer;
    nOklTrf, nAvans : double;
    cSpAv : string1; cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime; bPens, bSovm, bPrfs : boolean;
    nInv : SmallInt;
begin
  cVidN := '6611';
  with cdsAlim do begin  // использую тут cdsAlim - структура та же
    if Active then Close;
    IndexName := '';
    IndexDefs.Clear;
    CreateDataSet;
    Open;
  end;
  LocalGetPereInf(nTabN, dZaMesGod, n_KdSps, n_KdObj, n_KdKatP, n_SO, n_PdNlg,
                     n_KolMin, n_KdSpZ, nPrcWT, nOklTrf, nAvans, cSpAv,
                       cDolgnost, cNrPrikaza, dDtPrikaza, bPens, bSovm,
                         bPrfs, nInv);
  n_KdTemu := 0;  // он тут не нужен
  // в tblSvRes уже собраны все записи, которые будут сохранены
  // с DtProc = d_DtCtrl. Поэтому в ней можно собрать суммы, необходимые для
  // корректного расчета переводов и, если нужно, почтового сбора
  with tblSvRes do begin
    DisableControls;
    First;
    nSmForPvd := 0;
    while not Eof do begin
      if (FieldByName('VidN').AsString < '8600') and
                     (FieldByName('VidN').AsString <> '2724') then
        nSmForPvd := nSmForPvd + FieldByName('Summa').AsFloat;
      Next;
    end;
    EnableControls;
  end;
  with qryUdrg do begin
    First;
    nSmUshlo := 0;
    while (nSmForPvd > 0) and not Eof do begin
      if (FieldByName('VidN').AsString = cVidN) and
                (FieldByName('Dt_Beg').IsNull or
                    (FieldByName('Dt_Beg').AsDateTime <= dZaMesGod)) and
                (FieldByName('Dt_End').IsNull or
                    (FieldByName('Dt_End').AsDateTime >= dZaMesGod)) then begin
        nSpec_NR := FieldByName('Spec_NR').AsInteger;
        cNomDoc  := FieldByName('NomDok').AsString;
        nKdPst   := FieldByName('KdPst').AsInteger;
        if (FieldByName('SpsRsch').AsInteger = 1) or
                  (qryUdrg.FieldByName('SpsRsch').AsInteger = 3) then
          nSmPvd := RoundTo(nSmForPvd *
                               FieldByName('SumVzn').AsFloat / 100, -2)
        else
          nSmPvd := qryUdrg.FieldByName('SumVzn').AsFloat;
        if not cdsAlim.Locate('Spec_NR;NomDoc',
                    VarArrayOf([nSpec_NR, cNomDoc]), []) then begin
          cdsAlim.Append;
          cdsAlim.FieldByName('Spec_NR').AsInteger := nSpec_NR;
          cdsAlim.FieldByName('NomDoc').AsString := cNomDoc;
          cdsAlim.FieldByName('KdPst').AsInteger := nKdPst; end
        else
          cdsAlim.Edit;
        cdsAlim.FieldByName('SmAlim').AsFloat :=
                             cdsAlim.FieldByName('SmAlim').AsFloat + nSmPvd;
        if cdsAlim.FieldByName('SmAlim').AsFloat > nSmForPvd then
          cdsAlim.FieldByName('SmAlim').AsFloat := nSmForPvd;
        cdsAlim.Post;
        // на случай, если окажется больше одной записи и случится перебор
        nSmUshlo := nSmUshlo + cdsAlim.FieldByName('SmAlim').AsFloat;
      end;
      nSmForPvd := nSmForPvd - nSmUshlo;
      Next;
    end;
  end;
  with cdsAlim do begin
    AddIndex('OnNomDoc', 'NomDoc', [ixCaseInsensitive]);
    IndexName := 'OnNomDoc';
    First;
    nPrPv := 3;
    nPdn := 1;
    //if bFlagDbg then
    //  SaveToFile(cDirTemp + 'AlimPvd.cds');
    //nPrcPsb := 0;
    nSmPsb  := 0;
    while not Eof do begin
      cNomDoc := FieldByName('NomDoc').AsString;
      nKdPst := FieldByName('KdPst').AsInteger;
      nSpec_NR := FieldByName('Spec_NR').AsInteger;
      nSmPvd := FieldByName('SmAlim').AsFloat;
      if (nKdPst <> 0) then
        nSmPsb := GetSmPsbPvd(nKdPst, dZaMesGod, nSmPvd);
      nSmPvd := nSmPvd - nSmPsb;
      // Добавить в tblSvRes запись по виду '6611' - перевод
      AddRecToTblSvRes(nTabN, dZaMesGod, dZaMesGod,
                         0, -RoundTo(nSmPvd, -2), '6611', '', '',
                         IntToStr(n_KdSps), IntToStr(n_KdTemu),
                         IntToStr(n_KdObj), IntToStr(n_KdKatP),
                         IntToStr(n_KdSpZ), IntToStr(nPdn), cNomDoc,
                         '', IntToStr(nPrPv), '', '',
                         '', '', IntToStr(nSpec_NR), '',
                         IntToStr(nSpec_NR), '', '1', '', '', '', '');
      if nSmPsb <> 0 then
        // Добавить в Z_NU запись по виду '6602' - почт.сбор
        AddRecToTblSvRes(nTabN, dZaMesGod, dZaMesGod,
                         0, -RoundTo(nSmPsb, -2), '6612', '', '',
                         IntToStr(n_KdSps),  IntToStr(n_KdTemu),
                         IntToStr(n_KdObj), IntToStr(n_KdKatP),
                         IntToStr(n_KdSpZ), IntToStr(nPdn), cNomDoc,
                         '', IntToStr(nPrPv), '', '',
                         '', '', IntToStr(nSpec_NR), '',
                         IntToStr(nSpec_NR), '', '1', '', '', '', '');
      // IntToStr(nSpec_NR) записываю в поле tblSvResNrVdPv, чтобы не
      // объединились записи нескольких переводов (если случится)
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.CalcAlimony(TabN: Integer; MnthYear: TDateTime);
var
  SpecNr, KdSps, KdObj, KdKatP, KdSpZ, DumInt: Integer;
  SmForAlim, SmForPostFee, SmAlim, SmPostFee, DumDbl: Double;
  KdPst, DumSInt: SmallInt;
  NomDoc: ShortString;
  DumStr: String; DumStr1: String1; DumDt: TDateTime; DumBool: Boolean;
  MnthSpan, AlimSpan: TPeriod;
  AlimSpanCoeff: Double;
const
  Alimony = '6601';
begin
  SpecNr := 0;

  with DateUtils do
    MnthSpan := InitPeriod(MnthYear, EndOfMonth(MnthYear));

  with CdsAlim do begin
    if Active then Close;
    IndexName := '';
    IndexDefs.Clear;
    CreateDataSet;
    Open;
  end;

  LocalGetPereInf(TabN, MnthYear, KdSps, KdObj, KdKatP, DumInt, DumInt, DumInt,
    KdSpZ, nPrcWT, DumDbl, DumDbl, DumStr1, DumStr, DumStr, DumDt,
    DumBool, DumBool, DumBool, DumSInt
  );

  // в TblSvRes уже собраны все записи, которые будут сохранены
  // с DtProc = d_DtCtrl. Поэтому в ней можно собрать суммы, необходимые для
  // корректного расчета алиментов и, если нужно, почтового сбора

  with tblSvRes do begin
    DisableControls;
    First;

    SmForAlim := 0;

    while not Eof do begin
      if (FieldByName('SAlim').AsString = '1') then
        SmForAlim  := SmForAlim + FieldByName('Summa').AsFloat;

      Next;
    end;

    EnableControls;
  end;

  with QryUdrg do begin
    First;

    while not Eof do begin
      if (FieldByName('VidN').AsString = Alimony) then begin
        with DateUtils do begin
          AlimSpan := InitPeriod(
            FieldByName('Dt_Beg').AsDateTime, FieldByName('Dt_End').AsDateTime
          );

          AlimSpan := IntersectPeriods(MnthSpan, AlimSpan);
          AlimSpanCoeff := RoundTo(
            DaysCount(AlimSpan) / DaysCount(MnthSpan), -4
          );
        end;

        if AlimSpanCoeff > 0 then begin
          SpecNr := FieldByName('Spec_NR').AsInteger;
          NomDoc := FieldByName('NomDok').AsString;
          KdPst := FieldByName('KdPst').AsInteger;

          if (FieldByName('SpsRsch').AsInteger = 1)
            or (FieldByName('SpsRsch').AsInteger = 3)
          then
            SmAlim := RoundTo(SmForAlim * FieldByName('SumVzn').AsFloat *
              AlimSpanCoeff / 100, -2)
          else
            SmAlim := RoundTo(
              FieldByName('SumVzn').AsFloat * AlimSpanCoeff, -2);

          with CdsAlim do begin
            if not Locate(
              'Spec_NR;NomDoc', VarArrayOf([SpecNr, NomDoc]), []) then
            begin
              Append;
              FieldByName('Spec_NR').AsInteger := SpecNr;
              FieldByName('NomDoc').AsString := NomDoc;
              FieldByName('KdPst').AsInteger := KdPst;
            end else
              Edit;

            FieldByName('SmAlim').AsFloat :=
              FieldByName('SmAlim').AsFloat + SmAlim;

            Post;
          end;
        end;
      end;

      Next;
    end;
  end;

  with cdsAlim do begin
    AddIndex('OnNomDoc', 'NomDoc', [ixCaseInsensitive]);
    IndexName := 'OnNomDoc';
    First;

    while not Eof do begin
      NomDoc := FieldByName('NomDoc').AsString;
      SmForPostFee := 0;
      KdPst := FieldByName('KdPst').AsInteger;

      while (FieldByName('NomDoc').AsString = NomDoc) and not Eof do begin
        SpecNr := FieldByName('Spec_NR').AsInteger;
        SmAlim := FieldByName('SmAlim').AsFloat;
        SmForPostFee := SmForPostFee + SmAlim;

        // Добавить в tblSvRes запись по виду '6601' - алименты
        // n_KdSpz запишется из перемещений (выдаст LocalGetPereInf)
        AddRecToTblSvRes(TabN, MnthYear, MnthYear,
          0, -RoundTo(SmAlim, -2), '6601', '', '',
          IntToStr(KdSps), '0',
          IntToStr(KdObj), IntToStr(KdKatP),
          IntToStr(KdSpZ), '1', NomDoc, '', '3', '', '',
          '', '', IntToStr(SpecNr), '', '', '', '1', '', '', '', ''
        );

        Next;
      end;

      SmPostFee := GetSmPsbAlim(KdPst, MnthYear, SmForPostFee);

      if SmPostFee <> 0 then
        // Добавить в Z_NU запись по виду '6602' - почт.сбор
        AddRecToTblSvRes(TabN, MnthYear, MnthYear,
          0, -RoundTo(SmPostFee, -2), '6602', '', '',
          IntToStr(KdSps), '0',
          IntToStr(KdObj), IntToStr(KdKatP),
          IntToStr(KdSpZ), '1', NomDoc, '', '3', '', '',
          '', '', IntToStr(SpecNr), '', '', '', '1', '', '', '', ''
        );
    end;
  end;
end;

//------------------------------------------------------------------------------
function TFormRs5.GetSmPsbAlim(nKdPst : SmallInt; dZaMG : TDateTime;
                                                  nSmForPsb : double) : double;
var bShkala : boolean; dDtBegShkala : TDateTime;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Pst_Psb ' +
            ' where KdPst = :nKdPst and dtBeg <= :dZaMG ' +
            ' order by DtBeg desc');
    ParamByName('nKdPst').AsInteger := nKdPst;
    ParamByName('dZaMG').AsDateTime := dZaMG;
    Open;
    // если в поле Shkala стоит 1, то ответ нужно искать в таблице z_Pst_Shk
    // иначе процент прописан прямо в z_Pst_Psb в поле PrcPsb
    if RecordCount > 0 then begin
      bShkala := FieldByName('Shkala').AsInteger > 0;
      if not bShkala then
        // почтовый сбор платится за счет сотрудника дополнительно к nSmForPsb
        Result := RoundTo(nSmForPsb * FieldByName('PrcPsb').AsFloat / 100, -2)

      else begin
        dDtBegShkala := FieldByName('DtBeg').AsDateTime;
        Close;
        SQL.Clear;
        SQL.Add('Select * from Z_Pst_Shk where KdPst = :nKdPst and ' +
                ' DtBeg = :dDtBeg order by SmFrom desc');
        ParamByName('nKdPst').AsInteger := nKdPst;
        ParamByName('dDtBeg').AsDateTime := dDtBegShkala;
        Open;
        while not Eof do begin
          if (nSmForPsb >= FieldByName('SmFrom').AsFloat) then begin
            Result := FieldByName('SmConst').AsFloat;
            if FieldByName('Prc').AsFloat <> 0 then
              Result := Result +
                        (nSmForPsb - FieldByName('OnSmBolee').AsFloat) *
                                          FieldByName('Prc').AsFloat / 100;
            Break;
          end;
          Next;
        end;
      end;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.GetSmPsbPvd(nKdPst : SmallInt; dZaMG : TDateTime;
                                                      nSmPvd : double): double;
var bShkala : boolean; n_SmPvd : double; dDtBegShkala : TDateTime;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_Pst_Psb ' +
            ' where KdPst = :nKdPst and dtBeg <= :dZaMG ' +
            ' order by DtBeg desc');
    ParamByName('nKdPst').AsInteger := nKdPst;
    ParamByName('dZaMG').AsDateTime := dZaMG;
    Open;
    // если в поле Shkala стоит 1, то ответ нужно искать в таблице z_Pst_Shk
    // иначе процент прописан прямо в z_Pst_Psb в поле PrcPsb
    if RecordCount > 0 then begin
      bShkala := FieldByName('Shkala').AsInteger > 0;
      if not bShkala then
        // почтовый сбор платится из суммы nSmPvd
        Result := RoundTo(nSmPvd * FieldByName('PrcPsb').AsFloat /
                           (100 + FieldByName('PrcPsb').AsFloat), -2)
      else begin
        dDtBegShkala := FieldByName('DtBeg').AsDateTime;
        Close;
        SQL.Clear;
        SQL.Add('Select * from Z_Pst_Shk where KdPst = :nKdPst and ' +
                ' DtBeg = :dDtBeg order by SmFrom desc');
        ParamByName('nKdPst').AsInteger := nKdPst;
        ParamByName('dDtBeg').AsDateTime := dDtBegShkala;
        Open;
        while not Eof do begin
          if (nSmPvd >= FieldByName('SmFrom').AsFloat) then begin
            n_SmPvd := nSmPvd - FieldByName('SmConst').AsFloat;
            Result := FieldByName('SmConst').AsFloat +
                         RoundTo(n_SmPvd * FieldByName('Prc').AsFloat /
                                   (100 + FieldByName('Prc').AsFloat), -2);
            Break;
          end;
          Next;
        end;
      end;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.SaveSchetResults(nTabN : integer; dRMes : TDateTime);
var mOtklZaMG, mZaMgForSpecPS : TStringList;
    dZaMG, dDt_Beg, dDt_End : TDateTime;
    i, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ,
    nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR, nSpecPS : integer;
    cMsg, cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg, cKdBnk : string;
    nRecChas, nRecSumma, nChas, nSumma : double;
    bVidOtpBlnCurMes, bIsInv, bVidBudg{вид бюджетный}, bMore : boolean;
    bSvTblNuFiltered : boolean;
    nPLg : SmallInt;
    Sovm, Storn: ShortString;
begin
  bSvTblNuFiltered := tblNU.Filtered;
  tblNu.Filtered := false;
  tblSvRes.Filtered := false;
  if tblSvRes.RecordCount <= 0 then with qryTmp do begin
    if Active then Close;           // Только удалить все начисления и выйти
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from Z_NU where ' +
              ' (TabN = :nTabN) and (DtProc = :dRMes) ');
    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('dRMes').AsDateTime := dRMes;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
    Exit;                     // Удалили и выходим
  end;

  Form_Dm.DbMain.StartTransaction;
  mOtklZaMG := TStringList.Create;
  mZaMgForSpecPS := TStringList.Create;
  TRY
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Delete from Z_NU where ' +
              ' (TabN = :nTabN) and (DtProc = :d_DtCtrl) ');
      ParamByName('nTabN').AsInteger  := nTabN;
      ParamByName('d_DtCtrl').AsDateTime := d_DtCtrl;
      ExecSQL;
    end;

    if bFlagDbg then
      Application.ProcessMessages;

    with tblSvRes do begin
      Filtered := false;
      IndexName := 'ZaMGVidN';
      First;
      while not Eof do begin
        if bFlagDbg then
          Application.ProcessMessages;

        cVidN     := tblSvResVidN.AsString;
        bVidBudg  := tblSvResCBudg.AsString = '1';
        dZaMG     := tblSvResZaMesGod.AsDateTime;
        dDt_Beg   := tblSvResDt_Beg.AsDateTime;
        dDt_End   := tblSvResDt_End.AsDateTime;
        n_KdSps   := tblSvResKdSps.AsInteger;
        n_KdTemu  := tblSvResKdTemu.AsInteger;
        n_KdObj   := tblSvResKdObj.AsInteger;
        n_KdKatP  := tblSvResKdKatP.AsInteger;
        n_KdSpZ   := tblSvResKdSpZ.AsInteger;
        nPdn      := tblSvResPdN.AsInteger;
        nPrPv     := tblSvResPrPv.AsInteger;
        nPRR      := tblSvResPRR.AsInteger;
        nKto      := tblSvResKto.AsInteger;
        nPrKr     := tblSvResPrKr.AsInteger;
        cDtVdPV   := tblSvResDtVdPV.AsString;
        cNrVdPV   := tblSvResNrVdPV.AsString;
        cOznPilg  := tblSvResOzn_Pilg.AsString;
        cKdBnk    := tblSvResKdBnk.AsString;
        nChas     := 0;
        nSumma    := 0;
        nSpec_NR  := tblSvResSpec_NR.AsInteger;
        Sovm      := tblSvResSovm.AsString;
        Storn     := tblSvResStorn.AsString;

        bMore     := true;

        while not Eof and bMore
            and (tblSvResVidN.AsString = cVidN)
            and (tblSvResDtVdPV.AsString = cDtVdPV)
            and (tblSvResNrVdPV.AsString = cNrVdPV)
            and (tblSvResZaMesGod.AsDateTime = dZaMG)
            and (tblSvResKdSps.AsInteger = n_KdSps)
            and (tblSvResKdTemu.AsInteger = n_KdTemu)
            and (tblSvResKdObj.AsInteger = n_KdObj)
            and (tblSvResKdKatP.AsInteger = n_KdKatP)
            and (tblSvResKdSpZ.AsInteger = n_KdSpZ)
            and (tblSvResPdN.AsInteger = nPdn)
            // and (tblSvResPrPv.AsInteger = nPrPv)
            // and (tblSvResPRR.AsInteger = nPRR)
            and (tblSvResKto.AsInteger = nKto)
            and (tblSvResPrKr.AsInteger = nPrKr)
            // без условия (nSpec_NR) одноВидные удержания сливаются.
            // Например, алименты разным тёткам
            and (tblSvResSpec_NR.AsInteger = nSpec_NR)
            and (tblSvResSovm.AsString = Sovm)
            and (tblSvResStorn.AsString = Storn) do
        begin
          nRecChas := RoundTo(tblSvResChas.AsFloat, -2);
          nRecSumma := RoundTo(tblSvResSumma.AsFloat, -2);

          bVidOtpBlnCurMes := (tblSvResZaMesGod.AsDateTime = dDtProc)
            and ((cVidN >= '2400') and (cVidN < '2500')
              or (cVidN >= '2600') and (cVidN < '2700'));

          if bVidOtpBlnCurMes and (nRecSumma = 0) then
            cNotes := 'только часы!'
          else begin
            nChas    := nChas + nRecChas;
            nSumma   := nSumma + nRecSumma;
            cNotes   := tblSvResNotes.AsString;
            cMyNotes := tblSvResMyNotes.AsString;
            nSpec_NR := tblSvResSpec_NR.AsInteger;
          end;

          if ((cVidN = '5002') or (cVidN = '5005') or (cVidN = '5008')) and
              (tblSvResDtProc.AsDateTime = d_DtCtrl) then
            bMore := false;

          if bVidBudg
              // для НеПрошлых месяцев
              and (dZaMG >= d_DtCtrl)
              and ((cVidN < '2600')
                or ((cVidN > '5000') and (cVidN <'7500'))) then
            bMore := false

          else if bVidBudg
              // Чтобы больничные виды не объединялись, а записывались
              // по-одному (в т.ч. и прошлых месяцев)
              and (cVidN > '2600') and (cVidN < '5000')
              // декретные
              and (cVidN <> '2602')  then

            bMore := false

          else if (cVidN = '1614') then
            bMore := false;

          Next;
        end;

        nSumma := RoundTo(nSumma, -2);
        if Abs(nSumma) < 0.01 then
          nSumma := 0;

        if (dZaMG < d_DtCtrl) and (nSumma <> 0)
            or (dZaMG >= d_DtCtrl)
              and ((nChas <> 0) or (nSumma <> 0) or bVidBudg)
            or (cVidN = '5002') or (cVidN = '5005')
            // добавил 17.12.2024. Марина. Таб.№ 12448 за сентябрь 2024
            // Вид 5003 не попал в начисления/удержания, потому что был за
            // прошлый месяц <<
            or (cVidN = '5003') or (cVidN = '5004') or (cVidN = '5006')
            // >>
            or (cVidN = '5008') or (cVidN = '5011') or (cVidN = '5012')
        then begin
          if nPrr = 0 then begin
              bIsInv := IsInvalid(nTabN, dZaMG);
              if bIsInv then
                nPRR := 7;
          end;

          AddRecInZ_Nu(d_DtCtrl, dZaMG, dDt_Beg, dDt_End, nChas, nSumma,
            nTabN, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ,
            nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR,
            cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg, cKdBnk,
            Sovm, Storn);
        end;
      end;
    end;

    if qryZNu.UpdatesPending then
      qryZNu.ApplyUpdates;
    qryZNu.Close;
    Form_Dm.DbMain.Commit;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Update Z_SPS Set NCH = "X" ' +
              ' where DtProc = :d_DtCtrl and TabN = :nTabN');
      ParamByName('d_DtCtrl').AsDateTime := d_DtCtrl;
      ParamByName('nTabN').AsInteger := nTabN;
      ExecSQL;
      SQL.Clear;
      if c_OznPilg > '' then begin
        SQL.Add('Update Z_NU set Ozn_Pilg = :c_OznPilg ' +
                ' where TabN = :nTabN and DtProc = :d_DtCtrl');
        ParamByName('d_DtCtrl').AsDateTime := d_DtCtrl;
        ParamByName('nTabN').AsInteger := nTabN;
        ParamByName('c_OznPilg').AsString := c_OznPilg;
        ExecSQL;
      end;
      SQL.Clear;
      DataBaseName := '';
    end;
    tblSvRes.Close;
    tblNU.Close;
  EXCEPT
    Form_Dm.DbMain.Rollback;
    RAISE;
  END;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.AddRecInZ_Nu(dRMes, dZaMG, dDt_Beg, dDt_End : TDateTime;
  nChas, nSumma : double;
  nTabN, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ,
  nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR : integer;
  cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV,
  cOznPilg, cKdBnk, Sovm, Storn: ShortString);
begin
  with qryZNu do begin
    if not Active then begin
      DataBaseName := CESMAIN;
      Open;
    end;
    Append;
    qryZNuTabN.AsInteger      := nTabN;
    qryZNuDtProc.AsDateTime   := dRMes;
    qryZNuZaMesGod.AsDateTime := dZaMG;
    qryZNuVidN.AsString       := cVidN;
    if nChas <> 0 then
      qryZNuChas.AsFloat      := nChas;
    if nSumma <> 0 then
      qryZNuSumma.AsFloat     := nSumma;
    if dDt_Beg <> 0 then
      qryZNuDt_Beg.AsDateTime := dDt_Beg;
    if dDt_Beg <> 0 then
      qryZNuDt_End.AsDateTime := dDt_End;
    qryZNuKdSps.AsInteger     := n_KdSps;
    qryZNuKdTemu.AsInteger    := n_KdTemu;
    qryZNuKdObj.AsInteger     := n_KdObj;
    qryZNuKdKatP.AsInteger    := n_KdKatP;
    qryZNuKdSpZ.AsInteger     := n_KdSpZ;
    qryZNuPdN.AsInteger       := nPdN;
    if nPRR <> 0 then
      qryZNuPRR.AsInteger     := nPRR;
    if nPrPv <> 0 then
      qryZNuPrPv.AsInteger    := nPrPv;
    if nKto <> 0 then
      qryZNuKto.AsInteger     := nKto;
    if nPrKr <> 0 then
      qryZNuPrKr.AsInteger    := nPrKr;
    if nSpec_NR <> 0 then
      qryZNuSpec_NR.AsInteger := nSpec_NR;
    qryZNuNotes.AsString      := cNotes;
    qryZNuMyNotes.AsString    := cMyNotes;
    qryZNuDtVdPV.AsString     := cDtVdPV;
    qryZNuNrVdPV.AsString     := cNrVdPV;
    qryZNuOzn_Pilg.AsString   := cOznPilg;
    qryZNuKdBnk.AsString      := cKdBnk;
    qryZNuSovm.AsString       := Sovm;
    qryZNuStorn.AsString      := Storn;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.CreOpenWrkTables(nTabN : integer);
var cSuff : string;  bIsDirTemp : boolean;
begin
  bIsDirTemp := DirectoryExists(cDirTemp);
  if not bIsDirTemp then
    ForceDirectories(cDirTemp);

  cSuff :=  '_' +  IntToStr(DateUtils.MillisecOfThisHour);
  while Length(cSuff) < 9 do
    cSuff := '0' + cSuff;
  cSuff := Copy(cSuff, 5, 5);
  cNmTblPeriodu := 'x_Prd' + cSuff;
  cNmTblNU := 'N' + IntToStr(nDbgCycle) + '_Nu' + cSuff;
  cNmtblMd := 'D' + IntToStr(nDbgCycle) + '_Prm' + cSuff;
  cNmTblSvRes   := 'x_SvR' + cSuff;
  // tblPeriodu создается и заполняется перед расчетом, в нее собираются расчет-
  // ные периоды-месяцы, которые засветились в Z_OTKL текущего месяца (d_DtCtrl)
  // tblSvRes создается один раз перед расчетом для сбора по-периодно резуль-
  //                                                     татов месячных расчетов
  // Таблица tblMd (перемещений) - создается один раз на все периоды, а дни
  // периодов заполняются при начале счета каждого периода
  // tblNU - создается заново для каждого периода BatchMov'ом из Z_NU
//  PanelNmTblNu.Caption := 'Имя файла таблицы tblNU: ' + cNmTblNU +
//                          ', tblSvRes: ' + cNmTblSvRes;
  PanelNmTblNu.Caption := 'Имя файла таблицы tblMD: ' + cNmTblMD +
                          ', tblSvRes: ' + cNmTblSvRes;
  CreOpenTblPeriodu(nTabN, cNmTblPeriodu);
  with tblSvRes do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    TableName := cNmTblSvRes;
    TableType := ttParadox;
    if Exists then DeleteTable;
    IndexDefs.Clear;
    IndexName := '';
    CreateTable;
    AddIndex('', 'NR', [ixPrimary]);
    AddIndex('ZaMGVidN', 'ZaMesGod;VidN;KdSps;KdObj;KdKatP;KdSpZ;PdN;Spec_NR',
                                                      [ixCaseInsensitive]);
    Open;
    IndexName := 'ZaMGVidN';
  end;
  with tblMd do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    TableName := cNmTblMd;
    TableType := ttParadox;
    if Exists then DeleteTable;
    IndexDefs.Clear;
    IndexName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.CreOpenTblPeriodu(nTabN : integer; cNmTblPeriodu : string);
var dOtklDtPrc, dOtklDtZaMG, dTmpMes : TDateTime; cVidN : ShortString;
    nY, nM, nD : word;
begin
//  if not DirectoryExists(cDirTemp) then
//    ForceDirectories(cDirTemp);


  with tblPeriodu do begin
    Active := False;
    DatabaseName := cDirTemp;
    TableType := ttParadox;
    TableName := cNmTblPeriodu;
    if Exists then DeleteTable;
    IndexDefs.Clear;
    IndexName := '';
    CreateTable;
    AddIndex('', 'NR', [ixPrimary]);
    AddIndex('OnZaMG', 'ZaMesGod', [ixCaseInsensitive]);
    Open;
    IndexName := 'OnZaMG';
    Append;    // Текущий месяц рассчитываем и пересчитываем во всех случаях,
    FieldByName('DtProc').AsDateTime     := d_DtCtrl; // поэтому его добавляю
    FieldByName('ZaMesGod').AsDateTime   := d_DtCtrl; // безоговорочно
    FieldByName('RequiredPS').AsBoolean  := TRUE;  {нужен расчет}
    Post;
  end;
//  if nTabN <> 7384 then with qryTmp do begin
// Сначала выяснить, нет ли начислений по списку 6 начиная с месяца dMesPeremen
// Если окажется, что есть - отказаться от перерасчетов прошлых месяцев
// Можно на будущие мсяцы ввести второй dMesPeremen специально для НИЧ
//   (Подумать, какой это может быть месяц. Наверное декабрь 2007)
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
{
    SQL.Add('Select distinct DtProc, ZaMesGod, DtStorn, VidN, PrKr ' +
            ' from z_Otkl where (TabN = :nTabN) and ' +
            ' (DtProc = :d_DtCtrl or DtStorn = :d_DtCtrl) ' +
            // про DtStorn добавил 21-11-2015 и заремился 01-02-2016
            ' order by ZaMesGod, PrKr Desc ');
}

    // Issue 20220824
    { Commented by SB
    SQL.Add('Select distinct DtProc, ZaMesGod, DtStorn, VidN, PrKr ' +
            ' from z_Otkl where (TabN = :nTabN) and ' +
            ' (DtProc = :d_DtCtrl and ZaMesGod <= :d_DtCtrl) ' +
            // про DtStorn добавил 21-11-2015 и убрал 01-02-2016
            // и вернул назад 23-04-2019
            ' order by ZaMesGod, PrKr Desc ');
    }
    // Added by SB
    SQL.Add(
      'select distinct DtProc, ZaMesGod, DtStorn, VidN, PrKr ' +
      'from z_Otkl where TabN = :nTabN and ' +

        // Issue 230612
        // Изменено, т.к. не пересчитывались будущие месяцы.
        // '(DtProc = :d_DtCtrl and ZaMesGod <= :d_DtCtrl or DtStorn = :d_DtCtrl) ' +
        '(DtProc = :d_DtCtrl or DtStorn = :d_DtCtrl) ' +

      'order by ZaMesGod, PrKr Desc');

    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('d_DtCtrl').AsDateTime := d_DtCtrl;
    Open;

    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      dOtklDtPrc := FieldByName('DtProc').AsDateTime;
      dOtklDtZaMG := myFirstDOM(FieldByName('ZaMesGod').AsDateTime);
      if cVidN = '8802' then begin // внести периоды с dOtklDtZaMG до d_SvDtMes
        dTmpMes := dOtklDtZaMG;
        while dTmpMes < dOtklDtPrc do begin
          if (dTmpMes >= dMesPeremen) and
                     not tblPeriodu.Locate('ZaMesGod', dTmpMes, []) then
            AddInPeriodu(dOtklDtPrc, dTmpMes, FieldByName('PrKr').AsInteger,
                                                          0, 0, 0, 0, 0, 0, 0);
          DecodeDate(dTmpMes, nY, nM, nD);
          nM := nM + 1;
          if nM > 12 then begin
            nM := 1;
            nY := nY + 1;
          end;
          dTmpMes := EncodeDate(nY, nM, 1);
        end; end

      else if (FieldByName('DtStorn').AsDateTime = d_DtCtrl) then
        // Этот случай добавился с 21-11-2015 и заремил 01-02-2016 и
        // вернул взад 23-04-2019 и вновь заремили 25-07-2019
        AddInPeriodu(d_DtCtrl, dOtklDtZaMG, FieldByName('PrKr').AsInteger,
                                                        0, 0, 0, 0, 0, 0, 0)
      else if (dOtklDtZaMG >= dMesPeremen)
          // Issue 230612
          // Закомментировано, т.к. не пересчитывались будущие периоды
          // and (dOtklDtZaMG <= dOtklDtPrc)
          and not tblPeriodu.Locate('ZaMesGod', dOtklDtZaMG, []) then
        AddInPeriodu(dOtklDtPrc, dOtklDtZaMG, FieldByName('PrKr').AsInteger,
                                                         0, 0, 0, 0, 0, 0, 0);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  LbxPeriodu.Clear;         // В LbxPeriodu параллельно собираю рассчитываемые
  with tblPeriodu do begin  // периоды для использования в CreOpenOldNU
    First;
    while not Eof do begin
      LbxPeriodu.Items.Add(FieldByName('ZaMesGod').AsString);
      Next;
    end;
    First;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.AddInPeriodu(
  dDtProc, dZaMesGod: TDateTime;
  nPrKr, nNSpecPS, nNuCntFakt, nNuCntInPS, nOtklCntFakt, nOtklCntInPS: integer;
  nNuAvgSpecPS, nOtklAvgSpecPS: double);
begin
  if (dDtProc <> dZaMesGod) then with tblPeriodu do begin
    if not Locate('ZaMesGod', dZaMesGod, []) then begin
      Append;

      FieldByName('DtProc').AsDateTime := dDtProc;
      if dZaMesGod > dDtProc then begin
        if nPrKr > 0 then begin
          FieldByName('AllBM').AsBoolean := TRUE;
          FieldByName('Note').AsString := 'БМ полный рсч.'; end
        else begin
          FieldByName('AllBM').AsBoolean := FALSE;
          FieldByName('Note').AsString := 'БМ только откл.';
        end;
      end;

      FieldByName('ZaMesGod').AsDateTime   := dZaMesGod;
      FieldByName('NSpecPS').AsInteger     := nNSpecPS;
      FieldByName('NuCntFakt').AsInteger   := nNuCntFakt;
      FieldByName('NuCntInPS').AsInteger   := nNuCntInPS;
      FieldByName('OtklCntFakt').AsInteger := nOtklCntFakt;
      FieldByName('OtklCntInPS').AsInteger := nOtklCntInPS;
      FieldByName('NuAvgSpecPS').AsFloat   := nNuAvgSpecPS;
      FieldByName('OtklAvgSpecPS').AsFloat := nOtklAvgSpecPS;
      FieldByName('RequiredPS').AsBoolean  := TRUE;

      Post;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.DelTmpTables;
begin
  with tblMd do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
  end;

  with tblPeriodu do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
  end;
  with tblNU do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists {and not bFlagDbg} then DeleteTable;
  end;

  with tblSvRes do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists {and not bFlagDbg} then DeleteTable;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.OpenMesQueries(nTabN : integer; dRMes : TDateTime);
var dDtEndRMes : TDateTime;
begin
  dDtEndRMes := myLastDOM(dRMes);
  with qryPrcEsv do begin  // таблица удержаний ЕСВ с сотрудников
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_TEsv order by DtBeg desc');
    Open;
  end;
  with qryPrcEsvPrp do begin  // таблица взносов ЕСВ с предприятия
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_TEsvP order by DtBeg desc');
    Open;
  end;
  with qryTPdn do begin  // таблица удержаний с сотрудников (комбинированная)
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_TPdn order by DtBeg desc');
    Open;
  end;
  with qryTblPrp do begin  // таблица удержаний с предприятия
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_TblPrp order by DtBeg desc');
    Open;
  end;
  with qryPrmUv do begin
    Close;
    DataBaseName := CESMAIN;
    // Т.к. может понадобиться за различные периоды для определения "уволен-
    // ности" для соцЛьготы, открываю ВСЕ записи с запросом
    // Select * from Z_PrmUv where (TabN = :nTabN) order by Dt_Priem desc
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
  with qryPere do begin
    Close;
    DataBaseName := CESMAIN;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
  with qryNadb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_ViNadb where (TabN = :nTabN) and ' +
            ' not VidN in ("1601", "1614") and '  +
            ' (Dt_Beg <= :dDtEndMes)  and ' +
            ' ((Dt_End is NULL) or (Dt_End >= :dRMes)) ' +
            ' order by Dt_Beg desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtEndMes').AsDateTime := dDtEndRMes;
    ParamByName('dRMes').AsDateTime := dRMes;
    Open;
  end;

  with qryUdrg do begin
    DataBaseName := CESMAIN;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmPfMax(dAnyDate : TDateTime; var nSmPfMax : double);
var nCntRec, i : integer;
begin
  nSmPfMax := 0;
  i := 0;
  with qryTPdn do begin  // сортирована по DtBeg descending
    nCntRec := RecordCount;
    First;
    while not Eof do begin
      Inc(i);
      if (FieldByName('DtBeg').AsdateTime <= dAnyDate) or
             // если не оказалось нужной записи - беру данные из последней
                                                      (i = nCntRec) then begin
        nSmPfMax := FieldByName('Sm2660').AsFloat;    // Сумма Порога для ПФ
        Break;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.GetSmMinZp(dAnyDate : TDateTime) : double;
begin
  Result := 0;
  with qryTPdN do begin  // сортирована по DtBeg desc
    First;
    while not Eof do begin
      Result := FieldByName('MinZP2').AsFloat;
      if (FieldByName('DtBeg').AsdateTime <= dAnyDate) then
        Break;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.GetPrcWSb(dAnyDate: TDateTime): double;
var nCntRec, i : integer;
begin
  Result := 0;
  with qryTPdn do begin  // сортирована по DtBeg descending
    nCntRec := RecordCount;                    //----------
    First;
    i := 0;
    while not Eof do begin
      Inc(i);
      if (FieldByName('DtBeg').AsdateTime <= dAnyDate) or
             // если не оказалось нужной записи - беру данные из последней
                                                      (i = nCntRec) then begin
        Result := FieldByName('PrcWSb').AsFloat;    // % ВСбора
        Break;
      end;
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TFormRs5.LocateTaxInfo(OnDate: TDateTime): TDataSet;
begin
  // сортирована по DtBeg descending
  with QryTPdn do begin
    First;

    while not Eof and (FieldByName('DtBeg').AsDateTime > OnDate) do
      Next;
  end;
  
  Result := QryTPdn;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.GetPdnInfo(dAnyDate : TDateTime;
                        var nPrcPdn, nPrcPdn2,
                            nMinZpNG, nMinZpCM, nProgMinNG, nProgMinCM,
                                nPrgLg, nProcLg, nSm2660,
                                    nSmLg100, nSmLg150, nSmLg200 : double);
begin
  nPrcPdn    := 0;
  nPrcPdn2   := 0;
  nMinZpNG   := 0;
  nMinZpCM   := 0;
  nProgMinNG := 0;
  nProgMinCM := 0;
  nPrgLg     := 0;
  nProcLg    := 0;
  nSm2660    := 0;
  nSmLg100   := 0;
  nSmLg150   := 0;
  nSmLg200   := 0;
  with qryTPdn do begin  // сортирована по DtBeg descending
    First;
    while not Eof do begin
      nPrcPdn    := FieldByName('PrcPdn').AsFloat;
      nPrcPdn2   := FieldByName('PrcPdn2').AsFloat;
      nMinZpNG   := FieldByName('MinZp').AsFloat;     // на начало года
      nMinZpCM   := FieldByName('MinZp2').AsFloat;    // для текущего месяца
      nProgMinNG := FieldByName('ProgMin').AsFloat;   // на начало года
      nProgMinCM := FieldByName('ProgMin2').AsFloat;  // для текущего месяца
      nPrgLg     := FieldByName('PorogLg').AsFloat;
      nProcLg    := FieldByName('ProcLg').AsFloat;
      nSm2660    := FieldByName('Sm2660').AsFloat;    // Сумма Порога для ПФ
      nSmLg100   := FieldByName('SmLg100').AsFloat;
      nSmLg150   := FieldByName('SmLg150').AsFloat;
      nSmLg200   := FieldByName('SmLg200').AsFloat;
      if FieldByName('DtBeg').AsdateTime <= dAnyDate then
        Break;
      Next;
    end;
  end;
  if (nPrcPdn2 < nPrcPdn) then
    nPrcPdn2 := nPrcPdn;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.Part01(nTabN : Integer; dRMes : TDateTime);
begin
  if not bFlagDbg then begin {при bFlagDbg это делается с кнопок}
    CreOpenOldNU(nTabN, dRMes);
    ObrOtkl(nTabN, dRMes);
  end;

  if dRMes <= d_DtCtrl then begin
  // Issue 230612
  // Условие добавлено, чтобы не рассчитывалась зарплата для будущих месяцев.
  // Например, 6447 Максименко: в июне 2023 дали отпускные за июль,
  // а ему попутно посчитало и июльскую зарплату со всеми надбавками.
    R_Default(nTabN, dRMes);
    if bFlagDbg then
      dbgrNu.Refresh;
    ObrNadbSpsb3(nTabN, dRMes);  // Расчитывается специфично
    if bFlagDbg then
      dbgrNu.Refresh;

    CalcDoMZ(dRMes);
  end;

  FillOksInPart01;  // Это в процессе Part01
  sBtnCheckOks.Click;
  if bFlagDbg then
    dbgrNu.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.FillOksInPart01;    // Это в процессе Part01
var cVidN, c_SchBU : ShortString;
    nSmNwForECmn, nSmNwForEBln, nSmNwForEDkr, nSmNwForEPps, nSmNwForEDgv,
       nSmNwForPdnCmn, nSmNwForPdnDgv, nSmForWSb, nSmNwForPrf, nNwSmm : double;
    dDtPrc, dZaMG : TDateTime;
    nStep, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ, nPRR : SmallInt;
begin
  nStep := 2;
  with tblNU do begin
    First;
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      if (cVidN < '5000') then begin
        dDtPrc   := FieldByName('DtProc').AsDateTime;
        dZaMG    := FieldByName('ZaMesGod').AsDateTime;
        n_KdSps  := FieldByName('KdSps').AsInteger;
        n_KdTemu := FieldByName('KdTemu').AsInteger;
        n_KdObj  := FieldByName('KdObj').AsInteger;
        n_KdKatP := FieldByName('KdKatP').AsInteger;
        n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
        nPRR     := FieldByName('PRR').AsInteger;
        nSmNwForECmn := 0;
        nSmNwForEBln := 0;
        nSmNwForEDkr := 0;
        nSmNwForEPps := 0;
        nSmNwForEDgv := 0;
        nSmNwForPdnCmn := 0;
        nSmNwForPdnDgv := 0;
        nSmForWSb      := 0;
        nSmNwForPrf    := 0;
        nNwSmm := FieldByName('Summa').AsFloat;
        if n_KdSpZ = 0 then
          n_KdSpZ := GetPereKdSpZ(dZaMG); // n_KdSpZ взять из местного qryPere
        if (FieldByName('SP_PF').AsString = '1') then begin
          if (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008') then
            nSmNwForEDgv := nNwSmm
          else if (cVidN = '2602') and (dDtPrc >= (dDt13_10_01 - 62)) then
            nSmNwForEDkr := nNwSmm                                {декретные}
          else if (cVidN > '2600') and (cVidN < '2700') then
            nSmNwForEBln := nNwSmm
          else if (n_KdKatP = 1) then
            nSmNwForEPps := nNwSmm
          else
            nSmNwForECmn := nNwSmm;
        end;
        if (FieldValues['SPrf'] = '1') then
          nSmNwForPrf := nNwSmm;
        if FieldValues['SPdn'] = '1' then begin
          if (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008') then
            nSmNwForPdnDgv := nNwSmm
          else
            nSmNwForPdnCmn := nNwSmm;
        end;
        if FieldValues['SWSb'] = '1' then
          nSmForWSb := nSmForWSb + nNwSmm;
        if (nSmNwForECmn <> 0) or (nSmNwForEPps <> 0) or (nSmNwForEBln <> 0) or
                (nSmNwForEDkr <> 0) or
                (nSmNwForEDgv <> 0) or (nSmNwForPrf <> 0) or
                       (nSmNwForPdnCmn <> 0) or (nSmNwForPdnDgv <> 0) or
                                              (nSmForWSb <> 0) then begin
          if cdsOKS.Locate('ZaMesGod;KdSps;KdTemu;KdObj;KdKatP;KdSpZ;PRR',
                            VarArrayOf([dZaMG, n_KdSps, n_KdTemu, n_KdObj,
                                             n_KdKatP, n_KdSpZ, nPRR]), []) then
            cdsOKS.Edit          // Это в процессе Part01
          else begin
            cdsOKS.Append;
            cdsOksStep.AsInteger  := nStep;
            cdsOksMetka.AsBoolean := true;
            cdsOKS.FieldByName('DtPrc').AsDateTime    := dDtPrc;
            cdsOKS.FieldByName('ZaMesGod').AsDateTime := dZaMG;
            cdsOKS.FieldByName('KdSps').AsInteger     := n_KdSps;
            cdsOKS.FieldByName('KdTemu').AsInteger    := n_KdTemu;
            cdsOKS.FieldByName('KdObj').AsInteger     := n_KdObj;
            cdsOKS.FieldByName('KdKatP').AsInteger    := n_KdKatP;
            cdsOKS.FieldByName('KdSPZ').AsInteger     := n_KdSpZ;
            cdsOKS.FieldByName('PRR').AsInteger       := nPRR;
            c_SchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
            cdsOKS.FieldByName('SchBU').AsString      := c_SchBU;
          end;
          // Тут пишу в ОКС в процессе Part01 перед Part02
          //===============================================
          cdsOKS.FieldByName('sNwCmn').AsFloat :=
                            cdsOKS.FieldByName('sNwCmn').AsFloat + nSmNwForECmn;
          cdsOKS.FieldByName('sNwPps').AsFloat :=
                            cdsOKS.FieldByName('sNwPps').AsFloat + nSmNwForEPps;
          cdsOKS.FieldByName('sNwBln').AsFloat :=
                            cdsOKS.FieldByName('sNwBln').AsFloat + nSmNwForEBln;
          cdsOKS.FieldByName('sNwDkr').AsFloat :=
                            cdsOKS.FieldByName('sNwDkr').AsFloat + nSmNwForEDkr;
          cdsOKS.FieldByName('sNwDgv').AsFloat :=
                            cdsOKS.FieldByName('sNwDgv').AsFloat + nSmNwForEDgv;

          cdsOKS.FieldByName('sNwPrf').AsFloat :=
                             cdsOKS.FieldByName('sNwPrf').AsFloat + nSmNwForPrf;
          cdsOKS.FieldByName('sNwPdnC').AsFloat :=
                         cdsOKS.FieldByName('sNwPdnC').AsFloat + nSmNwForPdnCmn;
          cdsOKS.FieldByName('sNwPdnD').AsFloat :=
                         cdsOKS.FieldByName('sNwPdnD').AsFloat + nSmNwForPdnDgv;
          cdsOKS.FieldByName('sNwWSb').AsFloat :=
                               cdsOKS.FieldByName('sNwWSb').AsFloat + nSmForWSb;
          cdsOKS.Post;
        end;
      end;
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.R_Default(nTabN : integer; dRMes :TDateTime);
var
  nChasR, nChasPrc, nChasToNU, nSummaR, nChasPU, nOklTrf,
  nCmbOklTrf, nCmbOklSmm, nPrcWrkTime: Double;
  nGrp, nSpecNR, nCntDay, nCntWorkDay, nDbgPereNR : integer;
  n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ,
  PartSalId, nCmbOklKdSPZ, nCmbOklKdObj, nSO, nPdNlg : Integer;
  dDtBegR, dDtEndR, dDtBegPU, dDtEndPU : TDateTime;
  bItIsOtp, bItIsBln, bIsNeopl, bRabotal, bIsBdgZan : boolean;
  nStep : SmallInt;
  bCmbOkl, bCdsCmbOklCreated, bIsOkl, bIsPU : boolean;
  bNextCmbOkl, bNextItIsOtp, bNextItIsBln, bNextIsNeopl,
  bNextRabotal, bNextIsBdgZan : boolean;
  nNextKdSps, nNextKdTemu, nNextKdObj, nNextKdKatP,
  nNextKdSpZ, nNextSO, nNextPdNlg :integer;
  nNextOklTrf, nNextPrcWrkTime : double;
  cSchBU : ShortString;
  FirstPartSal: Boolean;
begin
  nChasR   := 0;
  nChasPrc := 0;  // если PrcWrkTime < 1, часть времени, утерянная по %
  nSummaR  := 0;
  nChasPU  := 0;
  dDtBegR  := 0;
  dDtEndR  := 0;
  dDtBegPU := 0;
  dDtEndPU := 0;
  nStep    := 0;

  nGrp := 0; { SB }

  bCmbOkl := false;
  bCdsCmbOklCreated := false;
  with tblMd {таблица "Дни месяца"} do begin
    First;   //  в неё собирается Z_Pere по-денно
    bIsOkl := false;
    bIsPU  := false;

    while not Eof do begin
      if tblMdRMes.AsDateTime <> dRMes then begin
        Next; // Теперь такого не может быть !!!
        Continue;
      end;
      Inc(nStep);

      nSpecNR      := tblMdSpec_NR.AsInteger;
      bItIsOtp     := (tblMdIsOtp.AsInteger > 0);
      bItIsBln     := tblMdIsBln.AsBoolean;
      bIsNeopl     := tblMdIsNeOpl.AsBoolean;
      bRabotal     := tblMdRabotalPrp.AsBoolean;
      bIsBdgZan    := tblMdIsBdgZan.AsBoolean;
      n_KdSps      := tblMdKdSps.AsInteger;
      n_KdTemu     := tblMdKdTemu.AsInteger;
      n_KdKatP     := tblMdKdKatP.AsInteger;
      n_KdSpZ      := tblMdKdSpZ.AsInteger;
      n_KdObj      := tblMdKdObj.AsInteger;
      nSO          := tblMdSO.AsInteger;
      nPdNlg       := tblMdPdNlg.AsInteger;
      nOklTrf      := tblMdOklTrf.AsFloat;
      nPrcWrkTime  := tblMdPrcWrkTime.AsFloat;
      bCmbOkl := (not tblMdCmbOkl.IsNull and (tblMdCmbOkl.AsInteger = 1));

      if bCmbOkl then begin
        if not bCdsCmbOklCreated then begin
          CreOpenCdsCmbOkl(nSpecNR);
          bCdsCmbOklCreated := true;
        end;
      end;

      if bRabotal and not bIsBdgZan
          and not bItIsOtp and not bItIsBln and not bIsNeOpl
          and not tblMDIsInKmd.AsBoolean then begin

        if nStep = 1 then
          dDtBegR := tblMdDtMes.AsDateTime;
        dDtEndR := tblMdDtMes.AsDateTime;

        nChasR  := nChasR + tblMdCntWrkChs.AsFloat;
        nChasPrc := nChasPrc + tblMdCntWrkChs.AsFloat *
          (1 - tblMdPrcWrkTime.AsFloat);

        if bCmbOkl then begin
          cdsCmbOkl.First;
          
          while not cdsCmbOkl.Eof do begin
            nCmbOklTrf := cdsCmbOkl.FieldByName('OklTrf').AsFloat;
            nCmbOklSmm := nCmbOklTrf * tblMdCntWrkChs.AsFloat / n_WrkChasMes;
            cdsCmbOkl.Edit;
            if nStep = 1 then
              cdsCmbOkl.FieldByName('DtBeg').AsDateTime := dDtBegR;
            cdsCmbOkl.FieldByName('Summa').AsFloat :=
                    cdsCmbOkl.FieldByName('Summa').AsFloat + nCmbOklSmm;
            cdsCmbOkl.FieldByName('Chas').AsFloat :=
                    cdsCmbOkl.FieldByName('Chas').AsFloat +
                                      tblMdCntWrkChs.AsFloat;
            cdsCmbOkl.FieldByName('DtEnd').AsDateTime := dDtEndR;
            cdsCmbOkl.Post;
            cdsCmbOkl.Next;
          end; end
        else begin
          nSummaR := nSummaR + nOklTrf * tblMdCntWrkChs.AsFloat / n_WrkChasMes;
          bIsOkl := true;
        end; end
// DEBUG      else if not bItIsOtp and not bItIsBln and not bIsNeOpl then
        // begin
        // Не делаю ничего - неопл.виды переписываются в tblNU прямо из ObrOtkl
        //        tblMd.Edit;
        //        tblMdIsNeopl.AsString := 'T';
        //        tblMd.Post; end
      else if not bRabotal and not bItIsOtp and not bItIsBln then begin
        if nStep = 1 then
          dDtBegPU := tblMdDtMes.AsDateTime;
        dDtEndPU := tblMdDtMes.AsDateTime;
        nChasPU := nChasPU + tblMdCntWrkChs.AsFloat; // часы по приему/увольн.
        bIsPU  := true;     // есть приёмы/увольнения PrmUV
      end;
      Next;
      // Если прерывалась последовательность контролируемых параметров в
      // таблице tblMd или tblMd.EOF - закончить период, сделать запись
      // "по-умолчанию" в tblNU и начать новый период
      bNextItIsOtp    := bItIsOtp;
      bNextItIsBln    := bItIsBln;
      bNextRabotal    := bRabotal;
      bNextIsBdgZan   := bIsBdgZan;
      nNextKdSps      := n_KdSps;
      nNextKdTemu     := n_KdTemu;
      nNextKdObj      := n_KdObj;
      nNextKdKatP     := n_KdKatP;
      nNextKdSpZ      := n_KdSpZ;
      nNextSO         := nSO;
      nNextPdNlg      := nPdNlg;
      nNextOklTrf     := nOklTrf;
      nNextPrcWrkTime := nPrcWrkTime;
      bNextCmbOkl     := bCmbOkl;
      if not Eof then begin
        bNextItIsOtp    := (tblMdIsOtp.AsInteger > 0);
        bNextItIsBln    := tblMdIsBln.AsBoolean;
        bNextIsNeopl    := tblMdIsNeOpl.AsBoolean;
        bNextRabotal    := tblMdRabotalPrp.AsBoolean;
        bNextIsBdgZan   := tblMdIsBdgZan.AsBoolean;
        nNextKdSps      := tblMdKdSps.AsInteger;
        nNextKdTemu     := tblMdKdTemu.AsInteger;
        nNextKdObj      := tblMdKdObj.AsInteger;
        nNextKdKatP     := tblMdKdKatP.AsInteger;
        nNextKdSpZ      := tblMdKdSpZ.AsInteger;
        nNextSO         := tblMdSO.AsInteger;
        nNextPdNlg      := tblMdPdNlg.AsInteger;
        nNextOklTrf     := tblMdOklTrf.AsFloat;
        nNextPrcWrkTime := tblMdPrcWrkTime.AsFloat;
        bNextCmbOkl     := (not tblMdCmbOkl.IsNull and
                                     (tblMdCmbOkl.AsInteger = 1));
      end;
      if Eof or (bCmbOkl <> bNextCmbOkl) or (bItIsOtp <> bNextItIsOtp) or
                (bItIsBln <> bNextItIsBln) or  (bIsNeOpl <> bNextIsNeOpl) or
                (bRabotal <> bNextRabotal) or (bIsBdgZan <> bNextIsBdgZan) or
                (n_KdTemu <> nNextKdTemu) or
                (n_KdObj <> nNextKdObj) or (n_KdKatP <> nNextKdKatP) or
                (n_KdSpZ <> nNextKdSpZ) or (nSO <> nNextSO) or
                (nOklTrf <> nNextOklTrf) or
                (nPrcWrkTime <> nNextPrcWrkTime) then begin
        nDbgPereNR := tblMdNR.AsInteger;

        if bCdsCmbOklCreated then begin  // выгружаю его записи в tblNU
          cdsCmbOkl.First;
          if bFlagDbg then
            cdsCmbOkl.SaveToFile(cDirTemp + 'CmbOkl.cds');
          while not cdsCmbOkl.Eof do begin
            if cdsCmbOkl.FieldByName('KdObj').AsInteger > 0 then
              n_KdObj := cdsCmbOkl.FieldByName('KdObj').AsInteger
            else
               n_KdObj := tblMD.FieldByName('KdObj').AsInteger;
            n_KdSpZ := cdsCmbOkl.FieldByName('KdSpZ').AsInteger;
            cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

            TblNuAdd(d_DtCtrl, dRMes,
              cdsCmbOkl.FieldByName('DtBeg').AsDateTime,
              cdsCmbOkl.FieldByName('DtEnd').AsDateTime,
              '1004', cdsCmbOkl.FieldByName('KdSps').AsInteger,
              n_KdTemu, n_KdObj, n_KdKatP, nPdNlg, 0, 0, n_KdSpZ,
              cdsCmbOkl.FieldByName('Chas').AsFloat,
              RoundTo(cdsCmbOkl.FieldByName('Summa').AsFloat, -2),
              0, 0, cSchBU, 'поУмолч.', 'Из_CmbOkl', '', '', '', nGrp,
              nSpecNR, 0, '', '');

            cdsCmbOkl.Next;
          end; {while}
        end else if bIsOkl then begin
          nChasToNU := RoundTo(nChasR - nChasPrc, 0);
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(d_DtCtrl, dRMes, dDtBegR, dDtEndR, '1003', n_KdSps,
            n_KdTemu, n_KdObj, n_KdKatP, nPdNlg, 0, 0, n_KdSpZ,
            nChasToNU, RoundTo(nSummaR, -2), 0, 0, cSchBU,
            'поУмолч.', 'ByDefault', '', '', '',  nGrp,
            nSpecNR, 0, '', '');

          if nChasPrc > 0 then
            TblNuAdd(d_DtCtrl, dRMes, dDtBegR, dDtEndR, '5007', n_KdSps,
              n_KdTemu, n_KdObj, n_KdKatP, 1, 0, 0, n_KdSpZ,
              RoundTo(nChasPrc,0), 0, 0, 0, cSchBU,
              'поУмолч.', 'ByDefault', '', '', '', nGrp,
              nSpecNR, 0, '', '');
        end else if bIsPU {PrmUv} then begin
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(d_DtCtrl, dRMes, dDtBegPU, dDtEndPU, '5001', n_KdSps,
            n_KdTemu, n_KdObj, n_KdKatP, nPdNlg, 0, 0, n_KdSpZ,
            nChasPU, 0, 0, 0, cSchBU, 'поУмолч.', 'ByDefault',
            '', '', '', 0, 0, 0, '', '');
        end;
        nChasR   := 0;
        nChasPrc := 0;
        nSummaR  := 0;
        nChasPU  := 0;
        nStep    := 0;
        bIsOkl   := false;
        bIsPU    := false;
        bCdsCmbOklCreated := false;
      end; {if}
    end; {while}
  end; {with}

  // Надбавки сюда ! ! !

  if bCmbOkl then begin
    bbb_CmbOkl := true;
    with cdsCmbOkl do begin
      if Active then begin
        First;
        FirstPartSal := true;

        while not EoF do begin
          PartSalId := FieldByName('Nr').AsInteger;
          nCmbOklKdSPZ := FieldByName('KdSpz').AsInteger;
          nCmbOklKdObj := FieldByName('KdObj').AsInteger;
          nSummaR := FieldByName('OklTrf').AsFloat;
          nnn_Summa := nSummaR;

          R_NdbCmbOkl(
            nTabN, dRMes, FirstPartSal, PartSalId, nCmbOklKdSPZ, nCmbOklKdObj,
            nSummaR, nChasR
          );

          FirstPartSal := false;
          Next;
        end;
      end;
    end
  end else begin
    bbb_CmbOkl := false;
    R_NdbSingleOkl(nTabN, dRMes);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.R_NdbCmbOkl(
  nTabN: integer;
  dRMes: TDateTime;
  FirstPartSal: Boolean;
  PartSalId, nCmbOklKdSPZ, nCmbOklKdObj: integer;
  nSumma, nChas: double
);
begin
  InitGrpSovm;

  OpenQryNadb(nTabN, dRMes);

  with QryNadb do begin
    while not EoF do begin
      // SB 20.1.2026 <<
      case FieldByName('SpsRsch').AsInteger of
      1:
        // Все надбавки с фиксированной суммой обрабатываются первым частичным
        // окладом, поскольку они не зависят от размера оклада в отличие от
        // процентных
        if FirstPartSal then
          CalcNdb(dRMes);
      2:
        // Процентные надбавки теперь могут привязываться к комбинированным
        // окладам и по номерам счетов, и по Nr частичного оклада:
        if (FieldByName('PartSalId').AsInteger = PartSalId)
          // Старая схема связки - ещё не указывались ссылки на частичный оклад,
          // тогда - связываемся по коду затрат
          or (FieldByName('PartSalId').AsInteger = 0)
            and (FieldByName('KdSPZ').AsInteger = nCmbOklKdSPZ)
        then
          // SB 20.1.2026 >>
          CalcNdb(dRMes);
      3: begin // Сумма без учета отраб.врем. Пропускаем - обработается в ObrNadbSpsb3
          Next;
          Continue;
        end;
      end;

      Next;
    end;

    ReleaseQuery(qryNadb);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.R_NdbSingleOkl(nTabN: integer; dRMes: TDateTime);
begin
  InitGrpSovm;

  with qryNadb do begin
    OpenQryNadb(nTabN, dRMes);

    while not Eof do begin
      // Сумма без учета отраб.врем. Пропускаю - обработается в ObrNadbSpsb3
      if (FieldByName('SpsRsch').AsInteger = 3) then begin
        Next;
        Continue;
      end;

      CalcNdb(dRMes);

      Next;
    end; {while}

    ReleaseQuery(qryNadb);
  end; {with}
end; {R_NdbSingleOkl}

//------------------------------------------------------------------------------
procedure TFormRs5.OpenQryNadb(nTabN: integer; dRMesBeg: TDateTime);
var
  dRMesEnd: TDateTime;
begin
  dRMesEnd := MyLastDOM(dRMesBeg);

  InitQuery(qryNadb);
  
  with qryNadb do begin
    if dRMesBeg < gd_DtBegAutoDMZ then
      SQL.Add('Select * from Z_ViNadb where TabN = :nTabN and ' +
        ' Dt_Beg <= :dRMesEnd and (Dt_End is NULL or Dt_End >= :dRMesBeg) ' +
        ' order by Dt_Beg desc')
   else // Для автоматического расчета ДоМинЗп
      SQL.Add('select * from Z_ViNadb where TabN = :nTabN and ' +
        ' Dt_Beg <= :dRMesEnd and (Dt_End is NULL or Dt_End >= :dRMesBeg) and ' +
        ' not VidN in ("1601", "1614") ' +
        ' order by Dt_Beg desc');

    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dRMesEnd').AsDateTime := dRMesEnd;
    ParamByName('dRMesBeg').AsDateTime := dRMesBeg;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.CalcNdb(RMes: TDateTime);
var
  VidN: ShortString;
  MnthSpan, NadbSpan: TSpan;
  Hours, Sum: Double;
  cSchBU, cMesPrkz: ShortString;
  nKdSPZ, nPdN, Grp: SmallInt;
  bVidIsSovm, bIsDoMZ: boolean;
begin
  with QryNadb do begin
    // Определяем период действия надбавки в расчётном периоде
    MnthSpan.Start  := RMes;
    MnthSpan.Finish := DateUtils.EndOfMonth(RMes);

    VidN       := FieldByName('VidN').AsString;
    bIsDoMZ    := FieldByName('OKLFND').AsString  = '1';
    bVidIsSovm := FieldByName('SOVM').AsString    = '1';

    if VidN = '1433' then begin
      // Вид 1433 - Аттестация платится за полный месяц в полном объёме
      // независимо от количества отработанного времени
      NadbSpan := MnthSpan;
      Sum := FieldByName('SumProc').AsFloat;
      Hours := DmMain.CountWorkChas(NadbSpan.Start, NadbSpan.Finish);
    end
    else begin
      NadbSpan.Start  := FieldByName('Dt_Beg').AsDateTime;
      NadbSpan.Finish := FieldByName('Dt_End').AsDateTime;
      NadbSpan := DateUtils.IntersectPeriods(MnthSpan, NadbSpan);

      // Пройтись по tblMd, начислить поденно и собрать сумму и часы
      R_NdbBySmmPrc(VidN, NadbSpan, bVidIsSovm, bIsDoMz,
        FieldByName('SpsRsch').AsInteger, FieldByName('SumProc').AsFloat,
        Hours, Sum
      );
    end;

    Sum := MyRound(Sum, 2);

    if (Sum <> 0) or (VidN = '5006') or (VidN = '5009') or (VidN = '5010')
      or (VidN = '5011') or (VidN = '5012') then
    begin
      Grp := FieldByName('Grp').AsInteger;

      if bVidIsSovm then
        AddGrpSovm(Grp, Sum, FieldByName('Prc_WT').AsFloat);

      if FieldByName('SPdN').AsString = '1' then
        nPdN := 1
      else
        nPdN := 0;

      nKdSPZ  := FieldByName('KdSPZ').AsInteger;
      cSchBU  := DmMain.KdSbu2SchBU(nKdSPZ);
      cMesPrkz := Copy(FieldByName('DtPrBeg').AsString, 4, 7);

      TblNuAdd(d_DtCtrl, RMes, NadbSpan.Start, NadbSpan.Finish, VidN,
        FieldByName('KdSps').AsInteger, FieldByName('KdTemu').AsInteger,
        FieldByName('KdObj').AsInteger, FieldByName('KdKatP').AsInteger,
        nPdN, 0, 0, nKdSPZ, Hours, Sum, FieldByName('Prc_WT').AsFloat,
        0, cSchBU, 'из надбавок', cMesPrkz + ' из надб.', '', '', '',
        Grp, FieldByName('Spec_NR').AsInteger, 0,
        FieldByName('Sovm').AsString, '');
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.R_NdbBySmmPrc(
  VidN: ShortString;
  AllowSpan: TPeriod;
  VidIsSovm, VidInSmDoMZ: Boolean;
  SpsRsch: Integer;
  SumProcNdb: Double;
  var ChNdb, SmNdb: Double);
var
  nSmNdbOnDay : double;
  Sps: Integer;
  Key: TSpanKey;
begin
  ChNdb := 0;
  SmNdb := 0;

  // Совместительские надбавки по списку 6 отключается только больничными.
  // Если человек был в отпуске или неоплачиваемый вид, они действуют только
  // на виды по 1-му списку и основные виды по 6-му.
  // Совместительские по 6-му списку должны продолжать считаться как если
  // отпуска или неоплачиваемого вида не было.
  with QryNadb do begin
    Sps := FieldByName('KdSps').AsInteger;
    Key := CreateSpanKey(Sps, FieldByName('KdObj').AsInteger, VidIsSovm);
  end;

  with tblMd, AllowSpan do begin
    First;

    while not Eof and (tblMDDtMes.AsDateTime <= Finish) do begin
      if tblMDDtMes.AsDateTime >= Start then begin
        if tblMdRabotalPrp.AsBoolean
          and not DayIsSick(VidIsSovm, Sps)
          and (
            not DayIsVacat(Key)
            or IgnNoPayVac(Key, tblMDDtMes.AsDateTime)
            or VidIsSovm and IgnChildCareVac(tblMDDtMes.AsDateTime)
          )
          and not DayIsNonPay(VidIsSovm, Sps)
          and (not tblMDIsInKmd.AsBoolean or VidIsKmd(VidN))
          and (tblMdCntWrkChs.AsFloat > 0)
        then begin
          if VidN = VIDN_WAR_DAY_SUM then
            nSmNdbOnDay := SumProcNdb
          else
            if SpsRsch = 2 then
              // процентная надбавка
              IF BBB_CMBOKL THEN BEGIN
                nSmNdbOnDay := NNN_SUMMA * SumProcNdb / 100 *
                  tblMdCntWrkChs.AsFloat / n_WrkChasMes
              END ELSE BEGIN
                nSmNdbOnDay := tblMdOklTrf.AsFloat * SumProcNdb / 100 *
                  tblMdCntWrkChs.AsFloat / n_WrkChasMes;
              END

            else
              nSmNdbOnDay := SumProcNdb * tblMdCntWrkChs.AsFloat / n_WrkChasMes;

          tblMd.Edit;
          if VidIsSovm then
            tblMdSmNdbSovm.AsFloat := tblMdSmNdbSovm.AsFloat + nSmNdbOnDay
          else
            if VidInSmDoMZ then
              tblMdSmNdb.AsFloat := tblMdSmNdb.AsFloat + nSmNdbOnDay;
          tblMd.Post;

          SmNdb := SmNdb + nSmNdbOnDay;
          ChNdb := ChNdb + tblMdCntWrkChs.AsFloat;
        end;
      end;

      Next;
    end;

    SmNdb := MyRound(SmNdb, 2);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.ClearKeySpanArr(var Arr: TKeySpanArr);
begin
  SetLength(Arr, 0);
end;

//------------------------------------------------------------------------------
procedure TFormRs5.ClearSpanArr(var Arr: TSpanArr);
begin
  SetLength(Arr, 0);
end;

//------------------------------------------------------------------------------
procedure TFormRs5.ProcKeySpan(
  var Arr: TKeySpanArr;
  Key: TSpanKey;
  RMes: TDateTime;
  DataSet: TDataSet
);
var
  Indx: Integer;
begin
  Indx := SpanIndxByKey(Arr, Key);

  // Если отрезки для данного ключа не нашли, добавляем
  if Indx = -1 then begin
    SetLength(Arr, Length(Arr) + 1);

    Indx := Length(Arr) - 1;

    Arr[Indx].Key := Key;
    SetLength(Arr[Indx].Spans, 0);
  end;

  // Обрабатываем полученные отрезки
  ProcSpan(Arr[Indx].Spans, RMes, DataSet);
end;

//------------------------------------------------------------------------------
procedure TFormRs5.ProcSpan(
  var Arr: TSpanArr;
  RMes: TDateTime;
  DataSet: TDataSet
);
var
  MnthSpan, NadbSpan: TSpan;
  Storn: Boolean;
begin
  Storn := false;

  with DataSet, DateUtils do begin
    if DataSet = QryOtkl then
      Storn := FieldByName('Storn').AsString = 'Y';

    MnthSpan.Start  := DateUtils.BeginOfMonth(RMes);
    MnthSpan.Finish := DateUtils.EndOfMonth(RMes);

    NadbSpan.Start  := FieldByName('Dt_Beg').AsDateTime;
    NadbSpan.Finish := FieldByName('Dt_End').AsDateTime;

    NadbSpan := DateUtils.IntersectPeriods(MnthSpan, NadbSpan);

    if not DateUtils.PeriodIsEmpty(NadbSpan) then begin
      if Storn then
        SubstSpan(Arr, NadbSpan)
      else
        AddSpan(Arr, NadbSpan);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.AddSpan(
  var Arr: TSpanArr;
  Span: TSpan
);
begin
  SetLength(Arr, Length(Arr) + 1);

  Arr[Length(Arr) - 1] := Span;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.SubstSpan(
  var Arr: TSpanArr;
  Span: TSpan
);
var
  I: Integer;
  Sub: TSpans;
begin
  for I := 0 to Length(Arr) - 1 do begin
    Sub := DateUtils.SubtractPeriods(Arr[I], Span);

    if Length(Sub) = 0 then
      Arr[I] := DateUtils.InitPeriod
    else begin
      Arr[I] := Sub[0];

      if Length(Sub) = 2 then
        AddSpan(Arr, Sub[1]);
    end;
  end;
end;

//------------------------------------------------------------------------------
function TFormRs5.IgnNoPayVac(
  Key: TSpanKey;
  CalcDay: TDateTime
): Boolean;
begin
  Result :=
    (QryNadb.FieldByName('IgnNoPayVac').AsString = 'Y')
    and FindKeySpanDay(NopaySovmVacArr, Key, CalcDay)
    and not FindKeySpanDay(PaySovmVacArr, Key, CalcDay);
end;

//------------------------------------------------------------------------------
function TFormRs5.IgnChildCareVac(CalcDay: TDateTime): Boolean;
begin
  Result := FindSpanDay(ChildCareVacArr, CalcDay);
end;

//------------------------------------------------------------------------------
function TFormRs5.FindKeySpanDay(
  Arr: TKeySpanArr;
  Key: TSpanKey;
  Day: TDateTime
): Boolean;
var
  Indx: Integer;
begin
  Result := false;

  Indx := SpanIndxByKey(Arr, Key);

  if Indx = -1 then
    exit;

  Result := FindSpanDay(Arr[Indx].Spans, Day);
end;

//------------------------------------------------------------------------------
function TFormRs5.CreateSpanKey(
  KdSps, KdObj: Integer;
  Sovm: Boolean
): TSpanKey;
begin
  Result.KdSps := KdSps;
  Result.KdObj := KdObj;
  Result.Sovm  := Sovm;
end;

//------------------------------------------------------------------------------
function TFormRs5.SpanIndxByKey(Arr: TKeySpanArr; Key: TSpanKey): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to Length(Arr) - 1 do
    if SpanKeysAreEqual(Arr[I].Key, Key) then begin
      Result := I;
      break;
    end;
end;

//------------------------------------------------------------------------------
function TFormRs5.SpanKeysAreEqual(Key1, Key2: TSpanKey): Boolean;
begin
  Result := (Key2.KdSps = Key1.KdSps)
    and (Key2.KdObj = Key1.KdObj);
end;

//------------------------------------------------------------------------------
function TFormRs5.FindSpanDay(Arr: TSpanArr; Day: TDateTime): Boolean;
var
  I: Integer;
begin
  Result := false;

  for I := 0 to Length(Arr) - 1 do
    if DateUtils.EventIsInPeriod(Day, Arr[I]) then begin
      Result := true;
      break;
    end;
end;

//------------------------------------------------------------------------------
function TFormRs5.DayIsSick(Supplmnt: Boolean; Sps: Integer): Boolean;
begin
  if Supplmnt and (Sps = 6) then
    Result := TblMdBlnSovmSps6.AsBoolean
  else
    Result := TblMdIsBln.AsBoolean;
end;

//------------------------------------------------------------------------------
function TFormRs5.DayIsVacat(Key: TSpanKey): Boolean;
begin
  // Основные надбавки не считаются независимо от того, по какому списку
  // проходит надбавка и по какому дан отпуск.
  // 3902, Климчук за 07.23: основной список 6-й. Есть основные надбавки по
  // 1-му и по 6-му спискам. Отпуск - по 1-му. Рубает расчёт надбавок по
  // обоим спискам. Анжела сказала, что это - правильно. Т.о., если хоть по
  // какому-то списку есть основной отпуск, основные надбавки не считаются.
  // Совместительские надбавки не считаются только в случае
  // совместительского отпуска по соответствующему списку (поля
  // IsOtpSovm и IsOtpSovmSps6 таблицы TblMd).
  // 6543, Оборская за 07.23: Есть совместительские надбавки по 1-му и по
  // 6-му спискам. Совместительский отпуск по 1-му списку должен блокировать
  // расчёт надбавок только по 1-му списку.
  with Key do begin
    Result := TblMd.FieldByName(VacatFldName(Sovm, KdSps)).AsInteger > 0;

    if Sovm and (KdSps <> 6) then
      Result := FindKeySpanDay(PaySovmVacArr, Key, tblMDDtMes.AsDateTime)
        or FindKeySpanDay(NoPaySovmVacArr, Key, tblMDDtMes.AsDateTime);
  end;
end;

//------------------------------------------------------------------------------
function TFormRs5.DayIsNonPay(Supplmnt: Boolean; Sps: Integer): Boolean;
begin
  if Supplmnt and (Sps = 6) then
    Result := TblMd.FieldByName('NeoplSovmSps6').AsBoolean
  else
    Result := TblMd.FieldByName('IsNeopl').AsBoolean;
end;

//------------------------------------------------------------------------------
function TFormRs5.VacatFldName(Supplmnt: Boolean; Sps: Integer): ShortString;
var
  MainSps: Integer;
begin
  Result := 'IsOtp';

  if Supplmnt then begin
    Result := Result + 'Sovm';

    MainSps := TblMd.FieldByName('KdSps').AsInteger;

    if (Sps = 6) and (Sps <> MainSps) then
      Result := Result + 'Sps6';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.CreOpenCdsCmbOkl(nSpec_NR : integer);
begin
  with cdsCmbOkl do begin
    if Active then Close;
    CreateDataSet;
    Open;
    if qryCmbOkl.Active then
      qryCmbOkl.Close;
    qryCmbOkl.SQL.Clear;
    qryCmbOkl.DataBaseName := CESMAIN;
    qryCmbOkl.SQL.Add('Select * from Z_CmbOkl where Spec_NR = :nSpec_NR ' +
                      ' order by OklTrf desc');
    qryCmbOkl.ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    qryCmbOkl.Open;
    while not qryCmbOkl.Eof do begin
      Append;
      FieldByName('NR').AsInteger := qryCmbOkl.FieldByName('NR').AsInteger;
      FieldByName('KdSps').AsInteger := qryCmbOkl.FieldByName('KdSps').AsInteger;
      FieldByName('OklTrf').AsFloat := qryCmbOkl.FieldByName('OklTrf').AsFloat;
      FieldByName('KdSpZ').AsInteger := qryCmbOkl.FieldByName('KdSpZ').AsInteger;
      FieldByName('KdObj').AsInteger := qryCmbOkl.FieldByName('KdObj').AsInteger;
      Post;
      qryCmbOkl.Next;
    end;
    qryCmbOkl.Close;
    qryCmbOkl.SQL.Clear;
    qryCmbOkl.DataBaseName := '';
    //cdsCmbOkl.SaveToFile(cDirTemp + 'CmbOkl..cds');

  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.GetCmbOkl(nSpec_NR: integer): double;
begin
  Result := 0;
  with qryCmbOkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_CmbOkl where Spec_NR = :nSpec_NR ' +
                      ' order by OklTrf desc');
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    Open;
    while not Eof do begin
      Result := Result + FieldByName('OklTrf').AsFloat;
      Next;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.GetPrcWT(nSpecNR: integer;
  var nPrcWT: double): boolean;
begin
  Result := false;
  with qryNadb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Nadb where Spec_NR = :nSpecNR');
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    Open;
    if RecordCount > 0 then begin
      if not FieldByName('PRC_WT').IsNull and
            (FieldByName('PRC_WT').AsFloat > 0) then
      nPrcWT := FieldByName('PRC_WT').AsFloat
    else
      nPrcWT := 100;
    Result  := true;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
 end;
end;

//------------------------------------------------------------------------------
// Расчёт суммы недостающей до Минимальной ЗП
//------------------------------------------------------------------------------
procedure TFormRs5.CalcDoMZ(RMes: TDateTime);
var
  MinZpCM, SmOklNdb, SmDoMZ: Double;
  KdSps, KdObj, KdKatP, KdSPZ: Integer;
  VidN, SchBU: ShortString;
  VidInSmDoMinZp, VidIsSovm, VidIsOtp, VidIsBln,
  VidIsNeOpl, SovmVidPresent, OsnParamsDefined: Boolean;
  Hours, PrcWrkTime: Double;
begin
  if RMes < gd_DtBegAutoDMZ then
    Exit;

  // Установленная Минимальная ЗП для данного месяца
  MinZpCM := LocateTaxInfo(RMes).FieldByName('MinZp2').AsFloat;

  // Информация о текущей позиции сотрудника
  with LocatePereInfo(RMes) do begin
    KdSps  := FieldByName('KdSps').AsInteger;
    KdObj  := FieldByName('KdObj').AsInteger;
    KdKatP := FieldByName('KdKatP').AsInteger;
    KdSPZ  := FieldByName('KdSPZ').AsInteger;
  end;

  SmOklNdb := 0;
  SovmVidPresent := false;
  OsnParamsDefined := false;

  with tblNU do begin
    First;

    while not Eof do begin
      VidN := FieldByName('VidN').AsString;

      VidInSmDoMinZp := FieldByName('OklFnd').AsString = '1';
      VidIsSovm  := FieldByName('SOVM').AsString = '1';
      VidIsOtp   := FieldByName('OTPUSKN').AsString = '1';
      VidIsBln   := FieldByName('BOLNIC').AsString = '1';
      VidIsNeOpl := (VidN > '5000') and (VidN < '6000');

      // Issue 220809 - Совмест.МинЗП для НИЧ
      if VidIsSovm and not VidIsNICh(VidN) then
        SovmVidPresent := true;

      if not VidIsSovm then begin
        // Набираем общую сумму: оклад плюс надбавки, которая будет
        // учитываться при насчёте до МинЗП
        if VidInSmDoMinZp and not VidIsBln and not VidIsOtp
          and not VidIsNeOpl
        then
          SmOklNdb := SmOklNdb + FieldByName('Summa').AsFloat;

        if VidInSmDoMinZp and
          (FieldByName('ZaMesGod').AsDateTime = RMes) then
        begin
          if not OsnParamsDefined and (FieldByName('Summa').AsFloat > 0)
              // Issue 220825 - Осн.МинЗП для не НИЧ.
              // Added by SB <<<
              and (FieldByName('KdSps').AsInteger <> SPS_NICH)
              // >>>
          then begin
            KdSps  := FieldByName('KdSps').AsInteger;
            KdObj  := FieldByName('KdObj').AsInteger;
            KdKatP := FieldByName('KdKatP').AsInteger;
            KdSPZ  := FieldByName('KdSpZ').AsInteger;
            SchBU := DmMain.KdSbu2SchBU(KdSPZ);

            OsnParamsDefined := true;
          end;
        end;
      end;

      Next;
    end;
  end;

  Hours := 0;

  with tblMd do begin
    First;

    while not Eof do begin
      if // день отработан
        TblMdRabotalPrp.AsBoolean
        // не явл. неопл
        and not TblMdIsNeOpl.AsBoolean
        // не в командировке
        and not TblMDIsInKmd.AsBoolean
        // не болел
        and not TblMdIsBln.AsBoolean
        // не в отпуске
        and (TblMdIsOtp.AsInteger <= 0)
        // деньги за день - не ноль
        and (TblMdDayOklTrf.AsFloat > 0)
        // рабочие часы - не ноль
        and (TblMdCntWrkChs.AsInteger > 0)
      then
        // В часах теперь уже сразу сидит процент рабочего времени
        Hours := Hours + TblMdCntWrkChs.AsInteger * TblMDPrcWrkTime.AsFloat;

      Next;
    end;
  end;

  PrcWrkTime := Hours / n_WrkChasMes;
  MinZpCM := MinZpCM * PrcWrkTime;

  if SmOklNdb < MinZpCM then begin
    SmDoMZ := MyRound(MinZpCM - SmOklNdb, 2);

    TblNuAdd(RMes, RMes, 0, 0, '1601', KdSps, 0, KdObj, KdKatP,
      1, 0, 0, KdSPZ, 0, SmDoMZ, PrcWrkTime, 0, SchBU,
      'Авто', 'Auto', '', '', '', 0, 0, 0, '', '');
  end;

  // Расчёт совместительских видов
  if SovmVidPresent then
    CalcDoMzSovm(RMes);
end;

//------------------------------------------------------------------------------
procedure TFormRs5.CalcDoMZSovm(RMes: TDateTime);
var
  Grp: Integer;
  GrpSumNach, GrpMinZp, GrpDoMinZp: Double;
  VidN, cRMes: string;
  GrpHrs: Integer;
  nPrcWT: double;
  nSovmSpecNR: integer;
  nOsnKdSps, nOsnKdObj, nOsnKdKatP, nSovmOsnKdSps,
  nSovmOsnKdObj, nSovmOsnKdTemu, nSovmOsnKdKatP, nSovmOsnKdSpz: integer;
  bIsSovmOsnParams: boolean;
  DbgSaveCds: Boolean;
begin
  with qrySovm do begin
    if Active then  Close;
    SQL.Clear;
    DataBaseName := cDirTemp;
    SQL.Add(
      'select DtProc, ZaMesGod, Sovm, Grp, VidN, Spec_NR, KdSps, ' +
      'KdTemu, KdObj, Bolnic, Otpuskn, OklFnd, KdKatP, KdSpz, ' +
      'Sum(Summa) as Summa, Sum(Chas) as Chas, Prc_WT ' +
      'from ' + tblNU.TableName + ' ' +
      'where Sovm = "1" ' +
        // ночные совместителям, вводятся в отклонениях
        // 1207 - ночные совместителям
        // 2409,2410,2411 - отпускнvе совместителям
        'and not VidN in ("1207", "1614","2409","2410","2411") ' +
        // Issue 220809 - МинЗП для НИЧ
        'and not ' + SqlVidIsNICh + ' ' +
        'and ZaMesGod = :dRMes ' +
      'group by DtProc, ZaMesGod, Sovm,  Grp, VidN, Spec_NR, KdSps, ' +
        ' kdTemu, KdObj, Bolnic, Otpuskn, OklFnd, KdKatP, KdSpz, Prc_WT ' +
      'order by Grp');
    ParamByName('dRMes').AsDateTime := RMes;
  end;

  with cdsSovm do begin
    if Active then Close;
    Open;

    DbgSaveCds := false;

    if DbgSaveCds then
      SaveToFile(
        cDirTemp + 'aSovm_' + IntToStr(n_TN) + '_' + IntToStr(nDbgCycle) + '.cds'
      );
  end;

  with cdsdoMz do begin
    if Active then Close;
    CreateDataset;
    Open;
  end;

  with cdsSovm do begin
    First;

    while not Eof do begin
      Grp := FieldByName('Grp').AsInteger;
      GrpSumNach := 0;
      GrpHrs := 0;
      GrpDoMinZp := 0;

      GetPdnInfo(RMes, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
                                  nProgMinCM, nPrgLg, nProcLg, nSm2660,
                                  nSmLg100,nSmLg150, nSmLg200);

      while (FieldByName('Grp').AsInteger = Grp) and not Eof do begin
        VidN := FieldByName('VidN').AsString;
        nSovmSpecNR := FieldByName('Spec_NR').AsInteger;

        nOsnKdSps  := 0;
        nOsnKdObj  := 0;
        nOsnKdKatP := 0;
        bIsSovmOsnParams := false;
        nSovmOsnKdSps  := 0;
        nSovmOsnKdObj  := 0;
        nSovmOsnKdTemu := 0;
        nSovmOsnKdKatP := 0;
        nSovmOsnKdSpz  := 0;

        if not bIsSovmOsnParams then begin
          nSovmOsnKdSps    := FieldByName('KdSps').AsInteger;
          nSovmOsnKdObj    := FieldByName('KdObj').AsInteger;
          nSovmOsnKdTemu   := FieldByName('KdTemu').AsInteger;
          nSovmOsnKdKatP   := FieldByName('KdKatP').AsInteger;
          nSovmOsnKdSpZ    := FieldByName('KdSpZ').AsInteger;
        end;

        if (FieldByName('ZaMesGod').AsDateTime = RMes)
            and (FieldByName('Sovm').AsString = '1') then begin

          GrpHrs := FieldByName('Chas').AsInteger;
          nPrcWt := FieldByName('Prc_WT').AsFloat;

          GrpSumNach := GrpSumNach + FieldByName('Summa').AsFloat;
        end;

        Next;
      end;

      GrpMinZp :=
        MyRound(nMinZpCM * GrpHrs * nPrcWT / n_WrkChasMes / 100, 2);

      // Если приведённая сумма минЗП нулевая, ..
      if GrpMinZp = 0 then
        // .. то и доМинЗП быть не может
        GrpDoMinZp := 0
      else
        // .. иначе - разница
        GrpDoMinZp := GrpMinZp - GrpSumNach;

      // Если доМинЗП - отрицательная, а такое бывает в случаях возврата
      // начислений, тогда - ноль
      if GrpDoMinZp < 0 then
        GrpDoMinZp := 0;

      AddRecInCdsDoMZ(GrpSumNach, GrpSumNach, GrpDoMinZp,
              nSovmOsnKdSps, nSovmOsnKdTemu,
              nSovmOsnKdObj, nSovmOsnKdKatP,
              nSovmOsnKdSpz, Grp, nSovmSpecNR, '1614',
              'Грп ' + IntToStr(Grp) + ' Авто');
    end;

    cRMes := DateToStr(RMes);
    if not ((n_TN = 4833)
      and ((cRMes = '01-11-2018')
        or (cRMes = '01-12-2018') or (cRMes = '01-01-2019')))
    then
      with CdsDoMz do begin
      	if bFlagDbg then
          SaveToFile(cDirTemp + 'DMZ_' + IntToStr(n_TN) + '_' +
            IntToStr(nDbgCycle) + '.cds'
          );

        First;

        while not Eof do begin
          TblNuAdd(RMes, RMes, 0, 0, cdsDoMzVidN.AsString,
            cdsDoMzKdSps.AsInteger, cdsDoMzKdTemu.AsInteger,
            cdsDoMzKdObj.AsInteger, cdsDoMzKdKatP.AsInteger, 1, 0, 0,
            cdsDoMzKdSpZ.AsInteger, 0, cdsDoMzSumma.AsFloat, 0, 0, '',
            cdsDoMzMyNotes.AsString, cdsDoMzMyNotes.AsString, '', '',
            '', cdsDoMzGrp.AsInteger, cdsDoMzSpec_NR.AsInteger, 0, '', '');

          Next;
        end;
      end;
  end; {with cdsSovm}
end; {DoMZSovm}

//------------------------------------------------------------------------------
{
function TFormRs5.GetNdbInf(nSpecNR: integer; var cSP : ShortString;
    var nPrcRVN, nPrcSmN: double; var nSpsRsch: integer) : boolean;
begin
  Result := false;
  with qryNdbInf do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Nadb where Spec_NR = :nSpecNR');
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    Open;
    if RecordCount > 0 then begin
      cSP := FieldByName('SP').AsString;;
      nSpsRsch := FieldByName('SpsRsch').AsInteger;
      nPrcRVN := FieldByName('Prc_WT').AsFloat;
      nPrcSmN := FieldByName('SumProc').AsFloat;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
}

//------------------------------------------------------------------------------
procedure TFormRs5.AddRecInCdsDoMZ(nSmBySovm, nSmDelta, nSmDopl:double;
                                  nKdSps, nKdTemu, nKdObj, nKdKatP,
                                   nKdSpz, nGrp : smallint; nSpecNR: integer;
                                   cVidn, cMyNotes: shortString);
begin
 with cdsDoMZ do begin
   Append;
   FieldByName('VidN').AsString    := cVidN;
   FieldByName('SmBySovm').AsFloat    := nSmBySovm;
   FieldByName('SmDelta').AsFloat    := nSmDelta;
   FieldByName('Summa').AsFloat    := nSmDopl;
   FieldByName('KdSps').AsInteger  := nKdSps;
   FieldByName('KdTemu').AsInteger := nKdTemu;
   FieldByName('KdObj').AsInteger  := nKdObj;
   FieldByName('KdKatp').AsInteger := nKdKatp;
   FieldByName('KdSpz').AsInteger  := nKdSpz;
   FieldByName('Grp').AsInteger  := nGrp;
   FieldByName('MyNotes').AsString := cMyNotes;
   FieldByName('Spec_NR').AsInteger:= nSpecNR;
   Post;
 end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.Part02(nTabN : integer; dRMes : TDateTime);
  // из начисленного сначала сделать удержания в фонды PF, BZR, SocStrah.
  // Затем из оставшейся суммы начислить подоходный 13% (если начисл. < 510,
  // предварительно уменьшить ее на 61.50 (30 % от 205))
var bSvTblNuFiltered : boolean;
begin
  bSvTblNuFiltered := tblNu.Filtered;
  tblNu.Filtered := false;
  tblSvRes.Filtered := false;
  R_Esv2016(nTabN, dRMes);
  R_PdNlg(nTabN, dRMes);
  R_WSb(nTabN, dRMes);
  R_Prfs(nTabN, dRMes);
  R_ByUderg(nTabN, dRMes);  // расчеты по файлу Z_UDERG (делаются последними)
  SvTblNuToTblSvRes(dRMes);
  tblNu.Filtered := bSvTblNuFiltered;
  tblSvRes.Filtered := bSvTblNuFiltered;
  tblMD.First;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.SvTblNuToTblSvRes(dRMes : TDateTime);
var cVidN : ShortString; nChas : double;
begin
  with tblNu do begin
    DisableControls;
    First;
    while not Eof do begin
      cVidN := tblNuVidN.AsString;
      if (cVidN >= '6302') and (cVidN <= '6502') then
        cVidN := '6201'
      else if (cVidN >= '8611') and (cVidN <= '8643') then
        cVidN := '8681'
      else if (cVidN = '8671') then
        cVidN := '8606';
      if dRMes = d_DtCtrl then
        nChas := tblNuD__Chs.AsFloat  // 0
      else
        nChas := tblNuD__Chs.AsFloat;
      if ((tblNuD__Smm.AsFloat > 0.001) or (tblNuD__Smm.AsFloat < -0.001)) or
              ((cVidN > '5000') and (cVidN < '5050')) {НеОплачиваемые} or
                                 (tblNuCBudg.AsString = '1') {бюджетный вид}then
        AddRecToTblSvRes(n_TN, tblNuDtProc.AsDateTime, tblNuZaMesGod.AsDateTime,
                         nChas, RoundTo(tblNuD__Smm.AsFloat, -2), cVidN,
                         tblNuDt_Beg.AsString, tblNuDt_End.AsString,
                         tblNuKdSps.AsString, tblNuKdTemu.AsString,
                         tblNuKdObj.AsString,
                         tblNuKdKatP.AsString, tblNuKdSpZ.AsString,
                         tblNuPdN.AsString, tblNuNotes.AsString,
                         tblNuPRR.AsString, tblNuPrPV.AsString,
                         tblNuKto.AsString, tblNuPrKr.AsString,
                         tblNuMyNotes.AsString, tblNuSpecPS.AsString,
                         tblNuSpec_NR.AsString, tblNuDtVdPV.AsString,
                         tblNuNrVdPV.AsString,
                         tblNuStorn.AsString, tblNuSAlim.AsString,
                         tblNuOzn_Pilg.AsString, tblNUCBudg.AsString,
                         tblNuKdBnk.AsString, tblNuNuSovm.AsString);
      Next;
    end;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.AddRecToTblSvRes(nTabN : integer;
                             dDtPrc, dZaMG : TDateTime; nDChs, nDSmm : double;
                                 cVidN, cDt_Beg, cDt_End, cKdSps, cKdTemu,
                                cKdObj, cKdKatP, cKdSpZ, cPdN, cNotes, cPRR,
                               cPrPV, cKto, cPrKr, cMyNotes, cSpecPS,
                               cSpec_NR, cDtVdPV, cNrVdPV, cStorn, cSAlim,
                               cOznPilg, cCBudg, cKdBnk: ShortString;
                               Sovm: ShortString);
begin
  with tblSvRes do begin
    // Не пытаюсь (по-крайней мере, пока) искать Locate'ом "одноименные"
    // записи, но с разными DtProc. Так нагляднее. Есть поле Step, в котором
    // видно, на каком nDbgCycle сделана запись.
    // Потом посмотрю, менять ли эту схему.
    // Но, вообще-то, есть о чем подумать -
    Append;
    tblSvResTabN.AsInteger      := nTabN;
    tblSvResStep.AsInteger      := nDbgCycle;
    tblSvResDtProc.AsDateTime   := dDtPrc;
    tblSvResZaMesGod.AsDateTime := dZaMG;
    tblSvResChas.AsFloat        := nDChs;
    tblSvResSumma.AsFloat       := nDSmm;
    tblSvResVidN.AsString       := cVidN;
    tblSvResDt_Beg.AsString     := cDt_Beg;
    tblSvResDt_End.AsString     := cDt_End;
    tblSvResKdSps.AsString      := cKdSps;
    tblSvResKdTemu.AsString     := cKdTemu;
    tblSvResKdObj.AsString      := cKdObj;
    tblSvResKdKatP.AsString     := cKdKatP;
    tblSvResKdSpZ.AsString      := cKdSpZ;
    tblSvResPdN.AsString        := cPdN;
    tblSvResNotes.AsString      := cNotes;
    tblSvResPRR.AsString        := cPRR;
    tblSvResPrPV.AsString       := cPrPV;
    tblSvResKto.AsString        := cKto;
    tblSvResPrKr.AsString       := cPrKr;
    tblSvResMyNotes.AsString    := cMyNotes;
    tblSvResSpecPS.AsString     := cSpecPS;
    tblSvResSpec_NR.AsString    := cSpec_NR;
    tblSvResDtVdPV.AsString     := cDtVdPV;
    tblSvResNrVdPV.AsString     := cNrVdPV;
    tblSvResStorn.AsString      := cStorn;
    tblSvResSAlim.AsString      := cSAlim;
    tblSvResOzn_Pilg.AsString   := cOznPilg;
    tblSvResCBudg.AsString      := cCBudg;
    tblSvResKdBnk.AsString      := cKdBnk;
    tblSvResSovm.AsString       := Sovm;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.RaschetDolga(d_DtCtrl : TDateTime);
var nSmNaRuki  : double; cKdSps, cKdTemu, cKdObj, cKdKatP, cKdSpZ : ShortString;
begin
  if bFlagDbg then
    Application.ProcessMessages;
  nSmNaRuki := 0;
  with tblSvRes do begin
    First;
    while not Eof do begin
      if FieldByName('VidN').AsString < '8600' then
        nSmNaRuki := nSmNaRuki + RoundTo(FieldByName('Summa').AsFloat, -2);
      Next;
    end;
  end;
  nSmNaruki := RoundTo(nSmNaruki, -2);
  if ((nSmNaruki >= -0.011) and (nSmNaruki <= 0.011)) then
    nSmNaruki := 0;
// Записать сумму долга по месту основной работы
// с основными данными (KdSps, KdObj, KdSpZ, KdKatP на конец месяца)
  if nSmNaRuki < 0 then begin
    nSmNaRuki := -nSmNaRuki;
    tblMd.Last;
    cKdSps  := tblMd.FieldByName('KdSps').AsString;
    cKdTemu := '';
    cKdObj  := tblMd.FieldByName('KdObj').AsString;
    cKdKatP := tblMd.FieldByName('KdKatP').AsString;
    cKdSpZ  := tblMd.FieldByName('KdSpZ').AsString;
    AddRecToTblSvRes(n_TN, d_DtCtrl, d_DtCtrl,   {Добавлять надо уже в tblSvRes}
                         0, nSmNaruki, '2724',
                         '', '', cKdSps, cKdTemu,
                         cKdObj, cKdKatP, cKdSpZ,
      '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetPrcEsv(dZaMG: TDateTime;
                  var nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv: double);
var nCntRec, i : integer;
begin
  nPrcECmn  := 0;
  nPrcEPps  := 0;
  nPrcEBln  := 0;
  nPrcEDkr  := 0;
  nPrcEDgv  := 0;
  i         := 0;
  with qryPrcEsv do begin  // сортирована по DtBeg descending
    nCntRec := RecordCount;
    First;
    while not Eof do begin
      Inc(i);
// если не оказалось нужной записи - беру данные из последней
      if (FieldByName('DtBeg').AsdateTime <= dZaMG) or
         (i = nCntRec) then begin
        nPrcECmn := FieldByName('PrcCmn').AsFloat;
        nPrcEPps := FieldByName('PrcPps').AsFloat;
        nPrcEBln := FieldByName('PrcBln').AsFloat;
        nPrcEDkr := FieldByName('PrcDekr').AsFloat;
        nPrcEDgv := FieldByName('PrcGpd').AsFloat;
        Break;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetPrcEsvPrp(dZaMG: TDateTime; var nPrcECmn, nPrcEInv,
                                       nPrcEBln, nPrcEBlnInv, nPrcEDkr,
                                              nPrcEDkrInv, nPrcEDgv: double);
var nCntRec, i : integer;
begin
  nPrcECmn    := 0;
  nPrcEInv    := 0;
  nPrcEBln    := 0;
  nPrcEBlnInv := 0;
  nPrcEDkr    := 0;
  nPrcEDkrInv := 0;
  nPrcEDgv    := 0;
  i := 0;
// сортирована по DtBeg descending
  with qryPrcEsvPrp do begin
    if not Active then
      Open;
    nCntRec := RecordCount;
    First;
    while not Eof do begin
      Inc(i);
      if (FieldByName('DtBeg').AsDateTime <= dZaMG) or
// если не оказалось нужной записи - беру данные из последней
                                                      (i = nCntRec) then begin
        nPrcECmn    := FieldByName('PrcCmn').AsFloat;
        nPrcEInv    := FieldByName('PrcInv').AsFloat;
        nPrcEBln    := FieldByName('PrcBln').AsFloat;
        nPrcEBlnInv := FieldByName('PrcBlnInv').AsFloat;
        nPrcEDkr    := FieldByName('PrcDekr').AsFloat;
        nPrcEDkrInv := FieldByName('PrcDekrInv').AsFloat;
        nPrcEDgv    := FieldByName('PrcGpd').AsFloat;
        Break;
      end;
      Next;
    end;
  end;
end;
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmECmn(nTabN : integer; dZaMG : TDateTime;
                             nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEPps(nTabN : integer; dZaMG : TDateTime;
                             nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmECmnPrp(nTabN: integer; dZaMG: TDateTime;
                             nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEBlnPrp(nTabN: integer; dZaMG: TDateTime;
                              nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEBlnInvPrp(nTabN: integer; dZaMG: TDateTime;
                              nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEDkr(nTabN: integer; dZaMG: TDateTime; nSmFor,
                                       nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEDkrInvPrp(nTabN: integer; dZaMG: TDateTime;
                               nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEDkrPrp(nTabN: integer; dZaMG: TDateTime; nSmFor,
                                       nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEDgvPrp(nTabN: integer; dZaMG: TDateTime;
                             nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEInvPrp(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEBln(nTabN : integer; dZaMG : TDateTime;
                               nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEDgv(nTabN : integer; dZaMG : TDateTime;
                               nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
*)
//------------------------------------------------------------------------------
procedure TFormRs5.QryInvPrepare;
begin
  with qryInv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 p.*, wp.NrDoc, wp.DtBegDoc, wp.DtEndDoc ' +
            ' from z_Pere p ' +
            ' Left outer Join z_GetWrkPereOnDate(p.TabN, :dOnDate) wp on 1=1 ' +
            ' where p.TabN = :nTabN and p.Dt_beg <= :dOnDate ' +
            ' order by p.Dt_Beg desc, p.NR desc');
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.IsInvalid(nTabN : integer; dZaMG : TDateTime) : boolean;
begin
  Result := false;
  with qryInv do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dOnDate').AsDateTime := dZaMG;
    Open;
    if (FieldByName('Inv').AsInteger > 0) and (not FieldByName('NrDoc').IsNull) and
                     (Trim(FieldByName('NrDoc').AsString) > '') then
      Result := true;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmForSvPorogi(var nSmFSvP, nSmCmnFSvP, nSmPpsFSvP,
                                   nSmBlnFSvp, nSmDkrFSvP, nSmDgvFSvP : double);
var nSvNR : integer; nKdKatP : SmallInt; cVidN : ShortString;
begin
  nSmFSvP := 0;
  nSmCmnFSvP := 0;
  nSmPpsFSvP := 0;
  nSmBlnFSvp := 0;
  nSmDkrFSvP := 0;
  nSmDgvFSvP := 0;
  with tblNu do begin
    nSvNR := tblNuNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      cVidN := tblNuVidN.AsString;
      nKdKatP := tblNuKdKatP.AsInteger;
      if (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008') then
        nSmDgvFSvP := nSmDgvFSvP + tblNuSumma.AsFloat
      else if (cVidN = '2602') then
        nSmDkrFSvP := nSmDkrFSvP + tblNuSumma.AsFloat
      else if (cVidN >= '2601') and (cVidN <= '2605') then
        nSmBlnFSvP := nSmBlnFSvP + tblNuSumma.AsFloat
      else if (cVidN < '2700') and (nKdKatP = 1) then
        nSmPpsFSvP := nSmPpsFSvP + tblNuSumma.AsFloat
      else if (cVidN < '2700') then
        nSmCmnFSvP := nSmCmnFSvP + tblNuSumma.AsFloat;
      Next;
    end;
    nSmFSvP := nSmCmnFSvP + nSmPpsFSvP + nSmBlnFSvp + nSmDkrFSvP + nSmDgvFSvP;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.IsPolnMesByPrmUv(nTabN: integer; dZaMG: TDateTime): boolean;
var dLastDOM : TDateTime;
begin
  Result := true;
  dLastDOM := MyLastDOM(dZaMG);
  with qryIsPolnMesByPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from z_PrmUv where TabN = :nTabN and ' +
            ' Dt_Priem <= :dLastDOM order by dt_Priem desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dLastDOM').AsDateTime := dLastDOM;
    Open;
    if RecordCount > 0 then begin
      if (not FieldByName('Dt_Priem').IsNull and
                (FieldByName('Dt_Priem').AsDateTime > dZaMG)) or
         (not FieldByName('Dt_Uvoln').IsNull and
                 (FieldByName('Dt_Uvoln').AsDateTime < dLastDOM)) then
        Result := false;
    end;
    Close;
  end;
end;


(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSvPorogi(nSmFor, nSmPfMax, nSmECmnFor, nSmEPpsFor,
                                   nSmEBlnFor, nSmEDkrFor, nSmEDgvFor : double;
                 var nSvPECmn, nSvPEPps, nSvPEBln, nSvPEDkr, nSvPEDgv : double);
var nSmOst, nSmSvP : double;
begin
  nSvPECmn := 0; // Если nSmForXX > nSmPfMax, то нужно на СверхПорог спурхать
  nSvPEPps := 0; // больничные, затем декретные, затем договорные, затем общие,
  nSvPEBln := 0; // затем ППС'овские (видимо т.к. на ППС-суммы самый большой
  nSvPEDgv := 0; //                                        процент отчислений)
  if nSmFor > nSmPfMax then begin
    nSmOst := nSmFor;
    nSmSvP := nSmOst - nSmPfMax;
    if nSmSvP > 0 then begin
      if nSmEBlnFor >= nSmSvP then
        nSvPEBln := nSmSvP
      else
        nSvPEBln := nSmEBlnFor;
      nSmSvP := nSmSvP - nSvPEBln;
    end;
    if nSmSvP > 0 then begin
      if nSmEDkrFor >= nSmSvP then
        nSvPEDkr := nSmSvP
      else
        nSvPEDkr := nSmEDkrFor;
      nSmSvP := nSmSvP - nSvPEDkr;
    end;
    if nSmSvP > 0 then begin
      if nSmEDgvFor >= nSmSvP then
        nSvPEDgv := nSmSvP
      else
        nSvPEDgv := nSmEDgvFor;
      nSmSvP := nSmSvP - nSvPEDgv;
    end;
    if nSmSvP > 0 then begin
      if nSmECmnFor >= nSmSvP then
        nSvPECmn := nSmSvP
      else
        nSvPECmn := nSmECmnFor;
      nSmSvP := nSmSvP - nSvPECmn;
    end;
    if nSmSvP > 0 then begin
      if nSmEPpsFor >= nSmSvP then
        nSvPEPps := nSmSvP
      else
        nSvPEPps := nSmEPpsFor;
      //nSmSvP := nSmSvP - nSvPEPps;
    end;
  end;
end;
*)

//------------------------------------------------------------------------------
procedure TFormRs5.SetEsvSps(Sps: Integer);
begin
  if _EsvSps = 0 then
    _EsvSps := Sps;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.R_Esv2016(nTabN: integer; dRMes: TDateTime);
var KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ, nPRR : SmallInt;
    cVidXX, cVidDoMinZp, cMyVid : string4;
    nSvCdsNR1, nSvCdsNR2,
    nCntPorcCmn, nCntPorcPps, nCntPorcBln, nCntPorcDkr, nCntPorcDgv,
                                           nCntPorc, nNumPorc : integer;
    nPrcE, nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv {проценты ЕСВ},
                                                            nSmPfMax : double;
    nPrcPrpECmn, nPrcPrpEInv, nPrcPrpEBln, nPrcPrpEBlnInv,
               nPrcPrpEDkr, nPrcPrpEDkrInv, nPrcPrpEDgv {прцПрп ЕСВ} : double;
    nSmECmnFor, nSmEPpsFor, nSmEBlnFor, nSmEDkrFor, nSmEDgvFor,
             nSmECmnNw, nSmEPpsNw, nSmEBlnNw, nSmEDkrNw, nSmEDgvNw,
            nSvPrg, nSvPECmn, nSvPEPps, nSvPEBln, nSvPEDkr, nSvPEDgv : double;
    nSmForXX, nSmForXxNw, nSmOldXX, nSmXX, nSmXXUdeln, nSmPorc, nSmOst : double;
    nSmmForX, nSmmX, nSmmXUdeln, nSmmSvPrg, nSmPrg, nDummy : double;
    nSST, nSPT, nSS, nSP : double;
    dOksRMes, dOksZaMG, dOksRepMes, dZaMG, dDtP, dDtDbg : TDateTime;
    cZaMG, cSchBU, cDbgMsg, cMyNotes, cFldNmCmn, cFldNmPps,
                                   cFldNmBln, cFldNmDkr, cFldNmDgv : ShortString;
    nSvTmpNR, nIVzn, nIPrg : integer;
    nSaveSmmForX, nUdVes, nSvPUdVes, nSmMes  : double;
    nSvPUdeln, nSmmSvP, nSvPPorc, nSvPOst : double;
    nPrcFzCmn : double;
    bInvalid, bPensioner, bSovm, bIsPrmUv,
                              bRabotalInMes {хотя бы один день} : boolean;
    bIsPolnMesByPrmUv : boolean;
    nKoefPonig : double; // Вводится, если есть сверхПорог
    bWasEsv : boolean;
    nSmOldSvPrg, nSmNewSvPrg, nSmSvPrg, nSmDoMinZp, nSmTtForXX : double;
    nSmDbg : double;
    bPravimEsv, bEsv, bEsvPrp  : boolean;
    cCntOks3Rec, nRecNumber : SmallInt;
    nSmXxDoMinZp, nSmCmnFor, nSmPpsFor, nSmBlnFor, nSmDkrFor, nSmDgvFor,
    nNwSmCmnF, nNwSmPpsF, nNwSmBlnF, nNwSmDkrF, nNwSmDgvF : double;
    // Ниже переменные для расчёта сверхПорогов по таблице tblNU
    nSmFSvP, nSmCmnFSvP, nSmPpsFSvP, nSmBlnFSvp, nSmDkrFSvP, nSmDgvFSvP : double;
    bWrtnSvPCmn, bWrtnSvPPps, bWrtnSvPBln, bWrtnSvPDkr, bWrtnSvPDgv : boolean;

  PrimAccId: Integer;
begin
  _EsvSps := 0;

  // Основной счёт сотрудника
  QryUtils.InitQuery(PeekQuery);
  QryUtils.PeekAssign(PeekQuery, nTabN, dRMes, false, false);
  PrimAccId := PeekQuery.FieldByName('KdSpZ').AsInteger;
  QryUtils.ReleaseQuery(PeekQuery);

  bPravimEsv := false;
  bEsv       := false;
  bEsvPrp    := false;
  bWrtnSvPCmn := false;
  bWrtnSvPPps := false;
  bWrtnSvPBln := false;
  bWrtnSvPDkr := false;
  bWrtnSvPDgv := false;
  with cdsOks3 do begin
    // 1. Расчет удержаний в ESV с зарплаты сотрудника
    First;

    cCntOks3Rec := RecordCount;
    nRecNumber := 0;
    nSmXxDoMinZp := 0;
    if bFlagDbg then
      dbgrOks3.Refresh;
    while not Eof do begin
      Inc(nRecNumber);
      dOksRMes   := FieldByName('RMes').AsDateTime;
      dOksRepMes := FieldByName('RepMes').AsDateTime;
      dZaMG      := FieldByName('ZaMG').AsDateTime;
      cZaMG      := FieldByName('ZaMG').AsString;
      cDbgMsg := '';
      nSmXX := 0;
      bInvalid := IsInvalid(nTabN, dZaMG);

      dDtDbg := 0;
      if (dOksRMes < d_20160101) and (dOksRepMes < d_20160101) then
        dDtDbg := dZaMG
      else if (dOksRMes >= d_20160101) and (dOksRepMes < d_20160101) then
        dDtDbg := dZaMG
      else if (dOksRMes >= d_20160101) and (dOksRepMes >= d_20160101) then
        dDtDbg := dOksRMes;

      // Приступаю к расчётам собственно удержаий с сотрудников и
      // взносов предприятия в Есв
      GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
                                     nProgMinCM, nPrgLg, nProcLg, nSm2660,
                                                 nSmLg100, nSmLg150, nSmLg200);
      GetSmPfMax(dZaMG, nSmPfMax); // из постоянно открытой qryTPdN нахожу порог
      GetPrcEsv(dDtDbg, nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv);
      GetPrcEsvPrp(dDtDbg, nPrcPrpECmn, nPrcPrpEInv, nPrcPrpEBln,
                                                  nPrcPrpEBlnInv, nPrcPrpEDkr,
                                                  nPrcPrpEDkrInv, nPrcPrpEDgv);
      if nRecNumber = 1 then begin
        // Разборка со сверхПорогами  (nSmForXX пересчитываю с ГПД видами)
        // Найти общие суммы начисл.по табл. tblNU и разобраться со свПорогами
        GetSmPfMax(dZaMG, nSmPfMax); // в постоянно открытой qryTPdN ищу порог
        GetSmForSvPorogi(nSmFSvP, nSmCmnFSvP, nSmPpsFSvP,
                                           nSmBlnFSvp, nSmDkrFSvP, nSmDgvFSvP);
        // Выбраны данные для свПорогов из tblNU.
        // Теперь раскидываю их по "категориям"
        SetSvPorogi(nSmFSvP, nSmPfMax, nSmCmnFSvP, nSmPpsFSvP,
                                           nSmBlnFSvp, nSmDkrFSvP, nSmDgvFSvP,
                              nSvPECmn, nSvPEPps, nSvPEBln, nSvPEDkr, nSvPEDgv);
      end;

      nSmECmnFor :=  FieldByName('sNwCmn').AsFloat;
      nSmEPpsFor :=  FieldByName('sNwPps').AsFloat;
      nSmEBlnFor :=  FieldByName('sNwBln').AsFloat;
      nSmEDkrFor :=  FieldByName('sNwDkr').AsFloat;
      nSmEDgvFor :=  FieldByName('sNwDgv').AsFloat;

      //=======  расчет удержаний и взносов в ЕСВ с Общих(НеППС)-сумм  =======//
      nSmForXX := FieldByName('sNwCmn').AsFloat;
      nSmSvPrg := nSvPECmn;
      nPrcE    := nPrcECmn;  //FieldByName('PrcECmn').AsFloat;
      cMyNotes := FloatToStr(nPrcE) + '%';
      if nSmForXX <> 0 then begin
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin
          cVidXX := '6201';   // ЕсвОбщие (с сотр.)

          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
            cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;

        if (nSmSvPrg <> 0) and not bWrtnSvPCmn then begin
          bWrtnSvPCmn := true;
          cVidXX := '8606';   // СверхПорогиОбщие

          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSmSvPrg, 0, 0,
            cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0, 0, '', '');
        end;

        // тут же делаю взносы с предприятия с общих сумм(видов)
        nSmECmnFor := FieldByName('sNwCmnPrp').AsFloat;
        nSmSvPrg   := FieldByName('svPrgCmn').AsFloat;
        if bInvalid then begin
          nPrcE   := nPrcPrpEInv; //  FieldByName('PrcEInvPrp').AsFloat;
          cVidXX := '8683'; end   // ЕсвПрпИнвОбщие
        else begin
          nPrcE   := nPrcPrpECmn; // FieldByName('PrcECmnPrp').AsFloat;
          cVidXX := '8681';       // ЕсвПрпОбщие
        end;
        cMyNotes := FloatToStr(nPrcE) + '%';
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin  // СвПороги тут не разбираю, т.к. они
          KdSps  := FieldByName('KdSps').AsInteger; // разнесены при рас-
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger; // чёте ЕСВ с сотруд-
          n_KdKatP := FieldByName('KdKatP').AsInteger;// ника с общих видов
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX,
            0, 0, cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;
      end;

      //==========  расчет удержаний и взносов в ЕСВ с ППС-сумм  ===========//
      nSmForXX := FieldByName('sNwPps').AsFloat;
      nSmSvPrg := nSvPEPps;
      nPrcE    := nPrcEPps;
      cMyNotes := FloatToStr(nPrcE) + '%';
      if nSmForXX {nSmEPpsFor} <> 0 then begin
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin
          cVidXX   := '6206';    // ЕсвППС (с сотр.)
          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
            cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;
        if (nSmSvPrg <> 0) and not bWrtnSvPPps then begin
          bWrtnSvPPps := true;
          cVidXX   := '8607';  // СверхПорогиППС

          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSmSvPrg, 0, 0,
            cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0, 0, '', '');
        end;
        // тут же делаю взносы с предприятия с ППС-видов
        nSmForXX := FieldByName('sNwPps').AsFloat;
        nSmSvPrg := FieldByName('svPrgPps').AsFloat;
        if bInvalid then begin
          nPrcE  := nPrcPrpEInv;
          cVidXX := '8684'; end  // ЕсвПрпПпсИнв
        else begin
          nPrcE  := nPrcPrpECmn;
          cVidXX := '8682';      // ЕсвПрпПпсОбщ
        end;
        cMyNotes := FloatToStr(nPrcE) + '%';
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin  // СвПороги тут не разбираю, т.к. они
          KdSps  := FieldByName('KdSps').AsInteger; // разнесены при рас-
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger; // чёте ЕСВ с сотруд-
          n_KdKatP := FieldByName('KdKatP').AsInteger;// ника с общих видов
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX,
            0, 0, cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;
      end;
      //=========  расчет общей суммы удержания в ЕСВ с ДГВ-видов  =========//
      nSmForXX := FieldByName('sNwDgv').AsFloat;
      nSmSvPrg   := nSvPEDgv;
      nPrcE      := FieldByName('PrcEDgv').AsFloat;  // nPrcEDgv;
      cMyNotes := FloatToStr(nPrcE) + '%';
      if nSmEDgvFor <> 0 then begin
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin
          cVidXX   := '6216';   // ЕсвДгв (с сотр.)

          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
            cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;
        if (nSvPEDgv <> 0) and not bWrtnSvPDgv then begin
          bWrtnSvPDgv := true;
          cVidXX   := '8610';   // СвПорогиГпд
          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSvPEDgv, 0, 0,
            cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0, 0, '', '');
        end;
        // тут же делаю взносы с предприятия с ДГВ-видов
        nSmForXX := nSmEDgvFor;
        nSmSvPrg := nSvPEDgv;
        nPrcE    := nPrcPrpEDgv;
        cMyNotes := FloatToStr(nPrcE) + '%';
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin
          cVidXX   := '8691';   // ЕсвПрпГпд  (с предпр.)
          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;
          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          
          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
            cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;
      end;
      //==========  расчет удержаний и взносов в ЕСВ с Блн-сумм  ===========//
      nSmForXX   := FieldByName('sNwBln').AsFloat;
      nSmSvPrg   := nSvPEBln;
      nPrcE      := nPrcEBln;
      cMyNotes := FloatToStr(nPrcE) + '%';
      if nSmForXX <> 0 then begin
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin
          cVidXX   := '6211';    // ЕсвБлн (с сотр.)

          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          
          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
            cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;
        if (nSmSvPrg <> 0) and not bWrtnSvPBln then begin
          bWrtnSvPBln := true;
          cVidXX   := '8608';  // СверхПорогиБЛН
          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSmSvPrg, 0, 0,
            cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0, 0, '', '');
        end;
        // тут же делаю взносы с предприятия с Блн-видов
        nSmForXX := FieldByName('sNwBln').AsFloat;
        nSmSvPrg := FieldByName('svPrgBln').AsFloat;
        if bInvalid then begin
          nPrcE   := nPrcPrpEBlnInv;
//          nPrcE   := FieldByName('PrcEBlnInvPrp').AsFloat;
          cVidXX := '8686'; end  // ЕсвПрпБлнИнв
        else begin
          nPrcE   := nPrcPrpEBln;
//          nPrcE   := FieldByName('PrcEBlnPrp').AsFloat;
          cVidXX := '8685';      // ЕсвПрпBlnОбщ
        end;
        cMyNotes := FloatToStr(nPrcE) + '%';
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin  // СвПороги тут не разбираю, т.к. они
          KdSps  := FieldByName('KdSps').AsInteger; // разнесены при рас-
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger; // чёте ЕСВ с сотруд-
          n_KdKatP := FieldByName('KdKatP').AsInteger;// ника с общих видов
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          
          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
            cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;
      end;
      //==========  расчет удержаний и взносов в ЕСВ с Dkr-сумм  ===========//
      nSmForXX   := FieldByName('sNwDkr').AsFloat;
      nSmSvPrg   := nSvPEDkr;
      nPrcE      := nPrcEDkr;
      cMyNotes := FloatToStr(nPrcE) + '%';
      if nSmForXX <> 0 then begin
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin
          cVidXX   := '6212';    // ЕсвDkr (с сотр.)
          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
            cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;
        if (nSmSvPrg <> 0) and not bWrtnSvPDkr then begin
          bWrtnSvPDkr := true;
          cVidXX   := '8608';  // СверхПорогиБЛН (для Декр. нету "своего" вида)
          KdSps  := FieldByName('KdSps').AsInteger;
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          
          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSmSvPrg, 0, 0,
            cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0, 0, '', '');
        end;
        // тут же делаю взносы с предприятия с Декр-видов
        nSmForXX := FieldByName('sNwDkr').AsFloat;
        if bInvalid then begin
          nPrcE   := nPrcPrpEDkrInv;
          cVidXX := '8688'; end  // ЕсвПрпDkrИнв
        else begin
          nPrcE   := nPrcPrpEDkr;
          cVidXX := '8687';      // ЕсвПрпDkrОбщ
        end;
        cMyNotes := FloatToStr(nPrcE) + '%';
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin  // СвПороги тут не разбираю, т.к. они
          KdSps  := FieldByName('KdSps').AsInteger; // разнесены при рас-
          EsvSps := KdSps;

          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger; // чёте ЕСВ с сотруд-
          n_KdKatP := FieldByName('KdKatP').AsInteger;// ника с общих видов
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, KdSps, n_KdTemu, n_KdObj,
            n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
            cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
        end;
      end;

      //====  TYTYTY  ===== Дела ДоМинЗарплатные ==================//
      // Определить необходимые параметры в таблице z_TPdn) на dZaMG
      if (nRecNumber = cCntOks3Rec) and
                  (dZaMG <= dCtrlDate) and (dZaMG >= d_20150101) then begin
        GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
                                       nProgMinCM, nPrgLg, nProcLg, nSm2660,
                                                nSmLg100, nSmLg150, nSmLg200);
        GetSmPfMax(dZaMG, nSmPfMax);
        GetPrcEsv(dDtDbg, nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv);
        GetPrcEsvPrp(dZaMG, nPrcPrpECmn, nPrcPrpEInv, nPrcPrpEBln,
                                                  nPrcPrpEBlnInv, nPrcPrpEDkr,
                                                  nPrcPrpEDkrInv, nPrcPrpEDgv);
        // Проверяю тут на (nSmForXX < nMinZpNG)   (без ГПД видов)
//    procedure GetSmsDoMinZp(dDtZaMG: TdateTime; var nSmXxDoMinZp,
//                nSmCmnFor, nSmPpsFor, nSmBlnFor, nSmDkrFor,
//                nNwSmCmnF, nNwSmPpsF, nNwSmBlnF, nNwSmDkrF : double);



        GetSmsDoMinZp(dZaMG, nSmXxDoMinZp,
                         nSmCmnFor, nSmPpsFor, nSmBlnFor, nSmDkrFor,
                                    nNwSmCmnF, nNwSmPpsF, nNwSmBlnF, nNwSmDkrF);
        GetPrcEsvPrp(dDtDbg, nPrcPrpECmn, nPrcPrpEInv, nPrcPrpEBln,
                                                  nPrcPrpEBlnInv, nPrcPrpEDkr,
                                                  nPrcPrpEDkrInv, nPrcPrpEDgv);
        nSmForXX := nSmXxDoMinZp;
//        nSmForXX := nSmECmnFor + nSmEPpsFor +
//                                 nSmEBlnFor + nSmEDkrFor + nSmEDgvFor;
        // Определить необходимые параметры в таблице z_TPdn) на dZaMG
        GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
                                     nProgMinCM, nPrgLg, nProcLg, nSm2660,
                                                 nSmLg100, nSmLg150, nSmLg200);
        if (nSmForXX < nMinZpCM) then begin
          bRabotalInMes := WorksInMes(nTabN, dZaMG);
          // тут надо выяснить, числился ли полный месяц (не было ли прм/уволн
          // после 1-го числа месяца и раньше последнего числа месяца)
          bIsPolnMesByPrmUv := IsPolnMesByPrmUv(nTabN, dZaMG);

          LocalGetPereInf(nTabN, MyLastDOM(dZaMG),
                          nPereKdSps, nPereKdObj, nPereKdKatP, nPereSO,
                          nPerePdNlg, nPereKolMin, nPereKdSpz,

                          nPrcWT, nPereOklTrf,nPereAvans,

                          cPereSpAv,
                          cPereDolgnost, cPereNrPrikaza,
                          dPereDtPrikaza,
                          bPerePens, bSovm, bPerePrfs,
                          nPereInv);
          if bIsPolnMesByPrmUv and
                         bRabotalInMes and not bInvalid and not bSovm then begin
            nSmForXX := nMinZpCM - nSmXxDoMinZp;
            if nSmECmnFor <> 0 then begin
              nPrcE := nPrcPrpECmn;
              nSmXX := nPrcE * (nSmForXX - 0) / 100;
              cVidXX := '8711';        // вместо 0 д.б. СвПорог, но пока сойдет
              cVidDoMinZp := '8713'; end  // т.к. навряд-ли у минимальщика
            else if nSmEPpsFor <> 0 then begin  // будет СвПорог
              nPrcE := nPrcPrpECmn;
              nSmXX := nPrcE * (nSmForXX - 0) / 100;
              cVidXX := '8712';
              cVidDoMinZp := '8713'; end  // с ППС и общих в ЕсвПрп % одинаковый
            else if nSmEBlnFor <> 0 then begin
              nPrcE := nPrcPrpEBln;
              nSmXX := nPrcE * (nSmForXX - 0) / 100;
              cVidXX := '8715';
              cVidDoMinZp := '8717'; end
            else if nSmEDkrFor <> 0 then begin
              nPrcE := nPrcPrpEDkr;
              nSmXX := nPrcE * (nSmForXX - 0) / 100;
              cVidXX := '8716';
              cVidDoMinZp := '8717'; end
            else if nSmEDgvFor <> 0 then begin // напишу так же, как
              nPrcE := nPrcPrpEDgv;
              nSmXX := nPrcE * (nSmForXX - 0) / 100;
              //nSmXX := nPrcPrpECmn * (nSmForXX - 0) / 100;
              cVidXX := '8711';        // вместо 0 д.б. СвПорог, но пока сойдет
              cVidDoMinZp := '8713';   // т.к. навряд-ли у минимальщика
            end;

            cMyNotes := FloatToStr(nPrcE) + '%';
            nSmDoMinZp := nSmForXX;

            if nSmXX <> 0 then begin
              KdSps  := FieldByName('KdSps').AsInteger;
              EsvSps := KdSps;

              n_KdTemu := FieldByName('KdTemu').AsInteger;
              n_KdObj  := FieldByName('KdObj').AsInteger;
              n_KdKatP := FieldByName('KdKatP').AsInteger;

              // n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
              // 26.6.2026
              // Анжела, Оксана: брать базовый счёт (вроде как из Перемещ.)
              n_KdSpZ := PrimAccId;

              nPRR     := FieldByName('PRR').AsInteger;
              cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

              TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, EsvSps, n_KdTemu,
                n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');

              cMyNotes := 'На неё ' + FloatToStr(nPrcE) +
                                           '% по ' + cVidXX + ' виду ';

              TblNuAdd(dRMes, dZaMG, 0, 0, cVidDoMinZp, EsvSps, n_KdTemu,
                n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSmDoMinZp, 0, 0,
                cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0, 0, '', '');
            end;
          end;
        end;
      end; // Закончилась разборка-расчёт сумм ДоМинЗп
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.GetSmPfFzSs(nTabN : integer; dZaMG: TDateTime;
                                 var nSmOldPfFzSsCmn, nSmOldPfFzSsDgv : double);
begin
  nSmOldPfFzSsCmn := 0;
  nSmOldPfFzSsDgv := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select KdKatP, sum(Summa) as SMM from Z_NU ' +
            ' where TabN = :nTabN and ZaMesGod = :dZaMG and ' +
            ' VidN >= "6301" and VidN <= "6502" group by KdKatP');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dZaMG').AsDateTime := dZaMG;
    Open;
    while not Eof do begin
      if FieldByName('KdKatP').AsInteger <> 13 then
        nSmOldPfFzSsCmn := nSmOldPfFzSsCmn - FieldByName('SMM').AsFloat
      else
        nSmOldPfFzSsDgv := nSmOldPfFzSsDgv - FieldByName('SMM').AsFloat;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.SetSvPorogi(nSmFor, nSmPfMax, nSmECmnFor, nSmEPpsFor,
                                   nSmEBlnFor, nSmEDkrFor, nSmEDgvFor : double;
                 var nSvPECmn, nSvPEPps, nSvPEBln, nSvPEDkr, nSvPEDgv : double);
var nSmOst, nSmSvP : double;
begin
  nSvPECmn := 0; // Если nSmForXX > nSmPfMax, то нужно на СверхПорог спурхать
  nSvPEPps := 0; // больничные, затем декретные, затем договорные, затем общие,
  nSvPEBln := 0; // затем ППС'овские (видимо т.к. на ППС-суммы самый большой
  nSvPEDgv := 0; //                                        процент отчислений)
  if nSmFor > nSmPfMax then begin
    nSmOst := nSmFor;
    nSmSvP := nSmOst - nSmPfMax;
    if nSmSvP > 0 then begin
      if nSmEBlnFor >= nSmSvP then
        nSvPEBln := nSmSvP
      else
        nSvPEBln := nSmEBlnFor;
      nSmSvP := nSmSvP - nSvPEBln;
    end;
    if nSmSvP > 0 then begin
      if nSmEDkrFor >= nSmSvP then
        nSvPEDkr := nSmSvP
      else
        nSvPEDkr := nSmEDkrFor;
      nSmSvP := nSmSvP - nSvPEDkr;
    end;
    if nSmSvP > 0 then begin
      if nSmEDgvFor >= nSmSvP then
        nSvPEDgv := nSmSvP
      else
        nSvPEDgv := nSmEDgvFor;
      nSmSvP := nSmSvP - nSvPEDgv;
    end;
    if nSmSvP > 0 then begin
      if nSmECmnFor >= nSmSvP then
        nSvPECmn := nSmSvP
      else
        nSvPECmn := nSmECmnFor;
      nSmSvP := nSmSvP - nSvPECmn;
    end;
    if nSmSvP > 0 then begin
      if nSmEPpsFor >= nSmSvP then
        nSvPEPps := nSmSvP
      else
        nSvPEPps := nSmEPpsFor;
      //nSmSvP := nSmSvP - nSvPEPps;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetSm1517(nSmCmnFX, nSmDgvFX, nSmMin10 : double;
                           var nSmCmn15, nSmCmn17, nSmDgv15, nSmDgv17 : double);
var nSmOst : double;
begin
  nSmOst := nSmCmnFX + nSmDgvFX;
  nSmCmn15 := nSmCmnFX;
  nSmDgv15 := nSmDgvFX;
  if nSmOst > nSmMin10 then begin
    nSmDgv17 := nSmOst - nSmMin10;
    if nSmDgv17 > nSmDgvFX then
      nSmDgv17 := nSmDgvFX;
    nSmDgv15 := nSmDgvFX - nSmDgv17;
    nSmOst := nSmOst - nSmDgv17;
    if nSmOst > nSmMin10 then begin
      nSmCmn17 := nSmOst - nSmMin10;
      if nSmCmn17 > nSmCmnFX then
        nSmCmn17 := nSmCmnFX;
      nSmCmn15 := nSmCmnFX - nSmCmn17;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.R_PdNlg(nTabN : integer; dRMes : TDateTime);
var cVidXX : string4;
    dZaMG : TDateTime;
    cZaMG : ShortString;
    nSmOldPfFzSsCmn, nSmOldPfFzSsDgv, nSmXX, nSmXXUdeln, nSmLg : double;
    nSmPorc, nSmOst : double;
    nSmUdEsvCmn, nSmUdEsvPps, nSmUdEsvBln, nSmUdEsvDgv, nSmMin10 : double;
    nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11 : double;
    nSmCmnFX, nSmCmn15, nSmCmn17, nSmDgvFX, nSmDgv15, nSmDgv17 : double;
    nKtIzmSmForXX : double; // к-т изменения nSmCmnFX при наличии льгот и др.
    nSvSmForXX : double;    // Сохранённая сумма nSmCmnFX
    nCntRecCmn, nCntRecDgv : SmallInt;
    nSmProcLg : double;   // процент льготы из Z_Pere (с 08-2010 - из Z_Lgotu)
                          // (с 11-2006 на конец месяца)
    nCntChld10_11 : SmallInt;
    nFixCntChld : SmallInt;
    n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ, nPRR,
                                              nSvCdsNR1, nSvCdsNR2 : integer;
    nNumPorc : integer;
    nOldSmCmnFX, nOldSmDgvFX, nNewSmCmnFX, nNewSmDgvFX,
    nOldSmCmnXX, nOldSmDgvXX, nNewSmCmnXX, nNewSmDgvXX : double;
    cSchBU : ShortString;
    nSmDbg : double;
begin
  // из cdsOKS выбирать по-месячно информацию о начисленных и удержанных
  // суммах, если надо пересчитывать и делать записи о суммах в tblNU
  // 11-10-2008
  // Добавил в cdsOKS поле SmDgv, в которое выбираю отдельно суммы
  // по "договорным" видам. На них не распространяется льгота.
  //
  // С 01-01-2011
  // Суммы по договорным видам (1006 и 1005,1008) теперь
  // собираем в одну кучу - (просто ***Dgv***)
  //
  // СуммаДляПодоходного сравнивается с СуммойДесятиПрожиточныхМи-
  // нимумовНаНачалоГода, Меньшая чать облагается процентом PrcPdn, а превышаю-
  // щая - процентом PrcPdn2 из таблицы Z_TPdn
  //
  cVidXX := '6001';  // Подоходный налог
  //GetSmForPdn(dRMes, nOldSmCmnFX, nOldSmDgvFX, nNewSmCmnFX, nNewSmDgvFX,
  //                        nOldSmCmnXX, nOldSmDgvXX, nNewSmCmnXX, nNewSmDgvXX);
  with cdsOKS do begin
    First;
    while not Eof do begin
      dZaMG := FieldByName('ZaMesGod').AsDateTime;
      cZaMG := FieldByName('ZaMesGod').AsString;
      if (dRMes <> d_DtCtrl) and (LbxPeriodu.Items.IndexOf(cZaMG) < 0) and
                                                      (dZaMG < dRMes) then begin
        Next;
        Continue;
      end;
      GetSmForPdn(dZaMG, nOldSmCmnFX, nOldSmDgvFX, nNewSmCmnFX, nNewSmDgvFX,
                           nOldSmCmnXX, nOldSmDgvXX, nNewSmCmnXX, nNewSmDgvXX);
      nSmCmnFX := nNewSmCmnFX;
      nSmCmn15 := 0;
      nSmCmn17 := 0;
      nSmDgvFX := nNewSmDgvFX;
      nSmDgv15 := 0;
      nSmDgv17 := 0;
      nCntRecCmn := 0;
      nCntRecDgv := 0;
      nSvCdsNR1 := FieldByName('NR').AsInteger;
      while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
        if (FieldByName('sNwPdnC').AsFloat <> 0) then
          Inc(nCntRecCmn);
        if (FieldByName('sNwPdnD').AsFloat <> 0) then
          Inc(nCntRecDgv);
        Next;
      end;
      nSvCdsNr2 := FieldByName('NR').AsInteger; // чтобы вернуться сюда же
                                       // после распределения на порции по ОКС
      // Определить необходимые параметры в таблице z_TPdn) на dZaMG
      GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
                                     nProgMinCM, nPrgLg, nProcLg, nSm2660,
                                                 nSmLg100, nSmLg150, nSmLg200);
      nSmMin10 := 10 * nMinZpNG;
      // Сколько удержано в ЕСВ и прочие ПФы
      GetSmPfFzSs(nTabN, dZaMG, nSmOldPfFzSsCmn, nSmOldPfFzSsDgv);
      GetSmEsv(dZaMG, nSmUdEsvCmn, nSmUdEsvPps, nSmUdEsvBln, nSmUdEsvDgv);
      nSmLg := 0;
      nFixCntChld := 2;
      c_OznPilg := '';
      DmMain.GetSmPrcLgt(nTabN, dRMes, nCntChld10_11, {льгота}
                    nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11, c_OznPilg);
      if (nCntChld10_11 < nFixCntChld) then begin
        if nSmCmnFX < nPrgLg then begin
          nSmProcLg := nSmPrcLgtSotr + nSmPrcLgtChld11;
          nSmLg := nSmLg100 * nSmProcLg / 100;
        end; end
      else if (nCntChld10_11 >= nFixCntChld) then begin
        if nSmCmnFX < (nCntChld10_11 * nPrgLg) then begin
          nSmProcLg := nSmPrcLgtSotr + nSmPrcLgtChld10 + nSmPrcLgtChld11;
          nSmLg := nSmLg100 * nSmProcLg / 100;
        end;
      end;
      nSvSmForXX := nSmCmnFX;
      // К общим видам возможно применение льготы (к договорным не применяется)
      nSmCmnFX := nSmCmnFX - nSmLg;
      if nSmLg <= 0 then
        c_OznPilg := '';  // льгота хотя имеется, но не применялась
      // Уменьшаю суммы для расчета ПДН на сумму удержаний в ЕСВ
      if dZaMG < dMesPeremen then
        nSmCmnFX := nSmCmnFX -
                    (nSmUdEsvCmn + nSmUdEsvPps + nSmUdEsvBln)
      else
        nSmCmnFX := nSmCmnFX -
                    (nSmOldPfFzSsCmn + nSmUdEsvCmn + nSmUdEsvPps + nSmUdEsvBln);
      if (d_DtCtrl >= dDt11_09_01) and (dZaMG >= dDt11_09_01) then
        nSmDgvFX := nSmDgvFX - nSmUdEsvDgv; {раньше nSmUdEsvDgv не вычитался}
      if nSmDgvFX < 0 then
        nSmDgvFX := 0;
      // Разбиваю суммы nSmCmnFX и nSmDgvFX на 15% и 17% части
      nSmCmn15 := nSmCmnFX;
      nSmCmn17 := 0;
      nSmDgv15 := nSmDgvFX;
      nSmDgv17 := 0;
      if (nSmCmnFX + nSmDgvFX) > nSmMin10 then
        GetSm1517(nSmCmnFX, nSmDgvFX, nSmMin10,
                                   nSmCmn15, nSmCmn17, nSmDgv15, nSmDgv17);
      if nSmCmnFX > 0 then begin
//        Locate('NR', nSvCdsNR1, []);//Стал на 1-ю запись в рассматриваемом ЗаМГ
//        nSvCdsNr2 := FieldByName('NR').AsInteger; // чтобы вернуться сюда же
//                                       // после распределения на порции по ОКС
        // Дальше рассчитываю отдельно налоги по общим видам и по договорным
        if nSmCmnFX < 0 then
          nSmCmnFX := 0;
        if nSmCmnFX > 0 then begin
          nKtIzmSmForXX := nSmCmnFX / nSvSmForXX;
          nSmXX := RoundTo((nPrcPdn/100 * nSmCmn15), -2);
          if (nPrcPdn2 <> 0) and (nSmCmn17 <> 0) then
            nSmXX := nSmXX + RoundTo((nPrcPdn2/100 * nSmCmn17), -2);
          nSmXXUdeln := nSmXX / nSmCmnFX;
          if nSmXX <> 0 then begin
            Locate('NR', nSvCdsNR1, []);//Стал на 1-ю зап. в рассматриваемом ЗаМГ
            nNumPorc := 0;
            nSmOst := nSmXX;
            while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and
                                                                not Eof do begin
              if (FieldByName('sNwPdnC').AsFloat <> 0) then begin
                Inc(nNumPorc);
                if nNumPorc < nCntRecCmn then begin
                  nSmPorc := RoundTo(FieldByName('sNwPdnC').AsFloat *
                                                             nSmXXUdeln, -2);
                  nSmPorc := RoundTo(nSmPorc * nKtIzmSmForXX, -2);
                  nSmOst := nSmOst - nSmPorc; end
                else
                  nSmPorc := RoundTo(nSmOst, -2);
                if nSmPorc <> 0 then begin
                  n_KdSps  := FieldByName('KdSps').AsInteger;
                  n_KdTemu := FieldByName('KdTemu').AsInteger;
                  n_KdObj  := FieldByName('KdObj').AsInteger;
                  n_KdKatP := FieldByName('KdKatP').AsInteger;
                  nPRR     := FieldByName('PRR').AsInteger;
                  n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
                  cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
                  
                  TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdTemu,
                    n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmPorc, 0, 0,
                    cSchBU, 'общ.', 'Cmn', '', '', c_OznPilg, 0, 0, 0, '', '');
                end;
              end;
              Next;
            end;
          end;
        end;
      end;
      if nSmDgvFX > 0 then begin // Рассчитываю подоходный с договорных видов
        nSmXX := RoundTo(nPrcPdn/100 * nSmDgv15, -2);
        if (nPrcPdn2 <> 0) and (nSmDgv17 <> 0) then
          nSmXX := nSmXX + RoundTo(nPrcPdn2/100 * nSmDgv17, -2);
        if nSmXX <> 0 then begin
          Locate('NR', nSvCdsNR1, []); // Стал на 1-ю запись в рассматриваемом ЗаМГ

          nSmXXUdeln := nSmXX / nSmDgvFX;
          nNumPorc := 0;
          nSmOst := nSmXX;
          while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
            nSmDbg := FieldByName('sNwPdnD').AsFloat;
            if (nSmDbg <> 0) then begin
              Inc(nNumPorc);
              if nNumPorc < nCntRecDgv then begin
                nSmPorc := RoundTo(nSmDbg * nSmXXUdeln, -2);
                nSmOst := nSmOst - nSmPorc; end
              else
                nSmPorc := RoundTo(nSmOst, -2);
              if nSmPorc <> 0 then begin
                n_KdSps  := FieldByName('KdSps').AsInteger;
                n_KdTemu := FieldByName('KdTemu').AsInteger;
                n_KdObj  := FieldByName('KdObj').AsInteger;
                n_KdKatP := FieldByName('KdKatP').AsInteger;
                nPRR     := FieldByName('PRR').AsInteger;
                n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
                cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

                TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdTemu,
                  n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmPorc, 0, 0,
                  cSchBU, 'дгв.', 'Dgv', '', '', '', 0, 0, 0, '', '');
              end;
            end;
            Next;
          end;
        end;
        if not Eof then
          Locate('NR', nSvCdsNR2, [])
        else
          Break;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.R_WSb(nTabN: integer; dRMes: TDateTime);
var n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpz, nPRR : SmallInt;
    cVidXX : string4;
    dZaMG : TDateTime;
    cFldNm, cZaMG : ShortString;
    nSvCdsNr1, nSvCdsNr2, nCntPorcInZaMG, nNumPorc : integer;
    nSmForXX, nSmXX, nSmXXUdeln, nSmPorc, nSmOst : double;
    nOldSm, nNewSm : double;
    nOldSmForXX, nNewSmForXX, nOldSmXX, nNewSmXX : double;
    cSchBU : ShortString;
begin
  if dRMes < d_MesBegWSb then begin
    with cdsNwSm do begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
    nOldSm := 0;
    nNewSm := 0;
    with tblNU do begin
      First;
      while not Eof do begin
        if (FieldByName('VidN').AsString < '6000') and
                          (FieldByName('SWSb').AsString = '1') then begin
          dZaMG    := FieldByName('ZaMesGod').AsDateTime;
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          if not cdsNwSm.Locate(
                         'DtPrc;ZaMesGod;KdSps;KdTemu;KdObj;KdKatP;KdSpZ;PRR',
                            VarArrayOf([dRMes, dZaMG, n_KdSps, n_KdTemu,
                             n_KdObj, n_KdKatP, n_KdSpZ, nPRR]), []) then begin
            cdsNwSm.Append;
            cdsNwSm.FieldByName('DtPrc').AsDateTime := dRMes;
            cdsNwSm.FieldByName('ZaMesGod').AsDateTime := dZaMG;
            cdsNwSm.FieldByName('KdSps').AsInteger  := n_KdSps;
            cdsNwSm.FieldByName('KdTemu').AsInteger := n_KdTemu;
            cdsNwSm.FieldByName('KdObj').AsInteger  := n_KdObj;
            cdsNwSm.FieldByName('KdKatP').AsInteger := n_KdKatP;
            cdsNwSm.FieldByName('KdSpZ').AsInteger  := n_KdSpZ;
            cdsNwSm.FieldByName('PRR').AsInteger    := nPRR; end
          else
            cdsNwSm.Edit;
          cdsNwSm.FieldByName('OldSm').AsFloat :=
                  cdsNwSm.FieldByName('OldSm').AsFloat +
                      FieldByName('OldSm').AsFloat;
          cdsNwSm.FieldByName('NewSm').AsFloat :=
                  cdsNwSm.FieldByName('NewSm').AsFloat +
                      FieldByName('Summa').AsFloat;
          cdsNwSm.FieldByName('SmFor').AsFloat :=
                  cdsNwSm.FieldByName('NewSm').AsFloat -
                      cdsNwSm.FieldByName('OldSm').AsFloat;
          cdsNwSm.Post;
          nOldSm := nOldSm + FieldByName('OldSm').AsFloat;
          nNewSm := nNewSm + FieldByName('Summa').AsFloat;
        end;
        Next;
      end;
    end;
    if bFlagDbg then
      cdsNwSm.SaveToFile(cDirTemp + 'NwSm.cds');
    with cdsNwSm do begin
      First;
      while not Eof do begin
        nSmForXX := FieldByName('SmFor').AsFloat;
        if nSmForXX > 0 then begin
          nSmXX    := SumWSb(nTabN, cVidXX, dRMes, nSmForXX);
          dZaMG    := FieldByName('ZaMesGod').AsDateTime;
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdTemu := FieldByName('KdTemu').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dZaMG, 0, 0, '6007', n_KdSps, n_KdTemu,
            n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
            cSchBU, '', '', '', '', '', 0, 0, 0, '', '');
        end;
        
        Next;
      end;
    end; end
  else with cdsOKS do begin
//    GetSmForWSb(dRMes, nOldSmForXX, nNewSmForXX, nOldSmXX, nNewSmXX);
//    GetSmForWSb(dZaMG, nOldSmForXX, nNewSmForXX, nOldSmXX, nNewSmXX);
    First;
    while not Eof do begin
      dZaMG := FieldByName('ZaMesGod').AsDateTime;
      cZaMG := FieldByName('ZaMesGod').AsString;
      GetSmForWSb(dZaMG, nOldSmForXX, nNewSmForXX, nOldSmXX, nNewSmXX);
      if {not cdsOksMetka.AsBoolean or}
          (dRMes <> d_DtCtrl) and (LbxPeriodu.Items.IndexOf(cZaMG) < 0) and
                                                      (dZaMG < dRMes) then begin
        Next;
        Continue;
      end;
      nSmForXX := nNewSmForXX;
      nSvCdsNr1 := FieldByName('NR').AsInteger;
      nCntPorcInZaMG := 0;
      cFldNm := 'sNwWSb';
      while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
        if (FieldByName(cFldNm).AsFloat <> 0) and
             ((FieldByName('DtPrc').AsDateTime = d_DtCtrl) or
                ((FieldByName('DtPrc').AsDateTime >= d_MesBegWSb) and
                                            (dZaMG >= d_MesBegWSb))) then begin
          Inc(nCntPorcInZaMG);
          //nSmForXX := nSmForXX + FieldByName(cFldNm).AsFloat;
        end;
        Next;
      end;
      if nSmForXX <> 0 then begin  ///////////////////////////////////
        nSvCdsNr2 := FieldByName('NR').AsInteger;
        nSmXX := SumWSb(nTabN, cVidXX, dRMes, nSmForXX);
        //======  расчет общей суммы WSbora  =====//
        nSmXXUdeln := nSmXX / nSmForXX;
        Locate('NR', nSvCdsNr1, []);
        nNumPorc := 0;
        nSmOst := nSmXX;
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
          if (FieldByName(cFldNm).AsFloat <> 0) and
             ((FieldByName('DtPrc').AsDateTime = d_DtCtrl) or
                ((FieldByName('DtPrc').AsDateTime >= d_MesBegWSb) and
                                            (dZaMG >= d_MesBegWSb))) then begin
            Inc(nNumPorc);
            if nNumPorc < nCntPorcInZaMG then begin
              nSmPorc := RoundTo(FieldByName(cFldNm).AsFloat * nSmXXUdeln,-2);
              nSmOst := nSmOst - nSmPorc; end
            else
              nSmPorc := RoundTo(nSmOst, -2);
            if nSmPorc <> 0 then begin
              n_KdSps  := FieldByName('KdSps').AsInteger;
              n_KdTemu := FieldByName('KdTemu').AsInteger;
              n_KdObj  := FieldByName('KdObj').AsInteger;
              n_KdKatP := FieldByName('KdKatP').AsInteger;
              n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
              nPRR     := FieldByName('PRR').AsInteger;
              cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

              TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdTemu,
                n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmPorc, 0, 0,
                cSchBU, '', '', '', '', '', 0, 0, 0, '', '');
            end;
          end;
          Next;
        end;
        if not Eof then
          Locate('NR', nSvCdsNr2, [])
        else
          Break;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.SumWSb(nTabN: integer; var cVidN: string4; dRMes: TDateTime;
                                                      nSmForXX: double): double;
var nPrcWSb : double;
begin
  cVidN := '6007';
  nPrcWSb := GetPrcWSb(dRMes);
//  if dRMes >= d_MesBegWSb then
    Result := RoundTo(nPrcWSb * nSmForXX / 100, -2);
//  else
//    Result := 0;
end;
//------------------------------------------------------------------------------
function TFormRs5.GetPereKdSpZ(dDtMes : TDateTime) : integer;
begin
  Result := 0;
  with qryPere do begin
    First;
    while not Eof do begin
      Result := FieldByName('KdSpZ').AsInteger;
      if FieldByName('Dt_Beg').IsNull or
               (FieldByName('Dt_Beg').AsDateTime <= dDtMes) then
        Break;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmEsv(dZaMG: TDateTime; var nSmUdEsvCmn,
                                 nSmUdEsvPps, nSmUdEsvBln, nSmUdEsvDgv: double);
var cVidN : string4; // определить суммы nSmUdEsv***, начисленные в tblNU и
begin                // приходящиеся на заданный dZaMesGod
  nSmUdEsvCmn := 0;
  nSmUdEsvPps := 0;
  nSmUdEsvBln := 0;
  nSmUdEsvDgv := 0;
  with tblNU do begin
    DisableControls;
    First;
    while not Eof do begin
      if (FieldByName('PdN').AsInteger > 0) then begin
        if tblNu.FieldByName('ZaMesGod').AsDateTime = dZaMG then begin
          cVidN := tblNu.FieldByName('VidN').AsString;
          if (cVidN = '6201') and
                 (FieldByName('MyNotes').AsString <> 'Not') then
            nSmUdEsvCmn := nSmUdEsvCmn - tblNu.FieldByName('Summa').AsFloat
          else if (cVidN = '6206') and
                 (FieldByName('MyNotes').AsString <> 'Not') then
            nSmUdEsvPps := nSmUdEsvPps - tblNu.FieldByName('Summa').AsFloat
          else if (cVidN = '6211') and
                 (FieldByName('MyNotes').AsString <> 'Not') then
            nSmUdEsvBln := nSmUdEsvBln - tblNu.FieldByName('Summa').AsFloat
          else if (cVidN = '6216') and
                 (FieldByName('MyNotes').AsString <> 'Not') then
            nSmUdEsvDgv := nSmUdEsvDgv - tblNu.FieldByName('Summa').AsFloat;
        end;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.CreOpenOldNU(nTabN : integer; dRMes : TDateTime);
var cInSQL : string; i : integer; cVidN, cRMes, c_SchBU : ShortString;
    mList : TStringList;
    bBadKdSpZ, bMesDoPeremen, bNotMesInLbxPeriodu : boolean;

    nNewKdSpZ : SmallInt; dNuDtZaMG : TDateTime;
    dDtPrc, dZaMG : TDateTime; cVidFor : ShortString;
    nStep, n_KdSps, n_KdTemu, n_KdKatP, n_KdObj, nPRR, n_KdSpZ : SmallInt;
    nSmm, nSmECmnF, nSmEPpsF, nSmEBlnF, nSmEDkrF, nSmEDgvF, nSmForPdnCmn,
                                   nSmForPdnDgv, nSmForWSb, nSmForPrfs : double;
    nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv : double;
begin
  cdsOks2.Close;
  cdsOks3.Close;
  nStep := 1;
  with tblNu do begin
    if Active then Close;
    TableName := cNmTblNU;
    IndexDefs.Clear;
    IndexName := '';
    Filtered := false;
    TableType := ttParadox;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
  end;

  nMaxNuNR := 0;

  if dRMes = d_DtCtrl then begin  // Расчетный месяц
    cInSQL := '';
    mList := TStringList.Create;
    cRMes := DateToStr(dRMes);
    mList.Add(cRMes);   // dRMes обязан быть всегда
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from Z_Otkl where TabN = :nTabN and ' +
              ' (DtProc = :dRMes or DtStorn = :dRMes) and ' +
              ' (not VidN in ("8801","8802"))'); // 8801 и 8802 (указания на
              //пересчёт) свое дело сделали при создании периодов и тут не нужны
      ParamByName('nTabN').AsInteger  := nTabN;
      ParamByName('dRMes').AsDateTime := dRMes;
      Open;
      while not Eof do begin                         // Это CreOpemOldNU
        // в cInSQL включать только прошлые месяцы, не фигурирующие в LbxPeriodu
        if (FieldByName('PdN').AsInteger > 0) then begin
          if (LbxPeriodu.Items.IndexOf(FieldByName('ZaMesGod').AsString) < 0) and
                   (mList.IndexOf(FieldByName('ZaMesGod').AsString) < 0) then
            mList.Add(FieldByName('ZaMesGod').AsString);
        end;
        Next;
      end;
      cInSQL := 'in (';
      for i := 0 to mList.Count-1 do begin
        cInSQL := cInSQL + '"' + FormatDateTime('mm"/"dd"/"yyyy',
                                                StrToDate(mList[i])) + '"';
        if i < (mList.Count-1) then
          cInSQL := cInSQL + ',';
      end;
      cInSQL := cInSQL + ')';
      mList.Destroy;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
  end;

  QryUtils.InitQuery(QryTmp);

  with QryTmp do begin
    // Открыть "старые" начисления
    SQL.Add(
      'select n.NR, n.DtProc, n.ZaMesGod, n.TabN, n.VidN, ndb.Grp, ' +
        'n.Chas as OldCh, n.Summa as OldSm, n.Dt_Beg, n.Dt_End, ' +
        'n.KdSps, n.KdTemu, n.KdObj, n.KdKatP, n.KdSpZ, n.SchBU, n.PSch, ' +
        'n.PdN, n.Notes, n.PRR, n.PrPV, n.Kto, n.PrKr, n.MyNotes, n.SpecPs, ' +
        'n.Spec_NR,  Cast(0 as Float) as Chas, ' +
        'Cast(0 as Float) as Summa, n.DtVdPV, n.NrVdPV, ' +
        'Cast(0 as Float) as d_Ch, Cast(0 as Float) as d_Sm, ' +
        'n.Ozn_Pilg, n.KdBnk, v.*, ndb.Prc_WT, n.Storn, n.NuSovm ' +
      'from ViNuMain n ' +
        'left join z_KdVidN v on v.VidN = n.VidN ' +
        'left join z_Nadb ndb on ndb.TabN = n.TabN ' +
          'and ndb.Spec_NR = n.Spec_NR ' +
          'and ndb.VidN = n.Vidn ' +
      'where (n.TabN = :nTabN) ' +
        'and (n.VidN < "7500" or n.VidN > "7600") ' +
        // без видов выплат (7500-7600), алиментов, переводов, ПСб и ДлгТМ
        'and not n.VidN in ("6601", "6602", "6611", "6612", "2724") '
    );

    if dRMes < d_20110101 then // все что связано с ПФ, ФЗ, ТВП, НВ, ЕСВ
      // не выбираю т.к. для таких месяцев ЕСВ считается только по дельтам sNw***
      SQL.Add(
        'and not (n.VidN >= "6201" and n.VidN <= "6502") ' +
        'and not (n.VidN >= "8601" and n.VidN <= "8604") ' +
        'and not (n.VidN >= "8611" and n.VidN <= "8691") '
      );

    if dRMes = d_DtCtrl then
      SQL.Add('and n.DtProc < :dRMes and n.ZaMesGod ' + cInSQL)
    else begin
      SQL.Add('and n.ZaMesGod = :dRMes and n.DtProc < :d_DtCtrl');

      if dRMes < d_MesBegWSb then
        // чтобы ВСбор вид 6007 брался только с начисленного
        // в расчётном месяце (d_DtCtrl)
        SQL.Add('and not (VidN = "6007" and n.DtProc < :d_DtCtrl)');
    end;

    SQL.Add('order by n.ZaMesGod, n.VidN');

    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('dRMes').AsDateTime := dRMes;
    if dRMes <> d_DtCtrl then
      ParamByName('d_DtCtrl').AsDateTime := d_DtCtrl;
    Open;

    tblNu.BatchMove(qryTmp, BatCopy);
{$IFDEF WAR_ZPL}
    // Война не вычитает начисления прошлых месяцев,
    // потому что они не совпадают по периоду с текущими.
    // Так что, чистим всё что загрузили batch move'ом
// NEW APROACH <--
//    TblNu.EmptyTable;
// --> NEW APROACH
{$ENDIF}
    tblNu.AddIndex('', 'NR', [ixPrimary]);
    tblNu.AddIndex('ZaMgVidN', 'VidN;Spec_NR', []);
    tblNu.IndexName := 'ZaMgVidN';
    tblNu.Open;

    Close;
    SQL.Clear;
    DataBaseName := '';
  end;

  with tblNu do begin
    DisableControls;
    if dRMes = d_DtCtrl then begin
      while not Eof do begin  // надо следить за полем NR, т.к. по нему ixPrimary
        nMaxNuNR := Max(nMaxNuNR, FieldByName('NR').AsInteger);
        dNuDtZaMG := FieldByName('ZaMesGod').AsDateTime;
        cVidN := FieldByName('VidN').AsString;
        bMesDoPeremen := dNuDtZaMG < dMesPeremen;
        bNotMesInLbxPeriodu := (dNuDtZaMG < dRMes) and
               (LbxPeriodu.Items.IndexOf(FieldByName('ZaMesGod').AsString) < 0);
        nNewKdSpZ := 0;
        bBadKdSpZ := FieldByName('KdSpZ').IsNull or
                                        (FieldByName('KdSpZ').AsInteger <= 0);
        if bBadKdSpZ then
          nNewKdSpZ := GetPereKdSpZ(dNuDtZaMG); // взять из местного qryPere
        if bBadKdSpz or bMesDoPeremen or bNotMesInLbxPeriodu then begin
          Edit;
          if bBadKdSpZ then                     // заменить на новый
            FieldByName('KdSpZ').AsInteger := nNewKdSpZ;
          if bNotMesInLbxPeriodu and
              ((cVidN < '6000') {начисления} or
                  ((cVidN > '7500') and (cVidN < '7600')) {выплаты} ) then
            FieldByName('Summa').AsFloat := FieldByName('OldSm').AsFloat;
            // т.к. начисления и выплаты пересчитываться не будут (начисления
            // только могут как-то измениться из ObrOtkl), а вот удержания
            // должны пересчитываться
          Post;
        end;
        Next;
      end;
    end else begin  // перерасчет месяца
      while not Eof do begin // надо следить за полем NR, т.к. по нему ixPrimary
        nMaxNuNR := Max(nMaxNuNR, FieldByName('NR').AsInteger);
        dNuDtZaMG := FieldByName('ZaMesGod').AsDateTime;
        cVidN := FieldByName('VidN').AsString;
        bMesDoPeremen := dNuDtZaMG < dMesPeremen;
        bNotMesInLbxPeriodu := (dNuDtZaMG < dRMes) and
               (LbxPeriodu.Items.IndexOf(FieldByName('ZaMesGod').AsString) < 0);
        nNewKdSpZ := 0;
        bBadKdSpZ := FieldByName('KdSpZ').IsNull or
                                        (FieldByName('KdSpZ').AsInteger <= 0);
        if bBadKdSpZ then
          nNewKdSpZ := GetPereKdSpZ(dNuDtZaMG); // взять из местного qryPere
        if bBadKdSpz or bMesDoPeremen or bNotMesInLbxPeriodu then begin
          Edit;
          if bBadKdSpZ then                     // заменить на новый
            FieldByName('KdSpZ').AsInteger := nNewKdSpZ;
          if bMesDoPeremen and (cVidN > '6000') then
            FieldByName('Summa').AsFloat := FieldByName('OldSm').AsFloat;
            // присвоение суммы введено из след. "соображений":
            // т.к. месяцы до dMesPeremen не подлежат автоПересчету, то
            //   - новые УДЕРЖАНИЯ по ним принимаю равными старым,
            //   - новые НАЧИСЛЕНИЯ должны попасть из ObrOtkl
            // Пока вроде сошлось, дальше посмотрю.
          if bNotMesInLbxPeriodu then
            FieldByName('Summa').AsFloat := FieldByName('OldSm').AsFloat;
          Post;
        end;
        Next;
      end;
    end;

    EnableControls;
    SetTblNuFilter;
  end;
  // теперь с cdsOks вклиниваюсь тут (в новом "понимании")
  with cdsOks do begin
    if Active then begin
      //SaveToFile(cDirTemp + 'cdsOks2.cds');
      Close;
    end;
    IndexName := '';
    IndexDefs.Clear;
    CreateDataSet;
    Open;
    AddIndex('OksMSOKSP','ZaMesGod;DtPrc;KdSps;KdTemu;KdObj;KdKatP;KdSpZ;PRR',[]);
    IndexName := 'OksMSOKSP';  {ЗаМесяц;ДтПрц;Список;Obj;KatP;ShZ;PRR}
  end;
  with tblNu do begin
    First; // tblNU
    while not Eof do begin
      nSmECmnF     := 0;
      nSmEPpsF     := 0;
      nSmEBlnF     := 0;
      nSmEDkrF     := 0;
      nSmEDgvF     := 0;
      nSmForPdnCmn := 0;
      nSmForPdnDgv := 0;
      nSmForWSb    := 0;
      nSmForPrfs   := 0;
      n_KdSps      := FieldByName('KdSps').AsInteger;
      n_KdTemu     := FieldByName('KdTemu').AsInteger;
      n_KdObj      := FieldByName('KdObj').AsInteger;
      n_KdKatP     := FieldByName('KdKatP').AsInteger;
      nPRR         := FieldByName('PRR').AsInteger;
      n_KdSpZ      := FieldByName('KdSpZ').AsInteger;
      cVidN := FieldByName('VidN').AsString;
      if (cVidN < '5000') then begin       // только начисления
        dDtPrc := FieldByName('DtProc').AsDateTime;
        dZaMG  := FieldByName('ZaMesGod').AsDateTime;
        nSmm := FieldByName('OldSm').AsFloat;
        if n_KdSpZ = 0 then
          n_KdSpZ := GetPereKdSpZ(dZaMG); // nKdSpZ взять из местного qryPere
        if (FieldByName('SP_PF').AsString = '1') then begin
          if (cVidN = '1006') or (cVidN = '1005') or (cVidN = '1008') then
            nSmEDgvF := nSmm
          else if (cVidN = '2602') then
            nSmEDkrF := nSmm
          else if (cVidN > '2600') and (cVidN < '2700') then
            nSmEBlnF := nSmm
          else if (n_KdKatP = 1) then
            nSmEPpsF := nSmm
          else
            nSmECmnF := nSmm;
        end;
        if (FieldValues['SPrf'] = '1') then
          nSmForPrfs := nSmm;
        if FieldValues['SPdn'] = '1' then begin
          if (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008') then
            nSmForPdnDgv := nSmm
          else
            nSmForPdnCmn := nSmm;
        end;
        if FieldValues['SWSb'] = '1' then
          nSmForWSb := nSmForWSb + nSmm;
        if (nSmECmnF <> 0) or (nSmEPpsF <> 0) or (nSmEBlnF <> 0) or
               (nSmEDkrF <> 0) or (nSmEDgvF <> 0) or (nSmForPrfs <> 0) or
                        (nSmForPdnCmn <> 0) or (nSmForPdnDgv <> 0) then begin
//          if cdsOKS.Locate('Step;DtPrc;ZaMesGod;KdSps;KdObj;KdKatP;KdSpZ;PRR',
//                            VarArrayOf([nStep,dDtPrc,dZaMG,n_KdSps,n_KdObj,
//                                               n_KdKatP,n_KdSpZ,nPRR]), []) then
          if cdsOKS.Locate('DtPrc;ZaMesGod;KdSps;KdTemu;KdObj;KdKatP;KdSpZ;PRR',
                            VarArrayOf([dDtPrc,dZaMG,n_KdSps,n_KdTemu,n_KdObj,
                                               n_KdKatP,n_KdSpZ,nPRR]), []) then
            cdsOKS.Edit      // Это пишется в ОКС после открытия OldNU
          else begin
            cdsOKS.Append;
            cdsOksStep.AsInteger  := nStep;
            cdsOksMetka.AsBoolean := true;
            cdsOKS.FieldByName('DtPrc').AsDateTime    := dDtPrc;
            cdsOKS.FieldByName('ZaMesGod').AsDateTime := dZaMG;
            cdsOKS.FieldByName('KdSps').AsInteger     := n_KdSps;
            cdsOKS.FieldByName('KdTemu').AsInteger    := n_KdTemu;
            cdsOKS.FieldByName('KdObj').AsInteger     := n_KdObj;
            cdsOKS.FieldByName('KdKatP').AsInteger    := n_KdKatP;
            cdsOKS.FieldByName('KdSPZ').AsInteger     := n_KdSpZ;
            cdsOKS.FieldByName('PRR').AsInteger       := nPRR;
            c_SchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
            cdsOKS.FieldByName('SchBU').AsString      := c_SchBU;
          end;     // Это пишется а ОКС после открытия CreOpenOldNU
          cdsOKS.FieldByName('sForCmn').AsFloat :=
                               cdsOKS.FieldByName('sForCmn').AsFloat + nSmECmnF;
          cdsOKS.FieldByName('sForPps').AsFloat :=
                               cdsOKS.FieldByName('sForPps').AsFloat + nSmEPpsF;
          cdsOKS.FieldByName('sForBln').AsFloat :=
                               cdsOKS.FieldByName('sForBln').AsFloat + nSmEBlnF;
          cdsOKS.FieldByName('sForDkr').AsFloat :=
                               cdsOKS.FieldByName('sForDkr').AsFloat + nSmEDkrF;
          cdsOKS.FieldByName('sForDgv').AsFloat :=
                               cdsOKS.FieldByName('sForDgv').AsFloat + nSmEDgvF;

          cdsOKS.FieldByName('sForPrf').AsFloat :=
                             cdsOKS.FieldByName('sForPrf').AsFloat + nSmForPrfs;
          cdsOKS.FieldByName('sForPdnC').AsFloat :=
                          cdsOKS.FieldByName('sForPdnC').AsFloat + nSmForPdnCmn;
          cdsOKS.FieldByName('sForPdnD').AsFloat :=
                          cdsOKS.FieldByName('sForPdnD').AsFloat + nSmForPdnDgv;
          cdsOKS.FieldByName('sForWSb').AsFloat :=
                              cdsOKS.FieldByName('sForWSb').AsFloat + nSmForWSb;
          cdsOKS.Post;
        end;
      end;
      Next;
    end;
  end;
  cdsOKS.First;
end;

//------------------------------------------------------------------------------
function CanBePartTimeSum(VidN: ShortString): boolean;
begin
  Result := (VidN > '2600') and (VidN <= '2605');
end;

//------------------------------------------------------------------------------
procedure TFormRs5.tblNuBeforePost(DataSet: TDataSet);
begin
  if tblNuNR.IsNull {новая запись} then begin
    Inc(nMaxNuNR);
    tblNuNR.AsInteger := nMaxNuNR;
    // т.к. в новых записях не "видны" поля из таблицы Z_KdVidN - заполняю их
    with DmMain.qryVidN_LU do begin
      if not Active then begin
        DataBaseName := CESMAIN;
        Open;
      end;
      if Locate('VidN', tblNuVidN.AsString, []) then begin
        tblNuShVidN.AsString      := FieldByName('ShVidN').AsString;
        tblNuKdSpz_1.AsString     := FieldByName('KdSpz').AsString;
        tblNuZp13.AsString        := FieldByName('ZP13').AsString;
        tblNuOtp.AsString         := FieldByName('OTP').AsString;
        tblNuBln.AsString         := FieldByName('BLN').AsString;
        tblNuOtpuskn.AsString     := FieldByName('OTPUSKN').AsString;
        tblNuBolnic.AsString      := FieldByName('BOLNIC').AsString;
        tblNuSPrm.AsString        := FieldByName('SPRM').AsString;
        tblNuCPrm.AsString        := FieldByName('CPRM').AsString;
        tblNuDeti.AsString        := FieldByName('DETI').AsString;
        tblNuDetiM.AsString       := FieldByName('DETIM').AsString;
        tblNuDetiK.AsString       := FieldByName('DETIK').AsString;
        tblNuDetiG.AsString       := FieldByName('DETIG').AsString;
        tblNuInd.AsString         := FieldByName('IND').AsString;
        tblNuDhd.AsString         := FieldByName('DHD').AsString;
        tblNuOklFnd.AsString      := FieldByName('OKLFND').AsString;
        tblNuCBudg.AsString       := FieldByName('CBUDG').AsString;
        tblNuSNdb.AsString        := FieldByName('SNDB').AsString;
        tblNuSPdn.AsString        := FieldByName('SPDN').AsString;
        tblNuSWSb.AsString        := FieldByName('SWSb').AsString;
        tblNuSPrf.AsString        := FieldByName('SPRF').AsString;
        tblNuSAlim.AsString       := FieldByName('SALIM').AsString;
        tblNuCNdb.AsString        := FieldByName('CNDB').AsString;
        tblNuSPens.AsString       := FieldByName('SPENS').AsString;
        tblNuSBzr.AsString        := FieldByName('SBZR').AsString;
        tblNuSSocStrah.AsString   := FieldByName('SSOCSTRAH').AsString;
        tblNuSp_PF.AsString       := FieldByName('SP_PF').AsString;
        tblNuSp_FSTVP.AsString    := FieldByName('SP_FSTVP').AsString;
        tblNuSp_FSNV.AsString     := FieldByName('SP_FSNV').AsString;
        tblNuSp_FZ.AsString       := FieldByName('SP_FZ').AsString;

        // Больничные могут распадаться на основную и совместительскую суммы
        // Попробуем совместить признак 'Sovm' для других видов: '1' - совмест. вид
        // с признаком совместительской суммы для больничных: 'Y' - совмест.
        if not CanBePartTimeSum(tblNuVIDN.AsString) then
          tblNuSovm.AsString := FieldByName('Sovm').AsString;
        // else
          // Значение для больничных было присвоено перед вызовом Post.

        tblNuSpov.AsString        := FieldByName('Spov').AsString;
        tblNuKEKV.AsString        := FieldByName('KEKV').AsString;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.TblNuAdd(
  d_DtPrc, dZaMesGod, dDtBeg, dDtEnd : TDateTime;
  cVidN : string4; n_KdSps, n_KdTemu,
  n_KdObj, n_KdKatP, nPdN,
  nPrPV, nPRR, n_KdSpz : integer;
  nChas, nSumma, nPrcWrkTime, nPrcSovm : double;
  cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg : ShortString;
  nGrp, nSpecNR : integer; nKdBnk : SmallInt;
  Sovm, Storn: ShortString);
var bIsInv : boolean; {cMsg : ShortString;}
begin
  if nPrr = 0 then begin
    bIsInv := IsInvalid(n_TN, dZaMesGod);
    if bIsInv and (cVidN <> '1005') and (cVidN <> '1006') and
          (cVidN <> '1008') and (cVidN <> '8611') and (cVidN <> '8671') then
      nPRR := 7;
  end; // с 27-09-2007 Оставляю так. Так, пожалуй, правильно, т.к.
       // иначе плохо объединяются старые и новые записи (Кедик в 09-2007)

  with tblNU do begin
    Append;

    FieldByName('DtProc').AsDateTime   := d_DtPrc;
    FieldByName('ZaMesGod').AsDateTime := dZaMesGod;
    FieldByName('VidN').AsString       := cVidN;
    FieldByName('KdSps').AsInteger     := n_KdSps;
    FieldByName('KdTemu').AsInteger    := n_KdTemu;
    FieldByName('KdObj').AsInteger     := n_KdObj;
    FieldByName('KdKatP').AsInteger    := n_KdKatP;
    FieldByName('PRR').AsInteger       := nPRR;
    if dDtBeg <> 0 then
      FieldByName('Dt_Beg').AsDateTime := dDtBeg;
    if dDtEnd <> 0 then
      FieldByName('Dt_End').AsDateTime := dDtEnd;
    FieldByName('PdN').AsInteger       := nPdN;
    FieldByName('PrPV').AsInteger      := nPrPV;
    FieldByName('KdSPZ').AsInteger     := n_KdSPZ;
    FieldByName('SchBU').AsString      := cSchBU;
    FieldByName('Notes').AsString      := cNotes;
    FieldByName('MyNotes').AsString    := cMyNotes;
    FieldByName('Grp').AsInteger       := nGrp;
    FieldByName('Spec_NR').AsInteger   := nSpecNR;
    FieldByName('DtVdPV').AsString     := cDtVdPV;
    FieldByName('NrVdPV').AsString     := cNrVdPV;
    FieldByName('Prc_WT').AsFloat      := nPrcWrkTime;

    if (dDtBeg <> 0) and (not FieldByName('Dt_Beg').IsNull) then
        FieldByName('Dt_Beg').AsDateTime :=
                                Min(dDtBeg, FieldByName('Dt_Beg').AsDateTime);
    if (dDtEnd <> 0)  and (not FieldByName('Dt_End').IsNull) then
        FieldByName('Dt_End').AsDateTime :=
                                Max(dDtEnd, FieldByName('Dt_End').AsDateTime);
    FieldByName('Chas').AsFloat  := FieldByName('Chas').AsFloat +
                                                            RoundTo(nChas, -2);

    FieldByName('Summa').AsFloat := FieldByName('Summa').AsFloat +
                                                           RoundTo(nSumma, -2);

    FieldByName('Ozn_Pilg').AsString := cOznPilg;
    if nKdBnk > 0 then
      FieldByName('KdBnk').AsInteger := nKdBnk;

    FieldByName('NuSovm').AsString := Sovm;
    FieldByName('Storn').AsString := Storn;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.CreOpenTblMD(nTabN : integer; dRMes : TDateTime;
                                                           cNmtblMd : string);
var dBegPeriod, dDtMes, dDtBegMes, dDtEndMes,
                                    dDtPriemPrp, dDtUvolnPrp : TDateTime;
    nDayOfWeek : byte; nSpec_NR, nTmpSps : integer;
    nCntWorkChas, nPrcWrkTime, nCntSpsBudgChas, nSmMinZp : double;
    bOklIsCmb, bAllBM : boolean; nY, nM, nD : word; nCntDay, nCntWorkDay :integer;
    nSmDummy, nCntWCh : double;
    nOklTrf, nDayOklTrf : double;
begin
  dDtBegMes := dRMes;
  dDtEndMes := MyLastDOM(dRMes);
  if (dRMes > d_DtCtrl) and tblPerioduAllBM.AsBoolean then
    bAllBM := true
  else
    bAllBM := false;
  DecodeDate(dRMes, nY, nM, nD);
  nSmMinZp := GetSmMinZp(dDtEndMes);

  n_WrkChasMes := DmMain.Budget(nY, nM, nCntDay, nCntWorkDay);

  with tblMd do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    TableName := cNmtblMd;
    TableType := ttParadox;
    if Exists then DeleteTable;
    IndexName := '';
    IndexDefs.Clear;
    CreateTable;
    AddIndex('', 'NR', [ixPrimary]);
//    AddIndex('OnDtMes', 'KdSps;DtMes', [ixCaseInsensitive]);
    AddIndex('OnDtMes', 'DtMes', [ixCaseInsensitive]);
    IndexName := 'OnDtMes';
    Open;
  end;
  with qryPere do begin
    First; // Сортирована по Dt_Beg desc, NR desc. (NR desc для того, чтобы,
           // в случае, если вопрут две записи с одной датой, натыкаться на
           // более позднюю) Начальная запись
           // при этом будет последней. DT_END в z_Pere НЕ ЗАПОЛНЯЕТСЯ !!!, т.к.
           // следующая по времени запись отменяет предыдущую
    while not Eof do begin
      if not FieldByName('Dt_Beg').IsNull and
             (FieldByName('Dt_Beg').AsDateTime > dDtEndMes) then begin
        Next;
        Continue;
      end;
      bOklIsCmb := FieldByName('CmbOkl').AsString = '1';

      if FieldByName('PrcWrkTime').IsNull or
                      (FieldByName('PrcWrkTime').AsFloat = 100) then
        nPrcWrkTime := 1
      else
        nPrcWrkTime := FieldByName('PrcWrkTime').AsFloat / 100;
      if FieldByName('Dt_Beg').IsNull then
        dBegPeriod := dRMes
      else
        dBegPeriod := Max(FieldByName('Dt_Beg').AsDateTime, dRMes);
      dDtMes := dDtEndMes; // идем от конца месяца и заполняем по-денно
                            // таблицу tblMd данными из Z_Pere
      while dDtMes >= dBegPeriod do begin
        nDayOfWeek := DayOfWeek(dDtMes);
        if DmMain.cdsEDays.Locate('E_Day', dDtMes, []) then
          nCntWorkChas := DmMain.cdsEDays.FieldByName('Rab_Chas').AsFloat
        else if (nDayOfWeek = 1) or (nDayOfWeek = 7) then
          nCntWorkChas := 0
        else
          nCntWorkChas := 8; // Заменить 8 на перем. TYTYTYT
        if not tblMd.Locate('DtMes', dDtMes, []) then begin
          tblMd.Append;   // in CreOpenTblMD
          tblMdRMes.AsDateTime      := dRMes;
          tblMdDtMes.AsDateTime     := dDtMes;
          if (dRMes > d_DtCtrl) then    // разрешить ПОЛНЫЙ расчет месяца (но
            tblMdAllBM.AsBoolean := bAllBM; // (только ДО начала отпуска или
                        // больничных, если они заканчиваются в этом же месяце)
          tblMdKdSps.AsInteger      := FieldByName('KdSps').AsInteger;
          tblMdKdTemu.AsInteger     := FieldByName('KdTemu').AsInteger;
          tblMdKdObj.AsInteger      := FieldByName('KdObj').AsInteger;
          tblMdKdKatP.AsInteger     := FieldByName('KdKatP').AsInteger;
          tblMdRang.AsInteger       := FieldByName('Rang').AsInteger;
          tblMdRazr.AsInteger       := FieldByName('Razr').AsInteger;
          tblMdSO.AsInteger         := FieldByName('SO').AsInteger;
          tblMdCmbOkl.AsString      := FieldByName('CmbOkl').AsString;
          tblMdSpec_NR.AsInteger    := FieldByName('Spec_NR').AsInteger;
          tblMdPr_Pens.AsInteger    := FieldByName('Pr_Pens').AsInteger;
          tblMdSovm.AsInteger       := FieldByName('Sovm').AsInteger;
          tblMdPrfs.AsInteger       := FieldByName('Prfs').AsInteger;
          tblMdINV.AsFloat          := FieldByName('INV').AsInteger;
          tblMdPdNlg.AsInteger      := FieldByName('PdNlg').AsInteger;
          tblMdKdSPZ.AsInteger      := FieldByName('KdSPZ').AsInteger;
          tblMdProcLG.AsFloat       := FieldByName('ProcLG').AsFloat;

          nSpec_NR := FieldByName('Spec_NR').AsInteger;
          if bOklIsCmb then
            nOklTrf := GetCmbOkl(nSpec_NR)
          else
            nOklTrf := FieldByName('OklTrf').AsFloat;

          nDayOklTrf := nOklTrf / n_WrkChasMes * nCntWorkChas;

          tblMdOklTrf.AsFloat    :=  nOklTrf;
          tblMdDayOklTrf.AsFloat :=  nDayOklTrf;

          nCntWCh := nCntWorkChas;
          nSmDummy := nSmMinZp * nPrcWrkTime / n_WrkChasMes * nCntWCh;
          tblMdSmMinZP.AsFloat := nSmDummy;
          tblMdPrcWrkTime.AsFloat := nPrcWrkTime;
          tblMdCntWrkChs.AsFloat    := nCntWorkChas;
          tblMdRabotalPrp.AsBoolean := false; // сначала ставлю везде FALSE, а
          tblMdRabotalSps.AsBoolean := false; // потом откорректирую по PrmUv
//          tblMDLockBlnOsn.AsInteger := 0;
//          tblMDLockBlnSovm.AsInteger := 0;
          tblMdIsBdgZan.AsBoolean := false; // а если будут бюджетные отклоне-
                                              // ния то поставлю в эти дни TRUE
          tblMd.Post;
        end;
        dDtMes := dDtMes - 1;
      end;
      if dBegPeriod = dRMes then begin
        while not Eof do begin
          Next;
        end; end
      else
        Next;
    end;
  end;
  with qryPrmUv do begin
    First;
    while not Eof do begin
      nTmpSps := FieldByName('KdSps').AsInteger;
      nCntSpsBudgChas := 0;
      while (FieldByName('KdSps').AsInteger = nTmpSps) and not Eof do begin
        dDtPriemPrp := Max(FieldByName('Dt_Priem').AsDateTime, dDtBegMes);
        if not FieldByName('Dt_Uvoln').IsNull then
          dDtUvolnPrp := Min(FieldByName('Dt_Uvoln').AsDateTime, dDtEndMes)
        else
          dDtUvolnPrp := dDtEndMes;
        if (dDtPriemPrp >= dDtBegMes) and (dDtUvolnPrp <= dDtEndMes) then begin
          // пройти по всей tblMd и в соответствующих датах
          // в поле RabotalPrp поменять FALSE на TRUE
          tblMd.First;
          while not tblMd.Eof do begin
            if (tblMdDtMes.AsDateTime >= dDtPriemPrp) and
                   (tblMdDtMes.AsDateTime <= dDtUvolnPrp) then begin

              tblMd.Edit;   // in CreOpenTblMd
              tblMdRabotalPrp.AsBoolean := true;
              tblMd.FieldByName('RabotalSps').AsBoolean := TRUE;
              nCntSpsBudgChas := nCntSpsBudgChas +
                                  tblMd.FieldByName('CntWrkChs').AsFloat;
              tblMd.Post;
            end;
            tblMd.Next;
          end;
        end;
        Next;
      end;
    end;
  end;

  // Устанавливаем флаги для дней месяца в tblMd
  SetNadbToMD(nTabN, dRMes);

  // В tblMd попадут только дни, для которых нашлись даты в
  // qryPere (т.е. она может быть и не на весь месяц и даже пустой).
  // tblMd.IndexName := 'OnDtMes';
  tblMd.First;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.SetNadbToMD(nTabN: integer; dRMes: TDateTime);
var
  dEndR: TDateTime;
begin
  dEndR := MyLastDOM(dRMes);

  with qryNadb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;

    if dRMes < gd_DtBegAutoDMZ then
      SQL.Add('Select * from Z_ViNadb where (TabN = :nTabN) and ' +
              ' (Dt_Beg <= :dEndR)  and ' +
              ' ((Dt_End is NULL) or (Dt_End >= :dRMes)) ' +
              ' order by Dt_Beg desc')
    else
      SQL.Add('Select * from Z_ViNadb where (TabN = :nTabN) and ' +
              ' not VidN in ("1601", "1614") and '  +
              ' (Dt_Beg <= :dEndR)  and ' +
              ' ((Dt_End is NULL) or (Dt_End >= :dRMes)) ' +
              ' order by Dt_Beg desc');

    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dEndR').AsDateTime := dEndR;
    ParamByName('dRMes').AsDateTime := dRMes;
    Open;

    while not qryNadb.Eof do begin
      SetNadbOtklToMD(dRMes, qryNadb,
        // Вид - совместительский
        (FieldByName('Sovm').AsString = '1')
        // Надбавка дана по-совместительству
        or (FieldByName('Kd_Sovm').AsInteger > 0));
      qryNadb.Next;
    end;

    Close;
  end; {with}
end; {procedure}

//------------------------------------------------------------------------------
procedure TFormRs5.SetNadbOtklToMD(
  RMes: TDateTime;
  DataSet: TDataSet;
  Supplmnt: Boolean);
var
  VidN: ShortString;
  dNadbBeg, dNadbEnd: TDateTime;
  bIsStorn: boolean;
  Key: TSpanKey;
begin
  with DataSet do begin
    Key := CreateSpanKey(FieldByName('KdSps').AsInteger,
      FieldByName('KdObj').AsInteger, Supplmnt);

    VidN  := FieldByName('VidN').AsString;
    dNadbBeg := FieldByName('Dt_Beg').AsDateTime;
    dNadbEnd := FieldByName('Dt_End').AsDateTime;

    if dataSet = qryOtkl then
      bIsStorn := FieldByName('Storn').AsString = 'Y'
    else
      bIsStorn := false;

    if ((VidN = '5009') or (VidN = '5010')) and (dNadbEnd = 0) then
      dNadbEnd := myLastDOM(RMes);

    if VidIsOtpOsn(VidN) then
      SetDaysVacat(RMes, dNadbBeg, dNadbEnd,
        false, FieldByName('KdSps').AsInteger, bIsStorn);

    if VidIsOtpSovm(VidN) then
      SetDaysVacat(RMes, dNadbBeg, dNadbEnd,
        true, FieldByName('KdSps').AsInteger, bIsStorn);

    // Отрезки оплачиваемых совместельских отпусков
    if (VidN = '2409') or (VidN = '2410') then
      ProcKeySpan(PaySovmVacArr, Key, RMes, DataSet);

    // Отрезки неоплачиваемых совместельских отпусков
    if VidN = '5008' then
      ProcKeySpan(NopaySovmVacArr, Key, RMes, DataSet);

    // отпуск по уходу до 3х и 6ти лет без частичной занятости
    if (VidN = '5011') or (VidN = '5012') then begin
      Set_5011_5012_ToMD(RMes, dNadbBeg, dNadbEnd);
      ProcSpan(ChildCareVacArr, RMes, DataSet);
    end;

    if VidIsBln(dataSet) and not bIsStorn then begin
      if (VidN = '5006') and (dNadbEnd = 0) then
        dNadbEnd := myLastDOM(RMes);

      SetDaysSick(RMes, dNadbBeg, dNadbEnd, Supplmnt,
        FieldByName('KdSps').AsInteger);
    end;

    if VidIsKmd(VidN) then begin
      if dNadbEnd = 0 then
        dNadbEnd := myLastDOM(RMes);
      SetKmdToMD(RMes, dNadbBeg, dNadbEnd, true);
    end;

    // Сюда можно добавлять установку флагов для других ситуаций
    // ...
  end;
end;

//------------------------------------------------------------------------------
function TFormRs5.VidIsOtpOsn(cVidN: string): boolean;
begin
  Result := (cVidN = '2404') or (cVidN = '2405')
    or (cVidN >= '5001') and (cVidN <= '5010')
    and (cVidN <> '5008') and (cVidN <> '5010');
end;

//------------------------------------------------------------------------------
function TFormRs5.VidIsOtpSovm(cVidN: string): boolean;
begin
  Result := (cVidN = '2409') or (cVidN = '2410')
    or (cVidN = '5008') or (cVidN = '5010');
end;

//------------------------------------------------------------------------------
function TFormRs5.VidIsBln(dataSet: TDataSet): boolean;
begin
  Result :=
    (dataSet.FieldByName('Bolnic').AsString = '1')
    and (dataSet.FieldByName('cBudg').AsString = '1');
end;

//------------------------------------------------------------------------------
class function TFormRs5.VidIsKmd(cVidN: string): boolean;
begin
  Result := (cVidN = '1206') or (cVidN = VIDN_WAR_DAY_SUM);
end;

//------------------------------------------------------------------------------
// Issue 220809 - МинЗП для НИЧ
//------------------------------------------------------------------------------
function TFormRs5.VidIsNICh(VidN: ShortString): boolean;
begin
  Result := TblNU.FieldByName('KdSps').AsInteger = 6;
end;

//------------------------------------------------------------------------------
// Issue 220809 - МинЗП для НИЧ
//------------------------------------------------------------------------------
class function TFormRs5.SqlVidIsNICh: ShortString;
begin
  Result := 'KdSps = 6';
end;

//-------------- Рассчитать сумму по отклонениям -------------------------------
procedure TFormRs5.RaschetOtkl(
  nTabN, nSpecNR : integer;
  cVidN : string4;
  dZaMG, dDtBeg, dDtEnd : TDateTime;
  var nChOtkl, nSmOtkl : double
);
var
  dDtEndMes, OnDate : TDateTime;
begin
  nSmOtkl := 0;
  if {(dDtBeg = 0) and} (dDtEnd = 0) then begin
    dDtEndMes := MyLastDOM(dZaMG);  // Определить оклад на конец месяца (Ольга)
    // т.к. часы не пустые - просто начисляю на эти часы по часовому тарифу
    LocalGetPereInf(nTabN, dDtEndMes, nPereKdSps, nPereKdObj, nPereKdKatP,
                    nPereSO, nPerePdNlg, nPereKolMin, nPereKdSpz,
                    nPrcWT, nPereOklTrf,
                    nPereAvans, cPereSpAv, cPereDolgnost, cPereNrPrikaza,
                    dPereDtPrikaza, bPerePens, bPereSovm, bPerePrfs, nPereInv);
    if cVidN = '1201' {праздничные в одинарном размере} then
      nSmOtkl := nPereOklTrf / n_WrkChasMes * nChOtkl
    else if cVidN = '1202' {праздничные в двойном размере} then
      nSmOtkl := nPereOklTrf / n_WrkChasMes * nChOtkl * 2
    else if (cVidN = '1204') or (cVidN = '1207') {ночные} then begin
      if DDtBeg = 0 then
        OnDate := dZaMg
      else
        OnDate := dDtBeg;

      nSmOtkl := GetSmPM(cVidN, OnDate, nTabN, nChOtkl)
    end
    else if (cVidN > '5000') and (cVidN <= '6000') {неоплачиваемые виды} then
      nSmOtkl := 0;
    nSmOtkl := RoundTo(nSmOtkl, -2);
  end;     // можно попытаться тут
end;
//------------------------------------------------------------------------------
function TFormRs5.GetSmPM(
  VidN: ShortString;
  OnDate: TDateTime;
  TabN: Integer;
  Chas: Double
): Double;
// вернуть сумму по заданным часам прошлых месяцев (ПМ), если не введена
var
  nKtNight : double; {коэф-т для ночных (сменился с 09-2012)}
begin
  Result := 0;
  LocalGetPereInf(TabN, OnDate, nPereKdSps, nPereKdObj, nPereKdKatP, nPereSO,
                  nPerePdNlg, nPereKolMin, nPereKdSpz,
                  nPrcWT, nPereOklTrf, nPereAvans,
                  cPereSpAv, cPereDolgnost, cPereNrPrikaza, dPereDtPrikaza,
                  bPerePens, bPereSovm, bPerePrfs, nPereInv);
  // все это обращение к GetPereInf городилось, чтобы узнать nOtklTrf на dZaMG
  if VidN = '1201' {праздничные в одинарном размере} then
    Result := nPereOklTrf / n_WrkChasMes * Chas
  else if VidN = '1202' {праздничные в двойном размере} then
    Result := nPereOklTrf / n_WrkChasMes * Chas * 2
  else if (VidN = '1204') or (VidN = '1207')  {ночные} then begin
    if OnDate < EncodeDate(2012, 9, 1) then
      nKtNight := 0.35  // до 09-2012
    else
      nKtNight := 0.4;  // с 09-2012

    Result := RoundTo(nPereOklTrf / n_WrkChasMes * nKtNight * Chas, -2);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.ObrNadbSpsb3(nTabN : integer; dRMes : TDateTime);
var {cVidN : string4;} nSmNdb : double;
    dDtBegNdb, dDtEndNdb {в текущем месяце}, dDtEndMes : TDateTime;
    n_KdTemu, n_KdSpZ : SmallInt;
    cSchBU, cMesPrkzBeg, cMyNotes : ShortString;
begin
  dDtEndMes := MyLastDOM(dRMes);
  with qryNadb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_ViNadb where (TabN = :nTabN) and ' +
            ' (Dt_Beg <= :dDtEndMes)  and ' +
            ' ((Dt_End is NULL) or (Dt_End >= :dRMes)) ' +
            ' order by Dt_Beg desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
    ParamByName('dRMes').AsDateTime := dRMes;
    Open;
    First;
    while not Eof do begin
      if (FieldByName('SpsRsch').AsInteger = 3) and
            (FieldByName('SumProc').AsFloat <> 0) and
               (FieldByName('Dt_Beg').AsDateTime <= dDtEndMes) and
                  (FieldByName('Dt_End').IsNull or
                     (FieldByName('Dt_End').AsDateTime >= dRMes)) then begin
        dDtBegNdb := Max(dRMes, FieldByName('Dt_Beg').AsDateTime);
        if FieldByName('Dt_End').IsNull then
          dDtEndNdb := dDtEndMes
        else
          dDtEndNdb := Min(dDtEndMes, FieldByName('Dt_End').AsDateTime);
        nSmNdb := FieldByName('SumProc').AsFloat *
                  (dDtEndNdb - dDtBegNdb + 1) / (dDtEndMes - dRMes + 1);
        nSmNdb := RoundTo(nSmNdb, -2);
        if nSmNdb <> 0 then begin
          cMesPrkzBeg := Copy(FieldByName('DtPrBeg').AsString, 4, 7);
          cMyNotes := cMesPrkzBeg + ' FromNadb';
          n_KdSpZ := FieldByName('KdSpZ').AsInteger;
          n_KdTemu := FieldByName('KdTemu').AsInteger;
          //======
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dRMes, dDtBegNdb, dDtEndNdb,
            FieldByName('VidN').AsString,
            FieldByName('KdSps').AsInteger,n_KdTemu,
            FieldByName('KdObj').AsInteger,
            FieldByName('KdKatP').AsInteger, 1, 0, 0,
            n_KdSpZ, 0, nSmNdb, 0, 0,
            cSchBU, 'из Надбавок', cMyNotes, '', '', '',
            FieldByName('Grp').AsInteger,
            FieldByName('Spec_NR').AsInteger, 0, '', '');
        end;
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.ObrOtkl(nTabN : integer; dRMes : TDateTime);
var dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE : TDateTime;
    cOtklZaMG : ShortString;
    cVidN : string4;
    cNotes, cMyNotes, cDtVdPV, cNrVdPV, cSchBU : ShortString;
    PartSum, nSumma, nChas, nChOtkl, nSmOtkl, nPrcWrkTime, nPrcSovm: double;
    nPdn, nPrPV, nPRR, nPrKr, n_KdSps, n_KdTemu, n_KdObj, n_KdSpZ,
                                      n_KdKatP, nSpec_NR : integer;
    bIsInv : boolean;
    bZaniato : boolean;
    cInSQL : string;
    i, nKdBnk : SmallInt;
    cRMes, cMesOtklDtProc : ShortString;
    mList : TStringList;
  Days: integer;
  CalcPeriod: TPeriod;
  Supplmnt: Boolean;
  SickPeriods: TPeriods;
  OnDate: TDateTime;
begin
{ Процедура вызывается по-месячно (определяется переменной dRMes)
  В процедуре будут фигурировать четыре даты:
  - d_DtCtrl      - системный расчетный месяц (определяется системной
                    датой и днем перехода в новый расчетный период)
  - dRMes         - рассчитываемый (пересчитываемый) месяц (передается из Part01)
  - dOtklDtProc   - месяц, в котором введены отклонения (считывается из z_Otkl)
  - dOtklDZaMG    - месяц, за который введены отклонения (считывается из z_Otkl)
}
  with DateUtils do
    CalcPeriod := InitPeriod(dRMes, EndOfMonth(dRMes));

  nPrPv := 1;
  nPrcWrkTime := 0;
  nPrcSovm := 0;
  cMyNotes := 'ObrOtkl';

  // Issue 230612
  // Изменено чтобы пересчитывались и будущие месяцы
  // b_Pereschet := dRMes < d_DtCtrl;
    b_Pereschet := dRMes <> d_DtCtrl;

  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;

    if b_Pereschet then begin
      if dRMes < gd_DtBegAutoDMZ then
        SQL.Add(
          'select o.NR, o.KDSPS, o.DTPROC, o.ZAMESGOD, o.DTSTORN, o.TABN, ' +
          'o.VIDN, o.OLDKDVIDN, o.CHAS, o.SUMMA, o.OLDKDOBJ, o.KDOBJ, ' +
          'o.KDKATP, o.DT_BEG, o.DT_END, o.PDN, o.KDSPZ, o.NOTES, o.PRR, ' +
          'o.PRPV, o.KTO, o.PRKR, o.SPEC_NR, o.DTVDPV, o.NRVDPV, ' +
          'o.MYNOTES, o.SPECPS, o.PBNK, o.STORN, o.KDBNK, o.KDTEMU, ' +
            'o.Otkl_Sovm, v.* ' +
          ' from view_otkl o, z_KdVidN v ' +
          ' where (o.TabN = :nTabN) and ' +
          ' (o.ZaMesGod = :dRMes) and ' +
          ' ((o.VidN < "7500") or (o.VidN > "7600")) and ' +
          ' (not o.VidN in ("6601","6602","6611","8801","8802")) and ' +
          ' (v.VidN = o.VidN) ' + {без выплат,алиментов,переводов и указаний
                                                             на пересчеты}
          ' order by o.DtProc, o.ZaMesGod, o.VidN, o.NR')
      else
        SQL.Add(
          'select o.NR, o.KDSPS, o.DTPROC, o.ZAMESGOD, o.DTSTORN, o.TABN, ' +
          'o.VIDN, o.OLDKDVIDN, o.CHAS, o.SUMMA, o.OLDKDOBJ, o.KDOBJ, ' +
          'o.KDKATP, o.DT_BEG, o.DT_END, o.PDN, o.KDSPZ, o.NOTES, o.PRR, ' +
          'o.PRPV, o.KTO, o.PRKR, o.SPEC_NR, o.DTVDPV, o.NRVDPV, ' +
          'o.MYNOTES, o.SPECPS, o.PBNK, o.STORN, o.KDBNK, o.KDTEMU, ' +
            'o.Otkl_Sovm, v.* ' +
          ' from view_otkl o, z_KdVidN v ' +
          ' where (o.TabN = :nTabN) and ' +
          ' (o.ZaMesGod = :dRMes) and ' +
          ' ((o.VidN < "7500") or (o.VidN > "7600")) and ' +
          ' (not o.VidN in ("1601", "1614", "6601","6602","6611","8801","8802")) and ' +
          ' (v.VidN = o.VidN) ' + {без выплат,алиментов,переводов и указаний
                                                             на пересчеты}
          ' order by o.DtProc, o.ZaMesGod, o.VidN, o.NR');
      end

    else begin
      // cInSQL формируется так же, как и в CreOpenOldNU
      cInSQL := '';
      mList := TStringList.Create;
      cRMes := DateToStr(dRMes);
      mList.Add(cRMes);
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;

        if dRMes < gd_DtBegAutoDMZ then
          SQL.Add('Select * from Z_Otkl where TabN = :nTabN and ' +
                  ' (DtProc = :dRMes or DtStorn = :dRMes) and ' +
                  ' (not VidN in ("8801","8802"))')
        else
          SQL.Add('Select * from Z_Otkl where TabN = :nTabN and ' +
                  ' (DtProc = :dRMes or DtStorn = :dRMes) and ' +
                  ' (not VidN in ("8801","8802", "1601", "1614"))');
        ParamByName('nTabN').AsInteger  := nTabN;
        ParamByName('dRMes').AsDateTime := dRMes;
        Open;

        while not Eof do begin
          // в cInSQL включать только месяцы, не фигурирующие в LbxPeriodu
          if FieldByName('PdN').AsInteger > 0 then
            if (LbxPeriodu.Items.IndexOf(FieldByName('ZaMesGod').AsString) < 0)
                and (mList.IndexOf(FieldByName('ZaMesGod').AsString) < 0) then
              mList.Add(FieldByName('ZaMesGod').AsString);
          Next;
        end;

        cInSQL := 'in (';
        for i := 0 to mList.Count-1 do begin
          cInSQL := cInSQL + '"' + FormatDateTime('mm"/"dd"/"yyyy',
                                                StrToDate(mList[i])) + '"';
          if i < (mList.Count-1) then
            cInSQL := cInSQL + ',';
        end;
        cInSQL := cInSQL + ')';

        mList.Destroy;
        Close;
        SQL.Clear;
        DataBaseName := '';
      end;

      if dRMes < gd_DtBegAutoDMZ then
        SQL.Add(
          'select o.NR, o.KDSPS, o.DTPROC, o.ZAMESGOD, o.DTSTORN, o.TABN, ' +
          'o.VIDN, o.OLDKDVIDN, o.CHAS, o.SUMMA, o.OLDKDOBJ, o.KDOBJ, ' +
          'o.KDKATP, o.DT_BEG, o.DT_END, o.PDN, o.KDSPZ, o.NOTES, o.PRR, ' +
          'o.PRPV, o.KTO, o.PRKR, o.SPEC_NR, o.DTVDPV, o.NRVDPV, ' +
          'o.MYNOTES, o.SPECPS, o.PBNK, o.STORN, o.KDBNK, o.KDTEMU, ' +
            'o.Otkl_Sovm, v.* ' +
          ' from view_otkl o, z_KdVidN v ' +
          ' where (o.TabN = :nTabN) and ' +
          ' ((o.DtProc = :dRMes) or ' +
          '  (o.DtStorn = :dRMes) or ' +
          '  (o.DtProc < :dRMes and o.ZaMesGod ' + cInSQL + ')) and ' +
          ' (not o.VidN in ("8801","8802")) and ' +
          ' (v.VidN = o.VidN) ' +
          ' order by o.DtProc, o.ZaMesGod, o.VidN, o.NR')
     else
        SQL.Add(
          {'select v.*, o.* ' +
          'from z_otkl o, z_KdVidN v ' +
          'where (o.TabN = :nTabN) and ' +
            ' ((o.DtProc = :dRMes) or ' +
            '  (o.DtStorn = :dRMes) or ' +
            '  (o.DtProc < :dRMes and o.ZaMesGod ' + cInSQL + ')) and ' +
            ' (not o.VidN in ("8801","8802", "1601", "1614")) and ' +
            ' (v.VidN = o.VidN) ' +
          'order by o.DtProc, o.ZaMesGod, o.VidN, o.NR');}

          'select o.NR, o.KDSPS, o.DTPROC, o.ZAMESGOD, o.DTSTORN, o.TABN, ' +
            'o.VIDN, o.OLDKDVIDN, o.CHAS, o.SUMMA, o.OLDKDOBJ, o.KDOBJ, ' +
            'o.KDKATP, o.DT_BEG, o.DT_END, o.PDN, o.KDSPZ, o.NOTES, o.PRR, ' +
            'o.PRPV, o.KTO, o.PRKR, o.SPEC_NR, o.DTVDPV, o.NRVDPV, ' +
            'o.MYNOTES, o.SPECPS, o.PBNK, o.STORN, o.KDBNK, o.KDTEMU, ' +
            'o.Otkl_Sovm, v.* ' +
          'from view_otkl o, z_KdVidN v ' +
          'where o.TabN = :nTabN ' +

            // Issue 230612
            // будущие месяцы расчитаются в ветке "пересчётов"
            'and o.ZaMesGod <= :dRMes ' +

            'and ((o.DtProc = :dRMes) or (o.DtStorn = :dRMes) ' +
              'or (o.DtProc < :dRMes and o.ZaMesGod ' + cInSQL + ')) and ' +
            '(not o.VidN in ("8801","8802", "1601", "1614")) and ' +
            '(v.VidN = o.VidN) ' +
          'order by o.DtProc, o.ZaMesGod, o.VidN, o.NR');
    end;

    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('dRMes').AsDateTime := dRMes;
    Open;

    // Предварительно проставляем дни, в которых сотрудник не работал.
    // Остальные отклонения должны обрабатываться с учётом этих дней.
    LockBlnInMD(dRMes);

    First;
    while not Eof do begin
      dOtklDtProc := FieldByName('DtProc').AsDateTime;
      cMesOtklDtProc := Copy(FieldByName('DtProc').AsString, 4, 7);
      dOtklZaMG   := FieldByName('ZaMesGod').AsDateTime;
      cOtklZaMG   := FieldByName('ZaMesGod').AsString;//для общения с LbxPeriodu
      cVidN       := FieldByName('VidN').AsString;
      nPdn        := FieldByName('Pdn').AsInteger;
      nPrKr       := FieldByName('PrKr').AsInteger;
      cDtVdPV     := FieldByName('DtVdPV').AsString;
      cNrVdPV     := FieldByName('NrVdPV').AsString;
      dOtklDtB    := FieldByName('Dt_Beg').AsDateTime;
      dOtklDtE    := FieldByName('Dt_End').AsDateTime;
      nKdBnk      := FieldByName('KdBnk').AsInteger;
      if (cVidN = '8801') or (cVidN = '8802') {указания на пересчет} or
         ((dOtklDtProc < d_DtCtrl) and (dOtklZaMG < dOtklDtProc) and
               (LbxPeriodu.Items.IndexOf(cOtklZaMG) < 0)) or
               ((dOtklDtProc < d_DtCtrl) and (cVidN > '7500')
                                         and (cVidN < '7600')) then begin
        Next;
        Continue;
      end;

      if (FieldByName('Bolnic').AsString = '1') or
                       (FieldByName('PRR').AsInteger = 1) then begin
        // выяснить "инвалидность" сотрудника и подставить соответствующий PRR
        // для 1-х 5 дней 2 (у неИнв.) или 4 (у Инв.)
        // для остальных  1 (у неИнв.) или 3 (у Инв.)
        bIsInv := IsInvalid(nTabN, dOtklZaMG);

        // SB 23.3.2026 По аналогии, наверное, и 2606
        if (FieldByName('VidN').AsString = '2603')
          or (FieldByName('VidN').AsString = '2606')
        then begin
          if not bIsInv then
            nPRR := 2  {1-е 5 дней неИнв}
          else
            nPRR := 4; {1-е 5 дней Инв} end
        else begin
          if not bIsInv then
            nPRR := 1  {общие неИнв}
          else
            nPRR := 3; {общие Инв}
        end;
      end else
        // дальше (в SaveSchetResults) для инв.
        // подставить PRR = 7 во все неБольничн.виды
        nPRR := 0;


      // ----------------- //

      n_KdSps   := FieldByName('KdSps').AsInteger;
      n_KdTemu  := FieldByName('KdTemu').AsInteger;
      n_KdSpZ   := FieldByName('KdSpZ').AsInteger;
      nChas     := FieldByName('Chas').AsFloat;
      nSumma    := FieldByName('Summa').AsFloat;
      cNotes    := FieldByName('Notes').AsString;
      n_KdObj   := FieldByName('KdObj').AsInteger;
      n_KdKatP  := FieldByName('KdKatP').AsInteger;
      nSpec_NR  := FieldByName('Spec_NR').AsInteger;
      cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

      if (not FieldByName('MyNotes').IsNull) and
            (FieldByName('MyNotes').AsString > '') then
        cMyNotes := cMesOtklDtProc + ' ' + FieldByName('MyNotes').AsString
      else
        cMyNotes := cMesOtklDtProc + ' ObrOtkl';

      // отклонение за будущий месяц, просто переписываю в tblNU
      if (dOtklZaMG > dRMes) then begin
        if n_KdSpZ = 0 then
          // взять из местного qryPere
          n_KdSpZ := GetPereKdSpZ(dOtklZaMG);

        // праздн., ночные и за дни в командировке
        if (nSumma = 0) and (nChas <> 0) and (dOtklZaMG < d_DtCtrl) and
              ((cVidN = '1201') or (cVidN = '1202') or
              (cVidN = '1204') or (cVidN = '1207')) then
          // взять суммы прошлых месяцев
          if dOtklDtB = 0 then
            OnDate := dOtklZaMG
          else
            OnDate := dOtklDtB;

          nSumma := GetSmPM(cVidN, OnDate, nTabN, nChas);

        TblNuAdd(dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN,
          n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPdn, nPrPV, nPRR,
          n_KdSpZ, nChas, nSumma, nPrcWrkTime, nPrcSovm,
          cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, '',
          0, nSpec_NR, 0, FieldByName('Otkl_Sovm').AsString, '');
      end

      // Отклонение за прошедший месяц пропускаю -
      // оно теперь обсчитается в "своем" периоде-месяце
      else if (dOtklZaMG < dRMes) and (dOtklZaMG >= dMesPeremen) then begin
        Next;
        Continue;
      end

      // отклонения за текущий месяц
      // или прошедший до dMesPeremen
      else begin

        // отпускные
        if (qryOtklOtpuskn.AsString = '1') and
            (qryOtklCBudg.AsString = '1') then begin

          Supplmnt := FieldByName('Sovm').AsString = '1';

          if (FieldByName('STORN').AsString = 'Y')
            // SB 4.6.2026 Не рассчитывался сторнированный 5005
            // у таб.№ 41799 Задерейко В.А.
            // почему-то у записи отсутствовал SPEC_NR:
            // and (not FieldByName('Spec_NR').IsNull)
          then
            SetDaysVacat(dOtklZaMG, dOtklDtB, dOtklDtE, Supplmnt, n_KdSps, true)
          else
            SetDaysVacat(dOtklZaMG, dOtklDtB, dOtklDtE, Supplmnt, n_KdSps, false);
        end

        // больничные
        // по такому же принципу нужно переделать и остальные виды:
        // чтобы возвращалось количество фактических часов и
        // пересчитывалась сумма.
        else if (FieldByName('Bolnic').AsString = '1')
            and (FieldByName('cBudg').AsString = '1') then begin

//          if nChas <> 0 then begin
            SetDaysSick(dOtklZaMG, dOtklDtB, dOtklDtE, false, 1);

            SickPeriods := SplitSickToEffPeriods;

            for I := 0 to Length(SickPeriods) - 1 do begin
              Days := DateUtils.DaysCount(SickPeriods[I]);

              if Days <> 0 then
                PartSum := TNumUtils.RoundToKopeck(
                  nSumma * Days / (dOtklDtE - dOtklDtB + 1))
              else
                PartSum := 0;

              TblNuAdd(dOtklDtProc, dOtklZaMG,
                SickPeriods[I].Start, SickPeriods[I].Finish,
                cVidN, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR,
                n_KdSpZ, DateUtils.DaysCount(SickPeriods[I]) * 8,
                PartSum, 0, 0, cSchBU, 'изОткл.', cMyNotes,
                '', '', '', 0, FieldByName('Spec_NR').AsInteger, 0,
                FieldByName('Otkl_Sovm').AsString, FieldByName('Storn').AsString
              );
            end;
//          end;
        end

        // НеОплач.Виды
        else if (cVidN > '5000') and (cVidN < '5100')
            // иначе неопл.совм.отп. выключает расч.осн.видов
            and (cVidN <> '5008')
        then begin
          SetDaysNonPay(cVidN, dOtklZaMG, dOtklDtB, dOtklDtE,
            FieldByName('Otkl_Sovm').AsString = 'Y', n_KdSps,
            FieldByName('STORN').AsString = 'Y');

          if (b_Pereschet or
                (dOtklDtProc = d_DtCtrl) or (dOtklZaMG = d_DtCtrl)) then
          if dOtklDtProc = d_DtCtrl then
            // и сразу записываю в tblNU
            TblNuAdd(dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN,
                  n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR,
                  n_KdSpZ, nChas, nSumma, 0, 0,
                  cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, '',
                  0, nSpec_NR, 0, FieldByName('Otkl_Sovm').AsString,
                  FieldByName('STORN').AsString);

          Next;
          Continue;
        end

        // выплаты текущего месяца в т.ч. переводы (6611)
        else if ((cVidN > '7500') and (cVidN < '7525')) or (cVidN = '6611') then begin
          //сразу пишу в tblNU
          // Тут изменения по виду 7511 выплаты в банк - их нельзя объединять
          TblNuAdd(dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN,
                n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR,
                n_KdSpZ, 0, nSumma, 0, 0,
                cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, '',
                0, nSpec_NR, nKdBnk, FieldByName('Otkl_Sovm').AsString, '');

          Next;
          Continue;
        end

        // пересчёт
        else if ((cVidN = '8001') or ((dOtklZaMG > dOtklDtProc) and
              (nPrKr = 1))) then begin
          Next;
          Continue;
        end;

        // ----------------- //

        // сторнированные
        if FieldByName('STORN').AsString = 'Y' then begin
          // просто переписываю одной записью сразу в tblNU
          TblNuAdd(dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN,
            n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR,
            n_KdSpZ, nChas, nSumma, 0, 0, cSchBU, 'Сторн', cMyNotes, '', '', '',
            0, FieldByName('Spec_NR').AsInteger, 0,
            FieldByName('Otkl_Sovm').AsString, FieldByName('Storn').AsString);
        end

        // не "бюджетные"
        else if FieldByName('CBudg').IsNull or
              (FieldByName('CBudg').AsString <> '1') or
              (dOtklDtB = 0) or (dOtklDtE = 0) then begin

          if (nSumma = 0) and (nChas <> 0) then begin
            // Независмо от того, пустые даты начала и конца или нет -
            // попытаться рассчитать сумму по отклонениям
            nPrPv := 3;  // clNavy
            nChOtkl := nChas;
            nSmOtkl := nSumma;
            RaschetOtkl(nTabN, FieldByName('Spec_NR').AsInteger, cVidN,
                  dOtklZaMG, dOtklDtB, dOtklDtE, nChOtkl, nSmOtkl);
            nChas := nChOtkl;
            nSumma := RoundTo(nSmOtkl, -2);

          end else begin
            if FieldByName('PrPv').IsNull then
              nPrPv := 1
            else
              nPrPv := FieldByName('PrPv').AsInteger;

            nSumma := FieldByName('Summa').AsFloat;
            nChas  := FieldByName('Chas').AsFloat;
          end;

          // тут перед тем, как записывать разобраться с КдШпз2
          if (b_Pereschet or
              (dOtklDtProc = d_DtCtrl) or (dOtklZaMG = d_DtCtrl)) then begin

            TblNuAdd(dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN,
              n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR,
              n_KdSpZ, nChas, nSumma, 0, 0, cSchBU, 'изОткл.', cMyNotes, '',
              '', '', 0, FieldByName('Spec_NR').AsInteger, 0,
              FieldByName('Otkl_Sovm').AsString, FieldByName('Storn').AsString);
          end;
        end

        // Вид бюджетный, отметить в tblMd дни как бюджетноЗанятые, чтобы в
        // эти дни не начислялось по умолчанию и переписать в tblNU
        else if (FieldByName('CBudg').AsString = '1') and
              not (FieldByName('Otpuskn').AsString = '1') and
              not (FieldByName('Bolnic').AsString = '1') then begin

          if FieldByName('Chas').Value < 0 then
            bZaniato := false
          else
            bZaniato := true;

          SetDaysBdgZanInTblMD(cVidN, dOtklZaMG, dOtklDtB, dOtklDtE, bZaniato,0);

          // За дни в командировке
          if VidIsKmd(cVidN) then begin
            // Рассчёт по среднему
            if nSumma = 0 then
              nSumma := DmMain.MySredneMes(2, nTabN, dOtklDtB) / n_WrkChasMes * nChas;
          end;

          if (b_Pereschet or (dOtklDtProc = d_DtCtrl) or
                (dOtklZaMG = d_DtCtrl)) then begin

            //  Ниже было true (объединять) 22-09-2011 поставил false (не объединять)
            TblNuAdd(dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN,
              n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR,
              n_KdSpZ, nChas, nSumma, 0, 0,
              cSchBU, 'изОткл.', cMyNotes, '', '', '',
              0, FieldByName('Spec_NR').AsInteger, 0,
              FieldByName('Otkl_Sovm').AsString, FieldByName('Storn').AsString);
          end

        end else if b_Pereschet
          or (dOtklDtProc = d_DtCtrl) or (dOtklZaMG = d_DtCtrl)
        then begin
          if FieldByName('Bolnic').AsString <> '1' then
            // Больничные вывели выше в отдельной ветке, потому что они могут
            // дробиться
            TblNuAdd(dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN,
              n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR,
              n_KdSpZ, nChas, nSumma, 0, 0, cSchBU, 'изОткл.', cMyNotes, '', '',
              '', 0, FieldByName('Spec_NR').AsInteger, 0,
              FieldByName('Otkl_Sovm').AsString, FieldByName('Storn').AsString);
        end;
      end; {if отклонения текущего месяца}

      SetNadbOtklToMD(dRMes, qryOtkl,
        FieldByName('Otkl_Sovm').AsString = 'Y');

      Next;
    end; {while}
  end; {with}

  if bFlagDbg then
    dbgrNu.Refresh;
end; {ObrOtkl}

//------------------------------------------------------------------------------
procedure TFormRs5.SetDaysBdgZanInTblMD(cVidN : ShortString;
                                dOtklZaMG, dDtBeg, dDtEnd : TDateTime;
                                           bZaniato : boolean; nPrcWT : double);
// Отметить как TRUE БюджетноЗанятые дни в tblMd
var dDtMes, dLastDOM : TDateTime;
begin
  dLastDOM := MyLastDOM(dOtklZaMG);
  dDtMes := dOtklZaMG;
  while true do begin
    if (dDtMes > dDtEnd) or (dDtMes > dLastDOM) then
      Break
    else if (dDtMes >= dDtBeg) and (dDtMes <= dDtEnd) then
    with tblMd do begin
      if Locate('DtMes', dDtMes, []) then begin
        Edit;
        if nPrcWT > 0 then
          FieldByName('PrcWrkTime').AsFloat := nPrcWT / 100
        else
          FieldByName('IsBdgZan').AsBoolean := bZaniato;
        if VidIsKmd(cVidN) {командировочные} then
          FieldByName('IsInKmd').AsBoolean := bZaniato;
        Post;
      end;
    end;
    dDtMes := dDtMes + 1;
  end;
end;

//------------------------------------------------------------------------------
function TFormRs5.LocatePereInfo(OnDate: TDateTime): TDataSet;
begin
  // сортирована по DtBeg descending
  with QryPere do begin
    First;

    while not Eof and (FieldByName('Dt_Beg').AsDateTime > OnDate) do
      Next;
  end;

  Result := QryPere;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.LocalGetPereInf(nTabN : integer; dRMes : TDateTime;
    var n_KdSps, n_KdObj, n_KdKatP, n_SO, n_PdNlg, n_KolMin, n_KdSpZ : integer;
    var nPrcWT, nOklTrf, nAvans : double;
    var cSpAv : string1;
    var cDolgnost, cNrPrikaza : string;
    var dDtPrikaza : TDateTime;
    var bPens, bSovm, bPrfs : boolean;
    var nInv : SmallInt);
begin
  { Запрос отсортирован в порядке убывания }
  with qryPere do begin
    First;
    while not Eof do begin
      n_KdSps    := FieldByName('KdSps').AsInteger;
      n_KdObj    := FieldByName('KdObj').AsInteger;
      n_KdKatP   := FieldByName('KdKatP').AsInteger;
      n_SO       := FieldByName('SO').AsInteger;
      n_PdNlg    := FieldByName('PdNlg').AsInteger;
      n_KolMin   := FieldByName('KolMin').AsInteger;
      n_KdSpZ    := FieldByName('KdSPZ').AsInteger;
      nPrcWT     := FieldByName('PrcWrkTime').AsFloat;
      nOklTrf    := FieldByName('OklTrf').AsFloat;
      nAvans     := FieldByName('Avans').AsFloat;
      cSpAv      := FieldByName('Sp_Av').AsString;
      cDolgnost  := FieldByName('Dolgnost').AsString;
      cNrPrikaza := FieldByName('Nr_Prikaza').AsString;
      dDtPrikaza := FieldByName('Dt_Prikaza').AsDateTime;
      bPens      := FieldValues['Pr_Pens'] = 1;
      bSovm      := FieldValues['Sovm'] = 1;
      bPrfs      := FieldValues['Prfs'] = 1;
      if (not FieldByName('NrDoc').IsNull) and
                     (Trim(FieldByName('NrDoc').AsString) > '') then
        // nInv     := FieldValues['Inv']
        nInv := FieldByName('Inv').AsInteger
      else
        nInv     := 0;
      if FieldByName('Dt_Beg').IsNull or
                (FieldByName('Dt_Beg').AsDateTime <= dRMes) then
        Break;
      Next;
    end;
  end;
end;


//------------------------------------------------------------------------------
function TFormRs5.WorksInMes(nTabN: integer; dInMes: TDateTime): boolean;
// т.к. в tblMd всегда именно текущий ТабН и текущий месяц ЗаМГ,
// то пераметры можно было и не передавать
begin
  Result := false;
  with tblMd do begin // Работал ли хотя бы один день в месяце
    First;
    while not Eof do begin
      if TblMdRabotalPrp.AsBoolean then begin
        Result := true;  // Достаточно одного дня
        Break;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.R_ByUderg(nTabN : integer; dRMes : TDateTime);
var dFirstDOM, dLastDOM : TDateTime; nSmUdrg : double;
    n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, nPRR, n_SO, n_PdNlg, n_KolMin, n_KdSpZ,
                                                           nSpecNR : integer;
    cSpAv : string1;
    cVidN : string4;
    nOklTrf, nAvans, nSmPsb : double;
    cDolgnost, cNrPrikaza, cNotes : string;
    dDtPrikaza : TDateTime;
    {bRabotalInMes,} bPens, bSovm, bPrfs : boolean;
    cSchBU : ShortString;
begin
  // если есть записи в файле удержаний - рассчитать
  dLastDOM := MyLastDOM(dRMes);
  dFirstDOM := dRMes;
  nPRR := 0;
  with qryUdrg do begin
    First;
    while not Eof do begin
      if (FieldByName('Dt_Beg').IsNull or
              (FieldByName('Dt_Beg').AsDateTime <= dLastDOM)) and
           (FieldByName('Dt_End').IsNull or
                       (FieldByName('Dt_End').AsDateTime >= dFirstDOM) or
                (FieldByName('Dt_End').AsDateTime >= dLastDOM)) then begin
        cVidN := FieldByName('VidN').AsString;
        if cVidN = '6601' {алименты} then begin
          bIsAlimentu := true;
          // пропускаю - рассчитаю потом по окончании расчета
          Next;
          Continue;
        end;
        if cVidN = '6611' {переводы} then begin
          bIsPerevodu := true;
          // пропускаю - рассчитаю потом по окончании расчета
          Next;
          Continue;
        end;
        nSpecNR := FieldByName('Spec_NR').AsInteger;
        nSmUdrg := -SumUdrg(nTabN, cVidN, nSmPsb, dRMes);
        // =================================================
        if nSmUdrg <> 0 then begin
          LocalGetPereInf(nTabN, dRMes, n_KdSps, n_KdObj, n_KdKatP,
                             n_SO, n_PdNlg, n_KolMin, n_KdSpZ, nPrcWT,
                               nOklTrf, nAvans,
                                 cSpAv, cDolgnost, cNrPrikaza, dDtPrikaza,
                                   bPens, bSovm, bPrfs, nPereInv);
          n_KdSps := FieldByName('KdSps').AsInteger;
          n_KdTemu := 0; //Нет в Z_Udrg поля HdTemu
          //======
          // пишу прямо в tblNU
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

          TblNuAdd(dRMes, dRMes, 0, 0, cVidN, n_KdSps, n_KdTemu,
            n_KdObj, n_KdKatP, 1, 3, nPRR, n_KdSpZ, 0, nSmUdrg, 0, 0,
            cSchBU, cNotes, 'R_ByUderg', '', '', '', 0, nSpecNR, 0, '', '');
        end;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.SumUdrg(nTabN : integer; cVidN : string4;
                           var nSmPsb : double; dRMes : TDateTime) : double;
var nSmForXX, nSmNaRuki : double;
begin
  Result := 0;
  nSmPsb := 0;
  with tblNU do begin
    First;
    nSmForXX  := 0;
    nSmNaRuki := 0;
    if (cVidN = '6601') {алименты} or
       (cVidN = '6611') {переводы} then begin   // Это не используется (см.выше)
      end
    else begin
      while not Eof do begin
        if (FieldByName('ZaMesGod').AsDateTime = dRMes) and
                  (FieldByName('VidN').AsString < '8000') then begin
          nSmNaRuki := nSmNaRuki + FieldByName('Summa').AsFloat -
                                               FieldByName('OldSm').AsFloat;
          if (FieldByName('VidN').AsString < '6000') then
            nSmForXX  := nSmForXX + FieldByName('Summa').AsFloat;
        end;
        Next;
      end;
      // if qryUdrg.FieldByName('SP').AsString = '%' then
      if qryUdrg.FieldByName('SpsRsch').AsInteger = 2 then
        Result := RoundTo(nSmForXX *
                    qryUdrg.FieldByName('SumVzn').AsFloat / 100, -2)
      else
        Result := qryUdrg.FieldByName('SumVzn').AsFloat;
    end;
    //if (Result > nSmNaRuki) then    {Заремил 19-05-2008, пусть идет в долг}
    //  Result := nSmNaRuki;
    if Result < 0 then
      Result := 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.R_Prfs(nTabN : integer; dRMes : TDateTime);
var n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpz, nPRR : SmallInt;
    cVidXX : string4;
    dZaMG : TDateTime;
    cFldNm, cZaMG : ShortString;
    nSvCdsNr1, nSvCdsNr2, nCntPorcInZaMG, nNumPorc : integer;
    nSmForXX, nSmXX, nSmXXUdeln, nSmPorc, nSmOst : double;
    nOldSmForXX, nNewSmForXX, nOldSmXX, nNewSmXX : double;
    cSchBU : ShortString;
begin
  with cdsOKS do begin
    First;
    while not Eof do begin
      dZaMG := FieldByName('ZaMesGod').AsDateTime;
      cZaMG := FieldByName('ZaMesGod').AsString;
      GetSmForPrfs(dZaMG, nOldSmForXX, nNewSmForXX, nOldSmXX, nNewSmXX);
      if {not cdsOksMetka.AsBoolean or}
         (dRMes <> d_DtCtrl) and (LbxPeriodu.Items.IndexOf(cZaMG) < 0) and
                                                      (dZaMG < dRMes) then begin
        Next;
        Continue;
      end;
      nSmForXX := nNewSmForXX;
      nSvCdsNr1 := FieldByName('NR').AsInteger;
      nCntPorcInZaMG := 0;
      //if dRMes < d_20110101 then
      //  cFldNm := 'SmPrfN'
      //else
        cFldNm := 'sNwPrf';
      while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
        if (FieldByName(cFldNm).AsFloat <> 0) then begin
          Inc(nCntPorcInZaMG);
//          nSmForXX := nSmForXX + FieldByName(cFldNm).AsFloat;
        end;
        Next;
      end;
      if nSmForXX > 0 then begin
        nSvCdsNr2 := FieldByName('NR').AsInteger;
        nSmXX := SumPrfs(nTabN, cVidXX, dRMes, nSmForXX);
        //======  расчет общей суммы профсоюзных  =====//
        nSmXXUdeln := nSmXX / nSmForXX;
        Locate('NR', nSvCdsNr1, []);
        nNumPorc := 0;
        nSmOst := nSmXX;
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
          if (FieldByName(cFldNm).AsFloat <> 0) then begin
            Inc(nNumPorc);
            if nNumPorc < nCntPorcInZaMG then begin
              nSmPorc := RoundTo(FieldByName(cFldNm).AsFloat * nSmXXUdeln,-2);
              nSmOst := nSmOst - nSmPorc; end
            else
              nSmPorc := RoundTo(nSmOst, -2);
            if nSmPorc <> 0 then begin
              n_KdSps  := FieldByName('KdSps').AsInteger;
              n_KdTemu := FieldByName('KdTemu').AsInteger;
              n_KdObj  := FieldByName('KdObj').AsInteger;
              n_KdKatP := FieldByName('KdKatP').AsInteger;
              n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
              nPRR     := FieldByName('PRR').AsInteger;
              cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);

              TblNuAdd(dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdTemu,
                n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ,
                0, -nSmPorc, 0, 0, cSchBU, '', '', '', '', '', 0, 0, 0, '', '');
            end;
          end;
          Next;
        end;
        if not Eof then
          Locate('NR', nSvCdsNr2, [])
        else
          Break;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs5.SumPrfs(nTabN : integer; var cVidN : string4;
                                 dRMes : TDateTime; nSmForXX : double) : double;
var bMember : boolean;  {член профсоюза}
begin
  Result := 0;
  bMember := false;
  // определить член ли профсоюза по первой подходящей записи в Z_PERE
  // (считаем, что в течение месяца Prfs не изменяется)
  with qryPere do begin
    First;
    while not Eof do begin
      bMember := FieldValues['Prfs'] = 1;
      if FieldByName('Dt_Beg').IsNull or
                     (FieldByName('Dt_Beg').AsDateTime <= dRMes) then
        Break;
      Next;
    end;
  end;
  if bMember then begin
    cVidN := '6021';
    Result := RoundTo(0.01 * nSmForXX, -2);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.FormCreate(Sender: TObject);
var cSvActivePageName : string;
begin
  dDt07_01_01 := EncodeDate(2007, 1, 1);
  dDt09_01_01 := EncodeDate(2009, 1, 1); // с 01-01-2009 процент не 0.5, а 0.6
  dDt11_08_01 := EncodeDate(2011, 8, 1);
  dDt11_09_01 := EncodeDate(2011, 9, 1);
  dDt13_10_01 := EncodeDate(2013,10, 1); // ЕСВ с декретных выводим в "Свои" виды
  d_MesBegWSb := EncodeDate(2014, 8, 1); // месяц начала ВСборов
  if bFlagDbg then begin
    tblNu.AutoCalcFields := true;
    cdsOKS.AutoCalcFields := true;
    LabelDbgMsg.Caption := '';
    PanelTotals.Caption := '';
    PanelNmTblNU.Caption := '';
    with TIniFile.Create(cNmIniFile) do begin
      Left   := ReadInteger(SECTION, 'wL', 100);
      Top    := ReadInteger(SECTION, 'wT', 50);
      Height := ReadInteger(SECTION, 'wH', 600);
      Width  := ReadInteger(SECTION, 'wW', 600);
      dbgrPeriodu.Height := ReadInteger(SECTION, 'dbgrPerioH', 85);
      dbgrMD.Width  := ReadInteger(SECTION, 'dbgrPrmUvW', 315);
      dbgrOtkl.Height := ReadInteger(SECTION, 'dbgrOtklH', 150);
      Panel3.Height   := ReadInteger(SECTION, 'Panel3H', 400);
      dbgrOks.Height  := ReadInteger(SECTION, 'dbgrOksH', 155);
      dbgrOks3.Height := ReadInteger(SECTION, 'dbgrOks3H', 155);
      cSvActivePageName := ReadString(SECTION, 'ActiveTs', 'ts1');
      sBtnTblNuFilter.Down := ReadBool(SECTION, 'bNuFilter', false);
      sBtnLbxPeriodu.Down := ReadBool(SECTION, 'LbxPeriodu', false);
      Free;
    end;
    SetTblNuFilter;
    SetLbxPerioduVisible;
    dsrcPeriodu.DataSet := tblPeriodu;
    dsrcPrmUv.DataSet   := qryPrmUv;
    dsrcMD.DataSet      := tblMd;
    dsrcOtkl.DataSet    := qryOtkl;
    dsrcNu.DataSet      := tblNu;
    dsrcOKS.DataSet     := cdsOKS;
    if FileExists(cDirVids + 'r2_Perio.vid') then
      dbgrPeriodu.Columns.LoadFromFile(cDirVids + 'r2_Perio.vid');
    if FileExists(cDirVids + 'r2_Md01.vid') then
      dbgrMD.Columns.LoadFromFile(cDirVids + 'r2_Md01.vid');
    if FileExists(cDirVids + 'r4_MD027.vid') then
      dbgrPere.Columns.LoadFromFile(cDirVids + 'r4_MD027.vid');
    if FileExists(cDirVids + 'r4_Otkl.vid') then
      dbgrOtkl.Columns.LoadFromFile(cDirVids + 'r4_Otkl.vid');
    if FileExists(cDirVids + 'r5_Nu06.vid') then
      dbgrNu.Columns.LoadFromFile(cDirVids   + 'r5_Nu06.vid');
    if FileExists(cDirVids + 'r4_Oks0.vid') then
      dbgrOKS.Columns.LoadFromFile(cDirVids + 'r4_Oks0.vid');
    if FileExists(cDirVids + 'r4Oks2_0.vid') then
      dbgrOks2.Columns.LoadFromFile(cDirVids + 'r4Oks2_0.vid');
    if FileExists(cDirVids + 'r4Oks3_0.vid') then
      dbgrOks3.Columns.LoadFromFile(cDirVids + 'r4Oks3_0.vid');
    if FileExists(cDirVids + 'r4_SvRs1.vid') then
      dbgrSvRes.Columns.LoadFromFile(cDirVids + 'r4_SvRs1.vid');
    if cSvActivePageName = 'ts1' then
      PageControl1.ActivePage := ts1
    else if cSvActivePageName = 'ts2' then
      PageControl1.ActivePage := ts2
    else if cSvActivePageName = 'ts3' then
      PageControl1.ActivePage := ts3
    else if cSvActivePageName = 'ts4' then
      PageControl1.ActivePage := ts4; end
  else begin
    dsrcPeriodu.DataSet := nil;
    dsrcPrmUv.DataSet   := nil;
    dsrcMD.DataSet      := nil;
    dsrcOtkl.DataSet    := nil;
    dsrcNu.DataSet      := nil;
    dsrcOKS.DataSet     := nil;
    dsrcSvRes.DataSet   := nil;
  end;

  PeekQuery := TQuery.Create(nil);
end;

//------------------------------------------------------------------------------
procedure TFormRs5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tblMD.IndexName := '';
  tblMD.Close;
  if bFlagDbg then begin
    dbgrPeriodu.Columns.SaveToFile(cDirVids + 'r2_Perio.vid');
    dbgrMD.Columns.SaveToFile(cDirVids   + 'r2_Md01.vid');
    dbgrPere.Columns.SaveToFile(cDirVids    + 'r4_MD027.vid');
    dbgrOtkl.Columns.SaveToFile(cDirVids    + 'r4_Otkl.vid');
    dbgrNu.Columns.SaveToFile(cDirVids      + 'r5_Nu06.vid');
    dbgrOKS.Columns.SaveToFile(cDirVids     + 'r4_Oks0.vid');
    dbgrOks2.Columns.SaveToFile(cDirVids    + 'r4Oks2_0.vid');
    dbgrOks3.Columns.SaveToFile(cDirVids    + 'r4Oks3_0.vid');
    dbgrSvRes.Columns.SaveToFile(cDirVids   + 'r4_SvRs1.vid');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TRY
  if bFlagDbg then begin
    with TIniFile.Create(cNmIniFile) do begin
      WriteInteger(SECTION, 'wL', Left);
      WriteInteger(SECTION, 'wT', Top);
      WriteInteger(SECTION, 'wH', Height);
      WriteInteger(SECTION, 'wW', Width);
      WriteInteger(SECTION, 'dbgrPerioH', dbgrMd.Height);
      WriteInteger(SECTION, 'dbgrMdW', dbgrMD.Width);
      WriteInteger(SECTION, 'dbgrOtklH', dbgrOtkl.Height);
      WriteInteger(SECTION, 'Panel3H', Panel3.Height);
      WriteInteger(SECTION, 'dbgrOksH', dbgrOks.Height);
      WriteInteger(SECTION, 'dbgrOks3H', dbgrOks3.Height);
      WriteString(SECTION, 'ActiveTs', PageControl1.ActivePage.Name);
      WriteBool(SECTION, 'bNuFilter', sBtnTblNuFilter.Down);
      WriteBool(SECTION, 'LbxPeriodu', sBtnLbxPeriodu.Down);
      Free;
    end;
  end;
  EXCEPT
    // Nothing
  RAISE;
    // Nothing
  END;

  PeekQuery.Free;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgrOtklDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var dOtklDtZaMG, dRMes : TDateTime;  nPrKr, nCase : integer;
begin
  dOtklDtZaMG := dbgrOtkl.DataSource.DataSet.FieldByName('ZaMesGod').AsDateTime;
  nPrKr := dbgrOtkl.DataSource.DataSet.FieldByName('PrKr').AsInteger;
  dRMes := tblPerioduZaMesGod.AsDateTime;
  if (nPrKr = 1) and (dOtklDtZaMG > dRMes) then
    nCase := 2    // из будущего
  else if (nPrKr = 1) and (dOtklDtZaMG = dRMes) then
    nCase := 3    // из прошлого для текущего с PrKr = 1
  else if (dOtklDtZaMG < dRMes) then
    nCase := 1    // из прошлого
  else
    nCase := 0;   // из текущего для текущего
  with dbgrOtkl.Canvas do begin
    if not (gdFocused in State) then begin
      if (nCase = 2) then              // из будущего
        Font.Color := clOlive
      else if (nCase = 1) then         // из прошлого
        Font.Color := clGreen
      else                             // текущий
        Font.Color := clWindowText;
      if (Column.FieldName = 'SUMMA') and (Column.Field.Value < 0) then
          Font.Color := clRed;
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : string4; cFldNm : ShortString; n_DbgKdSps : SmallInt;
begin
  n_DbgKdSps := gl_nKdSps;
  cVidN := dbgrNU.DataSource.DataSet.FieldByName('VidN').AsString;
  cFldNm := UpperCase(Column.FieldName);
  with dbgrNU.Canvas do begin
    if not (gdFocused in State) then begin
     if (LbxF8.Items.IndexOf(tblNuNR.AsString) >= 0) then
       Brush.Color := clBtnFace
     else if (dbgrNU.DataSource.DataSet.
                      FieldByName('ZaMesGod').AsDateTime > dDtProc) then
        Brush.Color := clCream
      else if (dbgrNU.DataSource.DataSet.
                      FieldByName('ZaMesGod').AsDateTime < dDtProc) then
        Brush.Color := clInfoBk
      else
        Brush.Color := clWindow;
      if (dbgrNU.DataSource.DataSet.
                      FieldByName('ZaMesGod').AsDateTime > dDtProc) then begin
        if cVidN >= '8600' then
          Font.Color := clGray
        else
          Font.Color := clOlive; end
      else if cVidN >= '8600' then
        Font.Color := clGray
      else if (cVidN >= '7500') and (cVidN < '7600') then
        Font.Color := clBlue
      else if (dbgrNU.DataSource.DataSet.
                           FieldByName('DtProc').AsDateTime < dDtProc) or
             (dbgrNU.DataSource.DataSet.FieldByName('PrPV').AsInteger = 5) then
        Font.Color := clGreen
      else if dbgrNU.DataSource.DataSet.FieldByName('PrPV').AsInteger = 6 then
        Font.Color := clPurple
      else if dbgrNU.DataSource.DataSet.FieldByName('PrPV').AsInteger = 1 then
        Font.Color := clMaroon
      else if dbgrNU.DataSource.DataSet.FieldByName('PrPV').AsInteger = 3 then
        Font.Color := clNavy
      else
        Font.Color := clWindowText;
      if cVidN = '2724' then    // долг за работником
        Font.Color := clRed;
      if (dbgrNU.DataSource.DataSet.
                      FieldByName('PdN').AsInteger <= 0) then
        Font.Color := clFuchsia;
      if (cFldNm = 'VIDN') then
        Font.Color := clTeal
      else if ((cFldNm = 'OLDSM') or
              (cFldNm = 'SUMMA') or
              (cFldNm = 'D__SMM')) and (Column.Field.Value < 0) then
        Font.Color := clRed;
      if dbgrNU.DataSource.DataSet.FieldByName('KdSps').AsInteger <> n_DbgKdSps then
        Font.Style := []
      else
        Font.Style := [fsBold];
    end;
  end;
  dbgrNU.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.tblNuCalcFields(DataSet: TDataSet);
begin
  if tblNU.Active then begin
    tblNUd__Smm.AsFloat := tblNuSumma.AsFloat - tblNuOldSm.AsFloat;
    tblNUd__Chs.AsFloat := tblNuChas.AsFloat - tblNuOldCh.AsFloat;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.cdsOKSCalcFields(DataSet: TDataSet);
begin
//  if bFlagDbg and not cdsOKSKdSpZ.IsNull then
//    cdsOKSSchBU.AsString := DmMain.KdSbu2SchBU(cdsOKSKdSpZ.AsInteger);
//    // хотя поле и не Calculate, но позволяет такую хохму
end;
//------------------------------------------------------------------------------
procedure TFormRs5.cdsOKFloatFieldGetText(Sender: TField;
                                        var Text: String; DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsInteger = 0)) then
    Text := ''
  else
    Text := FloatToStrF((Sender as TField).AsFloat, ffFixed, 18, 2);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnTblNuFilterClick(Sender: TObject);
begin
  SetTblNuFilter;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.SetTblNuFilter;
begin
  if bFlagDbg then begin
    if sBtnTblNuFilter.Down then begin
      tblNu.Filter := 'VidN < ''8000''';
      tblNu.Filtered := true;
      tblSvRes.Filter := 'VidN < ''8000''';
      tblSvRes.Filtered := true;
      sBtnTblNuFilter.Font.Color := clRed; end
    else begin
      tblNu.Filtered := false;
      tblSvRes.Filtered := false;
      sBtnTblNuFilter.Font.Color := clWindowText;
    end; end
  else begin
    tblNu.Filtered := false;
    tblSvRes.Filtered := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgrSvResDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : string4;
begin
  cVidN := tblSvResVidN.AsString;
  with dbgrSvRes.Canvas do begin
    if not (gdFocused in State) then begin
      if tblSvResKdSps.AsInteger <> gl_nKdSps then
        Font.Style := []
      else
        Font.Style := [fsBold];
      if (tblSvResZaMesGod.AsDateTime > d_DtCtrl) then
        Brush.Color := clCream
      else if (tblSvResZaMesGod.AsDateTime < d_DtCtrl) then
        Brush.Color := clInfoBk;
      if (tblSvResZaMesGod.AsDateTime > d_DtCtrl) then begin
        if cVidN >= '8600' then begin
          Font.Color := clGray;
          Font.Style := []; end
        else
          Font.Color := clOlive; end
      else if cVidN >= '8600' then begin
        Font.Color := clGray;
        Font.Style := []; end
      else if (cVidN >= '7500') and (cVidN < '7600') then
        Font.Color := clBlue
      else if (tblSvResDtProc.AsDateTime < d_DtCtrl) or
                                  (tblSvResPrPV.AsInteger = 5) then
        Font.Color := clGreen
      else if tblSvResPrPV.AsInteger = 6 then
        Font.Color := clPurple
      else if tblSvResPrPV.AsInteger = 1 then
        Font.Color := clMaroon
      else if tblSvResPrPV.AsInteger = 3 then
        Font.Color := clNavy
      else
        Font.Color := clWindowText;
      if cVidN = '2724' then    // долг за работником
        Font.Color := clRed;
      if (tblSvResPdN.AsInteger <= 0) then
        Font.Color := clFuchsia;
      if UpperCase(Column.FieldName) = 'VIDN' then
        Font.Color := clBlue;
      if (UpperCase(Column.FieldName) = 'SUMMA') and
                                  (Column.Field.Value < 0) then
          Font.Color := clRed;
    end;
  end;
  dbgrSvRes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.tblSvResCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  if bFlagDbg then
    tblSvResShVidN.AsString := DmMain.VidN2ShVidN(tblSvResVidN.AsString,
                                                                     cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnLbxPerioduClick(Sender: TObject);
begin
  SetLbxPerioduVisible;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.SetLbxPerioduVisible;
begin
  LbxPeriodu.Visible := sBtnLbxPeriodu.Down;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
(*
//------------------------------------------------------------------------------
function TFormRs5.IsPrmUv(nTabN: integer; dDtPrc: TDateTime): boolean;
var dDtBeg, dDtEnd, dDtFirstWrkDayInMes : TDateTime;
begin // Были ли по nTabN в месяце dDtPrc приём или увольнение
  Result := false;   // если принят раньше или в первый рабочий день месяца,
  dDtBeg := dDtPrc;  // считается, что работал весь месяц (если не уволен в
  dDtEnd := MyLastDOM(dDtBeg); // этом же месяце)
  dDtFirstWrkDayInMes := DmMain.FirstWrkDayInMes(dDtPrc);
  with qryPrmUv do begin
    First;
    while not Eof do begin
      if ((FieldByName('Dt_Priem').AsDateTime > dDtFirstWrkDayInMes) and
           (FieldByName('Dt_Priem').AsDateTime <= dDtEnd)) or
             (not FieldByName('Dt_Uvoln').IsNull and
                   (FieldByName('Dt_Uvoln').AsDateTime >= dDtBeg) and
                    (FieldByName('Dt_Uvoln').AsDateTime <= dDtEnd)) then begin
        Result := true;
        Break;
      end;
      Next;
    end;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnF8Click(Sender: TObject);
var i : SmallInt;
begin
  if tblNu.Active and (tblNu.RecordCount > 0) then begin
    i := LbxF8.Items.IndexOf(tblNuNR.AsString);
    if i < 0 then
      LbxF8.Items.Add(tblNuNR.AsString)
    else
      LbxF8.Items.Delete(i);
    if not tblNu.Eof then
      tblNu.Next
    else
      dbgrNu.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgrNUKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnF8.Click
  else if (Key = VK_F5) and (Shift = []) then begin
    if not PanelSelTts.Visible then
      ShwSelTts
    else
      PanelSelTts.Visible := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.ShwSelTts;
var nSmOldSm, nSmSumma, nSmD__Sm : double; nSvNR : integer;
begin
  if tblNu.Active and (tblNu.RecordCount > 0) then begin
    nSmOldSm := 0;
    nSmSumma := 0;
    nSmD__Sm := 0;
    with tblNu do begin
      nSvNR := tblNuNR.AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        if LbxF8.Items.IndexOf(tblNuNR.AsString) >= 0 then begin
          nSmOldSm := nSmOldSm + tblNuOldSm.AsFloat;
          nSmSumma := nSmSumma + tblNuSumma.AsFloat;
          nSmD__Sm := nSmD__Sm + tblNuD__Smm.AsFloat;
        end;
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    LabelOldSm.Caption := FloatToStrF(nSmOldSm, ffCurrency, 18, 2);
    LabelNewSm.Caption := FloatToStrF(nSmSumma, ffCurrency, 18, 2);
    LabelD__Sm.Caption := FloatToStrF(nSmD__Sm, ffCurrency, 18, 2);
    PanelSelTts.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.popNuPopup(Sender: TObject);
begin
  popF8.Visible         := false;
  popUnSelAll.Visible   := false;
  popShwTts.Visible     := false;
  popNuPrtTable.Visible := false;
  popPrtCdsZNU.Visible  := false;
  if popNu.PopupComponent = dbgrNU then begin
    popF8.Visible         := true;
    popUnSelAll.Visible   := true;
    popShwTts.Visible     := true;
    popNuPrtTable.Visible := true;
    popF8.Enabled         := tblNu.Active and (tblNu.RecordCount > 0);
    popUnSelAll.Enabled   := popF8.Enabled and (LbxF8.Items.Count > 0);
    popShwTts.Enabled     := popUnSelAll.Enabled;
    popNuPrtTable.Enabled := tblNu.Active and (tblNu.RecordCount > 0); end
  else if popNu.PopupComponent = dbgrZ_NU then begin
    popPrtCdsZNU.Visible := true;
    popPrtCdsZNU.Enabled := cdsZ_NU.RecordCount > 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnClosePanelSelTtsClick(Sender: TObject);
begin
  PanelSelTts.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.popUnSelAllClick(Sender: TObject);
begin
  LbxF8.Clear;
  dbgrNu.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.popShwTtsClick(Sender: TObject);
begin
  if not PanelSelTts.Visible then
    ShwSelTts
  else
    PanelSelTts.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgrOKSDblClick(Sender: TObject);
begin
  if cdsOks.Active and (cdsOks.RecordCount > 0) then with cdsOks do begin
    Edit;
    cdsOksMetka.AsBoolean := not cdsOksMetka.AsBoolean;
    Post;
    dbgrOks.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgrOKSDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrOks.Canvas do begin
    if not (gdFocused in State) then begin
     if cdsOksMetka.AsBoolean then
        Font.Style := [fsBold]
      else
        Font.Style := [];
    end;
  end;
  dbgrOks.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnCheckOksClick(Sender: TObject);
var nSvNR, nPart, nKdSps, nKdObj, nKdKatP, nKdSpZ, nPrr : Smallint;
    nForCmn, nNwCmn, {nSgmCmn, nSvPrgCmn,}
    nForPps, nNwPps, {nSgmPps, nSvPrgPps,}
    nForBln, nNwBln, {nSgmBln, nSvPrgBln,}
    nForDkr, nNwDkr, {nSgmDkr, nSvPrgDkr,}
    nForDgv, nNwDgv{, nSgmDgv, nSvPrgDgv,}
    {nForPdnCmn, nForPdnDgv, nForPrfs, nForWSb} : double;  bLocate : boolean;
begin
  with cdsOks do begin
    nPart := 2;
    First;
    while not Eof do begin
      if cdsOksStep.AsInteger = 1 then begin
        nSvNR   := cdsOksNR.AsInteger;
        nKdSps  := cdsOksKdSps.AsInteger;
        nKdObj  := cdsOksKdObj.AsInteger;
        nKdKatP := cdsOksKdKatP.AsInteger;
        nKdSpZ  := cdsOksKdSpZ.AsInteger;
        nPrr    := cdsOksPrr.AsInteger;
        nForCmn   := cdsOksSForCmn.AsFloat;
        nNwCmn    := cdsOksSNwCmn.AsFloat;
//        nSgmCmn   := cdsOksSSgmCmn.AsFloat;
//        nSvPrgCmn := cdsOksSvPrgCmn.AsFloat;
        nForPps   := cdsOksSForPps.AsFloat;
        nNwPps    := cdsOksSNwPps.AsFloat;
//        nSgmPps   := cdsOksSSgmPps.AsFloat;
//        nSvPrgPps := cdsOksSvPrgPps.AsFloat;
        nForBln   := cdsOksSForBln.AsFloat;
        nNwBln    := cdsOksSNwBln.AsFloat;
//        nSgmBln   := cdsOksSSgmBln.AsFloat;
//        nSvPrgBln := cdsOksSvPrgBln.AsFloat;
        nForDkr   := cdsOksSForDkr.AsFloat;
        nNwDkr    := cdsOksSNwDkr.AsFloat;
//        nSgmDkr   := cdsOksSSgmDkr.AsFloat;
//        nSvPrgDkr := cdsOksSvPrgDkr.AsFloat;
        nForDgv   := cdsOksSForDgv.AsFloat;
        nNwDgv    := cdsOksSNwDgv.AsFloat;
//        nSgmDgv   := cdsOksSSgmDgv.AsFloat;
//        nSvPrgDgv := cdsOksSvPrgDgv.AsFloat;
//        nForPdnCmn := cdsOksSForPdnC.AsFloat;
//        nForPdnDgv := cdsOksSForPdnD.AsFloat;
//        nForPrfs   := cdsOksSForPrf.AsFloat;
//        nForWSb    := cdsOksSForWSb.AsFloat;
        bLocate := false;
        if cdsOks.Locate('Step;KdSps;KdObj;KdKatP;KdSpZ;Prr;' +
                         'sForCmn;sNwCmn;sForPps;sNwPps;sForBln;sNwBln;' +
                         'sForDkr;sNwDkr;sForDgv;sNwDgv;Metka',
                         VarArrayOf([nPart,nKdSps,nKdObj,nKdKatP,nKdSpZ,nPrr,
                         nNwCmn,nForCmn,nNwPps,nForPps,nNwBln,nForBln,
                         nNwDkr,nForDkr,nNwDgv,nForDgv,True]), []) then begin
          Edit;
          cdsOksMetka.AsBoolean := false;
          Post;
          bLocate := true;
        end;
        Locate('NR', nSvNR, []);
        if bLocate then begin
          Edit;
          cdsOksMetka.AsBoolean := false;
          Post;
        end;
      end;
      Next;
    end;
    First;
  end;
end;
(*
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmForEsv(dRMes : TDateTime;
                               var nSmECmnFor, nSmEPpsFor, nSmEBlnFor,
                                   nSmEDkrFor, nSmEDgvFor,
                                   nSvPrg, nSvPECmn, nSvPEPps,
                                   nSvPEBln, nSvPEDkr, nSvPEDgv : double);
var cVidN : ShortString; nSmm : double;
    nKdKatP{, nPrr} : SmallInt;
begin   // Про инвалидность, больничность и пр. буду рзбираться при
        // использовании результатов во время начисления соответствующих сумм
  nSmECmnFor := 0;
  nSmEPpsFor := 0;
  nSmEBlnFor := 0;
  nSmEDkrFor := 0;
  nSmEDgvFor := 0;
  nSvPrg     := 0;
  nSvPECmn   := 0;
  nSvPEPps   := 0;
  nSvPEBln   := 0;
  nSvPEDkr   := 0;
  nSvPEDgv   := 0;
  with tblNu do begin
    DisableControls;
    First;
    while not Eof do begin
      cVidN   := tblNuVidN.AsString;
      if (tblNuSp_PF.AsString = '1') then begin
        nSmm    := tblNuSumma.AsFloat;
//        nPrr    := tblNuPrr.AsInteger;
        nKdKatP := tblNuKdKatP.AsInteger;
        if (cVidN < '6000') then begin
          if (cVidN = '2602') then
            nSmEDkrFor := nSmEDkrFor + nSmm
          else if (cVidN >= '2601') and (cVidN <= '2605') then
            nSmEBlnFor := nSmEBlnFor + nSmm
          else if (nKdKatP = 1) then
            nSmEPpsFor := nSmEPpsFor + nSmm
          else if (nKdKatP = 13) then
            nSmEDgvFor := nSmEDgvFor + nSmm
          else {if nKdKatP = other then}
            nSmECmnFor := nSmECmnFor + nSmm; end
        else if (cVidN = '8606') then
          nSvPECmn := nSvPECmn + nSmm
        else if (cVidN = '8607') then
          nSvPEPps := nSvPEPps + nSmm
        else if (cVidN = '8608') then
          nSvPEBln := nSvPEBln + nSmm
        else if (cVidN = '8609') then
          nSvPEDkr := nSvPEDkr + nSmm
        else if (cVidN = '8606') then
          nSvPEDgv := nSvPEDgv + nSmm;
      end;
      Next;
      nSvPrg := nSvPECmn + nSvPEPps + nSvPEBln + nSvPEDkr + nSvPEDgv;
    end;
    EnableControls;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmForPrfs(dRMes : TDateTime;
                     var nOldSmForXX, nNewSmForXX, nOldSmXX, nNewSmXX : double);
var cVidN : ShortString;
begin
  nOldSmForXX := 0;
  nNewSmForXX := 0;
  nOldSmXX    := 0;
  nNewSmXX    := 0;
  with tblNu do begin
    DisableControls;
    First;
    while not Eof do begin
      if tblNuZaMesGod.AsDateTime = dRMes then begin
        cVidN   := tblNuVidN.AsString;
        if (cVidN < '6000') and (tblNuSPrf.AsString = '1') then begin
          nOldSmForXX := nOldSmForXX + tblNuOldSm.AsFloat;
          nNewSmForXX := nNewSmForXX + tblNuSumma.AsFloat; end
        else if (cVidN = '6021') then begin
          nOldSmXX := nOldSmXX - tblNuOldSm.AsFloat;
          nNewSmXX := nNewSmXX + tblNuSumma.AsFloat;
        end;
      end;
      Next;
    end;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmForWSb(dRMes : TDateTime;
                     var nOldSmForXX, nNewSmForXX, nOldSmXX, nNewSmXX : double);
var cVidN : ShortString;
begin
  nOldSmForXX := 0;
  nNewSmForXX := 0;
  nOldSmXX    := 0;
  nNewSmXX    := 0;
  with tblNu do begin
    DisableControls;
    First;
    while not Eof do begin
      if tblNuZaMesGod.AsDateTime =dRMes then begin
        cVidN   := tblNuVidN.AsString;
        if (cVidN < '6000') and (tblNuSWSb.AsString = '1') then begin
          nOldSmForXX := nOldSmForXX + tblNuOldSm.AsFloat;
          nNewSmForXX := nNewSmForXX + tblNuSumma.AsFloat; end
        else if (cVidN = '6007') then begin
          nOldSmXX := nOldSmXX - tblNuOldSm.AsFloat;
          nNewSmXX := nNewSmXX + tblNuSumma.AsFloat;
        end;
      end;
      Next;
    end;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmForPdn(dRMes: TDateTime;
                var nOldSmCmnFX, nOldSmDgvFX, nNewSmCmnFX, nNewSmDgvFX,
                    nOldSmCmnXX, nOldSmDgvXX, nNewSmCmnXX, nNewSmDgvXX: double);
var cVidN : ShortString;
begin
  nOldSmCmnFX := 0;
  nOldSmDgvFX := 0;
  nNewSmCmnFX := 0;
  nNewSmDgvFX := 0;
  nOldSmCmnXX := 0;
  nOldSmDgvXX := 0;
  nNewSmCmnXX := 0;
  nNewSmDgvXX := 0;
  with tblNu do begin
    DisableControls;
    First;
    while not Eof do begin
      if tblNuZaMesGod.AsDateTime = dRMes then begin
        cVidN := tblNuVidN.AsString;
        if (cVidN <= '6001') and (tblNuSPdn.AsString = '1') then begin
          if (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008') then begin
            nOldSmDgvFX := nOldSmDgvFX + tblNuOldSm.AsFloat;
            nNewSmDgvFX := nNewSmDgvFX + tblNuSumma.AsFloat; end
          else if (cVidN < '6000') then begin
            nOldSmCmnFX := nOldSmCmnFX + tblNuOldSm.AsFloat;
            nNewSmCmnFX := nNewSmCmnFX + tblNuSumma.AsFloat; end
          else if (cVidN = '6001') and (tblNuMyNotes.AsString = 'Cmn') then begin
            nOldSmCmnXX := nOldSmCmnXX + tblNuOldSm.AsFloat;
            nNewSmCmnXX := nNewSmCmnXX + tblNuSumma.AsFloat; end
          else if (cVidN = '6001') and (tblNuMyNotes.AsString = 'Dgv') then begin
            nOldSmDgvXX := nOldSmDgvXX + tblNuOldSm.AsFloat;
            nNewSmDgvXX := nNewSmDgvXX + tblNuSumma.AsFloat;
          end;
        end;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.MadeNewEsvEqualOldEsv(bEsv, bEsvPrp : boolean);
var cVidN : ShortString;
begin
  with tblNu do begin
    DisableControls;
    First;
    while not Eof do begin
      cVidN := tblNuVidN.AsString;
      if bEsv and ((cVidN = '6201') or (cVidN = '6206') or (cVidN = '6211') or
                          (cVidN = '6212') or (cVidN = '6216')) then begin
        Edit;
        if (tblNuSumma.IsNull or (tblNuSumma.AsFloat = 0)) and
                                             not tblNuOldSm.IsNull then begin
          tblNuSumma.AsString := tblNuOldSm.AsString;
          tblNuMyNotes.AsString := 'Yes'; end
        else if (tblNuOldSm.IsNull or (tblNuOldSm.AsFloat = 0)) and
                                             not tblNuSumma.IsNull then begin
          tblNuOldSm.AsString := tblNuSumma.AsString;
          tblNuMyNotes.AsString := 'Not';
        end;
      end;
      if bEsvPrp and ((cVidN = '8681') or (cVidN = '8682') or (cVidN = '8683') or
                          (cVidN = '8684') or (cVidN = '8685') or
         (cVidN = '8686') or (cVidN = '8687') or (cVidN = '8688') or
                                                  (cVidN = '8691')) then begin
        Edit;
        if (tblNuSumma.IsNull or (tblNuSumma.AsFloat = 0)) and
                                             not tblNuOldSm.IsNull then begin
          tblNuSumma.AsString := tblNuOldSm.AsString;
          tblNuMyNotes.AsString := 'Yes'; end
        else if (tblNuOldSm.IsNull or (tblNuOldSm.AsFloat = 0)) and
                                             not tblNuSumma.IsNull then begin
          tblNuOldSm.AsString := tblNuSumma.AsString;
          tblNuMyNotes.AsString := 'Not';
        end;
        Post;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.CreOpenCdsOks3(dRmes: TDateTime);
var dDbgMes : TDateTime;
begin
  with cdsOks3 do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  sBtnOks2Filter.Down := true;
  //cdsOks2.SaveToFile(cDirTemp + 'Oks2an_0.cds');
  SetOks2Filter;
  //cdsOks2.SaveToFile(cDirTemp + 'Oks2an_1.cds');
  with cdsOks2 do begin
    //if bFlagDbg then
    //  SaveToFile(cDirTemp + 'Oks2an1.cds');
    Filtered := true;
    First;
    while not Eof do begin
      dDbgMes := cdsOks2RMes.AsDateTime;
      AddRecInCdsOks3(dDbgMes) ;
      Next;
    end;
    First;

    if bFlagDbg then begin
      Filtered := false;
      SaveToFile(cDirTemp + 'Oks2an2.cds');
      Filtered := true;
    end
  end;

  if bFlagDbg then
    CdsOks3.SaveToFile(cDirTemp + 'Oks3.cds');
end;

//------------------------------------------------------------------------------
procedure TFormRs5.AddRecInCdsOks3(dRMes : TDateTime);
var dRepMes, {dRMes,} dZaMG : TDateTime;
    nKdSps, nKdTemu, nKdObj, nKdKatP, nKdSpZ, nPrr : SmallInt;
    cVidN, cSchBU : ShortString;
    nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv,
       nPrcECmnPrp, nPrcEInvPrp, nPrcEBlnPrp, nPrcEBlnInvPrp,
       nPrcEDkrPrp, nPrcEDkrInvPrp, nPrcEDgvPrp,
       nPrcPdnCmn, nPrcPdnDgv, nPrcPrfs, nPrcWSb, nMinZp, nProgMin : double;
begin
  dRepMes := cdsOks2RepMes.AsDateTime; // Почему-то в cdsOks2RepMes оказывает-
  if dRepMes < 0 then // ся RepMes  < 0 (01-09-0016 на ТабН = 5756 вид 1609)
    dRepMes := dRMes; // Так вырутился в 09-2016, что будет дальше - СЛЕДИТЬ !!!
//  dRMes   := cdsOks2ZaMG.AsDateTime;
  GetAnyValues(dRepMes, nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv,
                         nPrcECmnPrp, nPrcEInvPrp, nPrcEBlnPrp, nPrcEBlnInvPrp,
                      nPrcEDkrPrp, nPrcEDkrInvPrp, nPrcEDgvPrp,
                   nPrcPdnCmn, nPrcPdnDgv, nPrcPrfs, nPrcWSb, nMinZp, nProgMin);
  dZaMG   := cdsOks2ZaMG.AsDateTime;
  nKdSps  := cdsOks2KdSps.AsInteger;
  nKdTemu := cdsOks2KdTemu.AsInteger;
  nKdObj  := cdsOks2KdObj.AsInteger;
  nKdKatP := cdsOks2KdKatP.AsInteger;
  nKdSpZ  := cdsOks2KdSpZ.AsInteger;
  nPrr    := cdsOks2Prr.AsInteger;
  cVidN   := cdsOks2VidN.AsString;
  cSchBU  := cdsOks2SchBU.AsString;
  with cdsOks3 do begin
    if not Locate('RepMes;KdSps;KdTemu;KdObj;KdKatP;KdSpZ',
             VarArrayOf([dRepMes,nKdSps,nKdTemu,nKdObj,nKdKatP,nKdSpZ]), [])
                                                                      then begin
      Append;
      cdsOks3RepMes.AsDateTime := dRepMes;
      cdsOks3RMes.AsDateTime   := dRMes;
      cdsOks3ZaMG.AsDateTime   := dZaMG;
      cdsOks3KdSps.AsInteger   := nKdSps;
      cdsOks3KdTemu.AsInteger  := nKdTemu;
      cdsOks3KdObj.AsInteger   := nKdObj;
      cdsOks3KdKatP.AsInteger  := nKdKatP;
      cdsOks3KdSpZ.AsInteger   := nKdSpZ;
      cdsOks3Prr.AsInteger     := nPrr;
      cdsOks3SchBU.AsString    := cSchBU; end
    else
      Edit;
    cdsOks3PrcECmn.AsFloat := nPrcECmn;
    cdsOks3PrcEPps.AsFloat := nPrcEPps;
    cdsOks3PrcEBln.AsFloat := nPrcEBln;
    cdsOks3PrcEDkr.AsFloat := nPrcEDkr;
    cdsOks3PrcEDgv.AsFloat := nPrcEDgv;
    cdsOks3PrcECmnPrp.AsFloat    := nPrcECmnPrp;
    cdsOks3PrcEInvPrp.AsFloat    := nPrcEInvPrp;
    cdsOks3PrcEBlnPrp.AsFloat    := nPrcEBlnPrp;
    cdsOks3PrcEBlnInvPrp.AsFloat := nPrcEBlnInvPrp;
    cdsOks3PrcEDkrPrp.AsFloat    := nPrcEDkrPrp;
    cdsOks3PrcEDkrInvPrp.AsFloat := nPrcEDkrInvPrp;
    cdsOks3PrcEDgvPrp.AsFloat    := nPrcEDgvPrp;

    if (cVidN = '2602') then begin
      cdsOks3SNwDkr.AsFloat := cdsOks3SNwDkr.AsFloat + cdsOks2SmNew.AsFloat;
      cdsOks3SNwDkrPrp.AsFloat := cdsOks3SNwDkrPrp.AsFloat +
                                                   cdsOks2SmNew.AsFloat; end
    else if (cVidN >= '2601') and (cVidN <= '2605') then begin
      cdsOks3SNwBln.AsFloat := cdsOks3SNwBln.AsFloat + cdsOks2SmNew.AsFloat;
      cdsOks3SNwBlnPrp.AsFloat := cdsOks3SNwBlnPrp.AsFloat +
                                                   cdsOks2SmNew.AsFloat; end
    else if {(nPrr = 0) and} (nKdKatP <> 1) and (nKdKatP <> 13) then begin
      cdsOks3SNwCmn.AsFloat := cdsOks3SNwCmn.AsFloat + cdsOks2SmNew.AsFloat;
      cdsOks3SNwCmnPrp.AsFloat := cdsOks3SNwCmnPrp.AsFloat +
                                                   cdsOks2SmNew.AsFloat; end
    else if {(nPrr = 0) and} (nKdKatP = 1) then begin
      cdsOks3SNwPps.AsFloat := cdsOks3SNwPps.AsFloat + cdsOks2SmNew.AsFloat;
      cdsOks3SNwCmnPrp.AsFloat := cdsOks3SNwCmnPrp.AsFloat +
       {это правильно - для Прп они объединяются}  cdsOks2SmNew.AsFloat; end
    else if (nKdKatP = 13) then begin
      cdsOks3SNwDgv.AsFloat := cdsOks3SNwDgv.AsFloat + cdsOks2SmNew.AsFloat;
      cdsOks3SNwDgvPrp.AsFloat := cdsOks3SNwDgvPrp.AsFloat +
                                                       cdsOks2SmNew.AsFloat;
    end;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.CreOpenCdsOks2(dRMes : TDateTime);
begin
  with cdsOks2 do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryOks2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := tblNu.DatabaseName;
    SQL.Add('Select ZaMesGod, DtProc, VidN, ShVidN, KdSps, KdTemu, KdObj, ' +
            ' KdKatP, Prr, Sp_PF, SPdn, SPrf, SWSb, KdSpZ, SchBU, ' +
            ' Sum(OldSm) SmOld, Sum(Summa) SmNew, Sum(Summa-OldSm) SmDelta, ' +
            ' MyNotes from ' + tblNu.TableName + ' where (VidN < "6000") or ' +
            ' (VidN >= "8681" and VidN <= "8691") ' +
            ' group by ZaMesGod, DtProc, VidN, ShVidN, KdSps, KdTemu, KdObj, ' +
            ' KdKatP, PRR, Sp_PF, SPdn, SPrf, SWSb, KdSpZ, SchBU, MyNotes');
    Open;
    while not Eof do begin
      AddRecInCdsOks2(dRMes);
      Next;
    end;
    //if bFlagDbg then
    //  cdsOks2.SaveToFile(cDirTemp + 'Oks2.cds');
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.AddRecInCdsOks2(dRMes : TDateTime);
var cSymbol : String1; dRepMes : TDateTime;
    {nMes, nGod : word;} cDbg, cMesGod : ShortString;
    nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv, nPrcECmnPrp, nPrcEInvPrp,
    nPrcEBlnPrp, nPrcEBlnInvPrp, nPrcEDkrPrp, nPrcEDkrInvPrp, nPrcEDgvPrp,
    nPrcPdnCmn, nPrcPdnDgv, nPrcPrfs, nPrcWSb, nMinZp, nProgMin : double;
begin
  with cdsOks2 do begin
    Append;
    cdsOks2RMes.AsString    := qryOks2.FieldByName('DtProc').AsString;
    cdsOks2ZaMG.AsString    := qryOks2.FieldByName('ZaMesGod').AsString;
    cdsOks2VidN.AsString    := qryOks2.FieldByName('VidN').AsString;
    cdsOks2ShVidN.AsString  := qryOks2.FieldByName('ShVidN').AsString;
    cdsOks2KdSps.AsString   := qryOks2.FieldByName('KdSps').AsString;
    cdsOks2KdTemu.AsString  := qryOks2.FieldByName('KdTemu').AsString;
    cdsOks2KdObj.AsString   := qryOks2.FieldByName('KdObj').AsString;
    cdsOks2KdKatP.AsString  := qryOks2.FieldByName('KdKatP').AsString;
    cdsOks2Prr.AsString     := qryOks2.FieldByName('Prr').AsString;
    cdsOks2Sp_PF.AsString   := qryOks2.FieldByName('Sp_PF').AsString;
    cdsOks2SPdn.AsString    := qryOks2.FieldByName('SPdn').AsString;
    cdsOks2SPrf.AsString    := qryOks2.FieldByName('SPrf').AsString;
    cdsOks2SWSb.AsString    := qryOks2.FieldByName('SWSb').AsString;
    cdsOks2KdSpZ.AsString   := qryOks2.FieldByName('KdSpZ').AsString;
    cdsOks2SchBU.AsString   := qryOks2.FieldByName('SchBU').AsString;
    cdsOks2MyNotes.AsString := qryOks2.FieldByName('MyNotes').AsString;
    cdsOks2SmOld.AsString   := qryOks2.FieldByName('SmOld').AsString;
    cdsOks2SmNew.AsString   := qryOks2.FieldByName('SmNew').AsString;
    cdsOks2SmDelta.AsString := qryOks2.FieldByName('SmDelta').AsString;
    cDbg := cdsOks2MyNotes.AsString;
    cSymbol := Copy(cDbg, 1, 1);
    if (Pos('%', cDbg) <= 0) and (Pos(cSymbol, STROKANUMB) > 0) then begin
      cMesGod := Copy(cdsOks2MyNotes.AsString, 1, 7);
      dRepMes := StrToDate('01-' + cMesGod); end
    else
      dRepMes := dRMes;
    cdsOks2RepMes.AsDateTime := dRepMes;
    GetAnyValues(dRepMes, nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv,
                         nPrcECmnPrp, nPrcEInvPrp, nPrcEBlnPrp, nPrcEBlnInvPrp,
                      nPrcEDkrPrp, nPrcEDkrInvPrp, nPrcEDgvPrp,
                   nPrcPdnCmn, nPrcPdnDgv, nPrcPrfs, nPrcWSb, nMinZp, nProgMin);
    cdsOks2PrcECmn.AsFloat  := nPrcECmn;
    cdsOks2PrcEPps.AsFloat  := nPrcEPps;
    cdsOks2PrcEBln.AsFloat  := nPrcEBln;
    cdsOks2PrcEDkr.AsFloat  := nPrcEDkr;
    cdsOks2PrcEDgv.AsFloat  := nPrcEDgv;
    cdsOks2PrcECmnPrp.AsFloat    := nPrcECmnPrp;
    cdsOks2PrcEInvPrp.AsFloat    := nPrcEInvPrp;
    cdsOks2PrcEBlnPrp.AsFloat    := nPrcEBlnPrp;
    cdsOks2PrcEBlnInvPrp.AsFloat := nPrcEBlnPrp;
    cdsOks2PrcEDkrPrp.AsFloat    := nPrcEDkrPrp;
    cdsOks2PrcEDkrInvPrp.AsFloat := nPrcEDkrPrp;
    cdsOks2PrcEDgvPrp.AsFloat    := nPrcEDgvPrp;
    cdsOks2PrcPdnCmn.AsFloat     := nPrcPdnCmn;
    cdsOks2PrcPdnDgv.AsFloat     := nPrcPdnDgv;
    cdsOks2PrcPrfs.AsFloat       := nPrcPrfs;
    cdsOks2PrcWSb.AsFloat        := nPrcWSb;
    cdsOks2SmMinZp.AsFloat       := nMinZp;
    cdsOks2SmProgMin.AsFloat     := nProgMin;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetAnyValues(dRepMes : TDateTime; var nPrcECmn, nPrcEPps,
                               nPrcEBln, nPrcEDkr, nPrcEDgv, nPrcECmnPrp,
                              nPrcEInvPrp, nPrcEBlnPrp, nPrcEBlnInvPrp,
                             nPrcEDkrPrp, nPrcEDkrInvPrp, nPrcEDgvPrp,
                            nPrcPdnCmn, nPrcPdnDgv, nPrcPrfs, nPrcWSb,
                                                     nMinZp, nProgMin : double);
begin
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Z_TEsv where DtBeg <= :dRepMes ' +
            ' order by DtBeg desc');
    ParamByName('dRepMes').AsDateTime := dRepMes;
    Open;
    nPrcECmn := FieldByName('PrcCmn').AsFloat;
    nPrcEPps := FieldByName('PrcPps').AsFloat;
    nPrcEBln := FieldByName('PrcBln').AsFloat;
    if not FieldByName('PrcDekr').IsNull then
      nPrcEDkr := FieldByName('PrcDekr').AsFloat
    else
      nPrcEDkr := nPrcEBln;
    nPrcEDgv := FieldByName('PrcGpd').AsFloat;
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 * from Z_TEsvP where DtBeg <= :dRepMes ' +
            ' order by DtBeg desc');
    ParamByName('dRepMes').AsDateTime := dRepMes;
    Open;
    nPrcECmnPrp := FieldByName('PrcCmn').AsFloat;
    nPrcEInvPrp := FieldByName('PrcInv').AsFloat;
    nPrcEBlnPrp := FieldByName('PrcBln').AsFloat;
    nPrcEBlnInvPrp := FieldByName('PrcBlnInv').AsFloat;
    if not FieldByName('PrcDekr').IsNull then
      nPrcEDkrPrp := FieldByName('PrcDekr').AsFloat
    else
      nPrcEDkrPrp := nPrcEBlnPrp;
    if not FieldByName('PrcDekrInv').IsNull then
      nPrcEDkrInvPrp := FieldByName('PrcDekrInv').AsFloat
    else
      nPrcEDkrInvPrp := nPrcEBlnInvPrp;
    nPrcEDgvPrp := FieldByName('PrcGpd').AsFloat;
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 * from Z_TPdn where DtBeg <= :dRepMes ' +
            ' order by DtBeg desc');
    ParamByName('dRepMes').AsDateTime := dRepMes;
    Open;
    nPrcPdnCmn := FieldByName('PrcPdn').AsFloat;
    nPrcPdnDgv := FieldByName('PrcPdn2').AsFloat;
    nPrcPrfs   := 1;
    nPrcWSb    := FieldByName('PrcWSb').AsFloat;
    nMinZp     := FieldByName('MinZP').AsFloat;
    nProgMin   := FieldByName('ProgMin').AsFloat;
  end;
  // Продолжить остальные
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnOks2FilterClick(Sender: TObject);
begin
  SetOks2Filter;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.SetOks2Filter;
var cFilter : ShortString;
begin
  cFilter := 'SmNew <> 0';
  cdsOks2.Filter := cFilter;
  cdsOks2.Filtered := sBtnOks2Filter.Down;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnPredSaveClick(Sender: TObject);
begin
  PredSaveResults(n_TN, d_DtCtrl);
  Application.ProcessMessages;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.PredSaveResults(nTabN : integer; dRMes : TDateTime);
var mOtklZaMG, mZaMgForSpecPS : TStringList;
    dZaMG, dDt_Beg, dDt_End : TDateTime;
    i, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ,
    nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR, nSpecPS : integer;
    cMsg, cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg, cKdBnk : string;
    nRecChas, nRecSumma, nChas, nSumma : double;
    bVidOtpBlnCurMes, bIsInv, bVidBudg{вид бюджетный}, bMore : boolean;
    bSvTblNuFiltered : boolean;
    nPLg : SmallInt;
begin   // Чтобы увидеть результат сохранения до фактического сохранения в БД 
  bSvTblNuFiltered := tblNU.Filtered;
  tblNu.Filtered := false;
  tblSvRes.Filtered := false;
  with cdsZ_NU do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  bVidOtpBlnCurMes := false;
  with tblSvRes do begin
    Filtered := false;
    IndexName := 'ZaMGVidN';
    First;
    while not Eof do begin
      cVidN     := tblSvResVidN.AsString;
      bVidBudg  := tblSvResCBudg.AsString = '1';
      dZaMG     := tblSvResZaMesGod.AsDateTime;
      dDt_Beg   := tblSvResDt_Beg.AsDateTime;
      dDt_End   := tblSvResDt_End.AsDateTime;
      n_KdSps   := tblSvResKdSps.AsInteger;
      n_KdTemu  := tblSvResKdTemu.AsInteger;
      n_KdObj   := tblSvResKdObj.AsInteger;
      n_KdKatP  := tblSvResKdKatP.AsInteger;
      n_KdSpZ   := tblSvResKdSpZ.AsInteger;
      nPdn      := tblSvResPdN.AsInteger;
      nPrPv     := tblSvResPrPv.AsInteger;
      nPRR      := tblSvResPRR.AsInteger;
      nKto      := tblSvResKto.AsInteger;
      nPrKr     := tblSvResPrKr.AsInteger;
      cDtVdPV   := tblSvResDtVdPV.AsString;
      cNrVdPV   := tblSvResNrVdPV.AsString;
      cOznPilg  := tblSvResOzn_Pilg.AsString;
      cKdBnk    := tblSvResKdBnk.AsString;
      nChas     := 0;
      nSumma    := 0;
      nSpec_NR  := tblSvResSpec_NR.AsInteger;
      bMore     := true;
      while bMore and (tblSvResVidN.AsString = cVidN) and
               (tblSvResDtVdPV.AsString = cDtVdPV) and
                (tblSvResNrVdPV.AsString = cNrVdPV) and
                 (tblSvResZaMesGod.AsDateTime = dZaMG) and
                  (tblSvResKdSps.AsInteger = n_KdSps) and
                  (tblSvResKdTemu.AsInteger = n_KdTemu) and
                   (tblSvResKdObj.AsInteger = n_KdObj) and
                    (tblSvResKdKatP.AsInteger = n_KdKatP) and
                     (tblSvResKdSpZ.AsInteger = n_KdSpZ) and
                      (tblSvResPdN.AsInteger = nPdn) and
                       //(tblSvResPrPv.AsInteger = nPrPv) and
                        //(tblSvResPRR.AsInteger = nPRR) and
                         (tblSvResKto.AsInteger = nKto) and
                          (tblSvResPrKr.AsInteger = nPrKr) and
                           (tblSvResSpec_NR.AsInteger = nSpec_NR) and
                           // без верхнего условия (nSpec_NR) одноВидные удержа-
                           // ния сливаются. Например, алименты разным тёткам
                                                             not Eof do begin
        nRecChas := RoundTo(tblSvResChas.AsFloat, -2);
        nRecSumma := RoundTo(tblSvResSumma.AsFloat, -2);
        if (nRecChas = 0) and (nRecSumma = 0) and
                                            not bVidOtpBlnCurMes then begin
          Next;
          Continue;
        end;
        bVidOtpBlnCurMes := (tblSvResZaMesGod.AsDateTime = dDtProc) and
                               (((cVidN >= '2400') and (cVidN < '2500')) or
                                    ((cVidN >= '2600') and (cVidN < '2700')));
        if bVidOtpBlnCurMes and (nRecSumma = 0) then begin
          cNotes := 'только часы!'; end
        else begin
          nChas    := nChas + nRecChas;
          nSumma   := nSumma + nRecSumma;
          cNotes   := tblSvResNotes.AsString;
          cMyNotes := tblSvResMyNotes.AsString;
          nSpec_NR := tblSvResSpec_NR.AsInteger;
        end;
        if bVidBudg and (cVidN <> '2602') and
                          (dZaMG >= d_DtCtrl) then // Чтобы бюдж. виды
          bMore := false;  // записывались по-одному (не объединялись)
        Next;              // ( для НеПрошлых месяцев, но понаблюдать )
      end;
      nSumma := RoundTo(nSumma, -2);
      if ((nSumma >= -0.011) and (nSumma <= 0.011)) then
        nSumma := 0;
      if ((nSumma <> 0) and (dZaMG < d_DtCtrl)) or
              (((cVidN = '5002') or (cVidN = '5011') or (cVidN = '5012')) and
               (nChas <> 0)) or
              (((nChas <> 0) or (nSumma <> 0) or bVidBudg) and
                                          (dZaMG >= d_DtCtrl)) then begin
        if nPrr = 0 then begin
          bIsInv := IsInvalid(nTabN, dZaMG);
          if bIsInv then
            nPRR := 7;
        end;
        AddRecInCdsZ_Nu(d_DtCtrl, dZaMG, dDt_Beg, dDt_End, nChas, nSumma,
                     nTabN, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ,
                     nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR,
                 cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg, cKdBnk);
      end;
    end;
  end;
(*
      if c_OznPilg > '' then begin
        SQL.Add('Update Z_NU set Ozn_Pilg = :c_OznPilg ' +
                ' where TabN = :nTabN and DtProc = :d_DtCtrl');
        ParamByName('d_DtCtrl').AsDateTime := d_DtCtrl;
        ParamByName('nTabN').AsInteger := nTabN;
        ParamByName('c_OznPilg').AsString := c_OznPilg;
        ExecSQL;
      end;
      SQL.Clear;
      DataBaseName := '';
    end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormRs5.AddRecInCdsZ_Nu(dRMes, dZaMG, dDt_Beg, dDt_End : TDateTime;
                           nChas, nSumma : double;
                        nTabN, n_KdSps, n_KdTemu, n_KdObj, n_KdKatP, n_KdSpZ,
                        nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR : integer;
                        cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV,
                                                cOznPilg, cKdBnk : ShortString);
begin
  with cdsZ_Nu do begin
    Append;
    cdsZ_NuTabN.AsInteger      := nTabN;
    cdsZ_NuDtProc.AsDateTime   := dRMes;
    cdsZ_NuZaMesGod.AsDateTime := dZaMG;
    cdsZ_NuVidN.AsString       := cVidN;
    if nChas <> 0 then
      cdsZ_NuChas.AsFloat      := nChas;
    if nSumma <> 0 then
      cdsZ_NuSumma.AsFloat     := nSumma;
    if dDt_Beg <> 0 then
      cdsZ_NuDt_Beg.AsDateTime := dDt_Beg;
    if dDt_Beg <> 0 then
      cdsZ_NuDt_End.AsDateTime := dDt_End;
    cdsZ_NuKdSps.AsInteger     := n_KdSps;
    cdsZ_NuKdTemu.AsInteger    := n_KdTemu;
    cdsZ_NuKdObj.AsInteger     := n_KdObj;
    cdsZ_NuKdKatP.AsInteger    := n_KdKatP;
    cdsZ_NuKdSpZ.AsInteger     := n_KdSpZ;
    cdsZ_NuPdN.AsInteger       := nPdN;
    if nPRR <> 0 then
      cdsZ_NuPRR.AsInteger     := nPRR;
    if nPrPv <> 0 then
      cdsZ_NuPrPv.AsInteger    := nPrPv;
    if nKto <> 0 then
      cdsZ_NuKto.AsInteger     := nKto;
    if nPrKr <> 0 then
      cdsZ_NuPrKr.AsInteger    := nPrKr;
    if nSpec_NR <> 0 then
      cdsZ_NuSpec_NR.AsInteger := nSpec_NR;
    cdsZ_NuNotes.AsString      := cNotes;
    cdsZ_NuMyNotes.AsString    := cMyNotes;
    cdsZ_NuDtVdPV.AsString     := cDtVdPV;
    cdsZ_NuNrVdPV.AsString     := cNrVdPV;
    cdsZ_NuOzn_Pilg.AsString   := cOznPilg;
    cdsZ_NuKdBnk.AsString      := cKdBnk;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.cdsZ_NUCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  if bFlagDbg then
    cdsZ_NuShVidN.AsString := DmMain.VidN2ShVidN(cdsZ_NuVidN.AsString,
                                                                     cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgrZ_NUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : string4;
begin
  cVidN := cdsZ_NuVidN.AsString;
  with dbgrZ_Nu.Canvas do begin
    if not (gdFocused in State) then begin
      if cdsZ_NuKdSps.AsInteger <> gl_nKdSps then
        Font.Style := []
      else
        Font.Style := [fsBold];
      if (cdsZ_NuZaMesGod.AsDateTime > d_DtCtrl) then
        Brush.Color := clCream
      else if (cdsZ_NuZaMesGod.AsDateTime < d_DtCtrl) then
        Brush.Color := clInfoBk;
      if (cdsZ_NuZaMesGod.AsDateTime > d_DtCtrl) then begin
        if cVidN >= '8600' then begin
          Font.Color := clGray;
          Font.Style := []; end
        else
          Font.Color := clOlive; end
      else if cVidN >= '8600' then begin
        Font.Color := clGray;
        Font.Style := []; end
      else if (cVidN >= '7500') and (cVidN < '7600') then
        Font.Color := clBlue
      else if (cdsZ_NuDtProc.AsDateTime < d_DtCtrl) or
                                  (cdsZ_NuPrPV.AsInteger = 5) then
        Font.Color := clGreen
      else if cdsZ_NuPrPV.AsInteger = 6 then
        Font.Color := clPurple
      else if cdsZ_NuPrPV.AsInteger = 1 then
        Font.Color := clMaroon
      else if cdsZ_NuPrPV.AsInteger = 3 then
        Font.Color := clNavy
      else
        Font.Color := clWindowText;
      if cVidN = '2724' then    // долг за работником
        Font.Color := clRed;
      if (cdsZ_NuPdN.AsInteger <= 0) then
        Font.Color := clFuchsia;
      if UpperCase(Column.FieldName) = 'VIDN' then
        Font.Color := clBlue;
      if (UpperCase(Column.FieldName) = 'SUMMA') and
                                  (Column.Field.Value < 0) then
          Font.Color := clRed;
    end;
  end;
  dbgrZ_Nu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.GetSmsDoMinZp(dDtZaMG: TdateTime; var nSmXxDoMinZp,
                           nSmCmnFor, nSmPpsFor, nSmBlnFor, nSmDkrFor,
                           nNwSmCmnF, nNwSmPpsF, nNwSmBlnF, nNwSmDkrF : double);
var cVidN : ShortString; nSmm, n_Smm : double; nKdKatP : SmallInt;
    dZaMG  : TDateTime;
begin
  nSmXxDoMinZp := 0;
  nSmCmnFor := 0;
  nSmPpsFor := 0;
  nSmBlnFor := 0;
  nSmDkrFor := 0;
  nNwSmCmnF := 0;
  nNwSmPpsF := 0;
  nNwSmBlnF := 0;
  nNwSmDkrF := 0;
  with tblNu do begin
    DisableControls;
    First;
    while not Eof do begin
      dZaMG   := tblNuZaMesGod.AsDateTime;
      cVidN   := tblNuVidN.AsString;
      nKdKatP := tblNuKdKatP.AsInteger;
      nSmm    := tblNuSumma.AsFloat;
      n_Smm   := tblNuSumma.AsFloat;
//      n_Smm   := tblNuD__Smm.AsFloat;
      if dZaMG = dDtZaMG then begin
        if (cVidN = '2602') then begin
          nSmDkrFor := nSmDkrFor + nSmm;
          nNwSmDkrF := nNwSmDkrF + n_Smm; end
            else if (cVidN >= '2601') and (cVidN <= '2605') then begin
              nSmBlnFor := nSmBlnFor + nSmm;
              nNwSmBlnF := nNwSmBlnF + n_Smm; end
                else if (cVidN = '1005') or (cVidN = '1006') or
                                 (cVidN = '1008')  then begin
                if nKdKatP = 1 then begin
                  nSmPpsFor := nSmPpsFor + nSmm;
                  nNwSmPpsF := nNwSmPpsF + n_Smm; end
                else begin
                  nSmCmnFor := nSmCmnFor + nSmm;
                  nNwSmCmnF := nNwSmCmnF + n_Smm;
                end; end
               else if (cVidN < '6000') then begin
                 if nKdKatP = 1 then begin
                   nSmPpsFor := nSmPpsFor + nSmm;
                   nNwSmPpsF := nNwSmPpsF + n_Smm; end
                 else begin
                   nSmCmnFor := nSmCmnFor + nSmm;
                   nNwSmCmnF := nNwSmCmnF + n_Smm;
               end;
        end;
      end;
      Next;
    end;
    nSmXxDoMinZp := nSmCmnFor + nSmPpsFor + nSmBlnFor + nSmDkrFor;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.sBtnOtklNuToExcelClick(Sender: TObject);
begin
  FormZpMain.mMnuOtkl_NuToExcel.Click;
end;
//------------------------------------------------------------------------------
procedure TFormRs5.popNuPrtTableClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString; {dDtPerioda : TDateTime;}
begin
  nTabN := n_TN;
//  dDtPerioda := tblPeriodu.FieldByName('ZaMesGod').AsDateTime;
  cFamIO := c_FamIO;
  F6PrtDbgNu(nTabN, cFamIO, dDtProc, tblNU);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.popPrtCdsZNUClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString; {dDtPerioda : TDateTime;}
begin
  nTabN := n_TN;
//  dDtPerioda := tblPeriodu.FieldByName('ZaMesGod').AsDateTime;
  cFamIO := c_FamIO;
  F6PrtDbgCdsZ_NU(nTabN, cFamIO, dDtProc, cdsZ_NU);
end;
//------------------------------------------------------------------------------
procedure TFormRs5.dbgrSvResKeyDown(Sender: TObject;
                                        var Key: Word; Shift: TShiftState);
begin
//  ShowMessage('KeyDown on DbgrSvRes');
  ;
end;
//------------------------------------------------------------------------------

procedure TFormRs5.InitGrpSovm;
var
  i: integer;
begin
  for i := MIN_GRP_NUM to MAX_GRP_NUM do begin
    aGrpSovm[i].nPrcWrkTime := 0;
    aGrpSovm[i].nSum        := 0;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.AddGrpSovm(nGrpN: SmallInt;
    nGrpSum, nGrpPrcWrkTime: double);
begin
  if (nGrpN >= MIN_GRP_NUM) and (nGrpN <= MAX_GRP_NUM) then begin
    if nGrpPrcWrkTime = 0 then
      aGrpSovm[nGrpN].nPrcWrkTime := 100
    else
      aGrpSovm[nGrpN].nPrcWrkTime := nGrpPrcWrkTime;

    aGrpSovm[nGrpN].nSum        := aGrpSovm[nGrpN].nSum + nGrpSum;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.RschDoMinZp(nTabN: integer;
    var nNdbSovmChas, nNdbSovmSum: double);
begin
  nNdbSovmChas := 0;
  nNdbSovmSum  := 0;

  with tblMD do begin
    First;
    while not EoF do begin
      if not FieldByName('SmNdbSovm').IsNull
        and (FieldByName('SmNdbSovm').AsFloat <> 0) then begin
        nNdbSovmChas := nNdbSovmChas + FieldByName('CntWrkChs').AsFloat;
        nNdbSovmSum := nNdbSovmSum + FieldByName('SmNdbSovm').AsFloat;
      end;
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.Set_5011_5012_ToMD(dRMes, dNadbBeg, dNadbEnd: TDateTime);
{ Виды 5011 и 5012 - отпуск по уходу за детьми до 3х и до 6ти лет.
  Считается, что в дни, для которых процент рабочего времени в перемещениях
  не равен нулю или ста (что одно и то же), человек работает неполный
  рабочий день в соответствии с процентом рабочего времени. В таблице tblMD
  дневной процент рабочего времени указан в поле PrcWrkTm }
var
  dDate, dDtEnd: TDateTime;
begin
  dDate := Max(dRMes, dNadbBeg);
  dDtEnd := Min(dNadbEnd, MyLastDOM(dRMes));
  with tblMd do begin
    while dDate <= dDtEnd do begin
      if Locate('DtMes', dDate, []) then begin
        Edit;
        if tblMDPrcWrkTime.AsInteger = 1 then begin
          tblMdIsOtp.AsInteger := 1;
          tblMdIsOtpSovm.AsInteger := 1;
        end else begin
          tblMdIsOtp.AsInteger := 0;
          tblMdIsOtpSovm.AsInteger := 0;
        end;
        Post;
      end; { if }
      dDate := dDate + 1;
    end; { while }
  end; { with }
end;

//------------------------------------------------------------------------------
procedure TFormRs5.SetDaysVacat(
  RMes, DtBeg, DtEnd: TDateTime;
  Supplmnt: Boolean;
  Sps: Word;
  Storn: Boolean);
var
  FldName: ShortString;
  MainSps: Integer;
  Date: TDateTime;
begin
  FldName := VacatFldName(Supplmnt, Sps);

  Date := Max(RMes, DtBeg);
  DtEnd := Min(DtEnd, MyLastDOM(RMes));

  with tblMd do
  while Date <= DtEnd do begin
    if Locate('DtMes', Date, []) then begin
      Edit;

      if Storn then
        FieldByName(FldName).AsInteger := FieldByName(FldName).AsInteger - 1
      else
        FieldByName(FldName).AsInteger := FieldByName(FldName).AsInteger + 1;

      Post;
    end;

    Date := Date + 1;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.SetDaysSick(
  RMes, DtBeg, DtEnd: TDateTime;
  Supplmnt: Boolean;
  Sps: Word);
var
  Date: TDateTime;
begin
  Date := Max(RMes, DtBeg);
  DtEnd := Min(DtEnd, MyLastDOM(RMes));

  with tblMd do
  while Date <= DtEnd do begin
    if Locate('DtMes', Date, []) then begin
      Edit;
      if Supplmnt and (Sps = 6) then
        tblMDBlnSovmSps6.AsBoolean := true
      else
        tblMdIsBln.AsBoolean := true;
      Post;
    end;
    Date := Date + 1;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.SetDaysNonPay(
  VidN: ShortString;
  RMes, DtBeg, DtEnd: TDateTime;
  Supplmnt: Boolean;
  Sps: Word;
  Storn: Boolean);
var
  Date: TDateTime;
begin
  Date := Max(RMes, DtBeg);
  DtEnd := Min(DtEnd, MyLastDOM(RMes));

  with TblMd do
  while Date <= DtEnd do begin
    if Locate('DtMes', Date, []) then begin
      Edit;
      FieldByName('IsNeopl').AsBoolean := not Storn;
      if VidN = '5002' then
        // "Невыясненная причина" блокирует расчёт совместительства по
        // 6-му списку только если она сама введена по 6-му списку.
        FieldByName('NeoplSovmSps6').AsBoolean := (Sps = 6) and not Storn
      else
        FieldByName('NeoplSovmSps6').AsBoolean :=
          FieldByName('IsNeopl').AsBoolean;
      Post;
    end;

    Date := Date + 1;
  end;
end;

{
//------------------------------------------------------------------------------
procedure TFormRs5.SetDaysOtpInTblDm(
  ZaMG, DtBeg, DtEnd: TDateTime;
  Supplmnt: Boolean;
  Sps: Word);
var
  DtMes, LastDom : TDateTime;
  FldName: ShortString;
begin
  DtMes := ZaMG;
  LastDom := MyLastDOM(DtMes);

  FldName := VacatFldName(Supplmnt, Sps);

  while true do begin
    if (DtMes > DtEnd) or (DtMes > LastDom) then
      Break
    else if (DtMes >= DtBeg) and (DtMes <= DtEnd) then
    with tblMd do begin
      if Locate('DtMes', DtMes, []) then begin
        Edit;
        FieldByName(FldName).AsInteger := FieldByName(FldName).AsInteger + 1;
        Post;
      end;
    end;
    DtMes := DtMes + 1;
  end;

  if (ZaMG > d_DtCtrl) and (DtEnd < LastDom) then
    with tblMd do begin
      // запретить расчет по умолчанию для послеотпускных дней
      DtMes := DtEnd + 1; // следующий день после окончания отпуска
      while (DtMes <= LastDom) do begin
        if Locate('DtMes', DtMes, []) and tblMdAllBM.AsBoolean then begin
          Edit;
          FieldByName('AllBM').AsBoolean := false;
          Post;
        end;
        DtMes := DtMes + 1;
      end;
    end;
end;

//------------------------------------------------------------------------------
procedure TFormRs5.SetStornOtpInTblDm(
  ZaMG, DtBeg, DtEnd: TDateTime;
  Supplmnt: Boolean;
  Sps: Word);
var
  DtMes, LastDom: TDateTime;
  FldName: ShortString;
begin
  DtMes := ZaMG;
  LastDom := MyLastDOM(DtMes);

  FldName := VacatFldName(Supplmnt, Sps);

  while true do begin
    if (DtMes > DtEnd) or (DtMes > LastDom) then
      Break
    else if (DtMes >= DtBeg) and (DtMes <= DtEnd) then
      with tblMd do begin
        if Locate('DtMes', DtMes, []) then begin
          Edit;
          FieldByName(FldName).AsInteger := FieldByName(FldName).AsInteger - 1;
          Post;
        end;
      end;

    DtMes := DtMes + 1;
  end;
end;
}

{
//------------------------------------------------------------------------------
procedure TFormRs5.SetDaysBlnInMD(
  dInMesGod, dDtBeg, dDtEnd: TDateTime;
  Value: boolean);
var
  dDtMes, dLastDOM : TDateTime;
begin
  dLastDOM := MyLastDOM(dInMesGod);
  dDtMes := dInMesGod;
  while true do begin
    if (dDtMes > dDtEnd) or (dDtMes > dLastDOM) then
      Break
    else if (dDtMes >= dDtBeg) and (dDtMes <= dDtEnd) then
      with tblMd do
        if Locate('DtMes', dDtMes, []) and
            ((tblMDLockBlnOsn.AsInteger = 0) or
            (tblMDLockBlnSovm.AsInteger = 0)) then begin

          Edit;
          FieldByName('IsBln').AsBoolean := Value;
          Post;
        end;
    dDtMes := dDtMes + 1;
  end;
end;
}

//------------------------------------------------------------------------------
procedure TFormRs5.SetKmdToMD(dRMes, dDtBeg, dDtEnd : TDateTime;
 bValue: boolean);
begin
  SetTblMdFlag('IsInKmd', dRMes, dDtBeg, dDtEnd, 'Y', bValue);
end;

//------------------------------------------------------------------------------
procedure TFormRs5.SetTblMdFlag(cFieldName: string;
  dRMes, dDtBeg, dDtEnd: TDateTime; cTemplate: string; bValue: boolean);
var
  dDate : TDateTime;
begin
  Assert((cTemplate = 'Y') or (cTemplate = '1'));

  dDate := Max(dRMes, dDtBeg);
  dDtEnd := Min(dDtEnd, MyLastDOM(dRMes));

  with tblMd do begin
    while dDate <= dDtEnd do begin
      if Locate('DtMes', dDate, []) then begin
        Edit;
        if cTemplate = 'Y' then
          if bValue then
            FieldByName(cFieldName).AsString := 'T'
          else
            FieldByName(cFieldName).AsString := 'F'
        else
          if bValue then
            FieldByName(cFieldName).AsInteger := FieldByName(cFieldName).AsInteger + 1
          else
            FieldByName(cFieldName).AsInteger := FieldByName(cFieldName).AsInteger - 1;
        Post;
      end; {if}
      dDate := dDate + 1;
    end; {while}
  end; {with}
end; {procedure}

//------------------------------------------------------------------------------
procedure TFormRs5.LockBlnInMD(RaschMes: TDateTime);
var
  VidN: ShortString;
  LockBoth: boolean;
begin
  with qryOtkl do begin
    First;

    while not Eof do begin
      VidN := FieldByName('VidN').AsString;

      LockBoth := { // Оксана (VidN = '5002') or } (VidN = '5006');

      if LockBoth or (VidN = VIDN_VACAT_NOPAY_PRINCIPAL)
          or (VidN = VIDN_WAR_PRINCIPAL) then
        SetTblMDFlag('LockBlnOsn', RaschMes,
          qryOtklDt_Beg.AsDateTime, qryOtklDt_End.AsDateTime,
          '1', FieldByName('STORN').AsString <> 'Y');

      if LockBoth or
        (VidN = VIDN_VACAT_NOPAY_SUPPLMNT) or (VidN = VIDN_WAR_SUPPLMNT)
      then
        SetTblMDFlag('LockBlnSovm', RaschMes,
          qryOtklDt_Beg.AsDateTime, qryOtklDt_End.AsDateTime,
          '1', FieldByName('STORN').AsString <> 'Y');

      Next;
    end; {while}
  end; {with}
end;

//------------------------------------------------------------------------------
function TFormRs5.CalcBlnHoursForCurOtkl(CalcPeriod: TPeriod): integer;
var
  OtklPeriod: TPeriod;
begin
  Result := 0;

  with DateUtils do
    OtklPeriod := InitPeriod(qryOtklDT_BEG.AsDateTime, qryOtklDT_END.AsDateTime);

  with tblMd do begin
    if not Locate('DtMes', OtklPeriod.Start, []) then
      exit;

    while not Eof and (tblMDDtMes.AsDateTime <= OtklPeriod.Finish) do begin
//      if FieldByName('Sovm').AsString = 'Y' then begin
      if qryOtklSovm.AsString = 'Y' then begin
        if tblMDLockBlnSovm.AsInteger = 0 then
          Result := Result + tblMDCntWrkChs.AsInteger;
      end else
        if tblMDLockBlnOsn.AsInteger = 0 then
          Result := Result + tblMDCntWrkChs.AsInteger;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TFormRs5.SplitSickToEffPeriods: TPeriods;
var
  OtklPeriod: TPeriod;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure CutPeriodByDay(Day: TDateTime);
  var
    Period: TPeriod;
  begin
    Period := DateUtils.InitPeriod(OtklPeriod.Start, Day - 1);

    if not DateUtils.PeriodIsEmpty(Period) then begin
      SetLength(Result, Length(Result) + 1);

      Result[Length(Result) - 1] := Period;
    end;

    OtklPeriod.Start := Day + 1;
  end;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
begin
  SetLength(Result, 0);

  OtklPeriod := DateUtils.InitPeriod(
    qryOtklDT_BEG.AsDateTime, qryOtklDT_END.AsDateTime);

  with tblMd do begin
    if not Locate('DtMes', OtklPeriod.Start, []) then
      exit;

    while not Eof and (tblMDDtMes.AsDateTime <= OtklPeriod.Finish) do begin
      if qryOtklOtkl_Sovm.AsString = 'Y' then begin
        if tblMDLockBlnSovm.AsInteger <> 0 then
          CutPeriodByDay(tblMDDtMes.AsDateTime);
      end else
        if tblMDLockBlnOsn.AsInteger <> 0 then
          CutPeriodByDay(tblMDDtMes.AsDateTime);

      Next;
    end;

    if not DateUtils.PeriodIsEmpty(OtklPeriod) then begin
      SetLength(Result, Length(Result) + 1);

      Result[Length(Result) - 1] := OtklPeriod;
    end;
  end;
end;

end.
