unit z_DfMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, IniFiles, Buttons, Mask, DBCtrls, ExtCtrls,
  Math, DB, DBTables, DBClient, Provider, Grids, DBGrids;

type
  String1 = string[1];
  String4 = string[4];
  TFormDfMain = class(TForm)
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeOrgEdrpou: TDBEdit;
    dbeOrgName: TDBEdit;
    dbeDir_ID: TDBEdit;
    dbeDir_Phone: TDBEdit;
    dbeDir_FIO: TDBEdit;
    dbeBuh_ID: TDBEdit;
    dbeBuh_Phone: TDBEdit;
    dbeBuh_FIO: TDBEdit;
    dbeDpiEdrpou: TDBEdit;
    dbeDpiName: TDBEdit;
    sBtnForward1: TSpeedButton;
    bBtnCancel1: TBitBtn;
    ts00: TTabSheet;
    Panel00: TPanel;
    MemoZpl: TMemo;
    sBtnForward00: TSpeedButton;
    bBtnCancel00: TBitBtn;
    Label2: TLabel;
    edKvart: TEdit;
    UpDownKvart: TUpDown;
    Label1: TLabel;
    edGod: TEdit;
    UpDownGod: TUpDown;
    Label3: TLabel;
    tblTmp: TTable;
    sBtnBack1: TSpeedButton;
    sBtnBack2: TSpeedButton;
    sBrnForward2: TSpeedButton;
    bBtnCancel2: TBitBtn;
    MemoDbg: TMemo;
    qryTmp: TQuery;
    cdsLgotu: TClientDataSet;
    StatusBar1: TStatusBar;
    qryRkvzt: TQuery;
    dsrcRkvzt: TDataSource;
    updRkvzt: TUpdateSQL;
    qryZNu: TQuery;
    LabelMsg: TLabel;
    qryZPrmUv: TQuery;
    qryIsRecOsnBD: TQuery;
    qryDop: TQuery;
    tblProm: TTable;
    Memo1: TMemo;
    tblPromNR: TAutoIncField;
    tblPromNP: TIntegerField;
    tblPromBadID: TStringField;
    tblPromfNU: TSmallintField;
    tblPromTIN: TStringField;
    tblPromSovm: TSmallintField;
    tblPromFam: TStringField;
    tblPromIma: TStringField;
    tblPromOtch: TStringField;
    tblPromS_NAR: TFloatField;
    tblPromS_DOX: TFloatField;
    tblPromS_TAXN: TFloatField;
    tblPromS_TAXP: TFloatField;
    tblPromOZN_DOX: TSmallintField;
    tblPromD_PRIYN: TDateField;
    tblPromD_ZVILN: TDateField;
    tblPromOZN_PILG: TSmallintField;
    tblPromOZNAKA: TSmallintField;
    tblPromDopRec: TStringField;
    qryZPere: TQuery;
    cdsLgotuOZN_PILG: TSmallintField;
    dsrcLgotu: TDataSource;
    dbgrLgotu: TDBGrid;
    qryLgotu: TQuery;
    qryKmd: TQuery;
    tblPromTabN: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBtnCancel1Click(Sender: TObject);
    procedure sBtnForward00Click(Sender: TObject);
    procedure sBtnForward1Click(Sender: TObject);
    procedure sBtnBack1Click(Sender: TObject);
    procedure sBtnBack2Click(Sender: TObject);
    procedure sBrnForward2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbEdiEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
  private
    { Private declarations }
    mListNU, mListDir : TStringList;
    nMyId : SmallInt;
    procedure NewCreFiles(nKv, nYY : word);
    procedure CreTblDF(cTableName : string); // Создание таблицы d__KYY.db
    procedure tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg : integer;
                         cDirNm, cID, cFam, cIma, cOtch, cBadId : string;
                                   nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double;
                         dDtPriyn, dDtZviln : TDateTime; bNotInNwBD  : boolean);
                            {добавление DIR-месячной записи в таблицу d__KYY.db}
    procedure CreTblProm(cTableName : string);
    procedure AddRecToTblProm(cBadID, cfNU, cTIN, {добавляется запись в tblProm}
                                  cTabN, cFam, cIma, cOtch, cD_PRIYN, cD_ZVILN,
                                   cOZNAKA, cDopRec : ShortString;
                                    nSovm, nOZN_DOX, nOZN_PILG : SmallInt;
                                     nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double);
    procedure CreOpenDfId(cTableName : string);
    procedure tblDfIDAddRec(bAddNew : boolean;
                                     nRecNR, nSovm, nOznDox, nOznPilg : Integer;
                        cID, cTabN, cFam, cIma, cOtch, cBadId, cDopRec : string;
                                     nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double;
                                     dDtPriyn, dDtZviln : TDateTime);
        {добавляется квартальная запись в таблицу с идентификационными номерами}
    procedure CreOpenDfFio(cTableName : string);
    procedure tblDf1FIAddRec(nSovm, nOznDox, nOznPilg : Integer;
                                 cID, cTabN, cFam, cIma, cOtch, cBadId : string;
                                     nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double;
                                     dDtPriyn, dDtZviln : TDateTime);
               {добавляется квартальная запись в таблицу без идентиф. номеров}
    procedure OpenQryRkvzt;
    procedure SborFromNewBD(nKv, nYY : word);
    procedure GetPrmUvInf(nTabN : integer; dDtBeg, dDtEnd : TDateTime;
                                            var dDtPriyn, dDtZviln : TDateTime);
    function ItIsTin(cTin : ShortString) : boolean;
    function MyId: ShortString;
    function GetInfZPere(nTabN : integer; dDtBeg, dDtEnd : TDateTime;
                                              var nSovm : SmallInt) : boolean;
    procedure ChangePilgaInFNU(cTIN : ShortString;
                                               nFNU, nNewOznPilg : SmallInt);
    procedure CreOpenCdsLgotu(nTabN : integer; dDtPrc : TDateTime);
    procedure AddPrmUvInfoInTblDf(nTabN : integer);
  public
    { Public declarations }
  end;

procedure ShowFormDfMain;

const SECTION = 'z_dfMain';

var
  FormDfMain: TFormDfMain;
  cDfDirData, cDfDirDbfs,
  cDfDirD00, cDfDirD03,
  cDfDirResults, cDfDirProm, cDfFileProm, cDfFileUni,
  cDfFileId, cDfFileFi, cDfDirIND, cDfDirTemp, cDfDirDocs : ShortString;
  dDfDtBegKv, dDfDtEndKv : TDateTime;
  nCntDopDir : SmallInt;
  nPorog1, nPorog2, nPorog3, nCurPorog : double; // для порогов 1-3 месяца
                       // квартала. Вынес сюда, чтобы определялись один раз при
                       // расчете D_01 и использовались и для D_01, и для D_03

implementation

uses a_Const, a_DM, z_Dm, z_Main, a_Lib, z_DfZapr, z_dfZplR, z_TUpi, AppSettings;

{$R *.dfm}

procedure ShowFormDfMain;
begin
  if not bIsFormDfMain then begin
    FormDfMain := TFormDfMain.Create(Application);
    with FormDfMain do begin
      bIsFormDfPromResults := false;
      Constraints.MaxHeight := 370;
      OpenQryRkvzt;
      bIsFormDfMain := true;
      Show;   //ShowModal;
    end; end
  else begin
    if FormDfMain.WindowState = wsMinimized then
      FormDfMain.WindowState := wsNormal;
    FormDfMain.SetFocus;
    // Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.OpenQryRkvzt;
begin
  with qryRkvzt do begin
    if Active then Close;
    CachedUpdates := true;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_DfRkvzt');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.FormCreate(Sender: TObject);
var
  Drive: ShortString;
