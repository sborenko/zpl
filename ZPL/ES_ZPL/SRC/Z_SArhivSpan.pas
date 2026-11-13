unit z_SArhivSpan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, DB, StdCtrls, Mask, DBCtrls, DBClient,
  Math, ComCtrls, DBTables, Grids, DBGrids, ExtCtrls, Menus;

type
  TArchMode = set of (ArcDtProc, ArcMnthYear);
  TNichMode = (NoNich, NichOnly, NichBoth);

  TArchListMode = (almEmployee, almInvList);

  TFrmArhivSpan = class(TForm)
    CdsShap: TClientDataSet;
    CdsShapDtBeg: TDateField;
    CdsShapDtEnd: TDateField;
    CdsShapTabN: TIntegerField;
    CdsShapDtDoc: TDateField;
    CdsShapFam: TStringField;
    CdsShapFamIO: TStringField;
    CdsShapTIN: TStringField;
    DsrcShap: TDataSource;
    QryArh: TQuery;
    CdsShapZaGod: TSmallintField;
    CdsShapArhDtEnd: TDateField;
    DsrcArh: TDataSource;
    QryArhDTPROC: TDateTimeField;
    QryArhZAMESGOD: TDateTimeField;
    QryArhVIDN: TStringField;
    QryArhSHVIDN: TStringField;
    QryArhNMVIDN: TStringField;
    QryArhCHASU: TFloatField;
    QryArhCNTREC: TIntegerField;
    QryTmp: TQuery;
    CdsArh: TClientDataSet;
    QryArhSUMMA: TBCDField;
    CdsUni: TClientDataSet;
    popVar: TPopupMenu;
    PopArcDtProc: TMenuItem;
    PopArcMnthYear: TMenuItem;
    PopArcBoth: TMenuItem;
    Sep: TMenuItem;
    N1: TMenuItem;
    PanelSpan: TPanel;
    LblSpanBeg: TLabel;
    LbSpanEnd: TLabel;
    DbeSpanBeg: TDBEdit;
    DbeSpanEnd: TDBEdit;
    PanelEmployee: TPanel;
    Label9: TLabel;
    BtnTabN: TSpeedButton;
    LabelFio0: TLabel;
    Label11: TLabel;
    BtnFindFam: TSpeedButton;
    Label12: TLabel;
    BtnFindTin: TSpeedButton;
    dbeTabN: TDBEdit;
    dbeFam: TDBEdit;
    dbeTin: TDBEdit;
    PanelInvList: TPanel;
    LblSelPath: TLabel;
    DbgrInvList: TDBGrid;
    EdtSelPath: TEdit;
    BtnSelPath: TBitBtn;
    PanelParams: TPanel;
    Label13: TLabel;
    DtPickDtIssue: TDateTimePicker;
    GroupBoxScope: TGroupBox;
    RBtnNoNich: TRadioButton;
    RBtnNichOnly: TRadioButton;
    RBtnNichBoth: TRadioButton;
    PanelButtons: TPanel;
    BtnPrintNew: TSpeedButton;
    BtnExit: TBitBtn;
    QryInvList: TQuery;
    QryInvListTabN: TIntegerField;
    QryInvListFam: TStringField;
    QryInvListIma: TStringField;
    QryInvListOtch: TStringField;
    QryInvListDtBeg: TDateTimeField;
    QryInvListDtEnd: TDateTimeField;
    DsrcInvList: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeTabNExit(Sender: TObject);
    procedure dtPicEnter(Sender: TObject);
    procedure dtPicExit(Sender: TObject);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure BtnPrtOneColClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnPrintOldClick(Sender: TObject);
    procedure CdsShapTabNSetText(Sender: TField; const Text: String);
    procedure BtnFindFamClick(Sender: TObject);
    procedure BtnTabNClick(Sender: TObject);
    procedure BtnFindTinClick(Sender: TObject);
    procedure QryArhCHASUGetText(Sender: TField; var Text: String;
                                                      DisplayText: Boolean);
    procedure BtnPrtThreeColsClick(Sender: TObject);
    procedure BtnPrintNewClick(Sender: TObject);
    procedure PopArchClick(Sender: TObject);
    procedure BtnCompareArchivesClick(Sender: TObject);
    procedure CdsShapDtGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CdsShapDtSetText(Sender: TField; const Text: String);
    procedure CdsShapDtBegChange(Sender: TField);
    procedure CdsShapDtEndChange(Sender: TField);
    procedure CdsShapDtValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure BtnSelPathClick(Sender: TObject);
    procedure popVarPopup(Sender: TObject);

  private
    ListMode: TArchListMode;
    EmplId: Integer;

    constructor Create(ListMode: TArchListMode; EmplId: Integer); reintroduce;

    procedure CreOpenCdsShap(RptDtBeg, RptDtEnd: TDateTime);

    function FindTabN(TabN: Integer; out Fam, FamIO, TIN: ShortString): Boolean;

    function FindTIN(var cTIN : string; var nTabN : integer;
                                         var cFam, cFamIO : string) : boolean;
    function FindFam(var cFam : string; var nTabN : integer;
                                         var cTin, cFamIO : string) : boolean;
    procedure AddRecords(nKvRec, nMRec, nKv, nM, nY : SmallInt);

    procedure CreOpenCdsUni(TabN: Integer; ArchMode: TArchMode);
    procedure SelectPmnts(Query: TQuery; TabN: Integer; DtBeg, DtEnd: TDateTime;
      DateFldName: ShortString; NichMode: TNichMode
    );
    procedure SelectNonPayed(Query: TQuery; TabN: Integer;
      DtBeg, DtEnd: TDateTime; DateFldName: ShortString; NichMode: TNichMode
    );
    procedure LoadPmnts(Query: TQuery; DateFldName, SumFldName: ShortString);
    procedure AddRecToCdsUni2(VidN, ShVidN, NmVidN: ShortString;
      Sum: Double; Mnth: TDateTime; NSovm, VSovm, SumFldName: ShortString
    );

    procedure PrintEmployee(DsEmployee: TDataSet; Sender: TObject;
      WriteToFile: Boolean = false);
  public
    class procedure Run(ListMode: TArchListMode; EmplId: Integer);
  end;

