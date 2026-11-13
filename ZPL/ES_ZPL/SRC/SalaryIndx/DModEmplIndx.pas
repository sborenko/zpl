unit DModEmplIndx;

interface

uses
  Classes, DateLib, DB, DBTables, SysUtils, DBClient;

type
  TDmIndxExcl = class(TDataModule)
    QryIndxExcl: TQuery;
    QryIndxExclNr: TIntegerField;
    QryIndxExclTabN: TIntegerField;
    QryIndxExclDtBeg: TDateTimeField;
    QryIndxExclDtEnd: TDateTimeField;
    QryIndxExclNotes: TStringField;
    DsrcExclList: TDataSource;
    UpdIndxExcl: TUpdateSQL;
    CdsRec: TClientDataSet;
    DsrclRec: TDataSource;
    CdsRecNr: TIntegerField;
    CdsRecTabN: TIntegerField;
    CdsRecDtBeg: TDateTimeField;
    CdsRecDtEnd: TDateTimeField;
    CdsRecNotes: TStringField;
    procedure IndxExclAfterInsert(DataSet: TDataSet);
    procedure CdsRecDtSetText(Sender: TField; const Text: String);
    procedure CdsRecAfterInsert(DataSet: TDataSet);
    procedure IndxExclDtGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    TabN: Integer;
    Adding: Boolean;

    procedure PrepareRecCds;

    function CheckInput(out ErrMsg: String): Boolean;

    function FilterFunc(FieldName: ShortString): Boolean;
  public
    class function LoadAllExcl(TabN: Integer): TDmIndxExcl;
    class function PrepEmplIsExcl(MnthYear: TDateTime): TDmIndxExcl;

    function EmplIsIndxExcl(TabN: Integer): Boolean;

    procedure Add;
    procedure Edit;
    function Save(out ErrMsg: String): Boolean;
    procedure Delete;

    function HasRecords: Boolean;
  end;

var
  DmIndxExcl: TDmIndxExcl;

implementation

uses
  DsLib, QryLib, a_Dm;

{$R *.dfm}

//------------------------------------------------------------------------------
// Создаёт модуль данных с загруженными исключениями для данного сотрудника.
// Вызов используется для редактирования исключений.
//------------------------------------------------------------------------------
class function TDmIndxExcl.LoadAllExcl(TabN: Integer): TDmIndxExcl;
begin
  Result := TDmIndxExcl.Create(nil);
  Result.TabN := TabN;

  with Result do begin
    QryUtils.InitQuery(QryIndxExcl);

    with QryIndxExcl do begin
      SQL.Text :=
        'select * ' +
        'from z_EmplIndxExcl ' +
        'where TabN = :TabN ' +
        'order by DtBeg';
      ParamByName('TabN').AsInteger := TabN;
      Open;
    end;
  end;
end;

//------------------------------------------------------------------------------
// Создаёт модуль данных с подготовленными запросом для определения состояния
// исключённости сотрудника на заданную дату.
//------------------------------------------------------------------------------
class function TDmIndxExcl.PrepEmplIsExcl(
  MnthYear: TDateTime
): TDmIndxExcl;
begin
  Result := TDmIndxExcl.Create(nil);

  with Result do begin
    QryUtils.InitQuery(QryIndxExcl);

    with QryIndxExcl do begin
      SQL.Text :=
        'select * ' +
        'from z_EmplIndxExcl ' +
        'where TabN = :TabN ' +
          'and (DtBeg is null or DtBeg = "30-DEC-1899" or DtBeg <= :DtEnd) ' +
          'and (DtEnd is null or DtEnd = "30-DEC-1899" or DtEnd >= :DtBeg) ' +
      'order by DtBeg';
      ParamByName('DtBeg').AsDateTime := MnthYear;
      ParamByName('DtEnd').AsDateTime := DateUtils.EndOfMonth(MnthYear);
      Prepare;
    end;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Определение исключённости сотрудника на заранее подготовленную дату.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmIndxExcl.EmplIsIndxExcl(
  TabN: Integer
): Boolean;
begin
  with QryIndxExcl do begin
    Close;
    ParamByName('TabN').AsInteger := TabN;
    Open;
    Result := RecordCount > 0;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmIndxExcl.Add;
