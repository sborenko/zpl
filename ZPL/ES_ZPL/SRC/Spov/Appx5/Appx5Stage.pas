unit Appx5Stage;

interface

uses
   Db, DbClient, DbTables, TopLevelStage, IFaceProgressState, DateLib;

const
  T5_ZO_FULL_TIME     = 1; // Наёмные работники (трудовая книжка)
  T5_ZO_PART_TIME     = 2; // Наёмные работники (без трудовой книжки)
  T5_ZO_CPH           = 3; // Лица, работающие по ГПД (гражд.прав.договор)
  T5_ZO_CHILD_CARE_6Y = 4; // Лица, в отпуске по уходу за реб.до 6 лет
  T5_ZO_PREGNANCY     = 5; // Лица, в.отпуске по беременности и родам
  T5_ZO_CHILD_CARE_3Y = 6; // Лица, в отпуске по уходу за реб.до 3 лет

//  PAY_TYPE_PREGNANCY = '2602'; // Декретные
  PAY_TYPE_CHILD_3Y  = '5011'; // Уход за детьми до 3х лет
  PAY_TYPE_CHILD_6Y  = '5012'; // Уход за детьми до 6ти лет

  // Коды статей увольнения:
  DISMISS_REASON_PART_TIME = 3;  // Для совместителей
  DISMISS_REASON_CPH       = 41; // Для договорников

type
  TAppx5Rec = record
    PERIOD_M,       // Отчётный месяц.
    PERIOD_Y: word; // Отчётный год.

    UKR_GROMAD,     // Укр.гражданство.
    ZO,             // Категория подотчётного лица.
    DOG_CPH: integer; // Признак гражданско-правового договора.

    NUMIDENT,     // ИНН.
    LN,           // Фамилия.
    NM,           // Имя.
    FTN: string;  // Отчество.

    START_DT,     // Дата начала трудовых отношений.
    END_DT: TDateTime;  // ... окончания трудовых отношений.
    // NRM_DT: TDateTime; Дата создания рабочего места. Не используется.

    PID_ZV,       // Основание увольнения.
    PNR,          // Профессиональное название работы.
    PROF,         // Код классификатора профессий.
    POS,          // Должность.
    PID: string;  // Основание.
    // VZV: string; Воинское звание. Не используется.

    VS,           // Признак внутреннего совместительства.
    PIR: integer  // Признак перевода на другую должность.
    // OZN: integer; Служебное поле. Не используется.
  end;

  TAppx5Stage = class(TTopLevelStage)
  private
    Appx5Tbl: TTable;

    QryPeekPosition,
    QryPeekDismisReason: TQuery;

    procedure InitData;
    procedure FreeData;

    function CreateAppx5Cds: TClientDataSet;
    procedure StoreToAppx5Tbl;

    function FindRecord(Appx5Rec: TAppx5Rec): Boolean;

    procedure CopyRecToRecCds(Appx5Rec: TAppx5Rec);
  public
    ReportPeriod: TPeriod;
    QryMain: TQuery;

    // Полное 5-е приложение
    Appx5Cds,
    // Буфер одной записи
    RecCds: TClientDataset;

    procedure Start(ProgressState: IProgressState); override;

    function StageName: ShortString; override;
    function StageItemsTotal: integer; override;

    procedure Process; override;

    // *** //

    class procedure FillFromPersInfo(
      UpiDs: TDataSet; var Appx5Rec: TAppx5Rec);
    class procedure FillZoFromAssign(
      AssignRec: TDataSet; var Appx5Rec: TAppx5Rec);

    procedure FillPosition(
      PositionId: integer; var Appx5Rec: TAppx5Rec);
    class procedure FillDismisReason(Query: TQuery;
      DismisReasonId: integer; var Appx5Rec: TAppx5Rec);

    class function OrderToPid(
      OrderNum: string; OrderDt: TDateTime): string;

    class function InitAppx5Rec: TAppx5Rec;
    class function Appx5RecIsInited(Rec: TAppx5Rec): boolean;

    procedure WriteToAppx5Cds(Appx5Rec: TAppx5Rec);
  end;

