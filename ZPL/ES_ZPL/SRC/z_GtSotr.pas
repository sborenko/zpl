unit z_GtSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, ExtCtrls, DBTables, Grids, DBGrids, Buttons, StdCtrls,
  Math, Mask, DBCtrls, DBClient, ComCtrls;

type
  TFormGetSotr = class(TForm)
    Panel1: TPanel;
    BtnClose: TBitBtn;
    qryObj: TQuery;
    qrySps: TQuery;
    dsrcObj: TDataSource;
    dsrcSps: TDataSource;
    BtnStayOnTop: TSpeedButton;
    qrySpsTABN: TIntegerField;
    qrySpsKDKATP: TSmallintField;
    qrySpsSHKATP: TStringField;
    qrySpsFAM: TStringField;
    qrySpsIMA: TStringField;
    qrySpsOTCH: TStringField;
    qryObjAINDX: TSmallintField;
    qryObjKDOBJ: TSmallintField;
    qryObjCOUNT: TIntegerField;
    qryObjSHOBJ: TStringField;
    qryObjNMOBJ: TStringField;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    cdsTmp: TClientDataSet;
    dsrcTmp: TDataSource;
    LbxFilter: TListBox;
    dbgrObj: TDBGrid;
    PageControl1: TPageControl;
    tsOtkl: TTabSheet;
    panelOtkl: TPanel;
    PanelKatPers: TPanel;
    Label7: TLabel;
    sBtnNeedKdKatP: TSpeedButton;
    chBoxAllKatP: TCheckBox;
    dbeShNeedKatP: TDBEdit;
    dbgrSps: TDBGrid;
    tsNdb: TTabSheet;
    panelNdb: TPanel;
    dbgrSpsNdb: TDBGrid;
    Label1: TLabel;
    dbeVidN: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbeNrPrBeg: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbeNrPrEnd: TDBEdit;
    Label8: TLabel;
    dbeSumma: TDBEdit;
    Label9: TLabel;
    dbeNotes: TDBEdit;
    qrySpsFamIO: TStringField;
    cdsTmpVidN: TStringField;
    cdsTmpShVidN: TStringField;
    cdsTmpDt_Beg: TDateField;
    cdsTmpDtPrBeg: TDateField;
    cdsTmpNrPrBeg: TStringField;
    cdsTmpDt_End: TDateField;
    cdsTmpDtPrEnd: TDateField;
    cdsTmpNrPrEnd: TStringField;
    cdsTmpSumma: TFloatField;
    cdsTmpNotes: TStringField;
    dbeDt_Beg: TDBEdit;
    dbeDt_End: TDBEdit;
    dbeDtPrBeg: TDBEdit;
    dbeDtPrEnd: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnStayOnTopClick(Sender: TObject);
    procedure dbgrSpsDblClick(Sender: TObject);
    procedure dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrObjDblClick(Sender: TObject);
    procedure sBtnZaMesGodClick(Sender: TObject);
    procedure sBtnVidNClick(Sender: TObject);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure sBtnKdObjClick(Sender: TObject);
    procedure sBtnKdKatPClick(Sender: TObject);
    procedure sBtnKdSpZClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure cdsTmpZaMesGodSetText(Sender: TField; const Text: String);
    procedure sBtnNeedKdKatPClick(Sender: TObject);
    procedure dbgrObjKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
    procedure dbgrSpsKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
    procedure dbeVidNExit(Sender: TObject);
    procedure dbgrEnter(Sender: TObject);
    procedure dbgrExit(Sender: TObject);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure dbgrSpsNdbDblClick(Sender: TObject);
    procedure qrySpsCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    c_Otkuda : ShortString;
    n_KdSps : integer;
    d_DtProc : TDateTime;
    Lbx_Obj, Lbx_TabN : TListBox;
    m_ListKatP : TStringList;

    procedure SetStayOnTop;
    procedure OpenQryObj(dDtProc : TDateTime);
    procedure OpenQrySps(dDtProc : TDateTime);

    procedure ProcEmpl;
    procedure AddTabNInVed(nTabN, nKdObj, nKdKatP, nKdTemu,
  nKdSpZ : integer; cNmTemu, cNotes : ShortString);
  public
    class procedure Run(cOtkuda: ShortString; nKdSps: Integer;
      dDtProc: TDateTime; LbxObj, LbxTabN: TListBox; mListKatP: TStringList);
  end;

