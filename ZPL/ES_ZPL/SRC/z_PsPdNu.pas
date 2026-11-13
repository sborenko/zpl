unit z_PsPdNu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, DBTables,
  DBCtrls;

type
  TFormShwPsPdnNU = class(TForm)
    qryNU: TQuery;
    dsrcNU: TDataSource;
    dbgrNU: TDBGrid;
    BitBtn1: TBitBtn;
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
    sBtnStayOnTop: TSpeedButton;
    qryPrmUv: TQuery;
    dsrcPrmUv: TDataSource;
    qryPrmUvTABN: TIntegerField;
    qryPrmUvDT_PRIEM: TDateTimeField;
    qryPrmUvDT_UVOLN: TDateTimeField;
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    procedure dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetFormStayOnTop;
    procedure OpenQryNU;
    procedure OpenQryPrmUv;
  public
    { Public declarations }
  end;

procedure ShowPsPdnNU;

const SECTION = 'z_PsPdNu';

var
  FormShwPsPdnNU: TFormShwPsPdnNU;

implementation

uses a_Const, a_DM, z_Dm, z_Main, z_psPdN;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowPsPdnNU;
begin
  if not bIsFormShwPsPdnNU then begin
    FormShwPsPdnNU := TFormShwPsPdnNU.Create(Application);
    with FormShwPsPdnNU do begin
      bIsFormShwPsPdnNU := true;
      Caption := 'Данные из таблицы "Начисления и удержания"';
      OpenQryNU;
      OpenQryPrmUv;
      SetFormStayOnTop;
      Show;
    end; end
  else begin
    if FormShwPsPdnNU.WindowState = wsMinimized then
      FormShwPsPdnNU.WindowState := wsNormal;
    FormShwPsPdnNU.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPsPdnNU.dbgrNUDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm, cVidN : ShortString;
begin
  with dbgrNU.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    cVidN := qryNuVidN.AsString;
    if not (gdFocused in State) then begin
      if (cFldNm = 'SUMMA') then begin
        Font.Style := [fsBold];
        if qryNu.FieldByName('Summa').AsFloat < 0 then
          Font.Color := clRed;
      end;
      if (cVidN > '7500') and (cVidN < '8000') then
        Font.Color := clBlue;
    end;
  end;
  dbgrNu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShwPsPdnNU.OpenQryNU;
begin
  with qryNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := FormPsPdn.dsrcPdn;
    SQL.Add('Select * from ViNuMain where TabN = :TabN and ' +
            ' ZaMesGod = :ZaMesGod and VidN < "8000" ' +
            ' order by VidN, KdSps, ZaMesGod ');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPsPdnNU.OpenQryPrmUv;
begin
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := FormPsPdn.dsrcPdn;
    SQL.Add('Select * from GET_PRMUVSTATE_ONDATE (:TabN, :ZaMesGod)');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwPsPdnNU.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 725);
    sBtnStayOnTop.Down := ReadBool(SECTION, 'bStOnTp', true);
    Free;
  end;
  if FileExists(cDirVids + 'PsPdNu05.vid') then
    dbgrNU.Columns.LoadFromFile(cDirVids + 'PsPdNu05.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwPsPdnNU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrNU.Columns.SaveToFile(cDirVids + 'PsPdNu05.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bStOnTp', sBtnStayOnTop.Down);
    Free;
  end;
  bIsFormShwPsPdnNU := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormShwPsPdnNU.sBtnStayOnTopClick(Sender: TObject);
begin
  SetFormStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormShwPsPdnNU.SetFormStayOnTop;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormShwPsPdnNU.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
