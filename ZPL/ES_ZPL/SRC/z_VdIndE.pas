unit z_VdIndE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, DBTables, DB, ComCtrls, ExtCtrls, Grids, DBGrids,
  Math, StdCtrls, DBClient, Menus, Provider;

type
  TFormVdIndE = class(TForm)
    Panel1: TPanel;
    bBtnClose: TBitBtn;
    dbgrHIndx: TDBGrid;
    Splitter1: TSplitter;
    PageControl: TPageControl;
    ts1: TTabSheet;
    qryHIndx: TQuery;
    dsrcHIndx: TDataSource;
    qryHIndxNR: TIntegerField;
    qryHIndxDTPROC: TDateTimeField;
    qryHIndxZAMESGOD: TDateTimeField;
    qryHIndxSMPROGMIN: TFloatField;
    qryHIndxPRCINDX: TFloatField;
    qryHIndxINCLSOVM: TStringField;
    updHIndx: TUpdateSQL;
    sBtnAdd: TSpeedButton;
    sBtnGoBack: TSpeedButton;
    sBtnSave: TSpeedButton;
    qryHIndxNRVDPV: TIntegerField;
    qryHIndxDTVDPV: TDateTimeField;
    qryHIndxKDUSR: TSmallintField;
    dsrcOtkl: TDataSource;
    dbgrOtkl: TDBGrid;
    qryTmp: TQuery;
    sBtnGo: TSpeedButton;
    ts2: TTabSheet;
    dsrcTmp: TDataSource;
    dbgrTmp: TDBGrid;
    qryPere: TQuery;
    cdsP: TClientDataSet;
    dsrcP: TDataSource;
    dbgrP: TDBGrid;
    qryUpi: TQuery;
    cdsPNR: TAutoIncField;
    cdsPTabN: TIntegerField;
    cdsPFamIO: TStringField;
    cdsPSmNach: TFloatField;
    cdsPSmToIndx: TFloatField;
    cdsPSmIndx: TFloatField;
    cdsPInSps: TStringField;
    cdsPKdObj: TSmallintField;
    qrySps: TQuery;
    cdsPKdKatP: TSmallintField;
    pop: TPopupMenu;
    popSortP: TMenuItem;
    popSortPObjFIO: TMenuItem;
    popSortPFIO: TMenuItem;
    popSortPTabN: TMenuItem;
    qryOtkl: TQuery;
    qryOtklFAM: TStringField;
    qryOtklIMA: TStringField;
    qryOtklOTCH: TStringField;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklSHVIDN: TStringField;
    qryOtklSTORN: TStringField;
    qryOtklOLDKDVIDN: TSmallintField;
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
    popTotals: TMenuItem;
    popSortOtkl: TMenuItem;
    popSortOtklObjFIO: TMenuItem;
    popSortOtklFIO: TMenuItem;
    popSortOtklTabN: TMenuItem;
    cdsPKdSps: TSmallintField;
    popDelPaket: TMenuItem;
    popNewPaket: TMenuItem;
    cdsPKdSpZ: TSmallintField;
    qryPrmUv: TQuery;
    qryNadb: TQuery;
    cdsPBazMes: TDateField;
    cdsPPrcInd: TFloatField;
    cdsPPrSmInd: TFloatField;
    sBtnPrt: TSpeedButton;
    qryHIndxUsrNotes: TStringField;
    qryDPere: TQuery;
    qryCmbOkl: TQuery;
    qry1: TQuery;
    qry2: TQuery;
    qryMyTmp: TQuery;
    cdsDbg: TClientDataSet;
    cdsDbgNR: TAutoIncField;
    cdsDbgTabN: TIntegerField;
    cdsDbgSmOklNdbIndM: TFloatField;
    cdsDbgDtBM: TDateField;
    cdsDbgSmProgMin: TFloatField;
    cdsDbgPrcIndBM: TFloatField;
    cdsDbgSmDelta: TFloatField;
    cdsDbgSmIndx: TFloatField;
    cdsDbgSmToIndx: TFloatField;
    cdsDbgSmOklNdbBM: TFloatField;
    cdsDbgPredpSmInd: TFloatField;
    cdsDbgDa: TStringField;
    cdsDbgLastPrm: TDateField;
    cdsDbgSmMinZpBM: TFloatField;
    cdsDbgDtRprMin: TDateField;
    LabelCntRec: TLabel;
    popSortPSmIndx: TMenuItem;
    popSortOtklSmIndx: TMenuItem;
    cdsPLastDtPrm: TDateField;
    PanelTots: TPanel;
    sBtnPanelPTtHide: TSpeedButton;
    LabelSmTots: TLabel;
    LabelCntTots: TLabel;
    sBtnTots: TSpeedButton;
    cdsPIsCmbOkl: TStringField;
    cdsDbgIsMin: TStringField;
    qryBM: TQuery;
    qryBMNR: TIntegerField;
    qryBMINDMES: TDateTimeField;
    qryBMBAZMES: TDateTimeField;
    qryBMPRCIND: TFloatField;
    qryBMLASTDTBM: TDateTimeField;
    qryProgMin: TQuery;
    qryPrcInd: TQuery;
    cdsBM: TClientDataSet;
    dspTmp: TDataSetProvider;
    cdsBMNR: TIntegerField;
    cdsBMINDMES: TDateTimeField;
    cdsBMBAZMES: TDateTimeField;
    cdsBMPRCIND: TFloatField;
    cdsBMLASTDTBM: TDateTimeField;
    qryTmpTABN: TIntegerField;
    qryTmpSMM: TFloatField;
    popCheckPaket: TMenuItem;
    ts3: TTabSheet;
    cdsPRs: TClientDataSet;
    cdsPRsNR: TAutoIncField;
    cdsPRsTabN: TIntegerField;
    cdsPRsBazMes: TDateField;
    cdsPRsFamIO: TStringField;
    cdsPRsKdSps: TSmallintField;
    cdsPRsKdObj: TSmallintField;
    cdsPRsKdKatP: TSmallintField;
    cdsPRsSmBM: TFloatField;
    cdsPRsSmNach: TFloatField;
    cdsPRsSmToIndx: TFloatField;
    cdsPRsPrSmInd: TFloatField;
    cdsPRsDeltaSm: TFloatField;
    cdsPRsPrcInd: TFloatField;
    cdsPRsSmIndx: TFloatField;
    cdsPRsLastDtPrm: TDateField;
    cdsPRsIsSovm: TStringField;
    cdsPRsInSps: TStringField;
    cdsPRsIsCmbOkl: TStringField;
    cdsPRsIsMin: TStringField;
    cdsPRsKdSpZ: TSmallintField;
    dsrcPRs: TDataSource;
    dbgrPRs: TDBGrid;
    cdsPRsOldSmIndx: TFloatField;
    cdsPRsSmRazn: TFloatField;
    qryHIndxDTRPRMIN: TDateTimeField;
    qryHIndxTIPPKT: TStringField;
    qryOldNU: TQuery;
    PanelTotsRPs: TPanel;
    sBtnTotsRPs: TSpeedButton;
    LabelSmDoplat: TLabel;
    LabelCntRPs: TLabel;
    LabelSmUderg: TLabel;
    qryInSps: TQuery;
    qryFixIndx: TQuery;
    qryWT: TQuery;
    cdsPKtWT: TFloatField;
    cdsPDeltaOklNdb: TFloatField;
    cdsPSmFIndx: TFloatField;
    popFilter: TMenuItem;
    popFilterBez: TMenuItem;
    popFilterOnlyNeNull: TMenuItem;
    procedure sBtnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsOtklCalcFields(DataSet: TDataSet);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure sBtnGoClick(Sender: TObject);
    procedure dbgrPDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popSortPObjFIOClick(Sender: TObject);
    procedure popSortPFIOClick(Sender: TObject);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsrcHIndxDataChange(Sender: TObject; Field: TField);
    procedure sBtnGoBackClick(Sender: TObject);
    procedure sBtnSaveClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure popSortOtklObjFIOClick(Sender: TObject);
    procedure popSortOtklFIOClick(Sender: TObject);
    procedure PageControlResize(Sender: TObject);
    procedure popTotalsClick(Sender: TObject);
    procedure qryHIndxAfterScroll(DataSet: TDataSet);
    procedure sBtnPanelPTtHideClick(Sender: TObject);
    procedure popDelPaketClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure qryHIndxCalcFields(DataSet: TDataSet);
    //procedure cdsBmBeforePost(DataSet: TDataSet);
    procedure popSortPTabNClick(Sender: TObject);
    procedure popSortPSmIndxClick(Sender: TObject);
    procedure popSortOtklTabNClick(Sender: TObject);
    procedure popSortOtklSmIndxClick(Sender: TObject);
    procedure dbgrPDblClick(Sender: TObject);
    procedure sBtnTotsClick(Sender: TObject);
    procedure popCheckPaketClick(Sender: TObject);
    procedure dbgrPRsDblClick(Sender: TObject);
    procedure dbgrPRsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnTotsRPsClick(Sender: TObject);
    procedure dbgrHIndxDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    dDtMinBM, dDtMaxBM : TDateTime; // младший и старший "базовые" месяцы
    dDtRprMin,   // Дата, введенная в окошко "Опорный месяц для минимальщиков"
    dDtRprMin_1 : TDateTime;  // Дата предыдущего к dDtRprMin месяца
    d_DtPrc : TDateTime;
    nNewVedNr : integer;
    bIsSavePkt : boolean;
    n_SmProgMin : double;  // Чтобы записать в cdsRS
    b_DefSchBU : boolean;
    b_OnlySps : boolean;
    c_Tabs : string;
    n_KdSchBU : SmallInt;
    c_SchBU : ShortString;
    bPereSchet : boolean;
    procedure OpenQryHIndx;
    procedure OpenQryOtkl;
    procedure CreOpenCdsBM(dIndMes : TDateTime);
    procedure CreOpenCdsPRs(dDtZaMG : TDateTime);
    procedure DoSchet;
    procedure PrepareQueries(dDtPrc, dDtBeg, dDtZaMG : TDateTime);
    procedure UnPrepareQueries;
    procedure AddRecToCdsP(nTabN : integer;
                                   nKdSps, nKdObj, nKdKatP, nKdSpZ : SmallInt;
                                dDtBM, dLastDtPrm : TDateTime;
                                bIsInSps, bIsCmbOkl : boolean;
                           nSmFixIndx, nSmNach, nSmToIndx, nPrcIndx, nPrSmIndx,
                                nSmDeltaOklNdb, nSmIndx, nKtWT : double);
    procedure SetCdsPIndex;
    procedure AddRecToCdsPRs(nTabN : integer;
                                nKdSps, nKdObj, nKdKatP, nKdSpZ : SmallInt;
                                dDtBM, dLastDtPrm : TDateTime;
                                bIsInSps, bIsSovm, bIsCmbOkl, bIsMin : boolean;
                                nSmOklNdbIndM, nSmToIndx, nSmIndx,
                                nPrcIndBM, nSmBM, nPrSmInd, nSmDelta : double);
{
    function RaschetBM(nTabN : integer;
                         var dDtZaMG, dDtBM, dDtEZaMG, dLastDtPrm : TDateTime;
                  var bIsInSps, bIsSovm, bIsCmbOkl, bIsMin : boolean) : boolean;
}
    function GetSmOkl(nTabN : integer; dDtMes : TDateTime) : double;
    function GetSmOklNdb(nTabN : integer; dDtMes : TDateTime;
                                              var bIsCmbOkl : boolean) : double;
    function GetSmMinZp(dZaMG : TDateTime) : double;
    function GetSmProgMin(dDtMes : TDateTime) : double;
    function GetPrcIndInMes(dDtBM, dInMes : TDateTime) : double;
    procedure ShwOtklTotals;
    procedure ShwCdsPRsTotals;
    procedure ShwCdsPTotals;
    procedure ShwOtklPRsTots;
    function IsMinInPredMes : boolean;
    procedure Sravnenie_1(dDtZaMG : TDateTime);
    function GetSmOldIndx(nTabN : integer; dDtZaMG : TDateTime) : double;
    procedure Sravnenie_2;
    procedure SavePRs;
    //function RecPereNoIndx(nTabN : integer; dDtEBM : TDateTime) : boolean;
    //function GetSmOklNdbPredRec(nTabN : integer;
    //                                       var bIsCmbOkl : boolean) : double;
    function NotInSpsCurMes(nTabN : integer; dDtPrc : TDateTime) : boolean;
    function GetKtWT(nTabN : integer; dDtZaMG : TDateTime;
                                                 nCntChBudg : double) : double;
    procedure CheckTblFixIndx(dDtZaMG : TDateTime);
  public
    { Public declarations }
  end;

