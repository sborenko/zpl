unit Z_EOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, IniFiles, ComCtrls, ExtCtrls, Buttons,
  Math, Mask, DBCtrls, Grids, DBGrids, Menus, DBClient, Provider, DateLib;

type
  string1 = string[1];
  string3 = string[3];
  String4 = string[4];

  TFormEOtp = class(TForm)
    qryVOtp: TQuery;
    dsrcVOtp: TDataSource;
    updVOtp: TUpdateSQL;
    qryVOtpNR: TIntegerField;
    qryVOtpDTPROC: TDateTimeField;
    qryVOtpTABN: TIntegerField;
    qryVOtpDTBEG: TDateTimeField;
    qryVOtpDTEND: TDateTimeField;
    qryVOtpPROCOPL: TFloatField;
    qryVOtpKDOBJ: TSmallintField;
    qryVOtpKDKATP: TSmallintField;
    qryVOtpNOTES: TStringField;
    qryVOtpShVidN: TStringField;
    qryVOtpShObj: TStringField;
    qryVOtpShKatP: TStringField;
    qryVOtpCNTDAYS: TSmallintField;
    qryVOtpCNTCHAS: TFloatField;
    qryTmp: TQuery;
    DsrcMnthRes: TDataSource;
    qryVOtpSMSRDN: TFloatField;
    qryVOtpSPEC_NR: TIntegerField;
    qryVOtpALGRASCH: TSmallintField;
    qryVOtpRK: TStringField;
    qryVOtpNRPRIK: TStringField;
    qryVOtpDTPRIK: TDateTimeField;
    qryVOtpSMOTP: TFloatField;
    QryROtp: TQuery;
    DsrcROtp: TDataSource;
    upd_ROtp: TUpdateSQL;
    QryROtpNR: TIntegerField;
    QryROtpSPEC_NR: TIntegerField;
    QryROtpZAMESGOD: TDateTimeField;
    QryROtpSMZARABOTKA: TFloatField;
    QryROtpKOEFZP: TFloatField;
    QryROtpCNTDAYS: TSmallintField;
    QryROtpSmZpKoef: TFloatField;
    PanelLeft: TPanel;
    PanelRight: TPanel;
    Splitter1: TSplitter;
    QryROtpRusMesGod: TStringField;
    PanelButtons: TPanel;
    bBtnVvod: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnStep2: TSpeedButton;
    sBtnStep3: TSpeedButton;
    PanelRBottom: TPanel;
    PanelResults: TPanel;
    LabelMsg1: TLabel;
    LabelMsg2: TLabel;
    DbgrMnthRes: TDBGrid;
    PanelRTop: TPanel;
    popMnu: TPopupMenu;
    popHead: TMenuItem;
    popNuDetails: TMenuItem;
    sBtnStep1: TSpeedButton;
    sBtnPrt: TSpeedButton;
    bBtnPereschet: TBitBtn;
    sBtnCalendar: TSpeedButton;
    qryVOtpKDSPZ: TSmallintField;
    qryVOtpSPZ: TStringField;
    qryVOtpVIDN: TStringField;
    QryROtpSMOKLADA: TFloatField;
    QryROtpSMDSREDN: TFloatField;
    rGrpAlgoritm: TGroupBox;
    RBtnByLast12m: TRadioButton;
    RBtnBy2023: TRadioButton;
    RBtnByLastOkl: TRadioButton;
    qryVOtpKDSPS: TSmallintField;
    QryROtpKDSPS: TSmallintField;
    PageControl1: TPageControl;
    tsBy12mes: TTabSheet;
    tsByOkl: TTabSheet;
    DbgrROtp: TDBGrid;
    dbgrRSrOkl: TDBGrid;
    dsrcRSrOkl: TDataSource;
    LabelRSrOkl: TLabel;
    qryRSrOkl: TQuery;
    updRSrOkl: TUpdateSQL;
    qryRSrOklNR: TIntegerField;
    qryRSrOklKDSPS: TSmallintField;
    qryRSrOklSPEC_NR: TIntegerField;
    qryRSrOklNMPOKAZ: TStringField;
    qryRSrOklVIDN: TStringField;
    qryRSrOklSUMPROC: TFloatField;
    qryRSrOklSP: TStringField;
    qryRSrOklSMVZACHET: TFloatField;
    qryRSrOklShVidN: TStringField;
    qryRSrOklTABN: TIntegerField;
    QryROtpTABN: TIntegerField;
    qryVOtpUSEKOEFOKL: TStringField;
    qryVOtpNCHMATPOM: TStringField;
    qryVOtpNCHBUDMES: TStringField;
    LbxFilter: TListBox;
    qryVOtpCUROKLTRF: TFloatField;
    PanelSovmMsg: TPanel;
    qryVOtpNmVidN: TStringField;
    LabelLastDtPriem: TLabel;
    PanelStorn: TPanel;
    sBtnShwStorn: TSpeedButton;
    dbgrStorn: TDBGrid;
    Label3: TLabel;
    cdsStorn: TClientDataSet;
    dsrcStorn: TDataSource;
    qryStorn: TQuery;
    dspStorn: TDataSetProvider;
    cdsStornSHVIDN: TStringField;
    cdsStornNR: TIntegerField;
    cdsStornKDSPS: TSmallintField;
    cdsStornDTPROC: TDateTimeField;
    cdsStornZAMESGOD: TDateTimeField;
    cdsStornTABN: TIntegerField;
    cdsStornVIDN: TStringField;
    cdsStornOLDKDVIDN: TSmallintField;
    cdsStornCHAS: TFloatField;
    cdsStornSUMMA: TFloatField;
    cdsStornOLDKDOBJ: TSmallintField;
    cdsStornKDOBJ: TSmallintField;
    cdsStornKDKATP: TSmallintField;
    cdsStornDT_BEG: TDateTimeField;
    cdsStornDT_END: TDateTimeField;
    cdsStornPDN: TSmallintField;
    cdsStornKDSPZ: TSmallintField;
    cdsStornNOTES: TStringField;
    cdsStornPRR: TSmallintField;
    cdsStornPRPV: TSmallintField;
    cdsStornKTO: TSmallintField;
    cdsStornPRKR: TSmallintField;
    cdsStornSPEC_NR: TIntegerField;
    cdsStornDTVDPV: TDateTimeField;
    cdsStornNRVDPV: TIntegerField;
    cdsStornMYNOTES: TStringField;
    cdsStornSPECPS: TIntegerField;
    cdsStornPBNK: TSmallintField;
    cdsStornSTORN: TStringField;
    tblDbg: TTable;
    GrBoxSps: TGroupBox;
    rBtnAllSps: TRadioButton;
    rBtnOnlyCurSps: TRadioButton;
    qryTmp2: TQuery;
    LabelMsgDtPriem: TLabel;
    qryVOtpKDTEMU: TSmallintField;
    qryVOtpNmTemu: TStringField;
    Label5: TLabel;
    sBtnVidN: TSpeedButton;
    LabelFamIO: TLabel;
    LabelTabN: TLabel;
    sBtnUpi: TSpeedButton;
    dbeTabN: TDBEdit;
    dbeShVidN: TDBEdit;
    dbeVidN: TDBEdit;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    LabelDtBeg: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    dbeDtBeg: TDBEdit;
    dbeCntDays: TDBEdit;
    dbeDtEnd: TDBEdit;
    Bevel1: TBevel;
    GrBoxDayType: TGroupBox;
    RBtnWorkDays: TRadioButton;
    RBtnCalendDays: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    sBtnObj: TSpeedButton;
    sBtnKatP: TSpeedButton;
    Label12: TLabel;
    sBtnSPZ: TSpeedButton;
    LabelKoefOkl: TLabel;
    LabelNchBudMes: TLabel;
    LabelMatPom: TLabel;
    Label6: TLabel;
    sBtnKdTemu: TSpeedButton;
    dbeProcOpl: TDBEdit;
    dbeShObj: TDBEdit;
    dbeShKatP: TDBEdit;
    dbeNotes: TDBEdit;
    dbeSPZ: TDBEdit;
    dbChBoxKoefOkl: TDBCheckBox;
    dbeDtPrik: TDBEdit;
    dbeNrPrik: TDBEdit;
    dbChBoxNchBudMes: TDBCheckBox;
    dbChBoxMatPom: TDBCheckBox;
    dbeKdTemu: TDBEdit;
    dbeNmTemu: TDBEdit;
    dbeKdSpZ: TDBEdit;
    dbeKdObj: TDBEdit;
    Memo2023Log: TMemo;
    QryMinSals: TQuery;
    qryRSrOklMinSal: TFloatField;
    CdsMnthRes: TClientDataSet;
    CdsMnthResDtProc: TDateField;
    CdsMnthResVIDN: TStringField;
    CdsMnthResDtBeg: TDateField;
    CdsMnthResDtEnd: TDateField;
    CdsMnthResCntDays: TSmallintField;
    CdsMnthResCntChas: TFloatField;
    CdsMnthResSmm: TFloatField;
    CdsMnthResNotes: TStringField;
    CdsMnthResSpec_NR: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure sBtnVidNClick(Sender: TObject);
    procedure sBtnObjClick(Sender: TObject);
    procedure sBtnKatPClick(Sender: TObject);
    procedure sBtnSPZClick(Sender: TObject);
    procedure qryVOtpAfterPost(DataSet: TDataSet);
    procedure qryVOtpAfterDelete(DataSet: TDataSet);
    procedure qryVOtpBeforePost(DataSet: TDataSet);
    procedure dbeDtBegExit(Sender: TObject);
    procedure dbeCntDaysExit(Sender: TObject);
    procedure QryROtpCalcFields(DataSet: TDataSet);
    procedure sBtnStep1Click(Sender: TObject);
    procedure sBtnStep2Click(Sender: TObject);
    procedure sBtnStep3Click(Sender: TObject);
    procedure DbgrROtpDblClick(Sender: TObject);
    procedure DsrcROtpDataChange(Sender: TObject; Field: TField);
    procedure QryROtpAfterPost(DataSet: TDataSet);
    procedure sBtnUpiClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure bBtnVvodClick(Sender: TObject);
    procedure bBtnPereschetClick(Sender: TObject);
    procedure sBtnCalendarClick(Sender: TObject);
    procedure dbeShVidNKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure dbeShObjKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure dbeShKatPKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure qryVOtpDTPRIKSetText(Sender: TField; const Text: String);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure RBtnByLast12mClick(Sender: TObject);
    procedure qryRSrOklAfterPost(DataSet: TDataSet);
    procedure qryRSrOklCalcFields(DataSet: TDataSet);
    procedure dbeDtEndExit(Sender: TObject);
    procedure dbChBoxKoefOklEnter(Sender: TObject);
    procedure dbChBoxKoefOklExit(Sender: TObject);
    procedure dbeTabNExit(Sender: TObject);
    procedure sBtnShwStornClick(Sender: TObject);
    procedure dbgrStornDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rBtnAllSpsClick(Sender: TObject);
    procedure rBtnOnlyCurSpsClick(Sender: TObject);
    procedure QryROtpNewRecord(DataSet: TDataSet);
    procedure sBtnKdTemuClick(Sender: TObject);
    procedure dbeKdTemuExit(Sender: TObject);
    procedure qryVOtpCalcFields(DataSet: TDataSet);
    procedure dbeKdTemuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Check2023Enabled(Sender: TField);
    procedure QryROtpChange(Sender: TField);
  private

    d_DtPrc, d_OtpDtProc : TDateTime;
    // Дата начала следующего за d_OtpDtProc месяца
    dDtBegNextMes : TDateTime;

    bEditMode : boolean;
    b_Pereschet, b_CanUpd : boolean;
    b_ShowTabN : boolean; // Видеть или нет поле dbeTabN, его Label и sBtnUpi
    bOtpIsSovm : boolean; // Отпуск совместителям (виды "2409" и "2410")
    c_LastVidN : string4;
    n_LastKdSPZ : integer;
    n_TabN : integer;
    c_FamIO : string;
    n_SpecNR : integer;
    bClickStep1, bClickStep2, bClickStep3 : boolean;
    bStep12, bStep32 : boolean;  // чтобы знать, откуда жмем на sBtnStep2
    nSmCurOklad, // оклад на начало отпуска
    nSredneDnevnoe : double;
    bVvodClick : boolean; // нажата кнопка "Ввод" (чтобы не делать
                          // расчет среднедневного заработка)
    bQry_ROtpReady : boolean;  // чтобы не делать расчет среднедневного
                               // заработка, пока считываются 12 месяцев
    bQryRSrOklReady : boolean; // то же относительно qryRSrOkl
    bTabNBySBtnUpi : boolean;
    DtLastHire : TDateTime;

    Algorithm2312: Boolean;

    procedure qryVOtpAddRec(nTabN : integer);
    procedure OpenQryVOtp(nSpecNR : integer);
    procedure OpenQryRSrOkl(nSpecNR : integer);
    function  CheckPage1 : boolean;
    procedure CalcBy12Mnth;
    procedure CalcBy2023;
    procedure CalcByLastSal;
    procedure RaschSrDnByOkl;
    procedure WriteMnthRes(dDtPrc, dDtB, dDtE : TDateTime; cVidN : string4;
                            nCntDays, nCntChas, nSmm : double; cNotes : string);
    procedure SaveCalcResToOtkl;
    procedure DeleteFromOtklOldRecords(n_SpecNR : integer);
    procedure SetSteps;
    procedure RaschetSrDn12mes;
    procedure RaspredOtpuska;
    procedure SaveQry_ROtp;
    procedure SaveQryRSrOkl;
    procedure CreateTmpTable;
    procedure SetPageControlTabs;
    procedure SetDbgr_ROtpColumns;
    procedure SetLabelDtBeg(cVidN : ShortString);
    procedure CreOpenCdsStorn;
    function GetLastOklTrf(nTabN : integer; dDtPrc : TDateTime) : double;
    procedure ShowStornPanel(Value: Boolean);
    procedure Show2023Details;
    procedure ShowAverage(SumTotal, DaysTotal: Double);
    procedure ActivateDetailControls;

    function ShouldApply2023: Boolean;
  public
    class function AddEdtOtp(var nTabN : integer; dDtPrc : TDateTime;
    cFamIO : string; nSpecNR : integer; bShowTabN : boolean;
    var bPereschet : boolean; bCanUpd : boolean;
    Tbl12Mnth: TTable = NIL): Boolean;

  end;

