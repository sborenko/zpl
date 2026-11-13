unit Appx5AllowsStage;

interface

uses
  Db, DbClient, DbTables, Appx5Stage, Appx5ChildStage, IFaceProgressState,
  DateLib;

type
  TAppx5AllowsStage = class(TAppx5ChildStage)
  private
    // Для вспомогательных операций
    QryCmn: TQuery;

    // Препроцесс записей Приложения 5
    CdsSpov: TClientDataSet;

    procedure OpenNadbQry;
    procedure CreateSpovCds;

    function ReadNadb: TAppx5Rec;
    procedure FillZO(var CurRec: TAppx5Rec);
    procedure FillSovm(var CurRec: TAppx5Rec);
    procedure FillPrmUv(var CurRec: TAppx5Rec);

    procedure ProcessNadb;
    procedure ProcSovm(CurRec: TAppx5Rec);
    procedure ProcStandard(CurRec: TAppx5Rec);

    procedure AddSpovRec(CurRec: TAppx5Rec);
    procedure ReplaceSpovRec(CurRec: TAppx5Rec);
    procedure CopySpovRec(CurRec: TAppx5Rec);

    procedure CancelTerm;

    function SpovCanMerge(CurRec: TAppx5Rec): Boolean;
    procedure MergeSpovRec(CurRec: TAppx5Rec);

    class function NadbIsCph(VidN: ShortString): boolean;
    class function NadbIsSovm(VidN: ShortString): boolean;

    procedure SaveEmplResults;
    procedure SaveSpovRec;

  protected
    procedure InitData; override;
    procedure FreeData; override;

  public
    procedure Start(ProgressState: IProgressState); override;
    procedure Process; override;
  end;

implementation

uses
  SysUtils, ReportSpov, CdsLib, DsLib, QryLib;

//------------------------------------------------------------------------------
// Запускаем обработку надбавок для Приложения 5
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.Start(ProgressState: IProgressState);
begin
  // Назначаем процедуру, которая выполнится по завершении обработки одного
  // сотрудника
  GroupResProc := SaveEmplResults;

  // Запускаем цикл обработки всех сотрудников
  inherited Start(ProgressState);
end;

//------------------------------------------------------------------------------
// Подготовка наборов данных
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.InitData;
begin
  _StageName :='Обработка надбавок.';

  // В основном запросе открытываем надбавки всех сотрудников
  OpenNadbQry;

  // Создаём Cds для записи и обработки надбавок одного сотрудника
  CreateSpovCds;

  QryCmn := TQuery.Create(nil);
end;

//------------------------------------------------------------------------------
// Освобождение наборов данных
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.FreeData;
begin
  // Освобождаем наборы
  CdsSpov.Free;
  QryCmn.Free;

  // Освобождаем основной запрос
  inherited FreeData;
end;

//------------------------------------------------------------------------------
// Обработка надбавки
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.Process;
begin
  // Обработка одной надбавки
  ProcessNadb;
  Appx5.QryMain.Next;

  // Увеличиваем счётчик обработанных записей
  inherited Process;
  // Показываем прогресс
  ProgressState.UpdateStageProgress;
end;

