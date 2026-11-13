unit DModStornSpecNr;

interface

uses
  Classes, DateLib, DB, DBClient, DBTables, SysUtils;

type
  TErrMsgProc = procedure(Rec: TDataSet) of object;
  TStornResProc = procedure(StornDays: Integer; VacatSum: Double;
    WorkHrs: Integer; SalarySum: Double) of object;

  TPoolRec = record
    QryVacat: TQuery;
    CdsParts: TClientDataSet;
  end;

  TDmStornSpecNr = class(TDataModule)
    QryOrig: TQuery;
    DsrcParts: TDataSource;
    QryOrigNR: TIntegerField;
    QryOrigKDSPS: TSmallintField;
    QryOrigDTPROC: TDateTimeField;
    QryOrigZAMESGOD: TDateTimeField;
    QryOrigDTSTORN: TDateTimeField;
    QryOrigTABN: TIntegerField;
    QryOrigVIDN: TStringField;
    QryOrigShVidN: TStringField;
    QryOrigOLDKDVIDN: TSmallintField;
    QryOrigCHAS: TFloatField;
    QryOrigSUMMA: TFloatField;
    QryOrigOLDKDOBJ: TSmallintField;
    QryOrigKDOBJ: TSmallintField;
    QryOrigKDKATP: TSmallintField;
    QryOrigDT_BEG: TDateTimeField;
    QryOrigDT_END: TDateTimeField;
    QryOrigPDN: TSmallintField;
    QryOrigKDSPZ: TSmallintField;
    QryOrigNOTES: TStringField;
    QryOrigPRR: TSmallintField;
    QryOrigPRPV: TSmallintField;
    QryOrigKTO: TSmallintField;
    QryOrigPRKR: TSmallintField;
    QryOrigSPEC_NR: TIntegerField;
    QryOrigDTVDPV: TDateTimeField;
    QryOrigNRVDPV: TIntegerField;
    QryOrigMYNOTES: TStringField;
    QryOrigSPECPS: TIntegerField;
    QryOrigPBNK: TSmallintField;
    QryOrigSTORN: TStringField;
    DsrcOrig: TDataSource;
    CdsBuff: TClientDataSet;
    QryStorn: TQuery;
    UpdStorn: TUpdateSQL;
    ClientDataSet1: TClientDataSet;
    procedure QryOrigAfterScroll(DataSet: TDataSet);
    procedure DsCalcFields(DataSet: TDataSet);
    procedure CdsBuffAfterOpen(DataSet: TDataSet);
    procedure CdsBuffStornDtBegValidate(Sender: TField);
    procedure CdsBuffStornDtEndValidate(Sender: TField);
  private
    DisplayDtBegErr, DisplayDtEndErr: TErrMsgProc;
    DisplayStornRes: TStornResProc;

    VacatPool: array of TPoolRec;
    CurVacat: TPoolRec;

    procedure LoadOrigRecs(EmplId: Integer; DtBeg, DtEnd: TDateTime);

    procedure SetCurVacat(SpecNr: Integer);
    function GetVacatInfoQry(SpecNr: Integer): TQuery;

    function CreatePartsCds: TClientDataSet;
    procedure CreateBuffCds;

    procedure LoadVacatStorn(SpecNr: Integer);
    procedure CutUnstorn;

    procedure WritePart(Period: TPeriod; SrcRec: TDataSet;
      Calc: Boolean = true);

    procedure CalcStornSum(Rec: TDataSet);
    procedure MergeUnstorn;

    function CopyFilterFunc(DsSrc: TDataSet): Boolean;
    function DelFilterFunc(DsSrc: TDataSet): Boolean;

    procedure UpdateStornRecs;

    PROCEDURE DEBUG(WHAT: SHORTSTRING);
  public
    destructor Destroy; override;

    function LoadOverlap(EmplId: Integer; DtBeg, DtEnd: TDateTime): Boolean;

    procedure StartStorn(DisplayDtBegErr, DisplayDtEndErr: TErrMsgProc;
      DisplayStornRes: TStornResProc);

    function DataIsValid(out Rec: TDataSet): Boolean;

    procedure StornRec;
    procedure UnstornRec;

    procedure ApplyStorn;
  end;

