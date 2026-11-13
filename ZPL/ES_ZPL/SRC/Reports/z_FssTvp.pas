unit z_FssTvp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Grids, DBGrids, DBTables, ExtCtrls, StdCtrls,
  Buttons, Menus;

const
  PRTMODE_SHOW_MODAL  = 0;
  PRTMODE_ZAJAVKA     = 1;
  PRTMODE_APPX1       = 2;
  PRTMODE_SPLIT_APPX1 = 22;
  PRTMODE_NOTESP      = 3;
  PRTMODE_XML_DESEASE  = 4;
  PRTMODE_XML_ACCIDENT = 44;
  PRTMODE_XML_PREGNACY = 45;
  PRTMODE_PROT        = 5;
  PRTMODE_SPLIT_PROT  = 55;
  PRTMODE_REE2        = 6;
  PRTMODE_APPX3       = 7;
  PRTMODE_SPLIT_APPX3 = 77;
  PRTMODE_JSON_DESEASE  = 8;
  PRTMODE_JSON_ACCIDENT = 88;
  PRTMODE_JSON_PREGNACY = 89;
  PRTMODE_APPX2       = 9;
  PRTMODE_SPLIT_APPX2 = 99;

  BLN_REASON_NON_DIGIT_CHERN = 3;

type
  TFormFssTvp = class(TForm)
    Panel1: TPanel;
    QryVBln: TQuery;
    DsrcVBln: TDataSource;
    QryVBlnSPEC_NR: TIntegerField;
    QryVBlnNRLIST: TStringField;
    QryVBlnDTBEG: TDateTimeField;
    QryVBlnDTEND: TDateTimeField;
    QryVBlnTABN: TIntegerField;
    QryVBlnFAM: TStringField;
    QryVBlnIMA: TStringField;
    QryVBlnOTCH: TStringField;
    QryVBlnVIDN: TStringField;
    QryVBlnSHVIDN: TStringField;
    QryVBlnSUMMA: TFloatField;
    QryVBlnFamIO: TStringField;
    LabelCntRec: TLabel;
    QryVBlnCNTDAYS: TSmallintField;
    bBtnCancel: TBitBtn;
    sBtnPrt: TSpeedButton;
    QryVBlnKDSPS: TSmallintField;
    sBtnTts: TSpeedButton;
    popPrt: TPopupMenu;
    popPrtHead: TMenuItem;
    popPrtZajavka: TMenuItem;
    PopPrtAppx1: TMenuItem;
    QryVBlnPRICHINA: TSmallintField;
    UpdVBln: TUpdateSQL;
    Label7: TLabel;
    QryVBlnLISTCONT: TStringField;
    QryVBlnPREDSPEC_NR: TIntegerField;
    QryVBlnNRPREDLIST: TStringField;
    QryVBlnID: TStringField;
    QryVBlnPRBLN: TSmallintField;
    qryTmp: TQuery;
    QryVBlnSOVM: TSmallintField;
    QryVBlnSTGCMN: TFloatField;
    QryVBlnSTG12: TFloatField;
    popPrtPovidom: TMenuItem;
    pnlTop: TPanel;
    dbgrBln: TDBGrid;
    PanelTts: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LabelDay2603: TLabel;
    LabelDay2604: TLabel;
    LabelDay2602: TLabel;
    LabelDay2601: TLabel;
    LabelSm2603: TLabel;
    LabelSm2604: TLabel;
    LabelSm2602: TLabel;
    LabelSm2601: TLabel;
    sBtnClose: TSpeedButton;
    ChBoxShwOpen: TCheckBox;
    qryXML: TQuery;
    QryVBlnDtz: TDateTimeField;
    QryVBlnNrZ: TIntegerField;
    qryPgr: TQuery;
    QryVBlnSerList: TStringField;
    QryVBlnProcOpl: TFloatField;
    qryOtkl: TQuery;
    QryVBlnDigital: TStringField;
    QryVBlnAct_Dt: TDateTimeField;
    QryVBlnAct_Num: TStringField;
    procedure QryVBlnCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure sBtnTtsClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure dbgrBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popPrtZajavkaClick(Sender: TObject);
    procedure PopPrtAppx1Click(Sender: TObject);
    procedure popPrtPovidomClick(Sender: TObject);
    
  private
    d_DtPrc : TDateTime;

    nDay2601, nDay2602, nDay2603, nDay2604, Day2605, Day2606: SmallInt;
    nSmm2601, nSmm2602, nSmm2603, nSmm2604, Smm2605, Smm2606: Double;

    procedure PrintSplitProt(dDtPrc: TDateTime; qryBln: TQuery);
    procedure PrintSplitNotes(dDtPrc: TDateTime; qryBln: TQuery);
    procedure PrintSplitAppx3(dDtPrc: TDateTime; qryBln: TQuery);

    procedure WriteFssXml(
      dDtPrc : TDateTime; nNrz: SmallInt; dDtZ: TDateTime; PrtMode: word);
    procedure WriteFssJson(
      DtPrc : TDateTime; NrZ: SmallInt; DtZ: TDateTime; PrtMode: word);

    procedure OpenQryVBln(dDtPrc: TDateTime; nMode: integer);
    procedure OpenQryPgr(dDtPrc: TDateTime; nNrz: integer; nTipD: SmallInt);
    procedure CreXML2FSS(nKdTmpl: integer; cNameTmpl: ShortString);

    procedure WriteAppx3Block(var ResultFile: TextFile; nNrz: SmallInt; dDtZ: TDateTime);
    procedure GetOtklTotals(Nrz: integer; var Days: integer; var Sum: double);

    procedure SkipUntil(TagName: ShortString; var TmplFile: TextFile);
    procedure CopyUntil(TagName: ShortString; var TmplFile, ResultFile: TextFile);

    function FetchTagName(Tag: string): ShortString;

    class procedure WriteTag(tagName: string; nPp: integer; text: string;
      var ResultFile: TextFile);
  public
    class procedure OpenQryOtkl(Query: TQuery; SpecNr: Integer;
      Sovm: ShortString);
  end;

procedure ZajavkaFss(dDtPrc: TDateTime; nMode: Byte; nNrz: SmallInt; dDtZ: TDateTime);

const SECTION = 'z_FssTvp';

var
  FormFssTvp: TFormFssTvp;

implementation

