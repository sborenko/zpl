unit z_ENadb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, DBCtrls, StdCtrls, Mask, ExtCtrls,
  IniFiles, Buttons, Grids, DBGrids, ComCtrls;

type
  string1 = string[1];
  String3 = string[3];
  String4 = string[4];

  TPartSalData = class
    Nr: Integer;
  end;

  TFormENadb = class(TForm)
    qryTmp: TQuery;
    PanelDebug: TPanel;
    sBtnHlp: TSpeedButton;
    LblFilter: TLabel;
    LblKdSpZ: TLabel;
    LbxFilter: TListBox;
    dbeKdSpZ: TDBEdit;
    PanelMain: TPanel;
    PanelTabN: TPanel;
    LblTabN: TLabel;
    LblFamIO: TLabel;
    SpeedButton1: TSpeedButton;
    LblVidN: TLabel;
    BtnVidN: TSpeedButton;
    dbeTabN: TDBEdit;
    dbeVidN: TDBEdit;
    dbeShVidN: TDBEdit;
    PanelSovm: TPanel;
    LblDolgn: TLabel;
    sBtnGetDlzhn: TSpeedButton;
    LblVidSovm: TLabel;
    sBtnSovm: TSpeedButton;
    dbeKdDlzhn: TDBEdit;
    dbeDlzhn: TDBEdit;
    dbeKdSovm: TDBEdit;
    dbeShSovm: TDBEdit;
    dbeKdProf: TDBEdit;
    DbChBoxElTrudKn: TDBCheckBox;
    DbChBoxSpovMerge: TDBCheckBox;
    PanelGeneral: TPanel;
    grBoxSposob: TGroupBox;
    RBtnSposb1: TRadioButton;
    RBtnSposb2: TRadioButton;
    RBtnSposb3: TRadioButton;
    RBtnSposb4: TRadioButton;
    PanelPartSal: TPanel;
    LblPartSal: TLabel;
    CmbBxPartSal: TComboBoxEx;
    PanelOthers: TPanel;
    LblPeriod: TLabel;
    LblObj: TLabel;
    LblKatP: TLabel;
    LblSchBU: TLabel;
    BtnObj: TSpeedButton;
    BtnKatP: TSpeedButton;
    BtnSpZ: TSpeedButton;
    LblPrcWrkTm: TLabel;
    LblNotes: TLabel;
    LblPrBegNum: TLabel;
    LblPrEnd: TLabel;
    LblPrEndDt: TLabel;
    LblPrBegDt: TLabel;
    LblSmPrc: TLabel;
    LblNICh: TLabel;
    BtnKdTemu: TSpeedButton;
    LblGrp: TLabel;
    Label14: TLabel;
    LblPrEndNum: TLabel;
    LblPeriodFrom: TLabel;
    LblPeriodTo: TLabel;
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
    PanelRecalc: TPanel;
    LblPeresch: TLabel;
    LabelAlreadyExists: TLabel;
    ChBoxPS: TCheckBox;
    PanelButtons: TPanel;
    chBoxSvSpsRsch: TCheckBox;
    bBtnCancel: TBitBtn;
    bBtnOk: TBitBtn;
    bBtnNew: TBitBtn;
    DbChBoxIgnNoPayVac: TDBCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure BtnVidNClick(Sender: TObject);
    procedure RBtnSposbClick(Sender: TObject);
    procedure BtnObjClick(Sender: TObject);
    procedure BtnKatPClick(Sender: TObject);
    procedure BtnKdTemuClick(Sender: TObject);
    procedure BtnSpZClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnHlpClick(Sender: TObject);

    procedure dbeVidNKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbeShObjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbeKatPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbeKdTemuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbeSpZKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure dbeSpZExit(Sender: TObject);
    procedure dbeDtBegExit(Sender: TObject);

    procedure BtnSpsRschEnter(Sender: TObject);
    procedure BtnSpsRschExit(Sender: TObject);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);

    procedure PanelDebugClick(Sender: TObject);
    procedure sBtnGetDlzhnClick(Sender: TObject);
    procedure sBtnSovmClick(Sender: TObject);
    procedure ChBoxEnter(Sender: TObject);
    procedure ChBoxExit(Sender: TObject);
    procedure dbeVidNExit(Sender: TObject);

  private
    TabN: Integer;
    Dsrc_Nadb: TDataSource;
    Ds_Nadb: TDataSet;

    // Если оклад частями и способ расчёта надбавки - % от оклада, для расчёта
    // нужно указать, от какой части оклада считается надбавка
    PartSal: Boolean;

    c_PredVidN: string;     // вид надбавки для не труд.согл.
    n_PredSpsRsch: integer; // способ расчёта ...
    n_PredKdKatP: integer;  // сохранённый код категории персонала ...
    n_PredSmPrc: double;    // сохранённая сумма ...

    c_VidN88 : ShortString; // вид начисления для "отклонения" о пересчётом

    handler_VidNChange,
    handler_SpsRschChange,
    handler_KdObjChange,
    handler_KdKatPChange,
    handler_KdTemuChange,
    handler_KdSpZChange: TFieldNotifyEvent;

    constructor Create(TabN: Integer; DsrcNadb: TDataSource); reintroduce;

    function MyMesBetween(dDt1, dDt2 : TDateTime) : integer;
    function VidExistsInOtkl(cVidN88 : ShortString;  nTabN : integer;
        dRMes, dMesPS : TDateTime) : boolean;

    procedure SetDataSource(dataSource: TDataSource);

    procedure SetHandlers;
    procedure RestoreHandlers;

    procedure InitFields(nTabN, nKdSps: integer);
    procedure InitControls;

    procedure RefreshControls;
    procedure RefreshSumPrc(nSpsRsch: integer);

    procedure HandleChangeVidN;

    function GetVidInfo(var VidN: ShortString;
      var WasUpdated: Boolean): Boolean;

    function IsInsertMode: boolean;

    function CheckDtEndOk(var cMessage: string): boolean;
    function CheckVvod : boolean;
    procedure ApplyData;

    procedure LoadControlsState;
    procedure SaveIntfaceIni;
    procedure SaveDataIni;

    procedure RefreshPanels;

    procedure OnVidNChange(Sender: TField);
    procedure OnSpsRschChange(Sender: TField);
    procedure OnKdObjChange(Sender: TField);
    procedure OnKdKatPChange(Sender: TField);
    procedure OnKdTemuChange(Sender: TField);
    procedure OnKdSpZChange(Sender: TField);
    procedure FocusSpsbRsch;

    procedure OpenSalPartsQry(SpecNr: Integer);
    procedure LoadSalParts(SpecNr: Integer);
    function SelectPartSal(PartSalId: Integer): Boolean;
    procedure ClearPartSal;
    function GetPartSal: Integer;
    procedure CheckPartSalPanel;

    procedure EnablePanel(Panel: TPanel; Enable: Boolean);
  public
    class function Run(TabN, KdSps: Integer; EmplName: ShortString;
      DsrcNadb: TDataSource; var Updated: Boolean): Boolean;

    class function VidIsDekr(VidN: ShortString): Boolean;
    class function VidIsSovm(VidN: ShortString): Boolean;
  end;