var
  DmStornSpecNr: TDmStornSpecNr;

implementation

uses
  CdsLib, DsLib, Math, QryLib, Z_Dm;

{$R *.dfm}

//------------------------------------------------------------------------------
destructor TDmStornSpecNr.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(VacatPool) - 1 do
    with VacatPool[I] do begin
      QryVacat.Free;
      CdsParts.Free;
    end;

  inherited Destroy;
end;

//------------------------------------------------------------------------------
function TDmStornSpecNr.LoadOverlap(
  EmplId: Integer;
  DtBeg, DtEnd: TDateTime
): Boolean;
begin
  LoadOrigRecs(EmplId, DtBeg, DtEnd);
  Result := QryOrig.RecordCount > 0;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Загружаем исходные записи
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.LoadOrigRecs(
  EmplId: Integer;
  DtBeg, DtEnd: TDateTime
);
begin
  QryUtils.InitQuery(QryOrig);

  with QryOrig do begin
    SQL.Text :=
      'select * ' +
      'from z_Otkl ' +
      'where TabN = :TabN ' +
        'and VidN > "2400" and VidN < "2500" ' +
        'and (Storn is null or Storn <> "Y") ' +
        'and (' +
          'Dt_Beg between :Dt_Beg and :Dt_End ' +
          'or :Dt_Beg between Dt_Beg and Dt_End' +
        ') ' +
      'order by DtProc, ZaMesGod, VidN';
    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('Dt_Beg').AsDateTime := DtBeg;
    ParamByName('Dt_End').AsDateTime := DtEnd;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmStornSpecNr.QryOrigAfterScroll(DataSet: TDataSet);
begin
  SetCurVacat(QryOrig.FieldByName('Spec_Nr').AsInteger);

  DsrcParts.DataSet := CurVacat.CdsParts;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.SetCurVacat(SpecNr: Integer);
var
  I: Integer;
  Found: Boolean;
begin
  Found := false;

  for I := 0 to Length(VacatPool) - 1 do
    // Ищем в пуле нарезку для отпуска с заданными SpecNr
    if VacatPool[I].CdsParts.FieldByName('Spec_Nr').AsInteger = SpecNr then
    begin
      Found := true;
      CurVacat := VacatPool[I];
      break;
    end;

  if not Found then begin
    // Если нарезка в пуле не найдена, создаём и добавляем в пул
    SetLength(VacatPool, Length(VacatPool) + 1);

    with VacatPool[Length(VacatPool) - 1] do begin
      QryVacat := GetVacatInfoQry(SpecNr);
      CdsParts := CreatePartsCds;
    end;

    CurVacat := VacatPool[Length(VacatPool) - 1];

    LoadVacatStorn(SpecNr);
    CutUnstorn;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmStornSpecNr.GetVacatInfoQry(SpecNr: Integer): TQuery;
begin
  Result := TQuery.Create(nil);
  QryUtils.InitQuery(Result);

  with Result do begin
    SQL.Text :=
      'select * ' +
      'from z_VOtp ' +
      'where Spec_Nr = :Spec_Nr';
    ParamByName('Spec_Nr').AsInteger := SpecNr;
    Open;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Загружаем сторнирующие записи к исходной
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.LoadVacatStorn(SpecNr: Integer);
begin
  QryUtils.InitQuery(QryStorn);

  with QryStorn do begin
    SQL.Text :=
      'select * ' +
      'from z_Otkl ' +
      'where Spec_Nr = :Spec_Nr ' +
        'and Storn = "Y" ' +
      'order by Spec_Nr, Dt_Beg';
    ParamByName('Spec_Nr').AsInteger := SpecNr;
    Open;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Cds, в котором будет храниться "нарезка" сторнированных и несторнированных
