unit PeriodIterDataSet;

interface

uses
  Db, DateLib, PeriodIter;

type
  TDataSetPeriodIter = class(TPeriodIter)
    private
      DataSet: TDataSet;
      BegFldName, EndFldName: ShortString;

      Bookmark: TBookmark;
    public
      constructor Create(DataSet: TDataSet;
        BegFldName, EndFldName: ShortString; Ascending: boolean);

      procedure First; override;
      procedure Next; override;
      procedure Prior; override;
      function Eof: boolean; override;
      function LastRecReached: boolean; override;

      procedure BookmarkItem; override;
      procedure GotoBookmark; override;

      procedure UpdateCurItem(Period: TPeriod); override;
      procedure DelCurItem; override;

      function CurItem: TPeriod; override;
      property CurRec: TDataSet read DataSet;
  end;

implementation

uses Classes;

//------------------------------------------------------------------------------
constructor TDataSetPeriodIter.Create(
  DataSet: TDataSet;
  BegFldName, EndFldName: ShortString;
  Ascending: boolean);
begin
  inherited Create(Ascending);

  Self.DataSet := DataSet;
  Self.BegFldName := BegFldName;
  Self.EndFldName := EndFldName;
end;

//------------------------------------------------------------------------------
procedure TDataSetPeriodIter.First;
begin
  DataSet.First;
end;

//------------------------------------------------------------------------------
procedure TDataSetPeriodIter.Next;
begin
  DataSet.Next;
end;

//------------------------------------------------------------------------------
procedure TDataSetPeriodIter.Prior;
begin
  DataSet.Prior;
end;

//------------------------------------------------------------------------------
function TDataSetPeriodIter.Eof: boolean;
begin
  Result := DataSet.Eof
end;

//------------------------------------------------------------------------------
function TDataSetPeriodIter.LastRecReached: boolean;
begin
  with DataSet do begin
    Next;
    Result := Eof;

    // Если запись последняя, текущая не изменилась,
    // просто выставился, признак Eof, ...
    if not Eof then
      // ... иначе - возвращаемся на текущую.
      Prior;
  end;
end;

//------------------------------------------------------------------------------
procedure TDataSetPeriodIter.BookmarkItem;
begin
  Bookmark := DataSet.GetBookmark;
end;

//------------------------------------------------------------------------------
procedure TDataSetPeriodIter.GotoBookmark;
begin
  DataSet.GotoBookmark(Bookmark);
end;

//------------------------------------------------------------------------------
procedure TDataSetPeriodIter.UpdateCurItem(Period: TPeriod);
begin
  with DataSet do begin
    Edit;

    if Period.Start = 0 then
      FieldByName(BegFldName).AsString := ''
    else
      FieldByName(BegFldName).AsDateTime := Period.Start;

    if Period.Finish = 0 then
      FieldByName(EndFldName).AsString := ''
    else
      FieldByName(EndFldName).AsDateTime := Period.Finish;
      
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDataSetPeriodIter.DelCurItem;
begin
  DataSet.Delete;
end;

//------------------------------------------------------------------------------
function TDataSetPeriodIter.CurItem: TPeriod;
begin
  with DataSet do
    Result := DateUtils.InitPeriod(
      FieldByName(BegFldName).AsDateTime, FieldByName(EndFldName).AsDateTime);
end;

end.
