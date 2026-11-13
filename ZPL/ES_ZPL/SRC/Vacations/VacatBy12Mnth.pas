unit VacatBy12Mnth;

interface

uses
  DateLib, DbClient, DbTables;

type
  TVacat12Mnth = class
  private
    // Параметры вызова
    Alg12Mnth: Boolean;
    OwnListOnly,
    UseWorkDays,
    UseSalCoeff: Boolean;

    // Параметры, получаемые из VOtp
    SpecNr: Integer;
    // Месяц, на который рассчитывается отпуск
    // Совместительский отпуск
    VacatIsSuppl: Boolean;
    // Календ./раб. дни
    VacatDayType: ShortString;

    CdsDays: TClientDataSet;

    EmplPeriod, CalcPeriod: TPeriod;
    PreVacatSal: Double;

    // Итоговые значения
    SumTotal: Double;
    DaysTotal: Integer;

    EmplId: Integer;
    CalcBaseMnth: TDateTime;

    QryEmplmnt,
    QryAssigns,
    QryPaymnts,
    QryOtkl: TQuery;

    procedure FetchVacatParams;
    procedure DefineCalcPeriod;

    procedure FillQryROtp;
    procedure DelQryROtp;

    procedure ProcessMnth(MnthBeg: TDateTime);
    procedure InitMnth(MnthBeg: TDateTime);
    procedure PopulateCdsDays(MnthBeg: TDateTime);

    procedure ProcNoPayVidN;
    procedure ProcPayblVidN;
    function CountMnthDays: Integer;
    function CountMnthDays2(MnthYear: TDateTime): Integer;
    procedure FixMnthSalary;

    procedure PrepareDataSets;
    procedure PrepareNonPayOtkl;
    procedure CreateCdsDays;
    procedure ReleaseDataSets;

    procedure SelectNonPayDeviats(MnthYear: TDateTime);

    procedure OpenQryPmnts;

    function WorkMnthIsFull(MnthYear: TDateTime): Boolean;
    function ExcludeMonth(MnthYear: TDateTime): TSpan;
    function ComplemMonth(MnthYear: TDateTime): TSpan;
    function MonthIsTerm(MnthBeg: TDateTime): Boolean;

    procedure LoadEmplmnt;
    procedure LoadSovmEmplmnt;
    function GetEmplmntSpan: TSpan;
    function GetSovmEmplmntSpan: TSpan;
    procedure InitVacatParams;
    procedure InitSovmOtpParams;

    procedure OpenQryAssgns; virtual;
    procedure UpdQryVOtp(KdObj, KdKatP, KdTheme, KdSPZ: Integer);

    class function QryVOtp: TQuery;
    class function QryROtp: TQuery;

  public
    constructor Create(
      Alg12Mnth, OwnListOnly, UseWorkDays, UseSalCoeff: Boolean);

    destructor Destroy; override;

    procedure Load;

    class procedure OpenQryROtp(SpecNr: Integer);
    procedure GetTotals(out Sum: Double; out Days: Integer);
    function GetEmplmntDate: TDateTime;

    class procedure DisableHandlers;
    class procedure EnableHandlers;
  end;

implementation

uses
  Db, Math, a_Const, z_Dm, z_EOtp,
  DsLib, QryLib, SalaryConst, SalaryLib, CalcComp2023;

//------------------------------------------------------------------------------
constructor TVacat12Mnth.Create(
  Alg12Mnth, OwnListOnly, UseWorkDays, UseSalCoeff: Boolean);
begin
  Self.Alg12Mnth := Alg12Mnth;
  Self.OwnListOnly := OwnListOnly;
  Self.UseWorkDays := UseWorkDays;
  Self.UseSalCoeff := UseSalCoeff;

  QryEmplmnt := TQuery.Create(nil);
end;

//------------------------------------------------------------------------------
destructor TVacat12Mnth.Destroy;
begin
  QryEmplmnt.Free;
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.Load;
begin
  SumTotal := 0;
  DaysTotal := 0;

  // Берём введённые параметры
  FetchVacatParams;

  // Загружаем приём/увольн. (в случае совм.отп. - совм.надбавки)
  if VacatIsSuppl then
    LoadSovmEmplmnt
  else
    LoadEmplmnt;

  // Период трудоустройства
  if VacatIsSuppl then
    EmplPeriod := GetSovmEmplmntSpan
  else
    EmplPeriod := GetEmplmntSpan;

  // Инициализируем зависимые от занимаемой позиции параметры отпуска
  if VacatIsSuppl then
    InitSovmOtpParams;
