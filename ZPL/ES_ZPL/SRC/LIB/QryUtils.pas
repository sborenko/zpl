unit QryUtils;

interface

uses
  SysUtils, Variants, DB, DBTables, DBClient, CustDateUtils, DsLib;

type
  TBookmarkAction = (SAVE_POSITION, RESTORE_POSITION);

  TCustStrArr = array of ShortString;
  TCustVarArr = array of Variant;

{
  TFieldNameMapItem = record
    SrcFieldName,
    DstFieldName: ShortString;
  end;
  TFieldNameMap = array of TFieldNameMapItem;
}

  // TNullParamProc = procedure of object;
  TPeriodProc = procedure(Period: TPeriod) of object;
  TSingleSetProc = procedure(Src: TDataSet) of object;
  TSingleSetFunc = function(Src: TDataSet): boolean of object;
  TDoubleSetProc = procedure(Src, Dst: TDataSet) of object;
  TBookmarkHnd = procedure(Action: TBookmarkAction) of object;
  TFieldFilterFunc = function(Field: TField): boolean;

  TQryUtils = class
  private
    class procedure ResetQuery(Query: TQuery);

{
    class function MapSrcFieldName(
      SrcFieldName: ShortString; FieldNameMap: TFieldNameMap): ShortString;
}

  public
    class function PeekUpi(
      qryPeek: TQuery;
      nTabN: integer): boolean;

    class function PeekPrmUv(
      qryPeek: TQuery;
      nTabN: integer;
      dOnDate: TDateTime): boolean;

    class function PeekPere(
      qryPeek: TQuery;
      nTabN: integer;
      dOnDate: TDateTime;
      bExact: boolean): boolean;

    class function PeekPrevPereForPrmUv(
      qryPeek: TQuery;
      nTabN: integer;
      dOnDate: TDateTime): boolean;

    class function PeekNadb(
      qryPeek: TQuery;
      nTabN: integer;
      cVidN: string;
      dOnDate: TDateTime): boolean;

    class function PeekVidN(
      qryPeek: TQuery;
      cVidN: string): boolean;

    class function PeekOsnUvoln(
      qryPeek: TQuery;
      nOsnUvoln: integer): boolean;

    class function PeekDekr(
      qryPeek: TQuery;
      nTabN, nSpecNr: integer;
      period: TPeriod): boolean;

    class function PeekUser(
      qryPeek: TQuery;
      UserId: integer): boolean;

    class function PeekPosition(QryPeek: TQuery; PositionId: integer): boolean;

    class function PeekSps(EmplId: integer; Date: TDateTime): TQuery;

    class function PeekInvDoc(
      Qry: TQuery; EmplId: integer; OnDate: TDateTime): boolean;

    class function PrepareByFields(
      TableName: ShortString;
      FldNames: array of string;
      Values: array of Variant): TQuery;

    class function SelectByFields(
      TableName: ShortString;
      FldNames: array of string;
      Values: array of Variant): TQuery;

    class procedure SelectEmploymnts(
      Query: TQuery; EmplId: integer; Period: TPeriod) ;
    class procedure SelectEmplmntAssgns(
      Query: TQuery; EmplId: integer; Period: TPeriod) ;
    class procedure SelectAllowances(
      Query: TQuery; EmplId: integer; Period: TPeriod) ;
    class procedure SelectDeviations(Query: TQuery;
      EmplId: integer; TargetPeriod: TPeriod; AsOfDate: TDateTime = 0);

    class function CreateQuery(DataBaseName: string = ''): TQuery;
    class procedure InitQuery(Query: TQuery; DataBaseName: string = '');
    class procedure ReleaseQuery(Query: TQuery);

    class procedure CreateCds(Ds: TDataSet; Cds: TClientDataSet); overload;
    class function CreateCds(Ds: TDataSet): TClientDataSet; overload;
    class procedure CreateTable(SrcDS: TDataSet; DstTable: TTable);
    class procedure CopyStruct(SrcDS: TDataSet; DstDS: TDataSet);

    // Копировать набор данных в другой.
    class procedure CopyRowset(SrcDS, DstDS: TDataSet;
      FieldNameMap: TFieldNameMap = nil;
      CopyHandler: TDoubleSetProc = nil;
      CopyFilter: TSingleSetFunc = nil);

    // Для каждой записи исходного набора выполнить .
    class procedure EnumRowset(SrcDS, DstRec: TDataSet;
      FieldNameMap: TFieldNameMap = nil;
      EnumHandler: TDoubleSetProc = nil;
      EnumFilter: TSingleSetFunc = nil);

    // Переместить запись из одного набора данных в другой.
    class procedure MoveRecord(SrcRec, DstRec: TDataSet;
      FieldNameMap: TFieldNameMap = nil);

