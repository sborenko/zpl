unit z_OtpSt2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Grids, DBGrids, ExtCtrls, DBTables, DB, Menus,
  StdCtrls, DBClient, Buttons;

type
  TFormStornOtp2 = class(TForm)
    qryOtkl: TQuery;
    qryOtklNR: TIntegerField;
    qryOtklKDSPS: TSmallintField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklZAMESGOD: TDateTimeField;
    qryOtklDTSTORN: TDateTimeField;
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
    dsrcOtkl: TDataSource;
    qryStorn: TQuery;
    qryStornNR: TIntegerField;
    qryStornKDSPS: TSmallintField;
    qryStornDTPROC: TDateTimeField;
    qryStornZAMESGOD: TDateTimeField;
    qryStornDTSTORN: TDateTimeField;
    qryStornTABN: TIntegerField;
    qryStornVIDN: TStringField;
    qryStornShVidN: TStringField;
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
    qryStornSVDTBEG: TDateTimeField;
    qryStornSVDTEND: TDateTimeField;
    dsrcStorn: TDataSource;
    updStorn: TUpdateSQL;
    popOtkl: TPopupMenu;
    popOtklStornPart: TMenuItem;
    popOtklDelStorn: TMenuItem;
    qryTmp: TQuery;
    cdsF8: TClientDataSet;
    cdsF8NR: TAutoIncField;
    cdsF8ZaMesGod: TDateField;
    cdsF8SvDtBeg: TDateField;
    cdsF8StornDtBeg: TDateField;
    cdsF8SvDtEnd: TDateField;
    cdsF8StornDtEnd: TDateField;
    cdsF8StornFull: TBooleanField;
    dsrcF8: TDataSource;
    qryTmpOtp: TQuery;
    cdsF8Spec_NR: TIntegerField;
    PanelLeft: TPanel;
    dbgrOtkl: TDBGrid;
    Splitter2: TSplitter;
    dbgrStorn: TDBGrid;
    LbxStornRec: TListBox;
    PanelMsg: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LbxSpecNR: TListBox;
    bBtnCancel: TBitBtn;
    sBtnSaveStorn: TSpeedButton;
    LbxDtStorn: TListBox;
    Label4: TLabel;
    Label3: TLabel;
    cdsF8VidN: TStringField;
    cdsDelStorn: TClientDataSet;
    AutoIncField1: TAutoIncField;
    DateField1: TDateField;
    DateField3: TDateField;
    DateField5: TDateField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    cdsDelStornStornSm: TFloatField;
    dsrcDelStorn: TDataSource;
    dbgrDelStorn: TDBGrid;
    cdsDelStornNotes: TStringField;
    cdsDelStornPrichina: TStringField;
    qrySvStorn: TQuery;
    procedure popOtklStornPartClick(Sender: TObject);
    procedure dbgrOtklDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryOtklCalcFields(DataSet: TDataSet);
    procedure dbgrStornDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryOtklAfterScroll(DataSet: TDataSet);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure qryStornCalcFields(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popOtklDelStornClick(Sender: TObject);
    procedure popOtklPopup(Sender: TObject);
    procedure sBtnSaveStornClick(Sender: TObject);
  private
    { Private declarations }
    n_TabN : integer;
    d_DtPrc, dDtPrcBeg, dDtPrcEnd : TDateTime;
    bAddStornAuto : boolean;
    procedure OpenQryOtkl(nTabN : integer; dDtPrc : TDateTime);
    procedure OpenQryStorn(nTabN : integer; dDtPrc : TDateTime);
    procedure SetDbgrOtklColumns;
    procedure SetDbgrStornColumns;
    procedure PrepareQrySvStorn;
    procedure SvSetStorn;
    procedure SvDelStorn;
  public
    { Public declarations }
  end;

function StornOtp2(nTabN : integer; dDtPrc : TDateTime) : boolean;

const SECTION = 'z_OtpSt2';

var
  FormStornOtp2: TFormStornOtp2;

implementation

uses A_Const, A_DM, A_Lib, Z_DM, Z_Main, z_GtQUpi, z_TVids, Z_TObj, z_TUpi,
     Z_GtPers, A_SBU, A_ShwErr, Z_ShNuMG, {Z_CmnPrt, Z_Calend, z_BlnPrd,}
     z_EOtpP;

{$R *.dfm}

//------------------------------------------------------------------------------
function StornOtp2(nTabN : integer; dDtPrc : TDateTime) : boolean;
var nY, nM, nD : word; i : SmallInt;
begin
  Result := false;
  FormStornOtp2 := TFormStornOtp2.Create(Application);
  with FormStornOtp2 do begin
    DecodeDate(dDtPrc, nY, nM, nD);
    Inc(nM, -1);
    if nM <= 0 then begin
      nY := nY - 1;
      nM := 12;
    end;
    dDtPrcEnd := EnCodeDate(nY, nM, 1);
    for i := 0 to 8 do begin
      Inc(nM, -1);
      if nM <= 0 then begin
        nY := nY - 1;
        nM := 12;
      end;
    end;
    dDtPrcBeg := EncodeDate(nY, nM, 1);
    Caption := 'Сторнирование отпускных (с ' +
                                        Copy(DateToStr(dDtPrcBeg), 4, 7) +
                               ' по ' + Copy(DateToStr(dDtPrcEnd), 4, 7) + ')';
    n_TabN := nTabN;
    d_DtPrc := dDtPrc;
    OpenQryOtkl(nTabN, dDtPrc);
    if qryOtkl.RecordCount = 0 then
      ShowMessage('Не найдены отпускные, начислявшиеся в месяцах с ' +
                         Copy(DateToStr(dDtPrcBeg), 4, 7) +
                                ' по ' + Copy(DateToStr(dDtPrcEnd), 4, 7))
    else begin
      PrepareQrySvStorn;
      OpenQryStorn(nTabN, dDtPrc);
      if ShowModal = mrOk then begin

        Result := true;
      end;
    end;
    Free;
  end;
end;


//------------------------------------------------------------------------------
procedure TFormStornOtp2.PrepareQrySvStorn;
begin
  with qrySvStorn do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Storn (TabN, Spec_NR, VidN, Prichina, DtProc, ' +
            ' DtStorn, ZaMesGod, DtBeg, DtEnd, ChStorn, SmStorn, Notes) ' +
            ' values (:TabN, :Spec_NR, :VidN, :Prichina, :DtProc, :DtStorn, ' +
            ' :ZaMesGod, :DtBeg, :DtEnd, :ChStorn, :SmStorn, :Notes) ');
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'SvStorn.txt');

  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.SvSetStorn;
