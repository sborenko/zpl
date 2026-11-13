unit z_VdIndY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, DBCtrls, Mask, DBTables, DB, Buttons,
  DBClient, Grids, DBGrids, ExtCtrls, Menus;

type
  TFormIndx = class(TForm)
    qryTmp: TQuery;
    dsrcIndx: TDataSource;
    cdsIndx: TClientDataSet;
    cdsIndxNR: TAutoIncField;
    cdsIndxDtProc: TDateField;
    cdsIndxZaMesGod: TDateField;
    cdsIndxSmProgMin: TFloatField;
    cdsIndxInclSovm: TStringField;
    PanelRight: TPanel;
    dbgrPrc: TDBGrid;
    pop: TPopupMenu;
    popDelRec: TMenuItem;
    popDelAll: TMenuItem;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    sBtnProgMin: TSpeedButton;
    Label1: TLabel;
    bBtnOk: TBitBtn;
    dbeZaMesGod: TDBEdit;
    dbeSmProgMin: TDBEdit;
    dbChBoxSovm: TDBCheckBox;
    bBtnCancel: TBitBtn;
    dbeDtProc: TDBEdit;
    cdsIndxMesChngMinZp: TDateField;
    Label4: TLabel;
    dbeMesChngMinZp: TDBEdit;
    GroupBox1: TGroupBox;
    rBtnByDef: TRadioButton;
    rBtnByVub: TRadioButton;
    LabelSchBU: TLabel;
    cdsIndxDefaultSchBu: TBooleanField;
    cdsIndxKdSchBU: TSmallintField;
    cdsIndxSchBU: TStringField;
    dbeSchBU: TDBEdit;
    LabelKdSchBU: TLabel;
    dbeKdSchBU: TDBEdit;
    sBtnKdSchBU: TSpeedButton;
    qryPrc: TQuery;
    qryPrcNR: TIntegerField;
    qryPrcINDMES: TDateTimeField;
    qryPrcBAZMES: TDateTimeField;
    qryPrcPRCIND: TFloatField;
    qryPrcLASTDTBM: TDateTimeField;
    dsrcPrc: TDataSource;
    updPrc: TUpdateSQL;
    qry_Tmp: TQuery;
    LabelPrc: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    popAddRecs: TMenuItem;
    qryAdd: TQuery;
    qryAddNR: TIntegerField;
    qryAddINDMES: TDateTimeField;
    qryAddBAZMES: TDateTimeField;
    qryAddPRCIND: TFloatField;
    qryAddLASTDTBM: TDateTimeField;
    stCntPrcRec: TStaticText;
    LabelIndMes: TLabel;
    LabelApm2: TLabel;
    rBtnSps: TRadioButton;
    rBtnAll: TRadioButton;
    MemoSps: TMemo;
    Label7: TLabel;
    procedure DBEditEnter(Sender: TObject);
    procedure DBEditExit(Sender: TObject);
    procedure sBtnProgMinClick(Sender: TObject);
    procedure cdsIndxZaMesGodValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure popDelRecClick(Sender: TObject);
    procedure popDelAllClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbeSmProgMinExit(Sender: TObject);
    procedure cdsIndxMesChngMinZpValidate(Sender: TField);
    procedure rBtnByDefClick(Sender: TObject);
    procedure rBtnByVubClick(Sender: TObject);
    procedure sBtnKdSchBUClick(Sender: TObject);
    procedure dbeSchBUDblClick(Sender: TObject);
    procedure dbeSchBUExit(Sender: TObject);
    procedure dbeSchBUKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure dbgrPrcEnter(Sender: TObject);
    procedure dbgrPrcExit(Sender: TObject);
    procedure dbeZaMesGodExit(Sender: TObject);
    procedure qryPrcAfterDelete(DataSet: TDataSet);
    procedure qryPrcAfterPost(DataSet: TDataSet);
    procedure qryPrcBeforeInsert(DataSet: TDataSet);
    procedure qryPrcBeforePost(DataSet: TDataSet);
    procedure qryPrcNewRecord(DataSet: TDataSet);
    procedure dbgrPrcDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popAddRecsClick(Sender: TObject);
    procedure DateFieldSetText(Sender: TField;
      const Text: String);
    procedure rBtnSpsClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc, d_SvDtZaMG, d_SvDtRprMin : TDateTime;
    dNextBM : TDateTime;
    n_SvProgMin : double;
    b_SvInclSovm, bNeedValidate : boolean;
    n_SvKdSchBU : SmallInt;
    c_SvSchBU : ShortString;
    bFormReady : boolean;
    procedure CreOpenCdsIndx;
    function CheckVvod : boolean;
    function GetSmProgMin(dZaMG : TDateTime) : double;
    procedure SetFormEnv;
    function GetNewPrcNR: integer;
    procedure OpenQryPrc(dIndMes : TDateTime);
    procedure SetMemoState;
  public
    { Public declarations }
  end;

