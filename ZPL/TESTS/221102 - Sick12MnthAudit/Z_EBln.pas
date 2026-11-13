unit Z_EBln;

interface

uses
  SysUtils, Classes, DB, DBTables, CustDateUtils, DBClient, Provider;

type
  TFormEBln = class(TDataModule)
    QryRBln: TQuery;
    QryRBlnNR: TIntegerField;
    QryRBlnTABN: TIntegerField;
    QryRBlnSPEC_NR: TIntegerField;
    QryRBlnZAMESGOD: TDateTimeField;
    QryRBlnRusMesGod: TStringField;
    QryRBlnSMZARABOTKA: TFloatField;
    QryRBlnCNTDAYS: TFloatField;
    QryRBlnKOEFZP: TFloatField;
    QryRBlnSmZpKoef: TFloatField;
    QryRBlnKDSPS: TSmallintField;
    QryRBlnMYFOXFLD: TSmallintField;
    QryRBlnNMPOKAZ: TStringField;
    QryRBlnVIDN: TStringField;
    QryRBlnShVidN: TStringField;
    QryRBlnSUMPROC: TFloatField;
    QryRBlnSP: TStringField;
    QryRBlnSMVZACHET: TFloatField;
    QryRBlnSM_SVM: TFloatField;
    QryRBlnCNTDAYS_SVM: TFloatField;
    QryRBlnSMVZACHET_SVM: TFloatField;
    QryRBlnSMVZACHET_CMN: TFloatField;
    TblDM: TTable;
    QryViNu: TQuery;
    QryVBln: TQuery;
    QryVBlnNR: TIntegerField;
    QryVBlnKDSPS: TSmallintField;
    QryVBlnDTPROC: TDateTimeField;
    QryVBlnTABN: TIntegerField;
    QryVBlnALGRASCH: TSmallintField;
    QryVBlnNCHBUDMES: TStringField;
    QryVBlnSERLIST: TStringField;
    QryVBlnNRLIST: TStringField;
    QryVBlnDTLIST: TDateTimeField;
    QryVBlnDTBEG: TDateTimeField;
    QryVBlnDTEND: TDateTimeField;
    QryVBlnCNTDAYS: TSmallintField;
    QryVBlnCNTCHAS: TFloatField;
    QryVBlnVIDN: TStringField;
    QryVBlnPROCOPL: TFloatField;
    QryVBlnKDTEMU: TSmallintField;
    QryVBlnKDOBJ: TSmallintField;
    QryVBlnKDKATP: TSmallintField;
    QryVBlnNOTES: TStringField;
    QryVBlnSMSRDN: TFloatField;
    QryVBlnSPEC_NR: TIntegerField;
    QryVBlnSMBLN: TFloatField;
    QryVBlnKDSPZ: TSmallintField;
    QryVBlnDAY5FIRST: TStringField;
    QryVBlnLISTCONT: TStringField;
    QryVBlnPREDSPEC_NR: TIntegerField;
    QryVBlnLNKSTOTP: TIntegerField;
    QryVBlnPRBLN: TSmallintField;
    QryVBlnSHEMA: TSmallintField;
    QryVBlnSTGCMN: TFloatField;
    QryVBlnSTG12: TFloatField;
    QryVBlnOLDKDVIDN: TSmallintField;
    QryVBlnDIGITAL: TStringField;
    QryVBlnAct_Dt: TDateTimeField;
    QryVBlnAct_Num: TStringField;
    QryTmp: TQuery;
    QryRBlnOld: TQuery;
    UpdRBln: TUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
  private
    n_TabN: integer;
    bIsFoxFilter: boolean;

    procedure Start(UnitTestPeriod: TPeriod);
    function GetRootVBln(QryVBln: TQuery): TQuery;

    function GetLastDtPrm(TabN: integer; DtBegBln: TDateTime): TDateTime;

    procedure DisplayProgress(SickListCount, I: integer);
  public
    ResultFile: TextFile;

    class procedure RunTest(Period: TPeriod);
  end;

var
  FormEBln: TFormEBln;

implementation

uses
  a_Const, Calc, CalcBy12Mnth, Compare, DATABASENAME, Load, Math, QryUtils, TextUtils;

var
  cDirTemp: ShortString;

{$R *.dfm}

