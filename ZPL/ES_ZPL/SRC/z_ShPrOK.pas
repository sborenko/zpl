unit z_ShPrOK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Grids, DBGrids, Provider, DBClient, DBTables,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TFormShwPrOk = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qryPri: TQuery;
    cdsPri: TClientDataSet;
    dspPri: TDataSetProvider;
    dsrcPri: TDataSource;
    dbgrPri: TDBGrid;
    cdsPrinr_prikaza: TSmallintField;
    cdsPridt_prikaza: TDateField;
    cdsPrinr_punkta: TSmallintField;
    cdsPrikod_punkta: TIntegerField;
    cdsPridt_priem: TDateField;
    cdsPridt_vstupdolgn: TDateField;
    cdsPridt_peremecshen: TDateField;
    cdsPridt_uvoln: TDateField;
    cdsPrifam: TStringField;
    cdsPriima: TStringField;
    cdsPriotch: TStringField;
    cdsPripol: TStringField;
    cdsPriid_nomer: TStringField;
    cdsPridob: TDateField;
    cdsVvod: TClientDataSet;
    cdsVvodNrPri: TSmallintField;
    cdsVvodDtPri: TDateField;
    Label1: TLabel;
    dbeNrPri: TDBEdit;
    dsrcVvod: TDataSource;
    dbeDtPri: TDBEdit;
    LabelPriCntRec: TLabel;
    bBtnOpen: TBitBtn;
    cdsPritip_punkta: TStringField;
    cdsPrirazrabotka: TStringField;
    dbgrPere: TDBGrid;
    dbgrNadb: TDBGrid;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    qryPere: TQuery;
    dspPere: TDataSetProvider;
    cdsPere: TClientDataSet;
    dsrcPere: TDataSource;
    cdsPerenomer_v_bd: TIntegerField;
    cdsPerenr_prikaza: TStringField;
    cdsPeredt_prikaza: TDateField;
    cdsPeredt_prikaza_begin: TDateField;
    cdsPerenr_prikaza_begin: TStringField;
    cdsPereCDSDesigner: TIntegerField;
    cdsPereCDSDesigner2: TIntegerField;
    cdsPeredt_priem: TDateField;
    cdsPeredt_vstupdolgn: TDateField;
    cdsPeredt_peremecshen: TDateField;
    cdsPeredt_uvoln: TDateField;
    cdsPereCDSDesigner3: TIntegerField;
    cdsPereCDSDesigner4: TFloatField;
    cdsPereCDSDesigner5: TStringField;
    cdsPereCDSDesigner6: TIntegerField;
    cdsPereCDSDesigner7: TFloatField;
    cdsPereCDSDesigner8: TIntegerField;
    cdsPereCDSDesigner9: TStringField;
    cdsPere__: TIntegerField;
    cdsPere_: TDateField;
    cdsPereactual: TIntegerField;
    cdsPereCDSDesigner10: TSmallintField;
    cdsPerename_katp: TStringField;
    cdsPereshort_name_katp: TStringField;
    cdsPereCDSDesigner11: TStringField;
    cdsPereCDSDesigner12: TStringField;
    cdsPereCDSDesigner13: TStringField;
    cdsPereCDSDesigner14: TStringField;
    qryNadb: TQuery;
    dspNadb: TDataSetProvider;
    cdsNadb: TClientDataSet;
    dsrcNadb: TDataSource;
    cdsNadbnomer_v_bd: TIntegerField;
    cdsNadbnr_prikaza: TStringField;
    cdsNadbdt_prikaza: TDateField;
    cdsNadbdt_begin_dopl: TDateField;
    cdsNadbdt_end_dopl: TDateField;
    cdsNadbvidn: TSmallintField;
    cdsNadbname_dopl: TStringField;
    cdsNadbtype_dopl: TStringField;
    cdsNadbproc_dopl: TFloatField;
    cdsNadbsum_dopl: TFloatField;
    cdsNadbkdkatp: TSmallintField;
    cdsNadbname_katp: TStringField;
    cdsNadbshort_name_katp: TStringField;
    cdsPriTabN: TIntegerField;
    cdsPriCntURec: TSmallintField;
    qryUpi: TQuery;
    dbgrState: TDBGrid;
    Splitter3: TSplitter;
    qryState: TQuery;
    dsrcState: TDataSource;
    qryStateTABN: TIntegerField;
    qryStateKDSPS: TSmallintField;
    qryStateDT_BEG: TDateTimeField;
    qryStateKDOBJ: TSmallintField;
    qryStateSHOBJ: TStringField;
    qryStateNMOBJ: TStringField;
    qryStateKDKATP: TSmallintField;
    qryStateSHKATP: TStringField;
    qryStateNMKATP: TStringField;
    qryStatePRCWRKTIME: TFloatField;
    qryStateSO: TSmallintField;
    qryStateOKLTRF: TFloatField;
    qryStateKDDOLGN: TSmallintField;
    qryStateDOLGNOST: TStringField;
    qryStateKDSPZ: TSmallintField;
    qryStateSCHBU: TStringField;
    qryStatePSCH: TStringField;
    qryStatePR_PENS: TSmallintField;
    qryStateSOVM: TSmallintField;
    qryStatePRFS: TSmallintField;
    qryStateINV: TSmallintField;
    qryStateNR_PRIKAZA: TStringField;
    qryStateDT_PRIKAZA: TDateTimeField;
    qryStateNOTES: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBtnOpenClick(Sender: TObject);
    procedure cdsPriAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bBtnCancelClick(Sender: TObject);
    procedure dbeNrPriEnter(Sender: TObject);
    procedure dbeNrPriExit(Sender: TObject);
    procedure dbgrPriEnter(Sender: TObject);
    procedure dbgrPriExit(Sender: TObject);
    procedure cdsPriCalcFields(DataSet: TDataSet);
    procedure dbgrPriDblClick(Sender: TObject);
  private
    { Private declarations }
    n_SvNrPri, n_SvDtPri : integer;
    //d_SvDtPri : TDateTime;
    procedure SyncPereNadb;
    procedure SyncQryState;
  public
    { Public declarations }
  end;

