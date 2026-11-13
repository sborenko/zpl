unit z_PrSps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBClient, Provider,
  DBTables, Grids, DBGrids, Menus, DBCtrls, ComCtrls;

type
  TFormPredSps = class(TForm)
    qryTmp: TQuery;
    pop01: TPopupMenu;
    pop01CreSps: TMenuItem;
    pop01Sep1: TMenuItem;
    pop01Fon: TMenuItem;
    pop01Font: TMenuItem;
    pop01Sep2: TMenuItem;
    pop01Sort: TMenuItem;
    pop01SortByTabN: TMenuItem;
    pop01SortByFIO: TMenuItem;
    pop01SortByObjTabN: TMenuItem;
    pop01SortByObjFIO: TMenuItem;
    qrySps1: TQuery;
    qrySps1NR: TIntegerField;
    qrySps1KDUSR: TSmallintField;
    qrySps1KDOBJ: TSmallintField;
    qrySps1TABN: TIntegerField;
    qrySps1WYEAR: TSmallintField;
    qrySps1SM_01: TFloatField;
    qrySps1NRPKT_01: TIntegerField;
    qrySps1SM_02: TFloatField;
    qrySps1NRPKT_02: TIntegerField;
    qrySps1SM_03: TFloatField;
    qrySps1NRPKT_03: TIntegerField;
    qrySps1SM_04: TFloatField;
    qrySps1NRPKT_04: TIntegerField;
    qrySps1SM_05: TFloatField;
    qrySps1NRPKT_05: TIntegerField;
    qrySps1SM_06: TFloatField;
    qrySps1NRPKT_06: TIntegerField;
    qrySps1SM_07: TFloatField;
    qrySps1NRPKT_07: TIntegerField;
    qrySps1SM_08: TFloatField;
    qrySps1NRPKT_08: TIntegerField;
    qrySps1SM_09: TFloatField;
    qrySps1NRPKT_09: TIntegerField;
    qrySps1SM_10: TFloatField;
    qrySps1NRPKT_10: TIntegerField;
    qrySps1SM_11: TFloatField;
    qrySps1NRPKT_11: TIntegerField;
    qrySps1SM_12: TFloatField;
    qrySps1NRPKT_12: TIntegerField;
    qrySps1NOTES_01: TStringField;
    qrySps1NOTES_02: TStringField;
    qrySps1NOTES_03: TStringField;
    qrySps1NOTES_04: TStringField;
    qrySps1NOTES_05: TStringField;
    qrySps1NOTES_06: TStringField;
    qrySps1NOTES_07: TStringField;
    qrySps1NOTES_08: TStringField;
    qrySps1NOTES_09: TStringField;
    qrySps1NOTES_10: TStringField;
    qrySps1NOTES_11: TStringField;
    qrySps1NOTES_12: TStringField;
    dsrcSps1: TDataSource;
    qrySps1FamIO: TStringField;
    updSps1: TUpdateSQL;
    qryNR: TQuery;
    pop01OpenSps: TMenuItem;
    qrySps1FAM: TStringField;
    qrySps1IMA: TStringField;
    qrySps1OTCH: TStringField;
    PageControl: TPageControl;
    ts0: TTabSheet;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Panel1: TPanel;
    LabelCntRec: TLabel;
    Label1: TLabel;
    LabelSortSps: TLabel;
    bBtnCancel1: TBitBtn;
    dbNavSps: TDBNavigator;
    dbgrSps1: TDBGrid;
    LabelFIO: TLabel;
    pop01CrePktOtkl: TMenuItem;
    dbgr_Pkt2: TDBGrid;
    Panel2: TPanel;
    qry_Pkt2: TQuery;
    dsrc_Pkt2: TDataSource;
    qry_Pkt2NR: TIntegerField;
    qry_Pkt2KDUSR: TSmallintField;
    qry_Pkt2WYEAR: TSmallintField;
    qry_Pkt2KDOBJ: TSmallintField;
    qry_Pkt2TABN: TIntegerField;
    qry_Pkt2SMM: TFloatField;
    qry_Pkt2NOTES: TStringField;
    qry_Pkt2NRPKT: TIntegerField;
    qry_Pkt2FAM: TStringField;
    qry_Pkt2IMA: TStringField;
    qry_Pkt2OTCH: TStringField;
    qry_Pkt2FamIO: TStringField;
    dbNav_Pkt: TDBNavigator;
    LabelCntRec2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PanelRight: TPanel;
    LbxF8: TListBox;
    PanelMsg: TPanel;
    Label1_Msg: TLabel;
    Label2_Msg: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    sBtnF8: TSpeedButton;
    sBtnSelAll: TSpeedButton;
    sBtnUnSelAll: TSpeedButton;
    Label7: TLabel;
    sBtnSvPkt: TSpeedButton;
    sBtnGoBack: TSpeedButton;
    Label8: TLabel;
    pop01Sep0: TMenuItem;
    pop01DelRec: TMenuItem;
    LabelCntSelRec: TLabel;
    Label3_Msg: TLabel;
    qryPkt0: TQuery;
    Panel3: TPanel;
    LabelCntPktRec: TLabel;
    dbNavPkt: TDBNavigator;
    qryPkt0NR: TIntegerField;
    qryPkt0KDUSR: TSmallintField;
    qryPkt0NRPKT: TIntegerField;
    qryPkt0WYEAR: TSmallintField;
    qryPkt0DTPKT: TDateTimeField;
    qryPkt0DTPROC: TDateTimeField;
    qryPkt0ZAMESGOD: TDateTimeField;
    qryPkt0ZAMGFKT: TDateTimeField;
    qryPkt0NOTES: TStringField;
    dsrcPkt0: TDataSource;
    dbgrPkt0: TDBGrid;
    Splitter1: TSplitter;
    qryOtkl0: TQuery;
    qryOtkl0NR: TIntegerField;
    qryOtkl0KDSPS: TSmallintField;
    qryOtkl0DTPROC: TDateTimeField;
    qryOtkl0ZAMESGOD: TDateTimeField;
    qryOtkl0TABN: TIntegerField;
    qryOtkl0VIDN: TStringField;
    qryOtkl0SHVIDN: TStringField;
    qryOtkl0STORN: TStringField;
    qryOtkl0OLDKDVIDN: TSmallintField;
    qryOtkl0CHAS: TFloatField;
    qryOtkl0SUMMA: TFloatField;
    qryOtkl0KDOBJ: TSmallintField;
    qryOtkl0KDKATP: TSmallintField;
    qryOtkl0DT_BEG: TDateTimeField;
    qryOtkl0DT_END: TDateTimeField;
    qryOtkl0PDN: TSmallintField;
    qryOtkl0KDSPZ: TSmallintField;
    qryOtkl0SCHBU: TStringField;
    qryOtkl0PSCH: TStringField;
    qryOtkl0NOTES: TStringField;
    qryOtkl0PRR: TSmallintField;
    qryOtkl0PRPV: TSmallintField;
    qryOtkl0KTO: TSmallintField;
    qryOtkl0PRKR: TSmallintField;
    qryOtkl0SPEC_NR: TIntegerField;
    qryOtkl0DTVDPV: TDateTimeField;
    qryOtkl0NRVDPV: TIntegerField;
    qryOtkl0MYNOTES: TStringField;
    qryOtkl0SPECPS: TIntegerField;
    qryOtkl0PBNK: TSmallintField;
    qryOtkl0KDBNK: TSmallintField;
    qryOtkl0FAM: TStringField;
    qryOtkl0IMA: TStringField;
    qryOtkl0OTCH: TStringField;
    dbNavOtklNdb: TDBNavigator;
    LabelCntOtklRec: TLabel;
    bBtnCancel0: TBitBtn;
    pop00: TPopupMenu;
    pop00Sort: TMenuItem;
    pop00SortByFIO: TMenuItem;
    pop00SortByTabN: TMenuItem;
    pop00SortByObjFIO: TMenuItem;
    pop00SortByObjTabN: TMenuItem;
    dspOtkl0: TDataSetProvider;
    cdsOtkl0: TClientDataSet;
    dsrcOtkl0: TDataSource;
    cdsOtkl0NR: TIntegerField;
    cdsOtkl0KDSPS: TSmallintField;
    cdsOtkl0DTPROC: TDateTimeField;
    cdsOtkl0ZAMESGOD: TDateTimeField;
    cdsOtkl0TABN: TIntegerField;
    cdsOtkl0FamIO: TStringField;
    cdsOtkl0VIDN: TStringField;
    cdsOtkl0SHVIDN: TStringField;
    cdsOtkl0STORN: TStringField;
    cdsOtkl0OLDKDVIDN: TSmallintField;
    cdsOtkl0CHAS: TFloatField;
    cdsOtkl0SUMMA: TFloatField;
    cdsOtkl0KDOBJ: TSmallintField;
    cdsOtkl0KDKATP: TSmallintField;
    cdsOtkl0DT_BEG: TDateTimeField;
    cdsOtkl0DT_END: TDateTimeField;
    cdsOtkl0PDN: TSmallintField;
    cdsOtkl0KDSPZ: TSmallintField;
    cdsOtkl0SCHBU: TStringField;
    cdsOtkl0PSCH: TStringField;
    cdsOtkl0NOTES: TStringField;
    cdsOtkl0PRR: TSmallintField;
    cdsOtkl0PRPV: TSmallintField;
    cdsOtkl0KTO: TSmallintField;
    cdsOtkl0PRKR: TSmallintField;
    cdsOtkl0SPEC_NR: TIntegerField;
    cdsOtkl0DTVDPV: TDateTimeField;
    cdsOtkl0NRVDPV: TIntegerField;
    cdsOtkl0MYNOTES: TStringField;
    cdsOtkl0SPECPS: TIntegerField;
    cdsOtkl0PBNK: TSmallintField;
    cdsOtkl0KDBNK: TSmallintField;
    cdsOtkl0FAM: TStringField;
    cdsOtkl0IMA: TStringField;
    cdsOtkl0OTCH: TStringField;
    LabelSortOtkl: TLabel;
    LabelSortOtklNdbMsg: TLabel;
    pop00Sep1: TMenuItem;
    pop00DelPkt: TMenuItem;
    qrySpecNdb: TQuery;
    cdsYear: TClientDataSet;
    cdsYearYearInt: TSmallintField;
    cdsYearYearStr: TStringField;
    cdsYearCntRec: TSmallintField;
    sBtnWYear: TSpeedButton;
    sBtnSps: TSpeedButton;
    sBtnPkt: TSpeedButton;
    sBtnHlp00: TSpeedButton;
    sBtnHlp01: TSpeedButton;
    sBtnHlp02: TSpeedButton;
    edFamLoc: TEdit;
    pop01FindCase: TMenuItem;
    pop01FindCaseByCont: TMenuItem;
    pop01FindCaseByStart: TMenuItem;
    Shape: TShape;
    sBtnFindTabN: TSpeedButton;
    qryNdb1: TQuery;
    Panel0Right: TPanel;
    dsrcNdb1: TDataSource;
    Splitter2: TSplitter;
    dbgrNdb1: TDBGrid;
    qryNdb1NR: TIntegerField;
    qryNdb1KDSPS: TSmallintField;
    qryNdb1SPSRSCH: TSmallintField;
    qryNdb1TABN: TIntegerField;
    qryNdb1VIDN: TStringField;
    qryNdb1OLDKDVIDN: TSmallintField;
    qryNdb1SUMPROC: TFloatField;
    qryNdb1SP: TStringField;
    qryNdb1PRCSOVM: TFloatField;
    qryNdb1DT_BEG: TDateTimeField;
    qryNdb1DT_END: TDateTimeField;
    qryNdb1OLDKDOBJ: TSmallintField;
    qryNdb1KDOBJ: TSmallintField;
    qryNdb1KDKATP: TSmallintField;
    qryNdb1PRCHS: TStringField;
    qryNdb1PRSMM: TStringField;
    qryNdb1KDSPZ: TSmallintField;
    qryNdb1SPEC_NR: TIntegerField;
    qryNdb1NOTES: TStringField;
    qryNdb1NRPRBEG: TStringField;
    qryNdb1DTPRBEG: TDateTimeField;
    qryNdb1NRPREND: TStringField;
    qryNdb1DTPREND: TDateTimeField;
    qryNdb1NRPKT: TIntegerField;
    qryNdb1DTVPKT: TDateTimeField;
    pop01CrePktNdb: TMenuItem;
    ts3: TTabSheet;
    Panel4: TPanel;
    LabelCntRec3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    LabelCntSelRec3: TLabel;
    SpeedButton2: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Panel3Right: TPanel;
    PanelMsg_3: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    sBtnF8_3: TSpeedButton;
    sBtnSelAll_3: TSpeedButton;
    sBtnUnSelAll_3: TSpeedButton;
    Label18: TLabel;
    sBtnSvPkt_3: TSpeedButton;
    sBtnGoBack_3: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    qry_Pkt3: TQuery;
    dsrc_Pkt3: TDataSource;
    qry_Pkt3KDUSR: TSmallintField;
    qry_Pkt3WYEAR: TSmallintField;
    qry_Pkt3TABN: TIntegerField;
    qry_Pkt3FAM: TStringField;
    qry_Pkt3IMA: TStringField;
    qry_Pkt3OTCH: TStringField;
    qry_Pkt3FamIO: TStringField;
    Panel3Left: TPanel;
    dbgr_Pkt3: TDBGrid;
    Splitter3: TSplitter;
    dbgr_Ndb3: TDBGrid;
    qry_Ndb3: TQuery;
    dsrc_Ndb3: TDataSource;
    qry_Ndb3NR: TIntegerField;
    qry_Ndb3KDSPS: TSmallintField;
    qry_Ndb3SPSRSCH: TSmallintField;
    qry_Ndb3TABN: TIntegerField;
    qry_Ndb3VIDN: TStringField;
    qry_Ndb3OLDKDVIDN: TSmallintField;
    qry_Ndb3SUMPROC: TFloatField;
    qry_Ndb3SP: TStringField;
    qry_Ndb3PRCSOVM: TFloatField;
    qry_Ndb3DT_BEG: TDateTimeField;
    qry_Ndb3DT_END: TDateTimeField;
    qry_Ndb3OLDKDOBJ: TSmallintField;
    qry_Ndb3KDOBJ: TSmallintField;
    qry_Ndb3KDKATP: TSmallintField;
    qry_Ndb3PRCHS: TStringField;
    qry_Ndb3PRSMM: TStringField;
    qry_Ndb3KDSPZ: TSmallintField;
    qry_Ndb3SPEC_NR: TIntegerField;
    qry_Ndb3NOTES: TStringField;
    qry_Ndb3NRPRBEG: TStringField;
    qry_Ndb3DTPRBEG: TDateTimeField;
    qry_Ndb3NRPREND: TStringField;
    qry_Ndb3DTPREND: TDateTimeField;
    qry_Ndb3NRPKT: TIntegerField;
    qry_Ndb3DTVPKT: TDateTimeField;
    LbxF8_3: TListBox;
    qryPkt0TIPPKT: TStringField;
    PgCtrl_0: TPageControl;
    ts0_Otkl: TTabSheet;
    ts0_Ndb: TTabSheet;
    dbgrOtkl0: TDBGrid;
    qryPere: TQuery;
    qryNdb0: TQuery;
    dsrcNdb0: TDataSource;
    dbgrNdb0: TDBGrid;
    qryNdb0NR: TIntegerField;
    qryNdb0KDSPS: TSmallintField;
    qryNdb0SPSRSCH: TSmallintField;
    qryNdb0TABN: TIntegerField;
    qryNdb0VIDN: TStringField;
    qryNdb0OLDKDVIDN: TSmallintField;
    qryNdb0SUMPROC: TFloatField;
    qryNdb0SP: TStringField;
    qryNdb0PRCSOVM: TFloatField;
    qryNdb0DT_BEG: TDateTimeField;
    qryNdb0DT_END: TDateTimeField;
    qryNdb0OLDKDOBJ: TSmallintField;
    qryNdb0KDOBJ: TSmallintField;
    qryNdb0KDKATP: TSmallintField;
    qryNdb0PRCHS: TStringField;
    qryNdb0PRSMM: TStringField;
    qryNdb0KDSPZ: TSmallintField;
    qryNdb0SPEC_NR: TIntegerField;
    qryNdb0NOTES: TStringField;
    qryNdb0NRPRBEG: TStringField;
    qryNdb0DTPRBEG: TDateTimeField;
    qryNdb0NRPREND: TStringField;
    qryNdb0DTPREND: TDateTimeField;
    qryNdb0NRPKT: TIntegerField;
    qryNdb0DTVPKT: TDateTimeField;
    qryNdb0FAM: TStringField;
    qryNdb0IMA: TStringField;
    qryNdb0OTCH: TStringField;
    qryNdb0FamIO: TStringField;
    pop00DelRecInOtkl: TMenuItem;
    qrySps1SPECPS: TIntegerField;
    qry_Pkt2SPECPS: TIntegerField;
    sBtnPrt: TSpeedButton;
    pop00Tts: TMenuItem;
    PanelTts: TPanel;
    LabelTtsCntRec: TLabel;
    LabelTtsCntSotr: TLabel;
    LabelTtsSmm: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LbxTabN: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pop01CreSpsClick(Sender: TObject);
    procedure pop01FontClick(Sender: TObject);
    procedure pop01FonClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure pop01SortByTabNClick(Sender: TObject);
    procedure pop01SortByFIOClick(Sender: TObject);
    procedure pop01SortByObjTabNClick(Sender: TObject);
    procedure pop01SortByObjFIOClick(Sender: TObject);
    procedure qrySps1CalcFields(DataSet: TDataSet);
    procedure pop01OpenSpsClick(Sender: TObject);
    procedure qrySps1BeforePost(DataSet: TDataSet);
    procedure qrySps1AfterPost(DataSet: TDataSet);
    procedure qrySps1TABNValidate(Sender: TField);
    procedure dsrcSps1DataChange(Sender: TObject; Field: TField);
    procedure pop01CrePktOtklClick(Sender: TObject);
    procedure qry_Pkt2CalcFields(DataSet: TDataSet);
    procedure sBtnGoBackClick(Sender: TObject);
    procedure dbgr_Pkt2DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnF8Click(Sender: TObject);
    procedure PanelRightResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sBtnSelAllClick(Sender: TObject);
    procedure sBtnUnSelAllClick(Sender: TObject);
    procedure dbgr_Pkt2KeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure pop01DelRecClick(Sender: TObject);
    procedure dbgrSps1DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qrySps1NewRecord(DataSet: TDataSet);
    procedure cdsOtkl0CalcFields(DataSet: TDataSet);
    procedure Splitter1Moved(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pop00SortByFIOClick(Sender: TObject);
    procedure pop00SortByTabNClick(Sender: TObject);
    procedure pop00SortByObjFIOClick(Sender: TObject);
    procedure pop00SortByObjTabNClick(Sender: TObject);
    procedure sBtnSvPktClick(Sender: TObject);
    procedure qryPkt0AfterScroll(DataSet: TDataSet);
    procedure pop00DelPktClick(Sender: TObject);
    procedure pop00Popup(Sender: TObject);
    procedure sBtnWYearClick(Sender: TObject);
    procedure sBtnSpsClick(Sender: TObject);
    procedure sBtnPktClick(Sender: TObject);
    procedure dbgrPkt0DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edFamLocEnter(Sender: TObject);
    procedure edFamLocExit(Sender: TObject);
    procedure edFamLocChange(Sender: TObject);
    procedure sBtnFindTabNClick(Sender: TObject);
    procedure pop01FindCaseByContClick(Sender: TObject);
    procedure pop01FindCaseByStartClick(Sender: TObject);
    procedure pop01CrePktNdbClick(Sender: TObject);
    procedure qry_Pkt3CalcFields(DataSet: TDataSet);
    procedure sBtnGoBack_3Click(Sender: TObject);
    procedure sBtnF8_3Click(Sender: TObject);
    procedure dbgr_Pkt3DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnSelAll_3Click(Sender: TObject);
    procedure sBtnUnSelAll_3Click(Sender: TObject);
    procedure sBtnSvPkt_3Click(Sender: TObject);
    procedure Panel3RightResize(Sender: TObject);
    procedure qryNdb0CalcFields(DataSet: TDataSet);
    procedure dbgr_Pkt3KeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure pop00DelRecInOtklClick(Sender: TObject);
    procedure qrySps1FldSmValidate(Sender: TField);
    procedure pop01Popup(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure pop00TtsClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    mFonColor : TColor;
    cFontName : ShortString;
    nFontSize : SmallInt;
    bFontItalic, bFontBold : boolean;
    nSpsSortCase, nOtklNdbSortCase : SmallInt;
    n_SvTabN : integer;
    n_KdUsr, n_SvWYear : SmallInt;
    bNewRecord : boolean;
    cFldSm, cFldNrPkt, cFldNotes, cSpZ : ShortString;
    nWYear, nZaMesFakt, nKdSpZ : SmallInt;
    dZaMGPkt : TDateTime;
    nNewPktNR : integer;
    dNewPktDt : TDateTime;
    dDtBegN, dDtEndN, dDtBYN, dDtEYN : TDateTime;
    procedure OpenQryPkt0;
    procedure OpenCdsOtkl0;
    procedure OpenQryNdb0;
    procedure AddRecInQrySps;
    procedure SetTabsFont;
    procedure SetTabsColor;
    procedure SetOtklNdbSortCase;
    procedure OpenQrySps1;
    procedure OpenQryNdb1;
    function GetNewSpsNR : integer;
    procedure ShwLabelFIO;
    function GetNewNrPkt1005 : integer;
    function IsSpecNdbRec(nTabN : integer; dDtPrc : TDateTime) : boolean;
    procedure AddFoxNdbRec(nTabN : integer; dDtPrc, dDtEnd : TDateTime);
    procedure AddFoxNdb3Rec(nTabN : integer; dDtBeg, dDtEnd : TDateTime);
    procedure AddRecInOtkl;
    procedure UpdPredSps;
    function GetWrkObjSpZ(nTabN : integer; dOnDate : TDateTime;
                                    var nKdObj, nKdSpZ : SmallInt) : boolean;
    procedure SetPgCtrl_0Vid(cTipPkt : ShortString);
    procedure DelRecInOtkl;
  public
    { Public declarations }
  end;

procedure ShwPredSps;

const SECTION = 'z_PrSps';

var
  FormPredSps: TFormPredSps;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main, z_CmnPrt,
                           z_GtMPkt, z_GtPrSp, z_FFam, z_DlgSNR;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwPredSps;
begin
  FormPredSps := TFormPredSps.Create(Application);
  with FormPredSps do begin
    Caption := 'Работа с предварительными списками для трудовых договоров';
    n_KdUsr := nAppKdUsr;
    sBtnWYear.Caption := IntToStr(n_SvWYear);
    OpenQryPkt0;
    SetPgCtrl_0Vid(qryPkt0TipPkt.AsString);
    OpenQrySps1;
    OpenQryNdb1;
    if n_SvTabN > 0 then
      qrySps1.Locate('TabN', n_SvTabN, []);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.OpenQryPkt0;
begin
  with qryPkt0 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_PredPkt order by NrPkt');
    Open;
    LabelCntPktRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    Last;
    SetPgCtrl_0Vid(qryPkt0TipPkt.AsString);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.OpenCdsOtkl0;
begin
  with qryOtkl0 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPkt0;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, o.* from ViOtkl  ' +
            ' o Left Outer Join z_Upi u on u.TabN = o.TabN ' +
            ' where o.NrVdPv = :NrPkt and o.DtVdPv = :DtPkt');
  end;
  dspOtkl0.DataSet := qryOtkl0;
  with cdsOtkl0 do begin
    if Active then Close;
    ProviderName := 'dspOtkl0';
    Open;
    LabelCntOtklRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.OpenQryNdb0;
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryNdb0 do begin
    if Active then begin
      nSvNR := qryNdb0NR.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPkt0;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, n.* ' +
            ' from Z_Nadb n Left Outer Join z_UPI u on u.TabN = n.TabN ' +
            ' where n.NrPkt = :NrPkt and n.DtVPkt = :DtPkt and ' +
            ' n.VidN in ("1005","1006","1008") and ' +
            ' n.SpsRsch = 4 and n.SumProc = 0');
    if nOtklNdbSortCase = 1 then
      SQL.Add('order by n.TabN, n.KdObj, u.Fam, u.Ima, u.Otch')
    else if nOtklNdbSortCase = 2 then
      SQL.Add('order by u.Fam, u.Ima, u.Otch, n.KdObj')
    else if nOtklNdbSortCase = 3 then
      SQL.Add('order by n.KdObj, n.TabN')
    else if nOtklNdbSortCase = 4 then
      SQL.Add('order by n.KdObj, u.Fam, u.Ima, u.Otch');
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
    LabelCntOtklRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 560);
    Width  := ReadInteger(SECTION, 'wW', 750);
    dbgrPkt0.Width := ReadInteger(SECTION, 'grPkt0W', 340);
    mFonColor := ReadInteger(SECTION, 'FonClr', clMoneyGreen);
    cFontName := ReadString(SECTION, 'c_FN', 'Arial');
    nFontSize := ReadInteger(SECTION, 'c_FS', 10);
    bFontBold := ReadBool(SECTION, 'b_FB', true);
    bFontItalic := ReadBool(SECTION, 'b_FI', false);
    nSpsSortCase := ReadInteger(SECTION, 'nSpsSortCase', 3);
    nOtklNdbSortCase := ReadInteger(SECTION, 'nOtklNdbSortCase', 1);
    n_SvTabN := ReadInteger(SECTION, 'n_SvTabN', 0);
    n_SvWYear := ReadInteger(SECTION, 'n_SvYear', 2013);
    pop01FindCaseByCont.Checked := ReadBool(SECTION, 'bFamByCont', true);
    dbgrNdb1.Height := ReadInteger(SECTION, 'grNdb1H', 65);
    Free;
  end;
  pop01FindCaseByStart.Checked := not pop01FindCaseByCont.Checked;
  SetTabsFont;
  SetTabsColor;
  ts0.TabVisible := false; // bFlagDbg;
  ts0_Otkl.TabVisible := false; // bFlagDbg;
  ts0_Ndb.TabVisible := false; // bFlagDbg;
  ts1.TabVisible := false; // bFlagDbg;
  ts2.TabVisible := false; // bFlagDbg;
  ts3.TabVisible := false; // bFlagDbg;
  PageControl.ActivePage := ts0;
  ActiveControl := dbgrPkt0;
  if FileExists(cDirVids + 'PrPkt02.vid') then
    dbgrPkt0.Columns.LoadFromFile(cDirVids + 'PrPkt02.vid');
  if FileExists(cDirVids + 'PrOtk03.vid') then
    dbgrOtkl0.Columns.LoadFromFile(cDirVids + 'PrOtk03.vid');
  if FileExists(cDirVids + 'PrSps02.vid') then
    dbgrSps1.Columns.LoadFromFile(cDirVids + 'PrSps02.vid');
  if FileExists(cDirVids + 'Pr_Pkt01.vid') then
    dbgr_Pkt2.Columns.LoadFromFile(cDirVids + 'Pr_Pkt01.vid');
  with qryNR do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(Z_PredSps_Nr, 1) NewNr from rdb$DataBase');
  end;
  bNewRecord := false;
  SetOtklNdbSortCase;
