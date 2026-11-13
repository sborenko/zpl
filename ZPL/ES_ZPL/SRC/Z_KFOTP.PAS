unit Z_KfOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Menus, DB, IniFiles, DBTables;

type
  TFormKoefOtp = class(TForm)
    dbgrKoefOtp: TDBGrid;
    BitBtn2: TBitBtn;
    popMnu: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    popHead: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popAddClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure popDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowKoefOtp;

const SECTION = 'Z_KfOtp';

var
  FormKoefOtp: TFormKoefOtp;

implementation

uses A_Const, Z_Dm, Z_Main, Z_EKfOtp;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowKoefOtp;
begin
  FormKoefOtp := TFormKoefOtp.Create(Application);
  with FormKoefOtp do begin
    Caption := 'Коэффициенты для расчета отпускных';
    if not dbgrKoefOtp.DataSource.DataSet.Active then
      dbgrKoefOtp.DataSource.DataSet.Open;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKoefOtp.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 270);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKoefOtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKoefOtp.popMnuPopup(Sender: TObject);
begin
  popEdt.Enabled := (dbgrKoefOtp.DataSource.DataSet as TQuery).
                                                       RecordCount <> 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormKoefOtp.popAddClick(Sender: TObject);
begin
  with (dbgrKoefOtp.DataSource.DataSet as TQuery) do begin
    Append;
    if AddEdtKoefOtp(dbgrKoefOtp.DataSource) {Z_EKfOtp} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKoefOtp.popEdtClick(Sender: TObject);
begin
  with (dbgrKoefOtp.DataSource.DataSet as TQuery) do begin
    Edit;
    if AddEdtKoefOtp(dbgrKoefOtp.DataSource) {Z_EKfOtp} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormKoefOtp.popDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Проследить за' + #13#10 +
                'корректностью удаления программно невозможно.' + #13#10 +
                'Удалять?:', mtWarning, [mbYes, mbNo], 0) = mrYes then
    dbgrKoefOtp.DataSource.DataSet.Delete;
end;

end.