implementation

uses
  a_Const, a_DM, a_Lib, DateLib, LogLib, PathLib, QryLib, TextLib, SalaryLib,
  TimeProgress, z_CmnPrt, z_DM, z_GtQUpi, z_Main, z_ShVbFm, RptArchivka,
  FormEval;

const
  NON_PAYED_TYPES =
    '"5002", "5003", "5004", "5005", "5006", "5008", "5009", "5010", ' +
    '"5011", "5012"';

  TOTALS_SIZE = 23;

var
  SECTION: ShortString;

type
  TArchTotals = array [0..TOTALS_SIZE] of Double;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFrmArhivSpan.Run(ListMode: TArchListMode; EmplId: Integer);
var
  Form: TFrmArhivSpan;
begin
  Form := TFrmArhivSpan.Create(ListMode, EmplId);

  with Form do begin
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
constructor TFrmArhivSpan.Create(
  ListMode: TArchListMode;
  EmplId: Integer
);
begin
  inherited Create(nil);

  Self.ListMode := ListMode;
  Self.EmplId := EmplId;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.FormCreate(Sender: TObject);
var
  RptDtBeg, RptDtEnd: TDateTime;
  CaseNICH: Word;
begin
  Caption := 'Задание на печать "архивки"';

  LabelFio0.Caption := '';

  SECTION := 'z_SArhiv';
  
  if ListMode = almEmployee then
    BorderStyle := bsSingle
  else
    SECTION := SECTION + 'InvList';

  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', Left);
    Top  := ReadInteger(SECTION, 'wT', Top);

    if ListMode = almInvList then begin
      Width := ReadInteger(SECTION, 'Width', Width);
      Height  := ReadInteger(SECTION, 'Height', Height);

      EdtSelPath.Text := ReadString(SECTION, 'PathToArchs', 'c:\');
    end;

    RptDtEnd := ReadInteger(SECTION, 'nSvDtE', 0);
    if RptDtEnd = 0 then
      RptDtEnd := DateUtils.ThisMonth;

    RptDtBeg := ReadInteger(SECTION, 'nSvDtB', 0);
    if RptDtBeg = 0 then
      RptDtBeg := DateUtils.BeginOfYear(RptDtEnd);

    CaseNICH := ReadInteger(SECTION, 'nCaseNICH', 3);

    Free;
  end;

  if (ListMode = almInvList) and FileExists(cDirVids + 'PrintArch.vid') then
    DbgrInvList.Columns.LoadFromFile(cDirVids  + 'PrintArch.vid');

  CreOpenCdsShap(RptDtBeg, RptDtEnd);

  DtPickDtIssue.Date := Date;

  if CaseNICH = 3 then
    RBtnNichBoth.Checked := true
  else if CaseNICH = 2 then
    RBtnNichOnly.Checked := true
  else
    rBtnNoNich.Checked := true;

  if ListMode = almInvList then
    SalaryUtils.SelectInvList(QryInvList,
      CdsShap.FieldByName('DtBeg').AsDateTime);
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.FormShow(Sender: TObject);
var
  FormHeight: Integer;
begin
  FormHeight := PanelSpan.Height;

  if ListMode = almEmployee then begin
    PanelInvList.Visible := false;
    FormHeight := FormHeight + PanelEmployee.Height;
  end else begin
    PanelEmployee.Visible := false;
    FormHeight := FormHeight + PanelInvList.Height;
  end;

  FormHeight := FormHeight + PanelParams.Height + PanelButtons.Height;

  // Подгоняем размер формы
  ClientHeight := FormHeight;

  // Упорядочиваем панели
  PanelSpan.Top := 0;
  if ListMode = almEmployee then
    PanelEmployee.Top := PanelSpan.Top + PanelSpan.Height
  else
    PanelInvList.Top := PanelSpan.Top + PanelSpan.Height;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.FormClose(Sender: TObject; var Action: TCloseAction);
var
  CaseNICH: Word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);

    if ListMode = almInvList then begin
      WriteInteger(SECTION, 'Width', Width);
      WriteInteger(SECTION, 'Height', Height);

      WriteString(SECTION, 'PathToArchs', EdtSelPath.Text);
    end;

    WriteInteger(SECTION, 'nSvDtB', Round(CdsShapDtBeg.AsDateTime));
    WriteInteger(SECTION, 'nSvDtE', Round(CdsShapDtEnd.AsDateTime));

    if RBtnNichBoth.Checked then
      CaseNICH := 3
    else if RBtnNichOnly.Checked then
      CaseNICH := 2
    else
      CaseNICH := 1;
    WriteInteger(SECTION, 'nCaseNICH', CaseNICH);

    Free;
  end;

  if (ListMode = almInvList) then
    DbgrInvList.Columns.SaveToFile(cDirVids  + 'PrintArch.vid');

  CdsShap.Cancel;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.CreOpenCdsShap(RptDtBeg, RptDtEnd: TDateTime);
var
  Fam, FamIO, TIN: ShortString;
  Date: TDate;