//  OpenQrySps1;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPkt0.Columns.SaveToFile(cDirVids  + 'PrPkt02.vid');
  dbgrOtkl0.Columns.SaveToFile(cDirVids + 'PrOtk03.vid');
  dbgrSps1.Columns.SaveToFile(cDirVids  + 'PrSps02.vid');
  dbgr_Pkt2.Columns.SaveToFile(cDirVids + 'Pr_Pkt01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grPkt0W', dbgrPkt0.Width);
    WriteInteger(SECTION, 'FonClr', mFonColor);
    WriteString(SECTION, 'c_FN', cFontName);
    WriteInteger(SECTION, 'c_FS', nFontSize);
    WriteBool(SECTION, 'b_FB', bFontBold);
    WriteBool(SECTION, 'b_FI', bFontItalic);
    WriteInteger(SECTION, 'nSpsSortCase', nSpsSortCase);
    WriteInteger(SECTION, 'nOtklNdbSortCase', nOtklNdbSortCase);
    if qrySps1.Active then
      WriteInteger(SECTION, 'n_SvTabN', qrySps1TabN.AsInteger);
    WriteInteger(SECTION, 'n_SvYear', n_SvWYear);
    WriteBool(SECTION, 'bFamByCont', pop01FindCaseByCont.Checked);
    WriteInteger(SECTION, 'grNdb1H', dbgrNdb1.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01CreSpsClick(Sender: TObject);
begin
  with qrySps1 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, s.* ' +
            ' from Z_PredSps s Left Outer Join Z_Upi u on u.TabN = s.TabN ' +
            ' where s.KdUsr = :nKdUsr');
    ParamByName('nKdUsr').AsInteger := n_KdUsr;
    Open;
    DisableControls;
    BeforePost := NIL;
    AfterPost  := NIL;
    qrySps1TABN.OnValidate := NIL;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct n.KdObj, n.TabN, u.Fam, u.Ima, u.Otch ' +
            ' from Z_NU n ' +
            ' Left Outer Join Z_UPI u on u.TabN = n.TabN ' +
            ' where n.DtProc >= "01/01/2013" and n.DtProc < "01/01/2014" and ' +
            ' n.VidN = "1005"');
    Open;
    while not Eof do begin
      AddRecInQrySps;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qrySps1 do begin
    if UpdatesPending then begin
      Form_Dm.DbMain.ApplyUpdates([qrySps1]);
    end;
    Close;
    OpenQrySps1;
    OpenQryNdb1;
    First;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    EnableControls;
    BeforePost := qrySps1BeforePost;
    AfterPost  := qrySps1AfterPost;
    qrySps1TABN.OnValidate := qrySps1TABNValidate;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qrySps1BeforePost(DataSet: TDataSet);