// 7.9.2026 При переходе с шага 1 на шаг 2 затираются установленный вручную
// счёт БУ, ну и наверное подразделение, тема и категория персонала
//  else
//    InitVacatParams;

  // Определяем 12-мес период в зависимости от даты приёма (начала надбавок)
  DefineCalcPeriod;

  if DateUtils.PeriodIsEmpty(CalcPeriod) then
    exit;

  try
    PrepareDataSets;

    // Перемещения, предшествующие отпуску.
    OpenQryAssgns;
    // Оклад на начало отпуска
    PreVacatSal := QryAssigns.FieldByName('OklTrf').AsFloat;

    DelQryROtp;
    FillQryROtp;
  finally
    ReleaseDataSets;
  end;
end;

//------------------------------------------------------------------------------
// Выбрать период основного приёма/увольнения (z_PrmUv)
//------------------------------------------------------------------------------
procedure TVacat12Mnth.LoadEmplmnt;
begin
  SalaryUtils.SelectAssigns(QryEmplmnt, EmplId,
    DateUtils.InitPeriod(CalcBaseMnth, CalcBaseMnth), true, false);
end;

//------------------------------------------------------------------------------
// Выбрать период совместительского приёма/увольнения (z_Nadb)
//------------------------------------------------------------------------------
procedure TVacat12Mnth.LoadSovmEmplmnt;
begin
  SalaryUtils.SelectSupplNadb(QryEmplmnt, EmplId, CalcBaseMnth);
end;

//------------------------------------------------------------------------------
// Период приёма/увольнения по основным отпускам (на базе z_PrmUv)
//------------------------------------------------------------------------------
function TVacat12Mnth.GetEmplmntSpan: TSpan;
begin
  with QryEmplmnt, DateUtils do
    if RecordCount > 0 then
      Result := InitPeriod(FieldByName('Dt_Priem').AsDateTime,
        FieldByName('Dt_Uvoln').AsDateTime)
    else
      Result := CreateEmptyPeriod;
end;

//------------------------------------------------------------------------------
// Период приёма/увольнения по совместительским отпускам (на базе z_Nadb)
//------------------------------------------------------------------------------
function TVacat12Mnth.GetSovmEmplmntSpan: TSpan;
begin
  Result := SalaryUtils.GetSupplEmplSpan(QryEmplmnt);
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.FetchVacatParams;
var
  QryCmn: TQuery;
begin
  with QryVOtp do begin
    SpecNr := FieldByName('Spec_Nr').AsInteger;
    EmplId := FieldByName('TabN').AsInteger;
    CalcBaseMnth := FieldByName('DtBeg').AsDateTime;

    // Признак совместительства отпуска
    QryCmn := TQuery.Create(nil);
    QryUtils.PeekVidN(QryCmn, FieldByName('VidN').AsString);

    with QryCmn do begin
      VacatIsSuppl := FieldByName('Sovm').AsString = '1';
      Free;
    end;

    // Тип отпускных дней: рабочие/календарные
    if (FieldByName('RK').AsString = 'R') or UseWorkDays then
      VacatDayType := 'otp'
    else
      VacatDayType := 'otk';
  end;
end;

//------------------------------------------------------------------------------
// Параметры больничного листа заполняем из последнего перемещения
//------------------------------------------------------------------------------
procedure TVacat12Mnth.InitVacatParams;
begin
  with QryEmplmnt do begin
    Last;

    UpdQryVOtp(FieldByName('KdObj').AsInteger,
       FieldByName('KdKatP').AsInteger,
       FieldByName('KdTemu').AsInteger,
       FieldByName('KdSPZ').AsInteger
    );
  end;
end;

