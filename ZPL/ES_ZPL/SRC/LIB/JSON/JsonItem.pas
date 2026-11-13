unit JsonItem;

interface

uses
  SysUtils;

type
  TJsonItem = class
  public
    class function Parse(var Input: string): TJsonItem;
    procedure WriteJson(var JsonFile: TextFile; Level: integer); virtual; abstract;
    class function Indent(Level: integer): string;
  private
    class function ValueIsObject(var Input: string): boolean;
    class function ValueIsArray(var Input: string): boolean;
    class function ValueIsString(var Input: string): boolean;
    class function ValueIsNumber(var Input: string): boolean;
    class function ValueIsDelimited(var Input: string; Delimiter: string): boolean;

    class function GetObject(var Input: string): TJsonItem;
    class function GetArray(var Input: string): TJsonItem;
    class function GetString(var Input: string): TJsonItem;
    class function GetNumber(var Input: string): TJsonItem;
    class function ExtractFromUntil(var Input: string; Delimiter: string): string;
  end;

implementation

uses
  JsonArray, JsonNumber, JsonObject, JsonString;

//------------------------------------------------------------------------------
class function TJsonItem.Parse(var Input: string): TJsonItem;
begin
  if ValueIsObject(Input) then
    Result := GetObject(Input)
  else if ValueIsArray(Input) then
    Result := GetArray(Input)
  else if ValueIsString(Input) then
    Result := GetString(Input)
  else if ValueIsNumber(Input) then
    Result := GetNumber(Input)
  else
    Result := nil;
end;

//------------------------------------------------------------------------------
class function TJsonItem.ValueIsObject(var Input: string): boolean;
begin
  Result := ValueIsDelimited(Input, '{');
end;

//------------------------------------------------------------------------------
class function TJsonItem.ValueIsArray(var Input: string): boolean;
begin
  Result := ValueIsDelimited(Input, '[');
end;

//------------------------------------------------------------------------------
class function TJsonItem.ValueIsString(var Input: string): boolean;
begin
  Result := ValueIsDelimited(Input, '"');
end;

//------------------------------------------------------------------------------
class function TJsonItem.ValueIsDelimited(var Input: string; Delimiter: string): boolean;
begin
  Input := TrimLeft(Input);

  Result := (Length(Input) > 0) and (Input[1] = Delimiter);

  if Result then
    Input := Copy(Input, 2, Length(Input));
end;

//------------------------------------------------------------------------------
class function TJsonItem.GetObject(var Input: string): TJsonItem;
begin
  Result := TJsonObject.Parse(ExtractFromUntil(Input, '}'));
end;

//------------------------------------------------------------------------------
class function TJsonItem.GetArray(var Input: string): TJsonItem;
begin
  Result := TJsonArray.Parse(ExtractFromUntil(Input, ']'));
end;

//------------------------------------------------------------------------------
class function TJsonItem.GetString(var Input: string): TJsonItem;
begin
  Result := TJsonString.Create(ExtractFromUntil(Input, '"'));
end;

//------------------------------------------------------------------------------
class function TJsonItem.GetNumber(var Input: string): TJsonItem;
begin
  Result := TJsonNumber.Create(StrToFloat(ExtractFromUntil(Input, ' ')));
end;

//------------------------------------------------------------------------------
class function TJsonItem.ExtractFromUntil(var Input: string; Delimiter: string): string;
var
  Position: integer;
begin
  if Delimiter = ' ' then begin
    Result := Input;
    Input := '';
  end else begin
    Position := Pos(Input, Delimiter);

    Result := Copy(Input, 1, Position - 1);
    Input := Copy(Input, Position + 1, Length(Input));
  end;
end;

//------------------------------------------------------------------------------
class function TJsonItem.ValueIsNumber(var Input: string): boolean;
begin
  Result :=
    not (ValueIsObject(Input) or ValueIsArray(Input) or ValueIsString(Input));

  if Result then
    try
      StrToFloat(Input);
    except
      Result := false;
    end;
end;

//------------------------------------------------------------------------------
class function TJsonItem.Indent(Level: integer): string;
const
  IndentSize = 2;
begin
  Result := StringOfChar(' ', Level * IndentSize);
end;

end.
