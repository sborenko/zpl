unit JsonArray;

interface

uses
  JsonItem;

type
  TJsonArray = class(TJsonItem)
  private
    Items: Array of TJsonItem;
  public
    procedure AddItem(Item: TJsonItem);
    procedure WriteJson(var JsonFile: TextFile; Level: integer); override;
    class function Parse(Input: string): TJsonArray;
  end;

implementation


//------------------------------------------------------------------------------
procedure TJsonArray.AddItem(Item: TJsonItem);
begin
  SetLength(Items, Length(Items) + 1);
end;

//------------------------------------------------------------------------------
procedure TJsonArray.WriteJson(var JsonFile: TextFile; Level: integer);
var
  I: integer;
  Indent: string;
begin
  WriteLn(JsonFile, '');

  Indent := Self.Indent(Level);
  WriteLn(JsonFile, Indent + '[');

  for I := 0 to Length(Items) - 1 do
    Items[I].WriteJson(JsonFile, Level + 1);

  WriteLn(JsonFile, Indent + ']');
end;

//------------------------------------------------------------------------------
class function TJsonArray.Parse(Input: string): TJsonArray;
begin
  Result := nil;
end;

end.
