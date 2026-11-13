unit Z_Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids,
  Math, DBGrids, Db, DBTables, Menus, Mask, DBCtrls, DBClient, Provider,
  Variants, ShellApi, MConnect, SConnect, SqlTimSt, ImgList,
  ActnList, ZpDbGrid, SalaryConst;

type
  String4 = string[4];
  String15 = string[15];
  PTreeRec = ^TTreeRec;
  TTreeRec = record
    KdObj    : SmallInt;
    ShObj    : String15;
    NmObj    : string;
    LnkKdSch : SmallInt;
  end;

  TEmplInfo = record
    BankId: SmallInt;
    AccId: ShortString;
    Salary: Double;
  end;

  TFormZpMain = class(TForm)
    PanelTools: TPanel;
    PanelMY: TPanel;
    sBtnYMinus: TSpeedButton;
    sBtnMMinus: TSpeedButton;
    sBtnMPlus: TSpeedButton;
    sBtnYPlus: TSpeedButton;
    StaticMnthYear: TStaticText;
    StatusBar: TStatusBar;
    popSps: TPopupMenu;
    popSpsHead: TMenuItem;
    popSpsSep1: TMenuItem;
    popSpsSep2: TMenuItem;
    popSpsDel: TMenuItem;
    popSpsRaschetCurrent: TMenuItem;
    popSpsRaschetPotokom: TMenuItem;
    popSpsRaschetPotokomCurObj: TMenuItem;
    popSpsRaschetPotokomAllSps: TMenuItem;
    popSpsAddFromUpi: TMenuItem;
    popNu: TPopupMenu;
    popOtklNuHead: TMenuItem;
    PanelRight: TPanel;
    PageControl: TPageControl;
    tsPere: TTabSheet;
    dbgrPere: TZpDbGrid;
    tsNadb: TTabSheet;
    dbgrNadb: TZpDbGrid;
    tsUderg: TTabSheet;
    dbgrUdrg: TZpDbGrid;
    qryTmp: TQuery;
    tsOtkl: TTabSheet;
    dbgrOtkl: TZpDbGrid;
    PopNuPrintEmplCalc: TMenuItem;
    popNuRaschet: TMenuItem;
    dbgrNU: TZpDbGrid;
    splitNu: TSplitter;
    popMnu: TPopupMenu;
    popMnuHead: TMenuItem;
    popMnuEdt: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuDel: TMenuItem;
    mMnuZp: TMainMenu;
    mMnuZpFile: TMenuItem;
    mMnuZpExit: TMenuItem;
    mMnuZpDics: TMenuItem;
    mMnuZpSBU: TMenuItem;
    mMnuZpKatPers: TMenuItem;
    mMnuZpSysOpl: TMenuItem;
    mMnuZpShPdN: TMenuItem;
    mMnuZpEDays: TMenuItem;
    PanelLeft: TPanel;
    splitObjSps: TSplitter;
    QrySps: TQuery;
    DsrcSps: TDataSource;
    QrySpsNR: TIntegerField;
    QrySpsDTPROC: TDateTimeField;
    QrySpsTabN: TIntegerField;
    QrySpsKDOBJ: TSmallintField;
    QrySpsKDKATP: TSmallintField;
    QrySpsNOTES: TStringField;
    QrySpsFam: TStringField;
    QrySpsIma: TStringField;
    QrySpsOtch: TStringField;
    QrySpsFamIO: TStringField;
    mMnuZpUPI: TMenuItem;
    mMnuZpRkvzt: TMenuItem;
    QrySpsId: TStringField;
    QrySpsPOL: TStringField;
    QrySpsKDSPS: TSmallintField;
    mMnuZpSets: TMenuItem;
    mMnuZpHints: TMenuItem;
    mMnuZpView: TMenuItem;
    mMnuZpViewExcel: TMenuItem;
    mMnuZpViewF6: TMenuItem;
    mMnuZpPrt: TMenuItem;
    mMnuZpPrtRLst: TMenuItem;
    MnuPrtEmplCalcExcl: TMenuItem;
    MnuPrtDeptCalcExcl: TMenuItem;
    MnuPrtEntprCalcExcl: TMenuItem;
    NSepPrint1: TMenuItem;
    mMnuZpPrtSvdByVidN: TMenuItem;
    mMnuZpPrtSvdMO: TMenuItem;
    mMnuZpPrtSvdByKatPers: TMenuItem;
    mMnuZpPrtSvd: TMenuItem;
    mMnuZpPrtSprKred: TMenuItem;
    mMnuZpPrtSpr: TMenuItem;
    mMnuZpPrtSprDohod: TMenuItem;
    mMnuZpPrtSprNlg: TMenuItem;
    mMnuZpPrtOther: TMenuItem;
    mMnuVedAlim: TMenuItem;
    mMnuZpPrtOtherVedProf: TMenuItem;
    popOtkl: TPopupMenu;
    popOtklHead: TMenuItem;
    popOtklEdt: TMenuItem;
    popOtklAdd: TMenuItem;
    popOtklAddBln: TMenuItem;
    popOtklAddOtp: TMenuItem;
    popOtklAddCmn: TMenuItem;
    popOtklDel: TMenuItem;
    popOtklPrtRList: TMenuItem;
    mMnuZpKoefOtp: TMenuItem;
    mMnuZpDop: TMenuItem;
    mMnuZpOtpuska: TMenuItem;
    mMnuZpBolnichnue: TMenuItem;
    mMnuZpBanki: TMenuItem;
    mMnuZpBankiLS: TMenuItem;
    tblSvSpsPlace: TTable;
    popNuSep1: TMenuItem;
    popNuSortByVid: TMenuItem;
    popNuSortByMes: TMenuItem;
    popMY: TPopupMenu;
    popMyWorkMY: TMenuItem;
    popMyChangeMY: TMenuItem;
    popNuVidSumm: TMenuItem;
    popNuVidSummOne: TMenuItem;
    popNuVidSummTwo: TMenuItem;
    mMnuZpMyDbgDelTmpFiles: TMenuItem;
    popNuSort: TMenuItem;
    popMnuSep1: TMenuItem;
    popMnuSetNdbView: TMenuItem;
    PopShowNdbActual: TMenuItem;
    sBtnCalendar: TSpeedButton;
    mMnuZpNapominalka: TMenuItem;
    mMnuZpDolgnosti: TMenuItem;
    popNuPastMonths: TMenuItem;
    mMnuMassa: TMenuItem;
    mMnuMassPere: TMenuItem;
    mmZpTreeObj: TMenuItem;
    mMnuZpTreeVids: TMenuItem;
    qryObj: TQuery;
    qryObjNR: TIntegerField;
    qryObjKDOBJ: TSmallintField;
    qryObjSHOBJ: TStringField;
    qryObjNMOBJ: TStringField;
    qryObjAINDX: TSmallintField;
    qryObjPINDX: TSmallintField;
    qryObjLVL: TSmallintField;
    qryObjINDX: TSmallintField;
    qryObjHSCH: TStringField;
    dsrcObj: TDataSource;
    updObj: TUpdateSQL;
    popTvObj: TPopupMenu;
    popTvObjFullExpand: TMenuItem;
    popTvObjFullCollapse: TMenuItem;
    popMnuSortPere: TMenuItem;
    PopSortPereAscend: TMenuItem;
    PopSortPereDescend: TMenuItem;
    popTvObjVidTV: TMenuItem;
    popTvObjVidAll: TMenuItem;
    popTvObjVidOnly: TMenuItem;
    popTvObjSep1: TMenuItem;
    popMnuVidInfo: TMenuItem;
    popMnuSep2: TMenuItem;
    opOtklSep0: TMenuItem;
    popOtklSep2: TMenuItem;
    tsPrUv: TTabSheet;
    dbgrPrmUv: TZpDbGrid;
    tblTmp: TTable;
    popNuShwSpecVids: TMenuItem;
    mMnuMassVedOtkl: TMenuItem;
    mMnuZpKdSps: TMenuItem;
    mMnuStatBar: TMenuItem;
    mMnuFontOsnTables: TMenuItem;
    mMnuFontNormal: TMenuItem;
    mMnuFontBold: TMenuItem;
    mMnuZpToolPanel: TMenuItem;
    mMnuZpChangeMY: TMenuItem;
    splitLeftRight: TSplitter;
    SaveDialog: TSaveDialog;
    mMnuZpSovm: TMenuItem;
    dbgrNu2: TZpDbGrid;
    qryNu2: TQuery;
    dsrcNu2: TDataSource;
    qryNu2KDSPS: TSmallintField;
    qryNu2ZAMESGOD: TDateTimeField;
    qryNu2VIDN: TStringField;
    qryNu2SHVIDN: TStringField;
    qryNu2SmN: TFloatField;
    qryNu2SmU: TFloatField;
    popNu2: TPopupMenu;
    popNu2Head: TMenuItem;
    popNu2Raschet: TMenuItem;
    PopNu2PrintEmplCalc: TMenuItem;
    popNu2Sep1: TMenuItem;
    popNu2VidSumm: TMenuItem;
    popNu2VidSummOne: TMenuItem;
    popNu2VidSummTwo: TMenuItem;
    popNu2Sort: TMenuItem;
    popNu2SortByVidN: TMenuItem;
    popNu2SortByZaMG: TMenuItem;
    popNu2ShwSpecVids: TMenuItem;
    popNu2Shw: TMenuItem;
    NShwNuDetail: TMenuItem;
    NShwNuCondens: TMenuItem;
    NShwNuDetail2: TMenuItem;
    NShwNuCondens2: TMenuItem;
    popNuShw: TMenuItem;
    PanelMinutku: TPanel;
    LabelMinutkuMG: TLabel;
    Label4: TLabel;
    LabelMinutkuFIO: TLabel;
    QrySpsShKatP: TStringField;
    mMnuPrikPrem: TMenuItem;
    SocZp: TSocketConnection;
    cdsLogCS: TClientDataSet;
    dsrcLogCS: TDataSource;
    mMnuHostCS: TMenuItem;
    popTvObjSchetCurrent: TMenuItem;
    popTvObjSchetAll: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    QrySpsNCH: TStringField;
    updSps: TUpdateSQL;
    ChBoxDbg: TCheckBox;
    mMnuZpPstPsb: TMenuItem;
    qryTmp2: TQuery;
    mMnuAllAlim: TMenuItem;
    mMnuAllAlimAll: TMenuItem;
    mMnuAllAlimBoevue: TMenuItem;
    popOtklVidInfo: TMenuItem;
    popNuSep2: TMenuItem;
    popNuVidInfo: TMenuItem;
    popNu2VidInfo: TMenuItem;
    mMnuFontTables: TMenuItem;
    FontDialog1: TFontDialog;
    mMnuRaznoe: TMenuItem;
    mMnuZpTbUdrg: TMenuItem;
    popSpsPoisk2: TMenuItem;
    popObjPoisk2: TMenuItem;
    popOtklPoisk2: TMenuItem;
    popPoisk2: TMenuItem;
    popNuPoisk2: TMenuItem;
    popNu2Poisk2: TMenuItem;
    PanelTotals: TPanel;
    BtnNuDetail: TSpeedButton;
    BtnNuCondens: TSpeedButton;
    mMnuZpSep1: TMenuItem;
    qryNu2SCHBU: TStringField;
    qryNu2CNT: TIntegerField;
    popNu2RschNewWithDbg: TMenuItem;
    sBtnSortByVidN: TSpeedButton;
    sBtnSortByZaMG: TSpeedButton;
    popNu2PastMonths: TMenuItem;
    popNu2Sep2: TMenuItem;
    qryNu2PSCH: TStringField;
    sBtnShowSpecVids: TSpeedButton;
    popObjFon: TMenuItem;
    ColorDialog1: TColorDialog;
    popSpsSep3: TMenuItem;
    popSpsFon: TMenuItem;
    popTvObjSep2: TMenuItem;
    popMnuFon: TMenuItem;
    popOtklSep3: TMenuItem;
    popOtklFon: TMenuItem;
    popNuSep3: TMenuItem;
    popNuFon: TMenuItem;
    popNu2Sep3: TMenuItem;
    popNu2Fon: TMenuItem;
    popOtklSort: TMenuItem;
    popOtklSortByVidN: TMenuItem;
    popOtklSortByZaMesGod: TMenuItem;
    popSpsSort: TMenuItem;
    popSpsSortByFIO: TMenuItem;
    popSpsSortByTabN: TMenuItem;
    QrySpsLASTDTPRM: TDateTimeField;
    QrySpsLASTDTUVL: TDateTimeField;
    mMnuZpPrtQry: TMenuItem;
    mMnuZpPrtQryByVidN: TMenuItem;
    sBtnUchKart: TSpeedButton;
    LblEmplInfo: TLabel;
    LabelCurMes: TLabel;
    mMnuZpPrtArhivki: TMenuItem;
    popMnuRaschetCurrent: TMenuItem;
    mMnuMassNadb: TMenuItem;
    mMnuZpPrtSprSpov_2: TMenuItem;
    mMnuOldZpK: TMenuItem;
    mMnuPathToZpl: TMenuItem;
    mMnuOldZpK_Pere: TMenuItem;
    NmMnuOldZpK_Sps: TMenuItem;
    popSpsAddInUpiAndSps: TMenuItem;
    popSpsHistory: TMenuItem;
    popSpsHiNU: TMenuItem;
    popSpsHiOtp: TMenuItem;
    popSpsHiBln: TMenuItem;
    popObjGoToObj: TMenuItem;
    popSpsGoToObj: TMenuItem;
    notvisible1: TMenuItem;
    notVisible2: TMenuItem;
    notvisible3: TMenuItem;
    notvisible4: TMenuItem;
    mMnu1df: TMenuItem;
    mMnuRLstTxt: TMenuItem;
    NPrtCalcEmplTxt: TMenuItem;
    NPrtCalcDeptTxt: TMenuItem;
    NPrtCalcEntprTxt: TMenuItem;
    mMnuZpVedV: TMenuItem;
    popSpsMov: TMenuItem;
    mMnuShwLog: TMenuItem;
    popTvObjSep3: TMenuItem;
    popTvObjPrtCntByObj: TMenuItem;
    popTvObjPrt: TMenuItem;
    popTvObjPrtSpsCurObj: TMenuItem;
    mMnuZpPrtOtherSpsCurObj: TMenuItem;
    mMnuCheckVupl: TMenuItem;
    mMnuZpPrtOtherSpsCurMes: TMenuItem;
    mmMyCheckResults: TMenuItem;
    mmMyCheckSvPorogi: TMenuItem;
    mMnuAlim: TMenuItem;
    mMnuVedIspL: TMenuItem;
    QrySpsISEVENT: TStringField;
    QrySpsISWORKDAYS: TStringField;
    QrySpsDT_PRIEM: TDateTimeField;
    QrySpsDT_UVOLN: TDateTimeField;
    LabelPereSort: TLabel;
    mMnuPlOtd: TMenuItem;
    mMnuZpUsersNew: TMenuItem;
    mMnuActiveUsers: TMenuItem;
    PanelTvObj: TPanel;
    LabelTvObj: TLabel;
    LblLockedEmployee: TLabel;
    TvObj: TTreeView;
    dbgrSps: TZpDBGrid;
    mmSetsToBD: TMenuItem;
    mMnuInvNoPens: TMenuItem;
    mMnuPensCM: TMenuItem;
    mMnuPodklOtkl: TMenuItem;
    mMnuTwoRLstTxt: TMenuItem;
    NPrtCalcDept2Copies: TMenuItem;
    NPrtCalcEntpr2Copies: TMenuItem;
    lbxAllowSps: TListBox;
    popSpsVid: TMenuItem;
    popSpsVidAll: TMenuItem;
    popSpsVidActive: TMenuItem;
    mMnuOldZpK_UPI: TMenuItem;
    popSpsInclInKdSps: TMenuItem;
    mMnuOldZpK_NU: TMenuItem;
    mMnuOldZpK_Otkl: TMenuItem;
    mmSpsDela: TMenuItem;
    mmSpsDelaByVids: TMenuItem;
    rBtnIsOsn: TRadioButton;
    mmSpsDelaByOtkl: TMenuItem;
    mmSpsDelaByNadb: TMenuItem;
    BtnLockEmpl: TSpeedButton;
    PanelDbg: TPanel;
    mMnuOldZpK_Nadb: TMenuItem;
    mmAddOtkl: TMenuItem;
    mMnuShwLogTabN: TMenuItem;
    mMnuShwLogAll: TMenuItem;
    popOtklNewRaschet: TMenuItem;
    mMnuAdd8801: TMenuItem;
    mMnuZpOtklByVidN: TMenuItem;
    mmMyCheckNU: TMenuItem;
    mMnuZpCloseMonth: TMenuItem;
    popSpsBlockSchetCurrent: TMenuItem;
    popNuMyCheckNU: TMenuItem;
    popNu2MyCheckNU: TMenuItem;
    popSpsMyCheckNu: TMenuItem;
    popOtklView: TMenuItem;
    mMnuPostPvd: TMenuItem;
    mMnuPostPvdSps: TMenuItem;
    mMnuPostPvdVedom: TMenuItem;
    popOtklStornOtp_2: TMenuItem;
    mMnuZpPrtSprSubs: TMenuItem;
    mmMyNewUkr: TMenuItem;
    mmDoubleSpsTabN: TMenuItem;
    mMnuArhivkiTxt: TMenuItem;
    mmSpsTabs: TMenuItem;
    popTvYourPeoples: TMenuItem;
    qryNu2DT_BEG: TDateTimeField;
    qryNu2DT_END: TDateTimeField;
    qryNu2PDN: TSmallintField;
    qryNu2CHAS: TFloatField;
    mmPrtNich: TMenuItem;
    mmEABnkLS: TMenuItem;
    QrySpsOLDKDOBJ: TSmallintField;
    mmChSps: TMenuItem;
    mmPereraschetPdn: TMenuItem;
    mMnuRestSpsTabN: TMenuItem;
    mMnuIndxNach: TMenuItem;
    sBtnMyDbg: TSpeedButton;
    mmChOtklNU: TMenuItem;
    NuByYears: TMenuItem;
    mmChngBnk: TMenuItem;
    mmTemplates: TMenuItem;
    mMnuZpPrtSvdByKatP: TMenuItem;
    mMnuZpOtpNextMes: TMenuItem;
    mmFzDela: TMenuItem;
    mMnuZpPrtCmbOklCurMes: TMenuItem;
    popOtklAddDekr: TMenuItem;
    mMnuSpovNew: TMenuItem;
    mMnuZpKdLgt: TMenuItem;
    qryNu2SUMMA: TFloatField;
    mMnuArhivkiExcel: TMenuItem;
    mMnuArhivkiExcelObj: TMenuItem;
    mMnuArhivkiExcelAll: TMenuItem;
    mMnuArhivkiTxtObj: TMenuItem;
    mMnuArhivkiTxtAll: TMenuItem;
    mMnuZpTbUd2011: TMenuItem;
    mMnuZpPrtSvdMo2011: TMenuItem;
    mMnuZpPrtInvCurMes: TMenuItem;
    popNuSumBrush: TMenuItem;
    popNu2SumBrush: TMenuItem;
    popNuRs2Dbg: TMenuItem;
    mMnuZpPrtLgtCurMes: TMenuItem;
    mMnuZpPrtFssTvp: TMenuItem;
    mMnuZpPrBln: TMenuItem;
    mmMyOznPilg042011: TMenuItem;
    mMnuAddKomand: TMenuItem;
    popOtklStornNeopl: TMenuItem;
    mMnuZpPidZviln: TMenuItem;
    mmCheckInvState: TMenuItem;
    mMnuVedIspL2: TMenuItem;
    mMnuZpActNdb: TMenuItem;
    mMnuZpTbPrcIndx: TMenuItem;
    popSpsBLS: TMenuItem;
    mMnuZpFixIndx: TMenuItem;
    mmMyFillFixIndx: TMenuItem;
    mMnuIndxNachOld: TMenuItem;
    OpenDialog: TOpenDialog;
    mMnuZpAddBLS: TMenuItem;
    mMnuStatPlOtd: TMenuItem;
    mMnuZpPrtOtp3_6: TMenuItem;
    mMnuZpPrikazuOK: TMenuItem;
    pSep0: TMenuItem;
    popOtklSep1: TMenuItem;
    popNuForMO: TMenuItem;
    mMnuZpCheckMO: TMenuItem;
    mMnuZpPrtSvdMoFin: TMenuItem;
    popTvObjF9: TMenuItem;
    mMnuZpPrtMo: TMenuItem;
    mMnuZpPrtMoGK: TMenuItem;
    mMnuZp1005: TMenuItem;
    popTvObjSchetAllFromCurrent: TMenuItem;
    popSpsAllSpsFromCurrentObj: TMenuItem;
    mmMyCreFixIndx2: TMenuItem;
    SpeedButton1: TSpeedButton;
    mMnuZpPrtSprSubs3: TMenuItem;
    mMnuOtkl_NuToExcel: TMenuItem;
    ActionList: TActionList;
    sBtnF8: TSpeedButton;
    LbxF8: TListBox;
    N1: TMenuItem;
    popNuClearMetki: TMenuItem;
    popNuSumByMetki: TMenuItem;
    popNuAddDelMetka: TMenuItem;
    PanelSelectedTotals: TPanel;
    sBtnPanelNuTotals: TSpeedButton;
    qryObjKDSPZ: TSmallintField;
    mmTreeViev: TMenuItem;
    N2: TMenuItem;
    mmNewShTem: TMenuItem;
    mMnuDk2010: TMenuItem;
    o_Dolgn: TMenuItem;
    mMnuIspSlg: TMenuItem;
    mmRemPere: TMenuItem;
    mMnuZp1006: TMenuItem;
    cdsKTn: TClientDataSet;
    cdsKTnNR: TAutoIncField;
    cdsKTnTabN: TIntegerField;
    popMnuAddPrmPere: TMenuItem;
    N3: TMenuItem;
    NAbout: TMenuItem;
    nSpsRepair: TMenuItem;
    mMnuOthers: TMenuItem;
    PopupEmplInfo: TPopupMenu;
    NEmplId: TMenuItem;
    NEmplName: TMenuItem;
    NEmplSocial: TMenuItem;
    NBank: TMenuItem;
    NBankAcc: TMenuItem;
    NSalary: TMenuItem;
    MiPrintSubsAbroad: TMenuItem;
    MnuDismisThisMnth: TMenuItem;
    PopShowNdbAll: TMenuItem;
    MnuSetCalcMnth: TMenuItem;
    ActSetCalcMnth: TAction;
    PopMnuSep3: TMenuItem;
    NPereIndxExcl: TMenuItem;
    NOtklIndxExcl: TMenuItem;
    NSepIndxExcl: TMenuItem;
    NSepPrint2: TMenuItem;
    NPrintIndxExcl: TMenuItem;
    NIndxExclState: TMenuItem;
    PanelTools2: TPanel;
    LabelBegDMZ: TLabel;
    LblIndxExclState: TLabel;
    BtnExit: TSpeedButton;
    NSep: TMenuItem;
    NRptGrpVidNDeptId: TMenuItem;
    BtnNuShort: TSpeedButton;
    NArhivkiYear: TMenuItem;
    NArhivkiSpan: TMenuItem;
    NArhivkiInvalid: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StaticMnthYearDblClick(Sender: TObject);
    procedure sBtnYMinusClick(Sender: TObject);
    procedure sBtnMMinusClick(Sender: TObject);
    procedure sBtnMPlusClick(Sender: TObject);
    procedure sBtnYPlusClick(Sender: TObject);
    procedure sBtnCloseClick(Sender: TObject);
    procedure popSpsPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgrPereEditButtonClick(Sender: TObject);
    procedure mMnuZpKatPersClick(Sender: TObject);
    procedure mMnuZpSysOplClick(Sender: TObject);
    procedure mMnuZpShPdnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure popNuDelAllClick(Sender: TObject);
    procedure mMnuZpEDaysClick(Sender: TObject);
    procedure popSpsDelClick(Sender: TObject);
    procedure dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popNuPopup(Sender: TObject);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuAddClick(Sender: TObject);
    procedure popSpsRaschetPotokomAllSpsClick(Sender: TObject);
    procedure mMnuZpExitClick(Sender: TObject);
    procedure mMnuZpSBUClick(Sender: TObject);
    procedure popOtklEdtClick(Sender: TObject);
    procedure popOtklAddCmnClick(Sender: TObject);
    procedure popOtklDelClick(Sender: TObject);
    procedure QrySpsCalcFields(DataSet: TDataSet);
    procedure qryObjAfterPost(DataSet: TDataSet);
    procedure qryObjBeforePost(DataSet: TDataSet);
    procedure mMnuZpUPIClick(Sender: TObject);
    procedure mMnuZpRkvztClick(Sender: TObject);
    procedure popCreMesClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure mMnuZpHintsClick(Sender: TObject);
    procedure mMnuZpViewExcelClick(Sender: TObject);
    procedure mMnuZpViewF6Click(Sender: TObject);
    procedure DsrcSpsDataChange(Sender: TObject; Field: TField);
    procedure popOtklAddBlnClick(Sender: TObject);
    procedure popOtklPopup(Sender: TObject);
    procedure popOtklAddOtpClick(Sender: TObject);
    procedure mMnuZpKoefOtpClick(Sender: TObject);
    procedure mMnuZpOtpuskaClick(Sender: TObject);
    procedure mMnuZpBankiClick(Sender: TObject);
    procedure mMnuZpBankiLSClick(Sender: TObject);
    procedure mMnuZpPrtSvdByVidNClick(Sender: TObject);
    procedure mMnuZpPrtSvdMOClick(Sender: TObject);
    procedure mMnuZpPrtSprDohodClick(Sender: TObject);
    procedure mMnuZpPrtSvdByKatPersClick(Sender: TObject);
    procedure mMnuZpPrtSprKredClick(Sender: TObject);
    procedure mMnuZpPrtSprNlgClick(Sender: TObject);
    procedure mMnuVedAlimClick(Sender: TObject);
    procedure mMnuZpPrtOtherVedProfClick(Sender: TObject);
    procedure PanelRightResize(Sender: TObject);
    procedure qryObjBeforeScroll(DataSet: TDataSet);
    procedure qryObjAfterScroll(DataSet: TDataSet);
    procedure mMnuZpBolnichnueClick(Sender: TObject);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ChangePmntsSort(Sender: TObject);
    procedure popMyChangeMYClick(Sender: TObject);
    procedure popMYPopup(Sender: TObject);
    procedure popMyWorkMYClick(Sender: TObject);
    function GetMsgPerehoda(nCase : word) : string;
    procedure CreLbxMesGod;
    procedure popNuVidSummOneClick(Sender: TObject);
    procedure popNuVidSummTwoClick(Sender: TObject);
    procedure mMnuZpMyDbgDelTmpFilesClick(Sender: TObject);
    procedure PopNdbShowModeClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure popSpsAddFromUpiClick(Sender: TObject);
    procedure ChBoxDbgClick(Sender: TObject);
    procedure qryObjAfterDelete(DataSet: TDataSet);
    procedure sBtnCalendarClick(Sender: TObject);
    procedure mMnuZpNapominalkaClick(Sender: TObject);
    procedure mMnuZpDolgnostiClick(Sender: TObject);
    procedure mmZpTreeObjClick(Sender: TObject);
    procedure mMnuZpTreeVidsClick(Sender: TObject);
    procedure TvObjChange(Sender: TObject; Node: TTreeNode);
    procedure popTvObjPopup(Sender: TObject);
    procedure PopSortPereClick(Sender: TObject);
    procedure dsrcObjDataChange(Sender: TObject; Field: TField);
    procedure popTvObjVidAllClick(Sender: TObject);
    procedure popTvObjVidOnlyClick(Sender: TObject);
    procedure dbgrNadbDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popMnuVidInfoClick(Sender: TObject);
    procedure popTvObjFullExpandClick(Sender: TObject);
    procedure popTvObjFullCollapseClick(Sender: TObject);
    procedure dbgrPereDblClick(Sender: TObject);
    procedure dbgrNadbDblClick(Sender: TObject);
    procedure PageControlResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure popSpsRaschetPotokomCurObjClick(Sender: TObject);
    procedure popNuShwSpecVidsClick(Sender: TObject);
    procedure dbgrPrmUvDblClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure TvObjEnter(Sender: TObject);
    procedure TvObjExit(Sender: TObject);
    procedure mMnuMassVedOtklClick(Sender: TObject);
    procedure mMnuZpMyNewVidsClick(Sender: TObject);
    procedure dbgrPereDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    function MyFileExists(cDirNm, cFileNm : string) : boolean;
    procedure mMnuZpKdSpsClick(Sender: TObject);
    procedure dbgrUdrgDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mMnuStatBarClick(Sender: TObject);
    procedure mMnuFontNormalClick(Sender: TObject);
    procedure mMnuFontBoldClick(Sender: TObject);
    procedure mMnuZpToolPanelClick(Sender: TObject);
    function MyTVLocateKdObj(nKdObj : integer) : boolean;
    procedure popSpsHiNUClick(Sender: TObject);
    procedure mMnuZpSovmClick(Sender: TObject);
    procedure qryNu2CalcFields(DataSet: TDataSet);
    procedure dbgrNu2DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popNu2VidSummOneClick(Sender: TObject);
    procedure popNu2VidSummTwoClick(Sender: TObject);
    procedure ChngNuModeClick(Sender: TObject);
    procedure OnOffPanelMinutku(bOnOff : boolean; nM, nY : word);
    procedure mMnuHostCSClick(Sender: TObject);
    procedure dbgrUdrgDblClick(Sender: TObject);
    procedure mMnuNewPeregonuClick(Sender: TObject);
    procedure dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mMnuZpPstPsbClick(Sender: TObject);
    procedure mMnuAllAlimClick(Sender: TObject);
    procedure mMnuAllAlimBoevueClick(Sender: TObject);
    procedure popOtklVidInfoClick(Sender: TObject);
    procedure popNuVidInfoClick(Sender: TObject);
    procedure popNu2VidInfoClick(Sender: TObject);
    procedure mMnuFontTablesClick(Sender: TObject);
    procedure FontDialog1Apply(Sender: TObject; Wnd: HWND);
    procedure mMnuNU106Click(Sender: TObject);
    procedure mMnuZpTbUdrgClick(Sender: TObject);
    procedure popSpsPoisk2Click(Sender: TObject);
    procedure popNu2Popup(Sender: TObject);
    procedure mMnuMassPereClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure popObjFonClick(Sender: TObject);
    procedure popSpsFonClick(Sender: TObject);
    procedure popMnuFonClick(Sender: TObject);
    procedure popOtklFonClick(Sender: TObject);
    procedure popNuFonClick(Sender: TObject);
    procedure popNu2FonClick(Sender: TObject);
    procedure popOtklSortByVidNClick(Sender: TObject);
    procedure popOtklSortByZaMesGodClick(Sender: TObject);
    procedure popSpsSortByFIOClick(Sender: TObject);
    procedure popSpsSortByTabNClick(Sender: TObject);
    procedure mMnuZpFillVBlnClick(Sender: TObject);
    procedure mMnuZpPrtQryByVidNClick(Sender: TObject);
    procedure sBtnUchKartClick(Sender: TObject);
    procedure SetShowUchKart;
    procedure mMnuZpPrtArhivkiClick(Sender: TObject);
    procedure mMnuMassNadbClick(Sender: TObject);
    procedure mMnuZpPrtSprSpov_2Click(Sender: TObject);
    procedure mMnuPathToZplClick(Sender: TObject);
    procedure mMnuOldZpK_PereClick(Sender: TObject);
    procedure NmMnuOldZpK_SpsClick(Sender: TObject);
    procedure popSpsAddInUpiAndSpsClick(Sender: TObject);
    procedure popSpsHiBlnClick(Sender: TObject);
    procedure popSpsHiOtpClick(Sender: TObject);
    procedure LabelTvObjDblClick(Sender: TObject);
//    procedure mMnuZpPrtRLst2CurTabNClick(Sender: TObject);
    procedure mMnu1dfClick(Sender: TObject);
    procedure mMnuZpVedVClick(Sender: TObject);
    procedure popSpsMovClick(Sender: TObject);
    procedure mMnuShwLogClick(Sender: TObject);
    procedure popTvObjPrtCntByObjClick(Sender: TObject);
    procedure popTvObjPrtSpsCurObjClick(Sender: TObject);
    procedure mMnuCheckVuplClick(Sender: TObject);
    procedure mMnuZpPrtOtherSpsCurMesClick(Sender: TObject);
    procedure mmMyCheckSvPorogiClick(Sender: TObject);
    procedure mMnuVedIspLClick(Sender: TObject);
    procedure mMnuPlOtdClick(Sender: TObject);
    procedure mMnuZpUsersNewClick(Sender: TObject);
    procedure mMnuActiveUsersClick(Sender: TObject);
    procedure LblLockedEmployeeDblClick(Sender: TObject);
    procedure mMnuSpovClick(Sender: TObject);
    procedure mmSetsToBDClick(Sender: TObject);
    procedure mMnuInvNoPensClick(Sender: TObject);
    procedure mMnuPensCMClick(Sender: TObject);
    procedure mMnuPodklOtklClick(Sender: TObject);
    procedure popSpsVidAllClick(Sender: TObject);
    procedure popSpsVidActiveClick(Sender: TObject);
    procedure mMnuOldZpK_UPIClick(Sender: TObject);
    procedure popSpsInclInKdSpsClick(Sender: TObject);
    procedure mMnuOldZpK_NUClick(Sender: TObject);
    procedure mMnuOldZpK_OtklClick(Sender: TObject);
    procedure mmSpsDelaByVidsClick(Sender: TObject);
    procedure mmSpsDelaByOtklClick(Sender: TObject);
    procedure mmSpsDelaByNadbClick(Sender: TObject);
    procedure BtnLockEmplClick(Sender: TObject);
    procedure mMnuOldZpK_NadbClick(Sender: TObject);
    procedure mmAddOtklClick(Sender: TObject);
    procedure mMnuShwLogTabNClick(Sender: TObject);
    procedure popOtklNewRaschetClick(Sender: TObject);
    procedure mMnuAdd8801Click(Sender: TObject);
    procedure mMnuZpOtklByVidNClick(Sender: TObject);
    procedure mmMyCheckNUClick(Sender: TObject);
    procedure mMnuZpCloseMonthClick(Sender: TObject);
    procedure popMnuRaschetCurrentClick(Sender: TObject);
    procedure popSpsBlockSchetCurrentClick(Sender: TObject);
    procedure QrySpsBeforeScroll(DataSet: TDataSet);
    procedure popOtklViewClick(Sender: TObject);
    procedure mMnuPostPvdSpsClick(Sender: TObject);
    procedure mMnuPostPvdVedomClick(Sender: TObject);
    procedure popOtklStornOtp_2Click(Sender: TObject);
    procedure mMnuZpPrtSprSubsClick(Sender: TObject);
    procedure mmMyNewUkrClick(Sender: TObject);
    procedure mmDoubleSpsTabNClick(Sender: TObject);
    procedure mMnuArhivkiTxtAllClick(Sender: TObject);
    procedure mmSpsTabsClick(Sender: TObject);
    procedure popTvYourPeoplesClick(Sender: TObject);
    procedure mMnuZpPrtSpr_1Click(Sender: TObject);
    procedure mmEABnkLSClick(Sender: TObject);
    procedure mmChSpsClick(Sender: TObject);
    procedure mMnuZpPrtRLstMeasureItem(Sender: TObject; ACanvas: TCanvas;
                                                   var Width, Height: Integer);
    procedure mMnuZpPrtNichVedClick(Sender: TObject);
    procedure mmPereraschetPdnClick(Sender: TObject);
    procedure mMnuRestSpsTabNClick(Sender: TObject);
    procedure mMnuIndxNachClick(Sender: TObject);
    procedure sBtnMyDbgClick(Sender: TObject);
    procedure mmChOtklNUClick(Sender: TObject);
    procedure rBtnIsOsnClick(Sender: TObject);
    procedure NuByYearsClick(Sender: TObject);
    procedure mmChngBnkClick(Sender: TObject);
    procedure mmTemplatesClick(Sender: TObject);
    procedure mMnuZpPrtSvdByKatPClick(Sender: TObject);
    procedure mMnuZpOtpNextMesClick(Sender: TObject);
    procedure mMnuZpPrtCmbOklCurMesClick(Sender: TObject);
    procedure popOtklAddDekrClick(Sender: TObject);
    procedure mMnuSpovNewClick(Sender: TObject);
    procedure mMnuZpKdLgtClick(Sender: TObject);
    procedure mMnuArhivkiExcelObjClick(Sender: TObject);
    procedure mMnuArhivkiExcelAllClick(Sender: TObject);
    procedure mMnuArhivkiTxtObjClick(Sender: TObject);
    procedure mMnuZpTbUd2011Click(Sender: TObject);
    procedure mMnuZpPrtSvdMo2011Click(Sender: TObject);
    procedure mMnuZpPrtClick(Sender: TObject);
    procedure PanelTotalsDblClick(Sender: TObject);
    procedure mMnuZpPrtInvCurMesClick(Sender: TObject);
    procedure popNuSumBrushClick(Sender: TObject);
    procedure popNu2SumBrushClick(Sender: TObject);
    procedure RaschDbgClick(Sender: TObject);
    procedure mMnuZpPrtLgtCurMesClick(Sender: TObject);
    procedure mMnuZpPrtFssTvpClick(Sender: TObject);
    procedure mMnuZpPrBlnClick(Sender: TObject);
    procedure mmMyOznPilg042011Click(Sender: TObject);
    procedure mMnuAddKomandClick(Sender: TObject);
    procedure popOtklStornNeoplClick(Sender: TObject);
    procedure mMnuZpPidZvilnClick(Sender: TObject);
    procedure mmCheckInvStateClick(Sender: TObject);
    procedure mMnuVedIspL2Click(Sender: TObject);
    procedure mMnuZpActNdbClick(Sender: TObject);
    procedure mMnuZpTbPrcIndxClick(Sender: TObject);
    procedure popSpsBLSClick(Sender: TObject);
    procedure mMnuZpFixIndxClick(Sender: TObject);
    procedure mmMyFillFixIndxClick(Sender: TObject);
    procedure mMnuIndxNachOldClick(Sender: TObject);
    procedure mMnuZpAddBLSClick(Sender: TObject);
    procedure dbgrPereKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure mMnuStatPlOtdClick(Sender: TObject);
    procedure mMnuZpDopClick(Sender: TObject);
    procedure mMnuZpPrtOtp3_6Click(Sender: TObject);
    procedure mMnuZpPrikazuOKClick(Sender: TObject);
    procedure popNuForMOClick(Sender: TObject);
    procedure mMnuZpCheckMOClick(Sender: TObject);
    procedure mMnuZpPrtSvdMoFinClick(Sender: TObject);
    procedure popTvObjF9Click(Sender: TObject);
    procedure mMnuZpPrtMoGKClick(Sender: TObject);
    procedure mMnuZp1005Click(Sender: TObject);
    procedure mMnuMassaClick(Sender: TObject);
    procedure popSpsAllSpslFromCurrentObjClick(Sender: TObject);
    procedure mmMyCreFixIndx2Click(Sender: TObject);
    procedure mMnuZpPrtSprSubs3Click(Sender: TObject);
    procedure mMnuOtkl_NuToExcelClick(Sender: TObject);
    procedure sBtnF8Click(Sender: TObject);
    procedure dbgrNUDblClick(Sender: TObject);
    procedure popNuClearMetkiClick(Sender: TObject);
    procedure dbgrNUKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sBtnPanelNuTotalsClick(Sender: TObject);
    procedure popNuSumByMetkiClick(Sender: TObject);
    procedure mmTreeVievClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure mmNewShTemClick(Sender: TObject);
    procedure mMnuZpPrtNichTm_1Click(Sender: TObject);
    procedure mMnuZpPrtNichTm_2Click(Sender: TObject);
    procedure mMnuDk2010Click(Sender: TObject);
    procedure o_DolgnClick(Sender: TObject);
    procedure mMnuIspSlgClick(Sender: TObject);
    procedure mmRemPereClick(Sender: TObject);
    procedure mMnuZp1006Click(Sender: TObject);
    procedure LabelBegDMZDblClick(Sender: TObject);
    procedure popMnuAddPrmPereClick(Sender: TObject);
    procedure NAboutClick(Sender: TObject);
    procedure nSpsRepairClick(Sender: TObject);
    procedure mMnuOthersClick(Sender: TObject);
    procedure NMnuEmpInfoClick(Sender: TObject);
    procedure MiPrintSubsAbroadClick(Sender: TObject);
    procedure MnuDismisThisMnthClick(Sender: TObject);
    procedure PrintEmplCalc(Sender: TObject);
    procedure PrintDeptCalc(Sender: TObject);
    procedure PrintEntprCalc(Sender: TObject);
    procedure ActSetCalcMnthExecute(Sender: TObject);
    procedure ActSetCalcMnthUpdate(Sender: TObject);
    procedure NUpdIndxExclClick(Sender: TObject);
    procedure NPrintIndxExclClick(Sender: TObject);
    procedure NIndxExclStateClick(Sender: TObject);
    procedure NRptGrpVidNDeptIdClick(Sender: TObject);
    procedure NArhivkiSpanClick(Sender: TObject);
    procedure NArhivkiInvalidClick(Sender: TObject);
  private
    bTreeObjChanged : boolean;//Чтобы разделить перемещение по древу и по qryObj
    b_SchetPotokom : boolean;
    bNetSchetPotokom : boolean;

    LockedEmplId: Integer;        // Таб№, который нужно помнить при включённом
    LockedEmplName: ShortString;  // режиме сохранения.

    MasterDebug: Boolean;
    NuShowMode: TNuShowMode;

    function CurMnthListExists: Boolean;

    procedure SetSortPereAscend(Value: Boolean);
    procedure SetNadbShowModeAll(Value: Boolean);

    procedure LoadEmplInfoSetts;
    procedure SaveEmplInfoSetts;

    function GetEmplDeptId(EmplId: Integer; DtProc: TDateTime): SmallInt;
    procedure SetNow;
    procedure SetPanelMinutkuPlace;
    procedure CreTvObj_FromTable(nKdUsr, nKdSpsUsr : SmallInt);
    procedure CreTvObjItems;
    procedure OpenQrySps(nKdSpsUsr : SmallInt);
    procedure OpenEmplQueries(EmplId: Integer; DtProc: TDateTime);
    procedure OpenQryUdrg;
    procedure OpenQryOtkl;
    procedure OpenQryNu2;
    procedure SetMainMnu;
    procedure SetShowNuMode(NuShowMode: TNuShowMode);  // Выбор таблицы NU (детально или свернуто)
    procedure SetDbgrPereColumns;
    procedure SetDbgrNadbColumns;
    procedure SetDbgrUdrgColumns;
    procedure SetDbgrOtklColumns;
    procedure SetDbgrNUColumns;
    procedure SetDbgrNu2Columns;
    procedure SetRMes;
    procedure CheckTblSvSpsPlace;
    procedure SaveSpsPosition(KdObj: integer);
    procedure RestSpsPosition(KdObj: integer);
    function NewKdObj : integer;
    procedure DelTmpFiles;
    procedure CheckSpisokMes(dDtPrc :TDateTime; nPrcY, nPrcM : word);
    procedure ShowCreSpsRunning;
    function CreSpsConfirmed(nPrcY, nPrcM: word): boolean;
    procedure AddNewInSps(dDtProc : TDateTime;
                        nNewTabN, nKdObj, nKdKatP : integer; nKdSps : SmallInt);
    procedure SetFlagDbg;
    procedure SetNapominalka;
