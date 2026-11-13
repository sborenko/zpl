unit z_GtSpNr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB,
  DBTables;

type
  TFormGetSpecNR = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    bBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    dbgrVOtp: TDBGrid;
    dbgrVBln: TDBGrid;
    dbgrUdrg: TDBGrid;
    qryVOtp: TQuery;
    dsrcVOtp: TDataSource;
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
    qryVOtpKDOBJ: TSmallintField;
    qryVOtpKDKATP: TSmallintField;
    qryVOtpKDSPZ: TSmallintField;
    qryVOtpNOTES: TStringField;
    qryVOtpSMSRDN: TFloatField;
    qryVOtpSPEC_NR: TIntegerField;
    qryVOtpSMOTP: TFloatField;
    qryVBln: TQuery;
    dsrcVBln: TDataSource;
    qryVBlnNR: TIntegerField;
    qryVBlnKDSPS: TSmallintField;
    qryVBlnDTPROC: TDateTimeField;
    qryVBlnTABN: TIntegerField;
    qryVBlnALGRASCH: TSmallintField;
    qryVBlnNCHBUDMES: TStringField;
    qryVBlnNRLIST: TStringField;
    qryVBlnDTLIST: TDateTimeField;
    qryVBlnDTBEG: TDateTimeField;
    qryVBlnDTEND: TDateTimeField;
    qryVBlnCNTDAYS: TSmallintField;
    qryVBlnVIDN: TStringField;
    qryVBlnOLDKDVIDN: TSmallintField;
    qryVBlnCNTCHAS: TFloatField;
    qryVBlnPROCOPL: TFloatField;
    qryVBlnKDOBJ: TSmallintField;
    qryVBlnKDKATP: TSmallintField;
    qryVBlnKDSPZ: TSmallintField;
    qryVBlnNOTES: TStringField;
    qryVBlnSMSRDN: TFloatField;
    qryVBlnSMBLN: TFloatField;
    qryVBlnSPEC_NR: TIntegerField;
    qryUdrg: TQuery;
    dsrcUdrg: TDataSource;
    qryUdrgNR: TIntegerField;
    qryUdrgKDSPS: TSmallintField;
    qryUdrgTABN: TIntegerField;
    qryUdrgVIDN: TStringField;
    qryUdrgOLDKDVIDN: TSmallintField;
    qryUdrgSUMDOLG: TFloatField;
    qryUdrgSUMVZN: TFloatField;
    qryUdrgSPSRSCH: TSmallintField;
    qryUdrgSP: TStringField;
    qryUdrgNOMDOK: TStringField;
    qryUdrgDT_BEG: TDateTimeField;
    qryUdrgDT_END: TDateTimeField;
    qryUdrgKDSPZ: TSmallintField;
    qryUdrgKDRSSCH: TIntegerField;
    qryUdrgKOMU: TStringField;
    qryUdrgADRES: TStringField;
    qryUdrgKDPST: TIntegerField;
    qryUdrgPOSTA: TStringField;
    qryUdrgNOTES: TStringField;
    qryUdrgNOMSBERBANK: TStringField;
    qryUdrgLICSCHET: TStringField;
    qryUdrgRSCHET: TStringField;
    qryUdrgBANK: TStringField;
    qryUdrgOKPOBANKA: TStringField;
    qryUdrgPROC_PSB: TFloatField;
    qryUdrgSPEC_NR: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrVOtpDblClick(Sender: TObject);
    procedure dbgrVBlnDblClick(Sender: TObject);
    procedure dbgrUdrgDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryVOtp(nTabN : integer);
    procedure OpenQryVBln(nTabN : integer);
    procedure OpenQryUdrg(nTabN : integer);
  public
    { Public declarations }
  end;

function GetOtpSpecNR(nTabN : integer; var cMyNotes : ShortString) : integer;
function GetBlnSpecNR(nTabN : integer; var cMyNotes : ShortString) : integer;
function GetAlmSpecNR(nTabN : integer; var cMyNotes : ShortString) : integer;

const SECTION = 'z_GtSpNr';

var
  FormGetSpecNR: TFormGetSpecNR;

implementation

