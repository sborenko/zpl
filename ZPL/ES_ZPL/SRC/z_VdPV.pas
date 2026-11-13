unit z_VdPV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, DBTables, Buttons, StdCtrls,
  Math, Menus, DBClient, Provider, ExtCtrls, ComCtrls, DBCtrls;

type
  string3 = string[3];
  String4 = string[4];
  TFormVdPV = class(TForm)
    qryVdPv: TQuery;
    dsrcVdPv: TDataSource;
    qryOtkl: TQuery;
    dsrcOtkl: TDataSource;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    popSep1: TMenuItem;
    popSort: TMenuItem;
    popSortByTabN: TMenuItem;
    popSortByFIO: TMenuItem;
    popGoSchet: TMenuItem;
    qryTmp: TQuery;
    cdsCtrl: TClientDataSet;
    cdsZaMG: TClientDataSet;
    cdsZaMGNR: TAutoIncField;
    cdsZaMGZaMesGod: TDateField;
    cdsZaMGMesGod: TStringField;
    cdsZaMGRusMG: TStringField;
    tbl_Otkl: TTable;
    tbl_OtklDTPROC: TDateTimeField;
    tbl_OtklZAMESGOD: TDateTimeField;
    tbl_OtklTABN: TIntegerField;
    tbl_OtklVIDN: TStringField;
    tbl_OtklCHAS: TFloatField;
    tbl_OtklSUMMA: TFloatField;
    tbl_OtklKDOBJ: TSmallintField;
    tbl_OtklKDKATP: TSmallintField;
    tbl_OtklDT_BEG: TDateTimeField;
    tbl_OtklDT_END: TDateTimeField;
    tbl_OtklPDN: TSmallintField;
    tbl_OtklKDSPZ: TSmallintField;
    tbl_OtklNOTES: TStringField;
    tbl_OtklMyZaMesGod: TStringField;
    tbl_OtklSPZ: TStringField;
    tbl_OtklShObj: TStringField;
    tbl_OtklShKatP: TStringField;
    tbl_OtklNR: TAutoIncField;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
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
    qryOtklSPECPS: TIntegerField;
    updOtkl: TUpdateSQL;
    qryOtklFamIO: TStringField;
    qryOtklMyZaMesGod: TStringField;
    qryOtklSchBU: TStringField;
    qryOtklShObj: TStringField;
    qryOtklShKatP: TStringField;
    PageControl: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrVdPV: TDBGrid;
    Splitter1: TSplitter;
    PanelTop1: TPanel;
    sBtnNewVed: TSpeedButton;
    sBtnNewWithHelp: TSpeedButton;
    sBtnEditing: TSpeedButton;
    bBtnCancel: TBitBtn;
    dbgr_Otkl: TDBGrid;
    PanelTop2: TPanel;
    dsrc_Otkl: TDataSource;
    sBtnGoBack: TSpeedButton;
    tbl_OtklFAMIO: TStringField;
    tbl_OtklShVidN: TStringField;
    sBtnVbSotr: TSpeedButton;
    LbxObj: TListBox;
    LbxTabN: TListBox;
    sBtnAddToOtkl: TSpeedButton;
    tbl_OtklAddedToOtkl: TBooleanField;
    LbxFilter: TListBox;
    popAddCmn: TMenuItem;
    popAddOtp: TMenuItem;
    popAddBln: TMenuItem;
    N1: TMenuItem;
    popFon: TMenuItem;
    popFont: TMenuItem;
    qryOtklShVidN: TStringField;
    qryOtklMYNOTES: TStringField;
    popVdPv: TPopupMenu;
    popVdPvHead: TMenuItem;
    popVdPvAddPaket: TMenuItem;
    popVdPvDelPaket: TMenuItem;
    updVdPv: TUpdateSQL;
    qryOtklFAM: TStringField;
    qryOtklIMA: TStringField;
    qryOtklOTCH: TStringField;
    qryOtklNDbe: TStringField;
    popVdPvSep2: TMenuItem;
    popVdPvFont: TMenuItem;
    popVdPvFon: TMenuItem;
    PanelTs1Right: TPanel;
    dbgrOtkl: TDBGrid;
    PanelSortInf: TPanel;
    cdsVed: TClientDataSet;
    ts3: TTabSheet;
    dbgrVed: TDBGrid;
    dsrcVed: TDataSource;
    cdsVedNR: TAutoIncField;
    cdsVedTabN: TIntegerField;
    cdsVedFamIO: TStringField;
    cdsVedSmNachTT: TFloatField;
    cdsVedSmUdrgTt: TFloatField;
    cdsVedSmNachVida: TFloatField;
    cdsVedSmUdrgVida: TFloatField;
    cdsVedSmVuplVida: TFloatField;
    cdsVedSmOper: TFloatField;
    cdsVedPDN: TSmallintField;
    cdsVedKdSpZ: TSmallintField;
    cdsVedSPZ: TStringField;
    cdsVedKdKatP: TSmallintField;
    cdsVedKdObj: TSmallintField;
    cdsVedNrVdPV: TIntegerField;
    cdsVeddtVdPV: TDateField;
    popPrt: TPopupMenu;
    N3: TMenuItem;
    popOneVed: TMenuItem;
    popByObj: TMenuItem;
    PanelTop3: TPanel;
    sBtnBack3: TSpeedButton;
    sBtnPrt3: TSpeedButton;
    sBtnApply3: TSpeedButton;
    cdsVedSmOstNaRuki: TFloatField;
    cdsVedSmVuplTt: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    qryTmp2: TQuery;
    sBtnGoSchet: TSpeedButton;
    qryOtklPBNK: TSmallintField;
    qryVdPvNR: TIntegerField;
    qryVdPvDTPROC: TDateTimeField;
    qryVdPvNRVDPV: TIntegerField;
    qryVdPvDTVDPV: TDateTimeField;
    qryVdPvKDUSR: TSmallintField;
    qryVdPvMYNOTES: TStringField;
    qryVdPvNmUsr: TStringField;
    qryVdPvPlusNrVdPV: TIntegerField;
    popVdPvAddPaketWithWiz: TMenuItem;
    qryVdPvVDVUPLNR: TIntegerField;
    PanelWait: TPanel;
    popVdPvShwMegVed: TMenuItem;
    ts4: TTabSheet;
    dbgrMegVed: TDBGrid;
    cdsMegVed: TClientDataSet;
    dsrcMegVed: TDataSource;
    cdsMegVedFAM: TStringField;
    cdsMegVedIMA: TStringField;
    cdsMegVedOTCH: TStringField;
    cdsMegVedNR: TIntegerField;
    cdsMegVedKDSPS: TSmallintField;
    cdsMegVedDTPROC: TDateTimeField;
    cdsMegVedZAMESGOD: TDateTimeField;
    cdsMegVedTABN: TIntegerField;
    cdsMegVedVIDN: TStringField;
    cdsMegVedSHVIDN: TStringField;
    cdsMegVedOLDKDVIDN: TSmallintField;
    cdsMegVedCHAS: TFloatField;
    cdsMegVedSUMMA: TFloatField;
    cdsMegVedKDOBJ: TSmallintField;
    cdsMegVedKDKATP: TSmallintField;
    cdsMegVedDT_BEG: TDateTimeField;
    cdsMegVedDT_END: TDateTimeField;
    cdsMegVedPDN: TSmallintField;
    cdsMegVedKDSPZ: TSmallintField;
    cdsMegVedSCHBU: TStringField;
    cdsMegVedPSCH: TStringField;
    cdsMegVedNOTES: TStringField;
    cdsMegVedPRR: TSmallintField;
    cdsMegVedPRPV: TSmallintField;
    cdsMegVedKTO: TSmallintField;
    cdsMegVedPRKR: TSmallintField;
    cdsMegVedSPEC_NR: TIntegerField;
    cdsMegVedDTVDPV: TDateTimeField;
    cdsMegVedNRVDPV: TIntegerField;
    cdsMegVedMYNOTES: TStringField;
    cdsMegVedSPECPS: TIntegerField;
    cdsMegVedPBNK: TSmallintField;
    cdsMegVedFamIO: TStringField;
    dspTmp: TDataSetProvider;
    sBtnPrt4: TSpeedButton;
    sBtnBack4: TSpeedButton;
    PanelMegVedInf: TPanel;
    Label3: TLabel;
    LabelSmTt: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabelSmBudg: TLabel;
    LabelSmBlnBudg: TLabel;
    LabelSmSpec: TLabel;
    LabelSmBlnSpec: TLabel;
    Bevel1: TBevel;
    popByObjVed: TMenuItem;
    popByObjRee: TMenuItem;
    popByObjZvit: TMenuItem;
    cdsPrt: TClientDataSet;
    qryVed: TQuery;
    updVed: TUpdateSQL;
    qryVedNR: TIntegerField;
    qryVedDTPROC: TDateTimeField;
    qryVedKDSPS: TSmallintField;
    qryVedTYPEVED: TStringField;
    qryVedVEDNR: TIntegerField;
    qryVedVEDDATE: TDateTimeField;
    qryVedNOTES: TStringField;
    qryVedPRPODKL: TSmallintField;
    qryVedBNKNRPRDF: TSmallintField;
    qryVedBNKDTPRDF: TDateTimeField;
    qryVedBNKNMPRDF: TStringField;
    qryVedKSSVEDNR: TSmallintField;
    qryVedKSSVEDDT: TDateTimeField;
    qryVedKSSVEDNM: TStringField;
    ts5_MegVed: TTabSheet;
    Panel1: TPanel;
    sBtnBack5: TSpeedButton;
    sBtnPrt5Mv: TSpeedButton;
    popVdPvAddMegVed: TMenuItem;
    Label4: TLabel;
    dbgrOtklMV: TDBGrid;
    qryOtklMYSMM801: TBCDField;
    qryOtklMYSMM811: TBCDField;
    Panel5_Right: TPanel;
    PanelMsgMegVed: TPanel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    popVdPvEdtMegVed: TMenuItem;
    popVdPvSep1: TMenuItem;
    popVdPvDelMegVed: TMenuItem;
    Label14: TLabel;
    Label15: TLabel;
    sBtnMsg5: TSpeedButton;
    popSortByVidN: TMenuItem;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    qryVdPvMyPole: TStringField;
    popCopyFlds: TMenuItem;
    popTotals: TMenuItem;
    cdsTotals: TClientDataSet;
    popTotalsByVidN: TMenuItem;
    popTotalsBySpZ: TMenuItem;
    popTotalsByObj: TMenuItem;
    popTotalsByKatP: TMenuItem;
    popSortByNR: TMenuItem;
    popTbl_Otkl: TPopupMenu;
    popTbl_OtklSort: TMenuItem;
    popTbl_OtklSortByNR: TMenuItem;
    popTbl_OtklSortByVidN: TMenuItem;
    popTbl_OtklSortByTabN: TMenuItem;
    popTbl_OtklSortByFIO: TMenuItem;
    LabelTblOtklSortInf: TLabel;
    popSortBySumma: TMenuItem;
    Edit5: TEdit;
    tbl_OtklKdTemu: TSmallintField;
    tbl_OtklNmTemu: TStringField;
    qryOtklKDTEMU: TSmallintField;
    qryOtklNMTEMU: TStringField;
    qryOtklDTSTORN: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnOpenVedClick(Sender: TObject);
    procedure popVdPvAddPaketClick(Sender: TObject);
    procedure dbgrVdPVDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryVdPvCalcFields(DataSet: TDataSet);
    procedure popVdPvAddPaketWithWizClick(Sender: TObject);
    procedure qryVdPvAfterScroll(DataSet: TDataSet);
    procedure tbl_OtklNewRecord(DataSet: TDataSet);
    procedure popPopup(Sender: TObject);
    procedure qryVdPvNewRecord(DataSet: TDataSet);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure dbgrOtklEditButtonClick(Sender: TObject);
    procedure popSortByTabNClick(Sender: TObject);
    procedure popSortByFIOClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure popGoSchetClick(Sender: TObject);
    procedure sBtnEditingClick(Sender: TObject);
    procedure dbgrOtklColExit(Sender: TObject);
    procedure dbgrOtklKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure tbl_OtklCalcFields(DataSet: TDataSet);
    procedure tbl_OtklZAMESGODSetText(Sender: TField; const Text: String);
    procedure tbl_OtklZAMESGODValidate(Sender: TField);
    procedure tbl_OtklBeforePost(DataSet: TDataSet);
    procedure tbl_OtklAfterPost(DataSet: TDataSet);
    procedure tbl_OtklTABNSetText(Sender: TField; const Text: String);
    procedure tbl_OtklVIDNSetText(Sender: TField; const Text: String);
    procedure tbl_OtklDT_BEGValidate(Sender: TField);
    procedure tbl_OtklDT_ENDValidate(Sender: TField);
    procedure qryOtklNewRecord(DataSet: TDataSet);
    procedure qryOtklBeforePost(DataSet: TDataSet);
    procedure qryOtklAfterPost(DataSet: TDataSet);
    procedure qryOtklZAMESGODValidate(Sender: TField);
    procedure qryOtklTABNSetText(Sender: TField; const Text: String);
    procedure qryOtklVIDNSetText(Sender: TField; const Text: String);
    procedure qryOtklDT_BEGValidate(Sender: TField);
    procedure qryOtklDT_ENDValidate(Sender: TField);
    procedure DateFieldGetText(Sender: TField; var Text: String;
                                                     DisplayText: Boolean);
    procedure sBtnGoBackClick(Sender: TObject);
    procedure qryOtklCalcFields(DataSet: TDataSet);
    procedure sBtnVbSotrClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnAddToOtklClick(Sender: TObject);
    procedure dbgr_OtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popAddCmnClick(Sender: TObject);
    procedure popAddOtpClick(Sender: TObject);
    procedure popAddBlnClick(Sender: TObject);
    procedure popFonClick(Sender: TObject);
    procedure popFontClick(Sender: TObject);
    procedure dbGridlEnter(Sender: TObject);
    procedure dbGridlExit(Sender: TObject);
    procedure qryOtklVIDNValidate(Sender: TField);
    procedure dsrcVdPvDataChange(Sender: TObject; Field: TField);
    procedure popVdPvDelPaketClick(Sender: TObject);
    procedure popVdPvPopup(Sender: TObject);
    procedure qryOtklAfterDelete(DataSet: TDataSet);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnBack3Click(Sender: TObject);
    procedure sBtnPrt3Click(Sender: TObject);
    procedure sBtnApply3Click(Sender: TObject);
    procedure cdsVedBeforePost(DataSet: TDataSet);
    procedure dbgrVedDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popVdPvShwMegVedClick(Sender: TObject);
    procedure sBtnBack4Click(Sender: TObject);
    procedure cdsMegVedCalcFields(DataSet: TDataSet);
    procedure ts4Resize(Sender: TObject);
    procedure sBtnPrt4Click(Sender: TObject);
    procedure popOneVedClick(Sender: TObject);
    procedure popByObjVedClick(Sender: TObject);
    procedure popByObjReeClick(Sender: TObject);
    procedure popByObjZvitClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sBtnBack5Click(Sender: TObject);
    procedure popVdPvAddMegVedClick(Sender: TObject);
    procedure PageControlResize(Sender: TObject);
    procedure dbgrOtklMVEditButtonClick(Sender: TObject);
    procedure qryOtklSUMMASetText(Sender: TField; const Text: String);
    procedure dbgrOtklMVDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popVdPvEdtMegVedClick(Sender: TObject);
    procedure popVdPvDelMegVedClick(Sender: TObject);
    procedure sBtnMsg5Click(Sender: TObject);
    procedure popSortByVidNClick(Sender: TObject);
    procedure dbgr_OtklEditButtonClick(Sender: TObject);
    procedure sBtnPrt5MvClick(Sender: TObject);
    procedure popCopyFldsClick(Sender: TObject);
    procedure popTotalsByVidNClick(Sender: TObject);
    procedure popSortByNRClick(Sender: TObject);
    procedure popTotalsBySpZClick(Sender: TObject);
    procedure popTotalsByObjClick(Sender: TObject);
    procedure popTotalsByKatPClick(Sender: TObject);
    procedure popTbl_OtklSortByFIOClick(Sender: TObject);
    procedure popTbl_OtklSortByTabNClick(Sender: TObject);
    procedure popTbl_OtklSortByVidNClick(Sender: TObject);
    procedure popTbl_OtklSortByNRClick(Sender: TObject);
    procedure dbgrMegVedDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FldKdObjValidate(Sender: TField);
    procedure FldKdKatPValidate(Sender: TField);
    procedure popSortBySummaClick(Sender: TObject);
    procedure qryOtklKDOBJValidate(Sender: TField);
    procedure qryOtklKDKATPValidate(Sender: TField);
    procedure qryOtklSchBUSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    n_NrVd, n_KdSps, n_KdUsr, nFormMainActiveTabN : integer;
    bReady, bInsert, bEdit, bNeedAddInSps, b_Updated : boolean;
    n_AddKdObj, n_AddKdKatP : integer;
    c_AddShObj, c_AddShKatP : string;
    //..............................................................
    // Значения запоминаемых ПредПолей
    dPredZaMesGod : TDateTime;
    cPredVidN : string4;
    cPredShVidN, cPredKdObj, cPredShObj,
     cPredKdKatP, cPredShKatP, cPredKdSpZ, cPredSchBU,
       cPredDtBeg, cPredDtEnd, cPredSumma, cPredChas, cPredNotes : ShortString;
    //cPredOtklVidN : string4;
    //cPredOtklTabN, cPredOtklZaMG, cPredOtklDtBeg, cPredOtklDtEnd,
    //cPredOtklChas, cPredOtklSumma, cPredOtklPdN, cPredOtklKdSpZ,
    //cPredOtklKdObj, cPredOtklKdKatP, cPredOtklNotes : ShortString;
    // Флажки, сигналящие о том, что их нужно вводить в новую запись
    bPredOtklVidN, bEmptyOtklVidN,
     bPereOtklObj, bPredOtklObj, bEmptyOtklObj,
      bPereOtklSpZ, bPredOtklSpZ, bEmptyOtklSpZ,
       bPredOtklZaMG, bCurOtklZaMG,
        bPeriodOtklDates, bPredOtklDates, bEmptyOtklDates,
         bCalcOtklChasu, bPredOtklChasu, bEmptyOtklChasu,
          bPredOtklSumma, bEmptyOtklSumma,
           bPredOtklNotes, bEmptyOtklNotes : boolean;
    //..............................................................
    nNewNrVedWithWiz : integer;  // Для случая нового пакета с помошником
    bVvodMegVed : boolean; // вводится не пакет отклонений,
                       // а "прямая" ведомость межВыплат с видом 7509 РасхОрдер
    mFonColor : TColor;
    cFontName : ShortString;
    nFontSize : SmallInt;
    bFontItalic, bFontBold : boolean;
    cCap1, cCap2, cCap3, cCap4 : ShortString;
    procedure CreOpenCdsZaMG(dDtProc : TDateTime);
    procedure SetDbgrOtklEditing;
    procedure SetTabsFont;
    procedure OpenQryVdPV(dDtProc : TDateTime);
    procedure OpenQryOtkl(dDtProc : TDateTime; nNrVd : integer);
    procedure SetTbl_OtklIndex;
    function NewVedNr : integer;
    function CheckTabNInSps(nTabN : integer) : boolean;
    procedure AddInSpsCurMes(nKdSps, nTabN, nKdObj, nKdKatP : integer);
    function NewOtklNR : LongInt;
    procedure CreOpenCdsVed;
    procedure DoSchet(nTabN : integer; cFamIO : ShortString);
    procedure AddInfInCdsVed(nCaseZd : word; dDtPrc, dDtVdPv : TDateTime;
                               nTabN, nNrVdPV : integer;
                                 nPdn, nKdSpZ, nKdKatP, nKdObj : SmallInt;
                                   cFamIO, cSPZ : ShortString; nSumma : double);
    procedure AddRecInVdPV(nNewVedNR, nKdUsr : Integer;
                               dDtPrc, dDtVdPV : TDateTime; bMegVed : boolean);
    procedure AddRecInOtkl(cVidN : string4;
                              dDtPrc, dZaMesGod, dDt_Beg, dDt_End : TDateTime;
             nKdSps, nNrVdPV, nTabN, nPdn, nKdTemu,
                                             nKdSpZ, nKdObj, nKdKatP : Integer;
                                       cNotes : String; nChas, nSumma : double);
    procedure ShwMegVed;
    procedure SetDbgrVedColumns(nCaseZd : word);
    procedure SetNuResult(nTabN : integer; dDtPrc :TDateTime);
    procedure SetPanel5RightVisible;
    procedure cdsTotalAddVidNInf(cVidN : string4;
                                        cShVidN : ShortString; nSumma : double);
    procedure cdsTotalAddSpzInf(nKdSpZ : SmallInt; cSPZ : ShortString;
                                                              nSumma : double);
    procedure cdsTotalAddObjInf(nKdObj : integer; cShObj : ShortString;
                                                              nSumma : double);
    procedure cdsTotalAddKatInf(nKdKatP : integer; cShKatP : ShortString;
                                                               nSumma : double);
  public
    { Public declarations }
    procedure CloseFormVvSotr(b_IsFormVbSotr: boolean);
  end;