// записей
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmStornSpecNr.CreatePartsCds: TClientDataSet;
var
  Field: TField;
begin
  Result := TClientDataSet.Create(nil);
  DsUtils.CopyStruct(QryOrig, Result, nil);

  with Result do begin
    FieldDefs.Add('ShVidN', ftString, 15);

    CreateDataSet;

    with Fields do begin
      (FindField('DtProc') as TDateTimeField).DisplayFormat := 'mm/yy';
      (FindField('ZaMesgod') as TDateTimeField).DisplayFormat := 'mm/yy';
    end;

    IndexDefs.Add('Primary', 'Dt_Beg;Storn', [ixPrimary]);
    IndexName := 'Primary';

    Open;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.DsCalcFields(DataSet: TDataSet);
var
  DummyStr: String;
begin
  with DataSet do
    FieldByName('ShVidN').AsString :=
      DmMain.VidN2ShVidN(FieldByName('VidN').AsString, DummyStr);
end;

//------------------------------------------------------------------------------
// Нарезаем исходную запись
//------------------------------------------------------------------------------
procedure TDmStornSpecNr.CutUnstorn;
var
  OrigPeriod: TPeriod;
  StornPeriod: TPeriod;
  Remains: TPeriods;
begin
  SetLength(Remains, 0);

  with DateUtils do begin
    with QryOrig do
      OrigPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime);

    with QryStorn do begin
      First;

      while not Eof do begin
        StornPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
          FieldByName('Dt_End').AsDateTime);

        Remains := SubtractPeriods(OrigPeriod, StornPeriod);

        if SubtractHasHead(Remains, StornPeriod) then
          // "Голову" пишем сразу в Unstorned, потому что следующие сторнирующие
          // записи будут более поздними и сторнировать "голову" уже не смогут.
          WritePart(GetSubtractHead(Remains), QryOrig);

        if SubtractHasTail(Remains, StornPeriod) then
          OrigPeriod := GetSubtractTail(Remains)
        else
          OrigPeriod := CreateEmptyPeriod;

        // Сторнирующую пишем всегда
        WritePart(StornPeriod, QryStorn, false);
        Next;
      end;
    end;

    // Дописываем остаток
    if not PeriodIsEmpty(OrigPeriod) then
      WritePart(OrigPeriod, QryOrig);

    CurVacat.CdsParts.First;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.WritePart(
  Period: TPeriod;
  SrcRec: TDataSet;
  Calc: Boolean = true
);
var
  CdsParts: TClientDataSet;
begin
  CdsParts := CurVacat.CdsParts;

  with CdsParts do begin
    Append;

    DsUtils.CopyRecord(SrcRec, CdsParts);
    FieldByName('Dt_Beg').AsDateTime := Period.Start;
    FieldByName('Dt_End').AsDateTime := Period.Finish;
    FieldByName('ShVidN').AsString := QryOrig.FieldByName('ShVidN').AsString;

    if Calc then
      CalcStornSum(CdsParts);

    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmStornSpecNr.CreateBuffCds;
begin
  with CdsBuff do
    if Active then
      EmptyDataSet
    else begin
      DsUtils.CopyStruct(QryOrig, CdsBuff);
      CreateDataSet;

      with Fields.FindField('Dt_Beg') as TDateTimeField do
        EditMask := '!99/99/9999;1;_';

      with Fields.FindField('Dt_End') as TDateTimeField do
        EditMask := '!99/99/9999;1;_';
    end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.CdsBuffAfterOpen(DataSet: TDataSet);
begin
  with CdsBuff do begin
    Fields.FieldByName('DT_BEG').OnValidate := CdsBuffStornDtBegValidate;
    Fields.FieldByName('DT_END').OnValidate := CdsBuffStornDtEndValidate;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.CdsBuffStornDtBegValidate(Sender: TField);
