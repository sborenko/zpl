unit DModVacatStorn;

interface

uses
  Classes, DateLib, DB, DBClient, DBTables, SysUtils;

type
  TErrMsgProc = procedure(Rec: TDataSet) of object;
  TStornResProc = procedure(StornDays: Integer; VacatSum: Double;
    WorkHrs: Integer; SalarySum: Double) of object;

  TVacatCache = record
    // Заголовок отпуска (z_VOtp)
    QryVacat,
    // Сторнирование по отпуску
    QryStorn: TQuery;
  end;

  TMnthVacatCache = record
    // Номер записи месяца отпуска (отклонение)
    Nr,
    // Связующий номер отпуска
    SpecNr: Integer;
    // Рабочие записи (нарезка месяца отпуска записями сторнироваиня)
    CdsParts: TClientDataSet;
  end;

  TDmVacatStorn = class(TDataModule)
    QryOrig: TQuery;
    DsrcParts: TDataSource;
    QryOrigNR: TIntegerField;
    QryOrigKDSPS: TSmallintField;
    QryOrigDTPROC: TDateTimeField;
    QryOrigZAMESGOD: TDateTimeField;
    QryOrigDTSTORN: TDateTimeField;
    QryOrigTABN: TIntegerField;
    QryOrigVIDN: TStringField;
    QryOrigShVidN: TStringField;
    QryOrigOLDKDVIDN: TSmallintField;
    QryOrigCHAS: TFloatField;
    QryOrigSUMMA: TFloatField;
    QryOrigOLDKDOBJ: TSmallintField;
    QryOrigKDOBJ: TSmallintField;
    QryOrigKDKATP: TSmallintField;
    QryOrigDT_BEG: TDateTimeField;
    QryOrigDT_END: TDateTimeField;
    QryOrigPDN: TSmallintField;
    QryOrigKDSPZ: TSmallintField;
    QryOrigNOTES: TStringField;
    QryOrigPRR: TSmallintField;
    QryOrigPRPV: TSmallintField;
    QryOrigKTO: TSmallintField;
    QryOrigPRKR: TSmallintField;
    QryOrigSPEC_NR: TIntegerField;
    QryOrigDTVDPV: TDateTimeField;
    QryOrigNRVDPV: TIntegerField;
    QryOrigMYNOTES: TStringField;
    QryOrigSPECPS: TIntegerField;
    QryOrigPBNK: TSmallintField;
    QryOrigSTORN: TStringField;
    DsrcOrig: TDataSource;
    CdsBuff: TClientDataSet;
    ClientDataSet1: TClientDataSet;
    procedure QryOrigAfterScroll(DataSet: TDataSet);
    procedure DsCalcFields(DataSet: TDataSet);
    procedure CdsBuffAfterOpen(DataSet: TDataSet);
    procedure CdsBuffStornDtBegValidate(Sender: TField);
    procedure CdsBuffStornDtEndValidate(Sender: TField);
  private
    DisplayDtBegErr, DisplayDtEndErr: TErrMsgProc;
    DisplayStornRes: TStornResProc;

    VacatPool: array of TVacatCache;
    MnthVacatPool: array of TMnthVacatCache;
    VacatIndx, MnthVacatIndx: Integer;

    procedure LoadOrigMnthVacat(EmplId: Integer; DtBeg, DtEnd: TDateTime);
    function GetVacatStorn(SpecNr: Integer): TQuery;
    function GetVacatHead(SpecNr: Integer): TQuery;

    function CreatePartsCds: TClientDataSet;
    procedure CreateBuffCds;

    procedure SwitchAnotherVacat(QryOrig: TDataSet);

    function FindMnthVacatCache(MnthVacatNr: Integer): Boolean;
    function FindVacatCache(SpecNr: Integer): Boolean;
    procedure AddMnthVacatCache(MnthVacatNr, VacatSpecNr: Integer);
    procedure AddVacatCache(SpecNr: Integer);

    procedure SplitOrigin;

    procedure WritePart(Period: TPeriod; SrcRec: TDataSet;
      Calc: Boolean = true);

    procedure StornRec;

    procedure CalcStornSum(StornRec: TDataSet);
    procedure MergeUnstorn;

    procedure ApplyVacatStorn(SpecNr: Integer; QryStorn: TQuery);
    procedure DeleteOldStorn(VacatSpecNr: Integer; QryStorn: TQuery);
    procedure AddNewStorn(VacatSpecNr: Integer; QryStorn: TQuery);

    PROCEDURE DEBUG(WHAT: SHORTSTRING);
  public
    destructor Destroy; override;

    function LoadOverlap(EmplId: Integer; DtBeg, DtEnd: TDateTime): Boolean;

    // Начало ввода сторнирования.
    // Вызывается из пользовательского интерфейса, устанавливает callback'и
    procedure StartStorn(DisplayDtBegErr, DisplayDtEndErr: TErrMsgProc;
      DisplayStornRes: TStornResProc
    );
    // Проверяет корректность введённых данных
    function DataAreValid: Boolean;
    // Сохраняет введённое сторнирование
    procedure SaveStorn;
    // Отменяет добавление сторнирования
    procedure CancelStorn;

    procedure UnstornRec;
    procedure ApplyStorn;
  end;

