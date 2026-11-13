unit DsLib;

interface

uses
  Classes, Db;

type
  TCustField = class(TField)
  protected
    procedure SetSize(Value: Integer); override;
    procedure SetFieldKind(Value: TFieldKind); override;
    procedure SetDataType(Value: TFieldType);
    procedure SetLookupInfo(SrcField: TField);
  public
    class function CloneField(SrcField: TField; Owner: TComponent): TCustField;
  end;

  DsUtils = class
  public
    class procedure CopyStruct(SrcDs, DstDs: TDataSet);
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
// Производный класс для доступа к защищённым членам TField.
//------------------------------------------------------------------------------
class function TCustField.CloneField(
  SrcField: TField; Owner: TComponent): TCustField;
begin
  Result := TCustField.Create(Owner);

  with Result do begin
    FieldName := SrcField.FieldName;

    SetDataType(SrcField.DataType);

    SetFieldKind(SrcField.FieldKind);
    if FieldKind = fkLookup then
      SetLookupInfo(SrcField);
  end;
end;

//------------------------------------------------------------------------------
procedure TCustField.SetSize(Value: Integer);
begin
  inherited SetSize(Value);
end;

//------------------------------------------------------------------------------
procedure TCustField.SetFieldKind(Value: TFieldKind);
begin
  inherited SetFieldKind(Value);
end;

//------------------------------------------------------------------------------
procedure TCustField.SetDataType(Value: TFieldType);
begin
  inherited SetDataType(Value);
end;

//------------------------------------------------------------------------------
procedure TCustField.SetLookupInfo(SrcField: TField);
begin
  KeyFields := SrcField.KeyFields;
  LookupDataSet := SrcField.LookupDataSet;
  LookupKeyFields := SrcField.LookupKeyFields;
  LookupResultField := SrcField.LookupResultField;
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure DsUtils.CopyStruct(SrcDs, DstDs: TDataSet);
var
  I: integer;
  DstField: TField;
begin
  with DstDs do begin
    Close;
    FieldDefs.Clear;
    Fields.Clear;
  end;

  // Копируем описания полей.
  for I := 0 to SrcDs.FieldDefs.Count - 1 do
    with SrcDs.FieldDefs[I], DstDs.FieldDefs do
      Add(Name, DataType, Size);

  // Копируем поля.
  for I := 0 to SrcDs.Fields.Count - 1 do begin
    DstField := TCustField.CloneField(SrcDs.Fields[I], DstDs);
    DstDs.Fields.Add(DstField);
  end;
end;

end.
