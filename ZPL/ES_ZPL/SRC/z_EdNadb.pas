unit z_EdNadb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, IniFiles;

type
  string1 = string[1];
  String3 = string[3];
  String4 = string[4];

  TFrmEdNadb = class(TForm)
    qryTmp: TQuery;
    PanelDebug: TPanel;
    sBtnHlp: TSpeedButton;
    LblFilter: TLabel;
    LblKdSpZ: TLabel;
    LbxFilter: TListBox;
    dbeKdSpZ: TDBEdit;
    PanelTabN: TPanel;
    LblTabN: TLabel;
    LblFamIO: TLabel;
    ButtonTabN: TSpeedButton;
    LblVidN: TLabel;
    BtnVidN: TSpeedButton;
    dbeTabN: TDBEdit;
    dbeVidN: TDBEdit;
    dbeShVidN: TDBEdit;
    PanelButtons: TPanel;
    chBoxSvSpsRsch: TCheckBox;
    bBtnNew: TBitBtn;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    PanelPeresch: TPanel;
    LblPeresch: TLabel;
    LblAlreadyExists: TLabel;
    ChBoxPS: TCheckBox;
    PanelGeneral: TPanel;
    LblPeriod: TLabel;
    LblObj: TLabel;
    LblKatP: TLabel;
    LblSchBU: TLabel;
    BtnObj: TSpeedButton;
    BtnKatP: TSpeedButton;
    BtnSpZ: TSpeedButton;
    LblPrcWrkTm: TLabel;
    LblNotes: TLabel;
    LblPrBeg: TLabel;
    Label7: TLabel;
    LblPrEndDt: TLabel;
    LblPrBegDt: TLabel;
    LblSmPrc: TLabel;
    LblNICh: TLabel;
    BtnKdTemu: TSpeedButton;
    LblGrp: TLabel;
    LblPrBegNum: TLabel;
    LblPrEndNum: TLabel;
    LblPerFrom: TLabel;
    LblPerTo: TLabel;
    grBoxSposob: TGroupBox;
    RBtnSps1: TRadioButton;
    RBtnSps2: TRadioButton;
    RBtnSps3: TRadioButton;
    RBtnSps4: TRadioButton;
    dbeSumProc: TDBEdit;
    dbeDtBeg: TDBEdit;
    dbeDtEnd: TDBEdit;
    dbeSpZ: TDBEdit;
    dbePrcWrkTm: TDBEdit;
    dbeNotes: TDBEdit;
    dbeNrPrBeg: TDBEdit;
    dbeDtPrBeg: TDBEdit;
    dbeNrPrEnd: TDBEdit;
    dbeDtPrEnd: TDBEdit;
    dbeKdObj: TDBEdit;
    dbeKdKatP: TDBEdit;
    dbeKatP: TDBEdit;
    dbeNmTemu: TDBEdit;
    dbeKdTemu: TDBEdit;
    dbeGrp: TDBEdit;
    dbeShObj: TDBEdit;
    PanelSovm: TPanel;
    LblDolgn: TLabel;
    sBtnGetNewOK: TSpeedButton;
    LblVidSovm: TLabel;
    sBtnSovm: TSpeedButton;
    dbeNewKdOK: TDBEdit;
    dbeNewDolgnOK: TDBEdit;
    dbeSovm: TDBEdit;
    dbeShSovm: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure dbeVidNClick(Sender: TObject);
    procedure dbeDtBegClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    dsrc_Nadb: TDataSource;

    b_showSovm: boolean;
    b_showPeresch: boolean;

    c_PredVidN: string;     // вид надбавки для не труд.согл.
    n_PredSpsRsch: integer; // способ расчёта ...
    n_PredKdKatP: integer;  // сохранённый код категории персонала ...
    n_PredSmPrc: double;    // сохранённая сумма ...

    c_OldVidN : string4;
    n_OldKdObj,
    n_OldKdTemu: integer;

    procedure SetDataSource(dataSource: TDataSource);
    procedure InitFields(nTabN, nKdSps: integer);
    procedure LoadView;
    procedure LoadControlsState;
    procedure InitControls;
    procedure RefreshControls;

    procedure StoreFieldValues;
    procedure ValidateFields(nKdObj, nKdKatP, nKdSpZ: integer);

  public
    { Public declarations }
  end;

var
  FrmEdNadb: TFrmEdNadb;