procedure ShowVdPV(dDtProc : TDateTime; nKdSps, nKdUsr : integer);

const SECTION = 'z_VdPv';

var
  FormVdPV: TFormVdPV;
  bIsFormVbSotr : boolean;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main, {z_VdOtkl,} z_GtDInf, z_ZaMG,
     z_TVids, z_TObj, z_TUpi, z_GtPers, a_SBU, z_MgDpZd,
     Z_EBln, Z_EOtp, z_EOtkl, z_Rs5, z_EOtklT,
     z_VbKatP, z_VbSotr, z_DpInfK, z_CmnPrt, z_VdVTts;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowVdPV(dDtProc : TDateTime; nKdSps, nKdUsr : integer);
var nNrVd : integer;
begin
  FormVdPV := TFormVdPV.Create(Application);
  with FormVdPV do begin
    Caption := cCap1;
    bIsFormVbSotr := false;
    bReady   := false;
    d_DtProc := dDtProc;
    n_KdSps  := nKdSps;
    n_KdUsr  := nKdUsr;
    bVvodMegVed := false;
    CreOpenCdsZaMG(dDtProc);
    OpenQryVdPV(dDtProc);
    qryVdPV.Last;
    sBtnGoSchet.Enabled := (qryVdPv.RecordCount > 0) and
                             (qryVdPvKdUsr.AsInteger = n_KdUsr) and
                              (qryVdPvVdVuplNr.IsNull or
                                     (qryVdPvVdVuplNR.AsInteger = 0));

    cdsCtrl.CreateDataSet;
    cdsCtrl.Open;
    if qryVdPv.RecordCount > 0 then begin
      nNrVd := qryVdPvNrVdPv.AsInteger;
      OpenQryOtkl(dDtProc, nNrVd);
    end;
    SetTbl_OtklIndex;
    bReady := true;
    nFormMainActiveTabN := FormZpMain.qrySps.FieldByName('TabN').AsInteger;
    ShowModal;
    qryVdPv.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.CreOpenCdsZaMG(dDtProc : TDateTime);
var nY, nM, nD, i : word; cZaMG, cRusMG : string; dZaMG : TDateTime;
begin
  with cdsZaMG do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  DecodeDate(dDtProc, nY, nM, nD);
  i := 25;
  while i > 1 do begin  // продвинуться на 24 месяца назад,вычисляя nM и nY
    i := i - 1;
    nM := nM - 1;
    if nM = 0 then begin
      nM := 12;
      nY := nY - 1;
    end;
  end;
  i := 0;
  while i < 28 do begin   // и теперь на 28 месяцев вперед, заполняя cdsZaMG
    cZaMG := '';
    if nM < 10 then
      cZaMG := '0';
    cZaMG := cZaMG + IntToStr(nM) + '-' + IntToStr(nY);
    cRusMG := Copy(MesRus(nM), 1, 3) + ' ' + IntToStr(nY);
    dZaMG := EncodeDate(nY, nM, 1);
    cdsZaMG.AppendRecord([nil, dZaMG, cZaMG, cRusMG]);
    Inc(i);
    Inc(nM);
    if nM > 12 then begin
      nM := 1;
      nY := nY + 1;
    end;
  end;
  cdsZaMG.SaveToFile(cDirTemp + 'cdsZaMG.cds');
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.OpenQryVdPV(dDtProc : TDateTime);
begin
  with qryVdPv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_VdPv where DtProc = :dDtProc ' +
            '  order by NrVdPv desc ');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.OpenQryOtkl(dDtProc : TDateTime; nNrVd : integer);
begin
  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, ' +
            ' Cast(0 as Numeric(18,2)) as MySmm801, ' +
            ' Cast(0 as Numeric(18,2)) as MySmm811, ' +
            ' Cast(null as VarChar(7)) as MyZaMesGod, ' +
            'o.*  from ViOtklMain o ');
    SQL.Add(' Left outer join z_upi u on u.TabN = o.Tabn ');
    SQL.Add(' where (DtProc = :dDtProc) and ');
    if nNrVd = 0 then
      SQL.Add('(NrVdPv is Null)')
    else begin
      SQL.Add(' (NrVdPv = :nNrVd)');
      ParamByName('nNrVd').AsInteger := nNrVd;
    end;
    if popSortByTabN.Checked then
      SQL.Add(' order by o.TabN, o.VidN, o.NR ')
    else if popSortByVidN.Checked then
      SQL.Add(' order by VidN, TabN, o.NR ')
    else if popSortByFio.Checked then
      SQL.Add(' order by Fam, Ima, Otch, o.TabN, o.VidN, o.NR ')
    else if popSortByNR.Checked then
      SQL.Add(' order by o.NR ')
    else if popSortBySumma.Checked then
      SQL.Add(' order by o.Summa desc, o.TabN, o.VidN, o.NR ');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
    if popSortByTabN.Checked then
      PanelSortInf.Caption :=  '   Сортировано по табельному номеру'
    else if popSortByVidN.Checked then
      PanelSortInf.Caption :=  '   Сортировано по виду начисления'
    else if popSortByFio.Checked then
      PanelSortInf.Caption :=  '   Сортировано по фамилии'
    else
      PanelSortInf.Caption :=  '   Сортировано в порядке ввода';
    sBtnEditing.Down := false;
    sBtnEditing.Enabled := (qryVdPvKdUsr.AsInteger = n_KdUsr)  and
                              (qryVdPvVdVuplNr.IsNull or
                                     (qryVdPvVdVuplNR.AsInteger = 0));
    sBtnGoSchet.Enabled := (qryVdPv.RecordCount > 0) and
                             (qryVdPvKdUsr.AsInteger = n_KdUsr) and
                              (qryVdPvVdVuplNr.IsNull or
                                     (qryVdPvVdVuplNR.AsInteger = 0));
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.SetTbl_OtklIndex;
var nSvNR : integer;
begin
  LabelTblOtklSortInf.Caption :=  '';
  if not tbl_Otkl.Active then Exit;
  nSvNR := 0;
  with tbl_Otkl do begin
    if Active then
      nSvNR := tbl_OtklNR.AsInteger;
    if popTbl_OtklSortByTabN.Checked then begin
      IndexName := 'OnTabNVidN';
      LabelTblOtklSortInf.Caption :=  'Сортировано по табельному номеру'; end
    else if popTbl_OtklSortByVidN.Checked then begin
      IndexName := 'OnVidNTabN';
      LabelTblOtklSortInf.Caption :=  'Сортировано по виду начисления'; end
    else if popTbl_OtklSortByFio.Checked then begin
      IndexName :=  'OnFioVidN';
      LabelTblOtklSortInf.Caption :=  'Сортировано по фамилии'; end
    else begin
      IndexName :=  '';
      LabelTblOtklSortInf.Caption :=  'Сортировано в порядке ввода';
    end;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.FormCreate(Sender: TObject);
