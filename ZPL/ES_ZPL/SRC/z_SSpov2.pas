unit z_SSpov2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, DB, StdCtrls, Mask, DBCtrls, DBClient,
  Math, ComCtrls, DBTables, Grids, DBGrids, ExtCtrls;

type
  string4 = string[4];
  TFormSprSpov2 = class(TForm)
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
    dsrcSpov: TDataSource;
    qryTmp: TQuery;
    ts0: TTabSheet;
    cdsShapZaGod: TSmallintField;
    cdsShapSpovDtEnd: TDateField;
    cdsSpov: TClientDataSet;
    cdsSpovNR: TAutoIncField;
    cdsSpovZaMesGod: TDateField;
    cdsSpovSmNachisl: TFloatField;
    cdsSpovSmForPF: TFloatField;
    cdsSpovSmBln: TFloatField;
    cdsSpovSmToPF: TFloatField;
    cdsSpovSmToPfPrp: TFloatField;
    cdsSpovStag: TSmallintField;
    cdsSpovIsPPS: TBooleanField;
    cdsSpovStagPPS: TSmallintField;
    qryDop: TQuery;
    cdsSpovDtBegStag: TDateField;
    cdsSpovDtEndStag: TDateField;
    cdsSpovDtBegStagPps: TDateField;
    cdsSpovDtEndStagPps: TDateField;
    cdsSpovStag1pps: TSmallintField;
    cdsSpovCntDayInMes: TSmallintField;
    cdsSpovIsInv: TBooleanField;
    cdsShapIma: TStringField;
    cdsShapOtch: TStringField;
    cdsShapKdPeriod: TSmallintField;
    cdsShapTipFormu: TSmallintField;
    cdsShapDtBegVidn: TDateField;
    cdsShapdtEndVidn: TDateField;
    cdsShapRobotProc: TFloatField;
    cdsShapRobotSm: TFloatField;
    cdsShapZgStagMes: TSmallintField;
    cdsShapZgStagDn: TSmallintField;
    cdsShapKdPidstavu: TStringField;
    cdsShapMisZaversh: TSmallintField;
    cdsShapEdIzm: TSmallintField;
    cdsShapSpStagMis: TSmallintField;
    cdsShapSpStagDn: TSmallintField;
    cdsShapNormaTrival: TStringField;
    cdsShapShPeriodu: TStringField;
    cdsShapShFormu: TStringField;
    cdsShapKdPlace: TSmallintField;
    cdsShapShPlace: TStringField;
    cdsShapKdZboru: TSmallintField;
    cdsShapShZboru: TStringField;
    cdsShapShEdIzm: TStringField;
    cdsSpovRusMes: TStringField;
    cdsSpovPps: TStringField;
    cdsSpovInv: TSmallintField;
    tblPorogi: TTable;
    PanelButtons: TPanel;
    sBtnGo0: TSpeedButton;
    bBtnExit0: TBitBtn;
    PanelButtons2: TPanel;
    bBtnPrt: TBitBtn;
    sBtnBack: TSpeedButton;
    bBtnExit2: TBitBtn;
    grBoxInv: TGroupBox;
    rBtnInv: TRadioButton;
    rBtnNeInv: TRadioButton;
    Label29: TLabel;
    PanelMain: TPanel;
    Label1: TLabel;
    PanelTs0: TPanel;
    Label9: TLabel;
    sBtnSpovTabN: TSpeedButton;
    LabelFio0: TLabel;
    Label11: TLabel;
    sBtnSpovFindFam: TSpeedButton;
    Label12: TLabel;
    sBtnSpovFindTin: TSpeedButton;
    Label13: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    dbeSpovTabN: TDBEdit;
    dbeSpovFam: TDBEdit;
    dbeSpovTin: TDBEdit;
    dtPicDtDoc: TDateTimePicker;
    dtPicSpovDtEnd: TDateTimePicker;
    PanelMain2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label8: TLabel;
    Label16: TLabel;
    dbgrSpov: TDBGrid;
    dbeTIN: TDBEdit;
    dbeFam: TDBEdit;
    dbeIma: TDBEdit;
    dbeOtch: TDBEdit;
    dbeKdPer: TDBEdit;
    dbeShPer: TDBEdit;
    dbeTipFormu: TDBEdit;
    dbeShFormu: TDBEdit;
    dbeKdPlace: TDBEdit;
    dbeShPlace: TDBEdit;
    dbeKdZboru: TDBEdit;
    dbeShZboru: TDBEdit;
    dbeDtBegVidn: TDBEdit;
    dbeDtEndVidn: TDBEdit;
    dbeDtDoc: TDBEdit;
    dbeZgStagMes: TDBEdit;
    dbeZgStagDn: TDBEdit;
    grBoxPPS: TGroupBox;
    Label6: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dbeKdPidstavu: TDBEdit;
    dbeMisZaversh: TDBEdit;
    dbeEdIzm: TDBEdit;
    dbeSpStagMis: TDBEdit;
    dbeSpStagDn: TDBEdit;
    dbeNormaTriv: TDBEdit;
    dbeShEdIzm: TDBEdit;
    dbeRobotProc: TDBEdit;
    dbeRobotSm: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeTabNExit(Sender: TObject);
    procedure dtPicEnter(Sender: TObject);
    procedure dtPicExit(Sender: TObject);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure bBtnPrtClick(Sender: TObject);
    procedure sBtnBackClick(Sender: TObject);
    procedure sBtnGo0Click(Sender: TObject);
    procedure PageControlResize(Sender: TObject);
    procedure cdsShapTabNSetText(Sender: TField; const Text: String);
    procedure sBtnSpovFindFamClick(Sender: TObject);
    procedure sBtnSpovTabNClick(Sender: TObject);
    procedure sBtnSpovFindTinClick(Sender: TObject);
    procedure dbgrSpovEnter(Sender: TObject);
    procedure dbgrSpovExit(Sender: TObject);
    procedure cdsShapKdPeriodValidate(Sender: TField);
    procedure cdsShapTipFormuValidate(Sender: TField);
    procedure cdsShapKdPlaceValidate(Sender: TField);
    procedure cdsShapKdZboruValidate(Sender: TField);
    procedure cdsShapEdIzmValidate(Sender: TField);
    procedure cdsSpovCalcFields(DataSet: TDataSet);
    procedure cdsShapKdPidstavuValidate(Sender: TField);
    procedure dbgrSpovDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsSpovAfterPost(DataSet: TDataSet);
    procedure rBtnInvClick(Sender: TObject);
    procedure cdsSpovNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    n_SvGod : SmallInt;
    n_TabN, nSvTabN : integer;
    dSvSpovDtEnd : TDateTime;
    dSvDtBeg, dSvDtEnd : TDateTime;
    d_DtBeg, d_DtEnd : TDateTime;
    nSvLeftTs0, nSvLeftTs2, nSvWidthTs2 : SmallInt;
    //bCdsSpovReady : boolean;
    dDtTotals : TDateTime;
    bIsSmenaInv : boolean;
    procedure CreOpenCdsShap;
    procedure CreOpenTblPorogi(dDtBeg, dDtEnd : TDateTime);
    function GetSmPoroga(dZaMG : TDateTime) : double;
    function FindTabN(nTabN : integer; var cFam, cIma, cOtch,
                                        cFamIO, cTIN : ShortString) : boolean;
    function FindTIN(var cTIN : ShortString; var nTabN : integer;
                                         var cFam, cIma, cOtch,
                                             cFamIO : ShortString) : boolean;
    function FindFam(var cFam : ShortString; var nTabN : integer;
                       var  cIma, cOtch, cTin, cFamIO : ShortString) : boolean;
