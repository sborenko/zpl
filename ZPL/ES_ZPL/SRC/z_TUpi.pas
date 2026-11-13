unit z_TUpi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, DB, Grids, DBGrids, ComCtrls, ExtCtrls, DBTables,
  IniFiles, StdCtrls, Buttons, Menus, Provider, DBClient, DBCtrls,
  Math;

type
  TFormTUpi = class(TForm)
    PanelTop: TPanel;
    PageControl1: TPageControl;
    tsUpi1: TTabSheet;
    tsUpi2: TTabSheet;
    dbgrUpi1: TDBGrid;
    PageControl2: TPageControl;
    tsPere: TTabSheet;
    tsNadb: TTabSheet;
    tsUdrg: TTabSheet;
    sBtnUpi1: TSpeedButton;
    sBtnUpi2: TSpeedButton;
    bBtnCancel: TBitBtn;
    dbgrPere: TDBGrid;
    dbgrNadb: TDBGrid;
    dbgrUdrg: TDBGrid;
    PanelLeft: TPanel;
    dbgrUpi2: TDBGrid;
    Splitter1: TSplitter;
    popMnu: TPopupMenu;
    popMnuHead: TMenuItem;
    popMnuEdt: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuDel: TMenuItem;
    popUpi: TPopupMenu;
    popUpiHead: TMenuItem;
    popUpiEdt: TMenuItem;
    popUpiAdd: TMenuItem;
    popUpiDel: TMenuItem;
    qryTmp: TQuery;
    bBtnOk: TBitBtn;
    popUpiSep1: TMenuItem;
    popUpiSort: TMenuItem;
    popUpiSortFamIO: TMenuItem;
    popUpiSortTabN: TMenuItem;
    LabelSort: TLabel;
    tsTotsNU: TTabSheet;
    qryTotsNU: TQuery;
    dsrcTotsNU: TDataSource;
    dbgrTotsNU: TDBGrid;
    qryTotsNUTABN: TIntegerField;
    qryTotsNUSMNACH: TFloatField;
    qryTotsNUSMUDRG: TFloatField;
    qryTotsNUMesRus: TStringField;
    qryTotsNUSmNaRuki: TFloatField;
    popMnuSep1: TMenuItem;
    popMnuPrtTots: TMenuItem;
    LabelTotsMsg: TLabel;
    tsPrmUv: TTabSheet;
    dbgrPrmUv: TDBGrid;
    sBtnAddInSpsCurMes: TSpeedButton;
    qryTotsNUSMVUPL: TFloatField;
    LabelCntRec: TLabel;
    chBoxOnlyActive: TCheckBox;
    qryTotsNUKDSPS: TSmallintField;
    popMnuTotsCase: TMenuItem;
    popMnuTotsByZaMesGod: TMenuItem;
    popMnuTotsByDtProc: TMenuItem;
    qryTotsNUMYMG: TDateTimeField;
    popUpiNewPoisk: TMenuItem;
    popMnuNewPoisk: TMenuItem;
    popUpiSep2: TMenuItem;
    popUpiCheckUvoln: TMenuItem;
    popMnuShwDetails: TMenuItem;
    Splitter2: TSplitter;
    dbgrNuDet: TDBGrid;
    qryNuDet: TQuery;
    dsrcNuDet: TDataSource;
    qryNuDetVIDN: TStringField;
    qryNuDetSHVIDN: TStringField;
    qryNuDetPSCH: TStringField;
    qryNuDetSCHBU: TStringField;
    qryNuDetOLDKDVIDN: TSmallintField;
    qryNuDetVID_KDSPZ: TSmallintField;
    qryNuDetKEKV: TStringField;
    qryNuDetNR: TIntegerField;
    qryNuDetDTPROC: TDateTimeField;
    qryNuDetZAMESGOD: TDateTimeField;
    qryNuDetTABN: TIntegerField;
    qryNuDetCHAS: TFloatField;
    qryNuDetSUMMA: TFloatField;
    qryNuDetDT_BEG: TDateTimeField;
    qryNuDetDT_END: TDateTimeField;
    qryNuDetKDSPS: TSmallintField;
    qryNuDetKDOBJ: TSmallintField;
    qryNuDetKDKATP: TSmallintField;
    qryNuDetKDSPZ: TSmallintField;
    qryNuDetPDN: TSmallintField;
    qryNuDetNOTES: TStringField;
    qryNuDetPRR: TSmallintField;
    qryNuDetPRPV: TSmallintField;
    qryNuDetKTO: TSmallintField;
    qryNuDetPRKR: TSmallintField;
    qryNuDetMYNOTES: TStringField;
    qryNuDetSPECPS: TIntegerField;
    qryNuDetSPEC_NR: TIntegerField;
    qryNuDetOLDKDOBJ: TSmallintField;
    qryNuDetZP13: TStringField;
    qryNuDetOTP: TStringField;
    qryNuDetBLN: TStringField;
    qryNuDetOTPUSKN: TStringField;
    qryNuDetBOLNIC: TStringField;
    qryNuDetSPRM: TStringField;
    qryNuDetCPRM: TStringField;
    qryNuDetDETI: TStringField;
    qryNuDetDETIM: TStringField;
    qryNuDetDETIK: TStringField;
    qryNuDetDETIG: TStringField;
    qryNuDetIND: TStringField;
    qryNuDetDHD: TStringField;
    qryNuDetOKLFND: TStringField;
    qryNuDetCBUDG: TStringField;
    qryNuDetSNDB: TStringField;
    qryNuDetSPDN: TStringField;
    qryNuDetSPRF: TStringField;
    qryNuDetSPENS: TStringField;
    qryNuDetSALIM: TStringField;
    qryNuDetCNDB: TStringField;
    qryNuDetSSOCSTRAH: TStringField;
    qryNuDetSBZR: TStringField;
    qryNuDetSP_PF: TStringField;
    qryNuDetSP_FSTVP: TStringField;
    qryNuDetSP_FSNV: TStringField;
    qryNuDetSP_FZ: TStringField;
    qryNuDetSOVM: TStringField;
    qryNuDetSPOV: TStringField;
    qryNuDetNMVIDN: TStringField;
    qryNuDetNMSCH: TStringField;
    popMnuSortNuDet: TMenuItem;
    popMnuSortNuDetByVidN: TMenuItem;
    popMnuSortNuDetByZaMG: TMenuItem;
    PanelID: TPanel;
    qryPrmUv: TQuery;
    qryPrmUvNR: TIntegerField;
    qryPrmUvKDSPS: TSmallintField;
    qryPrmUvTABN: TIntegerField;
    qryPrmUvDT_PRIEM: TDateTimeField;
    qryPrmUvDT_UVOLN: TDateTimeField;
    qryPrmUvNR_PRIKAZA: TStringField;
    qryPrmUvDT_PRIKAZA: TDateTimeField;
    qryPrmUvNR_PRUVOLN: TStringField;
    qryPrmUvDT_PRUVOLN: TDateTimeField;
    qryPrmUvNOTES: TStringField;
    dsrcPrmUv: TDataSource;
    qryPere: TQuery;
    qryPereNR: TIntegerField;
    qryPereKDSPS: TSmallintField;
    qryPereTABN: TIntegerField;
    qryPereDT_BEG: TDateTimeField;
    qryPereDT_END: TDateTimeField;
    qryPereKDKATP: TSmallintField;
    qryPereSO: TSmallintField;
    qryPereOKLTRF: TFloatField;
    qryPereSmCmbOkl: TFloatField;
    qryPereAVANS: TFloatField;
    qryPereSP_AV: TStringField;
    qryPereKDDOLGN: TSmallintField;
    qryPereDOLGNOST: TStringField;
    qryPerePR_PENS: TSmallintField;
    qryPereSOVM: TSmallintField;
    qryPereShSovm: TStringField;
    qryPerePDNLG: TSmallintField;
    qryPerePROCLG: TFloatField;
    qryPereKOLMIN: TSmallintField;
    qryPereShSO: TStringField;
    qryPereShPdNlg: TStringField;
    qryPereKDOBJ: TSmallintField;
    qryPereShObj: TStringField;
    qryPereShKatP: TStringField;
    qryPereNOTES: TStringField;
    qryPerePRCWRKTIME: TFloatField;
    qryPereKDSPZ: TSmallintField;
    qryPereSpz: TStringField;
    qryPerePRFS: TSmallintField;
    qryPereOLDKDOBJ: TSmallintField;
    qryPereNR_PRIKAZA: TStringField;
    qryPereRAZR: TSmallintField;
    qryPereDT_PRIKAZA: TDateTimeField;
    qryPereRANG: TSmallintField;
    qryPereINV: TSmallintField;
    qryPerePRDEKR: TStringField;
    qryPereCMBOKL: TStringField;
    qryPereSPEC_NR: TIntegerField;
    dsrcPere: TDataSource;
    updPere: TUpdateSQL;
    qryNadb: TQuery;
    qryNadbNR: TIntegerField;
    qryNadbKDSPS: TSmallintField;
    qryNadbSPSRSCH: TIntegerField;
    qryNadbTABN: TIntegerField;
    qryNadbVIDN: TStringField;
    qryNadbSUMPROC: TFloatField;
    qryNadbSP: TStringField;
    qryNadbPRCSOVM: TFloatField;
    qryNadbDT_BEG: TDateTimeField;
    qryNadbDT_END: TDateTimeField;
    qryNadbKDOBJ: TSmallintField;
    qryNadbKDKATP: TSmallintField;
    qryNadbPRCHS: TStringField;
    qryNadbPRSMM: TStringField;
    qryNadbNmKatP: TStringField;
    qryNadbShVidN: TStringField;
    qryNadbShObj: TStringField;
    qryNadbKDSPZ: TSmallintField;
    qryNadbSpz: TStringField;
    qryNadbSPEC_NR: TIntegerField;
    qryNadbNOTES: TStringField;
    qryNadbNRPRBEG: TStringField;
    qryNadbDTPRBEG: TDateTimeField;
    qryNadbNRPREND: TStringField;
    qryNadbDTPREND: TDateTimeField;
    dsrcNadb: TDataSource;
    updNadb: TUpdateSQL;
    qryUdrg: TQuery;
    qryUdrgNR: TIntegerField;
    qryUdrgKDSPS: TSmallintField;
    qryUdrgTABN: TIntegerField;
    qryUdrgVIDN: TStringField;
    qryUdrgSUMDOLG: TFloatField;
    qryUdrgSUMVZN: TFloatField;
    qryUdrgSP: TStringField;
    qryUdrgNOMDOK: TStringField;
    qryUdrgDT_BEG: TDateTimeField;
    qryUdrgDT_END: TDateTimeField;
    qryUdrgKDRSSCH: TIntegerField;
    qryUdrgKOMU: TStringField;
    qryUdrgShVidN: TStringField;
    qryUdrgKDSPZ: TSmallintField;
    qryUdrgPROC_PSB: TFloatField;
    qryUdrgSpz: TStringField;
    qryUdrgADRES: TStringField;
    qryUdrgKDPST: TIntegerField;
    qryUdrgShPst: TStringField;
    qryUdrgPOSTA: TStringField;
    qryUdrgNOTES: TStringField;
    qryUdrgNOMSBERBANK: TStringField;
    qryUdrgLICSCHET: TStringField;
    qryUdrgRSCHET: TStringField;
    qryUdrgBANK: TStringField;
    qryUdrgOKPOBANKA: TStringField;
    qryUdrgSPSRSCH: TSmallintField;
    qryUdrgSPEC_NR: TIntegerField;
    qryUdrgNmPst: TStringField;
    qryUdrgS_P: TStringField;
    dsrcUdrg: TDataSource;
    updUdrg: TUpdateSQL;
    updPrmUv: TUpdateSQL;
    dsrcUpi: TDataSource;
    qryDPere: TQuery;
    qryDPereNR: TIntegerField;
    qryDPereTABN: TIntegerField;
    qryDPereSPEC_NR: TIntegerField;
    qryDPerePRCOKL: TFloatField;
    qryDPereOKLTRF: TFloatField;
    qryDPereKDSPZ: TSmallintField;
    qryDPereSpz: TStringField;
    qryDPereNOTES: TStringField;
    dsrcDPere: TDataSource;
    updDPere: TUpdateSQL;
    popUpiPrt: TMenuItem;
    popUpiPrtSpov: TMenuItem;
    popUpiPrtKred: TMenuItem;
    popUpiPrtSprDhd: TMenuItem;
    popUpiPrtSprNlg: TMenuItem;
    sBtnToArc: TSpeedButton;
    DBNavigator1: TDBNavigator;
    popUpiSortByID: TMenuItem;
    sBtnRefresh: TSpeedButton;
    qryPereShSps: TStringField;
    TabCtrlAlf: TTabControl;
    popUpiSets: TMenuItem;
    popUpiSetFont: TMenuItem;
    popUpiSetFon: TMenuItem;
    qryPereNRPKT: TIntegerField;
    qryPereDTVPKT: TDateTimeField;
    qryPereNOINDX: TStringField;
    popMnuSposobVubDet: TMenuItem;
    popMnuSposobVubDetByCurSps: TMenuItem;
    popMnuSposobVubDetByAllSps: TMenuItem;
    popUpiPrtSubs: TMenuItem;
    popUpiArhivka: TMenuItem;
    qryNadbNRPKT: TIntegerField;
    qryNadbDTVPKT: TDateTimeField;
    qryNadbPRC_WT: TFloatField;
    qryPereNPD: TSmallintField;
    qryUdrgNRPOST: TStringField;
    qryUdrgDTPOST: TDateTimeField;
    qryNadbSPOV_MERGE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnUpi1Click(Sender: TObject);
    procedure sBtnUpi2Click(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuAddClick(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure dbgrPereDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popUpiAddClick(Sender: TObject);
    procedure popUpiEdtClick(Sender: TObject);
    procedure popUpiDelClick(Sender: TObject);
    procedure bBtnOkClick(Sender: TObject);
    procedure popUpiSortFamIOClick(Sender: TObject);
    procedure popUpiSortTabNClick(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure qryTotsNUCalcFields(DataSet: TDataSet);
    procedure popMnuPrtTotsClick(Sender: TObject);
    procedure dbgrUpi1DblClick(Sender: TObject);
    procedure dbgrUpi2DblClick(Sender: TObject);
    procedure sBtnAddInSpsCurMesClick(Sender: TObject);
    procedure dbgrPrmUvDblClick(Sender: TObject);
    procedure dbgrPereDblClick(Sender: TObject);
    procedure dbgrNadbDblClick(Sender: TObject);
    procedure dbgrUdrgDblClick(Sender: TObject);
    procedure chBoxOnlyActiveClick(Sender: TObject);
    procedure dbgrUpi1DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrUpi2DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popMnuTotsByDtProcClick(Sender: TObject);
    procedure popMnuTotsByZaMesGodClick(Sender: TObject);
    procedure popUpiNewPoiskClick(Sender: TObject);
    procedure popUpiPopup(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure popUpiCheckUvolnClick(Sender: TObject);
    procedure popMnuShwDetailsClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure popMnuSortNuDetByVidNClick(Sender: TObject);
    procedure popMnuSortNuDetByZaMGClick(Sender: TObject);
    procedure dsrcUpiDataChange(Sender: TObject; Field: TField);
    procedure qryPereCalcFields(DataSet: TDataSet);
    procedure qryNadbCalcFields(DataSet: TDataSet);
    procedure qryUdrgCalcFields(DataSet: TDataSet);
    procedure qryPrmUvAfterPost(DataSet: TDataSet);
    procedure qryPrmUvAfterDelete(DataSet: TDataSet);
    procedure qryPereAfterPost(DataSet: TDataSet);
    procedure qryPereAfterDelete(DataSet: TDataSet);
    procedure qryNadbAfterPost(DataSet: TDataSet);
    procedure qryUdrgAfterPost(DataSet: TDataSet);
    procedure qryNadbAfterDelete(DataSet: TDataSet);
    procedure qryUdrgAfterDelete(DataSet: TDataSet);
    procedure qryPereBeforeInsert(DataSet: TDataSet);
    procedure qryPereNewRecord(DataSet: TDataSet);
    procedure dbgrNadbDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrUdrgDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrTotsNUDblClick(Sender: TObject);
    procedure cdsUpiAfterDelete(DataSet: TDataSet);
    procedure cdsUpiAfterPost(DataSet: TDataSet);
    procedure cdsUpiCalcFields(DataSet: TDataSet);
    procedure popUpiPrtSpovClick(Sender: TObject);
    procedure popUpiPrtKredClick(Sender: TObject);
    procedure popUpiPrtSprDhdClick(Sender: TObject);
    procedure popUpiPrtSprNlgClick(Sender: TObject);
    procedure sBtnToArcClick(Sender: TObject);
    procedure popUpiSortByIDClick(Sender: TObject);
    procedure sBtnRefreshClick(Sender: TObject);
    procedure dbgrNuDetDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TabCtrlAlfChange(Sender: TObject);
    procedure FldKdKatPValidate(Sender: TField);
    procedure FldSoValidate(Sender: TField);
    procedure FldSovmValidate(Sender: TField);
    procedure FldPdNlgValidate(Sender: TField);
    procedure FldKdObjJValidate(Sender: TField);
    procedure FldVidNValidate(Sender: TField);
    procedure popUpiSetFontClick(Sender: TObject);
    procedure popUpiSetFonClick(Sender: TObject);
    procedure popMnuSposobVubDetByCurSpsClick(Sender: TObject);
    procedure popMnuSposobVubDetByAllSpsClick(Sender: TObject);
    procedure qryTotsNUAfterScroll(DataSet: TDataSet);
    procedure popUpiPrtSubsClick(Sender: TObject);
    procedure popUpiArhivkaClick(Sender: TObject);
    procedure qryPereNPDValidate(Sender: TField);
    procedure DateFieldSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    n_SvTabN : integer;
    b_WasUpdated, b_WasAddInSps, bVuborMode, bNoCheckInSps : boolean;

    cFontName : ShortString;
    nFontSize : word;
    bFontBold, bFontItalic : boolean;
    mDbgrColor : TColor;

    dDtBegMes, dDtEndMes : TDateTime;// имеется ввиду месяц по dDtProc из Z_Main
    bPrUvEdit : boolean;
    nDbgrNuDetHeight : SmallInt;
    cSvObj, cSvKdKatP, cSvSO, cSvOklTrf, cSvAvans, cSvPrcWrkTime, cSvProcLG,
    cSvSpAv, cSvDolgnost, cSvKdSpz, cSvPrPens, cSvSovm, cSvPdNlg,
    cSvKolMin, cSvPrfs, cSvNrPrikaza,
    cSvDtPrikaza, cSvNotes, cSvInv, cSvRang, cSvRazr : string;
    // все вышележащее буду сохранять для ввода в новую запись в Z_PERE
    procedure SetDbgrPereColumns;
    procedure SetDbgrNadbColumns;
    procedure GetPereInf(nTabN : integer; dDtBegMes : TDateTime;
                         var nKdObj, nKdKatP : integer; var nKdSps : SmallInt);
    function MyIsInSpsMes(dDtProc : TDateTime; nTabN : integer;
                           nKdSps : SmallInt; mObjList : TStringList) : boolean;
    procedure SetUpiOrder(nTabN : integer);
    procedure OpenQryTotsNU;
    procedure SetDbgrTotsNuColumns;
//    function MyIsUvolen(nTabN : integer; dDtBeg, dDtEnd : TDateTime) : boolean;
//    procedure WritePrmUvInUpi(nTabN : integer);
    procedure SetDbgrUpi1Columns;
    procedure SetDetMode;
    procedure OpenQryNuDet;
    procedure SetPageControl2ActivePage;
    function CheckNewsInUpi : boolean;
    procedure SetTabsFont;
    procedure SetTabsColor;
    procedure AddPere;
    procedure EdtPere;
    procedure AddNdb;
    procedure EdtNdb;

    procedure CallNewEmplSrch;
    procedure CallOldEmplSrch;
  public
    { Public declarations }
  end;


procedure ExtOpenQryUpi;  // только открыть qryUpi, которая находится на Z_DM,
                          // не показывая сию форму
procedure UpiShowModal(nTabN : integer; var bWasUpdated, bWasAddInSps : boolean);

function GetFromUpiToSps(var nTabN, nKdObj, nKdKatP : integer;
                    var nKdSps : SmallInt; var bWasUpdated : boolean) : boolean;
function GetTabN(var nTabN, nKdObj, nKdKatP : integer; var nKdSps : SmallInt;
                                           var cFam, cIma, cOtch : string;
                                           var bWasUpdated : boolean) : boolean;

const SECTION = 'Z_TUpi';

var
  FormTUpi: TFormTUpi;

implementation

uses A_Const, A_Lib, A_DM, Z_DM, Z_Main,  z_eUpiA, z_EUpiE, z_UDpDlg,
     Z_EPrmUv, Z_EPere, Z_ENadb, Z_EUdrg, Z_VvTn, Z_VvFm, z_VvFmTn,
     Z_CmnPrt, z_SSpov2, z_DlSDhd, z_SArhiv, FormSrchEmpl, DModUsrSetts;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ExtOpenQryUpi;  // только открыть qryUpi, которая находится на Z_DM,
                          // не показывая сию форму, но в тутошней сортировке
begin
  FormTUpi := TFormTUpi.Create(Application);
  with FormTUpi do begin
    DmMain.qryUpi.Filtered := false;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure UpiShowModal(nTabN : integer; var bWasUpdated, bWasAddInSps : boolean);
begin
  FormTUpi := TFormTUpi.Create(Application);
  with FormTUpi do begin
    bVuborMode := false;
    bNoCheckInSps := true;
    bBtnOk.Visible := false;
    Caption := 'Личный состав [Сотрудники]';
    b_WasUpdated := false;
    b_WasAddInSps := false;
    DmMain.qryUpi.Filtered := false;
    if (nTabN = 0) and (n_SvTabN <> 0) then
      nTabN := n_SvTabN;
    if not dsrcUpi.DataSet.Active then
      SetUpiOrder(nTabN)
    else if nTabN <> 0 then
      dsrcUpi.DataSet.Locate('TabN', nTabN, []);
    if PageControl1.ActivePage = tsUpi1 then
      ActiveControl := dbgrUpi1
    else
      ActiveControl := dbgrUpi2;
    SetPageControl2ActivePage;
    ShowModal;
    bWasUpdated := b_WasUpdated;
    bWasAddInSps := b_WasAddInSps;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormTUpi.CheckNewsInUpi : boolean;
var bOtherUsr, bOtherLastUpdNR, bIsSved : boolean;
begin
  bOtherLastUpdNR := false;
  bOtherUsr := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UpdTables where UPPER(NmTbl) = "Z_UPI"');
    Open;
    bIsSved := (RecordCount > 0);
    if bIsSved then begin
      bOtherLastUpdNR := FieldByName('LastUpdNR').AsInteger <> nUpiUpdNR;
      nUpiUpdNR := FieldByName('LastUpdNR').AsInteger;
      bOtherUsr := FieldByName('KdUsr').AsInteger <> nAppKdUsr;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
    Result := bIsSved and bOtherLastUpdNR and bOtherUsr;
  end;
end;
//------------------------------------------------------------------------------
function GetTabN(var nTabN, nKdObj, nKdKatP : integer; var nKdSps : SmallInt;
                            var cFam, cIma, cOtch : string;
                                      var bWasUpdated : boolean) : boolean;
begin
  Result := false;
  FormTUpi := TFormTUpi.Create(Application);
  with FormTUpi do begin
    DmMain.qryUpi.Filtered := false;
    bVuborMode := true;
    bNoCheckInSps := true;
    bBtnCancel.Caption := 'Отказ';
    Caption := 'Выбор из спр-ка "Сотрудники"';
    cFam := '';
    cIma := '';
    cOtch := '';
    b_WasUpdated := false;
    if not dsrcUpi.DataSet.Active then
      SetUpiOrder(nTabN)
    else
      dsrcUpi.DataSet.Locate('TabN', nTabN, []);
    if PageControl1.ActivePage = tsUpi1 then
      ActiveControl := dbgrUpi1
    else
      ActiveControl := dbgrUpi2;
    if ShowModal = mrOk then begin
      Result := true;
      nTabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
      cFam  := dsrcUpi.DataSet.FieldByName('Fam').AsString;
      cIma  := dsrcUpi.DataSet.FieldByName('Ima').AsString;
      cOtch := dsrcUpi.DataSet.FieldByName('Otch').AsString;
      GetPereInf(nTabN, dDtProc, nKdObj, nKdKatP, nKdSps);
    end;
    bWasUpdated := b_WasUpdated;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetFromUpiToSps(var nTabN, nKdObj, nKdKatP : integer;
                    var nKdSps : SmallInt; var bWasUpdated : boolean) : boolean;
begin
  Result := false;
  FormTUpi := TFormTUpi.Create(Application);
  with FormTUpi do begin
    DmMain.qryUpi.Filtered := false;
    bVuborMode := true;
    bNoCheckInSps := false;
    bBtnCancel.Caption := 'Отказ';
    Caption := 'Выбор из спр-ка "Сотрудники"';
    b_WasUpdated := false;
    if not dsrcUpi.DataSet.Active then
      SetUpiOrder(nTabN)
    else
      dsrcUpi.DataSet.Locate('TabN', nTabN, []);
    if PageControl1.ActivePage = tsUpi1 then
      ActiveControl := dbgrUpi1
    else
      ActiveControl := dbgrUpi2;
    if ShowModal = mrOk then begin
      Result := true;
      nTabN  := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
      GetPereInf(nTabN, dDtProc, nKdObj, nKdKatP, nKdSps);
    end;
    Free;
    bWasUpdated := b_WasUpdated;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.GetPereInf(nTabN : integer; dDtBegMes : TDateTime;
                         var nKdObj, nKdKatP : integer; var nKdSps : SmallInt);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DmMain.qryPere.DatabaseName;
    SQL.Add('Select * from Z_Pere where (TabN = :nTabN) and ' +
            ' (Dt_Beg <= :dDtBegMes) order by Dt_Beg desc, NR desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegMes').AsDateTime := dDtBegMes;
    Open;
    First;
    while not Eof do begin
      nKdObj  := FieldByName('KdObj').AsInteger;
      nKdKatP := FieldByName('KdKatP').AsInteger;
      nKdSps  := FieldByName('KdSps').AsInteger;
      if FieldByName('Dt_Beg').AsDateTime <= dDtBegMes then
        Break;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.SetDbgrUpi1Columns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrUpi1.Columns.Count-1 do begin
    with dbgrUpi1.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'MYPRUV') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.FormCreate(Sender: TObject);
var nCaseUpiSort, nPgCtrl1, nPgCtrl2 : word;
    bIsNewsInUpi : boolean;
begin
  LabelCntRec.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    n_SvTabN := ReadInteger(SECTION, 'nSvTN', 0);
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 600);
    PanelLeft.Width := ReadInteger(SECTION, 'pnlLW', 161);
    dbgrPrmUv.Height := ReadInteger(SECTION, 'grPrUvSpsH', 150);
    nCaseUpiSort :=  ReadInteger(SECTION, 'nUpiSort', 2);
    nPgCtrl1 := ReadInteger(SECTION, 'PgCtrl1', 1);
    nPgCtrl2 := ReadInteger(SECTION, 'PgCtrl2', 1);
    nDbgrNuDetHeight := ReadInteger(SECTION, 'nDetH', 235);
    chBoxOnlyActive.Checked := false;//ReadBool(SECTION, 'bOnlyActive', false);
    popMnuTotsByDtProc.Checked := ReadBool(SECTION, 'bTotsByDtProc', true);
    popMnuTotsByZaMesGod.Checked := not popMnuTotsByDtProc.Checked;
    cFontName   := ReadString(SECTION, 'cFN', 'Arial');
    nFontSize   := ReadInteger(SECTION, 'cFS', 10);
    bFontBold   := ReadBool(SECTION, 'bFB', true);
    bFontItalic := ReadBool(SECTION, 'bFI', false);
    mDbgrColor  := ReadInteger(SECTION, 'mDbgrClr', clInfoBk);
    popMnuSposobVubDetByAllSps.Checked := ReadBool(SECTION, 'DetByAllSps', true);
    popMnuSposobVubDetByCurSps.Checked := not popMnuSposobVubDetByAllSps.Checked;
    Free;
  end;
  if nCaseUpiSort = 1 then begin
    popUpiSortFamIO.Checked := true;
    popUpiSortTabN.Checked  := false;
    popUpiSortByID.Checked  := false; end
  else if nCaseUpiSort = 2 then begin
    popUpiSortFamIO.Checked := false;
    popUpiSortTabN.Checked  := true;
    popUpiSortByID.Checked  := false; end
  else begin
    popUpiSortFamIO.Checked := false;
    popUpiSortTabN.Checked  := false;
    popUpiSortByID.Checked  := true;
  end;
  if FileExists(cDirVids + 'u4Upi01.vid') then
    dbgrUpi1.Columns.LoadFromFile(cDirVids + 'u4Upi01.vid');
  if FileExists(cDirVids + 'u3Upi02.vid') then
    dbgrUpi2.Columns.LoadFromFile(cDirVids + 'u3Upi02.vid');
  if FileExists(cDirVids + 'u3PrmUv.vid') then
    dbgrPrmUv.Columns.LoadFromFile(cDirVids + 'u3PrmUv.vid');
  if FileExists(cDirVids + 'u3Pere01.vid') then
    dbgrPere.Columns.LoadFromFile(cDirVids + 'u3Pere01.vid');
  if FileExists(cDirVids + 'u3Nadb01.vid') then
    dbgrNadb.Columns.LoadFromFile(cDirVids + 'u3Nadb01.vid');
  if FileExists(cDirVids + 'u3Udrg.vid') then
    dbgrUdrg.Columns.LoadFromFile(cDirVids + 'u3Udrg.vid');
  if FileExists(cDirVids + 'u3TtNu01.vid') then
    dbgrTotsNU.Columns.LoadFromFile(cDirVids + 'u3TtNu01.vid');
  if FileExists(cDirVids + 'u6NuDet.vid') then
    dbgrNuDet.Columns.LoadFromFile(cDirVids + 'u6NuDet.vid');
  tsUpi1.TabVisible := false;
  tsUpi2.TabVisible := false;
  SetDbgrUpi1Columns;
  if nPgCtrl1 = 1 then begin
    sBtnUpi1.Down := true;
    sBtnUpi1.Click; end
  else begin
    sBtnUpi2.Down := true;
    sBtnUpi2.Click;
  end;
  PanelID.Caption := '';
  dDtBegMes := dDtProc;
  dDtEndMes := myLastDOM(dDtBegMes);
  bPrUvEdit := false; // признак того, что редактируется "виртуальное" поле
                      // MyPrUv и это не нужно передавать в БД
  popUpiSortTabN.Checked := not popUpiSortFamIO.Checked;
  popUpiSep2.Visible := bFlagDbg;
  popUpiCheckUvoln.Visible := bFlagDbg;
  sBtnToArc.Visible := bFlagDbg;
  bIsNewsInUpi := CheckNewsInUpi;
  if bIsNewsInUpi or not dsrcUpi.DataSet.Active then
    SetUpiOrder(n_SvTabN);
  LabelCntRec.Caption := 'Записей ' + IntToStr(dsrcUpi.DataSet.RecordCount);
  if n_SvTabN <> 0 then
    dsrcUpi.DataSet.Locate('TabN', n_SvTabN, []);
  if nPgCtrl2 = 1 then
    PageControl2.ActivePage := tsPere
  else if nPgCtrl2 = 2 then
    PageControl2.ActivePage := tsNadb
  else if nPgCtrl2 = 3 then
    PageControl2.ActivePage := tsPrmUv
  else
    PageControl2.ActivePage := tsUdrg;
  SetDbgrPereColumns;
  SetDbgrNadbColumns;
  SetTabsFont;
  SetTabsColor;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.chBoxOnlyActiveClick(Sender: TObject);
begin
//  SetQryUpiSort;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.SetDbgrPereColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrPere.Columns.Count-1 do begin
    with dbgrPere.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SHVED') then
        Visible := bAppZpObjVed
      else if (cUpper = 'SHBRIG') then
        Visible := false;    // пока отрубил совсем
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.SetDbgrNadbColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrNadb.Columns.Count-1 do begin
    with dbgrNadb.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SHVED') then
        Visible := bAppZpObjVed
      else if (cUpper = 'SHBRIG') then
        Visible := false;    // пока отрубил совсем
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrUpi1.Columns.SaveToFile(cDirVids + 'u4Upi01.vid');
  dbgrUpi2.Columns.SaveToFile(cDirVids + 'u3Upi02.vid');
  dbgrPrmUv.Columns.SaveToFile(cDirVids + 'u3PrmUv.vid');
  dbgrPere.Columns.SaveToFile(cDirVids + 'u3Pere01.vid');
  dbgrNadb.Columns.SaveToFile(cDirVids + 'u3Nadb01.vid');
  dbgrUdrg.Columns.SaveToFile(cDirVids + 'u3Udrg.vid');
  dbgrTotsNU.Columns.SaveToFile(cDirVids + 'u3TtNu01.vid');
  dbgrNuDet.Columns.SaveToFile(cDirVids + 'u6NuDet.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'nSvTN',
                            dsrcUpi.DataSet.FieldByName('TabN').AsInteger);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'pnlLW', PanelLeft.Width);
    WriteInteger(SECTION, 'grPrUvSpsH', dbgrPrmUv.Height);
    WriteInteger(SECTION, 'nDetH', nDbgrNuDetHeight);
    if popUpiSortFamIO.Checked then
      WriteInteger(SECTION, 'nUpiSort', 1)
    else if popUpiSortTabN.Checked then
      WriteInteger(SECTION, 'nUpiSort', 2)
    else
      WriteInteger(SECTION, 'nUpiSort', 3);
    if PageControl1.ActivePage = tsUpi1 then
      WriteInteger(SECTION, 'PgCtrl1', 1)
    else
      WriteInteger(SECTION, 'PgCtrl1', 2);
    if PageControl2.ActivePage = tsPere then
      WriteInteger(SECTION, 'PgCtrl2', 1)
    else if PageControl2.ActivePage = tsNadb then
      WriteInteger(SECTION, 'PgCtrl2', 2)
    else if PageControl2.ActivePage = tsPrmUv then
      WriteInteger(SECTION, 'PgCtrl2', 3)
    else
      WriteInteger(SECTION, 'PgCtrl2', 4);
    WriteBool(SECTION, 'bOnlyActive', false{chBoxOnlyActive.Checked});
    WriteBool(SECTION, 'bTotsByDtProc', popMnuTotsByDtProc.Checked);
    WriteString(SECTION, 'cFN', cFontName);
    WriteInteger(SECTION, 'cFS', nFontSize);
    WriteBool(SECTION, 'bFB', bFontBold);
    WriteBool(SECTION, 'bFI', bFontItalic);
    WriteInteger(SECTION, 'mDbgrClr', dbgrUpi2.Color);
    WriteBool(SECTION, 'DetByAllSps', popMnuSposobVubDetByAllSps.Checked);
    Free;
  end;
  qryTotsNU.Close;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.sBtnUpi1Click(Sender: TObject);
begin
  PageControl1.ActivePage := tsUpi1;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.sBtnUpi2Click(Sender: TObject);
begin
  PageControl1.ActivePage := tsUpi2;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiPopup(Sender: TObject);
begin;
  popUpiEdt.Enabled := dsrcUpi.DataSet.Active and
                                    (dsrcUpi.DataSet.RecordCount > 0);
  popUpiAdd.Enabled := dsrcUpi.DataSet.Active;
  popUpiDel.Enabled := popUpiEdt.Enabled and (bFlagDbg or (nAppUsrKat <= 1));
  popUpiNewPoisk.Enabled := popUpiEdt.Enabled;
  popUpiSort.Enabled := popUpiEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuPopup(Sender: TObject);
begin
  popMnuAdd.Visible := true;
  popMnuEdt.Visible := true;
  popMnuDel.Visible := true;
  popMnuPrtTots.Visible := false;
  popMnuSep1.Visible := false;
  popMnuTotsCase.Visible := false;
  popMnuShwDetails.Visible := false;
  popMnuSortNuDet.Visible := false;
  popMnuSposobVubDet.Visible := false;
  if popMnu.PopupComponent = dbgrPrmUv then begin
    popMnuHead.Caption := '== Приемы/Увольнения ==';
    popMnuEdt.Enabled := dbgrPrmUv.DataSource.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled; end
  else if popMnu.PopupComponent = dbgrPere then begin
    popMnuHead.Caption := '== Перемещения ==';
    popMnuEdt.Enabled := dbgrPere.DataSource.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled; end
  else if popMnu.PopupComponent = dbgrNadb then begin
    popMnuHead.Caption := '== Надбавки ==';
    popMnuEdt.Enabled := dbgrNadb.DataSource.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled; end
  else if popMnu.PopupComponent = dbgrUdrg then begin
    popMnuHead.Caption := '== Удержания ==';
    popMnuEdt.Enabled := dbgrUdrg.DataSource.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled; end
  else if popMnu.PopupComponent = dbgrTotsNU then begin
    popMnuHead.Caption := '== Итоги ==';
    popMnuAdd.Visible := false;
    popMnuEdt.Visible := false;
    popMnuDel.Visible := false;
    popMnuShwDetails.Visible := true;
    {popMnuShwDetails.Enabled := (nAppKdSpsUsr <= 2);} end
  else if popMnu.PopupComponent = dbgrNuDet then begin
    popMnuHead.Caption := '== Подробности ==';
    popMnuAdd.Visible := false;
    popMnuEdt.Visible := false;
    popMnuDel.Visible := false;
    popMnuSortNuDet.Visible := true;
    popMnuSposobVubDet.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuAddClick(Sender: TObject);
var nSvNR : integer; {bUpdated : boolean;}
begin
  if popMnu.PopupComponent = dbgrPrmUv then begin
    with dbgrPrmUv.DataSource.DataSet do begin
      nSvNR := FieldByName('NR').AsInteger;
      Append;
      FieldByName('KdSps').AsInteger := 0;
      FieldByName('TabN').AsInteger := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
      if AddEdtPrmUv(dsrcUpi.DataSet.FieldByName('TabN').AsInteger,
                          dsrcUpi.DataSet.FieldByName('FamIO').AsString,
                                    dbgrPrmUv.DataSource) {Z_EPrmUv} then begin
        Post;
//        WritePrmUvInUpi(cdsUpiTabN.AsInteger);
        b_WasUpdated := true; end
      else begin
        Cancel;
        Locate('NR', nSvNR, []);
      end;
    end; end
  else if popMnu.PopupComponent = dbgrPere then
    AddPere
  else if popMnu.PopupComponent = dbgrNadb then
    AddNdb
  else if popMnu.PopupComponent = dbgrUdrg then begin
    with dbgrUdrg.DataSource.DataSet do begin
      nSvNR := FieldByName('NR').AsInteger;
      Append;
      FieldByName('KdSps').AsInteger := gl_nAppKdSpsUsr; // nKdSps;
      FieldByName('TabN').AsInteger := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;

      // >> Z_EUdrg 
      if TFormEAUdrg.AddEdtUdrg(MyFamIO(
        dsrcUpi.DataSet.FieldByName('Fam').AsString,
        dsrcUpi.DataSet.FieldByName('Ima').AsString,
        dsrcUpi.DataSet.FieldByName('Otch').AsString),
        dbgrUdrg.DataSource) then
      begin
        Post;
        b_WasUpdated := true;
      end
      else begin
        Cancel;
        Locate('NR', nSvNR, []);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.AddPere;
var nSvNR, nTabN, nSpec_NR : integer; nSmCmbOkl : double;
    cFamIO : ShortString; cLogMsg : string; // bUpdated : boolean;
begin
  nTabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
  cFamIO := dsrcUpi.DataSet.FieldByName('FamIO').AsString;
  with dbgrPere.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('KdSps').AsInteger := gl_nKdSps;
    FieldByName('TabN').AsInteger  := nTabN;
    if AddEdtPere(gl_nKdSps, nTabN, cFamIO,
                                  dsrcPere, dsrcDPere) {Z_EPere} then begin
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
      //bUpdated := true;
      b_WasUpdated := true; end
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.AddNdb;
var cLogMsg : string; nSvNR, nTabN : integer; bUpdated : boolean;
begin
  nTabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
  with dbgrNadb.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('KdSps').AsInteger := gl_nAppKdSpsUsr; // nKdSps;
    FieldByName('TabN').AsInteger := nTabN;
    if TFormENadb.Run(nTabN, gl_nKdSps,
                dsrcUpi.DataSet.FieldByName('FamIO').AsString,
                   dbgrNadb.DataSource, bUpdated) {Z_ENadb} then begin
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SpsRsch = ' + FieldByName('SpsRsch').AsString +
                 ', См_% = ' + FieldByName('SP').AsString +
                 ', SmPrc = ' + FieldByName('SumProc').AsString +
                 ', KdObj = ' + FieldByName('KdObj').AsString +
                 ', KdKatP = ' + FieldByName('KdKatP').AsString +
                 ', KdSBU = ' + FieldByName('KdSpZ').AsString;
      if not FieldByName('NrPrBeg').IsNull and
                              (FieldByName('NrPrBeg').AsString > '') then
        cLogMsg := cLogMsg + ',  №_ПрНач = ' + FieldByName('NrPrBeg').AsString;
      if not FieldByName('DtPrBeg').IsNull and
                              (FieldByName('NrPrBeg').AsString > '') then
        cLogMsg := cLogMsg + ',  ДтПрНач = ' + FieldByName('DtPrBeg').AsString;
      if not FieldByName('NrPrEnd').IsNull and
                              (FieldByName('NrPrEnd').AsString > '') then
        cLogMsg := cLogMsg + ',  №_ПрКнц = ' + FieldByName('NrPrEnd').AsString;
      if not FieldByName('DtPrEnd').IsNull and
                              (FieldByName('DtPrEnd').AsString > '') then
        cLogMsg := cLogMsg + ',  ДтПрКнц = ' + FieldByName('DtPrEnd').AsString;
      if not FieldByName('Notes').IsNull and
                          (FieldByName('Notes').AsString > '') then
        cLogMsg := cLogMsg + ';  Примеч: = ' + FieldByName('Notes').AsString;
      Post;
      DmMain.AddLog(Now, nTabN,
                          'Ввод надбавки', gc_AppNmUsr, 'Z_Nadb', cLogMsg);
      b_WasUpdated := true; end
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuEdtClick(Sender: TObject);
begin
  if popMnu.PopupComponent = dbgrPrmUv then
    dbgrPrmUvDblClick(Self)
  else if popMnu.PopupComponent = dbgrPere then
    dbgrPereDblClick(Self)
  else if popMnu.PopupComponent = dbgrNadb then
    dbgrNadbDblClick(Self)
  else if popMnu.PopupComponent = dbgrUdrg then begin
    with dbgrUdrg.DataSource.DataSet do begin
      Edit;

      if TFormEAUdrg.AddEdtUdrg(
        MyFamIO(dsrcUpi.DataSet.FieldByName('Fam').AsString,
        dsrcUpi.DataSet.FieldByName('Ima').AsString,
        dsrcUpi.DataSet.FieldByName('Otch').AsString),
        dbgrUdrg.DataSource) {Z_EUdrg} then
      begin
        Post;
        b_WasUpdated := true;
      end else
        Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuDelClick(Sender: TObject);
var cMsg, cLogMsg : string; nTabN : integer;
    //dDtBeg : TDateTime;  {bNeedPereschet : boolean;}
begin
  cMsg := 'Запись удаляется безвозвратно. Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    if popMnu.PopupComponent = dbgrPrmUv then begin
      //nTabN := qryPrmUvTabN.AsInteger;
      qryPrmUv.Delete; end
    else if popMnu.PopupComponent = dbgrPere then with qryPere do begin
      // dDtBeg := qryPere.FieldByName('Dt_Beg').AsDateTime;
      // nTabN  := qryPere.FieldByName('TabN').AsInteger;
      // bNeedPereschet := (dDtBeg <= dCtrlDate);
      // if (dDtBeg <= dCtrlDate) then
      //   DmMain.AddPereschetInOtkl(nKdSps, nTabN, dCtrlDate, dDtBeg);
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', OklTrf = ' + FieldByName('OklTrf').AsString;
      DmMain.AddLog(Now, nTabN,
                          'Удаление перемещений', gc_AppNmUsr, 'Z_Pere', cLogMsg);
      Delete; end
    else if popMnu.PopupComponent = dbgrNadb then with qryNadb do begin
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SP = ' + FieldByName('SP').AsString +
                 ', SmPrc = ' + FieldByName('SumProc').AsString;
      DmMain.AddLog(Now, nTabN,
                          'Удаление надбавки', gc_AppNmUsr, 'Z_Nadb', cLogMsg);
      Delete; end
    else if popMnu.PopupComponent = dbgrUdrg then with qryUdrg do begin
      Delete;
    end;
    b_WasUpdated := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuPrtTotsClick(Sender: TObject);
begin
  F6PrtTotsNU(dsrcUpi.DataSet.FieldByName('TabN').AsInteger,    {Z_CmnPrt}
               MyFamIO(dsrcUpi.DataSet.FieldByName('Fam').AsString,
                      dsrcUpi.DataSet.FieldByName('Ima').AsString,
                     dsrcUpi.DataSet.FieldByName('Otch').AsString), qryTotsNU);
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrPereDrawColumnCell(Sender: TObject;
                const Rect: TRect; DataCol: Integer; Column: TColumn;
                                              State: TGridDrawState);
begin
  with dbgrPere.Canvas do begin
    if not (gdFocused in State) then begin
      if (Column.FieldName = 'PRCWRKTIME') and (not Column.Field.IsNull) and
                                            (Column.Field.AsFloat <> 100) then
        Font.Color := clRed
      else begin                         {оклад из нескольких частей}
        if dbgrPere.DataSource.DataSet.FieldByName('CmbOkl').AsString = '1' then
          Font.Color := clBlue
        else
          Font.Color := clWindowText;
      end;
      if Pos('FrOPK', dbgrPere.DataSource.DataSet.
                             FieldByName('Notes').AsString) > 0 then
        Font.Style := []
      else
        Font.Style := [fsBold];
    end;
  end;
  dbgrPere.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiAddClick(Sender: TObject);
var nKdKatP, nNewTabN : integer; bAddInSps : boolean; bGoToTabN : boolean;
    cCode,cZ_Kpp : ShortString;
    nSvNR : integer;
begin
  with dsrcUpi.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    //Append;
    Insert;
    FieldByName('TabN').AsInteger := -1111;     {z_eUpiA}
    FieldByName('UkrCitiz').AsString := 'Y';
    if TFormUpiAdd.AddUpi(dsrcUpi.DataSet as TQuery, 0, nKdKatP, nNewTabN, bAddInSps,
                           false, cCode,cZ_Kpp, bGoToTabN) {z_eUpiA} then begin
      // хотя все дела по сохранению сделаны в z_eUpiA, тут же все-равно надо
      // переоткрыться, дабы выстроиться в соответствии с сортировкой
      {Post}
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      DmMain.SetUpdTblMsg('Z_UPI', nAppKdUsr, nUpiUpdNR);
      DisableControls;
      Close;
      Open;
      Locate('TabN', nNewTabN, []);
      EnableControls;
      Screen.Cursor := crDefault; end
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiEdtClick(Sender: TObject);
var cOldFam, cOldIma, cOldOtch, cOldID, cOldPol, cOldNotes, Citiz : ShortString;
    dOldDOB : TDateTime; nSvTabN : integer;
begin
  with dsrcUpi.DataSet do begin
    cOldFam  := FieldByName('Fam').AsString;
    cOldIma  := FieldByName('Ima').AsString;
    cOldOtch := FieldByName('Otch').AsString;
    cOldID   := FieldByName('ID').AsString;
    cOldPol  := FieldByName('Pol').AsString;
    dOldDOB  := FieldByName('DOB').AsDateTime;
    cOldNotes := FieldByName('MyNotes').AsString;
    Citiz := FieldByName('UkrCitiz').AsString;
    Edit;
    if TFormUpiEdt.EdtUpi and ((cOldFam <> FieldByName('Fam').AsString) or
                 (cOldIma <> FieldByName('Ima').AsString) or
                  (cOldOtch <> FieldByName('Otch').AsString) or
                   (cOldID <> FieldByName('ID').AsString) or
                    (cOldPol <> FieldByName('Pol').AsString) or
                     (dOldDOB <> FieldByName('DOB').AsDateTime) or
                      (cOldNotes <> FieldByName('MyNotes').AsString) or
                      (Citiz <> FieldByName('UkrCitiz').AsString)) then begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      Post;
      DmMain.SetUpdTblMsg('Z_UPI', nAppKdUsr, nUpiUpdNR);
      nSvTabN := FieldByName('TabN').AsInteger;
      DisableControls;
      Close;
      Open;
      Locate('TabN', nSvTabN, []);
      EnableControls;
      Screen.Cursor := crDefault;
      b_WasUpdated := true; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiDelClick(Sender: TObject);
var bIsInUse : boolean; cMsg, cLogMsg : string; cFamIO : ShortString;
    nTabN : integer;
begin
  nTabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
  cFamIO := dsrcUpi.DataSet.FieldByName('FamIO').AsString;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select count( * ) CNT from Z_NU where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    bIsInUse := (RecordCount <> 0) and (FieldByName('CNT').AsInteger <> 0);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if bIsInUse then
    cMsg := 'При удалении записи в справочнике "Сотрудники" удаляются' + #13#10 +
          'и  все записи о начислениях  и  удержаниях,  перемещениях,' + #13#10 +
            'надбавках по удаляемому табельному номеру.     Согласны?:'
  else
    cMsg := 'Запись удаляется безвозвратно.   Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    dsrcUpi.DataSet.Delete;
    DmMain.SetUpdTblMsg('Z_UPI', nAppKdUsr, nUpiUpdNR);
    cLogMsg := 'TabN = ' + IntToStr(nTabN) + ', ' + cFamIO +
                                           ', Удаление из спр-ка "Сотрудники" ';
    DmMain.AddLog(Now, nTabN,'Удаление из Z_UPI', gc_AppNmUsr, 'Z_UPI', cLogMsg);
    b_WasUpdated := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrUpi1DblClick(Sender: TObject);
begin
  if bVuborMode then
    bBtnOkClick(Self)
  else if not dsrcUpi.DataSet.FieldByName('TabN').IsNull then
    popUpiEdtClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrUpi2DblClick(Sender: TObject);
begin
  if bVuborMode then
    bBtnOkClick(Self)
  else if not dsrcUpi.DataSet.FieldByName('TabN').IsNull then
    popUpiEdtClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.bBtnOkClick(Sender: TObject);
var i, n_KdSps : SmallInt; cMsg{, cShObj} : ShortString; mObjList : TStringList;
begin
  if dsrcUpi.DataSet.RecordCount <= 0 then Exit;
  if bVuborMode and bNoCheckInSps then
    ModalResult := mrOk
  else begin
    n_KdSps  := gl_nKdSps;
    mObjList := TStringList.Create;
    if not MyIsInSpsMes(dDtProc, dsrcUpi.DataSet.FieldByName('TabN').AsInteger,
                                                        n_KdSps, mObjList) then
      ModalResult := mrOk
    else begin
      cMsg := 'Сотрудник ' +
                      MyFamIO(dsrcUpi.DataSet.FieldByName('Fam').AsString,
                               dsrcUpi.DataSet.FieldByName('Ima').AsString,
                                dsrcUpi.DataSet.FieldByName('Otch').AsString) +
                  ' уже есть в списке текущего месяца в ';
      if mObjList.Count = 1 then
        cMsg := cMsg + 'подразделении ' + mObjList[0]
      else begin
        cMsg := cMsg + 'подразделениях: ' + #13#10;
        for i := 0 to mObjList.Count - 1 do begin
          cMsg := cMsg + mObjList[i] + #13#10;
        end;
      end;
      ShowMessage(cMsg);
    end;
    mObjList.Destroy;
  end;
end;
//------------------------------------------------------------------------------
function TFormTUpi.MyIsInSpsMes(dDtProc : TDateTime; nTabN : integer;
                          nKdSps : SmallInt; mObjList : TStringList) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select z_Sps.*, z_KdObj.ShObj, z_KdObj.NmObj ' +
            ' from z_Sps Left Outer Join z_KdObj ' +
            ' on (z_KdObj.KdObj = z_Sps.KdObj)' +
            ' where (z_Sps.DtProc = :dDtProc) and z_Sps.KdSps = :nKdSps and ' +
            ' (z_Sps.TabN = :nTabN) ');
    SQL.Add('order by KdObj');
    ParamByName('dDtProc').AsDateTime  := dDtProc;
    ParamByName('nKdSps').AsInteger    := nKdSps;
    ParamByName('nTabN').AsInteger     := nTabN;
    Open;
    mObjList.Clear;
    if RecordCount > 0 then begin
      while not Eof do begin
        mObjList.Add(FieldByName('KdObj').AsString + ' ' +
                     FieldByName('ShObj').AsString + ' ' +
                     FieldByName('NmObj').AsString + ' список ' +
                     FieldByName('KdSps').AsString);
        Next;
      end;
      Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiSortFamIOClick(Sender: TObject);
