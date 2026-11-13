unit z_ShBln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBTables, IniFiles,
  Math, Mask, DBCtrls, Menus, ComCtrls;

type
  TFormShowBln = class(TForm)
    qryVBln: TQuery;
    dsrcVBln: TDataSource;
    qryRBln: TQuery;
    dsrcRBln: TDataSource;
    qryOtkl: TQuery;
    dsrcOtkl: TDataSource;
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
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    popHead: TMenuItem;
    qryOtklKDSPS: TSmallintField;
    qryOtklVIDN: TStringField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklShObj: TStringField;
    qryOtklShKatP: TStringField;
    qryVBlnNR: TIntegerField;
    qryVBlnKDSPS: TSmallintField;
    qryVBlnDTPROC: TDateTimeField;
    qryVBlnTABN: TIntegerField;
    qryVBlnALGRASCH: TSmallintField;
    qryVBlnNCHBUDMES: TStringField;
    qryVBlnNRLIST: TStringField;
    qryVBlnDTLIST: TDateTimeField;
    qryVBlnDTBEG: TDateTimeField;
    qryVBlnDTEND: TDateTimeField;
    qryVBlnVIDN: TStringField;
    qryVBlnOLDKDVIDN: TSmallintField;
    qryVBlnCNTCHAS: TFloatField;
    qryVBlnPROCOPL: TFloatField;
    qryVBlnKDOBJ: TSmallintField;
    qryVBlnKDKATP: TSmallintField;
    qryVBlnKDSPZ: TSmallintField;
    qryVBlnNOTES: TStringField;
    qryVBlnSMSRDN: TFloatField;
    qryVBlnSMBLN: TFloatField;
    qryVBlnSPEC_NR: TIntegerField;
    qryRBlnNR: TIntegerField;
    qryRBlnTABN: TIntegerField;
    qryRBlnKDSPS: TSmallintField;
    qryRBlnSPEC_NR: TIntegerField;
    qryRBlnZAMESGOD: TDateTimeField;
    qryRBlnSMZARABOTKA: TFloatField;
    qryRBlnKOEFZP: TFloatField;
    qryVBlnFamIO: TStringField;
    qryTmp: TQuery;
    qryRBlnSmZpKoef: TFloatField;
    qryVBlnShVidN: TStringField;
    popSep1: TMenuItem;
    popSort: TMenuItem;
    popSortTabNMes: TMenuItem;
    popSortMesTabN: TMenuItem;
    qryOtklSHVIDN: TStringField;
    qryOtklSCHBU: TStringField;
    qryOtklPSCH: TStringField;
    popFilter: TMenuItem;
    popFilterByTabN: TMenuItem;
    popFilterOff: TMenuItem;
    qryVBlnDAY5FIRST: TStringField;
    qryVBlnLISTCONT: TStringField;
    qryVBlnPREDSPEC_NR: TIntegerField;
    qryVBlnPredNR: TStringField;
    qryVBlnPredDt: TDateField;
    popView: TMenuItem;
    qryVBlnCNTDAYS: TSmallintField;
    qryRBlnCNTDAYS: TFloatField;
    qryVBlnPRBLN: TSmallintField;
    qryVBlnKDTEMU: TSmallintField;
    qryVBlnLNKSTOTP: TIntegerField;
    qryVBlnSHEMA: TSmallintField;
    qryVBlnSTGCMN: TFloatField;
    qryVBlnSTG12: TFloatField;
    popAddBln: TMenuItem;
    popAddDekr: TMenuItem;
    popAddSocD: TMenuItem;
    qryPgr: TQuery;
    qryPgrNR: TIntegerField;
    qryPgrDTPROC: TDateTimeField;
    qryPgrTABN: TIntegerField;
    qryPgrFamIO: TStringField;
    qryPgrID: TStringField;
    qryPgrDTDOC: TDateTimeField;
    qryPgrSERDOC: TStringField;
    qryPgrNDOC: TStringField;
    qryPgrIDP: TStringField;
    qryPgrFAMP: TStringField;
    qryPgrIMAP: TStringField;
    qryPgrOTCHP: TStringField;
    qryPgrSUMMA: TFloatField;
    qryPgrDTZ: TDateTimeField;
    qryPgrNRZ: TIntegerField;
    dsrcPgr: TDataSource;
    updPgr: TUpdateSQL;
    qryVBlnSERLIST: TStringField;
    PageControl1: TPageControl;
    tsBln: TTabSheet;
    tsPgr: TTabSheet;
    dbgrVBln: TDBGrid;
    Splitter2: TSplitter;
    PanelRight: TPanel;
    Splitter1: TSplitter;
    dbgrRBln: TDBGrid;
    dbgrOtkl: TDBGrid;
    PanelRTop: TPanel;
    PanelKart: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LabelAlgRasch: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    dbtFamIO: TDBText;
    dbtOldKdVidN: TDBText;
    dbtSpec_NR: TDBText;
    LabelPredNr: TLabel;
    LabelPredDt: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbeAlgRasch: TDBEdit;
    dbeNrList: TDBEdit;
    dbeDtBeg: TDBEdit;
    dbeCntDays: TDBEdit;
    dbeDtEnd: TDBEdit;
    dbeVidN: TDBEdit;
    dbeProcOpl: TDBEdit;
    dbeNotes: TDBEdit;
    dbeShVidN: TDBEdit;
    dbeSmSrdn: TDBEdit;
    dbeSmBln: TDBEdit;
    dbePredNr: TDBEdit;
    dbePredDt: TDBEdit;
    dbChBoxFirst5: TDBCheckBox;
    dbeStgCmn: TDBEdit;
    dbeStg12: TDBEdit;
    dbePrcOpl: TDBEdit;
    dbeSerList: TDBEdit;
    Panel1: TPanel;
    sBtnAllMes: TSpeedButton;
    sBtnCurMes: TSpeedButton;
    LabelSortInf: TLabel;
    LabelFilter: TLabel;
    sBtnPrt: TSpeedButton;
    Label1: TLabel;
    LabelCountRec: TLabel;
    bBtnClose: TBitBtn;
    Panel2: TPanel;
    LabelSortInfPgr: TLabel;
    sBtnPrt2: TSpeedButton;
    Label16: TLabel;
    labelCountRecPgr: TLabel;
    bBtnClose2: TBitBtn;
    dbgrPgr: TDBGrid;
    popPgr: TPopupMenu;
    popPgrAdd: TMenuItem;
    popPgrEdt: TMenuItem;
    popPgrDel: TMenuItem;
    popPgrHead: TMenuItem;
    qryPgrTIPD: TSmallintField;
    popPgrAdd2: TMenuItem;
    popPgrAdd5: TMenuItem;
    qryVBlnDTZ: TDateTimeField;
    qryVBlnNRZ: TIntegerField;
    sbtnF8: TSpeedButton;
    lbxF8: TListBox;
    updVbln: TUpdateSQL;
    qryZNr: TQuery;
    sbtnHlp: TBitBtn;
    popMetki: TMenuItem;
    popMetkiSet: TMenuItem;
    popMetkiClear: TMenuItem;
    PanelHlp: TPanel;
    Memo1: TMemo;
    bBtnHlp2: TBitBtn;
    sBtnF8_2: TSpeedButton;
    lbxF8_2: TListBox;
    qryUpd: TQuery;
    qryPgrNRACT: TStringField;
    qryPgrDTACT: TDateTimeField;
    N2: TMenuItem;
    NUnmarkGroup: TMenuItem;
    NSortByFamMes: TMenuItem;
    NSortByMesFam: TMenuItem;
    popPrint: TPopupMenu;
    PopPrintRegistry: TMenuItem;
    popPrintReest: TMenuItem;
    popPrintProt: TMenuItem;
    NPrintProtCommon: TMenuItem;
    NPrintProtByZajavk: TMenuItem;
    N1: TMenuItem;
    PopPrintRequest: TMenuItem;
    popPrintDodadok1: TMenuItem;
    NPrintNotesCommon: TMenuItem;
    NPrintNotesByZajavk: TMenuItem;
    popPrintAppdx3: TMenuItem;
    NPrintAppdx3Common: TMenuItem;
    NPrintAppdx3Separated: TMenuItem;
    popPrintPVK: TMenuItem;
    popPrintExportXML: TMenuItem;
    NXml11: TMenuItem;
    NXml13: TMenuItem;
    ExportToJSON: TMenuItem;
    JsonDesease: TMenuItem;
    JsonAccident: TMenuItem;
    popPrintDodadok2: TMenuItem;
    NPrintAppdx2Common: TMenuItem;
    NPrintAppdx2Separated: TMenuItem;
    JsonPregnacy: TMenuItem;
    PopPrintRegBuh: TMenuItem;
    PopPrintRegPlan: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryVBlnCalcFields(DataSet: TDataSet);
    procedure popEdtClick(Sender: TObject);
    procedure dsrcVBlnDataChange(Sender: TObject; Field: TField);
    procedure popAddClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure popDelClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure PanelRTopResize(Sender: TObject);
    procedure qryRBlnCalcFields(DataSet: TDataSet);
    procedure sBtnAllMesClick(Sender: TObject);
    procedure sBtnCurMesClick(Sender: TObject);
    procedure popSortClick(Sender: TObject);
    procedure popSortTabNMesClick(Sender: TObject);
    procedure dbgrVBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPrtReeBlnClick(Sender: TObject);
    procedure popFilterByTabNClick(Sender: TObject);
    procedure popFilterOffClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure PopPrintRegistryClick(Sender: TObject);
    procedure PopPrintRequestClick(Sender: TObject);
    procedure popPrintPVKClick(Sender: TObject);
    procedure popAddBlnClick(Sender: TObject);
    procedure popAddSocDClick(Sender: TObject);
    procedure qryPgrCalcFields(DataSet: TDataSet);
    procedure qryPgrAfterPost(DataSet: TDataSet);
    procedure sBtnPrt2Click(Sender: TObject);
    procedure bBtnCloseClick(Sender: TObject);
    procedure qryPgrNewRecord(DataSet: TDataSet);
    procedure popPgrEdtClick(Sender: TObject);
    procedure popPgrAdd2Click(Sender: TObject);
    procedure popPgrAdd5Click(Sender: TObject);
    procedure qryPgrBeforePost(DataSet: TDataSet);
    procedure popPgrPopup(Sender: TObject);
    procedure popPgrDelClick(Sender: TObject);
    procedure qryPgrAfterDelete(DataSet: TDataSet);
    procedure sbtnF8Click(Sender: TObject);
    procedure qryVBlnAfterPost(DataSet: TDataSet);
    procedure dbgrVBlnDblClick(Sender: TObject);
    procedure popMetkiSetClick(Sender: TObject);
    procedure popMetkiClearClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure sbtnHlpClick(Sender: TObject);
    procedure sbtnHlpCloseClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sBtnF8_2Click(Sender: TObject);
    procedure dbgrPgrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popPrintPopup(Sender: TObject);
    procedure popAddDekrClick(Sender: TObject);
    procedure popPrintReestClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure NUnmarkGroupClick(Sender: TObject);
    procedure NPrintProtCommonClick(Sender: TObject);
    procedure NPrintProtByZajavkClick(Sender: TObject);
    procedure NPrintNotesCommonClick(Sender: TObject);
    procedure NPrintNotesByZajavkClick(Sender: TObject);
    procedure NPrintAppdx3CommonClick(Sender: TObject);
    procedure NPrintAppdx3SeparatedClick(Sender: TObject);
    procedure NXml11Click(Sender: TObject);
    procedure NXml13Click(Sender: TObject);
    procedure JsonDeseaseClick(Sender: TObject);
    procedure JsonAccidentClick(Sender: TObject);
    procedure NPrintAppdx2CommonClick(Sender: TObject);
    procedure NPrintAppdx2SeparatedClick(Sender: TObject);
    procedure JsonPregnacyClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    nSvTabN : integer;
    bAllMes : boolean;
    procedure OpenQryVBln(dDtPrc : TDateTime);
    procedure OpenQryPgr(dDtPrc : TDateTime);
    procedure OpenQryRBln;
    procedure SetLabs;
    function GetNewNrZ(dDtPrc: TDateTime): smallint;
    procedure ExportRequestCalc(PrtMode: word);
    function GetActiveNrZ: integer;
  public
    { Public declarations }
  end;

