unit Z_EUdrg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, Mask, DBCtrls, Db, DBTables,
  ExtCtrls, ComCtrls;

type
  String3 = string[3];
  String4 = string[4];
  TFormEAUdrg = class(TForm)
    PanelTools: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    PageControl: TPageControl;
    tsAlim: TTabSheet;
    tsSberk: TTabSheet;
    Label1: TLabel;
    dbeNomSberBank: TDBEdit;
    Label3: TLabel;
    dbeLicSchet: TDBEdit;
    LabelPosta: TLabel;
    LabelAdres: TLabel;
    dbePosta: TDBEdit;
    tsDummy: TTabSheet;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    sBtnPst: TSpeedButton;
    PanelComu: TPanel;
    Label10: TLabel;
    DbMemKomu: TDBMemo;
    DbMemAddress: TDBMemo;
    LblInn: TLabel;
    DbeInn: TDBEdit;
    PanelCommon: TPanel;
    Label2: TLabel;
    LabelSumDolg: TLabel;
    LabelSumVzn: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LabelDt_End: TLabel;
    Label9: TLabel;
    sBtnVidN: TSpeedButton;
    sBtnSPZ: TSpeedButton;
    LabelFamIO: TLabel;
    dbtSP: TDBText;
    LabelNrPost: TLabel;
    LabelDtPost: TLabel;
    Label5: TLabel;
    sBtnKdSlg: TSpeedButton;
    Label8: TLabel;
    dbeSumDolg: TDBEdit;
    dbeSumVzn: TDBEdit;
    dbeNomDok: TDBEdit;
    dbeDt_Beg: TDBEdit;
    dbeDt_End: TDBEdit;
    dbeSPZ: TDBEdit;
    dbeShVidN: TDBEdit;
    dbeVidN: TDBEdit;
    GroupBox1: TGroupBox;
    rBtnSps2: TRadioButton;
    rBtnSps1: TRadioButton;
    rBtnSps4: TRadioButton;
    rBtnSps3: TRadioButton;
    LbxFilter: TListBox;
    dbeNrPost: TDBEdit;
    dbeDtPost: TDBEdit;
    dbeDtDok: TDBEdit;
    dbeKdSlg: TDBEdit;
    dbeNmSlg: TDBEdit;
    LblOznDoh: TLabel;
    BtnOznDoh: TSpeedButton;
    DbeOznDoh: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure sBtnVidNClick(Sender: TObject);
    procedure sBtnSPZClick(Sender: TObject);
    procedure dbeVidNKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure dbeSPZKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rBtnSpsClick(Sender: TObject);
    procedure sBtnPstClick(Sender: TObject);
    procedure dbePostaKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure dbeVidNExit(Sender: TObject);
    procedure sBtnKdSlgClick(Sender: TObject);
    procedure DbMemEnter(Sender: TObject);
    procedure DbMemExit(Sender: TObject);
    procedure BtnOznDohClick(Sender: TObject);
    procedure DbeInnExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    // Входящие <<
    FamIO: ShortString;
    DsrcUdrg: TDataSource;
    // >>

    bEditMode : boolean;
    n_SvSpsRsch : byte;
    dOldDtBeg, nOldDtEnd : TDateTime;  // Перед редактированием запоминаю эти
    nOldSpsRsch : integer;    // значения, чтобы, в случае их изменения, дать
    nOldSumDolg, nOldSumVzn : double;  // вказивку на перерасчет (не влияющие
    cOldVidN : string4;                // на суммы и периоды расчетов опускаю)
    DsUdrg: TDataSet;

    SvTargInnOnChange: TFieldNotifyEvent;

    constructor Create(FamIO: ShortString; DsrcUdrg: TDataSource); reintroduce;
    procedure TargInnOnChange(Field: TField);

    procedure SetDataSource;
    procedure SetVidUdrgFields(cVidN : string4);
    function CheckVvod : boolean;
    procedure SetSpsEnv;

    procedure SaveEvents;
    procedure SetEvents;
    procedure RestoreEvents;

    procedure CheckINN;
  public
    class function AddEdtUdrg(
      FamIO: ShortString; DsrcUdrg: TDataSource): Boolean;

    class function UdrgEdt: Boolean;
    class function UdrgAdd: Boolean;
  end;

const SECTION = 'Z_EUdrg';

implementation

uses
  a_Const, a_Lib, a_SBU, a_ShwErr, z_DM, z_IspSlg, z_Main, z_PstPsb, z_TVids,
  SalaryLib, FormOznDoh;

{$R *.DFM}

