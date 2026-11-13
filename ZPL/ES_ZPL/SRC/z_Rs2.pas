unit z_Rs2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, DBClient, DB, DBTables, Buttons, ExtCtrls, Grids,
  Math, DBGrids, ComCtrls, StdCtrls, IniFiles, DateUtils, Provider, Menus;

type
  string15 = string[15];
  string10 = string[10];
  string3  = string[3];
  String4  = string[4];
  string1  = string[1];
  TFormRs2 = class(TForm)
    tblMd: TTable;
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
    dsrcPere: TDataSource;
    dbgrPere: TDBGrid;
    Splitter2: TSplitter;
    dbgrPeriodu: TDBGrid;
    Splitter3: TSplitter;
    qryPrmUv: TQuery;
    tblMdNR: TAutoIncField;
    tblMdDtMes: TDateField;
    tblMdKdObj: TIntegerField;
    tblMdKdKatP: TIntegerField;
    tblMdKdSPZ: TIntegerField;
    tblMdSO: TIntegerField;
    tblMdCmbOkl: TStringField;
    tblMdSpec_NR: TIntegerField;
    tblMdOklTrf: TFloatField;
    tblMdPrcWrkTime: TFloatField;
    tblMdCntWrkChs: TFloatField;
    tblMdPdNlg: TSmallintField;
    tblMdSovm: TSmallintField;
    tblMdPr_Pens: TSmallintField;
    tblMdPrfs: TSmallintField;
    tblMdInv: TSmallintField;
    tblMdRang: TSmallintField;
    tblMdRazr: TSmallintField;
    tblMdProcLg: TFloatField;
    tblMdIsPravo: TBooleanField;
    tblMdKdSps: TSmallintField;
    tblMdRabotalPrp: TBooleanField;
    tblMdRabotalSps: TBooleanField;
    qryCmbOkl: TQuery;
    Panel2: TPanel;
    dbgrPrmUv: TDBGrid;
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
    tblMdIsBln: TBooleanField;
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
    LabelDbgMsg: TLabel;
    sBtnPart2: TSpeedButton;
    sBtnSaveRes: TSpeedButton;
    tblPerioduAllBM: TBooleanField;
    tblMdAllBM: TBooleanField;
    qryOtklOLDKDOBJ: TSmallintField;
    qryOtklOLDKDVIDN_1: TSmallintField;
    tblNuNR: TIntegerField;
    tblNuDTPROC: TDateTimeField;
    tblNuZAMESGOD: TDateTimeField;
    tblNuTABN: TIntegerField;
    tblNuVIDN: TStringField;
    tblNuCHAS: TFloatField;
    tblNuSUMMA: TFloatField;
    tblNuDT_BEG: TDateTimeField;
    tblNuDT_END: TDateTimeField;
    tblNuKDSPS: TSmallintField;
    tblNuKDOBJ: TSmallintField;
    tblNuKDKATP: TSmallintField;
    tblNuKDSPZ: TSmallintField;
    tblNuPDN: TSmallintField;
    tblNuNOTES: TStringField;
    tblNuPRR: TSmallintField;
    tblNuPRPV: TSmallintField;
    tblNuKTO: TSmallintField;
    tblNuPRKR: TSmallintField;
    tblNuMYNOTES: TStringField;
    tblNuSPECPS: TIntegerField;
    tblNuSPEC_NR: TIntegerField;
    tblNuOLDKDOBJ: TSmallintField;
    tblNuOLDKDVIDN: TSmallintField;
    tblNuOLDCH: TFloatField;
    tblNuOLDSM: TFloatField;
    tblNuD_CH: TFloatField;
    tblNuD_SM: TFloatField;
    tblNuNR_1: TIntegerField;
    tblNuVIDN_1: TStringField;
    tblNuOLDKDVIDN_1: TSmallintField;
    tblNuSHVIDN: TStringField;
    tblNuNMVIDN: TStringField;
    tblNuAINDX: TSmallintField;
    tblNuPINDX: TSmallintField;
    tblNuLVL: TSmallintField;
    tblNuINDX: TSmallintField;
    tblNuHSCH: TStringField;
    tblNuNOSHOW: TStringField;
    tblNuZP13: TStringField;
    tblNuOTP: TStringField;
    tblNuBLN: TStringField;
    tblNuOTPUSKN: TStringField;
    tblNuBOLNIC: TStringField;
    tblNuSPRM: TStringField;
    tblNuCPRM: TStringField;
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
    PanelTotals: TPanel;
    tblNuSchBU: TStringField;
    PanelNmTblNU: TPanel;
    qryTblPrp: TQuery;
    qryTPdn: TQuery;
    cdsTmp: TClientDataSet;
    cdsOKS: TClientDataSet;
    dsrcOKS: TDataSource;
    cdsPrp: TClientDataSet;
    qryZNuDTVDPV: TDateTimeField;
    qryZNuNRVDPV: TIntegerField;
    tblNuDTVDPV: TDateTimeField;
    tblNuNRVDPV: TIntegerField;
    tblMdIsOtp: TSmallintField;      
    tblMdIsOtpSovm: TSmallintField;
    qryOtklPBNK: TSmallintField;
    qryOtklSTORN: TStringField;
    sBtnTblNuFilter: TSpeedButton;
    tblMdIsBdgZan: TBooleanField;
    dbgrOtkl: TDBGrid;
    Splitter1: TSplitter;
    cdsCmbOkl: TClientDataSet;
    tblMdRMes: TDateField;
    tblNud__Smm: TFloatField;
    tblNud__Chs: TFloatField;
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
    tblNuKdBnk: TSmallintField;
    qryZNuKDBNK: TSmallintField;
    tblSvResKdBnk: TSmallintField;
    qryPrcEsv: TQuery;
    qryPrcEsvPrp: TQuery;
    Panel3: TPanel;
    dbgrNU: TDBGrid;
    SplitterEsv: TSplitter;
    tblNuOzn_Pilg: TStringField;
    tblSvResOzn_Pilg: TStringField;
    qryZNuOZN_PILG: TStringField;
    cdsSmPdn: TClientDataSet;
    tblMdIsInKmd: TBooleanField;
    tblNuSSRK: TStringField;
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
    tblNuPSCH: TStringField;
    tblNuNDBE: TStringField;
    tblNuDKR: TStringField;
    tblNuSWSB: TStringField;
    tblNuKDSCHDT: TSmallintField;
    tblNuKDSCHKT: TSmallintField;
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
  private
    { Private declarations }
    dMesPeremen : TDateTime; // месяц, с которого внедряется новая схема счета
    dMesPeremenNICH : TDateTime; // то же для НИЧ'евцев или пересекающихся с НИЧ

    nMaxNuNR : integer;
    // объявляю тут переменные, которые будут постоянно встречаться (начало)
    // группа для выемки информации о виде начисления из KdVidN
    p_KEKV : string4;
    p_ShVidN : string[10];
    p_zp13, p_Otp, p_Bln, p_Dkr, p_Otpuskn, p_Bolnic,
    p_SPrm, p_CPrm, p_Deti, p_DetiM, p_DetiK,
    p_DetiG, p_Ind, p_Sovm, p_Spov, p_Dhd, p_OklFnd,        {p_OklFnd понимать,}
    p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens, {как "входит ли в расчет сумм для}
    p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,                   {доплат к Миним.ЗП"}
    p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string[1];
    p_KdSpz : integer;
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
    b_FromMainForm : boolean;
    b_Pereschet : boolean;
    bIsAlimentu, bIsPerevodu : boolean;
    dDtPereloma : TDateTime;
    n_CurBudget : double;    // бюджет рассчитываемого месяца (по d_DtProc)
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
                                             // (хохмы с доплатами до минимума)
    d_20160101 : TDateTime; // Новые порядки  при расчётах удержаний в ЕСВ
                            // с сотрудников и взносов в ЕсвПрп с предприятия
    nDbgCycle : integer;
    c_OznPilg : ShortString;  // для сбора примененных ОзнакПильг
    function RaschetMesaca(nTabN : integer; dRMes : TDateTime) : boolean;
    procedure CreOpenWrkTables(nTabN: integer);
    procedure OpenMesQueries(nTabN : integer; dRMes : TDateTime);
    procedure CreOpenTblPeriodu(nTabN : integer; cNmTblPeriodu : string);
    procedure CreOpenTblMd(nTabN : integer; dRMes : TDateTime;   {создается в
                      начале каждого периода (месяцы/дии)}  cNmtblMd : string);
    procedure CreOpenOldNU(nTabN : integer; dRMes : TDateTime);
    procedure FillOksInPart01;  // В процессе Part01
    procedure ObrOtkl(nTabN : integer; dRMes : TDateTime);
    procedure R_Default(nTabN : integer; dRMes :TDateTime);
    procedure CreOpenCdsCmbOkl(nSpec_NR : integer);
    procedure R_Ndb(nTabN : integer;
                                 d_DtPrc, dRMes, dDtBegR, dDtEndR : TDateTime;
                                 bCmbOkl : boolean; nCmbOklKdSpZ : SmallInt;
                                               nBudget, nChas, nSmm : double);
    procedure GetSmPfMax(dAnyDate : TDateTime; var nSmPfMax : double);
    function GetPrcWSb(dAnyDate : TDateTime) : double;
    procedure GetPdnInfo(dAnyDate : TDateTime; var nPrcPdn, nPrcPdn2,
                                   nMinZpNG, nMinZpCM, nProgMinNG, nProgMinCM,
                                      nPrgLg, nProcLg, nSm2660,
                                          nSmLg100,nSmLg150, nSmLg200 : double);
    procedure GetSm1517(nSmCmnFX, nSmDgvFX, nSmMin10 : double;
                          var nSmCmn15 , nSmCmn17, nSmDgv15, nSmDgv17 : double);
    procedure SetSvPorogi(nSmFor, nSmPfMax, nSmECmnFor, nSmEPpsFor,
                                  nSmEBlnFor, nSmEDkrFor, nSmEDgvFor : double;
                 var nSvPECmn, nSvPEPps, nSvPEBln, nSvPEDkr, nSvPEDgv : double);
    procedure GetSmEsv(dZaMG : TDateTime;
                var nSmUdEsvCmn, nSmUdEsvPps, nSmUdEsvBln, nSmUdEsvDgv: double);
    // Сделал эту (LocalGetPereInf) процедуру тут для ускорения, чтобы не
    // обращаться к DmMain.GetPereInf (там с использованием qryTmp, а тут
    // уже готовый запрос qryPere)
    procedure LocalGetPereInf(nTabN : integer; dRMes : TDateTime;
                                var n_KdSps, n_KdObj, n_KdKatP, n_SO,
                                    n_PdNlg, n_KolMin, n_KdSpZ : integer;
                                var nOklTrf, nAvans : double;
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
    procedure GetSmECmn(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmEPps(nTabN : integer; dZaMG : TDateTime;
                             nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmECmnPrp(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmEInvPrp(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmEBln(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmEBlnPrp(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmEBlnInvPrp(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmEDkr(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmEDkrPrp(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmEDkrInvPrp(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);

    procedure GetSmEDgv(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure GetSmEDgvPrp(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
    procedure QryInvPrepare;
    function IsInvalid(nTabN : integer; dZaMG : TDateTime) : boolean;
    procedure R_Prfs(nTabN : integer; dRMes : TDateTime);
    function SumPrfs(nTabN : integer; var cVidN : string4;
                                 dRMes : TDateTime; nSmForXX : double) : double;
    procedure R_PdNlg(nTabN : integer; dRMes : TDateTime);
    procedure R_WSb(nTabN : integer; dRMes : TDateTime);
    function SumWSb(nTabN : integer; var cVidN : string4;
                                 dRMes : TDateTime; nSmForXX : double) : double;
    procedure tblNuAdd(bCanUni : boolean; {разрешение объединять}
                               d_DtPrc, dZaMesGod, dDtBeg, dDtEnd : TDateTime;
                              cVidN : string4; n_KdSps, n_KdObj, n_KdKatP, nPdN,
                                         nPrPV, nPRR, n_KdSpZ : integer;
                               nChas, nSumma, nPrcWrkTime, nPrcSovm : double;
             cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg : ShortString;
                                          nSpecNR : integer; nKdBnk : SmallInt);
    procedure SvTblNuToTblSvRes(dRMes : TDateTime);
    procedure AddRecToTblSvRes(nTabN : integer; dDtPrc, dZaMG : TDateTime;
                               nDChs, nDSmm : double; cVidN, cDt_Beg, cDt_End,
                               cKdSps, cKdObj, cKdKatP, cKdSpZ, cPdN, cNotes,
                               cPRR, cPrPV, cKto, cPrKr, cMyNotes, cSpecPS,
                               cSpec_NR, cDtVdPV, cNrVdPV, cStorn, cSAlim,
                               cOznPilg, cCBudg, cKdBnk : ShortString);
    procedure DelTmpTables;
    procedure Part01(nTabN : Integer; dRMes : TDateTime);
    procedure Part02(nTabN : Integer; dRMes : TDateTime);
    procedure RaschetOtkl(nTabN, nSpecNR : integer; cVidN : string4;
                                    dZaMG, dDtBeg, dDtEnd : TDateTime;
                                                 var nChOtkl, nSmOtkl : double);
    procedure RaschetDoplDoMinZP(dRMes : TDateTime);
    procedure RaschetDolga(d_DtCtrl : TDateTime);
    procedure AddInPeriodu(dDtProc, dZaMesGod : TDateTime; nPrKr,
                                nNSpecPS, nNuCntFakt, nNuCntInPS, nOtklCntFakt,
                                    nOtklCntInPS : integer;
                                         nNuAvgSpecPS, nOtklAvgSpecPS : double);
    procedure R_Alim(nTabN : integer; dZaMesGod : TDateTime);
    procedure R_Perevod(nTabN : integer; dZaMesGod : TDateTime);
    function GetSmPsbAlim(nKdPst : SmallInt; dZaMG : TDateTime;
                                                  nSmForPsb : double) : double;
    function GetSmPsbPvd(nKdPst : SmallInt; dZaMG : TDateTime;
                                                     nSmPvd : double) : double;
    procedure SetDaysBdgZanInPere(cVidN : ShortString;
                                       dOtklZaMG, dDtBeg, dDtEnd : TDateTime;
                                          bZaniato : boolean; nPrcWT : double);
    procedure SetDaysIsPavoInPere(dOtklZaMG, dDtBeg, dDtEnd : TDateTime);
    procedure SetDaysOtpInPere(dOtklZaMG, dDtBeg, dDtEnd : TDateTime);
    procedure SetStornOtpInPere(dOtklZaMG, dDtBeg, dDtEnd : TDateTime);
    procedure SetStornOtpSovmInPere(dOtklZaMG, dDtBeg, dDtEnd : TDateTime);
    procedure SetDaysOtpSovmInPere(dOtklZaMG, dDtBeg, dDtEnd : TDateTime);
    procedure SetDaysBlnInPere(dInMesGod, dDtBeg, dDtEnd : TDateTime);
    procedure AddRecInZ_Nu(dRMes, dZaMG, dDt_Beg, dDt_End : TDateTime;
                           nChas, nSumma : double;
                        nTabN, n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ, nPdn, nPrPv,
                        nPRR, nKto, nPrKr, nSpec_NR : integer;
                        cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV,
                                                cOznPilg, cKdBnk : ShortString);
    procedure AddRecInCdsZ_Nu(dRMes, dZaMG, dDt_Beg, dDt_End : TDateTime;
                           nChas, nSumma : double;
                        nTabN, n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ, nPdn, nPrPv,
                        nPRR, nKto, nPrKr, nSpec_NR : integer;
                        cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV,
                                                cOznPilg, cKdBnk : ShortString);
    function GetPereKdSpZ(dDtMes : TDateTime) : integer;
    function GetSmPM(cVidN : string4; dZaMG : TDateTime;
                                      nTabN : integer; nChas : double) : double;
    procedure ObrNadbSpsb3(nTabN : integer; dRMes : TDateTime);
    procedure SetTblNuFilter;
    procedure SetLbxPerioduVisible;
    procedure R_NdbBySmm(dDtBNdb, dDtENdb: TDateTime;
                   nCurBudg, nSumProcNdb : double; var nChNdb, nSmNdb : double);
    procedure R_NdbByPrc(dDtBNdb, dDtENdb : TDateTime;
                   nCurBudg, nSumProcNdb : double; var nChNdb, nSmNdb : double);
    procedure GetSmPfFzSs(nTabN : integer; dZaMG : TDateTime;
                                 var nSmOldPfFzSsCmn, nSmOldPfFzSsDgv : double);
    function IsPrmUv(nTabN : integer; dDtPrc : TDateTime) : boolean;
    function IsNeoplVids(nTabN : integer; dZaMG : TDateTime) : boolean;
    procedure ShwSelTts;
    procedure GetSmForEsv(dRMes : TDateTime;
        {с сотрудников}      var nSmECmnFor, nSmEPpsFor, nSmEBlnFor,
                                 nSmEDkrFor, nSmEDgvFor,
                                 nSvPrg, nSvPECmn, nSvPEPps, nSvPEBln,
                                 nSvPEDkr, nSvPEDgv : double);
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
    procedure CreOpenCdsOks2(dRmes : TDateTime);
    procedure SetOks2Filter;
    procedure CreOpenCdsOks3(dRmes : TDateTime);
    procedure AddRecInCdsOks3(dRmes : TDateTime);
    procedure SaveSchetResults(nTabN : integer; dRMes : TDateTime);
    procedure PredSaveResults(nTabN : integer; dRMes : TDateTime);
    procedure GetSmsDoMinZp(var nSmXxDoMinZp,
                nSmCmnFor, nSmPpsFor, nSmBlnFor, nSmDkrFor,
                nNwSmCmnF, nNwSmPpsF, nNwSmBlnF, nNwSmDkrF : double);
//    procedure GetPrcEsv(dRMes: TDateTime; var nPrcE, nPecEP: double);
    function WorksInMes(nTabN : integer; dInMes : TDateTime) : boolean;
    function IsPolnMesByPrmUv(nTabN : integer; dZaMG : TDateTime) : boolean;
  public
    { Public declarations }
  end;

function StartRs2(bFromMainForm : boolean; nTabN: integer;
                                cFamIO : string; dDtCtrl : TDateTime): boolean;

const SECTION = 'Z_Rs2';

var
  FormRs2: TFormRs2;

implementation

uses A_Const, A_Lib, A_DM, Z_DM, Z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
function StartRs2(bFromMainForm : boolean; nTabN : integer;
                               cFamIO : string; dDtCtrl : TDateTime) : boolean;
var dRMes : TDateTime; nY, nM, nD : word;
begin
  FormRs2 := TFormRs2.Create(Application);
  with FormRs2 do begin
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
    b_FromMainForm := bFromMainForm;
    nMaxNuNR := 0;
    nDbgCycle := 0;
    b_Pereschet := false;
    n_TN := nTabN;
    c_FamIO := cFamIO;
    DecodeDate(Date, nY, nM, nD);
    d_SysCtrl := EncodeDate(nY, nM, 1);
    d_DtCtrl  := dDtCtrl; // dDtCtrl больше нигде не использовать, чтобы
                          // случайно не изменить значение
    bIsAlimentu := false;
    bIsPerevodu := false;
    if not DmMain.cdsEDays.Active then // создать/открыть cds ЭкзоДней
      DmMain.CreOpenCdsEDays;
    // Создание вспомогательных таблиц,  в т.ч. tblPeriodu, в которой
    CreOpenWrkTables(nTabN); // собираются месяцы, требующие перерасчета с под-
                             // ключением к результатам текущего месяца dDtCtrl
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
        RaschetMesaca(n_TN, dRMes);
        //==========================================
        if bFromMainForm then begin
          FormZpMain.StatusBar.Panels[0].Text := '';
          Application.ProcessMessages;
        end;
        Next;
      end;
      if bIsAlimentu then
        R_Alim(nTabN, d_DtCtrl);
      if bIsPerevodu then
        R_Perevod(nTabN, d_DtCtrl);
      RaschetDolga(d_DtCtrl);
      SaveSchetResults(n_TN, d_DtCtrl);
    end;
    Result := true;
    DelTmpTables;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs2.RaschetMesaca(nTabN : integer; dRMes : TDateTime) : boolean;
// Повторяется столько раз, сколько встретилось периодов с RequiredPS
var nY, nM, nD : word; nCntDay, nCntWorkDay : integer;
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
    Caption := 'Рассчитываем месяц ' + DateToStr(dRMes) + ' в ' +
                                                      DateToStr(d_DtCtrl);
  end;
  n_CurBudget := DmMain.Budget(nY, nM, nCntDay, nCntWorkDay);
  OpenMesQueries(nTabN, dRMes); // открываются все Query под текущий месяц
  CreOpenTblMd(nTabN, dRMes, cNmtblMd); // Создаётся и заполняется tblMd
  Part01(nTabN, dRMes);
//  sBtnCheckOks.Click;
  CreOpenCdsOks2(dRMes);
  CreOpenCdsOks3(dRMes);
  Part02(nTabN, dRMes);
  Result := true;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnOpenOldNUClick(Sender: TObject);
var cMsg : string; nY, nM, nD : word; nCntDay, nCntWorkDay : integer;
begin
  Inc(nDbgCycle);
  if nDbgCycle = 1 then
    tblPeriodu.First
  else
    tblPeriodu.Next;
  OpenMesQueries(n_TN, tblPeriodu.FieldByName('ZaMesGod').AsDateTime);
  CreOpenTblMd(n_TN, tblPeriodu.FieldByName('ZaMesGod').AsDateTime,
                                     cNmtblMd);  // Созд.и заполн. tblMd
  DecodeDate(tblPeriodu.FieldByName('ZaMesGod').AsDateTime, nY, nM, nD);
  n_CurBudget := DmMain.Budget(nY, nM, nCntDay, nCntWorkDay);
  sBtnOpenOldNU.Enabled := false;
  cMsg := 'Периодов ' + IntToStr(tblPeriodu.RecordCount) + ' / ' +
                                           IntToStr(nDbgCycle) + '-й';
  LabelDbgMsg.Caption := cMsg;
  CreOpenOldNU(n_TN, tblPeriodu.FieldByName('ZaMesGod').AsDateTime);
  sBtnObrOtkl.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnObrOtklClick(Sender: TObject);
begin
  // перемещением по tblPeriodu командует (выше) sBtnOpenOldNU, поэтому
  // тут есть уверенность, что sBtnOpenOldNU уже стоит на нужном периоде
  sBtnObrOtkl.Enabled := false;
  ObrOtkl(n_TN, tblPeriodu.FieldByName('ZaMesGod').AsDateTime);
  sBtnPart1.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnPart1Click(Sender: TObject);
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
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnPart2Click(Sender: TObject);
begin
  Part02(n_TN, tblPeriodu.FieldByName('ZaMesGod').AsDateTime);
  sBtnPart2.Enabled := false;
  if nDbgCycle < tblPeriodu.RecordCount then
    sBtnOpenOldNU.Enabled:= true
  else begin
    if bIsAlimentu then
      R_Alim(n_TN, d_DtCtrl);
    if bIsPerevodu then
      R_Perevod(n_TN, d_DtCtrl);
    RaschetDolga(d_DtCtrl);
    if d_DtCtrl = d_SysCtrl then
      sBtnSaveRes.Enabled := true;
    //sBtnPredSave.Enabled := sBtnSaveRes.Enabled;
    ShwTotals; // В конце Part02 заполняется tblSvRes - подбиваю итоги
    LabelDbgMsg.Caption := 'Следующий шаг: SaveSchetResults';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.ShwTotals;
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
    if (nSmNach <> 0) or (nSmVupl <> 0) or (nSmUdrg <> 0) or
                                                  (nSmDolga <> 0) then begin
      cMsg := 'Начисл.: ' + FloatToStrF(nSmNach, ffFixed, 18, 2) +
              '  Удерж.: ' + FloatToStrF(-nSmUdrg, ffFixed, 18, 2);
      if nSmVupl <> 0 then
        cMsg := cMsg + '  Выпл.: ' + FloatToStrF(-nSmVupl, ffFixed, 18, 2);
      if nSmDolga <> 0 then
        cMsg := cMsg + '  ВДолгТМ: ' + FloatToStrF(nSmDolga, ffFixed, 18, 2);
      cMsg := cMsg + '  К выпл.: ' +
                        FloatToStrF(nSmNach + nSmUdrg + nSmVupl + nSmDolga,
                                                        ffFixed, 18, 2) + '  ';
      PanelTotals.Caption := cMsg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnSaveResClick(Sender: TObject);
begin
  SaveSchetResults(n_TN, d_DtCtrl);
  Close;
  Application.ProcessMessages;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.R_Perevod(nTabN : integer; dZaMesGod : TDateTime);
var cVidN : string4;
    nSmForPvd, nSmUshlo, nSmPvd, nSmPsb : double;
    cNomDoc : string; nSpec_NR, nKdPst, nPdn, nPrPv : integer;
    n_KdSps, n_KdObj, n_KdKatP, n_SO, n_PdNlg, n_KolMin, n_KdSpZ : integer;
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
                     n_KolMin, n_KdSpZ, nOklTrf, nAvans, cSpAv, cDolgnost,
              cNrPrikaza, dDtPrikaza, bPens, bSovm, bPrfs, nInv);
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
    if bFlagDbg then
      SaveToFile(cDirTemp + 'AlimPvd.cds');
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
                         IntToStr(n_KdSps), IntToStr(n_KdObj), IntToStr(n_KdKatP),
                         IntToStr(n_KdSpZ), IntToStr(nPdn), cNomDoc,
                         '', IntToStr(nPrPv), '', '',
                         '', '', IntToStr(nSpec_NR), '',
                         IntToStr(nSpec_NR), '', '1', '', '', '');
      if nSmPsb <> 0 then
        // Добавить в Z_NU запись по виду '6602' - почт.сбор
        AddRecToTblSvRes(nTabN, dZaMesGod, dZaMesGod,
                         0, -RoundTo(nSmPsb, -2), '6612', '', '',
                         IntToStr(n_KdSps), IntToStr(n_KdObj), IntToStr(n_KdKatP),
                         IntToStr(n_KdSpZ), IntToStr(nPdn), cNomDoc,
                         '', IntToStr(nPrPv), '', '',
                         '', '', IntToStr(nSpec_NR), '',
                         IntToStr(nSpec_NR), '', '1', '', '', '');
      // IntToStr(nSpec_NR) записываю в поле tblSvResNrVdPv, чтобы не
      // объединились записи нескольких переводов (если случится)
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.R_Alim(nTabN : integer; dZaMesGod : TDateTime);
var cVidN : string4; nSmForAlim, nSmForPsb, nSmNaRuki, nSmAlim, nSmPsb : double;
    cNomDoc : string; nSpec_NR, nPdn, nPrPv : integer;
    n_KdSps, n_KdObj, n_KdKatP, n_SO, n_PdNlg, n_KolMin, n_KdSpZ : integer;
    nKdPst : SmallInt;
    nOklTrf, nAvans : double;
    cSpAv : string1; cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime; bPens, bSovm, bPrfs : boolean;
    nInv : SmallInt;
begin
  nSpec_NR := 0;
  cVidN := '6601';
  with cdsAlim do begin
    if Active then Close;
    IndexName := '';
    IndexDefs.Clear;
    CreateDataSet;
    Open;
  end;
  LocalGetPereInf(nTabN, dZaMesGod, n_KdSps, n_KdObj, n_KdKatP, n_SO, n_PdNlg,
                     n_KolMin, n_KdSpZ, nOklTrf, nAvans, cSpAv, cDolgnost,
                     cNrPrikaza, dDtPrikaza, bPens, bSovm, bPrfs, nInv);
  // в tblSvRes уже собраны все записи, которые будут сохранены
  // с DtProc = d_DtCtrl. Поэтому в ней можно собрать суммы, необходимые для
  // корректного расчета алиментов и, если нужно, почтового сбора
  with tblSvRes do begin
    DisableControls;
    First;
    nSmForAlim := 0;
    nSmNaRuki  := 0;
    while not Eof do begin
      nSmNaRuki := nSmNaRuki + FieldByName('Summa').AsFloat;
      if (FieldByName('SAlim').AsString = '1') then
        nSmForAlim  := nSmForAlim + FieldByName('Summa').AsFloat;
      Next;
    end;
    EnableControls;
  end;
  with qryUdrg do begin
    First;
    while not Eof do begin
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
          nSmAlim := RoundTo(nSmForAlim *
                               FieldByName('SumVzn').AsFloat / 100, -2)
        else
          nSmAlim := qryUdrg.FieldByName('SumVzn').AsFloat;
        if not cdsAlim.Locate('Spec_NR;NomDoc',
                    VarArrayOf([nSpec_NR, cNomDoc]), []) then begin
          cdsAlim.Append;
          cdsAlim.FieldByName('Spec_NR').AsInteger := nSpec_NR;
          cdsAlim.FieldByName('NomDoc').AsString := cNomDoc;
          cdsAlim.FieldByName('KdPst').AsInteger := nKdPst; end
        else
          cdsAlim.Edit;
        cdsAlim.FieldByName('SmAlim').AsFloat :=
                             cdsAlim.FieldByName('SmAlim').AsFloat + nSmAlim;
        cdsAlim.Post;
      end;
      Next;
    end;
  end;
  with cdsAlim do begin
    AddIndex('OnNomDoc', 'NomDoc', [ixCaseInsensitive]);
    IndexName := 'OnNomDoc';
    First;
    nPrPv := 3;
    nPdn := 1;
    while not Eof do begin
      cNomDoc := FieldByName('NomDoc').AsString;
      nSmForPsb := 0;
      nKdPst := FieldByName('KdPst').AsInteger;
      while (FieldByName('NomDoc').AsString = cNomDoc) and not Eof do begin
        nSpec_NR := FieldByName('Spec_NR').AsInteger;
        nSmAlim := FieldByName('SmAlim').AsFloat;
        nSmForPsb := nSmForPsb + nSmAlim;
        // Добавить в tblSvRes запись по виду '6601' - алименты
        // n_KdSpz запишется из перемещений ( выдаст LocalGetPereInf )
        AddRecToTblSvRes(nTabN, dZaMesGod, dZaMesGod,
                         0, -RoundTo(nSmAlim, -2), '6601', '', '',
                         IntToStr(n_KdSps), IntToStr(n_KdObj), IntToStr(n_KdKatP),
                         IntToStr(n_KdSpZ), IntToStr(nPdn), cNomDoc,
                         '', IntToStr(nPrPv), '', '',
                       '', '', IntToStr(nSpec_NR), '', '', '', '1', '', '', '');
        Next;
      end;
      nSmPsb := GetSmPsbAlim(nKdPst, dZaMesGod, nSmForPsb);
      if nSmPsb <> 0 then
        // Добавить в Z_NU запись по виду '6602' - почт.сбор
        AddRecToTblSvRes(nTabN, dZaMesGod, dZaMesGod,
                         0, -RoundTo(nSmPsb, -2), '6602', '', '',
                         IntToStr(n_KdSps), IntToStr(n_KdObj), IntToStr(n_KdKatP),
                         IntToStr(n_KdSpZ), IntToStr(nPdn), cNomDoc,
                         '', IntToStr(nPrPv), '', '',
                       '', '', IntToStr(nSpec_NR), '', '', '', '1', '', '', '');
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs2.GetSmPsbAlim(nKdPst : SmallInt; dZaMG : TDateTime;
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
function TFormRs2.GetSmPsbPvd(nKdPst : SmallInt; dZaMG : TDateTime;
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
procedure TFormRs2.SaveSchetResults(nTabN : integer; dRMes : TDateTime);
var mOtklZaMG, mZaMgForSpecPS : TStringList;
    dZaMG, dDt_Beg, dDt_End : TDateTime;
    i, n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ,
    nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR, nSpecPS : integer;
    cMsg, cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg, cKdBnk : string;
    nRecChas, nRecSumma, nChas, nSumma : double;
    bVidOtpBlnCurMes, bIsInv, bVidBudg{вид бюджетный}, bMore : boolean;
    bSvTblNuFiltered : boolean;
    nPLg : SmallInt;
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
  //nSpec_NR := 0;
  bVidOtpBlnCurMes := false;
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
//        if bFlagDbg and (cVidN = '8681') then
//          ShowMessage('VidN = ' + cVidN);
        bVidBudg  := tblSvResCBudg.AsString = '1';
        dZaMG     := tblSvResZaMesGod.AsDateTime;
        dDt_Beg   := tblSvResDt_Beg.AsDateTime;
        dDt_End   := tblSvResDt_End.AsDateTime;
        n_KdSps   := tblSvResKdSps.AsInteger;
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
          bVidOtpBlnCurMes := (tblSvResZaMesGod.AsDateTime = dDtProc) and
                                 (((cVidN >= '2400') and (cVidN < '2500')) or
                                      ((cVidN >= '2600') and (cVidN < '2700')));
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
          if bVidBudg and (dZaMG >= d_DtCtrl) and // для НеПрошлых месяцев
              ((cVidN < '2600') or ((cVidN > '5000') and (cVidN <'7500'))) then
            bMore := false
          else if bVidBudg and (cVidN > '2600') and (cVidN < '5000') and
                               (cVidN <> '2602') {декретные} then
                             // Чтобы больничные виды не объединялись, а запи-
            bMore := false;  // сывались по-одному (в т.ч. и прошлых месяцев)
          Next;
        end;
        nSumma := RoundTo(nSumma, -2);
        if ((nSumma >= -0.011) and (nSumma <= 0.011)) then
          nSumma := 0;
        if ((nSumma <> 0) and (dZaMG < d_DtCtrl))
                   {по-моему, за прошлые месяцы
                    часы без сумм уже не интересны даже по бюджетным видам} or
                (((cVidN = '5002') or (cVidN = '5011') or (cVidN = '5012')) and
                 (nChas <> 0)) or
                (((nChas <> 0) or (nSumma <> 0) or
                                   bVidBudg) and (dZaMG >= d_DtCtrl)) then begin
          if nPrr = 0 then begin
            bIsInv := IsInvalid(nTabN, dZaMG);
            if bIsInv {and (cVidN <> '1005') and (cVidN <> '1006') and
                           (cVidN <> '1008') and (cVidN <> '8611') and
                             заремил 06-02-2011 (cVidN <> '8671')} then
              nPRR := 7;
          end;
          AddRecInZ_Nu(d_DtCtrl, dZaMG, dDt_Beg, dDt_End, nChas, nSumma,
                       nTabN, n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ, nPdn, nPrPv,
                       nPRR, nKto, nPrKr, nSpec_NR,
                   cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg, cKdBnk);
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
    // Nothing (по крайней мере пока)
  END;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.AddRecInZ_Nu(dRMes, dZaMG, dDt_Beg, dDt_End : TDateTime;
                       nChas, nSumma : double;
                       nTabN, n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ, nPdn, nPrPv,
                       nPRR, nKto, nPrKr, nSpec_NR : integer;
                       cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV,
                                                cOznPilg, cKdBnk : ShortString);
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
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.CreOpenWrkTables(nTabN : integer);
var cSuff : string;
begin
  cSuff := IntToStr(MilliSecondOfTheHour(Now));
  while Length(cSuff) < 7 do
    cSuff := '0' + cSuff;
  cSuff := Copy(cSuff, 5, 3);
  cNmTblPeriodu := 'x_Prd' + cSuff;
  cNmTblNU      := 'x_Nu' + cSuff;
  cNmtblMd      := 'x_Prm' + cSuff;
  cNmTblSvRes   := 'x_SvR' + cSuff;
  // tblPeriodu создается и заполняется перед расчетом, в нее собираются расчет-
  // ные периоды-месяцы, которые засветились в Z_OTKL текущего месяца (d_DtCtrl)
  // tblSvRes создается один раз перед расчетом для сбора по-периодно резуль-
  //                                                     татов месячных расчетов
  // Таблица tblMd (перемещений) - создается один раз на все периоды, а дни
  // периодов заполняются при начале счета каждого периода
  // tblNU - создается заново для каждого периода BatchMov'ом из Z_NU
  PanelNmTblNu.Caption := 'Имя файла таблицы tblNU: ' + cNmTblNU +
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
procedure TFormRs2.CreOpenTblPeriodu(nTabN : integer; cNmTblPeriodu : string);
var dOtklDtPrc, dOtklDtZaMG, dTmpMes : TDateTime; cVidN : ShortString;
    nY, nM, nD : word;
begin
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
(*
    SQL.Add('Select distinct DtProc, ZaMesGod, DtStorn, VidN, PrKr ' +
            ' from z_Otkl where (TabN = :nTabN) and ' +
            ' (DtProc = :d_DtCtrl or DtStorn = :d_DtCtrl) ' +
            // про DtStorn добавил 21-11-2015 и заремился 01-02-2016
            ' order by ZaMesGod, PrKr Desc ');
*)
    SQL.Add('Select distinct DtProc, ZaMesGod, VidN, PrKr ' +
            ' from z_Otkl where (TabN = :nTabN) and ' +
            ' (DtProc = :d_DtCtrl or DtStorn = :d_DtCtrl) ' +
            // про DtStorn добавил 21-11-2015 и убрал 01-02-2016
            ' order by ZaMesGod, PrKr Desc ');

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
//      else if (FieldByName('DtStorn').AsDateTime = d_DtCtrl) then
        // Этот случай добавился с 21-11-2015 и заремился 01-02-2016
//        AddInPeriodu(d_DtCtrl, dOtklDtZaMG, FieldByName('PrKr').AsInteger,
//                                                         0, 0, 0, 0, 0, 0, 0)
      else if (dOtklDtZaMG >= dMesPeremen) and
                (dOtklDtZaMG <= dOtklDtPrc) and  // не беру будущие периоды
                       not tblPeriodu.Locate('ZaMesGod', dOtklDtZaMG, []) then
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
procedure TFormRs2.AddInPeriodu(dDtProc, dZaMesGod : TDateTime; nPrKr,
                          nNSpecPS, nNuCntFakt, nNuCntInPS, nOtklCntFakt,
                          nOtklCntInPS : integer;
                          nNuAvgSpecPS, nOtklAvgSpecPS : double);
begin
  if (dDtProc <> dZaMesGod) then with tblPeriodu do begin
    Append;
    FieldByName('DtProc').AsDateTime     := dDtProc;
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
    FieldByName('RequiredPS').AsBoolean := TRUE;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.DelTmpTables;
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
    if Exists and not bFlagDbg then DeleteTable;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.OpenMesQueries(nTabN : integer; dRMes : TDateTime);
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
    SQL.Add('Select * from GetWrkNadb(:nTabN, :dDtBeg, :dDtEnd)');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtBeg').AsDateTime := dRMes;
    ParamByName('dDtEnd').AsDateTime := dDtEndRMes;
    Open;
  end;
  with qryUdrg do begin
    DataBaseName := CESMAIN;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmPfMax(dAnyDate : TDateTime; var nSmPfMax : double);
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
function TFormRs2.GetPrcWSb(dAnyDate: TDateTime): double;
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
procedure TFormRs2.GetPdnInfo(dAnyDate : TDateTime;
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
procedure TFormRs2.Part01(nTabN : Integer; dRMes : TDateTime);
begin
  if not bFlagDbg then begin {при bFlagDbg это делается с кнопок}
    CreOpenOldNU(nTabN, dRMes);
    ObrOtkl(nTabN, dRMes);
  end;
  R_Default(nTabN, dRMes);
  if bFlagDbg then
    dbgrNu.Refresh;
  ObrNadbSpsb3(nTabN, dRMes);
  if bFlagDbg then
    dbgrNu.Refresh;
  // Вот тут, если месяц до 01-01-2011, заполнить поля
  // sNwCmn, sNwPps, sNwBln, sNwDgv
  FillOksInPart01;  // Это в процессе Part01
  sBtnCheckOks.Click;
  if bFlagDbg then
    dbgrNu.Refresh;
  RaschetDoplDoMinZP(dRMes);     // там пока стоит Exit сразу на входе
  if bFlagDbg then
    dbgrNu.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.FillOksInPart01;    // Это в процессе Part01
var cVidN, c_SchBU : ShortString;
    nSmNwForECmn, nSmNwForEBln, nSmNwForEDkr, nSmNwForEPps, nSmNwForEDgv,
       nSmNwForPdnCmn, nSmNwForPdnDgv, nSmForWSb, nSmNwForPrf, nNwSmm : double;
    dDtPrc, dZaMG : TDateTime;
    nStep, n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ, nPRR : SmallInt;
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
          if cdsOKS.Locate('ZaMesGod;KdSps;KdObj;KdKatP;KdSpZ;PRR',
                            VarArrayOf([dZaMG, n_KdSps, n_KdObj,
                                             n_KdKatP, n_KdSpZ, nPRR]), []) then
            cdsOKS.Edit          // Это в процессе Part01
          else begin
            cdsOKS.Append;
            cdsOksStep.AsInteger  := nStep;
            cdsOksMetka.AsBoolean := true;
            cdsOKS.FieldByName('DtPrc').AsDateTime    := dDtPrc;
            cdsOKS.FieldByName('ZaMesGod').AsDateTime := dZaMG;
            cdsOKS.FieldByName('KdSps').AsInteger     := n_KdSps;
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
procedure TFormRs2.R_Default(nTabN : integer; dRMes :TDateTime);
// Произвести все начисления по умолчанию (Оклад, КомбОклад, Надбавки)
var nChasR, nChasPrc, nChasToNU, nSummaR, nChasPU, nOklTrf,
            nCmbOklTrf, nCmbOklSmm, nPrcWrkTime : double;
    nY, nM, nD : word;
    nSpec_NR, nCntDay, nCntWorkDay, nDbgPereNR : integer;
    n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ, nCmbOklKdSpZ, nSO, nPdNlg : SmallInt;
    dDtBegR, dDtEndR, dDtBegPU, dDtEndPU : TDateTime;
    bItIsOtp, bItIsBln, bIsPravo, bRabotal, bIsBdgZan : boolean;
    nStep : SmallInt;
    bCmbOkl, bCdsCmbOklCreated, bIsOkl, bIsPU : boolean;
    bNextCmbOkl, bNextItIsOtp, bNextItIsBln, bNextIsPravo,
                    bNextRabotal, bNextIsBdgZan : boolean;
    nNextKdSps, nNextKdObj, nNextKdKatP,
                 nNextKdSpZ, nNextSO, nNextPdNlg :integer;
    nNextOklTrf, nNextPrcWrkTime : double;
    cSchBU : ShortString;
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
  DecodeDate(dRMes, nY, nM, nD);
  n_CurBudget := DmMain.Budget(nY, nM, nCntDay, nCntWorkDay);
  with tblMd {таблица "Дни месяца"} do begin
    First;
    bIsOkl := false;
    bIsPU  := false;
    bCdsCmbOklCreated := false;
    while not Eof do begin
      if tblMdRMes.AsDateTime <> dRMes then begin
        Next; // Теперь такого не может быть !!!
        Continue;
      end;
      Inc(nStep);
      // Сохраняю параметры записи в tblMd, влияющие на начисление оклада
      nSpec_NR     := tblMdSpec_NR.AsInteger;
      bItIsOtp     := (tblMdIsOtp.AsInteger > 0);
      bItIsBln     := tblMdIsBln.AsBoolean;
      bIsPravo     := tblMdIsPravo.AsBoolean;
      bRabotal     := tblMdRabotalPrp.AsBoolean;
      bIsBdgZan    := tblMdIsBdgZan.AsBoolean;
      n_KdSps      := tblMdKdSps.AsInteger;
      n_KdObj      := tblMdKdObj.AsInteger;
      n_KdKatP     := tblMdKdKatP.AsInteger;
      n_KdSpZ      := tblMdKdSpZ.AsInteger;
      nSO          := tblMdSO.AsInteger;
      nPdNlg       := tblMdPdNlg.AsInteger;
      nOklTrf      := tblMdOklTrf.AsFloat;
      nPrcWrkTime  := tblMdPrcWrkTime.AsFloat;
      bCmbOkl := (not tblMdCmbOkl.IsNull and (tblMdCmbOkl.AsInteger = 1));
      if bRabotal and bIsPravo and not bIsBdgZan and
                  not bItIsOtp and not bItIsBln then begin
        // Если bCmbOkl - приходится собирать кусочки в спецТаблицу,
        // т.к. неизвестно, из скольких частей состоит полный оклад
        if nStep = 1 then
          dDtBegR := tblMdDtMes.AsDateTime;
        dDtEndR := tblMdDtMes.AsDateTime;
        nChasR  := nChasR + tblMdCntWrkChs.AsFloat;
        nChasPrc := nChasPrc + tblMdCntWrkChs.AsFloat *
                                           (1 - tblMdPrcWrkTime.AsFloat);
        if bCmbOkl then begin
          if not bCdsCmbOklCreated then begin
            CreOpenCdsCmbOkl(nSpec_NR);
            bCdsCmbOklCreated := true;
          end;
          cdsCmbOkl.First;
          while not cdsCmbOkl.Eof do begin
            nCmbOklTrf := cdsCmbOkl.FieldByName('OklTrf').AsFloat;
            nCmbOklSmm := nCmbOklTrf / n_CurBudget *
                     tblMdCntWrkChs.AsFloat{ * tblMdPrcWrkTime.AsFloat};
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
          nSummaR := nSummaR +
                       nOklTrf / n_CurBudget * tblMdCntWrkChs.AsFloat;
          bIsOkl := true;
        end; end
      else if not bIsPravo and not bItIsOtp and not bItIsBln then
        // Не делаю ничего - неопл.виды переписываются в tblNU прямо из ObrOtkl
      else if not bRabotal and not bItIsOtp and not bItIsBln then begin
        if nStep = 1 then
          dDtBegPU := tblMdDtMes.AsDateTime;
        dDtEndPU := tblMdDtMes.AsDateTime;
        nChasPU := nChasPU + tblMdCntWrkChs.AsFloat; // часы по приему/увольн.
        bIsPU  := true;     //PrmUV
      end;
      Next;
      // Если прерывалась последовательность контролируемых параметров в
      // таблице tblMd или tblMd.EOF - закончить период, сделать запись
      // "по-умолчанию" в tblNU и начать новый период
      bNextItIsOtp    := bItIsOtp;
      bNextItIsBln    := bItIsBln;
      bNextIsPravo    := bIsPravo;
      bNextRabotal    := bRabotal;
      bNextIsBdgZan   := bIsBdgZan;
      nNextKdSps      := n_KdSps;
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
        bNextIsPravo    := tblMdIsPravo.AsBoolean;
        bNextRabotal    := tblMdRabotalPrp.AsBoolean;
        bNextIsBdgZan   := tblMdIsBdgZan.AsBoolean;
        nNextKdSps      := tblMdKdSps.AsInteger;
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
                 (bItIsBln <> bNextItIsBln) or (bIsPravo <> bNextIsPravo) or
                  (bRabotal <> bNextRabotal) or (bIsBdgZan <> bNextIsBdgZan) or
                   (n_KdObj <> nNextKdObj) or (n_KdKatP <> nNextKdKatP) or
                    (n_KdSpZ <> nNextKdSpZ) or (nSO <> nNextSO) or
                     (nOklTrf <> nNextOklTrf) or
                                     (nPrcWrkTime <> nNextPrcWrkTime) then begin
        nDbgPereNR := tblMdNR.AsInteger;
        if nDbgPereNR > 20000 then
          ShowMessage('Такого не может быть - просто для компилятора');
        if bCdsCmbOklCreated then begin  // выгружаю его записи в tblNU
          cdsCmbOkl.First;
          if bFlagDbg then
            cdsCmbOkl.SaveToFile(cDirTemp + 'CmbOkl.cds');
          while not cdsCmbOkl.Eof do begin
            n_KdSpZ := cdsCmbOkl.FieldByName('KdSpZ').AsInteger;
            cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
            tblNuAdd(false, d_DtCtrl, dRMes,
                      cdsCmbOkl.FieldByName('DtBeg').AsDateTime,
                      cdsCmbOkl.FieldByName('DtEnd').AsDateTime,
                       '1004', cdsCmbOkl.FieldByName('KdSps').AsInteger,
                       n_KdObj, n_KdKatP, nPdNlg, 0, 0, n_KdSpZ,
                       cdsCmbOkl.FieldByName('Chas').AsFloat,
                       RoundTo(cdsCmbOkl.FieldByName('Summa').AsFloat, -2),
                0, 0, cSchBU, 'поУмолч.', 'Из_CmbOkl', '', '', '', nSpec_NR, 0);
            // тут же рассчитываю надбавки на части окладов
            R_Ndb(nTabN, d_DtCtrl, dRMes, dDtBegR, dDtEndR,
                         true, cdsCmbOkl.FieldByName('KdSpZ').AsInteger,
                                        n_CurBudget,
                                        cdsCmbOkl.FieldByName('Chas').AsFloat,
                                        cdsCmbOkl.FieldByName('Summa').AsFloat);
            cdsCmbOkl.Next;
          end; end
        else if bIsOkl then begin
          nChasToNU := RoundTo(nChasR - nChasPrc, 0);
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true,
                   d_DtCtrl, dRMes, dDtBegR, dDtEndR, '1003', n_KdSps,
                                    n_KdObj, n_KdKatP, nPdNlg, 0, 0, n_KdSpZ,
                                    nChasToNU, RoundTo(nSummaR, -2), 0, 0,
                      cSchBU, 'поУмолч.', 'ByDefault', '', '', '', nSpec_NR, 0);
          if nChasPrc > 0 then
            tblNuAdd(false,
                     d_DtCtrl, dRMes, dDtBegR, dDtEndR, '5007', n_KdSps,
                                    n_KdObj, n_KdKatP, 1, 0, 0, n_KdSpZ,
                                    RoundTo(nChasPrc,0), 0, 0, 0,
                      cSchBU, 'поУмолч.', 'ByDefault', '', '', '', nSpec_NR, 0);
          R_Ndb(nTabN, d_DtCtrl, dRMes, dDtBegR, dDtEndR, false, 0,
                                            n_CurBudget, nChasR, nSummaR); end
        else if bIsPU {PrmUv} then begin
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true,
                   d_DtCtrl, dRMes, dDtBegPU, dDtEndPU, '5001', n_KdSps,
                   n_KdObj, n_KdKatP, nPdNlg, 0, 0, n_KdSpZ, nChasPU, 0, 0, 0,
                             cSchBU, 'поУмолч.', 'ByDefault', '', '', '', 0, 0);
        end;
        nChasR   := 0;
        nChasPrc := 0;
        nSummaR  := 0;
        nChasPU  := 0;
        nStep    := 0;
        bIsOkl   := false;
        bIsPU    := false;
        bCdsCmbOklCreated := false;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.R_Ndb(nTabN : integer;
                           d_DtPrc, dRMes, dDtBegR, dDtEndR : TDateTime;
                           bCmbOkl : boolean; nCmbOklKdSpZ : SmallInt;
                           nBudget, nChas, nSmm : double);
var dDtEndMes : TDateTime; n_KdSpZ : SmallInt;
    nPdN : SmallInt; cNdbVidN : string4;
    dDtBegNdb, dDtEndNdb : TDateTime;
    nSumProcNdb,   {из таблицы надбавок}
    nChNdb, nSmNdb,{то, что будет начислено} nDummy : double;
    cSchBU, cMesPrkzBeg, cMyNotes : ShortString;
begin
  dDtEndMes := MyLastDOM(dRMes);
  with qryNadb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Nadb where (TabN = :nTabN) and ' +
            ' (Dt_Beg <= :dDtEndMes)  and ' +
            ' ((Dt_End is NULL) or (Dt_End >= :dRMes)) ' +
            ' order by Dt_Beg desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
    ParamByName('dRMes').AsDateTime := dRMes;
    Open;
    if not bCmbOkl then begin
      while not Eof do begin
        cNdbVidN  := FieldByName('VidN').AsString;
        cMesPrkzBeg := Copy(qryNadb.FieldByName('DtPrBeg').AsString, 4, 7);
        if (FieldByName('SpsRsch').AsInteger = 3) {сумма без учета отраб. врем.
                                     Пропускаю - обработается в ObrNadbSpsb3} or
                           (cNdbVidN = '1425' {Служебная - всегда 0}) then begin
          Next;
          Continue;
        end;
        if (FieldByName('Dt_Beg').IsNull or
            (FieldByName('Dt_Beg').AsDateTime <= dDtEndMes)) and
             (FieldByName('Dt_End').IsNull or
              (FieldByName('Dt_End').AsDateTime >= dRMes)) then begin
          DmMain.Get_VidInfo(FieldByName('VidN').AsString, p_KEKV, p_ShVidN,
                   p_zp13, p_Otp, p_Bln, p_Dkr, p_Otpuskn, p_Bolnic, p_SPrm,
                   p_CPrm, p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov,
                   p_Ind, p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdN,
                   p_SPrf, p_SPens, p_SAlim, p_SSocStrah, p_SBzr,
                   p_CNdb, p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ, p_KdSpz);
          if p_SPdN = '1' then             {p_OklFnd понимать, как "входит ли}
            nPdN := 1                      {в расчет суммы для доплат к минЗП"}
          else
            nPdN := 0;
          // в какой период между dDtBegR и dDtEndR действует надбавка
          if not FieldByName('Dt_Beg').IsNull then
            dDtBegNdb := Max(dDtBegR, FieldByName('Dt_Beg').AsDateTime)
          else
            dDtBegNdb := dDtBegR;
          if not FieldByName('Dt_End').IsNull then
            dDtEndNdb := Min(dDtEndR, FieldByName('Dt_End').AsDateTime)
          else
            dDtEndNdb := dDtEndR;
          nSumProcNdb := FieldByName('SumProc').AsFloat;
          // Пройтись по tblMd, начислить по-денно и собрать сумму и часы
          if FieldByName('SP').AsString = '%' {процентная надбавка} then
            R_NdbByPrc(dDtBegNdb, dDtEndNdb,
                                  nBudget, nSumProcNdb, nChNdb, nSmNdb)
          else
            R_NdbBySmm(dDtBegNdb, dDtEndNdb,
                                  nBudget, nSumProcNdb, nChNdb, nSmNdb);
          nSmNdb := MyRound(nSmNdb, 2); //RoundTo(nSmNdb, -2);
          if nSmNdb <> 0 then begin
            n_KdSpZ := FieldByName('KdSpZ').AsInteger;
            cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
            cMyNotes := cMesPrkzBeg + ' FromNadb';
            tblNuAdd(true, d_DtPrc, dRMes, dDtBegNdb, dDtEndNdb, cNdbVidN,
                             FieldByName('KdSps').AsInteger,
                             FieldByName('KdObj').AsInteger,
                             FieldByName('KdKatP').AsInteger,
                             nPdN, 0, 0, n_KdSpZ,
                             nChNdb, nSmNdb, 0, 0,
                             cSchBU, 'из Надбавок', cMyNotes,
                              '', '', '', FieldByName('Spec_NR').AsInteger, 0);
          end;
        end;
        Next;
      end; end
    else begin
      while not Eof do begin
        cNdbVidN  := FieldByName('VidN').AsString;
        cMesPrkzBeg := Copy(FieldByName('DtPrBeg').AsString, 4, 7);
        if (FieldByName('SpsRsch').AsInteger = 3)
        {сумма без учета отраб.врем. Пропускаю - обработается в ObrNadbSpsb3} or
                           (cNdbVidN = '1425' {Служебная - всегда 0}) or
            (bCmbOkl and
                   (FieldByName('KdSpZ').AsInteger <> nCmbOklKdSpZ)) then begin
          Next;
          Continue;
        end;
        if (FieldByName('Dt_Beg').IsNull or
            (FieldByName('Dt_Beg').AsDateTime <= dDtEndMes)) and
             (FieldByName('Dt_End').IsNull or
              (FieldByName('Dt_End').AsDateTime >= dRMes)) then begin
          DmMain.Get_VidInfo(FieldByName('VidN').AsString, p_KEKV, p_ShVidN,
                   p_zp13, p_Otp, p_Bln, p_Dkr, p_Otpuskn, p_Bolnic, p_SPrm,
                   p_CPrm, p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov,
                   p_Ind, p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdN,
                   p_SPrf, p_SPens, p_SAlim, p_SSocStrah, p_SBzr,
                   p_CNdb, p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ, p_KdSpz);
          if p_SPdN = '1' then             {p_OklFnd понимать, как "входит ли}
            nPdN := 1                      {в расчет суммы для доплат к минЗП"}
          else
            nPdN := 0;
          // в какой период между dDtBegR и dDtEndR действует надбавка
          if not FieldByName('Dt_Beg').IsNull then
            dDtBegNdb := Max(dDtBegR, FieldByName('Dt_Beg').AsDateTime)
          else
            dDtBegNdb := dDtBegR;
          if not FieldByName('Dt_End').IsNull then
            dDtEndNdb := Min(dDtEndR, FieldByName('Dt_End').AsDateTime)
          else
            dDtEndNdb := dDtEndR;
          if (dDtBegNdb <> dDtBegR) or (dDtEndNdb <> dDtEndR) then
            DmMain.GetCntWrkDaysOtp(dDtBegNdb, dDtEndNdb,  // тут ВНИМАНИЕ!
                {как поведёт себя процедура с пустыт cCase} nDummy, nChNdb, '')
          else
            nChNdb := nChas;
          if FieldByName('SP').AsString = '%' {процентная надбавка} then
            nSmNdb :=
              FieldByName('SumProc').AsFloat / 100 * nSmm {* nChasNdb / nBudget}
          else
            nSmNdb := FieldByName('SumProc').AsFloat * nChNdb / nBudget;
          n_KdSpZ := FieldByName('KdSpZ').AsInteger;
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
          cMyNotes := cMesPrkzBeg + ' FromNadb';
          tblNuAdd(true, d_DtPrc, dRMes, dDtBegNdb, dDtEndNdb, cNdbVidN,
                             FieldByName('KdSps').AsInteger,
                             FieldByName('KdObj').AsInteger,
                             FieldByName('KdKatP').AsInteger,
                             nPdN, 0, 0, n_KdSpZ,
                             nChNdb, RoundTo(nSmNdb, -2), 0, 0,
                             cSchBU, 'из Надбавок', cMyNotes,
                               '', '', '', FieldByName('Spec_NR').AsInteger, 0);
        end;
        Next;
      end;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.R_NdbBySmm(dDtBNdb, dDtENdb: TDateTime;
                   nCurBudg, nSumProcNdb : double; var nChNdb, nSmNdb : double);
var dDtMes : TDateTime; nSvPereNR : integer; bPereEof : boolean;
begin
  with tblMd do begin  // тут очень скользко - tblMd в это время использу-
    bPereEof := Eof;     // ется в расчете R_Default и может находиться как
    nSvPereNR := tblMdNR.AsInteger; // где-то в средине, так и в Eof'е.
    First;                           // В любом случае нужно вернуть ее на место
    nChNdb := 0;
    nSmNdb := 0;
    while not Eof do begin
      dDtMes := tblMdDtMes.AsDateTime;
      if (dDtMes >= dDtBNdb) and (dDtMes <= dDtENdb) then begin
        if tblMdRabotalPrp.AsBoolean and tblMdIsPravo.AsBoolean and
                (tblMdIsOtp.IsNull or (tblMdIsOtp.AsInteger < 1)) and
                                         (not tblMdIsBln.AsBoolean) and
                                      (tblMdCntWrkChs.AsFloat > 0) then begin
          nChNdb := nChNdb + tblMdCntWrkChs.AsFloat;
          nSmNdb := nSmNdb + nSumProcNdb * tblMdCntWrkChs.AsFloat / nCurBudg;
        end;
      end;
      Next;
      if tblMdDtMes.AsDateTime > dDtENdb then
        Break;
    end;
    nSmNdb := RoundTo(nSmNdb, -2);
    if bPereEof then begin      // Вертаю tblMd взад
      Last;
      Next; end
    else
      Locate('NR', nSvPereNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.R_NdbByPrc(dDtBNdb, dDtENdb: TDateTime;
                   nCurBudg, nSumProcNdb : double; var nChNdb, nSmNdb : double);
var dDtMes : TDateTime; nSvPereNR : integer; bPereEof : boolean;
begin
  with tblMd do begin  // тут очень скользко - tblMd в это время использу-
    bPereEof := Eof;     // ется в расчете R_Default и может находиться как
    nSvPereNR := tblMdNR.AsInteger; // где-то в средине, так и в Eof'е.
    First;                           // В любом случае нужно вернуть ее на место
    nChNdb := 0;
    nSmNdb := 0;
    while not Eof do begin
      dDtMes := tblMdDtMes.AsDateTime;
      if (dDtMes >= dDtBNdb) and (dDtMes <= dDtENdb) then begin
        if tblMdRabotalPrp.AsBoolean and tblMdIsPravo.AsBoolean and
             (tblMdIsOtp.IsNull or tblMdIsInKmd.AsBoolean or
                          (tblMdIsOtp.AsInteger < 1)) and
                                         (not tblMdIsBln.AsBoolean) and
                                      (tblMdCntWrkChs.AsFloat > 0) then begin
          nChNdb := nChNdb + tblMdCntWrkChs.AsFloat;
          nSmNdb := nSmNdb + tblMdOklTrf.AsFloat * nSumProcNdb / 100 *
                                          tblMdCntWrkChs.AsFloat / nCurBudg;
        end;
      end;
      Next;
      if tblMdDtMes.AsDateTime > dDtENdb then
        Break;
    end;
    nSmNdb := RoundTo(nSmNdb, -2);
    if bPereEof then begin      // Вертаю tblMd взад
      Last;
      Next; end
    else
      Locate('NR', nSvPereNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.CreOpenCdsCmbOkl(nSpec_NR : integer);
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
      Post;
      qryCmbOkl.Next;
    end;
    qryCmbOkl.Close;
    qryCmbOkl.SQL.Clear;
    qryCmbOkl.DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.RaschetDoplDoMinZP(dRMes : TDateTime);
var nSmOsnZp, nChOsnZp, nCurMinZp, nSmDopl : double;
    nCntNeOsnChas, nCntNeOsnChasForSovm : double;
    nSmBySovm, nCntChasBySovm : double;
    nOsnKdSps, nOsnKdObj, nOsnKdKatP, nOsnKdSpz : integer;
    bIsOsnParams, bIsViduSovm : boolean; cVidN : string4;
    nSovmOsnKdSps, nSovmOsnKdObj, nSovmOsnKdKatP, nSovmOsnKdSpz : integer;
    bIsSovmOsnParams : boolean; nPrcWrkTime, nPrcSovm : double;
    cSchBU : ShortString;
begin
  Exit; // POKA не рассчитываем долаты до минимума !!!    TYTYTYTYT
        // И ни разу не начислялись (Виды 1601 и 1614 (совместителям))
  GetPdnInfo(dRMes, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
                                    nProgMinCM, nPrgLg, nProcLg, nSm2660,
                                    nSmLg100,nSmLg150, nSmLg200);
  nSmOsnZp := 0;
  nChOsnZp := 0;
  nCurMinZp := nMinZpCM;
  bIsOsnParams := false;
  nOsnKdSps  := 0;
  nOsnKdObj  := 0;
  nOsnKdKatP := 0;
  nOsnKdSpz  := 0;
  nCntNeOsnChas := 0;
  nCntNeOsnChasForSovm := 0;
  bIsViduSovm := false;
  bIsSovmOsnParams := false;
  nSmBySovm := 0;
  nCntChasBySovm := 0;
  nSovmOsnKdSps  := 0;
  nSovmOsnKdObj  := 0;
  nSovmOsnKdKatP := 0;
  nSovmOsnKdSpz  := 0;
  nPrcSovm := 100;
  with tblNU do begin
    First;
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      if (FieldByName('OklFnd').AsString = '1') and
                      (FieldByName('ZaMesGod').AsDateTime = dRMes) then begin
        if not bIsOsnParams and (FieldByName('Summa').AsFloat > 0) then begin
          nOsnKdSps  := FieldByName('KdSps').AsInteger;
          nOsnKdObj  := FieldByName('KdObj').AsInteger;
          nOsnKdKatP := FieldByName('KdKatP').AsInteger;
          nOsnKdSpz  := FieldByName('KdSpZ').AsInteger;
          bIsOsnParams := true;
        end;
        nSmOsnZp := nSmOsnZp + FieldByName('Summa').AsFloat;
        nChOsnZp := nChOsnZp + FieldByName('Chas').AsFloat; end
      else if (FieldByName('ZaMesGod').AsDateTime = dRMes) then begin
        if ((cVidN >= '2400') and (cVidN < '2500')) or         // отпускные
             ((cVidN >= '2600') and (cVidN < '2700')) or       // больничные
                 ((cVidN >= '5000') and (cVidN < '5100')) then // неоплачиваемые
          nCntNeOsnChas := nCntNeOsnChas + FieldByName('Chas').AsFloat;
      end;
      // Попутно выясняю, есть ли начисления по "совместительским"
      // видам (16з, 16и). Если есть - по ним сделать отдельную
      // проверку, не нужно ли доплатить до мин ЗП
      if ((cVidN >= '2400') and (cVidN < '2500')) or        // отпускные
           ((cVidN >= '2600') and (cVidN < '2700')) or      // больничные
           ((cVidN >= '5000') and (cVidN < '5100') and (cVidN <> '5007')) then
        // неоплачиваемые, кроме неполного рабочего времени
        nCntNeOsnChasForSovm := nCntNeOsnChasForSovm +
                                              FieldByName('Chas').AsFloat;
      if (FieldByName('ZaMesGod').AsDateTime = dRMes) and
                               (FieldByName('Sovm').AsString = '1') then begin
        bIsViduSovm := true;
        nSmBySovm := nSmBySovm + FieldByName('Summa').AsFloat;
        nCntChasBySovm := nCntChasBySovm + FieldByName('Chas').AsFloat;
        if not bIsSovmOsnParams then begin
          nSovmOsnKdSps  := FieldByName('KdSps').AsInteger;
          nSovmOsnKdObj  := FieldByName('KdObj').AsInteger;
          nSovmOsnKdKatP := FieldByName('KdKatP').AsInteger;
          nSovmOsnKdSpz  := FieldByName('KdSpZ').AsInteger;
          if not FieldByName('PrcSovm').IsNull then
            nPrcSovm := FieldByName('PrcSovm').AsFloat
          else
            nPrcSovm := 100;
          bIsSovmOsnParams := true;
        end;
      end;
      Next;
    end;
  end;
  nPrcWrkTime := 1; // TYTYTYT ???
  if (nSmOsnZp < nCurMinZp) then begin
    if (nCntNeOsnChas >= 0) then begin
      // уменьшаю nCurMinZp, соответственно отработанному времени
      nCurMinZp := nCurMinZp * (n_CurBudget - nCntNeOsnChas) / n_CurBudget;
      if (nSmOsnZp < nCurMinZp) then begin
        // прямо в tblNU добавляем запись с видом 16а (доплата до мин.з/пл)
        nSmDopl := nCurMinZp - nSmOsnZp; // и с основными KdObj, KdKatP и KdSpZ
        nSmDopl := RoundTo(nSmDopl, -2);
        cSchBU := DmMain.KdSbu2SchBU(nOsnKdSpZ);
        tblNuAdd(true, dRMes, dRMes, 0, 0, '1601', nOsnKdSps, nOsnKdObj,
                                  nOsnKdKatP, 1, 0, 0, nOsnKdSpZ, 0, nSmDopl,
                              nPrcWrkTime, 0, cSchBU, '', '', '', '', '', 0, 0);
      end;
    end;
  end;
  if bIsViduSovm then begin
    nCurMinZp := nMinZpCM;
    if nCntChasBySovm < n_CurBudget then
      // уменьшаю nCurMinZp, соответственно отработанному времени
      nCurMinZp := nMinZpCM * nPrcSovm / 100 *
                          (n_CurBudget - nCntNeOsnChasForSovm) / n_CurBudget;
    if (nSmBySovm < nCurMinZp) then begin
      // прямо в tblNU добавить запись с видом 16о (допл.до мин.совместителям)
      nSmDopl := nCurMinZp - nSmBySovm; // и с основными KdObj, KdKatP и KdSpZ
      nSmDopl := RoundTo(nSmDopl, -2);
      cSchBU := DmMain.KdSbu2SchBU(nSovmOsnKdSpz);
      tblNuAdd(true, dRMes, dRMes, 0, 0, '1614', nSovmOsnKdSps, nSovmOsnKdObj,
                       nSovmOsnKdKatP, 1, 0, 0, nSovmOsnKdSpz, 0, nSmDopl,
                       nPrcWrkTime, nPrcSovm, cSchBU, '', '', '', '', '', 0, 0);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.Part02(nTabN : Integer; dRMes : TDateTime);
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
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SvTblNuToTblSvRes(dRMes : TDateTime);
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
                         //tblNuVidN.AsString,
                         tblNuDt_Beg.AsString, tblNuDt_End.AsString,
                         tblNuKdSps.AsString, tblNuKdObj.AsString,
                         tblNuKdKatP.AsString, tblNuKdSpZ.AsString,
                         tblNuPdN.AsString, tblNuNotes.AsString,
                         tblNuPRR.AsString, tblNuPrPV.AsString,
                         tblNuKto.AsString, tblNuPrKr.AsString,
                         tblNuMyNotes.AsString, tblNuSpecPS.AsString,
                         tblNuSpec_NR.AsString, tblNuDtVdPV.AsString,
                         tblNuNrVdPV.AsString, '', tblNuSAlim.AsString,
                         tblNuOzn_Pilg.AsString, tblNUCBudg.AsString,
                         tblNuKdBnk.AsString);
      Next;
    end;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.AddRecToTblSvRes(nTabN : integer;
                             dDtPrc, dZaMG : TDateTime; nDChs, nDSmm : double;
                                 cVidN, cDt_Beg, cDt_End, cKdSps,
                                cKdObj, cKdKatP, cKdSpZ, cPdN, cNotes, cPRR,
                               cPrPV, cKto, cPrKr, cMyNotes, cSpecPS,
                               cSpec_NR, cDtVdPV, cNrVdPV, cStorn, cSAlim,
                               cOznPilg, cCBudg, cKdBnk : ShortString);
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
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.RaschetDolga(d_DtCtrl : TDateTime);
var nSmNaRuki  : double; cKdSps, cKdObj, cKdKatP, cKdSpZ : ShortString;
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
  if nSmNaRuki < 0 then begin
    // Записать сумму долга по месту основной работы
    // с основными данными (KdSps, KdObj, KdSpZ, KdKatP на конец месяца)
    nSmNaRuki := -nSmNaRuki;
    tblMd.Last;
    cKdSps  := tblMd.FieldByName('KdSps').AsString;
    cKdObj  := tblMd.FieldByName('KdObj').AsString;
    cKdKatP := tblMd.FieldByName('KdKatP').AsString;
    cKdSpZ  := tblMd.FieldByName('KdSpZ').AsString;
    AddRecToTblSvRes(n_TN, d_DtCtrl, d_DtCtrl,   {Добавлять надо уже в tblSvRes}
                         0, nSmNaruki, '2724',
                         '', '', cKdSps, cKdObj, cKdKatP, cKdSpZ,
               '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetPrcEsv(dZaMG: TDateTime;
                  var nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDkr, nPrcEDgv: double);
var nCntRec, i : integer;
begin
  nPrcECmn  := 0;
  nPrcEPps  := 0;
  nPrcEBln  := 0;
  nPrcEDkr  := 0;
  nPrcEDgv  := 0;
  i := 0;
  with qryPrcEsv do begin  // сортирована по DtBeg descending
    nCntRec := RecordCount;
    First;
    while not Eof do begin
      Inc(i);
      if (FieldByName('DtBeg').AsdateTime <= dZaMG) or
             // если не оказалось нужной записи - беру данные из последней
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
procedure TFormRs2.GetPrcEsvPrp(dZaMG: TDateTime; var nPrcECmn, nPrcEInv,
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
  with qryPrcEsvPrp do begin  // сортирована по DtBeg descending
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
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmECmn(nTabN : integer; dZaMG : TDateTime;
                             nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEPps(nTabN : integer; dZaMG : TDateTime;
                             nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmECmnPrp(nTabN: integer; dZaMG: TDateTime;
                             nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEBlnPrp(nTabN: integer; dZaMG: TDateTime;
                              nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEBlnInvPrp(nTabN: integer; dZaMG: TDateTime;
                              nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEDkr(nTabN: integer; dZaMG: TDateTime; nSmFor,
                                       nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEDkrInvPrp(nTabN: integer; dZaMG: TDateTime;
                               nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEDkrPrp(nTabN: integer; dZaMG: TDateTime; nSmFor,
                                       nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEDgvPrp(nTabN: integer; dZaMG: TDateTime;
                             nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEInvPrp(nTabN : integer; dZaMG : TDateTime;
                            nSmFor, nSmSvP, nPrc : double; var nSmXX : double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEBln(nTabN : integer; dZaMG : TDateTime;
                               nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmEDgv(nTabN : integer; dZaMG : TDateTime;
                               nSmFor, nSmSvP, nPrc: double; var nSmXX: double);
begin
  nSmXX := nPrc * (nSmFor - nSmSvP) / 100;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.QryInvPrepare;
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
function TFormRs2.IsInvalid(nTabN : integer; dZaMG : TDateTime) : boolean;
begin
  Result := false;
  with qryInv do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dOnDate').AsDateTime := dZaMG;
    Open;
    if (FieldValues['Inv'] > 0) and (not FieldByName('NrDoc').IsNull) and
                     (Trim(FieldByName('NrDoc').AsString) > '') then
      Result := true;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmForSvPorogi(var nSmFSvP, nSmCmnFSvP, nSmPpsFSvP,
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
function TFormRs2.IsPolnMesByPrmUv(nTabN: integer; dZaMG: TDateTime): boolean;
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
                 (FieldByName('Dt_Priem').AsDateTime < dLastDOM)) then
        Result := false;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.R_Esv2016(nTabN: integer; dRMes: TDateTime);
var n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ, nPRR : SmallInt;
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
    bInvalid, bPensioner, bSovm, bIsNeoplVids, bIsPrmUv,
                              bRabotalInMes {хотя бы один день} : boolean;
    bIsPolnMesByPrmUv : boolean;
    nKoefPonig : double; // Вводится, если есть сверхПорог
    bWasEsv : boolean;
    nSmOldSvPrg, nSmNewSvPrg, nSmSvPrg, nSmDoMinZp, nSmTtForXX : double;
    nSmDbg, nSmDelta : double;
    bPravimEsv, bEsv, bEsvPrp  : boolean;
    cCntOks3Rec, nRecNumber : SmallInt;
    nSmXxDoMinZp, nSmCmnFor, nSmPpsFor, nSmBlnFor, nSmDkrFor, nSmDgvFor,
    nNwSmCmnF, nNwSmPpsF, nNwSmBlnF, nNwSmDkrF, nNwSmDgvF : double;
    // Ниже переменные для расчёта сверхПорогов по таблице tblNU
    nSmFSvP, nSmCmnFSvP, nSmPpsFSvP, nSmBlnFSvp, nSmDkrFSvP, nSmDgvFSvP : double;
    bWrtnSvPCmn, bWrtnSvPPps, bWrtnSvPBln, bWrtnSvPDkr, bWrtnSvPDgv : boolean;
begin
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
      dOksZaMG   := FieldByName('ZaMG').AsDateTime;
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
(*
      dDtDbg := 0;
      if (dOksRMes < d_20160101) and (dOksRepMes < d_20160101) and
                                                 (dOksZaMG < d_20160101) then
        dDtDbg := dZaMG
      else if (dOksRMes >= d_20160101) and (dOksRepMes >= d_20160101) and
                                                 (dOksZaMG < d_20160101) then
        dDtDbg := dOksRMes
      else if (dOksRMes >= d_20160101) and (dOksRepMes < d_20160101) and
                                                 (dOksZaMG < d_20160101) then
        dDtDbg := dOksRMes
     else if (dOksRMes >= d_20160101) and (dOksRepMes < d_20160101) and
                                                (dOksZaMG < d_20160101) then
        dDtDbg := dZaMG;
*)
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
      {
      bWrtnSvPCmn := false;
      bWrtnSvPPps := false;
      bWrtnSvPBln := false;
      bWrtnSvPDkr := false;
      bWrtnSvPDgv := false;
      }
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
      nSmForXX := nSmECmnFor + nSmEPpsFor + nSmEBlnFor + nSmEDkrFor + nSmEDgvFor;

      //=======  расчет удержаний и взносов в ЕСВ с Общих(НеППС)-сумм  =======//
      nSmForXX := FieldByName('sNwCmn').AsFloat;
      nSmSvPrg := nSvPECmn;
      nPrcE    := nPrcECmn;  //FieldByName('PrcECmn').AsFloat;
      cMyNotes := FloatToStr(nPrcE) + '%';
      if nSmForXX <> 0 then begin
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin
          cVidXX := '6201';   // ЕсвОбщие (с сотр.)
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                         cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
        end;
        if (nSmSvPrg <> 0) and not bWrtnSvPCmn then begin
          bWrtnSvPCmn := true;
          cVidXX := '8606';   // СверхПорогиОбщие
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSmSvPrg, 0, 0,
                         cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0);
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
          n_KdSps  := FieldByName('KdSps').AsInteger; // разнесены при рас-
          n_KdObj  := FieldByName('KdObj').AsInteger; // чёте ЕСВ с сотруд-
          n_KdKatP := FieldByName('KdKatP').AsInteger;// ника с общих видов
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX,
                         0, 0, cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
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
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                         cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
        end;
        if (nSmSvPrg <> 0) and not bWrtnSvPPps then begin
          bWrtnSvPPps := true;
          cVidXX   := '8607';  // СверхПорогиППС
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSmSvPrg, 0, 0,
                         cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0);
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
          n_KdSps  := FieldByName('KdSps').AsInteger; // разнесены при рас-
          n_KdObj  := FieldByName('KdObj').AsInteger; // чёте ЕСВ с сотруд-
          n_KdKatP := FieldByName('KdKatP').AsInteger;// ника с общих видов
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX,
                         0, 0, cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
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
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                         cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
        end;
        if (nSvPEDgv <> 0) and not bWrtnSvPDgv then begin
          bWrtnSvPDgv := true;
          cVidXX   := '8610';   // СвПорогиГпд
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSvPEDgv, 0, 0,
                         cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0);
        end;
        // тут же делаю взносы с предприятия с ДГВ-видов
        nSmForXX := nSmEDgvFor;
        nSmSvPrg := nSvPEDgv;
        nPrcE    := nPrcPrpEDgv;
        cMyNotes := FloatToStr(nPrcE) + '%';
        nSmXX := MyRound(nPrcE * (nSmForXX - nSmSvPrg) / 100, 2);
        if nSmXX <> 0 then begin
          cVidXX   := '8691';   // ЕсвПрпГпд  (с предпр.)
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                         cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
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
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                         cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
        end;
        if (nSmSvPrg <> 0) and not bWrtnSvPBln then begin
          bWrtnSvPBln := true;
          cVidXX   := '8608';  // СверхПорогиБЛН
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSmSvPrg, 0, 0,
                         cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0);
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
          n_KdSps  := FieldByName('KdSps').AsInteger; // разнесены при рас-
          n_KdObj  := FieldByName('KdObj').AsInteger; // чёте ЕСВ с сотруд-
          n_KdKatP := FieldByName('KdKatP').AsInteger;// ника с общих видов
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                         cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
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
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                         cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
        end;
        if (nSmSvPrg <> 0) and not bWrtnSvPDkr then begin
          bWrtnSvPDkr := true;
          cVidXX   := '8608';  // СверхПорогиБЛН (для Декр. нету "своего" вида)
          n_KdSps  := FieldByName('KdSps').AsInteger;
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, nSmSvPrg, 0, 0,
                         cSchBU, cDbgMsg, cDbgMsg, '', '', '', 0, 0);
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
          n_KdSps  := FieldByName('KdSps').AsInteger; // разнесены при рас-
          n_KdObj  := FieldByName('KdObj').AsInteger; // чёте ЕСВ с сотруд-
          n_KdKatP := FieldByName('KdKatP').AsInteger;// ника с общих видов
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU   := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj,
                         n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                         cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
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
        GetSmsDoMinZp(nSmXxDoMinZp,
                         nSmCmnFor, nSmPpsFor, nSmBlnFor, nSmDkrFor,
                                    nNwSmCmnF, nNwSmPpsF, nNwSmBlnF, nNwSmDkrF);
        GetPrcEsvPrp(dDtDbg, nPrcPrpECmn, nPrcPrpEInv, nPrcPrpEBln,
                                                  nPrcPrpEBlnInv, nPrcPrpEDkr,
                                                  nPrcPrpEDkrInv, nPrcPrpEDgv);
        nSmForXX := nSmXxDoMinZp;
//        nSmForXX := nSmECmnFor + nSmEPpsFor +
//                                 nSmEBlnFor + nSmEDkrFor + nSmEDgvFor;
        bIsNeoplVids := IsNeoplVids(nTabN, dZaMG);
        // Определить необходимые параметры в таблице z_TPdn) на dZaMG
        GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
                                     nProgMinCM, nPrgLg, nProcLg, nSm2660,
                                                 nSmLg100, nSmLg150, nSmLg200);
        if (nSmForXX < nMinZpCM) and not bIsNeoplVids then begin
          bRabotalInMes := WorksInMes(nTabN, dZaMG);
          // тут надо выяснить, числился ли полный месяц (не было ли прм/уволн
          // после 1-го числа месяца и раньше последнего числа месяца)
          bIsPolnMesByPrmUv := IsPolnMesByPrmUv(nTabN, dZaMG);
          LocalGetPereInf(nTabN, MyLastDOM(dZaMG), nPereKdSps, nPereKdObj,
                      nPereKdKatP,
                      nPereSO, nPerePdNlg, nPereKolMin, nPereKdSpz, nPereOklTrf,
                      nPereAvans, cPereSpAv, cPereDolgnost, cPereNrPrikaza,
                      dPereDtPrikaza, bPerePens, bSovm, bPerePrfs, nPereInv);
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
              n_KdSps  := FieldByName('KdSps').AsInteger;
              n_KdObj  := FieldByName('KdObj').AsInteger;
              n_KdKatP := FieldByName('KdKatP').AsInteger;
              n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
              nPRR     := FieldByName('PRR').AsInteger;
              cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
              tblNuAdd(true,
                       dRMes, dZaMG, 0, 0, cVidXX, n_KdSps, n_KdObj, n_KdKatP,
                       1, 0, nPRR, n_KdSpZ, 0, -nSmXX, 0, 0,
                       cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
              cMyNotes := 'На неё ' + FloatToStr(nPrcE) +
                                           '% по ' + cVidXX + ' виду ';
              tblNuAdd(true, {дописать сумму ЗПЛ, на которую начислился nSmXX}
                      dRMes, dZaMG, 0, 0, cVidDoMinZp, n_KdSps, n_KdObj, n_KdKatP,
                      1, 0, nPRR, n_KdSpZ, 0, nSmDoMinZp, 0, 0,
                      cSchBU, cDbgMsg, cMyNotes, '', '', '', 0, 0);
            end;
          end;
        end;
      end; // Закончилась разборка-расчёт сумм ДоМинЗп
      Next;
    end;
    if bPravimEsv then
//      MadeNewEsvEqualOldEsv(bEsv, bEsvPrp);
    ;
  end;
end;  // End of procedure R_Esv2016
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmPfFzSs(nTabN : integer; dZaMG: TDateTime;
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
procedure TFormRs2.SetSvPorogi(nSmFor, nSmPfMax, nSmECmnFor, nSmEPpsFor,
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
procedure TFormRs2.GetSm1517(nSmCmnFX, nSmDgvFX, nSmMin10 : double;
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
procedure TFormRs2.R_PdNlg(nTabN : integer; dRMes : TDateTime);
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
    n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ, nPRR, nSvCdsNR1, nSvCdsNR2 : integer;
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
                  n_KdObj  := FieldByName('KdObj').AsInteger;
                  n_KdKatP := FieldByName('KdKatP').AsInteger;
                  nPRR     := FieldByName('PRR').AsInteger;
                  n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
                  cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
                  tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps,
                           n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ, 0, -nSmPorc,
                          0, 0, cSchBU, 'общ.', 'Cmn', '', '', c_OznPilg, 0, 0);
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
                n_KdObj  := FieldByName('KdObj').AsInteger;
                n_KdKatP := FieldByName('KdKatP').AsInteger;
                nPRR     := FieldByName('PRR').AsInteger;
                n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
                cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
                tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps,
                                n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ,
                                0, -nSmPorc, 0, 0,
                                cSchBU, 'дгв.', 'Dgv', '', '', '', 0, 0);
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
procedure TFormRs2.R_WSb(nTabN: integer; dRMes: TDateTime);
var n_KdSps, n_KdObj, n_KdKatP, n_KdSpz, nPRR : SmallInt;
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
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          if not cdsNwSm.Locate('DtPrc;ZaMesGod;KdSps;KdObj;KdKatP;KdSpZ;PRR',
                            VarArrayOf([dRMes, dZaMG, n_KdSps, n_KdObj,
                                       n_KdKatP, n_KdSpZ, nPRR]), []) then begin
            cdsNwSm.Append;
            cdsNwSm.FieldByName('DtPrc').AsDateTime := dRMes;
            cdsNwSm.FieldByName('ZaMesGod').AsDateTime := dZaMG;
            cdsNwSm.FieldByName('KdSps').AsInteger  := n_KdSps;
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
          n_KdObj  := FieldByName('KdObj').AsInteger;
          n_KdKatP := FieldByName('KdKatP').AsInteger;
          n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
          nPRR     := FieldByName('PRR').AsInteger;
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dZaMG, 0, 0, '6007', n_KdSps,
                       n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ,
                               0, -nSmXX, 0, 0,
                               cSchBU, '', '', '', '', '', 0, 0);
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
              n_KdObj  := FieldByName('KdObj').AsInteger;
              n_KdKatP := FieldByName('KdKatP').AsInteger;
              n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
              nPRR     := FieldByName('PRR').AsInteger;
              cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
              tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps,
                           n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ,
                                   0, -nSmPorc, 0, 0,
                                   cSchBU, '', '', '', '', '', 0, 0);
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
function TFormRs2.SumWSb(nTabN: integer; var cVidN: string4; dRMes: TDateTime;
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
function TFormRs2.GetPereKdSpZ(dDtMes : TDateTime) : integer;
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
procedure TFormRs2.GetSmEsv(dZaMG: TDateTime; var nSmUdEsvCmn,
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
procedure TFormRs2.CreOpenOldNU(nTabN : integer; dRMes : TDateTime);
var cInSQL : string; i : integer; cVidN, cRMes, c_SchBU : ShortString;
    mList : TStringList;
    bBadKdSpZ, bMesDoPeremen, bNotMesInLbxPeriodu : boolean;

    nNewKdSpZ : SmallInt; dNuDtZaMG : TDateTime;
    dDtPrc, dZaMG : TDateTime; cVidFor : ShortString;
    nStep, n_KdSps, n_KdKatP, n_KdObj, nPRR, n_KdSpZ : SmallInt;
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
  with qryTmp do begin     // Открыть "старые" начисления
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select n.NR, n.DtProc, n.ZaMesGod, n.TabN, n.VidN, ' +
            ' n.Chas as OldCh, n.Summa as OldSm, n.Dt_Beg, n.Dt_End, ' +
            ' n.KdSps, n.KdObj, n.KdKatP, n.KdSpZ, n.SchBU, n.PSch, n.PdN, ' +
            ' n.Notes, n.PRR, n.PrPV, n.Kto, n.PrKr, n.MyNotes, n.SpecPs, ' +
            ' n.Spec_NR, n.OldKdObj, n.OldKdVidN, Cast(0 as Float) as Chas, ' +
            ' Cast(0 as Float) as Summa, n.DtVdPV, n.NrVdPV, ' +
            ' Cast(0 as Float) as d_Ch, Cast(0 as Float) as d_Sm, ' +
            ' n.Ozn_Pilg, n.KdBnk, v.* ' +
            ' from ViNU n Left Outer Join z_KdVidN v on v.VidN = n.VidN ' +
            ' where (n.TabN = :nTabN) ');
    SQL.Add(' and ((n.VidN < "7500") or (n.VidN > "7600")) and ' +
             // без видов выплат (7500-7600), алиментов, переводов, ПСб и ДлгТМ
            ' (not n.VidN in ("6601","6602","6611","6612","2724")) ');
    if dRMes < d_20110101 then // все что связано с ПФ, ФЗ, ТВП, НВ, ЕСВ
      // не выбираю т.к. для таких месяцев ЕСВ считается только по дельтам sNw***
      SQL.Add(' and not (n.VidN >= "6201" and n.VidN <= "6502") and ' +
              ' not (n.VidN >= "8601" and n.VidN <= "8604") and not ' +
              ' (n.VidN >= "8611" and n.VidN <= "8691")  ');
    if dRMes < d_DtCtrl then begin
      SQL.Add(' and (n.ZaMesGod = :dRMes) and (n.DtProc < :d_DtCtrl) ');
      if dRMes < d_MesBegWSb then // чтобы ВСбор вид 6007 брался только с на-
                                  // численного в расчётном месяце (d_DtCtrl)
        SQL.Add(' and not (VidN = "6007" and n.DtProc < :d_DtCtrl )');
//      if dRMes <= d_20160101 then // не надо отслеживать старые ЕСВ*, т.к.
//                                  // с d_20160101 не начисляются
//        SQL.Add(' and not (VidN in ("6201","6206","6211","6212","6216") and ' +
//        // м.б. тут (ниже) лучше поставить  n.DtProc < :d_20160101 ???
//                ' n.DtProc < :d_DtCtrl )');
        end
    else
      SQL.Add(' and (n.DtProc < :dRMes) and (n.ZaMesGod ' + cInSQL + ')');
    SQL.Add(' order by n.ZaMesGod, n.VidN');
    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('dRMes').AsDateTime := dRMes;
    if dRMes < d_DtCtrl then
      ParamByName('d_DtCtrl').AsDateTime := d_DtCtrl;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'NuOldMes.sql');
    Open;
    tblNu.BatchMove(qryTmp, BatCopy);
    tblNu.AddIndex('', 'NR', [ixPrimary]);
    tblNu.AddIndex('ZaMgVidN', 'ZaMesGod;VidN;NR', []);
    tblNu.IndexName := 'ZaMgVidN';
    tblNu.Open;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
(* Попробовать, подумав, собирать данные для ОКС прямо из ViNuMain
Select ZaMesGod, DtProc, KdObj, KdSps, KdKatP, KdSpZ, VidN, ShVidN, Round(Sum(Summa),2)
from ViNuMain where (TabN = 1239) and ZaMesGod = '11/01/2015'
group by ZaMesGod, DtProc, KdObj, KdSps, KdKatP, KdSpZ, VidN, ShVidN
*)
(*
Такой получается запрос для месяцев меньше d_DtCtrl (dRMes < d_DtCtrl)
Select n.NR, n.DtProc, n.ZaMesGod, n.TabN, n.VidN,
       n.Chas as OldCh, n.Summa as OldSm, n.Dt_Beg, n.Dt_End,
       n.KdSps, n.KdObj, n.KdKatP, n.KdSpZ, n.SchBU, n.PSch, n.PdN,
       n.Notes, n.PRR, n.PrPV, n.Kto, n.PrKr, n.MyNotes, n.SpecPs,
       n.Spec_NR, n.OldKdObj, n.OldKdVidN, Cast(0 as Float) as Chas,
       Cast(0 as Float) as Summa, n.DtVdPV, n.NrVdPV,
       Cast(0 as Float) as d_Ch, Cast(0 as Float) as d_Sm,
       n.Ozn_Pilg, n.KdBnk, v.*
from ViNU n Left Outer Join z_KdVidN v on v.VidN = n.VidN
where (n.TabN = 1239) and ((n.VidN < "7500") or (n.VidN > "7600")) and
           /* без видов выплат (7500-7600), алиментов, переводов, ПСб и ДлгТМ */
             (not n.VidN in ("6601","6602","6611","6612","2724"))
      and (n.ZaMesGod = '11/01/2015') and (n.DtProc < '02/01/2016')
      /* if dRMes < d_MesBegWSb then // чтобы ВСбор вид 6007 брался только с на- */
      /*                            // численного в расчётном месяце (d_DtCtrl) */
      /*and not (VidN = "6007" and n.DtProc < '02/01/2016' )*/
order by n.ZaMesGod, n.VidN
А такой для месяца равного d_DtCtrl (dRMes = d_DtCtrl)
Select n.NR, n.DtProc, n.ZaMesGod, n.TabN, n.VidN,
       n.Chas as OldCh, n.Summa as OldSm, n.Dt_Beg, n.Dt_End,
       n.KdSps, n.KdObj, n.KdKatP, n.KdSpZ, n.SchBU, n.PSch, n.PdN,
       n.Notes, n.PRR, n.PrPV, n.Kto, n.PrKr, n.MyNotes, n.SpecPs,
       n.Spec_NR, n.OldKdObj, n.OldKdVidN, Cast(0 as Float) as Chas,
       Cast(0 as Float) as Summa, n.DtVdPV, n.NrVdPV,
       Cast(0 as Float) as d_Ch, Cast(0 as Float) as d_Sm,
       n.Ozn_Pilg, n.KdBnk, v.*
from ViNU n Left Outer Join z_KdVidN v on v.VidN = n.VidN
where (n.TabN = 1239) and ((n.VidN < "7500") or (n.VidN > "7600")) and
           /* без видов выплат (7500-7600), алиментов, переводов, ПСб и ДлгТМ */
             (not n.VidN in ("6601","6602","6611","6612","2724"))
       and (n.DtProc < '02/01/2016') and (n.ZaMesGod  in ('02/01/2016')
order by n.ZaMesGod, n.VidN

*)
  with tblNu do begin
    DisableControls;
    if (dRMes < d_DtCtrl) then begin  // перерасчет месяца
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
            // сия хохма с суммой введена из след. "соображений":
            // т.к. месяцы до dMesPeremen не подлежат автоПересчету, то
            //   - новые УДЕРЖАНИЯ по ним принимаю равными старым,
            //   - новые НАЧИСЛЕНИЯ должны попасть из ObrOtkl
            // Пока вроде сошлось, дальше посмотрю.
          if bNotMesInLbxPeriodu then
            FieldByName('Summa').AsFloat := FieldByName('OldSm').AsFloat;
          Post;
        end;
        Next;
      end; end
    else {if dRMes = d_DtCtrl} begin
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
    end;
    EnableControls;
    SetTblNuFilter;
  end;
  // теперь с cdsOks вклиниваюсь тут (в новом "понимании")
  with cdsOks do begin
    if Active then begin
      SaveToFile(cDirTemp + 'cdsOks2.cds');
      Close;
    end;
    IndexName := '';
    IndexDefs.Clear;
    CreateDataSet;
    Open;
    AddIndex('OksMSOKSP','ZaMesGod;DtPrc;KdSps;KdObj;KdKatP;KdSpZ;PRR',[]);
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
          if cdsOKS.Locate('DtPrc;ZaMesGod;KdSps;KdObj;KdKatP;KdSpZ;PRR',
                            VarArrayOf([dDtPrc,dZaMG,n_KdSps,n_KdObj,
                                               n_KdKatP,n_KdSpZ,nPRR]), []) then
            cdsOKS.Edit      // Это пишется в ОКС после открытия OldNU
          else begin
            cdsOKS.Append;
            cdsOksStep.AsInteger  := nStep;
            cdsOksMetka.AsBoolean := true;
            cdsOKS.FieldByName('DtPrc').AsDateTime    := dDtPrc;
            cdsOKS.FieldByName('ZaMesGod').AsDateTime := dZaMG;
            cdsOKS.FieldByName('KdSps').AsInteger     := n_KdSps;
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
procedure TFormRs2.tblNuBeforePost(DataSet: TDataSet);
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
        tblNuOldKdVidN.AsString   := FieldByName('OldKdVidN').AsString;
        tblNuOldKdVidN_1.AsString := FieldByName('OldKdVidN').AsString;
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
        tblNuSovm.AsString        := FieldByName('Sovm').AsString;
        tblNuSpov.AsString        := FieldByName('Spov').AsString;
        tblNuKEKV.AsString        := FieldByName('KEKV').AsString;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.tblNuAdd(bCanUni : boolean; {разрешение объединять}
                               d_DtPrc, dZaMesGod, dDtBeg, dDtEnd : TDateTime;
                              cVidN : string4; n_KdSps, n_KdObj, n_KdKatP, nPdN,
                                         nPrPV, nPRR, n_KdSpz : integer;
                               nChas, nSumma, nPrcWrkTime, nPrcSovm : double;
            cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg : ShortString;
                                          nSpecNR : integer; nKdBnk : SmallInt);
var bIsInv : boolean; {cMsg : ShortString;}
    //nSmm, nSmECmnF, nSmEPpsF, nSmEBlnF, nSmEDgvF,
    //                          nSmPdnCmnF, nSmPdnDgvF, nSmPrfF : double;
    //dDtPrc, dZaMG : TDateTime;
    //nPrcECmn, nPrcEPps, nPrcEBln, nPrcEDgv : double;
begin
  if nPrr = 0 then begin
    bIsInv := IsInvalid(n_TN, dZaMesGod);
    if bIsInv and (cVidN <> '1005') and (cVidN <> '1006') and
          (cVidN <> '1008') and (cVidN <> '8611') and (cVidN <> '8671') then
      nPRR := 7;
  end; // с 27-09-2007 Оставляю так. Так, пожалуй, правильно, т.к.
       // иначе плохо объединяются старые и новые записи (Кедик в 09-2007)
  bCanUni := false;     // Пришлось убрать "объединение" из-за Военного сбора
  with tblNU do begin                                             // 10-09-2014
    if bCanUni and (((nSpecNR > 0) and Locate(
                    'ZaMesGod;VidN;KdSps;KdObj;KdKatP;PdN;KdSPZ;Spec_NR',
               VarArrayOf([dZaMesGod,cVidN,n_KdSps,n_KdObj,n_KdKatP,nPdN,
                                               n_KdSPZ,nSpecNR]), [])) or
        ((cNrVdPV > '') and (nKdBnk > 0) and Locate(
                     'ZaMesGod;VidN;KdSps;KdObj;KdKatP;PdN;KdSPZ;NrVdPV;KdBnk',
               VarArrayOf([dZaMesGod,cVidN,n_KdSps,n_KdObj,n_KdKatP,nPdN,
                                        n_KdSPZ,cNrVdPv,nKdBnk]), [])) or
           (Locate('ZaMesGod;VidN;KdSps;KdObj;KdKatP;PdN;KdSPZ',
               VarArrayOf([dZaMesGod,cVidN,n_KdSps,n_KdObj,n_KdKatP,nPdN,
                 n_KdSPZ]), []))) then
      Edit
    else begin
      Append;
      FieldByName('OldCh').AsFloat := 0; // т.к. это APPEND - значит в
      FieldByName('OldSm').AsFloat := 0; // старых этих сумм не было
      FieldByName('DtProc').AsDateTime   := d_DtPrc;
      FieldByName('ZaMesGod').AsDateTime := dZaMesGod;
      FieldByName('VidN').AsString       := cVidN;
      FieldByName('KdSps').AsInteger     := n_KdSps;
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
      FieldByName('Spec_NR').AsInteger   := nSpecNR;
      FieldByName('DtVdPV').AsString     := cDtVdPV;
      FieldByName('NrVdPV').AsString     := cNrVdPV;
    end;
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
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.CreOpenTblMd(nTabN : integer; dRMes : TDateTime;
                                                           cNmtblMd : string);
var dBegPeriod, dEndPeriod, dDtMes, dDtBegMes, dDtEndMes,
                                    dDtPriemPrp, dDtUvolnPrp : TDateTime;
    nDayOfWeek : byte; nTmpSps : integer;
    nCntWorkChas, nPrcWrkTime, nCntSpsBudgChas : double;
    bAllBM : boolean;
begin
  dDtBegMes := dRMes;
  dDtEndMes := MyLastDOM(dRMes);
  if (dRMes > d_DtCtrl) and tblPerioduAllBM.AsBoolean then
    bAllBM := true
  else
    bAllBM := false;
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
    AddIndex('OnDtMes', 'KdSps;DtMes', [ixCaseInsensitive]);
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
      dEndPeriod := dDtEndMes;
      if not FieldByName('Dt_Beg').IsNull and
             (FieldByName('Dt_Beg').AsDateTime > dEndPeriod) then begin
        Next;
        Continue;
      end;
      if FieldByName('PrcWrkTime').IsNull or
                      (FieldByName('PrcWrkTime').AsFloat = 100) then
        nPrcWrkTime := 1
      else
        nPrcWrkTime := FieldByName('PrcWrkTime').AsFloat / 100;
      if FieldByName('Dt_Beg').IsNull then
        dBegPeriod := dRMes
      else
        dBegPeriod := Max(FieldByName('Dt_Beg').AsDateTime, dRMes);
      dDtMes := dEndPeriod; // идем от конца месяца и заполняем по-денно
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
          tblMd.Append;
          tblMdRMes.AsDateTime      := dRMes;
          tblMdDtMes.AsDateTime     := dDtMes;
          if (dRMes > d_DtCtrl) then    // разрешить ПОЛНЫЙ расчет месяца (но
            tblMdAllBM.AsBoolean := bAllBM; // (только ДО начала отпуска или
                        // больничных, если они заканчиваются в этом же месяце)
          tblMdKdSps.AsInteger      := FieldByName('KdSps').AsInteger;
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
          tblMdOklTrf.AsFloat       := FieldByName('OklTrf').AsFloat;
          tblMdPrcWrkTime.AsFloat   := nPrcWrkTime;
          tblMdCntWrkChs.AsFloat    := nCntWorkChas;
          tblMdRabotalPrp.AsBoolean := false; // сначала ставлю везде FALSE, а
          tblMdRabotalSps.AsBoolean := false; // потом откорректирую по PrmUv
          tblMdIsPravo.AsBoolean := true; // тут наоборот, а если будут откло-
                           // нения по неопл. видам, то поставлю в эти дни FALSE
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
              tblMd.Edit;
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
  // В tblMd попадут только дни, для которых нашлись даты в
  // qryPere (т.е. она может быть и не на весь месяц и даже пустой).
  // tblMd.IndexName := 'OnDtMes';
  tblMd.First;
end;
//-------------- Рассчитать сумму по отклонениям -------------------------------
procedure TFormRs2.RaschetOtkl(nTabN, nSpecNR : integer; cVidN : string4;
                                          dZaMG, dDtBeg, dDtEnd : TDateTime;
                                                var nChOtkl, nSmOtkl : double);
var dDtEndMes : TDateTime;
begin
  nSmOtkl := 0;
  if (dDtBeg = 0) and (dDtEnd = 0) then begin
    dDtEndMes := MyLastDOM(dZaMG);  // Определить оклад на конец месяца (Ольга)
    // т.к. часы не пустые - просто начисляю на эти часы по часовому тарифу
    LocalGetPereInf(nTabN, dDtEndMes, nPereKdSps, nPereKdObj, nPereKdKatP,
                    nPereSO, nPerePdNlg, nPereKolMin, nPereKdSpz, nPereOklTrf,
                    nPereAvans, cPereSpAv, cPereDolgnost, cPereNrPrikaza,
                    dPereDtPrikaza, bPerePens, bPereSovm, bPerePrfs, nPereInv);
    if cVidN = '1201' {праздничные в одинарном размере} then
      nSmOtkl := nPereOklTrf / n_CurBudget * nChOtkl
    else if cVidN = '1202' {праздничные в двойном размере} then
      nSmOtkl := nPereOklTrf / n_CurBudget * nChOtkl * 2
    else if cVidN = '1204' {ночные} then
      nSmOtkl := GetSmPM(cVidN, dZaMG, nTabN, nChOtkl)
    else if (cVidN > '5000') and (cVidN <= '6000') {неоплачиваемые виды} then
      nSmOtkl := 0;
    nSmOtkl := RoundTo(nSmOtkl, -2);
  end;
end;
//------------------------------------------------------------------------------
function TFormRs2.GetSmPM(cVidN : string4; dZaMG : TDateTime;
                                      nTabN : integer; nChas : double) : double;
// вернуть сумму по заданным часам прошлых месяцев (ПМ), если не введена
var nBudget : double; nY, nM, nD : word;
    nCntDay, nCntWorkDay : integer;
    nKtNight : double; {коэф-т для ночных (сменился с 09-2012)}
begin
  Result := 0;
  DecodeDate(dZaMG, nY, nM, nD);
  nBudget := DmMain.Budget(nY, nM, nCntDay, nCntWorkDay);
  LocalGetPereInf(nTabN, dZaMG, nPereKdSps, nPereKdObj, nPereKdKatP, nPereSO,
                  nPerePdNlg, nPereKolMin, nPereKdSpz, nPereOklTrf, nPereAvans,
                  cPereSpAv, cPereDolgnost, cPereNrPrikaza, dPereDtPrikaza,
                  bPerePens, bPereSovm, bPerePrfs, nPereInv);
  // все это обращение к GetPereInf городилось, чтобы узнать nOtklTrf на dZaMG
  if cVidN = '1201' {праздничные в одинарном размере} then
    Result := nPereOklTrf / nBudget * nChas
  else if cVidN = '1202' {праздничные в двойном размере} then
    Result := nPereOklTrf / nBudget * nChas * 2
  else if cVidN = '1204' {ночные} then begin
    if dZaMG < EncodeDate(2012, 9, 1) then
      nKtNight := 0.35  // до 09-2012
    else
      nKtNight := 0.4;  // с 09-2012
    Result := nPereOklTrf / nBudget * nChas * nKtNight;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.ObrNadbSpsb3(nTabN : integer; dRMes : TDateTime);
var {cVidN : string4;} nSmNdb : double;
    dDtBegNdb, dDtEndNdb {в текущем месяце}, dDtEndMes : TDateTime;
    n_KdSpZ : SmallInt;  cSchBU, cMesPrkzBeg, cMyNotes : ShortString;
begin
  dDtEndMes := MyLastDOM(dRMes);
  with qryNadb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Nadb where (TabN = :nTabN) and ' +
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
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dRMes, dDtBegNdb, dDtEndNdb,
                     FieldByName('VidN').AsString,
                     FieldByName('KdSps').AsInteger,
                     FieldByName('KdObj').AsInteger,
                     FieldByName('KdKatP').AsInteger, 1, 0, 0,
                     n_KdSpZ, 0, nSmNdb, 0, 0,
                     cSchBU, 'из Надбавок', cMyNotes, '', '', '',
                     FieldByName('Spec_NR').AsInteger, 0);
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
procedure TFormRs2.ObrOtkl(nTabN : integer; dRMes : TDateTime);
var dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE : TDateTime;
    d_DtEM : TDateTime;
    cOtklZaMG : ShortString;
    cVidN : string4;
    cNotes, cMyNotes, cDtVdPV, cNrVdPV, cSchBU : ShortString;
    nSumma, nChas, nChOtkl, nSmOtkl, nPrcWrkTime, nPrcSovm, nPrcWT : double;
    nPdn, nPrPV, nPRR, nPrKr, n_KdSps, n_KdObj, n_KdSpZ,
                                      n_KdKatP, nSpec_NR : integer;
    bIsInv : boolean;
    bZaniato : boolean;
    cInSQL : string;
    i, nKdBnk : SmallInt;
    cRMes, cMesOtklDtProc : ShortString;
    mList : TStringList;
begin
{ Процедура вызывается по-месячно (определяется переменной dRMes)
  В процедуре будут фигурировать четыре даты:
  - d_DtCtrl      - системный расчетный месяц (определяется системной
                    датой и днем перехода в новый расчетный период)
  - dRMes         - рассчитываемый (пересчитываемый) месяц (передается из Part01)
  - dOtklDtProc   - месяц, в котором введены отклонения (считывается из z_Otkl)
  - dOtklDZaMG    - месяц, за который введены отклонения (считывается из z_Otkl)
}
  nPrPv := 1;
  nPrcWrkTime := 0;
  nPrcSovm := 0;
  cMyNotes := 'ObrOtkl';
  b_Pereschet := (dRMes < d_DtCtrl);
  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if b_Pereschet then // dRMes < d_DtCtrl then       // пересчёт ???
      SQL.Add('Select o.*, v.* ' +
              ' from z_otkl o, z_KdVidN v ' +
              ' where (o.TabN = :nTabN) and ' +
              ' (o.ZaMesGod = :dRMes) and ' +
              //' (not (o.VidN = "5002" and o.Storn = "Y")) and ' +
              ' ((o.VidN < "7500") or (o.VidN > "7600")) and ' +
              ' (not o.VidN in ("6601","6602","6611","8801","8802")) and ' +
              ' (v.VidN = o.VidN) ' + {без выплат,алиментов,переводов и указаний
                                                                   на пересчеты}
              ' order by o.DtProc, o.ZaMesGod, o.VidN, o.NR')
    else begin                     // рассчёт ???
      // cInSQL формируется так же, как и в CreOpenOldNU (там см. комментарии)
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
                ' (not VidN in ("8801","8802"))');
        ParamByName('nTabN').AsInteger  := nTabN;
        ParamByName('dRMes').AsDateTime := dRMes;
        Open;
        while not Eof do begin
          // в cInSQL включать только месяцы, не фигурирующие в LbxPeriodu
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
      SQL.Add('Select o.*, v.* ' +
              ' from z_otkl o, z_KdVidN v ' +
              ' where (o.TabN = :nTabN) and ' +
              ' ((o.DtProc = :dRMes) or ' +
              '  (o.DtStorn = :dRMes) or ' +
//              '  (o.DtProc <> :dRMes and o.ZaMesGod ' + cInSQL + ')) and ' +
              '  (o.DtProc < :dRMes and o.ZaMesGod ' + cInSQL + ')) and ' +
              ' (not o.VidN in ("8801","8802")) and ' +
              ' (v.VidN = o.VidN) ' +
              ' order by o.DtProc, o.ZaMesGod, o.VidN, o.NR');
    end;
    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('dRMes').AsDateTime := dRMes;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'ObrOtkl.sql');
    Open;
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
      if (cVidN = '8801') or (cVidN = '8802') {вказiвки на пересчет} or
         ((dOtklDtProc < d_DtCtrl) and (dOtklZaMG < dOtklDtProc) and
               (LbxPeriodu.Items.IndexOf(cOtklZaMG) < 0)) or
               ((dOtklDtProc < d_DtCtrl) and (cVidN > '7500')
                                         and (cVidN < '7600')){ or
               ((dOtklZaMG <> dRMes) and
                  (LbxPeriodu.Items.IndexOf(cOtklZaMG) >= 0)) or
               ((not b_Pereschet) and (dOtklDtProc < d_DtCtrl))} then begin
        Next;
        Continue;
      end;
//      if (dOtklZaMG <> dMesPeremen) or (dOtklZaMG > d_DtCtrl) then begin
//        Next;
//        Continue;
//      end;
//      if (dOtklZaMG < dMesPeremen) or (dOtklZaMG > d_DtCtrl) then begin
//        Next;
//        Continue;
//      end;
      if (FieldByName('Bolnic').AsString = '1') or
                       (FieldByName('PRR').AsInteger = 1) then begin
        // выяснить "инвалидность" сотрудника и подставить соответствующий PRR
        // для 1-х 5 дней 2 (у неИнв.) или 4 (у Инв.)
        // для остальных  1 (у неИнв.) или 3 (у Инв.)
        bIsInv := IsInvalid(nTabN, dOtklZaMG);
        if FieldByName('VidN').AsString = '2603' then begin
          if not bIsInv then
            nPRR := 2  {1-е 5 дней неИнв}
          else
            nPRR := 4; {1-е 5 дней Инв} end
        else begin
          if not bIsInv then
            nPRR := 1  {общие неИнв}
          else
            nPRR := 3; {общие Инв}
        end; end
      else
        nPRR := 0; // дальше (в SaveSchetResults) для инв.
                   // подставить PRR = 7 во все неБольничн.виды
      n_KdSps   := FieldByName('KdSps').AsInteger;
      n_KdSpZ   := FieldByName('KdSpZ').AsInteger;
      nChas     := FieldByName('Chas').AsFloat;
      nSumma    := FieldByName('Summa').AsFloat;
      cNotes    := FieldByName('Notes').AsString;
      n_KdObj   := FieldByName('KdObj').AsInteger;
      n_KdKatP  := FieldByName('KdKatP').AsInteger;
      nSpec_NR  := FieldByName('Spec_NR').AsInteger;
      if (not FieldByName('MyNotes').IsNull) and
                           (FieldByName('MyNotes').AsString > '') then
        cMyNotes := cMesOtklDtProc + ' ' + FieldByName('MyNotes').AsString
      else
        cMyNotes := cMesOtklDtProc + ' ObrOtkl';
      if (dOtklZaMG > dRMes) then begin // отклонение за будущий месяц
        // молча переписываю в tblNU
        if n_KdSpZ = 0 then
          n_KdSpZ := GetPereKdSpZ(dOtklZaMG);  // взять из местного qryPere
        if (nSumma = 0) and (nChas <> 0) and (dOtklZaMG < d_DtCtrl) and
              ((cVidN = '1201') or (cVidN = '1202') or (cVidN = '1204')) then
          nSumma := GetSmPM(cVidN, dOtklZaMG, nTabN, nChas);
        cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
        tblNuAdd(true, dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN,
                         n_KdSps, n_KdObj, n_KdKatP, nPdn, nPrPV, nPRR,
                         n_KdSpZ, nChas, nSumma, nPrcWrkTime, nPrcSovm,
                         cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, '',
                         nSpec_NR, 0); end
      else if (dOtklZaMG < dRMes) and
               (dOtklZaMG >= dMesPeremen) then begin // Отклонение за прошед-
        // ший месяц пропускаю - оно теперь обсчитается в "своем" периоде-месяце
        Next;
        Continue; end
      else begin // отклонения за текущий месяц или прошедший до dMesPeremen
        if (FieldByName('Otpuskn').AsString = '1') and
               (FieldByName('cBudg').AsString = '1') then begin {отпускные}
          if (FieldByName('Sovm').AsString = '1') then {совместительские} begin
            if (FieldByName('STORN').AsString = 'Y') and
                          (not FieldByName('Spec_NR').IsNull) then
              SetStornOtpSovmInPere(dOtklZaMG, dOtklDtB, dOtklDtE)
            else
              SetDaysOtpSovmInPere(dOtklZaMG, dOtklDtB, dOtklDtE); end
          else begin {не совместительские}
            if (FieldByName('STORN').AsString = 'Y') and
                          (not FieldByName('Spec_NR').IsNull) then
              SetStornOtpInPere(dOtklZaMG, dOtklDtB, dOtklDtE)
            else
              SetDaysOtpInPere(dOtklZaMG, dOtklDtB, dOtklDtE);
          end; end
        else if (FieldByName('Bolnic').AsString = '1') and
               (FieldByName('cBudg').AsString = '1') then {больничные}
          SetDaysBlnInPere(dOtklZaMG, dOtklDtB, dOtklDtE)
        else if (cVidN > '5000') and (cVidN < '5100') and
               (FieldByName('STORN').AsString <> 'Y') then begin // НеОплач.Виды
          // вношу сведения в поле tblMdIsPravo за соотв.дни
          SetDaysIsPavoInPere(dOtklZaMG, dOtklDtB, dOtklDtE);
          // и сразу записываю в tblNU
          if (b_Pereschet or
                       (dOtklDtProc = d_DtCtrl) or (dOtklZaMG = d_DtCtrl)) then
            cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
            tblNuAdd(false, {бюджетные - не должны объединяться}
                   dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN, n_KdSps,
                   n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR, n_KdSpZ, nChas, nSumma,
                   0, 0, cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, '',
                                                                   nSpec_NR, 0);
          Next;
          Continue; end
        else if ((cVidN > '7500') and (cVidN < '7525')) or
                                           (cVidN = '6611') then begin
          // выплаты текущего месяца в т.ч. переводы (6611) - сразу пишу в tblNU
          // Тут изменения по виду 7511 выплаты в банк - их нельзя объединять
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(false, dOtklDtProc, dOtklZaMG,  // поэтому false
                     dOtklDtB, dOtklDtE, cVidN, n_KdSps, n_KdObj, n_KdKatP,
                     nPdN, nPrPV, nPRR, n_KdSpZ, 0, nSumma,
                     0, 0, cSchBU, cNotes, cMyNotes, cDtVdPV, cNrVdPV, '',
                                                              nSpec_NR, nKdBnk);
          Next;
          Continue; end
        else if ((cVidN = '8001') {вказiвка на пересчет} or
          ((dOtklZaMG > dOtklDtProc) {что это???} and (nPrKr = 1))) then begin
          Next;
          Continue;
        end;
        if FieldByName('STORN').AsString = 'Y' then begin
          // просто переписываю одной записью сразу в tblNU
//          if (FieldByName('DtStorn').IsNull) or
//                   (FieldByName('DtStorn').AsDateTime <> dRMes) then
            cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
            tblNuAdd(true,
                   dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE, cVidN, n_KdSps,
                   n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR, n_KdSpZ, nChas, nSumma,
                   0, 0, cSchBU, 'Сторн', cMyNotes, '', '', '',
                                  FieldByName('Spec_NR').AsInteger, 0); end
        else if FieldByName('CBudg').IsNull or
                   (FieldByName('CBudg').AsString <> '1') or
                   (dOtklDtB = 0) or (dOtklDtE = 0) {сразу в tblNU} then begin
          if (nSumma = 0) and (nChas <> 0) then begin
            // Независмо от того, пустые даты начала и конца или нет -
            // попытаться рассчитать сумму по отклонениям
            nPrPv := 3;  // clNavy
            nChOtkl := nChas;
            nSmOtkl := nSumma;
            RaschetOtkl(nTabN, FieldByName('Spec_NR').AsInteger, cVidN,
                           dOtklZaMG, dOtklDtB, dOtklDtE, nChOtkl, nSmOtkl);
            nChas  := nChOtkl;
            nSumma := RoundTo(nSmOtkl, -2); end
          else begin
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
            cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
            ////////////////////////////
            tblNuAdd(false, dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE,
                  cVidN, n_KdSps, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR, n_KdSpZ,
                  nChas, nSumma, 0, 0, cSchBU, 'изОткл.', cMyNotes, '', '', '',
                                           FieldByName('Spec_NR').AsInteger, 0);
          end; end
        else if (FieldByName('CBudg').AsString = '1') and
              not (FieldByName('Otpuskn').AsString = '1') and
              not (FieldByName('Bolnic').AsString = '1') then begin
          // Вид бюджетный, отметить в tblMd дни как бюджетноЗанятые, чтобы в
          // эти дни не начислялось по умолчанию и переписать в tblNU
          if FieldByName('Chas').Value < 0 then
            bZaniato := false
          else
            bZaniato := true;
          SetDaysBdgZanInPere(cVidN, dOtklZaMG, dOtklDtB, dOtklDtE, bZaniato,0);
          if cVidN = '1206' {За дни в командировке} then begin
            if nSumma = 0 then  {Рассчитываю по среднему}
              nSumma := DmMain.MySredneMes(2, nTabN, dOtklDtB) /
                                                       nCurBudget * nChas;
          end;
          if (b_Pereschet or
                  (dOtklDtProc = d_DtCtrl) or (dOtklZaMG = d_DtCtrl)) then begin
             //  Ниже было true (объединять) 22-09-2011 поставил
             //  тут false (не объединять)
            cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
            tblNuAdd(false, dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE,
                 cVidN, n_KdSps, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR, n_KdSpZ,
                        nChas, nSumma, 0, 0, cSchBU, 'изОткл.', cMyNotes,
                        '', '', '', FieldByName('Spec_NR').AsInteger, 0);
          end; end
        else if (b_Pereschet or
                 (dOtklDtProc = d_DtCtrl) or (dOtklZaMG = d_DtCtrl)) then begin
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
          //////////////////////////  ++++++++++++++++++++++++++++++++
          tblNuAdd(false, dOtklDtProc, dOtklZaMG, dOtklDtB, dOtklDtE,
                  cVidN, n_KdSps, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR, n_KdSpZ,
                        nChas, nSumma, 0, 0, cSchBU, 'изОткл.', cMyNotes,
                               '', '', '', FieldByName('Spec_NR').AsInteger, 0);
        end;
      end;
      Next;
    end;
  end;
  with qryNdbOtkl do begin  // Проверяю, нет ли в надбавках видов 5011 или 5012
    if Active then Close;   // (ОтпДо3 или ОтпДо6). Если есть обрабатываю это
    SQL.Clear;              // как отклонение, чтобы повлияло на оклад и осталь-
    DataBaseName := CESMAIN;// ные (нормальные) надбавки
    SQL.Add('Select * from Z_Nadb where TabN = :nTabN and ' +
            'Dt_Beg <= :dDtEndMes and (Dt_End is NULL or Dt_End >= :dRMes) ' +
            ' and VidN in ("5011","5012")');
    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('dRMes').AsDateTime := dRMes;
    d_DtEM := MyLastDOM(dRMes);
    ParamByName('dDtEndMes').AsDateTime := d_DtEM;
    Open;
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      n_KdSps := FieldByName('KdSps').AsInteger;
      n_KdObj := FieldByName('KdObj').AsInteger;
      n_KdKatP := FieldByName('KdKatP').AsInteger;
      nPdN := 1;
      nPrPV := 0;
      nPRR  := 0;
      n_KdSpZ := FieldByName('KdSpZ').AsInteger;
      dOtklDtB := Max(FieldByName('Dt_Beg').AsDateTime, dRMes);
      if not FieldByName('Dt_End').IsNull then
        dOtklDtE := Min(FieldByName('Dt_End').AsDateTime, d_DtEM)
      else
        dOtklDtE := d_DtEM;
      nChas := DmMain.GetCntBudgChas(dOtklDtB, dOtklDtE);
      nSumma := 0;
      bZaniato := true;
      nPrcWT := FieldByName('Prc_Wt').AsFloat;
      SetDaysBdgZanInPere(FieldByName('VidN').AsString, dRMes, dOtklDtB,
                     dOtklDtE, bZaniato, nPrcWT);// пометил дни БюджетноЗанятыми
      cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
      cMyNotes := Copy(DateToStr(dOtklDtB), 4, 7) + ' OtklFrNdb';
      tblNuAdd(false, dRMes, dRMes, dOtklDtB, dOtklDtE,
                cVidN, n_KdSps, n_KdObj, n_KdKatP, nPdN, nPrPV, nPRR, n_KdSpZ,
                    nChas, nSumma, 0, 0, cSchBU, 'ОтклИзНдб', cMyNotes,
                              '', '', '', FieldByName('Spec_NR').AsInteger, 0);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if bFlagDbg then
    dbgrNu.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetDaysBdgZanInPere(cVidN : ShortString;
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
    else if (dDtMes >= dDtBeg) and (dDtMes <= dDtEnd) then with tblMd do begin
      if Locate('DtMes', dDtMes, []) then begin
        Edit;
        if nPrcWT > 0 then
          FieldByName('PrcWrkTime').AsFloat := nPrcWT / 100
        else
          FieldByName('IsBdgZan').AsBoolean := bZaniato;
        if cVidN = '1206' {командировочные} then
          FieldByName('IsInKmd').AsBoolean := bZaniato;
        Post;
      end;
    end;
    dDtMes := dDtMes + 1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetDaysIsPavoInPere(dOtklZaMG, dDtBeg, dDtEnd : TDateTime);
// Отметить как FALSE дни, занятые неоплачиваемыми видами, в tblMd
var dDtMes, dLastDOM : TDateTime;
begin
  dLastDOM := MyLastDOM(dOtklZaMG);
  dDtMes := dOtklZaMG;
  while true do begin
    if (dDtMes > dDtEnd) or (dDtMes > dLastDOM) then
      Break
    else if (dDtMes >= dDtBeg) and (dDtMes <= dDtEnd) then with tblMd do begin
      if Locate('DtMes', dDtMes, []) then begin
        Edit;
        FieldByName('IsPravo').AsBoolean := false;
        Post;
      end;
    end;
    dDtMes := dDtMes + 1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetStornOtpInPere(dOtklZaMG, dDtBeg, dDtEnd : TDateTime);
var dDtMes, dLastDOM : TDateTime;
begin
  dLastDOM := MyLastDOM(dOtklZaMG);
  dDtMes := dOtklZaMG;
  while true do begin
    if (dDtMes > dDtEnd) or (dDtMes > dLastDOM) then
      Break
    else if (dDtMes >= dDtBeg) and (dDtMes <= dDtEnd) then with tblMd do begin
      if Locate('DtMes', dDtMes, []) then begin
        Edit;
        FieldByName('IsOtp').AsInteger := FieldByName('IsOtp').AsInteger - 1;
        Post;
      end;
    end;
    dDtMes := dDtMes + 1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetStornOtpSovmInPere(dOtklZaMG,
                                                    dDtBeg, dDtEnd : TDateTime);
var dDtMes, dLastDOM : TDateTime;
begin
  dLastDOM := MyLastDOM(dOtklZaMG);
  dDtMes := dOtklZaMG;
  while true do begin
    if (dDtMes > dDtEnd) or (dDtMes > dLastDOM) then
      Break
    else if (dDtMes >= dDtBeg) and (dDtMes <= dDtEnd) then with tblMd do begin
      if Locate('DtMes', dDtMes, []) then begin
        Edit;
        FieldByName('IsOtpSovm').AsInteger :=
                                        FieldByName('IsOtpSovm').AsInteger - 1;
        Post;
      end;
    end;
    dDtMes := dDtMes + 1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetDaysOtpInPere(dOtklZaMG, dDtBeg, dDtEnd : TDateTime);
var dDtMes, dLastDOM : TDateTime;
begin
  dLastDOM := MyLastDOM(dOtklZaMG);
  dDtMes := dOtklZaMG;
  while true do begin
    if (dDtMes > dDtEnd) or (dDtMes > dLastDOM) then
      Break
    else if (dDtMes >= dDtBeg) and (dDtMes <= dDtEnd) then with tblMd do begin
      if Locate('DtMes', dDtMes, []) then begin
        Edit;
        FieldByName('IsOtp').AsInteger := FieldByName('IsOtp').AsInteger + 1;
        Post;
      end;
    end;
    dDtMes := dDtMes + 1;
  end;
  if (dOtklZaMG > d_DtCtrl) and (dDtEnd < dLastDOM) then
                                               with tblMd do begin
    // запретить расчет по умолчанию для послеотпускных дней
    dDtMes := dDtEnd + 1; // следующая день после окончания отпуска
    while (dDtMes <= dLastDOM) do begin
      if Locate('DtMes', dDtMes, []) and tblMdAllBM.AsBoolean then begin
        Edit;
        FieldByName('AllBM').AsBoolean := false;
        Post;
      end;
      dDtMes := dDtMes + 1;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetDaysOtpSovmInPere(dOtklZaMG, dDtBeg, dDtEnd : TDateTime);
var dDtMes, dLastDOM : TDateTime;
begin
  dLastDOM := MyLastDOM(dOtklZaMG);
  dDtMes := dOtklZaMG;
  while true do begin
    if (dDtMes > dDtEnd) or (dDtMes > dLastDOM) then
      Break
    else if (dDtMes >= dDtBeg) and (dDtMes <= dDtEnd) then with tblMd do begin
      if Locate('DtMes', dDtMes, []) then begin
        Edit;
        FieldByName('IsOtpSovm').AsInteger :=
                            FieldByName('IsOtpSovm').AsInteger + 1;
        Post;
      end;
    end;
    dDtMes := dDtMes + 1;
  end;
  if (dOtklZaMG > d_DtCtrl) and (dDtEnd < dLastDOM) then
                                               with tblMd do begin
    // запретить расчет по умолчанию для послеотпускных дней
    dDtMes := dDtEnd + 1; // следующий день после окончания отпуска
    while (dDtMes <= dLastDOM) do begin
      if Locate('DtMes', dDtMes, []) and tblMdAllBM.AsBoolean then begin
        Edit;
        FieldByName('AllBM').AsBoolean := false;
        Post;
      end;
      dDtMes := dDtMes + 1;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetDaysBlnInPere(dInMesGod, dDtBeg, dDtEnd : TDateTime);
var dDtMes, dLastDOM : TDateTime;
begin
  dLastDOM := MyLastDOM(dInMesGod);
  dDtMes := dInMesGod;
  while true do begin
    if (dDtMes > dDtEnd) or (dDtMes > dLastDOM) then
      Break
    else if (dDtMes >= dDtBeg) and (dDtMes <= dDtEnd) then with tblMd do begin
      if Locate('DtMes', dDtMes, []) then begin
        Edit;
        FieldByName('IsBln').AsBoolean := true;
        Post;
      end;
    end;
    dDtMes := dDtMes + 1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.LocalGetPereInf(nTabN : integer; dRMes : TDateTime;
                              var n_KdSps, n_KdObj, n_KdKatP, n_SO,
                                  n_PdNlg, n_KolMin, n_KdSpZ : integer;
                              var nOklTrf, nAvans : double;
                              var cSpAv : string1;
                              var cDolgnost, cNrPrikaza : string;
                              var dDtPrikaza : TDateTime;
                              var bPens, bSovm, bPrfs : boolean;
                              var nInv : SmallInt);
begin
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
        nInv     := FieldValues['Inv']
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
function TFormRs2.WorksInMes(nTabN: integer; dInMes: TDateTime): boolean;
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
procedure TFormRs2.R_ByUderg(nTabN : integer; dRMes : TDateTime);
var dFirstDOM, dLastDOM : TDateTime; nSmUdrg : double;
    n_KdSps, n_KdObj, n_KdKatP, nPRR, n_SO, n_PdNlg, n_KolMin, n_KdSpZ,
                                                           nSpecNR : integer;
    cSpAv : string1;
    cVidN : string4;
    nOklTrf, nAvans, nSmPsb : double;
    cDolgnost, cNrPrikaza, cNotes : string;
    dDtPrikaza : TDateTime;
    bRabotalInMes, bPens, bSovm, bPrfs : boolean;
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
                             n_SO, n_PdNlg, n_KolMin, n_KdSpZ, nOklTrf, nAvans,
                               cSpAv, cDolgnost, cNrPrikaza, dDtPrikaza,
                                  bPens, bSovm, bPrfs, nPereInv);
          n_KdSps := FieldByName('KdSps').AsInteger;
          // пишу прямо в tblNU
          cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
          tblNuAdd(true, dRMes, dRMes, 0, 0, cVidN, n_KdSps, n_KdObj,
               n_KdKatP, 1, 3, nPRR, n_KdSpZ, 0, nSmUdrg, 0, 0, cSchBU, cNotes,
                                           'R_ByUderg', '', '', '', nSpecNR, 0);
        end;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormRs2.SumUdrg(nTabN : integer; cVidN : string4;
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
      if qryUdrg.FieldByName('SP').AsString = '%' then
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
procedure TFormRs2.R_Prfs(nTabN : integer; dRMes : TDateTime);
var n_KdSps, n_KdObj, n_KdKatP, n_KdSpz, nPRR : SmallInt;
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
              n_KdObj  := FieldByName('KdObj').AsInteger;
              n_KdKatP := FieldByName('KdKatP').AsInteger;
              n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
              nPRR     := FieldByName('PRR').AsInteger;
              cSchBU := DmMain.KdSbu2SchBU(n_KdSpZ);
              tblNuAdd(true, dRMes, dZaMG, 0, 0, cVidXX, n_KdSps,
                           n_KdObj, n_KdKatP, 1, 0, nPRR, n_KdSpZ,
                           0, -nSmPorc, 0, 0, cSchBU, '', '', '', '', '', 0, 0);
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
function TFormRs2.SumPrfs(nTabN : integer; var cVidN : string4;
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
procedure TFormRs2.FormCreate(Sender: TObject);
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
      dbgrPrmUv.Width  := ReadInteger(SECTION, 'dbgrPrmUvW', 315);
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
    dsrcPere.DataSet    := tblMd;
    dsrcOtkl.DataSet    := qryOtkl;
    dsrcNu.DataSet      := tblNu;
    dsrcOKS.DataSet     := cdsOKS;
    if FileExists(cDirVids + 'r2_Perio.vid') then
      dbgrPeriodu.Columns.LoadFromFile(cDirVids + 'r2_Perio.vid');
    if FileExists(cDirVids + 'r2_PrmUv.vid') then
      dbgrPrmUv.Columns.LoadFromFile(cDirVids + 'r2_PrmUv.vid');
    if FileExists(cDirVids + 'r2_MD.vid') then
      dbgrPere.Columns.LoadFromFile(cDirVids + 'r2_MD.vid');
    if FileExists(cDirVids + 'r2_Otkl.vid') then
      dbgrOtkl.Columns.LoadFromFile(cDirVids + 'r2_Otkl.vid');
    if FileExists(cDirVids + 'r2_Nu03.vid') then
      dbgrNu.Columns.LoadFromFile(cDirVids   + 'r2_Nu03.vid');
    if FileExists(cDirVids + 'r2_Oks6.vid') then
      dbgrOKS.Columns.LoadFromFile(cDirVids + 'r2_Oks6.vid');
    if FileExists(cDirVids + 'r_Oks2_1.vid') then
      dbgrOks2.Columns.LoadFromFile(cDirVids + 'r_Oks2_1.vid');
    if FileExists(cDirVids + 'r_Oks3_1.vid') then
      dbgrOks3.Columns.LoadFromFile(cDirVids + 'r_Oks3_1.vid');
    if FileExists(cDirVids + 'r2_SvRs1.vid') then
      dbgrSvRes.Columns.LoadFromFile(cDirVids + 'r2_SvRs1.vid');
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
    dsrcPere.DataSet    := nil;
    dsrcOtkl.DataSet    := nil;
    dsrcNu.DataSet      := nil;
    dsrcOKS.DataSet     := nil;
    dsrcSvRes.DataSet   := nil;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if bFlagDbg then begin
    dbgrPeriodu.Columns.SaveToFile(cDirVids + 'r2_Perio.vid');
    dbgrPrmUv.Columns.SaveToFile(cDirVids   + 'r2_PrmUv.vid');
    dbgrPere.Columns.SaveToFile(cDirVids    + 'r2_MD.vid');
    dbgrOtkl.Columns.SaveToFile(cDirVids    + 'r2_Otkl.vid');
    dbgrNu.Columns.SaveToFile(cDirVids      + 'r2_Nu03.vid');
    dbgrOKS.Columns.SaveToFile(cDirVids     + 'r2_Oks6.vid');
    dbgrOks2.Columns.SaveToFile(cDirVids    + 'r_Oks2_1.vid');
    dbgrOks3.Columns.SaveToFile(cDirVids    + 'r_Oks3_1.vid');
    dbgrSvRes.Columns.SaveToFile(cDirVids   + 'r2_SvRs1.vid');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TRY
  if bFlagDbg then begin
    with TIniFile.Create(cNmIniFile) do begin
      WriteInteger(SECTION, 'wL', Left);
      WriteInteger(SECTION, 'wT', Top);
      WriteInteger(SECTION, 'wH', Height);
      WriteInteger(SECTION, 'wW', Width);
      WriteInteger(SECTION, 'dbgrPerioH', dbgrPeriodu.Height);
      WriteInteger(SECTION, 'dbgrPrmUvW', dbgrPrmUv.Width);
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
end;
//------------------------------------------------------------------------------
procedure TFormRs2.dbgrOtklDrawColumnCell(Sender: TObject;
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
procedure TFormRs2.dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : string4; cFldNm : ShortString; n_DbgKdSps : SmallInt;
begin
  n_DbgKdSps := nKdSps;
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
procedure TFormRs2.tblNuCalcFields(DataSet: TDataSet);
begin
  if tblNU.Active then begin
    tblNUd__Smm.AsFloat := tblNuSumma.AsFloat - tblNuOldSm.AsFloat;
    tblNUd__Chs.AsFloat := tblNuChas.AsFloat - tblNuOldCh.AsFloat;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.cdsOKSCalcFields(DataSet: TDataSet);
begin
//  if bFlagDbg and not cdsOKSKdSpZ.IsNull then
//    cdsOKSSchBU.AsString := DmMain.KdSbu2SchBU(cdsOKSKdSpZ.AsInteger);
//    // хотя поле и не Calculate, но позволяет такую хохму
end;
//------------------------------------------------------------------------------
procedure TFormRs2.cdsOKFloatFieldGetText(Sender: TField;
                                        var Text: String; DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsInteger = 0)) then
    Text := ''
  else
    Text := FloatToStrF((Sender as TField).AsFloat, ffFixed, 18, 2);
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnTblNuFilterClick(Sender: TObject);
begin
  SetTblNuFilter;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetTblNuFilter;
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
procedure TFormRs2.dbgrSvResDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : string4;
begin
  cVidN := tblSvResVidN.AsString;
  with dbgrSvRes.Canvas do begin
    if not (gdFocused in State) then begin
      if tblSvResKdSps.AsInteger <> nKdSps then
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
procedure TFormRs2.tblSvResCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  if bFlagDbg then
    tblSvResShVidN.AsString := DmMain.VidN2ShVidN(tblSvResVidN.AsString,
                                                                     cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnLbxPerioduClick(Sender: TObject);
begin
  SetLbxPerioduVisible;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetLbxPerioduVisible;
begin
  LbxPeriodu.Visible := sBtnLbxPeriodu.Down;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.dbgridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.dbgridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
function TFormRs2.IsPrmUv(nTabN: integer; dDtPrc: TDateTime): boolean;
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
//------------------------------------------------------------------------------
function TFormRs2.IsNeoplVids(nTabN: integer; dZaMG: TDateTime): boolean;
var nNeoplChas : SmallInt;
begin
//  Result := false;
  nNeoplChas := 0;
  with qryNeoplVids do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
(*
    SQL.Add('Select Sum(Chas) NeoplChas from Z_Otkl ' +
            ' where TabN = :nTabN and ZaMesGod = :dZaMG and ' +
            ' VidN >= "5001" and VidN <= "5006" and VidN <> "5003"');
*)
    SQL.Add('Select * from Z_Otkl ' +
            ' where TabN = :nTabN and ZaMesGod = :dZaMG and ' +
            ' VidN >= "5001" and VidN <= "5006"');
    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('dZaMG').AsDateTime := dZaMG;
    Open;
    while not Eof do begin
      if FieldByName('Storn').AsBoolean then
        nNeoplChas := nNeoplChas - FieldByName('Chas').AsInteger
      else
        nNeoplChas := nNeoplChas + FieldByName('Chas').AsInteger;
      Next;
    end;
    //Result := (RecordCount > 0) and (FieldByName('NeoplChas').AsFloat > 0);
    Result := nNeoplChas > 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnF8Click(Sender: TObject);
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
procedure TFormRs2.dbgrNUKeyDown(Sender: TObject; var Key: Word;
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
procedure TFormRs2.ShwSelTts;
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
procedure TFormRs2.popNuPopup(Sender: TObject);
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
procedure TFormRs2.sBtnClosePanelSelTtsClick(Sender: TObject);
begin
  PanelSelTts.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.popUnSelAllClick(Sender: TObject);
begin
  LbxF8.Clear;
  dbgrNu.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.popShwTtsClick(Sender: TObject);
begin
  if not PanelSelTts.Visible then
    ShwSelTts
  else
    PanelSelTts.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.dbgrOKSDblClick(Sender: TObject);
begin
  if cdsOks.Active and (cdsOks.RecordCount > 0) then with cdsOks do begin
    Edit;
    cdsOksMetka.AsBoolean := not cdsOksMetka.AsBoolean;
    Post;
    dbgrOks.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.dbgrOKSDrawColumnCell(Sender: TObject; const Rect: TRect;
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
procedure TFormRs2.sBtnCheckOksClick(Sender: TObject);
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
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmForEsv(dRMes : TDateTime;
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
//------------------------------------------------------------------------------
procedure TFormRs2.GetSmForPrfs(dRMes : TDateTime;
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
procedure TFormRs2.GetSmForWSb(dRMes : TDateTime;
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
procedure TFormRs2.GetSmForPdn(dRMes: TDateTime;
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
procedure TFormRs2.MadeNewEsvEqualOldEsv(bEsv, bEsvPrp : boolean);
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
procedure TFormRs2.CreOpenCdsOks3(dRmes: TDateTime);
var dDbgMes : TDateTime;
begin
  with cdsOks3 do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  sBtnOks2Filter.Down := true;
  cdsOks2.SaveToFile(cDirTemp + 'Oks2an_0.cds');
  SetOks2Filter;
  cdsOks2.SaveToFile(cDirTemp + 'Oks2an_1.cds');
  with cdsOks2 do begin
    if bFlagDbg then
      SaveToFile(cDirTemp + 'Oks2an1.cds');
    Filtered := true;
    First;
    while not Eof do begin
      dDbgMes := cdsOks2RMes.AsDateTime;
      AddRecInCdsOks3(dDbgMes) ;
      Next;
    end;
    First;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'Oks2an2.cds');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.AddRecInCdsOks3(dRMes : TDateTime);
var dRepMes, {dRMes,} dZaMG : TDateTime;
    nKdSps, nKdObj, nKdKatP, nKdSpZ, nPrr : SmallInt;
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
  nKdObj  := cdsOks2KdObj.AsInteger;
  nKdKatP := cdsOks2KdKatP.AsInteger;
  nKdSpZ  := cdsOks2KdSpZ.AsInteger;
  nPrr    := cdsOks2Prr.AsInteger;
  cVidN   := cdsOks2VidN.AsString;
  cSchBU  := cdsOks2SchBU.AsString;
  with cdsOks3 do begin
    if not Locate('RepMes;KdSps;KdObj;KdKatP;KdSpZ',
             VarArrayOf([dRepMes,nKdSps,nKdObj,nKdKatP,nKdSpZ]), []) then begin
      Append;
      cdsOks3RepMes.AsDateTime := dRepMes;
      cdsOks3RMes.AsDateTime   := dRMes;
      cdsOks3ZaMG.AsDateTime   := dZaMG;
      cdsOks3KdSps.AsInteger   := nKdSps;
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
procedure TFormRs2.CreOpenCdsOks2(dRMes : TDateTime);
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
    SQL.Add('Select ZaMesGod, DtProc, VidN, ShVidN, KdSps, KdObj, KdKatP, ' +
            ' Prr, Sp_PF, SPdn, SPrf, SWSb, KdSpZ, SchBU, Sum(OldSm) SmOld, ' +
            ' Sum(Summa) SmNew, Sum(Summa-OldSm) SmDelta, MyNotes from ' +
            tblNu.TableName + ' where (VidN < "6000") or ' +
            ' (VidN >= "8681" and VidN <= "8691") ' +
            ' group by ZaMesGod, DtProc, VidN, ShVidN, KdSps, KdObj, ' +
            ' KdKatP, PRR, Sp_PF, SPdn, SPrf, SWSb, KdSpZ, SchBU, MyNotes');
    Open;
    while not Eof do begin
      AddRecInCdsOks2(dRMes);
      Next;
    end;
    if bFlagDbg then
      cdsOks2.SaveToFile(cDirTemp + 'Oks2.cds');
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.AddRecInCdsOks2(dRMes : TDateTime);
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
procedure TFormRs2.GetAnyValues(dRepMes : TDateTime; var nPrcECmn, nPrcEPps,
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
procedure TFormRs2.sBtnOks2FilterClick(Sender: TObject);
begin
  SetOks2Filter;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.SetOks2Filter;
var cFilter : ShortString;
begin
  cFilter := 'SmNew <> 0';
  cdsOks2.Filter := cFilter;
  cdsOks2.Filtered := sBtnOks2Filter.Down;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnPredSaveClick(Sender: TObject);
begin
  PredSaveResults(n_TN, d_DtCtrl);
  Application.ProcessMessages;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.PredSaveResults(nTabN : integer; dRMes : TDateTime);
var mOtklZaMG, mZaMgForSpecPS : TStringList;
    dZaMG, dDt_Beg, dDt_End : TDateTime;
    i, n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ,
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
                     nTabN, n_KdSps, n_KdObj, n_KdKatP, n_KdSpZ, nPdn, nPrPv,
                     nPRR, nKto, nPrKr, nSpec_NR,
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
procedure TFormRs2.AddRecInCdsZ_Nu(dRMes, dZaMG, dDt_Beg,
            dDt_End: TDateTime; nChas, nSumma: double; nTabN, n_KdSps, n_KdObj,
           n_KdKatP, n_KdSpZ, nPdn, nPrPv, nPRR, nKto, nPrKr, nSpec_NR: integer;
                           cVidN, cNotes, cMyNotes, cDtVdPV, cNrVdPV, cOznPilg,
                                                           cKdBnk: ShortString);
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
procedure TFormRs2.cdsZ_NUCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  if bFlagDbg then
    cdsZ_NuShVidN.AsString := DmMain.VidN2ShVidN(cdsZ_NuVidN.AsString,
                                                                     cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormRs2.dbgrZ_NUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : string4;
begin
  cVidN := cdsZ_NuVidN.AsString;
  with dbgrZ_Nu.Canvas do begin
    if not (gdFocused in State) then begin
      if cdsZ_NuKdSps.AsInteger <> nKdSps then
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
procedure TFormRs2.GetSmsDoMinZp(var nSmXxDoMinZp,
                           nSmCmnFor, nSmPpsFor, nSmBlnFor, nSmDkrFor,
                           nNwSmCmnF, nNwSmPpsF, nNwSmBlnF, nNwSmDkrF : double);
var cVidN : ShortString; nSmm, n_Smm : double; nKdKatP : SmallInt;
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
      cVidN   := tblNuVidN.AsString;
      nKdKatP := tblNuKdKatP.AsInteger;
      nSmm    := tblNuSumma.AsFloat;
      n_Smm   := tblNuSumma.AsFloat;
//      n_Smm   := tblNuD__Smm.AsFloat;
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
      Next;
    end;
    nSmXxDoMinZp := nSmCmnFor + nSmPpsFor + nSmBlnFor + nSmDkrFor;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.sBtnOtklNuToExcelClick(Sender: TObject);
begin
  FormZpMain.mMnuOtkl_NuToExcel.Click;
end;
//------------------------------------------------------------------------------
procedure TFormRs2.popNuPrtTableClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString; dDtPerioda : TDateTime;
begin
  nTabN := n_TN;
  dDtPerioda := tblPeriodu.FieldByName('ZaMesGod').AsDateTime;
  cFamIO := c_FamIO;
  F6PrtDbgNu(nTabN, cFamIO, dDtProc, tblNU);
end;
//------------------------------------------------------------------------------
procedure TFormRs2.popPrtCdsZNUClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString; dDtPerioda : TDateTime;
begin
  nTabN := n_TN;
  dDtPerioda := tblPeriodu.FieldByName('ZaMesGod').AsDateTime;
  cFamIO := c_FamIO;
  F6PrtDbgCdsZ_NU(nTabN, cFamIO, dDtProc, cdsZ_NU);
end;

end.