var
  DmVacatStorn: TDmVacatStorn;

implementation

uses
  a_Const, Z_Dm, CdsLib, DsLib, Math, QryLib, DIALOGS;

const
  INSERT_SQL =
    'insert into z_Otkl (' +
      'NR, KDSPS, DTPROC, ZAMESGOD, DTSTORN, TABN, VIDN, CHAS, ' +
      'SUMMA, KDOBJ, KDKATP, DT_BEG, DT_END, PDN, KDSPZ, NOTES, ' +
      'PRR, PRPV, KTO, PRKR, SPEC_NR, DTVDPV, NRVDPV, MYNOTES, ' +
      'SPECPS, PBNK, STORN' +
    ') ' +
    'values (' +
      ':NR, :KDSPS, :DTPROC, :ZAMESGOD, :DTSTORN, :TABN, :VIDN, :CHAS, ' +
      ':SUMMA, :KDOBJ, :KDKATP, :DT_BEG, :DT_END, :PDN, :KDSPZ, :NOTES, ' +
      ':PRR, :PRPV, :KTO, :PRKR, :SPEC_NR, :DTVDPV, :NRVDPV, :MYNOTES, ' +
      ':SPECPS, :PBNK, :STORN' +
    ')';

  MODIFY_SQL =
    'update z_Otkl ' +
    'set ' +
      'KDSPS = :KDSPS, ' +
      'DTPROC = :DTPROC, ' +
      'ZAMESGOD = :ZAMESGOD, ' +
      'DTSTORN = :DTSTORN, ' +
      'TABN = :TABN, ' +
      'VIDN = :VIDN, ' +
      'CHAS = :CHAS, ' +
      'SUMMA = :SUMMA, ' +
      'KDOBJ = :KDOBJ, ' +
      'KDKATP = :KDKATP, ' +
      'DT_BEG = :DT_BEG, ' +
      'DT_END = :DT_END, ' +
      'PDN = :PDN, ' +
      'KDSPZ = :KDSPZ, ' +
      'NOTES = :NOTES, ' +
      'PRR = :PRR, ' +
      'PRPV = :PRPV, ' +
      'KTO = :KTO, ' +
      'PRKR = :PRKR, ' +
      'SPEC_NR = :SPEC_NR, ' +
      'DTVDPV = :DTVDPV, ' +
      'NRVDPV = :NRVDPV, ' +
      'MYNOTES = :MYNOTES, ' +
      'SPECPS = :SPECPS, ' +
      'PBNK = :PBNK, ' +
      'STORN = :STORN ' +
    'where ' +
      'NR = :OLD_NR';

  DELETE_SQL =
    'delete ' +
    'from z_Otkl ' +
    'where NR = :OLD_NR';