begin
  nCntDopDir := 3; // D_01, D_02, D_03

  if bFlagDbg or (AppSetts.UserId = 101) then
    Drive := DRIVE_FOR_REPORTS_DEBUG
  else
    Drive := DRIVE_FOR_REPORTS;
  cDfDirData := Drive + '\Df_SPOV\';

  if bFlagDbg then
    cDfDirDbfs := cDfDirData + 'DBG_DBFS\'
  else
    cDfDirDbfs := cDfDirData + 'DBFS\';
  cDfDirDocs := cDfDirData + 'DOCS\DF\';
  cDfDirTemp := cDfDirDbfs  + 'TEMP\';
  cDfDirD00  := cDfDirDbfs + 'D_00\';
  cDfDirD03  := cDfDirDbfs + 'D_03\';   // НИЧ
  cDfDirIND  := cDirInd; // та, что и в z_Main
  if not DirectoryExists('c:\T_E_M_P\') then
    ForceDirectories('c:\T_E_M_P\');  // на всякий случай
  if not DirectoryExists(cDfDirTemp) then
    ForceDirectories(cDfDirTemp);
  if not DirectoryExists(cDfDirDocs) then
    ForceDirectories(cDfDirDocs);
  if not DirectoryExists(cDfDirD00) then
    ForceDirectories(cDfDirD00);
  if not DirectoryExists(cDfDirD03) then
    ForceDirectories(cDfDirD03);
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := 370; //ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 330);
    UpDownKvart.Position := ReadInteger(SECTION, 'nKv', 1);
    UpDownGod.Position := ReadInteger(SECTION, 'nYY', 2004);
    Free;
  end;
  ts00.TabVisible := false;
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  PageControl1.ActivePage := ts00;
  mListNU := TStringList.Create;
  mListDir := TStringList.Create;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormDfMain := false;
  mListNU.Destroy;
  mListDir.Destroy;
  if bIsFormDfPromResults then
    FormDfPromRes.Close;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nKv', UpDownKvart.Position);
    WriteInteger(SECTION, 'nYY', UpDownGod.Position);
    Free;
  end;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.bBtnCancel1Click(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.sBtnForward00Click(Sender: TObject);
var nKv, nYY  : word; cYY : ShortString;
begin
  nKv := UpDownKvart.Position;
  nYY := UpDownGod.Position;
  cYY := Copy(IntToStr(nYY), 3, 2);
  if bFlagDbg then begin
    cDfDirResults := cDfDirDbfs + 'RESULTS\DF\Z'; // для da1503nn.kv и porc*.xls
    cDfDirResults := cDfDirResults + IntToStr(nYY) + '_' + IntToStr(nKv) + 'K\'; end
  else begin
    cDfDirResults := cDfDirDbfs + 'RESULTS\DF\Z'; // для da1503nn.kv и porc*.xls
    cDfDirResults := cDfDirResults + IntToStr(nYY) + '_' + IntToStr(nKv) + 'K\';
  end;

  if not DirectoryExists(cDfDirResults) then
    ForceDirectories(cDfDirResults);
  cDfDirProm := cDfDirD00 + 'DF\'; // для формирования промежуточных файлов
  cDfDirProm := cDfDirProm + 'K' + IntToStr(nYY) + '_' + IntToStr(nKv) + '\';
  if not DirectoryExists(cDfDirProm) then
    ForceDirectories(cDfDirProm);
  cDfFileProm := 'tblProm.db';
  cDfFileUni := 'd__' + IntToStr(nKv) + cYY + '.db';
  cDfFileId := 'd_' + IntToStr(nKv) + cYY + '_id.db';
  cDfFileFi := 'd_' + IntToStr(nKv) + cYY + '_fi.db';
  // В директории cDfDirProm формируются промежуточные файлы
  // d__kyy, d_kyy_fi и d_kyy_id
  // Результаты работы (файлы da...dbf и porc??.xls собираются в cDfDirResults
  if nKv = 1 then begin
    dDfDtBegKv := EncodeDate(nYY, 1, 1);
    dDfDtEndKv := myLastDOM(EncodeDate(nYY, 3, 27)); end
  else if nKv = 2 then begin
    dDfDtBegKv := EncodeDate(nYY, 4, 1);
    dDfDtEndKv := myLastDOM(EncodeDate(nYY, 6, 27)); end
  else if nKv = 3 then begin
    dDfDtBegKv := EncodeDate(nYY, 7, 1);
    dDfDtEndKv := myLastDOM(EncodeDate(nYY, 9, 27)); end
  else if nKv = 4 then begin
    dDfDtBegKv := EncodeDate(nYY, 10, 1);
    dDfDtEndKv := myLastDOM(EncodeDate(nYY, 12, 27));
  end;
  sBtnBack1.Visible := true;
  sBtnForward1.Visible := true;
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.sBtnForward1Click(Sender: TObject);
var nResult : word;
begin
  if bIsFormDfPromResults then begin
    if FormDfPromRes.WindowState = wsMinimized then
      FormDfPromRes.WindowState := wsNormal;
    FormDfPromRes.SetFocus;
    Exit;
  end;
  if qryRkvzt.Modified then begin
    qryRkvzt.Post;
    qryRkvzt.ApplyUpdates;
  end;
  nResult := 0;
  if FileExists(cDfDirProm + cDfFileUni) and
                  FileExists(cDfDirProm + cDfFileId) and
                     FileExists(cDfDirProm + cDfFileFi) then begin
    WhatDfDo(nResult);     {z_DfZapr}
    Application.ProcessMessages;
    if nResult = 1 then               // показать существующую таблицу
      ShowDfPromRes(upDownKvart.Position, UpDownGod.Position)   {z_dfZplR}
    else if nResult = 2 then begin    // переформировать существующую таблицу
      PageControl1.ActivePage := ts2;
      Screen.Cursor := crHourGlass;
      NewCreFiles(upDownKvart.Position, UpDownGod.Position);
      //===================================================
      bBtnCancel2.Enabled := true;
      PageControl1.ActivePage := ts1;
      Screen.Cursor := crDefault;
      ShowDfPromRes(upDownKvart.Position, UpDownGod.Position);  {z_dfZplR}
    end; end
  else begin                          // сформировать новую таблицу
    PageControl1.ActivePage := ts2;
    Screen.Cursor := crHourGlass;
    NewCreFiles(upDownKvart.Position, UpDownGod.Position);
    //===================================================
    bBtnCancel2.Enabled := true;
    PageControl1.ActivePage := ts1;
    Screen.Cursor := crDefault;
    ShowDfPromRes(upDownKvart.Position, UpDownGod.Position);    {z_dfZplR}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.GetPrmUvInf(nTabN : integer;
                                            dDtBeg, dDtEnd : TDateTime;
                                            var dDtPriyn, dDtZviln : TDateTime);
var bIsFirstPrm, bIsFirstUvl : boolean;
begin
  // dDtBeg и dDtEnd - граничные даты месяца. Считаю, что внутри одного месяца
  // м.б только один прием или одно увольнение (хотя запись о приеме/увольн.
  // может оказаться не одна). Поэтому ищу минимальную дату приема и максималь-
  // ную дату увольнения для заданного периода.
  // Если не принимался - dDtPriyn = 0, не увольнялся - dDtZviln = 0
  // Если внутри месяца и увольнялся и, затем принимался, считаю, что не
  // увольнялся и не принимался
  dDtPriyn := 0;                    // В 3-м кв. 2006 не объединялись месяцы,
  dDtZviln := 0;                    // если, например, в 1-м принят, а во втором
  bIsFirstPrm := false;             // уволен.
  bIsFirstUvl := false;             // Погонять это к след. кварталу!!!!!
  with qryZPrmUv do begin
    if Active then Close;
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    while not Eof do begin
      // если окажется, что запись не одна, то, т.к. сортировка by Dt_Priem ...,
      // всегда сначала нарываемся на минимальную Dt_Priem
      if not bIsFirstPrm and (not bIsFirstUvl) and
                  (FieldByName('Dt_Priem').AsDateTime >= dDtBeg) then begin
        dDtPriyn := FieldByName('Dt_Priem').AsDateTime;
        bIsFirstPrm := true;
      end;
      if not FieldByName('Dt_Uvoln').IsNull then
        dDtZviln := FieldByName('Dt_Uvoln').AsDateTime
      else
        dDtZviln := 0; // т.е выйдем с датойУвольн. из последней записи
      if dDtZviln < dDtEnd then
        bIsFirstUvl := true;
      Next;
    end;
    if dDtZviln > dDtEnd then
      dDtZviln := 0;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.NewCreFiles(nKv, nYY : word);
var i, j : word;
    cDbgMsg, cBadId, cSvIndexName : ShortString;
    cMM, cYY, cUniTableName, cDirNm, cFNU, cID, cTabN, cFam, cIma, cOtch : string;
    nMesN, nFNU, nTabN, nVidN, nSovm, nOznDox, nOznPilg, nMaxPilga : integer;
    nSvTabN, nNextTabN, nLastTabN : integer;
    nS_NAR,  nS_DOX,  nS_TAXN,  nS_TAXP,
    dDtPriyn, dDtZviln, dDtMesEnd : TDateTime;
    bObnulitDatu : boolean;
    bNotInNwBD, bFromNewBD, bPisaliDatu, bAddNew : boolean;
    nRecNr, nCntGrpOznDox, nCntRecInOznDox, nCntRecInFNU : SmallInt;
    bPartBezDat, bPredPartBezDat : boolean;
    dDtBeg, dDtEnd, dDtTmp : TDateTime;
    nTabN110 : integer; nSovm110 : SmallInt;
    nMyNR : integer;
    bIsFirstRecordWithDates, bIsDtPrm, bIsDtUv : boolean;
    nSmDoxFNU : double;
    nMinPilgaFNU, nMaxPilgaFNU, nNewOznPilg : SmallInt; bNeedUpdFNU : boolean;
    bChangeMinPilg, bChangeMaxPilg : boolean;
    cSvTmpIndx, cDopRec : ShortString;
begin
  nMyId := 0;
  MemoDbg.Lines.Clear;
  cYY := Copy(IntToStr(nYY), 3, 2);
  dDtBeg := dDfDtBegKv;                 // 1-е число первого месяца квартала
  dDtEnd := EncodeDate(nYY, nKv*3, 1);  // 1-е число последнего месяца квартала
  // Определить пороги льготы для 3-х месяцев квартала
  nPorog1 := 0;
  nPorog2 := 0;
  nPorog3 := 0;
  with qryDop do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_TPdn where DtBeg <= :dDtTmp ' +
                           ' order by DtBeg desc, NR desc');
    dDtTmp := dDtBeg;
    ParamByName('dDtTmp').AsDateTime := dDtTmp;
    Open;
    if RecordCount > 0 then
      nPorog1 := FieldByName('PorogLg').AsFloat;
    Close;
    dDtTmp := EncodeDate(nYY, nKv*3-1, 1);
    ParamByName('dDtTmp').AsDateTime := dDtTmp;
    Open;
    if RecordCount > 0 then
      nPorog2 := FieldByName('PorogLg').AsFloat;
    Close;
    dDtTmp := dDtEnd;
    ParamByName('dDtTmp').AsDateTime := dDtTmp;
    Open;
    if RecordCount > 0 then
      nPorog3 := FieldByName('PorogLg').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  // Конец определения порогов 3-х месяцев квартала
  CreTblDF(cDfFileUni); // Создать таблицу d__KYY.db
  // Сначала собрать в нее данные из основной БД_110
  MemoDbg.Lines.Add('Выбираются данные из основной БД_110');
  SborFromNewBD(nKv, nYY); // выбор из основной БД
  //==============================================
  MemoDbg.Lines.Add('');
  LabelMsg.Refresh;
  // Теперь по данным таблицы d__KYY.db сформировать две таблицы:
  // d_KYY_id и d_KYY_f1 с и без идентификаторов
  MemoDbg.Lines.Add('Собираются сведения в промежуточную таблицу (файл ' +
                                               cDfDirProm + cDfFileProm + ')');
  nMyNR := 0;
  CreTblProm(cDfFileProm); // Создается и открывается пустая таблица tblProm.db
  CreOpenDfId(cDfFileId);  // Создается и открывается пустая таблица d_KYY_id.db
  with qryDop do begin
    // Выбрать только "боевые" ТИНы с тем, чтобы дальше делать
    // по каждому дальнейшие мудреные операции
    if Active then Close;
    SQL.Clear;
    DataBaseName := tblTmp.DatabaseName;
    SQL.Add('Select distinct TIN from ' + cDfFileUni);
    SQL.Add(' where (not TIN is null) and (TIN <> "") and ');
    SQL.Add(' (not Substring(TIN FROM 1 FOR 5) = "MyId_")');
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := tblTmp.DatabaseName;
    SQL.Add('Select * from ' + cDfFileUni);
    SQL.Add(' where TIN = :cTIN');
    SQL.Add(' order by TIN, Ozn_Dox, fNU, cDir, Ozn_Pilg ');
    // т.е., если есть запись из 110-й БД, она будет 1-й в пределах fNU (месяца)
    // т.о., если есть 110-е записи, все ДтПрм, ДтУв, Совм и пр. будут из
    // основной 110-й БД, а потом к ним добавлю только суммы из НИЧевских твблиц
  end;
  qryDop.First;
  while not qryDop.Eof do begin
    with qryTmp do begin
      Close;
      ParamByName('cTIN').AsString := qryDop.FieldByName('TIN').AsString;
      Open;
      // Сначала выяснить, есть ли записи в БД_110, если да - выяснить,
      // совместитель или нет в БД_110 в текущем квартале. Если сведения
      // в БД_110 есть - принимаю совместительство из БД_110
      First;
      cTabN := FieldByName('TabN').AsString;
      nTabN110 := 0;
      nSovm110 := -1;
      while not Eof do begin
        if FieldByName('cDir').AsString = 'D_01' then begin
          nTabN110 := FieldByName('TabN').AsInteger;
          if GetInfZPere(nTabN110, dDtBeg, dDtEnd+27, nSovm110) then;
          Break;
        end;
        Next;
      end;
      First;
      // "1" или "2" или "3" в поле fNU - это месяцы квартала
      while not Eof do begin
        // Собираю данные в промежуточную таблицу tblProm:
        cID    := FieldByName('TIN').AsString;
        cBadId := FieldByName('BadId').AsString;
        cFam   := FieldByName('Fam').AsString;
        cIma   := FieldByName('Ima').AsString;
        cOtch  := FieldByName('Otch').AsString;
        if nSovm110 > -1 then
          nSovm := nSovm110
        else
          nSovm := FieldByName('Sovm').AsInteger;
        Inc(nMyNR);
        LabelMsg.Caption := IntToStr(nMyNR) + '.  TIN = ' +
                                          cID + '               ';
        LabelMsg.Refresh;
        while (FieldByName('TIN').AsString = cID) and not Eof do begin
          AddRecToTblProm(qryTmp.FieldByName('BadID').AsString,
                          qryTmp.FieldByName('fNU').AsString,
                          qryTmp.FieldByName('TIN').AsString,
                          cTabN,
                          qryTmp.FieldByName('Fam').AsString,
                          qryTmp.FieldByName('Ima').AsString,
                          qryTmp.FieldByName('Otch').AsString,
                          qryTmp.FieldByName('D_PRIYN').AsString,
                          qryTmp.FieldByName('D_ZVILN').AsString,
                          qryTmp.FieldByName('OZNAKA').AsString,
                          qryTmp.FieldByName('DopRec').AsString,
                             nSovm,
                             qryTmp.FieldByName('OZN_DOX').AsInteger,
                             qryTmp.FieldByName('OZN_PILG').AsInteger,
                                qryTmp.FieldByName('S_NAR').AsFloat,
                                qryTmp.FieldByName('S_DOX').AsFloat,
                                qryTmp.FieldByName('S_TAXN').AsFloat,
                                qryTmp.FieldByName('S_TAXP').AsFloat);
          Next;
        end;
      end;
    end;
    qryDop.Next;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := tblTmp.DatabaseName;
    SQL.Add('Select TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg, ' +
            ' d_Priyn, d_Zviln, Oznaka, DopRec, Sum(S_Nar) as S_NAR, ' +
            ' Sum(S_Dox) as S_DOX, Sum(S_TaxN) as S_TAXN, ' +
            ' Sum(S_TaxP) as S_TAXP from tblProm where TIN = :cTIN ' +
            ' group by TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg, ' +
            ' d_Priyn, d_Zviln, Oznaka, DopRec');
  end;
  MemoDbg.Lines.Add('Группируются сведения по ИД-номерам (файл ' +
                                                  cDfDirProm + cDfFileId + ')');
  qryDop.First;
  nMyNR  := 0;
  while not qryDop.Eof do begin
    with qryTmp do begin
      Close;
      ParamByName('cTIN').AsString := qryDop.FieldByName('TIN').AsString;
      Open;
      // Благодаря вышележащей группировке надеюсь добиться
      // правильного объединения и сбора в таблицу tblDfID
      cID := FieldByName('TIN').AsString;
      nCntRecInOznDox := 0;
      nCntGrpOznDox := 0; // даты Прм/Увл записываю только в
                          // первую встретившуюся группу ознак доходов
      nRecNR := 0;
      bIsFirstRecordWithDates := false;
      bIsDtPrm := false;
      bIsDtUv := false;
      bPredPartBezDat := false;
      dDtPriyn := 0;
      dDtZviln := 0;
      First;
      while not Eof {это qryTmp - только один (текущий) TIN} do begin
        dDtPriyn := 0;
        dDtZviln := 0;
        cTabN    := FieldByName('TabN').AsString;
        cFam     := FieldByName('Fam').AsString;
        cIma     := FieldByName('Ima').AsString;
        cOtch    := FieldByName('Otch').AsString;
        cBadID   := FieldByName('BadID').AsString;
        nSovm    := FieldByName('Sovm').AsInteger;
        nOznPilg := FieldByName('Ozn_Pilg').AsInteger;
        nOznDox  := FieldByName('Ozn_Dox').AsInteger;
        cDopRec  := FieldByName('DopRec').AsString;
        if (FieldByName('d_Priyn').AsDateTime <> 0) then
          dDtPriyn := FieldByName('d_Priyn').AsDateTime;
        if (FieldByName('d_Zviln').AsDateTime <> 0) then
          dDtZviln := FieldByName('d_Zviln').AsDateTime;
        Inc(nCntGrpOznDox);
        nS_NAR  := FieldByName('S_NAR').AsFloat;
        nS_DOX  := FieldByName('S_DOX').AsFloat;
        nS_TAXN := FieldByName('S_TAXN').AsFloat;
        nS_TAXP := FieldByName('S_TAXP').AsFloat;
        bPartBezDat := false;
        Inc(nMyNR);
        LabelMsg.Caption := IntToStr(nMyNR) + '.  TIN = ' +
                                        cID + '                ';
        LabelMsg.Refresh;
        if (nOznDox >= 169) {НеОблМатПом} then begin
          // одна из ДопЗаписей - молча дописываю в cDfFileId
          bAddNew := true;       //Inc(nRecNR);
          tblDfIDAddRec(bAddNew, 77, nSovm, nOznDox, nOznPilg, cID,
                                 cTabN, cFam, cIma, cOtch, cBadId, cDopRec,
                                 nS_NAR, nS_DOX, nS_TAXN, nS_TAXP,
                                                 dDtPriyn, dDtZviln);
          bIsFirstRecordWithDates := true; end
        else if (nS_NAR <> 0) or (nS_DOX <> 0) or
                                 (nS_TAXN <> 0) or (nS_TAXP <> 0) or
                              (dDtPriyn <> 0) or (dDtZviln <> 0) then begin
          bAddNew := true;
          Inc(nRecNR);
          tblDfIDAddRec(bAddNew, nRecNR, nSovm, nOznDox, nOznPilg, cID,
                                 cTabN, cFam, cIma, cOtch, cBadId, cDopRec,
                                 nS_NAR, nS_DOX, nS_TAXN, nS_TAXP,
                                                 dDtPriyn, dDtZviln);
          bIsFirstRecordWithDates := true;
        end;
        bPredPartBezDat := bPartBezDat;
        Next;
      end;
    end;
    qryDop.Next;
  end;
  with tblTmp do begin   // Добавить информацию о приёмах / увольнениях
    cSvTmpIndx := IndexName;
    IndexName := 'OnTabNOznDox';
    First;
    nTabN := FieldByName('TabN').AsInteger;
    nSvTabN := nTabN;
    nLastTabN := 0;
    while true and not Eof do begin
      nLastTabN := FieldByName('TabN').AsInteger;
      Next;
      if FieldByName('TabN').AsInteger <> nSvTabN then begin
        nNextTabN := FieldByName('TabN').AsInteger;
        qryZPrmUv.Close;
        qryZPrmUv.ParamByName('nTabN').AsInteger := nSvTabN;
        qryZPrmUv.Open;
        if qryZPrmUv.RecordCount > 0 then begin
          while not qryZPrmUv.Eof do begin
            AddPrmUvInfoInTblDf(qryZPrmUv.FieldByName('TabN').AsInteger);
            qryZPrmUv.Next;
          end;
        end;
        nSvTabN := nNextTabN;
        Locate('TabN', nNextTabN, []);
      end;
    end;
    if nLastTabN <> 0 then begin
      qryZPrmUv.Close;
      qryZPrmUv.ParamByName('nTabN').AsInteger := nLastTabN;
      qryZPrmUv.Open;
      if qryZPrmUv.RecordCount > 0 then begin
        while not qryZPrmUv.Eof do begin
          AddPrmUvInfoInTblDf(qryZPrmUv.FieldByName('TabN').AsInteger);
          qryZPrmUv.Next;
        end;
      end;
    end;
    IndexName := cSvTmpIndx;
  end;
  // Создать таблицу cDfFileFi для НеИмеющих ТИН'ов
  MemoDbg.Lines.Add('Группируются сведения по ИД-неимущим (файл ' + cDfFileFi + ')');
  CreOpenDfFio(cDfFileFi);  //   d_104_fi.db
  nSovm := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := tblTmp.DatabaseName;
    SQL.Add('Select * from ' + cDfFileUni);
    SQL.Add(' where (TIN is null) or (TIN = "") or ');
    SQL.Add(' (Substring(TIN FROM 1 FOR 5) = "MyId_")');
    SQL.Add(' order by TIN, Fam, Ima, Otch, cDir, fNU, TabN, Ozn_Dox');
    Open;
    while not Eof do begin
      dDtPriyn := 0;
      dDtZviln := 0;
      cID := FieldByName('TIN').AsString;
      cBadId := FieldByName('BadId').AsString;
      cTabN := FieldByName('TabN').AsString;
      cFam := FieldByName('Fam').AsString;
      cIma := FieldByName('Ima').AsString;
      cOtch := FieldByName('Otch').AsString;
      if (not FieldByName('d_Priyn').IsNull) and
                (FieldByName('d_Priyn').AsDateTime >= dDfDtBegKv) and
                  (FieldByName('d_Priyn').AsDateTime <= dDfDtEndKv) then
        dDtPriyn := FieldByName('d_Priyn').AsDateTime;
      if (not FieldByName('d_Zviln').IsNull) and
                (FieldByName('d_Zviln').AsDateTime >= dDfDtBegKv) and
                  (FieldByName('d_Zviln').AsDateTime <= dDfDtEndKv) then
        dDtZviln := FieldByName('d_Zviln').AsDateTime;
      while (FieldByName('Fam').AsString = cFam) and
               (FieldByName('Ima').AsString = cIma) and
                 (FieldByName('Otch').AsString = cOtch) and not Eof do begin
        nS_NAR := 0;
        nS_DOX := 0;
        nS_TAXN := 0;
        nS_TAXP := 0;
        nOznDox := FieldByName('Ozn_Dox').asInteger;
        nOznPilg := FieldByName('Ozn_Pilg').asInteger;
        while (FieldByName('Fam').AsString = cFam) and
               (FieldByName('Ima').AsString = cIma) and
                 (FieldByName('Otch').AsString = cOtch) and
                   (FieldByName('Ozn_Dox').AsInteger = nOznDox) and
                     (FieldByName('Ozn_Pilg').AsInteger = nOznPilg) and
                                                          not Eof do begin
          nS_NAR := nS_NAR + FieldByName('S_NAR').AsFloat;
          nS_DOX := nS_DOX + FieldByName('S_DOX').AsFloat;
          nS_TAXN := nS_TAXN + FieldByName('S_TAXN').AsFloat;
          nS_TAXP := nS_TAXP + FieldByName('S_TAXP').AsFloat;
          if (not FieldByName('d_Priyn').IsNull) and
                (FieldByName('d_Priyn').AsDateTime >= dDfDtBegKv) and
                  (FieldByName('d_Priyn').AsDateTime <= dDfDtEndKv) then
            dDtPriyn := FieldByName('d_Priyn').AsDateTime;
          if (not FieldByName('d_Zviln').IsNull) and
                (FieldByName('d_Zviln').AsDateTime >= dDfDtBegKv) and
                  (FieldByName('d_Zviln').AsDateTime <= dDfDtEndKv) then
            dDtZviln := FieldByName('d_Zviln').AsDateTime;
          Next;
        end;
        // Добавить запись в таблицу d_KYY_f1.db
        tblDf1FIAddRec(nSovm, nOznDox, nOznPilg,
                        cID, cTabN, cFam, cIma, cOtch, cBadId,
                        nS_NAR, nS_DOX, nS_TAXN, nS_TAXP, dDtPriyn, dDtZviln);
      end;
    end;
  end;
  MemoDbg.Lines.Add('');
  MemoDbg.Lines.Add('Ну вот и добрались до завершения! Смотрим результаты.');
  MemoDbg.Lines.Add('');
  MemoDbg.Lines.Add('Сие сохраняется в файле ' + cDirTemp + 'CreDfFil.txt');
  MemoDbg.Lines.SaveToFile(cDirTemp + 'CreDfFil.txt');
  LabelMsg.Caption := '                                                   ';
  LabelMsg.Refresh;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.SborFromNewBD(nKv, nYY : word);
var dDtBeg, dDtEnd, dDOB, dDtPrc, dDtPrikaza, dDtTmp : TDateTime;
    nTabN : integer;
    cFamIO, cFam, cIma, cOtch, cPol, cID : string;
    cBadId : ShortString;
    cVidN, cDirNm : string4;
    nY, nM, nD : word;
    nFNU, nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpZ,
                                        nRang, nRazr, nSovm : integer;
    nOklTrf, nAvans, nProcLg : double;
    cSpAv : string1; cDolgnost, cNrPrikaza : string;
    bPens, bSovm, bPrfs : boolean;
    i, bInv : SmallInt;
    nOznDox, nOznPilg, nMaxPilga : integer;
    nS101_NAR, nS101_DOX, nS101_TAXN, nS101_TAXP, {все начисления без нижних}
    nS102_NAR, nS102_DOX, nS102_TAXN, nS102_TAXP, {ДГВ 1005, 1006, 1008}
    nS127_NAR, nS127_DOX, nS127_TAXN, nS127_TAXP, {МПОбл }
    nS128_NAR, nS128_DOX, nS128_TAXN, nS128_TAXP, {ЧОО,РождРеб,Декр 1901,1909,2602}
    nS133_NAR, nS133_DOX, nS133_TAXN, nS133_TAXP, {ЕСВпрп 8681 - 8687}
    nS140_NAR, nS140_DOX, nS140_TAXN, nS140_TAXP, {Алименты 6601}
    nS169_NAR, nS169_DOX, nS169_TAXN, nS169_TAXP : double; {*МпНеОбл 1801}
    nS_NAR, nS_DOX, nS_TaxN, nS_TaxP : double;    {для авансов по КМД}
    nWSb_Nar, nWSb_Tax : double; // Для военного сбора и Удержано WSb
    nSmm : double;
    dDtPriyn, dDtZviln, dDtMesEnd : TDateTime;
    bObnulitDatu : boolean;
    bNotInNwBD : boolean; // признак того, что инф. о ТИНе нет в записях NwBD
    nMyNR : integer;
    nSmForPdn, nSmPoroga : double;
    cDbgTabN : ShortString;
begin
  bNotInNwBD := false;    // т.к. это и есть записи NwBD
  dDtBeg := dDfDtBegKv;
  dDtEnd := EncodeDate(nYY, nKv*3, 1);
  cDirNm := 'D_01';
  LabelMsg.Caption := '';
  ts2.Refresh;
  with qryZPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_PrmUv where TabN = :nTabN and ' +
           ' ((Dt_Priem >= :dDtBeg and Dt_Priem <= :dDtEnd) or ' +
           '  (Dt_Uvoln >= :dDtBeg and Dt_Uvoln <= :dDtEnd)) ' +
           ' order by Dt_Priem, Dt_Uvoln, NR');
    ParamByName('dDtBeg').AsDateTime := dDfDtBegKv;
    ParamByName('dDtEnd').AsDateTime := dDfDtEndKv;
  end;
  cDbgTabN := ' (78,19308)';
//  cDbgTabN := ' (42,78,963,1004,2862,1239,1600,2571,3235,6685,8285,33712,54271,57795)';
{
Select First 2800 * from ViNuMain where dtProc >= '01/01/2015' and
             DtProc <= '03/01/2015' and (VidN <= "6002" or
             VidN in ("6007","8681","8682","8683","8684","8685","8686","8687"))
             and TabN > 0
order by TabN, DtProc, VidN
}
  with qryZNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    {if bFlagDbg then
      SQL.Add('Select First 2800 * from ViNuMain where dtProc >= :dDtBeg and ' +
            ' DtProc <= :dDtEnd and (VidN <= "6002" or ' +
            ' VidN in ("6007","8681","8682","8683","8684","8685","8686","8687")) ' +
            ' and TabN > 0 ')
    else
    }
      SQL.Add('Select * from ViNuMain where dtProc >= :dDtBeg and ' +
            ' DtProc <= :dDtEnd and (VidN <= "6002" or ' +
            ' VidN in ("6007","8681","8682","8683","8684","8685","8686","8687")) ' +
            ' and TabN > 0 ');

//    if bFlagDbg then
//      SQL.Add(' and TabN in ' + cDbgTabN);
    SQL.Add('order by TabN, DtProc, VidN');
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    nMyNR := 0;
    while not Eof do begin
      Inc(nMyNR);
      nTabN := FieldByName('TabN').AsInteger;
      LabelMsg.Caption := IntToStr(nMyNR) + '.  TabN = ' +
                                         IntToStr(nTabN) + '            ';
      LabelMsg.Refresh;
      cBadId := '';
      DmMain.GetUpiInfo(nTabN, cFamIO,
                                cFam, cIma, cOtch, cPol, cID, dDOB); {z_Dm}
      if not ItIsTin(cId) then begin
        cBadId := cId;
        cId := MyId;
      end;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        dDtPrc := FieldByName('DtProc').AsDateTime;
        DecodeDate(dDtPrc, nY, nM, nD);
        dDtMesEnd := MyLastDom(dDtPrc);
        dDtPriyn := 0;
        dDtZviln := 0;
        DmMain.GetPereInf(nTabN, dDtPrc, nKdObj, nKdKatP, nSO, nPdNlg, nKolMin,
                           nKdSpZ, nRang, nRazr, nOklTrf, nAvans, nProcLg,
                           cSpAv, cDolgnost, cNrPrikaza, dDtPrikaza,
                           bPens, bSovm, bPrfs, bInv);
        if (nM = 1) or (nM = 4) or (nM = 7) or (nM = 10) then begin
          nFNU := 1;   // 1-й месяц квартала
          nCurPorog := nPorog1; end
        else if (nM = 2) or (nM = 5) or (nM = 8) or (nM = 11) then begin
          nFNU := 2;   // 2-й месяц квартала
          nCurPorog := nPorog2; end
        else begin
          nFNU := 3;   // 3-й месяц квартала
          nCurPorog := nPorog3;
        end;
        nS101_NAR  := 0; nS101_DOX  := 0; nS101_TAXN := 0; nS101_TAXP := 0;
        nS102_NAR  := 0; nS102_DOX  := 0; nS102_TAXN := 0; nS102_TAXP := 0;
        nS127_NAR  := 0; nS127_DOX  := 0; nS127_TAXN := 0; nS127_TAXP := 0;
        nS128_NAR  := 0; nS128_DOX  := 0; nS128_TAXN := 0; nS128_TAXP := 0;
        nS133_NAR  := 0; nS133_DOX  := 0; nS133_TAXN := 0; nS133_TAXP := 0;
        nS140_NAR  := 0; nS140_DOX  := 0; nS140_TAXN := 0; nS140_TAXP := 0;
        nS169_NAR  := 0; nS169_DOX  := 0; nS169_TAXN := 0; nS169_TAXP := 0;
        nSmForPdn := 0;
        nWSb_Nar := 0;                    nWSb_Tax := 0;
        nOznDox  := 101; // для начала принимаю, что все доходы основные
        if bSovm then
          nSovm := 1
        else
          nSovm := 0;
        while (FieldByName('TabN').AsInteger = nTabN) and
               (FieldByName('DtProc').AsDateTime = dDtPrc) and not Eof do begin
          cVidN := FieldByName('VidN').AsString;
          nSmm := FieldByName('Summa').AsFloat;
          if (cVidN = '1801') {необлагаемая матпомощь} then begin
            nS169_NAR := nS169_NAR + nSmm;
            nS169_DOX := nS169_DOX + nSmm; end
          else if (cVidN > '1800') and
                         (cVidN <= '1809') {облагаемая матпомощь} then begin
            if FieldByName('SPdn').AsString > '0' then
              nSmForPdn := nSmForPdn + nSmm;
            nS127_NAR := nS127_NAR + nSmm;
            nS127_DOX := nS127_DOX + nSmm; end
          else if (cVidN = '1901') or (cVidN = '1909') or (cVidN = '2602')
                       {Част.Опл.Отп, Рожд.ребенка, Декретн} then begin
            if FieldByName('SPdn').AsString > '0' then
              nSmForPdn := nSmForPdn + nSmm;
            nS128_NAR := nS128_NAR + nSmm;
            nS128_DOX := nS128_DOX + nSmm; end
          else if (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008')
                                                {Договорные} then begin
            nS102_NAR := nS102_NAR + nSmm;
            nS102_DOX := nS102_DOX + nSmm; end
          else if (cVidN >= '8681') and (cVidN <= '8687')
                                                 {ЕСВ с прп} then begin
            nS133_NAR := nS133_NAR - nSmm;
            nS133_DOX := nS133_DOX - nSmm; end
          else if (cVidN = '6601') {Алименты} then begin
            nS140_NAR := nS140_NAR + nSmm;
            nS140_DOX := nS140_DOX + nSmm; end
          else if (cVidN = '6001') or (cVidN = '6002') {подоходные} then begin
            if (FieldByName('MyNotes').AsString = 'Dgv') or
                         (FieldByName('KdKatP').AsInteger = 13) then begin
              nS102_TAXN := nS102_TAXN - nSmm;
              nS102_TAXP := nS102_TAXP - nSmm; end
            else begin
              nS101_TAXN := nS101_TAXN - nSmm;
              nS101_TAXP := nS101_TAXP - nSmm;
            end; end
          else if ((cVidN < '2700') or (cVidN > '2800')) and
                           (cVidN < '6000') {все нарахування} then begin
            if FieldByName('SPdn').AsString > '0' then
              nSmForPdn := nSmForPdn + nSmm;
            nS101_NAR := nS101_NAR  + nSmm;
            nS101_DOX := nS101_DOX  + nSmm;
          end;
          if cVidN = '6007' then
            nWSb_Tax := nWSb_Tax - nSmm;
          if FieldByName('SWSb').AsString >= '1' then
            nWSb_Nar := nWSb_Nar + nSmm;
          Next;
        end;
        if nS127_NAR <> 0 {облагаемая матПомощь} then begin // рассчитать прихо-
          nS127_TaxN :=     // дящийся на нее подоходный и поправить nS101_TaxN
                 RoundTo(nS127_Nar * nS101_TaxN / (nS101_Nar + nS127_Nar), -2);
          nS127_TaxP := nS127_TaxN;
          nS101_TaxN := nS101_TaxN - nS127_TaxN;
          nS101_TaxP := nS101_TaxN;
        end;
        // Ознаку пильги нужно записывать только в том случае, если она
        //               ПРИМЕНЯЛАСЬ, т.е. если заработок был меньше порога
        CreOpenCdsLgotu(nTabN, dDtPrc);
        cdsLgotu.First;
        nOznPilg := cdsLgotu.FieldByName('Ozn_Pilg').AsInteger;;
        dDtPriyn := 0;
        dDtZviln := 0;
        // 1-я обязательная запись за месяц {со 2-го кв 2012 не обязательная}
        if (nS101_NAR <> 0) or (nS101_TAXN <> 0) then
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
                        cDirNm, cID, cFam, cIma, cOtch, cBadId,
                            nS101_NAR, nS101_DOX, nS101_TAXN, nS101_TAXP,
                                              dDtPriyn, dDtZviln, bNotInNwBD);
        // если есть соответствующие суммы - соответственно добавляются записи
        // со своими ознаками nOznDox и nOznPilg
        if (nWSb_Nar <> 0) or (nWSb_Tax <> 0) {ВоенноСборные дела} then begin
          nOznDox := 777;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
                          cDirNm, cID, cFam, cIma, cOtch, cBadId,
                              nWSb_Nar, nWsb_Nar, nWSb_Tax, nWSb_Tax,
                                              dDtPriyn, dDtZviln, bNotInNwBD);
        end;
        if (nS102_NAR <> 0) or (nS102_TAXN <> 0) {Договорные виды} then begin
          nOznDox := 102;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
                          cDirNm, cID, cFam, cIma, cOtch, cBadId,
                              nS102_NAR, nS102_DOX, nS102_TAXN, nS102_TAXP,
                                              dDtPriyn, dDtZviln, bNotInNwBD);
        end;
        if nS127_NAR <> 0 {облагаемая матпомощь} then begin
          nOznDox := 127;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
                          cDirNm, cID, cFam, cIma, cOtch, cBadId,
                              nS127_NAR, nS127_DOX, nS127_TAXN, nS127_TAXP,
                                              dDtPriyn, dDtZviln, bNotInNwBD);
        end;
        if nS128_NAR <> 0 {Част.Опл.Отп, Рожд.ребенка, Декр} then begin
          nOznDox := 128;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
                          cDirNm, cID, cFam, cIma, cOtch, cBadId,
                              nS128_NAR, nS128_DOX, 0, 0,
                                              dDtPriyn, dDtZviln, bNotInNwBD);
        end;
        if nS133_NAR <> 0 {ЕСВ с предприятия} then begin
          nOznDox := 133;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
                          cDirNm, cID, cFam, cIma, cOtch, cBadId,
                              nS133_NAR, nS133_DOX, 0, 0,
                                              0, 0, bNotInNwBD);
        end;
        if nS140_NAR <> 0 {Алименты} then begin
          nOznDox := 140;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
                          cDirNm, cID, cFam, cIma, cOtch, cBadId,
                              nS140_NAR, nS140_DOX, 0, 0,
                                              dDtPriyn, dDtZviln, bNotInNwBD);
        end;
        if nS169_NAR <> {необлагаемая матпомощь} 0 then begin
          nOznDox := 169;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
                          cDirNm, cID, cFam, cIma, cOtch, cBadId,
                              nS169_NAR, nS169_DOX, 0, 0,
                                              dDtPriyn, dDtZviln, bNotInNwBD);
        end;
      end;
    end;
  end;