//------------------------------------------------------------------------------
class function TFormEAUdrg.AddEdtUdrg(
  FamIO: ShortString;
  DsrcUdrg: TDataSource
): Boolean;
begin
  Result := false;

  with TFormEAUdrg.Create(FamIO, DsrcUdrg) do begin
    Result := ShowModal = mrOk;
    Free;
  end;
end;

//------------------------------------------------------------------------------
class function TFormEAUdrg.UdrgEdt: Boolean;
begin
  Result := False;

  with TFormEAUdrg.Create('', nil) do begin
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;

//------------------------------------------------------------------------------
class function TFormEAUdrg.UdrgAdd: Boolean;
begin
  Result := False;

  with TFormEAUdrg.Create('', nil) do begin
    dbeVidN.DataSource.DataSet.Append;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;

//------------------------------------------------------------------------------
constructor TFormEAUdrg.Create(FamIO: ShortString; DsrcUdrg: TDataSource);
begin
  inherited Create(nil);

  Self.FamIO := FamIO;
  Self.DsrcUdrg := DsrcUdrg;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.FormCreate(Sender: TObject);
var
  SpsRsch: Integer;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    n_SvSpsRsch := ReadInteger(SECTION, 'nSvSpsRsch', 0);
    Free;
  end;

  SetDataSource;
  bEditMode := dsrcUdrg.State = dsEdit;

  SaveEvents;
  SetEvents;

  tsAlim.TabVisible := false;
  tsDummy.TabVisible := false;
  tsSberk.TabVisible := false;

  SetVidUdrgFields(dbeVidN.Field.AsString);

  if bEditMode then
    SpsRsch := DsUdrg.FieldByName('SpsRsch').AsInteger
  else
    SpsRsch := n_SvSpsRsch;

  if SpsRsch = 1 then        // % от окл  до даты DtEnd
    rBtnSps1.Checked := true
  else if SpsRsch = 2 then   // пост сумма до даты DtEnd
    rBtnSps2.Checked := true
  else if SpsRsch = 3 then   // % от суммы заработка после всех удержаний
    rBtnSps3.Checked := true
  else                       // пост. сумма от даты начала до погашения
    rBtnSps4.Checked := true;

  SetSpsEnv;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.FormShow(Sender: TObject);
begin
  LabelFamIO.Caption    := FamIO;

  if not bEditMode then
    Caption := 'Новое удержание'
  else begin
    Caption := 'Редактирование удержания';

    with dsrcUdrg.DataSet do begin
      dOldDtBeg   := FieldByName('Dt_Beg').AsDateTime;
      nOldDtEnd   := FieldByName('Dt_End').AsDateTime;
      nOldSpsRsch := FieldByName('SpsRsch').AsInteger;
      nOldSumDolg := FieldByName('SumDolg').AsFloat;
      nOldSumVzn  := FieldByName('SumVzn').AsFloat;
      cOldVidN    := FieldByName('VidN').AsString;
    end;
  end;

  CheckINN;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.FormClose(Sender: TObject;
                                           var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if rBtnSps1.Checked then
      WriteInteger(SECTION, 'nSvSpsRsch', 1)
    else if rBtnSps2.Checked then
      WriteInteger(SECTION, 'nSvSpsRsch', 2)
    else if rBtnSps3.Checked then
      WriteInteger(SECTION, 'nSvSpsRsch', 3)
    else
      WriteInteger(SECTION, 'nSvSpsRsch', 4);
    Free;
  end;

  RestoreEvents;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.SetDataSource;
begin
  DsUdrg := DsrcUdrg.DataSet;

  dbeVidN.DataSource    := dsrcUdrg;
  dbeShVidN.DataSource  := dsrcUdrg;
  dbeSumDolg.DataSource := dsrcUdrg;
  dbeSumVzn.DataSource  := dsrcUdrg;
  dbtSP.DataSource      := dsrcUdrg;
  dbeNomDok.DataSource  := dsrcUdrg;
  dbeDtDok.DataSource   := dsrcUdrg;
  dbeDt_Beg.DataSource  := dsrcUdrg;
  dbeDt_End.DataSource  := dsrcUdrg;
  dbeSPZ.DataSource     := dsrcUdrg;
  DbMemKomu.DataSource  := dsrcUdrg;
  DbMemAddress.DataSource := dsrcUdrg;
  dbePosta.DataSource   := dsrcUdrg;
  dbeNomSberBank.DataSource := dsrcUdrg;
  dbeLicSchet.DataSource    := dsrcUdrg;
  dbeNrPost.DataSource  := dsrcUdrg;
  dbeDtPost.DataSource  := dsrcUdrg;
  dbeNotes.DataSource   := dsrcUdrg;
  DbeInn.DataSource     := DsrcUdrg;
  DbeOznDoh.DataSource  := DsrcUdrg;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.SaveEvents;
begin
  SvTargInnOnChange := DsUdrg.FindField('TARGETINN').OnChange;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.SetEvents;
var
  Field: TField;
begin
  DsUdrg.FindField('TARGETINN').OnChange := TargInnOnChange;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.RestoreEvents;
begin
  DsUdrg.FindField('TARGETINN').OnChange := SvTargInnOnChange;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.TargInnOnChange(Field: TField);
begin
  if Assigned(SvTargInnOnChange) then
    SvTargInnOnChange(Field);

  CheckINN;
end;

//------------------------------------------------------------------------------
function TFormEAUdrg.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dbeShVidN.Text = '') then
    mListErr.Add('Нет вида удержания');
