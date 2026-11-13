unit z_eUpiA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DBCGrids, ComCtrls,
  ExtCtrls, Db, DBTables, Grids, DBGrids, IniFiles, Menus;

type
  TFormUpiAdd = class(TForm)
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
    qryLS: TQuery;
    qryLSNR: TIntegerField;
    qryLSTABN: TIntegerField;
    qryLSDTBEG: TDateTimeField;
    qryLSLICSCH: TStringField;
    qryLSKDBNK: TSmallintField;
    qryLSNOTES: TStringField;
    dsrcLS: TDataSource;
    updLS: TUpdateSQL;
    dsrcUpi: TDataSource;
    dbeKdSpZ: TDBEdit;
    dbeSPZ: TDBEdit;
    qryPereKDTEMU: TSmallintField;
    qryPereNmTemu: TStringField;
    qryCalcf: TQuery;
    qryCalcfCODE: TStringField;
    qryCalcfC_ZKPP: TStringField;
    qryCalcfC_ETDK: TStringField;
    qryCalcfC_DKHP: TStringField;
    qryCalcfNAMED: TStringField;
    qryCalcfNAMEFULL: TStringField;
    qryCalcfNAME: TStringField;
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
    Panel: TPanel;
    Label6: TLabel;
    DBCheckBoxInv: TDBCheckBox;
    qryPereBM: TStringField;
    qryPereDtBM: TDateTimeField;
    PanelOldPos: TPanel;
    Label47: TLabel;
    dbeDolgn: TDBEdit;
    sBtnDolgn: TSpeedButton;
    PanelPrevPos: TPanel;
    labelDkpp: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    sBtnGetOldOK: TSpeedButton;
    Label25: TLabel;
    Label26: TLabel;
    dbeOldCode: TDBEdit;
    dbeOldD_zkpp: TDBEdit;
    dbeOldNameD: TDBEdit;
    dbeOldNameFull: TDBEdit;
    dbeOldKdOk: TDBEdit;
    dbeOldDolgnOk: TDBEdit;
    PanelNewPos: TPanel;
    Label28: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    sBtnGetNewOK: TSpeedButton;
    dbeNewKdOk: TDBEdit;
    dbeNewDolgnOk: TDBEdit;
    dbeNewCode: TDBEdit;
    dbeNewD_zkpp: TDBEdit;
    dbeNewNameD: TDBEdit;
    dbeNewNameFull: TDBEdit;
    Label30: TLabel;
    Label31: TLabel;
    PanelHead: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelDtPriem: TLabel;
    Label7: TLabel;
    Label61: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Bevel0: TBevel;
    DBComboBoxPol: TDBComboBox;
    dbeOtch: TDBEdit;
    dbeDtPriem: TDBEdit;
    dbeID: TDBEdit;
    dbeNrPrikaza: TDBEdit;
    dbeDOB: TDBEdit;
    dbeIma: TDBEdit;
    dbeFam: TDBEdit;
    dbeDtPrikaza: TDBEdit;
    dbeDtUvln: TDBEdit;
    dbeNrPrUvoln: TDBEdit;
    dbeDtPrUvoln: TDBEdit;
    Bevel1: TBevel;
    DbChBoxCitiz: TDBCheckBox;
    PanelBottom: TPanel;
    ChBoxAddInCurSps: TCheckBox;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    PanelOthers: TPanel;
    Label54: TLabel;
    Label58: TLabel;
    Label60: TLabel;
    sBtnVbrSPZ: TSpeedButton;
    Label63: TLabel;
    sBtnVbrShPdN: TSpeedButton;
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
    Label5: TLabel;
    sBtnKdBnk: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    sBtnInvDocs: TSpeedButton;
    sBtnLgt: TSpeedButton;
    Label22: TLabel;
    sBtnKdTemu: TSpeedButton;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    LblNotes: TLabel;
    LblBaseMnth: TLabel;
    dbeOklad: TDBEdit;
    dbeAvans: TDBEdit;
    dbeShSO: TDBEdit;
    dbeNmShNlg: TDBEdit;
    DBCheckBoxPens: TDBCheckBox;
    DBCheckBoxPrfs: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    dbeObj: TDBEdit;
    dbeRang: TDBEdit;
    dbeRazr: TDBEdit;
    dbeProcLg: TDBEdit;
    dbeShSovm: TDBEdit;
    dbeKdObj: TDBEdit;
    dbePrcWrkTime: TDBEdit;
    edKatP: TEdit;
    edSpZ: TEdit;
    edShBnk: TEdit;
    dbeLisSch: TDBEdit;
    dbeInv: TDBEdit;
    dbeKdTemu: TDBEdit;
    dbeNmTemu: TDBEdit;
    dbeNPD: TDBEdit;
    DbeNotes: TDBEdit;
    DbChBoxBaseMnth: TDBCheckBox;
    DbeBaseMnth: TDBEdit;
    PopupMenu: TPopupMenu;
    NShowPrevPos: TMenuItem;
    NShowOldPos: TMenuItem;
    dbeTabNr: TDBEdit;
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
    procedure sBtnDolgnClick(Sender: TObject);
    procedure dbeDolgnKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeShSOKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeDtPriemExit(Sender: TObject);
    procedure dbeIDExit(Sender: TObject);
    procedure sBtnSovmClick(Sender: TObject);
    procedure dbeShSovmKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeNmShNlgKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure qryPrmUvBeforePost(DataSet: TDataSet);
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
    procedure sBtnKdBnkClick(Sender: TObject);
    procedure qryLSBeforePost(DataSet: TDataSet);
    procedure qryLSAfterPost(DataSet: TDataSet);
    procedure EditExit(Sender: TObject);
    procedure edShBnkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sBtnInvDocsClick(Sender: TObject);
    procedure sBtnLgtClick(Sender: TObject);
    procedure sBtnKdTemuClick(Sender: TObject);
    procedure dbeKdTemuExit(Sender: TObject);
    procedure qryPereCalcFields(DataSet: TDataSet);
    procedure sBtnGetOldOKClick(Sender: TObject);
    procedure dbeOldD_zkppExit(Sender: TObject);
    procedure sBtnGetNewOKClick(Sender: TObject);
    procedure dbePrcWrkTimeExit(Sender: TObject);
    procedure DbChBoxBaseMnthClick(Sender: TObject);
    procedure qryPereBMChange(Sender: TField);
    procedure PopupMenuPopup(Sender: TObject);
    procedure NShowPrevPosClick(Sender: TObject);
    procedure NShowOldPosClick(Sender: TObject);
  private
    n_KdObj, n_KdKatP : integer;
    b_CallFromSps : boolean;
    n_NewTabN, n_EdtTabN : integer;
    bUpiWasEditing : boolean;
    bCallInvDocs, bCallLgotu : boolean; // вызывались ли ShwInvDocs и ShwLgotu
    b_GoToTabN : boolean; // В случае попытки ввода уже имеющегося сотрудника
    // закрыть эту форму и вызвать UPI с найденным TabN, поместив его в nNewTabN
    procedure OpenQryPrmUv;
    procedure OpenQryPere;
    procedure OpenQryLS;
    function CheckVvod : boolean;
    function NewTabN : integer;
    function MyValidKatPers(var cText : ShortString;
                                            var nKdKatP : SmallInt) : boolean;
    function MyValidKdSpZ(var cText : ShortString; var nKdSpZ : SmallInt;
                                             var bHsChld : boolean) : boolean;
    procedure Add_In_Cur_Sps(dDtPrc : TDateTime; nTabN : integer;
                       nKdSps, nKdObj, nKdKatP : SmallInt; cNotes : ShortString);

    procedure ShowPrevPosition;
    procedure HidePrevPosition;

    procedure ShowOldPosName;
    procedure HideOldPosName;
  public
    class function AddUpi(qry_Upi: TQuery; nKdObj: integer;
      var nKdKatP, nNewTabN: integer;
      var bAddInSps: boolean; bCallFromSps: boolean;
      var cRetCode, cREtZ_Kpp: ShortString;
      var bGoToTabN: boolean): boolean;

    function GetNameD(cCode, cZ_Kpp: ShortString;
             var cNameD, cNameFull: ShortString) : boolean;
  end;