//    function GetStag(nTabN : integer; dDtMes : TDateTime;
//                        var nCntStagMes, nCntStagDay : SmallInt) : SmallInt;
//    function GetSpecStag(nTabN : integer; dDtMes : TDateTime;
//                        var nCntStagMes, nCntStagDay : SmallInt) : SmallInt;
    procedure CheckPpsState(nTabN : integer; dDtB, dDtE : TDateTime;
                                                     var bTabNIsPps : boolean);
    procedure SetDbgrSpovColumns;
    procedure RaschetCdsSpov;
    procedure PereschetItogov;
    function FindInPere(nTabN : integer; dSpovDtEnd : TDateTime;
                                          var bSovm, bInv : boolean) : boolean;
  public
    { Public declarations }
  end;

procedure Spr_Spov2(nTabN : integer);

const SECTION = 'z_SSpov2';

var
  FormSprSpov2: TFormSprSpov2;

implementation

uses a_Const, a_DM, z_DM, Z_Main, z_GtQUpi, Z_ShVbFm, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure Spr_Spov2(nTabN : integer);
begin
  FormSprSpov2 := TFormSprSpov2.Create(Application);
  with FormSprSpov2 do begin
    n_TabN := nTabN;
    Caption := 'Задание на печать справки в СПОВ';
    CreOpenCdsShap;
    PageControl.ActivePage := ts0;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.CreOpenCdsShap;
var cFam, cFamIO, cIma, cOtch, cTIN : ShortString; nTabN : integer;
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
    FieldByName('SpovDtEnd').AsDateTime := dSvSpovDtEnd;
    if (nTabN <> 0) then begin
      FieldByName('TabN').AsInteger := nTabN;
      if FindTabN(nTabN, cFam, cIma, cOtch, cFamIO, cTIN) then begin
        FieldByName('Fam').AsString := cFam;
        FieldByName('Ima').AsString := cIma;
        FieldByName('Otch').AsString := cOtch;
        FieldByName('FamIO').AsString := cFamIO;
        FieldByName('TIN').AsString := cTIN;
        LabelFio0.Caption := cFamIO;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormSprSpov2.FindInPere(nTabN : integer; dSpovDtEnd : TDateTime;
                                           var bSovm, bInv : boolean) : boolean;
begin
  bSovm := false;
  bInv  := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_PERE where TabN = :nTabN and ' +
            ' Dt_Beg <= :dSpovDtEnd order by Dt_Beg desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dSpovDtEnd').AsDateTime := dSpovDtEnd;
    Open;
    if RecordCount > 0 then begin
      bSovm := FieldByName('Sovm').AsInteger > 0;
      bInv  := FieldByName('Inv').AsInteger > 0;
    end;
    Result := true;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.FormCreate(Sender: TObject);