begin
  if qrySps1SpecPS.IsNull then
    qrySps1SpecPS.AsInteger := Form_Dm.GetNewSpecPS;
  if qrySps1NR.IsNull then begin
    qrySps1NR.AsInteger := GetNewSpsNR;
    bNewRecord := true;
  end
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qrySps1AfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  if qrySps1.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qrySps1]);
  if bNewRecord then with qrySps1 do begin
    nSvNR := qrySps1NR.AsInteger;
    Close;
    OpenQrySps1;
    OpenQryNdb1;
    Locate('NR', nSvNR, []);
    LabelCntRec.Caption := IntToStr(RecordCount);
    bNewRecord := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.AddRecInQrySps;
begin
  with qrySps1 do begin
    Append;
    qrySps1NR.AsInteger := GetNewSpsNR;
    qrySps1KdUsr.AsInteger := n_KdUsr;
    qrySps1WYear.AsInteger := 2013;
    qrySps1KdObj.AsString  := qryTmp.FieldByName('KdObj').AsString;
    qrySps1TabN.AsString   := qryTmp.FieldByName('TabN').AsString;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01FontClick(Sender: TObject);
begin
  FormZpMain.FontDialog1.Font := dbgrSps1.Font;
  if FormZpMain.FontDialog1.Execute then begin
    cFontName := FormZpMain.FontDialog1.Font.Name;
    nFontSize := FormZpMain.FontDialog1.Font.Size;
    bFontItalic := (fsItalic in FormZpMain.FontDialog1.Font.Style);
    bFontBold := (fsBold in FormZpMain.FontDialog1.Font.Style);
    SetTabsFont;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01FonClick(Sender: TObject);
begin
  FormZpMain.ColorDialog1.Color := mFonColor;
  if FormZpMain.ColorDialog1.Execute then begin
    mFonColor := FormZpMain.ColorDialog1.Color;
    SetTabsColor;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.SetTabsFont;
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
  dbgrSps1.Font.Name      := cFontName;
  dbgrSps1.TitleFont.Name := cFontName;
  dbgrSps1.Font.Size      := nFontSize;
  dbgrSps1.TitleFont.Size := nFontSize;
  dbgrSps1.Font.Style     := mFontStyle;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.SetTabsColor;
begin
  dbgrSps1.Color := mFonColor;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01SortByTabNClick(Sender: TObject);
