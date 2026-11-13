unit Z_GtOpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Db, Grids, DBGrids, IniFiles,
  Menus, DBTables;

type
  TFormGetSysOpl = class(TForm)
    dbgrOpl: TDBGrid;
    dsrcOpl: TDataSource;
    popMnu: TPopupMenu;
    popMnuEdt: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuDel: TMenuItem;
    qryTmp: TQuery;
    popSep: TMenuItem;
    popSets: TMenuItem;
    popSetFont: TMenuItem;
    popSetFon: TMenuItem;
    PanelButtons: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrOplDblClick(Sender: TObject);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuAddClick(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure dbgrOplKeyDown(Sender: TObject; var Key: Word;
                                        Shift: TShiftState);
    procedure popSetFontClick(Sender: TObject);
    procedure popSetFonClick(Sender: TObject);
  private
    { Private declarations }
    bVuborMode : boolean;
    cFontName : ShortString;
    nFontSize : word;
    bFontBold, bFontItalic : boolean;
    mDbgrColor : TColor;
    procedure SetTabsFont;
    procedure SetTabsFon;
  public
    { Public declarations }
  end;

function GetSysOpl(var nKdOpl : integer;
                                       var cNmOpl : string) : boolean;
procedure SysOplShowModal;

const SECTION = 'Z_GtOpl';

var
  FormGetSysOpl: TFormGetSysOpl;

implementation

uses A_Const, A_DM, Z_DM, z_Main;

{$R *.DFM}

//--------------------------------------------------------------------
procedure SysOplShowModal;
begin
  FormGetSysOpl := TFormGetSysOpl.Create(Application);
  with FormGetSysOpl do begin
    Caption := 'Системы оплаты';
    bVuborMode := false;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    if not dsrcOpl.DataSet.Active then
      dsrcOpl.DataSet.Open;
    ShowModal;
    Free;
  end;
end;
//--------------------------------------------------------------------
function GetSysOpl(var nKdOpl : integer;
                                       var cNmOpl : string) : boolean;
begin
  Result := false;
  FormGetSysOpl := TFormGetSysOpl.Create(Application);
  with FormGetSysOpl do begin
    Caption := 'Выбор системы оплаты';
    bVuborMode := true;
    if not dsrcOpl.DataSet.Active then
      dsrcOpl.DataSet.Open;
    if nKdOpl > 0 then
      dsrcOpl.DataSet.Locate('KdOpl', nKdOpl, []);
    if ShowModal = mrOk then begin
      nKdOpl := dsrcOpl.DataSet.FieldByName('KdOpl').asInteger;
      cNmOpl := dsrcOpl.DataSet.FieldByName('NmOpl').asString;
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 131);
    cFontName   := ReadString(SECTION, 'cFN', 'Arial');
    nFontSize   := ReadInteger(SECTION, 'cFS', 8);
    bFontBold   := ReadBool(SECTION, 'bFB', true);
    bFontItalic := ReadBool(SECTION, 'bFI', false);
    mDbgrColor  := ReadInteger(SECTION, 'DbgrClr', clInfoBk);
    Free;
  end;
  if FileExists(cDirVids + 'z_Gt_Opl.vid') then
    dbgrOpl.Columns.LoadFromFile(cDirVids + 'z_Gt_Opl.vid');
  SetTabsFont;
  SetTabsFon;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  dbgrOpl.Columns.SaveToFile(cDirVids + 'z_Gt_Opl.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteString(SECTION, 'cFN', cFontName);
    WriteInteger(SECTION, 'cFS', nFontSize);
    WriteBool(SECTION, 'bFB', bFontBold);
    WriteBool(SECTION, 'bFI', bFontItalic);
    WriteInteger(SECTION, 'DbgrClr', mDbgrColor);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.dbgrOplDblClick(Sender: TObject);
begin
  if bVuborMode and (dsrcOpl.DataSet.RecordCount <> 0) then
    ModalResult := mrOk;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.dbgrOplKeyDown(Sender: TObject;
                                   var Key: Word; Shift: TShiftState);
begin
  if bVuborMode and (Key = VK_RETURN) and (Shift = [ssCtrl]) and
                             (dsrcOpl.DataSet.RecordCount <> 0) then
    ModalResult := mrOk;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.popMnuPopup(Sender: TObject);
begin
  popMnuEdt.Enabled := dsrcOpl.DataSet.RecordCount <> 0;
  popMnuDel.Enabled := popMnuEdt.Enabled;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.popMnuEdtClick(Sender: TObject);
var cNmOpl : string; nEdtNR : integer;
begin
  cNmOpl := dsrcOpl.DataSet.FieldByName('NmOpl').asString;
  if InputQuery('Редактирование',
      'Введите новое название', cNmOpl) and (cNmOpl <> '') then begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    nEdtNR := dsrcOpl.DataSet.FieldByName('NR').asInteger;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Update Z_SysOpl set NmOpl = :cNmOpl ' +
              ' where NR = :nEdtNR');
      ParamByName('cNmOpl').asString  := cNmOpl;
      ParamByName('nEdtNR').asInteger := nEdtNR;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with dsrcOpl.DataSet do begin
      Close;
      Open;
      Locate('NR', nEdtNR, []);
    end;
    Screen.Cursor := crDefault;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.popMnuAddClick(Sender: TObject);
