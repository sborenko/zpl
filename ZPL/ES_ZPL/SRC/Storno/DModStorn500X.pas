unit DModStorn500X;

// OtklQry  - текущие отклонения по видам 500X.
// OrigCDS  - первоначальные несторнированные отклонения.
// PartsCDS - нарезка первоначальных отклонений сторнированными.
//            Т.е., то, как пользователь видит их в диалоге сторнирования.
// OperCDS  - новая нарезка одного первоначального отклонения,
//            выполняемая в процессе редактирования. По завершении "заливается"
//            в PartsCDS.

interface

uses
  SysUtils, Classes, DB, DBClient, DBTables,
  CustDateUtils;

type
  TDataStorn500X = class(TDataModule)
    OtklQry: TQuery;
    OtklQryNR: TIntegerField;
    OtklQryKDSPS: TSmallintField;
    OtklQryDTPROC: TDateTimeField;
    OtklQryZAMESGOD: TDateTimeField;
    OtklQryDTSTORN: TDateTimeField;
    OtklQryTABN: TIntegerField;
    OtklQryVIDN: TStringField;
    OtklQryShVidN: TStringField;
    OtklQryOLDKDVIDN: TSmallintField;
    OtklQryCHAS: TFloatField;
    OtklQrySUMMA: TFloatField;
    OtklQryOLDKDOBJ: TSmallintField;
    OtklQryKDOBJ: TSmallintField;
    OtklQryKDKATP: TSmallintField;
    OtklQryDT_BEG: TDateTimeField;
    OtklQryDT_END: TDateTimeField;
    OtklQryPDN: TSmallintField;
    OtklQryKDSPZ: TSmallintField;
    OtklQryNOTES: TStringField;
    OtklQryPRR: TSmallintField;
    OtklQryPRPV: TSmallintField;
    OtklQryKTO: TSmallintField;
    OtklQryPRKR: TSmallintField;
    OtklQrySPEC_NR: TIntegerField;
    OtklQryDTVDPV: TDateTimeField;
    OtklQryNRVDPV: TIntegerField;
    OtklQryMYNOTES: TStringField;
    OtklQrySPECPS: TIntegerField;
    OtklQryPBNK: TSmallintField;
    OtklQrySTORN: TStringField;
    OtklQryKDBNK: TSmallintField;
    OtklQryKDTEMU: TSmallintField;
    OtklQrySovm: TStringField;
    PartsCDS: TClientDataSet;
    qryTmp: TQuery;
    PartsDSrc: TDataSource;
    OtklUpdSQL: TUpdateSQL;
    OrigCDS: TClientDataSet;
    OperCDS: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure OtklQryCalcFields(DataSet: TDataSet);
  private
    _VidN500X: string;
    _TabN: integer;
    _StornScope: TPeriod;

    StornoUpdated: boolean;
    RecalcDate: TDateTime;

    procedure Add8801Otkl(nTabN: integer; dDtProc, dZaMesGod: TDateTime);

    procedure OpenQry;
    procedure LoadOrigAndParts;
    procedure FullStorn;
    procedure LocateOrig;
    procedure LocateFirstPart(VidN: ShortString; SpecNr: integer;
      OrigPeriod: TPeriod);
    procedure StornOrig;

    function ApplyStorn(OrigPeriod: TPeriod): TPeriod;
    procedure AddNotStorned(Period: TPeriod);
    procedure UnloadOper;

    procedure RepairOrigin;
    procedure RemoveOldStorning;
    procedure SaveNewStorning;

  public
    procedure NewLoad(TabN: integer);

    property VidN500X: string read _VidN500X;
    property StornScope: TPeriod read _StornScope;
    function StornIsAvailable: boolean;

    procedure SetStorno(Period: TPeriod; Notes: ShortString);
    procedure WithdrawStorno;
    procedure SaveResult;
  end;

var
  DataStorn500X: TDataStorn500X;