var nY, nM, nD : word;
begin
  dDtTotals := EncodeDate(2999,12,31);
  LabelFio0.Caption := '';
  ts0.TabVisible := false;
  ts2.TabVisible := false;
  PageControl.ActivePage := ts0;
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 400);
    Width  := ReadInteger(SECTION, 'wW', 320);
    nSvLeftTs0  := Left;
    nSvLeftTs2  := ReadInteger(SECTION, 'nSvLeftTs2', 50);
    nSvWidthTs2 := ReadInteger(SECTION, 'nSvWidthTs2', 750);
    n_SvGod := ReadInteger(SECTION, 'nSvGd', 2005);
    nSvTabN := ReadInteger(SECTION, 'nSvTN', 0);
    dSvDtBeg := ReadInteger(SECTION, 'nSvDtB', 0);
    dSvDtEnd := ReadInteger(SECTION, 'nSvDtE', 0);
    dSvSpovDtEnd := ReadInteger(SECTION, 'nSvSpvDtE', 0);
    Free;
  end;
  Constraints.MaxHeight := 335;
  Constraints.MinHeight := 335;
  Height := 335;
  Constraints.MaxWidth := 320;
  Constraints.MinWidth := 320;
  Width := 320;
  if dSvSpovDtEnd = 0 then begin
    DecodeDate(Date, nY, nM, nD);
    if nM < 6 then
      nY := nY - 1;
    dtPicSpovDtEnd.Date := EncodeDate(nY, 12, 31); end
  else begin
    DecodeDate(dSvSpovDtEnd, nY, nM, nD);
    dSvSpovDtEnd := myLastDOM(dSvSpovDtEnd);
    dtPicSpovDtEnd.Date := dSvSpovDtEnd;
  end;
  dtPicDtDoc.Date := Date;
  rBtnNeInv.Checked := true;   // Всегда начинаю с неИнвалидов
  if FileExists(cDirVids + 'SSpov04.vid') then
    dbgrSpov.Columns.LoadFromFile(cDirVids + 'SSpov04.vid');
  SetDbgrSpovColumns;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSpov.Columns.SaveToFile(cDirVids + 'SSpov04.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    if PageControl.ActivePage = ts0 then
      WriteInteger(SECTION, 'wL', nSvLeftTs0)
    else
      WriteInteger(SECTION, 'nSvLeftTs2', nSvLeftTs2);
    if PageControl.ActivePage = ts0 then
      WriteInteger(SECTION, 'wW', Width)
    else
      WriteInteger(SECTION, 'nSvWidthTs2', nSvWidthTs2);
    if cdsShap.Active and not cdsShap.FieldByName('ZaGod').IsNull then
      WriteInteger(SECTION, 'nSvGd', cdsShap.FieldByName('ZaGod').AsInteger);
    if cdsShap.Active and not cdsShap.FieldByName('TabN').IsNull then
      WriteInteger(SECTION, 'nSvTN', cdsShap.FieldByName('TabN').AsInteger);
    WriteInteger(SECTION, 'nSvSpvDtE', Round(dtPicSpovDtEnd.Date));
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.sBtnSpovTabNClick(Sender: TObject);
var nTabN : integer; cFam, cIma, cOtch, cFamIO, cTIN : string;
begin
  dbeSpovFam.SetFocus;
  dbeSpovTabN.SetFocus;
  Application.ProcessMessages;
  nTabN := cdsShapTabN.AsInteger;
  if GetUpiTabN(nTabN, cFam, cIma, cOtch, cFamIO, cTIN) {z_GtQUpi} then begin
    cdsShap.FieldByName('TabN').AsInteger := nTabN;
    cdsShap.FieldByName('Fam').AsString  := cFam;
    cdsShap.FieldByName('Ima').AsString  := cIma;
    cdsShap.FieldByName('Otch').AsString := cOtch;
    cdsShap.FieldByName('TIN').AsString  := cTIN;
    LabelFio0.Caption := cFamIO;
  end;
end;
//------------------------------------------------------------------------------
function TFormSprSpov2.FindTabN(nTabN : integer; var cFam, cIma, cOtch,
                                        cFamIO, cTIN : ShortString) : boolean;
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
      cFam   := FieldByName('FAM').AsString;
      cIma   := FieldByName('IMA').AsString;
      cOtch  := FieldByName('OTCH').AsString;
      cTIN   := FieldByName('ID').AsString;
      Result := true
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsShapTabNSetText(Sender: TField; const Text: String);
var cText : string; nTabN : integer;
    cFam, cIma, cOtch, cFamIO, cTIN : ShortString;
begin
  cText := Text;
  if cText <> '' then begin
    nTabN := StrToInt(cText);
    if FindTabN(nTabN, cFam, cIma, cOtch, cFamIO, cTIN) then begin
      Sender.AsString       := cText;
      cdsShapFam.AsString   := cFam;
      cdsShapIma.AsString   := cIma;
      cdsShapOtch.AsString  := cOtch;
      cdsShapFamIO.AsString := cFamIO;
      LabelFio0.Caption     := cFamIO;
      cdsShapTIN.AsString   := cTIN; end
    else
      Raise Exception.Create('Нет в таблице "Сотрудники" табельного номера "' +
                                                                  cText + '"');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.dbeTabNExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.sBtnSpovFindTinClick(Sender: TObject);
var nTabN : integer; cTIN, cSvTIN, cFam,  cIma, cOtch, cFamIO : ShortString;
begin
  cSvTIN := cdsShap.FieldByName('TIN').AsString; // до потери фокуса (старый)
  dbeSpovFam.SetFocus;
  dbeSpovTIN.SetFocus;
  cTin := cdsShap.FieldByName('TIN').AsString;
  if FindTin(cTin, nTabN, cFam, cIma, cOtch, cFamIO) then begin
    LabelFio0.Caption := cFamIO;
    cdsShap.FieldByName('Fam').AsString   := cFam;
    cdsShap.FieldByName('Ima').AsString   := cIma;
    cdsShap.FieldByName('Otch').AsString  := cOtch;
    cdsShap.FieldByName('TIN').AsString   := cTin;
    cdsShap.FieldByName('TabN').AsInteger := nTabN; end
  else begin
    cdsShap.FieldByName('TIN').AsString := cSvTin;
    ShowMessage('Заданный ТИН: ' + cTIN + ' не найден.');
  end;
end;
//------------------------------------------------------------------------------
function TFormSprSpov2.FindTIN(var cTIN : ShortString; var nTabN : integer;
                        var cFam, cIma, cOtch, cFamIO : ShortString) : boolean;
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
      cIma   := FieldByName('Ima').AsString;
      cOtch  := FieldByName('Otch').AsString;
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
procedure TFormSprSpov2.sBtnSpovFindFamClick(Sender: TObject);
var nTabN : integer; cTIN, cSvFam, cFam, cIma, cOtch, cFamIO : ShortString;
begin
  cSvFam := cdsShap.FieldByName('Fam').AsString; // до потери фокуса (старый)
  dbeSpovTIN.SetFocus;
  dbeSpovFam.SetFocus;                               ///
  cFam := cdsShap.FieldByName('Fam').AsString;
  if FindFam(cFam, nTabN, cIma, cOtch, cTin, cFamIO) then begin
    LabelFio0.Caption := cFamIO;
    cdsShap.FieldByName('Fam').AsString := cFam;
    cdsShap.FieldByName('Ima').AsString := cIma;
    cdsShap.FieldByName('Otch').AsString := cOtch;
    cdsShap.FieldByName('TIN').AsString := cTin;
    cdsShap.FieldByName('TabN').AsInteger := nTabN; end
  else
    cdsShap.FieldByName('Fam').AsString := cSvFam;
end;
//------------------------------------------------------------------------------
function TFormSprSpov2.FindFam(var cFam : ShortString; var nTabN : integer;
                       var  cIma, cOtch, cTin, cFamIO : ShortString) : boolean;
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
      cIma   := FieldByName('Ima').AsString;
      cOtch  := FieldByName('Otch').AsString;
      nTabN  := FieldByName('TabN').AsInteger;
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                                      FieldByName('Ima').AsString,
                                        FieldByName('Otch').AsString);
      Result := true end
    else if RecordCount > 1 then begin
      if Shw_FamsForUpi(qryTmp, nTabN) {Z_ShVbFm} then begin
        cTIN   := FieldByName('ID').AsString;
        cFam   := FieldByName('Fam').AsString;
        cIma   := FieldByName('Ima').AsString;
        cOtch  := FieldByName('Otch').AsString;
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
procedure TFormSprSpov2.dtPicEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.dtPicExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.sBtnBackClick(Sender: TObject);
begin
  with cdsSpov do begin
    if Active then
      Close;
    Filter := '';
    Filtered := false;
  end;
  Caption := 'Задание на печать справки в СПОВ';
  nSvLeftTs2 := Left;
  nSvWidthTs2 := Width;
  Height := 335;
  Constraints.MaxHeight := 335;
  Constraints.MinHeight := 335;
  Width := 320;
  Constraints.MaxWidth := 320;
  Constraints.MinWidth := 320;
  Left := nSvLeftTs0;
  PageControl.ActivePage := ts0;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsShapKdPeriodValidate(Sender: TField);
var n : SmallInt;
begin
  if not Sender.IsNull then begin
    n := Sender.AsInteger;
    if n = 1 then
      cdsShapShPeriodu.AsString := '1-й квартал'
    else if n = 2 then
      cdsShapShPeriodu.AsString := '2-й квартал'
    else if n = 3 then
      cdsShapShPeriodu.AsString := '3-й квартал'
    else if n = 4 then
      cdsShapShPeriodu.AsString := '4-й квартал'
    else if n = 5 then
      cdsShapShPeriodu.AsString := '1-е пiврiччя'
    else if n = 6 then
      cdsShapShPeriodu.AsString := '2-е пiврiччя'
    else if n = 7 then
      cdsShapShPeriodu.AsString := '9 мiсяцiв'
    else if n = 0 then
      cdsShapShPeriodu.AsString := 'рiк'
    else
      Raise Exception.Create('Значения могут быть от 1 до 7 и 0'); end
  else
    Raise Exception.Create('Не должно быть пустого значения');
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsShapTipFormuValidate(Sender: TField);
var n : SmallInt;
begin
  if not Sender.IsNull then begin
    n := Sender.AsInteger;
    if n = 1 then
      cdsShapShFormu.AsString := 'Початкова'
    else if n = 2 then
      cdsShapShFormu.AsString := 'Коригуюча'
    else if n = 3 then
      cdsShapShFormu.AsString := 'Скасовуюча'
    else if n = 4 then
      cdsShapShFormu.AsString := 'Призн. пенсії'
    else
      Raise Exception.Create('Значения могут быть от 1 до 4'); end
  else
    Raise Exception.Create('Не должно быть пустого значения');
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsShapKdPlaceValidate(Sender: TField);
var n : SmallInt;
begin
  if not Sender.IsNull then begin
    n := Sender.AsInteger;
    if n = 1 then
      cdsShapShPlace.AsString := 'Так'
    else if n = 2 then
      cdsShapShPlace.AsString := 'Ні'
    else
      Raise Exception.Create('Значения могут быть 1 и 2'); end
  else
    Raise Exception.Create('Не должно быть пустого значения');
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsShapKdZboruValidate(Sender: TField);
var n : SmallInt;
begin
  if not Sender.IsNull then begin
    n := Sender.AsInteger;
    if n = 1 then begin
      cdsShapShZboru.AsString := 'На загальних підставах';
      cdsShapRobotProc.AsFloat := 32; end
    else if n = 2 then begin
      cdsShapShZboru.AsString := 'Для інвалідів';
      cdsShapRobotProc.AsFloat := 4; end
    else begin
      cdsShapShZboru.AsString := '';
      Raise Exception.Create('Значения могут быть 1 и 2');
    end; end
  else begin
    cdsShapShZboru.AsString := '';
    Raise Exception.Create('Не должно быть пустого значения');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsShapEdIzmValidate(Sender: TField);