{
    // Копировать запись из одного набора данных в другой.
    class function CopyRecord(SrcRec, DstRec: TDataSet;
      FieldNameMap: TFieldNameMap = nil;
      Filter: TFieldFilterFunc = nil): boolean;
}

    class function RecordsAreEqual(Rec1, Rec2: TDataSet): boolean;

    class procedure InsertCopy(DataSet: TDataSet);

    class function ReadArray(SrcRec: TDataSet;
      var FieldNames: TCustStrArr): TCustVarArr;
    class procedure WriteArray(
      FieldNames: TCustStrArr; Values: TCustVarArr; Dst: TDataSet);

    class procedure SplitByIntersection(
      DataSetRec: TDataSet; Period: TPeriod;
      BookmarkHnd: TBookmarkHnd; MainPartHnd, RemainHnd: TPeriodProc;
      BegDtFieldName: ShortString = 'Dt_Beg'; EndDtFieldName: ShortString = 'Dt_End');

    class procedure SplitBySubtraction(
      MinuendRec: TDataSet; Subtrahend: TPeriod;
      BegDtFieldName: ShortString = 'Dt_Beg'; EndDtFieldName: ShortString = 'Dt_End');
  end;

implementation

uses
  A_CONST;

//------------------------------------------------------------------------------
class function TQryUtils.PeekUpi(
  qryPeek: TQuery;
  nTabN : integer): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add('select * from z_UPI where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekPrmUv(
  qryPeek: TQuery;
  nTabN: integer;
  dOnDate: TDateTime): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select first 1 * ' +
      'from z_PrmUv ' +
      'where TabN = :nTabN ' +
        'and Dt_Priem <= :OnDate ' +
      'order by Dt_Priem desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('OnDate').AsDateTime := dOnDate;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekPere(
  qryPeek: TQuery;
  nTabN: integer;
  dOnDate: TDateTime;
  bExact: boolean): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select first 1 * from z_Pere ' +
      'where TabN = :TabN ' +
        'and Dt_Beg <= :OnDate ' +
      'order by Dt_Beg desc');

    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('OnDate').AsDateTime := dOnDate;
    Open;

    Result := RecordCount > 0;

    if not Result and not bExact then begin
      InitQuery(qryPeek);

      SQL.Add(
        'select first 1 * from z_Pere ' +
        'where TabN = :TabN ' +
      'order by Dt_Beg');
      ParamByName('TabN').AsInteger := nTabN;
      Open;
    end;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
// nOnDate - дата текущего перемещения
//------------------------------------------------------------------------------
class function TQryUtils.PeekPrevPereForPrmUv(
  qryPeek: TQuery;
  nTabN: integer;
  dOnDate: TDateTime): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
{      'select first 1 * ' + }
      'select first 1 p.TabN, p.NewKdOK, p.KdKatP, p.Sovm, p.Is_Pere, ' +
        'p.Dt_Beg, p.Dt_Prikaza DtPrPere, p.Nr_Prikaza NrPrPere, ' +
        'u.Dt_Priem, u.Dt_Prikaza DtPrPriem, u.Nr_Prikaza NrPrPriem, ' +
        'u.Dt_Uvoln, u.Dt_PrUvoln, u.Nr_PrUvoln, u.KdPidZv ' +
      'from z_Pere p ' +
        'left join z_PrmUv u on u.TabN = p.TabN ' +
      'where ' +
        'p.TabN = :TabN ' +
        'and p.Dt_Beg <= :OnDate - 1 ' +
        'and u.Dt_Priem = ( ' +
          'select Max(Dt_Priem) ' +
          'from z_PrmUv ' +
          'where TabN = p.TabN and Dt_Priem <= p.Dt_Beg) ' +
        'and (:OnDate <= u.Dt_Uvoln or u.Dt_Uvoln is null) ' +
        'order by Dt_Beg desc');

    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('OnDate').AsDateTime := dOnDate;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekNadb(
  qryPeek: TQuery;
  nTabN: integer;
  cVidN: string;
  dOnDate: TDateTime): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select first 1 * from z_Nadb ' +
      'where TabN = :TabN ' +
        'and VidN = :VidN ' +
        'and Dt_Beg <= :OnDate ' +
        'and (Dt_End is null or Dt_End >= :OnDate) ' +
      'order by Dt_Beg desc');
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('VidN').AsString := cVidN;
    ParamByName('OnDate').AsDateTime := dOnDate;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekVidN(
  qryPeek: TQuery;
  cVidN: string): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select * from z_KdVidN ' +
      'where VidN = :VidN');
    ParamByName('VidN').AsString := cVidN;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekOsnUvoln(
  qryPeek: TQuery;
  nOsnUvoln: integer): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select * from Z_PidZviln ' +
      'where Code = :Code');
    ParamByName('Code').AsInteger := nOsnUvoln;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekDekr(
  qryPeek: TQuery;
  nTabN, nSpecNr: integer;
  period: TPeriod): boolean;
