unit MathLib;

interface

type
  MathUtils = class
  public
    class function Round(Value: double; Digits: integer): double;
  end;

implementation

uses
  Math;

//------------------------------------------------------------------------------
function IntRound(Value: double): double;
begin
  Result := Round(Value);
end;

//------------------------------------------------------------------------------
class function MathUtils.Round(Value: double; Digits: integer): double;
var
  V1, V2: double;
  Power: double;
  Fix: integer;
begin
  Power := IntPower(10, Digits);
  if Value < 0 then
    Fix := -1
  else
    Fix := 1;

  V1 := Value * Power;
  V2 := IntRound(V1);

  if V1 - V2 >= 0.5 then
    V1 := V2 + Fix
  else
    V1 := V2;

  Result := V1 / Power;
end;

end.