begin
  Adding := true;
  PrepareRecCds;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmIndxExcl.Edit;
begin
  Adding := false;
  PrepareRecCds;
  DsUtils.CopyRecord(QryIndxExcl, CdsRec);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmIndxExcl.PrepareRecCds;
begin
  with CdsRec do begin
    if Active then
      EmptyDataSet
    else begin
      CreateDataSet;
      Open;
    end;

    Append;
  end;
end;

//------------------------------------------------------------------------------
function TDmIndxExcl.Save(out ErrMsg: String): Boolean;
begin
  Result := CheckInput(ErrMsg);

  if Result then begin
    CdsRec.Post;

    with QryIndxExcl do begin
      if Adding then
        Append
      else
        Edit;

      DsUtils.CopyRecord(CdsRec, QryIndxExcl, nil, FilterFunc);
      Post;
    end;

    QryIndxExcl.CommitUpdates;
    Form_Dm.DbMain.ApplyUpdates([QryIndxExcl]);
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TDmIndxExcl.FilterFunc(FieldName: ShortString): Boolean;
begin
  Result := UpperCase(FieldName) <> 'NR'; 
end;

//------------------------------------------------------------------------------
procedure TDmIndxExcl.Delete;
begin
  with QryIndxExcl do begin
    Delete;
    Form_Dm.DbMain.ApplyUpdates([QryIndxExcl]);
    // Странная история - одним Delete'ом удаляются две записи.
    // Если остаётся одна запись, показывает 0.
    // В этом случае приходится переоткрывать.
    if RecordCount = 0 then begin
      Close;
      Open;
    end;
  end;
end;

//------------------------------------------------------------------------------
function TDmIndxExcl.HasRecords: Boolean;
begin
  Result := not QryIndxExcl.FieldByName('Nr').IsNull;
end;

//------------------------------------------------------------------------------
function TDmIndxExcl.CheckInput(out ErrMsg: String): Boolean;
var
  Mark: TBookmark;
  EditSpan, Span: TPeriod;
  Date: ShortString;
begin
  Result := true;
  ErrMsg := '';

  with CdsRec do
    EditSpan := DateUtils.InitPeriod(
      FieldByName('DtBeg').AsDateTime, FieldByName('DtEnd').AsDateTime);

  if DateUtils.PeriodIsEmpty(EditSpan) then begin
    Result := false;
    ErrMsg := 'Дата начала не может быть больше даты окончания';
    exit;
  end;

  with QryIndxExcl do begin
    DisableControls;

    Mark := GetBookmark;
    First;

    while not Eof do begin
      if FieldByName('Nr').AsInteger <> CdsRec.FieldByName('Nr').AsInteger
      then begin
        Span := DateUtils.InitPeriod(
          FieldByName('DtBeg').AsDateTime, FieldByName('DtEnd').AsDateTime);

        if DateUtils.PeriodsAreIntersected(Span, EditSpan) then begin
          Result := false;

          with Span do begin
            ErrMsg :=
              'Редактируемый период конфликтует с ранее введённым периодом ';

            if Start = 0 then
              Date := '...'
            else
              Date := DateToStr(Start);

            ErrMsg := ErrMsg + Date;
            ErrMsg := ErrMsg + ' - ';

            if Finish = 0 then
              Date := '...'
            else
              Date := DateToStr(Finish);

            ErrMsg := ErrMsg + Date;
          end;

          break;
        end;
      end;

      Next;
    end;

    GotoBookmark(Mark);
    FreeBookmark(Mark);

    EnableControls;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmIndxExcl.IndxExclAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('Nr').AsInteger :=
    QryUtils.GenerateId('GEN_Z_EMPLINDXEXCL_ID');

  DataSet.FieldByName('TabN').AsInteger := TabN;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmIndxExcl.CdsRecAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('TabN').AsInteger := TabN;
end;

//------------------------------------------------------------------------------
procedure TDmIndxExcl.CdsRecDtSetText(Sender: TField;
  const Text: String);
begin
  if Trim(Text) = '-  -' then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;

procedure TDmIndxExcl.IndxExclDtGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsDateTime = 0 then
    Text := ''
  else
    Text := DateToStr(Sender.AsDateTime);
end;

end.