procedure ShwVdIndE(dDtPrc : TDateTime);

const SECTION = 'z_VdIndE';

var
  FormVdIndE: TFormVdIndE;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib, z_VdIndZ, z_IndDbg, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwVdIndE(dDtPrc : TDateTime);
begin
  FormVdIndE := TFormVdIndE.Create(Application);
  with FormVdIndE do begin
    bPereSchet := false;
    Caption := 'Пакеты индексации {Видны все. Новый - "фиксированный"}';
    d_DtPrc := dDtPrc;
    OpenQryHIndx;
    OpenQryOtkl;
    if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
      LabelCntRec.Caption := 'Записей ' + IntToStr(qryOtkl.RecordCount)
    else
      LabelCntRec.Caption := '';
    //popCheckPaket.Visible := bFlagDbg;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormVdIndE.GetPrcIndInMes(dDtBM, dInMes: TDateTime): double;
begin
//  Result := 0;
  with qryPrcInd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from z_PrcIndx ' +
            ' where BazMes = :dDtBM and IndMes = :dInMes order by NR desc');
    ParamByName('dInMes').AsDateTime := dInMes;
    ParamByName('dDtBM').AsDateTime  := dDtBM;
    Open;
    Result := FieldByName('PrcInd').AsFloat;
    Close;
  end;

end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.OpenQryHIndx;
begin
  with qryHIndx do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_HIndx order by ZaMesGod, NR');
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.OpenQryOtkl;
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryOtkl do begin
    if Active then begin
      nSvNR := FieldByName('NR').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcHIndx;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, o.* ' +
            ' from ViOtkl o Left Outer Join Z_Upi u on u.TabN = o.TabN ' +
            ' where o.DtProc = :DtProc and NrVdPv = :NrVdPv and ' +
            ' o.VidN = "1620"');
    if popSortOtklObjFIO.Checked then
      SQL.Add('order by o.KdObj, u.Fam, u.Ima, u.Otch')
    else if popSortOtklFIO.Checked then
      SQL.Add('order by u.Fam, u.Ima, u.Otch')
    else if popSortOtklTabN.Checked then
      SQL.Add('order by o.TabN')
    else
      SQL.Add('order by o.Summa, u.Fam, u.Ima, u.Otch');
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
  end;
  sBtnGo.Enabled := qryHIndx.Active and (qryHIndx.RecordCount > 0) and
                                                (qryOtkl.RecordCount = 0);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.CreOpenCdsBM(dIndMes: TDateTime);
var dDtTmp : TDateTime; nY, nM, nD : word;
begin
  with qryBM do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_PrcIndx where IndMes = :dIndMes order by BazMes');
    ParamByName('dIndMes').AsDateTime := dIndMes;
    //Open;
  end;
  dspTmp.DataSet := qryBM;
  with cdsBM do begin
    if Active then Close;
    ProviderName := 'dspTmp';
    Open;
    Last;
    dDtTmp := cdsBMBAZMES.AsDateTime;
    while dDtTmp < dIndMes do begin
      DecodeDate(dDtTmp, nY, nM, nD);
      Inc(nM);
      if nM > 12 then begin
        nM := 1;
        Inc(nY);
      end;
      dDtTmp := EncodeDate(nY, nM, 1);
      Append;
      cdsBmIndMes.AsDateTime := dIndMes;
      cdsBmBazMes.AsDateTime := dDtTmp;
      cdsBmPrcInd.AsFloat    := 0;
      cdsBmLastDtBM.AsDateTime := myLastDOM(dDtTmp);
      Post;
    end;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'cdsBM.cds');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.CreOpenCdsPRs(dDtZaMG: TDateTime);
begin
  with cdsPRs do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.sBtnAddClick(Sender: TObject);
var dDtPrc, dDtZaMG : TDateTime;
begin
//////////////////  if PanelOtklTt.Visible then
//////////////////    PanelOtklTt.Visible := false;
  dDtPrc := d_DtPrc;
  dDtZaMG := 0;
  //nSmProgMin := 0;
  //bInclSovm := false;
  if AddVdIndZ(dDtPrc, dDtZaMG,   {"фиксированная" индексация}
        b_DefSchBU, b_OnlySps, c_Tabs, n_KdSchBU, c_SchBU) {z_VdIndZ} then begin
    sBtnAdd.Enabled := false;
    //n_SmProgMin := nSmProgMin;
    //dDtRprMin := dMesChngMinZp;
    //DecodeDate(dDtRprMin, nY, nM, nD);
    {
    nM := nM - 1;
    if nM < 1 then begin
      nM := 12;
      nY := nY - 1;
    end;
    dDtRprMin_1 := EncodeDate(nY, nM, 1);
    }
    CreOpenCdsBM(dDtZaMG);
    with qryHIndx do begin
      nNewVedNr := DmMain.NewVedNR;
      Append;
      qryHIndxDtProc.AsDateTime   := dDtPrc;
      qryHIndxZaMesGod.AsDateTime := dDtZaMG;
      //qryHIndxSmProgMin.AsFloat := nSmProgMin;
      {
      if bInclSovm then
        qryHIndxInclSovm.AsString := 'Y'
      else
        qryHIndxInclSovm.AsString := 'N';
      }
      qryHIndxDtRprMin.AsDateTime := dDtRprMin;
      qryHIndxKdUsr.AsInteger     := nAppKdUsr;
      qryHIndxNrVdPv.AsInteger    := nNewVedNR;
      qryHIndxDtVdPv.AsDateTime   := Date;
      qryHIndxTipPkt.AsString     := 'Indx';
      Post;
      bIsSavePkt := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popCheckPaketClick(Sender: TObject);
var {dDtPrc,} dDtZaMG, dMesChngMinZp : TDateTime; {nSmProgMin : double;}
    {bInclSovm : boolean;} nY, nM, nD : word;
begin
  { План:
    - Сделать расчет по новому алгоритму (07-2012) для ZaMG текущего пакета
    - Результаты собрать в cdsCheck и туда же выбрать результаты из текущего
      пакета
    - На ts3 вывести сравнительные результаты с возможностью сохранения в
      отклонения текущего месяца, либо в какую-то таблицу для последующего
      подклячения в отклонения
  }
  bPereSchet := true;
  //dDtPrc := d_DtPrc;
  dDtZaMG := qryHIndxZaMesGod.AsDateTime;
  dMesChngMinZp := qryHIndxDtRprMin.AsDateTime;
  b_DefSchBU := true;  // Выбирать из перемещений
  dDtRprMin := dMesChngMinZp;
  //nSmProgMin := qryHIndxSmProgMin.AsFloat;
  //bInclSovm := false;
  DecodeDate(dDtRprMin, nY, nM, nD);
  nM := nM - 1;
  if nM < 1 then begin
    nM := 12;
    nY := nY - 1;
  end;
  dDtRprMin_1 := EncodeDate(nY, nM, 1);
  CreOpenCdsPRs(dDtZaMG);
  CreOpenCdsBM(dDtZaMG);
  sBtnAdd.Enabled := false;
  sBtnGo.Click;
  //sBtnGo.Enabled  := true;
  //PageControl.ActivePage := ts3;
  bPereSchet := false;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.FormCreate(Sender: TObject);