const SECTION = 'z_eUpiA';

var
  FormUpiAdd: TFormUpiAdd;
  bEditMode : boolean;

implementation

uses A_Const, A_DM, Z_DM, z_Main, z_TUpi, A_Lib, Z_TObj,
     Z_GtPdN, Z_GtOpl, Z_GtPers, z_GtSovm, A_SBU, A_ShwErr,
     Z_EPere, Z_KdDlgn, z_ShwBnk, z_Lgotu, z_InvDoc, z_ShwTem,
     z_dk2010, DModUsrSetts;
{$R *.DFM}

//------------------------------------------------------------------------------
class function TFormUpiAdd.AddUpi(
  qry_Upi: TQuery; nKdObj: integer;
  var nKdKatP, nNewTabN: integer;
  var bAddInSps: boolean; bCallFromSps: boolean;
  var cRetCode, cRetZ_Kpp: ShortString;
  var bGoToTabN: boolean): boolean;
begin
  Result := false;
  bEditMode := false;
  FormUpiAdd := TFormUpiAdd.Create(Application);
  with FormUpiAdd do begin
    b_GoToTabN := false;
    b_CallFromSps := bCallFromSps;
    bCallInvDocs := false;
    bCallLgotu   := false;
    n_KdObj  := nKdObj;
    n_KdKatP := nKdKatP;
    n_NewTabN := 0;
    n_EdtTabN := 0;
    bUpiWasEditing := false;
    dsrcUpi.DataSet := qry_Upi;
    if bCallFromSps then begin // вызов из списка
      // добавлять в список месяца надо однозначно
      dbeKdObj.Color := clBtnFace;
      dbeKdObj.Enabled := false;
      sBtnObj.Enabled := false;
      ChBoxAddInCurSps.Checked := true;
      ChBoxAddInCurSps.Visible := false;
    end;
    OpenQryPrmUv;
    OpenQryPere;
    OpenQryLS;
    ActiveControl := dbeID;
    if ShowModal = mrOk then begin
      nNewTabN := n_NewTabN;
      nKdKatP := n_KdKatP;
      bGoToTabN := b_GoToTabN;