//    procedure ReopenQuyeries;
    procedure SetStatBar;
    procedure SetFormFont;
    procedure SetShowPanelTools;
    procedure DisplayProcMnthInfo;
    procedure DisplayProcMnthCaption;
    procedure QrySpsRefresh(nTabN : integer);
    procedure SetTabsFont;
    procedure WritePrmUvInUpi(nTabN : integer);
    procedure MovTabN2Obj(dDtPrc : TDateTime;
                             nTabN, nPredKdObj, nNewKdObj, nOsnKdObj : integer);
    function IsUsrSpecBySps(nKdUsr : SmallInt) : boolean;
    procedure LockEmployee(Value: Boolean);
    procedure FindLockedEmplId;
    procedure SetMnuZpCloseMonth;
    function MonthClosed(nTabn : integer) : boolean;
    procedure AddNdb;
    procedure EdtNdb;
    procedure AddPere;
    procedure EdtPere;
    procedure UpdKmdRecord(nKmdKdRsh : SmallInt; nSpecNR : integer);
    procedure UpdPredSps(cFldNrPkt : ShortString; nNrPkt, nSpecPS : integer);
    procedure ShwSelRecNuTotals;
    procedure DeleteVOtp(nTabN, nSpecNR: integer);

    procedure CallNewEmplSrch;
    procedure CallOldEmplSrch;

    procedure DisplayEmplAttr(EmplId: Integer);
    procedure RefreshEmplInfoLabel(EmplInfo: TEmplInfo; ForceBlank: Boolean);
    procedure RefreshIndxExclState;
    function GetEmplInfo(EmplId: Integer): TEmplInfo;

    procedure ChangeProcMnth(NewProcDate: TDateTime);
    procedure LocateEmployeeInMnth(EmplId, DeptId: integer; Mnth: TDateTime);

    procedure InitShowNuMode(IniFile: TIniFile);

    procedure DisplayEmplInfo;
    procedure RefreshNuTotals;

  public
    dDtLastCopySbu : TDateTime;
    bStopSchet : boolean;
    cFontName : string;
    nFontSize : word;
    bFontBold, bFontItalic : boolean;
    mTvObjColor, mDbgrSpsColor, mDbgrNuColor, mDbgrNu2Color, mDbgrOtklColor,
    mDbgrPrmUvColor, mDbgrPereColor, mDbgrNadbColor, mDbgrUdrgColor : TColor;
    procedure ZplDisplayHint(Sender: TObject);
    function MyGetDirData(cAliasName : string) : string;
    procedure RefreshSps;
  end;

procedure RunZp;

const SECTION = 'Z_Main';

var
  FormZpMain: TFormZpMain;
  bFormMainReady : boolean;
  bSprashival : boolean;
  bIsFormDfMain : boolean;
  bIsFormDfPromResults : boolean;
  bIsFormChkNuZaMG : boolean;
  bIsFormCheckNu   : boolean;
  bEndTvObjUpdated : boolean;
  bIsFormCalendar : boolean;
  bIsFormMyCalendar : boolean;
  bIsFormRemPere: boolean;
  bIsFormShwLog, bIsFormShwLogByTabN : boolean;
  bIsFormCheckPrp : boolean;
  bIsFormChkSps : boolean;
  bIsFormPsPdn  : boolean;
  bIsFormShwPrOk : boolean;
  bIsFormZpl2Gk : boolean;
  bIsFormCreFIndx2 : boolean;
  bIndSchet : boolean;
  bVvodIzZpZ : boolean; // для случая подключения из старой зарплаты
  nMesBegRabotu, nGodBegRabotu : word;  // устанавливаются в начале
  nDayPerehoda : word;                  // работы с программой.

  bIsSpsWrkMes : boolean;
  nCtrlGod, nCtrlMes : word;  // Зависят только от системной даты и
  dCtrlDate : TDateTime;      // nDayPerehoda (дня перехода).
                              // Всегда первое и последнее числа РАБОЧЕГО месяца
  nProcY, nProcM : word;      // Месяц и Год, устанавливаемые с панели PanelMY.
  dDtLastProcMes : TDateTime; // последнее число месяца от nProcY и nProcM

  nCurBudget : double;        // бюджет месяца и к-во общих и рабочих дней
  nCurCntDay, nCurCntWorkDay : integer; // (меняются вместе с nProcY и nProcM)
  bFlagOPI : boolean;
  cFirma, cDirDolgn, cDirFIO,
  cGlBuhDolgn, cGlBuhFIO, cBuhDolgn, cBuhFIO : string;
  gl_nKdSps : SmallInt;
  cZpHostNm : string;
  g_bNewSchet : boolean;   // установим в TRUE, когда будем готовы
                         // перейти на новую схему расчета (с автопересчетом)
  nUpiUpdNR : integer;   // призвана следить за последними изменениями в Z_UPI
  dDt01012008 : TDateTime; // Дата начала работы по новой схеме списков
  dDt01012011 : TDateTime; // с 01-01-2011 Ушли ПФ,ФЗ,СсТВП,СсНВ. Появился ЕСВ
  d_0217      : TDateTime;
  cNmPredprLoc,cAdresLoc :ShortString;

implementation

uses A_Const, a_GtGdMs, A_Lib, A_DM, Z_DM, A_SBU, a_ShKSps, a_Usrs2, z_About,
     z_MyStop, Z_Rkvzt, z_TUpi, z_eUpiA, Z_UpiLS, z_BnkLS, z_MsLS, Z_EPrmUv,
     Z_EPere, Z_ENadb, Z_EUdrg, z_EOtkl, Z_EBln, Z_EDkr,
     Z_KfOtp, Z_EOtp, z_EOtpSt, Z_EDays, Z_GtOpl, Z_GtPdn, Z_GtPers,
     Z_TbUdrg, Z_Tb2011, Z_CmnPrt, Z_VvTn, Z_VvFm, Z_CreSps, Z_ShOtp, Z_ShBln,
     Z_ShwBnk, Z_VvObj, z_Rs5, Z_VbRMes, Z_GtMes, z_MsgDlg,
     Z_Calend, z_KdDlgn, z_TObj, z_TVids, z_VdPV, z_NuPM, z_GtSovm, z_PrtAlm,
     z_VdIspL, z_PrtPrf, z_SvdSPZ, z_PstPsb, z_ShAlm, z_VbDrZd, z_VvFmTn,
     z_SSpov2, z_DlSDhd, z_VedV, z_ShPere, Z_SvKatP, z_ZprVN, z_mo52,
     z_Mo2011, z_moFin, z_Subs3,
     z_ShNadb, z_SArhiv, z_OldPeK, z_OldSpK, z_HiBln,  z_HiOtp, z_GtObj,
     z_ShEndV, z_ShwLog, z_ShCrOb, z_ChkPrp, z_RPlOtd, a_WrkUsr, z_DfMain,
     z_DfZplR, z_InvPns, z_Pens, z_OtklDp, z_104Upi, z_104nu,
     z_104otk, z_104Ndb, z_InSps, z_SpsTts, z_SpsOtk, z_SpsNdb, z_DpOtkl,
     z_8801, z_ChkMG, z_CmDlg, z_ShPvd, z_PrtPvd, z_OtpSt2, z_NewUkr, z_DblTab,
     z_ChSps, z_MkArhG, a_ZUObj, z_VRTabN, z_SvdN_1, z_EBnkLS, z_NichVd,
     z_psPdN, z_VdIndD, z_VdIndE, z_MyDbg, z_ChNU, z_VbYear, z_NuByYr,
     z_Tmplts, z_SvdKtP, z_SpsCmb, z_GtKdLg, z_SpsInv,
     z_SpsLgt, z_FssTvp, z_PrBln, z_EdtOP, z_AddKmd, z_PidZv,
     z_InvSt, z_VvDats, z_VIspl2, z_GetMG, z_ShANdb, z_PrcInd, z_FIndx,
     z_FFIndx, z_AddBLS, z_PlSt02, z_Otp36, z_ShPrOk, z_DtFrMo, z_DtChMo,
     z_GtMo, z_Mo2GK, z_PrSps, z_FFInd2, z_PlnSbu, z_ShwTem, z_NewShT,
     z_NicRp1, z_dk2010, z_Co2010, z_IspSlg, z_remp, z_PredPkt, z_AutoMZ,
     z_AuditDataModule, z_AddPP, z_EdNadb, VersionInfo, DModUsrSetts,
     FormSrchEmpl, FormUserSetts, StringUtils, QryUtils, UsrSelf, CustDateUtils,
     ViewStorn500X, FormDismisThisMnth, FormSpov, PrtRaschList, FormEmplIndx,
     RptIndxExcl, DateLib, FormGetSpan, DModEmplIndx, TimeProgress,
     FormCatVidNDeptId, Z_SArhivSpan;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure RunZp;
begin
  bSprashival := false;
  bSamZplRun := false;
  bIsSpsWrkMes := false;
  if not bIsFormZpl then begin
    FormZpMain := TFormZpMain.Create(Application);
    FormZpMain.Show;
    bIsFormZpl := true; end
  else begin
    if FormZpMain.WindowState = wsMinimized then
      FormZpMain.WindowState := wsNormal;
    FormZpMain.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.FormCreate(Sender: TObject);
var i, nSvKdObj, nSvTabN : integer;
    nY, nM, nD : word; mLstUsr : TStringList;
    nKdUsr : SmallInt;  cHint : ShortString;
    IniFile: TIniFile;
