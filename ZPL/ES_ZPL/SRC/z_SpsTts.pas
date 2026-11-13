unit z_SpsTts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, ExtCtrls, DBTables, Grids, DBGrids, StdCtrls, Buttons;

type
  TFormSpsTts = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    dbgrGrp: TDBGrid;
    qryGrp: TQuery;
    dsrcGrp: TDataSource;
    qryGrpVIDN: TStringField;
    qryGrpSHVIDN: TStringField;
    qryGrpPSCH: TStringField;
    qryGrpCNT: TIntegerField;
    qryGrpSMM: TFloatField;
    Splitter1: TSplitter;
    dbgrNu: TDBGrid;
    qryNu: TQuery;
    dsrcNu: TDataSource;
    qryNuTABN: TIntegerField;
    qryNuFAM: TStringField;
    qryNuIMA: TStringField;
    qryNuOTCH: TStringField;
    qryNuSCHBU: TStringField;
    qryNuZAMESGOD: TDateTimeField;
    qryNuCHAS: TFloatField;
    qryNuSUMMA: TFloatField;
    qryNuDT_BEG: TDateTimeField;
    qryNuDT_END: TDateTimeField;
    qryNuKDOBJ: TSmallintField;
    qryNuKDKATP: TSmallintField;
    qryNuPDN: TSmallintField;
    qryNuNOTES: TStringField;
    qryNuFamIO: TStringField;
    qryGrpDTPROC: TDateTimeField;
    sBtnLink: TSpeedButton;
    PanelTts: TPanel;
    sBtnSortByTabN: TSpeedButton;
    sBtnSortByFIO: TSpeedButton;
    qryNuNR: TIntegerField;
    procedure qryNuCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnLinkClick(Sender: TObject);
    procedure sBtnSortClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbgrNuDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    n_KdSps : SmallInt;
    procedure OpenQryGrp(nKdSps : SmallInt; dDtPrc : TDateTime);
    procedure ShowTotals;
    procedure SetLnkState;
    procedure OpenQryNu(nKdSps : SmallInt);
  public
    { Public declarations }
  end;

procedure ShowSpsTotals(nKdSps : SmallInt; dDtPrc : TDateTime);

const SECTION = 'z_SpsTts';

var
  FormSpsTts: TFormSpsTts;

implementation

uses a_Const, a_DM, Z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowSpsTotals(nKdSps : SmallInt; dDtPrc : TDateTime);
begin
  FormSpsTts := TFormSpsTts.Create(Application);
  with FormSpsTts do begin
    n_KdSps := nKdSps;
    Caption := 'Начисления по списку № ' + IntToStr(nKdSps) + ' (' +
                                       Form_Dm.KdSps2ShSps(nKdSps) + ')';
    OpenQryGrp(nKdSps, dDtPrc);
    ShowTotals;
    SetLnkState;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.ShowTotals;
var nSmN, nSmU, nSmV, nSmOst : double; cVidN, cMsg : ShortString;
begin
  nSmN := 0;
  nSmU := 0;
  nSmV := 0;
  with qryGrp do begin
    First;
    while not Eof do begin
      cVidN := qryGrpVidN.AsString;
      if cVidN < '6000' then
        nSmN := nSmN + qryGrpSmm.AsFloat
      else if cVidN < '7500' then
        nSmU := nSmU - qryGrpSmm.AsFloat
      else if cVidN < '8000' then
        nSmV := nSmV - qryGrpSmm.AsFloat;
      Next;
    end;
    First;
  end;
  nSmOst := nSmN - nSmU - nSmV;
  cMsg := 'Начисления: ' + FloatToStrF(nSmN, ffCurrency, 18, 2) +
          ', Удержания: ' + FloatToStrF(nSmU, ffCurrency, 18, 2) +
          ', Выплаты: ' + FloatToStrF(nSmV, ffCurrency, 18, 2) +
          '  К выплате: ' + FloatToStrF(nSmOst, ffCurrency, 18, 2);
  PanelTts.Caption := cMsg;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.OpenQryGrp(nKdSps: SmallInt; dDtPrc: TDateTime);
