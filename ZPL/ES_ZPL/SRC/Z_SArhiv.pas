unit Z_SArhiv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, DB, StdCtrls, Mask, DBCtrls, DBClient,
  Math, ComCtrls, DBTables, Grids, DBGrids, ExtCtrls, Menus;

type
  TArchMode = set of (ArcDtProc, ArcMnthYear);
  TNichMode = (NoNich, NichOnly, NichBoth);

  TFormArhivka = class(TForm)
    PageControl: TPageControl;
    ts2: TTabSheet;
    cdsShap: TClientDataSet;
    cdsShapDtBeg: TDateField;
    cdsShapDtEnd: TDateField;
    cdsShapTabN: TIntegerField;
    cdsShapDtDoc: TDateField;
    cdsShapFam: TStringField;
    cdsShapFamIO: TStringField;
    cdsShapTIN: TStringField;
    dsrcShap: TDataSource;
    dbgrArh: TDBGrid;
    qryArh: TQuery;
    ts0: TTabSheet;
    PanelTs0: TPanel;
    Label9: TLabel;
    sBtnTabN: TSpeedButton;
    LabelFio0: TLabel;
    Label11: TLabel;
    sBtnFindFam: TSpeedButton;
    Label12: TLabel;
    sBtnFindTin: TSpeedButton;
    Label13: TLabel;
    dbeTabN: TDBEdit;
    dbeFam: TDBEdit;
    dbeTin: TDBEdit;
    DtPickDtIssue: TDateTimePicker;
    cdsShapZaGod: TSmallintField;
    Label10: TLabel;
    DtPickArchYear: TDateTimePicker;
    Label14: TLabel;
    cdsShapArhDtEnd: TDateField;
    dsrcArh: TDataSource;
    qryArhDTPROC: TDateTimeField;
    qryArhZAMESGOD: TDateTimeField;
    qryArhVIDN: TStringField;
    qryArhSHVIDN: TStringField;
    qryArhNMVIDN: TStringField;
    qryArhCHASU: TFloatField;
    qryArhCNTREC: TIntegerField;
    qryTmp: TQuery;
    cdsArh: TClientDataSet;
    qryArhSUMMA: TBCDField;
    CdsUni: TClientDataSet;
    PanelButtons2: TPanel;
    LblRecCnt: TLabel;
    BtnPrtThreeCols: TSpeedButton;
    BtnPrtOneCol: TBitBtn;
    BtnBack: TSpeedButton;
    BtnExit2: TBitBtn;
    PanelButtons1: TPanel;
    BtnPrintNew: TSpeedButton;
    BtnPrintOld: TSpeedButton;
    BtnExit1: TBitBtn;
    GroupBoxScope: TGroupBox;
    RBtnNoNich: TRadioButton;
    RBtnNichOnly: TRadioButton;
    RBtnNichBoth: TRadioButton;
    popVar: TPopupMenu;
    popVarHead: TMenuItem;
    PopArcDtProc: TMenuItem;
    PopArcMnthYear: TMenuItem;
    PopArcBoth: TMenuItem;
    BtnCompareArchives: TButton;
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
    procedure PageControlResize(Sender: TObject);
    procedure cdsShapTabNSetText(Sender: TField; const Text: String);
    procedure sBtnFindFamClick(Sender: TObject);
    procedure sBtnTabNClick(Sender: TObject);
    procedure sBtnFindTinClick(Sender: TObject);
    procedure qryArhCHASUGetText(Sender: TField; var Text: String;
                                                      DisplayText: Boolean);
    procedure BtnPrtThreeColsClick(Sender: TObject);
    procedure BtnPrintNewClick(Sender: TObject);
    procedure PopArchClick(Sender: TObject);
    procedure BtnCompareArchivesClick(Sender: TObject);
  private
    n_SvGod : SmallInt;
    n_TabN, nSvTabN : integer;
    dSvDtEnd : TDateTime;
    dSvDtBeg, dSvArhDtEnd : TDateTime;
    nCaseNICH : word;
    procedure CreOpenCdsShap;
    function FindTabN(nTabN : integer;
                                 var cFam, cFamIO, cTIN : string) : boolean;
    function FindTIN(var cTIN : string; var nTabN : integer;
                                         var cFam, cFamIO : string) : boolean;
    function FindFam(var cFam : string; var nTabN : integer;
                                         var cTin, cFamIO : string) : boolean;
    procedure AddRecords(nKvRec, nMRec, nKv, nM, nY : SmallInt);

    // Старое формирование
    // procedure CreOpenCdsUni(nTabN : integer);
    // procedure AddRecToCdsUni(cVidN, cShVidN, cNmVidN: ShortString;
    //   nSmm: Double; dDtPrc: TDateTime; NSovm, VSovm: ShortString);
    // procedure AddRecZaMGToCdsUni(cVidN, cShVidN, cNmVidN: ShortString;
    //   nSmm: Double; dDtZaMG: TDateTime; NSovm, VSovm: ShortString);

    procedure CreOpenCdsUni2(TabN: Integer; ArchMode: TArchMode);
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
  public
    class procedure Run(TabN: Integer);

  end;