implementation

uses
  Math, Variants, A_Const, AppSettings, Schedule, Z_Dm, CdsLib, DsLib, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.DataModuleCreate(Sender: TObject);
begin
  _VidN500X := '"5002", "5005", "5008"';

  with TDateUtils do
    _StornScope := InitPeriod(PrevMonth(ThisMonth, 12), ThisMonth);
end;

//------------------------------------------------------------------------------
// Новая загрузка.
//------------------------------------------------------------------------------
procedure TDataStorn500X.NewLoad(TabN: integer);
begin
  _TabN := TabN;
  OpenQry;

  // Cоздаём CDS для изначальных отклонений.
  CdsUtils.CreateCdsA(OtklQry, OrigCDS);
  OrigCDS.Open;

  // Cоздаём CDS для полной нарезки.
  CdsUtils.CreateCdsA(OtklQry, PartsCDS);
  PartsCDS.IndexDefs.Add('Primary', 'Dt_Beg;VidN', []);
  PartsCDS.IndexName := 'Primary';
  PartsCDS.Open;

  // Cоздаём CDS для текущей нарезки.
  CdsUtils.CreateCdsA(OtklQry, OperCDS);
  OperCDS.Open;

  // Загружаем отклонения.
  LoadOrigAndParts;

  // Выполняем полную нарезку первоначальных отклонений сторнирующими.
  FullStorn;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.OpenQry;
begin
  QryUtils.InitQuery(OtklQry);

  with OtklQry do begin
    SQL.Add(
      'select * ' +
      'from Z_OTKL ' +
      'where TabN = :TabN and VidN in (' + _VidN500X + ') ' +
        'and (DtProc >= :ScopeBeg and DtProc < :ScopeEnd ' +
        'or DtProc = :ScopeEnd and Storn = "Y") ' +
      // Такая сортировка гарантирует, что первой всегда придёт
      // исходная запись, т.к., у неё начальная дата никогда не больше,
      // чем у сторнирующих, а признак сторнирования меньше
      // сторнирующего значения -'Y'.
      'order by VidN, Spec_Nr, Dt_Beg, Storn, Dt_End, Sovm');

    ParamByName('TabN').AsInteger := _TabN;
    ParamByName('ScopeBeg').AsDateTime := _StornScope.Start;
    ParamByName('ScopeEnd').AsDateTime := _StornScope.Finish;

    Open;
  end;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.LoadOrigAndParts;
var
  OtklPeriod,
  OrigPeriod: TPeriod;
  VidN, PrevVidN: ShortString;
  SpecNr, PrevSpecNr: integer;
begin
  with OtklQry, TDateUtils do begin
    OrigPeriod := CreatePeriod;
    PrevVidN := '';
    PrevSpecNr := 0;

    while not Eof do begin
      VidN := FieldByName('VidN').AsString;
      SpecNr := FieldByName('Spec_Nr').AsInteger;
      OtklPeriod := InitPeriod(
        FieldByName('Dt_Beg').AsDateTime, FieldByName('Dt_End').AsDateTime);

      // Все непересекающиеся записи загружаем в CDS первоначальных отклонений.
      with OrigCDS do begin
        if Eof or not PeriodsAreIntersected(OtklPeriod, OrigPeriod)
            or (SpecNr <> PrevSpecNr)
            or (VidN <> PrevVidN) then begin
          Append;
          DsUtils.CopyRecord(OtklQry, OrigCDS);

          if FieldByName('Storn').AsString = 'Y' then begin
            // Запись, сторнирована по старой схеме (без сохранения
            // оригинальной). Делаем её оригинальной.
            FieldByName('Storn').AsString := 'R'; // 'R' - восстановленная
            FieldByName('DtStorn').AsString := '';
          end;

          Post;

          OrigPeriod := OtklPeriod;
          PrevVidN := FieldByName('VidN').AsString;
          PrevSpecNr := SpecNr;
        end;
      end;

      // Сторнирующие загружаем в CDS частей.
      if OtklQry.FieldByName('Storn').AsString = 'Y' then begin
        with PartsCDS do begin
          Append;
          DsUtils.CopyRecord(OtklQry, PartsCDS);
          Post;
        end;
      end;

      Next;
    end;
  end;

  OrigCDS.SaveToFile('Orig.cds');
  PartsCDS.SaveToFile('Parts.cds');
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.FullStorn;
begin
  with OrigCDS do begin
    First;

    while not Eof do begin
      StornOrig;

      Next;
    end;
  end;

  UnloadOper;

  PartsCDS.SaveToFile('Parts.cds');
