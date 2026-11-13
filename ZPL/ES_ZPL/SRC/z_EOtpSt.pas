unit z_EOtpSt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, Menus, DBClient;

type
  TFormEOtpStorn = class(TForm)
    qryOtkl: TQuery;
    dsrcOtkl: TDataSource;
    qryStorn: TQuery;
    dsrcStorn: TDataSource;
    updStorn: TUpdateSQL;
    PanelBottom: TPanel;
    PanelLeft: TPanel;
    sBtnSaveStorn: TSpeedButton;
    bBtnCancel: TBitBtn;
    dbgrOtkl: TDBGrid;
    LbxStornRec: TListBox;
    Splitter1: TSplitter;
    dbgrStorn: TDBGrid;
    qryStornNR: TIntegerField;
    qryStornKDSPS: TSmallintField;
    qryStornDTPROC: TDateTimeField;
    qryStornZAMESGOD: TDateTimeField;
    qryStornTABN: TIntegerField;
    qryStornVIDN: TStringField;
    qryStornOLDKDVIDN: TSmallintField;
    qryStornCHAS: TFloatField;
    qryStornSUMMA: TFloatField;
    qryStornOLDKDOBJ: TSmallintField;
    qryStornKDOBJ: TSmallintField;
    qryStornKDKATP: TSmallintField;
    qryStornDT_BEG: TDateTimeField;
    qryStornDT_END: TDateTimeField;
    qryStornPDN: TSmallintField;
    qryStornKDSPZ: TSmallintField;
    qryStornNOTES: TStringField;
    qryStornPRR: TSmallintField;
    qryStornPRPV: TSmallintField;
    qryStornKTO: TSmallintField;
    qryStornPRKR: TSmallintField;
    qryStornSPEC_NR: TIntegerField;
    qryStornDTVDPV: TDateTimeField;
    qryStornNRVDPV: TIntegerField;
    qryStornMYNOTES: TStringField;
    qryStornSPECPS: TIntegerField;
    qryStornPBNK: TSmallintField;
    qryStornSTORN: TStringField;
    qryStornShVidN: TStringField;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklVIDN: TStringField;
    qryOtklShVidN: TStringField;
    qryOtklOLDKDVIDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklOLDKDOBJ: TSmallintField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklKDSPZ: TSmallintField;
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
    qryOtklSTORN: TStringField;
    qryStornSVDTBEG: TDateTimeField;
    qryStornSVDTEND: TDateTimeField;
    popOtkl: TPopupMenu;
    popOtklStornPart: TMenuItem;
    popOtklDelStorn: TMenuItem;
    cdsF8: TClientDataSet;
    cdsF8NR: TAutoIncField;
    cdsF8ZaMesGod: TDateField;
    cdsF8SvDtBeg: TDateField;
    cdsF8SvDtEnd: TDateField;
    cdsF8StornFull: TBooleanField;
    cdsF8StornDtBeg: TDateField;
    cdsF8StornDtEnd: TDateField;
    dsrcF8: TDataSource;
    dbgrF8: TDBGrid;
    qryTmp: TQuery;
    qryOtklDTSTORN: TDateTimeField;
    qryStornDTSTORN: TDateTimeField;
    sBtnF8: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrOtklDblClick(Sender: TObject);
    procedure dbgrStornDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnSaveStornClick(Sender: TObject);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure qryStornNewRecord(DataSet: TDataSet);
    procedure qryStornCalcFields(DataSet: TDataSet);
    procedure qryOtklCalcFields(DataSet: TDataSet);
    procedure popOtklPopup(Sender: TObject);
    procedure popOtklStornPartClick(Sender: TObject);
    procedure popOtklDelStornClick(Sender: TObject);
    procedure sBtnF8Click(Sender: TObject);
  private
    { Private declarations }
    n_TabN, n_Spec_NR : integer;
    d_DtPrc : TDateTime;
    bAddStornAuto : boolean;
    procedure OpenQryOtkl(nTabN, nSpec_NR : integer);
    procedure OpenQryStorn(nTabN, nSpec_NR : integer);
    procedure SetDbgrOtklColumns;
    procedure SetDbgrStornColumns;
  public
    { Public declarations }
  end;

function EAOtpStorn(nTabN, nSpec_NR : integer; dDtPrc : TDateTime) : boolean;