begin
  try
    Application.Title := 'Зарплата ' + GetAppVersion;
  except
    ShowMessage('Ошибка получения информации о версии.');
  end;

  {
  try
    TFormAbout.UpdateVersionInfo;
  except
    ShowMessage('Ошибка обновления информации о версии в базе данных.');
  end;
  }

  cAppShCmp := 'zpl';
  nAppKdCmp := 1;
  g_bNewSchet := false;
  b_SchetPotokom := false;
  bEndTvObjUpdated := false;
  bStopSchet := false;
  bNetSchetPotokom := false;
  bVvodIzZpZ := false;
  bFormMainReady := false;
  bFlagOpi  := false;
  bTreeObjChanged := false;
  bIndSchet := true;

  LockedEmplId := 0;
  LockedEmplName := '';

  LblLockedEmployee.Caption := '';
  LblEmplInfo.Caption := '';
  dDt01012008 := EncodeDate(2008, 1, 1);
  dDt01012011 := EncodeDate(2011, 1, 1);
  d_0217 := EncodeDate(2017, 5, 1);

  if bSamZplRun then begin
    for i := 0 to ParamCount do begin
      if LowerCase(ParamStr(i)) = 'dbg' then
        bFlagDbg := true
      else if LowerCase(ParamStr(i)) = 'gms' then
        bFlagGMS := true
      else if LowerCase(ParamStr(i)) = 'opi' then
        bFlagOpi := true
      else if LowerCase(ParamStr(i)) = 'psw' then
        bFlagNoPsw := true;
    end;
  end;
  gc_DirExe := ExtractFileDir(ParamStr(0)) + '\';
  if FileExists(gc_DirExe + 't_ChkUsr.lst') then begin
    mLstUsr := TStringList.Create;
    mLstUsr.LoadFromFile(gc_DirExe + 't_ChkUsr.lst');
    gc_AppNmUsr    := mLstUsr[0];
    nAppKdUsr    := StrToInt(mLstUsr[2]);
    gl_nAppKdSpsUsr := StrToInt(mLstUsr[3]);
    bAppSpecUsr  := false; // mLstUsr[4] = 'Y';
    nAppUsrLvl   := StrToInt(mLstUsr[5]);
    nAppUsrKat   := nAppUsrLvl;  // это одно и то же, только "вид сбоку"
    nKdUsr := nAppKdUsr;
    gl_nKdSps := gl_nAppKdSpsUsr;
    DeleteFile(gc_DirExe + 't_ChkUsr.lst');
    mLstUsr.Destroy; end
  else begin
    gc_AppNmUsr := 'Master';
    nAppKdUsr  := 0;
    nAppUsrKat := 0;
    nAppUsrLvl := 0;
    nKdUsr := 0;
    bAppSpecUsr  := false;
    gl_nAppKdSpsUsr := 1;
    gl_nKdSps := gl_nAppKdSpsUsr;
  end;

  MasterDebug := bFlagDbg and (nAppUsrLvl = 0);

  popNuRs2Dbg.Visible   := bFlagDbg;
  popNuForMO.Visible    := bFlagDbg;
  mmChngBnk.Visible     := bFlagDbg;
  mMnuMassNadb.Enabled  := true;   //bFlagDbg;
  mMnuOldZpK.Visible    := bFlagDbg;
  mMnuZpPrikazuOK.Enabled := bFlagDbg;

  // Видим для всех. Каждый редактирует себя.
  mMnuZpUsersNew.Visible := true;

  mMnuOtkl_NuToExcel.Visible := bFlagDbg;
  StatusBar.Panels[2].Text := '(' + IntToStr(gl_nAppKdSpsUsr) + '/' +
                                    IntToStr(nAppUsrKat) + ') ' + gc_AppNmUsr;
  cDirNoDelMe := gc_DirExe + 'NoDelMe\';
  cDirCmn := gc_DirExe + 'CMN\'; // Это будет работать, когда cDirExe и файл .exe
          // будут где-то в центральном месте, а пока у каждого своя cDirCmn.
          // Но делать нужно обязательно, иначе у каждого параметры,
          // которые должны быть общими, свои.
          // Можно эти параметры держать где-то в БД (Додумать !!!)
  cDirInd  := gc_DirExe + 'IND_' + IntToStr(nKdUsr) + '\';
  cDirTemp := cDirInd + 'TEMP\';
  cDirVids := cDirInd + 'VIDS\';
  cDirVts  := cDirInd + 'VTS\';
  cDirDocs := cDirCmn + 'DOCS\';
  cDirSbu  := cDirInd + 'SBU\';
  cNmIniFile := cDirInd + 'Zp.ini';
  cCmnIniFile := cDirCmn + 'ZpCmn.ini';
  if nKdUsr <> 0 then
    cNmIniFile := cDirInd + 'ZpO_' + IntToStr(nKdUsr) + '.ini'
  else
    cNmIniFile := cDirInd + 'ZpO_000.ini';
  if not DirectoryExists(cDirNoDelMe) then
    ForceDirectories(cDirNoDelMe);
  if not DirectoryExists(cDirVids) then
    ForceDirectories(cDirVids);
  if not DirectoryExists(cDirTemp) then
    ForceDirectories(cDirTemp);
  if not DirectoryExists(cDirDocs) then
    ForceDirectories(cDirDocs);
  if not DirectoryExists(cDirSBU) then
    ForceDirectories(cDirSBU);
  if not DirectoryExists(cDirVts) then
    ForceDirectories(cDirVts);
  DmMain := TDmMain.Create(Application);
  Form_Dm.RestoreIniFile(nAppKdUsr, cAppShCmp, cNmIniFile);

  Form_Dm.RestoreIniFile(-1, cAppShCmp, cCmnIniFile);
  nAppCnrWrkChasInDay := DmMain.GetCountWrkChas;
  Caption := 'Зарплата';
  bIsFormCheckPrp := false;
  bIsFormShwLog := false;
  bIsFormShwLogByTabN := false;
  bIsFormDfMain := false;
  bIsFormCalendar := false;
  bIsFormMyCalendar := false;
  bIsFormRemPere := false;
  bIsFormChkNuZaMG := false;
  bIsFormCheckNu := false;
  bIsFormChkSps := false;
  bIsFormPsPdn := false;
  bIsFormShwPrOk := false;
  bIsFormCreFIndx2 := false;
  bIsFormZpl2Gk := false;

  IniFile := TIniFile.Create(cCmnIniFile);

  with IniFile do begin
    dDtLastCopySbu := ReadInteger(SECTION, 'dDtCopySBU', 0);
    cZpHostNm := ReadString(SECTION, 'cZpHostNm', 'LocalHost');
    SocZp.Host := cZpHostNm;
    bAppZpObjVed := ReadBool(SECTION, 'bAppZpOV', false);
    nMesBegRabotu := 6;    // ReadInteger(SECTION, 'nMBR', 0);
    nGodBegRabotu := 2001; // ReadInteger(SECTION, 'nGBR', 0);
    nDayPerehoda := ReadInteger(SECTION, 'nDayPerehoda', 1);
    cFirma := ReadString(SECTION, 'cFirma', '');
    cDirDolgn := ReadString(SECTION, 'cDirDolgn', '');
    cDirFIO := ReadString(SECTION, 'cDirFIO', '');
    cGlBuhDolgn := ReadString(SECTION, 'cGlBuhDolgn', '');
    cGlBuhFIO := ReadString(SECTION, 'cGlBuhFIO', '');
    cBuhDolgn := ReadString(SECTION, 'cBuhDolgn', '');
    cBuhFIO := ReadString(SECTION, 'cBuhFIO', '');
    nAppLstMaxRow := ReadInteger(SECTION, 'nLstMaxRow', 56);
    Free;
  end;

  if nDayPerehoda <= 0 then
    nDayPerehoda := 1;

  IniFile := TIniFile.Create(cNmIniFile);

  with IniFile do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 460);
    Width  := ReadInteger(SECTION, 'wW', 620);
    PanelLeft.Width := ReadInteger(SECTION, 'SpsW', 200);
    PanelTvObj.Height := ReadInteger(SECTION, 'ObjH', 120);
    nUpiUpdNR := ReadInteger(SECTION, 'nUpiUpdNR', 0);
    if PanelTvObj.Height < 120 then
      PanelTvObj.Height := 120;
    PageControl.Height := ReadInteger(SECTION, 'GrOtklH', 120);
    if PageControl.Height < 120 then
      PageControl.Height := 120;
    dbgrPrmUv.Width := ReadInteger(SECTION, 'GrPrmUvW', 315);
    PageControl.ActivePageIndex := ReadInteger(SECTION, 'nPgIndx', 0);
    nSvKdObj := ReadInteger(SECTION, 'nSvObj', 0);
    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    mMnuZpViewExcel.Checked := ReadBool(SECTION, 'bExcel', true);
    mMnuZpViewF6.Checked := not mMnuZpViewExcel.Checked;
    bAppDocsToExcel := mMnuZpViewExcel.Checked;
    mmSetsToBD.Checked :=  ReadBool(SECTION, 'bSetsToBD', true);
    mMnuZpHints.Checked := ReadBool(SECTION, 'bHints', true);
    popNuSortByVid.Checked := ReadBool(SECTION, 'bNuSortByVid', false);
    popNuVidSummOne.Checked := ReadBool(SECTION, 'bSmOne', true);
    popNuVidSummTwo.Checked := not popNuVidSummOne.Checked;
    popNu2VidSummOne.Checked := ReadBool(SECTION, 'bSm2One', true);
    popNu2VidSummTwo.Checked := not popNu2VidSummOne.Checked;
    mMnuZpMyDbgDelTmpFiles.Checked := ReadBool(SECTION, 'bDelTmpFiles', true);

    SetNadbShowModeAll(ReadBool(SECTION, 'bNdbAll', true));
    SetSortPereAscend(ReadBool(SECTION, 'bSortPereAsc', true));
    
    mMnuZpNapominalka.Checked := ReadBool(SECTION, 'bNapomn', true);
    popOtklSortByZaMesGod.Checked := ReadBool(SECTION, 'bOtklSortByMG', true);
    popOtklSortByVidN.Checked := not popOtklSortByZaMesGod.Checked;
    popNuShwSpecVids.Checked := ReadBool(SECTION, 'bShwSpecVids', true);
    mMnuStatBar.Checked := ReadBool(SECTION, 'bShwStatBar', true);
    mMnuRestSpsTabN.Checked := ReadBool(SECTION, 'bRestSpsTabN', false);
    mMnuFontBold.Checked := ReadBool(SECTION, 'bFontBold', false);
    mMnuZpToolPanel.Checked := ReadBool(SECTION, 'bTools', true);

    InitShowNuMode(IniFile);

    popSpsSortByFIO.Checked := ReadBool(SECTION, 'bSpsSortByFIO', true);
    popSpsSortByTabN.Checked := not popSpsSortByFIO.Checked;

    cFontName        := ReadString(SECTION, 'cFN', 'Arial');
    nFontSize        := ReadInteger(SECTION, 'cFS', 10);
    bFontBold        := ReadBool(SECTION, 'bFB', false);
    bFontItalic      := ReadBool(SECTION, 'bFI', false);
    mTvObjColor      := ReadInteger(SECTION, 'TvObjClr', clWhite);
    mDbgrSpsColor    := ReadInteger(SECTION, 'DbgrSpsClr', clWhite);
    mDbgrNuColor     := ReadInteger(SECTION, 'DbgrNuClr', clWhite);
    mDbgrNu2Color    := ReadInteger(SECTION, 'DbgrNu2Clr', clWhite);
    mDbgrOtklColor   := ReadInteger(SECTION, 'DbgrOtklClr', clWhite);
    mDbgrPrmUvColor  := ReadInteger(SECTION, 'DbgrPrmUvClr', clWhite);
    mDbgrPereColor   := ReadInteger(SECTION, 'DbgrPereClr', clWhite);
    mDbgrNadbColor   := ReadInteger(SECTION, 'DbgrNadbClr', clWhite);
    mDbgrUdrgColor   := ReadInteger(SECTION, 'DbgrUdrgClr', clWhite);
    sBtnUchKart.Down := ReadBool(SECTION, 'bShUchDela', true);
    popNuSumBrush.Checked := ReadBool(SECTION, 'bNuSmBrush', true);
    popNu2SumBrush.Checked := ReadBool(SECTION, 'bNu2SmBrush', true);
    Free;
  end;

  with DmMain do begin
    PrepareQryPrmUv(DsrcSps);
    PrepareQryPere(DsrcSps, PopSortPereAscend.Checked);
  end;

  LoadEmplInfoSetts;

  PanelDbg.Visible := bFlagDbg;
  mmFzDela.Visible  := bFlagDbg; // Сначала разобраться, что я тут затевал !!!
  mmPrtNich.Visible := true; //(bFlagDbg or (nAppKdSpsUsr = 6));
  mMnuIndxNachOld.Visible := bFlagDbg or (nAppKdUsr in [101, 102, 127]);

  if mmSetsToBD.Checked then
    Form_Dm.RestoreUsrVids(nAppKdUsr, cAppShCmp, cDirVids);
  TvObj.Color     := mTvObjColor;
  dbgrSps.Color   := mDbgrSpsColor;
  dbgrNu.Color    := mDbgrNuColor;
  dbgrNu2.Color   := mDbgrNu2Color;
  dbgrOtkl.Color  := mDbgrOtklColor;
  dbgrPrmUv.Color := mDbgrPrmUvColor;
  dbgrPere.Color  := mDbgrPereColor;
  dbgrNadb.Color  := mDbgrNadbColor;
  dbgrUdrg.Color  := mDbgrUdrgColor;
  SetTabsFont;
  SetShowPanelTools;
  SetStatBar;

  popNuSortByMes.Checked := not popNuSortByVid.Checked;
  popNu2SortByVidN.Checked := popNuSortByVid.Checked;
  popNu2SortByZaMG.Checked := popNuSortByMes.Checked;
  sBtnSortByVidN.Down := popNu2SortByVidN.Checked;
  sBtnSortByZaMG.Down := popNu2SortByZaMG.Checked;
  sBtnShowSpecVids.Down := popNuShwSpecVids.Checked;
  PopShowNdbActual.Checked := not PopShowNdbAll.Checked;
  if nMesBegRabotu = 0 then begin
    DecodeDate(Date, nY, nM, nD);
    nGodBegRabotu := nY;
    nMesBegRabotu := nM;
  end;
  SetNapominalka;
  Application.ShowHint := mMnuZpHints.Checked;
  SetNow;

  cAppComputerName := MyGetComputerName;  {a_Lib}
  Form_Dm.RegCurUsr(nAppKdUsr, nAppKdCmp, nAppUsrKat, gc_AppNmUsr, cAppShCmp,
                                                              cAppComputerName);
  // Если у вошедшего юзера есть назначенные KdSps, заполнить LbxAllowSps.
  // Если нет - допущен ко всем (так проще). Но вообще-то реально каждый
  // пользователь допускается только к одному списку.
  bAppSpecUsr := IsUsrSpecBySps(nAppKdUsr);

  if FileExists(cDirVids + 'kMnSps01.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids  + 'kMnSps01.vid');
  if FileExists(cDirVids + 'aMnPu01.vid') then
    dbgrPrmUv.Columns.LoadFromFile(cDirVids + 'aMnPu01.vid');
  if FileExists(cDirVids + 'aMnPere10.vid') then
    dbgrPere.Columns.LoadFromFile(cDirVids + 'aMnPere10.vid');
  if FileExists(cDirVids + 'aMnNdb5.vid') then
    dbgrNadb.Columns.LoadFromFile(cDirVids + 'aMnNdb5.vid');
  if FileExists(cDirVids + 'aMnUdrg2.vid') then
    dbgrUdrg.Columns.LoadFromFile(cDirVids + 'aMnUdrg2.vid');
  if FileExists(cDirVids + 'x_MnOtk2.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'x_MnOtk2.vid');
  if FileExists(cDirVids + 'grNu1_3.vid') then
    dbgrNU.Columns.LoadFromFile(cDirVids   + 'grNu1_3.vid');
  if FileExists(cDirVids + 'grNu2_0.vid') then
    dbgrNu2.Columns.LoadFromFile(cDirVids   + 'grNu2_0.vid');
  SetFormFont;
  Application.OnHint := ZplDisplayHint;
  DmMain.qryMesSps.Open; // по Z_SPS создаю список имеющихся месяцев расчета

  CreTvObj_FromTable(nAppKdUsr, gl_nAppKdSpsUsr);

  bEndTvObjUpdated := true;
  if (nSvKdObj <> 0) then
    qryObj.Locate('KdObj', nSvKdObj, []);
  OpenQrySps(gl_nAppKdSpsUsr);
  if qrySps.Active and (qrySps.RecordCount <> 0) then
    StatusBar.Panels[0].Text := ' Сотрудников: ' + IntToStr(qrySps.RecordCount)
  else
    StatusBar.Panels[0].Text := '';
  if nSvTabN <> 0 then
    qrySps.Locate('TabN', nSvTabN, []);
  DmMain.qryPrmUv.DataSource := dsrcSps;
  DmMain.qryPere.DataSource := dsrcSps;
  DmMain.qryNadb.DataSource := dsrcSps;
  DmMain.qryUdrg.DataSource := dsrcSps;
  bFormMainReady := true;
  DisplayProcMnthInfo;
  nCurBudget := DmMain.Budget(nProcY, nProcM, nCurCntDay, nCurCntWorkDay);
  PanelMinutku.Left := dbgrNU.Left +
                              Round((dbgrNU.Width - PanelMinutku.Width) / 2);
  PanelMinutku.Top := dbgrNU.Top +
                              Round((dbgrNU.Height - PanelMinutku.Height) / 2);
  SetDbgrPereColumns;
  SetDbgrNadbColumns;
  SetDbgrUdrgColumns;
  SetDbgrOtklColumns;
  SetDbgrNUColumns;
  SetDbgrNu2Columns;
  SetShowNuMode(NuShowMode);  // Выбор таблицы NU (детально или свернуто)
  SetPanelMinutkuPlace;
  CheckTblSvSpsPlace;
  CreLbxMesGod;  // Заполнить mListMG месяцами от dDtProc - 12 до dDtProc
                 // и сохранить его в файле cDirVids + 'CmboZaMG.lbx'
  mmMyCheckResults.Visible := bFlagDbg;
  mmPereraschetPdn.Visible := bFlagDbg;
  popNuMyCheckNU.Visible := bFlagDbg;
  popNu2MyCheckNU.Visible := bFlagDbg;
  if dDtLastCopySbu <> Date then begin
    dDtLastCopySbu := Date;
  end;
  SetRoundMode(rmNearest);  // бывает: (rmNearest, rmDown, rmUp, rmTruncate)
  Form_DM.GetRkvzt(cAppRukDolgn, cAppRukFIO, cAppBuhDolgn, cAppBuhFIO,
                   cNmPredprLoc, cAdresLoc);
  SetMainMnu;
  SetShowUchKart;
  DmMain.SetAmzDate;
  SetMnuZpCloseMonth;
  for i := 0 to ComponentCount-1 do
    if Components[i] is TControl then with TControl(Components[i]) do begin
      cHint := Hint;                      // Сие я нагородил, чтобы длинные
      while Pos('@', cHint) <> 0 do       // Hint'ы выводились в две строки,
        cHint[Pos('@', cHint)] := #13;    // для чего в месте переноса нужно
      Hint := cHint;                      // заранее вставить значок @, а он
    end;                     // потом преобразуется в #13 - "возврат каретки"
                             //      (См. hint'ы на dbgrSps, dbgrNU, dbgrNu2)
  RefreshIndxExclState;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.InitShowNuMode(IniFile: TIniFile);
var
  NewNuShowMode: Integer;
begin
  with IniFile do begin
    // Старая зачитка отображения нач./удерж.
    if ReadBool(SECTION, 'bShwNuDet', true) then
      NuShowMode := snuDetail
    else
      NuShowMode := snuCondens;

    // Новая зачитка отображения нач./удерж.
    NewNuShowMode := ReadInteger(SECTION, 'ShwNuMode', 0);
    if NewNuShowMode <> 0 then
      NuShowMode := TNuShowMode(NewNuShowMode);

    NShwNuDetail.Checked := NuShowMode = snuDetail;
    NShwNuCondens.Checked := NuShowMode = snuCondens;

    NShwNuDetail2.Checked   := NuShowMode = snuDetail;
    NShwNuCondens2.Checked := NuShowMode = snuCondens;

    BtnNuDetail.Down := NuShowMode = snuDetail;
    BtnNuCondens.Down := NuShowMode = snuCondens;
    BtnNuShort.Down := NuShowMode = snuNewShort;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.FormClose(Sender: TObject;   var Action: TCloseAction);
begin
  bIsFormZpl := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  StatusBar.Panels[1].Text := 'Сохранение персональных настроек пользователя';
  Application.ProcessMessages;
  if bIsFormShwLog or bIsFormShwLogByTabN then
    FormShwLog.Close;
  if bIsFormMyCalendar then
    FormMyCalendar.Close;
  if bIsFormRemPere then
      FormRemPere.Close;
  if bIsFormDfMain then
    FormDfMain.Close;
  if bIsFormCheckPrp then
    FormCheckPrp.Close;
  if bIsFormChkNuZaMG then
    FormChkNuZaMG.Close;
  if bIsFormCheckNu then
    FormCheckNu.Close;
  if bIsFormChkSps then
    FormChkSps.Close;
  if bIsFormPsPdn then
    FormPsPdn.Close;
  if bIsFormShwPrOK then
    FormShwPrOK.Close;
  if bIsFormZpl2Gk then
    FormZpl2Gk.Close;
  if bIsFormCreFIndx2 then
    FormCreFIndx2.Close;
  Form_Dm.UnRegCurUsr(nAppKdUsr, nAppKdCmp, cAppComputerName);
  dbgrSps.Columns.SaveToFile(cDirVids   + 'kMnSps01.vid');
  dbgrPrmUv.Columns.SaveToFile(cDirVids + 'aMnPu01.vid');
  dbgrPere.Columns.SaveToFile(cDirVids  + 'aMnPere10.vid');
  dbgrNadb.Columns.SaveToFile(cDirVids  + 'aMnNdb5.vid');
  dbgrUdrg.Columns.SaveToFile(cDirVids  + 'aMnUdrg2.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids  + 'x_MnOtk2.vid');
  dbgrNU.Columns.SaveToFile(cDirVids    + 'grNu1_3.vid');
  dbgrNu2.Columns.SaveToFile(cDirVids   + 'grNu2_0.vid');
  if mMnuZpMyDbgDelTmpFiles.Checked then
    DelTmpFiles;

  with TIniFile.Create(cCmnIniFile) do begin
    WriteString(SECTION, 'cZpHostNm', cZpHostNm);
    WriteBool(SECTION, 'bAppZpOV', bAppZpObjVed);
    WriteInteger(SECTION, 'nMBR', nMesBegRabotu);
    WriteInteger(SECTION, 'nGBR', nGodBegRabotu);
    WriteInteger(SECTION, 'nDayPerehoda', nDayPerehoda);
    WriteString(SECTION, 'cFirma', cFirma);
    WriteString(SECTION, 'cDirDolgn', cDirDolgn);
    WriteString(SECTION, 'cDirFIO', cDirFIO);
    WriteString(SECTION, 'cGlBuhDolgn', cGlBuhDolgn);
    WriteString(SECTION, 'cGlBuhFIO', cGlBuhFIO);
    WriteString(SECTION, 'cBuhDolgn', cBuhDolgn);
    WriteString(SECTION, 'cBuhFIO', cBuhFIO);
    WriteInteger(SECTION, 'nLstMaxRow', nAppLstMaxRow);
    WriteInteger(SECTION, 'dDtCopySBU', Round(dDtLastCopySbu));
    Free;
  end;

  with TIniFile.Create(cNmIniFile) do begin
    WriteString(SECTION, 'cZpHostNm', cZpHostNm);
    WriteBool(SECTION, 'bAppZpOV', bAppZpObjVed);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nUpiUpdNR', nUpiUpdNR);
    WriteInteger(SECTION, 'nMBR', nMesBegRabotu);
    WriteInteger(SECTION, 'nGBR', nGodBegRabotu);
    WriteInteger(SECTION, 'SpsW', PanelLeft.Width);
    WriteInteger(SECTION, 'ObjH', PanelTvObj.Height);
    WriteInteger(SECTION, 'nPgIndx', PageControl.ActivePageIndex);
    WriteInteger(SECTION, 'GrOtklH', PageControl.Height);
    WriteInteger(SECTION, 'GrPrmUvW', dbgrPrmUv.Width);
    WriteInteger(SECTION, 'nSvObj', qryObj.FieldByName('KdObj').AsInteger);
    WriteInteger(SECTION, 'nSvTabN',
                 dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger);
    WriteBool(SECTION, 'bExcel', mMnuZpViewExcel.Checked);
    WriteBool(SECTION, 'bSetsToBD', mmSetsToBD.Checked);
    WriteBool(SECTION, 'bHints', mMnuZpHints.Checked);
    WriteString(SECTION, 'cFirma', cFirma);
    WriteString(SECTION, 'cDirDolgn', cDirDolgn);
    WriteString(SECTION, 'cDirFIO', cDirFIO);
    WriteString(SECTION, 'cGlBuhDolgn', cGlBuhDolgn);
    WriteString(SECTION, 'cGlBuhFIO', cGlBuhFIO);
    WriteString(SECTION, 'cBuhDolgn', cBuhDolgn);
    WriteString(SECTION, 'cBuhFIO', cBuhFIO);
    WriteInteger(SECTION, 'nLstMaxRow', nAppLstMaxRow);
    WriteBool(SECTION, 'bNuSortByVid', popNuSortByVid.Checked);
    WriteBool(SECTION, 'bSmOne', popNuVidSummOne.Checked);
    WriteBool(SECTION, 'bSm2One', popNu2VidSummOne.Checked);
    WriteBool(SECTION, 'bDelTmpFiles', mMnuZpMyDbgDelTmpFiles.Checked);
    WriteBool(SECTION, 'bNdbAll', PopShowNdbAll.Checked);
    WriteBool(SECTION, 'bNapomn', mMnuZpNapominalka.Checked);
    WriteBool(SECTION, 'bSortPereAsc', PopSortPereAscend.Checked);
//    WriteBool(SECTION, 'bShwAllObj', popTvObjVidAll.Checked);
    WriteBool(SECTION, 'bShwSpecVids', popNuShwSpecVids.Checked);
    WriteBool(SECTION, 'bShwStatBar', mMnuStatBar.Checked);
    WriteBool(SECTION, 'bRestSpsTabN', mMnuRestSpsTabN.Checked);
    WriteBool(SECTION, 'bFontBold', mMnuFontBold.Checked);
    WriteBool(SECTION, 'bTools', mMnuZpToolPanel.Checked);

    // Новое сохранение отображения нач./удерж.
    WriteInteger(SECTION, 'ShwNuMode', Ord(NuShowMode));
    // Пишем статистику использования
    DmUsrSetts.WriteNuShowMode(NuShowMode);

    WriteBool(SECTION, 'bOtklSortByMG', popOtklSortByZaMesGod.Checked);
    WriteBool(SECTION, 'bSpsSortByFIO', popSpsSortByFIO.Checked);
    WriteString(SECTION, 'cFN', cFontName);
    WriteInteger(SECTION, 'cFS', nFontSize);
    WriteBool(SECTION, 'bFB', bFontBold);
    WriteBool(SECTION, 'bFI', bFontItalic);
    WriteInteger(SECTION, 'TvObjClr', TvObj.Color);
    WriteInteger(SECTION, 'DbgrSpsClr', dbgrSps.Color);
    WriteInteger(SECTION, 'DbgrNuClr', dbgrNu.Color);
    WriteInteger(SECTION, 'DbgrNu2Clr', dbgrNu2.Color);
    WriteInteger(SECTION, 'DbgrOtklClr', dbgrOtkl.Color);
    WriteInteger(SECTION, 'DbgrPrmUvClr', dbgrPrmUv.Color);
    WriteInteger(SECTION, 'DbgrPereClr', dbgrPere.Color);
    WriteInteger(SECTION, 'DbgrNadbClr', dbgrNadb.Color);
    WriteInteger(SECTION, 'DbgrUdrgClr', dbgrUdrg.Color);
    WriteBool(SECTION, 'bShUchDela', sBtnUchKart.Down);
    WriteBool(SECTION, 'bNuSmBrush', popNuSumBrush.Checked);
    WriteBool(SECTION, 'bNu2SmBrush', popNu2SumBrush.Checked);
    Free;
  end;

  SaveEmplInfoSetts;

  if nAppUsrKat < 1 then
    Form_Dm.SaveIniFile(-1, cAppShCmp, cCmnIniFile);
  Form_Dm.SaveIniFile(nAppKdUsr, cAppShCmp, cNmIniFile);
  if mmSetsToBD.Checked then
    Form_Dm.SaveUsrVids(nAppKdUsr, cAppShCmp, cDirVids);
  Application.OnHint := nil;
  if not bFlagDbg and FileExists(cDirVids + 'CmboZaMG.lbx') then
    DeleteFile(cDirVids + 'CmboZaMG.lbx');

  qrySps.Close;
  qryObj.Close;
  StatusBar.Panels[1].Text := '';
  DmMain.Destroy;
  tblSvSpsPlace.Close;
  bIsFormZpl := false;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetMnuZpCloseMonth;
begin
  mMnuZpCloseMonth.Visible := bFlagDbg or (nAppUsrLvl = 0);
  mMnuZpCloseMonth.Enabled := DmMain.InCtrlMes;
end;
//------------------------------------------------------------------------------
function TFormZpMain.IsUsrSpecBySps(nKdUsr : SmallInt) : boolean;
begin
  with DmMain.qryAllowSps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from zz_UsrKdSps where KdUsr = :nKdUsr order by KdSps');
    ParamByName('nKdUsr').AsInteger := nKdUsr;
    Open;
    Result := (RecordCount > 0);
    if Result then begin
      LbxAllowSps.Items.Clear;
      while not Eof do begin
        if (not FieldByName('KdSps').IsNull) and
                  (FieldByName('KdSps').AsString > '') then
         LbxAllowSps.Items.Add(FieldByName('KdSps').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.OpenQryOtkl;
//var cDopSQL : ShortString; i : SmallInt;  bInOsnSps : boolean;
begin
//  bInOsnSps := TabNInOsnSps;
  with DmMain.qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataSource := dsrcSps;
{
    if dDtProc >= d_0217 then begin
      SQL.Add('elect o.VIDN, v.ShVidN, o.TABN, o.KDSPS, s.PSch, s.SchBU, s.PS_17, s.Sch_17,
       o.DTPROC, o.ZAMESGOD, o.DtStorn, o.CHAS, o.SUMMA, o.NR,  o.DT_BEG, o.DT_END,
       o.KDOBJ, ko.ShObj, o.KDKATP, kp.ShKatP, o.KDSPZ, o.PDN, o.NOTES, o.PRR, o.PRPV,
       o.KTO, o.PRKR, o.MYNOTES, o.SPECPS, o.SPEC_NR, o.DtVdPv, o.NrVdPv, o.KdBnk,
       o.PBnk, o.STORN, v.ZP13, v.OTP, v.BLN, v.OTPUSKN, v.BOLNIC, v.SPRM, v.CPRM,
       v.DETI, v.DETIM, v.DETIK, v.DETIG, v.IND, v.DHD, v.OKLFND, v.CBUDG, v.SNDB,
       v.SPDN, v.SPRF, v.SPENS, v.SALIM, v.CNDB, v.SSOCSTRAH, v.SBZR, v.SP_PF,
}



    SQL.Add('Select * from ViOtklMain where (TabN = :TabN) and ' +
            ' ((DtProc = :DtProc) or ' +
            ' ((DtProc <> :DtProc) and (ZaMesGod = :DtProc)) or ' +
            ' ((DtProc <> :DtProc) and (DtStorn = :DtProc)))');
    if gl_nAppKdSpsUsr > 2 then
      SQL.Add(' and (KdSps = :nAppKdSpsUsr) ');
    if popOtklSortByZaMesGod.Checked then
      SQL.Add(' order by DtProc, ZaMesGod, DtStorn, VidN, Dt_Beg, PRR, NR ')
    else
      SQL.Add(' order by DtProc, VidN, ZaMesGod, DtStorn, Dt_Beg, PRR, NR ');
    if gl_nAppKdSpsUsr > 2 then
      ParamByName('nAppKdSpsUsr').AsInteger := gl_nAppKdSpsUsr;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.OpenQryNu2;
var
  bOsnSotr: boolean;  // Основной ли сотрудник в текущем спмске
  OrderFlds: ShortString;
begin
  bOsnSotr := DmMain.EmplIsInMainList(
    QrySps.FieldByName('TabN').AsInteger, dDtProc);

  if popNuSortByMes.Checked then
    OrderFlds := 'ZaMesGod, VidN, ShVidN'
  else
    OrderFlds := 'VidN, ShVidN, ZaMesGod';

  TQryUtils.InitQuery(qryNu2);

  with qryNu2 do begin
    SQL.Add(
      'select ' + OrderFlds + ', ' + 'PSch, SchBU, PdN, ' +
        'KdSps, KdObj, KdKatP, ' +
        'Min(Dt_Beg) as Dt_Beg, Max(Dt_End) as Dt_End, ' +
        'Sum(Chas) as Chas, ' +
        'Sum(Summa) as Summa, ' +
        'Cast(Count(NR) as Integer) as CNT ' +
      'from ViNuMain ' +
      'where DtProc = :DtProc and TabN = :TabN ' +
        'and (not VidN in ("7503", "7509", "7511", "7515", "7519")) ' +
        'and (not (VidN > "5000" and VidN < "5100") ' +
          'or ZaMesGod = :DtProc and Storn <> "Y")');

    if (gl_nAppKdSpsUsr > 2) and not bOsnSotr then
      SQL.Add('and (KdSps = :nAppKdSpsUsr)');

    if not popNuShwSpecVids.Checked then
      SQL.Add('and (VidN < "8600")');

    SQL.Add(
      'group by VidN, ShVidN, ZaMesGod, PSch, SchBU, PdN, ' +
        'KdSps, KdObj, KdKatP ' +
      'having Sum(Summa) > 0.001 or Sum(Summa) < -0.001 ' +
        'or (VidN > "5000"  and VidN < "5100")');

    SQL.Add('UNION');

    SQL.Add(
      'select ' + OrderFlds + ', ' + 'PSch, SchBU, PdN, ' +
        'KdSps, KdObj, KdKatP, Dt_Beg, Dt_End, Chas, ' +
        'Summa, Cast(1 as Integer) as CNT ' +
      'from ViNuMain ' +
      'where DtProc = :DtProc and TabN = :TabN and ' +
        '(VidN in ("7503", "7509", "7511", "7515", "7519"))');

    if (gl_nAppKdSpsUsr > 2) and not bOsnSotr then
      ParamByName('nAppKdSpsUsr').AsInteger := gl_nAppKdSpsUsr;

    // Параметры DtProc и TabN будут получены из DsrcSps.
    DataSource := dsrcSps;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.OpenEmplQueries(EmplId: Integer; DtProc: TDateTime);
begin
  // Чтобы можно было задавать содержимое запросов в зависимости от того, какой
  // основной KdSps у текущего сотрудника, переоткрываю z_Pere, Z_Nadb, z_Otkl и
  // оба NU после каждого перемещения по таблице Z_SPS

  with DmMain do begin
    OpenQryPrmUv;
    OpenQryPere(PopSortPereAscend.Checked);
    OpenQryNadb(DsrcSps, PopShowNdbActual.Checked, LbxAllowSps.Items);
  end;

  OpenQryUdrg;
  OpenQryOtkl;

  with DmMain do begin
    LoadPayments(sBtnShowSpecVids.Down, NuShowMode = snuNewShort);
    ChangePmntsSort(popNuSortByMes.Checked);
  end;

  if NuShowMode = snuCondens then
    OpenQryNu2;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.DisplayEmplInfo;
begin
  if b_SchetPotokom or bNetSchetPotokom then
    Exit;

  DisplayEmplAttr(qrySpsTabN.AsInteger);

  PanelSelectedTotals.Visible := false;
  LbxF8.Clear;

  if DmMain.QryPere.FieldByName('KdSps').AsInteger = gl_nAppKdSpsUsr then
    rBtnIsOsn.Checked := true
  else
    rBtnIsOsn.Checked := false;

  RefreshNuTotals;

  SetMnuZpCloseMonth;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.RefreshNuTotals;
var
  Msg: ShortString;
  SmNach, SmUdrg, SmDolga: Double;
begin
  PanelTotals.Caption := '';
  SmNach := 0;
  SmUdrg := 0;
  SmDolga := 0;

  with dbgrNU.DataSource.DataSet do begin
    DisableControls;
    First;

    while not Eof do begin
      if FieldByName('VidN').AsString < '7600' then begin
        if FieldByName('Summa').AsFloat > 0 then
          SmNach := SmNach + FieldByName('Summa').AsFloat
        else if (FieldByName('Summa').AsFloat < 0) then
          SmUdrg := SmUdrg - FieldByName('Summa').AsFloat;
        if (FieldByName('VidN').AsString = '2724') then
          SmDolga := SmDolga + FieldByName('Summa').AsFloat;
      end;

      Next;
    end;

    First;
    EnableControls;
  end;

  if (SmNach <> 0) or (SmUdrg <> 0) or (SmDolga <> 0) then begin
    Msg :=
      'Начисл.: ' + FloatToStrF(SmNach, ffNumber, 18, 2) +
      '  Удерж.: ' + FloatToStrF(SmUdrg, ffNumber, 18, 2);

    if SmDolga <> 0 then
      Msg := Msg +
        ' (в т.ч. в долг ' + FloatToStrF(SmDolga, ffNumber, 18, 2) + ')';

    Msg := Msg +
      '  К выпл.: ' + FloatToStrF(SmNach - SmUdrg, ffNumber, 18, 2);

    PanelTotals.Caption := Msg;

    if SmDolga = 0 then begin
      PanelTotals.Font.Color := clWindowText;
      PanelTotals.Color := clBtnFace;
    end else if SmDolga < 0.05 then begin
      PanelTotals.Font.Color := clMaroon;
      PanelTotals.Color := clInfoBk;
    end else begin
      PanelTotals.Font.Color := clRed;
      PanelTotals.Color := clYellow;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TFormZpMain.GetEmplInfo(EmplId: Integer): TEmplInfo;
var
  AccIsClosed, DummyBool: Boolean;
  DummyStr: ShortString;
  DummyDate: TDateTime;
begin
  with DmMain, QryTmp, Result do begin
    BankId := 0;
    AccId := '';
    Salary := 0;

    if TQryUtils.PeekPere(QryTmp, qrySpsTabN.AsInteger, dDtProc, true) then
      Salary := FieldByName('OklTrf').AsFloat;

    DmMain.GetBankLS(QrySpsTabN.AsInteger, Date,
      DummyDate, BankId, DummyStr, DummyStr, AccId, DummyBool, AccIsClosed);

    if AccIsClosed then
      AccId := '';
  end;
end;

//------------------------------------------------------------------------------
// Обновляет информацию о сотруднике и в заголовке главной формы и на label'е.
//------------------------------------------------------------------------------
procedure TFormZpMain.DisplayEmplAttr(EmplId: Integer);
var
  AppCaption: ShortString;
  EmplInfo: TEmplInfo;
  ForceBlank: Boolean;
begin
  AppCaption := '';

  EmplInfo := GetEmplInfo(QrySpsTabN.AsInteger);

  if QrySps.Active and (QrySps.RecordCount > 0) then begin
    AppCaption := QrySpsTabN.AsString + ' ' + QrySpsFam.AsString + ' ' +
      QrySpsIma.AsString + ' ' + QrySpsOtch.AsString;

    with EmplInfo do begin
      AppCaption :=
        AppCaption + '.  Окл. ' + FloatToStrF(Salary, ffNumber, 18, 2);

      if AccId <> '' then
        AppCaption :=
          AppCaption + ', Банк ' + IntToStr(BankId) + ', л/с ' + AccId
      else
        AppCaption := AppCaption + ', л/с отсутств.';

      if Trim(QrySpsId.AsString) <> '' then
        AppCaption := AppCaption + '.  ИД = ' + QrySpsId.AsString
      else
        AppCaption := AppCaption + '.  ИД отсутств.';
    end;
  end;

  ForceBlank := AppCaption = '';

  RefreshEmplInfoLabel(EmplInfo, ForceBlank);

  Caption := 'Зарплата.';

  if not ForceBlank then
    Caption := Caption + ' ( ' + AppCaption + ' )';
end;

//------------------------------------------------------------------------------
// Обновляет информацию о сотруднике на label'е.
//------------------------------------------------------------------------------
procedure TFormZpMain.RefreshEmplInfoLabel(
  EmplInfo: TEmplInfo;
  ForceBlank: Boolean);
var
  Sep: String[2];
  Value: ShortString;
begin
  with LblEmplInfo, Font, EmplInfo do begin
    Caption := '';

    if ForceBlank then
      exit;

    Color := clMaroon;
    Sep := ', ';

    if NEmplId.Checked then
      Caption := TStrUtils.ConcatStr(Caption, QrySpsTabN.AsString);

    if NEmplName.Checked then
      Caption := TStrUtils.ConcatStr(Caption, QrySpsFam.AsString + ' ' +
        QrySpsIma.AsString + ' ' + QrySpsOtch.AsString, Sep);

    if NSalary.Checked then
      Caption := TStrUtils.ConcatStr(Caption, 'Окл. ' +
        FloatToStrF(Salary, ffNumber, 18, 2), Sep);

    if NBank.Checked then begin
      if BankId = 0 then
        Value := 'отсутств.'
      else
        Value := IntToStr(BankId);

      Caption := TStrUtils.ConcatStr(Caption, 'Банк ' + Value, Sep);
    end;

    if NBankAcc.Checked then begin
      if AccId = '' then
        Value := 'отсутств.'
      else
        Value := AccId;

      Caption := TStrUtils.ConcatStr(Caption, 'л/с ' + Value, Sep);
    end;

    if NEmplSocial.Checked then begin
      if QrySpsId.AsString = '' then begin
        Value := 'отсутств.';
        Color := clRed;
      end else
        Value := QrySpsId.AsString;

      Caption := TStrUtils.ConcatStr(Caption, 'ИНН ' + Value, Sep);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.DsrcSpsDataChange(Sender: TObject; Field: TField);
begin
  with Sender as TDataSource, DataSet do
  if (State = dsBrowse)
    and not b_SchetPotokom and not bNetSchetPotokom
  then
    OpenEmplQueries(FieldByName('TabN').AsInteger, dDtProc);

  DisplayEmplInfo;
  RefreshIndxExclState;

  // Позиционируемся на последнюю надбавку
  DbgrNadb.DataSource.DataSet.Last;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.DisplayProcMnthInfo;
var
  RusMnth, Msg: ShortString;
begin
  DisplayProcMnthCaption;

  nCurBudget := DmMain.Budget(nProcY, nProcM, nCurCntDay, nCurCntWorkDay);

  RusMnth := MesRus(nProcM);
  RusMnth := AnsiUpperCase(Copy(RusMnth, 1, 1)) +
    Copy(RusMnth, 2, Length(RusMnth));

  LabelCurMes.Caption := RusMnth + ' ' + IntToStr(nProcY) + ' года.   ' +
    'Всего дней: ' + IntToStr(nCurCntDay) + '.   ' +
    'Рабочих дней: ' + IntToStr(nCurCntWorkDay) + '.   ' +
    'Бюджет (часов): ' + FloatToStr(nCurBudget) + '.';

  if bFlagDbg then begin
    Msg := Form_Dm.DatabaseLocation(CESMAIN);

    with PanelDbg do
    if Pos('S0B', UpperCase(Msg)) > 0 then begin
      Font.Color := clRed;
      Caption := 'Внимание !  ' + Msg;
    end else
      Caption := Msg;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.DisplayProcMnthCaption;
begin
  with StaticMnthYear do begin
    if DmMain.InCtrlMes then begin
      Font.Color := clMaroon;
      Font.Style := [fsBold];
      dbgrOtkl.PopupMenu := popOtkl;
    end else begin
      Font.Color := clGreen;
      Font.Style := [];
    end;

    Caption := arrMonth[nProcM] + ' ' + IntToStr(nProcY);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.CreTvObj_FromTable(nKdUsr, nKdSpsUsr: SmallInt);
var n_SvKdObj : SmallInt;
begin
  n_SvKdObj := 0;
  with qryObj do begin
    if Active then begin
      n_SvKdObj := FieldByName('KdObj').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if gl_nAppKdSpsUsr <= 2 then begin
      SQL.Add('Select * from z_KdObj ' +
              ' order by AIndx, Lvl, PIndx');
      tvObj.Hint := 'Дерево подразделений (все подразделения)';
      LabelTvObj.Caption := 'Подразделения'; end
    else begin
      SQL.Add('Select ko.AINDX, ko.KDOBJ, ko.KdSpZ, ko.NR, ko.SHOBJ, ' +
              ' ko.NMOBJ, ko.PINDX, ko.LVL, ko.INDX, ko.HSCH, 0 ' +
              ' from z_KdObj ko ' +
              ' where ko.KdObj in (1000, 2000, 3000, 4000) ');
      SQL.Add('union Select ko.AINDX, ko.KDOBJ, ko.KdSpZ, ko.NR, ko.SHOBJ, ' +
              ' ko.NMOBJ, ko.PINDX, ko.LVL, ko.INDX, ko.HSCH, Count(sps.NR) ' +
              ' from viZUsrObj ko Left outer join z_Sps sps on ' +
              ' (sps.KdSps = ko.KdSps) and (sps.KdObj = ko.KdObj) and ' +
              ' (sps.DtProc = :dDtProc)' +
              ' where (ko.KdUsr = :nAppKdUsr) and ' +
              ' (ko.DtBProc <= :dDtProc) and ' +
              ' ((ko.DtEProc is null) or (ko.DtEProc <= :dDtProc)) ');
      SQL.Add('group by ko.AINDX, ko.LVL, ko.PINDX, ko.KDOBJ, ko.KdSpZ, ' +
              '         ko.NR, ko.SHOBJ, ko.NMOBJ, ko.INDX, ko.HSCH ');
      ParamByName('nAppKdUsr').AsInteger := nAppKdUsr;
      ParamByName('dDtProc').AsDateTime := dDtProc;
      tvObj.Hint := 'Дерево подразделений (только имеющие сотрудников в списке)';
      LabelTvObj.Caption := 'Подразделения (только "БОЕВЫЕ")';
    end;
    SQL.SaveToFile(cDirTemp + 'TvObj_2.sql');
    Open;
    CreTvObjItems;
    if n_SvKdObj > 0 then
      MyTVLocateKdObj(n_SvKdObj);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.CreTvObjItems;
var F : TextFile; MyTreeRec : PTreeRec;
    cTmpFile, cMsg : string; i : integer;
begin
  TvObj.Items.Clear;
  cTmpFile := cDirTemp + 'tmp.obj';
  AssignFile(F, cTmpFile);
  Rewrite(F);
  with qryObj do begin
    DisableControls;
    First;
    while not Eof do begin
      cMsg := '';
      for i := 1 to FieldByName('Lvl').AsInteger do begin
        cMsg := cMsg + ' ';
      end;
      cMsg := cMsg + FieldByName('KdObj').AsString + ' ' +
                         FieldByName('NmObj').AsString;
      WriteLn(F, cMsg);
      Next;
    end;
    CloseFile(F);
    TvObj.Items.BeginUpdate;
    TvObj.Items.Clear;
    TvObj.LoadFromFile(cTmpFile);
//    if FileExists(cTmpFile) then
//      DeleteFile(cTmpFile);



    cTmpFile := cDirTemp + 'tmp2.obj';
    AssignFile(F, cTmpFile);
    Rewrite(F);
    First; // Заполнить связанные Objects
    i := 0;
    while not Eof do begin
      New(MyTreeRec);
      MyTreeRec.KdObj := FieldByName('KdObj').AsInteger;
      MyTreeRec.ShObj := Trim(FieldByName('ShObj').AsString);
      MyTreeRec.NmObj := Trim(FieldByName('NmObj').AsString);
      MyTreeRec.LnkKdSch := FieldByName('KdSpZ').AsInteger;
      TvObj.Items[i].Data := MyTreeRec;
      cMsg := IntToStr(i) + '  ' + FieldByName('KdObj').AsString + '  ' +
                  FieldByName('ShObj').AsString + '  ' +
                    FieldByName('NmObj').AsString + '  ' +
                       FieldByName('KdSpZ').AsString;
      WriteLn(F, cMsg);


      Inc(i);
      Next;                    // qryObj не закрываю - будет нужен при
    end;                       // редактированиях и добавлениях
    CloseFile(F);

    TvObj.Items.EndUpdate;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.FormPaint(Sender: TObject);
begin
  if (dbgrSps.DataSource.DataSet.RecordCount = 0) and
                                    not bSprashival then begin
    bSprashival := true;
    CheckSpisokMes(dDtProc, nProcY, nProcM);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetNapominalka;
begin
{
  if mMnuZpNapominalka.Checked then begin
    LabelSystemDate.Visible := true;
    LabelWorkPeriod.Visible := true; end
  else begin
    LabelSystemDate.Visible := false;
    LabelWorkPeriod.Visible := false;
  end;
}
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.CheckSpisokMes(dDtPrc :TDateTime; nPrcY, nPrcM : word);
var nSvKdObj : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select count( * ) as CNT from Z_Sps where ' +
            ' (DtProc = :dDtPrc) ');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    bIsSpsWrkMes := (FieldByName('CNT').AsInteger > 0);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;

  if not bIsSpsWrkMes then
    if DmMain.CreSpsInProgress then
      ShowCreSpsRunning
    else if CreSpsConfirmed(nPrcY, nPrcM) then begin
      Application.ProcessMessages;

      if TFrmCreMnthList.CreSpsMes(nPrcY, nPrcM) {Z_CreSps} then begin
        // В CreSpsMes идет проверка и, если нужно, подключение должников ПМ
        bIsSpsWrkMes := true;

        with qryObj do begin
          nSvKdObj := FieldByName('KdObj').AsInteger;
          DisableControls;
          Next;
          Locate('KdObj', nSvKdObj, []);
          EnableControls;
        end;
      end;
    end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.ShowCreSpsRunning;
begin
  ShowMessage(
    'Создание списка текущего месяца уже запущено пользователем ' +
    gc_AppNmUsr +
    '. Перезапустите приложение через несколько минут.');
end;

//------------------------------------------------------------------------------
function TFormZpMain.CreSpsConfirmed(nPrcY, nPrcM: word): boolean;
begin
  Result := MessageDlg(
    'Первый вход в ' + MesRus(nPrcM) + ' ' +
    IntToStr(nPrcY) + ' г.' + #13#10 +
    'Создать список текущего месяца?:', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.CreLbxMesGod;
var nY, nM, i : word; cMG : string; mListMG : TStringList;
    nCntMesVZad : SmallInt;
begin
  nY := nProcY;
  nM := nProcM;
  nCntMesVZad := 120;
  // Заполнить mListMG месяцами от dDtProc - 36 до dDtProc
  mListMG := TStringList.Create;
  i := nCntMesVZad;
  while i > 1 do begin // продвинуться на N месяцев назад,вычисляя nM и nY
    i := i - 1;
    nM := nM - 1;
    if nM = 0 then begin
      nM := 12;
      nY := nY - 1;
    end;
  end;
  i := 0;              // и теперь на N месяцев вперед, заполняя mListMG
  while i < nCntMesVZad + 12 do begin
    cMG := '';
    if nM < 10 then
      cMG := '0';
    cMG := cMG + IntToStr(nM) + '-' + IntToStr(nY);
    mListMG.Add(cMG);
    Inc(i);
    Inc(nM);
    if nM > 12 then begin
      nM := 1;
      nY := nY + 1;
    end;
  end;
  mListMG.SaveToFile(cDirVids + 'CmboZaMG.lbx');
  mListMG.Free;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.PageControlResize(Sender: TObject);
begin
  if PageControl.Height < 55 then
    PageControl.Height := 55;
  PanelMinutku.Left := dbgrNU.Left +
                       Round((dbgrNU.Width - PanelMinutku.Width) / 2);
  PanelMinutku.Top := dbgrNU.Top +
                       Round((dbgrNU.Height - PanelMinutku.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.FormResize(Sender: TObject);
begin
  StatusBar.Panels[1].Width := Width - 235;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.CheckTblSvSpsPlace;
begin
  with tblSvSpsPlace do begin
    if Active then Close;
    DataBaseName := cDirInd;
    if not Exists then CreateTable;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.OpenQrySps(nKdSpsUsr : SmallInt);
var nSvTabN : integer;
begin
  nSvTabN := 0;
  with qrySps do begin
    if Active then begin
      nSvTabN := FieldByName('TabN').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataSource := dsrcObj;
    DataBaseName := CESMAIN;
    SQL.Add('Select sps.*, ip.*, upi.Fam, upi.Ima, upi.Otch, ' +
            ' upi.ID, upi.Pol, upi.LastDtPrm, upi.LastDtUvl ' +
            ' from Z_Sps_By_Sps (:dDtProc, :KdObj, :nKdSps) sps ' +
            ' Left outer join z_IsPrmUvEvent(sps.TabN, sps.DtProc, ' +
            ' :dDtEndMes) ip on 1 = 1 ' +
            ' Left outer join Z_Upi upi on upi.TabN = sps.TabN ');
    if popSpsSortByTabN.Checked then
      SQL.Add(' order by TabN')
    else
      Sql.Add(' order by Fam, Ima, Otch');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ParamByName('dDtEndMes').AsDateTime := dDtLastProcMes;
    ParamByName('nKdSps').AsInteger := gl_nAppKdSpsUsr;
    Open;
    if nSvTabN <> 0 then
      Locate('TabN', nSvTabN, []);
  end;
end;

//------------------------------------------------------------------------------
function TFormZpMain.CurMnthListExists: Boolean;
begin
  TQryUtils.InitQuery(QryTmp);

  with QryTmp do begin
    SQL.Add(
      'select count(*) Cnt ' +
      'from z_Sps ' +
      ' where DtProc = :DtProc ');
    ParamByName('DtProc').AsDateTime := dDtProc;
    Open;

    Result := FieldByName('Cnt').AsInteger > 0;
  end;

  TQryUtils.ReleaseQuery(QryTmp);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.RefreshSps;
var
  SavedEmplId: Integer;
  Date: TDate;
begin
  with QrySps do begin
    SavedEmplId := FieldByName('TabN').AsInteger;

    Close;
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ParamByName('dDtEndMes').AsDateTime := TDateUtils.EndOfMonth(dDtProc);
    Open;

    if RecordCount = 0 then begin
      if not CurMnthListExists and (dDtProc = dCtrlDate) then begin
        Date := DateUtils.Decode(dDtProc);

        with Date do
        if CreSpsConfirmed(Year, Mnth) then
          TFrmCreMnthList.CreSpsMes(Year, Mnth); {Z_CreSps}
      end;
    end;

    if SavedEmplId <> 0 then
      Locate('TabN', SavedEmplId, []);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.ZplDisplayHint(Sender: TObject);
begin
  StatusBar.Panels[1].Text := GetLongHint(Application.Hint);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.DelTmpFiles;
var SR : TSearchRec; cMask : string;
begin
  if bFlagDbg then
    Exit;
  cMask := cDirTemp + '*.*';
  if FindFirst(cMask, faAnyFile, SR) = 0 then begin
    repeat
      DeleteFile(cDirTemp + SR.Name);
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;
(*
//------------------------------------------------------------------------------
function TFormZpMain.GetComputerName : ShortString;
var mReg : TRegistry;
begin
  Result := '';
  mReg := TRegistry.Create;
  TRY
    mReg.RootKey := HKEY_LOCAL_MACHINE;
    mReg.OpenKey('\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName',
                                                                         false);
    Result := mReg.ReadString('ComputerName');
    if Result = '' then
      Result := 'Не разпознан';
    mReg.CloseKey;
  FINALLY
    mReg.Free;
    inherited;
  END;
end;
*)
//------------------------------------------------------------------------------
procedure TFormZpMain.SetMainMnu;
begin
  // mMnuZpUsersNew.Visible := bFlagDbg; // or (nAppUsrKat < 1);
  // Видим для всех. Каждый редактирует себя.
  mMnuZpUsersNew.Visible := true;
  mMnuZpKdSps.Visible    := bFlagDbg; // or (nAppUsrKat < 1);
  mMnuZpRkvzt.Visible    := bFlagDbg; // or (nAppUsrKat < 1);
  mMnuRaznoe.Visible     := bFlagDbg; // or (nAppUsrKat < 1);
  mMnuIndxNach.Enabled   := false; //(nAppUsrLvl = 0) or bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetDbgrOtklColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrOtkl.Columns.Count-1 do begin
    with dbgrOtkl.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'MYNOTES') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetDbgrPereColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrPere.Columns.Count-1 do begin
    with dbgrPere.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SPEC_NR') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetDbgrNadbColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrNadb.Columns.Count-1 do begin
    with dbgrNadb.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SPEC_NR') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetDbgrUdrgColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrUdrg.Columns.Count-1 do begin
    with dbgrUdrg.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SPEC_NR') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetDbgrNUColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrNU.Columns.Count-1 do begin
    with dbgrNU.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'MYNOTES')
          or (cUpper = 'NOTES') or (cUpper = 'SPEC_NR') then
        Visible := bFlagDbg
      else if (cUpper = 'SUMMA') then
        Visible := popNuVidSummOne.Checked
      else if (cUpper = 'SMN') or (cUpper = 'SMU') then
        Visible := popNuVidSummTwo.Checked;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetDbgrNu2Columns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrNu2.Columns.Count-1 do begin
    with dbgrNu2.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SUMMA') then
        Visible := popNu2VidSummOne.Checked
      else if (cUpper = 'SMN') or (cUpper = 'SMU') then
        Visible := popNu2VidSummTwo.Checked;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetNow;
var nY, nM, nD : word;
begin
  // Определиться, где находимся по времени и установить nCtrlGod и nCtrlMes
  DecodeDate(Date, nY, nM, nD);
  
  if nD >= nDayPerehoda then begin // перевалили за nDayPerehoda
    nCtrlGod := nY;
    nCtrlMes := nM; end
  else begin   // еще не перевалили в новый месяц (число меньше nDayPerehoda)
    nM := nM - 1;
    if nM = 0 then begin
      nM := 12;
      nY := nY - 1;
    end;
    nCtrlGod := nY;
    nCtrlMes := nM;
  end;

  dCtrlDate := EncodeDate(nCtrlGod, nCtrlMes, 1);
  nProcY := nCtrlGod;
  nProcM := nCtrlMes;
  dDtProc := EncodeDate(nCtrlGod, nCtrlMes, 1);
  dDtLastProcMes := myLastDOM(dDtProc + 27);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.StaticMnthYearDblClick(Sender: TObject);
var
  ThisMnth: TDateTime;
begin
  ThisMnth := TDateUtils.ThisMonth;

  if ThisMnth <> dDtProc then
    ChangeProcMnth(ThisMnth);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popMyChangeMYClick(Sender: TObject);
var
  Date : TDateTime;
begin
  Date := dDtProc;

  if VuborRMes(Date) {Z_VbRMes} then begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    ChangeProcMnth(Date);
    Screen.Cursor := crDefault;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnMMinusClick(Sender: TObject);
begin
  ChangeProcMnth(TDateUtils.PrevMonth(dDtProc, 1));
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnYMinusClick(Sender: TObject);
begin
  ChangeProcMnth(TDateUtils.PrevMonth(dDtProc, 12));
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnMPlusClick(Sender: TObject);
begin
  ChangeProcMnth(TDateUtils.NextMonth(dDtProc, 1));
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnYPlusClick(Sender: TObject);
begin
  ChangeProcMnth(TDateUtils.NextMonth(dDtProc, 12));
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.ChangeProcMnth(NewProcDate: TDateTime);
var
  SavedEmplId, SavedDeptId: integer;
  Date: TDate;
  RunDate: TDateTime;
begin
  RunDate := TDateUtils.ThisMonth;

  if NewProcDate > RunDate then begin
    MessageDlg(GetMsgPerehoda(0), mtWarning, [mbOk], 0);
    Exit;
  end;

  Date := DateUtils.Decode(NewProcDate);

  if (Date.Mnth < nMesBegRabotu) and (Date.Year = nGodBegRabotu) or
      (Date.Year < nGodBegRabotu) then begin
    ShowMessage('Ниже нельзя - начало работы с ' +
      MesRod(nMesBegRabotu) + ' ' + IntToStr(nGodBegRabotu) + ' г.');
    Exit;
  end;

  SavedEmplId := QrySps.FieldByName('TabN').AsInteger;
  SavedDeptId := QrySps.FieldByName('KdObj').AsInteger;

  dDtProc := NewProcDate;
  dDtLastProcMes := myLastDOM(dDtProc + 27); // ???

  nProcY := Date.Year;
  nProcM := Date.Mnth;

  if bIsFormCheckNu then
    FormCheckNu.Close;

  QrySps.DisableControls;

  RefreshSps;
  DisplayProcMnthInfo;

  if LockedEmplId <> 0 then begin
    if LockedEmplId <> QrySpsTabN.AsInteger then
      FindLockedEmplId;
  end else
    LocateEmployeeInMnth(
      SavedEmplId, SavedDeptId, NewProcDate);

  QrySps.EnableControls;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.FindLockedEmplId;
var
  DeptId: SmallInt;
  Msg: ShortString;
begin
    DeptId := GetEmplDeptId(LockedEmplId, dDtProc);

    if DeptId = 0 then begin
      Msg := 'Сотрудник ' + LockedEmplName +
        ' ТабНр ' + IntToStr(LockedEmplId) +
        ' в списке текущего месяца отсутствует. Продолжать помнить?';

      if MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        LockEmployee(false);
    end;

    if BtnLockEmpl.Down and (DeptId <> 0) then begin
      if (DeptId <> QryObjKdObj.AsInteger) then
        MyTVLocateKdObj(DeptId);

      QrySps.Locate('TabN', LockedEmplId, []);
    end;
//  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.LocateEmployeeInMnth(
  EmplId, DeptId: integer;
  Mnth: TDateTime);
var
  Qry: TQuery;
begin
  with QrySps do begin
    if not Locate('TabN;KdObj', VarArrayOf([EmplId, DeptId]), []) then begin
      Qry := TQryUtils.PeekSps(EmplId, Mnth);
      if Qry <> nil then begin
        DeptId := Qry.FieldByName('KdObj').AsInteger;
        Qry.Free;
      end;
    end;

    QryObj.Locate('KdObj', DeptId, []);
    Locate('TabN', EmplId, []);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popMYPopup(Sender: TObject);
var nY, nM, nD : word;
begin
  DecodeDate(dDtProc, nY, nM, nD);
  if (nY = nCtrlGod) and (nM = nCtrlMes) then
    popMyWorkMY.Enabled := false
  else
    popMyWorkMY.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popMyWorkMYClick(Sender: TObject);
begin
  StaticMnthYearDblClick(Self);
end;

//------------------------------------------------------------------------------
function TFormZpMain.GetEmplDeptId(
  EmplId: Integer;
  DtProc: TDateTime): SmallInt;
begin
  Result := 0;
  TQryUtils.InitQuery(QryTmp);
  
  with QryTmp do begin
    SQL.Add(
      'select * ' +
      'from Z_Sps ' +
      'where TabN = :TabN and DtProc = :DtProc');
    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := DtProc;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('KdObj').AsInteger;
  end;
  
  TQryUtils.ReleaseQuery(QryTmp);
end;

//------------------------------------------------------------------------------
function TFormZpMain.GetMsgPerehoda(nCase : word) : string;
var nGodPerehoda, nMesPerehoda : word;
begin
  nGodPerehoda := nCtrlGod;
  nMesPerehoda := nCtrlMes + 1;
  if nMesPerehoda >= 13 then begin
    nMesPerehoda := 1;
    nGodPerehoda := nCtrlGod + 1;
  end;
  if nCase = 0 then
    Result := 'Переход в новый месяц с ' +
                DateToStr(EncodeDate(nGodPerehoda, nMesPerehoda, nDayPerehoda))
  else
    Result := 'Переход в ' + MesRus(nMesPerehoda) + ' ' +
                IntToStr(nGodPerehoda) + ' с ' +
                DateToStr(EncodeDate(nGodPerehoda, nMesPerehoda, nDayPerehoda));
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnCloseClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsPopup(Sender: TObject);
var
  bPopItemsEnabled, bQrySpsReady,
  bNotMonthClosed: Boolean;
begin
  if (qrySps.RecordCount > 0) then
    bNotMonthClosed := not MonthClosed(qrySpsTabN.AsInteger)
  else
    bNotMonthClosed := not MonthClosed(0);
  bQrySpsReady := qrySps.Active and (qrySps.RecordCount > 0);
  bPopItemsEnabled := bNotMonthClosed and
                        (DmMain.InCtrlMes or bFlagDbg) and (qryObj.RecordCount <> 0);
  popSpsRaschetCurrent.Enabled := bNotMonthClosed and
                                             bPopItemsEnabled and bQrySpsReady;
  popSpsRaschetPotokom.Enabled := bNotMonthClosed and
                                                  popSpsRaschetCurrent.Enabled;
  popSpsRaschetPotokomCurObj.Enabled := bNotMonthClosed and
                     popSpsRaschetCurrent.Enabled  and (qrySps.RecordCount > 1);
  popSpsRaschetPotokomAllSps.Enabled := bNotMonthClosed and bPopItemsEnabled;

  popSpsAllSpsFromCurrentObj.Enabled := bNotMonthClosed and DmMain.InCtrlMes and
                                                       (qrySps.RecordCount > 0);
  popSpsAddInUpiAndSps.Enabled := bNotMonthClosed and bPopItemsEnabled and
                                                      not qryObjHsCh.AsBoolean;
  popSpsAddFromUpi.Enabled := bNotMonthClosed and bPopItemsEnabled and
                                                      not qryObjHsCh.AsBoolean;
  popSpsDel.Enabled := bNotMonthClosed and bQrySpsReady and
                          ((qrySpsKdSps.AsInteger = gl_nAppKdSpsUsr) or bFlagDbg);
  popSpsMov.Enabled := bNotMonthClosed and
                                    (popSpsDel.Enabled or (gl_nAppKdSpsUsr = 1));
  if qryObj.Active and not qryObjKdObj.IsNull then
    popSpsAddInUpiAndSps.Caption :=
                              'Добавить нового в спр-к и в список подразд. ' +
                                                         qryObjKdObj.AsString;
  popSpsHistory.Enabled := qrySps.Active and (qrySps.RecordCount > 0) and
                                   (qrySps.FieldByName('KdObj').AsInteger =
                                    qrySps.FieldByName('OldKdObj').AsInteger);
  popSpsMyCheckNu.Enabled := popSpsHistory.Enabled;
  popSpsInclInKdSps.Enabled := bNotMonthClosed and qrySps.Active and
                                      not qryObjHsCh.AsBoolean and
                                                       (qrySps.RecordCount > 0);
  popSpsBlockSchetCurrent.Visible := bFlagDbg or (nAppUsrLvl = 0);
  popSpsBlockSchetCurrent.Enabled := DmMain.InCtrlMes;
  if qrySpsNCH.AsString = 'Z' then
    popSpsBlockSchetCurrent.Caption := '*** Разблокировать расчет сотрудника'
  else
    popSpsBlockSchetCurrent.Caption := '*** Заблокировать расчет сотрудника';
  popSpsBlockSchetCurrent.Enabled := not qryObjHsCh.AsBoolean;

  nSpsRepair.Visible := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsInclInKdSpsClick(Sender: TObject);
var nTabN, nKdObj : integer; cFamIO : ShortString; dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  nTabN := qrySpsTabN.AsInteger;
  nKdObj := qrySpsKdObj.AsInteger;
  cFamIO := qrySpsFamIO.AsString;
  if InclInKdSps(nTabN, nKdObj, dDtPrc, cFamIO) {z_InSps} then
    OpenQrySps(gl_nAppKdSpsUsr);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popCreMesClick(Sender: TObject);
var nSvTabN : integer;
begin
  if MessageDlg('При создании списка удаляются все записи текущего месяца' +
                #13#10 + 'из файла начислений / удержаний. ' +
                'Создавать новый список?:', mtWarning,
                                               [mbYes, mbNo], 0) <> mrYes then
    Exit;
  nSvTabN := 0;
  TFrmCreMnthList.CreSpsMes(nProcY, nProcM);        {Z_CreSps}
  with qrySps do begin
    if Active then begin
      nSvTabN := FieldByName('TabN').AsInteger;
      Close;
    end;
    Open;
    if nSvTabN <> 0 then
      Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsAddInUpiAndSpsClick(Sender: TObject);
var nKdObj, nKdKatP, nNewTabN : integer; n_KdSps : SmallInt;
    cLogMsg : string; bAddInSps : boolean; bGoToTabN : boolean;
    cCode,cZ_Kpp : ShortString;

begin
  nKdObj := PTreeRec(TvObj.Selected.Data)^.KdObj;
  nKdKatP := 0;
  bAddInSps := true;
  nNewTabN := 0;
  with DmMain.qryUpi do begin
    if not Active then
      ExtOpenQryUpi; {экстренное открытие из z_TUpi}
    Append;                          {z_eUpiA}
    n_KdSps := gl_nAppKdSpsUsr;
    FieldByName('UkrCitiz').AsString := 'Y';
    if TFormUpiAdd.AddUpi(DmMain.qryUpi, nKdObj, nKdKatP, nNewTabN, bAddInSps, true,
                              cCode, cZ_Kpp, bGoToTabN) {z_eUpiA} then begin
      Application.ProcessMessages;
      // Post; Не нужно - сделается в AddInUpi_3
      DmMain.SetUpdTblMsg('Z_UPI', nAppKdUsr, nUpiUpdNR);
      // TYTYT внести сведения в DbLog о новом событии TYTYTYT
      if bAddInSps then begin
        AddNewInSps(dDtProc, nNewTabN, nKdObj, nKdKatP, n_KdSps);
        qrySps.DisableConstraints;
        qrySps.Close;
        qrySps.Open;
        qrySps.Locate('TabN', nNewTabN, []);
        qrySps.EnableConstraints;
      end;
      cLogMsg := 'TabN = ' + IntToStr(nNewTabN) + '. Добавлен в справочник ' +
                           'и в список подразд. ' + IntToStr(nKdObj);
      DmMain.AddLog(Now, nNewTabN, 'Ввод сотр.', gc_AppNmUsr, 'Z_UPI', cLogMsg);
      end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.AddNewInSps(dDtProc : TDateTime;
                        nNewTabN, nKdObj, nKdKatP : integer; nKdSps : SmallInt);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Sps (KdSps, DtProc, TabN, KdObj, KdKatP, OldKdObj) ' +
            ' values (:nKdSps, :dDtProc, :nTabN, :nKdObj, :nKdKatP, :nKdObj)');
    ParamByName('nKdSps').AsInteger   := gl_nAppKdSpsUsr;
    ParamByName('nTabN').AsInteger    := nNewTabN;
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ParamByName('nKdObj').AsInteger   := nKdObj;
    ParamByName('nKdKatP').AsInteger  := nKdKatP;
    ExecSQL;
    // На случай, если уже есть в Z_SPS с другим OldKdObj, исправить
    // везде OldKdObj на nKdObj
    SQL.Clear;
    SQL.Add('Update Z_SPS set OldKdObj = :nKdObj where TabN = :nTabN and ' +
            ' DtProc = :dDtProc');
    ParamByName('nTabN').AsInteger  := nNewTabN;
    ParamByName('nKdObj').AsInteger := nKdObj;
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsAddFromUpiClick(Sender: TObject);
var nCurKdObj, nSvKdObj, nTabN, nKdObj, nKdKatP : integer;
    nKdSps : SmallInt; bWasUpdated : boolean;
begin
  nTabN  := 0;
  nKdKatP := 0;
  bWasUpdated := false;
  nSvKdObj := qryObjKdObj.AsInteger;
  nCurKdObj := qryObjKdObj.AsInteger;
  if GetFromUpiToSps(nTabN, nKdObj, nKdKatP, nKdSps,
                                             bWasUpdated) {z_TUpi} then begin
    // добавить нужно в тот Obj, с которого кликнули, с тем KdKatP,
    // который у него в последней по отношении к текущему месяцу записи в Z_Pere
    // Поэтому KdObj в AddNewInSps нужно передать
    AddNewInSps(dDtProc, nTabN, nCurKdObj, nKdKatP, nKdSps);
    with dbgrSps.DataSource.DataSet as TQuery do begin
      Close;
      if nCurKdObj <> nSvKdObj then
        qryObj.Locate('KdObj', nCurKdObj, []);
      Open;
      Locate('TabN', nTabN, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsDelClick(Sender: TObject);
var bIsInOtkl, bIsInNU, bIsDouble, bEof : boolean;
    cMsg, cLogMsg : string; nSvNR, nTabN : integer;
    dDtPrc : TDateTime;
    cFamIO : ShortString;
begin
  nTabN := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  dDtPrc := dbgrSps.DataSource.DataSet.FieldByName('DtProc').AsDateTime;
  cFamIO := dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString;
  with qryTmp do begin     // На случай, если удаляется каким-либо
    if Active then Close;  // образом возникший дубль ТабНр-ов:
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select count( * ) as CNT from z_Sps where TabN = :nTabN and ' +
             ' DtProc = :dDtPrc and KdSps = :nKdSps');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nKdSps').AsInteger := gl_nAppKdSpsUsr;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    bIsDouble := FieldByName('CNT').AsInteger > 1;
    Close;
    SQL.Clear;
    if bIsDouble then begin // отключить триггер, удаляющий записи в НУ и ОТКЛ
      SQL.Add('Alter trigger ZSPS_BD inactive');
      ExecSQL;
      SQL.Clear;            // и молча удалить запись (по NR, а не TabN)
      SQL.Add('Delete from z_Sps where (NR = :nNR)');
      ParamByName('nNR').AsInteger :=
               dbgrSps.DataSource.DataSet.FieldByName('NR').AsInteger;
      ExecSQL;
      SQL.Clear;
      SQL.Add('Alter trigger ZSPS_BD active');
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
      OpenQrySps(gl_nAppKdSpsUsr);
      Exit;     // и выхожу
    end;
  end;
  bIsInOtkl := (dbgrOtkl.DataSource.DataSet.RecordCount > 0);
  bIsInNu := (dbgrNU.DataSource.DataSet.RecordCount > 0);
  cMsg := '';
  if bIsInOtkl or bIsInNu then begin
    cMsg := 'В ';
    if bIsInOtkl then
      cMsg := cMsg + 'отклонениях ';
    if bIsInOtkl and bIsInNu then
      cMsg := cMsg + 'и в ';
    if bIsInNu then
      cMsg := cMsg + 'начислениях ';
    cMsg := cMsg + 'будут удалены ' +
            'все записи,' + #13#10 + 'относящиеся к сотруднику ' + cFamIO +
            '!   Согласны?:';
    if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) <> mrYes then
      Exit; end
  else if MessageDlg('Сотрудник ' +
                 dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString +
                 ' ТабНр ' +
                 dbgrSps.DataSource.DataSet.FieldByName('TabN').AsString +
             ' безвозвратно удаляется из списка текущего месяца!   Согласны?:',
                                      mtWarning, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from z_Sps where (NR = :nNR)');
    ParamByName('nNR').AsInteger :=
               dbgrSps.DataSource.DataSet.FieldByName('NR').AsInteger;
    ExecSQL;    // Остальное доделает триггер
    SQL.Clear;
    DataBaseName := '';
  end;
  cLogMsg := 'TabN = ' + IntToStr(nTabN) + ', DtProc = ' + DateToStr(dDtPrc) +
             ' ' + cFamIO + ', Удаление из списка за ' +
             Copy(DateToStr(dDtPrc),4,7);
  DmMain.AddLog(Now, nTabN,
                        'Удаление из Z_SPS', gc_AppNmUsr, 'Z_SPS', cLogMsg);
  with dbgrSps.DataSource.DataSet as TQuery do begin
    bEof := false;
    nSvNR := 0;
    DisableControls;
    Next;
    if Eof then
      bEof := true
    else
      nSvNR := FieldByName('NR').AsInteger;
    Close;
    Open;
    EnableControls;
    if bEof then
      Last
    else
      Locate('NR', nSvNR, []);
  end;
  if (dbgrSps.DataSource.DataSet.RecordCount = 0) and
                                   popTvObjVidOnly.Checked then
    // Переоткрыть TvObj, чтобы ушло пустое подразделение
    CreTvObj_FromTable(nAppKdUsr, gl_nAppKdSpsUsr);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrPereEditButtonClick(Sender: TObject);
var cUpperFieldName, cNmShPdn, cShShPdN,
    cNmOpl, cShKatPers, cNmKatPers, cSchBU{, cPSch} : string;
    nKdShPdn, nKdOpl, nKdKatPers : integer; {bHsCh : boolean;}
begin
  with dbgrPere do begin
    cUpperFieldName := UpperCase(SelectedField.FieldName);
    if cUpperFieldName = 'NMSHPDN' then begin
      nKdShPdn := DataSource.DataSet.
                             FieldByName('PdNlg').AsInteger;
      if GetShPdN(nKdShPdn, cNmShPdN, cShShPdN) then begin  {Z_GtPdn}
        if not (DataSource.DataSet.
                              State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('PdNlg').AsInteger := nKdShPdn;
      end; end
    else if cUpperFieldName = 'NMSO' then begin
      nKdOpl := DataSource.DataSet.FieldByName('SO').AsInteger;
      if GetSysOpl(nKdOpl, cNmOpl) then begin     {Z_GtOpl}
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('SO').AsInteger := nKdOpl;
      end; end
    else if cUpperFieldName = 'SPZ' then begin
      cSchBU := DataSource.DataSet.FieldByName('SPZ').AsString;
(*
      if GetSbu1S(nKdSchBU, cSchBU, cPSch, cNmSchBU) {A_SBU} then begin
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('KdSPZ').AsInteger := nKdSchBU;
      end;
*)
      end
    else if cUpperFieldName = 'SHKATPERS' then begin
      nKdKatPers := DataSource.DataSet.FieldByName('KdKatP').AsInteger;
      if GetKatPers(nKdKatPers, cShKatPers,       {Z_GtPers}
                                        cNmKatPers) then begin
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('KdKatP').AsInteger := nKdKatPers;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpKatPersClick(Sender: TObject);
begin
  Application.ProcessMessages;
  KatPersShowModal;                    {Z_GtPers}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpSysOplClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SysOplShowModal;                     {Z_GtOpl}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpShPdnClick(Sender: TObject);
begin
  Application.ProcessMessages;
  ShPdNShowModal;                      {Z_GtPdn}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpUPIClick(Sender: TObject);
var bWasUpdated, bWasAddInSps : boolean; nSvNr : integer;
begin
  bWasAddInSps := false;  // были ли добавления из Upi в список z_Sps
  Application.ProcessMessages;
  UpiShowModal(0, bWasUpdated, bWasAddInSps);        {Z_TUpi}
  if bWasUpdated then with qrySps do begin
    nSvNr := FieldByName('NR').AsInteger;
    Close;
    Open;
    Locate('NR', nSvNR, []);
  end;
  if bWasAddInSps and popTvObjVidOnly.Checked then
    // переоткрыть TvObj, т.к., возможно, добавилось новое подразделение в z_Sps
    CreTvObj_FromTable(nAppKdUsr, gl_nAppKdSpsUsr);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpTbUdrgClick(Sender: TObject);
begin
  Application.ProcessMessages;
  ShowTabsUderg(dDtProc);              {Z_TbUdrg}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpTbUd2011Click(Sender: TObject);
begin
  Application.ProcessMessages;
  ShowTabsUd2011(dDtProc);              {Z_Tb2011}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpEDaysClick(Sender: TObject);
begin
  Application.ProcessMessages;
  EDaysShowModal;                      {Z_EDays}
  DisplayProcMnthInfo;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.FormActivate(Sender: TObject);
begin
  Application.OnHint := ZplDisplayHint;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.DateFieldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNuDelAllClick(Sender: TObject);
begin
  if popOtkl.PopupComponent = dbgrNU then begin
    if MessageDlg('Удалить начисления и удержания ' +
               dsrcSps.DataSet.FieldByName('FamIO').AsString +
               #13#10 + 'за текущий месяц.      Согласны?:',
               mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Delete from Z_NU where (TabN = :nTabN) and ' +
                ' (ZaMesGod = :dZaMesGod)');
        ParamByName('nTabN').AsInteger :=
                dsrcSps.DataSet.FieldByName('TabN').AsInteger;
        ParamByName('dZamesGod').AsDateTime :=
            DmMain.DsrcPmnts.DataSet.FieldByName('ZaMesGod').AsDateTime;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with DmMain.DsrcPmnts.DataSet do begin
        Close;
        Open;
      end;
    end; end
  else begin
    // для отклонений
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.ChangePmntsSort(Sender: TObject);
begin
  popNuSortByVid.Checked := (Sender = popNuSortByVid)
    or (Sender = popNu2SortByVidN) or (Sender = sBtnSortByVidN);

  popNu2SortByVidN.Checked := popNuSortByVid.Checked;
  sBtnSortByVidN.Down := popNuSortByVid.Checked;

  popNuSortByMes.Checked := not popNuSortByVid.Checked;
  popNu2SortByZaMG.Checked := popNuSortByMes.Checked;
  sBtnSortByZaMG.Down := popNuSortByMes.Checked;

  DmMain.ChangePmntsSort(popNuSortByMes.Checked);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtRLstMeasureItem(Sender: TObject;
                                 ACanvas: TCanvas; var Width, Height: Integer);
begin
  MnuPrtEmplCalcExcl.Enabled :=
    (dbgrSps.DataSource.DataSet.RecordCount > 0) and
    (dbgrNU.DataSource.DataSet.RecordCount > 0) and
    (qrySps.FieldByName('KdObj').AsInteger =
      qrySps.FieldByName('OldKdObj').AsInteger);

  NPrtCalcEmplTxt.Enabled := MnuPrtEmplCalcExcl.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklPopup(Sender: TObject);
var cVidN : ShortString; bNotMonthClosed, bNotCanEdt : boolean;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    bNotMonthClosed := not MonthClosed(qrySpsTabN.AsInteger)
  else
    bNotMonthClosed := not MonthClosed(0);
  cVidN := '';
  if (dbgrOtkl.DataSource.DataSet.RecordCount > 0) then
    cVidN := dbgrOtkl.DataSource.DataSet.FieldByName('VidN').AsString;
  bNotCanEdt := ((cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008')) and
               not dbgrOtkl.DataSource.DataSet.FieldByName('SpecPS').IsNull and
              (dbgrOtkl.DataSource.DataSet.FieldByName('SpecPS').AsInteger > 0);
  popOtklAdd.Enabled := bNotMonthClosed and DmMain.InCtrlMes and
                                (dbgrSps.DataSource.DataSet.RecordCount > 0);
  popOtklEdt.Enabled := bNotMonthClosed and DmMain.InCtrlMes and not bNotCanEdt and
                        (dbgrOtkl.DataSource.DataSet.RecordCount > 0) and
                        (dbgrOtkl.DataSource.DataSet.FieldByName('DtProc').
                                                 AsDateTime = dCtrlDate) and
                                     ((cVidN < '7500') or (nAppUsrLvl <= 0));
  popOtklDel.Enabled := bNotMonthClosed and DmMain.InCtrlMes and
                         (dbgrOtkl.DataSource.DataSet.RecordCount > 0) and
                           ((dbgrOtkl.DataSource.DataSet.FieldByName('DtProc').
                                                 AsDateTime = dCtrlDate) or
                               (cVidN = '8801') or (cVidN = '8802')) and not
                       dbgrOtkl.DataSource.DataSet. {можно только снять сторно}
                                         FieldByName('Storn').AsBoolean;
  if (cVidN > '7500') and (cVidN < '8800') and
                                not (nAppKdUsr in [0, 100, 101, 102, 127]) then
    popOtklDel.Enabled := false;

  popOtklView.Visible := (cVidN > '2400') and (cVidN < '2700')
    and (dbgrOtkl.DataSource.DataSet.FieldByName('DtProc').AsDateTime < dCtrlDate)
    // and (dbgrOtkl.DataSource.DataSet.FieldByName('Storn').AsString <> 'Y')
    and (not dbgrOtkl.DataSource.DataSet.FieldByName('Spec_NR').IsNull)
    and (dbgrOtkl.DataSource.DataSet.FieldByName('Spec_NR').AsInteger > 0);

  popOtklStornOtp_2.Enabled := bNotMonthClosed and DmMain.InCtrlMes;
  popOtklStornNeopl.Enabled := bNotMonthClosed and DmMain.InCtrlMes;
  popOtklPrtRList.Enabled := (dbgrSps.DataSource.DataSet.RecordCount > 0) and
                               (dbgrNU.DataSource.DataSet.RecordCount > 0) and
                                   (qrySps.FieldByName('KdObj').AsInteger =
                                    qrySps.FieldByName('OldKdObj').AsInteger);
  popOtklNewRaschet.Enabled := bNotMonthClosed and DmMain.InCtrlMes and
                                  (dbgrSps.DataSource.DataSet.RecordCount > 0);
  popOtklVidInfo.Enabled := (dbgrOtkl.DataSource.DataSet.RecordCount > 0);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklEdtClick(Sender: TObject);
var nTabN, nSpecNr : integer; cFamIO : ShortString; cLogMsg : string;
    cVidN : string4;
    bShowTabN, bPereschet, bCanUpd, bNotCanEdt : boolean;
    nPrPv : SmallInt;
    bNotMonthClosed : boolean;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    bNotMonthClosed := not MonthClosed(qrySpsTabN.AsInteger)
  else
    bNotMonthClosed := not MonthClosed(0);
  cVidN := dbgrOtkl.DataSource.DataSet.FieldByName('VidN').AsString;
  bNotCanEdt := ((cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008')) and
              not dbgrOtkl.DataSource.DataSet.FieldByName('SpecPS').IsNull and
              (dbgrOtkl.DataSource.DataSet.FieldByName('SpecPS').AsInteger > 0);
  if (not bNotMonthClosed or not DmMain.InCtrlMes or bNotCanEdt or
                         (dbgrOtkl.DataSource.DataSet.RecordCount = 0) or
       (dbgrOtkl.DataSource.DataSet.FieldByName('PrPv').AsInteger = 5) or
       ((dbgrOtkl.DataSource.DataSet.FieldByName('VidN').AsString >= '7500') and
                                         (nAppUsrLvl > 0) and not bFlagDbg))
      and (nAppKdUsr <> 101) then
    Exit;
  nTabN      := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  cFamIO     := dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString;
  bShowTabN  := false;
  bPereschet := false;
  bCanUpd    := true;
  with dbgrOtkl.DataSource.DataSet do begin
    if (FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается редактировать "чужие" отклонения');
      Exit;
    end;
    cVidN := FieldByName('VidN').AsString;
    nSpecNR := FieldByName('Spec_NR').AsInteger;
    nPrPv := FieldByName('PrPv').AsInteger;    // разные случаи ввода отклонений
    if (cVidN = '2602') and (nSpecNR > 0) and (nPrPv <> 7) then begin
      if TFormEDkr.Run(nTabN, cFamIO, nSpecNR,
                           bShowTabN, bCanUpd, bPereschet) {Z_EDkr} then begin
        QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
        if bPereschet then
          popNuRaschet.Click;
      end; end
    else if ((cVidN > '2600') and (cVidN < '2700')) and
                         (nSpecNR > 0) and (nPrPv <> 7) then begin
      if TFormEBln.AddEdtBln(nTabN, cFamIO, nSpecNR,
                           bShowTabN, bCanUpd, bPereschet) {Z_EBln} then begin
        QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
        if bPereschet then
          popNuRaschet.Click;
      end; end
    else if ((cVidN > '2400') and (cVidN < '2450')) {отпускные}
                                 and (nSpecNR > 0) and (nPrPv <> 7) then begin
      if (FieldByName('DtProc').AsDateTime < dCtrlDate) then
        TFormEOtp.AddEdtOtp(nTabN, dDtProc, cFamIO, nSpecNR,          {Z_EOtp}
                                   bShowTabN, bPereschet, false)
      else begin
        if TFormEOtp.AddEdtOtp(nTabN, dDtProc, cFamIO, nSpecNR,          {Z_EOtp}
                                   bShowTabN, bPereschet, bCanUpd) then begin
          QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
          if bPereschet then
            popNuRaschet.Click;
        end;
      end; end
    else if ((cVidN >= '2450') and (cVidN <= '2451')) {отпускные}
       {таких отпускных нет ???}   and (nSpecNR > 0) and (nPrPv <> 7) then begin
      popOtklStornOtp_2Click(Self); end
    else begin
      Edit;                                                    {z_EOtkl}
      if TFormEOtkl.AddEdtOtkl(dbgrOtkl.DataSource, bShowTabN, bPereschet) then begin
        cLogMsg := 'TabN = ' + IntToStr(nTabN) +
                 ', DtProc = ' + FieldByName('DtProc').AsString +
                 ', ZaMesGod = ' + FieldByName('ZaMesGod').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', Chas = ' + FieldByName('Chas').AsString +
                 ', Summa = ' + FieldByName('Summa').AsString;
        Post;
        DmMain.AddLog(Now, nTabN,
                        'Ред. отклонений', gc_AppNmUsr, 'Z_Otkl', cLogMsg);
        QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
        if bPereschet then
          popNuRaschet.Click; end
      else
        Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklViewClick(Sender: TObject);
var nTabN, nSpecNr : integer; cFamIO : ShortString;
    cVidN : string4;
    bShowTabN, bPereschet, bCanUpd : boolean;
    nPrPv : SmallInt;
begin
  nTabN      := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  cFamIO     := dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString;
  bShowTabN  := false;
  bPereschet := true;
  bCanUpd    := false;
  with dbgrOtkl.DataSource.DataSet do begin
    cVidN := FieldByName('VidN').AsString;
    nSpecNR := FieldByName('Spec_NR').AsInteger;
    nPrPv := FieldByName('PrPv').AsInteger; // разные случаи ввода отклонений
    if (cVidN = '2602') and  // декретные
                         (nSpecNR > 0) and (nPrPv <> 7) then
      TFormEDkr.Run(nTabN, cFamIO, nSpecNR,
                            bShowTabN, bCanUpd, bPereschet) {Z_EDkr}
    else if ((cVidN > '2600') and (cVidN < '2700')) and  // больничные
                         (nSpecNR > 0) and (nPrPv <> 7) then
      TFormEBln.AddEdtBln(nTabN, cFamIO, nSpecNR,
                               bShowTabN, bCanUpd, bPereschet) {Z_EBln}
    else if ((cVidN > '2400') and (cVidN < '2450')) // отпускные
                        and (nSpecNR > 0) and (nPrPv <> 7) then
      TFormEOtp.AddEdtOtp(nTabN, dDtProc, cFamIO, nSpecNR,
                               bShowTabN, bPereschet, bCanUpd); {Z_EOtp}
  end;
end;
(*
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklStornOtpClick(Sender: TObject);
var nTabN, nSpec_NR : integer; dDtPrc : TDateTime;
begin
  nTabN := qrySpsTabN.AsInteger;
  nSpec_NR := dbgrOtkl.DataSource.DataSet.FieldByName('Spec_NR').AsInteger;
  dDtPrc := dDtProc;
  if EAOtpStorn(nTabN, nSpec_NR, dDtPrc) {z_EOtpSt} then begin
    ;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklStornOtp_2Click(Sender: TObject);
var nTabN : integer; dDtPrc : TDateTime;
begin
  // Показать отпускные прошлых месяцев и пусть сторнируют;
  nTabN := qrySpsTabN.AsInteger;
  dDtPrc := dDtProc;
  if StornOtp2(nTabN, dDtPrc) {z_OtpSt2} then begin
    ;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.QrySpsRefresh(nTabN : integer);
begin
  with qrySps do begin
    Close;
    Open;
    Locate('TabN', nTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklAddCmnClick(Sender: TObject);
var bCanChangeTabN, bPereschet : boolean;
    nSvNR, nTabN : integer;
    cLogMsg : string;  cSchBU : ShortString;
begin
  bCanChangeTabN := false;
  nTabN  := qrySpsTABN.AsInteger;
  with dbgrOtkl.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;

    Append;
    FieldByName('KdSps').AsInteger := gl_nAppKdSpsUsr; // nKdSps;
    if  gl_nAppKdSpsUsr = 6 then begin  // NICH
      FieldByName('KdObj').AsInteger := qrySpsKDOBJ.AsInteger;
      FieldByName('KdSpZ').AsInteger :=
                       DmMain.GetKdSpZ(qrySpsKDOBJ.AsInteger, cSchBU);
      FieldByName('SchBU').AsString := cSchBU;
      // ТУТУТ не хватает ещё счёта ШПЗ
    end;
    FieldByName('PrPv').AsInteger := 1;
    if TFormEOtkl.AddEdtOtkl(dbgrOtkl.DataSource, bCanChangeTabN,
                                              bPereschet) {z_EOtkl} then begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtProc = ' + FieldByName('DtProc').AsString +
                 ', ZaMesGod = ' + FieldByName('ZaMesGod').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', Chas = ' + FieldByName('Chas').AsString +
                 ', Summa = ' + FieldByName('Summa').AsString;
      Post;
      DmMain.AddLog(Now,nTabN,'Ввод отклонений', gc_AppNmUsr,'Z_Otkl',cLogMsg);
      QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
      if bPereschet then begin
        popNuRaschet.Click;
      end; end
    else begin
      Cancel;
      if nSvNR <> 0 then Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklAddBlnClick(Sender: TObject);
var cFamIO : ShortString; nTabN, nSpecNR : integer;
    bShowTabN, bCanUpd, bPereschet : boolean;
begin
  bShowTabN  := false;
  bPereschet := false;
  bCanUpd    := true;
  cFamIO := dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString;
  nTabN  := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  nSpecNR := 0;
  with dbgrOtkl.DataSource.DataSet do begin
    if TFormEBln.AddEdtBln(nTabN, cFamIO, nSpecNR,
                           bShowTabN, bCanUpd, bPereschet) {Z_EBln} then begin
      QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
      if bPereschet then
        popNuRaschet.Click;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklAddDekrClick(Sender: TObject);
var cFamIO : string; nTabN, nSpecNR : integer;
    bShowTabN, bCanUpd, bPereschet : boolean;
begin
  bShowTabN  := false;
  bPereschet := false;
  bCanUpd    := true;
  cFamIO := dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString;
  nTabN  := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  nSpecNR := 0;
  with dbgrOtkl.DataSource.DataSet do begin
    if TFormEDkr.Run(nTabN, cFamIO, nSpecNR,
                           bShowTabN, bCanUpd, bPereschet) {Z_EDkr} then begin
      QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
      if bPereschet then
        popNuRaschet.Click;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklAddOtpClick(Sender: TObject);
var nTabN, nSpecNR : integer; cFamIO : string;
    bShowTabN, bPereschet, bCanUpd : boolean;
begin
  bShowTabN  := false;
  bPereschet := false;
  bCanUpd    := true;
  nSpecNR    := 0; // Ещё не известен
  nTabN      := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  cFamIO     := dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString;
  with dbgrOtkl.DataSource.DataSet do begin
    if TFormEOtp.AddEdtOtp(nTabN, dDtProc, cFamIO, nSpecNR, bShowTabN, {Z_EOtp}
                                         bPereschet, bCanUpd) then begin
      Application.ProcessMessages;
      QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
      if bPereschet then popNuRaschet.Click;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklDelClick(Sender: TObject);
var cMsg, cMsg2, cLogMsg : string; cVidN : string4; nTabN, nSpecNR : integer;
    nMyResult : word;
    nPrPv : SmallInt;
    nSpecPS, nNrPkt : integer; cFldNrPkt, cZaMgFkt : ShortString;
    dZaMgFkt : TDateTime; nY, nM, nD : word; bPraviPredSps : boolean;
begin
  cLogMsg := '';
  nNrPkt  := 0;
  nSpecPS := 0;
  bPraviPredSps := false;
  with dbgrOtkl.DataSource.DataSet do begin
{
    Пока отключил - потом посмотрим
    if (FieldByName('pBnk').AsInteger = 1) and not bFlagDbg then begin
      ShowMessage('Запись передана в БАНК. Удалять ее нельзя.');
      Exit;
    end;
}
    if (FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается удалять "чужие" отклонения');
      Exit;
    end;
    nTabN   := FieldByName('TabN').AsInteger;
    cVidN   := FieldByName('VidN').AsString;
    nSpecNR := FieldByName('Spec_NR').AsInteger;
    nPrPv   := FieldByName('PrPv').AsInteger; // сигнал о0 "нестандартности" откл.
    if ((cVidN >= '2600') and (cVidN < '2700'))  {больничные и декретные}
                            and (nSpecNR <> 0) and (nPrPv <> 7) then begin

      cMsg := 'Пакет расчёта ';
      if cVidN = '2602' then begin
        cMsg := cMsg + 'декретных';
        cMsg2 := 'Декретные'; end
      else begin
        cMsg := cMsg + 'больничных';
        cMsg2 := 'Больничные';
      end;
      cMsg := cMsg + ' и все созданные им записи в ' +
                     'отклонениях удаляются безвозвратно.        Согласны?:';
      if myMsgDlg(cMsg2, cMsg, 1, nMyResult) {z_MsgDlg} then begin
        Application.ProcessMessages;
        with qryTmp do begin
          if Active then Close;
          SQL.Clear;
          DataBaseName := CESMAIN;
          SQL.Add('Select * from Z_VBln where (Spec_NR = :nSpecNr)');
          ParamByName('nSpecNr').AsInteger := nSpecNR;
          Open;
          if RecordCount > 0 then begin
            cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                       ', DtProc = ' + FieldByName('DtProc').AsString +
                       ', DtBeg = ' + FieldByName('DtBeg').AsString +
                       ', NrList = ' + FieldByName('NrList').AsString +
                       ', DtList = ' + FieldByName('DtList').AsString +
                       ', VidN = ' + FieldByName('VidN').AsString +
                       ', SmSrdn = ' + FieldByName('SmSrdn').AsString +
                       ', SmBln = ' + FieldByName('SmBln').AsString;
          end;
          Close;
          SQL.Clear;
          SQL.Add('Delete from Z_VBln where (Spec_NR = :nSpecNr)');
          ParamByName('nSpecNr').AsInteger := nSpecNR;
          ExecSQL;          // Из Z_RBln и из Z_Otkl удалит
          SQL.Clear;        // триггер ZVBln_BD (Before Delete)
          DataBaseName := '';
        end;
        if cLogMsg > '' then  //Не переносить отсюда - используется только что
          DmMain.AddLog(Now, nTabN, 'Удаление больничных', gc_AppNmUsr,
                                   'Z_vBln', cLogMsg);// освободившийся qryTmp
        QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
      end;
      if nMyResult > 1 then
        popNuRaschet.Click; end                                      {отпускные}
    else if ((cVidN >= '2400') and (cVidN < '2500')) and (nSpecNR > 0) and
                                              (nPrPv <> 7) then begin
      cMsg := 'Пакет расчета отпускных и созданные им записи в отклонениях ' +
                                     'удаляются безвозвратно.      Согласны?:';
      if myMsgDlg('Отпускные', cMsg, 1, nMyResult) {z_MsgDlg} then begin
        DeleteVOtp(nTabN, nSpecNr);
        {
        Application.ProcessMessages;
        with qryTmp do begin
          if Active then Close;
          SQL.Clear;
          DataBaseName := CESMAIN;
          SQL.Add('Select * from Z_VOtp where (Spec_NR = :nSpecNr)');
          ParamByName('nSpecNr').AsInteger := nSpecNR;
          Open;
          if RecordCount > 0 then begin
            cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                       ', DtProc = ' + FieldByName('DtProc').AsString +
                       ', DtBeg = ' + FieldByName('DtBeg').AsString +
                       ', NrPrik = ' + FieldByName('NrPrik').AsString +
                       ', DtPrik = ' + FieldByName('DtPrik').AsString +
                       ', VidN = ' + FieldByName('VidN').AsString +
                       ', SmSrdn = ' + FieldByName('SmSrdn').AsString +
                       ', SmOtp = ' + FieldByName('SmOtp').AsString;
          end;
          Close;
          SQL.Clear;
          SQL.Add('Delete from Z_VOtp where (Spec_NR = :nSpecNr)');
          ParamByName('nSpecNr').AsInteger := nSpecNR;
          ExecSQL;          // Из Z_Rotp и из Z_Otkl удалит
          SQL.Clear;        // триггер ZVOtp_BD (Before Delete)
          DataBaseName := '';
        end;
        if cLogMsg > '' then        //Не переносить отсюда - используется только
          DmMain.AddLog(Now, nTabN, 'Удаление отпускных', // что освободившийся
                              gc_AppNmUsr, 'Z_vOtp', cLogMsg);           // qryTmp
        QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
        }
      end;
      if nMyResult > 1 then
        popNuRaschet.Click; end
    else if ((cVidN = '5005') or (cVidN = '5008')) and (nSpecNR > 0) then begin
      cMsg := 'Запись вида ' +  FieldByName('VidN').AsString +
          ' удаляется безвозвратно. Согласны?:';
      if myMsgDlg('Неоплачиваемый отпуска', cMsg, 1, nMyResult) {z_MsgDlg} then begin
        DeleteVOtp(nTabN, nSpecNR);
      end
    end
    else begin
      nMyResult := 0;
      cMsg := 'Запись с видом ' +  FieldByName('VidN').AsString + ' ' +
                                     FieldByName('ShVidN').AsString;
      if not FieldByName('Summa').IsNull then
        cMsg := cMsg + ' на сумму ' + FieldByName('Summa').AsString;
      cMsg := cMsg + ' удаляется безвозвратно. Согласны?:';
      if myMsgDlg('Отклонения', cMsg, 1, nMyResult) {z_MsgDlg} then begin
        Application.ProcessMessages;
        cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                   ', DtProc = ' + FieldByName('DtProc').AsString +
                   ', ZaMesGod = ' + FieldByName('ZaMesGod').AsString +
                   ', VidN = ' + FieldByName('VidN').AsString +
                   ', Chas = ' + FieldByName('Chas').AsString +
                   ', Summa = ' + FieldByName('Summa').AsString;
        if ((cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008')) and
                               not FieldByName('SpecPS').IsNull and
                               (FieldByName('SpecPs').AsInteger > 0)  then begin
          nNrPkt   := FieldByName('NrVdPv').AsInteger;
          nSpecPS  := FieldByName('SpecPS').AsInteger;
          cZaMgFkt := FieldByName('MyNotes').AsString;
          dZaMgFkt := StrToDate(Copy(cZaMgFkt, 4, 10));
          DecodeDate(dZaMgFkt, nY, nM, nD);
          cFldNrPkt := 'NrPkt_';
          if nM < 10 then
            cFldNrPkt := cFldNrPkt + '0';
          cFldNrPkt := cFldNrPkt + IntToStr(nM);
          bPraviPredSps := true;
        end;
        Delete;
        DmMain.AddLog(Now, nTabN, 'Удаление отклонений', gc_AppNmUsr,
                                                           'Z_Otkl', cLogMsg);
        if (cVidN = '1206') {заДниВКомандировке} and (nSpecNR > 0) then
          UpdKmdRecord(1, nSpecNR);
        if bPraviPredSps then
          UpdPredSps(cFldNrPkt, nNrPkt, nSpecPS);
        QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
        if nMyResult > 1 then
          popNuRaschet.Click;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.DeleteVOtp(nTabN, nSpecNr: integer);
var
  cLogMsg: string;
begin
  Application.ProcessMessages;

  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VOtp where (Spec_NR = :nSpecNr)');
    ParamByName('nSpecNr').AsInteger := nSpecNR;
    Open;
    if RecordCount > 0 then begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtProc = ' + FieldByName('DtProc').AsString +
                 ', DtBeg = ' + FieldByName('DtBeg').AsString +
                 ', NrPrik = ' + FieldByName('NrPrik').AsString +
                 ', DtPrik = ' + FieldByName('DtPrik').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SmSrdn = ' + FieldByName('SmSrdn').AsString +
                 ', SmOtp = ' + FieldByName('SmOtp').AsString;
    end;
    Close;

    SQL.Clear;
    SQL.Add('Delete from Z_VOtp where (Spec_NR = :nSpecNr)');
    ParamByName('nSpecNr').AsInteger := nSpecNR;
    ExecSQL; // Из Z_ROtp удалит триггер ZVOtp_BD (Before Delete)

    // Удаление отклонений данного пакета (тот же spec_nr)
    SQL.Clear;
    SQL.Add('delete from z_otkl where Spec_NR = :nSpecNr');
    ParamByName('nSpecNr').AsInteger := nSpecNR;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;

  if cLogMsg > '' then
    DmMain.AddLog(Now, nTabN, 'Удаление отпускных',
      gc_AppNmUsr, 'Z_vOtp', cLogMsg);
  QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.UpdPredSps(cFldNrPkt: ShortString;
                                                      nNrPkt, nSpecPS: integer);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Z_PredSps set ' + cFldNrPkt + ' = NULL ' +
            ' where ' + cFldNrPkt + ' = :nNrPkt and SpecPS = :nSpecPS');
    ParamByName('nNrPkt').AsInteger  := nNrPkt;
    ParamByName('nSpecPS').AsInteger := nSpecPS;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.UpdKmdRecord(nKmdKdRsh: SmallInt; nSpecNR: integer);
begin
  with qryTmp do begin  {к этому моменту qryTmp свободно}
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update K_OPL set Spec_NrZp = NULL ' +
            ' where Spec_NrZp = :nSpecNR and KdRsh = :nKmdKdRsh');
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    ParamByName('nKmdKdRsh').AsInteger := nKmdKdRsh;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNuPopup(Sender: TObject);
var bNotMonthClosed : boolean;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    bNotMonthClosed := not MonthClosed(qrySpsTabN.AsInteger)
  else
    bNotMonthClosed := not MonthClosed(0);

  popNuRs2Dbg.Enabled := (dbgrSps.DataSource.DataSet.RecordCount > 0);
  popNuRaschet.Enabled := bNotMonthClosed and DmMain.InCtrlMes and
                                 (((nAppUsrKat = 0) or (nAppUsrKat = 1)) and
                                 (dbgrSps.DataSource.DataSet.RecordCount > 0));

  PopNuPrintEmplCalc.Enabled := (dbgrSps.DataSource.DataSet.RecordCount > 0);

  popNuPastMonths.Enabled := PopNuPrintEmplCalc.Enabled;
  popNuMyCheckNu.Enabled  := PopNuPrintEmplCalc.Enabled;
  popNuVidInfo.Enabled    := dbgrNu.DataSource.DataSet.RecordCount > 0;
  popNuForMO.Enabled      := dbgrNu.DataSource.DataSet.RecordCount > 0;
  popNuClearMetki.Enabled := LbxF8.Items.Count > 0;
  popNuSumByMetki.Enabled := LbxF8.Items.Count > 1;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNu2Popup(Sender: TObject);
var
  bNotMonthClosed : boolean;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    bNotMonthClosed := not MonthClosed(qrySpsTabN.AsInteger)
  else
    bNotMonthClosed := not MonthClosed(0);
    
  popNu2RschNewWithDbg.Visible := bFlagDbg;
  popNu2RschNewWithDbg.Enabled := DmMain.InCtrlMes
    and (dbgrSps.DataSource.DataSet.RecordCount > 0);

  popNu2Raschet.Enabled := bNotMonthClosed and DmMain.InCtrlMes
    and ((nAppUsrKat = 0) or (nAppUsrKat = 1))
    and (dbgrSps.DataSource.DataSet.RecordCount > 0);

  PopNu2PrintEmplCalc.Enabled := (dbgrSps.DataSource.DataSet.RecordCount > 0)
    and (qrySps.FieldByName('KdObj').AsInteger =
      qrySps.FieldByName('OldKdObj').AsInteger);

  popNu2PastMonths.Enabled := PopNu2PrintEmplCalc.Enabled;
  popNu2MyCheckNu.Enabled  := PopNu2PrintEmplCalc.Enabled;
  popNu2VidInfo.Enabled    := dbgrNu2.DataSource.DataSet.RecordCount > 0;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.PrintEmplCalc(Sender: TObject);
begin
  with dbgrSps.DataSource.DataSet do
  if RecordCount = 0 then
    MessageDlg('Нет начислений у текущего сотрудника', mtInformation, [mbOk], 0)
  else
    if (Sender = MnuPrtEmplCalcExcl)
        or (Sender = PopNuPrintEmplCalc)
        or (Sender = PopNu2PrintEmplCalc) then
      CalcList.PrtEmplExcel(dDtProc,
        FieldByName('TabN').AsInteger, FieldByName('FamIO').AsString)
    else
      CalcList.PrtEmplText(dDtProc,
        FieldByName('TabN').AsInteger, FieldByName('FamIO').AsString);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.PrintDeptCalc(Sender: TObject);
var
  DeptId: Integer;
  NoRecords: Boolean;
begin
  DeptId := QryObj.FieldByName('KdObj').AsInteger;

  TQryUtils.InitQuery(qryTmp);

  with qryTmp do begin
    SQL.Add(
      'select count(*) as Cnt ' +
      'from Z_NU ' +
      'where KdObj = :KdObj and DtProc = :DtProc');

    ParamByName('KdObj').AsInteger   := DeptId;
    ParamByName('DtProc').AsDateTime := dDtProc;
    Open;

    NoRecords := FieldByName('Cnt').AsInteger = 0;
  end;

  TQryUtils.ReleaseQuery(qryTmp);

  if NoRecords then
    ShowMessage('Нет начислений по текущему подразделению')
  else if Sender = MnuPrtDeptCalcExcl then
    CalcList.PrtDeptExcel(dDtProc, QrySps)
  else if Sender = NPrtCalcDeptTxt then
    CalcList.PrtDept(DeptId, dDtProc, QrySps)
  else if Sender = NPrtCalcDept2Copies then
    CalcList.PrtDept2Copies(DeptId, dDtProc, QrySps)
  else
end;

//------------------------------------------------------------------------------
// Печать расчётных листков всего предприятия
//------------------------------------------------------------------------------
procedure TFormZpMain.PrintEntprCalc(Sender: TObject);
var
  NoRecords, PrintToExcel: Boolean;
  Msg: ShortString;
begin
  TQryUtils.InitQuery(qryTmp);

  with qryTmp do begin
    SQL.Add(
      'select count(*) as Cnt ' +
      'from z_Nu ' +
      'where DtProc = :DtProc');

    ParamByName('DtProc').AsDateTime := dDtProc;
    Open;

    NoRecords := FieldByName('Cnt').AsInteger = 0;
  end;

  TQryUtils.ReleaseQuery(qryTmp);

  if NoRecords then
    ShowMessage('Нет начислений в текущем месяце')
  else begin
    PrintToExcel := Sender = MnuPrtEntprCalcExcl;

    if PrintToExcel then
      Msg := 'Excel-файл'
    else
      Msg := 'текстовый файл';

    if MessageDlg(
      'Вывод в ' + Msg + ' расчетных листков для всех подразделений',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
      if PrintToExcel then
        CalcList.PrtEntrpExcel(dDtProc, qryObj, qrySps)
      else if Sender = NPrtCalcEntprTxt then
        CalcList.PrtEntpr(dDtProc, QryObj, QrySps)
      else if Sender = NPrtCalcEntpr2Copies then
        CalcList.PrtEntpr2Copies(dDtProc, QryObj, QrySps);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklNewRaschetClick(Sender: TObject);
var
  nTabN : integer;
  cFamIO : string;
  bFromMainForm, bSvFlagDbg : boolean;
  dDtPrc : TDateTime;
begin
  if qrySps.RecordCount = 0 then
    Exit;

  PanelTotals.Caption := '';
  Application.ProcessMessages;
  bSvFlagDbg := bFlagDbg;
  bFlagDbg := false;
  nTabN  := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  // где-то тут !!!

  cFamIO := dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString;
  dDtPrc := dDtProc;
  Screen.Cursor  := crHourGlass;
  bFromMainForm  := true;

  DmAudit.StartAudit;
  StartRs5(bFromMainForm, nTabN, cFamIO, dDtPrc);
  DmAudit.EndAudit;

  if bIndSchet then with qrySps do begin
    Close;
    Open;
    Locate('TabN', nTabN, []);
  end;
  DmMain.qryOtkl.Close;
  DmMain.qryOtkl.Open;

  with DmMain do begin
    LoadPayments(sBtnShowSpecVids.Down, NuShowMode = snuNewShort);
    ChangePmntsSort(popNuSortByMes.Checked);
  end;
  DisplayEmplInfo;

  if dbgrNu2.Visible then begin
    qryNu2.Close;
    qryNu2.Open;
  end;

  if bIndSchet then
    PanelMinutku.Visible := false;
  Screen.Cursor := crDefault;
  bFlagDbg := bSvFlagDbg;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.RaschDbgClick(Sender: TObject);
var
  EmplId: Integer;
  EmplName: String;
begin
  Screen.Cursor := crHourGlass;
  DmAudit.StartAudit;

  with dbgrSps.DataSource.DataSet do begin
    EmplId := FieldByName('TabN').AsInteger;
    EmplName := FieldByName('FamIO').AsString;
  end;

  if StartRs5(true, EmplId, EmplName, dDtProc) then begin
    DmMain.LoadPayments(sBtnShowSpecVids.Down, NuShowMode = snuNewShort);

    if dbgrNu2.Visible then
      with qryNu2 do begin
        Close;
        Open;
      end;
    DisplayEmplInfo;
  end;

  if bIndSchet then
    PanelMinutku.Visible := false;

  DmAudit.EndAudit;
  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsRaschetPotokomCurObjClick(Sender: TObject);
var
  SvNR, N: Integer;
  Progress: TTimeProgress;
  ElapsedTime, Time: ShortString;
begin
  if qrySps.RecordCount = 0 then
    Exit;

  if MessageDlg('Рассчитать потоком подразделение "' +
    qryObjNmObj.AsString + '"?:', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then begin
    b_SchetPotokom := true;
    bIndSchet := false;
    bStopSchet := false;

    Enabled := false;
    PanelTotals.Caption := '';

    GoMyStop;
    
    FormMyStop.Caption := '  ' + qryObjNmObj.AsString;
    FormMyStop.LabelTime.Caption := '';

    with DbgrSps.DataSource.DataSet do begin
      DisableControls;
      SvNR := FieldByName('NR').AsInteger;
      First;

      DmAudit.StartAudit;

      Progress := TTimeProgress.Create(qrySps.RecordCount);
      ElapsedTime := Progress.GetElapsedTime;

      N := 0;
      Time := '';

      while not Eof do begin
        Inc(N);

        FormMyStop.LabelTime.Caption :=
          'Зап.: ' + IntToStr(N) + ' / ' + IntToStr(qrySps.RecordCount) + '; ' +
          'Время: ' + Time;
        FormMyStop.LabelFIO.Caption := qrySpsFamIO.AsString;
        Application.ProcessMessages;

        popOtklNewRaschetClick(Self);

        with Progress do begin
          ElapsedTime := GetElapsedTime;
          Time := ElapsedTime + ' / ' + GetEstimatedTime(N);
        end;

        // FormMyStop.LabelFIO.Caption := '';
        // Application.ProcessMessages;

        if bStopSchet then
          Break
        else
          Next;
      end;

      DmAudit.EndAudit;
      Progress.Free;

      if not bStopSchet then begin
        FormMyStop.LabelTime.Caption :=
          'Зап.: ' + IntToStr(N) + ' / ' + IntToStr(qrySps.RecordCount) + '; ' +
          'Время: ' + Time;
        Application.ProcessMessages;

        Locate('NR', SvNR, []);

        ShowMessage(
          'Рассчитано сотрудников: ' + IntToStr(N) + '. ' +
          'Время: ' + ElapsedTime
        );
      end;

      EnableControls;
    end;

    Enabled := true;
    FormMyStop.Close;

    bStopSchet := false;
    b_SchetPotokom := false;
    bIndSchet := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsRaschetPotokomAllSpsClick(Sender: TObject);
var
  nTabN, nSvObjNR, nSvSpsNR, DeptCnt, EmplCnt, EmplTotal: Integer;
  Progress: TTimeProgress;
  ElapsedTime, Time: ShortString;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select count( * ) as CNT from z_Sps where dtProc = :dDtProc');
    if (dDtProc >= dDt01012008) then
      SQL.Add(' and KdObj = OldKdObj');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
    EmplTotal := FieldByName('CNT').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;

  if EmplTotal = 0 then begin
    ShowMessage('Список текущего месяца пустой - нечего считать.');
    Exit;
  end;

  if MessageDlg('Рассчитать потоком всех сотрудников?:',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then begin
    with cdsKTn do begin
     if Active then Close;
     CreateDataSet;
     Open;
    end;

    DeptCnt := 0;
    EmplCnt := 0;
    Time := '';

    PanelTotals.Caption := '';
    b_SchetPotokom := true;
    bStopSchet := false;

    GoMyStop;  {z_MyStop}

    nSvObjNR := qryObjNR.AsInteger;
    nSvSpsNR := qrySpsNR.AsInteger;
    bIndSchet := false;
    Enabled := false;

    DmAudit.StartAudit;

    Progress := TTimeProgress.Create(EmplTotal);
    ElapsedTime := Progress.GetElapsedTime;

    with QryObj do begin
      First;

      while not Eof do begin
        Inc(DeptCnt);

        FormMyStop.Caption := '  ' + qryObjNmObj.AsString;
        FormMyStop.LabelFIO.Caption := '';

        QrySps.First;

        while not QrySps.Eof do begin
          nTabN := qrySpsTabN.AsInteger;

          if not cdsKTn.Locate('TabN', nTabN, []) then begin
            Inc(EmplCnt);

            FormMyStop.LabelTime.Caption :=
              'Зап.: ' + IntToStr(EmplCnt) + ' / ' + IntToStr(EmplTotal) +
              '; Время: ' + Time;
            FormMyStop.LabelFIO.Caption := QrySpsFamIO.AsString;
            Application.ProcessMessages;

            //---------------------------
            popOtklNewRaschetClick(Self);   // Расчёт сотрудника

            with Progress do begin
              ElapsedTime := GetElapsedTime;
              Time := ElapsedTime + ' / ' + GetEstimatedTime(EmplCnt);
            end;
            //---------------------------

            cdsKTn.Append;
            cdsKTnTabN.AsInteger := nTabN;
            cdsKTn.Post;
          end;

          if bStopSchet then
            Break
          else
            qrySps.Next;
        end;

        if bStopSchet then
          Break
        else
          Next;
      end;
    end;

    DmAudit.EndAudit;
    Progress.Free;

    Enabled := true;
    b_SchetPotokom := false;
    if not bStopSchet then begin
      FormMyStop.LabelTime.Caption :=
        'Зап.: ' + IntToStr(EmplCnt) + ' / ' + IntToStr(EmplTotal) +
        '; Время: ' + Time;
      Application.ProcessMessages;

      FormMyStop.Close;
      if nSvObjNR <> 0 then
        qryObj.Locate('NR', nSvObjNR, []);
      if nSvSpsNR <> 0 then
        qrySps.Locate('NR', nSvSpsNR, []);

      ShowMessage('Рассчитано подразделений: ' + IntToStr(DeptCnt) +
        ', ' + #13#10 + 'сотрудников: ' + IntToStr(EmplCnt) +
        '. Время: ' + ElapsedTime);
    end;

    cdsKTn.SaveToFile(cDirTemp + 'cdsKTn.cds');
    bStopSchet := false;
    bIndSchet := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsAllSpslFromCurrentObjClick(Sender: TObject);
var nObjAIndx, nSvObjNR, nSvSpsNR, nCntObj, nCntSotr, nCntSotrTt : integer;
    dTimeStart : TDateTime;
    nTabN : integer;
begin
  nObjAIndx := qryObjAIndx.AsInteger;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count(s.NR) CNT from z_Sps s ' +
            ' Left Outer Join z_KdObj ko on ko.KdObj = s.KdObj ' +
            ' where s.DtProc = :dDtProc and ko.AIndx >= :nObjAIndx ');
    ParamByName('dDtProc').AsDateTime  := dDtProc;
    ParamByName('nObjAIndx').AsInteger := nOBjAindx;
    Open;
    nCntSotrTt := FieldByName('CNT').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if nCntSotrTt = 0 then begin
    ShowMessage('Список текущего месяца пустой - нечего считать.');
    Exit;
  end;
  if MessageDlg('Рассчитать потоком все подразделения, начиная с текущего?:',
                          mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     with cdsKTn do begin
       if Active then Close;
       CreateDataSet;
       Open;
     end;
    nCntObj := 0;
    nCntSotr := 0;
    PanelTotals.Caption := '';
    b_SchetPotokom := true;
    bStopSchet := false;

    GoMyStop;  {z_MyStop}
    
    dTimeStart := SysUtils.Time;
    nSvObjNR := qryObjNR.AsInteger;
    nSvSpsNR := qrySpsNR.AsInteger;
    bIndSchet := false;
    Enabled := false;

    DmAudit.StartAudit;

    with qryObj do begin
//      First;
      while not Eof do begin
        Inc(nCntObj);
        FormMyStop.Caption := '  ' + qryObjNmObj.AsString;
        FormMyStop.LabelFIO.Caption := '';
        qrySps.First;
        while not qrySps.Eof do begin
          nTabN := qrySpsTabN.AsInteger;

          if not cdsKTn.Locate('TabN', nTabN, []) then begin


            Application.ProcessMessages;
            FormMyStop.LabelTime.Caption := TimeToStr(SysUtils.Time - dTimeStart);
            FormMyStop.LabelFIO.Caption := IntToStr(nCntSotr+1) +
                                            '/' + IntToStr(nCntSotrTt) +
                                            '  ' + qrySpsFamIO.AsString;
            Application.ProcessMessages;
            //---------------------------
            popOtklNewRaschetClick(Self);
            //---------------------------
            cdsKTn.Append;
            cdsKTnTabN.AsInteger := nTabN;
            cdsKTn.Post;

            end;
            Application.ProcessMessages;
            if bStopSchet then
              Break
            else begin
              Inc(nCntSotr);
              qrySps.Next;
            end;



        end;
        if bStopSchet then
          Break
        else
          Next;
      end;
    end;

    DmAudit.EndAudit;

    Enabled := true;
    b_SchetPotokom := false;
    if not bStopSchet then begin
      FormMyStop.Close;
      if nSvObjNR <> 0 then
        qryObj.Locate('NR', nSvObjNR, []);
      if nSvSpsNR <> 0 then
        qrySps.Locate('NR', nSvSpsNR, []);
    end;
    bStopSchet := false;
    bIndSchet := true;
    cdsKTn.SaveToFile(cDirTemp + 'cdsKTn2.cds');

    if bFlagDbg then
      ShowMessage('Рассчитано подразделений: ' + IntToStr(nCntObj) +
                  ', ' + #13#10 + 'сотрудников: ' + IntToStr(nCntSotr) +
                 '. Время: ' + TimeToStr(SysUtils.Time - dTimeStart));
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popMnuPopup(Sender: TObject);
begin
  popMnuAddPrmPere.Visible := false;
  popMnuSep1.Visible := false;
  popMnuSetNdbView.Visible := false;
  popMnuSortPere.Visible := false;
  if popMnu.PopupComponent = dbgrPrmUv then begin
    popMnuAddPrmPere.Visible := true;
    popMnuHead.Caption := '== Приемы/Увольнения на предпр. ==';
    popMnuEdt.Enabled := dbgrPrmUv.DataSource.DataSet.RecordCount > 0;
    popMnuDel.Enabled := popMnuEdt.Enabled;
    popMnuAdd.Enabled := qrySps.RecordCount <> 0;
    popMnuSortPere.Visible := false; end
  else if popMnu.PopupComponent = dbgrPere then begin
    popMnuHead.Caption := '== Перемещения ==';
    popMnuEdt.Enabled := dbgrPere.DataSource.DataSet.RecordCount > 0;
    popMnuDel.Enabled := popMnuEdt.Enabled;
    popMnuAdd.Enabled := qrySps.RecordCount <> 0;
    popMnuSortPere.Visible := true; end
  else if popMnu.PopupComponent = dbgrNadb then begin
    popMnuHead.Caption := '==  Надбавки  ==';
    popMnuEdt.Enabled := dbgrNadb.DataSource.DataSet.RecordCount > 0;
    popMnuDel.Enabled := popMnuEdt.Enabled;
    popMnuAdd.Enabled := qrySps.RecordCount <> 0;
    popMnuSep1.Visible := true;
    popMnuSetNdbView.Visible := true; end
  else if popMnu.PopupComponent = dbgrUdrg then begin
    popMnuHead.Caption := '==  Удержания  ==';
    popMnuEdt.Enabled := dbgrUdrg.DataSource.DataSet.RecordCount > 0;
    popMnuDel.Enabled := popMnuEdt.Enabled;
    popMnuAdd.Enabled := qrySps.RecordCount <> 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popMnuVidInfoClick(Sender: TObject);
var {nAIndx, nPIndx, nKdVid, nKdPrnt : integer;}
    {cShVid, cShPrnt : string; bHsChld : boolean;}
    mLstKdChld, mLstShChld : TStringList;
begin
  if popMnu.PopupComponent = dbgrNadb then
                                    with dbgrNadb.DataSource.DataSet do begin
    mLstKdChld := TStringList.Create;
    mLstShChld := TStringList.Create;
//    nKdVid := FieldByName('KdVidN').AsInteger;
//    nAIndx := -1;
//    if GetVidInfo(nAIndx, nPIndx, nKdVid, nKdPrnt,  {z_TVids}
//                  cShVid, cShPrnt, bHsChld, mLstKdChld, mLstShChld) then begin
//      ;
//    end;
    mLstKdChld.Destroy;
    mLstShChld.Destroy;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrPereDblClick(Sender: TObject);
var
  NrSave: integer;
begin
  with DmMain.QryPere do begin
    NrSave := FieldByName('Nr').AsInteger;
    EdtPere;
    Locate('Nr', NrSave, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrNadbDblClick(Sender: TObject);
begin
  DmMain.qryNadb.OnNewRecord := nil;  // qryNadbNewRecord
  EdtNdb;
  DmMain.qryNadb.OnNewRecord := DmMain.qryNadb.OnNewRecord;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.AddNdb;
var
  EmplId: Integer;
  Mark: TBookmark;
  Updated: Boolean;
begin
  EmplId := QrySpsTabN.AsInteger;

  with DbgrNadb, DataSource, DataSet do begin
    Mark := GetBookmark;

    Append;
    FieldByName('KdSps').AsInteger := gl_nAppKdSpsUsr;

    if TFormENadb.Run(EmplId, gl_nAppKdSpsUsr,
        QrySps.FieldByName('FamIO').AsString, DbgrNadb.DataSource, Updated)
    then begin
      Post;

      DmMain.LogAddAllow(DataSet);
    end else begin
      Cancel;

      GotoBookmark(Mark);
      FreeBookmark(Mark);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.EdtNdb;
var cMsg, cLogMsg : string;
    nTabN : integer;
    bUpdated : boolean;
    cOldVidN, cOldSpsRsch, cOldSumProc, cOldSP, cOldDtBeg, cOldDtEnd,
    cOldKdTemu, cOldKdObj,
            cOldKdKatP, cOldKdSpZ, cOldNrPrBeg, cOldDtPrBeg, cOldNrPrEnd,
                               cOldDtPrEnd, cOldNotes, cOldPrcWT : ShortString;
begin
  nTabN := qrySps.fieldByName('TabN').AsInteger;

  if not DmMain.InCtrlMes and not MasterDebug then
    Exit;

  with dbgrNadb.DataSource.DataSet do begin
    if (FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается редактировать "чужие" надбавки');
      Exit;
    end;
    // Вставить проверку на дату начала и ПроКуКаРеКать!!! ... Или не надо ???

    if (FieldByName('Dt_Beg').AsDateTime < dCtrlDate) or
           (not MyEmptyDate(FieldByName('Dt_End').AsString) and
             (FieldByName('Dt_End').AsDateTime < dCtrlDate)) then
      cMsg := '';
    if (cMsg = '') or
             (MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes) then begin
      cOldVidN    := FieldByName('VidN').AsString;
      cOldSpsRsch := FieldByName('SpsRsch').AsString;
      cOldSumProc := FieldByName('SumProc').AsString;
      cOldSP      := FieldByName('SP').AsString;
      cOldDtBeg   := FieldByName('Dt_Beg').AsString;
      cOldDtEnd   := FieldByName('Dt_End').AsString;
      cOldKdTemu  := FieldByName('KdTemu').AsString;
      cOldKdObj   := FieldByName('KdObj').AsString;
      cOldKdKatP  := FieldByName('KdKatP').AsString;
      cOldKdSpZ   := FieldByName('KdSpZ').AsString;
      cOldNrPrBeg := FieldByName('NrPrBeg').AsString;
      cOldDtPrBeg := FieldByName('DtPrBeg').AsString;
      cOldNrPrEnd := FieldByName('NrPrEnd').AsString;
      cOldDtPrEnd := FieldByName('DtPrEnd').AsString;
      cOldNotes   := FieldByName('Notes').AsString;
      cOldPrcWT   := FieldByName('Prc_WT').AsString;
      Edit;
      if TFormENadb.Run(nTabN, gl_nAppKdSpsUsr,
                     dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString,
                             dbgrNadb.DataSource, bUpdated) {Z_ENadb} then begin
        nTabN := FieldByName('TabN').AsInteger;
        cLogMsg := '';
        if FieldByName('VidN').AsString <> cOldVidN then
          cLogMsg := cLogMsg + ' ВидН ' + cOldVidN + ' => ' +
                                                 FieldByName('VidN').AsString;
        if FieldByName('SpsRsch').AsString <> cOldSpsRsch then
          cLogMsg := cLogMsg + '  СпсбРасч ' + cOldSpsRsch + ' => ' +
                                              FieldByName('SpsRsch').AsString;
        if FieldByName('SumProc').AsString <> cOldSumProc then
          cLogMsg := cLogMsg + '  Сумма(Прц) ' + cOldSumProc + ' => ' +
                                              FieldByName('SumProc').AsString;
        if FieldByName('SP').AsString <> cOldSP then
          cLogMsg := cLogMsg + '  См_% ' + cOldSP + ' => ' +
                                                   FieldByName('SP').AsString;
        if FieldByName('Dt_Beg').AsString <> cOldDtBeg then
          cLogMsg := cLogMsg + '  ДтНач ' + cOldDtBeg + ' => ' +
                                               FieldByName('Dt_Beg').AsString;
        if FieldByName('Dt_End').AsString <> cOldDtEnd then
          cLogMsg := cLogMsg + '  ДтОконч ' + cOldDtEnd + ' => ' +
                                               FieldByName('Dt_End').AsString;
        if FieldByName('KdObj').AsString <> cOldKdObj then
          cLogMsg := cLogMsg + '  КдПдр ' + cOldKdObj + ' => ' +
                                                FieldByName('KdObj').AsString;
        if FieldByName('KdKatP').AsString <> cOldKdKatP then
          cLogMsg := cLogMsg + '  КдКтгр ' + cOldKdKatP + ' => ' +
                                               FieldByName('KdKatP').AsString;
        if FieldByName('KdSpZ').AsString <> cOldKdSpZ then
          cLogMsg := cLogMsg + '  КдСчБУ ' + cOldKdSpZ + ' => ' +
                                                FieldByName('KdSpZ').AsString;
        if FieldByName('NrPrBeg').AsString <> cOldNrPrBeg then
          cLogMsg := cLogMsg + '  №_ПрНач ' + cOldNrPrBeg + ' => ' +
                                              FieldByName('NrPrBeg').AsString;
        if FieldByName('DtPrBeg').AsString <> cOldDtPrBeg then
          cLogMsg := cLogMsg + '  ДтПрНач ' + cOldDtPrBeg + ' => ' +
                                              FieldByName('DtPrBeg').AsString;
        if FieldByName('NrPrEnd').AsString <> cOldNrPrEnd then
          cLogMsg := cLogMsg + '  №_ПрКнц ' + cOldNrPrEnd + ' => ' +
                                              FieldByName('NrPrEnd').AsString;
        if FieldByName('DtPrEnd').AsString <> cOldDtPrEnd then
          cLogMsg := cLogMsg + '  ДтПрКнц ' + cOldDtPrEnd + ' => ' +
                                              FieldByName('DtPrEnd').AsString;
        if FieldByName('Notes').AsString <> cOldNotes then
          cLogMsg := cLogMsg + '  Примеч: ' + cOldNotes + ' => ' +
                                              FieldByName('Notes').AsString;
        if FieldByName('Prc_WT').AsString <> cOldPrcWT then
          cLogMsg := cLogMsg + '  %РабВр: ' + cOldPrcWT + ' => ' +
                                              FieldByName('Prc_WT').AsString;
        Post;

        if cLogMsg > '' then begin
          cLogMsg := 'ТабН = ' + FieldByName('TabN').AsString + ' ' + cLogMsg;
          //
          DmMain.AddLog(Now, nTabN,
                            'Ред.надбавки', gc_AppNmUsr, 'Z_Nadb', cLogMsg);
          {QrySpsRefresh(nTabN);} end
        else
          Cancel; end
      else
        Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrPrmUvDblClick(Sender: TObject);
var cLogMsg : string; nTabN : integer;
begin
  with dbgrPrmUv.DataSource.DataSet do begin
    if RecordCount <= 0 then Exit;
    // Вставить проверку на дату начала и Ку-Ка-Ре-Ку!!!
    nTabN := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
    Edit;
    if AddEdtPrmUv(nTabN,
                   dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString,
                                    dbgrPrmUv.DataSource) {Z_EPrmUv} then begin
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtPrm = ' + FieldByName('Dt_Priem').AsString +
                 ', DtUvln = ' + FieldByName('Dt_Uvoln').AsString;
      Post;
      DmMain.AddLog(Now, nTabN, 'Ред.приема/увольн.',
                                        gc_AppNmUsr, 'Z_PrmUv', cLogMsg); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popMnuEdtClick(Sender: TObject);
var cMsg, cLogMsg : string; nTabN : integer; //bUpdated : boolean;
begin
  cMsg := '';
  nTabN := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  if popMnu.PopupComponent = dbgrPrmUv then
                         with dbgrPrmUv.DataSource.DataSet do begin
    Edit;
    FieldByName('KdSps').AsInteger := 0;
    if AddEdtPrmUv(nTabN,
                   dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString,
                                    dbgrPrmUv.DataSource) {Z_EPrmUv} then begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtPrm = ' + FieldByName('Dt_Priem').AsString +
                 ', DtUvln = ' + FieldByName('Dt_Uvoln').AsString;
      Post;
      DmMain.AddLog(Now, nTabN,  'Ред.пр./ув.(предпр)',
                                           gc_AppNmUsr, 'Z_PrmUv', cLogMsg);
      // Записать в Z_UPI последнее состояние "прием-увольнение"
      WritePrmUvInUpi(nTabN);
      QrySpsRefresh(nTabN); end
    else
      Cancel; end
  else if popMnu.PopupComponent = dbgrPere then
    EdtPere
  else if popMnu.PopupComponent = dbgrNadb then
    EdtNdb
  else if popMnu.PopupComponent = dbgrUdrg then
                         with dbgrUdrg.DataSource.DataSet do begin
    if (FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается редактировать "чужие" удержания');
      Exit;
    end;
    Edit;

    // >> Z_EUdrg
    if TFormEAUdrg.AddEdtUdrg(
      dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString,
      dbgrUdrg.DataSource) then
    begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SP = ' + FieldByName('SP').AsString +
                 ', SmPrc = ' + FieldByName('SumVzn').AsString;
      Post;
      DmMain.AddLog(Now, nTabN,
                          'Ред.удержаний', gc_AppNmUsr, 'Z_Uderg', cLogMsg);
      QrySpsRefresh(nTabN);
    end else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.EdtPere;
var cLogMsg : String; nTabN, nSpec_NR : integer; nSmCmbOkl : double;
  cOldKdSps, cOldDtBeg, cOldKdObj, cOldKdKatP, cOldPrcWrkTime, cOldSO,
  cOldOklTrf, cOldAvans, cOldSpAv, cOldKdDolgn, cOldDolgnost, cOldKdSpZ,
  cOldPrPens, cOldSovm, cOldPdNlg, cOldProcLg, cOldKolMin, cOldPrfs, cOldNrPR,
  cOldDtPr, cOldNotes, cOldInv, cOldRang, cOldRazr, cOldCmbOkl,
                                                       cOldNPD : ShortString;
begin
  with dbgrPere.DataSource.DataSet do begin
    if (FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
           (FieldByName('CmbOkl').AsString <> '1') and
                                                (nAppUsrKat <> 0)  then begin
      ShowMessage('Не разрешается редактировать "чужие" перемещения');
      Exit;
    end;
    nTabN          := FieldByName('TabN').AsInteger;
    cOldKdSps      := FieldByName('KdSps').AsString;
    cOldDtBeg      := FieldByName('Dt_Beg').AsString;
    cOldKdObj      := FieldByName('KdObj').AsString;
    cOldKdKatP     := FieldByName('KdKatP').AsString;
    cOldPrcWrkTime := FieldByName('PrcWrkTime').AsString;
    cOldSO         := FieldByName('SO').AsString;
    cOldOklTrf     := FieldByName('OklTrf').AsString;
    cOldAvans      := FieldByName('Avans').AsString;
    cOldSpAv       := FieldByName('SP_AV').AsString;
    cOldKdDolgn    := FieldByName('KdDolgn').AsString;
    cOldDolgnost   := FieldByName('Dolgnost').AsString;
    cOldKdSpZ      := FieldByName('KdSpZ').AsString;
    cOldPrPens     := FieldByName('Pr_Pens').AsString;
    cOldSovm       := FieldByName('Sovm').AsString;
    cOldPdNlg      := FieldByName('PdNlg').AsString;
    cOldProcLg     := FieldByName('ProcLg').AsString;
    cOldKolMin     := FieldByName('KolMin').AsString;
    cOldPrfs       := FieldByName('Prfs').AsString;
    cOldNrPR       := FieldByName('Nr_Prikaza').AsString;
    cOldDtPr       := FieldByName('Dt_Prikaza').AsString;
    cOldNotes      := FieldByName('Notes').AsString;
    cOldInv        := FieldByName('Inv').AsString;
    cOldRang       := FieldByName('Rang').AsString;
    cOldRazr       := FieldByName('Razr').AsString;
    cOldCmbOkl     := FieldByName('CmbOkl').AsString;
    cOldNPD        := FieldByName('NPD').AsString;
//    cCode          := FieldByName('Code').AsString;
//    cZ_Kpp         := FieldByName('Z_Kpp').AsString;
    Edit;
    if AddEdtPere(gl_nAppKdSpsUsr, nTabN,
                  dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString,
                  dbgrPere.DataSource, DmMain.dsrcDPere) {Z_EPere} then begin
      cLogMsg := '';
      if FieldByName('KdSps').AsString <> cOldKdSps then
        cLogMsg := cLogMsg + ' КдСпс ' + cOldKdSps + ' => ' +
                                        FieldByName('KdSps').AsString;
      if FieldByName('Dt_Beg').AsString <> cOldDtBeg then
        cLogMsg := cLogMsg + ' ДтНач ' + cOldDtBeg + ' => ' +
                                        FieldByName('Dt_Beg').AsString;
      if FieldByName('KdObj').AsString <> cOldKdObj then
        cLogMsg := cLogMsg + ' КдПдр ' + cOldKdObj + ' => ' +
                                        FieldByName('KdObj').AsString;
      if FieldByName('KdKatP').AsString <> cOldKdKatP then
        cLogMsg := cLogMsg + ' Ктгр ' + cOldKdKatP + ' => ' +
                                        FieldByName('KdKatP').AsString;
      if FieldByName('NPD').AsString <> cOldNPD then
        cLogMsg := cLogMsg + ' НПД ' + cOldNPD + ' => ' +
                                        FieldByName('NPD').AsString;
      if FieldByName('PrcWrkTime').AsString <> cOldPrcWrkTime then
        cLogMsg := cLogMsg + ' %РабВр ' + cOldPrcWrkTime + ' => ' +
                                        FieldByName('PrcWrkTime').AsString;
      if FieldByName('SO').AsString <> cOldSO then
        cLogMsg := cLogMsg + ' СОпл ' + cOldSO + ' => ' +
                                        FieldByName('SO').AsString;
      if FieldByName('CmbOkl').AsString <> cOldCmbOkl then
        cLogMsg := cLogMsg + ' КмбОкл ' + cOldCmbOkl + ' => ' +
                                        FieldByName('CmbOkl').AsString;
      if (FieldByName('CmbOkl').AsString >= '1') then begin
        nSpec_NR := FieldByName('Spec_NR').AsInteger;
        nSmCmbOkl := DmMain.mySmCmbOkl(nSpec_NR);
        cLogMsg := cLogMsg + ', СмКмбОкл = ' +
                                  FloatToStrF(nSmCmbOkl, ffFixed, 18, 2); end
      else if FieldByName('OklTrf').AsString > '' then
        cLogMsg := cLogMsg + ', ОклТрф = ' + FieldByName('OklTrf').AsString;
      if FieldByName('Avans').AsString <> cOldAvans then
        cLogMsg := cLogMsg + ' Аванс ' + cOldAvans + ' => ' +
                                        FieldByName('Avans').AsString;
      if FieldByName('SP_AV').AsString <> cOldSpAv then
        cLogMsg := cLogMsg + ' С%Ав ' + cOldSpAv + ' => ' +
                                        FieldByName('SP_AV').AsString;
      if FieldByName('KdDolgn').AsString <> cOldKdDolgn then
        cLogMsg := cLogMsg + ' КдДолжн ' + cOldKdDolgn + ' => ' +
                                        FieldByName('KdDolgn').AsString;
      if FieldByName('Dolgnost').AsString <> cOldDolgnost then
        cLogMsg := cLogMsg + ' Должн ' + cOldDolgnost + ' => ' +
                                        FieldByName('Dolgnost').AsString;
      if FieldByName('KdSpZ').AsString <> cOldKdSpZ then
        cLogMsg := cLogMsg + ' СчБУ ' + cOldKdSpZ + ' => ' +
                                        FieldByName('KdSpZ').AsString;
      if FieldByName('Pr_Pens').AsString <> cOldPrPens then
        cLogMsg := cLogMsg + ' Пенс ' + cOldPrPens + ' => ' +
                                        FieldByName('Pr_Pens').AsString;
      if FieldByName('Sovm').AsString <> cOldSovm then
        cLogMsg := cLogMsg + ' Совм ' + cOldSovm + ' => ' +
                                        FieldByName('Sovm').AsString;
      if FieldByName('PdNlg').AsString <> cOldPdNlg then
        cLogMsg := cLogMsg + ' ПНлг ' + cOldPdNlg + ' => ' +
                                        FieldByName('PdNlg').AsString;
      if FieldByName('ProcLg').AsString <> cOldProcLg then
        cLogMsg := cLogMsg + ' %лгт ' + cOldProcLg + ' => ' +
                                        FieldByName('ProcLg').AsString;
      if FieldByName('KolMin').AsString <> cOldKolMin then
        cLogMsg := cLogMsg + ' КМин ' + cOldKolMin + ' => ' +
                                        FieldByName('KolMin').AsString;
      if FieldByName('Prfs').AsString <> cOldPrfs then
        cLogMsg := cLogMsg + ' Прфс ' + cOldPrfs + ' => ' +
                                        FieldByName('Prfs').AsString;
      if FieldByName('Inv').AsString <> cOldInv then
        cLogMsg := cLogMsg + ' Инв ' + cOldInv + ' => ' +
                                        FieldByName('Inv').AsString;
      if FieldByName('Rang').AsString <> cOldRang then
        cLogMsg := cLogMsg + ' Ранг ' + cOldRang + ' => ' +
                                        FieldByName('Rang').AsString;
      if FieldByName('Razr').AsString <> cOldRazr then
        cLogMsg := cLogMsg + ' Разр ' + cOldRazr + ' => ' +
                                        FieldByName('Razr').AsString;
      if FieldByName('Nr_Prikaza').AsString <> cOldNrPr then
        cLogMsg := cLogMsg + ' №пркз ' + cOldNrPr + ' => ' +
                                        FieldByName('Nr_Prikaza').AsString;
      if FieldByName('Dt_Prikaza').AsString <> cOldDtPr then
        cLogMsg := cLogMsg + ' №пркз ' + cOldDtPr + ' => ' +
                                        FieldByName('Dt_Prikaza').AsString;
      if FieldByName('Notes').AsString <> cOldNotes then
        cLogMsg := cLogMsg + ' Прмч ' + cOldNotes + ' => ' +
                                        FieldByName('Notes').AsString;
      if cLogMsg > '' then begin
        cLogMsg := 'TabN = ' + FieldByName('TabN').AsString + ',' + cLogMsg;
        Post;
        DmMain.AddLog(Now, nTabN,
                          'Ред.перемещений', gc_AppNmUsr, 'Z_Pere', cLogMsg);
        QrySpsRefresh(nTabN); end
      else
        Cancel; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.WritePrmUvInUpi(nTabN : integer);
var dDtPrm, dDtUvl : TDateTime;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Dt_Priem, Dt_Uvoln from z_PrmUv ' +
            ' where Tabn = :nTabN and KdSps = 0 and ' +
            ' dt_priem = (Select max(Dt_Priem) from z_PrmUv ' +
            ' where TabN = :nTabN)');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    dDtPrm := FieldByName('Dt_Priem').AsDateTime;
    if not FieldByName('Dt_Uvoln').IsNull then
      dDtUvl := FieldByName('Dt_Uvoln').AsDateTime
    else
      dDtUvl := 0;
    Close;
    SQL.Clear;
    SQL.Add('Update Z_UPI set LastDtPrm = :dDtPrm, ');
    if dDtUvl <> 0 then
      SQL.Add(' LastDtUvl = :dDtUvl ')
    else
      SQL.Add(' LastDtUvl = null ');
    SQL.Add(' where TabN = :nTabN');
    ParamByName('dDtPrm').AsDateTime := dDtPrm;
    if dDtUvl <> 0 then
      ParamByName('dDtUvl').AsDateTime := dDtUvl;
    ParamByName('nTabN').AsInteger := nTabN;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
(*
    if bFlagDbg then
      ShowMessage('Сделали запись в Z_UPI с праметрами:' + #13#10 +
                   'TabN = ' + IntToStr(nTabN) +
                   ', DtPrm = ' + DateToStr(dDtPrm) +
                   ', DtUvl = ' + DateToStr(dDtUvl));
*)
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrUdrgDblClick(Sender: TObject);
var cLogMsg : string; nTabN : integer;
begin
  if not DmMain.InCtrlMes then Exit;
  nTabN := qrySps.FieldByName('TabN').AsInteger;
  with dbgrUdrg.DataSource.DataSet do begin
    if (FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается редактировать "чужие" удержания');
      Exit;
    end;
    Edit;

    // >> Z_EUdrg
    if TFormEAUdrg.AddEdtUdrg(
      dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString,
      dbgrUdrg.DataSource) then
    begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SP = ' + FieldByName('SP').AsString +
                 ', SmPrc = ' + FieldByName('SumVzn').AsString;
      Post;
      DmMain.AddLog(Now, nTabN,
                          'Ред.удержаний', gc_AppNmUsr, 'Z_Uderg', cLogMsg);
      QrySpsRefresh(nTabN);
    end else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popMnuAddClick(Sender: TObject);
var nSvNR, nTabN : integer; cLogMsg : string; //bUpdated : boolean;
begin
  nTabN := qrySps.FieldByName('TabN').AsInteger;
  if popMnu.PopupComponent = dbgrPrmUv then
                  with dbgrPrmUv.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('KdSps').AsInteger := 0;
    FieldByName('TabN').AsInteger :=
                   dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
    if AddEdtPrmUv(dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger,
                   dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString,
                                dbgrPrmUv.DataSource) {Z_EPrmUv} then begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtPrm = ' + FieldByName('Dt_Priem').AsString +
                 ', DtUvln = ' + FieldByName('Dt_Uvoln').AsString;
      Post;
      DmMain.AddLog(Now, nTabN,
                          'Ввод приема/увольн.', gc_AppNmUsr, 'Z_PrmUv', cLogMsg);
      // Записать в Z_UPI последнее состояние "прием-увольнение"
      WritePrmUvInUpi(nTabN);
      QrySpsRefresh(nTabN); end
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end; end
  else if popMnu.PopupComponent = dbgrPere then
    AddPere
  else if popMnu.PopupComponent = dbgrNadb then begin
    DmMain.qryNadb.OnNewRecord := nil;  // qryNadbNewRecord
    AddNdb;
    DmMain.qryNadb.OnNewRecord := DmMain.qryNadb.OnNewRecord; end
  else if popMnu.PopupComponent = dbgrUdrg then
                         with dbgrUdrg.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('KdSps').AsInteger := gl_nAppKdSpsUsr;  //nKdSps;

    // >> Z_EUdrg 
    if TFormEAUdrg.AddEdtUdrg(
      dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString,
      dbgrUdrg.DataSource) then
    begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SP = ' + FieldByName('SP').AsString +
                 ', SmPrc = ' + FieldByName('SumVzn').AsString;
      Post;
      DmMain.AddLog(Now, nTabN,
                          'Ввод удержаний', gc_AppNmUsr, 'Z_Uderg', cLogMsg);
      QrySpsRefresh(nTabN);
    end
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popMnuAddPrmPereClick(Sender: TObject);
begin
  if TFormAddPP.AddPrmPere(qrySpsTABN.AsInteger,
    qrySpsFAM.AsString, qrySpsIMA.AsString, qrySpsOTCH.AsString) then begin
    with dbgrPrmUv.DataSource.DataSet do begin
      Close;
      Open;
    end;
    with dbgrPere.DataSource.DataSet do begin
      Close;
      Open;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.AddPere;
var nSvNR, nTabN, nSpec_NR : integer; nSmCmbOkl : double;
    cFamIO : ShortString; cLogMsg : string;
begin
  nTabN := qrySpsTabN.AsInteger;
  cFamIO := qrySpsFamIO.AsString;
  with dbgrPere.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('KdSps').AsInteger := gl_nAppKdSpsUsr; // nKdSps;
    if AddEdtPere(gl_nAppKdSpsUsr, nTabN, cFamIO,
                   dbgrPere.DataSource, DmMain.dsrcDPere) {Z_EPere} then begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString;
      if FieldByName('KdSps').AsString > '' then
        cLogMsg := cLogMsg + ', КдСпс = ' + FieldByName('KdSps').AsString;
      if FieldByName('Dt_Beg').AsString > '' then
        cLogMsg := cLogMsg + ', ДтНач = ' + FieldByName('Dt_Beg').AsString;
      if FieldByName('KdObj').AsString > '' then
        cLogMsg := cLogMsg + ', КдПдр = ' + FieldByName('KdObj').AsString;
      if FieldByName('KdKatP').AsString > '' then
        cLogMsg := cLogMsg + ', Ктгр = ' + FieldByName('KdKatP').AsString;
      if FieldByName('NPD').AsString > '' then
        cLogMsg := cLogMsg + ', НПД = ' + FieldByName('NPD').AsString;
      if FieldByName('PrcWrkTime').AsString > '' then
        cLogMsg := cLogMsg + ', %РабВр = ' + FieldByName('PrcWrkTime').AsString;
      if FieldByName('SO').AsString > '' then
        cLogMsg := cLogMsg + ', СО = ' + FieldByName('SO').AsString;
      if FieldByName('CmbOkl').AsString > '' then
        cLogMsg := cLogMsg + ', КмбОкл = ' + FieldByName('CmbOkl').AsString;
      if (FieldByName('CmbOkl').AsString >= '1') then begin
        nSpec_NR := FieldByName('Spec_NR').AsInteger;
        nSmCmbOkl := DmMain.mySmCmbOkl(nSpec_NR);
        cLogMsg := cLogMsg + ', СмКмбОкл = ' +
                                  FloatToStrF(nSmCmbOkl, ffFixed, 18, 2); end
      else if FieldByName('OklTrf').AsString > '' then
        cLogMsg := cLogMsg + ', ОклТрф = ' + FieldByName('OklTrf').AsString;
      // if FieldByName('Avans').AsString > '' then
      //   cLogMsg := cLogMsg + ', Аванс = ' + FieldByName('Avans').AsString;
      // if FieldByName('SP_AV').AsString > '' then
      //   cLogMsg := cLogMsg + ', С%Ав = ' + FieldByName('SP_AV').AsString;
      if FieldByName('KdSpZ').AsString > '' then
        cLogMsg := cLogMsg + ', СчБУ = ' + FieldByName('KdSpZ').AsString;
      if FieldByName('Pr_Pens').AsString > '' then
        cLogMsg := cLogMsg + ', Пенс = ' + FieldByName('Pr_Pens').AsString;
      if FieldByName('Sovm').AsString > '' then
        cLogMsg := cLogMsg + ', Совм = ' + FieldByName('Sovm').AsString;
      if FieldByName('PdNlg').AsString > '' then
        cLogMsg := cLogMsg + ', ПН = ' + FieldByName('PdNlg').AsString;
      if FieldByName('ProcLg').AsString > '' then
        cLogMsg := cLogMsg + ', %лгт = ' + FieldByName('ProcLg').AsString;
      // if FieldByName('KolMin').AsString > '' then
      //   cLogMsg := cLogMsg + ', КМин = ' + FieldByName('KolMin').AsString;
      if FieldByName('Prfs').AsString > '' then
        cLogMsg := cLogMsg + ', Прфс = ' + FieldByName('Prfs').AsString;
      if FieldByName('Inv').AsString > '' then
        cLogMsg := cLogMsg + ', Инв ' + FieldByName('Inv').AsString;
      {
      if FieldByName('Rang').AsString > '' then
        cLogMsg := cLogMsg + ', Ранг = ' + FieldByName('Rang').AsString;
      if FieldByName('Razr').AsString > '' then
        cLogMsg := cLogMsg + ', Разр = ' + FieldByName('Razr').AsString;
      }
      if FieldByName('Nr_Prikaza').AsString > '' then
        cLogMsg := cLogMsg + ', №пркз = ' + FieldByName('Nr_Prikaza').AsString;
      if FieldByName('Dt_Prikaza').AsString > '' then
        cLogMsg := cLogMsg + ', ДтПркз = ' + FieldByName('Dt_Prikaza').AsString;
      if FieldByName('KdDolgn').AsString > '' then
        cLogMsg := cLogMsg + ', КдДлжн = ' + FieldByName('KdDolgn').AsString;
      if FieldByName('Dolgnost').AsString > '' then
        cLogMsg := cLogMsg + ', Длжн = ' + FieldByName('Dolgnost').AsString;
      if FieldByName('Notes').AsString > '' then
        cLogMsg := cLogMsg + ', Прмч = ' + FieldByName('Notes').AsString;
      Post;
      DmMain.AddLog(Now, nTabN,
                          'Новое перемещение', gc_AppNmUsr, 'Z_Pere', cLogMsg);
      QrySpsRefresh(nTabN); end
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popMnuDelClick(Sender: TObject);
var cMsg, cCaption, cLogMsg : string;
    nMyResult : word;
    bNeedPereschet : boolean;
    dDtBeg, dDtEnd : TDateTime;
    nYBeg, nMBeg, nD : word;
    nDelNR, nTabN : integer;
begin
  bNeedPereschet := false;
  cCaption := 'Удаление записи';
  dDtBeg := 0;
  dDtEnd := 0;
  nTabN := dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  if (popMnu.PopupComponent = dbgrPrmUv) then begin
    dDtBeg := dbgrPrmUv.DataSource.DataSet.FieldByName('Dt_Priem').AsDateTime;
    if not dbgrPrmUv.DataSource.DataSet.FieldByName('Dt_Uvoln').IsNull then
      dDtEnd := dbgrPrmUv.DataSource.DataSet.FieldByName('Dt_Uvoln').AsDateTime;
    bNeedPereschet := ((dDtEnd > 0) and (dDtEnd < dCtrlDate)) or
                                                   (dDtEnd < dCtrlDate);
    cCaption := cCaption + ' о приеме/увольнении'; end
  else if (popMnu.PopupComponent = dbgrPere) then begin
    if (dbgrPere.DataSource.DataSet.
              FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается удалять "чужие" перемещения');
      Exit;
    end;
    nDelNR := dbgrPere.DataSource.DataSet.FieldByName('NR').AsInteger;
    dDtBeg := dbgrPere.DataSource.DataSet.FieldByName('Dt_Beg').AsDateTime;
    // Если удаляется запись с датой начала в расчетном месяце - проблем нет,
    //                               т.к. текущий месяц рассчитывается всегда.
    // Если за какой-то прошлый - нужно пересчитать от удаляемой даты
    //                                              до ближайшей следующей
    dbgrPere.DataSource.DataSet.DisableControls;
    dbgrPere.DataSource.DataSet.Next;
    if not dbgrPere.DataSource.DataSet.Eof then
      dDtEnd := dbgrPere.DataSource.DataSet.FieldByName('Dt_Beg').AsDateTime
    else
      dDtEnd := dCtrlDate;
    dbgrPere.DataSource.DataSet.Locate('NR', nDelNR, []);
    dbgrPere.DataSource.DataSet.EnableControls;
    bNeedPereschet := (dDtBeg <= dCtrlDate);
    cCaption := cCaption + ' о перемещении'; end
  else if (popMnu.PopupComponent = dbgrNadb) then begin
    if (dbgrNadb.DataSource.DataSet.
                  FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается удалять "чужие" надбавки');
      Exit;
    end;
    dDtBeg := dbgrNadb.DataSource.DataSet.FieldByName('Dt_Beg').AsDateTime;
    if not dbgrNadb.DataSource.DataSet.FieldByName('Dt_End').isNull then
      dDtEnd := dbgrNadb.DataSource.DataSet.FieldByName('Dt_End').AsDateTime
    else
      dDtEnd := dCtrlDate;
    bNeedPereschet := (dDtBeg < dCtrlDate);
    cCaption := cCaption + ' о надбавке'; end
  else if (popMnu.PopupComponent = dbgrUdrg) then begin
    if (dbgrUdrg.DataSource.DataSet.
                  FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается удалять "чужие" удержания');
      Exit;
    end;
    dDtBeg := dbgrUdrg.DataSource.DataSet.FieldByName('Dt_Beg').AsDateTime;
    if not dbgrUdrg.DataSource.DataSet.FieldByName('Dt_End').isNull then
      dDtEnd := dbgrUdrg.DataSource.DataSet.FieldByName('Dt_End').AsDateTime;
    bNeedPereschet := ((dDtEnd > 0) and (dDtEnd < dCtrlDate)) or
                                                   (dDtEnd < dCtrlDate);
    cCaption := cCaption + ' об удержании';
  end;
  DecodeDate(dDtBeg, nYBeg, nMBeg, nD);
  if bNeedPereschet then
    cMsg := 'Будет удалена запись с датой начала ' + DateToStr(dDtBeg) +
            ', действующей из прошлых месяцев. При этом вознникает ' +
            'необходимость перерасчета прошлых месяцев с ' + MesRod(nMBeg) +
            ' ' + IntToStr(nYBeg) + 'г. с подключением результатов ' +
            'пересчета к текущему месяцу. Вы настаиваете на удалении?:'
  else
    cMsg := 'Запись удаляется безвозвратно. Согласны?:';
  if myMsgDlg(cCaption, cMsg, 1, nMyResult) {z_MsgDlg} then begin
    if popMnu.PopupComponent = dbgrPrmUv then
                                 with dbgrPrmUv.DataSource.DataSet do begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtPrm = ' + FieldByName('Dt_Priem').AsString +
                 ', DtUvln = ' + FieldByName('Dt_Uvoln').AsString;
      Delete;
      DmMain.AddLog(Now, nTabN,
                    'Удаление приема/увольн.', gc_AppNmUsr, 'Z_PrmUv', cLogMsg);
      // Добавить в отклонения вид 8801 - указание на пересчет
      if bNeedPereschet then
        DmMain.AddPereschetInOtkl(gl_nAppKdSpsUsr, nTabN, dDtEnd, dDtBeg);
      WritePrmUvInUpi(FieldByName('TabN').AsInteger);
      QrySpsRefresh(nTabN); end
    else if popMnu.PopupComponent = dbgrPere then
                                 with dbgrPere.DataSource.DataSet do begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', OklTrf = ' + FieldByName('OklTrf').AsString;
      Delete;
      DmMain.AddLog(Now, nTabN,
                          'Удаление перемещений', gc_AppNmUsr, 'Z_Pere', cLogMsg);
      // Добавить в отклонения вид 8801 - указание на пересчет
      if bNeedPereschet then
        DmMain.AddPereschetInOtkl(gl_nAppKdSpsUsr, nTabN, dDtEnd, dDtBeg);
      QrySpsRefresh(nTabN); end
    else if popMnu.PopupComponent = dbgrNadb then
                                 with dbgrNadb.DataSource.DataSet do begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SP = ' + FieldByName('SP').AsString +
                 ', SmPrc = ' + FieldByName('SumProc').AsString;
      Delete;
      DmMain.AddLog(Now, nTabN,
                          'Удаление надбавок', gc_AppNmUsr, 'Z_Nadb', cLogMsg);
      // Добавить в отклонения вид 8801 - указание на пересчет
      if bNeedPereschet then
        DmMain.AddPereschetInOtkl(gl_nAppKdSpsUsr, nTabN, dDtEnd, dDtBeg);
      QrySpsRefresh(nTabN); end
    else if popMnu.PopupComponent = dbgrUdrg then
                                 with dbgrUdrg.DataSource.DataSet do begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SP = ' + FieldByName('SP').AsString +
                 ', SmPrc = ' + FieldByName('SumVzn').AsString;
      Delete;
      DmMain.AddLog(Now, nTabN,
                          'Удаление удержаний', gc_AppNmUsr, 'Z_Uderg', cLogMsg);
      // Добавить в отклонения вид 7501 - указание на пересчет
      if bNeedPereschet then
        DmMain.AddPereschetInOtkl(gl_nAppKdSpsUsr, nTabN, dDtEnd, dDtBeg);
      QrySpsRefresh(nTabN);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpRkvztClick(Sender: TObject);
begin
  ShowZpRkvzt;   {Z_Rkvzt}
  SetMainMnu;
  SetDbgrNUColumns;
  SetRMes;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetRMes;
var nY, nM, nD : word; dDtBegNewRMes : TDateTime;
begin
// Проверить это TYTYTYTYT
  DecodeDate(Date, nY, nM, nD);
  dDtBegNewRMes := EncodeDate(nY, nM, nDayPerehoda);
//  dDtEndPredRMes := dDtBegNewRMes -1;
//  nM := nM + 1;
//  if nM > 12 then begin
//    nM := 1;
//    nY := nY + 1;
//  end;
//  dDtEndPredRMes := EncodeDate(nY, nM, nDayNewBegRMes) - 1;
  DecodeDate(dDtBegNewRMes, nCtrlGod, nCtrlMes, nD);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpExitClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpSBUClick(Sender: TObject);
var bWasUpdated : boolean;
begin
  bWasUpdated := false;
  ShowSbu(bWasUpdated, 'Из Зпл');            {A_SBU}
  if bWasUpdated then begin
    DmMain.cdsSBU.Close;
    DmMain.cdsSBU.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.QrySpsCalcFields(DataSet: TDataSet);
begin
  qrySpsFamIO.AsString := MyFamIO(qrySpsFam.AsString, qrySpsIma.AsString,
                                                        qrySpsOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.qryObjBeforePost(DataSet: TDataSet);
begin
  if qryObj.State = dsInsert then
    qryObj.FieldByName('KdObj').AsInteger := NewKdObj;
end;
//------------------------------------------------------------------------------
function TFormZpMain.NewKdObj : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdObj) MaxKd from Z_KdObj');
    Open;
    if (RecordCount <> 0) and (FieldByName('MaxKd').AsInteger <> 0) then
      Result := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.qryObjAfterPost(DataSet: TDataSet);
var nSvKdObj : integer;
begin
  with qryObj do begin
    nSvKdObj := FieldByName('KdObj').AsInteger;
    Form_Dm.DbMain.ApplyUpdates([qryObj]);
    Close;
    Open;
    if nSvKdObj <> 0 then
      Locate('KdObj', nSvKdObj, []);
    DmMain.qryObjLU.Close;
    DmMain.qryObjLU.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.qryObjAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryObj]);
  DmMain.qryObjLU.Close;
  DmMain.qryObjLU.Open;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpHintsClick(Sender: TObject);
begin
 mMnuZpHints.Checked := not mMnuZpHints.Checked;
 Application.ShowHint := mMnuZpHints.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpToolPanelClick(Sender: TObject);
begin
  mMnuZpToolPanel.Checked := not mMnuZpToolPanel.Checked;
  SetShowPanelTools;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetShowPanelTools;
begin
  PanelTools.Visible := mMnuZpToolPanel.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpViewExcelClick(Sender: TObject);
begin
  if mMnuZpViewF6.Checked then begin
    mMnuZpViewExcel.Checked := true;
    mMnuZpViewF6.Checked := false;
    bAppDocsToExcel := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpViewF6Click(Sender: TObject);
begin
  if mMnuZpViewExcel.Checked then begin
    mMnuZpViewExcel.Checked := false;
    mMnuZpViewF6.Checked := true;
    bAppDocsToExcel := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpKoefOtpClick(Sender: TObject);
begin
  ShowKoefOtp;          {Z_KfOtp}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpOtpuskaClick(Sender: TObject);
var bNextMes : boolean;
begin
  bNextMes := false;
  ShowOtpuska(dDtProc, bNextMes); {Z_ShOtp}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpOtpNextMesClick(Sender: TObject);
var bNextMes : boolean; dDtPrc : TDateTime; nY, nM, nD : word;
begin
  bNextMes := true;
  DecodeDate(dDtProc, nY, nM, nD);
  Inc(nM);
  if nM > 12 then begin
   nM := 1;
   Inc(nY);
  end;
  dDtPrc := EncodeDate(nY, nM, 1);
  ShowOtpuska(dDtPrc, bNextMes); {Z_ShOtp}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpBolnichnueClick(Sender: TObject);
begin
  ShowBln(dDtProc);     {Z_ShBln}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpBankiClick(Sender: TObject);
begin
  ShowZpBanki(0);       {Z_ShwBnk}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpBankiLSClick(Sender: TObject);
var dOnDate : TDateTime;
begin
  dOnDate := Date;
  ShowUpiLS(dOnDate);            {Z_UpiLS}
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.PanelRightResize(Sender: TObject);
begin
  SetPanelMinutkuPlace;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetPanelMinutkuPlace;
begin
  PanelMinutku.Left := Round((PanelRight.Width - PanelMinutku.Width) / 2) - 20;
  PanelMinutku.Top  := Round((PanelRight.Height - PanelMinutku.Height) / 2) - 20;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSvdByKatPersClick(Sender: TObject);
var cCaption : ShortString; nY, nM, nD : word;
begin
  DecodeDate(dDtProc, nY, nM, nD);
  cCaption := 'Ввод задания для свода по категориям персонала за ' +
                              MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  SvodByKatP(dDtProc, cCaption);  {Z_SvKatP}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSvdByVidNClick(Sender: TObject);
var cCaption : string; nY, nM, nD : word;
begin
  DecodeDate(dDtProc, nY, nM, nD);
  cCaption := 'Ввод задания для сводов за ' +
                              MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  VvodObj(dDtProc, cCaption);     {Z_VvObj}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.qryObjBeforeScroll(DataSet: TDataSet);
begin
  SaveSpsPosition(QryObj.FieldByName('KdObj').AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.qryObjAfterScroll(DataSet: TDataSet);
begin
  if qrySps.Active then
    RestSpsPosition(QryObj.FieldByName('KdObj').AsInteger);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.SaveSpsPosition(KdObj: integer);
begin
  if QrySps.Active and (KdObj <> 0) and (QrySps.RecordCount > 0) then
    with tblSvSpsPlace do begin
      if not Locate('KdObj', KdObj, []) then begin
        Append;
        FieldByName('KdObj').AsInteger := KdObj;
      end else
        Edit;

      FieldByName('TabN').AsInteger := QrySps.FieldByName('TabN').AsInteger;
      Post;
    end; {with}
end; {SaveSpsPosition}

//------------------------------------------------------------------------------
procedure TFormZpMain.RestSpsPosition(KdObj : integer);
begin
  if mMnuRestSpsTabN.Checked and (KdObj <> 0)
      and QrySps.Active and (QrySps.RecordCount > 0)
      and tblSvSpsPlace.Locate('KdObj', KdObj, []) then
    QrySps.Locate('TabN', tblSvSpsPlace.FieldByName('TabN').AsInteger, []);
end; {RestSpsPosition}

//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnCalendarClick(Sender: TObject);
begin
{ TODO 2 -oБоренко -cСпешно :
Переделать все обращения к E_DAYS на cdsEDays
(он уже есть и открыт и с индексом) }
  if not bIsFormMyCalendar then
    ShowMyCalendar    {Z_Calend}
  else begin
    if FormMyCalendar.WindowState = wsMinimized then
      FormMyCalendar.WindowState := wsNormal;
    FormMyCalendar.SetFocus;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.ChngNuModeClick(Sender: TObject);
begin
  if (Sender = NShwNuDetail) or (Sender = NShwNuDetail2)
    or (Sender = BtnNuDetail)
  then
    SetShowNuMode(snuDetail)
  else if (Sender = NShwNuCondens) or (Sender = NShwNuCondens2)
    or (Sender = BtnNuCondens)
  then
    SetShowNuMode(snuCondens)
  else
    SetShowNuMode(snuNewShort);
end;

//------------------------------------------------------------------------------
// Выбор таблицы NU (детально или свернуто)
//------------------------------------------------------------------------------
procedure TFormZpMain.SetShowNuMode(NuShowMode: TNuShowMode);
begin
  Self.NuShowMode := NuShowMode;

  if NuShowMode = snuDetail then begin
    NShwNuDetail.Checked  := true;
    NShwNuCondens.Checked := false;
    NShwNuDetail2.Checked  := true;
    NShwNuCondens2.Checked := false;

    BtnNuDetail.Down := true;
    BtnNuCondens.Down := false;
    BtnNuShort.Down := false;
  end else if NuShowMode = snuCondens then begin
    NShwNuDetail.Checked  := false;
    NShwNuCondens.Checked := true;
    NShwNuDetail2.Checked  := false;
    NShwNuCondens2.Checked := true;

    BtnNuDetail.Down := false;
    BtnNuCondens.Down := true;
    BtnNuShort.Down := false;
  end else begin
    NShwNuDetail.Checked  := false;
    NShwNuCondens.Checked := false;
    NShwNuDetail2.Checked  := false;
    NShwNuCondens2.Checked := false;

    BtnNuDetail.Down := false;
    BtnNuCondens.Down := false;
    BtnNuShort.Down := true;
  end;

  if NuShowMode in [snuDetail, snuNewShort] then begin
    DmMain.LoadPayments(sBtnShowSpecVids.Down, NuShowMode = snuNewShort);

    dbgrNu2.Align   := alNone;
    dbgrNu2.Visible := false;
    dbgrNu.Align    := alClient;
    dbgrNu.Visible  := true;
  end else begin
    OpenQryNu2;

    dbgrNu.Align    := alNone;
    dbgrNu.Visible  := false;
    dbgrNu2.Align   := alClient;
    dbgrNu2.Visible := true;
  end;

  RefreshNuTotals;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popNuVidSummOneClick(Sender: TObject);
begin
  if not popNuVidSummOne.Checked then begin
    popNuVidSummOne.Checked := true;
    popNuVidSummTwo.Checked := false;
    SetDbgrNuColumns;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNuVidSummTwoClick(Sender: TObject);
begin
  if not popNuVidSummTwo.Checked then begin
    popNuVidSummOne.Checked := false;
    popNuVidSummTwo.Checked := true;
    SetDbgrNuColumns;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNu2VidSummOneClick(Sender: TObject);
begin
  if not popNu2VidSummOne.Checked then begin
    popNu2VidSummOne.Checked := true;
    popNu2VidSummTwo.Checked := false;
    SetDbgrNu2Columns;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNu2VidSummTwoClick(Sender: TObject);
begin
  if not popNu2VidSummTwo.Checked then begin
    popNu2VidSummOne.Checked := false;
    popNu2VidSummTwo.Checked := true;
    SetDbgrNu2Columns;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpMyDbgDelTmpFilesClick(Sender: TObject);
begin
  mMnuZpMyDbgDelTmpFiles.Checked := not mMnuZpMyDbgDelTmpFiles.Checked;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.PopNdbShowModeClick(Sender: TObject);
begin
  SetNadbShowModeAll(Sender = PopShowNdbAll);
  DmMain.OpenQryNadb(DsrcSps, PopShowNdbActual.Checked, lbxAllowSps.Items);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.SetNadbShowModeAll(Value: Boolean);
begin
  PopShowNdbAll.Checked := Value;
  PopShowNdbActual.Checked := not PopShowNdbAll.Checked;

  if PopShowNdbAll.Checked then
    dbgrNadb.Hint := 'Таблица надбавок (все надбавки)'
  else
    dbgrNadb.Hint := 'Таблица надбавок (только актуальные)';
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.PopSortPereClick(Sender: TObject);
begin
  SetSortPereAscend(Sender = PopSortPereAscend);
  with DmMain do begin
    PrepareQryPere(DsrcSps, PopSortPereAscend.Checked);
    OpenQryPere(PopSortPereAscend.Checked);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.SetSortPereAscend(Value: Boolean);
begin
  PopSortPereAscend.Checked := Value;
  PopSortPereDescend.Checked := not PopSortPereAscend.Checked;
  LabelPereSort.Visible := PopSortPereDescend.Checked;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.OpenQryUdrg;
var nSvNR : integer;
begin
  with DmMain.qryUdrg do begin
    if Active then begin
      nSvNR := FieldByName('NR').AsInteger;
      Close; end
    else
      nSvNR := 0;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcSps;
    SQL.Add('Select * from z_Uderg where (TabN = :TabN) ' +
            ' order by Dt_Beg, Dt_End, Nr');
    Open;
    if (nSvNR <> 0) and not Locate('NR', nSvNR, []) then
      Last
    else
      Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.ChBoxDbgClick(Sender: TObject);
begin
  SetFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetFlagDbg;
begin
  bFlagDbg := ChBoxDbg.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpNapominalkaClick(Sender: TObject);
begin
  mMnuZpNapominalka.Checked := not mMnuZpNapominalka.Checked;
  SetNapominalka;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpDolgnostiClick(Sender: TObject);
begin
  ShowDolgn;                        {z_KdDlgn}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmZpTreeObjClick(Sender: TObject);
var bWasUpdated : boolean;
begin
  bWasUpdated := false;
  ShowTvObj(0, bWasUpdated);        {z_TObj}
  if bWasUpdated then
    CreTvObj_FromTable(nAppKdUsr, gl_nAppKdSpsUsr);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpTreeVidsClick(Sender: TObject);
var bWasUpdated : boolean;
begin
  bWasUpdated := false;
  ShowTreeVids('', bWasUpdated);    {z_TVids}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklVidInfoClick(Sender: TObject);
var cVidN : string4; bWasUpdated : boolean;
begin
  cVidN := dbgrOtkl.DataSource.DataSet.FieldByName('VidN').AsString;
  bWasUpdated := false;
  ShowTreeVids(cVidN, bWasUpdated); {z_TVids}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNuVidInfoClick(Sender: TObject);
var cVidN : string4; bWasUpdated : boolean;
begin
  cVidN := dbgrNu.DataSource.DataSet.FieldByName('VidN').AsString;
  bWasUpdated := false;
  ShowTreeVids(cVidN, bWasUpdated); {z_TVids}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNu2VidInfoClick(Sender: TObject);
var cVidN : string4; bWasUpdated : boolean;
begin
  cVidN := dbgrNu2.DataSource.DataSet.FieldByName('VidN').AsString;
  bWasUpdated := false;
  ShowTreeVids(cVidN, bWasUpdated); {z_TVids}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.TvObjChange(Sender: TObject; Node: TTreeNode);
var nKdObj : SmallInt;
begin
  if (qryObj.State in [dsEdit, dsInsert]) or (not bEndTvObjUpdated) then
    Exit;
  bTreeObjChanged := true;
  nKdObj := PTreeRec(TvObj.Selected.Data)^.KdObj;
  qryObj.Locate('KdObj', nKdObj, []);
  bTreeObjChanged := false;
  if qrySps.Active and (qrySps.RecordCount <> 0) then
    StatusBar.Panels[0].Text := ' Сотрудников: ' + IntToStr(qrySps.RecordCount)
  else
    StatusBar.Panels[0].Text := '';
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popTvObjPopup(Sender: TObject);
var
  MnthIsClosed: Boolean;
begin
  MnthIsClosed := MonthClosed(0);

  popTvObj.AutoPopup := qryObj.RecordCount > 0;
  popTvObjSchetAll.Enabled := not MnthIsClosed and DmMain.InCtrlMes or bFlagDbg;
  popTvObjSchetAllFromCurrent.Enabled := not MnthIsClosed and DmMain.InCtrlMes and
                                                (qrySps.RecordCount > 0);

  popTvObjSchetCurrent.Enabled := not MnthIsClosed and
                          (DmMain.InCtrlMes or bFlagDbg) and (qrySps.RecordCount > 0);

  popTvYourPeoples.Enabled := bFlagDbg or
    (gl_nAppKdSpsUsr > 2) or (nAppKdUsr in [101, 102, 127]);

  popTvObjF9.Enabled := not MnthIsClosed;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.dsrcObjDataChange(Sender: TObject; Field: TField);
var nKdObj : integer;
begin
  if not bTreeObjChanged and (dsrcObj.State = dsBrowse) then begin
    // поставить TreeObj на Item, соответствующий записи в qryObj
    nKdObj := qryObj.FieldByName('KdObj').AsInteger;
    MyTVLocateKdObj(nKdObj);
  end;
end;
//------------------------------------------------------------------------------
function TFormZpMain.MyTVLocateKdObj(nKdObj : integer) : boolean;
var i : integer;
begin
  Result := false;
  with TvObj do for i := 0 to Items.Count - 1 do
    if PTreeRec(Items[i].Data)^.KdObj = nKdObj then begin
      Items[i].Selected := true; // оставляем указатель на найденном nKdObj
      Result := true;
      Break;
    end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popTvObjVidAllClick(Sender: TObject);
begin
  if not popTvObjVidAll.Checked then begin
    popTvObjVidAll.Checked := true;
    popTvObjVidOnly.Checked := false;
    CreTvObj_FromTable(nAppKdUsr, gl_nAppKdSpsUsr);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popTvObjVidOnlyClick(Sender: TObject);
begin
  if not popTvObjVidOnly.Checked then begin
    popTvObjVidOnly.Checked := true;
    popTvObjVidAll.Checked := false;
    CreTvObj_FromTable(nAppKdUsr, gl_nAppKdSpsUsr);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrPereDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrPere.Canvas do begin
    if not (gdFocused in State) then begin
      cFldNm := UpperCase(Column.FieldName);
      if (cFldNm = 'PRCWRKTIME') and (not Column.Field.IsNull) and
                                            (Column.Field.AsFloat <> 100) then
        Font.Color := clRed
      else begin                         {оклад из нескольких частей}
        if dbgrPere.DataSource.DataSet.FieldByName('CmbOkl').AsString = '1' then
          Font.Color := clBlue
        else
          Font.Color := clWindowText;
      end;
      if (cFldNm = 'BM') and
           (not Column.Field.IsNull and (Column.Field.AsString = 'Y')) then
        Brush.Color := clLime; //clFuchsia;

      if (cFldNm = 'DTBM') and
           (not Column.Field.IsNull) then
        Brush.Color := clLime; //clFuchsia;



      {
      if Pos('FrOPK', dbgrPere.DataSource.DataSet.
                             FieldByName('Notes').AsString) > 0 then
        Font.Style := []
      else
        Font.Style := [fsBold];
      }
      if cFldNm = 'SMCMBOKL' then
        Font.Color := clMaroon;
      if (cFldNm = 'SMCMBOKL') and
         (dbgrPere.DataSource.DataSet.FieldByName('NoIndx').AsString = '1') then
        Brush.Color := clLime;
    end;
  end;
  dbgrPere.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrNadbDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);

var cFldNm : ShortString; bBoevaja : boolean; nSpsbRsch : SmallInt;
begin
  cFldNm := UpperCase(Column.FieldName);
  // Выделить цветом "боевые" надбавки (которые каким-либо
  // краем перекрывают текущий месяц)
  // Есть dDtProc (всегда 1-е число для nProcY и nProcM) и
  //      dDtLastProcMes (последнее число месяца от nProcY и nProcM)
  bBoevaja := false;
  with dbgrNadb.DataSource.DataSet, dbgrNadb.Canvas do begin
    if (FieldByName('Dt_Beg').AsDateTime < dDtLastProcMes) then begin
      if FieldByName('Dt_End').IsNull or
            (FieldByName('Dt_End').AsDateTime >= dDtProc) then
        bBoevaja := true;
    end;
    nSpsbRsch := FieldByName('SpsRsch').AsInteger;
  end;
  with dbgrNadb.Canvas do begin
    if not (gdFocused in State) then begin
      if bBoevaja then begin
        if nSpsbRsch < 3 then
          Font.Color := clMaroon
        else
          Font.Color := clWindowText; end
      else begin
        if nSpsbRsch < 3 then
          Font.Color := clGray
        else
          Font.Color := clTeal;
      end;
      if (cFldNm = 'GRP') and
          (dbgrNadb.DataSource.DataSet.FieldByName('Sovm').AsString = '1') then
        Brush.Color := clYellow;// жёлтым брашем выдедть совместительские записи
      if (not dbgrNadb.DataSource.DataSet.
              FieldByName('Sovm').IsNull) and
         (dbgrNadb.DataSource.DataSet.
                            FieldByName('Sovm').AsString > '0') then
        Font.Style := [fsBold,fsItalic];
    end;
  end;
  dbgrNadb.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrUdrgDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);

var bBoevaja : boolean;
begin
  // Выделить цветом "боевые" удержания (которые каким-либо
  // краем перекрывают текущий месяц)
  // Есть dDtProc (всегда 1-е число для nProcY и nProcM) и
  //      dDtLastProcMes (последнее число месяца от nProcY и nProcM)
  bBoevaja := false;
  with dbgrUdrg.DataSource.DataSet do begin
    if (FieldByName('Dt_Beg').AsDateTime < dDtLastProcMes) then begin
      if FieldByName('Dt_End').IsNull or
                 (FieldByName('Dt_End').AsDateTime >= dDtProc) then
        bBoevaja := true;
    end;
  end;
  with dbgrUdrg.Canvas do begin
    if not (gdFocused in State) then begin
      if bBoevaja then
        Font.Color := clMaroon
      else
        Font.Color := clGray;
    end;
  end;
  dbgrUdrg.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var bIsPUEvent, bIsWorkDays : boolean;
    cNCH, cUpper : ShortString;
begin
  bIsPUEvent := (qrySpsIsEvent.AsString = 'Y');
  bIsWorkDays := (qrySpsIsWorkDays.AsString = 'Y');
  cNCH := qrySpsNCH.AsString;
  with dbgrSps.Canvas do begin
    cUpper := UpperCase(Column.Field.FieldName);
    if not (gdFocused in State) then begin
      if (cNCH = '') then begin
        if bIsPUEvent or not bIsWorkDays then
          Font.Color := clFuchsia
        else
          Font.Color  := clRed; end
      else if (cNCH = 'Z') then begin
        //if bIsPUEvent or not bIsWorkDays then
        //  Font.Color  := clNavy
        //else
          Font.Color := clBlue; end
      else begin
        if bIsPUEvent or not bIsWorkDays then
          Font.Color  := clGray
        else
          Font.Color  := clWindowText;
      end;
      {
      if (qrySps.FieldByName('KdSps').AsInteger <> nAppKdSpsUsr) and
           (UpperCase(Column.FieldName) = 'KDSPS') then begin
        Font.Style := [];
      }
      if (qrySps.FieldByName('KdObj').AsInteger <>
                   qrySps.FieldByName('OldKdObj').AsInteger) then begin
        Font.Style := [];
        if cUpper = 'KDSPS' then
          Brush.Color := clYellow;
      end;
    end;
  end;
  dbgrSps.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrOtklDrawColumnCell(
  Sender: TObject;
  const Rect: TRect;
  DataCol: Integer;
  Column: TColumn;
  State: TGridDrawState
);
var
  VidN, FldNm: ShortString;
  DS: TDataSet;
begin
  DS := DbgrOtkl.DataSource.DataSet;
  VidN := Ds.FieldByName('VidN').AsString;
  FldNm := UpperCase(Column.FieldName);

  with DbgrOtkl, Canvas do begin
    if not (gdFocused in State) then begin
      // Дифференциация по датам расчёта и начисления
      if DS.FieldByName('DtProc').AsDateTime > dDtProc then begin
        // из будущего месяца за текущий
        Font.Color  := clOlive;
        // clInfoBk
        Brush.Color := mDbgrOtklColor - PLUS_COLOR;

      end else if DS.FieldByName('DtProc').AsDateTime < dDtProc then begin
        // из прошлого за текущий
        Font.Color := clPurple;
        // clCream
        Brush.Color := mDbgrOtklColor - MINUS_COLOR;

      end else begin
        // отклонения текущего месяца
        if DS.FieldByName('ZaMesGod').AsDateTime <
          DS.FieldByName('DtProc').AsDateTime
        then
          // за прошлые месяцы
          Brush.Color := mDbgrOtklColor - MINUS_COLOR
        else if DS.FieldByName('ZaMesGod').AsDateTime >
          DS.FieldByName('DtProc').AsDateTime
        then
          // переходящие на будущие месяцы
          Brush.Color := mDbgrOtklColor - PLUS_COLOR
        else
          Brush.Color := mDbgrOtklColor;

        Font.Color := clWindowText;
      end;

      // Поле "списка" для неправильных SpecNr'ов
      if (UpperCase(Column.FieldName) = 'KDSPS')
        and (DS.FieldByName('SpecPS').AsInteger = -1)
      then
        Brush.Color := clYellow;

      // "Вид начисл" для больн. и отпусков с неправильными SpecNr'ами
      if (UpperCase(Column.FieldName) = 'VIDN')
        and (
          // отпускные
          ((VidN >= '2400') and (VidN < '2500'))
          // больничные
          or ((VidN >= '2600') and (VidN < '2700'))
        )
        // введены не по правилам
        and (DS.FieldByName('Spec_NR').IsNull
          or (DS.FieldByName('PrPV').AsInteger = 7)
        )
      then
        Brush.Color := clLime;

      // Пересчётные виды:
      if (DS.FieldByName('PdN').AsInteger <= 0)
        or (VidN = '8801') or (VidN = '8802')
      then
        Font.Color := clFuchsia;

      if (Column.FieldName = 'VIDN') then
        Font.Color := clTeal
      else if (Column.FieldName = 'OldVidN') then
        Font.Color := clGray
      else if ((VidN >= '7500') and (VidN < '7600'))
        // выплаты
        or (VidN = '6611')
        // переводы
      then
        Font.Color := clBlue;

      // Отрицательные значения
      if ((Column.FieldName = 'SUMMA') or (Column.FieldName = 'CHAS'))
        and (Column.Field.Value < 0)
      then
        Font.Color := clRed;

      if DS.FieldByName('Storn').AsBoolean then begin
        Font.Color := clFuchsia;
        Font.Style := [];
      end;

      if FldNm = 'SUMMA' then
        Brush.Color := clWindow;

      if DS.FieldByName('OTKL_SOVM').AsString = 'Y' then
        Font.Style := [fsItalic, fsBold];
    end;

    if (DS.FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr)
      // Мне показываем все списки одинаково
      and (nAppKdUsr <> 101)
    then
      Font.Style := [];

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrNUDrawColumnCell(
  Sender: TObject;
  const Rect: TRect;
  DataCol: Integer;
  Column: TColumn;
  State: TGridDrawState);
var
  VidN: ShortString;
  FldNm, NR: ShortString;
  Ds: TDataSet;
begin
  FldNm := UpperCase(Column.FieldName);

  with DbgrNU, Canvas do begin
    Ds := DbgrNU.DataSource.DataSet;
    VidN := Ds.FieldByName('VidN').AsString;
    NR := Ds.FieldByName('NR').AsString;

    if not (gdFocused in State) then begin
      if (Ds.FieldByName('ZaMesGod').AsDateTime > dDtProc) then
        Brush.Color := mDbgrNuColor - PLUS_COLOR   // clCream

      else if (Ds.FieldByName('ZaMesGod').AsDateTime < dDtProc) then
        Brush.Color := mDbgrNuColor - MINUS_COLOR   //clInfoBk

      else
        Brush.Color := mDbgrNuColor;    //clWindow;

      if (Ds.FieldByName('ZaMesGod').AsDateTime > dDtProc) then begin
        if VidN >= '8000' then
          Font.Color := clGray       // служебные и платежи предприятия
        else
          Font.Color := clOlive;

      end else if VidN >= '8000' then   // служебные и платежи предприятия
        Font.Color := clGray

      // выплаты и переводы
      else if ((VidN >= '7500') and (VidN < '7600'))
        or (VidN = '6611')
      then
        Font.Color := clBlue

      else if (Ds.FieldByName('DtProc').AsDateTime < dDtProc)
        or (Ds.FieldByName('PrPV').AsInteger = 5)
      then
        Font.Color := clGreen

      else if Ds.FieldByName('PrPV').AsInteger = 6 then
        Font.Color := clPurple
        
      else if (Ds.FieldByName('PrPV').AsInteger = 1)
        or (Ds.FieldByName('VidN').AsString = '5011')
        or (Ds.FieldByName('VidN').AsString = '5012')
        or (Ds.FieldByName('PrPV').AsInteger = 7)
      then
        Font.Color := clMaroon
        
      else if Ds.FieldByName('PrPV').AsInteger = 3 then
        Font.Color := clNavy
      else
        Font.Color := clWindowText;

      if VidN = '2724' then    // долг за работником
        Font.Color := clRed;

      if (Ds.FieldByName('PdN').AsInteger <= 0) then
        Font.Color := clFuchsia;

      if Ds.FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr then
        Font.Style := []
      else
        Font.Style := [fsBold];

      if (Column.FieldName = 'VIDN') then
        Font.Color := clTeal
      else if (Column.FieldName = 'OldVidN') then
        Font.Color := clGray
      else if (Column.FieldName = 'SUMMA') and (Column.Field.AsFloat < 0) then
        Font.Color := clRed
      else if (Column.FieldName = 'SmN')
        or (Column.FieldName = 'SmU') then
      begin
        if (Column.FieldName = 'SmU')
          or Column.Field.IsNull
          or (Column.Field.AsFloat < 0)
        then
          Font.Color := clMaroon
        else
          Font.Color := clWindowText;

        Font.Style := [fsBold];
      end;

      if ((FldNm = 'SUMMA') or (FldNm = 'SMN') or (FldNm = 'SMU'))
        and popNuSumBrush.Checked
      then
        Brush.Color := clWindow;

      if (FldNm = 'CHAS') and (Column.Field.AsFloat < 0) then
        Font.Color := clRed;

      if LbxF8.Items.IndexOf(NR) >= 0 then
        Brush.Color := clLime;

      if not Ds.FieldByName('Sovm').IsNull
        and (Ds.FieldByName('Sovm').AsString > '0')
        or (Ds.FieldByName('NuSovm').AsString = '1')
        or (Ds.FieldByName('NuSovm').AsString = 'Y')
      then
        Font.Style := [fsItalic, fsBold];

      if Ds.FieldByName('Storn').AsString = 'Y' then begin
        Font.Color := clFuchsia;
        Font.Style := Font.Style - [fsBold];
      end;
    end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrNu2DrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cVidN : string4; cFldNm : ShortString;
begin
  cVidN := dbgrNu2.DataSource.DataSet.FieldByName('VidN').AsString;
  cFldNm := UpperCase(Column.FieldName);
  with dbgrNu2.Canvas do begin
    if not (gdFocused in State) then begin
      if (dbgrNu2.DataSource.DataSet.
                      FieldByName('ZaMesGod').AsDateTime > dDtProc) then
        Brush.Color := mDbgrNu2Color-PLUS_COLOR
      else if (dbgrNu2.DataSource.DataSet.
                      FieldByName('ZaMesGod').AsDateTime < dDtProc) then
        Brush.Color := mDbgrNu2Color-MINUS_COLOR   // clInfoBk
      else
        Brush.Color := mDbgrNu2Color;       // clWindow;
      if (dbgrNu2.DataSource.DataSet.
                      FieldByName('ZaMesGod').AsDateTime > dDtProc) then begin
        if cVidN >= '8000' then     // служебные и платежи предприятия
          Font.Color := clGray
        else
          Font.Color := clOlive; end
      else if cVidN >= '8000' then  // служебные и платежи предприятия
        Font.Color := clGray
      else if ((cVidN >= '7500') and (cVidN < '7600')) {выплаты} or
                                      (cVidN = '6611') {переводы} then
        Font.Color := clBlue
      else if (dbgrNu2.DataSource.DataSet.
                           FieldByName('ZaMesGod').AsDateTime < dDtProc) then
        Font.Color := clGreen
      else
        Font.Color := clWindowText;
      if cVidN = '2724' then        // долг за работником
        Font.Color := clRed;
      if dbgrNu2.DataSource.DataSet.
                            FieldByName('KdSps').AsInteger <> gl_nAppKdSpsUsr then
        Font.Style := []
      else
        Font.Style := [fsBold];
      if (Column.FieldName = 'VIDN') then
        Font.Color := clTeal
      else if (Column.FieldName = 'OLDKDVIDN') then
        Font.Color := clGray
      else if (Column.FieldName = 'SUMMA') and (Column.Field.AsFloat < 0) then
        Font.Color := clRed
      else if (Column.FieldName = 'SmN') or
                 (Column.FieldName = 'SmU') then begin
        if (Column.Field.AsFloat < 0) or (Column.FieldName = 'SmU') then
          Font.Color := clMaroon
        else
          Font.Color := clWindowText;
        Font.Style := [fsBold];
      end;
      if ((cFldNm = 'SUMMA') or (cFldNm = 'SMN') or (cFldNm = 'SMU')) and
                                                  popNu2SumBrush.Checked then
        Brush.Color := clWindow;
      if (cFldNm = 'CHAS') and (Column.Field.AsFloat < 0) then
        Font.Color := clRed;
    end;
  end;
  dbgrNu2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popTvObjFullExpandClick(Sender: TObject);
begin
  with TvObj do begin
    Items.BeginUpdate;
    FullExpand;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popTvObjFullCollapseClick(Sender: TObject);
begin
  with TvObj do begin
    Items.BeginUpdate;
    FullCollapse;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
function TFormZpMain.MyFileExists(cDirNm, cFileNm : string) : boolean;
begin
  with tblTmp do begin
    if Active then Close;
    DataBaseName := cDirNm;
    TableName := cFileNm;
    Result := Exists;
    DataBaseName := '';
    TableName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNuShwSpecVidsClick(Sender: TObject);
begin
  if not bFormMainReady then
    exit;
    
  popNuShwSpecVids.Checked := not popNuShwSpecVids.Checked;
  DmMain.LoadPayments(sBtnShowSpecVids.Down, NuShowMode = snuNewShort);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;   // clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.TvObjEnter(Sender: TObject);
begin
  LabelTvObj.Color := clYellow;   //clInfoBk;  
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.TvObjExit(Sender: TObject);
begin
  LabelTvObj.Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuMassVedOtklClick(Sender: TObject);
begin
  // Ведомости предварительного ввода отклонений
  // >> z_VdPV
  ShowVdPV(dDtProc, gl_nAppKdSpsUsr, nAppKdUsr)
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpMyNewVidsClick(Sender: TObject);
begin
//  ShowNwVids;      {z_NwVids}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.OnOffPanelMinutku(bOnOff : boolean; nM, nY : word);
begin
  if not bOnOff then
    PanelMinutku.Visible := false
  else begin
    LabelMinutkuFIO.Caption := qrySpsFamIO.AsString;
    LabelMinutkuMG.Caption := MesRus(nM) + ' ' + IntToStr(nY);
    PanelMinutku.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpKdSpsClick(Sender: TObject);
begin
  ShowKdSps(0);      {a_ShKSps}
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuStatBarClick(Sender: TObject);
begin
  mMnuStatBar.Checked := not mMnuStatBar.Checked;
  SetStatBar;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetStatBar;
begin
  StatusBar.Visible := mMnuStatBar.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuFontNormalClick(Sender: TObject);
begin
  if not mMnuFontNormal.Checked then begin
    mMnuFontNormal.Checked := true;
    SetFormFont;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuFontBoldClick(Sender: TObject);
begin
  if not mMnuFontBold.Checked then begin
    mMnuFontBold.Checked := true;
    SetFormFont;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetFormFont;
begin
  if mMnuFontBold.Checked then begin
    Font.Name := 'Arial';
//    Font.Name := 'MS Sans Serif';
    Font.Size := 10; end
  else begin
    Font.Name := 'MS Sans Serif';
    Font.Size := 8;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuFontTablesClick(Sender: TObject);
begin
  FontDialog1.Font := dbgrSps.Font;
  if FontDialog1.Execute then begin
    cFontName := FontDialog1.Font.Name;
    nFontSize := FontDialog1.Font.Size;
    bFontItalic := (fsItalic in FontDialog1.Font.Style);
    bFontBold := (fsBold in FontDialog1.Font.Style);
    SetTabsFont;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetTabsFont;
var mFontStyle : TFontStyles;
begin
  if bFontItalic and bFontBold then
    mFontStyle := [fsBold, fsItalic]
  else if bFontBold then
    mFontStyle := [fsBold]
  else if bFontItalic then
    mFontStyle := [fsItalic]
  else
    mFontStyle := [];
  TvObj.Font.Name  := cFontName;
  TvObj.Font.Size  := nFontSize;
  TvObj.Font.Style := mFontStyle;

  dbgrSps.Font.Name      := cFontName;
  dbgrNU.Font.Name       := cFontName;
  dbgrOtkl.Font.Name     := cFontName;
  dbgrPrmUv.Font.Name    := cFontName;
  dbgrPere.Font.Name     := cFontName;
  dbgrNadb.Font.Name     := cFontName;
  dbgrUdrg.Font.Name     := cFontName;
  dbgrNu2.Font.Name      := cFontName;

  dbgrSps.TitleFont.Name      := cFontName;
  dbgrNU.TitleFont.Name       := cFontName;
  dbgrOtkl.TitleFont.Name     := cFontName;
  dbgrPrmUv.TitleFont.Name    := cFontName;
  dbgrPere.TitleFont.Name     := cFontName;
  dbgrNadb.TitleFont.Name     := cFontName;
  dbgrUdrg.TitleFont.Name     := cFontName;
  dbgrNu2.TitleFont.Name      := cFontName;

  dbgrSps.Font.Size      := nFontSize;
  dbgrNU.Font.Size       := nFontSize;
  dbgrOtkl.Font.Size     := nFontSize;
  dbgrPrmUv.Font.Size    := nFontSize;
  dbgrPere.Font.Size     := nFontSize;
  dbgrNadb.Font.Size     := nFontSize;
  dbgrUdrg.Font.Size     := nFontSize;
  dbgrNu2.Font.Size      := nFontSize;

  dbgrSps.TitleFont.Size      := nFontSize;
  dbgrNU.TitleFont.Size       := nFontSize;
  dbgrOtkl.TitleFont.Size     := nFontSize;
  dbgrPrmUv.TitleFont.Size    := nFontSize;
  dbgrPere.TitleFont.Size     := nFontSize;
  dbgrNadb.TitleFont.Size     := nFontSize;
  dbgrUdrg.TitleFont.Size     := nFontSize;
  dbgrNu2.TitleFont.Size      := nFontSize;
  LabelCurMes.Font.Size       := nFontSize;
  PanelTotals.Font.Size       := nFontSize;
  LblEmplInfo.Font.Size       := nFontSize;

  dbgrSps.Font.Style      := mFontStyle;
  dbgrNU.Font.Style       := mFontStyle;
  dbgrOtkl.Font.Style     := mFontStyle;
  dbgrPrmUv.Font.Style    := mFontStyle;
  dbgrPere.Font.Style     := mFontStyle;
  dbgrNadb.Font.Style     := mFontStyle;
  dbgrUdrg.Font.Style     := mFontStyle;
  dbgrNu2.Font.Style      := mFontStyle;
  LabelCurMes.Font.Style  := mFontStyle;
  PanelTotals.Font.Style  := mFontStyle;
  LblEmplInfo.Font.Color  := clMaroon;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.FontDialog1Apply(Sender: TObject; Wnd: HWND);
begin
    cFontName := FontDialog1.Font.Name;
    nFontSize := FontDialog1.Font.Size;
    bFontItalic := (fsItalic in FontDialog1.Font.Style);
    bFontBold := (fsBold in FontDialog1.Font.Style);
    SetTabsFont;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpSovmClick(Sender: TObject);
begin
  ShowSovm;            {z_GtSovm}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.qryNu2CalcFields(DataSet: TDataSet);
begin
  if qryNu2Summa.AsFloat >= 0 then
    qryNu2SmN.AsFloat := qryNu2Summa.AsFloat
  else
    qryNu2SmU.AsFloat := -qryNu2Summa.AsFloat;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuHostCSClick(Sender: TObject);
var bSocActive : boolean;
begin
  bSocActive := SocZp.Connected;
  if InputQuery('Имя хоста',
                'Введите Host для расчета "Client/Server"', cZpHostNm) and
                                                 (cZpHostNm <> '') then begin
    if bSocActive then
      SocZp.Close;
    SocZp.Host := cZpHostNm;
    if bSocActive then
      SocZp.Connected := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuVedAlimClick(Sender: TObject);
begin
  PrtVedAlimCurMes(dDtProc);  {z_PrtAlm}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuVedIspLClick(Sender: TObject);
begin
  ShwVedIspL(dDtProc);    {z_VdIspL}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuPostPvdSpsClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShowPostPvd(dDtPrc);   {z_ShPvd}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuPostPvdVedomClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  PrtPostPvd(dDtPrc);   {z_PrtPvd}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtOtherVedProfClick(Sender: TObject);
begin
  PrtVedProfCurMes(dDtProc);  {z_PrtPrf}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSvdMOClick(Sender: TObject);
var dDtNewMo, dDtPrc : TDateTime; nCase : SmallInt;
begin
  dDtPrc := dDtProc;
  dDtNewMo := EncodeDate(2007, 1, 1);
  nCase := 1;
  if dDtPrc < dDtNewMo then
    SvdSpZ(dDtPrc)   {z_SvdSPZ} //старый
  else
    Mo_52(nCase, dDtPrc);    {z_mo52}   //новый
end;
(*
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSvdNewMOClick(Sender: TObject);
var dDtPrc : TDateTime; nCase : SmallInt;
begin
  dDtPrc := dDtProc;
  nCase := 2;
  Mo_52(nCase, dDtPrc);    {z_mo52}   //новый
end;
*)
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSvdMo2011Click(Sender: TObject);
begin
  // >> z_moFin
  TFormMoFin.Run(dDtProc, false);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSvdMoFinClick(Sender: TObject);
begin
  // >> z_moFin
  TFormMoFin.Run(dDtProc, true);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popNuForMOClick(Sender: TObject);
var nTabN : integer; dDtPrc : TDateTime; cFamIO : ShortString;
begin
  nTabN  := qrySpsTabN.AsInteger;
  cFamIO := qrySpsFamIO.AsString;
  dDtPrc := dDtProc;
  ShDatForMO(nTabN, dDtPrc, cFamIO);   {z_DtFrMo}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpCheckMOClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  if MessageDlg('Процедура выполняется 2-3 минуты. Продолжать?',
                             mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    ChDatForMO(dDtPrc);   {z_DtChMo}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  if dDtPrc < dDt01012011 then begin
    mMnuZpPrtSvdMO.Visible := true;
    mMnuZpPrtSvdMo2011.Visible := false; end
  else begin
    mMnuZpPrtSvdMO.Visible := false;
    mMnuZpPrtSvdMo2011.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuNewPeregonuClick(Sender: TObject);
begin
//  NewPeregonuShow; {z_NwPrgn}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPstPsbClick(Sender: TObject);
begin
  ShowPstPsb; {z_PstPsb}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuAllAlimClick(Sender: TObject);
begin
  ShowAllAlim(dDtProc, 1);    {z_ShAlm}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuAllAlimBoevueClick(Sender: TObject);
begin
  ShowAllAlim(dDtProc, 2);    {z_ShAlm}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuNU106Click(Sender: TObject);
begin
//  updNu106;  {z_nu106}
end;
(*
//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnLittleSPZClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShowMyShPZ(dDtPrc);  {z_mySpZ}
end;
*)
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpFillVBlnClick(Sender: TObject);
begin
  //  PodklOldVBln;  {z_OVBln}
  ShowMessage('Выключено насовсем - все что могли перегнали');
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsPoisk2Click(Sender: TObject);
begin
  if DmUsrSetts.NewEmplSrchDlg then
    CallNewEmplSrch
  else
    CallOldEmplSrch
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.CallOldEmplSrch;
var nTabN, nKdObj, nRetCase : integer; cMsg : ShortString; bMore : boolean;
begin
  nKdObj := 0;
  nTabN  := 0;
  nRetCase  := 0;
  bMore := true;
  if VvodFmTn(dDtProc, nTabN, nKdObj, nRetCase) {z_VvFmTn} then begin
    Application.ProcessMessages;
    // nRetCase вернет либо 0 - поиск по таб.нр,
    // либо не 0 - поиск по фамилии с готовым результатом поиска
    if nRetCase = -1 then  // вернулись с сообщением о неудаче
      Exit
    else if nRetCase = 0 then begin // введен ТабН -
      with qryTmp do begin          // продолжаем возиться тут
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Select s.KdSps, s.KdObj, k.ShObj, k.NmObj, s.TabN, ' +
                ' p.FamIO from Z_Sps s ' +
                ' Left outer Join z_FamIO(s.TabN) p on 1=1 ' +
                ' Left outer Join z_KdObj k on k.KdObj = s.KdObj ' +
                ' where (s.DtProc = :dDtProc) and (s.TabN = :nTabN) ' +
                ' order by s.KdObj, s.KdSps');
        ParamByName('dDtProc').AsDateTime := dDtProc;
        ParamByName('nTabN').AsInteger := nTabN;
        Open;
        if (RecordCount = 1) and (not FieldByName('KdObj').IsNull) then begin
          nKdObj := FieldByName('KdObj').AsInteger;
          Close;
          SQL.Clear;
          DataBaseName := ''; end
        else if (RecordCount > 1) then begin // предложить выбор из нескольких
          if not VuborResTabN(qryTmp, nKdObj) {z_VRTabN} then
            bMore := false; // отказ от выбора в VuborResTabN
        end;
        Close;
        SQL.Clear;
        DataBaseName := '';
      end;
      if bMore and (nKdObj > 0) then begin
        if (qryObj.FieldByName('KdObj').AsInteger <> nKdObj) and
                             not qryObj.Locate('KdObj', nKdObj, []) then begin
          ShowMessage('Подразделения ' + IntToStr(nKdObj) +
                                  ' нет в списке текущего месяца');
          Exit;
        end;
        qrySps.Locate('TabN', nTabN, []);
        dbgrSps.SetFocus; end
      else if bMore then with qryTmp do begin
        // Проверить в справочнике сотрудников
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Select * from Z_Upi where (TabN = :nTabN)');
        ParamByName('nTabN').AsInteger := nTabN;
        Open;
        if ((RecordCount <> 0) and (not FieldByName('NR').IsNull)) then
          cMsg := 'Табельный номер "' + IntToStr(nTabN) + '"  ( ' +
                   FieldByName('Fam').AsString + '  ' +
                   FieldByName('Ima').AsString + '  ' +
                   FieldByName('Otch').AsString +
                   ' )  есть в' + #13#10 + 'справочнике "Сотрудники", ' +
                   'но отсутствует в списке текущего месяца.'
        else
          cMsg := 'Табельный номер "' + IntToStr(nTabN) +
                  '"  не найден ни в списке' + #13#10 +
                  'текущего месяца, ни в справочнике "Сотрудники"';
        ShowMessage(cMsg);
        Close;
        SQL.Clear;
        DataBaseName := '';
      end; end
    else if (nKdObj <> 0) and (nTabN <> 0) then begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      if qryObj.FieldByName('KdObj').AsInteger <> nKdObj then begin
        cMsg := '';
        if (qryObj.FieldByName('KdObj').AsInteger <> nKdObj) and
                               not qryObj.Locate('KdObj', nKdObj, []) then
          cMsg := 'Подразделения ' + IntToStr(nKdObj) +
                  ' нет в списке текущего месяца.'
        else if (not qrySps.Locate('TabN', nTabN, [])) then
          cMsg := 'Табельный номер ' + IntToStr(nTabN) + ' в справочнике ' +
                  '"Сотрудники", но его нет в списке текущего подразделения.';
        if cMsg <> '' then
          ShowMessage(cMsg); end
      else
        qrySps.Locate('TabN', nTabN, []);
      dbgrSps.SetFocus;
      Screen.Cursor := crDefault;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.CallNewEmplSrch;
var
  TabN, KdObj: integer;
  Found: boolean;
  SelectResult: TSelectResult;
  SelectCanceled: boolean;
begin
  KdObj := 0;
  SelectCanceled := false;

  if DmUsrSetts.OneStepEmplSrch then
    Found := TFrmSrchEmpl.SearchBothTabNObj(dDtProc, TabN, KdObj, SelectResult)
  else begin
    Found := TFrmSrchEmpl.SearchOnlyTabN(TabN);
    SelectResult := SelResClarifyObj;
  end;

  if Found then begin
    if (SelectResult = SelResClarifyObj) then begin
      InitQuery(qryTmp);

      with qryTmp do begin
        SQL.Add(
          'select s.KdSps, s.KdObj, k.ShObj, k.NmObj, s.TabN, p.FamIO ' +
          'from   Z_Sps s ' +
            'left join z_FamIO(s.TabN) p on 1=1 ' +
            'left join z_KdObj k on k.KdObj = s.KdObj ' +
          'where s.DtProc = :DtProc and s.TabN = :TabN ' +
          'order by s.KdObj, s.KdSps');
        ParamByName('DtProc').AsDateTime := dDtProc;
        ParamByName('TabN').AsInteger := TabN;
        Open;

        if RecordCount = 0 then
          KdObj := 0
        else if RecordCount = 1 then
          KdObj := FieldByName('KdObj').AsInteger
        else
          SelectCanceled := not VuborResTabN(qryTmp, KdObj) {z_VRTabN};
      end; {with}

      ReleaseQuery(qryTmp);
    end; {if}

    if (KdObj = 0) and not SelectCanceled then begin
      TQryUtils.PeekUPI(DmMain.QryPeek, TabN);

      with DmMain.qryPeek do
        ShowMessage('Табельного № ' + IntToStr(TabN) + ' (' +
          FieldByName('Fam').AsString + ' ' +
          FieldByName('Ima').AsString + ' ' +
          FieldByName('Otch').AsString + ' ' +
          ') нет в списке текущего месяца.');

      ReleaseQuery(DmMain.QryPeek);
    end else begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      qryObj.Locate('KdObj', KdObj, []);
      qrySps.Locate('TabN', TabN, []);

      dbgrSps.SetFocus;
      Screen.Cursor := crDefault;
    end; {if}
  end; {if}
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSprSpov_2Click(Sender: TObject);
var nTabN : integer;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    nTabN := qrySps.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  Spr_Spov2(nTabN); {z_SSpov2}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSprDohodClick(Sender: TObject);
var nTabN : integer;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    nTabN := qrySps.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  TFormDlgSDhd.DlgSprDhd(nTabN, 'SprDhd'); {z_DlSDhd}
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSprSubsClick(Sender: TObject);
var nTabN : integer;
begin
  // справка "для субсидий" по полям DtProc
  if qrySps.Active and (qrySps.RecordCount > 0) then
    nTabN := qrySps.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  TFormDlgSDhd.DlgSprDhd(nTabN, 'SprSubs'); {z_DlSDhd}
end;
//..............................................................................
procedure TFormZpMain.MiPrintSubsAbroadClick(Sender: TObject);
var
  EmplId: Integer;
begin
  // Справка "для субсидий" для выехавш. за рубеж.
  if qrySps.Active and (qrySps.RecordCount > 0) then
    EmplId := qrySps.FieldByName('TabN').AsInteger
  else
    EmplId := 0;
  TFormDlgSDhd.DlgSprDhd(EmplId, 'IncomeInqAbroad'); {z_DlSDhd}
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSprSubs3Click(Sender: TObject);
var nTabN : integer;
begin
  // справка "для субсидий" новая по полям DtProc
  if qrySps.Active and (qrySps.RecordCount > 0) then
    nTabN := qrySps.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  TFormDlgSDhd.DlgSprDhd(nTabN, 'SprSubs3');
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSprKredClick(Sender: TObject);
var nTabN : integer;
begin
  // справка "для кредитов" по полям DtProc (до 02-2013 было ZaMesGod)
  if qrySps.Active and (qrySps.RecordCount > 0) then
    nTabN := qrySps.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  TFormDlgSDhd.DlgSprDhd(nTabN, 'SprKred'); {z_DlSDhd}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSprNlgClick(Sender: TObject);
var nTabN : integer;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    nTabN := qrySps.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  TFormDlgSDhd.DlgSprForNlg(nTabN, 'SprNlgInsp'); {z_DlSDhd}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuMassNadbClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;                   
  ShwNadb(dDtPrc, gl_nAppKdSpsUsr);  {z_ShNadb}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuMassPereClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShwPere(dDtPrc, gl_nAppKdSpsUsr);  {z_ShPere}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.FormKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
//var bMonthClosed : boolean;
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где  нужно,  пользуйтесь  контекстными  меню')
  else if ((Key = VK_F3) or (Key = VK_F4)) and (Shift = []) then
    popSpsPoisk2.Click
//  else if (Key = VK_F8) and (Shift = []) then
//    sBtnF8.Click
//  else if (Key = VK_F9) and (Shift = []) then begin
//    bMonthClosed := MonthClosed(0);  // Это срабатывает только там, где нет
//    if bMonthClosed then begin       // PopMenu c VK_F9, выбранной в качестве
//      ShowMessage('Месяц закрыт для расчета');  // ShortCut (напр.на TVObj)
//      Abort;
//    end; end
  else if (Key = VK_TAB) and (Shift = [ssCtrl]) then begin
    if ActiveControl = TvObj then
       ActiveControl := dbgrSps
    else if ActiveControl = dbgrSps then begin
      if not PageControl.Visible then begin
        if dbgrNu.Visible then
          ActiveControl := dbgrNu
        else
          ActiveControl := dbgrNu2; end
      else begin
        if PageControl.ActivePage = tsPrUv then
          ActiveControl := dbgrPrmUv
        else if PageControl.ActivePage = tsPere then
          ActiveControl := dbgrPere
        else if PageControl.ActivePage = tsNadb then
          ActiveControl := dbgrNadb
        else if PageControl.ActivePage = tsUderg then
          ActiveControl := dbgrUdrg
        else if PageControl.ActivePage = tsOtkl then
          ActiveControl := dbgrOtkl;
      end; end
    else if (ActiveControl = dbgrPrmUv) or (ActiveControl = dbgrPere) or
             (ActiveControl = dbgrNadb) or (ActiveControl = dbgrUdrg) or
                                        (ActiveControl = dbgrOtkl) then begin
      if dbgrNu.Visible then
        ActiveControl := dbgrNu
      else
        ActiveControl := dbgrNu2; end
    else if (ActiveControl = dbgrNu) or (ActiveControl = dbgrNu2) then
       ActiveControl := TvObj;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.PanelTotalsDblClick(Sender: TObject);
begin
  sBtnUchKart.Down := not sBtnUchKart.Down;
  SetShowUchKart;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnUchKartClick(Sender: TObject);
begin
  SetShowUchKart;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.SetShowUchKart;
begin
  if sBtnUchKart.Down then begin
    PageControl.Visible := true;
    PanelDbg.Visible := bFlagDbg;
    SplitNU.Visible := true; end
  else begin
    if (ActiveControl = dbgrPrmUv) or (ActiveControl = dbgrPere) or
             (ActiveControl = dbgrNadb) or (ActiveControl = dbgrUdrg) or
                                        (ActiveControl = dbgrOtkl) then begin
      if dbgrNu.Visible then
        ActiveControl := dbgrNu
      else
        ActiveControl := dbgrNu2;
    end;
    SplitNU.Visible := false;
    PageControl.Visible := false;
//    PanelDbg.Visible := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popObjFonClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    TvObj.Color := ColorDialog1.Color;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsFonClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    dbgrSps.Color := ColorDialog1.Color;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popMnuFonClick(Sender: TObject);
begin
  if (popMnu.PopupComponent = dbgrPrmUv) then begin
    if ColorDialog1.Execute then begin
      dbgrPrmUv.Color := ColorDialog1.Color;
      //dbgrPrmUvSps.Color := ColorDialog1.Color;
    end; end
  else if (popMnu.PopupComponent = dbgrPere) then begin
    if ColorDialog1.Execute then
      dbgrPere.Color := ColorDialog1.Color; end
  else if (popMnu.PopupComponent = dbgrNadb) then begin
    if ColorDialog1.Execute then
      dbgrNadb.Color := ColorDialog1.Color; end
  else if (popMnu.PopupComponent = dbgrUdrg) then begin
    if ColorDialog1.Execute then
      dbgrUdrg.Color := ColorDialog1.Color;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklFonClick(Sender: TObject);
begin
  ColorDialog1.Color := dbgrOtkl.Color;
  if ColorDialog1.Execute then begin
    mDbgrOtklColor := ColorDialog1.Color;
    dbgrOtkl.Color := mDbgrOtklColor;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNuFonClick(Sender: TObject);
begin
  ColorDialog1.Color := dbgrNu.Color;
  if ColorDialog1.Execute then begin
    mDbgrNuColor := ColorDialog1.Color;
    dbgrNu.Color := mDbgrNuColor;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNu2FonClick(Sender: TObject);
begin
  ColorDialog1.Color := dbgrNu2.Color;
  if ColorDialog1.Execute then begin
    mDbgrNu2Color := ColorDialog1.Color;
    dbgrNu2.Color := mDbgrNu2Color;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklSortByVidNClick(Sender: TObject);
begin
  if not popOtklSortByVidN.Checked then begin
    popOtklSortByVidN.Checked := true;
    popOtklSortByZaMesGod.Checked := false;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklSortByZaMesGodClick(Sender: TObject);
begin
  if not popOtklSortByZaMesGod.Checked then begin
    popOtklSortByZaMesGod.Checked := true;
    popOtklSortByVidN.Checked := false;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsSortByFIOClick(Sender: TObject);
begin
  if not popSpsSortByFIO.Checked then begin
    popSpsSortByFIO.Checked := true;
    popSpsSortByTabN.Checked := false;
    OpenQrySps(gl_nAppKdSpsUsr);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsSortByTabNClick(Sender: TObject);
begin
  if not popSpsSortByTabN.Checked then begin
    popSpsSortByTabN.Checked := true;
    popSpsSortByFIO.Checked := false;
    OpenQrySps(gl_nAppKdSpsUsr);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpVedVClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  VedV(gl_nAppKdSpsUsr, nAppKdUsr, dDtPrc);  {z_VedV}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtQryByVidNClick(Sender: TObject);
begin
  ShwNuVidNZapros; {z_ZprVN}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpOtklByVidNClick(Sender: TObject);
begin
  ShwOtklVidNZapros; {z_ZprVN}
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtArhivkiClick(Sender: TObject);
var
  TabN: Integer;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    TabN := qrySps.FieldByName('TabN').AsInteger
  else
    TabN := 0;

  // >> z_SArhiv
  TFormArhivka.Run(TabN);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.NArhivkiSpanClick(Sender: TObject);
var
  TabN: Integer;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    TabN := qrySps.FieldByName('TabN').AsInteger
  else
    TabN := 0;

  // >> z_SArhiv
  TFrmArhivSpan.Run(almEmployee, TabN);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.NArhivkiInvalidClick(Sender: TObject);
begin
  TFrmArhivSpan.Run(almInvList, 0);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuPathToZplClick(Sender: TObject);
var cDirData, cDirDbg : ShortString;
begin
  cDirData := myGetDirData(Form_Dm.DbMain.AliasName); {a_Lib}
  ShowMessage('cDirData = ' + cDirData);
  cDirDbg := cDirData + 'DBG';
  if not DirectoryExists(cDirdbg) then
    ForceDirectories(cDirdbg);
end;

//------------------------------------------------------------------------------
function TFormZpMain.MyGetDirData(cAliasName : string) : string;
var i, nPos : integer; mList : TStringList;
begin
  Result := '';
  mList := TStringList.Create;
  Session.GetAliasParams(cAliasName, mList);
  for i := 0 to mList.Count-1 do begin
    if pos('SERVER NAME', mList[i]) > 0 then begin
      nPos := pos('=', mList[i]);
      if nPos > 0 then begin
        Result := Copy(mList[i], nPos + 1, 65);
        Result := ExtractFileDir(Result);
        if Copy(Result,Length(Result), 1) <> '\' then
          Result := Result + '\';
        Break;
      end;
      Break;
    end;
  end;
  mList.Free;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuOldZpK_PereClick(Sender: TObject);
begin
  AddPereOpk;  {z_OldPeK}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.NmMnuOldZpK_SpsClick(Sender: TObject);
begin
  AddSpsOpk;   {z_OldSpK}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsHiNUClick(Sender: TObject);
var nKdObj, nTabN : integer; cFamIO, cIdNR : string;
begin
  if not qrySps.Active or (qrySps.RecordCount = 0) then Exit;
  nKdObj := qryObj.FieldByName('KdObj').AsInteger;
  with dbgrSps.DataSource.DataSet do begin
    nTabN := FieldByName('TabN').AsInteger;
    cFamIO := FieldByName('FamIO').AsString;
    cIdNR := FieldByName('ID').AsString;
  end;
  ShowNuPM(nTabN, nKdObj, cFamIO, cIdNR);   {z_NuPM}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsHiBlnClick(Sender: TObject);
begin
  if qrySps.Active and (qrySps.RecordCount <> 0) then
    ShowBlnHistory(qrySpsTabN.AsInteger, qrySpsFamIO.AsString); {z_HiBln}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsHiOtpClick(Sender: TObject);
begin
  if qrySps.Active and (qrySps.RecordCount <> 0) then
    ShowOtpHistory(qrySpsTabN.AsInteger, qrySpsFamIO.AsString); {z_HiOtp}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.LabelTvObjDblClick(Sender: TObject);
var nKdObj : SmallInt;
begin
  if Get_KdObj(dDtProc, nKdObj) {z_GtObj} then begin
    if not qryObj.Locate('KdObj', nKdObj, []) then
      ShowMessage('Не найден код ' + IntToStr(nKdObj) +
                                   ' в списке текущего месяца')
    else
      dbgrSps.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnu1dfClick(Sender: TObject);
begin
  if not bIsFormDfPromResults then
    ShowFormDfMain   {z_DfMain}
  else begin
    if FormDfPromRes.WindowState = wsMinimized then
      FormDfPromRes.WindowState := wsNormal;
    FormDfPromRes.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsMovClick(Sender: TObject);
var nPredKdObj, nNewKdObj, nOsnKdObj, nKdSpZ, nTabN : integer;
    cFamIO, cMsg : ShortString; cShObj, cNmObj, cLogMsg : string;
    bWasUpdated : boolean;
begin
  if qrySps.RecordCount <= 0 then Exit;
  with qrySps do begin
    nNewKdObj := qrySpsKdObj.AsInteger;
    nPredKdObj := nNewKdObj;
    nOsnKdObj := qrySpsOldKdObj.AsInteger;  // контроль - "родной" ли это KdObj
    nTabN := qrySpsTabN.AsInteger;
    cFamIO := qrySpsFamIO.AsString;
    if GetKdObj(nNewKdObj, nKdSpZ, cShObj, cNmObj, bWasUpdated) then begin
      if nNewKdObj = nPredKdObj then begin
        ShowMessage('Сотрудник ' + cFamIO + ' и без перевода ' +
                 'находится в списке подразделения ' + IntToStr(nNewKdObj) + '.');
        Exit;
      end;
      cMsg := 'Перевести сотрудника ' + cFamIO +
                ' в список подразделения ' + IntToStr(nNewKdObj) + ' ' + cNmObj +
                '?:' + #13#10 + '(только на текущий месяц. Чтобы перевод ' +
                'стал постоянным, введите ' +
                'соответствующие изменения в таблицу перемещений)';
      if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
        MovTabN2Obj(dDtProc, nTabN, nPredKdObj, nNewKdObj, nOsnKdObj);

        qryObj.Locate('KdObj', nNewKdObj, []);
        qrySps.Locate('TabN', nTabN, []);
        cLogMsg := cFamIO + '. Перевод из подразд. ' + IntToStr(nPredKdObj) +
                                      ' в подразд. ' + IntToStr(nNewKdObj);
        DmMain.AddLog(Now, nTabN,
                        'Перевод в др.подразд', gc_AppNmUsr, 'Z_SPS', cLogMsg);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.MovTabN2Obj(dDtPrc : TDateTime;
                             nTabN, nPredKdObj, nNewKdObj, nOsnKdObj : integer);
var bObjIsOsn : boolean;
begin
  bObjIsOsn := (nPredKdObj = nOsnKdObj);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update z_SPS set KdObj = :nNewKdObj ');
    if bObjIsOsn {т.е. старое было "родным"} then
      SQL.Add(', OldKdObj = :nOsnKdObj ');
    SQL.Add(' where DtProc = :dDtPrc and ' +
            ' KdObj = :nPredKdObj and TabN = :nTabN');
    ParamByName('nNewKdObj').AsInteger  := nNewKdObj;
    ParamByName('dDtPrc').AsDateTime    := dDtPrc;
    ParamByName('nPredKdObj').AsInteger := nPredKdObj;
    ParamByName('nTabN').AsInteger      := nTabN;
    if bObjIsOsn then
      ParamByName('nOsnKdObj').AsInteger := nNewKdObj;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuShwLogTabNClick(Sender: TObject);
var dDtPrc : TDateTime; nTabN : Integer; cFamIO : ShortString;
begin
  if qrySps.RecordCount = 0 then Exit;
  if bIsFormShwLog then
    FormShwLog.Close;
  dDtPrc := dDtProc;
  nTabN := qrySpsTabN.AsInteger;
  cFamIO := qrySpsFamIO.AsString;
  ShowLogByTabN(dDtPrc, nTabN, cFamIO);     {z_ShwLog}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuShwLogClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  if bIsFormShwLogByTabN then
    FormShwLog.Close;
  dDtPrc := dDtProc;
  ShowLog(dDtPrc);     {z_ShwLog}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popTvObjPrtCntByObjClick(Sender: TObject);
begin
  Application.ProcessMessages;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select KdObj, Count(TabN) as CNT from z_sps ' +
            ' where dtProc = :dDtPrc and KdSps = :nKdSps group by KdObj');
    ParamByName('dDtPrc').AsDateTime := dDtProc;
    ParamByName('nKdSps').AsInteger  := gl_nAppKdSpsUsr;
    Open;
    if RecordCount <= 0 then
      ShowMessage('Нет данных для печати')
    else
      F6_PrtChislByObj(dDtProc, qryTmp);  {z_CmnPrt}
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popTvObjPrtSpsCurObjClick(Sender: TObject);
var n_KdSps : SmallInt;
begin
  if (not qrySps.Active) or (qrySps.RecordCount <= 0) then begin
    ShowMessage('Нечего печатать');
    Exit;
  end;
  n_KdSps := gl_nAppKdSpsUsr;
  ShwSpsCurObj(qryObjKdObj.AsInteger, n_KdSps, dDtProc);  {z_ShCrOb}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtOtherSpsCurMesClick(Sender: TObject);
var n_KdSps : SmallInt;
begin
  if (not qryObj.Active) or (qryObj.RecordCount <= 0) then begin
    ShowMessage('Нечего печатать');
    Exit;
  end;
  n_KdSps := gl_nAppKdSpsUsr;
  ShwSpsCurMes(n_KdSps, dDtProc);  {z_ShCrOb}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuCheckVuplClick(Sender: TObject);
var dDtPrc : TDateTime; nCntDlgPrp : SmallInt; nSmDlgPrp : double;
begin  // Проверка окончательных выплат
  dDtPrc := dDtProc;
  ShwEndVupl(dDtPrc, nCntDlgPrp, nSmDlgPrp);  {z_ShEndV}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmMyCheckSvPorogiClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  CheckVznPrp(dDtPrc);  {z_ChkPrp}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuPlOtdClick(Sender: TObject);
var dDtPrc : TDateTime;  // Отчет для планового отдела
begin
  dDtPrc := dDtProc;
  ShwRepPlOtd(dDtPrc);  {z_RPlOtd}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpUsersNewClick(Sender: TObject);
begin
  if (nAppKdUsr = 101) or (nAppKdUsr = 146) {Я, Кравцов} then
    ShowUsersNew
  else
    TFrmUsrSelf.Run(nAppKdUsr);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuActiveUsersClick(Sender: TObject);
begin
  ShwWrkUsrs;           {a_WrkUsr}
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.BtnLockEmplClick(Sender: TObject);
begin
  LockEmployee((Sender as TSpeedButton).Down);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.LblLockedEmployeeDblClick(Sender: TObject);
begin
  BtnLockEmpl.Down := not BtnLockEmpl.Down;
  LockEmployee(BtnLockEmpl.Down);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.LockEmployee(Value: Boolean);
begin
  if Value then begin
    LockedEmplId := QrySpsTabN.AsInteger;
    LockedEmplName  := QrySpsFamIO.AsString;

    with LblLockedEmployee, Font do begin
      Color := clRed;
      Style := [fsBold];
      Caption := IntToStr(LockedEmplId) + ' ' + LockedEmplName;
    end;

    BtnLockEmpl.Font.Color := clRed;

  end else begin
    LockedEmplId := 0;
    LockedEmplName := '';

    with LblLockedEmployee, Font do begin
      Color := clWindowText;
      Style := [];
      Caption := '';
    end;

    BtnLockEmpl.Font.Color := clWindowText;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuSpovClick(Sender: TObject);
begin
  // ShowFormSpovMain;      {z_DsMain}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmSetsToBDClick(Sender: TObject);
begin
  mmSetsToBD.Checked := not mmSetsToBD.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuInvNoPensClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShowInvNoPens(dDtPrc);  {z_InvPns}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuPensCMClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShowPensCurMes(dDtPrc);  {z_Pens}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuPodklOtklClick(Sender: TObject);
begin
  ShowMessage('Надо сначала проверить и подогнать под конкретный' + #13#10 +
              'случай процедуру PodklDopOtkl;  {z_OtklDp}');
  //PodklDopOtkl;  {z_OtklDp}   // Сработало все нормально
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsVidAllClick(Sender: TObject);
begin
  if not popSpsVidAll.Checked then begin
    popSpsVidAll.Checked := true;
    popSpsVidActive.Checked := false;
    OpenQrySps(gl_nAppKdSpsUsr);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsVidActiveClick(Sender: TObject);
begin
  if not popSpsVidActive.Checked then begin
    popSpsVidActive.Checked := true;
    popSpsVidAll.Checked := false;
    OpenQrySps(gl_nAppKdSpsUsr);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuOldZpK_UPIClick(Sender: TObject);
begin
  // Сие можно и удалить - использовалось для перегона данных из DOS-зарплаты
  AddUpi104;  {z_104Upi}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuOldZpK_NUClick(Sender: TObject);
begin
  // Сие можно и удалить - использовалось для перегона данных из DOS-зарплаты
  AddNu104;  {z_104nu}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuOldZpK_OtklClick(Sender: TObject);
begin
  // Сие можно и удалить - использовалось для перегона данных из DOS-зарплаты
  // AddOtkl104;  {z_104otk}
end;
(*   Запрос для извлечения "боевых" надбавок 104-й
Select u.Fam, u.NewTabN, v.z_VidN, s.z_KdSch, o.NewKdObj, n.TabN,
 n.* from nadb_104 n
 Left outer join upiNw104 u on u.TabN = n.TabN
 Left outer join VidN_104 v on v.OldVidN = n.OldVidN
 Left outer join SBU_104 s on s.SZatr = n.SZatr
 Left outer join Obj104 o on o.Obj = n.Obj
where ((n.Dt_End >= '05/01/2007') or (n.Dt_End is Null)) and n.SumProc > 0
order by n.TabN, n.Dt_Beg
*)
//------------------------------------------------------------------------------
procedure TFormZpMain.mmSpsDelaByVidsClick(Sender: TObject);
var n_KdSps : SmallInt; d_DtPrc : TDateTime;
begin
  n_KdSps := gl_nAppKdSpsUsr;
  d_DtPrc := dDtProc;
  ShowSpsTotals(n_KdSps, d_DtPrc); {z_SpsTts}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmSpsDelaByOtklClick(Sender: TObject);
var n_KdSps : SmallInt; d_DtPrc : TDateTime;
begin
  n_KdSps := gl_nAppKdSpsUsr;
  d_DtPrc := dDtProc;
  ShowSpsOtkl(n_KdSps, d_DtPrc); {z_SpsOtk}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmSpsDelaByNadbClick(Sender: TObject);
var n_KdSps : SmallInt; d_DtPrc : TDateTime;
begin
  n_KdSps := gl_nAppKdSpsUsr;
  d_DtPrc := dDtProc;
  ShowSpsNadb(n_KdSps, d_DtPrc); {z_SpsNdb}
end;
(*
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtkl_StornOtpClick(Sender: TObject);
var bIsStorn : boolean; nSvNR : integer;
begin
  bIsStorn := dbgrOtkl.DataSource.DataSet.FieldByName('Storn').AsBoolean;
  nSvNR := dbgrOtkl.DataSource.DataSet.FieldByName('NR').AsInteger;
  if bIsStorn then begin
    if MessageDlg('Снять метку о сторнировании текущей записи отпускных?:',
                 mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Update z_Otkl set STORN = null where NR = :nSvNR');
        ParamByName('nSvNR').AsInteger := nSvNR;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dbgrOtkl.DataSource.DataSet do begin
        Close;
        Open;
        Locate('NR', nSvNR, []);
      end;
    end; end
  else begin
    if MessageDlg('Сторнировать текущую запись об отпуске?:',
                 mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Update z_Otkl set STORN = "Y" where NR = :nSvNR');
        ParamByName('nSvNR').AsInteger := nSvNR;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      with dbgrOtkl.DataSource.DataSet do begin
        Close;
        Open;
        Locate('NR', nSvNR, []);
      end;
    end;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuOldZpK_NadbClick(Sender: TObject);
begin
  // Сие можно и удалить - использовалось для перегона данных из DOS-зарплаты
  AddNadb106;  {z_104Ndb}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmAddOtklClick(Sender: TObject);
begin
{ 10.09.2024 SB: Пункт меню - невидим. Не используется.
  AddOtkl;  // z_DpOtkl
}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuAdd8801Click(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  // >> z_8801
  TFrmAddRecalc.Run(dDtPrc);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mmMyCheckNUClick(Sender: TObject);
var nTabN : integer; dDtPrc, dDtCtrl : TDateTime; cFamIO : ShortString;
begin
  if qrySps.RecordCount <= 0 then Exit;
  // Показать для проверки начисления/удержания за заданный месяц
  // для проверки всяких удержаний
  nTabN := qrySpsTabN.AsInteger;
  cFamIO := qrySpsFamIO.AsString;
  dDtPrc := dDtProc;
  dDtCtrl := dCtrlDate;
  CheckNuZaMG(nTabN, cFamIO, dDtPrc, dDtCtrl);   {z_ChkMG}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpCloseMonthClick(Sender: TObject);
var nSmDlgPrp, nSmDlgTM : double;
    nCntDlgPrp, nCntDlgTM,
    nCntAll, nCntBezSch, nCntWithSch, nCntZapr : SmallInt;
    nCaseDo : SmallInt; nSpsSvNR : integer;
    dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select NCH, count( * ) as CNT from z_SPS ' +
            ' where dtProc = :dDtPrc group by NCH');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    nCntDlgPrp := -1;
    nCntDlgTM := 0;
    nSmDlgPrp := 0;
    nSmDlgTM := 0;
    nCntBezSch := 0;
    nCntWithSch := 0;
    nCntZapr := 0;
    while not Eof do begin
      if FieldByName('NCH').IsNull or
             (FieldByName('NCH').AsString = '') then
        nCntBezSch := nCntBezSch + FieldByName('Cnt').AsInteger
      else if (FieldByName('NCH').AsString = 'X') then
        nCntWithSch := nCntWithSch + FieldByName('Cnt').AsInteger
      else if (FieldByName('NCH').AsString = 'Z') then
        nCntZapr := nCntZapr + FieldByName('Cnt').AsInteger;
      Next;
    end;
    nCntAll := nCntBezSch + nCntWithSch + nCntZapr;
    Close;
    SQL.Clear;
    SQL.Add('Select Sum(Summa) as SMM from Z_NU ' +
            ' where dtProc = :dDtPrc and VidN < "8600"');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    if RecordCount > 0 then
      nSmDlgPrp := RoundTo(FieldByName('SMM').AsFloat, -2);
    Close;
    SQL.Clear;
    SQL.Add('Select TabN, Summa from z_NU ' +
             ' where dtProc = :dDtPrc and VidN = "2724"');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      nCntDlgTM := nCntDlgTM + 1;
      nSmDlgTM := nSmDlgTM + FieldByName('Summa').AsFloat;
      Next;
    end;
    if SetDelZapret(nCntAll, nCntBezSch, nCntWithSch, nCntZapr,   {z_CmDlg}
                    nCntDlgPrp, nCntDlgTM, nSmDlgPrp, nSmDlgTM,
                                                  dDtPrc, nCaseDo) then begin
      Application.ProcessMessages;
      nSpsSvNR := qrySpsNR.AsInteger;
      if nCaseDo = 2 then begin
        Close;
        SQL.Clear;
        SQL.Add('Update z_SPS set SVNCH = NCH, NCH = "Z" ' +
                ' where DtProc = :dDtPrc');
        ParamByName('dDtPrc').AsDateTime := dDtPrc;
        ExecSQL; end
      else begin
        Close;
        SQL.Clear;
        SQL.Add('Update z_SPS set NCH = SvNCH where DtProc = :dDtPrc');
        ParamByName('dDtPrc').AsDateTime := dDtPrc;
        ExecSQL;
      end;
      qrySps.Close;
      qrySps.Open;
      if nSpsSvNR <> 0 then
        qrySps.Locate('NR', nSpsSvNR, []);
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

//------------------------------------------------------------------------------
function TFormZpMain.MonthClosed(nTabn : integer) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if nTabN > 0 then begin
      SQL.Add('Select first 1 * from Z_SPS ' +
              ' where DtProc = :dDtPrc and TabN = :nTabN');
      ParamByName('dDtPrc').AsDateTime := dDtProc;
      ParamByName('nTabN').AsInteger := nTabN;
      Open; end
    else begin
      SQL.Add('Select first 1 * from Z_SPS where DtProc = :dDtPrc and ' +
              'NCH = "Z"');
      ParamByName('dDtPrc').AsDateTime := dDtProc;
      Open;
    end;
    if (RecordCount > 0) and (FieldByName('NCH').AsString = 'Z') then
      Result := true;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popTvObjF9Click(Sender: TObject);
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    popMnuRaschetCurrentClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popMnuRaschetCurrentClick(Sender: TObject);
var bMonthClosed : boolean;
begin
  if qrySps.Active and (qrySps.RecordCount > 0) then
    bMonthClosed := MonthClosed(qrySpsTabN.AsInteger)
  else
    bMonthClosed := MonthClosed(0);
    
  if not bMonthClosed then
    popOtklNewRaschetClick(Self)
  else
    ShowMessage('Расчет текущего месяца закрыт');
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsBlockSchetCurrentClick(Sender: TObject);
var cMsg : ShortString; dDtPrc :TDateTime;
    bUpdated : boolean; nSvSpsNR : integer;
begin
  dDtPrc := dDtProc;
  bUpdated := false;
  if qrySpsNCH.AsString = 'Z' then begin
    cMsg := 'Разблокировать расчет для сотрудника ' +
                                       qrySpsFamIO.AsString + '?:';
    if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then
                                               with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Update Z_SPS set NCH = SVNCH ' +
              ' where DtProc = :dDtPrc and TabN = :nTabN');
      ParamByName('dDtPrc').AsDateTime := dDtPrc;
      ParamByName('nTabN').AsInteger := qrySpsTabN.AsInteger;
      ExecSQL;
      Close;
      SQL.Clear;
      DataBaseName := '';
      bUpdated := true;
    end; end
  else begin
    cMsg := 'Заблокировать расчет для сотрудника ' +
                                       qrySpsFamIO.AsString + '?:';
    if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                                               with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Update Z_SPS set SVNCH = NCH, NCH = "Z" ' +
              ' where DtProc = :dDtPrc and TabN = :nTabN');
      ParamByName('dDtPrc').AsDateTime := dDtPrc;
      ParamByName('nTabN').AsInteger := qrySpsTabN.AsInteger;
      ExecSQL;
      Close;
      SQL.Clear;
      DataBaseName := '';
      bUpdated := true;
    end;
  end;
  if bUpdated then with qrySps do begin
    nSvSpsNR := qrySpsNR.AsInteger;
    DisableControls;
    Close;
    Open;
    Locate('NR', nSvSpsNR, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.QrySpsBeforeScroll(DataSet: TDataSet);
begin
  if bIsFormChkNuZaMG then
    FormChkNuZaMG.Close;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmMyNewUkrClick(Sender: TObject);
begin
  ChangeUpiFIO;  {z_NewUkr}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmDoubleSpsTabNClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  CheckDoubleTabN(dDtPrc);  {z_DblTab}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuArhivkiExcelObjClick(Sender: TObject);
var nCase, nKdObj : SmallInt;
begin
  nCase  := 1;  // в MS Excel
  nKdObj := qryObjKdObj.AsInteger;
  MakeArhivki(nCase, nKdObj);  {z_MkArhG}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuArhivkiExcelAllClick(Sender: TObject);
var nCase, nKdObj : SmallInt;
begin
  nCase  := 1;  // в MS Excel
  nKdObj := 0;
  MakeArhivki(nCase, nKdObj);  {z_MkArhG}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuArhivkiTxtObjClick(Sender: TObject);
var nCase, nKdObj : SmallInt;
begin
  nCase  := 0;  // в txt-файл
  nKdObj := qryObjKdObj.AsInteger;
  MakeArhivki(nCase, nKdObj);  {z_MkArhG}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuArhivkiTxtAllClick(Sender: TObject);
var nCase, nKdObj : SmallInt;
begin
  nCase  := 0;  // в txt-файл
  nKdObj := 0;
  MakeArhivki(nCase, nKdObj);  {z_MkArhG}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmSpsTabsClick(Sender: TObject);
var nKdUsr : SmallInt; dDtPrc : TDateTime;
begin
  ShowMessage('Перенесено в pop_Menu дерева подразделений');
  Exit;
  nKdUsr := nAppKdUsr;
  dDtPrc := dDtProc;
  // >> a_ZUObj
  TFormZUsrObj.Run(nKdUsr, dDtPrc, QryObj.FieldByName('KdObj').AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popTvYourPeoplesClick(Sender: TObject);
var nKdUsr : SmallInt; dDtPrc : TDateTime;
begin
  nKdUsr := nAppKdUsr;
  dDtPrc := dDtProc;
  // >> a_ZUObj
  TFormZUsrObj.Run(nKdUsr, dDtPrc, QryObj.FieldByName('KdObj').AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSpr_1Click(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShwSvdNich_1(dDtPrc);  {z_SvdN_1}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmEABnkLSClick(Sender: TObject);
begin
  EABnkLS;   {z_EBnkLS}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmChSpsClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ChkSps(dDtPrc);   {z_ChSps}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtNichVedClick(Sender: TObject);
var n_TmpKdSps : SmallInt; dDtPrc : TDateTime;
begin
  n_TmpKdSps := 6;
  dDtPrc := dDtProc;
  MkNichVed(n_TmpKdSps, dDtPrc); {z_NichVd}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmPereraschetPdnClick(Sender: TObject);
begin
  ShwPdnPere; {z_psPdN}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuRestSpsTabNClick(Sender: TObject);
begin
  mMnuRestSpsTabN.Checked := not mMnuRestSpsTabN.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuIndxNachClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShwVdIndE(dDtPrc);     {z_VdIndE} // Индексация "фиксированная" с 10-2012
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuIndxNachOldClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShwVdIndD(dDtPrc);  {z_VdIndD}  // Индексация "текущая"
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnMyDbgClick(Sender: TObject);
begin
  ShwMyDbg; {z_MyDbg}
(*
  if not bIsFormRemPere then
    shwRemP         {z_remp}
  else begin
    if FormRemPere.WindowState = wsMinimized then
      FormRemPere.WindowState := wsNormal;
    FormRemPere.SetFocus;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmChOtklNUClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  CheckNu(dDtPrc);     {z_ChNU}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.rBtnIsOsnClick(Sender: TObject);
begin
  if DmMain.qryPere.Active then begin
    if DmMain.qryPere.FieldByName('KdSps').AsInteger = gl_nAppKdSpsUsr then
      rBtnIsOsn.Checked := true
    else
      rBtnIsOsn.Checked := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.NuByYearsClick(Sender: TObject);
var nGod : SmallInt;
begin
  if VuborGoda(nGod) {z_VbYear} then begin
    //if bFlagDbg then
    //  ShowMessage('Выбран год ' + IntToStr(nGod));
    Application.ProcessMessages;
    ShwNuByYears(nGod);  {z_NuByYr}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmChngBnkClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShwChngBnk(dDtPrc);  {z_MsLS}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmTemplatesClick(Sender: TObject);
begin
  ShwMyTemplates;    {z_Tmplts}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtSvdByKatPClick(Sender: TObject);
var nGod, nMes : word; dDtPrc : TDateTime;
begin
  nGod := nProcY;
  nMes := nProcM;
  if VvodGodMes(nGod, nMes) {a_GtGdMs} then begin
    dDtPrc := EncodeDate(nGod, nMes, 1);
    ShwSvdNuByKatP(dDtPrc); {z_SvdKtP}
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtCmbOklCurMesClick(Sender: TObject);
var dDtPrc : TDateTime;
begin // Вывести список сотрудников с "составными" окладами в текущем месяце
  dDtPrc := dDtProc;
  ShowSpsCmbOkl(dDtPrc);  {z_SpsCmb}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuSpovNewClick(Sender: TObject);
begin
  TFrmSpov.Run;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpKdLgtClick(Sender: TObject);
begin
  ShwKdLgt;  {z_GtKdLg}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtInvCurMesClick(Sender: TObject);
begin
  ShwInv(dDtProc); {z_SpsInv}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmCheckInvStateClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  CheckInvState(dDtPrc);   {z_InvSt}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNuSumBrushClick(Sender: TObject);
begin
  popNuSumBrush.Checked := not popNuSumBrush.Checked;
  dbgrNu.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNu2SumBrushClick(Sender: TObject);
begin
  popNu2SumBrush.Checked := not popNu2SumBrush.Checked;
  dbgrNu2.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtLgtCurMesClick(Sender: TObject);
var dDtPrc, dDtEndMes : TDateTime;
begin
  dDtPrc := dDtProc;
  dDtEndMes := MyLastDOM(dDtPrc);
  ShwLgt(dDtPrc, dDtEndMes); {z_SpsLgt}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtFssTvpClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ZajavkaFss(dDtPrc, PRTMODE_SHOW_MODAL, 0, Date); {z_FssTvp}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrBlnClick(Sender: TObject);
begin
  ShwPrBln(0);        {z_PrBln}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmMyOznPilg042011Click(Sender: TObject);
begin
  EdtOP_042011; {z_EdtOP}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuAddKomandClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  AddKmd(dDtPrc);   {z_AddKmd}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popOtklStornNeoplClick(Sender: TObject);
// var
//   nTabN : integer;
//   dDtPrc : TDateTime;
begin
  // СТАРОЕ СТОРНИРОВАНИЕ
//  dDtPrc := dDtProc;
//  nTabN := qrySpsTabN.AsInteger;
//  if Storn500X(nTabN, dDtPrc) then begin
//    popSpsRaschetCurrent.Click;
//  end;

  // НОВОЕ СТОРНИРОВАНИЕ
  if TVieStorn500X.Run(qrySpsTabN.AsInteger) then
    popSpsRaschetCurrent.Click;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPidZvilnClick(Sender: TObject);
begin
  ShwPidZviln;  {z_PidZv}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuVedIspL2Click(Sender: TObject);
var cPrompt : ShortString; dDtBeg, dDtEnd : TDateTime; nY, nM, nD : word;
begin
  cPrompt :=
    'Введите необходимые даты начала и конца для формирования ' +
    'документа (обе даты включительно)';
    
  if VvodDates(cPrompt, dDtBeg, dDtEnd) {z_VvDats} then begin
    DecodeDate(dDtBeg, nY, nM, nD);
    dDtBeg := EncodeDate(nY, nM, 1);
    dDtEnd := MyLastDOM(dDtEnd);
    ShwVedIspL2(dDtBeg, dDtEnd);        {z_VIspl2}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpActNdbClick(Sender: TObject);
var nMes, nGod : Smallint; mLstVids : TStringList;
begin
  nMes := nProcM;
  nGod := nProcY;
  mLstVids := TStringList.Create;
  if FileExists(cDirVids + 'GetMGV.lst') then
    mLstVids.LoadFromFile(cDirVids + 'GetMGV.lst');
  if GetMesGodVids(nMes, nGod, mLstVids) {z_GetMG} then begin
    Application.ProcessMessages;
    mLstVids.SaveToFile(cDirVids + 'GetMGV.lst');
    ShwActualNdb(nMes, nGod, mLstVids);  {z_ShANdb}
  end;
  mLstVids.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpTbPrcIndxClick(Sender: TObject);
begin
  ShwTblPrcIndx;  {z_PrcInd}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popSpsBLSClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString; bWasUpdated : boolean;
    dOnDate : TDateTime;
begin
  if (qrySps.RecordCount > 0) then begin
    nTabN := qrySpsTabN.AsInteger;
    cFamIO := qrySpsFamIO.AsString;
    dOnDate := Date;
    ShowBnkLS(nTabN, dOnDate, cFamIO, bWasUpdated);  {z_BnkLS}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpFixIndxClick(Sender: TObject);
begin
  ShwFxIndx;     {z_FIndx}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmMyFillFixIndxClick(Sender: TObject);
begin
  FillFixIndx;     {z_FFIndx}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpAddBLSClick(Sender: TObject);
begin
  AddBnkLS;   {z_AddBLS}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrPereKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
var cFieldNm : ShortString;  i : SmallInt;
begin
  if ((Key = Ord('M')) or (Key = Ord('m'))) and (Shift = [ssCtrl]) then begin
    cFieldNm := dbgrPere.SelectedField.FieldName;
    //ShowMessage('Поле ' + cFieldNm);
    for i := 0 to dbgrPere.Columns.Count - 1 do begin
      if dbgrPere.Columns.Items[i].FieldName = cFieldNm then
        dbgrPere.Columns.Items[i].Width := 2;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuStatPlOtdClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString;
begin
  nTabN   := qrySpsTabN.AsInteger;
  cFamIO  := qrySpsFamIO.AsString;
  GetPlStat02(nTabN, cFamIO);  {z_PlSt02}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpDopClick(Sender: TObject);
begin
  if not bFlagDbg and (nAppKdUsr <> 114) then
    mMnuStatPlOtd.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtOtp3_6Click(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  SpsOtp_3_6(dDtPrc);   {z_Otp36}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrikazuOKClick(Sender: TObject);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  ShwPrikazuOK(dDtPrc);   {z_ShPrOk}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtMoGKClick(Sender: TObject);
var dDtPrc : TDateTime;
    cPSCH, cNmPSch, cNrGO : ShortString;
begin
  if bIsFormShwLog or bIsFormShwLogByTabN then
    FormShwLog.Close;
  if bIsFormMyCalendar then
    FormMyCalendar.Close;
  if bIsFormDfMain then
    FormDfMain.Close;
  if bIsFormCheckPrp then
    FormCheckPrp.Close;
  if bIsFormChkNuZaMG then
    FormChkNuZaMG.Close;
  if bIsFormCheckNu then
    FormCheckNu.Close;
  if bIsFormChkSps then
    FormChkSps.Close;
  if bIsFormPsPdn then
    FormPsPdn.Close;
  if bIsFormShwPrOK then
    FormShwPrOK.Close;
  dDtPrc := dDtProc;
  if GetZplMO(dDtPrc, cPSCH, cNmPSch, cNrGO) {z_GtMO} then begin
    Application.ProcessMessages;
    AddZplGO(dDtPrc, cPSCH, cNmPSch, cNrGO); {z_Mo2GK}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZp1005Click(Sender: TObject);
begin
  ShwPredSps;    {z_PrSps}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuMassaClick(Sender: TObject);
begin
  mMnuZp1005.Enabled := bFlagDbg or
                                  ((nAppKdUsr = 114) and (dDtProc = dCtrlDate));
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmMyCreFixIndx2Click(Sender: TObject);
begin
  ShwFixIndx2;      {z_FFInd2}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuOtkl_NuToExcelClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString; dDtPrc : TDateTime;
begin
  nTabN  := qrySpsTabN.AsInteger;
  cFamIO := qrySpsFamIO.AsString;
  dDtPrc := dDtProc;
  F6PrtOtklNu(nTabN, cFamIO, dDtPrc, DmMain.qryOtkl, DmMain.QryNuCmn);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnF8Click(Sender: TObject);
var i : SmallInt; cNR : ShortString;
begin
  PanelSelectedTotals.Visible := false;

  with dbgrNu.DataSource.DataSet do begin
    cNR := FieldByName('NR').AsString;
    i := LbxF8.Items.IndexOf(cNR);
    if i < 0 then
      LbxF8.Items.Add(cNR)
    else
      LbxF8.Items.Delete(i);
    if not Eof then
      Next
    else
      dbgrNu.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrNUDblClick(Sender: TObject);
begin
  sBtnF8.Click;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNuClearMetkiClick(Sender: TObject);
begin
  LbxF8.Clear;
  dbgrNu.Refresh;
  PanelSelectedTotals.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.dbgrNUKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnF8.Click
  else if (Key = VK_F7) and (Shift = []) then
    ShwSelRecNuTotals
  else if (Key = VK_ESCAPE) and (Shift = []) then
    popNuClearMetkiClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.ShwSelRecNuTotals;
var
  nSmPlus, nSmMinus, nSmTt : double;
  cMsg, cNR : ShortString; nSvNR : integer;
begin
  nSmPlus  := 0;
  nSmMinus := 0;
  nSmTt    := 0;

  if LbxF8.Items.Count > 1 then
    with dbgrNu.DataSource.DataSet do begin
      DisableControls;

      nSvNR := FieldByName('NR').AsInteger;
      First;

      while not Eof do begin
        cNR := FieldByName('NR').AsString;
        if LbxF8.Items.IndexOf(cNR) >= 0 then begin
          if FieldByName('Summa').AsFloat > 0 then begin
          nSmPlus := nSmPlus + FieldByName('Summa').AsFloat;
          nSmTt   := nSmTt   + FieldByName('Summa').AsFloat; end
        else begin
          nSmMinus := nSmMinus + FieldByName('Summa').AsFloat;
          nSmTt    := nSmTt    + FieldByName('Summa').AsFloat;
        end;
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  cMsg := 'Начисления = ' + FloatToStrF(nSmPlus, ffNumber, 18, 2) +
          ' Удержания = ' +  FloatToStrF(-nSmMinus, ffNumber, 18, 2) +
          ' Итого = ' +  FloatToStrF(nSmTt, ffNumber, 18, 2);
  PanelSelectedTotals.Caption := cMsg;
  PanelSelectedTotals.Visible := true;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.sBtnPanelNuTotalsClick(Sender: TObject);
begin
  PanelSelectedTotals.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.popNuSumByMetkiClick(Sender: TObject);
begin
  ShwSelRecNuTotals;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmTreeVievClick(Sender: TObject);
begin
  WrkWithTreeWiev;      {z_PlnSbu}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.N2Click(Sender: TObject);
begin
  ShwTemuNICH;  {z_ShwTem}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmNewShTemClick(Sender: TObject);
begin
  SreNewShTem;   {z_NewShT}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtNichTm_1Click(Sender: TObject);
var nCase : Word;
begin
  nCase := 1;
  // только "чистые" темы
  // >> z_NicRp1
  ShwNichRp1(nCase, dDtProc);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZpPrtNichTm_2Click(Sender: TObject);
var nCase : Word;
begin
  // "чистые" темы и "темные" счета
  // >> z_NicRp1
  nCase := 2;
  ShwNichRp1(nCase, dDtProc);
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuDk2010Click(Sender: TObject);
begin
  TFormDK2010.ShowDK2010;                   {z_dk2010}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.o_DolgnClick(Sender: TObject);
begin
  CopyDK2010;                   {z_Co2010}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuIspSlgClick(Sender: TObject);
begin
  ShowIspSlg;                   {z_ispslg}
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mmRemPereClick(Sender: TObject);
begin
// shwRemP;         {z_remp}
(*
  if not bIsFormRemPere then
    shwRemP         {z_remp}
  else begin
    if FormRemPere.WindowState = wsMinimized then
      FormRemPere.WindowState := wsNormal;
    FormRemPere.SetFocus;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuZp1006Click(Sender: TObject);
begin
  // >> z_PredPkt
  ShwPredPkt;
end;
//------------------------------------------------------------------------------
procedure TFormZpMain.LabelBegDMZDblClick(Sender: TObject);
//var dNewDtBegAuto : TDateTime;
begin
  if bFlagDbg then begin
    if GetNewDtBegAuto(gd_DtBegAutoDMZ) {z_AutoMZ} then
      LabelBegDMZ.Caption := 'АвтоДоМЗ с: ' + DateToStr(gd_DtBegAutoDMZ);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.NAboutClick(Sender: TObject);
begin
  TFormAbout.Run;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.nSpsRepairClick(Sender: TObject);
begin
  TFrmCreMnthList.RepairSpsMes(nProcY, nProcM)
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.mMnuOthersClick(Sender: TObject);
begin
  TFrmUsrSetts.Show;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.NMnuEmpInfoClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;

  RefreshEmplInfoLabel(
    GetEmplInfo(QrySpsTabN.AsInteger), false);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.LoadEmplInfoSetts;
begin
  with TIniFile.Create(cNmIniFile) do begin
    NEmplId.Checked := ReadBool(SECTION, 'ShowEmplId', true);
    NEmplName.Checked := ReadBool(SECTION, 'ShowEmplName', true);
    NSalary.Checked := ReadBool(SECTION, 'ShowSalary', true);
    NBank.Checked := ReadBool(SECTION, 'ShowBank', false);
    NBankAcc.Checked := ReadBool(SECTION, 'ShowBankAcc', false);
    NEmplSocial.Checked := ReadBool(SECTION, 'ShowEmplSocial', false);
    NIndxExclState.Checked := ReadBool(SECTION, 'ShowIndxExclState', false);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.SaveEmplInfoSetts;
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteBool(SECTION, 'ShowEmplId', NEmplId.Checked);
    WriteBool(SECTION, 'ShowEmplName', NEmplName.Checked);
    WriteBool(SECTION, 'ShowSalary', NSalary.Checked);
    WriteBool(SECTION, 'ShowBank', NBank.Checked);
    WriteBool(SECTION, 'ShowBankAcc', NBankAcc.Checked);
    WriteBool(SECTION, 'ShowEmplSocial', NEmplSocial.Checked);
    WriteBool(SECTION, 'ShowIndxExclState', NIndxExclState.Checked);
    Free
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.MnuDismisThisMnthClick(Sender: TObject);
begin
  TFrmDismisThisMnth.Run;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.ActSetCalcMnthExecute(Sender: TObject);
var
  Date: TDate;
  Msg: ShortString;
begin
  Date := DateUtils.Decode(dCtrlDate);

  with Date do
  Msg := 'Расчётный месяц - ' + MesRus(Mnth) + ' ' + IntToStr(Year) + '.';

  if dCtrlDate = dDtProc then
    ShowMessage(Msg)
  else begin
    Date := DateUtils.Decode(dDtProc);

    with Date do
    Msg := Msg + #13#10#13#10'Установить расчётным месяцем ' +
      MesRus(Mnth) + ' ' + IntToStr(Year) + '?';

    if MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dCtrlDate := dDtProc;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.ActSetCalcMnthUpdate(Sender: TObject);
begin
{$ifdef WAR_ZPL}
  (Sender as TAction).Visible := true;
{$else}
  (Sender as TAction).Visible := false;
{$endif}
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.NUpdIndxExclClick(Sender: TObject);
begin
  with QrySps do
    TFrmEmplIndx.Run(FieldByName('TabN').AsInteger,
      FieldByName('FamIO').AsString);
  RefreshIndxExclState;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormZpMain.NIndxExclStateClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked; 
  RefreshIndxExclState;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormZpMain.RefreshIndxExclState;
begin
  if NIndxExclState.Checked then
    with TDmIndxExcl.PrepEmplIsExcl(dDtProc) do begin
      LblIndxExclState.Visible :=
        EmplIsIndxExcl(QrySps.FieldByName('TabN').AsInteger);
      Free;
    end
  else
    LblIndxExclState.Visible := false;
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.NPrintIndxExclClick(Sender: TObject);
var
  Span: TPeriod;
begin
  Span.Start := dDtProc;
  Span.Finish := DateUtils.EndOfMonth(Span.Start);

  if TFrmGetSpan.Run('Сформировать за период', Span) then
    TRptIndxExcl.Run(Span.Start, Span.Finish);
end;

//------------------------------------------------------------------------------
procedure TFormZpMain.NRptGrpVidNDeptIdClick(Sender: TObject);
begin
  TFrmCatVidNDeptId.Run(2025);
end;

end.

