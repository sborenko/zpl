unit Appx1And6MnthStage;

interface

uses
  Db, DbClient, DbTables, ProgressStage, PeriodStage, Appx1And6Stage,
  DateLib, DsLib, IFaceProgressState;

type
  TVariantArray = array of Variant;

  TAppx1Rec = record
    PERIOD_M,         // ключ
    PERIOD_Y,         // ключ
    UKR_GROMAD,
    ST: word;
    NUMIDENT,         // ключ
    LN,
    NM,
    FTN: string;
    ZO,               // ключ
    PAY_TP,           // ключ
    PAY_MNTH,         // ключ
    PAY_YEAR,         // ключ
    KD_NP,
    KD_NZP,
    KD_PTV,
    KD_VP: word;
    SUM_TOTAL,
    SUM_MAX,
    SUM_DIFF,
    SUM_INS,
    SUM_NARAH: double;
    OTK,              // ключ
    EXP,              // ключ
    NRC: word         // ключ
    // NRM, Новое рабочее место. ВСЕГДА ПУСТО
    // OZN: word; В новом отчёте - всегда ноль. Если отчёт с исправлениями,
    // 1 - для записей, которые исправляются, 0 - для корректирующих записей.
  end;

  TPaymntParams = record
    WrkTimePerc: integer;
    EmplType: word;
  end;

  TAppx1And6MnthStage = class(TPeriodStage)
  protected
    PayPeriod: TPeriod;

    EmplDisabilityFlag: boolean;

    procedure InitData;
    procedure FreeData;

    procedure OpenAppx1Table;
    procedure OpenAppx6Table;
    procedure OpenAppxTable(
      Table: TTable; AppxFileName, AppxTmplName: ShortString);

    procedure OpenEmplListQry;
    procedure OpenPaymntsQry;
    procedure OpenAssignmntsQry(PayPeriod: TPeriod);
    procedure OpenDisabilityQry;

    procedure LoadEmplmntsCds(PayPeriod, PmntPeriod: TPeriod);

    procedure CreateAppx1Cds(out DataSet: TClientDataSet);
    procedure CreateDaysCds(out DataSet: TClientDataSet);
    procedure CreateNonPayDaysCds;
    procedure CreateNonPayDaysBuffCds;
    procedure CreateNrcCds;

    function CdsAppx1FldFilterFunc(FieldName: ShortString): boolean;
    function EmplmntsFldFilterFunc(FieldName: ShortString): boolean;
    function DaysFldFilterFunc(FieldName: ShortString): boolean;
    function CdsNrcFldFilterFunc(FieldName: ShortString): boolean;

    procedure ProcessEmployee;
    procedure ProcessPaymntRec;

    //..........................................................................
    procedure FillKeysEmplSpecif(var Appx1Rec: TAppx1Rec);
    procedure FillKeysPayTypeSpecif(var Appx1Rec: TAppx1Rec);
    //..........................................................................
    procedure AddToAppx1Cds(Appx1Rec: TAppx1Rec);
    procedure AddNonPayDays(Appx1Rec: TAppx1Rec);
    function NonPayCorrDecisionFunc(Src, Dest: TDataSet): boolean;
    procedure AddDiseaseDays(Appx1Rec: TAppx1Rec);
    procedure AddPregnDays(Appx1Rec: TAppx1Rec);
    procedure AddToNrcCds(Appx1Rec: TAppx1Rec);
    //..........................................................................
    function LocateZeroSums(Appx1Rec: TAppx1Rec): boolean; overload;
    function LocateZeroSums(Appx1Rec: TDataSet): boolean; overload;
    function LocateSuitForZeroSums(Appx1Rec: TAppx1Rec): boolean; overload;
    function LocateSuitForZeroSums(Appx1Rec: TDataSet): boolean; overload;
    //..........................................................................
    procedure SumTotal(var Appx1Rec: TAppx1Rec);
    procedure SumMax(var Appx1Rec: TAppx1Rec);
    procedure SumDiff(var Appx1Rec: TAppx1Rec);
    procedure SumIns(var Appx1Rec: TAppx1Rec);
    //..........................................................................

    procedure OpenEntSocPercQry(PayPeriodBeg: TDateTime);
    function GetPaymntParams: TPaymntParams;

    //..........................................................................
    procedure MoveEmplToAppx1Table;
    procedure MoveToInterProc(Appx1Rec: TDataSet; Tag: TObject);
    procedure MoveToTableProc(Appx1Rec: TDataSet; Tag: TObject);

    //..........................................................................
    procedure CheckDisabililty(AsOfDate: TDateTime);
    function EmplIsDisable(PRR: SmallInt): Boolean;

    procedure WriteEnterpriseSoc;
    function RecIsToExcludeOnZero(Appx1Rec: TDataSet): boolean;

//    function RecIsEntSoc(Appx1Rec: TDataSet): boolean;
    function PayPeriodIsInPast(DataRec: TDataSet): boolean;
    function PayPeriodIsInFuture(DataRec: TDataSet): boolean;

    procedure ApplyConvertEntSocMinZp(Appx1Rec: TDataSet);
    procedure ApplyMovePositiveToRepMnth(Appx1Rec: TDataSet);
    function GetSumNarah: double;

    procedure ApplyTermination(Appx1Rec: TDataSet);
    //..........................................................................
    class function PayTypeIsCPH(PayType: string): boolean;
    class function PayTypeIsMobiliz(PayType: string): boolean;
    class function PayTypeIsDisease(PayType: string): boolean;
    class function PayTypeIsPregn(PayType: string): boolean;
    class function PayTypeIsEntSocMinZp(PayType: string): boolean;
    class function PayTypeIsPayableVacat(PayType: ShortString): boolean;

    // Удаление ненужных записей и применение правил
    function EmplIsTerminated(Date: TDateTime): boolean;
    //..........................................................................
    class function GetAppx1CdsKeys: ShortString;
    class function GetAppx1CdsValues(Appx1Rec: TAppx1Rec):
      TVariantArray; overload;
    class function GetAppx1CdsValues(Appx1Rec: TDataSet):
      TVariantArray; overload;
    //..........................................................................
    class function GetNrcCdsKeys: ShortString;
    class function GetNrcCdsValues(Appx1Rec: TAppx1Rec):
      TVariantArray; overload;
    class function GetNrcCdsValues(Appx1Rec: TDataSet):
      TVariantArray; overload;
    //..........................................................................
    class function InitAppx1Rec: TAppx1Rec;
    //..........................................................................
    function Appx1And6Stage: TAppx1And6Stage;
    function EmplListQry: TQuery;
    function DisableDocsQry: TQuery;

    procedure WriteCdsToFilesPrior;
    procedure WriteCdsToFilesApost;
  public
    ReportDate: TDate;

    CdsAppx1,               // Записи Appx1 по текущему сотруднику
    CdsAppx1Inter,          // Промежуточный для записи CdsAppx1 в TblAppx1
    CdsEmplmntDays,         // Рабочие периоды
    CdsDiseaseDays,         // Периоды нетрудоспособности: больничные
    CdsNonPayDays,          // Неоплачиваемые периоды: 5005, 5008, ...
    CdsNonPayDaysBuff,      //
    CdsPtvDays,             // Копия рабочих периодов для KD_PTV
    CdsPregnDays,           // Декретные
    CdsNrc: TClientDataSet; // Неполные рабочие дни

    destructor Destroy; override;
    //..........................................................................
    procedure Start(ProgressState: IProgressState); override;
    function StageName: ShortString; override;
    function StageItemsTotal: integer; override;
    function KeepProcess: Boolean; override;
    procedure Process; override;
    //..........................................................................
  end;