(*
  // Командировки. Поработать с qryKmd (добавить данные из запроса к K_OPL)
  with qryKmd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select k.TabN, u.Fam, u.Ima, u.Otch, u.ID, ' +
            ' k.KdRsh, Sum(k.Summa) as SMM from K_Opl k ' +
            ' Left Outer Join z_Upi u on u.TabN = k.TabN ' +
            ' where k.KdRsh = 10 and k.DtProc >= :dDtBeg and ' +
            ' k.DtProc <= :dDtEnd and k.PrZSP = "Z" ');
    if bFlagDbg then
      SQL.Add(' and k.TabN in ' + cDbgTabN);
    SQL.Add(' group by k.TabN, u.Fam, u.Ima, u.Otch, u.ID, k.KdRsh');
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    while not Eof do begin
      nFNU     := 777;
      nSovm    := 0;
      nOznDox  := 118;
      nOznPilg := 0;
      cDirNm   := 'KMD';
      nTabN    := FieldByName('TabN').AsInteger;
      cID      := FieldByName('ID').AsString;
      cFam     := FieldByName('Fam').AsString;
      cIma     := FieldByName('Ima').AsString;
      cOtch    := FieldByName('Otch').AsString;
      cBadId   := '';
      nS_NAR   := FieldByName('Smm').AsFloat;
      nS_DOX   := nS_NAR;
      nS_TAXN  := 0;
      nS_TAXP  := 0;
      dDtPriyn := 0;
      dDtZviln := 0;
      bNotInNwBD := false;
      tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
                          cDirNm, cID, cFam, cIma, cOtch, cBadId,
                              nS_NAR, nS_DOX, nS_TaxN, nS_TaxP,
                                              dDtPriyn, dDtZviln, bNotInNwBD);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
