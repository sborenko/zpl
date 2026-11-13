unit z_EOtkl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, ExtCtrls,
  ComCtrls, Menus, DBClient;

type
  String4 = string[4];
  TFormEOtkl = class(TForm)
    panelInfo: TPanel;
    LabelObj: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelCntChas: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    sBtnVidN: TSpeedButton;
    sBtnObj: TSpeedButton;
    sBtnKatP: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    sBtnTabN: TSpeedButton;
    Label3: TLabel;
    sBtnSpecNR: TSpeedButton;
    sBtnCalendar: TSpeedButton;
    sBtnSPZ: TSpeedButton;
    Label6: TLabel;
    sBtnKdTemu: TSpeedButton;
    dbeChas: TDBEdit;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dbePdN: TDBEdit;
    dbeSumma: TDBEdit;
    DBComboZaMesGod: TDBComboBox;
    dtPicDtEnd: TDateTimePicker;
    dbeVidN: TDBEdit;
    dbeMyNotes: TDBEdit;
    dbeTabN: TDBEdit;
    dbeFamIO: TDBEdit;
    bBtnNew: TBitBtn;
    dbeKdObj: TDBEdit;
    dbeObj: TDBEdit;
    dbeShVidN: TDBEdit;
    dbeKdKatP: TDBEdit;
    dbeKatP: TDBEdit;
    dbeSPZ: TDBEdit;
    dbeDtBeg: TDBEdit;
    dbeDtEnd: TDBEdit;
    MaskEdZaMG: TMaskEdit;
    dbeNmTemu: TDBEdit;
    dbeKdTemu: TDBEdit;
    popMnu: TPopupMenu;
    popMnuHead: TMenuItem;
    popMnuLittleHelp: TMenuItem;
    popMnuEdCalendar: TMenuItem;
    popShwBtns: TMenuItem;
    popBySredn3: TMenuItem;
    popBySredn6: TMenuItem;
    popBySredn12: TMenuItem;
    popByOklTrf: TMenuItem;
    popShowCalendar: TMenuItem;
    popZaMgCombo: TMenuItem;
    popZaMgMaskEdit: TMenuItem;
    dbtNDBE: TDBText;
    Label14: TLabel;
    Label15: TLabel;
    dbeKdSpZ: TDBEdit;
    dbeZaMesGod: TDBEdit;
    dbeCBudg: TDBEdit;
    dbeSpec_NR: TDBEdit;
    LbxFilter: TListBox;
    qryVOtp: TQuery;
    qryVOtpNR: TIntegerField;
    qryVOtpKDSPS: TSmallintField;
    qryVOtpDTPROC: TDateTimeField;
    qryVOtpTABN: TIntegerField;
    qryVOtpCUROKLTRF: TFloatField;
    qryVOtpALGRASCH: TSmallintField;
    qryVOtpUSEKOEFOKL: TStringField;
    qryVOtpNCHMATPOM: TStringField;
    qryVOtpNCHBUDMES: TStringField;
    qryVOtpRK: TStringField;
    qryVOtpNRPRIK: TStringField;
    qryVOtpDTPRIK: TDateTimeField;
    qryVOtpDTBEG: TDateTimeField;
    qryVOtpCNTDAYS: TSmallintField;
    qryVOtpDTEND: TDateTimeField;
    qryVOtpCNTCHAS: TFloatField;
    qryVOtpVIDN: TStringField;
    qryVOtpPROCOPL: TFloatField;
    qryVOtpKDTEMU: TSmallintField;
    qryVOtpKDOBJ: TSmallintField;
    qryVOtpKDKATP: TSmallintField;
    qryVOtpKDSPZ: TSmallintField;
    qryVOtpNOTES: TStringField;
    qryVOtpSMSRDN: TFloatField;
    qryVOtpSPEC_NR: TIntegerField;
    qryVOtpSMOTP: TFloatField;
    dsrcVOtp: TDataSource;
    updVOtp: TUpdateSQL;
    cdsTemp: TClientDataSet;
    cdsTempDtPrik: TDateField;
    dsrcTemp: TDataSource;
    cdsTempNrPrik: TStringField;
    dbeDtPrik: TDBEdit;
    dbeNrPrik: TDBEdit;
    dtPicDtBeg: TDateTimePicker;
    QryMultMnth: TQuery;
    UpdMultMnth: TUpdateSQL;

    procedure sBtnVidNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure sBtnObjClick(Sender: TObject);
    procedure sBtnKatPClick(Sender: TObject);
    procedure sBtnSPZClick(Sender: TObject);
    procedure dbeShVidNKeyDown(Sender: TObject; var Key: Word;
                                                     Shift: TShiftState);
    procedure dbeObjKeyDown(Sender: TObject; var Key: Word;
                                                     Shift: TShiftState);
    procedure dbeKatPKeyDown(Sender: TObject; var Key: Word;
                                                     Shift: TShiftState);
    procedure dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                     Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bBtnPereschetClick(Sender: TObject);
    procedure dbeDtBegChange(Sender: TObject);
    procedure dbeDtEndChange(Sender: TObject);
    procedure dtPicDtBegChange(Sender: TObject);
    procedure dtPicDtEndChange(Sender: TObject);
    procedure dtPicEnter(Sender: TObject);
    procedure dtPicExit(Sender: TObject);
    procedure DBComboZaMesGodEnter(Sender: TObject);
    procedure DBComboZaMesGodExit(Sender: TObject);
    procedure popMnuEdCalendarClick(Sender: TObject);
    procedure sBtnEdCalendClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure popBySredn3Click(Sender: TObject);
    procedure popBySredn6Click(Sender: TObject);
    procedure popByOklTrfClick(Sender: TObject);
    procedure popShwBtnsClick(Sender: TObject);
    procedure sBtnCalendarClick(Sender: TObject);
    procedure dbeTabNExit(Sender: TObject);
    procedure sBtnTabNClick(Sender: TObject);
    procedure dbeMyNotesExit(Sender: TObject);
    procedure dbeVidNExit(Sender: TObject);
    procedure sBtnSpecNRClick(Sender: TObject);
    procedure dbeMyNotesEnter(Sender: TObject);
    procedure bBtnNewClick(Sender: TObject);
    procedure popBySredn12Click(Sender: TObject);
    procedure MaskEdZaMGExit(Sender: TObject);
    procedure popZaMgComboClick(Sender: TObject);
    procedure popZaMgMaskEditClick(Sender: TObject);
    procedure MaskEdZaMGEnter(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure edSpZExit(Sender: TObject);
    procedure dbeVidNKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure DBComboZaMesGodKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeMyNotesKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure edSpZKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbeKdObjKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeTabNKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure sBtnKdTemuClick(Sender: TObject);
    procedure dbeKdTemuKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeKdTemuExit(Sender: TObject);
    procedure dbeChasExit(Sender: TObject);
    procedure dbeChasEnter(Sender: TObject);
    procedure qryVOtpAfterPost(DataSet: TDataSet);
    procedure qryVOtpAfterScroll(DataSet: TDataSet);
    procedure qryVOtpAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    dsrc_Otkl: TDataSource;
    DsOtkl: TDataSet;

    c_OrigVidN: string;
    n_OrigSpecNR: integer;

    bVidu88 : boolean;
    bEditMode : boolean;
    b_Pereschet : boolean;
    b_CanChangeTabN : boolean; // разрешается изменять табНр
//    bCallFromVedPV : boolean;  // вызов из массовых операций
    c_SvLastNewVidN : string4;
    nSvKdKatP : Smallint;
    cPredVidN : string4;
    nPredTabN : integer;

    // Saved handlers
    fldChangeHandler: TFieldNotifyEvent;

    // Custom handlers
    procedure qryOtklVIDNChange(Sender: TField);

    function CheckVvod : boolean;
    procedure SetCalendar;
    procedure SetBtnsState;
    procedure SetDialogState;
    procedure SetSposobVvodaZaMG;
    procedure CheckPrikazFlds(cVidN: string);
    procedure LoadQryVOtp;
    procedure OpenQryVOtp(nSpecNR: integer);
    procedure PreSaveData;
    procedure InsertVOtp(nSpecNR: integer);
    procedure EditVOtp;
    procedure DeleteVOtp;
    procedure OtklToVOtp;

    procedure SaveMultiMnth;
    procedure OpenQryMultMnth;
    procedure AddMultMnthOtkl(DtBeg, DtEnd: TDateTime);
  public
    class function AddEdtOtkl(DsrcOtkl: TDataSource; bCanChangeTabN : boolean;
      var bPereschet : boolean): Boolean;
  end;

const SECTION = 'z_EOtkl';

var
  FormEOtkl: TFormEOtkl;
  bFormReady : boolean;

implementation

uses
  Math, VarUtils, A_Const, a_Dm, A_SBU, A_Lib, A_ShwErr,z_ShwTem,
  Z_DM, Z_Main, z_TVids, Z_TObj, z_TUpi, Z_GtPers, z_GtSpNr, Z_CALEND,
  DateLib, DsLib, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFormEOtkl.AddEdtOtkl(
  DsrcOtkl: TDataSource;
  bCanChangeTabN: Boolean;
  var bPereschet: Boolean
): Boolean;
var
  cZaMesGod : string;
  n : integer;
begin
  Result := false;
  bFormReady := false;
  bPereschet := false;

  FormEOtkl := TFormEOtkl.Create(Application);

  with FormEOtkl do begin
    dsrc_Otkl := dsrcOtkl;
    DsOtkl := dsrc_Otkl.DataSet;

    LoadQryVOtp;

    c_OrigVidN := DsOtkl.FieldByName('VidN').AsString;
    n_OrigSpecNR := DsOtkl.FieldByName('Spec_NR').AsInteger;

    // Сохраняем обработчики и устанавливаем новые
    fldChangeHandler := DsOtkl.FieldByName('VidN').OnChange;
    DsOtkl.FieldByName('VidN').OnChange := qryOtklVIDNChange;

    CheckPrikazFlds(DsOtkl.FieldByName('VidN').AsString);

    cPredVidN := '';
    nPredTabN := 0;
    b_Pereschet := false;
    b_CanChangeTabN := bCanChangeTabN;

    dbeTabN.DataSource   := dsrcOtkl;
    dbeFamIO.DataSource  := dsrcOtkl;
    dbeKdObj.DataSource  := dsrcOtkl;
    dbeObj.DataSource    := dsrcOtkl;
    dbeDtBeg.DataSource  := dsrcOtkl;
    dbeDtEnd.DataSource  := dsrcOtkl;
    dbeChas.DataSource   := dsrcOtkl;
    dbeVidN.DataSource   := dsrcOtkl;
    dbeShVidN.DataSource := dsrcOtkl;
    dbeKdKatP.DataSource := dsrcOtkl;
    dbeKatP.DataSource   := dsrcOtkl;
    dbePdN.DataSource    := dsrcOtkl;
    dbeNotes.DataSource  := dsrcOtkl;
    dbeSumma.DataSource  := dsrcOtkl;
    dbeKdSpZ.DataSource  := dsrcOtkl;
    dbeSPZ.DataSource    := dsrcOtkl;
    DBComboZaMesGod.DataSource := dsrcOtkl;
    dbeZaMesGod.DataSource := dsrcOtkl;
    dbeMyNotes.DataSource := dsrcOtkl;
    dbeSpec_NR.DataSource := dsrcOtkl;
    dbtNDBE.DataSource := dsrcOtkl;
    dbeKdTemu.DataSource :=dsrcOtkl;
    dbeNmTemu.DataSource :=dsrcOtkl;
    dbeCBudg.DataSource :=dsrcOtkl;
    nSvKdKatP := dbeKdKatP.Field.AsInteger;

    if dsrcOtkl.State = dsInsert then begin
      bEditMode := false;
      Caption := 'Отклонения [новая запись]'; end
    else begin
      bEditMode := true;
      Caption := 'Отклонения [редактирование записи]';
      SetDialogState;
    end;

    cZaMesGod := dbeObj.DataSource.DataSet.
                              FieldByName('ZaMesGod').AsString;
    if not MyEmptyDate(cZaMesGod) then begin
      cZaMesGod := Copy(cZaMesGod, 4, 7);
      n := DBComboZaMesGod.Items.IndexOf(cZaMesGod);
      if n >= 0 then
        DBComboZaMesGod.ItemIndex := n;
    end;
    MaskEdZaMG.Text := Copy(cZaMesGod,1,2) + '-' + Copy(cZaMesGod,4,4);
    if dtPicDtBeg.Visible then begin
      dtPicDtBeg.ShowCheckbox := true;
      if not dbeDtBeg.Field.IsNull then
        dtPicDtBeg.Date := dbeDtBeg.Field.AsDateTime
      else
        dtPicDtBeg.Date := dDtProc;
      dtPicDtBeg.ShowCheckbox := false;
    end;
    if dtPicDtEnd.Visible then begin
      dtPicDtEnd.ShowCheckbox := true;
      if not dbeDtEnd.Field.IsNull then
        dtPicDtEnd.Date := dbeDtEnd.Field.AsDateTime
      else
        dtPicDtEnd.Date := dDtLastProcMes;
      dtPicDtEnd.ShowCheckbox := false;
    end;
    bFormReady := true;
    if bCanChangeTabN then begin
      dbeTabN.ReadOnly := false;
      dbeTabN.TabStop  := true;
      dbeTabN.Color    := clWindow;
      sBtnTabN.Enabled := true; end
    else begin
      dbeTabN.ReadOnly := true;
      dbeTabN.TabStop  := false;
      dbeTabN.Color    := clBtnFace;
      sBtnTabN.Enabled := false;
      ActiveControl    := dbeVidN;
    end;
    bBtnNew.Visible := not bEditMode;
    if ShowModal = mrOk then begin
      if dtPicDtBeg.Visible then
        dbeDtBeg.DataSource.DataSet.FieldByName('Dt_Beg').AsDateTime :=
                                                          dtPicDtBeg.Date;
      if dtPicDtEnd.Visible then
        dbeDtEnd.DataSource.DataSet.FieldByName('Dt_End').AsDateTime :=
                                                          dtPicDtEnd.Date;
      bPereschet := b_Pereschet;
      Result := true;
    end;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 400);
    Height := {258} 500;
    popMnuEdCalendar.Checked := false; // ReadBool(SECTION, 'bCalendar', false);
    popShwBtns.Visible := false;
    c_SvLastNewVidN := ReadString(SECTION, 'cLastNewVidN', '1003');
    popZaMgCombo.Checked := ReadBool(SECTION, 'bComboZaMG', true);
    popZaMgMaskEdit.Checked := not popZaMgCombo.Checked;
    Free;
  end;
  dbtNDBE.Visible := bFlagDbg;
  SetCalendar;
  SetBtnsState;
  dbeObj.ReadOnly := bAppZpObjVed;
  sBtnObj.Visible := not bAppZpObjVed;
  dtPicDtBeg.Top := dbeDtBeg.Top;
  dtPicDtEnd.Top := dtPicDtBeg.Top;
  MaskEdZaMG.Top := dbComboZaMesGod.Top;
  MaskEdZaMG.Left := dbComboZaMesGod.Left;
  //dbeSpZ.Visible := bFlagDbg;
  if FileExists(cDirVids + 'CmboZaMG.lbx') then
    dbComboZaMesGod.Items.LoadFromFile(cDirVids + 'CmboZaMG.lbx');
  SetSposobVvodaZaMG;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.FormCloseQuery(Sender: TObject;
                                               var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if CheckVvod then begin
      PreSaveData;
      SaveMultiMnth;
    end else begin
      ModalResult := mrNone;
      CanClose := false;
      dbeVidN.SetFocus;
    end;
  end;
  if bIsFormMyCalendar then
    FormMyCalendar.Close;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Восстанавливаем обработчики
  DsOtkl.FieldByName('VidN').OnChange := fldChangeHandler;

  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteBool(SECTION, 'bCalendar', popMnuEdCalendar.Checked);
    WriteBool(SECTION, 'BtnsChk', popShwBtns.Checked);
    WriteBool(SECTION, 'bComboZaMG', popZaMgCombo.Checked);
    if dbeVidN.DataSource.State = dsInsert then
      WriteString(SECTION, 'cLastNewVidN', dbeVidN.Field.AsString);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEOtkl.CheckVvod : boolean;
var
  Issues: TStringList;
  cVidN, cKdKatP: string4;
  bVidIsBudg: boolean;
begin
  Result := true;

  bVidIsBudg := dbeCBudg.Text = '1';
  Issues := TStringList.Create;
  Issues.Clear;
  if b_CanChangeTabN and ((dbeTabN.Text = '') or (dbeTabN.Text = '0')) then
    Issues.Add('Не введен табельный номер');
  if (dbeShVidN.Text = '') then
    Issues.Add('Не введен вид отклонения');
  cVidN := dbeVidN.Text;
  if (cVidN = '8801') or (cVidN = '8802') then
    bVidu88 := true
  else
    bVidu88 := false;
  if not bVidu88 and (dbeObj.Text = '') then
    Issues.Add('Не выбрано подразделение');
  if not bVidu88 and (dbeKatP.Text = '') then
    Issues.Add('Не выбрана категория персонала');
  if not bVidu88 and (dbeSPZ.Text = '') then
    Issues.Add('Не выбран счет БухУчета (источник финансирования)');
  cVidN := dbeVidN.Text;
  if not bVidu88 and bVidIsBudg and
              (MyEmptyDate(dbeDtBeg.Text) or MyEmptyDate(dbeDtEnd.Text)) then
    Issues.Add('Не заполнены даты начала и окончания для бюджетного вида');
  cKdKatP := dbeKdKatP.Text;
  if bFlagOpi and  Form_Dm.VidIsTrS(cVidN) {ТрСогл} and (cKdKatP <> '13') then
    dbeKdKatP.Field.AsInteger := 13; {исправляю KdKatP на 13 (ДгвГПД)}

  if Issues.Count > 0 then begin
    if (Issues.Count = 1) and (Issues.Strings[0] =
        'Не заполнены даты начала и окончания для бюджетного вида')
    then
      ShowErrors(Issues, true) {A_ShwErr}
    else begin
      ShowErrors(Issues);
      Result := false;
    end;
  end;

  if Result then
    with dbeVidN.DataSource.DataSet do begin
      cVidN := FieldByName('VidN').AsString;
      if cVidN = Z_VIDPERESCHETA then begin
        FieldByName('Dt_End').AsString := FieldByName('Dt_Beg').AsString;
        FieldByName('Chas').AsFloat := 0;
        FieldByName('Summa').AsFloat := 0; end
      else if (cVidN >= '5000') and (cVidN < '5100') then {неоплачиваемые виды}
        FieldByName('Summa').AsFloat := 0;
    end;

  Issues.Destroy;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.bBtnNewClick(Sender: TObject);
begin
  if CheckVvod then begin
    PreSaveData;
    with dbeTabN.DataSource.DataSet do begin
      cPredVidN := FieldByName('VidN').AsString;
      nPredTabN := FieldByName('TabN').AsInteger;
      Post;

      Append;    // Все необходимые поля заполнятся по OnNewRecord
      CheckPrikazFlds(DsOtkl.FieldByName('VidN').AsString);
      cdsTempDtPrik.AsString := '';
      cdsTempNrPrik.AsString := '';

      if b_CanChangeTabN then
        dbeTabN.SetFocus
      else
        dbeVidN.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.bBtnPereschetClick(Sender: TObject);
begin
  if CheckVvod then begin
    b_Pereschet := true;
    ModalResult := mrOk;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.sBtnVidNClick(Sender: TObject);
var cVidN, p_KEKV : string4; p_ShVidN : string15; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                     p_KdSpZ : integer; bWasUpdated : boolean;
begin
  dbeShVidN.SetFocus;
  with dbeVidN.DataSource.DataSet as TQuery do begin
    cVidN := FieldByName('VidN').AsString;
    if GetVidN(cVidN, p_KEKV, p_ShVidN, p_NmVidN,
               p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
               p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
               p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
               p_SAlim, p_SSocStrah, p_SBzr, p_CNdb, p_Sp_PF, p_Sp_FSTVP,
               p_Sp_FSNV, p_Sp_FZ, p_KdSpZ, bWasUpdated, LbxFilter) {z_TVids}
                                                                    then begin
      if bWasUpdated then begin
        DmMain.qryVidN_LU.Close;
        DmMain.qryVidN_LU.Open;
      end;
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('VidN').AsString := cVidN;
      FieldByName('ShVidN').AsString := p_ShVidN;
      if ((cVidN >= '2400') and (cVidN < '2500')) {отпускные} or
             ((cVidN >= '2600') and (cVidN < '2700')) {больничнные} or
          ((cVidN >= '6601') and (cVidN <= '6602')) {алим.или п/сбор} then begin

        // Issue 220810 - Ошибки в диалоге отклонений <<<
        dbeMyNotes.DataSource.DataSet.FieldByName('PrPv').AsInteger := 7;
        // >>>

        dbeMyNotes.SetFocus;
      end
      else begin
        dbeMyNotes.Field.AsString := '';
        if (cVidN <> '5005') and (cVidN <> '5008') then
          dbeMyNotes.DataSource.DataSet.FieldByName('Spec_NR').AsString := '';
        dbeObj.SetFocus;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeVidNExit(Sender: TObject);
begin
  SetDialogState;
  (Sender as TDBEdit).Color := clWindow;     {dbeVidN}
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.SetDialogState;
var
  cVidN : string4;
begin
  cVidN := dbeVidN.Field.AsString;
  with dbeVidN.DataSource.DataSet as TQuery do begin
    if ((cVidN >= '2400') and (cVidN < '2500')) {отпускные} or
          ((cVidN >= '2600') and (cVidN < '2700')) {больничнные} or
          ((cVidN >= '6601') and (cVidN <= '6602')) {алим.или п/сбор} then begin

      sBtnSpecNR.Enabled := true;
      dbeMyNotes.DataSource.DataSet.FieldByName('PrPv').AsInteger := 7;
      dbeMyNotes.Color := clWindow; end
    else begin
      if Form_Dm.VidIsTrS(cVidN) then  // трудовые соглашения (1005,1006,1008)
        dbeKdKatP.Field.AsInteger := 13
      else
        dbeKdKatP.Field.AsInteger := nSvKdKatP;
      sBtnSpecNR.Enabled := false;
      dbeMyNotes.Field.AsString := '';
      dbeMyNotes.DataSource.DataSet.FieldByName('PrPv').AsInteger := 1;
      dbeMyNotes.Color := clBtnFace;
    end;
    LabelCntChas.Caption := 'Количество часов';

    if (cVidN = '1002') or (cVidN = '1201') or (cVidN = '1202')
        or (cVidN = '1204') or (cVidN = '1207')
        or (cVidN = '1640') or (cVidN = '2406') then begin // неисп.отпуск
      // LabelCntChas.Caption := 'Количество дней';
      // LabelCntChas.Refresh;
      dbeChas.ReadOnly := false;
//      dbeChas.SetFocus;
      FormEOtkl.ActiveControl := dbeChas;
      dbeChas.Color   := clYellow;
     end;
    if (cVidN = '8801') or (cVidN = '8802') then begin  {пересчёты}
      FieldByName('Dt_Beg').AsString := '';
      FieldByName('Dt_End').AsString := '';
      FieldByName('Chas').AsString := ''; end
    else if FieldByName('NDBE').AsString = '1' then begin
      FieldByName('Dt_Beg').AsDateTime := FieldByName('ZaMesGod').AsDateTime;
      FieldByName('Dt_End').AsDateTime :=
                           MyLastDOM(FieldByName('ZaMesGod').AsDateTime); end
    else if cVidN = '2201' then begin  {Прочие премии - почему?}
      FieldByName('Dt_Beg').AsString := '';
      FieldByName('Dt_End').AsString := '';
      FieldByName('Chas').AsString := ''; end
    else if (cVidN = '8801') or (cVidN = '8802') then begin  {пересчёты}
      FieldByName('Dt_Beg').AsString := '';
      FieldByName('Dt_End').AsString := '';
      FieldByName('Chas').AsString := ''; end
    else if not bEditMode then begin
      if (FieldByName('VidN').AsString <> '5005')
        and (FieldByName('VidN').AsString <> '5008') then
      begin
        if (FieldByName('VidN').AsString <> '1204')
          and (FieldByName('VidN').AsString <> '1207')
        then
          FieldByName('Dt_Beg').AsString := '';

        FieldByName('Dt_End').AsString := '';
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.sBtnSpecNRClick(Sender: TObject);
var cVidN : string4; nTabN, nSpNr : integer; cMyNotes : ShortString;
begin
  cVidN := dbeVidN.Field.AsString;
  nTabN := dbeTabN.Field.AsInteger;
  if ((cVidN >= '2400') and (cVidN < '2500')) {отпускные} then begin
    nSpNr := GetOtpSpecNR(nTabN, cMyNotes); {z_GtSpNr}
    if nSpNr <> 0 then begin
      dbeMyNotes.Field.AsString := cMyNotes;
      dbeMyNotes.DataSource.DataSet.FieldByName('Spec_NR').AsInteger := nSpNr;
      dbeMyNotes.DataSource.DataSet.FieldByName('PrPv').AsInteger := 7;
    end; end
  else if ((cVidN >= '2600') and (cVidN < '2700')) {больничнные} then begin
    nSpNr := GetBlnSpecNR(nTabN, cMyNotes); {z_GtSpNr}
    if nSpNr <> 0 then begin
      dbeMyNotes.Field.AsString := cMyNotes;
      dbeMyNotes.DataSource.DataSet.FieldByName('Spec_NR').AsInteger := nSpNr;
      dbeMyNotes.DataSource.DataSet.FieldByName('PrPv').AsInteger := 7;
    end; end
  else if ((cVidN >= '6601') and (cVidN <= '6602')) {алим.или п/сбор} then begin
    nSpNr := GetAlmSpecNR(nTabN, cMyNotes); {z_GtSpNr}
    if nSpNr <> 0 then begin
      dbeMyNotes.Field.AsString := cMyNotes;
      dbeMyNotes.DataSource.DataSet.FieldByName('Spec_NR').AsInteger := nSpNr;
      dbeMyNotes.DataSource.DataSet.FieldByName('PrPv').AsInteger := 7;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeMyNotesKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_RETURN) then
    sBtnSpecNRClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.sBtnObjClick(Sender: TObject);
