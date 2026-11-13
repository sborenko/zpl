unit z_ShNadb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBTables, Buttons, Grids, DBGrids, ExtCtrls,
 Math,  StdCtrls, Mask, DBCtrls, DBClient, Menus, ComCtrls;

type
  String1 = string[1];
  TFormShwNadb = class(TForm)
    qryNdb: TQuery;
    dsrcNdb: TDataSource;
    updNdb: TUpdateSQL;
    qryNdbNR: TIntegerField;
    qryNdbKDSPS: TSmallintField;
    qryNdbSPSRSCH: TSmallintField;
    qryNdbTABN: TIntegerField;
    qryNdbVIDN: TStringField;
    qryNdbOLDKDVIDN: TSmallintField;
    qryNdbSUMPROC: TFloatField;
    qryNdbSP: TStringField;
    qryNdbPRCSOVM: TFloatField;
    qryNdbDT_BEG: TDateTimeField;
    qryNdbDT_END: TDateTimeField;
    qryNdbOLDKDOBJ: TSmallintField;
    qryNdbKDOBJ: TSmallintField;
    qryNdbKDKATP: TSmallintField;
    qryNdbPRCHS: TStringField;
    qryNdbPRSMM: TStringField;
    qryNdbKDSPZ: TSmallintField;
    qryNdbSPEC_NR: TIntegerField;
    qryNdbNOTES: TStringField;
    qryNdbNRPRBEG: TStringField;
    qryNdbDTPRBEG: TDateTimeField;
    qryNdbNRPREND: TStringField;
    qryNdbDTPREND: TDateTimeField;
    popNdb: TPopupMenu;
    popNdbHead: TMenuItem;
    cdsTabs: TClientDataSet;
    cdsTabsTabN: TIntegerField;
    cdsTabsFam: TStringField;
    cdsTabsIma: TStringField;
    cdsTabsOtch: TStringField;
    cdsTabsFamIO: TStringField;
    qryNdbShVidN: TStringField;
    dsrcTabs: TDataSource;
    cdsTabsNR: TAutoIncField;
    popTabs: TPopupMenu;
    popTabsSort: TMenuItem;
    cdsTabsKdObj: TSmallintField;
    qryNdbFamIO: TStringField;
    qryNdbShObj: TStringField;
    qryNdbNmKatP: TStringField;
    qryNdbSpZ: TStringField;
    popNdbCloseAndNew: TMenuItem;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Panel1: TPanel;
    sBtnAllNdb: TSpeedButton;
    sBtnActNdb: TSpeedButton;
    dbgrTabs: TDBGrid;
    Splitter1: TSplitter;
    dbgrPktNdb: TDBGrid;
    Panel2: TPanel;
    qryPktNdb: TQuery;
    qryPktNdbNR: TIntegerField;
    qryPktNdbNRPKT: TIntegerField;
    qryPktNdbDTVPKT: TDateTimeField;
    qryPktNdbKDUSR: TSmallintField;
    qryPktNdbMYNOTES: TStringField;
    qryPktNdbNmUsr: TStringField;
    dsrcPktNdb: TDataSource;
    updPktNdb: TUpdateSQL;
    Splitter2: TSplitter;
    PanelTs1Right: TPanel;
    dbgrShwNdb: TDBGrid;
    bBtnClose: TBitBtn;
    sBtnGoBack: TSpeedButton;
    sBtnAddPkt: TSpeedButton;
    sBtnCreSps: TSpeedButton;
    cdsTabsKdKatP: TSmallintField;
    LabelTabsCntRec: TLabel;
    LbxObj: TListBox;
    LbxKatP: TListBox;
    qryTmp: TQuery;
    DBText1: TDBText;
    popTabsSortTabN: TMenuItem;
    popTabsSortFIO: TMenuItem;
    popTabsSortObjTabN: TMenuItem;
    popTabsSortObjFIO: TMenuItem;
    LabelTabsSort: TLabel;
    Panel3: TPanel;
    dbgrNdb: TDBGrid;
    cdsTmp: TClientDataSet;
    cdsTmpDtEndOld: TDateField;
    cdsTmpDtBegNew: TDateField;
    cdsTmpDtEndNew: TDateField;
    cdsTmpNrPrikaza: TStringField;
    cdsTmpDtPrikaza: TDateField;
    cdsTmpNotes: TStringField;
    dsrcTmp: TDataSource;
    Panel4: TPanel;
    Label1: TLabel;
    dbeDtEndOld: TDBEdit;
    Label2: TLabel;
    dbeDtBegNew: TDBEdit;
    Label3: TLabel;
    dbeDtEndNew: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbeNrPrikaza: TDBEdit;
    Label6: TLabel;
    dbeDtPrikaza: TDBEdit;
    cdsTmpSpNew: TStringField;
    cdsTmpSmPrcNew: TFloatField;
    Label7: TLabel;
    dbeSpNew: TDBEdit;
    Label8: TLabel;
    dbeSmPrcNew: TDBEdit;
    qryNdbNRPKT: TIntegerField;
    qryNdbDTVPKT: TDateTimeField;
    qryShwNdb: TQuery;
    dsrcShwNdb: TDataSource;
    qryShwNdbFAM: TStringField;
    qryShwNdbIMA: TStringField;
    qryShwNdbOTCH: TStringField;
    qryShwNdbNR: TIntegerField;
    qryShwNdbKDSPS: TSmallintField;
    qryShwNdbSPSRSCH: TSmallintField;
    qryShwNdbTABN: TIntegerField;
    qryShwNdbVIDN: TStringField;
    qryShwNdbOLDKDVIDN: TSmallintField;
    qryShwNdbSUMPROC: TFloatField;
    qryShwNdbSP: TStringField;
    qryShwNdbPRCSOVM: TFloatField;
    qryShwNdbDT_BEG: TDateTimeField;
    qryShwNdbDT_END: TDateTimeField;
    qryShwNdbOLDKDOBJ: TSmallintField;
    qryShwNdbKDOBJ: TSmallintField;
    qryShwNdbKDKATP: TSmallintField;
    qryShwNdbPRCHS: TStringField;
    qryShwNdbPRSMM: TStringField;
    qryShwNdbKDSPZ: TSmallintField;
    qryShwNdbSPEC_NR: TIntegerField;
    qryShwNdbNOTES: TStringField;
    qryShwNdbNRPRBEG: TStringField;
    qryShwNdbDTPRBEG: TDateTimeField;
    qryShwNdbNRPREND: TStringField;
    qryShwNdbDTPREND: TDateTimeField;
    qryShwNdbNRPKT: TIntegerField;
    qryShwNdbDTVPKT: TDateTimeField;
    qryShwNdbFamIO: TStringField;
    Label9: TLabel;
    popNewPkt: TPopupMenu;
    popNewPkt01: TMenuItem;
    popNewPkt02: TMenuItem;
    popNewPkt03: TMenuItem;
    dbNavShwNdb: TDBNavigator;
    sBtnDelPkt: TSpeedButton;
    popShwNdb: TPopupMenu;
    popShwNdbSort: TMenuItem;
    popShwNdbSortObjFIO: TMenuItem;
    popShwNdbSortFIO: TMenuItem;
    popShwNdbSortTabN: TMenuItem;
    LabelSortShwNdb: TLabel;
    qryNdbPRC_WT: TFloatField;
    ts1601: TTabSheet;
    popNewPkt1601: TMenuItem;
    Panel5: TPanel;
    sBtnCreSps1601: TSpeedButton;
    sBtnZadanie1601: TSpeedButton;
    sBtnSaveNdb1601: TSpeedButton;
    LabelCntRec: TLabel;
    LabelSort: TLabel;
    SpeedButton2: TSpeedButton;
    dbNav1601: TDBNavigator;
    dbgr1601: TDBGrid;
    cds1601: TClientDataSet;
    dsrc1601: TDataSource;
    cds1601NR: TAutoIncField;
    cds1601TabN: TIntegerField;
    cds1601FamIO: TStringField;
    cds1601KdObj: TSmallintField;
    cds1601KdKatP: TSmallintField;
    cds1601KdSpZ: TSmallintField;
    cds1601DtBeg: TDateField;
    cds1601DtEnd: TDateField;
    cds1601spsbRasch: TSmallintField;
    cds1601SP: TStringField;
    cds1601SumProc: TFloatField;
    cds1601Notes: TStringField;
    cds1601VidN: TStringField;
    cds1601OklTrf: TFloatField;
    qryIns1601: TQuery;
    updIns1601: TUpdateSQL;
    qryIns1601NR: TIntegerField;
    qryIns1601KDSPS: TSmallintField;
    qryIns1601SPSRSCH: TSmallintField;
    qryIns1601TABN: TIntegerField;
    qryIns1601VIDN: TStringField;
    qryIns1601OLDKDVIDN: TSmallintField;
    qryIns1601SUMPROC: TFloatField;
    qryIns1601SP: TStringField;
    qryIns1601PRCSOVM: TFloatField;
    qryIns1601DT_BEG: TDateTimeField;
    qryIns1601DT_END: TDateTimeField;
    qryIns1601OLDKDOBJ: TSmallintField;
    qryIns1601KDOBJ: TSmallintField;
    qryIns1601KDKATP: TSmallintField;
    qryIns1601PRCHS: TStringField;
    qryIns1601PRSMM: TStringField;
    qryIns1601KDSPZ: TSmallintField;
    qryIns1601SPEC_NR: TIntegerField;
    qryIns1601NOTES: TStringField;
    qryIns1601NRPRBEG: TStringField;
    qryIns1601DTPRBEG: TDateTimeField;
    qryIns1601NRPREND: TStringField;
    qryIns1601DTPREND: TDateTimeField;
    qryIns1601NRPKT: TIntegerField;
    qryIns1601DTVPKT: TDateTimeField;
    qryIns1601PRC_WT: TFloatField;
    LabelSmMinZp: TLabel;
    qryNdbSPOV_MERGE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbeTabNEnter(Sender: TObject);
    procedure dbeTabNExit(Sender: TObject);
    procedure cdsTabsCalcFields(DataSet: TDataSet);
    procedure cdsTabsTabNValidate(Sender: TField);
    procedure sBtnWzrdClick(Sender: TObject);
    procedure cdsTabsAfterPost(DataSet: TDataSet);
    procedure popTabsDelClick(Sender: TObject);
    procedure cdsTabsAfterDelete(DataSet: TDataSet);
    procedure popTabsPopup(Sender: TObject);
    procedure sBtnAllNdbClick(Sender: TObject);
    procedure sBtnActNdbClick(Sender: TObject);
    procedure dbgrNdbDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryNdbCalcFields(DataSet: TDataSet);
    procedure dbgrNdbDblClick(Sender: TObject);
    procedure popNdbCloseAndNewClick(Sender: TObject);
    procedure sBtnGoBackClick(Sender: TObject);
    procedure sBtnAddPktClick(Sender: TObject);
    procedure qryPktNdbCalcFields(DataSet: TDataSet);
    procedure popTabsSortTabNClick(Sender: TObject);
    procedure popTabsSortFIOClick(Sender: TObject);
    procedure popTabsSortObjTabNClick(Sender: TObject);
    procedure popTabsSortObjFIOClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure qryShwNdbCalcFields(DataSet: TDataSet);
    procedure popNewPkt01Click(Sender: TObject);
    procedure Splitter2Moved(Sender: TObject);
    procedure popNewPkt03Click(Sender: TObject);
    procedure sBtnDelPktClick(Sender: TObject);
    procedure popNewPkt02Click(Sender: TObject);
    procedure popShwNdbSortObjFIOClick(Sender: TObject);
    procedure popShwNdbSortFIOClick(Sender: TObject);
    procedure popShwNdbSortTabNClick(Sender: TObject);
    procedure sBtnCreNewPkt1601Click(Sender: TObject);
    procedure sBtnCreSpsClick(Sender: TObject);
    procedure sBtnCreSps1601Click(Sender: TObject);
    procedure popNewPkt1601Click(Sender: TObject);
    procedure sBtnZadanie1601Click(Sender: TObject);
    procedure dbgr1601Enter(Sender: TObject);
    procedure dbgr1601Exit(Sender: TObject);
    procedure sBtnSaveNdb1601Click(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc, dLastDOM : TDateTime;
    cSvDtEndOld, cSvDtBegNew, cSvDtEndNew,
       cSvNrPrikaza, cSvDtPrikaza,
          cSvSpNew, cSvSmPrcNew, cSvNotes : ShortString;
    nNdbActMode : word;
    nNewNdbNrPkt : integer;
    dNewNdbDtVPkt : TDateTime;
    nSortShwNdb : SmallInt;
    procedure OpenQryNdbPkt;
    procedure OpenQryShwNdb;
    procedure SetTabsSortMode;
    procedure SetNdbActMode;
    function MyGetNR : integer;
    procedure AddRec1601InNdb(nNewNrPkt : integer);
  public
    { Public declarations }
  end;

procedure ShwNadb(dDtProc : TDateTime; nKdSps : SmallInt);

const SECTION = 'z_ShNadb';

var
  FormShwNadb: TFormShwNadb;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main, z_TUpi, z_GtQUpi, Z_ENadb,
     z_GtDats, z_VbObKt, z_AddTSN, Z_ENdbMs;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwNadb(dDtProc : TDateTime; nKdSps : SmallInt);
begin
  FormShwNadb := TFormShwNadb.Create(Application);
  with FormShwNadb do begin
    d_DtPrc := dDtProc;
    dLastDOM := MyLastDOM(d_DtPrc);
    Caption := 'Пакеты изменений в надбавках';
    nNewNdbNrPkt := -1;
    dNewNdbDtVPkt := -1;
    OpenQryNdbPkt;
    OpenQryShwNdb;
    sBtnDelPkt.Enabled := qryPktNdb.RecordCount > 0;
    ActiveControl := dbgrPktNdb;
    PageControl1.ActivePage := ts1;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.OpenQryNdbPkt;
begin
  with qryPktNdb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ZZ_NdbPkt order by DtVPkt, NrPkt');
    // позже, когда наберется побольше записей, подумать об условии выборки
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.OpenQryShwNdb;
var nSvNR : integer;
begin
  with qryShwNdb do begin
    nSvNR := 0;
    if Active then begin
      nSvNR := FieldByName('NR').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPktNdb;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, n.* ' +
            ' from z_Nadb n Left outer join z_upi u on u.TabN = n.TabN ' +
            ' where n.nrPkt = :NrPkt');
    if nSortShwNdb = 1 then begin
      LabelSortShwNdb.Caption := 'Сортировка: Подразд., Фамилия И.О.';
      SQL.Add('order by n.KdObj, u.Fam, u.Ima, u.Otch, n.TabN'); end
    else if nSortShwNdb = 2 then begin
      LabelSortShwNdb.Caption := 'Сортировка по Фамилии И.О.';
      SQL.Add('order by u.Fam, u.Ima, u.Otch, n.TabN'); end
    else begin
      LabelSortShwNdb.Caption := 'Сортировка по Таб. н-ру';
      SQL.Add('order by n.TabN');
    end;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, [])
    else
      Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.FormCreate(Sender: TObject);
