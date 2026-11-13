unit CalcBy12Mnth;

// Назначения полей таблицы z_RBln:
//  SmZarabotka - основные суммы
//  SmVZachet_Svm - совместительские
//  SmVZachet_Cmn - итог: осн. + совм.

// Правило учёта дней при расчёте (по видам):
// Если время не оплачено по уважительной (не зависящей от сотр.)
// причине, дни не считаются, так как дни без суммы уменьшают средне-дневную
// сумму. Если причина неуважительная, дни считаются и уменьшают средне-дневную.
// 5002 - невыясненая причина: считать
// 5005 - отпуск без оплаты: не считать
// 5006 - отстранён за что-то: считать
// 5009 - война: не считать
// 5010 - война: не считать

interface

uses
  Db, DbTables, DateLib;

type
  TDayHandler =
    procedure (NuRow: TDataSet; Field: TField) of object;

  TCalc12Mnth = class
  private
    class function ShouldUseMnth(Mnth, SickListDt: TDateTime): Boolean;

    class procedure AddMnthDay(Date: TDateTime);

    class procedure SetPay(NuRow: TDataSet; Field: TField);
    class procedure LockPay(NuRow: TDataSet; Field: TField);
    class procedure UnlockPay(NuRow: TDataSet; Field: TField);
  public
    class procedure FillQryRBlnBy12Mes(DsVBln: TDataSet; QryRBln: TQuery;
      TwelveMnthPeriod: TPeriod; ParamOwnListsOnly: boolean;
      var FoxFilter: boolean
    );

    class function PmntIsEssential(NuRow: TDataSet): boolean;

    class procedure CreOpenQryNu(Period: TPeriod);
    class procedure CreateCdsDays;
    class procedure InitCdsByCalendDays(MnthBeg: TDateTime);
    class procedure InitCdsByWorkDays(MnthBeg: TDateTime);
    class procedure ProcessCdsDays(NuRow: TDataSet);

    class function Get12MnthPeriod(
      EmplId: integer; AsOfDate: TDateTime
    ): TPeriod;

    class procedure AddNoPayVidN(NoPayFieldName, VidN: ShortString);
    class function DeleteNoPayVidN(NoPayFieldName, VidN: ShortString): boolean;

    class procedure AddToRBln(VBln, RBln: TDataSet; Mnth: TDateTime;
      FullTimeSum, PartTimeSum: double; FullTimeDays, PartTimeDays: integer
    );
  end;

implementation

uses
  a_Const, DbClient, Math, CalendLib, QryLib, SalaryLib, TextUtils, VidNUtils,
  z_Dm;

const
  NO_PAY_FIELD_SUFFIX = 'VidN';

var
  TabN: integer;
  OwnListsOnly: boolean;
  QryNu: TQuery;
  CdsDays: TClientDataSet;

//------------------------------------------------------------------------------
// Заполнение RBln при способе расчёта по 12 мес.
//------------------------------------------------------------------------------
class procedure TCalc12Mnth.FillQryRBlnBy12Mes(
  DsVBln: TDataSet;
  QryRBln: TQuery;
  TwelveMnthPeriod: TPeriod;
  ParamOwnListsOnly: boolean;
  var FoxFilter: boolean);
var
  SpecNr: integer;
  MnthYear: TDateTime;
  PayType: ShortString;
  FullTimeDays, PartTimeDays: integer;
  FullTimeSum, PartTimeSum: double;
  FullTime: boolean;
  UseMnthForCalc: Boolean;
