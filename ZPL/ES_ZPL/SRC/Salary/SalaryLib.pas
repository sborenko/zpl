unit SalaryLib;

interface

uses
  DateLib, DbTables;

type
  SalaryUtils = class
    class procedure ComposeSelEmplmnts(Qry: TQuery);
    class procedure PrepareSelEmplmnts(Qry: TQuery);
    class procedure SelectEmplmnts(Qry: TQuery; EmplId: Integer;
      Period: TPeriod);

    class procedure ComposeSelAssigns(Qry: TQuery;
      StrictPeriod: Boolean = true; FilterNoEmplmnt: Boolean = true);
    class procedure PrepareSelAssigns(Qry: TQuery;
      StrictPeriod: Boolean = true; FilterNoEmplmnt: Boolean = true);
    class procedure SelectAssigns(Qry: TQuery; EmplId: Integer; Period: TPeriod;
      StrictPeriod: Boolean = true; FilterNoEmplmnt: Boolean = true);

    // Новый вариант
    // Выбирает перемещения одного приёма/увольнения
    // Приём/увольнение определяется началом заданного периода
    // Выбираются либо все перемещения, либо - действующие в заданном периоде
    // в зависимости от AllHireAssgns
    class procedure SelAssgns(Query: TQuery; EmplId: Integer;
      OnDate: TDateTime); overload;
    class procedure SelAssgns(Query: TQuery; EmplId: Integer; Span: TSpan;
      AllHireAssgn: Boolean = false); overload;
    class procedure PrepSelAssgns(Query: TQuery;
      AllHireAssgn: Boolean = false);
    class procedure CompSelAssgns(Query: TQuery; AllHireAssgn: Boolean);

    class procedure ComposeSelMinSals(Qry: TQuery);
    class procedure PrepareSelMinSals(Qry: TQuery);
    class procedure SelectMinSals(Qry: TQuery; Period: TPeriod);

    class procedure SelectSupplNadb(Query: TQuery; TabN: Integer;
      OnDate: TDateTime);

    class function GetSupplEmplSpan(QryNadb: TQuery): TSpan;

    class function SelectInvList(
      OnDate: TDateTime; ByFamIO: Boolean = true): TQuery; overload;
    class procedure SelectInvList(
      Query: TQuery; OnDate: TDateTime; ByFamIO: Boolean = true); overload;
    class procedure ComposeSelInvList(Query: TQuery; ByFamIO: Boolean = true);

    class function PeekOznDoh(Query: TQuery; OznDohId: Integer): Boolean;
  end;

implementation

uses
  QryLib;

//------------------------------------------------------------------------------
// Выбираем приёмы/увольнения за период. Отбор производится методом определения
// пересечения периодов приёма/увольнения с заданным периодом.
// Параметры запроса: PeriodStart, PeriodFinish - начало и конец периода, за
// который выбираем приёмы/увольнения.
// Примечание: Значение 30-DEC-1899 получаем в случаях, когда передаваемый
// TDateTime параметр равен нулю.
//------------------------------------------------------------------------------
class procedure SalaryUtils.ComposeSelEmplmnts(Qry: TQuery);
begin
  QryUtils.InitQuery(Qry);

  with Qry.SQL do begin
    Text :=
      'select * ' +
      'from z_PrmUv u ' +
        'left join z_Pere p on p.TabN = u.TabN ' +
          'and (p.Dt_Beg >= u.Dt_Priem or u.Dt_Priem is null) ' +
          'and (p.Dt_Beg <= u.Dt_Uvoln or u.Dt_Uvoln is null) ' +
      'where TabN = :EmplId ' +
        'and ( ' +
          // Начало рассматриваемого периода не задано,
          // т.е., удовлетворяют все записи, независимо от даты увольнения:
          ':PeriodStart = "30-DEC-1899" ' +
          // Иначе, начало рассматриваемого периода задано,
          // и удовлетворяют только неуволенные:
          'or u.Dt_Uvoln is null ' +
          // или уволенные после начала рассматриваемого периода:
          'or u.Dt_Uvoln >= :PeriodStart) ' +
        'and ( ' +
          // Конец рассматриваемого периода не задан,
          // т.е., все записи удовлетворяют, независимо от даты приёма:
          ':PeriodFinish = "30-DEC-1899" ' +
          // Конец рассматриваемого периода задан,
          // и удовлетворяют только принятые "до царя Гороха":
          'or u.Dt_Priem is null ' +
          // или принятые до окончания рассматриваемого периода:
          'or u.Dt_Priem <= :PeriodFinish) ' +
      'order by u.Dt_Priem, p.Dt_Beg';
  end;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.PrepareSelEmplmnts(Qry: TQuery);