const SECTION = 'z_GtSotr';

var
  FormGetSotr: TFormGetSotr;

implementation

uses
  a_Const, a_DM, a_Lib, a_SBU, z_Dm, z_Main, z_VdPv, z_TVids, z_TObj, z_ZaMG,
  z_GtPers, z_ShwTem, z_PredPkt;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFormGetSotr.Run(
  cOtkuda: ShortString;
  nKdSps: Integer;
  dDtProc: TDateTime;
  LbxObj, LbxTabN: TListBox;
  mListKatP: TStringList
);
begin
  if not bIsFormGtSotr then begin
    FormGetSotr := TFormGetSotr.Create(Application);

    with FormGetSotr do begin
      c_Otkuda := cOtkuda;
      bIsFormGtSotr := true;
      Caption := 'Выбор параметров отклонения и создание списка сотрудников';
      n_KdSps := nKdSps;
      d_DtProc := dDtProc;
      Lbx_Obj := LbxObj;
      Lbx_TabN := LbxTabN;
      m_ListKatP := mListKatP;

      OpenQryObj(dDtProc);
      OpenQrySps(dDtProc);

      PageControl1.ActivePage := tsOtkl;

      tsOtkl.TabVisible := false;
      tsNdb.TabVisible := false;

      if c_Otkuda = 'iz otkl' then begin
        PageControl1.ActivePage := tsOtkl;
      end else if c_Otkuda = 'iz nadb' then begin
        PageControl1.ActivePage := tsNdb;
      end;

      Show;
    end;
  end else begin
    if FormGetSotr.WindowState = wsMinimized then
      FormGetSotr.WindowState := wsNormal;
    FormGetSotr.SetFocus
  end;
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.FormCreate(Sender: TObject);
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Edit;
    cdsTmpSumma.AsFloat := 0.00;
  end;

  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 600);

    BtnStayOnTop.Down := ReadBool(SECTION, 'bStOnTp', true);

    cdsTmpVidN.AsString    := ReadString(SECTION, 'VidN', '1433');
    cdsTmpDt_Beg.AsString  := ReadString(SECTION, 'cDt_Beg', '01-04-2026');
    cdsTmpDtPrBeg.AsString := ReadString(SECTION, 'cDtPrBeg','20-03-2026');
    cdsTmpNrPrBeg.AsString := ReadString(SECTION, 'cNrPrBeg', 'пр.№ ...');
    cdsTmpDt_End.AsString  := ReadString(SECTION, 'cDt_End', '31-12-2026');
    cdsTmpDtPrEnd.AsString := ReadString(SECTION, 'cDtPrEnd', '20-12-2026');
    cdsTmpNrPrEnd.AsString := ReadString(SECTION, 'cNrPrEnd', 'пр.№ ...');
    cdsTmpNotes.AsString   := ReadString(SECTION, 'cNotes', 'Примечания');

    Free;
  end;

  SetStayOnTop;

  if FileExists(cDirVids + 'VbSotr_1.vid') then
    dbgrObj.Columns.LoadFromFile(cDirVids + 'VbSotr_1.vid');
  if FileExists(cDirVids + 'VbSotr_2.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'VbSotr_2.vid');
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);

    WriteInteger(SECTION, 'grObjW', dbgrObj.Width);
    WriteBool(SECTION, 'bStOnTp', BtnStayOnTop.Down);
    WriteString(SECTION, 'VidN', cdsTmpVidN.AsString);
    WriteString(SECTION, 'cDt_Beg', cdsTmpDt_Beg.AsString);
    WriteString(SECTION, 'cDtPrBeg', cdsTmpDtPrBeg.AsString);
    WriteString(SECTION, 'cNrPrBeg', cdsTmpNrPrBeg.AsString);
    WriteString(SECTION, 'cDt_End', cdsTmpDt_End.AsString);
    WriteString(SECTION, 'cDtPrEnd', cdsTmpDtPrEnd.AsString);
    WriteString(SECTION, 'cNrPrEnd', cdsTmpNrPrEnd.AsString);
    WriteString(SECTION, 'cNotes', cdsTmpNotes.AsString);
    Free;
  end;

  dbgrObj.Columns.SaveToFile(cDirVids + 'VbSotr_1.vid');
  dbgrSps.Columns.SaveToFile(cDirVids + 'VbSotr_2.vid');

  bIsFormGtSotr := false;
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.OpenQryObj(dDtProc : TDateTime);
var cMsg : string; i : integer;
begin
  with qryObj do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct ko.AIndx, s.KdObj, Count(s.NR), ' +
            ' ko.ShObj, ko.NmObj from z_sps s ' +
            ' Left outer join z_KdObj ko on ko.KdObj = s.KdObj ' +
            ' where (s.dtProc = :dDtProc) and ko.AIndx >= 0 ');
    if m_ListKatP.Count > 0 then begin
      cMsg := ' and (s.KdKatP in (';
      for i := 0 to m_ListKatP.Count-1 do begin
        cMsg := cMsg + m_ListKatP[i];
        if i < m_ListKatP.Count-1 then
          cMsg := cMsg + ',';
      end;
      cMsg := cMsg + '))';
      SQL.Add(cMsg);
    end;
    SQL.Add('group by ko.AIndx, s.KdObj, ko.ShObj, ko.NmObj');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'qryObj.sql');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.OpenQrySps(dDtProc : TDateTime);
