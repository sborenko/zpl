unit Z_MkVdZp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, Grids, DBGrids, Db, DBTables, StdCtrls;

type
  TFormVedZp = class(TForm)
    qryVed: TQuery;
    dsrcVed: TDataSource;
    dbgrVed: TDBGrid;
    sBtnPrt: TSpeedButton;
    bBtnCancel: TBitBtn;
    qryVedKDOBJ: TSmallintField;
    qryVedKDSPZ: TSmallintField;
    qryVedNMOBJ: TStringField;
    qryVedFAM: TStringField;
    qryVedIMA: TStringField;
    qryVedOTCH: TStringField;
    qryVedSUMMA: TBCDField;
    qryVedTABN: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    n_KdObj : integer;
    n_ZpCurY, n_ZpCurM : word;
    d_DtProc : TDateTime;
    procedure OpenQryVed(nKdObj : integer; dDtProc : TDateTime);
  public
    { Public declarations }
  end;

procedure MakeVedZp(nKdObj : integer; dDtProc : TDateTime);

const SECTION = 'Z_MkVdZp';

var
  FormVedZp: TFormVedZp;

implementation

{$R *.DFM}

uses A_Const, A_DM, Z_CmnPrt, A_Lib;

//------------------------------------------------------------------------------
procedure MakeVedZp(nKdObj : integer; dDtProc : TDateTime);
var nY, nM, nD : word;
begin
  FormVedZp := TFormVedZp.Create(Application);
  with FormVedZp do begin
    n_KdObj := nKdObj;
    DecodeDate(dDtProc, nY, nM, nD);
    n_ZpCurY := nY;
    n_ZpCurM := nM;
    d_DtProc := dDtProc;
    Caption := 'Печать ведомости за ' + MesRus(n_ZpCurM) + ' ' +
                                               IntToStr(n_ZpCurY) + ' г.';
    OpenQryVed(nKdObj, d_DtProc);
    if qryVed.RecordCount = 0 then
      ShowMessage('Не найдено начислений и удержаний за заданный месяц')
    else begin
      if bFlagDbg then
        ShowModal
      else begin
        if nKdObj = -1 then
          F6PrtVedZpPotokom(d_DtProc, qryVed)     {Z_CmnPrt}
        else
          F6PrtVedZp(nKdObj, d_DtProc, qryVed);   {Z_CmnPrt}
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedZp.OpenQryVed(nKdObj : integer; dDtProc : TDateTime);
begin
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select sps.KdObj, nu.KdSpZ, obj.NmObj, ' +
              ' upi.Fam, upi.Ima, upi.Otch, sps.TabN, ' +
              ' cast(Sum(nu.Summa) as numeric(18,2)) as Summa ' +
              ' from z_Sps sps, Z_KdObj obj, z_Nu nu, z_Upi upi where ');
    if nKdObj > 0 then
      SQL.Add(' (sps.KdObj = :nKdObj) and ');
    SQL.Add(' (sps.DtProc = :dDtProc) and (nu.DtProc = sps.DtProc) and ' +
            ' (upi.TabN = sps.TabN)  and (nu.TabN = sps.TabN) and ' +
            ' (obj.KdObj = sps.KdObj)');
    SQL.Add('group by sps.KdObj, nu.KdSpZ, obj.NmObj, ' +
            'upi.Fam, upi.Ima, upi.Otch, sps.TabN');
    SQL.Add('order by sps.KdObj, upi.Fam, upi.Ima, upi.Otch, nu.KdSpZ');
    if nKdObj > 0 then
      ParamByName('nKdObj').AsInteger := nKdObj;
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedZp.FormCreate(Sender: TObject);
begin
  if bFlagDbg then begin
    with TIniFile.Create(cNmIniFile) do begin
      Left   := ReadInteger(SECTION, 'wL', 100);
      Top    := ReadInteger(SECTION, 'wT', 100);
      Height := ReadInteger(SECTION, 'wH', 360);
      Width  := ReadInteger(SECTION, 'wW', 500);
      Free;
    end;
    if FileExists(cDirVids + 'VedZpDbg.vid') then
      dbgrVed.Columns.LoadFromFile(cDirVids + 'VedZpDbg.vid');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedZp.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  if bFlagDbg then begin
    dbgrVed.Columns.SaveToFile(cDirVids + 'VedZpDbg.vid');
    with TIniFile.Create(cNmIniFile) do begin
      WriteInteger(SECTION, 'wL', Left);
      WriteInteger(SECTION, 'wT', Top);
      WriteInteger(SECTION, 'wH', Height);
      WriteInteger(SECTION, 'wW', Width);
      Free;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVedZp.sBtnPrtClick(Sender: TObject);
begin
  if n_KdObj = -1 then
    F6PrtVedZpPotokom(d_DtProc, qryVed)            {Z_CmnPrt}
  else
    F6PrtVedZp(n_KdObj, d_DtProc, qryVed);         {Z_CmnPrt}
end;

end.
