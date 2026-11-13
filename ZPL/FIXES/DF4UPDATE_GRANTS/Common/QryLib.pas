unit QryLib;

interface

uses
  SysUtils, Variants, DB, DBTables, DBClient, DateLib, DsLib;

type
  TBookmarkAction = (SAVE_POSITION, RESTORE_POSITION);

  // TNullParamProc = procedure of object;
  TPeriodProc = procedure(Period: TPeriod) of object;
  TBookmarkHnd = procedure(Action: TBookmarkAction) of object;

  QryUtils = class
  public
    class function PeekByFields(
      Qry: TQuery;
      TableName: ShortString;
      FieldNames, Values: string): boolean;

    class function PeekUpi(
      qryPeek: TQuery;
      nTabN: integer): boolean;

    class function PeekHire(Query: TQuery; EmplId: integer;
      OnDate: TDateTime; UsePrepared: boolean): boolean;
    class procedure PreparePeekHire(Query: TQuery);
    class procedure ComposePeekHire(Query: TQuery);

    class function PeekAssign(Query: TQuery; EmplId: integer;
      OnDate: TDateTime; Exact, UsePrepared: boolean): boolean;
    class procedure PreparePeekAssign(Query: TQuery);
    class procedure ComposePeekAssign(Query: TQuery);

    class function PeekPosition(Query: TQuery; PositionId: integer;
      UsePrepared: boolean): boolean;
    class procedure PreparePeekPosition(Query: TQuery);
    class procedure ComposePeekPositionQry(Query: TQuery);

    class function PeekDismisReason(Query: TQuery; DismisReasonId: integer;
      UsePrepared: boolean): boolean;
    class procedure PreparePeekDismisReason(Query: TQuery);
    class procedure ComposePeekDismisReason(Query: TQuery);

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

    class function PeekDekr(
      qryPeek: TQuery;
      nTabN, nSpecNr: integer;
      period: TPeriod): boolean;

    class function PeekUser(
      qryPeek: TQuery;
      UserId: integer): boolean;

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

    class function CreateQuery(DataBaseName: string = ''): TQuery;
    class procedure InitQuery(Query: TQuery; DataBaseName: ShortString = '');
    class procedure ReleaseQuery(Query: TQuery);

    class procedure CopyStruct(SrcDS: TDataSet; DstDS: TDataSet);

    class procedure SplitByIntersection(
      DataSetRec: TDataSet; Period: TPeriod;
      BookmarkHnd: TBookmarkHnd; MainPartHnd, RemainHnd: TPeriodProc;
      BegDtFieldName: ShortString = 'Dt_Beg'; EndDtFieldName: ShortString = 'Dt_End');

    class procedure PrepareSelectAssigns(Query: TQuery; WithAllows: boolean);
  end;

implementation

uses
  DATABASENAME, Classes, TextLib;

//------------------------------------------------------------------------------
class function QryUtils.PeekUpi(
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
class function QryUtils.PeekHire(
  Query: TQuery;
  EmplId: integer;
  OnDate: TDateTime;
  UsePrepared: boolean): boolean;
begin
  with Query do begin
    if UsePrepared then begin
      if not Prepared then
        PreparePeekHire(Query);
    end else
      ComposePeekHire(Query);

    ParamByName('EmplId').AsInteger := EmplId;
    ParamByName('OnDate').AsDateTime := OnDate;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class procedure QryUtils.PreparePeekHire(Query: TQuery);
begin
  ComposePeekHire(Query);
  Query.Prepare;
end;

//------------------------------------------------------------------------------
class procedure QryUtils.ComposePeekHire(Query: TQuery);
begin
  InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select first 1 * ' +
      'from z_PrmUv ' +
      'where TabN = :EmplId ' +
        'and Dt_Priem <= :OnDate ' +
      'order by Dt_Priem desc');
    end;
end;

//------------------------------------------------------------------------------
class function QryUtils.PeekAssign(
  Query: TQuery;
  EmplId: integer;
  OnDate: TDateTime;
  Exact, UsePrepared: boolean): boolean;
begin
  with Query do begin
    if UsePrepared then begin
      if not Prepared then
        PreparePeekAssign(Query);
    end else
      ComposePeekAssign(Query);

    ParamByName('EmplId').AsInteger := EmplId;
    ParamByName('OnDate').AsDateTime := OnDate;
    Open;

    Result := RecordCount > 0;

    // "Ќеточна€" часть выполн€етс€ Unprepared.

    if not Result and not Exact then begin
      if Prepared then
        Unprepare;

      InitQuery(Query);

      SQL.Add(
        'select first 1 * from z_Pere ' +
        'where TabN = :EmplId ' +
      'order by Dt_Beg');
      ParamByName('EmplId').AsInteger := EmplId;
      Open;

      Result := RecordCount > 0;
    end;
  end; {with}
end; {PeekAssign}

//------------------------------------------------------------------------------
class procedure QryUtils.PreparePeekAssign(Query: TQuery);
begin
  ComposePeekAssign(Query);
  Query.Prepare;
