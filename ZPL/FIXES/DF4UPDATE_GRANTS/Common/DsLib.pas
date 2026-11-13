unit DsLib;

interface

uses
  Classes, Db, DateLib;

type
  TCustStrArr = array of ShortString;
  TCustVarArr = array of Variant;

  TEnumDecision = (EnumProceed, EnumBreak, EnumDone);

  TDecisionProc = procedure(
    DataSet: TDataSet; var Decision: TEnumDecision) of object;

  TFieldNameMapItem = record
    SrcFieldName,
    DstFieldName: ShortString;
  end;
  TFieldNameMap = array of TFieldNameMapItem;

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
    class function RecordsAreEqual(Rec1, Rec2: TDataSet;
      FldFilter: TFieldFilterFunc = nil): boolean;

    class procedure CopyStruct(SrcDs, DstDs: TDataSet;
      FldFilterFunc: TFieldFilterFunc);

    class procedure CopyFldDefs(SrcDs, DstDs: TDataSet;
      FldFilterFunc: TFieldFilterFunc);

    // Копировать запись из одного набора данных в другой.
    class function CopyRecord(SrcRec, DstRec: TDataSet;
      Filter: TFieldFilterFunc = nil;
      FieldNameMap: TFieldNameMap = nil): boolean;

    // Переместить запись из одного набора данных в другой.
    class procedure MoveRecord(SrcRec, DstRec: TDataSet;
      FieldNameMap: TFieldNameMap = nil);

    // Копировать набор данных в другой.
    class procedure CopyRowset(SrcDS, DstDS: TDataSet;
      FieldNameMap: TFieldNameMap = nil;
      CopyHandler: TDoubleSetFunc = nil;
      CopyFilter: TSingleSetFunc = nil);

    // Для каждой записи исходного набора выполнить .
    {Obsolete} class procedure EnumRowset(DataSet: TDataSet;
      EnumProc: TSingleSetProc);
    class procedure EnumDataSet(DataSet: TDataSet;
      EnumProc: TSingleSetProc; DataTag: TObject = nil);

    class function EnumAndDecide(DataSet: TDataSet;
      DecisionProc: TDecisionProc): TEnumDecision;

    class function LastRecReached(DataSet: TDataSet): boolean;

    class procedure InsertCopy(DataSet: TDataSet);

    class function ReadArray(SrcRec: TDataSet;
      var FieldNames: TCustStrArr): TCustVarArr;
    class procedure WriteArray(
      FieldNames: TCustStrArr; Values: TCustVarArr; Dst: TDataSet);

    class procedure SplitBySubtraction(
      MinuendRec: TDataSet; Subtrahend: TPeriod;
      BegDtFieldName: ShortString = 'Dt_Beg';
      EndDtFieldName: ShortString = 'Dt_End');
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
class function DsUtils.RecordsAreEqual(
  Rec1, Rec2: TDataSet;
  FldFilter: TFieldFilterFunc = nil): boolean;
var
  Count, I: integer;
  FieldName: string;
begin
  Result := true;
  Count := Rec1.FieldDefs.Count;

  for I := 0 to Count - 1 do begin
    FieldName := Rec1.FieldDefs[I].Name;

    if Assigned(FldFilter) and not FldFilter(FieldName) then
      continue;

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
  FldFilterFunc: TFieldFilterFunc);
// var
  // Len,
  // I: integer;
  // SrcField, DstField: TField;
begin
  with DstDs do begin
    Close;
    FieldDefs.Clear;
    Fields.Clear;
  end;

  CopyFldDefs(SrcDs, DstDs, FldFilterFunc);

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
// Копируем описания полей.
//------------------------------------------------------------------------------
class procedure DsUtils.CopyFldDefs(
  SrcDs, DstDs: TDataSet;
  FldFilterFunc: TFieldFilterFunc);
var
  Len, I: integer;