//------------------------------------------------------------------------------
// Выборка надбавок для Приложения 5 СПОВ.
// В выборку попали все действущие надбавки: и те, которые попадают "концами"
// в отчётный период, и те, которые просто действуют: начались до начала и
// не закончились к началу отчётного месяца. Те которые просто действуют могут
// стать активными и попасть в СПОВ в том случае если какая-то из "конечных"
// закончилась, а никакая другая сразу не началась. В этом случае "действующая"
// станет активной.
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.OpenNadbQry;
begin
  with Appx5, QryUtils do begin
    InitQuery(QryMain);

    with QryMain do begin
      SQL.Text :=
        'select distinct ' +
          'n.TabN, n.VidN, n.Dt_Beg, n.Dt_End, ' +
          'u.Fam, u.Ima, u.Otch, u.ID, u.UkrCitiz, ' +
          'n.NrPrBeg, n.DtPrBeg, n.NrPrEnd, n.DtPrEnd, n.Kd_Dlzhn, ' +
          'n.Kd_Sovm, n.Is_Pere, n.Spov_Merge ' +
        'from ' +
          'z_Nadb n ' +
          'left join z_Upi u on u.TabN = n.TabN ' +
        'where ' +
          '(' +
            '(' +
              // надбавки которые начались до оконч отч. периода
              'n.Dt_Beg <= :PeriodEnd ' +

              'and (' +
                // совместительские - все
                'n.VidN in ("1608","1609","1619","1640") ' +
                  'and n.Is_Pere = "Y" ' +

                // остальные - не закончившиеся до начала отчётного периода
                'or (' +
                  'n.Dt_End >= :PeriodBeg ' +
                  'or n.Dt_End is null' +
                ')' +
                'and (' +
                  // хоз.прав.договоры
                  'n.VidN in ("1005","1006","1008") ' +
                  // уход за детьми
                  'or n.VidN in ("5011","5012")' +
                ')' +
              ')' +
            ') ' +

            // совместительские "переводы" следующего периода
            'or n.VidN in ("1608","1609","1619","1640") ' +
              'and n.Is_Pere = "Y" ' +
              'and n.Spov_Merge = "Y" ' +
              'and n.Dt_Beg > :PeriodEnd' +
          ') ';

      // Если обрабатываем не всё предприятие а только указанные Таб.№
      if Length(SpovReport.EmplIds) > 0 then
        SQL.Add(
          'and n.TabN in (' + SpovReport.EmplIds + ') ');

      SQL.Add(
        'order by n.TabN, n.Dt_Beg, n.Nr');

      ParamByName('PeriodBeg').AsDateTime := ReportPeriod.Start;
      ParamByName('PeriodEnd').AsDateTime := ReportPeriod.Finish;

      Open;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Создание промежуточного CDS для формирования результирующих записей по
// одному сотруднику
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.CreateSpovCds;
begin
  // Cds создаём, копируя структуру финального Appx5Cds
  CdsSpov := CdsUtils.CreateCds(Appx5.Appx5Cds);

  with CdsSpov do begin
    with IndexDefs.AddIndexDef do begin
      Name := 'Primary';
      Fields := 'ZO;START_DT;END_DT';
      DescFields := 'START_DT;END_DT';
      Options := [ixPrimary];
    end;

    IndexName := 'Primary';
  end;
end;

//------------------------------------------------------------------------------
// В таблицу 5 собрать начавшиеся или закончившиеся
// в отчётном месяце ПсевдоНадбавки по трудовым соглашениям:
// ГПД (1005, 1006, 1008)
// Совместительские (1608, 1609, 1619, 1640)
// Отпуска по уходу за ребёнком (5011, 5012)
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.ProcessNadb;
var
  CurRec: TAppx5Rec;
begin
  CurRec := ReadNadb;

  // Ищем только по ZO
  if not CdsSpov.FindKey([CurRec.ZO]) then
    // Сохраняем как стартовую
    AddSpovRec(CurRec)
  else
    case CurRec.ZO of
      T5_ZO_PART_TIME:
        ProcSovm(CurRec);
      T5_ZO_CPH,
      T5_ZO_CHILD_CARE_3Y,
      T5_ZO_CHILD_CARE_6Y:
        ProcStandard(CurRec);
    end;
end;

//------------------------------------------------------------------------------
// Обработка совместительских надбавок
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.ProcSovm(CurRec: TAppx5Rec);
begin
  with CdsSpov, CurRec do begin
    if PIR = 1 then begin
      // Пришла "переводная" запись

      if POS <> FieldByName('POS').AsString then begin
        // Изменилась должность

        if DateUtils.EventIsInPeriod(
          FieldByName('START_DT').AsDateTime, Appx5.ReportPeriod)
        then begin
          // текущая является "приёмной" этого месяца:
          // отменяем её окончание
          CancelTerm;
          // добавляем "переводную"
          AddSpovRec(CurRec);
        end else
          // текущая не является "приёмной"
          // заменяем её целиком, чтобы не попала в СПОВ
          ReplaceSpovRec(CurRec);
      end else
        // Должность не изменилась
        // отменяем окончание текущей
        CancelTerm;

    end else
      // Пришла не "переводная", пытаемся объединить с текущей
      // или добавляем
      ProcStandard(CurRec);
  end;
