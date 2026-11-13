unit Z_GtUpi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, DB, Grids, DBGrids, ComCtrls, ExtCtrls, DBTables,
  IniFiles, StdCtrls, Buttons, Menus;

type
  TFormUpi = class(TForm)
    qryUpi: TQuery;
    dsrcUpi: TDataSource;
    PanelTop: TPanel;
    PageControl1: TPageControl;
    tsUpi1: TTabSheet;
    tsUpi2: TTabSheet;
    dbgrUpi1: TDBGrid;
    qryUpiNR: TIntegerField;
    qryUpiTABN: TIntegerField;
    qryUpiFAM: TStringField;
    qryUpiIMA: TStringField;
    qryUpiOTCH: TStringField;
    qryUpiPOL: TStringField;
    qryUpiID: TStringField;
    qryUpiDOB: TDateTimeField;
    qryUpiFamIO: TStringField;
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
    updUpi: TUpdateSQL;
    popUpi: TPopupMenu;
    popUpiHead: TMenuItem;
    popUpiEdt: TMenuItem;
    popUpiAdd: TMenuItem;
    popUpiDel: TMenuItem;
    qryTmp: TQuery;
    bBtnOk: TBitBtn;
    popUpiSep1: TMenuItem;
    popUpiPoisk: TMenuItem;
    popUpiPoiskFam: TMenuItem;
    popUpiPoiskTabN: TMenuItem;
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
    qryUpiPRUV: TSmallintField;
    qryTotsNUKDSPS: TSmallintField;
    popMnuTotsCase: TMenuItem;
    popMnuTotsByZaMesGod: TMenuItem;
    popMnuTotsByDtProc: TMenuItem;
    qryTotsNUMYMG: TDateTimeField;
    popUpiNewPoisk: TMenuItem;
    popMnuNewPoisk: TMenuItem;
    popUpiSep2: TMenuItem;
    popUpiCheckUvoln: TMenuItem;
    qryUpiLASTDTPRM: TDateTimeField;
    qryUpiLASTDTUVL: TDateTimeField;
    qryUpiMYPRUV: TSmallintField;
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
    qryUpiMYNOTES: TStringField;
    qryUpiLSTN: TIntegerField;
    qryUpiLICSCH: TStringField;
    qryUpiSHBNK: TStringField;
    procedure qryUpiCalcFields(DataSet: TDataSet);
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
    procedure qryUpiAfterPost(DataSet: TDataSet);
    procedure qryUpiAfterDelete(DataSet: TDataSet);
    procedure bBtnOkClick(Sender: TObject);
    procedure popUpiSortFamIOClick(Sender: TObject);
    procedure popUpiSortTabNClick(Sender: TObject);
    procedure popUpiPoiskTabNClick(Sender: TObject);
    procedure popUpiPoiskFamClick(Sender: TObject);
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
    procedure qryUpiAfterScroll(DataSet: TDataSet);
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
  private
    { Private declarations }
    nSvTabN : integer;
    b_WasUpdated, bVuborMode, bNoCheckInSps : boolean;
    dDtBegMes, dDtEndMes : TDateTime;// имеется ввиду месяц по dDtProc из Z_Main
    bPrUvEdit : boolean;
    nDbgrNuDetHeight : SmallInt;
    procedure SetDbgrPereColumns;
    procedure SetDbgrNadbColumns;
    procedure GetPereInf(nTabN : integer; dDtBegMes : TDateTime;
                              var nKdObj, nKdKatP : integer);
    function MyIsInSpsMes(dDtProc : TDateTime; nTabN, nKdSps : integer;
                                  mObjList : TStringList) : boolean;
    procedure SetQryUpiSort;
    procedure OpenQryTotsNU;
    procedure SetDbgrTotsNuColumns;
    function MyIsUvolen(nTabN : integer; dDtBeg, dDtEnd : TDateTime) : boolean;
    procedure WritePrmUvInUpi(nTabN : integer);
    procedure SetDbgrUpi1Columns;
    procedure SetDetMode;
    procedure OpenQryNuDet;
  public
    { Public declarations }
  end;

procedure UpiShowModal(nTabN : integer; var bWasUpdated : boolean);
function GetFromUpiToSps(var nTabN, nKdObj, nKdKatP : integer;
                                           var bWasUpdated : boolean) : boolean;
function GetTabN(var nTabN, nKdObj, nKdKatP : integer;
                                 var cFam, cIma, cOtch : string;
                                           var bWasUpdated : boolean) : boolean;

const SECTION = 'Z_GtUpi';

var
  FormUpi: TFormUpi;

implementation

uses A_Const, A_Lib, A_DM, Z_DM, Z_Main, Z_EUpi_2, z_EUpi2, z_UDpDlg,
     Z_EPrmUv, Z_EPere, Z_E2Nadb, Z_EUdrg, Z_VvTn, Z_VvFm, z_VvFmTn, Z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetTabN(var nTabN, nKdObj, nKdKatP : integer;
                            var cFam, cIma, cOtch : string;
                                      var bWasUpdated : boolean) : boolean;
begin
  Result := false;
  FormUpi := TFormUpi.Create(Application);
  with FormUpi do begin
    bVuborMode := true;
    bNoCheckInSps := true;
    bBtnCancel.Caption := 'Отказ';
    Caption := 'Выбор из спр-ка "Сотрудники"';
    cFam := '';
    cIma := '';
    cOtch := '';
    b_WasUpdated := false;
    SetQryUpiSort;
    if nTabN <> 0 then
      qryUpi.Locate('TabN', nTabN, [])
    else if nSvTabN <> 0 then
      qryUpi.Locate('TabN', nSvTabN, []);
    DmMain.qryPrmUv.DataSource := dsrcUpi;
    if not DmMain.qryPrmUv.Active then
      DmMain.qryPrmUv.Open;

    //DmMain.qryPrmUvSps.DataSource := dsrcUpi;
    //if not DmMain.qryPrmUvSps.Active then
      //DmMain.qryPrmUvSps.Open;

    DmMain.qryPere.DataSource := dsrcUpi;
    if not DmMain.qryPere.Active then
      DmMain.qryPere.Open;

    DmMain.qryNadb.DataSource := dsrcUpi;
    if not DmMain.qryNadb.Active then
      DmMain.qryPere.Open;

    DmMain.qryUdrg.DataSource := dsrcUpi;
    if not DmMain.qryUdrg.Active then
      DmMain.qryUdrg.Open;

    dbgrPrmUv.DataSource := DmMain.dsrcPrmUv;
    //dbgrPrmUvSps.DataSource := DmMain.dsrcPrmUvSps;
    dbgrPere.DataSource  := DmMain.dsrcPere;
    dbgrNadb.DataSource  := DmMain.dsrcNadb;
    dbgrUdrg.DataSource  := DmMain.dsrcUdrg;
    if PageControl1.ActivePage = tsUpi1 then
      ActiveControl := dbgrUpi1
    else
      ActiveControl := dbgrUpi2;
    if ShowModal = mrOk then begin
      Result := true;
      nTabN  := qryUpi.FieldByName('TabN').AsInteger;
      cFam  := qryUpi.FieldByName('Fam').AsString;
      cIma  := qryUpi.FieldByName('Ima').AsString;
      cOtch := qryUpi.FieldByName('Otch').AsString;
      GetPereInf(nTabN, dDtProc, nKdObj, nKdKatP);
    end;
    bWasUpdated := b_WasUpdated;
    qryUpi.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetFromUpiToSps(var nTabN, nKdObj, nKdKatP : integer;
                                           var bWasUpdated : boolean) : boolean;