implementation

uses
  SysUtils, ReportSpov, ProgressStage,
  Appx5AssignsStage, Appx5DismissStage, Appx5AllowsStage, Appx5PregnsStage,
  CdsLib, DsLib, QryLib, TblLib;

//------------------------------------------------------------------------------
procedure TAppx5Stage.Start(ProgressState: IProgressState);
begin
  InitData;

  inherited Start(ProgressState);

  StoreToAppx5Tbl;

  FreeData;
end;

//------------------------------------------------------------------------------
procedure TAppx5Stage.InitData;
var
  Date: TDateTime;
begin
  // Финальная таблица
  Appx5Tbl := SpovReport.CreateTable;

  with Appx5Tbl do begin
    TableName := Appx5FileName;

    if not TblUtils.CreateDbfFromTmpl(Appx5Tbl, Appx5TmplName) then
      exit;

    Open;
  end;

  // Промежуточное хранение и обработка
  Appx5Cds := CreateAppx5Cds;

  with Appx5Cds do begin
    IndexDefs.Add('Primary', 'NUMIDENT', [ixPrimary]);
    IndexName := 'Primary';
  end;

  RecCds := CreateAppx5Cds;

  // Запросы
  QryMain := TQuery.Create(nil);
  QryPeekPosition := TQuery.Create(nil);
  QryPeekDismisReason := TQuery.Create(nil);

  // Отчётный период
  with SpovReport, DateUtils do begin
    // Date := EncodeDate(Year, FirstMnthOfQuart(Quart), 1);
    // ReportPeriod := InitPeriod(Date, EndOfMonth(NextMonth(Date, 2)));
    // С 1.1.2025 - помесячно
    Date := EncodeDate(Year, Mnth, 1);
    ReportPeriod := InitPeriod(Date, EndOfMonth(Date));
  end;
end;

//------------------------------------------------------------------------------
// Промежуточный набор данных для надбавок. Заполняется для сотрудника
// индивидуально. Нужен для ускорения поиска перебором в связи с невозможностью
// правильно реализовать Locate.
//------------------------------------------------------------------------------
function TAppx5Stage.CreateAppx5Cds: TClientDataSet;
begin
  Result := TClientDataSet.Create(nil);
  CdsUtils.CreateCdsA(Appx5Tbl, Result);
end;

//------------------------------------------------------------------------------
procedure TAppx5Stage.StoreToAppx5Tbl;
begin
  with Appx5Cds do begin
    First;

    while not Eof do
      with Appx5Tbl do begin
        Append;
        DsUtils.MoveRecord(Appx5Cds, Appx5Tbl);
        Post;
      end;
      // Next не делаем, потому что MoveRecord.
  end;
  
  Appx5Tbl.Close;
end;

//------------------------------------------------------------------------------
procedure TAppx5Stage.FreeData;
begin
  Appx5Tbl.Free;

  QryMain.Free;
  QryPeekPosition.Free;
  QryPeekDismisReason.Free;

  Appx5Cds.Free;
  RecCds.Free;
end;

//------------------------------------------------------------------------------
function TAppx5Stage.StageName: ShortString;
begin
  Result := 'Формирование Приложения 5.';
end;

//------------------------------------------------------------------------------
function TAppx5Stage.StageItemsTotal: integer;
begin
  Result := 4;
end;

//------------------------------------------------------------------------------
procedure TAppx5Stage.Process;
var
  Stage: TProgressStage;
begin
  case CurStageIndx of
  0:
    Stage := TAppx5AssignsStage.Create(Self);
  1:
    Stage := TAppx5DismissStage.Create(Self);
  2:
    Stage := TAppx5AllowsStage.Create(Self);
  else
    Stage := TAppx5PregnsStage.Create(Self);
  end;

  Stage.Start(ProgressState);
  Stage.Free;

  inherited Process;
