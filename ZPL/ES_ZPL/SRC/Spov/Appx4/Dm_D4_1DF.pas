unit Dm_D4_1DF;

interface

uses
  SysUtils, Classes, DB, DBTables,
  Messages, Variants, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, IniFiles, Buttons, Mask, DBCtrls, ExtCtrls,
  Math, DBClient, Provider, Grids, DBGrids;

type
  TDisplayProgressHandler = procedure(
    cAppendix: ShortString;
    nYear, nQuarter, nMonth,
    nCurrRow, nRowsTotal,
    nStepsTotal: integer;
    cStepName, cStepState: ShortString) of object;

  TDmD41DF = class(TDataModule)
    tblProm: TTable;
    tblPromNR: TAutoIncField;
    tblPromNP: TIntegerField;
    tblPromBadID: TStringField;
    tblPromfNU: TSmallintField;
    tblPromTabN: TIntegerField;
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
    qryZPrmUv: TQuery;
    qryZPere: TQuery;
    qryZNu: TQuery;
    qryLgotu: TQuery;
    qryDop: TQuery;
    tblTmp: TTable;
    qryTmp: TQuery;
    tblID: TTable;
    tblIDNR: TAutoIncField;
    tblIDNP: TIntegerField;
    tblIDTIN: TStringField;
    tblIDRecNR: TIntegerField;
    tblIDTabN: TIntegerField;
    tblIDSovm: TSmallintField;
    tblIDFam: TStringField;
    tblIDIma: TStringField;
    tblIDOtch: TStringField;
    tblIDBadId: TStringField;
    tblIDS_NAR: TFloatField;
    tblIDS_DOX: TFloatField;
    tblIDS_TAXN: TFloatField;
    tblIDS_TAXP: TFloatField;
    tblIDOZN_DOX: TSmallintField;
    tblIDD_PRIYN: TDateField;
    tblIDD_ZVILN: TDateField;
    tblIDOZN_PILG: TSmallintField;
    tblIDOZNAKA: TSmallintField;
    tblIDDopRec: TStringField;
    dsrcID: TDataSource;
    tblFIO: TTable;
    tblFIONR: TAutoIncField;
    tblFIONP: TIntegerField;
    tblFIOTIN: TStringField;
    tblFIOSovm: TSmallintField;
    tblFIOFam: TStringField;
    tblFIOIma: TStringField;
    tblFIOOtch: TStringField;
    tblFIOBadId: TStringField;
    tblFIOPasport: TStringField;
    tblFIOS_NAR: TFloatField;
    tblFIOS_DOX: TFloatField;
    tblFIOS_TAXN: TFloatField;
    tblFIOS_TAXP: TFloatField;
    tblFIOOZN_DOX: TSmallintField;
    tblFIOD_PRIYN: TDateField;
    tblFIOD_ZVILN: TDateField;
    tblFIOOZN_PILG: TSmallintField;
    tblFIOOZNAKA: TSmallintField;
    tblFIODopRec: TStringField;
    tblFIOTabN: TIntegerField;
    dsrcFIO: TDataSource;
    qry1000: TQuery;
    tbl1000: TTable;
    tblForCopy: TTable;
    qryProm: TQuery;
    qryPromTIN: TStringField;
    qryPromBadID: TStringField;
    qryPromSovm: TSmallintField;
    qryPromTabN: TIntegerField;
    qryPromFam: TStringField;
    qryPromIma: TStringField;
    qryPromOtch: TStringField;
    qryPromOzn_Dox: TSmallintField;
    qryPromOzn_Pilg: TSmallintField;
    qryPromd_Zviln: TDateField;
    qryPromd_Priyn: TDateField;
    qryPromOznaka: TSmallintField;
    qryPromDopRec: TStringField;
    qryPromS_NAR: TFloatField;
    qryPromS_DOX: TFloatField;
    qryPromS_TAXN: TFloatField;
    qryPromS_TAXP: TFloatField;
    dsrcProm: TDataSource;
    qryFio2: TQuery;
    qryFio2NR: TIntegerField;
    qryFio2NP: TIntegerField;
    qryFio2cDir: TStringField;
    qryFio2fNU: TSmallintField;
    qryFio2TIN: TStringField;
    qryFio2TabN: TIntegerField;
    qryFio2Fam: TStringField;
    qryFio2Ima: TStringField;
    qryFio2Otch: TStringField;
    qryFio2BadId: TStringField;
    qryFio2S_NAR: TFloatField;
    qryFio2S_DOX: TFloatField;
    qryFio2S_TAXN: TFloatField;
    qryFio2S_TAXP: TFloatField;
    qryFio2OZN_DOX: TSmallintField;
    qryFio2D_PRIYN: TDateField;
    qryFio2D_ZVILN: TDateField;
    qryFio2OZN_PILG: TSmallintField;
    qryFio2OZNAKA: TSmallintField;
    qryFio2NoNwBD: TBooleanField;
    dsrcFio2: TDataSource;
    qryRkvzt: TQuery;
    dsrcRkvzt: TDataSource;
    updRkvzt: TUpdateSQL;
    cdsLgotu: TClientDataSet;
    cdsLgotuOZN_PILG: TSmallintField;
    QryPeek: TQuery;
    CdsAlim: TClientDataSet;
    CdsAlimInn: TStringField;
    CdsAlimSum: TFloatField;
    CdsAlimOznDoh: TIntegerField;
  private
    n_MyId: integer;
    n_Year, n_Quarter, n_Month: word;

    c_Year: string;

    d_PeriodBeg, d_PeriodEnd: TDateTime;

    c_DfDirData, c_DfDirProm, c_DfDirDbfs,
    c_DfDirDocs, c_DfDirTemp, c_DfDirD00,
    c_DfDirD03, c_DfDirIND, c_DfDirResults,

    c_DfFileUni,
    c_DfFileProm,
    c_DfFileId,
    c_DfFileFi: string;

    c_TabNums: string;
    handler_DisplayProgress: TDisplayProgressHandler;

    RowNum: integer;

    MilitTaxSigns: array of Integer;
    LastMilitTaxMark: TBookmark;

    procedure CreTblDF(cTableName : string); // Создание таблицы d__KYY.db
    procedure SborFromNewBD;
    procedure CreTblProm(cTableName : string);
    procedure CreOpenDfId(cTableName : string);
    procedure CreOpenDfFio(cTableName : string);
    procedure CreOpenCdsLgotu(nTabN : integer; dDtPrc : TDateTime);

    procedure OpenQryRkvzt;
    procedure OpenTblId;
    procedure OpenQryProm;
    procedure OpenTblFio;
    procedure OpenQryFio2;

    procedure AddRecToTblProm(cBadID, cfNU, cTIN, {добавляется запись в tblProm}
      cTabN, cFam, cIma, cOtch, cD_PRIYN, cD_ZVILN,
      cOZNAKA, cDopRec : ShortString;
      nSovm, nOZN_DOX, nOZN_PILG : SmallInt;
      nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double);
    procedure AddPrmUvInfoInTblDf(nTabN : integer);

    procedure tblDfIDAddRec(bAddNew : boolean;
      nRecNR, nSovm, nOznDox, nOznPilg : Integer;
      cID, cTabN, cFam, cIma, cOtch, cBadId, cDopRec : string;
      nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double;
      dDtPriyn, dDtZviln : TDateTime);
    procedure tblDf1FIAddRec(nSovm, nOznDox, nOznPilg : Integer;
      cID, cTabN, cFam, cIma, cOtch, cBadId : string;
      nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double;
      dDtPriyn, dDtZviln : TDateTime);
      {добавляется квартальная запись в таблицу без идентиф. номеров}

    function GetInfZPere(nTabN: integer; dDtBeg, dDtEnd: TDateTime;
      var nSovm: SmallInt): boolean;

    procedure tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg : integer;
      cDirNm, cID, cFam, cIma, cOtch, cBadId : string;
      nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double;
      dDtPriyn, dDtZviln : TDateTime; bNotInNwBD  : boolean);
      {добавление DIR-месячной записи в таблицу d__KYY.db}

    function ItIsTin(cTin : ShortString) : boolean;
    function MyId: ShortString;

    procedure SaveResults(Mnth: Integer; DbfName: String);
    procedure CreateFolders(nMonth: integer; cDirName: string);

    procedure CopyToDiskId(cNmDA : ShortString); // сплошным файлом

    procedure AddRecToDbfId(cKod, cTin: string;
      nPp, nTyp, nOznDox, nOznPilg, nOznaka: integer;
      nSmNar, nSmDox, nSmTaxN, nSmTaxP, nWSb: double;
      dDtPriyn, dDtZviln: TDateTime);

    procedure AddSpecRecToDbfId(cKod, cTin : string; nPp, nTyp, nPhone : integer);

    procedure AddSmmRecToDbfId(cKod, cTin : string; nPp, nTyp : integer;
      nSmNar, nSmDox, nSmTaxN, nSmTaxP : double);

    procedure DisplayProgress(nCurRow, nRowsTotal: integer; cStepName, cState: string);

    procedure PreparePeekUdrg;
    procedure PeekUdrg(SpecNr: Integer; out INN: ShortString; out Ozn: Integer);
    procedure AddAlim(Inn: ShortString; Ozn: Integer; Sum: Double);

    function SplitMilitTax(FullIncome, FullTaxSum: Double;
      var TaxSumRemain: Double): Double;

    function FindMilitTaxSign(Sign: Integer): Boolean;

  public
    { Public declarations }
    procedure Run(
      dPeriodBeg, dPeriodEnd: TDateTime;
      cDirName, cDBFName, cTabNums: string;
      displayProgressHandler: TDisplayProgressHandler);

    function LastRowNum: integer;
  end;