function AddVdIndY(var dDtPrc, dDtZaMG, dMesChngMinZp : TDateTime;
                   var nSmProgMin : double;
                   var bInclSovm, bDefaultSchBU, bOnlySps : boolean;
                   var cTabs : string;
                   var nKdSchBU : SmallInt; var cSchBU : ShortString) : boolean;

const SECTION = 'z_VdIndY';

var
  FormIndx: TFormIndx;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib, A_ShwErr, Z_TbUdrg, z_VdIndD, A_SBU,
     z_PrcInd;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddVdIndY(var dDtPrc, dDtZaMG, dMesChngMinZp : TDateTime;
                   var nSmProgMin : double;
                   var bInclSovm, bDefaultSchBU, bOnlySps : boolean;
                   var cTabs : string;
                   var nKdSchBU : SmallInt; var cSchBU : ShortString) : boolean;
var nY, nM, nD : word;
begin
  Result := false;
  FormIndx := TFormIndx.Create(Application);
  with FormIndx do begin
    Caption := 'Ввод задания на проведение "текущей" индексации';
    d_DtPrc     := dDtPrc;
    bNeedValidate := false;
    CreOpenCdsIndx;
    SetFormEnv;
    bNeedValidate := true;
    if ShowModal = mrOk then begin
      dDtZaMG := cdsIndxZaMesGod.AsDateTime;
      DecodeDate(dDtZaMG, nY, nM, nD);
      dDtZaMG    := EncodeDate(nY, nM, 1); // привел к 1-му числу месяца
      dMesChngMinZp := cdsIndxMesChngMinZp.AsDateTime;
      DecodeDate(dMesChngMinZp, nY, nM, nD);
      dMesChngMinZp := EncodeDate(nY, nM, 1); // привел к 1-му числу месяца
      nSmProgMin := cdsIndxSmProgMin.AsFloat;
      bInclSovm  := (cdsIndxInclSovm.AsString = 'Y');
      bDefaultSchBU := cdsIndxDefaultSchBU.AsBoolean;
      cSchBU := cdsIndxSchBU.AsString;
      nKdSchBU := cdsIndxKdSchBU.AsInteger;
      if rBtnSps.Checked then begin
        bOnlySps := true;
        cTabs := Trim(MemoSps.Text);
      end;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.FormCreate(Sender: TObject);