var nSortP, nSortO : Smallint;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 580);
    Width  := ReadInteger(SECTION, 'wW', 825);
    dbgrHIndx.Width := ReadInteger(SECTION, 'nGrW', 265);
    nSortP := ReadInteger(SECTION, 'nSortP', 1);
    nSortO := ReadInteger(SECTION, 'nSortO', 1);
    Free;
  end;
  if nSortP = 1 then begin
    popSortPObjFIO.Checked := true;
    popSortPFIO.Checked := false;
    popSortPTabN.Checked := false;
    popSortPSmIndx.Checked := false; end
  else if nSortP = 2 then begin
    popSortPObjFIO.Checked := false;
    popSortPFIO.Checked := true;
    popSortPTabN.Checked := false;
    popSortPSmIndx.Checked := false; end
  else if nSortP = 3 then begin
    popSortPObjFIO.Checked := false;
    popSortPFIO.Checked := false;
    popSortPTabN.Checked := true;
    popSortPSmIndx.Checked := false; end
  else begin
    popSortPObjFIO.Checked := false;
    popSortPFIO.Checked := false;
    popSortPTabN.Checked := false;
    popSortPSmIndx.Checked := true;
  end;
  if nSortO = 1 then begin
    popSortOtklObjFIO.Checked := true;
    popSortOtklFIO.Checked := false;
    popSortOtklTabN.Checked := false;
    popSortOtklSmIndx.Checked := false; end
  else if nSortO = 2 then begin
    popSortOtklObjFIO.Checked := false;
    popSortOtklFIO.Checked := true;
    popSortOtklTabN.Checked := false;
    popSortOtklSmIndx.Checked := false; end
  else if nSortO = 3 then begin
    popSortOtklObjFIO.Checked := false;
    popSortOtklFIO.Checked := false;
    popSortOtklTabN.Checked := true;
    popSortOtklSmIndx.Checked := false; end
  else begin
    popSortOtklObjFIO.Checked := false;
    popSortOtklFIO.Checked := false;
    popSortOtklTabN.Checked := false;
    popSortOtklSmIndx.Checked := true;
  end;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  ts3.TabVisible := false;
  PageControl.ActivePage := ts1;
  LabelCntRec.Caption := '';
  if FileExists(cDirVids + 'HIndE_00.vid') then
    dbgrHIndx.Columns.LoadFromFile(cDirVids + 'HIndE_00.vid');
  if FileExists(cDirVids + 'HIndE_04.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'HIndE_04.vid');
  if FileExists(cDirVids + 'HIndE_08.vid') then
    dbgrP.Columns.LoadFromFile(cDirVids + 'HIndE_08.vid');
  if FileExists(cDirVids + 'HIndE_12.vid') then
    dbgrPRs.Columns.LoadFromFile(cDirVids + 'HIndE_12.vid');
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrHIndx.Columns.SaveToFile(cDirVids + 'HIndE_00.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'HIndE_04.vid');
  dbgrP.Columns.SaveToFile(cDirVids + 'HIndE_08.vid');
  dbgrPRs.Columns.SaveToFile(cDirVids + 'HIndE_12.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nGrW', dbgrHIndx.Width);
    if popSortPObjFIO.Checked then
      WriteInteger(SECTION, 'nSortP', 1)
    else if popSortPFIO.Checked then
      WriteInteger(SECTION, 'nSortP', 2)
    else if popSortPTabN.Checked then
      WriteInteger(SECTION, 'nSortP', 3)
    else
      WriteInteger(SECTION, 'nSortP', 4);
    if popSortOtklObjFIO.Checked then
      WriteInteger(SECTION, 'nSortO', 1)
    else if popSortOtklFIO.Checked then
      WriteInteger(SECTION, 'nSortO', 2)
    else if popSortOtklTabN.Checked then
      WriteInteger(SECTION, 'nSortO', 3)
    else
      WriteInteger(SECTION, 'nSortO', 4);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.cdsOtklCalcFields(DataSet: TDataSet);
begin
  qryOtklFamIO.AsString := MyFamIO(qryOtklFam.AsString, qryOtklIma.AsString,
                                                         qryOtklOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.PrepareQueries(dDtPrc, dDtBeg, dDtZaMG : TDateTime);
begin
  with cdsP do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    CreateDataSet;
    Open;
  end;
  with qryUpi do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Upi where TabN = :nTabN');
    Prepare;
  end;
  with qryPrmUv do begin  // для получения сведений о Приемах/Увольнениях
    if Active then Close; // и определения "базового" месяца и
    SQL.Clear;            // затем "базовой" суммы (Окл+Надбавки) для сотрудника
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_PrmUv where TabN = :nTabN and ' +
            ' Dt_Priem <= :dDtEZaMG order by Dt_Priem desc');
    Prepare;
  end;
  with qrySps do begin     // чтобы узнать - есть ли в списке текущего месяца
    if Active then Close;  // и, если есть, в каком подразделении
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Sps where DtProc = :dDtPrc and TabN = :nTabN ' +
            ' order by KdObj'); // чтобы получать самый малый
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Prepare;
  end;
  with qryPere do begin   // для получения "параметров" сотрудника в
    if Active then Close; // базовом месяце и месяце ЗаМГ (особенно оклада)
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select p.TabN, p.Dt_Beg, p.CmbOkl, p.OklTrf, p.Sovm, ' +
            ' p.KdKatP, p.KdSps, p.KdObj, p.KdSpZ, p.Spec_NR, ' +
            ' Sum(co.OklTrf) as SmCmbOkl from Z_Pere p ' +
            ' Left Outer Join z_CmbOkl co on co.TabN = p.TabN and ' +
            ' co.Spec_NR = p.Spec_NR ' +
            ' where p.TabN = :nTabN and p.Dt_Beg <= :dDtEMes ' +
            ' group by p.TabN, p.Dt_Beg, p.CmbOkl, p.OklTrf, p.Sovm, ' +
            ' p.KdKatP, p.KdSps, p.KdObj, p.KdSpZ, p.Spec_NR ' +
            ' order by p.Dt_Beg desc');
    Prepare;
  end;
  with qryNadb do begin      // для получения сумм надбавок базового и
    if Active then Close;    // индексируемого месяцев
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select n.*, v.Ind from z_Nadb n ' +
            ' Left Outer Join z_KdVidN v on v.VidN = n.VidN ' +
            ' where n.TabN = :nTabN and v.Ind = "1" and ' +
            ' (n.Dt_End is Null or n.Dt_End >= :dDtBegBM) ' +
            ' order by n.dt_Beg desc');
    Prepare;
  end;
  with qryCmbOkl do begin // В случаях, когда в базовом или индексируемом месяце
    if Active then Close; // сотрудник работал на комб.окладе, просто высчитываю
    SQL.Clear;            // заработки в базовом и индексируемом месяцах.
    DataBaseName := CESMAIN;
    SQL.Add('Select ZaMesGod, Sum(Summa) as SMM from ViNuMain ' +
            ' where TabN = :nTabN and DtProc >= :dDtBeg and ' +
            ' ZaMesGod in (:dDtBegBM,:dDtBegIndM) and ' +
            ' VidN < "6000" and Ind = "1" group by ZaMesGod');
    ParamByName('dDtBeg').AsDateTime := dDtBeg; // остальное (:nTabN, :dDtBegBM
    Prepare;                        // и :dDtBegIndM) будет вставляться по ходу
  end;
  with qryFixIndx do begin    // для получения суммы "фиксированной индексации"
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from Z_FixIndx where TabN = :nTabN and ' +
            ' FixMes <= :dFixMes and (Del is NULL or Del <> "Y") ' +
            ' order by FixMes desc');
    Prepare;
  end;
  with qryWT do begin    // для расчета "коэф-та рабочего времени"
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ViNuMain where TabN = :NTabN and ' +
            ' ZaMesGod = :dDtZaMG and VidN < "6000" and CBudg = "1"');
    Prepare;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.UnPrepareQueries;
begin
  with qryUpi do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryPrmUv do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qrySps do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryPere do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryNadb do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryCmbOkl do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryFixIndx do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryWT do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormVdIndE.GetKtWT(nTabN : integer; dDtZaMG : TDateTime;
                                                  nCntChBudg : double) : double;
var nCntChWrk : double;
begin
  with qryWT do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    Open;
    nCntChWrk := 0;
    while not Eof do begin
      if FieldByName('VidN').asString < '1300' then
        nCntChWrk := nCntChWrk + FieldByName('Chas').AsFloat;
      Next;
    end;
    Close;
    Result := nCntChWrk / nCntChBudg;
    if Result > 1 then
      Result := 1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.CheckTblFixIndx(dDtZaMG: TDateTime);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.sBtnGoClick(Sender: TObject);
begin
  if qryHIndx.Active and (qryHIndx.RecordCount > 0) then
    DoSchet;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.DoSchet;
var dDtBeg, dDtPrc, dDtZaMG, dDtEZaMg, dDtBM, dLastDtPrm : TDateTime;
    {nSmOklNdbBM, nSmOklNdbIndM,} // (оклады + надбавки) тех же месяцев
    nSmToIndx, nSmIndx, {nSmDhdIndM,} nSmmIndM : double;
    {nSmDelta,} nPrcIndx, nPrSmIndx, nSmProgMinBM : double;
    bInclSovm, bIsSovm, bIsInSps, bIsCmbOkl, bIsMin, bMore : boolean;
    nCntSotr, nTabN, nCntObr : integer;
    n_CurCntDay, n_CurCntWorkDay : integer;
    nY, nM, nD : word;
    nSmTt : double;
    nKdSps, nKdObj, nKdKatP, nKdSpZ : SmallInt;
    dDtTmp, dDtDbg, dFixMes : TDateTime;
    cMsg : ShortString;
    nCntChBudg, nKtWT : double;
    nSmFixIndx, nSmTmp, nSmOklNdb, nSmDeltaOklNdb, nSmOklNdbInZaMG : double;
