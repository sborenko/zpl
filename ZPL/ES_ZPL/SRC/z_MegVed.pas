unit z_MegVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Menus, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids,
  DBTables, Provider, DBClient, DBCtrls, ComCtrls, Mask;

type
  String4 = String[4];
  TFormMegVed = class(TForm)
    qryVed: TQuery;
    dsrcVed: TDataSource;
    qryVedNR: TIntegerField;
    qryVedDTPROC: TDateTimeField;
    qryVedKDSPS: TSmallintField;
    qryVedKDOBJ: TSmallintField;
    qryVedTYPEVED: TStringField;
    qryVedVEDNR: TIntegerField;
    qryVedVEDDATE: TDateTimeField;
    qryVedPRTVEDNR: TIntegerField;
    qryVedPRTVEDDATE: TDateTimeField;
    qryVedNOTES: TStringField;
    popVed: TPopupMenu;
    popHead: TMenuItem;
    popVed_Add: TMenuItem;
    popVedDel: TMenuItem;
    qryOtkl: TQuery;
    dsrcOtkl: TDataSource;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklOLDKDVIDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklNOTES: TStringField;
    qryOtklOLDKDOBJ: TSmallintField;
    qryOtklPRR: TSmallintField;
    qryOtklPRPV: TSmallintField;
    qryOtklKTO: TSmallintField;
    qryOtklPRKR: TSmallintField;
    qryOtklSPEC_NR: TIntegerField;
    qryOtklDTVDPV: TDateTimeField;
    qryOtklNRVDPV: TIntegerField;
    qryOtklMYNOTES: TStringField;
    qryOtklSPECPS: TIntegerField;
    qryOtklFamIO: TStringField;
    qryOtklShVidN: TStringField;
    popOtkl: TPopupMenu;
    popOtklAddSps: TMenuItem;
    popOtklHead: TMenuItem;
    updVed: TUpdateSQL;
    popVedEdt: TMenuItem;
    qryVedVEDHEAD: TStringField;
    qryTmp: TQuery;
    popOtklAddAndRsch: TMenuItem;
    updOtkl: TUpdateSQL;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    popOtklDelRec: TMenuItem;
    qryRS: TQuery;
    cdsPrt: TClientDataSet;
    dspPrt: TDataSetProvider;
    qryOtklSchBU: TStringField;
    popPrt: TPopupMenu;
    popPrtKss: TMenuItem;
    popPrtBnk: TMenuItem;
    popPrtBnkOneVed: TMenuItem;
    popPrtHead: TMenuItem;
    qryVedPRPODKL: TSmallintField;
    popOtklSep1: TMenuItem;
    popOtklFon: TMenuItem;
    popOtklFont: TMenuItem;
    popVedSep1: TMenuItem;
    popVedFon: TMenuItem;
    popVedFont: TMenuItem;
    qryOtklShObj: TStringField;
    qryOtklShKatP: TStringField;
    qryOtklPSch: TStringField;
    PageControl: TPageControl;
    qryOtklPBNK: TSmallintField;
    popBnk: TPopupMenu;
    popBnkHead: TMenuItem;
    popBnkBySpZ: TMenuItem;
    popBnkByObj: TMenuItem;
    popBnkOneVed: TMenuItem;
    popVedAddPredVupl: TMenuItem;
    popVedAddPartVupl: TMenuItem;
    popVedAddOstVupl: TMenuItem;
    ts1: TTabSheet;
    PanelLeft: TPanel;
    LabelVedNr: TLabel;
    dbgrVed: TDBGrid;
    Splitter1: TSplitter;
    PanelTools: TPanel;
    sBtnAllMes: TSpeedButton;
    sBtnCurMes: TSpeedButton;
    sBtnPrt: TSpeedButton;
    sBtnApply: TSpeedButton;
    LabelCntOtklRec: TLabel;
    sBtnSave: TSpeedButton;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    dbgrOtkl: TDBGrid;
    ts2: TTabSheet;
    cdsPV: TClientDataSet;
    dsrcPV: TDataSource;
    cdsPVNR: TAutoIncField;
    cdsPVTabN: TIntegerField;
    cdsPVFamIO: TStringField;
    cdsPVSmOsnV: TFloatField;
    cdsPVSmPrem: TFloatField;
    cdsPVSmOtpTM: TFloatField;
    cdsPVSmOtpBM: TFloatField;
    cdsPVSmOtpNI: TFloatField;
    cdsPVSmNach: TFloatField;
    cdsPVSmUdrg: TFloatField;
    cdsPVSmVupl: TFloatField;
    cdsPVSm_OsnV: TFloatField;
    cdsPVSm_Prem: TFloatField;
    cdsPVSm_OtpTM: TFloatField;
    cdsPVSm_OtpBM: TFloatField;
    cdsPVSm_OtpNI: TFloatField;
    cdsPVSm_Nach: TFloatField;
    cdsPVSmRasch: TFloatField;
    cdsPVSmOper: TFloatField;
    cdsPVSmOst: TFloatField;
    cdsPVK_t: TFloatField;
    PanelTs2Tools: TPanel;
    SpeedButton6: TSpeedButton;
    sBtnSaveVed1: TSpeedButton;
    SpeedButton8: TSpeedButton;
    bBtnBack2: TBitBtn;
    DBNavigator3: TDBNavigator;
    SpeedButton2: TSpeedButton;
    sBtnSpisok: TSpeedButton;
    sBtnSumKVupl: TSpeedButton;
    sBtnShwZadanie: TSpeedButton;
    LabelDbg: TLabel;
    sBtnInfo: TSpeedButton;
    dbgrPv: TDBGrid;
    cdsPVKdObj: TSmallintField;
    LbxObj: TListBox;
    LbxKatP: TListBox;
    PanelWait: TPanel;
    cdsPVKdKatP: TSmallintField;
    cdsPVKdBnk: TSmallintField;
    cdsPVLS: TStringField;
    PanelInf: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LabelCntBnk: TLabel;
    LabelSmBnk: TLabel;
    LabelCntKss: TLabel;
    LabelSmKss: TLabel;
    sBtnInfClose: TSpeedButton;
    Label15: TLabel;
    LabelCntTts: TLabel;
    LabelSmTts: TLabel;
    popVedAdd: TMenuItem;
    popPrtKssOneVed: TMenuItem;
    popPrtKssByObj: TMenuItem;
    qryVedBNKDTPRDF: TDateTimeField;
    qryVedBNKNRPRDF: TSmallintField;
    qryVedBNKNMPRDF: TStringField;
    qryVedKSSVEDDT: TDateTimeField;
    qryVedKSSVEDNR: TSmallintField;
    qryVedKSSVEDNM: TStringField;
    popPrtBnkByObj: TMenuItem;
    cdsPVSmBoln: TFloatField;
    cdsPVSm_Boln: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popVedPopup(Sender: TObject);
    procedure sBtnAllMesClick(Sender: TObject);
    procedure sBtnCurMesClick(Sender: TObject);
    procedure popVedAddClick(Sender: TObject);
    procedure popVedEdtClick(Sender: TObject);
    procedure popVedDelClick(Sender: TObject);
    procedure qryVedBeforePost(DataSet: TDataSet);
    procedure qryVedAfterPost(DataSet: TDataSet);
    procedure qryVedAfterDelete(DataSet: TDataSet);
    procedure popOtklPopup(Sender: TObject);
    procedure popOtklAddSpsClick(Sender: TObject);
    procedure popOtklAddAndRschClick(Sender: TObject);
    procedure qryOtklCalcFields(DataSet: TDataSet);
    procedure qryOtklNewRecord(DataSet: TDataSet);
    procedure qryOtklAfterPost(DataSet: TDataSet);
    procedure qryNUCalcFields(DataSet: TDataSet);
    procedure dsrcVedDataChange(Sender: TObject; Field: TField);
    procedure popOtklDelRecClick(Sender: TObject);
    procedure qryOtklTABNValidate(Sender: TField);
    procedure PanelRightResize(Sender: TObject);
    procedure sBtnApplyClick(Sender: TObject);
    procedure qryOtklAfterDelete(DataSet: TDataSet);
    procedure sBtnPrtClick(Sender: TObject);
//    procedure popBySpZClick(Sender: TObject);
//    procedure popByObjClick(Sender: TObject);
//    procedure popOneVedClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrVedDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popOtklFonClick(Sender: TObject);
    procedure popOtklFontClick(Sender: TObject);
    procedure qryVedBeforeScroll(DataSet: TDataSet);
    procedure qryVedAfterScroll(DataSet: TDataSet);
    procedure sBtnSaveClick(Sender: TObject);
    procedure popBnkBySpZClick(Sender: TObject);
    procedure popVedAddPartVuplClick(Sender: TObject);
    procedure popVedAddOstVuplClick(Sender: TObject);
    procedure popVedAddPredVuplClick(Sender: TObject);
    procedure cdsPVBeforePost(DataSet: TDataSet);
    procedure sBtnShwZadanieClick(Sender: TObject);
    procedure dbgrPVDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sBtnSpisokClick(Sender: TObject);
    procedure sBtnSumKVuplClick(Sender: TObject);
    procedure sBtnSaveVed1Click(Sender: TObject);
    procedure sBtnInfoClick(Sender: TObject);
    procedure sBtnInfCloseClick(Sender: TObject);
    procedure bBtnBack2Click(Sender: TObject);
    procedure popPrtKssOneVedClick(Sender: TObject);
    procedure popPrtKssByObjClick(Sender: TObject);
    procedure popPrtBnkOneVedClick(Sender: TObject);
    procedure popPrtBnkByObjClick(Sender: TObject);
  private
    { Private declarations }
    nVedKdSpZ : SmallInt;
    d_DtPrc : TDateTime;
    nSvVedNR, n_VedNR, n_KdSps, n_KdUsr : integer;
    bAllMes : boolean;
    mFonColor : TColor;
    cFontName : ShortString;
    nFontSize : SmallInt;
    bFontItalic, bFontBold : boolean;
    nPrcOsnV, nPrcPrem, nPrcOtpTM, nPrcOtpBM, nPrcOtpNI : double;
    bNeedSave, bNewVedSaved : boolean;
    procedure SetTabsFont;
    procedure OpenQryVed(dDtPrc : TDateTime);
    function NewVedNR : integer;
    function NewPrtVedNR(dDtPrc : TDateTime) : integer;
    procedure RefeshLabelCntRec;
    function GetSmNU(nTabN, nKdSpZ : integer; dDtProc : TDateTime;
                                   cVidN : string4; nSmPrc : double) : double;
    procedure SetDbgrPVColumns;
    procedure DelCdsPVSmFields;
    procedure DoRaschet;
  public
    { Public declarations }
  end;