var
  DmD41DF: TDmD41DF;

implementation

uses
  A_Const, A_Lib, Z_Dm, AppSettings, DateLib, NumUtils, ReportSpov,
  QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
// Запустить формирование Приложения 4 (ранее 1DF)
//------------------------------------------------------------------------------
procedure TDmD41DF.Run(
  dPeriodBeg, dPeriodEnd: TDateTime;
  cDirName, cDBFName, cTabNums: string;
  displayProgressHandler: TDisplayProgressHandler);
var i, j : word;
    cDbgMsg, cBadId, cSvIndexName : ShortString;
    cMM, cUniTableName, cDirNm, cFNU, cID, cTabN, cFam, cIma, cOtch : string;
    nMesN, nFNU, nTabN, nVidN, nSovm, nOznDox, nOznPilg, nMaxPilga : integer;
    nSvTabN, nNextTabN, nLastTabN : integer;
    nS_NAR,  nS_DOX,  nS_TAXN,  nS_TAXP,
    dDtPriyn, dDtZviln, dDtMesEnd : TDateTime;
    bObnulitDatu : boolean;
    bNotInNwBD, bFromNewBD, bPisaliDatu, bAddNew : boolean;
    nRecNr, nCntRecInOznDox, nCntRecInFNU : SmallInt;
    nTabN110 : integer; nSovm110 : SmallInt;
    bIsDtPrm, bIsDtUv : boolean;
    nSmDoxFNU : double;
    nMinPilgaFNU, nMaxPilgaFNU, nNewOznPilg : SmallInt; bNeedUpdFNU : boolean;
    bChangeMinPilg, bChangeMaxPilg : boolean;
    cSvTmpIndx, cDopRec : ShortString;
    nCurRow: integer;
    dummyWord: word;
