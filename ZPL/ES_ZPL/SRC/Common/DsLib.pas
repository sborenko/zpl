unit DsLib;

interface

uses
  Classes, DateLib, Db;

type
  TCustStrArr = array of ShortString;
  TCustVarArr = array of Variant;

  TEnumDecision = (EnumContinue, EnumFailed, EnumSuccess);

  TDecisionProc = procedure(
    DataSet: TDataSet; var Decision: TEnumDecision) of object;

  TFieldNameMapItem = record
    SrcFieldName,
    DstFieldName: ShortString;
  end;
  TFieldNameMap = array of TFieldNameMapItem;

//  TSingleSetProc = procedure(DataSet: TDataSet) of object;
  TSingleSetProc = procedure(DataSet: TDataSet; Tag: TObject) of object;
  TSingleSetFunc = function(Src: TDataSet): boolean of object;
  TDoubleSetFunc = function(Src, Dst: TDataSet): boolean of object;
  TFieldFilterFunc = function (FieldName: ShortString): boolean of object;

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
  private
    class function MapSrcFieldName(
      SrcFieldName: ShortString; FieldNameMap: TFieldNameMap): ShortString;

  public
    class function RecordsAreEqual(Rec1, Rec2: TDataSet): boolean;

    class procedure CopyStruct(SrcDs, DstDs: TDataSet;
      FldFilterFunc: TFieldFilterFunc = nil);

    // Копировать запись из одного набора данных в другой.
    class function CopyRecord(SrcRec, DstRec: TDataSet;
      FieldNameMap: TFieldNameMap = nil;
      Filter: TFieldFilterFunc = nil): boolean;

    class procedure InsertCopy(DataSet: TDataSet);

    // Переместить запись из одного набора данных в другой.
    class procedure MoveRecord(SrcRec, DstRec: TDataSet;
      FieldNameMap: TFieldNameMap = nil);

    // Копировать набор данных в другой.
    class procedure CopyDataSet(SrcDS, DstDS: TDataSet;
      FieldNameMap: TFieldNameMap = nil;
      CopyHandler: TDoubleSetFunc = nil;
      CopyFilter: TSingleSetFunc = nil;
      FromFirst: Boolean = true);

    class procedure CopyRowSet(SrcDS, DstDS: TDataSet;
      FieldNameMap: TFieldNameMap = nil;
      CopyHandler: TDoubleSetFunc = nil;
      CopyFilter: TSingleSetFunc = nil;
      FromFirst: Boolean = true);

    class procedure DeleteFromDataSet(DataSet: TDataSet;
      FromFirst: Boolean = true; FilterFunc: TSingleSetFunc = nil);

    // Для каждой записи исходного набора выполнить .
    class procedure EnumRowset(DataSet: TDataSet; EnumProc: TSingleSetProc);

    class procedure EnumDataSet(DataSet: TDataSet;
      EnumProc: TSingleSetProc; DataTag: TObject = nil);

    class function EnumAndDecide(DataSet: TDataSet;
      DecisionProc: TDecisionProc): TEnumDecision;

    class function ReadArray(SrcRec: TDataSet;
      var FieldNames: TCustStrArr): TCustVarArr;
    class procedure WriteArray(
      FieldNames: TCustStrArr; Values: TCustVarArr; Dst: TDataSet);
    class procedure CompareWithArray(DataSet: TDataSet; FldNames: TCustStrArr;
      Arr: TCustVarArr);

    class procedure SplitBySubtraction(
      MinuendRec: TDataSet; Subtrahend: TPeriod;
      BegDtFieldName: ShortString = 'Dt_Beg'; EndDtFieldName: ShortString = 'Dt_End');
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

//--------------------------------------------------------------------------------------------------
class function DsUtils.RecordsAreEqual(Rec1, Rec2: TDataSet): boolean;
var
  Count, I: integer;
  FieldName: string;
begin
  Result := true;
  Count := Rec1.FieldDefs.Count;

  for I := 0 to Count - 1 do begin
    FieldName := Rec1.FieldDefs[I].Name;

    // Тупость ситуации в том, что, не смотря на то, что SrcFieldName
    // получен у Rec1, в некоторых случаях, при обращении к
    // Rec1.FieldByName(FieldName).Value, оказывается, что у Rec1
    // этого поля нет. Возможно оптимизация для пустых полей. Поэтому
    // добавлена проверка 'and (Rec1.FindField(FieldName) <> nil)'.
    if (Rec1.FindField(FieldName) = nil)
        or (Rec2.FindField(FieldName) = nil)
        or (Rec1.FieldByName(FieldName).Value <>
        Rec2.FieldByName(FieldName).Value) then begin
      Result := false;
      break;
    end;
  end;
end;

