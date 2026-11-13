unit z_DlSDhd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, DB, StdCtrls, Mask, DBCtrls, DBClient,
  ComCtrls, DBTables, Grids, DBGrids, ExtCtrls;

type
  TFormDlgSDhd = class(TForm)
    PageControl: TPageControl;
    ts2: TTabSheet;
    ts1: TTabSheet;
    cdsTmp: TClientDataSet;
    cdsTmpDtBeg: TDateField;
    cdsTmpDtEnd: TDateField;
    cdsTmpTabN: TIntegerField;
    cdsTmpDtDoc: TDateField;
    cdsTmpFam: TStringField;
    cdsTmpFamIO: TStringField;
    cdsTmpTIN: TStringField;
    dsrcTmp: TDataSource;
    qrySpr: TQuery;
    dbgrSpr: TDBGrid;
    dsrcSpr: TDataSource;
    qryTmp: TQuery;
    ts0: TTabSheet;
    PanelTs0: TPanel;
    Label9: TLabel;
    sBtnTabN0: TSpeedButton;
    LabelFio0: TLabel;
    Label11: TLabel;
    sBtnFindFam0: TSpeedButton;
    Label12: TLabel;
    sBtnFindTin0: TSpeedButton;
    Label13: TLabel;
    dbeTabN0: TDBEdit;
    dbeFam0: TDBEdit;
    dbeTin0: TDBEdit;
    dtPicDtDoc0: TDateTimePicker;
    Label14: TLabel;
    PanelTs1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sBtnTabN: TSpeedButton;
    LabelFamIO: TLabel;
    Label7: TLabel;
    sBtnFindFam: TSpeedButton;
    Label6: TLabel;
    sBtnFindTin: TSpeedButton;
    Label8: TLabel;
    dtPicDtBeg: TDateTimePicker;
    dtPicDtEnd: TDateTimePicker;
    dbeTabN: TDBEdit;
    dbeFam: TDBEdit;
    dbeTIN: TDBEdit;
    dtPicDtDoc: TDateTimePicker;
    qrySprZAMESGOD: TDateTimeField;
    qrySprSMDHD: TFloatField;
    qrySprSMMPM: TFloatField;
    qrySprSMPDN: TFloatField;
    qrySprMesGod: TStringField;
    qrySprSMDETI: TFloatField;
    qrySprSMALIM: TFloatField;
    cdsTmpZaGod: TSmallintField;
    UpDownZaGod: TUpDown;
    edZaGod: TEdit;
    ts4: TTabSheet;
    dbgrNlgInsp: TDBGrid;
    qryNlgInsp: TQuery;
    dsrcNlgInsp: TDataSource;
    qryNlgInspZAMESGOD: TDateTimeField;
    qryNlgInspSMDHD: TFloatField;
    qryNlgInspSMPDN: TFloatField;
    qryNlgInspSMVUPL: TFloatField;
    qryNlgInspSM_SS: TFloatField;
    qryNlgInspSM_PF: TFloatField;
    qryNlgInspSM_FZ: TFloatField;
    ChBoxNoDtDoc0: TCheckBox;
    ChBoxNoDtDoc1: TCheckBox;
    tsSubs: TTabSheet;
    dbgrSubs: TDBGrid;
    qrySubs: TQuery;
    dsrcSubs: TDataSource;
    qrySubsDTPROC: TDateTimeField;
    qrySubsSMDHD: TFloatField;
    qrySubsSMMPM: TFloatField;
    qrySubsSMDETI: TFloatField;
    qrySubsSMALIM: TFloatField;
    qrySubsSMPDN: TFloatField;
    qrySubsSM_DUMMY: TFloatField;
    qrySubsMesGod: TStringField;
    ts5: TTabSheet;
    qryNlgInsp2011: TQuery;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    dsrcNlgInsp2011: TDataSource;
    dbgrNlgInsp2011: TDBGrid;
    qryNlgInsp2011SM_ESV: TFloatField;
    qryNlgInsp2011SM_WSB: TFloatField;
    PanelButtons1: TPanel;
    sBtnGo1: TSpeedButton;
    bBtnExit1: TBitBtn;
    PanelButtons2: TPanel;
    Label10: TLabel;
    bBtnPrt: TBitBtn;
    sBtnBack: TSpeedButton;
    bBtnExit2: TBitBtn;
    PanelButtonsSubs: TPanel;
    Label16: TLabel;
    bBtnPrtSubs: TBitBtn;
    SpeedButton1: TSpeedButton;
    BitBtn2: TBitBtn;
    PanelButtons0: TPanel;
    sBtnGo0: TSpeedButton;
    bBtnExit0: TBitBtn;
    PanelButtons4: TPanel;
    Label15: TLabel;
    bBtnPrt4: TBitBtn;
    sBtnBack4: TSpeedButton;
    bBtnExit4: TBitBtn;
    PanelButtons5: TPanel;
    Label17: TLabel;
    bBtnPrt5: TBitBtn;
    sBtnBack5: TSpeedButton;
    bBtnExit5: TBitBtn;
    QryAbroad: TQuery;
    DsrcAbroad: TDataSource;
    QryAbroadDTPROC: TDateTimeField;
    QryAbroadMesGod: TStringField;
    QryAbroadSumIncome: TFloatField;
    QryAbroadSumTaxes: TFloatField;
    QryAbroadSumMilit: TFloatField;
    QryAbroadSumTradeUn: TFloatField;
    QryAbroadSumAlimony: TFloatField;
    TabCommon: TTabSheet;
    PanelCmnButtons: TPanel;
    BtnCmnPrint: TBitBtn;
    BtnCmnBack: TBitBtn;
    BtnCmnExit: TBitBtn;
    DbgrAbroad: TDBGrid;
    QryAbroadSumToPay: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnTabNClick(Sender: TObject);
    procedure dbeTabNExit(Sender: TObject);
    procedure sBtnFindTinClick(Sender: TObject);
    procedure dtPicEnter(Sender: TObject);
    procedure dtPicExit(Sender: TObject);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure sBtnFindFamClick(Sender: TObject);
    procedure bBtnPrtClick(Sender: TObject);
    procedure sBtnGo1Click(Sender: TObject);
    procedure sBtnBackClick(Sender: TObject);
    procedure sBtnGo0Click(Sender: TObject);
    procedure PageControlResize(Sender: TObject);
    procedure qrySprCalcFields(DataSet: TDataSet);
    procedure cdsTmpTabNSetText(Sender: TField; const Text: String);
    procedure edZaGodChange(Sender: TObject);
    procedure edZaGodEnter(Sender: TObject);
    procedure edZaGodExit(Sender: TObject);
    procedure sBtnBack4Click(Sender: TObject);
    procedure bBtnPrt4Click(Sender: TObject);
    procedure sBtnTabN0Click(Sender: TObject);
    procedure sBtnFindFam0Click(Sender: TObject);
    procedure sBtnFindTin0Click(Sender: TObject);
    procedure qrySubsCalcFields(DataSet: TDataSet);
    procedure sBtnBack5Click(Sender: TObject);
    procedure QryAbroadCalcFields(DataSet: TDataSet);
    procedure BtnCmnBackClick(Sender: TObject);
    procedure BtnCmnExitClick(Sender: TObject);
  private
    TabN: Integer;
    Mode: ShortString;

    d_DtBeg, d_DtEnd, DtDoc: TDateTime;
    PageToReturn: TTabSheet;
    procedure CreOpenCdsTmp;
    function FindTabN(nTabN : integer;
                                 var cFam, cFamIO, cTIN : string) : boolean;
    function FindTIN(var cTIN : string; var nTabN : integer;
                                         var cFam, cFamIO : string) : boolean;
    function FindFam(var cFam : string; var nTabN : integer;
                                         var cTin, cFamIO : string) : boolean;
    procedure SetDbgrSprColumns(cCase : ShortString);
  public
    class procedure DlgSprForNlg(TabN: Integer; Mode: ShortString);
    class procedure DlgSprDhd(TabN: Integer; Mode: ShortString);
  end;

