unit z_ViNU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFormViNU = class(TForm)
    Panel1: TPanel;
    LabelSort: TLabel;
    bBtnCancel: TBitBtn;
    dbgrNU: TDBGrid;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    qryNUVIDN: TStringField;
    qryNUSHVIDN: TStringField;
    qryNUGRP: TSmallintField;
    qryNUSCHBU: TStringField;
    qryNUKDTEMU: TSmallintField;
    qryNUNMTEMU: TStringField;
    qryNUDTPROC: TDateTimeField;
    qryNUZAMESGOD: TDateTimeField;
    qryNUCHAS: TFloatField;
    qryNUSUMMA: TFloatField;
    qryNUDT_BEG: TDateTimeField;
    qryNUDT_END: TDateTimeField;
    qryNUKDOBJ: TSmallintField;
    qryNUKDKATP: TSmallintField;
    qryNUKDSPZ: TSmallintField;
    qryNUNOTES: TStringField;
    qryNUMYNOTES: TStringField;
    qryNUSPEC_NR: TIntegerField;
    qryNUZP13: TStringField;
    qryNUOTP: TStringField;
    qryNUBLN: TStringField;
    qryNUDKR: TStringField;
    qryNUOTPUSKN: TStringField;
    qryNUBOLNIC: TStringField;
    qryNUSPRM: TStringField;
    qryNUSSRK: TStringField;
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
    qryNUSWSB: TStringField;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure OpenQryNU(nTabN : integer; dZaMG : TDateTime);
  public
    { Public declarations }
  end;

procedure ViewNNU(nTabN: integer; cFamIO: ShortString; dZaMG: TDateTime);

const SECTION = 'z_ViNU';

var
  FormViNU: TFormViNU;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib;

{$R *.dfm}

procedure ViewNNU(nTabN: integer; cFamIO: ShortString; dZaMG: TDateTime);
begin
  FormViNU := TFormViNU.Create(Application);
  with FormViNU do begin
    Caption := 'Начисления по ТабН ' + IntToStr(nTabN) + ' ( '  + cFamIO + ' )';
    LabelSort.Caption := '';
    ; //' Сортировка по полю "Начиная с" в обратном порядке.';

    OpenQryNU(nTabN, dZaMG);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormViNU.OpenQryNU(nTabN: integer; dZaMG: TDateTime);
begin
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ViNuMain ' +
            ' where TabN = :nTabN and ZaMesGod = :dZaMG and VidN < "6000"');
    SQL.Add('order by DtProc, ZaMesGod, VidN');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dZaMG').AsDateTime := dZaMG;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormViNU.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 500);
    Height := ReadInteger(SECTION, 'wH', 580);
    Width  := ReadInteger(SECTION, 'wW', 825);
    Free;
  end;
  if FileExists(cDirVids + 'ViNu00.vdi') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'ViNu00.vdi');
end;
//------------------------------------------------------------------------------
procedure TFormViNU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
  dbgrNU.Columns.SaveToFile(cDirVids + 'ViNu00.vdi');
end;
//------------------------------------------------------------------------------
procedure TFormViNU.dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrNU.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if (cFldNm = 'SUMMA') or (cFldNm = 'IND') then
      Brush.Color := clWindow;
    if qryNuInd.AsString <> '1' then
      Font.Style := [];
  end;
  dbgrNU.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