const SECTION = 'z_EOtpSt';

var
  FormEOtpStorn: TFormEOtpStorn;

implementation

uses A_Const, A_DM, Z_DM, Z_Main, z_EOtpP;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAOtpStorn(nTabN, nSpec_NR : integer; dDtPrc : TDateTime) : boolean;
begin
  Result := false;
  FormEOtpStorn := TFormEOtpStorn.Create(Application);
  with FormEOtpStorn do begin
    bAddStornAuto := false;
    n_TabN := nTabN;
    n_Spec_NR := nSpec_NR;
    d_DtPrc := dDtPrc;
    OpenQryOtkl(nTabN, nSpec_NR);
    OpenQryStorn(nTabN, nSpec_NR);
    if ShowModal = mrOk then begin
      Result := true;

    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.FormCreate(Sender: TObject);
begin
  Caption := 'Сторнирование отпускных';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 420);
    Width  := ReadInteger(SECTION, 'wW', 620);
    dbgrOtkl.Height := ReadInteger(SECTION, 'GrOtklH', 175);
    Free;
  end;
  if FileExists(cDirVids + 'EStOtp03.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'EStOtp03.vid');
  if FileExists(cDirVids + 'EStOtp04.vid') then
    dbgrStorn.Columns.LoadFromFile(cDirVids + 'EStOtp04.vid');
  sBtnF8.Visible := bFlagDbg;
  dbgrF8.Visible := false;
  SetDbgrOtklColumns;
  SetDbgrStornColumns;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'EStOtp03.vid');
  if qryStorn.Active then
    dbgrStorn.Columns.SaveToFile(cDirVids + 'EStOtp04.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'GrOtklH', dbgrOtkl.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.OpenQryOtkl(nTabN, nSpec_NR: integer);
begin
  with qryOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Otkl where TabN = :nTabN and ' +
               ' Spec_NR = :nSpec_NR and ' +
               ' (Storn is NULL or not Storn = "Y")');
    SQL.Add(' order by ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.OpenQryStorn(nTabN, nSpec_NR: integer);
begin
  with qryStorn do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select o.Dt_Beg as SvDtBeg, ' +
            ' o.Dt_End as SvDtEnd, o.* ' +
            ' from Z_Otkl o where o.TabN = :nTabN and ' +
            ' o.Spec_NR = :nSpec_NR and (o.Storn = "Y")');
    SQL.Add(' order by ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    Open;
    with cdsF8 do begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
    while not Eof do begin
      cdsF8.Append;
      cdsF8.FieldByName('ZaMesGod').AsString := qryStornZaMesGod.AsString;
      if qryOtkl.Locate('ZaMesGod', qryStornZaMesGod.AsDateTime, []) then begin
        cdsF8.FieldByName('SvDtBeg').AsString := qryOtklDt_Beg.AsString;
        cdsF8.FieldByName('SvDtEnd').AsString := qryOtklDt_End.AsString;
      end;
      cdsF8.FieldByName('StornDtBeg').AsString := qryStornDt_Beg.AsString;
      cdsF8.FieldByName('StornDtEnd').AsString := qryStornDt_End.AsString;
      if (cdsF8.FieldByName('SvDtBeg').AsDateTime =
                   cdsF8.FieldByName('StornDtBeg').AsDateTime) and
            (cdsF8.FieldByName('SvDtEnd').AsDateTime =
                   cdsF8.FieldByName('StornDtEnd').AsDateTime) then
        cdsF8.FieldByName('StornFull').AsString := 'T'
      else
          cdsF8.FieldByName('StornFull').AsString := 'F';
      cdsF8.Post;
      LbxStornRec.Items.Add(qryStornZaMesGod.AsString);
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.dbgrOtklDblClick(Sender: TObject);
var dRMes, dZaMG : TDateTime; cVidN : ShortString; i : SmallInt;
begin
  dRMes := qryOtklDtProc.AsDateTime;
  dZaMG := qryOtklZaMesGod.AsDateTime;
  cVidN := qryOtklVidN.AsString;
  if not qryStorn.Locate('DtProc;ZaMesGod',
                       VarArrayOf([dRMes, dZaMG]), []) then
    popOtklStornPartClick(Self)
  else begin
    dZaMG := qryOtklZaMesGod.AsDateTime;
    if qryStorn.Locate('ZaMesGod', dZaMG, []) then begin
     qryStorn.Delete;
      if cdsF8.Locate('ZaMesGod', dZaMG, []) then
        cdsF8.Delete;
      i := LbxStornRec.Items.IndexOf(qryOtklZaMesGod.AsString);
      if i >= 0 then
        LbxStornRec.Items.Delete(i);
      dbgrOtkl.Refresh;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.dbgrStornDrawColumnCell(Sender: TObject;
                         const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
begin
  with dbgrStorn.Canvas do begin
    if not (gdFocused in State) then begin
      if ((Column.FieldName = 'SUMMA') or (Column.FieldName = 'CHAS')) and
                                              (Column.Field.Value < 0) then
        Font.Color := clRed;
      if (UpperCase(Column.FieldName) = 'DT_BEG') or
                         (UpperCase(Column.FieldName) = 'DT_END') then
        Font.Style := [fsBold];
    end;
  end;
  dbgrStorn.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.sBtnSaveStornClick(Sender: TObject);
begin
  if qryStorn.UpdatesPending then begin
    Form_Dm.DbMain.ApplyUpdates([qryStorn]);
    qryStorn.Close;
    qryStorn.Open;
    DmMain.qryOtkl.Close;
    DmMain.qryOtkl.Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.dbgrOtklDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var i : Smallint;
begin
  with dbgrOtkl.Canvas do begin
    if not (gdFocused in State) then begin
      i := LbxStornRec.Items.IndexOf(qryOtklZaMesGod.AsString);
      if i >= 0 then
        Font.Color := clBlue;
      if (UpperCase(Column.FieldName) = 'DT_BEG') or
                         (UpperCase(Column.FieldName) = 'DT_END') then
        Font.Style := [fsBold];
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.SetDbgrOtklColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrOtkl.Columns.Count-1 do begin
    with dbgrOtkl.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SPEC_NR') or (cUpper = 'MYNOTES') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.SetDbgrStornColumns;
var i : word; cUpper : string;
begin
  for i := 0 to dbgrStorn.Columns.Count-1 do begin
    with dbgrStorn.Columns[i] do begin
      cUpper := UpperCase(FieldName);
      if (cUpper = 'SPEC_NR') or (cUpper = 'MYNOTES') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.qryStornNewRecord(DataSet: TDataSet);
begin
  if not bAddStornAuto then
    qryStorn.Cancel;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.qryStornCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  qryStornShVidN.AsString := DmMain.VidN2ShVidN(qryStornVidN.AsString, cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.qryOtklCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  qryOtklShVidN.AsString := DmMain.VidN2ShVidN(qryOtklVidN.AsString, cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.popOtklPopup(Sender: TObject);
var dZaMG : TDateTime;
begin
//  popOtklStornFull.Enabled := false;
  popOtklStornPart.Enabled := false;
  popOtklDelStorn.Enabled  := false;
  dZaMG := qryOtklZaMesGod.AsDateTime;
  if cdsF8.Locate('ZaMesGod', dZaMG, []) then begin
    if not cdsF8StornFull.AsBoolean then begin
      popOtklStornPart.Enabled := true;
      popOtklDelStorn.Enabled := true; end
    else
      popOtklDelStorn.Enabled := true; end
  else begin
//    popOtklStornFull.Enabled := true;
    popOtklStornPart.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.popOtklStornPartClick(Sender: TObject);
var dRMes, dZaMG, dSvDtBeg, dSvDtEnd : TDateTime;
    nCurOklTrf, nSmSrDn, nSmOtp : double;
    cRK, cVidN : ShortString; nCntDays : SmallInt;
begin
  // Для корректной дальнейшей работы работы нужны данные из Z_ROtkl
  nCurOklTrf := 0;
  nSmSrDn := 0;
  nSmOtp := 0;
  cRK := 'K';  // Lat
  nCntDays := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_VOtp where Spec_NR = :nSpec_NR');
    ParamByName('nSpec_NR').AsInteger := qryOtklSpec_NR.AsInteger;
    Open;
    if RecordCount > 0 then begin
      nCurOklTrf := FieldByName('CurOklTrf').AsFloat;
      nSmSrDn := FieldByName('SmSrDn').AsFloat;
      nSmOtp := FieldByName('SmOtp').AsFloat;
      cRK := FieldByName('RK').AsString;
      nCntDays := FieldByName('CntDays').AsInteger;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  dRMes := qryOtklDtProc.AsDateTime;
  dZaMG := qryOtklZaMesGod.AsDateTime;
  dSvDtBeg := qryOtklDt_Beg.AsDateTime;
  dSvDtEnd := qryOtklDt_End.AsDateTime;
  if qryStorn.Locate('ZaMesGod', dZaMG, []) then with qryStorn do begin
    Edit;
    if AddStornPart(qryStorn, dZaMG, dSvDtBeg, dSvDtEnd,
                    nCurOklTrf, nSmSrDn, nSmOtp, cRK, nCntDays) {z_EOtpP} then
      Post
    else
      Cancel; end
  else with qryStorn do begin
    bAddStornAuto := true;
    Append;
    cVidN := qryOtklVidN.AsString;
    qryStornKdSps.AsString := qryOtklKdSps.AsString;
    qryStornDtProc.AsDateTime := dRMes;
    qryStornDtStorn.AsDateTime := d_DtPrc;
    qryStornZaMesGod.AsDateTime := dZaMG;
    qryStornTabN.AsString := qryOtklTabN.AsString;
    qryStornVidN.AsString := cVidN; // у записи СТОРНО вид остается тот же
    qryStornChas.AsFloat := -qryOtklChas.AsFloat; // часы и сумма отрицательные
    qryStornSumma.AsFloat := -qryOtklSumma.AsFloat;  // м в поле STORN "Y"
    qryStornKdObj.AsString := qryOtklKdObj.AsString;
    qryStornKdKatP.AsString := qryOtklKdKatP.AsString;
    qryStornDt_Beg.AsString := qryOtklDt_Beg.AsString;
    qryStornSvDtBeg.AsString := qryOtklDt_Beg.AsString;
    qryStornDt_End.AsString := qryOtklDt_End.AsString;
    qryStornSvDtEnd.AsString := qryOtklDt_End.AsString;
    qryStornPdn.AsString := qryOtklPdn.AsString;
    qryStornKdSpZ.AsString := qryOtklKdSpZ.AsString;
    qryStornNotes.AsString := qryOtklNotes.AsString;
    qryStornSpec_NR.AsString := qryOtklSpec_NR.AsString;
    qryStornMyNotes.AsString := 'FrmOtpSt';
    qryStornStorn.AsString := 'Y';
    if AddStornPart(qryStorn, dZaMG, dSvDtBeg, dSvDtEnd, nCurOklTrf,
                           nSmSrDn, nSmOtp, cRK, nCntDays) {z_EOtpP} then begin
      Post;
      LbxStornRec.Items.Add(qryOtklZaMesGod.AsString);
      cdsF8.Append; // Добавляется полная копия записи qryOtkl
      cdsF8.FieldByName('ZaMesGod').AsString := qryStornZaMesGod.AsString;
      cdsF8.FieldByName('SvDtBeg').AsString := qryOtklDt_Beg.AsString;
      cdsF8.FieldByName('SvDtEnd').AsString := qryOtklDt_End.AsString;
      cdsF8.FieldByName('StornDtBeg').AsString := qryOtklDt_Beg.AsString;
      cdsF8.FieldByName('StornDtEnd').AsString := qryOtklDt_End.AsString;
      cdsF8.FieldByName('StornFull').AsString := 'F';
      cdsF8.Post;
      dbgrOtkl.Refresh; end
    else
      Cancel;
    bAddStornAuto := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEOtpStorn.popOtklDelStornClick(Sender: TObject);
var dZaMG : TDateTime; i : SmallInt;
begin
  dZaMG := qryOtklZaMesGod.AsDateTime;
  if qryStorn.Locate('ZaMesGod', dZaMG, []) then begin
    qryStorn.Delete;
    if cdsF8.Locate('ZaMesGod', dZaMG, []) then
      cdsF8.Delete;
    i := LbxStornRec.Items.IndexOf(qryOtklZaMesGod.AsString);
    if i >= 0 then
      LbxStornRec.Items.Delete(i);
    dbgrOtkl.Refresh;
  end;
end;

procedure TFormEOtpStorn.sBtnF8Click(Sender: TObject);
begin
  dbgrF8.Visible := not dbgrF8.Visible; 
end;

end.
