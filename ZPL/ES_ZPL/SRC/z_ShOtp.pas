unit Z_ShOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBTables, IniFiles,
  Mask, DBCtrls, Menus;

type
  TFormShowOtp = class(TForm)
    qryVOtp: TQuery;
    dsrcVOtp: TDataSource;
    Panel1: TPanel;
    sBtnCurMes: TSpeedButton;
    bBtnClose: TBitBtn;
    qryROtp: TQuery;
    dsrcROtp: TDataSource;
    qryVOtpNR: TIntegerField;
    qryVOtpDTPROC: TDateTimeField;
    qryVOtpTABN: TIntegerField;
    qryVOtpALGRASCH: TSmallintField;
    qryVOtpRK: TStringField;
    qryVOtpNRPRIK: TStringField;
    qryVOtpDTPRIK: TDateTimeField;
    qryVOtpDTBEG: TDateTimeField;
    qryVOtpCNTDAYS: TSmallintField;
    qryVOtpDTEND: TDateTimeField;
    qryVOtpCNTCHAS: TFloatField;
    qryVOtpPROCOPL: TFloatField;
    qryVOtpKDOBJ: TSmallintField;
    qryVOtpKDKATP: TSmallintField;
    qryVOtpNOTES: TStringField;
    qryVOtpSMSRDN: TFloatField;
    qryVOtpSPEC_NR: TIntegerField;
    qryVOtpSMOTP: TFloatField;
    qryROtpNR: TIntegerField;
    qryROtpSPEC_NR: TIntegerField;
    qryROtpZAMESGOD: TDateTimeField;
    qryROtpSMZARABOTKA: TFloatField;
    qryROtpKOEFZP: TFloatField;
    qryROtpCNTDAYS: TSmallintField;
    PanelLeft: TPanel;
    dbgrVOtp: TDBGrid;
    PanelRight: TPanel;
    dbgrROtp: TDBGrid;
    Splitter1: TSplitter;
    qryVOtpFamIO: TStringField;
    qryOtkl: TQuery;
    dsrcOtkl: TDataSource;
    dbgrOtkl: TDBGrid;
    qryOtklNR: TIntegerField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklNOTES: TStringField;
    qryOtklPRR: TSmallintField;
    qryOtklPRPV: TSmallintField;
    qryOtklKTO: TSmallintField;
    qryOtklPRKR: TSmallintField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklSPEC_NR: TIntegerField;
    popVOtp: TPopupMenu;
    popVOtpEdt: TMenuItem;
    popVOtpAdd: TMenuItem;
    popVOtpDel: TMenuItem;
    popVOtpHead: TMenuItem;
    qryVOtpKDSPS: TSmallintField;
    qryVOtpVIDN: TStringField;
    qryVOtpKDSPZ: TSmallintField;
    qryROtpKDSPS: TSmallintField;
    qryROtpSMOKLADA: TFloatField;
    qryROtpSMDSREDN: TFloatField;
    qryOtklKDSPS: TSmallintField;
    qryOtklVIDN: TStringField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklShObj: TStringField;
    qryOtklShKatP: TStringField;
    qryOtklSpz: TStringField;
    sBtnAllMes: TSpeedButton;
    qryVOtpShVidN: TStringField;
    Splitter2: TSplitter;
    N1: TMenuItem;
    popSort: TMenuItem;
    popSortTabNMes: TMenuItem;
    popSortMesTabN: TMenuItem;
    qryTmp: TQuery;
    qryROtpSmZpKoef: TFloatField;
    PanelRTop: TPanel;
    PanelKart: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LabelAlgRasch: TLabel;
    LabelRK: TLabel;
    DBText1: TDBText;
    dbeAlgRasch: TDBEdit;
    dbeRK: TDBEdit;
    dbeNrPrik: TDBEdit;
    dbeDtPrik: TDBEdit;
    dbeDtBeg: TDBEdit;
    dbeCntDays: TDBEdit;
    dbeDtEnd: TDBEdit;
    dbeVidN: TDBEdit;
    dbeProcOpl: TDBEdit;
    dbeNotes: TDBEdit;
    dbeShVidN: TDBEdit;
    Label1: TLabel;
    dbeSmSrdn: TDBEdit;
    Label2: TLabel;
    dbeSmOtp: TDBEdit;
    dbtSpecNR: TDBText;
    popFilter: TMenuItem;
    popFilterByTabN: TMenuItem;
    popFilterOff: TMenuItem;
    LabelFilter: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryVOtpCalcFields(DataSet: TDataSet);
    procedure popVOtpEdtClick(Sender: TObject);
    procedure dsrcVOtpDataChange(Sender: TObject; Field: TField);
    procedure popVOtpAddClick(Sender: TObject);
    procedure popVOtpPopup(Sender: TObject);
    procedure PanelLeftResize(Sender: TObject);
    procedure sBtnAllMesClick(Sender: TObject);
    procedure sBtnCurMesClick(Sender: TObject);
    procedure popSortTabNMesClick(Sender: TObject);
    procedure popSortMesTabNClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure popVOtpDelClick(Sender: TObject);
    procedure qryROtpCalcFields(DataSet: TDataSet);
    procedure dbgrVOtpDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popFilterByTabNClick(Sender: TObject);
    procedure popFilterOffClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    nSvTabN : integer;
    b_NextMes, bAllMes : boolean;
    procedure OpenQryVOtp(dDtPrc : TDateTime);
    procedure OpenQueries(dDtPrc : TDateTime);
    procedure SetLabs;
  public
    { Public declarations }
  end;