begin
  OwnListsOnly := ParamOwnListsOnly;

  with DsVBln do begin
    TabN := FieldByName('TabN').AsInteger;
    SpecNr := FieldByName('Spec_Nr').AsInteger;
  end;

  // Загружаем старый расчёт
  InitQuery(QryRBln);

  with QryRBln, QryUtils do begin
    SQL.Add(
      'select r.*, Cast(-1 As SmallInt) As MyFoxFld ' +
      'from Z_RBln r ' +
      'where r.Spec_NR = :SpecNR'
    );
    ParamByName('SpecNR').AsInteger := SpecNR;
    Open;

    Filter := 'MyFoxFld <> -1';
    Filtered := true;
    FoxFilter := true;
  end;

  // Формируем новый расчёт
  CreOpenQryNU(TwelveMnthPeriod);

  CreateCdsDays;

  with QryNu do begin
    while not Eof do begin
      MnthYear := FieldByName('ZaMesGod').AsDateTime;

      // Определяем, будет ли месяц учитываться в расчёте среднедневной
      // суммы. Месяц учитывается, если имеется хотя бы один реально
      // отработанный день. Фактически - если имеется хотя бы один день,
      // за который есть начисленная сумма.
      UseMnthForCalc :=
        ShouldUseMnth(MnthYear, DsVBln.FieldByName('DtProc').AsDateTime);

      if UseMnthForCalc then
        // Инициализируем и заполняем в TblDM календарными днями месяца.
        InitCdsByCalendDays(MnthYear);

      // Инициализируем итоговые суммы.
      FullTimeSum := 0;
      PartTimeSum := 0;

      // Накапливаем суммы.
      while (FieldByName('ZaMesGod').AsDateTime = MnthYear) and not Eof do begin
        // Перебираем все записи неиспользуемого месяца
        if not UseMnthForCalc then begin
          Next;
          continue;
        end;

        PayType := FieldByName('VidN').AsString;
        FullTime := (FieldByName('Sovm').AsString <> '1')
          and (FieldByName('Nu_Sovm').AsString <> '1')
          and (FieldByName('Nu_Sovm').AsString <> 'Y');

        // СмВида включ. в СмДляБлн
        if PmntIsEssential(QryNu) then begin
          if FieldByName('DtProc').AsDateTime <=
            DsVBln.FieldByName('DtProc').AsDateTime
          then
            if FullTime then
              FullTimeSum := FullTimeSum + FieldByName('Summa').AsFloat
            else
              PartTimeSum := PartTimeSum + FieldByName('Summa').AsFloat;
        end;

        // Пропускаем неинтересующие.
        if FieldByName('Dt_Beg').IsNull or FieldByName('Dt_End').IsNull
            or (PayType = '2406') or (PayType = '2411') {неисп.отпуска}
            or (PayType = '5007') {НеполнРабДн} then begin
          Next;
          continue;
        end;

        // Накладываем запись нач./удерж. на дни месяца
        // для определения реально отработанных дней
        if FieldByName('DtProc').AsDateTime <=
          DsVBln.FieldByName('DtProc').AsDateTime
        then
          ProcessCdsDays(QryNu);

        Next;
      end; {while}

      // Считаем дни, которые пойдут в зачёт
      FullTimeDays := 0;
      PartTimeDays := 0;

      with CdsDays do begin
        First;

        while not Eof do begin
          if FieldByName('NoPayFullTime').AsInteger > 0 then
            FullTimeDays := FullTimeDays + 1;

          if FieldByName('NoPayPartTime').AsInteger > 0 then
            PartTimeDays := PartTimeDays + 1;

          Next;
        end;
      end;

      // Добавляем данные за месяц.
      AddToRBln(DsVBln, QryRBln,
        MnthYear, FullTimeSum, PartTimeSum, FullTimeDays, PartTimeDays);
    end;

    Free;
  end;

  CdsDays.Free;

  QryRBln.First;
  QryRBln.EnableControls;
end;

//------------------------------------------------------------------------------
class procedure TCalc12Mnth.ProcessCdsDays(NuRow: TDataSet);
var
  Action: TVidAffects;
  Date, LastDate: TDateTime;
  VidN: ShortString;
  PartTime: boolean;
  DayHandler: TDayHandler;
begin
  with NuRow do begin
    VidN := FieldByName('VidN').AsString;

    if PmntIsEssential(NuRow) then
      DayHandler := SetPay
    else if (VidN >= '2600') and (VidN < '2700') {больничные} then
      DayHandler := LockPay
    else if (VidN >= '5000') and (VidN < '5100') {неоплач.}
      // SB 3.9.2025 наверное, 5007 - 'Неполный рабочий день' исключить. Иначе,
      // не включает, например, Таб.№ 11022 сентябрь 2024 в месяц для расчёта
      // больничного
      and (VidN <> '5007')
    then
      if (FieldByName('Storn').AsString = 'Y')
          or (FieldByName('Notes').AsString = 'Сторн') then
        DayHandler := UnlockPay
      else
        DayHandler := LockPay
    else
      DayHandler := nil;

    PartTime := (FieldByName('Sovm').AsString = '1')
      or (FieldByName('Nu_Sovm').AsString = '1')
      or (FieldByName('Nu_Sovm').AsString = 'Y');
    Action := TVidNUtils.VidNoPayAffects(VidN, PartTime);

    Date := FieldByName('Dt_Beg').AsDateTime;
    LastDate := FieldByName('Dt_End').AsDateTime;
  end;

  if Assigned(DayHandler) then
    with CdsDays do
      while Date <= LastDate do begin
        if Locate('Date', Date, []) then begin
          Edit;

          if Action in [VID_FULL_TIME, VID_BOTH] then
            DayHandler(NuRow, FieldByName('NoPayFullTime'));

          if Action in [VID_PART_TIME, VID_BOTH] then
            DayHandler(NuRow, FieldByName('NoPayPartTime'));

          Post;
        end;

        Date := Date + 1;
      end;

  if bFlagDbg then
    CdsDays.SaveToFile('CdsDays.cds');
