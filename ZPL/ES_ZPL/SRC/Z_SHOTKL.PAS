unit Z_ShOtkl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, IniFiles, DB,
  DBTables, Mask, DBCtrls, ComCtrls;

type
  string3 = string[3];
  String4 = string[4];
  TFormShwOtkl = class(TForm)
    qrySps: TQuery;
    dsrcSps: TDataSource;
    qrySpsTABN: TIntegerField;
    qrySpsFAM: TStringField;
    qrySpsIMA: TStringField;
    qrySpsOTCH: TStringField;
    qrySpsFamIO: TStringField;
    qryOtkl: TQuery;
    dsrcOtkl: TDataSource;
    tblTmp: TTable;
    tblTmpKdVidN: TIntegerField;
    dsrcTmp: TDataSource;
    tblTmpShVidN: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PanelTop: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBText1: TDBText;
    sBtnVidN: TSpeedButton;
    sBtnFilterOnOff: TSpeedButton;
    dbgrSps: TDBGrid;
    BitBtn1: TBitBtn;
    dbeKdVidN: TDBEdit;
    Splitter1: TSplitter;
    dbgrOtkl: TDBGrid;
    Panel1: TPanel;
    dbgrOtklSps: TDBGrid;
    SpeedButton3: TSpeedButton;
    qryOtklSps: TQuery;
    dsrcOtklSps: TDataSource;
    qryOtklSpsFAM: TStringField;
    qryOtklSpsIMA: TStringField;
    qryOtklSpsOTCH: TStringField;
    qryOtklSpsSHVIDN: TStringField;
    qryOtklSpsNR: TIntegerField;
    qryOtklSpsDTPROC: TDateTimeField;
    qryOtklSpsTABN: TIntegerField;
    qryOtklSpsKDOBJ: TSmallintField;
    qryOtklSpsKDKATP: TSmallintField;
    qryOtklSpsDT_BEG: TDateTimeField;
    qryOtklSpsDT_END: TDateTimeField;
    qryOtklSpsKDVIDN: TSmallintField;
    qryOtklSpsPDN: TSmallintField;
    qryOtklSpsCHAS: TFloatField;
    qryOtklSpsSUMMA: TFloatField;
    qryOtklSpsNOTES: TStringField;
    qryOtklSpsPRR: TSmallintField;
    qryOtklSpsPRPV: TSmallintField;
    qryOtklSpsKTO: TSmallintField;
    qryOtklSpsPRKR: TSmallintField;
    qryOtklSpsZAMESGOD: TDateTimeField;
    qryOtklSpsSPEC_NR: TIntegerField;
    qryOtklSpsFamIO: TStringField;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklOLDKDVIDN: TSmallintField;
    qryOtklKDVIDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklOLDKDOBJ: TSmallintField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklNOTES: TStringField;
    qryOtklPRR: TSmallintField;
    qryOtklPRPV: TSmallintField;
    qryOtklKTO: TSmallintField;
    qryOtklPRKR: TSmallintField;
    qryOtklSPEC_NR: TIntegerField;
    qryOtklDTVDPV: TDateTimeField;
    qryOtklNRVDPV: TIntegerField;
    qryOtklMYNOTES: TStringField;
    qryOtklSPECPS: TIntegerField;
    LbxFilter: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrySpsCalcFields(DataSet: TDataSet);
    procedure sBtnFilterOnOffClick(Sender: TObject);
    procedure tblTmpCalcFields(DataSet: TDataSet);
    procedure dbeKdVidNEnter(Sender: TObject);
    procedure dbeKdVidNExit(Sender: TObject);
    procedure sBtnVidNClick(Sender: TObject);
  private
    { Private declarations }
    bWasAddUpd : boolean;
    procedure CreOpenTblTmp;
    procedure QueriesOpen(dDtProc : TDateTime);
    procedure SetFilter;
  public
    { Public declarations }
  end;

function ShowOtklCurMes(dDtProc : TDateTime) : boolean;

const SECTION = 'Z_ShOtkl';

var
  FormShwOtkl: TFormShwOtkl;

implementation

uses A_Const, Z_Main, Z_DM, A_Lib, z_TVids;

{$R *.dfm}

