unit z_TVids;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, IniFiles, Menus, DB, DBTables,
  Math, ExtCtrls, DBCtrls, Mask, Grids, DBGrids, DBClient, CustStruct;

type
  String1  = string[1];
  String3  = string[3];
  String4  = string[4];
  String6  = string[6];
  String10 = string[10];
  String15 = string[15];
  String65 = string[65];

  PTreeRec = ^TTreeRec;
  TTreeRec = record
    VidN   : string4;
    ShVidN : String15;
    NmVidN : String65;
  end;

  TFormTVids = class(TForm)
    popTv: TPopupMenu;
    popTvVubor: TMenuItem;
    popTvFullExpand: TMenuItem;
    popTvFullCollapse: TMenuItem;
    popTvExit: TMenuItem;
    popTvSep1: TMenuItem;
    popTvEdt: TMenuItem;
    popTvAddInRoot: TMenuItem;
    popTvAddFirstInCurrent: TMenuItem;
    popTvAddLastInCurrent: TMenuItem;
    popTvInsertBeforeCurrent: TMenuItem;
    popTvAddInNode: TMenuItem;
    popTvDel: TMenuItem;
    popTvSep2: TMenuItem;
    popTvSaveToFile: TMenuItem;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    qryTmp: TQuery;
    qryVidN: TQuery;
    dsrcVidN: TDataSource;
    updVidN: TUpdateSQL;
    qryVidNNR: TIntegerField;
    qryVidNOLDKDVIDN: TSmallintField;
    qryVidNVIDN: TStringField;
    qryVidNSHVIDN: TStringField;
    qryVidNNMVIDN: TStringField;
    qryVidNAINDX: TSmallintField;
    qryVidNPINDX: TSmallintField;
    qryVidNLVL: TSmallintField;
    qryVidNINDX: TSmallintField;
    qryVidNHSCH: TStringField;
    qryVidNNOSHOW: TStringField;
    PanelRight: TPanel;
    PanelDetails: TPanel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label14: TLabel;
    Label24: TLabel;
    sBtnSPZ: TSpeedButton;
    dbeSPZ: TDBEdit;
    dbeNmVidNShort: TDBEdit;
    chBoxCBudg: TDBCheckBox;
    chBoxOtp: TDBCheckBox;
    chBoxBln: TDBCheckBox;
    chBoxSSrK: TDBCheckBox;
    chBoxSNdb: TDBCheckBox;
    chBoxSPdn: TDBCheckBox;
    chBoxSPRF: TDBCheckBox;
    chBoxSALIM: TDBCheckBox;
    chBoxDplDoMinZp: TDBCheckBox;
    chBoxDHD: TDBCheckBox;
    chBoxBOLNIC: TDBCheckBox;
    chBoxDETIM: TDBCheckBox;
    chBoxDETIK: TDBCheckBox;
    chBoxDETIG: TDBCheckBox;
    chBoxNOSHOW: TDBCheckBox;
    chBoxOTPUSKN: TDBCheckBox;
    dbeNmVidN: TDBEdit;
    popTvMoveInTo: TMenuItem;
    popTvMoveToBefore: TMenuItem;
    qryVidNZP13: TStringField;
    qryVidNOTP: TStringField;
    qryVidNBLN: TStringField;
    qryVidNOTPUSKN: TStringField;
    qryVidNBOLNIC: TStringField;
    qryVidNSPRM: TStringField;
    qryVidNCPRM: TStringField;
    qryVidNDETI: TStringField;
    qryVidNDETIM: TStringField;
    qryVidNDETIK: TStringField;
    qryVidNDETIG: TStringField;
    qryVidNIND: TStringField;
    qryVidNDHD: TStringField;
    qryVidNOKLFND: TStringField;
    qryVidNCBUDG: TStringField;
    qryVidNSNDB: TStringField;
    qryVidNSPDN: TStringField;
    qryVidNSPRF: TStringField;
    qryVidNSPENS: TStringField;
    qryVidNSALIM: TStringField;
    qryVidNCNDB: TStringField;
    qryVidNSSOCSTRAH: TStringField;
    qryVidNSBZR: TStringField;
    qryVidNLITTLEHLP: TStringField;
    qryVidNKDSPZ: TSmallintField;
    qryVidNOLDSZATR: TStringField;
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    popTvDetails: TMenuItem;
    PanelLeft: TPanel;
    TV: TTreeView;
    dbgrVidN: TDBGrid;
    popTvKtoPapa: TMenuItem;
    popTvKtoDeti: TMenuItem;
    qryVidNSpZ: TStringField;
    qryVidNSP_PF: TStringField;
    qryVidNSP_FSTVP: TStringField;
    qryVidNSP_FSNV: TStringField;
    qryVidNSP_FZ: TStringField;
    Label4: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    chBoxSp_PF: TDBCheckBox;
    chBoxDkr: TDBCheckBox;
    chBoxSWsb: TDBCheckBox;
    chBoxSp_FZ: TDBCheckBox;
    dbeVidN: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    chBoxSPOV: TDBCheckBox;
    Label32: TLabel;
    chBoxSOVM: TDBCheckBox;
    qryVidNSOVM: TStringField;
    qryVidNSPOV: TStringField;
    Label33: TLabel;
    dbeKekv: TDBEdit;
    qryVidNKEKV: TStringField;
    DBText1: TDBText;
    cdsFilter: TClientDataSet;
    qryVidNNDBE: TStringField;
    LabelDtBDtE: TLabel;
    dbeDtBDtE: TDBEdit;
    sBtnPrt: TSpeedButton;
    sBtnClearSpZ: TSpeedButton;
    sBtnKekv: TSpeedButton;
    LabelLittleHelp: TLabel;
    dbmLittleHelp: TDBMemo;
    qryVidNKDSCHDT: TSmallintField;
    qryVidNKDSCHKT: TSmallintField;
    Label6: TLabel;
    Label7: TLabel;
    dbeSchDt: TDBEdit;
    sBtnSchDt: TSpeedButton;
    sBtnClearSchDt: TSpeedButton;
    Label22: TLabel;
    dbeSchKt: TDBEdit;
    sBtnSchKt: TSpeedButton;
    sBtnClearSchKt: TSpeedButton;
    qryVidNSchDt: TStringField;
    qryVidNSchKt: TStringField;
    Bevel1: TBevel;
    Label23: TLabel;
    dbChBoxIndx: TDBCheckBox;
    qryVidNSSRK: TStringField;
    qryVidNDKR: TStringField;
    qryVidNSWSB: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popTvFullExpandClick(Sender: TObject);
    procedure popTvFullCollapseClick(Sender: TObject);
    procedure popTvExitClick(Sender: TObject);
