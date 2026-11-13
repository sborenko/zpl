unit Appx1And6Stage;

interface

uses
  DbClient, DbTables, TopLevelStage, PeriodStage, IFaceProgressState, DateLib;

type
  TAppx1And6Stage = class(TTopLevelStage)
  private
    ReportCurMnth: TDateTime;

    MnthStage: TPeriodStage;

    procedure InitData;
    procedure FreeData;

    procedure PrepareEmplListQry;
//    procedure PrepareEmplmntsQry;
    procedure PrepareAssignmntsQry;
    procedure PreparePaymntsQry;
    procedure PrepareDisableDocs;
    procedure PrepareEsvPercQry;

    // Kd_Ptv - Получаем из Emplmnts, суммируя отрезки.
    // Kd_Nzp - Объединение отрезков Paymnts.Финально вычитаем из Emplmnts.
    // Kd_Np  - Объединение отрезков отпусков, больничных, неоплачиваемых.
    //          Финально пересекаем с Emplmnts.
    // Кd_Vp  - Суммирование отрезков декретных видов.

  public
    QryEmplList,
    QryEmplmnts,
    QryAssignmnts,
    QryPaymnts,
    QryDisableDocs,
    QryEsvPerc: TQuery;

    procedure Start(ProgressState: IProgressState); override;

    function StageName: ShortString; override;
    function StageItemsTotal: integer; override;

    procedure Process; override;
  end;

implementation

uses
  SysUtils, Db, ReportSpov, Appx1And6MnthStage, ProgressStage, QryLib,
  Appx1TblWriter;

const
  // MNTH_COUNT = 3;
  // С 1.1.2025 - помесячно
  MNTH_COUNT = 1;

//------------------------------------------------------------------------------
procedure TAppx1And6Stage.Start(ProgressState: IProgressState);
begin
  InitData;
  inherited Start(ProgressState);
  FreeData;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6Stage.InitData;
begin
  with SpovReport do
    // ReportCurMnth := EncodeDate(Year, DateUtils.FirstMnthOfQuart(Quart), 1);
    // С 1.1.2025 - помесячно
    ReportCurMnth := EncodeDate(Year, Mnth, 1);

  PrepareEmplListQry;
//  PrepareEmplmntsQry;
  PrepareAssignmntsQry;
  PreparePaymntsQry;
  PrepareDisableDocs;
  PrepareEsvPercQry;

  MnthStage := TAppx1And6MnthStage.Create(Self);
  Appx1Writer.SetEnvironment(
    SpovReport, Self, MnthStage as TAppx1And6MnthStage);
end;

//------------------------------------------------------------------------------
procedure TAppx1And6Stage.FreeData;
begin
  MnthStage.Free;

  QryEmplList.Free;
//  QryEmplmnts.Free;
  QryAssignmnts.Free;
  QryPaymnts.Free;
  QryDisableDocs.Free;
  QryEsvPerc.Free;
end;

//------------------------------------------------------------------------------
function TAppx1And6Stage.StageName: ShortString;
begin
  Result := 'Формирование Приложений 1 и 6.';
end;

//------------------------------------------------------------------------------
function TAppx1And6Stage.StageItemsTotal: integer;
begin
  Result := MNTH_COUNT;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6Stage.Process;
begin
  // Чтобы обработать только один месяц, добавляем условие:
  // IF CurStageIndx = <МЕСЯЦ> THEN // Значение месяца: от 0 до 2.
  // IF CurStageIndx = 0 THEN
  with MnthStage, DateUtils do begin
    Init(InitPeriod(ReportCurMnth, EndOfMonth(ReportCurMnth)));
    Start(Self.ProgressState);
    ReportCurMnth := NextMonth(ReportCurMnth);
  end;
  inherited Process;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6Stage.PrepareEmplListQry;
var
  Stmt: string;
