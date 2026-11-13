unit z_ShZRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, Provider, DBClient, DBTables,
  StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  string4 = string[4];
  TFormShwZprRes = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    qryTmp: TQuery;
    cdsTmp: TClientDataSet;
    dspTmp: TDataSetProvider;
    dsrcTmp: TDataSource;
    dbgrTmp: TDBGrid;
    cdsTmpFAM: TStringField;
    cdsTmpIMA: TStringField;
    cdsTmpOTCH: TStringField;
    cdsTmpPSCH: TStringField;
    cdsTmpSCHBU: TStringField;
    cdsTmpNMSCH: TStringField;
    cdsTmpSHVIDN: TStringField;
    cdsTmpNMVIDN: TStringField;
    cdsTmpOLDKDVIDN: TSmallintField;
    cdsTmpVID_KDSPZ: TSmallintField;
    cdsTmpKEKV: TStringField;
    cdsTmpNR: TIntegerField;
    cdsTmpDTPROC: TDateTimeField;
    cdsTmpZAMESGOD: TDateTimeField;
    cdsTmpTABN: TIntegerField;
    cdsTmpVIDN: TStringField;
    cdsTmpCHAS: TFloatField;
    cdsTmpSUMMA: TFloatField;
    cdsTmpDT_BEG: TDateTimeField;
    cdsTmpDT_END: TDateTimeField;
    cdsTmpKDSPS: TSmallintField;
    cdsTmpKDOBJ: TSmallintField;
    cdsTmpKDKATP: TSmallintField;
    cdsTmpKDSPZ: TSmallintField;
    cdsTmpPDN: TSmallintField;
    cdsTmpNOTES: TStringField;
    cdsTmpPRR: TSmallintField;
    cdsTmpPRPV: TSmallintField;
    cdsTmpKTO: TSmallintField;
    cdsTmpPRKR: TSmallintField;
    cdsTmpMYNOTES: TStringField;
    cdsTmpSPECPS: TIntegerField;
    cdsTmpSPEC_NR: TIntegerField;
    cdsTmpOLDKDOBJ: TSmallintField;
    cdsTmpFamIO: TStringField;
    sBtnPrt: TSpeedButton;
    DBNavigator1: TDBNavigator;
    LabelInf: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsTmpCalcFields(DataSet: TDataSet);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    c_VidN : string4;
    d_DtMes : TDateTime;
    n_CaseMes : word;
    procedure CreOpenCdsTmp(cVidN : string4;
                                         dDtMes :TDateTime; nCaseMes : word);
  public
    { Public declarations }
  end;

procedure ShwZprRes(cVidN : string4; dDtMes :TDateTime; nCaseMes : word);

const SECTION = 'z_ShZRes';

var
  FormShwZprRes: TFormShwZprRes;

implementation

uses a_Const, a_DM, z_DM, z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwZprRes(cVidN : string4; dDtMes :TDateTime; nCaseMes : word);
var cMsg : string; nY, nM, nD : word;
begin
  FormShwZprRes := TFormShwZprRes.Create(Application);
  with FormShwZprRes do begin
    c_VidN := cVidN;
    d_DtMes := dDtMes;
    n_CaseMes := nCaseMes;
    CreOpenCdsTmp(cVidN, dDtMes, nCaseMes);
    if cdsTmp.RecordCount = 0 then
      ShowMessage('Не найдено записей по заданным условиям')
    else begin
      DecodeDate(dDtMes, nY, nM, nD);
      cMsg := 'Результат запроса:  Вид ' + cVidN + ' [' +
                                             cdsTmpShVidN.AsString + '] ';
      if nCaseMes = 1 then
        cMsg := cMsg + ' в ' + MesPredl(nM)
      else
        cMsg := cMsg + ' за ' + MesRus(nM);
      cMsg := cMsg + ' ' + IntToStr(nY) + ' г.';
      Caption := cMsg;
      ShowModal;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwZprRes.CreOpenCdsTmp(cVidN : string4;
                                         dDtMes :TDateTime; nCaseMes : word);
var cSQL : string; nCntSotr, nCntRec, nTabN : integer; nSmm : double;
begin
  LabelInf.Caption := '';
  cSQL := 'Select u.Fam, u.Ima, u.Otch, nu.* from viNu4 nu ' +
          ' Left Outer join z_Upi u on u.TabN = nu.TabN ' +
          ' where ';
  if nCaseMes = 1 then
    cSQL := cSQL + ' nu.DtProc = '
  else
    cSQL := cSQL + ' nu.ZaMesGod = ';
  cSQL := cSQL + ' :dDtMes and nu.VidN = :cVidN order by nu.TabN';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add(cSQL);
    ParamByName('dDtMes').AsDateTime := dDtMes;
    ParamByName('cVidN').AsString := cVidN;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsTmp do begin
    if Active then Close;
    ProviderName := 'dspTmp';
    Open;
    DisableControls;
    nCntSotr := 0;
    nCntRec := RecordCount;
    nTabN := -999;
    nSmm := 0;
    First;
    while not Eof do begin
      nSmm := nSmm + FieldByName('Summa').AsFloat;
      if FieldByName('TabN').AsInteger <> nTabN then begin
        nTabN := FieldByName('TabN').AsInteger;
        Inc(nCntSotr);
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  LabelInf.Caption := 'Записей ' + IntToStr(nCntRec) + ', сотрудников ' +
                      IntToStr(nCntSotr) + '. Сумма ' +
                                         FloatToStrF(nSmm, ffCurrency, 18, 2);
end;
//------------------------------------------------------------------------------
procedure TFormShwZprRes.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 400);
    Free;
  end;
  if FileExists(cDirVids + 'ShZRes.vid') then
    dbgrTmp.Columns.LoadFromFile(cDirVids + 'ShZRes.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwZprRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrTmp.Columns.SaveToFile(cDirVids + 'ShZRes.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwZprRes.cdsTmpCalcFields(DataSet: TDataSet);
begin
  cdsTmpFamIO.AsString := MyFamIO(cdsTmpFam.AsString, cdsTmpIma.AsString,
                                                         cdsTmpOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShwZprRes.sBtnPrtClick(Sender: TObject);
var cShVidN, cNmVidN : ShortString;
begin
  cShVidN := cdsTmpShVidN.AsString;
  cNmVidN := cdsTmpNmVidN.AsString;
  F6PrtResVidN(c_VidN, cShVidN, cNmVidN, d_DtMes, n_CaseMes, cdsTmp); {z_CmnPrt}
end;

end.