const SECTION = 'z_DlSDhd';

var
  FormDlgSDhd: TFormDlgSDhd;

implementation

uses
  Math, a_Const, a_DM, z_DM, Z_Main, z_GtQUpi, Z_ShVbFm, z_Subs3, a_Lib, z_CmnPrt,
  PrtIncomeInquiryAbroad, DateLib, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFormDlgSDhd.DlgSprForNlg(
  TabN: Integer;
  Mode: ShortString);
begin
  FormDlgSDhd := TFormDlgSDhd.Create(Application);
  FormDlgSDhd.TabN := TabN;
  FormDlgSDhd.Mode := Mode;

  with FormDlgSDhd do begin
    CreOpenCdsTmp;

    // всегда за полный год
    PageControl.ActivePage := ts0;

    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
// Mode:
// 'SprDhd' - Справка о доходах и подоходном
// 'SprSubs' - Справка для субсидий
// 'SprSubs3' - Справка для субсидий новая (с 12.2015)
// 'SprKred' - Справка для кредитов
//------------------------------------------------------------------------------
class procedure TFormDlgSDhd.DlgSprDhd(
  TabN: Integer;
  Mode: ShortString);
begin
  FormDlgSDhd := TFormDlgSDhd.Create(Application);
  FormDlgSDhd.TabN := TabN;
  FormDlgSDhd.Mode := Mode;

  with FormDlgSDhd do begin
    CreOpenCdsTmp;
    SetDbgrSprColumns(Mode);

    if Mode = 'SprDhd' then
      // всегда за полный год
      PageControl.ActivePage := ts0
    else
      // Mode = SprKred, SprSubs, SprSubs3, IncomeInqAbroad
      // за заданный период
      PageControl.ActivePage := ts1;

    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormDlgSDhd.FormCreate(Sender: TObject);
