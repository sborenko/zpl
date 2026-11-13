unit DModMain;

interface

uses
  SysUtils, Classes, DBClient, DB, DBTables, Math;

type
  TDmMain = class(TDataModule)
    QryEmpl: TQuery;
    CdsDest: TClientDataSet;
    Cds101: TClientDataSet;
    Cds102: TClientDataSet;
    CdsOther: TClientDataSet;
    TblResult: TTable;
    QryStud: TQuery;
  private
    RootDirName,
    QuartDirName: string;
    FileName: ShortString;

    procedure ProcessQuart(QuartName: string);
    procedure ProcessMnth(Mnth: word);

    procedure OpenQryEmpl(DbfFileName: ShortString);
    procedure OpenQryStud(DbfFileName: ShortString);
    procedure CloseQryEmpl;
    procedure CloseQryStud;

    procedure CreOpenCds(Cds: TClientDataSet);
    procedure UpdateData;
    procedure CacheQryRec(Dest: TClientDataSet);

    function RecordIsTaxable: boolean;
    procedure CalcMilitTax;

    procedure CopyToCds(Src: TDataSet; Dest: TClientDataSet; Sign: integer = 0);
    procedure MoveToDest(Src: TClientDataSet; Sign: integer);
    procedure ClearDataSet(DS: TDataSet);

    procedure SaveResult;
  public
    class procedure Run(PathToFiles: string);
  end;

var
  DmMain: TDmMain;

implementation

uses
  QryUtils;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TDmMain.Run(PathToFiles: string);
begin
  with TDmMain.Create(nil) do begin
    RootDirName := PathToFiles;

    ProcessQuart('Y2021QI');
    // ProcessQuart('Y2021QII');
    // ProcessQuart('Y2021QIII');
    // ProcessQuart('Y2021QIV');
    // ProcessQuart('Y2022QI');
    // ProcessQuart('Y2022QII');

    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.ProcessQuart(QuartName: string);
var
  I: integer;
begin
  QuartDirName := RootDirName  + '\' + QuartName;

  QryEmpl.DatabaseName := QuartDirName;
  QryStud.DatabaseName := QuartDirName;

  for I := 1 to 3 do
    ProcessMnth(I);
end;

