unit Appx5DismissStage;

interface

uses
  DbTables, Appx5Stage, Appx5ChildStage;

type
  TAppx5DismissStage = class(TAppx5ChildStage)
  private
    QryCmn: TQuery;

    procedure OpenHireQry;
    procedure ProcessDismiss;
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
procedure TAppx5DismissStage.InitData;
begin
  _StageName :='Обработка увольнений.';

  OpenHireQry;
  QryCmn := TQuery.Create(nil);
end;

//------------------------------------------------------------------------------
procedure TAppx5DismissStage.FreeData;
begin
  inherited FreeData;
  QryCmn.Free;
end;

//------------------------------------------------------------------------------
procedure TAppx5DismissStage.Process;
begin
  ProcessDismiss;
  inherited Process;
end;

//------------------------------------------------------------------------------
// Обрабатываем уволенных в отчётном периоде.
//------------------------------------------------------------------------------
procedure TAppx5DismissStage.ProcessDismiss;
var
  Appx5Rec: TAppx5Rec;
  PositionId: integer;
  DummyWord: word;
begin
  with Appx5, QryMain, Appx5Rec do begin
    Appx5Rec := InitAppx5Rec;
    PositionId := 0;

    // Заполняем NUMIDENT, FamImOtch.
    FillFromPersInfo(QryMain, Appx5Rec);
    END_DT := FieldByName('Dt_Uvoln').AsDateTime;

    // Заполняем отчётные месяц и год.
    DecodeDate(END_DT, PERIOD_Y, PERIOD_M, DummyWord);

    // Заполняет ZO и должность.
    if QryUtils.PeekAssign(QryCmn, EmplId, END_DT, true, true) then begin
      FillZoFromAssign(QryCmn, Appx5Rec);
      PositionId := QryCmn.FieldByName('NewKdOK').AsInteger;
    end;
    QryCmn.Close;

    if PositionId <> 0 then
      FillPosition(PositionId, Appx5Rec);

    PID := OrderToPid(
      FieldByName('Nr_PrUvoln').AsString,
      FieldByName('Dt_PrUvoln').AsDateTime);

    // Основание увольнения.
    FillDismisReason(QryCmn, FieldByName('KdPidZv').AsInteger, Appx5Rec);

    WriteToAppx5Cds(Appx5Rec);
    Next;
  end; {with}
end; {ProcessDismiss}

//------------------------------------------------------------------------------
// Выбираем уволенных в отчётном периоде.
//------------------------------------------------------------------------------
procedure TAppx5DismissStage.OpenHireQry;
begin
  with Appx5, QryUtils do begin
    InitQuery(QryMain);

    with QryMain do begin
      SQL.Add(
        'select * ' +
        'from z_PrmUv p ' +
          'left join z_Upi u on u.TabN = p.TabN ' +
        'where Dt_Uvoln between :PeriodBeg and :PeriodEnd'
        {
        + ' '
          // Выбираем только уволенных в данном периоде,
          'and not exists ( ' +
            // если у них не было перемещений. Если перемещения были,
            // нужная запись в Табл.5 будет сформирована в результате
            // обработки перемещений.
            'select "x" ' +
            'from z_Pere ' +
            'where TabN = p.TabN ' +
              'and Dt_Beg between :PeriodBeg and :PeriodEnd ' +
              // При этом учитываются только перемещения отмеченные 'Y'
              // в поле Is_Pere
              // т.к., только они создают записи в Табл.5.
              'and Is_Pere = "Y")'
        }
      );

      with SpovReport do begin
        if Length(EmplIds) > 0 then
          SQL.Add('and p.TabN in (' + EmplIds + ') ');

        SQL.Add('order by p.TabN, p.Dt_Priem');

        ParamByName('PeriodBeg').AsDateTime := ReportPeriod.Start;
        ParamByName('PeriodEnd').AsDateTime := ReportPeriod.Finish;
      end;

      Open;
    end;
  end;
end; {OpenDismissQry}

end.