var
  DtBeg, DtEnd: TDateTime;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 335);
    Width  := ReadInteger(SECTION, 'wW', 450);

    UpDownZaGod.Position := ReadInteger(SECTION, 'nSvGd', 2005);

    with DateUtils do begin
      DtBeg := ReadInteger(SECTION, 'nSvDtB', Round(BeginOfMonth(Today)));
      DtEnd := ReadInteger(SECTION, 'nSvDtE', Round(EndOfMonth(Today)));

      DtEnd := Max(DtBeg, DtEnd);

      dtPicDtBeg.Date := DtBeg;
      dtPicDtEnd.Date := DtEnd;

      dtPicDtDoc.Date := Today;
      dtPicDtDoc0.Date := Today;
    end;

    ChBoxNoDtDoc0.Checked := ReadBool(SECTION, 'bNoDtDoc0', false);
    ChBoxNoDtDoc1.Checked := ReadBool(SECTION, 'bNoDtDoc1', false);

    Free;
  end;

  Caption := 'Задание на печать справки';
  LabelFamIO.Caption := '';
  LabelFio0.Caption := '';

  ts0.TabVisible := false;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  ts4.TabVisible := false;
  ts5.TabVisible := false;
  tsSubs.TabVisible := false;

  TabCommon.TabVisible := false;
  PageControl.ActivePage := ts1;

  if FileExists(cDirVids + 'Spr_Dhd.vid') then
    dbgrSpr.Columns.LoadFromFile(cDirVids + 'Spr_Dhd.vid');
  if FileExists(cDirVids + 'SprNlgI.vid') then
    dbgrNlgInsp.Columns.LoadFromFile(cDirVids + 'SprNlgI.vid');
  if FileExists(cDirVids + 'SprNlgI2.vid') then
    dbgrNlgInsp2011.Columns.LoadFromFile(cDirVids + 'SprNlgI2.vid');
  if FileExists(cDirVids + 'SprSubs.vid') then
    dbgrSubs.Columns.LoadFromFile(cDirVids + 'SprSubs.vid');
  if FileExists(cDirVids + 'SprSubs2.vid') then
    dbgrSubs.Columns.LoadFromFile(cDirVids + 'SprSubs2.vid');
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormDlgSDhd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);

    if cdsTmp.Active and not cdsTmp.FieldByName('ZaGod').IsNull then
      WriteInteger(SECTION, 'nSvGd', cdsTmp.FieldByName('ZaGod').AsInteger);
    if cdsTmp.Active and not cdsTmp.FieldByName('TabN').IsNull then
      WriteInteger(SECTION, 'nSvTN', cdsTmp.FieldByName('TabN').AsInteger);
    WriteInteger(SECTION, 'nSvDtB', Round(dtPicDtBeg.Date));
    WriteInteger(SECTION, 'nSvDtE', Round(dtPicDtEnd.Date));
    WriteBool(SECTION, 'bNoDtDoc0', ChBoxNoDtDoc0.Checked);
    WriteBool(SECTION, 'bNoDtDoc1', ChBoxNoDtDoc1.Checked);
    WriteInteger(SECTION, 'RepMnthYear', UpDownZaGod.Position);
    Free;
  end;

  dbgrSpr.Columns.SaveToFile(cDirVids + 'Spr_Dhd.vid');
  if qryNlgInsp.Active then
    dbgrNlgInsp.Columns.SaveToFile(cDirVids + 'SprNlgI.vid');
  if qryNlgInsp2011.Active then
    dbgrNlgInsp2011.Columns.SaveToFile(cDirVids + 'SprNlgI2.vid');
  if qrySubs.Active then
    dbgrSubs.Columns.SaveToFile(cDirVids + 'SprSubs.vid');
  if qrySubs.Active then
    dbgrSubs.Columns.SaveToFile(cDirVids + 'SprSubs2.vid');