uses
  Math, a_Const, a_Dm, z_Dm, z_Main, a_Lib, z_CmnPrt,
  BlnAppx1_1, BlnAppx1_2, BlnAppx1_3,
  DebugUtils, QryLib, DateLib, TextLib,
  JsonArray, JsonDate, JsonNumber, JsonObject, JsonString, BlnReqCalc;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ZajavkaFss(
  dDtPrc: TDateTime;
  nMode: Byte;
  nNrz: SmallInt;
  dDtZ: TDateTime
);
var
  nY, nM, nD      : Word;
  SumPr2, SumPr5 : double;
  BlnAppx1Res: TBlnAppx1Res;
  BlnAppx2Res: TBlnAppx2Res;
  BlnAppx3Res: TBlnAppx3Res;
begin
  Screen.Cursor := crHourGlass;

  FormFssTvp := TFormFssTvp.Create(Application);

  with FormFssTvp do begin
    d_DtPrc := dDtPrc;
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Заявка-розрахунок в ФСС з ТВП за ' + UkrMes(nM) + ' ' +
                                                    IntToStr(nY) + ' р.';
    OpenQryVBln(dDtPrc, nMode);
    Sumpr2 := 0;
    Sumpr5 := 0;

    OpenQryPgr(dDtPrc, 0, 2);
    if qryPgr.RecordCount > 0 then begin
      With qryPgr do begin
        Sumpr2 := SumPr2 + FieldByName('Summa').AsFloat;
        Next;
      end;
    end;

    OpenQryPgr(dDtPrc, 0, 5);
    if qryPgr.RecordCount > 0 then begin
      With qryPgr do begin
        Sumpr5 := SumPr5 + FieldByName('Summa').AsFloat;
        Next;
      end;
    end;

    Case nMode of
      PRTMODE_SHOW_MODAL:
        ShowModal;

      PRTMODE_ZAJAVKA:
        TBlnReqCalc.Run(d_DtPrc, nDay2601, nDay2602, nDay2603, nDay2604,
          nSmm2601, nSmm2602, nSmm2603, nSmm2604, sumPr2, Sumpr5);

      PRTMODE_APPX1:
        begin
          BlnAppx1Res := TPrtBlnAppx1.Run(d_DtPrc, QryVBln, -1);

          with BlnAppx1Res do
          TBlnReqCalc.Run(d_DtPrc, 0, DaysPregn, 0, DaysSick,
            0, SumPregn, 0, SumSick, 0, 0, 0, 0);
        end;

      PRTMODE_SPLIT_APPX1:
        PrintSplitNotes(d_DtPrc, QryVBln); {z_CmnPrt}

      PRTMODE_APPX2:
        begin
          BlnAppx2Res := TPrtBlnAppx2.Run(d_DtPrc, QryVBln, -1); {z_CmnPrt}

          with BlnAppx2Res do
          TBlnReqCalc.Run(d_DtPrc, 0, DaysPregn, 0, 0,
            0, SumPregn, 0, 0, 0, 0, 0, 0);
        end;

      PRTMODE_SPLIT_APPX2:
        PrintSplitNotes(d_DtPrc, QryVBln); {z_CmnPrt}

      PRTMODE_APPX3:
        begin
          BlnAppx3Res := TRptBlnAppx3.Run(d_DtPrc, -1, QryVBln);

          TBlnReqCalc.Run(d_DtPrc, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, BlnAppx3Res.Days, BlnAppx3Res.Sum);
        end;

      PRTMODE_SPLIT_APPX3:
        PrintSplitAppx3(d_DtPrc, QryVBln);

      PRTMODE_NOTESP:
        F6PrtFssNotesP(d_DtPrc, QryVBln); {z_CmnPrt}

      PRTMODE_PROT:
        F6PrtFssProt(d_DtPrc, QryVBln, -1); {z_CmnPrt}

      PRTMODE_SPLIT_PROT:
        PrintSplitProt(d_DtPrc, QryVBln);

      PRTMODE_REE2:
        F6PrtFssRee2(d_DtPrc, QryVBln);   {z_CmnPrt}

      PRTMODE_XML_DESEASE, PRTMODE_XML_PREGNACY, PRTMODE_XML_ACCIDENT:
        WriteFssXml(dDtPrc, nNrz, dDtZ, nMode);

      PRTMODE_JSON_DESEASE, PRTMODE_JSON_PREGNACY, PRTMODE_JSON_ACCIDENT:
        WriteFssJson(dDtPrc, nNrz, dDtZ, nMode);
    end;

    Free;
  end;

  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
class procedure TFormFssTvp.OpenQryOtkl(
  Query: TQuery;
  SpecNr: Integer;
  Sovm: ShortString
);
begin
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select o.VidN, o.Dt_Beg, o.Dt_End, o.Spec_NR, n.Summa ' +
      'from ViOtkl o ' +
        'join z_Nu n on n.Tabn = o.Tabn ' +
          'and n.Spec_Nr = o.Spec_Nr ' +
          'and n.Dt_Beg = o.Dt_Beg ' +
          'and n.Dt_End = o.Dt_End ' +
          'and (n.Sovm = o.Otkl_Sovm ' +
            'or (n.Sovm = "" or n.Sovm = "0" or n.Sovm is null) ' +
            'and (o.Otkl_Sovm = "" or o.Otkl_Sovm is null)' +
          ') ' +
      'where ' +
        'o.Spec_NR = :Spec_NR ');

    if Sovm = 'Y' then
      SQL.Add('and o.Otkl_Sovm = "Y"')
    else
      SQL.Add(
        'and (o.Otkl_Sovm = "" or n.Sovm = "0" or o.Otkl_Sovm is NULL)');

    ParamByName('Spec_NR').AsInteger := SpecNR;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.PrintSplitProt(
  dDtPrc: TDateTime;
  qryBln: TQuery
);
begin
  with qryBln do begin
    First;

    while not Eof do
      F6PrtFssProt(dDtPrc, qryBln, FieldByName('NrZ').AsInteger); {z_CmnPrt}
      // Next выполняется внутри F6PrtFssProt
  end;
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.PrintSplitNotes(
  dDtPrc: TDateTime;
  qryBln: TQuery);
begin
  with qryBln do begin
    First;
    while not Eof do begin
      TPrtBlnAppx1.Run(d_DtPrc, qryBln, FieldByName('NrZ').AsInteger);
      // Next выполняется внутри F6PrtFssNotes
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.PrintSplitAppx3(dDtPrc: TDateTime; qryBln: TQuery);
begin
  with qryBln do begin
    First;
    while not Eof do begin
      TRptBlnAppx3.Run(d_DtPrc, FieldByName('NrZ').AsInteger, qryBln);
      // Next выполняется внутри F6PrtFssNotes
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.WriteFssXml(
  dDtPrc: TDateTime;
  nNrz: SmallInt;
  dDtZ: TDateTime;
  PrtMode: word);