begin                             // ЗАПИСЬ О СТОРНИРОВАНИЯХ
  with qryStorn do begin
    First;
    while not Eof do begin
      qrySvStorn.ParamByName('TabN').AsInteger      := n_TabN;
      qrySvStorn.ParamByName('Spec_NR').AsInteger   :=
                                             qryStornSpec_NR.AsInteger;
      qrySvStorn.ParamByName('VidN').AsString       :=
                                             qryStornVidN.AsString;
      qrySvStorn.ParamByName('Prichina').AsString   := 'Set_Storn';
      qrySvStorn.ParamByName('DtProc').AsDateTime   := d_DtPrc;
      qrySvStorn.ParamByName('DtStorn').AsDateTime  :=
                                             qryStornDtStorn.AsDateTime;
      qrySvStorn.ParamByName('ZaMesGod').AsDateTime :=
                                             qryStornZaMesGod.AsDateTime;
      qrySvStorn.ParamByName('DtBeg').AsDateTime    :=
                                            qryStornDt_Beg.AsDateTime;
      qrySvStorn.ParamByName('DtEnd').AsDateTime    :=
                                    qryStornDt_End.AsDateTime;
      qrySvStorn.ParamByName('ChStorn').AsFloat     :=
                                                 qryStornChas.AsFloat;
      qrySvStorn.ParamByName('SmStorn').AsFloat     :=
                                         qryStornSumma.AsFloat;
      qrySvStorn.ParamByName('Notes').AsString      := qryStornNotes.AsString;
      qrySvStorn.ExecSQL;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.SvDelStorn;