var nSortCase, nCaseObjKat, nCaseSpZ, nCaseDates, nCaseChasu : SmallInt;
begin
  cCap1 := 'Предварительный ввод отклонений потоком';
  cCap2 := 'Временная таблица для подключения к отклонениям';
  cCap3 := 'Временная таблица для ведомости межвыплат';
  cCap4 := 'Межведомость, созданная по записям текущего пакета отклонений';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 560);
    Width  := ReadInteger(SECTION, 'wW', 750);
    mFonColor := ReadInteger(SECTION, 'FonClr', clWindow);
    dbgrVdPv.Width := ReadInteger(SECTION, 'grVdPvW', 150);
    sBtnEditing.Down := ReadBool(SECTION, 'bEdTable', false);
    cFontName := ReadString(SECTION, 'c_FN', 'Arial');
    nFontSize := ReadInteger(SECTION, 'c_FS', 10);
    bFontBold := ReadBool(SECTION, 'b_FB', false);
    bFontItalic := ReadBool(SECTION, 'b_FI', false);
    nSortCase := ReadInteger(SECTION, 'nSrtCase', 3);
    sBtnMsg5.Down   := ReadBool(SECTION, 'bBtnMsg5', false);
    bPredOtklVidN   := ReadBool(SECTION, 'bPredVidN', true);
    bEmptyOtklVidN  := not bPredOtklVidN;
    nCaseObjKat := ReadInteger(SECTION, 'nCaseOK', 1);
    if nCaseObjKat = 1 then begin
      bPereOtklObj  := true;
      bPredOtklObj  := false;
      bEmptyOtklObj := false; end
    else if nCaseObjKat = 2 then begin
      bPereOtklObj  := false;
      bPredOtklObj  := true;
      bEmptyOtklObj := false; end
    else {if nCaseObjKat = 3 then} begin
      bPereOtklObj  := false;
      bPredOtklObj  := false;
      bEmptyOtklObj := true;
    end;
    nCaseSpZ := ReadInteger(SECTION, 'nCaseSpZ', 1);
    if nCaseSpZ = 1 then begin
      bPereOtklSpZ  := true;
      bPredOtklSpZ  := false;
      bEmptyOtklSpZ := false; end
    else if nCaseSpZ = 2 then begin
      bPereOtklSpZ  := false;
      bPredOtklSpZ  := true;
      bEmptyOtklSpZ := false; end
    else {if nCaseSpZ = 3 then} begin
      bPereOtklSpZ  := false;
      bPredOtklSpZ  := false;
      bEmptyOtklSpZ := true;
    end;
    bPredOtklZaMG   := ReadBool(SECTION, 'bPredZaMG',   true);
    bCurOtklZaMG    := not bPredOtklZaMG;
    nCaseDates      := ReadInteger(SECTION, 'nCaseDates', 1);
    if nCaseDates = 1 then begin
      bPeriodOtklDates := true;
      bPredOtklDates   := false;
      bEmptyOtklDates  := false; end
    else if nCaseDates = 2 then begin
      bPeriodOtklDates := false;
      bPredOtklDates   := true;
      bEmptyOtklDates  := false; end
    else {if nCaseDates = 3 then} begin
      bPeriodOtklDates := false;
      bPredOtklDates   := false;
      bEmptyOtklDates  := true;
    end;
    nCaseChasu := ReadInteger(SECTION, 'nCaseChasu', 1);
    if nCaseChasu = 1 then begin
      bCalcOtklChasu  := true;
      bPredOtklChasu  := false;
      bEmptyOtklChasu := false; end
    else if nCaseChasu = 2 then begin
      bCalcOtklChasu  := false;
      bPredOtklChasu  := true;
      bEmptyOtklChasu := false; end
    else {if nCaseChasu = 1 then} begin
      bCalcOtklChasu  := false;
      bPredOtklChasu  := false;
      bEmptyOtklChasu := true;
    end;
    bPredOtklSumma  := ReadBool(SECTION, 'bPredSmm',  false);
    bEmptyOtklSumma := not bPredOtklSumma;
    bPredOtklNotes  := ReadBool(SECTION, 'bPredNotes',  false);
    bEmptyOtklNotes  := not bPredOtklNotes;
    dPredZaMesGod := ReadDate(SECTION, 'dSvZaMG', 0);
    cPredVidN     := ReadString(SECTION, 'cSvVidN', '');
    cPredShVidN   := ReadString(SECTION, 'cSvShVidN', '');
    cPredKdObj    := ReadString(SECTION, 'cSvKdObj', '');
    cPredShObj    := ReadString(SECTION, 'cSvShObj', '');
    cPredKdKatP   := ReadString(SECTION, 'cSvKdKatP', '');
    cPredShKatP   := ReadString(SECTION, 'cSvShKatP', '');
    cPredKdSpZ    := ReadString(SECTION, 'cSvKdSpZ', '');
    cPredSchBU    := ReadString(SECTION, 'cSvSchBU', '');
    cPredDtBeg    := ReadString(SECTION, 'cSvDtBeg', '');
    cPredDtEnd    := ReadString(SECTION, 'cSvDtEnd', '');
    cPredSumma    := ReadString(SECTION, 'cSvSumma', '');
    cPredChas     := ReadString(SECTION, 'cSvChas', '');
    cPredNotes    := ReadString(SECTION, 'cSvNotes', '');
    Free;
  end;
  if nSortCase = 1 then begin
    popSortByFIO.Checked   := true;
    popSortByTabN.Checked  := false;
    popSortByVidN.Checked  := false;
    popSortByNR.Checked    := false;
    popSortBySumma.Checked := false; end
  else if nSortCase = 2 then begin
    popSortByFIO.Checked   := false;
    popSortByTabN.Checked  := true;
    popSortByVidN.Checked  := false;
    popSortByNR.Checked    := false;
    popSortBySumma.Checked := false; end
  else if nSortCase = 3 then begin
    popSortByFIO.Checked   := false;
    popSortByTabN.Checked  := false;
    popSortByVidN.Checked  := true;
    popSortByNR.Checked    := false;
    popSortBySumma.Checked := false; end
  else if nSortCase = 4 then begin
    popSortByFIO.Checked  := false;
    popSortByTabN.Checked := false;
    popSortByVidN.Checked := false;
    popSortByNR.Checked   := true;
    popSortBySumma.Checked := false; end
  else {if nSortCase = 5 then} begin
    popSortByFIO.Checked   := false;
    popSortByTabN.Checked  := false;
    popSortByVidN.Checked  := false;
    popSortByNR.Checked    := false;
    popSortBySumma.Checked := true;
  end;
  SetDbgrOtklEditing;
  SetTabsFont;
  if FileExists(cDirVids + 'Vd3Pv22.vid') then
    dbgrVdPV.Columns.LoadFromFile(cDirVids + 'Vd3Pv22.vid');
  if FileExists(cDirVids + 'Vd4Pv13.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'Vd4Pv13.vid');
  if FileExists(cDirVids + 'Vd3Pv13.vid') then
    dbgrVed.Columns.LoadFromFile(cDirVids + 'Vd3Pv13.vid');
  if FileExists(cDirVids + 'Vd3Pv14.vid') then
    dbgrMegVed.Columns.LoadFromFile(cDirVids + 'Vd3Pv14.vid');
  if FileExists(cDirVids + 'Vd3PV25.vid') then
    dbgrOtklMV.Columns.LoadFromFile(cDirVids + 'Vd3PV25.vid');
  dbgrOtkl.Color := mFonColor;
  dbgrVdPv.Color := mFonColor;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  ts3.TabVisible := false;
  ts4.TabVisible := false;
  ts5_MegVed.TabVisible := false;
  SetPanel5RightVisible;
  PageControl.ActivePage := ts1;
  Caption := cCap1;
  if not DmMain.InCtrlMes then begin
    sBtnNewVed.Enabled := false;
    sBtnNewWithHelp.Enabled := false;
    sBtnGoSchet.Enabled := false;
    sBtnEditing.Enabled := false;
    popVdPvAddPaket.Enabled := false;
    popVdPvAddPaketWithWiz.Enabled := false;
    popVdPvAddMegVed.Enabled := false;
    popVdPvEdtMegVed.Enabled := false;
    popVdPvDelMegVed.Enabled := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.SetTabsFont;
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
  dbgrVdPv.Font.Name  := cFontName;
  dbgrOtkl.Font.Name  := cFontName;
  dbgr_Otkl.Font.Name := cFontName;

  dbgrVdPv.TitleFont.Name  := cFontName;
  dbgrOtkl.TitleFont.Name  := cFontName;
  dbgr_Otkl.TitleFont.Name := cFontName;

  dbgrVdPv.Font.Size  := nFontSize;
  dbgrOtkl.Font.Size  := nFontSize;
  dbgr_Otkl.Font.Size := nFontSize;

  dbgrVdPv.TitleFont.Size  := nFontSize;
  dbgrOtkl.TitleFont.Size  := nFontSize;
  dbgr_Otkl.TitleFont.Size := nFontSize;

  dbgrVdPv.Font.Style  := mFontStyle;
  dbgrOtkl.Font.Style  := mFontStyle;
  dbgr_Otkl.Font.Style := mFontStyle;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if bIsFormVbSotr then
    FormVbSotr.Close;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVdPV.Columns.SaveToFile(cDirVids + 'Vd3Pv22.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'Vd4Pv13.vid');
  dbgrVed.Columns.SaveToFile(cDirVids + 'Vd3Pv13.vid');
  dbgrMegVed.Columns.SaveToFile(cDirVids + 'Vd3Pv14.vid');
  dbgrOtklMV.Columns.SaveToFile(cDirVids + 'Vd3PV25.vid');
  if {not bFlagDbg and} FileExists(cDirTemp + 'cdsZaMg.cds') then
    DeleteFile(cDirTemp + 'cdsZaMg.cds');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grVdPvW', dbgrVdPv.Width);
    WriteBool(SECTION, 'bEdTable', sBtnEditing.Down);
    WriteInteger(SECTION, 'FonClr', mFonColor);
    WriteString(SECTION, 'c_FN', cFontName);
    WriteInteger(SECTION, 'c_FS', nFontSize);
    WriteBool(SECTION, 'b_FB', bFontBold);
    WriteBool(SECTION, 'b_FI', bFontItalic);
    WriteBool(SECTION, 'bBtnMsg5', sBtnMsg5.Down);
    if popSortByFIO.Checked then
      WriteInteger(SECTION, 'nSrtCase', 1)
    else if popSortByTabN.Checked then
      WriteInteger(SECTION, 'nSrtCase', 2)
    else if popSortByFIO.Checked then
      WriteInteger(SECTION, 'nSrtCase', 3)
    else if popSortByNR.Checked then
      WriteInteger(SECTION, 'nSrtCase', 4)
    else {if popSortBySumma.Checked then}
      WriteInteger(SECTION, 'nSrtCase', 5);
    WriteBool(SECTION, 'bPredVidN', bPredOtklVidN);
    if bPereOtklObj then
      WriteInteger(SECTION, 'nCaseOK', 1)
    else if bPredOtklObj then
      WriteInteger(SECTION, 'nCaseOK', 2)
    else
      WriteInteger(SECTION, 'nCaseOK', 3);
    if bPereOtklSpZ then
      WriteInteger(SECTION, 'nCaseSpZ', 1)
    else if bPredOtklSpZ then
      WriteInteger(SECTION, 'nCaseSpZ', 2)
    else
      WriteInteger(SECTION, 'nCaseSpZ', 3);
    WriteBool(SECTION, 'bPredZaMG', bPredOtklZaMG);
    if bPeriodOtklDates then
      WriteInteger(SECTION, 'nCaseDates', 1)
    else if bPredOtklDates then
      WriteInteger(SECTION, 'nCaseDates', 2)
    else
      WriteInteger(SECTION, 'nCaseDates', 3);
    if bCalcOtklChasu then
      WriteInteger(SECTION, 'nCaseChasu', 1)
    else if bPredOtklChasu then
      WriteInteger(SECTION, 'nCaseChasu', 2)
    else
      WriteInteger(SECTION, 'nCaseChasu', 3);
    WriteBool(SECTION, 'bPredSmm', bPredOtklSumma);
    WriteBool(SECTION, 'bPredNotes', bPredOtklNotes);
    WriteDate(SECTION, 'dSvZaMG', dPredZaMesGod);
    WriteString(SECTION, 'cSvVidN', cPredVidN);
    WriteString(SECTION, 'cSvShVidN', cPredShVidN);
    WriteString(SECTION, 'cSvKdObj', cPredKdObj);
    WriteString(SECTION, 'cSvShObj', cPredShObj);
    WriteString(SECTION, 'cSvKdKatP', cPredKdKatP);
    WriteString(SECTION, 'cSvShKatP', cPredShKatP);
    WriteString(SECTION, 'cSvKdSpZ', cPredKdSpZ);
    WriteString(SECTION, 'cSvSchBU', cPredSchBU);
    WriteString(SECTION, 'cSvDtBeg', cPredDtBeg);
    WriteString(SECTION, 'cSvDtEnd', cPredDtEnd);
    WriteString(SECTION, 'cSvSumma', cPredSumma);
    WriteString(SECTION, 'cSvChas', cPredChas);
    WriteString(SECTION, 'cSvNotes', cPredNotes);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnOpenVedClick(Sender: TObject);
//var nNrVd : integer; dDtVd : TDateTime; bUpdated : boolean;
begin
(*
  bUpdated := false;
  nNrVd := qryVdPvNrVdPV.AsInteger;
  dDtVd := qryVdPvDtVdPV.AsDateTime;
  OpenVdOtkl(d_DtProc, dDtVd, n_KdSps, n_KdUsr, nNrVd, bUpdated);  {z_VdOtkl}
  if bUpdated then begin
    OpenQryVdPV(d_DtProc);
    qryVdPv.Locate('NrVdPv', nNrVd, []);
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popVdPvAddPaketClick(Sender: TObject);
var nNewVedNR : integer; bMegVed : boolean;
begin
  bMegVed := false;
  cPredVidN   := '';
  cPredShVidN := '';
  cPredNotes  := '';
  cPredDtBeg  := '';
  cPredDtEnd  := '';
  cPredSumma  := '';
  cPredKdSpZ  := '';
  nNewVedNr := NewVedNr;
  AddRecInVdPV(nNewVedNR, n_KdUsr, d_DtProc, Date, bMegVed);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.AddRecInVdPV(nNewVedNR, nKdUsr : Integer;
                               dDtPrc, dDtVdPV : TDateTime; bMegVed : boolean);
begin
  with qryVdPv do begin
    Append;
    qryVdPvDtProc.AsDateTime := dDtPrc;
    qryVdPvKdUsr.AsInteger   := nKdUsr;
    qryVdPvDtVdPv.AsDateTime := dDtVdPV;
    qryVdPvNrVdPv.AsInteger  := nNewVedNr;  // отрицательный
    if bMegVed then // сразу вбить в поле VdVuplNr тот же nNewVedNr. Отрицатель-
                  // ность и будет признаком того, что сие "прямая" МежВедомость
      qryVdPvVdVuplNr.AsInteger  := nNewVedNr;
    Post;
    ApplyUpdates;
    // тут же переоткрываю, иначе не ведомо значение NR:
    Close;
    Open;
    Locate('NrVdPv', nNewVedNr, []);
    if bMegVed then with qryTmp do begin
      if Active then Close;
      if Prepared then UnPrepare;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Insert into Z_VedNR (DtProc, KdSps, TypeVed, VedNr, VedDate, ' +
            ' PrPodkl, BnkNmPrdF, KssVedNr, KssVedDt, KssVedNm, Notes) values ' +
            ' (:dDtProc, :nKdSps, :cTypeVed, :nVedNR, :dVedDate, :nPrPodkl, ' +
            ' :cBnkNmPrdF, :nKssVedNr, :dKssVedDt, :cKssVedNm, :cNotes)');
      ParamByName('dDtProc').AsDateTime  := d_DtProc;
      ParamByName('nKdSps').AsInteger    := n_KdSps;
      ParamByName('cTypeVed').AsString   := 'Ved7509';
      ParamByName('nVedNR').AsInteger    := nNewVedNr;
      ParamByName('dVedDate').AsDateTime := dDtVdPV;
      ParamByName('nPrPodkl').AsInteger  := 6;
      ParamByName('cBnkNmPrdF').AsString := 'Прямая вид 7509 только на кассу';
      ParamByName('nKssVedNr').AsInteger := 0;
      ParamByName('dKssVedDt').AsDateTime := dDtVdPV;
      ParamByName('cKssVedNm').AsString := 'Введите назначение платежа';
      ParamByName('cNotes').AsString := 'ПВ';
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryVdPvNewRecord(DataSet: TDataSet);
begin
//  qryVdPvDtProc.AsDateTime := d_DtProc;
//  qryVdPvKdUsr.AsInteger   := n_KdUsr;
//  qryVdPvDtVdPv.AsDateTime := Date;
//  qryVdPvNrVdPv.AsInteger  := NewVedNr;
end;
//------------------------------------------------------------------------------
function TFormVdPV.NewVedNr : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from GetNewVdPV');
    Open;
    Result := FieldByName('NewVdPV').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgrVdPVDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrVdPv.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryVdPv.FieldByName('KdUsr').AsInteger = n_KdUsr) then begin
        if qryVdPv.FieldByName('VdVuplNr').IsNull or
                 (qryVdPv.FieldByName('VdVuplNr').AsInteger = 0) then
          Font.Color := clWindowText
        else
          Font.Color := clMaroon; end
      else if (qryVdPv.FieldByName('KdUsr').AsInteger = -1) then
        Font.Color := clMaroon
      else
        Font.Color := clGray;
      cFldNm := UpperCase(Column.FieldName);
      if (cFldNm = 'MYPOLE') then begin
        if (qryVdPvKdUsr.AsInteger = -1) then
          Brush.Color := mFonColor
        else if (qryVdPv.FieldByName('NrVdPv').AsInteger =
                      qryVdPv.FieldByName('VdVuplNR').AsInteger) then
          Brush.Color := clAqua
        else
          Brush.Color := clYellow;
      end;
    end;
  end;
  dbgrVdPv.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryVdPvCalcFields(DataSet: TDataSet);
var nKdKatUsr : integer; cNmUsr, cPswUsr, cVkl : string;
begin
  if (qryVdPvKdUsr.AsInteger = -1) then
    qryVdPvNmUsr.AsString := 'Без пакета'
  else if Form_Dm.GetUsrInfo(qryVdPvKdUsr.AsInteger, nKdKatUsr,
                                              cNmUsr, cPswUsr, cVkl) then
    qryVdPvNmUsr.AsString := cNmUsr;
  qryVdPvPlusNrVdPv.AsInteger := -qryVdPvNrVdPv.AsInteger;
  if (qryVdPv.FieldByName('NrVdPv').AsInteger =
                      qryVdPv.FieldByName('VdVuplNR').AsInteger) then
    // "прямая" выплата на кассу (вид 7509)
    qryVdPvMyPole.AsString := 'Вед'
  else if (qryVdPvKdUsr.AsInteger >= 0) then begin
    if qryVdPv.FieldByName('VdVuplNR').IsNull then
      // пакет, по которому не делалась МежВедомость (нет VdVuplNR)
      qryVdPvMyPole.AsString := 'Пкт'
    else if qryVdPv.FieldByName('VdVuplNR').AsInteger > 0 then
      // пакет, по которому делалась МежВедомость (есть плюсовой VdVuplNR)
      qryVdPvMyPole.AsString := 'ПкМВ';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryVdPvAfterScroll(DataSet: TDataSet);
var nNrVd : integer; dDtProc : TDateTime;
begin
  if bReady then begin
    dDtProc := qryVdPvDtProc.AsDateTime;
    nNrVd   := qryVdPvNrVdPv.AsInteger;
    OpenQryOtkl(dDtProc, nNrVd);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklNewRecord(DataSet: TDataSet);
begin
  if cPredVidN = '' then begin
    tbl_OtklZaMesGod.AsDateTime := d_DtProc;
    tbl_OtklDt_Beg.AsDateTime   := d_DtProc;
    tbl_OtklDt_End.AsDateTime   := myLastDOM(d_DtProc); end
  else begin
    tbl_OtklVidN.AsString       := cPredVidN;
    tbl_OtklZaMesGod.AsDateTime := dPredZaMesGod;
    tbl_OtklDt_Beg.AsString     := cPredDtBeg;
    tbl_OtklDt_End.AsString     := cPredDtEnd;
    tbl_OtklNotes.AsString      := cPredNotes;
    tbl_OtklKdSpZ.AsString      := cPredKdSpZ;
  end;
  tbl_OtklDtProc.AsDateTime := d_DtProc;
  tbl_OtklPdN.AsInteger     := 1;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.AddInSpsCurMes(nKdSps, nTabN, nKdObj, nKdKatP : integer);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_SPS (KdSps, DtProc, TabN, KdObj, KdKatP, Notes, ' +
            ' OldKdObj) values (:nKdSps, :dDtProc, :nTabN, :nKdObj, ' +
            ' :nKdKatP, :cNotes, :nKdObj)');
    ParamByName('nKdSps').AsInteger := nKdSps;
    ParamByName('dDtProc').AsDateTime := d_DtProc;
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('nKdObj').AsInteger   := nKdObj;
    ParamByName('nKdKatP').AsInteger  := nKdKatP;
    ParamByName('cNotes').AsString    := 'Вед. ' + IntToStr(n_NrVd);
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popPopup(Sender: TObject);
begin
  popAdd.Enabled := false;
  popEdt.Enabled := false;
  popDel.Enabled := false;
  popGoSchet.Enabled := false;
  if (qryVdPvKdUsr.AsInteger = n_KdUsr) and (qryVdPvVdVuplNr.IsNull or
                               (qryVdPvVdVuplNR.AsInteger = 0)) then begin
    popAdd.Enabled := qryOtkl.Active;
    popEdt.Enabled := qryOtkl.Active and (qryOtkl.RecordCount > 0);
    popDel.Enabled := popEdt.Enabled;
    popGoSchet.Enabled := popEdt.Enabled;
  end;
  if pop.PopupComponent = dbgrOtkl then begin
    popTotals.Visible := true;
    popCopyFlds.Visible := true; end
  else begin  // poka
    popTotals.Visible := false;
    popCopyFlds.Visible := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popCopyFldsClick(Sender: TObject);

begin
  if SetOtklEnv(bPredOtklVidN, bEmptyOtklVidN,
                 bPereOtklObj, bPredOtklObj, bEmptyOtklObj,
                  bPereOtklSpZ, bPredOtklSpZ, bEmptyOtklSpZ,
                   bPredOtklZaMG, bCurOtklZaMG,
                    bPeriodOtklDates, bPredOtklDates, bEmptyOtklDates,
                     bCalcOtklChasu, bPredOtklChasu, bEmptyOtklChasu,
                      bPredOtklSumma, bEmptyOtklSumma,
                       bPredOtklNotes, bEmptyOtklNotes) {z_EOtklT} then begin
  end;
end;
//------------------------------------------------------------------------------
function TFormVdPV.CheckTabNInSps(nTabN : integer) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Z_SPS ' +
              ' where (DtProc = :dDtProc) and (TabN = :nTabN)');
    ParamByName('dDtProc').AsDateTime := d_DtProc;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Result := RecordCount > 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.DateFieldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popSortByTabNClick(Sender: TObject);
var dDtPrc : TDateTime; nNrVd, nSvNR : integer;
begin
  if not popSortByTabN.Checked then begin
    popSortByTabN.Checked  := true;
    popSortByVidN.Checked  := false;
    popSortByFIO.Checked   := false;
    popSortByNR.Checked    := false;
    popSortBySumma.Checked := false;
    if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
      nSvNR := qryOtklNR.AsInteger
    else
      nSvNR := 0;
    if qryVdPv.RecordCount > 0 then begin
      dDtPrc := qryVdPvDtProc.AsDateTime;
      nNrVd  := qryVdPvNrVdPv.AsInteger;
      OpenQryOtkl(dDtPrc, nNrVd);
      if nSvNR <> 0 then
        qryOtkl.Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popSortByVidNClick(Sender: TObject);
var dDtPrc : TDateTime; nNrVd, nSvNR : integer;
begin
  if not popSortByVidN.Checked then begin
    popSortByTabN.Checked  := false;
    popSortByVidN.Checked  := true;
    popSortByFIO.Checked   := false;
    popSortByNR.Checked    := false;
    popSortBySumma.Checked := false;
    if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
      nSvNR := qryOtklNR.AsInteger
    else
      nSvNR := 0;
    if qryVdPv.RecordCount > 0 then begin
      dDtPrc := qryVdPvDtProc.AsDateTime;
      nNrVd  := qryVdPvNrVdPv.AsInteger;
      OpenQryOtkl(dDtPrc, nNrVd);
      if nSvNR <> 0 then
        qryOtkl.Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popSortByFIOClick(Sender: TObject);
var dDtPrc : TDateTime; nNrVd, nSvNR : integer;
begin
  if not popSortByFIO.Checked then begin
    popSortByTabN.Checked  := false;
    popSortByVidN.Checked  := false;
    popSortByFIO.Checked   := true;
    popSortByNR.Checked    := false;
    popSortBySumma.Checked := false;
    if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
      nSvNR := qryOtklNR.AsInteger
    else
      nSvNR := 0;
    if qryVdPv.RecordCount > 0 then begin
      dDtPrc := qryVdPvDtProc.AsDateTime;
      nNrVd  := qryVdPvNrVdPv.AsInteger;
      OpenQryOtkl(dDtPrc, nNrVd);
      if nSvNR <> 0 then
        qryOtkl.Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popSortByNRClick(Sender: TObject);
var dDtPrc : TDateTime; nNrVd, nSvNR : integer;
begin
  if not popSortByNR.Checked then begin
    popSortByTabN.Checked  := false;
    popSortByVidN.Checked  := false;
    popSortByFIO.Checked   := false;
    popSortByNR.Checked    := true;
    popSortBySumma.Checked := false;
    if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
      nSvNR := qryOtklNR.AsInteger
    else
      nSvNR := 0;
    if qryVdPv.RecordCount > 0 then begin
      dDtPrc := qryVdPvDtProc.AsDateTime;
      nNrVd  := qryVdPvNrVdPv.AsInteger;
      OpenQryOtkl(dDtPrc, nNrVd);
      if nSvNR <> 0 then
        qryOtkl.Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popSortBySummaClick(Sender: TObject);
var dDtPrc : TDateTime; nNrVd, nSvNR : integer;
begin
  if not popSortBySumma.Checked then begin
    popSortByTabN.Checked  := false;
    popSortByVidN.Checked  := false;
    popSortByFIO.Checked   := false;
    popSortByNR.Checked    := false;
    popSortBySumma.Checked := true;
    if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
      nSvNR := qryOtklNR.AsInteger
    else
      nSvNR := 0;
    if qryVdPv.RecordCount > 0 then begin
      dDtPrc := qryVdPvDtProc.AsDateTime;
      nNrVd  := qryVdPvNrVdPv.AsInteger;
      OpenQryOtkl(dDtPrc, nNrVd);
      if nSvNR <> 0 then
        qryOtkl.Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.DoSchet(nTabN : integer; cFamIO : ShortString);
var bFromMainForm, bSvFlagDbg : boolean; dSaveSysDtProc : TDateTime;
begin
  dSaveSysDtProc := dCtrlDate;
  dCtrlDate := dDtProc;
  bSvFlagDbg := bFlagDbg;
  bFlagDbg := false;
  Screen.Cursor := crHourGlass;
  bFromMainForm := false;
  StartRs5(bFromMainForm, nTabN, cFamIO, dDtProc);  {Z_Rs5}
  Application.ProcessMessages;
  dCtrlDate := dSaveSysDtProc;
  bFlagDbg := bSvFlagDbg;
  Screen.Cursor := crDefault;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popGoSchetClick(Sender: TObject);
var nCaseZd : word;
begin
  if not qryOtkl.Active or (qryOtkl.RecordCount = 0) then begin
    ShowMessage('Нет отклонений, по которым можно делать ведомость для кассы');
    Exit;
  end;
  if GetDopMgVedInf(nCaseZd) {z_MgDpZd} then begin
    PanelWait.Top := Round((dbgrOtkl.Height - PanelWait.Height) / 2);
    PanelWait.Left := Round((dbgrOtkl.Width - PanelWait.Width) / 2);
    PanelWait.Visible := true;
    Application.ProcessMessages;
    CreOpenCdsVed;
    with qryOtkl do begin
      First;
      while not Eof do begin
        DoSchet(FieldByName('TabN').AsInteger,
                  FieldByName('FamIO').AsString);
        AddInfInCdsVed(nCaseZd, FieldByName('DtProc').AsDateTime,
                                 FieldByName('DtVdPv').AsDateTime,
                                  FieldByName('TabN').AsInteger,
                                   FieldByName('NrVdPV').AsInteger,
                                    FieldByName('PDN').AsInteger,
                                     FieldByName('KdSpZ').AsInteger,
                                      FieldByName('KdKatP').AsInteger,
                                       FieldByName('KdObj').AsInteger,
                                        FieldByName('FamIO').AsString,
                                         FieldByName('SCHBU').AsString,
                                          FieldByName('Summa').AsFloat);
        Next;
      end;
      First;
    end;
    PanelWait.Visible := false;
    SetDbgrVedColumns(nCaseZd);
    PageControl.ActivePage := ts3;
    Caption := cCap3;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.SetDbgrVedColumns(nCaseZd : word);
var i : word; cUpper : string;
begin
  for i := 0 to dbgrVed.Columns.Count-1 do begin
    with dbgrVed.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (nCaseZd = 2) and
              ((cUpper = 'SMNACHVIDA') or (cUpper = 'SMUDRGVIDA')) then
        Visible := false
      else
        Visible := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.AddInfInCdsVed(nCaseZd : word; dDtPrc, dDtVdPv : TDateTime;
                                    nTabN, nNrVdPV : integer;
                                   nPdn, nKdSpZ, nKdKatP, nKdObj : SmallInt;
                                  cFamIO, cSPZ : ShortString; nSumma : double);
var nSmNachTt, nSmUdrgTt, nSmVuplTt,
               nSmUdrgVida, nSmKVuplVida, nSmOstNaRuki : double;
begin
  nSmNachTt := 0;
  nSmUdrgTt := 0;
  nSmVuplTt := 0;
//  nSmUdrgVida := 0;
//  nSmKVuplVida := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select "NCSL" as Part, Sum(n.Summa) as SMM from ViNu_Main n ' +
           ' where n.DtProc = :dDtPrc and n.TabN = :nTabN and ' +
           ' n.VidN < "5000"');
    SQL.Add('UNION Select "UDRG" as Part, Sum(n.Summa) as SMM from ViNu_Main n ' +
            ' where n.DtProc = :dDtPrc and n.TabN = :nTabN and ' +
            ' n.VidN > "6000" and n.VidN < "7500"');
    SQL.Add('UNION Select "VUPL" as Part, Sum(n.Summa) as SMM from ViNu_Main n ' +
            ' where n.DtProc = :dDtPrc and n.TabN = :nTabN and ' +
            ' n.VidN > "7500" and n.VidN < "8000"');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if FieldByName('Part').AsString = 'NCSL' then
        nSmNachTt := nSmNachTt + FieldByName('SMM').AsFloat
      else if FieldByName('Part').AsString = 'UDRG' then
        nSmUdrgTt := nSmUdrgTt - FieldByName('SMM').AsFloat
      else // if FieldByName('Part').AsString = 'UDRG' then
        nSmVuplTt := nSmVuplTt - FieldByName('SMM').AsFloat;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if nCaseZd = 1 then begin // выдавать суммы, пропорционально SmNachVida
    nSmUdrgVida := nSmUdrgTt / nSmNachTt * nSumma; // защититься от 0 !!! TYTYTYT
    with cdsVed do begin
      Append;
      FieldByName('TabN').AsInteger := nTabN;
      FieldByName('FamIO').AsString := cFamIO;
      FieldByName('SmNachTt').AsFloat := RoundTo(nSmNachTt, -2);
      FieldByName('SmUdrgTt').AsFloat := RoundTo(nSmUdrgTt, -2);
      FieldByName('SmVuplTt').AsFloat := RoundTo(nSmVuplTt, -2);
      FieldByName('SmNachVida').AsFloat := nSumma;
      FieldByName('SmUdrgVida').AsFloat := RoundTo(nSmUdrgVida, -2);
      nSmKVuplVida := FieldByName('SmNachVida').AsFloat -
                         FieldByName('SmUdrgVida').AsFloat;
      nSmOstNaRuki := cdsVedSmNachTt.AsFloat - cdsVedSmUdrgTt.AsFloat -
                        cdsVedSmVuplTt.AsFloat - nSmKVuplVida;
      if nSmOstNaRuki < 0 then
        nSmKVuplVida := nSmKVuplVida + nSmOstNaRuki;
      FieldByName('SmVuplVida').AsFloat := nSmKVuplVida;
      FieldByName('SmOper').AsFloat := FieldByName('SmVuplVida').AsFloat;
      FieldByName('PDN').AsInteger := nPdn;
      FieldByName('KdSpZ').AsInteger := nKdSpZ;
      FieldByName('KdKatP').AsInteger := nKdKatP;
      FieldByName('KdObj').AsInteger := nKdObj;
      FieldByName('SPZ').AsString := cSPZ;
      FieldByName('NrVdPV').AsInteger := nNrVdPV;
      FieldByName('DtVdPV').AsDateTime := dDtVdPV;
      Post;
    end; end
  else begin