*)  
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.AddPrmUvInfoInTblDf(nTabN : integer);
var bIsMesto : boolean;
    cSvDir, cSvFNU, cSvTIN, cSvSovm,
            cSvFam, cSvIma, cSvOtch, cSvOznDox, cSvOznPilg : ShortString;
begin
  cSvDir     := '';
  cSvFNU     := '';
  cSvTIN     := '';
  cSvSovm    := '';
  cSvFam     := '';
  cSvIma     := '';
  cSvOtch    := '';
  cSvOznDox  := '';
  cSvOznPilg := '';
  with tblTmp do begin
    Filtered := false;
    Filter := 'TabN = ' + IntToStr(nTabN) +
                 ' and ((Ozn_Dox = 101) or (Ozn_Dox = 102) or (Ozn_Dox = 128))';
    Filtered := true;
    bIsMesto := false;
    First;
    while not Eof do begin
      cSvTIN     := FieldByName('TIN').AsString;
      cSvSovm    := FieldByName('Sovm').AsString;
      cSvFam     := FieldByName('Fam').AsString;
      cSvIma     := FieldByName('Ima').AsString;
      cSvOtch    := FieldByName('Otch').AsString;
      cSvOznDox  := FieldByName('Ozn_Dox').AsString;
      cSvOznPilg := FieldByName('Ozn_Pilg').AsString;
      if FieldByName('D_Priyn').IsNull and
                         FieldByName('D_Zviln').IsNull then begin
        bIsMesto := true;
        Edit;
        if not qryZPrmUv.FieldByName('Dt_Priem').IsNull and
               (qryZPrmUv.FieldByName('Dt_Priem').AsDateTime >= dDfDtBegKv) and
               (qryZPrmUv.FieldByName('Dt_Priem').AsDateTime <= dDfDtEndKv) then
          FieldByName('D_Priyn').AsString :=
                                     qryZPrmUv.FieldByName('Dt_Priem').AsString;
        if not qryZPrmUv.FieldByName('Dt_Uvoln').IsNull and
               (qryZPrmUv.FieldByName('Dt_Uvoln').AsDateTime >= dDfDtBegKv) and
               (qryZPrmUv.FieldByName('Dt_Uvoln').AsDateTime <= dDfDtEndKv) then
          FieldByName('D_Zviln').AsString :=
                                     qryZPrmUv.FieldByName('Dt_Uvoln').AsString;
        FieldByName('DopRec').AsString := '0';
        Post;
      end;
      if bIsMesto then
        Break
      else
        Next;
    end;
    if Eof and not bIsMesto then begin
      Append;
      FieldByName('TabN').AsInteger    := nTabN;
      FieldByName('Ozn_Dox').AsString  := cSvOznDox;
      FieldByName('TIN').AsString      := cSvTIN;
      FieldByName('Sovm').AsString     := cSvSovm;
      FieldByName('Fam').AsString      := cSvFam;
      FieldByName('Ima').AsString      := cSvIma;
      FieldByName('Otch').AsString     := cSvOtch;
      FieldByName('Ozn_Pilg').AsString := cSvOznPilg;
      FieldByName('S_Nar').AsFloat     := 0;
      FieldByName('S_Dox').AsFloat     := 0;
      FieldByName('S_TaxN').AsFloat    := 0;
      FieldByName('S_TaxP').AsFloat    := 0;
      if not qryZPrmUv.FieldByName('Dt_Priem').IsNull and
              (qryZPrmUv.FieldByName('Dt_Priem').AsDateTime >= dDfDtBegKv) and
               (qryZPrmUv.FieldByName('Dt_Priem').AsDateTime <= dDfDtEndKv) then
        FieldByName('D_Priyn').AsString :=
                                     qryZPrmUv.FieldByName('Dt_Priem').AsString;
      if not qryZPrmUv.FieldByName('Dt_Uvoln').IsNull and
              (qryZPrmUv.FieldByName('Dt_Uvoln').AsDateTime >= dDfDtBegKv) and
               (qryZPrmUv.FieldByName('Dt_Uvoln').AsDateTime <= dDfDtEndKv) then
        FieldByName('D_Zviln').AsString :=
                                     qryZPrmUv.FieldByName('Dt_Uvoln').AsString;
      FieldByName('DopRec').AsString := '1';
      Post;
    end;
    Filtered := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.CreOpenCdsLgotu(nTabN: integer; dDtPrc: TDateTime);