procedure GetPereInf(nTabN: integer; dDtProc: TDateTime;
    var nKdObj, nKdKatP, nKdSpz: integer);

const
  SECTION = 'Z_ENadb';

implementation

uses A_Const, A_Lib, A_ShwErr, A_DM, A_SBU,
    Z_DM, Z_Main, Z_TVids, Z_TObj, Z_GtPers, Z_HENadb, Z_ShwTem,
    z_dk2010, z_GtSovm, VidNUtils, DateLib, QryLib, SalaryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFormENadb.Run(
  TabN, KdSps: Integer;
  EmplName: ShortString;
  DsrcNadb: TDataSource;
  var Updated: Boolean
): Boolean;
begin
  with TFormENadb.Create(TabN, DsrcNadb) do begin
    LblFamIO.Caption := EmplName;

    Result := ShowModal = mrOk;

    Free;
  end;
end;

//------------------------------------------------------------------------------
constructor TFormENadb.Create(
  TabN: Integer;
  DsrcNadb: TDataSource
);
begin
  inherited Create(nil);

  Self.TabN := TabN;
  Self.Dsrc_Nadb := DsrcNadb;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.FormCreate(Sender: TObject);
var
  AssgnSpecNr: Integer;
  AssgnSpan: TSpan;
  PartSalIndx: Integer;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;

  SetDataSource(Dsrc_Nadb);
  SetHandlers;

  // Определяем текущее перемещение
  AssgnSpan := DateUtils.InitPeriod(DateUtils.Today, DateUtils.Today);
  SalaryUtils.SelAssgns(QryTmp, TabN, AssgnSpan);

  PartSal := QryTmp.FieldByName('CmbOkl').AsString = '1';
  AssgnSpecNr := QryTmp.FieldByName('Spec_Nr').AsInteger;

  QryUtils.ReleaseQuery(QryTmp);

  // Для оклада частями загружаем частичные оклады
  if PartSal then begin
    LoadSalParts(AssgnSpecNr);

    if not SelectPartSal(Ds_Nadb.FieldByName('PartSalId').AsInteger) then
      ClearPartSal;
  end;

  InitFields(TabN, gl_nKdSps);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.FormShow(Sender: TObject);
begin
  InitControls;
  PanelDebug.Visible := bFlagDbg;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if CheckVvod then
      ApplyData
    else begin
      CanClose := false;
      dbeVidN.SetFocus;
    end;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveIntfaceIni;
  RestoreHandlers;
end;

//------------------------------------------------------------------------------
// Initialization
//------------------------------------------------------------------------------
procedure TFormENadb.InitFields(nTabN, nKdSps: integer);
var
  nKdObj, nKdKatP, nKdSpz: integer;
begin
  if IsInsertMode then begin
    dbeTabN.Field.AsInteger := nTabN;
    ds_Nadb.FieldByName('KdSps').AsInteger := nKdSps;
    dbeDtBeg.Field.AsDateTime := dCtrlDate;

    if (dbeShObj.Field.AsString = '')
        or (dbeKatP.Field.AsString = '')
        or (dbeSpZ.Field.AsString = '') then begin

      GetPereInf(nTabN, dCtrlDate, nKdObj, nKdKatP, nKdSpz);

      dbeKdObj.Field.AsInteger := nKdObj;
      dbeKdKatP.Field.AsInteger := nKdKatP;
      dbeKdSpZ.Field.AsInteger := nKdSPZ;
    end;

    // Оксана 260323 В электр. трудовую книжку, по умолчанию - "да"
    Ds_Nadb.FieldByName('Is_Pere').AsString := 'Y';
  end else begin
    dbeNmTemu.Text := Form_DM.KdTemu2NmTemu(dbeKdTemu.Field.AsInteger);

    c_PredVidN := dbeVidN.Field.AsString;
    n_PredSpsRsch := ds_Nadb.FieldByName('SpsRsch').AsInteger;
    n_PredKdKatP := dbeKdKatP.Field.AsInteger;
    n_PredSmPrc := dbeSumProc.Field.AsFloat;
  end;

  if DbChBoxIgnNoPayVac.Field.AsString <> 'Y' then
    DbChBoxIgnNoPayVac.Field.AsString := ' ';
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.InitControls;
var
  bInsertMode: boolean;
begin
  bInsertMode := IsInsertMode;

  if bInsertMode then
    Caption := 'Новая надбавка (доплата)'
  else
    Caption := 'Редактирование надбавки (доплаты)';

  ChBoxSvSpsRsch.Visible := bInsertMode;
  bBtnNew.Visible := bInsertMode;

  if bInsertMode then
    LoadControlsState;

  DbChBoxElTrudKn.Checked := ds_Nadb.FieldByName('IS_PERE').AsString = 'Y';
  DbChBoxSpovMerge.Checked := ds_Nadb.FieldByName('SPOV_MERGE').AsString = 'Y';

  CheckPartSalPanel;

  RefreshControls;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.RefreshControls;
const
  Capt1208 = 'дневная сумма';
  CaptOther = 'постоянная сумма (с учетом отработанного времени)';
  CaptSum1208 = 'Стоимость 1 р.д.';
  CaptSumOther = 'Сумма или %';
