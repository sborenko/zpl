unit DModAppx4Grants;

interface

uses
  SysUtils, Classes, DateLib, DB, DBTables, DBClient, Provider,
  SpovTypes;

type
  TDmAppx4Grant = class(TDataModule)
    QryNU: TQuery;
    QryPrmUv: TQuery;
    TblDBF: TTable;
    TblZpl: TTable;
  private
    RepPeriod: TPeriod;
    WorkDir: String;
    DbfName: ShortString;
    ShowProgress: TDisplayProgressHandler;

    RowNum: Integer;
    Year, Quart, Mnth: Word;
    OKPO: ShortString;

    procedure CreateReport;
    procedure ProcessMnth(Mnth: TDateTime);
    procedure ProcessStudent(
      RegNr: Integer; Mnth: TDateTime; StpType: Integer);

    procedure InitVars;

    procedure AddRecToDbf(TIN: ShortString;
      OznDox: Integer; SumNarah, SumTax, SumVSb: Double);

    procedure InitOKPO;

    procedure OpenQryNU;
    procedure PrepQryPrmUv;
    procedure CreOpenDbf;

    function GetGrantType(RegNr: Integer): Integer;

    procedure MergeWithZplAppx4;

    procedure CopyTblZpl;

  public
    class procedure Run(RepPeriod: TPeriod; WorkDir: String;
      DbfName: ShortString; ShowProgress: TDisplayProgressHandler);
  end;

var
  DmAppx4Grant: TDmAppx4Grant;

implementation

{$R *.dfm}

uses
  Math, Variants, Windows, a_Const,
  AppSettings, NumUtils, QryLib, ReportSpov, TblLib, DF4Merge;

//------------------------------------------------------------------------------
class procedure TDmAppx4Grant.Run(
  RepPeriod: TPeriod;
  WorkDir: String;
  DbfName: ShortString;
  ShowProgress: TDisplayProgressHandler);
begin
  DmAppx4Grant := TDmAppx4Grant.Create(nil);

  DmAppx4Grant.RepPeriod := RepPeriod;
  DmAppx4Grant.WorkDir := WorkDir;
  DmAppx4Grant.DbfName := DbfName;
  DmAppx4Grant.ShowProgress := ShowProgress;

  with DmAppx4Grant do begin
    ShowProgress('Приложение 4. Стипендия', Year, 0, Mnth, 0, 1, 4,
      'Формирование отчёта', 'Завершён.');

    InitVars;

    ShowProgress('Приложение 4. Стипендия', Year, 0, Mnth, 0, 2, 4,
      'Формирование отчёта', 'Выполняется');

    CreateReport;

    ShowProgress('Приложение 4. Стипендия', Year, 0, Mnth, 0, 2, 4,
      'Формирование отчёта', 'Завершён.');

    MergeWithZplAppx4;

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmAppx4Grant.MergeWithZplAppx4;
begin
  with TblZpl do begin
    DatabaseName := WorkDir;
    TableName := Appx4FileName;

    if Exists then begin
      CopyTblZpl;

      Open;
      TblDBF.Open;

      TDf4Merge.MergeTables(TblZpl, TblDBF);

      Close;
      TblDBF.Close;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmAppx4Grant.CreateReport;
begin
  InitOKPO;

  PrepQryPrmUv;

  OpenQryNU;
  RowNum := 0;

  with QryNU do
    while not Eof do
      ProcessMnth(FieldByName('DtProc').AsDateTime);
end;

//------------------------------------------------------------------------------
procedure TDmAppx4Grant.OpenQryNU;
begin
  QryUtils.InitQuery(QryNU);

  with QryNU do begin
    // Как и в зарплате выборка делается по DtProc, а не ZaMesGod
    SQL.Text :=
      'select u.Fam, u.Ima, u.Otch, u.Id, p.* ' +
      'from s_ViOut p ' +
        'left join s_Upi u on u.RegNr = p.RegNR ' +
      'where p.DtProc between :PeriodBeg and :PeriodEnd ' +
      'order by p.DtProc, p.RegNr, p.VidN';

    ParamByName('PeriodBeg').AsDateTime := RepPeriod.Start;
    ParamByName('PeriodEnd').AsDateTime := RepPeriod.Finish;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmAppx4Grant.PrepQryPrmUv;
