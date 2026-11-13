unit JsonString;

interface

uses
  JsonItem;

type
  TJsonString = class(TJsonItem)
  public
    constructor Create(Value: string);
    procedure WriteJson(
      var JsonFile: TextFile; Level: integer; Sep: ShortString); override;
  private
    Value: string;
  end;

implementation

//------------------------------------------------------------------------------
constructor TJsonString.Create(Value: string);
begin
  inherited Create;
  Self.Value := Value;
end;

//------------------------------------------------------------------------------
procedure TJsonString.WriteJson(
  var JsonFile: TextFile;
  Level: integer;
  Sep: ShortString);
begin
  WriteIndent(JsonFile, Level);
  WriteLn(JsonFile, QuatedString(Value) + Sep);
end;

end.