//------------------------------------------------------------------------------
procedure TDmMain.ProcessMnth(Mnth: word);
begin
  FileName := 'J0510406' + '_' + IntToStr(Mnth);

  OpenQryEmpl(FileName + '.dbf');

  CreOpenCDS(Cds101);
  CreOpenCDS(Cds102);
  CreOpenCDS(CdsOther);
  CreOpenCDS(CdsDest);

  UpdateData;
  CloseQryEmpl;

  // Открываем и дописываем студентов.
  {
  Не нужны
  OpenQryStud(FileName + '.dbf');
  CopyToCds(QryStud, CdsDest);
  CloseQryStud;
  }

  CdsDest.SaveToFile(QuartDirName + '\' + FileName + '.cds');

  SaveResult;
end;

//------------------------------------------------------------------------------
procedure TDmMain.SaveResult;
begin
  with TblResult do begin
    DatabaseName := QuartDirName;
    TableName := FileName + '_UPD.dbf';

    TQryUtils.CreateTable(CdsDest, TblResult);
    Open;
  end;

  with CdsDest do begin
    First;

    while not Eof do begin
      with TblResult do begin
        Insert;
        TQryUtils.CopyRecord(CdsDest, TblResult);
        Post;
      end;

      Next;
    end;
  end;

  TblResult.Close;
end;

//------------------------------------------------------------------------------
procedure TDmMain.OpenQryEmpl(DbfFileName: ShortString);
begin
  with QryEmpl do begin
    SQL.Append(
      'select * ' +
      'from ' + DbfFileName + ' ' +
      'where Ozn_Dox in ("101", "102") ' +
      'order by TIN, Ozn_Dox');

    Open;
  end; {with}
end;

//------------------------------------------------------------------------------
procedure TDmMain.OpenQryStud(DbfFileName: ShortString);
begin
  with QryStud do begin
    SQL.Append(
      'select * ' +
      'from ' + DbfFileName + ' ' +
      'where Ozn_Dox in ("127", "128", "147", "150") ' +
      'order by TIN, Ozn_Dox');

    Open;
  end; {with}
end;

//------------------------------------------------------------------------------
procedure TDmMain.CloseQryEmpl;
begin
  with QryEmpl do begin
    Close;
    SQL.Clear;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.CloseQryStud;
begin
  with QryStud do begin
    Close;
    SQL.Clear;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.CreOpenCds(Cds: TClientDataSet);
begin
  with Cds do
    if Active then
      Cds.EmptyDataSet
    else begin
      TQryUtils.CreateCDS(QryEmpl, Cds);
      Open;
    end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.UpdateData;
var
  TIN: ShortString;
  Sign: integer;
begin
  with QryEmpl do begin
    First;

    while not Eof do begin
      TIN  := FieldByName('TIN').AsString;
      Sign := 1;

      while (TIN = FieldByName('TIN').AsString) and not Eof do begin
        if FieldByName('Ozn_Dox').AsInteger = 101 then
          CacheQryRec(Cds101)

        else if (FieldByName('Ozn_Dox').AsInteger = 102) then begin
          CacheQryRec(Cds102);

          if RecordIsTaxable then begin
            // Если есть что считать (от S_TaxN) и есть что уменьшать (запись 101),
            // считаем и уменьшаем. Предварительно копируем оригинальные записи.
            CopyToCds(Cds101, CdsDest, Sign);
            CopyToCds(Cds102, CdsDest, Sign);
            // CopyToCds(CdsOther, CdsDest, Sign);

            // Пересчитывам военный сбор.
            CalcMilitTax;
            // Устанавливаем знак корректирующих записей для налоговой.
            Sign := 0;

            MoveToDest(Cds101, Sign);
            MoveToDest(Cds102, Sign);
          end;
        end else
          CacheQryRec(CdsOther);

        Next;
      end;

      // В зависимости от того, был ли военный сбор, копируем либо оригинальные,
      // либо пересчитанные.
      // MoveToDest(Cds101, Sign);
      // MoveToDest(Cds102, Sign);
      // MoveToDest(CdsOther, Sign);

      ClearDataSet(Cds101);
      ClearDataSet(Cds102);
    end;
  end; {with}
end;

//------------------------------------------------------------------------------
procedure TDmMain.CacheQryRec(Dest: TClientDataSet);
begin
  with Dest do begin
    Insert;
    TQryUtils.CopyRecord(QryEmpl, Dest);
    Post;
  end;
end;

//------------------------------------------------------------------------------
function TDmMain.RecordIsTaxable: boolean;
begin
  Result := (QryEmpl.FieldByName('S_TaxN').AsFloat <> 0) and not Cds101.Eof;
end;

//------------------------------------------------------------------------------
procedure TDmMain.CalcMilitTax;
var
  TaxValue: double;
begin
  with Cds102 do begin
    TaxValue := RoundTo(FieldByName('S_Nar').AsFloat * 0.015, -2);

    First;
    Edit;
    FieldByName('A051').AsFloat := TaxValue;
    FieldByName('A05').AsFloat := TaxValue;
    Post;

    with Cds101 do begin
      First;
      Edit;
      FieldByName('A051').AsFloat := RoundTo(FieldByName('A051').AsFloat - TaxValue, -2);
      FieldByName('A05').AsFloat := RoundTo(FieldByName('A05').AsFloat - TaxValue, -2);
      Post;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.CopyToCds(Src: TDataSet; Dest: TClientDataSet; Sign: integer = 0);
begin
  with Src do begin
    First;

    while not Eof do begin
      with Dest do begin
        Insert;

        TQryUtils.CopyRecord(Src, Dest);
        FieldByName('Oznaka').AsInteger := Sign;

        Post;
      end;

      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.MoveToDest(Src: TClientDataSet; Sign: integer);
begin
  with Src do begin
    First;

    while not Eof do begin
      with CdsDest do begin
        Insert;

        TQryUtils.MoveRecord(Src, CdsDest);
        FieldByName('Oznaka').AsInteger := Sign;

        Post;
      end;

      Next;
    end;
  end;
end;

procedure TDmMain.ClearDataSet(DS: TDataSet);
begin
  with DS do begin
    First;

    while not Eof do
      Delete;
  end;
end;

end.
