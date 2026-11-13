unit Z_EUpi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DBCGrids, ComCtrls,
  ExtCtrls, Db, DBTables, Grids, DBGrids, IniFiles, Menus;

type
  TFormEUpi = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    PageControl1: TPageControl;
    tsAdd: TTabSheet;
    tsEdt: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelDtPriem: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    dbeOtch: TDBEdit;
    dbeIma: TDBEdit;
    dbeFam: TDBEdit;
    dbeDtPriem: TDBEdit;
    dbeDtUvoln: TDBEdit;
    dbeID: TDBEdit;
    Label54: TLabel;
    Label58: TLabel;
    Label60: TLabel;
    sBtnVbrSPZ: TSpeedButton;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    sBtnVbrShPdN: TSpeedButton;
    sBtnVbrSO: TSpeedButton;
    LabelOklTrf1: TLabel;
    dbeDtPrikaza: TDBEdit;
    dbeNrPrikaza: TDBEdit;
    dbeSPZ: TDBEdit;
    dbeOklad: TDBEdit;
    dbeAvans: TDBEdit;
    dbeShSO: TDBEdit;
    dbeNmShNlg: TDBEdit;
    dbeProcLg: TDBEdit;
    Label47: TLabel;
    dbeDolgn: TDBEdit;
    Label13: TLabel;
    dbeTabNr: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbeOtch2: TDBEdit;
    dbeIma2: TDBEdit;
    dbeFam2: TDBEdit;
    dbeId2: TDBEdit;
    Label11: TLabel;
    dbeTabNr2: TDBEdit;
    qryPere: TQuery;
    dbgrPere: TDBGrid;
    dsrcUpi: TDataSource;
    updUpi: TUpdateSQL;
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
    DBCheckBoxPens: TDBCheckBox;
    DBCheckBoxInv: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    qryPereNmSO: TStringField;
    qryPereNmShPdn: TStringField;
    Label12: TLabel;
    popPere: TPopupMenu;
    popPereAdd: TMenuItem;
    popPereEdt: TMenuItem;
    popPereDel: TMenuItem;
    popPereHead: TMenuItem;
    qryTmp: TQuery;
    dsrcPere: TDataSource;
    updPere: TUpdateSQL;
    qryPereNmKatP: TStringField;
    dbeKatP: TDBEdit;
    sBtnKatP: TSpeedButton;
    Label15: TLabel;
    qryPereShObj: TStringField;
    LabelObj: TLabel;
    dbeObj: TDBEdit;
    sBtnObj: TSpeedButton;
    ChBoxAddInCurSps: TCheckBox;
    dbeDOB: TDBEdit;
    Label18: TLabel;
    DBComboBoxPol: TDBComboBox;
    DBCheckBox1: TDBCheckBox;
    qryPerePRCWRKTIME: TFloatField;
    qryPereKDSPZ: TSmallintField;
    qryPerePRFS: TSmallintField;
    qryPereNOTES: TStringField;
    qryPereINV: TSmallintField;
    qryPereRANG: TSmallintField;
    qryPereRAZR: TSmallintField;
    qryPereOLDKDOBJ: TSmallintField;
    qryPereSpZ: TStringField;
    sBtnDolgn: TSpeedButton;
    Label16: TLabel;
    dbeRang: TDBEdit;
    Label17: TLabel;
    dbeRazr: TDBEdit;
    sBtnClearSpZ: TSpeedButton;
    qryUpi: TQuery;
    qryUpiNR: TIntegerField;
    qryUpiTABN: TIntegerField;
    qryUpiDOB: TDateTimeField;
    qryUpiPOL: TStringField;
    qryUpiID: TStringField;
    qryUpiFAM: TStringField;
    qryUpiIMA: TStringField;
    qryUpiOTCH: TStringField;
    qryPerePROCLG: TFloatField;
    qryPereKDSPS: TSmallintField;
    qryPereKDDOLGN: TSmallintField;
    qryPerePRDEKR: TStringField;
    qryPereCMBOKL: TStringField;
    qryPereSPEC_NR: TIntegerField;
    qryPereSmCmbOkl: TFloatField;
    qryPereShSovm: TStringField;
    Label4: TLabel;
    dbeShSovm: TDBEdit;
    sBtnSovm: TSpeedButton;
    sBtnCheckFamExists: TSpeedButton;
    qryUpiLASTDTPRM: TDateTimeField;
    qryUpiLASTDTUVL: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure Label13DblClick(Sender: TObject);
    procedure Label11DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryUpiAfterPost(DataSet: TDataSet);
    procedure qryPereAfterPost(DataSet: TDataSet);
    procedure sBtnVbrSOClick(Sender: TObject);
    procedure sBtnVbrShPdNClick(Sender: TObject);
    procedure qryPereBeforePost(DataSet: TDataSet);
    procedure sBtnVbrSPZClick(Sender: TObject);
    procedure qryPereNewRecord(DataSet: TDataSet);
    procedure popPereAddClick(Sender: TObject);
    procedure popPereEdtClick(Sender: TObject);
    procedure popPereDelClick(Sender: TObject);
    procedure dbgrPereDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure dbgrPereEditButtonClick(Sender: TObject);
    procedure dbgrPereKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure qryPereBeforeInsert(DataSet: TDataSet);
    procedure sBtnKatPClick(Sender: TObject);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure DBCheckBoxEnter(Sender: TObject);
    procedure DBCheckBoxExit(Sender: TObject);
    procedure qryUpiBeforePost(DataSet: TDataSet);
    procedure qryPereAfterDelete(DataSet: TDataSet);
    procedure sBtnObjClick(Sender: TObject);
    procedure dbeObjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbeKatPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBComboBoxPolEnter(Sender: TObject);
    procedure DBComboBoxPolExit(Sender: TObject);
    procedure dbeSPZKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sBtnDolgnClick(Sender: TObject);
    procedure dbeDolgnKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeShSOKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure sBtnClearSpZClick(Sender: TObject);
    procedure dbeDtPriemExit(Sender: TObject);
    procedure dbeIDExit(Sender: TObject);
    procedure sBtnSovmClick(Sender: TObject);
    procedure dbeShSovmKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure dbeNmShNlgKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure sBtnCheckFamExistsClick(Sender: TObject);
    procedure qryUpiLASTDTPRMSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    bNewVvod : boolean;   // добавление новой карточки (не редактирование)
    nSvKdObj, nSvKdKatP, nSvSO, nSvKdSPZ, nSvInv,
    nSvPrPens, nSvSovm, nSvPdNlg, nSvKolMin : integer;
    nSvOklTrf, nSvAvans, nSvProcLg : double;
    cSvSp_Av, cSvDolgnost : string;
    // все вышележащие *Sv* для новой записи в Pere
    n_KdObj, n_KdKatP : integer;
    b_CallFromSps : boolean;
    n_NewTabN, n_EdtTabN : integer;
    bUpiWasEditing : boolean;
    b_GoToTabN : boolean; // В случае попытки ввода уже имеющегося сотрудника
    // закрыть эту форму и вызвать UPI с найденным TabN, поместив его в nNewTabN
    procedure OpenQryUpiForAdd;
    procedure OpenQryPereForAdd;
    procedure OpenQryUpiForEdt(nTabN : integer);
    procedure OpenQryPereForEdt(nTabN : integer);
    function CheckVvod : boolean;
    function NewTabN : integer;
    procedure AddInPrmUv(nTabN : integer; dDtPriem, dDtUvoln : TDateTime;
                                      cNrPrikaza, cDtPrikaza, cNotes : string);
  public
    { Public declarations }
  end;

