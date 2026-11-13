unit JsonProperty;

interface

uses
  JsonItem;

type
  TKeyPath = string;
  TItemKey = ShortString;

  TJsonProperty = class
    Key: TItemKey;
    Item: TJsonItem;
  public
    constructor Create(Key: TItemKey; Item: TJsonItem);
    procedure WriteJson(var JsonFile: TextFile; Level: integer);
    class function Parse(var Input: string): TJsonProperty;
  end;

implementation

//------------------------------------------------------------------------------
constructor TJsonProperty.Create(Key: TItemKey; Item: TJsonItem);
begin
  inherited Create;
end;

//------------------------------------------------------------------------------
procedure TJsonProperty.WriteJson(var JsonFile: TextFile; Level: integer);
begin
  Write(JsonFile, TJsonItem.Indent(Level) + Key + ': ');
  Item.WriteJson(JsonFile, Level + 1);
end;

//------------------------------------------------------------------------------
class function TJsonProperty.Parse(var Input: string): TJsonProperty;
var
  Position: integer;
begin
  Result := nil;
  Position := Pos(':', Input);

  if Position > 1 then begin
    Result := TJsonProperty.Create(
      Copy(Input, 1, Position - 1), TJsonItem.Parse(Input));
  end;
end;

end.