//      cRetCode  := dbeCode.Field.AsString;
//      cRetZ_Kpp := dbeZ_kpp.Field.AsString;
      Result := true; end
    else begin
      if bCallInvDocs then with qryTmp do begin
        // Если вызывалась z_InvDocs, то, возможно, в нее были введены
        // записи и они (она) остались с ТабН = -1. Удалить их
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Delete from z_InvDocs where TabN = -1');
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      if bCallLgotu then with qryTmp do begin
        // Если вызывалась z_Lgotu, то, возможно, в нее были введены
        // записи и они (она) остались с ТабН = -1. Удалить их
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Delete from z_Lgotu where TabN = -1');
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
    end;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormUpiAdd.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 500);
    ChBoxAddInCurSps.Checked := ReadBool(SECTION, 'bAddInCurMes', true);
    Free;
  end;

  Width := Panel.Width;

  if not DmUsrSetts.ShowPrevPosition then
    HidePrevPosition;

  if not DmUsrSetts.ShowOldPosName then
    HideOldPosName;

  edShBnk.Text := '';
  edKatP.Text := '';
  
  dbeTabNr.DataSource := dsrcUpi;

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
function TFormUpiAdd.NewTabN : integer;
begin
  Result := DmMain.NewUpiTabN;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.OpenQryPrmUv;
begin
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUpi;
    SQL.Add('Select * from Z_PrmUv where TABN = :TabN');
    Open;
    Append;
    qryPrmUvKdSps.AsInteger := 0;         // только на предприятие
    qryPrmUvDt_Priem.AsDateTime := Date;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.OpenQryPere;