var cLitera, cOznPilg, cPilga : ShortString; i : SmallInt;
begin
  with cdsLgotu do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryLgotu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select TabN, VidN, DtProc, ZaMesGod, Summa, Ozn_Pilg ' +
            ' from Z_NU where TabN = :nTabN and DtProc = :dDtPrc and ' +
            ' VidN = "6001" order by TabN, DtProc, ZaMesGod');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      cOznPilg := Trim(FieldByName('Ozn_Pilg').AsString);
      if cOznPilg = '' then begin
        cdsLgotu.Append;
        cdsLgotu.FieldByName('Ozn_Pilg').AsInteger := 0;
        cdsLgotu.Post; end
      else begin
        cPilga := '';
        for i := 1 to Length(cOznPilg) do begin
          cLitera := cOznPilg[i];
          if cLitera <> ';' then
            cPilga := cPilga + cLitera
          else begin
            cdsLgotu.Append;
            cdsLgotu.FieldByName('Ozn_Pilg').AsInteger := StrToInt(cPilga);
            cdsLgotu.Post;
            cPilga := '';
          end;
        end;
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  if (nTabN = 113) and (dDtPrc = EncodeDate(2011, 5,1)) then
    cdsLgotu.SaveToFile(cDirTemp + 'OznPlg.cds');
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.ChangePilgaInFNU(cTIN : ShortString;
                                               nFNU, nNewOznPilg : SmallInt);