begin
  with Qry do begin
    ComposeSelEmplmnts(Qry);
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
// Выбрать приёмы/увольнения, которые пересекаются с заданным периодом
//------------------------------------------------------------------------------
class procedure SalaryUtils.SelectEmplmnts(
  Qry: TQuery;
  EmplId: Integer;
  Period: TPeriod);
begin
  with Qry, Period do begin
    if Active then
      Close;

    if not Prepared then
      ComposeSelEmplmnts(Qry);

    ParamByName('EmplId').AsInteger := EmplId;
    ParamByName('PeriodStart').AsDateTime := Start;
    ParamByName('PeriodFinish').AsDateTime := Finish;

    Open;
  end;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.SelAssgns(
  Query: TQuery;
  EmplId: Integer;
  OnDate: TDateTime
);
begin
  SelAssgns(Query, EmplId, DateUtils.InitPeriod(OnDate, OnDate));
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.SelAssgns(
  Query: TQuery;
  EmplId: Integer;
  Span: TSpan;
  AllHireAssgn: Boolean = false)
;
begin
  with Query, Span do begin
    if Active then
      Close;

    if not Prepared then
      CompSelAssgns(Query, AllHireAssgn);

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtBeg').AsDateTime := Start;
    ParamByName('DtEnd').AsDateTime := Finish;

    Open;
  end;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.PrepSelAssgns(
  Query: TQuery;
  AllHireAssgn: Boolean = false
);
begin
  CompSelAssgns(Query, AllHireAssgn);
  Query.Prepare;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.CompSelAssgns(
  Query: TQuery;
  AllHireAssgn: Boolean
);
begin
  QryUtils.InitQuery(Query);

  with Query.SQL do begin
    Text :=
      'select * ' +
      'from z_PrmUv u ' +
        'left join z_Pere p on p.TabN = u.TabN ' +
      'where u.TabN = :TabN ' +
        'and u.Dt_Priem <= :DtBeg ' +
        'and (u.Dt_Uvoln >= :DtBeg or u.Dt_Uvoln is null)';

    if AllHireAssgn then
      Add(
        'and p.Dt_Beg >= u.Dt_Priem ' +
        'and (p.Dt_Beg <= u.Dt_Uvoln or u.Dt_Uvoln is null)')
    else
      Add(
        'and p.Dt_Beg >= ( ' +
          'select Max(Dt_Beg) ' +
          'from z_Pere ' +
          'where TabN = p.TabN ' +
            'and Dt_Beg >= u.Dt_Priem ' +
            'and Dt_Beg <= :DtBeg) ' +
        'and (Dt_Beg <= :DtEnd or :DtEnd = "30-DEC-1899")');

    Add(
      'order by p.Dt_Beg');
  end;
end;

//------------------------------------------------------------------------------
// Значение 30-DEC-1899 получаем в случаях, когда передаваемый TDateTime
// параметр равен нулю (т.е., не задан).
//------------------------------------------------------------------------------
class procedure SalaryUtils.ComposeSelAssigns(
  Qry: TQuery;
  // Выбрать перемещения даже если увольнение произошло до
  // запрашиваемого периода
  StrictPeriod: Boolean = true;
  // Не выбирать перемещения, сделанные вне приёма/увольнения
  FilterNoEmplmnt: Boolean = true
  );