begin
  Result := false;
  FormUpi := TFormUpi.Create(Application);
  with FormUpi do begin
    bVuborMode := true;
    bNoCheckInSps := false;
    bBtnCancel.Caption := 'Отказ';
    Caption := 'Выбор из спр-ка "Сотрудники"';
    b_WasUpdated := false;
    FormZpMain.dbgrPrmUv.DataSource := nil;
    //FormZpMain.dbgrPrmUvSps.DataSource := nil;
    FormZpMain.dbgrPere.DataSource  := nil;
    FormZpMain.dbgrNadb.DataSource  := nil;
    FormZpMain.dbgrUdrg.DataSource  := nil;
    SetQryUpiSort;
    if nTabN <> 0 then
      qryUpi.Locate('TabN', nTabN, [])
    else if nSvTabN <> 0 then
      qryUpi.Locate('TabN', nSvTabN, []);
    DmMain.qryPrmUv.DataSource := dsrcUpi;
    if not DmMain.qryPrmUv.Active then
      DmMain.qryPrmUv.Open;
    DmMain.qryPere.DataSource := dsrcUpi;
    if not DmMain.qryPere.Active then
      DmMain.qryPere.Open;
    DmMain.qryNadb.DataSource := dsrcUpi;
    if not DmMain.qryNadb.Active then
      DmMain.qryPere.Open;
    DmMain.qryUdrg.DataSource := dsrcUpi;
    if not DmMain.qryUdrg.Active then
      DmMain.qryUdrg.Open;
    dbgrPrmUv.DataSource := DmMain.dsrcPrmUv;
    //dbgrPrmUvSps.DataSource := DmMain.dsrcPrmUvSps;
    dbgrPere.DataSource  := DmMain.dsrcPere;
    dbgrNadb.DataSource  := DmMain.dsrcNadb;
    dbgrUdrg.DataSource  := DmMain.dsrcUdrg;
    if PageControl1.ActivePage = tsUpi1 then
      ActiveControl := dbgrUpi1
    else
      ActiveControl := dbgrUpi2;
//    qryTotsNU.DataSource := dsrcUpi;     // Откроется, если выберут
//    qryTotsNU.Open;                      // закладку "Итоги начислений"
    if ShowModal = mrOk then begin
      Result := true;
      nTabN  := qryUpi.FieldByName('TabN').AsInteger;
      GetPereInf(nTabN, dDtProc, nKdObj, nKdKatP);
    end;
    bWasUpdated := b_WasUpdated;
    qryUpi.Close;
    DmMain.qryPrmUv.DataSource := FormZpMain.dsrcSps;
    //DmMain.qryPrmUvSps.DataSource := FormZpMain.dsrcSps;
    DmMain.qryPere.DataSource  := FormZpMain.dsrcSps;
    DmMain.qryNadb.DataSource  := FormZpMain.dsrcSps;
    DmMain.qryUdrg.DataSource  := FormZpMain.dsrcSps;
    FormZpMain.dbgrPrmUv.DataSource := DmMain.dsrcPrmUv;
    //FormZpMain.dbgrPrmUvSps.DataSource := DmMain.dsrcPrmUvSps;
    FormZpMain.dbgrPere.DataSource  := DmMain.dsrcPere;
    FormZpMain.dbgrNadb.DataSource  := DmMain.dsrcNadb;
    FormZpMain.dbgrUdrg.DataSource  := DmMain.dsrcUdrg;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure UpiShowModal(nTabN : integer; var bWasUpdated : boolean);
begin
  FormUpi := TFormUpi.Create(Application);
  with FormUpi do begin
    bVuborMode := false;
    bNoCheckInSps := true;
    bBtnOk.Visible := false;
    Caption := 'Личный состав [Сотрудники]';
    b_WasUpdated := false;
    FormZpMain.dbgrPrmUv.DataSource := nil;
    //FormZpMain.dbgrPrmUvSps.DataSource := nil;
    FormZpMain.dbgrPere.DataSource  := nil;
    FormZpMain.dbgrNadb.DataSource  := nil;
    FormZpMain.dbgrUdrg.DataSource  := nil;
    SetQryUpiSort;
    if nTabN <> 0 then
      qryUpi.Locate('TabN', nTabN, [])
    else if nSvTabN <> 0 then
      qryUpi.Locate('TabN', nSvTabN, []);
    DmMain.qryPrmUv.DataSource := dsrcUpi;
    if not DmMain.qryPrmUv.Active then
      DmMain.qryPrmUv.Open;
    //DmMain.qryPrmUvSps.DataSource := dsrcUpi;
    //if not DmMain.qryPrmUvSps.Active then
      //DmMain.qryPrmUvSps.Open;
    DmMain.qryPere.DataSource := dsrcUpi;
    if not DmMain.qryPere.Active then
      DmMain.qryPere.Open;
    DmMain.qryNadb.DataSource := dsrcUpi;
    if not DmMain.qryNadb.Active then
      DmMain.qryPere.Open;
    DmMain.qryUdrg.DataSource := dsrcUpi;
    if not DmMain.qryUdrg.Active then
      DmMain.qryUdrg.Open;
    dbgrPrmUv.DataSource := DmMain.dsrcPrmUv;
    //dbgrPrmUvSps.DataSource := DmMain.dsrcPrmUvSps;
    dbgrPere.DataSource := DmMain.dsrcPere;
    dbgrNadb.DataSource := DmMain.dsrcNadb;
    dbgrUdrg.DataSource := DmMain.dsrcUdrg;
    if PageControl1.ActivePage = tsUpi1 then
      ActiveControl := dbgrUpi1
    else
      ActiveControl := dbgrUpi2;
