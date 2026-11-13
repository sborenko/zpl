unit a_ShKSps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Grids, DBGrids, Menus, ExtCtrls;

type
  TFormKdSps = class(TForm)
    dbgrKdSps: TDBGrid;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    Panel1Buttons: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popPopup(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure dbgrKdSpsDblClick(Sender: TObject);
  private
    { Private declarations }
    bVuborMode : boolean;
  public
    { Public declarations }
  end;

procedure ShowKdSps(nKdSps : integer);
function GetKdSps(var nKdSps : integer; var cShSps, cNmSps : string) : boolean;

const SECTION = 'a_ShKSps';

var
  FormKdSps: TFormKdSps;

implementation

uses a_Const, a_Dm, {Z_DM,} {z_Main,} a_EKSps;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetKdSps(var nKdSps : integer; var cShSps, cNmSps : string) : boolean;
begin
  Result := false;
  FormKdSps := TFormKdSps.Create(Application);
  with FormKdSps do begin
    Caption := 'Справочник "Списки"';
    bBtnOk.Visible := true;
    bBtnCancel.Caption := 'Отказ';
    bVuborMode := true;
    with dbgrKdSps.DataSource.DataSet do begin
      if not Active then Open;
      if nKdSps <> 0 then
        Locate('KdSps', nKdSps, []);
    end;
    if ShowModal = mrOk then with dbgrKdSps.DataSource.DataSet do begin
      nKdSps := FieldByName('KdSps').AsInteger;
      cShSps := FieldByName('ShSps').AsString;
      cNmSps := FieldByName('NmSps').AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShowKdSps(nKdSps : integer);
begin
  FormKdSps := TFormKdSps.Create(Application);
  with FormKdSps do begin
    Caption := 'Справочник "Списки"';
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    bVuborMode := false;
    with dbgrKdSps.DataSource.DataSet do begin
      if not Active then Open;
      if nKdSps <> 0 then
        Locate('KdSps', nKdSps, []);
    end;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdSps.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 280);
    Width  := ReadInteger(SECTION, 'wW', 400);
    Free;
  end;
  if FileExists(cDirVids + 'z_ShKSps.vid') then
    dbgrKdSps.Columns.LoadFromFile(cDirVids + 'z_ShKSps.vid');
end;
//------------------------------------------------------------------------------
procedure TFormKdSps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrKdSps.Columns.SaveToFile(cDirVids + 'z_ShKSps.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdSps.popPopup(Sender: TObject);
begin
  popEdt.Enabled := dbgrKdSps.DataSource.DataSet.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormKdSps.popEdtClick(Sender: TObject);
begin
  with dbgrKdSps.DataSource.DataSet do begin
    Edit;
    if EAKdSps {a_EKSps} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdSps.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  with dbgrKdSps.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    Insert;
    if EAKdSps {a_EKSps} then
      Post
    else begin
      Cancel;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKdSps.popDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrOk then
    dbgrKdSps.DataSource.DataSet.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormKdSps.dbgrKdSpsDblClick(Sender: TObject);
begin
  if bVuborMode and (dbgrKdSps.DataSource.DataSet.RecordCount > 0) then
    ModalResult := mrOk;
end;

end.
