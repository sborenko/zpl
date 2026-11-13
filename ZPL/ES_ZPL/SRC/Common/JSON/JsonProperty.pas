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
    procedure WriteJson(
      var JsonFile: TextFile; Level: integer; Sep: ShortString);
    class function Parse(var Input: string): TJsonProperty;
  end;

implementation

//------------------------------------------------------------------------------
constructor TJsonProperty.Create(Key: TItemKey; Item: TJsonItem);
begin
  inherited Create;
  Self.Key := Key;
  Self.Item := Item;
end;

//------------------------------------------------------------------------------
procedure TJsonProperty.WriteJson(
  var JsonFile: TextFile;
  Level: integer;
  Sep: ShortString);
begin
  Write(JsonFile,
    TJsonItem.GetIndent(Level) + TJsonItem.QuatedString(Key) + ':');

  Item.WriteJson(JsonFile, 0, Sep);
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