end;

//------------------------------------------------------------------------------
// Либо сливаем, либо добавляем
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.ProcStandard(CurRec: TAppx5Rec);
begin
  if SpovCanMerge(CurRec) then
    MergeSpovRec(CurRec)
  else
    AddSpovRec(CurRec);
end;

//------------------------------------------------------------------------------
// Проверка смежности периодов
//------------------------------------------------------------------------------
function TAppx5AllowsStage.SpovCanMerge(CurRec: TAppx5Rec): Boolean;
var
  Span, Span2: TPeriod;
begin
  with CdsSpov do begin
    with Span do begin
      Start := FieldByName('START_DT').AsDateTime;
      Finish := FieldByName('END_DT').AsDateTime;
    end;

    with CurRec, Span2 do begin
      Start := START_DT;
      Finish := END_DT;
    end;

    Result := DateUtils.PeriodsAreIntersected(Span, Span2);
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.AddSpovRec(CurRec: TAppx5Rec);
begin
  with CdsSpov do begin
    Append;
    CopySpovRec(CurRec);
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.ReplaceSpovRec(CurRec: TAppx5Rec);
begin
  with CdsSpov do begin
    Edit;
    CopySpovRec(CurRec);
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.CopySpovRec(CurRec: TAppx5Rec);
begin
  with CdsSpov, CurRec do begin
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
      FieldByName('END_DT').AsDateTime   := END_DT;

    FieldByName('PID_ZV').AsString      := PID_ZV;
    FieldByName('PNR').AsString         := PNR;
    FieldByName('PROF').AsString        := PROF;
    FieldByName('POS').AsString         := POS;
    FieldByName('PID').AsString         := PID;
    FieldByName('VS').AsInteger         := VS;
    FieldByName('PIR').AsInteger        := PIR;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.CancelTerm;
begin
  with CdsSpov do begin
    Edit;
    FieldByName('END_DT').AsDateTime := 0;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.MergeSpovRec(CurRec: TAppx5Rec);
var
  Span, Span2: TPeriod;
begin
  with CdsSpov, CurRec, DateUtils do begin
    Span.Start := FieldByName('START_DT').AsDateTime;
    Span.Finish := FieldByName('END_DT').AsDateTime;

    Span2.Start := START_DT;
    Span2.Finish := END_DT;

    Span := JoinPeriods(Span, Span2);

    Edit;
    FieldByName('START_DT').AsDateTime := Span.Start;
    FieldByName('END_DT').AsDateTime := Span.Finish;
    Post;
  end;
end;

//------------------------------------------------------------------------------
function TAppx5AllowsStage.ReadNadb: TAppx5Rec;
var
  DumWord: word;
begin
  with Appx5, QryMain do begin
    Result := InitAppx5Rec;

    // Заполняем NUMIDENT, FamImOtch.
    FillFromPersInfo(QryMain, Result);

    with Result do begin
      // Заполняем отчётные месяц и год.
      DecodeDate(ReportPeriod.Start, PERIOD_Y, PERIOD_M, DumWord);
      START_DT := FieldByName('Dt_Beg').AsDateTime;
      END_DT := FieldByName('Dt_End').AsDateTime;

      FillZO(Result);
      FillSovm(Result);
      FillPrmUv(Result);

      // Должность и признак перевода указывается только в совместительских
      // надбавках
      if ZO = T5_ZO_PART_TIME then begin
        // должность
        FillPosition(FieldByName('Kd_Dlzhn').AsInteger, Result);

        // признак перевода
        if FieldByName('Spov_Merge').AsString = 'Y' then
          PIR := 1;
      end
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.FillZO(var CurRec: TAppx5Rec);
var
  AllowType: ShortString;