begin
//  dDtMesIzm := EncodeDate(2012, 7, 1); // С 07-2012 изменился порядок расчета
  dbgrTmp.Visible := true;      //       // базового месяца БМ
  dsrcTmp.DataSet := qryTmp;
  dbgrTmp.DataSource := dsrcTmp;
  dbgrHIndx.Enabled := false;
  Screen.Cursor := crSQLWait;
  PageControl.ActivePage := ts2;
  dDtPrc := qryHIndxDtProc.AsDateTime;
  dDtZaMG := qryHIndxZaMesGod.AsDateTime;
  dDtEZaMg := myLastDOM(dDtZaMG); // Последняя дата месяца dDtZaMG
  DecodeDate(dDtZaMG, nY, nM, nD);
  nCntChBudg := DmMain.Budget(nY, nM, n_CurCntDay, n_CurCntWorkDay);
  dDtBeg := EncodeDate(nY-1, nM, 1);   // отступаю на 1 год назад для выборки в
               // qryTmp. При бОльшем периоде медленно выбирает (да и не нужно)
  bInclSovm := (qryHIndxInclSovm.AsString = 'Y');
  sBtnAdd.Visible := false;
  sBtnGo.Visible := false;
  Application.ProcessMessages;
  PrepareQueries(dDtPrc, dDtBeg, dDtZaMG);
  CheckTblFixIndx(dDtZaMG);      //TYTYTYTYT
  with cdsBm do begin // индекс в прямом порядке (увеличения базового месяца)
    Last;
    dDtMaxBM := FieldByName('LastDtBM').AsDateTime;
    First;
    dDtMinBM := FieldByName('LastDtBM').AsDateTime;
  end;
  nSmProgMinBM  := GetSmProgMin(dDtZaMG);
  with qryTmp do begin   // выбираю суммы для индексации
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if b_OnlySps and (c_Tabs <> '') then
      SQL.Add('Select TabN, Sum(Summa) as SMM from ViNuMain where ' +
              'TabN in (' + c_Tabs + ') and ')
    else
      SQL.Add('Select TabN, Sum(Summa) as SMM from ViNuMain where ');
    SQL.Add(' DtProc >= :dDtBeg and ZaMesGod = :dDtZaMG and ' +
            ' VidN < "6000" and Ind = "1" group by TabN ' +
            ' Having Sum(Summa) > 0');
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    Application.ProcessMessages;
    nSmTt := 0;
    nCntSotr := 0;
    nCntObr  := 0;
    nPrcIndx := GetPrcIndInMes(dDtZaMG, dDtZaMG);
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      Inc(nCntObr);
      LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount) + '/' +
                                           IntToStr(nCntObr);
      LabelCntRec.Refresh;
      bIsCmbOkl := false;
      nSmmIndM  := FieldByName('SMM').AsFloat;  // сумма для индексации
                                                // (за идексируемый месяц)
      nSmToIndx := nSmmIndM;
      if nSmToIndx > nSmProgMinBM then
        nSmToIndx := nSmProgMinBM;
      qrySps.Close;
      qrySps.ParamByName('nTabN').AsInteger := nTabN;
      qrySps.Open;   // узнать - есть ли в списке текущего месяца
      nKdObj := 0;   // и, если есть, в каком подразделении
      nKdSps := 0;
      bIsInSps := (qrySps.RecordCount > 0);    // в списке текущего месяца
      if bIsInSps then begin
        nKdSps := qrySps.FieldByName('KdSps').AsInteger;
        nKdObj := qrySps.FieldByName('KdObj').AsInteger;
      end;
      qrySps.Close;
      qryPere.Close;
      qryPere.ParamByName('nTabN').AsInteger := nTabN;
      qryPere.ParamByName('dDtEMes').AsDateTime := dDtEZaMg;
      qryPere.Open;
      bIsSovm := (qryPere.FieldByName('Sovm').AsInteger = 1);
      nKdKatP := qryPere.FieldByName('KdKatP').AsInteger;
      if nKdSps = 0 then      // если не оказался в списке текущего месяца, то
        nKdSps := qryPere.FieldByName('KdSps').AsInteger; // выбираю из Z_PERE
      if nKdObj = 0 then      // если не оказался в списке текущего месяца, то
        nKdObj := qryPere.FieldByName('KdObj').AsInteger; // выбираю из Z_PERE

      if b_DefSchBU then
        nKdSpZ := qryPere.FieldByName('KdSpZ').AsInteger
      else
        nKdSpZ := n_KdSchBU;
      dLastDtPrm := 0;
      with qryPrmUv do begin    // Там стоит запрос: Select * from Z_PrmUv where
        Close;  //TabN = :nTabN and Dt_Priem <= :dDtEZaMG order by Dt_Priem desc
        ParamByName('nTabN').AsInteger := nTabN;
        ParamByName('dDtEZaMG').AsDateTime := dDtEZaMG;
        Open;
        if RecordCount > 0 then                      // привожу его к 1-му числу
          dLastDtPrm := MyFirstDOM(FieldByName('Dt_Priem').AsDateTime);// месяца
        Close;
      end;

      dFixMes := dDtZaMG;
      nSmFixIndx := 0;
      with qryFixIndx do begin
        Close;
        ParamByName('nTabN').AsInteger := nTabN;
        ParamByName('dFixMes').AsDateTime := dFixMes;
        Open;
        if RecordCount > 0 then
          nSmFixIndx := FieldByName('FixSmm').AsFloat;
        Close;
      end;
      nSmDeltaOklNdb := 0;
      dDtDbg := MyLastDom(dDtZaMG);
      dDtTmp := dDtZaMG;
      nSmOklNdbInZaMG := GetSmOklNdb(nTabN, dDtDbg, bIsCmbOkl);
      bMore := true;
      while bMore {(dDtTmp <= dFixMes)} do begin
        dDtTmp := MyLastDOM(dDtTmp - 28);
        nSmTmp := GetSmOklNdb(nTabN, dDtTmp, bIsCmbOkl);
        nSmDeltaOklNdb := nSmOklNdbInZaMG - nSmTmp;
        if (nSmDeltaOklNdb > 0) or (dDtTmp < dFixMes) then begin
          bMore := false;
        end;
      end;
      nSmIndx := 0;
      if (nSmDeltaOklNdb < 0) then
        nPrSmIndx := nSmFixIndx
      else if nSmDeltaOklNdb < nSmFixIndx then
        nPrSmIndx := nSmFixIndx // - nSmDeltaOklNdb
      else {if nSmDeltaOklNdb >= nSmFixIndx}
        nPrSmIndx := 0;
      nKtWT := 1;
      if nPrSmIndx > 0 then begin
        nKtWT := GetKtWT(nTabN, dDtZaMG, nCntChBudg);
        nKtWT := RoundTo(nKtWT, -3);
        nSmIndx := RoundTo(nPrSmIndx * nKtWT, -2);
      end;
      cMsg := 'Сумма к индексации = ' + FloatToStr(nSmToIndx) +
                ', DtPrm = ' + DateToStr(dLastDtPrm) + #13#10 +
                'nSmFixIndx = ' + FloatToStr(nSmFixIndx) +
                ', nSmDeltaOklNdb  = ' + FloatToStr(nSmDeltaOklNdb) +
                ', nSmProgMinBM = ' + FloatToStr(nSmProgMinBM) +
                ', nPrcIndx = ' + FloatToStr(nPrcIndx) +
                ', nKtWT = ' + FloatToStr(nKtWT) +
                ', nSmIndx = ' + FloatToStr(nSmIndx);
      if bFlagDbg and (nTabN < 0) {т.е. никогда} then
        ShowMessage(cMsg);
      AddRecToCdsP(nTabN, nKdSps, nKdObj, nKdKatP, nKdSpZ,
                   dDtZaMG, dLastDtPrm, bIsInSps, bIsCmbOkl,
                   nSmFixIndx, nSmmIndM, nSmToIndx, nPrcIndx, nPrSmIndx,
                                               nSmDeltaOklNdb, nSmIndx, nKtWT);
      Inc(nCntSotr);
      nSmTt := nSmTt + nSmIndx;
      Next;
    end;
    Close;
    dbgrTmp.Visible := false;
    dsrcTmp.DataSet := nil;
  end;
  if not bPereSchet then begin
    with cdsP do begin
      AddIndex('OnKdObjFamIO', 'KdObj;FamIO', []);
      AddIndex('OnFamIO', 'FamIO', []);
      AddIndex('OnTabN', 'TabN', []);
      AddIndex('OnSmIndx', 'SmIndx;FamIO', []);
      SetCdsPIndex;
      First;
      sBtnTots.Click;
    end; end
  else begin
    ;
  end;
  sBtnSave.Visible := true;
  sBtnSave.Enabled := (nSmTt > 0) and (nCntSotr > 0);
  sBtnGoBack.Visible := true;
  sBtnPrt.Visible := sBtnSave.Visible;
  sBtnPrt.Enabled := sBtnSave.Enabled;
  sBtnTots.Visible := true;
  sBtnPrt.Hint := 'Печать протокола расчета индексации';
  UnPrepareQueries;
(*
  if bPereschet then begin
    with qryOldNU do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select Sum(Summa) as SMM from Z_NU where TabN = :nTabN and ' +
              ' VidN = "1620" and ZaMesGod = :dDtZaMG');
      Prepare;
    end;
    PageControl.ActivePage := ts3;
    Sravnenie_1(dDtZaMG);
    qryOldNU.UnPrepare;
    if not bFlagDbg then
      Sravnenie_2;
    cdsPRs.SaveToFile(cDirVids + 'PRs' + Copy(DateToStr(dDtZaMG), 9, 2) +
                                    Copy(DateToStr(dDtZaMG), 4, 2) + '.cds');
  end;
*)
  bPereSchet := false;
end;
//------------------------------------------------------------------------------
function TFormVdIndE.GetSmOldIndx(nTabN: integer; dDtZaMG: TDateTime): double;
begin
  with qryOldNU do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    Open;
    Result := FieldByName('SMM').AsFloat;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.Sravnenie_1(dDtZaMG : TDateTime);
var nSmOldIndx : double;
begin
  with cdsPRs do begin
    First;
    while not Eof do begin
      nSmOldIndx := GetSmOldIndx(cdsPRsTabN.AsInteger, dDtZaMG);
      //if qryOtkl.Locate('TabN', cdsPRsTabN.AsInteger, []) then
      //  nSmOldIndx := qryOtklSumma.AsFloat;
      Edit;
      cdsPRsOldSmIndx.AsFloat := nSmOldIndx;
      cdsPRsSmRazn.AsFloat := cdsPRsSmIndx.AsFloat - cdsPrsOldSmIndx.AsFloat;
      Post;
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.Sravnenie_2;
var nSmOldIndx : double; nTabN : integer;
begin
  cdsPRs.DisableControls;
  with qryOtkl do begin
    DisableControls;
    First;
    while not Eof do begin
      nTabN := qryOtklTabN.AsInteger;
      if not cdsPRs.Locate('TabN', nTabN, []) then begin
        cdsPRs.Append;
        cdsPRsTabN.AsString := qryOtklTabN.AsString;
        cdsPRsBazMes.AsString := '';
        cdsPRsFamIO.AsString := qryOtklFamIO.AsString;
        cdsPRsKdSps.AsString := qryOtklKdSps.AsString;
        cdsPRsKdObj.AsString := qryOtklKdObj.AsString;
        cdsPRsKdKatP.AsString := qryOtklKdKatP.AsString;
        nSmOldIndx := qryOtklSumma.AsFloat;
        cdsPRsOldSmIndx.AsFloat := nSmOldIndx;
        cdsPRsSmRazn.AsFloat := -nSmOldIndx;
        cdsPRsKdSpZ.AsString := qryOtklKdSpZ.AsString;
        cdsPRs.Post;
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
  cdsPRs.EnableControls;
end;
//------------------------------------------------------------------------------
function TFormVdIndE.GetSmMinZp(dZaMG: TDateTime): double;
begin
  Result := 0;
  with qryMyTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from z_TPDN where DtBeg <= :dZaMG ' +
            ' order by DtBeg desc, NR desc');
    ParamByName('dZaMG').AsDateTime := dZaMG;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('MinZp2').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormVdIndE.GetSmProgMin(dDtMes: TDateTime): double;
begin
  Result := 0;
  with qryProgMin do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from z_TPDN where DtBeg <= :dZaMG ' +
            ' order by DtBeg desc, NR desc');
    ParamByName('dZaMG').AsDateTime := dDtMes;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('ProgMin2').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormVdIndE.IsMinInPredMes: boolean;
var nSvNR : SmallInt;
begin  //
  with cdsDbg do begin
    nSvNR := cdsDbgNR.AsInteger;
    Prior;
    if BOF then begin
      Result := true;
      Locate('NR', nSvNR, []); end
    else begin
      Result := cdsDbgIsMin.AsString = 'T';
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormVdIndE.GetSmOkl(nTabN : integer; dDtMes : TDateTime) : double;
var dDtZaMG, dDtEZaMG : TDateTime;
    nY, nM, nD : word;
begin
  DecodeDate(dDtMes, nY, nM, nD);
  dDtZaMG := EnCodeDate(nY, nM, 1);
  dDtEZaMG := MyLastDOM(dDtMes);
  with qryMyTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_GetOklNdb (:nTabN, :dDtZaMG, :dDtEZaMG)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    ParamByName('dDtEZaMG').AsDateTime := dDtEZaMG;
    Open;
    if (not FieldByName('p_CmbOkl').IsNull) and
           (FieldByName('p_CmbOkl').AsString = '1') then
      Result := FieldByName('n_SmCmbOkl').AsFloat
    else
      Result := FieldByName('n_SmOklTrf').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormVdIndE.GetSmOklNdb(nTabN : integer; dDtMes : TDateTime;
                                              var bIsCmbOkl : boolean) : double;
var dDtZaMG, dDtEZaMG : TDateTime;
    nY, nM, nD : word;
begin
  DecodeDate(dDtMes, nY, nM, nD);
  dDtZaMG := EnCodeDate(nY, nM, 1);
  dDtEZaMG := MyLastDOM(dDtMes);
  with qryMyTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_GetOklNdb (:nTabN, :dDtZaMG, :dDtEZaMG)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    ParamByName('dDtEZaMG').AsDateTime := dDtEZaMG;
    Open;
    Result := FieldByName('SmOklNdb').AsFloat;
    bIsCmbOkl := FieldByName('p_CmbOkl').AsString = '1';
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.AddRecToCdsP(nTabN : integer;
                                   nKdSps, nKdObj, nKdKatP, nKdSpZ : SmallInt;
                                dDtBM, dLastDtPrm : TDateTime;
                                bIsInSps, bIsCmbOkl : boolean;
                          nSmFixIndx, nSmNach, nSmToIndx, nPrcIndx, nPrSmIndx,
                                       nSmDeltaOklNdb, nSmIndx, nKtWT : double);
