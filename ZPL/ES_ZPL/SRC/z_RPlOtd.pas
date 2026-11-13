unit z_RPlOtd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, ExtCtrls, ComCtrls, DB, DBTables,
  DBCtrls, Grids, DBGrids, Menus, Provider, DBClient;

type
  TFormRepPlOtd = class(TForm)
    qryTmp: TQuery;
    tblPln: TTable;
    qryGrad: TQuery;
    qryMes: TQuery;
    dsrcMes: TDataSource;
    qryMesDTPROC: TDateTimeField;
    qryMesMesRus: TStringField;
    dsrcGrad: TDataSource;
    updGrad: TUpdateSQL;
    qryGradNR: TIntegerField;
    qryGradDTBEG: TDateTimeField;
    qryGradP_FROM: TFloatField;
    qryGradP_TO: TFloatField;
    qryGradNOTES: TStringField;
    popGrad: TPopupMenu;
    popGradAdd: TMenuItem;
    popGradEdt: TMenuItem;
    popGradDel: TMenuItem;
    popGradHead: TMenuItem;
    tblPlnP_From: TFloatField;
    tblPlnP_To: TFloatField;
    tblPlnCnt: TIntegerField;
    tblPlnSmm: TFloatField;
    dbgrMes: TDBGrid;
    dbgrGrad: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    sBtnPrt: TSpeedButton;
    bBtnCancel: TBitBtn;
    cdsZpl: TClientDataSet;
    dspZpl: TDataSetProvider;
    procedure qryMesCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popGradPopup(Sender: TObject);
    procedure popGradAddClick(Sender: TObject);
    procedure popGradEdtClick(Sender: TObject);
    procedure popGradDelClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    cViewDelMeName : ShortString;
    procedure OpenQryMes;
    procedure OpenQryGrad;
    procedure GetSavePlnInf(nFrom, nTo : double);
  public
    { Public declarations }
  end;

procedure ShwRepPlOtd (dDtPrc : TDateTime);

const SECTION = 'zRPlOtd';

var
  FormRepPlOtd: TFormRepPlOtd;

implementation

uses a_Const, a_DM, z_Main, a_Lib, z_EplOtd, z_CmnPrt;

{$R *.dfm}

procedure ShwRepPlOtd (dDtPrc : TDateTime);
begin
  FormRepPlOtd := TFormRepPlOtd.Create(Application);
  with FormRepPlOtd do begin
    cViewDelMeName := '';
    Caption := 'Отчет по заработкам';
    OpenQryMes;
    OpenQryGrad;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.OpenQryMes;
begin
  with qryMes do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Distinct DtProc from Z_Sps');
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.OpenQryGrad;
begin
  with qryGrad do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from zz_poGrad order by P_From');
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.qryMesCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qryMesDtProc.AsDateTime, nY, nM, nD);
  qryMesMesRus.AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 500);
    Free;
  end;
  if FileExists(cDirVids + 'RPln01.vid') then
    dbgrMes.Columns.LoadFromFile(cDirVids + 'RPln01.vid');
  if FileExists(cDirVids + 'RPln02.vid') then
    dbgrGrad.Columns.LoadFromFile(cDirVids + 'RPln02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrMes.Columns.SaveToFile(cDirVids + 'RPln01.vid');
  dbgrGrad.Columns.SaveToFile(cDirVids + 'RPln02.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.popGradPopup(Sender: TObject);
begin
  popGradAdd.Enabled := qryGrad.Active;
  popGradEdt.Enabled := qryGrad.Active and (qryGrad.RecordCount > 0);
  popGradDel.Enabled := popGradEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.popGradAddClick(Sender: TObject);
var nSvNR : integer; nSmFrom : double;
begin
  nSvNR := 0;
  with qryGrad do begin
    if RecordCount > 0 then
      nSvNR := FieldByName('NR').AsInteger;
    Append;
    if EAGrad then begin
      Post;
      nSmFrom := FieldByName('P_From').AsFloat;
      Form_Dm.DbMain.ApplyUpdates([qryGrad]);
      Close;
      Open;
      Locate('P_From', nSmFrom, []); end
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.popGradEdtClick(Sender: TObject);
var nSvNr : integer;
begin
  nSvNR := 0;
  with qryGrad do begin
    if RecordCount > 0 then
      nSvNR := FieldByName('NR').AsInteger;
    Edit;
    if EAGrad then begin
      Post;
      Form_Dm.DbMain.ApplyUpdates([qryGrad]);
      Close;
      Open;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, []); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.popGradDelClick(Sender: TObject);
var nSvNR : integer;
begin
  nSvNR := 0;
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                            [mbYes, mbNo], 0) = mrYes then with qryGrad do begin
    Delete;
    if RecordCount <> 0 then
      nSvNR := FieldByName('NR').AsInteger;
    Form_Dm.DbMain.ApplyUpdates([qryGrad]);
    Close;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.sBtnPrtClick(Sender: TObject);
