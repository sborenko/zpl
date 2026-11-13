unit z_dfGtZv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, DBTables, IniFiles;

type
  TFormGetNrZviln = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dbgrID: TDBGrid;
    qryID: TQuery;
    dsrcID: TDataSource;
    LabelCntRec: TLabel;
    procedure dbgrIDDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure OpenQryId(cDirNm, cTableNm : string);
  public
    { Public declarations }
  end;

function GetZviln(var nNR : integer; cDirNm, cTableNm : string) : boolean;

const SECTION = 'z_dfGtZv';

var
  FormGetNrZviln: TFormGetNrZviln;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetZviln(var nNR : integer; cDirNm, cTableNm : string) : boolean;
begin
  Result := false;
  Screen.Cursor := crSQLWait;
  FormGetNrZviln := TFormGetNrZviln.Create(Application);
  with FormGetNrZviln do begin
    OpenQryId(cDirNm, cTableNm);
    Screen.Cursor := crDefault;
    if qryId.RecordCount > 0 then begin
      Caption := 'Имеющие дату увольнения';
      LabelCntRec.Caption := 'Записей: ' + IntToStr(qryId.RecordCount);
      if ShowModal = mrOk then begin
        nNR := qryId.FieldByName('NR').AsInteger;
        Result := true;
        qryId.Close;
      end; end
    else
      ShowMessage('Не найдено уволенных в таблице');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetNrZviln.OpenQryId(cDirNm, cTableNm : string);
begin
  with qryId do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDirNm;
    SQL.Add('Select * from ' + cTableNm + ' where (not D_ZVILN is null)');
    if bFlagDbg then
      SQL.SaveToFile('c:\Temp\sql2.sql');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetNrZviln.dbgrIDDblClick(Sender: TObject);
begin
  if qryId.RecordCount > 0 then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGetNrZviln.FormCreate(Sender: TObject);
begin
  LabelCntRec.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 345);
    Width  := ReadInteger(SECTION, 'wW', 575);
    Free;
  end;
  if FileExists(cDirVids + 'GtNrZv.vid') then
    dbgrID.Columns.LoadFromFile(cDirVids + 'GtNrZv.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGetNrZviln.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrId.Columns.SaveToFile(cDirVids + 'GtNrZv.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;

end.
