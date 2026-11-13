unit k_NwShT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids,
  DBTables, Mask;

type
  TFormKmdNewShTem = class(TForm)
    Panel1: TPanel;
    bBtnClose: TBitBtn;
    qryTem: TQuery;
    dsrcTem: TDataSource;
    dbgrTem: TDBGrid;
    qryTemNR: TIntegerField;
    qryTemGRP: TSmallintField;
    qryTemNMSCH: TStringField;
    qryTemKDTEMU: TSmallintField;
    qryTemKDPSCH: TSmallintField;
    qryTemSCHBU: TStringField;
    qryTemSCH_17: TStringField;
    qryTemPSCH: TStringField;
    qryTemAINDX: TSmallintField;
    qryTemLVL: TSmallintField;
    qryTemPS_17: TStringField;
    qryTemHSCH: TStringField;
    qryTemARC: TStringField;
    qryTemSORT: TSmallintField;
    Splitter1: TSplitter;
    qryNU: TQuery;
    dbgrNU: TDBGrid;
    dsrcNU: TDataSource;
    qryNUPSCH: TStringField;
    qryNUSCHBU: TStringField;
    qryNUKDSPZ: TSmallintField;
    qryNUKDTEMU: TSmallintField;
    qryNUCNT: TIntegerField;
    Label1: TLabel;
    meKdTemu: TMaskEdit;
    sBtnGo: TSpeedButton;
    qryTmp: TQuery;
    sBtnDelaj: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrTemEnter(Sender: TObject);
    procedure dbgrTemExit(Sender: TObject);
    procedure bBtnCloseClick(Sender: TObject);
    procedure sBtnGoClick(Sender: TObject);
    procedure dbgrNUDblClick(Sender: TObject);
    procedure sBtnDelajClick(Sender: TObject);
  private
    { Private declarations }
    n_SvKdTemu : Smallint;
    procedure OpenQryTem;
    procedure OpenQryNU;
  public
    { Public declarations }
  end;

procedure CreKmdNewShTem;

const SECTION = '_NwShT';

var
  FormKmdNewShTem: TFormKmdNewShTem;

implementation

uses A_Const, a_Dm, Z_DM, Z_Main;

{$R *.dfm}

//-----------------------------------------------------------------------------
procedure CreKmdNewShTem;
begin
  FormKmdNewShTem := TFormKmdNewShTem.Create(Application);
  with FormKmdNewShTem do begin
  Caption := 'Создание новой схемы работы с темами (c 01-2017)';
  OpenQryTem;
  OpenQryNU;
    ShowModal;
    Free;
  end;
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
   Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 510);
    Width  := ReadInteger(SECTION, 'wW', 750);
    dbgrTem.Width := ReadInteger(SECTION, 'dbgrTemW', 454);
    n_SvKdTemu := ReadInteger(SECTION, 'n_SvKdTemu', 0);
    Free;
  end;
  if FileExists(cDirVids + 'CrShT01.vid') then
    dbgrTem.Columns.LoadFromFile(cDirVids + 'CrShT01.vid');
//  if FileExists(cDirVids + 'CrShN01.vid') then
//    dbgrNU.Columns.LoadFromFile(cDirVids + 'CrShN01.vid');
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  n_SvKdTemu := qryTemKdTemu.AsInteger;
  dbgrTem.Columns.SaveToFile(cDirVids + 'CrShT01.vid');
  dbgrNU.Columns.SaveToFile(cDirVids + 'CrShN01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'dbgrTemW', dbgrTem.Width);
    WriteInteger(SECTION, 'n_SvKdTemu', n_SvKdTemu);
    Free;
  end;
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.dbgrTemEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.dbgrTemExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.OpenQryNU;
begin
  with qryTem do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_Temu order by AIndx');
    Open;
  end;
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.OpenQryTem;
begin
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSCH, SchBU, KdSpZ, KdTemu, Count(*) CNT from ViNuMain ' +
            ' where DtProc >= "01/01/2017" and ' +
                  ' DtProc <= "07/01/2017" and ' +
            ' PSCH in ("8011/02-1","8011/02-2","8111/03") ' +
            ' group by PSCH, SchBU, KdSpZ, KdTemu');
    Open;
  end;
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.bBtnCloseClick(Sender: TObject);
begin
  Close;
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.sBtnGoClick(Sender: TObject);
var nKdTemu : SmallInt; cKdTemu : ShortString;
begin
  cKdTemu := meKdTemu.Text;
  nKdTemu := StrToInt(cKdTemu);
  if qryTem.Locate('KdTemu', nKdTemu, []) then
    meKdTemu.Text := '';
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.dbgrNUDblClick(Sender: TObject);
var nKdTemu : SmallInt;
begin
  nKdTemu := qryNUKdSpZ.AsInteger;
  if not qryTem.Locate('KdTemu', nKdTemu, []) then
    ShowMessage('Не найдена тема с кодом "' + IntToStr(nKdTemu) +
                                                  '" в спр-ке ТЕМЫ');
end;
//-----------------------------------------------------------------------------
procedure TFormKmdNewShTem.sBtnDelajClick(Sender: TObject);
var nKdSpZ, nKdTemu, nKdPSch : SmallInt; cPSch, cMsg :ShortString;
begin
  nKdSpZ  := qryNuKdSpZ.AsInteger;
  nKdTemu := nKdSpZ;
  cPSch := qryNuPSch.AsString;
  if cPSch = '8011/02-1' then
    nKdPSch := 2039
  else if cPSch = '8011/02-2' then
    nKdPSch := 2040
  else // if cPSch = '8111/03' then
    nKdPSch := 2161;
  cMsg := 'KdSpZ:' + IntToStr(nKdSpZ) + ' => ' +
                                                   IntToStr(nKdPSch);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Z_NU ' +
            ' Set KdTemu = :nKdTemu, KdSpZ = :nKdPSCh, MyNotes = :cMsg ' +
            ' where DtProc >= "01/01/2017" and ' +
                  ' DtProc <= "07/01/2017" and KdSpZ = :nKdSpZ');
    ParamByName('cMsg').AsString := cMsg;
    ParamByName('nKdSpZ').AsInteger := nKdSpZ;
    ParamByName('nKdTemu').AsInteger := nKdTemu;
    ParamByName('nKdPSch').AsInteger := nKdPSch;
    ExecSQL;

    SQL.Clear;
    SQL.Add('Update Z_Otkl ' +
            ' Set KdTemu = :nKdTemu, KdSpZ = :nKdPSCh, MyNotes = :cMsg ' +
            ' where DtProc >= "01/01/2017" and ' +
                  ' DtProc <= "07/01/2017" and KdSpZ = :nKdSpZ');
    ParamByName('cMsg').AsString := cMsg;
    ParamByName('nKdSpZ').AsInteger := nKdSpZ;
    ParamByName('nKdTemu').AsInteger := nKdTemu;
    ParamByName('nKdPSch').AsInteger := nKdPSch;
    ExecSQL;
  end;
  qryNu.Next;
end;

end.
