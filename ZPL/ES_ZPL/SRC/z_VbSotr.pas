unit z_VbSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, ExtCtrls, DBTables, Grids, DBGrids, Buttons, StdCtrls,
  Math, Mask, DBCtrls, DBClient, ComCtrls;

type
  TFormVbSotr = class(TForm)
    Panel1: TPanel;
    bBtnClose: TBitBtn;
    qryObj: TQuery;
    qrySps: TQuery;
    dsrcObj: TDataSource;
    dsrcSps: TDataSource;
    sBtnStayOnTop: TSpeedButton;
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
    cdsTmpVidN: TStringField;
    cdsTmpDtProc: TDateField;
    cdsTmpZaMesGod: TDateField;
    cdsTmpDt_Beg: TDateField;
    cdsTmpDt_End: TDateField;
    cdsTmpChas: TFloatField;
    cdsTmpSumma: TFloatField;
    cdsTmpKdObj: TIntegerField;
    cdsTmpKdKatP: TIntegerField;
    cdsTmpKdSpZ: TIntegerField;
    cdsTmpNotes: TStringField;
    cdsTmpShObj: TStringField;
    cdsTmpShKatP: TStringField;
    cdsTmpSPZ: TStringField;
    cdsTmpShVidN: TStringField;
    cdsTmpMyZaMesGod: TStringField;
    cdsTmpNeedKdKatP: TIntegerField;
    cdsTmpShNeedKatP: TStringField;
    LbxFilter: TListBox;
    cdsTmpKdTemu: TSmallintField;
    cdsTmpNmTemu: TStringField;
    dbgrObj: TDBGrid;
    PageControl1: TPageControl;
    tsOtkl: TTabSheet;
    panelOtkl: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    sBtnVidN: TSpeedButton;
    sBtnZaMesGod: TSpeedButton;
    sBtnKdObj: TSpeedButton;
    sBtnKdKatP: TSpeedButton;
    sBtnKdSpZ: TSpeedButton;
    Label2: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label12: TLabel;
    sBtnKdTemu: TSpeedButton;
    dbeShVidN: TDBEdit;
    dbeVidN: TDBEdit;
    dbeZaMesGod: TDBEdit;
    dbeDtBeg: TDBEdit;
    dbeDtEnd: TDBEdit;
    dbeChas: TDBEdit;
    dbeSumma: TDBEdit;
    dbeShObj: TDBEdit;
    dbeShKatP: TDBEdit;
    dbeSPZ: TDBEdit;
    dbeNotes: TDBEdit;
    chBoxKdObj: TCheckBox;
    chBoxKdKatP: TCheckBox;
    chBoxKdSpZ: TCheckBox;
    rBtnSmm: TRadioButton;
    rBtnPrc: TRadioButton;
    PanelKatPers: TPanel;
    Label7: TLabel;
    sBtnNeedKdKatP: TSpeedButton;
    chBoxAllKatP: TCheckBox;
    dbeShNeedKatP: TDBEdit;
    dbeKdTemu: TDBEdit;
    dbeNmTemu: TDBEdit;
    dbeKdSpZ: TDBEdit;
    dbgrSps: TDBGrid;
    tsNdb: TTabSheet;
    panelNdb: TPanel;
    dbgrSpsNdb: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure dbgrSpsDblClick(Sender: TObject);
    procedure dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrObjDblClick(Sender: TObject);
    procedure sBtnZaMesGodClick(Sender: TObject);
    procedure cdsTmpCalcFields(DataSet: TDataSet);
    procedure sBtnVidNClick(Sender: TObject);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure dbeVidNKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
    procedure dbeZaMesGodKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure sBtnKdObjClick(Sender: TObject);
    procedure dbeShObjKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
    procedure sBtnKdKatPClick(Sender: TObject);
    procedure dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
    procedure sBtnKdSpZClick(Sender: TObject);
    procedure dbeShKatPKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
    procedure bBtnCloseClick(Sender: TObject);
    procedure cdsTmpZaMesGodSetText(Sender: TField; const Text: String);
    procedure chBoxKdObjClick(Sender: TObject);
    procedure chBoxKdKatPClick(Sender: TObject);
    procedure chBoxKdSpZClick(Sender: TObject);
    procedure sBtnNeedKdKatPClick(Sender: TObject);
    procedure chBoxAllKatPClick(Sender: TObject);
    procedure dbgrObjKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
    procedure dbgrSpsKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
    procedure dbgrEnter(Sender: TObject);
    procedure dbgrExit(Sender: TObject);
    procedure sBtnKdTemuClick(Sender: TObject);
    procedure dbeKdTemuExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryObjCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    c_Otkuda : ShortString;
    n_KdSps : integer;
    d_DtProc : TDateTime;
    Lbx_Obj, Lbx_TabN : TListBox;
    m_ListKatP : TStringList;
    procedure SetStayOnTop;
    procedure SetDbeShObjEnabled;
    procedure SetDbeShKatPEnabled;
    procedure SetDbeSpZEnabled;
    procedure OpenQryObj(dDtProc : TDateTime);
    procedure OpenQrySps(dDtProc : TDateTime);
    procedure AddTabNInVed(nTabN, nKdObj, nKdKatP, nKdTemu, nKdSpZ : integer;
                                                 cNmTemu, cNotes : ShortString);
  public
    { Public declarations }
  end;

