unit JsonObject;

interface

uses
  JsonItem, JsonProperty;

type
  TJsonObject = class(TJsonItem)
  public
    Props: Array of TJsonProperty;

    procedure AddItem(Key: TItemKey; Item: TJsonItem);
    function ItemByKey(Key: TItemKey): TJsonItem;
    procedure WriteJson(var JsonFile: TextFile; Level: integer); override;

    class function Parse(Input: string): TJsonObject;
  end;

implementation

//------------------------------------------------------------------------------
procedure TJsonObject.WriteJson(var JsonFile: TextFile; Level: integer);
var
  I: integer;
  Indent: string;
begin
  Indent := Self.Indent(Level);
  
  WriteLn(JsonFile, Indent + '{');

  for I := 0 to Length(Props) - 1 do
    Props[I].WriteJson(JsonFile, Level + 1);

  WriteLn(JsonFile, Indent + '}');
end;

//------------------------------------------------------------------------------
class function TJsonObject.Parse(Input: string): TJsonObject;
var
  Prop: TJsonProperty;
begin
  Result := TJsonObject.Create;

  while true do begin
    Prop := TJsonProperty.Parse(Input);

    if Prop <> nil then
      SetLength(Result.Props, Length(Result.Props) + 1);
  end;
end;

//------------------------------------------------------------------------------
procedure TJsonObject.AddItem(Key: TItemKey; Item: TJsonItem);
begin
  SetLength(Props, Length(Props) + 1);
  Props[Length(Props)] := TJsonProperty.Create(Key, Item);
end;

//------------------------------------------------------------------------------
function TJsonObject.ItemByKey(Key: TItemKey): TJsonItem;
var
  I: integer;
  Prop: TJsonProperty;
begin
  Result := nil;

  for I := 0 to Length(Props) - 1 do begin
    Prop := Props[I];

    if (Prop.Key = Key) then begin
      Result := Prop.Item;
      break;
    end;
  end; {for}
end;

end.