var n : SmallInt;
begin
  if not Sender.IsNull then begin
    n := Sender.AsInteger;
    if n = 1 then begin
      cdsShapShEdIzm.AsString := 'Місяці/дні';
      cdsShapNormaTrival.AsString := '12/0'; end
    else begin
      cdsShapShPlace.AsString := '';
      cdsShapNormaTrival.AsString := '';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsShapKdPidstavuValidate(Sender: TField);
var cTxt : ShortString;
begin
  if (not Sender.IsNull) and (Sender.AsString > '') then begin
    cTxt := Sender.AsString;
    if (cTxt <> 'ЗНТ024А1') and (cTxt <> 'ЗПЗ056Д1') and
        (cTxt <> 'ЗПЗ056Е1') and (cTxt <> 'ЗПЗ056Ж1') and
                                  (cTxt <> 'ЗПЗ056Ж2') then
      Raise Exception.Create('Допустимые значения: ЗНТ024А1, ЗПЗ056Д1, ' +
                                             'ЗПЗ056Е1, ЗПЗ056Ж1, ЗПЗ056Ж2');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.CreOpenTblPorogi(dDtBeg, dDtEnd: TDateTime);
var dDtTmp : TDateTime; nY, nM, nD : word; nSmPoroga : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 DtBeg, Sm2660 from Z_tPdn ' +
            ' where DtBeg <= :dDtTmp order by DtBeg Desc');
  end;
  with tblPorogi do begin
    DataBaseName := cDirTemp;
    TableName := 't_Porogi';
    if Active then Close;
    if Exists then DeleteTable;
    CreateTable;
    Open;
    dDtTmp := dDtBeg;
    while dDtTmp <= dDtEnd do begin
      qryTmp.Close;
      qryTmp.ParamByName('dDtTmp').AsDateTime := dDtTmp;
      qryTmp.Open;
      nSmPoroga := qryTmp.FieldByName('Sm2660').AsFloat;
      Append;
      FieldByName('ZaMesGod').AsDateTime := dDtTmp;
      FieldByName('SmPoroga').AsFloat := nSmPoroga;
      Post;
      DecodeDate(dDtTmp, nY, nM, nD);
      Inc(nM);
      if nM > 12 then begin
        nM := 1;
        Inc(nY);
      end;
      dDtTmp := EncodeDate(nY, nM, 1);
    end;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormSprSpov2.GetSmPoroga(dZaMG: TDateTime): double;
begin
  Result := 0;
  if tblPorogi.Locate('ZaMesGod', dZaMG, []) then
    Result := tblPorogi.FieldByName('SmPoroga').AsFloat;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.sBtnGo0Click(Sender: TObject);
var nY, nM, nD : word; nTabN : integer;
    dZaMG : TDateTime; nSmm : double; bIsPps, bSovm, bInv : boolean;
    nSmPoroga : double;