var cFamIO : ShortString;
begin
  with qryUpi do begin
    Close;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    cFamIO := MyFamIO(FieldByName('Fam').AsString, FieldByName('Ima').AsString,
                                                  FieldByName('Otch').AsString);
    Close;
  end;
  with cdsP do begin
    Append;
    cdsPTabN.AsInteger       := nTabN;
    cdsPKdSps.AsInteger      := nKdSps;
    cdsPKdObj.AsInteger      := nKdObj;
    cdsPKdKatP.AsInteger     := nKdKatP;
    cdsPKdSpZ.AsInteger      := nKdSpZ;
    cdsPFamIO.AsString       := cFamIO;
    if bIsCmbOkl then
      cdsPIsCmbOkl.AsBoolean := TRUE;
    if not bIsInSps then
      cdsPInSps.AsBoolean    := FALSE
    else
      cdsPInSps.AsBoolean    := TRUE;
    if dDtBM > 0 then
      cdsPBazMes.AsDateTime  := dDtBM;
    cdsPLastDtPrm.AsDateTime := dLastDtPrm;
    cdsPSmNach.AsFloat       := RoundTo(nSmNach, -2);
    if nSmToIndx < 0 then
      nSmToIndx := 0;   // Разобрться !!!!!!!
    cdsPSmToIndx.AsFloat     := RoundTo(nSmToIndx, -2);
    cdsPPrSmInd.AsFloat      := nPrSmIndx;
    cdsPDeltaOklNdb.AsFloat  := nSmDeltaOklNdb;
    cdsPPrcInd.AsFloat       := nPrcIndx;
    cdsPSmIndx.AsFloat       := nSmIndx;
    cdsPKtWT.AsFloat         := nKtWT;
    cdsPSmFIndx.AsFloat      := nSmFixIndx;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.AddRecToCdsPRs(nTabN: integer;
                           nKdSps, nKdObj, nKdKatP, nKdSpZ: SmallInt;
                           dDtBM, dLastDtPrm: TDateTime;
                           bIsInSps, bIsSovm, bIsCmbOkl, bIsMin: boolean;
                           nSmOklNdbIndM, nSmToIndx, nSmIndx, nPrcIndBM, nSmBM,
                           nPrSmInd, nSmDelta: double);
var cFamIO : ShortString;
begin
  with qryUpi do begin
    Close;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    cFamIO := MyFamIO(FieldByName('Fam').AsString, FieldByName('Ima').AsString,
                                                  FieldByName('Otch').AsString);
    Close;
  end;
  with cdsPRs do begin
    Append;
    cdsPRsTabN.AsInteger       := nTabN;
    cdsPRsKdSps.AsInteger      := nKdSps;
    cdsPRsKdObj.AsInteger      := nKdObj;
    cdsPRsKdKatP.AsInteger     := nKdKatP;
    cdsPRsKdSpZ.AsInteger      := nKdSpZ;
    cdsPRsFamIO.AsString       := cFamIO;
    if bIsSovm then
      cdsPRsIsSovm.AsBoolean   := TRUE;
    if bIsCmbOkl then
      cdsPRsIsCmbOkl.AsBoolean := TRUE;
    if not bIsInSps then
      cdsPRsInSps.AsBoolean    := FALSE
    else
      cdsPRsInSps.AsBoolean    := TRUE;
    if dDtBM > 0 then
      cdsPRsBazMes.AsDateTime  := dDtBM;
    cdsPRsLastDtPrm.AsDateTime := dLastDtPrm;
    cdsPRsSmNach.AsFloat       := RoundTo(nSmOklNdbIndM, -2);
    cdsPRsSmBm.AsFloat         := nSmBm;
    if nSmToIndx < 0 then
      nSmToIndx := 0;   // Разобрться !!!!!!!
    cdsPRsSmToIndx.AsFloat     := RoundTo(nSmToIndx, -2);
    cdsPRsPrSmInd.AsFloat      := nPrSmInd;
    //cdsPDeltaSm.AsFloat    := nSmDelta;
    cdsPRsPrcInd.AsFloat       := nPrcIndBM;
    cdsPRsSmIndx.AsFloat       := nSmIndx;
    if bIsMin then
      cdsPRsIsMin.AsBoolean    := TRUE;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.dbgrPDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrP.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if (cFldNm = 'SMINDX') or (cFldNm = 'SMTOINDX') or
                         (cFldNm = 'PRCIND') or (cFldNm = 'BAZMES') then begin
      Font.Style := [fsBold];
      if (cFldNm = 'SMINDX') or {поля, которые можно редактировать}
                         (cFldNm = 'PRCIND') or (cFldNm = 'BAZMES') then
        Brush.Color := clMoneyGreen;
    end;
    if not (gdFocused in State) then begin
//      if (qryHIndxInclSovm.AsString = 'N') and (cdsPIsSovm.AsString = 'Y') then
//        Font.Color := clGray
      if (not cdsPInSps.AsBoolean) or (cdsPSmIndx.AsFloat <= 0) then
        Font.Color := clTeal
      else
        Font.Color := clWindowText;
      if (cFldNm = 'SMINDX') and (cdsPSmIndx.AsFloat < 0) then
        Font.Color := clRed;
      if (cFldNm = 'TABN') and cdsPIsCmbOkl.AsBoolean then
        Brush.Color := clYellow;
      if (cFldNm = 'DELTAOKLNDB') and (cdsPDeltaOklNdb.AsFloat < 0) then begin
        Font.Color := clRed;
        Font.Style := [fsBold];
      end;
    end;
    if (cFldNm = 'LASTDTPRM') then begin
      if (cdsPLastDtPRM.AsDateTime > dDtMinBM) then begin
        Font.Color := clRed;
        Brush.Color := clYellow;
      end;
    end;
//    if (cFldNm = 'ISMIN') and (cdsPIsMin.AsBoolean = TRUE) then begin
//      Font.Color := clBlue;
//      Brush.Color := clSilver;
//    end;
  end;
  dbgrP.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.dbgrPRsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrPRs.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if (cFldNm = 'SMINDX') or (cFldNm = 'SMTOINDX') or (cFldNm = 'PRCIND') or
                              (cFldNm = 'BAZMES') or (cFldNm = 'OLDSMINDX') or
                                                  (cFldNm = 'SMRAZN') then begin
      Font.Style := [fsBold];
      if not (gdFocused in State) and ((cFldNm = 'SMINDX') or
             (cFldNm = 'SMTOINDX') or (cFldNm = 'PRCIND') or (cFldNm = 'BAZMES')
             or (cFldNm = 'OLDSMINDX') or (cFldNm = 'SMRAZN')) then
        Brush.Color := clMoneyGreen;
    end;
    if not (gdFocused in State) then begin
      if (qryHIndxInclSovm.AsString = 'N') and (cdsPRsIsSovm.AsString = 'Y') then
        Font.Color := clGray
      else if (not cdsPRsInSps.AsBoolean) or (cdsPRsSmIndx.AsFloat <= 0) then
        Font.Color := clTeal
      else
        Font.Color := clWindowText;
      if (cFldNm = 'SMINDX') and (cdsPRsSmIndx.AsFloat < 0) then
        Font.Color := clRed;
      if (cFldNm = 'TABN') and cdsPRsIsCmbOkl.AsBoolean then
        Brush.Color := clYellow;
    end;
    if (cFldNm = 'LASTDTPRM') then begin
      if (cdsPRsLastDtPRM.AsDateTime > dDtMinBM) then begin
        Font.Color := clRed;
        Brush.Color := clYellow;
      end;
    end;
    if (cFldNm = 'ISMIN') and (cdsPRsIsMin.AsBoolean = TRUE) then begin
      Font.Color := clBlue;
      Brush.Color := clSilver;
    end;
    if (cFldNm = 'SMRAZN') and (RoundTo(cdsPRsSmRazn.AsFloat, -2) < 0) then
      Font.Color := clRed;
  end;
  dbgrPRs.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popPopup(Sender: TObject);
begin
  popNewPaket.Visible   := false;
  popDelPaket.Visible   := false;
  popSortOtkl.Visible   := false;
  popSortP.Visible      := false;
  popTotals.Visible     := false;
  popCheckPaket.Visible := false;
  popFilter.Visible := false;
  if pop.PopupComponent = dbgrOtkl then begin
    popTotals.Visible := true;
    popTotals.Enabled := qryOtkl.Active and (qryOtkl.RecordCount > 0);
    popSortOtkl.Visible := true;
    popSortOtkl.Enabled := popTotals.Enabled; end
  else if pop.PopupComponent = dbgrP then begin
    popTotals.Visible := true;
    popTotals.Enabled := cdsP.Active and (cdsP.RecordCount > 0);
    popSortP.Visible := true;
    popSortP.Enabled := popTotals.Enabled;
    popFilter.Visible := true; end
  else if pop.PopupComponent = dbgrPRs then begin
    popTotals.Visible := true;
    popTotals.Enabled := cdsPRs.Active and (cdsPRs.RecordCount > 0);
    //popSortP.Visible := true;
    //popSortP.Enabled := popTotals.Enabled;
      end
  else if pop.PopupComponent = dbgrHIndx then begin
    popTotals.Visible := true;
    popTotals.Enabled := qryOtkl.Active and (qryOtkl.RecordCount > 0);
    popNewPaket.Visible := true;
    popDelPaket.Visible := true;
    popDelPaket.Enabled := qryHIndx.Active and (qryHIndx.RecordCount > 0) and
                                       (qryHIndxDtProc.AsDateTime = dCtrlDate);
    //popCheckPaket.Visible := true;
    //popCheckPaket.Enabled := bInCtrlMes and
    //                                    (qryHIndxTipPkt.AsString <> 'PRsch');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popSortOtklObjFIOClick(Sender: TObject);
begin
  if not popSortOtklObjFIO.Checked then begin
    popSortOtklObjFIO.Checked := true;
    popSortOtklFIO.Checked := false;
    popSortOtklTabN.Checked := false;
    popSortOtklSmIndx.Checked := false;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popSortOtklFIOClick(Sender: TObject);
begin
  if not popSortOtklFIO.Checked then begin
    popSortOtklObjFIO.Checked := false;
    popSortOtklFIO.Checked := true;
    popSortOtklTabN.Checked := false;
    popSortOtklSmIndx.Checked := false;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popSortOtklTabNClick(Sender: TObject);
begin
  if not popSortOtklTabN.Checked then begin
    popSortOtklObjFIO.Checked := false;
    popSortOtklFIO.Checked := false;
    popSortOtklTabN.Checked := true;
    popSortOtklSmIndx.Checked := false;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popSortOtklSmIndxClick(Sender: TObject);
begin
  if not popSortOtklSmIndx.Checked then begin
    popSortOtklObjFIO.Checked := False;
    popSortOtklFIO.Checked := false;
    popSortOtklTabN.Checked := false;
    popSortOtklSmIndx.Checked := true;
    OpenQryOtkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popSortPObjFIOClick(Sender: TObject);
begin
  if not popSortPObjFIO.Checked then begin
    popSortPObjFIO.Checked := true;
    popSortPFIO.Checked := false;
    popSortPTabN.Checked := false;
    popSortPSmIndx.Checked := false;
    SetCdsPIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popSortPFIOClick(Sender: TObject);