var
  nY, nM, nD: Word;
  cMnth, cYear, cNrZ: ShortString;

  cFileName: string;
  FileTempl, FileResult: TextFile;
  cXmlStr: string;

  dDtBeg, dDtEnd: TDateTime;
  nCntWorkDays, nCntWorkChas: double;
  nSpecNr: integer;

  nFoN, nPrBln: SmallInt;
  nPp, i: Integer;

  nSmmTts, nSmmFnd, nSmmChern: double;
  nDaysTts, nDaysFnd, nDaysChern, nCntDay: integer;

  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure ProcessOtkl(cSovm: string; bDigital: boolean);

    //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure WriteBlnOtkl(
      bSovm: boolean);
    var
      nZO: SmallInt;
    begin
      Inc(nPp);

      with QryVBln do begin
        WriteTag('T1RXXXXG1' , nPp, IntToStr(nPp), FileResult);
        WriteTag('T1RXXXXG2S', nPp, FieldByName('Fam').AsString, FileResult);
        WriteTag('T1RXXXXG3S', nPp, FieldByName('Ima').AsString, FileResult);
        WriteTag('T1RXXXXG4S', nPp, FieldByName('Otch').AsString, FileResult);
        WriteTag('T1RXXXXG5S', nPp, FieldByName('ID').AsString, FileResult);

        if not bSovm then
          nZO := 1
        else
          nZO := 2;
        WriteTag('T1RXXXXG6' , nPp, IntToStr(nZO), FileResult);

        WriteTag('T1RXXXXG7S', nPp, FieldByName('SerList').AsString, FileResult);
        WriteTag('T1RXXXXG8S', nPp, FieldByName('NrList').AsString, FileResult);
        WriteTag('T1RXXXXG9' , nPp, IntToStr(nFoN), FileResult);
        WriteTag('T1RXXXXG10', nPp, IntToStr(nPrBln), FileResult);

        cXmlStr := DateToStr(dDtBeg);
        cXmlStr := Copy(cXmlStr, 1, 2) + '.' + Copy(cXmlStr, 4, 2) + '.' + Copy(cXmlStr, 7, 4);
        WriteTag('T1RXXXXG11D', nPp, cXmlStr, FileResult);

        cXmlStr := DateToStr(dDtEnd);
        cXmlStr := Copy(cXmlStr, 1, 2) + '.' + Copy(cXmlStr, 4, 2) + '.' + Copy(cXmlStr, 7, 4);
        WriteTag('T1RXXXXG12D', nPp, cXmlStr, FileResult);

        WriteTag('T1RXXXXG13', nPp, IntToStr(nDaysTts), FileResult);

        if nDaysFnd <> 0 then
          cXmlStr := IntToStr(nDaysFnd)
        else
          cXmlStr := '';
        WriteTag('T1RXXXXG14', nPp, cXmlStr, FileResult);

        WriteTag('T1RXXXXG15', nPp, FloatToStr(nSmmTts), FileResult);

        if nSmmFnd <> 0 then
          cXmlStr := FloatToStr(nSmmFnd)
        else
          cXmlStr := '';
        WriteTag('T1RXXXXG16', nPp, cXmlStr, FileResult);

        WriteTag('T1RXXXXG17', nPp, IntToStr(nDaysChern), FileResult);
        WriteTag('T1RXXXXG18', nPp, FloatToStr(nSmmChern), FileResult);
        WriteTag('T1RXXXXG21', nPp, FieldByName('StgCmn').AsString, FileResult);
        WriteTag('T1RXXXXG22', nPp, FieldByName('Stg12').AsString, FileResult);
      end; {with}
    end; {WriteBlnOtkl}

  begin
    OpenQryOtkl(qryOtkl, nSpecNr, cSovm);

    nSmmTts := 0;
    nSmmFnd := 0;
    nDaysFnd := 0;
    nSmmChern := 0;
    nDaysChern := 0;

    with qryOtkl do begin
      while not Eof do begin
        nSmmTts := nSmmTts + FieldByName('Summa').AsFloat;

        // SB 23.3.2026 По аналогии, наверное, и 2606
        if (FieldByName('VidN').AsString <> '2603')
          and (FieldByName('VidN').AsString <> '2606') then
        begin
          DmMain.GetCntWrkDaysBln(FieldByName('Dt_Beg').AsDateTime,
            FieldByName('Dt_End').AsDateTime,
            nCntWorkDays, nCntWorkChas, 'blk');

          nDaysFnd := nDaysFnd + Round(nCntWorkDays);
          nSmmFnd := nSmmFnd + FieldByName('Summa').AsFloat;
        end;

        if (nPrBln = 3) and not bDigital {Черноб} then begin
          nSmmChern := FieldByName('Summa').AsFloat;
          nDaysChern := nCntDay;
        end;

        Next;
      end; {while qryOtkl}
    end; {with qryOtkl}

    if nSmmTts <> 0 then
      WriteBlnOtkl(cSovm = 'Y');

    ReleaseQuery(qryOtkl);
  end; {ProcessOtkl}

