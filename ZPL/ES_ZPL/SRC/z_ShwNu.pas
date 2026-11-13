unit z_ShwNu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  DBTables;

type
  TFormShwNu = class(TForm)
    qryNuS: TQuery;
    qryNuD: TQuery;
    dbgrNuD: TDBGrid;
    Splitter1: TSplitter;
    PanelBottom: TPanel;
    dbgrNuS: TDBGrid;
    bBtnCancel: TBitBtn;
    dsrcNuD: TDataSource;
    qryNuDVIDN: TStringField;
    qryNuDSHVIDN: TStringField;
    qryNuDPSCH: TStringField;
    qryNuDSCHBU: TStringField;
    qryNuDOLDKDVIDN: TSmallintField;
    qryNuDVID_KDSPZ: TSmallintField;
    qryNuDKDSCHDT: TSmallintField;
    qryNuDSCHDT: TStringField;
    qryNuDKDSCHKT: TSmallintField;
    qryNuDSCHKT: TStringField;
    qryNuDKEKV: TStringField;
    qryNuDNR: TIntegerField;
    qryNuDDTPROC: TDateTimeField;
    qryNuDZAMESGOD: TDateTimeField;
    qryNuDTABN: TIntegerField;
    qryNuDCHAS: TFloatField;
    qryNuDSUMMA: TFloatField;
    qryNuDDT_BEG: TDateTimeField;
    qryNuDDT_END: TDateTimeField;
    qryNuDKDSPS: TSmallintField;
    qryNuDKDOBJ: TSmallintField;
    qryNuDKDKATP: TSmallintField;
    qryNuDKDSPZ: TSmallintField;
    qryNuDPDN: TSmallintField;
    qryNuDNOTES: TStringField;
    qryNuDPRR: TSmallintField;
    qryNuDPRPV: TSmallintField;
    qryNuDKTO: TSmallintField;
    qryNuDPRKR: TSmallintField;
    qryNuDMYNOTES: TStringField;
    qryNuDSPECPS: TIntegerField;
    qryNuDSPEC_NR: TIntegerField;
    qryNuDOLDKDOBJ: TSmallintField;
    qryNuDZP13: TStringField;
    qryNuDOTP: TStringField;
    qryNuDBLN: TStringField;
    qryNuDOTPUSKN: TStringField;
    qryNuDBOLNIC: TStringField;
    qryNuDSPRM: TStringField;
    qryNuDCPRM: TStringField;
    qryNuDDETI: TStringField;
    qryNuDDETIM: TStringField;
    qryNuDDETIK: TStringField;
    qryNuDDETIG: TStringField;
    qryNuDIND: TStringField;
    qryNuDDHD: TStringField;
    qryNuDOKLFND: TStringField;
    qryNuDCBUDG: TStringField;
    qryNuDSNDB: TStringField;
    qryNuDSPDN: TStringField;
    qryNuDSPRF: TStringField;
    qryNuDSPENS: TStringField;
    qryNuDSALIM: TStringField;
    qryNuDCNDB: TStringField;
    qryNuDSSOCSTRAH: TStringField;
    qryNuDSBZR: TStringField;
    qryNuDSP_PF: TStringField;
    qryNuDSP_FSTVP: TStringField;
    qryNuDSP_FSNV: TStringField;
    qryNuDSP_FZ: TStringField;
    qryNuDSOVM: TStringField;
    qryNuDSPOV: TStringField;
    qryNuDNMVIDN: TStringField;
    qryNuDNMSCH: TStringField;
    dsrcNuS: TDataSource;
    qryNuSPSCH: TStringField;
    qryNuSSCHBU: TStringField;
    qryNuSVIDN: TStringField;
    qryNuSSHVIDN: TStringField;
    qryNuSSMM: TFloatField;
    sBtnStOnTop: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    LabelFamIO: TLabel;
    sBtnUchKart: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrNuDEnter(Sender: TObject);
    procedure dbgrNuDExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnStOnTopClick(Sender: TObject);
    procedure bBtnCancelClick(Sender: TObject);
    procedure dbgrNuDDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrNuSDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    dsrc_PV : TDataSource;
    d_DtPrc : TDateTime;
    procedure SetFormStyle;
    procedure OpenQryDS(dDtPrc : TDateTime; dsrcPV : TDataSource);
  public
    { Public declarations }
    procedure ShowSmNaRuki;
  end;

procedure ShwNu(dDtPrc : TDateTime; dsrcPV : TDataSource);

const SECTION = 'z_ShwNU';

