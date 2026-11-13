unit TextLib;

interface

type
  TextUtils = class
  public
    class function PadZero(Value: ShortString; Count: word): ShortString;
    class function PadLeft(
      Str: string; Chr: char; Count: word): ShortString;
    class function PadRight(
      Str: string; Chr: char; Count: word): ShortString;
    class function ConcatStr(Destination,
      Part: string; Separator: ShortString = ' '): string;
    class procedure MergeStr(var Destination: string;
      Part: string; Separator: ShortString = ' ');
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class function TextUtils.PadZero(Value: ShortString; Count: word): ShortString;
begin
  Result := Format('%.' + IntToStr(Count) + 'd', [value]);
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class function TextUtils.PadLeft(
  Str: String; Chr: char; Count: word): ShortString;
var
  Len, I: integer;
begin
  Len := Length(Str);

  for I := Len to Count - 1 do
    Str := Chr + Str;

  Result := Str;
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class function TextUtils.PadRight(
  Str: String; Chr: char; Count: word): ShortString;
var
  Len, I: integer;
begin
  Len := Length(Str);

  for I := Len to Count - 1 do
    Str := Str + Chr;

  Result := Str;
end;


//------------------------------------------------------------------------------
class function TextUtils.ConcatStr(
  Destination, Part: string; Separator: ShortString = ' '): string;
begin
  Result := Destination;
  if Result <> '' then
    Result := Result + Separator;
  Result := Result + Part;
end;

//------------------------------------------------------------------------------
class procedure TextUtils.MergeStr(
  var Destination: string;
  Part: string; Separator: ShortString = ' ');
begin
  if Destination <> '' then
    Destination := Destination + Separator;
  Destination := Destination + Part;
end;

end.