//------------------------------------------------------------------------------
// Обновляем параметры совместительского отпуска из надбавок
//------------------------------------------------------------------------------
procedure TVacat12Mnth.InitSovmOtpParams;
begin
  // SB 18.6.2026
  // Убираем: в случае нескольких надбавок по разным счетам
  // выбирает параметры одной из них, не всегда подходящим образом
  // и изменить это из интерфейса не представляется возможным
  {
  with QryEmplmnt do begin
    First;

    while not Eof do begin
      // Либо надбавка совместительская, либо в надбавке сотрудник указан
      // как совместитель
      if ((FieldByName('Sovm').AsString = '1')
          or (FieldByName('Kd_Sovm').AsInteger = EMPL_INNER_PARTTIME))
        and (FieldByName('Kd_Dlzhn').AsInteger <> 0)
      then
        UpdQryVOtp(
          // подразд
          FieldByName('KdObj').AsInteger,
          // кат.перс
          FieldByName('KdKatP').AsInteger,
          // тема НИЧ
          FieldByName('KdTemu').AsInteger,
          // счёт
          FieldByName('KdSPZ').AsInteger
        );

      Next;
    end;
  end;
  }
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.UpdQryVOtp(KdObj, KdKatP, KdTheme, KdSPZ: Integer);
begin
  with QryVOtp do begin
    // подразд
    FieldByName('KdObj').AsInteger := KdObj;
    // кат.перс
    FieldByName('KdKatP').AsInteger := KdKatP;
    // тема НИЧ
    FieldByName('KdTemu').AsInteger := KdTheme;
    // счёт
    FieldByName('KdSPZ').AsInteger := KdSPZ;
  end;
end;

//------------------------------------------------------------------------------
// Определяет период приёма/увольнения в пределах 12 мес.
//------------------------------------------------------------------------------
procedure TVacat12Mnth.DefineCalcPeriod;
begin
  with DateUtils do begin
    // Двенадцать месяцев в зависимости от алгоритма расчёта
    if Alg12Mnth then
      // 12 мес. период
      CalcPeriod := InitPeriod(PrevMonth(CalcBaseMnth, 12),
        EndOfMonth(PrevMonth(CalcBaseMnth)))
    else
      // Период 2023 года
      CalcPeriod := InitPeriod(Jan1St2023, Dec31St2023);

    // Реально отработанный период за 12 мес. с учётом приёма/увольнения
    CalcPeriod := IntersectPeriods(CalcPeriod, EmplPeriod);

    // Первый и последний месяцы могут быть неполными по рабочим дням.
    // Такие месяцы нужно исключить (ExcludeMonth). Но если по рабочим дням
    // месяц полный, его нужно добить до полного в днях календарных. Например
    // месяц начался с ВЫХОДНОГО и на работу приняли с первого РАБОЧЕГО дня
    // месяца. Базой для дальнейшего определения зачётных дней должны стать все
    // КАЛЕНДАРНЫЕ дни такого месяца. Месяц дополняем ComplemMonth.
    if not WorkMnthIsFull(CalcPeriod.Start) then
      CalcPeriod := ExcludeMonth(CalcPeriod.Start)
    else
      CalcPeriod := ComplemMonth(CalcPeriod.Start);

    if not WorkMnthIsFull(CalcPeriod.Finish) then
      CalcPeriod := ExcludeMonth(CalcPeriod.Finish)
    else
      CalcPeriod := ComplemMonth(CalcPeriod.Finish);
  end;
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.PrepareDataSets;
begin
  // Таблица отпускных дней месяца
  CreateCdsDays;

  PrepareNonPayOtkl;

  // Запрос для помесячных сумм и количества часов, участвующих в расчёте
  OpenQryROtp(SpecNr);
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.ReleaseDataSets;
begin
  CdsDays.Free;

  QryAssigns.Free;
  QryOtkl.Free;
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.OpenQryAssgns;
begin
  QryAssigns := TQuery.Create(nil);
  QryUtils.InitQuery(QryAssigns);

  with QryAssigns do begin
    SQL.Add(
      'select * ' +
      'from z_Pere ' +
      'where KdSps = :KdSps ' +
        'and TabN = :TabN and Dt_Beg <= :DtBegOtp ' +
      'order by Dt_Beg desc, NR desc');

    ParamByName('KdSps').AsInteger := gl_nAppKdSpsUsr;
    ParamByName('TabN').AsInteger  := EmplId;
    ParamByName('DtBegOtp').AsDateTime := CalcBaseMnth;
    Open;
  end;
end;

//------------------------------------------------------------------------------
class procedure TVacat12Mnth.OpenQryROtp(SpecNr: Integer);
begin
  QryUtils.InitQuery(QryROtp);

  with QryROtp do begin
    SQL.Add(
      'select * ' +
      'from z_ROtp ' +
      'where Spec_NR = :SpecNR');

    ParamByName('SpecNR').AsInteger := SpecNr;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.OpenQryPmnts;