//    qryTotsNU.DataSource := dsrcUpi;     // Откроется, если выберут
//    qryTotsNU.Open;                      // закладку "Итоги начислений"
    ShowModal;
    bWasUpdated := b_WasUpdated;
    qryUpi.Close;
    DmMain.qryPrmUv.DataSource := FormZpMain.dsrcSps;
    //DmMain.qryPrmUvSps.DataSource := FormZpMain.dsrcSps;
    DmMain.qryPere.DataSource := FormZpMain.dsrcSps;
    DmMain.qryNadb.DataSource := FormZpMain.dsrcSps;
    DmMain.qryUdrg.DataSource := FormZpMain.dsrcSps;
    FormZpMain.dbgrPrmUv.DataSource := DmMain.dsrcPrmUv;
    //FormZpMain.dbgrPrmUvSps.DataSource := DmMain.dsrcPrmUvSps;
    FormZpMain.dbgrPere.DataSource := DmMain.dsrcPere;
    FormZpMain.dbgrNadb.DataSource := DmMain.dsrcNadb;
    FormZpMain.dbgrUdrg.DataSource := DmMain.dsrcUdrg;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.GetPereInf(nTabN : integer; dDtBegMes : TDateTime;
                              var nKdObj, nKdKatP : integer);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DmMain.qryPere.DatabaseName;
    SQL.Add('Select * from Z_Pere where (TabN = :nTabN) and ' +
            ' (Dt_Beg <= :dDtBegMes) order by Dt_Beg desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegMes').AsDateTime := dDtBegMes;
    Open;
    First;
    while not Eof do begin
      nKdObj  := FieldByName('KdObj').AsInteger;
      nKdKatP := FieldByName('KdKatP').AsInteger;
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
procedure TFormUpi.SetDbgrUpi1Columns;
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
procedure TFormUpi.FormCreate(Sender: TObject);
var nPgCtrl1, nPgCtrl2 : word;
begin
  LabelCntRec.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    nSvTabN := ReadInteger(SECTION, 'nSvTN', 0);
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 600);
    PanelLeft.Width := ReadInteger(SECTION, 'pnlLW', 161);
    dbgrPrmUv.Height := ReadInteger(SECTION, 'grPrUvSpsH', 150);
    popUpiSortFamIO.Checked := ReadBool(SECTION, 'bSortFam', true);
    nPgCtrl1 := ReadInteger(SECTION, 'PgCtrl1', 1);
    nPgCtrl2 := ReadInteger(SECTION, 'PgCtrl2', 1);
    nDbgrNuDetHeight := ReadInteger(SECTION, 'nDetH', 235);
    chBoxOnlyActive.Checked := ReadBool(SECTION, 'bOnlyActive', false);
    popMnuTotsByDtProc.Checked := ReadBool(SECTION, 'bTotsByDtProc', true);
    popMnuTotsByZaMesGod.Checked := not popMnuTotsByDtProc.Checked;
    Free;
  end;
  if FileExists(cDirVids + 'uUpi_01.vid') then
    dbgrUpi1.Columns.LoadFromFile(cDirVids + 'uUpi_01.vid');
  if FileExists(cDirVids + 'uUpi02.vid') then
    dbgrUpi2.Columns.LoadFromFile(cDirVids + 'uUpi02.vid');
  if FileExists(cDirVids + 'uPrmUv.vid') then
    dbgrPrmUv.Columns.LoadFromFile(cDirVids + 'uPrmUv.vid');
//  if FileExists(cDirVids + 'uPrUvSps.vid') then
//    dbgrPrmUvSps.Columns.LoadFromFile(cDirVids + 'uPrUvSps.vid');
  if FileExists(cDirVids + 'uPere01.vid') then
    dbgrPere.Columns.LoadFromFile(cDirVids + 'uPere01.vid');
  if FileExists(cDirVids + 'uNadb.vid') then
    dbgrNadb.Columns.LoadFromFile(cDirVids + 'uNadb.vid');
  if FileExists(cDirVids + 'uUdrg.vid') then
    dbgrUdrg.Columns.LoadFromFile(cDirVids + 'uUdrg.vid');
  if FileExists(cDirVids + 'uTtsNu01.vid') then
    dbgrTotsNU.Columns.LoadFromFile(cDirVids + 'uTtsNu01.vid');
  if FileExists(cDirVids + 'uNuDet.vid') then
    dbgrNuDet.Columns.LoadFromFile(cDirVids + 'uNuDet.vid');
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
  SetQryUpiSort;
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
end;
//------------------------------------------------------------------------------
procedure TFormUpi.chBoxOnlyActiveClick(Sender: TObject);
begin
  SetQryUpiSort;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.SetQryUpiSort;
var nSvTabN : integer;
begin
  nSvTabN := 0;
  with qryUpi do begin
    if Active then begin
      nSvTabN := FieldByName('TabN').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select Cast(0 as SmallInt) as MyPrUv, u.*, ' +
            ' LS.TabN as LSTN, LS.LicSch, bnk.ShBnk from Z_UPI u ' +
            ' Left Outer Join Z_BankiLS LS on (LS.TabN = u.Tabn) ' +
            ' Left Outer Join Z_Banki bnk on (bnk.KdBnk = LS.KdBnk)');
    if chBoxOnlyActive.Checked then
      SQL.Add(' where not u.LastDtPrm is NULL and ' +
              ' u.LastDtPrm <= :dDtEndMes and ' +
              ' (u.LastDtUvl is NULL or u.LastDtUvl >= :dDtBegMes) ');
    if popUpiSortFamIO.Checked then begin
      SQL.Add('order by u.Fam, u.Ima, u.Otch');
      LabelSort.Caption := 'Сортировано по Фамилии И.О.'; end
    else begin
      SQL.Add('order by u.TabN');
      LabelSort.Caption := 'Сортировано по табельному номеру';
    end;
    if chBoxOnlyActive.Checked then begin
      ParamByName('dDtBegMes').AsDateTime := dDtBegMes;
      ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
    end;




    Open;
    labelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    if nSvTabN > 0 then
      Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.SetDbgrPereColumns;
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
procedure TFormUpi.SetDbgrNadbColumns;
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
procedure TFormUpi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrUpi1.Columns.SaveToFile(cDirVids + 'uUpi_01.vid');
  dbgrUpi2.Columns.SaveToFile(cDirVids + 'uUpi02.vid');
  dbgrPrmUv.Columns.SaveToFile(cDirVids + 'uPrmUv.vid');