//------------------------------------------------------------------------------
class procedure DsUtils.CopyStruct(
  SrcDs, DstDs: TDataSet;
  FldFilterFunc: TFieldFilterFunc = nil);
var
  // Len,
  I: integer;
  // SrcField, DstField: TField;
begin
  with DstDs do begin
    Close;
    FieldDefs.Clear;
    Fields.Clear;
  end;

  // Копируем описания полей.
  for I := 0 to SrcDs.FieldDefs.Count - 1 do
    with SrcDs.FieldDefs[I], DstDs.FieldDefs do
      if not Assigned(FldFilterFunc) or FldFilterFunc(Name) then
        Add(Name, DataType, Size);

  // Копируем поля.
  {
  with SrcDs, Fields do begin
    Len := Count;

    for I := 0 to Len - 1 do begin
      SrcField := Fields[I];

      if not Assigned(FldFilterFunc)
          or FldFilterFunc(SrcField.FieldName) then begin

        DstField := TCustField.CloneField(SrcField, DstDs);
        DstDs.Fields.Add(DstField);
      end;
    end;
  end;
  }
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class function DsUtils.CopyRecord(
  SrcRec, DstRec: TDataSet;
  FieldNameMap: TFieldNameMap = nil;
  Filter: TFieldFilterFunc = nil): boolean;
var
  Count, I: integer;
  SrcFieldName, DstFieldName: string;
  SrcField: TField;
begin
//  Result := SrcRec.RecordCount > 0;

//  if Result then begin
    Count := SrcRec.FieldDefs.Count;

    for I := 0 to Count - 1 do begin
      SrcFieldName := SrcRec.FieldDefs[I].Name;
      DstFieldName := MapSrcFieldName(SrcFieldName, FieldNameMap);

      // Тупость ситуации в том, что, не смотря на то, что SrcFieldName
      // получен у SrcRec, в некоторых случаях, при обращении к
      // SrcRec.FieldByName(SrcFieldName).Value, оказывается, что у SrcRec
      // этого поля нет. Возможно оптимизация для пустых полей. Поэтому
      // добавлена проверка 'and (SrcRec.FindField(SrcFieldName) <> nil)'.

      SrcField := SrcRec.FindField(SrcFieldName);

      if (DstRec.FindField(DstFieldName) <> nil) and (SrcField <> nil)
        and (not Assigned(Filter) or Filter(SrcField.FieldName))
      then
        DstRec.FieldByName(DstFieldName).Value :=
          SrcRec.FieldByName(SrcFieldName).Value;
    end;
    
    Result := true;
//  end;
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure DsUtils.MoveRecord(
  SrcRec, DstRec: TDataSet;
  FieldNameMap: TFieldNameMap);
begin
  if CopyRecord(SrcRec, DstRec, FieldNameMap) then
    SrcRec.Delete;
end;

//------------------------------------------------------------------------------
class procedure DsUtils.CopyDataSet(
  SrcDS, DstDS: TDataSet;
  FieldNameMap: TFieldNameMap = nil;
  CopyHandler: TDoubleSetFunc = nil;
  CopyFilter: TSingleSetFunc = nil;
  FromFirst: Boolean = true
);
begin
  CopyRowSet(SrcDS, DstDS, FieldNameMap, CopyHandler, CopyFilter);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class procedure DsUtils.CopyRowSet(
  SrcDS, DstDS: TDataSet;
  FieldNameMap: TFieldNameMap = nil;
  CopyHandler: TDoubleSetFunc = nil;
  CopyFilter: TSingleSetFunc = nil;
  FromFirst: Boolean = true);
begin
  with SrcDS do begin
    if FromFirst then
      First;

    while not Eof do begin
      with DstDS do begin
        if not Assigned(CopyFilter) or CopyFilter(SrcDS) then begin
          Append;
          CopyRecord(SrcDS, DstDS, FieldNameMap);

          if Assigned(CopyHandler)
              and not CopyHandler(SrcDS, DstDS) then begin
            // Например, прервали копирование.
            Cancel;
            break;
          end;

          Post;
        end;
      end; {with DstDS}

      Next;
    end; {while}
  end; {with SrcDS}
end;

//--------------------------------------------------------------------------------------------------
class procedure DsUtils.DeleteFromDataSet(
  DataSet: TDataSet;
  FromFirst: Boolean = true;
  FilterFunc: TSingleSetFunc = nil
);
begin
  with DataSet do begin
    if FromFirst then
      First;

    while not Eof do
      if not Assigned(FilterFunc) or FilterFunc(DataSet) then
        Delete
      else
        Next;
  end;
end;

//--------------------------------------------------------------------------------------------------
class procedure DsUtils.InsertCopy(DataSet: TDataSet);
var
  FieldNames: TCustStrArr;
  Values: TCustVarArr;