var nTabsSortMode : SmallInt;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 400);
    nSortShwNdb := ReadInteger(SECTION, 'nSortShwNdb', 1);
    nNdbActMode := ReadInteger(SECTION, 'nActMode', 0);
    nTabsSortMode := ReadInteger(SECTION, 'nTabsSort', 3);
    cSvDtEndOld  := ReadString(SECTION, 'cSvDtEO', '');
    cSvDtBegNew  := ReadString(SECTION, 'cSvDtBN', '');
    cSvDtEndNew  := ReadString(SECTION, 'cSvDtEN', '');
    cSvNrPrikaza := ReadString(SECTION, 'cSvNrPr', '');
    cSvDtPrikaza := ReadString(SECTION, 'cSvDtPr', '');
    cSvSpNew     := ReadString(SECTION, 'cSvSpNw', '');
    cSvSmPrcNew  := ReadString(SECTION, 'cSvSmPr', '');
    cSvNotes     := ReadString(SECTION, 'cSvNts', '');
    Free;
  end;
  LabelSmMinZp.Caption := '';
  ts1.TabVisible := bFlagDbg; // false;
  ts2.TabVisible := bFlagDbg; // false;
  ts1601.TabVisible :=  bFlagDbg; // false;
  PageControl1.ActivePage := ts1;
  popShwNdbSortObjFIO.Checked := nSortShwNdb = 1;
  popShwNdbSortFIO.Checked := nSortShwNdb = 2;
  popShwNdbSortTabN.Checked := nSortShwNdb = 3;
  with cdsTabs do begin
    if Active then Close;
    CreateDataSet;
  end;
  if nNdbActMode = 1 then begin
    sBtnActNdb.Down := true;
    sBtnAllNdb.Down := false; end
  else begin
    sBtnAllNdb.Down := true;
    sBtnActNdb.Down := false;
  end;
  SetNdbActMode;
  if nTabsSortMode = 1 then begin
    popTabsSortTabN.Checked := true;
    popTabsSortFIO.Checked := false;
    popTabsSortObjTabN.Checked := false;
    popTabsSortObjFIO.Checked := false; end
  else if nTabsSortMode = 2 then begin
    popTabsSortTabN.Checked := false;
    popTabsSortFIO.Checked := true;
    popTabsSortObjTabN.Checked := false;
    popTabsSortObjFIO.Checked := false; end
  else if nTabsSortMode = 3 then begin
    popTabsSortTabN.Checked := false;
    popTabsSortFIO.Checked := false;
    popTabsSortObjTabN.Checked := true;
    popTabsSortObjFIO.Checked := false; end
  else begin
    popTabsSortTabN.Checked := false;
    popTabsSortFIO.Checked := false;
    popTabsSortObjTabN.Checked := false;
    popTabsSortObjFIO.Checked := true;
  end;
  if FileExists(cDirVids + 'PkNdb01.vid') then
    dbgrPktNdb.Columns.LoadFromFile(cDirVids + 'PkNdb01.vid');
  if FileExists(cDirVids + 'PkNdSh1.vid') then
    dbgrShwNdb.Columns.LoadFromFile(cDirVids + 'PkNdSh1.vid');
  if FileExists(cDirVids + 'NdbShw01.vid') then
    dbgrNdb.Columns.LoadFromFile(cDirVids + 'NdbShw01.vid');
  if FileExists(cDirVids + 'gr1601.vid') then
  dbgr1601.Columns.SaveToFile(cDirVids + 'gr1601.vid');
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.SetNdbActMode;
var bSvActive : boolean;
begin
  with qryNdb do begin
    bSvActive := Active;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Nadb where (TabN = :TabN) ');
    if sBtnActNdb.Down then
      SQL.Add('and (Dt_End is null or Dt_End >= :dDtPrc) ');
    SQL.Add(' order by Dt_Beg, NR');
    if sBtnActNdb.Down then
      ParamByName('dDtPrc').AsDateTime := d_DtPrc - 30;
    if bSvActive then
      Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPktNdb.Columns.SaveToFile(cDirVids + 'PkNdb01.vid');
  dbgrShwNdb.Columns.SaveToFile(cDirVids + 'PkNdSh1.vid');
  dbgrNdb.Columns.SaveToFile(cDirVids + 'NdbShw01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSortShwNdb', nSortShwNdb);
    if sBtnActNdb.Down then
      WriteInteger(SECTION, 'nActMode', 1)
    else
      WriteInteger(SECTION, 'nActMode', 0);
    if cdsTmp.Active then begin
      WriteString(SECTION, 'cSvDtEO', cdsTmpDtEndOld.AsString);
      WriteString(SECTION, 'cSvDtBN', cdsTmpDtBegNew.AsString);
      WriteString(SECTION, 'cSvDtEN', cdsTmpDtEndNew.AsString);
      WriteString(SECTION, 'cSvNrPr', cdsTmpNrPrikaza.AsString);
      WriteString(SECTION, 'cSvDtPr', cdsTmpDtPrikaza.AsString);
      WriteString(SECTION, 'cSvSpNw', cdsTmpSpNew.AsString);
      WriteString(SECTION, 'cSvSmPr', cdsTmpSmPrcNew.AsString);
      WriteString(SECTION, 'cSvNts', cdsTmpNotes.AsString);
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.dbeTabNEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.dbeTabNExit(Sender: TObject);
//var nTabN : integer;
begin
(*
  if dbeFamIO.Text <> '?????????' then begin
    nTabN := cdsTabsTabN.AsInteger;
    GetNadb(nTabN);
    dbgrNdb.SetFocus;
    (Sender as TDBEdit).Color := clWindow; end
  else
    dbeTabN.SetFocus;
*)
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.cdsTabsCalcFields(DataSet: TDataSet);
var nTabN : integer; cFamIO : ShortString;
begin
  nTabN := cdsTabsTabN.AsInteger;
  cFamIO := DmMain.TabN2FamIO(nTabN);    {z_Dm}
  if cFamIO = '' then
    cFamIO := '?????????';
  cdsTabsFamIO.AsString := cFamIO;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.cdsTabsTabNValidate(Sender: TField);