begin
  if not pop01SortByTabN.Checked then begin
    nSpsSortCase := 1;
    OpenQrySps1;
    OpenQryNdb1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01SortByFIOClick(Sender: TObject);
begin
  if not pop01SortByFIO.Checked then begin
    nSpsSortCase := 2;
    OpenQrySps1;
    OpenQryNdb1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01SortByObjTabNClick(Sender: TObject);
begin
  if not pop01SortByObjTabN.Checked then begin
    nSpsSortCase := 3;
    OpenQrySps1;
    OpenQryNdb1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01SortByObjFIOClick(Sender: TObject);
begin
  if not pop01SortByObjFIO.Checked then begin
    nSpsSortCase := 4;
    OpenQrySps1;
    OpenQryNdb1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.OpenQrySps1;
var nSvNR : integer;
begin
  nSvNR := 0;
  with qrySps1 do begin
    if Active then begin
      nSvNR := qrySps1NR.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, s.* ' +
            ' from Z_PredSps s Left Outer Join Z_Upi u on u.TabN = s.TabN ' +
            ' where WYear = :n_SvWYear ');
    if not bFlagDbg then
      SQL.Add(' and s.KdUsr = :nKdUsr ');
    if nSpsSortCase = 1 then begin
      SQL.Add('order by TabN, KdObj');
      LabelSortSps.Caption := 'по Таб. н-ру'; end
    else if nSpsSortCase = 2 then begin
      SQL.Add('order by Fam, Ima, Otch, KdObj');
      LabelSortSps.Caption := 'по Фамилии И.О.'; end
    else if nSpsSortCase = 3 then begin
      SQL.Add('order by KdObj, TabN');
      LabelSortSps.Caption := 'Подразделение, Таб. н-р'; end
    else {if nSpsSortCase = 4 then} begin
      SQL.Add('order by KdObj, Fam, Ima, Otch');
      LabelSortSps.Caption := 'Подразделение, Фамилия И.О.';
    end;
    if not bFlagDbg then
      ParamByName('nKdUsr').AsInteger := n_KdUsr;
    ParamByName('n_SvWYear').AsInteger := n_SvWYear;
    Open;
    if nSvNr <> 0 then
      Locate('NR', nSvNR, []);
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
  pop01SortByTabN.Checked    := nSpsSortCase = 1;
  pop01SortByFIO.Checked     := nSpsSortCase = 2;
  pop01SortByObjTabN.Checked := nSpsSortCase = 3;
  pop01SortByObjFIO.Checked  := nSpsSortCase = 4;
  if nSpsSortCase = 2 then
    edFamLoc.Color := clWindow
  else
    edFamLoc.Color := clBtnFace;
  Shape.Visible := nSpsSortCase = 2;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.OpenQryNdb1;
var dDtBeg, dDtEnd : TDateTime;
begin
  dDtBeg := EncodeDate(n_SvWYear, 1, 1);
  dDtEnd := EncodeDate(n_SvWYear, 12, 31);
  with qryNdb1 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcSps1;
    SQL.Add('Select * from Z_Nadb where TabN = :TabN and VidN = "1005" and ' +
            ' SumProc = 0 and SpsRsch = 4 and ' +
            ' Dt_Beg >= :dDtBeg and Dt_Beg <= :dDtEnd and ' +
            ' (Dt_End is NULL or Dt_End <= :dDtEnd) ' +
            ' order by Dt_Beg, Dt_End, KdObj');
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qrySps1CalcFields(DataSet: TDataSet);
begin
  qrySps1FamIO.AsString := MyFamIO(qrySps1Fam.AsString, qrySps1Ima.AsString,
                                                      qrySps1Otch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.cdsOtkl0CalcFields(DataSet: TDataSet);
begin
  cdsOtkl0FamIO.AsString := MyFamIO(cdsOtkl0Fam.AsString, cdsOtkl0Ima.AsString,
                                                      cdsOtkl0Otch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qry_Pkt2CalcFields(DataSet: TDataSet);
begin
  qry_Pkt2FamIO.AsString := MyFamIO(qry_Pkt2Fam.AsString, qry_Pkt2Ima.AsString,
                                                      qry_Pkt2Otch.AsString);
end;
//------------------------------------------------------------------------------
function TFormPredSps.GetNewSpsNR: integer;
begin
//    SQL.Add('Select Gen_ID(Z_PredSps_Nr, 1) NewNr from rdb$DataBase');
  Result := 0;
  with qryNR do begin
    if Active then Close;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNR').AsInteger;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01OpenSpsClick(Sender: TObject);
begin
  OpenQrySps1;
  OpenQryNdb1;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qrySps1TABNValidate(Sender: TField);
var cText : ShortString; nTabN : integer;
    cFam, cIma, cOtch, cPol, cID : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    nTabN := Sender.AsInteger;
    if Form_Dm.TabN2FIO(nTabN, cFam, cIma, cOtch, cPol, cID) then begin
      qrySps1Fam.AsString  := cFam;
      qrySps1Ima.AsString  := cIma;
      qrySps1Otch.AsString := cOtch; end
    else begin
      qrySps1Fam.AsString  := '';
      qrySps1Ima.AsString  := '';
      qrySps1Otch.AsString := '';
      ShowMessage('Нет в спр-ке сотрудников таб.н-ра ' + cText);
    end; end
  else begin
    qrySps1Fam.AsString  := '';
    qrySps1Ima.AsString  := '';
    qrySps1Otch.AsString := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.dsrcSps1DataChange(Sender: TObject; Field: TField);
begin
  if dsrcSps1.State = dsBrowse then
    ShwLabelFIO;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.ShwLabelFIO;
var cMsg : ShortString;
begin
  cMsg := '';
  if not qrySps1KdObj.IsNull then
    cMsg := cMsg + ' Пдр = ' + qrySps1KdObj.AsString;
  if not qrySps1TabN.IsNull then
    cMsg := cMsg + ' ТабНр = ' + qrySps1TabN.AsString;
  if not qrySps1Fam.IsNull then
    cMsg := cMsg + '  ' + qrySps1Fam.AsString;
  if not qrySps1Ima.IsNull then
    cMsg := cMsg + ' ' + qrySps1Ima.AsString;
  if not qrySps1Otch.IsNull then
    cMsg := cMsg + ' ' + qrySps1Otch.AsString;
  cMsg := Trim(cMsg);
  LabelFIO.Caption := cMsg;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01CrePktOtklClick(Sender: TObject);
begin
  nWYear := n_SvWYear;                                            {z_GtMPkt}
  if DlgVubZaMes(nWYear, nZaMesFakt, nKdSpZ, cSpZ, dZaMGPkt) then begin
    cFldSm := 'SM_';
    cFldNrPkt := 'NRPKT_';
    cFldNotes := 'NOTES_';
    if nZaMesFakt < 10 then begin
      cFldSm := cFldSm + '0';
      cFldNrPkt := cFldNrPkt + '0';
      cFldNotes := cFldNotes + '0';
    end;
    cFldSm := cFldSm + IntToStr(nZaMesFakt);
    cFldNrPkt := cFldNrPkt + IntToStr(nZaMesFakt);
    cFldNotes := cFldNotes + IntToStr(nZaMesFakt);
    with qry_Pkt2 do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select s.NR, s.KdUsr, s.WYear, s.KdObj, s.TabN, s.' + cFldSm +
              ' SMM, s.' + cFldNrPkt + ' NrPkt, s.' + cFldNotes + ' Notes, ' +
              ' u.Fam, u.Ima, u.Otch, s.SpecPS from z_PredSps s ' +
              ' Left Outer Join Z_Upi u on u.TabN = s.TabN ' +
              ' where s.WYear = :nWYear and not s.' + cFldSm + ' is NULL ' +
              ' order by u.Fam, u.Ima, u.Otch, s.TabN, s.KdObj');
      ParamByName('nWYear').AsInteger := nWYear;
      if bFlagDbg then
        SQL.SaveToFile(cDirTemp + 'PredSps.sql');
      Open;
      LabelCntRec2.Caption := 'Записей: ' + IntToStr(RecordCount);
      LabelCntSelRec.Caption := 'Выделено: ' + IntToStr(LbxF8.Items.Count);
      sBtnSvPkt.Enabled := LbxF8.Items.Count > 0;
    end;
    LbxF8.Clear;
    Label1_Msg.Caption := 'Выбраны данные с НеНулевыми суммами за ' +
                          MesRus(nZaMesFakt) + ' ' + IntToStr(nWYear) +
                          ' г. для подключения пакета к отклонениям текущего ' +
                          'месяца.';
    Label2_Msg.Caption := 'В поле "ЗаМесГод" для всех записей пакета ' +
                          'будет введено значение "' +
                                        Copy(DateToStr(dZaMGPkt), 4, 7) + '".';
    Label3_Msg.Caption := 'Все записи пакета будут отнесены на счёт "' +
                                                                    cSpZ +'".';
    PageControl.ActivePage := ts2;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01CrePktNdbClick(Sender: TObject);
//var dDtBeg, dDtEnd, dDtBY, dDtEY : TDateTime;
begin
  dDtBYN := EncodeDate(n_SvWYear, 1, 1);
  dDtEYN := EncodeDate(n_SvWYear, 12, 31);
  if DlgSpecNdbRec(n_SvWYear, dDtBegN, dDtEndN) {z_DlgSNR} then begin
    //ShowMessage('Пришли даты: ' + DateToStr(dDtBegN) + ' и ' + DateToStr(dDtEndN));
    Label14.Caption := 'Из списка выбраны все сотрудники для подключения ' +
                       'пакета "СпецЗаписей" в таблицу "Надбавки" за ' +
                       IntToStr(n_SvWYear) + ' год.';
    Label15.Caption := 'В поле "Дата начала" для всех записей пакета будет ' +
                       'введено значение "' + DateToStr(dDtBegN) + '".';
    if dDtEndN <> 0 then
      Label20.Caption := 'В поле "Дата оконч." для всех записей пакета будет ' +
                         'введено значение "' + DateToStr(dDtEndN) + '".'
    else
      Label20.Caption := 'В поле "Дата оконч." для всех записей пакета будет ' +
                         'введено пустое значение.';
    with qry_Pkt3 do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select distinct s.KdUsr, s.WYear, s.TabN, u.Fam, u.Ima, u.Otch '+
              ' from Z_PredSps s Left Outer Join Z_Upi u on u.TabN = s.TabN ' +
              ' where s.WYear = :nSvWYear');
      if not bFlagDbg then
        SQL.Add(' and KdUsr = :nKdUsr');
      SQL.Add('order by u.Fam, u.Ima, u.Otch, s.TabN');
      ParamByName('nSvWYear').AsInteger := n_SvWYear;
      if not bFlagDbg then
        ParamByName('nKdUsr').AsInteger := n_KdUsr;
      Open;
      LabelCntRec3.Caption := 'Записей: ' + IntToStr(RecordCount);
      LabelCntSelRec3.Caption := '';
    end;
    with qry_Ndb3 do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      DataSource := dsrc_Pkt3;
      SQL.Add('Select * from Z_Nadb where TabN = :TabN and VidN = "1005" and ' +
              ' SumProc = 0 and SpsRsch = 4 and ' +
              ' Dt_Beg >= :dDtBYN and Dt_Beg <= :dDtEYN and ' +
              ' (Dt_End is NULL or Dt_End <= :dDtEYN) ' +
              ' order by Dt_Beg, Dt_End, KdObj');
      ParamByName('dDtBYN').AsDateTime := dDtBYN;
      ParamByName('dDtEYN').AsDateTime := dDtEYN;
      Open;
    end;
    PageControl.ActivePage := ts3;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnGoBackClick(Sender: TObject);
