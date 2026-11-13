unit z_DMAccMap;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TAccType = (BaseAcc, AccrualAcc, PaymentAcc);

  TMapInfo = record
    MemOrdNm,
    Accnt,
    AccNm: ShortString;
  end;

  TDMAccMap = class(TDataModule)
    QrySBU: TQuery;
    QryMap: TQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    c_MemOrdNm: ShortString;
    n_BaseAcc, n_FirstAcc, n_SecondAcc: Integer;
    b_MappingExists: Boolean;

    procedure LoadMapping;
    procedure InsertMapping;
    procedure UpdateMapping;
  public
    procedure Init;

    function CheckAccnt(AccType: TAccType; Accnt: ShortString;
      var AccNm: ShortString): Boolean;
    function GetAccInfo(AccId: Integer; out Accnt, AccNm: ShortString): Boolean;

    procedure SetBaseAcc(AccId: Integer);
    procedure SetMapAcc(AccType: TAccType; AccId: Integer);
    function GetMapAcc(AccType: TAccType): Integer;

    procedure SetMemOrdName(MemOrdNm: ShortString);
    function GetMemOrdName: ShortString;

    procedure ApplyMapping;
    procedure DeleteMapping;

    function MapAccounts(Accnt, AccNm: ShortString;
      AccType: TAccType): TMapInfo;
  end;

var
  DMAccMap: TDMAccMap;

implementation

uses
  A_Const;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TDMAccMap.DataModuleCreate(Sender: TObject);
begin
  QrySBU.DatabaseName := CESMAIN;
  QryMap.DatabaseName := CESMAIN;
end;

//------------------------------------------------------------------------------
function TDMAccMap.MapAccounts(
  Accnt, AccNm: ShortString;
  AccType: TAccType
): TMapInfo;
begin
  Result.Accnt := Accnt;
  Result.AccNm := AccNm;
  Result.MemOrdNm := '';

  CheckAccnt(BaseAcc, Accnt, AccNm);

  if b_MappingExists then
    with Result do begin
      if AccType = BaseAcc then
        MemOrdNm := c_MemOrdNm
      else if AccType = AccrualAcc then
        GetAccInfo(n_FirstAcc, Accnt, AccNm)
      else
        GetAccInfo(n_SecondAcc, Accnt, AccNm);
    end;
end;

//------------------------------------------------------------------------------
function TDMAccMap.CheckAccnt(
  AccType: TAccType; Accnt: ShortString;
  var AccNm: ShortString
): Boolean;
begin
  with QrySBU do begin
    SQL.Text := 'select KdSch, NmSch from Kd_SBU where Sch_17 = :SchBU';
    ParamByName('SchBU').AsString := Accnt;
    Open;

    Result := not EoF;

    if Result then begin
      if AccType = BaseAcc then
        SetBaseAcc(FieldByName('KdSch').AsInteger)
      else if AccType = AccrualAcc then
        n_FirstAcc := FieldByName('KdSch').AsInteger
      else
        n_SecondAcc := FieldByName('KdSch').AsInteger;

      AccNm := FieldByName('NmSch').AsString;
      Result := true;
    end;

    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TDMAccMap.LoadMapping;
begin
  with QryMap do begin
    SQL.Text := 'select * from z_Acc_Map where Base_Acc = :BaseAcc';
    ParamByName('BaseAcc').AsInteger := n_BaseAcc;
    Open;

    b_MappingExists := not EoF;

    if b_MappingExists then begin
      c_MemOrdNm := FieldByName('MO_Name').AsString;
      n_FirstAcc := FieldByName('First_Acc').AsInteger;
      n_SecondAcc := FieldByName('Second_Acc').AsInteger;
    end;

    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TDMAccMap.SetBaseAcc(AccId: Integer);
begin
  n_BaseAcc := AccId;
  LoadMapping;
end;

//------------------------------------------------------------------------------
procedure TDMAccMap.SetMapAcc(AccType: TAccType; AccId: Integer);
begin
  if AccType = AccrualAcc then
    n_FirstAcc := AccId
  else
    n_SecondAcc := AccId;
end;

//------------------------------------------------------------------------------
function TDMAccMap.GetMapAcc(AccType: TAccType): integer;
begin
  if AccType = AccrualAcc then
    Result := n_FirstAcc
  else
    Result := n_SecondAcc;
end;

//------------------------------------------------------------------------------
procedure TDMAccMap.SetMemOrdName(MemOrdNm: ShortString);
begin
  c_MemOrdNm := MemOrdNm;
end;

//------------------------------------------------------------------------------
function TDMAccMap.GetMemOrdName: ShortString;
begin
  Result := c_MemOrdNm;
end;

//------------------------------------------------------------------------------
function TDMAccMap.GetAccInfo(
  AccId: Integer;
  out Accnt, AccNm: ShortString
): Boolean;
begin
  with QrySBU do begin
    SQL.Text := 'select Sch_17, NmSch from Kd_SBU where KdSch = :KdSch';
    ParamByName('KdSch').AsInteger := AccId;
    Open;

    Result := not EoF;

    if Result then begin
      Accnt := FieldByName('Sch_17').AsString;
      AccNm := FieldByName('NmSch').AsString;
    end;
      
    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TDMAccMap.ApplyMapping;
begin
  if b_MappingExists then
    UpdateMapping
  else
    InsertMapping;
end;

//------------------------------------------------------------------------------
procedure TDMAccMap.InsertMapping;
begin
  with QryMap do begin
    SQL.Text :=
      'insert into z_Acc_Map (MO_Name, Base_Acc, First_Acc, Second_Acc)'
      + ' values (:MemOrdName, :BaseAcc, :FirstAcc, :SecondAcc)';
    ParamByName('MemOrdName').AsString := c_MemOrdNm;
    ParamByName('BaseAcc').AsInteger := n_BaseAcc;
    ParamByName('FirstAcc').AsInteger := n_FirstAcc;
    ParamByName('SecondAcc').AsInteger := n_SecondAcc;
    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------
procedure TDMAccMap.UpdateMapping;
begin
  with QryMap do begin
    SQL.Text :=
      'update z_Acc_Map ' +
      'set ' +
        'MO_Name = :MemOrdName, ' +
        'First_Acc = :FirstAcc, ' +
        'Second_Acc = :SecondAcc ' +
      'where Base_Acc = :BaseAcc';

    ParamByName('MemOrdName').AsString := c_MemOrdNm;
    ParamByName('BaseAcc').AsInteger := n_BaseAcc;
    ParamByName('FirstAcc').AsInteger := n_FirstAcc;
    ParamByName('SecondAcc').AsInteger := n_SecondAcc;
    
    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------
procedure TDMAccMap.DeleteMapping;
begin
  with QryMap do begin
    SQL.Text := 'delete from z_Acc_Map where Base_Acc = :BaseAcc';
    ParamByName('BaseAcc').AsInteger := n_BaseAcc;
    ExecSQL;
  end;
end;

//------------------------------------------------------------------------------
procedure TDMAccMap.Init;
begin
  c_MemOrdNm := '';
  n_BaseAcc := 0;
  n_FirstAcc := 0;
  n_SecondAcc := 0;
  b_MappingExists := false;
end;

end.