begin
  Date := DateUtils.Decode(RptDtEnd);

  with CdsShap do begin
    CreateDataSet;
    Open;

    Append;

    FieldByName('TabN').AsInteger := EmplId;
    FieldByName('ZaGod').AsInteger := Date.Year;
    FieldByName('DtBeg').AsDateTime := RptDtBeg;
    FieldByName('DtEnd').AsDateTime := RptDtEnd;

    if FindTabN(EmplId, Fam, FamIO, TIN) then begin
      FieldByName('Fam').AsString := Fam;
      FieldByName('FamIO').AsString := FamIO;
      FieldByName('TIN').AsString := TIN;
      LabelFio0.Caption := FamIO;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnTabNClick(Sender: TObject);
var nTabN : integer; cFam, cIma, cOtch, cFamIO, cTIN : string;
begin
  dbeFam.SetFocus;
  dbeTabN.SetFocus;
  Application.ProcessMessages;
  nTabN := cdsShap.FieldByName('TabN').AsInteger;
  if GetUpiTabN(nTabN, cFam, cIma, cOtch, cFamIO, cTIN) {z_GtQUpi} then begin
    cdsShap.FieldByName('TabN').AsInteger := nTabN;
    cdsShap.FieldByName('Fam').AsString := cFam;
    cdsShap.FieldByName('TIN').AsString := cTIN;
    LabelFio0.Caption := cFamIO;
  end;
end;

//------------------------------------------------------------------------------
function TFrmArhivSpan.FindTabN(
  TabN: Integer;
  out Fam, FamIO, TIN: ShortString
): Boolean;
begin
  Fam := '';
  FamIO := '';
  TIN := '';

  QryUtils.InitQuery(QryTmp);

  with QryTmp do begin
    SQL.Text :=
      'select * ' +
      'from Z_UPI ' +
      'where TabN = :TabN';

    ParamByName('TabN').AsInteger := TabN;
    Open;

    Result := RecordCount > 0;

    if Result then begin
      Fam := FieldByName('Fam').AsString;
      TIN := FieldByName('Id').AsString;

      FamIO := MyFamIO(
        FieldByName('Fam').AsString,
        FieldByName('Ima').AsString,
        FieldByName('Otch').AsString
      );
    end;
  end;

  QryUtils.ReleaseQuery(QryTmp);
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.CdsShapTabNSetText(Sender: TField; const Text: String);
var
  Fam, FamIO, TIN: ShortString;
begin
  if Text <> '' then begin
    CdsShapTabN.AsInteger := StrToInt(Text);

    if FindTabN(CdsShapTabN.AsInteger, Fam, FamIO, TIN) then begin
      CdsShapFam.AsString := Fam;
      CdsShapFamIO.AsString := FamIO;

      LabelFio0.Caption := FamIO;
      CdsShapTIN.AsString := TIN;
    end else
      raise Exception.Create(
        'В таблице "Сотрудники" нет табельного номера "' + Text + '"');
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.dbeTabNExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnFindTinClick(Sender: TObject);
var nTabN : integer; cTIN, cSvTIN, cFam, cFamIO : string;
begin
  cSvTIN := cdsShap.FieldByName('TIN').AsString; // до потери фокуса (старый)
  dbeFam.SetFocus;
  dbeTIN.SetFocus;
  cTin := cdsShap.FieldByName('TIN').AsString;
  if FindTin(cTin, nTabN, cFam, cFamIO) then begin
    LabelFio0.Caption := cFamIO;
    cdsShap.FieldByName('Fam').AsString := cFam;
    cdsShap.FieldByName('TIN').AsString := cTin;
    cdsShap.FieldByName('TabN').AsInteger := nTabN; end
  else begin
    cdsShap.FieldByName('TIN').AsString := cSvTin;
    ShowMessage('Заданный ТИН: ' + cTIN + ' не найден.');
  end;
end;
//------------------------------------------------------------------------------
function TFrmArhivSpan.FindTIN(var cTIN : string; var nTabN : integer;
                                         var cFam, cFamIO : string) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI where ID = :cTIN');
    ParamByName('cTIN').AsString := cTIN;
    Open;
    if RecordCount > 0 then begin
      cTIN   := FieldByName('ID').AsString;
      cFam   := FieldByName('Fam').AsString;
      nTabN  := FieldByName('TabN').AsInteger;
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                      FieldByName('Ima').AsString,
                                        FieldByName('Otch').AsString);
      Result := true
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnFindFamClick(Sender: TObject);
var nTabN : integer; cTIN, cSvFam, cFam, cFamIO : string;
begin
  cSvFam := cdsShap.FieldByName('Fam').AsString; // до потери фокуса (старый)
  dbeTIN.SetFocus;
  dbeFam.SetFocus;                               ///
  cFam := cdsShap.FieldByName('Fam').AsString;
  if FindFam(cFam, nTabN, cTin, cFamIO) then begin
    LabelFio0.Caption := cFamIO;
    cdsShap.FieldByName('Fam').AsString := cFam;
    cdsShap.FieldByName('TIN').AsString := cTin;
    cdsShap.FieldByName('TabN').AsInteger := nTabN; end
  else
    cdsShap.FieldByName('Fam').AsString := cSvFam;
