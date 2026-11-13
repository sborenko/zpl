unit VersionInfo;

interface

function GetAppVersion: string;

implementation

uses Classes, Windows, SysUtils;

function GetAppVersion: string;
var
  memStream: TMemoryStream;
  resStream: TResourceStream;

  verblock: PVSFIXEDFILEINFO;
  verlen: cardinal;
  versionMS, versionLS: cardinal;

  p: pointer;
  s: cardinal;
begin
  memStream := TMemoryStream.Create;

  try
    resStream := TResourceStream.CreateFromID(HInstance, 1, RT_VERSION);

    try
      memStream.CopyFrom(resStream, resStream.Size);
    finally
      resStream.Free;
    end;

    memStream.Position := 0;

    if VerQueryValue(memStream.Memory, '\', pointer(verblock), verlen) then
      begin
        VersionMS := verblock.dwFileVersionMS;
        VersionLS := verblock.dwFileVersionLS;
        Result := IntToStr(versionMS shr 16)
          + '.' + IntToStr(versionMS and $FFFF)
          + '.' + IntToStr(VersionLS shr 16)
          + '.' + IntToStr(VersionLS and $FFFF);
      end;

    if VerQueryValue(memStream.Memory,PChar('\\StringFileInfo\\' +
      IntToHex(GetThreadLocale,4) + IntToHex(GetACP,4) + '\\FileDescription'), p, s) or
        VerQueryValue(memStream.Memory, '\\StringFileInfo\\040904E4\\FileDescription', p, s) then //en-us
          Result := PChar(p) + ' ' + Result;
  finally
    memStream.Free;
  end;
end;

end.



