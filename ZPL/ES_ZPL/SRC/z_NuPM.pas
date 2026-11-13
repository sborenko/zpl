unit z_NuPM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, ExtCtrls, Grids, DBGrids, DBTables, StdCtrls,
  Buttons, DBCtrls, ComCtrls, DBClient, Menus;

type
  string6 = string[6];
  TFormNuPM = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    qryMes: TQuery;
    dbgrMes: TDBGrid;
    Splitter1: TSplitter;
    qryOtkl: TQuery;
    dsrcOtkl: TDataSource;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    qryMesDTPROC: TDateTimeField;
    qryMesTABN: TIntegerField;
    DBNavigator: TDBNavigator;
    sBtnRLst: TSpeedButton;
    PageControl: TPageControl;
    tsByDtProc: TTabSheet;
    tsByZaMesGod: TTabSheet;
    dbgrOtkl: TDBGrid;
    Splitter2: TSplitter;
    dbgrNU: TDBGrid;
    dbgrOtklZaMG: TDBGrid;
    dbgrNuZaMG: TDBGrid;
    Splitter3: TSplitter;
    qryOtklZaMG: TQuery;
    dsrcOtklZaMG: TDataSource;
    qryNuZaMG: TQuery;
    dsrcNuZaMG: TDataSource;
    cdsMes: TClientDataSet;
    cdsMesTabN: TIntegerField;
    cdsMesTip: TStringField;
    cdsMesDtProc: TDateField;
    cdsMesMesGod: TStringField;
    qryMesTIP: TStringField;
    PanelTotsZaMG: TPanel;
    LabelTotsZaMG: TLabel;
    Panel2: TPanel;
    LabelTotalsNU: TLabel;
    sBtnZaMgShowSpecVids: TSpeedButton;
    sBtnShowSpecVids: TSpeedButton;
    pop: TPopupMenu;
    popFont: TMenuItem;
    qryTmp: TQuery;
    dsrcMes: TDataSource;
    qryNUVIDN: TStringField;
    qryNUSHVIDN: TStringField;
    qryNUTABN: TIntegerField;
    qryNUKDSPS: TSmallintField;
    qryNUPSCH: TStringField;
    qryNUSCHBU: TStringField;
    qryNUDTPROC: TDateTimeField;
    qryNUZAMESGOD: TDateTimeField;
    qryNUCHAS: TFloatField;
    qryNUSUMMA: TFloatField;
    qryNUVID_KDSPZ: TSmallintField;
    qryNUVID_SPZ: TStringField;
    qryNUVID_KDSCHDT: TSmallintField;
    qryNUVID_SCHDT: TStringField;
    qryNUVID_KDSCHKT: TSmallintField;
    qryNUVID_SCHKT: TStringField;
    qryNUVID_KEKV: TStringField;
    qryNUNR: TIntegerField;
    qryNUDT_BEG: TDateTimeField;
    qryNUDT_END: TDateTimeField;
    qryNUKDOBJ: TSmallintField;
    qryNUKDKATP: TSmallintField;
    qryNUKDSPZ: TSmallintField;
    qryNUPDN: TSmallintField;
    qryNUNOTES: TStringField;
    qryNUPRR: TSmallintField;
    qryNUPRPV: TSmallintField;
    qryNUKTO: TSmallintField;
    qryNUPRKR: TSmallintField;
    qryNUMYNOTES: TStringField;
    qryNUSPECPS: TIntegerField;
    qryNUSPEC_NR: TIntegerField;
    qryNUDTVDPV: TDateTimeField;
    qryNUNRVDPV: TIntegerField;
    qryNUSTORN: TStringField;
    qryNUZP13: TStringField;
    qryNUOTP: TStringField;
    qryNUBLN: TStringField;
    qryNUOTPUSKN: TStringField;
    qryNUBOLNIC: TStringField;
    qryNUSPRM: TStringField;
    qryNUCPRM: TStringField;
    qryNUDETI: TStringField;
    qryNUDETIM: TStringField;
    qryNUDETIK: TStringField;
    qryNUDETIG: TStringField;
    qryNUIND: TStringField;
    qryNUDHD: TStringField;
    qryNUOKLFND: TStringField;
    qryNUCBUDG: TStringField;
    qryNUSNDB: TStringField;
    qryNUSPDN: TStringField;
    qryNUSPRF: TStringField;
    qryNUSPENS: TStringField;
    qryNUSALIM: TStringField;
    qryNUCNDB: TStringField;
    qryNUSSOCSTRAH: TStringField;
    qryNUSBZR: TStringField;
    qryNUSP_PF: TStringField;
    qryNUSP_FSTVP: TStringField;
    qryNUSP_FSNV: TStringField;
    qryNUSP_FZ: TStringField;
    qryNUSOVM: TStringField;
    qryNUSPOV: TStringField;
    qryNuZaMGVIDN: TStringField;
    qryNuZaMGSHVIDN: TStringField;
    qryNuZaMGTABN: TIntegerField;
    qryNuZaMGKDSPS: TSmallintField;
    qryNuZaMGPSCH: TStringField;
    qryNuZaMGSCHBU: TStringField;
    qryNuZaMGDTPROC: TDateTimeField;
    qryNuZaMGZAMESGOD: TDateTimeField;
    qryNuZaMGCHAS: TFloatField;
    qryNuZaMGSUMMA: TFloatField;
    qryNuZaMGVID_KDSPZ: TSmallintField;
    qryNuZaMGVID_SPZ: TStringField;
    qryNuZaMGVID_KDSCHDT: TSmallintField;
    qryNuZaMGVID_SCHDT: TStringField;
    qryNuZaMGVID_KDSCHKT: TSmallintField;
    qryNuZaMGVID_SCHKT: TStringField;
    qryNuZaMGVID_KEKV: TStringField;
    qryNuZaMGNR: TIntegerField;
    qryNuZaMGDT_BEG: TDateTimeField;
    qryNuZaMGDT_END: TDateTimeField;
    qryNuZaMGKDOBJ: TSmallintField;
    qryNuZaMGKDKATP: TSmallintField;
    qryNuZaMGKDSPZ: TSmallintField;
    qryNuZaMGPDN: TSmallintField;
    qryNuZaMGNOTES: TStringField;
    qryNuZaMGPRR: TSmallintField;
    qryNuZaMGPRPV: TSmallintField;
    qryNuZaMGKTO: TSmallintField;
    qryNuZaMGPRKR: TSmallintField;
    qryNuZaMGMYNOTES: TStringField;
    qryNuZaMGSPECPS: TIntegerField;
    qryNuZaMGSPEC_NR: TIntegerField;
    qryNuZaMGDTVDPV: TDateTimeField;
    qryNuZaMGNRVDPV: TIntegerField;
    qryNuZaMGSTORN: TStringField;
    qryNuZaMGZP13: TStringField;
    qryNuZaMGOTP: TStringField;
    qryNuZaMGBLN: TStringField;
    qryNuZaMGOTPUSKN: TStringField;
    qryNuZaMGBOLNIC: TStringField;
    qryNuZaMGSPRM: TStringField;
    qryNuZaMGCPRM: TStringField;
    qryNuZaMGDETI: TStringField;
    qryNuZaMGDETIM: TStringField;
    qryNuZaMGDETIK: TStringField;
    qryNuZaMGDETIG: TStringField;
    qryNuZaMGIND: TStringField;
    qryNuZaMGDHD: TStringField;
    qryNuZaMGOKLFND: TStringField;
    qryNuZaMGCBUDG: TStringField;
    qryNuZaMGSNDB: TStringField;
    qryNuZaMGSPDN: TStringField;
    qryNuZaMGSPRF: TStringField;
    qryNuZaMGSPENS: TStringField;
    qryNuZaMGSALIM: TStringField;
    qryNuZaMGCNDB: TStringField;
    qryNuZaMGSSOCSTRAH: TStringField;
    qryNuZaMGSBZR: TStringField;
    qryNuZaMGSP_PF: TStringField;
    qryNuZaMGSP_FSTVP: TStringField;
    qryNuZaMGSP_FSNV: TStringField;
    qryNuZaMGSP_FZ: TStringField;
    qryNuZaMGSOVM: TStringField;
    qryNuZaMGSPOV: TStringField;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklSHVIDN: TStringField;
    qryOtklSTORN: TStringField;
    qryOtklOLDKDVIDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklSCHBU: TStringField;
    qryOtklPSCH: TStringField;
    qryOtklNOTES: TStringField;
    qryOtklPRR: TSmallintField;
    qryOtklPRPV: TSmallintField;
    qryOtklKTO: TSmallintField;
    qryOtklPRKR: TSmallintField;
    qryOtklSPEC_NR: TIntegerField;
    qryOtklDTVDPV: TDateTimeField;
    qryOtklNRVDPV: TIntegerField;
    qryOtklMYNOTES: TStringField;
    qryOtklSPECPS: TIntegerField;
    qryOtklPBNK: TSmallintField;
    qryOtklZaMGNR: TIntegerField;
    qryOtklZaMGKDSPS: TSmallintField;
    qryOtklZaMGDTPROC: TDateTimeField;
    qryOtklZaMGZAMESGOD: TDateTimeField;
    qryOtklZaMGTABN: TIntegerField;
    qryOtklZaMGVIDN: TStringField;
    qryOtklZaMGSHVIDN: TStringField;
    qryOtklZaMGSTORN: TStringField;
    qryOtklZaMGOLDKDVIDN: TSmallintField;
    qryOtklZaMGCHAS: TFloatField;
    qryOtklZaMGSUMMA: TFloatField;
    qryOtklZaMGKDOBJ: TSmallintField;
    qryOtklZaMGKDKATP: TSmallintField;
    qryOtklZaMGDT_BEG: TDateTimeField;
    qryOtklZaMGDT_END: TDateTimeField;
    qryOtklZaMGPDN: TSmallintField;
    qryOtklZaMGKDSPZ: TSmallintField;
    qryOtklZaMGSCHBU: TStringField;
    qryOtklZaMGPSCH: TStringField;
    qryOtklZaMGNOTES: TStringField;
    qryOtklZaMGPRR: TSmallintField;
    qryOtklZaMGPRPV: TSmallintField;
    qryOtklZaMGKTO: TSmallintField;
    qryOtklZaMGPRKR: TSmallintField;
    qryOtklZaMGSPEC_NR: TIntegerField;
    qryOtklZaMGDTVDPV: TDateTimeField;
    qryOtklZaMGNRVDPV: TIntegerField;
    qryOtklZaMGMYNOTES: TStringField;
    qryOtklZaMGSPECPS: TIntegerField;
    qryOtklZaMGPBNK: TSmallintField;
    sBtnSortByVidN: TSpeedButton;
    sBtnSortByZaMG: TSpeedButton;
    sBtnSortByVidN_2: TSpeedButton;
    sBtnSortByZaMG_2: TSpeedButton;
    qryNUOZN_PILG: TStringField;
    qryNUKDBNK: TSmallintField;
    qryNUSSRK: TStringField;
    qryNuZaMGOZN_PILG: TStringField;
    qryNuZaMGKDBNK: TSmallintField;
    qryNuZaMGSSRK: TStringField;
    PanelTts: TPanel;
    LabelCntSelRec: TLabel;
    LabelSmNach: TLabel;
    LabelSmUdrg: TLabel;
    LabelSmTts: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sBtnPatelTtsClose: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEnter(Sender: TObject);
    procedure DBGridExit(Sender: TObject);
    procedure PrintRaschList(Sender: TObject);
    procedure dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsMesCalcFields(DataSet: TDataSet);
    procedure dbgrNuZaMGDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FieldChasGetText(Sender: TField; var Text: String;
                                                          DisplayText: Boolean);
    procedure cdsMesAfterScroll(DataSet: TDataSet);
    procedure PageControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure PageControlChange(Sender: TObject);
    procedure sBtnZaMgShowSpecVidsClick(Sender: TObject);
    procedure sBtnShowSpecVidsClick(Sender: TObject);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrOtklZaMGDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popFontClick(Sender: TObject);
    procedure dbgrMesDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnSortByVidNClick(Sender: TObject);
    procedure sBtnSortByVidN_2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sBtnPatelTtsCloseClick(Sender: TObject);
  private
    { Private declarations }
    n_TabN, n_KdObj : integer;
    c_FamIO, c_IdNR : string;
    c_FontName : string;
    n_FontSize : word;
    b_FontBold, b_FontItalic : boolean;
    procedure OpenCdsMes(nTabN : integer);
    procedure OpenQryOtkl;
    procedure OpenQryNu;
    procedure OpenQryOtklZaMG;
    procedure OpenQryNuZaMG;
    procedure ShowNuTotals;
    procedure SetTabsFont;
    procedure ShwByZaMgTts;
    procedure ShwByDtProcTts;
  public
    { Public declarations }
  end;

