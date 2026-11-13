unit z_AddPP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DBCGrids, ComCtrls,
  ExtCtrls, Db, DBTables, Grids, DBGrids, IniFiles, Menus;

type
  TFormAddPP = class(TForm)
    qryPere: TQuery;
    qryPereNR: TIntegerField;
    qryPereTABN: TIntegerField;
    qryPereDT_BEG: TDateTimeField;
    qryPereDT_END: TDateTimeField;
    qryPereKDOBJ: TSmallintField;
    qryPereKDKATP: TSmallintField;
    qryPereSO: TSmallintField;
    qryPereOKLTRF: TFloatField;
    qryPereAVANS: TFloatField;
    qryPereSP_AV: TStringField;
    qryPereDOLGNOST: TStringField;
    qryPereNR_PRIKAZA: TStringField;
    qryPereDT_PRIKAZA: TDateTimeField;
    qryPerePR_PENS: TSmallintField;
    qryPereSOVM: TSmallintField;
    qryPerePDNLG: TSmallintField;
    qryPereKOLMIN: TSmallintField;
    qryPereNmSO: TStringField;
    qryPereNmShPdn: TStringField;
    qryTmp: TQuery;
    dsrcPere: TDataSource;
    updPere: TUpdateSQL;
    qryPereNmKatP: TStringField;
    qryPereShObj: TStringField;
    qryPerePRCWRKTIME: TFloatField;
    qryPereKDSPZ: TSmallintField;
    qryPerePRFS: TSmallintField;
    qryPereNOTES: TStringField;
    qryPereINV: TSmallintField;
    qryPereRANG: TSmallintField;
    qryPereRAZR: TSmallintField;
    qryPereOLDKDOBJ: TSmallintField;
    qryPereSpZ: TStringField;
    qryPerePROCLG: TFloatField;
    qryPereKDSPS: TSmallintField;
    qryPereKDDOLGN: TSmallintField;
    qryPerePRDEKR: TStringField;
    qryPereCMBOKL: TStringField;
    qryPereSPEC_NR: TIntegerField;
    qryPereShSovm: TStringField;
    qryPrmUv: TQuery;
    dsrcPrmUv: TDataSource;
    updPrmUv: TUpdateSQL;
    qryPrmUvNR: TIntegerField;
    qryPrmUvKDSPS: TSmallintField;
    qryPrmUvTABN: TIntegerField;
    qryPrmUvDT_PRIEM: TDateTimeField;
    qryPrmUvDT_UVOLN: TDateTimeField;
    qryPrmUvNR_PRIKAZA: TStringField;
    qryPrmUvDT_PRIKAZA: TDateTimeField;
    qryPrmUvNR_PRUVOLN: TStringField;
    qryPrmUvDT_PRUVOLN: TDateTimeField;
    qryPrmUvNOTES: TStringField;
    Label7: TLabel;
    qryPereKDTEMU: TSmallintField;
    qryPereNmTemu: TStringField;
    qryPereOLDKDOK: TSmallintField;
    qryPereNEWKDOK: TSmallintField;
    qryPereOldDolgnOk: TStringField;
    qryPereOldCode: TStringField;
    qryPereOldD_zkpp: TStringField;
    qryPereOldNameD: TStringField;
    qryPereOldNameFull: TStringField;
    qryPereNewDolgnOK: TStringField;
    qryPereNewCode: TStringField;
    qryPereNewD_zkpp: TStringField;
    qryPereNewNameD: TStringField;
    qryPereNewNameFull: TStringField;
    qryPereNPD: TSmallintField;
    Panel1: TPanel;
    DBCheckBoxPens: TDBCheckBox;
    Label60: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label63: TLabel;
    sBtnVbrShPdN: TSpeedButton;
    sBtnInvDocs: TSpeedButton;
    sBtnLgt: TSpeedButton;
    dbeNmShNlg: TDBEdit;
    DBCheckBoxPrfs: TDBCheckBox;
    dbeProcLg: TDBEdit;
    dbePrcWrkTime: TDBEdit;
    dbeInv: TDBEdit;
    dbeNPD: TDBEdit;
    Label13: TLabel;
    statTabN: TStaticText;
    statFamIO: TStaticText;
    Bevel0: TBevel;
    LabelDtPriem: TLabel;
    dbeDtPriem: TDBEdit;
    Label61: TLabel;
    dbeNrPrikaza: TDBEdit;
    dbeDtPrikaza: TDBEdit;
    Label19: TLabel;
    dbeDtUvln: TDBEdit;
    Label20: TLabel;
    dbeNrPrUvoln: TDBEdit;
    Label21: TLabel;
    Label14: TLabel;
    dbeDtPrUvoln: TDBEdit;
    Label54: TLabel;
    Label58: TLabel;
    sBtnVbrSPZ: TSpeedButton;
    sBtnVbrSO: TSpeedButton;
    LabelOklTrf1: TLabel;
    sBtnKatP: TSpeedButton;
    Label15: TLabel;
    LabelObj: TLabel;
    sBtnObj: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    Label4: TLabel;
    sBtnSovm: TSpeedButton;
    Label22: TLabel;
    sBtnKdTemu: TSpeedButton;
    labelDkpp: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    sBtnGetNewOK: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    dbeOklad: TDBEdit;
    dbeAvans: TDBEdit;
    dbeShSO: TDBEdit;
    DBCheckBox4: TDBCheckBox;
    dbeObj: TDBEdit;
    dbeRang: TDBEdit;
    dbeRazr: TDBEdit;
    dbeShSovm: TDBEdit;
    dbeKdObj: TDBEdit;
    edKatP: TEdit;
    edSpZ: TEdit;
    dbeKdTemu: TDBEdit;
    dbeNmTemu: TDBEdit;
    dbeOldCode: TDBEdit;
    dbeOldD_zkpp: TDBEdit;
    dbeOldNameD: TDBEdit;
    dbeOldNameFull: TDBEdit;
    dbeOldKdOk: TDBEdit;
    dbeOldDolgnOk: TDBEdit;
    dbeNewKdOk: TDBEdit;
    dbeNewDolgnOk: TDBEdit;
    dbeNewCode: TDBEdit;
    dbeNewD_zkpp: TDBEdit;
    dbeNewNameD: TDBEdit;
    dbeNewNameFull: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Bevel4: TBevel;
    dbeLisSch: TDBEdit;
    edShBnk: TEdit;
    qryLS: TQuery;
    qryLSNR: TIntegerField;
    qryLSTABN: TIntegerField;
    qryLSDTBEG: TDateTimeField;
    qryLSLICSCH: TStringField;
    qryLSKDBNK: TSmallintField;
    qryLSNOTES: TStringField;
    dsrcLS: TDataSource;
    updLS: TUpdateSQL;
    qryCalcf: TQuery;
    qryCalcfCODE: TStringField;
    qryCalcfC_ZKPP: TStringField;
    qryCalcfC_ETDK: TStringField;
    qryCalcfC_DKHP: TStringField;
    qryCalcfNAMED: TStringField;
    qryCalcfNAMEFULL: TStringField;
    qryCalcfNAME: TStringField;
    dbeKdSpZ: TDBEdit;
    dbeSPZ: TDBEdit;
    ChBoxAddInCurSps: TCheckBox;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnKdBnk: TSpeedButton;
    lblPrchUv: TLabel;
    dbeKdPidZv: TDBEdit;
    dbePidZviln: TDBEdit;
    sBtnKdPidZv: TSpeedButton;
    qryPrmUvKDPIDZV: TSmallintField;
    qryPrmUvNAME: TStringField;
    Bevel5: TBevel;
    LblNotes: TLabel;
    DbeNotes: TDBEdit;
    DBCheckBoxInv: TDBCheckBox;
    qryPereBM: TStringField;
    qryPereDtBM: TDateTimeField;
    LblBaseMnth: TLabel;
    DbChBoxBaseMnth: TDBCheckBox;
    DbeBaseMnth: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//    procedure qryUpiAfterPost(DataSet: TDataSet);
    procedure qryPereAfterPost(DataSet: TDataSet);
    procedure sBtnVbrSOClick(Sender: TObject);
    procedure sBtnVbrShPdNClick(Sender: TObject);
    procedure qryPereBeforePost(DataSet: TDataSet);
    procedure sBtnVbrSPZClick(Sender: TObject);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure sBtnKatPClick(Sender: TObject);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure DBCheckBoxEnter(Sender: TObject);
    procedure DBCheckBoxExit(Sender: TObject);
    procedure sBtnObjClick(Sender: TObject);
    procedure dbeObjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edKatPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBComboBoxPolEnter(Sender: TObject);
    procedure DBComboBoxPolExit(Sender: TObject);
    procedure edSPZKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbeShSOKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeDtPriemExit(Sender: TObject);
    procedure sBtnSovmClick(Sender: TObject);
    procedure dbeShSovmKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeNmShNlgKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeKdObjEnter(Sender: TObject);
    procedure dbeKdObjExit(Sender: TObject);
    procedure dbeDtUvlnExit(Sender: TObject);
    procedure qryPrmUvAfterPost(DataSet: TDataSet);
    procedure qryPrmUvDT_PRIEMSetText(Sender: TField; const Text: String);
    procedure qryPrmUvDT_UVOLNSetText(Sender: TField; const Text: String);
    procedure qryPereKDOBJValidate(Sender: TField);
    procedure edKatPExit(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure edSpZExit(Sender: TObject);
    procedure qryLSBeforePost(DataSet: TDataSet);
    procedure qryLSAfterPost(DataSet: TDataSet);
    procedure EditExit(Sender: TObject);
    procedure sBtnInvDocsClick(Sender: TObject);
    procedure sBtnLgtClick(Sender: TObject);
    procedure sBtnKdTemuClick(Sender: TObject);
    procedure dbeKdTemuExit(Sender: TObject);
    procedure qryPereCalcFields(DataSet: TDataSet);
    procedure sBtnGetOldOKClick(Sender: TObject);
    procedure dbeOldD_zkppExit(Sender: TObject);
    procedure sBtnGetNewOKClick(Sender: TObject);
    procedure dbePrcWrkTimeExit(Sender: TObject);
    procedure sBtnKdBnkClick(Sender: TObject);
    procedure edShBnkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeKdPidZvDblClick(Sender: TObject);
    procedure dbeKdPidZvExit(Sender: TObject);
    procedure dbeKdPidZvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sBtnKdPidZvClick(Sender: TObject);
    procedure DbChBoxBaseMnthClick(Sender: TObject);
    procedure qryPereBMChange(Sender: TField);
  private
    { Private declarations }
    n_KdObj, n_KdKatP : integer;
    b_CallFromSps : boolean;
    bCallInvDocs, bCallLgotu : boolean; // вызывались ли ShwInvDocs и ShwLgotu
    n_TabN: integer;
    c_FamIO : ShortString;
    procedure OpenQryPrmUv;
    procedure OpenQryPere;
    procedure OpenQryLS;

    procedure SetDefaultPere;
    procedure SetDefaultLS;

    function CheckVvod : boolean;
    function MyValidKatPers(var cText : ShortString;
                                            var nKdKatP : SmallInt) : boolean;
    function MyValidKdSpZ(var cText : ShortString; var nKdSpZ : SmallInt;
                                             var bHsChld : boolean) : boolean;
    function CopyAssgnFilter(FieldName: ShortString): Boolean;
  public
    class function AddPrmPere(nTabN: integer; cFam, cIma, cOtch: shortstring) : boolean;

    function GetNameD(cCode, cZ_Kpp: ShortString;
             var cNameD, cNameFull: ShortString) : boolean;
  end;

const SECTION = 'z_eUpiA';

var
  FormAddPP: TFormAddPP;

implementation

uses A_Const, A_DM, Z_DM, z_Main, z_TUpi, A_Lib, Z_TObj,
     Z_GtPdN, Z_GtOpl, Z_GtPers, z_GtSovm, A_SBU, A_ShwErr,
     Z_EPere, Z_KdDlgn, z_ShwBnk, z_Lgotu, z_InvDoc, z_ShwTem,
     z_dk2010, z_PidZv, DsLib;

{$R *.DFM}

//------------------------------------------------------------------------------
class function TFormAddPP.AddPrmPere(nTabN: integer; cFam, cIma, cOtch: shortstring) : boolean;
begin
  Result := false;

  FormAddPP := TFormAddPP.Create(Application);
  FormAddPP.n_TabN := nTabN;
  FormAddPP.c_FamIO := MyFamIO(cFam, cIma, cOtch);

  with FormAddPP do begin
    statTabN.Caption := IntToStr(n_TabN);
    statFamIO.Caption := c_FamIO;

    n_KdObj  := 0;
    n_KdKatP := 0;
    Caption := 'Ввод Приёма с Перемещением';
    // dsrcUpi.DataSet := DmMain.dsrcPrmUv.DataSet;

    OpenQryPrmUv;
    OpenQryPere;
    OpenQryLS;

    if ShowModal = mrOk then begin
      Result := true;
    end;

    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.OpenQryPrmUv;
begin
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    // DataSource := dsrcUpi;
    SQL.Add('Select first 1 * from z_PrmUv u, z_PidZviln z' +
      ' where u.TabN = :TabN and z.code = u.KdPidZv order by Dt_Priem desc');
    Params.ParamByName('TabN').AsInteger := n_TabN;
    Open;
    Append;
    qryPrmUvTABN.AsInteger := n_TabN;
    qryPrmUvKdSps.AsInteger := 0;         // только на предприятие
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.OpenQryPere;
begin
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    // DataSource := dsrcUpi;
    SQL.Add('Select first 1 * from Z_PERE where TABN = :TabN' +
      ' order by dt_beg desc');
    Params.ParamByName('TabN').AsInteger := n_TabN;
    Open;
    Append;

    SetDefaultPere;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.OpenQryLS;
begin
  with qryLS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    // DataSource := dsrcUpi;
    SQL.Add('Select * from Z_BankiLS where TABN = :TabN');
    Params.ParamByName('TabN').AsInteger := n_TabN;
    Open;
    Append;

    SetDefaultLS;
  end;
end;

//- SB -------------------------------------------------------------------------
procedure TFormAddPP.SetDefaultPere;
var
  cShKatP: string;
begin
  InitQuery(qryTmp);

  with qryTmp do begin
    SQL.Add('select first 1 * from z_pere' +
      ' where TabN = :nTabN order by dt_beg desc');
    Params.ParamByName('nTabN').AsInteger := n_TabN;
    Open;
  end;

  if DsUtils.CopyRecord(qryTmp, qryPere, nil, CopyAssgnFilter) then begin
    qryPereSpec_Nr.AsInteger := 0;
    qryPereOLDKDOK.AsInteger := qryTmp.FieldByName('NewKdOk').AsInteger;
  end;

  ReleaseQuery(qryTmp);

  DmMain.KdKatP2NmKatP(qryPereKDKATP.AsInteger, cShKatP);
  edKatP.Text := cShKatP;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TFormAddPP.CopyAssgnFilter(FieldName: ShortString): Boolean;
begin
  FieldName := UpperCase(FieldName);
  Result := (FieldName <> 'BM') and (FieldName <> 'DTBM');
end;

//- SB -------------------------------------------------------------------------
procedure TFormAddPP.SetDefaultLS;
begin
  InitQuery(qryTmp);
  with qryTmp do begin
    SQL.Add('select first 1 s.KdBnk, s.LicSch, b.ShBnk' +
      ' from z_BankiLS s, z_Banki b' +
      ' where TabN = :nTabN  and b.kdbnk = s.kdbnk' +
      ' order by DtBeg desc'
    );
    Params.ParamByName('nTabN').AsInteger := n_TabN;
    Open;
  end;
  if CopyRecord(qryTmp, qryLS) then
    edShBnk.Text := qryTmp.FieldByName('ShBnk').AsString;
  ReleaseQuery(qryTmp);
end;

//------------------------------------------------------------------------------
procedure TFormAddPP.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 500);
    Height := 580;
    ChBoxAddInCurSps.Checked := ReadBool(SECTION, 'bAddInCurMes', true);
    Free;
  end;
  edShBnk.Text := '';
  edKatP.Text := '';
  dbeoldCode.DataSource       := dsrcPere;
  dbeoldD_Zkpp.DataSource     := dsrcPere;
  dbeOldNameD.DataSource      := dsrcPere;
  dbeOldNameFull.DataSource   := dsrcPere;
  dbenewCode.DataSource       := dsrcPere;
  dbenewD_Zkpp.DataSource     := dsrcPere;
  dbenewNameD.DataSource      := dsrcPere;
  dbenewNameFull.DataSource   := dsrcPere;
