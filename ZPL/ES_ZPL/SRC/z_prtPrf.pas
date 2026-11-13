unit z_prtPrf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, DBTables, Buttons, StdCtrls, ExtCtrls,
  DBClient, Provider;

type
  TFormPrtProf = class(TForm)
    Panel1: TPanel;
    bBtnExit: TBitBtn;
    sBtnPrt01: TSpeedButton;
    qryNu: TQuery;
    dsrcNU: TDataSource;
    dbgrNu: TDBGrid;
    Splitter1: TSplitter;
    dbgrProf: TDBGrid;
    cdsProf: TClientDataSet;
    dsrcProf: TDataSource;
    qryTmp: TQuery;
    cdsProfNR: TAutoIncField;
    cdsProfKdObj: TIntegerField;
    cdsProfNmObj: TStringField;
    cdsProfShObj: TStringField;
    cdsProfFamIO: TStringField;
    cdsProfTabN: TIntegerField;
    cdsProfSmNach: TFloatField;
    cdsProfSmProf: TFloatField;
    dspTmp: TDataSetProvider;
    cdsTmp: TClientDataSet;
    sBtnPrt02: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrt01Click(Sender: TObject);
    procedure sBtnPrt02Click(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    procedure OpenQryNu(dDtProc : TDateTime);
    procedure CreOpenCdsTmp(dDtProc : TDateTime);
    function MySmNach(nTabN : integer) : double;
    procedure CreOpenCdsProf;
  public
    { Public declarations }
  end;

procedure PrtVedProfCurMes(dDtProc : TDateTime);

const SECTION = 'z_prtPrf';

var
  FormPrtProf: TFormPrtProf;

implementation

uses a_Const, a_Lib, z_DM, z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure PrtVedProfCurMes(dDtProc : TDateTime);
var cMsg : string;
    nY, nM, nD : word;
begin
  FormPrtProf := TFormPrtProf.Create(Application);
  with FormPrtProf do begin
    d_DtProc := dDtProc;
    OpenQryNu(dDtProc);
    if qryNu.RecordCount = 0 then begin
      DecodeDate(dDtProc, nY, nM, nD);
      cMsg := 'Начислений по виду "6021" (ПрофВзносы) за ' +
               MesRus(nM) + ' ' + IntToStr(nY) + ' г. не обнаружено';
      ShowMessage(cMsg); end
    else begin
      Caption := 'Печать ведомостей профсоюзных взносов';
      CreOpenCdsTmp(dDtProc);
      CreOpenCdsProf;
      Splitter1.Visible := false; // bFlagDbg;
      dbgrNu.Visible := false;    // bFlagDbg;
      ShowModal;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtProf.OpenQryNu(dDtProc : TDateTime);
begin
  with qryNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select nu.TabN, upi.Fam, upi.Ima, upi.Otch, nu.KdObj, ' +
                        ' Sum(nu.Summa) as SmProf from z_Nu nu ' +
            ' Left Outer Join z_Upi upi on upi.TabN = nu.TabN ' +
            ' where (nu.DtProc = :dDtProc) and (nu.VidN = "6021") ' +
            ' group by nu.TabN, upi.Fam, upi.Ima, upi.Otch, nu.KdObj');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtProf.CreOpenCdsTmp(dDtProc : TDateTime);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select nu.TabN, Sum(nu.Summa) as SmNach ' +
            ' from Z_NU nu, z_KdVidN kvd ' +
            ' where (nu.DtProc = :dDtProc) and (nu.VidN < "60") and ' +
            ' (kvd.VidN = nu.VidN) and (kvd.SPrf = 1) ' +
            ' group by nu.TabN');
    ParamByName('dDtProc').AsDateTime := dDtProc;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsTmp do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtProf.CreOpenCdsProf;
var nTabN, nKdObj : integer;
    cFamIO, cNmObj, cShObj : string;
    nSmNach, nSmProf : double;
begin
  with cdsProf do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    CreateDataSet;
    Open;
  end;
  with qryNU do begin
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                    FieldByName('Ima').AsString, FieldByName('Otch').AsString);
      nKdObj := FieldByName('KdObj').AsInteger;
      cShObj := DmMain.KdObj2ShObj(nKdObj, cNmObj);
      nSmNach := MySmNach(nTabN);
      nSmProf := 0;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        nSmProf := nSmProf - FieldByName('SmProf').AsFloat;
        Next;
      end;
      if nSmProf <> 0 then begin
        cdsProf.Append;
        cdsProf.FieldByName('KdObj').AsInteger := nKdObj;
        cdsProf.FieldByName('TabN').AsInteger  := nTabN;
        cdsProf.FieldByName('NmObj').AsString  := cNmObj;
        cdsProf.FieldByName('ShObj').AsString  := cShObj;
        cdsProf.FieldByName('FamIO').AsString  := cFamIO;
        cdsProf.FieldByName('SmNach').AsFloat  := nSmNach;
        cdsProf.FieldByName('SmProf').AsFloat  := nSmProf;
        cdsProf.Post;
      end;
    end;
    First;
//    Close;
//    SQL.Clear;
//    DataBaseName := '';
  end;
  if qryTmp.Prepared then
    qryTmp.UnPrepare;
  cdsProf.AddIndex('OnObjFIO', 'KdObj;FamIO', []);
  cdsProf.IndexName := 'OnObjFIO';
  cdsProf.First;
end;
//------------------------------------------------------------------------------
function TFormPrtProf.MySmNach(nTabN : integer) : double;
begin
  Result := 0;
  if cdsTmp.Locate('TabN', nTabN, []) then
    Result := cdsTmp.FieldByName('SmNach').AsFloat;
end;
//------------------------------------------------------------------------------
procedure TFormPrtProf.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 480);
    Width  := ReadInteger(SECTION, 'wW', 650);
    Free;
  end;
  if FileExists(cDirVids + 'PrtPrfs.Vid') then
    dbgrProf.Columns.LoadFromFile(cDirVids + 'PrtPrfs.Vid');
end;
//------------------------------------------------------------------------------
procedure TFormPrtProf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrProf.Columns.SaveToFile(cDirVids + 'PrtPrfs.Vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtProf.sBtnPrt01Click(Sender: TObject);
begin
  F6_PrtVedProf(d_DtProc, cdsProf, 1);       {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormPrtProf.sBtnPrt02Click(Sender: TObject);
begin
  F6_PrtVedProf(d_DtProc, cdsProf, 2);       {z_CmnPrt}
end;

end.
