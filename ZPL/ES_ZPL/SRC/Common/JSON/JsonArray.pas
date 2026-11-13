unit JsonArray;

interface

uses
  JsonCollection, JsonItem;

type
  TJsonArray = class(TJsonCollection)
  private
    Items: Array of TJsonItem;
  protected
    function GetItemCount: integer; override;

    function OpenBracket: char; override;
    function CloseBracket: char; override;
    procedure WriteItem(Indx: integer;
      var JsonFile: TextFile; Level: integer; Sep: ShortString); override;
  public
    procedure AddItem(Item: TJsonItem);
    class function Parse(Input: string): TJsonArray;
  end;

implementation

//------------------------------------------------------------------------------
procedure TJsonArray.AddItem(Item: TJsonItem);
var
  Len: integer;
begin
  Len := Length(Items);
  SetLength(Items, Len + 1);
  Items[Len] := Item;
end;

//------------------------------------------------------------------------------
function TJsonArray.OpenBracket: char;
begin
  Result := '[';
end;

//------------------------------------------------------------------------------
function TJsonArray.CloseBracket: char;
begin
  Result := ']';
end;

//------------------------------------------------------------------------------
function TJsonArray.GetItemCount: integer;
begin
  Result := Length(Items);
end;

//------------------------------------------------------------------------------
procedure TJsonArray.WriteItem(
  Indx: integer;
  var JsonFile: TextFile;
  Level: integer;
  Sep: ShortString);
begin
  Items[Indx].WriteJson(JsonFile, Level + 1, Sep);
end;

//------------------------------------------------------------------------------
class function TJsonArray.Parse(Input: string): TJsonArray;
begin
  Result := nil;
end;

end.