end;

//------------------------------------------------------------------------------
class procedure QryUtils.ComposePeekAssign(Query: TQuery);
begin
  InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select first 1 * from z_Pere ' +
      'where TabN = :EmplId ' +
        'and Dt_Beg <= :OnDate ' +
      'order by Dt_Beg desc');
  end;
end;

//------------------------------------------------------------------------------
// nOnDate - дата текущего перемещени€
//------------------------------------------------------------------------------
class function QryUtils.PeekPrevPereForPrmUv(
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
class function QryUtils.PeekNadb(
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
class function QryUtils.PeekVidN(
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
class function QryUtils.PeekDismisReason(Query: TQuery;
  DismisReasonId: integer; UsePrepared: boolean): boolean;
begin
  with Query do begin
    if UsePrepared then begin
      if not Prepared then
        PreparePeekDismisReason(Query);
    end else
      ComposePeekDismisReason(Query);

    ParamByName('Code').AsInteger := DismisReasonId;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class procedure QryUtils.PreparePeekDismisReason(Query: TQuery);
begin
  ComposePeekDismisReason(Query);
  Query.Prepare;
end;

//------------------------------------------------------------------------------
class procedure QryUtils.ComposePeekDismisReason(Query: TQuery);
begin
  InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select * from Z_PidZviln ' +
      'where Code = :Code');
  end;
end;

//------------------------------------------------------------------------------
class function QryUtils.PeekDekr(
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
    ParamByName('DtBeg').AsDateTime := Period.Start;
    ParamByName('DtEnd').AsDateTime := Period.Finish;
    Open;

    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class function QryUtils.PeekUser(
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
class function QryUtils.PeekPosition(
  Query: TQuery;
  PositionId: integer;
  UsePrepared: boolean): boolean;
begin
  with Query do begin
    if UsePrepared then begin
      if not Prepared then
        PreparePeekPosition(Query);
    end else
      ComposePeekPositionQry(Query);

    ParamByName('PosId').AsInteger := PositionId;
    Open;
    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
class procedure QryUtils.PreparePeekPosition(Query: TQuery);
begin
  ComposePeekPositionQry(Query);
  Query.Prepare;
end;

//------------------------------------------------------------------------------
class procedure QryUtils.ComposePeekPositionQry(Query: TQuery);
begin
  InitQuery(Query);

  with Query do begin
    SQL.Add(
      'select * ' +
      'from O_Dolgnost ' +
      'where KdOk = :PosId');
  end;
end;

//------------------------------------------------------------------------------
class function QryUtils.PeekSps(EmplId: integer; Date: TDateTime): TQuery;
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
class function QryUtils.PeekInvDoc(
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
class function QryUtils.CreateQuery(DataBaseName: string = ''): TQuery;
begin
  Result := TQuery.Create(nil);
  InitQuery(Result, DataBaseName);
end;

//------------------------------------------------------------------------------
class procedure QryUtils.InitQuery(
  Query: TQuery;
  DataBaseName: ShortString = '');
begin
  ReleaseQuery(Query);

  if DataBaseName = '' then begin
    if Query.DataBaseName = '' then
      Query.DataBaseName := DEFAULT_DATABASE_NAME;
  end else
    Query.DataBaseName := DataBaseName;
end;

//------------------------------------------------------------------------------
class procedure QryUtils.ReleaseQuery(Query: TQuery);
begin
  with Query do begin
    Close;
    SQL.Clear;
  end;
end;

//--------------------------------------------------------------------------------------------------
class procedure QryUtils.CopyStruct(SrcDS: TDataSet; DstDS: TDataSet);
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
class function QryUtils.PrepareByFields(
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
class function QryUtils.SelectByFields(
  TableName: ShortString;
  FldNames: array of string;
  Values: array of Variant): TQuery;
begin
  Result := PrepareByFields(TableName, FldNames, Values);
  Result.Open;
end; {SelectByFields}

//--------------------------------------------------------------------------------------------------
class function QryUtils.PeekByFields(
  Qry: TQuery;
  TableName: ShortString;
  FieldNames, Values: string): boolean;
var
  Fields, Vals: TStringList;
  I, ItemCount: integer;
  WhereClause: string;
begin
  Fields := TStringList.Create;
  Vals := TStringList.Create;

  with Fields do begin
    Delimiter := ';';
    DelimitedText := FieldNames;
    ItemCount := Count;
  end; {with}

  with Vals do begin
    Delimiter := ';';
    DelimitedText := FieldNames;
  end; {with}

  WhereClause := '';
  for I := 0 to ItemCount - 1 do
    WhereClause := TextUtils.ConcatStr(
        WhereClause, Fields.Strings[I] + '=' + Vals.Strings[I], ' and ');

  Fields.Free;
  Vals.Free;

  QryUtils.InitQuery(Qry);

  with Qry do begin
    SQL.Add(
      'select * ' +
      'from ' + TableName + ' ' +
      'where ' + WhereClause);
    Open;

    Result := RecordCount > 0;
  end; {with}
end; {PeekByFields}

//--------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
class procedure QryUtils.SelectEmploymnts(
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
// Ќачало периода, заданного параметром Period использовать напр€мую нельз€.
// ¬место него надо использовать начало периода приЄма/увольнени€
// дл€ начала заданного периода.
//--------------------------------------------------------------------------------------------------
class procedure QryUtils.SelectEmplmntAssgns(
  Query: TQuery;
  EmplId: integer;
  Period: TPeriod);
var
  EmplDate: TDateTime;
begin
  InitQuery(Query);

  with Query do begin
    // Ќаходим приЄм/увольнение дл€ заданного периода.
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
      // ≈сли приЄм/увольнение найдено,
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

//--------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------
class procedure QryUtils.SplitByIntersection(
  DataSetRec: TDataSet;
  Period: TPeriod;
  BookmarkHnd: TBookmarkHnd; MainPartHnd, RemainHnd: TPeriodProc;
  BegDtFieldName, EndDtFieldName: ShortString);
var
  RecPeriod,
  InterPeriod: TPeriod;
  Periods: TPeriods;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure AddRemain(Period: TPeriod);
  begin
    DsUtils.InsertCopy(DataSetRec);
    RemainHnd(Period);
    DataSetRec.Post;
  end; {AddRemain}

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure CreateRemains;
  begin
    // «апоминаем позицию.
    BookmarkHnd(SAVE_POSITION);

    AddRemain(Periods[0]);
    if Length(Periods) > 1 then
      AddRemain(Periods[1]);

    // ¬озвращаемс€ к исходной.
    BookmarkHnd(RESTORE_POSITION);
  end; {CreateRemains}

begin
  SetLength(Periods, 0);

  with DataSetRec, DateUtils do begin
    RecPeriod := InitPeriod(
      FieldByName(BegDtFieldName).AsDateTime,
      FieldByName(EndDtFieldName).AsDateTime);

    InterPeriod := IntersectPeriods(RecPeriod, Period);

    if not PeriodIsEmpty(InterPeriod) then begin
      Periods := SubtractPeriods(RecPeriod, Period);

      if Length(Periods) > 0 then
        // ≈сть по крайней мере один остаток.
        CreateRemains;

      //  орректируем период и данные.
      Edit;
      MainPartHnd(InterPeriod);
      Post;
    end;
  end; {with DataSetRec, DateUtils}

  SetLength(Periods, 0);
end; {IntersectWithPeriod}

//--------------------------------------------------------------------------------------------------
class procedure QryUtils.PrepareSelectAssigns(
  Query: TQuery; WithAllows: boolean);
var
  Stmt: string;
begin
  Stmt :=
    'select ' +
      'pu.Dt_Priem, pu.Dt_Uvoln, p.Dt_Beg P_DtBeg, p.PrcWrkTime, p.Sovm'#13#10;

  if WithAllows then
    Stmt := Stmt +
      ', n.Dt_Beg N_DtBeg, n.Dt_End, n.VidN, n.Prc_WT, n.Kd_Sovm'#13#10;

  Stmt := Stmt +
    'from z_PrmUv pu'#13#10 +
      'left join z_Pere p on p.TabN = pu.TabN ' +
        'and p.Dt_Beg >= pu.Dt_Priem ' +
        'and (p.Dt_Beg <= pu.Dt_Uvoln or pu.Dt_Uvoln is null)'#13#10;

  if WithAllows then
    Stmt := Stmt +
      'left join z_Nadb n on n.TabN = pu.TabN ' +
        // —ильно строгого сравнени€ не примен€ем, потому что возможно,
        // когда происходит "техническое" увольнение с последующим приЄмом,
        // надбавки предыдущего приЄма/увольнени€ продолжают действовать. Ќу,
        // а если их закрывают и открывают, работать будет тоже:
        {
        'and n.Dt_Beg <= pu.Dt_Priem ' +
        'and (n.Dt_End >= n.Dt_Priem or n.Dt_End is null) ' +
        }
        // ... а вот так - строго:
        'and n.Dt_Beg >= pu.Dt_Priem ' +
        'and (n.Dt_Beg <= pu.Dt_Uvoln or pu.Dt_Uvoln is null) ' +
        // ... общее и дл€ строго и дл€ - не:
        'and (n.Dt_Beg is null ' +
          'or (n.dt_beg <=  :PeriodEnd ' +
            'and (n.dt_end >= :PeriodBeg or n.dt_end is null)))'#13#10;

  Stmt := Stmt +
    'where ' +
      'pu.TabN = :TabN ' +
      'and pu.Dt_Priem <= :PeriodEnd ' +
      'and (pu.Dt_Uvoln >= :PeriodBeg or pu.Dt_Uvoln is null)'#13#10 +
    'order by ' +
      'pu.Dt_Priem, p.Dt_Beg';

  if WithAllows then
    Stmt := Stmt + ', n.Dt_Beg';

  InitQuery(Query);

  with Query do begin
    SQL.Add(Stmt);
    Prepare;
  end;
end;

end.