procedure ShwMegVed(nKdSps, nKdUsr : integer; dDtPrc : TDateTime);

const SECTION = 'z_MegVed';

var
  FormMegVed: TFormMegVed;

implementation

uses a_Const, a_DM, z_DM, z_Main, a_Lib,
     z_EMgVed, z_VbObKt, z_VvZdSm, z_MgVdZd, Z_RsOld, z_CmnPrt, z_BDpInf;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwMegVed(nKdSps, nKdUsr : integer; dDtPrc : TDateTime);
begin
  FormMegVed := TFormMegVed.Create(Application);
  with FormMegVed do begin
    Caption := 'Ведомости межвыплат';
    bAllMes := false;
    bNeedSave := false;
    d_DtPrc := dDtPrc;
    n_KdSps := nKdSps;
    n_KdUsr := nKdUsr;
    LabelVedNr.Caption := '';
    OpenQryVed(dDtPrc);
    if nSvVedNR <> 0 then
      qryVed.Locate('VedNR', nSvVedNR, []);
    if bFlagDbg then
      Show
    else begin
      ShowModal;
      Free;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.OpenQryVed(dDtPrc : TDateTime);
begin
  with qryOtkl do begin
    if Active then
      Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    DataSource := dsrcVed;
    SQL.Add('Select * from Z_Otkl where DtProc = :DtProc and ' +
            ' KdSps = :KdSps and NrVdPv = :VedNr and DtVdPv = :VedDate and ' +
            ' VidN > "7500" and VidN < "7520" order by TabN ');
  end;
  bAllMes := true;
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_VedNR ');
    if sBtnCurMes.Down then begin
      SQL.Add(' where DtProc = :dDtPrc ');
      bAllMes := false;
    end;
    SQL.Add('order by VedNR, DtProc, VedDate');
    if sBtnCurMes.Down then
      ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
  qryOtkl.Open;
(*
  with qryNu do begin
    if Active then
      Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    DataSource := dsrcVed;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, n.* ' +
            ' from viNu_Main n Left Outer Join z_Upi u on u.TabN = n.TabN ' +
            ' where n.DtProc = :DtProc and n.Spec_NR = :VedNR ' +
            ' order by n.TabN');
  end;
*)
//  qryNu.Open;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 575);
    Width  := ReadInteger(SECTION, 'wW', 700);
    mFonColor := ReadInteger(SECTION, 'FonClr', clWindow);
    cFontName := ReadString(SECTION, 'c_FN', 'Arial');
    nFontSize := ReadInteger(SECTION, 'c_FS', 10);
    bFontBold := ReadBool(SECTION, 'b_FB', false);
    bFontItalic := ReadBool(SECTION, 'b_FI', false);
    PanelLeft.Width := ReadInteger(SECTION, 'grVedW', 250);
