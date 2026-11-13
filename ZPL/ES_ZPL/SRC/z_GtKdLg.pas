unit z_GtKdLg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DBTables, DB, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Menus;

type
  TFormKdLgt = class(TForm)
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dbgrKdLgt: TDBGrid;
    qryKdLgt: TQuery;
    dsrcKdLgt: TDataSource;
    qryKdLgtNR: TIntegerField;
    qryKdLgtKDLGT: TSmallintField;
    qryKdLgtSHLGT: TStringField;
    qryKdLgtNMLGT: TStringField;
    qryKdLgtNOTES: TStringField;
    updKdLgt: TUpdateSQL;
    qryKdLgtOZN_PILG: TSmallintField;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    qryTmp: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrKdLgtDblClick(Sender: TObject);
    procedure dbgrKdLgtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrKdLgtEnter(Sender: TObject);
    procedure dbgrKdLgtExit(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
  private
    { Private declarations }
    nSvKdLgt : SmallInt;
    bVuborMode : boolean;
    procedure OpenQryKdLgt;
    function GetNewKdLgt : SmallInt;
  public
    { Public declarations }
  end;

function GetKdLgt(var nKdLgt, nOznPilg : SmallInt;
                                 var cShLgt, cNmLgt : ShortString) : boolean;
function CheckKdLgt(var nKdLgt, nOznPilg : SmallInt;
                                 var cShLgt, cNmLgt : ShortString) : boolean;
procedure ShwKdLgt;

const SECTION = 'z_GtKdLg';

var
  FormKdLgt: TFormKdLgt;

implementation

uses A_DM, a_Const, z_Dm, z_Main, z_EAKdLg;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwKdLgt;
begin
  FormKdLgt := TFormKdLgt.Create(Application);
  with FormKdLgt do begin
    Caption := 'Справочник льгот';
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Закрыть';
    bVuborMode := false;
    OpenQryKdLgt;
    if nSvKdLgt > 0 then
      qryKdLgt.Locate('KdLgt', nSvKdLgt, []);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function CheckKdLgt(var nKdLgt, nOznPilg : SmallInt;
                                 var cShLgt, cNmLgt : ShortString) : boolean;
begin
//  Result := false;
  FormKdLgt := TFormKdLgt.Create(Application);
  with FormKdLgt do begin
    bVuborMode := false;
    OpenQryKdLgt;
    if qryKdLgt.Locate('KdLgt', nKdLgt, []) then begin
      nOznPilg := qryKdLgtOzn_Pilg.AsInteger;
      cShLgt   := qryKdLgtShLgt.AsString;
      cNmLgt   := qryKdLgtNmLgt.AsString;
      Result   := true; end
    else begin
      nOznPilg := 0;
      cShLgt   := '';
      cNmLgt   := '';
      Result   := false;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetKdLgt(var nKdLgt, nOznPilg : SmallInt;
                                 var cShLgt, cNmLgt : ShortString) : boolean;
begin
  Result := false;
  FormKdLgt := TFormKdLgt.Create(Application);
  with FormKdLgt do begin
    Caption := 'Выбор льготы';
    bVuborMode := true;
    OpenQryKdLgt;
    if nKdLgt > 0 then
      qryKdLgt.Locate('KdLgt', nKdLgt, [])
    else if nSvKdLgt > 0 then
      qryKdLgt.Locate('KdLgt', nSvKdLgt, []);
    if ShowModal = mrOk then begin
      nKdLgt   := qryKdLgtKdLgt.AsInteger;
      nOznPilg := qryKdLgtOzn_Pilg.AsInteger;
      cShLgt   := qryKdLgtShLgt.AsString;
      cNmLgt   := qryKdLgtNmLgt.AsString;
      Result   := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.OpenQryKdLgt;
begin
  with qryKdLgt do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdLgt order by KdLgt');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 225);
    Width  := ReadInteger(SECTION, 'wW', 465);
    nSvKdLgt := ReadInteger(SECTION, 'nSvKdLgt', 0);
    Free;
  end;
  if FileExists(cDirVids + 'GtKdLgt1.vid') then
    dbgrKdLgt.Columns.LoadFromFile(cDirVids + 'GtKdLgt1.vid');
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrKdLgt.Columns.SaveToFile(cDirVids + 'GtKdLgt1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvKdLgt', qryKdLgtKdLgt.AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.dbgrKdLgtDblClick(Sender: TObject);
begin
  if bVuborMode and (qryKdLgt.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.dbgrKdLgtKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if bVuborMode and (qryKdLgt.RecordCount > 0) and
                             (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.dbgrKdLgtEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.dbgrKdLgtExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.popEdtClick(Sender: TObject);
begin
  with qryKdLgt do begin
    Edit;
    if EAKdLgt then begin
      Post;
      if UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryKdLgt]); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
function TFormKdLgt.GetNewKdLgt: SmallInt;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdLgt) as MaxKd from Z_KdLgt');
    Open;
    Result := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.popAddClick(Sender: TObject);
var nSvNR : integer; nNewKdLgt : SmallInt;
begin
  with qryKdLgt do begin
    nSvNR := qryKdLgtNR.AsInteger;
    nNewKdLgt := GetNewKdLgt;
    Append;
    FieldByName('KdLgt').AsInteger := nNewKdLgt;
    if EAKdLgt then begin
      Post;
      if UpdatesPending then
        Form_Dm.DbMain.ApplyUpdates([qryKdLgt]); end
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
;
end;
//------------------------------------------------------------------------------
procedure TFormKdLgt.popDelClick(Sender: TObject);
var bCanDelete : boolean; nKdLgt : SmallInt; cShLgt : ShortString;
begin
  nKdLgt := qryKdLgtKdLgt.AsInteger;
  cShLgt := qryKdLgtShLgt.AsString;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Z_Lgotu where KdLgt = :nKdLgt');
    ParamByName('nKdLgt').AsInteger := nKdLgt;
    Open;
    bCanDelete := RecordCount = 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if not bCanDelete then
    ShowMessage('Нельзя удалять запись с кодом ' + IntToStr(nKdLgt) +
                ' (' + cShLgt + ').' + #13#10 +
                               'На  неё  есть  ссылки  в  таблице  "Льготы".')
  else if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                            [mbYes, mbNo], 0) = mrYes then begin
    qryKdLgt.Delete;
    Form_Dm.DbMain.ApplyUpdates([qryKdLgt]);
  end;
end;

end.
