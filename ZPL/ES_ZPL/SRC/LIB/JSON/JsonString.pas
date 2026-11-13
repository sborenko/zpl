unit JsonString;

interface

uses JsonItem;

type
  TJsonString = class(TJsonItem)
  public
    constructor Create(Value: string);
    procedure WriteJson(var JsonFile: TextFile; Level: integer); override;
  private
    Value: string;
  end;

implementation

//------------------------------------------------------------------------------
constructor TJsonString.Create(Value: string);
begin
  Self.Value := Value;
end;

//------------------------------------------------------------------------------
procedure TJsonString.WriteJson(var JsonFile: TextFile; Level: integer);
begin
  WriteLn(JsonFile, Value);
end;

end.