var
  CdsParts: TClientDataSet;
begin
  CdsParts := CurVacat.CdsParts;

  with CdsBuff do
    if (FieldByName('Dt_Beg').AsDateTime >=
        CdsParts.FieldByName('Dt_Beg').AsDateTime)
      and (FieldByName('Dt_Beg').AsDateTime <=
        CdsParts.FieldByName('Dt_End').AsDateTime)
    then
      CalcStornSum(CdsBuff)
    else
      if Assigned(DisplayDtBegErr) then
        DisplayDtBegErr(CdsBuff);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.CdsBuffStornDtEndValidate(Sender: TField);
var
  CdsParts: TClientDataSet;
begin
  CdsParts := CurVacat.CdsParts;

  with CdsBuff do
    if (FieldByName('Dt_End').AsDateTime >=
        CdsParts.FieldByName('Dt_Beg').AsDateTime)
      and (FieldByName('Dt_Beg').AsDateTime <=
        CdsParts.FieldByName('Dt_End').AsDateTime)
    then
      CalcStornSum(CdsBuff)
    else
      if Assigned(DisplayDtEndErr) then
        DisplayDtEndErr(CdsBuff);
end;

//------------------------------------------------------------------------------
procedure TDmStornSpecNr.StartStorn(
  DisplayDtBegErr, DisplayDtEndErr: TErrMsgProc;
  DisplayStornRes: TStornResProc
);
begin
  DEBUG('BEFORE');

  Self.DisplayDtBegErr := DisplayDtBegErr;
  Self.DisplayDtEndErr := DisplayDtEndErr;
  Self.DisplayStornRes := DisplayStornRes;

  CreateBuffCds;

  with CdsBuff do begin
    Open;
    Append;

    DsUtils.CopyRecord(CurVacat.CdsParts, CdsBuff);
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.StornRec;
var
  CdsParts: TClientDataSet;
  OrigPeriod, StornPeriod: TPeriod;
  Remains: TPeriods;
  HasHead, HasTail: Boolean;
begin
  CdsBuff.Post;

  CdsParts := CurVacat.CdsParts;

  with CdsParts, DateUtils do begin
    OrigPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
      FieldByName('Dt_End').AsDateTime);

    with CdsBuff do
      StornPeriod := InitPeriod(FieldByName('Dt_Beg').AsDateTime,
        FieldByName('Dt_End').AsDateTime);

    Remains := SubtractPeriods(OrigPeriod, StornPeriod);

    HasHead := SubtractHasHead(Remains, StornPeriod);
    HasTail := SubtractHasTail(Remains, StornPeriod);

    // Разбираемся с остатками текущей записи
    if HasHead then begin
      // Если у вычитания есть "голова", оставляем текущую несторнированной,
      // но укорачиваем ..
      Edit;
      FieldByName('Dt_End').AsDateTime := GetSubtractHead(Remains).Finish;
      CalcStornSum(CdsParts);
      Post;
    end;

    if HasTail then begin
      if HasHead then begin
        // текущую израсходовали на "голову", для "хвоста" добавляем запись
        Append;
        CopyRecord(QryOrig, CdsParts);

        with GetSubtractTail(Remains) do begin
          FieldByName('Dt_Beg').AsDateTime := Start;
          FieldByName('Dt_End').AsDateTime := Finish;
          FieldByName('ShVidN').AsString :=
            QryOrig.FieldByName('ShVidN').AsString;
        end;
      end else begin
        // .. делаем с "хвостом" то же что и с "головой": оставляем текущую
        // несторнированной, но укорачиваем
        Edit;
        FieldByName('Dt_Beg').AsDateTime := GetSubtractTail(Remains).Start;
      end;

      CalcStornSum(CdsParts);
      Post;
    end;

    // Разбираемся со сторнирующей записью:

    if HasHead or HasTail then begin
      // Если есть "голова" или "хвост", значит сторнировали не всю текущую
      // запись. Добавляем сторнирующую ..
      Append;
      FieldByName('ShVidN').AsString := QryOrig.FieldByName('ShVidN').AsString;
    end else
      // .. сторнировали всю текущую запись. Просто редактируем её.
      Edit;

    DsUtils.CopyRecord(CdsBuff, CdsParts);

    // Генерировать новый Nr нужно всегда, независимо от того, добавляется
    // запись или редактируется. Если добавляется, у неё нет никакого Nr, если
    // редактируется, это - несторнированные фрагменты исходной записи и Nr
    // у них такой-же как и у исходной. Их нужно заменить.
    FieldByName('Nr').AsInteger := QryUtils.GenerateId('NR_ZOTKL');

    // проставляем признак сторнирования.
    FieldByName('Storn').AsString := 'Y';
    FieldByName('DtStorn').AsDateTime := DateUtils.ThisMonth;

    FieldByName('Summa').AsFloat := -CdsBuff.FieldByName('Summa').AsFloat;
    FieldByName('Chas').AsFloat := -CdsBuff.FieldByName('Chas').AsFloat;

    Post;
  end;

  DEBUG('AFTER');
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.UnstornRec;
begin
  DEBUG('BEFORE');
  
  with CurVacat.CdsParts do begin
    Edit;
    FieldByName('Storn').AsString := '';
    FieldByName('DtStorn').AsString := '';
    Post;
  end;

  MergeUnstorn;

  DEBUG('AFTER');
