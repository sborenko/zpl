unit JsonDate;

interface

uses
  SysUtils, JsonItem;

type
  TJsonDate = class(TJsonItem)
  public
    constructor Create(Value: TDateTime); overload;
    constructor Create(
      Value: TDateTime; FormatSettings: TFormatSettings); overload;

    procedure WriteJson(
      var JsonFile: TextFile; Level: integer; Sep: ShortString); override;
  private
    Value: TDateTime;
    UseFormatting: boolean;
    FormatSettings: TFormatSettings;
  end;

implementation

//------------------------------------------------------------------------------
constructor TJsonDate.Create(Value: TDateTime);
begin
  inherited Create;
  Self.Value := Value;
end;

//------------------------------------------------------------------------------
constructor TJsonDate.Create(Value: TDateTime; FormatSettings: TFormatSettings);
begin
  inherited Create;
  Self.Value := Value;
  Self.FormatSettings := FormatSettings;
  UseFormatting := true;
end;

//------------------------------------------------------------------------------
procedure TJsonDate.WriteJson(
  var JsonFile: TextFile;
  Level: integer;
  Sep: ShortString);
var
  StrValue: ShortString;
begin
  if Value = 0 then
    StrValue := ''
  else
    if UseFormatting then
      StrValue := DateToStr(Value, FormatSettings)
    else
      StrValue := DateToStr(Value);

  WriteIndent(JsonFile, Level);
  WriteLn(JsonFile, QuatedString(StrValue) + Sep);
end;

end.