begin
  InitQuery(qryPeek);

  with qryPeek do begin
    SQL.Add(
      'select v.Notes, v.NrList, v.DtList ' +
      'from z_otkl o ' +
        'left join z_vbln v on v.spec_nr = o.spec_nr ' +
      'where ' +
        'o.tabn = :TabN and ' +
        'o.dt_beg >= :DtBeg and o.dt_end <= :DtEnd ' +
        'and o.vidn = "2602"');

    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('DtBeg').AsDateTime := period.start;
    ParamByName('DtEnd').AsDateTime := period.finish;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekUser(
  QryPeek: TQuery;
  UserId: integer): boolean;
begin
  InitQuery(qryPeek);

  with QryPeek do begin
    SQL.Add(
      'select * ' +
      'from Usrs ' +
      'where KdUsr = :KdUsr');
    ParamByName('KdUsr').AsInteger := UserId;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekPosition(QryPeek: TQuery; PositionId: integer): boolean;
begin
  InitQuery(QryPeek);

  with QryPeek do begin
    SQL.Add(
      'select * ' +
      'from O_Dolgnost ' +
      'where KdOk = :PosId');
    ParamByName('PosId').AsInteger := PositionId;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekSps(EmplId: integer; Date: TDateTime): TQuery;
begin
  Result := CreateQuery;

  with Result do begin
    SQL.Add(
      'select * ' +
      'from z_Sps ' +
      'where TabN = :TabN ' +
        'and DtProc = :DtProc');
    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := Date;
    Open;

    if RecordCount = 0 then begin
      Free;
      Result := nil;
    end;
  end; {with}
end;

//------------------------------------------------------------------------------
class function TQryUtils.PeekInvDoc(
  Qry: TQuery;
  EmplId: integer;
  OnDate: TDateTime): boolean;
begin
  InitQuery(Qry);
  
  with Qry do begin
    SQL.Add(
      'select first 1 * ' +
      'from z_InvDocs ' +
      'where TabN = :EmplId ' +
        'and DtBeg <= :OnDate ' +
        'and (DtEnd >= :OnDate ' +
          'or DtEnd is null) ' +
      'order by DtBeg desc');
    ParamByName('EmplId').AsInteger := EmplId;
    ParamByName('OnDate').AsDateTime := OnDate;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function TQryUtils.CreateQuery(DataBaseName: string = ''): TQuery;
begin
  Result := TQuery.Create(nil);
  InitQuery(Result, DataBaseName);
end;

//------------------------------------------------------------------------------
class procedure TQryUtils.InitQuery(
  Query: TQuery;
  DataBaseName: string = '');
begin
  ResetQuery(Query);

  if Query.DataBaseName = '' then
    if DataBaseName = '' then begin
      Query.DataBaseName := CESMAIN;
    end else
      Query.DataBaseName := DataBaseName;
end;

//------------------------------------------------------------------------------
class procedure TQryUtils.ResetQuery(Query: TQuery);
begin
  with Query do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
  end;
end;

//------------------------------------------------------------------------------
class procedure TQryUtils.ReleaseQuery(Query: TQuery);
begin
  ResetQuery(Query);
  Query.DataBaseName := '';
end;


