unit z_otp36;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons,
  DBClient, DBTables, Provider, DBCtrls;

type
  TFormOtp_3_6 = class(TForm)
    qryTmp: TQuery;
    cdsVidN: TClientDataSet;
    dsrcVidN: TDataSource;
    cdsSps: TClientDataSet;
    dsrcSps: TDataSource;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dbgrVidN: TDBGrid;
    Splitter1: TSplitter;
    dbgrSps: TDBGrid;
    cdsVidNVIDN: TStringField;
    cdsVidNSHVIDN: TStringField;
    cdsVidNNMVIDN: TStringField;
    cdsVidNCNT: TIntegerField;
    cdsSpsFAM: TStringField;
    cdsSpsIMA: TStringField;
    cdsSpsOTCH: TStringField;
    cdsSpsNR: TIntegerField;
    cdsSpsKDSPS: TSmallintField;
    cdsSpsSPSRSCH: TSmallintField;
    cdsSpsTABN: TIntegerField;
    cdsSpsVIDN: TStringField;
    cdsSpsOLDKDVIDN: TSmallintField;
    cdsSpsSUMPROC: TFloatField;
    cdsSpsSP: TStringField;
    cdsSpsPRCSOVM: TFloatField;
    cdsSpsDT_BEG: TDateTimeField;
    cdsSpsDT_END: TDateTimeField;
    cdsSpsOLDKDOBJ: TSmallintField;
    cdsSpsKDOBJ: TSmallintField;
    cdsSpsKDKATP: TSmallintField;
    cdsSpsPRCHS: TStringField;
    cdsSpsPRSMM: TStringField;
    cdsSpsKDSPZ: TSmallintField;
    cdsSpsSPEC_NR: TIntegerField;
    cdsSpsNOTES: TStringField;
    cdsSpsNRPRBEG: TStringField;
    cdsSpsDTPRBEG: TDateTimeField;
    cdsSpsNRPREND: TStringField;
    cdsSpsDTPREND: TDateTimeField;
    cdsSpsNRPKT: TIntegerField;
    cdsSpsDTVPKT: TDateTimeField;
    cdsSpsFamIO: TStringField;
    dspTmp: TDataSetProvider;
    LabelCntSpsRec: TLabel;
    dbtNmVidN: TDBText;
    sBtnPrt: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsrcVidNDataChange(Sender: TObject; Field: TField);
    procedure cdsSpsCalcFields(DataSet: TDataSet);
    procedure sBtnPrtClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    procedure CreOpenCdsVidN(dDtPrc : TDateTime);
    procedure CreOpenCdsSps(dDtPrc : TDateTime);
    procedure SetCdsSpsFilter(cVidN : ShortString);
  public
    { Public declarations }
  end;

procedure SpsOtp_3_6(dDtPrc : TDateTime);

const SECTION = 'z_otp36';
var
  FormOtp_3_6: TFormOtp_3_6;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure SpsOtp_3_6(dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormOtp_3_6 := TFormOtp_3_6.Create(Application);
  with FormOtp_3_6 do begin
    d_DtPrc := dDtPrc;
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Сотрудники, находящиеся в отпусках до 3-х ' +
               'и до 6-ти лет, в ' + MesPredl(nM) + ' ' + IntToStr(nY) + ' г.';
    CreOpenCdsVidN(dDtPrc);
    CreOpenCdsSps(dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 475);
    Width  := ReadInteger(SECTION, 'wW', 675);
    dbgrVidN.Width := ReadInteger(SECTION, 'grVidW', 165);
    Free;
  end;
  if FileExists(cDirVids + 'grVid_01.vid') then
    dbgrVidN.Columns.LoadFromFile(cDirVids + 'grVid_01.vid');
  if FileExists(cDirVids + 'grSps_01.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'grSps_01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVidN.Columns.SaveToFile(cDirVids + 'grVid_01.vid');
  dbgrSps.Columns.SaveToFile(cDirVids  + 'grSps_01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grVidW', dbgrVidN.Width);
    Free;
  end;
end;
{
Select distinct n.VidN, kv.ShVidN, kv.NmVidN, Count(n.NR) as CNT
 from z_Nadb n
 Left Outer Join z_KdVidN kv on kv.VidN = n.VidN
 where n.VidN in ('5011','5012') and n.Dt_Beg <= "04/01/2013" and
            (n.Dt_End is NULL or n.Dt_End >= "04/01/2013")
 group by n.VidN, kv.ShVidN, kv.NmVidN
}
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.CreOpenCdsVidN(dDtPrc: TDateTime);
begin
  with cdsVidN do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct n.VidN, kv.ShVidN, kv.NmVidN, Count(n.NR) as CNT '+
            ' from z_Nadb n Left Outer Join z_KdVidN kv on kv.VidN = n.VidN ' +
            ' where n.VidN in ("5011","5012") and n.Dt_Beg <= :dDtPrc and ' +
            ' (n.Dt_End is NULL or n.Dt_End >= :dDtPrc) ' +
            ' group by n.VidN, kv.ShVidN, kv.NmVidN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    dsrcVidN.OnDataChange := NIL;
    while not Eof do begin
      cdsVidN.Append;
      cdsVidNVidN.AsString   := FieldByName('VidN').AsString;
      cdsVidNShVidN.AsString := FieldByName('ShVidN').AsString;
      cdsVidNNmVidN.AsString := FieldByName('NmVidN').AsString;
      cdsVidNCnt.AsString    := FieldByName('Cnt').AsString;
      cdsVidN.Post;
      Next;
    end;
    dsrcVidN.OnDataChange := dsrcVidNDataChange;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  cdsVidN.First;
end;
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.CreOpenCdsSps(dDtPrc: TDateTime);
begin
  with cdsSps do begin
    if Active then Close;
    //CreateDataSet;
    ProviderName := 'dspTmp';
  end;
  cdsSps.ProviderName := 'dspTmp';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcVidN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, n.* from z_Nadb n ' +
            ' Left Outer Join z_Upi u on u.TabN = n.TabN ' +
            ' where n.Dt_Beg <= :dDtPrc and ' +
            ' (n.Dt_End is NULL or n.Dt_End >= :dDtPrc) ' +
            ' order by u.Fam, u.Ima, u.Otch');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  dspTmp.DataSet := qryTmp;
  cdsSps.Open;
  SetCdsSpsFilter(cdsVidNVidN.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.dsrcVidNDataChange(Sender: TObject; Field: TField);
begin
  if (cdsVidN.State = dsBrowse) and cdsSps.Active then
    SetCdsSpsFilter(cdsVidNVidN.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.SetCdsSpsFilter(cVidN: ShortString);
begin
  if (cdsVidN.State = dsBrowse) and cdsSps.Active then with cdsSps do begin
    Filtered := false;
    Filter := 'VidN = ' + cdsVidNVidN.AsString;
    Filtered := true;
    LabelCntSpsRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.cdsSpsCalcFields(DataSet: TDataSet);
begin
  cdsSpsFamIO.AsString := MyFamIO(cdsSpsFam.AsString, cdsSpsIma.AsString,
                                                      cdsSpsOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.sBtnPrtClick(Sender: TObject);
var cVidN, cNmVidN : ShortString;
begin
  cVidN := cdsVidNVidN.AsString;
  cNmVidN := cdsVidNNmVidN.AsString;
  F6PrtOtp36(d_DtPrc, cVidN, cNmVidN, cdsSps);    {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormOtp_3_6.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