uses A_Const, Z_DM, Z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetOtpSpecNR(nTabN : integer; var cMyNotes : ShortString) : integer;
begin
  Result := 0;
  cMyNotes := '';
  FormGetSpecNR := TFormGetSpecNR.Create(Application);
  with FormGetSpecNR do begin
    Caption := 'Выбор документа-основания к вводимому отклонению.';
    PageControl1.ActivePage := ts1;
    OpenQryVOtp(nTabN);
    if qryVOtp.RecordCount <= 0 then begin
      ShowMessage('Нет записей об отпусках, на которые можно сослаться.' +
               #13#10 + 'Допускается ввод записи об отклонении без ссылки');
      Result := -7;
      cMyNotes := 'без ссылки'; end
    else begin
      if ShowModal = mrOk then begin
        Result := qryVOtp.FieldByName('Spec_NR').AsInteger;
        cMyNotes := qryVOtp.FieldByName('NrPrik').AsString + ' ' +
                               qryVOtp.FieldByName('DtPrik').AsString;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetBlnSpecNR(nTabN : integer; var cMyNotes : ShortString) : integer;
begin
  Result := 0;
  cMyNotes := '';
  FormGetSpecNR := TFormGetSpecNR.Create(Application);
  with FormGetSpecNR do begin
    Caption := 'Выбор документа-основания к вводимому отклонению.';
    PageControl1.ActivePage := ts2;
    OpenQryVBln(nTabN);
    if qryVBln.RecordCount <= 0 then begin
      ShowMessage('Нет записей о больничных, на которые можно сослаться.' +
               #13#10 + 'Допускается ввод записи об отклонении без ссылки');
      Result := -7;
      cMyNotes := 'без ссылки'; end
    else begin
      if ShowModal = mrOk then begin
        Result := qryVBln.FieldByName('Spec_NR').AsInteger;
        cMyNotes := qryVBln.FieldByName('NrList').AsString + ' ' +
                               qryVBln.FieldByName('DtList').AsString;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetAlmSpecNR(nTabN : integer; var cMyNotes : ShortString) : integer;
begin
  Result := 0;
  cMyNotes := '';
  FormGetSpecNR := TFormGetSpecNR.Create(Application);
  with FormGetSpecNR do begin
    Caption := 'Выбор документа-основания к вводимому отклонению.';
    PageControl1.ActivePage := ts3;
    OpenQryUdrg(nTabN);
    if qryUdrg.RecordCount <= 0 then begin
      ShowMessage('Нет записей об алиментах, на которые можно сослаться.' +
               #13#10 + 'Ввод записи об отклонении без ссылки не допускается');
      Result := 0;
      cMyNotes := ''; end
    else begin
      if ShowModal = mrOk then begin
        Result := qryUdrg.FieldByName('Spec_NR').AsInteger;
        cMyNotes := qryUdrg.FieldByName('NomDok').AsString + ' ' +
                               qryUdrg.FieldByName('Dt_Beg').AsString;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetSpecNR.OpenQryVOtp(nTabN : integer);
begin
  with qryVOtp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VOtp where TabN = :nTabN ' +
            ' order by DtProc, DtBeg');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetSpecNR.OpenQryVBln(nTabN : integer);
begin
  with qryVBln do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VBln where TabN = :nTabN ' +
            ' order by DtProc, DtBeg');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetSpecNR.OpenQryUdrg(nTabN : integer);
begin
  with qryUdrg do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Uderg where TabN = :nTabN ' +
            ' order by Dt_Beg, Dt_End');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetSpecNR.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 500);
    Free;
  end;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  ts3.TabVisible := false;
  if FileExists(cDirVids + 'GtNrVOtp.vid') then
    dbgrVOtp.Columns.LoadFromFile(cDirVids + 'GtNrVOtp.vid');
  if FileExists(cDirVids + 'GtNrVBln.vid') then
    dbgrVBln.Columns.LoadFromFile(cDirVids + 'GtNrVBln.vid');
  if FileExists(cDirVids + 'GtNrUdrg.vid') then
    dbgrUdrg.Columns.LoadFromFile(cDirVids + 'GtNrUdrg.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGetSpecNR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVOtp.Columns.SaveToFile(cDirVids + 'GtNrVOtp.vid');
  dbgrVBln.Columns.SaveToFile(cDirVids + 'GtNrVBln.vid');
  dbgrUdrg.Columns.SaveToFile(cDirVids + 'GtNrUdrg.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetSpecNR.dbgrVOtpDblClick(Sender: TObject);
begin
  if qryVOtp.Active and (qryVOtp.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGetSpecNR.dbgrVBlnDblClick(Sender: TObject);
begin
  if qryVBln.Active and (qryVBln.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGetSpecNR.dbgrUdrgDblClick(Sender: TObject);
begin
  if qryUdrg.Active and (qryUdrg.RecordCount > 0) then
    ModalResult := mrOk;
end;

end.