begin
  with Appx5.QryMain, CurRec do begin
    AllowType := FieldByName('VidN').AsString;

    if NadbIsCph(AllowType) then begin
      ZO := T5_ZO_CPH;
      DOG_CPH := 1;
    end else if NadbIsSovm(AllowType) then
      ZO := T5_ZO_PART_TIME
    else if AllowType = PAY_TYPE_CHILD_3Y then
      ZO := T5_ZO_CHILD_CARE_3Y
    else if AllowType = PAY_TYPE_CHILD_6Y then
      ZO := T5_ZO_CHILD_CARE_6Y
    else
      ZO := T5_ZO_FULL_TIME;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.FillSovm(var CurRec: TAppx5Rec);
begin
  if Appx5.QryMain.FieldByName('Kd_Sovm').AsInteger = EMPL_TYPE_INNER_SUPPLMNT
  then
    CurRec.VS := 1;
end;

//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.FillPrmUv(var CurRec: TAppx5Rec);
var
  Date: TDateTime;
  HireReason: ShortString;
  DismissId: Integer;
begin
  with Appx5, QryMain, CurRec do begin
    // Используем как "приёмное" и, если понадобится - как "увольнительное"
    // для поля PID
    HireReason := OrderToPid(
      FieldByName('NrPrBeg').AsString, FieldByName('DtPrBeg').AsDateTime);

    Date := FieldByName('Dt_Beg').AsDateTime;

    if (Date <> 0) and DateUtils.EventIsInPeriod(Date, ReportPeriod) then begin
      START_DT := Date;

      PID := HireReason;
    end;

    Date := FieldByName('Dt_End').AsDateTime;

    if (Date <> 0) and DateUtils.EventIsInPeriod(Date, ReportPeriod) then begin
      END_DT := Date;

      // PID:
      // Поскольку - увольнение, ставим "увольнительное" основание
      PID := OrderToPid(
        FieldByName('NrPrEnd').AsString, FieldByName('DtPrEnd').AsDateTime);

      // Если "увольнительное" не нашли возьмём "приёмное"
      if PID = '' then
        PID := HireReason;

      // Теперь - PID_ZV:
      // Получаем стандартное из базы из таблицы z_PidZviln
      case ZO of
        T5_ZO_CPH: begin
          DismissId := DISMISS_REASON_CPH;

          // "Лепим горбатого" для идентичности со старым отчётом
          PID := HireReason;
        end;
        T5_ZO_PART_TIME:
          DismissId := DISMISS_REASON_PART_TIME;
        else
          DismissId := 0;
      end;

      FillDismisReason(QryCmn, DismissId, CurRec);
    end;
  end;
end;

//------------------------------------------------------------------------------
// Хоз.-прав. договоры
//------------------------------------------------------------------------------
class function TAppx5AllowsStage.NadbIsCPH(VidN: ShortString): Boolean;
begin
  Result := (VidN = '1005') or (VidN = '1006') or (VidN = '1008');
end;

//------------------------------------------------------------------------------
// Совместители
//------------------------------------------------------------------------------
class function TAppx5AllowsStage.NadbIsSovm(VidN: ShortString): Boolean;
begin
  Result := (VidN = '1608') or (VidN = '1609')
    or (VidN = '1619') or (VidN = '1640');
end;

//------------------------------------------------------------------------------
// Callback для записи сформированных результатов по сотруднику в финальный
// CDS Приложения 5
//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.SaveEmplResults;
begin
  with CdsSpov, Appx5, DateUtils do begin
    First;

    // Сохраняем записи
    while not Eof do begin
      if not EventIsInPeriod(
        FieldByName('START_DT').AsDateTime, ReportPeriod) then
      begin
        Edit;
        FieldByName('START_DT').AsString := '';
        Post;
      end;

      if not EventIsInPeriod(
        FieldByName('END_DT').AsDateTime, ReportPeriod) then
      begin
        Edit;
        FieldByName('END_DT').AsString := '';
        Post;
      end;

      if (FieldByName('START_DT').AsDateTime <> 0)
        or (FieldByName('END_DT').AsDateTime <> 0)
      then
        SaveSpovRec;

      Next;
    end;

    EmptyDataSet;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx5AllowsStage.SaveSpovRec;
begin
  with Appx5.Appx5Cds do begin
    Append;
    DsUtils.CopyRecord(CdsSpov, Appx5.Appx5Cds);
    Post;
  end;
end;

end.