end;

//------------------------------------------------------------------------------
procedure TFormDlgSDhd.CreOpenCdsTmp;
var cFam, cFamIO, cTIN : string;
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    FieldByName('ZaGod').AsInteger := UpDownZaGod.Position;
    if (TabN <> 0) then begin
      FieldByName('TabN').AsInteger := TabN;
      if FindTabN(TabN, cFam, cFamIO, cTIN) then begin
        FieldByName('Fam').AsString := cFam;
        FieldByName('FamIO').AsString := cFamIO;
        FieldByName('TIN').AsString := cTIN;
        LabelFamIO.Caption := cFamIO;
        LabelFio0.Caption := cFamIO;
      end;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.SetDbgrSprColumns(cCase : ShortString);
var i : SmallInt; cUpper : ShortString;
begin
  for i := 0 to dbgrSpr.Columns.Count-1 do begin
    cUpper := AnsiUpperCase(dbgrSpr.Columns[i].FieldName);
    if {(cUpper = 'SMDETI') or} (cUpper = 'SMALIM') then
      dbgrSpr.Columns[i].Visible := (cCase = 'SprSubs') or (cCase = 'SprSubs3')
    else if (cUpper = 'SMPDN') then
      dbgrSpr.Columns[i].Visible := (cCase = 'SprDhd')
    else
      dbgrSpr.Columns[i].Visible := true;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnTabNClick(Sender: TObject);
var nTabN : integer; cFam, cIma, cOtch, cFamIO, cTIN : string;
begin
  dbeFam.SetFocus;
  dbeTabN.SetFocus;
  Application.ProcessMessages;
  nTabN := cdsTmp.FieldByName('TabN').AsInteger;
  if GetUpiTabN(nTabN, cFam, cIma, cOtch, cFamIO, cTIN) {z_GtQUpi} then begin
    cdsTmp.FieldByName('TabN').AsInteger := nTabN;
    cdsTmp.FieldByName('Fam').AsString := cFam;
    cdsTmp.FieldByName('TIN').AsString := cTIN;
    LabelFamIO.Caption := cFamIO;
    LabelFio0.Caption := cFamIO;
  end;
end;
//------------------------------------------------------------------------------
function TFormDlgSDhd.FindTabN(nTabN : integer;
                                     var cFam, cFamIO, cTIN : string) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    if RecordCount > 0 then begin
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                      FieldByName('Ima').AsString,
                                        FieldByName('Otch').AsString);
      cFam := FieldByName('FAM').AsString;
      cTIN := FieldByName('ID').AsString;
      Result := true
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.dbeTabNExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.cdsTmpTabNSetText(Sender: TField; const Text: String);
var cText : string; nTabN : integer;
    cFam, cFamIO, cTIN : string;
begin
  cText := Text;
  if cText <> '' then begin
    nTabN := StrToInt(cText);
    if FindTabN(nTabN, cFam, cFamIO, cTIN) then begin
      Sender.AsString := cText;
      cdsTmpFam.AsString := cFam;
      cdsTmpFamIO.AsString := cFamIO;
      LabelFamIO.Caption := cFamIO;
      LabelFio0.Caption := cFamIO;
      cdsTmpTIN.AsString := cTIN; end
    else
      Raise Exception.Create('Нет в таблице "Сотрудники" табельного номера "' +
                                                                  cText + '"');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnFindTinClick(Sender: TObject);
var nTabN : integer; cTIN, cSvTIN, cFam, cFamIO : string;
begin
  cSvTIN := cdsTmp.FieldByName('TIN').AsString; // до потери фокуса (старый)
  dbeFam.SetFocus;
  dbeTIN.SetFocus;
  cTin := cdsTmp.FieldByName('TIN').AsString;
  if FindTin(cTin, nTabN, cFam, cFamIO) then begin
    LabelFamIO.Caption := cFamIO;
    LabelFio0.Caption := cFamIO;
    cdsTmp.FieldByName('Fam').AsString := cFam;
    cdsTmp.FieldByName('TIN').AsString := cTin;
    cdsTmp.FieldByName('TabN').AsInteger := nTabN; end
  else begin
    cdsTmp.FieldByName('TIN').AsString := cSvTin;
    ShowMessage('Заданный ТИН: ' + cTIN + ' не найден.');
  end;
