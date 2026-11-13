unit MonthEmplList;

interface

uses
  AppCmn, DbTables;

type
  MnthEmplList = class
  private
    class procedure PrepareQryInsEmpl;

    class function EmplListExists: Boolean;
    class procedure SelectSuspEmpl;

    class procedure WriteEmplList;
    class procedure AddListRecord(EmplId, EmplListId, EmplCateg: integer);

    class procedure InitCmn(ProcMnth: TDateTime);
    class procedure ReleaseCmn;
  public
    class procedure Delete(ProcMnth: TDateTime);
    class procedure Create(ProcMnth: TDateTime; EmployeeIds: String;
      ShowProgressProc: TProgressProc);
  end;

implementation

uses
  a_Lib, DateLib, QryLib, SysUtils;

var
  ProcMnthBeg: TDateTime;
  EmplIds: String;
  ShowProgress: TProgressProc;

  QryEmplList,
  QryInsertEmpl,
  QryCmn: TQuery;

  //------------------------------------------------------------------------------
// ”далить список текущего мес€ца
//------------------------------------------------------------------------------
class procedure MnthEmplList.Delete(ProcMnth: TDateTime);
begin
  InitCmn(ProcMnth);
  QryCmn := TQuery.Create(nil);

  with QryCmn, QryUtils do begin
    // ”дал€ем триггер
    InitQuery(QryCmn);

    SQL.Add('DROP TRIGGER ZSPS_BD');
    ExecSQL;
    ReleaseQuery(QryCmn);

    // —оздаЄм изменЄнный
    InitQuery(QryCmn);
    SQL.Add(
      'create trigger ZSPS_BD for z_Sps before delete position 0 ' +
      'as ' +
      'begin ' +
        // ”даление отклонений
        'delete from z_Otkl where z_Otkl.TabN = Old.TabN ' +
          'and z_Otkl.DtProc = Old.DtProc; ' +
        // ”даление начислений/удержаний
        'delete from z_Nu where z_Nu.TabN = Old.TabN ' +
          'and z_Nu.DtProc = Old.DtProc; ' +
      'end');
    ExecSQL;
    ReleaseQuery(QryCmn);

    // ”дал€ем список текущего мес€ца
    InitQuery(QryCmn);
    SQL.Add('delete from z_Sps where DtProc = :DtProc');
    ParamByName('DtProc').AsDateTime := ProcMnthBeg;
    ExecSQL;

    ReleaseQuery(QryCmn);
  end;

  ReleaseCmn;
end;

//------------------------------------------------------------------------------
class procedure MnthEmplList.Create(
  ProcMnth: TDateTime;
  EmployeeIds: String;
  ShowProgressProc: TProgressProc);
begin
  InitCmn(ProcMnth);
  EmplIds := EmployeeIds;
  ShowProgress := ShowProgressProc;

  QryEmplList := TQuery.Create(nil);
  QryInsertEmpl := TQuery.Create(nil);
  PrepareQryInsEmpl;

  if not EmplListExists then begin
    SelectSuspEmpl;
    WriteEmplList;
  end;

  ReleaseCmn;
  QryEmplList.Free;
  QryInsertEmpl.Free;
end;

//------------------------------------------------------------------------------
class procedure MnthEmplList.InitCmn(ProcMnth: TDateTime);
begin
  ProcMnthBeg := DateUtils.BeginOfMonth(ProcMnth);
  QryCmn := TQuery.Create(nil);
end;

//------------------------------------------------------------------------------
class procedure MnthEmplList.ReleaseCmn;
begin
  QryCmn.Free;
end;

//------------------------------------------------------------------------------
class function MnthEmplList.EmplListExists: Boolean;
begin
  QryUtils.InitQuery(QryCmn);

  with QryCmn do begin
    SQL.Add(
      'select count(*) as Cnt ' +
      'from z_Sps ' +
      'where DtProc = :DtProc');
    ParamByName('DtProc').AsDateTime := ProcMnthBeg;
    Open;
    Result := FieldByName('CNT').AsInteger > 0;
    Close;
  end;

  QryUtils.ReleaseQuery(QryCmn);
end;

//------------------------------------------------------------------------------
class procedure MnthEmplList.PrepareQryInsEmpl;
begin
  QryUtils.InitQuery(QryInsertEmpl);

  with QryInsertEmpl do begin
    SQL.Add(
      // OldKdObj с 01-12-07 используетс€ дл€ отметки ќ—Ќќ¬Ќќ… записи в Z_SPS
      // ќсновна€ запись - это та, в которой OldKdObj = KdObj
      'insert into Z_Sps ' +
        '(DtProc, TabN, KdObj, KdSps, OldKdObj, KdKatP) ' +
      'values ' +
        '(:DtProc, :TabN, :KdObj, :KdSps, :OldKdObj, :KdKatP)');
    Prepare;
  end;
end;

//------------------------------------------------------------------------------
class procedure MnthEmplList.SelectSuspEmpl;
begin
  QryUtils.InitQuery(QryEmplList);

  with QryEmplList do begin
    SQL.Add(
      'select distinct n.TabN, u.Fam, u.Ima, u.Otch, ' +
        'p.KdSps, p.KdObj, p.KdKatP ' +
      'from z_Nadb n ' +
        'left join z_Upi u on u.TabN = n.TabN ' +
        // ѕеремещени€ на конец мес€ца обработки
        'left join z_Pere p on p.TabN = n.TabN ' +
          'and p.Dt_Beg = (' +
            'select Max(Dt_Beg) ' +
            'from z_Pere ' +
            'where TabN = p.TabN and Dt_Beg <= :MnthEnd)' +
      // ¬се, кто был или есть приостановлен на конец мес€ца обработки
      'where n.VidN in ("5009", "5010") ' +
        'and n.Dt_Beg < :MnthEnd');

    if EmplIds <> '' then
      SQL.Add(
        'and n.TabN in (' + EmplIds + ')');

    ParamByName('MnthEnd').AsDateTime := DateUtils.EndOfMonth(ProcMnthBeg);
    Open;
  end;
end;

//------------------------------------------------------------------------------
class procedure MnthEmplList.WriteEmplList;
var
  Date: TDate;
  EmplCnt: Integer;
  Msg: ShortString;
begin
  EmplCnt := 0;
  Date := DateUtils.Decode(ProcMnthBeg);

  with QryEmplList do begin
    First;

    while not Eof do begin
      AddListRecord(FieldByName('TabN').AsInteger,
        FieldByName('KdSps').AsInteger, FieldByName('KdKatP').AsInteger);

      Inc(EmplCnt);

      with Date do
      Msg := '¬ список подключено ' + IntToStr(EmplCnt) + ' сотрудников.';

      ShowProgress(1, Msg, Bof);
      Next;
    end;
  end;
end;

//------------------------------------------------------------------------------
class procedure MnthEmplList.AddListRecord(EmplId, EmplListId, EmplCateg: Integer);
begin
  with QryInsertEmpl do begin
    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := ProcMnthBeg;
    ParamByName('KdSps').AsInteger := EmplListId;
    ParamByName('KdObj').AsInteger := 1900;
    ParamByName('OldKdObj').AsInteger := 1900;
    ParamByName('KdKatP').AsInteger := EmplCateg;
    ExecSQL;
  end;
end;

end.
