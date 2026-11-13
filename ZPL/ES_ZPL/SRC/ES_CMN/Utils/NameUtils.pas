unit NameUtils;

interface

uses SysUtils;

type
  TNameUtils = class
    class function FirstInitial(Name: ShortString): ShortString;
    class function Initial(Name: ShortString): ShortString;
  end;

implementation

class function TNameUtils.FirstInitial(Name: ShortString): ShortString;
begin
  Result := Initial(Name);

  if Result = '' then
    Result := Result + '.'
end;

class function TNameUtils.Initial(Name: ShortString): ShortString;
begin
  Result := Trim(Copy(Name, 1, 1));

  if Result <> '' then
    Result := Result + '.';
end;

end.
