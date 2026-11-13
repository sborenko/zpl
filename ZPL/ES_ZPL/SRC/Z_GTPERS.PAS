unit Z_GtPers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, Menus,
  DBClient, ExtCtrls;

type
  TFormKatPers = class(TForm)
    dbgrKatPers: TDBGrid;
    qryKatPers: TQuery;
    dsrcKatPers: TDataSource;
    updKatPers: TUpdateSQL;
    qryKatPersNR: TIntegerField;
    qryKatPersKDKATP: TSmallintField;
    qryKatPersSHKATP: TStringField;
    qryKatPersNMKATP: TStringField;
    qryTmp: TQuery;
    popMnu: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    cdsTmp: TClientDataSet;
    popSep: TMenuItem;
    popSets: TMenuItem;
    popSetFont: TMenuItem;
    popSetFon: TMenuItem;
    PanelButtons: TPanel;
    sBtnSelCurrent: TSpeedButton;
    sBtnSelAll: TSpeedButton;
    sBtnUnSelAll: TSpeedButton;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure qryKatPersAfterPost(DataSet: TDataSet);
    procedure qryKatPersBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrKatPersDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgrKatPersKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure sBtnSelCurrentClick(Sender: TObject);
    procedure dbgrKatPersDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnSelAllClick(Sender: TObject);
    procedure sBtnUnSelAllClick(Sender: TObject);
    procedure popSetFontClick(Sender: TObject);
    procedure popSetFonClick(Sender: TObject);
  private
    { Private declarations }
    bVuborMode, bNaborMode, bNabor2Mode : boolean;
    m_LstKatP : TStringList;
    cFontName : ShortString;
    nFontSize : word;
    bFontBold, bFontItalic : boolean;
    mDbgrColor : TColor;
    procedure SetTabsFont;
    procedure SetTabsFon;
  public
    { Public declarations }
  end;

function NaborKatPers(nKdKatP : integer; mLstKatP : TStrings) : boolean;
function Nabor2KatPers(nKdKatP : integer; cdsKatP : TClientDataSet) : boolean;
function GetKatPers(var nKdKatPers : integer;
                       var cShKatPers, cNmKatPers : string) : boolean;
procedure KatPersShowModal;

const SECTION = 'Z_GtPers';

var
  FormKatPers: TFormKatPers;

implementation

uses A_Const, Z_DM, z_Main, Z_EKatP, A_DM;

{$R *.DFM}

//------------------------------------------------------------------------------
function Nabor2KatPers(nKdKatP : integer; cdsKatP : TClientDataSet) : boolean;
var nSvTmpNR : integer;
begin
  Result := false;
  FormKatPers := TFormKatPers.Create(Application);
  with FormKatPers do begin
    bVuborMode := false;
    bNaborMode := false;
    bNabor2Mode := true;
    qryKatPers.Open;
    if nKdKatP <> 0 then
      qryKatPers.Locate('KdKatP', nKdKatP, []);
    Caption := 'Набор категорий персонала';
    cdsTmp := cdsKatP;
    m_LstKatP := TStringList.Create;
    if cdsTmp.Active and (cdsTmp.RecordCount > 0) then with cdsTmp do begin
      nSvTmpNR := FieldByName('NR').AsInteger;
      DisableControls;
      First;
      while not Eof do begin
        m_LstKatP.Add(FieldByName('KdKatP').AsString);
        Next;
      end;
      Locate('NR', nSvTmpNR, []);
      EnableControls;
    end;
    sBtnSelCurrent.Visible := true;
    sBtnSelAll.Visible := true;
    sBtnUnSelAll.Visible := true;
    popMnu.AutoPopup := false;
    bBtnOk.Caption := 'Ввод';
    if (ShowModal = mrOk) then
      Result := true
    else begin
      if cdsTmp.RecordCount > 0 then begin
        cdsTmp.First;
        while not cdsTmp.Eof do begin
          cdsTmp.Delete;
        end;
      end;
    end;
    m_LstKatP.Destroy;
    qryKatPers.Close;
    if Result then with DmMain.qryKatPers_LU do begin
      Close;
      Open;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function NaborKatPers(nKdKatP : integer; mLstKatP : TStrings) : boolean;