begin
  grBoxInv.Visible := false;
  dbeSpovFam.SetFocus; // Чтобы уйти с поля dbeSpovTabN
  nTabN := cdsShapTabN.AsInteger;
  Application.ProcessMessages;
  d_DtEnd := dtPicSpovDtEnd.Date;
  DecodeDate(d_DtEnd, nY, nM, nD);
  if nM <= 3 then                        // 1 - 1-й кв,  2 - 2-й кв
    cdsShapKdPeriod.AsInteger := 1       // 3 - 3-й кв,  4 - 4-й кв
  else if nM <= 6 then                   // 5 - 1-е пг,  6 - 2-е пг
    cdsShapKdPeriod.AsInteger := 5       // 7 - 9 мес ,  0 - год
  else if nM <= 9 then
    cdsShapKdPeriod.AsInteger := 7
  else
    cdsShapKdPeriod.AsInteger := 0;
  cdsShapTipFormu.AsInteger := 4;      // Початкова
  cdsShapDtDoc.AsDateTime := dtPicDtDoc.Date;
  cdsShapKdPidstavu.AsString  := '';   // Заполнятся позже,
  cdsShapMisZaversh.AsString  := '';   // а тут очищаю на
  cdsShapEdIzm.AsString       := '';   // случай возврата из ts2
  cdsShapShEdIzm.AsString     := '';   // и изменения ТабН-ра
  cdsShapSpStagMis.AsString   := '';
  cdsShapSpStagDn.AsString    := '';
  cdsShapNormaTrival.AsString := '';
  if FindInPere(nTabN, d_DtEnd, bSovm, bInv) then begin
    if bSovm then begin
      cdsShapKdPlace.AsInteger := 2;
      cdsShapShPlace.AsString := 'Ні'; end
    else begin
      cdsShapKdPlace.AsInteger := 1;
      cdsShapShPlace.AsString := 'Так';
    end;
    if not bInv then begin
      cdsShapKdZboru.AsInteger := 1;
      cdsShapShZboru.AsString := 'На загальних підставах';
      cdsShapRobotProc.AsFloat := 32; end
    else begin
      cdsShapKdZboru.AsInteger := 2;
      cdsShapShZboru.AsString := 'Для інвалідів';
      cdsShapRobotProc.AsFloat := 4;
    end;
  end;
  d_DtBeg := EncodeDate(nY, 1, 1);
  // Создать табличку с порогами для каждого месяца заданного периода
  // для заполнения колонки SmForPF в cdsSpov, если сумма SmNachisl > SmPoroga
  CreOpenTblPorogi(d_DtBeg, d_DtEnd);
  n_TabN := nTabN;
  //bCdsSpovReady := false;
  cdsSpov.AfterPost := NIL;
  cdsSpov.OnNewRecord := NIL;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    // Выбрать данные для колонки "SmNachisl"  (всего начислено)
    SQL.Add('Select ZaMesGod, DtProc, Sum(Summa) as SMM from viNu_Main ' +
            ' where ZaMesGod >= :dDtBeg and ZaMesGod <= :dDtEnd and ' +
            ' TabN = :nTabN and (VidN < "2700" or VidN > "2800") and ' +
            ' VidN < "5000" and SPOV = "1" ' +  // пропустил "прочие"
            ' group by ZaMesGod, DtProc ');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := d_DtBeg;
    ParamByName('dDtEnd').AsDateTime := d_DtEnd;
    Open;
    if RecordCount = 0 then begin
      ShowMessage('Не найдено данных для справки. Измените задание');
      Close;
      SQL.Clear; end
    else begin
      if cdsSpov.Active then
        cdsSpov.Close;
      cdsSpov.CreateDataSet;
      cdsSpov.Open;
      First;  // qryTmp
      while not Eof do begin
        dZaMG := FieldByName('ZaMesGod').AsDateTime;
        nSmm := 0;
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
          nSmm := nSmm + FieldByName('SMM').AsFloat;
          Next;
        end;
        cdsSpov.Append;
        cdsSpov.FieldByName('ZaMesGod').AsDateTime := dZaMG;
        cdsSpov.FieldByName('CntDayInMes').AsInteger := myLastDayOM(dZaMG);
        cdsSpov.FieldByName('SmNachisl').AsFloat := nSmm;
        cdsSpov.FieldByName('IsPPS').AsBoolean := false;
        cdsSpov.Post;
      end;
      Close;
      SQL.Clear;
      // Выбрать данные для колонки "SmForPF"  (суммы для пенсионного взноса)
      SQL.Add('Select ZaMesGod, DtProc, Sum(Summa) as SMM from viNu_Main ' +
              ' where ZaMesGod >= :dDtBeg and ZaMesGod <= :dDtEnd and ' +
              ' TabN = :nTabN  and (VidN < "2700" or VidN > "2800") and ' +
              ' VidN < "5000" and SP_PF = "1" group by ZaMesGod, DtProc ');
      ParamByName('nTabN').AsInteger := nTabN;
      ParamByName('dDtBeg').AsDateTime := d_DtBeg;
      ParamByName('dDtEnd').AsDateTime := d_DtEnd;
      Open;
      while not Eof do begin
        dZaMG := FieldByName('ZaMesGod').AsDateTime;
        nSmm := 0;
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
          nSmm := nSmm + FieldByName('SMM').AsFloat;
          Next;
        end;
        // Если nSmm > nSmPoroga для этого месяца, записать nSmPoroga
        nSmPoroga := GetSmPoroga(dZaMG);
        if (nSmPoroga > 0) and (nSmm > nSmPoroga) then
          nSmm := nSmPoroga;
        if not cdsSpov.Locate('ZaMesGod', dZaMG, []) then begin
          cdsSpov.Append;
          cdsSpov.FieldByName('CntDayInMes').AsInteger := myLastDayOM(dZaMG);
          cdsSpov.FieldByName('ZaMesGod').AsDateTime := dZaMG; end
        else
          cdsSpov.Edit;
        cdsSpov.FieldByName('SmForPF').AsFloat :=
                       cdsSpov.FieldByName('SmForPF').AsFloat + nSmm;
        cdsSpov.Post;
      end;
      Close;
      SQL.Clear;
      // Выбрать данные для колонки "SmBolnic"   (больничные)
      SQL.Add('Select ZaMesGod, DtProc, Sum(Summa) as SMM from viNu_Main ' +
              ' where ZaMesGod >= :dDtBeg and ZaMesGod <= :dDtEnd and ' +
              ' TabN = :nTabN and VidN < "5000" and Bolnic = "1" ' +
              ' group by ZaMesGod, DtProc ');
      ParamByName('nTabN').AsInteger := nTabN;
      ParamByName('dDtBeg').AsDateTime := d_DtBeg;
      ParamByName('dDtEnd').AsDateTime := d_DtEnd;
      Open;
      while not Eof do begin
        dZaMG := FieldByName('ZaMesGod').AsDateTime;
        nSmm := 0;
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
          nSmm := nSmm + FieldByName('SMM').AsFloat;
          Next;
        end;
        if not cdsSpov.Locate('ZaMesGod', dZaMG, []) then begin
          cdsSpov.Append;
          cdsSpov.FieldByName('CntDayInMes').AsInteger := myLastDayOM(dZaMG);
          cdsSpov.FieldByName('ZaMesGod').AsDateTime := dZaMG; end
        else
          cdsSpov.Edit;
        cdsSpov.FieldByName('SmBln').AsFloat :=
                       cdsSpov.FieldByName('SmBln').AsFloat + nSmm;
        cdsSpov.Post;
      end;
      Close;
      SQL.Clear;
      // Выбрать данные для колонки "SmToPF"   (пенс взнос с сотрудника)
      SQL.Add('Select ZaMesGod, DtProc, Sum(Summa) as SMM from viNu_Main ' +
              ' where ZaMesGod >= :dDtBeg and ZaMesGod <= :dDtEnd and ' +
              ' TabN = :nTabN and VidN > "6000" and VidN < "8000" and ' +
              ' SP_PF = "1" ' +
              ' group by ZaMesGod, DtProc ');
      ParamByName('nTabN').AsInteger := nTabN;
      ParamByName('dDtBeg').AsDateTime := d_DtBeg;
      ParamByName('dDtEnd').AsDateTime := d_DtEnd;
      Open;
      while not Eof do begin
        dZaMG := FieldByName('ZaMesGod').AsDateTime;
        nSmm := 0;
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
          nSmm := nSmm + FieldByName('SMM').AsFloat;
          Next;
        end;
        if not cdsSpov.Locate('ZaMesGod', dZaMG, []) then begin
          cdsSpov.Append;
          cdsSpov.FieldByName('CntDayInMes').AsInteger := myLastDayOM(dZaMG);
          cdsSpov.FieldByName('ZaMesGod').AsDateTime := dZaMG; end
        else
          cdsSpov.Edit;
        cdsSpov.FieldByName('SmToPF').AsFloat :=
                       cdsSpov.FieldByName('SmToPF').AsFloat - nSmm;
        cdsSpov.Post;
      end;
      Close;
      SQL.Clear;
      // Выбрать данные для колонки "SmToPfPrp"   (пенс взнос с предприятия)
      SQL.Add('Select ZaMesGod, DtProc, Sum(Summa) as SMM from viNu_Main ' +
              ' where ZaMesGod >= :dDtBeg and ZaMesGod <= :dDtEnd and ' +
              ' TabN = :nTabN and ((VidN >= "8681" and VidN <= "8691") or ' +
              ' VidN in ("8611","8612","8711","8712","8715","8716")) ' +
              ' group by ZaMesGod, DtProc ');
              { До введения ЕСВ было только and VidN in ("8611", "8612")}
      ParamByName('nTabN').AsInteger := nTabN;
      ParamByName('dDtBeg').AsDateTime := d_DtBeg;
      ParamByName('dDtEnd').AsDateTime := d_DtEnd;
      Open;
      while not Eof do begin
        dZaMG := FieldByName('ZaMesGod').AsDateTime;
        nSmm := 0;
        while (FieldByName('ZaMesGod').AsDateTime = dZaMG) and not Eof do begin
          nSmm := nSmm + FieldByName('SMM').AsFloat;
          Next;
        end;
        if not cdsSpov.Locate('ZaMesGod', dZaMG, []) then begin
          cdsSpov.Append;
          cdsSpov.FieldByName('CntDayInMes').AsInteger := myLastDayOM(dZaMG);
          cdsSpov.FieldByName('ZaMesGod').AsDateTime := dZaMG; end
        else
          cdsSpov.Edit;
        cdsSpov.FieldByName('SmToPfPrp').AsFloat :=
                       cdsSpov.FieldByName('SmToPfPrp').AsFloat - nSmm;
        cdsSpov.Post;
      end;
      Close;
      SQL.Clear;
      cdsSpov.Append;    // Добавляю "итоговую" запись
      cdsSpov.FieldByName('ZaMesGod').AsDateTime := dDtTotals;
      cdsSpov.FieldByName('Inv').AsInteger := -1;
      cdsSpov.Post;
      CheckPpsState(nTabN, d_DtBeg, d_DtEnd, bIsPps);
      Height := 391;
      FormSprSpov2.Constraints.MaxHeight := 391;
      FormSprSpov2.Constraints.MinHeight := 391;
      FormSprSpov2.Constraints.MaxWidth := 800;
      FormSprSpov2.Constraints.MinWidth := 680;
      Width := nSvWidthTs2;
      nSvLeftTs0 := Left;
      Left := nSvLeftTs2;
      grBoxPPS.Enabled := bIsPps;
      if not bIsPps then begin
        dbeKdPidstavu.Color := clBtnFace;
        dbeMisZaversh.Color := clBtnFace;
        dbeEdIzm.Color      := clBtnFace;
        dbeShEdIzm.Color    := clBtnFace;
        dbeSpStagMis.Color  := clBtnFace;
        dbeSpStagDn.Color   := clBtnFace;
        dbeNormaTriv.Color  := clBtnFace; end
      else begin
        dbeKdPidstavu.Color := clWindow;
        dbeMisZaversh.Color := clWindow;
        dbeEdIzm.Color      := clWindow;
        dbeShEdIzm.Color    := clWindow;
        dbeSpStagMis.Color  := clWindow;
        dbeSpStagDn.Color   := clWindow;
        dbeNormaTriv.Color  := clWindow;
      end;
      cdsSpov.AfterPost := cdsSpovAfterPost;
      cdsSpov.OnNewRecord := cdsSpovNewRecord;
      PageControl.ActivePage := ts2;
      Caption := 'ТабН ' + IntToStr(nTabN) + ' с ' +
                          Copy(DateToStr(d_DtBeg), 4, 7) + ' по ' +
                          Copy(DateToStr(d_DtEnd), 4, 7) + ' (вкл.)';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.CheckPpsState(nTabN : integer; dDtB, dDtE : TDateTime;
                                                    var bTabNIsPps : boolean);