end;

//------------------------------------------------------------------------------
class function TAppx5Stage.InitAppx5Rec: TAppx5Rec;
begin
  Result.PERIOD_M   := 0;
  Result.PERIOD_Y   := 0;
  Result.UKR_GROMAD := 1;
  Result.ZO         := 0;
  Result.DOG_CPH    := 0;

  Result.NUMIDENT := '';
  Result.LN       := '';
  Result.NM       := '';
  Result.FTN      := '';

  Result.START_DT := 0;
  Result.END_DT   := 0;

  Result.PID_ZV := '';
  Result.PNR    := '';
  Result.PROF   := '';
  Result.POS    := '';
  Result.PID    := '';

  Result.VS  := 0;
  Result.PIR := 0;
end;

//------------------------------------------------------------------------------
// Возвращает значения для записей таблицы 5 из заданного набора данных
//------------------------------------------------------------------------------
class procedure TAppx5Stage.FillFromPersInfo(
  UpiDs: TDataSet;
  var Appx5Rec: TAppx5Rec);
begin
  with UpiDs, Appx5Rec do begin
    NUMIDENT := FieldByName('ID').AsString;

    LN := AnsiUpperCase(Trim(FieldByName('Fam').AsString));
    NM := AnsiUpperCase(Trim(FieldByName('Ima').AsString));
    FTN := AnsiUpperCase(Trim(FieldByName('Otch').AsString));

    if FieldByName('UkrCitiz').AsString = 'Y' then
      UKR_GROMAD := 1
    else
      UKR_GROMAD := 0;
  end;
end; {PopulateT5UPI}

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure TAppx5Stage.FillZoFromAssign(
  AssignRec: TDataSet;
  var Appx5Rec: TAppx5Rec);
begin
  with AssignRec, Appx5Rec do
    if FieldByName('KdKatP').AsInteger = 13 then begin
      ZO := T5_ZO_CPH;
      DOG_CPH := 1;
    end else if FieldByName('Sovm').AsInteger = 0 then
      ZO := T5_ZO_FULL_TIME
    else
      ZO := T5_ZO_PART_TIME;
end;

//------------------------------------------------------------------------------
// Определяем основание увольнения
//------------------------------------------------------------------------------
procedure TAppx5Stage.FillPosition(
  PositionId: integer;
  var Appx5Rec: TAppx5Rec);
begin
  with QryPeekPosition, Appx5Rec do begin
    if QryUtils.PeekPosition(QryPeekPosition, PositionId, true) then begin
      PNR := FieldByName('NameFull').AsString;
      PNR := AnsiUpperCase(Copy(PNR, 1, 1)) + Copy(PNR, 2, Length(PNR) - 1);

      PROF := FieldByName('Code').AsString;

      POS := FieldByName('NameOK').AsString;
      POS := AnsiUpperCase(Copy(POS, 1, 1)) + Copy(POS, 2, Length(POS) - 1);
    end;

    Close;
  end;
end; {FillPosition}

//------------------------------------------------------------------------------
class procedure TAppx5Stage.FillDismisReason(
  Query: TQuery;
  DismisReasonId: integer;
  var Appx5Rec: TAppx5Rec
);
begin
  with Query, Appx5Rec do begin
    if QryUtils.PeekDismisReason(Query, DismisReasonId, false) then
      PID_ZV := FieldByName('Reasons').AsString
    else
      PID_ZV := 'Інша';

    Close;
  end;
end;

//------------------------------------------------------------------------------
class function TAppx5Stage.OrderToPid(
  OrderNum: string;
  OrderDt: TDateTime): string;
begin
  Result := Trim(OrderNum);

  if (Result <> '') and (OrderDt > 0) then
    Result := Trim(Result + ' від ' + DateToStr(OrderDt));
end;