end;
//------------------------------------------------------------------------------
function TFormAddPP.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;

  if MyEmptyDate(qryPrmUv.FieldByName('Dt_Priem').AsString) then
    mListErr.Add('Не введена дата приёма');
  if MyEmptyDate(qryPrmUv.FieldByName('Dt_Prikaza').AsString) then
    mListErr.Add('Не введена дата приказа');
  if qryPrmUv.FieldByName('Nr_Prikaza').AsString = '' then
    mListErr.Add('Не введен номер приказа ');

  if (qryPere.FieldByName('ShObj').AsString = '') then
    mListErr.Add('Не выбрано подразделение');
  if (qryPere.FieldByName('ShKatP').AsString = '') then
    mListErr.Add('Не выбрана категория персонала');
  if (qryPere.FieldByName('ShSO').AsString = '') then
    mListErr.Add('Не выбрана система оплаты');
  if (qryPere.FieldByName('SpZ').AsString = '') then
    mListErr.Add('Нет связанного счета БухУчета');
  if (qryPere.FieldByName('ShPdNlg').AsString = '') then
    mListErr.Add('Не выбрана схема начисления налога с доходов');
  if qryPere.FieldByName('Inv').IsNull or
                 (qryPere.FieldByName('Inv').AsString = '') then
    mListErr.Add('Не проставлен признак инвалидности')
  else if (qryPere.FieldByName('Inv').AsInteger > 3) or
                 (qryPere.FieldByName('Inv').AsInteger < 0) then
    mListErr.Add('Призн.инвалидн. допускается от 0 до 3');
  if not qryLSKdBnk.IsNull and
            (qryLSLicSch.IsNull or (qryLSLicSch.AsString = '')) then
    mListErr.Add('При выбранном банке должен быть счет');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
    end else begin
      qryPereNOTES.AsString := qryPrmUvNOTES.AsString;

      // ниже на UpdatesPending проверяю, потому что при qryUpi.Post,
      // оказывается, делается автоматом Post
      // и у qryPrmUv и у qryPere (видимо через dsrcUpi)