const SECTION = 'Z_EOtp';

var
  FormEOtp: TFormEOtp;
  bIsFormShowNuMGOtp : boolean;

implementation

uses
  A_Const, A_DM, A_Lib, Z_DM, Z_Main, z_GtQUpi, z_TVids, Z_TObj, z_TUpi,
  Z_GtPers, A_SBU, A_ShwErr, Z_ShNuMG, Z_CmnPrt, Z_Calend, z_ShwTem,
  MathLib, QryLib, SalaryLib, CalcComp2023, VacatBy12Mnth
  , DSLIB
  ;

const
    // К-во дней в месяце для расчета по окладу.
    // До 09-2012 было 25.2
    // До 10.12.2023-го 29.5
    nCntDnejForROkl = 30.42;
    ALG_LAST_SAL = 1;
    ALG_12_MNTH = 12;
    ALG_12_MNTH_23 = 2312;
    ALG_MIN_ZP_23 = 2301;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFormEOtp.AddEdtOtp(
  var nTabN: Integer;
  dDtPrc: TDateTime;
  cFamIO: String;
  nSpecNR: Integer;
  bShowTabN: Boolean;
  var bPereschet: Boolean;
  bCanUpd: Boolean;
  Tbl12Mnth: TTable): Boolean;
// nTabN сделан var'ом, чтобы можно было разыскать введенный TabN из z_ShOtp
var
  nY, nM, nD : word; cVidN : ShortString;
  Average: TAvrg2023;
begin
  Result := false;
  FormEOtp := TFormEOtp.Create(Application);
  with FormEOtp do begin
    d_DtPrc := dDtPrc;                 // к этому месяцу должны подключаться все
                    // итоги/результаты расчета z_VOtp, z_ROtp (z_ROtp2), z_Otkl
    bTabNBySBtnUpi := false;
    b_Pereschet := false;
    b_CanUpd := bCanUpd;
    bIsFormShowNuMGOtp := false;
    n_TabN := nTabN;
    c_FamIO := cFamIO;
    b_ShowTabN := bShowTabN;
    n_SpecNR := nSpecNR;
    bQry_ROtpReady := true;
    bVvodClick := false;
    bClickStep1 := false;
    bClickStep2 := false;
    bClickStep3 := false;
    bStep12 := false;
    bStep32 := false;
    LabelFamIO.Caption := cFamIO;
    // LabelTabN.Visible := bShowTabN;
    // dbeTabN.Visible  := bShowTabN;
    dbeTabN.ReadOnly  := not bShowTabN;
    if dbeTabN.ReadOnly then
      dbeTabN.Color := clBtnFace;
    sBtnUpi.Visible := bShowTabN;
    DecodeDate(dDtPrc, nY, nM, nD);

    // Новая запись
    if nSpecNR = 0 then begin
      if bShowTabN then;
      Caption := 'Отпускные [новая запись] ' +
                 'Результаты подключатся к отклонениям за ' + MesRus(nM) +
                                                    ' ' + IntToStr(nY) + ' г.';
      d_OtpDtProc := d_DtPrc;
      qryVOtpAddRec(nTabN);
      bClickStep1 := true;
      bClickStep2 := false;
      bClickStep3 := false;
      sBtnStep1.Enabled := false;
      sBtnStep2.Enabled := true;
      sBtnStep3.Enabled := false;
      SetSteps;
      bEditMode := false;

      Check2023Enabled(nil);
    end else begin
      OpenQryVOtp(nSpecNR);
      cVidN := qryVOtp.FieldByName('VidN').AsString;
      SetLabelDtBeg(cVidN);
      d_OtpDtProc := qryVOtpDTPROC.AsDateTime;

      case qryVOtpALGRASCH.AsInteger of
        ALG_LAST_SAL: begin
          // Расчёт по последнему окладу
          RBtnByLastOkl.Checked := true;
          OpenQryRSrOkl(nSpecNR);
          RaschSrDnByOkl;
        end;
        ALG_12_MNTH, ALG_12_MNTH_23: begin
          // Расчёт по предыдущим начислениям
          if qryVOtpALGRASCH.AsInteger = ALG_12_MNTH then
            RBtnByLast12m.Checked := true
          else begin
            RBtnBy2023.Checked := true;
            Algorithm2312 := true;
          end;
          TVacat12Mnth.OpenQryROtp(nSpecNR);
          RaschetSrDn12mes;
        end;
        ALG_MIN_ZP_23: begin
          RBtnBy2023.Checked := true;
          Average := Compens2023.CalcDayAvrgMinZp(
            // n_TabN, qryVOtpDTPROC.AsDateTime);
            // Надо считать по дате отпуска, а не расчёта,
            // потому что считать могут уже после увольнения
            // и отпускные на дату расчёта не посчитаются
            // Таб.№ 1230, март 2025, Алг.расч - по 2023-му году.
            n_TabN, qryVOtpDTBEG.AsDateTime
          );
          Show2023Details;
          with Average do
          ShowAverage(SumTotal, DaysTotal);
        end;
      end;

      if qryVOtpRK.AsString = 'R' then
        RBtnWorkDays.Checked := true
      else
        RBtnCalendDays.Checked := true;

      RaspredOtpuska;
      if bCanUpd then begin
        Caption := 'Отпускные [редактирование записи] ' +
                    'Результаты подключатся к отклонениям за ' + MesRus(nM) +
                                                    ' ' + IntToStr(nY) + ' г.';
        bClickStep1 := false;
        bClickStep2 := false;
        bClickStep3 := true;
        sBtnStep1.Enabled := true;
        sBtnStep2.Enabled := true;
        sBtnStep3.Enabled := false;
        SetSteps; end
      else begin
        Caption := 'Отпускные [только просмотр]';
        bClickStep1 := false;
        bClickStep2 := false;
        bClickStep3 := true;
        sBtnStep1.Enabled := false;
        sBtnStep2.Enabled := false;
        sBtnStep3.Enabled := false;
        bBtnVvod.Visible := false;
        bBtnPereschet.Visible := false;
        PanelLeft.Enabled := false;
