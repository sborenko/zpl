unit z_SpzDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFormSpZDet = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    dbgrDet: TDBGrid;
    dsrcDet: TDataSource;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrDetDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetDbgrDetColumns;
  public
    { Public declarations }
  end;

procedure SpzDetails(qryDet : TQuery; cMsg : ShortString);

const SECTION = 'z_SpzDet';

var
  FormSpZDet: TFormSpZDet;

implementation

uses a_Const, a_DM, Z_DM, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure SpzDetails(qryDet : TQuery; cMsg : ShortString);
begin
  FormSpZDet := TFormSpZDet.Create(Application);
  with FormSpZDet do begin
    dsrcDet.DataSet := qryDet;
    Caption := cMsg;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpZDet.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 480);
    Width  := ReadInteger(SECTION, 'wW', 600);
    Free;
  end;
  if FileExists(cDirVids + 'SpZDet.vid') then
    dbgrDet.Columns.LoadFromFile(cDirVids + 'SpZDet.vid');
  SetDbgrDetColumns;
end;
//------------------------------------------------------------------------------
procedure TFormSpZDet.SetDbgrDetColumns;
var i : SmallInt; cUpper : ShortString;
begin
  for i := 0 to dbgrDet.Columns.Count-1 do begin
    cUpper := UpperCase(dbgrDet.Columns[i].FieldName);
    if (cUpper = 'OLDKDVIDN') or (cUpper = 'KDPSCH') or
         (cUpper = 'PRR') or (cUpper = 'PRPV') or (cUpper = 'KTO') or
           (cUpper = 'PRKR') or (cUpper = 'MYNOTES') or (cUpper = 'SPECPS') or
             (cUpper = 'SPEC_NR') or (cUpper = 'OLDKDOBJ') then
      dbgrDet.Columns[i].Visible := bFlagDbg;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpZDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrDet.Columns.SaveToFile(cDirVids + 'SpZDet.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpZDet.dbgrDetDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrDet.Canvas do begin
    if not (gdFocused in State) then begin
      if (UpperCase(Column.FieldName) = 'SUMMA') then begin
        Font.Style := [fsBold];
        if (Column.Field.Value < 0) then
          Font.Color := clRed
        else
          Font.Color := clWindowText; end
      else begin
        Font.Style := [];
        Font.Color := clWindowText;
      end;
    end;
  end;
  dbgrDet.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormSpZDet.SpeedButton1Click(Sender: TObject);
begin
  ShowMessage('Не готово... Sorry');
end;

end.
