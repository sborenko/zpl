unit z_NdbSvm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  ExtCtrls;

type
  TFormNdbSovm = class(TForm)
    Panel1: TPanel;
    qryNdb: TQuery;
    dsrcNdb: TDataSource;
    dbgrNdb: TDBGrid;
    bBtnCancel: TBitBtn;
    qryNdbNR: TIntegerField;
    qryNdbKDSPS: TSmallintField;
    qryNdbSPSRSCH: TSmallintField;
    qryNdbTABN: TIntegerField;
    qryNdbVIDN: TStringField;
    qryNdbSHVIDN: TStringField;
    qryNdbSUMPROC: TFloatField;
    qryNdbSP: TStringField;
    qryNdbPRCSOVM: TFloatField;
    qryNdbDT_BEG: TDateTimeField;
    qryNdbDT_END: TDateTimeField;
    qryNdbKDOBJ: TSmallintField;
    qryNdbKDKATP: TSmallintField;
    qryNdbPRCHS: TStringField;
    qryNdbPRSMM: TStringField;
    qryNdbKDSPZ: TSmallintField;
    qryNdbSPEC_NR: TIntegerField;
    qryNdbNOTES: TStringField;
    qryNdbNRPRBEG: TStringField;
    qryNdbDTPRBEG: TDateTimeField;
    qryNdbNRPREND: TStringField;
    qryNdbDTPREND: TDateTimeField;
    qryNdbNRPKT: TIntegerField;
    qryNdbDTVPKT: TDateTimeField;
    qryNdbPRC_WT: TFloatField;
    qryNdbZP13: TStringField;
    qryNdbOTP: TStringField;
    qryNdbBLN: TStringField;
    qryNdbDKR: TStringField;
    qryNdbOTPUSKN: TStringField;
    qryNdbBOLNIC: TStringField;
    qryNdbSPRM: TStringField;
    qryNdbCPRM: TStringField;
    qryNdbSSRK: TStringField;
    qryNdbDETI: TStringField;
    qryNdbDETIM: TStringField;
    qryNdbDETIK: TStringField;
    qryNdbDETIG: TStringField;
    qryNdbIND: TStringField;
    qryNdbDHD: TStringField;
    qryNdbOKLFND: TStringField;
    qryNdbCBUDG: TStringField;
    qryNdbSNDB: TStringField;
    qryNdbSPDN: TStringField;
    qryNdbSWSB: TStringField;
    qryNdbSPRF: TStringField;
    qryNdbSPENS: TStringField;
    qryNdbSALIM: TStringField;
    qryNdbCNDB: TStringField;
    qryNdbSSOCSTRAH: TStringField;
    qryNdbSBZR: TStringField;
    qryNdbSP_PF: TStringField;
    qryNdbSP_FSTVP: TStringField;
    qryNdbSP_FSNV: TStringField;
    qryNdbSP_FZ: TStringField;
    qryNdbSOVM: TStringField;
    qryNdbSPOV: TStringField;
    qryNdbKEKV: TStringField;
    qryNdbKDSCHDT: TSmallintField;
    qryNdbKDSCHKT: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure OpenQryNdb(nTabN : integer);
  public
    { Public declarations }
  end;

procedure ShwNadbSovm(nTabN : integer);

const SECTION = 'z_NdbSvm';

var
  FormNdbSovm: TFormNdbSovm;

implementation

uses A_Const, A_Lib, A_DM, Z_Dm, Z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwNadbSovm(nTabN : integer);
begin
  FormNdbSovm := TFormNdbSovm.Create(Application);
  with FormNdbSovm do begin
    Caption := '"Совместительские" надбавки для ТабНр ' + IntToStr(nTabN);
    OpenQryNdb(nTabN);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNdbSovm.OpenQryNdb(nTabN: integer);
begin
  with qryNdb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_ViNadb where TabN = :nTabN and Sovm = 1 ' +
            ' order by Dt_Beg');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNdbSovm.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 368);
    Width  := ReadInteger(SECTION, 'wW', 1055);
    Free;
  end;
  if FileExists(cDirVids + 'NdbSvm01.vid') then
    dbgrNdb.Columns.LoadFromFile(cDirVids + 'NdbSvm01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormNdbSovm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrNdb.Columns.SaveToFile(cDirVids + 'NdbSvm01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;

end.