//    dbgrNu.Height := ReadInteger(SECTION, 'grNuH', 190);
    sBtnCurMes.Down := ReadBool(SECTION, 'bCurMes', true);
    nSvVedNR := ReadInteger(SECTION, 'nSvVedNR', 0);
    Free;
  end;
  LabelVedNr.Visible := false;  // bFlagDbg;
  SetTabsFont;
  LabelCntOtklRec.Caption := '';
  if FileExists(cDirVids + 'MgVed1.vid') then
    dbgrVed.Columns.LoadFromFile(cDirVids + 'MgVed1.vid');
  if FileExists(cDirVids + 'MgVed2.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'MgVed2.vid');
  if FileExists(cDirVids + 'MgVed3.vid') then
    dbgrPV.Columns.LoadFromFile(cDirVids + 'MgVed3.vid');
  dbgrOtkl.Color := mFonColor;
  dbgrVed.Color  := mFonColor;
  dbgrPV.Color  := mFonColor;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  PageControl.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.BitBtn1Click(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.SetTabsFont;
var mFontStyle : TFontStyles;
begin
  if bFontItalic and bFontBold then
    mFontStyle := [fsBold, fsItalic]
  else if bFontBold then
    mFontStyle := [fsBold]
  else if bFontItalic then
    mFontStyle := [fsItalic]
  else
    mFontStyle := [];
  dbgrVed.Font.Name       := cFontName;
  dbgrOtkl.Font.Name      := cFontName;
  dbgrPV.Font.Name        := cFontName;
  dbgrVed.TitleFont.Name  := cFontName;
  dbgrOtkl.TitleFont.Name := cFontName;
  dbgrPV.TitleFont.Name   := cFontName;
  dbgrVed.Font.Size       := nFontSize;
  dbgrOtkl.Font.Size      := nFontSize;
  dbgrPV.Font.Size        := nFontSize;
  dbgrVed.TitleFont.Size  := nFontSize;
  dbgrOtkl.TitleFont.Size := nFontSize;
  dbgrPV.TitleFont.Size   := nFontSize;
  dbgrVed.Font.Style      := mFontStyle;
  dbgrOtkl.Font.Style     := mFontStyle;
  dbgrPV.Font.Style       := mFontStyle;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var nDlgResult : word;
begin
  if sBtnApply.Enabled then begin
    nDlgResult := MessageDlg('Изменения не сохранены на диск. Сохранить?:',
                                       mtWarning, [mbYes, mbNo, mbCancel], 0);
    if nDlgResult = mrYes then begin
      if qryOtkl.UpdatesPending then
      qryOtkl.ApplyUpdates; end
    else if nDlgResult = mrCancel then begin
      ModalResult := mrNone;
      CanClose := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVed.Columns.SaveToFile(cDirVids + 'MgVed1.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'MgVed2.vid');
  dbgrPV.Columns.SaveToFile(cDirVids + 'MgVed3.vid');
  with TIniFile.Create(cNmIniFile) do begin
    if qryVed.Active and (qryVed.RecordCount > 0) then
      WriteInteger(SECTION, 'nSvVedNR', qryVed.FieldByName('VedNR').AsInteger);
    WriteBool(SECTION, 'bCurMes', sBtnCurMes.Down);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grVedW', PanelLeft.Width);
//    WriteInteger(SECTION, 'grNuH', dbgrNu.Height);
    WriteInteger(SECTION, 'FonClr', mFonColor);
    WriteString(SECTION, 'c_FN', cFontName);
    WriteInteger(SECTION, 'c_FS', nFontSize);
    WriteBool(SECTION, 'b_FB', bFontBold);
    WriteBool(SECTION, 'b_FI', bFontItalic);
    Free;
  end;
  if bFlagDbg then
    Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popVedPopup(Sender: TObject);
begin
  popVedEdt.Enabled := qryVed.Active and (qryVed.RecordCount > 0) and
                      (qryVed.FieldByName('DtProc').AsDateTime = d_DtPrc) and
                       (qryVedPrPodkl.IsNull or (qryVedPrPodkl.AsInteger <> 1));
  popVedDel.Enabled := popVedEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnAllMesClick(Sender: TObject);
begin
  if sBtnAllMes.Down and not bAllMes then
    OpenQryVed(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnCurMesClick(Sender: TObject);
begin
  if sBtnCurMes.Down and bAllMes then
    OpenQryVed(d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popVedAddClick(Sender: TObject);
var nY, nM, nD : word;  nSvNR, nVedNR : integer;
begin
  DecodeDate(d_DtPrc, nY, nM, nD);
  with qryVed do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('TypeVed').AsString := 'MegVed';
    FieldByName('DtProc').AsDateTime := d_DtPrc;
    FieldByName('KdSps').AsInteger := n_KdSps;
    nVedNR := NewPrtVedNR(d_DtPrc);
    FieldByName('PrtVedNr').AsInteger := nVedNR;
    FieldByName('PrtVedDate').AsDateTime := Date;
    FieldByName('VedDate').AsDateTime := Date;
    FieldByName('VedHead').AsString := 'Ведомость на выплату зарплаты за ' +
                                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    FieldByName('BnkNrPrdF').AsInteger := nVedNR;
    FieldByName('BnkDtPrdF').AsDateTime := Date;
    FieldByName('BnkNmPrdF').AsString := 'Ведомость на выплату зарплаты за ' +
                                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    FieldByName('KssVedNr').AsInteger := nVedNR;
    FieldByName('KssVedDt').AsDateTime := Date;
    FieldByName('KssVedNm').AsString := 'Ведомость на выплату зарплаты за ' +
                                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    FieldByName('Notes').AsString := 'Примечание';
    if AddEdtMegVed {z_EMgVed} then begin
      Post;
      if cdsPV.Active then cdsPV.Close;
      PageControl.ActivePage := ts2;
      // Тут надо сделать так, чтобы, если вернулись назад без сохранения
      // результатов - заголовок удалялся без распросов.

      LabelDbg.Caption := 'DtVdPV = ' + qryVedVedDate.AsString +
                          ', NrVedPV = ' + qryVedVedNr.AsString;
      LabelDbg.Visible := bFlagDbg;
      sBtnSpisok.Enabled := true;
      sBtnSumKVupl.Enabled := false;
      sBtnShwZadanie.Enabled := false;
      sBtnInfo.Enabled := false;
      sBtnSaveVed1.Enabled := false;
      bNewVedSaved := false;
      dbgrPV.SetFocus; end
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popVedEdtClick(Sender: TObject);
begin
  with qryVed do begin
    Edit;
    if AddEdtMegVed {z_EMgVed} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popVedDelClick(Sender: TObject);
var cMsg : string;
begin
  cMsg := 'Будет удален заголовок ведомости и все записи из' + #13#10 +
          'таблицы отклонений, содержащиеся в этой ведомости' + #13#10 +
          '(правая таблица). После этого нужно вручную пересчи-' + #13#10 +
          'тать всех сотрудников правой таблицы.    Согласны?:';
  if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    qryVed.Delete;
end;
//------------------------------------------------------------------------------
function TFormMegVed.NewVedNR : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from GetNewVedNr');
    Open;
    Result := FieldByName('NewVedNr').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormMegVed.NewPrtVedNR(dDtPrc : TDateTime) : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select Max(PrtVedNR) as MaxNR from Z_VedNR ' +
            ' where DtProc = :d_DtPrc');
    ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
    Open;
    if (RecordCount > 0) and (not FieldByName('MaxNR').IsNull) then
      Result := FieldByName('MaxNR').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryVedBeforePost(DataSet: TDataSet);
begin
  if qryVed.State = dsInsert then begin
    n_VedNR := NewVedNR;
    qryVed.FieldByName('VedNR').AsInteger := n_VedNR; end
  else
    n_VedNR := qryVed.FieldByName('VedNR').AsInteger;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryVedAfterPost(DataSet: TDataSet);
begin
  with qryVed do begin
    ApplyUpdates;
    Close;
    Open;
    Locate('VedNR', n_VedNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryVedAfterDelete(DataSet: TDataSet);
begin
  qryVed.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popOtklPopup(Sender: TObject);
begin
  popOtklAddSps.Enabled := qryVed.Active and (qryVed.RecordCount > 0) and
                       (qryVed.FieldByName('DtProc').AsDateTime = d_DtPrc) and
                                (qryVed.FieldByName('PrPodkl').AsInteger <> 1);
  popOtklAddAndRsch.Enabled := popOtklAddSps.Enabled;
  popOtklDelRec.Enabled := qryVed.Active and (qryVed.RecordCount > 0) and
                        (qryVed.FieldByName('PrPodkl').AsInteger <> 1) and
                        (qryVed.FieldByName('DtProc').AsDateTime = d_DtPrc) and
                        qryOtkl.Active and (qryOtkl.RecordCount > 0);
end;
(*
select S.TabN as S_TABN, s.KdObj as s_KdObj, P.*
from Z_SPS S
  Left Outer join GET_PERE(S.TabN, S.DtProc) p on 1 = 1
where s.DtProc = '03-01-2006'
order by s.KdObj, TabN   (около 2 секунд на весь список, при выборках меньше)
*)
//------------------------------------------------------------------------------
procedure TFormMegVed.popOtklAddSpsClick(Sender: TObject);
var mLstObj, mLstKatP : TStringList; cVidN : string4; nSmPrc, nSmVed : double;
    cSQL : string; i, nAddCnt : integer; nSumCase : word;
    nNrVed : integer; dDtVed, dDtLastDOM : TDateTime;
    nY, nM, nD : word;
begin
  mLstObj := TStringList.Create;
  mLstKatP := TStringList.Create;
  nNrVed := qryVedVedNr.AsInteger;
  dDtVed := qryVedVedDate.AsDateTime;
  if VbObjKatToMegVed('Выбор подразделений и персонала для ведомости',
                     n_KdSps, d_DtPrc, mLstObj, mLstKatP) {z_VbObKt} then begin

  end;
(*
  if VvSpsDlg(n_KdSps, n_KdUsr, nNrVed, dDtVed, d_DtPrc, mLstObj, mLstKatP,
                               cVidN, nSmPrc, nSumCase) {z_VvMgVd} then begin
    if nSumCase = 6 then with qryVed do begin {Переоткрыть qryVed}
      Screen.Cursor := crSQLWait;
      Close;
      Open;
      Locate('VedNr', nNrVed, []);
      Screen.Cursor := crDefault; end
    else begin
      dDtLastDOM := MyLastDOM(d_DtPrc);
      Screen.Cursor := crSQLWait;
      PanelWait.Top := Round((dbgrOtkl.Height - PanelWait.Height) / 2);
      PanelWait.Left := Round((dbgrOtkl.Width - PanelWait.Width) / 2);
      PanelWait.Visible := true;
      Application.ProcessMessages;
      // Из Z_Pere запрашиваем состояние на конец месяца dDtLastDOM
      cSQL := 'Select S.TabN as S_TABN, s.KdObj as s_KdObj, ' +
              ' s.KdSps as s_KdSps, P.* from Z_SPS S ' +
              ' Left Outer join GET_PERE(S.TabN, :dDtLastDOM) p on 1 = 1' +
              ' where s.DtProc = :d_DtPrc ';
      if mLstObj.Count > 0 then begin
        cSQL := cSQL + ' and s.KdObj in (';
        for i := 0 to mLstObj.Count-1 do begin
          cSQL := cSQL + mLstObj[i];
          if i < (mLstObj.Count-1) then
            cSQL := cSQL + ', ';
        end;
        cSQL := cSQL + ')';
      end;
      if mLstKatP.Count > 0 then begin
        cSQL := cSQL + ' and s.KdKatP in (';
        for i := 0 to mLstKatP.Count-1 do begin
          cSQL := cSQL + mLstKatP[i];
          if i < (mLstKatP.Count-1) then
            cSQL := cSQL + ', ';
        end;
        cSQL := cSQL + ')';
      end;
      with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESZPL;
        SQL.Add(cSQL);
        SQL.Add(' order by s.KdObj, s.TabN ');
        ParamByName('dDtLastDOM').AsDateTime := dDtLastDOM;
        ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
        if bFlagDbg then
          SQL.SaveToFile(cDirTemp + 'MgVedAdd.sql');
        Open;
        qryOtkl.DisableConstraints;
        qryOtkl.AutoCalcFields := false;
        dsrcOtkl.DataSet := nil;
        nAddCnt := 0;
        while not Eof do begin
          if (nSumCase = 1) then
            nSmVed := 0
          else if (nSumCase = 2) and (nSmPrc <> 0) then
            nSmVed := -nSmPrc
          else if (nSumCase = 3) and (nSmPrc <> 0) then
            nSmVed := -MyRound(nSmPrc * FieldByName('OklTrf').AsFloat / 100, 2)
          else if (nSumCase = 4) and (nSmPrc <> 0) then
//          nSmVed := -MyRound(nSmPrc * FieldByName('OklTrf').AsFloat / 100, 2)
          else if (nSumCase = 5) and (nSmPrc <> 0) and (cVidn <> '') then
            nSmVed := -GetSmNU(FieldByName('TabN').AsInteger,
                       FieldByName('KdSpZ').AsInteger, d_DtPrc, cVidN, nSmPrc);
          if (FieldByName('TabN').AsInteger <> 0) and
                                   ((nSumCase = 1) or (nSmVed <> 0)) then begin
            qryOtkl.Append;
            qryOtkl.FieldByName('TabN').AsInteger :=
                                                 FieldByName('TabN').AsInteger;
            qryOtkl.FieldByName('KdObj').AsInteger :=
                                              FieldByName('s_KdObj').AsInteger;
            qryOtkl.FieldByName('KdKatP').AsInteger :=
                                               FieldByName('KdKatP').AsInteger;
            qryOtkl.FieldByName('KdSpZ').AsInteger :=
                                                FieldByName('KdSpZ').AsInteger;
            if nSmVed <> 0 then
              qryOtkl.FieldByName('Summa').AsFloat := nSmVed;
            qryOtkl.Post;
            Inc(nAddCnt);
          end;
          Next;
        end;
        Close;
        SQL.Clear;
        DataBaseName := '';
        qryOtkl.AutoCalcFields := true;
        qryOtkl.EnableConstraints;
        dsrcOtkl.DataSet := qryOtkl;
        PanelWait.Visible := false;
        RefeshLabelCntRec;
        ShowMessage('Добавлено сотрудников: ' + IntToStr(nAddCnt));
      end;
    end;
    //    sBtnApply.Enabled := true;
    end
  else begin
//    ShowMessage('Вернулись порожними');
  end;
*)
  Screen.Cursor := crDefault;
  mLstObj.Destroy;
  mLstKatP.Destroy;
end;
//------------------------------------------------------------------------------
function TFormMegVed.GetSmNU(nTabN, nKdSpZ : integer; dDtProc : TDateTime;
                                   cVidN : string4; nSmPrc : double) : double;
var n_KdObj, n_KdKatP, n_KdSpZ : SmallInt; c_VidDbg : string4;
    nSmVida, nSmVidaU, nSmNach, nSmUdrg, nSmVupl : double;
begin
  Result := 0;
  with qryRS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select PSch, SchBU, KdSpZ, VidN, KdObj, KdKatP, ' +
            ' Sum(Summa) as SMM, Cast(NULL as Numeric) as UdVes ' +
            ' from ViNu2 where DtProc = :d_DtPrc and ' +
            ' TabN = :nTabN and KdSps = :n_KdSps and VidN < :cVidN ' +
            ' group by PSch, SchBU, KdSpZ, VidN, KdObj, KdKatP');
    ParamByName('n_KdSps').AsInteger  := n_KdSps;
    ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('cVidN').AsString     := '8600';
    Open;
    if Locate('VidN', cVidN, []) then begin
      n_KdObj  := FieldByName('KdObj').AsInteger;
      n_KdKatP := FieldByName('KdKatP').AsInteger;
      n_KdSpZ  := FieldByName('KdSpZ').AsInteger;
      First;
      nSmVida := 0;
      nSmNach := 0;
      nSmUdrg := 0;
      nSmVupl := 0;
      while not Eof do begin
        if (FieldByName('KdObj').AsInteger = n_KdObj) and
           (FieldByName('KdKatP').AsInteger = n_KdKatP) and
             (FieldByName('KdSpZ').AsInteger = n_KdSpZ) then begin
          c_VidDbg := FieldByName('VidN').AsString;
          if (c_VidDbg = cVidN) then
            nSmVida := nSmVida + FieldByName('SMM').AsFloat;
          if (c_VidDbg  < '6000') then
            nSmNach := nSmNach + FieldByName('SMM').AsFloat
          else begin
            if (c_VidDbg  >= '7500') and (c_VidDbg  < '7600') then
              nSmVupl := nSmVupl - FieldByName('SMM').AsFloat
            else
              nSmUdrg := nSmUdrg - FieldByName('SMM').AsFloat;
          end;
        end;
        Next;
      end;
      nSmVidaU := MyRound(nSmVida * nSmUdrg / nSmNach, 2);
      Result := MyRound((nSmVida - nSmVidaU) * nSmPrc / 100, 2);
      if Result > nSmNach - nSmUdrg - nSmVupl then
        Result := nSmNach - nSmUdrg - nSmVupl;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popOtklDelRecClick(Sender: TObject);
begin
  if qryOtklPBnk.AsInteger = 1 then begin
    if MessageDlg('Запись передана в БАНК. Удалять ее не разрешается. ' +
             'Вы настаиваете?:', mtWarning, [mbYes,mbNo], 0) = mrYes then begin
      qryOtkl.Delete;
      RefeshLabelCntRec;
    end; end
  else if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                                  mtWarning, [mbYes,mbNo], 0) = mrYes then begin
    qryOtkl.Delete;
    RefeshLabelCntRec;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.RefeshLabelCntRec;
begin
  LabelCntOtklRec.Caption := '';
  LabelVedNr.Caption := 'VedNr = ' + qryVedVEDNR.AsString;
  if (qryOtkl.RecordCount >= 0) then
    LabelCntOtklRec.Caption :=
                       'Записей в ведомости: ' + IntToStr(qryOtkl.RecordCount)
  else
    LabelCntOtklRec.Caption := 'Записей в ведомости: нет';
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popOtklAddAndRschClick(Sender: TObject);
var nTabN : integer; cFamIO : string; bFromMainForm, bSvFlagDbg : boolean;
    dSaveSysDtProc : TDateTime;
begin
  ShowMessage('Еще в работе......');
  Exit;
  dSaveSysDtProc := dCtrlDate;
  if bFlagDbg then
    dCtrlDate := dDtProc;
  bSvFlagDbg := bFlagDbg;
  bFlagDbg := false;
  nTabN  := 57721; //dbgrSps.DataSource.DataSet.FieldByName('TabN').AsInteger;
  cFamIO := 'Боренко Е.С.'; //dbgrSps.DataSource.DataSet.FieldByName('FamIO').AsString;
  Screen.Cursor := crHourGlass;
  bFromMainForm := false;
  if Go2ClpSchet(bFromMainForm, nTabN, cFamIO, dDtProc) then begin   {Z_RsOld}

  end;
  Application.ProcessMessages;
  dCtrlDate := dSaveSysDtProc;
  bFlagDbg := bSvFlagDbg;
  Screen.Cursor := crDefault;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryOtklCalcFields(DataSet: TDataSet);
var cDummy, cPSch, cShKatP : string;
begin
  if not qryOtkl.Active then Exit;
  qryOtkl.FieldByName('FamIO').AsString :=
                     DmMain.TabN2FamIO(qryOtkl.FieldByName('TabN').AsInteger);
  qryOtkl.FieldByName('ShVidN').AsString :=
             DmMain.VidN2ShVidN(qryOtkl.FieldByName('VidN').AsString, cDummy);
  qryOtkl.FieldByName('SchBU').AsString :=
                 DmMain.KdSbu22NmSbu(qryOtkl.FieldByName('KdSpZ').AsInteger,
                                                                cPSch, cDummy);
  qryOtklPSch.AsString := cPSch;                                                              
  qryOtklShObj.AsString := DmMain.KdObj2ShObj(qryOtklKdObj.AsInteger, cDummy);
  cDummy := DmMain.KdKatP2NmKatP(qryOtklKdKatP.AsInteger, cShKatP);
  qryOtklShKatP.AsString := cShKatP;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryOtklNewRecord(DataSet: TDataSet);
begin
  with qryOtkl do begin
    FieldByName('KdSps').AsInteger := n_KdSps;
    FieldByName('PdN').AsInteger := 1;
    FieldByName('VidN').AsString := '7509';
    FieldByName('DtProc').AsDateTime := d_DtPrc;
    FieldByName('ZaMesGod').AsDateTime := d_DtPrc;
    FieldByName('DtVdPv').AsDateTime :=
                                    qryVed.FieldByName('VedDate').AsDateTime;
    FieldByName('NrVdPv').AsInteger := qryVed.FieldByName('VedNr').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryNUCalcFields(DataSet: TDataSet);
begin
//  qryNuFamIO.AsString := MyFamIO(qryNuFam.AsString, qryNuIma.AsString,
//                                                      qryNuOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.dsrcVedDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcVed.State = dsBrowse) and qryOtkl.Active {and
                                            (qryOtkl.RecordCount <> 0)} then
    RefeshLabelCntRec;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryOtklTABNValidate(Sender: TField);
begin
  ;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.PanelRightResize(Sender: TObject);
begin
  PanelWait.Top := Round((dbgrOtkl.Height - PanelWait.Height) / 2);
  PanelWait.Left := Round((dbgrOtkl.Width - PanelWait.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryOtklAfterPost(DataSet: TDataSet);
begin
  sBtnApply.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryOtklAfterDelete(DataSet: TDataSet);
begin
  sBtnApply.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnApplyClick(Sender: TObject);
begin
(*
  if qryOtkl.UpdatesPending then
    qryOtkl.ApplyUpdates;
  sBtnApply.Enabled := false;
*)
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnPrtClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnPrt.Top + 48;
  Y := Left + sBtnPrt.Left + 3;
  popPrt.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnSaveClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnSave.Top + 48;
  Y := Left + sBtnSave.Left + 3;
  popBnk.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrOtkl.Canvas do begin
    if not (gdFocused in State) then begin
      if (Column.FieldName = 'SUMMA') then begin
        Column.Title.Font.Color := clRed;
        Column.Title.Font.Style := [fsBold];
        Column.Font.Style := [fsBold];
        if (Column.Field.Value < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText;
        end
      else begin
        Column.Title.Font.Color := clWindowText;
        if bFontBold then
          Column.Title.Font.Style := [fsBold]
        else
          Column.Title.Font.Style := [];
      end;
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.dbgrVedDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrVed.Canvas do begin
    if not (gdFocused in State) then begin
      if qryVedDtProc.AsDateTime <> d_DtPrc then
        Font.Color := clNavy
      else if qryVedPrPodkl.AsInteger = 1 then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
    end;
    if bFontBold then
      Column.Title.Font.Style := [fsBold]
    else
      Column.Title.Font.Style := [];
  end;
  dbgrVed.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popOtklFonClick(Sender: TObject);
begin
  if FormZpMain.ColorDialog1.Execute then begin
    mFonColor := FormZpMain.ColorDialog1.Color;
    dbgrOtkl.Color := mFonColor;
    dbgrVed.Color  := mFonColor;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popOtklFontClick(Sender: TObject);
begin
  FormZpMain.FontDialog1.Font := dbgrOtkl.Font;
  if FormZpMain.FontDialog1.Execute then begin
    cFontName := FormZpMain.FontDialog1.Font.Name;
    nFontSize := FormZpMain.FontDialog1.Font.Size;
    bFontItalic := (fsItalic in FormZpMain.FontDialog1.Font.Style);
    bFontBold := (fsBold in FormZpMain.FontDialog1.Font.Style);
    SetTabsFont;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryVedBeforeScroll(DataSet: TDataSet);
var nDlgResult : SmallInt;
begin
  if (qryVedPrPodkl.IsNull or (qryVedPrPodkl.AsInteger <> 1)) and
                                    qryOtkl.UpdatesPending then begin
    nDlgResult := MessageDlg('Не сохранены изменения сделанные в ' +
            'отклонениях. Сохранить?:', mtWarning, [mbYes, mbNo, mbCancel], 0);
    if nDlgResult = mrYes then
      sBtnApplyClick(Self)
      // ShowMessage('Будем сохраняться')
    else if nDlgResult = mrNo then
      // ShowMessage('Не будем сохраняться. Не хочуть.')
    else begin
      // ShowMessage('Выбран <Cancel>. Надо как-то прервать Scroll. Как?');
      // Оказывается Abort
      Abort;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.qryVedAfterScroll(DataSet: TDataSet);
begin
  sBtnApply.Enabled := (qryVedPrPodkl.IsNull or
                    (qryVedPrPodkl.AsInteger <> 1)) and qryOtkl.UpdatesPending;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popVedAddPartVuplClick(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popVedAddOstVuplClick(Sender: TObject);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popVedAddPredVuplClick(Sender: TObject);
var nY, nM, nD : word;  nSvNR : integer;
begin
  DecodeDate(d_DtPrc, nY, nM, nD);
  with qryVed do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('TypeVed').AsString := 'MegVed';
    FieldByName('DtProc').AsDateTime := d_DtPrc;
    FieldByName('KdSps').AsInteger := n_KdSps;
    FieldByName('PrtVedNr').AsInteger := NewPrtVedNR(d_DtPrc);
    FieldByName('VedDate').AsDateTime := Date;
    FieldByName('PrtVedDate').AsDateTime := Date;
    FieldByName('VedHead').AsString := 'Ведомость на выплату аванса за ' +
                                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    if AddEdtMegVed {z_EMgVed} then
      Post
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.SetDbgrPVColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrPV.Columns.Count-1 do begin
    with dbgrPV.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SMOSNV') or (cUpper = 'SMPREM') or (cUpper = 'SMOTPTM') or
          (cUpper = 'SMOTPBM') or (cUpper = 'SMOTPNI') or (cUpper = 'SMOSTV') or
          (cUpper = 'SMOSTV') or (cUpper = 'SMOSTV') or (cUpper = 'SMOSTV') then
        Visible := false // bFlagDbg;
      else
        Visible := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.cdsPVBeforePost(DataSet: TDataSet);
var nSmRaznica : double;
begin
  nSmRaznica := MyRound(cdsPVSm_Nach.AsFloat - cdsPVSmOper.AsFloat, 2);
  if nSmRaznica = 0 then
    cdsPVSmOst.AsString := ''
  else
    cdsPVSmOst.AsFloat := nSmRaznica;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnShwZadanieClick(Sender: TObject);
begin
  if GetMegVedZd(nPrcOsnV, nPrcPrem,
                   nPrcOtpTM, nPrcOtpBm, nPrcOtpNI) {z_MgVdZd} then begin
    Application.ProcessMessages;
    DoRaschet;
    sBtnShwZadanie.Enabled := true; // чтобы была возможность изменить задание
    sBtnInfo.Enabled := true;
    sBtnSaveVed1.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.DoRaschet;
var nSpOsnV, nSmBoln, nSmPrem,
             nSmOtpTM, nSmOtpBM, nSmOtpNI, nSmRasch, nSmOst : double;
    nRaschTts : double;
begin
  Screen.Cursor := crSQLWait;
  Application.ProcessMessages;
  with cdsPV do begin
    DisableControls;
    First;
    Screen.Cursor := crSQLWait;
    PanelWait.Top := Round((dbgrPV.Height - PanelWait.Height) / 2);
    PanelWait.Left := Round((dbgrPV.Width - PanelWait.Width) / 2);
    PanelWait.Visible := true;
    Application.ProcessMessages;
    nRaschTts := 0;
    while not Eof do begin
      nSpOsnV  := cdsPVSm_OsnV.AsFloat * nPrcOsnV / 100;
      nSmBoln  := cdsPVSm_Boln.AsFloat * nPrcPrem / 100;
      nSmPrem  := cdsPVSm_Prem.AsFloat * nPrcPrem / 100;
      nSmOtpTM := cdsPVSm_OtpTM.AsFloat * nPrcOtpTM / 100;
      nSmOtpBM := cdsPVSm_OtpBM.AsFloat * nPrcOtpBM / 100;
      nSmOtpNI := cdsPVSm_OtpNI.AsFloat * nPrcOtpNI / 100;
      nSmOst := cdsPVSmOst.AsFloat;
      nSmRasch := nSpOsnV + nSmBoln + nSmPrem + nSmOtpTM + nSmOtpBM + nSmOtpNI;
      nSmRasch := MyRound(nSmRasch, 2);
      if nSmRasch > nSmOst then
        nSmRasch := nSmOst;
      Edit;
      cdsPVSmRasch.AsFloat := nSmRasch;
      cdsPVSmOper.AsFloat := nSmRasch;
      nRaschTts := nRaschTts + nSmRasch;
      Post;
      Next;
    end;
    EnableControls;
  end;
  PanelWait.Visible := false;
  Screen.Cursor := crDefault;
  bNeedSave := nRaschTts <> 0;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.dbgrPVDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cUpper : ShortString;
begin
  with dbgrPV.Canvas do begin
    if not (gdFocused in State) then begin
      cUpper := AnsiUpperCase(Column.FieldName);
      if (cUpper = 'SMRASCH') or (cUpper = 'K_T') then begin
        Font.Style := [];
        Font.Color := clMaroon; end
      else if (cUpper = 'SMOPER') or (cUpper = 'SMOST') then begin
        Font.Style := [fsBold];
        if (cUpper = 'SMOPER') then
          Font.Color := clWindowText
        else begin
          if Column.Field.AsFloat < 0 then
            Font.Color := clRed
          else
            Font.Color := clWindowText;
        end; end
      else begin
        if Copy(cUpper, 1, 3) = 'SM_' then begin
          Font.Style := [];
          Font.Color := clMaroon; end
        else if Copy(cUpper, 1, 2) = 'SM' then begin
          Font.Style := [];
          Font.Color := clNavy; end
        else  begin
          Font.Style := [];
          Font.Color := clWindowText;
        end;
      end;
    end;
  end;
  dbgrPV.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.dbeEnter(Sender: TObject);
begin
 (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.dbeExit(Sender: TObject);
begin
 (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnSpisokClick(Sender: TObject);
var mLstObj, mLstKatP : TStrings; cVidN : string4; nSmPrc, nSmVed : double;
    cSQL : string; i, nAddCnt : integer; nSumCase : word;
    nNrVed : integer; dDtVed, dDtLastDOM : TDateTime;
    nY, nM, nD : word; nKdBnk : SmallInt;
begin
  sBtnSumKVupl.Enabled := false;
  sBtnShwZadanie.Enabled := false;
  sBtnInfo.Enabled := false;
  sBtnSaveVed1.Enabled := false;
  mLstObj := LbxObj.Items;
  mLstKatP := LbxKatP.Items;
  mLstObj.Clear;
  mLstKatP.Clear;
  nNrVed := qryVedVedNr.AsInteger;
  dDtVed := qryVedVedDate.AsDateTime;
  if VbObjKatToMegVed('Выбор подразделений и персонала для ведомости',
                     n_KdSps, d_DtPrc, mLstObj, mLstKatP) {z_VbObKt} then begin
    with cdsPV do begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
    SetDbgrPVColumns;
    cdsPV.DisableControls;
    dDtLastDOM := MyLastDOM(d_DtPrc);
    Screen.Cursor := crSQLWait;
    PanelWait.Top := Round((dbgrPV.Height - PanelWait.Height) / 2);
    PanelWait.Left := Round((dbgrPV.Width - PanelWait.Width) / 2);
    PanelWait.Visible := true;
    Application.ProcessMessages;
    // Из Z_Pere запрашиваем состояние на конец месяца dDtLastDOM
    cSQL := 'Select S.TabN as S_TABN, s.KdObj as s_KdObj, ' +
            ' s.KdSps as s_KdSps, P.* from Z_SPS S ' +
            ' Left Outer join GET_PERE(S.TabN, :dDtLastDOM) p on 1 = 1' +
            ' where s.DtProc = :d_DtPrc ';
    if mLstObj.Count > 0 then begin
      cSQL := cSQL + ' and s.KdObj in (';
      for i := 0 to mLstObj.Count-1 do begin
        cSQL := cSQL + mLstObj[i];
        if i < (mLstObj.Count-1) then
          cSQL := cSQL + ', ';
      end;
      cSQL := cSQL + ')';
    end;
    if mLstKatP.Count > 0 then begin
      cSQL := cSQL + ' and s.KdKatP in (';
      for i := 0 to mLstKatP.Count-1 do begin
        cSQL := cSQL + mLstKatP[i];
        if i < (mLstKatP.Count-1) then
          cSQL := cSQL + ', ';
      end;
      cSQL := cSQL + ')';
    end;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESZPL;
      SQL.Add(cSQL);
      SQL.Add(' order by s.KdObj, s.TabN ');
      ParamByName('dDtLastDOM').AsDateTime := dDtLastDOM;
      ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
      if bFlagDbg then
        SQL.SaveToFile(cDirTemp + 'MgVedAdd.sql');
      Open;
      while not Eof do begin
        cdsPV.Append;
        cdsPVKdObj.AsInteger := FieldByName('S_KdObj').AsInteger;
        cdsPVTabN.AsInteger  := FieldByName('S_TabN').AsInteger;
        cdsPVFamIO.AsString  :=
                        DmMain.TabN2FamIO(FieldByName('S_TabN').AsInteger);
        cdsPVKdKatP.AsInteger := FieldByName('KdKatP').AsInteger;
        cdsPVLS.AsString := DmMain.GetBankiLS(FieldByName('S_TabN').AsInteger,
                                                              d_DtPrc, nKdBnk);
        if nKdBnk > 0 then
          cdsPVKdBnk.AsInteger := nKdBnk;
        cdsPV.Post;
        Next;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    cdsPV.EnableControls;
  end;
  PanelWait.Visible := false;
  Screen.Cursor := crDefault;
  sBtnSumKVupl.Enabled := cdsPV.RecordCount > 0;
  bNeedSave := false;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.DelCdsPVSmFields;
var cField : ShortString; i : integer;
begin
  with cdsPV do begin
    DisableControls;
    First;
    while not Eof do begin
      Edit;
      for i := 7 to cdsPV.FieldCount-1 do begin
        Fields[i].AsString := '';
      end;
      Post;
      Next;
    end;
    First;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnSumKVuplClick(Sender: TObject);
var nSmNach, nSmOsnV, nSmBoln, nSmPrem, nSmOtpTM, nSmOtpBM, nSmOtpNI,
                         nSmUdrg, nSmVupl : double; // по всем видам средств
    nSmNach1, nSmOsnV1, nSmBoln1, nSmPrem1, nSmOtpTM1, nSmOtpBM1, nSmOtpNI1,
                      nSmUdrg1, nSmVupl1 : double;  // по заданному виду средств
    n_SmNach, n_SmOsnV, n_SmBoln, n_SmPrem, n_SmOtpTM, n_SmOtpBM,
            n_SmOtpNI, n_SmUdrg, n_SmVupl : double; // с учетом коэф-та nK_t
    nK_t : double;
    nTabN : integer;
    bPsch801, bPsch811, bPschAll, bByGroup,
    bGrpOsnV, bGrpPrem, bGrpOtpTM, bGrpOtpBM, bGrpOtpNI : boolean;
    bIsResRecs : boolean;
begin
  if VvodZdNaVuborku(bPsch801, bPsch811, bPschAll, bByGroup,
         bGrpOsnV, bGrpPrem, bGrpOtpTM, bGrpOtpBM, bGrpOtpNI) {z_VvZdSm} then
                                                            with qryNU do begin
    if bPsch811 then
      nVedKdSpZ := 1331  // 811/а Расходы специального фонда
    else
      nVedKdSpZ := 1209; // 801/б Расходы основного фонда (осн.деятельность)
    bIsResRecs := false;
    Screen.Cursor := crSQLWait;
    PanelWait.Top := Round((dbgrPV.Height - PanelWait.Height) / 2);
    PanelWait.Left := Round((dbgrPV.Width - PanelWait.Width) / 2);
    PanelWait.Visible := true;
    Application.ProcessMessages;
    // Обнулить суммовые поля в cdsPV (список остается тот же)
    DelCdsPVSmFields;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    // запрос всегда один, а варианты разбираю при форимровании cdsPV
    SQL.Add(      'Select TabN, PSCH, Cast("OSNV" as char(6)) as TYPENU, ' +
            ' Sum(Summa) as SMM from ViNu_Main where dtProc = :dDtPrc and ' +
            ' (VidN < "2200" or VidN = "2603" or ' +
                                    ' (VidN > "2700" and VidN < "5000")) ' +
            ' group by PSCH, TabN ');
    SQL.Add('UNION Select TabN, PSCH, Cast("BOLN" as char(6)) as TYPENU, ' +
            ' Sum(Summa) as SMM from ViNu_Main where dtProc = :dDtPrc and ' +
            ' VidN > "2600" and VidN < "2700" and VidN <> "2603" ' +
            ' group by PSCH, TabN ');
    SQL.Add('UNION Select TabN, PSCH, Cast("PREM" as char(6)) as TYPENU, ' +
            ' Sum(Summa) as SMM from ViNu_Main where dtProc = :dDtPrc and ' +
            ' VidN > "2200" and VidN < "2400" group by PSCH, TabN ');
    SQL.Add('UNION Select TabN, PSCH, Cast("OTPTM" as char(6)) as TYPENU, ' +
            ' Sum(Summa) as SMM from ViNu_Main where dtProc = :dDtPrc and ' +
            ' VidN in ("2401", "2402", "2404") group by PSCH, TabN ');
    SQL.Add('UNION Select TabN, PSCH, Cast("OTPBM" as char(6)) as TYPENU, ' +
            ' Sum(Summa) as SMM from ViNu_Main where dtProc = :dDtPrc and ' +
            ' VidN in ("2403", "2405", "2410") group by PSCH, TabN ');
    SQL.Add('UNION Select TabN, PSCH, Cast("OTPNI" as char(6)) as TYPENU, ' +
            ' Sum(Summa) as SMM from ViNu_Main where dtProc = :dDtPrc and ' +
            ' VidN in ("2406", "2411") group by PSCH, TabN ');
    SQL.Add('UNION Select TabN, PSCH, Cast("UDRG" as char(6)) as TYPENU, ' +
            ' Sum(Summa) as SMM from ViNu_Main where dtProc = :dDtPrc and ' +
            ' VidN > "6000" and VidN < "7500" group by PSCH, TabN ');
    SQL.Add('UNION Select TabN, PSCH, Cast("VUPL" as char(6)) as TYPENU, ' +
            ' Sum(Summa) as SMM from ViNu_Main where dtProc = :dDtPrc and ' +
            ' VidN > "7500" and VidN < "8000" group by PSCH, TabN ');
    ParamByName('dDtPrc').AsDateTime := d_DtPrc;
    Open;
    cdsPV.DisableControls;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      if not cdsPV.Locate('TabN', nTabN, []) then begin
        while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
          Next;
          Continue;
        end; end
      else begin
        nSmOsnV  := 0;
        nSmBoln  := 0;
        nSmPrem  := 0;
        nSmOtpTM := 0;
        nSmOtpBM := 0;
        nSmOtpNI := 0;
        nSmUdrg  := 0;
        nSmVupl  := 0;
        nSmOsnV1  := 0;
        nSmBoln1  := 0;
        nSmPrem1  := 0;
        nSmOtpTM1 := 0;
        nSmOtpBM1 := 0;
        nSmOtpNI1 := 0;
        nSmUdrg1  := 0;
        nSmVupl1  := 0;
        n_SmOsnV  := 0;
        n_SmBoln  := 0;
        n_SmPrem  := 0;
        n_SmOtpTM := 0;
        n_SmOtpBM := 0;
        n_SmOtpNI := 0;
        n_SmUdrg  := 0;
        n_SmVupl  := 0;
        while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
          if (FieldByName('TypeNu').AsString = 'OSNV') then begin
            if ((bPsch801 and (FieldByName('PSCH').AsString = '801')) or
                 (bPsch811 and (FieldByName('PSCH').AsString = '811')) or
                                                              bPschAll) then
              nSmOsnV1 := nSmOsnV1 + FieldByName('SMM').AsFloat;
            nSmOsnV := nSmOsnV + FieldByName('SMM').AsFloat; end
          else if (FieldByName('TypeNu').AsString = 'BOLN') then begin
            if ((bPsch801 and (FieldByName('PSCH').AsString = '801')) or
                 (bPsch811 and (FieldByName('PSCH').AsString = '811')) or
                                                              bPschAll) then
              nSmBoln1 := nSmBoln1 + FieldByName('SMM').AsFloat;
            nSmBoln := nSmBoln + FieldByName('SMM').AsFloat; end
          else if (FieldByName('TypeNu').AsString = 'PREM') then begin
            if ((bPsch801 and (FieldByName('PSCH').AsString = '801')) or
                 (bPsch811 and (FieldByName('PSCH').AsString = '811')) or
                                                              bPschAll) then
              nSmPrem1 := nSmPrem1 + FieldByName('SMM').AsFloat;
            nSmPrem := nSmPrem + FieldByName('SMM').AsFloat; end
          else if (FieldByName('TypeNu').AsString = 'OTPTM') then begin
            if ((bPsch801 and (FieldByName('PSCH').AsString = '801')) or
                 (bPsch811 and (FieldByName('PSCH').AsString = '811')) or
                                                              bPschAll) then
              nSmOtpTm1 := nSmOtpTm1 + FieldByName('SMM').AsFloat;
            nSmOtpTm := nSmOtpTm + FieldByName('SMM').AsFloat; end
          else if (FieldByName('TypeNu').AsString = 'OTPBM') then begin
            if ((bPsch801 and (FieldByName('PSCH').AsString = '801')) or
                 (bPsch811 and (FieldByName('PSCH').AsString = '811')) or
                                                              bPschAll) then
              nSmOtpBm1 := nSmOtpBm1 + FieldByName('SMM').AsFloat;
            nSmOtpBm := nSmOtpBm + FieldByName('SMM').AsFloat; end
          else if (FieldByName('TypeNu').AsString = 'OTPNI') then begin
            if ((bPsch801 and (FieldByName('PSCH').AsString = '801')) or
                 (bPsch811 and (FieldByName('PSCH').AsString = '811')) or
                                                              bPschAll) then
              nSmOtpNI1 := nSmOtpNI1 + FieldByName('SMM').AsFloat;
            nSmOtpNI := nSmOtpNI + FieldByName('SMM').AsFloat; end
          else if (FieldByName('TypeNu').AsString = 'UDRG') then begin
            if ((bPsch801 and (FieldByName('PSCH').AsString = '801')) or
                 (bPsch811 and (FieldByName('PSCH').AsString = '811')) or
                                                              bPschAll) then
              nSmUdrg1 := nSmUdrg1 - FieldByName('SMM').AsFloat;
            nSmUdrg := nSmUdrg - FieldByName('SMM').AsFloat; end
          else if (FieldByName('TypeNu').AsString = 'VUPL') then begin
            if ((bPsch801 and (FieldByName('PSCH').AsString = '801')) or
                 (bPsch811 and (FieldByName('PSCH').AsString = '811')) or
                                                              bPschAll) then
              nSmVupl1 := nSmVupl1 - FieldByName('SMM').AsFloat;
            nSmVupl := nSmVupl - FieldByName('SMM').AsFloat;
          end;
          Next;
        end;
        nK_t := 0;
        nSmNach1 := nSmOsnV1 + nSmBoln1 + nSmPrem1 +
                                          nSmOtpTM1 + nSmOtpBM1 + nSmOtpNI1;
        n_SmNach := nSmNach1 - nSmUdrg1 - nSmVupl1;
        if nSmNach1 <> 0 then begin
          nK_t := nSmUdrg1 / nSmNach1;
          if nSmOsnV1 <> 0 then
            n_SmOsnV := nSmOsnV1 - nSmOsnV1 * nK_t;
          if nSmBoln1 <> 0 then
            n_SmBoln := nSmBoln1 - nSmBoln1 * nK_t;
          if nSmPrem1 <> 0 then
            n_SmPrem := nSmPrem1 - nSmPrem1 * nK_t;
          if nSmOtpTm1 <> 0 then
            n_SmOtpTm := nSmOtpTm1 - nSmOtpTm1 * nK_t;
          if nSmOtpBm1 <> 0 then
            n_SmOtpBm := nSmOtpBm1 - nSmOtpBm1 * nK_t;
          if nSmOtpNI1 <> 0 then
            n_SmOtpNI := nSmOtpNI1 - nSmOtpNI1 * nK_t;
          // сделать проверку, чтобы сумма всех n_Sm... не превышала n_SmNach
        end;
        bIsResRecs := true;
        cdsPV.Edit;
        //cdsPVTabN.AsInteger  := nTabN;
        //cdsPVFamIO.AsString  := DmMain.TabN2FamIO(nTabN);
        cdsPVSmOsnV.AsFloat  := nSmOsnV1;
        cdsPVSmBoln.AsFloat  := nSmBoln1;
        cdsPVSmPrem.AsFloat  := nSmPrem1;
        cdsPVSmOtpTM.AsFloat := nSmOtpTM1;
        cdsPVSmOtpBM.AsFloat := nSmOtpBM1;
        cdsPVSmOtpNI.AsFloat := nSmOtpNI1;
        cdsPVSmNach.AsFloat  := nSmNach1;
        cdsPVSmUdrg.AsFloat  := nSmUdrg1;
        cdsPVSmVupl.AsFloat  := nSmVupl1;
        cdsPVK_t.AsFloat     := nK_t;
        cdsPVSm_OsnV.AsFloat  := n_SmOsnV;
        cdsPVSm_Boln.AsFloat  := n_SmBoln;
        cdsPVSm_Prem.AsFloat  := n_SmPrem;
        cdsPVSm_OtpTM.AsFloat := n_SmOtpTM;
        cdsPVSm_OtpBM.AsFloat := n_SmOtpBM;
        cdsPVSm_OtpNI.AsFloat := n_SmOtpNI;
        cdsPVSm_Nach.AsFloat  := n_SmNach;
        cdsPV.Post;
      end;
    end;
    sBtnShwZadanie.Enabled := bIsResRecs;
    sBtnSpisok.Enabled := true; // чтобы дать возможность переформировать список
    cdsPV.EnableControls;
    PanelWait.Visible := false;
    bNeedSave := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnSaveVed1Click(Sender: TObject);
var nSmTt, nSmBoln, nSmRest : double;
begin
  // Сохранить ведомость в таблицу отклонений, повыключать
  // все sBtn'ы, кроме "Печать" и "В Банк";
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, PDN, KdSpZ, Notes, Kto, PrR, Spec_NR, ' +
            ' DtVdPV, NrVdPV, MyNotes, PBnk) values (:nKdSps, :dDtProc, ' +
            ' :dZaMesGod, :nTabN, :cVidN, :nSumma, :nKdObj, :nKdKatP, ' +
            ' :nPDN, :nKdSpZ, :cNotes, :nKto, :nPrR, :nSpec_NR, ' +
            ' :dDtVdPV, :nNrVdPV, :cMyNotes, :nPBnk)');
    ParamByName('nKdSps').AsInteger := n_KdSps;
    ParamByName('dDtProc').AsDateTime := d_DtPrc;
    ParamByName('dZaMesGod').AsDateTime := d_DtPrc;
    ParamByName('nPdn').AsInteger := 1;
    ParamByName('nKdSpZ').AsInteger := nVedKdSpZ;
    ParamByName('cNotes').AsString := '';
    ParamByName('nKto').AsInteger := n_KdUsr;
    ParamByName('nPrR').AsInteger := 0;
    ParamByName('nSpec_NR').AsInteger := 0;     // TYTYTYT
    ParamByName('dDtVdPV').AsDateTime := qryVedVedDate.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVedNR.AsInteger;
    ParamByName('cMyNotes').AsString := '';
    ParamByName('nPBnk').AsInteger := 7;
    Prepare;
  end;
  with cdsPV do begin
    First;
    while not Eof do begin
      if (not cdsPVSmOper.IsNull) and (cdsPVSmOper.AsFloat > 0) then begin
        qryTmp.ParamByName('nTabN').AsInteger := cdsPVTabN.AsInteger;
        qryTmp.ParamByName('nKdObj').AsInteger := cdsPVKdObj.AsInteger;
        qryTmp.ParamByName('nKdKatP').AsInteger := cdsPVKdKatP.AsInteger;
        qryTmp.ParamByName('nSumma').AsFloat := -cdsPVSmOper.AsFloat;
        if cdsPVKdBnk.IsNull or (cdsPVKdBnk.AsInteger = 0) then
          qryTmp.ParamByName('cVidN').AsString := '7509'  // вид РасхОрдер
        else
          qryTmp.ParamByName('cVidN').AsString := '7511'; // вид В Банк
        if cdsPVSm_Boln.AsFloat <> 0 then begin
          // Разбить на 2 части - выплата из больничных и выплата из остального
          nSmTt := cdsPVSm_OsnV.AsFloat + cdsPVSm_Boln.AsFloat +
                      cdsPVSm_Prem.AsFloat + cdsPVSm_OtpTM.AsFloat +
                         cdsPVSm_OtpBM.AsFloat + cdsPVSm_OtpNI.AsFloat;
          nSmBoln := cdsPVSm_Boln.AsFloat;
          nSmBoln := MyRound(nSmBoln * cdsPVSmOper.AsFloat / nSmTt, 2);
          if nSmBoln > cdsPVSmOper.AsFloat then
            nSmBoln := cdsPVSmOper.AsFloat;
          nSmRest := cdsPVSmOper.AsFloat - nSmBoln;
          if nSmRest < 0 then
            nSmRest := 0;
          qryTmp.ParamByName('nTabN').AsInteger := cdsPVTabN.AsInteger;
          qryTmp.ParamByName('nKdObj').AsInteger := cdsPVKdObj.AsInteger;
          qryTmp.ParamByName('nKdKatP').AsInteger := cdsPVKdKatP.AsInteger;
          qryTmp.ParamByName('nSumma').AsFloat := -nSmBoln;
          qryTmp.ParamByName('nPrR').AsInteger := 1;
          qryTmp.ParamByName('cNotes').AsString := 'из больничных';
          qryTmp.ParamByName('cMyNotes').AsString := 'из больничных';
          if cdsPVKdBnk.IsNull or (cdsPVKdBnk.AsInteger = 0) then
            qryTmp.ParamByName('cVidN').AsString := '7509'  // вид РасхОрдер
          else
            qryTmp.ParamByName('cVidN').AsString := '7511'; // вид В Банк
          qryTmp.ExecSQL;
          if nSmRest <> 0 then begin
            qryTmp.ParamByName('nTabN').AsInteger := cdsPVTabN.AsInteger;
            qryTmp.ParamByName('nKdObj').AsInteger := cdsPVKdObj.AsInteger;
            qryTmp.ParamByName('nKdKatP').AsInteger := cdsPVKdKatP.AsInteger;
            qryTmp.ParamByName('nSumma').AsFloat := -nSmRest;
            qryTmp.ParamByName('nPrR').AsInteger := 0;
            qryTmp.ParamByName('cNotes').AsString := 'кроме больничных';
            qryTmp.ParamByName('cMyNotes').AsString := 'кроме больничных';
            if cdsPVKdBnk.IsNull or (cdsPVKdBnk.AsInteger = 0) then
              qryTmp.ParamByName('cVidN').AsString := '7509'  // вид РасхОрдер
            else
              qryTmp.ParamByName('cVidN').AsString := '7511'; // вид В Банк
            qryTmp.ExecSQL;
          end;
          qryTmp.ParamByName('nPrR').AsInteger := 0;
          qryTmp.ParamByName('cNotes').AsString := '';
          qryTmp.ParamByName('cMyNotes').AsString := '';
          Next;
          Continue;
        end;
        qryTmp.ExecSQL;
      end;
      Next;
    end;
    First;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    if Prepared then
      UnPrepare;
  end;
  qryVed.Next; // чтобы перечиталась ведомость
  bNewVedSaved := true;
  sBtnSpisok.Enabled := false;
  sBtnSumKVupl.Enabled := false;
  sBtnShwZadanie.Enabled := false;
  sBtnSaveVed1.Enabled := false;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnInfoClick(Sender: TObject);
var nCntTts, nCntBnk, nCntKss, nSvNR : integer;
    nSmTts, nSmBnk, nSmKss : double;
begin
  nCntTts := 0;
  nCntBnk := 0;
  nCntKss := 0;
  nSmTts := 0;
  nSmBnk := 0;
  nSmKss := 0;
  with cdsPV do begin
    nSvNR := cdsPVNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      if cdsPVSmOper.IsNull or (cdsPVSmOper.AsFloat = 0) then begin
        Next;
        Continue;
      end;
      nCntTts := nCntTts + 1;
      nSmTts := nSmTts + cdsPVSmOper.AsFloat;
      if cdsPVKdBnk.IsNull or (cdsPVKdBnk.AsInteger = 0) then begin
        nCntKss := nCntKss + 1;
        nSmKss := nSmKss + cdsPVSmOper.AsFloat; end
      else begin
        nCntBnk := nCntBnk + 1;
        nSmBnk := nSmBnk + cdsPVSmOper.AsFloat;
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  LabelCntBnk.Caption := IntToStr(nCntBnk);
  LabelCntKss.Caption := IntToStr(nCntKss);
  LabelCntTts.Caption := IntToStr(nCntTts);
  LabelSmBnk.Caption := FloatToStrF(nSmBnk, ffCurrency, 18, 2);
  LabelSmKss.Caption := FloatToStrF(nSmKss, ffCurrency, 18, 2);
  LabelSmTts.Caption := FloatToStrF(nSmTts, ffCurrency, 18, 2);
  PanelInf.Top := Round((dbgrPV.Height - PanelInf.Height) / 2);
  PanelInf.Left := Round((dbgrPV.Width - PanelInf.Width) / 2);
  PanelInf.Visible := true;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.sBtnInfCloseClick(Sender: TObject);
begin
  PanelInf.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.bBtnBack2Click(Sender: TObject);
var nDlgResult : word;
begin
  if bNeedSave and bNewVedSaved then
    PageControl.ActivePage := ts1
  else if not bNeedSave then begin
    qryVed.Delete;
    PageControl.ActivePage := ts1; end
  else if bNeedSave and sBtnSaveVed1.Enabled then begin
    nDlgResult := MessageDlg('Ведомость не сохранена на диск. Сохранить?:',
                                       mtWarning, [mbYes, mbNo, mbCancel], 0);
    if nDlgResult = mrNo then begin
      qryVed.Delete;
      PageControl.ActivePage := ts1; end
    else if nDlgResult = mrYes then begin
      sBtnSaveVed1.Click;
      PageControl.ActivePage := ts1;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popPrtKssOneVedClick(Sender: TObject);
var nPrtVedNR : integer; dPrtVedDate, dVedDtProc : TDateTime;
    cVedHead : ShortString; cMyDir : ShortString;
begin
  cMyDir := 'c:\T_e_m_p\';
  if not DirectoryExists(cMyDir) then
    ForceDirectories(cMyDir);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select bl.KdBnk, bl.LicSch, bl.DtBeg, u.Fam, u.Ima, u.Otch, o.* ' +
            ' from ViOtkl_Sps o ' +
            ' Left outer join GETWRKBNKLS (o.TabN, o.DtProc) bl on 1 = 1 ' +
            ' Left outer join z_Upi u on u.TabN = o.TabN ' +
            ' where o.dtProc = :dDtProc and o.nrVdPV = :nNrVdPV and ' +
            ' bl.KdBnk is NULL order by o.TabN');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnFamIO', 'Fam;Ima;Otch', []);
    IndexName := 'OnFamIO';
    First;
    if bFlagDbg then
      SaveToFile(cMyDir + 'KssFIO.cds');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет записей для кассы')
  else begin
    with qryVed do begin
      nPrtVedNR   := FieldByName('PrtVedNR').AsInteger;
      dPrtVedDate := FieldByName('PrtVedDate').AsDateTime;
      dVedDtProc  := FieldByName('DtProc').AsDateTime;
      cVedHead    := FieldByName('VedHead').AsString;
    end;
    F6PrtVedKssOne(cdsPrt, nPrtVedNR, dPrtVedDate, dVedDtProc, cVedHead);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popPrtKssByObjClick(Sender: TObject);
var nPrtVedNR : integer; dPrtVedDate, dVedDtProc : TDateTime;
    cVedHead : ShortString; cMyDir : ShortString;
begin
  cMyDir := 'c:\T_e_m_p\';
  if not DirectoryExists(cMyDir) then
    ForceDirectories(cMyDir);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select bl.KdBnk, bl.LicSch, bl.DtBeg, u.Fam, u.Ima, u.Otch, o.* ' +
            ' from ViOtkl_Sps o ' +
            ' Left outer join GETWRKBNKLS (o.TabN, o.DtProc) bl on 1 = 1 ' +
            ' Left outer join z_Upi u on u.TabN = o.TabN ' +
            ' where o.dtProc = :dDtProc and o.nrVdPV = :nNrVdPV and ' +
            ' bl.KdBnk is NULL order by o.TabN');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnObjFamIO', 'KdObj_Sps;Fam;Ima;Otch', []);
    IndexName := 'OnObjFamIO';
    First;
    if bFlagDbg then
      SaveToFile(cMyDir + 'KsObjFIO.cds');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет записей для кассы')
  else begin
    with qryVed do begin
      nPrtVedNR   := FieldByName('PrtVedNR').AsInteger;
      dPrtVedDate := FieldByName('PrtVedDate').AsDateTime;
      dVedDtProc  := FieldByName('DtProc').AsDateTime;
      cVedHead    := FieldByName('VedHead').AsString;
    end;
    F6PrtVedKssByObj(cdsPrt, nPrtVedNR, dPrtVedDate, dVedDtProc, cVedHead);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popPrtBnkOneVedClick(Sender: TObject);
var nPrtVedNR : integer; dPrtVedDate, dVedDtProc : TDateTime;
    cVedHead : ShortString; cMyDir : ShortString;
    dDtPrdFile : TDateTime;
    nNrPrdFile, nKdBnk, i : SmallInt;
    cNmPrdDoc, cKdBnk  : ShortString;
    mBnkLst : TStringList;
begin
  cMyDir := 'c:\T_e_m_p\';
  if not DirectoryExists(cMyDir) then
    ForceDirectories(cMyDir);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select bl.KdBnk, bl.LicSch, bl.DtBeg, u.Fam, u.Ima, u.Otch, o.* ' +
            ' from ViOtkl_Sps o ' +
            ' Left outer join GETWRKBNKLS (o.TabN, o.DtProc) bl on 1 = 1 ' +
            ' Left outer join z_Upi u on u.TabN = o.TabN ' +
            ' where o.dtProc = :dDtProc and o.nrVdPV = :nNrVdPV and ' +
            ' not bl.KdBnk is NULL order by bl.KdBnk, u.Fam, u.Ima, u.Otch');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnBnkFIO', 'KdBnk;Fam;Ima;Otch', []);
    IndexName := 'OnBnkFIO';
    First;
    if bFlagDbg then
      SaveToFile(cMyDir + 'BnkFIO.cds');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет записей для банка')
  else begin
    with qryVed do begin
      nPrtVedNR   := FieldByName('PrtVedNR').AsInteger;
      dPrtVedDate := FieldByName('PrtVedDate').AsDateTime;
      dVedDtProc  := FieldByName('DtProc').AsDateTime;
      cVedHead    := FieldByName('VedHead').AsString;
      nNrPrdFile  := qryVedBnkNrPrdF.AsInteger;
      dDtPrdFile  := qryVedBnkDtPrdF.AsDateTime;
      cNmPrdDoc   := qryVedBnkNmPrdF.AsString;
      if dDtPrdFile = 0 then
        dDtPrdFile := Date;
      if nNrPrdFile = 0 then
        nNrPrdFile := 1;
    end;
    mBnkLst := TStringList.Create;
    with cdsPrt do begin
      First;
      while not Eof do begin
        nKdBnk := FieldByName('KdBnk').AsInteger;
        mBnkLst.Add(FieldByName('KdBnk').AsString);
        while (FieldByName('KdBnk').AsInteger = nKdBnk) and not Eof do begin
          Next;
        end;
      end;
    end;
    if bFlagDbg then
      mBnkLst.SaveToFile(cMyDir + 'BnkLst.lst');
    for i := 0 to mBnkLst.Count-1 do begin
      nKdBnk := StrToInt(mBnkLst[i]);
      if GetDopBnkInf(nKdBnk, dDtPrdFile,
                          nNrPrdFile, cNmPrdDoc) {z_BDpInf} then begin
        if qryVedBnkNrPrdF.IsNull then begin
          qryVed.Edit;
          qryVedBnkNrPrdF.AsInteger  := nNrPrdFile;
          qryVedBnkDtPrdF.AsDateTime := dDtPrdFile;
          qryVedBnkNmPrdF.AsString   := cNmPrdDoc;
          qryVed.Post;
        end;
        // cdsPrt передаю со всеми возможными KdBnk,
        // а печататься должен только передаваемый nKdBnk
        F6PrtVedBnkOneVed(nKdBnk, cdsPrt, nPrtVedNR, nNrPrdFile,
                     dDtPrdFile, dPrtVedDate, dVedDtProc, cNmPrdDoc, cVedHead);
      end;
    end;
    mBnkLst.Destroy;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popPrtBnkByObjClick(Sender: TObject);
var nPrtVedNR : integer; dPrtVedDate, dVedDtProc : TDateTime;
    cVedHead : ShortString; cMyDir : ShortString;
    dDtPrdFile : TDateTime;
    nNrPrdFile, nKdBnk, i : SmallInt;
    cNmPrdDoc, cKdBnk  : ShortString;
    mBnkLst : TStringList;
begin
  cMyDir := 'c:\T_e_m_p\';
  if not DirectoryExists(cMyDir) then
    ForceDirectories(cMyDir);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select bl.KdBnk, bl.LicSch, bl.DtBeg, u.Fam, u.Ima, u.Otch, o.* ' +
            ' from ViOtkl_Sps o ' +
            ' Left outer join GETWRKBNKLS (o.TabN, o.DtProc) bl on 1 = 1 ' +
            ' Left outer join z_Upi u on u.TabN = o.TabN ' +
            ' where o.dtProc = :dDtProc and o.nrVdPV = :nNrVdPV and ' +
            ' not bl.KdBnk is NULL order by bl.KdBnk, u.Fam, u.Ima, u.Otch');
    ParamByName('dDtProc').AsDateTime := qryVedDtProc.AsDateTime;
    ParamByName('nNrVdPV').AsInteger := qryVedVEDNR.AsInteger;
  end;
  dspPrt.DataSet := qryTmp;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnBnkObjFIO', 'KdBnk;KdObj_Sps;Fam;Ima;Otch', []);
    IndexName := 'OnBnkObjFIO';
    First;
    if bFlagDbg then
      SaveToFile(cMyDir + 'BnkObjFIO.cds');
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cdsPrt.RecordCount <= 0 then
    ShowMessage('Нет записей для банка')
  else begin
    with qryVed do begin
      nPrtVedNR   := FieldByName('PrtVedNR').AsInteger;
      dPrtVedDate := FieldByName('PrtVedDate').AsDateTime;
      dVedDtProc  := FieldByName('DtProc').AsDateTime;
      cVedHead    := FieldByName('VedHead').AsString;
      nNrPrdFile  := qryVedBnkNrPrdF.AsInteger;
      dDtPrdFile  := qryVedBnkDtPrdF.AsDateTime;
      cNmPrdDoc   := qryVedBnkNmPrdF.AsString;
      if dDtPrdFile = 0 then
        dDtPrdFile := Date;
      if nNrPrdFile = 0 then
        nNrPrdFile := 1;
    end;
    mBnkLst := TStringList.Create;
    with cdsPrt do begin
      First;
      while not Eof do begin
        nKdBnk := FieldByName('KdBnk').AsInteger;
        mBnkLst.Add(FieldByName('KdBnk').AsString);
        while (FieldByName('KdBnk').AsInteger = nKdBnk) and not Eof do begin
          Next;
        end;
      end;
    end;
    if bFlagDbg then
      mBnkLst.SaveToFile(cMyDir + 'BnkLst.lst');
    for i := 0 to mBnkLst.Count-1 do begin
      nKdBnk := StrToInt(mBnkLst[i]);
      if GetDopBnkInf(nKdBnk, dDtPrdFile,
                          nNrPrdFile, cNmPrdDoc) {z_BDpInf} then begin
        if qryVedBnkNrPrdF.IsNull then begin
          qryVed.Edit;
          qryVedBnkNrPrdF.AsInteger  := nNrPrdFile;
          qryVedBnkDtPrdF.AsDateTime := dDtPrdFile;
          qryVedBnkNmPrdF.AsString   := cNmPrdDoc;
          qryVed.Post;
        end;
        // cdsPrt передаю со всеми возможными KdBnk,
        // а печататься должен только передаваемый nKdBnk
        F6PrtVedBnkByObj(nKdBnk, cdsPrt, nPrtVedNR, nNrPrdFile,
                     dDtPrdFile, dPrtVedDate, dVedDtProc, cNmPrdDoc, cVedHead);
      end;
    end;
    mBnkLst.Destroy;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVed.popBnkBySpZClick(Sender: TObject);
var nPrtVedNR : integer; dPrtVedDate, dVedDtProc : TDateTime;
    cVedHead : ShortString; cMyDir : ShortString;
begin
(*
  cMyDir := 'c:\T_e_m_p\';
  // С запросом или без сохранить возможно вводившиеся изменения
  // Сформировать cdsPrt, в котором будут видны лицевые счета в банках и
  // отсутствие таковых, Отеческие счета по ведомости. Показать и дать
  // возможность выбора вариантов
  if not DirectoryExists(cMyDir) then
    ForceDirectories(cMyDir);
//  qryOtkl.DisableControls;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;

  dspPrt.DataSet := qryOtkl;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnPSchFamIO', 'PSch;FamIO', []);
    IndexName := 'OnPSchFamIO';
    First;
    if bFlagDbg then
      SaveToFile(cMyDir + 'Bnk.cds');
  end;
  qryOtkl.Open;
  qryOtkl.EnableControls;
  with qryVed do begin
    nPrtVedNR   := FieldByName('PrtVedNR').AsInteger;
    dPrtVedDate := FieldByName('PrtVedDate').AsDateTime;
    dVedDtProc  := FieldByName('DtProc').AsDateTime;
    cVedHead    := FieldByName('VedHead').AsString;
  end;
*)
end;
(*
//------------------------------------------------------------------------------
procedure TFormMegVed.popBySpZClick(Sender: TObject);
var nPrtVedNR : integer; dPrtVedDate, dVedDtProc : TDateTime;
    cVedHead : ShortString;
begin
  qryOtkl.DisableControls;
  dspPrt.DataSet := qryOtkl;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnPSchFamIO', 'PSch;FamIO', []);
    IndexName := 'OnPSchFamIO';
    First;
  end;
  qryOtkl.Open;
  qryOtkl.EnableControls;
  with qryVed do begin
    nPrtVedNR   := FieldByName('PrtVedNR').AsInteger;
    dPrtVedDate := FieldByName('PrtVedDate').AsDateTime;
    dVedDtProc  := FieldByName('DtProc').AsDateTime;
    cVedHead    := FieldByName('VedHead').AsString;
  end;                                                      {z_CmnPrt}
  F6PrtVedKssByPSch(cdsPrt, nPrtVedNR, dPrtVedDate, dVedDtProc, cVedHead);
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormMegVed.popByObjClick(Sender: TObject);
var nPrtVedNR : integer; dPrtVedDate, dVedDtProc : TDateTime;
    cVedHead : ShortString;
begin
  dspPrt.DataSet := qryOtkl;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnKdObjFamIO', 'KdObj;FamIO', []);
    IndexName := 'OnKdObjFamIO';
    First;
  end;
  qryOtkl.Open;
  with qryVed do begin
    nPrtVedNR   := FieldByName('PrtVedNR').AsInteger;
    dPrtVedDate := FieldByName('PrtVedDate').AsDateTime;
    dVedDtProc  := FieldByName('DtProc').AsDateTime;
    cVedHead    := FieldByName('VedHead').AsString;
  end;                                                      {z_CmnPrt}
  F6PrtVedKssByObj(cdsPrt, nPrtVedNR, dPrtVedDate, dVedDtProc, cVedHead);
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormMegVed.popOneVedClick(Sender: TObject);
var nPrtVedNR : integer; dPrtVedDate, dVedDtProc : TDateTime;
    cVedHead : ShortString;
begin
  dspPrt.DataSet := qryOtkl;
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspPrt';
    Open;
    AddIndex('OnFamIO', 'FamIO', []);
    IndexName := 'OnFamIO';
    First;
  end;
  qryOtkl.Open;
  with qryVed do begin
    nPrtVedNR   := FieldByName('PrtVedNR').AsInteger;
    dPrtVedDate := FieldByName('PrtVedDate').AsDateTime;
    dVedDtProc  := FieldByName('DtProc').AsDateTime;
    cVedHead    := FieldByName('VedHead').AsString;
  end;                                                      {z_CmnPrt}
  F6PrtVedKssOne(cdsPrt, nPrtVedNR, dPrtVedDate, dVedDtProc, cVedHead);
end;
*)

end.
