unit DebugUtils;

interface

type

  TDebug = class
    class procedure Check(Value: boolean; Message: string = '');
  end;

implementation

//--------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
class procedure TDebug.Check(Value: boolean; Message: string);
begin
  {$IFDEF DEBUG}
  Assert(Value, Message);
  {$ENDIF}
end;

end.