end;
//------------------------------------------------------------------------------
function TFormDlgSDhd.FindTIN(var cTIN : string; var nTabN : integer;
                                         var cFam, cFamIO : string) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI where ID = :cTIN');
    ParamByName('cTIN').AsString := cTIN;
    Open;
    if RecordCount > 0 then begin
      cTIN   := FieldByName('ID').AsString;
      cFam   := FieldByName('Fam').AsString;
      nTabN  := FieldByName('TabN').AsInteger;
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                      FieldByName('Ima').AsString,
                                        FieldByName('Otch').AsString);
      Result := true
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnFindFamClick(Sender: TObject);
var nTabN : integer; cTIN, cSvFam, cFam, cFamIO : string;
begin
  cSvFam := cdsTmp.FieldByName('Fam').AsString; // до потери фокуса (старый)
  dbeTIN.SetFocus;
  dbeFam.SetFocus;
  cFam := cdsTmp.FieldByName('Fam').AsString;
  if FindFam(cFam, nTabN, cTin, cFamIO) then begin
    LabelFamIO.Caption := cFamIO;
    LabelFio0.Caption := cFamIO;
    cdsTmp.FieldByName('Fam').AsString := cFam;
    cdsTmp.FieldByName('TIN').AsString := cTin;
    cdsTmp.FieldByName('TabN').AsInteger := nTabN; end
  else
    cdsTmp.FieldByName('Fam').AsString := cSvFam;
end;
//------------------------------------------------------------------------------
function TFormDlgSDhd.FindFam(var cFam : string; var nTabN : integer;
                                         var cTIN, cFamIO : string) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI where upper(Fam) containing(:cFam)');
    ParamByName('cFam').AsString := AnsiUpperCase(cFam);
    Open;
    if RecordCount = 1 then begin
      cTIN   := FieldByName('ID').AsString;
      cFam   := FieldByName('Fam').AsString;
      nTabN  := FieldByName('TabN').AsInteger;
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                      FieldByName('Ima').AsString,
                                        FieldByName('Otch').AsString);
      Result := true end
    else if RecordCount > 1 then begin
      if Shw_FamsForUpi(qryTmp, nTabN) {Z_ShVbFm} then begin
        cTIN   := FieldByName('ID').AsString;
        cFam   := FieldByName('Fam').AsString;
        nTabN  := FieldByName('TabN').AsInteger;
        cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                 FieldByName('Ima').AsString,
                                        FieldByName('Otch').AsString);
        Result := true
      end; end
    else
      ShowMessage('Фамилия: ' + cFam + ' не найдена.');
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.dtPicEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.dtPicExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.edZaGodEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.edZaGodExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnGo1Click(Sender: TObject);
var
  nY, nM, nD: Word;
  nTabN: Integer;