//------------------------------------------------------------------------------
function ShowOtklCurMes(dDtProc : TDateTime) : boolean;
var nY, nM, nD : word;
begin
  FormShwOtkl := TFormShwOtkl.Create(Application);
  with FormShwOtkl do begin
    DecodeDate(dDtProc, nY, nM, nD);
    Caption := 'Отклонения [' + MesRus(nM) + ' ' + IntToStr(nY) + ' г.]';
    CreOpenTblTmp;
    bWasAddUpd := false;
    QueriesOpen(dDtProc);
    ShowModal;
    Result := bWasAddUpd;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.CreOpenTblTmp;
begin
  with tblTmp do begin
    if Active then Close;
    DataBaseName := cDirInd;
    if Exists then DeleteTable;
    CreateTable;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.QueriesOpen(dDtProc : TDateTime);
begin
  if qryOtkl.Active then qryOtkl.Close;
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select distinct otkl.TabN, upi.Fam, upi.Ima, upi.Otch ' +
            ' from Z_Otkl otkl, z_upi upi ' +
            ' where (otkl.DtProc = :dDtProc) and (upi.TabN = otkl.TabN) ' +
            ' order by upi.Fam, upi.Ima, upi.Otch');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    DataSource := dsrcSps;
    SQL.Add('Select * from Z_Otkl where (TabN = :TabN) and ' +
            ' (dtProc = :dDtProc) order by VidN');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 350);
    PanelTop.Height := ReadInteger(SECTION, 'pnlTopH', 200);
    Free;
  end;
  if FileExists(cDirVids + 'ShOtkl1.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'ShOtkl1.vid');
  if FileExists(cDirVids + 'ShOtkl2.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'ShOtkl2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSps.Columns.SaveToFile(cDirVids + 'ShOtkl1.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'ShOtkl2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'pnlTopH', PanelTop.Height);
    Free;
  end;
  with tblTmp do begin
    if Active then Close;
    DataBaseName := cDirInd;
    if Exists and not bFlagDbg then
      DeleteTable;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.qrySpsCalcFields(DataSet: TDataSet);
begin
  qrySpsFamIO.AsString := myFamIO(qrySpsFam.AsString, qrySpsIma.AsString,
                                                     qrySpsOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.sBtnFilterOnOffClick(Sender: TObject);
begin
  SetFilter;
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.SetFilter;
begin
  dbgrOtkl.SetFocus;
  sBtnFilterOnOff.Hint := 'Включить фильтр по видам начислений';
  if (tblTmpKdVidN.AsInteger <> 0) and sBtnFilterOnOff.Down then begin
    qryOtkl.Filter := 'KdVidN = ' + IntToStr(tblTmpKdVidN.AsInteger);
    qryOtkl.Filtered := true;
    sBtnFilterOnOff.Hint := 'Выключить фильтр по видам начислений'; end
  else if sBtnFilterOnOff.Down then begin
    sBtnFilterOnOff.Down := false;
    ShowMessage('Не выбран вид начисления (удержания) для фильтра'); end
  else begin
    qryOtkl.Filtered := false;
  end;
  dbeKdVidN.Enabled := not qryOtkl.Filtered;
  sBtnVidN.Enabled := not qryOtkl.Filtered;
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.tblTmpCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
(*
  if tblTmpKdVidN.AsInteger <> 0 then
    tblTmpShVidN.AsString :=
                  DmMain.KdVidN2ShVidN(tblTmpKdVidN.AsInteger, cNmVidN)
  else
    tblTmpShVidN.AsString := '';
*)
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.dbeKdVidNEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.dbeKdVidNExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormShwOtkl.sBtnVidNClick(Sender: TObject);
var cVidN : string4; p_ShVidN : string15; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                     p_KdSpZ : integer; bWasUpdated : boolean;
begin
  dbeKdVidN.SetFocus;
  with tblTmp do begin
    cVidN := FieldByName('VidN').AsString;
    if GetVidN(cVidN, p_ShVidN, p_NmVidN,
               p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
               p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
               p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
               p_SAlim, p_SSocStrah, p_SBzr, p_CNdb, p_Sp_PF, p_Sp_FSTVP,
               p_Sp_FSNV, p_Sp_FZ, p_KdSpZ, bWasUpdated, LbxFilter) {z_TVids}
                                                                    then begin
      if bWasUpdated then begin
        DmMain.qryVidN_LU.Close;
        DmMain.qryVidN_LU.Open;
      end;
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('VidN').AsString := cVidN;
      dbgrOtkl.SetFocus;
    end;
  end;
end;

end.