begin
  Values := ReadArray(DataSet, FieldNames);
  DataSet.Insert;
  WriteArray(FieldNames, Values, DataSet);
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class function DsUtils.MapSrcFieldName(
  SrcFieldName: ShortString;
  FieldNameMap: TFieldNameMap): ShortString;
var
  Count, I: integer;
begin
  Result := SrcFieldName;

  if Assigned(FieldNameMap) then begin
    Count := Length(FieldNameMap);

    for I := 0 to Count - 1 do
      if UpperCase(FieldNameMap[I].SrcFieldName) = UpperCase(SrcFieldName) then begin
        Result := FieldNameMap[I].DstFieldName;
        break;
      end;
  end;
end; {MapSrcFieldName}

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure DsUtils.EnumRowset(DataSet: TDataSet; EnumProc: TSingleSetProc);
begin
  EnumDataSet(DataSet, EnumProc);
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure DsUtils.EnumDataSet(
  DataSet: TDataSet;
  EnumProc: TSingleSetProc;
  DataTag: TObject);
begin
  with DataSet do begin
    First; // DEBUG Call in call-point.

    while not Eof do begin
      EnumProc(DataSet, DataTag);
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
class function DsUtils.EnumAndDecide(
  DataSet: TDataSet;
  DecisionProc: TDecisionProc): TEnumDecision;
  // var
  //   LastRec: boolean;
begin
  Result := EnumContinue;

  with DataSet do begin
    // First, если надо, делаем, в точке вызова, т.к.,
    // бывает необходимым обрабатывать с текущей позиции.

    while not Eof do begin
      // LastRec := LastRecReached(DataSet);

      DecisionProc(DataSet, Result);

      if Result in [EnumFailed, EnumSuccess] then
        break
      // else if LastRec then
      //   break
      else // Proceed
        Next;
    end;
  end;
end;

//--------------------------------------------------------------------------------------------------
// Читает содержимое полей FieldNames в массив Values.
//--------------------------------------------------------------------------------------------------
class function DsUtils.ReadArray(SrcRec: TDataSet;
  var FieldNames: TCustStrArr): TCustVarArr;
var
  Count, I: integer;
  FieldName: ShortString;
begin
  if SrcRec.RecordCount > 0 then begin
    Count := Length(FieldNames);

    // Если набор полей не задан, используем все поля источника данных
    if Count = 0 then begin
      Count := SrcRec.FieldDefs.Count;
      SetLength(FieldNames, Count);

      for I := 0 to Count - 1 do
        FieldNames[I] := SrcRec.FieldDefs[I].Name;
    end;

    SetLength(Result, Count);

    for I := 0 to Count - 1 do begin
      FieldName := FieldNames[I];

      if SrcRec.FindField(FieldName) <> nil then
        Result[I] := SrcRec.FieldByName(FieldName).Value;
    end;
  end;
end;

//--------------------------------------------------------------------------------------------------
// Пишет поля FieldNames из массива Values.
//--------------------------------------------------------------------------------------------------
class procedure DsUtils.WriteArray(
  FieldNames: TCustStrArr; Values: TCustVarArr; Dst: TDataSet);
var
  I: integer;
  FieldName: ShortString;
begin
  for I := 0 to Length(FieldNames) - 1 do begin
    FieldName := FieldNames[I];

    if Dst.FindField(FieldName) <> nil then
      Dst.FieldByName(FieldName).Value := Values[I];
  end;
end;

//--------------------------------------------------------------------------------------------------
class procedure DsUtils.CompareWithArray(
  DataSet: TDataSet;
  FldNames: TCustStrArr;
  Arr: TCustVarArr
);
var
  I: Integer;
begin

end;

//--------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
class procedure DsUtils.SplitBySubtraction(
  MinuendRec: TDataSet; Subtrahend: TPeriod;
  BegDtFieldName, EndDtFieldName: ShortString);
var
  Minuend: TPeriod;
  Periods: TPeriods;
  Len: integer;
begin
  with MinuendRec, DateUtils do begin
    Minuend := InitPeriod(
      FieldByName(BegDtFieldName).AsDateTime, FieldByName(EndDtFieldName).AsDateTime);

    Periods := SubtractPeriods(Minuend, Subtrahend);
    Len := Length(Periods);

    if Len = 0 then
      Delete
    else begin
      Minuend := Periods[0];

      Edit;
      FieldByName(BegDtFieldName).AsDateTime := Minuend.Start;
      FieldByName(EndDtFieldName).AsDateTime := Minuend.Finish;
      Post;

      if Len > 1 then begin
        Minuend := Periods[1];

        DsUtils.InsertCopy(MinuendRec);
        FieldByName(BegDtFieldName).AsDateTime := Minuend.Start;
        FieldByName(EndDtFieldName).AsDateTime := Minuend.Finish;
        Post;
      end;
    end;
  end;
end; {SubtractPeriod}

end.