begin
  PageToReturn := ts1;

  Application.ProcessMessages;
  DecodeDate(dtPicDtBeg.Date, nY, nM, nD);
  d_DtBeg := EncodeDate(nY, nM, 1);
  DecodeDate(dtPicDtEnd.Date, nY, nM, nD);
  d_DtEnd := EncodeDate(nY, nM, 1);

  DtDoc := DtPicDtDoc.Date;

  nTabN := cdsTmp.FieldByName('TabN').AsInteger;
  if d_DtEnd < d_DtBeg then begin
    ShowMessage('Вторая дата не может быть меньше первой');
    Exit;
  end;
  if Mode = 'SprSubs' then begin
    InitQuery(QrySubs);
    with qrySubs do begin
      SQL.Add('Select * from For_SprSubs (:nTabN, :dDtBeg, :dDtEnd)');
      ParamByName('nTabN').AsInteger := nTabN;
      ParamByName('dDtBeg').AsDateTime := d_DtBeg;
      ParamByName('dDtEnd').AsDateTime := d_DtEnd;
      Open;

      if RecordCount = 0 then
        ShowMessage('Не найдено данных для справки. Проверьте задание.')
      else begin
        PageControl.ActivePage := tsSubs;
        Caption := 'ТабН ' + IntToStr(nTabN) + ' с ' +
                            Copy(DateToStr(d_DtBeg), 4, 7) + ' по ' +
                            Copy(DateToStr(d_DtEnd), 4, 7) + ' (вкл.)';
      end
    end
  end else if Mode = 'IncomeInqAbroad' then begin
    InitQuery(QryAbroad);
    with QryAbroad do begin
      SQL.Add('select * from For_IncomeInqAbroad(:nTabN, :dDtBeg, :dDtEnd)');
      ParamByName('nTabN').AsInteger := nTabN;
      ParamByName('dDtBeg').AsDateTime := d_DtBeg;
      ParamByName('dDtEnd').AsDateTime := d_DtEnd;
      Open;
      if RecordCount = 0 then
        ShowMessage('Не найдено данных для справки. Проверьте задание.')
      else begin
        PageControl.ActivePage := TabCommon;
        Caption := 'ТабН ' + IntToStr(nTabN) + ' с ' +
                            Copy(DateToStr(d_DtBeg), 4, 7) + ' по ' +
                            Copy(DateToStr(d_DtEnd), 4, 7) + ' (вкл.)';
      end
    end;
  end else if Mode = 'SprSubs3' then begin
    ShwSprSubs3(nTabN, d_DtBeg, d_DtEnd, DtDoc);    {z_Subs3}
    end
  else if Mode = 'SprKred' then with qrySpr do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from For_SprKred (:nTabN, :dDtBeg, :dDtEnd)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := d_DtBeg;
    ParamByName('dDtEnd').AsDateTime := d_DtEnd;
    Open;
    if RecordCount = 0 then
      ShowMessage('Не найдено данных для справки. Проверьте задание')
    else begin
      PageControl.ActivePage := ts2;
      Caption := 'ТабН ' + IntToStr(nTabN) + ' с ' +
                          Copy(DateToStr(d_DtBeg), 4, 7) + ' по ' +
                          Copy(DateToStr(d_DtEnd), 4, 7) + ' (вкл.)';
    end; end
  else with qrySpr do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from For_SprDhd (:nTabN, :dDtBeg, :dDtEnd)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := d_DtBeg;
    ParamByName('dDtEnd').AsDateTime := d_DtEnd;
    Open;
    if RecordCount = 0 then
      ShowMessage('Не найдено данных для справки. Проверьте задание')
    else begin
      PageControl.ActivePage := ts2;
      Caption := 'ТабН ' + IntToStr(nTabN) + ' с ' +
                          Copy(DateToStr(d_DtBeg), 4, 7) + ' по ' +
                          Copy(DateToStr(d_DtEnd), 4, 7) + ' (вкл.)';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnBackClick(Sender: TObject);
begin
  Caption := 'Задание на печать справки';
  qrySpr.Close;

  PageControl.ActivePage := PageToReturn;
  exit;

  if Mode = 'SprDhd' then
    // всегда за полный год
    PageControl.ActivePage := ts0
  else if (Mode = 'SprSubs') or (Mode = 'IncomeInqAbroad') then
    // может быть за заданный период
    PageControl.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnGo0Click(Sender: TObject);
