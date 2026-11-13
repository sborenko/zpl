unit z_EPere;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, IniFiles, DB, DBTables,
  Grids, DBGrids, ExtCtrls, Menus;

type
  TFormEPere = class(TForm)
    QryCmn: TQuery;
    PopCombSalary: TPopupMenu;
    popHead: TMenuItem;
    popAdd: TMenuItem;
    popEdt: TMenuItem;
    popDel: TMenuItem;
    PopPositions: TPopupMenu;
    NShowOldPos: TMenuItem;
    NShowPrevPos: TMenuItem;
    PanelMain: TPanel;
    PanelDate: TPanel;
    Label19: TLabel;
    sBtnKdSps: TSpeedButton;
    Label1: TLabel;
    dbeShSps: TDBEdit;
    DbeDtBeg: TDBEdit;
    dbcheckElTrudKn: TDBCheckBox;
    PanelSalary: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    LabelOklTrf: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    grBoxSchOkl: TGroupBox;
    rBtnSimpleOkl: TRadioButton;
    rBtnCmbOkl: TRadioButton;
    dbePrcWrkTime: TDBEdit;
    dbeNPD: TDBEdit;
    dbeOklTrf: TDBEdit;
    dbeSmCmbOkl: TDBEdit;
    dbeAvans: TDBEdit;
    dbeSpAv: TDBEdit;
    PanelNICh: TPanel;
    Label15: TLabel;
    Label13: TLabel;
    sBtnKdTemu: TSpeedButton;
    sBtnSPZ: TSpeedButton;
    dbeKdTemu: TDBEdit;
    dbeNmTemu: TDBEdit;
    edSpZ: TEdit;
    dbeKdSpZ: TDBEdit;
    dbeSPZ: TDBEdit;
    PanelPrevPos: TPanel;
    labelDkpp: TLabel;
    sBtnGetOldOK: TSpeedButton;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label28: TLabel;
    dbePrevCode: TDBEdit;
    dbePrevZ_kpp: TDBEdit;
    dbePrevNameD: TDBEdit;
    dbePrevNameFull: TDBEdit;
    DbePrevKdOK: TDBEdit;
    DbePrevDolgnOK: TDBEdit;
    PanelNewPos: TPanel;
    Label23: TLabel;
    Label30: TLabel;
    Label26: TLabel;
    sBtnGetNewOK: TSpeedButton;
    Label24: TLabel;
    Label25: TLabel;
    dbeNewKdOK: TDBEdit;
    dbeNewDolgnOK: TDBEdit;
    dbeNewCode: TDBEdit;
    dbeNewZ_kpp: TDBEdit;
    dbeNewNameD: TDBEdit;
    dbeNewNameFull: TDBEdit;
    PanelOldPos: TPanel;
    Label10: TLabel;
    sBtnDolgn: TSpeedButton;
    dbeDolgn: TDBEdit;
    PanelOthers: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    sBtnPdNlg: TSpeedButton;
    Label2: TLabel;
    Label7: TLabel;
    sBtnSovm: TSpeedButton;
    Label18: TLabel;
    sBtnLgt: TSpeedButton;
    sBtnInvDocs: TSpeedButton;
    dbeShPdNlg: TDBEdit;
    DBChBoxPens: TDBCheckBox;
    dbeNotes: TDBEdit;
    DBChBoxProfs: TDBCheckBox;
    dbeShSovm: TDBEdit;
    dbeInv: TDBEdit;
    dbeSovm: TDBEdit;
    dbePdNlg: TDBEdit;
    dbeProcLg: TDBEdit;
    PanelBottom: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    chBoxPS: TCheckBox;
    PanelCombSal: TPanel;
    Label14: TLabel;
    dbgrDPere: TDBGrid;
    Label11: TLabel;
    dbeNrPrikaza: TDBEdit;
    Label12: TLabel;
    dbeDtPrikaza: TDBEdit;
    PanelDept: TPanel;
    LabelObj: TLabel;
    dbeKdObj: TDBEdit;
    dbeShObj: TDBEdit;
    sBtnObj: TSpeedButton;
    Label5: TLabel;
    dbeKdKatP: TDBEdit;
    dbeShKatP: TDBEdit;
    sBtnKatP: TSpeedButton;
    Label6: TLabel;
    dbeSO: TDBEdit;
    dbeShSO: TDBEdit;
    sBtnSO: TSpeedButton;
    NFlatView: TMenuItem;
    DbChBoxBM: TDBCheckBox;
    dbeDtBM: TDBEdit;
    NCopy: TMenuItem;
    NInsert: TMenuItem;
    NView: TMenuItem;
    Sep1: TMenuItem;
    Sep2: TMenuItem;
    NCut: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure DBCheckBoxEnter(Sender: TObject);
    procedure DBCheckBoxExit(Sender: TObject);
    procedure sBtnObjClick(Sender: TObject);
    procedure sBtnKatPClick(Sender: TObject);
    procedure sBtnPdNlgClick(Sender: TObject);
    procedure sBtnSOClick(Sender: TObject);
    procedure dbeShObjDblClick(Sender: TObject);
    procedure sBtnSPZClick(Sender: TObject);
    procedure dbeShObjKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure dbeShKatPKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure dbeShSOKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure dbeShPdNlgKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure dbeDolgnKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure dbeShSovmKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DbeDtBegExit(Sender: TObject);
    procedure sBtnDolgnClick(Sender: TObject);
    procedure dbgrDPereEnter(Sender: TObject);
    procedure dbgrDPereExit(Sender: TObject);
    procedure dbChBoxCmbOklEnter(Sender: TObject);
    procedure dbChBoxCmbOklExit(Sender: TObject);
    procedure rBtnOklClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure PopCombSalaryPopup(Sender: TObject);
    procedure dbgrDPereDblClick(Sender: TObject);
    procedure chBoxPSClick(Sender: TObject);
    procedure dbePrcWrkTimeExit(Sender: TObject);
    procedure sBtnSovmClick(Sender: TObject);
    procedure sBtnKdSpsClick(Sender: TObject);
    procedure dbeShSpsKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure edSpZEnter(Sender: TObject);
    procedure edSpZExit(Sender: TObject);
    procedure sBtnLgtClick(Sender: TObject);
    procedure sBtnInvDocsClick(Sender: TObject);
    procedure dbgrDPereDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnKdTemuClick(Sender: TObject);
    procedure dbeKdTemuExit(Sender: TObject);
    procedure dbeKdTemuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sBtnGetOldOKClick(Sender: TObject);
    procedure dbeOldZ_kppExit(Sender: TObject);
    procedure sBtnGetNewOKClick(Sender: TObject);
    procedure DbChBoxBMEnter(Sender: TObject);
    procedure DbChBoxBMExit(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure dbeKdObjExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeInvExit(Sender: TObject);
    procedure PopPositionsPopup(Sender: TObject);
    procedure NShowPrevPosClick(Sender: TObject);
    procedure NShowOldPosClick(Sender: TObject);
    procedure NFlatViewClick(Sender: TObject);
    procedure NCopyClick(Sender: TObject);
    procedure NInsertClick(Sender: TObject);
    procedure NCutClick(Sender: TObject);
//    procedure rBtnCmbOklClick(Sender: TObject);
  private
    { Private declarations }

    dsrcMain: TDataSource;
    dsrcParts: TDataSource;

    nKdSps, nTabN : integer;
    cFamIO : ShortString;

    n_SvKdSpz : SmallInt;
    c_SvSpz : ShortString;
    dOldDtBeg : TDateTime;
    nOldKdObj, nOldKdKatP, nOldKdSpZ, nOldSO, nOldPdNlg, nOldKolMin, nOldRazr,
    nOldRang, nOldSovm, nOldPrfs, nOldPrPens, nOldInv : integer;
    nOldOklTrf, nOldAvans, nOldProcLg, nOldPrcWrkTime : double;
    cOldSpAv, cOldCmbOkl, cOldPrDekr : string[1];

    function CheckVvod : boolean;
    function IsRecDtBeg(dDtBeg : TDateTime) : boolean;
    procedure GetSetPredDateInf(DtBeg: TDateTime);
    procedure SetGrBoxSchOklState(nKdSOpl : integer);
    // procedure SetCmbOklEnv;
    procedure SetEnv2;
    function mySmCmbOkl : string;
    procedure WhatDoWithPereschet(nKdSps, nTabN : integer;
                                                  dDtProc, dDtBeg : TDateTime);
    function IsInsertMode: boolean;
    function IsEditMode: boolean;
    procedure SetDataSources(dsrcMain, dsrcParts: TDataSource);

    procedure UpdateObjDependencies(nKdObj: integer);

    function CopyFilter(FieldName: ShortString): Boolean;

    procedure ShowPrevPosition;
    procedure HidePrevPosition;

    procedure ShowOldPosName;
    procedure HideOldPosName;

    procedure RepaintPanels;
    procedure PaintPanel(Panel: TPanel; Flat: Boolean; var I: Integer);
  end;

function AddEdtPere(nKdSps, nTabN : integer; cFamIO : ShortString;
                                   dsrcMain, dsrcParts : TDataSource) : boolean;

const SECTION = 'Z_EPere';

var
  FormEPere: TFormEPere;

implementation

uses
  a_Const, a_Dm, a_SBU, a_ShKSps, a_ShwErr, DModUsrSetts, DsLib, QryLib,
  z_dk2010, z_DM, z_eDPere, z_GtOpl, Z_GtPdN, z_GtPers, z_GtSovm, z_InvDoc,
  z_KdDlgn, z_Lgotu, z_Main, z_ShwTem, z_TObj, ClipBrd;

const
  ORIGIN_CLIENT_HEIGHT = 592;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtPere(
  nKdSps, nTabN : integer;
  cFamIO : ShortString;
  dsrcMain, dsrcParts : TDataSource
) : boolean;
var
  dMesPS : TDateTime;
  nY, nM, nD : word;
  nCntChld10_11 : SmallInt;
  nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11 : double;
  cOznPilg : ShortString;
begin
  Result := false;

  FormEPere := TFormEPere.Create(Application);

  FormEPere.dsrcMain  := dsrcMain;
  FormEPere.dsrcParts := dsrcParts;

  FormEPere.cFamIO := cFamIO;
  FormEPere.nKdSps := nKdSps;
  FormEPere.nTabN := nTabN;

  with FormEPere do begin
    SetDataSources(dsrcMain, dsrcParts);

    with dsrcMain.DataSet do begin
      if FieldByName('Sovm').IsNull then
        FieldByName('Sovm').AsInteger := 0;
      if FieldByName('Pr_Pens').IsNull then
        FieldByName('Pr_Pens').AsInteger := 0;
      if FieldByName('Prfs').IsNull then
        FieldByName('Prfs').AsInteger := 0;
      if FieldByName('Inv').AsInteger = 0 then
        FieldByName('Inv').AsString := '';
    end;

    nCntChld10_11 := 0;
    nSmPrcLgtSotr := 0;
    nSmPrcLgtChld10 := 0;
    nSmPrcLgtChld11 := 0;

    DmMain.GetSmPrcLgt(nTabN, dDtProc,
      nCntChld10_11, nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11, cOznPilg);

    dbeProcLG.Field.AsFloat :=
      nSmPrcLgtSotr + nSmPrcLgtChld10 + nSmPrcLgtChld11;

    edSpZ.Text := dbeSpZ.Text;
    n_SvKdSpz := dbeKdSpz.Field.AsInteger;
    c_SvSpz := dbeSpZ.Text;

    if IsEditMode then
      Caption := cFamIO + ' [Редактирование перемещения]'
    else
      Caption := cFamIO + ' [Новое перемещение]';

    if IsEditMode then begin
      rBtnCmbOkl.Checked := dbeDtBeg.DataSource.DataSet.
                                      FieldByName('CmbOkl').AsString = '1';
      ChBoxPS.Visible := dbeDtBeg.Field.AsDateTime < dCtrlDate;
      SetGrBoxSchOklState(dbeShSO.DataSource.DataSet.
                                          FieldByName('SO').AsInteger); end
    else begin
      Width := 348;
      dbgrDPere.Visible := false;
      dbeOklTrf.Visible := true;
      dbeSmCmbOkl.Visible := false;
      ChBoxPS.Visible := false;
      dOldDtBeg := dDtProc;
      rBtnSimpleOkl.Checked := true;
    end;

    SetEnv2;

    with dbeDtBeg.DataSource.DataSet do begin
      nOldKdObj      := FieldByName('KdObj').AsInteger;
      nOldKdKatP     := FieldByName('KdKatP').AsInteger;
      nOldKdSpZ      := FieldByName('KdSpZ').AsInteger;
      nOldSO         := FieldByName('SO').AsInteger;
      nOldPdNlg      := FieldByName('PdNlg').AsInteger;
      nOldKolMin     := FieldByName('KolMin').AsInteger;
      nOldRazr       := FieldByName('Razr').AsInteger;
      nOldRang       := FieldByName('Rang').AsInteger;
      nOldSovm       := FieldByName('Sovm').AsInteger;
      nOldPrfs       := FieldByName('Prfs').AsInteger;
      nOldPrPens     := FieldByName('Pr_Pens').AsInteger;
      nOldInv        := FieldByName('Inv').AsInteger;
      nOldOklTrf     := FieldByName('OklTrf').AsFloat;
      nOldAvans      := FieldByName('Avans').AsFloat;
      nOldProcLg     := FieldByName('ProcLg').AsFloat;
      nOldPrcWrkTime := FieldByName('PrcWrkTime').AsFloat;
      cOldSpAv       := FieldByName('Sp_Av').AsString;
      cOldCmbOkl     := FieldByName('CmbOkl').AsString;
      cOldPrDekr     := FieldByName('PrDekr').AsString;
      dOldDtBeg      := dbeDtBeg.Field.AsDateTime;
    end;

    if not dbePrcWrkTime.Field.IsNull and
              (dbePrcWrkTime.Field.AsString <> '100') then
      dbeOklTrf.Hint := 'Сумма, равная неполному заработку'
    else
       dbeOklTrf.Hint := 'Сумма оклада или тарифа';

    if ShowModal = mrOk then begin
      if ChBoxPS.Visible and ChBoxPS.Checked then begin
        DecodeDate(dbeDtBeg.Field.AsDateTime, nY, nM, nD);
        dMesPS := EncodeDate(nY, nM, 1);
        DmMain.AddPSToOtkl('8802', nTabN, dCtrlDate, dMesPS);
      end;
      Result := true;
    end;
    Free;
  end; {with}
end; {func}

//------------------------------------------------------------------------------
procedure TFormEPere.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    ChBoxPS.Checked := ReadBool(SECTION, 'bPerschet', true);
    Free;
  end;

  if FileExists(cDirVids + 'GrDPere1.vid') then
    dbgrDPere.Columns.LoadFromFile(cDirVids + 'GrDPere1.vid');

  dbeSmCmbOkl.Left := dbeOklTrf.Left;
  dbeSmCmbOkl.Top := dbeOklTrf.Top;

  if not DmUsrSetts.ShowPrevPosition then
    HidePrevPosition;

  if not DmUsrSetts.ShowOldPosName then
    HideOldPosName;

  RepaintPanels;
end;

//------------------------------------------------------------------------------
function TFormEPere.IsRecDtBeg(dDtBeg : TDateTime) : boolean;
var nRecNR : integer;
begin
  nRecNR := dbeDtBeg.DataSource.DataSet.FieldByName('NR').AsInteger;
  with FormZpMain.qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select count( * ) as CNT from z_Pere ' +
                        ' where (TabN = :nTabN) and (Dt_Beg = :dDtBeg) and ' +
                        ' (NR <> :nRecNR)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('nRecNR').AsInteger := nRecNR;
    Open;
    Result := FieldByName('CNT').AsInteger > 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormEPere.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if IsRecDtBeg(dbeDtBeg.DataSource.
             DataSet.FieldByName('Dt_Beg').AsDateTime) then
    mListErr.Add('Уже есть запись с датой ' + dbeDtBeg.DataSource.
             DataSet.FieldByName('Dt_Beg').AsString);
  if (dbeShObj.Text = '') then
    mListErr.Add('Не выбрано подразделение');
  if (dbeShKatP.Text = '') then
    mListErr.Add('Не выбрана категория персонала');
  if (dbeShSO.Text = '') then
    mListErr.Add('Не выбрана система оплаты');
  if (dbeOklTrf.Text = '') then
    mListErr.Add('Нет суммы оклада (тарифа)');
  if (dbeSPZ.Text = '') then
    mListErr.Add('Не выбран связанный счет БухУчета');
  if (dbeDolgn.Text = '') then
    mListErr.Add('Нет должности');
  if (dbeShPdNlg.Text = '') then
    mListErr.Add('Не выбрана схема подоходного налога');
  if (dbeProcLG.Text = '') then
    mListErr.Add('Нет процента льготы');

  {if (dbeInv.Text = '') then
    mListErr.Add('Не проставлен признак инвалидности')
  else}
  if (dbeInv.Field.AsInteger > 3) or (dbeInv.Field.AsInteger < 0) then
    mListErr.Add('Призн.инвалидн. допускается от 0 до 3');

  if (dbePrcWrkTime.Text <> '') and
          ((StrToFloat(dbePrcWrkTime.Text) > 100) or
                          (StrToFloat(dbePrcWrkTime.Text) < 0)) then
    mListErr.Add('% раб.времени должен быть >=0, <=100 или ничего');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var nSpecNR : integer;
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeShObj.SetFocus; end
    else begin
      nSpecNR := 0;
      if rBtnCmbOkl.Checked then begin
        if (dbeDtBeg.DataSource.DataSet.FieldByName('Spec_NR').IsNull) then begin
          nSpecNR := DmMain.NewSpec_NR;
          dbeDtBeg.DataSource.DataSet.
                 FieldByName('Spec_NR').AsInteger := nSpecNR; end
        else
          nSpecNR := dbeDtBeg.DataSource.DataSet.
                                     FieldByName('Spec_NR').AsInteger;
        dbeDtBeg.DataSource.DataSet.FieldByName('CmbOkl').AsString := '1'; end
      else
        dbeDtBeg.DataSource.DataSet.FieldByName('CmbOkl').AsString := '';
      // т.е. если Spec_Nr уже стоит и есть записи в z_CmbOkl, то при изменении
      // с rBtnCmbOkl на rBtnSimpleOkl и Spec_NR и записи в z_CmbOkl останутся.
      // Только признак CmbOkl в z_Pere снимется
      if (dbgrDPere.DataSource.DataSet as TQuery).UpdatesPending then begin
        // Подставить во все записи DPere nSpecNR
        // не взирая на то, есть они там или нет их (лучше перебдеть)
        if nSpecNR <> 0 then with dbgrDPere.DataSource.DataSet do begin
          DisableControls;
          First;
          while not Eof do begin
            Edit;
            FieldByName('Spec_NR').AsInteger := nSpecNR;
            FieldByName('TabN').AsInteger    := nTabN;
            Post;
            Next;
          end;
          EnableControls;
        end;
        Form_Dm.DbMain.ApplyUpdates([dbgrDPere.DataSource.DataSet as TQuery]);
      end;
      if g_bNewSchet then
        WhatDoWithPereschet(nKdSps, nTabN, dDtProc, dbeDtBeg.Field.AsDateTime);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.WhatDoWithPereschet(nKdSps, nTabN : integer;
                                                   dDtProc, dDtBeg : TDateTime);
var bNeedPereschet : boolean;   // нужно ли пересчитывать прошлые месяцы
begin
  bNeedPereschet := false;
  if IsEditMode then begin
    if ((dOldDtBeg >= dDtProc) and (dDtBeg >= dDtProc)) then
      bNeedPereschet := false // т.к. чтобы ни изменилось - учтется при
                              // расчетах текущего месяца или в будущих месяцах
    else with dbeDtBeg.DataSource.DataSet do begin
      if (dOldDtBeg <> dDtBeg) or
          (nOldKdObj <> FieldByName('KdObj').AsInteger) or
          (nOldKdKatP <> FieldByName('KdKatP').AsInteger) or
           (nOldKdSpZ <> FieldByName('KdSpZ').AsInteger) or
           (nOldSO <> FieldByName('SO').AsInteger) or
            (nOldPdNlg <> FieldByName('PdNlg').AsInteger) or
            (nOldKolMin <> FieldByName('KolMin').AsInteger) or
             (nOldRazr <> FieldByName('Razr').AsInteger) or
             (nOldRang <> FieldByName('Rang').AsInteger) or
              (nOldSovm <> FieldByName('Sovm').AsInteger) or
              (nOldPrfs <> FieldByName('Prfs').AsInteger) or
               (nOldPrPens <> FieldByName('Pr_Pens').AsInteger) or
               (nOldInv <> FieldByName('Inv').AsInteger) or
                (nOldOklTrf <> FieldByName('OklTrf').AsFloat) or
                (nOldAvans <> FieldByName('Avans').AsFloat) or
                 (nOldProcLg <> FieldByName('ProcLg').AsFloat) or
                 (nOldPrcWrkTime <> FieldByName('PrcWrkTime').AsFloat) or
                  (cOldSpAv <> FieldByName('Sp_Av').AsString) or
                  (cOldCmbOkl <> FieldByName('CmbOkl').AsString) or
                   (cOldPrDekr <> FieldByName('PrDekr').AsString) then
        bNeedPereschet := true;
    end; end
  else
    bNeedPereschet := dbeDtBeg.Field.AsDateTime < dDtProc;
  // Если нужны пересчеты - определить за какие месяцы
  // и ввести соответственно запись(записи) в отклонения
  if bNeedPereschet {and (dDtZaMG = dDtProc)} then
    DmMain.AddPereschetInOtkl(nKdSps, nTabN, dDtProc,
                                                dbeDtBeg.Field.AsDateTime);
end;
//------------------------------------------------------------------------------
procedure TFormEPere.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrDPere.Columns.SaveToFile(cDirVids + 'GrDPere1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteBool(SECTION, 'bPerschet', ChBoxPS.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.DbeDtBegExit(Sender: TObject);
var
  DtBeg: TDateTime;
begin
  (Sender as TDBEdit).Color := clWindow;

  DtBeg := dbeDtBeg.Field.AsDateTime;

  if DtBeg <> dOldDtBeg then begin
    if IsInsertMode then begin  // Вписать данные на введенную дату
      GetSetPredDateInf(DtBeg);
      dbeNrPrikaza.Text := '-К';
      dbeDtPrikaza.Text := dbeDtBeg.Text;
    end;

    chBoxPS.Visible := DtBeg < dCtrlDate;
    dOldDtBeg := DtBeg;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.GetSetPredDateInf(DtBeg: TDateTime);
var
  DataSet: TDataSet;
begin
  QryUtils.InitQuery(QryCmn);

  with QryCmn do begin
    SQL.Text :=
      'select first 1 * ' +
      'from z_Pere ' +
      'where TabN = :TabN ' +
        'and Dt_Beg <= :Dt_Beg ' +
      'order by Dt_Beg desc';
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('Dt_Beg').AsDateTime := DtBeg;
    Open;
  end;

  DataSet := DbeDtBeg.DataSource.DataSet;

  DsUtils.CopyRecord(QryCmn, DataSet, nil, CopyFilter);

  DataSet.FieldByName('OldKdOK').AsInteger := 
    QryCmn.FieldByName('NewKdOK').AsInteger;

  QryUtils.ReleaseQuery(QryCmn);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TFormEPere.CopyFilter(FieldName: ShortString): Boolean;
begin
  FieldName := UpperCase(FieldName);

  Result := (FieldName <> 'DT_BEG') and (FieldName <> 'IS_PERE')
    and (FieldName <> 'BM') and (FieldName <> 'DTBM')
    and (FieldName <> 'SPEC_NR');
end;

//------------------------------------------------------------------------------
procedure TFormEPere.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbePrcWrkTimeExit(Sender: TObject);
begin
  if not dbePrcWrkTime.Field.IsNull and
              (dbePrcWrkTime.Field.AsString <> '100') then
    dbeOklTrf.Hint := 'Сумма, равная неполному заработку'
  else
    dbeOklTrf.Hint := 'Сумма оклада или тарифа';
  if dbePrcWrkTime.Field.IsNull or (dbePrcWrkTime.Field.AsInteger = 0) or
                                    (dbePrcWrkTime.Field.AsInteger = 100) then
     dbeNPD.Field.AsString := ''
  else
    dbeNPD.Field.AsInteger := 1;

  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.DBCheckBoxEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.DBCheckBoxExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbgrDPereEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbgrDPereExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbChBoxCmbOklEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbChBoxCmbOklExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnObjClick(Sender: TObject);
var nKdObj, nKdSpZ : integer; cNmObj, cShObj : string; bWasUpdated : boolean;
begin
  nKdObj := dbeShObj.DataSource.DataSet.FieldByName('KdObj').AsInteger;
  dbeShObj.SetFocus;
  if GetKdObj(nKdObj, nKdSpZ, cShObj, cNmObj, bWasUpdated) {Z_TObj} then begin
    dbeShObj.DataSource.DataSet.FieldByName('KdObj').AsInteger := nKdObj;
    if bWasUpdated then
      UpdateObjDependencies(nKdObj);
    dbeShKatP.SetFocus;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.UpdateObjDependencies(nKdObj: integer);
var
  nKdSpZ: Smallint;
  cSchBU: ShortString;
begin
  Form_Dm.GetSpZByObj(nKdObj, nKdSpZ, cSchBU);
  dbeKdSpZ.Field.AsInteger := nKdSpZ;
  edSpZ.Text := cSchBU;
  nOldKdObj := dbeKdObj.Field.AsInteger;
  nOldKdSpZ := dbeKdSpZ.Field.AsInteger;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.sBtnKatPClick(Sender: TObject);
var nKdKatP : integer; cNmKatP, cShKatP : string;
begin
  nKdKatP := dbeShKatP.DataSource.DataSet.FieldByName('KdKatP').AsInteger;
  dbeShKatP.SetFocus;
  if GetKatPers(nKdKatP, cShKatP, cNmKatP) {Z_GtPers} then begin
    dbeShKatP.DataSource.DataSet.FieldByName('KdKatP').AsInteger := nKdKatP;
    dbeShSO.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnSOClick(Sender: TObject);
var nKdSOpl : integer; cNmSOpl : string;
begin
  nKdSOpl := dbeShSO.DataSource.DataSet.FieldByName('SO').AsInteger;
  dbeShSO.SetFocus;
  if GetSysOpl(nKdSOpl, cNmSOpl) {Z_GtOpl} then begin
    dbeShSO.DataSource.DataSet.FieldByName('SO').AsInteger := nKdSOpl;
    SetGrBoxSchOklState(nKdSOpl);
    if nKdSOpl = 2 {часовой тариф} then
      dbePrcWrkTime.SetFocus
    else
      grBoxSchOkl.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.SetGrBoxSchOklState(nKdSOpl : integer);
begin
  if nKdSOpl = 2 then begin
    LabelOklTrf.Caption := 'Составной оклад';
    rBtnSimpleOkl.Checked := true;
    rBtnSimpleOkl.Enabled := false;
    rBtnCmbOkl.Enabled := false;
    grBoxSchOkl.Enabled := false; end
  else begin
    LabelOklTrf.Caption := 'Сумма оклада';
    rBtnSimpleOkl.Enabled := true;
    rBtnCmbOkl.Enabled := true;
    grBoxSchOkl.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnPdNlgClick(Sender: TObject);
var nKdSh : integer; cNmSh, cShSh : string;
begin
  nKdSh := dbeShPdNlg.DataSource.DataSet.FieldByName('PdNlg').AsInteger;
  dbeShPdNlg.SetFocus;
  if GetShPdN(nKdSh, cNmSh, cShSh) {Z_GtPdN} then begin
    dbeShPdNlg.DataSource.DataSet.FieldByName('PdNlg').AsInteger := nKdSh;
    dbeShSovm.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeShObjKeyDown(Sender: TObject; var Key: Word;
                                               Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObj.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeShObjDblClick(Sender: TObject);
begin
  sBtnObj.Click
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeShKatPKeyDown(Sender: TObject; var Key: Word;
                                                Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKatP.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeShSOKeyDown(Sender: TObject; var Key: Word;
                                              Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSO.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnSPZClick(Sender: TObject);
var nKdSpZ : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  edSPZ.SetFocus;
  with dbeSPZ.DataSource.DataSet as TQuery do begin
    nKdSPZ := FieldByName('KdSPZ').AsInteger;
    cSchBU := FieldByName('SPZ').AsString;
    if GetSBU(nKdSPZ, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
      if bHsCh then begin
        ShowMessage('Выбранный счет имеет СубСчета - на него относить нельзя');
        edSPZ.SetFocus;
        Exit;
      end;
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('KdSPZ').AsInteger  := nKdSPZ;
      edSpZ.Text := cSchBU;
      dbeDolgn.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnDolgnClick(Sender: TObject);
var nKdDolgn : integer; var cShDolgn, cNmDolgn : string;
begin
  nKdDolgn := 0;
  cShDolgn := '';
  cNmDolgn := dbeDolgn.Field.AsString;
  dbeDolgn.SetFocus;
  if GetDolgn(nKdDolgn, cShDolgn, cNmDolgn) {z_KdDlgn} then begin
    dbeDolgn.DataSource.DataSet.FieldByName('KdDolgn').AsInteger := nKdDolgn;
    dbeDolgn.Field.AsString := cNmDolgn;
    dbeShPdNlg.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeDolgnKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnDolgn.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeSPZKeyDown(Sender: TObject; var Key: Word;
                                               Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZ.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeShPdNlgKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnPdNlg.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeShSovmKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSovm.Click;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.rBtnOklClick(Sender: TObject);
begin
  SetEnv2;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.SetEnv2;
begin
  if rBtnCmbOkl.Checked then begin
    Width := 634;
    dbeOklTrf.Visible := false;
    dbgrDPere.Visible := true;
    with dbeSmCmbOkl do begin
      Left := dbeOklTrf.Left;
      Top := dbeOklTrf.Top;
      Visible := true;
    end;
    dbeSmCmbOkl.Text := mySmCmbOkl;
  end else begin
    ClientWidth := PanelMain.Width;
    dbgrDPere.Visible := false;
    dbeOklTrf.Visible := true;
    dbeSmCmbOkl.Visible := false;
  end;

  ClientHeight := PanelDate.Height + PanelDept.Height +
    PanelSalary.Height + PanelNICh.Height + PanelNewPos.Height +
    PanelOthers.Height + PanelBottom.Height + 2;
    // +2 - чтобы показалась нижняя кромка последней панели

  if DmUsrSetts.ShowPrevPosition then
    ClientHeight := ClientHeight + PanelPrevPos.Height;

  if DmUsrSetts.ShowOldPosName then
    ClientHeight := ClientHeight + PanelOldPos.Height;
end;
//------------------------------------------------------------------------------
function TFormEPere.mySmCmbOkl : string;
var
  nSvNR : integer; nSmCmbOkl, nPrcCmbOkl : double;
begin
  Result := '';
  nSmCmbOkl  := 0;
  nPrcCmbOkl := 0;
  with dbgrDPere.DataSource.DataSet do begin
    if RecordCount > 0 then
      nSvNR := FieldByName('NR').AsInteger
    else
      nSvNR := 0;
    DisableControls;
    First;
    while not Eof do begin
      nSmCmbOkl  := nSmCmbOkl + FieldByName('OklTrf').AsFloat;
      nPrcCmbOkl := nPrcCmbOkl + FieldByName('PrcOkl').AsFloat;
      Next;
    end;
    if nSvNR > 0 then
      Locate('NR', nSvNR, []);
    EnableControls;
  end;

  dbeOklTrf.Field.AsFloat     := nSmCmbOkl;
  dbePrcWrkTime.Field.AsFloat := nPrcCmbOkl;

  Result := '  ' + FloatToStrF(nSmCmbOkl, ffFixed, 18, 2);
end;
//------------------------------------------------------------------------------
procedure TFormEPere.PopCombSalaryPopup(Sender: TObject);
begin
  popEdt.Enabled := dbgrDPere.DataSource.DataSet.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.popEdtClick(Sender: TObject);
begin
  with dbgrDPere.DataSource.DataSet do begin
    Edit;
    if EdtAddDPere {Z_eDPere} then begin
      Post;
      dbeSmCmbOkl.Text := mySmCmbOkl; end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.popAddClick(Sender: TObject);
var
  nSvNR : integer;
begin
  with dbgrDPere.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').asInteger;
    Append;
    if EdtAddDPere {Z_eDPere} then begin
      Post;
      dbeSmCmbOkl.Text := mySmCmbOkl; end
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.popDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    dbgrDPere.DataSource.DataSet.Delete;
    dbeSmCmbOkl.Text := mySmCmbOkl;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbgrDPereDblClick(Sender: TObject);
begin
  if dbgrDPere.DataSource.DataSet.RecordCount > 0 then
    popEdtClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEPere.chBoxPSClick(Sender: TObject);
begin
  // Если чекнутый, то в отклонения текущего и предыдущих месяцев ввести
  // запись с видом 8801 (Вказiвка на перерасчет)
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnSovmClick(Sender: TObject);
var nKdSovm : integer; cDummy : string;
begin
  nKdSovm := dbeShSovm.DataSource.DataSet.FieldByName('Sovm').AsInteger;
  dbeShSovm.SetFocus;
  if GetVidSovm(nKdSovm, cDummy, cDummy) {z_GtSovm} then begin
    dbeShSovm.DataSource.DataSet.FieldByName('Sovm').AsInteger := nKdSovm;
    dbeProcLg.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnKdSpsClick(Sender: TObject);
var n_KdSps : integer; var cShSps, cNmSps : string;
begin
  dbeShSps.SetFocus;
  n_KdSps := dbeShSps.DataSource.DataSet.FieldByName('KdSps').AsInteger;
  if GetKdSps(n_KdSps, cShSps, cNmSps) {a_ShKSps} then begin
    dbeShSps.DataSource.DataSet.FieldByName('KdSps').AsInteger := n_KdSps;
    dbeShObj.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeShSpsKeyDown(Sender: TObject; var Key: Word;
                                                        Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnKdSpsClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormEPere.edSpZEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.edSpZExit(Sender: TObject);
var cSchBU, cPSch : string; nKdSbu : integer; bHsCh : boolean;
begin
  if edSpZ.Text > '' then begin
      cSchBU := edSpZ.Text;
    if CheckSBU(nKdSbu, cSchBU, cPSch, bHsCh) {a_SBU} then begin
      if not bHsCh then begin
        (dbeSPZ.DataSource.DataSet as TQuery).
                                     FieldByName('KdSpZ').AsInteger := nKdSbu;
        edSpZ.Text := cSchBU;
        (Sender as TEdit).Color := clWindow; end
      else begin
        ShowMessage('Выбранный счет имеет СубСчета - на него относить нельзя');
        edSPZ.SetFocus;
        Exit;
      end; end
    else
      edSpZ.SetFocus;
    end
  else begin
    (dbeSPZ.DataSource.DataSet as TQuery).FieldByName('KdSpZ').AsString := '';
    (Sender as TEdit).Color := clWindow;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnLgtClick(Sender: TObject);
var nCntChld10_11 : SmallInt;
    nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11 : double;
    {dDtPrc : TDateTime;} cOznPilg : ShortString;
begin
  //dDtPrc := dDtProc;
  ShwLgotu(nTabN, cFamIO);  {z_Lgotu}
  DmMain.GetSmPrcLgt(nTabN, dDtProc, nCntChld10_11,
                     nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11, cOznPilg);
  dbeProcLg.Field.AsFloat := nSmPrcLgtSotr + nSmPrcLgtChld10 + nSmPrcLgtChld11;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnInvDocsClick(Sender: TObject);
begin
  ShwInvDocs(nTabN, cFamIO);       {z_InvDoc}
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbgrDPereDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrDPere.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if cFldNm = 'OKLTRF' then
        Brush.Color := clWindow;
  end;
  dbgrDPere.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEPere.sBtnKdTemuClick(Sender: TObject);
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
procedure TFormEPere.dbeKdTemuExit(Sender: TObject);
var nKdTemu, nKdPSch : SmallInt; cNmTemu, cPSch : ShortString;
    {nTabN : integer; dOnDate : TDateTime;}
    nKdSpZ: SmallInt; cSchBU: ShortString;
begin
  if not dbeKdTemu.Field.IsNull then begin  // поставить в dbeKdSpZ и в
    nKdTemu := dbeKdTemu.Field.AsInteger;   // dbeSpZ "темные" значения счёта
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
    // dOnDate := dDtProc;                                    //по умолчанию
    if Form_Dm.GetSpZByObj(dbeKdObj.Field.AsInteger, nKdSpZ, cSchBU) then begin
      dbeNmTemu.Field.AsString := '';
      dbeKdSpZ.Field.AsInteger := n_SvKdSpz;  //nKdSpZ;
      dbeSpZ.Field.AsString    := c_SvSpz;    //cSchBU;
      edSpZ.Text               := c_SvSpz;    //cSchBU;
      (Sender as TDBEdit).Color := clWindow;
      edSpZ.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.dbeKdTemuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
   sBtnKdTemu.Click;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.sBtnGetOldOKClick(Sender: TObject);
var
  cRetNmOK, cRetCode, cRetZKpp, cRetNameD, cRetNameFull : ShortString;
  nKdOK : SmallInt;
begin
  nKdOK := dbePrevKdOK.Field.AsInteger;
  // >> z_dk2010
  if TFormDK2010.GetDkRkvzt(
    nKdOK, cRetNmOK, cRetCode, cRetZKpp, cRetNameD, cRetNameFull)
  then
    dbePrevKdOK.Field.AsInteger := nKdOk;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.dbeOldZ_kppExit(Sender: TObject);
// var cCode,cZ_Kpp,cNameD,cNameFull   : ShortString;
begin
(*
  cCOde  := dbeCode.Field.AsString;
  cZ_Kpp := dbeZ_kpp.Field.AsString;
  DmMain.GetNameD(cCode,cZ_Kpp,cNameD,cNameFull);
  dbeNameD.Field.AsString    := cNameD;
  dbeNameFull.Field.AsString := cNameFull;
  (Sender as TDBEdit).Color := clWindow;
*)
end;

//------------------------------------------------------------------------------
procedure TFormEPere.sBtnGetNewOKClick(Sender: TObject);
var
  nKdOK: SmallInt;
  cRetNmOK, cRetCode, cRetZKpp, cRetNameD, cRetNameFull: ShortString;
begin
  // передаем только KodOK, остальные поля определяюся по onCalc
  nKdOK := dbeNewKdOK.Field.AsInteger;
  // z_dk2010
  if TFormDK2010.GetDkRkvzt(
    nKdOK, cRetNmOK, cRetCode, cRetZKpp, cRetNameD, cRetNameFull)
  then
    dbeNewKdOK.Field.AsInteger := nKdOk;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.DbChBoxBMEnter(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEPere.DbChBoxBMExit(Sender: TObject);
begin
  (Sender as TDBCheckBox).Color := clBtnFace;

  if not dbChBoxBM.Checked then
    dbeDtBM.Field.AsString := '';

  dbeDtBM.Visible := dbChBoxBM.Checked;
  if dbChBoxBM.Checked then
    dbeDtBM.SetFocus;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.FormPaint(Sender: TObject);
begin
  dbeDtBM.Visible := dbChBoxBM.Checked;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.dbeKdObjExit(Sender: TObject);
begin
  // общий обработчик
  dbEditExit(Sender);

  if dbeKdObj.Field.AsInteger <> nOldKdObj then begin
    UpdateObjDependencies(dbeKdObj.Field.AsInteger);
  end;
end;

function TFormEPere.IsInsertMode: boolean;
begin
  Result := not IsEditMode;
end;

//------------------------------------------------------------------------------
function TFormEPere.IsEditMode: boolean;
begin
  Result := dsrcMain.State = dsEdit;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.SetDataSources(dsrcMain, dsrcParts: TDataSource);
begin
  dbeDtBeg.DataSource      := dsrcMain;
  dbeDtBM.DataSource       := dsrcMain;
  dbChBoxBM.DataSource     := dsrcMain;
  dbeShSps.DataSource      := dsrcMain;
  dbeKdSpZ.DataSource      := dsrcMain;
  dbeKdTemu.DataSource     := dsrcMain;
  dbeNmTemu.DataSource     := dsrcMain;
  dbeKdObj.DataSource      := dsrcMain;
  dbeShObj.DataSource      := dsrcMain;
  dbeKdKatP.DataSource     := dsrcMain;
  dbeShKatP.DataSource     := dsrcMain;
  dbeSO.DataSource         := dsrcMain;
  dbeShSO.DataSource       := dsrcMain;
  dbeOklTrf.DataSource     := dsrcMain;
  dbeSmCmbOkl.DataSource   := dsrcMain;
  dbeNPD.DataSource        := dsrcMain;
  dbePrcWrkTime.DataSource := dsrcMain;
  dbeAvans.DataSource      := dsrcMain;
  dbeSpAv.DataSource       := dsrcMain;
  dbeDolgn.DataSource      := dsrcMain;
  dbeInv.DataSource        := dsrcMain;
  dbeNrPrikaza.DataSource  := dsrcMain;
  dbeDtPrikaza.DataSource  := dsrcMain;
  dbeSPZ.DataSource        := dsrcMain;
  dbePdNlg.DataSource      := dsrcMain;
  dbeShPdNlg.DataSource    := dsrcMain;
  dbeSovm.DataSource       := dsrcMain;
  dbeShSovm.DataSource     := dsrcMain;
  dbeProcLG.DataSource     := dsrcMain;
  dbeNotes.DataSource      := dsrcMain;
  dbChBoxPens.DataSource   := dsrcMain;
  DBChBoxProfs.DataSource  := dsrcMain;

  dbgrDPere.DataSource     := dsrcParts;
end;

procedure TFormEPere.FormShow(Sender: TObject);
begin
  dbcheckElTrudKn.Checked :=
      dbcheckElTrudKn.DataSource.DataSet.FieldByName('IS_PERE').AsString = 'Y';
end;

//------------------------------------------------------------------------------
procedure TFormEPere.dbeInvExit(Sender: TObject);
var
  Field: TField;
begin
  Field := (Sender as TDBEdit).Field;

  if Field.AsInteger = 0 then
    Field.AsString := '';

  DbEditExit(Sender);
end;

//------------------------------------------------------------------------------
procedure TFormEPere.PopPositionsPopup(Sender: TObject);
var
  ClipBoard: TClipboard;
begin
  NShowPrevPos.Checked := DmUsrSetts.ShowPrevPosition;
  NShowOldPos.Checked := DmUsrSetts.ShowOldPosName;
  NFlatView.Checked := DmUsrSetts.ShowPosFlat;

  NCopy.Enabled := ActiveControl is TDbEdit
    and ((ActiveControl as TDbEdit).SelText <> '');

  NCut.Enabled := ActiveControl is TDbEdit
    and ((ActiveControl as TDbEdit).SelText <> '');

  Clipboard := TClipboard.Create;
  NInsert.Enabled := ActiveControl is TDbEdit and (Clipboard.AsText <> '');
  Clipboard.Free;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.NShowPrevPosClick(Sender: TObject);
begin
  NShowPrevPos.Checked := not NShowPrevPos.Checked;
  DmUsrSetts.ShowPrevPosition := NShowPrevPos.Checked;

  if DmUsrSetts.ShowPrevPosition then
    ShowPrevPosition
  else
    HidePrevPosition;

  RepaintPanels;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.NShowOldPosClick(Sender: TObject);
begin
  NShowOldPos.Checked := not NShowOldPos.Checked;
  DmUsrSetts.ShowOldPosName := NShowOldPos.Checked;

  if DmUsrSetts.ShowOldPosName then
    ShowOldPosName
  else
    HideOldPosName;
    
  RepaintPanels;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.NFlatViewClick(Sender: TObject);
begin
  NFlatView.Checked := not NFlatView.Checked;
  DmUsrSetts.ShowPosFlat := NFlatView.Checked;
  RepaintPanels;
end;

//------------------------------------------------------------------------------
procedure TFormEPere.ShowPrevPosition;
begin
  ClientHeight := ClientHeight + PanelPrevPos.Height;
  PanelPrevPos.Visible := true;
  PanelPrevPos.Top := PanelNICh.Top + PanelNICh.Height;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.HidePrevPosition;
begin
  PanelPrevPos.Visible := false;
  ClientHeight := ClientHeight - PanelPrevPos.Height;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.ShowOldPosName;
begin
  ClientHeight := ClientHeight + PanelOldPos.Height;
  PanelOldPos.Visible := true;
  PanelOldPos.Top := PanelNewPos.Top + PanelNewPos.Height;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.HideOldPosName;
begin
  PanelOldPos.Visible := false;
  ClientHeight := ClientHeight - PanelOldPos.Height;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.RepaintPanels;
var
  Flat: Boolean;
  I: Integer;
begin
  Flat := DmUsrSetts.ShowPosFlat;
  I := 0;

  PaintPanel(PanelDate, Flat, I);
  PaintPanel(PanelDept, Flat, I);
  PaintPanel(PanelSalary, Flat, I);
  PaintPanel(PanelNICh, Flat, I);
  PaintPanel(PanelPrevPos, Flat, I);
  PaintPanel(PanelNewPos, Flat, I);
  PaintPanel(PanelOldPos, Flat, I);
  PaintPanel(PanelOthers, Flat, I);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.PaintPanel(Panel: TPanel; Flat: Boolean; var I: Integer);
var
  Bevel: TBevelCut;
  Color: TColor;
begin
  if not Panel.Visible then
    exit;

  if Flat then begin
    Bevel := bvNone;
    
    if Panel = PanelNewPos then
      Color := clMoneyGreen
    else
      Color := clBtnFace;
  end else begin
    Bevel := bvRaised;

    if I mod 2 = 0 then
      Color := clMoneyGreen
    else
      Color := clBtnFace;
  end;

  Panel.BevelOuter := Bevel;
  Panel.Color := Color;

  Inc(I);
end;

//------------------------------------------------------------------------------
procedure TFormEPere.NCopyClick(Sender: TObject);
begin
  if ActiveControl is TDbEdit then
    if (ActiveControl as TDbEdit).SelText <> '' then
      (ActiveControl as TDbEdit).CopyToClipboard;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.NInsertClick(Sender: TObject);
begin
  if ActiveControl is TDbEdit then
    (ActiveControl as TDbEdit).PasteFromClipboard;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormEPere.NCutClick(Sender: TObject);
begin
  if ActiveControl is TDbEdit then
    (ActiveControl as TDbEdit).CutToClipboard;
end;

end.
