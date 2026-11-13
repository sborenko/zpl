unit TextUtils;

interface

type
  TTextUtils = class
  public
    class function PadZero(Value: ShortString; Count: word): ShortString;
    class function PadLeft(
      Str: string; Chr: char; Count: word): ShortString;
    class function PadRight(
      Str: string; Chr: char; Count: word): ShortString;
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class function TTextUtils.PadZero(Value: ShortString; Count: word): ShortString;
begin
  Result := Format('%.' + IntToStr(Count) + 'd', [value]);
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class function TTextUtils.PadLeft(
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
class function TTextUtils.PadRight(
  Str: String; Chr: char; Count: word): ShortString;
var
  Len, I: integer;
begin
  Len := Length(Str);

  for I := Len to Count - 1 do
    Str := Str + Chr;

  Result := Str;
end;

end.
