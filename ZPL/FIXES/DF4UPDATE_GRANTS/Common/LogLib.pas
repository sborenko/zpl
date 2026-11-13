unit LogLib;

interface

uses
  SysUtils;

type
  LogUtils = class
  public
    class procedure Open(FileName: ShortString);
    class procedure Write(Text: string);
    class procedure Close;
  end;

implementation

var
  LogFile: TextFile;

//------------------------------------------------------------------------------
class procedure LogUtils.Open(FileName: ShortString);
begin
  AssignFile(LogFile, FileName);
  Rewrite(LogFile);
end;

//------------------------------------------------------------------------------
class procedure LogUtils.Write(Text: string);
begin
  WriteLn(LogFile, Text);
end;

//------------------------------------------------------------------------------
class procedure LogUtils.Close;
begin
  CloseFile(LogFile);
end;

end.
