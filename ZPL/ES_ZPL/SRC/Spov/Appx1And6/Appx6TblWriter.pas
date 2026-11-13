unit Appx6TblWriter;

interface

uses
  Db, DateLib;

type
  Appx6Writer = class
  private
    class procedure AddOrUpdateRec(
      TblAppx6, Appx1Rec: TDataSet; EmplPeriod: TPeriod; Norma: SmallInt);
  public
    class procedure WriteEmployee(
      TblAppx6, Appx1Rec, CdsEmplmntDays: TDataSet);
  end;

implementation

uses
  SysUtils;

//------------------------------------------------------------------------------
class procedure Appx6Writer.WriteEmployee(
  TblAppx6, Appx1Rec, CdsEmplmntDays: TDataSet);
var
  Date: TDateTime;
  RepPeriod, PayPeriod, EmplPeriod: TPeriod;
begin
  with Appx1Rec, DateUtils do begin
    Date := EncodeDate(FieldByName('PERIOD_Y').AsInteger,
      FieldByName('PERIOD_M').AsInteger, 1);
    RepPeriod := InitPeriod(Date, EndOfMonth(Date));

    Date := EncodeDate(FieldByName('PAY_YEAR').AsInteger,
      FieldByName('PAY_MNTH').AsInteger, 1);
    PayPeriod := InitPeriod(Date, EndOfMonth(Date));
  end;

// 11.8.2026, Таб.№ 1359, Васютинская
// В июле были начисления за август, поэтому в Приложение 1 СПОВ'а за июль
// данные попали. В 6-е не попадали из-за условия:
// if PayPeriod.Start > RepPeriod.Start then
    // Если будущий месяц - выходим.
//    exit;
// Поэтому убираем условие.

  // Принимаем в расчёт только последнее приём/увольнение.
  with CdsEmplmntDays, DateUtils do begin
    EmplPeriod := CreateEmptyPeriod;

    First;

    while not Eof do begin
      Date := FieldByName('Dt_Priem').AsDateTime;

      if Date > PayPeriod.Finish then
        break;

      EmplPeriod := InitPeriod(Date,
        FieldByName('Dt_Uvoln').AsDateTime);

      Next;
    end;
  end;

  AddOrUpdateRec(
    TblAppx6, Appx1Rec, EmplPeriod, DateUtils.DaysCount(RepPeriod));
end;

//------------------------------------------------------------------------------
class procedure Appx6Writer.AddOrUpdateRec(
  TblAppx6,
  Appx1Rec: TDataSet;
  EmplPeriod: TPeriod;
  Norma: SmallInt);
const
  PID = 'ЗНТ024А1';
var
  StartDt, StopDt: TDate;
begin
  StartDt := DateUtils.Decode(EmplPeriod.Start);
  StopDt := DateUtils.Decode(EmplPeriod.Finish);
  
  with TblAppx6 do begin
    // Пришедшая запись перезаписывает предыдущую.
    // Т.е., для одного сотрудника - одна запись.
    if Locate('NUMIDENT', Appx1Rec.FieldByName('NUMIDENT').AsString, []) then
      Edit
    else
      Append;

    FieldByName('PERIOD_M').AsInteger :=
      Appx1Rec.FieldByName('PERIOD_M').AsInteger;
    FieldByName('PERIOD_Y').AsInteger :=
      Appx1Rec.FieldByName('PERIOD_Y').AsInteger;
    FieldByName('UKR_GROMAD').AsInteger :=
      Appx1Rec.FieldByName('UKR_GROMAD').AsInteger;
    FieldByName('NUMIDENT').AsString :=
      Appx1Rec.FieldByName('NUMIDENT').AsString;

    FieldByName('LN').AsString  := Appx1Rec.FieldByName('LN').AsString;
    FieldByName('NM').AsString  := Appx1Rec.FieldByName('NM').AsString;
    FieldByName('FTN').AsString := Appx1Rec.FieldByName('FTN').AsString;

    FieldByName('C_PID').AsString       := Pid;
    FieldByName('START_DT').AsInteger   := StartDt.Day;
    FieldByName('STOP_DT').AsInteger    := StopDt.Day;
    FieldByName('DAYS').AsInteger       := DateUtils.DaysCount(EmplPeriod);
    FieldByName('HH').AsInteger         := 0; // всегда пусто
    FieldByName('MM').AsInteger         := 0; // всегда пусто
    FieldByName('NORMA_1').AsInteger    := Norma;
    FieldByName('NUM_NAK').AsString     := ''; // всегда пусто
    FieldByName('DT_NAK').AsString      := ''; // всегда пусто
    FieldByName('SEAZON').AsInteger     := 0; // всегда пусто

    Post;
  end;
end;

end.