//        dbgr_ROtp.Enabled := false;
        bBtnCancel.Caption := 'Выход';
        DbgrROtp.ReadOnly := true;
      end;
      CreOpenCdsStorn;     ////////////////
      bEditMode := true;
    end;

    SetPageControlTabs;

    qryVOtpVIDN.OnChange := Check2023Enabled;
    qryVOtpDtBeg.OnChange := Check2023Enabled;

    DecodeDate(d_OtpDtProc, nY, nM, nD);
    nM := nM + 1;
    if nM > 12 then begin
      nM := 1;
      nY := nY + 1;
    end;
    dDtBegNextMes := EncodeDate(nY, nM, 1);
    bQryRSrOklReady := false;
    bOtpIsSovm := false;
    if not dbeVidN.Field.IsNull then begin
      SetLabelDtBeg(dbeVidN.Field.AsString);
      if DmMain.qryVidN_LU.Locate('VidN', dbeVidN.Field.AsString, []) then
        bOtpIsSovm := DmMain.qryVidN_LU.FieldByName('Sovm').AsString = '1';
    end;
    if bOtpIsSovm then
      PanelSovmMsg.Caption := 'Только "совместительские" виды'
    else
      PanelSovmMsg.Caption := 'Без "совместительских" видов';
    SetDbgr_ROtpColumns;

    if Tbl12Mnth <> nil then begin
      // <---
      dbeDtBeg.Field.AsDateTime := EncodeDate(2023, 12, 12);
      RBtnByLast12m.Checked := true;
      CalcBy12Mnth;

      if not Tbl12Mnth.Active then begin
        DsUtils.CopyStruct(QryROtp, Tbl12Mnth, nil);
        Tbl12Mnth.CreateTable;
        Tbl12Mnth.Open;
      end;
      if QryROtp.Active then
      DsUtils.CopyRowset(QryROtp, Tbl12Mnth);
      // --->
    end else
      if ShowModal = mrOk then begin
        bPereschet := b_Pereschet;
        nTabN := n_TabN;
        Result := true;
      end;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 420);
    Width  := ReadInteger(SECTION, 'wW', 555);
    ShowStornPanel(false);

    c_LastVidN := ReadString(SECTION, 'cLastVidN', '2404');
    n_LastKdSPZ := ReadInteger(SECTION, 'nLastKdSPZ', 1209);

    RBtnByLast12m.Checked := ReadBool(SECTION, 'bAlg12', true);
    if not RBtnByLast12m.Checked then
      RBtnByLastOkl.Checked := true;

    dbChBoxKoefOkl.Checked := ReadBool(SECTION, 'bKoefOkl', false);
    if ReadInteger(SECTION, 'nRK', 0) = 0 then
      RBtnWorkDays.Checked := true
    else
      RBtnCalendDays.Checked := true;
    rBtnOnlyCurSps.Checked := ReadBool(SECTION, 'bOnlyCurSps', true);
    PanelRTop.Height := ReadInteger(SECTION, 'GrROtpH', 250);
    Free;
  end;

  rBtnAllSps.Checked := not rBtnOnlyCurSps.Checked;
  sBtnShwStorn.Visible := bFlagDbg;
  LabelLastDtPriem.Caption := '';
  LabelMsgDtPriem.Caption := '';
  tsBy12mes.TabVisible := false;
  tsByOkl.TabVisible := false;

  SetPageControlTabs;

  LabelMsg1.Caption := '';
  LabelMsg2.Caption := '';

  if FileExists(cDirVids + 'ROtp.vid') then
    DbgrROtp.Columns.LoadFromFile(cDirVids + 'ROtp.vid');
  if FileExists(cDirVids + 'R1_Otp.vid') then
    DbgrMnthRes.Columns.LoadFromFile(cDirVids + 'R1_Otp.vid');
  if FileExists(cDirVids + 'R3Otp_1.vid') then
    dbgrRSrOkl.Columns.LoadFromFile(cDirVids + 'R3Otp_1.vid');
  dbeShObj.ReadOnly := bAppZpObjVed;
  sBtnObj.Visible := not bAppZpObjVed;

  Algorithm2312 := false;

  QryUtils.InitQuery(QryMinSals);
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DbgrROtp.Columns.SaveToFile(cDirVids + 'ROtp.vid');
  DbgrMnthRes.Columns.SaveToFile(cDirVids + 'R1_Otp.vid');
  dbgrRSrOkl.Columns.SaveToFile(cDirVids + 'R3Otp_1.vid');
  if bIsFormMyCalendar then
    FormMyCalendar.Close;
  if bIsFormShowNuMGOtp then
    FormShowNuMG.Close;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if PanelStorn.Visible then
      WriteInteger(SECTION, 'wH', Height - PanelStorn.Height)
    else
      WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);

    WriteBool(SECTION, 'bAlg12', RBtnByLast12m.Checked);

    WriteBool(SECTION, 'bOnlyCurSps', rBtnOnlyCurSps.Checked);
    WriteBool(SECTION, 'bKoefOkl', dbChBoxKoefOkl.Checked);
    if RBtnWorkDays.Checked then
      WriteInteger(SECTION, 'nRK',  0)
    else
      WriteInteger(SECTION, 'nRK',  1);
    WriteInteger(SECTION, 'GrROtpH', PanelRTop.Height);
    WriteString(SECTION, 'cLastVidN', dbeVidN.Field.AsString);
    WriteInteger(SECTION, 'nLastKdSPZ', dbeSPZ.Field.DataSet.
                                         FieldByName('KdSPZ').AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnStep1Click(Sender: TObject);
begin
  bClickStep1 := true;
  bClickStep2 := false;
  bClickStep3 := false;
  sBtnStep1.Enabled := false;
  sBtnStep2.Enabled := true;
  sBtnStep3.Enabled := false;
  SetSteps;
  bBtnVvod.Enabled := false;
  bBtnPereschet.Enabled := false;
  LabelLastDtPriem.Caption := '';
  LabelMsgDtPriem.Caption := '';
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnStep2Click(Sender: TObject);
var cVidN : ShortString;
begin
  cVidN := dbeVidN.Field.AsString;

  if rBtnByLastOkl.Checked
      // отпуска совместителям
      and (cVidN >= '2409') and (cVidN <= '2411') then begin
    ShowMessage(
      'Совместительские отпуска по последнему ' +
      'окладу не рассчитываются');

    dbeShVidN.SetFocus;
    Exit;
  end;

  if bIsFormShowNuMGOtp then
    FormShowNuMG.Close;

  // Переходим с 1-й на 2-ю
  if bClickStep1 then begin
    // Проверка, что 1-я стр. заполнена правильно
    if not CheckPage1 then
      Exit;

    Algorithm2312 := false;
    
    if RBtnByLast12m.Checked then
      CalcBy12Mnth
    else if RBtnBy2023.Checked then
      CalcBy2023
    else
      CalcByLastSal;
  end;

  bClickStep1 := false;
  bClickStep2 := true;
  bClickStep3 := false;
  sBtnStep1.Enabled := true;
  sBtnStep2.Enabled := false;
  sBtnStep3.Enabled := true;
  SetSteps;
  bBtnVvod.Enabled := false;
  bBtnPereschet.Enabled := false;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnStep3Click(Sender: TObject);
begin
  bClickStep1 := false;
  bClickStep2 := false;
  bClickStep3 := true;
  sBtnStep1.Enabled := false;
  sBtnStep2.Enabled := true;
  sBtnStep3.Enabled := false;
  RaspredOtpuska;
  SetSteps;
  bBtnVvod.Enabled := true;
  bBtnPereschet.Enabled := true;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.CreateTmpTable;
begin
  with CdsMnthRes do begin
    if Active then
      EmptyDataSet
    else begin
      CreateDataSet;
      Open;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.OpenQryVOtp(nSpecNR : integer);
begin
  bOtpIsSovm := false;

  QryUtils.InitQuery(QryVOtp);
  with QryVOtp do begin
    SQL.Add(
      'select * ' +
      'from z_VOtp ' +
      'where Spec_Nr = :SpecNr');
    ParamByName('SpecNr').AsInteger := nSpecNR;

    Open;
    Edit;

    if DmMain.qryVidN_LU.Locate('VidN', FieldByName('VidN').AsString, []) then
        bOtpIsSovm := DmMain.qryVidN_LU.FieldByName('Sovm').AsString = '1';
  end;
end;

//------------------------------------------------------------------------------
function TFormEOtp.GetLastOklTrf(nTabN : integer; dDtPrc : TDateTime) : double;
var nSpec_NR : integer;
begin
  Result := 0;
  with qryTmp2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from z_Pere where TabN = :nTabN and ' +
            ' Dt_Beg <= :dDtPrc order By Dt_Beg desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    if RecordCount > 0 then begin
      if (not FieldByName('CmbOkl').IsNull and
              (FieldByName('CmbOkl').AsString = '1')) then begin
        nSpec_NR := FieldByName('Spec_NR').AsInteger;
        Close;
        SQL.Clear;
        SQL.Add('Select * from z_CmbOkl where Spec_NR = :nSpec_NR');
        ParamByName('nSpec_NR').AsInteger := nSpec_NR;
        Open;
        while not Eof do begin
          Result := Result + FieldByName('OklTrf').AsFloat;
          Next;
        end; end
      else
        Result := FieldByName('OklTrf').AsFloat;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.OpenQryRSrOkl(nSpecNR : integer);
begin
  with qryRSrOkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_ROtp2 where (Spec_NR = :nSpecNR) ' +
            ' order by NR');
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.qryVOtpAddRec(nTabN : integer);
var nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double;
    cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs : boolean; nInv : SmallInt;