begin
  Result := false;
  FormKatPers := TFormKatPers.Create(Application);
  with FormKatPers do begin
    bVuborMode := false;
    bNaborMode := true;
    bNabor2Mode := false;
    qryKatPers.Open;
    if nKdKatP <> 0 then
      qryKatPers.Locate('KdKatP', nKdKatP, []);
    Caption := 'Набор категорий персонала';
    m_LstKatP := TStringList.Create;
    m_LstKatP.Assign(mLstKatP);
    sBtnSelCurrent.Visible := true;
    sBtnSelAll.Visible := true;
    sBtnUnSelAll.Visible := true;
    popMnu.AutoPopup := false;
    bBtnOk.Caption := 'Ввод';
    if (ShowModal = mrOk) {and (m_LstKatP.Count > 0)} then begin
      mLstKatP.Assign(m_LstKatP);
      Result := true;
    end;
    m_LstKatP.Destroy;
    qryKatPers.Close;
    if Result then with DmMain.qryKatPers_LU do begin
      Close;
      Open;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetKatPers(var nKdKatPers : integer;
                       var cShKatPers, cNmKatPers : string) : boolean;
begin
  Result := false;
  FormKatPers := TFormKatPers.Create(Application);
  with FormKatPers do begin
    bVuborMode := true;
    bNaborMode := false;
    bNabor2Mode := false;
    qryKatPers.Open;
    if nKdKatPers <> 0 then
      qryKatPers.Locate('KdKatP', nKdKatPers, []);
    Caption := 'Выбор категории персонала';
    if ShowModal = mrOk then begin
      nKdKatPers := qryKatPers.FieldByName('KdKatP').asInteger;
      cShKatPers := qryKatPers.FieldByName('ShKatP').asString;
      cNmKatPers := qryKatPers.FieldByName('NmKatP').asString;
      Result := true;
    end;
    qryKatPers.Close;
    if Result then with DmMain.qryKatPers_LU do begin
      Close;
      Open;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure KatPersShowModal;
begin
  FormKatPers := TFormKatPers.Create(Application);
  with FormKatPers do begin
    bVuborMode := false;
    bNaborMode := false;
    bNabor2Mode := false;
    qryKatPers.Open;
    Caption := 'Категории персонала';
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    ShowModal;
    qryKatPers.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.qryKatPersAfterPost(DataSet: TDataSet);
begin
  with qryKatPers do begin
    ApplyUpdates;
    Close;
    Open;
  end;
  DmMain.qryKatPers_LU.Close;
  DmMain.qryKatPers_LU.Open;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.qryKatPersBeforePost(DataSet: TDataSet);
