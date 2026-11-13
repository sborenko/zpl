unit AppUtils;

interface

type
  TCapsState = (CapsOn, CapsOff);

  TLayoutInfo = record
    Code: word;
    LatAbbr: ShortString;
    CyrAbbr: ShortString;
  end;

  TAppUtils = class
  public
    class function KeyCapsState: TCapsState;
    class function KeyboardLayout: TLayoutInfo;
  end;

implementation

uses Windows;

//------------------------------------------------------------------------------
class function TAppUtils.KeyCapsState: TCapsState;
var
  KeyState: TKeyboardState;
begin
  GetKeyboardState(KeyState);

  if KeyState[VK_CAPITAL] = 0 then
    Result := CapsOff
  else
    Result := CapsOn;
end;

//------------------------------------------------------------------------------
class function TAppUtils.KeyboardLayout: TLayoutInfo;
const
  SIZE = 3;
var
  Layout: array[0..SIZE-1] of Char;
begin
  Result.Code := GetKeyboardLayout(0);
  GetLocaleInfo(loWord(Result.Code), LOCALE_SENGLANGUAGE, Layout, SIZE);
  Result.LatAbbr := Layout;
  GetLocaleInfo(loWord(Result.Code), LOCALE_SLANGUAGE, Layout, SIZE);
  Result.CyrAbbr := Layout;
end;

end.