//  dbgrPrmUvSps.Columns.SaveToFile(cDirVids + 'uPrUvSps.vid');
  dbgrPere.Columns.SaveToFile(cDirVids + 'uPere01.vid');
  dbgrNadb.Columns.SaveToFile(cDirVids + 'uNadb.vid');
  dbgrUdrg.Columns.SaveToFile(cDirVids + 'uUdrg.vid');
  dbgrTotsNU.Columns.SaveToFile(cDirVids + 'uTtsNu01.vid');
  dbgrNuDet.Columns.SaveToFile(cDirVids + 'uNuDet.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'nSvTN', qryUpiTabN.AsInteger);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'pnlLW', PanelLeft.Width);
    WriteInteger(SECTION, 'grPrUvSpsH', dbgrPrmUv.Height);
    WriteInteger(SECTION, 'nDetH', nDbgrNuDetHeight);
    WriteBool(SECTION, 'bSortFam', popUpiSortFamIO.Checked);
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
    WriteBool(SECTION, 'bOnlyActive', chBoxOnlyActive.Checked);
    WriteBool(SECTION, 'bTotsByDtProc', popMnuTotsByDtProc.Checked);
    Free;
  end;
  qryTotsNU.Close;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.qryUpiCalcFields(DataSet: TDataSet);
begin
  with qryUpi do begin
    FieldByName('FamIO').AsString := MyFamIO(FieldByName('Fam').AsString,
                                           FieldByName('Ima').AsString,
                                         FieldByName('Otch').AsString);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.sBtnUpi1Click(Sender: TObject);
begin
  PageControl1.ActivePage := tsUpi1;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.sBtnUpi2Click(Sender: TObject);
begin
  PageControl1.ActivePage := tsUpi2;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popUpiPopup(Sender: TObject);
begin;
  popUpiEdt.Enabled := qryUpi.Active and (qryUpi.RecordCount > 0);
  popUpiAdd.Enabled := qryUpi.Active;
  popUpiDel.Enabled := popUpiEdt.Enabled and (bFlagDbg or (nAppUsrKat <= 1));
  popUpiNewPoisk.Enabled := popUpiEdt.Enabled;
  popUpiSort.Enabled := popUpiEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuPopup(Sender: TObject);
begin
  popMnuAdd.Visible := true;
  popMnuEdt.Visible := true;
  popMnuDel.Visible := true;
  popMnuPrtTots.Visible := false;
  popMnuSep1.Visible := false;
  popMnuTotsCase.Visible := false;
  popMnuShwDetails.Visible := false;
  popMnuSortNuDet.Visible := false;
  if popMnu.PopupComponent = dbgrPrmUv then begin
    popMnuHead.Caption := '== Приемы/Увольнения ==';
    popMnuEdt.Enabled := dbgrPrmUv.DataSource.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled; end
(*
  else if popMnu.PopupComponent = dbgrPrmUvSps then begin
    popMnuHead.Caption := '== Прием/Увольн. (филиал) ==';
    popMnuEdt.Enabled := dbgrPrmUvSps.DataSource.DataSet.RecordCount <> 0;
    popMnuDel.Enabled := popMnuEdt.Enabled; end
*)
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
    // popMnuTotsCase.Visible := true;    // Пока обойдемся одним вариантом
//    popMnuPrtTots.Visible := true;
//    popMnuPrtTots.Enabled := qryTotsNU.RecordCount > 0;
    popMnuShwDetails.Visible := true; end
  else if popMnu.PopupComponent = dbgrNuDet then begin
    popMnuHead.Caption := '== Подробности ==';
    popMnuAdd.Visible := false;
    popMnuEdt.Visible := false;
    popMnuDel.Visible := false;
    popMnuSortNuDet.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuAddClick(Sender: TObject);
var nSvNR : integer;
begin
  if popMnu.PopupComponent = dbgrPrmUv then begin
    with dbgrPrmUv.DataSource.DataSet do begin
      nSvNR := FieldByName('NR').AsInteger;
      Append;
      FieldByName('KdSps').AsInteger := 0;
      FieldByName('TabN').AsInteger := qryUpiTabN.AsInteger;
      if AddEdtPrmUv(qryUpiTabN.AsInteger, qryUpiFamIO.AsString,
                                  dbgrPrmUv.DataSource) {Z_EPrmUv} then begin
        Post;
        WritePrmUvInUpi(qryUpiTabN.AsInteger);
        b_WasUpdated := true; end
      else begin
        Cancel;
        Locate('NR', nSvNR, []);
      end;
    end; end
(*
  else if popMnu.PopupComponent = dbgrPrmUvSps then begin
    with dbgrPrmUv.DataSource.DataSet do begin
      nSvNR := FieldByName('NR').AsInteger;
      Append;
      FieldByName('KdSps').AsInteger := nKdSps;
      FieldByName('TabN').AsInteger := qryUpiTabN.AsInteger;
      if AddEdtPrmUv(qryUpiTabN.AsInteger, qryUpiFamIO.AsString,
                                  dbgrPrmUv.DataSource) {Z_EPrmUv} then begin
        Post;
        b_WasUpdated := true; end
      else begin
        Cancel;
        Locate('NR', nSvNR, []);
      end;
    end; end
*)
  else if popMnu.PopupComponent = dbgrPere then begin
    with dbgrPere.DataSource.DataSet do begin
      nSvNR := FieldByName('NR').AsInteger;
      Append;
      FieldByName('KdSps').AsInteger := nKdSps;
      FieldByName('TabN').AsInteger := qryUpiTabN.AsInteger;
      if AddEdtPere(nKdSps, qryUpiTabN.AsInteger, qryUpiFamIO.AsString,
                                  dbgrPere.DataSource) {Z_EPere} then begin
        Post;
        b_WasUpdated := true; end
      else begin
        Cancel;
        Locate('NR', nSvNR, []);
      end;
    end; end
  else if popMnu.PopupComponent = dbgrNadb then begin
    with dbgrNadb.DataSource.DataSet do begin
      nSvNR := FieldByName('NR').AsInteger;
      Append;
      FieldByName('KdSps').AsInteger := nKdSps;
      FieldByName('TabN').AsInteger := qryUpiTabN.AsInteger;
      if AddEdt_2Nadb(nKdSps, qryUpiFamIO.asString,
                     dbgrNadb.DataSource) {Z_E2Nadb} then begin
        Post;
        b_WasUpdated := true; end
      else begin
        Cancel;
        Locate('NR', nSvNR, []);
      end;
    end; end
  else if popMnu.PopupComponent = dbgrUdrg then begin
    with dbgrUdrg.DataSource.DataSet do begin
      nSvNR := FieldByName('NR').AsInteger;
      Append;
      FieldByName('KdSps').AsInteger := nKdSps;
      FieldByName('TabN').AsInteger := qryUpiTabN.AsInteger;
      if AddEdtUdrg(qryUpiFamIO.asString,
                         dbgrUdrg.DataSource) {Z_EUdrg} then begin
        Post;
        b_WasUpdated := true; end
      else begin
        Cancel;
        Locate('NR', nSvNR, []);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuEdtClick(Sender: TObject);
begin
  if popMnu.PopupComponent = dbgrPrmUv then
    dbgrPrmUvDblClick(Self)
//  else if popMnu.PopupComponent = dbgrPrmUvSps then
//    dbgrPrmUvSpsDblClick(Self)
  else if popMnu.PopupComponent = dbgrPere then
    dbgrPereDblClick(Self)
  else if popMnu.PopupComponent = dbgrNadb then
    dbgrNadbDblClick(Self)
  else if popMnu.PopupComponent = dbgrUdrg then begin
    with dbgrUdrg.DataSource.DataSet do begin
      Edit;
      if AddEdtUdrg(qryUpiFamIO.asString,
                                   dbgrUdrg.DataSource) {Z_EUdrg} then begin
        Post;
        b_WasUpdated := true; end
      else
        Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuDelClick(Sender: TObject);
var cMsg : string; nTabN : integer;
    dDtBeg : TDateTime;  {bNeedPereschet : boolean;}
begin
  cMsg := 'Запись удаляется безвозвратно. Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    if popMnu.PopupComponent = dbgrPrmUv then begin
      dbgrPrmUv.DataSource.DataSet.Delete;
      WritePrmUvInUpi(qryUpiTabN.AsInteger); end
(*
    else if popMnu.PopupComponent = dbgrPrmUvSps then
                               with dbgrPrmUv.DataSource.DataSet do begin
      if (FieldByName('KdSps').AsInteger <> nKdSps) and
                                                (nAppUsrKat <> 0) then begin
        ShowMessage('Не разрешается удалять "чужие" записи');
        Exit;
      end;
      Delete; end
*)
    else if popMnu.PopupComponent = dbgrPere then
                               with dbgrPere.DataSource.DataSet do begin
{
      if (FieldByName('KdSps').AsInteger <> nKdSps) and
                                                (nAppUsrKat <> 0) then begin
        ShowMessage('Не разрешается удалять "чужие" записи');
        Exit;
      end;
}
      dDtBeg := dbgrPere.DataSource.DataSet.FieldByName('Dt_Beg').AsDateTime;
      nTabN := dbgrPere.DataSource.DataSet.FieldByName('TabN').AsInteger;
//      bNeedPereschet := (dDtBeg <= dCtrlDate);
      Delete;
      if (dDtBeg <= dCtrlDate) then
        DmMain.AddPereschetInOtkl(nKdSps, nTabN, dCtrlDate, dDtBeg); end
    else if popMnu.PopupComponent = dbgrNadb then
                               with dbgrNadb.DataSource.DataSet do begin
{
      if (FieldByName('KdSps').AsInteger <> nKdSps) and
                                                (nAppUsrKat <> 0) then begin
        ShowMessage('Не разрешается удалять "чужие" записи');
        Exit;
      end;
}
      Delete; end
    else if popMnu.PopupComponent = dbgrUdrg then
                               with dbgrUdrg.DataSource.DataSet do begin
{
      if (FieldByName('KdSps').AsInteger <> nKdSps) and
                                                (nAppUsrKat <> 0) then begin
        ShowMessage('Не разрешается удалять "чужие" записи');
        Exit;
      end;
}
      Delete;
    end;
    b_WasUpdated := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuPrtTotsClick(Sender: TObject);
begin
  F6PrtTotsNU(qryUpi.FieldByName('TabN').AsInteger,    {Z_CmnPrt}
                        qryUpi.FieldByName('FamIO').AsString, qryTotsNU);
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbgrPereDrawColumnCell(Sender: TObject;
                const Rect: TRect; DataCol: Integer; Column: TColumn;
                                              State: TGridDrawState);
begin
  with dbgrPere.Canvas do begin
    if not (gdFocused in State) then begin
      if not dbgrPere.DataSource.DataSet.
                     FieldByName('PrcWrkTime').IsNull and
                     (dbgrPere.DataSource.DataSet.
                     FieldByName('PrcWrkTime').AsFloat <> 100) then
        Font.Color := clBlue
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrPere.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popUpiAddClick(Sender: TObject);
var nKdKatP, nNewTabN : integer; bAddInSps : boolean; bGoToTabN : boolean;
begin
  if AddInUpi_2(0, nKdKatP, nNewTabN, bAddInSps,
                        false, bGoToTabN) {Z_EUpi_2} then with qryUpi do begin
    Close;
    Open;
    Locate('TabN', nNewTabN, []);
    b_WasUpdated := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popUpiEdtClick(Sender: TObject);
begin
  with dsrcUpi.DataSet do begin
    Edit;
    if EdtUpi {z_EUpi2} then begin
      Post;
      b_WasUpdated := true; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popUpiDelClick(Sender: TObject);
var bIsInUse : boolean; cMsg : string;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select count(*) CNT from Z_NU where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := qryUpi.FieldByName('TabN').AsInteger;
    Open;
    bIsInUse := (RecordCount <> 0) and (FieldByName('CNT').AsInteger <> 0);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if bIsInUse then
    cMsg := 'При удалении записи в справочнике "Сотрудники" удаляются' + #13#10 +
          'все  записи  о  начислениях  и  удержаниях,  перемещениях,' + #13#10 +
            'надбавках по удаляемому табельному номеру.     Согласны?:'
  else
    cMsg := 'Запись удаляется безвозвратно.   Согласны?:';
  if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    qryUpi.Delete;
    b_WasUpdated := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.qryUpiAfterPost(DataSet: TDataSet);
begin
  if bPrUvEdit then Exit;    // не передавать в БД
  qryUpi.DisableControls;
  nSvTabN := qryUpi.FieldByName('TabN').AsInteger;
  Form_Dm.DbZpl.ApplyUpdates([qryUpi]);
  with qryUpi do begin
    Close;
    Open;
    Locate('TabN', nSvTabN, []);
    b_WasUpdated := true;
  end;
  qryUpi.EnableControls;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.qryUpiAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbZpl.ApplyUpdates([qryUpi]);
  b_WasUpdated := true;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbgrUpi1DblClick(Sender: TObject);
begin
  if bVuborMode then bBtnOkClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbgrUpi2DblClick(Sender: TObject);
begin
  if bVuborMode then bBtnOkClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormUpi.bBtnOkClick(Sender: TObject);
var i, nKdObj : integer;  cMsg, cShObj : string; mObjList : TStringList;
begin
  if qryUpi.RecordCount <= 0 then Exit;
  if bVuborMode and bNoCheckInSps then
    ModalResult := mrOk
  else begin
    mObjList := TStringList.Create;
    if not MyIsInSpsMes(dDtProc, qryUpi.FieldByName('TabN').AsInteger, nKdSps,
                                                           mObjList) then
      ModalResult := mrOk
    else begin
      cMsg := 'Сотрудник ' + qryUpi.FieldByName('FamIO').AsString +
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
function TFormUpi.MyIsInSpsMes(dDtProc : TDateTime; nTabN, nKdSps : integer;
                                            mObjList : TStringList) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select z_Sps.*, z_KdObj.ShObj, z_KdObj.NmObj ' +
            ' from z_Sps Left Outer Join z_KdObj ' +
            ' on (z_KdObj.KdObj = z_Sps.KdObj)' +
            ' where (z_Sps.DtProc = :dDtProc) and ' +
             ' (z_Sps.TabN = :nTabN) and (z_Sps.KdSps = :nKdSps)');
    SQL.Add('order by KdObj');
    ParamByName('dDtProc').AsDateTime  := dDtProc;
    ParamByName('nTabN').AsInteger     := nTabN;
    ParamByName('nKdSps').AsInteger    := nKdSps;
    Open;
    mObjList.Clear;
    if RecordCount > 0 then begin
      while not Eof do begin
        mObjList.Add(FieldByName('KdObj').AsString + ' ' +
                   FieldByName('ShObj').AsString + ' ' +
                   FieldByName('NmObj').AsString);
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
procedure TFormUpi.popUpiSortFamIOClick(Sender: TObject);
begin
  if not popUpiSortFamIO.Checked then begin
    popUpiSortFamIO.Checked := true;
    popUpiSortTabN.Checked := false;
    SetQryUpiSort;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popUpiSortTabNClick(Sender: TObject);