begin
  if not popSortPFIO.Checked then begin
    popSortPObjFIO.Checked := false;
    popSortPFIO.Checked := true;
    popSortPTabN.Checked := false;
    popSortPSmIndx.Checked := false;
    SetCdsPIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popSortPTabNClick(Sender: TObject);
begin
  if not popSortPTabN.Checked then begin
    popSortPObjFIO.Checked := false;
    popSortPFIO.Checked := false;
    popSortPTabN.Checked := true;
    popSortPSmIndx.Checked := false;
    SetCdsPIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popSortPSmIndxClick(Sender: TObject);
begin
  if not popSortPSmIndx.Checked then begin
    popSortPObjFIO.Checked := false;
    popSortPFIO.Checked := false;
    popSortPTabN.Checked := false;
    popSortPSmIndx.Checked := true;
    SetCdsPIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.SetCdsPIndex;
var nSvNR : integer;
begin
  nSvNR := cdsPNR.AsInteger;
  if popSortPObjFIO.Checked then
    cdsP.IndexName := 'OnKdObjFamIO'
  else if popSortPFIO.Checked then
    cdsP.IndexName := 'OnFamIO'
  else if popSortPTabN.Checked then
    cdsP.IndexName := 'OnTabN'
  else
    cdsP.IndexName := 'OnSmIndx';
  cdsP.Locate('NR', nSvNR, []);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrOtkl.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if (cFldNm = 'SUMMA') then
      Font.Style := [fsBold]
    else
      Font.Style := [];
    if not (gdFocused in State) then begin
      if (qryOtklNrVdPv.AsInteger <> qryHIndxNrVdPv.AsInteger) then
        Font.Color := clGray
      else
        Font.Color := clWindowText;
      if (cFldNm = 'SUMMA') and (qryOtklSumma.AsFloat < 0) then
        Font.Color := clRed;
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.dsrcHIndxDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcHIndx.State = dsBrowse) and qryOtkl.Active then
    sBtnGo.Enabled := qryHIndx.Active and (qryHIndx.RecordCount > 0) and
                             (qryHIndxDtProc.AsDateTime = dCtrlDate) and
                                                   (qryOtkl.RecordCount = 0);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.sBtnSaveClick(Sender: TObject);
var nTabN, nCntAdd : integer; cMsg : ShortString; nY, nM, nD : word;
    nCntTt, nSvNR : integer; dDtPrc : TDateTime;
begin
  if PageControl.ActivePage = ts2 then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
              ' Summa, KdObj, KdKatP, PdN, KdSpZ, Notes, ' +
              ' DtVdPv, NrVdPv) values (:nKdSps, :dDtProc, :dZaMesGod, ' +
              ' :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, :nPdN, :nKdSpZ, ' +
              ' :cNotes, :dDtVdPv, :nNrVdPv)');
    end;
    dDtPrc := qryHIndxDtProc.AsDateTime;
    with cdsP do begin
      First;
      nCntAdd := 0;
      while not Eof do begin
        if (cdsPInSps.IsNull or (cdsPInSps.AsString = 'T')) and
                                             (cdsPSmIndx.AsFloat > 0) then begin
          nTabN := FieldByName('TabN').AsInteger;
          if NotInSpsCurMes(nTabN, dDtPrc) then
            ShowMessage('Табельного номера ' + IntToStr(nTabN) +
                          ' нет в списке текущего месяца. Запишите!');
          qryTmp.ParamByName('nKdSps').AsInteger := FieldByName('KdSps').AsInteger;
          qryTmp.ParamByName('dDtProc').AsDateTime := qryHIndxDtProc.AsDateTime;
          qryTmp.ParamByName('dZaMesGod').AsDateTime :=
                                                      qryHIndxZaMesGod.AsDateTime;
          qryTmp.ParamByName('nTabN').AsInteger := FieldByName('TabN').AsInteger;
          qryTmp.ParamByName('cVidN').AsString := '1620';
          qryTmp.ParamByName('nSumma').AsFloat := FieldByName('SmIndx').AsFloat;
          qryTmp.ParamByName('nKdObj').AsInteger := FieldByName('KdObj').AsInteger;
          qryTmp.ParamByName('nKdKatP').AsInteger := FieldByName('KdKatP').AsInteger;
          qryTmp.ParamByName('nPdN').AsInteger := 1;
          qryTmp.ParamByName('nKdSpZ').AsInteger := FieldByName('KdSpZ').AsInteger;
          qryTmp.ParamByName('cNotes').AsString  := 'Фикс.';
                        // 'БМ = ' + Copy(FieldByName('BazMes').AsString, 4, 7);
          qryTmp.ParamByName('dDtVdPv').AsDateTime := qryHIndxDtVdPv.AsDateTime;
          qryTmp.ParamByName('nNrVdPv').AsInteger := qryHIndxNrVdPv.AsInteger;
          qryTmp.ExecSQL;
          Inc(nCntAdd);
        end;
        Next;
      end;
    end;
    if nCntAdd > 0 then begin
      Form_Dm.DbMain.ApplyUpdates([qryHIndx]);
      qryHIndx.Close;
      qryHIndx.Open;
      qryHIndx.Locate('NrVdPv', nNewVedNR, []);
      bIsSavePkt := true;
    end;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    sBtnGoBack.Click; end
  else if PageControl.ActivePage = ts3 then begin
    nCntTt := 0;
    with cdsPRs do begin
      nSvNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        if (cdsPRsSmRazn.AsFloat > 0) or (cdsPRsSmRazn.AsFloat < 0) then
          Inc(nCntTt);
        Next;
      end;
      Locate('NR', nSvNR, []);
      EnableControls;
    end;
    if nCntTt = 0 then
      ShowMessage('Нет записей для подключения (сНеНулевыми суммами разницы)')
    else begin
      DecodeDate(dCtrlDate, nY, nM, nD);
      cMsg := 'Записи с НеНулевыми суммами разницы (вего записей ' +
              IntToStr(nCntTt) + ')' + #10 + 'будут подключены ' +
              'к отклонениям для ' + MesRod(nM) + ' ' + IntToStr(nY) +
              ' г.      Согласны?:';
      if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then
        SavePRs;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.SavePRs;
var nCntAdd : integer; d_DtZaMG, d_CtrlDate : TDateTime;
    nSmProgMin : double;
    cInclSovm : ShortString;
    dDtRprMin : TDateTime;
begin
  nNewVedNr  := DmMain.NewVedNR;
  d_DtZaMG   := qryHIndxZaMesGod.AsDateTime;
  d_CtrlDate := dCtrlDate;
  nSmProgMin := qryHIndxSmProgMin.AsFloat;
  cInclSovm  := qryHIndxInclSovm.AsString;
  dDtRprMin  := qryHIndxDtRprMin.AsDateTime;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, PdN, KdSpZ, Notes, ' +
            ' DtVdPv, NrVdPv) values (:nKdSps, :dDtProc, :dZaMesGod, ' +
            ' :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, :nPdN, :nKdSpZ, ' +
            ' :cNotes, :dDtVdPv, :nNrVdPv)');
  end;
  with cdsPRs do begin
    First;
    nCntAdd := 0;
    while not Eof do begin
      if ((qryHIndxInclSovm.AsString = 'Y') or
             cdsPRsIsSovm.IsNull or (cdsPRsIsSovm.AsString = '')) and
                  (cdsPRsInSps.IsNull or (cdsPRsInSps.AsString = 'T')) and
                   not cdsPRsSmRazn.IsNull and
                                          (cdsPRsSmRazn.AsFloat <> 0) then begin
        qryTmp.ParamByName('nKdSps').AsInteger := cdsPRsKdSps.AsInteger;
        qryTmp.ParamByName('dDtProc').AsDateTime := d_CtrlDate;
        qryTmp.ParamByName('dZaMesGod').AsDateTime := d_DtZaMG;
        qryTmp.ParamByName('nTabN').AsInteger := cdsPRsTabN.AsInteger;
        qryTmp.ParamByName('cVidN').AsString := '1620';
        qryTmp.ParamByName('nSumma').AsFloat := cdsPRsSmRazn.AsFloat;
        qryTmp.ParamByName('nKdObj').AsInteger := cdsPRsKdObj.AsInteger;
        qryTmp.ParamByName('nKdKatP').AsInteger := cdsPRsKdKatP.AsInteger;
        qryTmp.ParamByName('nPdN').AsInteger := 1;
        qryTmp.ParamByName('nKdSpZ').AsInteger := cdsPRsKdSpZ.AsInteger;
        qryTmp.ParamByName('cNotes').AsString := 'БМ = ' +
                                    Copy(cdsPRsBazMes.AsString, 4, 7);
        qryTmp.ParamByName('dDtVdPv').AsDateTime := Date;
        qryTmp.ParamByName('nNrVdPv').AsInteger := nNewVedNr;
        qryTmp.ExecSQL;
        Inc(nCntAdd);
      end;
      Next;
    end;
  end;
  if nCntAdd > 0 then begin
    // Добавить запись в qryHIndx
    with qryHIndx do begin
      Append;
      qryHIndxDtProc.AsDateTime   := d_CtrlDate;
      qryHIndxZaMesGod.AsDateTime := d_DtZaMG;
      qryHIndxSmProgMin.AsFloat   := nSmProgMin;
      qryHIndxInclSovm.AsString   := cInclSovm;
      qryHIndxDtRprMin.AsDateTime := dDtRprMin;
      qryHIndxKdUsr.AsInteger     := nAppKdUsr;
      qryHIndxNrVdPv.AsInteger    := nNewVedNR;
      qryHIndxDtVdPv.AsDateTime   := Date;
      qryHIndxTipPkt.AsString     := 'PRsch';
      Post;
      bIsSavePkt := false;
    end;
    Form_Dm.DbMain.ApplyUpdates([qryHIndx]);
    qryHIndx.Close;
    qryHIndx.Open;
    qryHIndx.Locate('NrVdPv', nNewVedNR, []);
    bIsSavePkt := true;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  sBtnGoBack.Click;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.sBtnGoBackClick(Sender: TObject);
begin
  if not bIsSavePkt then begin
    if (MessageDlg('Не записаны результаты расчета. Возвращаться?:',
                                    mtWarning, [mbYes, mbNo], 0) = mrNo) then
      Exit
    else
      qryHIndx.Delete;
  end;
  if PanelTots.Visible then
    PanelTots.Visible := false;
  if cdsP.Active then
    cdsP.Close;
  sBtnAdd.Visible := true;
  sBtnAdd.Enabled := true;
  sBtnGo.Visible := true;
  sBtnGoBack.Visible := false;
  sBtnSave.Visible := false;
  sBtnPrt.Visible := sBtnSave.Visible;
  dbgrHIndx.Enabled := true;
  PageControl.ActivePage := ts1;
  dbgrHIndx.Refresh;
  OpenQryOtkl;
  if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
    LabelCntRec.Caption := 'Записей ' + IntToStr(qryOtkl.RecordCount)
  else
    LabelCntRec.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.PageControlResize(Sender: TObject);
