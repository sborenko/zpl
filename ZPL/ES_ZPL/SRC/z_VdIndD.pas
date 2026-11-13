unit z_VdIndD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, DBTables, DB, ComCtrls, ExtCtrls, Grids, DBGrids,
  Math, StdCtrls, DBClient, Menus, Provider, DModEmplIndx;

type
  TFormVdIndD = class(TForm)
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
    cdsPIsSovm: TStringField;
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
    cdsPSmBM: TFloatField;
    cdsPDeltaSM: TFloatField;
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
    cdsPIsMin: TStringField;
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
    qryNoIndx: TQuery;
    qryInSps: TQuery;
    qryGetBM: TQuery;
    qryPredMes: TQuery;
    cdsPSumFact: TFloatField;
    cdsPLastDtUv: TDateField;
    LabelCountPkt: TLabel;
    popDopVi: TMenuItem;
    popDopViPere: TMenuItem;
    popDopViNU: TMenuItem;
    cdsPSmInOtkl: TFloatField;
    cdsPSmInNU: TFloatField;
    qryInOtkl: TQuery;
    qryInNU: TQuery;
    qryWTB: TQuery;
    cdsPPrcWT: TFloatField;
    qryPWT: TQuery;
    popDopViNadb: TMenuItem;  // для расчётов nPrcWTFkt (без блн отп и ...)
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
    procedure sBtnPanelOtklTtHideClick(Sender: TObject);
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
    procedure popDopViPereClick(Sender: TObject);
    procedure popDopViNUClick(Sender: TObject);
    procedure popDopViNadbClick(Sender: TObject);
  private
    DEBUGCDS: TCLIENTDATASET;

    DmIndxExcl: TDmIndxExcl;

    dDt3333 : tDateTime;
    dDtMinBM, dDtMaxBM : TDateTime; // младший и старший "базовые" месяцы
    dDtRprMin,   // Дата, введенная в окошко "Опорный месяц для минимальщиков"
    dDtRprMin_1 : TDateTime;  // Дата предыдущего к dDtRprMin месяца
    d_DtPrc : TDateTime;
    nNewVedNr : integer;
    bIsSavePkt : boolean;
    n_SmProgMin : double;  // Чтобы записать в cdsRS
    nBudgChas{, nCntWrkChas} : double;
    b_DefSchBU : boolean;
    b_OnlySps : boolean;
    c_Tabs : string;
    n_KdSchBU : SmallInt;
    c_SchBU : ShortString;
    b_PereSchet : boolean;
    dDtZamg : TDateTime; // первое число индексируемого месяца
    procedure OpenQryHIndx;
    procedure OpenQryOtkl;
    procedure CreOpenCdsBM(dIndMes : TDateTime);
    procedure CreOpenCdsPRs(dDtZaMG : TDateTime);
    procedure DoSchet;
    procedure ProcessEmployee(qryNU: TQuery);
    procedure PrepareQueries(dDtPrc, dDtBeg, dDtZaMG : TDateTime);
    procedure UnPrepareQueries;
    procedure AddRecToCdsP(nTabN : integer;
                                nKdSps, nKdObj, nKdKatP, nKdSpZ : SmallInt;
                                dDtBM, dLastDtPrm, dLastDtUv  : TDateTime;
                                bIsInSps, bIsSovm, bIsCmbOkl, bIsMin : boolean;
                                nSmOklNdbIndM, nSmInOtkl, nSmInNu, nSmToIndx,
                                nSmIndx, nPrcIndBM, {nSmBM} nPrcWT, nPrSmInd,
                                                               nSmDelta : double);
    procedure SetCdsPIndex;
    procedure AddRecToCdsPRs(nTabN : integer;
                                nKdSps, nKdObj, nKdKatP, nKdSpZ : SmallInt;
                                dDtBM, dLastDtPrm : TDateTime;
                                bIsInSps, bIsSovm, bIsCmbOkl, bIsMin : boolean;
                                nSmOklNdbIndM, nSmToIndx, nSmIndx,
                                nPrcIndBM, nSmBM, nPrSmInd, nSmDelta : double);
    function GetSmOklNdb(nTabN : integer; dDtMes : TDateTime;
                                              var bIsCmbOkl : boolean) : double;
    procedure ShwOtklTotals;
    procedure ShwCdsPRsTotals;
    procedure ShwCdsPTotals;
    procedure ShwOtklPRsTots;
//    function IsMinInPredMes : boolean;
    procedure Sravnenie_1(dDtZaMG : TDateTime);
    function GetSmOldIndx(nTabN : integer; dDtZaMG : TDateTime) : double;
    procedure Sravnenie_2;
    procedure SavePRs;
//    function RecPereNoIndx(nTabN : integer; dDtEBM : TDateTime) : boolean;
//    function GetSmOklNdbPredRec(nTabN : integer;
//                                             var bIsCmbOkl : boolean) : double;
    function NotInSpsCurMes(nTabN : integer; dDtPrc : TDateTime) : boolean;
    function GetBM(TabN: integer; AsOfMnth: TDateTime): TDateTime;
    function GetPrcWTFkt(nTabN: integer; dDtZaMG: TDateTime): double;
    function GetThisMonthIndxFromOtkl(nTabN: integer; dDtPrc, dDtZaMG: TDateTime): double;
    function GetThisMonthIndxFromNU(nTabN: integer; dDtPrc, dDtZaMG: TDateTime): double;
    function WasWorkingInIndxMonth(nTabN: integer; dDtZaMG: TDateTime; var dLastDtPrm,
        dLastDtUv: TDateTime): boolean;
    function IsInCurrentSps(nTabN: integer; var nKdSps, nKdObj: integer): boolean;
    procedure GetKatPSpZ(nTabN: integer; var nKdKatP, nKdSpZ: integer; var bIsSovm: boolean);
    function CalcOtrabWTFromNU(nTabN: integer; dZaMesGod: TDateTime;
      nOklad, HrsInMnth: Double; CmbOkl: Boolean): double;
    function GetCombOkl(nTabN: integer; dZaMesGod: TDateTime): double;
  public
    { Public declarations }
  end;

procedure ShwVdIndD(dDtPrc : TDateTime);

const SECTION = 'z_VdIndD';

var
  FormVdIndD: TFormVdIndD;

implementation

uses
  a_Const, a_Dm, z_Dm, z_Main, a_Lib, z_VdIndY, z_IndDbg, z_ViPere, z_ViNU,
  z_CmnPrt, z_DmSpan, DateLib, FILELIB, LOGLIB;

{$R *.dfm}

