unit z_vdVTts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids,
  ComCtrls;

type
  TFormVedTts = class(TForm)
    dsrcTts: TDataSource;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    dbgrVidTts: TDBGrid;
    BitBtn1: TBitBtn;
    dbgrSpzTts: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dbgrObjTts: TDBGrid;
    dbgrKatTts: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SetDbgrVidTtsColumns;
    procedure SetDbgrSpzTtsColumns;
    procedure SetDbgrObjTtsColumns;
    procedure SetDbgrKatTtsColumns;
  public
    { Public declarations }
  end;

procedure ShwVidNTotals(cdsTts : TDataSet);
procedure ShwSpZTotals(cdsTts : TDataSet);
procedure ShwObjTotals(cdsTts : TDataSet);
procedure ShwKatTotals(cdsTts : TDataSet);

const SECTION = 'z_vdVTts';

var
  FormVedTts: TFormVedTts;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwKatTotals(cdsTts : TDataSet);
begin
  FormVedTts := TFormVedTts.Create(Application);
  with FormVedTts do begin
    Caption := 'Итоги по категориям персонала';
    dsrcTts.DataSet := cdsTts;
    dbgrKatTts.DataSource := dsrcTts;
    if FileExists(cDirVids + 'vdVTts04.vid') then
      dbgrKatTts.Columns.LoadFromFile(cDirVids + 'vdVTts04.vid');
    SetDbgrKatTtsColumns;
    PageControl1.ActivePage := ts4;
    ShowModal;
    if dbgrKatTts.DataSource.DataSet.Active then
      dbgrKatTts.Columns.SaveToFile(cDirVids + 'vdVTts04.vid');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShwObjTotals(cdsTts : TDataSet);
begin
  FormVedTts := TFormVedTts.Create(Application);
  with FormVedTts do begin
    Caption := 'Итоги по подразделениям';
    dsrcTts.DataSet := cdsTts;
    dbgrObjTts.DataSource := dsrcTts;
    if FileExists(cDirVids + 'vdVTts03.vid') then
      dbgrObjTts.Columns.LoadFromFile(cDirVids + 'vdVTts03.vid');
    SetDbgrObjTtsColumns;
    PageControl1.ActivePage := ts3;
    ShowModal;
    if dbgrObjTts.DataSource.DataSet.Active then
      dbgrObjTts.Columns.SaveToFile(cDirVids + 'vdVTts03.vid');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShwSpZTotals(cdsTts : TDataSet);
begin
  FormVedTts := TFormVedTts.Create(Application);
  with FormVedTts do begin
    Caption := 'Итоги по счетам БУ';
    dsrcTts.DataSet := cdsTts;
    dbgrSpzTts.DataSource := dsrcTts;
    if FileExists(cDirVids + 'vdVTts02.vid') then
      dbgrSpzTts.Columns.LoadFromFile(cDirVids + 'vdVTts02.vid');
    SetDbgrSpzTtsColumns;
    PageControl1.ActivePage := ts2;
    ShowModal;
    if dbgrSpzTts.DataSource.DataSet.Active then
      dbgrSpzTts.Columns.SaveToFile(cDirVids + 'vdVTts02.vid');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShwVidNTotals(cdsTts : TDataSet);
begin
  FormVedTts := TFormVedTts.Create(Application);
  with FormVedTts do begin
    Caption := 'Итоги по видам начисления';
    dsrcTts.DataSet := cdsTts;
    dbgrVidTts.DataSource := dsrcTts;
    if FileExists(cDirVids + 'vdVTts01.vid') then
      dbgrVidTts.Columns.LoadFromFile(cDirVids + 'vdVTts01.vid');
    SetDbgrVidTtsColumns;
    PageControl1.ActivePage := ts1;
    ShowModal;
    if dbgrVidTts.DataSource.DataSet.Active then
      dbgrVidTts.Columns.SaveToFile(cDirVids + 'vdVTts01.vid');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedTts.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 455);
    Free;
  end;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  ts3.TabVisible := false;
  ts4.TabVisible := false;
end;
//------------------------------------------------------------------------------
procedure TFormVedTts.FormClose(Sender: TObject; var Action: TCloseAction);
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
procedure TFormVedTts.SetDbgrSpzTtsColumns;
var i : SmallInt; cNmFld : ShortString;
begin
  for i := 0 to dbgrSpzTts.Columns.Count-1 do begin
    cNmFld := UpperCase(dbgrSpzTts.Columns[i].FieldName);
    if (cNmFld = 'NR') or (cNmFld = 'KDSPZ') then
      dbgrSpzTts.Columns[i].Visible := bFlagDbg;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedTts.SetDbgrVidTtsColumns;
var i : SmallInt; cNmFld : ShortString;
begin
  for i := 0 to dbgrVidTts.Columns.Count-1 do begin
    cNmFld := UpperCase(dbgrVidTts.Columns[i].FieldName);
    if (cNmFld = 'NR') then
      dbgrVidTts.Columns[i].Visible := bFlagDbg;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedTts.SetDbgrObjTtsColumns;
var i : SmallInt; cNmFld : ShortString;
begin
  for i := 0 to dbgrObjTts.Columns.Count-1 do begin
    cNmFld := UpperCase(dbgrObjTts.Columns[i].FieldName);
    if (cNmFld = 'NR') then
      dbgrObjTts.Columns[i].Visible := bFlagDbg;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedTts.SetDbgrKatTtsColumns;
var i : SmallInt; cNmFld : ShortString;
begin
  for i := 0 to dbgrKatTts.Columns.Count-1 do begin
    cNmFld := UpperCase(dbgrKatTts.Columns[i].FieldName);
    if (cNmFld = 'NR') then
      dbgrKatTts.Columns[i].Visible := bFlagDbg;
  end;
end;

end.