begin
  // читаем файл шаблона из БД
  cFileName := cDirTemp + 'Xml2Fss.txt';
  if FileExists(cFileName) then
    DeleteFile(cFileName);

  if PrtMode = PRTMODE_XML_ACCIDENT then
    CreXML2FSS(381, cFileName)
  else
    CreXML2FSS(373, cFileName);

  AssignFile(FileTempl, cFileName);
  Reset(FileTempl);

  // открываем результирующи XML файл
  cFileName := cDirTemp + '510250043861328C11001011';
  DecodeDate(dDtPrc, nY, nM, nD);
  cMnth := IntToStr(nM);
  if nM < 10 then
    cMnth := '0' + cMnth;
  cFileName := cFileName + cMnth + '1';
  cYear := IntToStr(nY);
  cFileName := cFileName + cYear;
  cNrZ := IntToStr(nNrz);
  if nNrZ < 10 then
   cNrZ := '0' + cNrZ;
  cFileName := cFileName + cNrZ + '.XML';
  AssignFile(FileResult, cFileName);
  Rewrite(FileResult);

  if PrtMode = PRTMODE_XML_ACCIDENT then begin
    // Приложение 1.3
    GetOtklTotals(nNrz, nDaysFnd, nSmmFnd);

    CopyUntil('PERIOD_MONTH', FileTempl, FileResult);
    WriteLn(FileResult, '<PERIOD_MONTH>' + IntToStr(nM) + '</PERIOD_MONTH>');
    CopyUntil('PERIOD_YEAR', FileTempl, FileResult);
    WriteLn(FileResult, '<PERIOD_YEAR>' + cYear + '</PERIOD_YEAR>');

    CopyUntil('ACCEDENT_DAYS', FileTempl, FileResult);
    WriteLn(FileResult, '<ACCEDENT_DAYS>' + IntToStr(nDaysFnd) + '</ACCEDENT_DAYS>');

    CopyUntil('ACCEDENT_SUM', FileTempl, FileResult);
    WriteLn(FileResult, '<ACCEDENT_SUM>' + FloatToStr(nSmmFnd) + '</ACCEDENT_SUM>');

    CopyUntil('SUM_ALL', FileTempl, FileResult);
    WriteLn(FileResult, '<SUM_ALL>' + FloatToStr(nSmmFnd) + '</SUM_ALL>');

    CopyUntil('T3RXXXXG1', FileTempl, FileResult);

    WriteAppx3Block(FileResult, nNrz, dDtZ);

    SkipUntil('T3RXXXXG15', FileTempl);
    CopyUntil('', FileTempl, FileResult);
  end else begin
    // Приложение 1.1 (PRTMODE_XML_APPX1)

    // Стандартное х.з чё. 8 строк.
    for i := 1 to 8 do begin
     ReadLn(FileTempl, cXmlStr);
     WriteLn(FileResult, cXmlStr);
    end;

    // Месяц, год.
    ReadLn(FileTempl, cXmlStr);
    WriteLn(FileResult, '<PERIOD_MONTH>' + cMnth + '</PERIOD_MONTH>');

    ReadLn(FileTempl, cXmlStr);
    WriteLn(FileResult, cXmlStr);

    ReadLn(FileTempl, cXmlStr);
    WriteLn(FileResult, '<PERIOD_YEAR>' + cYear + '</PERIOD_YEAR>');

    // Реквизиты, ректор, гл.бухг., казначейство.
    for i := 1 to 15 do begin
     ReadLn(FileTempl, cXmlStr);
     WriteLn(FileResult, cXmlStr);
    end;

    // Количество дней и сумма TVP.
    ReadLn(FileTempl, cXmlStr);
    WriteLn(FileResult, '<TVP_DAYS>' + IntToStr(nDay2604) + '</TVP_DAYS>');

    ReadLn(FileTempl, cXmlStr);
    WriteLn(FileResult, '<TVP_SUM>' + FloatToStr(nSmm2604) + '</TVP_SUM>');

    for i := 1 to 10 do begin
     ReadLn(FileTempl, cXmlStr);
     WriteLn(FileResult, cXmlStr);
    end;

    ReadLn(FileTempl, cXmlStr);
    WriteLn(FileResult, '<SUM_ALL>' + FloatToStr(nSmm2604) + '</SUM_ALL>');

    for i := 1 to 26 do begin
     ReadLn(FileTempl, cXmlStr);
     WriteLn(FileResult, cXmlStr);
    end;

    with QryVBln do begin
      DisableControls;
      First;

      nPp := 0;
      while not Eof do begin
        if (FieldByName('NrZ').AsInteger = nNrz) and FieldByName('DtZ').IsNull then begin
          dDtBeg := FieldByName('DtBeg').AsDateTime;
          dDtEnd := FieldByName('DtEnd').AsDateTime;

          DmMain.GetCntWrkDaysBln(dDtBeg, dDtEnd, nCntWorkDays, nCntWorkChas, 'blk');
          nCntDay := Round(nCntWorkDays);
          nDaysTts := nCntDay;

          nSpecNr := FieldByName('Spec_NR').AsInteger;
          nPrBln := FieldByName('Prichina').AsInteger;

          if FieldByName('ListCont').IsNull then
            nFoN := 1
          else
            nFoN := FieldByName('ListCont').AsInteger + 1;

          ProcessOtkl('', QryVBln.FieldByName('Digital').AsString = 'Y'); // Основные
          ProcessOtkl('Y', QryVBln.FieldByName('Digital').AsString = 'Y'); // Совместительские
        end;

        Next;
      end;

      EnableControls;
    end;

    OpenQryPgr(dDtPrc, nNrz, 2);

    if qryPgr.RecordCount > 0 then begin
      with qryPgr do begin
        First;
        nPp := 0;

        while not Eof do begin
          if FieldByName('TipD').AsInteger = 2 then begin
            Inc(nPp);

            WriteTag('T2RXXXXG1' , nPp, IntToStr(nPp), FileResult);
            WriteTag('T2RXXXXG2S', nPp, FieldByName('FamP').AsString, FileResult);
            WriteTag('T2RXXXXG3S', nPp, FieldByName('ImaP').AsString, FileResult);
            WriteTag('T2RXXXXG4S', nPp, FieldByName('OtchP').AsString, FileResult);
            WriteTag('T2RXXXXG5S', nPp, FieldByName('IDP').AsString, FileResult);

            WriteTag('T2RXXXXG6S' , nPp, FieldByName('Fam').AsString, FileResult);
            WriteTag('T2RXXXXG7S' , nPp, FieldByName('Ima').AsString, FileResult);
            WriteTag('T2RXXXXG8S' , nPp, FieldByName('Otch').AsString, FileResult);
            WriteTag('T2RXXXXG9S' , nPp, FieldByName('SerDoc').AsString, FileResult);
            WriteTag('T2RXXXXG10S', nPp, FieldByName('NDoc').AsString, FileResult);
            WriteTag('T2RXXXXG11' , nPp, FloatToStr(FieldByName('Summa').AsFloat), FileResult);
            WriteTag('T2RXXXXG12' , nPp, '1', FileResult);

            Next;
          end;
        end; {while qryPgr}
      end; {with qryPgr}

      for i := 1 to 12 do
        ReadLn(FileTempl, cXmlStr);

    end else begin
      for i := 1 to 12 do begin
        ReadLn(FileTempl, cXmlStr);
        WriteLn(FileResult, cXmlStr);
      end;
    end;

    for i := 1 to 29 do begin
      ReadLn(FileTempl, cXmlStr);
      WriteLn(FileResult, cXmlStr);
    end;

    OpenQryPgr(dDtPrc, nNrz, 5);

    if qryPgr.RecordCount > 0 then begin
      With qryPgr do begin
        First;
        nPp := 0;

        while not Eof do begin
          If FieldByName('TipD').AsInteger = 5 then begin
            Inc(nPp);

            WriteTag('T5RXXXXG1' , nPp, IntToStr(nPp), FileResult);
            WriteTag('T5RXXXXG2S', nPp, FieldByName('Fam').AsString, FileResult);
            WriteTag('T5RXXXXG3S', nPp, FieldByName('Ima').AsString, FileResult);
            WriteTag('T5RXXXXG4S', nPp, FieldByName('Otch').AsString, FileResult);
            WriteTag('T5RXXXXG5S', nPp, FieldByName('ID').AsString, FileResult);
            WriteTag('T5RXXXXG6D', nPp, FormatDateTime('ddmmyyyy', FieldByName('DtAct').value), FileResult);
            WriteTag('T5RXXXXG7S', nPp, FieldByName('NrAct').AsString, FileResult);
            WriteTag('T5RXXXXG8S', nPp, FieldByName('SerDoc').AsString, FileResult);
            WriteTag('T5RXXXXG9S', nPp, FieldByName('NDoc').AsString, FileResult);
            WriteTag('T5RXXXXG10', nPp, FloatToStr(FieldByName('Summa').AsFloat), FileResult);

            Next;
          end;
        end;
      end;

      for i := 1 to 10 do
        ReadLn(FileTempl, cXmlStr);
    end else begin
      for i := 1 to 10 do begin
        ReadLn(FileTempl, cXmlStr);
        WriteLn(FileResult, cXmlStr);
      end;
    end; {if}

    while not EOF(FileTempl) do begin
      ReadLn(FileTempl, cXmlStr);
      WriteLn(FileResult, cXmlStr);
    end;
  end;

  CloseFile(FileTempl);
  CloseFile(FileResult);
  ShowMessage('XML документ для экспорта выведен в файл' + chr(13) + cFileName);
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.WriteAppx3Block(
  var ResultFile: TextFile;
  nNrz: SmallInt;
  dDtZ: TDateTime
);
var
  nPp: integer;
  dDtBeg, dDtEnd: TDateTime;
  nCntWorkDays, nCntWorkChas: double;
  nCntDay, nDaysFnd, nDaysChern, nSpecNr, nPrBln, nFoN: integer;
  nSmmTts, nSmmFnd, nSmmChern: double;
  Value: string;

  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure WriteAppx3Empl(cSovm: string; bDigital: boolean);

    //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure WriteAppx3Otkl(
      bSovm: boolean);
    var
      nZO: SmallInt;
    begin
      Inc(nPp);

      with QryVBln do begin
        WriteTag('T3RXXXXG1' , nPp, IntToStr(nPp), ResultFile);
        WriteTag('T3RXXXXG2S', nPp, FieldByName('Fam').AsString, ResultFile);
        WriteTag('T3RXXXXG3S', nPp, FieldByName('Ima').AsString, ResultFile);
        WriteTag('T3RXXXXG4S', nPp, FieldByName('Otch').AsString, ResultFile);
        WriteTag('T3RXXXXG5S', nPp, FieldByName('ID').AsString, ResultFile);

        if not bSovm then
          nZO := 1
        else
          nZO := 2;
        WriteTag('T3RXXXXG6' , nPp, IntToStr(nZO), ResultFile);

        Value := DateToStr(FieldByName('Act_Dt').AsDateTime);
        Value := Copy(Value, 1, 2) + Copy(Value, 4, 2) + Copy(Value, 7, 4);
        WriteTag('T3RXXXXG7D', nPp, Value, ResultFile);
        WriteTag('T3RXXXXG8S', nPp, FieldByName('Act_Num').AsString, ResultFile);
        WriteTag('T3RXXXXG9S', nPp, FieldByName('SerList').AsString, ResultFile);
        WriteTag('T3RXXXXG10S', nPp, FieldByName('NrList').AsString, ResultFile);
        WriteTag('T3RXXXXG11', nPp, IntToStr(nPrBln), ResultFile);

        Value := DateToStr(dDtBeg);
        Value := Copy(Value, 1, 2) + Copy(Value, 4, 2) + Copy(Value, 7, 4);
        WriteTag('T3RXXXXG12D', nPp, Value, ResultFile);

        Value := DateToStr(dDtEnd);
        Value := Copy(Value, 1, 2) + Copy(Value, 4, 2) + Copy(Value, 7, 4);
        WriteTag('T3RXXXXG13D', nPp, Value, ResultFile);

        if nDaysFnd <> 0 then
          Value := IntToStr(nDaysFnd)
        else
          Value := '';
        WriteTag('T3RXXXXG14', nPp, Value, ResultFile);

        if nSmmFnd <> 0 then
          Value := FloatToStr(nSmmFnd)
        else
          Value := '';
        WriteTag('T3RXXXXG15', nPp, Value, ResultFile);
      end; {with}
    end; {WriteAppx3Otkl}

  begin
    OpenQryOtkl(qryOtkl, nSpecNr, cSovm);

    nSmmTts := 0;
    nSmmFnd := 0;
    nDaysFnd := 0;
    nSmmChern := 0;
    nDaysChern := 0;

    with qryOtkl do begin
      while not Eof do begin
        nSmmTts := nSmmTts + FieldByName('Summa').AsFloat;

        // SB 23.3.2026 По аналогии, наверное, и 2606
        if (FieldByName('VidN').AsString <> '2603')
          and (FieldByName('VidN').AsString <> '2606') then
        begin
          DmMain.GetCntWrkDaysBln(FieldByName('Dt_Beg').AsDateTime,
            FieldByName('Dt_End').AsDateTime,
            nCntWorkDays, nCntWorkChas, 'blk');

          nDaysFnd := nDaysFnd + Round(nCntWorkDays);
          nSmmFnd := nSmmFnd + FieldByName('Summa').AsFloat;
        end;

        // Черноб 
        if (nPrBln = 3) and not bDigital then begin
          nSmmChern := FieldByName('Summa').AsFloat;
          nDaysChern := nCntDay;
        end;

        Next;
      end;
    end;

    if nSmmTts <> 0 then
      WriteAppx3Otkl(cSovm = 'Y');

    ReleaseQuery(qryOtkl);
  end;

