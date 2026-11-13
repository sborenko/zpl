unit DModMain;

interface

uses
  SysUtils, Classes, DB, DBClient, DBTables, DateLib, SpanLib, IFaceProgress;

type
  TDmMain = class(TDataModule, IProgress)
    DbSpov: TDatabase;
    DbOpi: TDatabase;
    QrySpov: TQuery;
    QryHires: TQuery;
    QryAssigns: TQuery;
    CdsSpans: TClientDataSet;
    CdsErrors: TClientDataSet;
    QryPerson: TQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    // Обработчики индикации прогресса выполения.
    SetStagesTotalHnd: TSetStagesTotalHnd;
    StartStageHnd: TStartStageHnd;
    CheckCancelHnd: TCheckCancelHnd;
    ProgressHnd: TProgressHnd;
    EndStageHnd: TEndStageHnd;
    CancelStageHnd: TCancelStageHnd;
    
    NumIdent: ShortString;

    function OpenSpov(TableName: ShortString): TQuery;

    procedure PrepareHires;
    procedure PrepareAssigns;

    procedure OpenPerson(NumIdent: ShortString);
    procedure OpenHires(EmplId: integer; Period: TPeriod);
    procedure OpenAssigns(EmplId: integer; Period: TPeriod);

    procedure CreateCds(Cds: TClientDataSet);
    procedure ProcessAppx1(TableName: ShortString);

    function SplitSpovByHires(EmplId: integer; Period: TPeriod): TSpanIter;
    procedure SplitHiresByAssigns(EmplId: integer; HiresIter: TSpanIter);

    function AssignToZo(AssignRec: TDataSet): integer;
    procedure WriteSpan(Cds: TClientDataSet; NumIdent: ShortString;
      EmplId: integer; Period: TPeriod; Zo: integer; R: ShortString = '');

    procedure CheckResults(EmplId: integer; SpovRec: TDataSet);
    procedure CheckSpov(TableName: ShortString);
  public
    procedure Start;

    procedure SetStagesTotalFunc(handler: TSetStagesTotalHnd);
    procedure SetStartStageFunc(handler: TStartStageHnd);
    procedure SetCheckCancelFunc(handler: TCheckCancelHnd);
    procedure SetProgressFunc(handler: TProgressHnd);
    procedure SetEndStageFunc(handler: TEndStageHnd);
    procedure SetCancelStageFunc(handler: TCancelStageHnd);
  end;

var
  DmMain: TDmMain;

implementation

uses
  DATABASENAME, DsLib, Math, QryLib, TextLib, Variants;

const
  EMPL_CATEG_PPS = 1;

  T6_ZO_CMN = 1;         // Общие основания
  T6_ZO_INV = 2;         // Инвалид
  T6_ZO_CHILD_CARE = 20; // Уход за ребёнком
  T6_ZO_PPS = 25;        // Проф.преп.сост.
  T6_ZO_CPH = 26;        // Гражд.прав.дог.
  T6_ZO_BOLN = 29;       // Больнич.
  T6_ZO_PPS_INV = 32;    // Пр.преп.сост.инвалид
  T6_ZO_BOLN_INV = 36;   // Больничн.инв.
  T6_ZO_DEKR = 42;       // Декретные
  T6_ZO_DEKR_INV = 43;   // Декр.инв.
  T6_ZO_MOB = 47;        // Мобилизованный

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TDmMain.DataModuleCreate(Sender: TObject);
begin
  DbOpi.AliasName := DATABASE_ALIAS;

  CreateCds(CdsSpans);
  CreateCds(CdsErrors);

  QryPerson.Prepare;
  PrepareHires;
  PrepareAssigns;
end;

//------------------------------------------------------------------------------
procedure TDmMain.DataModuleDestroy(Sender: TObject);
begin
  QryPerson.UnPrepare;
  QryHires.UnPrepare;
  QryAssigns.UnPrepare;
end;

//------------------------------------------------------------------------------
procedure TDmMain.Start;
begin
  // Show progress.
  if Assigned(SetStagesTotalHnd) then
    SetStagesTotalHnd(
      'Сравнение признака инвалидности в СПОВ и базе данных.', 3);

  ProcessAppx1('j0510107_1.dbf');
  ProcessAppx1('j0510107_2.dbf');
  ProcessAppx1('j0510107_3.dbf');