begin
  DmMain.GetPereInf(nTabN, d_DtPrc, nKdObj, nKdKatP,
                                 nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr,
                                 nOklTrf, nAvans, nProcLG,
                                   cSpAv, cDolgnost, cNrPrikaza, dDtPrikaza,
                                   bPens, bSovm, bPrfs, nInv);
  nSmCurOklad := nOklTrf; // для тарифников иначе, но пока обойдется
  with qryVOtp do begin
    bOtpIsSovm := false;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VOTP where (Spec_NR = 0)');
    Open;
    Append;
    if c_LastVidN  <> '' then begin
      FieldByName('VidN').AsString   := c_LastVidN;
      if DmMain.qryVidN_LU.Locate('VidN', c_LastVidN, []) then
        bOtpIsSovm := DmMain.qryVidN_LU.FieldByName('Sovm').AsString = '1';
    end;
    SetLabelDtBeg(c_LastVidN);
    FieldByName('KdSps').AsInteger   := gl_nAppKdSpsUsr; //nKdSps;
    FieldByName('DtProc').AsDateTime := d_DtPrc;
    FieldByName('DtBeg').AsDateTime  := d_DtPrc;

    {
    if bFlagDbg then
      FieldByName('CntDays').AsInteger := 24;
    FieldByName('DtEnd').AsDateTime  := myLastDOM(d_DtPrc + 27);
    }

    FieldByName('CntChas').AsFloat   := nCurBudget;
    FieldByName('TabN').AsInteger    := nTabN;
    FieldByName('CurOklTrf').AsFloat := nSmCurOklad;
    FieldByName('KdObj').AsInteger   := nKdObj;
    FieldByName('KdKatP').AsInteger  := nKdKatP;
    FieldByName('KdSPZ').AsInteger   := nKdSpZ; // тот, что пришел из GetPereInf
    FieldByName('ProcOpl').AsFloat   := 100;
    FieldByName('NrPrik').AsString   := 'xxx';
    FieldByName('DtPrik').AsDateTime := d_DtPrc;

  with TIniFile.Create(cNmIniFile) do begin
    dbChBoxKoefOkl.Checked := ReadBool(SECTION, 'bKoefOkl', false);
    Free;
  end;

    if dbChBoxKoefOkl.Checked then
      FieldByName('UseKoefOkl').AsString := '1'
    else
      FieldByName('UseKoefOkl').AsString := '0';

    FieldByName('NchBudMes').AsString  := '0';

    if dbChBoxMatPom.Checked then
      FieldByName('NchMatPom').AsString  := '1'
    else
      FieldByName('NchMatPom').AsString  := '0';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeDtEndExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnUpiClick(Sender: TObject);
var nTabN : integer;
    cFam, cIma, cOtch, cFamIO, cDum : string;
begin
  bTabNBySBtnUpi := true;
  dbeTabN.SetFocus;
  nTabN := qryVOtp.FieldByName('TabN').AsInteger;
  if GetUpiTabN(nTabN, cFam, cIma, cOtch, cFamIO, cDum) {z_GtQUpi} then begin
    n_TabN := nTabN;
    qryVOtp.FieldByName('TabN').AsInteger   := n_TabN;
    LabelFamIO.Caption := cFamIO;
    dbeShVidN.SetFocus;
  end;
  bTabNBySBtnUpi := false;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeTabNExit(Sender: TObject);
var nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double;
    cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs : boolean; nInv : SmallInt;
begin
  if bTabNBySBtnUpi then Exit;
  // TabN не выбран из спр-ка сотрудников, а введен в dbeTabN
  n_TabN := qryVOtp.FieldByName('TabN').AsInteger;
  LabelFamIO.Caption := DmMain.TabN2FamIO(n_TabN); {z_Dm}
  DmMain.GetPereInf(n_TabN, d_DtPrc, nKdObj, nKdKatP,
                                 nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr,
                                 nOklTrf, nAvans, nProcLG,
                                   cSpAv, cDolgnost, cNrPrikaza, dDtPrikaza,
                                   bPens, bSovm, bPrfs, nInv);
  nSmCurOklad := nOklTrf; // для тарифников иначе, но пока обойдется
  with qryVOtp do begin
    FieldByName('KdSps').AsInteger   := gl_nAppKdSpsUsr; //nKdSps;
    FieldByName('CurOklTrf').AsFloat := nSmCurOklad;
    FieldByName('KdObj').AsInteger   := nKdObj;
    FieldByName('KdKatP').AsInteger  := nKdKatP;
    FieldByName('KdSPZ').AsInteger   := nKdSpZ; // тот, что пришел из GetPereInf
  end;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeDtBegExit(Sender: TObject);
var dDtBeg, dDtEndNextMes, dDum : TDateTime;
    nKdObj, nKdKatP, nKdSpZ, nDum : integer;
    cDum : string;
    nFloatDum : double; cSpAv : string1; bDum : boolean; nDumSmInt : SmallInt;
begin
  if not MyEmptyDate(qryVOtp.FieldByName('DtBeg').AsString) then begin
    dDtBeg := qryVOtp.FieldByName('DtBeg').AsDateTime;
    dDtEndNextMes := myLastDOM(dDtBegNextMes);
    if (qryVOtp.FieldByName('DtBeg').AsDateTime > dDtBegNextMes) then begin
      if qryVOtp.FieldByName('DtBeg').AsDateTime > dDtEndNextMes then begin
        ShowMessage('Отпуск, начинающийся в следующем месяце - это еще куда ' +
                  'ни шло.' + #13#10 + ' Но  начинающийся  позже,  чем   ' +
                  '"через месяц"  -  это  уже  занадто.' + #13#10 +
                  ' П е р е с т у к а й т е ,    п о ж а л у й с т а ,    ' +
                  'д а т у    н а ч а л а !');
        dbeDtBeg.SetFocus;
        qryVOtp.FieldByName('DtBeg').AsDateTime := Date;
        qryVOtp.FieldByName('CntDays').AsString := '';
        qryVOtp.FieldByName('DtEnd').AsString   := '';
        Exit;
      end;
      LabelNchBudMes.Enabled   := true;
      dbChBoxNchBudMes.Enabled := true; end
    else begin
      LabelNchBudMes.Enabled   := false;
      dbChBoxNchBudMes.Enabled := false;
    end;
    DmMain.GetPereInf(n_TabN, dDtBeg, nKdObj, nKdKatP, nDum, nDum, nDum,
                         nKdSpZ, nDum, nDum, nFloatDum, nFloatDum, nFloatDum,
                          cSpAv, cDum, cDum, dDum, bDum, bDum, bDum, nDumSmInt);
    qryVOtp.FieldByName('KdObj').AsInteger  := nKdObj;
    qryVOtp.FieldByName('KdKatP').AsInteger := nKdKatP;
    qryVOtp.FieldByName('KdSpZ').AsInteger  := nKdSpZ;
    LabelNchBudMes.Enabled   := false;
    dbChBoxNchBudMes.Enabled := false;
    if MyEmptyDate(qryVOtp.FieldByName('DtPrik').AsString) then
      qryVOtp.FieldByName('DtPrik').AsString :=
                                         qryVOtp.FieldByName('DtBeg').AsString;
  end;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeCntDaysExit(Sender: TObject);
var nCnt : integer; cRK : string;
begin
  if (Sender as TDBEdit).Text = '' then
    qryVOtp.FieldByName('DtEnd').AsString := ''
  else begin
    nCnt := qryVOtp.FieldByName('CntDays').AsInteger;
    if RBtnWorkDays.Checked then
      cRK := 'R'
    else
      cRK := 'K';
    qryVOtp.FieldByName('DtEnd').AsDateTime := DmMain.
            MyDtEndOtp(qryVOtp.FieldByName('DtBeg').AsDateTime, nCnt, cRK);
  end;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnVidNClick(Sender: TObject);
var cVidN, p_KEKV : string4; p_ShVidN : string15; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                     p_KdSpZ : integer; bWasUpdated : boolean;
begin
  dbeShVidN.SetFocus;
  bOtpIsSovm := false;
  with dbeVidN.DataSource.DataSet as TQuery do begin
    if bEditMode then
      cVidN := FieldByName('VidN').AsString
    else
      cVidN := c_LastVidN;
    if GetVidN(cVidN, p_KEKV, p_ShVidN, p_NmVidN,
               p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
               p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
               p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
               p_SAlim, p_SSocStrah, p_SBzr, p_CNdb, p_Sp_PF, p_Sp_FSTVP,
               p_Sp_FSNV, p_Sp_FZ, p_KdSpZ, bWasUpdated, LbxFilter) {z_TVids}
                                                                    then begin
      bOtpIsSovm := (p_Sovm = '1');
      if bWasUpdated then begin
        DmMain.qryVidN_LU.Close;
        DmMain.qryVidN_LU.Open;
      end;
      if bOtpIsSovm and rBtnByLastOkl.Checked then begin
        ShowMessage('Совместительские отпуска по последнему ' +
                                             'окладу не рассчитываются');
        dbeShVidN.SetFocus;
        Exit; end
      else begin
        if not (State in [dsInsert, dsEdit]) then
          Edit;
        FieldByName('VidN').AsString := cVidN;
        SetLabelDtBeg(cVidN);
        dbeDtBeg.SetFocus;
      end;
    end;
  end;
  if bOtpIsSovm then
    PanelSovmMsg.Caption := 'Только "совместительские" виды'
  else
    PanelSovmMsg.Caption := 'Без "совместительских" видов';
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.SetLabelDtBeg(cVidN : ShortString);
begin
  if (cVidN = 'XXXX') or (cVidN = 'YYYY') then begin {неисп.отпуска}
