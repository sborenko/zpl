unit FileOper;

interface

uses
  AppCmn;

type
  ArchOper = class
  private
    class function BackupWarOnce(
      ShowProgress: TProgressProc): Boolean;
    class function UnpackSalToWarDir(
      ShowProgress: TProgressProc): Boolean;

    class function GetLastZip: ShortString;
  public
    class function Run(PathToZip, PathToWar: String; Steps: StepSet;
      ShowProgress: TProgressProc): Boolean;
  end;

implementation

uses
  DateLib, FileLib, Forms, PathLib, ShellApi, SysUtils, TextLib, ZipLib;

var
  ZipPath, WarPath: String;

//------------------------------------------------------------------------------
class function ArchOper.Run(PathToZip, PathToWar: String; Steps: StepSet;
  ShowProgress: TProgressProc): Boolean;
begin
  Result := true;

  ZipPath := PathToZip;
  WarPath := PathToWar;
  
  if StepBackupWar in Steps then
    Result := Result and 
      BackupWarOnce(ShowProgress);
      
  if StepUnpackZip in Steps then
    Result := Result and 
      UnpackSalToWarDir(ShowProgress);
end;

//------------------------------------------------------------------------------
class function ArchOper.BackupWarOnce(ShowProgress: TProgressProc): Boolean;
var
  Date: TDate;
  BackupDir: ShortString;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure MoveToBackup(FileName: ShortString);
  begin
    if not FileExists(WarPath + FileName) then
      exit;

    if FileExists(BackupDir + FileName) then begin
      ShowProgress(1, 'Файл ' + BackupDir + FileName + ' уже существует.');
      FileUtils.DeleteFiles(WarPath, FileName);
    end else begin
      Result := Result and
        FileUtils.CopyFilesProgress(WarPath + FileName,
          BackupDir, Application.Handle, FO_MOVE, 'Moving');

      if Result then
        ShowProgress(1, FileName + ' сохранён.');
    end;
  end;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
begin
  ShowProgress(0, 'Создание резервной копии.');
  Result := true;

  with DateUtils, Date, TextUtils do begin
    Date := Decode(Today);

    BackupDir := WarPath + Copy(IntToStr(Year), 3, 2) +
      PadLeft(IntToStr(Mnth), '0', 2) + PadLeft(IntToStr(Day), '0', 2) + '\';

    PathUtils.CheckCreateFolder(BackupDir);
  end;

  MoveToBackup('Es_Oks.fdb');
  MoveToBackup('Es_War.fdb');

  if Result then
    ShowProgress(0, STEP_DONE)
  else
    ShowProgress(0, STEP_ERROR);
end;

//------------------------------------------------------------------------------
class function ArchOper.UnpackSalToWarDir(ShowProgress: TProgressProc): Boolean;
var
  ZipName: String;
begin
  ShowProgress(0, 'Распаковка последнего архива "Зарплаты".');
  Result := false;

  ZipName := GetLastZip;

  try
    ZipUtils.ShellUnzip(ZipPath + ZipName, WarPath);
    ShowProgress(1, 'Распаковка завершена.');

    FileUtils.DeleteFiles(WarPath, 'Es_War.fdb');
    ShowProgress(1, 'Файл Es_War.fdb удалён.');

    Result := RenameFile(WarPath + 'Es_Opi.fdb', WarPath + 'Es_War.fdb');

    if Result then
      ShowProgress(1, 'Файл Es_Opi.fdb переименован в Es_War.fdb.')
    else
      ShowProgress(1, 'Ошибка переименования файла Es_Opi.fdb в Es_War.fdb.');
  except
    on E: Exception do
      ShowProgress(1, E.Message);
  end;

  if Result then
    ShowProgress(0, STEP_DONE)
  else
    ShowProgress(0, STEP_ERROR);
end;

//------------------------------------------------------------------------------
class function ArchOper.GetLastZip: ShortString;
var
  SrchRec: TSearchRec;
  FileDate, ModifDate, DummyDate: TDateTime;
begin
  FileDate := 0;
  Result := '';

  if FindFirst(ZipPath + '*.zip', faAnyFile, SrchRec) = 0 then begin
    repeat
      if (SrchRec.Attr <> faDirectory) then begin
        FileUtils.GetFileTimes(ZipPath + SrchRec.Name,
          DummyDate, DummyDate, ModifDate);

        if ModifDate > FileDate then begin
          FileDate := ModifDate;
          Result := SrchRec.Name;
        end;
      end;
    until FindNext(SrchRec) <> 0;

    FindClose(SrchRec);
  end;
end;

end.
