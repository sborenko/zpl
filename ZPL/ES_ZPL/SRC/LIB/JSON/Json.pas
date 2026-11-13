unit Json;

interface

uses
  JsonItem, JsonObject, JsonProperty;

type
  TJson = class
  public
    constructor Create;
    destructor Destroy; override;

    procedure AddItem(ParentKey: TKeyPath; Key: TItemKey; Item: TJsonItem);
    procedure Write(FilePathName: ShortString);
    procedure Parse(Input: string);

  private
    RootObject: TJsonObject;

    function ObjectByKey(Key: TKeyPath): TJsonObject;
  end;

implementation

uses
  Classes, SysUtils,
  JsonArray, JsonNumber, JsonString;

//------------------------------------------------------------------------------
constructor TJson.Create;
begin
  inherited Create;

  RootObject := TJsonObject.Create;
end;

//------------------------------------------------------------------------------
destructor TJson.Destroy;
begin
  RootObject.Destroy;
  
  inherited Destroy;
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
procedure TJson.Write(FilePathName: ShortString);
var
  JsonFile: TextFile;
begin
  AssignFile(JsonFile, FilePathName);
  Rewrite(JsonFile);

  RootObject.WriteJson(JsonFile, 0);

  CloseFile(JsonFile);
end;

//------------------------------------------------------------------------------
procedure TJson.Parse(Input: string);
begin
  RootObject := TJsonObject.Parse(Input);
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
  with TStringList.Create do begin
    Delimiter := '.';
    DelimitedText := Trim(Key);

    Obj := RootObject;

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
end;

end.
