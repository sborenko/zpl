unit ParamLib;

interface

type
  HelpHnd = procedure of object;
  ParamHnd = function(ParamName, ParamValue: ShortString): boolean of object;

  ParamUtils = class
  public
    class function Help(Handler: HelpHnd): boolean;
    class function Parse(Handler: ParamHnd): boolean;
  private
//    class function HelpAsked: boolean;
  end;

implementation

uses
  SysUtils, Dialogs;

//------------------------------------------------------------------------------
class function ParamUtils.Help(Handler: HelpHnd): boolean;
begin
  Handler;
  Result := false;
end;

{
//------------------------------------------------------------------------------
class function ParamUtils.HelpAsked: boolean;
var
  Param: ShortString;
  Len: integer;
begin
  Param := ParamStr(1);
  Len := Length(Param);

  Result := (Copy(Param, 1, 1) = '/') and (Copy(Param, 2, Len) = '?')
    or (Copy(Param, 1, 1) = '-') and (Copy(Param, 2, Len) = 'h')
    or (Copy(Param, 1, 2) = '--') and (Copy(Param, 3, Len) = 'help');
end;
}

//------------------------------------------------------------------------------
class function ParamUtils.Parse(Handler: ParamHnd): boolean;
var
  I: integer;
  Param, ParamName, ParamValue: ShortString;
begin
  Result := true;

  for I := 1 to ParamCount do begin
    Param := ParamStr(I);



    Result := Handler(ParamName, ParamValue);

    if not Result then begin
      ShowMessage('Нераспознанный параметр: ' + Param);
      break;
    end;
  end;
end;

end.