procedure ShwPrikazuOK(dDtPrc: TDateTime);

const SECTION = 'z_ShPrOK';

var
  FormShwPrOk: TFormShwPrOk;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main, z_TUpi{, z_VbObKt, z_GtDats, z_qPere};

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwPrikazuOK(dDtPrc: TDateTime);
begin
  if not bIsFormShwPrOK then begin
    FormShwPrOk := TFormShwPrOk.Create(Application);
    with FormShwPrOk do begin
      LabelPriCntRec.Caption := '';
      with cdsVvod do begin
        if Active then Close;
        CreateDataSet;
        Open;
        Append;
        if n_SvNrPri <> 0 then
          cdsVvodNrPri.AsInteger := n_SvNrPri;
        if n_SvDtPri <> 0 then
          cdsVvodDtPri.AsDateTime := n_SvDtPri;
      end;
      with qryState do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Select s.TabN, s.KdSps, s.Dt_Beg, s.KdObj, ko.ShObj, ' +
                ' ko.NmObj, s.KdKatP, kp.ShKatP, kp.NmKatP, s.PrcWrkTime, ' +
                ' s.SO, s.OklTrf, s.KdDolgn, s.Dolgnost, ' +
                ' s.KdSpZ, ks.SchBU, ks.PSCH, s.Pr_Pens, s.Sovm, s.Prfs, ' +
                ' s.Inv, s.Nr_Prikaza, s.Dt_Prikaza, s.Notes ' +
                ' from Z_GETWRKPEREONDATE (:nTabN, :dOnDate) s ' +
                ' Left Outer Join z_KdObj ko on ko.KdObj = s.KdObj ' +
                ' Left Outer Join z_KatPers kp on kp.KdKatP = s.KdKatP ' +
                ' Left Outer Join Kd_SBU ks on ks.KdSch = s.KdSpZ');
      end;
      with qryUpi do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Select * from Z_Upi where ID = :cID order by NR desc');
      end;
      with qryPri do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := 'EsDbOk';
        SQL.Add('Select * from o_Prikaz where Nr_Prikaza = :nNrPri ' +
                ' order by nr_punkta');
      end;
      with qryPere do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := 'EsDbOk';
        SQL.Add('Select * from o_Rabota where Nr_Prikaza = :cNrPri and ' +
                ' Dt_Prikaza = :dDtPri');
      end;
      with qryNadb do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := 'EsDbOk';
        SQL.Add('Select * from o_Doplaty where Nr_Prikaza = :cNrPri and ' +
                ' Dt_Prikaza = :dDtPri');
      end;
      if Form_Dm.DbOK.Connected then
        Form_Dm.DbOK.Connected := false;
      bIsFormShwPrOK := true;
      Show;
    end; end
  else begin
    if FormShwPrOk.WindowState = wsMinimized then
      FormShwPrOk.WindowState := wsNormal;
    FormShwPrOk.SetFocus;  
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.FormCreate(Sender: TObject);
begin
  Caption := 'Работа с приказами отдела кадров';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 650);
    Width  := ReadInteger(SECTION, 'wW', 800);
    n_SvNrPri := ReadInteger(SECTION, 'nSvNrPri', 0);
    n_SvDtPri := ReadInteger(SECTION, 'nSvDtPri', 0);
