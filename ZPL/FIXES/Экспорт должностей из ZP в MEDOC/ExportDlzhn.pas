unit ExportDlzhn;

interface

uses SysUtils, DB;

type
  TDlzhnExport = class
  public
    class function ExportDlzhnZpToMedoc(cApplicationPath: string): boolean;
  private
    class procedure OpenDlzhnZp;
    class procedure CreateDlzhnMedoc(cApplicationPath: string);
    class procedure CloseSrc;
    class procedure CloseDst;
    class procedure CopyRecs;
  end;

implementation

uses
  DataModule;

function CyrUpper(cLetter: char): char;
const
  cLowerCase = 'àáâãäå¸æçèéêëìíîïðñòóôõö÷øùúûüýþÿ³¿º';
	cUpperCase = 'ÀÁÂÃÄÅ¨ÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß²¯ª';
var
  iPos: integer;
begin
  iPos := Pos(cLetter, cLowerCase);
  if iPos = 0 then
    Result := Chr(32)
  else
    Result := cUpperCase[iPos];
end;

class function TDlzhnExport.ExportDlzhnZpToMedoc(cApplicationPath: string): boolean;
begin
  Result := true;

  try
    OpenDlzhnZp;
    CreateDlzhnMedoc(cApplicationPath);
    CopyRecs;
  except
    Result := false;
  end;

  CloseSrc;
  CloseDst;
end;

class procedure TDlzhnExport.OpenDlzhnZp;
begin
  with DataMod.TblSrc do begin
    DatabaseName := 'ES_OPI';
    TableName := 'O_DOLGNOST';
    Open;
  end;
end;

class procedure TDlzhnExport.CreateDlzhnMedoc(cApplicationPath: string);
begin
  with DataMod.TblDst do begin
    DatabaseName := cApplicationPath;
    TableName := 'ZP_DLZHN';
    FieldDefs.Add('Code', ftInteger);
    FieldDefs.Add('IdOrg', ftInteger);
    FieldDefs.Add('CodeKP', ftString, 254);
    FieldDefs.Add('ZKPP', ftString, 254);
    FieldDefs.Add('Name', ftString, 254);
    CreateTable;
    Open;
  end;
end;

class procedure TDlzhnExport.CloseSrc;
begin
  DataMod.TblSrc.Close;
end;

class procedure TDlzhnExport.CloseDst;
begin
  DataMod.TblDst.Close;
end;

class procedure TDlzhnExport.CopyRecs;
var
  cDlzhn: string;
begin
  with DataMod.TblSrc do begin
    First;
    while not Eof do begin
      with DataMod.TblDst do begin
        Append;
        FieldByName('Code').AsInteger := DataMod.TblSrc.FieldByName('KdOK').AsInteger;
        FieldByName('CodeKP').AsString := DataMod.TblSrc.FieldByName('Code').AsString;
        FieldByName('ZKPP').AsString := DataMod.TblSrc.FieldByName('C_ZKPP').AsString;
        cDlzhn := DataMod.TblSrc.FieldByName('NameOK').AsString;
        FieldByName('Name').AsString := CyrUpper(cDlzhn[1]) + Copy(cDlzhn, 2, Length(cDlzhn) - 1);
        Post;
      end;
      Next;
    end;
  end;
end;

end.