begin                             // ЗАПИСЬ ОБ УДАЛЕНИИ СТОРНИРОВАНИЙ
  with cdsDelStorn do begin
    First;
    while not Eof do begin
      qrySvStorn.ParamByName('TabN').AsInteger      := n_TabN;
      qrySvStorn.ParamByName('Spec_NR').AsInteger   :=
                             cdsDelStorn.FieldByName('Spec_NR').AsInteger;
      qrySvStorn.ParamByName('VidN').AsString       :=
                                  cdsDelStorn.FieldByName('VidN').AsString;
      qrySvStorn.ParamByName('Prichina').AsString   := 'Del_Storn';
      qrySvStorn.ParamByName('DtProc').AsDateTime   := d_DtPrc;
      qrySvStorn.ParamByName('ZaMesGod').AsDateTime :=
                                cdsDelStorn.FieldByName('ZaMesGod').AsDateTime;
      qrySvStorn.ParamByName('DtStorn').AsDateTime  :=
                             cdsDelStorn.FieldByName('StornDtBeg').AsDateTime;
      qrySvStorn.ParamByName('DtBeg').AsDateTime  :=
                            cdsDelStorn.FieldByName('StornDtBeg').AsDateTime;
      qrySvStorn.ParamByName('DtEnd').AsDateTime    :=
                             cdsDelStorn.FieldByName('StornDtEnd').AsDateTime;
      qrySvStorn.ParamByName('ChStorn').AsFloat     := 0;

      qrySvStorn.ParamByName('SmStorn').AsFloat     :=
                                 cdsDelStorn.FieldByName('StornSm').AsFloat;
      qrySvStorn.ParamByName('Notes').AsString      :=
                                 cdsDelStorn.FieldByName('Notes').AsString;
      qrySvStorn.ExecSQL;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 580);
    dbgrOtkl.Height := ReadInteger(SECTION, 'OtklH', 230);
    Free;
  end;
  LbxStornRec.Visible := bFlagDbg;
  LbxDtStorn.Visible := bFlagDbg;
  dbgrDelStorn.Visible := bFlagDbg;
  LbxSpecNR.Visible := bFlagDbg;
  if FileExists(cDirVids + 'StOtp2_1.vid') then
    dbgrOtkl.Columns.LoadFromFile(cDirVids + 'StOtp2_1.vid');
  if FileExists(cDirVids + 'StOtp2_2.vid') then
    dbgrStorn.Columns.LoadFromFile(cDirVids + 'StOtp2_2.vid');
  SetDbgrOtklColumns;
  SetDbgrStornColumns;
  with cdsDelStorn do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  if FileExists(cDirVids + 'DelStorn.vid') then
    dbgrDelStorn.Columns.LoadFromFile(cDirVids + 'DelStorn.vid');
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryOtkl.Active then
    dbgrOtkl.Columns.SaveToFile(cDirVids + 'StOtp2_1.vid');
  if qryStorn.Active then
    dbgrStorn.Columns.SaveToFile(cDirVids + 'StOtp2_2.vid');

  dbgrDelStorn.Columns.SaveToFile(cDirVids + 'DelStorn.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'OtklH', dbgrOtkl.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.OpenQryOtkl(nTabN: integer; dDtPrc: TDateTime);

begin
  LbxSpecNR.Clear;
  with qryOtkl do begin
    // выбрать отклонения с отпускными за последние 10 месяцев
    // без текущего (текущий можно исправить через z_EOtp)
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Otkl where TabN = :nTabN and ' +
            ' (VidN in ("2404","2405","2409","2410")) and ' +
            ' (DtProc >= :dDtPrcBeg) and (DtProc <= :dDtPrcEnd) and ' +
               ' (not Spec_NR is NULL) and /* (PrPv <> 7) and  */' +
               ' (Storn is NULL or not Storn = "Y")');
    SQL.Add(' order by DtProc, ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrcBeg').AsDateTime := dDtPrcBeg;
    ParamByName('dDtPrcEnd').AsDateTime := dDtPrcEnd;
    Open;
    while not Eof do begin
      if LbxSpecNR.Items.IndexOf(FieldByName('Spec_NR').AsString) < 0 then
        LbxSpecNR.Items.Add(FieldByName('Spec_NR').AsString);
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.OpenQryStorn(nTabN : integer; dDtPrc : TDateTime);
var cInMsg : ShortString; i : SmallInt;
    mMyBookMark : TBookMark;