end;

//------------------------------------------------------------------------------
procedure TDataStorn500X.StornOrig;
var
  VidN: ShortString;
  SpecNr: integer;
  OrigPeriod, RemainPeriod: TPeriod;
begin
  with TDateUtils do begin
    with OrigCDS do begin
      // Уже стоим на нужной записи
      OrigPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime);

      RemainPeriod := OrigPeriod;

      VidN := FieldByName('VidN').AsString;
      SpecNr := FieldByName('Spec_Nr').AsInteger;
    end;

    with PartsCDS do begin
      LocateFirstPart(VidN, SpecNr, OrigPeriod);

      while not Eof do begin
        if PeriodsAreIntersected(OrigPeriod,
              InitPeriod(FieldByName('Dt_Beg').AsDateTime,
                FieldByName('Dt_End').AsDateTime))
            and (FieldByName('VidN').AsString = VidN)
            and (FieldByName('Spec_Nr').AsInteger = SpecNr) then begin

          if FieldByName('Storn').AsString = 'Y' then
            RemainPeriod := ApplyStorn(RemainPeriod);

          Delete;
        end else
          Next;
      end; {while}
    end; {with PartsCDS}

    if not PeriodIsEmpty(RemainPeriod) then
      with OperCDS do begin
        Insert;
        DsUtils.CopyRecord(OrigCDS, OperCDS);
        // На случай, если начальная запись - восстанавливаемая (='R').
        FieldByName('Dt_Beg').AsDateTime := RemainPeriod.Start;
        FieldByName('Dt_End').AsDateTime := RemainPeriod.Finish;
        FieldByName('Storn').AsString := '';
        Post;
      end;
  end; {with TDateUtils}

  PartsCDS.SaveToFile('Parts.cds');
  OperCDS.SaveToFile('Oper.cds');
end;

//------------------------------------------------------------------------------
function TDataStorn500X.ApplyStorn(
  OrigPeriod: TPeriod): TPeriod;
var
  StornPeriod: TPeriod;
  NotStornedParts: TSchedule;
  Len: integer;
begin
  SetLength(NotStornedParts, 0);

  with TDateUtils do begin
    with PartsCDS do
      StornPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime);

    NotStornedParts := SubtractPeriods(OrigPeriod, StornPeriod);
    Len := Length(NotStornedParts);

    if Len = 2 then begin
      // Остатка два, первый предшествует сторнирующей записи, становится
      // несторнированным периодом.
      AddNotStorned(NotStornedParts[0]);
      // Второй становится остатком.
      Result := NotStornedParts[1];
    end else if Len = 1 then
      if EventIsAfterPeriod(NotStornedParts[Len - 1].Start, StornPeriod) then
        // Остаток один, следует за сторнирующей и становится остатком.
        Result := NotStornedParts[0]
      else begin
        // ... предшествует сторнирующей записи,
        // становится несторнированным периодом.
        AddNotStorned(NotStornedParts[0]);
        Result := CreatePeriod;
      end
    else
      Result := CreatePeriod;

    with OperCDS do begin
      // Сторнирующая часть
      Append;
      DsUtils.CopyRecord(PartsCDS, OperCDS);
      Post;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Пишем несторнированные части
