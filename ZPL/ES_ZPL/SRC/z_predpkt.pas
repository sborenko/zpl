unit z_PredPkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, ComCtrls, Menus, DBClient;

type
  TFormShPredPkt = class(TForm)
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    qryPkt: TQuery;
    dsrcPkt: TDataSource;
    dbgrPkt: TDBGrid;
    Splitter1: TSplitter;
    dbgrNdb: TDBGrid;
    qryNdb: TQuery;
    dsrcNdb: TDataSource;
    popPkt: TPopupMenu;
    popNewPkt: TMenuItem;
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
    qryNdbKDTEMU: TSmallintField;
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
    qryNdbNRPKT: TIntegerField;
    qryNdbDTVPKT: TDateTimeField;
    qryNdbPRC_WT: TFloatField;
    qryNdbFAM: TStringField;
    qryNdbIMA: TStringField;
    qryNdbOTCH: TStringField;
    qryNdbFamIO: TStringField;
    Panel1: TPanel;
    BitBtnClose: TBitBtn;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    sbtnNewPkt: TSpeedButton;
    dbgr_Ndb: TDBGrid;
    LbxObj: TListBox;
    LbxTabN: TListBox;
    dsrc_Ndb: TDataSource;
    sBtnGetSotr: TSpeedButton;
    sBtnSaveToBD: TSpeedButton;
    qryTmp: TQuery;
    qryPktNR: TIntegerField;
    qryPktKDUSR: TSmallintField;
    qryPktNRPKT: TIntegerField;
    qryPktTIPPKT: TStringField;
    qryPktWYEAR: TSmallintField;
    qryPktDTPKT: TDateTimeField;
    qryPktDTPROC: TDateTimeField;
    qryPktZAMESGOD: TDateTimeField;
    qryPktZAMGFKT: TDateTimeField;
    qryPktNOTES: TStringField;
    updPkt: TUpdateSQL;
    cds_Ndb: TClientDataSet;
    cds_NdbNR: TAutoIncField;
    cds_NdbKdSps: TSmallintField;
    cds_NdbSpsRsch: TSmallintField;
    cds_NdbTabN: TIntegerField;
    cds_NdbVidN: TStringField;
    cds_NdbSumProc: TFloatField;
    cds_NdbSP: TStringField;
    cds_NdbPRCSOVM: TFloatField;
    cds_NdbDT_BEG: TDateTimeField;
    cds_NdbDT_END: TDateTimeField;
    cds_NdbKDTEMU: TSmallintField;
    cds_NdbKdObj: TSmallintField;
    cds_NdbKDKATP: TSmallintField;
    cds_NdbPRCHS: TStringField;
    cds_NdbPRSMM: TStringField;
    cds_NdbKdSpZ: TSmallintField;
    cds_NdbSPEC_NR: TIntegerField;
    cds_NdbNotes: TStringField;
    cds_NdbNrPrBeg: TStringField;
    cds_NdbDtPrBeg: TDateTimeField;
    cds_NdbNrPrEnd: TStringField;
    cds_NdbDtPrEnd: TDateTimeField;
    cds_NdbNrPkt: TIntegerField;
    cds_NdbDtVPkt: TDateTimeField;
    cds_NdbPRC_WT: TFloatField;
    cds_NdbFamIO: TStringField;
    cds_NdbAddedToNdb: TBooleanField;
    popNdb: TPopupMenu;
    popHead: TMenuItem;
    popByTabN: TMenuItem;
    popByFIO: TMenuItem;
    popByNr: TMenuItem;
    popDelPkt: TMenuItem;
    N1: TMenuItem;
    procedure qryNdbCalcFields(DataSet: TDataSet);
    procedure sbtnNewPktClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnGetSotrClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnSaveToBDClick(Sender: TObject);
    procedure popNdbPopup(Sender: TObject);
    procedure popByNrClick(Sender: TObject);
    procedure popByTabNClick(Sender: TObject);
    procedure popByFIOClick(Sender: TObject);
    procedure popDelPktClick(Sender: TObject);
    procedure popPktPopup(Sender: TObject);
  private
    nNewNrVedWithWiz : integer;  // Äëÿ ñëó÷àÿ íîâîãî ïàêåòà ñ ïîìîøíèêîì
    bByNr, bByTabN, bByFIO : boolean;
    procedure OpenQryPkt;
    procedure OpenQryNdb;
    function  NewVedNr : integer;
    procedure AddRecInNdb;
    procedure AddRecInPredPkt(nNewNrVedWithWiz:integer; n_KdUsr: SmallInt;
                              d_DtProc, Date: TDatetime);
  public
    procedure CloseFormVvSotr(b_IsFormVbSotr: boolean);
  end;

procedure ShwPredPkt;

const SECTION = 'z_PredPkt';

var
  FormShPredPkt: TFormShPredPkt;
  bIsFormGtSotr : boolean;
  n_KdSps : smallint;
  d_DtProc : TDateTime;

implementation

uses
  a_Const, a_Dm, a_Lib, z_CmnPrt, z_DlgSNR, z_Dm, z_FFam, z_GtMPkt, z_GtSotr,
  z_GtPrSp, z_Main, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwPredPkt;