end;
//------------------------------------------------------------------------------
function TFrmArhivSpan.FindFam(var cFam : string; var nTabN : integer;
                                         var cTIN, cFamIO : string) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI where upper(Fam) containing(:cFam)');
    ParamByName('cFam').AsString := AnsiUpperCase(cFam);
    Open;
    if RecordCount = 1 then begin
      cTIN   := FieldByName('ID').AsString;
      cFam   := FieldByName('Fam').AsString;
      nTabN  := FieldByName('TabN').AsInteger;
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                      FieldByName('Ima').AsString,
                                        FieldByName('Otch').AsString);
      Result := true end
    else if RecordCount > 1 then begin
      if Shw_FamsForUpi(qryTmp, nTabN) {Z_ShVbFm} then begin
        cTIN   := FieldByName('ID').AsString;
        cFam   := FieldByName('Fam').AsString;
        nTabN  := FieldByName('TabN').AsInteger;
        cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                 FieldByName('Ima').AsString,
                                        FieldByName('Otch').AsString);
        Result := true
      end; end
    else
      ShowMessage('Фамилия: ' + cFam + ' не найдена.');
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFrmArhivSpan.dtPicEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFrmArhivSpan.dtPicExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFrmArhivSpan.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFrmArhivSpan.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnBackClick(Sender: TObject);
begin
   Caption := 'Задание на печать справки в СПОВ';
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnPrintOldClick(Sender: TObject);
begin
  QryUtils.InitQuery(QryArh);

  with QryArh do begin
    SQL.Text :=
      'select DtProc, ZaMesGod, VidN, ShVidN, NmVidN, ' +
        'count(*) as CNTREC, Sum(Chas) as Chasu, ' +
        'Sum(Cast(Summa as numeric(18,2))) as Summa ' +
      'from ViNU_Main ' +
      'where TabN = :nTabN ' +
        'and DtProc >= :dDtBeg ' +
        'and DtProc <= :dDtEnd ' +
        'and VidN < "8000"';

    if RBtnNoNich.Checked then
      SQL.Add(
        'and not KdSps = 6')
    else if RBtnNichOnly.Checked then
      SQL.Add(
        'and KdSps = 6');

    SQL.Add(
      'group by DtProc, VidN, ShVidN, NmVidN, ZaMesGod ' +
      'having (Sum(Cast(Summa as numeric(18,2))) > 0.001) ' +
        'or (Sum(Cast(Summa as numeric(18,2))) < -0.001)'
    );

    ParamByName('nTabN').AsInteger := CdsShapTabN.AsInteger;
    ParamByName('dDtBeg').AsDateTime := CdsShapDtBeg.AsDateTime;
    ParamByName('dDtEnd').AsDateTime := CdsShapDtEnd.AsDateTime;
    Open;

    if RecordCount = 0 then begin
      ShowMessage('Не найдено данных для документа. Измените задание');
      Close;
      SQL.Clear;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnPrintNewClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + PanelButtons.Top + BtnPrintNew.Top + 54;
  Y := Left + PanelButtons.Left + BtnPrintNew.Left + 7;
  popVar.Popup(Y, X);
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.PopArchClick(Sender: TObject);
var
  Mark: TBookmark;
  FrmEval: TFrmEval;
  I: Integer;
begin
  Screen.Cursor := crHourGlass;

  if ListMode = almEmployee then
    PrintEmployee(CdsShap, Sender)
  else begin
    FrmEval := TFrmEval.Create('Печать...');
    FrmEval.SetStep('Печать...', QryInvList.RecordCount);
    FrmEval.Show;

    with QryInvList do begin
      DisableControls;

      Mark := GetBookmark;
      First;
      I := 0;

      while not Eof do begin
        PrintEmployee(QryInvList, Sender, true);
        Inc(I);

        Application.ProcessMessages;

        if FrmEval.ProgressProc(I) = esCancelled then
          break;

        Next;
      end;

      GotoBookmark(Mark);
      FreeBookmark(Mark);

      EnableControls;
    end;

//    FrmEval.Close;
  end;

  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.PrintEmployee(
  DsEmployee: TDataSet;
  Sender: TObject;
  WriteToFile: Boolean = false
);
var
  TabN: Integer;
  Fam, Ima, Otch: ShortString;

  Year, BegMnth, EndMnth: Word;
  NichMode: Word;
  Date: TDate;