//    procedure popTvVuborClick(Sender: TObject);
    procedure popTvPopup(Sender: TObject);
    procedure popTvEdtClick(Sender: TObject);
    procedure popTvAddInRootClick(Sender: TObject);
    procedure qryVidNAfterPost(DataSet: TDataSet);
    procedure popTvSaveToFileClick(Sender: TObject);
    procedure popTvLoadFromTableClick(Sender: TObject);
    procedure popTvDelClick(Sender: TObject);
    procedure popTvAddFirstInCurrentClick(Sender: TObject);
    procedure popTvAddLastInCurrentClick(Sender: TObject);
    procedure popTvInsertBeforeCurrentClick(Sender: TObject);
    procedure popTvAddInNodeClick(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
    procedure PanelRightResize(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure sBtnSPZClick(Sender: TObject);
    procedure popTvMoveInToClick(Sender: TObject);
    procedure popTvMoveToBeforeClick(Sender: TObject);
    procedure popTvDetailsClick(Sender: TObject);
    procedure popTvKtoPapaClick(Sender: TObject);
    procedure popTvKtoDetiClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure DBCheckBoxEnter(Sender: TObject);
    procedure DBCheckBoxExit(Sender: TObject);
    procedure TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
                            State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure sBtnPrtClick(Sender: TObject);
    procedure sBtnClearSpZClick(Sender: TObject);
    procedure sBtnKekvClick(Sender: TObject);
    procedure sBtnSchDtClick(Sender: TObject);
    procedure sBtnSchKtClick(Sender: TObject);
    procedure qryVidNCalcFields(DataSet: TDataSet);
    procedure sBtnClearSchDtClick(Sender: TObject);
    procedure sBtnClearSchKtClick(Sender: TObject);
  private
    { Private declarations }
    c_SvVidN : string4;
    b_WasUpdated : boolean;
    bCheckUslovieVubora : boolean;  // проверка допустимости выбора видов
    bTvReady, bVuborMode : boolean;
    //function MaxTreeId : integer;
    procedure TvLoadFromTable;                                     //
    procedure SaveTvToFiles(cTvFile1, cTvFile2 : string);          //
    procedure LoadTvFromFiles(cTvFile1, cTvFile2 : string);
    function MyTVLocateVidN(cVidN : string4) : boolean;
             // если находит cVidN в дереве - оставляет указатель на нем
//    function MyTVLocateShVidN(cShVidN : string;
//                                    var nErrCode : integer) : boolean;
             // если находит cShVidN в дереве - оставляет указатель на нем
//    procedure TvSaveToTable;   // и включить эту!!! TYTYTYT
//    function NewKdVidN(nPIndx : integer) : integer;
    procedure SetDetState;
    procedure UpdLvlIndx;
    procedure Synchronize;
    procedure AddNewVid(cVidN : string4; cShVidN, cNmVidN : string);
    function GetPapa(mySelNode : TTreeNode; var cPapaNm : string;
                    var mChldKdVidList, mChldNmVidList : TStringList) : boolean;
    function GetDeti(mySelNode : TTreeNode; var cVidNm : string;
                    var mChldKdVidList, mChldNmVidList : TStringList) : boolean;

    function InUslovieVubora(VidN: ShortString): Boolean;
    
    procedure CreOpenCdsFilter(LbxFilter : TListBox);
  public
    class function GetPayTypeInfo(var PayTypeInfo: TVidNInfo;
      var KdSpZ: integer; var Updated: boolean; LbxFilter: TListBox): boolean;
  end;

procedure ShowTreeVids(cVidN : string4; var bWasUpdated : boolean);
function GetVidN(var cVidN, p_KEKV : string4;
                 var p_ShVidN : string15; var p_NmVidN : string;
                 var p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                 var p_KdSpZ : integer; var bWasUpdated : boolean;
                                                LbxFilter : TListBox) : boolean;
function GetVidInfo(var nAIndx, nPIndx : integer;
                           var cVidN, cVidNPrnt, cVidNChld : string4;
                           var cShVid, cShPrnt : string; var bHsChld : boolean;
                           mLstKdChld, mLstShChld : TStringList) : boolean;

const SECTION = 'z_TVids';

var
  FormTVids: TFormTVids;

implementation

uses a_Const, Z_Main, A_DM, Z_DM, A_SBU, A_StZ,
     z_eVids, z_VidGoT, z_EVidCh, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowTreeVids(cVidN : string4; var bWasUpdated : boolean);
begin
  FormTVids := TFormTVids.Create(Application);
  with FormTVids do begin
    bCheckUslovieVubora := false;
    with TIniFile.Create(cNmIniFile) do begin
      c_SvVidN := ReadString(SECTION, 'cSvVidN', '');
      Free;
    end;
    b_WasUpdated := false;
    bBtnCancel.Caption := 'Выход';
    bBtnOk.Visible := false;
    bVuborMode := false;
    if cVidN <> '' then
      MyTVLocateVidN(cVidN)
    else if c_SvVidN <> '' then
      MyTVLocateVidN(c_SvVidN)
    else
      TV.Items[0].Selected := true;
    ShowModal;
    bWasUpdated := b_WasUpdated;
    Free;
  end;
end;

//------------------------------------------------------------------------------
class function TFormTVids.GetPayTypeInfo(
  var PayTypeInfo: TVidNInfo;
  var KdSpZ: integer;
  var Updated: boolean;
  LbxFilter: TListBox): boolean;
begin
  Result := GetVidN(PayTypeInfo.VidN, PayTypeInfo.KEKV,
    PayTypeInfo.ShVidN, PayTypeInfo.NmVidN,
    PayTypeInfo.Zp13, PayTypeInfo.Otp, PayTypeInfo.Bln,
    PayTypeInfo.Otpuskn, PayTypeInfo.Bolnic,
    PayTypeInfo.SPrm, PayTypeInfo.CPrm,
    PayTypeInfo.Deti, PayTypeInfo.DetiM, PayTypeInfo.DetiK, PayTypeInfo.DetiG,
    PayTypeInfo.Sovm, PayTypeInfo.Spov, PayTypeInfo.Ind,
    PayTypeInfo.Dhd, PayTypeInfo.OklFnd, PayTypeInfo.CBudg,
    PayTypeInfo.SNdb, PayTypeInfo.SPdn, PayTypeInfo.SPrf, PayTypeInfo.SPens,
    PayTypeInfo.SAlim, PayTypeInfo.SSocStrah, PayTypeInfo.SBzr, PayTypeInfo.CNdb,
    PayTypeInfo.Sp_PF, PayTypeInfo.Sp_FSTVP, PayTypeInfo.Sp_FSNV, PayTypeInfo.Sp_FZ,
    KdSpZ, Updated, LbxFilter);
end;

//------------------------------------------------------------------------------
function GetVidN(var cVidN, p_KEKV : string4;
                 var p_ShVidN : string15; var p_NmVidN : string;
                 var p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                 var p_KdSpZ : integer; var bWasUpdated : boolean;
                                               LbxFilter : TListBox) : boolean;
begin
  Result := false;
  FormTVids := TFormTVids.Create(Application);
  with FormTVids do begin
    bCheckUslovieVubora := false;
    if LbxFilter.Items.Count > 0 then begin
      bCheckUslovieVubora := true;
      CreOpenCdsFilter(LbxFilter);
    end;
    b_WasUpdated := false;
    bBtnCancel.Caption := 'Отказ';
    bBtnOk.Caption := 'Выбор';
    bBtnOk.Visible := true;
    bVuborMode := true;
    p_KEKV      := '';
    p_ShVidN    := '';
    p_NmVidN    := '';
    p_zp13      := '';
    p_Otp       := '';
    p_Bln       := '';
    p_Otpuskn   := '';
    p_Bolnic    := '';
    p_SPrm      := '';
    p_CPrm      := '';
    p_Deti      := '';
    p_DetiM     := '';
    p_DetiK     := '';
    p_DetiG     := '';
    p_Sovm      := '';
    p_Spov      := '';
    p_Ind       := '';
    p_Dhd       := '';
    p_OklFnd    := '';
    p_CBudg     := '';
    p_SNdb      := '';
    p_SPdn      := '';
    p_SPrf      := '';
    p_SPens     := '';
    p_SAlim     := '';
    p_SSocStrah := '';
    p_SBzr      := '';
    p_CNdb      := '';
    p_Sp_PF     := '';
    p_Sp_FSTVP  := '';
    p_Sp_FSNV   := '';
    p_Sp_FZ     := '';
    p_KdSpZ     := 0;
    if cVidN <> '' then         // Попытаться поставить дерево на этот вид
      MyTVLocateVidN(cVidN)
    else if c_SvVidN <> '' then
      MyTVLocateVidN(c_SvVidN)
    else
      TV.Items[0].Selected := true;
    if (ShowModal = mrOk) and (TV.Selected <> nil) and
       (qryVidN.Locate('VidN', PTreeRec(TV.Selected.Data)^.VidN, [])) then begin
      bWasUpdated := b_WasUpdated;
      cVidN       := PTreeRec(TV.Selected.Data)^.VidN;
      p_KEKV      := qryVidNKekv.AsString;
      p_ShVidN    := qryVidNShVidN.AsString;
      p_NmVidN    := qryVidNNmVidN.AsString;
      p_zp13      := qryVidNzp13.AsString;
      p_Otp       := qryVidNOtp.AsString;
      p_Bln       := qryVidNBln.AsString;
      p_Otpuskn   := qryVidNOtpuskn.AsString;
      p_Bolnic    := qryVidNBolnic.AsString;
      p_SPrm      := qryVidNSPrm.AsString;
      p_CPrm      := qryVidNCPrm.AsString;
      p_Deti      := qryVidNDeti.AsString;
      p_DetiM     := qryVidNDetiM.AsString;
      p_DetiK     := qryVidNDetiK.AsString;
      p_DetiG     := qryVidNDetiG.AsString;
      p_Sovm      := qryVidNSovm.AsString;
      p_Spov      := qryVidNSpov.AsString;
      p_Ind       := qryVidNInd.AsString;
      p_Dhd       := qryVidNDhd.AsString;
      p_OklFnd    := qryVidNOklFnd.AsString;
      p_CBudg     := qryVidNCBudg.AsString;
      p_SNdb      := qryVidNSNdb.AsString;
      p_SPdn      := qryVidNSPdn.AsString;
      p_SPrf      := qryVidNSPrf.AsString;
      p_SPens     := qryVidNSPens.AsString;
      p_SAlim     := qryVidNSAlim.AsString;
      p_SSocStrah := qryVidNSSocStrah.AsString;
      p_SBzr      := qryVidNSBzr.AsString;
      p_CNdb      := qryVidNCNdb.AsString;
      p_Sp_PF     := qryVidNSp_PF.AsString;
      p_Sp_FSTVP  := qryVidNSp_FSTVP.AsString;
      p_Sp_FSNV   := qryVidNSp_FSNV.AsString;
      p_Sp_FZ     := qryVidNSp_FZ.AsString;
      p_KdSpZ     := qryVidNKdSpZ.AsInteger;
      Result      := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetVidInfo(var nAIndx, nPIndx : integer;
                           var cVidN, cVidNPrnt, cVidNChld : string4;
                           var cShVid, cShPrnt : string; var bHsChld : boolean;
                           mLstKdChld, mLstShChld : TStringList) : boolean;
var i, nCurAIndx, nKdChld : integer;
    cShChld, cMsg : string;
    mSelNode, mParentNode, mCurNode : TTreeNode;
begin
  FormTVids := TFormTVids.Create(Application);
  with FormTVids do begin
    bCheckUslovieVubora := false;
    cShVid := '';
    cShPrnt := '';
    bHsChld := false;
    nKdChld := 0;
    if nAIndx >= 0 then
      Tv.Items[nAIndx].Selected := true
    else if cVidN <> '' then
      MyTVLocateVidN(cVidN);
    mSelNode := Tv.Selected;
    nPIndx := -1;
    mParentNode := mSelNode.Parent;
    bHsChld := mSelNode.HasChildren;
    if mParentNode <> nil then begin
      nPIndx := TV.Selected.Parent.AbsoluteIndex;
      cVidNPrnt := PTreeRec(mParentNode.Data)^.VidN;
      cShPrnt := PTreeRec(mParentNode.Data)^.ShVidN;
    end;
    cVidN := PTreeRec(TV.Selected.Data)^.VidN;
    cShVid := PTreeRec(TV.Selected.Data)^.ShVidN;
    if bHsChld then begin
      mCurNode := mSelNode.getFirstChild;
      while mCurNode <> nil do begin
        nCurAIndx := mCurNode.AbsoluteIndex;
        cVidNChld := PTreeRec(TV.Items[nCurAIndx].Data)^.VidN;
        cShChld := PTreeRec(TV.Items[nCurAIndx].Data)^.ShVidN;
        mLstKdChld.Add(IntToStr(nKdChld));
        mLstShChld.Add(cShChld);
        mCurNode := mCurNode.GetNextChild(mCurNode);    // все тут правильно -
                               // - намыкался, пока понял, что надо именно так
      end;
    end;
    cMsg := 'Ищем информацию о виде ' + cShVid + ' с кодом ' + cVidN;
    if nPIndx >= 0 then
      cMsg := cMsg + #13#10 + 'Parent = ' + cShPrnt +
                                                 ' с кодом ' + cVidNPrnt;
    if bHsChld then for i := 0 to mLstKdChld.Count-1 do
      cMsg := cMsg + #13#10 + mLstKdChld[i] + ' ' + mLstShChld[i]
    else
      cMsg := cMsg + #13#10 + 'Детей нет.';
    ShowMessage(cMsg);
    Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.CreOpenCdsFilter(LbxFilter : TListBox);
var cLbxText : string;
    cVidFrom, cVidTo : string4;
    i : integer;
begin
  if cdsFilter.Active then cdsFilter.Close;
  if LbxFilter.Items.Count > 0 then with cdsFilter do begin
    CreateDataSet;
    Open;
    for i := 0 to LbxFilter.Items.Count-1 do begin
      cLbxText := LbxFilter.Items[i];
      if cLbxText <> '' then begin
        cVidFrom := Copy(cLbxText, 1, 4);
        cVidTo := Copy(cLbxText, 6, 4);
        Append;
        FieldByName('VidFrom').AsString := cVidFrom;
        FieldByName('VidTo').AsString := cVidTo;
        Post;
      end;
    end;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'InclVids.cds');
  end;
end;
//--------------- Проверено ----------------------------------------------------
procedure TFormTVids.TvLoadFromTable;
// Создать файл cNmTV1 по записям таблицы z_KdVidN и загрузить его
// в дерево (так проще всего). Заполнить связанные объекты
var F1 : TextFile;
    cNmTv1, cMsg : string;
    cShVidN : ShortString;
    i : integer;
    MyTreeRec : PTreeRec;
begin
  bTvReady := false;
  cNmTv1 := 'VidN.tv1';
  AssignFile(F1, cDirTemp + cNmTV1);
  Rewrite(F1);
  with qryVidN do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdVidN order by AIndx, Lvl, PIndx');
    Open;
    First;
    while not Eof do begin
      cMsg := '';
      for i := 1 to FieldByName('Lvl').AsInteger do begin
        cMsg := cMsg + ' ';
      end;
      cShVidN := FieldByName('ShVidN').AsString;
      if FieldByName('Lvl').AsInteger > 0 then
      //                             for i := Length(cShVidN) to 15 do
        cShVidN := cShVidN + ' - ';
      cMsg := cMsg + FieldByName('VidN').AsString + '  ' +
                           {FieldByName('ShVidN').AsString} cShVidN + {' - ' +}
                             FieldByName('NmVidN').AsString;
      WriteLn(F1, cMsg);
      Next;
    end;
    CloseFile(F1);
    // Загрузить дерево из только что созданного
    // текстового файла (cDirTemp + cNmTV1):
    TV.Items.BeginUpdate;
    TV.Items.Clear;
    TV.LoadFromFile(cDirTemp + cNmTV1);
    if TV.Items.Count > 0 then
      TV.Items[0].Selected := true;
    TV.Items.EndUpdate;
    if {not bFlagDbg and} FileExists(cDirTemp + cNmTV1) then
      DeleteFile(cDirTemp + cNmTV1);
    // Заполнить связанные Objects
    First;
    i := 0;
    while not Eof do begin
      New(MyTreeRec);
      MyTreeRec.VidN   := FieldByName('VidN').AsString;
      MyTreeRec.ShVidN := FieldByName('ShVidN').AsString;
      MyTreeRec.NmVidN := FieldByName('NmVidN').AsString;
      TV.Items[i].Data := MyTreeRec;
      Inc(i);
      Next;
    end;
  end;
  bTvReady := true;
  if TV.Items.Count > 0 then
    TV.Items[0].Selected := true;
  qryVidN.First;
end;
//------------------------------------------------------------------------------
function TFormTVids.MyTVLocateVidN(cVidN : string4) : boolean;
         // если находит cVidN в дереве - оставляет указатель на нем
var i : integer;
begin
  Result := false;
  with TV do for i := 0 to Items.Count - 1 do
    if PTreeRec(Items[i].Data)^.VidN = cVidN then begin
      Items[i].Selected := true; // оставляем указатель на найденном cVidN
      Result := true;
      Break;
    end;
end;
(*
//------------------------------------------------------------------------------
procedure TFormTVids.TvSaveToTable;
//var cSchBU, cNmSBU, cHsCh : string;
//    i, nCntAdd, nKdSBU, nLvl, nIndx, nAIndx, nPIndx : SmallInt;
//var i, nKdVidN, nOldKdVidN, nAIndx, nPIndx, nLvl, nIndx, nPos : SmallInt;
//    cShVidN, cNmVidN, cHsCh, cTmp : string;
begin
  // Сохранить дерево в таблицу Kd_SBU
  Form_Dm.DbMain.StartTransaction;
  // Сделать по науке с TRY - EXCEPT
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Delete from z_KdVidN');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Set generator Nr_ZKdVidN to 0');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Insert into z_KdVidN ' +
            ' (KdVidN, OldKdVidN, ShVidN, NmVidN, ' +
            ' AIndx, PIndx, Lvl, Indx, HsCh, NoShow) ');
    SQL.Add(' values (:nKdVidN, :nOldKdVidN, :cShVidN, :cNmVidN, ' +
            ' :nAIndx, :nPIndx, :nLvl, :nIndx, :cHsCh, :cNoShow)');
    Prepare;
  end;
  nCntAdd := 0;
  for i := 0 to TV.Items.Count-1 do begin
{
  TTreeRec = record
    KdVidN : SmallInt;
    OldKdVidN : SmallInt;
    ShVidN : String15;
  end;
  // Тут не так просто -
  // = не все поля в TTreeRec
  // = Что делать со связанной таблицей?
  // ========== Думать !!!! ==========
}
    nKdSBU := PTreeRec(TV.Items[i].Data)^.KdSBU;
    cSchBU := PTreeRec(TV.Items[i].Data)^.SchBU;
    cNmSBU := PTreeRec(TV.Items[i].Data)^.NmSBU;
    nLvl   := TV.Items[i].Level;
    nIndx  := TV.Items[i].Index;
    nAIndx := TV.Items[i].AbsoluteIndex;
    nPIndx := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('nKdSBU').asSmallInt := nKdSBU;
    qryTmp.ParamByName('cSchBU').AsString   := cSchBU;
    qryTmp.ParamByName('cNmSBU').AsString   := cNmSBU;
    qryTmp.ParamByName('nAIndx').asSmallInt := nAIndx;
    qryTmp.ParamByName('nPIndx').asSmallInt := nPIndx;
    qryTmp.ParamByName('nLvl').asSmallInt   := nLvl;
    qryTmp.ParamByName('nIndx').asSmallInt  := nIndx;
    qryTmp.ParamByName('cHsCh').AsString    := cHsCh;
    qryTmp.ExecSQL;
    Inc(nCntAdd);
  end;
  Form_Dm.DbMain.Commit;
  qryTmp.UnPrepare;
  b_WasUpdated := true;
  //if bFlagDbg then
  //  ShowMessage('Добавлено записей: ' + IntToStr(nCntAdd));
  // Переоткрыть наборы