begin
  QryUtils.InitQuery(Qry);

  with Qry.SQL do begin
    Text :=
      'select * from ( ' +
        // Перемещения
        'select * from ( ' +
          // Выбирает последнее перемещение до начала периода
          'select first 1 * ' +
          'from z_Pere ' +
          'where ' +
            'TabN = :EmplId ' +
            // Если начало периода не задано, не выбереем ничего,
            // если задан - последнее, раньше начала периода
            'and :PeriodStart <> "30-DEC-1899" and Dt_Beg < :PeriodStart ' +
          'order by Dt_Beg desc) ' +
        'union ' +
        // Выбирает перемещения внутри периода
        'select * ' +
        'from z_Pere ' +
        'where ' +
          'TabN = :EmplId ' +
          'and (:PeriodStart = "30-DEC-1899" ' +
            'or Dt_Beg >= :PeriodStart) ' +
          'and (:PeriodFinish = "30-DEC-1899" ' +
            'or Dt_Beg <= :PeriodFinish) ' +
      ') p';

    // Приёмы/увольнения
    if not FilterNoEmplmnt then
      Add('left');

    Add(
      'join z_PrmUv u on u.TabN = p.TabN ' +
          'and (u.Dt_Priem is null or u.Dt_Priem <= p.Dt_Beg) ' +
          'and (u.Dt_Uvoln is null or u.Dt_Uvoln >= p.Dt_Beg)');

    if StrictPeriod then
        // Теперь отфильтровываем по приёмам/увольнениям, потому что
        // последнее перемещение на начало периода может относиться к
        // приёму/увольнению, из предыдущего приёма/увоьнения, которое нас
        // не интересует. Если начало или конец периода не заданы, записи
        // попадают в выборку. Если дата приём или увольнения - null, тоже.
        // В остальных случаях - только если период приёма/увольнения
        // пересекается с периодом выборки.
      Add(
        'where (:PeriodFinish = "30-DEC-1899" ' +
            'or u.Dt_Priem is null or u.Dt_Priem <= :PeriodFinish) ' +
          'and (:PeriodStart = "30-DEC-1899" ' +
            'or u.Dt_Uvoln is null or u.Dt_Uvoln >= :PeriodStart)');

    Add(
      'order by p.Dt_Beg');
  end;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.PrepareSelAssigns(
  Qry: TQuery;
  StrictPeriod: Boolean = true;
  FilterNoEmplmnt: Boolean = true
  );
begin
  ComposeSelAssigns(Qry, StrictPeriod, FilterNoEmplmnt);
  Qry.Prepare;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.SelectAssigns(
  Qry: TQuery;
  EmplId: Integer;
  Period: TPeriod;
  StrictPeriod: Boolean = true;
  FilterNoEmplmnt: Boolean = true);
begin
  with Qry, Period do begin
    if Active then
      Close;

    if not Prepared then
      ComposeSelAssigns(Qry, StrictPeriod, FilterNoEmplmnt);

    ParamByName('EmplId').AsInteger := EmplId;
    ParamByName('PeriodStart').AsDateTime := Start;
    ParamByName('PeriodFinish').AsDateTime := Finish;

    Open;
  end;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.ComposeSelMinSals(Qry: TQuery);
begin
  QryUtils.InitQuery(Qry);

  with Qry.SQL do begin
    Text :=
      // Уровень нужен чтобы выполнить сортировку по имени,
      // а не по индексу поля
      'select * from ( ' +
        // Уровень нужен чтобы выполнить убывающую сортировку
        'select * from ( ' +
          'select first 1 * ' +
          'from z_TPdn ' +
          'where ' +
            ':PeriodStart = "30-DEC-1899" and 0 <> 0 ' +
            'or :PeriodStart <> "30-DEC-1899" and DtBeg < :PeriodStart ' +
          'order by DtBeg desc) ' +
        'union ' +
        'select * ' +
        'from z_TPdn ' +
        'where ' +
          '(:PeriodStart = "30-DEC-1899" ' +
            'or DtBeg >= :PeriodStart) ' +
          'and (:PeriodFinish = "30-DEC-1899" ' +
            'or DtBeg <= :PeriodFinish) ' +
        ') ' +
      'order by DtBeg';
  end;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.PrepareSelMinSals(Qry: TQuery);
begin
  ComposeSelMinSals(Qry);
  Qry.Prepare;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.SelectMinSals(Qry: TQuery; Period: TPeriod);