//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure TQryUtils.CopyRowset(
  SrcDS, DstDS: TDataSet;
  FieldNameMap: TFieldNameMap;
  CopyHandler: TDoubleSetProc; CopyFilter: TSingleSetFunc);
begin
  with SrcDS do begin
    First;

    while not Eof do begin
      with DstDS do begin
        if not Assigned(CopyFilter) or CopyFilter(SrcDS) then begin
          Append;
          DsUtils.CopyRecord(SrcDS, DstDS, FieldNameMap);

          if Assigned(CopyHandler) then
            CopyHandler(SrcDS, DstDS);

          Post;
        end;
      end; {with DstDS}

      Next;
    end; {while}
  end; {with SrcDS}
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure TQryUtils.EnumRowset(
  SrcDS, DstRec: TDataSet;
  FieldNameMap: TFieldNameMap;
  EnumHandler: TDoubleSetProc; EnumFilter: TSingleSetFunc);
begin
  with SrcDS do begin
    First;

    while not Eof do begin
      if not Assigned(EnumFilter) or EnumFilter(SrcDS) then
        EnumHandler(SrcDS, DstRec);

      Next;
    end; {while}
  end; {with SrcDS}
end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class procedure TQryUtils.MoveRecord(
  SrcRec, DstRec: TDataSet;
  FieldNameMap: TFieldNameMap);
begin
  if DsUtils.CopyRecord(SrcRec, DstRec, FieldNameMap) then
    SrcRec.Delete;
end;

{
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
class function TQryUtils.CopyRecord(
  SrcRec, DstRec: TDataSet;
  FieldNameMap: TFieldNameMap = nil;
  Filter: TFieldFilterFunc = nil): boolean;
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
          and (not Assigned(Filter) or Filter(SrcField)) then
        DstRec.FieldByName(DstFieldName).Value := SrcRec.FieldByName(SrcFieldName).Value;
    end;
  end;
end;
}

//--------------------------------------------------------------------------------------------------
class function TQryUtils.RecordsAreEqual(Rec1, Rec2: TDataSet): boolean;
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

