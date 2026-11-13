unit DebugLib;

interface

type
  DebugUtils = class
    class procedure Check(Value: boolean; Message: string = '');
  end;

implementation

//--------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
class procedure DebugUtils.Check(Value: boolean; Message: string);
begin
  {$IFDEF DEBUG}
  Assert(Value, Message);
  {$ENDIF}
end;

end.