begin
  with Qry do begin
    if Active then
      Close;

    if not Prepared then
      ComposeSelMinSals(Qry);

    ParamByName('PeriodStart').AsDateTime := Period.Start;
    ParamByName('PeriodFinish').AsDateTime := Period.Finish;

    Open;
  end;
end;

//------------------------------------------------------------------------------
// Выбираем совместительские надбавки, действующие на заданную дату
//------------------------------------------------------------------------------
class procedure SalaryUtils.SelectSupplNadb(
  Query: TQuery;
  TabN: Integer;
  OnDate: TDateTime
);
begin
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Text :=
      'select * ' +
      'from z_Nadb n ' +
        'left join z_KdVidN v on v.VidN = n.VidN ' +
      'where n.TabN = :TabN ' +
        'and :OnDate >= n.Dt_Beg ' +
        'and (:OnDate <= n.Dt_End or n.Dt_End is null) ' +
        'and not v.Sovm is null and (v.Sovm = "1" or v.Sovm = "Y")';

    ParamByName('TabN').AsInteger := TabN;
    ParamByName('OnDate').AsDateTime := OnDate;
    Open;
  end;
end;

//------------------------------------------------------------------------------
// Собираем суммарный период по надбавкам
//------------------------------------------------------------------------------
class function SalaryUtils.GetSupplEmplSpan(QryNadb: TQuery): TSpan;
var
  Span: TSpan;
begin
  Result := DateUtils.InitPeriod;

  with QryNadb do begin
    First;

    while not Eof do begin
      Span.Start := FieldByName('Dt_Beg').AsDateTime;
      Span.Finish := FieldByName('Dt_End').AsDateTime;

      Result := DateUtils.JoinPeriods(Result, Span);
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
class function SalaryUtils.SelectInvList(
  OnDate: TDateTime;
  ByFamIO: Boolean = true
): TQuery;
begin
  Result := TQuery.Create(nil);

  SelectInvList(Result, OnDate);
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.SelectInvList(
  Query: TQuery;
  OnDate: TDateTime;
  ByFamIO: Boolean = true
);
begin
  QryUtils.InitQuery(Query);

  with Query do begin
    ComposeSelInvList(Query);
    ParamByName('OnDate').AsDateTime := OnDate;
    Open;
  end;
end;

//------------------------------------------------------------------------------
class procedure SalaryUtils.ComposeSelInvList(
  Query: TQuery;
  ByFamIO: Boolean = true
);
begin
  with Query.SQL do begin
    Text :=
      'select a.TabN, a.Inv, u.Fam, u.Ima, u.Otch, i.DtBeg, i.DtEnd ' +
      'from z_Pere a ' +
        'left join z_Upi u on u.TabN = a.TabN ' +
        'left join z_PrmUv h on h.TabN = a.TabN ' +
        'left join z_InvDocs i on i.TabN = a.TabN ' +
      'where a.Inv >= 1 ' +
        'and a.Dt_Beg = (' +
          'select max(Dt_Beg) ' +
          'from z_Pere ' +
          'where TabN = a.TabN ' +
            'and Dt_Beg <= :OnDate' +
        ') ' +
        'and (h.Dt_Priem <= :OnDate ' +
          'or h.Dt_Priem is null) ' +
        'and (h.Dt_Uvoln >= :OnDate ' +
          'or h.Dt_Uvoln is null) ' +
        'and (i.DtBeg <= :OnDate ' +
          'or i.DtBeg is null) ' +
        'and (i.DtEnd >= :OnDate ' +
          'or i.DtEnd is null)';

    if ByFamIO then
      Add('order by u.Fam, u.Ima, u.Otch')
    else
      Add('order by a.TabN');
  end;
end;

//------------------------------------------------------------------------------
class function SalaryUtils.PeekOznDoh(
  Query: TQuery;
  OznDohId: Integer
): Boolean;
begin
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Text :=
      'select * ' +
      'from z_OznDoh ' +
      'where OznDoh = :OznDohId';

    ParamByName('OznDohId').AsInteger := OznDohId;
    Open;

    Result := RecordCount > 0;
  end;
end;

end.