end; {Start}

//------------------------------------------------------------------------------
procedure TDmMain.CreateCds(Cds: TClientDataSet);
begin
  with Cds, FieldDefs do begin
    Add('NumIdent', ftString, 10);
    Add('EmplId', ftInteger);
    Add('DtBeg', ftDateTime);
    Add('DtEnd', ftDateTime);
    Add('Zo', ftInteger);
    Add('R', ftString, 1);

    IndexDefs.Add('Primary', 'Zo', [ixPrimary]);

    CreateDataSet;
  end; {with}
end; {CreateResultCds}

//------------------------------------------------------------------------------
procedure TDmMain.ProcessAppx1(TableName: ShortString);
var
  StageName: ShortString;
  EmplId: integer;
  Mnth, Year: word;
  Date: TDateTime;
  Period: TPeriod;
  HireIter: TSpanIter;
  Terminated: boolean;
begin
  // Show progress.
  StageName := 'Сравнение таблицы ' + TableName;
  Terminated := false;

  if Assigned(CheckCancelHnd) and CheckCancelHnd then begin
    if Assigned(CancelStageHnd) then
      CancelStageHnd(StageName);
    exit;
  end;

  CdsErrors.EmptyDataSet;

  OpenSpov(TableName);

  // Show progress.
  if Assigned(StartStageHnd) then
    StartStageHnd(StageName, QrySpov.RecordCount);

  with QrySpov do begin
    while not (Eof or Terminated) do begin
      NumIdent := FieldByName('NumIdent').AsString;
      EmplId := 0;

      OpenPerson(NumIdent);

      if QryPerson.RecordCount > 0 then
        EmplId := QryPerson.FieldByName('TabN').AsInteger;

      while (FieldByName('NumIdent').AsString = NumIdent)
          and not (Eof or Terminated) do begin

        Mnth := FieldByName('Pay_Mnth').AsInteger;
        Year := FieldByName('Pay_Year').AsInteger;
        Date := EncodeDate(Year, Mnth, 1);
        with DateUtils do
          Period := InitPeriod(Date, EndOfMonth(Date));

        // Разбиваем периоды Spov периодами найма.
        HireIter := SplitSpovByHires(EmplId, Period);
        // Разбиваем периоды найма перемещениями.
        SplitHiresByAssigns(EmplId, HireIter);
        HireIter.Free;

        while (FieldByName('NumIdent').AsString = NumIdent)
            and (FieldByName('Pay_Mnth').AsInteger = Mnth)
            and (FieldByName('Pay_Year').AsInteger = Year)
            and not (Eof or Terminated) do begin

          // Show progress.
          if Assigned(CheckCancelHnd) and CheckCancelHnd then begin
            Terminated := true;
            break;
          end;

          // Ищем в сформированных результатах текущую запись Spov.
          CheckResults(EmplId, QrySpov);

          // Show progress.
          if Assigned(ProgressHnd) then
            ProgressHnd;

          Next;
        end; {while}

        // Ищем в записях Spov сформированные результаты.
        CheckSpov(TableName);

        CdsSpans.EmptyDataSet;
      end; {while EmplId}

      QryPerson.Close;
    end; {while Eof}

    QrySpov.Close;

    with CdsErrors do
      SaveToFile(TableName + '.cds');

  // Show progress.
  if Assigned(CheckCancelHnd) and CheckCancelHnd then begin
    if Assigned(CancelStageHnd) then
      CancelStageHnd(StageName);
  end else
    if Assigned(EndStageHnd) then
      EndStageHnd;
  end; {with}
end; {ProcessAppx1}

//------------------------------------------------------------------------------
function TDmMain.SplitSpovByHires(
  EmplId: integer;
  Period: TPeriod): TSpanIter;
var
  Periods: TPeriods;
begin
  OpenHires(EmplId, Period);

  SetLength(Periods, 1);
  Periods[0] := Period;

  Result := TSpanIter.Create(
    Periods, InitSpansDescr(QryHires, 'Dt_Priem', 'Dt_Uvoln'));

  Result.Intersect;

  QryHires.Close;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SplitHiresByAssigns(
  EmplId: integer;
  HiresIter: TSpanIter);
var
  Period: TPeriod;
  Date, AssignBeg, AssignEnd: TDateTime;
  Zo: integer;
  FirstAssign: boolean;
