unit SpanLib;

interface

uses
  Db, DbClient, DateLib;

type
  TSpansDescr = record
    DataSet: TDataSet;
    BegFldName,
    EndFldName: ShortString;
  end;

  TSinglePeriodHnd = procedure (Period: TPeriod) of object;
  TDoublePeriodHnd = procedure (Period1, Period2: TPeriod) of object;

  // <<< —крываем конструктор в промежуточном классе.
  TSpanHide = class
  private
    constructor Create; virtual;
  end;
  // >>>

  TSpanIter = class(TSpanHide)
  private
    Ds1, Ds2: TSpansDescr;
    Vals1, Vals2: TPeriods;

    CdsSpans: TClientDataSet;

    procedure Init;

    procedure IterateOuter(Ds: TSpansDescr; Handler: TSinglePeriodHnd); overload;
    procedure IterateOuter(Vals: TPeriods; Handler: TSinglePeriodHnd); overload;

    procedure IterateInner(
      Period: TPeriod; Ds: TSpansDescr; Handler: TDoublePeriodHnd); overload;
    procedure IterateInner(
      Period: TPeriod; Vals: TPeriods; Handler: TDoublePeriodHnd); overload;

    procedure IntersectOuter(Period: TPeriod); overload;
    procedure SubtractOuter(Period: TPeriod); overload;

    procedure IntersectInner(Period1, Period2: TPeriod); overload;
    procedure SubtractInner(Period1, Period2: TPeriod); overload;

    procedure AddSpan(Period: TPeriod);

  public
    constructor Create(Ds1, Ds2: TSpansDescr); reintroduce; overload;
    constructor Create(Ds: TSpansDescr; Vals: TPeriods); reintroduce; overload;

    constructor Create(Vals: TPeriods; Ds: TSpansDescr); reintroduce; overload;

    constructor Create(Vals1, Vals2: TPeriods); reintroduce; overload;

    destructor Destroy; override;

    procedure Intersect; overload;
    procedure Subtract; overload;

    procedure First;
    procedure Next;
    function Eof: boolean;
    function GetPeriod: TPeriod;

    function GetDescriptor: TSpansDescr;
  end;

  function InitSpansDescr(DataSet: TDataSet;
    BegFldName, EndFldName: ShortString): TSpansDescr;

implementation

const
  BEG_FLD_NAME = 'DtBeg';
  END_FLD_NAME = 'DtEnd';

//------------------------------------------------------------------------------
function InitSpansDescr(
  DataSet: TDataSet;
  BegFldName, EndFldName: ShortString): TSpansDescr;
begin
  Result.DataSet := DataSet;
  Result.BegFldName := BegFldName;
  Result.EndFldName := EndFldName;
end;

//------------------------------------------------------------------------------
constructor TSpanHide.Create;
begin
  inherited Create;
end;

//------------------------------------------------------------------------------
constructor TSpanIter.Create(Ds1, Ds2: TSpansDescr);
begin
  inherited Create;

  Self.Ds1 := Ds1;
  Self.Ds2 := Ds2;

  Init;
end; {Create}

//------------------------------------------------------------------------------
constructor TSpanIter.Create(Ds: TSpansDescr; Vals: TPeriods);
begin
  inherited Create;

  Ds1 := Ds;
  Vals2 := Vals;

  Init;
end;

//------------------------------------------------------------------------------
constructor TSpanIter.Create(Vals: TPeriods; Ds: TSpansDescr);
begin
  inherited Create;

  Vals1 := Vals;
  Ds2 := Ds;

  Init;
end;

//------------------------------------------------------------------------------
constructor TSpanIter.Create(Vals1, Vals2: TPeriods);
begin
  inherited Create;

  Self.Vals1 := Vals1;
  Self.Vals2 := Vals2;

  Init;
end;

//------------------------------------------------------------------------------
destructor TSpanIter.Destroy;
begin
  CdsSpans.Free;
end; {Destroy}

//------------------------------------------------------------------------------
procedure TSpanIter.Init;
begin
  CdsSpans := TClientDataSet.Create(nil);

  with CdsSpans do begin
    FieldDefs.Add(BEG_FLD_NAME, ftDateTime);
    FieldDefs.Add(END_FLD_NAME, ftDateTime);

    IndexDefs.Add('Primary', BEG_FLD_NAME, [ixPrimary]);
    CreateDataSet;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TSpanIter.Intersect;
begin
  if Assigned(Ds1.DataSet) then
    IterateOuter(Ds1, IntersectOuter)
  else
    IterateOuter(Vals1, IntersectOuter);
end;

