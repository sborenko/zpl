unit PeriodsCorrelation;

interface

uses
  Db, DateLib, DsLib;

type
  Correlation = class
  private
    class procedure CorrelatePeriods;
  public
    class procedure CorrelateDataSetPeriods(PGuestRec, PHostDataSet: TDataSet;
      PDtBegFldName, PDtEndFldName, PWeightFldName: ShortString;
      PDecisionFunc: TDoubleSetFunc);
  end;

implementation

var
  GuestRec, HostDataSet: TDataSet;
  DtBegFldName, DtEndFldName, WeightFldName: ShortString;
  DecisionFunc: TDoubleSetFunc;

//------------------------------------------------------------------------------
// »спользуетс€ дл€ определени€ финального состо€ни€ периода при пересечении
// оригинальных и сторнированных периодов. ќкончательное состо€ние определ€етс€
// значением пол€ Weight.
//------------------------------------------------------------------------------
class procedure Correlation.CorrelateDataSetPeriods(
  PGuestRec, PHostDataSet: TDataSet;
  PDtBegFldName, PDtEndFldName, PWeightFldName: ShortString;
  PDecisionFunc: TDoubleSetFunc);
var
  GuestRemain: TPeriod;
begin
  GuestRec := PGuestRec;
  HostDataSet := PHostDataSet;
  DtBegFldName := PDtBegFldName;
  DtEndFldName := PDtEndFldName;
  WeightFldName := PWeightFldName;
  DecisionFunc := PDecisionFunc; 

  with HostDataSet, DateUtils do begin
    First;

    while not Eof do begin
      Correlation.CorrelatePeriods;
      Next;
    end;

    with GuestRec do begin
      GuestRemain.Start := FieldByName(DtBegFldName).AsDateTime;
      GuestRemain.Finish := FieldByName(DtEndFldName).AsDateTime;
    end;

    if not DateUtils.PeriodIsEmpty(GuestRemain) then begin
      Append;
      DsUtils.CopyRecord(GuestRec, HostDataSet);
      Post;
    end;
  end;
end;

//------------------------------------------------------------------------------
//  аждый из периодов обладает своим весом. ¬ процессе выполнени€ формируютс€
// новые периоды с весами, завис€щими от соотношени€ периодов.
//------------------------------------------------------------------------------
class procedure Correlation.CorrelatePeriods;
var
  Mark: TBookmark;
  Guest, Host,
  Intersection, Remain: TPeriod;
  GuestWeight, HostWeight: integer;
  GuestRemains, HostRemains: TPeriods;
begin
  with GuestRec, Guest do begin
    Start := FieldByName(DtBegFldName).AsDateTime;
    Finish := FieldByName(DtEndFldName).AsDateTime;
    GuestWeight := FieldByName(WeightFldName).AsInteger;
  end;

  with HostDataSet, Host do begin
    Start := FieldByName(DtBegFldName).AsDateTime;
    Finish := FieldByName(DtEndFldName).AsDateTime;
    HostWeight := FieldByName(WeightFldName).AsInteger;

    Mark := GetBookmark;
  end;

  with DateUtils do begin
    if not DecisionFunc(GuestRec, HostDataSet) then
      exit;

    Intersection := IntersectPeriods(Guest, Host);

    if PeriodIsEmpty(Intersection) then
      exit;

    SetLength(GuestRemains, 0);
    GuestRemains := SubtractPeriods(Guest, Host);

    SetLength(HostRemains, 0);
    HostRemains := SubtractPeriods(Host, Guest);

    // –азбираемс€ как гостевой период соотноситс€ с хоз€йским.
    if (Length(GuestRemains) > 0)
        and (GuestRemains[0].Finish < Host.Start) then begin
      // ≈сть "нависающий" начальный отрезок гостевого периода.
      // ѕишем его со своим весом.
      with HostDataSet do begin
        Append;
        DsUtils.CopyRecord(GuestRec, HostDataSet);
        FieldByName(DtBegFldName).AsDateTime := GuestRemains[0].Start;
        FieldByName(DtEndFldName).AsDateTime := GuestRemains[0].Finish;
        FieldByName(WeightFldName).AsInteger := GuestWeight;
        Post;
      end;
    end else
      // –азбираемс€ как хоз€йский период соотноситс€ с гостевым.
      if (Length(HostRemains) > 0)
          and (HostRemains[0].Finish < Guest.Start) then begin
        // √остевой период не полностью перекрывает хоз€йский.
        // ≈сть ненакрытый отрезок хоз€йского периода.
        DsUtils.InsertCopy(HostDataSet);
        with HostDataSet do begin
          FieldByName(DtBegFldName).AsDateTime := HostRemains[0].Start;
          FieldByName(DtEndFldName).AsDateTime := HostRemains[0].Finish;
          Post;
        end;
      end;

    // ѕишем перекрывающуюс€ область.
    with HostDataSet do begin
      GotoBookmark(Mark);
      FreeBookmark(Mark);

      Edit;
      FieldByName(DtBegFldName).AsDateTime := Intersection.Start;
      FieldByName(DtEndFldName).AsDateTime := Intersection.Finish;
      FieldByName(WeightFldName).AsInteger := HostWeight + GuestWeight;
      Post;
    end;

    // ≈сли есть ненакрытый завершающий отрезок хоз€йского периода ...
    Remain := CreateEmptyPeriod;

    if Length(HostRemains) = 2 then
      Remain := HostRemains[1]
    else if (Length(HostRemains) = 1)
        and DateUtils.EventIsAfterPeriod(
          HostRemains[0].Start, Intersection) then
      Remain := HostRemains[0];

    if not PeriodIsEmpty(Remain) then begin
      DsUtils.InsertCopy(HostDataSet);
      with HostDataSet do begin
        FieldByName(DtBegFldName).AsDateTime := Remain.Start;
        FieldByName(DtEndFldName).AsDateTime := Remain.Finish;
        FieldByName(WeightFldName).AsInteger := HostWeight;
        Post;
      end;
    end;

    // »змен€ем  онечный отрезок гостевого периода возвращаем в вызывающую функцию.
    if Length(GuestRemains) = 2 then
      Remain := GuestRemains[1]
    else if (Length(GuestRemains) = 1)
        and DateUtils.EventIsAfterPeriod(
          GuestRemains[0].Start, Intersection) then
      Remain := GuestRemains[0]
    else
      Remain := CreateEmptyPeriod;

    with GuestRec do begin
      Edit;
      FieldByName(DtBegFldName).AsDateTime := Remain.Start;
      FieldByName(DtEndFldName).AsDateTime := Remain.Finish;
      Post;
    end;
  end;
end;

end.
