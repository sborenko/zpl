unit ErrorUtils;

interface

type
  TError = class
  public
    class procedure WriteError(AppName, Module, Func, ErrMessage: string);
  end;

implementation

//--------------------------------------------------------------------------------------------------
class procedure TError.WriteError(AppName, Module, Func, ErrMessage: string);
begin
end;

end.