var
  cVidN: string;
  nSpsRsch: integer;
  bVidIsTrS, // труд.соглаш. = ДгвВиды
  bVidIsSovm, // совместительство
  bVidIsDekr,
  VidNIsWarDay: boolean; // декрет
begin
  cVidN      := dbeVidN.Field.AsString;
  bVidIsTrS  := Form_Dm.VidIsTrS(cVidN);
  bVidIsSovm := DmMain.VidIsSovm(cVidN);
  bVidIsDekr := VidIsDekr(cVidN);
  VidNIsWarDay := cVidN = VIDN_WAR_DAY_SUM;

  rBtnSposb1.Enabled := not bVidIsTrS;
  rBtnSposb2.Enabled := not (bVidIsTrS or VidNIsWarDay);
  rBtnSposb3.Enabled := not (bVidIsTrS or VidNIsWarDay);
  rBtnSposb4.Enabled := bVidIsTrS; // только для труд.соглашений
  rBtnSposb4.Checked := bVidIsTrS;

  nSpsRsch := ds_Nadb.FieldByName('SpsRsch').AsInteger;
  rBtnSposb1.Checked := nSpsRsch = 1;
  rBtnSposb2.Checked := nSpsRsch = 2;
  rBtnSposb3.Checked := nSpsRsch = 3;
  rBtnSposb4.Checked := nSpsRsch = 4;
  RefreshSumPrc(nSpsRsch);

  if VidNIsWarDay then begin
  	rBtnSposb1.Checked := VidNIsWarDay;
    RBtnSposb1.Caption := Capt1208;
    LblSmPrc.Caption := CaptSum1208;
  end else begin
    RBtnSposb1.Caption := CaptOther;
    LblSmPrc.Caption := CaptSumOther;
  end;

  LblPrcWrkTm.Visible := bVidIsSovm;
  dbePrcWrkTm.Visible := bVidIsSovm;

  LblGrp.Visible := bVidIsSovm;
  dbeGrp.Visible := bVidIsSovm;

  dbeKdKatP.Enabled := not bVidIsTrS;

  LblSmPrc.Visible := not bVidIsDekr;
  dbeSumProc.Visible := not bVidIsDekr;

  dbeSumProc.Enabled := not Form_Dm.VidIsTrS(cVidN);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.RefreshPanels;
begin
  Width := PanelTabN.Width + GetSystemMetrics(SM_CXBORDER) * 2;

  if PanelDebug.Visible then
    Width := Width + PanelDebug.Width;

  PanelMain.Height := PanelTabN.Height;

  PanelSovm.Visible := VidIsSovm(dbeVidN.Field.AsString);

  if PanelSovm.Visible then begin
    // Позиционируем за панелью табельного номера
    PanelSovm.Top := PanelMain.Height;
    PanelMain.Height := PanelMain.Height + PanelSovm.Height;
  end;

  PanelGeneral.Top := PanelMain.Height;
  PanelMain.Height := PanelMain.Height + PanelGeneral.Height;

  if PanelRecalc.Visible then begin
    PanelRecalc.Top := PanelMain.Height;
    PanelMain.Height := PanelMain.Height + PanelRecalc.Height;
  end;

  PanelButtons.Top := PanelMain.Height;
  PanelMain.Height := PanelMain.Height + PanelButtons.Height;

  Height := PanelMain.Height + GetSystemMetrics(SM_CYCAPTION) +
    GetSystemMetrics(SM_CYBORDER) * 2;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.RefreshSumPrc(nSpsRsch: integer);
begin
  dbeSumProc.Hint := 'Сумма или процент надбавки ' +
      'в зависимости от выбранного способа расчета';
  if nSpsRsch = 1 then begin             {способ 1 (по сумме)}
    LblSmPrc.Caption := 'Сумма надбавки';
    LblSmPrc.Font.Color := clNavy;
    dbeSumProc.Font.Color := clNavy;
    dbeSumProc.Hint := 'Сумма надбавки';
  end else if nSpsRsch = 2 then begin    {способ = 2 (процент)}
    LblSmPrc.Caption := 'Процент от оклада';
    LblSmPrc.Font.Color := clMaroon;
    dbeSumProc.Font.Color := clMaroon;
    dbeSumProc.Hint := 'Процент надбавки';
  end else if nSpsRsch = 3  then begin   {способ 3 (по сумме)}
    LblSmPrc.Caption := 'Сумма надбавки';
    LblSmPrc.Font.Color := clRed;
    dbeSumProc.Font.Color := clRed;
    dbeSumProc.Hint := 'Сумма надбавки';
  end else if nSpsRsch = 4 then begin    {способ = 4 (процент)}
    LblSmPrc.Caption := 'Нулевая сумма';
    LblSmPrc.Font.Color := clBlue;
    dbeSumProc.Font.Color := clBlue;
    dbeSumProc.Hint := 'Только для "соглашенцев" и "договорников"';
  end else begin
    LblSmPrc.Caption := 'Сумма или %';
    LblSmPrc.Font.Color := clWindowText;
    dbeSumProc.Font.Color := clWindowText;
    dbeSumProc.Hint := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.LoadSalParts(SpecNr: Integer);
var
  PartSalData: TPartSalData;
  Title, DeptSh, SpsSh, AccSh, Perc, Salary: ShortString;
begin
  OpenSalPartsQry(SpecNr);

  with QryTmp do begin
    First;

    while not Eof do begin
      PartSalData := TPartSalData.Create;
      PartSalData.Nr := FieldByName('Nr').AsInteger;

      SpsSh := FieldByName('ShSps').AsString;
      DeptSh := FieldByName('ShObj').AsString;
      AccSh := FieldByName('Sch_17').AsString;
      Perc := FormatFloat('0.00', FieldByName('PrcOkl').AsFloat);
      Salary := FormatFloat('# ##0.00', FieldByName('OklTrf').AsFloat);

      Title := SpsSh + '; ' + DeptSh + '; ' + AccSh + '; ' +
        Perc + '%' + ' от ' + Salary;

      CmbBxPartSal.ItemsEx.AddItem(Title, 0, 0, 0, 0, PartSalData);

      Next;
    end;
  end;

  QryUtils.ReleaseQuery(QryTmp);