//  if rBtnSps4.Checked and (dbeSumDolg.Text = '') then
//    mListErr.Add('Не введена сумма долга');
  if (dbeNomDok.Text = '') then
    mListErr.Add('Нет номера документа');
  if (dbeSumVzn.Text = '') then begin
    if rBtnSps2.Checked or rBtnSps4.Checked then
      mListErr.Add('Нет суммы удержания')
    else if rBtnSps1.Checked or rBtnSps3.Checked then
      mListErr.Add('Нет процента удержания');
  end;
  if (dbeSPZ.Text = '') then
    mListErr.Add('Не выбран шифр затрат');
  if MyEmptyDate(dbeDt_Beg.Text) then
    mListErr.Add('Не введена дата начала удержаний');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var nTabN : integer; mDataSet : TDataSet;
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeVidN.SetFocus; end
    else begin
      mDataSet := dbeVidN.DataSource.DataSet;
      with mDataSet do begin
        if rBtnSps1.Checked then
          FieldByName('SpsRsch').AsInteger := 1
        else if rBtnSps2.Checked then
          FieldByName('SpsRsch').AsInteger := 2
        else if rBtnSps3.Checked then
          FieldByName('SpsRsch').AsInteger := 3
        else
          FieldByName('SpsRsch').AsInteger := 4;
      end;
      // Решить с пересчетом прошлых месяцев
      if (not bEditMode and (dbeDt_Beg.Field.AsDateTime < dCtrlDate)) or
           (bEditMode and
           ((mDataSet.FieldByName('SpsRsch').AsInteger <> nOldSpsRsch) or
            (mDataSet.FieldByName('SumDolg').AsFloat <> nOldSumDolg) or
            (mDataSet.FieldByName('Dt_Beg').AsDateTime <> dOldDtBeg) or
            (mDataSet.FieldByName('Dt_End').AsDateTime <> nOldDtEnd) or
            (mDataSet.FieldByName('SumVzn').AsFloat <> nOldSumVzn) or
            (mDataSet.FieldByName('VidN').AsString <> cOldVidN))) then begin
        nTabN := dbeDt_Beg.DataSource.DataSet.FieldByName('TabN').AsInteger;
        DmMain.AddPereschetInOtkl(1, nTabN, dCtrlDate,
                                                  dbeDt_Beg.Field.AsDateTime);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.dbeVidNExit(Sender: TObject);
begin
  if (not dbeVidN.Field.IsNull) and (dbeShVidN.Text = '') then begin
    ShowMessage('Нет в справочнике видов начислений вида ' +
                                         dbeVidN.Field.AsString);
    dbeVidN.SetFocus; end
  else begin
    SetVidUdrgFields(dbeVidN.Field.AsString);
    (Sender as TDBEdit).Color := clWindow;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.sBtnVidNClick(Sender: TObject);
var cVidN, p_KEKV : string4; p_ShVidN : string15; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                     p_KdSpZ : integer; bWasUpdated : boolean;
begin
  dbeShVidN.SetFocus;
  with dbeShVidN.DataSource.DataSet as TQuery do begin
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
      SetVidUdrgFields(cVidN);
//      if dbeSumDolg.Visible then
        dbeSumDolg.SetFocus
//      else
//        dbeSumVzn.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.dbeVidNKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVidN.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.SetVidUdrgFields(cVidN : string4);
begin
//  PageControl1.Visible := false;
  dbeNrPost.Visible := false;
  dbeDtPost.Visible := false;
  LabelNrPost.Visible := false;
  LabelDtPost.Visible := false;
  if (cVidN = '6601') then begin  // алименты
    LabelNrPost.Visible := true;
    LabelDtPost.Visible := true;
    dbeNrPost.Visible := true;
    dbeDtPost.Visible := true;