const
  ZO_CMN = 1;              // Общие основания
  ZO_DISABLE = 2;          // Инвалид
  ZO_CHILD_CARE = 20;      // Уход за ребёнком
  ZO_PPS = 25;             // Проф.преп.сост.
  ZO_CPH = 26;             // Гражд.прав.дог.
  ZO_DISEASE = 29;         // Больнич.
  ZO_DISABLE_PPS = 32;     // Пр.преп.сост.инвалид
  ZO_DISABLE_DISEASE = 36; // Больничн.инв.
  ZO_PREGN = 42;           // Декретные
  ZO_DISABLE_PREGN = 43;   // Декр.инв.
  ZO_MOBILIZ = 47;         // Мобилизованный

  PAY_TP_DEFAULT = 0;      // Умолчательное значение
  PAY_TP_LONGER_MONTH = 1; // Договорные (И УВОЛЕННЫЕ. Ольга?)
  PAY_TP_ENT_SOC_INCR = 2; // Самостоятельное увеличение ЕСВ
  PAY_TP_ENT_SOC_REFUND = 3; // Самостоятельное уменьшение ЕСВ
  PAY_TP_OTP = 10;         // Суммы отпускных
  PAY_TP_DIF_MIN_ZP = 13;  // Разница между мин.з/п и факт.нач.

implementation

uses
  SysUtils, Classes, Variants, Math, ReportSpov,
  CdsLib, LogLib, MathLib, QryLib, TblLib, TextLib,
  VidNUtils, PeriodIterDataSet, PeriodsCorrelation, Appx1TblWriter;

const
  LOG_EMPL_ID = 12145;

//------------------------------------------------------------------------------
destructor TAppx1And6MnthStage.Destroy;
begin
  CdsAppx1.Free;
  CdsAppx1Inter.Free;

  if Assigned(CdsEmplmntDays) then
    CdsEmplmntDays.Free;
  if Assigned(CdsDiseaseDays) then
    CdsDiseaseDays.Free;
  if Assigned(CdsNonPayDays) then
    CdsNonPayDays.Free;
  if Assigned(CdsNonPayDaysBuff) then
    CdsNonPayDaysBuff.Free;
  if Assigned(CdsPtvDays) then
    CdsPtvDays.Free;
  if Assigned(CdsPregnDays) then
    CdsPregnDays.Free;
  if Assigned(CdsNrc) then
    CdsNrc.Free;

  inherited Destroy;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.Start(ProgressState: IProgressState);
begin
  InitData;
  inherited Start(ProgressState);
  FreeData;
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.StageName: ShortString;
begin
  Result := 'Месяц ' + IntToStr(
    // DateUtils.MonthOfQuarter(ReportPeriod.Start));
    // С 1.1.2025 - помесячно
    DateUtils.MonthOfQuarter(DateUtils.Decode(ReportPeriod.Start).Mnth));
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.StageItemsTotal: integer;
begin
  Result := Appx1And6Stage.QryEmplList.RecordCount;
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.KeepProcess: Boolean;
begin
  Result := not Appx1And6Stage.QryEmplList.Eof;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.Process;
begin
  // Ольга: не имеющих ИНН пропускаем.
  if Appx1And6Stage.QryEmplList.FieldByName('Id').AsString <> '' then
    ProcessEmployee;

  Appx1And6Stage.QryEmplList.Next;
  inherited Process;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.InitData;
begin
  ReportDate := DateUtils.Decode(ReportPeriod.Start);

  LogUtils.StartLogging('Appx1-' + IntToStr(ReportDate.Year) + '-' +
    TextUtils.PadLeft(IntToStr(ReportDate.Mnth), '0', 2) + '.log');

  OpenAppx1Table;
  OpenAppx6Table;

  CreateAppx1Cds(CdsAppx1);
  CreateAppx1Cds(CdsAppx1Inter);

  CreateDaysCds(CdsDiseaseDays);
  CreateNonPayDaysCds;
  CreateNonPayDaysBuffCds;
//  CdsPtvDays := TClientDataSet.Create(nil);
  CreateDaysCds(CdsPregnDays);

  CreateNrcCds;

  OpenEmplListQry;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.FreeData;
begin
  with SpovReport do begin
    TblAppx1.Close;
    TblAppx6.Close;
  end;

  with Appx1And6Stage do begin
    QryEmplList.Close;
    QryAssignmnts.Close;
    QryPaymnts.Close;
  end;

  LogUtils.EndLogging;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.OpenAppx1Table;
begin
  OpenAppxTable(SpovReport.TblAppx1, Appx1FileName, Appx1TmplName);
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.OpenAppx6Table;
begin
  OpenAppxTable(SpovReport.TblAppx6, Appx6FileName, Appx6TmplName);
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.OpenAppxTable(
  Table: TTable;
  AppxFileName, AppxTmplName: ShortString);
begin
  with Table do begin
    TableName := AppxFileName;
      // С 1.1.2025 - помесячно
      // + '_' + IntToStr(DateUtils.MonthOfQuarter(ReportPeriod.Start));

    if not TblUtils.CreateDbfFromTmpl(Table, AppxTmplName) then
      exit;

    Open;
  end;
end;

//------------------------------------------------------------------------------
// На базе структуры таблицы Appx1 создаём Cds с исключением и подменой
// некоторых полей.
//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.CreateAppx1Cds(out DataSet: TClientDataSet);
begin
  if not Assigned(DataSet) then begin
    DataSet := CdsUtils.CreateCds(SpovReport.TblAppx1, CdsAppx1FldFilterFunc);

    with DataSet do begin
      IndexDefs.Add('Primary', GetAppx1CdsKeys, [ixPrimary]);
      IndexName := 'Primary';
      Open;
    end;
  end else
    DataSet.EmptyDataSet;
end;

//------------------------------------------------------------------------------
// Отфильтровываем поля со значениями общими для таблицы в целом и общими
// для данного Cds (атрибуты сотрудника всегда одни и те-же в пределах Cds).
// Количества дней, за исключением KD_VP накапливаются в отдельных Cds.
// Будут заполнены непосредственно в таблице.
//------------------------------------------------------------------------------
function TAppx1And6MnthStage.CdsAppx1FldFilterFunc(
  FieldName: ShortString): boolean;
begin
  Result := (FieldName = 'NUMIDENT')
    or (FieldName = 'ZO') or (FieldName = 'PAY_TP')
    or (FieldName = 'PAY_MNTH') or (FieldName = 'PAY_YEAR')
    or (FieldName = 'KD_NP') or (FieldName = 'KD_NZP')
    or (FieldName = 'KD_PTV') or (FieldName = 'KD_VP')
    or (FieldName = 'SUM_TOTAL') or (FieldName = 'SUM_MAX')
    or (FieldName = 'SUM_DIFF') or (FieldName = 'SUM_INS')
    or (FieldName = 'SUM_NARAH')
    or (FieldName = 'OTK') or (FieldName = 'EXP') or (FieldName = 'NRC');
end;

//..............................................................................
function TAppx1And6MnthStage.EmplmntsFldFilterFunc(
  FieldName: ShortString): boolean;
begin
  Result := (FieldName = 'DT_PRIEM') or (FieldName = 'DT_UVOLN');
end;

//..............................................................................
procedure TAppx1And6MnthStage.CreateDaysCds(out DataSet: TClientDataSet);
begin
  DataSet := TClientDataSet.Create(nil);

  DsUtils.CopyStruct(
    SpovReport.TblAppx1, DataSet, DaysFldFilterFunc);

  with DataSet do begin
    FieldDefs.Add('Dt_Beg', ftDateTime);
    FieldDefs.Add('Dt_End', ftDateTime);

    IndexDefs.Add(
      'Primary', 'OTK;PAY_YEAR;PAY_MNTH;Dt_Beg', [ixPrimary]);

    CreateDataSet;
    IndexName := 'Primary';
    Open;
  end;
end;

//..............................................................................
function TAppx1And6MnthStage.DaysFldFilterFunc(
  FieldName: ShortString): boolean;
begin
  Result := (FieldName = 'PAY_MNTH') or (FieldName = 'PAY_YEAR')
    or (FieldName = 'OTK');
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.CreateNonPayDaysCds;
begin
  CdsNonPayDays := TClientDataSet.Create(nil);

  DsUtils.CopyStruct(
    SpovReport.TblAppx1, CdsNonPayDays, DaysFldFilterFunc);

  with CdsNonPayDays do begin
    FieldDefs.Add('Dt_Beg', ftDateTime);
    FieldDefs.Add('Dt_End', ftDateTime);
    FieldDefs.Add('Weight', ftInteger);

    IndexDefs.Add(
      'Primary', 'OTK;PAY_YEAR;PAY_MNTH;Dt_Beg', [ixPrimary]);

    CreateDataSet;
    IndexName := 'Primary';
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.CreateNonPayDaysBuffCds;
begin
  CdsNonPayDaysBuff := CdsUtils.CreateCds(CdsNonPayDays);
  with CdsNonPayDaysBuff do begin
    Append;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.CreateNrcCds;
