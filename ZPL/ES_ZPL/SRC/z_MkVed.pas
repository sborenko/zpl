unit z_MkVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, DBTables, DB, DBClient, ExtCtrls, Grids,
  DBGrids, ComCtrls, Buttons, Menus;

type
  String3 = string[3];
  String4 = string[4];
  TFormMkVed = class(TForm)
    PageControl1: TPageControl;
    tsSps: TTabSheet;
    tsVed: TTabSheet;
    dbgrSps: TDBGrid;
    Splitter1: TSplitter;
    qrySps: TQuery;
    dsrcSps: TDataSource;
    qrySpsFAM: TStringField;
    qrySpsIMA: TStringField;
    qrySpsOTCH: TStringField;
    qrySpsKDSPS: TSmallintField;
    qrySpsTABN: TIntegerField;
    qrySpsNCH: TStringField;
    qrySpsKDOBJ: TSmallintField;
    qrySpsKDKATP: TSmallintField;
    qrySpsFamIO: TStringField;
    qrySpsShObj: TStringField;
    qrySpsShKatP: TStringField;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    qrySpsDTPROC: TDateTimeField;
    qryNUNR: TIntegerField;
    qryNUKDSPS: TSmallintField;
    qryNUDTPROC: TDateTimeField;
    qryNUZAMESGOD: TDateTimeField;
    qryNUTABN: TIntegerField;
    qryNUVIDN: TStringField;
    qryNUCHAS: TFloatField;
    qryNUSUMMA: TFloatField;
    qryNUKDOBJ: TSmallintField;
    qryNUKDKATP: TSmallintField;
    qryNUDT_BEG: TDateTimeField;
    qryNUDT_END: TDateTimeField;
    qryNUKDSPZ: TSmallintField;
    qryNUPDN: TSmallintField;
    qryNUNOTES: TStringField;
    qryNUPRR: TSmallintField;
    qryNUPRPV: TSmallintField;
    qryNUKTO: TSmallintField;
    qryNUPRKR: TSmallintField;
    qryNUSPEC_NR: TIntegerField;
    qryNUMYNOTES: TStringField;
    qryNUShVidN: TStringField;
    qryNUShObj: TStringField;
    qryNUShKatP: TStringField;
    qryNUSpz: TStringField;
    qrySpsLICSCH: TStringField;
    cdsVed: TClientDataSet;
    dsrcVed: TDataSource;
    dbgrVed: TDBGrid;
    cdsVedNR: TAutoIncField;
    cdsVedTabN: TIntegerField;
    cdsVedFamIO: TStringField;
    cdsVedFam: TStringField;
    cdsVedIma: TStringField;
    cdsVedOtch: TStringField;
    cdsVedKdObj: TIntegerField;
    cdsVedShObj: TStringField;
    cdsVedKdKatP: TIntegerField;
    cdsVedShKatP: TStringField;
    cdsVedLicSch: TStringField;
    cdsVednPp: TSmallintField;
    cdsVedSm1OtpC: TFloatField;
    cdsVedSm1OtpB: TFloatField;
    cdsVedSm1Rest: TFloatField;
    cdsVedSm1Nach: TFloatField;
    cdsVedSm1Udrg: TFloatField;
    cdsVedSm1Vupl: TFloatField;
    cdsVedSm2OtpC: TFloatField;
    cdsVedSm2OtpB: TFloatField;
    cdsVedSm2Rest: TFloatField;
    cdsVedSm2Nach: TFloatField;
    cdsVedSm2Udrg: TFloatField;
    cdsVedSm2Vupl: TFloatField;
    cdsVedSm1Daem: TFloatField;
    cdsVedSm2Daem: TFloatField;
    dbgrTots: TDBGrid;
    Splitter2: TSplitter;
    cdsTots: TClientDataSet;
    dsrcTots: TDataSource;
    cdsTotsSm1OtpC: TFloatField;
    cdsTotsSm1OtpB: TFloatField;
    cdsTotsSm1Rest: TFloatField;
    cdsTotsSm1Nach: TFloatField;
    cdsTotsSm1Udrg: TFloatField;
    cdsTotsSm1Vupl: TFloatField;
    cdsTotsSm1Daem: TFloatField;
    cdsTotsSm2OtpC: TFloatField;
    cdsTotsSm2OtpB: TFloatField;
    cdsTotsSm2Rest: TFloatField;
    cdsTotsSm2Nach: TFloatField;
    cdsTotsSm2Udrg: TFloatField;
    cdsTotsSm2Vupl: TFloatField;
    cdsTotsSm2Daem: TFloatField;
    cdsTotsNR: TAutoIncField;
    cdsTotsNotes: TStringField;
    Panel2: TPanel;
    sBtnVvZd: TSpeedButton;
    sBtnGoTo: TSpeedButton;
    SpeedButton6: TSpeedButton;
    sBtnSave: TSpeedButton;
    bBtnClose: TBitBtn;
    Panel3: TPanel;
    sBtnGoTo1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    qryTmp: TQuery;
    qrySvOtkl: TQuery;
    qrySvNu: TQuery;
    qryNUSmN: TFloatField;
    qryNUSmU: TFloatField;
    popNU: TPopupMenu;
    popNuVidSumm: TMenuItem;
    popNuVidSummOne: TMenuItem;
    popNuVidSummTwo: TMenuItem;
    PanelSpsRight: TPanel;
    dbgrNU: TDBGrid;
    LabelTotal: TLabel;
    cdsCheck: TClientDataSet;
    cdsVedIsOPZ: TBooleanField;
    cdsVedSm1VudR: TFloatField;
    cdsVedSm2VudR: TFloatField;
    cdsTotsSm1VudR: TFloatField;
    cdsTotsSm2VudR: TFloatField;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrySpsCalcFields(DataSet: TDataSet);
    procedure qryNUCalcFields(DataSet: TDataSet);
    procedure dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrVedDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnVvZdClick(Sender: TObject);
    procedure dbgrTotsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnGoToClick(Sender: TObject);
    procedure sBtnGoTo1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sBtnSaveClick(Sender: TObject);
    procedure popNuVidSummOneClick(Sender: TObject);
    procedure popNuVidSummTwoClick(Sender: TObject);
    procedure qrySpsAfterScroll(DataSet: TDataSet);
    procedure cdsVedSm1DaemSetText(Sender: TField; const Text: String);
    procedure cdsVedSm2DaemSetText(Sender: TField; const Text: String);
    procedure sBtnGoToMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    n_KdSps : integer;
    n_PrcOtpC, n_PrcOtpB, n_PrcRest, n_PrcVupl : double;
    bSpsReady : boolean;
    n_CaseSovm, n_CaseScheme : integer;
    procedure SetDbgrNuColumns;
    procedure OpenQrySps(dDtProc : TDateTime;
                                   LbxObj, LbxKatP, LbxSpz : TListBox;
                                   nKdSps, nCaseSovm : integer);
    procedure OpenQryNU;
    procedure ShowRLstTotals;
    procedure CreOpenCdsCheck(dDtProc : TDateTime; nKdSps : integer);
    procedure CreOpenCdsVed(dDtProc : TDateTime; nCaseSovm : integer);
    procedure AddInCdsVed(nPp : integer;
                              cTabN, cFamIO, cFam, cIma, cOtch, cKdObj,
                              cShObj, cKdKatP, cShKatP, cLicSch : string;
    nSm1OtpC, nSm1OtpB, nSm1Rest, nSm1VudR, nSm1Udrg, nSm1Vupl,
    nSm2OtpC, nSm2OtpB, nSm2Rest, nSm2VudR, nSm2Udrg, nSm2Vupl : double);
    procedure SetDbgrVedTotsColumns(nCaseScheme : integer);
  public
    { Public declarations }
  end;

procedure MakeVed(dDtProc : TDateTime; LbxObj, LbxKatP, LbxSpz : TListBox;
                                     nKdSps, nCaseSovm, nCaseScheme : integer);

const SECTION = 'z_MkVed';

var
  FormMkVed: TFormMkVed;

implementation

uses a_Const, a_Lib, A_Prgrss, a_DM, z_Dm, z_Main, z_ZdVPrc, z_VdMsg1;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure MakeVed(dDtProc : TDateTime; LbxObj, LbxKatP, LbxSpz : TListBox;
                                     nKdSps, nCaseSovm, nCaseScheme : integer);
var cMsg : string;
begin
  FormMkVed := TFormMkVed.Create(Application);
  with FormMkVed do begin
    cMsg := 'Формирование ведомости';
    if nCaseScheme = 1 then begin
      cMsg := cMsg + ' (схема "отпуск + зарплата").';
      CreOpenCdsCheck(dDtProc, nKdSps); end
    else if nCaseScheme = 2 then
      cMsg := cMsg + ' (схема "частичные выплаты").'
    else
      cMsg := cMsg + ' (схема "окончательные выплаты").';
    Caption  := cMsg;
    bSpsReady := false;
    d_DtProc := dDtProc;
    n_KdSps  := nKdSps;
    n_PrcOtpC := 0;
    n_PrcOtpB := 0;
    n_PrcRest := 0;
    n_PrcVupl := 0;
    n_CaseSovm   := nCaseSovm;
    n_CaseScheme := nCaseScheme;
    OpenQrySps(dDtProc, LbxObj, LbxKatP, LbxSpz, nKdSps, nCaseSovm);
    OpenQryNU;
    CreOpenCdsVed(dDtProc, nCaseSovm);
    SetDbgrVedTotsColumns(nCaseScheme);
    tsSps.TabVisible := false;
    tsVed.TabVisible := false;
    PageControl1.ActivePage := tsVed;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.CreOpenCdsCheck(dDtProc : TDateTime; nKdSps : integer);
