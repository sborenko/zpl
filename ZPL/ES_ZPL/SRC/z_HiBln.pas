unit z_HiBln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, DBCtrls, Mask, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Buttons, ComCtrls;

type
  TFormHiBln = class(TForm)
    PanelControl: TPanel;
    sBtnPrtReeBln: TSpeedButton;
    bBtnClose: TBitBtn;
    dbgrVBln: TDBGrid;
    qryVBln: TQuery;
    qryVBlnNR: TIntegerField;
    qryVBlnKDSPS: TSmallintField;
    qryVBlnDTPROC: TDateTimeField;
    qryVBlnTABN: TIntegerField;
    qryVBlnALGRASCH: TSmallintField;
    qryVBlnNCHBUDMES: TStringField;
    qryVBlnNRLIST: TStringField;
    qryVBlnDTLIST: TDateTimeField;
    qryVBlnDTBEG: TDateTimeField;
    qryVBlnDTEND: TDateTimeField;
    qryVBlnCNTDAYS: TSmallintField;
    qryVBlnVIDN: TStringField;
    qryVBlnShVidN: TStringField;
    qryVBlnOLDKDVIDN: TSmallintField;
    qryVBlnCNTCHAS: TFloatField;
    qryVBlnPROCOPL: TFloatField;
    qryVBlnKDOBJ: TSmallintField;
    qryVBlnKDKATP: TSmallintField;
    qryVBlnKDSPZ: TSmallintField;
    qryVBlnNOTES: TStringField;
    qryVBlnSMSRDN: TFloatField;
    qryVBlnSMBLN: TFloatField;
    qryVBlnSPEC_NR: TIntegerField;
    qryVBlnDAY5FIRST: TStringField;
    qryVBlnLISTCONT: TStringField;
    qryVBlnPREDSPEC_NR: TIntegerField;
    qryVBlnPredNR: TStringField;
    qryVBlnPredDt: TDateField;
    dsrcVBln: TDataSource;
    qryTmp: TQuery;
    Splitter2: TSplitter;
    PanelBln: TPanel;
    PanelBlnDetails: TPanel;
    qryRBln: TQuery;
    qryRBlnNR: TIntegerField;
    qryRBlnTABN: TIntegerField;
    qryRBlnSPEC_NR: TIntegerField;
    qryRBlnZAMESGOD: TDateTimeField;
    qryRBlnSMZARABOTKA: TFloatField;
    qryRBlnKOEFZP: TFloatField;
    qryRBlnKDSPS: TSmallintField;
    qryRBlnSmZpKoef: TFloatField;
    dsrcRBln: TDataSource;
    qryOtkl: TQuery;
    qryOtklNR: TIntegerField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklSHVIDN: TStringField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklShObj: TStringField;
    qryOtklKDKATP: TSmallintField;
    qryOtklShKatP: TStringField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklNOTES: TStringField;
    qryOtklPRR: TSmallintField;
    qryOtklPRPV: TSmallintField;
    qryOtklKTO: TSmallintField;
    qryOtklPRKR: TSmallintField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklSPEC_NR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklSCHBU: TStringField;
    qryOtklPSCH: TStringField;
    dsrcOtkl: TDataSource;
    PageControl: TPageControl;
    tsNew: TTabSheet;
    tsOld: TTabSheet;
    dbgrRBln: TDBGrid;
    Splitter1: TSplitter;
    dbgrOtkl: TDBGrid;
    dbgrNuOld: TDBGrid;
    LblDescription2: TLabel;
    LblDescription1: TLabel;
    qryNuOld: TQuery;
    qryNuOldKDSPS: TSmallintField;
    qryNuOldVIDN: TStringField;
    qryNuOldSHVIDN: TStringField;
    qryNuOldOLDKDVIDN: TSmallintField;
    qryNuOldDTPROC: TDateTimeField;
    qryNuOldZAMESGOD: TDateTimeField;
    qryNuOldCHAS: TFloatField;
    qryNuOldSUMMA: TFloatField;
    qryNuOldDT_BEG: TDateTimeField;
    qryNuOldDT_END: TDateTimeField;
    qryNuOldPDN: TSmallintField;
    qryNuOldMYNOTES: TStringField;
    dsrcNuOld: TDataSource;
    qryRBlnCNTDAYS: TFloatField;
    GroupBox1: TGroupBox;
    LblNrList: TLabel;
    LblDtBeg: TLabel;
    LblDays: TLabel;
    LblDtEnd: TLabel;
    LblVidN: TLabel;
    LblPercent: TLabel;
    LblNotes: TLabel;
    LblAverage: TLabel;
    LblSumTotal: TLabel;
    dbtOldKdVidN: TDBText;
    LabelPredNr: TLabel;
    LabelPredDt: TLabel;
    dbeNrList: TDBEdit;
    dbeDtBeg: TDBEdit;
    dbeCntDays: TDBEdit;
    dbeDtEnd: TDBEdit;
    dbeVidN: TDBEdit;
    dbeProcOpl: TDBEdit;
    dbeNotes: TDBEdit;
    dbeShVidN: TDBEdit;
    dbeSmSrdn: TDBEdit;
    dbeSmBln: TDBEdit;
    dbePredNr: TDBEdit;
    dbePredDt: TDBEdit;
    DBChBoxFirst5: TDBCheckBox;
    LblStageCommon: TLabel;
    Lbl12Mnth: TLabel;
    DBEStgCmn: TDBEdit;
    DBEStg12: TDBEdit;
    qryVBlnSTGCMN: TFloatField;
    qryVBlnSTG12: TFloatField;
    qryRBlnSm_Svm: TFloatField;
    qryRBlnSumSupplCoeff: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PanelBlnDetailsResize(Sender: TObject);
    procedure qryVBlnCalcFields(DataSet: TDataSet);
    procedure dsrcVBlnDataChange(Sender: TObject; Field: TField);
    procedure qryRBlnCalcFields(DataSet: TDataSet);
    procedure dbgrVBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryVBln(nTabN : integer);
    procedure OpebQryRBln;
    procedure OpenQryOtkl;
    procedure SetLabs;
  public
    { Public declarations }
  end;