begin
  if CdsNrc = nil then begin
    CdsNrc := CdsUtils.CreateCds(SpovReport.TblAppx1, CdsNrcFldFilterFunc);

    with CdsNrc do begin
      IndexDefs.Add('Primary', GetNrcCdsKeys, [ixPrimary]);
      IndexName := 'Primary';
      Open;
    end;
  end else
    CdsNrc.EmptyDataSet;
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.CdsNrcFldFilterFunc(
  FieldName: ShortString): boolean;
begin
  Result := (FieldName = 'PAY_MNTH') or (FieldName = 'PAY_YEAR')
    or (FieldName = 'OTK') or (FieldName = 'EXP') or (FieldName = 'NRC');
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.OpenEmplListQry;
begin
  with Appx1And6Stage.QryEmplList do begin
    ParamByName('DtProc').AsDateTime := ReportPeriod.Start;
    Open;
    First;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.ProcessEmployee;
var
  PayMnthYear: TDateTime;
  PmntPeriod: TPeriod;
begin
  OpenPaymntsQry;
  OpenDisabilityQry;

  with Appx1And6Stage, QryPaymnts, DateUtils do begin
    while not Eof do begin
      PayMnthYear := FieldByName('ZaMesGod').AsDateTime;
      PayPeriod := InitPeriod(PayMnthYear, EndOfMonth(PayMnthYear));

      PmntPeriod := InitPeriod(
        FieldByName('Dt_Beg').AsDateTime, FieldByName('Dt_End').AsDateTime);

      OpenAssignmntsQry(PayPeriod);

      // Загрузка рабочих в платёжном периоде периодов.
      if (FieldByName('VidN').AsString = PAYTYPE_PREGN)
          and not PeriodsAreIntersected(PmntPeriod, ReportPeriod) then
        // Декретные будущих месяцев
        LoadEmplmntsCds(PmntPeriod, PmntPeriod)
      else
        LoadEmplmntsCds(PayPeriod, DateUtils.CreateEmptyPeriod);

      // Копия рабочих периодов для KD_PTV.
      CdsPtvDays.EmptyDataSet;
      DsUtils.CopyRowset(CdsEmplmntDays, CdsPtvDays);

      while (FieldByName('ZaMesGod').AsDateTime = PayMnthYear)
          and not Eof do begin
        ProcessPaymntRec;
        Next;
      end;

      QryAssignmnts.Close;
    end;

    // Сохраняем Cds'ы.
    WriteCdsToFilesPrior;
    // Пишем сформированные данные в таблицу.
    MoveEmplToAppx1Table;
    // Сохраняем Cds'ы.
    WriteCdsToFilesApost;

    Close;
  end;

  DisableDocsQry.Close;

  CdsAppx1.EmptyDataSet;
  CdsAppx1Inter.EmptyDataSet;

  if Assigned(CdsEmplmntDays) then
    CdsEmplmntDays.EmptyDataSet;
  if Assigned(CdsDiseaseDays) then
    CdsDiseaseDays.EmptyDataSet;
  if Assigned(CdsNonPayDays) then
    CdsNonPayDays.EmptyDataSet;
  if Assigned(CdsPtvDays) then
    CdsPtvDays.EmptyDataSet;
  if Assigned(CdsPregnDays) then
    CdsPregnDays.EmptyDataSet;
  if Assigned(CdsNrc) then
    CdsNrc.EmptyDataSet;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.OpenPaymntsQry;
begin
  with Appx1And6Stage, QryPaymnts do begin
    ParamByName('TabN').AsInteger := QryEmplList.FieldByName('TabN').AsInteger;
    ParamByName('PeriodBeg').AsDateTime := ReportPeriod.Start;
    ParamByName('PeriodEnd').AsDateTime := ReportPeriod.Finish;
    Open;
    First;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.OpenAssignmntsQry(PayPeriod: TPeriod);
begin
  with Appx1And6Stage, QryAssignmnts do begin
    ParamByName('TabN').AsInteger := QryEmplList.FieldByName('TabN').AsInteger;
    ParamByName('PeriodBeg').AsDateTime := PayPeriod.Start;
    ParamByName('PeriodEnd').AsDateTime := PayPeriod.Finish;
    Open;
    First;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.OpenDisabilityQry;
begin
  with DisableDocsQry do begin
    ParamByName('EmplId').AsInteger :=
      EmplListQry.FieldByName('TabN').AsInteger;
    Open;
    First;
  end;
end;

//------------------------------------------------------------------------------
// KD_PTV - пребывание в трудовых отношениях. Допускается только в
// одной записи отчётного или будущего месяца. В будущих месяцах - только
// для декретных и больничных. Если бы надо было собирать раздельно по OTK, EXP,
// брали бы даты и из приёмов/увольнений и из надбавочной части запроса.
// Пока берём только из приёмов/увольнений, полагая что надбавки не могут
// выходить за их рамки.
//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.LoadEmplmntsCds(PayPeriod, PmntPeriod: TPeriod);
begin
  if CdsEmplmntDays = nil then begin
    CdsEmplmntDays := CdsUtils.CreateCds(
      Appx1And6Stage.QryAssignmnts, EmplmntsFldFilterFunc);

    CdsPtvDays := CdsUtils.CreateCds(CdsEmplmntDays);
  end;

  DsUtils.CopyRowset(Appx1And6Stage.QryAssignmnts, CdsEmplmntDays);

  if not DateUtils.PeriodIsEmpty(PmntPeriod) then
    with CdsEmplmntDays do begin
      Append;
      FieldByName('Dt_Priem').AsDateTime := PayPeriod.Start;
      FieldByName('Dt_Uvoln').AsDateTime := PayPeriod.Finish;
      Post;
    end;

  with TDataSetPeriodIter.Create(
      CdsEmplmntDays, 'Dt_Priem', 'Dt_Uvoln', true) do begin

    // Неоконченные периоды ограничиваем платёжным периодом периодом.
    DateUtils.IntersectDataSet(
      CdsEmplmntDays, 'Dt_Priem', 'Dt_Uvoln', PayPeriod, false);
    Join2(false);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.ProcessPaymntRec;
var
  Appx1Rec: TAppx1Rec;
begin
  Appx1Rec := InitAppx1Rec;

  with Appx1And6Stage, QryPaymnts, Appx1Rec do begin
    NUMIDENT := Appx1And6Stage.QryEmplList.FieldByName('Id').AsString;

    FillKeysEmplSpecif(Appx1Rec);
    FillKeysPayTypeSpecif(Appx1Rec);

    SumTotal(Appx1Rec);
    SumMax(Appx1Rec);
    SumDiff(Appx1Rec);
    SumIns(Appx1Rec);

    AddToAppx1Cds(Appx1Rec);

    AddNonPayDays(Appx1Rec);
    AddDiseaseDays(Appx1Rec);
    AddPregnDays(Appx1Rec);

    if FieldByName('Dt_Beg').AsDateTime <> 0 then
      // Виды, с неуказанной датой начала/конца, типа ДоМинЗП игнорируются.
      AddToNrcCds(Appx1Rec);
  end;
end;

//------------------------------------------------------------------------------
// Значения ключевых полей связанные с данными сотрудника.
//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.FillKeysEmplSpecif(var Appx1Rec: TAppx1Rec);
var
  EmplCateg: word;
  Supplmnt: ShortString;
  DummyWord: word;
  PaymntParams: TPaymntParams;
