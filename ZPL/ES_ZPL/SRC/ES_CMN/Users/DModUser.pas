unit DModUser;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TAdminUpdResult = record
    ActiveChanged,
    PwdReset: boolean;
  end;

  TSelfUpdResult = record
    LoginChanged,
    PwdChanged: boolean;
  end;

  TDMdUser = class(TDataModule)
    DBLogin: TDatabase;
    QryUser: TQuery;
  private
    UserId: integer;
    _Login,
    _Pwd: ShortString;
    _TabN: integer;
    _Active: boolean;

    function LoadCredentials: boolean;
  public
    class function CreateDMod(Owner: TComponent;
      UserId: integer): TDMdUser;

    function AdminUpdate(SetActive, ResetPwd: boolean): TAdminUpdResult;
    function SelfUpdate(Login, RawPwd: ShortString): TSelfUpdResult;

    function CheckPwd(RawPwd: ShortString): boolean;

    property Login: ShortString read _Login;
    property TabN: integer read _TabN;

    property UserIsActive: boolean read _Active;

    class function PreparedPwd(RawPwd: ShortString): string;

    class procedure ExecSelfUpdSQL(Query: TQuery;
      UserId: integer; Login, RawPwd, Pwd: ShortString);
    class procedure ExecAdminUpdSQL(Query: TQuery;
      UserId: integer; SetActive, ResetPwd: boolean);
  end;

var
  DMdUser: TDMdUser;

implementation

uses
  CmnTypes, HashUtils, QryUtils, AppSettings;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TDMdUser.CreateDMod(Owner: TComponent;
  UserId: integer): TDMdUser;
begin
  Result := TDMdUser.Create(Owner);
  Result.UserId := UserId;

  with Result do
    LoadCredentials;
end;

//------------------------------------------------------------------------------
function TDMdUser.LoadCredentials: boolean;
begin
  Result := TQryUtils.PeekUser(QryUser, UserId);

  if Result then
    with QryUser do begin
      _Login := FieldByName('NmUsr').AsString;

      if AppSetts.PwdMode in [PwdTransit, PwdHash] then
        _Pwd := FieldByName('Pwd').AsString
      else
        _Pwd := FieldByName('PswUsr').AsString;

      _TabN := FieldByName('TabN').AsInteger;

      _Active := FieldByName('Vkl').AsString = 'Y';
    end; {with}
end;

//------------------------------------------------------------------------------
function TDMdUser.CheckPwd(RawPwd: ShortString): boolean;
begin
  Result := PreparedPwd(RawPwd) = _Pwd
end;

//------------------------------------------------------------------------------
class function TDMdUser.PreparedPwd(RawPwd: ShortString): string;
begin
  if AppSetts.PwdMode in [PwdTransit, PwdHash] then
    Result := THashUtils.MD5(RawPwd)
  else
    Result := RawPwd;
end;

//------------------------------------------------------------------------------
function TDMdUser.AdminUpdate(SetActive, ResetPwd: boolean): TAdminUpdResult;
begin
  Result.ActiveChanged := SetActive <> _Active;
  _Active := SetActive;

  Result.PwdReset := ResetPwd;

  if Result.ActiveChanged or Result.PwdReset then
    ExecAdminUpdSQL(QryUser, UserId, SetActive, ResetPwd);
end;

//------------------------------------------------------------------------------
class procedure TDMdUser.ExecAdminUpdSQL(Query: TQuery;
  UserId: integer; SetActive, ResetPwd: boolean);
var
  Comma: ShortString;
begin
  TQryUtils.InitQuery(Query);

  with Query do begin
    SQL.Add('update Usrs set Vkl = :Vkl');

    if ResetPwd then begin
      SQL.Add(',');

      Comma := '';

      if AppSetts.PwdMode in [PwdTransit, PwdHash] then begin
        SQL.Add('Pwd');
        SQL.Add(' = ''''');

        Comma := ', ';
      end;

      if AppSetts.PwdMode in [PwdRaw, PwdTransit] then begin
        SQL.Add(Comma);

        SQL.Add('PswUsr');
        SQL.Add(' = ''''');
      end;
    end;

    SQL.Add('where KdUsr = :KdUsr');

    if SetActive then
      ParamByName('Vkl').AsString := 'Y'
    else
      ParamByName('Vkl').AsString := 'N';

    ParamByName('KdUsr').AsInteger := UserId;

    ExecSQL;
  end;

  TQryUtils.ReleaseQuery(Query);
end;

//------------------------------------------------------------------------------
function TDMdUser.SelfUpdate(Login, RawPwd: ShortString): TSelfUpdResult;
var
  Pwd: ShortString;
begin
  Result.LoginChanged := Login <> _Login;
  if Result.LoginChanged then
    _Login := Login
  else
    Login := ''; //  ак признак того, что его мен€ть не будем.

  Result.PwdChanged := false;
  // ѕароль может прийти пустым в случае вызова из диалога
  // изменени€ парол€. Ёто значит, что пользователь его не мен€л.
  if RawPwd <> '' then begin
    Pwd := PreparedPwd(RawPwd);
    Result.PwdChanged := Pwd <> _Pwd;

    if Result.PwdChanged then
      _Pwd := Pwd
    else
      Pwd := ''; //  ак признак того, что его мен€ть не будем.
  end;

  if Result.LoginChanged or Result.PwdChanged then
    ExecSelfUpdSQL(QryUser, UserId, Login, RawPwd, Pwd);
end;

//------------------------------------------------------------------------------
class procedure TDMdUser.ExecSelfUpdSQL(Query: TQuery;
  UserId: integer; Login, RawPwd, Pwd: ShortString);
var
  Comma: ShortString;
begin
  TQryUtils.InitQuery(Query);

  with Query do begin
    SQL.Add('update Usrs set');

    if Login <> '' then begin
      SQL.Add('NmUsr = :NmUsr');
      ParamByName('NmUsr').AsString := Login;
    end;

    if Pwd <> '' then begin
      if Login <> '' then
        SQL.Add(',');

      Comma := '';

      if AppSetts.PwdMode in [PwdTransit, PwdHash] then begin
        SQL.Add('Pwd = :Pwd');
        ParamByName('Pwd').AsString := Pwd;

        Comma := ', ';
      end;

      if AppSetts.PwdMode in [PwdRaw, PwdTransit] then begin
        SQL.Add(Comma);

        SQL.Add('PswUsr = :RawPwd');
        ParamByName('RawPwd').AsString := RawPwd;
      end;

      SQL.Add(', Last_Pwd = :Today');
      ParamByName('Today').AsDateTime := Now;
    end;

    SQL.Add('where KdUsr = :KdUsr');
    ParamByName('KdUsr').AsInteger := UserId;

    ExecSQL;
  end;

  TQryUtils.ReleaseQuery(Query);
end;

end.
