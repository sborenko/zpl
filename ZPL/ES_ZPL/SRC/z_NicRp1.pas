unit z_NicRp1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB,
  DBTables;

type
  TFormNichRp_1 = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnPrt: TSpeedButton;
    qryRp: TQuery;
    dsrcRp: TDataSource;
    dbgrRp: TDBGrid;
    LabelCntRec: TLabel;
    qryRpPSCH: TStringField;
    qryRpSCHBU: TStringField;
    qryRpKDSPZ: TSmallintField;
    qryRpNMSCH: TStringField;
    qryRpTABN: TIntegerField;
    qryRpFAM: TStringField;
    qryRpIMA: TStringField;
    qryRpOTCH: TStringField;
    qryRpVIDN: TStringField;
    qryRpSHVIDN: TStringField;
    qryRpZAMESGOD: TDateTimeField;
    qryRpSUMMA: TFloatField;
    qryRpFamIO: TStringField;
    qryRpKDTEMU: TSmallintField;
    qryRpNMTEMU: TStringField;
    procedure qryRpCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrRpDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    c_Caption : ShortString;
    procedure OpenQryRp(nCase : Word; dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

procedure ShwNichRp1(nCase : Word; dDtPrc : TDateTime);

const DECTION = 'z_NicRp1';

var
  FormNichRp_1: TFormNichRp_1;

implementation

uses
  a_Const, z_Dm, z_Main, a_Lib, NichTheme;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwNichRp1(nCase : Word; dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormNichRp_1 := TFormNichRp_1.Create(Application);
  with FormNichRp_1 do begin
    d_DtPrc := dDtPrc;
    DecodeDate(dDtPrc, nY, nM, nD);
    c_Caption := 'Сведения о начислениях и удержаниях по темам за ' +
                                   MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    Caption := c_Caption;
    OpenQryRp(nCase, dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNichRp_1.OpenQryRp(nCase : Word; dDtPrc: TDateTime);
begin
  with qryRp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add(
      'select ' +
      '  n.SchBU, KdTemu, n.TabN, n.VidN, n.ZaMesGod ' +
      '  , n.KdSPZ, n.NmSch, NmTemu, u.Fam, u.Ima, u.Otch, n.ShVidN ' +
      '  , n.PSch, Round(Sum(n.Summa), 2) as Summa ' +
      'from ' +
      '  ViNuMain n ' +
      '  left outer join z_Upi u on u.TabN = n.TabN ' +
      'where ' +
      '  n.DtProc = :dDtPrc' +
      '  and ' +
      '  ( ' +
      '    (n.VidN < "7500" or VidN > "8600" and VidN < "8800") ' +
      '    and n.VidN <> "5001" ' +
      '    and KdTemu <> 0 ' +
      '    or ' +
      '    n.VidN in ("1601", "1614") ' +
      '    and n.KdTemu <> 0 ' +
      '  ) ' +
      'group by ' +
      '  n.SchBU, KdTemu, n.TabN, n.VidN, n.ZaMesGod ' +
      '  , n.KdSPZ, n.NmSch, NmTemu, u.Fam, u.Ima, u.Otch, n.ShVidN ' +
      '  , n.PSch ' +
      'order by ' +
      '  1, 2, 9, 10, 11, 4, 5'
    );
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'NichPrt.txt');

    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNichRp_1.qryRpCalcFields(DataSet: TDataSet);
begin
  qryRpFamIO.AsString := MyFamIO(qryRpFam.AsString,
                                        qryRpIma.AsString, qryRpOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormNichRp_1.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
   Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 460);
    Width  := ReadInteger(SECTION, 'wW', 870);
    Free;
  end;
  if FileExists(cDirVids + 'NichRp_1.vid') then
    dbgrRp.Columns.LoadFromFile(cDirVids + 'NichRp_1.vid');
end;
//------------------------------------------------------------------------------
procedure TFormNichRp_1.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  dbgrRp.Columns.SaveToFile(cDirVids + 'NichRp_1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNichRp_1.dbgrRpDrawColumnCell(Sender: TObject; const Rect: TRect;
                       DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrRp.Canvas do begin
    if not (gdFocused in State) then begin
      if (cFldNm = 'SUMMA') and (qryRpSumma.AsFloat < 0) then
        Font.Color := clRed;
    end;
  end;
  dbgrRp.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormNichRp_1.sBtnPrtClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  qryRp.DisableControls;

  TRptNichTheme.Run(c_Caption, qryRp);
  
  qryRp.EnableControls;
  Screen.Cursor := crDefault;
end;

end.
