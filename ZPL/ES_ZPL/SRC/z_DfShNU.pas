unit z_DfShNU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  DB, DBTables;

type
  TFormShwDfNU = class(TForm)
    qryNewNu: TQuery;
    dsrcNewNU: TDataSource;
    qryNewNuVIDN: TStringField;
    qryNewNuSHVIDN: TStringField;
    qryNewNuTABN: TIntegerField;
    qryNewNuKDSPS: TSmallintField;
    qryNewNuPSCH: TStringField;
    qryNewNuSCHBU: TStringField;
    qryNewNuDTPROC: TDateTimeField;
    qryNewNuZAMESGOD: TDateTimeField;
    qryNewNuCHAS: TFloatField;
    qryNewNuSUMMA: TFloatField;
    qryNewNuVID_KDSPZ: TSmallintField;
    qryNewNuVID_SPZ: TStringField;
    qryNewNuVID_KDSCHDT: TSmallintField;
    qryNewNuVID_SCHDT: TStringField;
    qryNewNuVID_KDSCHKT: TSmallintField;
    qryNewNuVID_SCHKT: TStringField;
    qryNewNuVID_KEKV: TStringField;
    qryNewNuNR: TIntegerField;
    qryNewNuDT_BEG: TDateTimeField;
    qryNewNuDT_END: TDateTimeField;
    qryNewNuKDOBJ: TSmallintField;
    qryNewNuKDKATP: TSmallintField;
    qryNewNuKDSPZ: TSmallintField;
    qryNewNuPDN: TSmallintField;
    qryNewNuNOTES: TStringField;
    qryNewNuPRR: TSmallintField;
    qryNewNuPRPV: TSmallintField;
    qryNewNuKTO: TSmallintField;
    qryNewNuPRKR: TSmallintField;
    qryNewNuMYNOTES: TStringField;
    qryNewNuSPECPS: TIntegerField;
    qryNewNuSPEC_NR: TIntegerField;
    qryNewNuDTVDPV: TDateTimeField;
    qryNewNuNRVDPV: TIntegerField;
    qryNewNuSTORN: TStringField;
    qryNewNuZP13: TStringField;
    qryNewNuOTP: TStringField;
    qryNewNuBLN: TStringField;
    qryNewNuOTPUSKN: TStringField;
    qryNewNuBOLNIC: TStringField;
    qryNewNuSPRM: TStringField;
    qryNewNuCPRM: TStringField;
    qryNewNuDETI: TStringField;
    qryNewNuDETIM: TStringField;
    qryNewNuDETIK: TStringField;
    qryNewNuDETIG: TStringField;
    qryNewNuIND: TStringField;
    qryNewNuDHD: TStringField;
    qryNewNuOKLFND: TStringField;
    qryNewNuCBUDG: TStringField;
    qryNewNuSNDB: TStringField;
    qryNewNuSPDN: TStringField;
    qryNewNuSPRF: TStringField;
    qryNewNuSPENS: TStringField;
    qryNewNuSALIM: TStringField;
    qryNewNuCNDB: TStringField;
    qryNewNuSSOCSTRAH: TStringField;
    qryNewNuSBZR: TStringField;
    qryNewNuSP_PF: TStringField;
    qryNewNuSP_FSTVP: TStringField;
    qryNewNuSP_FSNV: TStringField;
    qryNewNuSP_FZ: TStringField;
    qryNewNuSOVM: TStringField;
    qryNewNuSPOV: TStringField;
    PageControl: TPageControl;
    tsNewNu: TTabSheet;
    tsOldNu: TTabSheet;
    dbgrNewNU: TDBGrid;
    Panel1: TPanel;
    sBtnStayOnTop: TSpeedButton;
    BitBtn1: TBitBtn;
    qryOldNU: TQuery;
    dsrcOldNU: TDataSource;
    dbgrOldNU: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowDfNu(cDir : string; nFNU, nKv, nYY : SmallInt; nTabN : integer);

const SECTION = 'z_DfShNu';

var
  FormShwDfNU: TFormShwDfNU;

implementation

uses a_Const, z_Main, z_DfMain;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowDfNu(cDir : string; nFNU, nKv, nYY : SmallInt; nTabN : integer);
var nY, nM : word; dDtPrc : TDateTime; cTableName : ShortString;
begin
  FormShwDfNU := TFormShwDfNU.Create(Application);
  with FormShwDfNU do begin
    if cDir = 'D_01' then begin
      Caption := 'Из таблицы "НУ" новой БД';
      PageControl.ActivePage := tsNewNU;
      nY := nYY;
      nM := (nKv-1) * 3 + nFNU;
      dDtPrc := EncodeDate(nY, nM, 1);
      with qryNewNU do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := CESMAIN;
        SQL.Add('Select * from ViNuMain where DtProc = :dDtPrc and ' +
                ' TabN = :nTabN and VidN < "6003" order by VidN, ZaMesGod');
        ParamByName('dDtPrc').AsDateTime := dDtPrc;
        ParamByName('nTabN').AsInteger := nTabN;
        Open;
      end;
      Panel1.Caption := 'ТабНр ' + IntToStr(nTabN) + ' за ' +
                                              Copy(DateToStr(dDtPrc), 4, 7);
      ShowModal; end
    else if cDir = 'D_03' then begin
      Caption := 'Из таблицы "НУ" НИЧ';
      PageControl.ActivePage := tsOldNU;
      cTableName := 'nu';
      nY := nYY;
      nM := (nKv-1) * 3 + nFNU;
      if nM < 10 then
        cTableName := cTableName + '0';
      cTableName := cTableName + IntToStr(nM) + Copy(IntToStr(nY), 3, 2);
      with qryOldNU do begin
        if Active then Close;
        SQL.Clear;
        DataBaseName := cDfDirD03;
        SQL.Add('Select n.*, v.NaimVRLst from ' + cTableName +
                ' n Left outer join KodVid v on v.VidN = n.VidN ' +
                ' where n.TabN = :nTabN and n.VidN <= 350 ' +
                ' order by n.VidN, n.GodN, n.MesN');
{
Select n.*, v.NaimVRLst
from nu0807 n Left outer join kodvid v on v.VidN = n.VidN
 where TabN = 2 order by TabN, VidN
}

        ParamByName('nTabN').AsInteger := nTabN;
        Open;
      end;
      Panel1.Caption := 'ТабНр ' + IntToStr(nTabN) + ' в ' + cTableName;
      ShowModal;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwDfNU.FormCreate(Sender: TObject);
begin
  tsNewNu.TabVisible := false;
  tsOldNu.TabVisible := false;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 450);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwDfNU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;

end.