{$R *.dfm}

//------------------------------------------------------------------------------
destructor TDmVacatStorn.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(VacatPool) - 1 do
    with VacatPool[I] do begin
      QryVacat.Free;
      QryStorn.Free;
    end;

  for I := 0 to Length(MnthVacatPool) - 1 do
    with MnthVacatPool[I] do begin
      CdsParts.Free;
    end;

  inherited Destroy;
end;

//------------------------------------------------------------------------------
// Проверка перекрытия больничного с отпусками, для возможного сторнирования
// последних.
//------------------------------------------------------------------------------
function TDmVacatStorn.LoadOverlap(
  EmplId: Integer;
  DtBeg, DtEnd: TDateTime
): Boolean;
begin
  LoadOrigMnthVacat(EmplId, DtBeg, DtEnd);
  Result := QryOrig.RecordCount > 0;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Загрузка исходных записей отпусков из отклонений
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.LoadOrigMnthVacat(
  EmplId: Integer;
  DtBeg, DtEnd: TDateTime
);
begin
  QryUtils.InitQuery(QryOrig);

  with QryOrig do begin
    SQL.Text :=
      'select * ' +
      'from z_Otkl ' +
      'where TabN = :TabN ' +
        'and VidN > "2400" and VidN < "2500" ' +
        'and (Storn is null or Storn <> "Y") ' +
        'and (' +
          'Dt_Beg between :Dt_Beg and :Dt_End ' +
          'or :Dt_Beg between Dt_Beg and Dt_End' +
        ') ' +
      'order by DtProc, ZaMesGod, VidN';

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('Dt_Beg').AsDateTime := DtBeg;
    ParamByName('Dt_End').AsDateTime := DtEnd;

    Open;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Загрузка заголовка отпуска
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmVacatStorn.GetVacatHead(SpecNr: Integer): TQuery;
begin
  Result := QryUtils.CreateQuery;

  with Result do begin
    SQL.Text :=
      'select * ' +
      'from z_VOtp ' +
      'where Spec_Nr = :Spec_Nr';

    ParamByName('Spec_Nr').AsInteger := SpecNr;
    Open;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Загрузка сторнирующих записей к отпуску
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmVacatStorn.GetVacatStorn(SpecNr: Integer): TQuery;
var
  UpdateSQL: TUpdateSQL;
begin
  Result := QryUtils.CreateQuery;

  with Result do begin
    CachedUpdates := true;

    SQL.Text :=
      'select * ' +
      'from z_Otkl ' +
      'where Spec_Nr = :Spec_Nr ' +
        'and not Storn is null and Storn = "Y" ' +
      'order by Spec_Nr, Dt_Beg';

    ParamByName('Spec_Nr').AsInteger := SpecNr;
  end;

  UpdateSQL := TUpdateSQL.Create(Result);

  with UpdateSQL as TUpdateSQL do begin
    InsertSQL.Text := INSERT_SQL;
    ModifySQL.Text := MODIFY_SQL;
    DeleteSQL.Text := DELETE_SQL;
  end;

  Result.UpdateObject := UpdateSQL;

  Result.Open;
end;

//------------------------------------------------------------------------------
// Перешли на другой отпуск или другую его часть
//------------------------------------------------------------------------------
procedure TDmVacatStorn.QryOrigAfterScroll(DataSet: TDataSet);
begin
  SwitchAnotherVacat(QryOrig);

  DsrcParts.DataSet := MnthVacatPool[MnthVacatIndx].CdsParts;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Переключаемся на кэши месяца отпуска и самого отпуска
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.SwitchAnotherVacat(QryOrig: TDataSet);
var
  Nr, SpecNr: Integer;
