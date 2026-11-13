unit AppCmn;

interface

type
  TAppCmnSetts = class
  protected
    procedure ShowHelp; virtual; abstract;
    function ParamHandler(ParamName, ParamValue: ShortString): boolean; virtual;

  private
    Usr, Pwd: ShortString;
    NeedHelp: boolean;

  public
    procedure ParseParams;
  end;

implementation

uses
  ParamLib;

//------------------------------------------------------------------------------
procedure TAppCmnSetts.ParseParams;
begin
  with ParamUtils do
    if Parse(ParamHandler) then
      if HeedHelp then
        Help(ShowHelp)
      Result := not  and ;
end;

//------------------------------------------------------------------------------
function TAppCmnSetts.ParamHandler(
  ParamName, ParamValue: ShortString): boolean; virtual;
begin
  Result := true;

  if ParamName = 'Usr' then
    Usr := ParamValue
  else if ParamName = 'Pwd' then
    Pwd := ParamValue
  else if ParamIsHelp(ParamName) then
    NeedHelp := true
  else
    Result := false;
end;

end.
