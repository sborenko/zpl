unit a_ZUObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, StdCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Menus;

type
  String1 = String[1];
  TFormZUsrObj = class(TForm)
    PanelTools: TPanel;
    bBtnClose: TBitBtn;
    sBtnChPodkl: TSpeedButton;
    Splitter1: TSplitter;
    PanelLeft: TPanel;
    dbgrUsrObj: TDBGrid;
    qryUsrObj: TQuery;
    dsrcUsrObj: TDataSource;
    qryUsrObjNR: TIntegerField;
    qryUsrObjKDUSR: TSmallintField;
    qryUsrObjKDSPS: TSmallintField;
    qryUsrObjKDOBJ: TSmallintField;
    qryUsrObjSHOBJ: TStringField;
    qryUsrObjNMOBJ: TStringField;
    qryUsrObjAINDX: TSmallintField;
    qryUsrObjPINDX: TSmallintField;
    qryUsrObjLVL: TSmallintField;
    qryUsrObjINDX: TSmallintField;
    qryUsrObjHSCH: TStringField;
    qryUsrObjFIOUPOLN: TStringField;
    qryUsrObjKDSPZ: TSmallintField;
    qrySpsAdd: TQuery;
    dsrcSpsAdd: TDataSource;
    qryUsrObjDTBPROC: TDateTimeField;
    qryUsrObjDTEPROC: TDateTimeField;
    qrySpsAddKDUSR: TSmallintField;
    qrySpsAddKDSPS: TSmallintField;
    qrySpsAddKDOBJ: TSmallintField;
    qrySpsAddTABN: TIntegerField;
    qrySpsAddDTBPROC: TDateTimeField;
    qrySpsAddDTEPROC: TDateTimeField;
    qrySpsAddFamIO: TStringField;
    PanelMid: TPanel;
    dbgrSpsAdd: TDBGrid;
    PanelRight: TPanel;
    PanelMsg: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    pop: TPopupMenu;
    popAddInCurrentTabel: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    popSep1: TMenuItem;
    popHead: TMenuItem;
    updSpsAdd: TUpdateSQL;
    qrySpsAddNR: TIntegerField;
    updUsrObj: TUpdateSQL;
    qryTmp: TQuery;
    Label1: TLabel;
    Label2: TLabel;
    LstBxTabN: TListBox;
    LabelChPodkl: TLabel;
    sBtnAddNePodkl: TSpeedButton;
    popSort: TMenuItem;
    popSortByFIO: TMenuItem;
    popSortByTabN: TMenuItem;
    NSep2: TMenuItem;
    NLoadFromFile: TMenuItem;
    qrySpsAddPOL: TStringField;
    qrySpsAddID: TStringField;
    NSearch: TMenuItem;
    NSrchTabN: TMenuItem;
    NSrchFam: TMenuItem;
    qrySpsAddFam: TStringField;
    qrySpsAddIma: TStringField;
    qrySpsAddOtch: TStringField;
    procedure qrySpsAddCalcFields(DataSet: TDataSet);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure popAddInCurrentTabelClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure dbgrUsrObjDblClick(Sender: TObject);
    procedure dbgrSpsAddDblClick(Sender: TObject);
    procedure sBtnChPodklClick(Sender: TObject);
    procedure dbgrSpsAddDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryUsrObjAfterScroll(DataSet: TDataSet);
    procedure sBtnAddNePodklClick(Sender: TObject);
    procedure popSortByFIOClick(Sender: TObject);
    procedure popSortByTabNClick(Sender: TObject);
    procedure NLoadFromFileClick(Sender: TObject);
    procedure NSrchTabNClick(Sender: TObject);
    procedure NSrchFamClick(Sender: TObject);
  private
    n_KdUsr : SmallInt;
    d_DtPrc, dSvDtBeg : TDateTime;
    procedure OpenQryUsrObj(nKdUsr : SmallInt; dDtPrc : TDateTime);
    procedure OpenQrySpsAdd(DtProc: TDateTime);
    procedure SetdbgrUsrObjColumns;
    procedure AddTabN(TabN: Integer);
    function CopyFilterFunc(FldName: ShortString): Boolean;
  public
    class procedure Run(UserId: Integer; DtProc: TDateTime; DeptId: Integer);
  end;