begin
  cInMsg := '';
  for i := 0 to LbxSpecNR.Items.Count-1 do begin
    cInMsg := cInMsg + LbxSpecNR.Items[i];
    if i < LbxSpecNR.Items.Count-1 then
      cInMsg := cInMsg + ',';
  end;
  cInMsg := '(' + cInMsg + ')';
  with qryStorn do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select o.Dt_Beg as SvDtBeg, ' +
            ' o.Dt_End as SvDtEnd, o.* ' +
            ' from Z_Otkl o where o.TabN = :nTabN and ' +
            ' (o.DtProc <= :dDtPrc) and ' +
            ' (o.Spec_NR in ' + cInMsg + ') and (o.Storn = "Y")');
    SQL.Add(' order by ZaMesGod');
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'Storn.sql');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    with cdsF8 do begin
      if Active then Close;
      CreateDataSet;
      Open;
    end;
    while not Eof do begin
      cdsF8.Append;
      cdsF8.FieldByName('ZaMesGod').AsString := qryStornZaMesGod.AsString;
      cdsF8.FieldByName('Spec_NR').AsString := qryStornSpec_NR.AsString;
      cdsF8.FieldByName('ViDN').AsString := qryStornVidN.AsString;
      mMyBookMark := GetBookMark;  // по qryStorn;
      if qryOtkl.Locate('ZaMesGod', qryStornZaMesGod.AsDateTime, []) then begin
        cdsF8.FieldByName('SvDtBeg').AsString := qryOtklDt_Beg.AsString;
        cdsF8.FieldByName('SvDtEnd').AsString := qryOtklDt_End.AsString;
      end;
      GoToBookMark(mMyBookMark);
      FreeBookMark(mMyBookMark);
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
      LbxStornRec.Items.Add(qryStornSpec_NR.AsString + '_заМГ_' +
                                    qryStornZaMesGod.AsString + '_' +
                                               qryStornVidN.AsString);
      LbxDtStorn.Items.Add(qryStornZaMesGod.AsString);
//      LbxDtStorn.Items.Add(qryStornDtStorn.AsString);
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.popOtklPopup(Sender: TObject);
var i : SmallInt;
begin
  i := LbxStornRec.Items.IndexOf(qryOtklSpec_NR.AsString + '_заМГ_' +
                                       qryOtklZaMesGod.AsString+ '_' +
                                                     qryOtklVidN.AsString);
  popOtklStornPart.Enabled := (i < 0) and
             (not qryOtklSpec_NR.IsNull) and (qryOtklPrPv.AsInteger <> 7 );

  popOtklDelStorn.Enabled := (i >= 0) and (not qryOtklSpec_NR.IsNull) and
         (qryOtklPrPv.AsInteger <> 7 ) and
                                  (qryStornDtStorn.AsDateTime <= d_DtPrc);
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.popOtklStornPartClick(Sender: TObject);
var dRMes, dZaMG, dSvDtBeg, dSvDtEnd : TDateTime;
    nCurOklTrf, nSmSrDn, nSmOtp : double;
    cRK, cVidN : ShortString; nCntDays : SmallInt;
    nSpecNR : integer;