begin                   // Для проверки, включался ли уже ТабН в "отп+зп"
  with cdsCheck do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select distinct TabN from Z_NU where DtProc = :dDtProc and ' +
            ' KdSps = :nKdSps and MyNotes = "Vd_OPZT"');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ParamByName('nKdSps').AsInteger := nKdSps;
    Open;
    while not Eof do begin
      cdsCheck.AppendRecord([FieldByName('TabN').AsInteger]);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if bFlagDbg then
    cdsCheck.SaveToFile(cDirTemp + 'Check.cds');
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.SetDbgrVedTotsColumns(nCaseScheme : integer);
var cUpper : string; i : integer;
begin
  for i := 0 to dbgrVed.Columns.Count-1 do begin
    with dbgrVed.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SM1OTPC') or (cUpper = 'SM1OTPB') or
             (cUpper = 'SM1REST') or (cUpper = 'SM2OTPC') or
                 (cUpper = 'SM2OTPB') or (cUpper = 'SM2REST') then
        Visible := (nCaseScheme = 1)
      else if (cUpper = 'SM1NACH')  or (cUpper = 'SM2NACH') then
        Visible := (nCaseScheme = 2) or (nCaseScheme = 3);
    end;
  end;
  for i := 0 to dbgrTots.Columns.Count-1 do begin
    with dbgrTots.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SM1OTPC') or (cUpper = 'SM1OTPB') or
             (cUpper = 'SM1REST') or (cUpper = 'SM2OTPC') or
                 (cUpper = 'SM2OTPB') or (cUpper = 'SM2REST') then
        Visible := (nCaseScheme = 1)
      else if (cUpper = 'SM1NACH') or (cUpper = 'SM2NACH') then
        Visible := ((nCaseScheme = 2) or (nCaseScheme = 3));
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 385);
    Width  := ReadInteger(SECTION, 'wW', 450);
    dbgrSps.Width := ReadInteger(SECTION, 'GrSpsW', 220);
    dbgrTots.Height := ReadInteger(SECTION, 'GrTotsH', 100);
    popNuVidSummOne.Checked := ReadBool(SECTION, 'bColOne', true);
    Free;
  end;
  LabelTotal.Caption := '';
  popNuVidSummTwo.Checked  := not popNuVidSummOne.Checked;
  SetDbgrNuColumns;
  if FileExists(cDirVids + 'MkVdSps.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'MkVdSps.vid');
  if FileExists(cDirVids + 'MkVdNu.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'MkVdNu.vid');
  if FileExists(cDirVids + 'MkVdVed.vid') then
    dbgrVed.Columns.LoadFromFile(cDirVids + 'MkVdVed.vid');
  if FileExists(cDirVids + 'MkVdTots.vid') then
    dbgrTots.Columns.LoadFromFile(cDirVids + 'MkVdTots.vid');
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSps.Columns.SaveToFile(cDirVids + 'MkVdSps.vid');
  dbgrNu.Columns.SaveToFile(cDirVids + 'MkVdNu.vid');
  dbgrVed.Columns.SaveToFile(cDirVids + 'MkVdVed.vid');
  dbgrTots.Columns.SaveToFile(cDirVids + 'MkVdTots.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'GrSpsW', dbgrSps.Width);
    WriteInteger(SECTION, 'GrTotsH', dbgrTots.Height);
    WriteBool(SECTION, 'bColOne', popNuVidSummOne.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.CreOpenCdsVed(dDtProc : TDateTime;
                                                nCaseSovm : integer);
var nPp, nKdObj, nTabN : integer; cVidN : string4; cSchet : string3;
    nSm1OtpC, nSm1OtpB, nSm1Rest, nSm1VudR, nSm1Udrg, nSm1Vupl : double;
    nSm2OtpC, nSm2OtpB, nSm2Rest, nSm2VudR, nSm2Udrg, nSm2Vupl : double;
    nSm1OtpCTt, nSm1OtpBTt, nSm1RestTt, nSm1NachTt,
                             nSm1VudRTt, nSm1UdrgTt, nSm1VuplTt : double;
    nSm2OtpCTt, nSm2OtpBTt, nSm2RestTt, nSm2NachTt,
                             nSm2VudRTt, nSm2UdrgTt, nSm2VuplTt : double;
    nSm1OtpCBt, nSm1OtpBBt, nSm1RestBt, nSm1NachBt,
                             nSm1VudRBt, nSm1UdrgBt, nSm1VuplBt : double;
    nSm2OtpCBt, nSm2OtpBBt, nSm2RestBt, nSm2NachBt,
                             nSm2VudRBt, nSm2UdrgBt, nSm2VuplBt : double;
    nSm1OtpCKt, nSm1OtpBKt, nSm1RestKt, nSm1NachKt,
                             nSm1VudRKt, nSm1UdrgKt, nSm1VuplKt : double;
    nSm2OtpCKt, nSm2OtpBKt, nSm2RestKt, nSm2NachKt,
                            nSm2VudRKt,  nSm2UdrgKt, nSm2VuplKt : double;
    // 1 и 2 - для разбиения по счетам 801... и 811...,  B/K - банк/касса
    dTimeStart : TDateTime;
    n, nCntPodkl, nPBarMax, nPBarStep : integer;
    nY, nM, nD : word;
begin
  with cdsVed do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  nSm1OtpCTt := 0;
  nSm1OtpBTt := 0;
  nSm1RestTt := 0;
  nSm1VudRTt := 0;
  nSm1UdrgTt := 0;
  nSm1VuplTt := 0;
  nSm2OtpCTt := 0;
  nSm2OtpBTt := 0;
  nSm2RestTt := 0;
  nSm2VudRTt := 0;
  nSm2UdrgTt := 0;
  nSm2VuplTt := 0;
  nSm1OtpCBt := 0;
  nSm1OtpBBt := 0;
  nSm1RestBt := 0;
  nSm1VudRBt := 0;
  nSm1NachBt := 0;
  nSm1UdrgBt := 0;
  nSm1VuplBt := 0;
  nSm2OtpCBt := 0;
  nSm2OtpBBt := 0;
  nSm2RestBt := 0;
  nSm2VudRBt := 0;
  nSm2NachBt := 0;
  nSm2UdrgBt := 0;
  nSm2VuplBt := 0;
  nSm1OtpCKt := 0;
  nSm1OtpBKt := 0;
  nSm1RestKt := 0;
  nSm1VudRKt := 0;
  nSm1NachKt := 0;
  nSm1UdrgKt := 0;
  nSm1VuplKt := 0;
  nSm2OtpCKt := 0;
  nSm2OtpBKt := 0;
  nSm2RestKt := 0;
  nSm2VudRKt := 0;
  nSm2NachKt := 0;
  nSm2UdrgKt := 0;
  nSm2VuplKt := 0;
  // При любом задании будем выбирать в ведомость все суммы по полной схеме,
  // а показывать и обрабатывать будем разные колонки
  with qrySps do begin
    DecodeDate(dDtProc, nY, nM, nD);
    nPBarMax := RecordCount;
    nPBarStep := 1;
    dTimeStart := SysUtils.Time;              {A_Prgrss}
    BeginShowProgress('Создание ведомости за ' + MesRus(nM) + ' ' +
                                    IntToStr(nY) + ' г.', nPBarMax, nPBarStep);
    n := 0;
    nCntPodkl := 0;
    First;
    while not Eof do begin
      nPp := 0;
      nKdObj := FieldByName('KdObj').AsInteger;
      while (FieldByName('KdObj').AsInteger = nKdObj) and not Eof do begin
      {
        if (n_CaseScheme = 1) and cdsCheck.Locate('TabN',
                                  FieldByName('TabN').AsInteger, [])  then begin
          Next;
          Continue;
        end;
      }
        Inc(n);
        FormProgress.StatusBar.Panels[0].Text := '   ' +
                                  IntToStr(nPBarMax) + ' / ' + IntToStr(n);
        FormProgress.StatusBar.Panels[1].Text := '   ' +
                          'Просчитывается TabНр: ' +
                                 Trim(FieldByName('TabN').AsString) + '  ' +
                                 FieldByName('FamIO').AsString;
        FormProgress.StatusBar.Panels[2].Text :=
                                TimeToStr(SysUtils.Time - dTimeStart);
        UpdateProgress;
        Application.ProcessMessages;
        nSm1OtpC := 0;
        nSm1OtpB := 0;
        nSm1Rest := 0;
        nSm1VudR := 0;
        nSm1Udrg := 0;
        nSm2OtpC := 0;
        nSm2OtpB := 0;
        nSm2Rest := 0;
        nSm2VudR := 0;
        nSm2Udrg := 0;
        qryNu.First;
        while not qryNu.Eof do begin
          cVidN := qryNu.FieldByName('VidN').AsString;
          cSchet := Copy(qryNu.FieldByName('Spz').AsString, 1, 3);
          if cSchet = '801' then begin
            if (cVidN > '2400') and (cVidN < '2500') {отпускные} then begin
              if qryNu.FieldByName('ZaMesGod').AsDateTime <= dDtProc then begin
                nSm1OtpC := nSm1OtpC + qryNu.FieldByName('Summa').AsFloat;
                nSm1OtpCTt := nSm1OtpCTt + qryNu.FieldByName('Summa').AsFloat;
                if FieldByName('LicSch').IsNull then
                  nSm1OtpCKt := nSm1OtpCKt + qryNu.FieldByName('Summa').AsFloat
                else
                  nSm1OtpCBt := nSm1OtpCBt + qryNu.FieldByName('Summa').AsFloat;
                end
              else begin
                nSm1OtpB := nSm1OtpB + qryNu.FieldByName('Summa').AsFloat;
                nSm1OtpBTt := nSm1OtpBTt + qryNu.FieldByName('Summa').AsFloat;
                if FieldByName('LicSch').IsNull then
                  nSm1OtpBKt := nSm1OtpBKt + qryNu.FieldByName('Summa').AsFloat
                else
                  nSm1OtpBBt := nSm1OtpBBt + qryNu.FieldByName('Summa').AsFloat;
              end; end
            else if (cVidN < '6000') then begin          // другие начисления
              nSm1Rest := nSm1Rest +  qryNu.FieldByName('Summa').AsFloat;
              nSm1RestTt := nSm1RestTt + qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm1RestKt := nSm1RestKt + qryNu.FieldByName('Summa').AsFloat
              else
                nSm1RestBt := nSm1RestBt + qryNu.FieldByName('Summa').AsFloat;
              end
            else if (cVidN > '7500') and (cVidN < '7600') {выплаты} then begin
              nSm1VudR := nSm1VudR - qryNu.FieldByName('Summa').AsFloat;
              nSm1VudRTt := nSm1VudRTt - qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm1VudRKt := nSm1VudRKt - qryNu.FieldByName('Summa').AsFloat
              else
                nSm1VudRBt := nSm1VudRBt - qryNu.FieldByName('Summa').AsFloat;
              end
            else if (cVidN > '6000') and (cVidN < '7500') then begin                                       // прочие удержания
              nSm1Udrg := nSm1Udrg - qryNu.FieldByName('Summa').AsFloat;
              nSm1UdrgTt := nSm1UdrgTt - qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm1UdrgKt := nSm1UdrgKt - qryNu.FieldByName('Summa').AsFloat
              else
                nSm1UdrgBt := nSm1UdrgBt - qryNu.FieldByName('Summa').AsFloat;
            end; end
          else begin
            if (cVidN > '2400') and (cVidN < '2500') then begin // отпускные
              if qryNu.FieldByName('ZaMesGod').AsDateTime <= dDtProc then begin
                nSm2OtpC := nSm2OtpC + qryNu.FieldByName('Summa').AsFloat;
                nSm2OtpCTt := nSm2OtpCTt + qryNu.FieldByName('Summa').AsFloat;
                if FieldByName('LicSch').IsNull then
                  nSm2OtpCKt := nSm2OtpCKt + qryNu.FieldByName('Summa').AsFloat
                else
                  nSm2OtpCBt := nSm2OtpCBt + qryNu.FieldByName('Summa').AsFloat;
                end
              else begin
                nSm2OtpB := nSm2OtpB + qryNu.FieldByName('Summa').AsFloat;
                nSm2OtpBTt := nSm2OtpBTt + qryNu.FieldByName('Summa').AsFloat;
                if FieldByName('LicSch').IsNull then
                  nSm2OtpBKt := nSm2OtpBKt + qryNu.FieldByName('Summa').AsFloat
                else
                  nSm2OtpBBt := nSm2OtpBBt + qryNu.FieldByName('Summa').AsFloat;
              end; end
            else if (cVidN < '6000') then begin     // другие начисления
              nSm2Rest := nSm2Rest +  qryNu.FieldByName('Summa').AsFloat;
              nSm2RestTt := nSm2RestTt + qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm2RestKt := nSm2RestKt + qryNu.FieldByName('Summa').AsFloat
              else
                nSm2RestBt := nSm2RestBt + qryNu.FieldByName('Summa').AsFloat;
              end
            else if (cVidN > '7500') and (cVidN < '7600') {выплаты} then begin
              nSm2VudR := nSm2VudR - qryNu.FieldByName('Summa').AsFloat;
              nSm2VudRTt := nSm2VudRTt - qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm2VudRKt := nSm2VudRKt - qryNu.FieldByName('Summa').AsFloat
              else
                nSm2VudRBt := nSm2VudRBt - qryNu.FieldByName('Summa').AsFloat;
              end
            else if (cVidN > '6000') and (cVidN < '7500') then begin                                       // прочие удержания
              nSm2Udrg := nSm2Udrg - qryNu.FieldByName('Summa').AsFloat;
              nSm2UdrgTt := nSm2UdrgTt - qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm2UdrgKt := nSm2UdrgKt - qryNu.FieldByName('Summa').AsFloat
              else
                nSm2UdrgBt := nSm2UdrgBt - qryNu.FieldByName('Summa').AsFloat;
            end;
          end;
          qryNu.Next;
        end;
        nSm1Vupl := MyRound(nSm1OtpC + nSm1OtpB + nSm1Rest -
                                                    nSm1VudR - nSm1Udrg, 2);
        nSm2Vupl := MyRound(nSm2OtpC + nSm2OtpB + nSm2Rest -
                                                    nSm2VudR - nSm2Udrg, 2);
        if (nSm1Vupl <> 0) or (nSm1Udrg <> 0) or
                              (nSm2Vupl <> 0) or (nSm2Udrg <> 0) then begin
          Inc(nPp);
          AddInCdsVed(nPp, FieldByName('TabN').AsString,
                            FieldByName('FamIO').AsString,
                             FieldByName('Fam').AsString,
                              FieldByName('Ima').AsString,
                               FieldByName('Otch').AsString,
                                FieldByName('KdObj').AsString,
                                 FieldByName('ShObj').AsString,
                                  FieldByName('KdKatP').AsString,
                                   FieldByName('ShKatP').AsString,
                                    FieldByName('LicSch').AsString,
                    nSm1OtpC, nSm1OtpB, nSm1Rest, nSm1VudR, nSm1Udrg, nSm1Vupl,
                    nSm2OtpC, nSm2OtpB, nSm2Rest, nSm2VudR, nSm2Udrg, nSm2Vupl);
        end;
        Next;
      end;
    end;
    EndShowProgress;
  end;
  if bFlagDbg then
    cdsVed.SaveToFile(cDirTemp + 'MkVed01.cds');
  cdsVed.First;
  nSm1OtpCTt := MyRound(nSm1OtpCTt, 2);
  nSm1OtpBTt := MyRound(nSm1OtpBTt, 2);
  nSm1RestTt := MyRound(nSm1RestTt, 2);
  nSm1NachTt := nSm1OtpCTt + nSm1OtpBTt + nSm1RestTt;
  nSm1VudRTt := MyRound(nSm1VudRTt, 2);
  nSm1UdrgTt := MyRound(nSm1UdrgTt, 2);
  nSm1VuplTt := nSm1NachTt - nSm1VudRTt - nSm1UdrgTt;
  nSm1VuplTt := MyRound(nSm1VuplTt, 2);
  nSm2OtpCTt := MyRound(nSm2OtpCTt, 2);
  nSm2OtpBTt := MyRound(nSm2OtpBTt, 2);
  nSm2RestTt := MyRound(nSm2RestTt, 2);
  nSm2NachTt := nSm2OtpCTt + nSm2OtpBTt + nSm2RestTt;
  nSm2NachTt := MyRound(nSm2NachTt, 2);
  nSm2UdrgTt := MyRound(nSm2UdrgTt, 2);
  nSm2VuplTt := nSm2NachTt - nSm2VudRTt - nSm2UdrgTt;
  nSm2VuplTt := MyRound(nSm2VuplTt, 2);
  nSm1OtpCBt := MyRound(nSm1OtpCBt, 2);
  nSm1OtpBBt := MyRound(nSm1OtpBBt, 2);
  nSm1RestBt := MyRound(nSm1RestBt, 2);
  nSm1NachBt := nSm1OtpCBt + nSm1OtpBBt + nSm1RestBt;
  nSm1NachBt := MyRound(nSm1NachBt, 2);
  nSm1UdrgBt := MyRound(nSm1UdrgBt, 2);
  nSm1VuplBt := nSm1NachBt - nSm1VudRBt - nSm1UdrgBt;
  nSm1VuplBt := MyRound(nSm1VuplBt, 2);
  nSm2OtpCBt := MyRound(nSm2OtpCBt, 2);
  nSm2OtpBBt := MyRound(nSm2OtpBBt, 2);
  nSm2RestBt := MyRound(nSm2RestBt, 2);
  nSm2NachBt := nSm2OtpCBt + nSm2OtpBBt + nSm2RestBt;
  nSm2NachBt := MyRound(nSm2NachBt, 2);
  nSm2UdrgBt := MyRound(nSm2UdrgBt, 2);
  nSm2VuplBt := nSm2NachBt - nSm2VudRBt - nSm2UdrgBt;
  nSm2VuplBt := MyRound(nSm2VuplBt, 2);
  nSm1OtpCKt := MyRound(nSm1OtpCKt, 2);
  nSm1OtpBKt := MyRound(nSm1OtpBKt, 2);
  nSm1RestKt := MyRound(nSm1RestKt, 2);
  nSm1NachKt := nSm1OtpCKt + nSm1OtpBKt + nSm1RestKt;
  nSm1NachKt := MyRound(nSm1NachKt, 2);
  nSm1UdrgKt := MyRound(nSm1UdrgKt, 2);
  nSm1VuplKt := nSm1NachKt - nSm1VudRKt - nSm1UdrgKt;
  nSm1VuplKt := MyRound(nSm1VuplKt, 2);
  nSm2OtpCKt := MyRound(nSm2OtpCKt, 2);
  nSm2OtpBKt := MyRound(nSm2OtpBKt, 2);
  nSm2RestKt := MyRound(nSm2RestKt, 2);
  nSm2NachKt := nSm2OtpCKt + nSm2OtpBKt + nSm2RestKt;
  nSm2NachKt := MyRound(nSm2NachKt, 2);
  nSm2UdrgKt := MyRound(nSm2UdrgKt, 2);
  nSm2VuplKt := nSm2NachKt - nSm2VudRKt - nSm2UdrgKt;
  nSm2VuplKt := MyRound(nSm2VuplKt, 2);
  with cdsTots do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    FieldByName('Notes').AsString := 'Всего:';
    if nSm1OtpCTt <> 0 then
      FieldByName('Sm1OtpC').AsFloat := nSm1OtpCTt;
    if nSm1OtpBTt <> 0 then
      FieldByName('Sm1OtpB').AsFloat := nSm1OtpBTt;
    if nSm1RestTt <> 0 then
      FieldByName('Sm1Rest').AsFloat := nSm1RestTt;
    if nSm1NachTt <> 0 then
      FieldByName('Sm1Nach').AsFloat := nSm1NachTt;
    if nSm1UdrgTt <> 0 then
      FieldByName('Sm1Udrg').AsFloat := nSm1UdrgTt;
    if nSm1UdrgTt <> 0 then
      FieldByName('Sm1Udrg').AsFloat := nSm1UdrgTt;
    if nSm1VudRTt <> 0 then
      FieldByName('Sm1VudR').AsFloat := nSm1VudRTt;
    if nSm2OtpCTt <> 0 then
      FieldByName('Sm2OtpC').AsFloat := nSm2OtpCTt;
    if nSm2OtpBTt <> 0 then
      FieldByName('Sm2OtpB').AsFloat := nSm2OtpBTt;
    if nSm2RestTt <> 0 then
      FieldByName('Sm2Rest').AsFloat := nSm2RestTt;
    if nSm2NachTt <> 0 then
      FieldByName('Sm2Nach').AsFloat := nSm2NachTt;
    if nSm2UdrgTt <> 0 then
      FieldByName('Sm2Udrg').AsFloat := nSm2UdrgTt;
    if nSm2VudRTt <> 0 then
      FieldByName('Sm2VudR').AsFloat := nSm2VudRTt;
    if nSm2VuplTt <> 0 then
      FieldByName('Sm2Vupl').AsFloat := nSm2VuplTt;
    Post;
    Append;
    FieldByName('Notes').AsString := ' - в т.ч. в банк:';
    if nSm1OtpCBt <> 0 then
      FieldByName('Sm1OtpC').AsFloat := nSm1OtpCBt;
    if nSm1OtpBBt <> 0 then
      FieldByName('Sm1OtpB').AsFloat := nSm1OtpBBt;
    if nSm1RestBt <> 0 then
      FieldByName('Sm1Rest').AsFloat := nSm1RestBt;
    if nSm1NachBt <> 0 then
      FieldByName('Sm1Nach').AsFloat := nSm1NachBt;
    if nSm1UdrgBt <> 0 then
      FieldByName('Sm1Udrg').AsFloat := nSm1UdrgBt;
    if nSm1VudRBt <> 0 then
      FieldByName('Sm1VudR').AsFloat := nSm1VudRBt;
    if nSm1VuplBt <> 0 then
      FieldByName('Sm1Vupl').AsFloat := nSm1VuplBt;
    if nSm2OtpCBt <> 0 then
      FieldByName('Sm2OtpC').AsFloat := nSm2OtpCBt;
    if nSm2OtpBBt <> 0 then
      FieldByName('Sm2OtpB').AsFloat := nSm2OtpBBt;
    if nSm2RestBt <> 0 then
      FieldByName('Sm2Rest').AsFloat := nSm2RestBt;
    if nSm2NachBt <> 0 then
      FieldByName('Sm2Nach').AsFloat := nSm2NachBt;
    if nSm2UdrgBt <> 0 then
      FieldByName('Sm2Udrg').AsFloat := nSm2UdrgBt;
    if nSm2VudRBt <> 0 then
      FieldByName('Sm2VudR').AsFloat := nSm2VudRBt;
    if nSm2VuplBt <> 0 then
      FieldByName('Sm2Vupl').AsFloat := nSm2VuplBt;
    Post;
    Append;
    FieldByName('Notes').AsString := ' -        в кассу:';
    if nSm1OtpCKt <> 0 then
      FieldByName('Sm1OtpC').AsFloat := nSm1OtpCKt;
    if nSm1OtpBKt <> 0 then
      FieldByName('Sm1OtpB').AsFloat := nSm1OtpBKt;
    if nSm1RestKt <> 0 then
      FieldByName('Sm1Rest').AsFloat := nSm1RestKt;
    if nSm1NachKt <> 0 then
      FieldByName('Sm1Nach').AsFloat := nSm1NachKt;
    if nSm1UdrgKt <> 0 then
      FieldByName('Sm1Udrg').AsFloat := nSm1UdrgKt;
    if nSm1VudRKt <> 0 then
      FieldByName('Sm1VudR').AsFloat := nSm1VudRKt;
    if nSm1VuplKt <> 0 then
      FieldByName('Sm1Vupl').AsFloat := nSm1VuplKt;
    if nSm2OtpCKt <> 0 then
      FieldByName('Sm2OtpC').AsFloat := nSm2OtpCKt;
    if nSm2OtpBKt <> 0 then
      FieldByName('Sm2OtpB').AsFloat := nSm2OtpBKt;
    if nSm2RestKt <> 0 then
      FieldByName('Sm2Rest').AsFloat := nSm2RestKt;
    if nSm2NachKt <> 0 then
      FieldByName('Sm2Nach').AsFloat := nSm2NachKt;
    if nSm2UdrgKt <> 0 then
      FieldByName('Sm2Udrg').AsFloat := nSm2UdrgKt;
    if nSm2VudRKt <> 0 then
      FieldByName('Sm2VudR').AsFloat := nSm1VudRKt;
    if nSm2VuplKt <> 0 then
      FieldByName('Sm2Vupl').AsFloat := nSm2VuplKt;
    Post;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'MkVdTots.cds');
  end;
  PageControl1.ActivePage := tsVed;
end;
(*
//------------------------------------------------------------------------------
procedure TFormMkVed.CreOpenCdsVed(dDtProc : TDateTime;
                                                nCaseSovm : integer);
var nPp, nKdObj, nTabN : integer; cVidN : string4; cSchet : string3;
    nSm1OtpC, nSm1OtpB, nSm1Rest, nSm1VudR, nSm1Udrg, nSm1Vupl : double;
    nSm2OtpC, nSm2OtpB, nSm2Rest, nSm2VudR, nSm2Udrg, nSm2Vupl : double;
    nSm1OtpCTt, nSm1OtpBTt, nSm1RestTt, nSm1NachTt,
                             nSm1VudRTt, nSm1UdrgTt, nSm1VuplTt : double;
    nSm2OtpCTt, nSm2OtpBTt, nSm2RestTt, nSm2NachTt,
                             nSm2VudRTt, nSm2UdrgTt, nSm2VuplTt : double;
    nSm1OtpCBt, nSm1OtpBBt, nSm1RestBt, nSm1NachBt,
                             nSm1VudRBt, nSm1UdrgBt, nSm1VuplBt : double;
    nSm2OtpCBt, nSm2OtpBBt, nSm2RestBt, nSm2NachBt,
                             nSm2VudRBt, nSm2UdrgBt, nSm2VuplBt : double;
    nSm1OtpCKt, nSm1OtpBKt, nSm1RestKt, nSm1NachKt,
                             nSm1VudRKt, nSm1UdrgKt, nSm1VuplKt : double;
    nSm2OtpCKt, nSm2OtpBKt, nSm2RestKt, nSm2NachKt,
                            nSm2VudRKt,  nSm2UdrgKt, nSm2VuplKt : double;
    // 1 и 2 - для разбиения по счетам 801... и 811...,  B/K - банк/касса
begin
  with cdsVed do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  nSm1OtpCTt := 0;
  nSm1OtpBTt := 0;
  nSm1RestTt := 0;
  nSm1VudRTt := 0;
  nSm1UdrgTt := 0;
  nSm1VuplTt := 0;
  nSm2OtpCTt := 0;
  nSm2OtpBTt := 0;
  nSm2RestTt := 0;
  nSm2VudRTt := 0;
  nSm2UdrgTt := 0;
  nSm2VuplTt := 0;
  nSm1OtpCBt := 0;
  nSm1OtpBBt := 0;
  nSm1RestBt := 0;
  nSm1VudRBt := 0;
  nSm1NachBt := 0;
  nSm1UdrgBt := 0;
  nSm1VuplBt := 0;
  nSm2OtpCBt := 0;
  nSm2OtpBBt := 0;
  nSm2RestBt := 0;
  nSm2VudRBt := 0;
  nSm2NachBt := 0;
  nSm2UdrgBt := 0;
  nSm2VuplBt := 0;
  nSm1OtpCKt := 0;
  nSm1OtpBKt := 0;
  nSm1RestKt := 0;
  nSm1VudRKt := 0;
  nSm1NachKt := 0;
  nSm1UdrgKt := 0;
  nSm1VuplKt := 0;
  nSm2OtpCKt := 0;
  nSm2OtpBKt := 0;
  nSm2RestKt := 0;
  nSm2VudRKt := 0;
  nSm2NachKt := 0;
  nSm2UdrgKt := 0;
  nSm2VuplKt := 0;
  // При любом задании будем выбирать в ведомость все суммы по полной схеме,
  // а показывать и обрабатывать будем разные колонки
  with qrySps do begin
    First;
    while not Eof do begin
      nPp := 0;
      nKdObj := FieldByName('KdObj').AsInteger;
      while (FieldByName('KdObj').AsInteger = nKdObj) and not Eof do begin
      {
        if (n_CaseScheme = 1) and cdsCheck.Locate('TabN',
                                  FieldByName('TabN').AsInteger, [])  then begin
          Next;
          Continue;
        end;
      }
        nSm1OtpC := 0;
        nSm1OtpB := 0;
        nSm1Rest := 0;
        nSm1VudR := 0;
        nSm1Udrg := 0;
        nSm2OtpC := 0;
        nSm2OtpB := 0;
        nSm2Rest := 0;
        nSm2VudR := 0;
        nSm2Udrg := 0;
        qryNu.First;
        while not qryNu.Eof do begin
          cVidN := qryNu.FieldByName('VidN').AsString;
          cSchet := Copy(qryNu.FieldByName('Spz').AsString, 1, 3);
          if cSchet = '801' then begin
            if (cVidN > '24') and (cVidN < '25') then begin         // отпускные
              if qryNu.FieldByName('ZaMesGod').AsDateTime <= dDtProc then begin
                nSm1OtpC := nSm1OtpC + qryNu.FieldByName('Summa').AsFloat;
                nSm1OtpCTt := nSm1OtpCTt + qryNu.FieldByName('Summa').AsFloat;
                if FieldByName('LicSch').IsNull then
                  nSm1OtpCKt := nSm1OtpCKt + qryNu.FieldByName('Summa').AsFloat
                else
                  nSm1OtpCBt := nSm1OtpCBt + qryNu.FieldByName('Summa').AsFloat;
                end
              else begin
                nSm1OtpB := nSm1OtpB + qryNu.FieldByName('Summa').AsFloat;
                nSm1OtpBTt := nSm1OtpBTt + qryNu.FieldByName('Summa').AsFloat;
                if FieldByName('LicSch').IsNull then
                  nSm1OtpBKt := nSm1OtpBKt + qryNu.FieldByName('Summa').AsFloat
                else
                  nSm1OtpBBt := nSm1OtpBBt + qryNu.FieldByName('Summa').AsFloat;
              end; end
            else if (cVidN < '60') then begin               // прочие начисления
              nSm1Rest := nSm1Rest +  qryNu.FieldByName('Summa').AsFloat;
              nSm1RestTt := nSm1RestTt + qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm1RestKt := nSm1RestKt + qryNu.FieldByName('Summa').AsFloat
              else
                nSm1RestBt := nSm1RestBt + qryNu.FieldByName('Summa').AsFloat;
              end
            else if (cVidN = '62а') or       {пл.аванс}
                       (cVidN = '62б') or    {меж.выпл}
                          (cVidN = '62г') or {касса}
                             (cVidN = '63а') {банк} then begin     // межвыплаты
              nSm1VudR := nSm1VudR - qryNu.FieldByName('Summa').AsFloat;
              nSm1VudRTt := nSm1VudRTt - qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm1VudRKt := nSm1VudRKt - qryNu.FieldByName('Summa').AsFloat
              else
                nSm1VudRBt := nSm1VudRBt - qryNu.FieldByName('Summa').AsFloat;
              end
            else begin                                       // прочие удержания
              nSm1Udrg := nSm1Udrg - qryNu.FieldByName('Summa').AsFloat;
              nSm1UdrgTt := nSm1UdrgTt - qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm1UdrgKt := nSm1UdrgKt - qryNu.FieldByName('Summa').AsFloat
              else
                nSm1UdrgBt := nSm1UdrgBt - qryNu.FieldByName('Summa').AsFloat;
            end; end
          else begin
            if (cVidN > '24') and (cVidN < '25') then begin         // отпускные
              if qryNu.FieldByName('ZaMesGod').AsDateTime <= dDtProc then begin
                nSm2OtpC := nSm2OtpC + qryNu.FieldByName('Summa').AsFloat;
                nSm2OtpCTt := nSm2OtpCTt + qryNu.FieldByName('Summa').AsFloat;
                if FieldByName('LicSch').IsNull then
                  nSm2OtpCKt := nSm2OtpCKt + qryNu.FieldByName('Summa').AsFloat
                else
                  nSm2OtpCBt := nSm2OtpCBt + qryNu.FieldByName('Summa').AsFloat;
                end
              else begin
                nSm2OtpB := nSm2OtpB + qryNu.FieldByName('Summa').AsFloat;
                nSm2OtpBTt := nSm2OtpBTt + qryNu.FieldByName('Summa').AsFloat;
                if FieldByName('LicSch').IsNull then
                  nSm2OtpBKt := nSm2OtpBKt + qryNu.FieldByName('Summa').AsFloat
                else
                  nSm2OtpBBt := nSm2OtpBBt + qryNu.FieldByName('Summa').AsFloat;
              end; end
            else if (cVidN < '60') then begin               // прочие начисления
              nSm2Rest := nSm2Rest +  qryNu.FieldByName('Summa').AsFloat;
              nSm2RestTt := nSm2RestTt + qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm2RestKt := nSm2RestKt + qryNu.FieldByName('Summa').AsFloat
              else
                nSm2RestBt := nSm2RestBt + qryNu.FieldByName('Summa').AsFloat;
              end
            else if (cVidN = '62а') or       {пл.аванс}
                       (cVidN = '62б') or    {меж.выпл}
                          (cVidN = '62г') or {касса}
                             (cVidN = '63а') {банк} then begin     // межвыплаты
              nSm2VudR := nSm2VudR - qryNu.FieldByName('Summa').AsFloat;
              nSm2VudRTt := nSm2VudRTt - qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm2VudRKt := nSm2VudRKt - qryNu.FieldByName('Summa').AsFloat
              else
                nSm2VudRBt := nSm2VudRBt - qryNu.FieldByName('Summa').AsFloat;
              end
            else begin                                       // прочие удержания
              nSm2Udrg := nSm2Udrg - qryNu.FieldByName('Summa').AsFloat;
              nSm2UdrgTt := nSm2UdrgTt - qryNu.FieldByName('Summa').AsFloat;
              if FieldByName('LicSch').IsNull then
                nSm2UdrgKt := nSm2UdrgKt - qryNu.FieldByName('Summa').AsFloat
              else
                nSm2UdrgBt := nSm2UdrgBt - qryNu.FieldByName('Summa').AsFloat;
            end;
          end;
          qryNu.Next;
        end;
        nSm1Vupl := MyRound(nSm1OtpC + nSm1OtpB + nSm1Rest -
                                                    nSm1VudR - nSm1Udrg, 2);
        nSm2Vupl := MyRound(nSm2OtpC + nSm2OtpB + nSm2Rest -
                                                    nSm2VudR - nSm2Udrg, 2);
        if (nSm1Vupl <> 0) or (nSm1Udrg <> 0) or
                              (nSm2Vupl <> 0) or (nSm2Udrg <> 0) then begin
          Inc(nPp);
          AddInCdsVed(nPp, FieldByName('TabN').AsString,
                            FieldByName('FamIO').AsString,
                             FieldByName('Fam').AsString,
                              FieldByName('Ima').AsString,
                               FieldByName('Otch').AsString,
                                FieldByName('KdObj').AsString,
                                 FieldByName('ShObj').AsString,
                                  FieldByName('KdKatP').AsString,
                                   FieldByName('ShKatP').AsString,
                                    FieldByName('LicSch').AsString,
                    nSm1OtpC, nSm1OtpB, nSm1Rest, nSm1VudR, nSm1Udrg, nSm1Vupl,
                    nSm2OtpC, nSm2OtpB, nSm2Rest, nSm2VudR, nSm2Udrg, nSm2Vupl);
        end;
        Next;
      end;
    end;
  end;
  if bFlagDbg then
    cdsVed.SaveToFile(cDirTemp + 'MkVed01.cds');
  cdsVed.First;
  nSm1OtpCTt := MyRound(nSm1OtpCTt, 2);
  nSm1OtpBTt := MyRound(nSm1OtpBTt, 2);
  nSm1RestTt := MyRound(nSm1RestTt, 2);
  nSm1NachTt := nSm1OtpCTt + nSm1OtpBTt + nSm1RestTt;
  nSm1VudRTt := MyRound(nSm1VudRTt, 2);
  nSm1UdrgTt := MyRound(nSm1UdrgTt, 2);
  nSm1VuplTt := nSm1NachTt - nSm1VudRTt - nSm1UdrgTt;
  nSm1VuplTt := MyRound(nSm1VuplTt, 2);
  nSm2OtpCTt := MyRound(nSm2OtpCTt, 2);
  nSm2OtpBTt := MyRound(nSm2OtpBTt, 2);
  nSm2RestTt := MyRound(nSm2RestTt, 2);
  nSm2NachTt := nSm2OtpCTt + nSm2OtpBTt + nSm2RestTt;
  nSm2NachTt := MyRound(nSm2NachTt, 2);
  nSm2UdrgTt := MyRound(nSm2UdrgTt, 2);
  nSm2VuplTt := nSm2NachTt - nSm2VudRTt - nSm2UdrgTt;
  nSm2VuplTt := MyRound(nSm2VuplTt, 2);
  nSm1OtpCBt := MyRound(nSm1OtpCBt, 2);
  nSm1OtpBBt := MyRound(nSm1OtpBBt, 2);
  nSm1RestBt := MyRound(nSm1RestBt, 2);
  nSm1NachBt := nSm1OtpCBt + nSm1OtpBBt + nSm1RestBt;
  nSm1NachBt := MyRound(nSm1NachBt, 2);
  nSm1UdrgBt := MyRound(nSm1UdrgBt, 2);
  nSm1VuplBt := nSm1NachBt - nSm1VudRBt - nSm1UdrgBt;
  nSm1VuplBt := MyRound(nSm1VuplBt, 2);
  nSm2OtpCBt := MyRound(nSm2OtpCBt, 2);
  nSm2OtpBBt := MyRound(nSm2OtpBBt, 2);
  nSm2RestBt := MyRound(nSm2RestBt, 2);
  nSm2NachBt := nSm2OtpCBt + nSm2OtpBBt + nSm2RestBt;
  nSm2NachBt := MyRound(nSm2NachBt, 2);
  nSm2UdrgBt := MyRound(nSm2UdrgBt, 2);
  nSm2VuplBt := nSm2NachBt - nSm2VudRBt - nSm2UdrgBt;
  nSm2VuplBt := MyRound(nSm2VuplBt, 2);
  nSm1OtpCKt := MyRound(nSm1OtpCKt, 2);
  nSm1OtpBKt := MyRound(nSm1OtpBKt, 2);
  nSm1RestKt := MyRound(nSm1RestKt, 2);
  nSm1NachKt := nSm1OtpCKt + nSm1OtpBKt + nSm1RestKt;
  nSm1NachKt := MyRound(nSm1NachKt, 2);
  nSm1UdrgKt := MyRound(nSm1UdrgKt, 2);
  nSm1VuplKt := nSm1NachKt - nSm1VudRKt - nSm1UdrgKt;
  nSm1VuplKt := MyRound(nSm1VuplKt, 2);
  nSm2OtpCKt := MyRound(nSm2OtpCKt, 2);
  nSm2OtpBKt := MyRound(nSm2OtpBKt, 2);
  nSm2RestKt := MyRound(nSm2RestKt, 2);
  nSm2NachKt := nSm2OtpCKt + nSm2OtpBKt + nSm2RestKt;
  nSm2NachKt := MyRound(nSm2NachKt, 2);
  nSm2UdrgKt := MyRound(nSm2UdrgKt, 2);
  nSm2VuplKt := nSm2NachKt - nSm2VudRKt - nSm2UdrgKt;
  nSm2VuplKt := MyRound(nSm2VuplKt, 2);
  with cdsTots do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    FieldByName('Notes').AsString := 'Всего:';
    if nSm1OtpCTt <> 0 then
      FieldByName('Sm1OtpC').AsFloat := nSm1OtpCTt;
    if nSm1OtpBTt <> 0 then
      FieldByName('Sm1OtpB').AsFloat := nSm1OtpBTt;
    if nSm1RestTt <> 0 then
      FieldByName('Sm1Rest').AsFloat := nSm1RestTt;
    if nSm1NachTt <> 0 then
      FieldByName('Sm1Nach').AsFloat := nSm1NachTt;
    if nSm1UdrgTt <> 0 then
      FieldByName('Sm1Udrg').AsFloat := nSm1UdrgTt;
    if nSm1UdrgTt <> 0 then
      FieldByName('Sm1Udrg').AsFloat := nSm1UdrgTt;
    if nSm1VudRTt <> 0 then
      FieldByName('Sm1VudR').AsFloat := nSm1VudRTt;
    if nSm2OtpCTt <> 0 then
      FieldByName('Sm2OtpC').AsFloat := nSm2OtpCTt;
    if nSm2OtpBTt <> 0 then
      FieldByName('Sm2OtpB').AsFloat := nSm2OtpBTt;
    if nSm2RestTt <> 0 then
      FieldByName('Sm2Rest').AsFloat := nSm2RestTt;
    if nSm2NachTt <> 0 then
      FieldByName('Sm2Nach').AsFloat := nSm2NachTt;
    if nSm2UdrgTt <> 0 then
      FieldByName('Sm2Udrg').AsFloat := nSm2UdrgTt;
    if nSm2VudRTt <> 0 then
      FieldByName('Sm2VudR').AsFloat := nSm2VudRTt;
    if nSm2VuplTt <> 0 then
      FieldByName('Sm2Vupl').AsFloat := nSm2VuplTt;
    Post;
    Append;
    FieldByName('Notes').AsString := ' - в т.ч. в банк:';
    if nSm1OtpCBt <> 0 then
      FieldByName('Sm1OtpC').AsFloat := nSm1OtpCBt;
    if nSm1OtpBBt <> 0 then
      FieldByName('Sm1OtpB').AsFloat := nSm1OtpBBt;
    if nSm1RestBt <> 0 then
      FieldByName('Sm1Rest').AsFloat := nSm1RestBt;
    if nSm1NachBt <> 0 then
      FieldByName('Sm1Nach').AsFloat := nSm1NachBt;
    if nSm1UdrgBt <> 0 then
      FieldByName('Sm1Udrg').AsFloat := nSm1UdrgBt;
    if nSm1VudRBt <> 0 then
      FieldByName('Sm1VudR').AsFloat := nSm1VudRBt;
    if nSm1VuplBt <> 0 then
      FieldByName('Sm1Vupl').AsFloat := nSm1VuplBt;
    if nSm2OtpCBt <> 0 then
      FieldByName('Sm2OtpC').AsFloat := nSm2OtpCBt;
    if nSm2OtpBBt <> 0 then
      FieldByName('Sm2OtpB').AsFloat := nSm2OtpBBt;
    if nSm2RestBt <> 0 then
      FieldByName('Sm2Rest').AsFloat := nSm2RestBt;
    if nSm2NachBt <> 0 then
      FieldByName('Sm2Nach').AsFloat := nSm2NachBt;
    if nSm2UdrgBt <> 0 then
      FieldByName('Sm2Udrg').AsFloat := nSm2UdrgBt;
    if nSm2VudRBt <> 0 then
      FieldByName('Sm2VudR').AsFloat := nSm2VudRBt;
    if nSm2VuplBt <> 0 then
      FieldByName('Sm2Vupl').AsFloat := nSm2VuplBt;
    Post;
    Append;
    FieldByName('Notes').AsString := ' -        в кассу:';
    if nSm1OtpCKt <> 0 then
      FieldByName('Sm1OtpC').AsFloat := nSm1OtpCKt;
    if nSm1OtpBKt <> 0 then
      FieldByName('Sm1OtpB').AsFloat := nSm1OtpBKt;
    if nSm1RestKt <> 0 then
      FieldByName('Sm1Rest').AsFloat := nSm1RestKt;
    if nSm1NachKt <> 0 then
      FieldByName('Sm1Nach').AsFloat := nSm1NachKt;
    if nSm1UdrgKt <> 0 then
      FieldByName('Sm1Udrg').AsFloat := nSm1UdrgKt;
    if nSm1VudRKt <> 0 then
      FieldByName('Sm1VudR').AsFloat := nSm1VudRKt;
    if nSm1VuplKt <> 0 then
      FieldByName('Sm1Vupl').AsFloat := nSm1VuplKt;
    if nSm2OtpCKt <> 0 then
      FieldByName('Sm2OtpC').AsFloat := nSm2OtpCKt;
    if nSm2OtpBKt <> 0 then
      FieldByName('Sm2OtpB').AsFloat := nSm2OtpBKt;
    if nSm2RestKt <> 0 then
      FieldByName('Sm2Rest').AsFloat := nSm2RestKt;
    if nSm2NachKt <> 0 then
      FieldByName('Sm2Nach').AsFloat := nSm2NachKt;
    if nSm2UdrgKt <> 0 then
      FieldByName('Sm2Udrg').AsFloat := nSm2UdrgKt;
    if nSm2VudRKt <> 0 then
      FieldByName('Sm2VudR').AsFloat := nSm1VudRKt;
    if nSm2VuplKt <> 0 then
      FieldByName('Sm2Vupl').AsFloat := nSm2VuplKt;
    Post;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'MkVdTots.cds');
  end;
  PageControl1.ActivePage := tsVed;
end;
*)
//------------------------------------------------------------------------------
procedure TFormMkVed.AddInCdsVed(nPp : integer;
                                 cTabN, cFamIO, cFam, cIma, cOtch, cKdObj,
                              cShObj, cKdKatP, cShKatP, cLicSch : string;
    nSm1OtpC, nSm1OtpB, nSm1Rest, nSm1VudR, nSm1Udrg, nSm1Vupl,
    nSm2OtpC, nSm2OtpB, nSm2Rest, nSm2VudR, nSm2Udrg, nSm2Vupl : double);
begin
  with cdsVed do begin
    Append;
    FieldByName('nPp').AsInteger := nPp;
    FieldByName('TabN').AsString := cTabN;
    FieldByName('FamIO').AsString := cFamIO;
    FieldByName('Fam').AsString := cFam;
    FieldByName('Ima').AsString := cIma;
    FieldByName('Otch').AsString := cOtch;
    FieldByName('KdObj').AsString := cKdObj;
    FieldByName('ShObj').AsString := cShObj;
    FieldByName('KdKatP').AsString := cKdKatP;
    FieldByName('ShKatP').AsString := cShKatP;
    FieldByName('LicSch').AsString := cLicSch;
    if nSm1OtpC <> 0 then
      FieldByName('Sm1OtpC').AsFloat := nSm1OtpC;
    if nSm1OtpB <> 0 then
      FieldByName('Sm1OtpB').AsFloat := nSm1OtpB;
    if nSm1Rest <> 0 then
      FieldByName('Sm1Rest').AsFloat := nSm1Rest;
    if (nSm1OtpC + nSm1OtpB + nSm1Rest) <> 0 then
      FieldByName('Sm1Nach').AsFloat := nSm1OtpC + nSm1OtpB + nSm1Rest;
    if nSm1VudR <> 0 then
      FieldByName('Sm1VudR').AsFloat := nSm1VudR;
    if nSm1Udrg <> 0 then
      FieldByName('Sm1Udrg').AsFloat := nSm1Udrg;
    if nSm1Vupl <> 0 then
      FieldByName('Sm1Vupl').AsFloat := nSm1Vupl;
    if nSm2OtpC <> 0 then
      FieldByName('Sm2OtpC').AsFloat := nSm2OtpC;
    if nSm2OtpB <> 0 then
      FieldByName('Sm2OtpB').AsFloat := nSm2OtpB;
    if nSm2Rest <> 0 then
      FieldByName('Sm2Rest').AsFloat := nSm2Rest;
    if (nSm2OtpC + nSm2OtpB + nSm2Rest) <> 0 then
      FieldByName('Sm2Nach').AsFloat := nSm2OtpC + nSm2OtpB + nSm2Rest;
    if nSm2VudR <> 0 then
      FieldByName('Sm2VudR').AsFloat := nSm2VudR;
    if nSm2Udrg <> 0 then
      FieldByName('Sm2Udrg').AsFloat := nSm2Udrg;
    if nSm2Vupl <> 0 then
      FieldByName('Sm2Vupl').AsFloat := nSm2Vupl;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.OpenQryNU;
begin
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    DataSource := dsrcSps;
    SQL.Add('Select * from Z_Nu where DtProc = :DtProc and TabN = :TabN and ' +
            ' KdSps = :KdSps order by ZaMesGod, VidN ');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.OpenQrySps(dDtProc : TDateTime;
                                   LbxObj, LbxKatP, LbxSpz : TListBox;
                                   nKdSps, nCaseSovm : integer);
var cMsg : string; i : integer;
begin
  bSpsReady := false;
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select distinct u.Fam, u.Ima, u.Otch, s.DtProc, s.KdSps, ' +
            ' s.TabN, s.Nch, s.KdObj, s.KdKatP, bls.LicSch from Z_SPS s ' +
            ' Left Outer Join z_Upi u on u.TabN = s.TabN ' +
            ' Left Outer Join z_BankiLS bls on bls.TabN = s.TabN ' +
            ' where (s.DtProc = :dDtProc) and (s.KdSps = :nKdSps) ');
    if LbxObj.Count > 0 then begin
      cMsg := ' and (s.KdObj in (';
      for i := 0 to LbxObj.Count - 1 do begin
        cMsg := cMsg + LbxObj.Items[i];
        if i < LbxObj.Count - 1 then
          cMsg := cMsg + ',';
      end;
      cMsg := cMsg + '))';
      SQL.Add(cMsg);
    end;
    if LbxKatP.Count > 0 then begin
      cMsg := ' and (s.KdKatP in (';
      for i := 0 to LbxKatP.Count - 1 do begin
        cMsg := cMsg + LbxKatP.Items[i];
        if i < LbxKatP.Count - 1 then
          cMsg := cMsg + ',';
      end;
      cMsg := cMsg + '))';
      SQL.Add(cMsg);
    end;
    SQL.Add(' order by s.KdObj, u.Fam, u.Ima, u.Otch');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ParamByName('nKdSps').AsInteger := nKdSps;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'OpQrySps.sql');
    Open;
  end;
  bSpsReady := true;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.qrySpsCalcFields(DataSet: TDataSet);
