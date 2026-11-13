unit AppSettings;

interface

uses
  CmnSettings, CmnTypes;

type
  TAppSetts = class(TCmnSetts)
  private
    function GetPwdMode: TPwdMode;
    procedure SetPwdMode(Value: TPwdMode);
  public
    constructor Create;

    property PwdMode: TPwdMode read GetPwdMode write SetPwdMode;

    class function IsNew500xStorno(StornDate: TDateTime): boolean;
    function IniPathName(
      UserId: Integer = 0; FileNm: String = ''): String; override;
  end;

var
  AppSetts: TAppSetts;

implementation

uses
  a_Const;

//------------------------------------------------------------------------------
constructor TAppSetts.Create;
begin
  inherited Create;

  AppName := 'zpl';
end;

//------------------------------------------------------------------------------
function TAppSetts.IniPathName(
  UserId: Integer = 0;
  FileNm: String = ''
): String;
begin
  Result := cNmIniFile;
end;

//------------------------------------------------------------------------------
function TAppSetts.GetPwdMode: TPwdMode;
begin
  if AllAppsUseHash then
    Result := _PwdMode
  else
    Result := _PwdMode;
end;

//------------------------------------------------------------------------------
procedure TAppSetts.SetPwdMode(Value: TPwdMode);
begin
  if AllAppsUseHash then
    _PwdMode := Value
  else
    _PwdMode := Value;
end;

// ***
// В новой схеме первоначальная запись 500X не делится на смежные части:
// сторнирующую и остаток, а частично или полностью перекрывается сторнирующей.
// ***
class function TAppSetts.IsNew500xStorno(StornDate: TDateTime): boolean;
const
  NEW_STORN_DATE = 45603; // 07 ноября 2024
begin
  Result := StornDate >= NEW_STORN_DATE;
end;

end.