function AddInUpi(nKdObj : integer;
                     var nKdKatP, nNewTabN : integer;
                     var bAddInSps : boolean; bCallFromSps : boolean;
                     var bGoToTabN : boolean) : boolean;
function EdtInUpi(nTabN : integer) : boolean;

const SECTION = 'Z_EUpi';

var
  FormEUpi: TFormEUpi;
  bEditMode : boolean;

implementation

uses A_Const, A_DM, Z_DM, z_Main, A_Lib, Z_TObj, z_ShwTmp,
     Z_GtPdN, Z_GtOpl, Z_GtPers, z_GtSovm, A_SBU, A_ShwErr, Z_EPere, z_KdDlgn;

{$R *.DFM}

//------------------------------------------------------------------------------
function AddInUpi(nKdObj : integer;
                     var nKdKatP, nNewTabN : integer;
                     var bAddInSps : boolean; bCallFromSps : boolean;
                     var bGoToTabN : boolean) : boolean;
begin
  Result := false;
  bEditMode := false;
  FormEUpi := TFormEUpi.Create(Application);
  with FormEUpi do begin
    b_GoToTabN := false;
    bNewVvod := true;
    // sBtnCheckFamExists.Visible := true;
    b_CallFromSps := bCallFromSps;
    n_KdObj  := nKdObj;
    n_KdKatP := nKdKatP;
    Caption := 'Ввод нового сотрудника';
    n_NewTabN := 0;
    n_EdtTabN := 0;
    bUpiWasEditing := false;
    if bCallFromSps then begin
      // добавлять в список месяца надо однозначно
      ChBoxAddInCurSps.Checked := true;
      ChBoxAddInCurSps.Visible := false;
      sBtnObj.Enabled := false;
    end;
    OpenQryUpiForAdd;
    OpenQryPereForAdd;
    PageControl1.ActivePage := tsAdd;
    ActiveControl := dbeDtPriem;
    if ShowModal = mrOk then begin
      nNewTabN := n_NewTabN;
      nKdKatP := n_KdKatP;
      bGoToTabN := b_GoToTabN;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.AddInPrmUv(nTabN : integer; dDtPriem, dDtUvoln : TDateTime;
                                      cNrPrikaza, cDtPrikaza, cNotes : string);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    // Вводим две записи: на предпр. с KdSps = 0 и в поразд с nKdSps
    SQL.Add('Insert into Z_PrmUv (KdSps, TabN, Dt_Priem, Nr_Prikaza, ');
    if cDtPrikaza <> '' then
      SQL.Add(' Dt_Prikaza, ');
    if dDtUvoln <> 0 then
      SQL.Add(' Dt_Uvoln, ');
    if (dDtUvoln <> 0) and (cDtPrikaza <> '') then
      SQL.Add(' Nr_PrUvoln, Dt_PrUvoln, ');
    SQL.Add(' Notes) values (:nKdSps, :nTabN, :dDtPriem, :cNrPrikaza, ');
    if cDtPrikaza <> '' then
      SQL.Add(' :dDtPrikaza, ');
    if dDtUvoln <> 0 then
      SQL.Add(' :dDtUvoln, ');
    if (dDtUvoln <> 0) and (cDtPrikaza <> '') then
      SQL.Add(' :cNrPrUvoln, :dDtPrUvoln, ');
    SQL.Add(' :cNotes)');
    ParamByName('nTabN').AsInteger     := nTabN;
    ParamByName('dDtPriem').AsDateTime := dDtPriem;
    ParamByName('cNrPrikaza').AsString := cNrPrikaza;
    if cDtPrikaza <> '' then
      ParamByName('dDtPrikaza').AsDateTime := StrToDate(cDtPrikaza);
    if dDtUvoln <> 0 then
      ParamByName('dDtUvoln').AsDateTime := dDtUvoln;
    if (dDtUvoln <> 0) and (cDtPrikaza <> '') then begin
      ParamByName('cNrPrUvoln').AsString := cNrPrikaza;   // т.е. тем же, что и
      ParamByName('dDtPrUvoln').AsDateTime :=  StrToDate(cDtPrikaza); // принят
    end;
    ParamByName('cNotes').AsString := cNotes;
    // 1-я запись
    ParamByName('nKdSps').AsInteger := 0;
    ExecSQL;
    // 2-я запись