begin
  QryUtils.InitQuery(QryPrmUv);

  with QryPrmUv do begin
    SQL.Text :=
      'select * ' +
      'from s_Pere ' +
      'where RegNr = :RegNr ' +
        'and DtBeg <= :DtMnthEnd ' +
      'order by DtBeg desc, Nr desc';

    ParamByName('DtMnthEnd').AsDateTime := RepPeriod.Finish;
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmAppx4Grant.ProcessMnth(Mnth: TDateTime);
var
  RegNr: Integer;
  GrantType: Integer;
begin
  CreOpenDbf;

  with QryNU do
    while not Eof do begin
      RegNr := FieldByName('RegNr').AsInteger;

      GrantType := GetGrantType(RegNr);

      ProcessStudent(RegNr, Mnth, GrantType);
    end;

  TblDbf.Close;
end;

//------------------------------------------------------------------------------
function TDmAppx4Grant.GetGrantType(RegNr: Integer): Integer;
begin
  with QryPrmUv do begin
    ParamByName('RegNr').AsInteger := RegNr;
    Open;
    
    Result := FieldByName('KdTipStp').AsInteger;
    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmAppx4Grant.ProcessStudent(
  RegNr: Integer;
  Mnth: TDateTime;
  StpType: Integer
);
var
  TIN: ShortString;

  SmNar127,
  SmTax127,
  SmVSb127,
  SmNar147,
  SmNar150,
  SmTax150,
  SmVSb150: Double;

  PayType: Integer;
begin
  SmNar127 := 0;
  SmTax127 := 0;
  SmVSb127 := 0;
  SmNar147 := 0;
  SmNar150 := 0;
  SmTax150 := 0;
  SmVSb150 := 0;

  with QryNU do begin
    TIN := Trim(FieldByName('Id').AsString);

    while (FieldByName('RegNR').AsInteger = RegNr)
      and (FieldByName('DtProc').AsDateTime = Mnth) and not Eof do
    begin
      PayType := FieldByName('VidN').AsInteger;

      // . . Начисления . . . . . . . . . . . . . . . . . . . . . . . . . . . .

      if PayType in [1, 3, 4, 6, 14, 15, 17] then
        // стипендии, индкс.стип и акад.отп
        // SB 23.10.25 Стипендия докторанта ложится на 127 признак
        if StpType = 17 then
          SmNar127 := SmNar127 + FieldByName('Summa').AsFloat
        // SB 23.10.25 Стип. презика, рады и кабмина - на 128
        // SB 3.11.25 Откатываем обратно на 150-й
        // else if GrantType in [7, 8, 10] then
        //   nSmNar128 := nSmNar128 + FieldByName('Summa').AsFloat
        else
          SmNar150 := SmNar150 + FieldByName('Summa').AsFloat

      else if PayType in [2, 5, 7, 18, 20, 100] then
        // соц.стипендии и инд. соц. стипендии
        SmNar127 := SmNar127 + FieldByName('Summa').AsFloat

      else if PayType in [9, 10, 11, 12, 21] then
        // сиротам 147
        SmNar147 := SmNar147 + FieldByName('Summa').AsFloat

      // . . Подоходный . . . . . . . . . . . . . . . . . . . . . . . . . . . .

      else if (PayType in [51, 54, 57, 58, 59, 60, 61]) then
        // подоходные налоги со стип и индкс
        if StpType = 17 then
          SmTax127 := SmTax127 - FieldByName('Summa').AsFloat
        else
          SmTax150 := SmTax150 - FieldByName('Summa').AsFloat

      else if PayType in [52, 53, 62, 70, 101] then
        // остальные подох.налоги
        SmTax127 := SmTax127 - FieldByName('Summa').AsFloat

      // . . Военные поборы . . . . . . . . . . . . . . . . . . . . . . . . . .

      else if PayType in [71, 73, 75, 76, 77, 78] then
        if StpType = 17 then
          SmVSb127 := SmVSb127 - FieldByName('Summa').AsFloat
        else
          SmVSb150 := SmVSb150 - FieldByName('Summa').AsFloat

      else if PayType in [72, 74, 79, 81, 102] then
        SmVSb127 := SmVSb127 - FieldByName('Summa').AsFloat;

      Next;
    end;

    if (SmNar127 <> 0) or (SmTax127 <> 0) then
      AddRecToDbf(TIN, 127, SmNar127, SmTax127, SmVSb127);

    if SmNar147 <> 0 then
      AddRecToDbf(TIN, 147, SmNar147, 0, 0);

    if (SmNar150 <> 0) or (SmTax150 <> 0) then
      AddRecToDbf(TIN, 150, SmNar150, SmTax150, SmVSb150);
  end;