var nKdObj, nKdSpZ : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  dbeObj.SetFocus;
  nKdObj := dbeObj.DataSource.DataSet.FieldByName('KdObj').AsInteger;
  if GetKdObj(nKdObj, nKdSpZ, cShObj, cNmObj, bWasUpdated) {z_TObj} then begin
    dbeObj.DataSource.DataSet.FieldByName('KdObj').AsInteger := nKdObj;
    dbeObj.Field.AsString := cShObj;
    dbeKdKatP.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeKdObjKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObj.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer; cNmKatP, cShKatP : string;
begin
  dbeKatP.SetFocus;
  nKdKatP := dbeKatP.DataSource.DataSet.FieldByName('KdKatP').AsInteger;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {Z_GtPers} then begin
    dbeKatP.DataSource.DataSet.FieldByName('KdKatP').AsInteger := nKdKatP;
    dbeKatP.Field.AsString := cShKatP;
    dbeKdTemu.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.sBtnSPZClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSPZ.SetFocus;
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSpZ := dbeKdSpZ.Field.AsInteger;
    cSchBU := dbeSpZ.Field.AsString;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if bHsCh then begin
        ShowMessage('Выбранный счет имеет СубСчета - на него относить нельзя');
        dbeSPZ.SetFocus;
        Exit;
      end;
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      dbeKdSpZ.Field.AsInteger := nKdSpZ;
      dbeSpZ.Field.AsString := cSchBU;
      if popZaMgCombo.Checked then
        DBComboZaMesGod.SetFocus
      else
        MaskEdZaMG.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeShVidNKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVidnClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeVidNKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVidnClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeObjKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObjClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeKatPKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKatPClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZ.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.DBComboZaMesGodKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    DBComboZaMesGod.Show;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeDtBegChange(Sender: TObject);