begin
  with Appx1And6Stage, QryPaymnts, Appx1Rec do begin
    DecodeDate(
      FieldByName('ZaMesGod').AsDateTime, PAY_YEAR, PAY_MNTH, DummyWord);

    // Спецстаж...
    EmplCateg := FieldByName('KdKatP').AsInteger;
    if EmplCateg = EMPL_CAT_PPS then
      EXP := 1
    else
      EXP := 0;

    // ZO ...
    if EXP = 1 then
      ZO := ZO_PPS
    else
      ZO := ZO_CMN;

    // ZO с учётом инвалидности ...
    // Возвращаемся к PRR иначе суммы по инвалидам не сходятся с мем.ордерами
    EmplIsDisable(FieldByName('Prr').AsInteger);
    // CheckDisabililty(
    //   Max(ReportPeriod.Start, FieldByName('Dt_Beg').AsDateTime)
    // );

    if EmplDisabilityFlag then
      if ZO = ZO_PPS then
        ZO := ZO_DISABLE_PPS
      else
        ZO := ZO_DISABLE;

    // Трудовая книжка - на предприятии, если начисление - основное.
    // Признак вида начисления обязательно брать из начисл/удерж.,
    // а не из справочника видов. Потому как у больничных
    // и декретных в справочнике признак - основные, а при расчёте могут
    // начисляться суммы и основные и совместительские.
    Supplmnt := FieldByName('N_Sovm').AsString;
    if (Supplmnt = '1') then begin
      // or (Supplmnt = 'Y')
      // Случай Supplmnt = 'Y' не рассматриваем. Это - деление больничных и
      // декретных на основные и совместительские для Оксаны. Впрочем, надо
      // спросить у Ольги.
      // Любое совместительство - отсутствие трудовой книжки на предпр.
      // и неполный рабочий день.
      OTK := 0;
      NRC := 1;
    end else begin
      PaymntParams := GetPaymntParams;

      if (EmplCateg <> EMPL_CAT_CPH)
          and (PaymntParams.EmplType <> EMPL_TYPE_OUTER_SUPPLMNT) then
        OTK := 1;

      if PaymntParams.WrkTimePerc = 100 then
        NRC := 0
      else
        NRC := 1;
    end;
  end; {with}
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.FillKeysPayTypeSpecif(var Appx1Rec: TAppx1Rec);
var
  PayType: string;
  EmplIsDisable: boolean;
begin
  with Appx1And6Stage, QryPaymnts, Appx1Rec do begin
    PayType := FieldByName('VidN').AsString;

    EmplIsDisable := (ZO = ZO_DISABLE) or (ZO = ZO_DISABLE_PPS);

    // Нужно уточнить у Ольги, но скорее всего это ZO применяется
    // для ненулевых сумм. Поскольку виды 5011 и 5012 - неоплачиваемые,
    // это ZO - не применяется ...
    // if PayTypeIsChildCare(PayType) then
    //   ZO := ZO_CHILD_CARE
    // else

    if PayTypeIsMobiliz(PayType) then
      ZO := ZO_MOBILIZ

    else if PayTypeIsCPH(PayType) then
      ZO := ZO_CPH

    else if PayTypeIsPayableVacat(PayType) then begin
      PAY_TP := PAY_TP_OTP;

      // Если ранее определено, что сотрудник основной, смотрим тип отпуска
      // Ианче - бессмыслено, поскольку он уже - совместитель.
      if TVidNUtils.VidIsOtpSovm(PayType) then
        OTK := 0;

    end else if PayTypeIsDisease(PayType) then
      if EmplIsDisable then
        ZO := ZO_DISABLE_DISEASE
      else
        ZO := ZO_DISEASE

    else if PayTypeIsPregn(PayType) then
      if EmplIsDisable then
        ZO := ZO_DISABLE_PREGN
      else
        ZO := ZO_PREGN
    {else
      ZO := DeductionToZo(PayType, ZO)};

    if FieldByName('Sovm').AsString = '1' then
      OTK := 0;

    if (ZO = ZO_CMN) or (ZO = ZO_DISABLE) then
      EXP := 0
    else if (ZO = ZO_PPS) or (ZO = ZO_DISABLE_PPS) then
      EXP := 1
    else if ZO = ZO_CPH then begin
      PAY_TP := PAY_TP_LONGER_MONTH;
      OTK := 0;
    end;

    // Отчисления с ДоМинЗП Предпр.
    if PayTypeIsEntSocMinZp(PayType) then
      PAY_TP := PAY_TP_DIF_MIN_ZP;
  end; {with}
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.SumTotal(var Appx1Rec: TAppx1Rec);
var
  PayType: ShortString;
begin
  with Appx1And6Stage.QryPaymnts do begin
    PayType := FieldByName('VidN').AsString;

    if not PayTypeIsEntSocMinZp(PayType) then
      Appx1Rec.SUM_TOTAL := MathUtils.Round(FieldByName('Summa').AsFloat, 2);
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.SumMax(var Appx1Rec: TAppx1Rec);
var
  PayType: ShortString;
begin
  with Appx1And6Stage.QryPaymnts do begin
    PayType := FieldByName('VidN').AsString;

    if not PayTypeIsEntSocMinZp(PayType) then
      Appx1Rec.SUM_MAX := MathUtils.Round(FieldByName('Summa').AsFloat, 2);
  end;
end;

//------------------------------------------------------------------------------
// Если расчётный месяц предшествует с отчётным, в отчёт включаем только
// начисления по виду VIDN_SUM_DO_MIN_ZP13 (связанные с больничными,
// как у Соколовской). В отчётном - по обоим видам.
//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.SumDiff(var Appx1Rec: TAppx1Rec);
var
  PayType: ShortString;
begin
  with Appx1And6Stage.QryPaymnts do begin
    PayType := FieldByName('VidN').AsString;

    with Appx1Rec, ReportDate do
      if (PAY_MNTH = Mnth) and (PAY_YEAR = Year)
          and (PayType = VIDN_SUM_DO_MIN_ZP13)
          or (PayType = VIDN_SUM_DO_MIN_ZP17) then

        SUM_DIFF := MathUtils.Round(FieldByName('Summa').AsFloat, 2);
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.SumIns(var Appx1Rec: TAppx1Rec);
begin
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.MoveEmplToAppx1Table;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure Write(Appx1Rec: TDataSet);
  var
    Mnth, Year: Word;
    DaysCount: Integer;
  begin
    with Appx1Rec do begin
      Mnth := FieldByName('PAY_MNTH').AsInteger;
      Year := FieldByName('PAY_YEAR').AsInteger;

      if EncodeDate(Year, Mnth, 1) >= ReportPeriod.Start then begin
        DaysCount := Appx1Writer.CountDaysTotalAndDelete(
          CdsPtvDays, 'Dt_Priem', 'Dt_Uvoln', Mnth, Year);

        if DaysCount <> 0 then begin
          Edit;
          FieldByName('KD_PTV').AsInteger := DaysCount;
          Post;
        end;
      end;
    end;
  end;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure WritePtvDays(Appx1Rec: TDataSet);
  var
    PayMnth, PayYear: Word;
    MarkPrinc,
    MarkSuppl,
    MarkAny,
    ReturnMark: TBookmark;
    Force: Boolean;

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure ProcessMnth(out Force: Boolean);
    begin
      Force := false;

      MarkPrinc := nil;
      MarkSuppl := nil;

      with Appx1Rec do begin
        MarkAny := GetBookmark;

        repeat
          if FieldByName('PAY_TP').AsInteger <> PAY_TP_DIF_MIN_ZP then begin
            if FieldByName('OTK').AsInteger = 1 then begin
              // Сначала пытаемся зписать в основную не 13-ю ..
              if not Assigned(MarkPrinc) then
                MarkPrinc := GetBookmark;

              if FieldByName('ZO').AsInteger in
                  [ZO_PREGN, ZO_DISABLE_PREGN] then
                Force := true;
            end else if not Assigned(MarkSuppl) then
              // .. затем - в совмест. не 13-ю,
              MarkSuppl := GetBookmark;
          end;

          Next;
        until Eof
          or (FieldByName('PAY_YEAR').AsInteger > PayYear)
          or (FieldByName('PAY_YEAR').AsInteger = PayYear)
            and (FieldByName('PAY_MNTH').AsInteger > PayMnth);
      end;
    end;
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  begin
    with Appx1Rec do begin
      MarkPrinc := nil;
      MarkSuppl := nil;
      MarkAny := nil;

      First;

      while not Eof do begin
        PayMnth := FieldByName('PAY_MNTH').AsInteger;
        PayYear := FieldByName('PAY_YEAR').AsInteger;

        if (PayYear < ReportDate.Year)
            or (PayYear = ReportDate.Year) and (PayMnth <= ReportDate.Mnth)
            or (FieldByName('ZO').AsInteger in [ZO_PREGN, ZO_DISABLE_PREGN])
        then begin
          FreeBookmark(MarkPrinc);
          FreeBookmark(MarkSuppl);
          FreeBookmark(MarkAny);

          ProcessMnth(Force);

          if not Eof then
            if Force then begin
              ReturnMark := GetBookmark;
              GotoBookmark(MarkPrinc);

              Write(Appx1Rec);

              GotoBookmark(ReturnMark);
              FreeBookmark(ReturnMark);
            end;
        end else
          Next;
      end;

      if Assigned(MarkPrinc) then begin
        GotoBookmark(MarkPrinc);
        Write(Appx1Rec);
      end else if Assigned(MarkSuppl) then begin
        GotoBookmark(MarkSuppl);
        Write(Appx1Rec);
      end else if Assigned(MarkAny) then begin
        GotoBookmark(MarkAny);
        Write(Appx1Rec);
      end;

      FreeBookmark(MarkPrinc);
      FreeBookmark(MarkSuppl);
      FreeBookmark(MarkAny);
    end;
  end;