begin
  qry_Pkt2.Close;
  PageControl.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.dbgrSps1DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString; n : SmallInt; cSubstr : ShortString;
begin
  with dbgrSps1.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if ((not qrySps1NrPkt_01.IsNull) and ((cFldNm = 'SM_01') or
                                           (cFldNm = 'NOTES_01'))) or
         ((not qrySps1NrPkt_02.IsNull) and ((cFldNm = 'SM_02') or
                                           (cFldNm = 'NOTES_02'))) or
         ((not qrySps1NrPkt_03.IsNull) and ((cFldNm = 'SM_03') or
                                           (cFldNm = 'NOTES_03'))) or
         ((not qrySps1NrPkt_04.IsNull) and ((cFldNm = 'SM_04') or
                                           (cFldNm = 'NOTES_04'))) or
         ((not qrySps1NrPkt_05.IsNull) and ((cFldNm = 'SM_05') or
                                           (cFldNm = 'NOTES_05'))) or
         ((not qrySps1NrPkt_06.IsNull) and ((cFldNm = 'SM_06') or
                                           (cFldNm = 'NOTES_06'))) or
         ((not qrySps1NrPkt_07.IsNull) and ((cFldNm = 'SM_07') or
                                           (cFldNm = 'NOTES_07'))) or
         ((not qrySps1NrPkt_08.IsNull) and ((cFldNm = 'SM_08') or
                                           (cFldNm = 'NOTES_08'))) or
         ((not qrySps1NrPkt_09.IsNull) and ((cFldNm = 'SM_09') or
                                           (cFldNm = 'NOTES_09'))) or
         ((not qrySps1NrPkt_10.IsNull) and ((cFldNm = 'SM_10') or
                                           (cFldNm = 'NOTES_10'))) or
         ((not qrySps1NrPkt_11.IsNull) and ((cFldNm = 'SM_11') or
                                           (cFldNm = 'NOTES_11'))) or
         ((not qrySps1NrPkt_12.IsNull) and ((cFldNm = 'SM_12') or
                                           (cFldNm = 'NOTES_12'))) then begin
        Font.Color := clMaroon;
        Font.Style := [];
      end;
      if (cFldNm = 'WYEAR') then
        Brush.Color := clInfoBk;
    end;
    if nSpsSortCase = 2 {по Фамилии И.О.} then begin
      if (edFamLoc.Text <> '') and ((cFldNm = 'FAMIO') or (cFldNm = 'TABN') or
                    (cFldNm = 'KDUSR') or  (cFldNm = 'KDOBJ')) then begin
        n := Length(edFamLoc.Text);
        cSubstr := AnsiUpperCase(edFamLoc.Text);
        if AnsiUpperCase(Copy(qrySps1.FieldByName('FAM').AsString, 1, n)) <>
                                                           cSubstr then
          Font.Color := clWindowText
        else
          Font.Color := clBlue;
      end;
    end;
  end;
  dbgrSps1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.dbgrPkt0DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrPkt0.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if qryPkt0DtProc.AsDateTime < dDtProc then begin
        Font.Color := clGray;
        Font.Style := [];
      end;
      if (cFldNm = 'WYEAR') then
        Brush.Color := clInfoBk;
      if qryPkt0TipPkt.AsString = 'NDB' then
        Brush.Color := clBtnFace;
    end;
  end;
  dbgrPkt0.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.dbgr_Pkt2DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgr_Pkt2.Canvas do begin
    if not (gdFocused in State) then begin
      if not qry_Pkt2NrPkt.IsNull then begin
        Font.Color := clGray;
        Font.Style := [];
      end;
    end;
    if LbxF8.Items.IndexOf(qry_Pkt2NR.AsString) >= 0 then
      Font.Color := clRed;
  end;
  dbgr_Pkt2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.dbgr_Pkt3DrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgr_Pkt3.Canvas do begin
{
    if not (gdFocused in State) then begin
      if not qry_PktNrPkt.IsNull then begin
        Font.Color := clGray;
        Font.Style := [];
      end;
    end;
    }
    if LbxF8_3.Items.IndexOf(qry_Pkt3TabN.AsString) >= 0 then
      Font.Color := clRed;
  end;
  dbgr_Pkt3.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnF8Click(Sender: TObject);
var i : SmallInt;
begin
  if (not qry_Pkt2NrPkt.IsNull) or (qry_Pkt2Smm.IsNull) or
                                     (qry_Pkt2Smm.AsFloat <= 0) then begin
    if not qry_Pkt2.Eof then
      qry_Pkt2.Next
    else
      Exit; end
  else if qry_Pkt2Smm.AsFloat > 0 then begin
    i := LbxF8.Items.IndexOf(qry_Pkt2NR.AsString);
    if i < 0 then
      LbxF8.Items.Add(qry_Pkt2NR.AsString)
    else
      LbxF8.Items.Delete(i);
    if not qry_Pkt2.Eof then
      qry_Pkt2.Next
    else
      dbgr_Pkt2.Refresh;
    LabelCntSelRec.Caption := 'Выделено: ' + IntToStr(LbxF8.Items.Count);
    sBtnSvPkt.Enabled := LbxF8.Items.Count > 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnF8_3Click(Sender: TObject);
var i : SmallInt;
begin
  i := LbxF8_3.Items.IndexOf(qry_Pkt3TabN.AsString);
  if i < 0 then
    LbxF8_3.Items.Add(qry_Pkt3TabN.AsString)
  else
    LbxF8_3.Items.Delete(i);
  if not qry_Pkt3.Eof then
    qry_Pkt3.Next
  else
    dbgr_Pkt3.Refresh;
  LabelCntSelRec3.Caption := 'Выделено: ' + IntToStr(LbxF8_3.Items.Count);
  sBtnSvPkt_3.Enabled := LbxF8_3.Items.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.PanelRightResize(Sender: TObject);