begin
  // Для корректной дальнейшей работы нужны данные из Z_Otkl и Z_VOtp
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
  // { SB Commented Должен быть месяц сторнирования ???
  dRMes := qryOtklDtProc.AsDateTime;
  // }
  // dRMes := d_DtPrc;
  dZaMG := qryOtklZaMesGod.AsDateTime;
  cVidN := qryOtklVidN.AsString;
  nSpecNR := qryOtklSpec_NR.AsInteger;
  dSvDtBeg := qryOtklDt_Beg.AsDateTime;
  dSvDtEnd := qryOtklDt_End.AsDateTime;
  if qryStorn.Locate('Spec_NR;ZaMesGod;VidN',
             VarArrayOf([nSpecNR,dZaMG,cVidN]), []) then with qryStorn do begin
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
    qryStornDtStorn.AsDateTime := d_DtPrc; // д.б. DtProc расчетн. месяца
    qryStornZaMesGod.AsDateTime := dZaMG;
    qryStornTabN.AsString := qryOtklTabN.AsString;
    qryStornVidN.AsString := cVidN;     // у записи СТОРНО вид остается тот же
    qryStornChas.AsFloat := -qryOtklChas.AsFloat;   // часы и сумма
    qryStornSumma.AsFloat := -qryOtklSumma.AsFloat; // отрицательные
    qryStornStorn.AsString := 'Y';                  // м в поле STORN "Y"
    qryStornKdObj.AsString := qryOtklKdObj.AsString;
    qryStornKdKatP.AsString := qryOtklKdKatP.AsString;
    qryStornDt_Beg.AsString := qryOtklDt_Beg.AsString;
    qryStornSvDtBeg.AsString := qryOtklDt_Beg.AsString;
    qryStornDt_End.AsString := qryOtklDt_End.AsString;
    qryStornSvDtEnd.AsString := qryOtklDt_End.AsString;
    qryStornPdn.AsString := qryOtklPdn.AsString;
    qryStornKdSpZ.AsString := qryOtklKdSpZ.AsString;
    qryStornNotes.AsString := 'Сторн2';
    qryStornSpec_NR.AsString := qryOtklSpec_NR.AsString;
    qryStornMyNotes.AsString := 'Storn2';
    if AddStornPart(qryStorn, dZaMG, dSvDtBeg, dSvDtEnd, nCurOklTrf,
                           nSmSrDn, nSmOtp, cRK, nCntDays) {z_EOtpP} then begin
      Post;
      LbxStornRec.Items.Add(qryOtklSpec_NR.AsString + '_заМГ_' +
                                   qryOtklZaMesGod.AsString + '_' +
                                                      qryOtklVidN.AsString);
      LbxDtStorn.Items.Add(qryStornZaMesGod.AsString);
      with cdsDelStorn do begin
        Append;
        FieldByName('ZaMesGod').AsString   := qryOtklZaMesGod.AsString;
        FieldByName('StornDtBeg').AsString := qryOtklDt_Beg.AsString;
        FieldByName('StornDtEnd').AsString := qryOtklDt_End.AsString;
        FieldByName('StornSm').AsString := qryOtklSumma.AsString;
        FieldByName('VidN').AsString := qryOtklVidN.AsString;
        FieldByName('Prichina').AsString := 'AddStorn';
        FieldByName('Spec_NR').AsString := qryOtklSpec_NR.AsString;
        FieldByName('Notes').AsString := qryOtklSpec_NR.AsString + '_заМГ_' +
                                   qryOtklZaMesGod.AsString + '_' +
                                                 qryOtklVidN.AsString;
        Post;
      end;
//      LbxDtStorn.Items.Add(qryStornDtStorn.AsString);


      cdsF8.Append; // Добавляется полная копия записи qryOtkl
      cdsF8.FieldByName('ZaMesGod').AsString   := qryStornZaMesGod.AsString;
      cdsF8.FieldByName('Spec_NR').AsInteger   := qryOtklSpec_NR.AsInteger;
      cdsF8.FieldByName('VidN').AsString       := qryOtklVidN.AsString;
      cdsF8.FieldByName('SvDtBeg').AsString    := qryOtklDt_Beg.AsString;
      cdsF8.FieldByName('SvDtEnd').AsString    := qryOtklDt_End.AsString;
      cdsF8.FieldByName('StornDtBeg').AsString := qryOtklDt_Beg.AsString;
      cdsF8.FieldByName('StornDtEnd').AsString := qryOtklDt_End.AsString;
      cdsF8.FieldByName('StornFull').AsString  := 'F';
      cdsF8.Post;
      dbgrOtkl.Refresh; end
    else
      Cancel;
    bAddStornAuto := false;
  end;
  sBtnSaveStorn.Enabled := qryStorn.UpdatesPending;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.popOtklDelStornClick(Sender: TObject);
var dZaMG : TDateTime; i : SmallInt; nSpecNR : integer;
    cVidN : ShortString;