begin
  PanelTots.Top := Round((Height - PanelTots.Height)/2);
  PanelTots.Left := Round((Width - PanelTots.Width)/2);
  PanelTotsRPs.Top := Round((Height - PanelTots.Height)/2);
  PanelTotsRPs.Left := Round((Width - PanelTots.Width)/2);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popTotalsClick(Sender: TObject);
begin
  if (PageControl.ActivePage = ts1)  and
        qryOtkl.Active and (qryOtkl.RecordCount > 0) then begin
    if qryHIndxTipPkt.AsString = 'Indx' then
      ShwOtklTotals
    else
      ShwOtklPRsTots; end
  else if (PageControl.ActivePage = ts2) and cdsP.Active and
                          (cdsP.RecordCount > 0) then
    ShwCdsPTotals
  else if (PageControl.ActivePage = ts3) and cdsPRs.Active and
                          (cdsPRs.RecordCount > 0) then
    ShwCdsPRsTotals;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.sBtnTotsClick(Sender: TObject);
begin
  if (PageControl.ActivePage = ts1)  and
        qryOtkl.Active and (qryOtkl.RecordCount > 0) then begin
    if qryHIndxTipPkt.AsString = 'Indx' then
      ShwOtklTotals
    else
      ShwOtklPRsTots; end
  else if (PageControl.ActivePage = ts2) and cdsP.Active and
                          (cdsP.RecordCount > 0) then
    ShwCdsPTotals
  else if (PageControl.ActivePage = ts3) and cdsPRs.Active and
                          (cdsPRs.RecordCount > 0) then
    ShwCdsPRsTotals;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.ShwOtklTotals;
var nSmTt : double; nCntTt, nSvNR : integer;
begin
  nSmTt := 0;
  nCntTt := 0;
  with qryOtkl do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      nSmTt := nSmTt + FieldByName('Summa').AsFloat;
      Inc(nCntTt);
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
    LabelSmTots.Caption := 'Сумма начисленного: ' +
                                     FloatToStrF(nSmTt, ffFixed, 16, 2);
    LabelCntTots.Caption := 'Сотрудников: ' + IntToStr(nCntTt);
    PanelTots.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.ShwOtklPRsTots;
var nSmDoplat, nSmUderg, nSmm : double; nCntTt, nSvNR : integer;
begin
  nSmDoplat := 0;
  nSmUderg  := 0;
  nCntTt := 0;
  with qryOtkl do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      nSmm := RoundTo(qryOtklSumma.AsFloat,-2);
      if nSmm > 0 then begin
        nSmDoplat := nSmDoplat + nSmm;
        Inc(nCntTt); end
      else if nSmm < 0 then begin
        nSmUderg := nSmUderg - nSmm;
        Inc(nCntTt);
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
    LabelSmDoplat.Caption := 'Сумма доплат: ' +
                                     FloatToStrF(nSmDoplat, ffFixed, 16, 2);
    LabelSmUderg.Caption := 'Сумма удержаний: ' +
                                     FloatToStrF(nSmUderg, ffFixed, 16, 2);
    LabelCntRPs.Caption := 'Сотрудников: ' + IntToStr(nCntTt);
    PanelTotsRPs.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.ShwCdsPRsTotals;
var nSmDoplat, nSmUderg : double; nCntTt, nSvNR : integer;
begin
  nSmDoplat := 0;
  nSmUderg  := 0;
  nCntTt := 0;
  with cdsPRs do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      if cdsPRsSmRazn.AsFloat > 0 then begin
        nSmDoplat := nSmDoplat + FieldByName('SmRazn').AsFloat;
        Inc(nCntTt); end
      else if cdsPRsSmRazn.AsFloat < 0 then begin
        nSmUderg := nSmUderg - FieldByName('SmRazn').AsFloat;
        Inc(nCntTt);
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
    LabelSmDoplat.Caption := 'Сумма доплат: ' +
                                     FloatToStrF(nSmDoplat, ffFixed, 16, 2);
    LabelSmUderg.Caption := 'Сумма удержаний: ' +
                                     FloatToStrF(nSmUderg, ffFixed, 16, 2);
    LabelCntRPs.Caption := 'Сотрудников: ' + IntToStr(nCntTt);
    PanelTotsRPs.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.ShwCdsPTotals;
var nSmTt : double; nCntTt, nSvNR : integer;
begin
  nSmTt := 0;
  nCntTt := 0;
  with cdsP do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      if (cdsPInSps.AsString = 'N') or (cdsPSmIndx.AsFloat <= 0) then begin
        Next;
        Continue;
      end;
      nSmTt := nSmTt + FieldByName('SmIndx').AsFloat;
      Inc(nCntTt);
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
    LabelSmTots.Caption := 'Сумма индексации: ' +
                                     FloatToStrF(nSmTt, ffFixed, 16, 2);
    LabelCntTots.Caption := 'Сотрудников: ' + IntToStr(nCntTt);
    PanelTots.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.qryHIndxAfterScroll(DataSet: TDataSet);
begin
  if PanelTots.Visible then
    PanelTots.Visible := false;
  if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
    LabelCntRec.Caption := 'Записей ' + IntToStr(qryOtkl.RecordCount)
  else
    LabelCntRec.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.sBtnPanelPTtHideClick(Sender: TObject);
begin
  PanelTots.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.popDelPaketClick(Sender: TObject);
begin
  if MessageDlg('Удалить полностью пакет индексации?:', mtConfirmation,
                                          [mbYes, mbNo], 0) = mrYes then begin
    // Удалить все отклонения, где NrVdPv = qryHIndxNrVdPv
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Delete from z_Otkl ' +
              ' where DtProc = :dDtPrc and NrVdPv = :nNrVdPv');
      ParamByName('dDtPrc').AsDateTime := qryHIndxDtProc.AsDateTime;
      ParamByName('nNrVdPv').AsInteger := qryHIndxNrVdPv.AsInteger;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    // Удалить запись в Z_HIndx
    qryHIndx.Delete;
    Form_Dm.DbMain.ApplyUpdates([qryHIndx]);
    sBtnGo.Enabled := qryHIndx.Active and (qryHIndx.RecordCount > 0) and
                               (qryHIndxDtProc.AsDateTime = dCtrlDate) and
                                                     (qryOtkl.RecordCount = 0);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.sBtnPrtClick(Sender: TObject);
var dDtZaMG : TDateTime;
begin
  if PageControl.ActivePage = ts1 then begin
    ShowMessage('Тут будет печать пакета индексации. Пока не готово'); end
  else if PageControl.ActivePage = ts2 then begin
    dDtZaMG := qryHIndxZaMesGod.AsDateTime;
    F6_PrtIndELog(d_DtPrc, dDtZaMG, cdsP); end   {z_CmnPrt}
  else if PageControl.ActivePage = ts3 then begin  // Пока не дошло
    //dDtZaMG := qryHIndxZaMesGod.AsDateTime;      // до пересчёта
    //F6_PrtPRsIndE(d_DtPrc, dDtZaMG, cdsPRs);   {z_CmnPrt}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.qryHIndxCalcFields(DataSet: TDataSet);
begin
  qryHIndxUsrNotes.AsString := Form_Dm.KdUsr2FioUsr(qryHIndxKdUsr.AsInteger);
end;
(*
//------------------------------------------------------------------------------
procedure TFormVdIndD.cdsBmBeforePost(DataSet: TDataSet);
begin
{
  if not cdsBmBazMes.IsNull then
    cdsBmLastDtBm.AsDateTime := MyLastDOM(cdsBmBazMes.AsDateTime)
  else
    cdsBmLastDtBm.AsString := '';
}
end;
*)
//------------------------------------------------------------------------------
procedure TFormVdIndE.dbgrPDblClick(Sender: TObject);
var nTabN : integer; cFamIO, cCdsDbgNm : ShortString;
begin
  nTabN := cdsPTabN.AsInteger;
  cFamIO := cdsPFamIO.AsString;
  cCdsDbgNm := cDirTemp + 'dbg' + IntToStr(nTabN) + '.cds';
  if FileExists(cCdsDbgNm) then
    ShwCdsDbg(nTabN, cFamIO, cCdsDbgNm, dDtMinBM, dDtRprMin)  {z_IndDbg}
  else
    ShowMessage('Не найден файл ' + cCdsDbgNm);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.dbgrPRsDblClick(Sender: TObject);
var nTabN : integer; cFamIO, cCdsDbgNm : ShortString;
begin
  nTabN := cdsPRsTabN.AsInteger;
  cFamIO := cdsPRsFamIO.AsString;
  cCdsDbgNm := cDirTemp + 'dbg' + IntToStr(nTabN) + '.cds';
  if FileExists(cCdsDbgNm) then
    ShwCdsDbg(nTabN, cFamIO, cCdsDbgNm, dDtMinBM, dDtRprMin)  {z_IndDbg}
  else
    ShowMessage('Не найден файл ' + cCdsDbgNm);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.sBtnTotsRPsClick(Sender: TObject);
begin
  PanelTotsRPs.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndE.dbgrHIndxDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrHIndx.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if qryHIndxTipPkt.AsString = 'PRsch' then
        Font.Color  := clBlue;
    end;
    if (cFldNm = 'ZAMESGOD') and not (gdFocused in State) then
      Brush.Color := clWindow;
  end;
  dbgrHIndx.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
(*
//------------------------------------------------------------------------------
function TFormVdIndE.RecPereNoIndx(nTabN: integer; dDtEBM: TDateTime): boolean;
begin
  with qryNoIndx do begin
    if Active then Close;
    ParamByName('nTabn').AsInteger := nTabN;
    ParamByName('dDtEndMes').AsDateTime := dDtEBM;
    Open;
    Result := FieldByName('NoIndx').AsString = '1';
    //Close;
  end;
end;
*)
(*
//------------------------------------------------------------------------------
function TFormVdIndE.GetSmOklNdbPredRec(nTabN : integer;
                                             var bIsCmbOkl : boolean) : double;
var dDtBeg, dDtEZaMG : TDateTime; //nY, nM, nD : word;
begin
  Result := 0;
  with qryNoIndx do begin
    First;
    while not Eof do begin
      if FieldByName('OklTrf').AsFloat > 0 then begin
        dDtBeg := FieldByName('Dt_Beg').AsDateTime;
        dDtEZaMG := MyLastDOM(dDtBeg);
        Result := GetSmOklNdb(nTabN, dDtEZaMG, bIsCmbOkl);
        Break;
      end;
      Next;
    end;
  end;
end;
*)
//------------------------------------------------------------------------------
function TFormVdIndE.NotInSpsCurMes(nTabN: integer; dDtPrc: TDateTime): boolean;
begin
//  Result := false;
  with qryInSps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count(*) as CNT from Z_SPS where TabN = :nTabN and ' +
            ' DtProc = :dDtPrc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    Result := FieldByName('Cnt').AsInteger = 0;
    Close;
    SQL.Clear;
  end;
