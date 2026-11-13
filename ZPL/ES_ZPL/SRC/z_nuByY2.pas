unit z_nuByY2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, DBCtrls;

type
  TFormShwNuByY2 = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dbgrNu: TDBGrid;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    qryNUVIDN: TStringField;
    qryNUSHVIDN: TStringField;
    qryNUTABN: TIntegerField;
    qryNUKDSPS: TSmallintField;
    qryNUPSCH: TStringField;
    qryNUSCHBU: TStringField;
    qryNUDTPROC: TDateTimeField;
    qryNUZAMESGOD: TDateTimeField;
    qryNUCHAS: TFloatField;
    qryNUSUMMA: TFloatField;
    qryNUVID_KDSPZ: TSmallintField;
    qryNUVID_SPZ: TStringField;
    qryNUVID_KDSCHDT: TSmallintField;
    qryNUVID_SCHDT: TStringField;
    qryNUVID_KDSCHKT: TSmallintField;
    qryNUVID_SCHKT: TStringField;
    qryNUVID_KEKV: TStringField;
    qryNUNR: TIntegerField;
    qryNUDT_BEG: TDateTimeField;
    qryNUDT_END: TDateTimeField;
    qryNUKDOBJ: TSmallintField;
    qryNUKDKATP: TSmallintField;
    qryNUKDSPZ: TSmallintField;
    qryNUPDN: TSmallintField;
    qryNUNOTES: TStringField;
    qryNUPRR: TSmallintField;
    qryNUPRPV: TSmallintField;
    qryNUKTO: TSmallintField;
    qryNUPRKR: TSmallintField;
    qryNUMYNOTES: TStringField;
    qryNUSPECPS: TIntegerField;
    qryNUSPEC_NR: TIntegerField;
    qryNUDTVDPV: TDateTimeField;
    qryNUNRVDPV: TIntegerField;
    qryNUSTORN: TStringField;
    qryNUZP13: TStringField;
    qryNUOTP: TStringField;
    qryNUBLN: TStringField;
    qryNUOTPUSKN: TStringField;
    qryNUBOLNIC: TStringField;
    qryNUSPRM: TStringField;
    qryNUCPRM: TStringField;
    qryNUDETI: TStringField;
    qryNUDETIM: TStringField;
    qryNUDETIK: TStringField;
    qryNUDETIG: TStringField;
    qryNUIND: TStringField;
    qryNUDHD: TStringField;
    qryNUOKLFND: TStringField;
    qryNUCBUDG: TStringField;
    qryNUSNDB: TStringField;
    qryNUSPDN: TStringField;
    qryNUSPRF: TStringField;
    qryNUSPENS: TStringField;
    qryNUSALIM: TStringField;
    qryNUCNDB: TStringField;
    qryNUSSOCSTRAH: TStringField;
    qryNUSBZR: TStringField;
    qryNUSP_PF: TStringField;
    qryNUSP_FSTVP: TStringField;
    qryNUSP_FSNV: TStringField;
    qryNUSP_FZ: TStringField;
    qryNUSOVM: TStringField;
    qryNUSPOV: TStringField;
    qryNUFamIO: TStringField;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryNUCalcFields(DataSet: TDataSet);
    procedure dbgrNuDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure OpenQryNu(nGodPrc, nGodZaMG : SmallInt);
  public
    { Public declarations }
  end;

procedure ShowNuByYear(nGodPrc, nGodZaMG : SmallInt);

const SECTION = 'z_nuByY2';

var
  FormShwNuByY2: TFormShwNuByY2;

implementation

uses A_Const, A_DM, Z_DM, Z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowNuByYear(nGodPrc, nGodZaMG : SmallInt);
begin
  FormShwNuByY2 := TFormShwNuByY2.Create(Application);
  with FormShwNuByY2 do begin
    Caption := 'Начисления и удержания в ' + IntToStr(nGodPrc) + ' г. за ' +
                            IntToStr(nGodZaMG) + '-й год';
    OpenQryNu(nGodPrc, nGodZaMG);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNuByY2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 625);
    Free;
  end;
  if FileExists(cDirVids + 'NuByY2.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'NuByY2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwNuByY2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrNu.Columns.SaveToFile(cDirVids + 'NuByY2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNuByY2.OpenQryNu(nGodPrc, nGodZaMG: SmallInt);
var dDtBegPrc, dDtEndPrc, dDtBegZaMG, dDtEndZaMG : TDateTime;
begin
  dDtBegPrc  := EncodeDate(nGodPrc, 1, 1);
  dDtEndPrc  := EncodeDate(nGodPrc, 12, 1);
  dDtBegZaMG := EncodeDate(nGodZaMG, 1, 1);
  dDtEndZaMG := EncodeDate(nGodZaMG, 12, 1);
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ViNuMain where ' +
            ' DtProc >= :dDtBegPrc and DtProc <= :dDtEndPrc and ' +
            ' ZaMesGod >= :dDtBegZaMG and ZaMesGod <= :dDtEndZaMG and ' +
            ' (VidN < "2700" or (VidN >= "6401" and VidN <= "6415") or ' +
            ' VidN in ("8611","8612") or VidN = "8671")');
    SQL.Add('order by TabN, VidN, DtProc, ZaMesGod');
    ParamByName('dDtBegPrc').AsDateTime := dDtBegPrc;
    ParamByName('dDtEndPrc').AsDateTime := dDtEndPrc;
    ParamByName('dDtBegZaMG').AsDateTime := dDtBegZaMG;
    ParamByName('dDtEndZaMG').AsDateTime := dDtEndZaMG;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwNuByY2.qryNUCalcFields(DataSet: TDataSet);
begin
  qryNUFamIO.AsString := DmMain.TabN2FamIO(qryNuTabN.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormShwNuByY2.dbgrNuDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.Field.FieldName);
  with dbgrNu.Canvas do begin
    if not (gdFocused in State) then begin
      if (cFldNm = 'SUMMA') or (cFldNm = 'TABN') then begin
        Font.Style := [fsBold];
        if (cFldNm = 'SUMMA') and (Column.Field.AsFloat < 0) then
          Font.Color := clRed;
      end;    
    end;
  end;
  dbgrNu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