begin
  with QryOrig do begin
    Nr := FieldByName('Nr').AsInteger;
    SpecNr := FieldByName('Spec_Nr').AsInteger;
  end;

  // Находим или создаём кэш отпуска
  if not FindVacatCache(SpecNr) then
    AddVacatCache(SpecNr);

  // Находим или создаём кэш месяца отпуска
  if not FindMnthVacatCache(Nr) then begin
    AddMnthVacatCache(Nr, SpecNr);

    // разбиваем исходную запись месяца на рабочие записи
    SplitOrigin;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Ищем кэш отпуска
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmVacatStorn.FindVacatCache(SpecNr: Integer): Boolean;
var
  I: Integer;
begin
  Result := false;

  for I := 0 to Length(VacatPool) - 1 do
    if VacatPool[I].QryVacat.FieldByName('Spec_Nr').AsInteger = SpecNr then
    begin
      Result := true;
      VacatIndx := I;
      break;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Ищем кэш месяца по идентификатору исходной записи месяца отпуска
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmVacatStorn.FindMnthVacatCache(MnthVacatNr: Integer): Boolean;
var
  I: Integer;
begin
  Result := false;

  for I := 0 to Length(MnthVacatPool) - 1 do
    if MnthVacatPool[I].Nr = MnthVacatNr then begin
      Result := true;
      MnthVacatIndx := I;
      break;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Добавляем кэш отпуска
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.AddVacatCache(SpecNr: Integer);
begin
  SetLength(VacatPool, Length(VacatPool) + 1);

  VacatIndx := Length(VacatPool) - 1;

  with VacatPool[VacatIndx] do begin
    // загружаем заголовок отпуска
    QryVacat := GetVacatHead(SpecNr);
    // загружаем сторно по отпуску
    QryStorn := GetVacatStorn(SpecNr);
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Добавляем кэш месяца отпуска
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.AddMnthVacatCache(MnthVacatNr, VacatSpecNr: Integer);
begin
  SetLength(MnthVacatPool, Length(MnthVacatPool) + 1);

  MnthVacatIndx := Length(MnthVacatPool) - 1;

  with MnthVacatPool[MnthVacatIndx] do begin
    Nr := MnthVacatNr;
    SpecNr := VacatSpecNr;
    CdsParts := CreatePartsCds;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Cds, в котором будет храниться "нарезка" сторнированных и несторнированных
// записей
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmVacatStorn.CreatePartsCds: TClientDataSet;
begin
  Result := TClientDataSet.Create(nil);
  DsUtils.CopyStruct(QryOrig, Result, nil);

  with Result do begin
    FieldDefs.Add('ShVidN', ftString, 15);

    CreateDataSet;

    with Fields do begin
      (FindField('DtProc') as TDateTimeField).DisplayFormat := 'mm/yy';
      (FindField('ZaMesgod') as TDateTimeField).DisplayFormat := 'mm/yy';
    end;

    IndexDefs.Add('Primary', 'Dt_Beg;Storn', [ixPrimary]);
    IndexName := 'Primary';

    Open;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.DsCalcFields(DataSet: TDataSet);
var
  DumStr: String;
begin
  with DataSet do
    FieldByName('ShVidN').AsString :=
      DmMain.VidN2ShVidN(FieldByName('VidN').AsString, DumStr);
end;

//------------------------------------------------------------------------------
// Нарезаем исходную запись
//------------------------------------------------------------------------------
procedure TDmVacatStorn.SplitOrigin;
var
  OrigPeriod: TPeriod;
  StornPeriod: TPeriod;
  Remains: TPeriods;