var nTabN, nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double;
    cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs : boolean; nInv : SmallInt;
begin
  nTabN := cdsTabsTabN.AsInteger;
  DmMain.GetPereInf(nTabN, dDtProc, nKdObj, nKdKatP, nSO, nPdNlg,
                     nKolMin, nKdSpz, nRang, nRazr, nOklTrf, nAvans, nProcLG,
                     cSpAv, cDolgnost, cNrPrikaza, dDtPrikaza,
                     bPens, bSovm, bPrfs, nInv);
  if nKdObj <> 0 then
    cdsTabsKdObj.AsInteger := nKdObj;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnWzrdClick(Sender: TObject);
begin
  ;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.cdsTabsAfterPost(DataSet: TDataSet);
begin
//  sBtnNdb.Enabled := cdsTabs.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popTabsDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                        mtWarning, [mbNo, mbYes], 0) = mrYes then
                                                          with cdsTabs do begin
    Delete;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.cdsTabsAfterDelete(DataSet: TDataSet);
begin
//  sBtnNdb.Enabled := cdsTabs.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popTabsPopup(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnAllNdbClick(Sender: TObject);
begin
  SetNdbActMode;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnActNdbClick(Sender: TObject);
begin
  SetNdbActMode;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.dbgrNdbDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var bBoevaja : boolean;