//      if qryPrmUv.UpdatesPending then
        qryPrmUv.Post;
//      if qryPere.UpdatesPending then
        qryPere.Post;
//      if qryLS.UpdatesPending then
        qryLS.Post;
    end;
  end;
end;
(*
//------------------------------------------------------------------------------
procedure TFormAddPP.AddPrmUv;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_PrmUv (TabN, Dt_Priem, Dt_Uvoln, Nr_Prikaza,' +
    ' KdPidZv, Nr_PrUvoln, Dt_PrUvoln, Notes)' +
    ' values (:TabN, :DtPriem, :DtUvoln, :NrPrikaza,' +
    ' :KdPidZv, :NrPrUvoln, :DtPrUvoln, :Notes)');
    ParamByName('TabN').AsInteger := nKdSps;
    ParamByName('DtPriem').AsDateTime := dDtPrc;
    ParamByName('DtUvoln').AsInteger := nTabN;
    ParamByName('NrPrikaza').AsInteger := nKdObj;
    ParamByName('KdPidZv').AsInteger := nKdKatP;
    ParamByName('NrPrUvoln').AsString := cNotes;
    ParamByName('DtPrUvoln').AsString := cNotes;
    ParamByName('Notes').AsString := cNotes;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.AddPere;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_SPS (KdSps, DtProc, TabN, KdObj, KdKatP, Notes) ' +
            ' values (:nKdSps, :dDtPrc, :nTabN, :nKdObj, :nKdKatP, :cNotes)');
    ParamByName('nKdSps').AsInteger := nKdSps;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nKdObj').AsInteger := nKdObj;
    ParamByName('nKdKatP').AsInteger := nKdKatP;
    ParamByName('cNotes').AsString := cNotes;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormAddPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if not b_CallFromSps then {т.к. при b_CallFromSps обязательно Checked}
      WriteBool(SECTION, 'bAddInCurMes', ChBoxAddInCurSps.Checked);
    Free;
  end;