end;

//------------------------------------------------------------------------------
class function TCalc12Mnth.PmntIsEssential(NuRow: TDataSet): boolean;
var
  VidN: ShortString;
begin
  with NuRow do begin
    VidN := FieldByName('VidN').AsString;

    Result := (FieldByName('Bln').AsString = '1')
      or (VidN = '1206') {командировка}
      or (VidN >= '2400') and (VidN < '2500') {отпускные};
  end;
end;

//------------------------------------------------------------------------------
// Установить признак оплачиваемого дня
//------------------------------------------------------------------------------
class procedure TCalc12Mnth.SetPay(NuRow: TDataSet; Field: TField);
begin
  Field.AsInteger := 1;
end;

//------------------------------------------------------------------------------
// Заблокировать оплачиваемость дня
//------------------------------------------------------------------------------
class procedure TCalc12Mnth.LockPay(NuRow: TDataSet; Field: TField);
begin
  if Field.AsInteger <> 0 then begin
    Field.AsInteger := -1;

    AddNoPayVidN(Field.FieldName, NuRow.FieldByName('VidN').AsString);
  end;
end; {LockPay}

//------------------------------------------------------------------------------
// Разблокировать оплачиваемость дня
//------------------------------------------------------------------------------
class procedure TCalc12Mnth.UnlockPay(NuRow: TDataSet; Field: TField);
var
  FieldName: ShortString;
begin
  FieldName := Field.FieldName;

  if DeleteNoPayVidN(FieldName, NuRow.FieldByName('VidN').AsString) then
    CdsDays.FieldByName(FieldName).AsInteger := 1;
end; {UnlockPay}

//------------------------------------------------------------------------------
// Определить фактический период для 12-мес. расчёта
//------------------------------------------------------------------------------
class function TCalc12Mnth.Get12MnthPeriod(
  EmplId: integer;
  AsOfDate: TDateTime): TPeriod;
const
  STRICT_PERIOD = false;
var
  Qry: TQuery;
  EmplPeriod, FirstMnthPeriod, FullMnthPeriod: TPeriod;
  WorkDays: Integer;
begin
  // Актуальное перемещение на AsOfDate
  Qry := TQuery.Create(nil);
  QryUtils.InitQuery(Qry);

  with DateUtils do begin
    SalaryUtils.SelectAssigns(
      Qry, EmplId, InitPeriod(AsOfDate, AsOfDate), STRICT_PERIOD);

    with Qry do
    if RecordCount = 0 then
      Result := CreateEmptyPeriod
    else begin
      // Период актуального приёма/увольнения
      EmplPeriod := InitPeriod(
        FieldByName('Dt_Priem').AsDateTime, FieldByName('Dt_Uvoln').AsDateTime);

      Result := InitPeriod(
        PrevMonth(AsOfDate, 12), EndOfMonth(PrevMonth(AsOfDate)));

      Result := IntersectPeriods(Result, EmplPeriod);

      // Определяем "рабочую полноту" первого месяца

      with Result do
      FirstMnthPeriod := InitPeriod(Start, EndOfMonth(Start));

      with FirstMnthPeriod do
      FullMnthPeriod := InitPeriod(BeginOfMonth(Start), Finish);

      // Если первый месяц периода - не полный рабочий месяц, что может
      // случиться, если приём на работу случился не с 1-го рабочего дня месяца,
      // опускаем его

      with FullMnthPeriod do
      WorkDays := Round(DmMain.CountWorkDays(Start, Finish));

      with FirstMnthPeriod do
      if Round(DmMain.CountWorkDays(Start, Finish)) <> WorkDays then
        // Результатом этой операции может стать пустой результитующий период,
        // если он состоял лишь из одного неполного месяца
        Result.Start := Finish + 1;

      // Тут можно, производить коррекцию, по согласованию с бухгалтерами:
      // например, если период пуст, возвращать неполный первый месяц,
      // проверять на полноту последний месяц, и возвращать неполный первый и
      // неполный последний, ...
      // Пока что возвращаем что есть
    end;
  end;

  Qry.Free;
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure TCalc12Mnth.AddToRBln(
  VBln, RBln: TDataSet;
  Mnth: TDateTime;
  FullTimeSum, PartTimeSum: double;
  FullTimeDays, PartTimeDays: integer);