begin
  DsUtils.EnumDataSet(CdsAppx1, MoveToInterProc);

  WritePtvDays(CdsAppx1Inter);

  DsUtils.EnumRowset(CdsAppx1Inter, MoveToTableProc);

  WriteEnterpriseSoc;
end;

//..............................................................................
// Копируем в промежуточный Cds и выполняем трансформации.
// Все записи, если была необходимость, перераспределены по месяцам.
// Теперь можно будет merge'ить с 13-м PAY_TP, зная есть ли другие записи
// в этом платёжном периоде.
//..............................................................................
procedure TAppx1And6MnthStage.MoveToInterProc(
  Appx1Rec: TDataSet;
  Tag: TObject);
begin
  // Запись с пустыми суммами не пишется в случаях:
  if Appx1Writer.SumsAreZero(Appx1Rec) and RecIsToExcludeOnZero(Appx1Rec) then
     exit;

  with CdsAppx1Inter do begin
    Append;
    DsUtils.CopyRecord(Appx1Rec, CdsAppx1Inter);
    Post;
  end;

  ApplyTermination(CdsAppx1Inter);

  if PayPeriodIsInPast(CdsAppx1Inter) then begin
    // Записи за прошлые месяцы с PAY_TP = PAY_TP_DIF_MIN_ZP и
    // отрицательными суммами превращаются в PAY_TP = PAY_TP_ENT_SOC_REFUND
    // c положительными.
    ApplyConvertEntSocMinZp(CdsAppx1Inter);

    // Положительные суммы прошлых месяцев переносим в отчётный.
    ApplyMovePositiveToRepMnth(CdsAppx1Inter);
  end;
end;

//------------------------------------------------------------------------------
// Пишем записи в финальную таблицу.
//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.MoveToTableProc(
  Appx1Rec: TDataSet;
  Tag: TObject);
begin
  Appx1Writer.AddOrUpdateAppx1Tbl(Appx1Rec);
end;

//..............................................................................
function TAppx1And6MnthStage.RecIsToExcludeOnZero(Appx1Rec: TDataSet): boolean;
begin
  with Appx1Rec do begin
    Result :=
      // Если сотрудник уволен.
      // Проверка на уволенность нужна для случаев операторской ошибки:
      // Таб№ 10751 уволен в 2021, но отметка об увольнени сделана лишь в
      // окт.2022. Всё это время попадал в списки и рассчитывался.
      // В результате - формируется одна запись с нул.суммой и он попал бы
      // в отчёт. Пример: июль 2022 года.
      EmplIsTerminated(EncodeDate(FieldByName('PAY_YEAR').AsInteger,
        FieldByName('PAY_MNTH').AsInteger, 1))
      // .. прошлых периодов:
      or PayPeriodIsInPast(Appx1Rec)
      // .. будущих периодов:
      or PayPeriodIsInFuture(Appx1Rec)
      // .. запись является декретной, отпускн. и т.д., и является
      // итогом пересчётов с нулевым результатом:
      or not (FieldByName('ZO').AsInteger in
        [ZO_CMN, ZO_DISABLE, ZO_PPS, ZO_DISABLE_PPS])
      or not (FieldByName('PAY_TP').AsInteger = PAY_TP_DEFAULT);
  end;
end;


//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.WriteEnterpriseSoc;
var
  PayMnth, PayYear: word;
begin
  with SpovReport, TblAppx1 do begin
    Locate('NUMIDENT', FieldByName('NUMIDENT').AsString, []);

    while not Eof do begin
      PayMnth := FieldByName('PAY_MNTH').AsInteger;
      PayYear := FieldByName('PAY_YEAR').AsInteger;

      OpenEntSocPercQry(EncodeDate(PayYear, PayMnth, 1));

      while (FieldByName('PAY_MNTH').AsInteger = PayMnth)
          and (FieldByName('PAY_YEAR').AsInteger = PayYear)
          and not Eof do begin

        Edit;
        FieldByName('SUM_NARAH').AsFloat := GetSumNarah;
        Post;

        Next;
      end;

      Appx1And6Stage.QryEsvPerc.Close;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Записи за прошлые месяцы с PAY_TP = PAY_TP_DIF_MIN_ZP
// и отрицательными суммами превращаются в PAY_TP = PAY_TP_ESV_REFUND
// c положительными.
//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.ApplyConvertEntSocMinZp(Appx1Rec: TDataSet);
begin
  with Appx1Rec do
    if (FieldByName('PAY_TP').AsInteger = PAY_TP_DIF_MIN_ZP)
        and (FieldByName('SUM_DIFF').AsFloat < 0) then begin

      Edit;
      FieldByName('PAY_TP').AsInteger := PAY_TP_ENT_SOC_REFUND;
      FieldByName('SUM_DIFF').AsFloat := -FieldByName('SUM_DIFF').AsFloat;
      FieldByName('SUM_NARAH').AsFloat := -FieldByName('SUM_NARAH').AsFloat;
      Post;
    end;
end;

//------------------------------------------------------------------------------
// Положительные суммы прошдых месяцев переносятся в отчётный.
//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.ApplyMovePositiveToRepMnth(Appx1Rec: TDataSet);
begin
  with Appx1Rec do
    // Переносим положительные ..
    if (MathUtils.Round(FieldByName('SUM_TOTAL').AsFloat, 2) > 0)
        and not (FieldByName('ZO').AsInteger in [
          // .. игнорируем договортые ..
          ZO_CPH,
          // .. больничные ..
          ZO_DISEASE, ZO_DISABLE_DISEASE,
          // .. декретные ..
          ZO_PREGN, ZO_DISABLE_PREGN])
        and not (FieldByName('PAY_TP').AsInteger in [
          // .. уволенных ..
          PAY_TP_LONGER_MONTH,
          // .. отпуска ..
          PAY_TP_OTP,
          // .. ЕСВ МинЗП в обеих ипостасях ..
          PAY_TP_ENT_SOC_REFUND,
          PAY_TP_DIF_MIN_ZP])
    then begin
      Edit;
      FieldByName('PAY_MNTH').AsInteger := ReportDate.Mnth;
      FieldByName('PAY_YEAR').AsInteger := ReportDate.Year;
      Post;
    end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.ApplyTermination(Appx1Rec: TDataSet);
begin
  with Appx1Rec do
    // Если человек уволен и не болеет, и не в декрете, ставим ему pay type.
    if EmplIsTerminated(ReportPeriod.Start)
        and not (FieldByName('ZO').AsInteger in [
        ZO_DISEASE, ZO_DISABLE_PPS, ZO_DISABLE_DISEASE,
        ZO_PREGN, ZO_DISABLE_PREGN])
        and (FieldByName('PAY_TP').AsInteger = PAY_TP_DEFAULT)
        // Тип платежа PAY_TP_LONGER_MONTH не применяем, если сумма
        // отрицательная. Даже если сотрудник уволен. Просто оставляем пустым.
        and (FieldByName('SUM_TOTAL').AsFloat >= 0) then begin
      Edit;
      FieldByName('PAY_TP').AsInteger := PAY_TP_LONGER_MONTH;
      Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.AddNonPayDays(Appx1Rec: TAppx1Rec);
