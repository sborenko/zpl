unit DModMain;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDmMain = class(TDataModule)
    DbMain: TDatabase;
    QryVBln: TQuery;
    QryPayTypes: TQuery;
    UpdVBln: TUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure OpenQryVBln;
    procedure PrepareQryPayTypes;
    procedure OpenQryPayTypes(SpecNr: Integer);
    procedure FixSickList(VBln: TDataSet);
    function TranslateFlags(Flags: Word): ShortString;
  public
    { Public declarations }
  end;

var
  DmMain: TDmMain;

implementation

uses
  DATABASENAME, DsLib, QryLib, LogLib;

const
  DAYS_PRINC_5: Integer = 8;
  DAYS_PRINC_FUND: Integer  = 4;
  DAYS_SUPPL_5: Integer = 2;
  DAYS_SUPPL_FUND: Integer  = 1;

{$R *.dfm}

//..............................................................................
procedure TDmMain.DataModuleCreate(Sender: TObject);
var
  Resume: ShortString;
begin
  DbMain.AliasName := DATABASE_ALIAS;

  OpenQryVBln;
  PrepareQryPayTypes;

  LogUtils.Open('SickListsFix.log');

  DsUtils.EnumDataSet(QryVBln, FixSickList);

  QryVBln.ApplyUpdates;
  QryVBln.CommitUpdates;

  Resume := 'RECORDS UPDATED: ' + IntToStr(QryVBln.RecordCount) + '.';

  LogUtils.Write('');
  LogUtils.Write(Resume);
  LogUtils.Close;

  Write(Resume);
  ReadLn;
end;

//..............................................................................
procedure TDmMain.FixSickList(VBln: TDataSet);
var
  PayType: ShortString;
  Suppl: Boolean;
  DayFlags: Word;
  FlagsBefore, FlagsAfter: ShortString;
begin
  DayFlags := 0;

  with VBln do begin
    OpenQryPayTypes(FieldByName('Spec_Nr').AsInteger);

    FlagsBefore := TranslateFlags(FieldByName('DayFlags').AsInteger);

    with QryPayTypes do begin
      while not Eof do begin
        PayType := FieldByName('VidN').AsString;
        Suppl := FieldByName('Sovm').AsString = 'Y';

        if PayType = '2603' then
          if Suppl then
            DayFlags := DayFlags or DAYS_SUPPL_5
          else
            DayFlags := DayFlags or DAYS_PRINC_5
        else
          if Suppl then
            DayFlags := DayFlags or DAYS_SUPPL_FUND
          else
            DayFlags := DayFlags or DAYS_PRINC_FUND;

        Next;
      end;

      Close;
    end;

    FlagsAfter := TranslateFlags(DayFlags);

    Edit;
    FieldByName('DayFlags').AsInteger := DayFlags;
    Post;

    LogUtils.Write(
    IntToStr(FieldByName('TabN').AsInteger) + ': ');
    LogUtils.Write('  Было:  ' + FlagsBefore);
    LogUtils.Write('  Стало: ' + FlagsAfter);
  end;
end;

//..............................................................................
function TDmMain.TranslateFlags(Flags: Word): ShortString;
begin
  Result := '';

  if (Flags and DAYS_PRINC_5) <> 0 then
    Result := Result + 'Осн. 5 дн., ';

  if (Flags and DAYS_PRINC_FUND) <> 0 then
    Result := Result + 'Осн. Фонд, ';

  if (Flags and DAYS_SUPPL_5) <> 0 then
    Result := Result + 'Совм. 5 дн., ';

  if (Flags and DAYS_SUPPL_FUND) <> 0 then
    Result := Result + 'Совм. Фонд.';
end;

//..............................................................................
procedure TDmMain.OpenQryVBln;
begin
  QryUtils.InitQuery(QryVBln);

  with QryVBln do begin
    SQL.Add(
      'select * ' +
      'from z_VBln ' +
      'where DtProc >= "04/01/2023" ' +
        // Не декретные.
        'and VidN <> "2602"' +
      'order by tabn, spec_nr');
    Open;
  end;
end;

//..............................................................................
procedure TDmMain.PrepareQryPayTypes;
begin
  QryUtils.InitQuery(QryPayTypes);

  with QryPayTypes do begin
    SQL.Add(
      'select * ' +
      'from z_Otkl ' +
      'where Spec_Nr = :SpecNr');
    Prepare;
  end;
end;

//..............................................................................
procedure TDmMain.OpenQryPayTypes(SpecNr: Integer);
begin
  with QryPayTypes do begin
    ParamByName('SpecNr').AsInteger := SpecNr;
    Open;
  end;
end;

end.
