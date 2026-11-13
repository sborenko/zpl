unit z_AddTSN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBClient, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons,
  DBTables, DBCtrls, Menus;

type
  TFormAddTrSoglInNdb = class(TForm)
    Panel1: TPanel;
    cdsNdb: TClientDataSet;
    dsrcNdb: TDataSource;
    bBtnCancel: TBitBtn;
    dbgrNdb: TDBGrid;
    qryTmp: TQuery;
    cdsNdbNR: TAutoIncField;
    cdsNdbTabN: TIntegerField;
    cdsNdbFamIO: TStringField;
    cdsNdbVidN: TStringField;
    cdsNdbDtBeg: TDateField;
    cdsNdbDtEnd: TDateField;
    cdsNdbDtPrBeg: TDateField;
    cdsNdbNrPrBeg: TStringField;
    cdsNdbDtPrEnd: TDateField;
    cdsNdbNrPrEnd: TStringField;
    cdsNdbNotes: TStringField;
    cdsNdbKdKatP: TSmallintField;
    cdsNdbKdObj: TSmallintField;
    cdsNdbKdSpZ: TSmallintField;
    cdsNdbShVidN: TStringField;
    DBNavigator1: TDBNavigator;
    LabelCntRec: TLabel;
    pop: TPopupMenu;
    popSortHead: TMenuItem;
    popSortByObjFIO: TMenuItem;
    popSortByFIO: TMenuItem;
    LabelSortMsg: TLabel;
    sBtnPrt: TSpeedButton;
    sBtnSave: TSpeedButton;
    sBtnF8: TSpeedButton;
    sBtnSelAll: TSpeedButton;
    sBtnUnSelAll: TSpeedButton;
    LbxF8: TListBox;
    LabelCntSelRec: TLabel;
    popSvPrt: TPopupMenu;
    popPrtSel: TMenuItem;
    popPrtUnSel: TMenuItem;
    popPrtAll: TMenuItem;
    popSvSel: TMenuItem;
    popSvUnSel: TMenuItem;
    popSvAll: TMenuItem;
    popEdtRecs: TMenuItem;
    cdsTmp: TClientDataSet;
    cdsTmpDtBeg: TDateField;
    cdsTmpDtEnd: TDateField;
    cdsTmpDtPrBeg: TDateField;
    cdsTmpDtPrEnd: TDateField;
    cdsTmpNrPrBeg: TStringField;
    cdsTmpNrPrEnd: TStringField;
    cdsTmpNotes: TStringField;
    cdsTmpEDtBeg: TBooleanField;
    cdsTmpEDtEnd: TBooleanField;
    cdsTmpEDtPrBeg: TBooleanField;
    cdsTmpEDtPrEnd: TBooleanField;
    cdsTmpENrPrBeg: TBooleanField;
    cdsTmpENrPrEnd: TBooleanField;
    cdsTmpENotes: TBooleanField;
    cdsNdbSovm: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popSortByObjFIOClick(Sender: TObject);
    procedure popSortByFIOClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure sBtnF8Click(Sender: TObject);
    procedure dbgrNdbDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnSelAllClick(Sender: TObject);
    procedure sBtnUnSelAllClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbgrNdbKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
    procedure sBtnSaveClick(Sender: TObject);
    procedure popPrtSelClick(Sender: TObject);
    procedure popPrtUnSelClick(Sender: TObject);
    procedure popPrtAllClick(Sender: TObject);
    procedure popSvSelClick(Sender: TObject);
    procedure popSvUnSelClick(Sender: TObject);
    procedure popSvAllClick(Sender: TObject);
    procedure bBtnCancelClick(Sender: TObject);
    procedure popEdtRecsClick(Sender: TObject);
    procedure cdsTmpDtBegSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
    n_NewNrPkt : integer;
    procedure CreOpenCdsNdb;
    procedure AddInCdsNdb1;
    procedure SetCdsNdbIndex;
    procedure SaveRecords(nSelCase : word);
    procedure EdtCdsNdb;
  public
    { Public declarations }
  end;

function AddSoglInNdb(var nNewNrPkt : integer) : boolean;

const SECTION = 'z_AddTSN';