begin
  bFormReady := false;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 250);
    d_SvDtZaMG := ReadDate(SECTION, 'SvDtZaMG', Date);
    d_SvDtRprMin := ReadDate(SECTION, 'SvDtRprMin', Date);
    n_SvProgMin := ReadFloat(SECTION, 'nSvProgMin', 0);
    b_SvInclSovm := ReadBool(SECTION, 'bInclSovm', false);
    n_SvKdSchBU := ReadInteger(SECTION, 'SvKdSchBU', 1331);
    c_SvSchBU := ReadString(SECTION, 'SvSchBU', '811/00');
    rBtnByDef.Checked := ReadBool(SECTION, 'bSchByDef', true);
    rBtnByVub.Checked := not rBtnByDef.Checked;
    rBtnSps.Checked := ReadBool(SECTION, 'bOnlySps', false);
    rBtnAll.Checked := not rBtnSps.Checked;
    Free;
  end;
  if FileExists(cDirVids + 'IndxCur.lbx') then
    MemoSps.Lines.LoadFromFile(cDirVids + 'IndxCur.lbx');
  LabelKdSchBU.Visible := bFlagDbg;
  dbeKdSchBU.Visible := bFlagDbg;
  bFormReady := true;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MemoSps.Lines.SaveToFile(cDirVids + 'IndxCur.lbx');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteDate(SECTION, 'SvDtZaMG', dbeZaMesGod.Field.AsDateTime);
    WriteDate(SECTION, 'SvDtRprMin', dbeMesChngMinZp.Field.AsDateTime);
    WriteFloat(SECTION, 'nSvProgMin', dbeSmProgMin.Field.AsFloat);
    WriteBool(SECTION, 'bInclSovm', dbChBoxSovm.Field.AsBoolean);
    WriteInteger(SECTION, 'SvKdSchBU', cdsIndxKdSchBU.AsInteger);
    WriteString(SECTION, 'SvSchBU', cdsIndxSchBU.AsString);
    WriteBool(SECTION, 'bSchByDef', rBtnByDef.Checked);
    WriteBool(SECTION, 'bOnlySps', rBtnSps.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    dbeZaMesGod.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
function TFormIndx.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if cdsIndxZaMesGod.IsNull or (cdsIndxZaMesGod.AsString = '') then
    mListErr.Add('Нет месяца, за который начислять');
  if cdsIndxSmProgMin.IsNull then
    mListErr.Add('Нет суммы прожиточного минимума')
  else if (cdsIndxSmProgMin.AsFloat <= 0) then
    mListErr.Add('Не корректная сумма прожиточного минимума');
//  if cdsIndxMesChngMinZp.IsNull or (cdsIndxMesChngMinZp.AsString = '') then
//    mListErr.Add('Нет опорного месяца для минимальщиков');
  if dsrcPrc.DataSet.RecordCount = 0 then
    mListErr.Add('Нет записей о базовых месяцах и процентах индексации');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.CreOpenCdsIndx;
begin
  with cdsIndx do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    cdsIndxDtProc.AsDateTime := d_DtPrc;
    if d_SvDtZaMG > 0 then begin
      cdsIndxZaMesGod.AsDateTime := d_SvDtZaMG;
      OpenQryPrc(d_SvDtZaMG);
    end;
    if d_SvDtRprMin > 0 then
      cdsIndxMesChngMinZp.AsDateTime := d_SvDtRprMin;
    if n_SvProgMin <> 0 then
      cdsIndxSmProgMin.AsFloat := n_SvProgMin;
    if n_SvKdSchBU > 0 then begin
      cdsIndxKdSchBU.AsInteger := n_SvKdSchBU;
      cdsIndxSchBU.AsString := c_SvSchBU;
    end;    
    cdsIndxInclSovm.AsString := 'N';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.DBEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.DBEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.dbeZaMesGodExit(Sender: TObject);
var cText : ShortString; dIndMes : TDateTime; nY, nM, nD : word;
begin
  cText := dbeZaMesGod.Field.AsString;
  if MyEmptyDate(cText) then begin
    ShowMessage('Поле "Индексируемый месяц" не может быть пустым');
    dbeZaMesGod.SetFocus; end
  else begin
    dbeZaMesGod.Color := clWindow;
    DecodeDate(dbeZaMesGod.Field.AsDateTime, nY, nM, nD);
    dIndMes := EncodeDate(nY, nM, 1);
    dbeZaMesGod.Field.AsDateTime := dIndMes;
    OpenQryPrc(dIndMes);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.dbeSmProgMinExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clMoneyGreen;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.dbeSchBUExit(Sender: TObject);
begin
  dbeSchBU.Color := clMoneyGreen;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.sBtnProgMinClick(Sender: TObject);
var dZaMG : TDateTime; nY, nM, nD : word; nSmPM : double;
begin
  Application.ProcessMessages;
  ShowTabsUderg(dDtProc);              {Z_TbUdrg}
  if not cdsIndxZaMesGod.IsNull and (cdsIndxZaMesGod.AsString > '') then begin
    dZaMG := cdsIndxZaMesGod.AsDateTime; // на случай, если при этом обращении
    DecodeDate(dZaMG, nY, nM, nD);       // правилась таблица разных удержаний
    dZaMG := EncodeDate(nY, nM, 1);
    nSmPM := GetSmProgMin(dZaMG);
    if nSmPM <> 0 then
      cdsIndxSmProgMin.AsFloat := nSmPM;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.cdsIndxZaMesGodValidate(Sender: TField);
var cText : ShortString; dZaMG : TDateTime; nY, nM, nD : word;
    nSmPM : double;
begin
  if not bNeedValidate then Exit;
  cText := Sender.AsString;
  if MyEmptyDate(cText) then
    cdsIndxSmProgMin.AsString := ''
  else begin
    dZaMG := cdsIndxZaMesGod.AsDateTime;
    DecodeDate(dZaMG, nY, nM, nD);
    dZaMG := EncodeDate(nY, nM, 1);
    bNeedValidate := false;
    cdsIndxZaMesGod.AsDateTime := dZaMG;
    bNeedValidate := true;
    nSmPM := GetSmProgMin(dZaMG);
    if nSmPM <> 0 then
      cdsIndxSmProgMin.AsFloat := nSmPM;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.DateFieldSetText(Sender: TField; const Text: String);
var cText : ShortString; dMesChngMinZp : TDateTime; nY, nM, nD : word;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else begin
    Sender.AsString := Text;
    dMesChngMinZp := cdsIndxMesChngMinZp.AsDateTime;
    DecodeDate(dMesChngMinZp, nY, nM, nD);
    dMesChngMinZp := EncodeDate(nY, nM, 1);
    bNeedValidate := false;
    cdsIndxMesChngMinZp.AsDateTime := dMesChngMinZp;
    bNeedValidate := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.cdsIndxMesChngMinZpValidate(Sender: TField);
//var cText : ShortString; dMesChngMinZp : TDateTime; nY, nM, nD : word;
begin
(*
  if not bNeedValidate then
    Exit;
  cText := Sender.AsString;
  if MyEmptyDate(cText) then
    cdsIndxMesChngMinZp.AsString := ''
  else begin
    dMesChngMinZp := cdsIndxMesChngMinZp.AsDateTime;
    DecodeDate(dMesChngMinZp, nY, nM, nD);
    dMesChngMinZp := EncodeDate(nY, nM, 1);
    bNeedValidate := false;
    cdsIndxMesChngMinZp.AsDateTime := dMesChngMinZp;
    bNeedValidate := true;
  end;
*)
end;
//------------------------------------------------------------------------------
function TFormIndx.GetSmProgMin(dZaMG : TDateTime) : double;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from z_TPDN where DtBeg <= :dZaMG ' +
            ' order by DtBeg desc, NR desc');
    ParamByName('dZaMG').AsDateTime := dZaMG;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('ProgMin2').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.popDelRecClick(Sender: TObject);