begin
  TabN := DsEmployee.FieldByName('TabN').AsInteger;

  Date := DateUtils.Decode(CdsShapDtBeg.AsDateTime);
  BegMnth := Date.Mnth;
  Date := DateUtils.Decode(CdsShapDtEnd.AsDateTime);
  EndMnth := Date.Mnth;
  Year := Date.Year;

  if RBtnNichBoth.Checked then
    NichMode := 3
  else if RBtnNichOnly.Checked then
    NichMode := 2
  else
    NichMode := 1;

  if Sender = PopArcDtProc then begin
    if not WriteToFile then begin
      CreOpenCdsUni(TabN, [ArcDtProc]);
      PrtArhMnthSpan(TabN, 'DtPrc', Year, BegMnth, EndMnth, CdsUni, NichMode);
    end;

  end else if Sender = PopArcMnthYear then begin
    if not WriteToFile then begin
      CreOpenCdsUni(TabN, [ArcMnthYear]);
      PrtArhMnthSpan(TabN, 'ZaMG', Year, BegMnth, EndMnth, CdsUni, NichMode);
    end;

  end else if Sender = PopArcBoth then begin
    CreOpenCdsUni(TabN, [ArcDtProc, ArcMnthYear]);
    if WriteToFile then
      TRptArhivka.RunAndWrite(
        TabN, Year, BegMnth, EndMnth, false, CdsUni, NichMode, EdtSelPath.Text)
    else
      TRptArhivka.Run(TabN, Year, BegMnth, EndMnth, false, CdsUni, NichMode)

  end else begin
    CreOpenCdsUni(TabN, [ArcDtProc, ArcMnthYear]);
    if WriteToFile then
      TRptArhivka.RunAndWrite(
        TabN, Year, BegMnth, EndMnth, false, CdsUni, NichMode, EdtSelPath.Text)
    else
      TRptArhivka.Run(TabN, Year, BegMnth, EndMnth, true, CdsUni, NichMode);
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.QryArhCHASUGetText(Sender: TField; var Text: String;
                                                         DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsFloat = 0)) then
    Text := ''
  else
    Text := FloatToStr((Sender as TField).AsFloat);
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.AddRecords(nKvRec, nMRec, nKv, nM, nY : SmallInt);
var d_DtPrc : TDateTime;
begin
  if nMRec > 0 then
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    d_DtPrc := EncodeDate(nY, nM, 1);
    SQL.Add('Select DtProc, ZaMesGod, VidN, ShVidN, ' +
            ' Sum(Chas) as Chasu, ' +
            ' Sum(Cast(Summa as numeric(18,2))) as Summa ' +
            ' from vinu_main ' +
            ' where TabN = :nTabN and DtProc = :d_DtPrc and VidN < "8000" ');
    if RBtnNoNich.Checked then
      SQL.Add(' and not KdSps = 6 ')
    else if RBtnNichOnly.Checked then
      SQL.Add(' and KdSps = 6 ');
    SQL.Add(' group by DtProc, VidN, ShVidN, ZaMesGod ' +
            ' having (Sum(Cast(Summa as numeric(18,2))) > 0.001) or ' +
            ' (Sum(Cast(Summa as numeric(18,2))) < -0.001)');
    ParamByName('nTabN').AsInteger := CdsShapTabN.AsInteger;
    ParamByName('d_DtPrc').AsDateTime := d_DtPrc;
    Open;

    cdsArh.First;
    cdsArh.Locate('Kvart', nKv, []);
    while not Eof do begin
      if not cdsArh.Eof and (cdsArh.FieldByName('Kvart').AsInteger = nKv) then
        cdsArh.Edit
      else begin
        cdsArh.Append;
        cdsArh.FieldByName('Kvart').AsInteger := nKv;
      end;
      if ((nM = 1) or (nM = 4) or (nM = 7) or (nM = 10)) then begin
        cdsArh.FieldByName('dtProc1').AsString :=
                                        FieldByName('DtProc').AsString;
        cdsArh.FieldByName('dtZaMg1').AsString :=
                                        FieldByName('ZaMesGod').AsString;
        cdsArh.FieldByName('Vidn1').AsString :=
                                        FieldByName('VidN').AsString;
        cdsArh.FieldByName('ShVidn1').AsString :=
                                        FieldByName('ShVidN').AsString;
        cdsArh.FieldByName('Chasu1').AsString :=
                                        FieldByName('Chasu').AsString;
        cdsArh.FieldByName('Summa1').AsString :=
                                        FieldByName('Summa').AsString; end
      else if ((nM = 2) or (nM = 5) or (nM = 8) or (nM = 11)) then begin
        cdsArh.FieldByName('dtProc2').AsString :=
                                        FieldByName('DtProc').AsString;
        cdsArh.FieldByName('dtZaMg2').AsString :=
                                        FieldByName('ZaMesGod').AsString;
        cdsArh.FieldByName('Vidn2').AsString :=
                                        FieldByName('VidN').AsString;
        cdsArh.FieldByName('ShVidn2').AsString :=
                                        FieldByName('ShVidN').AsString;
        cdsArh.FieldByName('Chasu2').AsString :=
                                        FieldByName('Chasu').AsString;
        cdsArh.FieldByName('Summa2').AsString :=
                                        FieldByName('Summa').AsString; end
      else if ((nM = 3) or (nM = 6) or (nM = 9) or (nM = 12)) then begin
        cdsArh.FieldByName('dtProc3').AsString :=
                                        FieldByName('DtProc').AsString;
        cdsArh.FieldByName('dtZaMg3').AsString :=
                                        FieldByName('ZaMesGod').AsString;
        cdsArh.FieldByName('Vidn3').AsString :=
                                        FieldByName('VidN').AsString;
        cdsArh.FieldByName('ShVidn3').AsString :=
                                        FieldByName('ShVidN').AsString;
        cdsArh.FieldByName('Chasu3').AsString :=
                                        FieldByName('Chasu').AsString;
        cdsArh.FieldByName('Summa3').AsString :=
                                        FieldByName('Summa').AsString;
      end;
      cdsArh.Post;
      cdsArh.Next;
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.CreOpenCdsUni(
  TabN: Integer;
  ArchMode: TArchMode
);
var
  DtBeg, DtEnd: TDateTime;
  NichMode: TNichMode;