end;

//------------------------------------------------------------------------------
procedure TDmAppx4Grant.AddRecToDbf(
  TIN: ShortString;
  OznDox: Integer;
  SumNarah, SumTax, SumVSb: Double
);
begin
  with TblDBF do begin
    Append;

    RowNum := RowNum + 1;
    FieldByName('NP').AsInteger      := RowNum;
    FieldByName('Period').AsInteger  := Quart;
    FieldByName('Rik').AsInteger     := Year;
    FieldByName('Kod').AsString      := OKPO;

    // 0 - юр.лицо, 1 - физ.лицо
    FieldByName('Typ').AsInteger     := 1;
    FieldByName('TIN').AsString      := TIN;

    FieldByName('S_NAR').AsFloat     := SumNarah;
    FieldByName('S_DOX').AsFloat     := SumNarah;
    FieldByName('S_TAXN').AsFloat    := SumTax;
    FieldByName('S_TAXP').AsFloat    := SumTax;

    FieldByName('OZN_DOX').AsInteger := OznDox;
    FieldByName('OZN_PILG').AsInteger := 0;

    FieldByName('A05').AsFloat := SumVSb;
    FieldByName('A051').AsFloat := SumVSb;

    // 0 - для новых записей,
    // 1 - для корректирующих
    FieldByName('Oznaka').AsInteger := 0;

    Post;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmAppx4Grant.InitVars;
var
  Dummy: word;
begin
  DecodeDate(RepPeriod.Start, Year, Mnth, Dummy);
  Quart := DateUtils.Quarter(RepPeriod.Start);
end;

//------------------------------------------------------------------------------
// Читаем из шаблона, и создаём результирующий DBF:
//------------------------------------------------------------------------------
procedure TDmAppx4Grant.CreOpenDbf;
begin
  with TblDbf do begin
    DatabaseName := WorkDir;
    TableName := DbfName;

    if not Exists then
      TblUtils.CreateDbfFromTmpl(TblDbf, Appx4TmplName);

    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmAppx4Grant.InitOKPO;
var
  Query: TQuery;
begin
  Query := TQuery.Create(nil);
  QryUtils.InitQuery(Query);

  with Query do begin
    SQL.Text :=
      'select * from z_DfRkvzt';
    Open;

    OKPO := FieldByName('OrgEDRPOU').AsString;

    Close;
    Free;
  end;
end;

//------------------------------------------------------------------------------
// Сохраняем копию неслитой со стипендией зарплатной части.
// Нужна бухгалтерам для контроля итогов.
//------------------------------------------------------------------------------
procedure TDmAppx4Grant.CopyTblZpl;
begin
  with TblZpl do
    CopyFile(
      PAnsiChar(DatabaseName + TableName + '.dbf'),
      PAnsiChar(DatabaseName + Appx4ZplFileName + '.dbf'), false
    );
end;

end.