begin
  if not popUpiSortTabN.Checked then begin
    popUpiSortTabN.Checked := true;
    popUpiSortFamIO.Checked := false;
    SetQryUpiSort;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popUpiPoiskTabNClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString;
begin
  if VvodTabN(nTabN, cFamIO) {Z_VvTn} then begin
    if not qryUpi.Locate('TabN', nTabN, []) then
      ShowMessage('Поиск не удался  -  не найден' + #13#10 +
                  'табельный номер ' + IntToStr(nTabN) + ' в списке.');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popUpiPoiskFamClick(Sender: TObject);
var nTabN : integer;
begin
  if VvodFamForUpi(nTabN) {Z_VvFm} then
    qryUpi.Locate('TabN', nTabN, []);
end;
//------------------------------------------------------------------------------
procedure TFormUpi.PageControl2Change(Sender: TObject);
begin
  if PageControl2.ActivePage = tsTotsNu then
    OpenQryTotsNU
  else
    qryTotsNU.Close;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.qryTotsNUCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qryTotsNUMyMG.AsDateTime, nY, nM, nD);
  qryTotsNUMesRus.AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  qryTotsNUSmNaRuki.AsFloat := qryTotsNUSmNach.AsFloat -
                                  qryTotsNUSmUdrg.AsFloat -
                                     qryTotsNUSmVupl.AsFloat;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.sBtnAddInSpsCurMesClick(Sender: TObject);