(*
    ParamByName('nTabN').AsInteger     := nTabN;
    ParamByName('dDtPriem').AsDateTime := dDtPriem;
    ParamByName('cNrPrikaza').AsString := cNrPrikaza;
    if cDtPrikaza <> '' then
      ParamByName('dDtPrikaza').AsDateTime := StrToDate(cDtPrikaza);
    ParamByName('cNotes').AsString := cNotes;
    ParamByName('nKdSps').AsInteger := nKdSps;
    ExecSQL;
*)
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function EdtInUpi(nTabN : integer) : boolean;
begin
  Result := false;
  bEditMode := true;
  FormEUpi := TFormEUpi.Create(Application);
  with FormEUpi do begin
    bNewVvod := false;
    // sBtnCheckFamExists.Visible := false;
    Caption := 'Редактирование лицевого счета сотрудника';
    n_NewTabN := 0;
    n_EdtTabN := nTabN;
    ChBoxAddInCurSps.Visible := false;
    OpenQryUpiForEdt(nTabN);
    OpenQryPereForEdt(nTabN);
    PageControl1.ActivePage := tsEdt;
    ActiveControl := dbeFam2;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEUpi.NewTabN : integer;
begin
  Result := DmMain.NewUpiTabN;
(*
  Result := 10001;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select Max(TabN) as MaxTabN from Z_UPI');
    Open;
    if (RecordCount <> 0) and
               (FieldByName('MaxTabN').AsInteger <> 0) then
      Result := FieldByName('MaxTabN').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.OpenQryUpiForAdd;
begin
  with qryUpi do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_UPI where TABN = :nTabN');
    ParamByName('nTabN').AsInteger := -1111;  // такого заведомо нет
    Open;
    Append;
    FieldByName('LastDtPrm').AsDateTime := SysUtils.Date;
    FieldByName('Pol').AsString := 'М';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.OpenQryPereForAdd;
begin
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    DataSource := dsrcUpi;
    SQL.Add('Select * from Z_PERE where TABN = :TabN');
    Open;
    Append;
    FieldByName('KdObj').AsInteger   := n_KdObj;
    FieldByName('SO').AsInteger      := 1;
    FieldByName('PdNlg').AsInteger   := 1;
    FieldByName('OklTrf').AsFloat    := 0;
    FieldByName('SP_AV').AsString    := '%';
//    FieldByName('KdSPZ').AsInteger   := 0;
    FieldByName('KdSpZ').AsInteger := DmMain.GetPdrKdSpZ(n_KdObj);
    FieldByName('KolMin').AsInteger  := 1;
    FieldByName('Pr_Pens').AsInteger := 0;
    FieldByName('Sovm').AsInteger    := 0;
    FieldByName('Inv').AsInteger     := 0;
    FieldByName('Prfs').AsInteger    := 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.OpenQryUpiForEdt(nTabN : integer);
begin
  with qryUpi do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_UPI where TABN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    // Edit;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.OpenQryPereForEdt(nTabN : integer);
begin
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    DataSource := dsrcUpi;
    SQL.Add('Select * from Z_PERE where TABN = :TabN order by Dt_Beg');
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.FormCreate(Sender: TObject);
begin
  PageControl1.Height := 235;
  tsAdd.TabVisible := false;
  tsEdt.TabVisible := false;
  Height := 293;
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 100);
    Free;
  end;
  if FileExists(cDirVids + 'z_EUpi.vid') then
    dbgrPere.Columns.LoadFromFile(cDirVids + 'z_EUpi.vid');