begin
  PanelMsg.Top := Round((PanelRight.Height - PanelMsg.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где  нужно,  пользуйтесь  контекстными  меню');
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnSelAllClick(Sender: TObject);
var nSvNR : integer;
begin
  with qry_Pkt2 do begin
    nSvNR := qry_Pkt2NR.AsInteger;
    DisableControls;
    LbxF8.Clear;
    First;
    while not Eof do begin
      if qry_Pkt2NrPkt.IsNull and (qry_Pkt2Smm.AsFloat > 0) then
        LbxF8.Items.Add(qry_Pkt2NR.AsString);
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  LabelCntSelRec.Caption := 'Выделено: ' + IntToStr(LbxF8.Items.Count);
  sBtnSvPkt.Enabled := LbxF8.Items.Count > 0;
  dbgr_Pkt2.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnSelAll_3Click(Sender: TObject);
var nSvTabN : integer;
begin
  with qry_Pkt3 do begin
    nSvTabN := qry_Pkt3TabN.AsInteger;
    DisableControls;
    LbxF8_3.Clear;
    First;
    while not Eof do begin
      LbxF8_3.Items.Add(qry_Pkt3TabN.AsString);
      Next;
    end;
    Locate('TabN', nSvTabN, []);
    EnableControls;
  end;
  LabelCntSelRec3.Caption := 'Выделено: ' + IntToStr(LbxF8_3.Items.Count);
  sBtnSvPkt_3.Enabled := LbxF8_3.Items.Count > 0;
  dbgr_Pkt3.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnUnSelAllClick(Sender: TObject);
begin
  LbxF8.Clear;
  dbgr_Pkt2.Refresh;
  LabelCntSelRec.Caption := 'Выделено: ' + IntToStr(LbxF8.Items.Count);
  sBtnSvPkt.Enabled := LbxF8.Items.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnUnSelAll_3Click(Sender: TObject);
begin
  LbxF8_3.Clear;
  dbgr_Pkt3.Refresh;
  LabelCntSelRec3.Caption := 'Выделено: ' + IntToStr(LbxF8_3.Items.Count);
  sBtnSvPkt_3.Enabled := LbxF8_3.Items.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.dbgr_Pkt2KeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (qry_Pkt2.RecordCount > 0) and (Key = VK_F8) and (Shift = []) then
    sBtnF8.Click;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01DelRecClick(Sender: TObject);
var bCanDelete : boolean; i : SmallInt; cFldNm : ShortString;
begin
  bCanDelete := true;
  for i := 0 to qrySps1.FieldCount-1 do begin
    cFldNm := UpperCase(qrySps1.Fields[i].FieldName);
    if (Copy(cFldNm,1,6) = 'NRPKT_') and
               not qrySps1.FieldByName(cFldNm).IsNull then begin
      bCanDelete := false;
      Break;
    end
  end;
  if not bCanDelete then
    MessageDlg('Нельзя удалять эту запись - в ней' + #13#10 +
               'есть подключённые суммы (бледные)',
               mtError, [mbOk], 0)
  else if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                           mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    qrySps1.Delete;
    Form_Dm.DbMain.ApplyUpdates([qrySps1]);
    LabelCntRec2.Caption := 'Записей: ' + IntToStr(qrySps1.RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qrySps1NewRecord(DataSet: TDataSet);
begin
  qrySps1KdUsr.AsInteger := n_KdUsr;
  qrySps1WYear.AsInteger := n_SvWYear; // 2013;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.Splitter1Moved(Sender: TObject);
begin
  dbNavOtklNdb.Left := dbgrPkt0.Width + 5;
  LabelCntOtklRec.Left := dbNavOtklNdb.Left + 90;
  LabelSortOtkl.Left := dbNavOtklNdb.Left + 190;
  LabelSortOtklNdbMsg.Left := dbNavOtklNdb.Left + 190;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.FormResize(Sender: TObject);
begin
  dbNavOtklNdb.Left := dbgrPkt0.Width + 5;
  LabelCntOtklRec.Left := dbNavOtklNdb.Left + 90;
  LabelSortOtkl.Left := dbNavOtklNdb.Left + 190;
  LabelSortOtklNdbMsg.Left := dbNavOtklNdb.Left + 190;
  PanelTts.Left := Round((Width - PanelTts.Width) / 2);
  PanelTts.Top  := Round((Height - PanelTts.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop00Popup(Sender: TObject);
begin
  pop00DelPkt.Visible := false;
  pop00Sort.Visible := false;
  pop00DelRecInOtkl.Visible := false;
  pop00Tts.Visible := false;
  if pop00.PopupComponent = dbgrPkt0 then begin
    pop00Tts.Visible := true;
    pop00Tts.Enabled := (qryPkt0TipPkt.AsString = 'CMN') and
                           cdsOtkl0.Active and (cdsOtkl0.RecordCount > 0);
    pop00DelPkt.Visible := true;
    pop00DelPkt.Enabled := qryPkt0.Active and (qryPkt0.RecordCount > 0) and
                                  (qryPkt0DtProc.AsDateTime >= dDtProc); end
  else if pop00.PopupComponent = dbgrOtkl0 then begin
    pop00Sort.Visible := true;
    pop00Sort.Enabled := cdsOtkl0.Active and (cdsOtkl0.RecordCount > 0);
    pop00DelRecInOtkl.Visible :=  true;
    pop00DelRecInOtkl.Enabled := cdsOtkl0.Active and
                                     (cdsOtkl0.RecordCount > 0) and
                                     (cdsOtkl0DtProc.AsDateTime = dCtrlDate );
    pop00Tts.Visible := true;
    pop00Tts.Enabled := cdsOtkl0.Active and (cdsOtkl0.RecordCount > 0); end
  else if pop00.PopupComponent = dbgrNdb0 then begin
    pop00Sort.Visible := true;
    pop00Sort.Enabled := qryNdb0.Active and (qryNdb0.RecordCount > 0);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop00DelRecInOtklClick(Sender: TObject);
begin
  if MessageDlg('Удалить текущую запись из пакета и из таблицы "Отклонения"?:',
                            mtConfirmation, [mbNo, mbYes], 0) = mrYes then
    DelRecInOtkl;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.DelRecInOtkl;
var nNR, nSpecPS : integer; nNrPkt : SmallInt; nY, nM, nD : word;
    dZaMGFkt : TDateTime; cFldNrPkt : ShortString;
begin
  nNR      := cdsOtkl0NR.AsInteger;
  nSpecPS  := cdsOtkl0SpecPS.AsInteger;
  nNrPkt   := qryPkt0NrPkt.AsInteger;
  dZaMGFkt := qryPkt0ZaMgFkt.AsDateTime;
  DecodeDate(dZaMgFkt, nY, nM, nD);
  cFldNrPkt := 'NrPkt_';
  if nM < 10 then
    cFldNrPkt := cFldNrPkt + '0';
  cFldNrPkt := cFldNrPkt + IntToStr(nM);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from Z_Otkl where NR = :nNR');
    ParamByName('nNR').AsInteger := nNR;
    ExecSQL;
    SQL.Clear;
    SQL.Add('Update Z_PredSps set ' + cFldNrPkt + ' = NULL ' +
            ' where ' + cFldNrPkt + ' = :nNrPkt and SpecPS = :nSpecPS');
    ParamByName('nNrPkt').AsInteger  := nNrPkt;
    ParamByName('nSpecPS').AsInteger := nSpecPS;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  cdsOtkl0.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop00DelPktClick(Sender: TObject);
var nNrPkt, nWYear : SmallInt; dDtPkt, dDtPrc, dZaMG : TDateTime;
    cTipPkt, cFldNrPkt : ShortString; nY, nM, nD : word; nSvNR : integer;
begin
  cTipPkt := qryPkt0TipPkt.AsString;
  if cTipPkt = 'NDB' then begin
    nNrPkt := qryPkt0NrPkt.AsInteger;
    dDtPkt := qryPkt0DtPkt.AsDateTime;
//    dDtPrc := qryPkt0DtProc.AsDateTime;
    if MessageDlg('Пакет и все "СпецЗаписи" в надбавках, введённые' + #13#10 +
                  'этим пакетом, удаляются безвозвратно. Согласны?:',
                                 mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;  // Удаляю записи из надбавок
        DataBaseName := CESMAIN;
        SQL.Add('Delete from Z_Nadb where NrPkt = :nNrPkt and ' +
                ' DtVPkt = :dDtPkt and VidN in ("1005","1006","1008") and ' +
                ' SpsRsch = 4 and SumProc = 0');
        ParamByName('nNrPkt').AsInteger  := nNrPkt;
        ParamByName('dDtPkt').AsDateTime := dDtPkt;
        ExecSQL;
        SQL.Clear;  // Удаляю запись из Z_PredPkt
        SQL.Add('Delete from z_PredPkt where ' +
                ' NrPkt = :nNrPkt and DtPkt = :dDtPkt');
        ParamByName('nNrPkt').AsInteger  := nNrPkt;
        ParamByName('dDtPkt').AsDateTime := dDtPkt;
        ExecSQL;
        SQL.Clear;  // Убираю номера удаленного пакета из записей в Z_PredSps
        DataBaseName := '';
      end;
      OpenQryPkt0;
    end; end
  else if cTipPkt = 'CMN' then begin
    if MessageDlg('Пакет и все записи в отклонениях удаляются безвозвратно. ' +
                  'Согласны?:', mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      nNrPkt := qryPkt0NrPkt.AsInteger;
      nWYear := qryPkt0WYear.AsInteger;
      dDtPkt := qryPkt0DtPkt.AsDateTime;
      dDtPrc := qryPkt0DtProc.AsDateTime;
      dZaMG  := qryPkt0ZaMesGod.AsDateTime;
      DecodeDate(qryPkt0ZaMGFkt.AsDateTime, nY, nM, nD);
      cFldNrPkt := 'NrPkt_';
      if nM < 10 then
        cFldNrPkt := cFldNrPkt + '0';
      cFldNrPkt := cFldNrPkt + IntToStr(nM);
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;  // Удаляю записи из отклонений
        DataBaseName := CESMAIN;
        SQL.Add('Delete from z_Otkl where DtProc = :dDtPrc and ' +
                ' VidN = "1005" and ZaMesGod = :dZaMG and ' +
                ' NrVdPV = :nNrPkt and DtVdPV = :dDtPkt');
        ParamByName('dDtPrc').AsDateTime := dDtPrc;
        ParamByName('dDtPkt').AsDateTime := dDtPkt;
        ParamByName('dZaMG').AsDateTime  := dZaMG;
        ParamByName('nNrPkt').AsInteger  := nNrPkt;
        ExecSQL;
        SQL.Clear;  // Удаляю запись из Z_PredPkt
        SQL.Add('Delete from z_PredPkt where WYear = :nWYear and ' +
                ' NrPkt = :nNrPkt and DtPkt = :dDtPkt');
        ParamByName('nWYear').AsInteger  := nWYear;
        ParamByName('nNrPkt').AsInteger  := nNrPkt;
        ParamByName('dDtPkt').AsDateTime := dDtPkt;
        ExecSQL;
        SQL.Clear;  // Убираю номера удаленного пакета из записей в Z_PredSps
        SQL.Add('Update z_PredSps set ' + cFldNrPkt + ' = NULL ' +
                ' where WYear = :nWYear and ' + cFldNrPkt + ' = :nNrPkt');
        ParamByName('nWYear').AsInteger  := nWYear;
        ParamByName('nNrPkt').AsInteger  := nNrPkt;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      OpenQryPkt0;
      if qrySps1.Active and (qrySps1WYear.AsInteger = nWYear) then
                                               with qrySps1 do begin
        nSvNR := qrySps1NR.AsInteger;
        Close;
        Open;
        Locate('NR', nSvNR, []);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop00SortByTabNClick(Sender: TObject);
begin
  if not pop00SortByTabN.Checked then begin
    nOtklNdbSortCase := 1;
    SetOtklNdbSortCase;
    if PgCtrl_0.ActivePage = ts0_Ndb then
      OpenQryNdb0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop00SortByFIOClick(Sender: TObject);
begin
  if not pop00SortByFIO.Checked then begin
    nOtklNdbSortCase := 2;
    SetOtklNdbSortCase;
    if PgCtrl_0.ActivePage = ts0_Ndb then
      OpenQryNdb0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop00SortByObjTabNClick(Sender: TObject);
begin
  if not pop00SortByObjTabN.Checked then begin
    nOtklNdbSortCase := 3;
    SetOtklNdbSortCase;
    if PgCtrl_0.ActivePage = ts0_Ndb then
      OpenQryNdb0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop00SortByObjFIOClick(Sender: TObject);
begin
  if not pop00SortByObjFIO.Checked then begin
    nOtklNdbSortCase := 4;
    SetOtklNdbSortCase;
    if PgCtrl_0.ActivePage = ts0_Ndb then
      OpenQryNdb0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.SetOtklNdbSortCase;
var nSvNR : integer;
begin
  nSvNR := 0;
  with cdsOtkl0 do begin
    if Active then
      nSvNR := cdsOtkl0NR.AsInteger;
    if nOtklNdbSortCase = 1 then begin
      IndexName := 'OtklTabN';
      LabelSortOtklNdbMsg.Caption := 'по Таб. н-ру'; end
    else if nOtklNdbSortCase = 2 then begin
      IndexName := 'OtklFIO';
      LabelSortOtklNdbMsg.Caption := 'по Фамилии И.О.'; end
    else if nOtklNdbSortCase = 3 then begin
      IndexName := 'OtklObjTabN';
      LabelSortOtklNdbMsg.Caption := 'Подразделение, Таб. н-р'; end
    else {if nOtklNdbSortCase = 4 then} begin
      IndexName := 'OtklObjFIO';
      LabelSortOtklNdbMsg.Caption := 'Подразделение, Фамилия И.О.';
    end;
    if (nSvNr <> 0) and (cdsOtkl0NR.AsInteger <> nSvNR) then
      Locate('NR', nSvNR, []);
  end;

  pop00SortByTabN.Checked    := nOtklNdbSortCase = 1;
  pop00SortByFIO.Checked     := nOtklNdbSortCase = 2;
  pop00SortByObjTabN.Checked := nOtklNdbSortCase = 3;
  pop00SortByObjFIO.Checked  := nOtklNdbSortCase = 4;
end;
//------------------------------------------------------------------------------
function TFormPredSps.GetNewNrPkt1005: integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(Z_PredPkt_NrPkt, 1) NewNR from rdb$database');
    Open;
    Result := FieldByName('NewNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnSvPktClick(Sender: TObject);
var cDbgSQL : ShortString; nSvNR : integer;
    nY, nM, nD :word; dDtPrc, dDtBegGoda, dDtEndGoda : TDateTime;
begin
  sBtnSvPkt.Enabled := false;
  nNewPktNR := GetNewNrPkt1005;
  dNewPktDt := Date;
  dDtPrc := dDtProc;
  DecodeDate(dDtPrc, nY, nM, nD);
  dDtBegGoda := EncodeDate(nY, 1, 1);
  dDtEndGoda := EncodeDate(nY, 12, 31);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, PdN, KdSpZ, Notes, PrPV, Kto, DtVdPv, ' +
            ' NrVdPv, MyNotes, SpecPS) values (1, :dDtProc, :dZaMG, :nTabN, ' +
            ' :cVidN, :nSumma, :nKdObj, :nKdKatP, 1, :nKdSpZ, ' +
            ' :cNotes, 1, :nKto, :dDtVdPv, :nNrVdPv, :cMyNotes, :nSpecPS)');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ParamByName('dZaMG').AsDateTime   := dZaMGPkt;
    ParamByName('cVidN').AsString     := '1005';
    ParamByName('nKdKatP').AsInteger  := 13;
    ParamByName('nKto').AsInteger     := n_KdUsr;
    ParamByName('nKdSpZ').AsInteger   := nKdSpZ;
    ParamByName('dDtVdPv').AsDateTime := dNewPktDt;
    ParamByName('nNrVdPv').AsInteger  := nNewPktNR;
    ParamByName('cMyNotes').AsString  := 'за ' +
                                  DateToStr(EncodeDate(nWYear, nZaMesFakt, 1));
    {  Нижележащие параметры заполняются в AddRecInOtkl;
    ParamByName('nTabN').AsInteger   := qry_PktTabN.AsInteger;
    ParamByName('nSumma').AsFloat    := qry_PktSmm.AsFloat;
    ParamByName('nKdObj').AsInteger  := qry_PktKdObj.AsInteger;
    ParamByName('cNotes').AsString   := qry_PktNotes.AsString;
    ParamByName('nSpecPS').AsInteger :=
    }
  end;
  with qry_Pkt2 do begin
    First;
    while not Eof do begin
      if LbxF8.Items.IndexOf(qry_Pkt2NR.AsString) >= 0 then
        AddRecInOtkl;
      Next;
    end;
  end;
  with qryTmp {освободился} do begin          // в Z_PredSps проставить НрПкт в
    cDbgSQL := 'Update Z_PredSps set ' + cFldNrPkt +     // подключаемые записи
                                             ' = :nNrPkt where NR = :nNR';
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add(cDbgSQL);
  end;
  with qry_Pkt2 do begin
    First;
    while not Eof do begin
      if LbxF8.Items.IndexOf(qry_Pkt2NR.AsString) >= 0 then
        UpdPredSps;
      Next;
    end;
  end;
  with qryTmp {освободился} do begin // если надо, добавляю "СпецЗапись" в
    if Active then Close;            // Z_Nadb (вид 1005 с нулевой суммой)
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_Nadb (KdSps, SpsRsch, TabN, VidN, SumProc, ' +
               ' SP, Dt_Beg, Dt_End, KdObj, KdKatP, KdSpZ, NrPkt, DtVPkt, ' +
               ' Spec_NR) values (:nKdSps, :nSpsRsch, :nTabN, :cVidN, ' +
               ' :nSumProc, :cSP, :dDt_Beg, :dDt_End, :nKdObj, :nKdKatP, ' +
               ' :nKdSpZ, :nNrPkt, :dDtVPkt, :nSpec_NR)');
    ParamByName('nKdSps').AsInteger   := 1;
    ParamByName('nSpsRsch').AsInteger := 4;
    ParamByName('cVidN').AsString     := '1005';
    ParamByName('nSumProc').AsFloat   := 0;
    ParamByName('cSP').AsString       := 'р';
    ParamByName('nNrPkt').AsInteger   := nNewPktNR;;
    ParamByName('dDtVPkt').AsDateTime := dNewPktDt;
    {
    ParamByName('nTabN'),AsInteger    :=
    ParamByName('dDt_Beg'.AsDatetime  :=
    ParamByName('dDt_End'.AsDatetime  :=
    ParamByName('nKdObj').AsInteger   :=
    ParamByName('nKdKatP').AsInteger  :=
    ParamByName('nKdSpZ').AsInteger   :=
    ParamByName('nSpec_NR').AsInteger :=
    }
  end;
  with qrySpecNdb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;        // проверять, нет ли в Z_Nadb "СпецЗаписи"
    SQL.Add('Select * from Z_Nadb where TabN = :nTabN and ' +
            ' Dt_Beg >= :dDtBeg and (Dt_End is NULL or Dt_End <= :dDtEnd) and '+
            ' VidN in ("1005","1006","1008")');
    ParamByName('dDtBeg').AsDateTime := dDtBegGoda;
    ParamByName('dDtEnd').AsDateTime := dDtEndGoda;
  end;
  with qry_Pkt2 do begin
    First;
    while not Eof do begin
      if (LbxF8.Items.IndexOf(qry_Pkt2NR.AsString) >= 0) and   /////////
                      not IsSpecNdbRec(qry_Pkt2TabN.AsInteger, dDtProc) then
        AddFoxNdbRec(qry_Pkt2TabN.AsInteger, dDtProc, dDtEndGoda);  // добавляю
      Next;                                                     // "СпецЗапись"
    end;
  end;

  LbxF8.Clear;
  with qryTmp {освободился} do begin     // добавляю запись в Z_PredPkt
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_PredPkt (KdUsr, NrPkt, TipPkt, WYear, DtPkt, ' +
            ' DtProc, ZaMesGod, ZaMGFkt, Notes) values (:nKdUsr, :nNrPkt, ' +
            ' "CMN", :nWYear, :dDtPkt, :dDtProc, :dZaMG, :dZaMGFkt, :cNotes)');
    ParamByName('nKdUsr').AsInteger    := n_KdUsr;
    ParamByName('nNrPkt').AsInteger    := nNewPktNR;
    ParamByName('nWYear').AsInteger    := nWYear;
    ParamByName('dDtPkt').AsDateTime   := dNewPktDt;
    ParamByName('dDtProc').AsDateTime  := dDtProc;
    ParamByName('dZaMG').AsDateTime    := dZaMGPkt;
    ParamByName('dZaMGFkt').AsDateTime := EncodeDate(nWYear, nZaMesFakt, 1);
    ParamByName('cNotes').AsString  := 'за ' +
                                  DateToStr(EncodeDate(nWYear, nZaMesFakt, 1));
    ExecSQL;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryPkt0 do begin
    Close;
    Open;
    Locate('NrPkt', nNewPktNR, []);
  end;
  with qrySps1 do begin
    nSvNR := 0;
    if Active then
      nSvNR := qrySps1NR.AsInteger;
    Close;
    Open;
    Locate('NR', nSvNR, []);
  end;
  PageControl.ActivePage := ts0;
  qry_Pkt2.Close;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.AddRecInOtkl;
begin
  with qryTmp do begin
    ParamByName('nTabN').AsInteger   := qry_Pkt2TabN.AsInteger;
    ParamByName('nSumma').AsFloat    := qry_Pkt2Smm.AsFloat;
    ParamByName('nKdObj').AsInteger  := qry_Pkt2KdObj.AsInteger;
    ParamByName('cNotes').AsString   := qry_Pkt2Notes.AsString;
    ParamByName('nSpecPS').AsInteger := qry_Pkt2SpecPS.AsInteger;
    ExecSQL;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qryPkt0AfterScroll(DataSet: TDataSet);
begin
  PanelTts.Visible := false;
  SetPgCtrl_0Vid(qryPkt0TipPkt.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.SetPgCtrl_0Vid(cTipPkt: ShortString);
begin
  if cTipPkt = 'CMN' then begin
    OpenCdsOtkl0;
    PgCtrl_0.ActivePage := ts0_Otkl;
    dbNavOtklNdb.DataSource := dsrcOtkl0; end
  else begin
    OpenQryNdb0;
    dbNavOtklNdb.DataSource := dsrcNdb0; 
    PgCtrl_0.ActivePage := ts0_Ndb;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.UpdPredSps;
begin
  with qryTmp do begin
    ParamByName('nNrPkt').AsInteger := nNewPktNR;
    ParamByName('nNR').AsInteger    := qry_Pkt2NR.AsInteger;
    ExecSQL;
  end;
end;
//------------------------------------------------------------------------------
function TFormPredSps.IsSpecNdbRec(nTabN: integer; dDtPrc: TDateTime): boolean;
begin
  Result := false;
  with qrySpecNdb do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    while not Eof do begin
      if (FieldByName('Dt_Beg').AsDateTime <= dDtPrc) and
             ((FieldByName('Dt_End').IsNull) or
                       (FieldByName('Dt_End').AsDateTime >= dDtPrc)) then begin
        Result := true;
        Break;
      end;
      Next;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.AddFoxNdbRec(nTabN: integer; dDtPrc, dDtEnd: TDateTime);
begin
  with qryTmp do begin
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('dDt_Beg').AsDatetime := dDtPrc;
    ParamByName('dDt_End').AsDatetime := dDtEnd;
    ParamByName('nKdObj').AsInteger   := qry_Pkt2KdObj.AsInteger;
    ParamByName('nKdKatP').AsInteger  := 13;
    ParamByName('nKdSpZ').AsInteger   := nKdSpZ; //1209;
    ParamByName('nSpec_NR').AsInteger := DmMain.NewSpec_NR;
    ExecSQL;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnWYearClick(Sender: TObject);
var nSvY, nMaxGod : SmallInt;
begin
  nSvY := n_SvWYear;
  with cdsYear do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select WYear, Count(*) CNT from z_PredSps group by WYear');
    Open;
    nMaxGod := 2013;
    while not Eof do begin
      if qryTmp.FieldByName('WYear').AsInteger > nMaxGod then
        nMaxGod := qryTmp.FieldByName('WYear').AsInteger;
      cdsYear.AppendRecord([qryTmp.FieldByName('WYear').AsInteger,
                           '   ' + qryTmp.FieldByName('WYear').AsString,
                                   qryTmp.FieldByName('Cnt').AsInteger]);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  cdsYear.AppendRecord([9999, 'Создать новый сисок', 0]);
  if bFlagDbg then
    cdsYear.SaveToFile(cDirTemp + 'Years.cds');
  if GetPredSps(cdsYear, nMaxGod, nSvY) {z_GtPrSp} then begin
    if nSvY <> n_SvWYear then begin
      n_SvWYear := nSvY;
      OpenQrySps1;
      OpenQryNdb1;
      sBtnWYear.Caption := IntToStr(n_SvWYear);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnSpsClick(Sender: TObject);
begin
  edFamLoc.Text := '';
  OpenQrySps1;
  OpenQryNdb1;
  PageControl.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnPktClick(Sender: TObject);
begin
  qrySps1.Close;
  qryNdb1.Close;;
  PageControl.ActivePage := ts0;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.edFamLocEnter(Sender: TObject);
begin
  if nSpsSortCase = 2 then
    (Sender as TEdit).Color := clYellow
  else
    (Sender as TEdit).Color := $00D0FDF0;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.edFamLocExit(Sender: TObject);
begin
  if nSpsSortCase = 2 then
    (Sender as TEdit).Color := clWindow
  else
    (Sender as TEdit).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.edFamLocChange(Sender: TObject);
var cFam : ShortString;
begin
  cFam := edFamLoc.Text;
  if (cFam > '') and qrySps1.Active and
        not qrySps1.Locate('Fam', cFam, [loCaseInsensitive,loPartialKey]) then
    dbgrSps1.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnFindTabNClick(Sender: TObject);
var cFFam, cFam, cIma, cOtch : ShortString;
    nTabN : integer; nFCase, nKdObj : SmallInt;
begin
  cFFam := Trim(edFamLoc.Text);
  if Length(cFFam) >= 1 then begin
    if pop01FindCaseByCont.Checked then
      nFCase := 1
    else
      nFCase := 2;
    if GetTabNByFam(cFFam, nFCase, nTabN, nKdObj,         {z_FFam}
                                   cFam, cIma, cOtch) then with qrySps1 do begin
      bNewRecord := true;
      Append;
      qrySps1NR.AsInteger := GetNewSpsNR;
      qrySps1KdUsr.AsInteger := n_KdUsr;
      qrySps1WYear.AsInteger := n_SvWYear;;
      qrySps1KdObj.AsInteger := nKdObj;
      qrySps1TabN.AsInteger  := nTabN;
      Post;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01FindCaseByContClick(Sender: TObject);
begin
  if not pop01FindCaseByCont.Checked then begin
    pop01FindCaseByCont.Checked := true;
    pop01FindCaseByStart.Checked := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01FindCaseByStartClick(Sender: TObject);
begin
  if not pop01FindCaseByStart.Checked then begin
    pop01FindCaseByCont.Checked := false;
    pop01FindCaseByStart.Checked := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qry_Pkt3CalcFields(DataSet: TDataSet);
begin
  qry_Pkt3FamIO.AsString := MyFamIO(qry_Pkt3Fam.AsString, qry_Pkt3Ima.AsString,
                                                      qry_Pkt3Otch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnGoBack_3Click(Sender: TObject);
begin
  qry_Pkt3.Close;
  qry_Ndb3.Close;
  PageControl.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnSvPkt_3Click(Sender: TObject);
var bIsSpecRec, bIsSelected : boolean; d_DtPrc : TDateTime;
    nY, nM, nD : word;
begin  // Создаётся пакет "СпецЗаписей" в надбавки
  DecodeDate(Date, nY, nM, nD);
  d_DtPrc := EncodeDate(nY, nM, 1);
  sBtnSvPkt_3.Enabled := false;
  nNewPktNR := GetNewNrPkt1005;
  dNewPktDt := Date;
  with qryTmp do begin               // если надо, добавляю "СпецЗапись" в
    if Active then Close;            // Z_Nadb (вид 1005 с нулевой суммой)
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_Nadb (KdSps, SpsRsch, TabN, VidN, SumProc, ' +
               ' SP, Dt_Beg, Dt_End, KdObj, KdKatP, KdSpZ, NrPkt, DtVPkt, ' +
               ' Spec_NR) values (:nKdSps, :nSpsRsch, :nTabN, :cVidN, ' +
               ' :nSumProc, :cSP, :dDt_Beg, :dDt_End, :nKdObj, :nKdKatP, ' +
               ' :nKdSpZ, :nNrPkt, :dDtVPkt, :nSpec_NR)');
    ParamByName('nKdSps').AsInteger   := 1;
    ParamByName('nSpsRsch').AsInteger := 4;
    ParamByName('cVidN').AsString     := '1005';
    ParamByName('nSumProc').AsFloat   := 0;
    ParamByName('cSP').AsString       := 'р';
    ParamByName('nNrPkt').AsInteger   := nNewPktNR;;
    ParamByName('dDtVPkt').AsDateTime := dNewPktDt;
  end;
  with qrySpecNdb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;        // проверять, нет ли в Z_Nadb "СпецЗаписи"
    SQL.Add('Select * from Z_Nadb where TabN = :nTabN and ' +
            ' Dt_Beg >= :dDtBeg and (Dt_End is NULL or Dt_End <= :dDtEnd) and '+
            ' VidN in ("1005","1006","1008")');
    ParamByName('dDtBeg').AsDateTime := dDtBYN;
    ParamByName('dDtEnd').AsDateTime := dDtEYN;
  end;
  with qryPere do begin
    SQL.Clear;
    DataBaseName := CESMAIN; // чтобы найти KdObj, KdSpz для "СпецЗаписи"
    SQL.Add('Select * from GetWrkPereOnDate(:nTabN, :dOnDate)');
  end;
  with qry_Pkt3 do begin
    DisableControls;
    First;
    while not Eof do begin
      bIsSelected := LbxF8_3.Items.IndexOf(qry_Pkt3TabN.AsString) >= 0;
      bIsSpecRec := IsSpecNdbRec(qry_Pkt3TabN.AsInteger, dDtBegN);
      if bIsSelected and   /////////
                      not bIsSpecRec then
        AddFoxNdb3Rec(qry_Pkt3TabN.AsInteger, dDtBegN, dDtEndN);  // добавляю
      Next;                                         // "СпецЗапись" в надбавки
    end;
    EnableControls;
  end;
  LbxF8_3.Clear;
  with qryTmp {освободился} do begin     // добавляю запись в Z_PredPkt
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_PredPkt (KdUsr, NrPkt, TipPkt, WYear, DtProc, ' +
            ' DtPkt, Notes) values (:nKdUsr, :nNrPkt, "NDB", ' +
            ' :nWYear, :dDtPrc, :dDtPkt, :cNotes)');
    ParamByName('nKdUsr').AsInteger    := n_KdUsr;
    ParamByName('nNrPkt').AsInteger    := nNewPktNR;
    ParamByName('nWYear').AsInteger    := n_SvWYear;
    ParamByName('dDtPrc').AsDateTime   := d_DtPrc;
    ParamByName('dDtPkt').AsDateTime   := dNewPktDt;
    ParamByName('cNotes').AsString  := 'в Надбавки';
    ExecSQL;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryPkt0 do begin
    Close;
    Open;
    Locate('NrPkt', nNewPktNR, []);
  end;
  PageControl.ActivePage := ts0;
  qry_Pkt3.Close;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.AddFoxNdb3Rec(nTabN: integer; dDtBeg, dDtEnd: TDateTime);
var nKdObj, nKdSpZ : SmallInt;
begin
  GetWrkObjSpZ(nTabN, dDtBeg, nKdObj, nKdSpZ);
  with qryTmp do begin
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('dDt_Beg').AsDatetime := dDtBeg;
    ParamByName('dDt_End').AsDatetime := dDtEnd;
    ParamByName('nKdObj').AsInteger   := nKdObj;
    ParamByName('nKdKatP').AsInteger  := 13;
    ParamByName('nKdSpZ').AsInteger   := nKdSpZ;
    ParamByName('nSpec_NR').AsInteger := DmMain.NewSpec_NR;
    ExecSQL;
  end;
end;
//------------------------------------------------------------------------------
function TFormPredSps.GetWrkObjSpZ(nTabN: integer; dOnDate: TDateTime;
                                         var nKdObj, nKdSpZ: SmallInt): boolean;
begin
  Result := false;
  with qryPere do begin
    Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dOnDate').AsDateTime := dOnDate;
    Open;
    if RecordCount > 0 then begin
      nKdObj := FieldByName('KdObj').AsInteger;
      nKdSpZ := FieldByName('KdSpZ').AsInteger;
      Result := true;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.Panel3RightResize(Sender: TObject);
begin
  PanelMsg_3.Top := Round((Panel3Right.Height - PanelMsg_3.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qryNdb0CalcFields(DataSet: TDataSet);
begin
  qryNdb0FamIO.AsString := MyFamIO(qryNdb0Fam.AsString, qryNdb0Ima.AsString,
                                                      qryNdb0Otch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.dbgr_Pkt3KeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (qry_Pkt3.RecordCount > 0) and (Key = VK_F8) and (Shift = []) then
    sBtnF8_3.Click;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.qrySps1FldSmValidate(Sender: TField);
var cFldNm, cNrPktFldNm : ShortString;
begin
  cFldNm := Sender.FieldName;
  cNrPktFldNm := 'NRPKT_' + Copy(cFldNm, 4, 2);
  if not qrySps1.FieldByName(cNrPktFldNm).IsNull then
    Raise Exception.Create('Нельзя редактировать уже подключённую сумму.' +
                    #13#10 + 'После сообщения нажите клавишу <Esc> для отказа');
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop01Popup(Sender: TObject);
begin
  pop01CrePktOtkl.Enabled := dDtProc = dCtrlDate;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.pop00TtsClick(Sender: TObject);
var nSvNR : integer; nCntRec, nCntSotr : SmallInt; nSmmTts : double;
begin
  nCntRec  := 0;
  nCntSotr := 0;
  nSmmTts  := 0;
  LbxTabN.Clear;
  with cdsOtkl0 do begin
    nSvNR := cdsOtkl0NR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      Inc(nCntRec);
      if LbxTabN.Items.IndexOf(cdsOtkl0TabN.AsString) < 0 then begin
        Inc(nCntSotr);
        LbxTabN.Items.Add(cdsOtkl0TabN.AsString);
      end;
      nSmmTts := nSmmTts + cdsOtkl0Summa.AsFloat;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  LabelTtsCntRec.Caption := IntToStr(nCntRec);
  LabelTtsCntSotr.Caption := IntToStr(nCntSotr);
  LabelTtsSmm.Caption := FloatToStrF(nSmmTts, ffNumber, 16, 2);
  PanelTts.Visible := true;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.SpeedButton1Click(Sender: TObject);
begin
  PanelTts.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormPredSps.sBtnPrtClick(Sender: TObject);
var cTipPkt : ShortString; nNrPkt, nWYear : SmallInt;
    dDtPkt, dDtPrc, dZaMG, dZaMgFkt : TDateTime;
begin
  if qryPkt0.RecordCount > 0 then begin
    cTipPkt := qryPkt0TipPkt.AsString;
    nNrPkt  := qryPkt0NrPkt.AsInteger;
    nWYear  := qryPkt0WYear.AsInteger;
    dDtPkt  := qryPkt0DtPkt.AsDateTime;
    if cTipPkt = 'CMN' then begin
      dDtPrc   := qryPkt0DtProc.AsDateTime;
      dZaMG    := qryPkt0ZaMesGod.AsDateTime;
      dZaMgFkt := qryPkt0ZaMgFkt.AsDateTime;
      F6PrtPredSps_Oktl(nNrPkt, nWYear,                  {z_CmnPrt}
                                dDtPkt, dDtPrc, dZaMG, dZaMgFkt, cdsOtkl0); end
    else if cTipPkt = 'NDB' then
      F6PrtPredSps_Ndb(nNrPkt, nWYear, dDtPkt, qryNdb0); {z_CmnPrt}
  end;
end;

end.
