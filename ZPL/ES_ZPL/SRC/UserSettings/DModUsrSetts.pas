unit DModUsrSetts;

interface

uses
  SysUtils, Classes, Variants, DB, DBTables, SalaryConst;

const
  VALTYPE_Bool = 'bool';
  VALTYPE_Int = 'integer';

  BOOL_True = 'true';
  BOOL_False = 'false';

  SETNAME_NewEmplSrchDlg = 'NEW_EMPL_SRCH_DLG';
  SETNAME_OneStepEmplSrch = 'ONE_STEP_EMPL_SRCH';

  // Более не используется
  // SETNAME_NewMedocReprt = 'NEW_MEDOC_REPRT';

  SETNAME_SepVacatDetails = 'SEP_VACAT_DETAILS';

  SETNAME_ShowPrevPosition = 'SHOW_PREV_POSITION';
  SETNAME_ShowOldPosName = 'SHOW_OLD_POS_NAME';
  SETNAME_ShowPosFlat = 'SHOW_POS_FLAT';

  STATNAME_ShowNuRedund  = 'SHOW_NU_REDUND';
  STATNAME_ShowNuCondens = 'SHOW_NU_CONDENS';
  STATNAME_ShowNuShort   = 'SHOW_NU_SHORT';

type
  TSetting = record
    Name,
    Value,
    ValueType: ShortString;
    LastUpdated: TDateTime;
  end;

  TDmUsrSetts = class(TDataModule)
    TblSetts: TTable;
    DSrcSettings: TDataSource;
    Database: TDatabase;
    TblSettsUSER_ID: TIntegerField;
    TblSettsSETT_NAME: TStringField;
    TblSettsSETT_VALUE: TStringField;
    TblSettsSETT_TYPE: TStringField;
    TblSettsLAST_UPDATED: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
  private
    UserId: integer;

    _newEmplSrchDlg,
    _oneStepEmplSrch,

    _SepVacatDetails,

    _ShowPrevPosition,
    _ShowOldPosName,
    _ShowPosFlat: Boolean;

    function ReadBool(SettName: ShortString; Default: boolean): boolean;
    procedure WriteBool(SettName: ShortString; Value: boolean);

    function ReadSett(var Sett: TSetting): boolean;
    procedure WriteSett(Sett: TSetting);

    function ReadInt(SettName: ShortString; Default: Integer = 0): Integer;
    procedure WriteInt(SettName: ShortString; Value: Integer);

    procedure WriteNewEmplSrchDlg(Value: boolean);
    procedure WriteOneStepEmplSrch(Value: boolean);

    procedure WriteSepVacatDetails(Value: boolean);

    procedure WriteShowPrevPosition(Value: boolean);
    procedure WriteShowOldPosName(Value: boolean);
    procedure WriteShowPosFlat(Value: boolean);

    function LocateSett(SettName: ShortString): boolean;
  public
    procedure WriteNuShowMode(NuShowMode: TNuShowMode);

    property NewEmplSrchDlg: boolean
      read _newEmplSrchDlg write WriteNewEmplSrchDlg;
    property OneStepEmplSrch: boolean
      read _oneStepEmplSrch write WriteOneStepEmplSrch;

    property SepVacatDetails: boolean
      read _SepVacatDetails write WriteSepVacatDetails;

    property ShowPrevPosition: boolean
      read _ShowPrevPosition write WriteShowPrevPosition;
    property ShowOldPosName: boolean
      read _ShowOldPosName write WriteShowOldPosName;
    property ShowPosFlat: boolean
      read _ShowPosFlat write WriteShowPosFlat;
  end;

var
  DmUsrSetts: TDmUsrSetts;

implementation

uses
  A_Const, A_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TDmUsrSetts.DataModuleCreate(Sender: TObject);
