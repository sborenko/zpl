unit DModMain;

interface

uses
  SysUtils, Classes, DBClient, DB, DBTables, Math, DateLib;

type
  TTotals = record
    S_NAR,
    S_DOX,
    S_TAXN,
    S_TAXP,
    A051,
    A05: Double;
  end;

  TDmMain = class(TDataModule)
    Query: TQuery;
    TblResult: TTable;
    QryPeek: TQuery;
    Database: TDatabase;
    TblTIN: TTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    RootDirName,
    InputDirName,
    OutputDirName: String;

    CurQuartBeg: TDateTime;
    CurMnth: Word;
    Date: TDate;

    FileName: ShortString;

    TIN: ShortString;

    procedure PrepareQryPeek;

    procedure ProcessQuart;
    procedure ProcessMnth(Mnth: Word);

    function PersonIsStudent: Boolean;
    procedure ProcessStudent;

    procedure SkipTIN;

    procedure CloneAsIncorrect;

    procedure FixStudent;
    procedure WriteCorrectRec(TIN: ShortString; Totals: TTotals);

    procedure OpenQuery(DbfFileName: ShortString);
    procedure CreateResultTbl(DbfFileName: ShortString);

    function CurQuartToRom: ShortString;
    function CurQuartToFileSuff: ShortString;

    class function InitTotals: TTotals;
    class procedure AccumTotals(Rec: TDataSet; var Totals: TTotals);

    procedure OpenLog;
    procedure CloseLog;
    procedure WriteLogQuart(Year, Mnth: Word);
    procedure WriteLogINN(TIN: ShortString);
  public
    class procedure Run;
  end;

var
  DmMain: TDmMain;

implementation

uses
  CdsLib, DATABASENAME, DsLib, LogLib, PathLib, QryLib, TblLib, TextLib;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TDmMain.Run;
var
  LastQuartBeg: TDateTime;
begin
  with TDmMain.Create(nil) do begin
    RootDirName := PathUtils.GetExePath;

    with DateUtils do begin
      CurQuartBeg := EncodeDate(2021, FirstMnthOfQuart(2), 1);
      LastQuartBeg := EncodeDate(2023, FirstMnthOfQuart(1), 1);

      while CurQuartBeg <= LastQuartBeg do begin
        ProcessQuart;
        CurQuartBeg := NextMonth(CurQuartBeg, 3);
      end;
    end;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.DataModuleCreate(Sender: TObject);
begin
  Database.AliasName := DATABASE_ALIAS;

  PrepareQryPeek;
  OpenLog;
end;

//------------------------------------------------------------------------------
procedure TDmMain.DataModuleDestroy(Sender: TObject);
begin
  CloseLog;
end;

//------------------------------------------------------------------------------
procedure TDmMain.PrepareQryPeek;
begin
  QryUtils.InitQuery(QryPeek);

  with QryPeek do begin
    SQL.Add(
      'select u.Id ' +
      'from s_ViOut p ' +
        'left join s_Upi u on u.RegNr = p.RegNR ' +
      'where u.Id = :TIN ' +
        'and p.DtProc >= :PeriodBeg and p.DtProc <= :PeriodEnd');
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.ProcessQuart;
var
  Mnth: Word;
begin
  Date := DateUtils.Decode(CurQuartBeg);

  InputDirName := RootDirName  +
    'DATA\INPUT\' + IntToStr(Date.Year) + '\' + CurQuartToRom + ' кв\';

  OutputDirName := RootDirName  +
    'DATA\OUTPUT\' + IntToStr(Date.Year) + '\' + CurQuartToRom + ' кв\';

  Query.DatabaseName := InputDirName;

  for Mnth := 1 to 3 do
    ProcessMnth(Mnth);
end;

//------------------------------------------------------------------------------
procedure TDmMain.ProcessMnth(Mnth: Word);
begin
  WriteLogQuart(Date.Year, Mnth);

  CurMnth := Mnth;

  FileName := 'J051040' + CurQuartToFileSuff + '_' + IntToStr(Mnth);

  OpenQuery(FileName + '.dbf');

  CreateResultTbl(FileName);

  with Query do begin
    First;

    while not Eof do begin
      TIN := FieldByName('TIN').AsString;

      if PersonIsStudent then
        ProcessStudent
      else
        SkipTIN;
    end;

    QryUtils.ReleaseQuery(Query);
  end;

  TblResult.Close;
end;

//------------------------------------------------------------------------------
procedure TDmMain.OpenQuery(DbfFileName: ShortString);
begin
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Append(
      'select * ' +
      'from ' + DbfFileName + ' ' +
      'order by TIN, Ozn_Dox');
    Open;
  end; {with}
end;

//------------------------------------------------------------------------------
procedure TDmMain.CreateResultTbl(DbfFileName: ShortString);
begin
  PathUtils.CheckCreateFolder(OutputDirName);

  with TblResult do begin
    DatabaseName := OutputDirName;
    TableName := DbfFileName;

    TblUtils.CreateTable(Query, TblResult);
    Open;
  end;
end;