begin
  n_KdSps := 1;
  d_DtProc := dDtProc;
  FormShPredPkt := TFormShPredPkt.Create(Application);
  with FormShPredPkt do begin
    Caption := ' Ïàêåòû "ÑïåöÍàäáàâîê"';
    bIsFormGtSotr := false;
    OpenQryPkt;
    OpenQryNdb;
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShPredPkt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 300);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 560);
    Width  := ReadInteger(SECTION, 'wW', 750);
    dbgrPkt.Width := ReadInteger(SECTION, 'dgrPktW', 300);
    Free;
    if FileExists(cDirVids + 'Pktgr_01.vid') then
      dbgrPkt.Columns.LoadFromFile(cDirVids + 'Pktgr_01.vid');
    if FileExists(cDirVids + 'Ndbgr_01.vid') then
      dbgrNdb.Columns.LoadFromFile(cDirVids + 'Ndbgr_01.vid');
    PageControl1.ActivePage := ts1;
  end;

  ts1.TabVisible := false;
  ts2.TabVisible := false;

  PageControl1.ActivePage := ts1;
end;

//------------------------------------------------------------------------------
procedure TFormShPredPkt.FormCloseQuery(
  Sender: TObject;
  var CanClose: Boolean
);
begin
  if bFlagDbg then
    cds_Ndb.SaveToFile(cDirTemp + 'cds_Ndb.cds');
    
  if bIsFormGtSotr then
    FormGetSotr.Close;
end;

