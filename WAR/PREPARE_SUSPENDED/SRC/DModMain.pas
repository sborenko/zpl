unit DModMain;

interface

uses
  AppCmn, Classes, DateLib, DB, DBClient, DBTables, Provider, SysUtils, Windows;

type
  TDmMain = class(TDataModule)
    QryCmn: TQuery;
    Database: TDatabase;
    QryEmplList: TQuery;
    QryAllows: TQuery;
    UpdAllows: TUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    ProcMnthBeg,
    ProcMnthEnd: TDateTime;
    EmplIds: ShortString;
    ShowProgress: TProgressProc;

    CdsAllows,
    AllowsBuff: TClientDataSet;

    EmplId: Integer;

    function PrepSuspEmpls: Boolean;

    procedure AddDepart1900;

    procedure OpenMnthEmplList;
    procedure ProcessEmployee;

    procedure RemovePaymnts;
    procedure RemoveRecalcDeviats;

    procedure ProcessEmplAllows;
    procedure SelectSuspAllows;

    procedure PrepareEmplAllowsQry;
    procedure PrepareAllowUpdSql;

    procedure CreateSuspAllowCds;
    function FieldFilter(FieldName: ShortString): Boolean;

    function ProcessPayPeriod(PayPeriod: TPeriod): TDateTime;
    procedure CreateNewSuspend(Period: TPeriod);

    procedure SaveNewAllows;

    procedure DeleteDeviats(PayMnthBeg: TDateTime);
    procedure AddRecalcDeviat(PayMnthBeg: TDateTime);

    PROCEDURE REMOVE_SUSPEND_ALLOWS;
    PROCEDURE ADD_8802;

  public
    class function Run(ProcDate: TDateTime; EmplIds: ShortString;
      ZipPath, WarPath: ShortString; Steps: StepSet;
      ShowProgress: TProgressProc): Boolean;

    class procedure Cancel;
    function Running: Boolean;
  end;

var
  DmMain: TDmMain;

implementation

uses
  CdsLib, Controls, DATABASENAME, DsLib, FileLib, FileOper, Forms, Math,
  MonthEmplList, PathLib, QryLib, TextLib, ZipLib;

var
  _Running: Boolean;
  
{$R *.dfm}

//------------------------------------------------------------------------------
class function TDmMain.Run(
  ProcDate: TDateTime;
  EmplIds: ShortString;
  ZipPath, WarPath: ShortString;
  Steps: StepSet;
  ShowProgress: TProgressProc): Boolean;