begin
  bBoevaja := false;
  with qryNdb do begin
    if (FieldByName('Dt_Beg').AsDateTime < dLastDOM) then begin
      if FieldByName('Dt_End').IsNull or
            (FieldByName('Dt_End').AsDateTime >= d_DtPrc) then
        bBoevaja := true;
    end;
  end;
  with dbgrNdb.Canvas do begin
    if not (gdFocused in State) then begin
      if bBoevaja then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
      if (qryNdbNrPkt.AsInteger <> nNewNdbNrPkt) then
        Font.Style := []
      else
        Font.Style := [fsBold];
    end;
  end;
  dbgrNdb.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.qryNdbCalcFields(DataSet: TDataSet);
var cDummy, cShKatP : string;
begin
  qryNdbShVidN.AsString := DmMain.VidN2ShVidN(qryNdbVidN.AsString, cDummy);
  qryNdbShObj.AsString := DmMain.KdObj2ShObj(qryNdbKdObj.AsInteger, cDummy);
  cDummy := DmMain.KdKatP2NmKatP(qryNdbKdKatP.AsInteger, cShKatP);
  qryNdbNmKatP.AsString := cShKatP;
  qryNdbSpZ.AsString := DmMain.KdSbu2SchBU(qryNdbKdSpZ.AsInteger);
end;
//--------------------- Процедура не используется ------------------------------
procedure TFormShwNadb.dbgrNdbDblClick(Sender: TObject);
var nTabN : integer;
    cVidN : ShortString;
    nSumProc, nPrcSovm : double;
    cSp : string1;
    {dDtBeg,} dDtEnd : TDateTime;
    nKdSps, nSpsRsch, nKdObj, nKdKatP, nKdSpZ : SmallInt;
    cNrPrBeg, cNrPrEnd : ShortString;
    cDtPrBeg, cDtPrEnd : ShortString;
    bUpdated : boolean;
