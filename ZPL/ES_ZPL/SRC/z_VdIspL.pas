unit z_VdIspL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, ExtCtrls;

type
  TFormVdIspL = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    QryVed: TQuery;
    dsrcVed: TDataSource;
    dbgrVed: TDBGrid;
    sBtnPrt: TSpeedButton;
    QryVedSPEC_NR: TIntegerField;
    QryVedTABN: TIntegerField;
    QryVedVIDN: TStringField;
    QryVedSUMMA: TFloatField;
    QryVedFAM: TStringField;
    QryVedIMA: TStringField;
    QryVedOTCH: TStringField;
    QryVedSUMDOLG: TFloatField;
    QryVedSUMVZN: TFloatField;
    QryVedSPSRSCH: TSmallintField;
    QryVedSP: TStringField;
    QryVedNOMDOK: TStringField;
    QryVedDT_BEG: TDateTimeField;
    QryVedDT_END: TDateTimeField;
    QryVedKOMU: TStringField;
    QryVedADRES: TStringField;
    QryVedKDPST: TIntegerField;
    QryVedPOSTA: TStringField;
    QryVedNOTES_UD: TStringField;
    QryVedNOMSBERBANK: TStringField;
    QryVedLICSCHET: TStringField;
    QryVedRSCHET: TStringField;
    QryVedBANK: TStringField;
    QryVedOKPOBANKA: TStringField;
    QryVedPROC_PSB: TFloatField;
    QryVedSPEC_NR_UD: TIntegerField;
    QryVedDTPROC: TDateTimeField;
    QryVedZAMESGOD: TDateTimeField;
    QryVedNOTES: TStringField;
    QryVedSumForIspL: TFloatField;
    qryTmp: TQuery;
    QryVedFamIO: TStringField;
    LabelCntRec: TLabel;
    procedure QryVedCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    nY, nM, nD : word;
    dMesPeremenNICH : TDateTime;
    procedure OpenQryVed(dDtPrc : TDateTime);
    function GetSumForIspL(nTabN : integer; cVidN : ShortString;
                                                   dDtPrc : TDateTime) : double;
  public
    { Public declarations }
  end;

procedure ShwVedIspL(dDtPrc : TDateTime);

const SECTION = 'z_VdIspL';

var
  FormVdIspL: TFormVdIspL;

implementation

uses a_Const, a_DM, z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwVedIspL(dDtPrc : TDateTime);
begin
  FormVdIspL := TFormVdIspL.Create(Application);
  with FormVdIspL do begin
    OpenQryVed(dDtPrc);
    d_DtPrc := dDtPrc;
    dMesPeremenNICH := EncodeDate(2007, 12, 1);
    if bFlagDbg then begin
      DecodeDate(dDtPrc, nY, nM, nD);
      Caption := 'Данные для ведомости за ' +
                                 MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
      ShowModal; end
    else begin
      if qryVed.RecordCount = 0 then
        ShowMessage('Не найдено записей по видам 6601 и 6647 для ведомости')
      else
        F6PrtVedIspL(dDtPrc, qryVed);  {z_CmnPrt}
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL.OpenQryVed(dDtPrc : TDateTime);
begin
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select nu.Spec_NR, nu.KdSps, nu.TabN, nu.VidN, nu.Summa, ' +
            ' up.Fam, up.Ima, up.Otch, ud.SumDolg, ud.SumVzn, ' +
            ' ud.SpsRsch, ud.Sp, ud.NomDok, ud.Dt_Beg, ' +
            ' ud.Dt_End, ud.Komu, ud.Adres, ud.KdPst, ud.Posta, ' +
            ' ud.Notes as Notes_Ud, ud.NomSberbank, ud.LicSchet, ' +
            ' ud.RSchet, ud.Bank, ud.OkpoBanka, ud.Proc_Psb, ' +
            ' ud.Spec_NR as Spec_NR_UD, nu.DtProc, nu.ZaMesGod, nu.Notes ');
    SQL.Add(' from z_nu nu Left outer join z_uderg ud on ' +
            ' ud.TabN = nu.TabN and ud.Spec_NR = nu.Spec_NR ' +
            ' Left outer join z_upi up on up.TabN = nu.TabN ');
    SQL.Add(' where nu.dtProc = :dDtPrc and nu.VidN in ("6601","6647") ');
    SQL.Add(' order by nu.TabN, nu.Spec_NR, nu.VidN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    LabelCntRec.Caption := 'Записей ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL.QryVedCalcFields(DataSet: TDataSet);
begin
  qryVedSumForIspL.AsFloat := GetSumForIspL(qryVedTabN.AsInteger,
                                                 qryVedVidN.AsString, d_DtPrc);
  qryVedFamIO.AsString := MyFamIO(qryVedFam.AsString, qryVedIma.AsString,
                                                          qryVedOtch.AsString);
end;
//------------------------------------------------------------------------------
function TFormVdIspL.GetSumForIspL(nTabN : integer; cVidN : ShortString;
                                                   dDtPrc : TDateTime) : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Sum(Summa) as SMM from ViNuMain where TabN = :nTabN and ' +
            ' DtProc = :dDtPrc ');
    if cVidN = '6601' then
      SQL.Add(' and VidN < :cVidN and SALIM = "1" ')
    else if cVidN = '6647' then
      SQL.Add(' and VidN < "8000" and DHD = "1" ');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    if cVidN = '6601' then
      ParamByName('cVidN').AsString := cVidN;
    Open;
    Result := FieldByName('SMM').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 600);
    Free;
  end;
  if FileExists(cDirVids + 'VdIspL.vid') then
    dbgrVed.Columns.LoadFromFile(cDirVids + 'VdIspL.vid');
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryVed.Active then
    dbgrVed.Columns.SaveToFile(cDirVids + 'VdIspL.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL.sBtnPrtClick(Sender: TObject);
begin
  F6PrtVedIspL(d_DtPrc, qryVed);  {z_CmnPrt}
end;

end.