begin
  with CdsUni do begin
    if Active then
      EmptyDataSet
    else begin
      CreateDataSet;
      AddIndex('Primary', 'VidN', [ixPrimary]);
      IndexName := 'Primary';
      Open;
    end;
  end;

  // Начало года периода
  DtBeg := CdsShapDtBeg.AsDateTime;
  // Начало последнего месяца периода
  DtEnd := CdsShapDtEnd.AsDateTime;

  if RBtnNoNich.Checked then
    NichMode := NoNich
  else if RBtnNichOnly.Checked then
    NichMode := NichOnly
  else
    NichMode := NichBoth;

  if ArcDtProc in ArchMode then begin
    SelectPmnts(QryTmp, TabN, DtBeg, DtEnd, 'DtProc', NichMode);
    LoadPmnts(QryTmp, 'DtProc', 'Sm');

    SelectNonPayed(QryTmp, TabN, DtBeg, DtEnd, {'DtProc'}'ZaMesGod', NichMode);
    LoadPmnts(QryTmp, {'DtProc'}'ZaMesGod', 'Sm');
  end;

  if ArcMnthYear in ArchMode then begin
    SelectPmnts(QryTmp, TabN, DtBeg, DtEnd, 'ZaMesGod', NichMode);
    LoadPmnts(QryTmp, 'ZaMesGod', 'SmZa');

    SelectNonPayed(QryTmp, TabN, DtBeg, DtEnd, 'ZaMesGod', NichMode);
    LoadPmnts(QryTmp, 'ZaMesGod', 'SmZa');
  end;

  if bFlagDbg then
    CdsUni.SaveToFile(cDirTemp + 'CdsUni.cds');
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.SelectPmnts(
  Query: TQuery;
  TabN: Integer;
  DtBeg, DtEnd: TDateTime;
  DateFldName: ShortString;
  NichMode: TNichMode
);
begin
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select ' + DateFldName + ', VidN, ShVidN, NmVidN, ' +
        'Sum(Cast(Summa as Numeric(18,2))) Amount, ' +
        'case ' +
          'when not NuSovm is null and ' +
            '(NuSovm = "Y" or NuSovm = "1") then "Y" ' +
          'else null ' +
        'end NSovm, ' +
        'Sovm VSovm ' +
      'from ViNu_Main ' +
      'where TabN = :TabN ' +
        'and ' + DateFldName + ' between :DtBeg and :DtEnd ' +
        'and VidN < "8000" ' +
        'and not VidN in ("5005", "5008")'
    );

    case NichMode of
      NoNich:
        SQL.Add('and not KdSps = 6');
      NichOnly:
        SQL.Add('and KdSps = 6');
    end;

    SQL.Add('group by ' + DateFldName + ', VidN, ShVidN, NmVidN, NSovm, VSovm');

    ParamByName('TabN').AsInteger := TabN;
    ParamByName('DtBeg').AsDateTime := DtBeg;
    ParamByName('DtEnd').AsDateTime := DtEnd;
      
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.SelectNonPayed(
  Query: TQuery;
  TabN: Integer;
  DtBeg, DtEnd: TDateTime;
  DateFldName: ShortString;
  NichMode: TNichMode
);
begin
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select o.' + DateFldName + ', ' +
        'o.VidN, v.ShVidN, v.NmVidN, o.Sovm NSovm, v.Sovm VSovm, ' +
        'Sum(' +
          'case ' +
            'when o.Storn is null or o.Storn <> "Y" ' +
            'then o.Chas ' +
            'else -o.Chas ' +
          'end' +
        ') Amount ' +
      'from z_Otkl o ' +
        'left join z_KdVidN v on v.VidN = o.VidN ' +
      'where ' +
        'o.TabN = :TabN ' +
          'and o.VidN in (' + NON_PAYED_TYPES + ') ' +
          'and o.' + DateFldName + ' between :DtBeg and :DtEnd'
    );

    // Для выборки по дате обработки выбираем только несторнированные,
    // по дате "за месяц, год" - и сторнированные и несторнированные.
    if DateFldName = 'DtProc' then
      SQL.Add(
        'and (o.Storn is null or o.Storn <> "Y")'
      );

    if NichMode = NoNich then
      SQL.Add(
        'and o.KdSps <> 6'
      )
    else if NichMode = NichOnly then
      SQL.Add(
        'and o.KdSps = 6'
      );

    SQL.Add(
      'group by o.' + DateFldName + ', ' +
        'o.VidN, v.ShVidN, v.NmVidN, o.Sovm, v.Sovm'
    );

    ParamByName('TabN').AsInteger := TabN;
    ParamByName('DtBeg').AsDateTime := DtBeg;
    ParamByName('DtEnd').AsDateTime := DtEnd;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.LoadPmnts(
  Query: TQuery;
  DateFldName, SumFldName: ShortString
);
var
  Amount: Double;
begin
  with Query do begin
    First;

    while not Eof do begin
      Amount := FieldByName('Amount').AsFloat;

      if Amount <> 0 then
        AddRecToCdsUni2(
          FieldByName('VidN').AsString,
          FieldByName('ShVidN').AsString,
          FieldByName('NmVidN').AsString,
          Amount,
          FieldByName(DateFldName).AsDateTime,
          FieldByName('NSovm').AsString,
          FieldByName('VSovm').AsString,
          SumFldName
        );

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.AddRecToCdsUni2(
  VidN, ShVidN, NmVidN: ShortString;
  Sum: Double;
  Mnth: TDateTime;
  NSovm, VSovm, SumFldName: ShortString
);
var
  Date: TDate;