begin
  if cdsTmpDtEndOld.IsNull then begin
    ShowMessage('Обязательно должна быть дата закрытия старой надбавки');
    Exit; end
  else if (cdsTmpDtEndOld.AsDateTime <= qryNdbDT_BEG.AsDateTime) then begin
    ShowMessage('Дата окончания должна быть больше даты начала');
    Exit;
  end;
  with qryNdb do begin
    nTabN    := qryNdbTabN.AsInteger;
    nKdSps   := qryNdbKdSps.AsInteger;
    cVidN    := qryNdbVidN.AsString;
    nSumProc := qryNdbSumProc.AsFloat;
    nPrcSovm := qryNdbPrcSovm.AsFloat;
    cSp      := qryNdbSP.AsString;
    //dDtBeg := qryNdbDt_Beg.AsDateTime;
    dDtEnd   := qryNdbDt_End.AsDateTime;
    nSpsRsch := qryNdbSpsRsch.AsInteger;
    nKdObj   := qryNdbKdObj.AsInteger;
    nKdKatP  := qryNdbKdKatP.AsInteger;
    nKdSpZ   := qryNdbKdSpZ.AsInteger;
    cNrPrBeg := qryNdbNrPrBeg.AsString;
    cNrPrEnd := qryNdbNrPrEnd.AsString;
    cDtPrBeg := qryNdbDtPrBeg.AsString;
    cDtPrEnd := qryNdbDtPrEnd.AsString;
    Edit;
    qryNdbDt_End.AsString   := cdsTmpDtEndOld.AsString;
    qryNdbNrPkt.AsInteger   := qryPktNdbNrPkt.AsInteger;
    qryNdbDtVPkt.AsDateTime := qryPktNdbDtVPkt.AsDateTime;
    qryNdbNrPrEnd.AsString  := cdsTmpNrPrikaza.AsString;
    qryNdbDtPrEnd.AsString  := cdsTmpDtPrikaza.AsString;
    Post;
    Append;
    qryNdbTabN.AsInteger  := nTabN;
    qryNdbKdSps.AsInteger := nKdSps;
    qryNdbVidN.AsString   := cVidN;
    qryNdbSumProc.AsFloat := nSumProc;
    if nPrcSovm <> 0 then
      qryNdbPrcSovm.AsFloat := nPrcSovm;
    qryNdbSP.AsString := cSP;
    if not cdsTmpDtBegNew.IsNull then
      qryNdbDt_Beg.AsString := cdsTmpDtBegNew.AsString
    else
      qryNdbDt_Beg.AsDateTime := cdsTmpDtEndOld.AsDateTime + 1;
    if not cdsTmpDtEndNew.IsNull and
           (cdsTmpDtEndNew.AsDateTime > qryNdbDt_Beg.AsDateTime) then
      qryNdbDt_End.AsString := cdsTmpDtEndNew.AsString
    else if (dDtEnd <> 0) and (dDtEnd > qryNdbDt_Beg.AsDateTime) then
      qryNdbDt_End.AsDateTime := dDtEnd;  // иначе остается пустой
    qryNdbSpsRsch.AsInteger := nSpsRsch;
    qryNdbKdObj.AsInteger   := nKdObj;
    qryNdbKdKatP.AsInteger  := nKdKatP;
    qryNdbKdSpZ.AsInteger   := nKdSpZ;
    qryNdbNrPrBeg.AsString  := cdsTmpNrPrikaza.AsString;
    qryNdbNrPrEnd.AsString  := '';
    qryNdbDtPrBeg.AsString  := cdsTmpDtPrikaza.AsString;
    qryNdbDtPrEnd.AsString  := '';
    qryNdbNrPkt.AsInteger   := qryPktNdbNrPkt.AsInteger;
    qryNdbDtVPkt.AsDateTime := qryPktNdbDtVPkt.AsDateTime;
    if TFormENadb.Run(nTabN, 1, cdsTabs.FieldByName('FamIO').AsString,
                                        dsrcNdb, bUpdated) {Z_ENadb} then begin
      Post;
      Form_Dm.DbMain.ApplyUpdates([qryNdb]);
      if qryPktNdb.UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryPktNdb]); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popNdbCloseAndNewClick(Sender: TObject);
begin
  if MessageDlg('Закрыть и добавить?:', mtConfirmation,
                                 [mbYes, mbNo], 0) = mrYes then
    ShowMessage('Ну ладно, добавим');
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnGoBackClick(Sender: TObject);
begin
  dbgr1601.Columns.SaveToFile(cDirVids + 'gr1601.vid');
  cds1601.Close;
  sBtnCreSps1601.Enabled := true;
  sBtnSaveNdb1601.Enabled := false;
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
function TFormShwNadb.MyGetNR : integer;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_Id(Z_NRZZ_NdbPkt, 0) NewNr from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNr').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnAddPktClick(Sender: TObject);
var X, Y : integer;
begin
  X := Left + sBtnAddPkt.Left + 7;
  Y := Top  + sBtnAddPkt.Top + 54;
  popNewPkt.Popup(X, Y);
end;
(*
var nSvWidth : integer;
begin
  with qryPktNdb do begin
    Append;
    nNewNdbNrPkt := Form_Dm.GetNewNdbNrPkt;    // MyNewNdbNrPkt;
    dNewNdbDtVPkt := Now;
    FieldByName('NrPkt').AsInteger   := nNewNdbNrPkt;  // -1 тут не проходит,
    FieldByName('DtVPkt').AsDateTime := dNewNdbDtVPkt; // т.к. новые надбавки
    FieldByName('KdUsr').AsInteger   := nAppKdUsr;     // должны будут сразу
    FieldByName('MyNotes').AsString  := gc_AppNmUsr;     // записываться в БД
    Post;   // Apply произойдет в случае сохранения пакета
  end;
  LabelTabsCntRec.Caption := '';
  LabelTabsSort.Caption := '';
  Caption := 'Работа с пакетом изменений в надбавках';
  Panel4.Left := Round((Panel3.Width - Panel4.Width) / 2);
  PageControl1.ActivePage := ts2;
  nSvWidth := Width;
  Width := nSvWidth + 1;
  Width := nSvWidth;
end;
*)
//------------------------------------------------------------------------------
procedure TFormShwNadb.qryPktNdbCalcFields(DataSet: TDataSet);
var nKdKatUsr : integer; cNmUsr, cPswUsr, cVkl : string;
begin
  if Form_Dm.GetUsrInfo(qryPktNdbKdUsr.AsInteger, nKdKatUsr, cNmUsr,
                                                    cPswUsr, cVkl) then
    qryPktNdbNmUsr.AsString := cNmUsr;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popNewPkt1601Click(Sender: TObject);