var cFamIO, cMsg, cShObj, cNmObj : string;
    i, nSvNR, nTabN, n_KdSps, nKdObj : integer;
    mObjList : TStringList;  dDtPriem, dDtUvoln : TDateTime;
begin
  cFamIO := qryUpiFamIO.AsString;
  nTabN := qryUpiTabN.AsInteger;
  n_KdSps := nKdSps;
  mObjList := TStringList.Create;
  if MyIsInSpsMes(dDtProc, nTabN, n_KdSps, mObjList) then begin
    cMsg := 'Сотрудник ' + qryUpi.FieldByName('FamIO').AsString +
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
    if dbgrPrmUv.DataSource.DataSet.RecordCount > 0 then
         with dbgrPrmUv.DataSource.DataSet do begin
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
    if dbgrPere.DataSource.DataSet.RecordCount > 0 then
         with dbgrPere.DataSource.DataSet do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        if (FieldByName('Dt_Beg').AsDateTime <= dDtProc) or ((dDtPriem > 0) and
                         (FieldByName('Dt_Beg').AsDateTime = dDtPriem)) then
             // последнее для случая, когда только ввели и сразу подкл. в список
          nKdObj := FieldByName('KdObj').AsInteger;
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    if DopDlg(cFamIO, dDtPriem, dDtUvoln, nTabN,
                               n_KdSps, nKdObj) {z_UDpDlg} then begin
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add('Insert into Z_Sps (KDSPS, DTPROC, TABN, KDOBJ, NOTES) ' +
                ' values (:nKdSps, :dDtProc, :nTabN, :nKdObj, :cNotes)');
        ParamByName('nKdSps').AsInteger := nKdSps;
        ParamByName('dDtProc').AsDateTime := dDtProc;
        ParamByName('nTabN').AsInteger := nTabN;
        ParamByName('nKdObj').AsInteger := nKdObj;
        ParamByName('cNotes').AsString := 'из УПИ ' + DateToStr(Date);;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      cShObj := DmMain.KdObj2ShObj(nKdObj, cNmObj);
      ShowMessage('Сотрудник ' + cFamIO + ' включен в список подразделения ' +
                                               IntToStr(nKdObj) + ' ' +cNmObj);
