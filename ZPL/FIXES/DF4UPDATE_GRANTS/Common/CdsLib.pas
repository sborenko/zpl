unit CdsLib;

interface

uses
  SysUtils, Db, DbClient, DsLib, TextLib;

type
  CdsUtils = class
  public
    class function CreateCds(Ds: TDataSet;
      FieldFilter: TFieldFilterFunc = nil): TClientDataSet; overload;
    class procedure CreateCds(Ds: TDataSet;
      Cds: TClientDataSet; FieldFilter: TFieldFilterFunc = nil); overload;

    class function CdsIsRaw(Cds: TClientDataSet): Boolean;
    class procedure ClearStructure(Cds: TClientDataSet);

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
  CreateCds(Ds, Result, FieldFilter);
end; {CreateCDS}

//------------------------------------------------------------------------------
class procedure CdsUtils.CreateCds(
  Ds: TDataSet;
  Cds: TClientDataSet;
  FieldFilter: TFieldFilterFunc = nil);
var
  I: integer;
begin
  for I := 0 to Ds.FieldDefs.Count - 1 do
    with Ds.FieldDefs[I] do
      if not Assigned(FieldFilter) or FieldFilter(Name) then
        Cds.FieldDefs.Add(Name, DataType, Size);
  Cds.CreateDataSet;
end; {CreateCDS}

//------------------------------------------------------------------------------
class function CdsUtils.CdsIsRaw(Cds: TClientDataSet): Boolean;
begin
  Result := Cds.FieldDefs.Count = 0;
end;

//------------------------------------------------------------------------------
class procedure CdsUtils.ClearStructure(Cds: TClientDataSet);
begin
  with Cds do begin
    Close;
    FieldDefs.Clear;
    Fields.Clear;
    IndexDefs.Clear;
  end;
end;

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