var nNewKdKatP : integer;
begin
  if qryKatPers.State = dsInsert then begin
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := qryKatPers.DataBaseName;
      SQL.Add('Select max(KdKatP) as MaxKat from Z_KatPers');
      Open;
      if (RecordCount <> 0) and
                             (not FieldByName('MaxKat').isNull) then
        nNewKdKatP := FieldByName('MaxKat').asInteger + 1
      else
        nNewKdKatP := 1;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
    qryKatPers.FieldByName('KdKatP').asInteger := nNewKdKatP;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 225);
    Width  := ReadInteger(SECTION, 'wW', 322);
    cFontName   := ReadString(SECTION, 'cFN', 'Arial');
    nFontSize   := ReadInteger(SECTION, 'cFS', 8);
    bFontBold   := ReadBool(SECTION, 'bFB', true);
    bFontItalic := ReadBool(SECTION, 'bFI', false);
    mDbgrColor  := ReadInteger(SECTION, 'DbgrClr', clInfoBk);
    Free;
  end;
  if FileExists(cDirVids + 'z_GtPers.vid') then
    dbgrKatPers.Columns.LoadFromFile(cDirVids + 'z_GtPers.vid');
  SetTabsFont;
  SetTabsFon;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrKatPers.Columns.SaveToFile(cDirVids + 'z_GtPers.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteString(SECTION, 'cFN', cFontName);
    WriteInteger(SECTION, 'cFS', nFontSize);
    WriteBool(SECTION, 'bFB', bFontBold);
    WriteBool(SECTION, 'bFI', bFontItalic);
    WriteInteger(SECTION, 'DbgrClr', mDbgrColor);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.dbgrKatPersDblClick(Sender: TObject);
begin
  if bVuborMode and not bNaborMode and not bNabor2Mode and
                                           (qryKatPers.RecordCount <> 0) then
    ModalResult := mrOk
  else if not bVuborMode and (bNaborMode or bNabor2Mode) and
                             (qryKatPers.RecordCount <> 0) then
    sBtnSelCurrent.Click;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.FormCloseQuery(Sender: TObject;
                                              var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and
         ((qryKatPers.FieldByName('ShKatP').asString = '') or
          (qryKatPers.FieldByName('NmKatP').asString = '')) then begin
    ModalResult := mrNone;
    CanClose := false;
    ShowMessage('Такие данные выбирать нельзя - заполните поля');
    dbgrKatPers.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.dbgrKatPersKeyDown(Sender: TObject;
                                  var Key: Word; Shift: TShiftState);
begin
  if (bNaborMode or bNabor2Mode) and (Key = VK_F8) and (Shift = []) and
                                  (qryKatPers.RecordCount <> 0) then
    sBtnSelCurrent.Click
  else if bVuborMode and (Key = VK_RETURN) and (Shift = [ssCtrl]) and
                                  (qryKatPers.RecordCount <> 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.popEdtClick(Sender: TObject);
begin
  with qryKatPers do begin
    Edit;
    if AddEdtKatPers {Z_EKatP} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  with qryKatPers do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    if AddEdtKatPers {Z_EKatP} then
      Post
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.popDelClick(Sender: TObject);
var bCanDelete : boolean; nDelKdKatP : integer;
begin
//  bCanDelete := true;
  nDelKdKatP := qryKatPersKdKatP.AsInteger;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count(*) as CNT from Z_Pere where (KdKatP = :nDelKdKatP)');
    ParamByName('nDelKdKatP').AsInteger := nDelKdKatP;
    Open;
    bCanDelete := FieldByName('CNT').AsInteger = 0;
    Close;
    if bCanDelete then begin
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select Count(*) as CNT from Z_Nadb where (KdKatP = :nDelKdKatP)');
      ParamByName('nDelKdKatP').AsInteger := nDelKdKatP;
      Open;
      bCanDelete := FieldByName('CNT').AsInteger = 0;
      Close;
    end;
    if bCanDelete then begin
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select Count(*) as CNT from Z_Otkl where (KdKatP = :nDelKdKatP)');
      ParamByName('nDelKdKatP').AsInteger := nDelKdKatP;
      Open;
      bCanDelete := FieldByName('CNT').AsInteger = 0;
      Close;
    end;
    if bCanDelete then begin
      SQL.Clear;
      DataBaseName := CESMAIN; 
      SQL.Add('Select Count(*) as CNT from Z_NU where (KdKatP = :nDelKdKatP)');
      ParamByName('nDelKdKatP').AsInteger := nDelKdKatP;
      Open;
      bCanDelete := FieldByName('CNT').AsInteger = 0;
      Close;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if not bCanDelete then begin
    ShowMessage('Нельзя удалять эту запись - на нее ' + #13#10 +
                'есть  ссылки  в  других  таблицах  БД');
    Exit; end
  else if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                             mtWarning, [mbYes, mbNo], 0) = mrYes then
    qryKatPers.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.popMnuPopup(Sender: TObject);
begin
  popEdt.Enabled := qryKatPers.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.sBtnSelCurrentClick(Sender: TObject);
var i, nKdKatP : integer;
begin
  i := m_LstKatP.IndexOf(qryKatPers.FieldByName('KdKatP').AsString);
  if i < 0 then begin
    m_LstKatP.Add(qryKatPers.FieldByName('KdKatP').AsString);
    cdsTmp.Append;
    cdsTmp.FieldByName('KdKatP').AsInteger :=
                             qryKatPers.FieldByName('KdKatP').AsInteger;
    cdsTmp.FieldByName('ShKatP').AsString :=
                             qryKatPers.FieldByName('ShKatP').AsString;
    cdsTmp.FieldByName('NmKatP').AsString :=
                             qryKatPers.FieldByName('NmKatP').AsString;
    cdsTmp.Post; end
  else begin
    nKdKatP := StrToInt(m_LstKatP[i]);
    m_LstKatP.Delete(i);
    if cdsTmp.Locate('KdKatP', nKdKatP, []) then
      cdsTmp.Delete;
  end;
  if not qryKatPers.Eof then
    qryKatPers.Next
  else
    dbgrKatPers.Refresh;
  sBtnUnSelAll.Enabled := m_LstKatP.Count > 0;
  sBtnSelAll.Enabled := m_LstKatP.Count < qryKatPers.RecordCount;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.dbgrKatPersDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  if not bNaborMode and not bNabor2Mode then Exit;
  with dbgrKatPers.Canvas do begin
    if not (gdFocused in State) then begin
      if m_LstKatP.IndexOf(qryKatPers.FieldByName('KdKatP').AsString) >= 0 then
        Font.Color := clRed
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrKatPers.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.sBtnSelAllClick(Sender: TObject);
var nSvNr, nKdKatP : integer;
begin
  m_LstKatP.Clear;
  with qryKatPers do begin
    nSvNR := FieldByName('NR').AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      m_LstKatP.Add(FieldByName('KdKatP').AsString);
      nKdKatP := FieldByName('KdKatP').AsInteger;
      if not cdsTmp.Locate('KdKatP', nKdKatP, []) then begin
        cdsTmp.Append;
        cdsTmp.FieldByName('KdKatP').AsInteger :=
                             qryKatPers.FieldByName('KdKatP').AsInteger;
        cdsTmp.FieldByName('ShKatP').AsString :=
                             qryKatPers.FieldByName('ShKatP').AsString;
        cdsTmp.FieldByName('NmKatP').AsString :=
                             qryKatPers.FieldByName('NmKatP').AsString;
        cdsTmp.Post;
      end;
      Next;
    end;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
    EnableControls;
  end;
  sBtnUnSelAll.Enabled := true;
  sBtnSelAll.Enabled := false;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.sBtnUnSelAllClick(Sender: TObject);
begin
  m_LstKatP.Clear;
  dbgrKatPers.Refresh;
  sBtnUnSelAll.Enabled := false;
  sBtnSelAll.Enabled := true;
  if cdsTmp.RecordCount > 0 then begin
    cdsTmp.First;
    while not cdsTmp.Eof do begin
      cdsTmp.Delete;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.popSetFontClick(Sender: TObject);
begin
  with FormZpMain.FontDialog1 do begin
    Font := dbgrKatPers.Font;
    if Execute then begin
      cFontName   := Font.Name;
      nFontSize   := Font.Size;
      bFontItalic := (fsItalic in Font.Style);
      bFontBold   := (fsBold in Font.Style);
      SetTabsFont;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.popSetFonClick(Sender: TObject);
begin
  with FormZpMain.ColorDialog1 do begin
    Color := mDbgrColor;
    if Execute then begin
      mDbgrColor := Color;
      SetTabsFon;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.SetTabsFont;
var mFontStyle : TFontStyles;
begin
  if bFontItalic and bFontBold then
    mFontStyle := [fsBold, fsItalic]
  else if bFontBold then
    mFontStyle := [fsBold]
  else if bFontItalic then
    mFontStyle := [fsItalic]
  else
    mFontStyle := [];
  dbgrKatPers.Font.Name      := cFontName;
  dbgrKatPers.TitleFont.Name := cFontName;
  dbgrKatPers.Font.Size      := nFontSize;
  dbgrKatPers.TitleFont.Size := nFontSize;
  dbgrKatPers.Font.Style     := mFontStyle;
end;
//------------------------------------------------------------------------------
procedure TFormKatPers.SetTabsFon;
begin
  dbgrKatPers.Color := mDbgrColor;
end;

end.