procedure VuborObjSotr(cOtkuda : ShortString; nKdSps : integer;
                          dDtProc : TDateTime;
                          LbxObj, LbxTabN : TListBox; mListKatP : TStringList);

const SECTION = 'z_VbSotr';

var
  FormVbSotr: TFormVbSotr;

implementation

uses a_Const, a_Lib, a_DM, z_Dm, z_Main, z_VdPv,
     a_SBU, z_TVids, z_TObj, z_ZaMG, z_GtPers, z_ShwTem, z_PredPkt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure VuborObjSotr(cOtkuda : ShortString; nKdSps : integer;
                          dDtProc : TDateTime;
                          LbxObj, LbxTabN : TListBox; mListKatP : TStringList);
begin
  if not bIsFormVbSotr then begin
    FormVbSotr := TFormVbSotr.Create(Application);
    with FormVbSotr do begin
      c_Otkuda := cOtkuda;
      bIsFormVbSotr := true;
      Caption := 'Выбор параметров отклонения и создание списка сотрудников';
      n_KdSps := nKdSps;
      d_DtProc := dDtProc;
      Lbx_Obj := LbxObj;
      Lbx_TabN := LbxTabN;
      m_ListKatP := mListKatP;
      cdsTmpDtProc.AsDateTime := dDtProc;
      cdsTmpZaMesGod.AsDateTime := dDtProc;
      cdsTmpDt_Beg.AsDateTime := cdsTmpZaMesGod.AsDateTime;
      cdsTmpDt_End.AsDateTime := myLastDOM(cdsTmpZaMesGod.AsDateTime);
      OpenQryObj(dDtProc);
      OpenQrySps(dDtProc);
      if c_Otkuda = 'iz otkl' then
        PageControl1.ActivePage := tsOtkl
      else if c_Otkuda = 'iz nadb' then
        PageControl1.ActivePage := tsNdb;
      Show;
    end; end
  else begin
    if FormVbSotr.WindowState = wsMinimized then
      FormVbSotr.WindowState := wsNormal;
    FormVbSotr.SetFocus
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.OpenQryObj(dDtProc : TDateTime);
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
procedure TFormVbSotr.OpenQrySps(dDtProc : TDateTime);
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
procedure TFormVbSotr.FormCreate(Sender: TObject);
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Edit;
  end;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 600);
    dbgrObj.Width := ReadInteger(SECTION, 'grObjW', 275);
    sBtnStayOnTop.Down := ReadBool(SECTION, 'bStOnTp', true);
    rBtnSmm.Checked := ReadBool(SECTION, 'rBtnSmm', true);
    rBtnPrc.Checked := not rBtnSmm.Checked;
    chBoxKdObj.Checked := ReadBool(SECTION, 'chBxObj', true);
    chBoxKdKatP.Checked := ReadBool(SECTION, 'chBxKtg', true);
    chBoxKdSpZ.Checked := ReadBool(SECTION, 'chBxSpZ', true);
    cdsTmpVidN.AsString := ReadString(SECTION, 'cVidN', '');
    cdsTmpChas.AsString := ReadString(SECTION, 'cChas', '');
    cdsTmpSumma.AsString := ReadString(SECTION, 'cSumma', '');
    cdsTmpKdObj.AsString := ReadString(SECTION, 'cKdObj', '');
    cdsTmpKdKatP.AsString := ReadString(SECTION, 'cKdKatP', '');
    cdsTmpKdSpZ.AsString := ReadString(SECTION, 'cKdSpZ', '');
    cdsTmpNotes.AsString := ReadString(SECTION, 'cNotes', '');
    Free;
  end;
  SetStayOnTop;
  SetDbeShObjEnabled;
  SetDbeShKatPEnabled;
  SetDbeSpZEnabled;
  if FileExists(cDirVids + 'VbSotr_1.vid') then
    dbgrObj.Columns.LoadFromFile(cDirVids + 'VbSotr_1.vid');
  if FileExists(cDirVids + 'VbSotr_2.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'VbSotr_2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.SetStayOnTop;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dbgrObj.Columns.SaveToFile(cDirVids + 'VbSotr_1.vid');
  dbgrSps.Columns.SaveToFile(cDirVids + 'VbSotr_2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grObjW', dbgrObj.Width);
    WriteBool(SECTION, 'bStOnTp', sBtnStayOnTop.Down);
    WriteBool(SECTION, 'rBtnSmm', rBtnSmm.Checked);
    WriteBool(SECTION, 'chBxObj', chBoxKdObj.Checked);
    WriteBool(SECTION, 'chBxKtg', chBoxKdKatP.Checked);
    WriteBool(SECTION, 'chBxSpZ', chBoxKdSpZ.Checked);
    WriteString(SECTION, 'cVidN', cdsTmpVidN.AsString);
    WriteString(SECTION, 'cChas', cdsTmpChas.AsString);
    WriteString(SECTION, 'cSumma', cdsTmpSumma.AsString);
    WriteString(SECTION, 'cKdObj', cdsTmpKdObj.AsString);
    WriteString(SECTION, 'cKdKatP', cdsTmpKdKatP.AsString);
    WriteString(SECTION, 'cKdSpZ', cdsTmpKdSpZ.AsString);
    WriteString(SECTION, 'cNotes', cdsTmpNotes.AsString);
    Free;
  end;
  bIsFormVbSotr := false;
//  Close;
{
  if c_Otkuda = 'iz otkl' then
    FormVdPV.CloseFormVvSotr(bIsFormVbSotr)
  else if c_Otkuda = 'iz nadb' then
    FormShPredPkt.CloseFormVvSotr(bIsFormVbSotr);
}
//  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
(*
  dbgrObj.Columns.SaveToFile(cDirVids + 'VbSotr_1.vid');
  dbgrSps.Columns.SaveToFile(cDirVids + 'VbSotr_2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grObjW', dbgrObj.Width);
    WriteBool(SECTION, 'bStOnTp', sBtnStayOnTop.Down);
    WriteBool(SECTION, 'rBtnSmm', rBtnSmm.Checked);
    WriteBool(SECTION, 'chBxObj', chBoxKdObj.Checked);
    WriteBool(SECTION, 'chBxKtg', chBoxKdKatP.Checked);
    WriteBool(SECTION, 'chBxSpZ', chBoxKdSpZ.Checked);
    WriteString(SECTION, 'cVidN', cdsTmpVidN.AsString);
    WriteString(SECTION, 'cChas', cdsTmpChas.AsString);
    WriteString(SECTION, 'cSumma', cdsTmpSumma.AsString);
    WriteString(SECTION, 'cKdObj', cdsTmpKdObj.AsString);
    WriteString(SECTION, 'cKdKatP', cdsTmpKdKatP.AsString);
    WriteString(SECTION, 'cKdSpZ', cdsTmpKdSpZ.AsString);
    WriteString(SECTION, 'cNotes', cdsTmpNotes.AsString);
    Free;
  end;
  bIsFormVbSotr := false;
  if c_Otkuda = 'iz otkl' then
    FormVdPV.CloseFormVvSotr
  else if c_Otkuda = 'iz nadb' then
    FormShPredPkt.CloseFormVvSotr;
  Action := caFree;
*)
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.bBtnCloseClick(Sender: TObject);
begin
//  if FormVdPv.tbl_Otkl.Active then
//  FormVdPv.sBtnAddToOtkl.Enabled := FormVdPv.tbl_Otkl.RecordCount > 0;
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.sBtnStayOnTopClick(Sender: TObject);
begin
  SetStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbgrSpsDblClick(Sender: TObject);
var i, nTabN, nKdObj, nKdKatP, nKdTemu, nKdSpZ : integer;
    cNmTemu, cNotes : ShortString;
begin
  nTabN   := qrySpsTabN.AsInteger;
//  nKdKatP := qrySpsKdKatP.AsInteger;
//  nKdObj  := qryObjKdObj.AsInteger;
//  nKdSpZ := 0;
  i := Lbx_TabN.Items.IndexOf(qrySpsTabN.AsString);
  if i >= 0 then begin
    if FormVdPv.tbl_Otkl.Locate('TabN', nTabN, []) then
      FormVdPv.tbl_Otkl.Delete;
    Lbx_TabN.Items.Delete(i); end
  else begin
    if not chBoxKdObj.Checked and not cdsTmpKdObj.IsNull then
      nKdObj := cdsTmpKdObj.AsInteger
    else
      nKdObj := qryObjKdObj.AsInteger;
    if not chBoxKdKatP.Checked and not cdsTmpKdKatP.IsNull then
      nKdKatP := cdsTmpKdKatP.AsInteger
    else
      nKdKatP := qrySpsKdKatP.AsInteger;



    if cdsTmpKdTemu.IsNull then
      nKdTemu := -1
    else
      nKdTemu := cdsTmpKdTemu.AsInteger;
    if not cdsTmpNmTemu.IsNull then
      cNmTemu := cdsTmpNmTemu.AsString
    else
      cNmTemu := '';




    if not chBoxKdSpZ.Checked and not cdsTmpKdSpZ.IsNull then
      nKdSpZ := cdsTmpKdSpZ.AsInteger
    else
      nKdSpZ := 0;   // тогда подставится из Z_Pere
    cNotes := cdsTmpNotes.AsString;

    AddTabNInVed(nTabN, nKdObj, nKdKatP, nKdTemu, nKdSpZ, cNmTemu, cNotes);

    Lbx_TabN.Items.Add(qrySpsTabN.AsString);
  end;
  if not qrySps.Eof then
    qrySps.Next
  else
    dbgrSps.Refresh;
  FormVdPv.sBtnAddToOtkl.Enabled := FormVdPv.tbl_Otkl.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbgrObjDblClick(Sender: TObject);
var i, nTabN, nKdObj, nKdKatP, nKdTemu, nKdSpZ : integer;
    cNmTemu, cNotes : ShortString;
begin
  FormVdPv.tbl_Otkl.DisableControls;
  with qrySps do begin
    First;
    while not Eof do begin
      nTabN   := qrySpsTabN.AsInteger;
//      nKdKatP := qrySpsKdKatP.AsInteger;
//      nKdObj  := qryObjKdObj.AsInteger;
//      nKdSpZ := 0
      i := Lbx_TabN.Items.IndexOf(qrySpsTabN.AsString);
      if i >= 0 then begin
        if FormVdPv.tbl_Otkl.Locate('TabN', nTabN, []) then
          FormVdPv.tbl_Otkl.Delete;
        Lbx_TabN.Items.Delete(i); end
      else begin
        if not chBoxKdObj.Checked and not cdsTmpKdObj.IsNull then
          nKdObj := cdsTmpKdObj.AsInteger
        else
          nKdObj := qryObjKdObj.AsInteger;
        if not chBoxKdKatP.Checked and not cdsTmpKdKatP.IsNull then
          nKdKatP := cdsTmpKdKatP.AsInteger
        else
          nKdKatP := qrySpsKdKatP.AsInteger;


        if cdsTmpKdTemu.IsNull then
          nKdTemu := -1
        else
          nKdTemu := cdsTmpKdTemu.AsInteger;
        if not cdsTmpNmTemu.IsNull then
          cNmTemu := cdsTmpNmTemu.AsString
        else
          cNmTemu := '';



        if not chBoxKdSpZ.Checked and not cdsTmpKdSpZ.IsNull then
          nKdSpZ := cdsTmpKdSpZ.AsInteger
        else
          nKdSpZ := 0;   // тогда подставится из Z_Pere
        cNotes := cdsTmpNotes.AsString;

        AddTabNInVed(nTabN, nKdObj, nKdKatP, nKdTemu, nKdSpZ, cNmTemu, cNotes);

        Lbx_TabN.Items.Add(qrySpsTabN.AsString);
      end;
      Next;
    end;
  end;
  FormVdPv.tbl_Otkl.EnableControls;
  FormVdPv.sBtnAddToOtkl.Enabled := FormVdPv.tbl_Otkl.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.AddTabNInVed(nTabN, nKdObj, nKdKatP, nKdTemu,
                           nKdSpZ : integer; cNmTemu, cNotes : ShortString);
var n_KdObj, n_KdKatP, n_KdSpZ, nSO, nPdNlg, nKolMin, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double;
    cSpAv : string[1];
    cFamIO, cDolgnost, cNrPrikaza : string;
    dZaMG, dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs : boolean; nInv : SmallInt;
    cVidN : ShortString;
begin
  dZaMG := cdsTmpZaMesGod.AsDateTime;
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
  with FormVdPv.tbl_Otkl do begin
    Append; // AppendRecord([]) не получился - почему-то путает порядок полей
    FieldByName('TabN').AsInteger      := nTabN;
    FieldByName('FamIO').AsString      := cFamIO;
    FieldByName('DtProc').AsDateTime   := d_DtProc;
    cVidN := cdsTmpVidN.AsString;
    FieldByName('VidN').AsString       := cVidN;
    FieldByName('ZaMesGod').AsString   := cdsTmpZaMesGod.AsString;
    FieldByName('Dt_Beg').AsString     := cdsTmpDt_Beg.AsString;
    FieldByName('Dt_End').AsString     := cdsTmpDt_End.AsString;
    FieldByName('Chas').AsString       := cdsTmpChas.AsString;
    if rBtnSmm.Checked then
      FieldByName('Summa').AsString    := cdsTmpSumma.AsString
    else
      // Рассчитать сумму заданного процента от оклада на cdsTmpZaMesGod и ввести
      FieldByName('Summa').AsFloat :=
                            RoundTo(nOklTrf * cdsTmpSumma.AsFloat / 100, -2);
    FieldByName('Pdn').AsInteger       := 1;
    FieldByName('KdSpZ').AsInteger     := nKdSpZ;
    FieldByName('KdObj').AsInteger     := nKdObj;
    if bFlagOpi and
            ((cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008')) then
      FieldByName('KdKatP').AsInteger  := 13  // договоры подряда (нахально)
    else
      FieldByName('KdKatP').AsInteger  := nKdKatP;
    if nKdTemu > 0 then begin
      FieldByName('KdTemu').AsInteger := nKdTemu;
      FieldByName('NmTemu').AsString  := cNmTemu;
    end;

    FieldByName('Notes').AsString      := cNotes;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
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
procedure TFormVbSotr.cdsTmpCalcFields(DataSet: TDataSet);
var cShKatP, cDummy : string;
begin
  cDummy := DmMain.KdKatP2NmKatP(cdsTmpNeedKdKatP.AsInteger, cShKatP);
  cdsTmpShNeedKatP.AsString := cShKatP;
  if cdsTmpVidN.AsString > '' then
    cdsTmpShVidN.AsString := DmMain.VidN2ShVidN(cdsTmpVidN.AsString, cDummy);
  cdsTmpMyZaMesGod.AsString := Copy(cdsTmpZaMesGod.AsString, 4, 7);
  cdsTmpShObj.AsString := DmMain.KdObj2ShObj(cdsTmpKdObj.AsInteger, cDummy);
  cdsTmpSPZ.AsString := Form_Dm.KdSbu2SchBU(cdsTmpKdSpz.AsInteger);
  cDummy := DmMain.KdKatP2NmKatP(cdsTmpKdKatP.AsInteger, cShKatP);
  cdsTmpShKatP.AsString := cShKatP;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.sBtnVidNClick(Sender: TObject);
var cVidN, p_KEKV : string[4]; p_ShVidN : string[15]; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string[1];
                     p_KdSpZ : integer; bWasUpdated : boolean;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := sBtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;
  cVidN := cdsTmpVidN.AsString;
  dbeShVidN.SetFocus;
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
    cdsTmpVidN.AsString := cVidN;
    dbeZaMesGod.SetFocus;
  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbeVidNKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVidN.Click;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.sBtnZaMesGodClick(Sender: TObject);
var X, Y : LongInt;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := sBtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;
  dbeZaMesGod.SetFocus;
  X := Mouse.CursorPos.X;
  Y := Mouse.CursorPos.Y;
  FormVdPv.cdsZaMG.Locate('ZaMesGod', d_DtProc, []);
  if GetZaMG(X, Y, FormVdPv.cdsZaMG) {z_ZaMG} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
    cdsTmpZaMesGod.AsDateTime := FormVdPv.cdsZaMGZaMesGod.AsDateTime;
    cdsTmpDt_Beg.AsDateTime := cdsTmpZaMesGod.AsDateTime;
    cdsTmpDt_End.AsDateTime := myLastDOM(cdsTmpZaMesGod.AsDateTime);
    dbeDtBeg.SetFocus;
  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbeZaMesGodKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnZaMesGod.Click;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.DateFieldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.sBtnKdObjClick(Sender: TObject);
var nKdObj, nKdSpZ : integer; cShObj, cNmObj : string;
    bWasUpdated : boolean;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := sBtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;
  dbeShObj.SetFocus;
  nKdObj := cdsTmpKdObj.AsInteger;
  if GetKdObj(nKdObj, nKdSpZ,
                               cShObj, cNmObj, bWasUpdated) {z_TObj} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
    cdsTmpKdObj.AsInteger := nKdObj;
    if dbeShKatP.Enabled then
      dbeShKatP.SetFocus
    else if dbeSPZ.Enabled then
      dbeSPZ.SetFocus
    else
      dbeNotes.SetFocus;
  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbeShObjKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdObj.Click;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.sBtnNeedKdKatPClick(Sender: TObject);
var nKdKatP : integer; cShKatP, cNmKatP : string;
begin
  dbeShNeedKatP.SetFocus;
  nKdKatP := cdsTmpNeedKdKatP.AsInteger;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {z_GtPers} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
    cdsTmpNeedKdKatP.AsInteger := nKdKatP;
    dbeZaMesGod.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.sBtnKdKatPClick(Sender: TObject);
var nKdKatP : integer; cShKatP, cNmKatP : string;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := sBtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;
  dbeShKatP.SetFocus;
  nKdKatP := cdsTmpKdKatP.AsInteger;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {z_GtPers} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
    cdsTmpKdKatP.AsInteger := nKdKatP;
    if dbeSPZ.Enabled then
      dbeSPZ.SetFocus
    else
      dbeNotes.SetFocus;
  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbeShKatPKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdKatP.Click;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.sBtnKdSpZClick(Sender: TObject);
var nKdSpZ : integer;  cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
    bSvStayOnTop : boolean;
begin
  bSvStayOnTop := sBtnStayOnTop.Down;
  if bSvStayOnTop then
    FormStyle := fsNormal;
  nKdSpZ := cdsTmpKdSpZ.AsInteger;
  if GetSBU(nKdSpZ, cSchBU, cPSch, cNmSBU, bHsCh) {a_SBU} then begin
    if not (cdsTmp.State in [dsInsert, dsEdit]) then
      cdsTmp.Edit;
    cdsTmpKdSpZ.AsInteger  := nKdSpZ;
  end;
  if bSvStayOnTop then
    FormStyle := fsStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdSpZ.Click;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.cdsTmpZaMesGodSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyMesGod(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := '01-' + Text;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.chBoxKdObjClick(Sender: TObject);
begin
  SetDbeShObjEnabled;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.SetDbeShObjEnabled;
begin
  dbeShObj.Enabled := not chBoxKdObj.Checked;
  sBtnKdObj.Enabled := not chBoxKdObj.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.chBoxKdKatPClick(Sender: TObject);
begin
  SetDbeShKatPEnabled;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.SetDbeShKatPEnabled;
begin
  dbeShKatP.Enabled := not chBoxKdKatP.Checked;
  sBtnKdKatP.Enabled := not chBoxKdKatP.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.chBoxKdSpZClick(Sender: TObject);
begin
  SetDbeSpZEnabled;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.SetDbeSpZEnabled;
begin
  dbeSpZ.Enabled := not chBoxKdSpZ.Checked;
  sBtnKdSpZ.Enabled := not chBoxKdSpZ.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.chBoxAllKatPClick(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbgrObjKeyDown(Sender: TObject; var Key: Word;
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
procedure TFormVbSotr.dbgrSpsKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    dbgrSpsDblClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbgrEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbgrExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.sBtnKdTemuClick(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
begin
  dbeKdTemu.SetFocus;
  with cdsTmp do begin
    nKdTemu := dbeKdTemu.Field.AsInteger;
    cNmTemu := dbeNmTemu.Field.AsString;
    if GetTemu(nKdTemu, nKdPSch, cNmTemu, cPSch) {z_ShwTem} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      dbeKdTemu.Field.AsInteger := nKdTemu;
      dbeNmTemu.Field.AsString  := cNmTemu;
      dbeKdSpZ.Field.AsInteger  := nKdPSch;
      dbeSpZ.Field.AsString     := cPSch;
      dbeKdTemu.OnExit := NIL;
      dbeNotes.SetFocus;
      dbeKdTemu.OnExit := dbeKdTemuExit;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.dbeKdTemuExit(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
    nTabN : integer; dOnDate : TDateTime;
    nKdSpZ: SmallInt; cSchBU: ShortString;
begin
  if not dbeKdTemu.Field.IsNull then begin  // поставить в dbeKdSpZ и в
    nKdTemu := dbeKdTemu.Field.AsInteger;   // dbeSpZ "темные" значения сёчёта
    if CheckKdTemu(nKdTemu, nKdPSch, cNmTemu, cPSch) {z_ShwTem} then begin
      dbeNmTemu.Field.AsString := cNmTemu;
      dbeKdSpZ.Field.AsInteger  := nKdPSch;
      dbeSpZ.Field.AsString     := cPSch;
      (Sender as TDBEdit).Color := clWindow;
      chBoxKdSpZ.Checked := false;
      dbeNotes.SetFocus; end
    else begin
      DbeKdTemu.SetFocus;
      ShowMessage('Нет темы "' + IntToStr(NKdTemu) + '" в справочнике тем');
    end; end
  else begin  // в dbeKdSpZ и в dbeSpZ значения сёчёта по умоланию
//    nTabN := dbeTabN.Field.AsInteger;
//    dOnDate := dDtProc;
//    if Form_Dm.GetSpZByPere(nTabN, dOnDate, nKdSpZ, cSchBU) then begin
      dbeNmTemu.Field.AsString := '';
      dbeKdSpZ.Field.AsString  := '';
      dbeSpZ.Field.AsString    := '';
      (Sender as TDBEdit).Color := clWindow;
      chBoxKdSpZ.Checked := true;
      dbeNotes.SetFocus;
//    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbSotr.qryObjCalcFields(DataSet: TDataSet);
begin
;
end;

end.
