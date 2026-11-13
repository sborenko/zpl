unit LogLib;

interface

uses
  SysUtils;

type
  LogUtils = class
  public
    class procedure StartLogging(FileName: ShortString);
    class procedure Log(Text: string);
    class procedure EndLogging;
  end;

implementation

var
  LogFile: TextFile;

//------------------------------------------------------------------------------
class procedure LogUtils.StartLogging(FileName: ShortString);
begin
  AssignFile(LogFile, FileName);
  Rewrite(LogFile);
end;

//------------------------------------------------------------------------------
class procedure LogUtils.Log(Text: string);
begin
  WriteLn(LogFile, Text);
end;

//------------------------------------------------------------------------------
class procedure LogUtils.EndLogging;
begin
  CloseFile(LogFile);
end;

end.