var
  FormShwNu: TFormShwNu;

implementation

uses a_Const, a_Dm, z_Main, a_Lib, z_VedV;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwNu(dDtPrc : TDateTime; dsrcPV : TDataSource);
var nY, nM, nD : word;
begin
  if not bIsFormShwNU then begin
    FormShwNu := TFormShwNu.Create(Application);
    with FormShwNu do begin
      dsrc_PV := dsrcPV;
      d_DtPrc := dDtPrc;
      bIsFormShwNU := true;
      DecodeDate(dDtPrc, nY, nM, nD);
      Caption := 'Ќачислени€ и удержани€ в ' +
                         MesPredlogn(nM) + ' ' + IntToStr(nY) + ' г.';
      OpenQryDS(dDtPrc, dsrcPv);
      LabelFamIO.Caption := dsrcPV.DataSet.FieldByName('FamIO').AsString;
      Show;
    end; end
  else begin
    if FormShwNu.WindowState = wsMinimized then
      FormShwNu.WindowState := wsNormal;
    FormShwNu.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.OpenQryDS(dDtPrc : TDateTime; dsrcPV : TDataSource);
begin
  with qryNuD do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPv;
    SQL.Add('Select * from ViNu_Main where TabN = :TabN and ' +
            ' DtProc = :dDtPrc and VidN < "8000" order by VidN, ZaMesGod');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
  with qryNuS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPv;
    SQL.Add('Select PSCH, SchBU, VidN, ShVidN, Sum(Summa) as SMM ' +
            ' from ViNu_Main where TabN = :TabN and ' +
            ' DtProc = :dDtPrc and VidN < "8000" ' +
            ' group by PSCH, SchBU, VidN, ShVidN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
  ShowSmNaRuki;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 365);
    Width  := ReadInteger(SECTION, 'wW', 545);
    PanelBottom.Height := ReadInteger(SECTION, 'pnlBttmH', 150);
    sBtnStOnTop.Down := ReadBool(SECTION, 'bStOnTop', true);
    Free;
  end;
  if FileExists(cDirVids + 'ShNuD01.vid') then
    dbgrNuD.Columns.LoadFromFile(cDirVids + 'ShNuD01.vid');
  if FileExists(cDirVids + 'ShNuS01.vid') then
    dbgrNuS.Columns.LoadFromFile(cDirVids + 'ShNuS01.vid');
  SetFormStyle;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.SetFormStyle;
begin
  if sBtnStOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormShwNU := false;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrNuD.Columns.SaveToFile(cDirVids + 'ShNuD01.vid');
  dbgrNuS.Columns.SaveToFile(cDirVids + 'ShNuS01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'pnlBttmH', PanelBottom.Height);
    Free;
  end;
  bIsFormShwNU := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.dbgrNuDEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.dbgrNuDExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.sBtnStOnTopClick(Sender: TObject);
begin
  SetFormStyle;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.bBtnCancelClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.ShowSmNaRuki;
var nSmNaRuki : double;
begin
  // Ќадеюсь что сие случаетс€ после переоткрыти€
  Label2.Caption := '';
  nSmNaRuki := 0;
  with qryNuS do begin
    DisableControls;
    First;
    while not Eof do begin
      nSmNaRuki := nSmNaRuki + qryNuSSmm.AsFloat;
      Next;
    end;
    First;
    EnableControls;
  end;
  //if nSmNaRuki <> 0 then
    Label2.Caption := FloatToStrF(nSmNaRuki, ffFixed, 18, 2);
  LabelFamIO.Caption := dsrc_PV.DataSet.FieldByName('FamIO').AsString;
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.dbgrNuDDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : ShortString;
begin
  cVidN := qryNuD.FieldByName('VidN').AsString;
  with dbgrNuD.Canvas do begin
    if not (gdFocused in State) then begin
      if (cVidN >= '7500') and (cVidN < '7600') then  // выплаты
        Font.Color := clBlue
      else if cVidN = '2724' then    // долг за работником
        Font.Color := clRed;
    end;
  end;
  dbgrNuD.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShwNu.dbgrNuSDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cVidN : ShortString;
begin
  cVidN := qryNuS.FieldByName('VidN').AsString;
  with dbgrNuS.Canvas do begin
    if not (gdFocused in State) then begin
      if (cVidN >= '7500') and (cVidN < '7600') then  // выплаты
        Font.Color := clBlue
      else if cVidN = '2724' then    // долг за работником
        Font.Color := clRed;
    end;
  end;
  dbgrNuS.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