begin
  with qryTmp do begin    // qryTmp уже освободился
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDfDirProm; // поле Ozhaka не используется - сохраняю в нем
                                // старое значение Ozn_Pilg (на память)
    SQL.Add('Update ' + cDfFileUni + ' set Oznaka = Ozn_Pilg, ' +
            ' Ozn_Pilg = ' + IntToStr(nNewOznPilg) +
            ' where TIN = "' + cTIN + '" and fNU = ' + IntToStr(nFNU) +
            ' and Ozn_Dox < 14');
    // При применении параметров почему-то, гад, ругается
    // на несоответствие типов, поэтому ивернулся с IntToStr...
    // ParamByName('cTIN').AsString := cTIN;
    // ParamByName('nFNU').AsInteger := nFNU;
    // ParamByName('nNewOznPilg').AsInteger := nNewOznPilg;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'CngPilga.sql');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormDfMain.GetInfZPere(nTabN : integer; dDtBeg, dDtEnd : TDateTime;
                                              var nSovm : SmallInt) : boolean;
begin
  // в dDtEnd - приблизительно конец месяца последнего квартала (+27)
  with qryZPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from z_Pere where TabN = :nTabN and ' +
            ' Dt_Beg <= :dDtEnd order by Dt_Beg desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
    Open;
    if RecordCount > 0 then
      nSovm := FieldByName('Sovm').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
    Result := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.AddRecToTblProm(cBadID, cfNU, cTIN, cTabN,
                                      cFam, cIma, cOtch, cD_PRIYN, cD_ZVILN,
                                     cOZNAKA, cDopRec : ShortString;
                                     nSovm, nOZN_DOX, nOZN_PILG : SmallInt;
                                     nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double);