procedure ShowNuPM(nTabN, nKdObj : integer; cFamIO, cIdNR : string);

const SECTION = 'z_NuPM';

var
  FormNuPM: TFormNuPM;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib, Z_CmnPrt, PrtRaschList, QryUtils;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowNuPM(nTabN, nKdObj : integer; cFamIO, cIdNR : string);
begin
  FormNuPM := TFormNuPM.Create(Application);
  with FormNuPM do begin
    n_TabN  := nTabN;
    n_KdObj := nKdObj;
    c_FamIO := cFamIO;
    c_IdNR  := cIdNR;
    Caption := 'Прошлые месяцы. (' + cFamIO + ',   Таб.н-р ' +
                                                 IntToStr(nTabN) + ')';
    OpenCdsMes(nTabN);
    OpenQryOtkl;
    OpenQryNu;
    ShowNuTotals;
    OpenQryOtklZaMG;
    OpenQryNuZaMG;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.OpenCdsMes(nTabN : integer);
begin
  with qryMes do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Select distinct "DTPROC" as TIP, TabN, dtProc as DTPROC ' +
            ' from z_NU where TabN = :nTabN');
    SQL.Add('UNION Select distinct "DTZAMG" as TIP, TabN, ZaMesGod as DTPROC ' +
            ' from z_NU where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
  with cdsMes do begin
    if Active then Close;
    CreateDataSet;
    Open;
    IndexName := 'OnDtProc';
  end;
  with qryMes do begin
    First;
    while not Eof do begin
      if not cdsMes.Locate('DtProc', FieldByName('DtProc').AsDateTime, []) then
        cdsMes.AppendRecord([FieldByName('TabN').AsInteger,
                              FieldByName('TIP').AsString,
                               FieldByName('DtProc').AsDateTime]);
      Next;
    end;
    Close;
  end;
  if bFlagDbg then
    cdsMes.SaveToFile(cDirTemp + 'cdsMes.cds');
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.OpenQryOtkl;
begin
  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcMes;
    SQL.Add('Select * from ViOtkl where (DtProc = :DtProc) and ' +
            ' (TabN = :TabN) order by KdSps, ZaMesGod, VidN');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.OpenQryOtklZaMG;
begin
  with qryOtklZaMG do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcMes;
    SQL.Add('Select * from ViOtkl where (ZaMesGod = :DtProc) and ' +
            ' (TabN = :TabN) order by KdSps, DtProc, VidN');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.OpenQryNu;
begin
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcMes;
    SQL.Add('Select * from ViNuMain where (DtProc = :DtProc) and ' +
                                                  ' (TabN = :TabN) ');
    if not sBtnShowSpecVids.Down then
      SQL.Add(' and (VidN < "8000") ');
    if sBtnSortByZaMG.Down then
      SQL.Add(' order by ZaMesGod, VidN, KdSps ')
    else
      SQL.Add(' order by VidN, ZaMesGod, KdSps ');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.OpenQryNuZaMG;
begin
  with qryNuZaMG do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcMes;
    SQL.Add('Select * from ViNuMain where (ZaMesGod = :DtProc) and ' +
                                                    ' (TabN = :TabN)');
    if not sBtnShowSpecVids.Down then
      SQL.Add(' and (VidN < "8000") ');
    if sBtnSortByZaMG_2.Down then
      SQL.Add(' order by DtProc, VidN, KdSps ')
    else
      SQL.Add(' order by VidN, ZaMesGod, DtProc, KdSps ');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.FormCreate(Sender: TObject);
var nTabS : Smallint;
begin
  LabelTotalsNu.Caption := '';
  LabelTotsZaMG.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 675);
    c_FontName := ReadString(SECTION, 'cFN', 'Arial');
    n_FontSize := ReadInteger(SECTION, 'cFS', 10);
    b_FontBold := ReadBool(SECTION, 'bFB', false);
    b_FontItalic := ReadBool(SECTION, 'bFI', false);
    dbgrMes.Width := ReadInteger(SECTION, 'GrMesW', 150);
    dbgrOtkl.Height := ReadInteger(SECTION, 'GrOtklH', 165);
    if dbgrOtkl.Height < 5 then
      dbgrOtkl.Height := 5;

    dbgrOtklZaMG.Height := ReadInteger(SECTION, 'GrOtkl2H', 165);
    sBtnShowSpecVids.Down := ReadBool(SECTION, 'bShwSpVids', true);
    sBtnZaMgShowSpecVids.Down := sBtnShowSpecVids.Down;
    sBtnSortByVidN.Down := ReadBool(SECTION, 'bNuByVid', false);
    sBtnSortByZaMG.Down := not sBtnSortByVidN.Down;
    sBtnSortByVidN_2.Down := ReadBool(SECTION, 'bNuZaMGByVid', false);
    sBtnSortByZaMG_2.Down := not sBtnSortByVidN_2.Down;
    nTabS := ReadInteger(SECTION, 'nTabS', 1);
    Free;
  end;
  SetTabsFont;
  if FileExists(cDirVids + 'NuPm001.vid') then
    dbgrMes.Columns.LoadFromFile(cDirVids + 'NuPm001.vid');
  if FileExists(cDirVids + 'NuPm_002.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'NuPm_002.vid');
  if FileExists(cDirVids + 'NuPm_003.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'NuPm_003.vid');
  if FileExists(cDirVids + 'NuPm_004.vid') then
    dbgrOtklZaMG.Columns.LoadFromFile(cDirVids + 'NuPm_004.vid');
  if FileExists(cDirVids + 'NuPm_006.vid') then
    dbgrNuZaMG.Columns.LoadFromFile(cDirVids + 'NuPm_006.vid');
  if nTabS = 1 then
    PageControl.ActivePage := tsByDtProc
  else
    PageControl.ActivePage := tsByZaMesGod;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrMes.Columns.SaveToFile(cDirVids + 'NuPm001.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'NuPm_002.vid');
  dbgrNu.Columns.SaveToFile(cDirVids + 'NuPm_003.vid');
  dbgrOtklZaMG.Columns.SaveToFile(cDirVids + 'NuPm_004.vid');
  dbgrNuZaMG.Columns.SaveToFile(cDirVids + 'NuPm_006.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'GrMesW', dbgrMes.Width);
    WriteInteger(SECTION, 'GrOtklH', dbgrOtkl.Height);
    WriteInteger(SECTION, 'GrOtkl2H', dbgrOtklZaMG.Height);
    WriteString(SECTION, 'cFN', c_FontName);
    WriteInteger(SECTION, 'cFS', n_FontSize);
    WriteBool(SECTION, 'bFB', b_FontBold);
    WriteBool(SECTION, 'bFI', b_FontItalic);
    WriteBool(SECTION, 'bShwSpVids', sBtnShowSpecVids.Down);
    if PageControl.ActivePage = tsByDtProc then
      WriteInteger(SECTION, 'nTabS', 1)
    else
      WriteInteger(SECTION, 'nTabS', 2);
    WriteBool(SECTION, 'bNuByVid', sBtnSortByVidN.Down);
    WriteBool(SECTION, 'bNuZaMGByVid', sBtnSortByVidN_2.Down);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.DBGridEnter(Sender: TObject);
begin
  DBNavigator.DataSource := (Sender as TDBGrid).DataSource;
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.DBGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TFormNuPM.PrintRaschList(Sender: TObject);
begin
  if dbgrNU.DataSource.DataSet.RecordCount = 0 then
    MessageDlg('Нет начислений у текущего сотрудника', mtInformation, [mbOk], 0)
  else
    CalcList.PrtEmplExcel(cdsMesDtProc.AsDateTime, n_TabN, c_FamIO);
end;

//------------------------------------------------------------------------------
procedure TFormNuPM.dbgrMesDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrMes.Canvas do begin
//    if not (gdFocused in State) then begin
      if Trim(cdsMesTip.AsString) = 'DTZAMG' then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
//    end;
  end;
  dbgrMes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrOtkl.Canvas do begin
    if not (gdFocused in State) then begin
      if (Column.FieldName = 'SUMMA') then begin
        if (Column.Field.Value < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
      end;
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.dbgrOtklZaMGDrawColumnCell(Sender: TObject;
                     const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                        State: TGridDrawState);
begin
  with dbgrOtklZaMG.Canvas do begin
    if not (gdFocused in State) then begin
      if (Column.FieldName = 'SUMMA') then begin
        if (Column.Field.Value < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
      end;
    end;
  end;
  dbgrOtklZaMG.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : string4;
begin
  cVidN := dbgrNU.DataSource.DataSet.FieldByName('VidN').AsString;
  with dbgrNU.Canvas do begin
    if not (gdFocused in State) then begin
      {
      if (qryNuZAMESGOD.AsDateTime < cdsMesDTPROC.AsDateTime) then
        Brush.Color := clInfoBk
      else if (qryNuZAMESGOD.AsDateTime > cdsMesDTPROC.AsDateTime) then
        Brush.Color := clCream
      else
        Brush.Color := clWindow;
      }
      if (Column.FieldName = 'VIDN') then
        Font.Color := clTeal
      else if (Column.FieldName = 'OLDKDVIDN') then
        Font.Color := clInactiveCaption
      else if (Column.FieldName = 'SUMMA') or
              (Column.FieldName = 'SmN') or
                 (Column.FieldName = 'SmU') then begin
        if (Column.Field.Value < 0) or (Column.FieldName = 'SmU') then
          Font.Color := clRed
        else
          Font.Color := clWindowText; end
      else begin
        if cVidN >= '8600' then
          Font.Color := clGray
        else if (cVidN >= '7500') and (cVidN < '7600') then
          Font.Color := clBlue
        else if cVidN = '2724' then    // долг за работником
          Font.Color := clRed
        else
          Font.Color := clWindowText;
      end;
    end;
  end;
  dbgrNU.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.dbgrNuZaMGDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : string4;
begin

  cVidN := dbgrNuZaMG.DataSource.DataSet.FieldByName('VidN').AsString;
  with dbgrNuZaMG.Canvas do begin
    if not (gdFocused in State) then begin
      {
      if (qryNuZaMG.FieldByName('DtProc').AsDateTime <
                                          cdsMesDTPROC.AsDateTime) then
        Brush.Color := clInfoBk
      else if (qryNuZaMG.FieldByName('DtProc').AsDateTime >
                                          cdsMesDTPROC.AsDateTime) then
        Brush.Color := clCream
      else
        Brush.Color := clWindow;
      }
      if (Column.FieldName = 'VIDN') then
        Font.Color := clTeal
      else if (Column.FieldName = 'OLDKDVIDN') then
        Font.Color := clInactiveCaption
      else if (Column.FieldName = 'SUMMA') or
               (Column.FieldName = 'SmN') or
                 (Column.FieldName = 'SmU') then begin
        if (Column.Field.Value < 0) or (Column.FieldName = 'SmU') then
          Font.Color := clRed
        else
          Font.Color := clWindowText; end
      else begin
        if cVidN >= '8600' then
          Font.Color := clGray
        else if (cVidN >= '7500') and (cVidN < '7600') then
          Font.Color := clBlue
        else if cVidN = '2724' then    // долг за работником
          Font.Color := clRed
        else
          Font.Color := clWindowText;
      end;
    end;
  end;
  dbgrNuZaMG.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;
//------------------------------------------------------------------------------
procedure TFormNuPM.cdsMesCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(cdsMesDtProc.AsDateTime, nY, nM, nD);
  cdsMesMesGod.AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.FieldChasGetText(Sender: TField; var Text: String;
                                                         DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).isNull or
                            ((Sender as TField).AsFloat = 0)) then
    Text := ''
  else
    Text := (Sender as TField).AsString;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.cdsMesAfterScroll(DataSet: TDataSet);
begin
//  if qryNu.Active then
    ShowNuTotals;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.ShowNuTotals;
var nSmNach, nSmVupl, nSmUdrg, nSmDolga : double; cMsg : ShortString;
begin
(*   так было до 13-10-2006
  LabelTotalsNu.Caption := '';
  if qryNU.Active then with qryNu do begin
    nSmNach := 0;
    nSmUdrg := 0;
    nSmVupl := 0;
    nSmDolga := 0;
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('VidN').AsString < '7600' then begin
        if (FieldByName('VidN').AsString = '2724') then
          nSmDolga := nSmDolga + FieldByName('Summa').AsFloat
        else if (FieldByName('VidN').AsString < '6000') then
          nSmNach := nSmNach + FieldByName('Summa').AsFloat
        else if (FieldByName('VidN').AsString < '7500') then
          nSmUdrg := nSmUdrg + FieldByName('Summa').AsFloat
        else
          nSmVupl := nSmVupl + FieldByName('Summa').AsFloat;
      end;
      Next;
    end;
    EnableControls;
    if (nSmNach <> 0) or (nSmVupl <> 0) or (nSmUdrg <> 0) or
                                                  (nSmDolga <> 0) then begin
      cMsg := 'Начисл.: ' + FloatToStrF(nSmNach, ffFixed, 18, 2) +
              '  Удерж.: ' + FloatToStrF(-nSmUdrg, ffFixed, 18, 2);
      if nSmVupl <> 0 then
        cMsg := cMsg + '  Выпл.: ' + FloatToStrF(-nSmVupl, ffFixed, 18, 2);
      if nSmDolga <> 0 then
        cMsg := cMsg + '  ВДолгТМ: ' + FloatToStrF(nSmDolga, ffFixed, 18, 2);
      cMsg := cMsg + '  К выпл.: ' +
                        FloatToStrF(nSmNach + nSmUdrg + nSmVupl + nSmDolga,
                                                           ffFixed, 18, 2);
      LabelTotalsNu.Caption := cMsg;
    end;
  end;
  LabelTotsZaMG.Caption := '';
  if qryNUZaMG.Active then with qryNuZaMG do begin
    nSmNach := 0;
    nSmUdrg := 0;
    nSmVupl := 0;
    nSmDolga := 0;
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('VidN').AsString < '7600' then begin
        if (FieldByName('VidN').AsString = '2724') then
          nSmDolga := nSmDolga + FieldByName('Summa').AsFloat
        else if (FieldByName('VidN').AsString < '6000') then
          nSmNach := nSmNach + FieldByName('Summa').AsFloat
        else if (FieldByName('VidN').AsString < '7500') then
          nSmUdrg := nSmUdrg + FieldByName('Summa').AsFloat
        else
          nSmVupl := nSmVupl + FieldByName('Summa').AsFloat;
      end;
      Next;
    end;
    EnableControls;
    if (nSmNach <> 0) or (nSmVupl <> 0) or (nSmUdrg <> 0) or
                                                  (nSmDolga <> 0) then begin
      cMsg := 'Начисления: ' + FloatToStrF(nSmNach, ffFixed, 18, 2) +
              '  Удержания: ' + FloatToStrF(-nSmUdrg, ffFixed, 18, 2) +
              '  Выплаты: ' + FloatToStrF(-nSmVupl, ffFixed, 18, 2);
      if nSmDolga <> 0 then
        cMsg := cMsg + '  ВДолгТМ: ' + FloatToStrF(nSmDolga, ffFixed, 18, 2);
      cMsg := cMsg + '  К выплате: ' +
                        FloatToStrF(nSmNach + nSmUdrg + nSmVupl + nSmDolga,
                                                           ffFixed, 18, 2);
      LabelTotsZaMG.Caption := cMsg;
    end;
  end;
*)
//   так стало после 13-10-2006
  LabelTotalsNu.Caption := '';
  if qryNU.Active then with qryNu do begin
    nSmNach := 0;
    nSmUdrg := 0;
    nSmVupl := 0;
    nSmDolga := 0;
    DisableControls;
    First;
    while not Eof do begin
      if FieldByName('VidN').AsString < '7600' then begin
        if FieldByName('Summa').AsFloat > 0 then
          nSmNach := nSmNach + FieldByName('Summa').AsFloat
        else if (FieldByName('Summa').AsFloat < 0) then
          nSmUdrg := nSmUdrg - FieldByName('Summa').AsFloat;
        if (FieldByName('VidN').AsString = '2724') then
          nSmDolga := nSmDolga + FieldByName('Summa').AsFloat;
      end;
      Next;
    end;
    First;
    EnableControls;
    if (nSmNach <> 0) or (nSmVupl <> 0) or (nSmUdrg <> 0) or
                                                  (nSmDolga <> 0) then begin
      cMsg := 'Начисл.: ' + FloatToStrF(nSmNach, ffFixed, 18, 2) +
              '  Удерж.: ' + FloatToStrF(nSmUdrg, ffFixed, 18, 2);
      if nSmDolga <> 0 then
        cMsg := cMsg + ' (в т.ч. в долг ' +
                FloatToStrF(nSmDolga, ffFixed, 18, 2) + ')';
      cMsg := cMsg + '  К выпл.: ' +
                        FloatToStrF(nSmNach - nSmUdrg, ffFixed, 18, 2);
      LabelTotalsNu.Caption := cMsg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.PageControlChanging(Sender: TObject;
                                                    var AllowChange: Boolean);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePage = tsByDtProc then
    dbgrMes.Color := clMoneyGreen
  else
    dbgrMes.Color := clBtnFace;
  sBtnRLst.Enabled := (PageControl.ActivePage = tsByDtProc);
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.sBtnZaMgShowSpecVidsClick(Sender: TObject);
begin
  sBtnShowSpecVids.Down := sBtnZaMgShowSpecVids.Down;
  OpenQryNu;
  OpenQryNuZaMG;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.sBtnShowSpecVidsClick(Sender: TObject);
begin
  sBtnZaMgShowSpecVids.Down := sBtnShowSpecVids.Down;
  OpenQryNu;
  OpenQryNuZaMG;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.sBtnSortByVidNClick(Sender: TObject);
begin
  OpenQryNu;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.sBtnSortByVidN_2Click(Sender: TObject);
begin
  OpenQryNuZaMG;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.popFontClick(Sender: TObject);
begin
  FormZpMain.FontDialog1.Font := dbgrMes.Font;
  if FormZpMain.FontDialog1.Execute then begin
    c_FontName := FormZpMain.FontDialog1.Font.Name;
    n_FontSize := FormZpMain.FontDialog1.Font.Size;
    b_FontItalic := (fsItalic in FormZpMain.FontDialog1.Font.Style);
    b_FontBold := (fsBold in FormZpMain.FontDialog1.Font.Style);
    SetTabsFont;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.SetTabsFont;
var mFontStyle : TFontStyles;
begin
  if b_FontItalic and b_FontBold then
    mFontStyle := [fsBold, fsItalic]
  else if b_FontBold then
    mFontStyle := [fsBold]
  else if b_FontItalic then
    mFontStyle := [fsItalic]
  else
    mFontStyle := [];
  dbgrMes.Font.Name      := c_FontName;
  dbgrOtkl.Font.Name     := c_FontName;
  dbgrOtklZaMG.Font.Name := c_FontName;
  dbgrNu.Font.Name       := c_FontName;
  dbgrNuZaMG.Font.Name   := c_FontName;

  dbgrMes.TitleFont.Name      := c_FontName;
  dbgrOtkl.TitleFont.Name     := c_FontName;
  dbgrOtklZaMG.TitleFont.Name := c_FontName;
  dbgrNU.TitleFont.Name       := c_FontName;
  dbgrNuZaMG.TitleFont.Name   := c_FontName;

  dbgrMes.Font.Size      := n_FontSize;
  dbgrOtkl.Font.Size     := n_FontSize;
  dbgrOtklZaMG.Font.Size := n_FontSize;
  dbgrNU.Font.Size       := n_FontSize;
  dbgrNuZaMG.Font.Size   := n_FontSize;

  dbgrMes.TitleFont.Size      := n_FontSize;
  dbgrOtkl.TitleFont.Size     := n_FontSize;
  dbgrOtklZaMG.TitleFont.Size := n_FontSize;
  dbgrNU.TitleFont.Size       := n_FontSize;
  dbgrNuZaMG.TitleFont.Size   := n_FontSize;

  dbgrMes.Font.Style      := mFontStyle;
  dbgrOtkl.Font.Style     := mFontStyle;
  dbgrOtklZaMG.Font.Style := mFontStyle;
  dbgrNU.Font.Style       := mFontStyle;
  dbgrNuZaMG.Font.Style   := mFontStyle;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then begin
    if PanelTts.Visible then
      PanelTts.Visible := false;
    if PageControl.ActivePage = tsByZaMesGod then
      ShwByZaMgTts
    else
      ShwByDtProcTts;
  end;
//    PanelSmSelRshDblClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.ShwByDtProcTts;
var i, nCntSelRec : SmallInt; nSmNach, nSmUdrg, nSmSelRec : double;
begin
  nCntSelRec := 0;
  nSmNach    := 0;
  nSmUdrg    := 0;
  nSmSelRec  := 0;
  if dbgrNu.SelectedRows.Count > 1 then begin
    with qryNu do begin
      for i := 0 to dbgrNu.SelectedRows.Count-1 do begin
        GotoBookmark(Pointer(dbgrNu.SelectedRows.Items[i]));
        Inc(nCntSelRec);
        if qryNuSumma.AsFloat > 0 then
          nSmNach := nSmNach + qryNuSumma.AsFloat
        else
          nSmUdrg := nSmUdrg + qryNuSumma.AsFloat;
        nSmSelRec := nSmSelRec + qryNuSumma.AsFloat;
      end;
    end;
    LabelCntSelRec.Caption := IntToStr(nCntSelRec);
    LabelSmNach.Caption := FloatToStrF(nSmNach, ffNumber, 18, 2);
    LabelSmUdrg.Caption := FloatToStrF(nSmUdrg, ffNumber, 18, 2);
    LabelSmTts.Caption  := FloatToStrF(nSmSelRec, ffNumber, 18, 2);
    if MyRound(nSmUdrg, 2) < 0 then
      LabelSmUdrg.Font.Color := clRed
    else
      LabelSmUdrg.Font.Color := clWindowText;
    if MyRound(nSmSelRec, 2) < 0 then
      LabelSmTts.Font.Color := clRed
    else
      LabelSmTts.Font.Color := clWindowText;
    PanelTts.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.ShwByZaMgTts;
var i, nCntSelRec : SmallInt; nSmNach, nSmUdrg, nSmSelRec : double;
begin
  nCntSelRec := 0;
  nSmNach    := 0;
  nSmUdrg    := 0;
  nSmSelRec  := 0;
  if dbgrNuZaMG.SelectedRows.Count > 1 then begin
    with qryNuZaMG do begin
      for i := 0 to dbgrNuZaMG.SelectedRows.Count-1 do begin
        GotoBookmark(Pointer(dbgrNuZaMG.SelectedRows.Items[i]));
        Inc(nCntSelRec);
        if qryNuZaMGSumma.AsFloat > 0 then
          nSmNach := nSmNach + qryNuZaMGSumma.AsFloat
        else
          nSmUdrg := nSmUdrg + qryNuZaMGSumma.AsFloat;
        nSmSelRec := nSmSelRec + qryNuZaMGSumma.AsFloat;
      end;
    end;
    LabelCntSelRec.Caption := IntToStr(nCntSelRec);
    LabelSmNach.Caption := FloatToStrF(nSmNach, ffNumber, 18, 2);
    LabelSmUdrg.Caption := FloatToStrF(nSmUdrg, ffNumber, 18, 2);
    LabelSmTts.Caption  := FloatToStrF(nSmSelRec, ffNumber, 18, 2);
    if MyRound(nSmUdrg, 2) < 0 then
      LabelSmUdrg.Font.Color := clRed
    else
      LabelSmUdrg.Font.Color := clWindowText;
    if MyRound(nSmSelRec, 2) < 0 then
      LabelSmTts.Font.Color := clRed
    else
      LabelSmTts.Font.Color := clWindowText;
    PanelTts.Visible := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNuPM.sBtnPatelTtsCloseClick(Sender: TObject);
begin
  PanelTts.Visible := false;
end;

end.