end;

//------------------------------------------------------------------------------
procedure TFormENadb.OpenSalPartsQry(SpecNr: Integer);
begin
  QryUtils.InitQuery(QryTmp);

  with QryTmp do begin
    SQL.Text :=
      'select c.Nr, s.ShSps, o.ShObj, a.Sch_17, c.PrcOkl, c.OklTrf ' +
      'from z_CmbOkl c ' +
        'left join z_KdSps s on s.KdSps = c.KdSps ' +
        'left join z_KdObj o on o.KdObj = c.KdObj ' +
        'left join Kd_Sbu a on a.KdSch = c.KdSpz ' +
      'where Spec_Nr = :SpecNr';
    ParamByName('SpecNr').AsInteger := SpecNr;
    Open;
  end;
end;

//------------------------------------------------------------------------------
function TFormENadb.SelectPartSal(PartSalId: Integer): Boolean;
var
  I: Integer;
begin
  Result := false;

  with CmbBxPartSal, ItemsEx do
    for I := 0 to Count - 1 do
      if TPartSalData(Items[I].Data).Nr = PartSalId then begin
        ItemIndex := I;
        Result := true;
        break;
      end;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.ClearPartSal;
var
  ItemEx: TComboExItem;
  PartSalData: TPartSalData;
begin
  PartSalData := TPartSalData.Create;
  PartSalData.Nr := 0;

  with CmbBxPartSal do begin
    ItemEx := ItemsEx.Insert(0);

    with ItemEx do begin
      Caption := 'Не выбран';
      ImageIndex := 0;
      SelectedImageIndex := 0;
      OverlayImageIndex := 0;
      Indent := 0;
      Data := PartSalData;
    end;

    ItemIndex := 0;
  end;

  Ds_Nadb.FieldByName('PartSalId').AsInteger := 0;
end;

//------------------------------------------------------------------------------
function TFormENadb.GetPartSal: Integer;
begin
  Result := 0;

  with CmbBxPartSal, ItemsEx do
    if ItemIndex <> -1 then
      Result := TPartSalData(ItemsEx[ItemIndex].Data).Nr;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.BtnNewClick(Sender: TObject);
var
  nTabN, nPredKdSps, nPredSpsRsch: integer;
  cPredDtBeg, cPredDtEnd : string;
  nPredKdObj, nPredKdKatP, nPredKdSpZ : integer;
  cPredSumPrc: string;
  cPredNrPrB, cPredNrPrE : string;
  cPredDtPrB, cPredDtPrE : string;
begin
  if not CheckVvod then begin
    ModalResult := mrNone;
    dbeVidN.SetFocus; end
  else begin
    with ds_Nadb do begin
      ApplyData;

      // 03.05.2022:
      nTabN        := FieldByName('TabN').AsInteger;
      nPredKdSps   := FieldByName('KdSps').AsInteger;
      nPredSpsRsch := FieldByName('SpsRsch').AsInteger;
      nPredKdObj   := FieldByName('KdObj').AsInteger;
      nPredKdKatP  := FieldByName('KdKatP').AsInteger;
      cPredSumPrc  := FieldByName('SP').AsString;
      nPredKdSpZ   := FieldByName('KdSpZ').AsInteger;
      cPredDtBeg   := FieldByName('Dt_Beg').AsString;
      cPredDtEnd   := FieldByName('Dt_End').AsString;
      cPredNrPrB   := FieldByName('NrPrBeg').AsString;
      cPredNrPrE   := FieldByName('NrPrEnd').AsString;
      cPredDtPrB   := FieldByName('DtPrBeg').AsString;
      cPredDtPrE   := FieldByName('DtPrEnd').AsString;

      Post;

      Append;

      dbeTabN.Field.AsInteger := nTabN;
      FieldByName('KdSps').AsInteger := nPredKdSps;

      if chBoxSvSpsRsch.Checked then
        FieldByName('SpsRsch').AsInteger := nPredSpsRsch;

      ds_Nadb.FieldByName('SP').AsString := cPredSumPrc;
      dbeKdObj.Field.AsInteger  := nPredKdObj;
      dbeKdKatP.Field.AsInteger := nPredKdKatP;
      dbeKdSpZ.Field.AsInteger  := nPredKdSpZ;
      dbeDtBeg.Field.AsString   := cPredDtBeg;
      dbeDtEnd.Field.AsString   := cPredDtEnd;
      dbeNrPrBeg.Field.AsString := cPredNrPrB;
      dbeNrPrEnd.Field.AsString := cPredNrPrE;
      dbeDtPrBeg.Field.AsString := cPredDtPrB;
      dbeDtPrEnd.Field.AsString := cPredDtPrE;

      RefreshControls;

      dbeVidN.SetFocus;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TFormENadb.CheckVvod : boolean;
var
  cVidN: ShortString;
  nSpsRsch: integer;
  ErrList: TStringList;
  cMessage: string;
  bOk: boolean;
