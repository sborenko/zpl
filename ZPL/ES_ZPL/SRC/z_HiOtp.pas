unit z_HiOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, Grids, DBGrids, DBTables, StdCtrls, Buttons, ExtCtrls,
  Mask, DBCtrls, ComCtrls, Provider, DBClient;

type
  TFormHiOtp = class(TForm)
    qryVOtp: TQuery;
    dsrcVOtp: TDataSource;
    dbgrVOtp: TDBGrid;
    qryVOtpNR: TIntegerField;
    qryVOtpKDSPS: TSmallintField;
    qryVOtpDTPROC: TDateTimeField;
    qryVOtpTABN: TIntegerField;
    qryVOtpCUROKLTRF: TFloatField;
    qryVOtpALGRASCH: TSmallintField;
    qryVOtpUSEKOEFOKL: TStringField;
    qryVOtpNCHMATPOM: TStringField;
    qryVOtpNCHBUDMES: TStringField;
    qryVOtpRK: TStringField;
    qryVOtpNRPRIK: TStringField;
    qryVOtpDTPRIK: TDateTimeField;
    qryVOtpDTBEG: TDateTimeField;
    qryVOtpCNTDAYS: TSmallintField;
    qryVOtpDTEND: TDateTimeField;
    qryVOtpCNTCHAS: TFloatField;
    qryVOtpVIDN: TStringField;
    qryVOtpPROCOPL: TFloatField;
    qryVOtpKDOBJ: TSmallintField;
    qryVOtpKDKATP: TSmallintField;
    qryVOtpKDSPZ: TSmallintField;
    qryVOtpNOTES: TStringField;
    qryVOtpSMSRDN: TFloatField;
    qryVOtpSPEC_NR: TIntegerField;
    qryVOtpSMOTP: TFloatField;
    Splitter1: TSplitter;
    PanelRight: TPanel;
    qryROtp: TQuery;
    qryROtpNR: TIntegerField;
    qryROtpSPEC_NR: TIntegerField;
    qryROtpZAMESGOD: TDateTimeField;
    qryROtpSMZARABOTKA: TFloatField;
    qryROtpKOEFZP: TFloatField;
    qryROtpCNTDAYS: TSmallintField;
    qryROtpKDSPS: TSmallintField;
    qryROtpSMOKLADA: TFloatField;
    qryROtpSMDSREDN: TFloatField;
    qryROtpSmZpKoef: TFloatField;
    dsrcROtp: TDataSource;
    qryOtkl: TQuery;
    qryOtklNR: TIntegerField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklTABN: TIntegerField;
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
    qryOtklVIDN: TStringField;
    qryOtklKDSPZ: TSmallintField;
    qryOtklSpz: TStringField;
    dsrcOtkl: TDataSource;
    PageControl1: TPageControl;
    tsNew: TTabSheet;
    tsOld: TTabSheet;
    dbgrROtp: TDBGrid;
    dbgrOtkl: TDBGrid;
    Splitter2: TSplitter;
    dbgrNuOld: TDBGrid;
    qryNuOld: TQuery;
    dsrcNuOld: TDataSource;
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
    Label11: TLabel;
    Label12: TLabel;
    qryVOtpShVidN: TStringField;
    updVOtp: TUpdateSQL;
    qryVOtpDTSTORN: TDateTimeField;
    updOtkl: TUpdateSQL;
    PanelTop: TPanel;
    panelVOtpDetails: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    dbeShVidN: TDBEdit;
    dbeVidN: TDBEdit;
    dbeNotes: TDBEdit;
    groupOrder: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dbeNrPrik: TDBEdit;
    dbeDtPrik: TDBEdit;
    groupPeriod: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    dbeDtBeg: TDBEdit;
    dbeDtEnd: TDBEdit;
    dbeCntDays: TDBEdit;
    bBtnCancel: TBitBtn;
    groupPayment: TGroupBox;
    lblPercent: TLabel;
    lblDayAverage: TLabel;
    lblSum: TLabel;
    dbeProcOpl: TDBEdit;
    dbeSmSrdn: TDBEdit;
    dbeSmOtp: TDBEdit;
    panelDebug: TPanel;
    dbtSpecNR: TDBText;
    lblSpecNR: TLabel;
    qryOtklStorn: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsrcVOtpDataChange(Sender: TObject; Field: TField);
    procedure qryVOtpCalcFields(DataSet: TDataSet);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbgrVOtpDblClick(Sender: TObject);
    procedure dbeNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeNotesExit(Sender: TObject);
    procedure qryAfterPost(DataSet: TDataSet);
    procedure qryVOtpAfterScroll(DataSet: TDataSet);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    n_TabN : integer;
    c_FamIO : ShortString;
    procedure OpenQryVOtp(nTabN : integer);
    procedure OpenQryROtp;
    procedure OpenQryOtkl;
  public
    { Public declarations }
  end;