var cMsg : string; i : integer;
begin
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcObj;
    SQL.Add('Select sps.TabN, sps.KdKatP, ktg.ShKatP, ' +
            ' upi.Fam, Upi.Ima, upi.Otch from z_sps sps ' +
            ' Left outer join z_Upi upi on upi.TabN = sps.TabN ' +
            ' Left outer join z_KatPers ktg on Ktg.KdKatP = sps.KdKatP ' +
            ' where sps.dtProc = :dDtProc and sps.KdObj = :KdObj ');
    if m_ListKatP.Count > 0 then begin
      cMsg := ' and (sps.KdKatP in (';
      for i := 0 to m_ListKatP.Count-1 do begin
        cMsg := cMsg + m_ListKatP[i];
        if i < m_ListKatP.Count-1 then
          cMsg := cMsg + ',';
      end;
      cMsg := cMsg + '))';
      SQL.Add(cMsg);
    end;
    SQL.Add('order by Fam, Ima, otch ');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'qrySps.sql');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.SetStayOnTop;
begin
  if BtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.dbgrObjDblClick(Sender: TObject);
var
  Indx, TabN, KdObj, KdKatP, KdTemu, KdSpZ: Integer;
  NmTemu, Notes: ShortString;
begin
  FormShPredPkt.Cds_Ndb.DisableControls;

  with QrySps do begin
    First;

    while not Eof do begin
      ProcEmpl;

      Next;
    end;
  end;

  FormShPredPkt.cds_Ndb.EnableControls;
  FormShPredPkt.sbtnSaveToBD.Enabled := FormShPredPkt.cds_Ndb.RecordCount > 0;
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.dbgrSpsNdbDblClick(Sender: TObject);
begin
  ProcEmpl;

  if not QrySps.Eof then
    QrySps.Next
  else
    DbgrSps.Refresh;

  FormShPredPkt.sBtnSaveToBD.Enabled := FormShPredPkt.cds_Ndb.RecordCount > 0;
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.ProcEmpl;
var
  Indx, TabN, KdObj, KdKatP, KdTemu, KdSpZ: Integer;
  NmTemu, Notes: ShortString;