var nFrom, nTo : double; nY, nM, nD : word;
begin
  if not qryGrad.Active or (qryGrad.RecordCount = 0) then begin
    ShowMessage('Сначала сформируйте таблицу градаций');
    Exit;
  end;
  dbgrGrad.SetFocus;
  with tblPln do begin
    if Active then Close;
    TableName := 'Pln_Rpt.db';
    DataBaseName := cDirTemp;
    if Exists then
      DeleteTable;
    CreateTable;
    Open;
  end;
//  cViewDelMeName := 'Dm_' + RandomFileName;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select s.TabN, p.Sovm, sum(n.Summa) as SMM ' +
            ' from ViNuMain n, z_Sps s ' +
            ' Left outer join Get_Wrk_Pere (s.TabN, s.DtProc) p on 1 = 1 ' +
            ' where s.DtProc = :dDtPrc and ' +
            ' n.TabN = s.TabN and n.DtProc = s.DtProc and ' +
            ' (p.Sovm is null or p.Sovm = 0) and ' +
            ' (n.VidN < "6000") and (n.DHD = "1") ' +
            ' group by s.TabN, p.Sovm');
    ParamByName('dDtPrc').AsDateTime := qryMesDtProc.AsDateTime;
  end;
  dspZpl.DataSet := qryTmp;
  with cdsZpl do begin
    if Active then Close;
    ProviderName := 'dspZpl';
    Open;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'PlnOtd.cds');
  end;
  with qryTmp do begin
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryGrad do begin
    First;
    nFrom := 0;
    while not Eof do begin
      if not Eof then
        nTo := FieldByName('P_From').AsFloat
      else nTo := -100;
      Next;
      GetSavePlnInf(nFrom, nTo);
      nFrom := nTo;
    end;
    GetSavePlnInf(nFrom, -100);
  end;
{
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('drop VIEW ' + cViewDelMeName);
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
}
  if tblPln.RecordCount > 0 then begin
    DecodeDate(qryMesDtProc.AsDateTime, nY, nM, nD);
    F6_PrtPlnDoc(tblPln, nY, nM); {z_CmnPrt} end
  else
    ShowMessage('Не удалось собрать нужных сведений');
  with tblPln do begin
    if Active then Close;
//    if Exists then DeleteTable;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.GetSavePlnInf(nFrom, nTo : double);
var nCnt : SmallInt; nSmm : double;
begin
  with cdsZpl do begin
    Filtered := false;
    Filter := 'SMM > ' + FloatToStr(nFrom) + ' and SMM <= ' + FloatToStr(nTo);
    Filtered := true;
    First;
    nCnt := 0;
    nSmm := 0;
    while not Eof do begin
      Inc(nCnt);
      nSmm := nSmm + FieldByName('SMM').AsFloat;
      Next;
    end;
    tblPln.Append;
    tblPln.FieldByName('P_From').AsFloat := nFrom;
    if nTo >= 0 then
      tblPln.FieldByName('P_To').AsFloat := nTo;
    tblPln.FieldByName('Cnt').AsFloat := nCnt;
    tblPln.FieldByName('SMM').AsFloat := nSmm;
    tblPln.Post;
  end;
end;
(*
//------------------------------------------------------------------------------
procedure TFormRepPlOtd.GetSavePlnInf(nFrom, nTo : double);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count(TabN) as CNT, Sum(Smm) as SMM ' +
            ' from ' + cViewDelMeName);
    if nTo >= 0 then begin
      SQL.Add(' where SMM > :nFrom and SMM <= :nTo');
      ParamByName('nFrom').AsFloat := nFrom;
      ParamByName('nTo').AsFloat := nTo; end
    else begin
      SQL.Add(' where SMM > :nFrom');
      ParamByName('nFrom').AsFloat := nFrom;
    end;
    Open;
    if (RecordCount > 0) then begin
      tblPln.Append;
      tblPln.FieldByName('P_From').AsFloat := nFrom;
      if nTo >= 0 then
        tblPln.FieldByName('P_To').AsFloat := nTo;
      tblPln.FieldByName('Cnt').AsFloat := FieldByName('Cnt').AsInteger;
      tblPln.FieldByName('SMM').AsFloat := FieldByName('SMM').AsFloat;
      tblPln.Post;
    end;
  end;
end;
*)

end.