var cShKatP, cShObj, cDummy : string;
begin
  qrySpsFamIO.AsString := MyFamIO(qrySpsFam.AsString, qrySpsIma.AsString,
                                                      qrySpsOtch.AsString);
  cDummy := DmMain.KdObj2ShObj(qrySpsKdObj.AsInteger, cShObj);
  qrySpsShObj.AsString := cShObj;
  cDummy := DmMain.KdKatP2NmKatP(qrySpsKdKatP.AsInteger, cShKatP);
  qrySpsShKatP.AsString := cShKatP;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.qryNUCalcFields(DataSet: TDataSet);
var cShKatP, cShObj, cDummy : string;
begin
  qryNUShVidN.AsString := DmMain.VidN2ShVidN(qryNuVidN.AsString, cDummy);
  cDummy := DmMain.KdObj2ShObj(qryNuKdObj.AsInteger, cShObj);
  qryNuShObj.AsString := cShObj;
  cDummy := DmMain.KdKatP2NmKatP(qryNuKdKatP.AsInteger, cShKatP);
  qryNuShKatP.AsString := cShKatP;
  qryNuSpz.AsString := Form_Dm.KdSbu2SchBU(qryNuKdSpz.AsInteger);
  if qryNuSumma.AsFloat >= 0 then
    qryNuSmN.AsFloat := qryNuSumma.AsFloat
  else
    qryNuSmU.AsFloat := -qryNuSumma.AsFloat;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrSps.Canvas do begin
    if not (gdFocused in State) then begin
      if (not dbgrSps.DataSource.DataSet.FieldByName('LicSch').IsNull) and
          (dbgrSps.DataSource.DataSet.FieldByName('LicSch').AsString <> '') then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrSps.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : string4;