var
  FormAddTrSoglInNdb: TFormAddTrSoglInNdb;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main, z_ENRecs, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddSoglInNdb(var nNewNrPkt : integer) : boolean;
begin
  Result := false;
  nNewNrPkt := -1;
  FormAddTrSoglInNdb := TFormAddTrSoglInNdb.Create(Application);
  with FormAddTrSoglInNdb do begin
    n_NewNrPkt := -1;
    Caption := '"Договорные" виды за 2013 год';
    CreOpenCdsNdb;
    SetCdsNdbIndex;
    cdsNdb.First;
    if ShowModal = mrOk then begin
      nNewNrPkt := n_NewNrPkt;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.CreOpenCdsNdb;
begin
  with cdsNdb do begin
    if Active then Close;
    CreateDataSet;
    Open;
    IndexName := '';
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Distinct n.Tabn, u.Fam, u.Ima, u.Otch ' +
            ' from z_NU n Left Outer Join z_Upi u on u.TabN = n.TabN ' +
            ' where n.ZaMesGod >= "01/01/2013" and ' +
            ' n.ZaMesGod < "01/01/2014" and ' +
            ' n.Vidn in ("1005","1006","1008") and ' +
            ' Exists(Select s.TabN from Z_Sps s ' +
            ' where s.DtProc = "12/01/2013" and s.TabN = n.TabN)');
    Open;
    while not Eof do begin
      AddInCdsNdb1;
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 * from ViNuMain where TabN = :TabN and ' +
            ' ZaMesGod >= "01/01/2013" and ZaMesGod < "01/01/2014" and ' +
            ' Vidn in ("1005","1006","1008") order by ZaMesGod');
    DataSource := dsrcNdb;
  end;
  with cdsNdb do begin
    First;
    qryTmp.Open;
    while not Eof do begin
      Edit;
      cdsNdbVidN.AsString   := qryTmp.FieldByName('VidN').AsString;
      cdsNdbShVidN.AsString := qryTmp.FieldByName('ShVidN').AsString;
      cdsNdbDtBeg.AsString  := qryTmp.FieldByName('ZaMesGod').AsString;
      cdsNdbKdKatP.AsString := qryTmp.FieldByName('KdKatP').AsString;
      cdsNdbKdObj.AsString  := qryTmp.FieldByName('KdObj').AsString;
      cdsNdbKdSpZ.AsString  := qryTmp.FieldByName('KdSpZ').AsString;
      Post;
      Next;
    end;
    //IndexName := 'OnKdObjFamIO';
    //First;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    LabelCntSelRec.Caption := 'Помечено: ' + IntToStr(LbxF8.Items.Count);
  end;
  with qryTmp do begin
    Close;
    SQL.Clear;
    SQL.Add('Select first 1 * from z_Pere where TabN = :TabN and ' +
            ' Dt_Beg <= "12/31/2013" order by Dt_Beg desc');
    DataSource := dsrcNdb;
  end;
  with cdsNdb do begin
    First;
    qryTmp.Open;
    while not Eof do begin
      Edit;
      cdsNdbSovm.AsString   := qryTmp.FieldByName('Sovm').AsString;
      Post;
      Next;
    end;
    First;
  end;
  with qryTmp do begin
    Close;
    SQL.Clear;
    DataSource := NIL;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.AddInCdsNdb1;
begin
  with cdsNdb do begin
    Append;
    cdsNdbTabN.AsInteger := qryTmp.FieldByName('TabN').AsInteger;
    cdsNdbFamIO.AsString := MyFamIO(qryTmp.FieldByName('Fam').AsString,
                                     qryTmp.FieldByName('Ima').AsString,
                                      qryTmp.FieldByName('Otch').AsString);
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 815);
    popSortByObjFIO.Checked := ReadBool(SECTION, 'bSortObFi', true);
    Free;
  end;
  popSortByFIO.Checked := not popSortByObjFIO.Checked;
  if FileExists(cDirVids + 'AddTsn.vid') then
    dbgrNdb.Columns.LoadFromFile(cDirVids + 'AddTsn.vid');
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.FormClose(Sender: TObject;
                                                      var Action: TCloseAction);