//------------------------------------------------------------------------------
procedure TSpanIter.Subtract;
begin
  if Assigned(Ds1.DataSet) then
    IterateOuter(Ds1, SubtractOuter)
  else
    IterateOuter(Vals1, SubtractOuter);
end;

//------------------------------------------------------------------------------
procedure TSpanIter.IterateOuter(Ds: TSpansDescr; Handler: TSinglePeriodHnd);
var
  Mark: TBookmark;
  Period: TPeriod;
begin
  with Ds, DataSet do begin
    Mark := GetBookmark;
    First;

    while not Eof do begin
      Period := DateUtils.InitPeriod(
        FieldByName(BegFldName).AsDateTime,
        FieldByName(EndFldName).AsDateTime);

      Handler(Period);

      Next;
    end; {while}

    GotoBookmark(Mark);
  end; {with}
end; {IterateOuter}

//------------------------------------------------------------------------------
procedure TSpanIter.IterateOuter(Vals: TPeriods; Handler: TSinglePeriodHnd);
var
  I: integer;
begin
  for I := 0 to Length(Vals) - 1 do
    Handler(Vals[I]);
end;

//------------------------------------------------------------------------------
procedure TSpanIter.IntersectOuter(Period: TPeriod);
begin
  if Assigned(Ds2.DataSet) then
    IterateInner(Period, Ds2, IntersectInner)
  else
    IterateInner(Period, Vals2, IntersectInner);
end;

//------------------------------------------------------------------------------
procedure TSpanIter.SubtractOuter(Period: TPeriod);
begin
  if Assigned(Ds2.DataSet) then
    IterateInner(Period, Ds2, SubtractInner)
  else
    IterateInner(Period, Vals2, SubtractInner);
end;

//------------------------------------------------------------------------------
procedure TSpanIter.IterateInner(
  Period: TPeriod;
  Ds: TSpansDescr;
  Handler: TDoublePeriodHnd);
var
  Mark: TBookmark;
  Period2: TPeriod;
begin
  with Ds, DataSet do begin
    Mark := GetBookmark;
    First;

    while not Eof do begin
      Period2 := DateUtils.InitPeriod(
        FieldByName(BegFldName).AsDateTime,
        FieldByName(EndFldName).AsDateTime);

      Handler(Period, Period2);

      Next;
    end; {while}

    GotoBookmark(Mark);
  end; {with}
end; {IterateInner}

//------------------------------------------------------------------------------
procedure TSpanIter.IterateInner(
  Period: TPeriod;
  Vals: TPeriods;
  Handler: TDoublePeriodHnd);
var
  I: integer;
begin
  for I := 0 to Length(Vals) - 1 do
    Handler(Period, Vals[I]);
end; {IterateInner}

//------------------------------------------------------------------------------
procedure TSpanIter.IntersectInner(Period1, Period2: TPeriod);
var
  Period: TPeriod;
begin
  with DateUtils do begin
    Period := IntersectPeriods(Period1, Period2);

    if not PeriodIsEmpty(Period) then
      AddSpan(Period);
  end; {with}
end; {IntersectInner}

//------------------------------------------------------------------------------
procedure TSpanIter.SubtractInner(Period1, Period2: TPeriod);
var
  Periods: TPeriods;
  I: integer;
begin
  Periods := DateUtils.SubtractPeriods(Period1, Period2);

  for I := 0 to Length(Periods) do
    AddSpan(Periods[I]);
end;

//------------------------------------------------------------------------------
procedure TSpanIter.AddSpan(Period: TPeriod);
begin
  with CdsSpans do begin
    Append;
    FieldByName(BEG_FLD_NAME).AsDateTime := Period.Start;
    FieldByName(END_FLD_NAME).AsDateTime := Period.Finish;
    Post;
  end; {with}
end;

//------------------------------------------------------------------------------
procedure TSpanIter.First;
begin
  CdsSpans.First;
end;

//------------------------------------------------------------------------------
procedure TSpanIter.Next;
begin
  CdsSpans.Next;
end;

//------------------------------------------------------------------------------
function TSpanIter.Eof: boolean;
begin
  Result := CdsSpans.Eof;
end;

//------------------------------------------------------------------------------
function TSpanIter.GetPeriod: TPeriod;
begin
  with CdsSpans, DateUtils do
    Result := InitPeriod(FieldByName(BEG_FLD_NAME).AsDateTime,
      FieldByName(END_FLD_NAME).AsDateTime);
end;

//------------------------------------------------------------------------------
function TSpanIter.GetDescriptor: TSpansDescr;
begin
  with Result do begin
    DataSet := CdsSpans;
    BegFldName := BEG_FLD_NAME;
    EndFldName := END_FLD_NAME;
  end; {with}
end; {GetDescriptor}

end.