begin
  SetLength(Remains, 0);

  with DateUtils do begin
    with QryOrig do
      OrigPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime);

    with VacatPool[VacatIndx].QryStorn do begin
      First;

      while not Eof do begin
        StornPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
          FieldByName('Dt_End').AsDateTime);

        // Поскольку в QryStorn хранятся сторнирования на весь отпуск (который
        // может быть разбит на несколько месяцев), а нарезаем мы отдельно
        // взятый месяц, нужно проверить относится ли сторнирующая запись к
        // данному месяцу
        if PeriodsAreIntersected(OrigPeriod, StornPeriod) then begin
          Remains := SubtractPeriods(OrigPeriod, StornPeriod);

          if SubtractHasHead(Remains, StornPeriod) then
            // "Голову" пишем сразу в Unstorned, потому что следующие сторнирующие
            // записи будут более поздними и сторнировать "голову" уже не смогут.
            WritePart(GetSubtractHead(Remains), QryOrig);

          if SubtractHasTail(Remains, StornPeriod) then
            // Хвост становится кандидатом на следующую нарезку
            OrigPeriod := GetSubtractTail(Remains)
          else
            OrigPeriod := CreateEmptyPeriod;

          // Сторнирующую пишем всегда
          WritePart(StornPeriod, VacatPool[VacatIndx].QryStorn, false);
        end;

        Next;
      end;
    end;

    // Дописываем остаток
    if not PeriodIsEmpty(OrigPeriod) then
      WritePart(OrigPeriod, QryOrig);

    MnthVacatPool[MnthVacatIndx].CdsParts.First;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.WritePart(
  Period: TPeriod;
  SrcRec: TDataSet;
  Calc: Boolean = true
);
var
  CdsParts: TClientDataSet;
begin
  CdsParts := MnthVacatPool[MnthVacatIndx].CdsParts;

  with CdsParts do begin
    Append;

    DsUtils.CopyRecord(SrcRec, CdsParts);
    FieldByName('Dt_Beg').AsDateTime := Period.Start;
    FieldByName('Dt_End').AsDateTime := Period.Finish;
    FieldByName('ShVidN').AsString := QryOrig.FieldByName('ShVidN').AsString;

    if Calc then
      CalcStornSum(CdsParts);

    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmVacatStorn.CreateBuffCds;
begin
  with CdsBuff do
    if Active then
      EmptyDataSet
    else begin
      DsUtils.CopyStruct(QryOrig, CdsBuff);
      CreateDataSet;

      with Fields.FindField('Dt_Beg') as TDateTimeField do
        EditMask := '!99/99/9999;1;_';

      with Fields.FindField('Dt_End') as TDateTimeField do
        EditMask := '!99/99/9999;1;_';
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.CdsBuffAfterOpen(DataSet: TDataSet);
begin
  with CdsBuff do begin
    Fields.FieldByName('DT_BEG').OnValidate := CdsBuffStornDtBegValidate;
    Fields.FieldByName('DT_END').OnValidate := CdsBuffStornDtEndValidate;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.CdsBuffStornDtBegValidate(Sender: TField);
var
  CdsParts: TClientDataSet;
begin
  CdsParts := MnthVacatPool[MnthVacatIndx].CdsParts;

  with CdsBuff do
    if (FieldByName('Dt_Beg').AsDateTime >=
        CdsParts.FieldByName('Dt_Beg').AsDateTime)
      and (FieldByName('Dt_Beg').AsDateTime <=
        CdsParts.FieldByName('Dt_End').AsDateTime)
    then
      CalcStornSum(CdsBuff)
    else
      if Assigned(DisplayDtBegErr) then
        DisplayDtBegErr(CdsBuff);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.CdsBuffStornDtEndValidate(Sender: TField);
var
  CdsParts: TClientDataSet;
begin
  CdsParts := MnthVacatPool[MnthVacatIndx].CdsParts;

  with CdsBuff do
    if (FieldByName('Dt_End').AsDateTime >=
        CdsParts.FieldByName('Dt_Beg').AsDateTime)
      and (FieldByName('Dt_Beg').AsDateTime <=
        CdsParts.FieldByName('Dt_End').AsDateTime)
    then
      CalcStornSum(CdsBuff)
    else
      if Assigned(DisplayDtEndErr) then
        DisplayDtEndErr(CdsBuff);
