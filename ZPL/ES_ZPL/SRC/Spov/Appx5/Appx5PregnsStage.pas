unit Appx5PregnsStage;

interface

uses
  DbTables, Appx5Stage, Appx5ChildStage;

type
  TAppx5PregnsStage = class(TAppx5ChildStage)
  private
    procedure OpenPregnsQry;
    procedure ProcessPregns;
    function SplitPregnRec(
      PregnsRec: TQuery; var Appx5Rec: TAppx5Rec): TAppx5Rec;

  protected
    procedure InitData; override;
    procedure FreeData; override;
  public
    procedure Process; override;
  end;

implementation

uses
  SysUtils, ReportSpov, DateLib, QryLib;

//------------------------------------------------------------------------------
procedure TAppx5PregnsStage.InitData;
begin
  _StageName :='Обработка декретных.';

  OpenPregnsQry;
end;

//------------------------------------------------------------------------------
procedure TAppx5PregnsStage.FreeData;
begin
  inherited FreeData;
end;

//------------------------------------------------------------------------------
procedure TAppx5PregnsStage.Process;
begin
  ProcessPregns;
  inherited Process;
end;

//------------------------------------------------------------------------------
// Обработка декретных.
//------------------------------------------------------------------------------
procedure TAppx5PregnsStage.ProcessPregns;
var
  Appx5Rec, ExtraRec: TAppx5Rec;
  DummyWord: word;
  Date: TDateTime;
  SeparateRecs: boolean;
begin
  with Appx5, QryMain, Appx5Rec do begin
    Appx5Rec := InitAppx5Rec;
    FillFromPersInfo(QryMain, Appx5Rec);

    ZO := T5_ZO_PREGNANCY;

    // Начало декрета.
    Date := FieldByName('DtBeg').AsDateTime;
    if DateUtils.EventIsInPeriod(Date, ReportPeriod) then begin
      START_DT := Date;
      // Заполняем отчётные месяц и год.
      DecodeDate(START_DT, PERIOD_Y, PERIOD_M, DummyWord);
    end;

    // Основание.
    if Length(Trim(FieldByName('Notes').AsString)) > 0 then
      PID := FieldByName('Notes').AsString
    else
      PID := OrderToPid(
        FieldByName('NrList').AsString, FieldByName('DtList').AsDateTime);

    // Окончание декрета.
    ExtraRec := SplitPregnRec(QryMain, Appx5Rec);
    SeparateRecs := not Appx5RecIsInited(ExtraRec);

    WriteToAppx5Cds(Appx5Rec);

    if SeparateRecs then
      WriteToAppx5Cds(ExtraRec);

    Next;
  end; {with}
end; {ProcessPregns}

//------------------------------------------------------------------------------
procedure TAppx5PregnsStage.OpenPregnsQry;
begin
  with Appx5, QryUtils do begin
    InitQuery(QryMain);

    with QryMain do begin
      SQL.Add(
        'select ' +
          'n.TabN, n.VidN, n.DtBeg, n.DtEnd, n.Notes, n.NrList, n.DtList, ' +
          'u.Fam, u.Ima, u.Otch, u.ID, u.UkrCitiz ' +
        'from ' +
          'z_VBln n ' +
          'left join z_Upi u on u.TabN = n.TabN ' +
        'where ' +
          // декретные
          'n.VidN = "2602" and ' +
          // в текущем периоде произошло изменение состояния надбавки
          '(' +
            'n.DtBeg between :PeriodBeg and :PeriodEnd ' +
            'or n.DtEnd between :PeriodBeg and :PeriodEnd)'
      );

      with SpovReport do begin
        if Length(EmplIds) > 0 then
          SQL.Add('and n.TabN in (' + EmplIds + ') ');

        SQL.Add('order by n.TabN, n.DtBeg');

        ParamByName('PeriodBeg').AsDateTime := ReportPeriod.Start;
        ParamByName('PeriodEnd').AsDateTime := ReportPeriod.Finish;
      end;

      Open;
    end; {with}
  end;
end; {OpenPregnsQry}

//------------------------------------------------------------------------------
function TAppx5PregnsStage.SplitPregnRec(
  PregnsRec: TQuery;
  var Appx5Rec: TAppx5Rec): TAppx5Rec;
var
  ExtraRec: ^TAppx5Rec;
  Date: TDateTime;
  DummyWord: word;
begin
  with Appx5, PregnsRec, DateUtils do begin
    Result := InitAppx5Rec;
    // Направляем запись об окончании декрета в основную запись.
    ExtraRec := @Appx5Rec;

    Date := FieldByName('DtEnd').AsDateTime;

    if EventIsInPeriod(Date, ReportPeriod) then begin
      with Appx5Rec do
        if (START_DT <> 0)
            and ((MonthOfQuarter(Date) <> MonthOfQuarter(START_DT))
              or (DateYear(Date) <> DateYear(START_DT))) then begin
          Result := Appx5Rec;
          Result.START_DT := 0;
          ExtraRec := @Result;
        end;

      with ExtraRec^ do begin
        END_DT := Date;
        DecodeDate(END_DT, PERIOD_Y, PERIOD_M, DummyWord);
      end;
    end;
  end;
end;

end.
