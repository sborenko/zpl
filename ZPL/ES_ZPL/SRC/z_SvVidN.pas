unit z_SvVidN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormSvodByVidN = class(TForm)
    qrySvd: TQuery;
    dsrcSvd: TDataSource;
    dbgrSvd: TDBGrid;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qrySvdKDOBJ: TSmallintField;
    qrySvdVIDN: TStringField;
    qrySvdSHVIDN: TStringField;
    qrySvdNMVIDN: TStringField;
    qrySvdZNAK: TSmallintField;
    qrySvdSUMMA: TFloatField;
    sBtnPrt: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    b_ManyObj : boolean;
    procedure OpenQrySvd(LbxF8 : TListBox; dDtProc : TDateTime);
  public
    { Public declarations }
  end;

procedure Make_SvdVidN(LbxF8 : TListBox; dDtProc : TDateTime);

const SECTION = 'z_SvVidN';

var
  FormSvodByVidN: TFormSvodByVidN;

implementation

uses A_Const, a_Dm, z_Dm, z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure Make_SvdVidN(LbxF8 : TListBox; dDtProc : TDateTime);
begin
  FormSvodByVidN := TFormSvodByVidN.Create(Application);
  with FormSvodByVidN do begin
    d_DtProc := dDtProc;
    b_ManyObj := LbxF8.Count > 1;
    OpenQrySvd(LbxF8, dDtProc);
    if bFlagDbg then
      ShowModal
    else
      F6PrtSvdByVidN(qrySvd, dDtProc); {z_CmnPrt}
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvodByVidN.OpenQrySvd(LbxF8 : TListBox; dDtProc : TDateTime);
var cMsg : string; i : integer;
begin
  cMsg := '';
  for i := 0 to Lbxf8.Items.Count - 1 do begin
    cMsg := cMsg + Lbxf8.Items[i];
    if i < (Lbxf8.Items.Count - 1) then
      cMsg := cMsg + ', ';
  end;
  with qrySvd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select KdObj, VidN, ShVidN, NmVidN, Znak, Sum(Summa) as Summa ' +
            ' from GetNuWithZnak (:dDtProc) ' +
            ' where VidN < "8600" and KdObj <> 1056 and KdObj in (' + cMsg +
            ') group by KdObj, VidN, ShVidN, NmVidN, Znak ');
    if Lbxf8.Items.Count > 1 then
      SQL.Add('UNION Select Cast("27777" as SmallInt) as KdObj, ' +
              ' VidN, ShVidN, NmVidN, Znak, Sum(Summa) as Summa ' +
              ' from GetNuWithZnak (:dDtProc) ' +
              ' where VidN < "8600" and KdObj <> 1056 and KdObj in (' + cMsg +
              ') group by VidN, ShVidN, NmVidN, Znak ');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'SvdVidn.sql');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvodByVidN.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 450);
    Free;
  end;
  if FileExists(cDirVids + 'x_SvVidN.vid') then
    dbgrSvd.Columns.LoadFromFile(cDirVids + 'x_SvVidN.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSvodByVidN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSvd.Columns.SaveToFile(cDirVids + 'x_SvVidN.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvodByVidN.sBtnPrtClick(Sender: TObject);
begin
  F6PrtSvdByVidN(qrySvd, d_DtProc);   {z_CmnPrt}
end;

end.