begin
  QryPaymnts := TQuery.Create(nil);
  QryUtils.InitQuery(QryPaymnts);

  with QryPaymnts do begin
    SQL.Add(
      'select * ' +
      'from Vinu_Main ' +
      'where TabN = :TabN ' +
        'and ZaMesGod between :DtBegPerioda and :DtEndPerioda ' +
        'and VidN < "6000" ');

    if VacatIsSuppl then
      // отпуск на совместительские виды
      SQL.Add('and (Sovm = "1" or NuSovm = "1" or NuSovm = "Y") ')
    else
      // отпуск на не совместительские виды
      SQL.Add('and not (Sovm = "1" or NuSovm = "1" or NuSovm = "Y") ');

    if OwnListOnly then
      // выбирать только по "своему" списку
      SQL.Add('and KdSps = :KdSps ');

    SQL.Add('order by ZaMesGod, VidN');

    ParamByName('TabN').AsInteger := EmplId;

    with CalcPeriod do begin
      ParamByName('DtBegPerioda').AsDateTime := DateUtils.BeginOfMonth(Start);
      ParamByName('DtEndPerioda').AsDateTime := Finish;
    end;

    if OwnListOnly then
      ParamByName('KdSps').AsInteger := gl_nAppKdSpsUsr;

    Open;
  end;
end;

//------------------------------------------------------------------------------
// Выбрать сведения для расчета отпускных
// Определить даты ZaMesGod для 12 предыдущих месяцев, заглянуть и в
// текущий месяц - нет ли в нем начислений за соответстующие МесГод
//------------------------------------------------------------------------------
procedure TVacat12Mnth.FillQryROtp;
begin
  DisableHandlers;

  // Открываем начисления за 12 месяцев
  OpenQryPmnts;

  with QryPaymnts do begin
    First;

    while not Eof do
      ProcessMnth(FieldByName('ZaMesGod').AsDateTime);
      // Next выполняется внутри

    Free;
  end;

  QryROtp.First;

  EnableHandlers;
end;

//------------------------------------------------------------------------------
class procedure TVacat12Mnth.DisableHandlers;
begin
  FormEOtp.QryROtpSMZARABOTKA.OnChange := nil;
  FormEOtp.QryROtpKOEFZP.OnChange := nil;
  FormEOtp.QryROtpCNTDAYS.OnChange := nil;
end;

//------------------------------------------------------------------------------
class procedure TVacat12Mnth.EnableHandlers;
begin
  FormEOtp.QryROtpSMZARABOTKA.OnChange := FormEOtp.QryROtpChange;
  FormEOtp.QryROtpKOEFZP.OnChange := FormEOtp.QryROtpChange;
  FormEOtp.QryROtpCNTDAYS.OnChange := FormEOtp.QryROtpChange;
end;

//------------------------------------------------------------------------------
// Удаляем текущие помесячные данные для расчёта
//------------------------------------------------------------------------------
procedure TVacat12Mnth.DelQryROtp;
begin
  with QryROtp do begin
    First;

    while not Eof do
      Delete;
  end;
end;

//------------------------------------------------------------------------------
// Обработка начислений/удержаний одного месяца
//------------------------------------------------------------------------------
procedure TVacat12Mnth.ProcessMnth(MnthBeg: TDateTime);
var
  SumForVacat: Double;
  DaysForVacat: Integer;
  PayType: ShortString;
begin
  InitMnth(MnthBeg);

  SumForVacat := 0;

  // Проставляем дням начислений признак оплачиваемый/неоплачиваемый
  with QryPaymnts do
    while (FieldByName('ZaMesGod').AsDateTime = MnthBeg) and not Eof do begin
      // СмВида включается в СмДляОтп
      if FieldByName('Otp').AsString = '1' then
        SumForVacat := SumForVacat + FieldByName('Summa').AsFloat;

      // Даты начала или окончания не заданы. Пропускаем.
      if (FieldByName('Dt_Beg').AsDateTime <> 0)
        and (FieldByName('Dt_End').AsDateTime <> 0) then
      begin
        PayType := FieldByName('VidN').AsString;

        if (PayType >= '5000') and (PayType < '5100')
          and (PayType <> '5007')
        then
        // неоплачиваемые
        // ProcNoPayVidN
        else
          // оплачиваемые
          if not VacatIsSuppl and (FieldByName('CBudg').AsString = '1')
            // Рассчитывается основной отпуск -
            // рассматриваем только бюджетные виды
            or
            // Рассчитывается совместит.отпуск -
            // бюджетность не важна: только Был/НеБыл
            VacatIsSuppl and (FieldByName('SOVM').AsString = '1')
          then
            ProcPayblVidN;
      end;

      Next;
    end;

  // DaysForVacat := CountMnthDays;
  DaysForVacat := CountMnthDays2(MnthBeg);

  if DaysForVacat = 0 then
    SumForVacat := 0;

  if SumForVacat = 0 then
    DaysForVacat := 0;

  if (DaysForVacat <> 0) or (SumForVacat <> 0) then begin
    with QryROtp do begin
      Edit;
      FieldByName('SmZarabotka').AsFloat := RoundTo(SumForVacat, -2);
      FieldByName('CntDays').AsFloat := DaysForVacat;
      Post;
    end;
  end;

  FixMnthSalary;

  SumTotal := SumTotal + SumForVacat;
  DaysTotal := DaysTotal + DaysForVacat;