function AddEditNadb(nTabN, KdSps: integer; cFamIO: string;
    dsrcNadb: TDataSource; var bUpdated: boolean): boolean;

procedure GetPereInf(nTabN: integer; dDtProc: TDateTime;
    var nKdObj, nKdKatP, nKdSpz: integer);

implementation

{$R *.dfm}

uses
  a_Const, A_DM, Z_Main, Z_Dm;

//------------------------------------------------------------------------------
function AddEditNadb(nTabN, KdSps: integer; cFamIO: string;
    dsrcNadb: TDataSource; var bUpdated: boolean): boolean;
begin
  Result := false;

  FrmEdNadb := TFrmEdNadb.Create(Application);
  FrmEdNadb.SetDataSource(dsrcNadb);

  with FrmEdNadb do begin
    LblFamIO.Caption := cFamIO;

    InitFields(nTabN, gl_nKdSps); // KdSps
    StoreFieldValues;
    InitControls;

    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.InitFields(nTabN, nKdSps: integer);
var
  nKdObj, nKdKatP, nKdSpz: integer;
  cShTemu: string;
begin
(*
    FieldByName('KdSps').AsInteger := gl_nAppKdSpsUsr;

  if dsrc_Nadb.State = dsInsert then begin
    LoadControlsState;

    dbeTabN.Field.AsInteger := nTabN;
    dsrc_Nadb.DataSet.FieldByName('KdSps').AsInteger := nKdSps;
    dbeDtBeg.Field.AsDateTime := dCtrlDate;

    GetPereInf(nTabN, dCtrlDate, nKdObj, nKdKatP, nKdSpz);

    ValidateFields(nKdObj, nKdKatP, nKdSpz);
  end else begin
    cShTemu := Form_DM.KdTemu2NmTemu(dbeKdTemu.Field.AsInteger) {a_dm};
    dbeNmTemu.Text := cShTemu;

    c_PredVidN := dbeVidN.Field.AsString;
    n_PredSpsRsch := dsrc_Nadb.DataSet.FieldByName('SpsRsch').AsInteger;
    n_PredKdKatP := dbeKdKatP.Field.AsInteger;
    n_PredSmPrc := dbeSumProc.Field.AsFloat;
  end;
*)
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.StoreFieldValues;
begin
  with dsrc_Nadb.DataSet do begin
    c_OldVidN   := FieldByName('VidN').AsString;
    n_OldKdObj  := FieldByName('KdObj').AsInteger;
    n_OldKdTemu := FieldByName('KdKatP').AsInteger;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.FormCreate(Sender: TObject);
begin
  LoadView;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.FormShow(Sender: TObject);
begin
  b_showSovm := false;
  b_showPeresch := false;

  PanelDebug.Visible := false; // bFlagDbg;
  PanelSovm.Visible := b_showSovm;
  PanelPeresch.Visible := b_showPeresch;

  Width := PanelTabN.Width + GetSystemMetrics(SM_CXBORDER) * 2;
  if PanelDebug.Visible then
    Width := Width + PanelDebug.Width;

  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.dbeVidNClick(Sender: TObject);
begin
  b_showSovm := not b_showSovm;
  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.dbeDtBegClick(Sender: TObject);
begin
  b_showPeresch := not b_showPeresch;
  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.InitControls;
var
  bInsertMode: boolean;
begin
  bInsertMode := dsrc_Nadb.State = dsInsert;

  if dsrc_Nadb.State = dsInsert then
    Caption := 'Новая надбавка'
  else
    Caption := 'Редактирование надбавки';

    bBtnNew.Visible := bInsertMode;
    chBoxSvSpsRsch.Visible := bInsertMode;

  PanelPeresch.Visible := false;
  LblPeresch.Caption := '';
  LblAlreadyExists.Caption := '';
  dbeKdSpZ.Visible := bFlagDbg;

  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.RefreshControls;
