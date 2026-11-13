unit a_PCmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids;

type
  TFormPCmp = class(TForm)
    dbgrPCmp: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryPCmp: TQuery;
    dsrcPCmp: TDataSource;
    qryPCmpNR: TIntegerField;
    qryPCmpSHCMP: TStringField;
    qryPCmpNMCMP: TStringField;
    qryPCmpNOTES: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrPCmpDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryPCmp;
  public
    { Public declarations }
  end;

function GetPCmp(var cShCmp : ShortString) : boolean;

const SECTION = 'a_PCmp';

var
  FormPCmp: TFormPCmp;

implementation

uses a_Const, a_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetPCmp(var cShCmp : ShortString) : boolean;
begin
  Result := false;
  cShCmp := '';
  FormPCmp := TFormPCmp.Create(Application);
  with FormPCmp do begin
    OpenQryPCmp;
    if ShowModal = mrOk then begin
      cShCmp := qryPCmp.FieldByName('ShCmp').AsString;
      Result := true;
    end;
    qryPCmp.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPCmp.OpenQryPCmp;
begin
  with qryPCmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from zz_PCmp order by NR');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPCmp.FormCreate(Sender: TObject);
begin
  Caption := 'Доступные программные компоненты';
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 150);
	  Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 200);
    Width  := ReadInteger(SECTION, 'wW', 350);
	  Free;
  end;
  if FileExists(cDirVids + 'PCmp01.vid') then
    dbgrPCmp.Columns.LoadFromFile(cDirVids + 'PCmp01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormPCmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryPCmp.Active then
    dbgrPCmp.Columns.SaveToFile(cDirVids + 'PCmp01.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPCmp.dbgrPCmpDblClick(Sender: TObject);
begin
  if qryPCmp.Active and (qryPCmp.RecordCount > 0) then
    ModalResult := mrOk;
end;

end.