//------------------------------------------------------------------------------
procedure TFormShPredPkt.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  dbgrPkt.Columns.SaveToFile(cDirVids + 'Pktgr_01.vid');
  dbgrNdb.Columns.SaveToFile(cDirVids + 'Ndbgr_01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'dgrPktW', dbgrPkt.Width);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShPredPkt.qryNdbCalcFields(DataSet: TDataSet);
begin
 qryNdbFamIO.AsString := MyFamIO(qryNdbFam.AsString, qryNdbIma.AsString,
                                    qryNdbOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShPredPkt.sbtnNewPktClick(Sender: TObject);
begin
 with cds_Ndb do begin
    if Active then
      Close;
    Active := false;

    IndexDefs.Clear;
    IndexDefs.Add('OnNR', 'NR', []);
    IndexDefs.Add('OnTabN', 'TabN', []);
    IndexDefs.Add('OnFamIO', 'FamIO', []);
    CreateDataSet;

    Open;
//    IndexName := 'OnNR';
    First;
  end;
  PageControl1.ActivePage := ts2;
//  Caption := cCap2;


  sBtnGetSotrClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormShPredPkt.sBtnGetSotrClick(Sender: TObject);
var mListKatP : TStringList;  cOtkuda : ShortString;
begin
  mListKatP := TStringList.Create;
  cOtkuda := 'iz nadb';
  // >> z_GtSotr
  TFormGetSotr.Run(cOtkuda, n_KdSps, d_DtProc, LbxObj, LbxTabN, mListKatP);
  mListKatP.Destroy;
end;

//------------------------------------------------------------------------------
procedure TFormShPredPkt.OpenQryNdb;
begin
  QryUtils.InitQuery(QryNdb);

  with QryNdb do begin
    DataSource := DsrcPkt;

    SQL.Add(
      'select n.*, u.Fam, u.Ima, u.Otch ' +
      'from z_Nadb n ' +
        'left join z_UPI u on u.TabN = n.TabN ' +
      'where n.NrPkt = :NrPkt '
      //  + 'and n.VidN in ("1005", "1006", "1008", "1433")'
    );

    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'SqlNdb.txt');

    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShPredPkt.OpenQryPkt;
begin
  QryUtils.InitQuery(QryPkt);

  with QryPkt do begin
    SQL.Add(
      'select * ' +
      'from z_PredPkt'
    );
    
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShPredPkt.CloseFormVvSotr(b_IsFormVbSotr: boolean);
begin
  if  bIsFormGtSotr then
    FormGetSotr.Close;
end;

//------------------------------------------------------------------------------
procedure TFormShPredPkt.AddRecInNdb;
begin
  QryUtils.InitQuery(QryTmp);

  with QryTmp do begin
    SQL.Add(
      'insert into z_Nadb (TabN, VidN, KdObj, KdKatP, KdSpZ, Dt_Beg, ' +
        'DtPrBeg, NrPrBeg, Dt_End, DtPrEnd, NrPrEnd, SumProc, Notes, ' +
        'NrPkt, DtVPkt, KdSps, SpsRsch) ' +
      'values (' +
        ':TabN, :VidN, :KdObj, :KdKatP, :KdSpZ, :Dt_Beg, ' +
        ':DtPrBeg, :NrPrBeg, :Dt_End, :DtPrEnd, :NrPrEnd, ' +
        ':SumProc, :Notes, :NrPkt, :DtVPkt, :KdSps, :SpsRsch)'
    );

    ParamByName('Tabn').AsInteger     := cds_NdbTabN.AsInteger;
    ParamByName('VidN').AsString      := cds_NdbVidN.AsString;
    ParamByName('KdObj').AsInteger    := cds_NdbKdObj.AsInteger;
    ParamByName('KdKatP').AsInteger   := cds_NdbKdKatP.AsInteger;
    ParamByName('KdSpz').AsInteger    := cds_NdbKdSpz.AsInteger;
    ParamByName('Dt_Beg').AsDateTime  := cds_NdbDt_Beg.AsDateTime;
    ParamByName('DtPrBeg').AsDateTime := cds_NdbDtPrBeg.AsDateTime;
    ParamByName('NrPrBeg').AsString   := cds_NdbNrPrBeg.AsString;
    ParamByName('Dt_End').AsDateTime  := cds_NdbDt_End.AsDateTime;
    ParamByName('DtPrEnd').AsDateTime := cds_NdbDtPrEnd.AsDateTime;
    ParamByName('NrPrEnd').AsString   := cds_NdbNrPrEnd.AsString;
    ParamByName('SumProc').AsFloat    := cds_NdbSumProc.AsFloat;
    ParamByName('Notes').AsString     := cds_NdbNotes.AsString;
    ParamByName('NrPkt').AsInteger    := nNewNrVedWithWiz;
    ParamByName('DtVPkt').AsDateTime  := Date;
    // SB 23.4.2026 Àíæåëà
    ParamByName('KdSps').AsInteger    := cds_NdbKdSps.AsInteger;
    ParamByName('SpsRsch').AsInteger  := cds_NdbSpsRsch.AsInteger;

    ExecSql;
 end;
end;

//------------------------------------------------------------------------------
procedure TFormShPredPkt.sBtnSaveToBDClick(Sender: TObject);
var nSvNr : integer;
    n_KdUsr : SmallInt;
begin
  if nNewNrVedWithWiz = 0 then
    nNewNrVedWithWiz := NewVedNr;
  sBtnSaveToBD.Enabled := false;
  with cds_Ndb do begin
    nSvNr := cds_NdbNR.AsInteger;
    First;
    while not Eof do begin
      if not cds_NdbAddedToNdb.AsBoolean then begin
        AddRecInNdb;
        Edit;
        cds_NdbAddedToNdb.AsBoolean := TRUE;
        Post;
      end;
      Next;
    end;
    Locate('NR', nSvNr, []);
  end;
  n_KdUsr  := nAppKdUsr;
  AddRecInPredPkt(nNewNrVedWithWiz, n_KdUsr, d_DtProc, Date);
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
function TFormShPredPkt.NewVedNr: integer;
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
procedure TFormShPredPkt.AddRecInPredPkt(nNewNrVedWithWiz: integer;
  n_KdUsr: SmallInt; d_DtProc, Date: TDatetime);
begin
  with qryPkt do begin
    Append;
    qryPktDtProc.AsDateTime := d_DtProc;
    qryPktKdUsr.AsInteger   := n_KdUsr;
    qryPktDtPkt.AsDateTime  := d_DtProc;
    qryPktNrPkt.AsInteger   := nNewNrVedWithWiz;  // îòğèöàòåëüíûé
    qryPktTiPPkt.AsString   := 'ÑïåöÍ';
    Post;
    ApplyUpdates;
    Close;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShPredPkt.popNdbPopup(Sender: TObject);
begin
//  bByNr   := popByNr.Checked;
//  bByTabN := popByTabN.Checked;
//  bByFIO  := popByFIO.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormShPredPkt.popByNrClick(Sender: TObject);
begin
  popByNR.Checked   := true;
  with cds_Ndb do begin
//    Close;
    IndexName := 'OnNR';
//    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShPredPkt.popByTabNClick(Sender: TObject);
begin
  popByTabN.Checked   := true;
  with cds_Ndb do begin
//    Close;
    IndexName := 'OnTabN';
//    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShPredPkt.popByFIOClick(Sender: TObject);
begin
  popByFIO.Checked    := true;
  with cds_Ndb do begin
//    Close;
    IndexName := 'OnFamIO';
//    Open;
  end;
end;

procedure TFormShPredPkt.popDelPktClick(Sender: TObject);
var nDelNrPkt : integer;

begin

 If MessageDlg('Óäàëèòü ïàêåò è âñå åãî çàïèñè â íàäáàâêàõ ?',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
   nDelNrPkt := qryPktNrpkt.AsInteger;
   with qrytmp do begin
     if Active then Close;
     SQL.Clear;
     DatabaseName := CESMAIN;
     SQL.Add('Delete from z_PredPKT where NrPkt = :nDelNrPkt');
     ParamByName('nDelNrPkt').ASInteger := nDelNrPkt;
     ExecSQL;
     SQL.Clear;
     SQL.Add('Delete from z_Nadb  where NrPkt = :nDelNrPkt');
     ParamByName('nDelNrPkt').ASInteger := nDelNrPkt;
     ExecSQL;
     SQL.Clear;
     DatabaseName := '';
   end;
   qryPkt.Close;
   qryPkt.Open;
 end;
end;

procedure TFormShPredPkt.popPktPopup(Sender: TObject);
begin
  popDelPkt.Enabled := qryPkt.RecordCount > 0;
end;

end.