begin
  with RBln do begin
    Append;

    FieldByName('KdSps').AsInteger := gl_nAppKdSpsUsr; //nKdSps;
    FieldByName('TabN').AsInteger := TabN;
    FieldByName('ZaMesGod').AsDateTime := Mnth;
    FieldByName('SmZarabotka').AsFloat := RoundTo(FullTimeSum, -2);

    FieldByName('Sm_Svm').AsFloat := RoundTo(PartTimeSum, -2);
    FieldByName('SmVZachet_Svm').AsFloat := FieldByName('Sm_Svm').AsFloat;
    FieldByName('SmVZachet_Cmn').AsFloat :=
      FieldByName('SmZarabotka').AsFloat +
      FieldByName('SmVZachet_Svm').AsFloat;

    // Добавил 27.11.2021 для печати расчётки больничного.
    // Без этого неправильно считается вычисляемое поле smZpKoef в qryRBln,
    // ну и дальше прёт.
    FieldByName('KoefZp').AsFloat := VBln.FieldByName('ProcOpl').AsFloat;

    FieldByName('CntDays').AsFloat := FullTimeDays;
    FieldByName('CntDays_Svm').AsFloat := PartTimeDays;

    Post;
  end; {with QryRBln}
end; {AddToRBln}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class procedure TCalc12Mnth.CreOpenQryNU(Period: TPeriod);
begin
  QryNu := TQuery.Create(nil);
  QryUtils.InitQuery(QryNu);

  with QryNu do begin
    SQL.Add(
      'select ' +
        'TabN, VidN, DtProc, Dt_Beg, Dt_End, ZaMesGod, ' +
        'Bln, Sovm, CBudg, Notes, ' +
        'case Storn ' +
          'when "" then null ' +
          'else storn ' +
        'end Storn, Nu_Sovm, ' +
        'Sum(Summa) Summa, Sum(Chas) Chas ' +
      'from ViNuMain n ' +
      'where TabN = :TabN and ZaMesGod >= :DtBegPerioda ' +
        'and ZaMesGod <= :DtEndPerioda and VidN < "6000"');

    if OwnListsOnly then // выбирать только по "своему" списку
      SQL.Add(
        'and n.KdSps = :KdSps ');

    SQL.Add(
      'group by TabN, VidN, DtProc, Dt_Beg, Dt_End, ZaMesGod, ' +
        'Bln, Sovm, CBudg, Notes, Storn, Nu_Sovm ');

    SQL.Add(
//      'order by n.ZaMesGod, n.DtProc, n.VidN, n.Dt_Beg, Storn');
      'order by n.ZaMesGod, n.VidN, n.Dt_Beg, n.DtProc, Storn');

    ParamByName('TabN').AsInteger := TabN;
    ParamByName('DtBegPerioda').AsDateTime := Period.Start;
    ParamByName('DtEndPerioda').AsDateTime := Period.Finish;

    if OwnListsOnly then
      ParamByName('KdSps').AsInteger := gl_nAppKdSpsUsr;

    SQL.SaveToFile('LoadNu.sql');

    Open;
  end; {with QryNu}
end; {OpenQryNU}

//------------------------------------------------------------------------------
class procedure TCalc12Mnth.CreateCdsDays;
begin
  CdsDays := TClientDataSet.Create(nil);

  with CdsDays do begin
    FieldDefs.Add('Date', ftDateTime);
    FieldDefs.Add('NoPayFullTime', ftInteger);
    FieldDefs.Add('NoPayPartTime', ftInteger);
    FieldDefs.Add('NoPayFullTime' + NO_PAY_FIELD_SUFFIX, ftString, 50);
    FieldDefs.Add('NoPayPartTime' + NO_PAY_FIELD_SUFFIX, ftString, 50);

    IndexDefs.Add('OnDate', 'Date', []);
    IndexName := 'OnDate';
    CreateDataSet;
  end;
end; {CreateCdsDays}

//------------------------------------------------------------------------------
class procedure TCalc12Mnth.InitCdsByCalendDays(MnthBeg: TDateTime);
var
  MnthEnd, Date: TDateTime;