begin
  TabN := QrySpsTabN.AsInteger;

  Indx := Lbx_TabN.Items.IndexOf(QrySpsTabN.AsString);

  if Indx >= 0 then begin
    if FormShPredPkt.cds_Ndb.Locate('TabN', TabN, []) then
      FormShPredPkt.cds_Ndb.Delete;

    Lbx_TabN.Items.Delete(Indx);
  end else begin
    KdKatP := QrySpsKdKatP.AsInteger;
    KdObj  := QryObjKdObj.AsInteger;
    KdSpZ  := 0;
    KdTemu := -1;
    Notes  := CdsTmpNotes.AsString;

    AddTabNInVed(TabN, KdObj, KdKatP, KdTemu, KdSpZ, NmTemu, Notes);
    Lbx_TabN.Items.Add(QrySpsTabN.AsString);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.dbgrSpsDblClick(Sender: TObject);
var
  TabN, I: Integer;
begin
  TabN := qrySpsTabN.AsInteger;

  I := Lbx_TabN.Items.IndexOf(QrySpsTabN.AsString);

  if I >= 0 then begin
    if FormVdPv.Tbl_Otkl.Locate('TabN', TabN, []) then
      FormVdPv.tbl_Otkl.Delete;

    Lbx_TabN.Items.Delete(i);
  end else begin
    AddTabNInVed(TabN, 0, 0, 0, 0, '', '');

    Lbx_TabN.Items.Add(QrySpsTabN.AsString);
  end;

  if not QrySps.Eof then
    QrySps.Next
  else
    DbgrSps.Refresh;

  FormVdPv.sBtnAddToOtkl.Enabled := FormVdPv.Tbl_Otkl.RecordCount > 0;
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.AddTabNInVed(
  nTabN, nKdObj, nKdKatP, nKdTemu, nKdSpZ: Integer;
  cNmTemu, cNotes: ShortString
);
var
  n_KdObj, n_KdKatP, n_KdSpZ, nSO, nPdNlg, nKolMin, nRang, nRazr: integer;
  nOklTrf, nAvans, nProcLG, Summa: double;
  cSpAv : string[1];
  cFamIO, cDolgnost, cNrPrikaza : string;
  cDt_Beg, cNrPrBeg, cDt_End, cNrPrEnd, cDtPrBeg, cDtPrEnd : ShortString;
  dZaMG, dDtPrikaza : TDateTime;
  bPens, bSovm, bPrfs : boolean; nInv : SmallInt;
  cVidN : ShortString;
