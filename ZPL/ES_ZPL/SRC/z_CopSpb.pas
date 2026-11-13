unit z_CopSpb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls,
  Buttons;

type
  TFormGetCopySpb = class(TForm)
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    PanelLeft: TPanel;
    Splitter1: TSplitter;
    dbgrVed: TDBGrid;
    dbgrOtkl: TDBGrid;
    qryVed: TQuery;
    qryOtkl: TQuery;
    dsrcVed: TDataSource;
    dsrcOtkl: TDataSource;
    qryVedNR: TIntegerField;
    qryVedDTPROC: TDateTimeField;
    qryVedKDUSR: TSmallintField;
    qryVedKDSPS: TSmallintField;
    qryVedTYPEVED: TStringField;
    qryVedVEDNR: TIntegerField;
    qryVedVEDDATE: TDateTimeField;
    qryVedNOTES: TStringField;
    qryVedPRPODKL: TSmallintField;
    qryVedBNKNRPRDF: TSmallintField;
    qryVedBNKDTPRDF: TDateTimeField;
    qryVedBNKNMPRDF: TStringField;
    qryVedKSSVEDNR: TSmallintField;
    qryVedKSSVEDDT: TDateTimeField;
    qryVedKSSVEDNM: TStringField;
    qryVedNMUSR: TStringField;
    qryOtklKDBNK: TSmallintField;
    qryOtklLICSCH: TStringField;
    qryOtklSPB: TStringField;
    qryOtklDTBEG: TDateTimeField;
    qryOtklFAM: TStringField;
    qryOtklIMA: TStringField;
    qryOtklOTCH: TStringField;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklSHVIDN: TStringField;
    qryOtklSTORN: TStringField;
    qryOtklOLDKDVIDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklSCHBU: TStringField;
    qryOtklPSCH: TStringField;
    qryOtklNOTES: TStringField;
    qryOtklPRR: TSmallintField;
    qryOtklPRPV: TSmallintField;
    qryOtklKTO: TSmallintField;
    qryOtklPRKR: TSmallintField;
    qryOtklSPEC_NR: TIntegerField;
    qryOtklDTVDPV: TDateTimeField;
    qryOtklNRVDPV: TIntegerField;
    qryOtklMYNOTES: TStringField;
    qryOtklSPECPS: TIntegerField;
    qryOtklPBNK: TSmallintField;
    qryOtklKDBNK_1: TSmallintField;
    qryOtklFamIO: TStringField;
    procedure qryOtklCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrVedDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryVed(dDtPrc : TDateTime);
    procedure OpenQryOtkl;
    procedure AddOtklToSpb(dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

function CopyPredSpb(dDtPrc : TDateTime) : boolean;

const SECTION = 'z_CopSpb';

var
  FormGetCopySpb: TFormGetCopySpb;

implementation

uses a_Const, a_DM, z_DM, z_Main, z_VedV, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function CopyPredSpb(dDtPrc : TDateTime) : boolean;
begin
  Result := false;
  FormGetCopySpb := TFormGetCopySpb.Create(Application);
  with FormGetCopySpb do begin
    OpenQryVed(dDtPrc);
    OpenQryOtkl;
    Caption := 'Выберите ведомость для создания её копии';
    if ShowModal = mrOk then begin
      AddOtklToSpb(dDtPrc);
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetCopySpb.dbgrVedDblClick(Sender: TObject);
begin
  if (qryVed.RecordCount > 0) and (qryOtkl.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGetCopySpb.AddOtklToSpb(dDtPrc: TDateTime);
var nSvNR : integer; cShBnk : ShortString;
begin
  with qryOtkl do begin
    nSvNR := qryOtklNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      FormVedV.cdsSpb.Append;
      FormVedV.bNeedValidate := false;
      FormVedV.cdsSpbDtProc.AsDateTime := dDtPrc;
      FormVedV.bNeedValidate := false;
      FormVedV.cdsSpbTabN.AsInteger := qryOtklTabN.AsInteger;
      FormVedV.bNeedValidate := true;
      FormVedV.cdsSpbFamIO.AsString := qryOtklFamIO.AsString;
      FormVedV.cdsSpbKdSps.AsInteger := qryOtklKdSps.AsInteger;
      FormVedV.cdsSpbKdObj.AsInteger := qryOtklKdObj.AsInteger;
      FormVedV.cdsSpbKdKatP.AsInteger := qryOtklKdKatP.AsInteger;
      FormVedV.cdsSpbKdSpZ.AsInteger := qryOtklKdSpZ.AsInteger;
      FormVedV.cdsSpbSpZ.AsString := qryOtklSchBU.AsString;
      FormVedV.cdsSpbPSCH.AsString := qryOtklPSCH.AsString;
      FormVedV.cdsSpbSmToVed.AsFloat := -qryOtklSumma.AsFloat;
      FormVedV.cdsSpbKdBnk.AsInteger := qryOtklKdBnk.AsInteger;
      FormVedV.cdsSpbNmBnk.AsString :=
                         DmMain.KdBnk2NmBnk(qryOtklKdBnk.AsInteger, cShBnk);
      FormVedV.cdsSpbLS.AsString := qryOtklLicSch.AsString;
      FormVedV.cdsSpb.Post;
      //FormVedV.bNeedValidate := true;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
//    FormVedV.sBtnSpbSaveVed.Enabled := FormVedV.cdsSpB.RecordCount > 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetCopySpb.OpenQryVed(dDtPrc: TDateTime);
begin
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select us.NmUsr, v.* from z_VedNR v ' +
            ' Left Outer Join Usrs us on us.KdUsr = v.KdUsr ' +
            ' where v.DtProc < :dDtPrc and v.typeVed = "VedSpB" ' +
            ' order by VedNR');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetCopySpb.OpenQryOtkl;
begin
  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcVed;
    SQL.Add('Select bl.KdBnk, bl.LicSch, bl.SpB, bl.DtBeg, ' +
            ' u.Fam, u.Ima, u.Otch, o.* from ViOtkl o ' +
            ' Left outer join z_Upi u on u.TabN = o.TabN ' +
            ' Left outer join Z_BankiLS bl on bl.TabN = o.TabN and ' +
            ' bl.KdBnk = o.KdBnk and (bl.SpB = "Y") ' +
            ' where o.DtProc = :DtProc and o.NrVdPv = :VedNr and ' +
            ' o.VidN > "7500" and o.VidN < "7520"');
    Open;
    //Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetCopySpb.qryOtklCalcFields(DataSet: TDataSet);
begin
  qryOtklFamIO.AsString := MyFamIO(qryOtklFam.AsString, qryOtklIma.AsString,
                                                       qryOtklOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormGetCopySpb.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 575);
    Width  := ReadInteger(SECTION, 'wW', 900);
    PanelLeft.Width := ReadInteger(SECTION, 'PnlLeftW', 275);
    Free;
  end;
  if FileExists(cDirVids + 'CpSpV_01.vid') then
    dbgrVed.Columns.LoadFromFile(cDirVids + 'CpSpV_01.vid');
  if FileExists(cDirVids + 'CpSpO_01.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'CpSpO_01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGetCopySpb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVed.Columns.SaveToFile(cDirVids + 'CpSpV_01.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'CpSpO_01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'PnlLeftW', PanelLeft.Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetCopySpb.dbgrOtklDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrOtkl.Canvas do begin
    if not (gdFocused in State) then begin
      if (cFldNm = 'SUMMA') and (Column.Field.Value <= 0) then
        Font.Color := clRed
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
