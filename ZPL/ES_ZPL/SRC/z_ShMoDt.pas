unit z_ShMoDt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, DBCtrls;

type
  TFormShowMoDet = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    qryNu: TQuery;
    dsrcNu: TDataSource;
    sBtnPrt: TSpeedButton;
    LabelCntRec: TLabel;
    LabelFamIO: TLabel;
    qryNuKat: TQuery;
    dsrcNuKat: TDataSource;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrNu: TDBGrid;
    dbgrNuKat: TDBGrid;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    qryNuFAM: TStringField;
    qryNuIMA: TStringField;
    qryNuOTCH: TStringField;
    qryNuVIDN: TStringField;
    qryNuSHVIDN: TStringField;
    qryNuTABN: TIntegerField;
    qryNuKDSPS: TSmallintField;
    qryNuPSCH: TStringField;
    qryNuLVL: TSmallintField;
    qryNuSCHBU: TStringField;
    qryNuDTPROC: TDateTimeField;
    qryNuZAMESGOD: TDateTimeField;
    qryNuCHAS: TFloatField;
    qryNuSUMMA: TFloatField;
    qryNuNMSCH: TStringField;
    qryNuVID_KDSPZ: TSmallintField;
    qryNuVID_SPZ: TStringField;
    qryNuVID_KDSCHDT: TSmallintField;
    qryNuVID_SCHDT: TStringField;
    qryNuVID_KDSCHKT: TSmallintField;
    qryNuVID_SCHKT: TStringField;
    qryNuVID_KEKV: TStringField;
    qryNuNR: TIntegerField;
    qryNuDT_BEG: TDateTimeField;
    qryNuDT_END: TDateTimeField;
    qryNuKDOBJ: TSmallintField;
    qryNuKDKATP: TSmallintField;
    qryNuKDSPZ: TSmallintField;
    qryNuPDN: TSmallintField;
    qryNuOZN_PILG: TStringField;
    qryNuNOTES: TStringField;
    qryNuPRR: TSmallintField;
    qryNuPRPV: TSmallintField;
    qryNuKTO: TSmallintField;
    qryNuPRKR: TSmallintField;
    qryNuMYNOTES: TStringField;
    qryNuSPECPS: TIntegerField;
    qryNuSPEC_NR: TIntegerField;
    qryNuDTVDPV: TDateTimeField;
    qryNuNRVDPV: TIntegerField;
    qryNuKDBNK: TSmallintField;
    qryNuSTORN: TStringField;
    qryNuZP13: TStringField;
    qryNuOTP: TStringField;
    qryNuBLN: TStringField;
    qryNuDKR: TStringField;
    qryNuOTPUSKN: TStringField;
    qryNuBOLNIC: TStringField;
    qryNuSPRM: TStringField;
    qryNuSSRK: TStringField;
    qryNuCPRM: TStringField;
    qryNuDETI: TStringField;
    qryNuDETIM: TStringField;
    qryNuDETIK: TStringField;
    qryNuDETIG: TStringField;
    qryNuIND: TStringField;
    qryNuDHD: TStringField;
    qryNuOKLFND: TStringField;
    qryNuCBUDG: TStringField;
    qryNuSNDB: TStringField;
    qryNuSPDN: TStringField;
    qryNuSWSB: TStringField;
    qryNuSPRF: TStringField;
    qryNuSPENS: TStringField;
    qryNuSALIM: TStringField;
    qryNuCNDB: TStringField;
    qryNuSSOCSTRAH: TStringField;
    qryNuSBZR: TStringField;
    qryNuSP_PF: TStringField;
    qryNuSP_FSTVP: TStringField;
    qryNuSP_FSNV: TStringField;
    qryNuSP_FZ: TStringField;
    qryNuSOVM: TStringField;
    qryNuSPOV: TStringField;
    qryNuFamIO: TStringField;
    procedure sBtnPrtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryNuCalcFields(DataSet: TDataSet);
    procedure dbgrNuDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    c_VidN, c_ShVidN, c_PSch, c_SchBU : ShortString;
    d_DtPrc, d_ZaMG : TDateTime;
    n_PRR : SmallInt;
    procedure OpenQryNu(dDtPrc, dZaMG : TDateTime;
                                      cVidN, cPSch, cSchBU : ShortString;
                                                     nKdKatP, nPRR : SmallInt);
  public
    { Public declarations }
  end;