end;
(*
//------------------------------------------------------------------------------
procedure TFormEUpi_3.qryUpiAfterPost(DataSet: TDataSet);
//var bUpd : boolean;
begin
  bUpd := dsrcUpi.DataSet.UpdatesPending;
  TRY
  if bUpd then begin
    qryPere.DataSource := nil;
    qryUpi.ApplyUpdates;
    qryUpi.Close;        // не то !!!! Она и так закроется
    qryUpi.Open;
    qryPere.DataSource := dsrcUpi;
  end;
  EXCEPT
    ;
  END;
end;
*)
//------------------------------------------------------------------------------
procedure TFormAddPP.qryPereBeforePost(DataSet: TDataSet);
begin
  if qryPere.State = dsInsert then begin
    qryPereTabN.AsInteger := n_TabN;
    qryPereDt_Beg.AsString := qryPrmUvDt_Priem.AsString;
    qryPereDt_Prikaza.AsString := qryPrmUvDt_Prikaza.AsString;
    qryPereNr_Prikaza.AsString := qryPrmUvNr_Prikaza.AsString;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.qryLSBeforePost(DataSet: TDataSet);
begin
  if qryLS.State = dsInsert then begin
    qryLSTabN.AsInteger := n_TabN;
    qryLSDtBeg.AsString := qryPrmUvDt_Priem.AsString;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.qryLSAfterPost(DataSet: TDataSet);
