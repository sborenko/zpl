unit z_TblPN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, Menus;

type
  TFormTblKomb = class(TForm)
    dsrcTPdn: TDataSource;
    dbgrTPdn: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    MemoHlp: TMemo;
    sBtnHlp: TSpeedButton;
    Splitter1: TSplitter;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnHlpClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure dbgrTPdnDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetMemoHlpVisible;
  public
    { Public declarations }
  end;

procedure ShowTblPnKomb(dDtProc : TDateTime);

const SECTION = 'z_TblPN';

var
  FormTblKomb: TFormTblKomb;

implementation

uses a_Const, z_Dm, z_Main, z_ETblPN;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowTblPnKomb(dDtProc : TDateTime);
begin
  FormTblKomb := TFormTblKomb.Create(Application);
  with FormTblKomb do begin
    Caption := 'Цифры для расчета удержаний';
    if not DmMain.qryTPdn.Active then
      DmMain.qryTPdn.Open;
    DmMain.qryTPdn.Last;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblKomb.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 425);
    Width  := ReadInteger(SECTION, 'wW', 325);
    sBtnHlp.Down := ReadBool(SECTION, 'bShwHlp', false);
    MemoHlp.Height := ReadInteger(SECTION, 'mhH', 55);
    Free;
  end;
  SetMemoHlpVisible;
  if FileExists(cDirVids + 'TPdnKmb.vid') then
    dbgrTPdn.Columns.LoadFromFile(cDirVids + 'TPdnKmb.vid');
end;
//------------------------------------------------------------------------------
procedure TFormTblKomb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrTPdn.Columns.SaveToFile(cDirVids + 'TPdnKmb.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bShwHlp', sBtnHlp.Down);
    WriteInteger(SECTION, 'mhH', MemoHlp.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblKomb.sBtnHlpClick(Sender: TObject);
begin
  SetMemoHlpVisible;
end;
//------------------------------------------------------------------------------
procedure TFormTblKomb.SetMemoHlpVisible;
begin
  if sBtnHlp.Down then begin
    dbgrTPdn.Align := alNone;
    MemoHlp.Align := alNone;
    Splitter1.Align := alTop;
    MemoHlp.Align := alBottom;
    Splitter1.Align := alBottom;
    dbgrTPdn.Align := alClient;
    MemoHlp.Visible := true;
    Splitter1.Visible := true; end
  else begin
    MemoHlp.Visible := false;
    Splitter1.Visible := false;
    MemoHlp.Align := alNone;
    Splitter1.Align := alNone;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblKomb.popPopup(Sender: TObject);
begin
  popEdt.Enabled := dsrcTPdn.DataSet.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormTblKomb.popEdtClick(Sender: TObject);
begin
  with dsrcTPdn.DataSet do begin
    Edit;
    if EATPdn {z_ETblPN} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblKomb.popAddClick(Sender: TObject);
begin
  with dsrcTPdn.DataSet do begin
    Insert;
    if EATPdn {z_ETblPN} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTblKomb.popDelClick(Sender: TObject);
begin
  if MessageDlg(C_PREDDELMSG, mtWarning, [mbYes, mbNo], 0) = mrYes then
    dsrcTPdn.DataSet.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormTblKomb.dbgrTPdnDblClick(Sender: TObject);
begin
  if dsrcTPdn.DataSet.RecordCount > 0 then
    popEdtClick(Self);
end;

end.
