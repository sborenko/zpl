unit Appx5AssignsStage;

interface

uses
  Db, DbTables,
  Appx5Stage, Appx5ChildStage, ProgressStage;

type
  TAppx5AssignsStage = class(TAppx5ChildStage)
  private
    QryPeekHire: TQuery;

    procedure OpenAssignsQry;
    procedure ProcessAssigns;
  protected
    procedure InitData; override;
    procedure FreeData; override;
  public
    procedure Process; override;
  end;

implementation

uses
  SysUtils, ReportSpov, QryLib;

//------------------------------------------------------------------------------
procedure TAppx5AssignsStage.InitData;
begin
  _StageName :='Обработка перемещений.';

  OpenAssignsQry;
  QryPeekHire := TQuery.Create(nil);
end;

//------------------------------------------------------------------------------
procedure TAppx5AssignsStage.FreeData;
begin
  inherited FreeData;
  QryPeekHire.Free;
end;

//------------------------------------------------------------------------------
procedure TAppx5AssignsStage.Process;
begin
  ProcessAssigns;
  inherited Process;
end;

//------------------------------------------------------------------------------
// Собираем записи перемещений.
//------------------------------------------------------------------------------
procedure TAppx5AssignsStage.ProcessAssigns;
var
  Appx5Rec: TAppx5Rec;
  PositionId: integer;
  DummyWord: word;
begin
  with Appx5, QryMain, Appx5Rec do begin
    Appx5Rec := InitAppx5Rec;
    FillFromPersInfo(QryMain, Appx5Rec);

    START_DT := FieldByName('Dt_Beg').AsDateTime;

    // Заполняем отчётные месяц и год.
    DecodeDate(START_DT, PERIOD_Y, PERIOD_M, DummyWord);

    FillZoFromAssign(QryMain, Appx5Rec);
    PositionId := FieldByName('NewKdOK').AsInteger;

    if PositionId <> 0 then
      FillPosition(PositionId, Appx5Rec);

    PID := OrderToPid(FieldByName('NrPrPere').AsString,
      FieldByName('DtPrPere').AsDateTime);

    if (FieldByName('Dt_Priem').AsDateTime <>
        FieldByName('Dt_Beg').AsDateTime) then
      PIR := 1;

    WriteToAppx5Cds(Appx5Rec);
    Next;
  end; {with}
end; {ProcessAssigns}

//------------------------------------------------------------------------------
procedure TAppx5AssignsStage.OpenAssignsQry;
begin
  with Appx5, QryUtils do begin
    InitQuery(QryMain);

    with QryMain do begin
      SQL.Add(
        'select n.TabN, n.NewKdOK, n.KdKatP, n.Sovm, n.Is_Pere, ' +
          'n.Dt_Beg, n.Dt_Prikaza DtPrPere, n.Nr_Prikaza NrPrPere, ' +
          'pu.Dt_Priem, pu.Dt_Prikaza DtPrPriem, pu.Nr_Prikaza NrPrPriem, ' +
          'pu.Dt_Uvoln, pu.Dt_PrUvoln, pu.Nr_PrUvoln, pu.KdPidZv, ' +
          'u.Fam, u.Ima, u.Otch, u.ID, u.UkrCitiz ' +
        'from z_Pere n ' +
          'left join z_PrmUv pu on pu.TabN = n.TabN ' +
            'and pu.Dt_Priem <= n.Dt_Beg ' +
            'and (pu.Dt_Uvoln >= n.Dt_Beg or pu.Dt_Uvoln is null) ' +
          'left join z_Upi u on u.TabN = n.TabN ' +
        'where n.Dt_Beg between :PeriodBeg and :PeriodEnd ' +
          'and n.Is_Pere = "Y"');

      with SpovReport do begin
        if Length(EmplIds) > 0 then
          SQL.Add('and n.TabN in (' + EmplIds + ')');

        SQL.Add('order by n.TabN, pu.Dt_Priem, n.Dt_Beg');

        ParamByName('PeriodBeg').AsDateTime := ReportPeriod.Start;
        ParamByName('PeriodEnd').AsDateTime := ReportPeriod.Finish;
      end;

      Open;
    end;
  end;
end; {OpenAssignQry}

end.
