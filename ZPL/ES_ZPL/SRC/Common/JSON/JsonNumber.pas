unit JsonNumber;

interface

uses
  JsonItem;

type
  TJsonNumber = class(TJsonItem)
  public
    constructor Create(Value: double);
    procedure WriteJson(
      var JsonFile: TextFile; Level: integer; Sep: ShortString); override;
  private
    Value: double;
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
constructor TJsonNumber.Create(Value: double);
begin
  inherited Create;
  Self.Value := Value;
end;

//------------------------------------------------------------------------------
procedure TJsonNumber.WriteJson(
  var JsonFile: TextFile;
  Level: integer;
  Sep: ShortString);
var
  StrValue: ShortString;
begin
  StrValue := FloatToStr(Value);
  StrValue := StringReplace(StrValue, ',', '.', []);

  WriteIndent(JsonFile, Level);
  WriteLn(JsonFile, StrValue + Sep);
end;

end.