var bIsInv, bPredIsInv,  bIsPPS, bPredIsPPS : boolean;
    nCntDayStag : SmallInt;
    dStagDtBeg, dStagDtEnd, dMesDtBeg, dMesDtEnd,
    dRecDtPr, dRecDtUv, dRecDtBeg : TDateTime;
    i : word;
    nInv, nPredInv : SmallInt;
begin
  dDtE := myLastDOM(dDtE); // дата для последнего дня периода
  // Пройти по z_PrmUv - собрать сведения для ОБЩЕГО стажа
  with qryDop do begin                     // ======
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_PrmUv where KdSps = 0 and TabN = :nTabN and ' +
            ' Dt_Priem <= :dDtE order by Dt_Priem desc, NR desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtE').AsDateTime := dDtE;
    Open;
  end;
  with cdsSpov do begin
    First;
    while not Eof do begin
      dMesDtBeg := FieldByName('ZaMesGod').AsDateTime;
      dMesDtEnd := myLastDOM(dMesDtBeg);
      qryDop.First;
      while not qryDop.Eof do begin   // Z_PrmUv сортированная по Dt_Priem desc
        dRecDtPr := qryDop.FieldByName('Dt_Priem').AsDateTime;
        if qryDop.FieldByName('Dt_Uvoln').IsNull or
                   (qryDop.FieldByName('Dt_Uvoln').AsDateTime = 0) then
          dRecDtUv := dDtE + 1000
        else
          dRecDtUv := qryDop.FieldByName('Dt_Uvoln').AsDateTime;
        if (dRecDtPr <= dMesDtEnd) and
             ((dRecDtUv = 0) or (dRecDtUv >= dMesDtBeg)) then begin
          dStagDtBeg := Max(dMesDtBeg, dRecDtPr);
          dStagDtEnd := dMesDtEnd; // предполагаю
          if dRecDtUv > 0 then // но если неПустая дата увольн., выбираю меньшее
            dStagDtEnd := Min(dStagDtEnd, dRecDtUv);
          nCntDayStag := Round(dStagDtEnd - dStagDtBeg) + 1;
          Edit;
          FieldByName('DtBegStag').AsDateTime := dStagDtBeg;
          FieldByName('DtEndStag').AsDateTime := dStagDtEnd;
          FieldByName('Stag').AsInteger := nCntDayStag;
          Post;
          Break;
        end;
        qryDop.Next;
      end;
      Next;
    end;
  end;
  with qryDop do begin // теперь о стаже ППС - его выбираю из Z_PERE.
    if Active then Close;             // ===
    SQL.Clear;                        // Поля ОБЩЕГО стажа уже заполнены
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_Pere where TabN = :nTabN and Dt_Beg <= :dDtE ' +
            ' order by Dt_Beg desc, NR desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtE').AsDateTime := dDtE;
    Open;
  end;
  bIsInv := false;
  bPredIsInv := false;
  bPredIsPPS := false;
  bIsSmenaInv := false;
  nPredInv := -1;  // Просто чтобы инициализировать чем-нибудь
  with cdsSpov do begin
    First;
    i := 0;
    while not Eof do begin         // иду по месяцам
      if FieldByName('ZaMesGod').AsDateTime <> dDtTotals then begin
        dMesDtBeg := FieldByName('ZaMesGod').AsDateTime;
        dMesDtEnd := myLastDOM(dMesDtBeg);
        dStagDtBeg := dMesDtBeg;
        dStagDtEnd := dMesDtEnd;
        qryDop.First; // тут qryDop это перемещения, сортировка по Dt_Beg DESC !!!
        while not qryDop.Eof do begin
          dRecDtBeg := qryDop.FieldByName('Dt_Beg').AsDateTime;
          if ((dRecDtBeg <= dMesDtBeg) and (dRecDtBeg <= dMesDtBeg)) then begin
            // почему выше в обоих скобках одно и то же ???? Разобраться
            bIsPPS := qryDop.FieldByName('KdKatP').AsInteger = 1;
            bIsInv := qryDop.FieldByName('Inv').AsInteger >= 1;
            if (bIsInv or bIsPPS) then begin
              Edit;
              FieldByName('Inv').AsInteger := qryDop.FieldByName('Inv').AsInteger;
              if bIsInv then
                FieldByName('IsInv').AsBoolean := true;
              if bIsPPS then begin
                FieldByName('IsPPS').AsBoolean := true;
                FieldByName('DtBegStagPPS').AsDateTime := dStagDtBeg;
                FieldByName('DtEndStagPPS').AsDateTime := dStagDtEnd;
                nCntDayStag := Round(dStagDtEnd - dStagDtBeg) + 1;
                FieldByName('Stag1pps').AsInteger := nCntDayStag;
                if not FieldByName('DtBegStag').IsNull then
                  dStagDtBeg :=
                         Max(FieldByName('DtBegStag').AsDateTime, dStagDtBeg)
                else
                  dStagDtBeg := 0;
                if not FieldByName('DtEndStag').IsNull then
                  dStagDtEnd :=
                         Min(FieldByName('DtEndStag').AsDateTime, dStagDtEnd)
                else
                  dStagDtEnd := 0;
                if (dStagDtBeg = 0) or (dStagDtEnd = 0) then
                  nCntDayStag := 0
                else
                  nCntDayStag := Round(dStagDtEnd - dStagDtBeg) + 1;
                FieldByName('StagPPS').AsInteger := nCntDayStag;
              end;
              Post;
            end;
            Break; end
          else if (dRecDtBeg < dMesDtEnd) and (dRecDtBeg > dMesDtBeg) then begin
            bIsPPS := qryDop.FieldByName('KdKatP').AsInteger = 1;
            if (bIsInv or bIsPPS) then begin
              Edit;
              FieldByName('Inv').AsInteger := qryDop.FieldByName('Inv').AsInteger;
              if bIsInv then
                FieldByName('IsInv').AsBoolean := true;
              if bIsPPS then begin
                dStagDtBeg := dRecDtBeg;
                dStagDtEnd := dMesDtEnd;
                FieldByName('IsPPS').AsBoolean := true;
                FieldByName('DtBegStagPPS').AsDateTime := dStagDtBeg;
                FieldByName('DtEndStagPPS').AsDateTime := dStagDtEnd;
                nCntDayStag := Round(dStagDtEnd - dStagDtBeg) + 1;
                FieldByName('Stag1pps').AsInteger := nCntDayStag;
                if not FieldByName('DtBegStag').IsNull then
                  dStagDtBeg :=
                         Max(FieldByName('DtBegStag').AsDateTime, dStagDtBeg)
                else
                  dStagDtBeg := 0;
                if not FieldByName('DtEndStag').IsNull then
                  dStagDtEnd :=
                         Min(FieldByName('DtEndStag').AsDateTime, dStagDtEnd)
                else
                  dStagDtEnd := 0;
                if (dStagDtBeg = 0) or (dStagDtEnd = 0) then
                  nCntDayStag := 0
                else
                  nCntDayStag := Round(dStagDtEnd - dStagDtBeg) + 1;
                FieldByName('StagPPS').AsInteger := nCntDayStag;
              end;
              Post; end
            else if (bPredIsInv or bPredIsPPS) then begin
              Edit;
              FieldByName('Inv').AsInteger := qryDop.FieldByName('Inv').AsInteger;
              dStagDtBeg := dMesDtBeg;
              if bPredIsInv then
                FieldByName('IsInv').AsBoolean := true;
              if bPredIsPPS then begin
                dStagDtEnd := dRecDtBeg-1;
                FieldByName('IsPPS').AsBoolean := true;
                FieldByName('DtBegStagPPS').AsDateTime := dStagDtBeg;
                FieldByName('DtEndStagPPS').AsDateTime := dStagDtEnd;
                nCntDayStag := Round(dStagDtEnd - dStagDtBeg) + 1;
                FieldByName('Stag1pps').AsInteger := nCntDayStag;
                if not FieldByName('DtBegStag').IsNull then
                  dStagDtBeg :=
                         Max(FieldByName('DtBegStag').AsDateTime, dStagDtBeg)
                else
                  dStagDtBeg := 0;
                if not FieldByName('DtEndStag').IsNull then
                  dStagDtEnd :=
                         Min(FieldByName('DtEndStag').AsDateTime, dStagDtEnd)
                else
                  dStagDtEnd := 0;
                if (dStagDtBeg = 0) or (dStagDtEnd = 0) then
                  nCntDayStag := 0
                else
                  nCntDayStag := Round(dStagDtEnd - dStagDtBeg) + 1;
                FieldByName('StagPPS').AsInteger := nCntDayStag;
              end;
              Post;
            end;
            bPredIsInv := bIsInv;
            bPredIsPPS := bIsPPS;
            Break;
          end;
          qryDop.Next;
        end;
        Inc(i);
        if FieldByName('Inv').AsInteger > 0 then
          nInv := 1
        else
          nInv := 0;
        if (i > 1) and (nInv <> nPredInv) then
          bIsSmenaInv := true;
        nPredInv := nInv;
      end;
      Next; // cdsSpov
    end;
    Close;
    Open;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'SprSpov.cds');
    if bIsSmenaInv then begin
      if rBtnNeInv.Checked then begin // Сначала показываю "неИнвалидную" часть
        cdsShapKdZboru.AsInteger := 1;
        Filter := '(Inv is Null) or (Inv <= 0)';
        Filtered := true; end
      else begin
        cdsShapKdZboru.AsInteger := 2;
        Filter := 'Inv = -1 or Inv > 0';
        Filtered := true;
      end; end
    else begin
      cdsSpov.Filter := '';
      cdsSpov.Filtered := false;
    end;
  end;
  with qryDop do begin
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  RaschetCdsSpov;
  grBoxInv.Visible := bIsSmenaInv;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.bBtnPrtClick(Sender: TObject);