var dD_Priyn, dD_Zviln : TDateTime;
begin
  with tblProm do begin  {добавляется запись в tblProm}
    if not Locate('TIN;fNU;OZN_DOX;DopRec',
         VarArrayOf([cTIN, cfNU, nOzn_Dox, cDopRec]), []) then begin
      Append;
      tblPromBadID.AsString := cBadID;
      tblPromFNU.AsString := cfNU;
      tblPromTIN.AsString := cTIN;
      tblPromSovm.AsInteger := nSovm;
      tblPromTabN.AsString := cTabN;
      tblPromFam.AsString := cFam;
      tblPromIma.AsString := cIma;
      tblPromOtch.AsString := cOtch;
      tblPromD_PRIYN.AsString := cD_Priyn;
      tblPromD_ZVILN.AsString := cD_Zviln;
      tblPromOznaka.AsString := cOznaka;
      tblPromDopRec.AsString := cDopRec;
      tblPromOzn_Dox.AsInteger := nOzn_Dox;
      tblPromOzn_Pilg.AsInteger := nOzn_Pilg; end
    else
      Edit;
    tblPromS_Nar.AsFloat := tblPromS_Nar.AsFloat + nS_Nar;
    tblPromS_Dox.AsFloat := tblPromS_Dox.AsFloat + nS_Dox;
    tblPromS_TaxN.AsFloat := tblPromS_TaxN.AsFloat + nS_TaxN;
    tblPromS_TaxP.AsFloat := tblPromS_TaxP.AsFloat + nS_TaxP;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.tblDfIDAddRec(bAddNew : boolean;
                                    nRecNR, nSovm, nOznDox, nOznPilg : Integer;
                        cID, cTabN, cFam, cIma, cOtch, cBadId, cDopRec : string;
                                     nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double;
                                     dDtPriyn, dDtZviln : TDateTime);
begin
  with tblTmp do begin
    // добавляется квартальная запись в таблицу с идентификационными номерами
    if bAddNew then
      Append
    else begin
      Locate('TIN;OZN_DOX;RecNr', VarArrayOf([cID, nOznDox, nRecNR]), []);
      Edit;
    end;
    FieldByName('RecNr').AsInteger := nRecNR;
    FieldByName('Sovm').AsInteger := nSovm;
    FieldByName('TIN').AsString := cID;
    FieldByName('BadId').AsString := cBadId;
    FieldByName('TabN').AsString := cTabN;
    FieldByName('Fam').AsString := cFam;
    FieldByName('Ima').AsString := cIma;
    FieldByName('Otch').AsString := cOtch;
    FieldByName('DopRec').AsString := cDopRec;
    FieldByName('S_NAR').AsFloat  := FieldByName('S_NAR').AsFloat + nS_NAR;
    FieldByName('S_DOX').AsFloat  := FieldByName('S_DOX').AsFloat + nS_DOX;
    FieldByName('S_TAXN').AsFloat := FieldByName('S_TAXN').AsFloat + nS_TAXN;
    FieldByName('S_TAXP').AsFloat := FieldByName('S_TAXP').AsFloat + nS_TAXP;
    FieldByName('OZN_DOX').AsInteger := nOznDox;
    FieldByName('OZN_PILG').AsInteger := nOznPilg;
    if dDtPriyn <> 0 then
      FieldByName('D_PRIYN').AsDateTime := dDtPriyn;
    if dDtZviln <> 0 then
      FieldByName('D_ZVILN').AsDateTime := dDtZviln;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.CreTblProm(cTableName : string);
begin
  with tblProm do begin
    if Active then Close;
    IndexName := '';
    FieldDefs.Clear;
    IndexDefs.Clear;
    DataBaseName := cDfDirProm;
    TableName := cTableName;
    with FieldDefs do begin
      Clear;
      Add('NR', ftAutoInc);
      Add('NP', ftInteger);
      Add('BadId', ftString, 10);
      Add('fNU', ftSmallInt);
      Add('TabN', ftInteger);
      Add('TIN', ftString, 10);
      Add('Sovm', ftSmallInt);
      Add('Fam', ftString, 20); // Пока оставляю (для возможных разборок)
      Add('Ima', ftString, 20);
      Add('Otch', ftString, 20);
      Add('S_NAR', ftFloat);
      Add('S_DOX', ftFloat);
      Add('S_TAXN', ftFloat);
      Add('S_TAXP', ftFloat);
      Add('OZN_DOX', ftSmallInt);
      Add('D_PRIYN', ftDate);
      Add('D_ZVILN', ftDate);
      Add('OZN_PILG', ftSmallInt);
      Add('OZNAKA', ftSmallInt);
      Add('DopRec', ftString, 1);// чтобы отмечать добавленные вручную записи
    end;
    CreateTable;
    AddIndex('', 'NR', [ixPrimary]);
    AddIndex('TinOznDox', 'TIN;Ozn_Dox;fNU', [ixCaseInsensitive]);
    Open;
    IndexName := 'TinOznDox';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.CreOpenDfId(cTableName : string);
