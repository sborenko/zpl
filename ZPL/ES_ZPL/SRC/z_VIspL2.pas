unit z_VIspL2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, DB, DBTables, Grids, DBGrids;

type
  TFormVdIspL2 = class(TForm)
    Panel1: TPanel;
    sBtnPrt: TSpeedButton;
    bBtnCancel: TBitBtn;
    dbgrVed: TDBGrid;
    qryVed: TQuery;
    dsrcVed: TDataSource;
    qryTmp: TQuery;
    qryVedSPEC_NR: TIntegerField;
    qryVedTABN: TIntegerField;
    qryVedVIDN: TStringField;
    qryVedSUMMA: TFloatField;
    qryVedFAM: TStringField;
    qryVedIMA: TStringField;
    qryVedOTCH: TStringField;
    qryVedSUMDOLG: TFloatField;
    qryVedSUMVZN: TFloatField;
    qryVedSPSRSCH: TSmallintField;
    qryVedSP: TStringField;
    qryVedNOMDOK: TStringField;
    qryVedDT_BEG: TDateTimeField;
    qryVedDT_END: TDateTimeField;
    qryVedKOMU: TStringField;
    qryVedADRES: TStringField;
    qryVedKDPST: TIntegerField;
    qryVedPOSTA: TStringField;
    qryVedNOTES_UD: TStringField;
    qryVedNOMSBERBANK: TStringField;
    qryVedLICSCHET: TStringField;
    qryVedRSCHET: TStringField;
    qryVedBANK: TStringField;
    qryVedOKPOBANKA: TStringField;
    qryVedPROC_PSB: TFloatField;
    qryVedSPEC_NR_UD: TIntegerField;
    qryVedDTPROC: TDateTimeField;
    qryVedZAMESGOD: TDateTimeField;
    qryVedNOTES: TStringField;
    qryVedSumForIspL: TFloatField;
    qryVedFamIO: TStringField;
    LabelCntRec: TLabel;
    qryVedSumNalog: TFloatField;
    qryVedKDSPS: TSmallintField;
    qryVedKDSLG: TSmallintField;
    qryVedNRPOST: TStringField;
    qryVedDTPOST: TDateTimeField;
    qryVedDTDOK: TDateTimeField;
    procedure sBtnPrtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryVedCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    d_DtBeg, d_DtEnd : TDateTime;
    procedure OpenQryVed({nTabN : integer; }dDtBeg, dDtEnd : TDateTime);
    function GetSumForIspL2(nTabN : integer; cVidN : ShortString;
                                           dDtProc : TDateTime) : double;
    function GetSumNalog(nTabN: integer; cVidN : ShortString;
                                           dDtProc : TDateTime) : double;
    function GetSmUdrg(nTabN, nSpecNr : integer; dDtPrc : TDateTime) : double;
  public
    { Public declarations }
  end;

procedure ShwVedIspL2(dDtBeg, dDtEnd : TDateTime);

const SECTION = 'z_VIspL2';

var
  FormVdIspL2: TFormVdIspL2;

implementation

uses a_Const, a_DM, z_Main, a_Lib, z_CmnPrt, z_VvDats;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwVedIspL2(dDtBeg, dDtEnd : TDateTime);
begin
  FormVdIspL2 := TFormVdIspL2.Create(Application);
  with FormVdIspL2 do begin
    d_DtBeg := dDtBeg;
    d_DtEnd := dDtEnd;
    OpenQryVed(d_DtBeg, d_DtEnd);
    if bFlagDbg then begin
      Caption := 'Данные для документа за период с ' + DateToStr(d_DtBeg) +
                     ' по ' + DateToStr(d_DtEnd);
      ShowModal; end
    else begin
      if qryVed.RecordCount = 0 then
        ShowMessage('Не найдено записей по видам 6601 и 6647 для ведомости')
      else
        F6PrtVedIspL2(dDtBeg, dDtEnd, qryVed);  {z_CmnPrt}
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL2.OpenQryVed(dDtBeg, dDtEnd : TDateTime);
begin
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select nu.Spec_NR, nu.KdSps, nu.TabN, nu.VidN, nu.Summa, ' +
            ' up.Fam, up.Ima, up.Otch, ud.KdSlg, ud.SumDolg, ud.SumVzn, ' +
            ' ud.SpsRsch, ud.Sp, Upper(ud.NomDok) as NomDok, ud.Dt_Beg, ' +
            ' ud.DtDok, ud.NrPost, ud.DtPost, ' +
            ' ud.Dt_End, ud.Komu, ud.Adres, ud.KdPst, ud.Posta, ' +
            ' ud.Notes as Notes_Ud, ud.NomSberbank, ud.LicSchet, ' +
            ' ud.RSchet, ud.Bank, ud.OkpoBanka, ud.Proc_Psb, ' +
            ' ud.Spec_NR as Spec_NR_UD, nu.DtProc, nu.ZaMesGod, nu.Notes ');
    SQL.Add(' from z_nu nu Left outer join z_uderg ud on ' +
            ' ud.TabN = nu.TabN and ud.Spec_NR = nu.Spec_NR ' +
            ' Left outer join z_upi up on up.TabN = nu.TabN ');
    SQL.Add(' where nu.DtProc >= :dDtBeg and nu.DtProc <= :dDtEnd and ' +
            ' nu.VidN in ("6601","6647") ');