//------------------------------------------------------------------------------
function TDmMain.PersonIsStudent: Boolean;
var
  Mnth: TDateTime;
begin
  // "Попавшиеся" сотрудники:
  RESULT := (TIN <> '2125812776')
    AND (TIN <> '2133623428')
    AND (TIN <> '2268709266') AND (TIN <> '2631906643');
  EXIT;

  // Очень медленно работает. Отказался.
  with DateUtils do
    Mnth := NextMonth(CurQuartBeg, CurMnth - 1);

  with QryPeek do begin
    ParamByName('TIN').AsString := TIN;
    ParamByName('PeriodBeg').AsDateTime := Mnth;
    ParamByName('PeriodEnd').AsDateTime := DateUtils.EndOfMonth(Mnth);
    Open;
    Result := RecordCount > 0;
    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.ProcessStudent;
begin
  with Query do
    while not Eof and (FieldByName('TIN').AsString = TIN) do
      if Query.FieldByName('OZN_DOX').AsInteger = 127 then
        FixStudent
      else
        Next;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SkipTIN;
begin
  with Query do
    while not Eof and (FieldByName('TIN').AsString = TIN) do
      Next;
end;

//------------------------------------------------------------------------------
procedure TDmMain.FixStudent;
var
  Totals: TTotals;
begin
  Totals := InitTotals;

  with Query do
    while not Eof and (FieldByName('TIN').AsString = TIN) do begin
      if Query.FieldByName('OZN_DOX').AsInteger in [127, 147] then begin
        CloneAsIncorrect;
        AccumTotals(Query, Totals);
      end;

      Next;
    end;

  WriteCorrectRec(TIN, Totals);
end;

//------------------------------------------------------------------------------
procedure TDmMain.CloneAsIncorrect;
begin
  with TblResult do begin
    Insert;
    DsUtils.CopyRecord(Query, TblResult);
    FieldByName('Oznaka').AsInteger := 1;
    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.WriteCorrectRec(TIN: ShortString; Totals: TTotals);
begin
  WriteLogINN(TIN);

  with TblResult, Totals do begin
    Insert;
    FieldByName('TIN').AsString := TIN;

    FieldByName('S_NAR').AsFloat := S_NAR;
    FieldByName('S_DOX').AsFloat := S_DOX;
    FieldByName('S_TAXN').AsFloat := S_TAXN;
    FieldByName('S_TAXP').AsFloat := S_TAXP;
    FieldByName('A051').AsFloat := A051;
    FieldByName('A05').AsFloat := A05;

    FieldByName('OZN_DOX').AsInteger := 147;
    FieldByName('Oznaka').AsInteger := 0;
    Post;
  end;
end;

//------------------------------------------------------------------------------
class procedure TDmMain.AccumTotals(Rec: TDataSet; var Totals: TTotals);
begin
  with Rec, Totals do begin
    S_NAR := S_NAR + FieldByName('S_NAR').AsFloat;
    S_DOX := S_DOX + FieldByName('S_DOX').AsFloat;
    S_TAXN := S_TAXN + FieldByName('S_TAXN').AsFloat;
    S_TAXP := S_TAXP + FieldByName('S_TAXP').AsFloat;
    A051 := A051 + FieldByName('A051').AsFloat;
    A05 := A05 + FieldByName('A05').AsFloat;
  end;
end;

//------------------------------------------------------------------------------
function TDmMain.CurQuartToRom: ShortString;
var
  Quart: Integer;
begin
  Quart := DateUtils.Quarter(CurQuartBeg);

  case Quart of
    1: Result := 'I';
    2: Result := 'II';
    3: Result := 'III';
    else Result := 'IV';
  end;
end;

//------------------------------------------------------------------------------
function TDmMain.CurQuartToFileSuff: ShortString;
begin
  if CurQuartBeg < EncodeDate(2022, DateUtils.FirstMnthOfQuart(4), 1) then
    Result := '7'
  else
    Result := '8';
end;

//------------------------------------------------------------------------------
class function TDmMain.InitTotals: TTotals;
begin
  Result.S_NAR := 0;
  Result.S_DOX := 0;
  Result.S_TAXN := 0;
  Result.S_TAXP := 0;
  Result.A051 := 0;
  Result.A05 := 0;
end;

//------------------------------------------------------------------------------
procedure TDmMain.OpenLog;
begin
  LogUtils.Open('Log.log');
  
  with TblTIN do begin
    Open;
    EmptyTable;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.CloseLog;
begin
  LogUtils.Close;
  TblTIN.Close;
end;

//------------------------------------------------------------------------------
procedure TDmMain.WriteLogQuart(Year, Mnth: Word);
begin
  LogUtils.Write(
    IntToStr(Mnth) + ' мес. ' + CurQuartToRom + ' кв. ' + IntToStr(Date.Year));
end;

//------------------------------------------------------------------------------
procedure TDmMain.WriteLogINN(TIN: ShortString);
begin
  LogUtils.Write('   ' + TIN);

  with TblTIN do
    if not Locate('TIN', TIN, []) then begin
      Insert;
      FieldByName('TIN').AsString := TIN;
      Post;
    end;
end;

end.