begin      // Перейти еа тс1601 и оттуда "командовать" кноками
  PageControl1.ActivePage := ts1601;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnCreNewPkt1601Click(Sender: TObject);
var mLstObj, mLstKatP : TStrings;
    cSQL, cDopSQL : string; i{, nAddCnt} : integer;
    dDtPrm, dDtUvln, dStartDtPere, dDtBegNdb : TDateTime;
    nSmMinZp, nSmNdb : double;
    nY, nM, nD : word;
begin
  if not Get_Dates(dDtPrm, dDtUvln, dStartDtPere) {z_GtDats} then
    Exit;
  LabelSmMinZp.Caption := '';
  mLstObj := LbxObj.Items;
  mLstKatP := LbxKatP.Items;
  DecodeDate(dDtProc, nY, nM, nD);
  dDtBegNdb := EncodeDate(nY, 1, 1);
  mLstObj.Clear;
  mLstKatP.Clear;
  if VbObjKat('Выбор подразделений и персонала для пакета',
                     1, mLstObj, mLstKatP) {z_VbObKt} then begin
    with cds1601 do begin
      if Active then Close;
      IndexDefs.Clear;
      IndexName := '';
      CreateDataSet;
      Open;
    end;
    nSmMinZp := Form_Dm.GetMinZp2(dDtProc);
    LabelSmMinZp.Caption := 'МинЗП = ' + FloatToStr(nSmMinZp);
    sBtnCreSps1601.Enabled := false;
    //bIsVvodZadanija := false;
    cds1601.DisableControls;
    Application.ProcessMessages;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      cSQL := 'Select p.TABN, u.Fam, u.Ima, u.Otch, p.Dt_Priem, p.dt_Uvoln, ' +
              ' wp.* from Z_PrmUv p ' +
             ' Left Outer Join z_Upi u on (u.TabN = p.TabN) ' +
            ' Left Outer Join GetWrkPereOnDate(p.TabN, :dDtPrm) wp on 1 = 1 ' +
           ' where (p.dt_Priem <= :dDtPrm) and ' +
          ' ((p.Dt_Uvoln is Null) or (p.Dt_Uvoln >= :dDtUvln)) and ' +
          ' (wp.KdObj > 0) and (wp.OklTrf <= :nSmMinZp) and (wp.OklTrf <> 0) ';
      if (mLstObj.Count > 0) then begin
        cDopSQL := ' and (wp.KdObj in (';
        for i := 0 to mLstObj.Count-1 do begin
          cDopSQL := cDopSQL + mLstObj[i];
          if i < mLstObj.Count-1 then
            cDopSQL := cDopSQL + ',';
        end;
        cDopSQL := cDopSQL + ')) ';
        cSQL := cSQL + cDopSQL;
      end;
      if (mLstKatP.Count > 0) then begin
        cDopSQL := ' and (wp.KdKatP in (';
        for i := 0 to mLstKatP.Count-1 do begin
          cDopSQL := cDopSQL + mLstKatP[i];
          if i < mLstKatP.Count-1 then
            cDopSQL := cDopSQL + ',';
        end;
        cDopSQL := cDopSQL + ')) ';
        cSQL := cSQL + cDopSQL;
      end;
      SQL.Add(cSQL);
      SQL.Add(' order by u.Fam, u.Ima, u.Otch');
      ParamByName('dDtPrm').AsDateTime := dDtPrm;
      ParamByName('dDtUvln').AsDateTime := dDtUvln;
      ParamByName('nSmMinZp').AsFloat := nSmMinZp;
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      if bFlagDbg then
        SQL.SaveToFile(cDirTemp + 'SpsPNdb.sql');
      Open;
      while not Eof do begin
        cds1601.Append;
        cds1601TabN.AsInteger      := FieldByName('TabN').AsInteger;
        cds1601FamIO.AsString      := MyFamIO(FieldByName('Fam').AsString,
                                    FieldByName('Ima').AsString,
                                    FieldByName('Otch').AsString);
        cds1601KdObj.AsInteger     := FieldByName('KdObj').AsInteger;
        cds1601KdKatP.AsInteger    := FieldByName('KdKatP').AsInteger;
        cds1601KdSpZ.AsInteger     := FieldByName('KdSpZ').AsInteger;
        cds1601VidN.AsString       := '1601';
        cds1601OklTrf.AsFloat      := FieldByName('OklTrf').AsFloat;
        nSmNdb := RoundTo((nSmMinZp - FieldByName('OklTrf').AsFloat), -2);
        cds1601SumProc.AsFloat     := nSmNdb;
        cds1601DtBeg.AsDateTime    := dDtBegNdb;
        cds1601spsbRasch.AsInteger := 1;
        cds1601SP.AsString         := 'p';
        cds1601Notes.AsString      := 'qwa';
        cds1601.Post;
        Next;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    with cds1601 do begin
      AddIndex('OnTabN', 'TabN', []);
      AddIndex('OnFamIO', 'FamIO', [ixCaseInsensitive]);
      AddIndex('OnKdObjTabN', 'KdObj;TabN', []);
      AddIndex('OnKdObjFamIO', 'KdObj;FamIO', [ixCaseInsensitive]);
      IndexName := 'OnKdObjFamIO';
      First;
      EnableControls;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    end;
  end;
  Screen.Cursor := crDefault;
//  sBtnZadanie1601.Enabled := true;
  sBtnSaveNdb1601.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnSaveNdb1601Click(Sender: TObject);
var nNewNrPkt, nNR : integer;
begin
sBtnSaveNdb1601.Enabled :=false;
  nNewNrPkt := Form_Dm.GetNewNdbNrPkt;
  with qryIns1601 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 0 * from z_Nadb');
    Open;
  end;
  with cds1601 do begin
//    DisableControls;
    First;
    while not Eof do begin
      if cds1601SumProc.AsFloat > 0 then
        AddRec1601InNdb(nNewNrPkt);
      Next;
    end;
