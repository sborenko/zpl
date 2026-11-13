unit HashUtils;

interface

type
  THashUtils = class
  public
    class function MD5(s: string): string;
  end;

implementation

uses
  IdHashMessageDigest;

//------------------------------------------------------------------------------
class function THashUtils.MD5(s: string): string;
begin
  with TIdHashMessageDigest5.Create do begin
    Result := AsHex(HashValue(s));
    Free;
  end;
end;


end.