end;

//------------------------------------------------------------------------------
// Обработка неоплачиваемых видов
// Проставляем вес в таблице дней как неоплачиваемый или как оплачиваемый,
// если сторнирован
//
// ЭТОТ МЕТОД РАБОТАЕТ ПЛОХО, ПОТОМУ ЧТО СТОРНИРОВАННЫЕ НЕОПЛАЧИВАЕМЫЕ ЧАСЫ
// В НАЧИСЛЕНИЯ/УДЕРЖАНИЯ ПИШУТСЯ ОЧЕНЬ НЕПРАВИЛЬНО
//------------------------------------------------------------------------------
procedure TVacat12Mnth.ProcNoPayVidN;
var
  Date: TDateTime;
  Value: Integer;
begin
  with QryPaymnts do begin
    Date := FieldByName('Dt_Beg').AsDateTime;

    while Date <= FieldByName('Dt_End').AsDateTime do begin
      with CdsDays do
      if Locate('Day', Date, []) then begin
        Edit;
        if QryPaymnts.FieldByName('Storn').AsString = '' then
          Value := -1
        else
          Value := 1;

        FieldByName('Weight').AsInteger :=
          FieldByName('Weight').AsInteger + Value;
        Post;
      end;

      Date := Date + 1;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Обработка рабочих видов начисления
// Проставляем вес в таблице дней как оплачиваемый,
// если часы положительные или ноль, и как неоплачиваемый,
// если часы отрицательные (пересчёт)
//------------------------------------------------------------------------------
procedure TVacat12Mnth.ProcPayblVidN;
var
  Date: TDateTime;
  Value: Integer;
begin
  with QryPaymnts do begin
    Date := FieldByName('Dt_Beg').AsDateTime;

    if QryPaymnts.FieldByName('Chas').AsFloat >= 0 then
      // Обычные начисления. Нулевые часы нужно учитывать. Например,
      // это может быть зарплата за выходные дни: часов - ноль, денег - ноль.
      Value := 1
    else
      // Это - пересчёты месяца
      Value := -1;

    while Date <= FieldByName('Dt_End').AsDateTime do begin
      with CdsDays do
        if Locate('Day', Date, []) then begin
          Edit;
          FieldByName('Weight').AsInteger :=
            FieldByName('Weight').AsInteger + Value;
          Post;
        end;

      Date := Date + 1;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.InitMnth(MnthBeg: TDateTime);
begin
  with QryROtp do begin
    Append;
    FieldByName('KdSps').AsInteger := gl_nAppKdSpsUsr;
    FieldByName('TabN').AsInteger := EmplId;
    FieldByName('ZaMesGod').AsDateTime :=
      QryPaymnts.FieldByName('ZaMesGod').AsDateTime;
    FieldByName('KoefZp').AsFloat := 1;
    Post;
  end;

  PopulateCdsDays(MnthBeg);
end;

//------------------------------------------------------------------------------
// Подсчаёт "очков" ЗА и ПРОТИВ
//------------------------------------------------------------------------------
function TVacat12Mnth.CountMnthDays: Integer;
begin
  Result := 0;

  with CdsDays do begin
    First;

    while not Eof do begin
      if FieldByName('Weight').AsInteger > 0 then
        Inc(Result);

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Подсчёт зачётных дней по отклонениям:
// 1. Берём период актуального/последнего приёма/увольнения в платёжном периоде;
// 2. Вычитаем неоплачиваемые периоды не по вине сотрудника;
// 3. Считаем дни.
// Параметры:
// PayPeriod - период, в котором считаем дни. В общем случае - месяц.
//------------------------------------------------------------------------------
function TVacat12Mnth.CountMnthDays2(MnthYear: TDateTime): Integer;
var
  Weight: SmallInt;
  Period: TPeriod;
  Date: TDateTime;