const SECTION = 'a_ZUObj';

var
  FormZUsrObj: TFormZUsrObj;

implementation

uses
  a_Const, a_Dm, a_EZUObj, a_EZUSps, a_Lib, z_Dm, DsLib, QryLib, FormGetStr,
  FormGetTxt;

{$R *.dfm}


class procedure TFormZUsrObj.Run(
  UserId: Integer;
  DtProc: TDateTime;
  DeptId: Integer
);
var bSvFlagDbg : boolean;
begin
  FormZUsrObj := TFormZUsrObj.Create(Application);
  with FormZUsrObj do begin
    n_KdUsr := UserId;
    d_DtPrc := DtProc;

    if dSvDtBeg = 0 then
      dSvDtBeg := DtProc;

    bSvFlagDbg := bFlagDbg;
    if UserId = 101 then
      bFlagDbg := true;

    OpenQryUsrObj(UserId, DtProc);

    if (qryUsrObj.RecordCount = 0) and not bFlagDbg then
      ShowMessage(
        'Нет  подразделений  для  Вас.'#13#10'Обратитесь к Администратору.')
    else begin
      QryUsrObj.Locate('KdUsr;KdObj', VarArrayOf([nAppKdUsr, DeptId]), []);

      OpenQrySpsAdd(DtProc);
      ShowModal;
    end;
    bFlagDbg := bSvFlagDbg;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.OpenQryUsrObj(nKdUsr : SmallInt; dDtPrc : TDateTime);
begin
  with qryUsrObj do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if bFlagDbg or (nKdUsr in [101, 102, 127]) then begin
      SQL.Add('Select * from ViZUsrObj where ' +
              ' DtBProc <= :dDtPrc and ' +
              ' (DtEProc is NULL or DtEProc >= :dDtPrc) ' +
              ' order by KdUsr, KdObj');
      ParamByName('dDtPrc').AsDateTime := dDtPrc;
      dbgrUsrObj.Color := clCream;
      ActiveControl := dbgrUsrObj; end
    else begin
      SQL.Add('Select * from ViZUsrObj where KdUsr = :nKdUsr and ' +
              ' DtBProc <= :dDtPrc and ' +
              ' (DtEProc is NULL or DtEProc >= :dDtPrc) ' +
              ' order by KdObj');
      ParamByName('nKdUsr').AsInteger := nKdUsr;
      ParamByName('dDtPrc').AsDateTime := dDtPrc;
      dbgrUsrObj.Color := clBtnFace;
      ActiveControl := dbgrSpsAdd;
    end;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.SetdbgrUsrObjColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrUsrObj.Columns.Count-1 do begin
    with dbgrUsrObj.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'KDUSR') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.OpenQrySpsAdd(DtProc: TDateTime);
var
  SvTabN: Integer;
begin
  with QrySpsAdd do begin
    if Active then
      SvTabN := FieldByName('TabN').AsInteger;

    QryUtils.InitQuery(QrySpsAdd);
    DataSource := DsrcUsrObj;

    SQL.Text :=
      'select * ' +
      'from ViZUsrTabsN ' +
      'where KdObj = :KdObj ' +
        'and DtBProc <= :DtProc ';

    if popSortByTabN.Checked then
      SQL.Add('order by TabN')
    else
      SQL.Add('order by Fam, Ima, Otch');

    ParamByName('DtProc').AsDateTime := DtProc;
    Open;

    if SvTabN > 0 then
      Locate('TabN', SvTabN, []);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZUsrObj.qrySpsAddCalcFields(DataSet: TDataSet);
begin
  QrySpsAddFamIO.AsString := QrySpsAddFam.AsString + ' ' +
    Copy(QrySpsAddIma.AsString, 1, 1) + '.' +
    Copy(QrySpsAddOtch.AsString, 1, 1) + '.';
end;