procedure ShowMoDetails(dDtPrc, dZaMG : TDateTime;
                                  cVidN, cShVidN, cPSch, cSchBU : ShortString;
                                                      nKdKatP, nPRR : SmallInt);

const SECTION = 'z_ShMoDt';

var
  FormShowMoDet: TFormShowMoDet;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, z_TUpi, z_CmnPrt, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowMoDetails(dDtPrc, dZaMG : TDateTime;
                                  cVidN, cShVidN, cPSch, cSchBU : ShortString;
                                                      nKdKatP, nPRR : SmallInt);
begin
  FormShowMoDet := TFormShowMoDet.Create(Application);
  with FormShowMoDet do begin
    c_VidN   := cVidN;
    c_ShVidN := cShVidN;
    c_PSCh   := cPSch;
    c_SchBU  := cSchBU;
    d_DtPrc  := dDtPrc;
    d_ZaMG   := dZaMG;
    n_PRR    := nPRR;
    Caption  := 'Подробности по строке (Вид ' + cVidN + ' ' + cShVidN + ')';
    LabelCntRec.Caption := '';
    OpenQryNu(dDtPrc, dZaMG, cVidN, cPSch, cSchBU, nKdKatP, nPRR);
    ShowModal;
    qryNu.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowMoDet.OpenQryNu(dDtPrc, dZaMG : TDateTime;
                                            cVidN, cPSch, cSchBU : ShortString;
                                                      nKdKatP, nPRR : SmallInt);
var cNmViN : ShortString;
begin
  with qryNu do begin
    if dDtPrc < d_0117 then
      cNmViN := 'ViNuMain'
    else
      cNmVin := 'ViNuM_17';
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, vm.* ' +
            ' from ' + cNmViN + ' vm ' +
            ' Left outer join z_upi u on u.TabN = vm.TabN ' +
            ' where vm.DtProc = :dDtPrc and vm.ZaMesGod = :DZaMG and ' +
            ' vm.VidN = :cVidN and vm.PSch = :cPSch and ' +
            ' vm.KdKatP = :nKdKatP and vm.SchBU = :cSchBU ');
    if nPRR <> 0 then
      SQL.Add(' and vm.PRR = :nPRR ')
    else
      SQL.Add(' and (vm.PRR is NULL or vm.PRR = 0) ');
    SQL.Add(' order by vm.TabN, vm.VidN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('dZaMG').AsDateTime  := dZaMG;
    ParamByName('cVidN').AsString    := cVidN;
    ParamByName('cPSch').AsString    := cPSch;
    ParamByName('cSchBU').AsString   := cSchBU;
    ParamByName('nKdKatP').AsInteger := nKdKatP;
    if nPRR <> 0 then
      ParamByName('nPRR').AsInteger  := nPRR;
    Open;
    sBtnPrt.Enabled := RecordCount > 0;
    LabelCntRec.Caption := 'Записей ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowMoDet.sBtnPrtClick(Sender: TObject);
var cShVidN : ShortString;
begin
  cShVidN := qryNu.FieldByName('ShVidN').AsString;
  F6PrtMoDt(d_DtPrc, c_VidN, cShVidN, c_PSch, qryNU);  {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormShowMoDet.FormCreate(Sender: TObject);
begin
  LabelFamIO.Caption := '';
  LabelCntRec.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 750);
    Free;
  end;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  PageControl1.ActivePage := ts1;
  if FileExists(cDirVids + 'ShMoDt02.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'ShMoDt02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShowMoDet.FormClose(Sender: TObject;
                                               var Action: TCloseAction);
begin
  dbgrNu.Columns.SaveToFile(cDirVids + 'ShMoDt02.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowMoDet.qryNuCalcFields(DataSet: TDataSet);
begin
  qryNuFamIO.AsString := myFamIO(qryNuFam.AsString, qryNuIma.AsString,
                                                     qryNuOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShowMoDet.dbgrNuDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrnu.Canvas do begin
    if not (gdFocused in State) then begin
      if (Column.FieldName = 'SUMMA') then
        Font.Style := [fsBold];
      if (Column.FieldName = 'SUMMA') and (Column.Field.Value < 0) then
        Font.Color := clRed;
    end;
  end;
  dbgrNu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
