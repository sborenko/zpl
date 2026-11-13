unit FormEmplIndx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBTables, DB,
  DModEmplIndx, Menus;

type
  TFrmEmplIndx = class(TForm)
    DbgrIndxExcl: TDBGrid;
    PanelBottom: TPanel;
    BtnAdd: TBitBtn;
    BtnExit: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDelete: TBitBtn;
    Popup: TPopupMenu;
    NAdd: TMenuItem;
    NEdit: TMenuItem;
    NDelete: TMenuItem;
    PanelTop: TPanel;
    LblFIO: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FIO: ShortString;
    procedure UpdateCtrls;
  public
    class procedure Run(TabN: Integer; FIO: ShortString);
  end;

implementation

uses
  a_Const, FormIndxExcl, IniFiles;

const
  SECTION = 'IndxExclLst';

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmEmplIndx.Run(TabN: Integer; FIO: ShortString);
var
  FrmIndx: TFrmEmplIndx;
begin
  DmIndxExcl := TDmIndxExcl.LoadAllExcl(TabN);

  FrmIndx := TFrmEmplIndx.Create(nil);
  FrmIndx.FIO := FIO;

  with FrmIndx do begin
    LblFIO.Caption := IntToStr(TabN) + ', ' + FIO;
    ShowModal;
    Free;
  end;

  DmIndxExcl.Free;
end;

//------------------------------------------------------------------------------
procedure TFrmEmplIndx.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', Left);
    Top  := ReadInteger(SECTION, 'wT', Top);
    Height := ReadInteger(SECTION, 'Height', Constraints.MinHeight);
    Width := ReadInteger(SECTION, 'Width', Constraints.MinWidth);
    Free;
  end;

  if FileExists(cDirVids + SECTION + '.vid') then
    DbgrIndxExcl.Columns.LoadFromFile(cDirVids + SECTION + '.vid');
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmEmplIndx.FormShow(Sender: TObject);
begin
  UpdateCtrls;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmEmplIndx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'Height', Height);
    WriteInteger(SECTION, 'Width', Width);
    Free;
  end;

  DbgrIndxExcl.Columns.SaveToFile(cDirVids + SECTION + '.vid');
end;

//------------------------------------------------------------------------------
procedure TFrmEmplIndx.UpdateCtrls;
begin
  BtnEdit.Enabled := DmIndxExcl.HasRecords;
  BtnDelete.Enabled := BtnEdit.Enabled;
end;

//------------------------------------------------------------------------------
procedure TFrmEmplIndx.BtnAddClick(Sender: TObject);
const
  AddNew = true;
begin
  if TFrmIndxExcl.Modify(AddNew, FIO) then
    UpdateCtrls;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmEmplIndx.BtnEditClick(Sender: TObject);
const
  EditCur = false;
begin
  TFrmIndxExcl.Modify(EditCur, FIO);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFrmEmplIndx.BtnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Удалить запись?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then begin
    DmIndxExcl.Delete;
    UpdateCtrls;
  end;
end;

end.