begin
  Stmt :=
    'select distinct s.TabN, u.Id, u.Fam, u.Ima, u.Otch, u.Pol, u.UkrCitiz ' +
    'from z_Sps s ' +
      'left join z_Upi u on u.TabN = s.TabN ' +
    'where DtProc = :DtProc ';

  with SpovReport do
    if EmplIds <> '' then
      Stmt := Stmt + 'and s.TabN in (' + EmplIds + ') ';

  Stmt := Stmt + 'order by s.TabN';

  QryEmplList := TQuery.Create(nil);
  QryUtils.InitQuery(QryEmplList);

  with QryEmplList do begin
    SQL.Add(Stmt);
    Prepare;
    SQL.SaveToFile('SelEmplList.sql');
  end;
end;

//------------------------------------------------------------------------------
{
procedure TAppx1And6Stage.PrepareEmplmntsQry;
begin
  QryEmplmnts := TQuery.Create(nil);
  QryUtils.InitQuery(QryEmplmnts);

  with QryEmplmnts do begin
    SQL.Add(
      'select ' +
        '"x" ' +
      'from z_PrmUv ' +
      'where ' +
        'TabN = :TabN ' +
        'and Dt_Priem <= :PeriodEnd ' +
        'and (Dt_Uvoln >= :PeriodBeg or Dt_Uvoln is null)');
    Prepare;
  end;
end;
}