procedure ShowOtpHistory(nTabN : integer; cFamIO : ShortString);

const SECTION = 'z_HiOtp';

var
  FormHiOtp: TFormHiOtp;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, Z_EOtp;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowOtpHistory(nTabN : integer; cFamIO : ShortString);
begin
  FormHiOtp := TFormHiOtp.Create(Application);
  with FormHiOtp do begin
    n_TabN := nTabN;
    c_FamIO := cFamIO;
    Caption := cFamIO + '  -  история отпускных';
    OpenQryVOtp(nTabN);
    OpenQryROtp;
    OpenQryOtkl;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHiOtp.FormCreate(Sender: TObject);
begin
  panelDebug.Visible := bFlagDbg;

  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 580);
    Width  := ReadInteger(SECTION, 'wW', 685);
    dbgrVOtp.Width := ReadInteger(SECTION, 'VOtpW', 260);
    dbgrOtkl.Height := ReadInteger(SECTION, 'OtklH', 135);
    dbgrVOtp.Width := ReadInteger(SECTION, 'Split1', 60);
    Free;
  end;
  tsNew.TabVisible := false;
  tsOld.TabVisible := false;
  PageControl1.ActivePage := tsNew;
  if FileExists(cDirVids + 'HiOtp01_7.vid') then
    dbgrVOtp.Columns.LoadFromFile(cDirVids + 'HiOtp01_7.vid');
  if FileExists(cDirVids + 'HiOtp02.vid') then
    dbgrROtp.Columns.LoadFromFile(cDirVids + 'HiOtp02.vid');
  if FileExists(cDirVids + 'HiOtp03.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'HiOtp03.vid');
end;
//------------------------------------------------------------------------------
procedure TFormHiOtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrVOtp.Columns.SaveToFile(cDirVids + 'HiOtp01_7.vid');
  dbgrROtp.Columns.SaveToFile(cDirVids + 'HiOtp02.vid');
  dbgrOtkl.Columns.SaveToFile(cDirVids + 'HiOtp03.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'PnlLftW', dbgrVOtp.Width);
    WriteInteger(SECTION, 'OtklH', dbgrOtkl.Height);
    WriteInteger(SECTION, 'Split1', dbgrVOtp.Width);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.OpenQryVOtp(nTabN: integer);
begin
  with qryVOtp do begin
    z_DM.InitQuery(qryVOtp);

    SQL.Add(
      'select' +
      ' NR, TABN, USEKOEFOKL, NCHMATPOM, NCHBUDMES, KDOBJ, KDKATP, KDSPZ,' +
      ' KDSPS, DTPROC, CUROKLTRF, ALGRASCH, RK,' +
      ' NRPRIK, DTPRIK, DTBEG, CNTDAYS, DTEND,' +
      ' CNTCHAS, VIDN, PROCOPL, NOTES, SMSRDN,' +
      ' SMOTP, SPEC_NR, CAST(NULL AS TIMESTAMP) DTSTORN ' +
      'from Z_VOtp ' +
      'where TabN = :nTabN ' +

      'UNION ' +

      'select ' +
        'NR, TABN, NULL, NULL, NULL, KDOBJ, KDKATP, KDSPZ, ' +
        'KDSPS, DTPROC, NULL CUROKLTRF, NULL ALGRASCH,NULL RK, ' +
        'NULL NRPRIK, NULL DTPRIK, DT_BEG DTBEG, ' +
        'cast(DT_END - DT_BEG + 1 as int) CNTDAYS, DT_END DTEND, ' +
        'CHAS CNTCHAS, VIDN, NULL PROCOPL, NOTES, NULL SMSRDN, ' +
        'SUMMA SMOTP, SPEC_NR, DTSTORN ' +
      'from z_otkl o ' +
      'where ' +
        'tabn = :nTabN ' +
        'and vidn in ("5005", "5008") ' +
        // Некоторым отпускным отклонениям не проставлялся Spec_Nr.
        // Чтобы их не потерять:
        'and (Spec_NR is null or Spec_NR = 0 ' +
          // Для некоторых отпускных отклонений почему-то нет записей в z_VOtp.
          // Чтобы их не потерять:
          'or not exists (select "x" from z_VOtp where Spec_Nr = o.Spec_Nr) ' +
        ') ' +

      'order by 16, 1'
    );

    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Last;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.OpenQryROtp;
begin
  with qryROtp do begin
    z_DM.InitQuery(qryROtp);
    DataSource := dsrcVOtp;
    SQL.Add(
      'Select * from Z_ROtp where Spec_NR = :Spec_NR' +
      ' order by ZaMesGod');
    Open;
    Last;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.OpenQryOtkl;
begin
  with qryOtkl do begin
    z_DM.InitQuery(qryOtkl);
    DataSource := dsrcVOtp;
    SQL.Add(
      'select * ' +
      'from z_otkl ' +
      'where ' +
        'TabN = :TabN ' +
        'and (' +
            'not :Spec_NR is null and :Spec_NR <> 0 and Spec_NR = :Spec_NR ' +
            'or (:Spec_NR is null or :Spec_NR = 0) and NR = :NR' +
        ') ' +
      'order by ZaMesGod, Dt_Beg, Dt_End');
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.dsrcVOtpDataChange(Sender: TObject; Field: TField);
var dDtBegOtp, dDtPrcBeg, dDtPrcEnd : TDateTime; nY,nM,nD : word;
begin
  if dsrcVOtp.State = dsBrowse then begin
    if not qryVOtpSpec_NR.IsNull and (qryVOtpSpec_NR.AsInteger > 0)
      or (qryVOtpVIDN.AsString = '5005') or (qryVOtpVIDN.AsString = '5008')
     then
      PageControl1.ActivePage := tsNew
    else if not qryVOtpDtBeg.IsNull then begin // а что делать, если NULL?
      dDtBegOtp := qryVOtpDtBeg.AsDateTime;
      DecodeDate(dDtBegOtp, nY, nM, nD);
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
                ' KdSps = :nKdSps and VidN > "2400" and VidN < "2500" and ' +
                ' Summa <> 0 ');
        ParamByName('nTabN').AsInteger := qryVOtpTabN.AsInteger;
        ParamByName('nKdSps').AsInteger := qryVOtpKdSps.AsInteger;
        ParamByName('dDtPrcBeg').AsDateTime := dDtPrcBeg;
        ParamByName('dDtPrcEnd').AsDateTime := dDtPrcEnd;
        Open;
        PageControl1.ActivePage := tsOld;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.qryVOtpCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  qryVOtpShVidN.AsString := DmMain.VidN2ShVidN(qryVOtpVidN.AsString, cNmVidN);
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.dbgrVOtpDblClick(Sender: TObject);
var bPereschet : boolean; d_DtPrc : TDateTime;
begin
  // Разрешить только просмотр и только новых
  if (not qryVOtpSpec_NR.IsNull) and (qryVOtpSpec_NR.AsInteger > 0) then begin
    d_DtPrc := qryVOtpDtProc.AsDateTime;
    TFormEOtp.AddEdtOtp(n_TabN, d_DtPrc, c_FamIO, qryVOtpSpec_NR.AsInteger, {Z_EOtp}
                                                  false, bPereschet, false);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.qryVOtpAfterScroll(DataSet: TDataSet);
begin
  if qryVOtpSPEC_NR.AsInteger > 0 then
    dbeNotes.DataSource := dsrcVOtp
  else begin
    if qryOtkl.Active then begin
      qryOtkl.Edit;
      dbeNotes.DataSource := dsrcOtkl;
      dbeNotes.DataField := 'NOTES';
      // dbeNotes.Refresh;
      OutputDebugString(PAnsiChar('NR Otkl: ' + qryOtklNR.AsString));
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.dbeNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  dataSet: TDataSet;
begin
  dataSet := (Sender as TDBEdit).DataSource.DataSet;
  if (qryOtkl = dataSet) then
    OutputDebugString('DataSet  : qryOtkl')
  else
    OutputDebugString('DataSet  : qryVOtp');

  OutputDebugString(PAnsiChar('DataField: ' + dbeNotes.DataField));

  if (dataSet.State = dsEdit) then
    OutputDebugString('State    : Edit')
  else
    OutputDebugString('State    : ERROR');

  if (qryOtkl = dataSet) then
    OutputDebugString(PAnsiChar('Otkl Notes: ' + qryOtkl.FieldByName('NOTES').AsString))
  else
    OutputDebugString(PAnsiChar('VOtp Notes: ' + qryVOtp.FieldByName('NOTES').AsString));
    
  if (Key = vk_Return) and (dataSet.State = dsEdit) then begin
    dataSet.Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.dbeNotesExit(Sender: TObject);
var
  dataSet: TDataSet;
begin
  dataSet := (Sender as TDBEdit).DataSource.DataSet;
  if dataSet.State = dsEdit then
    dataSet.Post;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.qryAfterPost(DataSet: TDataSet);
begin
  (DataSet as TQuery).ApplyUpdates;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TFormHiOtp.dbgrOtklDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  A: ShortString;
begin
  with DbgrOtkl, Canvas.Font do begin
    if Column.Field.DataSet.FieldByName('Storn').AsString = 'Y' then
      Color := clRed
    else
      Color := clWindowText;
      
    DefaultDrawColumnCell(Rect, DataCol, Column, State)
  end;
end;

end.