//------------------------------------------------------------------------------
class procedure TFormEBln.RunTest(Period: TPeriod);
begin
  FormEBln := Create(nil);

  with FormEBln do begin
    AssignFile(ResultFile, 'CompareResult.log');
    ReWrite(ResultFile);

    Start(Period);

    CloseFile(ResultFile);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.DataModuleCreate(Sender: TObject);
begin
  Database.AliasName := DATABASE_ALIAS;	

  cDirTemp := '';
end;

//------------------------------------------------------------------------------
procedure TFormEBln.Start(UnitTestPeriod: TPeriod);
var
  SpecNr: integer;
  DtSickBeg,
  DtLastHire: TDateTime;
  RootVBln: TDataSet;
  Per12Mnth: TPeriod;
  SickListCount, I: integer;
begin
  OpenVBlnList(UnitTestPeriod);
  SickListCount := QryVBln.RecordCount;
  I := 0;

  with QryVBln, TQryUtils do begin
    while not Eof do begin
      Inc(I);
      DisplayProgress(SickListCount, I);

      RootVBln := GetRootVBln(QryVBln);

      with RootVBln do begin
        n_TabN := FieldByName('TabN').AsInteger;
        SpecNr := FieldByName('Spec_Nr').AsInteger;
        gl_nAppKdSpsUsr := FieldByName('KdSps').AsInteger;
        DtSickBeg := FieldByName('DtBeg').AsDateTime;
      end;

      DtLastHire := GetLastDtPrm(n_TabN, DtSickBeg);
      Per12Mnth := TCalc12Mnth.Get12MnthPeriod(n_TabN, DtSickBeg, DtLastHire);

      // Рассчитываем 12 мес.
      TCalc12Mnth.FillQryRBlnBy12Mes(
        RootVbln, QryRBln, Per12Mnth, true, bIsFoxFilter);

      if RootVBln <> QryVBln then
        RootVBln.Free;

      // Загружаем старый рассчёт.
      OpenOldRBln(SpecNr);
      // Сравниваем.
      TCompare.CompareRBln(QryRBln, QryRBlnOld);

      ReleaseQuery(QryRBln);
      ReleaseQuery(QryRBlnOld);

      Next;
    end;

    ReleaseQuery(QryVBln);
  end;
end;

//------------------------------------------------------------------------------
// Если родительского больничного нет, возвраащает заданный параметром,
// иначе, проходит по цепочке родительских и возвращает корневой.
//------------------------------------------------------------------------------
function TFormEBln.GetRootVBln(QryVBln: TQuery): TQuery;
var
  PrevSpecNr: integer;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure GetParent;
  begin
    with Result do begin
      TQryUtils.InitQuery(Result);
      SQL.Add(
        'select * ' +
        'from z_VBln ' +
        'where Spec_Nr = :SpecNr');
      ParamByName('SpecNr').AsInteger := PrevSpecNr;
      Open;

      PrevSpecNr := Result.FieldByName('PredSpec_Nr').AsInteger;
      if PrevSpecNr = 0 then
        exit;

      GetParent;
    end;
  end;

begin
  Result := QryVBln;
  PrevSpecNr := Result.FieldByName('PredSpec_Nr').AsInteger;

  if PrevSpecNr = 0 then
    exit;

  Result := TQryUtils.CreateQuery;
  GetParent;
end;

//------------------------------------------------------------------------------
function TFormEBln.GetLastDtPrm(TabN: integer; DtBegBln: TDateTime): TDateTime;
begin
  Result := 0;

  with QryTmp, TQryUtils do begin
    InitQuery(QryTmp);

    SQL.Add(
      'select First 1 * ' +
      'from z_PrmUv ' +
      'where TabN = :TabN ' +
        'and Dt_Priem <= :DtBegBln ' +
      'order by Dt_Priem desc');
    ParamByName('TabN').AsInteger := TabN;
    ParamByName('DtBegBln').AsDateTime := DtBegBln;
    Open;

    if RecordCount > 0 then
      Result := FieldByName('Dt_Priem').AsDateTime;

    ReleaseQuery(QryTmp);
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEBln.DisplayProgress(SickListCount, I: integer);
var
  SickListMaxLen: integer;
begin
  SickListMaxLen := Length(IntToStr(SickListCount));

  Write('Таб.№: ');
  Write(TTextUtils.PadLeft(IntToStr(n_TabN), ' ', 5));
  Write('   Лист: ');
  WriteLn(TTextUtils.PadLeft(
    IntToStr(I) + '/' + IntToStr(SickListCount), ' ', SickListMaxLen * 2 + 1));
end;

end.
