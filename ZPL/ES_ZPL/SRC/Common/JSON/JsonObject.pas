unit JsonObject;

interface

uses
  JsonCollection, JsonItem, JsonProperty;

type
  TJsonObject = class(TJsonCollection)
  private
    Props: Array of TJsonProperty;
  protected
    function GetItemCount: integer; override;
    function OpenBracket: char; override;
    function CloseBracket: char; override;
    procedure WriteItem(Indx: integer;
      var JsonFile: TextFile; Level: integer; Sep: ShortString); override;
  public
    constructor Create;
    procedure AddItem(Key: TItemKey; Item: TJsonItem);
    function ItemByKey(Key: TItemKey): TJsonItem;

    class function Parse(Input: string): TJsonObject;
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
constructor TJsonObject.Create;
begin
  inherited Create;
  SetLength(Props, 0);
end;

//------------------------------------------------------------------------------
function TJsonObject.OpenBracket: char;
begin
  Result := '{';
end;

//------------------------------------------------------------------------------
function TJsonObject.CloseBracket: char;
begin
  Result := '}';
end;

//------------------------------------------------------------------------------
function TJsonObject.GetItemCount: integer;
begin
  Result := Length(Props);
end;

//------------------------------------------------------------------------------
procedure TJsonObject.WriteItem(
  Indx: integer;
  var JsonFile: TextFile;
  Level: integer;
  Sep: ShortString);
begin
  Props[Indx].WriteJson(JsonFile, Level + 1, Sep);
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
var
  Len: integer;
begin
  Len := Length(Props);
  SetLength(Props, Len + 1);
  Props[Len] := TJsonProperty.Create(Key, Item);
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