begin
  cVidN := dbgrNu.DataSource.DataSet.FieldByName('VidN').AsString;
  with dbgrNU.Canvas do begin
    if not (gdFocused in State) then begin
      if (dbgrNU.DataSource.DataSet.
                      FieldByName('ZaMesGod').AsDateTime > dDtProc) then begin
        if cVidN >= '95' then
          Font.Color := clGray
        else
          Font.Color := clOlive; end
      else if cVidN >= '95' then
        Font.Color := clGray
      else if (dbgrNU.DataSource.DataSet.
                           FieldByName('DtProc').AsDateTime < dDtProc) or
             (dbgrNU.DataSource.DataSet.FieldByName('PrPV').AsInteger = 5) then
        Font.Color := clGreen
      else if dbgrNU.DataSource.DataSet.FieldByName('PrPV').AsInteger = 1 then
        Font.Color := clMaroon
      else if dbgrNU.DataSource.DataSet.FieldByName('PrPV').AsInteger = 3 then
        Font.Color := clNavy
      else
        Font.Color := clWindowText;
      if cVidN = '85б' then
        Font.Color := clRed;
      if (Column.FieldName = 'VIDN') {or (Column.FieldName = 'ShVidN')} then
        Font.Color := clTeal
      else if (Column.FieldName = 'SUMMA') or
              (Column.FieldName = 'SmN') or
                 (Column.FieldName = 'SmU') then begin
        if (Column.Field.Value < 0) or (Column.FieldName = 'SmU') then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
      end;
      if dbgrNU.DataSource.DataSet.
                              FieldByName('KdSps').AsInteger <> nKdSps then
        Font.Style := []
      else
        Font.Style := [fsBold];
    end;
  end;
  dbgrNU.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
