unit Logger;

interface

uses
  SysUtils, Db;

type
  Log = class
  public
    class procedure WriteOtkl(Rec: TDataSet);

    class procedure Write(
      EventName, TableName: ShortString; EmplId: integer; Msg: ShortString);

    class function LogValue(
      Name: ShortString; NewValue, OldValue: TField;
      Sep: ShortString = '  '): string; overload;

    class function LogValue(Name, NewValue, OldValue: ShortString;
      Sep: ShortString = '  '): string; overload;
  end;

implementation

uses
  DBTables, a_Const, z_Dm, QryUtils;

//------------------------------------------------------------------------------
class procedure Log.WriteOtkl(Rec: TDataSet);
var
  EmplId: integer;
  Msg: ShortString;
begin
  with Rec do begin
    EmplId := FieldByName('TabN').AsInteger;

    Msg := 'DtProc = ' + FieldByName('DtProc').AsString +
      ', ZaMesGod = ' + FieldByName('ZaMesGod').AsString +
      ', VidN = ' + FieldByName('VidN').AsString +
      ', Chas = ' + FieldByName('Chas').AsString +
      ', Summa = ' + FieldByName('Summa').AsString;

    Write('Ред. отклонений', 'Z_Otkl', EmplId, Msg);
  end;
end;

//------------------------------------------------------------------------------
class procedure Log.Write(
  EventName, TableName: ShortString;
  EmplId: integer;
  Msg: ShortString);
var
  Query: TQuery;
begin
  Query := TQuery.Create(nil);
  TQryUtils.InitQuery(Query);

  Msg := 'TabN = ' + IntToStr(EmplId) + ', ' + Msg;
  Msg := Copy(Msg, 1, 250);

  with Query do begin
    SQL.Add(
      'insert into DBLOG ' +
        '(DtEvnt, NmEvnt, TabN, KdUsr, NmUsr, NmTbl, Notes) ' +
      'values ' +
        // В DtEvnt будет вводиться "NOW" - серверное время}
        '("NOW", :NmEvnt, :TabN, :KdUsr, :NmUsr, :NmTbl, :Msg)');

    ParamByName('NmEvnt').AsString := EventName;
    ParamByName('TabN').AsInteger  := EmplId;
    ParamByName('KdUsr').AsInteger := nAppKdUsr;
    ParamByName('NmUsr').AsString  := gc_AppNmUsr;
    ParamByName('NmTbl').AsString  := TableName;
    ParamByName('Msg').AsString    := Msg;
    
    ExecSQL;
  end;

  TQryUtils.ReleaseQuery(Query);
  Query.Free;
end;

//------------------------------------------------------------------------------
class function Log.LogValue(
  Name: ShortString;
  NewValue, OldValue: TField;
  Sep: ShortString = '  '): string;
var
  New, Old: ShortString;
begin
  Result := LogValue(Name, NewValue.AsString, OldValue.AsString);
end;

//------------------------------------------------------------------------------
class function Log.LogValue(
  Name, NewValue, OldValue: ShortString;
  Sep: ShortString = '  '): string;
begin
  if NewValue = OldValue then
    Result := ''
  else
    Result := ' ' + Name + ' ' + OldValue + ' => ' + NewValue + '  ';
end;

end.