FUNCTION PREPAREDEBUGCDS: TCLIENTDATASET;
BEGIN
  RESULT := TCLIENTDATASET.CREATE(NIL);

  WITH RESULT DO BEGIN
    IF FILEEXISTS('INDX_AUDIT.CDS') THEN
      LoadFromFile('INDX_AUDIT.CDS')
    ELSE BEGIN
      FIELDDEFS.ADD('EMPLID', FTINTEGER);
      FIELDDEFS.ADD('COEFF', FTFLOAT);

      CREATEDATASET;
    END;

    OPEN;
  END;
END;

PROCEDURE LOGEMPLCOEFF(
  CDS: TCLIENTDATASET;
  TABN: INTEGER;
  PRCWTFAKT: DOUBLE);
BEGIN
  PRCWTFAKT := RoundTo(PRCWTFAKT, -4);

  WITH CDS DO
    IF LOCATE('EMPLID', TABN, []) THEN BEGIN
      IF FIELDBYNAME('COEFF').ASFLOAT <> PRCWTFAKT THEN BEGIN
        LOGUTILS.Log(INTTOSTR(TABN) + ' ' +
          FLOATTOSTR(FIELDBYNAME('COEFF').ASFLOAT) + ' ' +
          FLOATTOSTR(PRCWTFAKT)
        );
        EDIT;
        FIELDBYNAME('COEFF').ASFLOAT := PRCWTFAKT;
        POST;
      END;
    END ELSE BEGIN
        LOGUTILS.Log(INTTOSTR(TABN) + ' ' +
          'NULL' + ' ' +
          FLOATTOSTR(PRCWTFAKT)
        );
        APPEND;
        FIELDBYNAME('EMPLID').ASINTEGER := TABN;
        FIELDBYNAME('COEFF').ASFLOAT := PRCWTFAKT;
        POST;
    END;
END;

PROCEDURE CLOSEDEBUGCDS(CDS: TCLIENTDATASET);
BEGIN
  WITH CDS DO BEGIN
    SAVETOFILE('INDX_AUDIT.CDS');
    FREE;
  END;
END;

//------------------------------------------------------------------------------
procedure ShwVdIndD(dDtPrc : TDateTime);
begin
  if FormVdIndD = nil then begin
    FormVdIndD := TFormVdIndD.Create(Application);

    with FormVdIndD do begin
      b_Pereschet := false;
      dDt3333 := EncodeDate(3333, 12, 31);
      Caption := 'Пакеты индексации  {Видны все. Новый - "текущий"}';
      d_DtPrc := dDtPrc;
      OpenQryHIndx;
      OpenQryOtkl;
      if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
        LabelCntRec.Caption := 'Записей ' + IntToStr(qryOtkl.RecordCount)
      else
        LabelCntRec.Caption := '';       // (Это проверка пакета индексации) -
      popCheckPaket.Visible := false; // bFlagDbg; // - ею пользоваться нельзя
                                       // т.к. индекса-
      ShowModal;  // ции "фиксированная" и "текущая" у нас оказались по одному
      Free;       // виду - 1620 (Индексация)
    end {with}
  end else
    FormVdIndD.Activate;
end;
{
//------------------------------------------------------------------------------
function TFormVdIndD.GetPrcIndInMes(dDtBM, dInMes: TDateTime): double;
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
}
//------------------------------------------------------------------------------
procedure TFormVdIndD.OpenQryHIndx;
begin
  with qryHIndx do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_HIndx order by ZaMesGod, NR');
    Open;
    LabelCountPkt.Caption := 'Пакетов: ' + IntToStr(RecordCount);
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.OpenQryOtkl;
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
procedure TFormVdIndD.CreOpenCdsBM(dIndMes: TDateTime);
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
procedure TFormVdIndD.CreOpenCdsPRs(dDtZaMG: TDateTime);
begin
  with cdsPRs do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.sBtnAddClick(Sender: TObject);
var dDtPrc, dDtZaMG, dMesChngMinZp : TDateTime; nSmProgMin : double;
    bInclSovm : boolean; nY, nM, nD : word;
begin
//////////////////  if PanelOtklTt.Visible then
//////////////////    PanelOtklTt.Visible := false;
  dDtPrc := d_DtPrc;
  dDtZaMG := 0;
  nSmProgMin := 0;
  bInclSovm := false;     {"текущая" индексация}
  if AddVdIndY(dDtPrc, dDtZaMG, dMesChngMinZp, nSmProgMin, bInclSovm, {z_VdIndY}
                   b_DefSchBU, b_OnlySps, c_Tabs, n_KdSchBU, c_SchBU) then begin
    sBtnAdd.Enabled := false;
    sBtnGo.Enabled  := true;
    n_SmProgMin := nSmProgMin;
    dDtRprMin := dMesChngMinZp;
    DecodeDate(dDtRprMin, nY, nM, nD);
    nM := nM - 1;
    if nM < 1 then begin
      nM := 12;
      nY := nY - 1;
    end;
    dDtRprMin_1 := EncodeDate(nY, nM, 1);
    CreOpenCdsBM(dDtZaMG);
    with qryHIndx do begin
      nNewVedNr := DmMain.NewVedNR;
      Append;
      qryHIndxDtProc.AsDateTime   := dDtPrc;
      qryHIndxZaMesGod.AsDateTime := dDtZaMG;
      qryHIndxSmProgMin.AsFloat   := nSmProgMin;
      if bInclSovm then
        qryHIndxInclSovm.AsString := 'Y'
      else
        qryHIndxInclSovm.AsString := 'N';
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
procedure TFormVdIndD.popCheckPaketClick(Sender: TObject);
var {dDtPrc,} dDtZaMG, dMesChngMinZp : TDateTime; {nSmProgMin : double;}
    {bInclSovm : boolean;} nY, nM, nD : word;
begin
  b_Pereschet := true;
  { План перепроверкт:
    - Сделать расчет по новому алгоритму (07-2012) для ZaMG текущего пакета
    - Результаты собрать в cdsCheck и туда же выбрать результаты из текущего
      пакета
    - На ts3 вывести сравнительные результаты с возможностью сохранения в
      отклонения текущего месяца, либо в какую-то таблицу для последующего
      подклячения в отклонения
  }
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
  b_Pereschet := false;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.FormCreate(Sender: TObject);
