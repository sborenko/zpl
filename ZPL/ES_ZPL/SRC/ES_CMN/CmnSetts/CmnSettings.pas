unit CmnSettings;

interface

uses
  CmnTypes;

type
  TCmnSetts = class
  protected
    _PwdMode: TPwdMode;

    constructor Create; // Создаётся через порождённые классы.

  public
    AppName: ShortString;
    UserId: integer;
    function AllAppsUseHash: boolean;

    function IniPathName(
      UserId: Integer = 0; FileNm: String = ''): String; virtual;
    function IniFileName: String; virtual;
  end;

implementation

uses
  PathLib;

//------------------------------------------------------------------------------
// Just protected.
//------------------------------------------------------------------------------
constructor TCmnSetts.Create;
begin
  _PwdMode := PwdTransit;
end;

//------------------------------------------------------------------------------
function TCmnSetts.IniPathName(
  UserId: Integer = 0;
  FileNm: String = ''
): String;
begin
  Result := PathUtils.GetPersonalDir(UserId);

  if FileNm = '' then
    FileNm := IniFileName;

  Result := Result + '\' + FileNm;
end;

//------------------------------------------------------------------------------
function TCmnSetts.IniFileName: String;
begin
  Result := '.ini';
end;

//------------------------------------------------------------------------------
function TCmnSetts.AllAppsUseHash: boolean;
begin
  Result := false;
end;

end.
