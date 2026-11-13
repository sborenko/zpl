unit z_SpsNdb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, ExtCtrls, DBTables, Grids, DBGrids, StdCtrls, Buttons,
  DBClient;

type
  TFormSpsNadb = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    dbgrDet: TDBGrid;
    qryDet: TQuery;
    dsrcDet: TDataSource;
    sBtnLink: TSpeedButton;
    sBtnSortByTabN: TSpeedButton;
    sBtnSortByFIO: TSpeedButton;
    qryDetTABN: TIntegerField;
    qryDetFAM: TStringField;
    qryDetIMA: TStringField;
    qryDetOTCH: TStringField;
    qryDetNR: TIntegerField;
    qryDetKDSPS: TSmallintField;
    qryDetSPSRSCH: TSmallintField;
    qryDetVIDN: TStringField;
    qryDetSHVIDN: TStringField;
    qryDetSP: TStringField;
    qryDetSUMPROC: TFloatField;
    qryDetDT_BEG: TDateTimeField;
    qryDetDT_END: TDateTimeField;
    qryDetFamIO: TStringField;
    qryDetKDOBJ: TSmallintField;
    qryDetKDSPZ: TSmallintField;
    qryDetSCHBU: TStringField;
    dbgrGrp: TDBGrid;
    Splitter1: TSplitter;
    cdsGrp: TClientDataSet;
    dsrcGrp: TDataSource;
    qryTmp: TQuery;
    cdsGrpNR: TAutoIncField;
    cdsGrpVidN: TStringField;
    cdsGrpShVidN: TStringField;
    cdsGrpSP: TStringField;
    cdsGrpPSCH: TStringField;
    cdsGrpCNT: TSmallintField;
    qryDetNRPRBEG: TStringField;
    qryDetNOTES: TStringField;
    qryDetS_TABN: TIntegerField;
    qryDetPSCH: TStringField;
    procedure qryDetCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnLinkClick(Sender: TObject);
    procedure sBtnSortClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbgrDetDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    n_KdSps : SmallInt;
    d_DtPrc : TDateTime;
    procedure CreOpenCdsGrp(nKdSps : SmallInt; dDtPrc : TDateTime);
    procedure OpenQryDet(nKdSps : SmallInt; dDtPrc : TDateTime);
    procedure SetLnkState;
  public
    { Public declarations }
  end;

procedure ShowSpsNadb(nKdSps : SmallInt; dDtPrc : TDateTime);

const SECTION = 'z_SpsNdb';

var
  FormSpsNadb: TFormSpsNadb;

implementation

uses a_Const, a_DM, Z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowSpsNadb(nKdSps : SmallInt; dDtPrc : TDateTime);
begin
  FormSpsNadb := TFormSpsNadb.Create(Application);
  with FormSpsNadb do begin
    n_KdSps := nKdSps;
    d_DtPrc := dDtPrc;
    Caption := 'Действующие надбавки по списку № ' + IntToStr(nKdSps) + ' (' +
                                       Form_Dm.KdSps2ShSps(nKdSps) + ')';
    CreOpenCdsGrp(nKdSps, dDtPrc);
    SetLnkState;
//    OpenQryDet(nKdSps, dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.CreOpenCdsGrp(nKdSps: SmallInt; dDtPrc: TDateTime);
var dDtBegMes, dDtEndMes : tDateTime;
begin
  dDtBegMes := dDtPrc;
  dDtEndMes := myLastDOM(dDtPrc);
  with cdsGrp do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;

{
  Надо так, чтобы были видны надбавки даже не открытого в "своем" списке ТабНр'а
  Хорошо, что при таком запросе не должны двоить те, кто есть больше чем в одном
  списке

Для группировки

Select n.VidN, v.ShVidN, n.SP, sbu.PSCH, Count(n.NR) as CNT
 from z_Nadb n
 Left outer join z_Sps s on s.TabN = n.TabN and s.DtProc = '06/01/2007'
  Left outer join z_KdVidN v on v.VidN = n.VidN
  Left outer join Kd_Sbu sbu on sbu.KdSch = n.KdSpZ
 where n.kdSps = 4 and (n.Dt_End is Null or n.Dt_End > '06/01/2007')
group by n.VidN, v.ShVidN, n.Sp, sbu.PSch


Select s.TabN as s_TabN, s.KdSps as s_Sps, n.*
from z_Nadb n Left outer join z_Sps s on s.TabN = n.TabN and s.DtProc = '06/01/2007'
where n.kdSps = 4 and (n.Dt_End is Null or n.Dt_End > '06/01/2007') and not s.TabN is null
order by n.TabN, n.Dt_Beg
}


    SQL.Add('Select n.VidN, v.ShVidN, n.SP, sbu.PSCH, Count(n.NR) as CNT ' +
            ' from z_Nadb n ' +
            ' Left outer join z_Sps s on s.TabN = n.TabN and ' +
                             ' s.DtProc = :dDtPrc ' +
            ' Left outer join z_KdVidN v on v.VidN = n.VidN ' +
            ' Left outer join Kd_Sbu sbu on sbu.KdSch = n.KdSpZ ' +
            ' where (n.kdSps = :nKdSps) and ' +
            ' (not n.Dt_Beg is null) and (n.Dt_Beg <= :dDtEndMes) and ' +
            ' (n.Dt_End is null or n.Dt_End >= :dDtBegMes) ' +
            ' group by n.VidN, v.ShVidN, n.Sp, sbu.PSch');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('dDtBegMes').AsDateTime := dDtBegMes;
    ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
    ParamByName('nKdSps').AsInteger := nKdSps;
    Open;
    while not Eof do begin
      cdsGrp.AppendRecord([nil, FieldByName('VidN').AsString,
                                FieldByName('ShVidN').AsString,
                                FieldByName('PSCH').AsString,
                                FieldByName('SP').AsString,
                                FieldByName('CNT').AsInteger]);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  cdsGrp.First;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.OpenQryDet(nKdSps: SmallInt; dDtPrc: TDateTime);