procedure ShowOtpuska(dDtPrc : TDateTime; bNextMes : boolean);

const SECTION = 'Z_ShOtp';

var
  FormShowOtp: TFormShowOtp;

implementation

uses A_Const, Z_Dm, Z_Main, z_TUpi, Z_EOtp, a_Lib, z_MsgDlg, z_VvTn;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowOtpuska(dDtPrc : TDateTime; bNextMes : boolean);
begin
  FormShowOtp := TFormShowOtp.Create(Application);
  with FormShowOtp do begin
    b_NextMes := bNextMes;
    d_DtPrc := dDtPrc;
    OpenQryVOtp(dDtPrc);
    OpenQueries(dDtPrc);
    if bNextMes then begin
      sBtnAllMes.Visible := false;
      sBtnCurMes.Visible := false;
    end;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.OpenQryVOtp(dDtPrc : TDateTime);
var nY, nM, nD : word; n_SvTabN : integer; cCaption : ShortString;
begin
  cCaption := '';
  with qryVOtp do begin
    n_SvTabN := 0;
    if Active then begin
      n_SvTabN := FieldByName('TabN').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VOtp where (not Spec_NR is null)');
    if sBtnCurMes.Down or b_NextMes then
      SQL.Add(' and (DtProc = :dDtPrc)');
    if sBtnCurMes.Down then
      ParamByName('dDtPrc').AsDateTime := dDtPrc;
    if popSortMesTabN.Checked then
      SQL.Add(' order by DtProc, TabN')
    else
      SQL.Add(' order by TabN, DtProc');
    Open;
    if n_SvTabN <> 0 then
      Locate('TabN', n_SvTabN, [])
    else if nSvTabN <> 0 then
      Locate('TabN', nSvTabN, []);
    if sBtnCurMes.Down or b_NextMes then begin
      DecodeDate(dDtPrc, nY, nM, nD);
      cCaption := 'Отпуска [' + MesRus(nM) + ' ' + IntToStr(nY) + ' г.]';
      if b_NextMes then
        cCaption := cCaption + ' Будут подключены к отклонениям за ' +
                                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
      bAllMes := false; end
    else begin
      cCaption := 'Отпуска за все месяцы';
      bAllMes := true;
    end;
    Caption := cCaption;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.OpenQueries(dDtPrc : TDateTime);
begin
  with qryROtp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcVOtp;
    SQL.Add('Select * from Z_ROtp where TabN = :TabN and Spec_NR = :Spec_NR ' +
            ' order by ZaMesGod');
    Open;
  end;
  qryOtkl.Open;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.FormCreate(Sender: TObject);