begin
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUpi;
    SQL.Add('Select * from Z_PERE where TABN = :TabN');
    Open;
    Append;
    if n_KdObj > 0 then
      FieldByName('KdObj').AsInteger := n_KdObj;
    FieldByName('KdSps').AsInteger   := gl_nAppKdSpsUsr;
    FieldByName('SO').AsInteger      := 1;
    FieldByName('PdNlg').AsInteger   := 1;
    FieldByName('OklTrf').AsFloat    := 0;
    FieldByName('ProcLg').AsFloat    := 0;
    FieldByName('SP_AV').AsString    := '%';
    // FieldByName('KdSPZ').AsInteger   := 0;
    FieldByName('KdSpZ').AsInteger := DmMain.GetPdrKdSpZ(n_KdObj);
    edSpz.Text := FieldByName('SpZ').AsString;
    // FieldByName('KolMin').AsInteger  := 1; поле потеряло смысл - есть ProcLG
    FieldByName('Pr_Pens').AsInteger := 0;
    FieldByName('Sovm').AsInteger    := 0;
    FieldByName('Inv').AsInteger     := 0;
    FieldByName('Prfs').AsInteger    := 0;
    FieldByName('BM').AsString := ' ';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.OpenQryLS;
begin
  with qryLS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUpi;
    SQL.Add('Select * from Z_BankiLS where TABN = :TabN');
    Open;
    Append;
  end;
end;
//------------------------------------------------------------------------------
function TFormUpiAdd.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dsrcUpi.DataSet.FieldByName('Fam').AsString = '') then
    mListErr.Add('Нет фамилии');
  if (dsrcUpi.DataSet.FieldByName('Ima').AsString = '') then
    mListErr.Add('Нет имени');
  if (dsrcUpi.DataSet.FieldByName('Otch').AsString = '') then
    mListErr.Add('Нет отчества');
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
  if not bEditMode and (dsrcUpi.DataSet.FieldByName('Pol').AsString = '') then
    mListErr.Add('Не введен пол');
  if qryPere.FieldByName('Inv').IsNull or
                 (qryPere.FieldByName('Inv').AsString = '') then
    mListErr.Add('Не проставлен признак инвалидности')
  else if (qryPere.FieldByName('Inv').AsInteger > 3) or
                 (qryPere.FieldByName('Inv').AsInteger < 0) then
    mListErr.Add('Призн.инвалидн. допускается от 0 до 3');
  if not qryLSKdBnk.IsNull and
            (qryLSLicSch.IsNull or (qryLSLicSch.AsString = '')) then
    mListErr.Add('При выбранном банке должен быть счет');
//  if not bEditMode and
//                   (qryUpi.FieldByName('DtPriem').AsString = '') then
//    mListErr.Add('Нет даты приема');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var dDtPrm : TDateTime; nKdObj, nKdKatP : SmallInt;
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeFam.SetFocus; end
    else begin
      n_NewTabN := NewTabN;
      dsrcUpi.DataSet.FieldByName('TabN').AsInteger := n_NewTabN;
      dDtPrm := qryPrmUvDt_Priem.AsDateTime;
      nKdObj := qryPereKdObj.AsInteger;
      nKdKatP := qryPereKdKatP.AsInteger;

      qryPrmUvNOTES.AsString := qryPereNOTES.AsString;

      dsrcUpi.DataSet.Post;

      // ниже на UpdatesPending проверяю, потому что при qryUpi.Post,
      // оказывается, делается автоматом Post и у qryPrmUv и у qryPere
      // (видимо через dsrcUpi)

      if qryPrmUv.UpdatesPending then
        qryPrmUv.Post;
      if qryPere.UpdatesPending then
        qryPere.Post;
      if qryLS.UpdatesPending then  // dsrcUpi
        qryLS.Post;

      if bCallInvDocs then with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Update z_InvDocs Set TabN = :n_NewTabN where TabN = -1');
        ParamByName('n_NewTabN').AsInteger := n_NewTabN;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      if bCallLgotu then with qryTmp do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Update z_Lgotu Set TabN = :n_NewTabN where TabN = -1');
        ParamByName('n_NewTabN').AsInteger := n_NewTabN;
        ExecSQL;
        SQL.Clear;
        DataBaseName := '';
      end;
      if not b_CallFromSps and ChBoxAddInCurSps.Checked then begin
        // проверить годится ли дата приема для добавления
        // в список текущего месяца. Если годится - добавить.
        if dDtPrm < MyLastDom(dCtrlDate) then
          Add_In_Cur_Sps(dCtrlDate, n_NewTabN, gl_nAppKdSpsUsr, nKdObj, nKdKatP,
                                                         'Ввод нового сотр.');
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.Add_In_Cur_Sps(dDtPrc : TDateTime; nTabN : integer;
                      nKdSps, nKdObj, nKdKatP : SmallInt; cNotes : ShortString);
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
//------------------------------------------------------------------------------
procedure TFormUpiAdd.FormClose(Sender: TObject; var Action: TCloseAction);
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
procedure TFormUpiAdd.qryPrmUvBeforePost(DataSet: TDataSet);
begin
  qryPrmUvTabN.AsInteger := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.qryPereBeforePost(DataSet: TDataSet);