begin
  n_MyId := 0;
  c_TabNums := cTabNums;

  d_PeriodBeg := dPeriodBeg;
  d_PeriodEnd := dPeriodEnd;

  // Признаки, между которыми будут делиться суммы военного сбора
  SetLength(MilitTaxSigns, 3);
  MilitTaxSigns[0] := 101;
  MilitTaxSigns[1] := 102;
  MilitTaxSigns[2] := 127;

  handler_DisplayProgress := displayProgressHandler;

  DecodeDate(dPeriodBeg, n_Year, n_Month, dummyWord);
  n_Quarter := (n_Month - 1) div 3 + 1;

  c_Year := Copy(IntToStr(n_Year), 3, 2);

  CreateFolders(n_Month, cDirName);

  // Создать таблицу d__KYY.db
  CreTblDF(c_DfFileUni);
  // Собрать в нее данные из основной БД_110
  SborFromNewBD; // выбор из основной БД

  CreTblProm(c_DfFileProm); // Создается и открывается пустая таблица tblProm.db
  CreOpenDfId(c_DfFileId);  // Создается и открывается пустая таблица d_KYY_id.db

  with qryDop do begin
    // Выбрать только "боевые" ТИНы с тем, чтобы дальше делать
    // по каждому дальнейшие мудреные операции
    if Active then Close;
    SQL.Clear;
    DataBaseName := tblTmp.DatabaseName;
    SQL.Add('Select distinct TIN from ' + c_DfFileUni);
    SQL.Add(' where (not TIN is null) and (TIN <> "") and ');
    SQL.Add(' (not Substring(TIN FROM 1 FOR 5) = "MyId_")');
    Open;
  end;

  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := tblTmp.DatabaseName;
    SQL.Add('Select * from ' + c_DfFileUni);
    SQL.Add(' where TIN = :cTIN');
    SQL.Add(' order by TIN, Ozn_Dox, fNU, cDir, Ozn_Pilg ');
    // т.е., если есть запись из 110-й БД, она будет 1-й в пределах fNU (месяца)
    // т.о., если есть 110-е записи, все ДтПрм, ДтУв, Совм и пр. будут из
    // основной 110-й БД, а потом к ним добавлю только суммы из НИЧевских твблиц
  end;

  qryDop.First;

  nCurRow := 0;
  DisplayProgress(nCurRow, qryDop.RecordCount, 'Заполнение таблицы Prom','Начато');

  while not qryDop.Eof do begin
    Inc(nCurRow);
    DisplayProgress(nCurRow, qryDop.RecordCount, 'Заполнение таблицы Prom','');

    with qryTmp do begin
      Close;
      ParamByName('cTIN').AsString := qryDop.FieldByName('TIN').AsString;
      Open;

      // Сначала выяснить, есть ли записи в БД_110, если да - выяснить,
      // совместитель или нет в БД_110 в текущем квартале. Если сведения
      // в БД_110 есть - принимаю совместительство из БД_110

      First;
      cTabN := FieldByName('TabN').AsString;
      nSovm110 := -1;
      while not Eof do begin
        if FieldByName('cDir').AsString = 'D_01' then begin
          nTabN110 := FieldByName('TabN').AsInteger;
          if GetInfZPere(nTabN110, dPeriodBeg, dPeriodEnd+27, nSovm110) then;
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

  DisplayProgress(nCurRow, qryDop.RecordCount, 'Заполнение таблицы Prom','Завершено');

  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := tblTmp.DatabaseName;
    SQL.Add('Select TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg, ' +
            ' d_Priyn, d_Zviln, Oznaka, DopRec, Sum(S_Nar) as S_NAR, ' +
            ' Sum(S_Dox) as S_DOX, Sum(S_TaxN) as S_TAXN, ' +
            ' Sum(S_TaxP) as S_TAXP from ' + c_DfFileProm + ' where TIN = :cTIN ' +
            ' group by TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg, ' +
            ' d_Priyn, d_Zviln, Oznaka, DopRec');
  end;

  // sb MemoDbg.Lines.Add('Группируются сведения по ИД-номерам (файл ' +
  // sb                                               cDfDirProm + c_DfFileId + ')');
  qryDop.First;

  nCurRow := 0;
  DisplayProgress(nCurRow, qryDop.RecordCount, 'Заполнение таблицы Id','Начато');

  while not qryDop.Eof do begin
    Inc(nCurRow);
    DisplayProgress(nCurRow, qryDop.RecordCount, 'Заполнение таблицы Id','');

    with qryTmp do begin
      Close;
      ParamByName('cTIN').AsString := qryDop.FieldByName('TIN').AsString;
      Open;
      // Благодаря вышележащей группировке надеюсь добиться
      // правильного объединения и сбора в таблицу tblDfID
      cID := FieldByName('TIN').AsString;
      nCntRecInOznDox := 0;
      nRecNR := 0;
      bIsDtPrm := false;
      bIsDtUv := false;
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
        nS_NAR  := FieldByName('S_NAR').AsFloat;
        nS_DOX  := FieldByName('S_DOX').AsFloat;
        nS_TAXN := FieldByName('S_TAXN').AsFloat;
        nS_TAXP := FieldByName('S_TAXP').AsFloat;

        if (nOznDox >= 169) then begin
          // НеОблМатПом. Одна из ДопЗаписей - молча дописываю в c_DfFileId
          bAddNew := true;
          tblDfIDAddRec(bAddNew, 77, nSovm, nOznDox, nOznPilg, cID,
            cTabN, cFam, cIma, cOtch, cBadId, cDopRec,
            nS_NAR, nS_DOX, nS_TAXN, nS_TAXP, dDtPriyn, dDtZviln);

        end else if (nS_NAR <> 0) or (nS_DOX <> 0) or (nS_TAXN <> 0) or
            (nS_TAXP <> 0) or (dDtPriyn <> 0) or (dDtZviln <> 0) then begin
          bAddNew := true;
          Inc(nRecNR);

          tblDfIDAddRec(bAddNew, nRecNR, nSovm, nOznDox, nOznPilg, cID,
            cTabN, cFam, cIma, cOtch, cBadId, cDopRec,
            nS_NAR, nS_DOX, nS_TAXN, nS_TAXP, dDtPriyn, dDtZviln);
        end;

        Next;
      end;
    end;
    qryDop.Next;
  end;

  DisplayProgress(nCurRow, qryDop.RecordCount, 'Заполнение таблицы Id','Завершено');

  with tblTmp do begin   // Добавить информацию о приёмах / увольнениях
    cSvTmpIndx := IndexName;
    IndexName := 'OnTabNOznDox';

    nCurRow := 0;
    DisplayProgress(nCurRow, RecordCount, 'Заполнение приёмов/увольнений','Начато');

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
            Inc(nCurRow);
            DisplayProgress(nCurRow, RecordCount, 'Заполнение приёмов/увольнений','');

            AddPrmUvInfoInTblDf(qryZPrmUv.FieldByName('TabN').AsInteger);
            qryZPrmUv.Next;
          end;
        end;
        nSvTabN := nNextTabN;
        Locate('TabN', nNextTabN, []);
      end;
    end;

    DisplayProgress(nCurRow, RecordCount, 'Заполнение приёмов/увольнений','Завершено');

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

  // Создать таблицу c_DfFileFi для НеИмеющих ТИН'ов
  // sb MemoDbg.Lines.Add('Группируются сведения по ИД-неимущим (файл ' + c_DfFileFi + ')');
  CreOpenDfFio(c_DfFileFi);  //   d_104_fi.db
  nSovm := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := tblTmp.DatabaseName;
    SQL.Add('Select * from ' + c_DfFileUni);
    SQL.Add(' where (TIN is null) or (TIN = "") or ');
    SQL.Add(' (Substring(TIN FROM 1 FOR 5) = "MyId_")');
    SQL.Add(' order by TIN, Fam, Ima, Otch, cDir, fNU, TabN, Ozn_Dox');
    Open;

    nCurRow := 0;
    DisplayProgress(nCurRow, qryTmp.RecordCount, 'Заполнение Fi для не имеющих ТИН','Начато');

    while not Eof do begin
      Inc(nCurRow);
      DisplayProgress(nCurRow, RecordCount, 'Заполнение Fi для не имеющих ТИН','');

      dDtPriyn := 0;
      dDtZviln := 0;
      cID := FieldByName('TIN').AsString;
      cBadId := FieldByName('BadId').AsString;
      cTabN := FieldByName('TabN').AsString;
      cFam := FieldByName('Fam').AsString;
      cIma := FieldByName('Ima').AsString;
      cOtch := FieldByName('Otch').AsString;

      if (not FieldByName('d_Priyn').IsNull) and
          (FieldByName('d_Priyn').AsDateTime >= d_PeriodBeg) and
          (FieldByName('d_Priyn').AsDateTime <= d_PeriodEnd) then
        dDtPriyn := FieldByName('d_Priyn').AsDateTime;

      if (not FieldByName('d_Zviln').IsNull) and
          (FieldByName('d_Zviln').AsDateTime >= d_PeriodBeg) and
          (FieldByName('d_Zviln').AsDateTime <= dPeriodEnd) then
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
                (FieldByName('d_Priyn').AsDateTime >= dPeriodBeg) and
                  (FieldByName('d_Priyn').AsDateTime <= dPeriodEnd) then
            dDtPriyn := FieldByName('d_Priyn').AsDateTime;
          if (not FieldByName('d_Zviln').IsNull) and
                (FieldByName('d_Zviln').AsDateTime >= dPeriodBeg) and
                  (FieldByName('d_Zviln').AsDateTime <= dPeriodEnd) then
            dDtZviln := FieldByName('d_Zviln').AsDateTime;
          Next;
        end;
        // Добавить запись в таблицу d_KYY_f1.db
        tblDf1FIAddRec(nSovm, nOznDox, nOznPilg,
                        cID, cTabN, cFam, cIma, cOtch, cBadId,
                        nS_NAR, nS_DOX, nS_TAXN, nS_TAXP, dDtPriyn, dDtZviln);
      end;
    end;

    DisplayProgress(nCurRow, RecordCount, 'Заполнение Fi для не имеющих ТИН','Завершено');
  end;

  SaveResults(DateUtils.MonthOfQuarter(n_Month), cDBFName);
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.AddAlim(
  Inn: ShortString;
  Ozn: Integer;
  Sum: Double);