begin
  with tblTmp do begin
    if Active then Close;
    IndexName := '';
    FieldDefs.Clear;
    IndexDefs.Clear;
    DataBaseName := cDfDirProm;
    TableName := cTableName;
    with FieldDefs do begin
      Clear;
      Add('NR', ftAutoInc);
      Add('NP', ftInteger);
      Add('BadId', ftString, 10);
      Add('RecNR', ftInteger);
      Add('TabN', ftInteger);
      Add('TIN', ftString, 10);
      Add('Sovm', ftSmallInt);
      Add('Fam', ftString, 20);
      Add('Ima', ftString, 20);
      Add('Otch', ftString, 20);
      Add('S_NAR', ftFloat);
      Add('S_DOX', ftFloat);
      Add('S_TAXN', ftFloat);
      Add('S_TAXP', ftFloat);
//      Add('S_NAR_WSB', ftFloat);   // Предпологается NAR'ы = DOX'и
//      Add('S_TAX_WSB', ftFloat);  //              и TAXP'ы = TAXN'ы
      Add('OZN_DOX', ftSmallInt);
      Add('D_PRIYN', ftDate);
      Add('D_ZVILN', ftDate);
      Add('OZN_PILG', ftSmallInt);
      Add('OZNAKA', ftSmallInt);
      Add('DopRec', ftString, 1);// чтобы отмечать добавленные вручную записи
    end;
    CreateTable;
    AddIndex('', 'NR', [ixPrimary]);
    AddIndex('OnTinOznDox', 'TIN;Ozn_Dox', [ixCaseInsensitive]);
    AddIndex('OnTabNOznDox', 'TabN;Ozn_Dox', [ixCaseInsensitive]);
    Open;
    IndexName := 'OnTinOznDox';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.CreOpenDfFio(cTableName : string);
begin
  with tblTmp do begin
    if Active then Close;
    IndexName := '';
    FieldDefs.Clear;
    IndexDefs.Clear;
    DataBaseName := cDfDirProm;
    TableName := cTableName;
    with FieldDefs do begin
      Clear;
      Add('NR', ftAutoInc);
      Add('NP', ftInteger);
      Add('BadId', ftString, 10);
      Add('TIN', ftString, 10);  // чтобы были одинаковые c tblID структуры
      Add('Sovm', ftSmallInt);
      Add('TabN', ftInteger);
      Add('Fam', ftString, 20);
      Add('Ima', ftString, 20);
      Add('Otch', ftString, 20);
      Add('Pasport', ftString, 20);
      Add('S_NAR', ftFloat);
      Add('S_DOX', ftFloat);
      Add('S_TAXN', ftFloat);
      Add('S_TAXP', ftFloat);
      Add('OZN_DOX', ftSmallInt);
      Add('D_PRIYN', ftDate);
      Add('D_ZVILN', ftDate);
      Add('OZN_PILG', ftSmallInt);
      Add('OZNAKA', ftSmallInt);
      Add('DopRec', ftString, 1);// чтобы отмечать добавленные вручную записи
    end;
    CreateTable;
    AddIndex('', 'NR', [ixPrimary]);
    AddIndex('OnFIO', 'Fam;Ima;Otch', [ixCaseInsensitive]);
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.tblDf1FIAddRec(nSovm, nOznDox, nOznPilg : Integer;
                                cID, cTabN, cFam, cIma, cOtch, cBadId : string;
                                     nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double;
                                     dDtPriyn, dDtZviln : TDateTime);
begin
  with tblTmp do begin
    // добавляется квартальная запись в таблицу без ид. номеров (только ФИО)
    Append;
    FieldByName('TIN').AsString := cID;
    FieldByName('BadId').AsString := cBadId;
    FieldByName('Sovm').AsInteger := nSovm;
    FieldByName('TabN').AsString := cTabN;
    FieldByName('Fam').AsString := cFam;
    FieldByName('Ima').AsString := cIma;
    FieldByName('Otch').AsString := cOtch;
    FieldByName('S_NAR').AsFloat := nS_NAR;
    FieldByName('S_DOX').AsFloat := nS_DOX;
    FieldByName('S_TAXN').AsFloat := nS_TAXN;
    FieldByName('S_TAXP').AsFloat := nS_TAXP;
    FieldByName('OZN_DOX').AsInteger := nOznDox;
    FieldByName('OZN_PILG').AsInteger := nOznPilg;
    if dDtPriyn <> 0 then
      FieldByName('D_PRIYN').AsDateTime := dDtPriyn;
    if dDtZviln <> 0 then
      FieldByName('D_ZVILN').AsDateTime := dDtZviln;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.CreTblDF(cTableName : string);
begin           {Создание месячной таблицы d__KYY.db для сбора данных из Z_NU}
  with tblTmp do begin
    if Active then Close;
    IndexName := '';
    DataBaseName := cDfDirProm;
    TableName := cTableName;
    with FieldDefs do begin
      Clear;
      Add('NR', ftAutoInc);
      Add('NP', ftInteger);
      Add('cDir', ftString, 4); // Пока данные из каждой директории-зарплаты
      Add('fNU', ftSmallInt);   // будем собирать в разные строки и по-месячно
      Add('BadId', ftString, 10);
      Add('TIN', ftString, 10);
      Add('TabN', ftInteger);
      Add('Sovm', ftSmallInt);
      Add('Fam', ftString, 20); // Фамилию имя и отчество вписываю полностью,
      Add('Ima', ftString, 20);
      Add('Otch', ftString, 20);
      Add('S_NAR', ftFloat);
      Add('S_DOX', ftFloat);
      Add('S_TAXN', ftFloat);
      Add('S_TAXP', ftFloat);
      Add('OZN_DOX', ftSmallInt);
      Add('D_PRIYN', ftDate);
      Add('D_ZVILN', ftDate);
      Add('OZN_PILG', ftSmallInt);
      //Add('MyOznPilg', ftSmallInt);
      Add('OZNAKA', ftSmallInt);
      Add('NoNwBD', ftBoolean);
      Add('DopRec', ftString, 1);// чтобы отмечать добавленные вручную записи
    end;
    CreateTable;
    AddIndex('', 'NR', [ixPrimary]);
    AddIndex('OnTinDirFNU', 'TIN;cDir;fNU', [ixCaseInsensitive]);
    AddIndex('OnTinFnuDir', 'TIN;fNU;cDir', [ixCaseInsensitive]);
    IndexName := 'OnTinDirFNU';
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg : integer;
                          cDirNm, cID, cFam, cIma, cOtch, cBadId : string;
                                      nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double;
                                                dDtPriyn, dDtZviln : TDateTime;
                                                bNotInNwBD  : boolean);
begin
  with tblTmp do begin
    // добавление DIR-месячной записи в таблицу d__KYY.db
    Append;
    FieldByName('cDir').AsString      := cDirNm;
    FieldByName('fNU').AsInteger      := nFNU;
    FieldByName('TIN').AsString       := cID;
    FieldByName('BadId').AsString     := cBadId;
    FieldByName('TabN').AsInteger     := nTabN;
    FieldByName('Sovm').AsInteger     := nSovm;
    FieldByName('Fam').AsString       := cFam;
    FieldByName('Ima').AsString       := cIma;
    FieldByName('Otch').AsString      := cOtch;
    FieldByName('S_NAR').AsFloat      := nS_NAR;
    FieldByName('S_DOX').AsFloat      := nS_DOX;
    FieldByName('S_TAXN').AsFloat     := nS_TAXN;
    FieldByName('S_TAXP').AsFloat     := nS_TAXP;
    FieldByName('OZN_DOX').AsInteger  := nOznDox;
    FieldByName('OZN_PILG').AsInteger := nOznPilg;
    if dDtPriyn <> 0 then
      FieldByName('D_PRIYN').AsDateTime := dDtPriyn;
    if dDtZviln <> 0 then
      FieldByName('D_ZVILN').AsDateTime := dDtZviln;
    FieldByName('NoNwBD').AsBoolean   := bNotInNwBD ;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.sBtnBack1Click(Sender: TObject);
begin
  PageControl1.ActivePage := ts00;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.sBtnBack2Click(Sender: TObject);
begin
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.sBrnForward2Click(Sender: TObject);
begin
//  PageControl1.ActivePage := ts3;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.dbEdiEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDfMain.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
function TFormDfMain.ItIsTin(cTin: ShortString): boolean;
var i : word; cChar : String1;
begin
  Result := true;
  cTin := Trim(cTin);
  if Length(cTin) <> 10 then
    Result := false
  else if (Copy(cTin, 1, 2) = 'БК') then
    Result := true
  else for i := 1 to 10 do begin
    cChar := cTin[i];
    if (cChar < '0') or (cChar > '9') then begin
      Result := false;
      Break;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormDfMain.MyId: ShortString;
begin
  Inc(nMyID);
  Result := 'MyId_' + IntToStr(nMyId);
end;

end.
