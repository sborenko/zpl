unit z_VedV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Menus, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids,
  Math, DBTables, Provider, DBClient, DBCtrls, ComCtrls, Mask,
  z_VedVZd;

type
  String4 = String[4];

  TFormVedV = class(TForm)
    qryVed: TQuery;
    dsrcVed: TDataSource;
    qryVedNR: TIntegerField;
    qryVedDTPROC: TDateTimeField;
    qryVedKDSPS: TSmallintField;
    qryVedTYPEVED: TStringField;
    qryVedVEDNR: TIntegerField;
    qryVedVEDDATE: TDateTimeField;
    qryVedNOTES: TStringField;
    popVed: TPopupMenu;
    popHead: TMenuItem;
    popVedDel: TMenuItem;
    qryOtkl: TQuery;
    dsrcOtkl: TDataSource;
    updVed: TUpdateSQL;
    popVedEdt: TMenuItem;
    qryTmp: TQuery;
    updOtkl: TUpdateSQL;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    qryRS: TQuery;
    cdsPrt: TClientDataSet;
    dspPrt: TDataSetProvider;
    popPrt: TPopupMenu;
    popPrtKss: TMenuItem;
    popPrtHeadBnk: TMenuItem;
    popPrtBnkOneVed: TMenuItem;
    popPrtHeadKss: TMenuItem;
    qryVedPRPODKL: TSmallintField;
    popVedSep1: TMenuItem;
    popVedFon: TMenuItem;
    popVedFont: TMenuItem;
    PageControl: TPageControl;
    tsVeds: TTabSheet;
    PanelLeft: TPanel;
    LabelVedNr: TLabel;
    dbgrVed: TDBGrid;
    Splitter1: TSplitter;
    PanelTools: TPanel;
    sBtnAllMes: TSpeedButton;
    sBtnCurMes: TSpeedButton;
    sBtnPrt: TSpeedButton;
    sBtnApply: TSpeedButton;
    LabelCntOtklRec: TLabel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    dbgrOtkl: TDBGrid;
    tsVedCmn: TTabSheet;
    cdsPV: TClientDataSet;
    dsrcPV: TDataSource;
    cdsPVNR: TAutoIncField;
    cdsPVTabN: TIntegerField;
    cdsPVKdObj: TSmallintField;
    cdsPVFamIO: TStringField;
    cdsPVSmOsnV: TFloatField;
    cdsPVSmPrem: TFloatField;
    cdsPVSmOtpTM: TFloatField;
    cdsPVSmOtpBM: TFloatField;
    cdsPVSmOtpNI: TFloatField;
    cdsPVSmNach: TFloatField;
    cdsPVSmUdrg: TFloatField;
    cdsPVSmVupl: TFloatField;
    cdsPVSm_OsnV: TFloatField;
    cdsPVSm_Prem: TFloatField;
    cdsPVSm_OtpTM: TFloatField;
    cdsPVSm_OtpBM: TFloatField;
    cdsPVSm_OtpNI: TFloatField;
    cdsPVSm_Nach: TFloatField;
    cdsPVSmRasch: TFloatField;
    cdsPVSmOper: TFloatField;
    cdsPVSmOst: TFloatField;
    cdsPVSmBoln: TFloatField;
    cdsPVSm_Boln: TFloatField;
    cdsPVSmSocPsb: TFloatField;
    cdsPVSm_SocPsb: TFloatField;
    cdsPVK_t: TFloatField;
    cdsPVKdKatP: TSmallintField;
    cdsPVKdBnk: TSmallintField;
    cdsPVLS: TStringField;
    PanelTs2Tools: TPanel;
    sBtnSaveVedCmn: TSpeedButton;
    bBtnBack2: TBitBtn;
    DBNavigator3: TDBNavigator;
    SpeedButton2: TSpeedButton;
    sBtnSpisok: TSpeedButton;
    sBtnSumKVupl: TSpeedButton;
    sBtnShwZadanie: TSpeedButton;
    LabelDbg: TLabel;
    sBtnInfo: TSpeedButton;
    dbgrPv: TDBGrid;
    LbxObj: TListBox;
    LbxKatP: TListBox;
    PanelWait: TPanel;
    popVedAdd: TMenuItem;
    popPrtKssOneVed: TMenuItem;
    popPrtKssByObj: TMenuItem;
    qryVedBNKDTPRDF: TDateTimeField;
    qryVedBNKNRPRDF: TSmallintField;
    qryVedBNKNMPRDF: TStringField;
    qryVedKSSVEDDT: TDateTimeField;
    qryVedKSSVEDNR: TSmallintField;
    qryVedKSSVEDNM: TStringField;
    popPrtBnkByObj: TMenuItem;
    popPrtKssByObjRee: TMenuItem;
    popPrtKssByOtchet: TMenuItem;
    popPV: TPopupMenu;
    popPvSort: TMenuItem;
    popSortObjTabN: TMenuItem;
    popSortObjFio: TMenuItem;
    popSortTabN: TMenuItem;
    popSortFio: TMenuItem;
    LabelSortInfo: TLabel;
    qryVedKDUSR: TSmallintField;
    qryVedNmUsr: TStringField;
    qryTmp2: TQuery;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklSHVIDN: TStringField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklSCHBU: TStringField;
    qryOtklPSCH: TStringField;
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
    qryOtklFamIO: TStringField;
    qryOtklFAM: TStringField;
    qryOtklIMA: TStringField;
    qryOtklOTCH: TStringField;
    qryOtklKDBNK: TSmallintField;
    qryOtklLICSCH: TStringField;
    qryOtklDTBEG: TDateTimeField;
    LabelProcess: TLabel;
    popOtkl: TPopupMenu;
    popOtklHead: TMenuItem;
    popOtklSort: TMenuItem;
    popOtklFilter: TMenuItem;
    popOtklSortObjTabN: TMenuItem;
    popOtklSortObjFio: TMenuItem;
    popOtklSortTabN: TMenuItem;
    popOtklSortFio: TMenuItem;
    popOtklFilterOff: TMenuItem;
    popOtklFilterBnk: TMenuItem;
    popOtklFilterKss: TMenuItem;
    popOtklOther: TMenuItem;
    popPvSep1: TMenuItem;
    popPvDelRec: TMenuItem;
    popCreSps: TPopupMenu;
    popCreSpsBez: TMenuItem;
    popCreSpsWithPom: TMenuItem;
    popCreSpsCustom: TMenuItem;
    PanelCustInput: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    cdsPVNotInCurSps: TBooleanField;
    Label4: TLabel;
    LbxIsTabN: TListBox;
    LabelFilterBK: TLabel;
    tsVedDeti: TTabSheet;
    LbxVids: TListBox;
    popPvFilterBnk: TMenuItem;
    popPvFilterKss: TMenuItem;
    cdsFilterBK: TClientDataSet;
    cdsFilterBKNR: TAutoIncField;
    cdsFilterBKKdBnk: TSmallintField;
    cdsFilterBKShBnk: TStringField;
    cdsFilterBKNmBnk: TStringField;
    popPvFilterBK: TMenuItem;
    popPvFilterBKOff: TMenuItem;
    popPvShwNU: TMenuItem;
    cdsPVSmByTabN: TFloatField;
    LbxNuObj: TListBox;
    LbxSchBU: TListBox;
    popVedDetiAdd: TMenuItem;
    cdsDeti: TClientDataSet;
    dsrcDeti: TDataSource;
    dbgrDeti: TDBGrid;
    LabelSortInfo3: TLabel;
    cdsDetiNR: TAutoIncField;
    cdsDetiKdObj: TSmallintField;
    cdsDetiTabN: TIntegerField;
    cdsDetiFamIO: TStringField;
    cdsDetiKdKatP: TSmallintField;
    cdsDetiSm1901: TFloatField;
    cdsDetiSm1909: TFloatField;
    cdsDetiSmNach: TFloatField;
    cdsDetiSmUdrg: TFloatField;
    cdsDetiSmVupl: TFloatField;
    cdsDetiSm_1901: TFloatField;
    cdsDetiSm_1909: TFloatField;
    cdsDetiSmRasch: TFloatField;
    cdsDetiSmOper: TFloatField;
    cdsDetiSmOst: TFloatField;
    cdsDetiK_t: TFloatField;
    cdsDetiKdBnk: TSmallintField;
    cdsDetiLS: TStringField;
    cdsDetiNotInCurSps: TBooleanField;
    cdsDetiSmByTabN: TFloatField;
    cdsDetiPSch: TStringField;
    cdsDetiSchBU: TStringField;
    cdsDetiKdSpZ: TSmallintField;
    PanelTsDetiTools: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    LabelProcess3: TLabel;
    Label7: TLabel;
    bBtnBack3: TBitBtn;
    DBNavigator2: TDBNavigator;
    sBtnShwNU: TSpeedButton;
    LabelSortOtkl: TLabel;
    LabelFilterOtkl: TLabel;
    popOtklSortSumma: TMenuItem;
    popVedAddTVP: TMenuItem;
    popVedAddNV: TMenuItem;
    popVedAddSpec: TMenuItem;
    qryOtklSPB: TStringField;
    tsVedSpB: TTabSheet;
    dbgrSpB: TDBGrid;
    cdsSpB: TClientDataSet;
    dsrcSpB: TDataSource;
    cdsSpBNR: TAutoIncField;
    cdsSpBDtProc: TDateField;
    cdsSpBTabN: TIntegerField;
    cdsSpBFamIO: TStringField;
    cdsSpBKdSps: TSmallintField;
    cdsSpBKdObj: TSmallintField;
    cdsSpBKdKatP: TSmallintField;
    cdsSpBKdSpZ: TSmallintField;
    cdsSpBSpZ: TStringField;
    cdsSpBMaxSm: TFloatField;
    cdsSpBSmToVed: TFloatField;
    cdsSpBNotes: TStringField;
    cdsSpBNrVed: TIntegerField;
    cdsSpBDtVed: TDateField;
    popSpB: TPopupMenu;
    popSpbHead: TMenuItem;
    popSpbAdd: TMenuItem;
    popSpbEdt: TMenuItem;
    popSpbDel: TMenuItem;
    PanelTsSpbTools: TPanel;
    sBtnSpbSaveVed: TSpeedButton;
    sBtnSpbInfo: TSpeedButton;
    Label12: TLabel;
    bBtnSpbBack: TBitBtn;
    DBNavigator4: TDBNavigator;
    cdsSpBKdBnk: TSmallintField;
    cdsSpBLS: TStringField;
    LabelSpbDbg: TLabel;
    qryPere: TQuery;
    qryMaxSm: TQuery;
    cdsSpBNmBnk: TStringField;
    cdsSpBPSCH: TStringField;
    sBtnOtklTts: TSpeedButton;
    popSpbSep1: TMenuItem;
    popSpbCopySps: TMenuItem;
    sBtnCur_Pred: TSpeedButton;
    PanelInf2: TPanel;
    sBtnCloseInf2: TSpeedButton;
    cdsInf: TClientDataSet;
    cdsInfKdBnk: TSmallintField;
    cdsInfNmBnk: TStringField;
    cdsInfCnt: TIntegerField;
    cdsInfSumma: TFloatField;
    dsrcInf: TDataSource;
    dbgrInf: TDBGrid;
    N1: TMenuItem;
    LabelPSch: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popVedPopup(Sender: TObject);
    procedure sBtnAllMesClick(Sender: TObject);
    procedure sBtnCurMesClick(Sender: TObject);
    procedure popVedAddClick(Sender: TObject);
    procedure popVedEdtClick(Sender: TObject);
    procedure popVedDelClick(Sender: TObject);
    procedure qryVedAfterPost(DataSet: TDataSet);
    procedure qryVedAfterDelete(DataSet: TDataSet);
    procedure qryOtklCalcFields(DataSet: TDataSet);
    procedure qryOtklNewRecord(DataSet: TDataSet);
    procedure qryOtklAfterPost(DataSet: TDataSet);
    procedure qryNUCalcFields(DataSet: TDataSet);
    procedure dsrcVedDataChange(Sender: TObject; Field: TField);
    procedure qryOtklTABNValidate(Sender: TField);
    procedure PanelRightResize(Sender: TObject);
    procedure sBtnApplyClick(Sender: TObject);
    procedure qryOtklAfterDelete(DataSet: TDataSet);
    procedure sBtnPrtClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrVedDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryVedBeforeScroll(DataSet: TDataSet);
    procedure qryVedAfterScroll(DataSet: TDataSet);
    procedure cdsPVBeforePost(DataSet: TDataSet);
    procedure sBtnShwZadanieClick(Sender: TObject);
    procedure dbgrPVDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sBtnSaveVedCmnClick(Sender: TObject);
    procedure sBtnInfoClick(Sender: TObject);
    procedure sBtnInfCloseClick(Sender: TObject);
    procedure bBtnBack2Click(Sender: TObject);
    procedure popPrtKssOneVedClick(Sender: TObject);
    procedure popPrtKssByObjClick(Sender: TObject);
    procedure popPrtBnkOneVedClick(Sender: TObject);
    procedure popPrtBnkByObjClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
                                               Shift: TShiftState);
    procedure popPrtKssByObjReeClick(Sender: TObject);
    procedure popPrtKssByOtchetClick(Sender: TObject);
    procedure popPrtPopup(Sender: TObject);
    procedure popVedFonClick(Sender: TObject);
    procedure popVedFontClick(Sender: TObject);
    procedure popSortObjTabNClick(Sender: TObject);
    procedure popSortObjFioClick(Sender: TObject);
    procedure popSortTabNClick(Sender: TObject);
    procedure popSortFioClick(Sender: TObject);
    procedure popPVPopup(Sender: TObject);
    procedure qryVedCalcFields(DataSet: TDataSet);
    procedure sBtnSpisokClick(Sender: TObject);
    procedure popCreSpsCustomClick(Sender: TObject);
    procedure cdsPVTabNSetText(Sender: TField; const Text: String);
    procedure PageControlResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cdsPVAfterPost(DataSet: TDataSet);
    procedure cdsPVAfterDelete(DataSet: TDataSet);
    procedure popCreSpsWithPomClick(Sender: TObject);
    procedure popPvDelRecClick(Sender: TObject);
    procedure cdsPVBeforeEdit(DataSet: TDataSet);
    procedure sBtnSumKVuplClick(Sender: TObject);
    procedure popPvFilterBnkClick(Sender: TObject);
    procedure popPvFilterBKOffClick(Sender: TObject);
    procedure popPvFilterKssClick(Sender: TObject);
    procedure popCreSpsBezClick(Sender: TObject);
    procedure popPvShwNUClick(Sender: TObject);
    procedure dsrcPVDataChange(Sender: TObject; Field: TField);
    procedure popVedDetiAddClick(Sender: TObject);
    procedure bBtnBack3Click(Sender: TObject);
    procedure popOtklSortObjTabNClick(Sender: TObject);
    procedure popOtklSortObjFioClick(Sender: TObject);
    procedure popOtklSortTabNClick(Sender: TObject);
    procedure popOtklSortFioClick(Sender: TObject);
    procedure popOtklFilterOffClick(Sender: TObject);
    procedure popOtklFilterBnkClick(Sender: TObject);
    procedure popOtklFilterKssClick(Sender: TObject);
    procedure popOtklOtherClick(Sender: TObject);
    procedure popOtklSortSummaClick(Sender: TObject);
    procedure popVedAddTVPClick(Sender: TObject);
    procedure popVedAddNVClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure popSpbAddClick(Sender: TObject);
    procedure popSpbEdtClick(Sender: TObject);
    procedure popSpbDelClick(Sender: TObject);
    procedure popVedBnkAddSpecClick(Sender: TObject);
    procedure popSpBPopup(Sender: TObject);
    procedure cdsSpBNewRecord(DataSet: TDataSet);
    procedure cdsSpBTabNValidate(Sender: TField);
    procedure sBtnSpbSaveVedClick(Sender: TObject);
    procedure sBtnSpbInfoClick(Sender: TObject);
    procedure cdsSpBKdBnkValidate(Sender: TField);
    procedure cdsSpBSpZValidate(Sender: TField);
    procedure bBtnSpbBackClick(Sender: TObject);
    procedure dbgrSpBDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popSpbCopySpsClick(Sender: TObject);
    procedure dbgrSpBDblClick(Sender: TObject);
    procedure sBtnCur_PredClick(Sender: TObject);
    procedure sBtnCloseInf2Click(Sender: TObject);
    procedure dbgrInfDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    nMesCase, nVedKdSpZ : SmallInt;
    d_DtVed, d_DtPrc, d_PredDtPrc : TDateTime;
    n_SvVedNR, n_NewVedNR, n_KdSps, n_KdUsr : integer;
    bNewVedSaved, bCustomInputInCdsPV, bNeedSave, bDoRound : boolean;
    bCurMes, bCur_Pred, bAllMes : boolean;
    mFonColor : TColor;
    cFontName : ShortString;
    nFontSize : SmallInt;
    bFontItalic, bFontBold : boolean;
    PayPercents: TPayPercents;
    procedure SetTabsFont;
    procedure OpenQryVed(dDtPrc : TDateTime);
    procedure OpenQryOtkl;
    function NewBnkNrPrdF(dDtPrc : TDateTime) : integer;
    procedure RefeshLabelCntRec;
    procedure SetDbgrPVColumns;
    procedure SetDbgrPvLittleShw;
    procedure DoPvRaschet;
    procedure CreOpenCdsPV;
    procedure SetCdsPvIndex;
    procedure CheckCdsFilterBK(nKdBnk : SmallInt);
    procedure AddDopInfAbout(nTabN : integer);

    procedure Sborka(IsSps: Boolean; Accnt, Synth: ShortString;
      var IsResRecs: Boolean; SchBuExclude, VidsExclude, ObjExclude: Boolean);

    procedure CreCdsDeti(dDtPrc : TDateTime);
    procedure CdsDetiAddRec(nTabN : integer; nKdObj, nKdKatP, nKdSpZ : SmallInt;
                                nSumma : double;
                                   cFamIO, cVidN, cPSch, cSchBU : ShortString);
    function IsInUpiSps(nTabN : integer; dDtPrc : TDateTime;
                                           var cFamIO : ShortString) : boolean;
    function IsPereInf(nTabN : integer; var nKdSps, nKdObj, nKdKatP,
                    nKdSpZ : SmallInt; var cSPZ, cPSCH : string) : boolean;
    function GetMaxSm(nTabN : integer; nKdSpZ : SmallInt; cPSCH : ShortString;
                                                 var nMaxSm : double) : boolean;
    function MySchBU(cPSch : string; var cSchBU : string) : SmallInt;
    procedure AddInfInCdsInf(nKdBnk : SmallInt; nSmm : double);
  public
    { Public declarations }
    bNeedValidate : boolean;
  end;

