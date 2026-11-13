unit PathLib;

interface

type
  PathUtils = class
  public
    class procedure CheckCreateFolder(Path: string);

    class function GetWorkDir(
      PathName: string;
      AllowBlankFileExt: boolean = false): string;

    class function GetExePath: string;
    class function SelectFolder(Path: string): string;

    class function RandomFileName: ShortString;
  end;

implementation

uses
  SysUtils, DateUtils,
{$WARNINGS OFF}
  FileCtrl,
{$WARNINGS ON}
  TextLib;

//------------------------------------------------------------------------------
class procedure PathUtils.CheckCreateFolder(Path: string);
begin
  ForceDirectories(Path);
end;

//------------------------------------------------------------------------------
// PathName может быть абсолютным или относительным путём/именем файла.
// Возвращается абсолютный путь рабочей папки.
//------------------------------------------------------------------------------
class function PathUtils.GetWorkDir(
  PathName: string;
  AllowBlankFileExt: boolean = false): string;
var
  Name, Ext: ShortString;
begin
  Result := ExtractFilePath(PathName);
  Name := ExtractFileName(PathName);
  Ext := ExtractFileExt(PathName);

  // Если пустаые расширения файлов не допускаются, ...
  if not AllowBlankFileExt and (Name <> '') and (Ext = '') then begin
    // ... трактуем имя как часть засширения, данного без разделителя.
    Result := Result + Name + '\';
    Name := '';
  end;

  // Приводим относительный путь к абсолютному.
  Result := ExpandFileName(Result);

  // Если путь не указан, ...
  if Result = '' then
    // ... работаем в папке, откуда запущен .exe
    Result := GetExePath;
end;

//------------------------------------------------------------------------------
// Возвращается путь к .exe-файлу.
//------------------------------------------------------------------------------
class function PathUtils.GetExePath: string;
begin
  // Нулевым параметром при запуске всегда приходит путь к .exe
  Result := ExtractFilePath(ParamStr(0));
end;

//------------------------------------------------------------------------------
class function PathUtils.SelectFolder(Path: string): string;
const
  SELDIRHELP = 1000;
begin
  Result := Path;

  if FileCtrl.SelectDirectory(
      Path, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
    Result := Path;
end;

//------------------------------------------------------------------------------
class function PathUtils.RandomFileName: ShortString;
begin
  Result := IntToStr(MilliSecondOfTheHour(Now));
  while Length(Result) < 7 do
    Result := '0' + Result;
  Result := 'x' + Result;
end;

end.