end;
//------------------------------------------------------------------------------
procedure TDmStornSpecNr.MergeUnstorn;
var
  DtBeg, DtEnd: TDateTime;
  Mark1, Mark2: TBookmark;
begin
  with CurVacat.CdsParts do begin
    DtBeg := FieldByName('Dt_Beg').AsDateTime;
    DtEnd := FieldByName('Dt_End').AsDateTime;

    Mark1 := GetBookmark;
    Prior;

    if not Bof and (FieldByName('Storn').AsString <> 'Y') then begin
      Edit;
      FieldByName('Dt_End').AsDateTime := DtEnd;
      Post;

      DtBeg := FieldByName('Dt_Beg').AsDateTime;
      Mark2 := GetBookmark;

      GotoBookmark(Mark1);
      Delete;
      GotoBookmark(Mark2);
    end else
      GotoBookmark(Mark1);

    Mark1 := GetBookmark;
    Next;

    if not Eof and (FieldByName('Storn').AsString <> 'Y') then begin
      Edit;
      FieldByName('Dt_Beg').AsDateTime := DtBeg;
      Post;

      Mark2 := GetBookmark;

      GotoBookmark(Mark1);
      Delete;
      GotoBookmark(Mark2);
    end else
      GotoBookmark(Mark1);

    Edit;
    CalcStornSum(CurVacat.CdsParts);
    Post;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// После изменения PartsCds в результате сторнирования или отмены, переписываем
// QryStorn для текущего Spec_Nr. После этого, в QryStorn появляется
// PendingUpdate как основание для изменения отклонений.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmStornSpecNr.UpdateStornRecs;
var
  Nr: Integer;
begin
  // Удаляем старые сторнирования, которые были анулированы
  DsUtils.DeleteFromDataSet(QryStorn, true, DelFilterFunc);

  with CurVacat, CdsParts do begin
    // Заливаем новые сторнирования
    First;

    while not Eof do begin
      Nr := FieldByName('Nr').AsInteger;

      // Интересуют только сторнированные записи
      if FieldByName('Storn').AsString = 'Y' then
        with QryStorn do begin
          if Locate('Nr', Nr, []) then
            // Если рабочая запись обнаружена в QryStorn, она - старая.
            // Сохраняем возможные изменения
            Edit
          else
            // Если рабочая запись не обнаружена в QryStorn, она - новая.
            // Добавляем
            Append;

          DsUtils.CopyRecord(CdsParts, QryStorn);
          Post;
        end;

      Next;
    end;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmStornSpecNr.CopyFilterFunc(DsSrc: TDataSet): Boolean;