begin
  Result := 0;

  SelectNonPayDeviats(MnthYear);

  with QryOtkl do begin
    First;

    while not Eof do begin
      // Игнорируем 5007 - неполный рабочий день
      if (FieldByName('VidN').AsString <> '5007')
          and (FieldByName('OSovm').AsString <> 'Y')
          and (FieldByName('VSovm').AsString <> '1') then begin
        if FieldByName('Storn').AsString = 'Y' then
          Weight := 1
        else
          Weight := -1;

        with DateUtils do
        Period := IntersectPeriods(
          InitPeriod(FieldByName('Dt_Beg').AsDateTime,
            FieldByName('Dt_End').AsDateTime), EmplPeriod);

        Date := Period.Start;

        while Date <= Period.Finish do begin
          with CdsDays do
          if Locate('Day', Date, []) then begin
            Edit;
            FieldByName('Weight').AsInteger :=
              FieldByName('Weight').AsInteger + Weight;
            Post;
          end;

          Date := Date + 1;
        end;
      end;

      Next;
    end;
  end;

  // Считаем дни
  with CdsDays do begin
    First;

    while not Eof do begin
      if FieldByName('Weight').AsInteger >= 0 then
        Inc(Result);

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.PrepareNonPayOtkl;
begin
  QryOtkl := TQuery.Create(nil);
  QryUtils.InitQuery(QryOtkl);

  with QryOtkl do begin
    SQL.Text :=
      'select o.VidN, o.Dt_Beg, o.Dt_End, o.Storn, ' +
        'o.Sovm OSovm, v.Sovm VSovm ' +
      'from z_Otkl o ' +
        'left join z_KdVidN v on v.VidN = o.VidN ' +
      'where TabN = :EmplId ' +
        'and o.ZaMesGod = :MnthYear ' +
        'and o.VidN > "5000" and o.VidN < "6000"';
    Prepare;
  end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TVacat12Mnth.SelectNonPayDeviats(MnthYear: TDateTime);
begin
  with QryOtkl do begin
    if Active then
      Close;
    ParamByName('EmplId').AsInteger := EmplId;
    ParamByName('MnthYear').AsDateTime := MnthYear;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.FixMnthSalary;
var
  CurMnthEnd: TDateTime;
  Salary, Coeff: Double;
begin
  // Брать оклад не на 1-е число месяца, а на последнее (Ольга 11-05-2006)
  CurMnthEnd :=
    DateUtils.EndOfMonth(QryROtp.FieldByName('ZaMesGod').AsDateTime);

  // Нулевые оклады меняем на последний предотпускной оклад
  with QryAssigns do begin
    First;

    while not Eof do begin
      // Ищем актуальное на конец месяца перемещение
      if FieldByName('Dt_Beg').AsDateTime <= CurMnthEnd then begin
        Salary := FieldByName('OklTrf').AsFloat;

        if Salary = 0 then
          Salary := PreVacatSal;

        Coeff := 1;
        if UseSalCoeff and (Salary <> 0) then
          Coeff := Max(RoundTo(PreVacatSal / Salary, -2), 1);

        with QryROtp do begin
          Edit;
          FieldByName('SmOklada').AsFloat := Salary;
          FieldByName('KoefZp').AsFloat := Coeff;
          FieldByName('SmDSredn').AsFloat :=
            RoundTo(FieldByName('SmZarabotka').AsFloat * Coeff, -2);
          Post;
        end;
        // Нашли. Выходим
        break;
      end;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.CreateCdsDays;
begin
  CdsDays := TClientDataSet.Create(nil);
  with CdsDays, FieldDefs do begin
    Add('Day', ftDateTime);
    Add('Weight', ftInteger);

    IndexDefs.Add('Primary', 'Day', [ixPrimary]);
    IndexName := 'Primary';

    CreateDataSet;
    Open;
  end;
end;

//------------------------------------------------------------------------------
// Инициализируем дни, идущие в зачёт при расчёте отпускных
//------------------------------------------------------------------------------
procedure TVacat12Mnth.PopulateCdsDays(MnthBeg: TDateTime);
var
  Date: TDateTime;
  DayForVacat: Integer;
  DummyDouble: Double;
  MnthEnd: TDateTime;
  // Дополненные дни
  ComplDays: TSpans;