begin
  with CdsAlim do begin
    if Locate('Inn;Ozn', VarArrayOf([Inn, Ozn]), []) then
      Edit
    else begin
      Append;
      FieldByName('Inn').AsString := Inn;
      FieldByName('Ozn').AsInteger := Ozn;
    end;

    FieldByName('Sum').AsFloat := FieldByName('Sum').AsFloat + Sum;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.PreparePeekUdrg;
begin
  InitQuery(QryPeek);

  with QryPeek, SQL, QryUtils do begin
    Add(
      'select TargetInn, OznDoh ' +
      'from z_Uderg ' +
      'where Spec_Nr = :SpecNr');
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.PeekUdrg(
  SpecNr: Integer;
  out INN: ShortString;
  out Ozn: Integer
);
begin
  with QryPeek do begin
    ParamByName('SpecNr').AsInteger := SpecNr;
    Open;
    INN := FieldByName('TargetInn').AsString;
    Ozn := FieldByName('OznDoh').AsInteger;
    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.CreTblDF(cTableName : string);
begin           {Создание месячной таблицы d__KYY.db для сбора данных из Z_NU}
  with tblTmp do begin
    if Active then Close;
    IndexName := '';
    DataBaseName := c_DfDirProm;
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
procedure TDmD41DF.SborFromNewBD;
var dDOB, dDtPrc, dDtPrikaza, dDtTmp : TDateTime;
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
    nSmForPdn, nSmPoroga : double;
    nCurRow, nRowsTotal: integer;
    cDbgTabN : ShortString;

  TargetInn: ShortString;
  TargetOzn: Integer;