begin
  Result := true;
  cVidN := dbeVidN.Field.AsString;
  nSpsRsch := ds_Nadb.FieldByName('SpsRsch').AsInteger;

  ErrList := TStringList.Create;

  if dbeVidN.Field.IsNull then
    ErrList.Add('Нет вида надбавки (доплаты)');

  if nSpsRsch = 0 then
    ErrList.Add('Не выбран способ расчета надбавки (доплаты)');

  if DmMain.VidIsSovm(cVidN) and dbePrcWrkTm.Field.IsNull then
    ErrList.Add('Не введен % рабочего времени по совместительству');

  bOk := not (dbeSumProc.Field.IsNull or (dbeSumProc.Field.AsFloat = 0))
      or (cVidN = '1002') or (cVidN = '1611') or (cVidN = '1640')
      or (cVidN = '5006') or (cVidN = '5009') or (cVidN = '5010')
      or (cVidN = '5011') or (cVidN = '5012');

  if not bOk then begin
    if (nSpsRsch = 1) or (nSpsRsch = 3) then
      ErrList.Add('Нет суммы надбавки (доплаты)')
    else if nSpsRsch = 2 then
      ErrList.Add('Нет процента надбавки (доплаты)');
  end;

  bOk := not rBtnSposb4.Checked or rBtnSposb4.Checked
      and (dbeSumProc.Field.IsNull or (dbeSumProc.Field.AsFloat = 0));
  if not bOk then
    ErrList.Add('Сумма должна быть нулевой');

  if dbeShObj.Field.AsString = '' then
    ErrList.Add('Не выбрано подразделение');

  if dbeKatP.Field.AsString = '' then
    ErrList.Add('Не выбрана категория персонала');

  // if dbeSpZ.Field.AsString = '' then
  //   mListErr.Add('Не выбран счёт БухУчёта');

  if dbeDtBeg.Field.IsNull then
    ErrList.Add('Не введена дата начала выплат');

  if not CheckDtEndOk(cMessage) then
    ErrList.Add(cMessage);

  if PartSal and (Ds_Nadb.FieldByName('SpsRsch').AsInteger = 2)  then
    if GetPartSal = 0 then
      ErrList.Add('Надбавка к комбинированному окладу должна ссылаться ' +
        'на частичный оклад.'
      );


  // Значение "в электронную трудовую" по умолчанию проставлено в "Y",
  // Проверяем, подходит ли оно данному виду начисления. Если нет - сбрасываем
  if not VidIsSovm(Ds_Nadb.FieldByName('VidN').AsString) then
    Ds_Nadb.FieldByName('Is_Pere').AsString := '';

  if ErrList.Count > 0 then begin
    ShowErrors(ErrList); {A_ShwErr}
    Result := false;
  end;

  ErrList.Free;
end;

//------------------------------------------------------------------------------
function TFormENadb.CheckDtEndOk(var cMessage: string): boolean;
begin
  Result := dbeDtEnd.Field.IsNull
      or (dbeDtEnd.Field.AsDateTime >= dbeDtBeg.Field.AsDateTime);

  if not Result then begin
    cMessage := 'Дата окончания меньше даты начала';
    ds_Nadb.FieldByName('Dt_End').AsString := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.ApplyData;
var
  nTabN: integer;
  dMesPS : TDateTime;
  nY, nM, nD : word;
  // bOk: boolean;
begin
  nTabN := dbeTabN.Field.AsInteger;

  if ds_Nadb.FieldByName('SpsRsch').AsInteger = 2 then
    ds_Nadb.FieldByName('SP').AsString := '%'
  else
    ds_Nadb.FieldByName('SP').AsString := 'р';

  if (c_VidN88 <> '') and ChBoxPS.Checked then begin
    DecodeDate(dbeDtBeg.Field.AsDateTime, nY, nM, nD);
    dMesPS := EncodeDate(nY, nM, 1); // Месяц пересчёта
    DmMain.AddPSToOtkl(c_VidN88, nTabN, dCtrlDate, dMesPS);
    c_VidN88 := '';
  end;

  if PartSal then
    ds_Nadb.FieldByName('PartSalId').AsInteger := GetPartSal;

  // Решить с пересчетом прошлых месяцев
  (*
  bOk := g_bNewSchet
    and (
      (IsInsertMode and (dbeDtBeg.Field.AsDateTime < dCtrlDate))
      or (
        IsEditMode
        and (
          (dataSet.FieldByName('SpsRsch').AsInteger <> nOldSpsRsch)
          or (dbeKdObj.Field.AsInteger <> nOldKdObj)
          or (dbeKdKatP.Field.AsInteger  <> nOldKdKatP)
          or (dbeKdSpZ.Field.AsInteger <> nOldKdSpZ)
          or (dbeSumProc.Field.AsFloat <> nOldSumProc)
          or (dbeVidN.Field.AsString <> cOldVidN)
          or (dbeDtBeg.Field.AsDateTime <> dOldDtBeg)
          or (dbeDtEnd.Field.AsDateTime <> nOldDtEnd)
        )
      )
    );

  if bOk then
    DmMain.AddPereschetInOtkl(dataSet.FieldByName('KdSps').AsInteger, nTabN,
        dCtrlDate, dbeDtBeg.Field.AsDateTime);
  *)

  SaveDataIni;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.HandleChangeVidN;
var
  cVidN: string;
  cShVidN, cNmVidN: String;
  bNewIsTrSgl,
  bPredIsTrSgl: boolean;
begin
  cVidN := dbeVidN.Field.AsString;
  cShVidN := DmMain.VidN2ShVidN(cVidN, cNmVidN);

  if not dbeVidN.Field.IsNull and (cShVidN = '') then begin
    ShowMessage(
        'Нет в справочнике видов начислений вида ' + dbeVidN.Field.AsString);

    dbeShVidN.Field.AsString := '';
    dbeVidN.SetFocus;
  end else begin
    dbeShVidN.Field.AsString := cShVidN;

    bNewIsTrSgl := Form_Dm.VidIsTrS(cVidN);
    bPredIsTrSgl := Form_Dm.VidIsTrS(c_PredVidN);

    if bNewIsTrSgl xor bPredIsTrSgl then begin
      if bNewIsTrSgl then begin
        if not VidIsDekr(c_PredVidN) then
          n_PredSpsRsch := ds_Nadb.FieldByName('SpsRsch').AsInteger;

        n_PredKdKatP := dbeKdKatP.Field.AsInteger;
        dbeKdKatP.Field.AsInteger := 13;
        n_PredSmPrc := dbeSumProc.Field.AsFloat;
        dbeSumProc.Field.AsFloat := 0;
      end else begin
        ds_Nadb.FieldByName('SpsRsch').AsInteger := n_PredSpsRsch;
        dbeKdKatP.Field.AsInteger := n_PredKdKatP;
        dbeSumProc.Field.AsFloat := n_PredSmPrc;
      end;

      c_PredVidN := cVidN;
    end;

    RefreshControls;
    RefreshPanels;
  end;
end;