end;

//------------------------------------------------------------------------------
procedure TDmVacatStorn.StartStorn(
  DisplayDtBegErr, DisplayDtEndErr: TErrMsgProc;
  DisplayStornRes: TStornResProc
);
begin
  if bFlagDbg then
    DEBUG('BEFORE');

  Self.DisplayDtBegErr := DisplayDtBegErr;
  Self.DisplayDtEndErr := DisplayDtEndErr;
  Self.DisplayStornRes := DisplayStornRes;

  CreateBuffCds;

  with CdsBuff do begin
    Open;
    Append;

    DsUtils.CopyRecord(MnthVacatPool[MnthVacatIndx].CdsParts, CdsBuff);
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.SaveStorn;
begin
  Self.DisplayDtBegErr := nil;
  Self.DisplayDtEndErr := nil;
  Self.DisplayStornRes := nil;

  StornRec;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.CancelStorn;
begin
  Self.DisplayDtBegErr := nil;
  Self.DisplayDtEndErr := nil;
  Self.DisplayStornRes := nil;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.StornRec;
var
  CdsParts: TClientDataSet;
  OrigPeriod, StornPeriod: TPeriod;
  Remains: TPeriods;
  HasHead, HasTail: Boolean;
begin
  CdsBuff.Post;

  CdsParts := MnthVacatPool[MnthVacatIndx].CdsParts;

  with CdsParts, DateUtils do begin
    OrigPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
      FieldByName('Dt_End').AsDateTime);

    with CdsBuff do
      StornPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime);

    Remains := SubtractPeriods(OrigPeriod, StornPeriod);

    HasHead := SubtractHasHead(Remains, StornPeriod);
    HasTail := SubtractHasTail(Remains, StornPeriod);

    // Разбираемся с остатками текущей записи
    if HasHead then begin
      // Если у вычитания есть "голова", оставляем текущую несторнированной,
      // но укорачиваем ..
      Edit;
      FieldByName('Dt_End').AsDateTime := GetSubtractHead(Remains).Finish;

      CalcStornSum(CdsParts);
      Post;
    end;

    if HasTail then begin
      if HasHead then begin
        // текущую израсходовали на "голову", для "хвоста" добавляем запись
        Append;
        CopyRecord(QryOrig, CdsParts);

        with GetSubtractTail(Remains) do begin
          FieldByName('Dt_Beg').AsDateTime := Start;
          FieldByName('Dt_End').AsDateTime := Finish;
          FieldByName('ShVidN').AsString :=
            QryOrig.FieldByName('ShVidN').AsString;
        end;
      end else begin
        // .. делаем с "хвостом" то же что и с "головой": оставляем текущую
        // несторнированной, но укорачиваем
        Edit;
        FieldByName('Dt_Beg').AsDateTime := GetSubtractTail(Remains).Start;
      end;

      CalcStornSum(CdsParts);
      Post;
    end;

    // Разбираемся со сторнирующей записью:

    if HasHead or HasTail then begin
      // Если есть "голова" или "хвост", значит сторнировали не всю текущую
      // запись. Добавляем сторнирующую ..
      Append;
      FieldByName('ShVidN').AsString := QryOrig.FieldByName('ShVidN').AsString;
    end else
      // .. сторнировали всю текущую запись. Просто редактируем её.
      Edit;

    DsUtils.CopyRecord(CdsBuff, CdsParts);

    // Генерировать новый Nr нужно всегда, независимо от того, добавляется
    // запись или редактируется. Если добавляется, у неё нет никакого Nr, если
    // редактируется, это - несторнированные фрагменты исходной записи и Nr
    // у них такой-же как и у исходной. Их нужно заменить.
    FieldByName('Nr').AsInteger := QryUtils.GenerateId('NR_ZOTKL');

    // проставляем признак сторнирования.
    FieldByName('Storn').AsString := 'Y';
    FieldByName('DtStorn').AsDateTime := DateUtils.ThisMonth;

    FieldByName('Summa').AsFloat := -CdsBuff.FieldByName('Summa').AsFloat;
    FieldByName('Chas').AsFloat := -CdsBuff.FieldByName('Chas').AsFloat;

    Post;
  end;

  if bFlagDbg then
    DEBUG('AFTER');
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.UnstornRec;
begin
  if bFlagDbg then
    DEBUG('BEFORE');

  with MnthVacatPool[MnthVacatIndx].CdsParts do begin
    Edit;
    FieldByName('Storn').AsString := '';
    FieldByName('DtStorn').AsString := '';
    Post;

    MergeUnstorn;

    Edit;
    CalcStornSum(MnthVacatPool[MnthVacatIndx].CdsParts);
    Post;
  end;

  if bFlagDbg then
    DEBUG('AFTER');