//------------------------------------------------------------------------------
procedure TFormZUsrObj.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.FormCreate(Sender: TObject);
begin
  Caption := 'Сотрудники для Ваших подразделений';
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 50);
	  Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 785);
    PanelLeft.Width := ReadInteger(SECTION, 'pnlLeftW', 265);
    dSvDtBeg := ReadInteger(SECTION, 'dSvDtBeg', 0);
    popSortByTabN.Checked := ReadBool(SECTION, 'bSortFIO', true);
    popSortByFIO.Checked := not popSortByTabN.Checked;
	  Free;
  end;
  if FileExists(cDirVids + 'UsrObj01.vid') then
    dbgrUsrObj.Columns.LoadFromFile(cDirVids + 'UsrObj01.vid');
  if FileExists(cDirVids + 'UsrObj02.vid') then
    dbgrSpsAdd.Columns.LoadFromFile(cDirVids + 'UsrObj02.vid');
  LstBxTabN.Clear;
  LabelChPodkl.Visible := false;
  sBtnAddNePodkl.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryUsrObj.Active then
    dbgrUsrObj.Columns.SaveToFile(cDirVids + 'UsrObj01.vid');
  if qrySpsAdd.Active then
    dbgrSpsAdd.Columns.SaveToFile(cDirVids + 'UsrObj02.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'pnlLeftW', PanelLeft.Width);
    WriteInteger(SECTION, 'dSvDtBeg', Round(dSvDtBeg));
    WriteBool(SECTION, 'bSortFIO', popSortByTabN.Checked);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.FormResize(Sender: TObject);
begin
  PanelMsg.Top := Round((PanelRight.Height - PanelMsg.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.popPopup(Sender: TObject);
var
  ItemsVisible: Boolean;
begin
  if pop.PopupComponent = dbgrUsrObj then begin
    popHead.Caption := '== Подразделения пользователей ==';
    PopAdd.Enabled := bFlagDbg;
    popEdt.Enabled := bFlagDbg and (QryUsrObj.RecordCount > 0);
    popDel.Enabled := popEdt.Enabled;
  end else begin
    popHead.Caption := '== Ваши сотрудники ==';
    PopAdd.Enabled := qryUsrObj.Active and (qryUsrObj.RecordCount > 0);
    popEdt.Enabled := qrySpsAdd.RecordCount > 0;
    popDel.Enabled := popEdt.Enabled;
    popAddInCurrentTabel.Enabled := popEdt.Enabled;
  end;

  ItemsVisible := pop.PopupComponent = dbgrSpsAdd;

  popAddInCurrentTabel.Visible := ItemsVisible;
  popSort.Visible              := ItemsVisible;
  NLoadFromFile.Visible        := ItemsVisible;
  NSep2.Visible                := ItemsVisible;
end;

//------------------------------------------------------------------------------
procedure TFormZUsrObj.popAddInCurrentTabelClick(Sender: TObject);
var nTabN : integer; nKdSps, nKdObj, nKdKatP : SmallInt; cMsg : ShortString;
    nY, nM, nD : word;
begin
  nTabN  := qrySpsAddTabN.AsInteger;
  nKdObj := qryUsrObjKdObj.AsInteger;
  nKdSps := qrySpsAddKdSps.AsInteger;
  nKdKatP := 0;
  DecodeDate(d_DtPrc, nY, nM, nD);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_Sps where TabN = :nTabN and ' +
            ' DtProc = :dDtPrc and KdObj = :nKdObj');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('nKdObj').AsInteger  := nKdObj;
    ParamByName('dDtPrc').AsDateTime := d_DtPrc;
    Open;
    if Locate('TabN;DtProc;KdObj',
                   VarArrayOf([nTabN, d_DtPrc, nKdObj]), []) then begin
      cMsg := 'Сотрудник ТабНр ' + IntToStr(nTabN) + ' ' +
              qrySpsAddFamIO.AsString + ' уже есть в' + #13#10 +
              'табельном списке подразделения ' + IntToStr(nKdObj) +
              ' в ' +  MesPredlogn(nM) + ' ' + IntToStr(nY) + ' г.';
      ShowMessage(cMsg); end
    else begin
      cMsg := 'Подключить сотрудника ТабНр ' +  IntToStr(nTabN) + ' ' +
              qrySpsAddFamIO.AsString + ' в' + #13#10 +
              'табельный список подразделения ' + IntToStr(nKdObj) + ' за ' +
              MesRus(nM) + ' ' + IntToStr(nY) + ' г.?:';
      if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
        Close;
        SQL.Clear;
        SQL.Add('Select First 5 * from z_Pere where TabN = :nTabN and ' +
                ' Dt_Beg <= :dDtBeg order by Dt_Beg desc');
        ParamByName('nTabN').AsInteger := nTabN;
        ParamByName('dDtBeg').AsDateTime := d_DtPrc;
        Open;
        while not Eof do begin
          if FieldByName('Dt_Beg').AsDateTime <= d_DtPrc then begin
            nKdKatP := FieldByName('KdKatP').AsInteger;
            Break;
          end;
          Next;
        end;
        Close;
        SQL.Clear;
        SQL.Add('Insert into z_Sps (KdSps, DtProc, TabN, KdObj, KdKatP) ' +
                ' values (:nKdSps, :dDtPrc, :nTabN, :nKdObj, :nKdKatP)');
        ParamByName('nKdSps').AsInteger  := nKdSps;
        ParamByName('nTabN').AsInteger   := nTabN;
        ParamByName('nKdObj').AsInteger  := nKdObj;
        ParamByName('nKdKatP').AsInteger := nKdKatP;
        ParamByName('dDtPrc').AsDateTime := d_DtPrc;
        ExecSQL;
      end;
    end;
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.popEdtClick(Sender: TObject);
var nSvNR, nTabN : integer; cLogMsg : ShortString;
begin
  if pop.PopupComponent = dbgrUsrObj then with qryUsrObj do begin
    nSvNR := FieldByName('NR').AsInteger;
    Edit;
    if EAUsrObj {a_EZUObj} then begin
      Post;
      Form_Dm.DbMain.ApplyUpdates([qryUsrObj]);
      Close;
      Open;
      Locate('NR', nSvNR, []); end
    else
      Cancel; end
  else if pop.PopupComponent = dbgrSpsAdd then with qrySpsAdd do begin
    nSvNR := FieldByName('NR').AsInteger;
    Edit;
    // a_EZUSps
    if TFormEAUsrSps.Run(FieldByName('FamIO').AsString) then begin
      Post;
      nTabN := qrySpsAddTabN.AsInteger;
      cLogMsg := 'TabN = ' + qrySpsAddTabN.AsString +
                 ', FamIO = ' + FieldByName('FamIO').AsString +
                 ', DtBProc = ' + FieldByName('DtBProc').AsString +
                 ', DtEProc = ' + FieldByName('DtEProc').AsString +
                 ', KdObj = ' + FieldByName('KdObj').AsString +
                 ', KdSps = ' + FieldByName('KdSps').AsString;
      Form_Dm.DbMain.ApplyUpdates([qrySpsAdd]);
      Close;
      Open;
      Locate('NR', nSvNR, []);
      // Сделать запись в DbLog
      Form_Dm.AddLog(Now, nTabN,
                        'Ред. Z_SpsAdd', gc_AppNmUsr, 'Z_SpsAdd', cLogMsg); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.dbgrUsrObjDblClick(Sender: TObject);
begin
  if bFlagDbg and (qryUsrObj.RecordCount > 0) then begin
    pop.PopupComponent := dbgrUsrObj;
    popEdt.Click;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.dbgrSpsAddDblClick(Sender: TObject);
begin
  if (qrySpsAdd.RecordCount > 0) then begin
    pop.PopupComponent := dbgrSpsAdd;
    popEdt.Click;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.popAddClick(Sender: TObject);
var nSvNR, nTabN, nKdUsr : integer; cLogMsg : ShortString;
begin
  if pop.PopupComponent = dbgrUsrObj then with qryUsrObj do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    if EAUsrObj {a_EZUObj} then begin
      Post;
      nKdUsr := FieldByName('KdUsr').AsInteger;
      Form_Dm.DbMain.ApplyUpdates([qryUsrObj]);
      Close;
      Open;
      Locate('KdUsr', nKdUsr, []); end
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end; end
  else if pop.PopupComponent = dbgrSpsAdd then with qrySpsAdd do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    FieldByName('KdUsr').AsInteger := qryUsrObj.FieldByName('KdUsr').AsInteger;
    FieldByName('KdSps').AsInteger := qryUsrObj.FieldByName('KdSps').AsInteger;
    FieldByName('KdObj').AsInteger := qryUsrObj.FieldByName('KdObj').AsInteger;
    FieldByName('DtBProc').AsDateTime := dSvDtBeg;

    // a_EZUSps
    if TFormEAUsrSps.Run(FieldByName('FamIO').AsString) then begin
      Post;
      dSvDtBeg := FieldByName('DtBProc').AsDateTime;
      nTabN := FieldByName('TabN').AsInteger;
      cLogMsg := 'TabN = ' + qrySpsAddTabN.AsString +
                 ', FamIO = ' + FieldByName('FamIO').AsString +
                 ', DtBProc = ' + FieldByName('DtBProc').AsString +
                 ', DtEProc = ' + FieldByName('DtEProc').AsString +
                 ', KdObj = ' + FieldByName('KdObj').AsString +
                 ', KdSps = ' + FieldByName('KdSps').AsString;
      Form_Dm.DbMain.ApplyUpdates([qrySpsAdd]);
      Close;
      Open;
      Locate('TabN', nTabN, []);
      // Сделать запись в DbLog
      Form_Dm.AddLog(Now, nTabN,
                        'Ввод Z_SpsAdd', gc_AppNmUsr, 'Z_SpsAdd', cLogMsg); end
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.popDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                                          [mbYes, mbNo], 0) = mrYes then begin
    if pop.PopupComponent = dbgrUsrObj then with qryUsrObj do begin
      qryUsrObj.Delete;
      Form_Dm.DbMain.ApplyUpdates([qryUsrObj]); end
    else if pop.PopupComponent = dbgrSpsAdd then begin
      qrySpsAdd.Delete;
      Form_Dm.DbMain.ApplyUpdates([qrySpsAdd]);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.DateFieldSetText(Sender: TField;
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
procedure TFormZUsrObj.sBtnChPodklClick(Sender: TObject);
var nSvNR : integer; nCntInObj, nCntPodkl : SmallInt;
begin
  LstBxTabN.Clear;
  LabelChPodkl.Caption := '';
  sBtnAddNePodkl.Visible := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_Sps where TabN = :nTabN and ' +
            ' DtProc = :dDtPrc and KdObj = :nKdObj');
    ParamByName('nKdObj').AsInteger  := qryUsrObjKdObj.AsInteger;
    ParamByName('dDtPrc').AsDateTime := d_DtPrc;
    Prepare;
  end;
  nCntInObj := 0;
  nCntPodkl := 0;
  with qrySpsAdd do begin
    nSvNR := qrySpsAddNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      Inc(nCntInObj);
      qryTmp.Close;
      qryTmp.ParamByName('nTabN').AsInteger := qrySpsAddTabN.AsInteger;
      qryTmp.Open;
      if qryTmp.RecordCount > 0 then begin
        LstBxTabN.Items.Add(qryTmp.FieldByName('TabN').AsString);
        Inc(nCntPodkl);
      end;
      qryTmp.Close;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  with qryTmp do begin
    if Active then Close;
    if Prepared then
      UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  dbgrSpsAdd.Refresh;
  LabelChPodkl.Caption := 'Всего в списке: ' + IntToStr(nCntInObj) +
                          ', подключено: ' + IntToStr(nCntPodkl);
  LabelChPodkl.Visible := true;
  sBtnAddNePodkl.Visible := (nCntInObj <> nCntPodkl);
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.dbgrSpsAddDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrSpsAdd.Canvas do begin
    if not (gdFocused in State) then begin
      if LstBxTabN.Items.IndexOf(qrySpsAddTabN.AsString) >= 0 then
        Font.Color := clRed
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrSpsAdd.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.qryUsrObjAfterScroll(DataSet: TDataSet);
begin
  LstBxTabN.Clear;
  LabelChPodkl.Visible := false;
  sBtnAddNePodkl.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.sBtnAddNePodklClick(Sender: TObject);
var nSvNR : integer; nCntInObj, nCntPodkl : SmallInt;
begin
  // т.к. этот sBtn виден только сразу после проверки подключенных,
  // когда в LbxCgPodkl собраны все уже подключенные, то остается только
  // пройтись по qrySpsAdd и подключить не подключенных по LbxChPodkl
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_Sps (KdSps, DtProc, TabN, KdObj, KdKatP) ' +
                ' values (:nKdSps, :dDtPrc, :nTabN, :nKdObj, :nKdKatP)');
    Prepare;
  end;
  with qrySpsAdd do begin
    nCntInObj := 0;
    nCntPodkl := 0;
    nSvNR := qrySpsAddNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      Inc(nCntInObj);
      if LstBxTabN.Items.IndexOf(qrySpsAddTabN.AsString) < 0 then begin
        qryTmp.ParamByName('nKdSps').AsInteger  := qryUsrObjKdSps.AsInteger;
        qryTmp.ParamByName('nTabN').AsInteger   := qrySpsAddTabN.AsInteger;
        qryTmp.ParamByName('nKdObj').AsInteger  := qryUsrObjKdObj.AsInteger;
        qryTmp.ParamByName('nKdKatP').AsInteger := 0;
        qryTmp.ParamByName('dDtPrc').AsDateTime := d_DtPrc;
        qryTmp.ExecSQL;
        Inc(nCntPodkl);
        LstBxTabN.Items.Add(qrySpsAddTabN.AsString);
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  sBtnAddNePodkl.Visible := false;
  ShowMessage('Подключено в список текущего месяца: ' + IntToStr(nCntPodkl));
  with qryTmp do begin
    if Active then Close;
    if Prepared then
      UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.popSortByFIOClick(Sender: TObject);