(*
var cUpper : string;
begin
  with dbgrNu.Canvas do begin
    if not (gdFocused in State) then begin
      cUpper := UpperCase(Column.FieldName);
      if (cUpper = 'SUMMA') and (Column.Field.AsFloat < 0) then
        Font.Color := clRed
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrNu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
*)
//------------------------------------------------------------------------------
procedure TFormMkVed.dbgrVedDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);

begin
  with dbgrVed.Canvas do begin
    if not (gdFocused in State) then begin
      if dbgrVed.DataSource.DataSet.FieldByName('nPp').AsInteger = 1 then
        Brush.Color := clSilver
      else begin
        if (not cdsVed.FieldByName('licSch').IsNull) and
                   (cdsVed.FieldByName('LicSch').AsString <> '') then
          Brush.Color := clInfoBk
        else
          Brush.Color := clCream;
      end;
{
      if (not dbgrVed.DataSource.DataSet.FieldByName('licSch').IsNull) and
          (dbgrVed.DataSource.DataSet.FieldByName('LicSch').AsString <> '') then
        Font.Color := clNavy
      else
        Font.Color := clWindowText;
}
    end;
  end;
  dbgrVed.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.dbgrTotsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrTots.Canvas do begin
    if not (gdFocused in State) then
      Brush.Color := clCream;
  end;
  dbgrTots.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.sBtnVvZdClick(Sender: TObject);
