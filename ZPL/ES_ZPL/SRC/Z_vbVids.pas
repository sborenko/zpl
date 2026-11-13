unit Z_vbVids;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBTables,
  ComCtrls, Provider, DBClient;

type
  TFormVbVidu = class(TForm)
    dsrcVidu: TDataSource;
    qryVidu: TQuery;
    qryViduVIDN: TStringField;
    qryViduSHVIDN: TStringField;
    qryViduNMVIDN: TStringField;
    qryViduPRC: TIntegerField;
    qryViduMETKA: TStringField;
    qryPSch: TQuery;
    qryPSchPSCH: TStringField;
    qryPSchCNT: TIntegerField;
    qryPSchSMM: TFloatField;
    dsrcPSch: TDataSource;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    PanelRight: TPanel;
    LabelCntRec: TLabel;
    LabelCntMetok: TLabel;
    Label1: TLabel;
    sBtnF8Vids: TSpeedButton;
    sBtnDelMetki: TSpeedButton;
    sBtnSetMetkiAll: TSpeedButton;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    grBoxVids: TGroupBox;
    rBtnVidsIncl: TRadioButton;
    rBtnVidsExcl: TRadioButton;
    PanelSch: TPanel;
    Splitter1: TSplitter;
    dbgrVidu: TDBGrid;
    qryNuObj: TQuery;
    dsrcNuObj: TDataSource;
    dbgrNuObj: TDBGrid;
    qryNuObjKDOBJ: TSmallintField;
    qryNuObjShObj: TStringField;
    qryNuObjNmObj: TStringField;
    LabelCntObj: TLabel;
    LabelCntSelObj: TLabel;
    Label7: TLabel;
    sBtnF8Obj: TSpeedButton;
    Label8: TLabel;
    grBoxObj: TGroupBox;
    rBtnObjIncl: TRadioButton;
    rBtnObjExcl: TRadioButton;
    sBtnObjSelAll: TSpeedButton;
    sBtnObjUnSelAll: TSpeedButton;
    Label5: TLabel;
    sBtnGoToVids: TSpeedButton;
    sBtnGoToObj: TSpeedButton;
    LabelVidsUvaga: TLabel;
    LabelObjUvaga: TLabel;
    qrySchBU: TQuery;
    PanelSchTop: TPanel;
    dbgrSchBU: TDBGrid;
    cdsSchBU: TClientDataSet;
    dsrcSchBU: TDataSource;
    dspSchBU: TDataSetProvider;
    cdsSchBUPSCH: TStringField;
    cdsSchBUSCHBU: TStringField;
    cdsSchBUCNT: TIntegerField;
    PanelSchTopLeft: TPanel;
    dbgrPSch: TDBGrid;
    grBoxScheta: TGroupBox;
    rBtnSchIncl: TRadioButton;
    rBtnSchExcl: TRadioButton;
    Label6: TLabel;
    LabelCntSelSchBu: TLabel;
    qryPSchKdPSch: TSmallintField;
    qryPSchNmPSch: TStringField;
    qryClc: TQuery;
    qryClc2: TQuery;
    cdsSchBUKdSch: TSmallintField;
    qryPSchSynth: TStringField;
    procedure dbgrViduDrawColumnCell(Sender: TObject; const Rect: TRect;
                    DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrViduKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure dbgrViduDblClick(Sender: TObject);
    procedure sBtnDelMetkiClick(Sender: TObject);
    procedure sBtnSetMetkiAllClick(Sender: TObject);
    procedure qryNuObjCalcFields(DataSet: TDataSet);
    procedure sBtnGoToObjClick(Sender: TObject);
    procedure sBtnGoToVidsClick(Sender: TObject);
    procedure dbgrNuObjDblClick(Sender: TObject);
    procedure dbgrNuObjDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnObjSelAllClick(Sender: TObject);
    procedure sBtnObjUnSelAllClick(Sender: TObject);
    procedure dbgrNuObjKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbgrSchBUDblClick(Sender: TObject);
    procedure dbgrSchBUDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsrcPSchDataChange(Sender: TObject; Field: TField);
    procedure qryPSchCalcFields(DataSet: TDataSet);
    procedure cdsSchBUCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    n_CntVidsRec, n_CntNuObjRec : SmallInt;
    m_LbxSchBu, m_LbxVids, m_LbxNuObj : TListBox;
    bMyClose : boolean;
    procedure OpenQryPSch(DtPrOc: TDateTime);
    procedure CreOpenCdsSchBU(DtProc: TDateTime);
    procedure OpenQryNuObj(DtProc: TDateTime);
    procedure OpenQryVidu;
  public
    { Public declarations }
  end;

function GetSchLstVids(DtProc: TDateTime; var Sch, Synth: ShortString;
  var VedKdSpZ: SmallInt; LbxSchBU, LbxVids, LbxNuObj: TListBox;
  var SchBuExclude, VidsExclude, ObjExclude: Boolean
): Boolean;

const SECTION = 'z_VbVids';

var
  FormVbVidu: TFormVbVidu;

implementation

uses a_Const, z_Main, z_Dm, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetSchLstVids(
  DtProc: TDateTime;
  var Sch, Synth: ShortString;
  var VedKdSpZ: SmallInt;
  LbxSchBU, LbxVids, LbxNuObj: TListBox;
  var SchBuExclude, VidsExclude, ObjExclude: Boolean
): Boolean;
var nCntMetok, nCntObjMetok : integer;
begin
  Result := false;
  FormVbVidu := TFormVbVidu.Create(Application);
  with FormVbVidu do begin
    Caption := 'Задание на выборку сумм';
    m_LbxSchBu := LbxSchBU;
    m_LbxVids := LbxVids;
    m_LbxNuObj  := LbxNuObj;
    LabelCntSelSchBu.Caption := '';

    OpenQryPSch(DtProc);
    if Sch > '' then
      qryPSch.Locate('PSch', Sch, []);

    CreOpenCdsSchBU(DtProc);
    OpenQryVidu;
    
    n_CntVidsRec := qryVidu.RecordCount;
    LabelCntRec.Caption := 'Всего видов ' + IntToStr(n_CntVidsRec);
    nCntMetok := m_LbxVids.Items.Count;
    if nCntMetok > 0 then begin
      LabelVidsUvaga.Caption := 'На 1-й стр. помечено видов ' +
                                             IntToStr(nCntMetok);
      LabelCntMetok.Caption := 'Помечено ' + IntToStr(nCntMetok); end
    else begin
      LabelVidsUvaga.Caption := 'На 1-й стр. помеченных видов НЕТ.';
      LabelCntMetok.Caption := 'Помеченных нет';
    end;
    rBtnVidsIncl.Enabled := nCntMetok > 0;
    rBtnVidsExcl.Enabled := nCntMetok > 0;
    sBtnDelMetki.Enabled := (nCntMetok > 0);
    sBtnSetMetkiAll.Enabled := (nCntMetok < n_CntVidsRec);

    OpenQryNuObj(DtProc);
    n_CntNuObjRec := qryNuObj.RecordCount;
    LabelCntObj.Caption := 'Всего подразд. ' + IntToStr(n_CntNuObjRec);

    nCntObjMetok := m_LbxNuObj.Items.Count;
    if nCntObjMetok > 0 then begin
      LabelObjUvaga.Caption := 'На 2-й стр. помечено подразделений ' +
                                                        IntToStr(nCntObjMetok);
      LabelCntSelObj.Caption := 'Помечено ' + IntToStr(nCntObjMetok);

      end
    else begin
      LabelObjUvaga.Caption := 'На 2-й стр. помеченных подразделений НЕТ';
      LabelCntSelObj.Caption := 'Помеченных нет';
    end;
    rBtnObjIncl.Enabled := nCntObjMetok > 0;
    rBtnObjExcl.Enabled := nCntObjMetok > 0;
    sBtnObjUnSelAll.Enabled := (nCntObjMetok > 0);
    sBtnObjSelAll.Enabled := (nCntObjMetok < n_CntNuObjRec);
    ts1.TabVisible := false;
    ts2.TabVisible := false;
    PageControl1.ActivePage := ts1;
    bMyClose := false;
    if ShowModal = mrOk then begin
      bMyClose := true;
      Sch := qryPSchPSch.AsString;
      Synth := QryPSchSynth.AsString;
      VedKdSpZ := cdsSchBUKdSch.AsInteger;        // 1-й на котором стоит
      SchBuExclude := rBtnSchExcl.Checked;
      VidsExclude := rBtnVidsExcl.Checked;
      ObjExclude := rBtnObjExcl.Checked;
      Result := true;
    end;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVbVidu.OpenQryPSch(DtProc: TDateTime);
begin
  with QryPSch do begin
    QryUtils.InitQuery(QryPSch);

    SQL.Text :=
      'select PSch, count(Nr) Cnt, Round(Sum(Summa), 2) Smm, "Y" Synth ' +
      'from ViNuMain ' +
      'where DtProc = :DtProc ' +
        'and VidN < "8000" ' +
        'and not SchBU in ("8011/02-2", "8011/02-4") ' +
      'group by PSch, Synth ' +
      'having Count(Nr) > 0 ' +
        'and Round(Sum(Summa), 2) <> 0 ' +

      'UNION ' +

      'select SchBU PSch, count(Nr) Cnt, Round(Sum(Summa), 2) Smm, "N" Synth ' +
      'from ViNuMain ' +
      'where DtProc = :DtProc ' +
        'and VidN < "8000" ' +
        'and SchBU in ("8011/02-2", "8011/02-4") ' +
      'group by SchBU, Synth ' +
      'having Count(Nr) > 0 ' +
        'and Round(Sum(Summa), 2) <> 0';

    ParamByName('DtProc').AsDateTime := DtProc;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVbVidu.CreOpenCdsSchBU(DtProc: TDateTime);
begin
  QryUtils.InitQuery(QrySchBU);

  with QrySchBU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Text :=
      'select PSch, SchBU, Count(*) as CNT ' +
      'from ViNuMain ' +
      'where DtProc = :DtProc ' +
        'and VidN < "5000" ' +
        'and not SchBU in ("8011/02-2", "8011/02-4") ' +
      'group by PSCH, SchBU ' +

      'UNION ' +

      'select SchBU PSch, SchBU, Count(*) as CNT ' +
      'from ViNuMain ' +
      'where DtProc = :DtProc ' +
        'and VidN < "5000" ' +
        'and SchBU in ("8011/02-2", "8011/02-4") ' +
      'group by PSCH, SchBU';

    ParamByName('DtProc').AsDateTime := DtProc;
  end;

  with cdsSchBU do begin
    if Active then Close;
    MasterSource := nil;
    MasterFields := '';
    IndexName := '';
    ProviderName := 'dspSchBU';
    Open;
    IndexName := 'OnPSchSchBU';
    MasterSource := dsrcPSCH;
    MasterFields := 'PSCH';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVbVidu.OpenQryNuObj(DtProc: TDateTime);
begin
  QryUtils.InitQuery(QryNuObj);

  with QryNuObj do begin
    SQL.Text :=
      'select distinct KdObj ' +
      'from Z_NU ' +
      'where DtProc = :DtProc';

    ParamByName('DtProc').AsDateTime := DtProc;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVbVidu.OpenQryVidu;
begin
  QryUtils.InitQuery(QryVidu);

  with QryVidu do begin
    SQL.Text :=
      'select VidN, ShVidN, NmVidN, Cast(null as Char(1)) as Metka, ' +
        'Cast(null as Numeric) as Prc ' +
      'from z_kdVidN ' +
      'where HsCh = "F" and VidN < "2700" ' +
      'order by AIndx';

    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVbVidu.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 345);
    Free;
  end;
  if FileExists(cDirVids + 'VbVids01.vid') then
    dbgrVidu.Columns.LoadFromFile(cDirVids + 'VbVids01.vid');
  if FileExists(cDirVids + 'VbNuOb01.vid') then
    dbgrNuObj.Columns.LoadFromFile(cDirVids + 'VbNuOb01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVidu.Columns.SaveToFile(cDirVids + 'VbVids01.vid');
  dbgrNuObj.Columns.SaveToFile(cDirVids + 'VbNuOb01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbgrViduDblClick(Sender: TObject);
var i, nCntMetok : SmallInt;
begin
  i := m_LbxVids.Items.IndexOf(qryViduVidN.AsString);
  if i < 0 then
    m_LbxVids.Items.Add(qryViduVidN.AsString)
  else
    m_LbxVids.Items.Delete(i);
  if not qryVidu.Eof then
    qryVidu.Next
  else
    dbgrVidu.Refresh;
  nCntMetok := m_LbxVids.Items.Count;
  if nCntMetok > 0 then begin
    LabelVidsUvaga.Caption := 'На 1-й стр. помечено видов ' +
                                             IntToStr(m_LbxVids.Items.Count);
    LabelCntMetok.Caption := 'Помечено ' + IntToStr(nCntMetok); end
  else begin
    LabelVidsUvaga.Caption := 'На 1-й стр. помеченных видов НЕТ.';
    LabelCntMetok.Caption := 'Помеченных нет';
  end;
  rBtnVidsIncl.Enabled := nCntMetok > 0;
  rBtnVidsExcl.Enabled := nCntMetok > 0;
  sBtnDelMetki.Enabled := (nCntMetok > 0);
  sBtnSetMetkiAll.Enabled := (nCntMetok < n_CntVidsRec);
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbgrViduKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
begin
  if (PageControl1.ActivePage = ts1) and (Key = VK_F8) and (Shift = []) then
    dbgrViduDblClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbgrViduDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrVidu.Canvas do begin
    if not (gdFocused in State) then begin
      if m_LbxVids.Items.IndexOf(qryViduVidN.AsString) >= 0 then
        Font.Color := clRed
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrVidu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.sBtnDelMetkiClick(Sender: TObject);
begin
  m_LbxVids.Items.Clear;
  LabelCntMetok.Caption := 'Помеченных нет';
  LabelVidsUvaga.Caption := 'На 1-й стр. помеченных видов НЕТ.';
  rBtnVidsIncl.Enabled := false;
  rBtnVidsExcl.Enabled := false;
  sBtnDelMetki.Enabled := false;
  sBtnSetMetkiAll.Enabled := true;
  dbgrVidu.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.sBtnSetMetkiAllClick(Sender: TObject);
var cSvVidN : ShortString;
begin
  m_LbxVids.Items.Clear;
  with qryVidu do begin
    cSvVidN := qryViduVidN.AsString;
    DisableControls;
    First;
    while not Eof do begin
      m_LbxVids.Items.Add(qryViduVidN.AsString);
      Next;
    end;
    Locate('VidN', cSvVidN, []);
    EnableControls;
  end;
  LabelCntMetok.Caption := 'Помечено ' + IntToStr(m_LbxVids.Items.Count);
  LabelVidsUvaga.Caption := 'На 1-й стр. помечено видов ' +
                                             IntToStr(m_LbxVids.Items.Count);
  rBtnVidsIncl.Enabled := true;
  rBtnVidsExcl.Enabled := true;
  sBtnDelMetki.Enabled := true;
  sBtnSetMetkiAll.Enabled := false;
  dbgrVidu.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.qryNuObjCalcFields(DataSet: TDataSet);
var cNmObj : string;
begin
  qryNuObjShObj.AsString := DmMain.KdObj2ShObj(qryNuObjKdObj.AsInteger, cNmObj);
  qryNuObjNmObj.AsString := cNmObj;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.sBtnGoToObjClick(Sender: TObject);
begin
  PageControl1.ActivePage := ts2;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.sBtnGoToVidsClick(Sender: TObject);
begin
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbgrNuObjDblClick(Sender: TObject);
var i, nCntMetok : SmallInt;
begin
  i := m_LbxNuObj.Items.IndexOf(qryNuObjKdObj.AsString);
  if i < 0 then
    m_LbxNuObj.Items.Add(qryNuObjKdObj.AsString)
  else
    m_LbxNuObj.Items.Delete(i);
  if not qryNuObj.Eof then
    qryNuObj.Next
  else
    dbgrNuObj.Refresh;
  nCntMetok := m_LbxNuObj.Items.Count;
  if nCntMetok > 0 then begin
    LabelObjUvaga.Caption := 'На 2-й стр. помечено подразделений ' +
                                                          IntToStr(nCntMetok);
    LabelCntSelObj.Caption := 'Помечено ' + IntToStr(nCntMetok); end
  else begin
    LabelObjUvaga.Caption := 'На 2-й стр. помеченных подразделений НЕТ';
    LabelCntSelObj.Caption := 'Помеченных нет';
  end;
  rBtnObjIncl.Enabled := (nCntMetok > 0);
  rBtnObjExcl.Enabled := (nCntMetok > 0);
  sBtnObjUnSelAll.Enabled := (nCntMetok > 0);
  sBtnObjSelAll.Enabled := (nCntMetok < n_CntNuObjRec);
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbgrNuObjDrawColumnCell(Sender: TObject;
                                  const Rect: TRect; DataCol: Integer;
                                        Column: TColumn; State: TGridDrawState);
begin
  with dbgrnuObj.Canvas do begin
    if not (gdFocused in State) then begin
      if m_LbxNuObj.Items.IndexOf(qryNuObjKdObj.AsString) >= 0 then
        Font.Color := clBlue
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrNuObj.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.sBtnObjSelAllClick(Sender: TObject);
var nSvKdObj : SmallInt;
begin
  m_LbxNuObj.Items.Clear;
  with qryNuObj do begin
    nSvKdObj := qryNuObjKdObj.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      m_LbxNuObj.Items.Add(qryNuObjKdObj.AsString);
      Next;
    end;
    Locate('KdObj', nSvKdObj, []);
    EnableControls;
  end;
  LabelCntSelObj.Caption := 'Помечено ' + IntToStr(m_LbxNuObj.Items.Count);
  LabelObjUvaga.Caption := 'На 2-й стр. помечено подразделений ' +
                                          IntToStr(m_LbxNuObj.Items.Count);
  rBtnObjIncl.Enabled := true;
  rBtnObjExcl.Enabled := true;
  sBtnObjUnSelAll.Enabled := true;
  sBtnObjSelAll.Enabled := false;
  dbgrNuObj.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.sBtnObjUnSelAllClick(Sender: TObject);
begin
  m_LbxNuObj.Items.Clear;
  LabelCntSelObj.Caption := 'Помеченных нет';
  LabelObjUvaga.Caption := 'На 2-й стр. помеченных подразделений НЕТ';
  rBtnObjIncl.Enabled := false;
  rBtnObjExcl.Enabled := false;
  sBtnObjUnSelAll.Enabled := false;
  sBtnObjSelAll.Enabled := true;
  dbgrNuObj.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbgrNuObjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (PageControl1.ActivePage = ts2) and (Key = VK_F8) and (Shift = []) then
    dbgrNuObjDblClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbgrSchBUDblClick(Sender: TObject);
var i, nCntMetok : SmallInt;
begin
  i := m_LbxSchBu.Items.IndexOf(cdsSchBuSchBu.AsString);
  if i < 0 then
    m_LbxSchBu.Items.Add(cdsSchBuSchBu.AsString)
  else
    m_LbxSchBu.Items.Delete(i);
  if not cdsSchBu.Eof then
    cdsSchBu.Next
  else
    dbgrSchBu.Refresh;
  nCntMetok := m_LbxSchBu.Items.Count;
  if nCntMetok > 0 then
    LabelCntSelSchBu.Caption := 'Помечено СубСчетов: ' + IntToStr(nCntMetok)
  else
    LabelCntSelSchBu.Caption := '';
  rBtnSchIncl.Enabled := nCntMetok > 0;
  rBtnSchExcl.Enabled := nCntMetok > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dbgrSchBUDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with dbgrSchBu.Canvas do begin
    if not (gdFocused in State) then begin
      if m_LbxSchBu.Items.IndexOf(cdsSchBuSchBu.AsString) >= 0 then begin
        Font.Color := clFuchsia;
        Font.Style := [fsBold]; end
      else begin
        Font.Color := clWindowText;
        Font.Style := [];
      end;
    end;
  end;
  dbgrSchBu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.dsrcPSchDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcPSch.State = dsBrowse) and cdsSchBu.Active {and not bMyClose}
                                                                   then begin
    m_LbxSchBu.Items.Clear;
    rBtnSchIncl.Enabled := false;
    rBtnSchExcl.Enabled := false;
    LabelCntSelSchBu.Caption := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.qryPSchCalcFields(DataSet: TDataSet);
begin
  if not qryPSchPSch.IsNull then with qryClc do begin
    Close;
    ParamByName('cPSch').AsString := qryPSchPSch.AsString;
    Open;
    qryPSchKdPSch.AsInteger := FieldByName('KdSch').AsInteger;
    qryPSchNmPSch.AsString  := FieldByName('NmSch').AsString;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbVidu.cdsSchBUCalcFields(DataSet: TDataSet);
begin
  if not cdsSchBUSchBU.IsNull then with qryClc2 do begin
    Close;
    ParamByName('cSchBU').AsString := cdsSchBUSchBU.AsString;
    Open;
    cdsSchBUKdSch.AsInteger := FieldByName('KdSch').AsInteger;
    Close;
  end;
end;

end.