begin
  if not popUpiSortFamIO.Checked then begin
    popUpiSortFamIO.Checked := true;
    popUpiSortTabN.Checked  := false;
    popUpiSortByID.Checked  := false;
    SetUpiOrder(dsrcUpi.DataSet.FieldByName('TabN').AsInteger);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiSortTabNClick(Sender: TObject);
begin
  if not popUpiSortTabN.Checked then begin
    popUpiSortTabN.Checked  := true;
    popUpiSortFamIO.Checked := false;
    popUpiSortByID.Checked  := false;
    SetUpiOrder(dsrcUpi.DataSet.FieldByName('TabN').AsInteger);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiSortByIDClick(Sender: TObject);
begin
  if not popUpiSortByID.Checked then begin
    popUpiSortByID.Checked  := true;
    popUpiSortTabN.Checked  := false;
    popUpiSortFamIO.Checked := false;
    SetUpiOrder(dsrcUpi.DataSet.FieldByName('TabN').AsInteger);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.SetUpiOrder(nTabN : integer);
var nSvNR : integer;
begin
  nSvNr := 0;
  with (dsrcUpi.DataSet as TQuery) do begin
    if Active then
      nSvNr := FieldByName('NR').AsInteger;
    DisableControls;
    Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Upi ');
    if popUpiSortFamIO.Checked then begin
      LabelSort.Caption := 'Сортировано по Фамилии И.О.';
      SQL.Add(' order by Fam, Ima, Otch, TabN'); end
    else if popUpiSortByID.Checked then begin
      LabelSort.Caption := 'Сортировано по налоговому ИД';
      SQL.Add(' order by ID, TabN'); end
    else begin
      LabelSort.Caption := 'Сортировано по табельному номеру';
      SQL.Add(' order by TabN, Fam, Ima, Otch');
    end;
    Open;
    if nTabN <> 0 then
      Locate('TabN', nTabN, [])
    else if nSvNr <> 0 then
      Locate('NR', nSvNR, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.PageControl2Change(Sender: TObject);
begin
  SetPageControl2ActivePage;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.SetPageControl2ActivePage;
begin
  if PageControl2.ActivePage = tsPrmUv then begin
    qryPere.Close;
    qryDPere.Close;
    qryNadb.Close;
    qryUdrg.Close;
    qryTotsNU.Close;
    qryPrmUv.Open;
    qryPrmUv.Last; end
  else if PageControl2.ActivePage = tsPere then begin
    qryNadb.Close;
    qryUdrg.Close;
    qryTotsNU.Close;
    qryPrmUv.Close;
    qryPere.Open;
    qryPere.Last;
    qryDPere.Open; end
  else if PageControl2.ActivePage = tsNadb then begin
    qryUdrg.Close;
    qryTotsNU.Close;
    qryPrmUv.Close;
    qryPere.Close;
    qryDPere.Close;
    qryNadb.Open;
    qryNadb.Last; end
  else if PageControl2.ActivePage = tsUdrg then begin
    qryTotsNU.Close;
    qryPrmUv.Close;
    qryPere.Close;
    qryDPere.Close;
    qryNadb.Close;
    qryUdrg.Open;
    qryUdrg.Last; end
  else if PageControl2.ActivePage = tsTotsNu then begin
    qryPrmUv.Close;
    qryPere.Close;
    qryDPere.Close;
    qryNadb.Close;
    qryUdrg.Close;
    OpenQryTotsNU;
    qryTotsNU.Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryTotsNUCalcFields(DataSet: TDataSet);
var nY, nM, nD : word; nSmKVupl : double;
begin
  DecodeDate(qryTotsNUMyMG.AsDateTime, nY, nM, nD);
  qryTotsNUMesRus.AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  nSmKVupl := RoundTo(qryTotsNUSmNach.AsFloat - qryTotsNUSmUdrg.AsFloat -
                                                  qryTotsNUSmVupl.AsFloat, -2);
  if nSmKVupl <> 0 then
    qryTotsNUSmNaRuki.AsFloat := nSmKVupl;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.sBtnAddInSpsCurMesClick(Sender: TObject);
var cFamIO, cMsg, cShObj, cNmObj : string;
    i, nSvNR, nTabN, n_KdSps, nKdObj : integer;
    mObjList : TStringList;  dDtPriem, dDtUvoln : TDateTime;
    bSvActive : boolean;
begin
  cFamIO := MyFamIO(dsrcUpi.DataSet.FieldByName('Fam').AsString,
                               dsrcUpi.DataSet.FieldByName('Ima').AsString,
                                dsrcUpi.DataSet.FieldByName('Otch').AsString);
  nTabN  := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
  n_KdSps := gl_nKdSps;
  mObjList := TStringList.Create;
  if MyIsInSpsMes(dDtProc, nTabN, n_KdSps, mObjList) then begin
    cMsg := 'Сотрудник ' + cFamIO +
                  ' уже есть в списке текущего месяца в ';
    if mObjList.Count = 1 then
      cMsg := cMsg + 'подразделении ' + mObjList[0]
    else begin
      cMsg := cMsg + 'подразделениях: ' + #13#10;
      for i := 0 to mObjList.Count - 1 do begin
        cMsg := cMsg + mObjList[i] + #13#10;
      end;
    end;
    ShowMessage(cMsg); end
  else begin
    dDtPriem := 0;
    dDtUvoln := 0;
    nKdObj := 0;
    bSvActive := qryPrmUv.Active;
    if not bSvActive then
      qryPrmUv.Open;
    if qryPrmUv.RecordCount > 0 then with qryPrmUv do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        dDtPriem := FieldByName('Dt_Priem').AsDateTime;
        dDtUvoln := FieldByName('Dt_Uvoln').AsDateTime;
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    if not bSvActive then
      qryPrmUv.Close;
    bSvActive := qryPere.Active;
    if not bSvActive then
      qryPere.Open;
    if qryPere.RecordCount > 0 then with qryPere do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        if (FieldByName('Dt_Beg').AsDateTime <= dDtProc) or ((dDtPriem > 0) and
                       (FieldByName('Dt_Beg').AsDateTime = dDtPriem)) then begin
             // последнее для случая, когда только ввели и сразу подкл. в список
          nKdObj := FieldByName('KdObj').AsInteger;
          n_KdSps := FieldByName('KdSps').AsInteger; // переопределил по z_Pere
        end;
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    if not bSvActive then
      qryPere.Close;
    if DopDlg(cFamIO, dDtPriem, dDtUvoln, nTabN,
                               n_KdSps, nKdObj) {z_UDpDlg} then begin
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Insert into Z_Sps (KDSPS, DTPROC, TABN, KDOBJ, NOTES, ' +
                ' OldKdObj) ' +
                ' values (:nKdSps, :dDtProc, :nTabN, :nKdObj, :cNotes, ' +
                ' :nKdObj)');
        ParamByName('nKdSps').AsInteger := gl_nKdSps;
        ParamByName('dDtProc').AsDateTime := dDtProc;
        ParamByName('nTabN').AsInteger := nTabN;
        ParamByName('nKdObj').AsInteger := nKdObj;
        ParamByName('cNotes').AsString := 'из УПИ ' + DateToStr(Date);;
        ExecSQL;
        // На случай, если уже есть в Z_SPS с другим OldKdObj, исправить
        // везде OldKdObj на nKdObj
        SQL.Clear;
        SQL.Add('Update Z_SPS set OldKdObj = :nKdObj where TabN = :nTabN and ' +
                ' DtProc = :dDtProc');
        ParamByName('nTabN').AsInteger  := nTabN;
        ParamByName('nKdObj').AsInteger := nKdObj;
        ParamByName('dDtProc').AsDateTime := dDtProc;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      b_WasAddInSps := true;
      cShObj := DmMain.KdObj2ShObj(nKdObj, cNmObj);
      ShowMessage('Сотрудник ' + cFamIO + ' включен в список подразделения ' +
                                               IntToStr(nKdObj) + ' ' +cNmObj);
    end;
  end;
  mObjList.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrPrmUvDblClick(Sender: TObject);
var cLogMsg : string; nTabN : integer;
begin
  with dbgrPrmUv.DataSource.DataSet do begin
    if RecordCount <= 0 then Exit;
    Edit;
    FieldByName('KdSps').AsInteger := 0;
    if AddEdtPrmUv(dbgrUpi1.DataSource.DataSet.FieldByName('TabN').AsInteger,
                   dbgrUpi1.DataSource.DataSet.FieldByName('FamIO').AsString,
                                    dbgrPrmUv.DataSource) {Z_EPrmUv} then begin
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtPrm = ' + FieldByName('Dt_Priem').AsString +
                 ', DtUvln = ' + FieldByName('Dt_Uvoln').AsString;
      Post;
      DmMain.AddLog(Now, nTabN, 'Ред.пр./ув.(предпр)',
                                           gc_AppNmUsr, 'Z_PrmUv', cLogMsg);
      // WritePrmUvInUpi(FieldByName('TabN').AsInteger);
         end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrPereDblClick(Sender: TObject);
begin
  if dsrcPere.DataSet.RecordCount > 0 then
    EdtPere;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.EdtPere;
var cLogMsg : String; nTabN, nSpec_NR : integer; nSmCmbOkl : double;
  cOldKdSps, cOldDtBeg, cOldKdObj, cOldKdKatP, cOldNPD, cOldPrcWrkTime, cOldSO,
  cOldOklTrf, cOldAvans, cOldSpAv, cOldKdDolgn, cOldDolgnost, cOldKdSpZ,
  cOldPrPens, cOldSovm, cOldPdNlg, cOldProcLg, cOldKolMin, cOldPrfs, cOldNrPR,
     cOldDtPr, cOldNotes, cOldInv, cOldRang, cOldRazr, cOldCmbOkl : ShortString;
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
    cOldNPD        := FieldByName('NPD').AsString;
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
    Edit;
    if AddEdtPere(gl_nKdSps, nTabN,
                  dsrcUpi.DataSet.FieldByName('FamIO').AsString,
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
        cLogMsg := cLogMsg + ' КдДлжн ' + cOldKdDolgn + ' => ' +
                                        FieldByName('KdDolgn').AsString;
      if FieldByName('Dolgnost').AsString <> cOldDolgnost then
        cLogMsg := cLogMsg + ' Длжн ' + cOldDolgnost + ' => ' +
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
        {QrySpsRefresh(nTabN);} end
      else
        Cancel; end
    else
      Cancel;
  end;
end;
(*
var cLogMsg : string; nTabN : integer;
begin
  with dbgrPere.DataSource.DataSet do begin
    Edit;
    if AddEdtPere(nKdSps,
                   dbgrUpi1.DataSource.DataSet.FieldByName('TabN').AsInteger,
                   dbgrUpi1.DataSource.DataSet.FieldByName('FamIO').AsString,
                                    dsrcPere, dsrcDPere) {Z_EPere} then begin
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', OklTrf = ' + FieldByName('OklTrf').AsString;
      Post;
      DmMain.AddLog(Now, nTabN, 'Редакт.перемещений',
                                  gc_AppNmUsr, 'Z_Pere', cLogMsg); end
    else
      Cancel;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrNadbDblClick(Sender: TObject);
begin
  EdtNdb;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.EdtNdb;
var cMsg, cLogMsg : string;
    nTabN : integer;
    bUpdated : boolean;
    cOldVidN, cOldSpsRsch, cOldSumProc, cOldSP, cOldDtBeg, cOldDtEnd, cOldKdObj,
           cOldKdKatP, cOldKdSpZ, cOldNrPrBeg, cOldDtPrBeg, cOldNrPrEnd,
                                cOldDtPrEnd, cOldNotes, cOldPrcWT : ShortString;
begin
  nTabN   := 0;
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
      if TFormENadb.Run(nTabN, gl_nKdSps,
                     dbgrUpi2.DataSource.DataSet.FieldByName('FamIO').AsString,
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
        b_WasUpdated := true;
        if cLogMsg > '' then begin
          cLogMsg := 'ТабН = ' + FieldByName('TabN').AsString + ' ' + cLogMsg;
          DmMain.AddLog(Now, nTabN,
                            'Ред.надбавки', gc_AppNmUsr, 'Z_Nadb', cLogMsg); end
        else
          Cancel;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrUdrgDblClick(Sender: TObject);
var {cMsg,} cLogMsg : string; nTabN : integer;
begin
  with dbgrUdrg.DataSource.DataSet do begin
    // Вставить проверку на дату начала и Ку-Ка-Ре-Ку!!!
    Edit;

    // >> Z_EUdrg
    if TFormEAUdrg.AddEdtUdrg(
      dbgrUpi1.DataSource.DataSet.FieldByName('FamIO').AsString,
      dbgrUdrg.DataSource) then
    begin
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SP = ' + FieldByName('SP').AsString +
                 ', SmPrc = ' + FieldByName('SumVzn').AsString;
      Post;
      DmMain.AddLog(Now, nTabN, 'Редакт.удержаний',
                                         gc_AppNmUsr, 'Z_Uderg', cLogMsg);
    end else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrUpi1DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrUpi1.Canvas do begin
    if not (gdFocused in State) then begin
      if (dsrcUpi.DataSet.FieldByName('LastDtPrm').IsNull or
           (dsrcUpi.DataSet.FieldByName('LastDtPrm').AsDateTime > dDtEndMes) or
        (not dsrcUpi.DataSet.FieldByName('LastDtUvl').IsNull and
        (dsrcUpi.DataSet.FieldByName('LastDtUvl').AsDateTime < dDtBegMes))) then
        Font.Color := clTeal
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrUpi1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrUpi2DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrUpi2.Canvas do begin
    if not (gdFocused in State) then begin
      if (dsrcUpi.DataSet.FieldByName('LastDtPrm').IsNull or
            (dsrcUpi.DataSet.FieldByName('LastDtPrm').AsDateTime > dDtEndMes) or
         (not dsrcUpi.DataSet.FieldByName('LastDtUvl').IsNull and
        (dsrcUpi.DataSet.FieldByName('LastDtUvl').AsDateTime < dDtBegMes))) then
        Font.Color := clTeal
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrUpi2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuTotsByDtProcClick(Sender: TObject);
begin
  if not popMnuTotsByDtProc.Checked then begin
    popMnuTotsByDtProc.Checked := true;
    popMnuTotsByZaMesGod.Checked := false;
    OpenQryTotsNU;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuTotsByZaMesGodClick(Sender: TObject);
begin
  if not popMnuTotsByZaMesGod.Checked then begin
    popMnuTotsByZaMesGod.Checked := true;
    popMnuTotsByDtProc.Checked := false;
    OpenQryTotsNU;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.OpenQryTotsNU;
begin
  with qryTotsNU do begin
    Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if popMnuTotsByDtProc.Checked then begin
      //dbgrTotsNu.Color := clCream;
      if bFlagOpi then begin
        SQL.Add('Select TabN, KdSps, DtProc as MyMG, ' +
                ' SmNach, -SmUdrg as SmUdrg, Cast(NULL as Float) as SmVupl ' +
                ' from GetNu_Opi_Tots_DtProc (:TabN) ');
        SQL.Add('where ((SmNach <> 0) or (SmUdrg <> 0))'); end
      else begin
        SQL.Add('Select TabN, KdSps, DtProc as MyMG, ' +
                ' SmNach, -SmUdrg as SmUdrg, -SmVupl as SmVupl ' +
                ' from GetNu_Tots_DtProc (:TabN) ');
        SQL.Add('where (SmNach <> 0) or (SmUdrg <> 0) or (SmVupl <> 0)');
      end;
//      if nAppKdSpsUsr > 2 then
//        SQL.Add(' and (KdSps = :nKdSps) ');
// Нельзя ограничивать в этом месте - при подключении в список не видят "свежесть"
      SQL.Add('order by DtProc, KdSps');
      LabelTotsMsg.Caption := 'По месяцу начисления'; end
    else begin
      //dbgrTotsNu.Color := clMoneyGreen;
      SQL.Add('Select TabN, KdSps, ZaMesGod as MyMG, ' +
              ' SmNach, -SmUdrg as SmUdrg, Cast(NULL as Float) as SmVupl ' +
              ' from GetNu_Opi_Tots_ZaMesGod (:TabN)');
      SQL.Add('where ((SmNach <> 0) or (SmUdrg <> 0))');
      if gl_nAppKdSpsUsr > 2 then
        SQL.Add(' and (KdSps = :nKdSps) ');
      SQL.Add('order by ZaMesGod, KdSps');
      LabelTotsMsg.Caption := 'По месяцу "ЗаМесяцГод"';
    end;
    SetDbgrTotsNuColumns;
//    if nAppKdSpsUsr > 2 then
//      ParamByName('nKdSps').AsInteger := nAppKdSpsUsr;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.SetDbgrTotsNuColumns;
var i : word; cFldName : string;
begin
  for i := 0 to dbgrTotsNU.Columns.Count-1 do begin
    cFldName := UpperCase(dbgrTotsNU.Columns[i].FieldName);
    if cFldName = 'MYMG' then begin
      if popMnuTotsByDtProc.Checked then
        dbgrTotsNU.Columns[i].Title.Caption := 'В месяце'
      else
        dbgrTotsNU.Columns[i].Title.Caption := 'За месяц'; end
    else if cFldName = 'SMVUPL' then
      dbgrTotsNU.Columns[i].Visible := not bFlagOpi;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiNewPoiskClick(Sender: TObject);
begin
  if DMUsrSetts.NewEmplSrchDlg then
    CallNewEmplSrch
  else
    CallOldEmplSrch;
end;

//------------------------------------------------------------------------------
procedure TFormTUpi.CallOldEmplSrch;
var nTabN, nCase : integer;
begin
  if VvodFmTnForUpi(nTabN, nCase) {z_VvFmTn} then begin
    if nCase = 0 {по ТабН} then begin
      if nTabN > 0 then begin
        if not dsrcUPI.DataSet.Locate('TabN', nTabN, []) then
          ShowMessage('Поиск не удался  -  не найден' + #13#10 +
                    'табельный номер ' + IntToStr(nTabN));
      end; end
    else begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      dsrcUpi.DataSet.Locate('TabN', nTabN, []);
      Screen.Cursor := crDefault;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormTUpi.CallNewEmplSrch;
var
  nTabN: integer;
begin
  if TFrmSrchEmpl.SearchOnlyTabN(nTabN) {z_VvFmTn} then begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    dsrcUpi.DataSet.Locate('TabN', nTabN, []);
    Screen.Cursor := crDefault;
  end else
    ShowMessage('Табельный номер ' + IntToStr(nTabN) + ' не найден');
end;

//------------------------------------------------------------------------------
procedure TFormTUpi.FormKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где нужно, пользуйтесь контекстными меню')
  else if (Key = VK_F3) then
    popUpiNewPoisk.Click
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiCheckUvolnClick(Sender: TObject);
//var nSvNR, n, nDbg : integer; bUvolen, bTrueMetka : boolean;
//    dDtBeg, dDtEnd : TDateTime;
begin
(*
  ShowMessage('Не проверялась после перехода на cdsUpi. Пока выключена');
  Exit;
  if not cdsUpi.Active or (cdsUpi.RecordCount <= 0) then begin
    ShowMessage('Нечего помечать');
    Exit;
  end;
  if MessageDlg('Очень медленная операция!!!  Продолжать?:', mtWarning,
                  [mbYes, mbNo], 0) <> mrYes then
    Exit;
  dDtBeg := dDtProc;
  dDtEnd := dDtBeg + 28;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from RABOTAL (:nTabN, :dDtBeg, :dDtEnd)');
    Prepare;
  end;
  with cdsUpi do begin
    Screen.Cursor := crSQLWait;
    Application.ProcessMessages;
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    First;
    n := 0;
    nDbg := 0;
    while not Eof and (nDbg < 100) do begin
//      if bFlagDbg then
//        Inc(nDbg);
//      WritePrmUvInUpi(FieldByName('TabN').AsInteger);
      Inc(n);
{
      bUvolen := MyIsUvolen(FieldByName('TabN').AsInteger, dDtBeg, dDtEnd);
      bTrueMetka := (bUvolen and (FieldByName('PrUv').AsInteger = 1)) or
                    ( not bUvolen and
                        (FieldByName('PrUv').IsNull or
                         (FieldByName('PrUv').AsString = '')) );
      if not bTrueMetka then begin
        Inc(n);
        Edit;
        if bUvolen then
          FieldByName('PrUv').AsInteger := 1
        else
          FieldByName('PrUv').AsString := '';
        Post;
      end;
}
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
    Screen.Cursor := crDefault;
    if n > 0 then
      ShowMessage('Поправлено записей в UPI ' + IntToStr(n))
    else
      ShowMessage('Все записи в UPI соответствуют записям в PrmUv');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
    if Prepared then
      UnPrepare;
  end;
*)
end;
(*
//------------------------------------------------------------------------------
procedure TFormTUpi.WritePrmUvInUpi(nTabN : integer);
//var dDtPrm, dDtUvl : TDateTime; nMyPrUv : SmallInt;
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
  end;
  if (dDtPrm = 0) or (dDtPrm > dDtEndMes) or ((dDtUvl <> 0) and
                                              (dDtUvl < dDtBegMes)) then
    nMyPrUv := 1
  else
    nMyPrUv := 0;
  if nMyPrUv <> cdsUpiMyPrUv.AsInteger then begin
    bPrUvEdit := true;
    cdsUpi.Edit;
    cdsUpiMyPrUv.AsInteger := nMyPrUv;
    cdsUpi.Post;
    bPrUvEdit := false;
  end;
end;
*)
(*
//------------------------------------------------------------------------------
function TFormTUpi.MyIsUvolen(nTabN : integer;
                                     dDtBeg, dDtEnd : TDateTime) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    Result := RecordCount = 0;
    Close;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuShwDetailsClick(Sender: TObject);
begin
  popMnuShwDetails.Checked := not popMnuShwDetails.Checked;
  SetDetMode;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.SetDetMode;
begin
  if popMnuShwDetails.Checked then begin
    OpenQryNuDet;
    dbgrNuDet.Height := nDbgrNuDetHeight;
    dbgrNuDet.Visible := true;
    Splitter2.Visible := true; end
  else begin
    nDbgrNuDetHeight := dbgrNuDet.Height;
    with qryNuDet do begin
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    Splitter2.Visible := false;
    dbgrNuDet.Visible := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrTotsNUDblClick(Sender: TObject);
begin
  if (gl_nAppKdSpsUsr <= 2) then begin
    popMnuShwDetails.Checked := not popMnuShwDetails.Checked;
    SetDetMode;
  end;  
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.OpenQryNuDet;
begin
  with qryNuDet do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcTotsNU;
    SQL.Add('Select * from ViNu_Main where DtProc = :MyMG and ' +
              ' TabN = :TabN and VidN < "8000" ');
    if popMnuSposobVubDetByCurSps.Checked then
      SQL.Add(' and KdSps = :nKdSps');
    if popMnuSortNuDetByVidN.Checked then
      SQL.Add(' order by VidN, ZaMesGod ')
    else
      SQL.Add(' order by ZaMesGod, VidN ');
    if popMnuSposobVubDetByCurSps.Checked then
      ParamByName('nKdSps').AsInteger := qryTotsNuKdSps.AsInteger;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuSortNuDetByVidNClick(Sender: TObject);
begin
  if not popMnuSortNuDetByVidN.Checked then begin
    popMnuSortNuDetByZaMG.Checked := false;
    popMnuSortNuDetByVidN.Checked := true;
    OpenQryNuDet;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuSortNuDetByZaMGClick(Sender: TObject);
begin
  if not popMnuSortNuDetByZaMG.Checked then begin
    popMnuSortNuDetByZaMG.Checked := true;
    popMnuSortNuDetByVidN.Checked := false;
    OpenQryNuDet;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dsrcUpiDataChange(Sender: TObject; Field: TField);
var cMsg : ShortString;
begin
  cMsg := '';
  if dsrcUpi.State = dsBrowse then begin
    cMsg := 'ТабНр ' + dsrcUpi.DataSet.FieldByName('TabN').AsString + ',   Ид ';
    if dsrcUpi.DataSet.FieldByName('ID').IsNull or
            (dsrcUpi.DataSet.FieldByName('ID').AsString = '') then
      cMsg := cMsg + 'ОТСУТСТВУЕТ'
    else
      cMsg := cMsg + dsrcUpi.DataSet.FieldByName('ID').AsString;
    cMsg := cMsg + ',    ' + dsrcUpi.DataSet.FieldByName('Fam').AsString + ' ' +
                             dsrcUpi.DataSet.FieldByName('Ima').AsString + ' ' +
                             dsrcUpi.DataSet.FieldByName('Otch').AsString;
    PanelID.Caption := cMsg;
    if qryPrmUv.Active then
      qryPrmUv.Last
    else if qryPere.Active then
      qryPere.Last
    else if qryNadb.Active then
      qryNadb.Last
    else if qryUdrg.Active then
      qryUdrg.Last
    else if qryTotsNU.Active then
      qryTotsNU.Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryPereCalcFields(DataSet: TDataSet);
var cDummy, cShKatP : string;
begin
  qryPereShSovm.AsString := DmMain.KdSovm2ShSovm(qryPereSovm.AsInteger);
  qryPereShSO.AsString := DmMain.KdSo2ShSo(qryPereSO.AsInteger);
  qryPereShPdNlg.AsString := DmMain.KdShPdn2ShShPdn(qryPerePdNlg.AsInteger);
  qryPereShObj.AsString := DmMain.KdObj2ShObj(qryPereKdObj.AsInteger, cDummy);
  cDummy := DmMain.KdKatP2NmKatP(qryPereKdKatP.AsInteger, cShKatP);
  qryPereShKatP.AsString := cShKatP;
  qryPereSpz.AsString := DmMain.KdSbu2SchBU(qryPereKdSpZ.AsInteger);
  if (qryPereCmbOkl.AsString = '1') and (qryPereSpec_NR.AsInteger > 0) then
    qryPereSmCmbOkl.AsFloat := DmMain.mySmCmbOkl(qryPereSpec_NR.AsInteger)
  else
    qryPereSmCmbOkl.AsFloat := qryPereOklTrf.AsFloat;
  qryPereShSps.AsString := Form_Dm.KdSps2ShSps(qryPereKdSps.AsInteger);  
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryNadbCalcFields(DataSet: TDataSet);
var cDummy, cShKatP : string;
begin
  cDummy := DmMain.KdKatP2NmKatP(qryNadbKdKatP.AsInteger, cShKatP);
  qryNadbNmKatP.AsString := cShKatP;
  qryNadbShVidN.AsString := DmMain.VidN2ShVidN(qryNadbVidN.AsString, cDummy);
  qryNadbShObj.AsString := DmMain.KdObj2ShObj(qryNadbKdObj.AsInteger, cDummy);
  qryNadbSpz.AsString := DmMain.KdSbu2SchBU(qryNadbKdSpZ.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryUdrgCalcFields(DataSet: TDataSet);
var cDummy{, cShKatP} : string;
begin
  qryUdrgShVidN.AsString := DmMain.VidN2ShVidN(qryUdrgVidN.AsString, cDummy);
  qryUdrgSpz.AsString := DmMain.KdSbu2SchBU(qryUdrgKdSpZ.AsInteger);
  if not DmMain.qryPst.Active then DmMain.qryPst.Open;
  if (not qryUdrgKdPst.IsNull) and
        (DmMain.qryPst.Locate('KdPst', qryUdrgKdPst.AsInteger, [])) then begin
    qryUdrgShPst.AsString := DmMain.qryPstShPst.AsString;
    qryUdrgNmPst.AsString := DmMain.qryPstNmPst.AsString;
  end;
  if (qryUdrgSpsRsch.AsInteger = 1) or (qryUdrgSpsRsch.AsInteger = 3) then
    qryUdrgS_P.AsString := '%'
  else
    qryUdrgS_P.AsString := 'р';
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryPrmUvAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryPrmUv do begin
    if not FieldByName('NR').IsNull then
      nSvNR := FieldByName('NR').AsInteger;
    ApplyUpdates;
    Close;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, [])
    else
      Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryPrmUvAfterDelete(DataSet: TDataSet);
begin
  qryPrmUv.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryPereAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryPere do begin
    if not FieldByName('NR').IsNull then
      nSvNR := FieldByName('NR').AsInteger;
    ApplyUpdates;
    Close;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, [])
    else
      Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryPereAfterDelete(DataSet: TDataSet);
begin
  qryPere.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryNadbAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryNadb do begin
    if not FieldByName('NR').IsNull then
      nSvNR := FieldByName('NR').AsInteger;
    ApplyUpdates;
    Close;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, [])
    else
      Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryNadbAfterDelete(DataSet: TDataSet);
begin
  qryNadb.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryUdrgAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryUdrg do begin
    if not FieldByName('NR').IsNull then
      nSvNR := FieldByName('NR').AsInteger;
    ApplyUpdates;
    Close;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, [])
    else
      Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryUdrgAfterDelete(DataSet: TDataSet);
begin
  qryUdrg.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryPereBeforeInsert(DataSet: TDataSet);
begin
  with qryPere do begin
    if RecordCount > 0 then begin
      cSvObj        := FieldByName('KdObj').AsString;
      cSvKdKatP     := FieldByName('KdKatP').AsString;
      cSvSO         := FieldByName('SO').AsString;
      cSvOklTrf     := FieldByName('OklTrf').AsString;
      cSvAvans      := FieldByName('Avans').AsString;
      cSvPrcWrkTime := FieldByName('PrcWrkTime').AsString;
      cSvProcLG     := FieldByName('ProcLG').AsString;
      cSvSpAv       := FieldByName('Sp_Av').AsString;
      cSvDolgnost   := FieldByName('Dolgnost').AsString;
      cSvKdSpz      := FieldByName('KdSPZ').AsString;
      cSvPrPens     := FieldByName('Pr_Pens').AsString;
      cSvSovm       := FieldByName('Sovm').AsString;
      cSvPdNlg      := FieldByName('PdNlg').AsString;
      cSvKolMin     := FieldByName('KolMin').AsString;
      cSvPrfs       := FieldByName('Prfs').AsString;
      cSvNrPrikaza  := FieldByName('Nr_Prikaza').AsString;
      cSvDtPrikaza  := FieldByName('Dt_Prikaza').AsString;
      cSvNotes      := FieldByName('Notes').AsString;
      cSvInv        := FieldByName('Inv').AsString;
      cSvRang       := FieldByName('Rang').AsString;
      cSvRazr       := FieldByName('Razr').AsString; end
    else begin
      cSvObj        := '';
      cSvKdKatP     := '';
      cSvSO         := '';
      cSvOklTrf     := '';
      cSvAvans      := '';
      cSvPrcWrkTime := '';
      cSvProcLG     := '';
      cSvSpAv       := '';
      cSvDolgnost   := '';
      cSvKdSpz      := '';
      cSvPrPens     := '';
      cSvSovm       := '';
      cSvPdNlg      := '';
      cSvKolMin     := '';
      cSvPrfs       := '';
      cSvNrPrikaza  := '';
      cSvDtPrikaza  := '';
      cSvNotes      := '';
      cSvInv        := '';
      cSvRang       := '';
      cSvRazr       := '';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryPereNewRecord(DataSet: TDataSet);
begin
  with qryPere do begin
    FieldByName('TabN').AsInteger :=
                  DataSource.DataSet.FieldByName('TabN').AsInteger;
    FieldByName('Dt_Beg').AsDateTime   := SysUtils.Date;
    FieldByName('KdObj').AsString      := cSvObj;
    FieldByName('KdKatP').AsString     := cSvKdKatP;
    FieldByName('SO').AsString         := cSvSO;
    FieldByName('OklTrf').AsString     := cSvOklTrf;
    FieldByName('Avans').AsString      := cSvAvans;
    if cSvPrcWrkTime = '' then
      cSvPrcWrkTime := '100';
    FieldByName('PrcWrkTime').AsString := cSvPrcWrkTime;
    FieldByName('ProcLG').AsString     := cSvProcLG;
    FieldByName('Sp_Av').AsString      := cSvSpAv;
    FieldByName('Dolgnost').AsString   := cSvDolgnost;
    FieldByName('KdSPZ').AsString      := cSvKdSpz;
    if FieldByName('KdSpZ').IsNull or (FieldByName('KdSpZ').AsString = '') then
      FieldByName('KdSpZ').AsInteger :=
                            DmMain.GetPdrKdSpZ(FieldByName('KdObj').AsInteger);
    FieldByName('Pr_Pens').AsString    := cSvPrPens;
    FieldByName('Sovm').AsString       := cSvSovm;
    FieldByName('PdNlg').AsString      := cSvPdNlg;
    FieldByName('KolMin').AsString     := cSvKolMin;
    FieldByName('Prfs').AsString       := cSvPrfs;
    FieldByName('Nr_Prikaza').AsString := cSvNrPrikaza;
    FieldByName('Dt_Prikaza').AsString := cSvDtPrikaza;
    FieldByName('Notes').AsString      := cSvNotes;
    FieldByName('Inv').AsString        := cSvInv;
    FieldByName('Rang').AsString       := cSvRang;
    FieldByName('Razr').AsString       := cSvRazr;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrNadbDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var bBoevaja : boolean;
begin
  // Выделить цветом "боевые" надбавки (которые каким-либо
  // краем перекрывают текущий месяц)
  // Есть dDtBegMes (всегда 1-е число для системной даты и
  //      dDtEndMes (последнее число месяца системной даты)
  bBoevaja := false;
  if (qryNadbDt_Beg.AsDateTime < dDtEndMes) then begin
    if qryNadbDt_End.IsNull or (qryNadbDt_End.AsDateTime >= dDtBegMes) then
      bBoevaja := true;
  end;
  with dbgrNadb.Canvas do begin
    if not (gdFocused in State) then begin
      if bBoevaja then
        Font.Color := clMaroon
      else
        Font.Color := clGray;
    end;
  end;
  dbgrNadb.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrUdrgDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var bBoevaja : boolean;
begin
  // Выделить цветом "боевые" записи (которые каким-либо
  // краем перекрывают текущий месяц)
  // Есть dDtBegMes (всегда 1-е число для системной даты и
  //      dDtEndMes (последнее число месяца системной даты)
  bBoevaja := false;
  if (qryUdrgDt_Beg.AsDateTime < dDtEndMes) then begin
    if qryUdrgDt_End.IsNull or (qryUdrgDt_End.AsDateTime >= dDtBegMes) then
      bBoevaja := true;
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
procedure TFormTUpi.cdsUpiAfterDelete(DataSet: TDataSet);
begin
//  cdsUpi.ApplyUpdates(-1); Выключено - из БД удалит qyTmp
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.cdsUpiAfterPost(DataSet: TDataSet);
//var nSvTabN : integer;
begin
(*
  with cdsUpi do begin
    if ChangeCount > 0 then begin
      ApplyUpdates(-1);
      nSvTabN := FieldByName('TabN').AsInteger;
      Close;
      Open;
      if nSvTabN > 0 then
        Locate('TabN', nSvTabN, []);
    end;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.cdsUpiCalcFields(DataSet: TDataSet);
begin
(*
  if not cdsUpiFam.IsNull then
    cdsUpiFamIO.AsString := MyFamIO(cdsUpiFam.AsString, cdsUpiIma.AsString,
                                                        cdsUpiOtch.AsString);
*)
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiPrtSpovClick(Sender: TObject);
var nTabN : integer;
begin   {для СПОВ (ИНДАНИ)}
  if dsrcUpi.DataSet.Active and (dsrcUpi.DataSet.RecordCount > 0) then
    nTabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  Spr_Spov2(nTabN); {z_SSpov2}
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiPrtKredClick(Sender: TObject);
var nTabN : integer;
begin   {справка "для кредитов"}
  if dsrcUpi.DataSet.Active and (dsrcUpi.DataSet.RecordCount > 0) then
    nTabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  TFormDlgSDhd.DlgSprDhd(nTabN, 'SprKred'); {z_DlSDhd}
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiPrtSubsClick(Sender: TObject);
var nTabN : integer;
begin   {справка "для субсидий"}
  if dsrcUpi.DataSet.Active and (dsrcUpi.DataSet.RecordCount > 0) then
    nTabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  TFormDlgSDhd.DlgSprDhd(nTabN, 'SprSubs'); {z_DlSDhd}
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiPrtSprDhdClick(Sender: TObject);
var nTabN : integer;
begin  {справка о доходах (с подоходным)}
  if dsrcUpi.DataSet.Active and (dsrcUpi.DataSet.RecordCount > 0) then
    nTabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  TFormDlgSDhd.DlgSprForNlg(nTabN, 'SprDhd'); {z_DlSDhd}
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiPrtSprNlgClick(Sender: TObject);
var nTabN : integer;
begin  {справка в налоговую инсп. Форма №2}
  if dsrcUpi.DataSet.Active and (dsrcUpi.DataSet.RecordCount > 0) then
    nTabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger
  else
    nTabN := 0;
  TFormDlgSDhd.DlgSprForNlg(nTabN, 'SprNlgInsp'); {z_DlSDhd}
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiArhivkaClick(Sender: TObject);
var
  TabN: Integer;
begin
  if dsrcUpi.DataSet.Active and (dsrcUpi.DataSet.RecordCount > 0) then
    TabN := dsrcUpi.DataSet.FieldByName('TabN').AsInteger
  else
    TabN := 0;

  TFormArhivka.Run(TabN); // z_SArhiv
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.sBtnToArcClick(Sender: TObject);
begin
  if MessageDlg('Пометить "В архив"?:', mtConfirmation,
                           [mbYes, mbNo], 0) = mrYes then with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update z_upi set PrArc = 1 where TabN = :nTabN');
    ParamByName('nTabN').AsInteger :=
                               dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.sBtnRefreshClick(Sender: TObject);
var nSvNR : integer;
begin
  with dsrcUpi.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    Close;
    Open;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.dbgrNuDetDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : ShortString;
begin
  with dbgrNuDet.Canvas do begin
    if not (gdFocused in State) then begin
      cVidN := qryNuDet.FieldByName('VidN').AsString;
      if cVidN = '2724' {в ДолгТМ} then
        Font.Color := clRed
      else if (cVidN > '7500') and (cVidN < '7600') {выплаты} then
        Font.Color := clBlue
      else if (cVidN > '6000') {удержания} then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrNuDet.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.TabCtrlAlfChange(Sender: TObject);
var cBukva : ShortString; nSvTabN : integer;
begin
  cBukva := TabCtrlAlf.Tabs.Strings[TabCtrlAlf.TabIndex];
  nSvTabN := DmMain.qryUpiTabN.AsInteger;
  if cBukva = '*' then begin
    DmMain.qryUpi.Filter := '';
    DmMain.qryUpi.Filtered := false;
    DmMain.qryUpi.Locate('TabN', nSvTabN, []); end
  else begin
    DmMain.qryUpi.Filter := 'Fam = ' + QuotedStr(cBukva + '*');
    DmMain.qryUpi.Filtered := true;
    DmMain.qryUpi.Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.FldKdKatPValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean; var cShKatP : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := DmMain.IsKdKatPInDic(StrToInt(cText), cShKatP);
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике категории персонала ' + cText)
    else
      ;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.FldSoValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := DmMain.IsOplInDic(StrToInt(cText));
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике системы оплаты ' + cText);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.FldSovmValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := DmMain.IsSovmInDic(StrToInt(cText));
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике вида совместительства ' + cText);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.FldPdNlgValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := DmMain.IsPdNlgInDic(StrToInt(cText));
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике схемы подоходного ' + cText);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.FldKdObjJValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean; cShObj : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    if (cText = '1000') or (cText = '2000') or
             (cText = '3000') or (cText = '4000') then
      Raise Exception.Create('Не допускается выбор подразделения ' + cText)
    else begin
      bIsInDic := DmMain.IsKdObjInDic(StrToInt(cText), cShObj);
      if not bIsInDic then
        Raise Exception.Create('Нет в справочнике подразделения ' + cText);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.FldVidNValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := DmMain.IsVidNInDic(cText);
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике вида ' + cText);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.SetTabsFont;
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
  dbgrUpi1.Font.Name   := cFontName;
  dbgrUpi2.Font.Name   := cFontName;
  dbgrPrmUv.Font.Name  := cFontName;
  dbgrPere.Font.Name   := cFontName;
  dbgrNadb.Font.Name   := cFontName;
  dbgrUdrg.Font.Name   := cFontName;
  dbgrTotsNu.Font.Name := cFontName;
  dbgrNuDet.Font.Name  := cFontName;

  dbgrUpi1.TitleFont.Name   := cFontName;
  dbgrUpi2.TitleFont.Name   := cFontName;
  dbgrPrmUv.TitleFont.Name  := cFontName;
  dbgrPere.TitleFont.Name   := cFontName;
  dbgrNadb.TitleFont.Name   := cFontName;
  dbgrUdrg.TitleFont.Name   := cFontName;
  dbgrTotsNu.TitleFont.Name := cFontName;
  dbgrNuDet.TitleFont.Name  := cFontName;

  dbgrUpi1.Font.Size   := nFontSize;
  dbgrUpi2.Font.Size   := nFontSize;
  dbgrPrmUv.Font.Size  := nFontSize;
  dbgrPere.Font.Size   := nFontSize;
  dbgrNadb.Font.Size   := nFontSize;
  dbgrUdrg.Font.Size   := nFontSize;
  dbgrTotsNu.Font.Size := nFontSize;
  dbgrNuDet.Font.Size  := nFontSize;

  dbgrUpi1.TitleFont.Size   := nFontSize;
  dbgrUpi2.TitleFont.Size   := nFontSize;
  dbgrPrmUv.TitleFont.Size  := nFontSize;
  dbgrPere.TitleFont.Size   := nFontSize;
  dbgrNadb.TitleFont.Size   := nFontSize;
  dbgrUdrg.TitleFont.Size   := nFontSize;
  dbgrTotsNu.TitleFont.Size := nFontSize;
  dbgrNuDet.TitleFont.Size  := nFontSize;

  dbgrUpi1.Font.Style   := mFontStyle;
  dbgrUpi2.Font.Style   := mFontStyle;
  dbgrPrmUv.Font.Style  := mFontStyle;
  dbgrPere.Font.Style   := mFontStyle;
  dbgrNadb.Font.Style   := mFontStyle;
  dbgrUdrg.Font.Style   := mFontStyle;
  dbgrTotsNu.Font.Style := mFontStyle;
  dbgrNuDet.Font.Style  := mFontStyle;

end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiSetFontClick(Sender: TObject);
begin
  with FormZpMain.FontDialog1 do begin
    Font := dbgrUpi2.Font;
    if Execute then begin
      cFontName := Font.Name;
      nFontSize := Font.Size;
      bFontItalic := (fsItalic in Font.Style);
      bFontBold := (fsBold in Font.Style);
      SetTabsFont;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popUpiSetFonClick(Sender: TObject);
begin
  with FormZpMain.ColorDialog1 do begin
    Color := mDbgrColor;
    if Execute then begin
      mDbgrColor := Color;
      SetTabsColor;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.SetTabsColor;
begin
  dbgrUpi1.Color   := mDbgrColor;
  dbgrUpi2.Color   := mDbgrColor;
  dbgrPrmUv.Color  := mDbgrColor;
  dbgrPere.Color   := mDbgrColor;
  dbgrNadb.Color   := mDbgrColor;
  dbgrUdrg.Color   := mDbgrColor;
  dbgrTotsNu.Color := mDbgrColor;
  dbgrNuDet.Color  := mDbgrColor;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuSposobVubDetByCurSpsClick(Sender: TObject);
begin
  if not popMnuSposobVubDetByCurSps.Checked then begin
    popMnuSposobVubDetByCurSps.Checked := true;
    popMnuSposobVubDetByAllSps.Checked := false;
    OpenQryNuDet;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.popMnuSposobVubDetByAllSpsClick(Sender: TObject);
begin
  if not popMnuSposobVubDetByAllSps.Checked then begin
    popMnuSposobVubDetByAllSps.Checked := true;
    popMnuSposobVubDetByCurSps.Checked := false;
    OpenQryNuDet;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryTotsNUAfterScroll(DataSet: TDataSet);
begin
  if dbgrNuDet.Visible then
    OpenQryNuDet;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.qryPereNPDValidate(Sender: TField);
var cText : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    if (cText <> '0') and (cText <> '1') then
      Raise Exception.Create('Поле может быть пустым ' +
                                        'либо иметь значения: 0 или 1');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTUpi.DateFieldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;

end.