//    EnableControls;
  end;
  if qryIns1601.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryIns1601]);
  with qryPktNdb do begin
    nNR := MyGetNR;
    Append;
    FieldByName('NR').AsInteger      := nNR;
    FieldByName('NrPkt').AsInteger   := nNewNrPkt;
    FieldByName('DtVPkt').AsDateTime := Now;
    FieldByName('KdUsr').AsInteger   := nAppKdUsr;
    FieldByName('MyNotes').AsString  := gc_AppNmUsr;
    Post;
    Form_Dm.DbMain.ApplyUpdates([qryPktNdb]);
    Close;
    Open;
    Locate('NR', nNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.AddRec1601InNdb(nNewNrPkt : integer);
begin
  with qryIns1601 do begin
    Append;
    qryIns1601NRPKT.AsInteger := nNewNrPkt;
    qryIns1601KDSPS.AsInteger := 1;
    qryIns1601SPSRSCH.AsInteger := cds1601SpsbRasch.AsInteger;
    qryIns1601TABN.AsInteger := cds1601TabN.AsInteger;
    qryIns1601VIDN.AsString := cds1601VidN.AsString;
    qryIns1601KdObj.AsString := cds1601KdObj.AsString;
    qryIns1601KdKatP.AsString := cds1601KdKatP.AsString;
    qryIns1601KdSpZ.AsString := cds1601KdSpZ.AsString;
    qryIns1601Dt_Beg.AsString := cds1601DtBeg.AsString;
    qryIns1601Dt_End.AsString := cds1601DtEnd.AsString;
    qryIns1601SumProc.AsString := cds1601SumProc.AsString;
    qryIns1601SpsRsch.AsString := cds1601SpsbRasch.AsString;
    qryIns1601SP.AsString := cds1601SP.AsString;
    qryIns1601Notes.AsString := cds1601Notes.AsString;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnZadanie1601Click(Sender: TObject);
begin
  if GetZadanieNdbMs {Z_ENdbMs} then begin

  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnCreSps1601Click(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnCreSpsClick(Sender: TObject);
var mLstObj, mLstKatP : TStrings;
    cSQL, cDopSQL : string; i{, nAddCnt} : integer;
    dDtPrm, dDtUvln, dStartDtPere : TDateTime;
    //nY, nM, nD : word;
    //cNmObj, cShKatP : string;
begin
  if not Get_Dates(dDtPrm, dDtUvln, dStartDtPere) {z_GtDats} then
    Exit;
  mLstObj := LbxObj.Items;
  mLstKatP := LbxKatP.Items;
  mLstObj.Clear;
  mLstKatP.Clear;
  if VbObjKat('Выбор подразделений и персонала для пакета',
                     1, mLstObj, mLstKatP) {z_VbObKt} then begin

    with cdsTabs do begin
      if Active then Close;
      IndexDefs.Clear;
      IndexName := '';
      CreateDataSet;
      Open;
    end;
    sBtnCreSps.Enabled := false;
    //bIsVvodZadanija := false;
    cdsTabs.DisableControls;
    Application.ProcessMessages;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      cSQL := 'Select p.TABN, u.Fam, u.Ima, u.Otch, p.Dt_Priem, p.dt_Uvoln, ' +
              ' wp.* from Z_PrmUv p ' +
             ' Left Outer Join z_Upi u on (u.TabN = p.TabN) ' +
            ' Left Outer Join GetWrkPereOnDate(p.TabN, :dDtPrm) wp on 1 = 1 ' +
           ' where (p.dt_Priem <= :dDtPrm) and ' +
          ' ((p.Dt_Uvoln is Null) or (p.Dt_Uvoln >= :dDtUvln)) ';
      if (mLstObj.Count > 0) then begin
        cDopSQL := ' and (wp.KdObj in (';
        for i := 0 to mLstObj.Count-1 do begin
          cDopSQL := cDopSQL + mLstObj[i];
          if i < mLstObj.Count-1 then
            cDopSQL := cDopSQL + ',';
        end;
        cDopSQL := cDopSQL + ')) ';
        cSQL := cSQL + cDopSQL;
      end;
      if (mLstKatP.Count > 0) then begin
        cDopSQL := ' and (wp.KdKatP in (';
        for i := 0 to mLstKatP.Count-1 do begin
          cDopSQL := cDopSQL + mLstKatP[i];
          if i < mLstKatP.Count-1 then
            cDopSQL := cDopSQL + ',';
        end;
        cDopSQL := cDopSQL + ')) ';
        cSQL := cSQL + cDopSQL;
      end;
      SQL.Add(cSQL);
      SQL.Add(' order by u.Fam, u.Ima, u.Otch');
      ParamByName('dDtPrm').AsDateTime := dDtPrm;
      ParamByName('dDtUvln').AsDateTime := dDtUvln;
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      if bFlagDbg then
        SQL.SaveToFile(cDirTemp + 'SpsPNdb.sql');
      Open;
      while not Eof do begin
        cdsTabs.Append;
        cdsTabsTabN.AsInteger    := FieldByName('TabN').AsInteger;
        cdsTabsFam.AsString      := FieldByName('Fam').AsString;
        cdsTabsIma.AsString      := FieldByName('Ima').AsString;
        cdsTabsOtch.AsString     := FieldByName('Otch').AsString;
        cdsTabsKdObj.AsInteger   := FieldByName('KdObj').AsInteger;
        cdsTabsKdKatP.AsInteger  := FieldByName('KdKatP').AsInteger;
        cdsTabs.Post;
        Next;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    with cdsTabs do begin
      AddIndex('OnTabN', 'TabN', []);
      AddIndex('OnFamIO', 'Fam;Ima;Otch', [ixCaseInsensitive]);
      AddIndex('OnKdObjTabN', 'KdObj;TabN', []);
      AddIndex('OnKdObjFamIO', 'KdObj;Fam;Ima;Otch', [ixCaseInsensitive]);
      SetTabsSortMode;
      First;
      EnableControls;
      LabelTabsCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    end;
  end;
  Screen.Cursor := crDefault;
  if cdsTabs.RecordCount > 0 then begin
    dbgrTabs.ReadOnly := true;
    dbgrTabs.Color := clBtnFace;
    qryNdb.DataSource := dsrcTabs;
    qryNdb.Open;
    dbgrNdb.Color := clCream;
    dbgrNdb.SetFocus;
    with cdsTmp do begin
      if Active then Close;
      IndexDefs.Clear;
      IndexName := '';
      CreateDataSet;
      Open;
      Append;
      cdsTmpDtEndOld.AsString  := cSvDtEndOld;
      cdsTmpDtBegNew.AsString  := cSvDtBegNew;
      cdsTmpDtEndNew.AsString  := cSvDtEndNew;
      cdsTmpNrPrikaza.AsString := cSvNrPrikaza;
      cdsTmpDtPrikaza.AsString := cSvDtPrikaza;
      cdsTmpSpNew.AsString     := cSvSpNew;
      cdsTmpSmPrcNew.AsString  := cSvSmPrcNew;
      cdsTmpNotes.AsString     := cSvNotes;
    end;
    dbeDtEndOld.SetFocus; end
  else begin
    LabelTabsCntRec.Caption := '';
    LabelTabsSort.Caption := '';
    ShowMessage('Не нашлось сотрудников по заданным условиям');
    sBtnCreSps.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.SetTabsSortMode;
begin
  if popTabsSortTabN.Checked then begin
    LabelTabsSort.Caption := 'Сортировка по Таб.номеру';
    cdsTabs.IndexName := 'OnTabN'; end
  else if popTabsSortFIO.Checked then begin
    LabelTabsSort.Caption := 'Сортировка по Фамилии И.О.';
    cdsTabs.IndexName := 'OnFamIO'; end
  else if popTabsSortObjTabN.Checked then begin
    LabelTabsSort.Caption := 'Сортировка: Подразд; Таб.н-р';
    cdsTabs.IndexName := 'OnKdObjTabN'; end
  else begin
    LabelTabsSort.Caption := 'Сортировка: Подразд; Фамилия И.О.';
    cdsTabs.IndexName := 'OnKdObjFamIO';
  end
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popTabsSortTabNClick(Sender: TObject);
begin
  if not popTabsSortTabN.Checked then begin
    popTabsSortTabN.Checked := true;
    popTabsSortFIO.Checked := false;
    popTabsSortObjTabN.Checked := false;
    popTabsSortObjFIO.Checked := false;
    SetTabsSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popTabsSortFIOClick(Sender: TObject);
begin
  if not popTabsSortFIO.Checked then begin
    popTabsSortFIO.Checked := true;
    popTabsSortTabN.Checked := false;
    popTabsSortObjTabN.Checked := false;
    popTabsSortObjFIO.Checked := false;
    SetTabsSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popTabsSortObjTabNClick(Sender: TObject);
begin
  if not popTabsSortObjTabN.Checked then begin
    popTabsSortObjTabN.Checked := true;
    popTabsSortFIO.Checked := false;
    popTabsSortTabN.Checked := false;
    popTabsSortObjFIO.Checked := false;
    SetTabsSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popTabsSortObjFIOClick(Sender: TObject);
begin
  if not popTabsSortObjFIO.Checked then begin
    popTabsSortObjFIO.Checked := true;
    popTabsSortObjTabN.Checked := false;
    popTabsSortFIO.Checked := false;
    popTabsSortTabN.Checked := false;
    SetTabsSortMode;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.FormResize(Sender: TObject);
begin
  Panel4.Left := Round((Panel3.Width - Panel4.Width) / 2);
  dbNavShwNdb.Left := PanelTs1Right.Left;
  LabelSortShwNdb.Left := dbNavShwNdb.Left + 90;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.Splitter2Moved(Sender: TObject);
begin
  dbNavShwNdb.Left := PanelTs1Right.Left;
  LabelSortShwNdb.Left := dbNavShwNdb.Left + 90;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.qryShwNdbCalcFields(DataSet: TDataSet);
begin
  qryShwNdbFamIO.AsString := MyFamIO(qryShwNdbFam.AsString,
                                         qryShwNdbIma.AsString,
                                             qryShwNdbOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popNewPkt01Click(Sender: TObject);
var nNewNrPkt, nNR : integer;
begin
  if AddSoglInNdb(nNewNrPkt) {z_AddTSN} then with qryPktNdb do begin
    nNR := MyGetNR;
    Append;
    FieldByName('NR').AsInteger      := nNR;
    FieldByName('NrPkt').AsInteger   := nNewNrPkt;
    FieldByName('DtVPkt').AsDateTime := Now;
    FieldByName('KdUsr').AsInteger   := nAppKdUsr;
    FieldByName('MyNotes').AsString  := gc_AppNmUsr;
    Post;
    Form_Dm.DbMain.ApplyUpdates([qryPktNdb]);
    Close;
    Open;
    Locate('NR', nNR, []);
  end;
  sBtnDelPkt.Enabled := qryPktNdb.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popNewPkt03Click(Sender: TObject);
begin
  // sBtnDelPkt.Enabled := qryPktNdb.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popNewPkt02Click(Sender: TObject);
begin
  // sBtnDelPkt.Enabled := qryPktNdb.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.sBtnDelPktClick(Sender: TObject);
var cMsg : ShortString; nNrPkt : SmallInt;
begin
  cMsg := 'Пакет удаляется безвозвратно. Согласны?:';
  nNrPkt := qryPktNdbNrPkt.AsInteger;
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Delete from z_Nadb where NrPkt = :nNrPkt');
      ParamByName('nNrPkt').AsInteger := nNrPkt;
      ExecSQL;
    end;
    qryPktNdb.Delete;
    Form_Dm.DbMain.ApplyUpdates([qryPktNdb]);
  end;
  sBtnDelPkt.Enabled := qryPktNdb.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popShwNdbSortObjFIOClick(Sender: TObject);
begin
  if not popShwNdbSortObjFIO.Checked then begin
    popShwNdbSortObjFIO.Checked := true;
    popShwNdbSortFIO.Checked := false;
    popShwNdbSortTabN.Checked := false;
    nSortShwNdb := 1;
    OpenQryShwNdb;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popShwNdbSortFIOClick(Sender: TObject);
begin
  if not popShwNdbSortFIO.Checked then begin
    popShwNdbSortObjFIO.Checked := false;
    popShwNdbSortFIO.Checked := true;
    popShwNdbSortTabN.Checked := false;
    nSortShwNdb := 2;
    OpenQryShwNdb;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.popShwNdbSortTabNClick(Sender: TObject);
begin
  if not popShwNdbSortTabN.Checked then begin
    popShwNdbSortObjFIO.Checked := false;
    popShwNdbSortFIO.Checked := false;
    popShwNdbSortTabN.Checked := true;
    nSortShwNdb := 3;
    OpenQryShwNdb;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.dbgr1601Enter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShwNadb.dbgr1601Exit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