begin
  Date := DateUtils.Decode(Mnth);

  if Date.Mnth < 10 then
    SumFldName := SumFldName + '0';
  SumFldName := SumFldName + IntToStr(Date.Mnth);

  with CdsUni do begin
    if Trim(NSovm) = '' then
      // Если оставлять пробел, глючит Locate
      NSovm := 'N';

    // В строку вида начисления
    if not Locate('VidN;NSovm', VarArrayOf([VidN, NSovm]), []) then begin
      Append;
      FieldByName('VidN').AsString := VidN;
      FieldByName('ShVidN').AsString := ShVidN;
      FieldByName('NmVidN').AsString := NmVidN;
      FieldByName('NSovm').AsString := NSovm;
      FieldByName('VSovm').AsString := VSovm;
    end else
      Edit;

    FieldByName(SumFldName).AsFloat := FieldByName(SumFldName).AsFloat + Sum;
    Post;

    if (VidN < '6000') and (VidN <> '5005') and (VidN <> '5008') then begin
      // В строку "По видам начисления"
      if not Locate('VidN', '6000', []) then begin
        Append;
        FieldByName('VidN').AsString := '6000';
        FieldByName('ShVidN').AsString := 'Всього нарахувань';
        FieldByName('NmVidN').AsString := 'По видах нарахувань';
      end else
        Edit;

      FieldByName(SumFldName).AsFloat := FieldByName(SumFldName).AsFloat + Sum;
      Post;
    end else if (VidN > '6000') and (VidN < '8000') then begin
      // В строку "По видам удержанияния"
      if not Locate('VidN', '8000', []) then begin
        Append;
        FieldByName('VidN').AsString := '8000';
        FieldByName('ShVidN').AsString := 'Всього утримань';
        FieldByName('NmVidN').AsString := 'По видах утримань';
      end else
        Edit;

      FieldByName(SumFldName).AsFloat := FieldByName(SumFldName).AsFloat + Sum;
      Post;
    end;

    if (VidN < '8000') and (VidN <> '5005') and (VidN <> '5008') then begin
      // В строку "Остаток на руки"
      if not Locate('VidN', '9999', []) then begin
        Append;
        FieldByName('VidN').AsString := '9999';
        FieldByName('ShVidN').AsString := 'До виплати';
        FieldByName('NmVidN').AsString := 'Залишок до виплати';
      end else
        Edit;

      FieldByName(SumFldName).AsFloat := FieldByName(SumFldName).AsFloat + Sum;
      Post;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnPrtOneColClick(Sender: TObject);
var
  Year: Word;
  NichMode: Word;
begin
  Year := DateUtils.Decode(CdsShapDtEnd.AsDateTime).Year;

  if RBtnNichBoth.Checked then
    NichMode := 3
  else if RBtnNichOnly.Checked then
    NichMode := 2
  else
    NichMode := 1;

  F6PrtArhivka(CdsShapTabN.AsInteger, Year, QryArh, NichMode);
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnPrtThreeColsClick(Sender: TObject);
var n01, n02, n03, n04, n05, n06,
    n07, n08, n09, n10, n11, n12, nk1, nk2, nk3, nk4 : SmallInt;
    Year, Mnth, DummyWord: Word; ArchDt: TDateTime;
  NichMode: Word;
begin
  n01 := 0;
  n02 := 0;
  n03 := 0;
  n04 := 0;
  n05 := 0;
  n06 := 0;
  n07 := 0;
  n08 := 0;
  n09 := 0;
  n10 := 0;
  n11 := 0;
  n12 := 0;

  with qryArh do begin
    DisableControls;
    First;

    while not Eof do begin
      ArchDt := FieldByName('DtProc').AsDateTime;
      DecodeDate(ArchDt, Year, Mnth, DummyWord);

      while (FieldByName('DtProc').AsDateTime = ArchDt) and not Eof do begin
        if Mnth = 1 then
          Inc(n01)
        else if Mnth = 2 then
          Inc(n02)
        else if Mnth = 3 then
          Inc(n03)
        else if Mnth = 4 then
          Inc(n04)
        else if Mnth = 5 then
          Inc(n05)
        else if Mnth = 6 then
          Inc(n06)
        else if Mnth = 7 then
          Inc(n07)
        else if Mnth = 8 then
          Inc(n08)
        else if Mnth = 9 then
          Inc(n09)
        else if Mnth = 10 then
          Inc(n10)
        else if Mnth = 11 then
          Inc(n11)
        else if Mnth = 12 then
          Inc(n12);
        Next;
      end;
    end;

    First;
    EnableControls;

    nk1 := Max(n01, n02);  nk1 := Max(nk1, n03);
    nk2 := Max(n04, n05);  nk2 := Max(nk2, n06);
    nk3 := Max(n07, n08);  nk3 := Max(nk3, n09);
    nk4 := Max(n10, n11);  nk4 := Max(nk4, n12);
  end;
  if (nk1 > 0) or (nk2 > 0) or (nk3 > 0) or (nk4 > 0) then begin
    if cdsArh.Active then cdsArh.Close;
    cdsArh.IndexName := '';
    cdsArh.IndexDefs.Clear;
    cdsArh.CreateDataSet;
    cdsArh.Open;
    if nk1 > 0 then begin
      AddRecords(nk1, n01,  1, 1, Year);
      AddRecords(nk1, n02,  1, 2, Year);
      AddRecords(nk1, n03,  1, 3, Year);
    end;
    if nk2 > 0 then begin
      AddRecords(nk2, n04,  2, 4, Year);
      AddRecords(nk2, n05,  2, 5, Year);
      AddRecords(nk2, n06,  2, 6, Year);
    end;
    if nk3 > 0 then begin
      AddRecords(nk3, n07,  3, 7, Year);
      AddRecords(nk3, n08,  3, 8, Year);
      AddRecords(nk3, n09,  3, 9, Year);
    end;
    if nk4 > 0 then begin
      AddRecords(nk4, n10, 4, 10, Year);
      AddRecords(nk4, n11, 4, 11, Year);
      AddRecords(nk4, n12, 4, 12, Year);
    end;
  end;

  if RBtnNichBoth.Checked then
    NichMode := 3
  else if RBtnNichOnly.Checked then
    NichMode := 2
  else
    NichMode := 1;

  if cdsArh.Active then begin
    cdsArh.AddIndex('OnNr', 'NR', []);
    cdsArh.IndexName := 'OnNr';
    cdsArh.SaveToFile(cDirTemp + 'cdsArh.cds');

    F6PrtArhivka3(cdsShapTabN.AsInteger, Year, cdsArh, NichMode);
  end;
end;