//--------------------------------------------------------------------------------------------------
class procedure TQryUtils.InsertCopy(DataSet: TDataSet);
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
class function TQryUtils.ReadArray(SrcRec: TDataSet;
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
class procedure TQryUtils.WriteArray(
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
//--------------------------------------------------------------------------------------------------
class procedure TQryUtils.CreateCds(Ds: TDataSet; Cds: TClientDataSet);
var
  I: integer;
begin
  with Cds do begin
    Close;
    FieldDefs.Clear;
    IndexDefs.Clear;
  end;

  for I := 0 to Ds.FieldDefs.Count - 1 do
    with Ds.FieldDefs[I], Cds.FieldDefs do
      Add(Name, DataType, Size);

  Cds.CreateDataSet;
end; {CreateCDS}

//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
class function TQryUtils.CreateCds(Ds: TDataSet): TClientDataSet;
begin
  Result := TClientDataSet.Create(nil);
  CreateCds(Ds, Result);
end; {CreateCDS}

//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
class procedure TQryUtils.CreateTable(SrcDS: TDataSet; DstTable: TTable);
begin
  CopyStruct(SrcDS, DstTable);
  DstTable.CreateTable;
end;

//--------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
class procedure TQryUtils.CopyStruct(SrcDS: TDataSet; DstDS: TDataSet);
var
  I: integer;
begin
  with DstDS do begin
    Close;
    FieldDefs.Clear;
  end;

  for I := 0 to SrcDS.FieldDefs.Count - 1 do
    with SrcDS.FieldDefs[I], DstDS.FieldDefs do
      Add(Name, DataType, Size);
end;

//------------------------------------------------------------------------------
class function TQryUtils.PrepareByFields(
  TableName: ShortString;
  FldNames: array of string;
  Values: array of Variant): TQuery;
var
  I: integer;
  Value: Variant;
  ValueType: TVarType;
  Quat, Where, Order: ShortString;
begin
  Result := CreateQuery;

  with Result do begin
    SQL.Add('select * from ' + TableName + ' where');

    Order := '';

    for I := 0 to Length(FldNames) - 1 do begin
      Value := Values[I];
      ValueType := VarType(Value);

      if I > 0 then
        SQL.Add('and');

      Quat := '';
      if (ValueType = varString) or (ValueType = varDate) then
        Quat := '''';
      Where := FldNames[I] + '=' + Quat + VarToStr(Value) + Quat;

      if Order <> '' then
        Order := Order + ', ';
      Order := Order + FldNames[I];

      SQL.Add(Where);
    end;

    SQL.Add('order by ' + Order);
  end; {with}
end; {PrepareByFields}

//------------------------------------------------------------------------------
class function TQryUtils.SelectByFields(
  TableName: ShortString;
  FldNames: array of string;
  Values: array of Variant): TQuery;
begin
  Result := PrepareByFields(TableName, FldNames, Values);
  Result.Open;
end; {SelectByFields}

//--------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
class procedure TQryUtils.SelectEmploymnts(
  Query: TQuery;
  EmplId: integer;
  Period: TPeriod);
begin
  InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select * ' +
      'from Z_PrmUv ' +
      'where TabN = :TabN');

    if Period.Finish > 0 then
      SQL.Add(
        'and Dt_Priem <= :PeriodEnd');

    if Period.Start > 0 then
      SQL.Add(
        'and (Dt_Uvoln >= :PeriodBeg or Dt_Uvoln is null)');
          
    SQL.Add(
      'order by Dt_Priem');

    ParamByName('TabN').AsInteger := EmplId;

    if Period.Start > 0 then
      ParamByName('PeriodBeg').AsDateTime := Period.Start;
      
    if Period.Finish > 0 then
      ParamByName('PeriodEnd').AsDateTime := Period.Finish;

    Open;
  end;
end;

//--------------------------------------------------------------------------------------------------
// Начало периода, заданного параметром Period использовать напрямую нельзя.
// Вместо него надо использовать начало периода приёма/увольнения
// для начала заданного периода.
//--------------------------------------------------------------------------------------------------
class procedure TQryUtils.SelectEmplmntAssgns(
  Query: TQuery;
  EmplId: integer;
  Period: TPeriod);
var
  EmplDate: TDateTime;
begin
  InitQuery(Query);

  with Query do begin
    // Находим приём/увольнение для заданного периода.
    SQL.Add(
      'select * ' +
      'from z_PrmUv pu ' +
      'where TabN = :TabN ' +
        'and Dt_Priem = (' +
          'select Max(Dt_Priem) ' +
          'from z_PrmUv ' +
          'where TabN = pu.TabN ' +
            'and Dt_Priem <= :PeriodBeg');
    if Period.Finish > 0 then
      SQL.Add(
            'and (Dt_Uvoln >= :PeriodEnd or Dt_Uvoln is null)');
    SQL.Add(
          ')');

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('PeriodBeg').AsDateTime := Period.Start;
    if Period.Finish > 0 then
      ParamByName('PeriodEnd').AsDateTime := Period.Finish;
    Open;

    if RecordCount > 0 then begin
      // Если приём/увольнение найдено,
      EmplDate := FieldByName('Dt_Priem').AsDateTime;

      Close;
      SQL.Clear;

      SQL.Add(
        'select * ' +
        'from Z_Pere ' +
        'where TabN = :TabN ' +
          'and Dt_Beg >= :PeriodBeg');

      if Period.Finish > 0 then
        SQL.Add(
          'and Dt_Beg <= :PeriodEnd');

      SQL.Add(
        'order by Dt_Beg');

      ParamByName('TabN').AsInteger := EmplId;
      ParamByName('PeriodBeg').AsDateTime := EmplDate;

      if Period.Finish > 0 then
        ParamByName('PeriodEnd').AsDateTime := Period.Finish;

      Open;
    end; {if}
  end; {with}
end; {SelectEmplmntAssgns}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
class procedure TQryUtils.SelectAllowances(
  Query: TQuery;
  EmplId: integer;
  Period: TPeriod) ;
begin
  InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select * ' +
      'from Z_Nadb n ' +
        'left join Z_KdVidN v on v.VidN = n.VidN ' +
      'where n.TabN = :TabN');

    if Period.Finish > 0 then
      SQL.Add(
        'and n.Dt_Beg <= :PeriodEnd');

    SQL.Add(
        'and (n.Dt_End >= :PeriodBeg or n.Dt_End is null) ' +
      'order by n.VidN, n.Dt_Beg');

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('PeriodBeg').AsDateTime := Period.Start;
    ParamByName('PeriodEnd').AsDateTime := Period.Finish;

    Open;
  end;
end;

//--------------------------------------------------------------------------------------------------
// Открываем отклонения
//--------------------------------------------------------------------------------------------------
class procedure TQryUtils.SelectDeviations(
  Query: TQuery;
  EmplId: integer;
  TargetPeriod: TPeriod; AsOfDate: TDateTime = 0);
begin
  InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select * ' +
      'from View_Otkl o ' +
        'left join Z_KdVidN v on v.VidN = o.VidN ' +
      'where o.TabN = :TabN ' +
        'and o.Dt_Beg <= :TargetEnd ' +
          'and (o.Dt_End >= :TargetBeg or o.Dt_End is null)');

    if AsOfDate <> 0 then
      SQL.Add(
        'and DtProc <= :AsOfDate');

    SQL.Add(
      'order by o.VidN, o.Dt_Beg, o.Storn');

    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('TargetBeg').AsDateTime := TargetPeriod.Start;
    ParamByName('TargetEnd').AsDateTime := TargetPeriod.Finish;

    if AsOfDate <> 0 then begin
      ParamByName('AsOfDate').AsDateTime := AsOfDate;
    end;

    Open;
  end;
end;

//--------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
class procedure TQryUtils.SplitByIntersection(
  DataSetRec: TDataSet;
  Period: TPeriod;
  BookmarkHnd: TBookmarkHnd; MainPartHnd, RemainHnd: TPeriodProc;
  BegDtFieldName, EndDtFieldName: ShortString);
var
  RecPeriod,
  InterPeriod: TPeriod;
  Schedule: TSchedule;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure AddRemain(Period: TPeriod);
  begin
    InsertCopy(DataSetRec);
    RemainHnd(Period);
    DataSetRec.Post;
  end; {AddRemain}

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure CreateRemains;
  begin
    // Запоминаем позицию.
    BookmarkHnd(SAVE_POSITION);

    AddRemain(Schedule[0]);
    if Length(Schedule) > 1 then
      AddRemain(Schedule[1]);

    // Возвращаемся к исходной.
    BookmarkHnd(RESTORE_POSITION);
  end; {CreateRemains}

begin
  SetLength(Schedule, 0);

  with DataSetRec, TDateUtils do begin
    RecPeriod := InitPeriod(
      FieldByName(BegDtFieldName).AsDateTime, FieldByName(EndDtFieldName).AsDateTime);

    InterPeriod := IntersectPeriods(RecPeriod, Period);

    if not PeriodIsEmpty(InterPeriod) then begin
      Schedule := SubtractPeriods(RecPeriod, Period);

      if Length(Schedule) > 0 then
        // Есть по крайней мере один остаток.
        CreateRemains;

      // Корректируем период и данные.
      Edit;
      MainPartHnd(InterPeriod);
      Post;
    end;
  end; {with DataSetRec, TDateUtils}

  SetLength(Schedule, 0);
end; {IntersectWithPeriod}

//--------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
class procedure TQryUtils.SplitBySubtraction(
  MinuendRec: TDataSet; Subtrahend: TPeriod;
  BegDtFieldName, EndDtFieldName: ShortString);
var
  Minuend: TPeriod;
  Schedule: TSchedule;
  Len: integer;
begin
  with MinuendRec, TDateUtils do begin
    Minuend := InitPeriod(
      FieldByName(BegDtFieldName).AsDateTime, FieldByName(EndDtFieldName).AsDateTime);

    Schedule := SubtractPeriods(Minuend, Subtrahend);
    Len := Length(Schedule);

    if Len = 0 then
      Delete
    else begin
      Minuend := Schedule[0];

      Edit;
      FieldByName(BegDtFieldName).AsDateTime := Minuend.Start;
      FieldByName(EndDtFieldName).AsDateTime := Minuend.Finish;
      Post;

      if Len > 1 then begin
        Minuend := Schedule[1];

        TQryUtils.InsertCopy(MinuendRec);
        FieldByName(BegDtFieldName).AsDateTime := Minuend.Start;
        FieldByName(EndDtFieldName).AsDateTime := Minuend.Finish;
        Post;
      end;
    end;
  end;
end; {SubtractPeriod}

{
//--------------------------------------------------------------------------------------------------
class function TQryUtils.MapSrcFieldName(
  SrcFieldName: ShortString;
  FieldNameMap: TFieldNameMap
): ShortString;
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
end;
}

end.