begin
  dbgrNdb.Columns.SaveToFile(cDirVids + 'AddTsn.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bSortObFi', popSortByObjFIO.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.popSortByObjFIOClick(Sender: TObject);
begin
  if not popSortByObjFIO.Checked then begin
    popSortByObjFIO.Checked := true;
    popSortByFIO.Checked := false;
    SetCdsNdbIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.popSortByFIOClick(Sender: TObject);
begin
  if not popSortByFIO.Checked then begin
    popSortByObjFIO.Checked := false;
    popSortByFIO.Checked := true;
    SetCdsNdbIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.SetCdsNdbIndex;
var nSvTabN : integer;
begin
  nSvTabN := cdsNdbTabN.AsInteger;
  if popSortByObjFIO.Checked then begin
    cdsNdb.IndexName := 'OnKdObjFamIO';
    LabelSortMsg.Caption := 'Сортировка: Подразделение, Фамилия И.О.'; end
  else begin
    cdsNdb.IndexName := 'OnFamIO';
    LabelSortMsg.Caption := 'Сортировка: Фамилия И.О.';
  end;
  if cdsNdbTabN.AsInteger <> nSvTabN then
    cdsNdb.Locate('TabN', nSvTabN, []);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.sBtnF8Click(Sender: TObject);
var i : SmallInt;
begin
  if cdsNdb.RecordCount > 0 then begin
    i := LbxF8.Items.IndexOf(cdsNdbNR.AsString);
    if i < 0 then
      LbxF8.Items.Add(cdsNdbNR.AsString)
    else
      LbxF8.Items.Delete(i);
    if not cdsNdb.Eof then
      cdsNdb.Next
    else
      dbgrNdb.Refresh;
  end;
  sBtnSelAll.Enabled   := LbxF8.Items.Count <> cdsNdb.RecordCount;
  sBtnUnSelAll.Enabled := LbxF8.Items.Count > 0;
  LabelCntSelRec.Caption := 'Помечено: ' + IntToStr(LbxF8.Items.Count);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.dbgrNdbDrawColumnCell(Sender: TObject;
                                          const Rect: TRect; DataCol: Integer;
                                        Column: TColumn; State: TGridDrawState);
begin
  with dbgrNdb.Canvas do begin
    if not (gdFocused in State) then begin
      if LbxF8.Items.IndexOf(cdsNdbNR.AsString) >= 0 then
        Brush.Color := clLime;
    end;
  end;
  dbgrNdb.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.sBtnSelAllClick(Sender: TObject);
var nSvNR : SmallInt;
begin
  with cdsNdb do begin
    LbxF8.Clear;
    nSvNR := cdsNdbNR.AsInteger;;
    DisableControls;
    First;
    while not Eof do begin
      LbxF8.Items.Add(cdsNdbNR.AsString);
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  sBtnSelAll.Enabled   := false;
  sBtnUnSelAll.Enabled := true;
  LabelCntSelRec.Caption := 'Помечено: ' + IntToStr(LbxF8.Items.Count);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.sBtnUnSelAllClick(Sender: TObject);
begin
  LbxF8.Clear;
  dbgrNdb.Refresh;
  sBtnSelAll.Enabled   := true;
  sBtnUnSelAll.Enabled := false;
  LabelCntSelRec.Caption := 'Помечено: ' + IntToStr(LbxF8.Items.Count);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.dbgrNdbKeyDown(Sender: TObject;
                                             var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) and sBtnF8.Enabled then
    sBtnF8.Click;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.sBtnSaveClick(Sender: TObject);
var X, Y : integer;
begin
  X := Left + sBtnSave.Left + 4;
  Y := Top  + sBtnSave.Top + 48;
  popPrtSel.Visible   := false;
  popPrtUnSel.Visible := false;
  popPrtAll.Visible   := false;
  popSvSel.Visible   := true;
  popSvUnSel.Visible := true;
  popSvAll.Visible   := true;
  popSvSel.Enabled   := (LbxF8.Items.Count > 0) and
                          (LbxF8.Items.Count <> cdsNdb.RecordCount);
  popSvUnSel.Enabled := (LbxF8.Items.Count > 0) and
                          (LbxF8.Items.Count <> cdsNdb.RecordCount);
  popSvAll.Enabled   := true;
  popSvPrt.Popup(X, Y);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.sBtnPrtClick(Sender: TObject);
var X, Y : integer;
begin
  X := Left + sBtnPrt.Left + 4;
  Y := Top  + sBtnPrt.Top + 48;
  popSvSel.Visible   := false;
  popSvUnSel.Visible := false;
  popSvAll.Visible   := false;
  popPrtSel.Visible   := true;
  popPrtUnSel.Visible := true;
  popPrtAll.Visible   := true;
  popPrtSel.Enabled   := (LbxF8.Items.Count > 0) and
                           (LbxF8.Items.Count <> cdsNdb.RecordCount);
  popPrtUnSel.Enabled := (LbxF8.Items.Count > 0) and
                           (LbxF8.Items.Count <> cdsNdb.RecordCount);
  popPrtAll.Enabled   := true;
  popSvPrt.Popup(X, Y);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.popPrtSelClick(Sender: TObject);
var nSelCase : word;
begin
  nSelCase := 1;
  F6PrtLstAddTSN(nSelCase, LbxF8, cdsNdb);  {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.popPrtUnSelClick(Sender: TObject);
var nSelCase : word;
begin
  nSelCase := 2;
  F6PrtLstAddTSN(nSelCase, LbxF8, cdsNdb);  {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.popPrtAllClick(Sender: TObject);
var nSelCase : word;
begin
  nSelCase := 3;
  F6PrtLstAddTSN(nSelCase, LbxF8, cdsNdb);  {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.popSvSelClick(Sender: TObject);
var nSelCase : word;
begin
  nSelCase := 1;
  SaveRecords(nSelCase);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.popSvUnSelClick(Sender: TObject);
var nSelCase : word;
begin
  nSelCase := 2;
  SaveRecords(nSelCase);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.popSvAllClick(Sender: TObject);
var nSelCase : word;
begin
  nSelCase := 3;
  SaveRecords(nSelCase);
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.SaveRecords(nSelCase: word);
var nCntSvRec, nSvNR : SmallInt;
begin
  nCntSvRec := 0;
  n_NewNrPkt := Form_Dm.GetNewNdbNrPkt;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
  end;
  with cdsNdb do begin
    nSvNR := cdsNdbNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      if (nSelCase = 3) or ((nSelCase = 1) and
                            (LbxF8.Items.IndexOf(cdsNdbNR.AsString) >= 0)) or
           ((nSelCase = 2) and
                       (LbxF8.Items.IndexOf(cdsNdbNR.AsString) < 0)) then begin
        qryTmp.SQL.Clear;
        qryTmp.SQL.Add('Insert into z_Nadb (TabN, VidN, Dt_Beg, ' +
                       ' SpsRsch, SP, SumProc, KdKatP, ' +
                       ' KdObj, KdSpZ, NrPrBeg, NrPrEnd, Notes, NrPkt');
        if not cdsNdbDtPrBeg.IsNull then
          qryTmp.SQL.Add(', DtPrBeg');
        if not cdsNdbDtEnd.IsNull then
          qryTmp.SQL.Add(', Dt_End');
        if not cdsNdbDtPrEnd.IsNull then
          qryTmp.SQL.Add(', DtPrEnd');
        qryTmp.SQL.Add(') values (:TabN, :VidN, :DtBeg, 4, "р", 0, :KdKatP, ' +
                ' :KdObj, :KdSpZ, :cNrPrBeg, :cNrPrEnd, :cNotes, :nNrPkt');
        if not cdsNdbDtPrBeg.IsNull then
          qryTmp.SQL.Add(', :dDtPrBeg');
        if not cdsNdbDtEnd.IsNull then
          qryTmp.SQL.Add(', :dDtEnd');
        if not cdsNdbDtPrEnd.IsNull then
          qryTmp.SQL.Add(', :dDtPrEnd');
        qryTmp.SQL.Add(')');
        qryTmp.ParamByName('TabN').AsInteger    := cdsNdbTabN.AsInteger;
        qryTmp.ParamByName('VidN').AsString     := cdsNdbVidN.AsString;
        qryTmp.ParamByName('DtBeg').AsDateTime  := cdsNdbDtBeg.AsDateTime;
        qryTmp.ParamByName('KdKatP').AsInteger  := cdsNdbKdKatP.AsInteger;
        qryTmp.ParamByName('KdObj').AsInteger   := cdsNdbKdObj.AsInteger;
        qryTmp.ParamByName('KdSpZ').AsInteger   := cdsNdbKdSpZ.AsInteger;
        qryTmp.ParamByName('cNrPrBeg').AsString := cdsNdbNrPrBeg.AsString;
        qryTmp.ParamByName('cNrPrEnd').AsString := cdsNdbNrPrEnd.AsString;
        qryTmp.ParamByName('cNotes').AsString   := cdsNdbNotes.AsString;
        qryTmp.ParamByName('nNrPkt').AsInteger  := n_NewNrPkt;
        if not cdsNdbDtPrBeg.IsNull then
          qryTmp.ParamByName('dDtPrBeg').AsDateTime := cdsNdbDtPrBeg.AsDateTime;
        if not cdsNdbDtEnd.IsNull then
          qryTmp.ParamByName('dDtEnd').AsDateTime := cdsNdbDtEnd.AsDateTime;
        if not cdsNdbDtPrEnd.IsNull then
          qryTmp.ParamByName('dDtPrEnd').AsDateTime := cdsNdbDtPrEnd.AsDateTime;
        qryTmp.ExecSQL;
        Inc(nCntSvRec);
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
  sBtnSave.Enabled     := false;
  sBtnF8.Enabled       := false;
  sBtnSelAll.Enabled   := false;
  sBtnUnselAll.Enabled := false;
  ShowMessage('Сохранено записей: ' + IntToStr(nCntSvRec));
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.bBtnCancelClick(Sender: TObject);
begin
  if n_NewNrPkt > 0 then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.popEdtRecsClick(Sender: TObject);
begin
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;
    cdsTmpEDtBeg.AsBoolean   := false;
    cdsTmpEDtEnd.AsBoolean   := false;
    cdsTmpEDtPrBeg.AsBoolean := false;
    cdsTmpEDtPrEnd.AsBoolean := false;
    cdsTmpENrPrBeg.AsBoolean := false;
    cdsTmpENrPrEnd.AsBoolean := false;
    cdsTmpENotes.AsBoolean   := false;
    if EdtAllNdb {z_ENRecs} then begin
      Post;
      if cdsTmpEDtBeg.AsBoolean or cdsTmpEDtPrBeg.AsBoolean or
             cdsTmpEDtEnd.AsBoolean or cdsTmpEDtPrEnd.AsBoolean or
                 cdsTmpENrPrBeg.AsBoolean or cdsTmpENrPrEnd.AsBoolean or
                                                 cdsTmpENotes.AsBoolean then
        EdtCdsNdb;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddTrSoglInNdb.cdsTmpDtBegSetText(Sender: TField;
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
procedure TFormAddTrSoglInNdb.EdtCdsNdb;
var nSvNR : integer;
begin
  with cdsNdb do begin
    nSvNR := cdsNdbNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      Edit;
      if cdsTmpEDtBeg.AsBoolean then
        cdsNdbDtBeg.AsString := cdsTmpDtBeg.AsString;
      if cdsTmpEDtPrBeg.AsBoolean then
        cdsNdbDtPrBeg.AsString := cdsTmpDtPrBeg.AsString;
      if cdsTmpENrPrBeg.AsBoolean then
        cdsNdbNrPrBeg.AsString := cdsTmpNrPrBeg.AsString;
      if cdsTmpEDtEnd.AsBoolean then
        cdsNdbDtEnd.AsString := cdsTmpDtEnd.AsString;
      if cdsTmpEDtPrEnd.AsBoolean then
        cdsNdbDtPrEnd.AsString := cdsTmpDtPrEnd.AsString;
      if cdsTmpENrPrEnd.AsBoolean then
        cdsNdbNrPrEnd.AsString := cdsTmpNrPrEnd.AsString;
      if cdsTmpENotes.AsBoolean then
        cdsNdbNotes.AsString := cdsTmpNotes.AsString;
      Post;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
end;

end.