begin
  Result := DsSrc.FieldByName('Storn').AsString = 'Y';
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Удалены будут старые сторнирования, которые не найдены среди рабочих записей,
// либо найдены, но сторнирование было анулировано
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmStornSpecNr.DelFilterFunc(DsSrc: TDataSet): Boolean;
begin
  with CurVacat.CdsParts do
    Result :=
      not Locate('Nr', DsSrc.FieldByName('Nr').AsInteger, [])
        or (FieldByName('Storn').AsString <> 'Y');
end;

//------------------------------------------------------------------------------
procedure TDmStornSpecNr.CalcStornSum(Rec: TDataSet);
var
  DtBeg, DtEnd: TDateTime;
  DaysType: ShortString;
  WorkDays, WorkHrs, VacatSum, SalarySum: Double;
  MnthBudg: Double;
  MnthDays, DummyInt: Integer;
  Date: TDate;
begin
  with Rec do begin
    DtBeg := FieldByName('Dt_Beg').AsDateTime;
    DtEnd := FieldByName('Dt_End').AsDateTime;
  end;

  // по датам периода сторнирования рассчитать количество сторнируемых дней,
  // сумму сторно, оклад, который, возможно, надо вернуть

  with CurVacat.QryVacat do begin
    if FieldByName('RK').AsString = 'K' then
      DaysType := 'otk'
    else
      DaysType := 'otp';

    // ???
    // Если ZaMesGog = рабочему месяцу, то ничего возвращать не надо, достаточно
    // только сторнирующей записи - остальное автоматом сделает расчёт.

    DmMain.GetCntWrkDaysOtp(DtBeg, DtEnd, WorkDays, WorkHrs, DaysType);
    VacatSum := RoundTo(FieldByName('SmSrDn').AsFloat * WorkDays, -2);

    Date := DateUtils.Decode(Rec.FieldByName('ZaMesGod').AsDateTime);
    MnthBudg := DmMain.Budget(Date.Year, Date.Mnth, MnthDays, DummyInt);

    SalarySum := RoundTo(
      FieldByName('CurOklTrf').AsFloat / MnthBudg * WorkHrs, -2);
  end;

  with Rec do begin
    FieldByName('Summa').AsFloat := VacatSum;
    FieldByName('Chas').AsFloat := WorkHrs;
  end;

  if Assigned(DisplayStornRes) then
    DisplayStornRes(Round(WorkDays), VacatSum, Round(WorkHrs), SalarySum);
end;

//------------------------------------------------------------------------------
procedure TDmStornSpecNr.ApplyStorn;
var
  I: Integer;
begin
  for I := 0 to Length(VacatPool) - 1 do begin
    CurVacat := VacatPool[I];

    LoadVacatStorn(CurVacat.CdsParts.FieldByName('Spec_Nr').AsInteger);
    UpdateStornRecs;
    
    with QryStorn do
      if Active and UpdatesPending then
        ApplyUpdates;
  end;
end;

//------------------------------------------------------------------------------
function TDmStornSpecNr.DataIsValid(out Rec: TDataSet): Boolean;
begin
  with CdsBuff do
    Result := not FieldByName('Dt_Beg').IsNull
      and (FieldByName('Dt_Beg').AsDateTime <=
        FieldByName('Dt_End').AsDateTime);
end;

PROCEDURE TDmStornSpecNr.DEBUG(WHAT: SHORTSTRING);
BEGIN
  CURVACAT.CDSPARTS.SAVETOFILE(WHAT + '.CDS');
END;

end.