begin
  with QryVBln do begin
    DisableControls;
    First;

    nPp := 0;
    while not Eof do begin
      if (FieldByName('NrZ').AsInteger = nNrz) and FieldByName('DtZ').IsNull then begin
        dDtBeg := FieldByName('DtBeg').AsDateTime;
        dDtEnd := FieldByName('DtEnd').AsDateTime;

        DmMain.GetCntWrkDaysBln(dDtBeg, dDtEnd, nCntWorkDays, nCntWorkChas, 'blk');
        nCntDay := Round(nCntWorkDays);

        nSpecNr := FieldByName('Spec_NR').AsInteger;
        nPrBln := FieldByName('Prichina').AsInteger;

        if FieldByName('ListCont').IsNull then
          nFoN := 1
        else
          nFoN := FieldByName('ListCont').AsInteger + 1;

        // Основные
        WriteAppx3Empl('', QryVBln.FieldByName('Digital').AsString = 'Y');
        // Совместительские
        WriteAppx3Empl('Y', QryVBln.FieldByName('Digital').AsString = 'Y');
      end;

      Next;
    end;

    EnableControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.GetOtklTotals(Nrz: integer; var Days: integer; var Sum: double);
var
  nSpecNr: integer;
begin
  Days := 0;
  Sum := 0;

  QryUtils.InitQuery(qryOtkl);

  with qryOtkl do
    SQL.Add(
      'select n.* ' +
      'from z_vbln b join z_nu n on n.TabN = b.TabN ' +
        'and n.Spec_Nr = b.Spec_NR ' +
      'where b.Spec_Nr = :Spec_Nr and VidN = "2605"');

  with QryVBln do begin
    First;

    while not Eof do begin
      if (FieldByName('NrZ').AsInteger = Nrz) and FieldByName('DtZ').IsNull then begin
        nSpecNr := FieldByName('Spec_NR').AsInteger;

        with qryOtkl do begin
          ParamByName('Spec_Nr').AsInteger := nSpecNr;
          Open;

          while not Eof do begin
            Days := Days + Trunc(FieldByName('Dt_End').AsDateTime - FieldByName('Dt_Beg').AsDateTime) + 1;
            Sum := Sum + FieldByName('Summa').AsFloat;

            Next;
          end;

          Close;
        end;
      end;

      Next;
    end;
  end;

  QryUtils.ReleaseQuery(qryOtkl);
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.OpenQryPgr(
  dDtPrc: TDateTime;
  nNrz: integer;
  nTipD: smallint);