var nPrcOtpC, nPrcOtpB, nPrcRest, nPrcVupl, nKoef,
    nSm1OtpC, nSm1OtpB, nSm1Rest, nSm1VudR, nSm1Daem,
    nSm2OtpC, nSm2OtpB, nSm2Rest, nSm2VudR, nSm2Daem  : double;
    nSm1OtpCTt, nSm1OtpBTt, nSm1RestTt, nSm1VudRTt, nSm1DaemTt,
    nSm2OtpCTt, nSm2OtpBTt, nSm2RestTt, nSm2VudRTt, nSm2DaemTt  : double;  // банк + касса
    nSm1DaemBt, nSm2DaemBt  : double;  // В банк
    nSm1DaemKt, nSm2DaemKt  : double;  // В кассу
    nSvTabN : integer;
    nSmVuplDbg : double;  bIsOPZ : boolean;
begin
  Screen.Cursor := crSQLWait;
  cdsVedSm1Daem.OnSetText := nil;
  cdsVedSm2Daem.OnSetText := nil;
  if (n_CaseScheme = 1) {отпуск + зарплата} and
            GetPrcByGrp(n_PrcOtpC, n_PrcOtpB, n_PrcRest) {z_ZdVPrc} then begin
    nPrcOtpC := n_PrcOtpC / 100;
    nPrcOtpB := n_PrcOtpB / 100;
    nPrcRest := n_PrcRest / 100;
    nSm1OtpCTt := 0;
    nSm1OtpBTt := 0;
    nSm1RestTt := 0;
    nSm1DaemTt := 0;
    nSm1VudRTt := 0;
    nSm2OtpCTt := 0;
    nSm2OtpBTt := 0;
    nSm2RestTt := 0;
    nSm2VudRTt := 0;
    nSm2DaemTt := 0;
    nSm1DaemBt := 0;
    nSm2DaemBt := 0;
    nSm1DaemKt := 0;
    nSm2DaemKt := 0;
    with cdsVed do begin
      nSvTabN := FieldByName('TabN').AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        nSm1OtpC := 0;
        nSm1OtpB := 0;
        nSm1Rest := 0;
        nSm1VudR := 0;
        nSm2OtpC := 0;
        nSm2OtpB := 0;
        nSm2Rest := 0;
        nSm2VudR := 0;
        bIsOPZ := (FieldByName('Sm1OtpC').AsFloat <> 0) or
                  (FieldByName('Sm2OtpC').AsFloat <> 0) or
                  (FieldByName('Sm1OtpB').AsFloat <> 0) or
                  (FieldByName('Sm2OtpB').AsFloat <> 0); // Попал ли в схему ОПЗ
        if FieldByName('Sm1Vupl').AsFloat <> 0 then begin
          nKoef := FieldByName('Sm1Vupl').AsFloat / FieldByName('Sm1Nach').AsFloat;
          if FieldByName('Sm1OtpC').AsFloat <> 0 then begin
            nSm1OtpC := MyRound(FieldByName('Sm1OtpC').AsFloat *
                                                       nPrcOtpC * nKoef, 2);
            nSm1OtpCTt := nSm1OtpCTt + nSm1OtpC;

          end;
          if FieldByName('Sm1OtpB').AsFloat <> 0 then begin
            nSm1OtpB := MyRound(FieldByName('Sm1OtpB').AsFloat *
                                                       nPrcOtpB * nKoef, 2);
            nSm1OtpBTt := nSm1OtpBTt + nSm1OtpB;
          end;
          if FieldByName('Sm1Rest').AsFloat <> 0 then begin
            nSm1Rest := MyRound(FieldByName('Sm1Rest').AsFloat *
                                                       nPrcRest * nKoef, 2);
            nSm1RestTt := nSm1RestTt + nSm1Rest;
          end;
        end;
        if FieldByName('Sm2Vupl').AsFloat <> 0 then begin
          nKoef := FieldByName('Sm2Vupl').AsFloat / FieldByName('Sm2Nach').AsFloat;
          if FieldByName('Sm2OtpC').AsFloat <> 0 then begin
            nSm2OtpC := MyRound(FieldByName('Sm2OtpC').AsFloat *
                                                       nPrcOtpC * nKoef, 2);
            nSm2OtpCTt := nSm2OtpCTt + nSm2OtpC;
          end;
          if FieldByName('Sm2OtpB').AsFloat <> 0 then begin
            nSm2OtpB := MyRound(FieldByName('Sm2OtpB').AsFloat *
                                                       nPrcOtpB * nKoef, 2);
            nSm2OtpBTt := nSm2OtpBTt + nSm2OtpB;
          end;
          if FieldByName('Sm2Rest').AsFloat <> 0 then begin
            nSm2Rest := MyRound(FieldByName('Sm2Rest').AsFloat *
                                                       nPrcRest * nKoef, 2);
            nSm2RestTt := nSm2RestTt + nSm2Rest;
          end;
        end;
        nSm1Daem := MyRound(nSm1OtpC + nSm1OtpB + nSm1Rest, 2);
        nSm2Daem := MyRound(nSm2OtpC + nSm2OtpB + nSm2Rest, 2);


        nSmVuplDbg := FieldByName('Sm1Vupl').AsFloat;
        if nSm1Daem > nSmVuplDbg then
          nSm1Daem := nSmVuplDbg;

        nSmVuplDbg := FieldByName('Sm2Vupl').AsFloat;
        if nSm2Daem > nSmVuplDbg then
          nSm2Daem := nSmVuplDbg;


        nSm1DaemTt := nSm1DaemTt + nSm1Daem;
        nSm2DaemTt := nSm2DaemTt + nSm2Daem;
        if (not FieldByName('LicSch').IsNull) and
              (FieldByName('LicSch').AsString > '') then begin
          nSm1DaemBt := nSm1DaemBt + nSm1Daem;
          nSm2DaemBt := nSm2DaemBt + nSm2Daem; end
        else begin
          nSm1DaemKt := nSm1DaemKt + nSm1Daem;
          nSm2DaemKt := nSm2DaemKt + nSm2Daem;
        end;

        Edit;
        if nSm1Daem <> 0 then
          FieldByName('Sm1Daem').AsFloat := nSm1Daem
        else
          FieldByName('Sm1Daem').AsString := '';
        if nSm2Daem <> 0 then
          FieldByName('Sm2Daem').AsFloat := nSm2Daem
        else
          FieldByName('Sm2Daem').AsString := '';
        FieldByName('IsOPZ').AsBoolean := bIsOPZ;
        Post;
        Next;
      end;
      if bFlagDbg then
        SaveToFile(cDirTemp + 'MkVed02.cds');
      Locate('TabN', nSvTabN, []);
      EnableControls;
    end;
    with cdsTots do begin
      if Locate('NR', 1, []) then begin
        Edit;
        if nSm1DaemTt <> 0 then
          FieldByName('Sm1Daem').AsFloat := nSm1DaemTt
        else
          FieldByName('Sm1Daem').AsString := '';
        if nSm2DaemTt <> 0 then
          FieldByName('Sm2Daem').AsFloat := nSm2DaemTt
        else
          FieldByName('Sm2Daem').AsString := '';
        Post;
      end;
      if Locate('NR', 2, []) then begin
        Edit;
        if nSm1DaemBt <> 0 then
          FieldByName('Sm1Daem').AsFloat := nSm1DaemBt
        else
          FieldByName('Sm1Daem').AsString := '';
        if nSm2DaemBt <> 0 then
          FieldByName('Sm2Daem').AsFloat := nSm2DaemBt
        else
          FieldByName('Sm2Daem').AsString := '';
        Post;
      end;
      if Locate('NR', 3, []) then begin
        Edit;
        if nSm1DaemKt <> 0 then
          FieldByName('Sm1Daem').AsFloat := nSm1DaemKt
        else
          FieldByName('Sm1Daem').AsString := '';
        if nSm2DaemKt <> 0 then
          FieldByName('Sm2Daem').AsFloat := nSm2DaemKt
        else
          FieldByName('Sm2Daem').AsString := '';
        Post;
      end;
    end;
    sBtnSave.Enabled := true; end
  else if (n_CaseScheme = 2) and GetPrc(n_PrcVupl) {z_ZdVPrc} then begin
    nPrcVupl := n_PrcVupl / 100;
    nSm1DaemTt := 0;
    nSm2DaemTt := 0;
    nSm1DaemBt := 0;
    nSm2DaemBt := 0;
    nSm1DaemKt := 0;
    nSm2DaemKt := 0;
    with cdsVed do begin
      nSvTabN := FieldByName('TabN').AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        nSm1Daem := 0;
        nSm2Daem := 0;
        if FieldByName('Sm1Vupl').AsFloat <> 0 then
          nSm1Daem := MyRound(FieldByName('Sm1Vupl').AsFloat * nPrcVupl, 2);
        if FieldByName('Sm2Vupl').AsFloat <> 0 then
          nSm2Daem := MyRound(FieldByName('Sm2Vupl').AsFloat * nPrcVupl, 2);
        nSmVuplDbg := FieldByName('Sm1Vupl').AsFloat;
        if nSm1Daem > nSmVuplDbg then
          nSm1Daem := nSmVuplDbg;
        nSmVuplDbg := FieldByName('Sm2Vupl').AsFloat;
        if nSm2Daem > nSmVuplDbg then
          nSm2Daem := nSmVuplDbg;
        nSm1DaemTt := nSm1DaemTt + nSm1Daem;
        nSm2DaemTt := nSm2DaemTt + nSm2Daem;
        if (not FieldByName('LicSch').IsNull) and
              (FieldByName('LicSch').AsString > '') then begin
          nSm1DaemBt := nSm1DaemBt + nSm1Daem;
          nSm2DaemBt := nSm2DaemBt + nSm2Daem; end
        else begin
          nSm1DaemKt := nSm1DaemKt + nSm1Daem;
          nSm2DaemKt := nSm2DaemKt + nSm2Daem;
        end;
        Edit;
        if nSm1Daem <> 0 then
          FieldByName('Sm1Daem').AsFloat := nSm1Daem
        else
          FieldByName('Sm1Daem').AsString := '';
        if nSm2Daem <> 0 then
          FieldByName('Sm2Daem').AsFloat := nSm2Daem
        else
          FieldByName('Sm2Daem').AsString := '';
        Post;
        Next;
      end;
      if bFlagDbg then
        SaveToFile(cDirTemp + 'MkVed02.cds');
      Locate('TabN', nSvTabN, []);
      EnableControls;
    end;
    with cdsTots do begin
      if Locate('NR', 1, []) then begin
        Edit;
        if nSm1DaemTt <> 0 then
          FieldByName('Sm1Daem').AsFloat := nSm1DaemTt
        else
          FieldByName('Sm1Daem').AsString := '';
        if nSm2DaemTt <> 0 then
          FieldByName('Sm2Daem').AsFloat := nSm2DaemTt
        else
          FieldByName('Sm2Daem').AsString := '';
        Post;
      end;
      if Locate('NR', 2, []) then begin
        Edit;
        if nSm1DaemBt <> 0 then
          FieldByName('Sm1Daem').AsFloat := nSm1DaemBt
        else
          FieldByName('Sm1Daem').AsString := '';
        if nSm2DaemBt <> 0 then
          FieldByName('Sm2Daem').AsFloat := nSm2DaemBt
        else
          FieldByName('Sm2Daem').AsString := '';
        Post;
      end;
      if Locate('NR', 3, []) then begin
        Edit;
        if nSm1DaemKt <> 0 then
          FieldByName('Sm1Daem').AsFloat := nSm1DaemKt
        else
          FieldByName('Sm1Daem').AsString := '';
        if nSm2DaemKt <> 0 then
          FieldByName('Sm2Daem').AsFloat := nSm2DaemKt
        else
          FieldByName('Sm2Daem').AsString := '';
        Post;
      end;
    end;
    sBtnSave.Enabled := true;
    cdsVedSm1Daem.OnSetText := cdsVedSm1DaemSetText;
    cdsVedSm2Daem.OnSetText := cdsVedSm2DaemSetText;
  end;
  Screen.Cursor := crDefault;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.sBtnGoToClick(Sender: TObject);