//------------------------------------------------------------------------------
procedure TDataStorn500X.AddNotStorned(Period: TPeriod);
begin
  with OperCDS do begin
    Append;
    DsUtils.CopyRecord(OrigCDS, OperCDS);

    FieldByName('Dt_Beg').AsDateTime := Period.Start;
    FieldByName('Dt_End').AsDateTime := Period.Finish;
    FieldByName('Chas').AsFloat :=
      DmMain.CountWorkChas(Period.Start, Period.Finish);
    Post;
  end;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.SetStorno(Period: TPeriod; Notes: ShortString);
begin
  // Создаём копию записи, котороую будем сторнировать.
  DsUtils.InsertCopy(PartsCDS);

  with PartsCDS do begin
    // Задаём атрибуты сторнирования
    FieldByName('DtProc').AsDateTime := TDateUtils.ThisMonth;
    FieldByName('Dt_Beg').AsDateTime := Period.Start;
    FieldByName('Dt_End').AsDateTime := Period.Finish;

    FieldByName('Chas').AsFloat := DmMain.CountWorkChas(
      FieldByName('Dt_Beg').AsDateTime, FieldByName('Dt_End').AsDateTime);
      
    FieldByName('Storn').AsString := 'Y';
    FieldByName('DtStorn').AsDateTime := TDateUtils.ThisMonth;
    Post;
  end;

  // Находим начальную для текущей сторнирующей.
  LocateOrig;
  // Сторнируем начальную в OperCDS.
  StornOrig;
  // Выгружаем результаты сторнирования в PartsCDS.
  UnloadOper;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.WithdrawStorno;
begin
  // Находим начальную для текущей сторнирующей.
  LocateOrig;

  // Удаляем сторнирующую.
  PartsCDS.Delete;

  // Сторнируем начальную в OperCDS.
  StornOrig;
  // Выгружаем результаты сторнирования в PartsCDS.
  UnloadOper;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.LocateOrig;
var
  VidN: ShortString;
  SpecNr: integer;
  PartPeriod,
  OrigPeriod: TPeriod;
begin
  with TDateUtils do begin
    // Уже стоим на нужной записи
    with PartsCDS do begin
      PartPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime);

      VidN := FieldByName('VidN').AsString;
      SpecNr := FieldByName('Spec_Nr').AsInteger;
    end;

    with OrigCDS do begin
      First;

      while not Eof do begin
        OrigPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
          FieldByName('Dt_End').AsDateTime);

        if PeriodsAreIntersected(OrigPeriod, PartPeriod)
            and (FieldByName('VidN').AsString = VidN)
            and (FieldByName('Spec_Nr').AsInteger = SpecNr) then
          break;

        Next;
      end; {while}
    end; {with OrigCDS}
  end;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.LocateFirstPart(
  VidN: ShortString;
  SpecNr: integer;
  OrigPeriod: TPeriod);
var
  PartPeriod: TPeriod;
begin
  with PartsCDS, TDateUtils do begin
    First;

    while not Eof do begin
      PartPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime);

      if PeriodsAreIntersected(OrigPeriod, PartPeriod)
          and (FieldByName('VidN').AsString = VidN)
          and (FieldByName('Spec_Nr').AsInteger = SpecNr) then
        break;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.UnloadOper;
begin
  OperCDS.SaveToFile('Oper.cds');

  with OperCDS do begin
    First;

    while not Eof do begin
      with PartsCDS do begin
        Insert;
        DsUtils.CopyRecord(OperCDS, PartsCDS);
        Post;
      end;

      Delete;
    end;
  end;

  PartsCDS.SaveToFile('Parts.cds');
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.SaveResult;
begin
  StornoUpdated := false;
  RecalcDate := TDateUtils.ThisMonth;

  RepairOrigin;
  RemoveOldStorning;
  SaveNewStorning;

  if StornoUpdated then begin
    OtklQry.ApplyUpdates;
    OtklQry.CommitUpdates;

    Add8801Otkl(_TabN, TDateUtils.ThisMonth, RecalcDate);
  end;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.RepairOrigin;