begin
  dZaMG := qryOtklZaMesGod.AsDateTime;
  nSpecNR := qryOtklSpec_NR.AsInteger;
  cVidN := qryOtklVidN.AsString;
  if qryStorn.Locate('Spec_NR;ZaMesGod;VidN',
                          VarArrayOf([nSpecNR, dZaMG, cVidN]), []) then begin
    qryStorn.Delete;
    if cdsF8.Locate('Spec_NR;ZaMesGod;VidN',
                                VarArrayOf([nSpecNR, dZaMG, cVidN]), []) then
      cdsF8.Delete;
    i := LbxStornRec.Items.IndexOf(qryOtklSpec_NR.AsString + '_заМГ_' +
                                   qryOtklZaMesGod.AsString + '_' +
                                               qryOtklVidN.AsString);
    if i >= 0 then begin
      if not cdsDelStorn.Locate('Notes', qryOtklSpec_NR.AsString + '_заМГ_' +
                                   qryOtklZaMesGod.AsString + '_' +
                                      qryOtklVidN.AsString, []) then
                                                 with cdsDelStorn do begin
        // Дописать, как удалённую запись
        Append;
        FieldByName('Spec_NR').AsString := qryOtklSpec_NR.AsString;
        FieldByName('Prichina').AsString := 'DelStorn';
        FieldByName('Notes').AsString := qryOtklSpec_NR.AsString + '_заМГ_' +
                                   qryOtklZaMesGod.AsString + '_' +
                                                   qryOtklVidN.AsString;
        Post;
      end;

      LbxStornRec.Items.Delete(i);
      LbxDtStorn.Items.Delete(i);


    end;
    dbgrOtkl.Refresh;
    dbgrStorn.Refresh;
  end;
  sBtnSaveStorn.Enabled := qryStorn.UpdatesPending;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.qryOtklCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  qryOtklShVidN.AsString := DmMain.VidN2ShVidN(qryOtklVidN.AsString, cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.qryStornCalcFields(DataSet: TDataSet);
var cNmVidN : string;
begin
  qryStornShVidN.AsString := DmMain.VidN2ShVidN(qryStornVidN.AsString, cNmVidN);
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.dbgrOtklDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var i : Smallint; cVidN : string4; cFldNm : ShortString;
begin
  with dbgrOtkl.Canvas do begin
    cVidN := qryOtkl.FieldByName('VidN').AsString;
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      i := LbxStornRec.Items.IndexOf(qryOtklSpec_NR.AsString + '_заМГ_' +
                                            qryOtklZaMesGod.AsString + '_' +
                                                   qryOtklVidN.AsString);
      if i >= 0 then begin
        // tytyt
//        if StrToDate(LbxDtStorn.Items[i]) = d_DtPrc then begin
          Font.Color := clMaroon;
          Font.Style := [fsBold];   // end
//        else
//          Font.Color := clBlue;
      end;
      if (UpperCase(Column.FieldName) = 'VIDN') and
             ((qryOtkl.FieldByName('Spec_NR').IsNull) or
               (qryOtkl.FieldByName('PrPV').AsInteger = 7)) then
                                          {введены не по правилам}
        Brush.Color := clLime;
    end;
  end;
  dbgrOtkl.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.dbgrStornDrawColumnCell(Sender: TObject;
                           const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cUpper : ShortString;
begin
  with dbgrStorn.Canvas do begin
    cUpper := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if (qryStornSpec_NR.AsInteger = qryOtklSpec_NR.AsInteger) and
          (qryStornZaMesGod.AsDateTime = qryOtklZaMesGod.AsDateTime) then
        Font.Color := clRed;
      if (cUpper = 'DTSTORN') or (cUpper = 'DT_BEG') or (cUpper = 'DT_END') then
        Font.Style := [fsBold];
    end;
  end;
  dbgrStorn.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.qryOtklAfterScroll(DataSet: TDataSet);
begin
  if qryStorn.Active then begin
    if not qryStorn.Locate('Spec_NR;ZaMesGod',
          VarArrayOf([qryOtklSpec_NR.AsInteger, qryOtklZaMesGod.AsDateTime]),
                                                                       []) then
      dbgrStorn.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.FormResize(Sender: TObject);
begin
  PanelMsg.Top := Round((Height - PanelMsg.Height) / 2) - 40;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.sBtnSaveStornClick(Sender: TObject);
begin
  if qryStorn.UpdatesPending then begin
    if qryStorn.RecordCount > 0 then begin
      //ShowMessage('Records in qryStorn: ' + IntToStr(qryStorn.RecordCount));
      SvSetStorn;
    end;
    if cdsDelStorn.RecordCount > 0 then begin
      //ShowMessage('Records in cdsDelStorn: ' + IntToStr(cdsDelStorn.RecordCount));
      SvDelStorn;
    end;
    Form_Dm.DbMain.ApplyUpdates([qryStorn]);
    qryStorn.Close;
    qryStorn.Open;
    DmMain.qryOtkl.Close;
    DmMain.qryOtkl.Open;
    //ShowMessage('Изменения записаны в Базу Данных');
    end
  else
    ShowMessage('Нет изменений, которые нужно записать в Базу Данных');
  sBtnSaveStorn.Enabled := qryStorn.UpdatesPending;
end;
//------------------------------------------------------------------------------
procedure TFormStornOtp2.SetDbgrOtklColumns;
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
procedure TFormStornOtp2.SetDbgrStornColumns;
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

end.