begin
  with HiresIter do begin
    First;

    while not Eof do begin
      Period := GetPeriod;

      AssignBeg := Period.Start;
      Zo := 0;
      FirstAssign := true;

      OpenAssigns(EmplId, Period);

      with QryAssigns do begin
        while not Eof do begin
          Date := FieldByName('Dt_Beg').AsDateTime;

          if FirstAssign then begin
            AssignBeg := Max(Period.Start, Date);
            Zo := AssignToZo(QryAssigns);
            FirstAssign := false;
          end else begin
            AssignEnd := Date - 1;

            // AssignEnd может оказаться меньшей, если первый AssignBeg меньше
            // начала периода, и значением было выбрано начало периода,
            // а второй AssignEnd совпадает с началом периода. В этом случае
            // пропускаем создание. Оно произойдёт на следующей итерации или
            // при выходе из цикла.
            if AssignEnd >= AssignBeg then
              WriteSpan(CdsSpans, NumIdent, EmplId,
                DateUtils.InitPeriod(AssignBeg, AssignEnd), Zo);

            AssignBeg := Date;
            Zo := AssignToZo(QryAssigns);
          end;

          Next;
        end; {while}

        Close;
      end; {with}

      WriteSpan(CdsSpans, NumIdent, EmplId,
        DateUtils.InitPeriod(AssignBeg, Period.Finish), Zo);

      Next;
    end; {while}
  end; {with}
end; {SplitPeriodByAssigns}

//------------------------------------------------------------------------------
function TDmMain.OpenSpov(TableName: ShortString): TQuery;
begin
  Result := QrySpov;
  QryUtils.InitQuery(Result);

  with Result do begin
    SQL.Add(
      'select distinct NumIdent, Pay_Mnth, Pay_Year, Zo ' +
      'from ' + TableName + ' ' +
      'where Zo in (2, 32, 36, 43) ' +
      'order by NumIdent, Pay_Year, Pay_Mnth, Zo');

    Open;
  end; {with}
end; {OpenSpov}

//------------------------------------------------------------------------------
procedure TDmMain.OpenPerson(NumIdent: ShortString);
begin
  with QryPerson do begin
    ParamByName('NumIdent').AsString := NumIdent;

    Open;
  end; {with}
end; {OpenPerson}

//------------------------------------------------------------------------------
procedure TDmMain.PrepareHires;
begin
  QryHires.SQL.Add(
    'select * from z_PrmUv ' +
    'where TabN = :EmplId ' +
      'and Dt_Priem <= :PeriodFinish ' +
      'and (Dt_Uvoln >= :PeriodStart ' +
        'or Dt_Uvoln is null) ' +
    'order by Dt_Priem'
  );
end; {PrepareHires}

//------------------------------------------------------------------------------
procedure TDmMain.OpenHires(EmplId: integer; Period: TPeriod);
begin
  with QryHires do begin
    ParamByName('EmplId').AsInteger := EmplId;
    ParamByName('PeriodStart').AsDateTime := Period.Start;
    ParamByName('PeriodFinish').AsDateTime := Period.Finish;

    Open;
  end; {with}
end; {OpenHires}

//------------------------------------------------------------------------------
// Выбираем перемещения, которые действовали в данном периоде, т.е., последнее
// перед периодом и все в периоде.
//------------------------------------------------------------------------------
procedure TDmMain.PrepareAssigns;
begin
  QryAssigns.SQL.Add(
    'select * ' +
    'from z_Pere p ' +
    'where TabN = :EmplId ' +
      'and (Dt_Beg = ( ' +
        'select max(Dt_Beg) ' +
        'from z_Pere ' +
        'where TabN = p.TabN ' +
        'and Dt_Beg < :PeriodStart) ' +
        'or Dt_Beg >= :PeriodStart and Dt_Beg <= :PeriodFinish) ' +
    'order by Dt_Beg'
  );
end; {OpenAssigns}

//------------------------------------------------------------------------------
// Выбираем перемещения, которые действовали в данном периоде, т.е., последнее
// перед периодом и все в периоде.
//------------------------------------------------------------------------------
procedure TDmMain.OpenAssigns(EmplId: integer; Period: TPeriod);
begin
  with QryAssigns do begin
    ParamByName('EmplId').AsInteger := EmplId;
    ParamByName('PeriodStart').AsDateTime := Period.Start;
    ParamByName('PeriodFinish').AsDateTime := Period.Finish;

    Open;
  end; {with}