(*
      // Витала идея тут же переставить главную форму на
      // подключенного сотрудника (как хотел сделать - см. ниже)
      with FormZpMain do begin
        if qryObj.FieldByName('KdObj').AsInteger <> nKdObj then
          MyTVLocateKdObj(nKdObj);
        qrySps.Close;
        qrySps.Open;
        qrySps.Locate('TabN', nTabN, []);
      end;
      // Но пришлось отказаться от этой затеи, т.к. в это время все
      // связанные наборы (PrmUv, Pere, Nadb и др.) переключены сюда в спр-к,
      // а там обNILены
*)
    end;
  end;
  mObjList.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbgrPrmUvDblClick(Sender: TObject);
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
                                           cAppNmUsr, 'Z_PrmUv', cLogMsg);
      WritePrmUvInUpi(FieldByName('TabN').AsInteger); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbgrPereDblClick(Sender: TObject);
var cLogMsg : string; nTabN : integer;
begin
  with dbgrPere.DataSource.DataSet do begin
{
    if (FieldByName('KdSps').AsInteger <> nKdSps) and
                                                (nAppUsrKat <> 0) then begin
        ShowMessage('Не разрешается редактировать "чужие" перемещения');
      Exit;
    end;
}
    Edit;
    if AddEdtPere(nKdSps,
                   dbgrUpi1.DataSource.DataSet.FieldByName('TabN').AsInteger,
                   dbgrUpi1.DataSource.DataSet.FieldByName('FamIO').AsString,
                                    dbgrPere.DataSource) {Z_EPere} then begin
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', OklTrf = ' + FieldByName('OklTrf').AsString;
      Post;
      DmMain.AddLog(Now, nTabN, 'Редакт.перемещений',
                                  cAppNmUsr, 'Z_Pere', cLogMsg); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbgrNadbDblClick(Sender: TObject);
var cMsg, cLogMsg : string; nTabN : integer;
begin
  with dbgrNadb.DataSource.DataSet do begin
{
    if (FieldByName('KdSps').AsInteger <> nKdSps) and
                                                (nAppUsrKat <> 0) then begin
        ShowMessage('Не разрешается редактировать "чужие" записи');
      Exit;
    end;
}
    Edit;
    // Вставить проверку на дату начала и Ку-Ка-Ре-Ку!!!
    if (FieldByName('Dt_Beg').AsDateTime < dCtrlDate) or
           (not MyEmptyDate(FieldByName('Dt_End').AsString) and
             (FieldByName('Dt_End').AsDateTime < dCtrlDate)) then
      cMsg := '';
    if (cMsg = '') or
             (MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes) then begin
      Edit;
      if AddEdt_2Nadb(nKdSps,
                 dbgrUpi1.DataSource.DataSet.FieldByName('FamIO').AsString,
                                   dbgrNadb.DataSource) {Z_E2Nadb} then begin
        nTabN := FieldByName('TabN').AsInteger;
        cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                   ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                   ', VidN = ' + FieldByName('VidN').AsString +
                   ', SP = ' + FieldByName('SP').AsString +
                   ', SmPrc = ' + FieldByName('SumProc').AsString;
        Post;
        DmMain.AddLog(Now, nTabN, 'Редакт.надбавок',
                                         cAppNmUsr, 'Z_Nadb', cLogMsg); end
      else
        Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbgrUdrgDblClick(Sender: TObject);
var cMsg, cLogMsg : string; nTabN : integer;
begin
  with dbgrUdrg.DataSource.DataSet do begin
{
    if (FieldByName('KdSps').AsInteger <> nKdSps) and
                                                (nAppUsrKat <> 0) then begin
      ShowMessage('Не разрешается редактировать "чужие" удержания');
      Exit;
    end;
}
    // Вставить проверку на дату начала и Ку-Ка-Ре-Ку!!!
    Edit;
    if AddEdtUdrg(dbgrUpi1.DataSource.DataSet.FieldByName('FamIO').AsString,
                                  dbgrUdrg.DataSource) {Z_EUdrg} then begin
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                 ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
                 ', VidN = ' + FieldByName('VidN').AsString +
                 ', SP = ' + FieldByName('SP').AsString +
                 ', SmPrc = ' + FieldByName('SumVzn').AsString;
      Post;
      DmMain.AddLog(Now, nTabN, 'Редакт.удержаний',
                                         cAppNmUsr, 'Z_Uderg', cLogMsg); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.qryUpiAfterScroll(DataSet: TDataSet);
begin
  if qryTotsNU.Active then
    qryTotsNU.Last;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbgrUpi1DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrUpi1.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryUpiLastDtPrm.IsNull or (qryUpiLastDtPrm.AsDateTime > dDtEndMes) or
          (not qryUpiLastDtUvl.IsNull and
                (qryUpiLastDtUvl.AsDateTime < dDtBegMes))) or
                                             (qryUpiMyPrUv.AsInteger = 1) then
        Font.Color := clTeal
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrUpi1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbgrUpi2DrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrUpi2.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryUpiLastDtPrm.IsNull or (qryUpiLastDtPrm.AsDateTime > dDtEndMes) or
          (not qryUpiLastDtUvl.IsNull and
                (qryUpiLastDtUvl.AsDateTime < dDtBegMes))) or
                                             (qryUpiMyPrUv.AsInteger = 1) then
        Font.Color := clTeal
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrUpi2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuTotsByDtProcClick(Sender: TObject);
begin
  if not popMnuTotsByDtProc.Checked then begin
    popMnuTotsByDtProc.Checked := true;
    popMnuTotsByZaMesGod.Checked := false;
    OpenQryTotsNU;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuTotsByZaMesGodClick(Sender: TObject);
begin
  if not popMnuTotsByZaMesGod.Checked then begin
    popMnuTotsByZaMesGod.Checked := true;
    popMnuTotsByDtProc.Checked := false;
    OpenQryTotsNU;
  end;
