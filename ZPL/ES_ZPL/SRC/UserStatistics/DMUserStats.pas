unit DMUserStats;

interface

uses
  SysUtils, Classes, Variants, DB, DBTables;

const
  STATNAME_Login = 'LOGIN';

  STATNAME_NewEmplSrchDlg = 'USE_NEW_EMPL_SRCH_DLG';
  STATNAME_OldEmplSrchDlg = 'USE_OLD_EMPL_SRCH_DLG';

  STATNAME_NewMedocReprt = 'USE_NEW_MEDOC_REPRT';
  STATNAME_OldMedocReprt = 'USE_OLD_MEDOC_REPRT';

type
  TStatistics = record
    ParamName: string;
    ParamValue: integer;
    LastUpdated: TDateTime;
  end;

  TDMUsrStats = class(TDataModule)
    TblStats: TTable;
    TblStatsUSER_ID: TIntegerField;
    TblStatsPARAM_NAME: TStringField;
    TblStatsPARAM_VALUE: TIntegerField;
    TblStatsLAST_UPDATED: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
  private
    UserId: integer;

    // Чтение свойств

    _login,

    _useNewEmplSrchDlg,
    _useOldEmplSrchDlg,

    _useNewMedocReprt,
    _useOldMedocReprt: integer;

    // Запись свойств

    procedure UpdateLogin(Value: integer);

    procedure UpdateNewEmplSrchDlg(Value: integer);
    procedure UpdateOldEmplSrchDlg(Value: integer);

    procedure UpdateNewMedocReprt(Value: integer);
    procedure UpdateOldMedocReprt(Value: integer);

    // Реализация

    function ReadInt(Name: string): integer;
    procedure WriteInt(Name: string; Value: integer);

    function ReadStats(var Stats: TStatistics): boolean;
    procedure WriteStats(Stats: TStatistics);

    function LocateStats(Name: string): boolean;

  public
    property Login: integer read _login write UpdateLogin;

    property UseNewEmplSrchDlg: integer read _useNewEmplSrchDlg write UpdateNewEmplSrchDlg;
    property UseOldEmplSrchDlg: integer read _useOldEmplSrchDlg write UpdateOldEmplSrchDlg;

    property UseNewMedocReprt: integer read _useNewMedocReprt write UpdateNewMedocReprt;
    property UseOldMedocReprt: integer read _useOldMedocReprt write UpdateOldMedocReprt;
  end;

var
  DMUsrStats: TDMUsrStats;

implementation

uses
  A_Const, A_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TDMUsrStats.DataModuleCreate(Sender: TObject);
begin
  UserId := nAppKdUsr;
  TblStats.Open;

  _login := ReadInt(STATNAME_Login);
  _useNewEmplSrchDlg := ReadInt(STATNAME_NewEmplSrchDlg);
  _useOldEmplSrchDlg := ReadInt(STATNAME_OldEmplSrchDlg);
end;

//------------------------------------------------------------------------------
procedure TDMUsrStats.UpdateLogin(Value: integer);
begin
  WriteInt(STATNAME_Login, Value);
  _login := Value;
end;

//------------------------------------------------------------------------------
procedure TDMUsrStats.UpdateNewEmplSrchDlg(Value: integer);
begin
  WriteInt(STATNAME_NewEmplSrchDlg, Value);
  _useNewEmplSrchDlg := Value;
end;

//------------------------------------------------------------------------------
procedure TDMUsrStats.UpdateOldEmplSrchDlg(Value: integer);
begin
  WriteInt(STATNAME_OldEmplSrchDlg, Value);
  _useOldEmplSrchDlg := Value;
end;

//------------------------------------------------------------------------------
procedure TDMUsrStats.UpdateNewMedocReprt(Value: integer);
begin
  WriteInt(STATNAME_NewMedocReprt, Value);
  _useNewMedocReprt := Value;
end;

//------------------------------------------------------------------------------
procedure TDMUsrStats.UpdateOldMedocReprt(Value: integer);
begin
  WriteInt(STATNAME_OldMedocReprt, Value);
  _useOldMedocReprt := Value;
end;

//------------------------------------------------------------------------------
function TDMUsrStats.ReadInt(Name: string): integer;
var
  Stats: TStatistics;
begin
  with Stats do begin
    ParamName := Name;
    ParamValue := 0;
    LastUpdated := 0;
  end;

  ReadStats(Stats);
  Result := Stats.ParamValue;
end;

//------------------------------------------------------------------------------
procedure TDMUsrStats.WriteInt(Name: string; Value: integer);
var
  Stats: TStatistics;
begin
  with Stats do begin
    ParamName := Name;
    ParamValue := Value;
    LastUpdated := Now;
  end;

  WriteStats(Stats);
end;

//------------------------------------------------------------------------------
function TDMUsrStats.ReadStats(var Stats: TStatistics): boolean;
begin
  Result := LocateStats(Stats.ParamName);

  if Result then
    with Stats do begin
      ParamName := TblStatsPARAM_NAME.AsString;
      ParamValue := TblStatsPARAM_VALUE.AsInteger;
      LastUpdated := TblStatsLAST_UPDATED.AsDateTime;
    end;
end;

//------------------------------------------------------------------------------
procedure TDMUsrStats.WriteStats(Stats: TStatistics);
begin
  with TblStats do begin
    if LocateStats(Stats.ParamName) then
      Edit
    else
      Append;

    with Stats do begin
      TblStatsUSER_ID.AsInteger := UserId;
      TblStatsPARAM_NAME.AsString := ParamName;
      TblStatsPARAM_VALUE.AsInteger := ParamValue;
      TblStatsLAST_UPDATED.AsDateTime := LastUpdated;
    end;

    Post;
  end;
end;

//------------------------------------------------------------------------------
function TDMUsrStats.LocateStats(Name: string): boolean;
begin
  Result := TblStats.Locate('USER_ID;PARAM_NAME', VarArrayOf([UserId, Name]), []);
end;

end.
