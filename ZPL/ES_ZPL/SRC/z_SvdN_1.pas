unit z_SvdN_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids,
  DBTables, Provider, DBClient, ComCtrls;

type
  TFormSvdNich_1 = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnPrt: TSpeedButton;
    qrySvd: TQuery;
    cdsSvd: TClientDataSet;
    dspSvd: TDataSetProvider;
    dsrcSvd: TDataSource;
    cdsSvdTABN: TIntegerField;
    cdsSvdFamIO: TStringField;
    cdsSvdFAM: TStringField;
    cdsSvdIMA: TStringField;
    cdsSvdOTCH: TStringField;
    cdsSvdKDOBJ: TSmallintField;
    cdsSvdVIDN: TStringField;
    cdsSvdSHVIDN: TStringField;
    cdsSvdZAMESGOD: TDateTimeField;
    cdsSvdKDSPZ: TSmallintField;
    cdsSvdSCHBU: TStringField;
    cdsSvdNMSCH: TStringField;
    cdsSvdSMM: TFloatField;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrSvd: TDBGrid;
    cdsTts: TClientDataSet;
    dsrcTts: TDataSource;
    dbgrTts: TDBGrid;
    cdsTtsNR: TAutoIncField;
    cdsTtsKdSpZ: TSmallintField;
    cdsTtsSchBU: TStringField;
    cdsTtsNmSch: TStringField;
    cdsTtsVidN: TStringField;
    cdsTtsShVidN: TStringField;
    cdsTtsSmm: TFloatField;
    procedure cdsSvdCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    procedure OpenCdsSvd(dDtPrc : TDateTime);
    procedure CreCdsTts;
    procedure AddInfToCdsTts(nKdSpZ : integer; cSchBU, cNmSch,
                                  cVidN, cShVidN : ShortString; nSmm : double);
  public
    { Public declarations }
  end;

procedure ShwSvdNich_1(dDtPrc : TDateTime);

const SECTION = 'z_SvdN_1';

var
  FormSvdNich_1: TFormSvdNich_1;

implementation

uses a_Const, a_DM, Z_Dm, z_Main, z_CmnPrt, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwSvdNich_1(dDtPrc : TDateTime);
begin
  FormSvdNich_1 := TFormSvdNich_1.Create(Application);
  with FormSvdNich_1 do begin
    d_DtPrc := dDtPrc;
    Caption := 'Сведения о начислениях (проба)';
    OpenCdsSvd(dDtPrc);
    PageControl1.ActivePage := ts1;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdNich_1.OpenCdsSvd(dDtPrc: TDateTime);
begin
  with qrySvd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select v.TabN, u.Fam, u.Ima, u.Otch, v.KdObj, v.VidN, v.ShVidN, ' +
            ' v.ZaMesGod, v.KdSpZ, v.SchBU, k.NmSch, Sum(v.Summa) as SMM ' +
            ' from ViNuMain v Left Outer Join z_Upi u on u.TabN = v.TabN ' +
            ' Left outer Join Kd_Sbu k on k.KdSch = v.KdSpZ ' +
            ' where v.DtProc = :dDtPrc and v.KdSps = 6 and v.VidN < "8000" ' +
            ' group by v.TabN, u.Fam, u.Ima, u.Otch, v.KdObj, v.VidN, ' +
            ' v.ShVidN, v.ZaMesGod, v.KdSpZ, v.SchBU, k.NmSch');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  CreCdsTts;
  with cdsSvd do begin
    if Active then Close;
    ProviderName := 'dspSvd';
    Open;
    First;
    while not Eof do begin
      AddInfToCdsTts(cdsSvdKdSpZ.AsInteger, cdsSvdSchBU.AsString,
                     cdsSvdNmSch.AsString, cdsSvdVidN.AsString,
                     cdsSvdShVidN.AsString, cdsSvdSmm.AsFloat);
      Next;
    end;
    First;
  end;
  with cdsTts do begin
    AddIndex('OnSchBuVidN', 'SchBU;VidN', []);
    IndexName := 'OnSchBuVidN';
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdNich_1.CreCdsTts;
begin
  with cdsTts do begin
    if Active then Close;
    IndexName := '';
    IndexDefs.Clear;
    CreateDataSet;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdNich_1.AddInfToCdsTts(nKdSpZ : integer; cSchBU, cNmSch, cVidN,
                                          cShVidN : ShortString; nSmm : double);
begin
  with cdsTts do begin
    if not Locate('KdSpZ;VidN', VarArrayOf([nKdSpZ, cVidN]), []) then begin
      Append;
      cdsTtsKdSpZ.AsInteger := nKdSpZ;
      cdsTtsSchBU.AsString  := cSchBU;
      cdsTtsNmSch.AsString  := cNmSch;
      cdsTtsVidN.AsString   := cVidN;
      cdsTtsShVidN.AsString := cShVidN; end
    else
      Edit;
    cdsTtsSmm.AsFloat := cdsTtsSmm.AsFloat + nSmm;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdNich_1.cdsSvdCalcFields(DataSet: TDataSet);
begin
  cdsSvdFamIO.AsString := MyFamIO(cdsSvdFam.AsString, cdsSvdIma.AsString,
                                                         cdsSvdOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormSvdNich_1.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 700);
    Free;
  end;
  if FileExists(cDirVids + 'x_SvdN_1.vid') then
    dbgrSvd.Columns.LoadFromFile(cDirVids + 'x_SvdN_1.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSvdNich_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qrySvd.Active then
    dbgrSvd.Columns.SaveToFile(cDirVids + 'x_SvdN_1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdNich_1.sBtnPrtClick(Sender: TObject);
begin
  if (PageControl1.ActivePage = ts1) and (cdsSvd.RecordCount > 0) then
    F6PrtSvdDetNich_1(d_DtPrc, cdsSvd)                 {z_CmnPrt}
  else if (PageControl1.ActivePage = ts2) and (cdsTts.RecordCount > 0) then
    F6PrtSvdNich_1(d_DtPrc, cdsTts);                   {z_CmnPrt}

end;

end.