const SECTION = 'z_SArhiv';

implementation

uses
  a_Const, a_DM, a_Lib, DateLib, LogLib, QryLib, TimeProgress,
  z_CmnPrt, z_DM, z_GtQUpi, z_Main, z_ShVbFm;

const
  NON_PAYED_TYPES =
    '"5002", "5003", "5004", "5005", "5006", "5008", "5009", "5010", ' +
    '"5011", "5012"';

  TOTALS_SIZE = 23;
type
  TArchTotals = array [0..TOTALS_SIZE] of Double;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFormArhivka.Run(TabN: Integer);
begin
  with TFormArhivka.Create(Application) do begin
    n_TabN := TabN;
    Caption := 'Задание на печать "архивки"';
    CreOpenCdsShap;
    PageControl.ActivePage := ts0;
    ShowModal;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormArhivka.CreOpenCdsShap;
var cFam, cFamIO, cTIN : string; nTabN : integer;
begin
  if n_TabN <> 0 then
    nTabN := n_TabN
  else if nSvTabN <> 0 then
    nTabN := nSvTabN
  else
    nTabN := 0;
  with cdsShap do begin
    if Active then Close;
    CreateDataSet;  // только для заголовка справки
    Open;
    Append;
    FieldByName('ZaGod').AsInteger := n_SvGod;
    FieldByName('ArhDtEnd').AsDateTime := dSvDtEnd;
    if (nTabN <> 0) then begin
      FieldByName('TabN').AsInteger := nTabN;
      if FindTabN(nTabN, cFam, cFamIO, cTIN) then begin
        FieldByName('Fam').AsString := cFam;
        FieldByName('FamIO').AsString := cFamIO;
        FieldByName('TIN').AsString := cTIN;
        LabelFio0.Caption := cFamIO;
      end;
    end
  end;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.FormCreate(Sender: TObject);
var
  nY, nM, nD : word;
begin
  LabelFio0.Caption := '';
  ts0.TabVisible := false;
  ts2.TabVisible := false;
  PageControl.ActivePage := ts0;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 335);
    Width  := ReadInteger(SECTION, 'wW', 325);
    n_SvGod := ReadInteger(SECTION, 'nSvGd', 2005);
    nSvTabN := ReadInteger(SECTION, 'nSvTN', 0);
    dSvDtBeg := ReadInteger(SECTION, 'nSvDtB', 0);
    dSvDtEnd := ReadInteger(SECTION, 'nSvDtE', 0);
    dSvArhDtEnd := ReadInteger(SECTION, 'nSvArhDtE', 0);
    nCaseNICH := ReadInteger(SECTION, 'nCaseNICH', 3);
    Free;
  end;

  if dSvArhDtEnd = 0 then begin
    DecodeDate(Date, nY, nM, nD);
    if nM < 6 then
      nY := nY - 1;
    DtPickArchYear.Date := EncodeDate(nY, 12, 31); end
  else begin
    DecodeDate(dSvArhDtEnd, nY, nM, nD);
    dSvArhDtEnd := myLastDOM(dSvArhDtEnd);
    DtPickArchYear.Date := dSvArhDtEnd;
  end;
  DtPickDtIssue.Date := Date;
  if nCaseNICH = 3 then
    RBtnNichBoth.Checked := true
  else if nCaseNICH = 2 then
    RBtnNichOnly.Checked := true
  else
    rBtnNoNich.Checked := true;
  if FileExists(cDirVids + 'SArh01.vid') then
    dbgrArh.Columns.LoadFromFile(cDirVids + 'SArh01.vid');
end;