end; {OpenAssigns}

//------------------------------------------------------------------------------
function TDmMain.AssignToZo(AssignRec: TDataSet): integer;
begin
  with AssignRec do begin
    if FieldByName('KdKatP').AsInteger = EMPL_CATEG_PPS then
      Result := T6_ZO_PPS
    else
      Result := T6_ZO_CMN;

    if FieldByName('Inv').AsInteger > 0 then
      if Result = T6_ZO_PPS then
        Result := T6_ZO_PPS_INV
      else
        Result := T6_ZO_INV;
  end; {with}
end; {AssignToZo}

//------------------------------------------------------------------------------
procedure TDmMain.WriteSpan(
  Cds: TClientDataSet;
  NumIdent: ShortString;
  EmplId: integer;
  Period: TPeriod;
  Zo: integer;
  R: ShortString = '');
begin
  with Cds do begin
    Append;
    FieldByName('NumIdent').AsString := NumIdent;
    FieldByName('EmplId').AsInteger := EmplId;
    FieldByName('DtBeg').AsDateTime := Period.Start;
    FieldByName('DtEnd').AsDateTime := Period.Finish;
    FieldByName('Zo').AsInteger := Zo;
    FieldByName('R').AsString := R;
    Post;
  end; {with}
end; {WriteMismatch}

//------------------------------------------------------------------------------
// Ищем записи, соответствующие записям Spov, в сформированных результатах.
//------------------------------------------------------------------------------
procedure TDmMain.CheckResults(EmplId: integer; SpovRec: TDataSet);
var
  Zo: integer;
  Date: TDateTime;
  Period: TPeriod;
begin
  with SpovRec do begin
    Zo := FieldByName('Zo').AsInteger;

    if not CdsSpans.Locate('Zo', Zo, []) then begin
      Date := EncodeDate(FieldByName('Pay_Year').AsInteger,
        FieldByName('Pay_Mnth').AsInteger, 1);

      with DateUtils do
        Period := InitPeriod(Date, EndOfMonth(Date));

      WriteSpan(CdsErrors, FieldByName('NumIdent').AsString,
        EmplId, Period, Zo, 'S');
    end;
  end; {with}
end; {CheckResults}

//------------------------------------------------------------------------------
// Ищем записи, соответствующие сформированным результатам, в записях Spov.
//------------------------------------------------------------------------------
procedure TDmMain.CheckSpov(TableName: ShortString);
var
  EndOfFile: boolean;
  Mark: TBookmark;
  Date: TDate;
begin
  with QrySpov do begin
    EndOfFile := Eof;
    Mark := GetBookmark;
  end; {with}

  with CdsSpans do begin
    First;

    while not Eof do begin
      Date := DateUtils.Decode(FieldByName('DtBeg').AsDateTime);

      if not QrySpov.Locate('NumIdent;Pay_Year;Pay_Mnth;Zo', VarArrayOf([
          FieldByName('NumIdent').AsString, Date.Year, Date.Mnth,
          FieldByName('Zo').AsInteger]), []) then

        with CdsErrors do begin
          Append;
          DsUtils.CopyRecord(CdsSpans, CdsErrors);
          FieldByName('R').AsString := 'D';
          Post;
        end; {with}

      Next;
    end; {while}
  end; {with}

  with QrySpov do begin
    GotoBookmark(Mark);
    // Восстанавливаем Eof, потерянный при Bookmark'ах, если он был.
    if EndOfFile then
      Next;
  end; {with}
end; {CheckSpov}

//------------------------------------------------------------------------------
procedure TDmMain.SetStagesTotalFunc(handler: TSetStagesTotalHnd);
begin
  SetStagesTotalHnd := handler;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SetStartStageFunc(handler: TStartStageHnd);
begin
  StartStageHnd := handler;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SetCheckCancelFunc(handler: TCheckCancelHnd);
begin
  CheckCancelHnd := handler;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SetProgressFunc(handler: TProgressHnd);
begin
  ProgressHnd := handler;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SetEndStageFunc(handler: TEndStageHnd);
begin
  EndStageHnd := handler;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SetCancelStageFunc(handler: TCancelStageHnd);
begin
  CancelStageHnd := handler;
end;

end.
