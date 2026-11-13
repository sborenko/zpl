//
// СПОВ - система персоніфікованого обліку відомостей
//

unit ReportSpov;

interface

uses
  DbTables, ProgressStage, IFaceProgressState, DateLib;

const
  Appx1TmplName = 'J0510106.dbf';
  Appx4TmplName = 'J0510406.dbf';
  Appx5TmplName = 'J0510506.dbf';
  Appx6TmplName = 'J0510606.dbf';

  // Appx1FileName = 'J0510108';
  // Appx4FileName = 'J0510408';
  // Appx5FileName = 'J0510508';
  // Appx6FileName = 'J0510608';

  // С 1.1.2025
  Appx1FileName = 'J0510110';
  Appx4FileName = 'J0510410';
  Appx4StpFileName = 'J0510406_stp';
  Appx4ZplFileName = 'J0510406_zpl';
  Appx5FileName = 'J0510510';
  Appx6FileName = 'J0510610';

  EMPL_TYPE_PRINCIPAL      = 0; // Основной сотрудник
  EMPL_TYPE_OUTER_SUPPLMNT = 1; // Внешний совместитель
  EMPL_TYPE_INNER_SUPPLMNT = 3; // Внутренний совместитель

  EMPL_CAT_PPS = 1;  // Проф.преп.сост.
  EMPL_CAT_CPH = 13; // Гражд.прав.договор

type
  TAppx = (Appx5, Appx1And6, Appx4, Appx4Grants);
  TAppxSet = array of TAppx;

  TSpovReport = class(TProgressStage)
  private
    procedure Init;
  public
    // отчётные квартал, год
    Mnth, Quart, Year: word;
    // список сотрудников, либо пусто - для всех
    EmplIds: string;
    // набор приложений, включаемых в отчёт
    AppxSet: TAppxSet;

    OutputPath: String;

    // финальные таблицы
    TblAppx1, TblAppx4, TblAppx6: TTable;

    // С 1.1.2025 - помесячно
    constructor Create(Mnth, Quart, Year: word;
      EmplIds: String; AppxSet: TAppxSet; OutputPath: String); reintroduce;

    destructor Destroy; override;

    // Реализация IProgressProcess:
    procedure Start(ProgressState: IProgressState); override;
    function StageName: ShortString; override;
    function StageItemsTotal: integer; override;
    procedure Process; override;

    function CreateTable: TTable;
  end;

var
  SpovReport: TSpovReport;

implementation

uses
  SysUtils, a_Const,
  Appx5Stage, Appx1And6Stage, Appx4Stage, Appx4GrantsStage, PathLib;

//------------------------------------------------------------------------------
constructor TSpovReport.Create(
  Mnth, Quart, Year: word;
  EmplIds: String;
  AppxSet: TAppxSet;
  OutputPath: String);
begin
  inherited Create(nil);

  Self.Mnth := Mnth;
  Self.Quart := Quart;
  Self.Year := Year;
  Self.EmplIds := EmplIds;
  Self.AppxSet := AppxSet;
  Self.OutputPath := OutputPath;

  Init;
end;
// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
procedure TSpovReport.Init;
begin
  PathUtils.CheckCreateFolder(OutputPath);

  TblAppx1 := CreateTable;
//  TblAppx4 := CreateTable;
  TblAppx6 := CreateTable;
end;
// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
function TSpovReport.CreateTable: TTable;
begin
  Result := TTable.Create(nil);
  Result.DatabaseName := OutputPath;
  Result.TableType := ttDBase;
end;
// . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
destructor TSpovReport.Destroy;
begin
  TblAppx1.Free;
//  TblAppx4.Free;
  TblAppx6.Free;
end;

//------------------------------------------------------------------------------
procedure TSpovReport.Start(ProgressState: IProgressState);
begin
  ProgressState.SetStagesTotal(StageName, StageItemsTotal);

  inherited Start(ProgressState);

  if not ProgressState.StageIsCanceled then
    ProgressState.WriteMessage(Level,
      'Путь к результирующим файлам: ' + OutputPath);
end;

//------------------------------------------------------------------------------
function TSpovReport.StageName: ShortString;
begin
  Result := 'Формирование DBF-файлов для СПОВ';
end;

//------------------------------------------------------------------------------
function TSpovReport.StageItemsTotal: integer;
begin
  Result := Length(AppxSet);
end;

//------------------------------------------------------------------------------
procedure TSpovReport.Process;
var
  Stage: TProgressStage;
begin
  case AppxSet[CurStageIndx] of
    Appx5:
      Stage := TAppx5Stage.Create(Self);
    Appx1And6:
      Stage := TAppx1And6Stage.Create(Self);
    Appx4:
      Stage := TAppx4Stage.Create(Self);
    else
      Stage := TAppx4GrantsStage.Create(Self);
  end;

  Stage.Start(ProgressState);
  Stage.Free;

  inherited Process;
end;

end.
