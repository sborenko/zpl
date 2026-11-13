unit DModLogin;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDataLogin = class(TDataModule)
    DbLogin: TDatabase;
    QrySelect: TQuery;
    QryUpdate: TQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OpenLoginQry(Login: ShortString);

    function UserCurrentPwd: ShortString;
    function CheckPwd(RawPwd: ShortString): boolean;
    procedure UpdatePwd(UserId: integer; Login, RawPwd:ShortString);

    function LoginExists: boolean;
    function LoginIsActive: boolean;
    function AppIsAvailable(AppName: ShortString): boolean;

    function GetUserId: integer;

    procedure PrepareGlobalData(Login: ShortString);
  end;

var
  DataLogin: TDataLogin;

implementation

uses
  A_Const, a_Lib, CmnTypes, DModUser, AppSettings;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TDataLogin.DataModuleCreate(Sender: TObject);
begin
  with DBLogin do begin
    Params.Values['User Name'] := cMyUserNm;
    Params.Values['Password']  := cMyPsw;
  end;
end;

//------------------------------------------------------------------------------
procedure TDataLogin.DataModuleDestroy(Sender: TObject);
begin
  DBLogin.Close;
end;

//------------------------------------------------------------------------------
procedure TDataLogin.OpenLoginQry(Login: ShortString);
begin
  with QrySelect do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DBLogin.DatabaseName;

    SQL.Add(
      'select c.KdUsr, c.NmCmp, p.NmCmp as NameCmp, c.Lvl, ' +
      'u.KdKatUsr, u.Vkl, u.NmUsr, u.KdSps, u.Notes, ' +
      'u.InclZplSpZ ');

    if AppSetts.PwdMode in [PwdTransit, PwdHash] then
      SQL.Add(', u.Pwd ')
    else
      SQL.Add(', u.PswUsr ');

    SQL.Add(
      'from zz_UsrCmp c ' +
      'left join Usrs u on u.KdUsr = c.KdUsr ' +
      'left join zz_PCmp p on p.ShCmp = c.NmCmp ' +
      'where NmUsr = :UserName order by c.KdUsr ');

    ParamByName('UserName').AsString := Login;
    Open;
  end;
end;

//------------------------------------------------------------------------------
function TDataLogin.UserCurrentPwd: ShortString;
begin
  with QrySelect do
    if AppSetts.PwdMode in [PwdTransit, PwdHash] then
      Result := FieldByName('Pwd').AsString
    else
      Result := FieldByName('PswUsr').AsString;
end;

//------------------------------------------------------------------------------
function TDataLogin.CheckPwd(RawPwd: ShortString): boolean;
begin
  Result := TDMdUser.PreparedPwd(RawPwd) = UserCurrentPwd
end;


procedure TDataLogin.UpdatePwd(UserId: integer; Login, RawPwd: ShortString);
begin
    TDMdUser.ExecSelfUpdSQL(QryUpdate, UserId, Login, RawPwd, TDMdUser.PreparedPwd(RawPwd));
end;

//------------------------------------------------------------------------------
function TDataLogin.LoginExists: boolean;
begin
  Result := QrySelect.RecordCount > 0;
end;

//------------------------------------------------------------------------------
function TDataLogin.LoginIsActive: boolean;
begin
  Result :=QrySelect.FieldByName('Vkl').AsString = 'Y'
end;

//------------------------------------------------------------------------------
function TDataLogin.AppIsAvailable(AppName: ShortString): boolean;
begin
  Result := QrySelect.Locate('NmCmp', AppName, []);
end;

//------------------------------------------------------------------------------
function TDataLogin.GetUserId: integer;
begin
  Result := QrySelect.FieldByName('KdUsr').AsInteger
end;

//------------------------------------------------------------------------------
// Нужно посмотреть, не используются ли эти значения в других
// кроме ZP программах и перенести куда-нибудь.
//------------------------------------------------------------------------------
procedure TDataLogin.PrepareGlobalData(Login: ShortString);
var
  cSpecUsr: ShortString;
  mLstUsr: TStringList;
  cDirExe: string;
begin
  gc_AppNmUsr := Login;

  with QrySelect do begin
    nAppKdUsr    := FieldByName('KdUsr').AsInteger;
    nAppKdKatUsr := FieldByName('KdKatUsr').AsInteger;
    nAppUsrLvl   := FieldByName('Lvl').AsInteger;

    if MyIsField('KdSps', QrySelect) then
      gl_nAppKdSpsUsr := FieldByName('KdSps').AsInteger
    else
      gl_nAppKdSpsUsr := 0;

    cSpecUsr := FieldByName('InclZplSpZ').AsString;
    if cSpecUsr = '' then
      cSpecUsr := 'Y';

    cDirExe := ExtractFileDir(ParamStr(0)) + '\';

    mLstUsr := TStringList.Create;
    mLstUsr.Add(gc_AppNmUsr);
    mLstUsr.Add(IntToStr(nAppKdKatUsr));
    mLstUsr.Add(IntToStr(nAppKdUsr));
    mLstUsr.Add(IntToStr(gl_nAppKdSpsUsr));   // Файл t_ChkUsr.lst пишется для
    mLstUsr.Add(cSpecUsr);                 // главной формы. А там он сразу
    mLstUsr.Add(IntToStr(nAppUsrLvl));     // после прочтения удаляется.
    mLstUsr.SaveToFile(cDirExe + 't_ChkUsr.lst');
    mLstUsr.Destroy;         // Не очень красиво, но делалось на скорую руку
  end; {with}
end;

end.
