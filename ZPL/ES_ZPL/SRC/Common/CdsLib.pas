unit CdsLib;

interface

uses
  SysUtils, Db, DbClient, DsLib, TextLib;

type
  CdsUtils = class
  public
    class function CreateCds(Ds: TDataSet;
      FieldFilter: TFieldFilterFunc = nil): TClientDataSet;
    class procedure CreateCdsA(Ds: TDataSet;
      Cds: TClientDataSet; FieldFilter: TFieldFilterFunc = nil;
      EmptyFields: Boolean = true);

    class procedure SaveToMnthFile(
      Cds: TClientDataSet; FilePathName: string; Mnth: word);
  end;

implementation

//------------------------------------------------------------------------------
class function CdsUtils.CreateCds(
  Ds: TDataSet;
  FieldFilter: TFieldFilterFunc = nil): TClientDataSet;
begin
  Result := TClientDataSet.Create(nil);
  CreateCdsA(Ds, Result, FieldFilter);
end; {CreateCDS}

//------------------------------------------------------------------------------
class procedure CdsUtils.CreateCdsA(
  Ds: TDataSet;
  Cds: TClientDataSet;
  FieldFilter: TFieldFilterFunc = nil;
  EmptyFields: Boolean = true);
var
  I: integer;
  FieldName: ShortString;
begin
  with Cds do begin
    Close;
    FieldDefs.Clear;
    
    if EmptyFields then
    	Fields.Clear;
    	
    IndexDefs.Clear;
  end;

  for I := 0 to Ds.FieldDefs.Count - 1 do
    with Ds.FieldDefs[I] do begin
      FieldName := Name;

      with Cds.FieldDefs do
        if not Assigned(FieldFilter) or FieldFilter(FieldName) then
          Add(FieldName, DataType, Size);
    end; {with}

  Cds.CreateDataSet;
end; {CreateCDS}

//------------------------------------------------------------------------------
class procedure CdsUtils.SaveToMnthFile(
  Cds: TClientDataSet;
  FilePathName: string;
  Mnth: word);
begin
  if Mnth > 0 then
    FilePathName :=
      FilePathName + '_' + TextUtils.PadLeft(IntToStr(Mnth), '0', 2);

  Cds.SaveToFile(FilePathName + '.cds');
end; {SaveToMnthFile}

end.