end;

//------------------------------------------------------------------------------
procedure TDmVacatStorn.MergeUnstorn;
var
  DtBeg, DtEnd: TDateTime;
  Mark1, Mark2: TBookmark;
begin
  with MnthVacatPool[MnthVacatIndx].CdsParts do begin
    DtBeg := FieldByName('Dt_Beg').AsDateTime;
    DtEnd := FieldByName('Dt_End').AsDateTime;

    Mark1 := GetBookmark;
    Prior;

    if not Bof and (FieldByName('Storn').AsString <> 'Y') then begin
      Edit;
      FieldByName('Dt_End').AsDateTime := DtEnd;
      Post;

      DtBeg := FieldByName('Dt_Beg').AsDateTime;
      Mark2 := GetBookmark;

      GotoBookmark(Mark1);
      Delete;
      GotoBookmark(Mark2);
    end else
      GotoBookmark(Mark1);

    Mark1 := GetBookmark;
    Next;

    if not Eof and (FieldByName('Storn').AsString <> 'Y') then begin
      Edit;
      FieldByName('Dt_Beg').AsDateTime := DtBeg;
      Post;

      Mark2 := GetBookmark;

      GotoBookmark(Mark1);
      Delete;
      GotoBookmark(Mark2);
    end else
      GotoBookmark(Mark1);
  end;
end;

//------------------------------------------------------------------------------
// По датам периода сторнирования рассчитать количество сторнируемых дней,
// сумму сторно, оклад, который, возможно, надо вернуть
//------------------------------------------------------------------------------
procedure TDmVacatStorn.CalcStornSum(StornRec: TDataSet);
var
  DtBeg, DtEnd: TDateTime;
  DaysType: ShortString;
  WorkDays, WorkHrs, VacatSum, SalarySum: Double;
  MnthBudg: Double;
  MnthDays, DummyInt: Integer;
  Date: TDate;
begin
  with StornRec do begin
    DtBeg := FieldByName('Dt_Beg').AsDateTime;
    DtEnd := FieldByName('Dt_End').AsDateTime;
  end;

  with VacatPool[VacatIndx].QryVacat do begin
    if FieldByName('RK').AsString = 'K' then
      DaysType := 'otk'
    else
      DaysType := 'otp';

    DmMain.GetCntWrkDaysOtp(DtBeg, DtEnd, WorkDays, WorkHrs, DaysType);
    VacatSum := RoundTo(FieldByName('SmSrDn').AsFloat * WorkDays, -2);

    Date := DateUtils.Decode(StornRec.FieldByName('ZaMesGod').AsDateTime);
    MnthBudg := DmMain.Budget(Date.Year, Date.Mnth, MnthDays, DummyInt);

    SalarySum := RoundTo(
      FieldByName('CurOklTrf').AsFloat / MnthBudg * WorkHrs, -2);
  end;

  with StornRec do begin
    FieldByName('Summa').AsFloat := VacatSum;
    FieldByName('Chas').AsFloat := WorkHrs;
  end;

  if Assigned(DisplayStornRes) then
    DisplayStornRes(Round(WorkDays), VacatSum, Round(WorkHrs), SalarySum);