end;
(*  так было до 13-10-2006
//------------------------------------------------------------------------------
procedure TFormUpi.OpenQryTotsNU;
begin
  with qryTotsNU do begin
    Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    if popMnuTotsByDtProc.Checked then begin
      dbgrTotsNu.Color := clCream;
      SQL.Add('Select TabN, KdSps, DtProc as MyMG, ' +
              ' SmNach, -SmUdrg as SmUdrg, -SmVupl as SmVupl ' +
              ' from GetNu_Tots_DtProc (:TabN) ');
      SQL.Add('where (SmNach <> 0) or (SmUdrg <> 0) or (SmVupl <> 0)');
      SQL.Add('order by DtProc, KdSps');
      LabelTotsMsg.Caption := 'По месяцу начисления'; end
    else begin
      dbgrTotsNu.Color := clMoneyGreen;
      SQL.Add('Select TabN, KdSps, ZaMesGod as MyMG, ' +
              ' SmNach, -SmUdrg as SmUdrg, -SmVupl as SmVupl ' +
              ' from GetNu_Tots_ZaMesGod (:TabN)');
      SQL.Add('where (SmNach <> 0) or (SmUdrg <> 0) or (SmVupl <> 0)');
      SQL.Add('order by ZaMesGod, KdSps');
      LabelTotsMsg.Caption := 'По месяцу "ЗаМесяцГод"';
    end;
    SetDbgrTotsNuColumns;
    Open;
  end;
end;
*)
//------------------------------------------------------------------------------
//  так стало после 13-10-2006
procedure TFormUpi.OpenQryTotsNU;
begin
  with qryTotsNU do begin
    Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    if popMnuTotsByDtProc.Checked then begin
      dbgrTotsNu.Color := clCream;
      SQL.Add('Select TabN, KdSps, DtProc as MyMG, ' +
              ' SmNach, -SmUdrg as SmUdrg, Cast(NULL as Float) as SmVupl ' +
              ' from GetNu_Opi_Tots_DtProc (:TabN) ');
      SQL.Add('where (SmNach <> 0) or (SmUdrg <> 0)');
      SQL.Add('order by DtProc, KdSps');
      LabelTotsMsg.Caption := 'По месяцу начисления'; end
    else begin
      dbgrTotsNu.Color := clMoneyGreen;
      SQL.Add('Select TabN, KdSps, ZaMesGod as MyMG, ' +
              ' SmNach, -SmUdrg as SmUdrg, Cast(NULL as Float) as SmVupl ' +
              ' from GetNu_Opi_Tots_ZaMesGod (:TabN)');
      SQL.Add('where (SmNach <> 0) or (SmUdrg <> 0)');
      SQL.Add('order by ZaMesGod, KdSps');
      LabelTotsMsg.Caption := 'По месяцу "ЗаМесяцГод"';
    end;
    SetDbgrTotsNuColumns;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.SetDbgrTotsNuColumns;
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
procedure TFormUpi.popUpiNewPoiskClick(Sender: TObject);
var nTabN, nCase : integer;
begin
  if VvodFmTnForUpi(nTabN, nCase) {z_VvFmTn} then begin
    if nCase = 0 {по ТабН} then begin
      if nTabN > 0 then begin
        if not qryUPI.Locate('TabN', nTabN, []) then
          ShowMessage('Поиск не удался  -  не найден' + #13#10 +
                    'табельный номер ' + IntToStr(nTabN));
      end; end
    else begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      qryUpi.Locate('TabN', nTabN, []);
      Screen.Cursor := crDefault;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.FormKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then begin
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где нужно, пользуйтесь контекстными меню');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popUpiCheckUvolnClick(Sender: TObject);
var nSvNR, n, nDbg : integer; bUvolen, bTrueMetka : boolean;
    dDtBeg, dDtEnd : TDateTime;
begin
  if not qryUpi.Active or (qryUpi.RecordCount <= 0) then begin
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
    DataBaseName := CESZPL;
    SQL.Add('Select * from RABOTAL (:nTabN, :dDtBeg, :dDtEnd)');
    Prepare;
  end;
  with qryUpi do begin
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
      WritePrmUvInUpi(FieldByName('TabN').AsInteger);
      Inc(n);
(*
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
*)
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
end;
//------------------------------------------------------------------------------
procedure TFormUpi.WritePrmUvInUpi(nTabN : integer);
var dDtPrm, dDtUvl : TDateTime; nMyPrUv : SmallInt;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
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
  if nMyPrUv <> qryUpiMyPrUv.AsInteger then begin
    bPrUvEdit := true;
    qryUpi.Edit;
    qryUpiMyPrUv.AsInteger := nMyPrUv;
    qryUpi.Post;
    bPrUvEdit := false;
  end;
end;
//------------------------------------------------------------------------------
function TFormUpi.MyIsUvolen(nTabN : integer;
                                     dDtBeg, dDtEnd : TDateTime) : boolean;
begin
  Result := false;
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
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuShwDetailsClick(Sender: TObject);
begin
  popMnuShwDetails.Checked := not popMnuShwDetails.Checked;
  SetDetMode;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.SetDetMode;
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
procedure TFormUpi.OpenQryNuDet;
begin
  with qryNuDet do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    DataSource := dsrcTotsNU;
    SQL.Add('Select * from ViNu_Main where DtProc = :MyMG and ' +
              ' TabN = :TabN and KdSps = :KdSps and VidN < "8000" ');
    if popMnuSortNuDetByVidN.Checked then
      SQL.Add(' order by VidN, ZaMesGod ')
    else
      SQL.Add(' order by ZaMesGod, VidN ');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuSortNuDetByVidNClick(Sender: TObject);
begin
  if not popMnuSortNuDetByVidN.Checked then begin
    popMnuSortNuDetByZaMG.Checked := false;
    popMnuSortNuDetByVidN.Checked := true;
    OpenQryNuDet;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.popMnuSortNuDetByZaMGClick(Sender: TObject);
begin
  if not popMnuSortNuDetByZaMG.Checked then begin
    popMnuSortNuDetByZaMG.Checked := true;
    popMnuSortNuDetByVidN.Checked := false;
    OpenQryNuDet;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpi.dsrcUpiDataChange(Sender: TObject; Field: TField);
var cMsg : ShortString;
begin
  cMsg := '';
  if dsrcUpi.State = dsBrowse then begin
    cMsg := 'ТабНр ' + qryUpiTabN.AsString + ',    Ид ';
    if qryUpiID.IsNull or (qryUpiID.AsString = '') then
      cMsg := cMsg + 'ОТСУТСТВУЕТ'
    else
      cMsg := cMsg + qryUpiID.AsString;
    cMsg := cMsg + ',    ' + qryUpiFam.AsString + ' ' + qryUpiIma.AsString +
                                                  ' ' + qryUpiOtch.AsString;
    PanelID.Caption := cMsg;
  end;  
end;

end.