begin
  with qryGrp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select DtProc, VidN, ShVidN, PSCH, Count(VidN) as CNT, ' +
            ' Sum(Summa)  as SMM from ViNuMain ' +
            ' where DtProc = :dDtPrc and VidN < "8000" and ' +
            ' KdSps = :nKdSps and Summa <> 0 ' +
            ' group by DtProc, VidN, ShVidN, PSCH');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nKdSps').AsInteger  := nKdSps;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.OpenQryNu(nKdSps: SmallInt);
begin
  with qryNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcGrp;
    SQL.Add('Select n.NR, n.TabN, u.Fam, u.Ima, u.Otch, n.SchBU, n.ZaMesGod, ' +
            ' n.Chas, n.Summa, n.Dt_Beg, n.Dt_End, n.KdObj, n.KdKatP, ' +
            ' n.Pdn, n.Notes from vinuMain n Left outer join z_Upi u ' +
            ' on u.TabN = n.TabN ' +
            ' where KdSps = :nKdSps and DtProc = :DtProc and ' +
            ' VidN = :VidN and PSCH = :PSCH and Summa <> 0');
    if sBtnSortByTabN.Down then
      SQL.Add('order by n.TabN')
    else
      SQL.Add('order by u.Fam, u.Ima, u.Otch');
    ParamByName('nKdSps').AsInteger := nKdSps;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.qryNuCalcFields(DataSet: TDataSet);
begin
  qryNuFamIO.AsString := MyFamIO(qryNuFam.AsString,
                                    qryNuIma.AsString, qryNuOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.FormCreate(Sender: TObject);
var bSortTabN : boolean;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 675);
    dbgrGrp.Width := ReadInteger(SECTION, 'GrGrpW', 290);
    sBtnLink.Down := ReadBool(SECTION, 'bIsLnk', true);
    bSortTabN := ReadBool(SECTION, 'bSortTabN', true);
    Free;
  end;
  if bSortTabN then
    sBtnSortByTabN.Down := true
  else
    sBtnSortByFIO.Down := true;  
  if FileExists(cDirVids + 'SpsTts01.vid') then
    dbgrGrp.Columns.LoadFromFile(cDirVids + 'SpsTts01.vid');
  if FileExists(cDirVids + 'SpsTts02.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'SpsTts02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryGrp.Active then
    dbgrGrp.Columns.SaveToFile(cDirVids + 'SpsTts01.vid');
  if qryNu.Active then
    dbgrNu.Columns.SaveToFile(cDirVids + 'SpsTts02.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'GrGrpW', dbgrGrp.Width);
    WriteBool(SECTION, 'bIsLnk', sBtnLink.Down);
    WriteBool(SECTION, 'bSortTabN', sBtnSortByTabN.Down);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.sBtnLinkClick(Sender: TObject);
begin
  SetLnkState;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.SetLnkState;
begin
  if sBtnLink.Down then begin
    dbgrNU.Color := clCream;
    qryNu.DataSource := dsrcGrp;
    OpenQryNu(n_KdSps); end
  else begin
    if qryNu.Active then
      qryNu.Close;
    dbgrNU.Color := clBtnFace;
    qryNu.DataSource := nil;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.sBtnSortClick(Sender: TObject);
var nSvNR : integer;
begin
  if qryNu.Active then begin
    nSvNR := qryNuNR.AsInteger;
    OpenQryNu(n_KdSps);
    if nSvNR <> 0 then
      qryNu.Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormSpsTts.dbgrNuDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrNu.Canvas do begin
    if not (gdFocused in State) then begin
      cFldNm := UpperCase(Column.FieldName);
      if (cFldNm = 'SUMMA') then begin
        Font.Style := [fsBold];
        if Column.Field.AsFloat < 0 then
          Font.Color := clRed;
      end;
    end;
  end;
  dbgrNu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
