program Export;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  DataModule in 'DataModule.pas' {DataMod: TDataModule},
  ExportDlzhn in 'ExportDlzhn.pas';

procedure WriteMessage(cMessage: string);
var
  cOEM: array[0..255] of char;
begin
  CharToOEM(PChar(cMessage), cOEM);
  WriteLn(cOEM);
end;

begin
  WriteMessage('Приложение экспортирует справочник должностей приложения ''Зарплата'' в файл .DBF в  формате справочника должностей приложения MeDoc.');
  WriteMessage('Нажмите любую клавишу для продолжения.');
  ReadLn;

  DataMod := TDataMod.Create(nil);

  if TDlzhnExport.ExportDlzhnZpToMedoc(ExtractFilePath(ParamStr(0))) then begin
    WriteMessage('Экспорт завершён.');
    ReadLn;
  end;

  DataMod.Free;
end.
