unit z_PrBln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, DBTables, ExtCtrls,
  Menus, SickPregCmn;

type
  TFormPrBln = class(TForm)
    Panel1: TPanel;
    qryPrBln: TQuery;
    dsrcPrBln: TDataSource;
    updPrBln: TUpdateSQL;
    dbgrPrBln: TDBGrid;
    qryPrBlnNR: TIntegerField;
    qryPrBlnPRBLN: TSmallintField;
    qryPrBlnNMPRBLN: TStringField;
    qryPrBlnNOTES: TStringField;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    qryTmp: TQuery;
    qryPrBlnDigital: TStringField;
    qryPrBlnBlnType: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popPopup(Sender: TObject);
    procedure dbgrPrBlnEnter(Sender: TObject);
    procedure dbgrPrBlnExit(Sender: TObject);
    procedure dbgrPrBlnDblClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure qryPrBlnAfterPost(DataSet: TDataSet);
    procedure qryPrBlnNewRecord(DataSet: TDataSet);
    procedure qryPrBlnBeforePost(DataSet: TDataSet);
    procedure dbgrPrBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrPrBlnColEnter(Sender: TObject);
    procedure dbgrPrBlnColExit(Sender: TObject);
  private
    { Private declarations }
    bVuborMode : boolean;
    procedure OpenQryPrBln(eBlnType: TBlnType; nPrBln: SmallInt);
    procedure AdjustColumns;
  public
    { Public declarations }
  end;

procedure ShwPrBln(nPrBln : SmallInt);
function GetPrBln(eBlnType: TBlnType; var nPrBln : SmallInt; var cNmPrBln : ShortString) : boolean;
function CheckPrBln(nPrBln : SmallInt; var  cNmPrBln : ShortString) : boolean;

function PrBlnPickStmt(eBlnType: TBlnType; nPrBln: integer): string;

const SECTION = 'z_PrBln';

var
  FormPrBln: TFormPrBln;

implementation

uses A_Const, A_DM, Z_DM, z_EPrBln;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwPrBln(nPrBln : SmallInt);
begin
  FormPrBln := TFormPrBln.Create(Application);
  with FormPrBln do begin
    Caption := 'Причины нетрудоспособности';
    bBtnOk.Visible := false;
    bVuborMode := false;
    AdjustColumns;
    OpenQryPrBln(BlnTypeAll, nPrBln);
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
// Выбор причины выдачи больничного
//------------------------------------------------------------------------------
function GetPrBln(
  eBlnType    : TBlnType;              // тип больничного
  var nPrBln  : SmallInt;              // код причины
  var cNmPrBln: ShortString): boolean; // причина
begin
  FormPrBln := TFormPrBln.Create(Application);
  Result := false;

  with FormPrBln do begin
    Caption := 'Выбор причины нетрудоспособности';
    bBtnOk.Visible := true;
    bBtnCancel.Caption := 'Отказ';
    bVuborMode := true;
    AdjustColumns;
    OpenQryPrBln(eBlnType, nPrBln);
    if ShowModal = mrOk then begin
      nPrBln := qryPrBlnPrBln.AsInteger;
      cNmPrBln := qryPrBlnNmPrBln.AsString;
      Result := true;
    end;
    Free;
  end;
end;

//------------------------------------------------------------------------------
function CheckPrBln(nPrBln : SmallInt; var cNmPrBln : ShortString) : boolean;
begin
  Result := false;
  cNmPrBln := '';
  FormPrBln := TFormPrBln.Create(Application);
  with FormPrBln do begin
    OpenQryPrBln(BlnTypeAll, nPrBln);
    if qryPrBln.Locate('PrBln', nPrBln, []) then begin
      cNmPrBln := qryPrBlnNmPrBln.AsString;
      Result := true;
    end;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormPrBln.AdjustColumns;
var
  i: integer;
  column: TColumn;
begin
  for i := 0 to dbgrPrBln.Columns.Count - 1 do begin
    column := dbgrPrBln.Columns[i];
    if column.FieldName = 'BlnType' then
      column.Visible := not bVuborMode;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormPrBln.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 245);
    Width  := ReadInteger(SECTION, 'wW', 430);
    Free;
  end;

  if FileExists(cDirVids + 'PrBln_3.vid') then
    dbgrPrBln.Columns.LoadFromFile(cDirVids + 'PrBln_3.vid');
end;

//------------------------------------------------------------------------------
function SelectStmt(eBlnType: TBlnType): string;
var
  cDigital: ShortString;
begin
  cDigital := TBlnUtils.BlnTypeToDigital(eBlnType);

  Result := 'select * from Z_PrBln ';
  if cDigital <> '' then
    Result := Result + 'where Digital = "' + cDigital + '" ';
  Result := Result + 'order by PrBln';
end;

//------------------------------------------------------------------------------
// Выбирает категории больничных
//------------------------------------------------------------------------------
procedure TFormPrBln.OpenQryPrBln(
  eBlnType: TBlnType; // тип больничных
  nPrBln: SmallInt); // категория больничного
var
  cDigital: string;