begin
  DmMain.GetPereInf(nTabN, dZaMG, {d_DtProc,} n_KdObj, n_KdKatP, nSO, nPdNlg,
                     nKolMin, n_KdSpZ, nRang, nRazr, nOklTrf, nAvans, nProcLG,
                     cSpAv, cDolgnost, cNrPrikaza,
                     dDtPrikaza, bPens, bSovm, bPrfs, nInv);
  if nKdObj = 0 then
    nKdObj := n_KdObj;
  if nKdKatP = 0 then
    nKdKatP := n_KdKatP;
  if nKdSpZ = 0 then
    nKdSpZ := n_KdSpZ;
  cFamIO := myFamIO(qrySpsFam.AsString, qrySpsIma.AsString, qrySpsOtch.AsString);
  cVidN  := cdsTmpVidN.AsString;
  cNotes := cdsTmpNotes.AsString;
  with FormShPredPkt.cds_Ndb do begin
    cDt_Beg  := dbeDt_Beg.Text;
    cDtPrBeg := dbeDtPrBeg.Text;
    cNrPrBeg := dbeNrPrBeg.Text;
    cDt_End  := dbeDt_End.Text;
    cDtPrEnd := dbeDtPrEnd.Text;
    cNrPrEnd := dbeNrPrEnd.Text;
    Summa    := dbeSumma.Field.AsFloat;

    Append;

    FieldByName('TabN').AsInteger   := nTabN;
    FieldByName('FamIO').AsString   := cFamIO;
    FieldByName('VidN').AsString    := cVidN;
    FieldByName('Dt_Beg').AsString  := cDt_Beg;
    FieldByName('Dt_End').AsString  := cDt_End;
    FieldByName('DtPrBeg').AsString := cDtPrBeg;
    FieldByName('DtPrEnd').AsString := cDtPrEnd;
    FieldByName('NrPrBeg').AsString := cNrPrBeg;
    FieldByName('NrPrEnd').AsString := cNrPrEnd;
    FieldByName('KdObj').AsInteger  := nKdObj;
    FieldByName('KdKatP').AsInteger := nKdKatP;
    FieldByName('KdSpZ').AsInteger  := n_KdSpZ;
    FieldByName('SumProc').AsFloat  := Summa;
    FieldByName('Notes').AsString   := cNotes;
    // SB 23.4.2026 Анжела
    FieldByName('KdSps').AsInteger   := gl_nAppKdSpsUsr;
    FieldByName('SpsRsch').AsInteger := 1;

    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrSps.Canvas do begin
    if not (gdFocused in State) then begin
      if Lbx_TabN.Items.IndexOf(qrySpsTabN.AsString) >= 0 then
        Font.Color := clBlue
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrSps.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.sBtnVidNClick(Sender: TObject);
var cVidN, p_KEKV : string[4]; p_ShVidN : string[15]; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string[1];
                     p_KdSpZ : integer; bWasUpdated : boolean;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := BtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;

  if GetVidN(cVidN, p_KEKV, p_ShVidN, p_NmVidN,
               p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
               p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
               p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
               p_SAlim, p_SSocStrah, p_SBzr, p_CNdb, p_Sp_PF, p_Sp_FSTVP,
               p_Sp_FSNV, p_Sp_FZ, p_KdSpZ, bWasUpdated, LbxFilter) {z_TVids}
                                                                    then begin
    if bWasUpdated then begin
      DmMain.qryVidN_LU.Close;
      DmMain.qryVidN_LU.Open;
    end;
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.sBtnZaMesGodClick(Sender: TObject);
var X, Y : LongInt;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := BtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;

  X := Mouse.CursorPos.X;
  Y := Mouse.CursorPos.Y;
  FormVdPv.cdsZaMG.Locate('ZaMesGod', d_DtProc, []);
  if GetZaMG(X, Y, FormVdPv.cdsZaMG) {z_ZaMG} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.DateFieldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.sBtnKdObjClick(Sender: TObject);
var nKdObj, nKdSpZ : integer; cShObj, cNmObj : string;
    bWasUpdated : boolean;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := BtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;

  if GetKdObj(nKdObj, nKdSpZ,
                               cShObj, cNmObj, bWasUpdated) {z_TObj} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.sBtnNeedKdKatPClick(Sender: TObject);
var nKdKatP : integer; cShKatP, cNmKatP : string;
begin
  dbeShNeedKatP.SetFocus;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {z_GtPers} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.sBtnKdKatPClick(Sender: TObject);
var nKdKatP : integer; cShKatP, cNmKatP : string;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := BtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;

  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {z_GtPers} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.sBtnKdSpZClick(Sender: TObject);
var nKdSpZ : integer;  cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := BtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;

  if GetSBU(nKdSpZ, cSchBU, cPSch, cNmSBU, bHsCh) {a_SBU} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;

  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.cdsTmpZaMesGodSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyMesGod(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := '01-' + Text;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.dbgrObjKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then begin
    dbgrObjDblClick(Self);
    if not qryObj.Eof then
      qryObj.Next
    else
      dbgrObj.Refresh;
  end;    
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.dbgrSpsKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    dbgrSpsDblClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.qrySpsCalcFields(DataSet: TDataSet);
begin
  qrySpsFamIO.AsString := MyFamIO(qrySpsFam.AsString,
                           qrySpsIma.AsString,
                                   qrySpsOtch.AsString);
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.dbeVidNExit(Sender: TObject);
// var
//   cEditText : ShortString;
begin
{
  cEditText := dbeVidN.Text;
  If (cEditText <> '1005') and (cEditText <> '1006') and
     (cEditText <> '1008') then begin
   ShowMessage('Допускаются виды : 1005, 1006, 1088');
   dbeVidN.SetFocus;
  end;
}
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.BtnCloseClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.BtnStayOnTopClick(Sender: TObject);
begin
  SetStayOnTop;
end;

//------------------------------------------------------------------------------
procedure TFormGetSotr.dbgrEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.dbgrExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGetSotr.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