begin
  if qryPere.State = dsInsert then begin
    qryPereTabN.AsInteger := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
    qryPereDt_Beg.AsString := qryPrmUvDt_Priem.AsString;
    qryPereDt_Prikaza.AsString := qryPrmUvDt_Prikaza.AsString;
    qryPereNr_Prikaza.AsString := qryPrmUvNr_Prikaza.AsString;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.qryLSBeforePost(DataSet: TDataSet);
begin
  if qryLS.State = dsInsert then begin
    qryLSTabN.AsInteger := dsrcUpi.DataSet.FieldByName('TabN').AsInteger;
    qryLSDtBeg.AsString := qryPrmUvDt_Priem.AsString;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.qryLSAfterPost(DataSet: TDataSet);
begin
  if qryLS.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryLS]);
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.qryPereAfterPost(DataSet: TDataSet);
begin
  if qryPere.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryPere]);
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.qryPrmUvAfterPost(DataSet: TDataSet);
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
procedure TFormUpiAdd.sBtnVbrSOClick(Sender: TObject);
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
procedure TFormUpiAdd.sBtnVbrShPdNClick(Sender: TObject);
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
procedure TFormUpiAdd.sBtnVbrSPZClick(Sender: TObject);
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
procedure TFormUpiAdd.DateFieldSetText(Sender: TField;
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
procedure TFormUpiAdd.sBtnKatPClick(Sender: TObject);
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
procedure TFormUpiAdd.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbePrcWrkTimeExit(Sender: TObject);
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
procedure TFormUpiAdd.dbeKdObjEnter(Sender: TObject);
begin
  if dbeKdObj.Enabled then
    (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbeKdObjExit(Sender: TObject);
begin
  if dbeKdObj.Enabled then
    (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbeDtUvlnExit(Sender: TObject);
begin
  if not myEmptyDate(dbeDtUvln.Text) then begin
    qryPrmUvDt_PrUvoln.AsString := qryPrmUvDt_Prikaza.AsString;
    qryPrmUvNr_PrUvoln.AsString := qryPrmUvNr_Prikaza.AsString;
  end;  // предполагается, что если есть датаУвольн., то тем же приказом
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbeIDExit(Sender: TObject);
var cMsg, cID : string;  nResult : word;
begin
  cID := Trim(dbeID.Text);
  if cID <> '' then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from Z_UPI where (ID = :cID)');
      ParamByName('cID').AsString := cID;
      Open;
      if RecordCount > 0 then begin
        cMsg := 'В таблице сотрудников есть ';
        if RecordCount = 1 then
          cMsg := cMsg + 'запись '
        else
          cMsg := cMsg + 'записи ';
        cMsg := cMsg + 'с ТИН = ' + cID + ':' + #13#10;
        while not Eof do begin
          cMsg := cMsg + ' ТабНр = ' + FieldByName('TabN').AsString + ',   ' +
                                       FieldByName('Fam').AsString + ' ' +
                                       FieldByName('Ima').AsString + ' ' +
                                       FieldByName('Otch').AsString + #13#10;
          Next;
        end;
        cMsg := cMsg + '                                   Продолжать ввод ?:';
        nResult := MessageDlg(cMsg, mtWarning, [mbYes, mbNo], 0);
        if nResult <> mrYes then begin
          Close;
          SQL.Clear;
          DataBaseName := '';
          bBtnCancel.Click;
          (Sender as TDBEdit).Color := clWindow; end
        else begin
          dbeID.Text := cID;
          (Sender as TDBEdit).Color := clWindow;
        end; end
      else
        (Sender as TDBEdit).Color := clWindow;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end; end
  else
    (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbeDtPriemExit(Sender: TObject);
begin
  qryPrmUvDt_Prikaza.AsString := qryPrmUvDt_Priem.AsString;
  qryPrmUvNr_Prikaza.AsString := '-К';
  qryPrmUvNr_PrUvoln.AsString := '-К';
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.DBCheckBoxEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.DBCheckBoxExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.DBComboBoxPolEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.DBComboBoxPolExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.sBtnObjClick(Sender: TObject);
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
procedure TFormUpiAdd.dbeDolgnKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if sBtnDolgn.Enabled and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnDolgn.Click;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbeObjKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if sBtnObj.Enabled and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObj.Click;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.edKatPKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKatP.Click;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbeShSovmKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSovm.Click;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.edSPZKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVbrSpz.Click;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbeNmShNlgKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSovm.Click;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.dbeShSOKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if sBtnVbrSO.Enabled and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVbrSO.Click;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.sBtnDolgnClick(Sender: TObject);
var nKdDolgn : integer; var cShDolgn, cNmDolgn : string;
begin
  nKdDolgn := 0;
  cShDolgn := '';
  cNmDolgn := dbeDolgn.Field.AsString;
  if GetDolgn(nKdDolgn, cShDolgn, cNmDolgn) {z_KdDlgn} then begin
    dbeDolgn.Field.AsString := cNmDolgn;
    dbeObj.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.sBtnSovmClick(Sender: TObject);
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
procedure TFormUpiAdd.qryPrmUvDT_PRIEMSetText(Sender: TField;
                                                            const Text: String);
var cText : ShortString;
begin
  cText := Text;
  if MyEmptyDate(cText) then
      Raise Exception.Create('Дата приема нужна обязательно')
  else begin
    dsrcUpi.DataSet.FieldByName('LastDtPrm').AsString := cText;
    Sender.AsString := cText;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.qryPrmUvDT_UVOLNSetText(Sender: TField;
                                                            const Text: String);
var cText : ShortString;
begin
  cText := Text;
  if qryPere.Active then
    dsrcUpi.DataSet.FieldByName('LastDtUvl').AsString := cText;
  Sender.AsString := cText;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.qryPereKDOBJValidate(Sender: TField);
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
procedure TFormUpiAdd.EditEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.EditExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
function TFormUpiAdd.MyValidKatPers(var cText : ShortString;
                                     var nKdKatP : SmallInt) : boolean;
begin
  Result := false;
  nKdKatP := DmMain.ShKatP2KdKatP(cText);
  if nKdKatP > 0 then begin
    Result := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.edKatPExit(Sender: TObject);
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
function TFormUpiAdd.MyValidKdSpZ(var cText : ShortString;
                        var nKdSpZ : SmallInt; var bHsChld : boolean) : boolean;
begin
  Result := DmMain.SchBU2KdSBU(cText, nKdSpZ, bHsChld);
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.edSpZExit(Sender: TObject);
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
procedure TFormUpiAdd.sBtnKdBnkClick(Sender: TObject);
var nKdBnk : SmallInt; cShBnk, cNmBnk : ShortString;
begin
  nKdBnk := qryLSKdBnk.AsInteger;
  if GetZplBank(nKdBnk, cShBnk, cNmBnk) {Z_ShwBnk} then begin
    qryLSKdBnk.AsInteger := nKdBnk;
    edShBnk.Text := cShBnk;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.edShBnkKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdBnk.Click;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.sBtnInvDocsClick(Sender: TObject);
var n_TabN : integer; c_FamIO : ShortString;
begin
  n_TabN := -1; // poka
  c_FamIO := MyFamIO(dbeFam.Field.AsString, dbeIma.Field.AsString,
                                         dbeOtch.Field.AsString);
  ShwInvDocs(n_TabN, c_FamIO);       {z_InvDoc}
  bCallInvDocs := true;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.sBtnLgtClick(Sender: TObject);
var nCntChld10_11 : SmallInt;
    nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11 : double;
    n_TabN : integer; c_FamIO, cOznPilg : ShortString;
begin
  n_TabN := -1; // poka
  c_FamIO := MyFamIO(dbeFam.Field.AsString, dbeIma.Field.AsString,
                                         dbeOtch.Field.AsString);
  ShwLgotu(n_TabN, c_FamIO);  {z_Lgotu}
  bCallLgotu := true;
  DmMain.GetSmPrcLgt(n_TabN, dDtProc, nCntChld10_11,
                     nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11, cOznPilg);
  dbeProcLg.Field.AsFloat := nSmPrcLgtSotr + nSmPrcLgtChld10 + nSmPrcLgtChld11;
end;
//------------------------------------------------------------------------------
procedure TFormUpiAdd.sBtnKdTemuClick(Sender: TObject);
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
procedure TFormUpiAdd.dbeKdTemuExit(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
    {nTabN : integer;} dOnDate : TDateTime;
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
  else begin  // в dbeKdSpZ и в dbeSpZ "подразделенческие" значения счета
    dOnDate := dDtProc;                                    //по умолчанию
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
procedure TFormUpiAdd.qryPereCalcFields(DataSet: TDataSet);
var cCode, cZ_Kpp, cNameD, cNameFull : ShortString;
var nOldKdOK, nNewKDOk: SmallInt;
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
procedure TFormUpiAdd.sBtnGetOldOKClick(Sender: TObject);
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
function TFormUpiAdd.GetNameD(cCode, cZ_Kpp: ShortString;
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
procedure TFormUpiAdd.dbeOldD_zkppExit(Sender: TObject);
var cCode,cZ_Kpp,cNameD,cNameFull   : ShortString;
begin
  ;
end;

//------------------------------------------------------------------------------
procedure TFormUpiAdd.sBtnGetNewOKClick(Sender: TObject);
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
procedure TFormUpiAdd.DbChBoxBaseMnthClick(Sender: TObject);
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
procedure TFormUpiAdd.qryPereBMChange(Sender: TField);
begin
  with Sender.DataSet do begin
    if FieldByName('BM').AsString <> 'Y' then
      FieldByName('DtBM').AsString := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TFormUpiAdd.PopupMenuPopup(Sender: TObject);
begin
  NShowPrevPos.Checked := DmUsrSetts.ShowPrevPosition;
  NShowOldPos.Checked := DmUsrSetts.ShowOldPosName;;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormUpiAdd.ShowOldPosName;
begin
  ClientHeight := ClientHeight + PanelOldPos.Height;
  PanelOldPos.Visible := true;
  PanelOldPos.Top := PanelHead.Top + PanelHead.Height;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormUpiAdd.HideOldPosName;
begin
  PanelOldPos.Visible := false;
  ClientHeight := ClientHeight - PanelOldPos.Height;
end;

//------------------------------------------------------------------------------
procedure TFormUpiAdd.ShowPrevPosition;
begin
  ClientHeight := ClientHeight + PanelPrevPos.Height;
  PanelPrevPos.Visible := true;
  PanelPrevPos.Top := PanelOldPos.Top + PanelOldPos.Height;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormUpiAdd.HidePrevPosition;
begin
  PanelPrevPos.Visible := false;
  ClientHeight := ClientHeight - PanelPrevPos.Height;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormUpiAdd.NShowPrevPosClick(Sender: TObject);
begin
  NShowPrevPos.Checked := not NShowPrevPos.Checked;
  DmUsrSetts.ShowPrevPosition := NShowPrevPos.Checked;

  if DmUsrSetts.ShowPrevPosition then
    ShowPrevPosition
  else
    HidePrevPosition;
end;

procedure TFormUpiAdd.NShowOldPosClick(Sender: TObject);
begin
  NShowOldPos.Checked := not NShowOldPos.Checked;
  DmUsrSetts.ShowOldPosName := NShowOldPos.Checked;

  if DmUsrSetts.ShowOldPosName then
    ShowOldPosName
  else
    HideOldPosName;
end;

end.