end;
//------------------------------------------------------------------------------
function TFormEUpi.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (qryUpi.FieldByName('Fam').AsString = '') then
    mListErr.Add('Нет фамилии');
  if (qryUpi.FieldByName('Ima').AsString = '') then
    mListErr.Add('Нет имени');
  if (qryUpi.FieldByName('Otch').AsString = '') then
    mListErr.Add('Нет отчества');
  if (qryPere.FieldByName('ShKatP').AsString = '') then
    mListErr.Add('Не выбрана категория персонала');
  if (qryPere.FieldByName('ShSO').AsString = '') then
    mListErr.Add('Не выбрана система оплаты');
  if (qryPere.FieldByName('SpZ').AsString = '') then
    mListErr.Add('Нет связанного счета БухУчета');
  if (qryPere.FieldByName('ShPdNlg').AsString = '') then
    mListErr.Add('Не выбрана схема начисления налога с доходов');
  if not bEditMode and (qryUpi.FieldByName('Pol').AsString = '') then
    mListErr.Add('Не введен пол');
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
procedure TFormEUpi.FormCloseQuery(Sender: TObject;
                                              var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      if bEditMode then
        dbeFam2.SetFocus
      else
        dbeFam.SetFocus; end
    else begin
      if qryUpi.State = dsInsert then begin
        n_NewTabN := NewTabN;
        qryUpi.FieldByName('TabN').AsInteger := n_NewTabN;
      end;
      if qryUpi.State in [dsInsert, dsEdit] then
        qryUpi.Post;
      if qryPere.State in [dsInsert, dsEdit] then
        qryPere.Post;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPere.Columns.SaveToFile(cDirVids + 'z_EUpi.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.Label13DblClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsEdt;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.Label11DblClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsAdd;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.qryUpiBeforePost(DataSet: TDataSet);
begin
  // ничего не нужно !!!
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.qryUpiAfterPost(DataSet: TDataSet);
var bUpd : boolean;
begin
  bUpd := qryUpi.UpdatesPending;
  TRY
  if bUpd then begin
    qryPere.DataSource := nil;
    qryUpi.ApplyUpdates;
    qryUpi.Close;        // не то !!!! Она и так закроется
    qryUpi.Open;
    qryPere.DataSource := dsrcUpi;
  end;
  EXCEPT

  END;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.qryPereBeforePost(DataSet: TDataSet);
begin
  with qryPere do begin
//    if not bEditMode then   // считаем, что это первичная запись в PERE
//      FieldByName('Dt_Beg').AsString :=
//                         qryUpi.FieldByName('DtPriem').AsString;
    if State = dsInsert then
      FieldByName('TabN').AsInteger := qryUpi.FieldByName('TabN').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.qryPereAfterPost(DataSet: TDataSet);
var bUpd : boolean; nTabN : integer; dDtPriem, dDtUvoln : TDateTime;
    cNrPrikaza, cDtPrikaza, cNotes : string;
begin
  bUpd := qryPere.UpdatesPending;
  if bUpd then begin
    if not bEditMode then with qryPere do begin
      // Сделать запись в z_PrmUv
      nTabN      := FieldByName('TabN').AsInteger;
      dDtPriem   := FieldByName('Dt_Beg').AsDateTime;
      dDtUvoln   := qryUpi.FieldByName('LastDtUvl').AsDateTime;
      cNrPrikaza := FieldByName('Nr_Prikaza').AsString;
      cDtPrikaza := FieldByName('Dt_Prikaza').AsString;
      cNotes     := FieldByName('Notes').AsString;
      AddInPrmUv(nTabN, dDtPriem, dDtUvoln, cNrPrikaza, cDtPrikaza, cNotes);
    end;
    Form_Dm.DbZpl.ApplyUpdates([qryPere]);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.qryPereAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbZpl.ApplyUpdates([qryPere]);
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.sBtnVbrSOClick(Sender: TObject);
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
procedure TFormEUpi.sBtnVbrShPdNClick(Sender: TObject);
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
procedure TFormEUpi.sBtnVbrSPZClick(Sender: TObject);
var nKdSPZ : integer; cSchBU, cPSch, cNmSchBU : string;
begin
  dbeSPZ.SetFocus;
  nKdSPZ := qryPere.FieldByName('KdSPZ').AsInteger;
  if GetSbu(nKdSPZ, cSchBU, cPSch, cNmSchBU) {A_SBU} then begin
    qryPere.FieldByName('KdSPZ').AsInteger := nKdSPZ;
    dbeNmShNlg.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.sBtnClearSpZClick(Sender: TObject);
begin
  qryPere.FieldByName('KdSPZ').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.qryPereNewRecord(DataSet: TDataSet);
begin
  with qryPere do begin
    if bEditMode then
      FieldByName('TabN').AsInteger  := n_EdtTabN;
    FieldByName('Dt_Beg').AsDateTime := SysUtils.Date;
    FieldByName('KdSps').AsInteger   := nKdSps;
    FieldByName('KdObj').AsInteger   := nSvKdObj;
    FieldByName('KdKatP').AsInteger  := nSvKdKatP;
    FieldByName('SO').AsInteger      := nSvSO;
    FieldByName('Pr_Pens').AsInteger := nSvPrPens;
    FieldByName('Sovm').AsInteger    := nSvSovm;
    FieldByName('PdNlg').AsInteger   := nSvPdNlg;
    FieldByName('KolMin').AsInteger  := nSvKolMin;
    FieldByName('OklTrf').AsFloat    := nSvOklTrf;
    FieldByName('Avans').AsFloat     := nSvAvans;
    FieldByName('ProcLG').AsFloat    := nSvProcLg;
    FieldByName('Sp_Av').AsString    := cSvSp_Av;
    FieldByName('Dolgnost').AsString := cSvDolgnost;
    FieldByName('KdSPZ').AsInteger   := nSvKdSPZ;
    FieldByName('Inv').AsInteger     := nSvInv;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.popPereAddClick(Sender: TObject);
var cFamIO, cDolgn, cKdSPZ, cSO, cOklTrf, cPdNlg,
    cSovm, cPens, cInv, cKolMin : string; nTabN : integer;
begin
  nTabN := qryUpi.FieldByName('TabN').AsInteger;
  cFamIO := Trim(qryUpi.FieldByName('Fam').AsString + ' ' +
                       qryUpi.FieldByName('Ima').AsString + ' ' +
                             qryUpi.FieldByName('Otch').AsString);
  with qryPere do begin
    cDolgn  := FieldByName('Dolgnost').AsString;
    cKdSPZ  := FieldByName('KdSPZ').AsString;
    cSO     := FieldByName('SO').AsString;
    cOklTrf := FieldByName('OklTrf').AsString;
    cPdNlg  := FieldByName('PdNlg').AsString;
    cSovm   := FieldByName('Sovm').AsString;
    cPens   := FieldByName('Pr_Pens').AsString;
    cInv    := FieldByName('Inv').AsString;
    cKolMin := FieldByName('KolMin').AsString;
    Append;
    if AddEdtPere(nKdSps, nTabN, cFamIO, dsrcPere) then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.popPereEdtClick(Sender: TObject);
var cFamIO, cDolgn, cKdSPZ, cSO, cOklTrf, cPdNlg,
    cSovm, cPens, cInv, cKolMin : string; nTabN : integer;
begin
  nTabN := qryUpi.FieldByName('TabN').AsInteger;
  cFamIO := Trim(qryUpi.FieldByName('Fam').AsString + ' ' +
                       qryUpi.FieldByName('Ima').AsString + ' ' +
                             qryUpi.FieldByName('Otch').AsString);
  with qryPere do begin
    cDolgn  := FieldByName('Dolgnost').AsString;
    cKdSPZ  := FieldByName('KdSPZ').AsString;
    cSO     := FieldByName('SO').AsString;
    cOklTrf := FieldByName('OklTrf').AsString;
    cPdNlg  := FieldByName('PdNlg').AsString;
    cSovm   := FieldByName('Sovm').AsString;
    cPens   := FieldByName('Pr_Pens').AsString;
    cInv    := FieldByName('Inv').AsString;
    cKolMin := FieldByName('KolMin').AsString;
    Edit;
    if AddEdtPere(nKdSps, nTabN, cFamIO, dsrcPere) then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.popPereDelClick(Sender: TObject);
var bEof : boolean; nSvNR : integer;
begin
  if qryPere.FieldByName('Priem').AsString = 'Y' then begin
    MessageDlg('Эту запись удалять нельзя. ' +
                  'Она удаляется только вместе с лицевым счетом.',
                  mtWarning, [mbOk], 0);
//    Application.MessageBox('Эту запись удалять нельзя. ' +
//                  'Она удаляется только вместе с лицевым счетом.',
//                     PChar(Application.Title), MB_OK);
    Exit;
  end;
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
//  if (Application.MessageBox('Запись удаляется безвозвратно. Согласны?:',
//                     PChar(Application.Title),
//                       MB_YESNO + MB_ICONWARNING) = IDYES) then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESZPL;
      SQL.Add('Delete from Z_PERE where NR = :nNr');
      ParamByName('nNR').AsInteger :=
                        qryPere.FieldByName('NR').AsInteger;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    bEof := false;
    nSvNR := 0;
    with qryPere do begin
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
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbgrPereEditButtonClick(Sender: TObject);
var cUpperFieldName, cNmShPdn, cShShPdN,
    cNmOpl, cShKatPers, cNmKatPers, cShSBU, cPSch, cNmSBU : string;
    nKdShPdn, nKdOpl, nKdKatPers, nKdSBU, nKdPSch : integer;
begin
  with dbgrPere do begin
    cUpperFieldName := UpperCase(SelectedField.FieldName);
    if cUpperFieldName = 'NMSHPDN' then begin
      nKdShPdn := DataSource.DataSet.
                             FieldByName('PdNlg').AsInteger;
      if GetShPdN(nKdShPdn, cNmShPdN, cShShPdN) then begin  {Z_GtPdn}
        if not (DataSource.DataSet.
                              State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('PdNlg').AsInteger := nKdShPdn;
      end; end
    else if cUpperFieldName = 'NMSO' then begin
      nKdOpl := DataSource.DataSet.FieldByName('SO').AsInteger;
      if GetSysOpl(nKdOpl, cNmOpl) then begin     {Z_GtOpl}
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('SO').AsInteger := nKdOpl;
      end; end
    else if cUpperFieldName = 'SPZ' then begin
      nKdSBU := DataSource.DataSet.FieldByName('KdSPZ').AsInteger;
      if GetSbu(nKdSBU, cShSBU, cPSch, cNmSBU) {A_SBU} then begin
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('KdSPZ').AsInteger := nKdSBU;
      end; end
    else if cUpperFieldName = 'NMKATP' then begin
      nKdKatPers := DataSource.DataSet.
                                     FieldByName('KdKatP').AsInteger;
      if GetKatPers(nKdKatPers, cShKatPers,       {Z_GtPers}
                                        cNmKatPers) then begin
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.
                       FieldByName('KdKatP').AsInteger := nKdKatPers;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbgrPereKeyDown(Sender: TObject; var Key: Word;
                                                  Shift: TShiftState);
var cUpperFieldName, cNmShPdn, cShShPdN,
    cNmOpl, cShKatPers, cNmKatPers, cShSBU, cPSch, cNmSBU : string;
    nKdShPdn, nKdOpl, nKdKatPers, nKdSBU : integer;
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
                                               with dbgrPere do begin
    cUpperFieldName := UpperCase(SelectedField.FieldName);
    if cUpperFieldName = 'NMSHPDN' then begin
      nKdShPdn := DataSource.DataSet.
                             FieldByName('PdNlg').AsInteger;
      if GetShPdN(nKdShPdn, cNmShPdN, cShShPdN) then begin  {Z_GtPdn}
        if not (DataSource.DataSet.
                              State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('PdNlg').AsInteger := nKdShPdn;
      end; end
    else if cUpperFieldName = 'NMSO' then begin
      nKdOpl := DataSource.DataSet.FieldByName('SO').AsInteger;
      if GetSysOpl(nKdOpl, cNmOpl) then begin     {Z_GtOpl}
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('SO').AsInteger := nKdOpl;
      end; end
    else if cUpperFieldName = 'SPZ' then begin
      nKdSBU := DataSource.DataSet.FieldByName('KdSPZ').AsInteger;
      if GetSbu(nKdSBU, cShSBU, cPSch, cNmSBU) {A_SBU} then begin
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('KdSPZ').AsInteger := nKdSBU;
      end; end
    else if cUpperFieldName = 'NMKATP' then begin
      nKdKatPers := DataSource.DataSet.
                                     FieldByName('KdKatP').AsInteger;
      if GetKatPers(nKdKatPers, cShKatPers,       {Z_GtPers}
                                        cNmKatPers) then begin
        if not (DataSource.DataSet.State in [dsInsert, dsEdit]) then
          DataSource.DataSet.Edit;
        DataSource.DataSet.
                       FieldByName('KdKatP').AsInteger := nKdKatPers;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbgrPereDrawColumnCell(Sender: TObject;
               const Rect: TRect; DataCol: Integer; Column: TColumn;
                                               State: TGridDrawState);
begin
(*
  with dbgrPere.Canvas do begin
    if not (gdFocused in State) then begin
      if dsrcPere.DataSet.FieldByName('Priem').AsString = 'Y' then
        Font.Color := clRed
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrPere.DefaultDrawColumnCell(Rect, DataCol, Column, State);
*)
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.DateFieldSetText(Sender: TField;
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
procedure TFormEUpi.qryPereBeforeInsert(DataSet: TDataSet);
// Запомнить значения полей в текущей записи, чтобы вставить
// некоторые из них в новую
begin
  nSvKdObj    := 0;
  nSvKdKatP   := 0;
  nSvSO       := 0;
  nSvPrPens   := 0;
  nSvSovm     := 0;
  nSvKdSPZ    := 0;
  nSvInv      := 0;
  nSvPdNlg    := 0;
  nSvKolMin   := 0;
  nSvOklTrf   := 0;
  nSvAvans    := 0;
  nSvProcLG   := 0;
  cSvSp_Av    := '%';
  cSvDolgnost := '';
  if qryPere.RecordCount <> 0 then with qryPere do begin
    nSvKdObj    := FieldByName('KdObj').AsInteger;
    nSvKdKatP   := FieldByName('KdKatP').AsInteger;
    nSvSO       := FieldByName('SO').AsInteger;
    nSvPrPens   := FieldByName('Pr_Pens').AsInteger;
    nSvSovm     := FieldByName('Sovm').AsInteger;
    nSvPdNlg    := FieldByName('PdNlg').AsInteger;
    nSvKolMin   := FieldByName('KolMin').AsInteger;
    nSvOklTrf   := FieldByName('OklTrf').AsFloat;
    nSvAvans    := FieldByName('Avans').AsFloat;
    nSvProcLG   := FieldByName('ProcLG').AsFloat;
    cSvSp_Av    := FieldByName('Sp_Av').AsString;
    cSvDolgnost := FieldByName('Dolgnost').AsString;
    nSvKdSPZ    := FieldByName('KdSPZ').AsInteger;
    nSvInv      := FieldByName('Inv').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer; cShKatP, cNmKatP : string;
begin
  dbeKatP.SetFocus;
  if not qryPere.FieldByName('KdKatP').IsNull then
    nKdKatP := qryPere.FieldByName('KdKatP').AsInteger
  else
    nKdKatP := -999;
  cShKatP := '';
  cNmKatP := '';
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) then begin      {Z_GtPers}
    qryPere.FieldByName('KdKatP').AsInteger := nKdKatP;
    // остальное сделает LookUp
    n_KdKatP := nKdKatP;
    dbeShSovm.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeIDExit(Sender: TObject);
var cMsg, cID : string;  nResult : word;
begin
  cID := Trim(dbeID.Text);
  if cID <> '' then begin
    if bNewVvod then with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := qryUpi.DatabaseName;
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
procedure TFormEUpi.dbeDtPriemExit(Sender: TObject);
begin
  qryPereDt_Prikaza.AsString := qryPereDt_Beg.AsString;
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.DBCheckBoxEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Font.Color := clBlue;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.DBCheckBoxExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Font.Color := clWindowText;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.DBComboBoxPolEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.DBComboBoxPolExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.sBtnObjClick(Sender: TObject);
var nKdObj : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  dbeObj.SetFocus;
  nKdObj := dbeObj.DataSource.DataSet.FieldByName('KdObj').AsInteger;
  if GetKdObj(nKdSps, nKdObj, cNmObj, cShObj, bWasUpdated) {Z_TObj} then begin
    dbeObj.DataSource.DataSet.FieldByName('KdObj').AsInteger := nKdObj;
    dbeKatP.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeDolgnKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if sBtnDolgn.Enabled and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnDolgn.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeObjKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if sBtnObj.Enabled and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObj.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeKatPKeyDown(Sender: TObject; var Key: Word;
                                                       Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKatP.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeShSovmKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSovm.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVbrSpz.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeNmShNlgKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSovm.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.dbeShSOKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if sBtnVbrSO.Enabled and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnVbrSO.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.sBtnDolgnClick(Sender: TObject);
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
procedure TFormEUpi.sBtnSovmClick(Sender: TObject);
var nKdSovm : integer; cDummy : string;
begin
  nKdSovm := qryPere.FieldByName('Sovm').AsInteger;
  dbeShSovm.SetFocus;
  if GetVidSovm(nKdSovm, cDummy, cDummy) {z_GtSovm} then begin
    qryPere.FieldByName('Sovm').AsInteger := nKdSovm;
    dbeRang.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.sBtnCheckFamExistsClick(Sender: TObject);
var cFam : ShortString; nCheckCase : SmallInt; nTabN, nUpiNR : integer;
begin
  dbeTabNr.SetFocus;
  dbeFam.SetFocus;
  cFam := dbeFam.Field.AsString;
  if cFam = '' then
    ShowMessage('Нет фамилии - нечего проверять')
  else begin
    nCheckCase := ShowQryTmp(cFam, nTabN, nUpiNR);   {z_ShwTmp}
    if nCheckCase = -1 then
      ShowMessage('Фамилия ' + cFam + ' не найдена в справочнике "Сотрудники"')
    else if nCheckCase = 1 then begin
      // Закрыть эту форму и вызвать GetFromUpiToSps(var nTabN, nKdObj, nKdKatP : integer;
      //                                     var bWasUpdated : boolean) : boolean;
      n_NewTabN := nTabN;
      b_GoToTabN := true;
      ModalResult := mrOk;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEUpi.qryUpiLASTDTPRMSetText(Sender: TField; const Text: String);
var cText : ShortString;
begin
  cText := Text;
  if qryPere.Active then
    qryPereDt_Beg.AsString := cText;
  Sender.AsString := cText;
end;

end.