begin
  with OrigCDS do begin
    First;

    while not Eof do begin
      if FieldByName('Storn').AsString = 'R' then
        with OtklQry do begin
          Insert;
          DsUtils.CopyRecord(OrigCDS, OtklQry);
          FieldByName('Storn').AsString := '';
          Post;
        end;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.RemoveOldStorning;
begin
  with OtklQry do begin
    First;

    while not Eof do begin
      if (FieldByName('Storn').AsString = 'Y')
          and not PartsCDS.Locate(
            'DtProc;ZaMesGod;Dt_Beg;Dt_End;VidN;Spec_Nr;Storn',
            VarArrayOf([
              FieldByName('DtProc').AsDateTime,
              FieldByName('ZaMesGod').AsDateTime,
              FieldByName('Dt_Beg').AsDateTime,
              FieldByName('Dt_End').AsDateTime,
              FieldByName('VidN').AsString,
              FieldByName('Spec_Nr').AsInteger,
              'Y'
            ]), []) then begin
        StornoUpdated := true;
        RecalcDate := Min(RecalcDate, FieldByName('ZaMesGod').AsDateTime);

        Delete;

      end else
        Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.SaveNewStorning;
var
  DtBeg, DtEnd: TDateTime;
  VidN: ShortString;
  SpecNr: integer;
begin
  with PartsCDS do begin
    First;

    while not Eof do begin
      if FieldByName('Storn').AsString = 'Y' then begin
        DtBeg := FieldByName('Dt_Beg').AsDateTime;
        DtEnd := FieldByName('Dt_End').AsDateTime;
        VidN  := FieldByName('VidN').AsString;
        SpecNr := FieldByName('Spec_Nr').AsInteger;

        with OtklQry do begin
          if not Locate('Dt_Beg;Dt_End;VidN;Spec_Nr;Storn',
              VarArrayOf([DtBeg, DtEnd, VidN, SpecNr, 'Y']), []) then begin
            Insert;
            DsUtils.CopyRecord(PartsCDS, OtklQry);

            StornoUpdated := true;
            RecalcDate := Min(RecalcDate, FieldByName('ZaMesGod').AsDateTime);

            Post;
          end;
        end; {with OtklQry}
      end; {if Storn}

      Next;
    end; {while PartsCDS}
  end; {with PartsCDS}
end; {SaveNewStorning}

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
function TDataStorn500X.StornIsAvailable: boolean;
begin
  Result := PartsCDS.RecordCount > 0;
end;


//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.Add8801Otkl(nTabN: integer; dDtProc, dZaMesGod: TDateTime);
begin
  with qryTmp do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('delete from z_otkl'
        + ' where TabN = :nTabN'
        + ' and VidN = "8801"'
        + ' and ZaMesGod >= :dZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dZaMesGod').AsDateTime := dZaMesGod;
    ExecSQL;

    SQL.Clear;
    SQL.Add('insert into z_otkl'
        + ' (KdSps, TabN, DtProc, ZaMesGod, VidN) '
        + ' values (:nKdSps, :nTabN, :dDtProc, :dZaMesGod, "8801")');
    ParamByName('nKdSps').AsInteger := gl_nAppKdSpsUsr;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ParamByName('dZaMesGod').AsDateTime := dZaMesGod;
    ExecSQL;

    SQL.Clear;
    DataBaseName := '';
  end; {with}
end; {Add8001Otkl}

//------------------------------------------------------------------------------
// ***
//------------------------------------------------------------------------------
procedure TDataStorn500X.OtklQryCalcFields(DataSet: TDataSet);
var
  cNmVidN: string;
begin
  OtklQryShVidN.AsString := DmMain.VidN2ShVidN(OtklQryVidN.AsString, cNmVidN);
end;

end.