end;
(*
//------------------------------------------------------------------------------
function TFormVdIndE.RaschetBM(nTabN : integer;
                          var dDtZaMG, dDtBM, dDtEZaMG, dLastDtPrm : TDateTime;
                  var bIsInSps, bIsSovm, bIsCmbOkl, bIsMin : boolean) : boolean;
var dDtEBM, dDtInMes, dPriorMesBM : TDateTime;
    nY, nM, nD : word;
    nSmOklNdbBM, nSmDelta, nPrSmInd, nSmIndx, nPrcIndBM : double;
    nSvSmOklNdb : double; // СуммаОклНдб индексируемого месяца (dDtZaMG)
    nSvSmmIndM : double;
    nSmProgMin, nSmProgMinBM : double;
    nSmForIndx : double;
    nSvPriorSmOklNdb, nPriorSmIndx : double;
    cDa, cCdsDbgNm : ShortString;
    nSmMinZpBM : double;
    bIsMinimal,       // сотрудник-минимальщик по ОклНдб
    bFirstMesIndx,    // 1-й базовый месяц
    bMyMes : boolean; // месяц "существенного" повышения ОклНдб
    i, nDbg : SmallInt;
begin
  // План такой:
  //    Пройти по всем месяцам от ПервогоБазового до ПоследнегоБазового
  //    и найти месяц "существенного" повышения (когда nPrSmInd > nSmDelda)
  //    Главное вернуть назад dDtBM (базовый месяц), nPrcIndBM (% индкс. БМ) и
  //    nSmIndx (СуммуИндексации заданного месяца)
//  nSmOklNdbIndM := 0;
  nPrcIndBM     := 0;
//  nSmOklNdbBM   := 0;
//  nPrSmInd      := 0;
//  nSmDelta      := 0;
  dLastDtPrm    := 0;
//  nSmIndx       := 0;
  with cdsDbg do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryPrmUv do begin  // Там стоит запрос: Select * from Z_PrmUv where
    Close;     //TabN = :nTabN and Dt_Priem <= :dDtEZaMG order by Dt_Priem desc
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtEZaMG').AsDateTime := dDtEZaMG;
    Open;
    if RecordCount > 0 then
      dLastDtPrm := MyFirstDOM(FieldByName('Dt_Priem').AsDateTime);  // привели
                                                     // его к 1-му числу месяца
    Close;
  end;
//  nSvSmmIndM := nSmmIndM;
  nSmProgMin := n_SmProgMin;
  nSvSmOklNdb := GetSmOklNdb(nTabN, dDtEZaMG, bIsCmbOkl);
  with cdsBm do begin // Сортировка прямая по DtBM
    First;            // Стали на 1-й БазовыйМесяц
    i := 0;
    nDbg := 0;
    //nPriorSmIndx := 0;
    nSvPriorSmOklNdb := 0;
    dPriorMesBM := dDtZaMG;
    while not Eof do begin
      if (cdsBmBazMes.AsDateTime < dLastDtPrm) then begin
        Next;       // пропустили базовые месяцы до даты последнего приема
        Continue;
      end;
      dDtBM := cdsBmBazMes.AsDateTime;
      dDtEBM := MyLastDOM(dDtBM);
      //dPriorMesBM := dDtBM;
      bFirstMesIndx := (dDtBM >= dLastDtPrm);
      nSmProgMinBM  := GetSmProgMin(dDtBM);
      //nPrcIndBM := qryBmPrcInd.AsFloat;
      nSmOklNdbBM := GetSmOklNdb(nTabN, dDtEBM, bIsCmbOkl);
{
      Пока отложил это дело 05-09-2012
      if nSmOklNdbBM <= 0 then begin
        // Проверить, нет ли метки NoIndx на этом месяце. Если есть, найти
        // предыдущий месяц с неПустым ОклТрф (Декретчик) и считать
        // SmOklNdb этого месяца за предшествующий.
        if RecPereNoIndx(nTabN, dDtEBM) then begin
          //ShowMessage('Есть NoIndx. TabN = ' + IntToStr(nTabN));
          // Нужно по qryNoIndx опуститься (там сортировка обратная) до ближай-
          // шего месяца с ОклТрф больше нуля и взять его SmOklNdb.
          nSmOklNdbBM := GetSmOklNdbPredRec(nTabN, bIsCmbOkl);
        end;
      end;
}
      nSmForIndx := nSmOklNdbBM;
      nSmMinZpBM := GetSmMinZp(dDtBM);
      nSmDelta := nSmOklNdbBM - nSvPriorSmOklNdb;
      bIsMinimal := GetSmOkl(nTabN, dDtEBM) = GetSmMinZp(dDtEBM);
      //nPrSmInd   := 0;
      nSmIndx    := 0;
      if (bFirstMesIndx and (i = 0)) {or (nPriorSmIndx = 0)} then begin
        Inc(i);
        if nSmForIndx > nSmProgMinBM then
          nSmForIndx := nSmProgMinBM;
        dDtInMes := dDtBM;
        nPrcIndBM := GetPrcIndInMes(dDtBM, dDtInMes);
        nPrSmInd := RoundTo(nSmForIndx * nPrcIndBM / 100, -2);//ПредполагСмИндкс
        nSmIndx := nPrSmInd;
        //nPriorSmIndx := nSmIndx;
        if nSmIndx < 0 then begin
          nSmIndx := 0;
          //nPriorSmIndx := nSmIndx;
        end;
        if (nSmIndx < nSmDelta) then begin
          dPriorMesBM := dDtBM;
          if bIsMinimal then
            cDa := 'Дм'
          else
            cDa := 'Да'; end
        else
          cDa := '';
        nSvPriorSmOklNdb := nSmOklNdbBM; end
      else if (nSmDelta > 0) {произошло повышение} {and
                                       (not bIsMinimal)} then begin
        // Надо определить "существенность" повышения ОклНдб
        if (nSmDelta > 0 {nPriorSmIndx}) then begin
          if nSmForIndx > nSmProgMinBM then
            nSmForIndx := nSmProgMinBM;
          dDtInMes := dPriorMesBM;
          nPrcIndBM := GetPrcIndInMes(dDtInMes, dDtBM);
          nPrSmInd := RoundTo(nSmForIndx * nPrcIndBM / 100, -2);//ПредполагСмИндкс
          if nSmDelta > nPrSmInd then begin
            cDa := 'Да';
            dPriorMesBM := dDtBM;
            // Изменить nSmIndx и nPriorSmIndx на новые
            nSmIndx := RoundTo(nSmForIndx * nPrcIndBM / 100, -2);
            {//nPriorSmIndx := nSmIndx;} end
          else begin
            cDa := 'Нет';
            nSmIndx := 0; //RoundTo(nSmForIndx * nPrcIndBM / 100, -2);
            //nPriorSmIndx := nSmIndx;
          end;
          {
          if (nSmDelta > nPrSmInd) and (nDbg = 0) then begin
            cDa := 'Да';
            Inc(nDbg); end
          else
            cDa := 'Нет';
          }
          if nSmIndx < 0 then begin
            nSmIndx := 0;
            //nPriorSmIndx := nSmIndx;
          end; end
        else begin
          //nPrSmInd := 0;
          nSmIndx := 0;
          nPriorSmIndx := 0;
          cDa := '';
          if nSmIndx < 0 then begin
            nSmIndx := 0;
            nPriorSmIndx := 0;
          end;
          cDa := 'Нет';
          nPrSmInd := nPriorSmIndx;
          // nSvPriorSmOklNdb := nSmOklNdbBM;
        end;
        nSvPriorSmOklNdb := nSmOklNdbBM; end
      else begin
        cDa := '';
        if bIsMinimal then
          cDa := 'Мм';
        nPrSmInd := 0; //nPriorSmIndx;
        nSvPriorSmOklNdb := nSmOklNdbBM;
      end;
      with cdsDbg do begin // Сохраняюсь в cdsDbg для разглядывания
        Append;
        cdsDbgTabN.AsInteger       := nTabN;
        cdsDbgLastPrm.AsDateTime   := dLastDtPrm;
        cdsDbgSmOklNdbIndM.AsFloat := nSvSmOklNdb;
        //cdsDbgSmToIndx.AsFloat     := Min(nSvSmmIndM, nSmProgMinBM);
        cdsDbgDtBM.AsDateTime      := dDtBM;
        cdsDbgSmOklNdbBM.AsFloat   := nSmOklNdbBM;
        cdsDbgSmProgMin.AsFloat    := nSmProgMinBM;
        cdsDbgPrcIndBM.AsFloat     := nPrcIndBM;
        cdsDbgPredpSmInd.AsFloat   := nPrSmInd;
        cdsDbgSmDelta.AsFloat      := nSmDelta;
        cdsDbgSmIndx.AsFloat       := nSmIndx;
        cdsDbgSmMinZpBM.AsFloat    := nSmMinZpBM;
        cdsDbgDtRprMin.AsDateTime  := dDtRprMin;
        cdsDbgDa.AsString          := cDa;
        if bIsMinimal then
          cdsDbgIsMin.AsBoolean    := TRUE;
        cdsDbg.Post;
      end;
      Next;
    end;
  end;
  with cdsDbg do begin    // Сортировано в прямом порядке DtBM
    if b_OnlySps then begin
      cCdsDbgNm := 'dbg' + IntToStr(nTabN) + '.cds';
      SaveToFile(cDirTemp + cCdsDbgNm);
    end;
    Last;
    while not Bof do begin    // Поднимаемся вверх по датам DtBM
      bIsMin := FieldByName('IsMin').AsBoolean;
      if (FieldByName('Da').AsString = 'Да') or
           (FieldByName('Da').AsString = 'Дм') or
             // или месяц реперный и минимальщик и в предРеперном был
             // минимальщиком - останавливаемся на этой записи
             (bIsMin and (FieldByName('DtBM').AsDateTime = dDtRprMin) and
                         IsMinInPredMes) then begin
        dDtBM         := FieldByName('DtBM').AsDateTime;
        //nSmOklNdbIndM := FieldByName('SmOklNdbIndM').AsFloat;
        //nSmmIndM      := nSvSmmIndM;
        //nSmToIndx     := FieldByName('SmToIndx').AsFloat;
        //nSmIndx     := FieldByName('SmIndx').AsFloat;
        //nPrcIndBM     := FieldByName('PrcIndBM').AsFloat;
        //nSmOklNdbBM   := FieldByName('SmOklNdbBM').AsFloat;
        //nPrSmInd      := FieldByName('PredpSmInd').AsFloat;
        //nSmDelta      := FieldByName('SmDelta').AsFloat;
        //nSmIndx       := nPrcIndBM * Min(nSvSmmIndM, n_SmProgMin) / 100;
        //nSmIndx       := RoundTo(nSmIndx, -2);
        bIsMin      := FieldByName('IsMin').AsBoolean;
        Break;
      end;
      Prior;
    end;
    if bIsMin then begin
      if (dLastDtPrm >= dDtRprMin) then  // если принят позже или в репМесяце,
        bIsMin := true                   // то так минимальщиком и остается
      else if Locate('DtBM', dDtRprMin_1, []) then begin  // проверить, был ли
        bIsMin := FieldByName('IsMin').AsBoolean; // минимальщиком в ПредМесяце
        if bIsMin then while not Eof do begin // Опускаемся вниз по датам DtBM
          bIsMin := FieldByName('IsMin').AsBoolean;
          Next;
        end;
      end;
    end;
    Close;
  end;
  Result := true;
end;
*)

end.