end;

//------------------------------------------------------------------------------
procedure TDmVacatStorn.ApplyStorn;
var
  I: Integer;
begin
  // Для каждого отпуска применяем сделанные изменения
  for I := 0 to Length(VacatPool) - 1 do
    with VacatPool[I] do begin
      ApplyVacatStorn(QryVacat.FieldByName('Spec_Nr').AsInteger, QryStorn);

      QryUtils.ConfirmUpdates(QryStorn);
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// После изменения PartsCds в результате сторнирования или отмены, переписываем
// QryStorn для текущего Spec_Nr. После этого, в QryStorn появляется
// PendingUpdate как основание для изменения отклонений.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.ApplyVacatStorn(SpecNr: Integer; QryStorn: TQuery);
begin
  DeleteOldStorn(SpecNr, QryStorn);
  AddNewStorn(SpecNr, QryStorn);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Удаляем старые сторнирования, которые были анулированы
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.DeleteOldStorn(VacatSpecNr: Integer; QryStorn: TQuery);
var
  I: Integer;
  StornSpan,
  MnthSpan: TPeriod;
  StillStorn: Boolean;
begin
  StillStorn := false;

  with QryStorn, DateUtils do begin
    First;

    while not Eof do begin
      StornSpan := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime
      );

      for I := 0 to Length(MnthVacatPool) - 1 do
        with MnthVacatPool[I], CdsParts do
          // Месяц отпуска принадлежит отпуску, заданному VacatSpecNr, ...
          if SpecNr = VacatSpecNr then begin
            MnthSpan := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
              FieldByName('Dt_End').AsDateTime
            );

            // Сторнирующая запись принадлежит месяцу отпуска
            if PeriodsAreIntersected(MnthSpan, StornSpan) then
              // Запись всё ещё сторнирована
              if Locate('Nr', FieldByName('Nr').AsInteger, [])
                and (FieldByName('Storn').AsString = 'Y')
              then
                StillStorn := true;
          end;

      if StillStorn then
        Next
      else
        Delete;
    end;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmVacatStorn.AddNewStorn(VacatSpecNr: Integer; QryStorn: TQuery);
var
  I,
  StornNr: Integer;
begin
  for I := 0 to Length(MnthVacatPool) - 1 do begin
    with MnthVacatPool[I], CdsParts do
      // Если часть отпуска принадлежит отпуску, заданному VacatSpecNr, ...
      if SpecNr = VacatSpecNr then begin
        // ... применяем сделанные для неё сторнирования
        First;

        while not Eof do begin
          StornNr := FieldByName('Nr').AsInteger;

          // Интересуют только сторнированные записи
          if FieldByName('Storn').AsString = 'Y' then
            with QryStorn do begin
              if Locate('Nr', StornNr, []) then
                // если сторн. запись - старая, пишем возможные изменения
                Edit
              else
                // иначе - новая
                Append;

              DsUtils.CopyRecord(CdsParts, QryStorn);
              Post;
            end;

          Next;
        end;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TDmVacatStorn.DataAreValid: Boolean;
begin
  with CdsBuff do
    Result := not FieldByName('Dt_Beg').IsNull
      and (FieldByName('Dt_Beg').AsDateTime <=
        FieldByName('Dt_End').AsDateTime);
end;

PROCEDURE TDmVacatStorn.DEBUG(WHAT: SHORTSTRING);
BEGIN
  MNTHVACATPOOL[MNTHVACATINDX].CDSPARTS.SAVETOFILE(WHAT + '.CDS');
END;

end.