begin
  LabelAlgRasch.Caption := '';
  LabelRK.Caption := '';
  //LabelFilter.Caption := '';
  LabelFilter.Caption := 'Фильтр не установлен';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 456);
    Width  := ReadInteger(SECTION, 'wW', 526);
    PanelLeft.Width := ReadInteger(SECTION, 'PnlLftW', 260);
    dbgrROtp.Height := ReadInteger(SECTION, 'GrROtpH', 245);
    sBtnAllMes.Down := ReadBool(SECTION, 'bAllMes', false);
    popSortMesTabN.Checked := ReadBool(SECTION, 'bSortMes', false);
    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    Free;
  end;
  dbtSpecNR.Visible := bFlagDbg;
  popSortTabNMes.Checked := not popSortMesTabN.Checked;
  sBtnCurMes.Down := not sBtnAllMes.Down;
  if FileExists(cDirVids + 'ShOtp_1.vid') then
    dbgrVOtp.Columns.LoadFromFile(cDirVids + 'ShOtp_1.vid');
  if FileExists(cDirVids + 'ShOtp_2.vid') then
    dbgrROtp.Columns.LoadFromFile(cDirVids + 'ShOtp_2.vid');
  if FileExists(cDirVids + 'ShOtp_33.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'ShOtp_33.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVOtp.Columns.SaveToFile(cDirVids + 'ShOtp_1.vid');
  dbgrROtp.Columns.SaveToFile(cDirVids + 'ShOtp_2.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'ShOtp_33.vid');
  with TIniFile.Create(cNmIniFile) do begin
    if qryVOtp.Active and (qryVOtp.RecordCount > 0) then
      WriteInteger(SECTION, 'nSvTabN', qryVOtp.FieldByName('TabN').AsInteger);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'PnlLftW', PanelLeft.Width);
    WriteInteger(SECTION, 'GrROtpH', dbgrROtp.Height);
    WriteBool(SECTION, 'bAllMes', sBtnAllMes.Down);
    WriteBool(SECTION, 'bSortMes', popSortMesTabN.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.qryVOtpCalcFields(DataSet: TDataSet);
var cVidN : String;
begin
  qryVOtp.FieldByName('FamIO').AsString :=
           DmMain.TabN2FamIO(qryVOtp.FieldByName('TabN').AsInteger); {z_Dm}
  qryVOtp.FieldByName('ShVidN').AsString :=
           DmMain.VidN2ShVidN(qryVOtp.FieldByName('VidN').AsString, cVidN);
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.popVOtpPopup(Sender: TObject);
begin
  popVOtpAdd.Enabled := DmMain.InCtrlMes and qryVOtp.Active and
                                                    (qryVOtp.State = dsBrowse);
  popVOtpDel.Enabled := DmMain.InCtrlMes and qryVOtp.Active and
                      (qryVOtp.State = dsBrowse) and (qryVOtp.RecordCount > 0);
  popVOtpEdt.Enabled := popVOtpDel.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.popVOtpEdtClick(Sender: TObject);
var nTabN, nSpecNR : integer; cFamIO : string; bShowTabN, bPereschet : boolean;
    bCanUpd : boolean;
begin
  bShowTabN  := false;
  bPereschet := true;
  bCanUpd := true;
  with qryVOtp do begin
    nTabN   := FieldByName('TabN').AsInteger;
    nSpecNR := FieldByName('Spec_NR').AsInteger;
    cFamIO  := FieldByName('FamIO').AsString;
  end;
  
  //>> Z_EOtp
  if TFormEOtp.AddEdtOtp(
    nTabN, d_DtPrc, cFamIO, nSpecNR, bShowTabN, bPereschet, bCanUpd)
  then
    with qryVOtp do begin
      Close;
      Open;
      Locate('TabN', nTabN, []);
    end;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.popVOtpAddClick(Sender: TObject);
var nTabN, nSpecNR : integer; cFamIO : string;
    bShowTabN, bPereschet, bCanUpd : boolean;
begin
  bShowTabN := true;
  bPereschet := true;
  bCanUpd := true;
  with qryVOtp do begin
    nTabN   := 0;
    nSpecNR := 0;
    cFamIO  := '';
  end;

  // >> Z_EOtp
  if TFormEOtp.AddEdtOtp(nTabN, d_DtPrc, cFamIO, nSpecNR, bShowTabN,
    bPereschet, bCanUpd)
  then
    with qryVOtp do begin
      Close;
      Open;
      Locate('TabN', nTabN, []);
    end;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.SetLabs;
begin
  if dbeAlgRasch.Field.AsInteger = 12 then
    LabelAlgRasch.Caption := 'По предыдущим 12-ти месяцам'
  else if dbeAlgRasch.Field.AsInteger = 2312 then
    LabelAlgRasch.Caption := 'По начислениям 2023-го года'
  else if dbeAlgRasch.Field.AsInteger = 2301 then
    LabelAlgRasch.Caption := 'По мин.зп 2023-го года'
  else
    LabelAlgRasch.Caption := 'По последнеиу окладу';

  if dbeRK.Field.AsString = 'K' then
    LabelRK.Caption := 'В календарных днях'
  else
    LabelRK.Caption := 'В рабочих днях';
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.dsrcVOtpDataChange(Sender: TObject; Field: TField);
begin
  if dsrcVOtp.State = dsBrowse then
    SetLabs;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.PanelLeftResize(Sender: TObject);
begin
  PanelKart.Left := Round((PanelRTop.Width - PanelKart.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.sBtnAllMesClick(Sender: TObject);
begin
  if sBtnAllMes.Down and not bAllMes then
    OpenQryVOtp(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.sBtnCurMesClick(Sender: TObject);
begin
  if sBtnCurMes.Down and bAllMes then
    OpenQryVOtp(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.popSortTabNMesClick(Sender: TObject);
begin
  if not popSortTabNMes.Checked then begin
    popSortTabNMes.Checked := true;
    popSortMesTabN.Checked := false;
    OpenQryVOtp(d_DtPrc);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.popSortMesTabNClick(Sender: TObject);
begin
  if not popSortMesTabN.Checked then begin
    popSortTabNMes.Checked := false;
    popSortMesTabN.Checked := true;
    OpenQryVOtp(d_DtPrc);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.popVOtpDelClick(Sender: TObject);
var cMsg : ShortString; cLogMsg : string; nMyResult : word; nSpecNR : integer;
    bEof : boolean; nSvNR, nTabN : integer;
begin
  cLogMsg := '';
  nTabN := 0;
  cMsg := 'Расчет отпускных удаляется безвозвратно. Согласны?:';
  if myMsgDlg('Отпускные', cMsg, 1, nMyResult) {z_MsgDlg} then begin
    Application.ProcessMessages;
    nSpecNR := qryVOtp.FieldByName('Spec_NR').AsInteger;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN; 
      SQL.Add('Select * from Z_VOtp where (Spec_NR = :nSpecNr)');
      ParamByName('nSpecNr').AsInteger := nSpecNR;
      Open;
      if RecordCount > 0 then begin
        nTabN := FieldByName('TabN').AsInteger;
        cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                   ', DtProc = ' + FieldByName('DtProc').AsString +
                   ', DtBeg = ' + FieldByName('DtBeg').AsString +
                   ', NrPrik = ' + FieldByName('NrPrik').AsString +
                   ', DtPrik = ' + FieldByName('DtPrik').AsString +
                   ', VidN = ' + FieldByName('VidN').AsString +
                   ', SmSrdn = ' + FieldByName('SmSrdn').AsString +
                   ', SmOtp = ' + FieldByName('SmOtp').AsString;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Delete from Z_VOtp where (Spec_NR = :nSpecNr)');
      ParamByName('nSpecNr').AsInteger := nSpecNR;
      ExecSQL;          // Из Z_Rotp и из Z_Otkl удалит
      SQL.Clear;        // триггер ZVOtp_BD (Before Delete)
      DataBaseName := '';
    end;
    if cLogMsg > '' then  //Не переносить отсюда - используется только что
      DmMain.AddLog(Now, nTabN, 'Удаление отпускных', gc_AppNmUsr,
                                   'Z_VOtp', cLogMsg);// освободившийся qryTmp
    with qryVOtp do begin           
      nSvNR := 0;
      bEof := false;
      DisableControls;
      Next;
      if Eof then
        bEof := true
      else
        nSvNR := FieldByName('NR').AsInteger;
      Close;
      Open;
      if bEof then
        Last
      else
        Locate('NR', nSvNR, []);
      EnableControls;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.qryROtpCalcFields(DataSet: TDataSet);
begin
  qryROtpSmZpKoef.AsFloat := qryROtpSmZarabotka.AsFloat * qryROtpKoefZp.AsFloat;
end;
//------------------------------------------------------------------------------
procedure TFormShowOtp.dbgrVOtpDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrVOtp.Canvas do begin
    if not (gdFocused in State) then begin
      if qryVOtpDtProc.AsDateTime = d_DtPrc then
        Font.Color  := clWindowText
      else
        Font.Color  := clNavy;
    end;
  end;
  dbgrVOtp.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormShowOtp.popFilterByTabNClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString;
begin
  if not popFilterByTabN.Checked and
               VvodTabN(nTabN, cFamIO) then with qryVOtp do begin
    Filter := 'TabN = ' + IntToStr(nTabN);
    Filtered := true;
    popFilterOff.Checked := false;
    popFilterByTabN.Checked := true;
    LabelFilter.Caption := 'Фильтр: ТабНр = ' + IntToStr(nTabN) +
                                                            ' ' + cFamIO;
  end;
end;

procedure TFormShowOtp.popFilterOffClick(Sender: TObject);
begin
  if not popFilterOff.Checked then with qryVOtp do begin
    Filtered := false;
    Filter := '';
    popFilterOff.Checked := true;
    popFilterByTabN.Checked := false;
    LabelFilter.Caption := 'Фильтр не установлен';
  end;
end;

end.