var nSortP, nSortO : Smallint;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
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
  LabelCountPkt.Caption := '';
  LabelCntRec.Caption := '';
  if FileExists(cDirVids + 'HIndx_00.vid') then
    dbgrHIndx.Columns.LoadFromFile(cDirVids + 'HIndx_00.vid');
  if FileExists(cDirVids + 'HIndx04.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'HIndx04.vid');
  if FileExists(cDirVids + 'IndxP_11.vid') then
    dbgrP.Columns.LoadFromFile(cDirVids + 'IndxP_11.vid');
  if FileExists(cDirVids + 'HIndx_12.vid') then
    dbgrPRs.Columns.LoadFromFile(cDirVids + 'HIndx_12.vid');
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrHIndx.Columns.SaveToFile(cDirVids + 'HIndx_00.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'HIndx04.vid');
  dbgrP.Columns.SaveToFile(cDirVids + 'IndxP_11.vid');
  dbgrPRs.Columns.SaveToFile(cDirVids + 'HIndx_12.vid');
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
  FormVdIndD := nil;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.cdsOtklCalcFields(DataSet: TDataSet);
begin
  qryOtklFamIO.AsString := MyFamIO(qryOtklFam.AsString, qryOtklIma.AsString,
                                                         qryOtklOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TFormVdIndD.PrepareQueries(dDtPrc, dDtBeg, dDtZaMG : TDateTime);
begin
  with cdsP do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    CreateDataSet;
    Open;
  end;

  with qryOldNU do begin // для проверки - не была уже начислена индексация
    InitQuery(qryOldNU); // и, если была, то какая сумма
    SQL.Add('select Sum(Summa) as SMM from Z_NU' +
        ' where TabN = :nTabN' +
        ' and VidN = "1620" and ZaMesGod = :dDtZaMG');
    Prepare;
  end;

  with qryUpi do begin
    InitQuery(qryUpi);
    SQL.Add('select * from Z_Upi where TabN = :nTabN');
    Prepare;
  end;

  with qryPrmUv do begin // для определения, работал ли в месяце индексации
    InitQuery(qryPrmUv);
    SQL.Add('select first 1 * from Z_PrmUv' +
        ' where TabN = :nTabN and Dt_Priem <= :dDtEZaMG' +
        ' order by Dt_Priem desc');
    Prepare;
  end;

  with qrySps do begin    // чтобы узнать - есть ли в списке текущего месяца
    InitQuery(qrySps);    // и, если есть, в каком подразделении
    SQL.Add('select * from Z_Sps' +
        ' where TabN = :nTabN and DtProc = :dDtPrc' +
        ' order by KdObj'); // чтобы получать самый малый
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Prepare;
  end;

  with qryPere do begin   // для получения "параметров" сотрудника в
    InitQuery(qryPere); // базовом месяце и месяце ЗаМГ (особенно оклада)
    SQL.Add('select p.TabN, p.Dt_Beg, p.CmbOkl, p.OklTrf, p.Sovm,' +
        ' p.KdKatP, p.KdSps, p.KdObj, p.KdSpZ, p.Spec_NR,' +
        ' Sum(co.OklTrf) as SmCmbOkl' +
        ' from Z_Pere p' +
        ' left outer join z_CmbOkl co on co.TabN = p.TabN' +
        ' and co.Spec_NR = p.Spec_NR' +
        ' where p.TabN = :nTabN and p.Dt_Beg <= :dDtEMes' +
        ' group by p.TabN, p.Dt_Beg, p.CmbOkl, p.OklTrf, p.Sovm,' +
        ' p.KdKatP, p.KdSps, p.KdObj, p.KdSpZ, p.Spec_NR' +
        ' order by p.Dt_Beg desc');
    Prepare;
  end;

  with qryNadb do begin   // для получения сумм надбавок базового и
    InitQuery(qryNadb);   // индексируемого месяцев
    // Ниже как было до 20-01-2010
    //SQL.Add('Select * from z_Nadb where TabN = :nTabN and ' +
    //        ' (Dt_End is Null or Dt_End >= :dDtBegBM) order by dt_Beg desc ');
    // С 20-01-10 стало так:
    SQL.Add('Select n.*, v.Ind from z_Nadb n ' +
        ' Left Outer Join z_KdVidN v on v.VidN = n.VidN ' +
        ' where n.TabN = :nTabN and v.Ind = "1" and ' +     // добавилась
        ' (n.Dt_End is Null or n.Dt_End >= :dDtBegBM) ' +   // проверка на
        ' order by n.dt_Beg desc');       // "индексируемость" (v.Ind = "1")
    Prepare;
  end;

  with qryCmbOkl do begin // В случаях, когда в базовом или индексируемом месяце
    InitQuery(qryCmbOkl); // сотрудник работал на комб.окладе, просто высчитываю
                          // заработки в базовом и индексируемом месяцах.
    SQL.Add('Select ZaMesGod, Sum(Summa) as SMM from ViNuMain ' +
        ' where TabN = :nTabN and DtProc >= :dDtBeg and ' +
        ' ZaMesGod in (:dDtBegBM,:dDtBegIndM) and ' +
        ' VidN < "6000" and Ind = "1" group by ZaMesGod');
    ParamByName('dDtBeg').AsDateTime := dDtBeg; // остальное (:nTabN, :dDtBegBM
    Prepare;                        // и :dDtBegIndM) будет вставляться по ходу
  end;

  with qryNoIndx do begin // для выявления "декретности"
    InitQuery(qryNoIndx);
    SQL.Add('Select * from Z_Pere where TabN = :nTabN and ' +
        ' Dt_Beg <= :dDtEndMes order by Dt_Beg desc');
    Prepare;
  end;

  with qryGetBM do begin  // найти базовый месяц для индексируемого месяца
    InitQuery(qryGetBM);
    SQL.Add(
      'select first 1 * ' +
      'from Z_Pere ' +
      'where TabN = :TabN and BM = "Y" and Dt_Beg <= :OnDate ' +
      'order by Dt_Beg desc'
    );
    Prepare;
  end;

  with qryInNU do begin   // для проверки суммы в начислениях
    InitQuery(qryInNU);
    SQL.Add('select Round(Sum(Summa), 2) Sm_NU from ViNuMain' +
        ' where TabN = :nTabN and VidN = "1620" and' +
        ' DtProc = :dDtPrc and ZaMesGod = :dDtZaMG');
    Prepare;
  end;

  with qryInOtkl do begin // для проверки суммы в отконениях
    InitQuery(qryInOtkl);
    SQL.Add('select Round(Sum(Summa), 2) Sm_Otkl from ViOtkl ' +
        ' where TabN = :nTabN and VidN = "1620" and ' +
        ' DtProc = :dDtPrc and ZaMesGod = :dDtZaMG and ' +
        ' (not Upper(Notes) Containing "фикс")');
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVdIndD.UnPrepareQueries;
begin
  ReleaseQuery(qryUpi);
  ReleaseQuery(qryOldNU);
  ReleaseQuery(qryPrmUv);
  ReleaseQuery(qrySps);
  ReleaseQuery(qryPere);
  ReleaseQuery(qryNadb);
  ReleaseQuery(qryCmbOkl);
  ReleaseQuery(qryNoIndx);
  ReleaseQuery(qryGetBM);
  ReleaseQuery(qryInNU);
  ReleaseQuery(qryInOtkl);
end;

//------------------------------------------------------------------------------
procedure TFormVdIndD.sBtnGoClick(Sender: TObject);
begin
  if qryHIndx.Active and (qryHIndx.RecordCount > 0) then
    DoSchet;
end;

//------------------------------------------------------------------------------
procedure TFormVdIndD.DoSchet;
var dDtBeg, dDtPrc: TDateTime;
    nY, nM, nD : word;
    nCntDay, nCntWorkDay : integer;
begin
  DEBUGCDS := PREPAREDEBUGCDS;
  LOGUTILS.StartLogging('INDX_AUDIT.TXT');

  // С 07-2012 изменился порядок расчета базового месяца БМ
  // dDtMesIzm := EncodeDate(2012, 7, 1);
  dbgrTmp.Visible := true;
  dsrcTmp.DataSet := qryTmp;
  dbgrTmp.DataSource := dsrcTmp;
  dbgrHIndx.Enabled := false;
  Screen.Cursor := crSQLWait;
  PageControl.ActivePage := ts2;
  dDtPrc := qryHIndxDtProc.AsDateTime;
  dDtZaMG := qryHIndxZaMesGod.AsDateTime;
  DecodeDate(dDtZaMG, nY, nM, nD);
  dDtBeg := EncodeDate(nY, nM, 1);

  nBudgChas := DmMain.Budget(nY, nM, nCntDay, nCntWorkDay);
  sBtnAdd.Visible := false;
  sBtnGo.Visible := false;
  Application.ProcessMessages;
  PrepareQueries(dDtPrc, dDtBeg, dDtZaMG);
  with cdsBm do begin // индекс в прямом порядке (увеличения базового месяца)
    Last;
    dDtMaxBM := FieldByName('LastDtBM').AsDateTime;
    First;
    dDtMinBM := FieldByName('LastDtBM').AsDateTime;
  end;
  with qryTmp do begin   // выбираю суммы для индексации
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if b_OnlySps and (c_Tabs <> '') then begin  // выборка ТабН по списку
      SQL.Add('Select TabN, Sum(Summa) as SMM from ViNuMain where ');
      SQL.Add(' DtProc >= :dDtBeg and ZaMesGod = :dDtZaMG and ' +
            ' VidN < "6000" and Ind = "1" and ' +
            ' TabN in (' + c_Tabs + ') ' +
            ' group by TabN ' +
            ' Having Sum(Summa) > 0'); end
    else begin                                  // выборка всех ТабН
      SQL.Add('Select TabN, Sum(Summa) as SMM from ViNuMain where ');
      SQL.Add(' DtProc >= :dDtBeg and ZaMesGod = :dDtZaMG and ' +
              ' VidN < "6000" and Ind = "1" group by TabN ' +
              ' Having Sum(Summa) > 0');
    end;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    Application.ProcessMessages;

    // Модуль данных для определения необходимости индексации для сотрудника
    DmIndxExcl := TDmIndxExcl.PrepEmplIsExcl(dDtZaMG);

    while not Eof do begin
      ProcessEmployee(qryTmp);

      Next;
      Application.ProcessMessages;
    end;
    Close;

    // Освобождаем. Больше не нужен.
    DmIndxExcl.Free;

    dbgrTmp.Visible := false;
    dsrcTmp.DataSet := nil;
  end;
  if not b_Pereschet then begin
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
  end;
  sBtnSave.Visible := true;
  sBtnGoBack.Visible := true;
  sBtnPrt.Visible := sBtnSave.Visible;
  sBtnPrt.Enabled := sBtnSave.Enabled;
  sBtnTots.Visible := true;
  sBtnPrt.Hint := 'Печать протокола расчета индексации';
  UnPrepareQueries;
  if b_Pereschet then begin
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
    cdsPRs.SaveToFile(cDirTemp{Vids} + 'PRs' + Copy(DateToStr(dDtZaMG), 9, 2) +
                                    Copy(DateToStr(dDtZaMG), 4, 2) + '.cds');
  end;
  b_Pereschet := false;

  CLOSEDEBUGCDS(DEBUGCDS);
  LOGUTILS.EndLogging;
end;

//- SB -------------------------------------------------------------------------
// Обработка одного сотрудника (текущей записи qryNU
//------------------------------------------------------------------------------
procedure TFormVdIndD.ProcessEmployee(qryNU: TQuery);
var
  nTabN: integer;
  nChasInMonth: double;
  nSmOldIndx, nSmInOtkl, nSmInNU,
  nPrcIndBM, nSmProgMin, nPrcWT, nPrcWTFakt, nOklad,
  nSmDohodMes, nSmToIndx, nSmIndx, nSmIndxF, nSmDelta: double;
  dDtPrc, dZaMGBeg, dZaMGEnd, dDtBM: TDateTime;
  bIsCmbOkl, bWasWorking, bIsInSps, bIsSovm: boolean;
  nKdSps, nKdObj, nKdKatP, nKdSpZ: integer;
  bIsMin: boolean;
  dLastDtPrm, dLastDtUv: TDateTime;
  pereInfo: TPereInf;
  IndxExcl: Boolean;
begin
  with qryNU do begin
    nTabN := FieldByName('TabN').AsInteger;
    nSmDohodMes := FieldByName('SMM').AsFloat; // Сумма ДОХОДА для индексации

    dDtPrc := qryHIndxDtProc.AsDateTime;
    dZaMGBeg := qryHIndxZaMesGod.AsDateTime;
    dZaMGEnd := MyLastDOM(dZaMGBeg);

    // базовый месяц по полям БМ и ДтБМ
    dDtBM := GetBM(nTabN, dZaMGBeg);

    // Получить статус исключённости из индексации по зарплате.
    IndxExcl := DmIndxExcl.EmplIsIndxExcl(nTabN);

    // Если исключён, значит у него где-то индексируеся стипендия.
    // Зарплату в этом случае не индексируем.
    // Так делать нельзя: если по ошибке посчитали индексацию в прошлых месяцах,
    // при пересчёте нужно сделать отклонение с отрицательной суммой. Поэтому,
    // здесь не выходим, а просто дальше обнуляем %раб.времени и пускаем
    // по стандартной схеме.
    // if IndxExcl then
    //   exit;

    nSmProgMin := n_SmProgMin;

    // Процент рабочего времени и оклад из перемещений
    DMSpan.GetPereInfR(nTabN, dZaMGEnd, pereInfo);

    nPrcWT := pereInfo.nPrcWrkTime;
    bIsCmbOkl := pereInfo.bCmbOkl;

    if bIsCmbOkl then
      nOklad := GetCombOkl(nTabN, dZaMGBeg)
    else
      nOklad := pereInfo.nOklTrf;

    nChasInMonth := DmMain.CountWorkChas(dZaMGBeg, dZaMGEnd);

    nPrcWTFakt :=
      CalcOtrabWTFromNU(nTabN, dZaMGBeg, nOklad, nChasInMonth, bIsCmbOkl);

    if IndxExcl then
      nPrcWTFakt := 0;

    LOGEMPLCOEFF(DEBUGCDS, NTABN, NPRCWTFAKT);

    // приводим прожиточный минимум
    // nPrcWT := GetPrcWTFkt(nTabN, dZaMGBeg);
    nSmProgMin := nSmProgMin * nPrcWT / 100;
    nSmProgMin := nSmProgMin * nPrcWTFakt;

    // Процент индексации для данного месяца
    if cdsBM.Locate('BazMes',dDtBM, []) then
      nPrcIndBM := cdsBMPrcInd.AsFloat
    else
      nPrcIndBM := 0;

    nSmToIndx := Min(nSmDohodMes, nSmProgMin);
    nSmIndx := RoundTo((nSmToIndx * nPrcIndBM / 100), -2);

    // Выбираем суммы ранее выполненных индексаций данного месяца
    nSmInOtkl := GetThisMonthIndxFromOtkl(nTabN, dDtPrc, dZaMGBeg);
    nSmInNU := GetThisMonthIndxFromNU(nTabN, dDtPrc, dZaMGBeg);

    // Работал ли в индексируемом месяце
    bWasWorking := WasWorkingInIndxMonth(nTabN, dZaMGBeg, dLastDtPrm, dLastDtUv);
    bIsInSps := IsInCurrentSps(nTabN, nKdSps, nKdObj);

    nSmOldIndx := GetSmOldIndx(nTabN, dZaMGBeg);    // Не было ли  в Z_NU
    nSmIndx := nSmIndx - nSmOldIndx;               // старых начмслений

    bIsSovm := false;
    GetKatPSpZ(nTabN, nKdKatP, nKdSpZ, bIsSovm);

    if bIsSovm and (qryHIndxInclSovm.IsNull or (qryHIndxInclSovm.AsString <> 'Y')) then
      nSmIndx := 0;

    if not bWasWorking then
       nSmIndx  := 0;

    nSmIndxF := 0;
    bIsMin := false;
    nSmDelta := 0;

    if not b_Pereschet then   // для простого расчета
      AddRecToCdsP(nTabN, nKdSps, nKdObj, nKdKatP, nKdSpZ,
        dDtBM, dLastDtPrm, dLastDtUv,
        bIsInSps, bIsSovm, bIsCmbOkl, bIsMin,
        nSmDohodMes, nSmInOtkl, nSmInNu, nSmToIndx,
        nSmIndx, nPrcIndBM, nPrcWT, nSmIndxF, nSmDelta)
    else  // для пересчета расчитанного ранее пакета
      AddRecToCdsPRs(nTabN, nKdSps, nKdObj, nKdKatP, nKdSpZ, dDtBM,
        dLastDtPrm, bIsInSps, bIsSovm, bIsCmbOkl, bIsMin,
        nSmDohodMes, nSmToIndx, nSmIndx, nPrcIndBM,
        0{nSmOklNdbBM}, 1{nPrSmInd}, 2{nSmDelta});
  end; {with}
end; {ProcessEmployee}

//- SB -------------------------------------------------------------------------
function TFormVdIndD.GetThisMonthIndxFromOtkl(nTabN: integer; dDtPrc, dDtZaMG: TDateTime): double;
begin
  with qryInOtkl do begin
    Close;
    ParamByName('nTabN').Asinteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;

    Open;
    Result := FieldByName('Sm_Otkl').AsFloat;
    Close;
  end; {with}
end; {GetThisMonthIndxFromOtkl}

//- SB -------------------------------------------------------------------------
function TFormVdIndD.GetThisMonthIndxFromNU(nTabN: integer; dDtPrc, dDtZaMG: TDateTime): double;
begin
  with qryInNU do begin
    Close;
    ParamByName('nTabN').Asinteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    Open;
    Result := FieldByName('Sm_NU').AsFloat;
    Close;
  end; {with}
end; {GetThisMonthIndxFromNU}

//- SB -------------------------------------------------------------------------
function TFormVdIndD.WasWorkingInIndxMonth(nTabN: integer; dDtZaMG: TDateTime; var dLastDtPrm,
  dLastDtUv: TDateTime): boolean;
begin
  with qryPrmUv do begin
    Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtEZaMG').AsDateTime := MyLastDOM(dDtZaMG); // Последняя дата месяца dDtZaMG
    Open;

    Result := (RecordCount > 0)
      and (FieldByName('Dt_Uvoln').IsNull or (FieldByName('Dt_Uvoln').AsDateTime >= dDtZaMG));

    if Result then begin
      dLastDtPrm := FieldByName('Dt_Priem').AsDateTime;
      dLastDtUv  := FieldByName('Dt_Uvoln').AsDateTime;
    end;
    Close;
  end; {with}
end; {WasWorkingInIndxMonth}

//- SB -------------------------------------------------------------------------
// Узнать, есть ли в списке текущего месяца
// и, если есть, в каком списке и подразделении
//------------------------------------------------------------------------------
function TFormVdIndD.IsInCurrentSps(nTabN: integer; var nKdSps, nKdObj: integer): boolean;
begin
  nKdObj := 0;
  nKdSps := 0;
  with qrySps do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Result := RecordCount > 0;    // в списке текущего месяца
    if Result then begin
      nKdSps := FieldByName('KdSps').AsInteger;
      nKdObj := FieldByName('KdObj').AsInteger;
    end;
    Close;
  end; {with}
end; {IsInCurrentSps}

//- SB -------------------------------------------------------------------------
// Получить категорию персонала и счёт БУ
//------------------------------------------------------------------------------
procedure TFormVdIndD.GetKatPSpZ(
  nTabN: integer;
  var nKdKatP, nKdSpZ: integer;
  var bIsSovm: boolean);
begin
  with qryPere do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
// SB 24.09.22
// Не определялись данные для сотрудников, принятых не с 1-го числа
//     ParamByName('dDtEMes').AsDateTime := dDtZaMG;
// Будем определять на конец месяца
    ParamByName('dDtEMes').AsDateTime := DateUtils.EndOfMonth(dDtZaMG);
    Open;
    nKdKatP := FieldByName('KdKatP').AsInteger;
    nKdSpZ := FieldByName('KdSpZ').AsInteger;
    bIsSovm := FieldByName('Sovm').AsInteger <> 0;
    Close;
  end; {with}
end; {GetKatPSpZ}

//------------------------------------------------------------------------------
function TFormVdIndD.GetSmOldIndx(nTabN: integer; dDtZaMG: TDateTime): double;
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
procedure TFormVdIndD.Sravnenie_1(dDtZaMG : TDateTime);
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
procedure TFormVdIndD.Sravnenie_2;
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
function TFormVdIndD.GetSmOklNdb(nTabN : integer; dDtMes : TDateTime;
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
procedure TFormVdIndD.AddRecToCdsP(
  nTabN : integer;
  nKdSps, nKdObj, nKdKatP, nKdSpZ : SmallInt;
  dDtBM, dLastDtPrm, dLastDtUv : TDateTime;
  bIsInSps, bIsSovm, bIsCmbOkl, bIsMin : boolean;
  nSmOklNdbIndM, nSmInOtkl, nSmInNu,
  nSmToIndx, nSmIndx,
  nPrcIndBM, {nSmBM} nPrcWt, nPrSmInd, nSmDelta : double);
var
  cFamIO : ShortString;
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
    if bIsSovm then
      cdsPIsSovm.AsBoolean   := TRUE;
    if bIsCmbOkl then
      cdsPIsCmbOkl.AsBoolean := TRUE;
    if not bIsInSps then
      cdsPInSps.AsBoolean    := FALSE
    else
      cdsPInSps.AsBoolean    := TRUE;
    if dDtBM > 0 then
      cdsPBazMes.AsDateTime  := dDtBM;
    cdsPLastDtPrm.AsDateTime := dLastDtPrm;
    If dLastDtUv <> 0 then
      cdsPLastDtUv.AsDateTime  := dLastDtUv;
    cdsPSmNach.AsFloat       := RoundTo(nSmOklNdbIndM, -2);


    cdsPSmInOtkl.AsFloat     := nSmInOtkl;
    cdsPSmInNU.AsFloat       := nSmInNU;
    // cdsPSmBm.AsFloat         := nSmBm;
    if nSmToIndx < 0 then
      nSmToIndx := 0;   // Разобрться !!!!!!!
    cdsPSmToIndx.AsFloat     := RoundTo(nSmToIndx, -2);
    cdsPPrSmInd.AsFloat      := nPrSmInd;
    cdsPDeltaSm.AsFloat      := nSmDelta;
    cdsPPrcInd.AsFloat       := nPrcIndBM;
    cdsPSmIndx.AsFloat       := nSmIndx;
    if bIsMin then
      cdsPIsMin.AsBoolean    := TRUE;
    cdsPSumFact.AsFloat      := nPrSmInd;
    cdsPPrcWT.AsFloat        := nPrcWt;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.AddRecToCdsPRs(nTabN: integer;
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
    cdsPDeltaSm.AsFloat        := nSmDelta;
    cdsPRsPrcInd.AsFloat       := nPrcIndBM;
    cdsPRsSmIndx.AsFloat       := nSmIndx;
    if bIsMin then
      cdsPRsIsMin.AsBoolean    := TRUE;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.dbgrPDrawColumnCell(Sender: TObject; const Rect: TRect;
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
      if (qryHIndxInclSovm.AsString = 'N') and (cdsPIsSovm.AsString = 'Y') then
        Font.Color := clGray
      else if (not cdsPInSps.AsBoolean) or (cdsPSmIndx.AsFloat <= 0) then
        Font.Color := clTeal
      else
        Font.Color := clWindowText;
      if (cFldNm = 'SMINDX') and (cdsPSmIndx.AsFloat < 0) then
        Font.Color := clRed;

      if (cFldNm = 'BAZMES') and (cdsPBazMes.AsDateTime = dDt3333) then begin
        Font.Color := clRed;
        Font.Style := [fsBold];
       end;

//      if (cFldNm = 'TABN') and cdsPIsCmbOkl.AsBoolean then
//        Brush.Color := clYellow;
    end;
{
    if (cFldNm = 'LASTDTPRM') then begin
      if (cdsPLastDtPRM.AsDateTime > dDtMinBM) then begin
        Font.Color := clRed;
        Brush.Color := clYellow;
      end;
    end;
}
    if (cFldNm = 'LASTDTUV') then begin
      if (cdsPLastDtUV.AsDateTime < dDtZaMg) and
         (cdsPLastDtUV.AsDateTime <> 0) then begin
        Font.Color := clRed;
        Brush.Color := clYellow;
      end;
    end;

    if (cFldNm = 'ISMIN') and (cdsPIsMin.AsBoolean = TRUE) then begin
      Font.Color := clBlue;
      Brush.Color := clSilver;
    end;

    if ((cFldNm = 'SMINOTKL') or (cFldNm = 'SMINNU'))  then begin
      Font.Color := clNavy;
      Brush.Color := clMoneyGreen;
    end;


  end;



  dbgrP.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.dbgrPRsDrawColumnCell(Sender: TObject; const Rect: TRect;
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
procedure TFormVdIndD.popPopup(Sender: TObject);
begin
  popNewPaket.Visible   := false;
  popDelPaket.Visible   := false;
  popSortOtkl.Visible   := false;
  popSortP.Visible      := false;
  popTotals.Visible     := false;
  popCheckPaket.Visible := false;

  popDopVi.Visible := false;
  popDopViPere.Visible := false;
  popDopViNU.Visible := false;

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
    // popDopVi.Visible := true;
    popDopViPere.Visible := true;
    popDopViNU.Visible := true; end
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
    popCheckPaket.Visible := false;  //true;
    popCheckPaket.Enabled := DmMain.InCtrlMes and
                                        (qryHIndxTipPkt.AsString <> 'PRsch');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.popSortOtklObjFIOClick(Sender: TObject);
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
procedure TFormVdIndD.popSortOtklFIOClick(Sender: TObject);
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
procedure TFormVdIndD.popSortOtklTabNClick(Sender: TObject);
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
procedure TFormVdIndD.popSortOtklSmIndxClick(Sender: TObject);
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
procedure TFormVdIndD.popSortPObjFIOClick(Sender: TObject);
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
procedure TFormVdIndD.popSortPFIOClick(Sender: TObject);
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
procedure TFormVdIndD.popSortPTabNClick(Sender: TObject);
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
procedure TFormVdIndD.popSortPSmIndxClick(Sender: TObject);
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
procedure TFormVdIndD.SetCdsPIndex;
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
procedure TFormVdIndD.dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
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
procedure TFormVdIndD.dsrcHIndxDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcHIndx.State = dsBrowse) and qryOtkl.Active then
    sBtnGo.Enabled := qryHIndx.Active and (qryHIndx.RecordCount > 0) and
                             (qryHIndxDtProc.AsDateTime = dCtrlDate) and
                                                   (qryOtkl.RecordCount = 0);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.sBtnSaveClick(Sender: TObject);
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
              ' DtVdPv, NrVdPv) values (:nKdSps, :dDtPrc, :dZaMesGod, ' +
              ' :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, :nPdN, :nKdSpZ, ' +
              ' :cNotes, :dDtVdPv, :nNrVdPv)');
    end;
    dDtPrc := qryHIndxDtProc.AsDateTime;
    with cdsP do begin
      First;
      nCntAdd := 0;
      while not Eof do begin
        if ((qryHIndxInclSovm.AsString = 'Y') or
               cdsPIsSovm.IsNull or (cdsPIsSovm.AsString = '')) and
                    (cdsPInSps.IsNull or (cdsPInSps.AsString = 'T')) and
                                             (cdsPSmIndx.AsFloat <> 0) then begin
          nTabN := FieldByName('TabN').AsInteger;
          if NotInSpsCurMes(nTabN, dDtPrc) then
            ShowMessage('Табельного номера ' + IntToStr(nTabN) +
                         ' нет в списке текущего месяца. Запишите!');
          qryTmp.ParamByName('nKdSps').AsInteger := FieldByName('KdSps').AsInteger;
          qryTmp.ParamByName('dDtPrc').AsDateTime := qryHIndxDtProc.AsDateTime;
          qryTmp.ParamByName('dZaMesGod').AsDateTime :=
                                                      qryHIndxZaMesGod.AsDateTime;
          qryTmp.ParamByName('nTabN').AsInteger := FieldByName('TabN').AsInteger;
          qryTmp.ParamByName('cVidN').AsString := '1620';
          qryTmp.ParamByName('nSumma').AsFloat := FieldByName('SmIndx').AsFloat;
          qryTmp.ParamByName('nKdObj').AsInteger := FieldByName('KdObj').AsInteger;
          qryTmp.ParamByName('nKdKatP').AsInteger := FieldByName('KdKatP').AsInteger;
          qryTmp.ParamByName('nPdN').AsInteger := 1;
          qryTmp.ParamByName('nKdSpZ').AsInteger := FieldByName('KdSpZ').AsInteger;
          qryTmp.ParamByName('cNotes').AsString := 'БМ = ' +
                                      Copy(FieldByName('BazMes').AsString, 4, 7);
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
      LabelCountPkt.Caption := 'Пакетов: ' + IntToStr(qryHIndx.RecordCount);
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
procedure TFormVdIndD.SavePRs;
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
            ' DtVdPv, NrVdPv) values (:nKdSps, :dDtPrc, :dZaMesGod, ' +
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
        qryTmp.ParamByName('dDtPrc').AsDateTime := d_CtrlDate;
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
procedure TFormVdIndD.sBtnGoBackClick(Sender: TObject);
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
procedure TFormVdIndD.PageControlResize(Sender: TObject);
begin
  PanelTots.Top := Round((Height - PanelTots.Height)/2);
  PanelTots.Left := Round((Width - PanelTots.Width)/2);
  PanelTotsRPs.Top := Round((Height - PanelTots.Height)/2);
  PanelTotsRPs.Left := Round((Width - PanelTots.Width)/2);
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.popTotalsClick(Sender: TObject);
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
procedure TFormVdIndD.sBtnTotsClick(Sender: TObject);
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
procedure TFormVdIndD.ShwOtklTotals;
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
                                     FloatToStrF(nSmTt, ffCurrency, 16, 2);
    LabelCntTots.Caption := 'Сотрудников: ' + IntToStr(nCntTt);
    PanelTots.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.ShwOtklPRsTots;
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
procedure TFormVdIndD.ShwCdsPRsTotals;
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
procedure TFormVdIndD.ShwCdsPTotals;
var nSmTt : double; nCntTt, nSvNR : integer;
begin
  nSmTt := 0;
  nCntTt := 0;
  with cdsP do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      if ((qryHIndxInclSovm.AsString = 'N') and (cdsPIsSovm.AsString = 'Y')) or
              (cdsPInSps.AsString = 'N') {or (cdsPSmIndx.AsFloat <= 0)} then begin
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
procedure TFormVdIndD.sBtnPanelOtklTtHideClick(Sender: TObject);
begin
/////////////////  PanelOtklTt.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.qryHIndxAfterScroll(DataSet: TDataSet);
begin
  if PanelTots.Visible then
    PanelTots.Visible := false;
  if qryOtkl.Active and (qryOtkl.RecordCount > 0) then
    LabelCntRec.Caption := 'Записей ' + IntToStr(qryOtkl.RecordCount)
  else
    LabelCntRec.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.sBtnPanelPTtHideClick(Sender: TObject);
begin
  PanelTots.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.popDelPaketClick(Sender: TObject);
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
    LabelCountPkt.Caption := 'Пакетов: ' + IntToStr(qryHIndx.RecordCount);

  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.sBtnPrtClick(Sender: TObject);
var dDtZaMG : TDateTime; bInclSovm : boolean;
begin
  if PageControl.ActivePage = ts1 then begin
    ShowMessage('Тут будет печать пакета индексации. Пока не готово'); end
  else if PageControl.ActivePage = ts2 then begin
    dDtZaMG := qryHIndxZaMesGod.AsDateTime;
    bInclSovm := qryHIndxInclSovm.AsString = 'Y';
    F6_PrtIndxLog(d_DtPrc, dDtZaMG, bInclSovm, cdsP); end   {z_CmnPrt}
  else if PageControl.ActivePage = ts3 then begin
    dDtZaMG := qryHIndxZaMesGod.AsDateTime;
    F6_PrtPRsIndx(d_DtPrc, dDtZaMG, cdsPRs);  {z_CmnPrt}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.qryHIndxCalcFields(DataSet: TDataSet);
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
procedure TFormVdIndD.dbgrPDblClick(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.dbgrPRsDblClick(Sender: TObject);
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
procedure TFormVdIndD.sBtnTotsRPsClick(Sender: TObject);
begin
  PanelTotsRPs.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.dbgrHIndxDrawColumnCell(Sender: TObject;
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
    if qryHIndxSmProgMin.IsNull then
      Font.Color  := clGreen;  //clTeal;  //clMaroon;
  end;

  dbgrHIndx.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
{
function TFormVdIndD.RecPereNoIndx(nTabN: integer; dDtEBM: TDateTime): boolean;
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
}
{
//------------------------------------------------------------------------------
function TFormVdIndD.GetSmOklNdbPredRec(nTabN : integer;
                                             var bIsCmbOkl : boolean) : double;
var dDtBeg, dDtEZaMG : TDateTime;
   // nY, nM, nD : word;
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
}
//------------------------------------------------------------------------------
function TFormVdIndD.NotInSpsCurMes(nTabN: integer; dDtPrc: TDateTime): boolean;
begin
  //Result := false;
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
//------------------------------------------------------------------------------
function TFormVdIndD.GetBM(
  TabN: Integer;
  AsOfMnth: TDateTime
): TDateTime;
begin
  with qryGetBM do begin
    Close;
    ParamByName('TabN').AsInteger := TabN;
    ParamByName('OnDate').AsDateTime := MyLastDOm(AsOfMnth);
    Open;

    if RecordCount > 0 then begin
      if not FieldByName('DtBM').IsNull then
        Result := FieldByName('DtBM').AsDateTime
      else
        Result := FieldByName('Dt_Beg').AsDateTime;
    end else
      Result := dDt3333;
  end;
end;

//- SB -------------------------------------------------------------------------
function TFormVdIndD.CalcOtrabWTFromNU(nTabN: integer; dZaMesGod: TDateTime;
    nOklad, HrsInMnth: double; CmbOkl: Boolean): double;
var
  nByOklActual: double;
  nWorkChas: double;
begin
  nByOklActual := 0;
  nWorkChas := 0;

  InitQuery(DMSpan.QryHelper);
  with DMSpan.QryHelper do begin
    SQL.Add(
      'select * ' +
      'from z_nu ' +
      'where TabN = :TabN ' +
        'and ZaMesGod = :ZaMesGod ' +
        // добавил вид 5007 чтобы правильно считались часы в случае неполной
        // занятости
        'and VidN in ("1002", "1003", "1004", "5007")'
    );
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('ZaMesGod').AsDateTime := dZaMesGod;
    Open;
    while not EoF do begin
      nByOklActual := nByOklActual + FieldByName('Summa').AsFloat;
      nWorkChas := nWorkChas + FieldByName('Chas').AsFloat;
      Next;
    end;
  end;

  ReleaseQuery(DMSpan.QryHelper);

  // 11.09.2024 SB:
  // Если у человека в течение индексируемого месяца изменился оклад,
  // коэффициент посчитанный по окладу не будет отражать истинное положение дел.
  // Нужно считать по часам.
  // if nOklad <> 0 then
    // Result := nByOklActual / nOklad
  // else
    // Result := nWorkChas / HrsInMnth;

  // В случае комбинированного оклада по часам считать тоже плохо, потому что
  // там часы удваиваются. Так что, считаем по часам в случае простого оклада,
  // и по окладу - в случае комбинированного. Проблема остаётся нерешённой
  // в случае если оклад комбинированный и изменился в течение индексируемого
  // месяца. Но это уже будет другая история когда-нибудь. Пока что - так.
  if CmbOkl and (nOklad <> 0) then
    Result := nByOklActual / nOklad
  else
    Result := nWorkChas / HrsInMnth;
end;

//------------------------------------------------------------------------------
procedure TFormVdIndD.popDopViPereClick(Sender: TObject);
var nTabN : integer; cFamIO: ShortString;
begin
  nTabN := cdsPTabN.AsInteger;
  cFamIO := cdsPFamIO.AsString;
  ViewPere(nTabN, cFamIO);          {z_ViPere}
end;
//------------------------------------------------------------------------------
function TFormVdIndD.GetPrcWTFkt(nTabN: integer; dDtZaMG: TDateTime): double;
var
  nPrcWrkTime: double;
begin
  Result := 100;

  InitQuery(qryWTB);

  with qryWTB do begin
    SQL.Add(
      'select first 1 PrcWrkTime from z_pere' +
      ' where TabN = :nTabN and Dt_Beg <= :dDtZaMG' +
      ' order by Dt_Beg desc'
    );

    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    Open;

    if not FieldByName('PrcWrkTime').IsNull then begin
      nPrcWrkTime := FieldByName('PrcWrkTime').AsFloat;
      if nPrcWrkTime > 0 then
        Result := nPrcWrkTime;
    end;
  end; {with}

  ReleaseQuery(qryWTB);
end;

//------------------------------------------------------------------------------
procedure TFormVdIndD.popDopViNUClick(Sender: TObject);
begin  // подглянуть в ViNuMain
;
end;
//------------------------------------------------------------------------------
procedure TFormVdIndD.popDopViNadbClick(Sender: TObject);
begin   // подглянуть в z_ViNadb
;
end;

//- SB -------------------------------------------------------------------------
function TFormVdIndD.GetCombOkl(nTabN: integer; dZaMesGod: TDateTime): double;
begin
  Result := 0;

  InitQuery(DMSpan.QryHelper);

  with DMSpan.QryHelper do begin
    SQL.Add(
      'select c.OklTrf, c.PrcOkl from z_pere p' +
      ' join z_cmbOkl c on' +
        ' c.KdSps = p.KdSps and c.TabN = p.TabN and c.Spec_Nr = p.Spec_Nr' +
      ' where	p.tabn = :TabN and p.Dt_Beg =' +
    	' (select max(Dt_Beg) from z_pere' +
        ' where TabN = p.TabN and Dt_Beg <= :ZaMesGod)'
	  );
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('ZaMesGod').AsDateTime := dZaMesGod;
    Open;

    while not EoF do begin
      Result := Result + FieldByName('OklTrf').AsFloat;
      Next;
    end;
  end;

  ReleaseQuery(DMSpan.QryHelper);
end;

end.