const
  PAY_WEIGHT = -1;
  NON_PAY_WEIGHT = 1;
var
  PayType: string;
  Weight: integer;
begin
  with Appx1And6Stage, QryPaymnts do begin
    PayType := FieldByName('VidN').AsString;
    Weight := 0;

    {if (PayType > '2400') and (PayType < '2500') then
      if QryPaymnts.FieldByName('Storn').AsString = 'Y' then
        Weight := NON_PAY_WEIGHT
      else
        Weight := PAY_WEIGHT
    else }
    if (PayType > '5000') and (PayType < '6000')
        and (PayType <> '5007') then
      if QryPaymnts.FieldByName('Storn').AsString = 'Y' then
        Weight := PAY_WEIGHT
      else
        Weight := NON_PAY_WEIGHT
    {
    else if (PayType > '2600') and (PayType <= '2605') then
        Weight := PAY_WEIGHT
    }
    ;

    if Weight = 0 then
      exit;

    with CdsNonPayDaysBuff, Appx1Rec do begin
      Edit;

      FieldByName('PAY_MNTH').AsInteger := PAY_MNTH;
      FieldByName('PAY_YEAR').AsInteger := PAY_YEAR;
      FieldByName('OTK').AsInteger := OTK;

      FieldByName('Dt_Beg').AsDateTime :=
        QryPaymnts.FieldByName('Dt_Beg').AsDateTime;
      FieldByName('Dt_End').AsDateTime :=
        QryPaymnts.FieldByName('Dt_End').AsDateTime;

      FieldByName('Weight').AsInteger := Weight;

      Post;
    end;

    Correlation.CorrelateDataSetPeriods(CdsNonPayDaysBuff, CdsNonPayDays,
      'Dt_Beg', 'Dt_End', 'Weight', NonPayCorrDecisionFunc);
  end;
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.NonPayCorrDecisionFunc(
  Src, Dest: TDataSet): boolean;
begin
  Result :=
    Dest.FieldByName('OTK').AsInteger = Src.FieldByName('OTK').AsInteger;
end;

//------------------------------------------------------------------------------
{
procedure TAppx1And6MnthStage.AddToAppx1Cds(
  Appx1Rec: TAppx1Rec);
var
  Located: boolean;
begin
  Located := false;

  with Appx1And6Stage, CdsAppx1, Appx1Rec do begin
    if Locate(GetAppx1CdsKeys, GetAppx1CdsValues(Appx1Rec), []) then begin
      Located := true;
      Edit;
    end else begin
      if SumsAreZero(Appx1Rec) then begin
        if LocateSuitForZeroSums(Appx1Rec) then begin
          // Пришла нулевая запись. Ищем по ключам, исключая ZO и PAY_TP.
          // Если нашли, выходим: запись не нужна. Иначе - будем добавлять.
          exit;
        end
      end else
        // Записи с нулевыми суммами нужны для того, чтобы обозначить, что
        // хоть ЗП и не начислялась, человек работал. Если есть другие записи
        // с теми же ключами, нулевые становятся не нужны. Поэтому перед
        // добавлением новой, нужно проверить нет ли подходящей нулевой,и
        // если есть - перезаписать её. При поиске представляется возможным
        // пренебречь ZO и PAY_TP нулевой записи и использовать вместо них
        // значения добавляемой.
        if LocateZeroSums(Appx1Rec) then begin
          Located := true;
          Edit;

          FieldByName('ZO'    ).AsInteger := ZO;
          FieldByName('PAY_TP').AsInteger := PAY_TP;
        end;
    end;

    if not Located then begin
      Append;

      FieldByName('ZO'        ).AsInteger := ZO;
      FieldByName('PAY_TP'    ).AsInteger := PAY_TP;
      FieldByName('PAY_MNTH'  ).AsInteger := PAY_MNTH;
      FieldByName('PAY_YEAR'  ).AsInteger := PAY_YEAR;
      FieldByName('OTK'       ).AsInteger := OTK;
      FieldByName('EXP'       ).AsInteger := EXP;
    end;

    FieldByName('SUM_TOTAL').AsFloat :=
      FieldByName('SUM_TOTAL').AsFloat + SUM_TOTAL;
    FieldByName('SUM_MAX').AsFloat :=
      FieldByName('SUM_MAX').AsFloat + SUM_MAX;
    FieldByName('SUM_DIFF').AsFloat :=
      FieldByName('SUM_DIFF').AsFloat + SUM_DIFF;
    FieldByName('SUM_INS').AsFloat :=
      FieldByName('SUM_INS').AsFloat + SUM_INS;
    FieldByName('SUM_NARAH').AsFloat :=
      FieldByName('SUM_NARAH').AsFloat + SUM_NARAH;

    Post;
  end;
end;
}

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.AddToAppx1Cds(
  Appx1Rec: TAppx1Rec);
begin
  with Appx1And6Stage, CdsAppx1, Appx1Rec do begin
    if Locate(GetAppx1CdsKeys, GetAppx1CdsValues(Appx1Rec), []) then
      Edit
    else begin
      Append;

      FieldByName('NUMIDENT').AsString  := NUMIDENT;
      FieldByName('ZO'      ).AsInteger := ZO;
      FieldByName('PAY_TP'  ).AsInteger := PAY_TP;
      FieldByName('PAY_MNTH').AsInteger := PAY_MNTH;
      FieldByName('PAY_YEAR').AsInteger := PAY_YEAR;
      FieldByName('OTK'     ).AsInteger := OTK;
      FieldByName('EXP'     ).AsInteger := EXP;
    end;

    FieldByName('SUM_TOTAL').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_TOTAL').AsFloat, 2) +
      MathUtils.Round(SUM_TOTAL, 2), 2);
    FieldByName('SUM_MAX').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_MAX').AsFloat, 2) +
      MathUtils.Round(SUM_MAX, 2), 2);
    FieldByName('SUM_DIFF').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_DIFF').AsFloat, 2) +
      MathUtils.Round(SUM_DIFF, 2), 2);
    FieldByName('SUM_INS').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_INS').AsFloat, 2) +
      MathUtils.Round(SUM_INS, 2), 2);
    FieldByName('SUM_NARAH').AsFloat := MathUtils.Round(
      MathUtils.Round(FieldByName('SUM_NARAH').AsFloat, 2) +
      MathUtils.Round(SUM_NARAH, 2), 2);

    if NRC = 1 then
      FieldByName('NRC').AsInteger := NRC;

    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.OpenEntSocPercQry(PayPeriodBeg: TDateTime);
begin
  with Appx1And6Stage.QryEsvPerc do begin
    ParamByName('DtBeg').AsDateTime := PayPeriodBeg;
    Open;
  end;
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.GetSumNarah: double;
var
  Zo: word;
  Field: TField;
  Sum: double;
begin
  with SpovReport.TblAppx1 do begin
    Zo := FieldByName('ZO').AsInteger;

    with Appx1And6Stage.QryEsvPerc do
      if Zo = ZO_DISEASE then
        Field := FieldByName('PrcBln')
      else if Zo = ZO_PREGN then
        Field := FieldByName('PrcDekr')
      else if Zo in [ZO_DISABLE, ZO_DISABLE_PPS] then
        Field := FieldByName('PrcInv')
      else if Zo = ZO_DISABLE_DISEASE then
        Field := FieldByName('PrcBlnInv')
      else if Zo = ZO_DISABLE_PREGN then
        Field := FieldByName('PrcDekrInv')
      else
        Field := FieldByName('PrcCmn');

    if FieldByName('PAY_TP').AsInteger in
        [PAY_TP_ENT_SOC_REFUND, PAY_TP_DIF_MIN_ZP] then
      Sum := MathUtils.Round(FieldByName('SUM_DIFF').AsFloat, 2)
    else
      Sum := MathUtils.Round(FieldByName('SUM_TOTAL').AsFloat, 2);

    Result := MathUtils.Round(Sum * (Field.AsFloat / 100), 2);
  end;
end;

