unit z_SpsOtk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, ExtCtrls, DBTables, Grids, DBGrids, StdCtrls, Buttons;

type
  TFormSpsOtkl = class(TForm)
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
    dbgrDet: TDBGrid;
    qryDet: TQuery;
    dsrcDet: TDataSource;
    qryDetTABN: TIntegerField;
    qryDetFAM: TStringField;
    qryDetIMA: TStringField;
    qryDetOTCH: TStringField;
    qryDetSCHBU: TStringField;
    qryDetZAMESGOD: TDateTimeField;
    qryDetCHAS: TFloatField;
    qryDetSUMMA: TFloatField;
    qryDetDT_BEG: TDateTimeField;
    qryDetDT_END: TDateTimeField;
    qryDetKDOBJ: TSmallintField;
    qryDetKDKATP: TSmallintField;
    qryDetPDN: TSmallintField;
    qryDetNOTES: TStringField;
    qryDetFamIO: TStringField;
    qryGrpDTPROC: TDateTimeField;
    sBtnLink: TSpeedButton;
    sBtnSortByTabN: TSpeedButton;
    sBtnSortByFIO: TSpeedButton;
    qryDetNR: TIntegerField;
    procedure qryDetCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnLinkClick(Sender: TObject);
    procedure sBtnSortClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbgrDetDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    n_KdSps : SmallInt;
    procedure OpenQryGrp(nKdSps : SmallInt; dDtPrc : TDateTime);
    procedure SetLnkState;
    procedure OpenQryDet(nKdSps : SmallInt);
  public
    { Public declarations }
  end;

procedure ShowSpsOtkl(nKdSps : SmallInt; dDtPrc : TDateTime);

const SECTION = 'z_SpsOtk';

var
  FormSpsOtkl: TFormSpsOtkl;

implementation

uses a_Const, a_DM, Z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowSpsOtkl(nKdSps : SmallInt; dDtPrc : TDateTime);
begin
  FormSpsOtkl := TFormSpsOtkl.Create(Application);
  with FormSpsOtkl do begin
    n_KdSps := nKdSps;
    Caption := 'Отклонения по списку № ' + IntToStr(nKdSps) + ' (' +
                                       Form_Dm.KdSps2ShSps(nKdSps) + ')';
    OpenQryGrp(nKdSps, dDtPrc);
    SetLnkState;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.OpenQryGrp(nKdSps: SmallInt; dDtPrc: TDateTime);
begin
  with qryGrp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select DtProc, VidN, ShVidN, PSCH, Count(VidN) as CNT, ' +
            ' Sum(Summa)  as SMM from ViOtkl ' +
            ' where DtProc = :dDtPrc and VidN < "8000" and ' +
            ' KdSps = :nKdSps ' +
            ' group by DtProc, VidN, ShVidN, PSCH');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nKdSps').AsInteger  := nKdSps;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.OpenQryDet(nKdSps: SmallInt);
begin
  with qryDet do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcGrp;
    SQL.Add('Select n.NR, n.TabN, u.Fam, u.Ima, u.Otch, n.SchBU, n.ZaMesGod, ' +
            ' n.Chas, n.Summa, n.Dt_Beg, n.Dt_End, n.KdObj, n.KdKatP, ' +
            ' n.Pdn, n.Notes from viOtkl n Left outer join z_Upi u ' +
            ' on u.TabN = n.TabN ' +
            ' where KdSps = :nKdSps and DtProc = :DtProc and ' +
            ' VidN = :VidN and PSCH = :PSCH');
    if sBtnSortByTabN.Down then
      SQL.Add('order by n.TabN')
    else
      SQL.Add('order by u.Fam, u.Ima, u.Otch');
    ParamByName('nKdSps').AsInteger := nKdSps;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.qryDetCalcFields(DataSet: TDataSet);
begin
  qryDetFamIO.AsString := MyFamIO(qryDetFam.AsString,
                                    qryDetIma.AsString, qryDetOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.FormCreate(Sender: TObject);
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
  if FileExists(cDirVids + 'SpsOtk01.vid') then
    dbgrGrp.Columns.LoadFromFile(cDirVids + 'SpsOtk01.vid');
  if FileExists(cDirVids + 'SpsOtk02.vid') then
    dbgrDet.Columns.LoadFromFile(cDirVids + 'SpsOtk02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryGrp.Active then
    dbgrGrp.Columns.SaveToFile(cDirVids + 'SpsOtk01.vid');
  if qryDet.Active then
    dbgrDet.Columns.SaveToFile(cDirVids + 'SpsOtk02.vid');
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
procedure TFormSpsOtkl.sBtnLinkClick(Sender: TObject);
begin
  SetLnkState;
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.SetLnkState;
begin
  if sBtnLink.Down then begin
    dbgrDet.Color := clInfoBk;
    qryDet.DataSource := dsrcGrp;
    OpenQryDet(n_KdSps); end
  else begin
    if qryDet.Active then
      qryDet.Close;
    dbgrDet.Color := clBtnFace;
    qryDet.DataSource := nil;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.sBtnSortClick(Sender: TObject);
var nSvNR : integer;
begin
  if qryDet.Active then begin
    nSvNR := qryDetNR.AsInteger;
    OpenQryDet(n_KdSps);
    if nSvNR <> 0 then
      qryDet.Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormSpsOtkl.dbgrDetDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrDet.Canvas do begin
    if not (gdFocused in State) then begin
      cFldNm := UpperCase(Column.FieldName);
      if (cFldNm = 'SUMMA') then begin
        Font.Style := [fsBold];
        if Column.Field.AsFloat < 0 then
          Font.Color := clRed;
      end;
    end;
  end;
  dbgrDet.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