begin
  InitQuery(qryPrBln);

  with qryPrBln do begin
    SQL.Add(SelectStmt(eBlnType));
    Open;

    if nPrBln <> 0 then
      Locate('PrBln', nPrBln, []);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormPrBln.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPrBln.Columns.SaveToFile(cDirVids + 'PrBln_3.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrBln.popPopup(Sender: TObject);
begin
  popEdt.Enabled := qryPrBln.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormPrBln.dbgrPrBlnEnter(Sender: TObject);
begin
  dbgrPrBln.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormPrBln.dbgrPrBlnExit(Sender: TObject);
begin
  dbgrPrBln.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormPrBln.dbgrPrBlnDblClick(Sender: TObject);
begin
  if bVuborMode and (qryPrBln.RecordCount > 0) then
    ModalResult := mrOk
  else if dbgrPrBln.SelectedField.FieldName = 'BlnType' then begin
    with qryPrBln do begin
      qryPrBln.Edit;
      if FieldByName('Digital').AsString = 'Y' then
        FieldByName('Digital').AsString := 'N'
      else
        FieldByName('Digital').AsString := 'Y';
      Post;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrBln.popEdtClick(Sender: TObject);
begin
  with qryPrBln do begin
    Edit;
    If EAPrBln then begin
      Post;
      Form_DM.DbMain.ApplyUpdates([qryPrBln]); end
    else begin
      Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrBln.popAddClick(Sender: TObject); {z_EPrBln}
var nSvNr : integer;
begin
  nSvNr    := qryPrBlnNr.AsInteger;
  with qryPrBln do begin
    Append;
    If EAPrBln then begin
      Post;
      Form_DM.DbMain.ApplyUpdates([qryPrBln]); end
    else begin
      Cancel;
      Locate('Nr', nSvNr, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrBln.popDelClick(Sender: TObject);
var nDelPrBln : smallint;
    cNmPrBln  : shortString;
    cMsg      : shortString;
begin
 nDelPrBln    := qryPrBlnPrBln.AsInteger;
 cNmPrBln     := qryPrBlnNmPrBln.AsString;
 with qryTmp do begin
   if Active then Close;
   SQL.Clear;
   DataBaseName := CESMAIN;
   SQL.Add('Select first 1 PrBln from z_VBln where PrBln = :nDelPrBln');
   ParamByName('nDelPrBln').AsInteger := nDelPrBln;
   Open;
   If RecordCount > 0 then begin
       cMsg := 'Запись "' + cNmPrBln +
               '" уже используется в таблице Z_VBln. Удаление не допускается.';
     ShowMessage(cMsg);
     Close;
     SQL.Clear;
     DataBaseName := '';
     Exit;
   end;
   Close;
   SQL.Clear;
   DataBaseName := '';
 end;
 if MessageDlg(C_PREDDELMSG, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    qryPrBln.Delete;
    Form_DM.DbMain.ApplyUpdates([qryPrBln]);
 end;
end;
//------------------------------------------------------------------------------
procedure TFormPrBln.qryPrBlnAfterPost(DataSet: TDataSet);
begin
 If qryPrBln.UpdatesPending then
   Form_DM.DbMain.ApplyUpdates([qryPrBln]);
end;
//------------------------------------------------------------------------------
procedure TFormPrBln.qryPrBlnNewRecord(DataSet: TDataSet);
var nNewPrBln : smallint;
begin
 with qryTmp do begin
   if Active then Close;
   SQL.Clear;
   DataBaseName := CESMAIN;
   SQL.Add('Select max(prBln) as maxbln from z_prBln');
   Open;
   nNewPrBln := fieldByName('maxbln').AsInteger;
   inc(nNewPrBln);
   Close;
 end;
 qryPrBlnPrBln.AsInteger := nNewPrBln;
end;

procedure TFormPrBln.qryPrBlnBeforePost(DataSet: TDataSet);
var nNewNr : integer;
begin
  with qryTmp do begin
    nNewNr := 1;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_Id(Z_PRBLN_NR, 1) Z_PRBLN_NR from rdb$database');
    Open;
    if RecordCount > 0 then
       nNewNr := FieldByName('Z_PRBLN_NR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  qryPrBlnNr.AsInteger :=  nNewNr;
end;

//------------------------------------------------------------------------------
function PrBlnPickStmt(eBlnType: TBlnType; nPrBln: integer): string;
var
  cDigital: ShortString;
begin
  cDigital := TBlnUtils.BlnTypeToDigital(eBlnType);

  Result := 'select * from Z_PrBln ';
  Result := Result + 'where ';
  if cDigital <> '' then
    Result := Result + 'Digital = "' + cDigital + '" and ';
  Result := Result + 'PrBln = ' + IntToStr(nPrBln);
end;

//------------------------------------------------------------------------------
procedure TFormPrBln.dbgrPrBlnDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  cValue: string;
begin
  if Column.FieldName = 'BlnType' then begin
    if Column.Field.DataSet.FieldByName('Digital').AsString = 'Y' then
      cValue := 'Цифр.'
    else
      cValue := '';
    dbgrPrBln.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, cValue);
  end;
end;

procedure TFormPrBln.dbgrPrBlnColEnter(Sender: TObject);
begin
  if dbgrPrBln.SelectedField.FieldName = 'BlnType' then begin
    dbgrPrBln.ShowHint := true;
    dbgrPrBln.Hint := 'Двойной щелчок для изменения значения';
  end;
end;

procedure TFormPrBln.dbgrPrBlnColExit(Sender: TObject);
begin
  if dbgrPrBln.SelectedField.FieldName = 'BlnType' then
    dbgrPrBln.ShowHint := false;
end;

end.