var cNmOpl : string; nKdOpl : integer;
begin
  cNmOpl := 'Новая система оплаты';
  if InputQuery('Новая запись',
                     'Введите название системы оплаты', cNmOpl) and
                                          (cNmOpl <> '') then begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select Max(KdOpl) as MaxKdOpl from Z_SysOpl');
      Open;
      if (RecordCount <> 0) and
                    (FieldByName('MaxKdOpl').asInteger > 0) then
        nKdOpl := FieldByName('MaxKdOpl').asInteger + 1
      else
        nKdOpl := 1;
      Close;
      SQL.Clear;
      SQL.Add('Insert into Z_SysOpl ' +
              ' (KdOpl, NmOpl) values (:nKdOpl, :cNmOpl)');
      ParamByName('nKdOpl').asSmallInt := nKdOpl;
      ParamByName('cNmOpl').asString   := cNmOpl;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    with dsrcOpl.DataSet do begin
      Close;
      Open;
      Locate('KdOpl', nKdOpl, []);
    end;
    Screen.Cursor := crDefault;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.popMnuDelClick(Sender: TObject);
var nDelKdOpl, nSvNR : integer; bEof, bDeleted : boolean;
begin
  nDelKdOpl := dsrcOpl.DataSet.FieldByName('KdOpl').asInteger;
  bDeleted := false;
  bEof := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count(*) as CntOpl from Z_Pere ' +
            ' where SO = :nDelKdOpl');
    ParamByName('nDelKdOpl').asSmallInt := nDelKdOpl;
    Open;
    if (RecordCount <> 0) and
                    (FieldByName('CntOpl').asInteger > 0) then
      MessageDlg('Нельзя удалять эту запись - ссылки' + #13#10 +
               'на нее есть в других таблицах !', mtError, [mbOk], 0)
    else if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                     mtWarning, [mbYes, mbNo], 0) = mrYes then begin
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      Close;
      SQL.Clear;
      SQL.Add('Delete from Z_SysOpl where KdOpl = :nDelKdOpl');
      ParamByName('nDelKdOpl').asSmallInt := nDelKdOpl;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
      bDeleted := true;
    end;
  end;
  if bDeleted then with dsrcOpl.DataSet do begin
    DisableControls;
    Next;
    nSvNR := 0;
    if Eof then bEof := true
    else nSvNR := FieldByName('NR').asInteger;
    Close;
    Open;
    if bEof then Last
    else Locate('NR', nSvNR, []);
    EnableControls;
  end;
  Screen.Cursor := crDefault;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.popSetFontClick(Sender: TObject);
begin
  with FormZpMain.FontDialog1 do begin
    Font := dbgrOpl.Font;
    if Execute then begin
      cFontName   := Font.Name;
      nFontSize   := Font.Size;
      bFontItalic := (fsItalic in Font.Style);
      bFontBold   := (fsBold in Font.Style);
      SetTabsFont;
    end;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.SetTabsFont;
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
  dbgrOpl.Font.Name      := cFontName;
  dbgrOpl.TitleFont.Name := cFontName;
  dbgrOpl.Font.Size      := nFontSize;
  dbgrOpl.TitleFont.Size := nFontSize;
  dbgrOpl.Font.Style     := mFontStyle;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.popSetFonClick(Sender: TObject);
begin
  with FormZpMain.ColorDialog1 do begin
    Color := mDbgrColor;
    if Execute then begin
      mDbgrColor := Color;
      SetTabsFon;
    end;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetSysOpl.SetTabsFon;
begin
  dbgrOpl.Color := mDbgrColor;
end;

end.