procedure VedV(nKdSps, nKdUsr : integer; dDtPrc : TDateTime);

const SECTION = 'z_VedV';

var
  FormVedV: TFormVedV;
  bIsFormShwNU : boolean;

implementation

uses a_Const, a_DM, z_DM, z_Main, z_TUpi, a_Lib, a_Sbu,
     z_EVedVp, z_VbObKt, z_VvZdSm, z_CmnPrt, z_DpInfB, z_DpInfK,
     z_VedFBK, z_VbVids, z_VbPSch, z_ShwNu, z_ESpB, z_CopSpb,
     QryUtils, DateLib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure VedV(nKdSps, nKdUsr : integer; dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormVedV := TFormVedV.Create(Application);
  with FormVedV do begin
    Caption := 'Ведомости выплат';
    bIsFormShwNU := false;
    bCurMes   := false;
    bCur_Pred := false;
    bAllMes   := false;
    bNeedSave := false;
    bNeedValidate := true; // Нужно делать Validate по заданным полям
    d_DtPrc := dDtPrc;
    DecodeDate(dDtPrc, nY, nM, nD);
    nM := nM - 1;
    if nM < 1 then begin
      nM := 12;
      nY := nY - 1;
    end;
    d_PredDtPrc := EncodeDate(nY, nM, 1);
    n_KdSps := nKdSps;
    n_KdUsr := nKdUsr;
    LabelVedNr.Caption := '';
    OpenQryVed(dDtPrc);
    OpenQryOtkl;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.OpenQryVed(dDtPrc : TDateTime);
var nSvNR : integer; bFirstOpen : boolean;
begin
  nSvNR := 0;
  bCurMes   := false;
  bCur_Pred := false;
  bAllMes   := false;
  bFirstOpen := true;  // Первое открытие после входа в процедуру
  with qryVed do begin
    if Active then begin
      bFirstOpen := false;
      nSvNR := qryVedNR.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VedNR ' +
            ' where (TypeVed = "VedVupl" or TypeVed = "VedSpB") ');
    if sBtnCurMes.Down then begin
      SQL.Add(' and DtProc = :dDtPrc ');
      bCurMes := true; end
    else if sBtnCur_Pred.Down then begin
      SQL.Add(' and (DtProc = :dDtPrc or DtProc = :dPredDtPrc)');
      bCur_Pred := true; end
    else
      bAllMes := true;
    SQL.Add('order by DtProc, VedNR, VedDate, TypeVed');
    if sBtnCurMes.Down then
      ParamByName('dDtPrc').AsDateTime := dDtPrc
    else if sBtnCur_Pred.Down then begin
      ParamByName('dDtPrc').AsDateTime := dDtPrc;
      ParamByName('dPredDtPrc').AsDateTime := d_PredDtPrc;
    end;
    Open;
    if bFirstOpen and (n_SvVedNR <> 0) then begin
      if not Locate('VedNR', n_SvVedNR, []) then
        Last; end
    else if not bFirstOpen and (nSvNR <> 0) then begin
      if not Locate('NR', nSvNR, []) then
        Last; end
    else
      Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.OpenQryOtkl;
var nSvTabN : integer;
begin
  nSvTabN := 0;
  with qryOtkl do begin
    if Active then begin
      nSvTabN := FieldByName('TabN').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcVed;
    if qryVedTypeVed.AsString = 'VedSpB' then
      SQL.Add('Select bl.KdBnk, bl.LicSch, bl.SpB, bl.DtBeg, ' +
              ' u.Fam, u.Ima, u.Otch, o.* from ViOtklMain o ' +
              ' Left outer join z_Upi u on u.TabN = o.TabN ' +
              ' Left outer join Z_Get_Bnk_SpecLS(o.TabN, o.DtVdPv) bl on 1=1 ' +
              ' where o.DtProc = :DtProc and o.KdSps = :KdSps ' +
              ' and o.NrVdPv = :VedNR and o.VidN > "7500" and o.VidN < "7520" ')
    else
      SQL.Add('Select bl.KdBnk, bl.LicSch, bl.SpB, bl.DtBeg, ' +
              ' u.Fam, u.Ima, u.Otch, o.* from ViOtklMain o ' +
              ' Left outer join z_Upi u on u.TabN = o.TabN ' +
              ' Left outer join Z_GET_BNKLS (o.TabN, :VedDate) bl ' +
              ' on 1 = 1 and (bl.SpB is NULL or bl.SpB <> "Y") ' +
              ' where o.DtProc = :DtProc and o.KdSps = :KdSps ' +
              ' and o.NrVdPv = :VedNR and o.VidN > "7500" and o.VidN < "7520" ');
    if popOtklSortObjTabN.Checked then begin
      SQL.Add(' order by o.KdObj, o.TabN');
      LabelSortOtkl.Caption := 'Сортировка: Подразделение; Таб.Нр'; end
    else if popOtklSortObjFio.Checked then begin
      SQL.Add(' order by o.KdObj, u.Fam, u.Ima, u.Otch');
      LabelSortOtkl.Caption := 'Сортировка: Подразделение; Фамилия И.О.'; end
    else if popOtklSortTabN.Checked then begin
      SQL.Add(' order by o.TabN');
      LabelSortOtkl.Caption := 'Сортировка по Табельному номеру'; end
    else if popOtklSortFio.Checked then begin
      SQL.Add(' order by u.Fam, u.Ima, u.Otch');
      LabelSortOtkl.Caption := 'Сортировка по Фамилии И.О.'; end
    else {if popOtklSortSumma.Checked then} begin
      SQL.Add(' order by o.Summa desc, u.Fam, u.Ima, u.Otch');
      LabelSortOtkl.Caption := 'Сортировка по полю "Сумма"';
    end;
    Open;
    if nSvTabN <> 0 then
      Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.FormCreate(Sender: TObject);