begin
  DmMain := TDmMain.Create(nil);

  DmMain.ProcMnthBeg := ProcDate;
  DmMain.ProcMnthEnd := DateUtils.EndOfMonth(ProcDate);
  DmMain.EmplIds := EmplIds;
  DmMain.ShowProgress := ShowProgress;

  with DmMain do begin
    try
      // Операции с базами данных:
      // создание backup'а последней базы "войны",
      // разворачивание последнего backup'а рабочей базы данных.
      Result :=
        ArchOper.Run(ZipPath, WarPath, Steps, ShowProgress);

      // Подготовка актуального списка приостановленных сотрудников,
      // формирование отклонений с инверсией приостановочных надбавок.
      if StepPrepSuspEmpls in Steps then
        Result :=
          Result and PrepSuspEmpls;

      if Result then
        ShowProgress(0, #13#10'ОБРАБОТКА ЗАВЕРШЕНА.')
      else
        ShowProgress(0, #13#10'ОБРАБОТКА ПРЕРВАНА.');
    finally
        Free;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.DataModuleCreate(Sender: TObject);
begin
  PrepareEmplAllowsQry;
end;

//------------------------------------------------------------------------------
procedure TDmMain.DataModuleDestroy(Sender: TObject);
begin
  CdsAllows.Free;
  AllowsBuff.Free;
end;

//------------------------------------------------------------------------------
// Подготовка актуального списка приостановленных сотрудников,
// формирование отклонений с инверсией приостановочных надбавок.
//------------------------------------------------------------------------------
function TDmMain.PrepSuspEmpls: Boolean;
var
  EmplCnt: Integer;
begin
  ShowProgress(0, 'Подготовка приостановленных сотрудников.');

  Screen.Cursor := crHourGlass;
  _Running := true;

  try
    with DataBase do begin
      AliasName := DATABASE_ALIAS;
      Connected := true;
    end;

    // Добавляем подразделение, в которое будут перемещены все приостановленные.
    AddDepart1900;

    // Удаляем старый и создаём новый список текущего месяца
    with MnthEmplList do begin
      Delete(ProcMnthBeg);
      Create(ProcMnthBeg, EmplIds, ShowProgress);
    end;

    OpenMnthEmplList;
    EmplCnt := 0;

// NEW APROACH <--
    REMOVE_SUSPEND_ALLOWS;
// --> NEW APROACH
 
    with QryEmplList do
    while not Eof and Running do begin
      ProcessEmployee;
      Inc(EmplCnt);
      Next;
    end;

    if not Running then begin
      // Canceled
      Result := false;
      ShowProgress(0, 'Обработка прервана');
    end else begin
      Result := true;
      ShowProgress(1, 'Обработано ' + IntToStr(EmplCnt) + ' сотрудников.');
      ShowProgress(0, STEP_DONE);
    end;
  except
    Result := false;
    ShowProgress(0, STEP_ERROR);
  end;

  _Running := false;
  DataBase.Connected := false;

  Screen.Cursor := crDefault;
end;

//------------------------------------------------------------------------------
function TDmMain.Running: Boolean;
begin
  Result := _Running;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class procedure TDmMain.Cancel;
begin
  _Running := false;
end;

//------------------------------------------------------------------------------
procedure TDmMain.AddDepart1900;
var
  AIndx, Indx: Integer;
  ShouldCreate: Boolean;
begin
  with QryUtils, QryCmn do begin
    InitQuery(QryCmn);

    SQL.Add(
      'select "x" ' +
      'from z_KdObj ' +
      'where KdObj = 1900');
    Open;

    ShouldCreate := RecordCount = 0;
    ReleaseQuery(QryCmn);

    if ShouldCreate then begin
      // Определяем требуемые значения AIndex, Indx, чтобы правильно разместить
      // новое подразделение в списке подразделений.
      InitQuery(QryCmn);

      SQL.Add(
        'select max(AIndx) AIndx, max(Indx) Indx ' +
        'from z_KdObj ' +
        'where KdObj < 2000');
      Open;
      AIndx := FieldByName('AIndx').AsInteger;
      Indx := FieldByName('Indx').AsInteger;

      ReleaseQuery(QryCmn);

      // Создаём новое подразделение, в которое переведём всех отстранённых
      InitQuery(QryCmn);

      SQL.Add(
        'insert into z_KdObj (KdSps, KdObj, KdObj_2, ShObj, NmObj, ' +
          'AIndx, PIndx, Lvl, Indx, HSch, KdSpz) ' +
        'values (1, 1900, 0, "Призупин.", "ПРИЗУПИНЕНІ СПІВРОБ.", ' +
          ':AIndx, 0, 1, :Indx, "F", 0)');
      ParamByName('AIndx').AsInteger := AIndx;
      ParamByName('Indx').AsInteger := Indx;
      ExecSQL;

      ReleaseQuery(QryCmn);
    end;
  end;
end;

//------------------------------------------------------------------------------
// Выбираем всех, у кого до конца месяца расчёта были "приостановки".
//------------------------------------------------------------------------------
procedure TDmMain.OpenMnthEmplList;
begin
  QryUtils.InitQuery(QryEmplList);

  with QryEmplList do begin
    SQL.Add(
      'select distinct TabN ' +
      'from z_Sps ' +
      'where KdObj = 1900 ' +
      'order by TabN');
    Open;
  end;
end;

//------------------------------------------------------------------------------
// Обработка приостановленного сотрудника.
//------------------------------------------------------------------------------
procedure TDmMain.ProcessEmployee;
begin
  EmplId := QryEmplList.FieldByName('TabN').AsInteger;

  ShowProgress(1, 'Табельный номер: ' + IntToStr(EmplId), QryEmplList.Bof);
  Application.ProcessMessages;

  RemovePaymnts;
  RemoveRecalcDeviats;

// NEW APROACH <--
  ADD_8802;

  // Обрабатываем приостановочные надбавки.
//  ProcessEmplAllows;
// --> NEW APROACH
end;

//------------------------------------------------------------------------------
// Удалить начисл./удерж. сотрудника за расчётный месяц.
//------------------------------------------------------------------------------
procedure TDmMain.RemovePaymnts;
begin
  QryUtils.InitQuery(QryCmn);

  with QryCmn do begin
    SQL.Add(
      'delete from z_Nu ' +
      'where TabN = :TabN ' +
        'and DtProc = :DtProc');

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := ProcMnthBeg;
    ExecSQL;
  end;

  QryUtils.ReleaseQuery(QryCmn);
end;

//------------------------------------------------------------------------------
procedure TDmMain.RemoveRecalcDeviats;
begin
  QryUtils.InitQuery(QryCmn);

  with QryCmn do begin
    SQL.Add(
      'delete from z_Otkl ' +
      'where TabN = :TabN ' +
        'and DtProc = :DtProc ' +
        'and VidN in ("8801", "8802")');

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := ProcMnthBeg;
    ExecSQL;
  end;

  QryUtils.ReleaseQuery(QryCmn);
end;

//------------------------------------------------------------------------------
// Обрабатываем приостановочные надбавки.
//------------------------------------------------------------------------------
procedure TDmMain.ProcessEmplAllows;
var
  PayPeriod: TPeriod;
  SuspBegDt: TDateTime;
begin
  SelectSuspAllows;
  CreateSuspAllowCds;
  PrepareAllowUpdSql;

  with QryAllows, DateUtils do begin
    First;
    SuspBegDt := 0;

    while not Eof do begin
      // Если дата пуста, создаём период из даты начала надбавки.
      // Иначе работаем с ним
      if SuspBegDt = 0 then
        // Месяц, в котором начала действовать приостановка
        PayPeriod := CreateMnthPeriod(FieldByName('Dt_Beg').AsDateTime)
      else
        PayPeriod := CreateMnthPeriod(SuspBegDt);

      PayPeriod := IntersectPeriods(PayPeriod, CreatePeriod(
        FieldByName('Dt_Priem').AsDateTime,
        FieldByName('Dt_Uvoln').AsDateTime));

      SuspBegDt :=
        ProcessPayPeriod(PayPeriod);
      // Next выполняется внутри ProcessEmplPayPeriod
      // Если осталась часть надбавки не завершённая в данном периоде,
      // вернёт начало незавершённой части. Иначе - ноль

      DeleteDeviats(PayPeriod.Start);
      AddRecalcDeviat(PayPeriod.Start);

      // Незавершённая надбавка
      if SuspBegDt > ProcMnthEnd then
        break;
    end;

    if SuspBegDt > ProcMnthEnd then
      Delete;
  end;

  SaveNewAllows;
end;

//------------------------------------------------------------------------------
// Обрабатываем надбавки QryAllows (начиная с текущей), действовавшие в
// заданный PayPeriod,
//------------------------------------------------------------------------------
function TDmMain.ProcessPayPeriod(PayPeriod: TPeriod): TDateTime;
var
  SuspendPeriod: TPeriod;
  PayRemains,
  SuspRemains: TPeriods;
begin
  Result := 0;
  SetLength(SuspRemains, 0);

  with QryAllows, DateUtils do begin
    repeat
      // Для создания инверсных надбавок используем буфер,
      // потому что оригинальная надбавка к моменту записи последнего "хвоста"
      // может быть уже удалена
      with AllowsBuff do begin
        Edit;
        DsUtils.CopyRecord(QryAllows, AllowsBuff);
        Post;
      end;

      SuspendPeriod := IntersectPeriods(
        CreatePeriod(FieldByName('Dt_Beg').AsDateTime,
          FieldByName('Dt_End').AsDateTime),
        CreatePeriod(FieldByName('Dt_Priem').AsDateTime,
          FieldByName('Dt_Uvoln').AsDateTime));

      // Соотношения периодов
      PayRemains := SubtractPeriods(PayPeriod, SuspendPeriod);
      SuspRemains := SubtractPeriods(SuspendPeriod, PayPeriod);

      // Если вычитание отрезало начало PayPeriod'а, создаём новую надбавку
      if SubtractHasHead(PayRemains, SuspendPeriod) then
        CreateNewSuspend(GetSubtractHead(PayRemains));

      if SubtractHasTail(SuspRemains, PayPeriod) then
        // Хвост надбавки выходит за пределы PayPeriod'а.
        // Следующий будет инициализироваться этой же надбавкой
        Result := GetSubtractTail(SuspRemains).Start
      else
        // Надбавка обработана полностью. Удаляем
        Delete;

      // Определяем остатки PayPeriod'а
      if SubtractHasTail(PayRemains, SuspendPeriod) then
        PayPeriod := GetSubtractTail(PayRemains)
      else
        PayPeriod := InitPeriod;
    until Eof or PeriodIsEmpty(PayPeriod);

    if not PeriodIsEmpty(PayPeriod) then
      CreateNewSuspend(PayPeriod);
  end;
end;

//------------------------------------------------------------------------------
// Выбираем надбавки, начавшиеся до конца месяца расчёта, с относящимися к ним
// приёмами/увольнениями. Выбираем на конец месяца, потому что приостановить
// могли в середине месяца.
//------------------------------------------------------------------------------
procedure TDmMain.PrepareEmplAllowsQry;
begin
  QryUtils.InitQuery(QryAllows);

  with QryAllows do begin
    SQL.Add(
      'select n.*, pu.Dt_Priem, pu.Dt_Uvoln ' +
      'from z_Nadb n ' +
        'join z_PrmUv pu on pu.TabN = n.TabN ' +
          'and (pu.Dt_Priem <= n.Dt_End or n.Dt_End is null) ' +
          'and (pu.Dt_Uvoln >= n.Dt_Beg or pu.Dt_Uvoln is null) ' +
      'where n.TabN = :TabN ' +
        'and n.VidN in ("5009", "5010") ' +
        'and Dt_Beg <= :EndOfMnth ' +
      'order by Dt_Beg');
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmMain.PrepareAllowUpdSql;
var
  I: Integer;
  FldsClause,
  ValsClause: String;
begin
  if UpdAllows.InsertSQL.Text = '' then
    with CdsAllows, FieldDefs, TextUtils do begin
      for I := 0 to Count - 1 do begin
        FldsClause := ConcatStr(FldsClause, Fields[I].FieldName, ', ');
        ValsClause := ConcatStr(ValsClause, ':' + Fields[I].FieldName, ', ');
      end;

      with UpdAllows.InsertSQL do begin
        Add('insert into z_Nadb ');
        Add('(' + FldsClause + ') ');
        Add('values ');
        Add('(' + ValsClause + ')');
      end;
    end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SelectSuspAllows;
begin
  with QryAllows do begin
    Close;
    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('EndOfMnth').AsDateTime := ProcMnthEnd;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.CreateSuspAllowCds;
begin
  // Cds для инверсных периодов отстранения
  if not Assigned(CdsAllows) then begin
    CdsAllows := CdsUtils.CreateCds(QryAllows, FieldFilter);

    with CdsAllows do begin
      Open;
      IndexDefs.Add('Primary', 'Dt_Beg', [ixPrimary]);
      IndexName := 'Primary';
    end;
  end else
    with CdsAllows do begin
      EmptyDataSet;
      First;
    end;

  // Буферный Cds
  if not Assigned(AllowsBuff) then begin
    AllowsBuff := CdsUtils.CreateCds(QryAllows, FieldFilter);
    with AllowsBuff do begin
      Append;
      Post;
    end;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmMain.FieldFilter(FieldName: ShortString): Boolean;
begin
  Result := (FieldName <> 'DT_PRIEM') and (FieldName <> 'DT_UVOLN');
end;

//------------------------------------------------------------------------------
// Создаём новую приостановку за данный период из текущей надбавки.
//------------------------------------------------------------------------------
procedure TDmMain.CreateNewSuspend(Period: TPeriod);
begin
  with CdsAllows do begin
    Append;
    DsUtils.CopyRecord(AllowsBuff, CdsAllows);
    FieldByName('Dt_Beg').AsDateTime := Period.Start;
    FieldByName('Dt_End').AsDateTime := Period.Finish;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SaveNewAllows;
begin
  with CdsAllows do
    SaveToFile('NewSuspAllows.cds');

  // Записываем новые приостановки в базу данных
  DsUtils.CopyRowset(CdsAllows, QryAllows);
  QryAllows.ApplyUpdates;
end;

//------------------------------------------------------------------------------
procedure TDmMain.DeleteDeviats(PayMnthBeg: TDateTime);
begin
  QryUtils.InitQuery(QryCmn);

  with QryCmn do begin
    SQL.Add(
      'delete from z_Otkl ' +
      'where TabN = :TabN and ZaMesGod = :ZaMesGod');

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('ZaMesGod').AsDateTime := PayMnthBeg;
    ExecSQL;
  end;

  QryUtils.ReleaseQuery(QryCmn);
end;

//------------------------------------------------------------------------------
procedure TDmMain.AddRecalcDeviat(PayMnthBeg: TDateTime);
begin
  QryUtils.InitQuery(QryCmn);

  with QryCmn do begin
    SQL.Add(
      'insert into z_Otkl ' +
        '(TabN, VidN, KdObj, DtProc, ZaMesGod) ' +
      'values ' +
        '(:TabN, "8801", 1900, :DtProc, :ZaMesGod)');

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := ProcMnthBeg;
    ParamByName('ZaMesGod').AsDateTime := PayMnthBeg;
    ExecSQL;
  end;

  QryUtils.ReleaseQuery(QryCmn);
end;

//------------------------------------------------------------------------------
PROCEDURE TDmMain.REMOVE_SUSPEND_ALLOWS;
BEGIN
  QryUtils.InitQuery(QryCmn);

  with QryCmn do begin
    SQL.Add(
      'DELETE FROM Z_NADB ' +
      'WHERE VIDN IN ("5009", "5010")');

    if EmplIds <> '' then
      SQL.Add(
        'AND TABN IN (' + EmplIds + ')');
    ExecSQL;
  end;

  QryUtils.ReleaseQuery(QryCmn);
END;

//------------------------------------------------------------------------------
PROCEDURE TDmMain.ADD_8802;
BEGIN
  QryUtils.InitQuery(QryCmn);

  with QryCmn do begin
    SQL.Add(
      'insert into z_Otkl ' +
        '(TabN, VidN, KdObj, DtProc, ZaMesGod) ' +
      'values ' +
        '(:TabN, "8802", 1900, :DtProc, "04/01/2022")');

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := ProcMnthBeg;
    ExecSQL;
  end;

  QryUtils.ReleaseQuery(QryCmn);
END;

end.