//------------------------------------------------------------------------------
function TFormENadb.VidExistsInOtkl(cVidN88 : ShortString;
  nTabN : integer;
  dRMes, dMesPS : TDateTime) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Otkl where DtProc = :dRMes and ' +
            ' TabN = :nTabN and VidN = :cVid88 and ZaMesGod <= :dMesPS');
    ParamByName('dRMes').AsDateTime := dRMes;
    ParamByName('dMesPS').AsDateTime := dMesPS;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('cVid88').AsString := cVidN88;
    Open;
    Result := RecordCount > 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormENadb.MyMesBetween(dDt1, dDt2 : TDateTime) : integer;
var nY, nM, nD : word; bMore : boolean; dDtTmp : TDateTime;
begin
// dDt1 < dDt2. Обе д.б. приведены к 1-м числам  (следить при вызовах!!!).
// между соседними месяцами должна возвратить 0
  Result := -1;
  bMore := true;
  dDtTmp := dDt1;
  while bMore do begin
    DecodeDate(dDtTmp, nY, nM, nD);
    Inc(nM);
    if nM > 12 then begin
      nM := 1;
      Inc(nY);
    end;
    Inc(Result);
    dDtTmp := EncodeDate(nY, nM, 1);
    if dDtTmp = dDt2 then
      bMore := false;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.SetDataSource(dataSource: TDataSource);
begin
  dsrc_Nadb := dataSource;
  ds_Nadb := dataSource.DataSet;

  dbeTabN.DataSource     := dsrc_Nadb;
  dbeKdDlzhn.DataSource  := dsrc_Nadb;
  dbeDlzhn.DataSource    := dsrc_Nadb;
  dbeKdProf.DataSource   := dsrc_Nadb;
  dbeKdSovm.DataSource   := dsrc_Nadb;
  dbeShSovm.DataSource   := dsrc_Nadb;

  DbChBoxElTrudKn.DataSource    := dsrc_Nadb;
  DbChBoxIgnNoPayVac.DataSource := dsrc_Nadb;
  DbChBoxSpovMerge.DataSource   := dsrc_Nadb;
  
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
function TFormENadb.GetVidInfo(
var
  VidN: ShortString;
  var WasUpdated: Boolean
): Boolean;
var
  cVidN,
  cKEKV : string4;
  cShVidN : string15;
  cNmVidN : string;
  cZp13, cOtp, cBln, cOtpuskn, cBolnic, cSPrm, cCPrm, cDeti, cDetiM,
  cDetiK, cDetiG, cSovm, cSpov, cInd, cDhd, cOklFnd, cCBudg, cSNdb,
  cSPdn, cSPrf, cSPens, cSAlim, cSSocStrah, cSBzr, cCNdb, cScPF,
  cScFSTVP, cScFSNV, cScFZ : string1;
  nKdSpZ : integer;
begin
  Result := GetVidN(cVidN, cKEKV, cShVidN, cNmVidN, cZp13, cOtp, cBln,
      cOtpuskn, cBolnic, cSPrm, cCPrm, cDeti, cDetiM, cDetiK, cDetiG,
      cSovm, cSpov, cInd, cDhd, cOklFnd, cCBudg, cSNdb, cSPdn, cSPrf,
      cSPens, cSAlim, cSSocStrah, cSBzr, cCNdb, cScPF, cScFSTVP,
      cScFSNV, cScFZ, nKdSpZ, WasUpdated, LbxFilter);

  VidN := cVidN;
end;

//------------------------------------------------------------------------------
function TFormENadb.IsInsertMode: boolean;
begin
  Result := dsrc_Nadb.State = dsInsert;
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