begin
  PanelSovm.Visible := b_showSovm;
  PanelPeresch.Visible := b_showPeresch;

  Height := PanelTabN.Height + PanelGeneral.Height + PanelButtons.Height
      + GetSystemMetrics(SM_CYCAPTION) + GetSystemMetrics(SM_CYBORDER) * 2;

  PanelGeneral.Top := PanelTabN.Height;

  if b_showSovm then begin
    Height := Height + PanelSovm.Height;
    PanelGeneral.Top := PanelGeneral.Top + PanelSovm.Height;
  end;

  PanelButtons.Top := PanelGeneral.Top + PanelGeneral.Height;

  if b_showPeresch then begin
    Height := Height + PanelPeresch.Height;
    PanelPeresch.Top := PanelGeneral.Top + PanelGeneral.Height;
    PanelButtons.Top := PanelButtons.Top + PanelPeresch.Height;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.LoadView;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.LoadControlsState;
var
  nSpsRsch: integer;
begin
  with TIniFile.Create(cNmIniFile) do begin
    chBoxSvSpsRsch.Checked := ReadBool(SECTION, 'bSvSpsRsch', false);

    if chBoxSvSpsRsch.Checked then begin
      nSpsRsch := ReadInteger(SECTION, 'nSpsRsch', 0);
      dsrc_Nadb.DataSet.FieldByName('SpsRsch').AsInteger := nSpsRsch
    end;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.ValidateFields(nKdObj, nKdKatP, nKdSpZ: integer);
var
  cShKatP, cSchBu: string;
  cNone: string;
begin
  if dbeShObj.Field.AsString = '' then begin
    dbeKdObj.Field.AsInteger := nKdObj;
    dbeShObj.Field.AsString := DmMain.KdObj2ShObj(nKdObj, cNone);
  end;

  if dbeKatP.Field.AsString = '' then begin
    dbeKdKatP.Field.AsInteger := nKdKatP;
    cNone := DmMain.KdKatP2NmKatP(nKdKatP, cShKatP);
    dbeKatP.Field.AsString := cShKatP;
  end;

  if dbeSpZ.Field.AsString = '' then begin
    dbeKdSpZ.Field.AsInteger := nKdSPZ;
    if Form_Dm.KdSbu2ShNmSbu(nKdSPZ, cSchBu, cNone) then
      dbeSPZ.Field.AsString := cSchBU;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmEdNadb.SetDataSource(dataSource: TDataSource);
begin
  dsrc_Nadb := dataSource;

  dbeTabN.DataSource     := dsrc_Nadb;
  dbeVidN.DataSource     := dsrc_Nadb;
  dbeSumProc.DataSource  := dsrc_Nadb;
  dbeDtBeg.DataSource    := dsrc_Nadb;
  dbeDtEnd.DataSource    := dsrc_Nadb;
  dbeShVidN.DataSource   := dsrc_Nadb;
  dbeSPZ.DataSource      := dsrc_Nadb;
  dbeKdObj.DataSource    := dsrc_Nadb;
  dbeKdTemu.DataSource   := dsrc_Nadb;
  dbeKdSpZ.DataSource    := dsrc_Nadb;
  dbeNmTemu.DataSource   := dsrc_Nadb;
  dbeShObj.DataSource    := dsrc_Nadb;
  dbePrcWrkTm.DataSource := dsrc_Nadb;
  dbeKdKatP.DataSource   := dsrc_Nadb;
  dbeKatP.DataSource     := dsrc_Nadb;
  dbeNrPrBeg.DataSource  := dsrc_Nadb;
  dbeDtPrBeg.DataSource  := dsrc_Nadb;
  dbeNrPrEnd.DataSource  := dsrc_Nadb;
  dbeDtPrEnd.DataSource  := dsrc_Nadb;
  dbeNotes.DataSource    := dsrc_Nadb;
  dbeGrp.DataSource      := dsrc_Nadb;
end;

//------------------------------------------------------------------------------
procedure GetPereInf(nTabN: integer; dDtProc: TDateTime;
    var nKdObj, nKdKatP, nKdSpz: integer);
var
  nSO, nPdNlg, nKolMin, nRang, nRazr: integer;
  nOklTrf, nAvans, nProcLG : double;
  cSpAv : String1;
  cDolgnost, cNrPrikaza : string;
  dDtPrikaza : TDateTime;
  bPens, bSovm, bPrfs : boolean;
  nInv : SmallInt;
begin
  DmMain.GetPereInf(nTabN, dDtProc, nKdObj, nKdKatP, nSO, nPdNlg, nKolMin,
      nKdSpz, nRang, nRazr, nOklTrf, nAvans, nProcLG, cSpAv, cDolgnost,
      cNrPrikaza, dDtPrikaza, bPens, bSovm, bPrfs, nInv)
end;

end.
