unit z_SvdKtP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Provider, DBClient, StdCtrls, Grids, DBGrids,
  DBTables, Buttons, ExtCtrls;

type
  TFormSvdByKatP = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnPrt: TSpeedButton;
    qrySvd: TQuery;
    dbgrSvd: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    cdsSvd: TClientDataSet;
    dspSvd: TDataSetProvider;
    dsrcSvd: TDataSource;
    cdsSvdKDKATP: TSmallintField;
    cdsSvdSHKATP: TStringField;
    cdsSvdNMKATP: TStringField;
    cdsSvdCNT: TIntegerField;
    cdsSvdSUMMA: TBCDField;
    procedure dbgrSvdDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    procedure OpenCdsSvd(dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

procedure ShwSvdNuByKatP(dDtPrc : TDateTime);

const SECTION = 'z_SvdKtP';

var
  FormSvdByKatP: TFormSvdByKatP;

implementation

uses a_Const, a_DM, z_DM, z_Main, z_CmnPrt, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwSvdNuByKatP(dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormSvdByKatP := TFormSvdByKatP.Create(Application);
  with FormSvdByKatP do begin
    d_DtPrc := dDtPrc;
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Сводка начислений по категориям персонала в ' + MesPredl(nM) +
                         ' ' + IntToStr(nY) + ' г.';
    OpenCdsSvd(dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdByKatP.OpenCdsSvd(dDtPrc: TDateTime);
var nCntTt : integer; nSmmTt : double;
begin
  with qrySvd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select p.KdKatP, k.ShKatP, k.NmKatP, Count(p.TabN) as CNT, ' +
            ' Sum(Cast(p.Summa as Numeric(18,2))) as Summa ' +
            ' from Z_GetNuByKatP(:dDtPrc) p ' +
            ' Left Outer Join z_KatPers k on k.KdKatP = p.KdKatP ' +
            ' group by p.KdKatP, k.ShKatP, k.NmKatP');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  dspSvd.DataSet := qrySvd;
  with cdsSvd do begin
    if Active then Close;
    ProviderName := 'dspSvd';
    Open;
    nCntTt := 0;
    nSmmTt := 0;
    while not Eof do begin
      nCntTt := nCntTt + FieldByName('CNT').AsInteger;
      nSmmTt := nSmmTt + FieldByName('Summa').AsFloat;
      Next;
    end;
    Append;
    FieldByName('ShKatP').AsString := 'Все';
    FieldByName('NmKatP').AsString := 'По всем категориям';
    FieldByName('Cnt').AsInteger   := nCntTt;
    FieldByName('Summa').AsFloat   := nSmmTt;
    Post;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdByKatP.dbgrSvdDrawColumnCell(Sender: TObject;
                                           const Rect: TRect; DataCol: Integer;
                                        Column: TColumn; State: TGridDrawState);
begin
  with dbgrSvd.Canvas do begin
    if cdsSvdKdKatP.IsNull then
      Font.Color := clMaroon;
  end;
  dbgrSvd.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormSvdByKatP.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 250);
    Width  := ReadInteger(SECTION, 'wW', 500);
    Free;
  end;
  if FileExists(cDirVids + 'SvdKtP.vid') then
    dbgrSvd.Columns.LoadFromFile(cDirVids + 'SvdKtP.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSvdByKatP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSvd.Columns.SaveToFile(cDirVids + 'SvdKtP.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdByKatP.sBtnPrtClick(Sender: TObject);
begin
  F6ShortSvdByKatP(d_DtPrc, cdsSvd);  {z_CmnPrt}
end;

end.
