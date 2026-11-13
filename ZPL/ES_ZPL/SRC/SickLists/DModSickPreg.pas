unit DModSickPreg;

interface

uses
  SysUtils, Classes, DateLib, Db, DbTables;

const
  // _ENTPR - дни за счёт предприятия
  // _FUND - дни за счёт фонда
  DAYS_PRINC_ENT: Integer = 8;
  DAYS_PRINC_FND: Integer = 4;
  DAYS_SUPPL_ENT: Integer = 2;
  DAYS_SUPPL_FND: Integer = 1;

  // Количество дней за счёт предприятия:
  // больничный
  SICK_DAYS_MAX = 5;
  // травма на производстве
  ACCIDENT_DAYS_MAX = 17;

type
  // Компоненты, включаемые в расчёт больничного:
  // основные 5 дней, остаток;
  // совместительские 5 дней, остаток.
  TSickPregAlgorithm = (ALG_LAST_SALARY = 1, ALG_12_MNTH = 12);

  TDmSickPreg = class(TDataModule)
    QryPeek: TQuery;
  private
    DayFlags: Integer;
  public
    function NewBehaviourDate: TDateTime;

    procedure SetDayFlags(Values: Integer); overload;
    procedure SetDayFlags(Mask, Value: Integer); overload;

    function GetDayFlags: Integer;
    function DayFlagIsSet(Mask: Integer): Boolean;

    function EmplHasSupplPayTypes(
      EmplId: Integer; Period: TPeriod): Boolean;
  end;

var
  DmSickPreg: TDmSickPreg;

implementation

uses
  QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
function TDmSickPreg.NewBehaviourDate: TDateTime;
begin
  // Компоненты больничных, созданных начиная с этой даты, считаются
  // в соответствии с выбранными флагами.
  Result := EncodeDate(2023, 04, 01);
end;

//------------------------------------------------------------------------------
procedure TDmSickPreg.SetDayFlags(Values: Integer);
begin
  DayFlags := Values;
end;

//------------------------------------------------------------------------------
// Устанавливает или сбрасывает набор флагов.
// Flags задают набор полей, Value - значение, которое будет присвоено полям.
//------------------------------------------------------------------------------
procedure TDmSickPreg.SetDayFlags(Mask, Value: Integer);
var
  Buffer: Integer;
begin
  // Применяем значения, которые надо установить. Для этого маску умножаем
  // на значение. Результат складываем с исходным значением.
  Buffer := Mask and Value;
  DayFlags := DayFlags or Buffer;

  // Теперь применяем значения, которые надо сбросить. Для этого выполняем
  // исключающее "или" к маске и значению. Затем результат инвертируем и
  // умножаем на исходное значение.
  Buffer := Mask xor Value;
  Buffer := not Buffer;
  DayFlags := DayFlags and Buffer;
end;

//------------------------------------------------------------------------------
function TDmSickPreg.GetDayFlags: Integer;
begin
  Result := DayFlags;
end;

//------------------------------------------------------------------------------
function TDmSickPreg.DayFlagIsSet(Mask: Integer): Boolean;
begin
  Result := (DayFlags and Mask) <> 0;
end;

//------------------------------------------------------------------------------
function TDmSickPreg.EmplHasSupplPayTypes(
  EmplId: Integer;
  Period: TPeriod): Boolean;
var
  Stmt: String;
begin
  QryUtils.InitQuery(QryPeek);

  Stmt :=
    'select "x" ' +
    'from z_Nadb n ' +
      'left join z_KdVidN v on v.VidN = n.VidN ' +
    'where n.TabN = :EmplId ' +
      'and n.Dt_Beg <= :DtEnd ' +
      'and (n.Dt_End >= :DtBeg or n.Dt_End is null) ' +
      'and v.Sovm = "1"';

  with QryPeek, SQL do begin
    Add(Stmt);
    ParamByName('EmplId').AsInteger := EmplId;
    ParamByName('DtBeg').AsDateTime := Period.Start;
    ParamByName('DtEnd').AsDateTime := Period.Finish;
    Open;
    Result := RecordCount > 0;
    Close;
  end;

  QryUtils.ReleaseQuery(QryPeek);
end;

end.