//------------------------------------------------------------------------------
// Используем из ключей только три: OTK, EXP, NRC.
//------------------------------------------------------------------------------
function TAppx1And6MnthStage.LocateZeroSums(Appx1Rec: TAppx1Rec): boolean;
begin
  with Appx1Rec do
    Result := CdsAppx1.Locate(
      'OTK;EXP;NRC;SUM_TOTAL;SUM_MAX;SUM_DIFF;SUM_INS;SUM_NARAH',
      VarArrayOf([OTK, EXP, NRC, 0, 0, 0, 0, 0]), []);
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.LocateZeroSums(Appx1Rec: TDataSet): boolean;
begin
  with Appx1Rec do
    Result := SpovReport.TblAppx1.Locate(
      'NUMIDENT;PAY_MNTH;PAY_YEAR;OTK;EXP;NRC;' +
      'SUM_TOTAL;SUM_MAX;SUM_DIFF;SUM_INS;SUM_NARAH',
      VarArrayOf([FieldByName('NUMIDENT').AsString,
        FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger,
        FieldByName('OTK').AsInteger, FieldByName('EXP').AsInteger,
        FieldByName('NRC').AsInteger, 0, 0, 0, 0, 0]), []);
end;

//------------------------------------------------------------------------------
// Игрорируем из ключей только три: OTK, EXP, NRC.
//------------------------------------------------------------------------------
function TAppx1And6MnthStage.LocateSuitForZeroSums(
  Appx1Rec: TAppx1Rec): boolean;
begin
  with Appx1Rec do
    Result := CdsAppx1.Locate('OTK;EXP;NRC',
    VarArrayOf([OTK, EXP, NRC]), []);
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.LocateSuitForZeroSums(Appx1Rec: TDataSet): boolean;
begin
  with Appx1Rec do
    Result := SpovReport.TblAppx1.Locate(
      'NUMIDENT;PAY_MNTH;PAY_YEAR;OTK;EXP;NRC', VarArrayOf(
        [FieldByName('NUMIDENT').AsString,
        FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger,
        FieldByName('OTK').AsInteger, FieldByName('EXP').AsInteger,
        FieldByName('NRC').AsInteger]), []);
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.AddDiseaseDays(Appx1Rec: TAppx1Rec);
var
  PayType: string;
begin
  with Appx1And6Stage, QryPaymnts do begin
    PayType := FieldByName('VidN').AsString;

    if (PayType > '2600') and (PayType < '2700') and not (PayType = '2602') then
      with CdsDiseaseDays do begin
        Append;
        FieldByName('Dt_Beg').AsDateTime :=
          QryPaymnts.FieldByName('Dt_Beg').AsDateTime;
        FieldByName('Dt_End').AsDateTime :=
          QryPaymnts.FieldByName('Dt_End').AsDateTime;
        Post;
      end;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.AddPregnDays(Appx1Rec: TAppx1Rec);
var
  PayType: string;
begin
  with Appx1And6Stage, QryPaymnts do begin
    PayType := FieldByName('VidN').AsString;

    if PayType = '2602' then
      with CdsPregnDays do begin
        Append;
        FieldByName('Dt_Beg').AsDateTime :=
          QryPaymnts.FieldByName('Dt_Beg').AsDateTime;
        FieldByName('Dt_End').AsDateTime :=
          QryPaymnts.FieldByName('Dt_End').AsDateTime;
        Post;
      end;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.AddToNrcCds(Appx1Rec: TAppx1Rec);
begin
  with CdsNrc, Appx1Rec do begin
    if CdsNrc.Locate(
        GetNrcCdsKeys, VarArrayOf([PAY_MNTH,PAY_YEAR,OTK,EXP]), []) then begin
      Edit;

      // Правило 1 <<<
      if FieldByName('NRC').AsInteger = 0 then
        FieldByName('NRC').AsInteger := NRC;
      // >>> Правило 1
    end else begin
      Append;

      FieldByName('PAY_MNTH').AsInteger := PAY_MNTH;
      FieldByName('PAY_YEAR').AsInteger := PAY_YEAR;
      FieldByName('OTK'     ).AsInteger := OTK;
      FieldByName('EXP'     ).AsInteger := EXP;
      FieldByName('NRC'     ).AsInteger := NRC;
    end;

    Post;
  end;
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.GetPaymntParams: TPaymntParams;
var
  PaymntPayType: ShortString;
  PaymntBegDate,
  AllowEndDate: TDateTime;
begin
  with Result do begin
    WrkTimePerc := 100;
    EmplType := EMPL_TYPE_PRINCIPAL;

    with Appx1And6Stage do begin
      with QryPaymnts do begin
        PaymntPayType := FieldByName('VidN').AsString;
        PaymntBegDate := Max(FieldByName('Dt_Beg').AsDateTime, PayPeriod.Start);
      end;

      with QryAssignmnts do begin
        First;

        while not Eof do begin
          if FieldByName('P_DtBeg').AsDateTime <= PaymntBegDate then begin
            // Пока дата перемещение может быть перемещением этого начисл/удерж.,
            // берём его данные.
            WrkTimePerc := FieldByName('PrcWrkTime').AsInteger;
            EmplType := FieldByName('Sovm').AsInteger;
          end else
            // Начисление/удерж. уже не относится к перемещению.
            break;

{          Next;
        end;

        while not Eof do begin
}

          // Если вид пришёл через надбавки...
          if (FieldByName('VidN').AsString = PaymntPayType)
            AND (PaymntPayType < '5000')
          then begin
            AllowEndDate := FieldByName('Dt_End').AsDateTime;

            if (PaymntBegDate >= FieldByName('N_DtBeg').AsDateTime)
              and ((PaymntBegDate <= AllowEndDate)
                or (AllowEndDate = 0)) then begin

              with Result do begin
                // Параметры надбавок имеют преимущество перед параметрами перемещ.
                WrkTimePerc := FieldByName('Prc_WT').AsInteger;

                if FieldByName('Kd_Sovm').AsInteger <> EMPL_TYPE_PRINCIPAL then
                  // Совместительство надбавки не может быть "основным" для
                  // совместительских перемещений. Поэтому значение
                  // EMPL_TYPE_PRINCIPAL игнорируем. Будет использовано значение
                  // из перемещений.
                  EmplType := FieldByName('Kd_Sovm').AsInteger;
              end;

              break;
            end;
          end;
          
          Next;
        end;
      end;
    end;

    if WrkTimePerc = 0 then
      // Ноль равнозначен ста.
      WrkTimePerc := 100;
  end;
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.PayPeriodIsInPast(
  DataRec: TDataSet): boolean;
var
  PayYear: word;
begin
  with DataRec, ReportDate do begin
    PayYear := FieldByName('PAY_YEAR').AsInteger;

    Result := (PayYear < Year) or
      (PayYear = Year) and (FieldByName('PAY_MNTH').AsInteger < Mnth);
  end;
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.PayPeriodIsInFuture(
  DataRec: TDataSet): boolean;
var
  Date: TDate;
begin
  Date := DateUtils.Decode(ReportPeriod.Start);

  with DataRec do
    Result := (FieldByName('PAY_YEAR').AsInteger > Date.Year)
      or (FieldByName('PAY_YEAR').AsInteger = Date.Year)
      and (FieldByName('PAY_MNTH').AsInteger > Date.Mnth);
end;

//------------------------------------------------------------------------------
procedure TAppx1And6MnthStage.CheckDisabililty(AsOfDate: TDateTime);
begin
  EmplDisabilityFlag := false;

  with DisableDocsQry do begin
    First;

    while not Eof do begin
      if (AsOfDate >= FieldByName('DtBeg').AsDateTime)
          and ((AsOfDate <= FieldByName('DtEnd').AsDateTime)
            or (FieldByName('DtEnd').AsDateTime = 0)) then begin
        EmplDisabilityFlag := true;
        break;
      end;
      
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Для прошлых месяцев надо смотреть по уволенности в отчётном,
// для будущих - по уволенности в расчётном месяце.
// Например, Таб№ 9310, Капустян:
// Декрет с 06.2022, Весь 07.2022 - уволена, в 08.2022 - опять принята.
// Получается в 6-м и 7-м надо ставить PAY_TP = 1, дальше - нет?
// Спросить у Ольги!
//------------------------------------------------------------------------------
function TAppx1And6MnthStage.EmplIsTerminated(Date: TDateTime): boolean;
var
  EmplmntPeriod: TPeriod;
