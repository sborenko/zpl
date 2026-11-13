unit StringUtils;

interface

type
  TStrUtils = class
    class function ConcatStr(
      Destination, Part: string; Separator: ShortString = ' '): string;

    class function ZeroToStr(Value: integer): ShortString;
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
class function TStrUtils.ConcatStr(
  Destination, Part: string; Separator: ShortString = ' '): string;
begin
    Result := Destination;
    if Result <> '' then
      Result := Result + Separator;
    Result := Result + Part;
end;

//------------------------------------------------------------------------------
class function TStrUtils.ZeroToStr(Value: integer): ShortString;
begin
  Result := '';

  if Value <> 0 then
    Result := IntToStr(Value);
end;

end.