//------------------------------------------------------------------------------
// Отладочные процедуры сравнения результатов формирования "архивок"
// старым и новым методами
//------------------------------------------------------------------------------
{
function GetArchTotals(DataSet: TDataSet): TArchTotals;
  var
    I, Indx: Integer;
    FldName: ShortString;

  procedure EmptyTotals;
    var J: Integer;
  begin
    for J := 0 to TOTALS_SIZE do
      Result[J] := 0;
  end;
begin
  EmptyTotals;

  with DataSet do begin
    First;

    while not Eof do begin
      if FieldByName('VidN').AsString <> '9999' then
        for I := 0 to TOTALS_SIZE do begin
          if I < 12 then begin
            Indx := I + 1;
            FldName := 'Sm';
          end else begin
            Indx := I - 12 + 1;
            FldName := 'SmZa';
          end;

          if Indx < 10 then
            FldName := FldName + '0';
          FldName := FldName + IntToStr(Indx);

          Result[I] := RoundTo(Result[I] + FieldByName(FldName).AsFloat, -2);
        end;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TotalsAreEqual(Totals1, Totals2: TArchTotals): Boolean;
var
  I: Integer;
begin
  Result := true;

  for I := 0 to TOTALS_SIZE do
    if Totals1[I] <> Totals2[I] then begin
      Result := false;
      break;
    end;
end;
}

//------------------------------------------------------------------------------
// Отладочная процедура сравнения результатов формирования "архивок"
// старым и новым методами
//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnCompareArchivesClick(Sender: TObject);
{
var
  QryList: TQuery;
  Totals1, Totals2: TArchTotals;
  TimeProgress: TTimeProgress;
  Counter: Integer;
}
begin
{
  QryList := TQuery.Create(nil);
  QryUtils.InitQuery(QryList);

  with QryList do begin
    SQL.Text :=
      'select * ' +
      'from z_sps ' +
      'where dtproc = "03/01/2025" ' +
      'order by tabn';
    Open;

    LogUtils.StartLogging('Arch.log');

    TimeProgress := TTimeProgress.Create(RecordCount);
    Counter := 0;

    while not Eof do begin
      CreOpenCdsUni(FieldByName('TabN').AsInteger);
      Totals1 := GetArchTotals(CdsUni);
      CdsUni.SaveToFile('OldArch.cds');

      CreOpenCdsUni2(FieldByName('TabN').AsInteger, [ArcDtProc, ArcMnthYear]);
      Totals2 := GetArchTotals(CdsUni);
      CdsUni.SaveToFile('NewArch.cds');

      if not TotalsAreEqual(Totals1, Totals2) then
        LogUtils.Log(FieldByName('TabN').AsString);

      Counter := Counter + 1;

      BtnCompareArchives.Caption :=
        IntToStr(Counter) + ' / ' + IntToStr(RecordCount) + ' : ' +
        TimeProgress.GetElapsedTime + ' / ' +
        TimeProgress.GetEstimatedTime(Counter);

      Next;
    end;

    LogUtils.EndLogging;

    Free;
  end;
}
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.CdsShapDtGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  Date: TDate;
begin
  if Sender.AsDateTime = 0 then
    Text := ''
  else begin
    Date := DateUtils.Decode(Sender.AsDateTime);
    Text := TextUtils.PadLeft(IntToStr(Date.Mnth), '0', 2);
    Text := Text + '-' + IntToStr(Date.Year);
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.CdsShapDtSetText(Sender: TField;
  const Text: String);
var
  Year, Mnth: Word;
begin
  if Trim(Text) = '-' then
    Sender.AsDateTime := 0
  else begin
    Year := StrToInt(Trim(Copy(Text, 4, Length(Text))));

    if Year < 1000 then
      Year := Year + 2000;

    Mnth := StrToInt(Trim(Copy(Text, 1, 2)));

    Sender.AsDateTime := EncodeDate(Year, Mnth, 1);
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.CdsShapDtBegChange(Sender: TField);
var
  BegDate, EndDate: TDate;
begin
  BegDate := DateUtils.Decode(Sender.AsDateTime);
  EndDate := DateUtils.Decode(CdsShapDtEnd.AsDateTime);

  EndDate.Year := BegDate.Year;
  EndDate.Mnth := Max(EndDate.Mnth, BegDate.Mnth);

  CdsShapDtEnd.OnChange := nil;
  CdsShapDtEnd.AsDateTime := DateUtils.Encode(EndDate);
  CdsShapDtEnd.OnChange := CdsShapDtEndChange;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.CdsShapDtEndChange(Sender: TField);
var
  BegDate, EndDate: TDate;
begin
  EndDate := DateUtils.Decode(Sender.AsDateTime);
  BegDate := DateUtils.Decode(CdsShapDtBeg.AsDateTime);

  BegDate.Year := EndDate.Year;
  BegDate.Mnth := Min(BegDate.Mnth, EndDate.Mnth);

  CdsShapDtBeg.OnChange := nil;
  CdsShapDtBeg.AsDateTime := DateUtils.Encode(BegDate);
  CdsShapDtBeg.OnChange := CdsShapDtBegChange;
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.CdsShapDtValidate(Sender: TField);
begin
  if Sender.AsDateTime = 0 then
    raise Exception.Create('Введите дату.');
end;

//------------------------------------------------------------------------------
procedure TFrmArhivSpan.BtnSelPathClick(Sender: TObject);
begin
  EdtSelPath.Text := PathUtils.SelectFolder(EdtSelPath.Text);
end;

procedure TFrmArhivSpan.popVarPopup(Sender: TObject);
begin
  PopArcDtProc.Visible   := ListMode = almEmployee;
  PopArcMnthYear.Visible := ListMode = almEmployee;
  Sep.Visible            := ListMode = almEmployee;
end;

end.
