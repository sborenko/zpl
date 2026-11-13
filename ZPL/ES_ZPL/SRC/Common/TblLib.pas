unit TblLib;

interface

uses DbTables;

type
  TblUtils = class
  public
    class function CreateDbfFromTmpl(
      Table: TTable;
      TmplName: ShortString): boolean;
  end;

implementation

uses
  SysUtils, Db, QryLib;

//------------------------------------------------------------------------------
class function TblUtils.CreateDbfFromTmpl(
  Table: TTable;
  TmplName: ShortString): boolean;
var
  TablePathName: string;
  Query: TQuery;
begin
  with Table do begin
    TablePathName := DataBaseName + TableName + '.dbf';
    
    if Exists then
      DeleteFile(TablePathName);

    Query := TQuery.Create(nil);
    QryUtils.InitQuery(Query);

    with Query do begin
      SQL.Add(
        'select FVid ' +
        'from Ex_Tmplts ' +
        'where NmTmpl = :TmplNm');
      ParamByName('TmplNm').AsString := TmplName;
      Open;

      Result := RecordCount > 0;

      if Result then
        (Query.FieldByName('FVid') as TBlobField).SaveToFile(TablePathName);
    end; {with}

    Query.Free;
  end; {with}
end;

end.
