unit PathUtils;

interface

type
  PathUtil = class
  public
    class function GetWorkDir(PathName: string; AllowBlankFileExt: boolean = false): string;
    class function ExePath: string;
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
// PathName может быть абсолютным или относительным путём/именем файла.
// Возвращается абсолютный путь рабочей папки.
//------------------------------------------------------------------------------
class function PathUtil.GetWorkDir(
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
    Result := ExePath;
end;

//------------------------------------------------------------------------------
// Возвращается путь к .exe-файлу.
//------------------------------------------------------------------------------
class function PathUtil.ExePath: string;
begin
  // Нулевым параметром при запуске всегда приходит путь к .exe
  Result := ExtractFilePath(ParamStr(0));
end;

end.