begin
  if qryLS.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryLS]);
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.qryPereAfterPost(DataSet: TDataSet);
begin
  if qryPere.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryPere]);
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.qryPrmUvAfterPost(DataSet: TDataSet);
begin
  if qryPrmUv.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryPrmUv]);
end;
(*
//------------------------------------------------------------------------------
procedure TFormEUpi_2.qryPereAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryPere]);
end;
*)
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnVbrSOClick(Sender: TObject);
var  nKdOpl : integer; cNmOpl : string;
begin
  dbeShSO.SetFocus;
  nKdOpl := qryPere.FieldByName('SO').AsInteger; {Z_GtOpl}
  if GetSysOpl(nKdOpl, cNmOpl) then begin
    qryPere.FieldByName('SO').AsInteger := nKdOpl;
    dbeOklad.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnVbrShPdNClick(Sender: TObject);
var  nKdShPdN : integer; cNmShPdN, cShShPdN : string;
begin
  dbeNmShNlg.SetFocus;
  nKdShPdn := qryPere.FieldByName('PdNlg').AsInteger;
  if GetShPdN(nKdShPdN, cNmShPdN, cShShPdN) {Z_GtPdN} then begin
    qryPere.FieldByName('PdNlg').AsInteger := nKdShPdN;
    dbeProcLg.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnVbrSPZClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSchBU : string; bHsCh : boolean;
begin
  edSPZ.SetFocus;
  nKdSPZ := qryPere.FieldByName('KdSPZ').AsInteger;
  if GetSbu(nKdSPZ, cSchBU, cPSch, cNmSchBU, bHsCh) {A_SBU} then begin

    qryPere.FieldByName('KdSPZ').AsInteger := nKdSPZ;
    edSPZ.Text := cSchBU;
    edSPZ.OnExit := NIL;
    dbeNmShNlg.SetFocus;
    edSPZ.OnExit := edSpZExit;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.DateFieldSetText(Sender: TField;
                                                  const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer; cShKatP, cNmKatP : string;
begin
  edKatP.SetFocus;
  if not qryPere.FieldByName('KdKatP').IsNull then
    nKdKatP := qryPere.FieldByName('KdKatP').AsInteger
  else
    nKdKatP := -999;
  cShKatP := '';
  cNmKatP := '';
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) then begin      {Z_GtPers}
    qryPere.FieldByName('KdKatP').AsInteger := nKdKatP;
    edKatP.Text := cShKatP;
    // остальное сделает LookUp
    n_KdKatP := nKdKatP;
    dbeShSovm.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbePrcWrkTimeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
  // добавить про НПДл
  if dbePrcWrkTime.Field.IsNull or (dbePrcWrkTime.Field.AsInteger = 0) or
                                    (dbePrcWrkTime.Field.AsInteger = 100) then
     dbeNPD.Field.AsString := ''
  else
    dbeNPD.Field.AsInteger := 1;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeKdObjEnter(Sender: TObject);
