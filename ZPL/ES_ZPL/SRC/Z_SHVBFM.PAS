unit Z_ShVbFm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, IniFiles, DBTables, ExtCtrls;

type
  TFormShowVubFams = class(TForm)
    dsrcTmp: TDataSource;
    dbgrTmp: TDBGrid;
    PanelButtons: TPanel;
    Label1: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure dbgrTmpDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrTmpDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    VidFileName: string;

    function Common(Query: TQuery; var TabN, KdObj: integer; ShortFldSet: boolean): boolean;

    procedure HideColumns;
  public
    { Public declarations }
  end;

function Shw_FamsForUpi(Query: TQuery; var TabN: integer) : boolean;
function Shw_FamsForSps(Query: TQuery; var TabN, KdObj: integer): boolean;

const SECTION = 'Z_ShVbFm';

var
  FormShowVubFams: TFormShowVubFams;

implementation

uses A_Const, Z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function Shw_FamsForUpi(Query: TQuery; var TabN: integer) : boolean;
var
  DummyInt: integer;
begin
  FormShowVubFams := TFormShowVubFams.Create(Application);

  with FormShowVubFams do begin
    Result := Common(Query, TabN, DummyInt, true);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function Shw_FamsForSps(Query: TQuery; var TabN, KdObj: integer): boolean;
begin
  FormShowVubFams := TFormShowVubFams.Create(Application);

  with FormShowVubFams do begin
    Result := Common(Query, TabN, KdObj, false);
    Free;
  end;
end;

//------------------------------------------------------------------------------
function TFormShowVubFams.Common(
  Query: TQuery;
  var TabN, KdObj: integer;
  ShortFldSet: boolean): boolean;
begin
  dsrcTmp.DataSet := Query;

  Caption := 'Выбор сотрудника';
  if ShortFldSet then begin
    VidFileName := 'ShVbFm12Stort.vid';
    HideColumns;
  end else
    VidFileName := 'ShVbFm12Wide.vid';

  Result := ShowModal = mrOk;

  if Result then begin
    TabN := Query.FieldByName('TabN').AsInteger;
    KdObj := Query.FieldByName('KdObj').AsInteger;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShowVubFams.dbgrTmpDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

//------------------------------------------------------------------------------
procedure TFormShowVubFams.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 350);
    Top    := ReadInteger(SECTION, 'wT', 350);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 550);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShowVubFams.FormShow(Sender: TObject);
begin
  if FileExists(cDirVids + VidFileName) then
    dbgrTmp.Columns.LoadFromFile(cDirVids + VidFileName);
end;

//------------------------------------------------------------------------------
procedure TFormShowVubFams.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;

  dbgrTmp.Columns.SaveToFile(cDirVids + VidFileName);
end;

//------------------------------------------------------------------------------
procedure TFormShowVubFams.HideColumns;
var
  i: SmallInt;
  FldName: string;
begin
  for i := 0 to dbgrTmp.Columns.Count - 1 do begin
    FldName := UpperCase(dbgrTmp.Columns[i].FieldName);
    if (FldName = 'KDOBJ') or (FldName = 'KDSPS') or (FldName = 'KDKATP') then begin
      dbgrTmp.Columns[i].Visible := false;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShowVubFams.dbgrTmpDrawColumnCell(Sender: TObject;
                                        const Rect: TRect; DataCol: Integer;
                                        Column: TColumn; State: TGridDrawState);
var bInCurMes : boolean;
begin
  // Выделить цветом "неБоевые" на текущий месяц (с пустым KdObj)
  bInCurMes := false;
  with dbgrTmp.DataSource.DataSet, dbgrTmp.Canvas do begin
    if not FieldByName('KdObj').IsNull then
      bInCurMes := true;

    if bInCurMes then begin
      Font.Color := clWindowText;
      Font.Style := [fsBold]; end
    else begin
      Font.Color := clGray;
      Font.Style := [];
    end;
  end;
  dbgrTmp.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