//  if (cVidN = '2406') or (cVidN = '2411') then begin {неисп.отпуска}
    LabelDtBeg.Caption := 'За какой мес.';
    LabelDtBeg.Hint := 'Месяц начала входит в зачет';
    dbeDtBeg.Hint :=  'Месяц начала входит в зачет'; end
  else begin
    LabelDtBeg.Caption := 'Дата начала';
    LabelDtBeg.Hint := 'Месяц начала не входит в зачет';
    dbeDtBeg.Hint :=  'Месяц начала не входит в зачет';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnObjClick(Sender: TObject);
var nKdObj, nKdSpZ : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  dbeShObj.SetFocus;
  nKdObj := dbeShObj.DataSource.DataSet.FieldByName('KdObj').AsInteger;
  if GetKdObj(nKdObj, nKdSpZ, cNmObj, cShObj, bWasUpdated) {Z_TObj} then begin
    dbeShObj.DataSource.DataSet.FieldByName('KdObj').AsInteger := nKdObj;
    dbeShKatP.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer; cNmKatP, cShKatP : string;
begin
  dbeShKatP.SetFocus;
  nKdKatP := dbeShKatP.DataSource.DataSet.FieldByName('KdKatP').AsInteger;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {Z_GtPers} then begin
    dbeShKatP.DataSource.DataSet.FieldByName('KdKatP').AsInteger := nKdKatP;
    dbeKdTemu.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnSPZClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSPZ.SetFocus;
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSPZ := FieldByName('KdSPZ').AsInteger;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSPZ').AsInteger := nKdSPZ;
      dbeNrPrik.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormEOtp.CheckPage1 : boolean;
var mListErr : TStringList;
begin
  Result := true;
  dbeNotes.SetFocus;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dbeCntDays.Text = '') or (qryVOtpCntDays.AsFloat <= 0) then
    mListErr.Add('Количество дней должно быть больше нуля');
  if MyEmptyDate(dbeDtBeg.Text) then
    mListErr.Add('Нет даты начала отпускных');
  {
  if MyEmptyDate(dbeDtEnd.Text) then
    mListErr.Add('Нет даты окончания отпускных');
  if (not MyEmptyDate(dbeDtBeg.Text)) and
         (not MyEmptyDate(dbeDtEnd.Text)) and
          (qryVOtpDtBeg.AsDateTime > qryVOtpDtEnd.AsDateTime) then
    mListErr.Add('Дата окончания меньше даты начала');
  }
  if (dbeNrPrik.Text = '') then
    mListErr.Add('Нет номера приказа');
  if dbeSpz.Field.IsNull or (dbeSpz.Field.AsString = '') then
     mListErr.Add('Нет связанного счета БухУчета');
  if MyEmptyDate(dbeDtPrik.Text) then
    mListErr.Add('Нет даты приказа');
  if qryVOtpProcOpl.AsFloat <= 0 then
    mListErr.Add('Процент оплаты должен быть больше нуля');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    dbeDtBeg.SetFocus;
    Result := false;
  end;
  mListErr.Destroy;
end;

//------------------------------------------------------------------------------
{
function TFormEOtp.GetDtLastPrm(nTabN : integer; dDtBegOtp : TDateTime) : TDateTime;
begin
  // получить дату последнего приема на работу (меньше даты начала отпуска)
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_PrmUv where TabN = :nTabN and ' +
            ' Dt_Priem <= :dDtBegOtp order by Dt_Priem desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBegOtp').AsDateTime := dDtBegOtp;
    Open;
    if (RecordCount > 0) and not FieldByName('Dt_Priem').IsNull then
      Result := FieldByName('Dt_Priem').AsDateTime;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
}
//------------------------------------------------------------------------------
procedure TFormEOtp.CalcBy12Mnth;
var
  SumTotal: Double;
  DaysTotal: Integer;
begin
  with TVacat12Mnth.Create(RBtnByLast12m.Checked, RBtnOnlyCurSps.Checked,
    RBtnWorkDays.Checked, qryVOtpUSEKOEFOKL.AsString = '1') do
  begin
    bQry_ROtpReady := false;
    Load;
    bQry_ROtpReady := true;

    GetTotals(SumTotal, DaysTotal);
    DtLastHire := GetEmplmntDate;

    Free;
  end;

  if DtLastHire <> 0 then begin
    LabelMsgDtPriem.Caption := 'Дата приема';
    LabelLastDtPriem.Caption := DateToStr(DtLastHire);
  end;

  {
  with CalcPeriod do begin
    dDtBegPerZaMG := Start;
    dDtEndPerZaMG := Finish;
  end;
  }

  LabelMsg1.Caption :=
    'Сумма заработков = ' + FloatToStrF(SumTotal, ffFixed, 18, 2) + ', ' +
    'к-во дней = ' + IntToStr(DaysTotal);

  if DaysTotal <> 0 then
    nSredneDnevnoe := RoundTo(SumTotal / DaysTotal, -2)
  else
    nSredneDnevnoe := 0;

  LabelMsg2.Caption :=
    'Среднедневная = ' + FloatToStrF(nSredneDnevnoe, ffFixed, 18, 2);
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.CalcBy2023;
var
  Average: TAvrg2023;
begin
  // Рассчитываем по 12 мес. 2023-го
  with TVacat12Mnth.Create(RBtnByLast12m.Checked, RBtnOnlyCurSps.Checked,
    RBtnWorkDays.Checked, qryVOtpUSEKOEFOKL.AsString = '1') do
  begin
    bQry_ROtpReady := false;
    Load;
    bQry_ROtpReady := true;

    with Average do
    GetTotals(SumTotal, DaysTotal);

    Free;
  end;

  with Average do begin
    Algorithm2312 := (SumTotal <> 0) and (DaysTotal <> 0);

    // Если расчёт по 12 мес. не дал результатов
    // (т.е. не было начислений/удержаний), считаем по 23-му году
    if not Algorithm2312 then begin
      Average := Compens2023.CalcDayAvrgMinZp(
        n_TabN, qryVOtpDTBEG.AsDateTime);

      Show2023Details;
    end;

    SetPageControlTabs;
    ShowAverage(SumTotal, DaysTotal);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.Show2023Details;
begin
  with Memo2023Log do begin
    Clear;
    Lines.LoadFromFile(Comp2023LogName);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.ActivateDetailControls;
begin
  if RBtnBy2023.Checked then begin
    dbgrRSrOkl.Visible := false;
    LabelRSrOkl.Caption := 'Расчёт по 2023-му году';

    with Memo2023Log do begin
      Align := alClient;
      Color := clBtnFace;
      Visible := true;
    end;
  end else begin
    Memo2023Log.Visible := false;
    LabelRSrOkl.Caption := 'В таблице собраны сведения ' +
      'об окладе (тарифе) и надбавках на начало отпуска. ' +
      'Если нужно, внесите поправки, и нажмите кнопку "Шаг 3"';

    with dbgrRSrOkl do begin
      Align := alClient;
      Visible := true;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.CalcByLastSal;
var
  dDtBegOtp: TDateTime;
  nOklTrf: Double;
  nSO: Integer;
  WorkTimePerc: Integer;
begin
  bQryRSrOklReady := false;
  CreateTmpTable;

  nOklTrf := 0;
  WorkTimePerc := 100;
  nSO := 1;
  dDtBegOtp := qryVOtp.FieldByName('DtBeg').AsDateTime;

  // Определить оклад и надбавки на начало отпуска (или месяца?)
  // В сентябре 2011 выяснилось, что надо без надбавок

  QryUtils.InitQuery(QryTmp);
  with qryTmp do begin
    SQL.Add(
      'select * from Z_Pere ' +
      'where TabN = :TabN and ' +
        'Dt_Beg <= :DtBegOtp ' +
      'order by Dt_Beg desc, Nr desc');
    ParamByName('TabN').AsInteger := n_TabN;
    ParamByName('DtBegOtp').AsDateTime := dDtBegOtp;
    Open;

    if not Eof then begin
      nOklTrf := FieldByName('OklTrf').AsFloat;
      WorkTimePerc := FieldByName('PrcWrkTime').AsInteger;
      if WorkTimePerc = 0 then
        WorkTimePerc := 100;
      nSO := FieldByName('SO').AsInteger;
    end;
  end;
  QryUtils.ReleaseQuery(QryTmp);

  QryUtils.InitQuery(QryRSrOkl);
  with QryRSrOkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_ROTP2 where Spec_NR = -1');
    Open;
  end;

  if nOklTrf <> 0 then begin
    qryRSrOkl.Append;
    qryRSrOklTABN.AsInteger     := n_TabN;
    if nSO = 1 then
      qryRSrOklNmPokaz.AsString := 'Оклад'
    else if nSO = 2 then
      qryRSrOklNmPokaz.AsString := 'Тариф'
    else
      qryRSrOklNmPokaz.AsString := 'nSO=' + IntToStr(nSO) + '?';
    qryRSrOklSumProc.AsFloat    := nOklTrf;

    SalaryUtils.SelectMinSals(QryMinSals,
      DateUtils.InitPeriod(qryVOtpDTBEG.AsDateTime, qryVOtpDTBEG.AsDateTime));

    qryRSrOklMinSal.AsFloat := RoundTo(
      QryMinSals.FieldByName('MinZp2').AsFloat * WorkTimePerc / 100, -2);

    qryRSrOklSmVZachet.AsFloat  := Max(nOklTrf, qryRSrOklMinSal.AsFloat);

    qryRSrOkl.Post;
  end;

  RaschSrDnByOkl;
  bQryRSrOklReady := true;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.RaschSrDnByOkl;
var
  SmSrMes: Double;
begin
  // Стандартный расчёт
  SmSrMes := 0;

  with qryRSrOkl do begin
    First;
    while not Eof do begin
      SmSrMes := SmSrMes + qryRSrOklSmVZachet.AsFloat;
      Next;
    end;
    First;
  end;

  ShowAverage(SmSrMes, nCntDnejForROkl);
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.qryRSrOklAfterPost(DataSet: TDataSet);
var
  SmSrMes: Double;
  nSvNR : integer;