var nTabN : integer;
begin
  nTabN := cdsVed.FieldByName('TabN').AsInteger;
  qrySps.Locate('TabN', nTabN, []);
  PageControl1.ActivePage := tsSps;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.sBtnGoTo1Click(Sender: TObject);
var nTabN : integer;
begin
  nTabN := qrySps.FieldByName('TabN').AsInteger;
  cdsVed.Locate('TabN', nTabN, []);
  PageControl1.ActivePage := tsVed;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.SpeedButton2Click(Sender: TObject);
begin
  ShowVedMsg01;  {z_VdMsg1}
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.sBtnSaveClick(Sender: TObject);
var nSvNR, nNewSpecNR, nCntPodklKss, nCntPodklBnk, nVedNr : integer;
begin
  sBtnVvZd.Enabled := false;
  sBtnSave.Enabled := false;
  nNewSpecNR := DmMain.NewSpec_NR; // В Z_VedNR для новой ведомости ввожу
  nVedNr := nNewSpecNR; // первую регистрационную запись с VedNr = nNewSpec_NR
  // а все производные от нее (печатающиеся) будут потом печататься и регистри-
  // роваться с тем же VedNr, но с PrtVedNr'ами производными от n_FirstNum.
  // Этот же VedNr записываю в Z_Otkl как NrVdPv.
  // Если будет удаляться ведомость, то вместе с ней по VedNr удалятся все
  // записи о печатающихся ведомостях и все записи в Z_Otkl

  {А не изменить ли в Z_VedNR поле VedNr на Spec_NR ????????? TYTYTYT}

  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Insert into Z_VedNr (DtProc, KdSps, TypeVed, VedNr, VedDate, ' +
            ' Notes) values (:dDtProc, :nKdSps, :cTypeVed, ' +
            ' :nVedNr, :dVedDate, :cNotes)');
    if (n_CaseScheme = 1) then
      ParamByName('cTypeVed').AsString := 'Vd_OPZ'
    else if n_CaseScheme = 2 then
      ParamByName('cTypeVed').AsString := 'Vd_ChV'
    else
      ParamByName('cTypeVed').AsString := 'Vd_Rest';
    ParamByName('dDtProc').AsDateTime  := d_DtProc;
    ParamByName('nKdSps').AsInteger    := n_KdSps;
    ParamByName('nVedNr').AsInteger    := nVedNr;
    ParamByName('dVedDate').AsDateTime := Date;
    ParamByName('cNotes').AsString := 'RegRec';
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qrySvOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, Pdn, KdSpz, Notes, PrPv, Spec_NR, ' +
            ' DtVdPv, NrVdPv, MyNotes) values (:nKdSps, :dDtProc, ' +
            ' :dZaMesGod, :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, ' +
            ' :nPdn, :nKdSpz, :cNotes, :nPrPv, :nSpec_NR, :dDtVdPv, ' +
            ' :nNrVdPv, :cMyNotes)');
    ParamByName('nKdSps').AsInteger := n_KdSps;
    ParamByName('nSpec_NR').AsInteger := nNewSpecNR;
    ParamByName('dDtProc').AsDateTime := d_DtProc;
    ParamByName('dZaMesGod').AsDateTime := d_DtProc;
    ParamByName('nPdn').AsInteger := 1;
    ParamByName('nPrPv').AsInteger := 1;
    ParamByName('dDtVdPv').AsDateTime := Date;
    ParamByName('nNrVdPv').AsInteger := nVedNr;
    ParamByName('cNotes').AsString := '';
  end;
  with qrySvNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Insert into Z_NU (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, Pdn, KdSpz, Notes, PrPv, Spec_NR, ' +
            ' MyNotes) values (:nKdSps, :dDtProc, ' +
            ' :dZaMesGod, :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, ' +
            ' :nPdn, :nKdSpz, :cNotes, :nPrPv, :nSpec_NR, ' +
            ' :cMyNotes)');
    ParamByName('nKdSps').AsInteger := n_KdSps;
    ParamByName('nSpec_NR').AsInteger := nNewSpecNR;
    ParamByName('dDtProc').AsDateTime := d_DtProc;
    ParamByName('dZaMesGod').AsDateTime := d_DtProc;
    ParamByName('nPdn').AsInteger := 1;
    ParamByName('nPrPv').AsInteger := 1;
    ParamByName('cNotes').AsString := '!!(БезПС)';
  end;
  nCntPodklKss := 0;
  nCntPodklBnk := 0;
  with cdsVed do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      qrySvOtkl.ParamByName('nTabN').AsInteger := FieldByName('TabN').AsInteger;
      qrySvNu.ParamByName('nTabN').AsInteger := FieldByName('TabN').AsInteger;
      if (n_CaseScheme = 1) then begin
        if FieldByName('IsOPZ').AsBoolean then
          qrySvOtkl.ParamByName('cMyNotes').AsString := 'Vd_OPZT'
        else
          qrySvOtkl.ParamByName('cMyNotes').AsString := 'Vd_OPZF'; end
      else if n_CaseScheme = 2 then
        qrySvOtkl.ParamByName('cMyNotes').AsString := 'Vd_ChV'
      else
        qrySvOtkl.ParamByName('cMyNotes').AsString := 'Vd_Rest';
      qrySvNu.ParamByName('cMyNotes').AsString :=
                               qrySvOtkl.ParamByName('cMyNotes').AsString;
      if FieldByName('Sm1Daem').AsFloat <> 0 then begin
        qrySvOtkl.ParamByName('nKdSpz').AsInteger := 1209; // 801б TYTYTYT
        qrySvOtkl.ParamByName('nKdObj').AsInteger := FieldByName('KdObj').AsInteger;
        qrySvOtkl.ParamByName('nKdKatP').AsInteger := FieldByName('KdKatP').AsInteger;
        qrySvOtkl.ParamByName('nSumma').AsFloat := -FieldByName('Sm1Daem').AsFloat;
        qrySvNu.ParamByName('nKdSpz').AsInteger := 1209; // 801б TYTYTYT
        qrySvNu.ParamByName('nKdObj').AsInteger := FieldByName('KdObj').AsInteger;
        qrySvNu.ParamByName('nKdKatP').AsInteger := FieldByName('KdKatP').AsInteger;
        qrySvNu.ParamByName('nSumma').AsFloat := -FieldByName('Sm1Daem').AsFloat;
        if (not FieldByName('LicSch').IsNull) and
                    (FieldByName('LicSch').AsString > '') then begin
          qrySvOtkl.ParamByName('cVidN').AsString := '7511';
          qrySvNu.ParamByName('cVidN').AsString := '7511';
          Inc(nCntPodklBnk); end
        else begin
          qrySvOtkl.ParamByName('cVidN').AsString := '7509';
          qrySvNu.ParamByName('cVidN').AsString := '7509';
          Inc(nCntPodklKss);
        end;
        qrySvOtkl.ExecSQL;
        qrySvNu.ExecSQL;
      end;
      if FieldByName('Sm2Daem').AsFloat <> 0 then begin
        qrySvOtkl.ParamByName('nKdSpz').AsInteger := 1331; // 811/а TYTYTYT
        qrySvOtkl.ParamByName('nKdObj').AsInteger := FieldByName('KdObj').AsInteger;
        qrySvOtkl.ParamByName('nKdKatP').AsInteger := FieldByName('KdKatP').AsInteger;
        qrySvOtkl.ParamByName('nSumma').AsFloat := -FieldByName('Sm2Daem').AsFloat;
        qrySvNu.ParamByName('nKdSpz').AsInteger := 1331; // 811/а TYTYTYT
        qrySvNu.ParamByName('nKdObj').AsInteger := FieldByName('KdObj').AsInteger;
        qrySvNu.ParamByName('nKdKatP').AsInteger := FieldByName('KdKatP').AsInteger;
        qrySvNu.ParamByName('nSumma').AsFloat := -FieldByName('Sm2Daem').AsFloat;
        if (not FieldByName('LicSch').IsNull) and
                    (FieldByName('LicSch').AsString > '') then begin
          qrySvOtkl.ParamByName('cVidN').AsString := '7511';
          qrySvNu.ParamByName('cVidN').AsString := '7511';
          Inc(nCntPodklBnk); end
        else begin
          qrySvOtkl.ParamByName('cVidN').AsString := '7509';
          qrySvNu.ParamByName('cVidN').AsString := '7509';
          Inc(nCntPodklKss);
        end;
        qrySvOtkl.ExecSQL;
        qrySvNu.ExecSQL;
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  ShowMessage('Подключено записей Касса: ' + IntToStr(nCntPodklKss) +
               ' Банк: ' + IntToStr(nCntPodklBnk));
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.popNuVidSummOneClick(Sender: TObject);
begin
  if not popNuVidSummOne.Checked then begin
    popNuVidSummOne.Checked := true;
    popNuVidSummTwo.Checked := false;
    SetDbgrNuColumns;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.popNuVidSummTwoClick(Sender: TObject);