begin
  if not popSortByFIO.Checked then begin
    popSortByFIO.Checked := true;
    popSortByTabN.Checked := false;
    OpenQrySpsAdd(d_DtPrc);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZUsrObj.popSortByTabNClick(Sender: TObject);
begin
  if not popSortByTabN.Checked then begin
    popSortByFIO.Checked := false;
    popSortByTabN.Checked := true;
    OpenQrySpsAdd(d_DtPrc);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZUsrObj.NLoadFromFileClick(Sender: TObject);
var
  EmplIds: String;
  TabNList: TStringList;
  I: Integer;
  TabN: ShortString;
begin
  EmplIds := '';

  if TFrmGetTxt.Run('Табельные № для добавления', EmplIds) then begin
    TabNList := TStringList.Create;

    with TabNList do begin
      Delimiter := ',';
      TabNList.DelimitedText := EmplIds;

      for I := 0 to TabNList.Count - 1 do begin
        TabN := Trim(Strings[I]);

        AddTabN(StrToInt(TabN));
      end;

      Free;
    end;

    Form_Dm.DbMain.ApplyUpdates([QrySpsAdd]);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormZUsrObj.AddTabN(TabN: Integer);
begin
  with QrySpsAdd do begin
    Append;
    DsUtils.CopyRecord(QryUsrObj, QrySpsAdd, nil, CopyFilterFunc);
    
    FieldByName('TabN').AsInteger := TabN;
    Post;
  end;
end;

//------------------------------------------------------------------------------
function TFormZUsrObj.CopyFilterFunc(FldName: ShortString): Boolean;
begin
  Result := UpperCase(FldName) <> 'NR';
end;

//------------------------------------------------------------------------------
procedure TFormZUsrObj.NSrchTabNClick(Sender: TObject);
var
  TabN: ShortString;
begin
  TabN := '';

  if TFrmGetStr.Run('Поиск по Таб.№', TabN) then
    try
      if not qrySpsAdd.Locate('TabN', StrToInt(TabN), []) then
        ShowMessage('Таб.№ ' + TabN + ' не найден.');
    except
      raise Exception.Create('Неправильный Таб.№');
    end;
end;

//------------------------------------------------------------------------------
procedure TFormZUsrObj.NSrchFamClick(Sender: TObject);
var
  Fam: ShortString;
  FamStr: String;
begin
  Fam := '';

  if TFrmGetStr.Run('Поиск по фамилии', Fam) then begin
    FamStr := Fam;
    FamStr := AnsiUpper(PAnsiChar(FamStr));

    if not QrySpsAdd.Locate('Fam', FamStr, []) then
      ShowMessage('Фамилия ' + Fam + ' не найдена.');
  end;
end;

end.
