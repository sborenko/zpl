unit Z_ShwBnk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Grids, DBGrids, Menus, ExtCtrls;

type
  TFormShwBanki = class(TForm)
    dbgrBnk: TDBGrid;
    popMnu: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    PanelButtons: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure dbgrBnkDblClick(Sender: TObject);
  private
    b_VuborMode : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowZpBanki(nKdBnk : integer);
function GetZplBank(var nKdBnk : SmallInt;
                                   var cShBnk, cNmBnk : ShortString) : boolean;

const SECTION = 'z_ShwBnk';

var
  FormShwBanki: TFormShwBanki;

implementation

uses A_Const, Z_DM, Z_Main, Z_EBnk;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowZpBanki(nKdBnk : integer);
begin
  FormShwBanki := TFormShwBanki.Create(Application);
  with FormShwBanki do begin
    b_VuborMode := false;
    Caption := 'Обслуживающие банки';
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Закрыть';
    bBtnCancel.Spacing := 0;
    with dbgrBnk.DataSource.DataSet do begin
      if not Active then
        Open;
    end;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetZplBank(var nKdBnk : SmallInt;
                                   var cShBnk, cNmBnk : ShortString) : boolean;
begin
  Result := false;
  FormShwBanki := TFormShwBanki.Create(Application);
  with FormShwBanki do begin
    b_VuborMode := true;
    Caption := 'Выбор банка';
    with dbgrBnk.DataSource.DataSet do begin
      if not Active then
        Open;
      if nKdBnk <> 0 then
        Locate('KdBnk', nKdBnk, []);
    end;
    if ShowModal = mrOk then begin
      nKdBnk := dbgrBnk.DataSource.DataSet.FieldByName('KdBnk').AsInteger;
      cShBnk := dbgrBnk.DataSource.DataSet.FieldByName('ShBnk').AsString;
      cNmBnk := dbgrBnk.DataSource.DataSet.FieldByName('NmBnk').AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanki.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 201);
    Width  := ReadInteger(SECTION, 'wW', 300);
    Free;
  end;
  if FileExists(cDirVids + 'z_ShwBnk.vid') then
    dbgrBnk.Columns.LoadFromFile(cDirVids + 'z_ShwBnk.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwBanki.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrBnk.Columns.SaveToFile(cDirVids + 'z_ShwBnk.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanki.popEdtClick(Sender: TObject);
begin
  with dbgrBnk.DataSource.DataSet do begin
    Edit;
    if EABnk(dbgrBnk.DataSource) {Z_EBnk} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanki.popAddClick(Sender: TObject);
begin
  with dbgrBnk.DataSource.DataSet do begin
    Append;
    if EABnk(dbgrBnk.DataSource) {Z_EBnk} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanki.popDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                          mtWarning, [mbYes, mbNo], 0) = mrYes then
    dbgrBnk.DataSource.DataSet.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanki.dbgrBnkDblClick(Sender: TObject);
begin
  if b_VuborMode and (dbgrBnk.DataSource.DataSet.RecordCount > 0) then
    ModalResult := mrOk;
end;

end.