var nQryOtklSortCase, nCdsPvSortCase : SmallInt;
begin
  LabelFilterBK.Caption := '';
  LabelPSch.Visible := false; {отказался пока от затеи показывать, по какому
                ПСЧ ведомость, т.к. вообще есть возможность в одной ведомости
                                        организовать нсколько ПСС. 16-11-2013}
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 575);
    Width  := ReadInteger(SECTION, 'wW', 700);
    mFonColor := ReadInteger(SECTION, 'FonClr', clWindow);
    cFontName := ReadString(SECTION, 'c_FN', 'Arial');
    nFontSize := ReadInteger(SECTION, 'c_FS', 10);
    bFontBold := ReadBool(SECTION, 'b_FB', false);
    bFontItalic := ReadBool(SECTION, 'b_FI', false);
    PanelLeft.Width := ReadInteger(SECTION, 'grVedW', 250);
    nMesCase := ReadInteger(SECTION, 'nMesCase', 1);
    n_SvVedNR := ReadInteger(SECTION, 'nSvVedNR', 0);
    nQryOtklSortCase := ReadInteger(SECTION, 'nOtklSort', 1);
    nCdsPvSortCase := ReadInteger(SECTION, 'nPvSort', 1);
    Free;
  end;
  if nMesCase = 1 then
    sBtnCurMes.Down := true
  else if nMesCase = 2 then
    sBtnCur_Pred.Down := true
  else
    sBtnAllMes.Down := true;
  bCustomInputInCdsPV := false;
  LabelProcess.Caption := '';
  LabelVedNr.Visible := false;
  SetTabsFont;
  LabelCntOtklRec.Caption := '';
  if FileExists(cDirVids + 'VdVpl_01.vid') then
    dbgrVed.Columns.LoadFromFile(cDirVids + 'VdVpl_01.vid');
  if FileExists(cDirVids + 'VdVpl_05.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'VdVpl_05.vid');
  if FileExists(cDirVids + 'VdVpl_04.vid') then
    dbgrPV.Columns.LoadFromFile(cDirVids + 'VdVpl_04.vid');
  if FileExists(cDirVids + 'VdVpl_06.vid') then
    dbgrDeti.Columns.LoadFromFile(cDirVids + 'VdVpl_06.vid');
  if FileExists(cDirVids + 'VdVplSp1.vid') then
    dbgrSpb.Columns.LoadFromFile(cDirVids + 'VdVplSp1.vid');
  if FileExists(cDirVids + 'VdVpInf1.vid') then
    dbgrInf.Columns.LoadFromFile(cDirVids + 'VdVpInf1.vid');
  if nQryOtklSortCase = 1 then begin
    popOtklSortObjTabN.Checked := true;
    popOtklSortObjFio.Checked  := false;
    popOtklSortTabN.Checked    := false;
    popOtklSortSumma.Checked   := false;
    popOtklSortFio.Checked     := false; end
  else if nQryOtklSortCase = 2 then begin
    popOtklSortObjTabN.Checked := false;
    popOtklSortObjFio.Checked  := true;
    popOtklSortTabN.Checked    := false;
    popOtklSortSumma.Checked   := false;
    popOtklSortFio.Checked     := false; end
  else if nQryOtklSortCase = 3 then begin
    popOtklSortObjTabN.Checked := false;
    popOtklSortObjFio.Checked  := false;
    popOtklSortTabN.Checked    := true;
    popOtklSortSumma.Checked   := false;
    popOtklSortFio.Checked     := false; end
  else if nQryOtklSortCase = 4 then begin
    popOtklSortObjTabN.Checked := false;
    popOtklSortObjFio.Checked  := false;
    popOtklSortTabN.Checked    := false;
    popOtklSortSumma.Checked   := false;
    popOtklSortFio.Checked     := true; end
  else {if nQryOtklSortCase = 5 then} begin
    popOtklSortObjTabN.Checked := false;
    popOtklSortObjFio.Checked  := false;
    popOtklSortTabN.Checked    := false;
    popOtklSortFio.Checked     := false;
    popOtklSortSumma.Checked   := true;
  end;
  if nCdsPvSortCase = 1 then begin
    popSortObjTabN.Checked := true;
    popSortObjFio.Checked := false;
    popSortTabN.Checked := false;
    popSortFio.Checked := false; end
  else if nCdsPvSortCase = 2 then begin
    popSortObjTabN.Checked := false;
    popSortObjFio.Checked := true;
    popSortTabN.Checked := false;
    popSortFio.Checked := false; end
  else if nCdsPvSortCase = 3 then begin
    popSortObjTabN.Checked := false;
    popSortObjFio.Checked := false;
    popSortTabN.Checked := true;
    popSortFio.Checked := false; end
  else {if nCdsPvSortCase = 4 then} begin
    popSortObjTabN.Checked := false;
    popSortObjFio.Checked := false;
    popSortTabN.Checked := false;
    popSortFio.Checked := true;
  end;
  LabelSortInfo.Caption := '';
  dbgrOtkl.Color := mFonColor;
  dbgrVed.Color  := mFonColor;
  dbgrPV.Color  := mFonColor;
  tsVeds.TabVisible := false;
  tsVedCmn.TabVisible := false;
  tsVedDeti.TabVisible := false;
  tsVedSpB.TabVisible := false;
  PageControl.ActivePage := tsVeds;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.BitBtn1Click(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.SetTabsFont;
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
  dbgrVed.Font.Name       := cFontName;
  dbgrOtkl.Font.Name      := cFontName;
  dbgrPV.Font.Name        := cFontName;
  dbgrVed.TitleFont.Name  := cFontName;
  dbgrOtkl.TitleFont.Name := cFontName;
  dbgrPV.TitleFont.Name   := cFontName;
  dbgrVed.Font.Size       := nFontSize;
  dbgrOtkl.Font.Size      := nFontSize;
  dbgrPV.Font.Size        := nFontSize;
  dbgrVed.TitleFont.Size  := nFontSize;
  dbgrOtkl.TitleFont.Size := nFontSize;
  dbgrPV.TitleFont.Size   := nFontSize;
  dbgrVed.Font.Style      := mFontStyle;
  dbgrOtkl.Font.Style     := mFontStyle;
  dbgrPV.Font.Style       := mFontStyle;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var nDlgResult : word;
begin
  if bIsFormShwNu then
    FormShwNu.Close;
  if sBtnApply.Enabled then begin
    nDlgResult := MessageDlg('Изменения не сохранены на диск. Сохранить?:',
                                       mtWarning, [mbYes, mbNo, mbCancel], 0);
    if nDlgResult = mrYes then begin
      if qryOtkl.UpdatesPending then
      qryOtkl.ApplyUpdates; end
    else if nDlgResult = mrCancel then begin
      ModalResult := mrNone;
      CanClose := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bIsFormShwNu then
    FormShwNu.Close;
  dbgrVed.Columns.SaveToFile(cDirVids + 'VdVpl_01.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'VdVpl_05.vid');
  dbgrPV.Columns.SaveToFile(cDirVids + 'VdVpl_04.vid');
  if cdsDeti.Active then
    dbgrDeti.Columns.SaveToFile(cDirVids + 'VdVpl_06.vid');
  dbgrSpb.Columns.SaveToFile(cDirVids + 'VdVplSp1.vid');
  dbgrInf.Columns.SaveToFile(cDirVids + 'VdVpInf1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if qryVed.Active and (qryVed.RecordCount > 0) then
      WriteInteger(SECTION, 'nSvVedNR', qryVed.FieldByName('VedNR').AsInteger);
    if sBtnCurMes.Down then
      nMesCase := 1
    else if sBtnCur_Pred.Down then
      nMesCase := 2
    else
      nMesCase := 3;
    WriteInteger(SECTION, 'nMesCase', nMesCase);
    WriteInteger(SECTION, 'grVedW', PanelLeft.Width);
    WriteInteger(SECTION, 'FonClr', mFonColor);
    WriteString(SECTION, 'c_FN', cFontName);
    WriteInteger(SECTION, 'c_FS', nFontSize);
    WriteBool(SECTION, 'b_FB', bFontBold);
    WriteBool(SECTION, 'b_FI', bFontItalic);
    if popOtklSortObjTabN.Checked then
      WriteInteger(SECTION, 'nOtklSort', 1)
    else if popOtklSortObjFio.Checked then
      WriteInteger(SECTION, 'nOtklSort', 2)
    else if popOtklSortTabN.Checked then
      WriteInteger(SECTION, 'nOtklSort', 3)
    else if popOtklSortFio.Checked then
      WriteInteger(SECTION, 'nOtklSort', 4)
    else {if popOtklSortSumma.Checked}
      WriteInteger(SECTION, 'nOtklSort', 5);
    if popSortObjTabN.Checked then
      WriteInteger(SECTION, 'nPvSort', 1)
    else if popSortObjFio.Checked then
      WriteInteger(SECTION, 'nPvSort', 2)
    else if popSortTabN.Checked then
      WriteInteger(SECTION, 'nPvSort', 3)
    else
      WriteInteger(SECTION, 'nPvSort', 4);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedPopup(Sender: TObject);
begin
  popVedAdd.Enabled := // (bInCtrlMes or bFlagDbg) and
      qryVed.Active and (qryVed.State = dsBrowse);
  popVedDetiAdd.Enabled := popVedAdd.Enabled;
  popVedEdt.Enabled := DmMain.InCtrlMes and qryVed.Active and
                                (qryVed.RecordCount > 0) and
                      (qryVed.FieldByName('DtProc').AsDateTime = d_DtPrc) and
                 (qryVedPrPodkl.IsNull or (qryVedPrPodkl.AsInteger <> 1)) and
                ((qryVed.FieldByName('KdUsr').AsInteger = n_KdUsr) or bFlagDbg);
  popVedDel.Enabled := popVedEdt.Enabled or (n_KdUsr in [101, 102, 127]);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnAllMesClick(Sender: TObject);
begin
  if sBtnAllMes.Down and not bAllMes then
    OpenQryVed(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnCurMesClick(Sender: TObject);
begin
  if sBtnCurMes.Down and not bCurMes then
    OpenQryVed(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnCur_PredClick(Sender: TObject);
begin
  if sBtnCur_Pred.Down and not bCur_Pred then
    OpenQryVed(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedAddClick(Sender: TObject);
var nY, nM, nD : word;  nSvNR, nBnkNrPrdF : integer; dDtVed : TDateTime;
    bSpec : boolean;
begin
  bSpec := false;
  bNewVedSaved := false;
  DecodeDate(d_DtPrc, nY, nM, nD);
  bCustomInputInCdsPV := false;
  with qryVed do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('TypeVed').AsString := 'VedVupl';
    FieldByName('DtProc').AsDateTime := d_DtPrc;
    FieldByName('KdUsr').AsInteger := n_KdUsr;
    FieldByName('KdSps').AsInteger := n_KdSps;
    nBnkNrPrdF := NewBnkNrPrdF(d_DtPrc);
    FieldByName('VedDate').AsDateTime := Date;
    FieldByName('BnkNrPrdF').AsInteger := nBnkNrPrdF;
    FieldByName('BnkDtPrdF').AsDateTime := Date;
    FieldByName('BnkNmPrdF').AsString := 'Зарплата за ' +
                                      UkrMes(nM) + ' ' + IntToStr(nY) + ' р.';
    FieldByName('KssVedNr').AsInteger := nBnkNrPrdF;
    FieldByName('KssVedDt').AsDateTime := Date;
    FieldByName('KssVedNm').AsString := 'на выплату зарплаты за ' +
                                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    FieldByName('Notes').AsString := 'ВВ';
    if AddEdtMegVed(dsrcVed, bSpec) {z_EVedVp} then begin
      Application.ProcessMessages;
      //Post; Не делаю. Будет Post'иться при сохранении cdsPV
      //                                (по sBtnSaveVed1Click)
      Caption := 'Формирование ведомости выплат';
      d_DtVed := qryVedBnkDtPrdF.AsDateTime;
      dDtVed  := qryVedVedDate.AsDateTime;
      if cdsPV.Active then cdsPV.Close;
      PageControl.ActivePage := tsVedCmn;
      DmMain.CreOpenCdsBankiLsLU(dDtVed); // освежить DmMain.CdsBankiLsLU
                                           //                      (Банки.ЛС)
      LabelDbg.Caption := 'DtVdPV = ' + qryVedVedDate.AsString +
                                         ', NrVedPV = ' + qryVedVedNr.AsString;
      LabelDbg.Visible := bFlagDbg;
      sBtnSpisok.Enabled := true;
      sBtnSumKVupl.Enabled := false;
      sBtnShwZadanie.Enabled := false;
      sBtnInfo.Enabled := false;
      sBtnSaveVedCmn.Enabled := false;
      bNewVedSaved := false;
      dbgrPV.SetFocus; end
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedEdtClick(Sender: TObject);
var bSpec : boolean;
begin
  bSpec := qryVedTypeVed.AsString = 'VedSpB';
  with qryVed do begin
    Edit;
    if AddEdtMegVed(dsrcVed, bSpec) {z_EVedVp} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedDelClick(Sender: TObject);
var cMsg : string;
begin
  cMsg := 'Будет удален заголовок ведомости и все записи из таблиц' + #13#10 +
          '"Отклоненя" и "Начисления/Удержания", содержащиеся в' + #13#10 +
          'этой ведомости (правая таблица).                     Согласны?:';
  if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Alter TRIGGER ZOTKL_BD INACTIVE'); {Before Delete}
      ExecSQL;          // Чтобы не "краснели" записи в Z_SPS
      SQL.Clear;
      DataBaseName := '';
    end;
    qryVed.Delete;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Alter TRIGGER ZOTKL_BD ACTIVE');   {Before Delete}
      ExecSQL;          // Чтобы могли "краснеть" записи в Z_SPS
      SQL.Clear;
      DataBaseName := '';
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormVedV.NewBnkNrPrdF(dDtPrc : TDateTime) : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(BnkNrPrdF) as MaxNR from Z_VedNR ' +
            ' where (DtProc = :d_DtPrc) and (VedDate = :dVedDate)');
    ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
    ParamByName('dVedDate').AsDateTime := Date;
    Open;
    if (RecordCount > 0) and (not FieldByName('MaxNR').IsNull) then
      Result := FieldByName('MaxNR').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryVedAfterPost(DataSet: TDataSet);
begin
  with qryVed do begin
    ApplyUpdates;
    Close;
    Open;
    Locate('VedNR', n_NewVedNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryVedAfterDelete(DataSet: TDataSet);
begin
  qryVed.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.RefeshLabelCntRec;
begin
  LabelCntOtklRec.Caption := '';
  LabelVedNr.Caption := 'VedNr = ' + qryVedVEDNR.AsString;
  if (qryOtkl.RecordCount >= 0) then
    LabelCntOtklRec.Caption :=
                       'Записей в ведомости: ' + IntToStr(qryOtkl.RecordCount)
  else
    LabelCntOtklRec.Caption := 'Записей в ведомости: нет';
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryOtklCalcFields(DataSet: TDataSet);
begin
  if not qryOtkl.Active then Exit;
  qryOtkl.FieldByName('FamIO').AsString :=
                     MyFamIO(qryOtkl.FieldByName('Fam').AsString,
                               qryOtkl.FieldByName('Ima').AsString,
                                qryOtkl.FieldByName('Otch').AsString);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryOtklNewRecord(DataSet: TDataSet);
begin
  with qryOtkl do begin
    FieldByName('KdSps').AsInteger := n_KdSps;
    FieldByName('PdN').AsInteger := 1;
    FieldByName('VidN').AsString := '7509';
    FieldByName('DtProc').AsDateTime := d_DtPrc;
    FieldByName('ZaMesGod').AsDateTime := d_DtPrc;
    FieldByName('DtVdPv').AsDateTime :=
                                    qryVed.FieldByName('VedDate').AsDateTime;
    FieldByName('NrVdPv').AsInteger := qryVed.FieldByName('VedNr').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryNUCalcFields(DataSet: TDataSet);
begin
//  qryNuFamIO.AsString := MyFamIO(qryNuFam.AsString, qryNuIma.AsString,
//                                                      qryNuOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dsrcVedDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcVed.State = dsBrowse) and qryOtkl.Active {and
                                            (qryOtkl.RecordCount <> 0)} then
    RefeshLabelCntRec;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryOtklTABNValidate(Sender: TField);
begin
  ;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.PanelRightResize(Sender: TObject);
begin
  PanelWait.Top := Round((dbgrOtkl.Height - PanelWait.Height) / 2);
  PanelWait.Left := Round((dbgrOtkl.Width - PanelWait.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryOtklAfterPost(DataSet: TDataSet);
begin
  sBtnApply.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryOtklAfterDelete(DataSet: TDataSet);
begin
  sBtnApply.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnApplyClick(Sender: TObject);
begin
(*
  if qryOtkl.UpdatesPending then
    qryOtkl.ApplyUpdates;
  sBtnApply.Enabled := false;
*)
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnPrtClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnPrt.Top + 48;
  Y := Left + sBtnPrt.Left + 3;
  popPrt.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrOtkl.Canvas do begin
    if not (gdFocused in State) then begin
      if qryOtklSpB.AsBoolean then
        Font.Color := clFuchsia;
      if (Column.FieldName = 'SUMMA') then begin
        Column.Title.Font.Color := clRed;
        Column.Title.Font.Style := [fsBold];
        Column.Font.Style := [fsBold];
        if (Column.Field.Value < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
        end
      else begin
        Column.Title.Font.Color := clWindowText;
        if bFontBold then
          Column.Title.Font.Style := [fsBold]
        else
          Column.Title.Font.Style := [];
      end;
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbgrVedDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrVed.Canvas do begin
    if not (gdFocused in State) then begin
      if qryVedDtProc.AsDateTime <> d_DtPrc then
        Font.Color := clGray
      else begin
        if qryVedTypeVed.AsString = 'Ved7509' then
          Font.Color := clGreen
        else if qryVedTypeVed.AsString = 'VedMgKss' then
          Font.Color := clMaroon
        else if qryVedTypeVed.AsString = 'VedSpB' then
          Font.Color := clFuchsia
        else
          Font.Color := clWindowText;
      end;
    end;
    if bFontBold then
      Column.Title.Font.Style := [fsBold]
    else
      Column.Title.Font.Style := [];
  end;
  dbgrVed.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedFonClick(Sender: TObject);
begin
  if FormZpMain.ColorDialog1.Execute then begin
    mFonColor := FormZpMain.ColorDialog1.Color;
    dbgrOtkl.Color := mFonColor;
    dbgrVed.Color  := mFonColor;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedFontClick(Sender: TObject);
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
procedure TFormVedV.qryVedBeforeScroll(DataSet: TDataSet);
var nDlgResult : SmallInt;
begin
  if PanelInf2.Visible then begin
    PanelInf2.Visible := false;
    Application.ProcessMessages;
  end;
  if (qryVedPrPodkl.IsNull or (qryVedPrPodkl.AsInteger <> 1)) and
                                    qryOtkl.UpdatesPending then begin
    nDlgResult := MessageDlg('Не сохранены изменения сделанные в ' +
            'отклонениях. Сохранить?:', mtWarning, [mbYes, mbNo, mbCancel], 0);
    if nDlgResult = mrYes then
      sBtnApplyClick(Self)
      // ShowMessage('Будем сохраняться')
    else if nDlgResult = mrNo then
      // ShowMessage('Не будем сохраняться. Не хочуть.')
    else begin
      // ShowMessage('Выбран <Cancel>. Надо как-то прервать Scroll. Как?');
      // Оказывается Abort
      Abort;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryVedAfterScroll(DataSet: TDataSet);
begin
  OpenQryOtkl;
  sBtnApply.Enabled := (qryVedPrPodkl.IsNull or
                    (qryVedPrPodkl.AsInteger <> 1)) and qryOtkl.UpdatesPending;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.SetDbgrPVColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrPV.Columns.Count-1 do begin
    with dbgrPV.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SMOSNV') or (cUpper = 'SMPREM') or (cUpper = 'SMOTPTM') or
          (cUpper = 'SMOTPBM') or (cUpper = 'SMOTPNI') or (cUpper = 'SMOSTV') or
          (cUpper = 'SMOSTV') or (cUpper = 'SMOSTV') or (cUpper = 'SMOSTV') or
                                                 (cUpper = 'NOTINCURSPS') then
        Visible := bFlagDbg
      else
        Visible := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnShwZadanieClick(Sender: TObject);
var nDlgResult : SmallInt;
begin
  if bIsFormShwNu then
    FormShwNu.Close;
  Application.ProcessMessages;
  if cdsPv.Filtered then begin
    nDlgResult := MessageDlg('Стоит фильтр. Снять?:', mtWarning,
                                            [mbYes, mbNo, mbCancel], 0);
    if nDlgResult = mrCancel then
      Exit
    else if nDlgResult = mrYes then begin
      cdsPv.Filtered := false;
      popPvFilterBKOffClick(Self);
    end;  // иначе фильтр остается
  end;
  if GetMegVedZd(PayPercents, bDoRound) {z_VedVZd} then begin
    if bIsFormShwNu then
      FormShwNu.Close;
    Application.ProcessMessages;
    DoPvRaschet;
    sBtnShwZadanie.Enabled := true; // чтобы была возможность изменить задание
    sBtnInfo.Enabled := true;
    sBtnSaveVedCmn.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.cdsPVBeforePost(DataSet: TDataSet);
var nSmRaznica : double;
begin
  nSmRaznica := RoundTo(cdsPVSm_Nach.AsFloat - cdsPVSmOper.AsFloat, -2);
  if nSmRaznica = 0 then
    cdsPVSmOst.AsString := ''
  else
    cdsPVSmOst.AsFloat := nSmRaznica;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.DoPvRaschet;
var
  nSmByTabN, nSmOsnV, nSmBoln, nSmPrem,
  nSmOtpTM, nSmOtpBM, nSmOtpNI, nSmSocPsb,
  nSmRasch, nSmOst, nRaschTts: double;
  CurTabN: integer;
  PayPeriodEnd: TDateTime;
  EmplIsDismissed: boolean;
begin
  PayPeriodEnd := DateUtils.EndOfMonth(d_DtPrc);
  EmplIsDismissed := false;

  Screen.Cursor := crSQLWait;
  Application.ProcessMessages;
  with cdsPV do begin
    DisableControls;
    First;
    Screen.Cursor := crSQLWait;
    PanelWait.Top := Round((dbgrPV.Height - PanelWait.Height) / 2);
    PanelWait.Left := Round((dbgrPV.Width - PanelWait.Width) / 2);
    PanelWait.Visible := true;
    Application.ProcessMessages;
    nRaschTts := 0;

    // Чтобы можно было повторить задание, если не понравятся результаты,
    // надо сначала пройти по всему cdsPv и очистить поле cdsPVSmOper, т.к.
    // оно заполнено значениями от предыдущего DoPvRaschet, если таковой был
    while not Eof do begin
      if not cdsPVSmOper.IsNull then begin
        Edit;
        cdsPVSmOper.AsString := '';
        Post;
      end;
      Next;
    end;

    // А теперь собственно расчет.
    First;
    CurTabN := 0;

    while not Eof do begin
      if cdsPV.FieldByName('TabN').AsInteger <> CurTabN then begin
        CurTabN := cdsPV.FieldByName('TabN').AsInteger;
        EmplIsDismissed :=
          TQryUtils.PeekPrmUv(qryTmp, CurTabN, PayPeriodEnd) and
          not qryTmp.FieldByName('Dt_Uvoln').IsNull and
          (qryTmp.FieldByName('Dt_Uvoln').AsDateTime <= PayPeriodEnd);
      end;

      with PayPercents do begin
        nSmByTabN := cdsPVSmByTabN.AsFloat;

        if EmplIsDismissed then begin
          nSmOsnV   := cdsPVSm_OsnV.AsFloat * nPrcDismiss / 100;
          nSmPrem   := cdsPVSm_Prem.AsFloat * nPrcDismiss / 100;
          nSmBoln   := cdsPVSm_Boln.AsFloat * nPrcDismiss / 100;
          nSmOtpTM  := cdsPVSm_OtpTM.AsFloat * nPrcDismiss / 100;
          nSmOtpBM  := cdsPVSm_OtpBM.AsFloat * nPrcDismiss / 100;
          nSmOtpNI  := cdsPVSm_OtpNI.AsFloat * nPrcDismiss / 100;
          nSmSocPsb := cdsPVSm_SocPsb.AsFloat * nPrcDismiss / 100;
        end else begin
          nSmOsnV   := cdsPVSm_OsnV.AsFloat * nPrcOsnV / 100;
          nSmPrem   := cdsPVSm_Prem.AsFloat * nPrcPrem / 100;
          nSmBoln   := cdsPVSm_Boln.AsFloat * nPrcBoln / 100;
          nSmOtpTM  := cdsPVSm_OtpTM.AsFloat * nPrcOtpTM / 100;
          nSmOtpBM  := cdsPVSm_OtpBM.AsFloat * nPrcOtpBM / 100;
          nSmOtpNI  := cdsPVSm_OtpNI.AsFloat * nPrcOtpNI / 100;
          nSmSocPsb := cdsPVSm_SocPsb.AsFloat * nPrcSocPsb / 100;
        end;
      end;

      nSmOst := cdsPVSmOst.AsFloat;
      nSmRasch := nSmOsnV + nSmBoln + nSmPrem +
                            nSmOtpTM + nSmOtpBM + nSmOtpNI + nSmSocPsb;
      if bDoRound then
        nSmRasch := Round(nSmRasch)
      else
        nSmRasch := RoundTo(nSmRasch, -2);
      if nSmRasch > nSmOst then
        nSmRasch := nSmOst;
      Edit;
      if nSmRasch > nSmByTabN then
        nSmRasch := nSmByTabN;
      cdsPVSmRasch.AsFloat := nSmRasch;
      if nSmRasch > 0 then begin
        cdsPVSmOper.AsFloat := nSmRasch;
        nRaschTts := nRaschTts + nSmRasch;
      end;
      Post;
      Next;
    end;
    EnableControls;
//    SetCdsPvIndex;
  end;
  PanelWait.Visible := false;
  Screen.Cursor := crDefault;
  bNeedSave := nRaschTts > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbgrPVDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cUpper : ShortString;
begin
  with dbgrPV.Canvas do begin
    if not (gdFocused in State) then begin
      cUpper := AnsiUpperCase(Column.FieldName);
      if (cUpper = 'SMRASCH') or (cUpper = 'K_T') then begin
        Font.Style := [];
        Font.Color := clMaroon; end
      else if (cUpper = 'SMOPER') or (cUpper = 'SMOST') then begin
        Font.Style := [fsBold];
        if (cUpper = 'SMOPER') then
          Font.Color := clWindowText
        else begin
          if Column.Field.AsFloat < 0 then
            Font.Color := clRed
          else
            Font.Color := clWindowText;
        end; end
      else if (cUpper = 'SM_NACH') or (cUpper = 'SMRASCH') then begin
        if Column.Field.AsFloat < 0 then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
          end
      else begin
        if Copy(cUpper, 1, 3) = 'SM_' then begin
          Font.Style := [];
          Font.Color := clMaroon; end
        else if Copy(cUpper, 1, 2) = 'SM' then begin
          Font.Style := [];
          Font.Color := clNavy; end
        else  begin
          Font.Style := [];
          Font.Color := clWindowText;
        end;
      end;
    end;
  end;
  dbgrPV.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbeEnter(Sender: TObject);
begin
 (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbeExit(Sender: TObject);
begin
 (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.CreOpenCdsPV;
begin
  LabelFilterBK.Caption := '';
  with cdsPV do begin
    if Active then Close;
    IndexName := '';
    Filter := '';
    Filtered := false;
    CreateDataSet;
    Open;
    IndexName := '';       // есть индексы: cdsPvObjTabN, cdsPvObjFio
  end;                     //               cdsPvTabN, cdsPvFio
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popCreSpsWithPomClick(Sender: TObject);
var mLstObj, mLstKatP : TStrings; {cVidN : string4;} {nSmPrc, nSmVed : double;}
    Stmt: ShortString; i : integer;
    nKdBnk : SmallInt;  nProcess, nCnt : integer;
    dDtBeg, dDtVed : TDateTime;
    cShBnk, cNmBnk, cLicSch  : ShortString;
    bSpbLS, bLsClosed : boolean;
begin  // Вызвать помошника создания списка
  sBtnSumKVupl.Enabled := false;
  sBtnShwZadanie.Enabled := false;
  sBtnInfo.Enabled := false;
  sBtnSaveVedCmn.Enabled := false;
  mLstObj := LbxObj.Items;
  mLstKatP := LbxKatP.Items;
  mLstObj.Clear;
  mLstKatP.Clear;
  dDtVed := qryVedBnkDtPrdF.AsDateTime;
  if VbObjKat('Выбор подразделений и персонала для ведомости',
                     n_KdSps, mLstObj, mLstKatP) {z_VbObKt} then begin
    Application.ProcessMessages;
    LabelSortInfo.Caption := '';
    CreOpenCdsPV;
    SetDbgrPVColumns;

    Screen.Cursor := crSQLWait;
    PanelWait.Top := Round((dbgrPV.Height - PanelWait.Height) / 2);
    PanelWait.Left := Round((dbgrPV.Width - PanelWait.Width) / 2);
    PanelWait.Visible := true;
    Application.ProcessMessages;

    // Вариант, когда по запросу создается список людей,
    // СЛУЖАЩИХ в выбранных подразделениях с заданными КдКатПерс
    Stmt :=
      'Select distinct s.TabN, p.KdObj, p.KdKatP, u.Fam, u.Ima, u.Otch ' +
      'from z_sps s ' +
        'left join GetWrkPereOnDate (s.TabN, :d_DtPrc + 27) p on 1 = 1 ' +
        'left join Z_UPI u on u.TabN = s.TabN ' +
      'where s.dtProc = :d_DtPrc ';

    // Тут distinct дает возможность из списка текущего месяца выбрать ТабНр
    // только один, даже если их в Z_SPS несколько, а к выбранному ТабНР
    // пристроить данные из ОДНОЙ записи в Z_PERE (GetWrkPereOnDate).

    if mLstObj.Count > 0 then begin
      Stmt := Stmt +
        'and p.KdObj in (';

      for i := 0 to mLstObj.Count - 1 do begin
        Stmt := Stmt + mLstObj[i];

        if i < (mLstObj.Count - 1) then
          Stmt := Stmt + ', ';
      end;

      Stmt := Stmt + ') ';
    end;

    if mLstKatP.Count > 0 then begin
      Stmt := Stmt +
        'and p.KdKatP in (';

      for i := 0 to mLstKatP.Count - 1 do begin
        Stmt := Stmt + mLstKatP[i];

        if i < (mLstKatP.Count - 1) then
          Stmt := Stmt + ', ';
      end;
      
      Stmt := Stmt + ') ';
    end;

    TQryUtils.InitQuery(QryTmp);

    with QryTmp do begin
      SQL.Add(Stmt);
      SQL.Add(
        'order by p.KdObj, s.TabN'
      );
      ParamByName('d_DtPrc').AsDateTime := d_DtPrc;

      if bFlagDbg then
        SQL.SaveToFile(cDirTemp + 'MgVedAdd.sql');

      Open;

      nCnt := RecordCount;
      nProcess := 0;

      while not Eof do begin
        Inc(nProcess);
        LabelProcess.Caption := IntToStr(nCnt) + ' / ' + IntToStr(nProcess) +
                                ' / ' + FieldByName('TabN').AsString;
        LabelProcess.Refresh;

        CdsPV.Append;

        cdsPVKdObj.AsInteger := FieldByName('KdObj').AsInteger;
        cdsPVTabN.AsInteger  := FieldByName('TabN').AsInteger;       {z_TUpi}
        cdsPVFamIO.AsString  := MyFamIO(FieldByName('Fam').AsString,
                                         FieldByName('Ima').AsString,
                                           FieldByName('Otch').AsString);
        cdsPVKdKatP.AsInteger := FieldByName('KdKatP').AsInteger;
        DmMain.GetBankLS(FieldByName('TabN').AsInteger, dDtVed, dDtBeg,
                     nKdBnk, cShBnk, cNmBnk, cLicSch, bSpbLS, bLsClosed);

        if not bLsClosed then begin
          cdsPVLS.AsString := cLicSch;
          if nKdBnk <> 0 then
            cdsPVKdBnk.AsInteger := nKdBnk;
        end;

        CdsPV.Post;
        Next;
      end;
    end;

    TQryUtils.ReleaseQuery(QryTmp);

    with cdsPV do begin
      EnableControls;
      if bFlagDbg then
        SaveToFile(cDirTemp + 'cdsPv.cds');
      Close;
      Open;
      Last;
      First;
    end;
  end;
  popPvFilterBKOffClick(Self);
  LabelProcess.Caption := '';
  SetCdsPvIndex;
  PanelWait.Visible := false;
  Screen.Cursor := crDefault;
  sBtnSumKVupl.Enabled := cdsPV.Active and (cdsPV.RecordCount > 0);
  bNeedSave := false;
end;

//------------------------------------------------------------------------------
procedure TFormVedV.sBtnSaveVedCmnClick(Sender: TObject);
var bSvFiltered, bIsRecToSaved : boolean;
    nSvNR : integer; cSvFilter : ShortString;
begin
  nSvNR := cdsPvNR.AsInteger;
  // Проверить, не стоит ли фильтр. Если стоит - снять.
  bSvFiltered    := cdsPV.Filtered;
  cSvFilter      := cdsPV.Filter;
  cdsPV.Filtered := false;
  // Проверить, есть ли неНулевые суммы в cdsPV
  bIsRecToSaved := false;
  with cdsPV do begin
    DisableControls;
    First;
    while not Eof do begin
      if (not cdsPVSmOper.IsNull) and (cdsPVSmOper.AsFloat > 0) then begin
        bIsRecToSaved := true;
        Break;
      end;
      Next;
    end;
    //Locate('NR', nSvNR, []);
    //EnableControls;
  end;
  if not bIsRecToSaved then begin
    ShowMessage('Не обнаружено записей для сохранения');
    cdsPV.Filter   := cSvFilter;
    cdsPV.Filtered := bSvFiltered;
    cdsPV.Locate('NR', nSvNR, []);
    cdsPV.EnableControls;
    Exit;
  end;
  if MessageDlg('Все "плюсовые" записи сохраняются в таблицы' + #13#10 +
                '"Отклонения" и "Начисления/Удержания". Согласны?:', mtWarning,
                                         [mbYes, mbNo], 0) <> mrYes then begin
    cdsPV.Filter   := cSvFilter;
    cdsPV.Filtered := bSvFiltered;
    cdsPV.Locate('NR', nSvNR, []);
    cdsPV.EnableControls;
    Exit;
  end;
  // Сохранить ведомость в таблицы Z_OTKL и Z_NU, повыключать
  // все sBtn'ы, кроме "Печать" и "В Банк";
  if bIsFormShwNu then
    FormShwNu.Close;
  Application.ProcessMessages;
  if qryVed.State = dsInsert then begin
    n_NewVedNR := DmMain.NewVedNR;
    qryVed.FieldByName('VedNR').AsInteger := n_NewVedNR;
    qryVed.Post;
  end;
  bNewVedSaved := true;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Alter TRIGGER ZOTKL_AI INACTIVE');  {After Insert}
    ExecSQL;          // Чтобы не "краснели" записи в Z_SPS
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, PDN, KdSpZ, Notes, Kto, PrR, Spec_NR, ' +
            ' DtVdPV, NrVdPV, MyNotes, PBnk, KdBnk) values ' +
            ' (:nKdSps, :dDtProc, :dZaMesGod, :nTabN, :cVidN, :nSumma, ' +
            ' :nKdObj, :nKdKatP, :nPDN, :nKdSpZ, :cNotes, :nKto, :nPrR, ' +
            ' :nSpec_NR, :dDtVdPV, :nNrVdPV, :cMyNotes, :nPBnk, :nKdBnk)');
    ParamByName('nKdSps').AsInteger := n_KdSps;
    ParamByName('dDtProc').AsDateTime := d_DtPrc;
    ParamByName('dZaMesGod').AsDateTime := d_DtPrc;
    ParamByName('nPdn').AsInteger := 1;
    ParamByName('nKdSpZ').AsInteger := nVedKdSpZ; ///////////
    ParamByName('cNotes').AsString := '';
    ParamByName('nKto').AsInteger := n_KdUsr;
    ParamByName('nPrR').AsInteger := 0;
    ParamByName('nSpec_NR').AsInteger := 0;
    ParamByName('dDtVdPV').AsDateTime := qryVedVedDate.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVedNR.AsInteger;
    ParamByName('cMyNotes').AsString := '';
    ParamByName('nPBnk').AsInteger := 7;
    Prepare;
  end;
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_NU (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, PDN, KdSpZ, Notes, Kto, PrR, Spec_NR, ' +
            ' MyNotes, DtVdPV, NrVdPV, KdBnk) values ' +
            ' (:nKdSps, :dDtProc, ' +
            ' :dZaMesGod, :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, ' +
            ' :nPDN, :nKdSpZ, :cNotes, :nKto, :nPrR, :nSpec_NR, ' +
            ' :cMyNotes, :dDtVdPV, :nNrVdPV, :nKdBnk)');
    ParamByName('nKdSps').AsInteger := n_KdSps;
    ParamByName('dDtProc').AsDateTime := d_DtPrc;
    ParamByName('dZaMesGod').AsDateTime := d_DtPrc;
    ParamByName('nPdn').AsInteger := 1;
    ParamByName('nKdSpZ').AsInteger := nVedKdSpZ;
    ParamByName('cNotes').AsString := '';
    ParamByName('nKto').AsInteger := n_KdUsr;
    ParamByName('nPrR').AsInteger := 0;
    ParamByName('nSpec_NR').AsInteger := 0;     // TYTYTYT
    ParamByName('cMyNotes').AsString := '';
    ParamByName('dDtVdPV').AsDateTime := qryVedVedDate.AsDateTime;
    ParamByName('nNrVdPV').AsInteger  := qryVedVedNR.AsInteger;
    Prepare;
  end;

////  Form_Dm.DbMain.StartTransaction; //       .DbMain.StartTransaction;
  TRY
    with cdsPV do begin
      DisableControls;
      First;
      while not Eof do begin
        if (not cdsPVSmOper.IsNull) and (cdsPVSmOper.AsFloat > 0) then begin
          // В отклонения
          qryTmp.ParamByName('nTabN').AsInteger := cdsPVTabN.AsInteger;
          qryTmp.ParamByName('nKdObj').AsInteger := cdsPVKdObj.AsInteger;
          qryTmp.ParamByName('nKdKatP').AsInteger := cdsPVKdKatP.AsInteger;
          qryTmp.ParamByName('nSumma').AsFloat := -RoundTo(cdsPVSmOper.AsFloat,-2);
          if cdsPVKdBnk.IsNull or (cdsPVKdBnk.AsInteger = 0) then
            qryTmp.ParamByName('cVidN').AsString := '7509'  // вид РасхОрдер
          else
            qryTmp.ParamByName('cVidN').AsString := '7511'; // вид В Банк
          qryTmp.ParamByName('nKdBnk').AsInteger := cdsPVKdBnk.AsInteger;
          // В Z_NU
          qryTmp2.ParamByName('nTabN').AsInteger := cdsPVTabN.AsInteger;
          qryTmp2.ParamByName('nKdObj').AsInteger := cdsPVKdObj.AsInteger;
          qryTmp2.ParamByName('nKdKatP').AsInteger := cdsPVKdKatP.AsInteger;
          qryTmp2.ParamByName('nSumma').AsFloat := -RoundTo(cdsPVSmOper.AsFloat,-2);
          if cdsPVKdBnk.IsNull or (cdsPVKdBnk.AsInteger = 0) then
            qryTmp2.ParamByName('cVidN').AsString := '7509'  // вид РасхОрдер
          else
            qryTmp2.ParamByName('cVidN').AsString := '7511'; // вид В Банк
          qryTmp2.ParamByName('nKdBnk').AsInteger := cdsPVKdBnk.AsInteger;
          qryTmp.ExecSQL;
          qryTmp2.ExecSQL;
        end;
        Next;
      end;
      Filter := cSvFilter;
      Filtered := bSvFiltered;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
////    Form_Dm.DbMain.Commit;

  EXCEPT
////    Form_Dm.DbMain.Rollback;
  RAISE;
    // Nothing (по крайней мере пока)
  END;

  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if Prepared then
      UnPrepare;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Alter TRIGGER ZOTKL_AI ACTIVE');  {After Insert}
    ExecSQL;          // Пусть опять "краснеют" записи в Z_SPS
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if Prepared then
      UnPrepare;
    DataBaseName := '';
  end;
  qryVed.Next; // чтобы перечиталась ведомость
  bNewVedSaved := true;
  sBtnSumKVupl.Enabled := false;
  sBtnShwZadanie.Enabled := false;
  sBtnSaveVedCmn.Enabled := false;
  sBtnSpisok.Enabled := false; // если не выключить все бутоны, может возникнуть
end; // спокуса тут же почистить список и создать след. ведомость, а сие чревато
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnInfoClick(Sender: TObject);
var nSvTabN, nCntTts  : integer;
    nKdBnk : SmallInt; nSmm, nSmTts : double;
    bSvFiltered : boolean; cSvFilter : ShortString;
begin
  if PanelInf2.Visible then begin
    PanelInf2.Visible := false;
    Exit;
  end;
  Screen.Cursor := crSQLWait;
  with cdsPV do begin
    bSvFiltered := Filtered;
    cSvFilter := Filter;
    nSvTabN := cdsPVTabN.AsInteger;
    Filtered := false;
    if RecordCount <= 0 then begin
      Filter := cSvFilter;
      Filtered := bSvFiltered;
      Locate('TabN', nSvTabN, []);
      Screen.Cursor := crDefault;
      Exit;
    end;
  end;
  with cdsInf do begin
    if Active then Close;
    CreateDataSet;
    Open;
    DisableControls;
  end;
  with cdsPV do begin
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('KdBnk').IsNull or
                               (FieldByName('KdBnk').AsInteger = 0) then
        nKdBnk := 0
      else
        nKdBnk := FieldByName('KdBnk').AsInteger;
      nSmm := FieldByName('SmOper').AsFloat;
      if nSmm <> 0 then
        AddInfInCdsInf(nKdBnk, nSmm);
      Next;
    end;
    Filter := cSvFilter;
    Filtered := bSvFiltered;
    Locate('TabN', nSvTabN, []);
    EnableControls;
  end;
  with cdsInf do begin
    nCntTts := 0;
    nSmTts  := 0;
    First;
    while not Eof do begin
      nCntTts := nCntTts + cdsInfCnt.AsInteger;
      nSmTts  := nSmTts + cdsInfSumma.AsFloat;
      Next;
    end;
    Append;
    cdsInfKdBnk.AsInteger := 9999;
    cdsInfNmBnk.AsString := 'Всего';
    cdsInfCnt.AsInteger := nCntTts;
    cdsInfSumma.AsFloat := nSmTts;
    Post;
    First;
    EnableControls;
  end;
  Screen.Cursor := crDefault;
  PanelInf2.Top  := Round((dbgrPV.Height - PanelInf2.Height) / 2);
  PanelInf2.Left := dbgrPV.Left + Round((dbgrOtkl.Width - PanelInf2.Width) / 2);
  PanelInf2.Visible := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnInfCloseClick(Sender: TObject);
begin
//  PanelInf.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.bBtnBack2Click(Sender: TObject);
var nDlgResult : word;
begin
  if PanelInf2.Visible then
    PanelInf2.Visible := false;
  if bNeedSave and bNewVedSaved then begin
    if bIsFormShwNu then
      FormShwNu.Close;
    Caption := 'Ведомости выплат';
    PageControl.ActivePage := tsVeds; end
  else if not bNeedSave then begin
    if bIsFormShwNu then
      FormShwNu.Close;
    if not bNewVedSaved then
      qryVed.Cancel;
    Caption := 'Ведомости выплат';
    PageControl.ActivePage := tsVeds; end
  else if bNeedSave and sBtnSaveVedCmn.Enabled then begin
    nDlgResult := MessageDlg('Ведомость не сохранена на диск. Сохранить?:',
                                       mtWarning, [mbYes, mbNo, mbCancel], 0);
    if nDlgResult = mrNo then begin
      if bIsFormShwNu then
        FormShwNu.Close;
      if not bNewVedSaved then
        qryVed.Cancel;
      Caption := 'Ведомости выплат';
      PageControl.ActivePage := tsVeds; end
    else if nDlgResult = mrYes then begin
      if bIsFormShwNu then
        FormShwNu.Close;
      sBtnSaveVedCmn.Click;
      Caption := 'Ведомости выплат';
      PageControl.ActivePage := tsVeds;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPrtKssOneVedClick(Sender: TObject);
var nCase, nKssVedNR : SmallInt; dKssVedDt : TDateTime; cKssVedNm : ShortString;
begin
  Application.ProcessMessages;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct bl.KdBnk, bl.LicSch, bl.DtBeg, ' +
            ' u.Fam, u.Ima, u.Otch, u.ID, o.NR, o.TabN, o.DtProc, ' +
            ' o.VidN, o.ShVidN, o.Summa, ' +
            ' o.PSCH, o.SchBU, o.KEKV, o.PRR, o.DtVdPV, o.NrVdPV, o.PBnk ' +
            ' from ViOtkl_Sps o ' +
            ' Left outer join Z_GET_BNKLS(o.TabN, :dBnkDtPrdF) bl on 1 = 1 ' +
            ' Left outer join z_Upi u on u.TabN = o.TabN ' +
            ' where o.dtProc = :dDtProc and o.NrVdPV = :nNrVdPV and ' +
            'o.VidN = "7509" ');
    SQL.Add(' order by o.TabN');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('dBnkDtPrdF').AsDateTime := qryVedBnkDtPrdF.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
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
    nCase := 1; // одной ведомостью                        {z_DpInfK}
    if GetDopKssInf(nCase, nKssVedNR, dKssVedDt, cKssVedNm) then begin
      Application.ProcessMessages;
      if qryVedKssVedNr.IsNull or (qryVedKssVedNr.AsInteger = 0) then begin
        qryVed.Edit;
        qryVedKssVedNr.AsInteger := nKssVedNR;
        qryVedKssVedDt.AsDateTime := dKssVedDt;
        qryVedKssVedNm.AsString := cKssVedNm;
        qryVed.Post;
      end;
      F6PrtVedKssOne(cdsPrt, nKssVedNR, dKssVedDt, cKssVedNm);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPrtKssByObjClick(Sender: TObject);
var nCase, nKssVedNR : SmallInt; dKssVedDt : TDateTime;
    cKssVedNm : ShortString;
    dVedDtProc, dDtNews : TDateTime;
begin
  Application.ProcessMessages;
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
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
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
      //if qryVedKssVedNr.IsNull or (qryVedKssVedNr.AsInteger = 0) then begin
        qryVed.Edit;
        qryVedKssVedNr.AsInteger := nKssVedNR;
        qryVedKssVedDt.AsDateTime := dKssVedDt;
        qryVedKssVedNm.AsString := cKssVedNm;
        qryVed.Post;
      //end;
      F6PrtVedKssByObj(cdsPrt, nKssVedNR, dKssVedDt, cKssVedNm);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPrtKssByObjReeClick(Sender: TObject);
var nKssVedNR : SmallInt; dKssVedDt : TDateTime; cKssVedNm : ShortString;
    dVedDtProc, dDtNews : TDateTime;
begin
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
(*
    SQL.Add('Select o.KdObj_Sps, ko.NmObj, o.PSch, o.PRR, ' +
            ' Sum(o.Summa) as SMM from ViOtkl_Sps o ' +
            ' Left Outer Join z_KdObj ko on ko.KdObj = o.KdObj_Sps ' +
            ' where o.dtProc = :dDtProc and o.NrVdPV = :nNrVdPV and ' +
            ' o.VidN = "7509" ' +        // "7509" - расх.ордер
            ' group by o.KdObj_Sps, ko.NmObj, o.PSch, o.Prr ');
*)
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
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
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPrtKssByOtchetClick(Sender: TObject);
var nKssVedNR : SmallInt; dKssVedDt : TDateTime; cKssVedNm : ShortString;
    dVedDtProc, dDtNews : TDateTime;
begin
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
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
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
    ShowMessage('Нет кассовых записей для отчета')
  else begin
    nKssVedNR := qryVedKssVedNr.AsInteger;
    dKssVedDt := qryVedKssVedDt.AsDateTime;
    cKssVedNm := qryVedKssVedNm.AsString;
    F6PrtVedKssZvitByObj(cdsPrt, nKssVedNR, dKssVedDt, cKssVedNm);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPrtBnkOneVedClick(Sender: TObject);
var dVedDtProc, dDtPrdFile : TDateTime;
    cMyDir, cNmPrdDoc : ShortString;
    nNrPrdFile, nKdBnk, i : SmallInt;
    mBnkLst : TStringList;
    nSvQryVedNR : integer;
begin
{
   Требования ИмексБанка к файлу с декабря 2008 г. (Александр)
 1. Имя файла #43861328ДДММГГ.zNN
    "решеточка" + ОКПО (8символов) + дата DDMMYY + '.z' + н-р файла за день
    например, #43861328181208.z01
 2. В файле 1-я строка Дата в формате ДД-ММ-ГГГГ       + ';' +
                       Количество инф. строк (без 1-й) + ';' +
                       Сумма по файлу      123456.65
 3. Инф. строки: ЛС + ';' + ИД + ';' + ФИО + ';' + Сумма + ';' + Назн. платежа
         т.е. разделители -  ';'
 4. Отправлять на zpl_ved@imexodessa.od.ua

   Для СибБанка ведомость такая же, как и для всех. А файл для передачи в банк
   типа .dbf должен браться из таблицы Ex_Tmplts (код 141 Sib_Bank.dbf),
   очищаться и заполняться данными
}
  nSvQryVedNR := qryVedNR.AsInteger;
  cMyDir := 'c:\T_e_m_p\';
  if not DirectoryExists(cMyDir) then
    ForceDirectories(cMyDir);
  Application.ProcessMessages;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if qryVedTypeVed.AsString = 'VedSpB' then
      SQL.Add('Select distinct bl.KdBnk, bl.LicSch, bl.DtBeg, ' +
              ' u.Fam, u.Ima, u.Otch, u.ID, o.NR, o.TabN, o.DtProc, o.VidN, ' +
              ' o.ShVidN, o.Summa, o.PSCH, o.SchBU, o.KEKV, o.PRR, ' +
              ' o.DtVdPV, o.NrVdPV, o.PBnk, o.KdBnk from ViOtkl_Sps o ' +
              ' Left outer join Z_BankiLS bl on bl.TabN = o.TabN and ' +
              ' bl.KdBnk = o.KdBnk and (bl.SpB = "Y") and ' +
              ' (bl.Cls is NULL or bl.Cls <> "Y") ' +
              ' Left outer join z_Upi u on u.TabN = o.TabN ' +
              ' where o.DtProc = :dDtProc ' +
              ' and o.NrVdPv = :nNrVdPV and o.VidN in ("7511", "7519") ')
    else
      SQL.Add('Select distinct bl.KdBnk, bl.LicSch, bl.DtBeg, ' +
              ' u.Fam, u.Ima, u.Otch, u.ID, o.NR, o.TabN, o.DtProc, o.VidN, ' +
              ' o.ShVidN, o.Summa, o.PSCH, o.SchBU, o.KEKV, o.PRR, ' +
              ' o.DtVdPV, o.NrVdPV, o.PBnk, o.KdBnk from ViOtkl_Sps o ' +
              ' Left outer join Z_GET_BNKLS(o.TabN, :dVedDate) bl on 1 = 1 ' +
              ' Left outer join z_Upi u on u.TabN = o.TabN ' +
              ' where o.dtProc = :dDtProc and o.NrVdPv = :nNrVdPV and ' +
              ' o.VidN in ("7511","7519") ');  // в банк и в сберкассу
    SQL.Add(' order by bl.KdBnk, u.Fam, u.Ima, u.Otch');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    if qryVedTypeVed.AsString = 'VedVupl' then
      ParamByName('dVedDate').AsDateTime := qryVedVedDate.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVedNr.AsInteger;
  end;
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnBnkFIO', 'KdBnk;Fam;Ima;Otch', []);
    IndexName := 'OnBnkFIO';
    First;
    if bFlagDbg then
      SaveToFile(cMyDir + 'BnkFIO.cds');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет записей для банка')
  else begin
    with qryVed do begin
      dVedDtProc  := FieldByName('DtProc').AsDateTime;
      nNrPrdFile  := qryVedBnkNrPrdF.AsInteger;
      dDtPrdFile  := qryVedBnkDtPrdF.AsDateTime;
      cNmPrdDoc   := qryVedBnkNmPrdF.AsString;
      if dDtPrdFile = 0 then
        dDtPrdFile := Date;
      if nNrPrdFile = 0 then
        nNrPrdFile := 1;
    end;
    mBnkLst := TStringList.Create;
    with cdsPrt do begin
      First;
      while not Eof do begin
        nKdBnk := FieldByName('KdBnk').AsInteger;
        if nKdBnk > 0 then
          mBnkLst.Add(FieldByName('KdBnk').AsString);
        while (FieldByName('KdBnk').AsInteger = nKdBnk) and not Eof do begin
          Next;
        end;
      end;
    end;
    if bFlagDbg then
      mBnkLst.SaveToFile(cMyDir + 'BnkLst.lst');
    for i := 0 to mBnkLst.Count-1 do begin
      nKdBnk := StrToInt(mBnkLst[i]);
      if GetDopBnkInf(nKdBnk, dDtPrdFile,
                          nNrPrdFile, cNmPrdDoc) {z_DpInfB} then begin
        //if qryVedBnkDtPrdF.IsNull then begin
          qryVed.Edit;
          qryVedBnkDtPrdF.AsDateTime := dDtPrdFile;
          qryVedBnkNrPrdF.AsInteger := nNrPrdFile;
          qryVedBnkNmPrdF.AsString := cNmPrdDoc;
          qryVed.Post;
        //end;
        // cdsPrt передаю со всеми возможными KdBnk,
        // а печататься должен только передаваемый nKdBnk
        F6PrtVedBnkOneVed(nKdBnk, cdsPrt, nNrPrdFile,   {Z_CmnPrt}
                                        dDtPrdFile, dVedDtProc, cNmPrdDoc);
      end;
    end;
    qryVed.Locate('NR', nSvQryVedNR, []);
    mBnkLst.Destroy;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPrtBnkByObjClick(Sender: TObject);
var dDtPrdFile : TDateTime;
    cMyDir, cNmPrdDoc : ShortString;
    nNrPrdFile, nKdBnk, i : SmallInt;
    mBnkLst : TStringList;
    dVedDtProc, dDtNews : TDateTime;
begin
  cMyDir := 'c:\T_e_m_p\';
  if not DirectoryExists(cMyDir) then
    ForceDirectories(cMyDir);
  Application.ProcessMessages;
  dDtNews := EncodeDate(2007, 12, 1); // Начало работы с новой схемой Z_SPS
  dVedDtProc := qryVedDtProc.AsDateTime;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if dVedDtProc < dDtNews then
      SQL.Add('Select distinct bl.KdBnk, bl.LicSch, bl.DtBeg, ' +
              ' u.Fam, u.Ima, u.Otch, u.ID, o.* ' +
              ' from ViOtkl_Sps o ' +
              ' Left outer join Z_GET_BNKLS(o.TabN, :dBnkDtPrdF) bl on 1 = 1 ' +
              ' Left outer join z_Upi u on u.TabN = o.TabN ' +
              ' where o.dtProc = :dDtProc and o.nrVdPV = :nNrVdPV and ' +
              ' o.VidN in ("7511","7519") ' +   // в банк и в сберкассу
              ' order by bl.KdBnk, u.Fam, u.Ima, u.Otch')
    else // в БД добавил просмотр ViOtkl_SpsNew, в Z_Sps в поле OldKdObj
         // записывется основной KdObj по Z_Pere на последнее число месяца
      SQL.Add('Select distinct bl.KdBnk, bl.LicSch, bl.DtBeg, u.Fam, u.Ima, ' +
              ' u.Otch, u.ID,  o.NR, o.OldKdObj_Sps as KdObj_Sps, ' +
              ' o.TabN, o.DtProc, o.VidN, o.ShVidN, o.Summa, ' +
              ' o.PSCH, o.SchBU, o.KEKV, o.PRR, o.DtVdPV, o.NrVdPV, o.PBnk ' +
              ' from ViOtkl_SpsNew o ' +
              ' Left outer join Z_GET_BNKLS(o.TabN, :dBnkDtPrdF) bl on 1 = 1 ' +
              ' Left outer join z_Upi u on u.TabN = o.TabN ' +
              ' where o.dtProc = :dDtProc and o.KdObj_Sps = o.OldKdObj_Sps ' +
              ' and o.NrVdPV = :nNrVdPV and ' +
              ' o.VidN in ("7511","7519") ' +  // Виды в банк и в сберкассу
              ' order by bl.KdBnk, u.Fam, u.Ima, u.Otch');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('dBnkDtPrdF').AsDateTime := qryVedBnkDtPrdF.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnBnkObjFIO', 'KdBnk;KdObj_Sps;Fam;Ima;Otch', []);
    IndexName := 'OnBnkObjFIO';
    First;
    if bFlagDbg then
      SaveToFile(cMyDir + 'BnkObjFIO.cds');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет записей для банка')
  else begin
    with qryVed do begin
      dVedDtProc  := FieldByName('DtProc').AsDateTime;
      nNrPrdFile  := qryVedBnkNrPrdF.AsInteger;
      dDtPrdFile  := qryVedBnkDtPrdF.AsDateTime;
      cNmPrdDoc   := qryVedBnkNmPrdF.AsString;
      if dDtPrdFile = 0 then
        dDtPrdFile := Date;
      if nNrPrdFile = 0 then
        nNrPrdFile := 1;
    end;
    mBnkLst := TStringList.Create;
    with cdsPrt do begin
      First;
      while not Eof do begin
        nKdBnk := FieldByName('KdBnk').AsInteger;
        mBnkLst.Add(FieldByName('KdBnk').AsString);
        while (FieldByName('KdBnk').AsInteger = nKdBnk) and not Eof do begin
          Next;
        end;
      end;
    end;
    if bFlagDbg then
      mBnkLst.SaveToFile(cMyDir + 'BnkLst.lst');
    for i := 0 to mBnkLst.Count-1 do begin
      nKdBnk := StrToInt(mBnkLst[i]);
      if GetDopBnkInf(nKdBnk, dDtPrdFile,
                          nNrPrdFile, cNmPrdDoc) {z_DpInfB} then begin
        if qryVedBnkDtPrdF.IsNull then begin
          qryVed.Edit;
          qryVedBnkDtPrdF.AsDateTime := dDtPrdFile;
          qryVedBnkNrPrdF.AsInteger := nNrPrdFile;
          qryVedBnkNmPrdF.AsString := cNmPrdDoc;
          qryVed.Post;
        end;
        // cdsPrt передаю со всеми возможными KdBnk,
        // а печататься должен только передаваемый nKdBnk
        F6PrtVedBnkByObj(nKdBnk, cdsPrt, nNrPrdFile,  {z_CmnPrt}
                     dDtPrdFile, dVedDtProc, cNmPrdDoc);
      end;
    end;
    mBnkLst.Destroy;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then begin
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где нужно, пользуйтесь контекстными меню');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPrtPopup(Sender: TObject);
begin
  popPrtBnkOneVed.Enabled := (qryVedTYPEVED.AsString <> 'VedMgKss') and
                                (qryVedTYPEVED.AsString <> 'Ved7509')   ;
  popPrtBnkByObj.Enabled := popPrtBnkOneVed.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popSortObjTabNClick(Sender: TObject);
begin
  if not popSortObjTabN.Checked then begin
    popSortObjTabN.Checked := true;
    popSortObjFio.Checked := false;
    popSortTabN.Checked := false;
    popSortFio.Checked := false;
    SetCdsPvIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popSortObjFioClick(Sender: TObject);
begin
  if not popSortObjFio.Checked then begin
    popSortObjTabN.Checked := false;
    popSortObjFio.Checked := true;
    popSortTabN.Checked := false;
    popSortFio.Checked := false;
    SetCdsPvIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popSortTabNClick(Sender: TObject);
begin
  if not popSortTabN.Checked then begin
    popSortObjTabN.Checked := false;
    popSortObjFio.Checked := false;
    popSortTabN.Checked := true;
    popSortFio.Checked := false;
    SetCdsPvIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popSortFioClick(Sender: TObject);
begin
  if not popSortFio.Checked then begin
    popSortObjTabN.Checked := false;
    popSortObjFio.Checked := false;
    popSortTabN.Checked := false;
    popSortFio.Checked := true;
    SetCdsPvIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.SetCdsPvIndex;
begin
  with cdsPv do begin
    if popSortObjTabN.Checked then begin
      IndexName := 'cdsPvObjTabN';
      LabelSortInfo.Caption := 'Сортировка: Подразделение, ТабНр'; end
    else if popSortObjFio.Checked then begin
      IndexName := 'cdsPvObjFio';
      LabelSortInfo.Caption := 'Сортировка: Подразделение, Фамилия И.О.'; end
    else if popSortTabN.Checked then begin
      IndexName := 'cdsPvTabN';
      LabelSortInfo.Caption := 'Сортировка: по Табельному Номеру'; end
    else {if popSortFio.Checked then} begin
      IndexName := 'cdsPvFio';
      LabelSortInfo.Caption := 'Сортировка: по Фамилии И.О.';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPVPopup(Sender: TObject);
begin
  popPvDelRec.Enabled   := cdsPv.Active and (cdsPv.RecordCount > 0);
  popPvSort.Enabled     := popPvDelRec.Enabled;
  popPvFilterBK.Enabled := cdsPv.Active and
                             (cdsPV.Filtered or (cdsPv.RecordCount > 0));
  popPvShwNu.Enabled    := popPvDelRec.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.qryVedCalcFields(DataSet: TDataSet);
var nKdKatUsr : integer; cNmUsr, cPswUsr, cVkl : string;
begin
  if (not qryVedKdUsr.IsNull) and (qryVedKdUsr.AsInteger >= 0) and
             Form_Dm.GetUsrInfo(qryVedKdUsr.AsInteger, nKdKatUsr,
                                                 cNmUsr, cPswUsr, cVkl) then
    qryVedNmUsr.AsString := cNmUsr;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnSpisokClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnSpisok.Top + 54;
  Y := Left + sBtnSpisok.Left + 6;
  popCreSpsCustom.Visible  := true;
  popCreSpsWithPom.Visible := true;
  popCreSpsBez.Visible     := true;
  if (not cdsPV.Active) or (cdsPV.RecordCount = 0) then begin
    popCreSpsCustom.Enabled  := true;
    popCreSpsWithPom.Enabled := true;
    popCreSpsBez.Enabled     := true; end
  else begin
    popCreSpsCustom.Enabled  := false;
    popCreSpsWithPom.Enabled := false;
    popCreSpsBez.Enabled     := false;
  end;
  popCreSps.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.SetDbgrPvLittleShw;
var i : SmallInt; cUpper : ShortString;
begin
  for i := 0 to dbgrPv.Columns.Count-1 do begin
    with dbgrPV.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'NR') or (cUpper = 'TABN') or (cUpper = 'KDOBJ') or
            (cUpper = 'FAMIO') or (cUpper = 'KDBNK') or (cUpper = 'LS') then
        Visible := true
      else if (cUpper = 'NOTINCURSPS') then
        Visible := bFlagDbg
      else
        Visible := false;
      if cUpper = 'TABN' then
        ReadOnly := false
      else if cUpper = 'SMOPER' then
        ReadOnly := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popCreSpsCustomClick(Sender: TObject);
begin   // создать список вручную
  CreOpenCdsPV;
  SetDbgrPvLittleShw;
  LbxIsTabN.Items.Clear;
  bCustomInputInCdsPV := true;
  PanelCustInput.Top := Round((dbgrPV.Height - PanelCustInput.Height) / 2);
  PanelCustInput.Left := Round((dbgrPV.Width - PanelCustInput.Width) / 2) + 45;
  PanelCustInput.Visible := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popCreSpsBezClick(Sender: TObject);
begin   // пропустить пункт создания списка
  sBtnSumKVupl.Enabled := true;
  sBtnSpisok.Enabled := false;
  SetCdsPvIndex;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.cdsPVTabNSetText(Sender: TField; const Text: String);
var cText : string; nTabN : integer;
    cFamIO, cFam, cIma, cOtch, cPol, cID : string; dDOB : TDateTime;
    nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpZ, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double; cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs, {bInv,} bIsInSps, bSpbLS, bLsClosed : boolean;
    cLicSch, cShBnk, cNmBnk : ShortString;
    nKdBnk, nInv : SmallInt; dDtVed, dBnkDtBeg : TDateTime;
begin
  cText := Text;
  nKdObj := 0;
  nKdKatP := 0;
  nKdBnk := 0;
  dDtVed := qryVedBnkDtPrdF.AsDateTime;
  if cText <> '' then begin
    nTabN := StrToInt(cText);              {z_TUpi}
    if bCustomInputInCdsPV and (LbxIsTabN.Items.IndexOf(cText) >= 0) then
      Raise Exception.Create('Нельзя  один табельный номер  в  одну' + #13#10 +
                             'ведомость вводить больше одного раза')
    else if DmMain.GetUpiInfo(nTabN, cFamIO, cFam, cIma, cOtch,      {z_Dm}
                                                    cPol, cID, dDOB) then begin
      // проверить, есть ли введенный ТабН в списке текущего месяца
      // если нет - диалог "Что делать"
      bIsInSps := DmMain.CheckTabNInSps(nTabN, d_DtPrc);
      if not bIsInSps and (MessageDlg('Табельного номера ' + IntToStr(nTabN) +
                      ' нет в списке текущего месяца. Добавить?:',
                          mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then begin
        Sender.AsString      := '';
        cdsPvFamIO.AsString  := '';
        cdsPvKdObj.AsString  := '';
        cdsPvKdKatP.AsString := '';
        cdsPvKdBnk.AsString  := '';
        cdsPvLS.AsString     := ''; end
      else begin
        Sender.AsString := cText;
        cdsPvFamIO.AsString := cFamIO;
        DmMain.GetPereInf(nTabN, d_DtPrc, nKdObj, nKdKatP, nSO, nPdNlg,
                                nKolMin, nKdSpZ, nRang, nRazr, nOklTrf,
                               nAvans, nProcLG, cSpAv, cDolgnost, cNrPrikaza,
                              dDtPrikaza, bPens, bSovm, bPrfs, nInv);
        if nKdObj <> 0 then begin
          cdsPvKdObj.AsInteger  := nKdObj;
          cdsPvKdKatP.AsInteger := nKdKatP;
          // Добавить банк и ЛС (если есть)
        end;
        DmMain.GetBankLS(nTabN, dDtVed,
                 dBnkDtBeg, nKdBnk, cShBnk, cNmBnk, cLicSch, bSpbLS, bLsClosed);
        if not bLsClosed and (cLicSch > '') and (nKdBnk <> 0) then begin
          cdsPvKdBnk.AsInteger := nKdBnk;
          cdsPvLS.AsString     := cLicSch;
        end;
        if not bIsInSps then // запомнить и добавить в Z_Sps при сохранении
          cdsPvNotInCurSps.AsBoolean := true;
      end; end
    else
      Raise Exception.Create('Нет в таблице "Сотрудники" табельного номера "' +
                                                                  cText + '"');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.PageControlResize(Sender: TObject);
begin
  if bCustomInputInCdsPV then begin
    PanelCustInput.Top := Round((dbgrPV.Height - PanelCustInput.Height) / 2);
    PanelCustInput.Left := Round((dbgrPV.Width - PanelCustInput.Width) / 2) + 45;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.SpeedButton1Click(Sender: TObject);
begin
  PanelCustInput.Visible := false;
end;
{
//------------------------------------------------------------------------------
procedure TFormVedV.popCreSps_14Click(Sender: TObject);
begin
  PanelCustInput.Visible := false;
  if MessageDlg('Будут удалены все записи в таблице. Согласны?:', mtWarning,
                                        [mbYes, mbNo], 0) = mrYes then begin
    CreOpenCdsPv;
    sBtnSumKVupl.Enabled := false;
    sBtnShwZadanie.Enabled := false;
    sBtnInfo.Enabled := false;
    sBtnSaveVedCmn.Enabled := false;
    if bCustomInputInCdsPV then begin
      PanelCustInput.Visible := true;
      LbxIsTabN.Items.Clear;
    end;
  end;
end;
}
//------------------------------------------------------------------------------
procedure TFormVedV.cdsPVAfterPost(DataSet: TDataSet);
begin
  if bCustomInputInCdsPV then begin
    sBtnSumKVupl.Enabled := cdsPv.RecordCount > 0;
    LbxIsTabN.Items.Add(cdsPvTabN.AsString);
  end;
  if not cdsPvKdBnk.IsNull then
    CheckCdsFilterBK(cdsPvKdBnk.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.CheckCdsFilterBK(nKdBnk : SmallInt);
var cShBnk, cNmBnk : ShortString;
begin
  with cdsFilterBK do begin
    if not Active then begin
      IndexName := '';
      CreateDataSet;
      Open;
      IndexName := 'OnKdBnk';
    end;
    if not Locate('KdBnk', nKdBnk, []) then begin
      cNmBnk := DmMain.KdBnk2NmBnk(nKdBnk, cShBnk);
      Append;
      FieldByName('KdBnk').AsInteger := nKdBnk;
      FieldByName('ShBnk').AsString := cShBnk;
      FieldByName('NmBnk').AsString := cNmBnk;
      Post;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.cdsPVAfterDelete(DataSet: TDataSet);
begin
  if bCustomInputInCdsPV then
    sBtnSumKVupl.Enabled := cdsPv.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPvDelRecClick(Sender: TObject);
var i : SmallInt;
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbNo, mbYes], 0) = mrYes then begin
    i := LbxIsTabN.Items.IndexOf(cdsPvTabN.AsString);
    if i >= 0 then
      LbxIsTabN.Items.Delete(i);
    cdsPv.Delete;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.cdsPVBeforeEdit(DataSet: TDataSet);
var cTabN : ShortString; i : SmallInt;
begin
  // Удаляю их LbxIsTabN сей TabN - AfterPost запишет новый или тот же,
                                                    // если введут тот же
  if bCustomInputInCdsPV and
       (UpperCase(dbgrPv.SelectedField.FieldName) = 'TABN') then begin
    cTabN := cdsPvTabN.AsString;
    i := LbxIsTabN.Items.IndexOf(cTabN);
    if i >= 0 then
      LbxIsTabN.Items.Delete(i);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnSumKVuplClick(Sender: TObject);
var cMyDbgPSch, cZdPSch, Synth : ShortString;
    bIsSps, bIsResRecs, bSchBuExclude, bVidsExclude, bObjExclude : boolean;
//    nDlgResult : SmallInt;
    bSvFiltered : boolean;
    cSvFilter: ShortString;
begin
  if bIsFormShwNu then
    FormShwNu.Close;

  Application.ProcessMessages;
  with cdsPv do begin
    bSvFiltered := Filtered;
    cSvFilter   := Filter;
    Filtered    := false;
  end;
  Application.ProcessMessages;
  cZdPSch := '';
  bIsResRecs := false;     // есть ли записи с результатами

  // >> z_VbVids
  if GetSchLstVids(d_DtPrc, cZdPSch, Synth, nVedKdSpZ,
    LbxSchBU, LbxVids, LbxNuObj, bSchBuExclude, bVidsExclude, bObjExclude) then
  begin
    PanelCustInput.Visible := false;
    cMyDbgPSch := Copy(cZdPSch, 1, 4);           ///// TYTYTYTYT

   if bIsFormShwNu then
      FormShwNu.Close;

    Application.ProcessMessages;
    // Могут быть два случая:
    // 1 - создан список. Формирую только для ТабН, включенных в список
    // 2 - список не создавался. Выборку делаю по всему Z_NU, и всех попавших
    //     в условие выборки включаю в список
    bIsSps := cdsPv.Active and (cdsPv.RecordCount > 0);
    if bIsSps then begin
      TQryUtils.InitQuery(QryNU);

      with QryNU do begin
        DataSource := DsrcPv;

        SQL.Text :=
          'select TabN, PSCH, SchBU, VidN, ShVidN, KdObj, Sum(Summa) as SMM ' +
          'from ViNuMain ' +
          'where DtProc = :DtProc ' +
            'and TabN = :TabN ' +
            'and VidN < "8000" ' +
          'group by TabN, PSCH, SchBU, VidN, ShVidN, KdObj';

        ParamByName('DtProc').AsDateTime := d_DtPrc;
      end;

      SetCdsPvIndex;

      CdsPv.First;
      QryNU.Open;

      // (у QryNU.DataSource := DsrcPv)
      while not CdsPv.Eof do begin
        if QryNU.RecordCount > 0 then
          Sborka(bIsSps, cZdPSch, Synth, bIsResRecs,
            bSchBuExclude, bVidsExclude, bObjExclude
          );

        cdsPv.Next;
      end;

      SetDbgrPVColumns;
      cdsPV.First;
      sBtnSpisok.Enabled := true;  {чтобы дать возможность очистить список}
      if bIsResRecs then begin
        sBtnSumKVupl.Enabled := false;
        sBtnShwZadanie.Enabled := true;
      end; end
    else begin
      LabelProcess.Caption := '';
      if not cdsPv.Active then
        CreOpenCdsPV;
      bCustomInputInCdsPV := false;

      TQryUtils.InitQuery(QryNU);

      with QryNU do begin
        DataSource := nil;

        SQL.Text :=
          'select TabN, PSCH, SchBU, VidN, ShVidN, KdObj, Sum(Summa) as SMM ' +
          'from ViNuMain ' +
          'where DtProc = :DtProc ' +
            'and VidN < "8000" ' +
// 'AND TABN = 11899 ' +
          'group by TabN, PSCH, SchBU, VidN, ShVidN, KdObj ';

        ParamByName('DtProc').AsDateTime := d_DtPrc;
        Open;

        // при проходе по qryNU будет заполняться cdsPv
        if RecordCount > 0 then
          Sborka(bIsSps, cZdPSch, Synth, bIsResRecs,
            bSchBuExclude, bVidsExclude, bObjExclude
          );
      end;

      SetCdsPvIndex;
      SetDbgrPVColumns;
      cdsPV.First;
      sBtnSpisok.Enabled := true;  {чтобы дать возможность очистить список}
      if bIsResRecs then begin
        sBtnSumKVupl.Enabled := false;
        sBtnShwZadanie.Enabled := true;
      end;
    end;
  end;
  with cdsPv do begin
    Filtered := false;
    Filter   := cSvFilter;
    Filtered := bSvFiltered;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVedV.Sborka(
  IsSps: Boolean;
  Accnt, Synth: ShortString;
  var IsResRecs: Boolean;
  SchBuExclude, VidsExclude, ObjExclude: Boolean
);
var nSmTtByPSch : double;
    nSmNach, nSmOsnV, nSmBoln, nSmPrem, nSmOtpTM, nSmOtpBM,
    nSmOtpNI, nSmSocPsb, nSmUdrg, nSmVupl : double; // по заданному PSch
    n_SmNach, n_SmOsnV, n_SmBoln, n_SmPrem, n_SmOtpTM, n_SmOtpBM, n_SmOtpNI,
    n_SmSocPsb, n_SmUdrg, n_SmVupl : double; // с уч.к-та nK_t (часть к выпл.)
    nSmTtByTabN : double; {контрольная цифра по всем ист.финансирования, чтобы
                           не переплатить}
    nK_t : double; // к-т для расчета сумм к выплате
    CurSmm: Double;
    FiltSch, SchBu, cVidN, cKdObj : ShortString; // ПСч,СубСч.,Вид и KdObj в тек.записи
    nTabN : integer;   // ТабНр в текущей записи
    bSelSch, bSelVid, bSelObj, bBoevaja : boolean;
    nCntAdd : SmallInt;
begin
  with qryNU do begin    // Внизу есть старый вариант (см.REZERV)
    nCntAdd := 0;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      nSmTtByTabN := 0;  // контрольная ИтогоНаРуки по всем ПСч
      nSmOsnV   := 0;    //   это группа переменных для сбора по заданному PSch
      nSmBoln   := 0;    //   (поля clNavy)
      nSmPrem   := 0;
      nSmOtpTM  := 0;
      nSmOtpBM  := 0;
      nSmOtpNI  := 0;
      nSmSocPsb := 0;
      nSmUdrg   := 0;
      nSmVupl   := 0;

      n_SmOsnV   := 0;   // а сие (c n_) - то, что предложится к выплате
      n_SmBoln   := 0;   //   (поля clMaroon)
      n_SmPrem   := 0;
      n_SmOtpTM  := 0;
      n_SmOtpBM  := 0;
      n_SmOtpNI  := 0;
      n_SmSocPsb := 0;
      n_SmUdrg   := 0;
      n_SmVupl   := 0;

      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        cVidN := FieldByName('VidN').AsString;
        SchBu := FieldByName('SchBu').AsString;
        cKdObj := FieldByName('KdObj').AsString;
        bSelSch := (LbxSchBu.Items.Count = 0) or
                  (SchBuExclude and (LbxSchBu.Items.IndexOf(SchBu) < 0)) or
                  (not SchBuExclude and (LbxSchBu.Items.IndexOf(SchBu) >= 0));
        bSelVid := (LbxVids.Items.Count = 0) or
                  (VidsExclude and (LbxVids.Items.IndexOf(cVidN) < 0)) or
                  (not VidsExclude and (LbxVids.Items.IndexOf(cVidN) >= 0));
        bSelObj := (LbxNuObj.Items.Count = 0) or
                  (ObjExclude and (LbxNuObj.Items.IndexOf(cKdObj) < 0)) or
                  (not VidsExclude and (LbxNuObj.Items.IndexOf(cKdObj) >= 0));

        // Из диалога выбора теперь могут быть выбраны как синтетические счета,
        // так и аналитические. В одном случае отбираем по счёту-родителю,
        // в другом - по счёту-потомку.
        if Synth = 'Y' then
          FiltSch := FieldByName('PSch').AsString
        else
          FiltSch := FieldByName('SchBu').AsString;

        CurSmm := FieldByName('SMM').AsFloat;
        nSmTtByTabN := nSmTtByTabN + CurSmm;

        if FiltSch = Accnt then begin
          if (cVidN > '7500') and (cVidN < '8000') then
            // выплаты
            nSmVupl := nSmVupl - CurSmm

          else if (cVidN > '6000') and (cVidN < '7500')
            and bSelSch and bSelObj then
            // удержания
            nSmUdrg := nSmUdrg - CurSmm

          else if (cVidN >= '1901') and (cVidN <= '1925')
            and bSelSch and bSelObj and bSelVid then
            // СоцПособия
            nSmSocPsb := nSmSocPsb + CurSmm

          else if ((cVidN = '2603') or (cVidN = '2606'))
            and bSelSch and bSelObj and bSelVid then
            // Больн., за счёт предприятия
            // SB 23.3.2026 По аналогии, наверное, и 2606
            nSmBoln := nSmBoln + CurSmm

          else if (cVidN > '2200') and (cVidN < '2400')
            and bSelSch and bSelObj and bSelVid then
            // Премии
            nSmPrem := nSmPrem + CurSmm

          else if ((cVidN = '2401') or (cVidN = '2402') or (cVidN = '2404')
              or (cVidN = '2409'))
            and bSelSch and bSelObj and bSelVid then
            // ОтпТМ
            nSmOtpTM := nSmOtpTM + CurSmm

          else if ((cVidN = '2403') or (cVidN = '2405') or (cVidN = '2410'))
            and bSelSch and bSelObj and bSelVid then
            // Отп.буд.мес
            nSmOtpBM := nSmOtpBM + CurSmm

          else if ((cVidN = '2406') or (cVidN = '2411'))
            and bSelSch and bSelObj and bSelVid then
            // Неисп.Отп
            nSmOtpNI := nSmOtpNI + CurSmm

          else if (cVidN < '2800') and bSelSch and bSelObj and bSelVid then
            // ОснВиды, в т.ч. Болн.за сч.предпр, но без Прочих
            nSmOsnV := nSmOsnV + CurSmm;
        end;

        Next;
      end;

      nK_t := 0;

      nSmNach :=
        nSmOsnV + nSmBoln + nSmPrem + nSmOtpTM + nSmOtpBM + nSmOtpNI;

      if (nSmNach <> 0) then begin
        nK_t := nSmUdrg / nSmNach;
        if nSmOsnV <> 0 then
          n_SmOsnV := nSmOsnV - nSmOsnV * nK_t;
        if nSmBoln <> 0 then
          n_SmBoln := nSmBoln - nSmBoln * nK_t;
        if nSmPrem <> 0 then
          n_SmPrem := nSmPrem - nSmPrem * nK_t;
        if nSmOtpTm <> 0 then
          n_SmOtpTm := nSmOtpTm - nSmOtpTm * nK_t;
        if nSmOtpBm <> 0 then
          n_SmOtpBm := nSmOtpBm - nSmOtpBm * nK_t;
        if nSmOtpNI <> 0 then
          n_SmOtpNI := nSmOtpNI - nSmOtpNI * nK_t;
      end;
                       //nSmTtByPSch := nSmNach  - nSmUdrg - nSmVupl;
      n_SmNach := nSmNach - nSmUdrg - nSmVupl;
      if n_SmNach > nSmTtByTabN then
        n_SmNach := nSmTtByTabN;
      if n_SmNach < 0 then
        n_SmNach := 0;
      if nSmSocPsb <> 0 then  // с СоцПособ не делаются удержания
        n_SmSocPsb := nSmSocPsb;
      bBoevaja := (nSmOsnV <> 0) or (nSmBoln <> 0) or (nSmPrem <> 0) or
                  (nSmOtpTM <> 0) or (nSmOtpBM <> 0) or (nSmOtpNI <> 0) or
                  (nSmSocPsb <> 0) or (nSmUdrg <> 0) or (nSmVupl <> 0) or
                  (n_SmOsnV <> 0) or (n_SmBoln <> 0) or (n_SmPrem <> 0) or
                  (n_SmOtpTM <> 0) or (n_SmOtpBM <> 0) or(n_SmOtpNI <> 0) or
                  (n_SmSocPsb <> 0) or (n_SmUdrg <> 0) or (n_SmVupl <> 0);
      IsResRecs := true;
      if IsSps then
        cdsPV.Edit
      else begin
        if {popCreSpsParamAll.Checked or} bBoevaja then begin
          Inc(nCntAdd);
          cdsPv.Append;
          cdsPvTabN.AsInteger := nTabN;
          AddDopInfAbout(nTabN);
          LabelProcess.Caption := IntToStr(nCntAdd) + ' ' + cdsPvTabN.AsString;
          LabelProcess.Refresh;
        end;
      end;
      if IsSps or {popCreSpsParamAll.Checked or} bBoevaja then begin
        cdsPVSmOsnV.AsFloat   := nSmOsnV;      // поля clNavy
        cdsPVSmBoln.AsFloat   := nSmBoln;      // то, что собрано по группам
        cdsPVSmPrem.AsFloat   := nSmPrem;
        cdsPVSmOtpTM.AsFloat  := nSmOtpTM;
        cdsPVSmOtpBM.AsFloat  := nSmOtpBM;
        cdsPVSmOtpNI.AsFloat  := nSmOtpNI;
        cdsPVSmSocPsb.AsFloat := nSmSocPsb;
        cdsPVSmNach.AsFloat   := nSmNach + nSmSocPsb;
        cdsPVSmUdrg.AsFloat   := nSmUdrg;
        cdsPVSmVupl.AsFloat   := nSmVupl;      // поля clNavy
        cdsPVK_t.AsFloat       := nK_t;
        cdsPVSm_OsnV.AsFloat   := n_SmOsnV;    // поля clMaroon
        cdsPVSm_Boln.AsFloat   := n_SmBoln;    // то, что предлагается к выплате
        cdsPVSm_Prem.AsFloat   := n_SmPrem;
        cdsPVSm_OtpTM.AsFloat  := n_SmOtpTM;
        cdsPVSm_OtpBM.AsFloat  := n_SmOtpBM;
        cdsPVSm_OtpNI.AsFloat  := n_SmOtpNI;
        cdsPVSm_SocPsb.AsFloat := n_SmSocPsb;  // поля clMaroon
        cdsPVSm_Nach.AsFloat   := n_SmNach + nSmSocPsb;
        cdsPVSmByTabN.AsFloat  := nSmTtByTabN;
        cdsPV.Post;
      end;
      if IsSps then
        Exit;
    end;
  end;

  if bFlagDbg then
    CDSPV.SaveToFile('SERGE_PV.CDS');
end;

//------------------------------------------------------------------------------
procedure TFormVedV.AddDopInfAbout(nTabN : integer);
var cFamIO, cFam, cIma, cOtch, cPol, cID : string; dDOB : TDateTime;
    nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpZ, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double; cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs, bIsInSps : boolean;
    nKdBnk, nInv : SmallInt;
begin
  nKdObj := 0;
  nKdKatP := 0;
  if DmMain.GetUpiInfo(nTabN, cFamIO, cFam, cIma, cOtch,    {z_Dm}
                                                   cPol, cID, dDOB) then begin
    bIsInSps := DmMain.CheckTabNInSps(nTabN, d_DtPrc);
    DmMain.GetPereInf(nTabN, d_DtPrc, nKdObj, nKdKatP, nSO, nPdNlg,
                                nKolMin, nKdSpZ, nRang, nRazr, nOklTrf,
                               nAvans, nProcLG, cSpAv, cDolgnost, cNrPrikaza,
                              dDtPrikaza, bPens, bSovm, bPrfs, nInv);
    cdsPVFamIO.AsString  := cFamIO;
    cdsPVLS.AsString := DmMain.GetBankiLS(nTabN, d_DtPrc, nKdBnk);
    if nKdBnk <> 0 then
      cdsPVKdBnk.AsInteger := nKdBnk;
    if nKdObj <> 0 then begin
      cdsPvKdObj.AsInteger  := nKdObj;
      cdsPvKdKatP.AsInteger := nKdKatP;
    end;
    if not bIsInSps then // запомнить и добавить в Z_Sps при сохранении
      cdsPvNotInCurSps.AsBoolean := true;
  end;
end;
{
//------------------------------------------------------------------------------
procedure TFormVedV.popCreSps_24Click(Sender: TObject);
begin
  ShowMessage('Еще не делалось. И пока не ясно, нужно ли.' +
              #13 + 'Скорее НЕТ, чем ДА .');
end;
}
//------------------------------------------------------------------------------
procedure TFormVedV.popPvFilterKssClick(Sender: TObject);
begin
  cdsPv.Filter := 'LS<='''' or LS is NULL';
  cdsPv.Filtered := true;
  LabelFilterBK.Caption := 'Фильтр: Только КАССА. Записей ' +
                                              IntToStr(cdsPv.RecordCount);
  popPvFilterKss.Checked   := true;
  popPvFilterBnk.Checked   := false;
  popPvFilterBKOff.Checked := false;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPvFilterBnkClick(Sender: TObject);
var nKdBnk : SmallInt;
begin
  if GetFilterBK(cdsFilterBK, nKdBnk) {z_VedFBK} then begin
    cdsPv.Filter := 'KdBnk=' + IntToStr(nKdBnk);
    cdsPv.Filtered := true;
    LabelFilterBK.Caption := 'Фильтр: Банк = ' + IntToStr(nKdBnk) +
                                '. Записей ' + IntToStr(cdsPv.RecordCount);
  popPvFilterKss.Checked   := false;
  popPvFilterBnk.Checked   := true;
  popPvFilterBKOff.Checked := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPvFilterBKOffClick(Sender: TObject);
begin
  cdsPv.Filtered := false;
  cdsPv.Filter := '';
  LabelFilterBK.Caption := 'Без фильтра. Записей ' +
                                              IntToStr(cdsPv.RecordCount);
  popPvFilterKss.Checked   := false;
  popPvFilterBnk.Checked   := false;
  popPvFilterBKOff.Checked := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popPvShwNUClick(Sender: TObject);
begin
  if cdsPv.Active and not cdsPvTabN.IsNull then
    ShwNu(d_DtPrc, dsrcPv);      {z_ShwNu}
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dsrcPVDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcPv.State = dsBrowse) and bIsFormShwNu then
    FormShwNu.ShowSmNaRuki;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedDetiAddClick(Sender: TObject);
begin
  CreCdsDeti(d_DtPrc);
  PageControl.ActivePage := tsVedDeti;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.CreCdsDeti(dDtPrc : TDateTime);
var cFamIO : ShortString;
begin
  with cdsDeti do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, n.* ' +
            ' from ViNuMain n Left OUTER Join z_Upi u on u.TabN = n.TabN ' +
            ' where dtProc = :dDtPrc and VidN in ("1901", "1909") ' +
            ' order by TabN, SchBU, PSch, KdSpZ');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                   FieldByName('Ima').AsString, FieldByName('Otch').AsString);
      CdsDetiAddRec(FieldByName('TabN').AsInteger,
                        FieldByName('KdObj').AsInteger,
                            FieldByName('KdKatP').AsInteger,
                                FieldByName('KdSpZ').AsInteger,
                                    FieldByName('Summa').AsFloat,
                                        cFamIO, FieldByName('VidN').AsString,
                                          FieldByName('PSch').AsString,
                                            FieldByName('SchBU').AsString);
      Next;
    end;
  end;
  LabelProcess3.Caption := 'Записей ' + IntToStr(cdsDeti.RecordCount);
  LabelSortInfo3.Caption := '';
  cdsDeti.First;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.CdsDetiAddRec(nTabN : integer;
                                  nKdObj, nKdKatP, nKdSpZ : SmallInt;
                                  nSumma : double;
                                  cFamIO, cVidN, cPSch, cSchBU : ShortString);
var cLicSch, cShBnk, cNmBnk : ShortString; nKdBnk : SmallInt;
    dDtVed, dBnkDtBeg : TDateTime;
    bSpbLS, bLsClosed : boolean;
begin
  dDtVed := qryVedBnkDtPrdF.AsDateTime;
  with cdsDeti do begin
    if not Locate('TabN', nTabN, []) then begin
      Append;
      cdsDetiTabN.AsInteger   := nTabN;
      DmMain.GetBankLS(nTabN, dDtVed,
                dBnkDtBeg, nKdBnk, cShBnk, cNmBnk, cLicSch, bSpbLS, bLsClosed);
      if not bLsClosed and (cLicSch > '') and (nKdBnk <> 0) then begin
        cdsDetiKdBnk.AsInteger := nKdBnk;
        cdsDetiLS.AsString     := cLicSch;
      end;
      cdsDetiKdObj.AsInteger  := nKdObj;
      cdsDetiKdKatP.AsInteger := nKdKatP;
      cdsDetiFamIO.AsString   := cFamIO; end
    else
      Edit;
    if cVidN = '1901' then begin
      cdsDetiSm1901.AsFloat := cdsDetiSm1901.AsFloat + nSumma;
      cdsDetiSm_1901.AsFloat := cdsDetiSm_1901.AsFloat + nSumma; end
    else if cVidN = '1909' then begin
      cdsDetiSm1909.AsFloat := cdsDetiSm1909.AsFloat + nSumma;
      cdsDetiSm_1909.AsFloat := cdsDetiSm_1909.AsFloat + nSumma;
    end;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.bBtnBack3Click(Sender: TObject);
begin
  if not bNewVedSaved then
    qryVed.Cancel;
  Caption := 'Ведомости выплат';
  PageControl.ActivePage := tsVeds;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popOtklSortObjTabNClick(Sender: TObject);
begin
  if not popOtklSortObjTabN.Checked then begin
    popOtklSortObjTabN.Checked := true;
    popOtklSortObjFio.Checked  := false;
    popOtklSortTabN.Checked    := false;
    popOtklSortFio.Checked     := false;
    popOtklSortSumma.Checked   := false;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popOtklSortObjFioClick(Sender: TObject);
begin
  if not popOtklSortObjFio.Checked then begin
    popOtklSortObjFio.Checked  := true;
    popOtklSortObjTabN.Checked := false;
    popOtklSortTabN.Checked    := false;
    popOtklSortFio.Checked     := false;
    popOtklSortSumma.Checked   := false;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popOtklSortTabNClick(Sender: TObject);
begin
  if not popOtklSortTabN.Checked then begin
    popOtklSortTabN.Checked    := true;
    popOtklSortObjTabN.Checked := false;
    popOtklSortObjFio.Checked  := false;
    popOtklSortFio.Checked     := false;
    popOtklSortSumma.Checked   := false;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popOtklSortFioClick(Sender: TObject);
begin
  if not popOtklSortFio.Checked then begin
    popOtklSortFio.Checked     := true;
    popOtklSortObjTabN.Checked := false;
    popOtklSortObjFio.Checked  := false;
    popOtklSortTabN.Checked    := false;
    popOtklSortSumma.Checked   := false;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popOtklSortSummaClick(Sender: TObject);
begin
  if not popOtklSortSumma.Checked then begin
    popOtklSortFio.Checked     := false;
    popOtklSortObjTabN.Checked := false;
    popOtklSortObjFio.Checked  := false;
    popOtklSortTabN.Checked    := false;
    popOtklSortSumma.Checked   := true;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popOtklFilterOffClick(Sender: TObject);
begin
  qryOtkl.Filtered := false;
  qryOtkl.Filter := '';
  LabelCntOtklRec.Caption := 'Записей: ' + IntToStr(qryOtkl.RecordCount);
  LabelFilterOtkl.Caption := 'Без фильтра.';
  LabelFilterOtkl.Visible := false;
  popOtklFilterKss.Checked := false;
  popOtklFilterBnk.Checked := false;
  popOtklFilterOff.Checked := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popOtklFilterBnkClick(Sender: TObject);
begin
//  qryOtkl.Filter := 'LS > '''' or LS is NULL';
  qryOtkl.Filter := 'LicSch > ''''';
  qryOtkl.Filtered := true;
  LabelCntOtklRec.Caption := 'Записей: ' + IntToStr(qryOtkl.RecordCount);
  LabelFilterOtkl.Caption := 'Фильтр: Только Банки.';
  LabelFilterOtkl.Visible := true;
  popOtklFilterKss.Checked := false;
  popOtklFilterBnk.Checked := true;
  popOtklFilterOff.Checked := false;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popOtklFilterKssClick(Sender: TObject);
begin
  qryOtkl.Filter := 'LicSch <= '''' or LicSch is NULL';
  qryOtkl.Filtered := true;
  LabelCntOtklRec.Caption := 'Записей: ' + IntToStr(qryOtkl.RecordCount);
  LabelFilterOtkl.Caption := 'Фильтр: Только КАССА.';
  LabelFilterOtkl.Visible := true;
  popOtklFilterKss.Checked := true;
  popOtklFilterBnk.Checked := false;
  popOtklFilterOff.Checked := false;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popOtklOtherClick(Sender: TObject);
var nSvTabN, nCntTts  : integer;
    nKdBnk : SmallInt; nSmm, nSmTts : double;
    bSvFiltered : boolean; cSvFilter : ShortString;
begin
  if PanelInf2.Visible then begin
    PanelInf2.Visible := false;
    Exit;
  end;
  Screen.Cursor := crSQLWait;
  with qryOtkl do begin
    bSvFiltered := Filtered;
    cSvFilter := Filter;
    nSvTabN := qryOtklTabN.AsInteger;
    Filtered := false;
    if qryOtkl.RecordCount <= 0 then begin
      Filter := cSvFilter;
      Filtered := bSvFiltered;
      Locate('TabN', nSvTabN, []);
      Screen.Cursor := crDefault;
      Exit;
    end;
  end;
  with cdsInf do begin
    if Active then Close;
    CreateDataSet;
    Open;
    DisableControls;
  end;
  with qryOtkl do begin
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('VidN').AsString = '7509' then
        nKdBnk := 0
      else
        nKdBnk := FieldByName('KdBnk').AsInteger;
      nSmm := -FieldByName('Summa').AsFloat;
      AddInfInCdsInf(nKdBnk, nSmm);
      Next;
    end;
    Filter := cSvFilter;
    Filtered := bSvFiltered;
    Locate('TabN', nSvTabN, []);
    EnableControls;
  end;
  with cdsInf do begin
    nCntTts := 0;
    nSmTts  := 0;
    First;
    while not Eof do begin
      nCntTts := nCntTts + cdsInfCnt.AsInteger;
      nSmTts  := nSmTts + cdsInfSumma.AsFloat;
      Next;
    end;
    Append;
    cdsInfKdBnk.AsInteger := 9999;
    cdsInfNmBnk.AsString := 'Всего';
    cdsInfCnt.AsInteger := nCntTts;
    cdsInfSumma.AsFloat := nSmTts;
    Post;
    First;
    EnableControls;
  end;
  Screen.Cursor := crDefault;
  PanelInf2.Top  := Round((dbgrOtkl.Height - PanelInf2.Height) / 2);
  PanelInf2.Left := dbgrOtkl.Left + Round((dbgrOtkl.Width - PanelInf2.Width) / 2);
  PanelInf2.Visible := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.AddInfInCdsInf(nKdBnk: SmallInt; nSmm: double);
var cNmBnk, cShBnk : ShortString;
begin
  with cdsInf do begin
    if not Locate('KdBnk', nKdBnk, []) then begin
      if nKdBnk = 0 then
        cShBnk := 'Касса'
      else
        cNmBnk := DmMain.KdBnk2NmBnk(nKdBnk, cShBnk);
      Append;
      cdsInfKdBnk.AsInteger := nKdBnk;
      cdsInfNmBnk.AsString := cShBnk; end
    else
      Edit;
    cdsInfCnt.AsInteger := cdsInfCnt.AsInteger + 1;
    cdsInfSumma.AsFloat := cdsInfSumma.AsFloat + nSmm;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedAddTVPClick(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedAddNVClick(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popVedBnkAddSpecClick(Sender: TObject);
var nY, nM, nD : word;  nSvNR, nBnkNrPrdF : integer; dDtVed : TDateTime;
    bSpec : boolean;
begin
  bSpec := true;
  bNewVedSaved := false;
  DecodeDate(d_DtPrc, nY, nM, nD);
  with qryVed do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('TypeVed').AsString := 'VedSpB';
    FieldByName('DtProc').AsDateTime := d_DtPrc;
    FieldByName('KdUsr').AsInteger := n_KdUsr;
    FieldByName('KdSps').AsInteger := n_KdSps;
    nBnkNrPrdF := NewBnkNrPrdF(d_DtPrc);
    FieldByName('VedDate').AsDateTime := Date;
    FieldByName('BnkNrPrdF').AsInteger := nBnkNrPrdF;
    FieldByName('BnkDtPrdF').AsDateTime := Date;
    FieldByName('BnkNmPrdF').AsString := 'Зарплата за ' +
                                      UkrMes(nM) + ' ' + IntToStr(nY) + ' р.';
    FieldByName('KssVedNr').AsInteger := nBnkNrPrdF;
    FieldByName('KssVedDt').AsDateTime := Date;
    FieldByName('KssVedNm').AsString := 'на выплату зарплаты за ' +
                                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    FieldByName('Notes').AsString := 'SpB';
    if AddEdtMegVed(dsrcVed, bSpec) {z_EVedVp} then begin
      //Post; Не делаем. Будет Postиться при сохранении cdsPsb (по sBtnSpbSaveVedClick)
      Caption := 'Формироание "специальной" ведомости выплат';
      Application.ProcessMessages;
      d_DtVed := qryVedBnkDtPrdF.AsDateTime;
      dDtVed := qryVedVedDate.AsDateTime;
      with cdsSpb do begin
        if Active then Close;
        CreateDataSet;
      end;
      PageControl.ActivePage := tsVedSpB;
      DmMain.CreOpenCdsBankiLsLU(dDtVed); // освежить DmMain.CdsBankiLsLU (Банки.ЛС)
      LabelSpbDbg.Caption := 'DtVdPV = ' + qryVedVedDate.AsString +
                          ', NrVedPV = ' + qryVedVedNr.AsString;
      LabelSpbDbg.Visible    := bFlagDbg;
      sBtnSpbInfo.Enabled    := true;
      sBtnSpbSaveVed.Enabled := false;
      bNewVedSaved := false;
      dbgrSpb.SetFocus; end
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popSpBPopup(Sender: TObject);
begin
  popSpbEdt.Enabled := cdsSpb.RecordCount > 0;
  popSpbDel.Enabled := popSpbEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popSpbAddClick(Sender: TObject);
var nSvNR : integer;
begin
  nSvNR := 0;
  with cdsSpB do begin
    if RecordCount > 0 then
      nSvNR := cdsSpbNR.AsInteger;
    Append;
    if EASpb(d_DtPrc) {z_ESpB} then
      Post
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
  sBtnSpbSaveVed.Enabled := cdsSpb.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popSpbEdtClick(Sender: TObject);
begin
  with cdsSpB do begin
    Edit;
    if EASpb(d_DtPrc) {z_ESpB} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popSpbDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                                         [mbYes, mbNo], 0) = mrYes then begin
    cdsSpb.Delete;
    sBtnSpbSaveVed.Enabled := cdsSpb.RecordCount > 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.cdsSpBNewRecord(DataSet: TDataSet);
begin
  cdsSpBDtProc.AsDateTime := d_DtPrc;
  cdsSpbNrVed.AsInteger := qryVedVedNR.AsInteger;
  cdsSpbDtVed.AsDateTime := qryVedVedDate.AsDateTime;
end;
//------------------------------------------------------------------------------
function TFormVedV.IsInUpiSps(nTabN : integer; dDtPrc : TDateTime;
                                            var cFamIO : ShortString) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.*, s.TabN as Sps_TabN from Z_Upi u Left Outer Join ' +
            ' Z_SPS s on s.DtProc = :dDtPrc and s.TabN = u.TabN ' +
            ' where u.TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    if (RecordCount > 0) then begin
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                              FieldByName('Ima').AsString,
                                    FieldByName('Otch').AsString);
      if not FieldByName('Sps_TabN').IsNull and
           (FieldByName('Sps_TabN').AsInteger = nTabN) then
        Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormVedV.IsPereInf(nTabN : integer; var nKdSps, nKdObj, nKdKatP,
                    nKdSpZ : SmallInt; var cSPZ, cPSCH : string) : boolean;
begin
  Result := false;
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from GET_PERE (:nTabN, :d_DtPrc)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
    Open;
    if RecordCount > 0 then begin
      nKdSps  := FieldByName('KdSps').AsInteger;
      nKdObj  := FieldByName('KdObj').AsInteger;
      nKdKatP := FieldByName('KdKatP').AsInteger;
      nKdSpZ  := FieldByName('KdSpZ').AsInteger;
      cSPZ    := FieldByName('SchBU').AsString;
      cPSCH   := FieldByName('PSCH').AsString;
      Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormVedV.GetMaxSm(nTabN : integer; nKdSpZ : SmallInt;
                            cPSCH : ShortString; var nMaxSm : double) : boolean;
//var nKdPSch : SmallInt; cPSCH : ShortString;
begin
  Result := false;
  // nKdPSch := DmMain.KdSbu2KdPSch(nKdSpZ);
  // Неправильно работает DmMain.KdSbu2KdPSch Разобраться !!!
  // cPSCH := DmMain.KdSbu2SchBU(nKdPSch);
  with qryMaxSm do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Round(Sum(Summa), 2) as MaxSm ' +
            ' from ViNuMain where TabN = :nTabN and DtProc = :d_DtPrc and ' +
            ' VidN < "8000"');
//            ' VidN < "8000" and PSCH = :cPSCH');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
//    ParamByName('cPSCH').AsString     := cPSCH;
    Open;
    if RecordCount > 0 then begin
      nMaxSm := FieldByName('MaxSm').AsFloat;
      Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.cdsSpBTabNValidate(Sender: TField);
var cText, cFamIO, cShBnk, cNmBnk, cLS, cRaiseMsg : ShortString;
    cSPZ, cPSCH : string;
    nTabN : integer;
    bIsInUpiSps, bSpbLS : boolean;
    dDtBegLS : TDateTime;
    nKdSps, nKdObj, nKdKatP, nKdSpZ, nKdBnk : SmallInt;
    nMaxSm : double;
begin
  if not bNeedValidate then
    Exit;
  cText := Sender.AsString;
  if cText > '' then begin
    nTabN := StrToInt(cText);
    bNeedValidate := false;
    bIsInUpiSps := IsInUpiSps(nTabN, d_DtPrc, cFamIO);
    if bIsInUpiSps then begin
      cdsSpbFamIO.AsString := cFamIO;
      if IsPereInf(nTabN, nKdSps, nKdObj, nKdKatP, nKdSpZ,
                                                      cSPZ, cPSCH) then begin
        cdsSpbKdSps.AsInteger  := nKdSps;
        cdsSpbKdObj.AsInteger  := nKdObj;
        cdsSpbKdKatP.AsInteger := nKdKatP;
        nKdSpZ := MySchBU(cPSCH, cSPZ);
        cdsSpbKdSpZ.AsInteger  := nKdSpZ;
        cdsSpbSpZ.AsString     := cSpZ;
        cdsSpbPSCH.AsString    := cPSCH;
      end;
      DmMain.GetBankSpecLS(nTabN, qryVedVedDate.AsDateTime, dDtBegLS,
                                       nKdBnk, cShBnk, cNmBnk, cLS, bSpbLS);
      if bSpbLS then begin
        cdsSpbLS.AsString := cLS;
        if nKdBnk <> 0 then begin
          cdsSpbKdBnk.AsInteger := nKdBnk;
          cdsSpbNmBnk.AsString  := cNmBnk; end
        else begin
          cdsSpbLS.AsString := '';
          cdsSpbKdBnk.AsString := '';
        end; end
      else begin
        cdsSpbLS.AsString := '';
        cdsSpbKdBnk.AsString := '';
      end;
      if GetMaxSm(nTabN, nKdSpZ, cPSCH, nMaxSm) then
        cdsSpbMaxSm.AsFloat := nMaxSm
      else
        cdsSpbMaxSm.AsString  := ''; end
    else begin
      cdsSpbFamIO.AsString  := '';
      cdsSpbKdSps.AsString  := '';
      cdsSpbKdObj.AsString  := '';
      cdsSpbKdKatP.AsString := '';
      cdsSpbKdSpZ.AsString  := '';
      cdsSpbSpZ.AsString    := '';
      cdsSpbPSCH.AsString   := '';
      cdsSpbKdBnk.AsString  := '';
      cdsSpbNmBnk.AsString  := '';
      cdsSpbLS.AsString     := '';
      cdsSpbMaxSm.AsString  := '';
      bNeedValidate         := true;
      if cFamIO = '' then
        cRaiseMsg := 'Нет в справочнике "Сотрудники" ТабН ' + cText
      else
        cRaiseMsg := 'Нет в списке текущего месяца ТабН ' + cText + ' ' + cFamIO;
      Raise Exception.Create(cRaiseMsg);
    end;
  end;
  bNeedValidate := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.cdsSpBSpZValidate(Sender: TField);
var cText : ShortString; cSpZ, cPSCH : string;
    nKdSpZ : integer;
    bHsCh : boolean;
begin
  if not bNeedValidate then
    Exit;
  bNeedValidate := false;
  cText := Sender.AsString;
  nKdSpZ := cdsSpbKdSpZ.AsInteger;
  if cText > '' then begin
    cSpZ := Trim(cText);
    if CheckSBU(nKdSpZ, cSpZ, cPSch, bHsCh) then begin
      nKdSpZ := MySchBU(cPSCH, cSPZ);
      cdsSpbKdSpZ.AsInteger  := nKdSpZ;
      cdsSpbSpZ.AsString     := cSpZ;
      cdsSpbPSCH.AsString    := cPSCH; end
    else begin
      cdsSpbKdSpZ.AsString  := '';
      cdsSpbSpZ.AsString    := '';
      cdsSpbPSCH.AsString   := '';
    end;
  end;
  bNeedValidate := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.cdsSpBKdBnkValidate(Sender: TField);
var cText, cShBnk, cNmBnk, cLS : ShortString;
    nTabN : integer;
    bSpbLS, bLsClosed : boolean;
    dDtBegLS : TDateTime;
    nKdBnk : SmallInt;
begin
  if not bNeedValidate then
    Exit;
  cText := Sender.AsString;
  nTabN := cdsSpbTabN.AsInteger;
  if cText > '' then begin
    nKdBnk := StrToInt(cText);
    DmMain.GetBankLS(nTabN, qryVedVedDate.AsDateTime, dDtBegLS,
                               nKdBnk, cShBnk, cNmBnk, cLS, bSpbLS, bLsClosed);
    if not bLsClosed then begin
      cdsSpbLS.AsString := cLS;
      cdsSpbNmBnk.AsString  := cNmBnk;
    end;
  end;
{
      cdsSpbKdBnk.AsString  := '';
      cdsSpbNmBnk.AsString  := '';
      cdsSpbLS.AsString     := '';
      cdsSpbMaxSm.AsString  := '';
      Raise Exception.Create('Нет в справочнике "Сотрудники" ТабН ' + cText);
    end;
  end;
}
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnSpbSaveVedClick(Sender: TObject);
var bIsRecToSaved : boolean; nSvNR : integer;
begin
  // Проверить, есть ли неНулевые суммы в cdsPV
  bIsRecToSaved := false;
  nSvNR := cdsSpbNR.AsInteger;
  with cdsSpb do begin
    DisableControls;
    First;
    while not Eof do begin
      if (not cdsSpbSmToVed.IsNull) and (cdsSpbSmToVed.AsFloat > 0) then begin
        bIsRecToSaved := true;
        Break;
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  if not bIsRecToSaved then begin
    ShowMessage('Не обнаружено записей для сохранения');
    Exit;
  end;
  if MessageDlg('Все "плюсовые" записи сохраняются в таблицы' + #13#10 +
                '"Отклонения" и "Начисления/Удержания". Согласны?:', mtWarning,
                                         [mbYes, mbNo], 0) <> mrYes then
    Exit;
  // Сохранить ведомость в таблицы Z_OTKL и Z_NU, повыключать
  // все sBtn'ы, кроме "Печать" и "В Банк";
  if bIsFormShwNu then
    FormShwNu.Close;
  Application.ProcessMessages;
  if bIsFormShwNu then
    FormShwNu.Close;
  Application.ProcessMessages;
  if qryVed.State = dsInsert then begin
    n_NewVedNR := DmMain.NewVedNR;
    qryVed.FieldByName('VedNR').AsInteger := n_NewVedNR;
    qryVed.Post;
  end;
  bNewVedSaved := true;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Alter TRIGGER ZOTKL_AI INACTIVE');  {After Insert}
    ExecSQL;              // Чтобы не "краснели" записи в Z_SPS
    SQL.Clear;
    SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, PDN, KdSpZ, Notes, Kto, PrR, Spec_NR, ' +
            ' DtVdPV, NrVdPV, MyNotes, PBnk, KdBnk) values ' +
            ' (:nKdSps, :dDtProc, :dZaMesGod, :nTabN, :cVidN, :nSumma, ' +
            ' :nKdObj, :nKdKatP, :nPDN, :nKdSpZ, :cNotes, :nKto, :nPrR, ' +
            ' :nSpec_NR, :dDtVdPV, :nNrVdPV, :cMyNotes, :nPBnk, :nKdBnk)');
    ParamByName('dDtProc').AsDateTime := d_DtPrc;
    ParamByName('dZaMesGod').AsDateTime := d_DtPrc;
    ParamByName('nPdn').AsInteger := 1;
    ParamByName('cNotes').AsString := '';
    ParamByName('nKto').AsInteger := n_KdUsr;
    ParamByName('nPrR').AsInteger := 0;
    ParamByName('nSpec_NR').AsInteger := 0;
    ParamByName('dDtVdPV').AsDateTime := qryVedVedDate.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVedNR.AsInteger;
    ParamByName('cMyNotes').AsString := '';
    ParamByName('nPBnk').AsInteger := 7;
    Prepare;
  end;
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_NU (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, PDN, KdSpZ, Notes, Kto, PrR, Spec_NR, ' +
            ' MyNotes, DtVdPV, NrVdPV, KdBnk) values ' +
            ' (:nKdSps, :dDtProc, ' +
            ' :dZaMesGod, :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, ' +
            ' :nPDN, :nKdSpZ, :cNotes, :nKto, :nPrR, :nSpec_NR, ' +
            ' :cMyNotes, :dDtVdPV, :nNrVdPV, :nKdBnk)');
    ParamByName('dDtProc').AsDateTime := d_DtPrc;
    ParamByName('dZaMesGod').AsDateTime := d_DtPrc;
    ParamByName('nPdn').AsInteger := 1;
    ParamByName('cNotes').AsString := '';
    ParamByName('nKto').AsInteger := n_KdUsr;
    ParamByName('nPrR').AsInteger := 0;
    ParamByName('nSpec_NR').AsInteger := 0;
    ParamByName('cMyNotes').AsString := '';
    ParamByName('dDtVdPV').AsDateTime := qryVedVedDate.AsDateTime;
    ParamByName('nNrVdPV').AsInteger  := qryVedVedNR.AsInteger;
    Prepare;
  end;
  with cdsSpb do begin
    DisableControls;
    First;
    while not Eof do begin
      if (not cdsSpbSmToVed.IsNull) and (cdsSpbSmToVed.AsFloat > 0) then begin
        // В отклонения
        qryTmp.ParamByName('nTabN').AsInteger := cdsSpbTabN.AsInteger;
        qryTmp.ParamByName('nKdObj').AsInteger := cdsSpbKdObj.AsInteger;
        qryTmp.ParamByName('nKdKatP').AsInteger := cdsSpbKdKatP.AsInteger;
        qryTmp.ParamByName('nSumma').AsFloat := -RoundTo(cdsSpbSmToVed.AsFloat,-2);
        qryTmp.ParamByName('nKdSps').AsInteger := 1;
        qryTmp.ParamByName('nKdSpZ').AsInteger := cdsSpbKdSpz.AsInteger;
        qryTmp.ParamByName('nKdBnk').AsInteger := cdsSpbKdBnk.AsInteger;
        if cdsSpbKdBnk.IsNull or (cdsSpbKdBnk.AsInteger = 0) then
          qryTmp.ParamByName('cVidN').AsString := '7509'  // вид РасхОрдер
        else
          qryTmp.ParamByName('cVidN').AsString := '7511'; // вид В Банк
        qryTmp.ParamByName('nKdBnk').AsInteger := cdsSpbKdBnk.AsInteger;
        // В Z_NU
        qryTmp2.ParamByName('nTabN').AsInteger := cdsSpbTabN.AsInteger;
        qryTmp2.ParamByName('nKdObj').AsInteger := cdsSpbKdObj.AsInteger;
        qryTmp2.ParamByName('nKdKatP').AsInteger := cdsSpbKdKatP.AsInteger;
        qryTmp2.ParamByName('nSumma').AsFloat := -RoundTo(cdsSpbSmToVed.AsFloat,-2);
        if cdsSpbKdBnk.IsNull or (cdsSpbKdBnk.AsInteger = 0) then
          qryTmp2.ParamByName('cVidN').AsString := '7509'  // вид РасхОрдер
        else
          qryTmp2.ParamByName('cVidN').AsString := '7511'; // вид В Банк
        qryTmp2.ParamByName('nKdSps').AsInteger := 1;
        qryTmp2.ParamByName('nKdSpZ').AsInteger := cdsSpbKdSpz.AsInteger;
        qryTmp2.ParamByName('nKdBnk').AsInteger := cdsSpbKdBnk.AsInteger;
        qryTmp.ExecSQL;
        qryTmp2.ExecSQL;
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  sBtnSpbSaveVed.Enabled := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if Prepared then
      UnPrepare;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Alter TRIGGER ZOTKL_AI ACTIVE');  {After Insert}
    ExecSQL;          // Пусть опять "краснеют" записи в Z_SPS
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if Prepared then
      UnPrepare;
    DataBaseName := '';
  end;
  qryVed.Next; // чтобы перечиталась ведомость
  bNewVedSaved := true;
  sBtnSumKVupl.Enabled := false;
  sBtnShwZadanie.Enabled := false;
  sBtnSaveVedCmn.Enabled := false;
  sBtnSpisok.Enabled := false;// Если не выключить все бутоны, может возникнуть
  bBtnSpbBackClick(Self);     // спокуса тут же почистить список и создать след.
end;                          //                        ведомость, а сие чревато
//------------------------------------------------------------------------------
function TFormVedV.MySchBU(cPSch: string; var cSchBU: string): SmallInt;
begin
  Result := 999;
  cSchBU := '??';
  if cPSch = '811' then begin // на какой счет будут записываться выплаты
    Result := 1331;           // 811/00 Расходы специального фонда
    cSchBU := '811/00'; end
  else if cPSch = '801' then begin
    Result := 1209;           // 801/б Расходы основн. фонда (осн.деятельность)
    cSchBU := '801/б'; end
  else if cPSch = '801/ДП' then begin
    Result := 1371;         // 801/ДП (Уточнить... 1388 это сводный
    cSchBU := '801/пд'; end //                     1371 - 801/пд    (ЧОО)
                            //                     1372 - 801/р     (рожд)
                            // проверить, какие коды получились в ОПИшной БД
  else if cPSch = '661Д' then begin
    Result := 1321;         // 661/пд (Уточнить..
    cSchBU := '661/пд'; end
  else if cPSch = '801/Рсб' then begin
    Result := 1385;         //* 801/рз Реструктуризация (уточнить в ОПИшной БД
    cSchBU := '801/рз'; end
  else if cPSch = '801/1-1' then begin
    Result := 1603;         // НИЧ Фунд. наука   '801-1035'
    cSchBU := '801-1035'; end
  else if cPSch = '801/1-2' then begin
    Result := 1600;         // НИЧ прикл. наука   '801-2007'
    cSchBU := '801-2007'; end
  else if cPSch = '812' then begin
    Result := 1838;         // Расходы по зарубежному гранту  '812/зг'
    cSchBU := '812/зг'; end
  else if cPSch = '823/1' then begin
    Result := 1610;         // НИЧ ХозДоговоры      '823/1-1009'
    cSchBU := '823/1-1009';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnSpbInfoClick(Sender: TObject);
var nSvTabN, nCntTts  : integer;
    nKdBnk : SmallInt; nSmm, nSmTts : double;
    bSvFiltered : boolean; cSvFilter : ShortString;
begin
  if PanelInf2.Visible then begin
    PanelInf2.Visible := false;
    Exit;
  end;
  Screen.Cursor := crSQLWait;
  with cdsSpb do begin
    bSvFiltered := Filtered;
    cSvFilter := Filter;
    nSvTabN := cdsSpbTabN.AsInteger;
    Filtered := false;
    if RecordCount <= 0 then begin
      Filter := cSvFilter;
      Filtered := bSvFiltered;
      Locate('TabN', nSvTabN, []);
      Screen.Cursor := crDefault;
      Exit;
    end;
  end;
  with cdsInf do begin
    if Active then Close;
    CreateDataSet;
    Open;
    DisableControls;
  end;
  with cdsSpb do begin
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('KdBnk').IsNull or
                               (FieldByName('KdBnk').AsInteger = 0) then
        nKdBnk := 0
      else
        nKdBnk := FieldByName('KdBnk').AsInteger;
      nSmm := FieldByName('SmToVed').AsFloat;
      if nSmm <> 0 then
        AddInfInCdsInf(nKdBnk, nSmm);
      Next;
    end;
    Filter := cSvFilter;
    Filtered := bSvFiltered;
    Locate('TabN', nSvTabN, []);
    EnableControls;
  end;
  with cdsInf do begin
    nCntTts := 0;
    nSmTts  := 0;
    First;
    while not Eof do begin
      nCntTts := nCntTts + cdsInfCnt.AsInteger;
      nSmTts  := nSmTts + cdsInfSumma.AsFloat;
      Next;
    end;
    Append;
    cdsInfKdBnk.AsInteger := 9999;
    cdsInfNmBnk.AsString := 'Всего';
    cdsInfCnt.AsInteger := nCntTts;
    cdsInfSumma.AsFloat := nSmTts;
    Post;
    First;
    EnableControls;
  end;
  Screen.Cursor := crDefault;
  PanelInf2.Top  := Round((dbgrSpb.Height - PanelInf2.Height) / 2);
  PanelInf2.Left := dbgrSpb.Left + Round((dbgrOtkl.Width - PanelInf2.Width) / 2);
  PanelInf2.Visible := true;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.bBtnSpbBackClick(Sender: TObject);
begin
  if not bNewVedSaved then
    qryVed.Cancel;
  if PanelInf2.Visible then
    PanelInf2.Visible := false;
  Caption := 'Ведомости выплат';
  PageControl.ActivePage := tsVeds;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbgrSpBDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrSpb.Canvas do begin
    if not (gdFocused in State) then begin
      if (cFldNm = 'MAXSM') and (Column.Field.Value <= 0) then
        Font.Color := clRed
    end;
  end;
  dbgrSpb.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.popSpbCopySpsClick(Sender: TObject);
begin     // Ну её в баню (эту хохму) !!! Пункт меню сделал not Visible.
  if CopyPredSpb(d_DtPrc) {z_CopSpb} then begin
    sBtnSpbSaveVed.Enabled := cdsSpB.RecordCount > 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbgrSpBDblClick(Sender: TObject);
begin
  if cdsSpb.RecordCount > 0 then
    popSpbEdtClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVedV.sBtnCloseInf2Click(Sender: TObject);
begin
  PanelInf2.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormVedV.dbgrInfDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrInf.Canvas do begin
    if not (gdFocused in State) then begin
      if cdsInfKdBnk.AsInteger = 9999 then
        Brush.Color := clWindow;
    end;
  end;
  dbgrInf.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