begin
  if not bQryRSrOklReady  then
    Exit;
  with qryRSrOkl do begin
    nSvNR := qryRSrOklNR.AsInteger;
    DisableControls;
    First;
    SmSrMes := 0;
    while not Eof do begin
      SmSrMes := SmSrMes + qryRSrOklSmVZachet.AsFloat;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;

  ShowAverage(SmSrMes, nCntDnejForROkl);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.SetDbgr_ROtpColumns;
var i : word; cUpper : string;
begin
  for i := 0 to DbgrROtp.Columns.Count-1 do begin
    with DbgrROtp.Columns[i] do
      cUpper := UpperCase(FieldName);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.WriteMnthRes(dDtPrc, dDtB, dDtE : TDateTime; cVidN : string4;
                            nCntDays, nCntChas, nSmm : double; cNotes : string);
begin
  with CdsMnthRes do begin
    Append;

    CdsMnthResDtProc.AsDateTime := dDtPrc;
    CdsMnthResVidN.AsString := cVidN;

    if dDtB <> 0 then
      CdsMnthResDtBeg.AsDateTime := dDtB;
    if dDtE <> 0 then
      CdsMnthResDtEnd.AsDateTime := dDtE;

    CdsMnthResCntDays.AsFloat := nCntDays;

    if nCntChas <> 0 then
      CdsMnthResCntChas.AsFloat := nCntChas;

    CdsMnthResSmm.AsFloat := nSmm;
    CdsMnthResNotes.AsString := cNotes;

    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.bBtnVvodClick(Sender: TObject);
var cLogMsg : string; nTabN : integer;
begin
  if bIsFormShowNuMGOtp then begin
    FormShowNuMG.Close;
    Application.ProcessMessages;
  end;
  bVvodClick := true;
  //Сохранить расчет в Z_VOtp и в Z_Otkl
  with qryVOtp do begin
    nTabN := FieldByName('TabN').AsInteger;
    cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
               ', VidN = ' + FieldByName('VidN').AsString +
               ', DtProc = ' + FieldByName('DtProc').AsString +
               ', DtBeg = ' + FieldByName('DtBeg').AsString +
               ', CntDays = ' + FieldByName('CntDays').AsString +
               ', SrDnevn = ' + FieldByName('SmSrDn').AsString;
    FieldByName('SmOtp').AsFloat := RoundTo(FieldByName('SmSrdn').AsFloat *
                                         FieldByName('CntDays').AsInteger *
                                      FieldByName('ProcOpl').AsFloat / 100, -2);
    Post;
    DmMain.AddLog(Now, nTabN,
                          'Ввод отпускных', gc_AppNmUsr, 'Z_vOtp', cLogMsg);
  end;

  // Становится известной n_SpecNR
  if RBtnByLast12m.Checked or RBtnBy2023.Checked and Algorithm2312 then
    SaveQry_ROtp
  else if RBtnByLastOkl.Checked then
    SaveQryRSrOkl;
    
  SaveCalcResToOtkl;

  bVvodClick  := false;
  b_Pereschet := false;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.bBtnPereschetClick(Sender: TObject);
var cLogMsg : string; nTabN : integer;
begin
  bVvodClick := true;
  //Сохранить расчет в Z_VOtp и в Z_Otkl
  with qryVOtp do begin
    nTabN := FieldByName('TabN').AsInteger;
    cLogMsg := 'TabN = ' + FieldByName('TabN').AsString +
               ', VidN = ' + FieldByName('VidN').AsString +
               ', DtProc = ' + FieldByName('DtProc').AsString +
               ', DtBeg = ' + FieldByName('DtBeg').AsString +
               ', CntDays = ' + FieldByName('CntDays').AsString +
               ', SrDnevn = ' + FieldByName('SmSrDn').AsString;
    FieldByName('SmOtp').AsFloat := RoundTo(FieldByName('SmSrdn').AsFloat *
                                         FieldByName('CntDays').AsInteger *
                                      FieldByName('ProcOpl').AsFloat / 100, -2);
    Post;
    DmMain.AddLog(Now, nTabN, 'Ввод отпускных', gc_AppNmUsr, 'Z_vOtp', cLogMsg);
  end;

  // Становится известной n_SpecNR
  SaveQry_ROtp;
  SaveCalcResToOtkl;

  bVvodClick  := false;
  b_Pereschet := true;
  ModalResult := mrOk;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.SaveQry_ROtp;
var
  Mark: TBookmark;
begin
  with QryROtp do begin
    DisableControls;

    Mark := GetBookmark;

    First;
    while not Eof do begin
        Edit;
        FieldByName('Spec_NR').AsInteger := n_SpecNr;
        FieldByName('SmDSredn').AsFloat := FieldByName('SmZpKoef').AsFloat;
        Post;
        Next;
    end;

    GotoBookmark(Mark);
    FreeBookmark(Mark);

    EnableControls;

    if UpdatesPending then
      ApplyUpdates;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.SaveQryRSrOkl;
begin
  bQryRSrOklReady := false;
  with qryRSrOkl do begin
    First;
    while not Eof do begin
      Edit;
      FieldByName('Spec_NR').AsInteger := n_SpecNr;
      Post;
      Next;
    end;
  end;
  if qryRSrOkl.UpdatesPending then
    qryRSrOkl.ApplyUpdates;
  bQryRSrOklReady := true;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.SaveCalcResToOtkl;
var
  i, nY, nM, nD, n_Y, n_M, n_D, nPrr, nPrKr : word;
  dZaMG : TDateTime; cVidN : ShortString;
begin
  DecodeDate(d_DtPrc, nY, nM, nD);

  with CdsMnthRes do begin
    First;
    i := 0;
    while not Eof do begin
      Inc(i);

      if (i = 1) and (qryVOtpDtBeg.AsDateTime > dDtBegNextMes) and
                     dbChBoxNchBudMes.Checked and
                    (FieldByName('DtBeg').AsDateTime > dDtBegNextMes) then begin

        nPrKr := 1; end
      else
        nPrKr := 0;

      if qryTmp.Active then qryTmp.Close;
      qryTmp.SQL.Clear;
      qryTmp.DataBaseName := CESMAIN;
      qryTmp.SQL.Add('Insert into Z_Otkl (KdSps, DtProc, TabN, ' +
                     ' KdTemu, KdObj, KdKatP, ');
      if FieldByName('DtBeg').AsDateTime <> 0 then
        qryTmp.SQL.Add(' Dt_Beg, ');
      if FieldByName('DtEnd').AsDateTime <> 0 then
        qryTmp.SQL.Add(' Dt_End, ');
      qryTmp.SQL.Add(' VidN, Pdn, Chas, Summa, ' +
                     ' KdSpZ, Notes, Prr, PrPv, Kto, PrKr, ' +
                     ' ZaMesGod, Spec_NR) ');
      qryTmp.SQL.Add(' Values (:nKdSps, :d_DtPrc, :nTabN, ' +
                     ' :nKdTemu, :nKdObj, :nKdKatP, ');
      if FieldByName('DtBeg').AsDateTime <> 0 then
        qryTmp.SQL.Add(' :dDt_Beg, ');
      if FieldByName('DtEnd').AsDateTime <> 0 then
        qryTmp.SQL.Add(' :dDt_End, ');
      qryTmp.SQL.Add(' :cVidN, :nPdn, ' +
                     ' :nChas, :nSumma, :nKdSpZ, :cNotes, ' +
                     ' :nPrr, :nPrPv, :nKto, :nPrKr, :dZaMesGod, :nSpec_NR) ');
      qryTmp.ParamByName('nKdSps').AsInteger   := gl_nAppKdSpsUsr; // nKdSps;
      qryTmp.ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
      qryTmp.ParamByName('nTabN').AsInteger    := n_TabN;
      qryTmp.ParamByName('nKdTemu').AsInteger   :=
                                    qryVOtp.FieldByName('KdTemu').AsInteger;
      qryTmp.ParamByName('nKdObj').AsInteger   :=
                                    qryVOtp.FieldByName('KdObj').AsInteger;
      qryTmp.ParamByName('nKdKatP').AsInteger  :=
                                   qryVOtp.FieldByName('KdKatP').AsInteger;
      if FieldByName('DtBeg').AsDateTime <> 0 then
        qryTmp.ParamByName('dDt_Beg').AsDateTime :=
                                           FieldByName('DtBeg').AsDateTime;
      if FieldByName('DtEnd').AsDateTime <> 0 then
        qryTmp.ParamByName('dDt_End').AsDateTime :=
                                           FieldByName('DtEnd').AsDateTime;
      if (FieldByName('DtBeg').AsDateTime >= dDtBegNextMes) then
        nPrr := 2
      else
        nPrr := 0;
      cVidN := FieldByName('VidN').AsString;
      qryTmp.ParamByName('cVidN').AsString := cVidN;
      qryTmp.ParamByName('nPdn').AsInteger := 1;
      qryTmp.ParamByName('nChas').AsFloat := FieldByName('CntChas').AsFloat;
      qryTmp.ParamByName('nSumma').AsFloat := FieldByName('Smm').AsFloat;
      qryTmp.ParamByName('nKdSpZ').AsInteger :=
                                      qryVOtp.FieldByName('KdSPZ').AsInteger;
      qryTmp.ParamByName('cNotes').AsString := FieldByName('Notes').AsString;
      qryTmp.ParamByName('nPrr').AsInteger  := nPrr; // тут PRR пересмотреть,
      qryTmp.ParamByName('nPrPv').AsInteger := 1; // т.к. оно для "больничности"
      qryTmp.ParamByName('nKto').AsInteger  := 0;
      qryTmp.ParamByName('nPrKr').AsInteger := nPrKr;
      DecodeDate(FieldByName('DtBeg').AsDateTime, n_Y, n_M, n_D);
      //if (cVidN = '2406') or (cVidN = '2411') {неИсп.отп.} then
      if (cVidN = 'XXXX') or (cVidN = 'YYYY') {неИсп.отп.} then
        dZaMG := EncodeDate(n_Y, n_M, 1)
      else if (cVidN = '1810') {матПом к отпуску} then
        dZaMG := d_DtPrc
      else
        dZaMG := EncodeDate(n_Y, n_M, 1);
      qryTmp.ParamByName('dZaMesGod').AsDateTime := dZaMG;
      qryTmp.ParamByName('nSpec_NR').AsInteger   := n_SpecNr;
      qryTmp.ExecSQL;
      Next;
    end;
  end;
  with qryTmp do begin
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.qryVOtpAfterPost(DataSet: TDataSet);
begin
  if qryVOtp.UpdatesPending then
    qryVOtp.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.qryVOtpAfterDelete(DataSet: TDataSet);