//    nSmUdrgVida := nSmUdrgTt / nSmNachTt * nSumma; // защититься от 0 !!! TYTYTYT
    with cdsVed do begin
      Append;
      FieldByName('TabN').AsInteger := nTabN;
      FieldByName('FamIO').AsString := cFamIO;
      FieldByName('SmNachTt').AsFloat := RoundTo(nSmNachTt, -2);
      FieldByName('SmUdrgTt').AsFloat := RoundTo(nSmUdrgTt, -2);
      FieldByName('SmVuplTt').AsFloat := RoundTo(nSmVuplTt, -2);
      nSmOstNaRuki := cdsVedSmNachTt.AsFloat - cdsVedSmUdrgTt.AsFloat -
                                                    cdsVedSmVuplTt.AsFloat;
      if nSmOstNaRuki < 0 then
        nSmOstNaRuki := 0;
      FieldByName('SmVuplVida').AsFloat := nSmOstNaruki;
      FieldByName('SmOper').AsFloat := FieldByName('SmVuplVida').AsFloat;
      FieldByName('PDN').AsInteger := nPdn;
      FieldByName('KdSpZ').AsInteger := nKdSpZ;
      FieldByName('KdKatP').AsInteger := nKdKatP;
      FieldByName('KdObj').AsInteger := nKdObj;
      FieldByName('SPZ').AsString := cSPZ;
      FieldByName('NrVdPV').AsInteger := nNrVdPV;
      FieldByName('DtVdPV').AsDateTime := dDtVdPV;
      Post;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.cdsVedBeforePost(DataSet: TDataSet);
begin
  cdsVedSmOstNaruki.AsFloat := RoundTo(cdsVedSmNachTt.AsFloat -
                                       cdsVedSmUdrgTt.AsFloat -
                                       cdsVedSmVuplTt.AsFloat -
                                       cdsVedSmOper.AsFloat, -2);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.CreOpenCdsVed;
begin
  with cdsVed do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnEditingClick(Sender: TObject);
begin
  SetDbgrOtklEditing;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.SetDbgrOtklEditing;
