unit PeriodIterArray;

interface

uses
  DateLib, PeriodIter;

type
  TArrayPeriodIter = class(TPeriodIter)
    private
      Periods: ^TPeriods;

      _CurIndx,
      Bookmark: integer;
    public
      constructor Create(var Periods: TPeriods; Ascending: boolean);

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
      property CurIndx: integer read _CurIndx;
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
constructor TArrayPeriodIter.Create(var Periods: TPeriods; Ascending: boolean);
begin
  inherited Create(Ascending);
  Self.Periods := @Periods;
end;

//------------------------------------------------------------------------------
procedure TArrayPeriodIter.First;
begin
  _CurIndx := 0;
end;

//------------------------------------------------------------------------------
procedure TArrayPeriodIter.Next;
begin
  Inc(_CurIndx);
end;

//------------------------------------------------------------------------------
procedure TArrayPeriodIter.Prior;
begin
  Dec(_CurIndx);
end;

//------------------------------------------------------------------------------
function TArrayPeriodIter.Eof: boolean;
begin
  Result := _CurIndx = Length(Periods^);
end;

//------------------------------------------------------------------------------
function TArrayPeriodIter.LastRecReached: boolean;
begin
  Result := _CurIndx = Length(Periods^) - 1;
end;

//------------------------------------------------------------------------------
procedure TArrayPeriodIter.BookmarkItem;
begin
  Bookmark := _CurIndx;
end;

//------------------------------------------------------------------------------
procedure TArrayPeriodIter.GotoBookmark;
begin
  _CurIndx := Bookmark;
end;

//------------------------------------------------------------------------------
procedure TArrayPeriodIter.UpdateCurItem(Period: TPeriod);
begin
  Periods^[_CurIndx] := Period;
end;

//------------------------------------------------------------------------------
procedure TArrayPeriodIter.DelCurItem;
var
  I, Len: integer;
begin
  Len := Length(Periods^);

  for I := _CurIndx + 1 to Len - 1 do
    Periods^[I - 1] := Periods^[I];

  SetLength(Periods^, Len - 1);
end;

//------------------------------------------------------------------------------
function TArrayPeriodIter.CurItem: TPeriod;
begin
  if _CurIndx = Length(Periods^) then
    raise Exception.Create('Выход за границы массива TPeriods.');

  Result := Periods^[_CurIndx];
end;

end.
