unit z_DblTab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, Buttons,
  ExtCtrls;

type
  TFormChDblTabN = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qrySps: TQuery;
    dsrcSps: TDataSource;
    dbgrSps: TDBGrid;
    qrySpsFAM: TStringField;
    qrySpsIMA: TStringField;
    qrySpsOTCH: TStringField;
    qrySpsNR: TIntegerField;
    qrySpsKDSPS: TSmallintField;
    qrySpsNCH: TStringField;
    qrySpsDTPROC: TDateTimeField;
    qrySpsS1_TABN: TIntegerField;
    qrySpsS2_TABN: TIntegerField;
    qrySpsKDOBJ: TSmallintField;
    qrySpsFamIO: TStringField;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure qrySpsCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrSpsEnter(Sender: TObject);
    procedure dbgrSpsExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    procedure OpenQrySps(dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

procedure CheckDoubleTabN(dDtPrc : TDateTime);

const SECTION = 'z_DblTab';

var
  FormChDblTabN: TFormChDblTabN;

implementation

uses a_Const, a_DM, z_DM, Z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure CheckDoubleTabN(dDtPrc : TDateTime);
begin
  FormChDblTabN := TFormChDblTabN.Create(Application);
  with FormChDblTabN do begin
    d_DtPrc := dDtPrc;
    Caption := 'Проверка Таб.номеров-"двойников"';
    OpenQrySps(dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChDblTabN.OpenQrySps(dDtPrc : TDateTime);
begin
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct u.Fam, u.Ima, u.Otch, s1.NR, s1.KdSps, s1.NCH, ' +
            ' s1.DtProc, s1.TabN as S1_TabN, s2.TaBN as s2_TabN, s1.KdObj ' +
            ' from z_Sps s1, z_Sps s2 , z_upi u ' +
            ' where s1.DtProc = :dDtPrc and s2.DtProc = s1.DtProc and ' +
            ' s2.TabN = s1.TabN and s2.NR <> s1.NR and u.TabN = s1.TabN ' +
            ' order by s1.TabN, s1.KdSps ');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChDblTabN.qrySpsCalcFields(DataSet: TDataSet);
begin
  qrySpsFamIO.AsString := MyFamIO(qrySpsFam.AsString, qrySpsIma.AsString,
                                                         qrySpsOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormChDblTabN.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 410);
    Width  := ReadInteger(SECTION, 'wW', 435);
    Free;
  end;
  if FileExists(cDirVids + 'DblTabs.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'DblTabs.vid');
end;
//------------------------------------------------------------------------------
procedure TFormChDblTabN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qrySps.Active then
    dbgrSps.Columns.SaveToFile(cDirVids + 'DblTabs.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChDblTabN.dbgrSpsEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChDblTabN.dbgrSpsExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormChDblTabN.SpeedButton1Click(Sender: TObject);
begin
  ShowMessage('Пока не готово !');
end;

end.