begin
  ;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.qryVOtpBeforePost(DataSet: TDataSet);
begin
  if RBtnByLast12m.Checked then
    QryVOtp.FieldByName('AlgRasch').AsInteger := ALG_12_MNTH
  else if RBtnBy2023.Checked then
    if Algorithm2312 then
      QryVOtp.FieldByName('AlgRasch').AsInteger := ALG_12_MNTH_23
    else
      QryVOtp.FieldByName('AlgRasch').AsInteger := ALG_MIN_ZP_23
  else
    QryVOtp.FieldByName('AlgRasch').AsInteger := ALG_LAST_SAL;

  if RBtnWorkDays.Checked then
    qryVOtp.FieldByName('RK').AsString := 'R'
  else
    qryVOtp.FieldByName('RK').AsString := 'K';
  if qryVOtp.State = dsInsert then begin // новая запись
    n_SpecNr := DmMain.NewSpec_NR;
    qryVOtp.FieldByName('Spec_NR').AsInteger := n_SpecNR; end
  else begin                             // редактирование записи
    n_SpecNr := qryVOtp.FieldByName('Spec_NR').AsInteger;
    DeleteFromOtklOldRecords(n_SpecNR);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.DeleteFromOtklOldRecords(n_SpecNR : integer);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Delete from Z_OTKL where Spec_NR = :nSpecNR');
    ParamByName('nSpecNR').AsInteger := n_SpecNR;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.QryROtpCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  QryROtpSmZpKoef.AsFloat :=
           QryROtpSmZarabotka.AsFloat * QryROtpKoefZp.AsFloat;
  DecodeDate(QryROtpZaMesGod.AsDateTime, nY, nM, nD);
  QryROtpRusMesGod.AsString := Copy(MesRus(nM), 1, 3) + ' ' + IntToStr(nY);
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.RaspredOtpuska;
var
  DtBeg, DtCur: TDateTime;
  BegDate, CurDate: TDate;
  DayType: ShortString;
  DayCnt, DaysTtl: Integer;
  HoursTtl, WrkHours, LastOklTrf: Double;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure WriteSpan(
    DtEnd: TDateTime;
    DaysTtl, HoursTtl: Integer
  );
  var
    Sum: Double;
  begin
    if DaysTtl > 0 then begin
      Sum := RoundTo(
        nSredneDnevnoe * DaysTtl * qryVOtpProcOpl.AsFloat / 100, -2);

      WriteMnthRes(d_DtPrc, DtBeg, DtEnd, qryVOtpVidN.AsString, DaysTtl,
        HoursTtl, Sum, MesRus(BegDate.Mnth)
      );
    end;
  end;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

begin
  qryVOtp.FieldByName('SmSrDn').AsFloat :=  nSredneDnevnoe;

  // Записать в отклонения, разбрасывая по-месячно
  CreateTmpTable;

  if (qryVOtpRK.AsString = 'R') or RBtnWorkDays.Checked then
    DayType := 'otp'      // в рабочих днях
  else
    DayType := 'otk';     // в календарных днях

  DtBeg := QryVOtpDtBeg.AsDateTime;
  DtCur := DtBeg;

  HoursTtl := 0;
  DaysTtl  := 0;

  BegDate := DateUtils.Decode(DtBeg);

  while DtCur <= QryVOtpDtEnd.AsDateTime do begin
    CurDate := DateUtils.Decode(DtCur);

    // Для видов кроме компенс. за неисп. отп. производим разбивку по месяцам,
    // поэтому отслеживаем изменение месяца. Для компенсации за неисп. отп.
    // делается одна запись на весь отп. dZaMG тот месяц, в котором начин. отп.
    // Сделаем после выхода из цикла
    if (qryVOtpVidN.AsString <> '2406') and (qryVOtpVidN.AsString <> '2411')
      and ((CurDate.Year <> BegDate.Year) or (CurDate.Mnth <> BegDate.Mnth))
    then begin
      // перешли в следующий месяц - записать цифры предыдущего
      WriteSpan(DtCur - 1, DaysTtl, Round(HoursTtl));

      DtBeg := DtCur;
      BegDate := DateUtils.Decode(DtBeg);

      HoursTtl := 0;
      DaysTtl := 0;
    end;

    // Для всех видов накапливаем часы и дни
    DmMain.CheckDayForOtp(DtCur, DayCnt, WrkHours, DayType);
    DaysTtl := DaysTtl + DayCnt;
    HoursTtl := HoursTtl + WrkHours;

    DtCur := DtCur + 1;
  end;

  // Пишем либо последний фрагмент для отпусков, либо компенсацию целиком
  if (qryVOtpVidN.AsString = '2406') or (qryVOtpVidN.AsString = '2411') then
    // дату оконч. и часы оставляю нулевыми
    WriteSpan(0, qryVOtpCNTDAYS.AsInteger, 0)
  else
    WriteSpan(DtCur - 1, DaysTtl, Round(HoursTtl));

  // Если указано, добавить запись о МатПомощи
  if DbChBoxMatPom.Checked then begin
    LastOklTrf := GetLastOklTrf(n_TabN, d_DtPrc);

    WriteMnthRes(d_DtPrc, 0, 0, '1810', 0, 0, LastOklTrf, 'Озд. к отпуску');
  end;

  QryVOtp.FieldByName('CntChas').AsFloat := 0;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.SetSteps;
begin
  if bClickStep1 then begin
    PanelLeft.Enabled    := true;
    DbgrROtp.Enabled    := false;
    dbgrRSrOkl.Enabled   := false;
    PanelRBottom.Enabled := false;
    rGrpAlgoritm.Enabled := true;
    GrBoxDayType.Enabled := true;
    GrBoxSps.Enabled     := true;
    dbeDtBeg.Color   := clWindow;
    dbeCntDays.Color := clWindow;
    dbeDtEnd.Color   := clBtnFace;
    dbeNrPrik.Color  := clWindow;
    dbeDtPrik.Color  := clWindow;
    dbeVidN.Color    := clWindow;
    dbeShVidN.Color  := clWindow;
    dbeProcOpl.Color := clWindow;
    dbeShObj.Color   := clWindow;
    dbeShKatP.Color  := clWindow;
    dbeSPZ.Color     := clWindow;
    dbeNotes.Color   := clWindow;
    DbgrROtp.Color  := clBtnFace;
    dbgrRSrOkl.Color := clBtnFace;
    LabelRSrOkl.Enabled := false;
    DbgrMnthRes.Color   := clBtnFace;
    sBtnPrt.Enabled  := false; end
//    sBtnPrt.Visible  := false; end
  else if bClickStep2 then begin
    PanelLeft.Enabled    := false;
    DbgrROtp.Enabled    := true;
    dbgrRSrOkl.Enabled   := true;
    PanelRBottom.Enabled := false;
    rGrpAlgoritm.Enabled := false;
    GrBoxDayType.Enabled := false;
    GrBoxSps.Enabled     := false;
    dbeDtBeg.Color   := clBtnFace;
    dbeCntDays.Color := clBtnFace;
    dbeDtEnd.Color   := clBtnFace;
    dbeNrPrik.Color  := clBtnFace;
    dbeDtPrik.Color  := clBtnFace;
    dbeVidN.Color    := clBtnFace;
    dbeShVidN.Color  := clBtnFace;
    dbeProcOpl.Color := clBtnFace;
    dbeShObj.Color   := clBtnFace;
    dbeShKatP.Color  := clBtnFace;
    dbeSPZ.Color     := clBtnFace;
    dbeNotes.Color   := clBtnFace;
    DbgrROtp.Color  := clWindow;
    dbgrRSrOkl.Color := clWindow;
    LabelRSrOkl.Enabled := true;
    DbgrMnthRes.Color   := clBtnFace;
    sBtnPrt.Enabled  := false; end
    //sBtnPrt.Visible  := false; end
  else if bClickStep3 then begin
    PanelLeft.Enabled    := false;
    DbgrROtp.Enabled    := false;
    dbgrRSrOkl.Enabled   := false;
    PanelRBottom.Enabled := true;
    rGrpAlgoritm.Enabled := false;
    GrBoxDayType.Enabled := false;
    GrBoxSps.Enabled     := false;
    dbeDtBeg.Color   := clBtnFace;
    dbeCntDays.Color := clBtnFace;
    dbeDtEnd.Color   := clBtnFace;
    dbeNrPrik.Color  := clBtnFace;
    dbeDtPrik.Color  := clBtnFace;
    dbeVidN.Color    := clBtnFace;
    dbeShVidN.Color  := clBtnFace;
    dbeProcOpl.Color := clBtnFace;
    dbeShObj.Color   := clBtnFace;
    dbeShKatP.Color  := clBtnFace;
    dbeSPZ.Color     := clBtnFace;
    dbeNotes.Color   := clBtnFace;
    DbgrROtp.Color  := clBtnFace;
    dbgrRSrOkl.Color := clBtnFace;
    LabelRSrOkl.Enabled := false;
    DbgrMnthRes.Color   := clWindow;
    sBtnPrt.Enabled  := true;
