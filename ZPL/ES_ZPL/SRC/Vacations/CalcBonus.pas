unit CalcBonus;

// Новые правила учёта премий при расчёте больничных.
// Оксана, январь 2025
// Пока не используются. Квартальную и годовую премии решили проводить
// как текущие, на которые новые правила не распространяются.

interface

uses
  Db, DbClient, DbTables;

type
  TBonusCallback = procedure (Mnth: TDateTime; WorkDays: Integer;
    MnthSum: Double);

  TBonusCalc = class
  private
    Query: TQuery;
    function CountWorkDays(DtBeg, DtEnd: TDateTime): Integer;
    procedure OpenSpecDaysQry(DtBeg, DtEnd: TDateTime);
    procedure PrepareSpecDaysQry;
  public
    procedure ProcessBonus(BonusFirstMnth: TDateTime; MnthCnt: Integer;
      BonusSum: Double; BonusCalcMnth: TDateTime; Callback: TBonusCallback);
  end;

implementation

uses
  DateLib, MathLib, QryLib, SysUtils;

//------------------------------------------------------------------------------
procedure TBonusCalc.ProcessBonus(
  // первый месяц периода, за который начисляется бонус
  BonusFirstMnth: TDateTime;
  // количество месяцев, за которые начисляется бонус
  MnthCnt: Integer;
  // сумма бонуса
  BonusSum: Double;
  // месяц, в котором производится начисление бонуса
  BonusCalcMnth: TDateTime;
  // процедура, в которую передаются результаты расчёта бонуса
  Callback: TBonusCallback
);
var
  BonusLastMnth: TDateTime;
  DayAvrg: Double;
  Mnth: TDateTime;
  WorkDays: Integer;
begin
  PrepareSpecDaysQry;

  with DateUtils do begin
    // Дата окончания бонуса и количество рабочих дней
    BonusLastMnth := NextMonth(BonusFirstMnth, MnthCnt);
    WorkDays := CountWorkDays(BonusFirstMnth, EndOfMonth(BonusLastMnth));

    // Рассчитываем дневную сумму бонуса
    DayAvrg := MathUtils.Round(BonusSum / WorkDays, 2);

    // Переносим период действия бонуса к дате начисления бонуса
    Mnth := BeginOfMonth(BonusCalcMnth);
    BonusLastMnth := NextMonth(Mnth, MnthCnt);

    while Mnth <= BonusLastMnth do begin
      WorkDays := CountWorkDays(Mnth, EndOfMonth(Mnth));

      if Assigned(Callback) then
        Callback(Mnth, WorkDays, WorkDays * DayAvrg);

      Mnth := NextMonth(Mnth);
    end;
  end;
end;

//------------------------------------------------------------------------------
// Подсчёт количества рабочих дней за период
//------------------------------------------------------------------------------
function TBonusCalc.CountWorkDays(
  DtBeg, DtEnd: TDateTime
): Integer;
var
  Day: Word;
begin
  OpenSpecDaysQry(DtBeg, DtEnd);

  Result := 0;

  with Query do
    while DtBeg <= DtEnd do begin
      if Locate('E_Day', DtBeg, []) then begin
        if Round(FieldByName('Rab_Chas').AsFloat) <> 0 then
          Inc(Result);
      end else begin
        Day := DayOfWeek(DtBeg);

        if (Day > 1) and (Day < 7) then
          Inc(Result);
      end;

      DtBeg := DtBeg + 1;
      Next;
    end;
end;

//------------------------------------------------------------------------------
// Подготовка запроса специальных дней за период
//------------------------------------------------------------------------------
procedure TBonusCalc.PrepareSpecDaysQry;
begin
  QryUtils.InitQuery(Query);

  with Query do begin
    // выбираем из таблицы дней

    SQL.Add(
      'select * ' +
      'from E_Days ' +
      'where E_Day >= :PeriodBeg and E_Day <= :PeriodEnd ' +
      'order by E_Day'
    );
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
// Запрос специальных дней за период
//------------------------------------------------------------------------------
procedure TBonusCalc.OpenSpecDaysQry(DtBeg, DtEnd: TDateTime);
begin
  with Query do begin
    Close;
    ParamByName('PeriodBeg').AsDateTime := DtBeg;
    ParamByName('PeriodEnd').AsDateTime := DtEnd;
    Open;
  end;
end;

end.