begin
  if dbeKdObj.Enabled then
    (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeKdObjExit(Sender: TObject);
begin
  if dbeKdObj.Enabled then
    (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeDtUvlnExit(Sender: TObject);
begin
  if not myEmptyDate(dbeDtUvln.Text) then begin
    qryPrmUvDt_PrUvoln.AsString := qryPrmUvDt_Prikaza.AsString;
    qryPrmUvNr_PrUvoln.AsString := qryPrmUvNr_Prikaza.AsString;
  end;  // предполагается, что если есть датаУвольн., то тем же приказом
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeDtPriemExit(Sender: TObject);
begin
  qryPrmUvDt_Prikaza.AsString := qryPrmUvDt_Priem.AsString;
  qryPrmUvNr_Prikaza.AsString := '-К';
  qryPrmUvNr_PrUvoln.AsString := '-К';
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.DBCheckBoxEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Font.Color := clBlue;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.DBCheckBoxExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Font.Color := clWindowText;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.DBComboBoxPolEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.DBComboBoxPolExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnObjClick(Sender: TObject);
var nKdObj, nObjKdSpZ : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  if not sBtnObj.Enabled then
    Exit;
  dbeObj.SetFocus;
  nKdObj := dbeObj.DataSource.DataSet.FieldByName('KdObj').AsInteger;
  if GetKdObj(nKdObj, nObjKdSpZ,
                              cNmObj, cShObj, bWasUpdated) {Z_TObj} then begin
    dbeObj.DataSource.DataSet.FieldByName('KdObj').AsInteger := nKdObj;
    dbeObj.DataSource.DataSet.FieldByName('KdSpZ').AsInteger := nObjKdSpZ;
    edSpZ.Text := DmMain.KdSbu2SchBU(nObjKdSpZ);
    edKatP.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeObjKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if sBtnObj.Enabled and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObj.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.edKatPKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKatP.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeShSovmKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSovm.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.edSPZKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVbrSpz.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeNmShNlgKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSovm.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeShSOKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if sBtnVbrSO.Enabled and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVbrSO.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnSovmClick(Sender: TObject);
var nKdSovm : integer; cDummy : string;
begin
  nKdSovm := qryPere.FieldByName('Sovm').AsInteger;
  dbeShSovm.SetFocus;
  if GetVidSovm(nKdSovm, cDummy, cDummy) {z_GtSovm} then begin
    qryPere.FieldByName('Sovm').AsInteger := nKdSovm;
    dbeShSO.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.qryPrmUvDT_PRIEMSetText(Sender: TField;
                                                            const Text: String);
var cText : ShortString;
begin
  cText := Text;
  if MyEmptyDate(cText) then
      Raise Exception.Create('Дата приема нужна обязательно')
  else begin
    // dsrcUpi.DataSet.FieldByName('LastDtPrm').AsString := cText;
    Sender.AsString := cText;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.qryPrmUvDT_UVOLNSetText(Sender: TField;
                                                            const Text: String);
var cText : ShortString;
begin
  cText := Text;
  // if qryPere.Active then
  //   dsrcUpi.DataSet.FieldByName('LastDtUvl').AsString := cText;
  Sender.AsString := cText;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.qryPereKDOBJValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean;
    nKdObj{, nObjKdSpZ} : integer;
    cSh_Obj : ShortString;
    cShObj, cNmObj, cFioUpoln : string;
    nKdUPos, nKassa, nKdSpZ : integer;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    nKdObj := StrToInt(cText);
    bIsInDic := DmMain.IsKdObjInDic(nKdObj, cSh_Obj);
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике подразделения ' + cText)
    else begin
      DmMain.GetObjInfo(nKdObj, cShObj, cNmObj, cFioUpoln,
                         nKdUPos, nKassa, nKdSpZ);
      qryPere.FieldByName('KdSPZ').AsInteger := nKdSpZ;
      edSpZ.Text := DmMain.KdSbu2SchBU(nKdSpZ);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.EditEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.EditExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
function TFormAddPP.MyValidKatPers(var cText : ShortString;
                                     var nKdKatP : SmallInt) : boolean;
begin
  Result := false;
  nKdKatP := DmMain.ShKatP2KdKatP(cText);
  if nKdKatP > 0 then begin
    Result := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.edKatPExit(Sender: TObject);
var cText : ShortString; nKdKatP : SmallInt;
begin
  cText := edKatP.Text;
  if (cText > '') and not MyValidKatPers(cText, nKdKatP) then begin
    ShowMessage('Нет в справочнике категории "' + cText + '"');
    edKatP.Text := '';
    edKatP.SetFocus; end
  else begin
    qryPere.FieldByName('KdKatP').AsInteger := nKdKatP;
    edKatP.Text := cText; // чтобы заменить на UpperCase
    (Sender as TEdit).Color := clWindow;
  end;
end;
//------------------------------------------------------------------------------
function TFormAddPP.MyValidKdSpZ(var cText : ShortString;
                        var nKdSpZ : SmallInt; var bHsChld : boolean) : boolean;
begin
  Result := DmMain.SchBU2KdSBU(cText, nKdSpZ, bHsChld);
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.edSpZExit(Sender: TObject);
var cMsg, cText : ShortString;
    nKdSpZ : SmallInt;
    bHsChld, bIsInPlan : boolean;
begin
  cText := edSpZ.Text;
  if (cText > '') then begin
    bIsInPlan := MyValidKdSpZ(cText, nKdSpZ, bHsChld);
    cMsg := '';
    if not bIsInPlan then
      cMsg := 'Нет в справочнике счета "' + cText + '"'
    else if bHsChld then
      cMsg := 'Счет "' + cText + '" аналитический. Нельзя его выбирать';
    if cMsg > '' then begin
      ShowMessage(cMsg);
      edSpZ.Text := '';
      qryPere.FieldByName('KdSpZ').AsString := '';
      edSpZ.SetFocus; end
    else begin
      edSpz.Text := cText;
      qryPere.FieldByName('KdSpZ').AsInteger := nKdSpZ;
      (Sender as TEdit).Color := clWindow;
    end; end
  else begin
    qryPere.FieldByName('KdSpZ').AsString := '';
    (Sender as TEdit).Color := clWindow;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnInvDocsClick(Sender: TObject);
begin
  ShwInvDocs(n_TabN, c_FamIO);       {z_InvDoc}
  bCallInvDocs := true;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnLgtClick(Sender: TObject);
var nCntChld10_11 : SmallInt;
    nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11 : double;
    cOznPilg : ShortString;
begin
  ShwLgotu(n_TabN, c_FamIO);  {z_Lgotu}
  bCallLgotu := true;
  DmMain.GetSmPrcLgt(n_TabN, dDtProc, nCntChld10_11,
                     nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11, cOznPilg);
  dbeProcLg.Field.AsFloat := nSmPrcLgtSotr + nSmPrcLgtChld10 + nSmPrcLgtChld11;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnKdTemuClick(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
begin
  dbeKdTemu.SetFocus;
  with dbeKdTemu.DataSource.DataSet as TQuery do begin
    nKdTemu := dbeKdTemu.Field.AsInteger;
    cNmTemu := dbeNmTemu.Text;
    if GetTemu(nKdTemu, nKdPSch, cNmTemu, cPSch) {z_ShwTem} then begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      dbeKdTemu.Field.AsInteger := nKdTemu;
      dbeNmTemu.Text  := cNmTemu;
      dbeSpZ.Field.AsInteger  := nKdPSch;
      dbeKdTemu.OnExit := NIL;
      edSpZ.Text       := cPSch;
      dbeKdTemu.Color  := clWindow;
      edSPZ.SetFocus;
      dbeKdTemu.OnExit := dbeKdTemuExit;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeKdTemuExit(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
    {nTabN : integer;}
    nKdSpZ: SmallInt; cSchBU: ShortString;
begin

  if not dbeKdTemu.Field.IsNull then begin  // поставить в dbeKdSpZ и в
    nKdTemu := dbeKdTemu.Field.AsInteger;   // dbeSpZ "темные" значения сёчёта
    if CheckKdTemu(nKdTemu, nKdPSch, cNmTemu, cPSch) {z_ShwTem} then begin
      dbeNmTemu.Field.AsString := cNmTemu;
      dbeKdSpZ.Field.AsInteger  := nKdPSch;
      dbeSpZ.Field.AsString     := cPSch;
      edSpZ.Text                := cPSch;
      (Sender as TDBEdit).Color := clWindow;
      edSpZ.SetFocus; end
    else begin
      DbeKdTemu.SetFocus;
      ShowMessage('Нет темы "' + IntToStr(nKdTemu) + '" в справочнике тем');
    end; end
  else begin // в dbeKdSpZ и в dbeSpZ "подразделенческие" значения счета
             //по умолчанию
    if Form_Dm.GetSpZByObj(dbeKdObj.Field.AsInteger, nKdSpZ, cSchBU) then begin
      dbeNmTemu.Field.AsString := '';
      dbeKdSpZ.Field.AsInteger := nKdSpZ;
      dbeSpZ.Field.AsString    := cSchBU;
      edSpZ.Text               := cSchBU;
      (Sender as TDBEdit).Color := clWindow;
      edSpZ.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.qryPereCalcFields(DataSet: TDataSet);
var
    nOldKdOK, nNewKDOk: SmallInt;
    cOldDolgnOK, cOldCode, cOldD_zkpp, cOldNameD, cOldNameFull,
    cNewDolgnOK, cNewCode, cNewD_zkpp, cNewNameD, cNewNameFull : ShortString;
begin
  with qryPere do begin
    nOldKdOK   := qryPereOldKdOk.AsInteger;
    nNewKdOK   := qryPereNewKdOK.AsInteger;
//    qryPereSpZ.AsString := KdSbu2SchBU(qryPereKdSpZ.AsInteger);
//    qryPereShSps.AsString := Form_Dm.KdSps2ShSps(qryPereKdSps.AsInteger);
//    if not qryPereKdTemu.IsNull and (qryPereKdTemu.AsInteger > 0) then
//      qryPereNmTemu.AsString := KdTemu2NmTemu(qryPereKdTemu.AsInteger);

    if (nOldKdOk > 0) and DmMain.GetOkRkvzt(nOldKdOK,
         cOldDolgnOK, cOldCode, cOldD_zkpp, cOldNameD, cOldNameFull) then begin
      qryPereOldDolgnOK.AsString  := cOldDolgnOK;
      qryPereOldCode.AsString     := cOldCode;
      qryPereOldD_zkpp.AsString   := cOldD_zkpp;
      qryPereOldNameD.AsString    := cOldNameD;
      qryPereOldNameFull.AsString := cOldNameFull; end
    else begin
      qryPereOldDolgnOK.AsString  := '';
      qryPereOldCode.AsString     := '';
      qryPereOldD_zkpp.AsString   := '';
      qryPereOldNameD.AsString    := '';
      qryPereOldNameFull.AsString := '';
    end;


    if (nNewKdOk > 0) and DmMain.GetOkRkvzt(nNewKdOK,
         cNewDolgnOK, cNewCode, cNewD_zkpp, cNewNameD, cNewNameFull) then begin
      qryPereNewDolgnOK.AsString  := cNewDolgnOK;
      qryPereNewCode.AsString     := cNewCode;
      qryPereNewD_zkpp.AsString   := cNewD_zkpp;
      qryPereNewNameD.AsString    := cNewNameD;
      qryPereNewNameFull.AsString := cNewNameFull; end
    else begin
      qryPereNewDolgnOK.AsString  := '';
      qryPereNewCode.AsString     := '';
      qryPereNewD_zkpp.AsString   := '';
      qryPereNewNameD.AsString    := '';
      qryPereNewNameFull.AsString := '';
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnGetOldOKClick(Sender: TObject);
var
  nKdOk: SmallInt;
  cRetNmOK, cRetCode, cRetZKpp, cRetNameD, cRetNameFull: ShortString;
begin
  nKdOK := dbeOldKdOK.Field.AsInteger;
  // >> z_dk2010
  if TFormDK2010.GetDKRkvzt(
    nKdOK, cRetNmOK, cRetCode, cRetZKpp, cRetNameD, cRetNameFull)
  then
    dbeOldKdOK.Field.AsInteger := nKdOk;
end;
//------------------------------------------------------------------------------
function TFormAddPP.GetNameD(cCode, cZ_Kpp: ShortString;
                            var cNameD,cNameFull: ShortString): boolean;
begin
  Result := false;
  with qryCalcF do begin
    if Active then Close;
    Sql.Clear;
    databasename := CESOK;
    SQL.Add('select * from dk2010 where (code = :cCode) and (c_zkpp = :c_zkpp)');
    ParamByName('cCode').AsString := cCode;
    ParamByName('c_zkpp').AsString := cZ_Kpp;
    Open;
    if RecordCount > 0 then begin
     cNameD := FieldByName('NameD').AsString;
     cNameFull := FieldByName('NameFull').AsString;
     REsult := true;
    end;
    Close;
    Sql.Clear;
    databasename := '';
 end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeOldD_zkppExit(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnGetNewOKClick(Sender: TObject);
var
  nKdOk: SmallInt;
  cRetNmOK, cRetCode, cRetZKpp, cRetNameD, cRetNameFull: ShortString;
begin
  nKdOK := dbeNewKdOK.Field.AsInteger;
  // >> z_dk2010
  if TFormDK2010.GetDKRkvzt(
    nKdOK, cRetNmOK, cRetCode, cRetZKpp, cRetNameD, cRetNameFull)
  then
    dbeNewKdOK.Field.AsInteger := nKdOk;
end;

//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnKdBnkClick(Sender: TObject);
var nKdBnk : SmallInt; cShBnk, cNmBnk : ShortString;
begin
  nKdBnk := qryLSKdBnk.AsInteger;
  if GetZplBank(nKdBnk, cShBnk, cNmBnk) {Z_ShwBnk} then begin
    qryLSKdBnk.AsInteger := nKdBnk;
    edShBnk.Text := cShBnk;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.edShBnkKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdBnk.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeKdPidZvDblClick(Sender: TObject);
begin
  sBtnKdPidZv.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeKdPidZvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdPidZv.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.dbeKdPidZvExit(Sender: TObject);
var
  cText, cPidZviln : ShortString;
  nKdPidZv : SmallInt;
begin
  cText := dbeKdPidZv.Text;
  if cText = '' then
    dbePidZviln.Field.AsString :=  ''
  else if cText > '' then begin
    nKdPidZv := dbeKdPidZv.Field.AsInteger;
    if CheckKdPidZv(nKdPidZv, cPidZviln) {z_PidZv} then begin
      dbePidZviln.Field.AsString := cPidZviln;
      dbeKdPidZv.Color := clWindow;
    end else begin
      ShowMessage('Нет кода "' + cText + '" в таблице "Причины увольнения"');
      dbeKdPidZv.SetFocus;
    end;
  end;
  dbeExit(Sender);
end;
//------------------------------------------------------------------------------
procedure TFormAddPP.sBtnKdPidZvClick(Sender: TObject);
var
  nKdPidZv : integer;
  cPidZv : ShortString;
begin
  dbePidZviln.SetFocus;
  nKdPidZv := dbeKdPidZv.Field.AsInteger;
  if GetPidZviln(nKdPidZv, cPidZv) {z_PidZv} then begin
    dbeKdPidZv.Field.AsInteger := nKdPidZv;
    dbePidZviln.Field.AsString := cPidZv;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormAddPP.DbChBoxBaseMnthClick(Sender: TObject);
begin
  with DbeBaseMnth do begin
    Enabled := (Sender as TDbCheckBox).Checked;

    if Enabled then
      Color := clWindow
    else
      Color := clBtnFace;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormAddPP.qryPereBMChange(Sender: TField);
begin
  with Sender.DataSet do begin
    if FieldByName('BM').AsString <> 'Y' then
      FieldByName('DtBM').AsString := '';
  end;
end;

end.