var dDtBegMes, dDtEndMes : tDateTime;
begin
  dDtBegMes := dDtPrc;
  dDtEndMes := myLastDOM(dDtPrc);
  with qryDet do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcGrp;
    SQL.Add('Select distinct n.TabN, s.TabN as s_TabN, ' +
            ' u.Fam, u.Ima, u.Otch, n.NR, n.KdSps, n.SpsRsch, ' +
            ' n.VidN, v.ShVidN, n.SP, n.SumProc, n.Dt_Beg, n.Dt_End, ' +
            ' n.KdObj, n.KdSpZ, sbu.SchBU, sbu.PSCH, n.NrPrBeg, n.Notes ' +
            ' from z_Nadb n Left outer join z_Sps s on s.TabN = n.TabN and ' +
                                               ' s.DtProc = :dDtPrc ' +
            ' Left Outer Join z_Upi u on u.TabN = n.TabN ' +
            ' Left Outer Join Kd_Sbu sbu on sbu.KdSch = n.KdSpZ ' +
            ' Left outer join z_KdVidN v on v.VidN = n.VidN ' +
            ' where (n.kdSps = :nKdSps) and (not n.Dt_Beg is null) and ' +
            ' (n.Dt_Beg <= :dDtEndMes) and ' +
            ' (n.Dt_End is null or n.Dt_End >= :dDtBegMes) and ' +
            ' VidN = :VidN and SP = :SP and PSCH = :PSCH');
    if sBtnSortByTabN.Down then
      SQL.Add('order by s.TabN')
    else
      SQL.Add('order by u.Fam, u.Ima, u.Otch');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('dDtBegMes').AsDateTime := dDtBegMes;
    ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
    ParamByName('nKdSps').AsInteger := nKdSps;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.qryDetCalcFields(DataSet: TDataSet);
begin
  qryDetFamIO.AsString := MyFamIO(qryDetFam.AsString,
                                    qryDetIma.AsString, qryDetOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.FormCreate(Sender: TObject);
var bSortTabN : boolean;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 675);
    dbgrGrp.Width := ReadInteger(SECTION, 'GrGrpW', 247);
    sBtnLink.Down := ReadBool(SECTION, 'bIsLnk', true);
    bSortTabN := ReadBool(SECTION, 'bSortTabN', true);
    Free;
  end;
  if bSortTabN then
    sBtnSortByTabN.Down := true
  else
    sBtnSortByFIO.Down := true;
  if FileExists(cDirVids + 'SpsNdb01.vid') then
    dbgrGrp.Columns.LoadFromFile(cDirVids + 'SpsNdb01.vid');
  if FileExists(cDirVids + 'SpsNdb03.vid') then
    dbgrDet.Columns.LoadFromFile(cDirVids + 'SpsNdb03.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if cdsGrp.Active then
    dbgrGrp.Columns.SaveToFile(cDirVids + 'SpsNdb01.vid');
  if qryDet.Active then
    dbgrDet.Columns.SaveToFile(cDirVids + 'SpsNdb03.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'GrGrpW', dbgrGrp.Width);
    WriteBool(SECTION, 'bIsLnk', sBtnLink.Down);
    WriteBool(SECTION, 'bSortTabN', sBtnSortByTabN.Down);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.sBtnLinkClick(Sender: TObject);
begin
  SetLnkState;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.SetLnkState;
begin
  if sBtnLink.Down then begin
    dbgrDet.Color := clCream;
    qryDet.DataSource := dsrcGrp;
    OpenQryDet(n_KdSps, d_DtPrc); end
  else begin
    if qryDet.Active then
      qryDet.Close;
    dbgrDet.Color := clBtnFace;
    qryDet.DataSource := nil;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.sBtnSortClick(Sender: TObject);
var nSvNR : integer;
begin
  if qryDet.Active then begin
    nSvNR := qryDetNR.AsInteger;
    OpenQryDet(n_KdSps, d_DtPrc);
    if nSvNR <> 0 then
      qryDet.Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNadb.dbgrDetDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrDet.Canvas do begin
    if not (gdFocused in State) then begin
      cFldNm := UpperCase(Column.FieldName);
      if (cFldNm = 'SP') or (cFldNm = 'SUMPROC') then begin
        Font.Style := [fsBold];
      end;
    end;
  end;
  dbgrDet.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