begin
  CdsDays.EmptyDataSet;

  // Для первого и последнего месяцев зачётного периода, если они были
  // дополнены до полного календарного месяца, дням нужно сразу проставлять
  // вес, потому как в обработку начислениями/удержаниями дополненные дни
  // не попадают
  SetLength(ComplDays, 0);
  // Вычитанием определяем дополненные дни
  if MonthIsTerm(MnthBeg) then
    ComplDays := DateUtils.SubtractPeriods(CalcPeriod, EmplPeriod);

  // Заполняем Cds днями из таблицы-календаря E_Days
  MnthEnd := DateUtils.EndOfMonth(MnthBeg);
  Date := MnthBeg;

  while Date <= MnthEnd do begin
    DmMain.CheckDayForOtp(Date, DayForVacat, DummyDouble, VacatDayType);

    if DayForVacat > 0 then
      with CdsDays do begin
        Append;
        FieldByName('Day').AsDateTime := Date;

        // Дополненные дни есть и текущий день является дополненным
        // Проставляем ему вес единицей: день пойдёт в зачёт при расчёте
        // среднедневной суммы для отпускных
        if (Length(ComplDays) > 0)
          and DateUtils.EventIsInPeriod(Date, ComplDays[1])
        then
          FieldByName('Weight').AsInteger := 1;

        Post;
      end;

    Date := Date + 1;
  end;
end;

//------------------------------------------------------------------------------
class function TVacat12Mnth.QryVOtp: TQuery;
begin
  Result := FormEOtp.QryVOtp;
end;

//------------------------------------------------------------------------------
class function TVacat12Mnth.QryROtp: TQuery;
begin
  Result := FormEOtp.QryROtp;
end;

//------------------------------------------------------------------------------
procedure TVacat12Mnth.GetTotals(out Sum: Double; out Days: Integer);
begin
  Sum := SumTotal;
  Days := DaysTotal;
end;

//------------------------------------------------------------------------------
function TVacat12Mnth.GetEmplmntDate: TDateTime;
begin
  if DateUtils.PeriodIsEmpty(EmplPeriod) then
    Result := 0
  else
    Result := EmplPeriod.Start;
end;

//------------------------------------------------------------------------------
function TVacat12Mnth.WorkMnthIsFull(MnthYear: TDateTime): Boolean;
var
  Period: TPeriod;
  WorkDays: Integer;
begin
  with DateUtils do begin
    // Полный месяц
    Period := InitPeriod(BeginOfMonth(MnthYear), EndOfMonth(MnthYear));

    with Period do
      WorkDays := Round(DmMain.CountWorkDays(Start, Finish));

    // Кусок расчётного периода в полном месяце
    Period := IntersectPeriods(Period, CalcPeriod);

    with Period do
      Result := Round(DmMain.CountWorkDays(Start, Finish)) = WorkDays;
  end;
end;

//------------------------------------------------------------------------------
function TVacat12Mnth.ExcludeMonth(MnthYear: TDateTime): TSpan;
var
  Remain: TSpans;
  Span: TSpan;
begin
  with DateUtils do begin
    // Полный месяц
    Span := InitPeriod(BeginOfMonth(MnthYear), EndOfMonth(MnthYear));

    Remain := SubtractPeriods(CalcPeriod, Span);

    if Length(Remain) = 0 then
      Result := InitPeriod
    else
      Result := Remain[0];
  end;
end;

//------------------------------------------------------------------------------
function TVacat12Mnth.ComplemMonth(MnthYear: TDateTime): TSpan;
var
  Span: TSpan;
begin
  with DateUtils do begin
    // Полный месяц
    Span := InitPeriod(BeginOfMonth(MnthYear), EndOfMonth(MnthYear));

    Result := JoinPeriods(CalcPeriod, Span);
  end;
end;

//------------------------------------------------------------------------------
// Месяц является месяцем либо начала либо конца расчётного периода
//------------------------------------------------------------------------------
function TVacat12Mnth.MonthIsTerm(MnthBeg: TDateTime): Boolean;
begin
  with DateUtils do
    Result := (MnthBeg = BeginOfMonth(CalcPeriod.Start))
      or (MnthBeg = BeginOfMonth(CalcPeriod.Finish));
end;

end.