//    sBtnPrt.Visible  := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.DbgrROtpDblClick(Sender: TObject);
var dMaxDtProc : TDateTime; nY, nM, nD : word;
    bKalendarn : boolean;
begin
  DecodeDate(qryVOtp.FieldByName('DtBeg').AsDateTime, nY, nM, nD);
  dMaxDtProc := EncodeDate(nY, nM, 1);
  bKalendarn := (qryVOtp.FieldByName('RK').AsString = 'K')
    or RBtnCalendDays.Checked;
  ShowNuZaMGOtp(c_FamIO, n_TabN, DtLastHire, dMaxDtProc, DsrcROtp,
                                           bKalendarn, bOtpIsSovm); {Z_ShNuMG}
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.DsrcROtpDataChange(Sender: TObject; Field: TField);
begin
  if bIsFormShowNuMGOtp and (DsrcROtp.State = dsBrowse) then
    FormShowNuMG.ShowWorkDaysInMG(QryROtp.FieldByName('ZaMesGod').AsDateTime);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.QryROtpAfterPost(DataSet: TDataSet);
begin
// if bQry_ROtpReady and not bVvodClick then
//    RaschetSrDn12mes;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.RaschetSrDn12mes;
var dSvZaMesGod : TDateTime;
    nSmZ, nSmSrDn : double; nSmD : integer;
begin
  TVacat12Mnth.DisableHandlers;

  with QryROtp do begin
    dSvZaMesGod := FieldByName('ZaMesGod').AsDateTime;
    nSmZ := 0;
    nSmD := 0;
    First;
    DisableControls;
    while not Eof do begin
      nSmZ := nSmZ + FieldByName('SmZpKoef').AsFloat;
      nSmD := nSmD + FieldByName('CntDays').AsInteger;
      Next;
    end;
    Locate('ZaMesGod', dSvZaMesGod, []);
    EnableControls;
    if nSmD > 0 then begin
      LabelMsg1.Caption := 'Сумма заработков = ' +
          FloatToStrF(nSmZ, ffFixed, 18, 2) + ', к-во дней = ' + IntToStr(nSmD);
      nSmSrDn := RoundTo(nSmZ / nSmD, -2);
      LabelMsg2.Caption := 'Среднедневная = ' +
                                           FloatToStrF(nSmSrDn, ffFixed, 18, 2);
      nSredneDnevnoe := nSmSrDn; end
    else
      LabelMsg1.Caption := '';
  end;

  TVacat12Mnth.EnableHandlers;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnPrtClick(Sender: TObject);
var
  cVidN : ShortString; nKdSps : SmallInt;
  DayTypeIndx: Integer;
begin
  cVidN := qryVOtpVidN.AsString;
  if RBtnWorkDays.Checked then
    DayTypeIndx := 0
  else
    DayTypeIndx := 1;
  if rBtnByLast12m.Checked or Algorithm2312 then begin
    if rBtnOnlyCurSps.Checked then
      nKdSps := gl_nAppKdSpsUsr
    else
      nKdSps := 0;
    F6_PrtOtp(n_TabN, c_FamIO, cVidN,
      qryVOtp, QryROtp, CdsMnthRes, DayTypeIndx, nKdSps);
  end else                                                     {z_CmnPrt}
    F6_PrtOtpOkl(n_TabN, c_FamIO,
      qryVOtp, qryRSrOkl, CdsMnthRes, DayTypeIndx, nCntDnejForROkl);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnCalendarClick(Sender: TObject);
begin
  if not bIsFormMyCalendar then
    ShowMyCalendar    {Z_Calend}
  else begin
    if FormMyCalendar.WindowState = wsMinimized then
      FormMyCalendar.WindowState := wsNormal;
    FormMyCalendar.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeShVidNKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVidNClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeShObjKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObjClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeShKatPKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKatPClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.qryVOtpDTPRIKSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.RBtnByLast12mClick(Sender: TObject);
begin
  SetPageControlTabs;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.SetPageControlTabs;
begin
  if RBtnByLast12m.Checked
      or RBtnBy2023.Checked and Algorithm2312 then begin
    PageControl1.ActivePage := tsBy12mes;
    LabelKoefOkl.Enabled := true;
    dbChBoxKoefOkl.Enabled := true;
    sBtnStep2.Hint :=
           'Получение информации за прошлые месяцы и корректировка';
  end else begin
    PageControl1.ActivePage := tsByOkl;
    LabelKoefOkl.Enabled := false;
    dbChBoxKoefOkl.Enabled := false;
    sBtnStep2.Hint :=
           'Получение информации об окладе и надбавках и расчет среднего';

    ActivateDetailControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.qryRSrOklCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  if not qryRSrOklVidN.IsNull and (qryRSrOklVidN.AsString <> '') then
    qryRSrOklShVidN.AsString :=
                     DmMain.VidN2ShVidN(qryRSrOklVidN.AsString, cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbChBoxKoefOklEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbChBoxKoefOklExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnShwStornClick(Sender: TObject);
var
  ShowPanel: Boolean;
begin
  ShowPanel := not PanelStorn.Visible;

  if ShowPanel then begin
    if not cdsStorn.Active then
      CreOpenCdsStorn;
      
    ShowPanel := cdsStorn.RecordCount > 0;
  end;

  if ShowPanel = not PanelStorn.Visible then
    ShowStornPanel(ShowPanel);
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.ShowStornPanel(Value: Boolean);
begin
  PanelStorn.Visible := Value;

  if PanelStorn.Visible then begin
    Constraints.MinHeight := Constraints.MinHeight + PanelStorn.Height;
    PanelButtons.Top := PanelStorn.Top + PanelStorn.Height;
  end else begin
    Constraints.MinHeight := Constraints.MinHeight - PanelStorn.Height;
    Height := Height - PanelStorn.Height;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.CreOpenCdsStorn;
begin
  qryStorn.DatabaseName := CESMAIN;
  with cdsStorn do begin
    if Active then Close;
    CommandText := 'Select kv.ShVidN, o.* from Z_Otkl o, z_KdVidN kv ' +
                   ' where o.TabN = :nTabN and o.Spec_NR = :nSpec_NR and ' +
                   ' o.STORN = "Y" and kv.VidN = o.VidN';
    Params.ParamByName('nTabN').AsInteger := qryVOtpTabN.AsInteger;
    Params.ParamByName('nSpec_NR').AsInteger := qryVOtpSpec_NR.AsInteger;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbgrStornDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrStorn.Canvas do begin
    if not (gdFocused in State) then begin
      if ((Column.FieldName = 'SUMMA') or (Column.FieldName = 'CHAS')) and
                                              (Column.Field.Value < 0) then
        Font.Color := clRed;
    end;
  end;
  dbgrStorn.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.rBtnAllSpsClick(Sender: TObject);
begin
  if not rBtnAllSps.Checked then begin
    rBtnAllSps.Checked := true;
    rBtnOnlyCurSps.Checked := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.rBtnOnlyCurSpsClick(Sender: TObject);
begin
  if not rBtnOnlyCurSps.Checked then begin
    rBtnOnlyCurSps.Checked := true;
    rBtnAllSps.Checked := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.QryROtpNewRecord(DataSet: TDataSet);
begin
  if bQry_ROtpReady then
    QryROtp.Cancel;
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.sBtnKdTemuClick(Sender: TObject);
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
procedure TFormEOtp.dbeKdTemuExit(Sender: TObject);
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
//      edSpZ.Text                := cPSch;
      (Sender as TDBEdit).Color := clWindow;
      dbeSpZ.SetFocus; end
    else begin
      DbeKdTemu.SetFocus;
      ShowMessage('Нет темы "' + IntToStr(nKdTemu) + '" в справочнике тем');
    end; end
  else begin  // в dbeKdSpZ и в dbeSpZ "подразделенческие" значения счета
    dOnDate := dDtProc;
    nTabN := dbeTabN.Field.AsInteger;
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
procedure TFormEOtp.qryVOtpCalcFields(DataSet: TDataSet);
begin
  if not qryVOtpKdTemu.IsNull and (qryVOtpKdTemu.AsInteger > 0) then
    qryVOtpNmTemu.AsString := DmMain.KdTemu2NmTemu(qryVOtpKdTemu.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormEOtp.dbeKdTemuKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_RETURN) then
    sBtnKdTemuClick(Self);
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.Check2023Enabled(Sender: TField);
begin
  if ShouldApply2023 then
    RBtnBy2023.Checked := true
  else
    RBtnByLast12m.Checked := true;
end;

//------------------------------------------------------------------------------
function TFormEOtp.ShouldApply2023: Boolean;
begin
  Result :=
    ((QryVOtpVidN.AsString = '2406') or (QryVOtpVidN.AsString = '2411'))
    and (QryVOtpDtBeg.AsDateTime <= Dec31St2023)
    and (QryVOtpDtProc.AsDateTime >= Sep12Th2023);
end;

//------------------------------------------------------------------------------
procedure TFormEOtp.ShowAverage(SumTotal, DaysTotal: Double);
begin
  LabelMsg1.Caption :=
    'Сумма в зачет = ' + FloatToStrF(SumTotal, ffFixed, 18, 2) + ', ' +
    'дней в зачет = ' + FloatToStrF(DaysTotal, ffFixed, 18, 2);

  if DaysTotal <> 0 then
    nSredneDnevnoe := RoundTo(SumTotal / DaysTotal, -2)
  else
    nSredneDnevnoe := 0;

  LabelMsg2.Caption :=
    'Среднедневная = ' + FloatToStrF(nSredneDnevnoe, ffFixed, 18, 2);
end;

//------------------------------------------------------------------------------
// По изменению одного из дначений Qry_RBln: Сумма, коэфф., кол.дней, считаем
// среднедневную
//------------------------------------------------------------------------------
procedure TFormEOtp.QryROtpChange(Sender: TField);
begin
  RaschetSrDn12mes;
end;

end.