begin
  with CdsAlim do begin
    CreateDataSet;
    Open;
  end;
  
  PreparePeekUdrg;

  bNotInNwBD := false;    // т.к. это и есть записи NwBD
  cDirNm := 'D_01';
  nCurRow := 0;

  with qryZPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_PrmUv where TabN = :nTabN and ' +
           ' ((Dt_Priem >= :dDtBeg and Dt_Priem <= :dDtEnd) or ' +
           '  (Dt_Uvoln >= :dDtBeg and Dt_Uvoln <= :dDtEnd)) ' +
           ' order by Dt_Priem, Dt_Uvoln, NR');
    ParamByName('dDtBeg').AsDateTime := d_PeriodBeg;
    ParamByName('dDtEnd').AsDateTime := d_PeriodEnd;
  end;
  cDbgTabN := ' (78,19308)';

  with qryZNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;

    {if bFlagDbg then
      SQL.Add('Select First 2800 * from ViNuMain where dtProc >= :dDtBeg and ' +
            ' DtProc <= :dDtEnd and (VidN <= "6002" or ' +
            ' VidN in ("6007","8681","8682","8683","8684","8685","8686","8687")) ' +
            ' and TabN > 0 ')
    else}
    SQL.Add(
      'select * from ViNuMain where dtProc >= :dDtBeg and ' +
      'DtProc <= :dDtEnd and (VidN <= "6002" or ' +
      'VidN in ("6007","6601","8681","8682","8683","8684","8685","8686","8687")) ' +
      'and TabN > 0 ');
    if c_TabNums <> '' then
      SQL.Add(' and TabN in (' + c_TabNums + ')');
    SQL.Add('order by TabN, DtProc, VidN');

    ParamByName('dDtBeg').AsDateTime := d_PeriodBeg;
    ParamByName('dDtEnd').AsDateTime := d_PeriodEnd;
    Open;

    nCurRow := 0;
    nRowsTotal := RecordCount;
    DisplayProgress(nCurRow, nRowsTotal, 'Заполнение первой промежуточной таблицы','Начато');

    while not Eof do begin
      Inc(nCurRow);
      nTabN := FieldByName('TabN').AsInteger;

      CdsAlim.EmptyDataSet;

      cBadId := '';
      DmMain.GetUpiInfo(nTabN, cFamIO, cFam, cIma, cOtch, cPol, cID, dDOB); {z_Dm}
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
          cSpAv, cDolgnost, cNrPrikaza, dDtPrikaza, bPens, bSovm, bPrfs, bInv);

        if (nM = 1) or (nM = 4) or (nM = 7) or (nM = 10) then
          nFNU := 1   // 1-й месяц квартала
        else if (nM = 2) or (nM = 5) or (nM = 8) or (nM = 11) then
          nFNU := 2   // 2-й месяц квартала
        else
          nFNU := 3;   // 3-й месяц квартала

        nS101_NAR  := 0; nS101_DOX  := 0; nS101_TAXN := 0; nS101_TAXP := 0;
        nS102_NAR  := 0; nS102_DOX  := 0; nS102_TAXN := 0; nS102_TAXP := 0;
        nS127_NAR  := 0; nS127_DOX  := 0; nS127_TAXN := 0; nS127_TAXP := 0;
        nS128_NAR  := 0; nS128_DOX  := 0; nS128_TAXN := 0; nS128_TAXP := 0;
        nS133_NAR  := 0; nS133_DOX  := 0; nS133_TAXN := 0; nS133_TAXP := 0;
        nS140_NAR  := 0; nS140_DOX  := 0; nS140_TAXN := 0; nS140_TAXP := 0;
        nS169_NAR  := 0; nS169_DOX  := 0; nS169_TAXN := 0; nS169_TAXP := 0;

        nSmForPdn := 0;
        nWSb_Nar := 0;
        nWSb_Tax := 0;

        nOznDox := 101; // для начала принимаю, что все доходы основные

        if bSovm then
          nSovm := 1
        else
          nSovm := 0;

        while (FieldByName('TabN').AsInteger = nTabN) and
            (FieldByName('DtProc').AsDateTime = dDtPrc) and not Eof do begin

          Inc(nCurRow);
          DisplayProgress(nCurRow, nRowsTotal, 'Заполнение первой промежуточной таблицы','');

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

          else if (cVidN = '1901') or (cVidN = '1909') or (cVidN = '2602') then begin
            // Част.Опл.Отп, Рожд.ребенка, Декретн
            if FieldByName('SPdn').AsString > '0' then
              nSmForPdn := nSmForPdn + nSmm;
            nS128_NAR := nS128_NAR + nSmm;
            nS128_DOX := nS128_DOX + nSmm; end

          else if (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008') then begin
            // Договорные
            nS102_NAR := nS102_NAR + nSmm;
            nS102_DOX := nS102_DOX + nSmm; end

          else if (cVidN >= '8681') and (cVidN <= '8687') then begin
            // ЕСВ с прп
            nS133_NAR := nS133_NAR - nSmm;
            nS133_DOX := nS133_DOX - nSmm; end

          else if (cVidN = '6601') then begin
            // Алименты
            // nS140_NAR := nS140_NAR + nSmm;
            // nS140_DOX := nS140_DOX + nSmm;

            PeekUdrg(FieldByName('Spec_Nr').AsInteger, TargetInn, TargetOzn);

            // запись попадает в 4ДФ только если в удержаниях указан ИНН
            if TargetInn <> '' then
              AddAlim(TargetInn, TargetOzn, nSmm * -1);

          end else if (cVidN = '6001') or (cVidN = '6002') then begin
            // Подоходные
            if (FieldByName('MyNotes').AsString = 'Dgv') or
                (FieldByName('KdKatP').AsInteger = 13) then begin
              nS102_TAXN := nS102_TAXN - nSmm;
              nS102_TAXP := nS102_TAXP - nSmm; end
            else begin
              nS101_TAXN := nS101_TAXN - nSmm;
              nS101_TAXP := nS101_TAXP - nSmm;
            end; end

          else if ((cVidN < '2700') or (cVidN > '2800')) and (cVidN < '6000')  then begin
            // Все начисления

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

        if nS127_NAR <> 0 {облагаемая матПомощь} then begin
          // рассчитать приходящийся на нее подоходный и поправить nS101_TaxN
          nS127_TaxN := RoundTo(nS127_Nar * nS101_TaxN / (nS101_Nar + nS127_Nar), -2);
          nS127_TaxP := nS127_TaxN;
          nS101_TaxN := nS101_TaxN - nS127_TaxN;
          nS101_TaxP := nS101_TaxN;
        end;

        // Ознаку пильги нужно записывать только в том случае, если она
        // ПРИМЕНЯЛАСЬ, т.е. если заработок был меньше порога
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

        if (nWSb_Nar <> 0) or (nWSb_Tax <> 0) {ВоенноСборные дела} then begin
          // Если есть соответствующие суммы - соответственно добавляются записи
          // со своими ознаками nOznDox и nOznPilg
          nOznDox := 1{777};
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
            cDirNm, cID, cFam, cIma, cOtch, cBadId,
            nWSb_Nar, nWsb_Nar, nWSb_Tax, nWSb_Tax,
            dDtPriyn, dDtZviln, bNotInNwBD);
        end;

        if (nS102_NAR <> 0) or (nS102_TAXN <> 0) then begin
          // Договорные виды
          nOznDox := 102;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
            cDirNm, cID, cFam, cIma, cOtch, cBadId,
            nS102_NAR, nS102_DOX, nS102_TAXN, nS102_TAXP,
            dDtPriyn, dDtZviln, bNotInNwBD);
        end;

        if nS127_NAR <> 0 then begin
          // Облагаемая матпомощь
          nOznDox := 127;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
            cDirNm, cID, cFam, cIma, cOtch, cBadId,
            nS127_NAR, nS127_DOX, nS127_TAXN, nS127_TAXP,
            dDtPriyn, dDtZviln, bNotInNwBD);
        end;

        if nS128_NAR <> 0 then begin
          // Част.Опл.Отп, Рожд.ребенка, Декр
          nOznDox := 128;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
            cDirNm, cID, cFam, cIma, cOtch, cBadId,
            nS128_NAR, nS128_DOX, 0, 0,
            dDtPriyn, dDtZviln, bNotInNwBD);
        end;

        if nS133_NAR <> 0 then begin
          // ЕСВ с предприятия
          nOznDox := 133;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
            cDirNm, cID, cFam, cIma, cOtch, cBadId,
            nS133_NAR, nS133_DOX, 0, 0,
            0, 0, bNotInNwBD);
        end;

//      if nS140_NAR <> 0 then begin
        // Алименты
        with CdsAlim do
          if CdsAlim.RecordCount > 0 then begin
            // SB 12.10.2026
            // Оксана: добавляем справочник "ознак" и в диалоге удержаний
            // для алиментов указываем "ознаку". Соответственно, оттуда теперь
            // и выбираем
            // nOznDox := 140;
            
            nOznPilg := 0;

            First;
            while not Eof do begin
              TargetInn := FieldByName('INN').AsString;

              TargetOzn := FieldByName('Ozn').AsInteger;
              // Чтобы бухг. не бегали проставлять ознаки по всем удержаниям,
              // где они ранее не были проставлены, если ноль - ставим как и
              // прежде 140
              if TargetOzn = 0 then
                TargetOzn := 140;

              tblDfAddRec(nFNU, nTabN, nSovm, TargetOzn, nOznPilg,
                cDirNm, TargetInn, cFam, cIma, cOtch, cBadId,
                FieldByName('Sum').AsFloat, FieldByName('Sum').AsFloat, 0, 0,
                dDtPriyn, dDtZviln, bNotInNwBD);

              Next;
            end;
          end;

        if nS169_NAR <> 0 then begin
          // Необлагаемая матпомощь
          nOznDox := 169;
          nOznPilg := 0;
          tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg,
            cDirNm, cID, cFam, cIma, cOtch, cBadId,
            nS169_NAR, nS169_DOX, 0, 0,
            dDtPriyn, dDtZviln, bNotInNwBD);
        end;
      end;
    end;

    DisplayProgress(nCurRow, nRowsTotal, 'Заполнение первой промежуточной таблицы','Завершено');
  end;

  CdsAlim.Close;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.CreTblProm(cTableName : string);