var nY : word;
begin
  PageToReturn := ts0;

  edZaGod.SetFocus;
  Application.ProcessMessages;
  nY := cdsTmpZaGod.AsInteger;        // Год - тут (на ts0) всегда за год
  d_DtBeg := EncodeDate(nY,  1, 1);
  d_DtEnd := EncodeDate(nY, 12, 1);

  DtDoc := dtPicDtDoc0.Date;

  TabN := cdsTmp.FieldByName('TabN').AsInteger;
  if (Mode = 'SprDhd') or (Mode = 'SprSubs') then
  with qrySpr do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from For_SprDhd (:nTabN, :dDtBeg, :dDtEnd)');
    ParamByName('nTabN').AsInteger := TabN;
    ParamByName('dDtBeg').AsDateTime := d_DtBeg;
    ParamByName('dDtEnd').AsDateTime := d_DtEnd;
    Open;
    if RecordCount = 0 then
      ShowMessage('Не найдено данных для справки. Измените задание')
    else begin
      PageControl.ActivePage := ts2;
      Caption := 'ТабН ' + IntToStr(TabN) + ' с ' +
                          Copy(DateToStr(d_DtBeg), 4, 7) + ' по ' +
                          Copy(DateToStr(d_DtEnd), 4, 7) + ' (вкл.)';
    end;
  end
  else if (Mode = 'SprNlgInsp') then begin
    if nY < 2011 then with qryNlgInsp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from For_SprNlgInsp (:nTabN, :dDtBeg, :dDtEnd) ');
      ParamByName('nTabN').AsInteger := TabN;
      ParamByName('dDtBeg').AsDateTime := d_DtBeg;
      ParamByName('dDtEnd').AsDateTime := d_DtEnd;
      Open;
      if RecordCount = 0 then
        ShowMessage('Не найдено данных для справки. Измените задание')
      else begin
        PageControl.ActivePage := ts4;
        Caption := 'ТабН ' + IntToStr(TabN) + ' с ' +
                            Copy(DateToStr(d_DtBeg), 4, 7) + ' по ' +
                            Copy(DateToStr(d_DtEnd), 4, 7) + ' (вкл.)';
      end; end
    else {if nY >= 2011 then} with qryNlgInsp2011 do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from For_Spr2011NlgInsp (:nTabN, :dDtBeg, :dDtEnd) ');
      ParamByName('nTabN').AsInteger := TabN;
      ParamByName('dDtBeg').AsDateTime := d_DtBeg;
      ParamByName('dDtEnd').AsDateTime := d_DtEnd;
      Open;
      if RecordCount = 0 then
        ShowMessage('Не найдено данных для справки. Измените задание')
      else begin
        PageControl.ActivePage := ts5;
        Caption := 'ТабН ' + IntToStr(TabN) + ' с ' +
                            Copy(DateToStr(d_DtBeg), 4, 7) + ' по ' +
                            Copy(DateToStr(d_DtEnd), 4, 7) + ' (вкл.)';
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.bBtnPrtClick(Sender: TObject);
var
  nTabN : integer;
  nY, nM, nD : word;
  bNoDtDoc : boolean;
begin
  DecodeDate(d_DtBeg, nY, nM, nD);
  nTabN := cdsTmp.FieldByName('TabN').AsInteger;
  if Mode = 'SprDhd' then begin
    bNoDtDoc := ChBoxNoDtDoc0.Checked;
    F6PrtSprDhd(nTabN, nY, DtDoc, bNoDtDoc, qrySpr); end {z_CmnPrt}
  else if Mode = 'SprKred' then begin
    bNoDtDoc := ChBoxNoDtDoc1.Checked;                    {z_CmnPrt}
    F6PrtSprKred(nTabN, d_DtBeg, d_DtEnd, DtDoc, bNoDtDoc, qrySpr); end
  else if Mode = 'SprSubs' then begin
    bNoDtDoc := ChBoxNoDtDoc1.Checked;
    F6PrtSprSubs(nTabN, d_DtBeg, d_DtEnd, DtDoc, bNoDtDoc, qrySubs); {z_CmnPrt}
  end else if Mode = 'IncomeInqAbroad' then begin
    TPrtIncomeInq.Run(
      nTabN, d_DtBeg, d_DtEnd, DtDoc, ChBoxNoDtDoc1.Checked, QryAbroad);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.PageControlResize(Sender: TObject);
begin
  PanelTs0.Top := PageControl.Top +
                        Round((PageControl.Height - PanelTs0.Height) / 2) - 20;
  PanelTs0.Left := PageControl.Left +
                        Round((PageControl.Width - PanelTs0.Width) / 2) - 5;
  PanelTs1.Top := PageControl.Top +
                        Round((PageControl.Height - PanelTs1.Height) / 2) - 20;
  PanelTs1.Left := PageControl.Left +
                        Round((PageControl.Width - PanelTs1.Width) / 2) - 5;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.qrySprCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qrySprZaMesGod.AsDateTime, nY, nM, nD);
  qrySprMesGod.AsString := UkrMes(nM) + ' ' + IntToStr(nY) + ' p.';
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.qrySubsCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qrySubsDtProc.AsDateTime, nY, nM, nD);
  qrySubsMesGod.AsString := UkrMes(nM) + ' ' + IntToStr(nY) + ' p.';
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.edZaGodChange(Sender: TObject);
begin
  if cdsTmp.Active then
    cdsTmpZaGod.AsInteger := UpDownZaGod.Position;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnBack4Click(Sender: TObject);
begin
  Caption := 'Задание на печать справки';
  qryNlgInsp.Close;
  if Mode = 'SprNlgInsp' {всегда за полный год} then
    PageControl.ActivePage := ts0;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnBack5Click(Sender: TObject);
