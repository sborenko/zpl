unit JsonNumber;

interface

uses
  JsonItem;

type
  TJsonNumber = class(TJsonItem)
  public
    constructor Create(Value: double);
    procedure WriteJson(var JsonFile: TextFile; Level: integer); override;
  private
    Value: double;
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
constructor TJsonNumber.Create(Value: double);
begin
  Self.Value := Value;
end;

//------------------------------------------------------------------------------
procedure TJsonNumber.WriteJson(var JsonFile: TextFile; Level: integer);
begin
end;

end.