begin
  with tblProm do begin
    if Active then Close;
    IndexName := '';
    FieldDefs.Clear;
    IndexDefs.Clear;
    DataBaseName := c_DfDirProm;
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
procedure TDmD41DF.CreOpenDfId(cTableName : string);
begin
  with tblTmp do begin
    if Active then Close;
    IndexName := '';
    FieldDefs.Clear;
    IndexDefs.Clear;
    DataBaseName := c_DfDirProm;
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
procedure TDmD41DF.tblDfIDAddRec(bAddNew : boolean;
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
procedure TDmD41DF.CreOpenDfFio(cTableName : string);
begin
  with tblTmp do begin
    if Active then Close;
    IndexName := '';
    FieldDefs.Clear;
    IndexDefs.Clear;
    DataBaseName := c_DfDirProm;
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
procedure TDmD41DF.tblDf1FIAddRec(nSovm, nOznDox, nOznPilg : Integer;
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
function TDmD41DF.ItIsTin(cTin: ShortString): boolean;
var i : word; cChar : String1;
begin
  Result := (Length(cTIN) > 0) and (Length(cTIN) >= 10);

  {
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
  }
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.tblDfAddRec(nFNU, nTabN, nSovm, nOznDox, nOznPilg: integer;
  cDirNm, cID, cFam, cIma, cOtch, cBadId: string;
  nS_NAR, nS_DOX, nS_TAXN, nS_TAXP: double;
  dDtPriyn, dDtZviln: TDateTime;
  bNotInNwBD: boolean);
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
procedure TDmD41DF.CreOpenCdsLgotu(nTabN: integer; dDtPrc: TDateTime);
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
function TDmD41DF.MyId: ShortString;
begin
  Inc(n_MyID);
  Result := 'MyId_' + IntToStr(n_MyId);
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.AddRecToTblProm(cBadID, cfNU, cTIN, cTabN,
  cFam, cIma, cOtch, cD_PRIYN, cD_ZVILN,
  cOZNAKA, cDopRec : ShortString;
  nSovm, nOZN_DOX, nOZN_PILG : SmallInt;
  nS_NAR, nS_DOX, nS_TAXN, nS_TAXP : double);
var
  nCurRow: integer;
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
procedure TDmD41DF.AddPrmUvInfoInTblDf(nTabN : integer);
var
  bIsMesto : boolean;
  cSvDir, cSvFNU, cSvTIN, cSvSovm,
  cSvFam, cSvIma, cSvOtch, cSvOznDox, cSvOznPilg : ShortString;
  nCurRow, nRowsTotal: integer;
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

    nCurRow := 0;
    DisplayProgress(nCurRow, nRowsTotal, 'Заполнение приёмов/увольнений в TblDf','Начато');

    First;
    while not Eof do begin
      Inc(nCurRow);
      DisplayProgress(nCurRow, nRowsTotal, 'Заполнение приёмов/увольнений в TblDf','Завершено');

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
               (qryZPrmUv.FieldByName('Dt_Priem').AsDateTime >= d_PeriodBeg) and
               (qryZPrmUv.FieldByName('Dt_Priem').AsDateTime <= d_PeriodEnd) then
          FieldByName('D_Priyn').AsString :=
                                     qryZPrmUv.FieldByName('Dt_Priem').AsString;
        if not qryZPrmUv.FieldByName('Dt_Uvoln').IsNull and
               (qryZPrmUv.FieldByName('Dt_Uvoln').AsDateTime >= d_PeriodBeg) and
               (qryZPrmUv.FieldByName('Dt_Uvoln').AsDateTime <= d_PeriodEnd) then
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

    DisplayProgress(nCurRow, nRowsTotal, 'Заполнение приёмов/увольнений в TblDf','Завершено');

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
              (qryZPrmUv.FieldByName('Dt_Priem').AsDateTime >= d_PeriodBeg) and
               (qryZPrmUv.FieldByName('Dt_Priem').AsDateTime <= d_PeriodEnd) then
        FieldByName('D_Priyn').AsString :=
                                     qryZPrmUv.FieldByName('Dt_Priem').AsString;
      if not qryZPrmUv.FieldByName('Dt_Uvoln').IsNull and
              (qryZPrmUv.FieldByName('Dt_Uvoln').AsDateTime >= d_PeriodBeg) and
               (qryZPrmUv.FieldByName('Dt_Uvoln').AsDateTime <= d_PeriodEnd) then
        FieldByName('D_Zviln').AsString :=
                                     qryZPrmUv.FieldByName('Dt_Uvoln').AsString;
      FieldByName('DopRec').AsString := '1';
      Post;
    end;
    Filtered := false;
  end;
end;

//------------------------------------------------------------------------------
function TDmD41DF.GetInfZPere(
  nTabN: integer; dDtBeg, dDtEnd: TDateTime;
  var nSovm: SmallInt): boolean;
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
procedure TDmD41DF.SaveResults(Mnth: Integer; DbfName: String);
begin
  OpenTblId;
  OpenQryRkvzt;
  OpenQryProm;
  OpenTblFio;
  OpenQryFio2;

  // CopyToDiskId(DbfName + '_' + IntToStr(Mnth) + '.dbf');
  // С 1.1.2025 - помесячно
  CopyToDiskId(DbfName + '.dbf');
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.CreateFolders(nMonth: integer; cDirName: string);
var
  Drive: ShortString;
begin
  if bFlagDbg or (AppSetts.UserId = 101) then
    Drive := DRIVE_FOR_REPORTS_DEBUG
  else
    Drive := DRIVE_FOR_REPORTS;

  c_DfDirData := Drive + '\Df_SPOV\';

  if bFlagDbg then
    c_DfDirDbfs := c_DfDirData + 'DBG_DBFS\'
  else
    c_DfDirDbfs := c_DfDirData + 'DBFS\';

  c_DfDirDocs := c_DfDirData + 'DOCS\DF\';
  c_DfDirTemp := c_DfDirDbfs  + 'TEMP\';
  c_DfDirD00  := c_DfDirDbfs + 'D_00\';
  c_DfDirD03  := c_DfDirDbfs + 'D_03\';   // НИЧ
  c_DfDirIND  := cDirInd; // та, что и в z_Main
  if not DirectoryExists('c:\T_E_M_P\') then
    ForceDirectories('c:\T_E_M_P\');  // на всякий случай
  if not DirectoryExists(c_DfDirTemp) then
    ForceDirectories(c_DfDirTemp);
  if not DirectoryExists(c_DfDirDocs) then
    ForceDirectories(c_DfDirDocs);
  if not DirectoryExists(c_DfDirD00) then
    ForceDirectories(c_DfDirD00);
  if not DirectoryExists(c_DfDirD03) then
    ForceDirectories(c_DfDirD03);

  c_DfDirResults := cDirName;
  if not DirectoryExists(c_DfDirResults) then
    ForceDirectories(c_DfDirResults);

  // Для формирования промежуточных файлов
  c_DfDirProm := c_DfDirD00 + 'DF\K' + IntToStr(n_Year) + '_' + IntToStr(n_Quarter) + '\';
  if not DirectoryExists(c_DfDirProm) then
    ForceDirectories(c_DfDirProm);

  c_DfFileProm := 'Prom' + IntToStr(nMonth) + '.db';
  c_DfFileUni := 'd_' + IntToStr(nMonth) + '.db';
  c_DfFileId := 'd_' + IntToStr(nMonth) + '_id.db';
  c_DfFileFi := 'd_' + IntToStr(nMonth) + '_fi.db';
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.CopyToDiskId(cNmDA: ShortString);
var
  cDbfTemplate, cNewFileName: string;
  bSkipZero: boolean;
  nSvNr, nTyp, nPhone: integer;
  cKod: string;
  INN: ShortString;
  nSmNar, nSmDox, nSmTaxN, nSmTaxP: double;
  FullIncome, FullMilitTax, MilitTaxPart, MilitTaxRemain: Double;
begin
  nTyp := 0; // 0 - юр.лицо, 1 - физ.лицо
  cKod := qryRkvzt.FieldByName('OrgEDRPOU').AsString;
  bSkipZero := true {ChBoxZeroLines.Checked};
  cDbfTemplate := Appx4TmplName;
  cNewFileName := c_DfDirResults + cNmDA;

  if FileExists(cNewFileName) then
    DeleteFile(cNewFileName);

  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select FVid from Ex_Tmplts ' +
              ' where NmTmpl = :cNmTmpl ');
    ParamByName('cNmTmpl').AsString := cDbfTemplate;
    Open;
    if RecordCount > 0 then
      (FieldByName('FVid') as TBlobField).SaveToFile(cNewFileName);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;

  with tblForCopy do begin
    if Active then Close;
    DataBaseName := c_DfDirResults;
    TableType := ttDBase;
    TableName := cNmDA;
    if Active then
      Close;
    Open;
  end;

  with tblId do begin
    nSvNr := FieldByName('NR').AsInteger;

    First;
    RowNum := 0;

    nSmNar  := 0;
    nSmDox  := 0;
    nSmTaxN := 0;
    nSmTaxP := 0;
    INN := '';

    DisplayProgress(RowNum, RecordCount, 'Заполнение результирующего .DBF','Начато');

    while not Eof do begin
      if bSkipZero and (FieldByName('S_NAR').AsFloat = 0) and
          (FieldByName('S_DOX').AsFloat = 0) and
          (FieldByName('S_TAXN').AsFloat = 0) and
          (FieldByName('S_TAXP').AsFloat = 0) and
          (FieldByName('Ozn_Pilg').AsInteger <> 4) then begin
        Next;
        Continue;
      end;

      INN := FieldByName('TIN').AsString;
      FullIncome := 0;
      FullMilitTax := 0;
      MilitTaxRemain := FullMilitTax;

      while (FieldByName('TIN').AsString = INN) and not Eof do begin
        Inc(RowNum);

        DisplayProgress(RowNum, RecordCount, 'Заполнение результирующего .DBF','');

        // Похоже, что записи отсортированы по признаку дохода. Так что
        // эти суммы получим сразу
        if FieldByName('Ozn_Dox').AsInteger = 1 then begin
          // Полная сумма дохода, с которой начислялось военное обдиралово
          FullIncome := FieldByName('S_DOX').AsFloat;
          // Полная сумма военного обдиралова
          FullMilitTax := FieldByName('S_TAXP').AsFloat;
          // Остаток суммы обдиралова, которое ещё не распределено между видами
          // дохода
          MilitTaxRemain := FullMilitTax;

          Next;
          Continue;
        end;

        // Пропорционально делим сумму военного сбора между видами
        MilitTaxPart :=
          SplitMilitTax(FullIncome, FullMilitTax, MilitTaxRemain);

        AddRecToDbfId(cKod, INN, RowNum, nTyp,
          FieldByName('Ozn_Dox').AsInteger,
          FieldByName('Ozn_Pilg').AsInteger,
          FieldByName('Oznaka').AsInteger,
          FieldByName('S_NAR').AsFloat,
          FieldByName('S_DOX').AsFloat,
          FieldByName('S_TAXN').AsFloat,
          FieldByName('S_TAXP').AsFloat,
          MilitTaxPart,
          FieldByName('d_Priyn').AsDateTime,
          FieldByName('d_Zviln').AsDateTime);

        nSmNar  := nSmNar  + FieldByName('S_NAR').AsFloat;
        nSmDox  := nSmDox  + FieldByName('S_DOX').AsFloat;
        nSmTaxN := nSmTaxN + FieldByName('S_TAXN').AsFloat;
        nSmTaxP := nSmTaxP + FieldByName('S_TAXP').AsFloat;

        Next;
      end;

      // Если остался нераспределённый "хвостик" военного обдиралова, добавим
      // в последнюю для данного сотрудника на которую распределялось обдиралово
      if Assigned(LastMilitTaxMark) then begin
        with TblForCopy do begin
          if MilitTaxRemain > 0 then begin
            GotoBookmark(LastMilitTaxMark);

            Edit;
            FieldByName('A05').AsFloat :=
              FieldByName('A05').AsFloat + MilitTaxRemain;

            FieldByName('A051').AsFloat :=
              FieldByName('A051').AsFloat + MilitTaxRemain;
            Post;
          end;
          
          FreeBookmark(LastMilitTaxMark);
        end;

        LastMilitTaxMark := nil;
      end;
    end;

    DisplayProgress(RowNum, RecordCount, 'Заполнение результирующего .DBF','Завершено');

    Locate('NR', nSvNR, []);
  end;

  tblForCopy.Close;
end;

//------------------------------------------------------------------------------
function TDmD41DF.SplitMilitTax(
  FullIncome, FullTaxSum: Double;
  var TaxSumRemain: Double
): Double;
var
  Income: Double;
begin
  with TblId do
    if FindMilitTaxSign(FieldByName('Ozn_Dox').AsInteger) then begin
      // Отмечаем запись на случай если она последняя для данного сотрудник
      // на которую распределяется военный сбор. Если останется нераспределённый
      // "хвостик", добавим в неё.
      if Assigned(LastMilitTaxMark) then
        TblForCopy.FreeBookmark(LastMilitTaxMark);

      LastMilitTaxMark := TblForCopy.GetBookmark;

      Income := FieldByName('S_DOX').AsFloat;

      Result := RoundTo(FullTaxSum * Income / FullIncome, -2);
      Result := Min(Result, TaxSumRemain);

      TaxSumRemain := TaxSumRemain - Result;
    end;
end;

//------------------------------------------------------------------------------
function TDmD41DF.FindMilitTaxSign(Sign: Integer): Boolean;
var
  I: Integer;
begin
  Result := false;

  for I := 0 to Length(MilitTaxSigns) - 1 do begin
    Result := MilitTaxSigns[I] = Sign;

    if Result then
      break;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.AddRecToDbfId(cKod, cTin : string;
                     nPp, nTyp, nOznDox, nOznPilg, nOznaka : integer;
                     nSmNar, nSmDox, nSmTaxN, nSmTaxP, nWSb : double;
                     dDtPriyn, dDtZviln : TDateTime);
begin
  if nOznDox = 133 then // не писать
    exit;

  nSmNar := MyRound(nSmNar, 2);
  nSmDox := MyRound(nSmDox, 2);
  nSmTaxN := MyRound(nSmTaxN, 2);
  nSmTaxP := MyRound(nSmTaxP, 2);
  nWSb := MyRound(nWSb, 2);

  with tblForCopy do begin
    Append;
    FieldByName('NP').AsInteger := nPp;
    FieldByName('Period').AsInteger := n_Quarter;
    FieldByName('Rik').AsInteger := n_Year;
    FieldByName('Kod').AsString := cKod;
    FieldByName('Typ').AsInteger := nTyp;
    FieldByName('TIN').AsString := cTin;
    FieldByName('S_NAR').AsFloat := nSmNar;
    FieldByName('S_DOX').AsFloat := nSmDox;
    FieldByName('S_TAXN').AsFloat := nSmTaxN;
    FieldByName('S_TAXP').AsFloat := nSmTaxP;
    FieldByName('OZN_DOX').AsInteger := nOznDox;
    if dDtPriyn <> 0 then
      FieldByName('D_PRIYN').AsDateTime := dDtPriyn;
    if dDtZviln <> 0 then
      FieldByName('D_ZVILN').AsDateTime := dDtZviln;
    FieldByName('OZN_PILG').AsInteger := nOznPilg;
    FieldByName('Oznaka').AsInteger := nOznaka;

    FieldByName('A051').AsFloat := nWSb;
    FieldByName('A05').AsFloat := nWSb;

    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.AddSpecRecToDbfId(cKod, cTin : string;
                                        nPp, nTyp, nPhone : integer);
begin
  with tblForCopy do begin
    Append;
    FieldByName('NP').AsInteger := nPp;
    FieldByName('Period').AsInteger := n_Quarter;
    FieldByName('Rik').AsInteger := n_Year;
    FieldByName('Kod').AsString := cKod;
    FieldByName('Typ').AsInteger := nTyp;
    FieldByName('TIN').AsString := cTin;
    FieldByName('S_DOX').AsFloat := nPhone;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.AddSmmRecToDbfId(cKod, cTin : string;
  nPp, nTyp : integer;
  nSmNar, nSmDox, nSmTaxN, nSmTaxP : double);
begin
  with tblForCopy do begin
    Append;
    FieldByName('NP').AsInteger := nPp;
    FieldByName('Period').AsInteger := n_Quarter;
    FieldByName('Rik').AsInteger := n_Year;
    FieldByName('Kod').AsString := cKod;
    FieldByName('Typ').AsInteger := nTyp;
    FieldByName('TIN').AsString := cTin;
    FieldByName('S_NAR').AsFloat := nSmNar;
    FieldByName('S_DOX').AsFloat := nSmDox;
    FieldByName('S_TAXN').AsFloat := nSmTaxN;
    FieldByName('S_TAXP').AsFloat := nSmTaxP;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.OpenQryRkvzt;
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
procedure TDmD41DF.OpenTblId;
begin
  with tblId do begin
    if Active then Close;
    DataBaseName := c_DfDirProm;
    TableName := c_DfFileId;
    Open;
    IndexName := 'OnTinOznDox';
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.OpenQryProm;
begin
  if FileExists(c_DfDirProm + c_DfFileProm) then with qryProm do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := c_DfDirProm;
    DataSource := dsrcId;
    SQL.Add('Select TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg, ' +
            ' d_Priyn, d_Zviln, OZNAKA, DopRec, Sum(S_Nar) as S_NAR, ' +
            ' Sum(S_Dox) as S_DOX, Sum(S_TaxN) as S_TAXN, ' +
            ' Sum(S_TaxP) as S_TAXP from ' + c_DfFileProm + ' where TIN = :TIN ' +
            ' group by TIN, BadID, Sovm, TabN, Fam, Ima, Otch, Ozn_Dox, Ozn_Pilg, ' +
            ' d_Priyn, d_Zviln, OZNAKA, DopRec');
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.OpenTblFio;
begin
  with tblFIO do begin
    if Active then Close;
    DataBaseName := c_DfDirProm;
    TableName := c_DfFileFI;
    Open;
    IndexName := 'OnFIO';
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.OpenQryFio2;
begin
  with qryFio2 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := c_DfDirProm;
    DataSource := dsrcFIO;
    SQL.Add('Select * from ' + c_DfFileUni +
            ' where (TIN = :TIN) order by cDir, fNU');
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmD41DF.DisplayProgress(
  nCurRow, nRowsTotal: integer;
  cStepName, cState: string);
begin
  handler_DisplayProgress('Приложение 4', n_Year, n_Quarter,
    DateUtils.MonthOfQuarter(n_Month),
    nCurRow, nRowsTotal, 0, cStepName, cState);
end;

//------------------------------------------------------------------------------
function TDmD41DF.LastRowNum: integer;
begin
  Result := RowNum;
end;

end.