///    Height := 387;   // 365; // 351;  //351;
    PageControl.Visible := true;
    PageControl.ActivePage := tsAlim; end
  else if (cVidN = '6611') then begin  // Переводы
///    Height := 365; // 351;  //351;
    PageControl.Visible := true;
    PageControl.ActivePage := tsAlim; end
  else if cVidN = '7519' then begin  // Сберкасса
///    Height := 365; // 351;  // 339;
    rBtnSps1.Enabled := false;
    rBtnSps4.Enabled := false;
    PageControl.Visible := true;
    PageControl.ActivePage := tsSberk; end
  else begin
///    Height := 365;  // 339;
    PageControl.ActivePage := tsDummy;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.sBtnSPZClick(Sender: TObject);
var nKdSBU : integer; cShSBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSPZ.SetFocus;
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSBU := FieldByName('KdSPZ').AsInteger;
    cShSBU := FieldByName('SPZ').AsString;
    if GetSBU(nKdSBU, cShSBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSPZ').AsInteger := nKdSBU;
      dbeNomDok.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                               Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZ.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.rBtnSpsClick(Sender: TObject);
begin
  SetSpsEnv;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.SetSpsEnv;
begin
  if rBtnSps1.Checked then begin
//    LabelSumDolg.Visible := false;
//    dbeSumDolg.Visible := false;
    LabelDt_End.Visible := true;
    dbeDt_End.Visible := true;
    LabelSumVzn.Caption := 'Проц.удержания';
    dbtSP.DataSource.DataSet.FieldByName('SP').AsString := '%'; end
  else if rBtnSps2.Checked then begin
//    LabelSumDolg.Visible := true;
//    dbeSumDolg.Visible := false;
    LabelDt_End.Visible := true;
    dbeDt_End.Visible := true;
    LabelSumVzn.Caption := 'Сумма удержания';
    dbtSP.DataSource.DataSet.FieldByName('SP').AsString := 'р'; end
  else if rBtnSps3.Checked then begin
//    LabelSumDolg.Visible := false;
//    dbeSumDolg.Visible := false;
    LabelDt_End.Visible := true;
    dbeDt_End.Visible := true;
    LabelSumVzn.Caption := '% от заработка';
    dbtSP.DataSource.DataSet.FieldByName('SP').AsString := '%'; end
  else if rBtnSps4.Checked then begin
//    LabelSumDolg.Visible := true;
//    dbeSumDolg.Visible := true;
    LabelDt_End.Visible := false;
    dbeDt_End.Visible := false;
    LabelSumVzn.Caption := 'Сумма удержания';
    dbtSP.DataSource.DataSet.FieldByName('SP').AsString := 'р';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.sBtnPstClick(Sender: TObject);
var nKdPst : integer; cShPst, cNmPst : string;
begin
  dbePosta.SetFocus;
  if GetKdPst(nKdPst, cShPst, cNmPst) {z_PstPsb} then begin
    dbePosta.DataSource.DataSet.FieldByName('KdPst').AsInteger := nKdPst;
    DbMemAddress.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.dbePostaKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnPst.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEAUdrg.sBtnKdSlgClick(Sender: TObject);
var
  nKdSlg : SmallInt;
  cNmSlg, cAdres : ShortString;
begin
  nKdSlg := dbeKdSlg.Field.AsInteger;
  if GetKdSlg(nKdSlg, cNmSlg, cAdres) {z_ispslg} then
    dbeKdSlg.Field.AsInteger := NkdsLG;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.DbMemEnter(Sender: TObject);
begin
  (Sender as TDbMemo).Color := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.DbMemExit(Sender: TObject);
begin
  (Sender as TDbMemo).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.BtnOznDohClick(Sender: TObject);
var
  OznDoh: Integer;
begin
  OznDoh := DsUdrg.FieldByName('OznDoh').AsInteger;

  if TFrmOznDoh.Run(OznDoh) then
    with DsUdrg do
      FieldByName('OznDoh').AsInteger := OznDoh;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.DbeInnExit(Sender: TObject);
begin
//  CheckINN;
end;

//------------------------------------------------------------------------------
procedure TFormEAUdrg.CheckINN;
begin
  DbeOznDoh.Enabled := DsUdrg.FieldByName('TargetINN').AsString <> '';
  BtnOznDoh.Enabled := DbeOznDoh.Enabled;

  if DbeOznDoh.Enabled then
    DbeOznDoh.Color := clWindow
  else begin
    DsUdrg.FieldByName('OznDoh').AsInteger := 0;
    DbeOznDoh.Color := clBtnFace;
  end;
end;

end.