begin
  Caption := 'Задание на печать справки';
  qryNlgInsp2011.Close;
  if Mode = 'SprNlgInsp' {всегда за полный год} then
    PageControl.ActivePage := ts0;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.bBtnPrt4Click(Sender: TObject);
var nTabN : integer; nGod : word;
    bNoDtDoc : boolean;
begin
  nGod := cdsTmpZaGod.AsInteger;
  bNoDtDoc := ChBoxNoDtDoc0.Checked;
  nTabN := cdsTmp.FieldByName('TabN').AsInteger;
  if nGod < 2011 then
    F6PrtSprNlgInsp(nTabN, nGod, DtDoc, bNoDtDoc, qryNlgInsp) {z_CmnPrt}
  else {if nGod >= 2011 then}
    F6PrtSprNlgInsp(nTabN, nGod, DtDoc, bNoDtDoc, qryNlgInsp2011); {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnTabN0Click(Sender: TObject);
var nTabN : integer; cFam, cIma, cOtch, cFamIO, cTIN : string;
begin
  dbeFam0.SetFocus;
  dbeTabN0.SetFocus;
  Application.ProcessMessages;
  nTabN := cdsTmp.FieldByName('TabN').AsInteger;
  if GetUpiTabN(nTabN, cFam, cIma, cOtch, cFamIO, cTIN) {z_GtQUpi} then begin
    cdsTmp.FieldByName('TabN').AsInteger := nTabN;
    cdsTmp.FieldByName('Fam').AsString := cFam;
    cdsTmp.FieldByName('TIN').AsString := cTIN;
    LabelFamIO.Caption := cFamIO;
    LabelFio0.Caption  := cFamIO;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnFindFam0Click(Sender: TObject);
var nTabN : integer; cTIN, cSvFam, cFam, cFamIO : string;
begin
  cSvFam := cdsTmp.FieldByName('Fam').AsString; // до потери фокуса (старый)
  dbeTin0.SetFocus;
  dbeFam0.SetFocus;
  cFam := cdsTmp.FieldByName('Fam').AsString;
  if FindFam(cFam, nTabN, cTin, cFamIO) then begin
    LabelFamIO.Caption := cFamIO;
    LabelFio0.Caption := cFamIO;
    cdsTmp.FieldByName('Fam').AsString := cFam;
    cdsTmp.FieldByName('TIN').AsString := cTin;
    cdsTmp.FieldByName('TabN').AsInteger := nTabN; end
  else
    cdsTmp.FieldByName('Fam').AsString := cSvFam;
end;
//------------------------------------------------------------------------------
procedure TFormDlgSDhd.sBtnFindTin0Click(Sender: TObject);
var nTabN : integer; cTIN, cSvTIN, cFam, cFamIO : string;
begin
  cSvTIN := cdsTmp.FieldByName('TIN').AsString; // до потери фокуса (старый)
  dbeFam0.SetFocus;
  dbeTIN0.SetFocus;
  cTin := cdsTmp.FieldByName('TIN').AsString;
  if FindTin(cTin, nTabN, cFam, cFamIO) then begin
    LabelFamIO.Caption := cFamIO;
    LabelFio0.Caption := cFamIO;
    cdsTmp.FieldByName('Fam').AsString := cFam;
    cdsTmp.FieldByName('TIN').AsString := cTin;
    cdsTmp.FieldByName('TabN').AsInteger := nTabN; end
  else begin
    cdsTmp.FieldByName('TIN').AsString := cSvTin;
    ShowMessage('Заданный ТИН: ' + cTIN + ' не найден.');
  end;
end;

procedure TFormDlgSDhd.QryAbroadCalcFields(DataSet: TDataSet);
var
  Date: TDate;
begin
  with DataSet, Date, DateUtils do begin
    Date := Decode(FieldByName('DtProc').AsDateTime);
    FieldByName('MesGod').AsString :=
      UkrMes(Mnth) + ' ' + IntToStr(Year) + ' p.';

    FieldByName('SumToPay').AsFloat := FieldByName('SumIncome').AsFloat -
      FieldByName('SumTaxes').AsFloat - FieldByName('SumMilit').AsFloat - 
      FieldByName('SumTradeUn').AsFloat - FieldByName('SumAlimony').AsFloat;
  end;
end;

procedure TFormDlgSDhd.BtnCmnBackClick(Sender: TObject);
begin
  PageControl.ActivePage := ts1;
end;

procedure TFormDlgSDhd.BtnCmnExitClick(Sender: TObject);
begin
  Close;
end;

end.