//------------------------------------------------------------------------------
procedure TFormArhivka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryArh.Active then
    dbgrArh.Columns.SaveToFile(cDirVids + 'SArh01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if cdsShap.Active and not cdsShap.FieldByName('ZaGod').IsNull then
      WriteInteger(SECTION, 'nSvGd', cdsShap.FieldByName('ZaGod').AsInteger);
    if cdsShap.Active and not cdsShap.FieldByName('TabN').IsNull then
      WriteInteger(SECTION, 'nSvTN', cdsShap.FieldByName('TabN').AsInteger);
    WriteInteger(SECTION, 'nSvArhDtE', Round(DtPickArchYear.Date));
    if RBtnNichBoth.Checked then
      nCaseNICH := 3
    else if RBtnNichOnly.Checked then
      nCaseNICH := 2
    else
      nCaseNICH := 1;
    WriteInteger(SECTION, 'nCaseNICH', nCaseNICH);

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormArhivka.sBtnTabNClick(Sender: TObject);
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
function TFormArhivka.FindTabN(
  nTabN : integer;
  var cFam, cFamIO, cTIN : string
) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    if RecordCount > 0 then begin
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                      FieldByName('Ima').AsString,
                                        FieldByName('Otch').AsString);
      cFam := FieldByName('FAM').AsString;
      cTIN := FieldByName('ID').AsString;
      Result := true
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.cdsShapTabNSetText(Sender: TField; const Text: String);
var cText : string; nTabN : integer;
    cFam, cFamIO, cTIN : string;
begin
  cText := Text;
  if cText <> '' then begin
    nTabN := StrToInt(cText);
    if FindTabN(nTabN, cFam, cFamIO, cTIN) then begin
      Sender.AsString := cText;
      cdsShapFam.AsString := cFam;
      cdsShapFamIO.AsString := cFamIO;
      LabelFio0.Caption := cFamIO;
      cdsShapTIN.AsString := cTIN; end
    else
      Raise Exception.Create('Нет в таблице "Сотрудники" табельного номера "' +
                                                                  cText + '"');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.dbeTabNExit(Sender: TObject);
//var nTabN : integer; cFam, cFamIO, cTIN : string;
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.sBtnFindTinClick(Sender: TObject);
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
function TFormArhivka.FindTIN(var cTIN : string; var nTabN : integer;
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
procedure TFormArhivka.sBtnFindFamClick(Sender: TObject);
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
function TFormArhivka.FindFam(var cFam : string; var nTabN : integer;
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
procedure TFormArhivka.dtPicEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.dtPicExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.BtnBackClick(Sender: TObject);
begin
   Caption := 'Задание на печать справки в СПОВ';
   PageControl.ActivePage := ts0;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.BtnPrintOldClick(Sender: TObject);
var nY, nM, nD : word; nTabN : integer;
    dDtBeg, dDtEnd : TDateTime;
begin
  DtPickArchYear.SetFocus;
  Application.ProcessMessages;
  dDtEnd := DtPickArchYear.Date;
  DecodeDate(dDtEnd, nY, nM, nD);
  dDtEnd := EncodeDate(nY, nM, 1);
  dDtBeg := EncodeDate(nY,  1, 1);
  nTabN := cdsShap.FieldByName('TabN').AsInteger;
  n_TabN := nTabN;
  with qryArh do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select DtProc, ZaMesGod, VidN, ShVidN, NmVidN, ' +
            ' count(*) as CNTREC, Sum(Chas) as Chasu, ' +
            ' Sum(Cast(Summa as numeric(18,2))) as Summa ' +
            ' from vinu_main ' +
            ' where TabN = :nTabN and DtProc >= :dDtBeg and ' +
            ' DtProc <= :dDtEnd and VidN < "8000" ');
    if RBtnNoNich.Checked then
      SQL.Add(' and not KdSps = 6 ')
    else if RBtnNichOnly.Checked then
      SQL.Add(' and KdSps = 6 ');
    SQL.Add(' group by DtProc, VidN, ShVidN, NmVidN, ZaMesGod ' +
            ' having (Sum(Cast(Summa as numeric(18,2))) > 0.001) or ' +
            ' (Sum(Cast(Summa as numeric(18,2))) < -0.001)');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    if RecordCount = 0 then begin
      ShowMessage('Не найдено данных для документа. Измените задание');
      Close;
      SQL.Clear; end
    else begin
      PageControl.ActivePage := ts2;
      LblRecCnt.Caption := 'Записей: ' + IntToStr(RecordCount);
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormArhivka.BtnPrintNewClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + PanelButtons1.Top + BtnPrintNew.Top + 54;
  Y := Left + PanelButtons1.Left + BtnPrintNew.Left + 7;
  popVar.Popup(Y, X);
end;

//------------------------------------------------------------------------------
procedure TFormArhivka.PopArchClick(Sender: TObject);
var
  TabN: Integer;
  ArchDt: TDate;
  NichMode: Word;
begin
  TabN := CdsShap.FieldByName('TabN').AsInteger;

  ArchDt := DateUtils.Decode(DtPickArchYear.Date);

  if RBtnNichBoth.Checked then
    NichMode := 3
  else if RBtnNichOnly.Checked then
    NichMode := 2
  else
    NichMode := 1;

  if Sender = PopArcDtProc then begin
    CreOpenCdsUni2(TabN, [ArcDtProc]);

    F6PrtArh_DtPrcZaMG(TabN, 'DtPrc', ArchDt.Year, CdsUni, NichMode);
  end else if Sender = PopArcMnthYear then begin
    CreOpenCdsUni2(TabN, [ArcMnthYear]);

    F6PrtArh_DtPrcZaMG(TabN, 'ZaMG', ArchDt.Year, CdsUni, NichMode);
  end else begin
    CreOpenCdsUni2(TabN, [ArcDtProc, ArcMnthYear]);

    F6PrtArhUni(TabN, ArchDt.Year, CdsUni, NichMode);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormArhivka.PageControlResize(Sender: TObject);
begin
  PanelTs0.Top := PageControl.Top +
                        Round((PageControl.Height - PanelTs0.Height) / 2) - 20;
  PanelTs0.Left := PageControl.Left +
                        Round((PageControl.Width - PanelTs0.Width) / 2) - 5;
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.qryArhCHASUGetText(Sender: TField; var Text: String;
                                                         DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsFloat = 0)) then
    Text := ''
  else
    Text := FloatToStr((Sender as TField).AsFloat);