//    dbgrNadb.Height := ReadInteger(SECTION, 'dbgrNadbH', 240);
//    dbgrPere.Height := ReadInteger(SECTION, 'dbgrPereH', 240);
    Free;
  end;
  if FileExists(cDirVids + 'OKPri.vid') then
    dbgrPri.Columns.LoadFromFile(cDirVids + 'OKPri.vid');
  if FileExists(cDirVids + 'OKPer.vid') then
    dbgrPere.Columns.LoadFromFile(cDirVids + 'OKPer.vid');
  if FileExists(cDirVids + 'OKNdb.vid') then
    dbgrNadb.Columns.LoadFromFile(cDirVids + 'OKNdb.vid');
  bIsFormShwPrOK := true;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormShwPrOK := false;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPri.Columns.SaveToFile(cDirVids + 'OKPri.vid');
  dbgrPere.Columns.SaveToFile(cDirVids + 'OKPer.vid');
  dbgrNadb.Columns.SaveToFile(cDirVids + 'OKNdb.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvNrPri', cdsVvodNrPri.AsInteger);
    WriteInteger(SECTION, 'nSvDtPri', Round(cdsVvodDtPri.AsFloat));
    WriteInteger(SECTION, 'dbgrNadbH', dbgrNadb.Height);
    WriteInteger(SECTION, 'dbgrPereH', dbgrPere.Height);
    Free;
  end;
  bIsFormShwPrOK := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.bBtnOpenClick(Sender: TObject);
begin
  cdsPere.Close;
  cdsNadb.Close;
  with cdsPri do begin
    if Active then Close;
    qryPri.ParamByName('nNrPri').AsInteger := cdsVvodNrPri.AsInteger;
    Open;
    LabelPriCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
  SyncPereNadb;
  SyncQryState;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.cdsPriAfterScroll(DataSet: TDataSet);
begin
  SyncPereNadb;
  SyncQryState;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.SyncPereNadb;
var cNrPri : ShortString; dDtPri : TDateTime;
begin
  cdsPere.Close;
  cdsNadb.Close;
  if cdsPri.RecordCount > 0 then begin
    cNrPri := IntToStr(cdsPriNr_Prikaza.AsInteger) +
                          '-к п.' + IntToStr(cdsPriNr_Punkta.AsInteger);
    dDtPri := cdsPriDt_Prikaza.AsDateTime;
    qryPere.ParamByName('cNrPri').AsString := cNrPri;
    qryPere.ParamByName('dDtPri').AsDateTime := dDtPri;
    cdsPere.Open;
    qryNadb.ParamByName('cNrPri').AsString := cNrPri;
    qryNadb.ParamByName('dDtPri').AsDateTime := dDtPri;
    cdsNadb.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.SyncQryState;
var nTabN : integer; dOnDate : TDateTime;
begin
  qryState.Close;
  nTabN := 0;
  if (cdsPri.RecordCount > 0) and not cdsPriTabN.IsNull and
                                (cdsPriTabN.AsString > '') then begin
    nTabN := cdsPriTabN.AsInteger;
    dOnDate := cdsPriDt_Prikaza.AsDateTime;
    qryState.ParamByName('dOnDate').AsDateTime := dOnDate;
    qryState.ParamByName('nTabN').AsInteger := nTabN;
    qryState.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.bBtnCancelClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.dbeNrPriEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.dbeNrPriExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.dbgrPriEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.dbgrPriExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

procedure TFormShwPrOk.cdsPriCalcFields(DataSet: TDataSet);
begin
  if not cdsPriId_Nomer.IsNull and (cdsPriId_Nomer.AsString > '') then
                                                   with qryUpi do begin
    if Active then Close;
    ParamByName('cID').AsString := cdsPriId_Nomer.AsString;
    Open;
    cdsPriTabN.AsInteger := FieldByName('TabN').AsInteger;
    cdsPriCntURec.AsInteger := RecordCount;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPrOk.dbgrPriDblClick(Sender: TObject);
var nTabN : integer; cID, cFam, cIma, cOtch : ShortString;
begin
  with cdsPri do begin
    ;


  end;
end;

end.