//------------------------------------------------------------------------------
class function TAppx5Stage.Appx5RecIsInited(Rec: TAppx5Rec): boolean;
begin
  Result := Length(Rec.NUMIDENT) = 0;
end;

//------------------------------------------------------------------------------
// Запись в набор данных 5.
//------------------------------------------------------------------------------
procedure TAppx5Stage.WriteToAppx5Cds(Appx5Rec: TAppx5Rec);
begin
  if FindRecord(Appx5Rec) then
    exit;

  with Appx5Rec, Appx5Cds do begin
    Append;

    FieldByName('PERIOD_M').AsInteger   := PERIOD_M;
    FieldByName('PERIOD_Y').AsInteger   := PERIOD_Y;
    FieldByName('UKR_GROMAD').AsInteger := UKR_GROMAD;
    FieldByName('ZO').AsInteger         := ZO;
    FieldByName('DOG_CPH').AsInteger    := DOG_CPH;
    FieldByName('NUMIDENT').AsString    := NUMIDENT;
    FieldByName('LN').AsString          := LN;
    FieldByName('NM').AsString          := NM;
    FieldByName('FTN').AsString         := FTN;

    if START_DT <> 0 then
      FieldByName('START_DT').AsDateTime := START_DT;

    if END_DT <> 0 then
      FieldByName('END_DT').AsDateTime := END_DT;

    FieldByName('PID_ZV').AsString := PID_ZV;
    FieldByName('PNR').AsString    := PNR;
    FieldByName('PROF').AsString   := PROF;
    FieldByName('POS').AsString    := POS;

    if FieldByName('PID').AsString = '' then
      FieldByName('PID').AsString := PID
    else
      FieldByName('PID').AsString := FieldByName('PID').AsString + ',' + PID;

    FieldByName('VS').AsInteger  := VS;
    FieldByName('PIR').AsInteger := PIR;

    Post;
  end;
end;

//------------------------------------------------------------------------------
function TAppx5Stage.FindRecord(Appx5Rec: TAppx5Rec): Boolean;
begin
  Result := false;

  with Appx5Rec, Appx5Cds do begin
    if not Appx5Cds.Locate('NUMIDENT', NUMIDENT, []) then
      exit;

    // Создаём копию для сравнения.
    CopyRecToRecCds(Appx5Rec);

    while not Eof and (FieldByName('NUMIDENT').AsString = NUMIDENT) do begin
      // Сравниваем.
      Result := DsUtils.RecordsAreEqual(RecCds, Appx5Cds);

      if Result then
        break;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Post не делаем, т.к., это - просто буфер.
//------------------------------------------------------------------------------
procedure TAppx5Stage.CopyRecToRecCds(Appx5Rec: TAppx5Rec);
begin
  with Appx5Rec, RecCds do begin
    if RecCds.RecordCount = 0 then
      Append;

    FieldByName('PERIOD_M').AsInteger   := PERIOD_M;
    FieldByName('PERIOD_Y').AsInteger   := PERIOD_Y;
    FieldByName('UKR_GROMAD').AsInteger := UKR_GROMAD;
    FieldByName('ZO').AsInteger         := ZO;
    FieldByName('DOG_CPH').AsInteger    := DOG_CPH;
    FieldByName('NUMIDENT').AsString    := NUMIDENT;
    FieldByName('LN').AsString          := LN;
    FieldByName('NM').AsString          := NM;
    FieldByName('FTN').AsString         := FTN;
    FieldByName('START_DT').AsDateTime  := START_DT;
    FieldByName('END_DT').AsDateTime    := END_DT;
    FieldByName('PID_ZV').AsString      := PID_ZV;
    FieldByName('PNR').AsString         := PNR;
    FieldByName('PROF').AsString        := PROF;
    FieldByName('POS').AsString         := POS;
    FieldByName('PID').AsString         := PID;
    FieldByName('VS').AsInteger         := VS;
    FieldByName('PIR').AsInteger        := PIR;
  end;
end;

end.