procedure ShowBlnHistory(nTabN : integer; cFamIO : ShortString);

const SECTION = 'z_HiBln';

var
  FormHiBln: TFormHiBln;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, Math;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowBlnHistory(nTabN : integer; cFamIO : ShortString);
begin
  FormHiBln := TFormHiBln.Create(Application);
  with FormHiBln do begin
    Caption := cFamIO + '  -  история больничных';
    OpenQryVBln(nTabN);
    OpebQryRBln;
    OpenQryOtkl;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.OpenQryVBln(nTabN: integer);
begin
  InitQuery(qryVBln);

  with qryVBln do begin
    SQL.Add('select * from Z_VBln where TabN = :TabN ' +
            ' order by DtBeg, NR');
    ParamByName('TabN').AsInteger := nTabN;
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.OpebQryRBln;
begin
  with qryRBln do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcVBln;
    SQL.Add('Select * from Z_RBln where TabN = :TabN and Spec_NR = :Spec_NR ' +
            ' order by ZaMesGod, VidN');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.OpenQryOtkl;
begin
  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcVBln;
    SQL.Add('select * from ViOtkl where DtProc = :DtProc and ' +
            ' TabN = :TabN and (Spec_NR = :Spec_NR or Notes = :NrList) ' +
            ' order by ZaMesGod, VidN');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 456);
    Width  := ReadInteger(SECTION, 'wW', 526);
    dbgrVBln.Width  := ReadInteger(SECTION, 'VBlnW', 260);
    dbgrOtkl.Height := ReadInteger(SECTION, 'OtklH', 120);
    Free;
  end;
  tsNew.TabVisible := false;
  tsOld.TabVisible := false;
  PageControl.ActivePage := tsNew;
  // dbChBoxFirst5.Top := 50;
  // dbChBoxFirst5.Left := 129;
  dbChBoxFirst5.Visible := false;
  LabelPredNr.Visible := false;
  LabelPredDt.Visible := false;
  dbePredNR.Visible := false;
  dbePredDt.Visible := false;
  // dbtSpec_NR.Visible := bFlagDbg;
  if FileExists(cDirVids + 'HiBln04.vid') then
    dbgrVBln.Columns.LoadFromFile(cDirVids + 'HiBln04.vid');
  if FileExists(cDirVids + 'HiBln02_2.vid') then
    dbgrRBln.Columns.LoadFromFile(cDirVids + 'HiBln02_2.vid');
  if FileExists(cDirVids + 'HiBln03.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'HiBln03.vid');
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVBln.Columns.SaveToFile(cDirVids + 'HiBln04.vid');
  dbgrRBln.Columns.SaveToFile(cDirVids + 'HiBln02_2.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'HiBln03.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'VBlnW', dbgrVBln.Width);
    WriteInteger(SECTION, 'OtklH', dbgrOtkl.Height);
    Free;
  end;
end;

procedure TFormHiBln.PanelBlnDetailsResize(Sender: TObject);
begin
  PanelBlnDetails.Left := Round((PanelBlnDetails.Width - PanelBlnDetails{PanelKart}.Width) / 2);
end;

procedure TFormHiBln.qryVBlnCalcFields(DataSet: TDataSet);
var cVidN : string;
begin
  qryVBln.FieldByName('ShVidN').AsString :=
           DmMain.VidN2ShVidN(qryVBln.FieldByName('VidN').AsString, cVidN);
  qryVBlnPredNR.AsString := '';
  qryVBlnPredDt.AsString := '';
  if (qryVBlnListCont.AsString = '1') and (not qryVBlnPredSpec_NR.IsNull) then
                                                          with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_VBln where Spec_NR = :nPredSpec_NR');
    ParamByName('nPredSpec_NR').AsInteger := qryVBlnPredSpec_NR.AsInteger;
    Open;
    if RecordCount <> 0 then begin
      qryVBlnPredNR.AsString := FieldByName('NrList').AsString;
      qryVBlnPredDt.AsString := FieldByName('DtList').AsString;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.SetLabs;
begin
  if (qryVBlnListCont.AsString = '1') then begin
    dbChBoxFirst5.Visible := false;
    LabelPredNr.Visible := true;
    LabelPredDt.Visible := true;
    dbePredNR.Visible := true;
    dbePredDt.Visible := true; end
  else begin
    dbChBoxFirst5.Visible := true;
    LabelPredNr.Visible := false;
    LabelPredDt.Visible := false;
    dbePredNR.Visible := false;
    dbePredDt.Visible := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.dsrcVBlnDataChange(Sender: TObject; Field: TField);
var dDtBegBln, dDtPrcBeg, dDtPrcEnd : TDateTime; nY,nM,nD : word;
begin
  if dsrcVBln.State = dsBrowse then begin
    SetLabs;
    if dsrcVBln.State = dsBrowse then begin
      if qryVBlnOldKdVidN.IsNull {на рассчитанных в новой программе листках
              OldKdVidN не заполняется} and (qryVBlnSpec_NR.AsInteger > 0) then
        PageControl.ActivePage := tsNew
      else if not qryVBlnDtBeg.IsNull then begin // а что делать, если NULL?
        dDtBegBln := qryVBlnDtBeg.AsDateTime;
        DecodeDate(dDtBegBln, nY, nM, nD);
        dDtPrcBeg := EncodeDate(nY, 1, 1);
        dDtPrcEnd := EncodeDate(nY, 12, 1);
        with qryNuOld do begin
          if Active then Close;
          SQL.Clear;
          DataBaseName := CESMAIN;
          SQL.Add('Select KdSps, VidN, ShVidN, OldKdVidN, DtProc, ZaMesGod, ' +
                  ' Chas, Summa, Dt_Beg, Dt_End, PdN, MyNotes ' +
                  ' from ViNu_Main where TabN = :nTabN and ' +
                  ' DtProc >= :dDtPrcBeg and DtProc <= :dDtPrcEnd and ' +
                  ' KdSps = :nKdSps and VidN > "2600" and VidN < "2700" and ' +
                  ' Summa <> 0 ');
          ParamByName('nTabN').AsInteger := qryVBlnTabN.AsInteger;
          ParamByName('nKdSps').AsInteger := qryVBlnKdSps.AsInteger;
          ParamByName('dDtPrcBeg').AsDateTime := dDtPrcBeg;
          ParamByName('dDtPrcEnd').AsDateTime := dDtPrcEnd;
          Open;
          PageControl.ActivePage := tsOld;
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.qryRBlnCalcFields(DataSet: TDataSet);
begin
  qryRBlnSmZpKoef.AsFloat :=
    RoundTo(qryRBlnSmZarabotka.AsFloat * qryRBlnKoefZp.AsFloat / 100, -2);

  qryRBlnSumSupplCoeff.AsFloat :=
    RoundTo(qryRBlnSm_Svm.AsFloat * qryRBlnKoefZp.AsFloat / 100, -2);
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.dbgrVBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrVBln.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if (cFldNm = 'NRLIST') then begin
        if (qryVBlnListCont.AsString = '1') then
          Brush.Color := clYellow;
      end;
    end;
  end;
  dbgrVBln.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormHiBln.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
