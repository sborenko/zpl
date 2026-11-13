unit z_NichVd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DBClient, DB, ExtCtrls, Grids, DBGrids, DBTables, Buttons,
  StdCtrls, Provider, DBCtrls;

type
  TFormNichVed = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnPrt: TSpeedButton;
    qryTmp: TQuery;
    dbgrSps: TDBGrid;
    cdsSps: TClientDataSet;
    dsrcSps: TDataSource;
    dspTmp: TDataSetProvider;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    n_KdSps : SmallInt;
    d_DtPrc : TDateTime;
    procedure CreOpenCdsSps(dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

procedure MkNichVed(nKdSps : SmallInt; dDtPrc : TDateTime);

const SECTION = 'z_NichVd';

var
  FormNichVed: TFormNichVed;

implementation

uses a_Const, z_Dm, z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure MkNichVed(nKdSps : SmallInt; dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormNichVed := TFormNichVed.Create(Application);
  with FormNichVed do begin
    n_KdSps := nKdSps;
    d_DtPrc := dDtPrc;
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Формирование НИЧ-ведомости за ' + MesRus(nM) + ' ' +
                                                         IntToStr(nY) + ' г.';
    CreOpenCdsSps(dDtPrc);
    if bFlagDbg then
      ShowModal
    else begin
      if cdsSps.RecordCount = 0 then
        ShowMessage('Нет начислений по темам за ' + MesRus(nM) + ' ' +
                                                         IntToStr(nY) + ' г.')
      else
        PrtNichVed(cdsSps, dDtPrc);   {z_CmnPrt}
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNichVed.CreOpenCdsSps(dDtPrc: TDateTime);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSCH, SchBU, KdSpZ, NmSch, TabN, VidN, ShVidN, ZaMesGod,' +
            ' Sum(Summa) as Summa from viNu_Main ' +
            ' where dtProc = :dDtPrc and VidN < "7500" and ' +
            ' (PSCH Starting with "823/1" or PSCH = "801/1-1" or ' +
            '  PSCH = "801/1-2" or SchBU = "811/72") ' +
            ' group by PSCH, SchBU, KdSpZ, NmSch, TabN, VidN, ShVidN, ZaMesGod');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsSps do begin
    if Active then Close;
    FieldDefs.Clear;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNichVed.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 650);
    Width  := ReadInteger(SECTION, 'wW', 800);
    Free;
  end;
  if FileExists(cDirVids + 'Nich_Sps.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'Nich_Sps.vid');
end;
//------------------------------------------------------------------------------
procedure TFormNichVed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSps.Columns.SaveToFile(cDirVids + 'Nich_Sps.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNichVed.sBtnPrtClick(Sender: TObject);
begin
  PrtNichVed(cdsSps, d_DtPrc);   {z_CmnPrt}
end;

end.