begin
  UserId := nAppKdUsr;
  TblSetts.Open;

  _newEmplSrchDlg := ReadBool(SETNAME_NewEmplSrchDlg, true);
  _oneStepEmplSrch := ReadBool(SETNAME_OneStepEmplSrch, false);

  _SepVacatDetails := ReadBool(SETNAME_SepVacatDetails, true);

  _ShowPrevPosition := ReadBool(SETNAME_ShowPrevPosition, true);
  _ShowOldPosName := ReadBool(SETNAME_ShowOldPosName, false);
  _ShowPosFlat := ReadBool(SETNAME_ShowPosFlat, true);
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteNewEmplSrchDlg(Value: boolean);
begin
  WriteBool(SETNAME_NewEmplSrchDlg, Value);
  _newEmplSrchDlg := Value;
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteOneStepEmplSrch(Value: boolean);
begin
  WriteBool(SETNAME_OneStepEmplSrch, Value);
  _oneStepEmplSrch := Value;
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteSepVacatDetails(Value: boolean);
begin
  WriteBool(SETNAME_SepVacatDetails, Value);
  _SepVacatDetails := Value;
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteShowPrevPosition(Value: boolean);
begin
  WriteBool(SETNAME_ShowPrevPosition, Value);
  _ShowPrevPosition := Value;
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteShowOldPosName(Value: boolean);
begin
  WriteBool(SETNAME_ShowOldPosName, Value);
  _ShowOldPosName := Value;
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteShowPosFlat(Value: boolean);
begin
  WriteBool(SETNAME_ShowPosFlat, Value);
  _ShowPosFlat := Value;
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteNuShowMode(NuShowMode: TNuShowMode);
var
  SettName: ShortString;
  Value: Integer;
begin
  case NuShowMode of
    snuDetail:
      SettName := STATNAME_ShowNuRedund;
    snuCondens:
      SettName := STATNAME_ShowNuCondens;
    snuNewShort:
      SettName := STATNAME_ShowNuShort;
  end;
  
  Value := ReadInt(SettName, 0);
  Value := Value + 1;
  WriteInt(SettName, Value);
end;

//------------------------------------------------------------------------------
function TDmUsrSetts.ReadInt(
  SettName: ShortString;
  Default: Integer = 0
): Integer;
var
  Sett: TSetting;
begin
  Sett.Name := SettName;

  if ReadSett(Sett) then begin
    Assert(Sett.ValueType = VALTYPE_Int);
    Result := StrToInt(Sett.Value);
  end else
    Result := Default;
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteInt(SettName: ShortString; Value: Integer);
var
  Sett: TSetting;
begin
  Sett.Name := SettName;
  Sett.Value := IntToStr(Value);
  Sett.ValueType := VALTYPE_Int;

  WriteSett(Sett);
end;

//------------------------------------------------------------------------------
function TDmUsrSetts.ReadBool(SettName: ShortString; Default: boolean): Boolean;
var
  Sett: TSetting;
begin
  Sett.Name := SettName;

  if ReadSett(Sett) then begin
    Assert(Sett.ValueType = VALTYPE_Bool);
    Result := Sett.Value = BOOL_TRUE;
  end else
    Result := Default;
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteBool(SettName: ShortString; Value: Boolean);
var
  Sett: TSetting;
begin
  Sett.Name := SettName;

  if Value then
    Sett.Value := BOOL_TRUE
  else
    Sett.Value := BOOL_FALSE;
  Sett.ValueType := VALTYPE_Bool;

  WriteSett(Sett);
end;

//------------------------------------------------------------------------------
function TDmUsrSetts.ReadSett(var Sett: TSetting): Boolean;
begin
  Result := LocateSett(Sett.Name);

  if Result then
    with Sett do begin
      Value := TblSettsSETT_VALUE.AsString;
      ValueType := TblSettsSETT_TYPE.AsString;
    end;
end;

//------------------------------------------------------------------------------
procedure TDmUsrSetts.WriteSett(Sett: TSetting);
begin
  with TblSetts do begin
    if LocateSett(Sett.Name) then
      Edit
    else
      Append;

    TblSettsUSER_ID.AsInteger := UserId;
    TblSettsSETT_NAME.AsString := Sett.Name;
    TblSettsSETT_VALUE.AsString := Sett.Value;
    TblSettsSETT_TYPE.AsString := Sett.ValueType;
    TblSettsLAST_UPDATED.AsDateTime := Now;

    Post;
  end;
end;

//------------------------------------------------------------------------------
function TDmUsrSetts.LocateSett(SettName: ShortString): Boolean;
begin
  Result := TblSetts.Locate(
    'USER_ID;SETT_NAME', VarArrayOf([UserId, SettName]), []);
end;

end.