begin
  if not popNuVidSummTwo.Checked then begin
    popNuVidSummTwo.Checked := true;
    popNuVidSummOne.Checked := false;
    SetDbgrNuColumns;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.SetDbgrNuColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrNU.Columns.Count-1 do begin
    with dbgrNU.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SUMMA') then
        Visible := popNuVidSummOne.Checked
      else if (cUpper = 'SMN') or (cUpper = 'SMU') then
        Visible := popNuVidSummTwo.Checked;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.qrySpsAfterScroll(DataSet: TDataSet);
begin
  if bSpsReady and qryNu.Active then
    ShowRLstTotals;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.ShowRLstTotals;
var nSmNach, nSmUdrg, nSmKVupl : double; cMsg : string;
begin
  nSmNach  := 0;
  nSmUdrg  := 0;
  with qryNu do begin
    DisableControls;
    First;
    while not Eof do begin
      if qryNuVidN.AsString <= '60' then
        nSmNach := nSmNach + qryNuSumma.AsFloat
      else
        nSmUdrg := nSmUdrg + qryNuSumma.AsFloat;
      Next;
    end;
    First;
    EnableControls;
  end;
  nSmKVupl := nSmNach + nSmUdrg;
  cMsg := 'Начисл.: ' + FloatToStrF(nSmNach, ffFixed, 18, 2) +
          '. Удерж.: ' + FloatToStrF(-nSmUdrg, ffFixed, 18, 2) +
          '. К выпл.: ' + FloatToStrF(nSmKVupl, ffFixed, 18, 2);
  LabelTotal.Caption := cMsg;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.cdsVedSm1DaemSetText(Sender: TField; const Text: String);
var cText, cMySm : string; nSmDaem : double;
begin
  cText := Text;
  if cText <> '' then begin
    nSmDaem := StrToFloat(cText);
    if nSmDaem > cdsVedSm1Vupl.AsFloat then begin
      cText := cdsVedSm1Vupl.AsString;
      ShowMessage('Можно дать не более ' + cText);
    end;
  end;
  Sender.AsString := cText;
end;
//------------------------------------------------------------------------------
procedure TFormMkVed.cdsVedSm2DaemSetText(Sender: TField; const Text: String);
var cText, cMySm : string; nSmDaem : double;
begin
  cText := Text;
  if cText <> '' then begin
    nSmDaem := StrToFloat(cText);
    if nSmDaem > cdsVedSm2Vupl.AsFloat then begin
      cText := cdsVedSm2Vupl.AsString;
      ShowMessage('Можно дать не более ' + cText);
    end;
  end;
  Sender.AsString := cText;
end;

procedure TFormMkVed.sBtnGoToMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Label2.Caption := 'Над кнопкой';
end;

end.