var
  cAddCond: ShortString;
begin
  InitQuery(qryPgr);

  with qryPgr do begin
    if nNrZ = 0 then
      cAddCond := ''
    else
      cAddCond := 'and n.NrZ = :nNrZ ';

    SQL.Add(
      'select n.*, u.Fam, u.Ima, u.Otch, u.ID from Z_Exp_Fss n ' +
        'left join z_Upi u on u.TabN = n.Tabn ' +
      'where n.DtProc = :dDtPrc ' +
        cAddCond +
        'and n.TipD = :nTipD ' +
      'order by n.TabN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    If nNrZ <> 0 then
      ParamByName('nNrz').AsInteger  := nNrz;
    ParamByName('nTipd').AsInteger   := nTipD;
    Open;
 end;
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.OpenQryVBln(
  dDtPrc: TDateTime;
  nMode: integer
);
const
  PREGNACY =
  '(' +
    'b.Digital = "Y" and b.PrBln = 2 or ' +
    '(b.Digital = "N" or b.Digital is null) and  b.PrBln = 8' +
  ')';

  ACCIDENT =
  '(' +
    'b.Digital = "Y" and (b.PrBln = 11 or b.PrBln = 12) or ' +
    '(b.Digital = "N" or b.Digital is null) and (b.PrBln = 2 or b.PrBln = 4)' +
  ')';
var
  VidN, cCase : ShortString; nCntDay, SickCause: SmallInt;
  nCntWorkDays, nCntWorkChas : double;
begin
  QryUtils.InitQuery(QryVBln);

  with QryVBln do begin
    SQL.Add(
      'select b.DtProc, b.TabN, b.VidN, b.SmSrDn, b.SmBln Summa, v.ShVidN, ' +
        'b.Spec_NR, b.KdSps, b.NrList, b.SerList, b.ListCont, b.ProcOpl, ' +
        'b.PredSpec_NR, b2.NrList as NrPredList, ' +
        'b.CntDays, b.DtBeg, b.DtEnd, ' +
        'p.Sovm, u.Fam, u.Ima, u.Otch, u.ID, ' +
        'b.StgCmn, b.Stg12, b.DtZ, b.NrZ, b.PrBln, b.PrBln as Prichina, ' +
        'b.Digital, b.Act_Dt, b.Act_Num ' +
      'from Z_VBln b '+
        'left join z_Upi u on u.TabN = b.Tabn ' +
        'left join Get_Wrk_Pere(b.TabN, :DtPrc) p on 1=1 '+
        'left join z_KdVidN v on v.VidN = b.VidN '+
        'left join z_VBln b2 on b2.Spec_NR = b.PredSpec_NR ' +
      'where b.DtProc = :DtPrc'
    );

    // Общие больничные
    if (nMode = PRTMODE_APPX1) or (nMode = PRTMODE_SPLIT_APPX1)
      or (nMode = PRTMODE_XML_DESEASE) or (nMode = PRTMODE_JSON_DESEASE)
    then
      SQL.Add(
        'and not ' + PREGNACY + ' ' +
        'and not ' + ACCIDENT
      )
    // Декретные
    else if (nMode = PRTMODE_APPX2) or (nMode = PRTMODE_SPLIT_APPX2)
      or (nMode = PRTMODE_XML_PREGNACY) or (nMode = PRTMODE_JSON_PREGNACY)
    then
      SQL.Add(
        'and ' + PREGNACY
      )
    // Несчастные случаи на производстве и проф.заболевания)
    else if (nMode = PRTMODE_APPX3) or (nMode = PRTMODE_SPLIT_APPX3)
      or (nMode = PRTMODE_XML_ACCIDENT) or (nMode = PRTMODE_JSON_ACCIDENT)
    then
      SQL.Add(
        'and ' + ACCIDENT
      );

    if (nMode = PRTMODE_SPLIT_PROT)
      or (nMode = PRTMODE_SPLIT_APPX1)
      or (nMode = PRTMODE_SPLIT_APPX2)
      or (nMode = PRTMODE_SPLIT_APPX3)
    then
      SQL.Add(
        'order by ' +
          'b.NrZ, u.Fam, u.Ima, u.Otch, b.TabN, b.DtBeg, b.NrList, b.VidN'
      )
    else
      SQL.Add(
        'order by ' +
          'u.Fam, u.Ima, u.Otch, b.TabN, b.DtBeg, b.NrList, b.VidN'
      );

    ParamByName('DtPrc').AsDateTime := dDtPrc;
    Open;

    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    nDay2601 := 0;
    nDay2602 := 0;
    nDay2603 := 0;
    nDay2604 := 0;
    Day2605  := 0;
    Day2606  := 0;
    nSmm2601 := 0;
    nSmm2602 := 0;
    nSmm2603 := 0;
    nSmm2604 := 0;
    Smm2605  := 0;
    Smm2606  := 0;

    while not Eof do begin
      VidN := QryVBlnVidN.AsString;
      if VidN = '2602' then
        // декретные
        cCase := 'dkr'
      else
        // больничные
        cCase := 'bln';

      DmMain.GetCntWrkDaysBln(QryVBlnDtBeg.AsDateTime,
        QryVBlnDtEnd.AsDateTime, nCntWorkDays, nCntWorkChas, cCase);

      nCntDay := Round(nCntWorkDays);

      // по уходу за ребенком
      if VidN = '2601' then begin
        nSmm2601 := nSmm2601 + QryVBlnSumma.AsFloat;
        nDay2601 := nDay2601 + nCntDay;
      end

      // декретные
      else if VidN = '2602' then begin
        nSmm2602 := nSmm2602 + QryVBlnSumma.AsFloat;
        nDay2602 := nDay2602 + nCntDay;
      end

      // первые 5 дней больничных за счёт предприятия
      else if VidN = '2603' then begin
        nSmm2603 := nSmm2603 + QryVBlnSumma.AsFloat;
        nDay2603 := nDay2603 + nCntDay;
      end

      // остальные больничные за счёт пенс.фонда
      else if VidN = '2604' then begin
        nSmm2604 := nSmm2604 + QryVBlnSumma.AsFloat;
        nDay2604 := nDay2604 + nCntDay;;
      end

      // остальные травмы и проф.забол. за счёт пенс.фонда
      else if VidN = '2605' then begin
        Smm2605 := Smm2605 + QryVBlnSumma.AsFloat;
        Day2605 := Day2605 + nCntDay;;
      end

      // первые 17 дней травм и проф.забол.
      else if VidN = '2606' then begin
        Smm2606 := Smm2606 + QryVBlnSumma.AsFloat;
        Day2606 := Day2606 + nCntDay;
      end;

      if not QryVBlnPrBln.IsNull then
        SickCause := QryVBlnPrBln.AsInteger
      else begin
        if VidN = '2601' then
          // по уходу за ребенком
          SickCause := 10
        else if VidN = '2602' then
          // декретные
          SickCause := 8
        else if (VidN = '2003') or (VidN = '2604') then
          // общие заболевания
          SickCause := 1
        else if (VidN = '2605') or (VidN = '2606') then
          // несч.случаи и проф.заболевания
          SickCause := 2;

        Edit;
        QryVBlnPrichina.AsInteger := SickCause;
        Post;
      end;

      Next;
    end;

    First;
  end;

  LabelDay2601.Caption := IntToStr(nDay2601);
  LabelDay2602.Caption := IntToStr(nDay2602);
  LabelDay2603.Caption := IntToStr(nDay2603);
  LabelDay2604.Caption := IntToStr(nDay2604);
  LabelSm2601.Caption := FloatToStrF(nSmm2601, ffCurrency, 18, 2);
  LabelSm2602.Caption := FloatToStrF(nSmm2602, ffCurrency, 18, 2);
  LabelSm2603.Caption := FloatToStrF(nSmm2603, ffCurrency, 18, 2);
  LabelSm2604.Caption := FloatToStrF(nSmm2604, ffCurrency, 18, 2);
  PanelTts.Visible := ChBoxShwOpen.Checked;
end;
//------------------------------------------------------------------------------
procedure TFormFssTvp.QryVBlnCalcFields(DataSet: TDataSet);
begin
  QryVBlnFamIO.AsString := MyFamIO(
    QryVBlnFam.AsString, QryVBlnIma.AsString, QryVBlnOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormFssTvp.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 456);
    Width  := ReadInteger(SECTION, 'wW', 775);
    ChBoxShwOpen.Checked := ReadBool(SECTION, 'bShwOpen', true);
    Free;
  end;
  if FileExists(cDirVids + 'Z_Bln01.vid') then
    dbgrBln.Columns.LoadFromFile(cDirVids + 'Z_Bln01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormFssTvp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrBln.Columns.SaveToFile(cDirVids + 'Z_Bln01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bShwOpen', ChBoxShwOpen.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFssTvp.FormResize(Sender: TObject);
begin
//  PanelTts.Top  := Round((Height - PanelTts.Height) / 2);
//  PanelTts.Left := Round((Width - PanelTts.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormFssTvp.sBtnTtsClick(Sender: TObject);
begin
  PanelTts.Visible := not PanelTts.Visible;
end;
//------------------------------------------------------------------------------
procedure TFormFssTvp.sBtnPrtClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnPrt.Top + 48;
  Y := Left + sBtnPrt.Left + 3;
  popPrt.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormFssTvp.dbgrBlnDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrBln.Canvas do begin
    if not (gdFocused in State) then begin
      if (cFldNm = 'SUMMA') and (Column.Field.Value < 0) then
        Font.Color := clRed
      else
        if ((cFldNm = 'VIDN') or (cFldNm = 'SHVIDN') or (cFldNm = 'NRPREDLIST'))
          and not QryVBlnNrPredList.IsNull
          and (QryVBlnListCont.AsInteger > 0)
        then
          Brush.Color := clYellow;
    end;
  end;
  dbgrBln.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormFssTvp.popPrtZajavkaClick(Sender: TObject);
begin
  TBlnReqCalc.Run(d_DtPrc, nDay2601, nDay2602, nDay2603, nDay2604,
    nSmm2601, nSmm2602, nSmm2603, nSmm2604, 0, 0);
end;
//------------------------------------------------------------------------------
procedure TFormFssTvp.PopPrtAppx1Click(Sender: TObject);
begin
  TPrtBlnAppx1.Run(d_DtPrc, QryVBln, -1);    {z_CmnPrt}
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.popPrtPovidomClick(Sender: TObject);
begin
  F6PrtFssNotesP(d_DtPrc, QryVBln);    {z_CmnPrt}
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.CreXML2FSS(nKdTmpl: integer; cNameTmpl: ShortString);
begin
  InitQuery(qryXML);
  with qryXML do begin
    SQL.Add(
      'select FVid from Ex_Tmplts where KdTmpl = :KdTmpl');
    ParamByName('KdTmpl').AsInteger := nKdTmpl;
    Open;
    if RecordCount > 0 then
      (FieldByName('FVid') as TBlobField).SaveToFile(cNameTmpl)
    else
      ShowMessage('Шаблон файла (код 373 )в таблице Ex_Tmplts не найден.');
  end;
  ReleaseQuery(qryXML);
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.SkipUntil(TagName: ShortString; var TmplFile: TextFile);
var
  Tag: string;
begin
  while not Eof(TmplFile) do begin
    ReadLn(TmplFile, Tag);

    if FetchTagName(Tag) = TagName then
      exit;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.CopyUntil(TagName: ShortString; var TmplFile, ResultFile: TextFile);
var
  Tag: string;
begin
  while not Eof(TmplFile) do begin
    ReadLn(TmplFile, Tag);

    if FetchTagName(Tag) = TagName then
      exit;

    WriteLn(ResultFile, Tag);
  end;
end;

//------------------------------------------------------------------------------
function TFormFssTvp.FetchTagName(Tag: string): ShortString;
var
  Position, SpacePos: integer;
begin
  Result := '';
  Tag := Trim(Tag);

  if Copy(Tag, 1, 1) = '<' then begin
    Position := Pos('>', Tag);
    SpacePos := Pos(' ', Tag);

    if Position = 0 then
      Position := SpacePos
    else if SpacePos <> 0 then
      Position := Min(Position, SpacePos);

    Result := Copy(Tag, 2, Position - 2);
  end;
end;

//------------------------------------------------------------------------------
class procedure TFormFssTvp.WriteTag(
  tagName: string; nPp: integer; text: string;
  var ResultFile: TextFile);
begin
  WriteLn(ResultFile,
    '<' + tagName + ' ROWNUM="' + IntToStr(nPp) + '">' + text + '</' + tagName +'>');
end;

//------------------------------------------------------------------------------
procedure TFormFssTvp.WriteFssJson(
  DtPrc : TDateTime; NrZ: SmallInt; DtZ: TDateTime; PrtMode: word);
var
  JsonRoot: TJsonArray;
  FileName: String;
  SpecNr: integer;

  DocChaes: ShortString;
  DtMsek: TDateTime;
  BlnReason,
  Benefit, Cause: word;
  CauseAdd: ShortString;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure ProcessBlnSlice(Sovm: string; Digital: boolean);
  var
    FormatSettings: TFormatSettings;

    SumAll, SumPfu, SumChaes: double;
    Days, DaysAll, DaysPfu, DaysChaes: integer;

    WorkDays,
    DummyDouble: double;

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure WriteBlnOtkl(Sovm: boolean);
    var
      LnNum: ShortString;
      ZO: word;
      JsonCur: TJsonObject;
    begin
      if Sovm then
        ZO := 2
      else
        ZO := 1;

      LnNum := QryVBln.FieldByName('NrList').AsString;

      // Для основных записей используется только номер больничного, ...
      if Zo = 2 then
        // ... для совместительских добавляется '.1'.
        LnNum := LnNum + '.1';

      JsonCur := TJsonObject.Create;

      GetLocaleFormatSettings(0, FormatSettings);
      FormatSettings.ShortDateFormat := 'YYYY-MM-DD';

      with JsonCur do begin
        AddItem('WIC_NUM', TJsonString.Create(LnNum));
        AddItem('WIC_NUMBER_ALL', TJsonNumber.Create(DaysAll));
        AddItem('WIC_NUMBER_PFU', TJsonNumber.Create(DaysPfu));
        AddItem('WIC_SUMM_ALL', TJsonNumber.Create(SumAll));
        AddItem('WIC_SUMM_PFU', TJsonNumber.Create(SumPfu));
        AddItem('WIC_NUMBER_CHAES', TJsonNumber.Create(DaysChaes));
        AddItem('WIC_SUMM_CHAES', TJsonNumber.Create(SumChaes));
        AddItem('WIC_CH_NUM', TJsonString.Create(DocChaes));
        AddItem('WIC_MSEK_DT', TJsonDate.Create(DtMsek, FormatSettings));

        if Benefit <> 0 then
          AddItem('WIC_BENIFIT', TJsonNumber.Create(Benefit));
        if Cause <> 0 then
          AddItem('WIC_CAUSE', TJsonNumber.Create(Cause));

        AddItem('WIC_CAUSE_ADD', TJsonString.Create(CauseAdd));
      end;

      JsonRoot.AddItem(JsonCur);
    end;

  begin
    // Открываем начисления больничного.
    OpenQryOtkl(qryOtkl, SpecNr, Sovm);

    DaysAll := 0;
    SumAll := 0;
    DaysPfu := 0;
    SumPfu := 0;
    DaysChaes := 0;
    SumChaes := 0;

    with QryOtkl do begin
      while not Eof do begin
        DmMain.GetCntWrkDaysBln(FieldByName('Dt_Beg').AsDateTime,
          FieldByName('Dt_End').AsDateTime,
          WorkDays, DummyDouble, 'blk');

        Days := Round(WorkDays);

        DaysAll := DaysAll + Days;
        SumAll := SumAll + FieldByName('Summa').AsFloat;

        // SB 23.3.2026 По аналогии, наверное, и 2606
        if (FieldByName('VidN').AsString <> '2603')
          and (FieldByName('VidN').AsString <> '2606') then
        begin
          DaysPfu := DaysPfu + Days;
          SumPfu := SumPfu + FieldByName('Summa').AsFloat;
        end;

        if (BlnReason = BLN_REASON_NON_DIGIT_CHERN) and not Digital then begin
          DaysChaes := DaysChaes + Days;
          SumChaes := SumChaes + FieldByName('Summa').AsFloat;
        end;

        Next;
      end;
    end;

    if SumAll <> 0 then
      WriteBlnOtkl(Sovm = 'Y');

    ReleaseQuery(QryOtkl);
  end;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure ProcessBln(Digital: boolean);
  begin
    // Основные
    ProcessBlnSlice('', Digital);
    // Совместительские
    ProcessBlnSlice('Y', Digital);
  end;

begin
  JsonRoot := TJsonArray.Create;

  // Приложения 1.1, 1.2, 1.3
  with QryVBln do begin
    DisableControls;
    First;

    while not Eof do begin
      Benefit := 0;
      Cause := 0;
      CauseAdd := '';
      DocChaes := '';
      DtMsek := 0;

      BlnReason := 0;

      if (FieldByName('NrZ').AsInteger = NrZ)
          and FieldByName('DtZ').IsNull then begin

        SpecNr := FieldByName('Spec_NR').AsInteger;
        BlnReason := FieldByName('Prichina').AsInteger;

        ProcessBln(QryVBln.FieldByName('Digital').AsString = 'Y');
      end;

      Next;
    end;

    EnableControls;
  end;

  FileName := cDirTemp +
    'Заявка-расчёт_' + DateToStr(Now) + '_' + IntToStr(NrZ) + '.json';

  JsonRoot.WriteToFile(FileName);
  ShowMessage('XML документ для экспорта выведен в файл' + #13#10 + FileName);
end;

end.