//    SQL.Add(' order by nu.TabN, nu.VidN, nu.DtProc');
    SQL.Add(' order by nu.TabN, nu.VidN, nu.Spec_NR, nu.DtProc');
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    LabelCntRec.Caption := 'Записей ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL2.qryVedCalcFields(DataSet: TDataSet);
begin
  qryVedSumForIspL.AsFloat := GetSumForIspL2(qryVedTabN.AsInteger,
         qryVedVidN.AsString, qryVedDtProc.AsDateTime);
  qryVedFamIO.AsString := MyFamIO(qryVedFam.AsString, qryVedIma.AsString,
                                                           qryVedOtch.AsString);
  qryVedSumNalog.AsFloat := GetSumNalog(qryVedTabN.AsInteger,
          qryVedVidN.AsString, qryVedDtProc.AsDateTime);
end;
//------------------------------------------------------------------------------
function TFormVdIspL2.GetSumForIspL2(nTabN : Integer; cVidN : ShortString;
                                                  dDtProc : TDateTime) : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select TabN, DtProc, Sum(Summa) as SMM from ViNuMain where ' +
            ' TabN = :nTabN and DtProc = :dDtProc');
    if cVidN = '6601' then
      SQL.Add(' and VidN < "6000" and SALIM = "1" ')
    else if cVidN = '6647' then
      SQL.Add(' and VidN < "8000" and DHD = "1" ');
    SQL.Add('group by TabN, DtProc');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtProc').AsDateTime := dDtProc;
    //ParamByName('dDtEnd').AsDateTime := dDtEnd;
    //if cVidN = '6601' then
    //  ParamByName('cVidN').AsString := cVidN;
    Open;
    Result := FieldByName('SMM').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormVdIspL2.GetSumNalog(nTabN : integer; cVidN : ShortString;
                                                  dDtProc : TDateTime) : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select TabN, DtProc, Sum(Summa) as SMM_NLG from ViNuMain where ' +
            ' TabN = :nTabN and DtProc = :dDtProc');
    SQL.Add('and VidN in ("6001","6201","6206","6211","6216") ' +
              'group by TabN, DtProc' );
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtProc').AsDateTime := dDtProc;
    //ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    Result := FieldByName('SMM_NLG').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
   end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 600);
    Free;
  end;
  if FileExists(cDirVids + 'VIspL2.vid') then
    dbgrVed.Columns.LoadFromFile(cDirVids + 'VIspL2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if qryVed.Active then
    dbgrVed.Columns.SaveToFile(cDirVids + 'VIspL2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdIspL2.sBtnPrtClick(Sender: TObject);
begin
  F6PrtVedIspL2(d_DtBeg, d_DtEnd, qryVed);  {z_CmnPrt}
end;

//------------------------------------------------------------------------------
function TFormVdIspL2.GetSmUdrg(nTabN, nSpecNr: integer;
                                                  dDtPrc: TDateTime): double;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Round(Sum(Summa), 2) SmPred from Z_NU ' +
            ' where TabN = :nTabN and DtProc < :dDtPrc and ' +
            ' Spec_NR = :nSpecNR ');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('SmPred').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

end.

