unit NumUtils;

interface

type
  TNumUtils = class
  public
    class function RoundToKopeck(nSum: double): double;
  end;

implementation

uses SysUtils;

class function TNumUtils.RoundToKopeck(nSum: double): double;
var
  cSum, cLastDigit: string;

begin
  cSum := FloatToStrF(nSum, ffFixed, 18, 10);
  cLastDigit := Copy(cSum, Length(cSum) - 7, 1);
  cSum := Copy(cSum, 1, Length(cSum) - 8);

  Result := StrToFloat(cSum);
  if StrToInt(cLastDigit) >= 5 then
    Result := Result + 0.01;
end;

end.
