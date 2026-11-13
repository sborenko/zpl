unit CsvLib;

interface

uses
  Classes, DB;

type
  TCsvFile = class
  private
    CsvFile: TextFile;
    _LineCount: integer;
    _FieldNames,
    _Values: TStringList;
    Opened: boolean;

    constructor Create(Delimiter: Char);

    function ReadCsvLine(DstList: TStringList): boolean;
    procedure WriteCsvLine(SrcList: TStringList);
  public
    class function OpenCsvFile(
      FilePathName: string;
      Delimiter: Char): TCsvFile;
    procedure CountLines;
    function ReadValues: boolean;

    class function CreateCsvFile(
      FilePathName: string;
      Delimiter: Char): TCsvFile;
    procedure WriteFieldNames;
    procedure WriteValues;

    destructor Destroy; override;

    property LineCount: integer read _LineCount;
    property FieldNames: TStringList read _FieldNames;
    property Values: TStringList read _Values;
  end;

implementation

uses
  SysUtils, Math;

//------------------------------------------------------------------------------
class function TCsvFile.OpenCsvFile(
  FilePathName: string;
  Delimiter: Char): TCsvFile;
begin
  Result := TCsvFile.Create(Delimiter);

  with Result do
    try
      AssignFile(CsvFile, FilePathName);
      Reset(CsvFile);
      Opened := true;
      
      CountLines;
      Reset(CsvFile);

      // „итаем имена полей.
      if not ReadCsvLine(_FieldNames) then
        raise Exception.Create('Ќе заданы пол€.');
    except
      on e: Exception do begin
        Result.Free;

        raise Exception.Create(
          'ќшибка .CSV-файла ' + FilePathName + '. ' +
          e.Message);
      end;
    end;
end; {OpenCsvFile}

//------------------------------------------------------------------------------
class function TCsvFile.CreateCsvFile(
  FilePathName: string;
  Delimiter: Char): TCsvFile;
begin
  Result := TCsvFile.Create(Delimiter);

  with Result do
    try
      AssignFile(CsvFile, FilePathName);
      Rewrite(CsvFile);
      Opened := true;
    except
      Result.Free;
      raise Exception.Create('ќшибка создани€ .CSV-файла ' + FilePathName);
    end;
end;

//------------------------------------------------------------------------------
constructor TCsvFile.Create(Delimiter: Char);
begin
  _FieldNames := TStringList.Create;
  _FieldNames.Delimiter := Delimiter;

  _Values := TStringList.Create;
  _Values.Delimiter := Delimiter;
end;

//------------------------------------------------------------------------------
destructor TCsvFile.Destroy;
begin
  if Opened then
    CloseFile(CsvFile);

  _FieldNames.Free;
  _Values.Free;
end; {Destroy}

//------------------------------------------------------------------------------
procedure TCsvFile.CountLines;
var
  Line: string;
begin
  _LineCount := 0;

  while not Eof(CsvFile) do begin
    ReadLn(CsvFile, Line);
    Inc(_LineCount);
  end;

  _LineCount := Max(0, _LineCount - 1);
end;

//------------------------------------------------------------------------------
function TCsvFile.ReadValues: boolean;
begin
  Result := ReadCsvLine(_Values);
end; {ReadCsvLine}

//------------------------------------------------------------------------------
function TCsvFile.ReadCsvLine(DstList: TStringList): boolean;
var
  Line: string;
begin
  ReadLn(CsvFile, Line);

  with DstList do begin
    DelimitedText := Line;
    Result := Count > 0;
  end;
end;

//------------------------------------------------------------------------------
// _FieldNames доступны и заполн€ютс€ в точке вызова
// через обращение к свойству FieldNames.
//------------------------------------------------------------------------------
procedure TCsvFile.WriteFieldNames;
begin
  WriteCsvLine(_FieldNames);
end;

//------------------------------------------------------------------------------
// _Values доступны и заполн€ютс€ в точке вызова
// через обращение к свойству Values.
//------------------------------------------------------------------------------
procedure TCsvFile.WriteValues;
begin
  WriteCsvLine(_Values);
end;

//------------------------------------------------------------------------------
procedure TCsvFile.WriteCsvLine(SrcList: TStringList);
begin
  WriteLn(CsvFile, SrcList.DelimitedText);
end;

end.