begin
  if sBtnEditing.Down and (qryVdPvKdUsr.AsInteger = n_KdUsr) then
    dbgrOtkl.Options := dbgrOtkl.Options + [dgEditing]
  else
    dbgrOtkl.Options := dbgrOtkl.Options - [dgEditing];
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgrOtklKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if not sBtnEditing.Down or
         ((qryOtkl.RecordCount = 0) and (qryOtkl.State <> dsInsert)) then
    Exit;
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    dbgrOtklEditButtonClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklCalcFields(DataSet: TDataSet);
begin
  if not qryOtklFam.IsNull then
    qryOtklFamIO.AsString := MyFamIO(qryOtklFam.AsString,
                                     qryOtklIma.AsString, qryOtklOtch.AsString)
  else
    qryOtklFamIO.AsString := DmMain.TabN2FamIO(qryOtklTabN.AsInteger); {z_Dm}
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklZAMESGODSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyMesGod(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := '01-' + Text;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklZAMESGODValidate(Sender: TField);
var dInputDate : TDateTime;
begin
  dInputDate := Sender.AsDateTime;
  if dInputDate = dDtProc then begin
    tbl_OtklDt_Beg.AsDateTime := dDtProc;
    tbl_OtklDt_End.AsDateTime := dDtLastProcMes;
    tbl_OtklChas.AsFloat := nCurBudget; end
  else begin
    tbl_OtklDt_Beg.AsDateTime := dInputDate;
    tbl_OtklDt_End.AsDateTime := MyLastDOM(dInputDate);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklBeforePost(DataSet: TDataSet);
var nTabN : integer; bIsInSps : boolean;
begin
  if tbl_Otkl.State = dsInsert then begin
    bInsert := true;
    bEdit := false; end
  else begin
    bInsert := false;
    bEdit := true;
  end;
  nTabN := tbl_OtklTabN.AsInteger;
  bIsInSps := CheckTabNInSps(nTabN);
  if cdsCtrl.Locate('TabN;VidN;ZaMesGod',
                  VarArrayOf([nTabN, tbl_OtklVidN.AsString,
                          tbl_OtklZaMesGod.AsDateTime]), []) and
                     (cdsCtrl.FieldByName('OtklNR').AsInteger <>
                                             tbl_OtklNR.AsInteger) then begin
    ShowMessage('В одном пакете не должны дважды' + #13#10 +
                'встречаться одинаковые сочетания ТабНр, ВидН и ЗаМесГод');
    Abort;
  end;
  if (nTabN = 0) or not bIsInSps and (MessageDlg('Табельного номера ' + IntToStr(nTabN) +
                      ' нет в списке текущего месяца.' + #13#10 +
                      '     Добавить?: (в случае отказа запись удаляется)',
                          mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then begin
    tbl_Otkl.Cancel;
    Abort; end
  else begin
    bNeedAddInSps := false;
    n_AddKdObj    := tbl_OtklKdObj.AsInteger;
    n_AddKdKatP   := tbl_OtklKdKatP.AsInteger;
    c_AddShObj    := tbl_OtklShObj.AsString;
    c_AddShKatP   := tbl_OtklShKatP.AsString;
(*  Восстановить после отладки (можно еще добавить проверку счета)
    if (n_AddKdObj = 0) or (n_AddKdKatP = 0) then begin
      bIsDopInf := GetDopInf(tbl_OtklFamIO.AsString,      {z_GtDInf}
                             tbl_OtklTabN.AsInteger, n_AddKdObj, n_AddKdKatP,
                                                     c_AddShObj, c_AddShKatP);
      if bIsDopInf then begin
        tbl_OtklKdObj.AsInteger := n_AddKdObj;
        tbl_OtklKdKatP.AsInteger := n_AddKdKatP; end
      else begin
        bNeedAddInSps := false;
        tbl_Otkl.Cancel;
        Abort;
      end;
    end;
*)
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklAfterPost(DataSet: TDataSet);
begin
  cPredVidN  := tbl_OtklVidN.AsString;
  cPredNotes := tbl_OtklNotes.AsString;
  cPredDtBeg := tbl_OtklDt_Beg.AsString;
  cPredDtEnd := tbl_OtklDt_End.AsString;
  cPredSumma := tbl_OtklSumma.AsString;
  cPredKdSpZ := tbl_OtklKdSpZ.AsString;
  dPredZaMesGod := tbl_OtklZaMesGod.AsDateTime;

end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklTABNSetText(Sender: TField; const Text: String);
var cText : string; nTabN : integer;
    cFamIO, cFam, cIma, cOtch, cPol, cID : string; dDOB : TDateTime;
    nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpZ, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double; cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs, bIsInSps : boolean; nInv : SmallInt;
begin
  if not bReady then Exit;
  cText := Text;
  nKdObj := 0;
  nKdKatP := 0;
  if cText <> '' then begin
    nTabN := StrToInt(cText);
    if DmMain.GetUpiInfo(nTabN, cFamIO, cFam, cIma, cOtch,   {z_Dm}
                                                    cPol, cID, dDOB) then begin
      tbl_OtklFamIO.AsString := cFamIO;
      // проверить, есть ли введенный ТабН в списке текущего месяца
      // если нет - диалог "Что делать"
      bIsInSps := CheckTabNInSps(nTabN);
      if not bIsInSps and (MessageDlg('Табельного номера ' + IntToStr(nTabN) +
                      ' нет в списке текущего месяца. Добавить?:',
                          mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then begin
        Sender.AsString        := '';
        tbl_OtklKdObj.AsString  := '';
        tbl_OtklKdKatP.AsString := '';
        tbl_OtklKdSPZ.AsString  := ''; end
      else begin
        Sender.AsString := cText;
        DmMain.GetPereInf(nTabN, d_DtProc, nKdObj, nKdKatP, nSO, nPdNlg,
                                nKolMin, nKdSpZ, nRang, nRazr, nOklTrf,
                               nAvans, nProcLG, cSpAv, cDolgnost, cNrPrikaza,
                              dDtPrikaza, bPens, bSovm, bPrfs, nInv);
        if nKdObj <> 0 then begin
          tbl_OtklKdObj.AsInteger  := nKdObj;
          tbl_OtklKdKatP.AsInteger := nKdKatP;
          tbl_OtklKdSPZ.AsInteger  := nKdSpZ;
        end;
        if not bIsInSps then
          AddInSpsCurMes(n_KdSps, nTabN, nKdObj, nKdKatP);
      end; end
    else
      Raise Exception.Create('Нет в таблице "Сотрудники" табельного номера "' +
                                                                  cText + '"');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklVIDNSetText(Sender: TField; const Text: String);
var cText : string; cVidN : string4; cShVidN, cNmVidN : string;
begin
  if not bReady then Exit;
  cText := Text;
  if cText <> '' then begin
    cVidN := cText;
    cShVidN := DmMain.VidN2ShVidN(cVidN, cNmVidN);
    if cShVidN <> '' then
      Sender.AsString := cText
    else
      Raise Exception.Create('Нет в справочнике видов начислений/удержаний ' +
                             'вида "' + cText + '"');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklDT_BEGValidate(Sender: TField);
var dDtBeg, dDtEnd : TDateTime;
begin
  if (Sender.AsString = '') or (tbl_OtklDt_End.AsString = '') then
    tbl_OtklChas.AsFloat := 0
  else begin
    dDtBeg := Sender.AsDateTime;
    if (dDtBeg > MyLastDOM(tbl_OtklZaMesGod.AsDateTime)) or
        (dDtBeg < MyFirstDOM(tbl_OtklZaMesGod.AsDateTime)) then
      Raise Exception.
            Create('Дата должна быть в пределах выбранного месяца "ЗаМесГод"')
    else begin
      dDtEnd := tbl_OtklDt_End.AsDateTime;
      tbl_OtklChas.AsFloat := DmMain.CountWorkChas(dDtBeg, dDtEnd);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklDT_ENDValidate(Sender: TField);
var dDtBeg, dDtEnd : TDateTime;
begin
  if (Sender.AsString = '') or (tbl_OtklDt_Beg.AsString = '') then
    tbl_OtklChas.AsFloat := 0
  else begin
    dDtEnd := Sender.AsDateTime;
    if (dDtEnd > MyLastDOM(tbl_OtklZaMesGod.AsDateTime)) or
        (dDtEnd < MyFirstDOM(tbl_OtklZaMesGod.AsDateTime)) then
      Raise Exception.
             Create('Дата должна быть в пределах выбранного месяца "ЗаМесГод"')
    else begin
      dDtBeg := tbl_OtklDt_Beg.AsDateTime;
      if tbl_OtklVidN.AsString = 'xxx' then begin  // What is it? TYTYT
        tbl_OtklChas.AsFloat := 0;
        tbl_OtklSumma.AsFloat := 0; end
      else
        tbl_OtklChas.AsFloat := DmMain.CountWorkChas(dDtBeg, dDtEnd);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklNewRecord(DataSet: TDataSet);
var nDbgVedNo : integer;
begin
  qryOtklZaMesGod.OnValidate := nil;
  qryOtklDT_BEG.OnValidate := nil;
  qryOtklDT_END.OnValidate := nil;
  qryOtklKdObj.OnValidate  := nil;
  if bVvodMegVed then begin  // т.к. это расх.ордера, тут не все будет подчи-
    cPredVidN                  := '7509';  // няться установкам "Копи-полей"
    cPredShVidN                := 'РасхОрдер';
    dPredZaMesGod              := d_DtProc;
    qryOtklVidN.AsString       := cPredVidN;
    qryOtklShVidN.AsString     := cPredShVidN;
    qryOtklKdSpZ.AsString      := cPredKdSpZ;
    qryOtklZaMesGod.AsDateTime := dPredZaMesGod;
    qryOtklDt_Beg.AsString     := '';
    qryOtklDt_End.AsString     := '';
    qryOtklChas.AsString       := '';
    if bPredOtklNotes then
      qryOtklNotes.AsString    := cPredNotes;
    if bPredOtklSumma then
      qryOtklSumma.AsString    := cPredSumma;
    if dPredZaMesGod <> 0 then
      qryOtklZaMesGod.AsDateTime := dPredZaMesGod
    else
      qryOtklZaMesGod.AsDateTime := d_DtProc; end
  else begin
    if bPredOtklVidN and (cPredVidN <> '') then begin
      qryOtklVidN.AsString   := cPredVidN;
      qryOtklShVidN.AsString := cPredShVidN;
    end;
    if bPredOtklObj then begin
      if cPredKdObj > '' then begin
        qryOtklKdObj.AsString := cPredKdObj;
        qryOtklShObj.AsString := cPredShObj;
      end;
      if cPredKdKatP > '' then begin
        qryOtklKdKatP.AsString := cPredKdKatP;
        qryOtklShKatP.AsString := cPredShKatP;
      end;
    end;
    if bPredOtklSpZ and (cPredKdSpZ > '') then begin
      qryOtklKdSpZ.AsString := cPredKdSpZ;
      qryOtklSchBU.AsString := cPredSchBU;
    end;   // если же bPereOtklObj или bPereOtklSpZ (из перемещений), то будут
           // заполняться после ввода ТабНр (по событию qryOtklTABNSetText)
    if bPredOtklZaMG and (dPredZaMesGod > 0) then
      qryOtklZaMesGod.AsDateTime := dPredZaMesGod
    else
      qryOtklZaMesGod.AsDateTime := d_DtProc;
    if bPredOtklDates then begin
      if cPredDtBeg  > '' then
        qryOtklDt_Beg.AsString := cPredDtBeg;
      if cPredDtEnd  > '' then
        qryOtklDt_End.AsString := cPredDtEnd; end
    else if bPeriodOtklDates then begin
      qryOtklDt_Beg.AsDateTime := d_DtProc;
      qryOtklDt_End.AsDateTime := myLastDOM(d_DtProc);
    end;
    if bPredOtklChasu and (cPredChas > '') then
      qryOtklChas.AsString := cPredChas
    else if bCalcOtklChasu then
      qryOtklChas.AsFloat := DmMain.CountWorkChas(
                       qryOtklDt_Beg.AsDateTime, qryOtklDt_End.AsDateTime);
    if bPredOtklSumma then
      qryOtklSumma.AsString := cPredSumma;
    if bPredOtklNotes then
      qryOtklNotes.AsString := cPredNotes;
  end;
  qryOtklDtProc.AsDateTime := d_DtProc;
  qryOtklKto.AsInteger     := n_KdUsr;
  qryOtklPdN.AsInteger     := 1;
  qryOtklSpecPS.AsInteger  := -1; // т.к. новая
  nDbgVedNo                := qryVdPvNrVdPv.AsInteger;
  qryOtklNrVdPV.AsInteger  := nDbgVedNo; // qryVdPvNrVdPv.AsInteger;
  qryOtklDtVdPV.AsDateTime := qryVdPvDtVdPv.AsDateTime;
  qryOtklZAMESGOD.OnValidate := qryOtklZAMESGODValidate;
  qryOtklDT_BEG.OnValidate   := qryOtklDT_BEGValidate;
  qryOtklDT_END.OnValidate   := qryOtklDT_ENDValidate;
  qryOtklKdObj.OnValidate    := FldKdObjValidate;
end;
//------------------------------------------------------------------------------
function TFormVdPV.NewOtklNR : LongInt;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from GET_MAXOTKLNR');
    Open;
    Result := FieldByName('MaxOtklNr').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklBeforePost(DataSet: TDataSet);
var nTabN : integer; bIsInSps, bIsDopInf : boolean;
begin
  if qryOtkl.State = dsInsert then begin
    bInsert := true;
    bEdit := false; end
  else begin
    bInsert := false;
    bEdit := true;
  end;
  if qryOtklNR.IsNull or (qryOtklNR.AsInteger <= 0) then
    qryOtklNR.AsInteger := NewOtklNR;
  nTabN := qryOtklTabN.AsInteger;
  bIsInSps := CheckTabNInSps(nTabN);
  if cdsCtrl.Locate('TabN;VidN;ZaMesGod',
                  VarArrayOf([nTabN, qryOtklVidN.AsString,
                          qryOtklZaMesGod.AsDateTime]), []) and
                     (cdsCtrl.FieldByName('OtklNR').AsInteger <>
                                             qryOtklNR.AsInteger) then begin
    ShowMessage('В одном пакете не должны дважды' + #13#10 +
                'встречаться одинаковые сочетания ТабНр, ВидН и ЗаМесГод');
    Abort;
  end;
  if qryOtklKdSps.IsNull or (qryOtklKdSps.AsInteger <> n_KdSps) then
    qryOtklKdSps.AsInteger := n_KdSps;
  if not bIsInSps and (MessageDlg('Табельного номера ' + IntToStr(nTabN) +
                      ' нет в списке текущего месяца.' + #13#10 +
                      '     Добавить?: (в случае отказа запись удаляется)',
                          mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then begin
    qryOtkl.Cancel;
    Abort; end
  else begin
    bNeedAddInSps := false;
    n_AddKdObj    := qryOtklKdObj.AsInteger;
    n_AddKdKatP   := qryOtklKdKatP.AsInteger;
    c_AddShObj    := qryOtklShObj.AsString;
    c_AddShKatP   := qryOtklShKatP.AsString;
    if (n_AddKdObj = 0) or (n_AddKdKatP = 0) then begin
      bIsDopInf := GetDopInf(qryOtklFamIO.AsString,      {z_GtDInf}
                             qryOtklTabN.AsInteger, n_AddKdObj, n_AddKdKatP,
                                                     c_AddShObj, c_AddShKatP);
      if bIsDopInf then begin
        qryOtklKdObj.AsInteger := n_AddKdObj;
        qryOtklKdKatP.AsInteger := n_AddKdKatP; end
      else begin
        bNeedAddInSps := false;
        qryOtkl.Cancel;
        Abort;
      end;
    end;
  end;

  // SB 3.6.2026
  // Заполняем SPEC_NR:
  DataSet.FieldByName('SPEC_NR').AsInteger := DmMain.NewSpec_NR;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklAfterPost(DataSet: TDataSet);
begin
  if qryOtkl.UpdatesPending then
  Form_DM.DbMain.ApplyUpdates([qryOtkl]);
//  qryOtkl.ApplyUpdates;
  dPredZaMesGod := qryOtklZaMesGod.AsDateTime;
  cPredVidN     := qryOtklVidN.AsString;
  cPredShVidN   := qryOtklShVidN.AsString;
  cPredKdObj    := qryOtklKdObj.AsString;
  cPredShObj    := qryOtklShObj.AsString;
  cPredKdKatP   := qryOtklKdKatP.AsString;
  cPredShKatP   := qryOtklShKatP.AsString;
  cPredKdSpZ    := qryOtklKdSpZ.AsString;
  cPredSchBU    := qryOtklSchBU.AsString;
  cPredDtBeg    := qryOtklDt_Beg.AsString;
  cPredDtEnd    := qryOtklDt_End.AsString;
  cPredSumma    := qryOtklSumma.AsString;
  cPredChas     := qryOtklChas.AsString;
  cPredNotes    := qryOtklNotes.AsString;
  if bNeedAddInSps then begin
    AddInSpsCurMes(n_KdSps, qryOtklTabN.AsInteger, qryOtklKdObj.AsInteger,
                                                     qryOtklKdKatP.AsInteger);
    bNeedAddInSps := false;
  end;
  bInsert := false;
  bEdit := false;
  if qryOtklTabN.AsInteger = nFormMainActiveTabN then
                                 with FormZpMain.qrySps do begin
    DisableControls;
    Close;
    Open;
    Locate('TabN', nFormMainActiveTabN, []);
    EnableControls;
  end;
  b_Updated := true;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklAfterDelete(DataSet: TDataSet);
begin
  qryOtkl.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklZAMESGODValidate(Sender: TField);
var dInputDate : TDateTime;
begin
  dInputDate := Sender.AsDateTime;
  if bPeriodOtklDates then begin
    qryOtklDt_Beg.AsDateTime := dInputDate;
    qryOtklDt_End.AsDateTime := MyLastDOM(dInputDate); end
  else if bPredOtklDates and (cPredDtBeg > '') then begin
    qryOtklDt_Beg.AsString := cPredDtBeg;
    qryOtklDt_End.AsString := cPredDtEnd;
  end;
  qryOtklChas.AsFloat := DmMain.CountWorkChas(qryOtklDt_Beg.AsDateTime,
                                                  qryOtklDt_End.AsDateTime);
  qryOtklMyZaMesGod.AsString := Copy(qryOtklZaMesGod.AsString, 4, 7);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklTABNSetText(Sender: TField; const Text: String);
var cText : string; nTabN : integer;
    cFamIO, cFam, cIma, cOtch, cPol, cID, cDummy, cShKatP,
                                          cDolgnost, cNrPrikaza : string;
    dDOB, dDtPrikaza : TDateTime;
    nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpZ, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double; cSpAv : string1;
    bPens, bSovm, bPrfs, bIsInSps : boolean; nInv : SmallInt;
    cMsg : ShortString;
begin
  if not bReady then Exit;
  cText := Text;
  nKdObj := 0;
  nKdKatP := 0;
  if cText <> '' then begin
    nTabN := StrToInt(cText);
    if DmMain.GetUpiInfo(nTabN, cFamIO, cFam, cIma, cOtch,   {z_Dm}
                                                     cPol, cID, dDOB) then begin
      DmMain.GetPereInf(nTabN, d_DtProc, nKdObj, nKdKatP, nSO, nPdNlg,
                                nKolMin, nKdSpZ, nRang, nRazr, nOklTrf,
                               nAvans, nProcLG, cSpAv, cDolgnost, cNrPrikaza,
                              dDtPrikaza, bPens, bSovm, bPrfs, nInv);
      if (nKdObj = 0) or (nKdKatP = 0) or (nKdSpZ = 0) then begin
        cMsg := 'Табельный н-р ' + cText + ' использовать нельзя:';
        if (nKdObj = 0) then begin
          cMsg := cMsg + #13#10;
          cMsg := cMsg + 'Отсутствует подразделение';
        end;
        if (nKdKatP = 0) then begin
          if (nKdObj = 0) then
            cMsg := cMsg + #13#10;
          cMsg := cMsg + 'Отсутствует категория персонала';
        end;
        if (nKdSpZ = 0) then begin
          if (nKdObj = 0)  or (nKdKatP = 0) then
            cMsg := cMsg + #13#10;
          cMsg := cMsg + 'Отсутствует счет БухУчета';
        end;
        Raise Exception.Create(cMsg);
      end;
      // проверить, есть ли введенный ТабН в списке текущего месяца
      // если нет - диалог "Что делать"
      bIsInSps := CheckTabNInSps(nTabN);
      if not bIsInSps and (MessageDlg('Табельного номера ' + IntToStr(nTabN) +
                      ' нет в списке текущего месяца. Добавить?:',
                          mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then begin
        Sender.AsString        := '';
        qryOtklKdObj.AsString  := '';
        qryOtklKdKatP.AsString := '';
        qryOtklKdSPZ.AsString  := '';
        Raise Exception.Create('Нельзя вводить отсутствующего в списке'); end
      else begin
        Sender.AsString := cText;
        DmMain.GetPereInf(nTabN, d_DtProc, nKdObj, nKdKatP, nSO, nPdNlg,
                                nKolMin, nKdSpZ, nRang, nRazr, nOklTrf,
                               nAvans, nProcLG, cSpAv, cDolgnost, cNrPrikaza,
                              dDtPrikaza, bPens, bSovm, bPrfs, nInv);
        if nKdObj <> 0 then begin
          if bPereOtklObj then begin
            qryOtklKdObj.AsInteger  := nKdObj;
            qryOtklShObj.AsString := DmMain.KdObj2ShObj(nKdObj, cDummy);
            qryOtklKdKatP.AsInteger := nKdKatP;
            cDummy := DmMain.KdKatP2NmKatP(nKdKatP, cShKatP);
            qryOtklShKatP.AsString := cShKatP; end
          else if bPredOtklObj then begin
            qryOtklKdObj.AsString := cPredKdObj;
            qryOtklShObj.AsString := cPredShObj;
            qryOtklKdKatP.AsString := cPredKdKatP;
            qryOtklShKatP.AsString := cPredShKatP;
          end;    // иначе остаются пустыми
          if (bPereOtklSpZ or (cPredKdSpZ = '')) and
                                   not bEmptyOtklSpZ then begin
            qryOtklKdSpZ.AsInteger := nKdSpZ;
            qryOtklSchBU.AsString := Form_Dm.KdSbu2SchBU(nKdSpZ); end
          else if bPredOtklSpZ and (cPredKdSpZ <> '') then begin
            qryOtklKdSPZ.AsString  := cPredKdSpZ;
            qryOtklSchBU.AsString  := cPredSchBU;
          end;
        end;
        if not bIsInSps then
          AddInSpsCurMes(n_KdSps, nTabN, nKdObj, nKdKatP);
        if bVvodMegVed then
          SetNuResult(nTabN, d_DtProc);
      end; end
    else
      Raise Exception.Create('Нет в таблице "Сотрудники" табельного номера "' +
                                                                  cText + '"');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.SetNuResult(nTabN : integer; dDtPrc :TDateTime);
var nSmm801, nSmm811 : double;
begin
  nSmm801 := 0;
  nSmm811 := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSCH, Sum(Summa) as SMM from ViNu_Main ' +
            ' where DtProc = :dDtPrc and TabN = :nTabN and ' +
            ' VidN < "8000" group by PSCH');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if Pos('801', FieldByName('PSCH').AsString) > 0 then
        nSmm801 := nSmm801 + FieldByName('SMM').AsFloat
      else if Pos('811', FieldByName('PSCH').AsString) > 0 then
        nSmm811 := nSmm811 + FieldByName('SMM').AsFloat;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if nSmm801 <> 0 then
    qryOtkl.FieldByName('MySmm801').AsFloat := nSmm801;
  if nSmm811 <> 0 then
    qryOtkl.FieldByName('MySmm811').AsFloat := nSmm811;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklSUMMASetText(Sender: TField; const Text: String);
var cText : string; nSumma : double;
begin
  if not bReady then Exit;
  cText := Text;
  if not bReady then Exit;
  cText := Text;
  if not bVvodMegVed then
    Sender.AsString := cText
  else begin
    if cText <> '' then begin
      nSumma := StrToFloat(cText);
      if nSumma > 0 then
        cText := '-' + cText;
    end;
    Sender.AsString := cText
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklVIDNSetText(Sender: TField; const Text: String);
var cText : string; cVidN : string4; cShVidN, cNmVidN : string;
begin
  if not bReady then Exit;
  cText := Text;
  if cText <> '' then begin
    cVidN := cText;
    cShVidN := DmMain.VidN2ShVidN(cVidN, cNmVidN);
    if cShVidN <> '' then begin
      qryOtklShVidN.AsString := cShVidN;
      Sender.AsString := cText; end
    else begin
      qryOtklShVidN.AsString := '';
      Raise Exception.Create('Нет в справочнике видов начислений/удержаний ' +
                             'вида "' + cText + '"');
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklVIDNValidate(Sender: TField);
var cVidN : string4;
begin
  cVidN := qryOtklVidN.AsString;
  if ((cVidN >= '2400') and (cVidN < '2500')) {отпускные} or
          ((cVidN >= '2600') and (cVidN < '2700')) {больничнные} or
          ((cVidN >= '6601') and (cVidN <= '6602')) {алим.или п/сбор} or
           (cVidN = '7509') {Расх.ордер}
                                                                    then begin
      qryOtklDt_Beg.AsString := '';
      qryOtklDt_End.AsString := '';
      qryOtklChas.AsString   := '';
  end;
  // Sender.AsString := cText; // Не случится ли зацикливание ???
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklDT_BEGValidate(Sender: TField);
var dDtBeg, dDtEnd : TDateTime;
begin
  if (Sender.AsString = '') or (qryOtklDt_End.AsString = '') then
    qryOtklChas.AsFloat := 0
  else begin
    dDtBeg := Sender.AsDateTime;
    if (dDtBeg > MyLastDOM(qryOtklZaMesGod.AsDateTime)) or
        (dDtBeg < MyFirstDOM(qryOtklZaMesGod.AsDateTime)) then
      Raise Exception.
            Create('Дата должна быть в пределах выбранного месяца "ЗаМесГод"')
    else begin
      dDtEnd := qryOtklDt_End.AsDateTime;
      qryOtklChas.AsFloat := DmMain.CountWorkChas(dDtBeg, dDtEnd);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklDT_ENDValidate(Sender: TField);
var dDtBeg, dDtEnd : TDateTime;
begin
  if (Sender.AsString = '') or (qryOtklDt_Beg.AsString = '') then
    qryOtklChas.AsFloat := 0
  else begin
    dDtEnd := Sender.AsDateTime;
    if (dDtEnd > MyLastDOM(qryOtklZaMesGod.AsDateTime)) or
        (dDtEnd < MyFirstDOM(qryOtklZaMesGod.AsDateTime)) then
      Raise Exception.
             Create('Дата должна быть в пределах выбранного месяца "ЗаМесГод"')
    else begin
      dDtBeg := qryOtklDt_Beg.AsDateTime;
      if qryOtklVidN.AsString = 'xxx' then begin  // What is it? TYTYT
        qryOtklChas.AsFloat := 0;
        qryOtklSumma.AsFloat := 0; end
      else
        qryOtklChas.AsFloat := DmMain.CountWorkChas(dDtBeg, dDtEnd);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgrOtklEditButtonClick(Sender: TObject);
var cVidN, p_KEKV : string4; p_ShVidN : string15; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                     p_KdSpZ : integer; bWasUpdated, bHsCh : boolean;
    cNmFld : string;
    nKdObj, nObjKdSpZ : integer; cShObj, cNmObj : string;
    nKdSBU : integer; cSchBU, cPSch, cNmSBU : string;
    nTabN, nKdKatP : integer;
    n_KdSps : SmallInt;
    cFam, cIma, cOtch, cShKatP, cNmKatP : string;
    X, Y : integer;
begin
  if not sBtnEditing.Down {не в режиме редактирования в таблице} or
         ((qryOtkl.RecordCount = 0) and (qryOtkl.State <> dsInsert)) then
    Exit;
  if (qryOtkl.FieldByName('Kto').AsInteger <> n_KdUsr) and
                                                (n_KdUsr <> 0) then begin
    ShowMessage('Не разрешается редактировать "чужие" отклонения');
    Exit;
  end;
  cNmFld := UpperCase(dbgrOtkl.SelectedField.FieldName);
  if (cNmFld = 'VIDN') or (cNmFld = 'SHVIDN') then begin
    cVidN := qryOtklVidN.AsString;
    if GetVidN(cVidN, p_KEKV, p_ShVidN, p_NmVidN,  {z_TVids}
               p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
               p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
               p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
               p_SAlim, p_SSocStrah, p_SBzr, p_CNdb, p_Sp_PF, p_Sp_FSTVP,
               p_Sp_FSNV, p_Sp_FZ, p_KdSpZ, bWasUpdated, LbxFilter) then begin
      if bWasUpdated then begin
        DmMain.qryVidN_LU.Close;
        DmMain.qryVidN_LU.Open;
      end;
      bReady := false;
      if not (qryOtkl.State in [dsInsert, dsEdit]) then
        qryOtkl.Edit;
      qryOtklVidN.AsString   := cVidN;
      qryOtklShVidN.AsString := p_ShVidN;
      qryOtklKdSPZ.AsInteger := p_KdSpZ;
      bReady := true;
    end; end
  else if (cNmFld = 'KDOBJ') or (cNmFld = 'SHOBJ') then begin
    nKdObj := qryOtklKdObj.AsInteger;
    if GetKdObj(nKdObj, nObjKdSpZ,
                                cShObj, cNmObj, bWasUpdated) {z_TObj} then begin
      bReady := false;
      if not (qryOtkl.State in [dsInsert, dsEdit]) then
        qryOtkl.Edit;
      qryOtklKdObj.AsInteger  := nKdObj;
      bReady := true;
    end; end
  else if (cNmFld = 'TABN') or (cNmFld = 'FAMIO') then begin
    nTabN := qryOtklTabN.AsInteger;
    if GetTabN(nTabN, nKdObj, nKdKatP, n_KdSps, cFam, cIma, cOtch,
                                             bWasUpdated) {z_TUpi} then begin
      bReady := false;
      if not (qryOtkl.State in [dsInsert, dsEdit]) then
        qryOtkl.Edit;
      qryOtklTabN.AsInteger := nTabN;
      bReady := true;
    end; end
  else if (cNmFld = 'KDKATP') or (cNmFld = 'SHKATP') then begin
    nKdKatP := qryOtklKdKatP.AsInteger;
    if GetKatPers(nKdKatP, cShKatP, cNmKatP) {z_GtPers} then begin
      bReady := false;
      if not (qryOtkl.State in [dsInsert, dsEdit]) then
        qryOtkl.Edit;
      qryOtklKdKatP.AsInteger := nKdKatP;
      bReady := true;
    end; end
  else if (cNmFld = 'KDSPZ') or (cNmFld = 'SPZ') then begin
    nKdSBU := qryOtklKdSpZ.AsInteger;
    if GetSBU(nKdSBU, cSchBU, cPSch, cNmSBU, bHsCh) {a_SBU} then begin
      bReady := false;
      if not (qryOtkl.State in [dsInsert, dsEdit]) then
        qryOtkl.Edit;
      qryOtklKdSpZ.AsInteger  := nKdSBU;
      bReady := true;
    end; end
  else if (cNmFld = 'ZAMESGOD') or (cNmFld = 'MYZAMESGOD') then begin
    X := Mouse.CursorPos.X;
    Y := Mouse.CursorPos.Y;
    cdsZaMG.Locate('ZaMesGod', qryOtklZaMesGod.AsDateTime, []);
    if GetZaMG(X, Y, cdsZaMG) {z_ZaMG} then begin
      if not (qryOtkl.State in [dsInsert, dsEdit]) then
        qryOtkl.Edit;
      qryOtklZaMesGod.AsDateTime := cdsZaMGZaMesGod.AsDateTime;
      qryOtklMyZaMesGod.AsString := Copy(cdsZaMGZaMesGod.AsString, 4, 7);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popEdtClick(Sender: TObject);
var nTabN, nSpecNr : integer; cFamIO : ShortString;
    cVidN : string4;
    bShowTabN, bPereschet, bCanUpd : boolean;
begin
  if (not DmMain.InCtrlMes) or (dbgrOtkl.DataSource.DataSet.RecordCount = 0) or
       (dbgrOtkl.DataSource.DataSet.FieldByName('PrPv').AsInteger = 5) then
    Exit;
  nTabN      := qryOtklTabN.AsInteger;
  cFamIO     := qryOtklFamIO.AsString;
  bShowTabN  := true;
  bPereschet := false;
  bCanUpd    := true;
  with qryOtkl do begin
    if (FieldByName('Kto').AsInteger <> n_KdUsr) and
                                                (n_KdUsr <> 0) then begin
      ShowMessage('Не разрешается редактировать "чужие" отклонения');
      Exit;
    end;
    cVidN := FieldByName('VidN').AsString;
    nSpecNR := FieldByName('Spec_NR').AsInteger;
    if ((cVidN >= '2600') and (cVidN <= '2700')) and (nSpecNR > 0) and
                              (FieldByName('PrPv').AsInteger <> 7) then begin
      if TFormEBln.AddEdtBln(nTabN, cFamIO, nSpecNR,
                            bShowTabN, bCanUpd, bPereschet) {Z_EBln} then begin
        Application.ProcessMessages;
        Close;
        Open;
        Application.ProcessMessages;
      end; end
    else if ((cVidN >= '2400') and (cVidN < '2500')) and (nSpecNR <> 0) and
                              (FieldByName('PrPv').AsInteger <> 7)  then begin

    // >> Z_EOtp
      if TFormEOtp.AddEdtOtp(nTabN, d_DtProc, cFamIO, nSpecNR,
        bShowTabN, bPereschet, bCanUpd) then
      begin
        Close;
        Open;
      end;
    end else begin
      Edit;
      FieldByName('PrPv').AsInteger := 1;
      if TFormEOtkl.AddEdtOtkl(dsrcOtkl, bShowTabN, bPereschet) {z_EOtkl} then
        Post
      else
        Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popDelClick(Sender: TObject);
begin
  if MessageDlg('Запись будет безвозвратно удалена из отклонений.' + #13#10 +
                'Расчет нужно будет произвести вручную. Согласны?:', mtWarning,
                [mbYes, mbNo], 0) = mrYes then
    qryOtkl.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgrOtklColExit(Sender: TObject);
var dInputDate : TDateTime; cFldNm : string;
begin
  // При выходе из поля MyZaMesGod
  if (dsrcOtkl.State <> dsEdit) and (dsrcOtkl.State <> dsInsert) then
    Exit;
  cFldNm := UpperCase(dbgrOtkl.SelectedField.FieldName);
  if (cFldNm = 'ZAMESGOD') or (cFldNm = 'MYZAMESGOD') then begin
    dInputDate := qryOtklZaMesGod.AsDateTime;
    if dInputDate = dDtProc then begin                   // TYTYTYT
      qryOtklDt_Beg.AsDateTime := dDtProc;
      qryOtklDt_End.AsDateTime := dDtLastProcMes;
      qryOtklChas.AsFloat := nCurBudget; end
    else begin
      qryOtklDt_Beg.AsDateTime := dInputDate;
      qryOtklDt_End.AsDateTime := MyLastDOM(dInputDate);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.DateFieldGetText(Sender: TField; var Text: String;
                                                          DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsDateTime = 0)) then
    Text := ''
  else
    Text := DateToStr((Sender as TField).AsDateTime);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popVdPvAddPaketWithWizClick(Sender: TObject);
begin
  nNewNrVedWithWiz := 0;
  with tbl_Otkl do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
    IndexDefs.Clear;
    IndexDefs.Add('', 'NR', [ixPrimary]);
    IndexDefs.Add('OnTabNVidN', 'TabN;VidN', []);
    IndexDefs.Add('OnFioVidN', 'FamIO;VidN', []);
    IndexDefs.Add('OnVidNTabN', 'VidN;TabN', []);
    DisableControls;
    OnCalcFields := nil;
    BeforePost := nil;
    AfterPost := nil;
    CreateTable;
    Open;
    IndexName := 'OnTabNVidN';
    EnableControls;
    OnCalcFields := tbl_OtklCalcFields;
    BeforePost := tbl_OtklBeforePost;
    AfterPost := tbl_OtklAfterPost;
    First;
  end;
  PageControl.ActivePage := ts2;
  Caption := cCap2;
  sBtnVbSotrClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnGoBackClick(Sender: TObject);
var nDlgResult : SmallInt; bIsResult : boolean;
begin
  bIsResult := true;
  if sBtnAddToOtkl.Enabled then begin
    nDlgResult := MessageDlg('Список не подключен к отклонениям. Подключить?:',
                              mtWarning, [mbYes, mbNo, mbCancel], 0);
    if nDlgResult = mrYes then begin
      bIsResult := true;
      sBtnAddToOtkl.Click; end
    else if nDlgResult = mrCancel then
      Exit                // остались на этой закладке
    else
      bIsResult := false; // выбран mbNo - возвращаемся без сохранения tbl_Otkl
  end;
  with tbl_Otkl do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    IndexDefs.Clear;
    if Exists then DeleteTable;
  end;
  nNewNrVedWithWiz := 0;
  if bIsResult then begin
    qryVdPv.DisableControls;
    OpenQryVdPV(d_DtProc);
    qryVdPv.Last;
    qryVdPv.EnableControls;
  end;
  PageControl.ActivePage := ts1;
  Caption := cCap1;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.tbl_OtklCalcFields(DataSet: TDataSet);
var cDummy, cShKatP : string;
begin
  if tbl_OtklVidN.AsString > '' then
    tbl_OtklShVidN.AsString :=
                         DmMain.VidN2ShVidN(tbl_OtklVidN.AsString, cDummy);
  tbl_OtklShObj.AsString :=
                         DmMain.KdObj2ShObj(tbl_OtklKdObj.AsInteger, cDummy);
  tbl_OtklSPZ.AsString := Form_Dm.KdSbu2SchBU(tbl_OtklKdSpz.AsInteger);
  cDummy := DmMain.KdKatP2NmKatP(tbl_OtklKdKatP.AsInteger, cShKatP);
  tbl_OtklShKatP.AsString := cShKatP;
  tbl_OtklMyZaMesGod.AsString := Copy(tbl_OtklZaMesGod.AsString, 4, 7);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnVbSotrClick(Sender: TObject);
var mListKatP : TStringList;  cOtkuda : ShortString;
begin
  cOtkuda :='iz otkl';
  mListKatP := TStringList.Create;
  VuborObjSotr(cOtkuda, n_KdSps, d_DtProc,
                                 LbxObj, LbxTabN, mListKatP);    {z_VbSotr}
  mListKatP.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnAddToOtklClick(Sender: TObject);
var nSvNr : integer; bMegVed : boolean;
    nDbgKdTemu : SmallInt;
begin
  bMegVed := false;
  if nNewNrVedWithWiz = 0 then
    nNewNrVedWithWiz := NewVedNr;
  sBtnAddToOtkl.Enabled := false;
  with tbl_Otkl do begin
    nSvNr := tbl_OtklNR.AsInteger;
    First;
    while not Eof do begin
      if not tbl_OtklAddedToOtkl.AsBoolean then begin
        nDbgKdTemu := tbl_OtklKdTemu.AsInteger;
        AddRecInOtkl(tbl_OtklVidN.AsString, d_DtProc,
                     tbl_OtklZaMesGod.AsDateTime, tbl_OtklDt_Beg.AsDateTime,
                     tbl_OtklDt_End.AsDateTime, n_KdSps, nNewNrVedWithWiz,
                     tbl_OtklTabN.AsInteger, tbl_OtklPdn.AsInteger,
                     nDbgKdTemu,     //    tbl_OtklKdTemu.AsInteger,
                     tbl_OtklKdSpZ.AsInteger, tbl_OtklKdObj.AsInteger,
                     tbl_OtklKdKatP.AsInteger, tbl_OtklNotes.AsString,
                     tbl_OtklChas.AsFloat, tbl_OtklSumma.AsFloat);
        Edit;
        tbl_OtklAddedToOtkl.AsBoolean := TRUE;
        Post;
      end;
      Next;
    end;
    Locate('NR', nSvNr, []);
  end;
  AddRecInVdPV(nNewNrVedWithWiz, n_KdUsr, d_DtProc, Date, bMegVed);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.AddRecInOtkl(cVidN : string4;
                              dDtPrc, dZaMesGod, dDt_Beg, dDt_End : TDateTime;
             nKdSps, nNrVdPV, nTabN, nPdn, nKdTemu,
                                            nKdSpZ, nKdObj, nKdKatP : Integer;
                                       cNotes : string; nChas, nSumma : double);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_Otkl (VidN, DtVdPV, DtProc, ZaMesGod ');
    if dDt_Beg <> 0 then
      SQL.Add(', Dt_Beg');
    if dDt_End <> 0 then
      SQL.Add(', Dt_End');
    SQL.Add(', KdSps, NrVdPV, TabN, Pdn, KdSpZ, KdObj, KdKatP, Notes');
    if nChas <> 0 then
      SQL.Add(', Chas');
    if nSumma <> 0 then
      SQL.Add(', Summa');
    if nKdTemu > 0 then
      SQL.Add(', KdTemu');
    SQL.Add(') values (:cVidN, :dDtVdPV, :dDtProc, :dZaMesGod ');
    if dDt_Beg <> 0 then
      SQL.Add(', :dDt_Beg');
    if dDt_End <> 0 then
      SQL.Add(', :dDt_End');
    SQL.Add(', :nKdSps, :nNrVdPV, :nTabN, :nPdn, :nKdSpZ, :nKdObj, ' +
            ' :nKdKatP, :cNotes');
    if nChas <> 0 then
      SQL.Add(', :nChas');
    if nSumma <> 0 then
      SQL.Add(', :nSumma');
    if nKdTemu > 0 then
      SQL.Add(', :nKdTemu');
    SQL.Add(')');
    ParamByName('cVidN').AsString := cVidN;
    ParamByName('dDtVdPV').AsDateTime := Date;
    ParamByName('dDtProc').AsDateTime := dDtPrc;
    ParamByName('dZaMesGod').AsDateTime := dZaMesGod;
    if dDt_Beg <> 0 then
      ParamByName('dDt_Beg').AsDateTime := dDt_Beg;
    if dDt_End <> 0 then
      ParamByName('dDt_End').AsDateTime := dDt_End;
    ParamByName('nKdSps').AsInteger := nKdSps;
    ParamByName('nNrVdPV').AsInteger := nNrVdPV;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nPdn').AsInteger := nPdn;
    ParamByName('nKdSpZ').AsInteger := nKdSpZ;
    ParamByName('nKdObj').AsInteger := nKdObj;
    ParamByName('nKdKatP').AsInteger := nKdKatP;
    ParamByName('cNotes').AsString := cNotes;
    if nChas <> 0 then
      ParamByName('nChas').AsFloat := nChas;
    if nSumma <> 0 then
      ParamByName('nSumma').AsFloat := nSumma;
    if nKdTemu > 0 then
      ParamByName('nKdTemu').AsInteger := nKdTemu;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgr_OtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn;  State: TGridDrawState);
var cFldNm : ShortString;
begin
  if not tbl_Otkl.Active then Exit;
  cFldNm := UpperCase(Column.FieldName);
  with dbgr_Otkl.Canvas do begin
    if not (gdFocused in State) then begin
      if tbl_OtklAddedToOtkl.AsBoolean then
        Font.Color := clBlue
      else
        Font.Color := clWindowText;
    end;
    if (cFldNm = 'SUMMA') and (tbl_OtklSumma.AsFloat < 0) then
      Font.Color := clRed;
  end;
  dbgr_Otkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popAddCmnClick(Sender: TObject);
var bCanChangeTabN, bPereschet : boolean;
    nSvNR, nTabN : integer;
    cLogMsg : string;
begin
  bCanChangeTabN := true;
  with dbgrOtkl.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('KdSps').AsInteger := gl_nKdSps;
    FieldByName('PrPv').AsInteger := 1;
    FieldByName('Kto').AsInteger := n_KdUsr;
    if TFormEOtkl.AddEdtOtkl(dsrcOtkl, bCanChangeTabN, bPereschet) {z_EOtkl} then begin
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtProc = ' + FieldByName('DtProc').AsString +
                 ', ZaMesGod = ' + FieldByName('ZaMesGod').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', Chas = ' + FieldByName('Chas').AsString +
                 ', Summa = ' + FieldByName('Summa').AsString;
      Post;
      DmMain.AddLog(Now, nTabN,
                          'Ввод отклонений', gc_AppNmUsr, 'Z_Otkl', cLogMsg); end
    else begin
      Cancel;
      if nSvNR <> 0 then Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popAddOtpClick(Sender: TObject);
var nTabN, nSpecNR : integer; cFamIO : string;
    bShowTabN, bPereschet, bCanUpd : boolean;
begin
  ShowMessage('Отпускные пока вводите через' + #13#10 +
              '"Массовые операции | Отпускные ..."');
  Exit;
  bShowTabN  := true;
  bPereschet := false;
  bCanUpd    := true;
  nSpecNR    := 0; // Еще не знаем
  nTabN      := 0;
  cFamIO     := '';
  // Если разрешать вводить отсюда, то нужно передавать в AddEdtOtp еще и
  // DtVdP и NrVdPV, научить AddEdtOtp вводить их в отклонения Сие на потом TYTYT
  with dbgrOtkl.DataSource.DataSet do begin
    if TFormEOtp.AddEdtOtp(nTabN, d_DtProc, cFamIO, nSpecNR, bShowTabN, {Z_EOtp}
                                         bPereschet, bCanUpd) then begin
//      QrySpsRefresh(nTabN); // перечитать Z_SPS - остальное потянется за ним
//      Close;
//      Open;
//      if bPereschet then popNuRaschet.Click;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popAddBlnClick(Sender: TObject);
begin
  ShowMessage('Больничные пока вводите через' + #13#10 +
              '"Массовые операции | Больничные ..."');
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popFonClick(Sender: TObject);
begin
  if FormZpMain.ColorDialog1.Execute then begin
    mFonColor := FormZpMain.ColorDialog1.Color;
    dbgrOtkl.Color := mFonColor;
    dbgrVdPv.Color := mFonColor;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popFontClick(Sender: TObject);
begin
  FormZpMain.FontDialog1.Font := dbgrOtkl.Font;
  if FormZpMain.FontDialog1.Execute then begin
    cFontName := FormZpMain.FontDialog1.Font.Name;
    nFontSize := FormZpMain.FontDialog1.Font.Size;
    bFontItalic := (fsItalic in FormZpMain.FontDialog1.Font.Style);
    bFontBold := (fsBold in FormZpMain.FontDialog1.Font.Style);
    SetTabsFont;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbGridlEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbGridlExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dsrcVdPvDataChange(Sender: TObject; Field: TField);
begin
//  sBtnDelVdPv.Enabled := qryVdPv.Active and (qryVdPv.State = dsBrowse) and
//                (qryVdPv.RecordCount > 0) and (qryVdPvNrVdPv.AsInteger < -1) and
//                ((qryVdPvKto.AsInteger = n_KdUsr) or (n_KdUsr = 0));
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popVdPvPopup(Sender: TObject);
begin
  popVdPvDelPaket.Enabled := DmMain.InCtrlMes and
                   qryVdPv.Active and (qryVdPv.State = dsBrowse) and
                (qryVdPv.RecordCount > 0) and (qryVdPvNrVdPv.AsInteger < -1) and
                ((qryVdPvKdUsr.AsInteger = n_KdUsr) or (n_KdUsr = 0)) and not
            (qryVdPvNrVdPv.AsInteger = qryVdPvVdVuplNr.AsInteger); // не прямая
  popVdPvShwMegVed.Enabled := {bInCtrlMes and}
                          qryVdPv.Active and (qryVdPv.State = dsBrowse) and
                (qryVdPv.RecordCount > 0) and (qryVdPvVdVuplNR.AsInteger > 0);
  popVdPvEdtMegVed.Enabled := DmMain.InCtrlMes and
                          (qryVdPvNrVdPv.AsInteger < -1) and
                      (qryVdPvNrVdPv.AsInteger = qryVdPvVdVuplNr.AsInteger) and
                ((qryVdPvKdUsr.AsInteger = n_KdUsr) or (n_KdUsr = 0));
  popVdPvDelMegVed.Enabled := popVdPvEdtMegVed.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popVdPvDelPaketClick(Sender: TObject);
var cMsg : string; nVdVuplNR : integer;
begin
  nVdVuplNR := 0;
  if qryOtkl.Active and (qryOtkl.RecordCount > 0) then begin
    cMsg := ' Будут безвозвратно удалены все записи,' + #13#10 +
            'введенные в отклонения данным пакетом.';
    if not qryVdPvVdVuplNR.IsNull and (qryVdPvVdVuplNR.AsInteger > 0) then begin
      nVdVuplNR := qryVdPvVdVuplNR.AsInteger;
      cMsg := cMsg + #13#10 + '    Будут также удалены из отклонений' +
                     #13#10 + 'записи о выплатах на кассу (вид 7509),' +
                     #13#10 + 'введенные этим пакетом';
    end;
    cMsg := cMsg + #13#10 +
            '                                                   Согласны?:'; end
  else
    cMsg := 'Запись удаляется безвозвратно.   Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbNo, mbYes], 0) = mrYes then
                                                       with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from Z_VdPV where (DtProc = :dDtProc) and ' +
                                       ' (NrVdPv = :nNrVdPv)');
    ParamByName('dDtProc').AsDateTime := qryVdPvDtProc.AsDateTime;
    ParamByName('nNrVdPv').AsInteger := qryVdPvNrVdPv.AsInteger;
    ExecSQL;
    { Остальное должен сделать триггер Z_VDPV_BD:
      CREATE TRIGGER Z_VDPV_BD FOR Z_VDPV BEFORE DELETE POSITION 0 as
      begin
       if (not z_VdPV.NrVdPV is null) then
        Delete from z_Otkl where (z_Otkl.NrVdPV = z_VdPV.NrVdPV);
      end}
    SQL.Clear;
    if nVdVuplNR <> 0 then begin
      // удалить из Z_VedNR запись с VedNR = nVdVuplNR, а записи
      // с таким же NrVdPV (с видом 7509) удалит триггер Z_VEDNR_BD
      DataBaseName := CESMAIN;
      SQL.Add('Delete from Z_VedNR where (DtProc = :dDtProc) and ' +
                                       ' (VedNr = :nVdVuplNR)');
      ParamByName('dDtProc').AsDateTime := qryVdPvDtProc.AsDateTime;
      ParamByName('nVdVuplNR').AsInteger := nVdVuplNR;
      ExecSQL;
      { Остальное должен сделать триггер Z_VEDNR_BD:
       CREATE TRIGGER Z_VEDNR_BD FOR Z_VEDNR BEFORE DELETE POSITION 0 as
        begin
         if (not z_VedNR.VedNR is null) then
          Delete from z_Otkl where (z_Otkl.NrVdPV = z_VedNR.VedNR);
        end}
    end;
    SQL.Clear;
    DataBaseName := '';
    OpenQryVdPV(d_DtProc);
    OpenQryOtkl(qryVdPvDtProc.AsDateTime, qryVdPvNrVdPv.AsInteger);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popVdPvDelMegVedClick(Sender: TObject);
var cMsg : string;
begin
  if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
    cMsg := 'Будут безвозвратно удалены все записи, введен-' + #13#10 +
            'ные в отклонения данной ведомостью.  Согласны?:'
  else
    cMsg := 'Запись удаляется безвозвратно.   Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then
                                                       with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from Z_VdPV where (DtProc = :dDtProc) and ' +
                                       ' (NrVdPv = :nNrVdPv)');
    ParamByName('dDtProc').AsDateTime := qryVdPvDtProc.AsDateTime;
    ParamByName('nNrVdPv').AsInteger := qryVdPvNrVdPv.AsInteger;
    ExecSQL;  // остальное должен сделать триггер в Es_Zpl.gdb
    SQL.Clear;
    DataBaseName := '';
    OpenQryVdPV(d_DtProc);
    OpenQryOtkl(qryVdPvDtProc.AsDateTime, qryVdPvNrVdPv.AsInteger);
  end;end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrOtkl.Canvas do begin
    if not (gdFocused in State) then begin
      if (Column.FieldName = 'SUMMA') then begin
        Column.Title.Font.Style := [fsBold];
        Column.Font.Style := [fsBold];
        if (Column.Field.Value < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText; end
      else begin
        if qryOtklPBnk.AsInteger > 0 then
          Font.Color := clTeal
        else
          Font.Color := clWindowText;
      end;
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnBack3Click(Sender: TObject);
begin
  PageControl.ActivePage := ts1;
  Caption := cCap1;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnPrt3Click(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnPrt3.Top + 76;
  Y := Left + sBtnPrt3.Left + 8;
  popPrt.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnPrt4Click(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnPrt4.Top + 55;
  Y := Left + sBtnPrt4.Left + 7;
  popPrt.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnPrt5MvClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnPrt5Mv.Top + 55;
  Y := Left + sBtnPrt5Mv.Left + 7;
  popPrt.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnApply3Click(Sender: TObject);
var nSvNR, nNrVdPV  : integer; dDtVdPV : TDateTime;
begin
  nNrVdPV := DmMain.NewVedNR; // Это уже "физическая" ведомость - присваиваю
  dDtVdPv := Date;             // настоящие nNrVdPv и dDtVdPv
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Otkl (KDSPS, DTPROC, ZAMESGOD, TABN, VIDN, ' +
            ' SUMMA, KDOBJ, KDKATP, PDN, KDSPZ, NOTES, PRPV, KTO, ' +
            ' DTVDPV, NRVDPV, MYNOTES, PBNK) values (:nKdSps, ' +
            ' :dDtProc, :dZaMesGod, :nTabN, :cVidN, :nSumma, :nKdObj, ' +
            ' :nKdKatP, :nPdN, :nKdSpz, :cNotes, :nPRPV, :nKTO, ' +
            ' :dDtVdPV, :nNrVdPV, :cMyNotes, :nPBNK)');
    Prepare;
  end;
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_NU (KDSPS, DTPROC, ZAMESGOD, TABN, VIDN, ' +
            ' SUMMA, KDOBJ, KDKATP, PDN, KDSPZ, NOTES, PRPV, KTO, ' +
            ' MYNOTES) values (:nKdSps, ' +
            ' :dDtProc, :dZaMesGod, :nTabN, :cVidN, :nSumma, :nKdObj, ' +
            ' :nKdKatP, :nPdN, :nKdSpz, :cNotes, :nPRPV, :nKTO, :cMyNotes)');
    // Надо еще как-то добавить СпецНР и Спец_РС TYTYTYTYT
    Prepare;
  end;
  with cdsVed do begin
    nSvNR := cdsVedNR.AsInteger;
    First;
    while not Eof do begin
      if cdsVedSmOper.AsFloat > 0 then begin
        qryTmp.ParamByName('nKdSps').AsInteger := n_KdSps;
        qryTmp.ParamByName('dDtProc').AsDateTime := d_DtProc;
        qryTmp.ParamByName('dZaMesGod').AsDateTime := d_DtProc;
        qryTmp.ParamByName('nTabN').AsInteger := cdsVedTabN.AsInteger;
        qryTmp.ParamByName('cVidN').AsString := '7509'; // "летучки" в кассу
        qryTmp.ParamByName('nSumma').AsFloat := -cdsVedSmOper.AsFloat;
        qryTmp.ParamByName('nKdObj').AsInteger := cdsVedKdObj.AsInteger;
        qryTmp.ParamByName('nKdKatP').AsInteger := cdsVedKdKatP.AsInteger;
        qryTmp.ParamByName('nPdN').AsInteger := cdsVedPdn.AsInteger;
        qryTmp.ParamByName('nKdSpz').AsInteger := cdsVedKdSpZ.AsInteger;
        qryTmp.ParamByName('cNotes').AsString := '';
        qryTmp.ParamByName('nPRPV').AsInteger := 1;
        qryTmp.ParamByName('nKTO').AsInteger := n_KdUsr;
        qryTmp.ParamByName('dDtVdPV').AsDateTime := dDtVdPV;
        qryTmp.ParamByName('nNrVdPV').AsInteger := nNrVdPV;
        qryTmp.ParamByName('cMyNotes').AsString :=  'Вед. ' +
                                            IntToStr(qryVdPvNrVdPv.AsInteger);
        qryTmp.ParamByName('nPBNK').AsInteger := 1;
        qryTmp.ExecSQL;

        qryTmp2.ParamByName('nKdSps').AsInteger := n_KdSps;
        qryTmp2.ParamByName('dDtProc').AsDateTime := d_DtProc;
        qryTmp2.ParamByName('dZaMesGod').AsDateTime := d_DtProc;
        qryTmp2.ParamByName('nTabN').AsInteger := cdsVedTabN.AsInteger;
        qryTmp2.ParamByName('cVidN').AsString := '7509'; // "летучки" в кассу
        qryTmp2.ParamByName('nSumma').AsFloat := -cdsVedSmOper.AsFloat;
        qryTmp2.ParamByName('nKdObj').AsInteger := cdsVedKdObj.AsInteger;
        qryTmp2.ParamByName('nKdKatP').AsInteger := cdsVedKdKatP.AsInteger;
        qryTmp2.ParamByName('nPdN').AsInteger := cdsVedPdn.AsInteger;
        qryTmp2.ParamByName('nKdSpz').AsInteger := cdsVedKdSpZ.AsInteger;
        qryTmp2.ParamByName('cNotes').AsString := '';
        qryTmp2.ParamByName('nPRPV').AsInteger := 1;
        qryTmp2.ParamByName('nKTO').AsInteger := n_KdUsr;
        qryTmp2.ParamByName('cMyNotes').AsString :=  'Вед. ' +
                                            IntToStr(qryVdPvNrVdPv.AsInteger);
        qryTmp2.ExecSQL;
      end;
      Next;
    end;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
  end;
  sBtnApply3.Enabled := false;
  with qryTmp do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_VedNR (DtProc, KdSps, TypeVed, VedNr, VedDate, ' +
          ' PrPodkl, BnkNmPrdF, KssVedNr, KssVedDt, KssVedNm, Notes) values ' +
          ' (:dDtProc, :nKdSps, :cTypeVed, :nVedNR, :dVedDate, :nPrPodkl, ' +
          ' :cBnkNmPrdF, :nKssVedNr, :dKssVedDt, :cKssVedNm, :cNotes)');
    ParamByName('dDtProc').AsDateTime  := d_DtProc;
    ParamByName('nKdSps').AsInteger    := n_KdSps;
    ParamByName('cTypeVed').AsString   := 'VedMgKss';
    ParamByName('nVedNR').AsInteger    := nNrVdPV;
    ParamByName('dVedDate').AsDateTime := dDtVdPV;
    ParamByName('nPrPodkl').AsInteger  := 7;
    ParamByName('cBnkNmPrdF').AsString := 'МежВед (на банк таких не бывает)';
    ParamByName('nKssVedNr').AsInteger := 0;
    ParamByName('dKssVedDt').AsDateTime := dDtVdPV;
    ParamByName('cKssVedNm').AsString := 'Введите назначение платежа';
    ParamByName('cNotes').AsString := 'МВ';
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryVdPv do begin
    Edit;
    qryVdPvVdVuplNR.AsInteger := nNrVdPV;
    Post;
    ApplyUpdates;
  end;
  with qryTmp2 do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  ShwMegVed;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgrVedDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cUpper : ShortString;
begin
  with dbgrVed.Canvas do begin
    if not (gdFocused in State) then begin
      cUpper := AnsiUpperCase(Column.FieldName);
      if (cUpper = 'SMOPER') or (cUpper = 'SMOSTNARUKI') then begin
        Font.Style := [fsBold];
        if (cUpper = 'SMOPER') then
          Font.Color := clWindowText
        else begin
          if Column.Field.AsFloat < 0 then
            Font.Color := clRed
          else
            Font.Color := clWindowText;
        end; end
      else if (cUpper = 'SMNACHVIDA') or (cUpper = 'SMUDRGVIDA') or
                                    (cUpper = 'SMVUPLVIDA') then begin
        Font.Style := [];
        Font.Color := clNavy; end
      else if (cUpper = 'SPZ') then begin
        Font.Style := [fsBold];
        Font.Color := clNavy; end
      else begin
        Font.Style := [];
        Font.Color := clWindowText;
      end;
    end;
  end;
  dbgrVed.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popVdPvShwMegVedClick(Sender: TObject);
begin
  ShwMegVed;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.ShwMegVed;
var nSmTt, nSmBudg, nSmBlnBudg, nSmSpec, nSmBlnSpec : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, o.* from ViOtkl o ' +
            ' Left outer join z_upi u on u.TabN = o.TabN ' +
            ' where o.DtProc = :dDtProc and o.NrVdPv = :nVdVuplNR ' +
            ' order by o.tabn, o.vidn');
    ParamByName('dDtProc').AsDateTime := qryVdPvDtProc.AsDateTime;
    ParamByName('nVdVuplNR').AsInteger := qryVdPvVdVuplNR.AsInteger;
  end;
  dspTmp.DataSet := qryTmp;
  cdsMegVed.ProviderName := 'dspTmp';
  with cdsMegVed do begin
    if Active then Close;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSCH, PRR, Sum(Summa) as SMM from ViOtkl ' +
            ' where DtProc = :dDtProc and NrVdPv = :nVdVuplNR ' +
            ' group by PSCH, PRR');
    ParamByName('dDtProc').AsDateTime := qryVdPvDtProc.AsDateTime;
    ParamByName('nVdVuplNR').AsInteger := qryVdPvVdVuplNR.AsInteger;
    Open;
    nSmTt := 0;
    nSmBudg := 0;
    nSmBlnBudg := 0;
    nSmSpec := 0;
    nSmBlnSpec := 0;
    while not Eof do begin
      nSmTt := nSmTt - FieldByName('SMM').AsFloat;
      if FieldByName('PSCH').AsString = '801' then begin
        if FieldByName('PRR').AsInteger = 1 then
          nSmBlnBudg := nSmBlnBudg - FieldByName('SMM').AsFloat
        else
          nSmBudg := nSmBudg - FieldByName('SMM').AsFloat; end
      else begin
        if FieldByName('PRR').AsInteger = 1 then
          nSmBlnSpec := nSmBlnSpec - FieldByName('SMM').AsFloat
        else
          nSmSpec := nSmSpec - FieldByName('SMM').AsFloat;
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
    LabelSmTt.Caption := FloatToStrF(nSmTt, ffCurrency, 18, 2);
    LabelSmBudg.Caption := FloatToStrF(nSmBudg, ffCurrency, 18, 2);
    LabelSmBlnBudg.Caption := FloatToStrF(nSmBlnBudg, ffCurrency, 18, 2);
    LabelSmSpec.Caption := FloatToStrF(nSmSpec, ffCurrency, 18, 2);
    LabelSmBlnSpec.Caption := FloatToStrF(nSmBlnSpec, ffCurrency, 18, 2);
  end;
  PanelMegVedInf.Top := Round((ts4.Height - PanelMegVedInf.Height) / 2) + 28;
  PanelMegVedInf.Left := sBtnPrt4.Left;
  PageControl.ActivePage := ts4;
  Caption := cCap4;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnBack4Click(Sender: TObject);
begin
  cdsMegVed.Close;
  PageControl.ActivePage := ts1;
  Caption := cCap1;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.cdsMegVedCalcFields(DataSet: TDataSet);
begin
  cdsMegVedFamIO.AsString := MyFamIO(cdsMegVedFam.AsString,
                                cdsMegVedIma.AsString, cdsMegVedOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.ts4Resize(Sender: TObject);
begin
  PanelMegVedInf.Top := Round((ts4.Height - PanelMegVedInf.Height) / 2) + 28;
  PanelMegVedInf.Left := sBtnPrt4.Left;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popOneVedClick(Sender: TObject);
var nCase, nKssVedNR : SmallInt; dKssVedDt : TDateTime; cKssVedNm : ShortString;
begin
  Application.ProcessMessages;
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VedNR where VedNr = :nVedNR');
    ParamByName('nVedNR').AsInteger := qryVdPVVdVuplNr.AsInteger;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct bl.KdBnk, bl.LicSch, bl.DtBeg, ' +
            ' u.Fam, u.Ima, u.Otch, o.NR, o.TabN, o.DtProc, ' +
            ' o.VidN, o.ShVidN, o.Summa, ' +
            ' o.PSCH, o.SchBU, o.KEKV, o.PRR, o.DtVdPV, o.NrVdPV, o.PBnk ' +
            ' from ViOtkl_Sps o ' +
            ' Left outer join z_Get_BnkLS(o.TabN, :dDtVdPV) bl on 1 = 1 ' +
            ' Left outer join z_Upi u on u.TabN = o.TabN ' +
            ' where o.dtProc = :dDtProc and o.NrVdPV = :nNrVdPV and ' +
            'o.VidN = "7509" order by o.TabN');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('dDtVdPV').AsDateTime := qryVdPVDtVdPV.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    AddIndex('OnFamIO', 'Fam;Ima;Otch', []);
    IndexName := 'OnFamIO';
    First;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'KssFIO.cds');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет записей для кассы')
  else begin
    nKssVedNR := qryVedKssVedNr.AsInteger;
    dKssVedDt := qryVedKssVedDt.AsDateTime;
    cKssVedNm := qryVedKssVedNm.AsString;
    nCase := 1; // одной ведомостью
    if GetDopKssInf(nCase, nKssVedNR, dKssVedDt, cKssVedNm) {z_DpInfK} then begin
      Application.ProcessMessages;
      if qryVedKssVedNr.IsNull or (qryVedKssVedNr.AsInteger = 0) then begin
        qryVed.Edit;
        qryVedKssVedNr.AsInteger := nKssVedNR;
        qryVedKssVedDt.AsDateTime := dKssVedDt;
        qryVedKssVedNm.AsString := cKssVedNm;
        qryVed.Post;
        qryVed.ApplyUpdates;
      end;
      F6PrtVedKssOne(cdsPrt, nKssVedNR, dKssVedDt, cKssVedNm);  {z_CmnPrt}
    end;
  end;
  if cdsPrt.Active then
    cdsPrt.Close;
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popByObjVedClick(Sender: TObject);
var nCase, nKssVedNR : SmallInt; dKssVedDt : TDateTime; cKssVedNm : ShortString;
    dVedDtProc, dDtNews : TDateTime;
begin
  Application.ProcessMessages;
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VedNR where VedNr = :nVedNR');
    ParamByName('nVedNR').AsInteger := qryVdPVVdVuplNr.AsInteger;
    Open;
  end;
  dDtNews := EncodeDate(2007, 12, 1); // Начало работы с новой схемой Z_SPS
  dVedDtProc := qryVedDtProc.AsDateTime;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if dVedDtProc < dDtNews then
      SQL.Add('Select bl.KdBnk, bl.LicSch, bl.DtBeg, u.Fam, u.Ima, u.Otch, ' +
              ' o.* from ViOtkl_Sps o ' +
              ' Left outer join Z_GET_BNKLS(o.TabN, :dBnkDtPrdF) bl on 1 = 1 ' +
              ' Left outer join z_Upi u on u.TabN = o.TabN ' +
              ' where o.dtProc = :dDtProc and o.NrVdPV = :nNrVdPV and ' +
              ' o.VidN = "7509" order by o.TabN') // Вид 7509 - расх.ордер
    else // в БД добавил просмотр ViOtkl_SpsNew, в Z_Sps в поле OldKdObj
         // записывется основной KdObj по Z_Pere на последнее число месяца
      SQL.Add('Select distinct bl.KdBnk, bl.LicSch, bl.DtBeg, ' +
              ' u.Fam, u.Ima, u.Otch, o.NR, o.OldKdObj_Sps as KdObj_Sps, ' +
              ' o.TabN, o.DtProc, o.VidN, o.ShVidN, o.Summa, ' +
              ' o.PSCH, o.SchBU, o.KEKV, o.PRR, o.DtVdPV, o.NrVdPV, o.PBnk ' +
              ' from ViOtkl_SpsNew o ' +
              ' Left outer join Z_GET_BNKLS(o.TabN, :dBnkDtPrdF) bl on 1 = 1 ' +
              ' Left outer join z_Upi u on u.TabN = o.TabN ' +
              ' where o.dtProc = :dDtProc and o.KdObj_Sps = o.OldKdObj_Sps ' +
              ' and o.NrVdPV = :nNrVdPV and ' +
              ' o.VidN = "7509" order by o.TabN'); // Вид 7509 - расх.ордер
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('dBnkDtPrdF').AsDateTime := qryVedBnkDtPrdF.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    AddIndex('OnObjFamIO', 'KdObj_Sps;Fam;Ima;Otch', []);
    IndexName := 'OnObjFamIO';
    First;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'KsObjFIO.cds');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет записей для кассы')
  else begin
    nKssVedNR := qryVedKssVedNr.AsInteger;
    dKssVedDt := qryVedKssVedDt.AsDateTime;
    cKssVedNm := qryVedKssVedNm.AsString;
    nCase := 2;  // ведомости с разделением по подразделениям
    if GetDopKssInf(nCase, nKssVedNR, dKssVedDt, cKssVedNm) {z_DpInfK} then begin
      Application.ProcessMessages;
      if qryVedKssVedNr.IsNull or (qryVedKssVedNr.AsInteger = 0) then begin
        qryVed.Edit;
        qryVedKssVedNr.AsInteger := nKssVedNR;
        qryVedKssVedDt.AsDateTime := dKssVedDt;
        qryVedKssVedNm.AsString := cKssVedNm;
        qryVed.Post;
        qryVed.ApplyUpdates;
      end;
      F6PrtVedKssByObj(cdsPrt, nKssVedNR, dKssVedDt, cKssVedNm);
    end;
  end;
  if cdsPrt.Active then
    cdsPrt.Close;
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popByObjReeClick(Sender: TObject);
var nKssVedNR : SmallInt; dKssVedDt : TDateTime; cKssVedNm : ShortString;
    dVedDtProc, dDtNews : TDateTime;
begin
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VedNR where VedNr = :nVedNR');
    ParamByName('nVedNR').AsInteger := qryVdPVVdVuplNr.AsInteger;
    Open;
  end;
  dDtNews := EncodeDate(2007, 12, 1); // Начало работы с новой схемой Z_SPS
  dVedDtProc := qryVedDtProc.AsDateTime;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if dVedDtProc < dDtNews then  {Начало работы с новой схемой Z_SPS}
      SQL.Add('Select o.KdObj_Sps, ko.NmObj, o.PSch, o.PRR, ' +
              ' Sum(o.Summa) as SMM from ViOtkl_Sps o ' +
              ' Left Outer Join z_KdObj ko on ko.KdObj = o.KdObj_Sps ' +
              ' where o.dtProc = :dDtProc and o.NrVdPV = :nNrVdPV and ' +
              ' o.VidN = "7509" ' +        // "7509" - расх.ордер
              ' group by o.KdObj_Sps, ko.NmObj, o.PSch, o.Prr ')
    else
      SQL.Add('Select o.OldKdObj_Sps as KdObj_Sps, ko.NmObj, o.PSch, o.PRR, ' +
              ' Sum(o.Summa) as SMM from ViOtkl_SpsNew o ' +
              ' Left Outer Join z_KdObj ko on ko.KdObj = o.OldKdObj_Sps ' +
              ' where o.dtProc = :dDtProc and o.KdObj_Sps = o.OldKdObj_Sps ' +
              ' and o.NrVdPV = :nNrVdPV and ' +
              ' o.VidN = "7509" ' +        // "7509" - расх.ордер
              ' group by o.OldKdObj_Sps, ko.NmObj, o.PSch, o.Prr ');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    AddIndex('OnObjSpsPSch', 'KdObj_Sps;PSch', []);
    IndexName := 'OnObjSpsPSch';
    First;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'ObjPSch.cds');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет кассовых записей для реестра')
  else begin
    nKssVedNR := qryVedKssVedNr.AsInteger;
    dKssVedDt := qryVedKssVedDt.AsDateTime;
    cKssVedNm := qryVedKssVedNm.AsString;
    F6PrtVedKssReeByObj(cdsPrt, nKssVedNR, dKssVedDt, cKssVedNm);
  end;
  if cdsPrt.Active then
    cdsPrt.Close;
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popByObjZvitClick(Sender: TObject);
var nKssVedNR : SmallInt; dKssVedDt : TDateTime; cKssVedNm : ShortString;
    dVedDtProc, dDtNews : TDateTime;
begin
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VedNR where VedNr = :nVedNR');
    ParamByName('nVedNR').AsInteger := qryVdPVVdVuplNr.AsInteger;
    Open;
  end;
  dDtNews := EncodeDate(2007, 12, 1); // Начало работы с новой схемой Z_SPS
  dVedDtProc := qryVedDtProc.AsDateTime;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if dVedDtProc < dDtNews then  {Начало работы с новой схемой Z_SPS}
      SQL.Add('Select o.KdObj_Sps, ko.NmObj, o.PSch, o.PRR, ' +
              ' Sum(o.Summa) as SMM from ViOtkl_Sps o ' +
              ' Left Outer Join z_KdObj ko on ko.KdObj = o.KdObj_Sps ' +
              ' where o.dtProc = :dDtProc and o.NrVdPV = :nNrVdPV and ' +
              ' o.VidN = "7509" ' +        // "7509" - расх.ордер
              ' group by o.KdObj_Sps, ko.NmObj, o.PSch, o.Prr ')
    else
      SQL.Add('Select o.OldKdObj_Sps as KdObj_Sps, ko.NmObj, o.PSch, o.PRR, ' +
              ' Sum(o.Summa) as SMM from ViOtkl_SpsNew o ' +
              ' Left Outer Join z_KdObj ko on ko.KdObj = o.OldKdObj_Sps ' +
              ' where o.dtProc = :dDtProc and o.KdObj_Sps = o.OldKdObj_Sps ' +
              ' and o.NrVdPV = :nNrVdPV and ' +
              ' o.VidN = "7509" ' +        // "7509" - расх.ордер
              ' group by o.OldKdObj_Sps, ko.NmObj, o.PSch, o.Prr ');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dsptMP.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dsptMP';
    Open;
    AddIndex('OnObjSpsPSch', 'KdObj_Sps;PSch', []);
    IndexName := 'OnObjSpsPSch';
    First;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет кассовых записей для отчета')
  else begin
    nKssVedNR := qryVedKssVedNr.AsInteger;
    dKssVedDt := qryVedKssVedDt.AsDateTime;
    cKssVedNm := qryVedKssVedNm.AsString;
    F6PrtVedKssZvitByObj(cdsPrt, nKssVedNR, dKssVedDt, cKssVedNm);
  end;
  if cdsPrt.Active then
    cdsPrt.Close;
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then begin
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где нужно, пользуйтесь контекстными меню');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popVdPvAddMegVedClick(Sender: TObject);
var nNewVedNR : integer; bMegVed : boolean;
begin
  bMegVed := true;
  cPredVidN   := '';
  cPredShVidN := '';
  cPredNotes  := '';
  cPredDtBeg  := '';
  cPredDtEnd  := '';
  cPredSumma  := '';
  nNewVedNr := NewVedNr;
  bVvodMegVed := true; // вводиттся не пакет отклонений,
          // а "прямая" ведомость межВыплат с видом 7509 РасхОрдер (старый 367)
  AddRecInVdPV(nNewVedNR, n_KdUsr, d_DtProc, Date, bMegVed);
  Caption := 'Ввод "прямой" ведомости межвыплат';
  PageControl.ActivePage := ts5_MegVed;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popVdPvEdtMegVedClick(Sender: TObject);
begin
  bVvodMegVed := true; // редактируется не пакет отклонений,
          // а "прямая" ведомость межВыплат с видом 7509 РасхОрдер (старый 367)
  Caption := 'Редактирование "прямой" ведомости межвыплат';
  PageControl.ActivePage := ts5_MegVed;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnBack5Click(Sender: TObject);
begin
  bVvodMegVed := false; // выключаю режим ввода "прямой" ведомости
  PageControl.ActivePage := ts1;
  Caption := cCap1;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.PageControlResize(Sender: TObject);
begin
  PanelMsgMegVed.Top := Round((Panel5_Right.Height -
                                PanelMsgMegVed.Height) / 2) + 10;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgrOtklMVEditButtonClick(Sender: TObject);
var cFldNm, cSchBU, cDum : string; nKdSpZ : Integer; bHsCh : boolean;
begin
  with dbgrOtklMV do begin
    cFldNm := UpperCase(SelectedField.FieldName);
    if (cFldNm = 'KDSPZ') or (cFldNm = 'SPZ') then begin
      nKdSpZ := DataSource.DataSet.FieldByName('KdSpZ').AsInteger;
      cSchBU := DataSource.DataSet.FieldByName('SPZ').AsString;
      if GetSBU(nKdSpZ, cSchBU, cDum, cDum, bHsCh) {A_SBU} then begin
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('KdSPZ').AsInteger := nKdSpZ;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgrOtklMVDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrOtklMV.Canvas do begin
    if not (gdFocused in State) then begin
      if (Column.FieldName = 'SUMMA') then begin
        Column.Title.Font.Style := [fsBold];
        Column.Font.Style := [fsBold];
        if (Column.Field.Value < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
      end;
    end;
  end;
  dbgrOtklMV.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.sBtnMsg5Click(Sender: TObject);
begin
  SetPanel5RightVisible;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.SetPanel5RightVisible;
begin
  Panel5_Right.Visible := sBtnMsg5.Down;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgr_OtklEditButtonClick(Sender: TObject);
var cNmFld : ShortString;
    nKdSBU : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  cNmFld := UpperCase(dbgr_Otkl.SelectedField.FieldName);
  if (cNmFld = 'KDSPZ') or (cNmFld = 'SPZ') then begin
    nKdSBU := tbl_OtklKdSpZ.AsInteger;
    if GetSBU(nKdSBU, cSchBU, cPSch, cNmSBU, bHsCh) {a_SBU} then begin
//      bReady := false;
      if not (tbl_Otkl.State in [dsInsert, dsEdit]) then
        tbl_Otkl.Edit;
      tbl_OtklKdSpZ.AsInteger  := nKdSBU;
//      bReady := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popTotalsByVidNClick(Sender: TObject);
var nSvNR, nCntRecTt : integer;
    cVidN : string4; cShVidN : ShortString;
    nSumma, nSmTt : double;
begin
  if pop.PopupComponent = dbgrOtkl then begin
    with cdsTotals do begin
      if Active then Close;
      IndexName := '';
      FieldDefs.Clear;
      IndexDefs.Clear;
      FieldDefs.Add('NR', ftAutoInc);
      FieldDefs.Add('VidN', ftString, 4);
      FieldDefs.Add('ShVidN', ftString, 15);
      FieldDefs.Add('NmVidN', ftString, 65);
      FieldDefs.Add('SMM', ftFloat);
      FieldDefs.Add('CntRec', ftInteger);
      IndexDefs.Add('OnVidN', 'VidN', []);
      CreateDataSet;
      Open;
      IndexName := 'OnVidN';
    end;
    with qryOtkl do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      nSmTt := 0;
      nCntRecTt := 0;
      while not Eof do begin
        cVidN := qryOtklVidN.AsString;
        cShVidN := qryOtklShVidN.AsString;
        nSumma := qryOtklSumma.AsFloat;
        Inc(nCntRecTt);
        nSmTt := nSmTt + nSumma;
        cdsTotalAddVidNInf(cVidN, cShVidN, nSumma);
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    with cdsTotals do begin
      Append;
      FieldByName('VidN').AsString := 'Итог';
      FieldByName('ShVidN').AsString := 'Итого:';
      FieldByName('SMM').AsFloat := nSmTt;
      FieldByName('CntRec').AsInteger := nCntRecTt;
      Post;
      FieldByName('VidN').DisplayLabel := 'ВидН';
      FieldByName('ShVidN').DisplayLabel := 'ШифрВида';
      FieldByName('NmVidN').DisplayLabel := 'Название вида';
      FieldByName('SMM').DisplayLabel := 'Сумма';
      (FieldByName('SMM') as TFloatField).DisplayFormat := '#,###.00';
      FieldByName('CntRec').DisplayLabel := 'Записей';
    end;
    ShwVidNTotals(cdsTotals); {z_VdVTts}
    with cdsTotals do begin
      if Active then Close;
      IndexName := '';
      FieldDefs.Clear;
      IndexDefs.Clear;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.cdsTotalAddVidNInf(cVidN : string4;
                                        cShVidN : ShortString; nSumma : double);
var cNmVidN, cDummy : string;
begin
  with cdsTotals do begin
    EditKey;
    FieldByName('VidN').AsString := cVidN;
    if not GotoKey then begin
      Append;
      FieldByName('VidN').AsString := cVidN;
      FieldByName('ShVidN').AsString := cShVidN;
      cDummy := DmMain.VidN2ShVidN(cVidN, cNmVidN);
      FieldByName('NmVidN').AsString := cNmVidN; end
    else
      Edit;
    FieldByName('SMM').AsFloat := FieldByName('SMM').AsFloat + nSumma;
    FieldByName('CntRec').AsInteger := FieldByName('CntRec').AsInteger + 1;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popTotalsBySpZClick(Sender: TObject);
var nSvNR, nKdSpZ, nCntRecTt : integer;
    cSPZ : ShortString;
    nSumma, nSmTt : double;
begin
  if pop.PopupComponent = dbgrOtkl then begin
    with cdsTotals do begin
      if Active then Close;
      IndexName := '';
      FieldDefs.Clear;
      IndexDefs.Clear;
      FieldDefs.Add('NR', ftAutoInc);
      FieldDefs.Add('KdSpZ', ftSmallint);
      FieldDefs.Add('SPZ', ftString, 10);
      FieldDefs.Add('NmSch', ftString, 65);
      FieldDefs.Add('SMM', ftFloat);
      FieldDefs.Add('CntRec', ftInteger);
      IndexDefs.Add('OnSPZ', 'SPZ', []);
      CreateDataSet;
      Open;
      IndexName := 'OnSPZ';
    end;
    with qryOtkl do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      nSmTt := 0;
      nCntRecTt := 0;
      while not Eof do begin
        nKdSpZ := qryOtklKdSpZ.AsInteger;
        cSPZ   := qryOtklSchBU.AsString;
        nSumma := qryOtklSumma.AsFloat;
        Inc(nCntRecTt);
        nSmTt := nSmTt + nSumma;
        cdsTotalAddSpzInf(nKdSpZ, cSPZ, nSumma);
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    with cdsTotals do begin
      Append;
      FieldByName('SPZ').AsString := 'Итог';
      FieldByName('NmSch').AsString := 'Итого:';
      FieldByName('SMM').AsFloat := nSmTt;
      FieldByName('CntRec').AsInteger := nCntRecTt;
      Post;
      FieldByName('KdSpZ').DisplayLabel := 'КодСч';
      FieldByName('SPZ').DisplayLabel   := 'СчБУ';
      FieldByName('NmSch').DisplayLabel := 'Название счета';
      FieldByName('SMM').DisplayLabel   := 'Сумма';
      (FieldByName('SMM') as TFloatField).DisplayFormat := '#,###.00';
      FieldByName('CntRec').DisplayLabel := 'Записей';
    end;
    ShwSpZTotals(cdsTotals); {z_VdVTts}
    with cdsTotals do begin
      if Active then Close;
      IndexName := '';
      FieldDefs.Clear;
      IndexDefs.Clear;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.cdsTotalAddSpzInf(nKdSpZ : SmallInt; cSPZ : ShortString;
                                                              nSumma : double);
begin
  with cdsTotals do begin
    EditKey;
    FieldByName('SPZ').AsString := cSPZ;
    if not GotoKey then begin
      Append;
      FieldByName('KdSpZ').AsInteger := nKdSpZ;
      FieldByName('SPZ').AsString    := cSPZ;
      FieldByName('NmSch').AsString  := Form_Dm.KdSbu2NmSbu(nKdSpZ); end
    else
      Edit;
    FieldByName('SMM').AsFloat := FieldByName('SMM').AsFloat + nSumma;
    FieldByName('CntRec').AsInteger := FieldByName('CntRec').AsInteger + 1;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popTotalsByObjClick(Sender: TObject);
var nSvNR, nKdObj, nCntRecTt : integer;
    cShObj : ShortString;
    nSumma, nSmTt : double;
begin
  if pop.PopupComponent = dbgrOtkl then begin
    with cdsTotals do begin
      if Active then Close;
      IndexName := '';
      FieldDefs.Clear;
      IndexDefs.Clear;
      FieldDefs.Add('NR', ftAutoInc);
      FieldDefs.Add('KdObj', ftSmallint);
      FieldDefs.Add('ShObj', ftString, 15);
      FieldDefs.Add('NmObj', ftString, 65);
      FieldDefs.Add('SMM', ftFloat);
      FieldDefs.Add('CntRec', ftInteger);
      IndexDefs.Add('OnKdObj', 'KdObj', []);
      CreateDataSet;
      Open;
      IndexName := 'OnKdObj';
    end;
    with qryOtkl do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      nSmTt := 0;
      nCntRecTt := 0;
      while not Eof do begin
        nKdObj := qryOtklKdObj.AsInteger;
        cShObj := qryOtklShObj.AsString;
        nSumma := qryOtklSumma.AsFloat;
        Inc(nCntRecTt);
        nSmTt := nSmTt + nSumma;
        cdsTotalAddObjInf(nKdObj, cShObj, nSumma);
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    with cdsTotals do begin
      Append;
      FieldByName('KdObj').AsInteger := 32000;
      FieldByName('ShObj').AsString := 'Итог';
      FieldByName('NmObj').AsString := 'Итого:';
      FieldByName('SMM').AsFloat := nSmTt;
      FieldByName('CntRec').AsInteger := nCntRecTt;
      Post;
      FieldByName('KdObj').DisplayLabel := 'КодПдр';
      FieldByName('ShObj').DisplayLabel := 'ШфрПдр';
      FieldByName('NmObj').DisplayLabel := 'Название подразд.';
      FieldByName('SMM').DisplayLabel   := 'Сумма';
      (FieldByName('SMM') as TFloatField).DisplayFormat := '#,###.00';
      FieldByName('CntRec').DisplayLabel := 'Записей';
    end;
    ShwObjTotals(cdsTotals); {z_VdVTts}
    with cdsTotals do begin
      if Active then Close;
      IndexName := '';
      FieldDefs.Clear;
      IndexDefs.Clear;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.cdsTotalAddObjInf(nKdObj : integer; cShObj : ShortString;
                                                              nSumma : double);
var cNmObj, cDummy : string;
begin
  with cdsTotals do begin
    EditKey;
    FieldByName('KdObj').AsInteger := nKdObj;
    if not GotoKey then begin
      Append;
      FieldByName('KdObj').AsInteger := nKdObj;
      FieldByName('ShObj').AsString  := cShObj;
      cDummy := DmMain.KdObj2ShObj(nKdObj, cNmObj);
      FieldByName('NmObj').AsString  := cNmObj; end
    else
      Edit;
    FieldByName('SMM').AsFloat := FieldByName('SMM').AsFloat + nSumma;
    FieldByName('CntRec').AsInteger := FieldByName('CntRec').AsInteger + 1;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popTotalsByKatPClick(Sender: TObject);
var nSvNR, nKdKatP, nCntRecTt : integer; {i : SmallInt;}
    cShKatP : ShortString;
    nSumma, nSmTt : double;
begin
  if pop.PopupComponent = dbgrOtkl then begin
    with cdsTotals do begin
      if Active then Close;
      IndexName := '';
      FieldDefs.Clear;
      IndexDefs.Clear;
      FieldDefs.Add('NR', ftAutoInc);
      FieldDefs.Add('KdKatP', ftSmallint);
      FieldDefs.Add('ShKatP', ftString, 15);
      FieldDefs.Add('NmKatP', ftString, 35);
      FieldDefs.Add('SMM', ftFloat);
      FieldDefs.Add('CntRec', ftInteger);
      IndexDefs.Add('OnKdKatP', 'KdKatP', []);
      CreateDataSet;
      Open;
      IndexName := 'OnKdKatP';
    end;
    with qryOtkl do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      nSmTt := 0;
      nCntRecTt := 0;
      while not Eof do begin
        nKdKatP := qryOtklKdKatP.AsInteger;
        cShKatP := qryOtklShKatP.AsString;
        nSumma  := qryOtklSumma.AsFloat;
        Inc(nCntRecTt);
        nSmTt := nSmTt + nSumma;
        cdsTotalAddKatInf(nKdKatP, cShKatP, nSumma);
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    with cdsTotals do begin
      Append;
      FieldByName('KdKatP').AsInteger := 32000;
      FieldByName('ShKatP').AsString := 'Итог';
      FieldByName('NmKatP').AsString := 'Итого:';
      FieldByName('SMM').AsFloat := nSmTt;
      FieldByName('CntRec').AsInteger := nCntRecTt;
      Post;
      FieldByName('KdKatP').DisplayLabel := 'КодКтгр';
      FieldByName('ShKatP').DisplayLabel := 'ШфрКтгр';
      FieldByName('NmKatP').DisplayLabel := 'Название категории';
      FieldByName('SMM').DisplayLabel   := 'Сумма';
      (FieldByName('SMM') as TFloatField).DisplayFormat := '#,###.00';
      FieldByName('CntRec').DisplayLabel := 'Записей';
    end;
    ShwKatTotals(cdsTotals); {z_VdVTts}
    with cdsTotals do begin
      if Active then Close;
      IndexName := '';
      FieldDefs.Clear;
      IndexDefs.Clear;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.cdsTotalAddKatInf(nKdKatP : integer; cShKatP : ShortString;
                                                               nSumma : double);
var cNmKatP, cDummy : string;
begin
  with cdsTotals do begin
    EditKey;
    FieldByName('KdKatP').AsInteger := nKdKatP;
    if not GotoKey then begin
      Append;
      FieldByName('KdKatP').AsInteger := nKdKatP;
      FieldByName('ShKatP').AsString  := cShKatP;
      cNmKatP := DmMain.KdKatP2NmKatP(nKdKatP, cDummy);
      FieldByName('NmKatP').AsString  := cNmKatP; end
    else
      Edit;
    FieldByName('SMM').AsFloat := FieldByName('SMM').AsFloat + nSumma;
    FieldByName('CntRec').AsInteger := FieldByName('CntRec').AsInteger + 1;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popTbl_OtklSortByFIOClick(Sender: TObject);
begin
  if not popTbl_OtklSortByFIO.Checked then begin
    popTbl_OtklSortByFIO.Checked := true;
    popTbl_OtklSortByTabN.Checked := false;
    popTbl_OtklSortByVidN.Checked := false;
    popTbl_OtklSortByNR.Checked := false;
    SetTbl_OtklIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popTbl_OtklSortByTabNClick(Sender: TObject);
begin
  if not popTbl_OtklSortByTabN.Checked then begin
    popTbl_OtklSortByFIO.Checked := false;
    popTbl_OtklSortByTabN.Checked := true;
    popTbl_OtklSortByVidN.Checked := false;
    popTbl_OtklSortByNR.Checked := false;
    SetTbl_OtklIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popTbl_OtklSortByVidNClick(Sender: TObject);
begin
  if not popTbl_OtklSortByVidN.Checked then begin
    popTbl_OtklSortByFIO.Checked := false;
    popTbl_OtklSortByTabN.Checked := false;
    popTbl_OtklSortByVidN.Checked := true;
    popTbl_OtklSortByNR.Checked := false;
    SetTbl_OtklIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.popTbl_OtklSortByNRClick(Sender: TObject);
begin
  if not popTbl_OtklSortByNR.Checked then begin
    popTbl_OtklSortByFIO.Checked := false;
    popTbl_OtklSortByTabN.Checked := false;
    popTbl_OtklSortByVidN.Checked := false;
    popTbl_OtklSortByNR.Checked := true;
    SetTbl_OtklIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.dbgrMegVedDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cUpper : ShortString;
begin
  with dbgrMegVed.Canvas do begin
    if not (gdFocused in State) then begin
      cUpper := AnsiUpperCase(Column.FieldName);
      if (cUpper = 'SUMMA') then begin
        Font.Style := [fsBold];
        if Column.Field.Value < 0 then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
      end;
    end;
  end;
  dbgrMegVed.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.FldKdObjValidate(Sender: TField);
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
        Raise Exception.Create('Нет в справочнике подразделения ' + cText)
      else
        qryOtklShObj.AsString := cShObj;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.FldKdKatPValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean; var cShKatP : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := DmMain.IsKdKatPInDic(StrToInt(cText), cShKatP);
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике категории персонала ' + cText)
    else
      qryOtklShKatP.AsString := cShKatP;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklKDOBJValidate(Sender: TField);
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
        Raise Exception.Create('Нет в справочнике подразделения ' + cText)
      else
        qryOtklShObj.AsString := cShObj;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklKDKATPValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean; var cShKatP : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := DmMain.IsKdKatPInDic(StrToInt(cText), cShKatP);
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике категории персонала ' + cText)
    else
      qryOtklShKatP.AsString := cShKatP;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.qryOtklSchBUSetText(Sender: TField; const Text: String);
var cSchBU, cPSch : string; nKdSbu : integer; bHsCh : boolean;
begin
  cSchBU := Text;
  if cSchBU = '' then begin
    qryOtklKdSpZ.AsString := '';
    (Sender as TField).AsString := cSchBU; end
  else {if cSchBU > '' then} begin
    if CheckSBU(nKdSbu, cSchBU, cPSch, bHsCh) {a_SBU} then begin
      if not bHsCh then begin
        qryOtklKdSpZ.AsInteger := nKdSbu;
        (Sender as TField).AsString := cSchBU; end
      else
        Raise Exception.Create(
               'Выбранный счет имеет СубСчета - на него относить нельзя');
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdPV.CloseFormVvSotr(b_IsFormVbSotr: boolean);
begin
//  if  bIsFormVbSotr or b_IsFormVbSotr then
//    FormVbSotr.Close;
//.Close;
end;

end.