begin
  if MessageDlg('Удалить текущую запись?:',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  dsrcPrc.DataSet.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.popDelAllClick(Sender: TObject);
begin
  if MessageDlg('Удалить все записи?:',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   with dsrcPrc.DataSet do begin
     First;
     while not Eof do
       Delete;
   end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.popPopup(Sender: TObject);
begin
  popDelRec.Enabled := dsrcPrc.DataSet.RecordCount > 0;
  popDelAll.Enabled := popDelRec.Enabled;
  popAddRecs.Enabled := dsrcPrc.DataSet.RecordCount = 0;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.FormResize(Sender: TObject);
begin
  Panel2.Top := Round((Height - Panel2.Height) / 2) - 12;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.rBtnByDefClick(Sender: TObject);
begin
  SetFormEnv;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.rBtnByVubClick(Sender: TObject);
begin
  SetFormEnv;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.SetFormEnv;
begin
  if not bFormReady then
    Exit;
  if rBtnByDef.Checked then begin
    cdsIndxDefaultSchBU.AsBoolean := TRUE;
    LabelSchBU.Enabled := false;
    sBtnKdSchBU.Enabled := false;
    dbeSchBU.Enabled := false; end
  else begin
    cdsIndxDefaultSchBU.AsBoolean := FALSE;
    LabelSchBU.Enabled := true;
    sBtnKdSchBU.Enabled := true;
    dbeSchBU.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.sBtnKdSchBUClick(Sender: TObject);
var nKdSchBU : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSchBU.SetFocus;
  with cdsIndx do begin
    nKdSchBU := dbeKdSchBU.Field.AsInteger;
    cSchBU := dbeSchBU.Field.AsString;
    if GetSBU(nKdSchBU, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if bHsCh then begin
        ShowMessage('Выбранный счет имеет СубСчета - на него относить нельзя');
        dbeSchBU.SetFocus;
        Exit;
      end;
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      dbeKdSchBU.Field.AsInteger := nKdSchBU;
      dbeSchBU.Field.AsString := cSchBU;
      bBtnOk.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.dbeSchBUDblClick(Sender: TObject);
begin
  if rBtnByVub.Checked then
    sBtnKdSchBU.Click;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.dbeSchBUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if rBtnByVub.Checked and (Key = VK_RETURN) and (Shift = []) then
    sBtnKdSchBU.Click;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.dbgrPrcEnter(Sender: TObject);
begin
  dbgrPrc.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.dbgrPrcExit(Sender: TObject);
begin
  dbgrPrc.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.qryPrcAfterDelete(DataSet: TDataSet);
begin
  if qryPrc.UpdatesPending then
    Form_DM.DbMain.ApplyUpdates([qryPrc]);
end;
//------------------------------------------------------------------------------
procedure TFormIndx.qryPrcAfterPost(DataSet: TDataSet);
begin
  if qryPrc.UpdatesPending then
    Form_DM.DbMain.ApplyUpdates([qryPrc]);
end;
//------------------------------------------------------------------------------
procedure TFormIndx.qryPrcBeforeInsert(DataSet: TDataSet);
var dDtTmp : TDateTime; nY, nM, nD : word;
begin
  if (qryPrc.RecordCount > 0) and (not qryPrcBazMes.IsNull) then begin
    dDtTmp := qryPrcBazMes.AsDateTime;
    DecodeDate(dDtTmp, nY, nM, nD);
    Inc(nM);
    if nM > 12 then begin
      nM := 1;
      Inc(nY);
    end;
    dNextBM := EncodeDate(nY, nM, 1); end
  else
    dNextBM := Date;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.qryPrcBeforePost(DataSet: TDataSet);
begin
  if not qryPrcBazMes.IsNull then
    qryPrcLastDtBM.AsDateTime := MyLastDom(qryPrcBazMes.AsDateTime);
  if qryPrcNR.IsNull then
    qryPrcNR.AsInteger := GetNewPrcNR;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.qryPrcNewRecord(DataSet: TDataSet);
begin
  qryPrcBazMes.AsDateTime := dNextBM;
  qryPrcIndMes.AsDateTime := dbeZaMesGod.Field.AsDateTime;
end;
//------------------------------------------------------------------------------
function TFormIndx.GetNewPrcNR: integer;
begin
//  Result := 0;
  with qry_Tmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    //SQL.Add('Select First 1 Gen_Id(Z_PrcIndx_NR, 1) as My_NR from Z_PrcIndx');
    SQL.Add('Select Gen_ID(Z_PrcIndx_NR, 1) My_NR from rdb$database');
    Open;
    Result := FieldByName('My_NR').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.OpenQryPrc(dIndMes: TDateTime);
var nY, nM, nD : word; cMsg : ShortString;
begin
  with qryPrc do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_PrcIndx where IndMes = :dIndMes order by BazMes');
    ParamByName('dIndMes').AsDateTime := dIndMes;
    Open;
    DecodeDate(dIndMes, nY, nM, nD);
    cMsg := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    LabelIndMes.Caption := cMsg;
    stCntPrcRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.dbgrPrcDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrPrc.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if (cFldNm = 'PRCIND') then begin
      if not (gdFocused in State) then
        Brush.Color := clInfoBk
      else
        Brush.Color := clAqua;
    end;
  end;
  dbgrPrc.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormIndx.popAddRecsClick(Sender: TObject);
var dAddInMes, dAddMes : TDateTime;
begin
  dAddInMes := dbeZaMesGod.Field.AsDateTime;
  if GetAddMes(dAddInMes, dAddMes) {z_PrcInd} then begin
//    ShowMessage('Добавляем из месяца ' + DateToStr(dAddMes) + ' в месяц ' +
//                  DateToStr(dAddInMes));
    with qryAdd do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from z_PrcIndx where IndMes = :dAddMes ' +
              ' order by BazMes');
      ParamByName('dAddMes').AsDateTime := dAddMes;
      Open;
      qryPrc.DisableControls;
      while not eof do begin
        qryPrc.Append;
        qryPrcIndMes.AsDateTime := dAddInMes;
        qryPrcBazMes.AsDateTime := qryAddBazMes.AsDateTime;
        qryPrcPrcInd.AsFloat := qryAddPrcInd.AsFloat;
        qryPrcLastDtBM.AsDateTime := qryAddLastDtBM.AsFloat;
        qryPrc.Post;
        Next;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
      qryPrc.EnableControls;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.rBtnSpsClick(Sender: TObject);
begin
  SetMemoState;
end;
//------------------------------------------------------------------------------
procedure TFormIndx.SetMemoState;
begin
  if rBtnAll.Checked then begin
    MemoSps.Enabled := false;
    MemoSps.Color := clBtnFace; end
  else begin
    MemoSps.Enabled := true;
    MemoSps.Color := clWindow;
  end;
end;

end.
