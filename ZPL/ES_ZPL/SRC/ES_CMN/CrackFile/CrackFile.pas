unit CrackFile;

interface

uses
  SysUtils;

  function CrackPwd(drive: string; var Login: ShortString): boolean;

implementation

uses HashUtils;

//--------------------------------------------------------------------------------------------------
function CrackPwd(drive: string; var Login: ShortString): boolean;
const
  FileName = '!';
  // It's me...
  HashedMagicWord = '8E0D2FCC3EEEEAF111F31561941DF4CD';
var
  f: TextFile;
  FilePath,
  MagicWord: string;
begin
  FilePath := drive + '\' + fileName;

  if FileExists(FilePath) then begin
    AssignFile(f, FilePath);
    Reset(f);
    ReadLn(f, MagicWord);
    ReadLn(f, Login);
  end;

  Result := THashUtils.MD5(MagicWord) = HashedMagicWord;
end;

end.