begin
  Result := true;

  with CdsEmplmntDays, DateUtils do begin
    First;

    while not Eof do begin
      EmplmntPeriod := InitPeriod(FieldByName('Dt_Priem').AsDateTime,
        FieldByName('Dt_Uvoln').AsDateTime);

      if PeriodsAreIntersected(EmplmntPeriod,
          InitPeriod(Date, EndOfMonth(Date))) then begin
        Result := false;
        break;
      end;

      Next;
    end;
  end;
{
  if PayPeriod.Start < ReportPeriod.Start then
    Result := EmplTermFlag
  else
    Result := CdsEmplmntDays.RecordCount = 0;
}
end;

//------------------------------------------------------------------------------
{
function TAppx1And6MnthStage.AllPeriodIsNonPay(Appx1Rec: TDataSet): boolean;
begin
  with Appx1Rec do
    Result := FieldByName('KD_NZP').AsInteger = FieldByName('KD_PTV').AsInteger;
end;
}

//------------------------------------------------------------------------------
class function TAppx1And6MnthStage.PayTypeIsCPH(PayType: string): boolean;
begin
  Result := (PayType = '1005') or (PayType = '1006') or (PayType = '1008');
end;

//------------------------------------------------------------------------------
class function TAppx1And6MnthStage.PayTypeIsMobiliz(PayType: string): boolean;
begin
  Result := (PayType = '1208') or (PayType = '1210');
end;

//------------------------------------------------------------------------------
class function TAppx1And6MnthStage.PayTypeIsDisease(PayType: string): boolean;
begin
  Result := (PayType > '2600') and (PayType < '2700')
    and not PayTypeIsPregn(PayType);
end;

//------------------------------------------------------------------------------
class function TAppx1And6MnthStage.PayTypeIsPregn(PayType: string): boolean;
begin
  Result := (PayType = '2602');
end;

//------------------------------------------------------------------------------
{
class function TAppx1And6MnthStage.PayTypeIsChildCare(PayType: string): boolean;
begin
  Result := (PayType = VIDN_CHILD_3Y) or (PayType = VIDN_CHILD_6Y);
end;
}

//------------------------------------------------------------------------------
class function TAppx1And6MnthStage.PayTypeIsEntSocMinZp(
  PayType: string): boolean;
begin
  Result :=
    (PayType = VIDN_ESV_MIN_ZP_CMN) or (PayType = VIDN_ESV_MIN_ZP_PPS)
    or (PayType = VIDN_ESV_MIN_ZP_BLN) or (PayType = VIDN_ESV_MIN_ZP_DKR)
    or (PayType = VIDN_SUM_DO_MIN_ZP13) or (PayType = VIDN_SUM_DO_MIN_ZP17);
end;

//------------------------------------------------------------------------------
class function TAppx1And6MnthStage.PayTypeIsPayableVacat(
  PayType: ShortString): boolean;
begin
  Result := (PayType = '1810') or (PayType > '2400') and (PayType < '2500');
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.EmplIsDisable(PRR: SmallInt): Boolean;
begin
  Result := PRR in [3,4,7];
  EmplDisabilityFlag := Result;
end;

//------------------------------------------------------------------------------
function TAppx1And6MnthStage.Appx1And6Stage: TAppx1And6Stage;
begin
  Result := Parent as TAppx1And6Stage;
end;
//..............................................................................
function TAppx1And6MnthStage.EmplListQry: TQuery;
begin
  Result := Appx1And6Stage.QryEmplList;
end;
//..............................................................................
function TAppx1And6MnthStage.DisableDocsQry: TQuery;
begin
  Result := Appx1And6Stage.QryDisableDocs;
end;

//------------------------------------------------------------------------------
class function TAppx1And6MnthStage.InitAppx1Rec: TAppx1Rec;
begin
  with Result do begin
    PERIOD_Y := 0;
    PERIOD_M := 0;
    UKR_GROMAD := 0;
    ST := 0;
    NUMIDENT := '';
    LN := '';
    NM := '';
    FTN := '';
    ZO := 0;
    PAY_TP := 0;
    PAY_MNTH := 0;
    PAY_YEAR := 0;
    KD_NP := 0;
    KD_NZP := 0;
    KD_PTV := 0;
    KD_VP := 0;
    SUM_TOTAL := 0;
    SUM_MAX := 0;
    SUM_DIFF := 0;
    SUM_INS := 0;
    SUM_NARAH := 0;
    OTK := 0;
    EXP := 0;
    NRC := 0;
    // NRM := 0;
    // OZN := 0;
  end;
end; {InitT6Rec}

//------------------------------------------------------------------------------
// Количество полей и их очерёдность во всех трёх функциях должны быть одинакова
// Изменяем в одной, надо соответственно изменить в остальных.
//------------------------------------------------------------------------------
class function TAppx1And6MnthStage.GetAppx1CdsKeys: ShortString;
begin
  Result := 'PAY_YEAR;PAY_MNTH;PAY_TP;ZO;OTK;EXP';
end;
//..............................................................................
class function TAppx1And6MnthStage.GetAppx1CdsValues(
  Appx1Rec: TAppx1Rec): TVariantArray;
begin
  with Appx1Rec do
    Result := VarArrayOf([PAY_YEAR,PAY_MNTH,PAY_TP,ZO,OTK,EXP]);
end;
//..............................................................................
class function TAppx1And6MnthStage.GetAppx1CdsValues(
  Appx1Rec: TDataSet): TVariantArray;
begin
  with Appx1Rec do
    Result := VarArrayOf([
      FieldByName('PAY_YEAR').AsInteger, FieldByName('PAY_MNTH').AsInteger, 
      FieldByName('PAY_TP').AsInteger, FieldByName('ZO').AsInteger,
      FieldByName('OTK').AsInteger, FieldByName('EXP').AsInteger]);
end;
//..............................................................................

//------------------------------------------------------------------------------
// Количество полей и их очерёдность во всех трёх функциях должны быть одинакова
// Изменяем в одной, надо соответственно изменить в остальных.
//------------------------------------------------------------------------------
class function TAppx1And6MnthStage.GetNrcCdsKeys: ShortString;
begin
  Result := 'PAY_MNTH;PAY_YEAR;OTK;EXP';
end;
//..............................................................................
class function TAppx1And6MnthStage.GetNrcCdsValues(
Appx1Rec: TAppx1Rec): TVariantArray;
begin
  with Appx1Rec do
    Result := VarArrayOf([PAY_MNTH, PAY_YEAR, OTK, EXP]);
end;
//..............................................................................
class function TAppx1And6MnthStage.GetNrcCdsValues(
  Appx1Rec: TDataSet): TVariantArray;
begin
  with Appx1Rec do
    Result := VarArrayOf([
      FieldByName('PAY_MNTH').AsInteger, FieldByName('PAY_YEAR').AsInteger,
      FieldByName('OTK').AsInteger, FieldByName('EXP').AsInteger]);
end;

//..............................................................................
procedure TAppx1And6MnthStage.WriteCdsToFilesPrior;
begin
  if (SpovReport.EmplIds <> '')
    or (Appx1And6Stage.QryEmplList.FieldByName('TabN').AsInteger = LOG_EMPL_ID)
  then begin
    CdsAppx1.SaveToFile('APPX1.CDS');

    if Assigned(CdsEmplmntDays) then
      CdsEmplmntDays.SaveToFile('EMPLMNT.CDS');
    if Assigned(CdsDiseaseDays) then
      CdsDiseaseDays.SaveToFile('NP.CDS');
    if Assigned(CdsNonPayDays) then
      CdsNonPayDays.SaveToFile('NZP.CDS');
    if Assigned(CdsPtvDays) then
      CdsPtvDays.SaveToFile('PTV.CDS');
    if Assigned(CdsPregnDays) then
      CdsPregnDays.SaveToFile('VP.CDS');
  end;
end;

//..............................................................................
procedure TAppx1And6MnthStage.WriteCdsToFilesApost;
begin
  if (SpovReport.EmplIds <> '')
    or (Appx1And6Stage.QryEmplList.FieldByName('TabN').AsInteger = LOG_EMPL_ID)
  then begin
    if Assigned(CdsAppx1Inter) then
      CdsAppx1Inter.SaveToFile('APPX1Inter.CDS');
  end;
end;

end.