begin
  with SrcDs, FieldDefs do begin
    Len  := Count;

    for I := 0 to Len - 1 do
      with FieldDefs[I] do
        if not Assigned(FldFilterFunc) or FldFilterFunc(Name) then
          DstDs.FieldDefs.Add(Name, DataType, Size);
  end;
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class function DsUtils.CopyRecord(
  SrcRec, DstRec: TDataSet;
  Filter: TFieldFilterFunc = nil;
  FieldNameMap: TFieldNameMap = nil): boolean;
var
  Count, I: integer;
  SrcFieldName, DstFieldName: string;
  SrcField: TField;
begin
  Result := SrcRec.RecordCount > 0;

  if Result then begin
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
          and (not Assigned(Filter) or Filter(SrcField.FieldName)) then

        DstRec.FieldByName(DstFieldName).Value :=
          SrcRec.FieldByName(SrcFieldName).Value;
    end;
  end;
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure DsUtils.MoveRecord(
  SrcRec, DstRec: TDataSet;
  FieldNameMap: TFieldNameMap);
begin
  if CopyRecord(SrcRec, DstRec, nil, FieldNameMap) then
    SrcRec.Delete;
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure DsUtils.CopyRowset(
  SrcDS, DstDS: TDataSet;
  FieldNameMap: TFieldNameMap;
  CopyHandler: TDoubleSetFunc; CopyFilter: TSingleSetFunc);
begin
  with SrcDS do begin
    First;

    while not Eof do begin
      with DstDS do begin
        if not Assigned(CopyFilter) or CopyFilter(SrcDS) then begin
          Append;
          CopyRecord(SrcDS, DstDS, nil, FieldNameMap);

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
class procedure DsUtils.EnumDataSet(
  DataSet: TDataSet;
  EnumProc: TSingleSetProc;
  DataTag: TObject);
begin
  with DataSet do begin
    // First; Call in call-point.

    while not Eof do begin
      EnumProc(DataSet, DataTag);
      Next;
    end;
  end;
end;
//..............................................................................
// Obsolete.
//..............................................................................
class procedure DsUtils.EnumRowset(
  DataSet: TDataSet;
  EnumProc: TSingleSetProc);
begin
  EnumDataSet(DataSet, EnumProc);
end;

//------------------------------------------------------------------------------
class function DsUtils.EnumAndDecide(
  DataSet: TDataSet;
  DecisionProc: TDecisionProc): TEnumDecision;
  // var
  //   LastRec: boolean;
begin
  Result := EnumProceed;

  with DataSet do begin
    // First, если надо, делаем, в точке вызова, т.к.,
    // бывает необходимым обрабатывать с текущей позиции.

    while not Eof do begin
      // LastRec := LastRecReached(DataSet);

      DecisionProc(DataSet, Result);

      if Result in [EnumBreak, EnumDone] then
        break
      // else if LastRec then
      //   break
      else // Proceed
        Next;
    end;
  end;
end;
{
//..............................................................................
class function InitDecision: TEnumDecision;
class function DsUtils.InitDecision: TEnumDecision;
begin
  with Result do begin
    Next := true;
    Leave := false;
  end;
end;
}

//------------------------------------------------------------------------------
// Проверка нужна для случая, если в процессе работы с набором удалил последнюю
// запись. В этом случае, курсор переходит на предыдущую, не
// выставляя признака Eof. Таким образом, цикл для записи предыдущей удалённой
// выполнится лишний раз. Чтобы избежать этого, каждую текущую запись
// проверяем на Last Reached, и если - да, на следующем шаге выходим из цикла.
//------------------------------------------------------------------------------
class function DsUtils.LastRecReached(DataSet: TDataSet): boolean;
begin
  with DataSet do begin
    Next;
    Result := Eof;

    // Если запись последняя, текущая не изменилась,
    // просто выставился, признак Eof, ...
    if not Eof then
      // ... иначе - возвращаемся на текущую.
      Prior;
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
end; {InsertCopy}

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

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
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
      FieldByName(BegDtFieldName).AsDateTime,
      FieldByName(EndDtFieldName).AsDateTime);

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
