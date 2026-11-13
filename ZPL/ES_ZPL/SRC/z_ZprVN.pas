unit z_ZprVN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, Provider, DBClient, DBTables,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, ComCtrls, Menus;

type
  string4 = string[4];
  TFormVidNZapros = class(TForm)
    qryTmp: TQuery;
    cdsNu: TClientDataSet;
    dspTmp: TDataSetProvider;
    dsrcNu: TDataSource;
    cdsNuFAM: TStringField;
    cdsNuIMA: TStringField;
    cdsNuOTCH: TStringField;
    cdsNuPSCH: TStringField;
    cdsNuSCHBU: TStringField;
    cdsNuNMSCH: TStringField;
    cdsNuSHVIDN: TStringField;
    cdsNuNMVIDN: TStringField;
    cdsNuOLDKDVIDN: TSmallintField;
    cdsNuVID_KDSPZ: TSmallintField;
    cdsNuKEKV: TStringField;
    cdsNuNR: TIntegerField;
    cdsNuDTPROC: TDateTimeField;
    cdsNuZAMESGOD: TDateTimeField;
    cdsNuTABN: TIntegerField;
    cdsNuVIDN: TStringField;
    cdsNuCHAS: TFloatField;
    cdsNuSUMMA: TFloatField;
    cdsNuDT_BEG: TDateTimeField;
    cdsNuDT_END: TDateTimeField;
    cdsNuKDSPS: TSmallintField;
    cdsNuKDOBJ: TSmallintField;
    cdsNuKDKATP: TSmallintField;
    cdsNuKDSPZ: TSmallintField;
    cdsNuPDN: TSmallintField;
    cdsNuNOTES: TStringField;
    cdsNuPRR: TSmallintField;
    cdsNuPRPV: TSmallintField;
    cdsNuKTO: TSmallintField;
    cdsNuPRKR: TSmallintField;
    cdsNuMYNOTES: TStringField;
    cdsNuSPECPS: TIntegerField;
    cdsNuSPEC_NR: TIntegerField;
    cdsNuOLDKDOBJ: TSmallintField;
    cdsNuFamIO: TStringField;
    cdsZd: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    cdsTmpDtMes: TDateField;
    dsrcZd: TDataSource;
    LbxFilter: TListBox;
    Panel0: TPanel;
    Label1: TLabel;
    sBtnVidN: TSpeedButton;
    dbeVidN: TDBEdit;
    dbComboMes: TDBComboBox;
    rBtnDtPrc: TRadioButton;
    rBtnDtZaMG: TRadioButton;
    BitBtn2: TBitBtn;
    sBtnBack: TSpeedButton;
    dbtShVidN: TDBText;
    DBNavigator1: TDBNavigator;
    sBtnPrt: TSpeedButton;
    PanelInfo: TPanel;
    LabelInf: TLabel;
    bBtnForw: TBitBtn;
    PageControl: TPageControl;
    tsNu: TTabSheet;
    tsOtkl: TTabSheet;
    dbgrNu: TDBGrid;
    dbgrOtkl: TDBGrid;
    cdsOtkl: TClientDataSet;
    dsrcOtkl: TDataSource;
    cdsOtklFAM: TStringField;
    cdsOtklIMA: TStringField;
    cdsOtklOTCH: TStringField;
    cdsOtklNR: TIntegerField;
    cdsOtklKDSPS: TSmallintField;
    cdsOtklDTPROC: TDateTimeField;
    cdsOtklZAMESGOD: TDateTimeField;
    cdsOtklTABN: TIntegerField;
    cdsOtklVIDN: TStringField;
    cdsOtklSHVIDN: TStringField;
    cdsOtklSTORN: TStringField;
    cdsOtklOLDKDVIDN: TSmallintField;
    cdsOtklCHAS: TFloatField;
    cdsOtklSUMMA: TFloatField;
    cdsOtklKDOBJ: TSmallintField;
    cdsOtklKDKATP: TSmallintField;
    cdsOtklDT_BEG: TDateTimeField;
    cdsOtklDT_END: TDateTimeField;
    cdsOtklPDN: TSmallintField;
    cdsOtklKDSPZ: TSmallintField;
    cdsOtklSCHBU: TStringField;
    cdsOtklPSCH: TStringField;
    cdsOtklNOTES: TStringField;
    cdsOtklPRR: TSmallintField;
    cdsOtklPRPV: TSmallintField;
    cdsOtklKTO: TSmallintField;
    cdsOtklPRKR: TSmallintField;
    cdsOtklSPEC_NR: TIntegerField;
    cdsOtklDTVDPV: TDateTimeField;
    cdsOtklNRVDPV: TIntegerField;
    cdsOtklMYNOTES: TStringField;
    cdsOtklSPECPS: TIntegerField;
    cdsOtklPBNK: TSmallintField;
    cdsOtklFamIO: TStringField;
    PopMenuVidNRqst: TPopupMenu;
    NSort: TMenuItem;
    NSortByTabN: TMenuItem;
    NSortByFIO: TMenuItem;
    NSortByKdObj: TMenuItem;
    NSortByKatP: TMenuItem;
    cdsNuShObj: TStringField;
    cdsNuShKatP: TStringField;
    LabelSort: TLabel;
    checkPeriod: TCheckBox;
    dbComboMesEnd: TDBComboBox;
    cdsZdDtMesEnd: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsNuCalcFields(DataSet: TDataSet);
    procedure sBtnPrtClick(Sender: TObject);
    procedure cdsZdDtMesSetText(Sender: TField; const Text: String);
    procedure sBtnVidNClick(Sender: TObject);
    procedure dbeVidNEnter(Sender: TObject);
    procedure dbeVidNExit(Sender: TObject);
    procedure dbComboMesKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure dbComboMesEnter(Sender: TObject);
    procedure dbComboMesExit(Sender: TObject);
    procedure bBtnForwClick(Sender: TObject);
    procedure sBtnBackClick(Sender: TObject);
    procedure cdsOtklCalcFields(DataSet: TDataSet);
    procedure dbeVidNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NSortByTabNClick(Sender: TObject);
    procedure NSortByFIOClick(Sender: TObject);
    procedure NSortByKdObjClick(Sender: TObject);
    procedure NSortByKatPClick(Sender: TObject);
    procedure checkPeriodClick(Sender: TObject);
    procedure cdsZdDtMesEndSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    cSvVidN : string4;
    nSvDtMes, nSvDtMesEnd : integer;
    nSvCaseMes : word;
    cVidN : string4;
    d_MesBeg, d_MesEnd : TDateTime;
    nCaseMes, nCase : word;
    nSortCase: integer;

    procedure CreOpenCdsNu(cVidN: string4; dMesBeg, dMesEnd:TDateTime; nCaseMes: word);
    procedure CreOpenCdsOtkl(cVidN: string4; dMesBeg, dMesEnd: TDateTime; nCaseMes: word);
    procedure CheckAndRunSortMenu(itemToCheck: TMenuItem);

    function SortMessage: string;

    procedure InitControls;
    procedure UpdateControls(nRecCount: integer; cMsg: string);
  public
    { Public declarations }
  end;

