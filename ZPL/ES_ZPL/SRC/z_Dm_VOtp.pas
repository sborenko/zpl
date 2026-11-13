unit z_Dm_VOtp;

interface

uses
  SysUtils, Classes, DBTables, DB,
  z_DM;

type
  TDmVOtp = class(TDataModule)
    qryVOtp: TQuery;
    qryVOtpNR: TIntegerField;
    qryVOtpKDSPS: TSmallintField;
    qryVOtpDTPROC: TDateTimeField;
    qryVOtpTABN: TIntegerField;
    qryVOtpCUROKLTRF: TFloatField;
    qryVOtpALGRASCH: TSmallintField;
    qryVOtpUSEKOEFOKL: TStringField;
    qryVOtpNCHMATPOM: TStringField;
    qryVOtpNCHBUDMES: TStringField;
    qryVOtpRK: TStringField;
    qryVOtpNRPRIK: TStringField;
    qryVOtpDTPRIK: TDateTimeField;
    qryVOtpDTBEG: TDateTimeField;
    qryVOtpCNTDAYS: TSmallintField;
    qryVOtpDTEND: TDateTimeField;
    qryVOtpCNTCHAS: TFloatField;
    qryVOtpVIDN: TStringField;
    qryVOtpPROCOPL: TFloatField;
    qryVOtpKDTEMU: TSmallintField;
    qryVOtpKDOBJ: TSmallintField;
    qryVOtpKDKATP: TSmallintField;
    qryVOtpKDSPZ: TSmallintField;
    qryVOtpNOTES: TStringField;
    qryVOtpSMSRDN: TFloatField;
    qryVOtpSPEC_NR: TIntegerField;
    qryVOtpSMOTP: TFloatField;
    dsrcVOtp: TDataSource;
    updVOtp: TUpdateSQL;
    qryVOtpNmTemu: TStringField;
    qryVOtpShVidN: TStringField;
    qryVOtpNmVidN: TStringField;
    qryVOtpShObj: TStringField;
    qryVOtpShKatP: TStringField;
    qryVOtpSPZ: TStringField;
    procedure qryVOtpBeforePost(DataSet: TDataSet);
    procedure qryVOtpAfterPost(DataSet: TDataSet);
    procedure qryVOtpCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmVOtp: TDmVOtp;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TDmVOtp.qryVOtpBeforePost(DataSet: TDataSet);
begin
  if qryVOtp.State = dsInsert then // новая запись
    qryVOtp.FieldByName('Spec_NR').AsInteger := DmMain.NewSpec_NR
end;

//------------------------------------------------------------------------------
procedure TDmVOtp.qryVOtpAfterPost(DataSet: TDataSet);
begin
  if qryVOtp.UpdatesPending then
    qryVOtp.ApplyUpdates;
end;

//------------------------------------------------------------------------------
procedure TDmVOtp.qryVOtpCalcFields(DataSet: TDataSet);
begin
  if not qryVOtpKdTemu.IsNull and (qryVOtpKdTemu.AsInteger > 0) then
    qryVOtpNmTemu.AsString := DmMain.KdTemu2NmTemu(qryVOtpKdTemu.AsInteger);
end;

end.