//------------------------------------------------------------------------------
// Выбираем приёмы/увольнения принадлежащими перемещениями и надбавками.
// Из перемещений можно получить параметры основной работы: процент, категорию,
// из надбавов - совместительских работ и дополнительных начислений.
//------------------------------------------------------------------------------
procedure TAppx1And6Stage.PrepareAssignmntsQry;
begin
  QryAssignmnts := TQuery.Create(nil);
  QryUtils.InitQuery(QryAssignmnts);

  with QryAssignmnts do begin
    SQL.Add(
      'select ' +
        'pu.Dt_Priem, pu.Dt_Uvoln, p.Dt_Beg P_DtBeg, p.PrcWrkTime, p.Sovm, ' +
        'n.Dt_Beg N_DtBeg, n.Dt_End, n.VidN, n.Prc_WT, n.Kd_Sovm ' +
      'from z_PrmUv pu ' +
        'left join z_Pere p on p.TabN = pu.TabN ' +
          'and p.Dt_Beg >= pu.Dt_Priem ' +
          'and (p.Dt_Beg <= pu.Dt_Uvoln or pu.Dt_Uvoln is null) ' +
        'left join z_Nadb n on n.TabN = pu.TabN ' +
          // Сильно строгого сравнения не применяем, потому что возможно,
          // когда происходит "техническое" увольнение с последующим приёмом,
          // надбавки предыдущего приёма/увольнения продолжают действовать. Ну,
          // а если их закрывают и открывают, работать будет тоже:
          {
          'and n.Dt_Beg <= pu.Dt_Priem ' +
          'and (n.Dt_End >= n.Dt_Priem or n.Dt_End is null) ' +
          }
          // ... а вот так - строго:
          'and n.Dt_Beg >= pu.Dt_Priem ' +
          'and (n.Dt_Beg <= pu.Dt_Uvoln or pu.Dt_Uvoln is null) ' +
          // ... общее и для строго и для - не:
          'and (n.Dt_Beg is null ' +
            'or (n.dt_beg <=  :PeriodEnd ' +
              'and (n.dt_end >= :PeriodBeg or n.dt_end is null))) ' +
      'where ' +
        'pu.TabN = :TabN ' +
        'and pu.Dt_Priem <= :PeriodEnd ' +
        'and (pu.Dt_Uvoln >= :PeriodBeg or pu.Dt_Uvoln is null) ' +
      'order by ' +
        'pu.Dt_Priem, p.Dt_Beg, n.Dt_Beg');

    Prepare;
    SQL.SaveToFile('SelAssigns.sql');
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6Stage.PreparePaymntsQry;
begin
  QryPaymnts := TQuery.Create(nil);
  QryUtils.InitQuery(QryPaymnts);

  with QryPaymnts do begin
    SQL.Add(
      'select ' +
        'n.TabN, n.ZaMesGod, n.DtProc, n.VidN, n.Dt_Beg, n.Dt_End, ' +
        'n.KdKatP, n.PdN, n.Sovm N_Sovm, n.Prr, n.Storn, ' +
        'v.Sp_Pf, v.CBudg, v.Sovm, ' +
//      i.DtBeg, i.DtEnd, ' +
        'Round(Sum(n.Summa), 2) Summa ' +
        ', Sum(n.Chas) Chas ' + ///!!!
      'from ' +
        'z_Nu n ' +
        'left join z_KdVidN v on v.VidN = n.VidN ' +
//      'left join z_InvDocs i on i.TabN = n.Tabn ' +
//          'and (n.Dt_Beg <= i.DtEnd or i.DtEnd is null) ' +
//          'and n.Dt_End >= i.DtBeg ' +
      'where ' +
        'n.TabN = :TabN ' +
        'and n.DtProc >= :PeriodBeg and n.DtProc <= :PeriodEnd ' +
        'and (' +
          // Все начисления (кроме Прочих, которые
          // фактически являются удержаниями)
          'n.VidN < "5000" and not n.VidN in ("2705", "2723", "2724") ' +
            'and v.Sp_Pf = "1" ' +
          // Средняя ЗП по мобилизации. Т.е., мобилизован.
          'or n.VidN = "1210" ' +
          // Декретные
          'or n.VidN = "2602" ' +
          // Неоплачиваемые виды: невыясн.прич., прогулы, отпуска б/опл.
          'or n.VidN > "5000" and n.VidN < "6000" ' +
//            'and not n.VidN in ("5001", "5002") ' +
            // Стало: 223/250; включили в отчёт 5002
            'and not n.VidN in ("5001", "5007") ' +
          // Различные ДоМинЗП и ЕСВ с ДоМинЗП
          'or n.VidN >= "8711" and n.VidN <= "8717"' +
        ') ' +
        // 'and n.Storn <> "Y" ' +
      'group by ' +
        'n.TabN, n.ZaMesGod, n.DtProc, n.VidN, n.Dt_Beg, n.Dt_End, ' +
        'n.KdKatP, n.Pdn, n.Sovm, n.Prr, n.Storn, ' +
        'v.Sp_Pf, v.CBudg, v.Sovm ' +
//        , i.DtBeg, i.DtEnd ' +
      'having Sum(n.Chas) > 0 or Round(Sum(n.Summa), 2) <> 0 ' + ///!!!
        'or n.VidN in ("5005", "5009", "5010", "5011", "5012") ' +
      'order by ' +
        'n.TabN, n.ZaMesGod, n.VidN, n.Dt_Beg');

    Prepare;
    SQL.SaveToFile('SelPaymnts.sql');
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6Stage.PrepareDisableDocs;
begin
  QryDisableDocs := TQuery.Create(nil);
  QryUtils.InitQuery(QryDisableDocs);

  with QryDisableDocs do begin
    SQL.Add(
      'select * ' +
      'from z_InvDocs ' +
      'where TabN = :EmplId ' +
      'order by DtBeg desc');

    SQL.SaveToFile('SelDisableDocs.sql');
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
procedure TAppx1And6Stage.PrepareEsvPercQry;
begin
  QryEsvPerc := TQuery.Create(nil);
  QryUtils.InitQuery(QryEsvPerc);

  with QryEsvPerc do begin
    SQL.Add(
      'select ' +
        'first 1 PrcCmn, PrcInv, PrcBln, PrcBlnInv, PrcDekr, PrcDekrInv ' +
      'from ' +
        'z_TEsvP ' +
      'where ' +
        'DtBeg <= :DtBeg ' +
      'order by DtBeg desc');

    SQL.SaveToFile('SelEntSocPerc.sql');
    Prepare;
  end;
end;

end.