procedure ShwNuVidNZapros;
procedure ShwOtklVidNZapros;

const SECTION = 'z_ZprVN';

var
  FormVidNZapros: TFormVidNZapros;

implementation

uses
  a_Const, a_DM, z_DM, a_Lib, z_CmnPrt, z_Main, z_TVids, QryLib, ReqNachVidN;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwOtklVidNZapros;
begin
  FormVidNZapros := TFormVidNZapros.Create(Application);

  with FormVidNZapros do begin
    nCase := 2; // Запрос на отклонения (таблица Z_OTKL)
    PageControl.ActivePage := tsOtkl;
    DBNavigator1.DataSource := dsrcOtkl;

    InitControls;
    ShowModal;

    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShwNuVidNZapros;
begin
  FormVidNZapros := TFormVidNZapros.Create(Application);
  
  with FormVidNZapros do begin
    nCase := 1; // Запрос на начисления/удержания (таблица Z_NU)
    PageControl.ActivePage := tsNu;
    DBNavigator1.DataSource := dsrcNU;

    InitControls;
    ShowModal;

    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.FormCreate(Sender: TObject);
begin
  if FileExists(cDirVids + 'CmboZaMG.lbx') then begin
    dbComboMes.Items.LoadFromFile(cDirVids + 'CmboZaMG.lbx');
    dbComboMesEnd.Items.LoadFromFile(cDirVids + 'CmboZaMG.lbx');
  end;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 400);
    nSvDtMes := ReadInteger(SECTION, 'nSvDtMes', 0);
    nSvDtMesEnd := ReadInteger(SECTION, 'nSvDtMesEnd', 0);
    nSvCaseMes := ReadInteger(SECTION, 'nSvCsM', 1);
    cSvVidN := ReadString(SECTION, 'cSvVidN', '1003');
    nSortCase := ReadInteger(SECTION, 'nSortCase', 0);
    checkPeriod.Checked := ReadBool(SECTION, 'bPeriodChecked', false);
    Free;
  end;
  tsNu.TabVisible := false;
  tsOtkl.TabVisible := false;
  PanelInfo.Width := 385;
  bBtnForw.Top := 3;
  sBtnBack.Top := 3;
  sBtnBack.Visible := false;
  sBtnPrt.Enabled := false;
  if FileExists(cDirVids + 'ZprNu01.vid') then
    dbgrNU.Columns.LoadFromFile(cDirVids + 'ZprNu01.vid');
  if FileExists(cDirVids + 'ZprOtk01.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'ZprOtk01.vid');

  NSortByTabN.Checked := nSortCase = 0;
  NSortByFIO.Checked := nSortCase = 1;
  NSortByKdObj.Checked := nSortCase = 2;
  NSortByKatP.Checked := nSortCase = 3;

  dbComboMesEnd.Visible := checkPeriod.Checked;
end;

//------------------------------------------------------------------------------
procedure TFormVidNZapros.InitControls;
var
  cDummy : string;
  nY, nM, nD : word;
  cMG : ShortString;
  n : SmallInt;
begin
  Caption := 'Ввод задания';
  with cdsZd do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    if cSvVidN <> '' then begin
      FieldByName('VidN').AsString := cSvVidN;
      FieldByName('ShVidN').AsString := DmMain.VidN2ShVidN(cSvVidN, cDummy);
    end;
    if nSvDtMes = 0 then begin
      DecodeDate(Date, nY, nM, nD);
      nSvDtMes := Round(EncodeDate(nY, nM, 1));
    end;
    FieldByName('DtMes').AsDateTime := nSvDtMes;
    if nSvDtMesEnd < nSvDtMes then
      nSvDtMesEnd := nSvDtMes;
    FieldByName('DtMesEnd').AsDateTime := nSvDtMesEnd;
  end;
  if nSvCaseMes = 1 then
    rBtnDtPrc.Checked := true
  else
    rBtnDtZaMG.Checked := true;
  cMG := cdsZd.FieldByName('DtMes').AsString;
  if not MyEmptyDate(cMG) then begin
    cMG := Copy(cMG, 4, 7);
    n := DBComboMes.Items.IndexOf(cMG);
    if n >= 0 then
      DBComboMes.ItemIndex := n;
  end;
  cMG := cdsZd.FieldByName('DtMesEnd').AsString;
  if not MyEmptyDate(cMG) then begin
    cMG := Copy(cMG, 4, 7);
    n := DBComboMesEnd.Items.IndexOf(cMG);
    if n >= 0 then
      DBComboMesEnd.ItemIndex := n;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVidNZapros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if nCase = 1 then
    dbgrNu.Columns.SaveToFile(cDirVids + 'ZprNu01.vid')
  else
    dbgrOtkl.Columns.SaveToFile(cDirVids + 'ZprOtk01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvDtMes',
                            Round(cdsZD.FieldByName('DtMes').AsDateTime));
    WriteInteger(SECTION, 'nSvDtMesEnd',
                            Round(cdsZD.FieldByName('DtMesEnd').AsDateTime));
    if rBtnDtPrc.Checked then
      WriteInteger(SECTION, 'nSvCsM', 1)
    else
      WriteInteger(SECTION, 'nSvCsM', 2);
    WriteString(SECTION, 'cSvVidN', cdsZD.FieldByName('VidN').AsString);

    if NSortByTabN.Checked then
      WriteInteger(SECTION, 'nSortCase', 0)
    else if NSortByFIO.Checked then
      WriteInteger(SECTION, 'nSortCase', 1)
    else if NSortByKdObj.Checked then
      WriteInteger(SECTION, 'nSortCase', 2)
    else {NSortByKatP.Checked}
      WriteInteger(SECTION, 'nSortCase', 3);

    WriteBool(SECTION, 'bPeriodChecked', checkPeriod.Checked);

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVidNZapros.CreOpenCdsNu(cVidN : string4; dMesBeg, dMesEnd :TDateTime;
    nCaseMes : word);
var
  Stmt: string;
  nCntSotr, nCntRec, nTabN: integer;
  nSmm: double;
begin
  LabelInf.Caption := '';

  Stmt :=
    'select u.Fam, u.Ima, u.Otch, ko.ShObj, kp.ShKatP, nu.* ' +
    'from viNu4 nu ' +
      'left join z_Upi u on u.TabN = nu.TabN ' +
      'left join z_KdObj ko on ko.KdObj = nu.KdObj ' +
      'left join Z_KatPers kp on kp.KdKatP = nu.KdKatP ' +
    'where nu.VidN = :VidN ';

  if nCaseMes = 1 then
    Stmt := Stmt +
      'and nu.DtProc between :MesBeg and :MesEnd'
  else
    Stmt := Stmt +
      'and nu.ZaMesGod between :MesBeg and :MesEnd';

  QryUtils.InitQuery(QryTmp);

  with qryTmp do begin
    SQL.Text := Stmt;
    ParamByName('VidN').AsString := cVidN;
    ParamByName('MesBeg').AsDateTime := dMesBeg;
    ParamByName('MesEnd').AsDateTime := dMesEnd;
  end;

  dspTmp.DataSet := qryTmp;

  with cdsNu do begin
    if Active then begin
      EmptyDataSet;
      Close;
      Open;
    end else begin
      ProviderName := 'DspTmp';
      Open;

      AddIndex('OnTN', 'TabN;DtProc;ZaMesGod', []);
      AddIndex('OnFIO', 'Fam;Ima;Otch;ZaMesGod;VidN', []);
      AddIndex('OnKdObj', 'KdObj;KdKatP;Fam;Ima;Otch;ZaMesGod;VidN', []);
      AddIndex('OnKatP', 'KdKatP;KdObj;Fam;Ima;Otch;ZaMesGod;VidN', []);
    end;

    if NSortByTabN.Checked then
      IndexName := 'OnTN'
    else if NSortByFIO.Checked then
      IndexName := 'OnFIO'
    else if NSortByKdObj.Checked then
      IndexName := 'OnKdObj'
    else if NSortByKatP.Checked then
      IndexName := 'OnKatP';

    nTabN := 0;
    nCntSotr := 0;
    nCntRec := RecordCount;
    nSmm := 0;

    DisableControls;
    First;
    while not Eof do begin
      nSmm := nSmm + FieldByName('Summa').AsFloat;

      if FieldByName('TabN').AsInteger <> nTabN then begin
        nTabN := FieldByName('TabN').AsInteger;
        Inc(nCntSotr);
      end;
      
      Next;
    end;
    
    First;
    EnableControls;
  end;

  QryUtils.ReleaseQuery(QryTmp);

  LabelInf.Caption :=
    'Записей ' + IntToStr(nCntRec) + ',  ' +
    'сотрудников ' + IntToStr(nCntSotr) + '. ' +
    'Сумма ' + FloatToStrF(nSmm, ffCurrency, 18, 2);
    
  LabelSort.Caption := SortMessage;
end;

//------------------------------------------------------------------------------
procedure TFormVidNZapros.CreOpenCdsOtkl(cVidN: string4; dMesBeg, dMesEnd: TDateTime;
    nCaseMes: word);
var
  cSQL: string;
  nCntSotr, nCntRec, nTabN: integer;
  nSmm: double;
begin
  LabelInf.Caption := '';
  cSQL := 'select u.Fam, u.Ima, u.Otch, o.* from viOtkl o' +
          ' left outer join z_Upi u on u.TabN = o.TabN' +
          ' where o.VidN = :cVidN and';
  if nCaseMes = 1 then
    cSQL := cSQL + ' o.DtProc >= :dMesBeg and o.DtProc <= :dMesEnd'
  else
    cSQL := cSQL + ' o.ZaMesGod >= :dMesBeg and o.ZaMesGod <= :dMesEnd';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add(cSQL);
    ParamByName('cVidN').AsString := cVidN;
    ParamByName('dMesBeg').AsDateTime := dMesBeg;
    ParamByName('dMesEnd').AsDateTime := dMesEnd;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsOtkl do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    AddIndex('OnTN', 'TabN;DtProc;ZaMesGod', []);
    IndexName := 'OnTN';
    nCntSotr := 0;
    nCntRec := RecordCount;
    nTabN := -999;
    nSmm := 0;
    DisableControls;
    First;
    while not Eof do begin
      nSmm := nSmm + FieldByName('Summa').AsFloat;
      if FieldByName('TabN').AsInteger <> nTabN then begin
        nTabN := FieldByName('TabN').AsInteger;
        Inc(nCntSotr);
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  LabelInf.Caption := 'Записей ' + IntToStr(nCntRec) + ', сотрудников ' +
                      IntToStr(nCntSotr) + '. Сумма ' +
                                         FloatToStrF(nSmm, ffCurrency, 18, 2);
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.cdsNuCalcFields(DataSet: TDataSet);
begin
  cdsNuFamIO.AsString := MyFamIO(cdsNuFam.AsString, cdsNuIma.AsString,
                                                         cdsNuOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.cdsOtklCalcFields(DataSet: TDataSet);
begin
  cdsOtklFamIO.AsString := MyFamIO(cdsOtklFam.AsString, cdsOtklIma.AsString,
                                                         cdsOtklOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.sBtnPrtClick(Sender: TObject);
var cShVidN, cNmVidN, cDummy : string;
begin
  if nCase = 1 then begin
    // Запрос по Z_NU
    cShVidN := cdsNuShVidN.AsString;
    cNmVidN := cdsNuNmVidN.AsString;
    // z_CmnPrt
    TReqNachVidN.Run(
      cVidN, cShVidN, cNmVidN, d_MesBeg, d_MesEnd, nCaseMes, cdsNu
    );
  end else begin
    // Запрос по Z_Otkl
    cShVidN := cdsOtklShVidN.AsString;
    cDummy := DmMain.VidN2ShVidN(cdsOtklVidN.AsString, cNmVidN);
    // z_CmnPrt
    F6PrtResOtklVidN(cVidN, cShVidN, cNmVidN, d_MesBeg, nCaseMes, cdsOtkl);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.cdsZdDtMesSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyMesGod(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := '01-' + Text;
end;

//------------------------------------------------------------------------------
procedure TFormVidNZapros.cdsZdDtMesEndSetText(Sender: TField;
  const Text: String);
begin
  if myEmptyMesGod(Text) then
    Sender.AsString := ''
  else
    Sender.AsString := '01-' + Text;
end;

//------------------------------------------------------------------------------
procedure TFormVidNZapros.sBtnVidNClick(Sender: TObject);
var cVidN, p_KEKV : string4; p_ShVidN : string15; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                     p_KdSpZ : integer; bWasUpdated : boolean;
begin
  dbeVidN.SetFocus;
  with cdsZD do begin
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
      DBComboMes.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.dbeVidNEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.dbeVidNExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.dbComboMesKeyDown(Sender: TObject;
                                             var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    DBComboMes.Show;
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.dbComboMesEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.dbComboMesExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFormVidNZapros.bBtnForwClick(Sender: TObject);
var
  cMsg : string;
begin
  cVidN := cdsZd.FieldByName('VidN').AsString;

  if rBtnDtPrc.Checked then
    nCaseMes := 1
  else
    nCaseMes := 2;

  d_MesBeg := cdsZd.FieldByName('DtMes').AsDateTime;
  if checkPeriod.Checked then begin
    d_MesEnd := cdsZd.FieldByName('DtMesEnd').AsDateTime;
    if d_MesEnd < d_MesBeg then begin
      ShowMessage('Ошибка: Дата конца периода меньше даты начала периода.');
      exit;
    end;
  end
  else
    d_MesEnd := d_MesBeg;

  if nCase = 1 then begin
    // Запрос по Z_NU
    cMsg := 'Начисления/Удержания:  Вид ' + cVidN + ' [' +
      cdsZd.FieldByName('ShVidN').AsString + '] ';

    CreOpenCdsNu(cVidN, d_MesBeg, d_MesEnd, nCaseMes);
    UpdateControls(cdsNu.RecordCount, cMsg);
  end
  else begin
    // Запрос по Z_Otkl
    cMsg := 'Отклонения:  Вид ' + cVidN + ' [' +
      cdsZd.FieldByName('ShVidN').AsString + '] ';

    CreOpenCdsOtkl(cVidN, d_MesBeg, d_MesEnd, nCaseMes);
    UpdateControls(cdsOtkl.RecordCount, cMsg);
  end;
end;

//- SB -------------------------------------------------------------------------
procedure TFormVidNZapros.UpdateControls(nRecCount: integer; cMsg: string);
var
 nY, nM, nD : word;
 dDtMes: TDateTime;
begin
  if nRecCount = 0 then
    ShowMessage('Не найдено записей по заданным условиям')
  else begin
    dDtMes := cdsZd.FieldByName('DtMes').AsDateTime;
    DecodeDate(dDtMes, nY, nM, nD);

    if nCaseMes = 1 then
      cMsg := cMsg + ' в ' + MesPredl(nM)
    else
      cMsg := cMsg + ' за ' + MesRus(nM);

    cMsg := cMsg + ' ' + IntToStr(nY) + ' г.';
    Caption := cMsg;
    PanelInfo.Visible := true;
    sBtnPrt.Enabled := true;
    bBtnForw.Visible := false;
    sBtnBack.Visible := true;

    checkPeriod.Visible := false;
    DBComboMes.Visible := false;
    dbComboMesEnd.Visible := false;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormVidNZapros.sBtnBackClick(Sender: TObject);
begin
  if nCase = 1 then
    cdsNu.Close // Запрос по Z_NU
  else
    cdsOtkl.Close; // Запрос по Z_Otkl

  Caption := 'Ввод задания';
  PanelInfo.Visible := false;
  sBtnPrt.Enabled := false;
  bBtnForw.Visible := true;
  sBtnBack.Visible := false;

  checkPeriod.Visible := true;
  DBComboMes.Visible := true;
  dbComboMesEnd.Visible := checkPeriod.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormVidNZapros.dbeVidNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVidN.Click;
end;

//------------------------------------------------------------------------------
// Выбор режима сортировки
//------------------------------------------------------------------------------

procedure TFormVidNZapros.NSortByTabNClick(Sender: TObject);
begin
  CheckAndRunSortMenu(NSortByTabN);
  cdsNU.IndexName := 'OnTN';
end;

procedure TFormVidNZapros.NSortByFIOClick(Sender: TObject);
begin
  CheckAndRunSortMenu(NSortByFIO);
  cdsNU.IndexName := 'OnFIO';
end;

procedure TFormVidNZapros.NSortByKdObjClick(Sender: TObject);
begin
  CheckAndRunSortMenu(NSortByKdObj);
  cdsNU.IndexName := 'OnKdObj';
end;

procedure TFormVidNZapros.NSortByKatPClick(Sender: TObject);
begin
  CheckAndRunSortMenu(NSortByKatP);
  cdsNU.IndexName := 'OnKatP';
end;

procedure TFormVidNZapros.CheckAndRunSortMenu(itemToCheck: TMenuItem);
begin
    NSortByTabN.Checked  := false;
    NSortByFIO.Checked   := false;
    NSortByKdObj.Checked := false;
    NSortByKatP.Checked  := false;

    itemToCheck.Checked := true;

    LabelSort.Caption := SortMessage;
end;

function TFormVidNZapros.SortMessage: string;
begin
  if NSortByTabN.Checked then
    Result := 'Сортировка по табельному номеру'
  else if NSortByFIO.Checked then
    Result := 'Сортировка по Ф.И.О'
  else if NSortByKdObj.Checked then
    Result := 'Сортировка по подразделению, категории персонала'
  else if NSortByKatP.Checked then
    Result := 'Сортировка по категории персонала, подразделению'
  else
    Result := '';
end;

procedure TFormVidNZapros.checkPeriodClick(Sender: TObject);
begin
  dbComboMesEnd.Visible := checkPeriod.Checked;
end;

end.
