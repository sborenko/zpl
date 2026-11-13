unit DF4Merge;

interface

uses
  DbTables;

type
  TDf4Merge = class
  private
    class function RenumberZpl(Table: TTable): Integer;
  public
    class procedure MergeTables(TblZpl, TblStp: TTable);
  end;

implementation

uses
  DsLib;

//------------------------------------------------------------------------------
class procedure TDf4Merge.MergeTables(TblZpl, TblStp: TTable);
var
  RecId: Integer;
begin
  RecId := RenumberZpl(TblZpl);

  with TblStp do begin
    First;

    while not Eof do begin
      RecId := RecId + 1;

      with TblZpl do begin
        Append;
        DsUtils.CopyRecord(TblStp, TblZpl, nil);
        FieldByName('Np').AsInteger := RecId;
        Post;
      end;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
class function TDf4Merge.RenumberZpl(Table: TTable): Integer;
begin
  Result := 0;

  with Table do begin
    First;

    while not Eof do begin
      Result := Result + 1;

      Edit;
      FieldByName('Np').AsInteger := Result;
      Post;

      Next;
    end;
  end;
end;

end.