end;
*)
//------------------------------------------------------------------------------
procedure TFormTVids.FormCreate(Sender: TObject);
begin
  bTvReady := false;
  dbgrVidN.Visible := bFlagDbg;
//  LabelLittleHelp.Visible := bFlagDbg;
//  dbmLittleHelp.Visible := bFlagDbg;
  with TIniFile.Create(cNmIniFile) do begin
    popTvDetails.Checked := ReadBool(SECTION, 'bDet', true);
    SetDetState;
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 425);
    Width  := ReadInteger(SECTION, 'wW', 325);
    c_SvVidN := ReadString(SECTION, 'cSvVidN', '');
    Free;
  end;
  if FileExists(cDirVids + 'T_Vids.vid') then
    dbgrVidN.Columns.LoadFromFile(cDirVids + 'T_Vids.vid');
//  SetDetState;
  popTvKtoPapa.Visible := bFlagDbg;
  popTvKtoDeti.Visible := bFlagDbg;
  LabelDtBDtE.Visible := false; //bFlagDbg;
  dbeDtBDtE.Visible   := false; //bFlagDbg;
  TvLoadFromTable;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVidN.Columns.SaveToFile(cDirVids + 'T_Vids.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteString(SECTION, 'cSvVidN', PTreeRec(Tv.Selected.Data)^.VidN);
    WriteBool(SECTION, 'bDet', popTvDetails.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var cVidN : string4; bMyCanClose : boolean;
begin
  bMyCanClose := true;
  if ModalResult = mrOk then begin
    if bVuborMode then begin
      if (TV.Selected <> nil) then begin
        if TV.Selected.HasChildren then
          bMyCanClose := false
        else begin
          cVidN := PTreeRec(TV.Selected.Data)^.VidN;
          if bCheckUslovieVubora and not InUslovieVubora(cVidN) then
            bMyCanClose := false
          else
            bMyCanClose := true;
        end;
      end;
      if not bMyCanClose then begin
        ShowMessage('Выбирать можно только неузловые помеченные виды');
        ModalResult := mrNone;
        CanClose := false;
        TV.SetFocus;
      end; end
    else
      bBtnOk.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.TVChange(Sender: TObject; Node: TTreeNode);
begin
  Synchronize;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.Synchronize;
var cVidN : string4;
begin
  if not bTvReady then
    Exit;
  if (qryVidN.State in [dsEdit, dsInsert]) then
    qryVidN.Post;
  if (TV.Selected <> nil) then begin
    cVidN := PTreeRec(TV.Selected.Data)^.VidN;
    if cVidN <> '' then
      qryVidN.Locate('VidN', PTreeRec(TV.Selected.Data)^.VidN, []);
  end;
end;
(*
//------------------------------------------------------------------------------
function TFormTVids.MaxTreeId : integer;
var i : integer;
begin
  Result := 0;
  with TV do begin
    // определить максимальный KdVidN в дереве
    for i := 0 to Items.Count-1 do begin
      if PTreeRec(Items[i].Data)^.KdVidN > Result then
        Result := PTreeRec(Items[i].Data)^.KdVidN;
    end;
  end;
  with Form_Dm.qryTmp do begin
    // определить максимальный KdSchBU в tbl_Kd_SBU
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    Params.Clear;
    SQL.Add('Select Max(KdVidN) as nMax from z_KdVidN');
    Open;
    if (RecordCount <> 0) and (FieldByName('nMax').AsInteger > 0) then
      // выбрать наибольший
      Result := Max(Result, FieldByName('nMax').AsInteger);
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := '';
  end;
end;
*)
(*
//------------------------------------------------------------------------------
function TFormTVids.NewKdVidN(nPIndx : integer) : integer;
// Определить свободный KdVidN в категории, начинающейся с записи,
// где Indx = nPIndx и PIndx = -1 и до
var i, nStopKdVidN : integer; mStringList : TStringList;
begin
  Result := 0;
  nStopKdVidN := 0;
  mStringList := TStringList.Create;
  with TV do begin
    for i := 0 to Items.Count-1 do begin
      if (TV.Items[i].Parent.Index = -1) and (TV.Items[i].Index = nPIndx) then
        mStringList.Add(PTreeRec(Items[i].Data)^.VidN)
      else if (TV.Items[i].Parent.Index = nPIndx) then
        mStringList.Add(PTreeRec(Items[i].Data)^.VidN)
      else if (TV.Items[i].Parent.Index = -1) and
                (TV.Items[i].Index = nPIndx+1) then begin
        nStopKdVidN := PTreeRec(Items[i].Data)^.KdVidN - 1;
        Break;
      end;
    end;
  end;
  Result := StrToInt(mStringList[0]);
  while True do begin
    Result := Result + 1;
    if (nStopKdVidN > 0) and
           (Result > nStopKdVidN) {перевалили в след.категорию видов} then begin
      Result := 0;
      Break;
    end;
    if mStringList.IndexOf(IntToStr(Result)) = -1 then
      // Нашли подходящий - выходим
      Break;
  end;
  if Result = 0 then
    ShowMessage('Кончились коды видов в этой категории.' + #13#10 +
                'Вызывайте разработчика или присваивайте' + #13#10 +
                'любой СВОБОДНЫЙ код на свое усмотрение!');
end;
*)
//------------------------------------------------------------------------------
procedure TFormTVids.popTvPopup(Sender: TObject);
var bAllowEdt : boolean;
begin
  if (TV.Selected = nil) then Exit;
  bAllowEdt := bFlagDbg or bFlagGMS;
  popTvVubor.Visible := bVuborMode;
  popTvSep1.Visible := bAllowEdt;
  popTvEdt.Visible := bAllowEdt and (TV.Items.Count > 0);
  popTvAddInRoot.Visible := bAllowEdt;
  popTvAddFirstInCurrent.Visible := bAllowEdt and
                                              (TV.Items.Count > 0);
  popTvAddLastInCurrent.Visible := bAllowEdt and
                                              (TV.Items.Count > 0);
  popTvInsertBeforeCurrent.Visible := bAllowEdt and
                                              (TV.Items.Count > 0);
  popTvAddInNode.Visible := bAllowEdt and (TV.Items.Count > 0);
  popTvDel.Visible := bAllowEdt and (TV.Items.Count > 0);
  popTvAddInNode.Enabled := popTvAddInNode.Visible and
                                     (not TV.Selected.HasChildren);
  popTvMoveInTo.Visible := bAllowEdt and (TV.Items.Count > 0);
  popTvMoveToBefore.Visible := popTvMoveInTo.Visible;
  popTvSaveToFile.Visible := bFlagDbg;
  popTvSep2.Visible := popTvSaveToFile.Visible;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvFullExpandClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullExpand;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvFullCollapseClick(Sender: TObject);
begin
  with TV do begin
    Items.BeginUpdate;
    FullCollapse;
    Items.EndUpdate;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvExitClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
(*
procedure TFormTVids.popTvVuborClick(Sender: TObject);
begin
  if bVuborMode and (TV.Selected <> nil) and
                          (not TV.Selected.HasChildren) then begin
    ModalResult := mrOk;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormTVids.popTvEdtClick(Sender: TObject);
var cVidN : string4; cShVidN, cNmVidN, cMsg, cNmKatVN : string;
begin
  cNmKatVN := ''; // Надо как-то определить название вышележащего (Parent) узла
  cMsg := 'Редактирование узла "' + TV.Selected.Text + '"';
  cVidN   := PTreeRec(TV.Selected.Data)^.VidN;
  cShVidN := PTreeRec(TV.Selected.Data)^.ShVidN;
  cNmVidN := PTreeRec(TV.Selected.Data)^.NmVidN;
  if qryVidN.Locate('VidN', cVidN, []) then begin
    qryVidN.Edit;
    if AddEdtTVids(cMsg, cNmKatVN, cVidN) then begin     {z_eVids}
      qryVidN.Post;
      PTreeRec(TV.Selected.Data)^.VidN := qryVidNVidN.AsString;
      PTreeRec(TV.Selected.Data)^.VidN := qryVidNVidN.AsString;
      PTreeRec(TV.Selected.Data)^.ShVidN := qryVidNShVidN.AsString;
      TV.Selected.Text := qryVidNVidN.AsString + ' ' +
                              qryVidNShVidN.AsString + ' ' +
                                  qryVidNNmVidN.AsString; end
(*
      b_WasUpdated := true;
      with DmMain.qryVidN_LU do begin
        Close;
        Open;
      end; end
*)
    else begin
      qryVidN.Cancel;
    end;
  end;
end;
(*
//------------------------------------------------------------------------------
function TFormTVids.MyTVLocateShVidN(cShVidN : string;
                                       var nErrCode : integer) : boolean;
var i : integer;
begin
  Result := false;
  nErrCode := 1;                    // Not Found
  with TV do for i := 0 to Items.Count - 1 do begin
    if PTreeRec(Items[i].Data)^.ShVidN = cShVidN then begin
      if Items[i].HasChildren then begin
        nErrCode := 2;              // IsSborny
        Items[i].Selected := true;  // Чтобы показать именно введенный cShVidN
        Result := false; end
      else begin
        Items[i].Selected := true;  // оставляем указатель на найденном cShVidN
        nErrCode := 0;
        Result := true;
      end;
      Break;
    end;
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormTVids.popTvAddInRootClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    cVidN : string4;
    cShVidN, cNmVidN, cMsg, cNmKatVN : string;
//    NewTreeNode : TTreeNode;
begin
  if TV.Items.Count = 0 then
    cMsg := 'Первый элемент в корень'
  else
    cMsg := 'Элемент добавляется последним в корень';
  cVidN := '';
  cNmKatVN := '';
  with qryVidN do begin
    Insert;
    if AddEdtTVids(cMsg, cNmKatVN, cVidN) then begin       {z_eVids}
//      if cVidN = '' then
//        cVidN := MaxTreeId + 1;
      FieldByName('VidN').AsString := cVidN;
      cShVidN := FieldByName('ShVidN').AsString;
      cNmVidN := FieldByName('NmVidN').AsString;
      bTvReady := false;
      New(MyRecPtr);
      MyRecPtr.VidN   := cVidN;
      MyRecPtr.ShVidN := cShVidN;
      MyRecPtr.NmVidN := cNmVidN;
//      NewTreeNode := TV.Items.AddObject(nil, IntToStr(cVidN + ' ' +
//                                     cShVidN + ' ' + cNmVidN + ' ', MyRecPtr);
//      TV.Selected := NewTreeNode;
      Post;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize; end
{*
      b_WasUpdated := true;
      with DmMain.qryVidN_LU do begin
        Close;
        Open;
      end; end
*}
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvAddFirstInCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    cVidN : string4;
    cShVidN, cNmVidN, cMsg : string;
    NewTreeNode : TTreeNode;
    TreeViewIndex: LongInt;
begin
  cMsg := 'Элемент добавляется первым на текущий уровень';
  with qryVidN do begin
    Insert;
    if AddEdtTVids(cMsg, '', cVidN) {z_eVids} then begin
      TreeViewIndex := TV.Selected.AbsoluteIndex;
//      if nKdVidN = 0 then
//        nKdVidN := MaxTreeId + 1;
      FieldByName('VidN').AsString := cVidN;
      cVidN   := FieldByName('VidN').AsString;
      cShVidN := FieldByName('ShVidN').AsString;
      cNmVidN := FieldByName('NmVidN').AsString;
      bTvReady := false;
      New(MyRecPtr);
      MyRecPtr.VidN   := cVidN;
      MyRecPtr.ShVidN := cShVidN;
      MyRecPtr.NmVidN := cNmVidN;
      NewTreeNode := TV.Items.AddObjectFirst(TV.Items[TreeViewIndex],
                        cVidN + ' ' +
                                 cShVidN + ' ' + cNmVidN + ' ', MyRecPtr);
      TV.Selected := NewTreeNode;
      Post;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize;
      b_WasUpdated := true; end
(*
      with DmMain.qryVidN_LU do begin
        Close;
        Open;
      end; end
*)
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvAddLastInCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec;
//    nPIndx : integer;
    cVidN : string4;
    cShVidN, cNmVidN, cMsg : string;
    NewTreeNode : TTreeNode;
    TreeViewIndex: LongInt;
begin
  cMsg := 'Элемент добавляется последним на текущий уровень';
  with qryVidN do begin
//    nPIndx := TV.Selected.Parent.Index;
//    cVidN := NewKdVidN(nPIndx);   // Желательный код вида в этой категории
    cVidN := '';
    Insert;
    FieldByName('VidN').AsString := cVidN;
    if AddEdtTVids(cMsg, '', cVidN) {z_eVids} then begin
      TreeViewIndex := TV.Selected.AbsoluteIndex;
//      if (FieldByName('KdVidN').IsNull) or
//                       (FieldByName('KdVidN').AsInteger = 0) then
//        nKdVidN := MaxTreeId + 1;
      FieldByName('VidN').AsString := cVidN;
      cShVidN := FieldByName('ShVidN').AsString;
      cNmVidN := FieldByName('NmVidN').AsString;
      bTvReady := false;
      New(MyRecPtr);
      MyRecPtr.VidN   := cVidN;
      MyRecPtr.ShVidN := cShVidN;
      MyRecPtr.NmVidN := cNmVidN;
      NewTreeNode := TV.Items.AddObject(TV.Items[TreeViewIndex],
                                    cVidN + ' ' +
                                    cShVidN + ' ' + cNmVidN + ' ', MyRecPtr);
      TV.Selected := NewTreeNode;
      Post;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize; end
(*
      b_WasUpdated := true;
      with DmMain.qryVidN_LU do begin
        Close;
        Open;
      end; end
*)
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvInsertBeforeCurrentClick(Sender: TObject);
var MyRecPtr: PTreeRec;
//    nPIndx : integer;
    cVidN : string4;
    cShVidN, cNmVidN, cMsg : string;
    NewTreeNode : TTreeNode;
    TreeViewIndex: LongInt;
begin
  cMsg := 'Элемент вставляется впереди "' + TV.Selected.Text + '"';
  with qryVidN do begin
//    nPIndx := TV.Selected.Parent.Index;
//    nKdVidN := NewKdVidN(nPIndx); // Желательный код вида в этой категории
    cVidN := '';
    Insert;
    FieldByName('VidN').AsString := cVidN;
    if AddEdtTVids(cMsg, '', cVidN) {z_eVids} then begin
      TreeViewIndex := TV.Selected.AbsoluteIndex;
//      if nKdVidN = 0 then
//        nKdVidN := MaxTreeId + 1;
      FieldByName('VidN').AsString := cVidN;
      cShVidN := FieldByName('ShVidN').AsString;
      cNmVidN := FieldByName('NmVidN').AsString;
      bTvReady := false;
      New(MyRecPtr);
      MyRecPtr.VidN   := cVidN;
      MyRecPtr.ShVidN := cShVidN;
      MyRecPtr.NmVidN := cNmVidN;
      NewTreeNode := TV.Items.InsertObject(TV.Items[TreeViewIndex],
                        cVidN + ' ' + cShVidN + ' ' + cNmVidN + ' ', MyRecPtr);
      TV.Selected := NewTreeNode;
      Post;
      bTvReady := true;
      UpdLvlIndx;
      Close;
      Open;
      Synchronize; end
(*
      b_WasUpdated := true;
      with DmMain.qryVidN_LU do begin
        Close;
        Open;
      end; end
*)
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvAddInNodeClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    {c_VidN,} cShVidN, cNmVidN, cOldSh, cNewChldVidN, cNewSh, cNewChldSh,
                   cOldNm, cNewNm, cNewChldNm, cMsg : string;
//    nSvKdVidN, nKdVidN : integer;
    cSvVidN, cVidN : string4;
    mDestTreeNode, mNewTreeNode : TTreeNode;
    nTmpIndx, nTreeViewIndex: LongInt;
begin
  cMsg := 'Первый элемент ВНУТРЬ узла "' + TV.Selected.Text + '"';
  nTreeViewIndex := TV.Selected.AbsoluteIndex;
  cSvVidN := PTreeRec(TV.Items[nTreeViewIndex].Data)^.VidN;
  cOldSh := PTreeRec(TV.Items[nTreeViewIndex].Data)^.ShVidN + '/стар';
  cOldNm := PTreeRec(TV.Items[nTreeViewIndex].Data)^.NmVidN + ' (стар)';
  cNewSh := PTreeRec(TV.Items[nTreeViewIndex].Data)^.ShVidN + '/сб';
  cNewNm := PTreeRec(TV.Items[nTreeViewIndex].Data)^.NmVidN + ' (сб)';
  if AddChildVid(cOldSh, cNewSh, cNewChldSh,    {A_EVidCh}
                           cOldNm,  cNewNm,  cNewChldNm) then begin
    // Не изменяя старого, который хотим расширить до родительского, ввожу
    // нового родителя с новым автоКодом, но с производным от старого названием
    // Потом в этот новый перевожу старый уже существующий первым дитем
    // Потом добавляю заказанный ITEM вторым дитем
    if bFlagDbg then
      ShowMessage('Новые шифр и назв. отца ' + cNewSh + ' ' + cNewNm +
          #13#10 + 'Новые шифр и назв. дочки ' + cNewChldSh + ' ' + cNewChldNm);
    nTmpIndx := nTreeViewIndex;
//    nKdVidN := MaxTreeId + 1;
    bTvReady := false;
    New(MyRecPtr);
    cShVidN := cNewSh;
    cNmVidN := cNewNm;
    MyRecPtr.VidN := cVidN;
    MyRecPtr.ShVidN := cShVidN;
    MyRecPtr.NmVidN := cNmVidN;
    mNewTreeNode := TV.Items.InsertObject(TV.Items[nTmpIndx],
                                        cShVidN + '  ' + cNmVidN, MyRecPtr);
    TV.Selected := mNewTreeNode;
    // Добавить этот новый TreeNode в таблицу z_KdVidN
    AddNewVid(cVidN, cShVidN, cNmVidN);
    // теперь в него ввести 1-м дитем старый item со СТАРЫМ KdVidN
    mDestTreeNode := mNewTreeNode;                // ======
    // у старого изменился АИндкс, т.к. перед ним вставили новый. Поэтому:
    nTmpIndx := nTmpIndx + 1;
    mNewTreeNode := TV.Items.Item[nTmpIndx];
    TV.Selected := mNewTreeNode;
    cVidN := cSvVidN;
    cShVidN := cOldSh;
    cNmVidN := cOldNm;
    PTreeRec(TV.Selected.Data)^.VidN := cVidN;
    PTreeRec(TV.Selected.Data)^.ShVidN := cShVidN;
    PTreeRec(TV.Selected.Data)^.NmVidN := cNmVidN;
    TV.Selected.Text := cVidN + ' ' + cShVidN + ' ' + cNmVidN;
    mNewTreeNode.MoveTo(mDestTreeNode, naAddChildFirst);
    // т.к. код VidN'a не изменился - ни в каких проводках ничего не исправляю!!!
    TV.Selected := mNewTreeNode;
    // Ввести новый эл-т, как второе дитя с новым автоКодом
    nTreeViewIndex := TV.Selected.AbsoluteIndex;
//    nKdVidN := MaxTreeId + 1;
    cVidN := 'xx';
    New(MyRecPtr);
    MyRecPtr.VidN := cVidN;
    MyRecPtr.ShVidN := cNewChldSh;
    MyRecPtr.NmVidN := cNewChldNm;
    mNewTreeNode := TV.Items.AddObject(TV.Items[nTreeViewIndex],
                        cVidN + ' ' + cNewChldSh + ' ' + cNewChldNm, MyRecPtr);
    TV.Selected := mNewTreeNode;
    // И этот новый TreeNode добавить в таблицу z_KdVidN
    AddNewVid(cNewChldVidN, cNewChldSh, cNewChldNm);
    bTvReady := true;
    // Правлю z_KdVidN
    UpdLvlIndx;
    qryVidN.Close;
    qryVidN.Open;
    Synchronize;
(*
    b_WasUpdated := true;
    with DmMain.qryVidN_LU do begin
      Close;
      Open;
    end;
*)
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.UpdLvlIndx;
var i, nAIndx, nPIndx, nLvl, nIndx : SmallInt; cVidN : string4; cHsCh : string;
begin
  // Обновление в таблице z_KdVidN индексов, Level и HasChildren
  Form_Dm.DbMain.StartTransaction;
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Update z_KdVidN Set AIndx = :nAIndx, PIndx = :nPIndx, ' +
            ' Lvl = :nLvl, Indx = :nIndx, HsCh = :cHsCh ' +
            ' where VidN = :cVidN');
    Prepare;
  end;
  for i := 0 to TV.Items.Count-1 do begin
    cVidN := PTreeRec(TV.Items[i].Data)^.VidN;
    nLvl   := TV.Items[i].Level;
    nIndx  := TV.Items[i].Index;
    nAIndx := TV.Items[i].AbsoluteIndex;
    nPIndx := TV.Items[i].Parent.Index;
    if Tv.Items[i].HasChildren then
      cHsCh := 'T'
    else
      cHsCh := 'F';
    qryTmp.ParamByName('cVidN').AsString := cVidN;
    qryTmp.ParamByName('nAIndx').AsSmallInt := nAIndx;
    qryTmp.ParamByName('nPIndx').AsSmallInt := nPIndx;
    qryTmp.ParamByName('nLvl').AsSmallInt   := nLvl;
    qryTmp.ParamByName('nIndx').AsSmallInt  := nIndx;
    qryTmp.ParamByName('cHsCh').AsString    := cHsCh;
    qryTmp.ExecSQL;
  end;
  Form_Dm.DbMain.Commit;
  qryTmp.UnPrepare;
  b_WasUpdated := true;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.qryVidNAfterPost(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryVidN]);
  with DmMain.qryVidN_LU do begin
    Close;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvSaveToFileClick(Sender: TObject);
var cTvFile1, cTvFile2 : string;
begin
  with SaveDialog do begin
    InitialDir := cDirSBU;
    Title := 'Сохранение дерева видов в файл';
    Filter := 'Файлы видов (*.tv1)|*.tv1';
    DefaultExt := 'tv1';
    if Execute then begin
      cTvFile1 := FileName;
      cTvFile2 := Copy(cTvFile1, 1, Length(cTvFile1)-1) + '2';
      SaveTvToFiles(cTvFile1, cTvFile2);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.SaveTvToFiles(cTvFile1, cTvFile2 : string);
var F : TextFile; cMsg : string; i : integer;
begin
  TV.SaveToFile(cTvFile1);        // штатно сохранить дерево в .tv1
  AssignFile(F, cTvFile2);        // дополнительно записать в .tv2
  Rewrite(F);                     // связки KdVidN -> ShVidN (Data)
  for i := 0 to TV.Items.Count-1 do begin
    cMsg := PTreeRec(TV.Items[i].Data)^.VidN + ' ' +
                 Trim(PTreeRec(TV.Items[i].Data)^.ShVidN);
    WriteLn(F, cMsg);
  end;
  CloseFile(F);
end;
//------------------------------------------------------------------------------
procedure TFormTVids.LoadTvFromFiles(cTvFile1, cTvFile2 : string);
var MyTreeRec : PTreeRec; F : TextFile;
    i : integer; cShVidN : string; cVidN : string4;
begin
  bTvReady := false;
  TV.Items.BeginUpdate;
  TV.Items.Clear;
  TV.LoadFromFile(cTvFile1);
  AssignFile(F, cTvFile2);
  Reset(F);
  i := 0;
  while not Eof(F) do begin
    New(MyTreeRec);
    ReadLn(F, cVidN, cShVidN);
    MyTreeRec.VidN := cVidN;
    MyTreeRec.ShVidN := Trim(cShVidN);
    TV.Items[i].Data := MyTreeRec;
    Inc(i);
  end;
  CloseFile(F);
  TV.Items.EndUpdate;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvLoadFromTableClick(Sender: TObject);
// Создать файлы cNmTv1 : string = 'Vids.tv1' и
//               cNmTv2 : string = 'Vids.tv2'
//       по записям таблицы z_KdVidN.
// Файлы cNmTv1 и cNmTv2 переписываются.
//                Процедура не используется (даже убрал popСтроку из меню,
//                но пусть пока посидит (для примера и на память).
var F1, F2 : TextFile;
    cNmTv1, cNmTv2, cMsg1, cMsg2 : string;
    i : integer;
begin
  cNmTv1 := 'Vids.tv1';
  cNmTv2 := 'Vids.tv2';
  AssignFile(F1, cDirSbu + cNmTv1);
  Rewrite(F1);
  AssignFile(F2, cDirSbu + cNmTv2);
  Rewrite(F2);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdVidN order by AIndx, Lvl, PIndx');
    Open;
    First;
    while not Eof do begin
      cMsg1 := '';
      for i := 1 to FieldByName('Lvl').AsInteger do begin
        cMsg1 := cMsg1 + ' ';
      end;
      cMsg1 := cMsg1 + FieldByName('VidN').AsString + ' ' +
                       FieldByName('ShVidN').AsString + ' ' +
                       FieldByName('NmVidN').AsString;
      WriteLn(F1, cMsg1);
      cMsg2 := FieldByName('VidN').AsString + ' ' +
                            FieldByName('ShVidN').AsString;
      WriteLn(F2, cMsg2);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  CloseFile(F1);
  CloseFile(F2);
  // Чтобы был виден возможный эффект, сразу перезагружаем
  // дерево из новых файлов:
  LoadTvFromFiles(cDirSBU + cNmTv1, cDirSBU + cNmTv2);
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvDelClick(Sender: TObject);
var cVidN : string4;
    cMsg : string; bCanDelete : boolean;
begin
  if TV.Selected.HasChildren then begin
    MessageDlg('Сначала должны быть по одному удалены все ' +
               'элементы, входящие в узел', mtError, [mbOk], 0);
    Exit;
  end;
  bCanDelete := true;
  Application.ProcessMessages;
  cVidN := PTreeRec(TV.Selected.Data)^.VidN;
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    Params.Clear;
    SQL.Add('Select Count(*) as CNT from Z_NU ' +
                        ' where (VidN = :cVidN)');
    ParamByName('cVidN').AsString := cVidN;
    Open;
    if RecordCount <> 0 then
      bCanDelete := FieldByName('CNT').AsInteger = 0;
    Close;
    SQL.Clear;
    Params.Clear;
    DataBaseName := '';
  end;
  if not bCanDelete then begin
    cMsg := 'Нельзя удалять вид ' + cVidN + ' - на него ' +
                       'есть ссылки в таблице начислений и удержаний';
    MessageDlg(cMsg, mtError, [mbOk], 0);
    Exit; end
  else begin
    cMsg := '"' + TV.Selected.Text + '"' + #13#10 + 'удаляется безвозвратно';
    cMsg := cMsg + #13#10 + 'Вы согласны?:';
    if MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      bTvReady := false;
      TV.Items.Delete(TV.Selected);
      qryVidN.Delete;
      bTvReady := true;
      UpdLvlIndx;
      qryVidN.Close;
      qryVidN.Open;
      Synchronize;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.TVDblClick(Sender: TObject);
var cVidN : string4;
begin
  if bVuborMode and (TV.Selected <> nil) then begin
    if TV.Selected.HasChildren then
      Exit
    else begin
      cVidN := PTreeRec(TV.Selected.Data)^.VidN;
      if bCheckUslovieVubora and not InUslovieVubora(cVidN) then begin
        ShowMessage('Выбирать можно только неузловые помеченные виды');
        Exit; end
      else
        ModalResult := mrOk;
    end; end
  else if not bVuborMode and (TV.Selected <> nil) then
    popTvEdt.Click;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.PanelRightResize(Sender: TObject);
begin
  PanelDetails.Top := Round((PanelRight.Height - PanelDetails.Height) / 2) - 1;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.sBtnSPZClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSPZ.SetFocus;
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSPZ := FieldByName('KdSPZ').AsInteger;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSPZ').AsInteger := nKdSPZ;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.sBtnSchDtClick(Sender: TObject);
var nKdSchDt : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSchDt.SetFocus;
  with dbeSchDt.DataSource.DataSet as TQuery do begin
    nKdSchDt := FieldByName('KdSchDt').AsInteger;
    if GetSBU(nKdSchDt, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSchDt').AsInteger := nKdSchDt;
      dbeSchKt.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.sBtnSchKtClick(Sender: TObject);
var nKdSchKt : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSchKt.SetFocus;
  with dbeSchKt.DataSource.DataSet as TQuery do begin
    nKdSchKt := FieldByName('KdSchKt').AsInteger;
    if GetSBU(nKdSchKt, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSchKt').AsInteger := nKdSchKt;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.qryVidNCalcFields(DataSet: TDataSet);
begin
  if not qryVidNKdSpZ.IsNull and (qryVidNKdSpZ.AsInteger <> 0) then
    qryVidNSpZ.AsString := Form_Dm.KdSbu2SchBU(qryVidNKdSpZ.AsInteger)
  else
    qryVidNSpZ.AsString := '';
  if not qryVidNKdSchDt.IsNull and (qryVidNKdSchDt.AsInteger <> 0) then
    qryVidNSchDt.AsString := Form_Dm.KdSbu2SchBU(qryVidNKdSchDt.AsInteger)
  else
    qryVidNSchDt.AsString := '';
  if not qryVidNKdSchKt.IsNull and (qryVidNKdSchKt.AsInteger <> 0) then
    qryVidNSchKt.AsString := Form_Dm.KdSbu2SchBU(qryVidNKdSchKt.AsInteger)
  else
    qryVidNSchKt.AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormTVids.sBtnKekvClick(Sender: TObject);
var nKdKekv : integer;  cShKekv, cNmKekv : string;
begin
  dbeKekv.SetFocus;
  with dbeKekv.DataSource.DataSet do begin
    nKdKekv := 0;
    if GetStZ(nKdKekv, cShKekv, cNmKekv) {A_StZ} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('Kekv').AsString := cShKekv;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvMoveInToClick(Sender: TObject);
var MyRecPtr: PTreeRec;
    mCurTreeNode, mDestTreeNode, mNewTreeNode : TTreeNode;
    cShCurItem, cNmCurItem : string;
    bCurHsCh, bNewHsCh : boolean;
    nCurAindx, nCurPIndx, nNewPIndx, nAIndxNewParent : LongInt;
    cVidN, cSvVidN : string4;
    cShVidN, cNmVidN, cDestShVidN, cDestNmVidN : string;
    nTmpIndx : LongInt;
    cOldSh, cNewSh, cNewChldSh, cOldNm, cNewNm, cNewChldNm : string;
begin
  mCurTreeNode := TV.Selected;
  nCurAIndx := TV.Selected.AbsoluteIndex;
  nCurPIndx := TV.Selected.Parent.Index;
  bCurHsCh := TV.Selected.HasChildren;
  cShCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.ShVidN;
  cNmCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.NmVidN;
  if VidGoToParent(cShCurItem, cNmCurItem, bCurHsCh,    {z_ObjGoT}
                       nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent) then begin
    mDestTreeNode := TV.Items.Item[nAIndxNewParent];
    bNewHsCh   := mDestTreeNode.HasChildren;
    cSvVidN  := PTreeRec(TV.Items[nAIndxNewParent].Data)^.VidN;
    cDestShVidN := PTreeRec(TV.Items[nAIndxNewParent].Data)^.ShVidN;
    cDestNmVidN := PTreeRec(TV.Items[nAIndxNewParent].Data)^.NmVidN;
    // Все изменения сначала вношу только в дерево
    // А потом гамузом перезаписываю всю таблицу z_KdObj (иначе лезут ошибки)
    if not bNewHsCh then begin
      // Запросить реквизиты для нового родителя и старого дитя на новом месте
      cOldSh := cDestShVidN + '/нов';
      cOldNm := cDestNmVidN + ' (нов.)';
      cNewSh := cDestShVidN + '/сб';
      cNewNm := cDestNmVidN + ' (сборн.)';
      cNewChldSh := cShCurItem;
      cNewChldNm := cNmCurItem;
      if AddChildVid(cOldSh, cNewSh, cNewChldSh,    {z_EVidCh}
                           cOldNm,  cNewNm,  cNewChldNm) then begin
        // 1. Открыть впереди mDestTreeNode новый TreeNode с названием, производ-
        //    ным от названия mDestTreeNode (добавить "Группа", но с новым кодом
        bTvReady := false;
        nTmpIndx := nAIndxNewParent;
        cVidN := 'yy'; // MaxTreeId + 1;      // новый код
        New(MyRecPtr);
        cShVidN := cNewSh;
        cNmVidN := cNewNm;
        MyRecPtr.VidN := cVidN;
        MyRecPtr.ShVidN := cShVidN;
        MyRecPtr.NmVidN := cNmVidN;
        mNewTreeNode := TV.Items.InsertObject(TV.Items[nTmpIndx],
                             cVidN + ' ' + cShVidN + '  ' + cNmVidN, MyRecPtr);
        TV.Selected := mNewTreeNode;
        // Добавить этот новый TreeNode в таблицу z_KdVidN
        AddNewVid(cVidN, cShVidN, cNmVidN);
        // 2. Теперь приемником становится новый TreeNode. Сам mDestTreeNode
        //    переименовываю в mNewTreeNode и, не меняя его кода (nSvKdObj) и
        //    чуть-чуть перекроив название, переношу в новый узел как 1-й дочерний
        mDestTreeNode := mNewTreeNode;
        // {теперь у приемника изменился АИндкс. Поэтому:}
        nTmpIndx := nTmpIndx + 1;
        mNewTreeNode := TV.Items.Item[nTmpIndx];
        TV.Selected := mNewTreeNode;
        cVidN := cSvVidN;
        cShVidN := cOldSh;
        cNmVidN := cOldNm;
        PTreeRec(TV.Selected.Data)^.VidN := cVidN;
        PTreeRec(TV.Selected.Data)^.ShVidN := cShVidN;
        PTreeRec(TV.Selected.Data)^.NmVidN := cNmVidN;
        TV.Selected.Text := cVidN + ' ' + cShVidN + '  ' + cNmVidN;
        mNewTreeNode.MoveTo(mDestTreeNode, naAddChildFirst);
        TV.Selected := mNewTreeNode;
        // 3. И наконец переносимый mCurTreeNode перемещаю в mDestTreeNode:
        mCurTreeNode.MoveTo(mDestTreeNode, naAddChild);
        TV.Selected := mCurTreeNode;
        // Правлю z_KdVidN
        bTvReady := true;
        UpdLvlIndx;
        qryVidN.Close;
        qryVidN.Open;
        Synchronize; end
(*
        DmMain.qryVidN_LU.Close;
        DmMain.qryVidN_LU.Open;
        b_WasUpdated := true;
*)

      else begin
        Exit;
      end; end
    else begin
      // Без доп. вопросов переносимый mCurTreeNode перемещаю в mDestTreeNode:
      mCurTreeNode.MoveTo(mDestTreeNode, naAddChild);
      TV.Selected := mCurTreeNode;
      bTvReady := true;
      UpdLvlIndx;
      qryVidN.Close;
      qryVidN.Open;
      Synchronize;
(*
      DmMain.qryVidN_LU.Close;
      DmMain.qryVidN_LU.Open;
      b_WasUpdated := true;
*)
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.AddNewVid(cVidN : string4; cShVidN, cNmVidN : string);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Insert into z_KdVidN (VidN, ShVidN, NmVidN) values ' +
            ' (:cVidN, :cShVidN, :cNmVidN)');
    ParamByName('cVidN').AsString    := cVidN;
    ParamByName('cShVidN').AsString  := cShVidN;
    ParamByName('cNmVidN').AsString  := cNmVidN;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvMoveToBeforeClick(Sender: TObject);
var mCurTreeNode, mDestTreeNode : TTreeNode;
    cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
    nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent : integer;
begin
  mCurTreeNode := TV.Selected;
  nCurAIndx  := TV.Selected.AbsoluteIndex;
  nCurPIndx  := TV.Selected.Parent.Index;
  bCurHsCh   := TV.Selected.HasChildren;
  cShCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.VidN;
  cNmCurItem := PTreeRec(TV.Items[nCurAindx].Data)^.ShVidN;
  if VidMoveTo(cShCurItem, cNmCurItem, bCurHsCh,          {z_VidGoT}
                   nCurAIndx, nCurPIndx, nNewPIndx, nAIndxNewParent) then begin
    mDestTreeNode := TV.Items.Item[nAIndxNewParent];
    mCurTreeNode.MoveTo(mDestTreeNode, naInsert);
    TV.Selected := mCurTreeNode;
    bTvReady := true;
    UpdLvlIndx;
    qryVidN.Close;
    qryVidN.Open;
    Synchronize;
(*
    b_WasUpdated := true;
    with DmMain.qryVidN_LU do begin
      Close;
      Open;
    end;
*)
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvDetailsClick(Sender: TObject);
begin
  popTvDetails.Checked := not popTvDetails.Checked;
  SetDetState;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.SetDetState;
begin
  if popTvDetails.Checked then begin
    Constraints.MaxWidth := 925;
    Constraints.MinWidth := 700;
    Width := 745;
    PanelRight.Visible := true; end
  else begin
    Constraints.MaxWidth := 725;
    Constraints.MinWidth := 500;
    Width := 365;
    PanelRight.Visible := false;
  end;
end;
//------------------------------------------------------------------------------
function TFormTVids.GetPapa(mySelNode : TTreeNode; var cPapaNm : string;
                    var mChldKdVidList, mChldNmVidList : TStringList) : boolean;
var i, nPIndx, nMaxAIndex : integer; mParentNode : TTreeNode;
begin
  Result := true;
  mParentNode := mySelNode.Parent;
  if mParentNode <> nil then begin
    nMaxAIndex := TV.Items.Count;
    i := mParentNode.AbsoluteIndex;
    cPapaNm := PTreeRec(TV.Items[i].Data)^.VidN + '  ' +
                                    PTreeRec(TV.Items[i].Data)^.NmVidN;
    nPIndx := mySelNode.Parent.Index;
    if nPIndx >= 0 then begin
      i := mySelNode.Parent.AbsoluteIndex;
      while i < nMaxAIndex-1 do begin
        Inc(i);
        if (TV.Items[i].Parent.Index = nPIndx) then begin
          mChldKdVidList.Add(PTreeRec(TV.Items[i].Data)^.VidN);
          mChldNmVidList.Add(PTreeRec(TV.Items[i].Data)^.NmVidN); end
        else
          Break;
      end;
    end; end
  else begin
    i := mySelNode.AbsoluteIndex;
    cPapaNm := PTreeRec(TV.Items[i].Data)^.VidN + '  ' +
                        PTreeRec(TV.Items[i].Data)^.NmVidN;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvKtoPapaClick(Sender: TObject);
var mSelNode : TTreeNode; cPapaNm : string;
    mChldKdVidList, mChldNmVidList : TStringList;
    cMsg : string; i : integer;
begin
  if TV.Selected = nil then Exit;
  mSelNode := TV.Selected;
  mChldKdVidList := TStringList.Create;
  mChldNmVidList := TStringList.Create;
  cPapaNm := '';
  if GetPapa(mSelNode, cPapaNm, mChldKdVidList, mChldNmVidList) then begin
    cMsg := cPapaNm;
    if mChldKdVidList.Count = 0 then
      cMsg := cMsg + '  Папы нет'
    else begin
      cMsg := cMsg + '  Имеет детей:';
      for i := 0 to mChldKdVidList.Count-1 do
        cMsg := cMsg + #13#10 + mChldKdVidList[i] + '  ' + mChldNmVidList[i];
    end;
    ShowMessage(cMsg);
  end;
  mChldKdVidList.Free;
  mChldNmVidList.Free;
end;
//------------------------------------------------------------------------------
function TFormTVids.GetDeti(mySelNode : TTreeNode; var cVidNm : string;
                    var mChldKdVidList, mChldNmVidList : TStringList) : boolean;
var i, nPIndx, nMaxAIndex : integer;
begin
  Result := true;
  if mySelNode.HasChildren then begin
    nPIndx := mySelNode.Index;
    nMaxAIndex := TV.Items.Count;
    i := mySelNode.AbsoluteIndex;
    cVidNm := PTreeRec(TV.Items[i].Data)^.VidN + '  ' +
                                    PTreeRec(TV.Items[i].Data)^.NmVidN;
    while i < nMaxAIndex-1 do begin
      Inc(i);
      if (TV.Items[i].Parent.Index = nPIndx) then begin
        mChldKdVidList.Add(PTreeRec(TV.Items[i].Data)^.VidN);
        mChldNmVidList.Add(PTreeRec(TV.Items[i].Data)^.NmVidN); end
      else
        Break;
    end; end
  else begin
    i := mySelNode.AbsoluteIndex;
    cVidNm := PTreeRec(TV.Items[i].Data)^.VidN + '  ' +
                                    PTreeRec(TV.Items[i].Data)^.NmVidN;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.popTvKtoDetiClick(Sender: TObject);
var mSelNode : TTreeNode; cVidNm : string;
    mChldKdVidList, mChldNmVidList : TStringList;
    cMsg : string; i : integer;
begin
  if TV.Selected = nil then Exit;
  mSelNode := TV.Selected;
  mChldKdVidList := TStringList.Create;
  mChldNmVidList := TStringList.Create;
  cVidNm := '';
  if GetDeti(mSelNode, cVidNm, mChldKdVidList, mChldNmVidList) then begin
    cMsg := cVidNm;
    if mChldKdVidList.Count = 0 then
      cMsg := cMsg + '  Детей нет'
    else begin
      cMsg := cMsg + '  Имеет детей:';
      for i := 0 to mChldKdVidList.Count-1 do
        cMsg := cMsg + #13#10 + mChldKdVidList[i] + '  ' + mChldNmVidList[i];
    end;
    ShowMessage(cMsg);
  end;
  mChldKdVidList.Free;
  mChldNmVidList.Free;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.DBCheckBoxEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.DBCheckBoxExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clBtnFace;
end;

//------------------------------------------------------------------------------
function TFormTVids.InUslovieVubora(VidN: ShortString): Boolean;
begin
  Result := false;

  if cdsFilter.Active
    and (cdsFilter.RecordCount > 0)
  then
    with cdsFilter do begin
      First;

      while not Eof do begin
        if (VidN >= FieldByName('VidFrom').AsString)
          // SB 27.10.2026 Ниже было строго <
          and (VidN <= FieldByName('VidTo').AsString) then
      begin
        Result := true;
        break;
      end;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormTVids.TVCustomDrawItem(Sender: TCustomTreeView;
            Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var i : integer; cVidN : string4;
begin
  with TV.Canvas do begin
    i := Node.AbsoluteIndex;
    cVidN := PTreeRec(TV.Items[i].Data)^.VidN;
    if bCheckUslovieVubora then begin
      if InUslovieVubora(cVidN) then begin
        Font.Style := [fsBold];
        Font.Color := clWindowText; end
      else begin
        Font.Style := [];
        Font.Color := clTeal;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.sBtnPrtClick(Sender: TObject);
begin
  F6PrtTVids(qryVidN); {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormTVids.sBtnClearSpZClick(Sender: TObject);
begin
  with dbeSPZ.DataSource.DataSet do begin
    if not (State in [dsInsert, dsEdit]) then
      Edit;
    FieldByName('KdSpz').AsString := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.sBtnClearSchDtClick(Sender: TObject);
begin
  with dbeSchDt.DataSource.DataSet do begin
    if not (State in [dsInsert, dsEdit]) then
      Edit;
    FieldByName('KdSchDt').AsString := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTVids.sBtnClearSchKtClick(Sender: TObject);
begin
  with dbeSchKt.DataSource.DataSet do begin
    if not (State in [dsInsert, dsEdit]) then
      Edit;
    FieldByName('KdSchKt').AsString := '';
  end;
end;

end.