procedure ShowBln(dDtPrc : TDateTime);

const SECTION = 'Z_ShBln';

var
  FormShowBln: TFormShowBln;
  n_NrZ       : smallInt;


implementation

uses
  a_Const, a_DM, a_Lib, z_CmnPrt, z_Dm, z_EBln, Z_EDkr, z_EExp, z_FssTvp,
  z_Main, z_MsgDlg, z_TUpi, z_VvTn, BlnRegistry, CustDateUtils, QryLib;

type
  TSortMode = (SORT_MNTH_TABN, SORT_TABN_MNTH, SORT_MNTH_NAME, SORT_NAME_MNTH);

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowBln(dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormShowBln := TFormShowBln.Create(Application);
  with FormShowBln do begin
    n_NrZ := GetNewNrZ(dDtPrc);

    d_DtPrc := dDtPrc;
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Больничные [' + MesRus(nM) + ' ' + IntToStr(nY) + ' г.]';
    LabelSortInf.Caption := '';
    OpenQryVBln(dDtPrc);
    OpenQryPgr(dDtPrc);
    OpenQryRBln;
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.OpenQryVBln(dDtPrc : TDateTime);
var nY, nM, nD : word; n_SvNR, n_SvTabN : integer;
begin
  with qryVBln do begin
    n_SvNR := 0;
    n_SvTabN := 0;
    if Active then begin
      n_SvNR := FieldByName('NR').AsInteger;
      n_SvTabN := FieldByName('TabN').AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;

    SQL.Add(
      'select b.*, u.Fam, u.Ima, u.Otch ' +
      'from Z_VBln b ' +
        'left join z_UPI u on u.TabN = b.TabN ' +
      'where (not Spec_NR is null)');

    if sBtnCurMes.Down then begin
      SQL.Add('and (DtProc = :dDtPrc)');
      ParamByName('dDtPrc').AsDateTime := dDtPrc;
    end else begin
      SQL.Add('and (DtProc >= :dDtPrc)');
      ParamByName('dDtPrc').AsDateTime := dDtPrc - 365;
    end;

    if popSortMesTabN.Checked then
      SQL.Add('order by DtProc, TabN, DtBeg')
    else if popSortTabNMes.Checked then
      SQL.Add('order by TabN, DtProc, DtBeg')
    else if NSortByMesFam.Checked then
      SQL.Add('order by DtProc, Fam, Ima, Otch, DtBeg')
    else
      SQL.Add('order by Fam, Ima, Otch, DtProc, DtBeg');

    Open;

    LabelCountRec.Caption := intTostr(RecordCount);
    if n_SvNR <> 0 then
      Locate('NR', n_SvNR, [])
    else if n_SvTabN <> 0 then
      Locate('TabN', n_SvTabN, [])
    else if nSvTabN <> 0 then
      Locate('TabN', nSvTabN, [])
    else
      Last;
    if sBtnCurMes.Down then begin
      DecodeDate(dDtPrc, nY, nM, nD);
      Caption := 'Больничные [' + MesRus(nM) + ' ' + IntToStr(nY) + ' г.]';
      bAllMes := false; end
    else begin
      Caption := 'Больничные за последние 12 месяцев';
      bAllMes := true;
    end;
    if popSortMesTabN.Checked then
      LabelSortInf.Caption := 'Сортировка: Расч.месяц, ТабНр'
    else
      LabelSortInf.Caption := 'Сортировка: ТабНр, Расч.месяц';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.OpenQryPgr(dDtPrc: TDateTime);
begin
  with qryPgr do begin
    If Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Exp_Fss where ');
    if sBtnCurMes.Down then begin
      SQL.Add(' (DtProc = :dDtPrc)');
      ParamByName('dDtPrc').AsDateTime := dDtPrc; end
    else begin
      SQL.Add(' (DtProc >= :dDtPrc)');
      ParamByName('dDtPrc').AsDateTime := dDtPrc-365;
    end;
    SQL.Add(' order by TabN');
    Open;
    LabelCountRecPgr.Caption := intTostr(RecordCount);
    Last;
    LabelSortInfPgr.Caption := 'Сортировка: ТабНр, Расч.месяц';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.OpenQryRBln;
begin
  with qryRBln do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcVBln;
    SQL.Add('Select * from Z_RBln where TabN = :TabN and Spec_NR = :Spec_NR ' +
            ' order by ZaMesGod, VidN');
    Open;
  end;
  qryOtkl.Open;
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.FormCreate(Sender: TObject);
var
  SortMode: TSortMode;
begin
  LabelAlgRasch.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 456);
    Width  := ReadInteger(SECTION, 'wW', 800);
    sBtnAllMes.Down := ReadBool(SECTION, 'bAllMes', false);

    if ValueExists(SECTION, 'SortMode') then begin
      popSortMesTabN.Checked := false;
      popSortTabNMes.Checked := false;

      SortMode := TSortMode(ReadInteger(SECTION, 'SortMode', Ord(SORT_NAME_MNTH)));

      if SortMode = SORT_MNTH_TABN then
        popSortMesTabN.Checked := true
      else if SortMode = SORT_TABN_MNTH then
        popSortTabNMes.Checked := true
      else if SortMode = SORT_MNTH_NAME then
        NSortByMesFam.Checked := true
      else {SortMode = SORT_NAME_MNTH}
        NSortByFamMes.Checked := true;
    end else begin
      popSortMesTabN.Checked := ReadBool(SECTION, 'bSortMes', false);
      popSortTabNMes.Checked := not popSortMesTabN.Checked;
    end;

    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    dbgrVBln.Width := ReadInteger(SECTION, 'GrVBlnW', 400);
    dbgrRBln.Height := ReadInteger(SECTION, 'GrRBlnH', 245);
    Free;
  end;
  dbChBoxFirst5.Top := 50;
  dbChBoxFirst5.Left := 129;
  dbChBoxFirst5.Visible := false;
  LabelPredNr.Visible := false;
  LabelPredDt.Visible := false;
  dbePredNR.Visible := false;
  dbePredDt.Visible := false;
  //sBtnPrt2.Visible := bFlagDbg;

  sBtnCurMes.Down := not sBtnAllMes.Down;
  dbtSpec_NR.Visible := bFlagDbg;
  if not bFlagDbg then
    PageControl1.ActivePage := tsBln;
  if FileExists(cDirVids + 'ShVBln06.vid') then
    dbgrVBln.Columns.LoadFromFile(cDirVids + 'ShVBln06.vid');
  if FileExists(cDirVids + 'Sh_Bln02.vid') then
    dbgrRBln.Columns.LoadFromFile(cDirVids + 'Sh_Bln02.vid');
  if FileExists(cDirVids + 'ExpPgr02.vid') then
    dbgrPgr.Columns.LoadFromFile(cDirVids + 'ExpPgr02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVBln.Columns.SaveToFile(cDirVids + 'ShVBln06.vid');
  dbgrRBln.Columns.SaveToFile(cDirVids + 'Sh_Bln02.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'ShBln_03.vid');
  dbgrPgr.Columns.SaveToFile(cDirVids + 'ExpPgr02.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if qryVBln.Active then
      WriteInteger(SECTION, 'nSvTabN', qryVBln.FieldByName('TabN').AsInteger);
    WriteInteger(SECTION, 'GrRBlnH', dbgrRBln.Height);
    WriteInteger(SECTION, 'GrVBlnW', dbgrVBln.Width);
    WriteBool(SECTION, 'bAllMes', sBtnAllMes.Down);

    // WriteBool(SECTION, 'bSortMes', popSortMesTabN.Checked);
    if popSortMesTabN.Checked then
       WriteInteger(SECTION, 'SortMode', Ord(SORT_MNTH_TABN))
    else if popSortTabNMes.Checked then
      WriteInteger(SECTION, 'SortMode', Ord(SORT_TABN_MNTH))
    else if NSortByMesFam.Checked then
       WriteInteger(SECTION, 'SortMode', Ord(SORT_MNTH_NAME))
    else {NSortByFamMes.Checked}
       WriteInteger(SECTION, 'SortMode', Ord(SORT_NAME_MNTH));

    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.qryVBlnCalcFields(DataSet: TDataSet);
var cVidN : string;
begin
  qryVBln.FieldByName('FamIO').AsString :=                        {z_Dm}
                  DmMain.TabN2FamIO(qryVBln.FieldByName('TabN').AsInteger);
  qryVBln.FieldByName('ShVidN').AsString :=
           DmMain.VidN2ShVidN(qryVBln.FieldByName('VidN').AsString, cVidN);
  qryVBlnPredNR.AsString := '';
  qryVBlnPredDt.AsString := '';
  if (qryVBlnListCont.AsString = '1') and (not qryVBlnPredSpec_NR.IsNull) then
                                                          with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VBln where Spec_NR = :nPredSpec_NR');
    ParamByName('nPredSpec_NR').AsInteger := qryVBlnPredSpec_NR.AsInteger;
    Open;
    if RecordCount <> 0 then begin
      qryVBlnPredNR.AsString := FieldByName('NrList').AsString;
      qryVBlnPredDt.AsString := FieldByName('DtList').AsString;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.SetLabs;
begin
  if (qryVBlnListCont.AsString = '1') then begin
    dbChBoxFirst5.Visible := false;
    LabelPredNr.Visible := true;
    LabelPredDt.Visible := true;
    dbePredNR.Visible := true;
    dbePredDt.Visible := true; end
  else begin
    dbChBoxFirst5.Visible := true;
    LabelPredNr.Visible := false;
    LabelPredDt.Visible := false;
    dbePredNR.Visible := false;
    dbePredDt.Visible := false;
  end;
  if qryVBlnAlgRasch.AsInteger = 6 then
    LabelAlgRasch.Caption := 'По предыдущим 6-ти месяцам'
  else
    LabelAlgRasch.Caption := 'По последнеиу окладу';
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popAddClick(Sender: TObject);
begin
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popPopup(Sender: TObject);
  var nGrpNum: integer;
begin
  popAdd.Enabled := DmMain.InCtrlMes and qryVBln.Active and
                                                    (qryVBln.State = dsBrowse);
  popDel.Enabled := DmMain.InCtrlMes and qryVBln.Active and
                      (qryVBln.State = dsBrowse) and (qryVBln.RecordCount > 0);
  popEdt.Enabled := popDel.Enabled;

  nGrpNum := qryVBln.FieldByName('NRZ').AsInteger;
  if nGrpNum > 0 then begin
    NUnmarkGroup.Caption := 'Снять отметки с записей группы № '
      + IntToStr(nGrpNum);
      NUnmarkGroup.Enabled := true;
  end
  else begin
    NUnmarkGroup.Caption := 'Снять отметки с записей группы';
    NUnmarkGroup.Enabled := false;
  end;

end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popEdtClick(Sender: TObject);
var nTabN, nSpecNR : integer; cFamIO : ShortString;
    bShowTabN, bCanUpd, bPereschet : boolean;
    cVidn  : ShortString;
begin
  bShowTabN  := false;
  bPereschet := true;
  bCanUpd    := true;
  with qryVBln do begin
    nTabN   := FieldByName('TabN').AsInteger;
    nSpecNR := FieldByName('Spec_NR').AsInteger;
    cFamIO  := FieldByName('FamIO').AsString;
    cVidN   := FieldByName('VidN').AsString;
  end;
  If cVidN = '2602' then begin
    if TFormEDkr.Run(nTabN, cFamIO, nSpecNR,
             bShowTabN, bCanUpd, bPereschet) {Z_EBln} then with qryVBln do begin
    Close;
    Open;
    Locate('TabN', nTabN, []); end; end

  else
    if TFormEBln.AddEdtBln(nTabN, cFamIO, nSpecNR,
           bShowTabN, bCanUpd, bPereschet) {Z_EBln} then with qryVBln do begin
    Close;
    Open;
    Locate('TabN', nTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.dsrcVBlnDataChange(Sender: TObject; Field: TField);
begin
  if dsrcVBln.State = dsBrowse then
    SetLabs;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.FormKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then begin
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где нужно, пользуйтесь контекстными меню');
  end;
  if Key = VK_F8 then begin
    if PageControl1.ActivePage = tsBln then
      sbtnF8.Click
    else
      sbtnF8_2.Click;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popDelClick(Sender: TObject);
var cMsg : ShortString; cLogMsg : string; nMyResult : word; nSpecNR : integer;
    bEof : boolean; nSvNR, nTabN : integer;
begin
  cLogMsg := '';
  nTabN := 0;
  cMsg := 'Больничный лист удаляется безвозвратно. Согласны?:';
  if myMsgDlg('Больничные', cMsg, 1, nMyResult) {z_MsgDlg} then begin
    Application.ProcessMessages;
    nSpecNR := qryVBln.FieldByName('Spec_NR').AsInteger;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from Z_VBln where (Spec_NR = :nSpecNr)');
      ParamByName('nSpecNr').AsInteger := nSpecNR;
      Open;
      if RecordCount > 0 then begin
        nTabN := FieldByName('TabN').AsInteger;
        cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
                   ', DtProc = ' + FieldByName('DtProc').AsString +
                   ', DtBeg = ' + FieldByName('DtBeg').AsString +
                   ', NrList = ' + FieldByName('NrList').AsString +
                   ', DtList = ' + FieldByName('DtList').AsString +
                   ', VidN = ' + FieldByName('VidN').AsString +
                   ', SmSrdn = ' + FieldByName('SmSrdn').AsString +
                   ', SmBln = ' + FieldByName('SmBln').AsString;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Delete from Z_VBln where (Spec_NR = :nSpecNr)');
      ParamByName('nSpecNr').AsInteger := nSpecNR;
      ExecSQL;          // Из Z_RBln и из Z_Otkl удалит
      SQL.Clear;        // триггер ZVBln_BD (Before Delete)
      DataBaseName := '';
    end;
    if cLogMsg > '' then  //Не переносить отсюда - используется только что
      DmMain.AddLog(Now, nTabN, 'Удаление больничных', gc_AppNmUsr,
                                   'Z_VBln', cLogMsg);// освободившийся qryTmp
    with qryVBln do begin
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
procedure TFormShowBln.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.PanelRTopResize(Sender: TObject);
begin
  PanelKart.Left := Round((PanelRTop.Width - PanelKart.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.qryRBlnCalcFields(DataSet: TDataSet);
begin
  qryRBlnSmZpKoef.AsFloat := qryRBlnSmZarabotka.AsFloat * qryRBlnKoefZp.AsFloat;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.sBtnAllMesClick(Sender: TObject);
begin
  if sBtnAllMes.Down and not bAllMes then
    OpenQryVBln(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.sBtnCurMesClick(Sender: TObject);
begin
  if sBtnCurMes.Down and bAllMes then
    OpenQryVBln(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popSortClick(Sender: TObject);
begin
  popSortTabNMes.Checked := false;
  popSortMesTabN.Checked := false;
  NSortByFamMes.Checked := false;
  NSortByMesFam.Checked := false;
  (Sender as TMenuItem).Checked := true;
  OpenQryVBln(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popSortTabNMesClick(Sender: TObject);
begin
  if not popSortTabNMes.Checked then begin
    popSortTabNMes.Checked := true;
    popSortMesTabN.Checked := false;
    OpenQryVBln(d_DtPrc);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.dbgrVBlnDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cNmfld : ShortString;
begin
  with dbgrVBln.Canvas do begin
    cNmFld := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if qryVBlnDtProc.AsDateTime = d_DtPrc then
        Font.Color  := clWindowText
      else begin
        Font.Color  := clNavy;
        Font.Style  := [];
      end;
      if (qryVblnNrZ.AsInteger > 0) and (qryVblnDtZ.AsString = '' ) then
        brush.Color := clMoneyGreen
      else if (qryVblnNrZ.AsInteger > 0) and (qryVblnDtZ.AsString > '' ) then
        brush.Color := clSkyBlue;
    end;
  end;
  dbgrVBln.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.sBtnPrtReeBlnClick(Sender: TObject);
var cMsg : ShortString; nY, nM, nD : word; nSvNR : integer;
    dDtPrc : TDateTime; bSortOnTabN : boolean;
begin
  if not qryVBln.Active or (qryVBln.RecordCount = 0) then
    Exit;
  DecodeDate(qryVBln.FieldByName('DtProc').AsDateTime, nY, nM, nD);
  cMsg := 'Распечатать реестр больничных за ' + MesRus(nM) + ' ' +
                                                IntToStr(nY) + ' г.?:';
  if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                                                    with qryVBln do begin
    nSvNR := FieldByName('NR').AsInteger;
    dDtPrc := FieldByName('DtProc').AsDateTime;
    bSortOnTabN := popSortTabNMes.Checked;
    if bSortOnTabN then
      popSortMesTabN.Click;
    if Locate('DtProc', dDtPrc, []) then
      F6PrtReeBln(dDtPrc, qryVBln, qryOtkl);      {z_CmnPrt}
    if bSortOnTabN then
      popSortTabNMes.Click;
    Locate('NR', nSvNR, [])
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popFilterByTabNClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString;
begin
  if not popFilterByTabN.Checked and
               VvodTabN(nTabN, cFamIO) {z_VvTn} then with qryVBln do begin
    Filter := 'TabN = ' + IntToStr(nTabN);
    Filtered := true;
    popFilterOff.Checked := false;
    popFilterByTabN.Checked := true;
    LabelFilter.Caption := 'Фильтр: ТабНр = ' + IntToStr(nTabN) +
                                                            ' ' + cFamIO;
    LabelCountRec.Caption := IntToStr(qryVbln.RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popFilterOffClick(Sender: TObject);
begin
  if not popFilterOff.Checked then with qryVBln do begin
    Filtered := false;
    Filter := '';
    popFilterOff.Checked    := true;
    popFilterByTabN.Checked := false;
    LabelFilter.Caption     := 'Фильтр не установлен';
    LabelCountRec.Caption   := IntToStr(qryVbln.RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.sBtnPrtClick(Sender: TObject);
begin
 popPrint.Popup(left + 3 + sBtnPrt.Left, top + 50 + sBtnPrt.Height);
end;

//------------------------------------------------------------------------------
// Печать реестра больничных листов.
//------------------------------------------------------------------------------
procedure TFormShowBln.PopPrintRegistryClick(Sender: TObject);
begin
  TBlnRegistry.Run(
    QryVBln.FieldByName('DtProc').AsDateTime, Sender = PopPrintRegPlan);
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.PopPrintRequestClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_ZAJAVKA, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.popPrintPVKClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_NOTESP, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.popAddBlnClick(Sender: TObject);
var nTabN, nSpecNR : integer; cFamIO : ShortString;
    bShowTabN, bCanUpd, bPereschet : boolean;
begin
  bShowTabN  := true;
  bPereschet := true;
  bCanUpd    := true;
  with qryVBln do begin
    nTabN   := 0;
    nSpecNR := 0;
    cFamIO  := '';
      if TFormEBln.AddEdtBln(nTabN, cFamIO, nSpecNR,     {Z_EBln}
                      bShowTabN, bCanUpd, bPereschet) then with qryVBln do begin
        Close;
        Open;
        Locate('TabN', nTabN, []);
      end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popAddDekrClick(Sender: TObject);
var cFamIO : string; nTabN, nSpecNR : integer;
    bShowTabN, bCanUpd, bPereschet : boolean;
begin
  bShowTabN  := true;
  bPereschet := true;
  bCanUpd    := true;
  cFamIO     := '';
  nTabN   := 0;
  nSpecNR := 0;
  with qryVbln do begin
    if TFormEDkr.Run(nTabN, cFamIO, nSpecNR,
                           bShowTabN, bCanUpd, bPereschet) {Z_EDkr} then begin
      Close;
      Open;
      Locate('TabN', nTabN, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popAddSocDClick(Sender: TObject);
//var nTabN : integer; cFamIO : ShortString;
begin
(*
  with qryVBln do begin
    nTabN   := 0;
    cFamIO  := '';
  end;
  if AddEdtPgr(qryPgr, dsrcPgr) {Z_EExp} then with qryVBln do begin
    Close;
    Open;
    Locate('TabN', nTabN, []);
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popPgrAdd2Click(Sender: TObject);
var nSvNR : integer;
begin
  with qryPgr do begin
    nSvNR := qryPgrNR.AsInteger;
    Append;
    qryPgrTipD.AsInteger := 2;
    if AddEdtPgr(qryPgr, dsrcPgr) {Z_EExp} then
      Post
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popPgrAdd5Click(Sender: TObject);
var nSvNR : integer;
begin
  with qryPgr do begin
    nSvNR := qryPgrNR.AsInteger;
    Append;
    qryPgrTipD.AsInteger := 5;
    if AddEdtPgr(qryPgr, dsrcPgr) {Z_EExp} then
      Post
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popPgrEdtClick(Sender: TObject);
begin
  with qryPgr do begin
    Edit;
    if AddEdtPgr(qryPgr, dsrcPgr) {Z_EExp} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.qryPgrCalcFields(DataSet: TDataSet);
var nTabN : integer;
    cFamIO, cFam, cIma, cOtch, cPol, cID : string;
    dDOB  : TDateTime;
begin
  nTabN   := qryPgrTabN.AsInteger;
  if DmMain.GetUpiInfo(nTabN, cFamIO, cFam, cIma, cOtch, cPol, cID, dDOB) then
    if ((not qryPgrtabN.IsNull) or (qryPgrtabN.Value = 0 )) and
                                     (qryPgrTabN.AsString > '') then begin
       qryPgrFamIO.AsString := cFamIO;
       qryPgrID.AsString    := cID; end
    else begin
      qryPgrFamIO.AsString := '';
      qryPgrID.AsString    := ''; end
  else begin
    qryPgrFamIO.AsString := '';
    qryPgrID.AsString    := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.sBtnPrt2Click(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.bBtnCloseClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.qryPgrNewRecord(DataSet: TDataSet);
begin
   qryPgrDtProc.AsDateTime :=  dDtProc;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.qryPgrBeforePost(DataSet: TDataSet);
var nDbgNR : integer;
begin
  if qryPgrNR.IsNull or (qryPgrNR.AsInteger <= 0) then begin
    nDbgNR := Form_Dm.GetNewExpFssNR;
    qryPgrNR.AsInteger := nDbgNR;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popPgrPopup(Sender: TObject);
begin
  popPgrEdt.Enabled := qryPgr.RecordCount > 0;
  popPgrDel.Enabled := qryPgr.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popPgrDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes then
    qryPgr.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.qryPgrAfterPost(DataSet: TDataSet);
var nDbgNR : integer;
begin
  if qryPgr.UpdatesPending then
    Form_DM.DbMain.ApplyUpdates([qryPgr]);
  with qryPgr do begin
    nDbgNR := qryPgrNR.AsInteger;
    Close;
    Open;
    Locate('NR', nDbgNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.qryPgrAfterDelete(DataSet: TDataSet);
begin
  if qryPgr.UpdatesPending then
    Form_DM.DbMain.ApplyUpdates([qryPgr]);
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.sbtnF8Click(Sender: TObject);
// var i : smallint;
begin
  with qryVbln do begin
    If (FieldByName('DtZ').IsNull) or
                              (FieldByName('DtZ').AsString = '') then begin
      Edit;
      {
      i := LbxF8.Items.IndexOf(FieldByName('NR').AsString);
      if i < 0 then begin
        FieldByName('NrZ').AsInteger := nNrZ;
        lbxF8.Items.Add(FieldByName('NR').AsString); end
      else begin
        FieldByName('NrZ').AsString := '';
        lbxF8.Items.Delete(i);
      end;
      }
      if FieldByName('NrZ').AsInteger = n_NrZ then
        FieldByName('NrZ').AsString := ''
      else
        FieldByName('NrZ').AsInteger := n_NrZ;
      Post;
    end;
    if not EOF then
      Next
    else
      dbgrVbln.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.sBtnF8_2Click(Sender: TObject);
var i : smallint;
begin
  with qryPgr do begin
    If (FieldByName('DtZ').IsNull) or
                              (FieldByName('DtZ').AsString = '') then begin
      Edit;
      i := LbxF8_2.Items.IndexOf(FieldByName('NR').AsString);
      if i < 0 then begin
        FieldByName('NrZ').AsInteger := n_NrZ;
        lbxF8_2.Items.Add(FieldByName('NR').AsString); end
      else begin
        FieldByName('NrZ').AsString := '';
        lbxF8_2.Items.Delete(i);
      end;
      Post;
    end;
    if not EOF then
      Next
    else
      dbgrPgr.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.qryVBlnAfterPost(DataSet: TDataSet);
begin
 if qryVbln.UpdatesPending  then
   Form_DM.DbMain.ApplyUpdates([qryVbln]);
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.dbgrVBlnDblClick(Sender: TObject);
begin
  sBtnF8.Click;
end;

//------------------------------------------------------------------------------
function TFormShowBln.GetNewNrZ(dDtPrc: TDateTime): smallint;
begin
  with qryZNr do begin
    If Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(NrZ) MaxZ from Z_Vbln where DtProc = :dDtPrc and not DtZ is null');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    If RecordCount > 0 then
      Result     := FieldByName('MaxZ').AsInteger + 1
    else
      Result     := 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

//------------------------------------------------------------------------------
function TFormShowBln.GetActiveNrZ: integer;
var
  Query: TQuery;
begin
  Query := TQuery.Create(nil);
  QryUtils.InitQuery(Query);
  
  with Query do begin
    SQL.Add(
      'select Max(NrZ) NrZ ' +
      'from Z_VBln ' +
      'where DtZ is null and not NrZ is null');
    Open;
    Result := FieldByName('NrZ').AsInteger;
  end;
  
  Query.Free;
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.popMetkiSetClick(Sender: TObject);
var NsvNr        : integer;
begin
  NsvNr          := qryVblnNr.AsInteger;
  with qryVbln do begin
    DisableControls;
    onCalcFields := nil;
    First;
    while not EOF do begin
      if qryVblndtz.IsNull then begin
        Edit;
        qryVblnNrZ.AsInteger := n_NrZ;
        Post;
      end;
      Next;
    end;
    EnableControls;
    onCalcFields  :=  qryVBlnCalcFields;
    Locate('NR',NsvNr,[]);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.popMetkiClearClick(Sender: TObject);
var NsvNr : integer;
begin
  NsvNr := qryVblnNr.AsInteger;
  with qryVbln do begin
    DisableControls;
    onCalcFields := nil;
    First;
    while not EOF do begin
      if qryVblndtz.IsNull then begin
        Edit;
        qryVblnNrZ.AsString := '';
        Post;
      end;
      Next;
    end;
    EnableControls;
    OnCalcFields  :=  qryVBlnCalcFields;
    Locate('NR',NsvNr,[]);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.Memo1Change(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------
procedure TFormShowBln.sbtnHlpClick(Sender: TObject);
begin
  PanelHlp.Visible := not PanelHlp.Visible;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.sbtnHlpCloseClick(Sender: TObject);
begin
  PanelHlp.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.FormResize(Sender: TObject);
begin
  PanelHlp.Left := Round((Width - PanelHlp.Width) / 2);
  PanelHlp.Top := Round((Height - PanelHlp.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormShowBln.dbgrPgrDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrPgr.Canvas do begin
    //cNmFld := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if (qryPgrNrZ.AsInteger > 0) and (qryPgrDtZ.AsString = '' ) then
        Brush.Color := clMoneyGreen
      else if (qryPgrNrZ.AsInteger > 0) and (qryPgrDtZ.AsString > '' ) then
        Brush.Color := clSkyBlue;
    end;
  end;
  dbgrPgr.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.popPrintPopup(Sender: TObject);
var
  StoreNr: integer;
begin
  PopPrintRegistry.Enabled := QryVBln.Active and (QryVBln.RecordCount > 0);

  // Теперь заявка формируется вместе с приложениями 1.1 и 1.3
  PopPrintRequest.Visible := false;

  PopPrintExportXML.Enabled := false;
  ExportToJson.Enabled := false;

  with QryVbln do begin
    DisableControls;
    StoreNr := FieldByName('NR').AsInteger;
    First;

    while not Eof do begin
      if (FieldByName('NRZ').AsInteger > 0)
          and (FieldByName('DTZ').AsString = '') then begin
        PopPrintExportXML.Enabled := true;
        ExportToJson.Enabled := true;
        break;
      end;
      Next;
    end; {while}
    
    Locate('NR', StoreNr, []);
    EnableControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.popPrintReestClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_REE2, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.N2Click(Sender: TObject);
var nNRc : integer;
begin
  if qryTmp.Active then qryTmp.Close;
  qryTmp.DataBaseName := CESMAIN;
  qryTmp.SQL.Clear;
  qryTmp.SQL.Add('Update Z_VBln Set Dtz = null, Nrz = 0 where NR = :cNmSch');
  qryVbln.First;
  while not qryVbln.EOF do begin
    nNrC := qryVbln.FieldByName('Nr').AsInteger;
    qryTmp.ParamByName('cNmSch').AsInteger := nNRc;
    qryTmp.Open;
    qryTmp.Close;
    qryVbln.Next;
  end;
  qryTmp.Close;
  qryTmp.SQL.Clear;
  qryTmp.DataBaseName := '';
end;

procedure TFormShowBln.NUnmarkGroupClick(Sender: TObject);
var
  nNrZ: integer;
  dDtZ: TDateTime;
  storedNr: integer;
begin
  nNrZ := qryVBln.FieldByName('NRZ').AsInteger;
  dDtZ := qryVBln.FieldByName('DTZ').AsDateTime;

  InitQuery(qryTmp);
  with qryTmp do begin
    SQL.Add('UPDATE Z_VBLN SET NRZ = 0, DTZ = NULL WHERE NRZ = :NRZ AND DTZ=:DTZ');
    ParamByName('NRZ').AsInteger := nNrZ;
    ParamByName('DTZ').AsDateTime := dDtZ;
    ExecSQL;
  end;
  ReleaseQuery(qryTmp);

  with qryVBln do begin
    DisableControls;

    storedNr := FieldByName('NR').AsInteger;
    First;
    while not Eof do begin
      if (FieldByName('NRZ').AsInteger = nNrZ) and (FieldByName('DTZ').AsDateTime = dDtZ) then begin
        Edit;
        FieldByName('NRZ').AsString := '';
        FieldByName('DTZ').AsString := '';
        Post;
      end;
      Next;
    end;
    Locate('NR', storedNr, []);

    EnableControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.NPrintProtCommonClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_PROT, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.NPrintProtByZajavkClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_SPLIT_PROT, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
// Печать Приложения 1.1 общего
//------------------------------------------------------------------------------
procedure TFormShowBln.NPrintNotesCommonClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_APPX1, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
// Печать Приложения 1.1 в разрезе заявок
//------------------------------------------------------------------------------
procedure TFormShowBln.NPrintNotesByZajavkClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_SPLIT_APPX1, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
// Печать Приложения 1.2 общего
//------------------------------------------------------------------------------
procedure TFormShowBln.NPrintAppdx2CommonClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_APPX2, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
// Печать Приложения 1.2 в разрезе заявок
//------------------------------------------------------------------------------
procedure TFormShowBln.NPrintAppdx2SeparatedClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_SPLIT_APPX2, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
// Печать Приложения 1.3 общего
//------------------------------------------------------------------------------
procedure TFormShowBln.NPrintAppdx3CommonClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_APPX3, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
// Печать Приложения 1.3 в разрезе заявок
//------------------------------------------------------------------------------
procedure TFormShowBln.NPrintAppdx3SeparatedClick(Sender: TObject);
begin
  ZajavkaFss(dDtProc, PRTMODE_SPLIT_APPX3, 0, Date); {z_FssTvp}
end;

//------------------------------------------------------------------------------
// Печать XML 1.1
//------------------------------------------------------------------------------
procedure TFormShowBln.NXml11Click(Sender: TObject);
begin
  ExportRequestCalc(PRTMODE_XML_DESEASE);
end;

//------------------------------------------------------------------------------
// Печать XML 1.3
//------------------------------------------------------------------------------
procedure TFormShowBln.NXml13Click(Sender: TObject);
begin
  ExportRequestCalc(PRTMODE_XML_ACCIDENT);
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.JsonDeseaseClick(Sender: TObject);
begin
  ExportRequestCalc(PRTMODE_JSON_DESEASE);
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.JsonPregnacyClick(Sender: TObject);
begin
  ExportRequestCalc(PRTMODE_JSON_PREGNACY);
end;

//------------------------------------------------------------------------------
procedure TFormShowBln.JsonAccidentClick(Sender: TObject);
begin
  ExportRequestCalc(PRTMODE_JSON_ACCIDENT);
end;

//------------------------------------------------------------------------------
// Печать XML
//------------------------------------------------------------------------------
procedure TFormShowBln.ExportRequestCalc(PrtMode: word);
var
  dDtPrc, dDtZ: TDateTime;
  nNrZL, nSvNr: integer;
begin
  nSvNr  := qryVblnNr.AsInteger;
  nNrzL  := GetActiveNrZ; // qryVblnNrZ.AsInteger;
  dDtz   := dDtProc; // qryVblnDtZ.AsDateTime;
  dDtPrc := dDtProc;

  ZajavkaFss(dDtPrc, PrtMode, nNrzL, dDtz);

  if dDtz = 0 then
    dDtz := Date;
  with qryUpd do begin
    If Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update z_Vbln Set Dtz = :dDtZ where nrZ = :nNrz');
    ParamByName('dDtZ').AsDateTime := dDtZ;
    ParamByName('nNrZ').AsInteger  := nNrZL;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryUpd do begin
    If Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update z_Exp_Fss Set Dtz = :dDtZ where nrZ = :nNrz');
    ParamByName('dDtZ').AsDateTime := dDtZ;
    ParamByName('nNrZ').AsInteger  := nNrZL;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryVbln do begin
    Close;
    OPen;
    Locate('Nr', nSvNr, []);
  end;
  with qryVbln do begin
    Close;
    OPen;
  end;
  n_NrZ := GetNewNrZ(dDtPrc);
end;

end.

