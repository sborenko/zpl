unit PeriodIter;

interface

uses
  Classes, DateLib;

type
  TJoinNotifyProc = procedure(JoinIncrease: integer) of object;

  TPeriodItem = class(TObject)
    private
      Period: TPeriod;
    public
      constructor Create(Period: TPeriod);
  end;

  TPeriodIter = class
    private
      // Result: TList;

      Ascending: boolean;
    public
      constructor Create(Ascending: boolean);
      destructor Destroy; override;

      // procedure Join(Notifier: TJoinNotifyProc);
      procedure Join2(JoinAdjucent: boolean = true);

      procedure First; virtual; abstract;
      procedure Next; virtual; abstract;
      procedure Prior; virtual; abstract;
      function Eof: boolean; virtual; abstract;
      function LastRecReached: boolean; virtual; abstract;

      procedure BookmarkItem; virtual; abstract;
      procedure GotoBookmark; virtual; abstract;

      procedure UpdateCurItem(Period: TPeriod); virtual; abstract;
      procedure DelCurItem; virtual; abstract;

      function CurItem: TPeriod; virtual; abstract;
  end;

implementation

//------------------------------------------------------------------------------
constructor TPeriodItem.Create(Period: TPeriod);
begin
  inherited Create;
  Self.Period := Period;
end;

//------------------------------------------------------------------------------
constructor TPeriodIter.Create(Ascending: boolean);
begin
  inherited Create;
  Self.Ascending := Ascending;
  // Result := TList.Create;
end;

//------------------------------------------------------------------------------
destructor TPeriodIter.Destroy;
begin
  inherited Destroy;
  // Result.Free;
end;

//------------------------------------------------------------------------------
// Производит объединение смежных или пересекающихся отрезков времени.
//------------------------------------------------------------------------------
{
procedure TPeriodIter.Join;
  procedure InnerJoin(Periods: TList; NewPeriod: TPeriod);
  var
    I: integer;
    JoinOccurred: boolean;
    JoinPeriod: TPeriod;
    PeriodItem: TPeriodItem;
  begin
    I := 0;
    JoinOccurred := false;

    while I < Periods.Count do
      with DateUtils do begin
        PeriodItem := TPeriodItem(Periods.Items[I]);
        JoinPeriod := JoinPeriods(PeriodItem.Period, NewPeriod);

        if PeriodIsEmpty(JoinPeriod) then
          if JoinOccurred and Ascending then begin
            // Слияние ранее уже произошло и исходный набор упорядочен.
            // Значит дальше слияний уже не будет.
            Periods.Insert(I, TPeriodItem.Create(NewPeriod));
            break;
          end else
            Inc(I)
        else begin
          JoinOccurred := true;
          // Удаляем старый элемент ...
          Periods.Delete(I);
          // а распухший новый готов слиться со следующим по индексу.
          NewPeriod := JoinPeriod;
        end;
      end;

    Periods.Insert(I, TPeriodItem.Create(NewPeriod));
  end;
begin
  Result.Clear;
  Result.Add(TPeriodItem.Create(DateUtils.CreatePeriod));

  First;
  while not Eof do begin
    InnerJoin(Result, CurItem);
    Next;
  end;
end;
}

//------------------------------------------------------------------------------
procedure TPeriodIter.Join2(JoinAdjucent: boolean = true);
var
  CurPeriod, NextPeriod: TPeriod;
  Joined,
  RecWasLast: boolean;
begin
  First;

  while not Eof do begin
    CurPeriod := CurItem;
    Joined := false;

    BookmarkItem;
    Next;

    while not Eof do begin
      NextPeriod := CurItem;

      with DateUtils do begin
        if PeriodsAreIntersected(CurPeriod, NextPeriod) or JoinAdjucent
          and PeriodsAreAdjucent(CurPeriod, NextPeriod) then begin

          CurPeriod := JoinPeriods(CurPeriod, NextPeriod, JoinAdjucent);
          Joined := true;

          RecWasLast := LastRecReached;
          DelCurItem;
          // Проверка нужна для случая, если DelCurItem удалил последнюю
          // запись. В этом случае, курсор переходит на предыдущую, не
          // выставляя признака Eof. Таким образом, цикл выполнится лишний раз
          // для предыдущей записи. Чтобы избежать этого, предварительно
          // проверяем на LastRecReached, и если - да, выходим из цикла.
          if RecWasLast then
            break;
        end else
          // Если join был, никаких действий не надо, присоединённый период
          // был удалён, следующие подтянулись на его место, а если не было:
          if Ascending then
            // Периоды упорядочены по началу, Join'а не было,
            // значит и дальше не будет. Выходим.
            break
          else
            // Переходим к следующему кандидату на присоединение.
            Next;
      end; {with}
    end; {while}

    GotoBookmark;

    if Joined then
      // DataSet должен быть updatable.
      // Т.е., если Query, то с UpdateSql.
      UpdateCurItem(CurPeriod)
    else
      Next;
  end;
end;

end.
