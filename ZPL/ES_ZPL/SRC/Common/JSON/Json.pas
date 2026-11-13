unit Json;

interface

uses
  JsonItem, JsonObject, JsonProperty;

type
  TJson = class
  public
    constructor Create(Root: TJsonItem);
    destructor Destroy; override;

    procedure AddItem(ParentKey: TKeyPath; Key: TItemKey; Item: TJsonItem);
    procedure Parse(Input: string);

  private
    Root: TJsonItem;

    function ObjectByKey(Key: TKeyPath): TJsonObject;
  end;

implementation

uses
  Classes, SysUtils,
  JsonArray, JsonNumber, JsonString;

//------------------------------------------------------------------------------
constructor TJson.Create(Root: TJsonItem);
begin
  Self.Root := Root;
end;

//------------------------------------------------------------------------------
destructor TJson.Destroy;
begin
  Root.Destroy;
end;

//------------------------------------------------------------------------------
procedure TJson.AddItem(ParentKey: TKeyPath; Key: TItemKey; Item: TJsonItem);
var
  Parent: TJsonObject;
begin
  Parent := ObjectByKey(ParentKey);

  if Parent <> nil then
    Parent.AddItem(Key, Item);
end;

//------------------------------------------------------------------------------
procedure TJson.Parse(Input: string);
begin
  Root := TJsonObject.Parse(Input);
end;

//------------------------------------------------------------------------------
// Находит объект по составному ключу. Разделитель - точка.
//------------------------------------------------------------------------------
function TJson.ObjectByKey(Key: TKeyPath): TJsonObject;
var
  I: integer;
  Obj: TJsonObject;
  Item: TJsonItem;
begin
(*
  with TStringList.Create do begin
    Delimiter := '.';
    DelimitedText := Trim(Key);

    Obj := Root;

    for I := 0 to Count - 1 do begin
      Item := Obj.ItemByKey(Strings[I]);

      if (Item = nil) or not (Item is TJsonObject) then begin
        Obj := nil;
        break;
      end;

      Obj := Item as TJsonObject;
    end; {for}

    Result := Obj;
    Free;
  end;
*)
end;

end.