begin
  with CdsDays do begin
    EmptyDataSet;
    Open;

    Date := MnthBeg;
    MnthEnd := DateUtils.EndOfMonth(MnthBeg);

    while Date <= MnthEnd do begin
      AddMnthDay(Date);

      Date := Date + 1;
    end;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Заполняем CdsDays рабочими днями месяца с учётом календаря E_Days
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class procedure TCalc12Mnth.InitCdsByWorkDays(MnthBeg: TDateTime);
var
  MnthEnd, Date: TDateTime;
begin
  with CdsDays, CalendUtils do begin
    EmptyDataSet;
    Open;

    SetCalendDataSet(DmMain.CdsEDays);

    Date := MnthBeg;
    MnthEnd := DateUtils.EndOfMonth(MnthBeg);

    while Date <= MnthEnd do begin
      if DayIsWorking(Date) then
        AddMnthDay(Date);

      Date := Date + 1;
    end;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Заполняем CdsDays всеми календарными днями
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class procedure TCalc12Mnth.AddMnthDay(Date: TDateTime);
begin
  with CdsDays do begin
    Append;
    FieldByName('Date').AsDateTime := Date;
    // Full-time по умолчанию считаем оплачиваемым.
    FieldByName('NoPayFullTime').AsInteger := 1;
    Post;
  end;
end;

//------------------------------------------------------------------------------
// При блокировании оплачиваемости дня, в поле с суфиксом накапливаем виды
// которые привели к блокировке
//------------------------------------------------------------------------------
class procedure TCalc12Mnth.AddNoPayVidN(
  NoPayFieldName,
  VidN: ShortString
);
begin
  NoPayFieldName := NoPayFieldName + NO_PAY_FIELD_SUFFIX;

  with CdsDays do
    if Pos(VidN, FieldByName(NoPayFieldName).AsString) = 0 then
      FieldByName(NoPayFieldName).AsString :=
        FieldByName(NoPayFieldName).AsString + VidN + ';';
end;

//------------------------------------------------------------------------------
// При разблокировании оплачиваемости дня, удаляем вид который привел к
// блокировке. Поле будет разблокировано только если не осталось видов,
// блокирующих расчёт
//------------------------------------------------------------------------------
class function TCalc12Mnth.DeleteNoPayVidN(
  NoPayFieldName,
  VidN: ShortString
): Boolean;
const
  // Четыре цифры вида начисл./удераж. плюс ';'.
  ENTRY_LEN = 5;
var
  Vids: ShortString;
  Indx: integer;
begin
  Result := false;
  NoPayFieldName := NoPayFieldName + NO_PAY_FIELD_SUFFIX;

  with CdsDays do begin
    Vids := FieldByName(NoPayFieldName).AsString;
    Indx := Pos(VidN, Vids);

    if Indx > 0 then begin
      Vids := Copy(Vids, 1, Indx - 1) +
        Copy(Vids, Indx + ENTRY_LEN, Length(Vids));

      FieldByName(NoPayFieldName).AsString := Vids;

      Result := Length(Vids) = 0;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Если хоть один из рабочих дней месяца был отработан, месяц попадает в расчёт
// среднемесячной суммы дохода
//------------------------------------------------------------------------------
class function TCalc12Mnth.ShouldUseMnth(
  Mnth, SickListDt: TDateTime
): Boolean;
var
  Mark: TBookMark;
begin
  Result := false;

  // Заполнить CdsDays рабочими днями месяца
  InitCdsByWorkDays(Mnth);

  // Пройтись по начислениям/удержаниям месяца и отметить дни CdsDays, в которые
  // не было начислений
  with QryNu do begin
    // Сохраняем позицию ибо елозим по тому же запросу, что и вызывающая
    // процедура
    Mark := GetBookmark;

    while (FieldByName('ZaMesGod').AsDateTime = Mnth) and not Eof do begin
      if FieldByName('DtProc').AsDateTime <= SickListDt then
        ProcessCdsDays(QryNu);

      Next;
    end;

    GotoBookmark(Mark);
    FreeBookmark(Mark);
  end;

  // Посчитать оставшиеся дни
  with CdsDays do begin
    First;

    while not Eof do begin
      if (FieldByName('NoPayFullTime').AsInteger > 0)
        or (FieldByName('NoPayPartTime').AsInteger > 0) then
      begin
        Result := true;
        break;
      end;

      Next;
    end;
  end;
end;

end.