end;
//------------------------------------------------------------------------------
procedure TFormArhivka.AddRecords(nKvRec, nMRec, nKv, nM, nY : SmallInt);
var d_DtPrc : TDateTime;
begin
  if nMRec > 0 then with qryTmp do begin
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
    ParamByName('nTabN').AsInteger := n_TabN;
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
procedure TFormArhivka.CreOpenCdsUni2(
  TabN: Integer;
  ArchMode: TArchMode
);
var
  DtBeg, DtEnd: TDateTime;
  NichMode: TNichMode;
  Date: TDate;
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

  // Последний месяц периода
  Date := DateUtils.Decode(DtPickArchYear.Date);
  // Начало года периода
  DtBeg := EncodeDate(Date.Year, 1, 1);
  // Начало последнего месяца периода
  DtEnd := EncodeDate(Date.Year, Date.Mnth, 1);

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
procedure TFormArhivka.SelectPmnts(
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
procedure TFormArhivka.SelectNonPayed(
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
procedure TFormArhivka.LoadPmnts(
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
procedure TFormArhivka.AddRecToCdsUni2(
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
// Старое формирование
//------------------------------------------------------------------------------
{
procedure TFormArhivka.CreOpenCdsUni(
  nTabN : integer
);
var
  nY, nM, nD : word;
  dDtBeg, dDtEnd: TDateTime;
  cVidN: string;
  nAmount: double;
begin
  dtPicDtEnd.SetFocus;
  Application.ProcessMessages;
  dDtEnd := dtPicDtEnd.Date;
  DecodeDate(dDtEnd, nY, nM, nD);
  dDtEnd := EncodeDate(nY, nM, 1);
  dDtBeg := EncodeDate(nY,  1, 1);
  n_TabN := nTabN;
  with cdsUni do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add(
      'select DtProc, VidN, ShVidN, NmVidN, ' +
        'Sum(Cast(Summa as Numeric(18,2))) as SMM, ' +
        'Sum(Cast(chas as Numeric(18,2))) as Chas, ' +
        'Cast(0 as Numeric(18,2)) as ChasStorn, ' +
        'case ' +
          'when not NuSovm is null and ' +
            '(NuSovm = "Y" or NuSovm = "1") then "Y" ' +
          'else null ' +
        'end NSovm, ' +
        'Sovm VSovm ' +
      'from ViNu_Main ' +
      'where TabN = :TabN ' +
        'and DtProc >= :DtBeg and DtProc <= :DtEnd ' +
        'and VidN < "8000" ' +
        'and not VidN in ("5005", "5008")'
    );
    if RBtnNoNich.Checked then
      SQL.Add('and not KdSps = 6')
    else if RBtnNichOnly.Checked then
      SQL.Add('and KdSps = 6');
    SQL.Add('group by DtProc, VidN, ShVidN, NmVidN, NUSovm, Sovm');
    SQL.Add('union');
    SQL.Add(
      'select ' +
        't.ZAMESGOD as DTProc, v.VIDN, v.SHVIDN, v.NMVIDN, ' +
        'cast(0 as numeric(18,2)) as SMM, ' +
        'cast(t.CHASTOTAL as numeric(18,2)) as CHAS, ' +
        'cast(Sum(s.CHAS) as numeric(18,2)) as ChasStorn, t.Sovm NSovm, ' +
        'v.Sovm VSovm ' +
      'from ' +
        '(' +
          'select TABN, VIDN, ZAMESGOD, Sum(CHAS) as CHASTOTAL, Sovm ' +
          'from Z_OTKL a ' +
          'where ' +
            'TabN = :TabN and VidN in ("5005", "5008") and ' +
            '(ZaMesGod between :DtBeg and :DtEnd or ' +
            'cast(' +
              'cast(extract(month from DtStorn) as char(2)) || "-" || ' +
              '"1" || "-" || ' +
              'cast(extract(year from DtStorn) as char(4)) ' +
              'as date) between :DtBeg and :DtEnd) ' +
          'group by TABN, VIDN, ZAMESGOD, Sovm' +
        ') t ' +
        'left join Z_OTKL s on s.TABN = t.TABN and s.VIDN = t.VIDN and ' +
          // Показывать только сторнированные в "своём" месяце.
          // Пока комментируем.
          's.ZAMESGOD = t.ZAMESGOD and ' +
          'CAST(' +
            'CAST(EXTRACT(MONTH FROM s.DTSTORN) AS CHAR(2)) || "-" || ' +
            '"1" || "-" || ' +
            'CAST(EXTRACT(YEAR FROM s.DTSTORN) AS CHAR(4)) ' +
          'AS DATE) = t.ZAMESGOD ' +
          'and s.STORN = "Y" ' +
        'left join Z_KdVidN v on v.VIDN = t.VIDN ' +
      'group by t.ZAMESGOD, v.VIDN, v.SHVIDN, v.NMVIDN, t.CHASTOTAL, t.Sovm, ' +
        'v.Sovm'
    );

    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('DtBeg').AsDateTime := dDtBeg;
    ParamByName('DtEnd').AsDateTime := dDtEnd;
    Open;
    if RecordCount <= 0 then begin
      ShowMessage('Нет информации по ТабНр ' + IntToStr(nTabN) +
                                  ' за заданный период');
      Close;
      Exit;
    end;
    First;
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      if (cVidN = '5005') or (cVidN = '5008') then
        nAmount := FieldByName('chas').AsFloat - FieldByName('chasStorn').AsFloat
      else
        nAmount := FieldByName('SMM').AsFloat;

      if nAmount <> 0 then
        AddRecToCdsUni(
          FieldByName('VidN').AsString, FieldByName('ShVidN').AsString,
          FieldByName('NmVidN').AsString, nAmount,
          FieldByName('DtProc').AsDateTime,
          FieldByName('NSovm').AsString, FieldByName('VSovm').AsString
        );
      Next;
    end;
    Close;

    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add(
      'select ZaMesGod, VidN, ShVidN, NmVidN, ' +
        'Sum(Cast(Summa as Numeric(18,2))) as SMM, ' +
        'Cast(0 as Numeric(18,2)) as Chas, ' +
        'Cast(0 as Numeric(18,2)) as ChasStorn, ' +
        'case ' +
          'when not NuSovm is null ' +
            'and (NuSovm = "Y" or NuSovm = "1") then "Y" ' +
          'else null ' +
        'end NSovm, ' +
        'Sovm VSovm ' +
      'from ViNu_Main ' +
      'where TabN = :TabN ' +
        'and ZaMesGod >= :DtBeg and ZaMesGod <= :DtEnd ' +
        'and VidN < "8000" and not VidN in ("5005", "5008")'
    );
    if RBtnNoNich.Checked then
      SQL.Add('and not KdSps = 6')
    else if RBtnNichOnly.Checked then
      SQL.Add('and KdSps = 6');
    SQL.Add('group by ZaMesGod, VidN, ShVidN, NmVidN, NUSovm, Sovm');
    SQL.Add('union');
    SQL.Add(
      'select ' +
        't.ZAMESGOD as DTProc, v.VIDN, v.SHVIDN, v.NMVIDN, ' +
        'cast(0 as numeric(18,2)) as SMM, ' +
        'cast(t.CHASTOTAL as numeric(18,2)) as CHAS, ' +
        'cast(Sum(s.CHAS) as numeric(18,2)) as ChasStorn, t.Sovm NSovm, ' +
          'v.Sovm VSovm ' +
      'from ' +
        '(' +
          'select TABN, VIDN, ZAMESGOD, Sum(CHAS) as CHASTOTAL, Sovm ' +
          'from Z_OTKL a ' +
          'where ' +
            'TABN = :TabN AND VIDN in ("5005", "5008") and ' +
            '(ZAMESGOD between :DtBeg and :DtEnd or ' +
            'CAST(' +
              'CAST(EXTRACT(MONTH FROM DTSTORN) AS CHAR(2)) || "-" || ' +
              '"1" || "-" || ' +
              'CAST(EXTRACT(YEAR FROM DTSTORN) AS CHAR(4)) ' +
              'AS DATE) between :DtBeg and :DtEnd) ' +
          'group by TABN, VIDN, ZAMESGOD, Sovm' +
        ') t ' +
        'left outer join Z_OTKL s on s.TABN = t.TABN and s.VIDN = t.VIDN and ' +
          's.ZAMESGOD = t.ZAMESGOD and ' +
          's.STORN = "Y" ' +
        'left join Z_KDVIDN v on v.VIDN = t.VIDN ' +
      'group by t.ZAMESGOD, v.VIDN, v.SHVIDN, v.NMVIDN, t.CHASTOTAL, t.Sovm, ' +
        'v.Sovm'
    );

    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('DtBeg').AsDateTime := dDtBeg;
    ParamByName('DtEnd').AsDateTime := dDtEnd;

    Open;
    First;
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      if (cVidN = '5005') or (cVidN = '5008') then
        nAmount := FieldByName('chas').AsFloat - FieldByName('chasStorn').AsFloat
      else
        nAmount := FieldByName('SMM').AsFloat;

      if nAmount <> 0 then
        AddRecZaMGToCdsUni(
          FieldByName('VidN').AsString, FieldByName('ShVidN').AsString,
          FieldByName('NmVidN').AsString, nAmount,
          FieldByName('ZaMesGod').AsDateTime,
          FieldByName('NSovm').AsString, FieldByName('VSovm').AsString
        );
      Next;
    end;
    cdsUni.AddIndex('OnVidN', 'VidN', []);
    cdsUni.IndexName := 'OnVidN';
    if bFlagDbg then
      cdsUni.SaveToFile(cDirTemp + 'cdsUni.cds');
  end;
end;

//------------------------------------------------------------------------------
procedure TFormArhivka.AddRecZaMGToCdsUni(
  cVidN, cShVidN, cNmVidN: ShortString;
  nSmm: Double;
  dDtZaMG: TDateTime;
  NSovm, VSovm: ShortString
);
var
  nY, nM, nD : word;
  cPole, TotalType : ShortString;
begin
  DecodeDate(dDtZaMG, nY, nM, nD);
  cPole := 'SmZa';
  if nM < 10 then
    cPole := cPole + '0';
  cPole := cPole + IntToStr(nM);

  with cdsUni do begin
    // В строку вида
    if Trim(NSovm) = '' then
      // Если оставлять пробел, глючит Locate
      NSovm := 'N';

    if not Locate('VidN;NSovm', VarArrayOf([cVidN, NSovm]), []) then begin
      Append;
      FieldByName('VidN').AsString := cVidN;
      FieldByName('ShVidN').AsString := cShVidN;
      FieldByName('NmVidN').AsString := cNmVidN;
      FieldByName('NSovm').AsString := NSovm;
      FieldByName('VSovm').AsString := VSovm;
    end else
      Edit;
    FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
    Post;

    if (cVidN < '6000') and (cVidN <> '5005') and (cVidN <> '5008') then begin
      // В строку "По видам начисления"
      TotalType := '6000';
      if not Locate('VidN', TotalType, []) then begin
        Append;
        FieldByName('VidN').AsString := TotalType;
        FieldByName('ShVidN').AsString := 'Итого начисления';
        FieldByName('NmVidN').AsString := 'По видам начислений'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;  end
    else if (cVidN > '6000') and (cVidN < '8000') then begin
      // В строку "По видам удержанияния"
      TotalType := '8000';
      if not Locate('VidN', TotalType, []) then begin
        Append;
        FieldByName('VidN').AsString := TotalType;
        FieldByName('ShVidN').AsString := 'Итого удержания';
        FieldByName('NmVidN').AsString := 'По видам удержаний'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;
    end;

    if (cVidN < '8000') and (cVidN <> '5005') and (cVidN <> '5008') then begin
      // В строку "Остаток на руки"
      TotalType := '9999';
      if not Locate('VidN', TotalType, []) then begin
        Append;
        FieldByName('VidN').AsString := TotalType;
        FieldByName('ShVidN').AsString := 'На руки';
        FieldByName('NmVidN').AsString := 'Остаток на руки';
      end else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormArhivka.AddRecToCdsUni(
  cVidN, cShVidN, cNmVidN: ShortString;
  nSmm: Double;
  dDtPrc: TDateTime;
  NSovm, VSovm: ShortString
);
var nY, nM, nD : word; cPole, c_VidN : ShortString;
begin
  DecodeDate(dDtPrc, nY, nM, nD);
  cPole := 'Sm';
  if nM < 10 then
    cPole := cPole + '0';
  cPole := cPole + IntToStr(nM);
  with cdsUni do begin
    // В строку вида

    if Trim(NSovm) = '' then
      // Если оставлять пробел, глючит Locate
      NSovm := 'N';

    if not Locate('VidN;NSovm', VarArrayOf([cVidN, NSovm]), []) then begin
      Append;
      FieldByName('VidN').AsString := cVidN;
      FieldByName('ShVidN').AsString := cShVidN;
      FieldByName('NmVidN').AsString := cNmVidN;
      FieldByName('NSovm').AsString := NSovm;
      FieldByName('VSovm').AsString := VSovm;
    end else
      Edit;

    FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
    Post;

    if (cVidN < '6000') and (cVidN <> '5005') and (cVidN <> '5008') then begin
      // В строку "По видам начисления"
      c_VidN := '6000';
      if not Locate('VidN', c_VidN, []) then begin
        Append;
        FieldByName('VidN').AsString := c_VidN;
        FieldByName('ShVidN').AsString := 'Всього нарахувань';
        FieldByName('NmVidN').AsString := 'По видах нарахувань'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;  end
    else if (cVidN > '6000') and (cVidN < '8000') then begin
      // В строку "По видам удержанияния"
      c_VidN := '8000';
      if not Locate('VidN', c_VidN, []) then begin
        Append;
        FieldByName('VidN').AsString := c_VidN;
        FieldByName('ShVidN').AsString := 'Всього утримань';
        FieldByName('NmVidN').AsString := 'По видах утримань'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;
    end;
    if (cVidN < '8000') and (cVidN <> '5005') and (cVidN <> '5008') then begin
      // В строку "Остаток на руки"
      c_VidN := '9999';
      if not Locate('VidN', c_VidN, []) then begin
        Append;
        FieldByName('VidN').AsString := c_VidN;
        FieldByName('ShVidN').AsString := 'До виплати';
        FieldByName('NmVidN').AsString := 'Залишок до виплати'; end
      else
        Edit;
      FieldByName(cPole).AsFloat := FieldByName(cPole).AsFloat + nSmm;
      Post;
    end;
  end;
end;
}

//------------------------------------------------------------------------------
procedure TFormArhivka.BtnPrtOneColClick(Sender: TObject);
var
  ArchDt: TDate;
  NichMode: Word;
begin
  if RBtnNichBoth.Checked then
    NichMode := 3
  else if RBtnNichOnly.Checked then
    NichMode := 2
  else
    NichMode := 1;

  ArchDt := DateUtils.Decode(DtPickArchYear.Date);

  F6PrtArhivka(CdsShapTabN.AsInteger, ArchDt.Year, QryArh, NichMode);
end;

//------------------------------------------------------------------------------
procedure TFormArhivka.BtnPrtThreeColsClick(Sender: TObject);
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
procedure TFormArhivka.BtnCompareArchivesClick(Sender: TObject);
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

end.
