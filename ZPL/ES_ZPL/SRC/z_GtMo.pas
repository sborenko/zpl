unit z_GtMo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBClient, DBTables, StdCtrls, Buttons, Grids, DBGrids,
  DBCtrls, ExtCtrls;

type
  TFormGtZplMO = class(TForm)
    dbtNmPSch: TDBText;
    dbgrZpl: TDBGrid;
    PanelButtons: TPanel;
    qryTmp: TQuery;
    cdsZpl: TClientDataSet;
    dsrcZpl: TDataSource;
    cdsZplPSCH: TStringField;
    cdsZplNmPSch: TStringField;
    cdsZplNr_GOrd: TStringField;
    cdsZplKdUPoz: TSmallintField;
    cdsZplUPoz: TStringField;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrZplDblClick(Sender: TObject);
    procedure dbgrZplEnter(Sender: TObject);
    procedure dbgrZplExit(Sender: TObject);
    procedure cdsZplCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    cSvPSch : ShortString;
    procedure CreOpenCdsZpl(dDtPrc :TDateTime);
  public
    { Public declarations }
  end;

function GetZplMO(dDtPrc : TDateTime;
                            var cPSch, cNmPSch, cNrGO : ShortString) : boolean;

const SECTION = 'z_GtMo';

var
  FormGtZplMO: TFormGtZplMO;

implementation

{$R *.dfm}

uses a_Const, a_DM, z_Main;

//------------------------------------------------------------------------------
function GetZplMO(dDtPrc : TDateTime;
                            var cPSch, cNmPSch, cNrGO : ShortString) : boolean;
begin
  Result := false;
  FormGtZplMO := TFormGtZplMO.Create(Application);
  with FormGtZplMO do begin
    CreOpenCdsZpl(dDtPrc);
    Caption := 'Выбор счёта для МО';
    if ShowModal = mrOk then begin
      cPSch   := cdsZplPSch.AsString;
      cNmPSch := cdsZplNmPSch.AsString;
      cNrGO   := cdsZplNr_GOrd.AsString;
      Result  := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtZplMO.CreOpenCdsZpl(dDtPrc: TDateTime);
var cNmPSch, cNr_GOrd : ShortString;
begin
  with cdsZpl do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct PSCH from ViNuMain where DtProc = :dDtPrc');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      cNr_GOrd := Form_Dm.SchBu2Nr_GOrd(FieldByName('PSch').AsString,
                                                                    cNmPSch);
      cdsZpl.Append;
      cdsZplPSch.AsString := FieldByName('PSch').AsString;
      cdsZplNmPSch.AsString := cNmPSch;
      cdsZplNr_GOrd.AsString := cNr_GOrd;
      cdsZpl.Post;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if cSvPSch > '' then
    cdsZpl.Locate('PSch', cSvPSch, [])
  else
    cdsZpl.First;
end;
//------------------------------------------------------------------------------
procedure TFormGtZplMO.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 350);
    Height := ReadInteger(SECTION, 'wH', 325);
    Width  := ReadInteger(SECTION, 'wW', 550);
    cSvPSch := ReadString(SECTION, 'cSvPSch', '');
    Free;
  end;
  if FileExists(cDirVids + 'GtZplMo.vid') then
    dbgrZpl.Columns.LoadFromFile(cDirVids + 'GtZplMo.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGtZplMO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrZpl.Columns.SaveToFile(cDirVids + 'GtZplMo.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteString(SECTION, 'cSvPSch', cdsZplPSch.AsString);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtZplMO.dbgrZplDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGtZplMO.dbgrZplEnter(Sender: TObject);
begin
  dbgrZpl.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGtZplMO.dbgrZplExit(Sender: TObject);
begin
  dbgrZpl.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormGtZplMO.cdsZplCalcFields(DataSet: TDataSet);
var cPSch, cUPoz : ShortString; nKdUPoz : SmallInt;
begin
  with cdsZpl do begin
    if not cdsZplPSch.IsNull and (cdsZplPSch.AsString > '') then begin
      cPSch := cdsZplPSch.AsString;
      cUPoz := Form_Dm.Z_SchBu2UPoz(cPSch, nKdUPoz);
      cdsZplKdUPoz.AsInteger := nKdUPoz;
      cdsZplUPoz.AsString := cUPoz;
    end;
  end;
end;

end.