begin
  if not bFormReady then Exit;
  dtPicDtBeg.ShowCheckbox := true;
  dtPicDtBeg.Date :=
            dbeDtBeg.DataSource.DataSet.FieldByName('Dt_Beg').AsDateTime;
  dtPicDtBeg.ShowCheckbox := false;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dtPicDtBegChange(Sender: TObject);
begin
  if dtPicDtBeg.Visible then
    dbeDtBeg.DataSource.DataSet.
                     FieldByName('Dt_Beg').AsDateTime := dtPicDtBeg.Date;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeDtEndChange(Sender: TObject);
begin
  if not bFormReady then Exit;
  dtPicDtEnd.ShowCheckbox := true;
  dtPicDtEnd.Date :=
            dbeDtEnd.DataSource.DataSet.FieldByName('Dt_End').AsDateTime;
  dtPicDtEnd.ShowCheckbox := false;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dtPicDtEndChange(Sender: TObject);
begin
  dbeDtEnd.DataSource.DataSet.
                     FieldByName('Dt_End').AsDateTime := dtPicDtEnd.Date;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeKdTemuExit(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
    nTabN : integer; dOnDate : TDateTime;
    nKdSpZ: SmallInt; cSchBU: ShortString;
begin
  if not dbeKdTemu.Field.IsNull then begin  // поставить в dbeKdSpZ и в
    nKdTemu := dbeKdTemu.Field.AsInteger;   // dbeSpZ "темные" значения сёчёта
    if CheckKdTemu(nKdTemu, nKdPSch, cNmTemu, cPSch) {z_ShwTem} then begin
      dbeNmTemu.Field.AsString := cNmTemu;
      dbeKdSpZ.Field.AsInteger  := nKdPSch;
      dbeSpZ.Field.AsString     := cPSch;
      (Sender as TDBEdit).Color := clWindow;
      dbeSpZ.SetFocus; end
    else begin
      DbeKdTemu.SetFocus;
      ShowMessage('Нет темы "' + IntToStr(NKdTemu) + '" в справочнике тем');
    end; end
  else begin  // в dbeKdSpZ и в dbeSpZ значения сёчёта по умоланию
    nTabN := dbeTabN.Field.AsInteger;
    dOnDate := dDtProc;
    if Form_Dm.GetSpZByPere(nTabN, dOnDate, nKdSpZ, cSchBU) then begin
      dbeNmTemu.Field.AsString := '';
      dbeKdSpZ.Field.AsInteger := nKdSpZ;
      dbeSpZ.Field.AsString    := cSchBU;
      (Sender as TDBEdit).Color := clWindow;
      dbeSpZ.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeTabNExit(Sender: TObject);
begin
  if b_CanChangeTabN then
    (Sender as TDBEdit).Color := clWindow
  else
    (Sender as TDBEdit).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.EditEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.edSpZExit(Sender: TObject);
var cSchBU, cPSch : string; nKdSbu : integer; bHsCh : boolean;
begin
  if dbeSpZ.Text > '' then begin
      cSchBU := dbeSpZ.Text;
    if CheckSBU(nKdSbu, cSchBU, cPSch, bHsCh) {a_SBU} then begin
      if not bHsCh then begin
        (dbeSPZ.DataSource.DataSet as TQuery).
                                     FieldByName('KdSpZ').AsInteger := nKdSbu;
        dbeSpZ.Text := cSchBU;
        (Sender as TEdit).Color := clWindow; end
      else begin
        ShowMessage('Выбранный счет имеет СубСчета - на него относить нельзя');
        dbeSPZ.SetFocus;
        Exit;
      end; end
    else
      dbeSpZ.SetFocus;
    end
  else begin
    (dbeSPZ.DataSource.DataSet as TQuery).FieldByName('KdSpZ').AsString := '';
    (Sender as TEdit).Color := clWindow;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.edSpZKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.EditExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeMyNotesEnter(Sender: TObject);
begin
  if sBtnSpecNR.Enabled then
    (Sender as TDBEdit).Color := clYellow
  else
    (Sender as TDBEdit).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeMyNotesExit(Sender: TObject);
begin
  if sBtnSpecNR.Enabled then
    (Sender as TDBEdit).Color := clWindow
  else
    (Sender as TDBEdit).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dtPicEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dtPicExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.DBComboZaMesGodEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.DBComboZaMesGodExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clWindow;
  with dbeVidN.DataSource.DataSet do begin
    if FieldByName('VidN').AsString = Z_VIDPERESCHETA then begin
      {
      FieldByName('Dt_Beg').AsDateTime := FieldByName('ZaMesGod').AsDateTime;
      FieldByName('Dt_End').AsDateTime := FieldByName('ZaMesGod').AsDateTime;
      FieldByName('Chas').AsFloat := 0;
      FieldByName('Summa').AsFloat := 0;
      }
       end
    else if FieldByName('NDBE').AsString <> '1' then begin
//      FieldByName('Dt_Beg').AsString := '';
//      FieldByName('Dt_End').AsString := '';
    end;
  end;    
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.popMnuEdCalendarClick(Sender: TObject);
begin
(*
  popMnuEdCalendar.Checked := not popMnuEdCalendar.Checked;
  sBtnEdCalend.Down := popMnuEdCalendar.Checked;
  SetCalendar;
*)
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.SetCalendar;
begin
  dtPicDtBeg.Visible := popMnuEdCalendar.Checked;
  dtPicDtEnd.Visible := dtPicDtBeg.Visible;
  dbeDtBeg.Visible := not dtPicDtBeg.Visible;
  dbeDtEnd.Visible := not dtPicDtEnd.Visible;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.sBtnEdCalendClick(Sender: TObject);
begin
//  popMnuEdCalendar.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.popMnuPopup(Sender: TObject);
begin
  if popMnu.PopupComponent = dbeSumma then begin
    popMnuHead.Caption := '== Рассчитать сумму ==';
    popMnuLittleHelp.Visible := false;
    popMnuEdCalendar.Visible := false;
    popShwBtns.Visible := false;
    popBySredn3.Visible := true;
    popBySredn6.Visible := true;
    popBySredn12.Visible := true;
    popByOklTrf.Visible := true;
    popShowCalendar.Visible := false;
    popZaMgCombo.Visible := false;
    popZaMgMaskEdit.Visible := false; end
  else if (popMnu.PopupComponent = DBComboZaMesGod) or
            (popMnu.PopupComponent = MaskEdZaMG) then begin
    popMnuHead.Caption := '== Ввод иесяца "За" ==';
    popMnuLittleHelp.Visible := false;
    popMnuEdCalendar.Visible := false;
    popShwBtns.Visible := false;
    popBySredn3.Visible := false;
    popBySredn6.Visible := false;
    popBySredn12.Visible := false;
    popByOklTrf.Visible := false;
    popShowCalendar.Visible := false;
    popZaMgCombo.Visible := true;
    popZaMgMaskEdit.Visible := true; end
  else begin
    popMnuHead.Caption := '== Общие настройки ==';
    popMnuLittleHelp.Visible := true;
    popMnuEdCalendar.Visible := false;  // true;
    popShwBtns.Visible := false;        // true;
    popBySredn3.Visible := false;
    popBySredn6.Visible := false;
    popBySredn12.Visible := false;
    popByOklTrf.Visible := false;
    popShowCalendar.Visible := true;
    popZaMgCombo.Visible := false;
    popZaMgMaskEdit.Visible := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.popBySredn3Click(Sender: TObject);
var nSmm, nCurBudget : double;  dDtBeg : TDateTime; nTabN : integer;
    nY, nM, nD : word;
begin
  with dbeChas.DataSource.DataSet do begin
    if (FieldByName('Chas').asFloat = 0) then begin
      ShowMessage('Должно быть ненулевым количество часов');
      Exit; end
    else begin
      nTabN := FieldByName('TabN').AsInteger;
      dDtBeg := FieldByName('Dt_Beg').AsDateTime;
      DecodeDate(dDtBeg, nY, nM, nD);
      nCurBudget := DmMain.Budget(nY, nM, nCurCntDay, nCurCntWorkDay);
      nSmm := DmMain.MySredneMes(3, nTabN, dDtBeg) /
                                     nCurBudget * FieldByName('Chas').AsFloat;
      FieldByName('Summa').AsFloat := nSmm;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.popBySredn6Click(Sender: TObject);
var nSmm, nCurBudget : double;  dDtBeg : TDateTime; nTabN : integer;
    nY, nM, nD : word;
begin
  with dbeChas.DataSource.DataSet do begin
    if MyEmptyDate(FieldByName('Dt_Beg').AsString) or
                   (FieldByName('Chas').asFloat = 0) then begin
      ShowMessage('Должны быть заполненными поля' + #13#10 +
                  '"Дата начала" и "К-во часов"');
      Exit; end
    else begin
      nTabN := FieldByName('TabN').AsInteger;
      dDtBeg := FieldByName('Dt_Beg').AsDateTime;
      DecodeDate(dDtBeg, nY, nM, nD);
      nCurBudget := DmMain.Budget(nY, nM, nCurCntDay, nCurCntWorkDay);
      nSmm := DmMain.MySredneMes(6, nTabN, dDtBeg) /
                                     nCurBudget * FieldByName('Chas').AsFloat;
      FieldByName('Summa').AsFloat := nSmm;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.popBySredn12Click(Sender: TObject);
var nSmm, nCurBudget : double;  dDtBeg : TDateTime; nTabN : integer;
    nY, nM, nD : word;
begin
  with dbeChas.DataSource.DataSet do begin
    if MyEmptyDate(FieldByName('Dt_Beg').AsString) or
                   (FieldByName('Chas').asFloat = 0) then begin
      ShowMessage('Должны быть заполненными поля' + #13#10 +
                  '"Дата начала" и "К-во часов"');
      Exit; end
    else begin
      nTabN := FieldByName('TabN').AsInteger;
      dDtBeg := FieldByName('Dt_Beg').AsDateTime;
      DecodeDate(dDtBeg, nY, nM, nD);
      nCurBudget := DmMain.Budget(nY, nM, nCurCntDay, nCurCntWorkDay);
      nSmm := DmMain.MySredneMes(12, nTabN, dDtBeg) /
                                     nCurBudget * FieldByName('Chas').AsFloat;
      FieldByName('Summa').AsFloat := nSmm;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.popByOklTrfClick(Sender: TObject);
var nSmm, nBudget, nOklTrf, nAvans, nProcLG : double;
    dDtBeg, dDtPrikaza : TDateTime;
    nY, nM, nD : word;
    nTabN, nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr : integer;
    cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    bPens, bSovm, bPrfs : boolean;  nInv : SmallInt;
begin
  with dbeChas.DataSource.DataSet do begin
    if MyEmptyDate(FieldByName('Dt_Beg').AsString) or
                   (FieldByName('Chas').asFloat = 0) then begin
      ShowMessage('Должны быть заполненными поля' + #13#10 +
                  '"Дата начала" и "К-во часов"');
      Exit; end
    else begin
      nTabN := FieldByName('TabN').AsInteger;
      dDtBeg := FieldByName('Dt_Beg').AsDateTime;
      DecodeDate(dDtBeg, nY, nM, nD);
      nBudget := DmMain.Budget(nY, nM, nCurCntDay, nCurCntWorkDay);
      // Оклад/Тариф определяю по состоянию на dDtBeg, не мороча голову
      // с возможными его изменениями в период между dDtBeg и dDtEnd
      DmMain.GetPereInf(nTabN, dDtBeg, nKdObj, nKdKatP, nSO,
                                  nPdNlg, nKolMin, nKdSpz, nRang, nRazr,
                                  nOklTrf, nAvans, nProcLG, cSpAv,
                                  cDolgnost, cNrPrikaza, dDtPrikaza,
                                  bPens, bSovm, bPrfs, nInv);
      if nSO = 1 then    // Оклад
        nSmm := nOklTrf / nBudget * FieldByName('Chas').AsFloat
      else               // Часовой тариф
        nSmm := nOklTrf * FieldByName('Chas').AsFloat;
      FieldByName('Summa').AsFloat := nSmm;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.SetBtnsState;
begin
//  sBtnEdCalend.Visible := false;    // popShwBtns.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.popShwBtnsClick(Sender: TObject);
begin
  popShwBtns.Checked := not popShwBtns.Checked;
  SetBtnsState;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.sBtnCalendarClick(Sender: TObject);
begin
//  FormZpMain.sBtnCalendarClick(Self);
  if not bIsFormCalendar then
    ShowMyCalendar    {Z_Calend}
  else begin
    if FormMyCalendar.WindowState = wsMinimized then
      FormMyCalendar.WindowState := wsNormal;
    FormMyCalendar.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.sBtnTabNClick(Sender: TObject);
var nTabN, nKdObj, nKdKatP : integer; n_KdSps : SmallInt;
    cFam, cIma, cOtch :string;  bWasUpdated : boolean;
begin
  if not sBtnTabN.Enabled then Exit; {если DblClick на dbeTabN и dbeFamIO}
  nTabN := dbeTabN.Field.AsInteger;
  dbeFamIO.SetFocus;
  Application.ProcessMessages;
  if GetTabN(nTabN, nKdObj, nKdKatP, n_KdSps, cFam, cIma, cOtch,
                                             bWasUpdated) {z_TUpi} then begin
    dbeTabN.Field.AsInteger := nTabN;
    if not bEditMode then
      dbeObj.Field.DataSet.FieldByName('KdObj').AsInteger := nKdObj;
    if not bEditMode then
      dbeKatP.Field.DataSet.FieldByName('KdKatP').AsInteger := nKdKatP;
    dbeVidN.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeTabNKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnTabN.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.MaskEdZaMGEnter(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.MaskEdZaMGExit(Sender: TObject);
var cText, cMes, cGod, cZaMesGod : ShortString; nMes, nGod, n : SmallInt;
    bPravimMes, bPravimGod : boolean;
begin
  if ModalResult = mrCancel then Exit;
  cText := MaskEdZaMG.Text;
  bPravimMes := false;
  bPravimGod := false;
  if (cText <> '  -    ') then begin
    cMes := Trim(Copy(cText, 1, 2));
    cGod := Trim(Copy(cText, 4, 4));
    nMes := StrToInt(cMes);
    nGod := StrToInt(cGod);
    if (nGod >= 0) and (nGod < 80) then begin
      bPravimGod := true;
      cGod := '20' + cGod; end
    else if (nGod >= 80) and (nGod <= 99) then begin
      bPravimGod := true;
      cGod := '19' + cGod;
    end;
    if (Length(cMes) = 1) and (nMes >= 1) and (nMes < 10) then begin
      cMes := '0' + cMes;
      bPravimMes := true;
    end;
    if bPravimMes or bPravimGod then
      MaskEdZaMG.Text := cMes + '-' + cGod;

    if (cMes < '01') or (cMes > '12') or
                        (cGod < '1997') or (cGod > '2030') then begin
      ShowMessage('Плохой месяц: ' + cMes + '-' + cGod);
      MaskEdZaMG.SetFocus; end
    else begin
      nMes := StrToInt(cMes);
      nGod := StrToInt(cGod);
      //DBComboZaMesGod.DataSource.DataSet.
      //       FieldByName('ZaMesGod').AsDateTime := EncodeDate(nGod, nMes, 1);
      // dbeZaMesGod.Field.OnValidate := nill; Нельзя отсюда восстановить после ввода
      dbeZaMesGod.Field.AsDateTime := EncodeDate(nGod, nMes, 1);
      cZaMesGod := Copy(DBComboZaMesGod.DataSource.DataSet.
                              FieldByName('ZaMesGod').AsString, 4, 7);
      n := DBComboZaMesGod.Items.IndexOf(cZaMesGod);
      if n >= 0 then
        DBComboZaMesGod.ItemIndex := n;
      (Sender as TMaskEdit).Color := clWindow;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.popZaMgComboClick(Sender: TObject);
begin
  if not popZaMgCombo.Checked then begin
    popZaMgCombo.Checked := true;
    popZaMgMaskEdit.Checked := false;
    SetSposobVvodaZaMG;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.popZaMgMaskEditClick(Sender: TObject);
begin
  if not popZaMgMaskEdit.Checked then begin
    popZaMgMaskEdit.Checked := true;
    popZaMgCombo.Checked := false;
    SetSposobVvodaZaMG;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.SetSposobVvodaZaMG;
begin
  DBComboZaMesGod.Visible := popZaMgCombo.Checked;
  MaskEdZaMG.Visible := popZaMgMaskEdit.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.sBtnKdTemuClick(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
begin
  dbeKdTemu.SetFocus;
  with dbeKdTemu.DataSource.DataSet as TQuery do begin
    nKdTemu := dbeKdTemu.Field.AsInteger;
    cNmTemu := dbeNmTemu.Field.AsString;
    if GetTemu(nKdTemu, nKdPSch, cNmTemu, cPSch) {z_ShwTem} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      dbeKdTemu.Field.AsInteger := nKdTemu;
      dbeNmTemu.Field.AsString  := cNmTemu;
      dbeKdSpZ.Field.AsInteger  := nKdPSch;
      dbeSpZ.Field.AsString     := cPSch;
      dbeKdTemu.OnExit := NIL;
      dbeSpZ.SetFocus;
      dbeKdTemu.OnExit := dbeKdTemuExit;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeKdTemuKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_RETURN) then
    sBtnKdTemuClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeChasExit(Sender: TObject);
begin
  if dbeChas.ReadOnly then
    dbeChas.Color := clBtnFace
  else
    dbeChas.Color := clWindow;
//  SetDialogState;
end;
//------------------------------------------------------------------------------
procedure TFormEOtkl.dbeChasEnter(Sender: TObject);
begin
  if dbeChas.ReadOnly then
    dbeChas.Color := clBtnFace
  else
    dbeChas.Color := clYellow;
  SetDialogState;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.qryOtklVIDNChange(Sender: TField);
begin
  // Вызываем оригинальный обработчик
  if Assigned(fldChangeHandler) then
    fldChangeHandler(Sender);

  // Выполняем свою обработку
  CheckPrikazFlds(Sender.Value);
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.CheckPrikazFlds(cVidN: string);
begin
  if (cVidN = '5005') or (cVidN = '5008') then begin
    dbeNrPrik.Enabled := true;
    dbeDtPrik.Enabled := true;
    dbeNrPrik.Color := clWindow;
    dbeDtPrik.Color := clWindow
  end
  else begin
    dbeNrPrik.Enabled := false;
    dbeDtPrik.Enabled := false;
    dbeNrPrik.Color := clBtnFace;
    dbeDtPrik.Color := clBtnFace
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.LoadQryVOtp;
var
  nSpecNR: integer;
begin
  cdsTemp.CreateDataSet;
  cdsTemp.Append;

  nSpecNR := DsOtkl.FieldByName('Spec_NR').AsInteger;

  if nSpecNR > 0 then begin
    OpenQryVOtp(nSpecNR);

    //if not qryVOtp.Eof then begin
      cdsTempDtPrik.AsString := qryVOtpDTPrik.AsString;
      cdsTempNrPrik.AsString := qryVOtpNRPRIK.AsString;
    //end;

    z_DM.ReleaseQuery(qryVOtp);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.PreSaveData;
var
  cVidN: string;
  nSpecNR: integer;
begin
  cVidN := DsOtkl.FieldByName('VidN').AsString;
  nSpecNR := DsOtkl.FieldByName('Spec_NR').AsInteger;

  if nSpecNR = 0 then begin
    nSpecNR := DmMain.NewSpec_NR;
    DsOtkl.FieldByName('Spec_NR').AsInteger := nSpecNR;
  end;

  if (cVidN = '5005') or (cVidN = '5008') then begin
    OpenQryVOtp(nSpecNr);

    if (nSpecNR = 0) or qryVOtp.Eof then
      InsertVOtp(nSpecNR)
    else
      EditVOtp;

    z_DM.ReleaseQuery(qryVOtp);
  end
  else
    if (c_OrigVidN = '5005') or (c_OrigVidN = '5008') then begin
      OpenQryVOtp(n_OrigSpecNr);

      if not qryVOtp.Eof then
        DeleteVOtp;

      z_DM.ReleaseQuery(qryVOtp);
    end
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.OpenQryVOtp(nSpecNR: integer);
begin
  with qryVOtp do begin
    z_DM.InitQuery(qryVOtp);

    SQL.Add('select * from Z_VOtp where Spec_NR = :nSpecNR');
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.InsertVOtp(nSpecNR: integer);
begin
  qryVOtp.Append;
  OtklToVOtp;
  qryVOtpSPEC_NR.AsInteger := nSpecNR;
  qryVOtp.Post;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.EditVOtp;
begin
  qryVOtp.Edit;
  OtklToVOtp;
  qryVOtp.Post;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.DeleteVOtp;
begin
  qryVOtp.Delete;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.OtklToVOtp;
begin
  qryVOtpTABN.AsInteger := DsOtkl.FieldByName('TabN').AsInteger;
  qryVOtpVIDN.AsString := DsOtkl.FieldByName('VidN').AsString;
  qryVOtpDTPROC.AsDateTime := DsOtkl.FieldByName('DtProc').AsDateTime;
  qryVOtpKDSPS.AsInteger := DsOtkl.FieldByName('KdSps').AsInteger;
  qryVOtpKDOBJ.AsInteger := DsOtkl.FieldByName('KdObj').AsInteger;
  qryVOtpKDKATP.AsInteger := DsOtkl.FieldByName('KdKatP').AsInteger;
  qryVOtpKDSPZ.AsInteger := DsOtkl.FieldByName('KdSpz').AsInteger;
  qryVOtpKDTEMU.AsInteger := DsOtkl.FieldByName('KdTemu').AsInteger;
  qryVOtpDTPRIK.AsString := cdsTempDtPrik.AsString;
  qryVOtpNRPRIK.AsString := cdsTempNrPrik.AsString;
  qryVOtpDTBEG.AsString := DsOtkl.FieldByName('Dt_Beg').AsString;
  qryVOtpDTEND.AsString := DsOtkl.FieldByName('Dt_End').AsString;
  qryVOtpCNTCHAS.AsFloat := DsOtkl.FieldByName('Chas').AsFloat;
  qryVOtpSMOTP.AsFloat := DsOtkl.FieldByName('Summa').AsFloat;
  qryVOtpNOTES.AsString := DsOtkl.FieldByName('Notes').AsString;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.qryVOtpAfterScroll(DataSet: TDataSet);
begin
  cdsTempDtPrik.AsString := qryVOtpDTPRIK.AsString;
  cdsTempNrPrik.AsString := qryVOtpNRPRIK.AsString;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.qryVOtpAfterPost(DataSet: TDataSet);
begin
  if qryVOtp.UpdatesPending then
    qryVOtp.ApplyUpdates;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.qryVOtpAfterDelete(DataSet: TDataSet);
begin
  if qryVOtp.UpdatesPending then
    qryVOtp.ApplyUpdates;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.SaveMultiMnth;
var
  VidN: ShortString;
  MnthYear, DtBeg, DtEnd, CurMnth: TDateTime;
begin
  with DsOtkl do begin
    VidN := FieldByName('VidN').AsString;

    if (VidN <> '5005') and (VidN <> '5008') then
      exit;

    MnthYear := FieldByName('ZaMesGod').AsDateTime;
    DtBeg := FieldByName('Dt_Beg').AsDateTime;
    DtEnd := FieldByName('Dt_End').AsDateTime;

    if (DtBeg >= MnthYear) and (DtEnd <= DateUtils.EndOfMonth(MnthYear)) then
      exit;
  end;

  OpenQryMultMnth;

  CurMnth := DtBeg;

  // До "ЗаМесГод'
  while CurMnth < MnthYear do begin
    AddMultMnthOtkl(CurMnth, DtEnd);
    CurMnth := DateUtils.NextMonth(CurMnth);
  end;

  // Корректируем даты самого "ЗаМесГод'
  with DsOtkl do begin
    FieldByName('Dt_Beg').AsDateTime := Max(DtBeg, CurMnth);
    FieldByName('Dt_End').AsDateTime :=
      Min(DtEnd, DateUtils.EndOfMonth(CurMnth));
  end;

  CurMnth := DateUtils.NextMonth(MnthYear);

  // После "ЗаМесГод'
  while CurMnth <= DtEnd do begin
    AddMultMnthOtkl(CurMnth, DtEnd);
    CurMnth := DateUtils.NextMonth(CurMnth);
  end;

  QryMultMnth.ApplyUpdates;
  QryMultMnth.CommitUpdates;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.AddMultMnthOtkl(DtBeg, DtEnd: TDateTime);
begin
  with QryMultMnth do begin
    Append;
    DsUtils.CopyRecord(DsOtkl, QryMultMnth);

    FieldByName('ZaMesGod').AsDateTime := DateUtils.BeginOfMonth(DtBeg);
    FieldByName('Dt_Beg').AsDateTime := DtBeg;
    FieldByName('Dt_End').AsDateTime := Min(DtEnd, DateUtils.EndOfMonth(DtBeg));

    FieldByName('Chas').AsFloat := DmMain.CountWorkChas(
      FieldByName('Dt_Beg').AsDateTime, FieldByName('Dt_End').AsDateTime
    );

    FieldByName('Spec_Nr').AsInteger := DmMain.NewSpec_NR;

    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtkl.OpenQryMultMnth;
begin
  QryUtils.InitQuery(QryMultMnth);

  with QryMultMnth do begin
    SQL.Text :=
      'select * ' +
      'from z_Otkl ' +
      'where 1 = 0';

    Open;
  end;
end;

end.