var nY, nM, nD : word;
begin
  DecodeDate(d_DtBeg, nY, nM, nD);
  F6PrtSprSpov(nY, cdsShap, cdsSpov); {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.PageControlResize(Sender: TObject);
begin
  PanelTs0.Top := PageControl.Top +
                        Round((PageControl.Height - PanelTs0.Height) / 2) - 20;
  PanelTs0.Left := PageControl.Left +
                        Round((PageControl.Width - PanelTs0.Width) / 2) - 5;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.SetDbgrSpovColumns;
var i : SmallInt; cFldNm : ShortString;
begin
  for i := 0 to dbgrSpov.Columns.Count-1 do begin
    cFldNm := UpperCase(dbgrSpov.Columns[i].FieldName);
    if {(cFldNm = 'CNTDAYINMES') or} (cFldNm = 'DTBEGSTAG') or
        (cFldNm = 'DTENDSTAG') or (cFldNm = 'DTBEGSTAGPPS') or
         (cFldNm = 'DTENDSTAGPPS') or (cFldNm = 'PPS') or
          (cFldNm = 'INV') or (cFldNm = 'STAG1PPS') then
      dbgrSpov.Columns[i].Visible := bFlagDbg;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.dbgrSpovEnter(Sender: TObject);
begin
  dbgrSpov.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.dbgrSpovExit(Sender: TObject);
begin
  dbgrSpov.FixedColor := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsSpovCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(cdsSpovZaMesGod.AsDateTime, nY, nM, nD);
  if nD <> 31 then
    cdsSpovRusMes.AsString := Copy(MesRus(nM), 1, 3) + ' ' +
                                         Copy(IntToStr(nY), 3, 2)
  else
    cdsSpovRusMes.AsString := 'Итого:';
  if cdsSpovIsPps.AsBoolean then
    cdsSpovPps.AsString := 'Д'
  else
    cdsSpovPps.AsString := '';
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.dbgrSpovDrawColumnCell(Sender: TObject;
                                        const Rect: TRect; DataCol: Integer;
                                        Column: TColumn; State: TGridDrawState);
begin
  with dbgrSpov.Canvas do begin
    if not (gdFocused in State) then begin
      if (cdsSpovZaMesGod.AsDateTime = dDtTotals) then
        Brush.Color := clBtnFace;
      if cdsSpovIsInv.AsBoolean then
        Font.Color := clMaroon;
    end;
  end;
  dbgrSpov.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsSpovAfterPost(DataSet: TDataSet);
begin
  if (cdsSpovZaMesGod.AsDateTime <> dDtTotals) then begin
    RaschetCdsSpov;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.RaschetCdsSpov;
var nSmNachislTt, nSmForPfTt, nSmBlnTt, nSmToPfTt, nSmToPfPrpTt{, nSumPfPrp} : double;
    //nSvNR : integer;
    dDtBegVidn{osin}, dDtEndVidn{osin}, {dDtBegStag, dDtEndStag,
                                  dDtBegPpsStag,} dDtEndPpsStag : TDateTime;
    nCntDaysTt, nStagZgTt, nStagPpsTt, nDopStagZgMes, nDopStagPpsMes,
                nStagZgNepolnDn, nStagPpsNepolnDn : SmallInt;
    nStagZgMes, nStagPpsMes : SmallInt;
    bIsInv, bIsPPS, bIsMesNepolnZgStag{, bIsMesNepolnPpsStag} : boolean;
    nY, nM, nD : word;
begin
  // Сформировать/Пересчитать итоговую запись
  //nStagZgNepolnDn := 0;
  //nStagPpsNepolnDn := 0;
  with cdsSpov do begin
    First;
    dDtEndPpsStag := 0;
    dDtBegVidn{osin} := FieldByName('DtBegStag').AsDateTime;
          // в первой записи дата DtBegStag, которая годится для dDtBegVidnosin
    dDtEndVidn := 0;
    bIsInv := false;
    bIsPPS := false;
    nSmNachislTt := 0;
    nSmForPfTt   := 0;
    nSmBlnTt     := 0;
    nSmToPfTt    := 0;
    nSmToPfPrpTt := 0;
    nCntDaysTt := 0;
    nStagZgTt  := 0;
    nStagPpsTt := 0;
    bIsMesNepolnZgStag := false;
    //bIsMesNepolnPpsStag := false;
    nStagZgMes  := 0;
    nStagPpsMes := 0;
    nStagZgNepolnDn  := 0;
    nStagPpsNepolnDn := 0;
    AfterPost := NIL;
    while not Eof do begin         // иду по месяцам
      if FieldByName('ZaMesGod').AsDateTime <> dDtTotals then begin
        dDtEndVidn{osin} := FieldByName('DtEndStag').AsDateTime;
        // в последней записи дата DtEndStag, которая годится для dDtEndVidnosin
        //dMesDtBeg := FieldByName('ZaMesGod').AsDateTime;
        //nSumPfPrp := FieldByName('SmToPfPrp').AsFloat;
        if FieldByName('Stag').AsInteger <>
                   FieldByName('CntDayInMes').AsInteger then begin
          nStagZgNepolnDn := nStagZgNepolnDn + FieldByName('Stag').AsInteger;
          bIsMesNepolnZgStag := true; end
        else
          Inc(nStagZgMes);
        if FieldByName('IsPps').AsBoolean then begin
          bIsPps := true;
          dDtEndPpsStag := FieldByName('DtEndStagPps').AsDateTime;
          if FieldByName('StagPps').AsInteger <>
                   FieldByName('CntDayInMes').AsInteger then begin
            nStagPpsNepolnDn := nStagPpsNepolnDn + FieldByName('StagPps').AsInteger;
            //bIsMesNepolnPpsStag := true;
            end
          else
            Inc(nStagPpsMes);
        end;
        if FieldByName('IsInv').AsBoolean then
          bIsInv := true;
        nSmNachislTt := nSmNachislTt + FieldByName('SmNachisl').AsFloat;
        nSmForPfTt   := nSmForPfTt   + FieldByName('SmForPF').AsFloat;
        nSmBlnTt     := nSmBlnTt     + FieldByName('SmBln').AsFloat;
        nSmToPfTt    := nSmToPfTt    + FieldByName('SmToPf').AsFloat;
        nSmToPfPrpTt := nSmToPfPrpTt + FieldByName('SmToPfPrp').AsFloat;
        nCntDaysTt   := nCntDaysTt   + FieldByName('CntDayInMes').AsInteger;
        nStagZgTt    := nStagZgTt    + FieldByName('Stag').AsInteger;
        nStagPpsTt   := nStagPpsTt   + FieldByName('StagPPS').AsInteger;
      end;
      Next;
    end;
//    AfterPost := NIL;
    if Locate('ZaMesGod', dDtTotals, []) then begin  {а иначе быть не может}
      Edit;
      FieldByName('SmNachisl').AsFloat := nSmNachislTt;
      FieldByName('SmForPF').AsFloat := nSmForPfTt;
      if nSmBlnTt <> 0 then
        FieldByName('SmBln').AsFloat := nSmBlnTt;
      FieldByName('SmToPF').AsFloat := nSmToPfTt;
      FieldByName('SmToPfPrp').AsFloat := nSmToPfPrpTt;
      FieldByName('CntDayInMes').AsInteger := nCntDaysTt;
      FieldByName('Stag').AsInteger := nStagZgTt;
      if nStagPpsTt <> 0 then
        FieldByName('StagPps').AsInteger := nStagPpsTt;
      if bIsPps then
        FieldByName('IsPps').AsBoolean := true;
      if bIsInv then
        FieldByName('IsInv').AsBoolean := true;
      FieldByName('Inv').AsInteger := -1;
      Post;
    end;
    AfterPost := cdsSpovAfterPost;
    //bCdsSpovReady := true;  // включается режим, "АвтоКалк"
    nDopStagZgMes := 0;
    if bIsMesNepolnZgStag then begin
      if nStagZgNepolnDn >= 30 then begin
        // каждые 30 дней считать полным месяцем (21-09-2006)
        while nStagZgNepolnDn >= 30 do begin
          nStagZgNepolnDn := nStagZgNepolnDn - 30;
          Inc(nDopStagZgMes);
        end;
      end; end
    else
      nDopStagZgMes := 0;     // т.к. все ушло в полные месяцы
    nStagZgMes := nStagZgMes + nDopStagZgMes;

    nDopStagPpsMes := 0;
    if bIsPps and bIsMesNepolnZgStag then begin
      if nStagPpsNepolnDn >= 30 then begin
        // каждые 30 дней считать полным месяцем (21-09-2006)
        while nStagPpsNepolnDn >= 30 do begin
          nStagPpsNepolnDn := nStagPpsNepolnDn - 30;
          Inc(nDopStagPpsMes);
        end;
      end; end
    else if bIsPps then
      nDopStagPpsMes := 0;    // т.к. все ушло в полные месяцы
    nStagPpsMes := nStagPpsMes + nDopStagPpsMes;
    cdsShapZgStagMes.AsInteger := nStagZgMes;
    cdsShapZgStagDn.AsInteger := nStagZgNepolnDn; {что осталось от вычитаний 30}
    if bIsPps then begin
      cdsShapEdIzm.AsInteger := 1;
      cdsShapNormaTrival.AsString := '12/0';
      cdsShapSpStagMis.AsInteger := nStagPpsMes;
      cdsShapSpStagDn.AsInteger := nStagPpsNepolnDn;
      cdsShapKdPidstavu.AsString := 'ЗНТ024А1';
      DecodeDate(dDtEndPpsStag, nY, nM, nD);
      cdsShapMisZaversh.AsInteger := nM;
    end;
    if dDtBegVidn > 0 then
      cdsShapDtBegVidn.AsDateTime := dDtBegVidn;
    if dDtEndVidn > 0 then
      cdsShapDtEndVidn.AsDateTime := dDtEndVidn;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.rBtnInvClick(Sender: TObject);
begin
  PereschetItogov;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.PereschetItogov;
begin
  with cdsSpov do begin
    if rBtnNeInv.Checked then begin
      cdsShapKdZboru.AsInteger := 1;
      Filter := 'Inv is Null or Inv <= 0';
      Filtered := true; end
    else begin
      cdsShapKdZboru.AsInteger := 2;
      Filter := 'Inv = -1 or Inv > 0';
      Filtered := true;
    end;
  end;
  RaschetCdsSpov;
end;
//------------------------------------------------------------------------------
procedure TFormSprSpov2.cdsSpovNewRecord(DataSet: TDataSet);
begin
  cdsSpov.Cancel;
end;

end.