//------------------------------------------------------------------------------
// KeyDown
//------------------------------------------------------------------------------
procedure TFormENadb.dbeVidNKeyDown(
  Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    BtnVidN.Click;
end;

procedure TFormENadb.dbeShObjKeyDown(
  Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    BtnObj.Click;
end;

procedure TFormENadb.dbeKatPKeyDown(
  Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    BtnKatP.Click;
end;

procedure TFormENadb.dbeKdTemuKeyDown(
  Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
   BtnKdTemu.Click;
end;

procedure TFormENadb.dbeSpZKeyDown(
  Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    BtnSpZ.Click;
end;

//------------------------------------------------------------------------------
// Questions & Answers
//------------------------------------------------------------------------------
class function TFormENadb.VidIsDekr(VidN: ShortString): Boolean;
begin
  Result := (VidN = '5011') or (VidN = '5012');
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class function TFormENadb.VidIsSovm(VidN: ShortString): Boolean;
begin
  Result := (VidN = '1608') or (VidN = '1609')
    or (VidN = '1619') or (VidN = '1640');
end;

//------------------------------------------------------------------------------
// Radio Buttons
//------------------------------------------------------------------------------
procedure TFormENadb.RBtnSposbClick(Sender: TObject);
begin
  if Sender = RBtnSposb1 then
    ds_Nadb.FieldByName('SpsRsch').AsInteger := 1
  else if Sender = RBtnSposb2 then
    ds_Nadb.FieldByName('SpsRsch').AsInteger := 2
  else if Sender = RBtnSposb3 then
    ds_Nadb.FieldByName('SpsRsch').AsInteger := 3
  else
    ds_Nadb.FieldByName('SpsRsch').AsInteger := 4;

  CheckPartSalPanel;
end;

//------------------------------------------------------------------------------
// Если оклад частями и способ расчёта надбавки - % от оклада, для расчёта
// нужно указать, от какой части оклада считается надбавка
//------------------------------------------------------------------------------
procedure TFormENadb.CheckPartSalPanel;
begin
  PanelPartSal.Visible := PartSal and RBtnSposb2.Checked;
  RefreshPanels;
end;

//------------------------------------------------------------------------------
// On Lookup
//------------------------------------------------------------------------------
procedure TFormENadb.BtnVidNClick(Sender: TObject);
var
  VidN, NewVidN: String4;
  DumBool: Boolean;
begin
  VidN := Ds_Nadb.FieldByName('VidN').AsString;

  DbeVidN.SetFocus;

  if GetVidInfo(NewVidN, DumBool) then begin
    if NewVidN <> VidN then begin
      DbeVidN.Field.AsString := NewVidN;

      if not VidIsSovm(VidN) and VidIsSovm(NewVidN) then
        Ds_Nadb.FieldByName('Is_Pere').AsString := 'Y';

      DmMain.qryVidN_LU.Close;
      DmMain.qryVidN_LU.Open;
    end;

    FocusSpsbRsch;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.BtnObjClick(Sender: TObject);
var
  nKdObj, nKdSpZ: integer;
  cShObj, cNmObj: string;
  bWasUpdated: boolean;
begin
  dbeKdObj.SetFocus;
  nKdObj := dbeKdObj.Field.AsInteger;

  if GetKdObj(nKdObj, nKdSpZ, cShObj, cNmObj, bWasUpdated) then begin
    dbeKdObj.Field.AsInteger := nKdObj;
    dbeKdKatP.SetFocus;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.BtnKatPClick(Sender: TObject);
var
  nKdKatP: integer;
  cShKatP, cNmKatP: string;
begin
  dbeKdKatP.SetFocus;
  nKdKatP := dbeKdKatP.Field.AsInteger;

  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {Z_GtPers} then begin
    dbeKdKatP.Field.AsInteger := nKdKatP;
    dbeKdTemu.SetFocus;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.BtnKdTemuClick(Sender: TObject);
var
  nKdTemu, nKdSpZ: SmallInt;
  cNmTemu, cPSch: ShortString;
begin
  dbeKdTemu.SetFocus;
  nKdTemu := dbeKdTemu.Field.AsInteger;

  if GetTemu(nKdTemu, nKdSpZ, cNmTemu, cPSch) {z_ShwTem} then begin
    dbeKdTemu.Field.AsInteger := nKdTemu;
    dbeSpZ.SetFocus;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.BtnSpZClick(Sender: TObject);
var
  nKdSpZ: integer;
  cSchBU, cPSch, cNmSBU: string;
  bHasChild: boolean;
begin
  dbeSPZ.SetFocus;
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSpZ := FieldByName('KdSPZ').AsInteger;
    cSchBU := FieldByName('SchBU').AsString;
    if GetSBU(nKdSpZ, cSchBU, cPSch, cNmSBU, bHasChild) {A_SBU} then begin
      if bHasChild then begin
        ShowMessage('Выбранный счет имеет СубСчета - на него относить нельзя');
        dbeSPZ.SetFocus;
        Exit;
      end;
      FieldByName('KdSpZ').AsInteger := nKdSpZ;
      dbeDtBeg.SetFocus;
    end;
  end;
end;

//------------------------------------------------------------------------------
// On Change
//------------------------------------------------------------------------------
procedure TFormENadb.SetHandlers;
var
  field: TField;
begin
  field := dbeVidN.Field;
  handler_VidNChange := field.OnChange;
  field.OnChange := OnVidNChange;

  field := ds_Nadb.FieldByName('SpsRsch');
  handler_SpsRschChange := field.OnChange;
  field.OnChange := OnSpsRschChange;

  field := dbeKdObj.Field;
  handler_KdObjChange := field.OnChange;
  field.OnChange := OnKdObjChange;

  field := dbeKdKatP.Field;
  handler_KdKatPChange := field.OnChange;
  field.OnChange := OnKdKatPChange;

  field := dbeKdTemu.Field;
  handler_KdTemuChange := field.OnChange;
  field.OnChange := OnKdTemuChange;

  field := ds_Nadb.FieldByName('KdSpZ');
  handler_KdSpZChange := field.OnChange;
  field.OnChange := OnKdSpZChange;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.RestoreHandlers;
begin
  dbeVidN.Field.OnChange := handler_VidNChange;
  ds_Nadb.FieldByName('SpsRsch').OnChange := handler_SpsRschChange;
  dbeKdObj.Field.OnChange := handler_KdObjChange;
  dbeKdKatP.Field.OnChange := handler_KdKatPChange;
  dbeKdTemu.Field.OnChange := handler_KdTemuChange;
  dbeKdSpZ.Field.OnChange := handler_KdSpZChange;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.OnVidNChange(Sender: TField);
begin
  if Assigned(handler_VidNChange) then
    handler_VidNChange(Sender);

  HandleChangeVidN;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.OnSpsRschChange(Sender: TField);
begin
  if Assigned(handler_SpsRschChange) then
    handler_SpsRschChange(Sender);

  RefreshSumPrc(Sender.AsInteger);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.OnKdObjChange(Sender: TField);
var
  cNone: string;
begin
  if Assigned(handler_KdObjChange) then
    handler_KdObjChange(Sender);

  dbeShObj.Field.AsString := DmMain.KdObj2ShObj(Sender.AsInteger, cNone);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.OnKdKatPChange(Sender: TField);
var
  cShKatP: string;
begin
  if Assigned(handler_KdKatPChange) then
    handler_KdKatPChange(Sender);

  DmMain.KdKatP2NmKatP(Sender.AsInteger, cShKatP);
  dbeKatP.Field.AsString := cShKatP;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.OnKdTemuChange(Sender: TField);
begin
  if Assigned(handler_KdTemuChange) then
    handler_KdTemuChange(Sender);

  dbeNmTemu.Text := Form_DM.KdTemu2NmTemu(Sender.AsInteger);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.OnKdSpZChange(Sender: TField);
var
  cSchBU, cNmSch: string;
begin
  if Assigned(handler_KdSpZChange) then
    handler_KdSpZChange(Sender);

  cSchBU := '';
//  Form_DM.GetSchInfByKdSch(Sender.AsInteger, cSchBU, cSchOld, cNmSch, bHsCh);
  Form_Dm.KdSbu2ShNmSbu(Sender.AsInteger, cSchBU, cNmSch);
  dbeSpZ.Field.AsString := cSchBU;
end;

//------------------------------------------------------------------------------
// Enter / Exit
//------------------------------------------------------------------------------
procedure TFormENadb.dbeSpZExit(Sender: TObject);
var
  cSpZ: ShortString;
  nKdSpZ: SmallInt;
  bHsChld: boolean;
begin
  cSpZ := dbeSpZ.Field.AsString;
  DmMain.SchBU2KdSBU(cSpZ, nKdSpZ, bHsChld);
  dbeKdSpZ.Field.AsInteger := nKdSpZ;
  dbeExit(Sender);
end;

//------------------------------------------------------------------------------
procedure TFormENadb.dbeDtBegExit(Sender: TObject);
var
  dDtBegNdb, dMesPS : TDateTime;
  nY, nM, nD : word;
  nMesBetween : SmallInt; cMsg : ShortString;
  nTabN : integer;
begin
  LblPeresch.Caption := '';
  LabelAlreadyExists.Caption := '';
  nTabN := dbeDtBeg.DataSource.DataSet.FieldByName('TabN').AsInteger;
  if not MyEmptyDate(dbeDtBeg.Field.AsString) then begin
    dDtBegNdb := dbeDtBeg.Field.Value;
    DecodeDate(dDtBegNdb, nY, nM, nD);
    dMesPS := EncodeDate(nY, nM, 1);

    if dMesPS < dCtrlDate then begin
      nMesBetween := MyMesBetween(dMesPS, dCtrlDate);
      cMsg := 'Необходим пересчет с ' + MesRod(nM) + ' ' + IntToStr(nY) + ' г.';
      if nMesBetween > 0 then
        c_VidN88 := '8802'
      else
        c_VidN88 := '8801';
      cMsg := cMsg + '  (Вид ' + c_VidN88 + ')';
      LblPeresch.Caption := cMsg;
      if not VidExistsInOtkl(c_VidN88, nTabN, dCtrlDate, dMesPS) then
        LabelAlreadyExists.Caption := '(в отклонениях отсутствует)'
      else
        LabelAlreadyExists.Caption := '(в отклонениях уже есть)';
      ChBoxPS.Enabled := true;
      PanelRecalc.Visible := true;
    end else begin
      LblPeresch.Caption := '';
      LabelAlreadyExists.Caption := '';
      ChBoxPS.Enabled := false;
      PanelRecalc.Visible := false;
    end;

    RefreshPanels;
    dbeExit(Sender);
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.BtnSpsRschEnter(Sender: TObject);
begin
 (Sender as TRadioButton).Color := clGray;
 (Sender as TRadioButton).Font.Color := clWhite;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.BtnSpsRschExit(Sender: TObject);
begin
 (Sender as TRadioButton).Color := clBtnFace;
 (Sender as TRadioButton).Font.Color := clWindowText;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.dbeVidNExit(Sender: TObject);
var
  cVidN: string;
begin
  dbeExit(Sender);
  cVidN := (Sender as TDBEdit).DataSource.DataSet.FieldByName('VidN').AsString;
  if VidIsSovm(cVidN) then
    dbeKdDlzhn.SetFocus
  else
    FocusSpsbRsch;
  if (cVidN = '5006') or (cVidN = '5009') or (cVidN = '5010')  then begin
    RBtnSposb1.Checked := true;
    dbeSumProc.DataSource.DataSet.FieldByName('SUMPROC').AsFloat := 0;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.ChBoxEnter(Sender: TObject);
begin
  (Sender as TCheckBox).Color := clYellow;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.ChBoxExit(Sender: TObject);
begin
  (Sender as TCheckBox).Color := clBtnFace;
end;

//------------------------------------------------------------------------------
// On Click
//------------------------------------------------------------------------------
procedure TFormENadb.BtnHlpClick(Sender: TObject);
begin
  ShowENadbHlp; {z_HENadb}
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormENadb.PanelDebugClick(Sender: TObject);
begin
  PanelDebug.Visible := false;
  RefreshPanels;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.LoadControlsState;
begin
  with TIniFile.Create(cNmIniFile) do begin
    chBoxSvSpsRsch.Checked := ReadBool(SECTION, 'bSvSpsRsch', false);

    if chBoxSvSpsRsch.Checked then
      ds_Nadb.FieldByName('SpsRsch').AsInteger := ReadInteger(SECTION, 'nSpsRsch', 0);

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.SaveIntfaceIni;
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.SaveDataIni;
var nSpsRsch: integer;
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteBool(SECTION, 'bSvSpsRsch', chBoxSvSpsRsch.Checked);
    nSpsRsch := ds_Nadb.FieldByName('SpsRsch').AsInteger;
    if nSpsRsch <> 4 then
      WriteInteger(SECTION, 'nSpsRsch', nSpsRsch);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.sBtnGetDlzhnClick(Sender: TObject);
var
  nKdOK: SmallInt;
  cRetNmOK, cRetCode, cRetZKpp, cRetNameD, cRetNameFull: ShortString;
begin
  nKdOK := dbeKdDlzhn.Field.AsInteger;
  dbeKdDlzhn.SetFocus;
  // >> z_dk2010
  if TFormDK2010.GetDkRkvzt(nKdOK, cRetNmOK, cRetCode, cRetZKpp, cRetNameD,
    cRetNameFull) then
  begin
    dbeKdDlzhn.Field.AsInteger := nKdOk;
    dbeKdSovm.SetFocus;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.sBtnSovmClick(Sender: TObject);
var
  nKdSovm: integer;
  cDummy : string;
begin
  nKdSovm := dbeShSovm.DataSource.DataSet.FieldByName('KD_SOVM').AsInteger;
  dbeKdSovm.SetFocus;
  if GetVidSovm(nKdSovm, cDummy, cDummy) {z_GtSovm} then begin
    dbeShSovm.DataSource.DataSet.FieldByName('KD_SOVM').AsInteger := nKdSovm;
    dbePrcWrkTm.SetFocus;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormENadb.FocusSpsbRsch;
begin
  grBoxSposob.SetFocus
end;

//------------------------------------------------------------------------------
procedure TFormENadb.EnablePanel(Panel: TPanel; Enable: Boolean);
var
  I: Integer;
  Colour: TColor;
begin
  if Enable then
    Colour := clWindow
  else
    Colour := clBtnFace;

  with Panel do begin
    for I := 0 to ControlCount - 1 do begin
      if Controls[I] is TDbEdit then
        with Controls[I] as TDbEdit do begin
          Color := Colour;
          ReadOnly := not Enable;
        end
      else
        Enabled := Enable
    end;
  end;
end;

end.
