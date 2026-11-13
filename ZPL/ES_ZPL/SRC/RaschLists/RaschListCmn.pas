unit RaschListCmn;

interface

uses
  Db, DbClient;

type
  TRaschListRow = record
    MnthYearStr,
    PayTypeId, PayTypeSh: ShortString;
    Hours,
    SmNachVid, SmUdrgVid: Double;
  end;

  TRaschListTotals = record
    MnthYear,
    AccSh,
    Dept: ShortString;
    Salary: Double;
    SmNachTt, SmUdrgTt: Double;
  end;

  TPrintRowProc = procedure(OrdNum: Integer; RLRow: TRaschListRow) of object;
  TPrintTotalsProc = procedure(SmNachTt, SmUdrgTt: Double) of object;

  TRaschListCmn = class
  private
    ListTotals: TRaschListTotals;
    CdsStornTypes: TClientDataSet;
    function InitRLRow: TRaschListRow;
  public
    constructor Create;
    destructor Destroy; override;

    procedure PopulateListTotals(EmplId: Integer; DtProc: TDateTime;
      Excel: Boolean);
    procedure ProcessRows(DsNu: TDataSet; PrintRow: TPrintRowProc;
      PrintTotals: TPrintTotalsProc);

    property RaschListTotals: TRaschListTotals read ListTotals;
  end;

implementation

uses
  DateLib, Math, SysUtils, a_Dm, a_Lib, z_Dm;

//------------------------------------------------------------------------------
constructor TRaschListCmn.Create;
begin
  inherited Create;

  CdsStornTypes := TClientDataSet.Create(nil);

  with CdsStornTypes, FieldDefs do begin
    Add('VidN', ftString, 4);
    Add('Dt_Beg', ftDateTime);
    Add('Dt_End', ftDateTime);

    CreateDataSet;
  end;
end;

//------------------------------------------------------------------------------
destructor TRaschListCmn.Destroy;
begin
  CdsStornTypes.Free;
  inherited Destroy;
end;

//------------------------------------------------------------------------------
procedure TRaschListCmn.PopulateListTotals(
  EmplId: Integer;
  DtProc: TDateTime;
  Excel: Boolean);
var
  DeptId, AccId, DummyInt: Integer;
  DeptSh: ShortString;
  DeptName: String;
  DummyDbl: Double;
  DummyStr: String;
  DummyStr1: String[1];
  DummyDate: TDateTime;
  DummyBool: Boolean;
  DummySmallInt: SmallInt;
  Salary: Double;
  Date: TDate;
begin
  // Актуальное перемещение на конец месяца
  with ListTotals do begin
    Date := DateUtils.Decode(DtProc);
    AccSh := '';
    MnthYear := UkrMes(Date.Mnth) + ' ' + IntToStr(Date.Year);
    MnthYear := AnsiUpperCase(MnthYear[1]) +
      Copy(MnthYear, 2, Length(MnthYear));

    with DmMain do begin
      GetPereInf(EmplId, DateUtils.EndOfMonth(DtProc),
        DeptId, DummyInt, DummyInt, DummyInt, DummyInt, AccId, DummyInt, DummyInt,
        Salary, DummyDbl, DummyDbl, DummyStr1, DummyStr, DummyStr,
        DummyDate, DummyBool, DummyBool, DummyBool, DummySmallInt);

      if Excel then begin
        DeptSh := KdObj2ShObj(DeptId, DeptName);
        Dept := Copy(DeptName, 1, 32);
        Dept := IntToStr(DeptId) + ' ' +  Dept;
      end else begin
        AccSh := Form_Dm.KdSbu2SchBU(AccId);
        Dept := IntToStr(DeptId);
      end;
    end;

    SmNachTt := 0;
    SmUdrgTt := 0;
  end;
end;

//------------------------------------------------------------------------------
procedure TRaschListCmn.ProcessRows(
  DsNu: TDataSet;
  PrintRow: TPrintRowProc;
  PrintTotals: TPrintTotalsProc);
var
  SmPrt: Double;
  OrdNum, SavedNr: Integer;
  RLRow: TRaschListRow;
  MnthYear: TDateTime;
  PayTypeIsNonPay: Boolean;
begin
  OrdNum := 0;

  CdsStornTypes.Open;

  with DsNu do begin
    DisableControls;

    SavedNr := FieldByName('NR').AsInteger;
    First;

    while not Eof do begin
      if FieldByName('VidN').AsString < '8600' then begin
        // Персональные виды (до видов предприятия)
        
        RLRow := InitRLRow;

        with RLRow do begin
          MnthYear := FieldByName('ZaMesGod').AsDateTime;

          PayTypeId := FieldByName('VidN').AsString;
          PayTypeSh := FieldByName('ShVidN').AsString;

          PayTypeIsNonPay := false;
          SmNachVid := 0;
          SmUdrgVid := 0;
          SmPrt := 0;
          Hours := 0;

          if PayTypeId < '6000' then begin
            // Начисления
            
            while (FieldByName('VidN').AsString = PayTypeId) and
                (FieldByName('ZaMesGod').AsDateTime = MnthYear) and
                not Eof do begin

              SmPrt := SmPrt + FieldByName('Summa').AsFloat;
              Hours := Hours  + FieldByName('Chas').AsFloat;

      {
              if (cPrtVid = '5002') or (cPrtVid = '5005') or (cPrtVid = '5008') then
                Hash500x(cPrtVid,
                  TDateUtils.InitPeriod(
                    FieldByName('Dt_Beg').AsDateTime,
                    FieldByName('Dt_End').AsDateTime),
                  FieldByName('Storn').AsString = 'Y');
      }

              Next;
            end;

            PayTypeIsNonPay := (PayTypeId >= '5000') and (PayTypeId < '6000');

            if SmPrt >= 0 then
              SmNachVid := RoundTo(SmNachVid + SmPrt, -2)
            else
              SmUdrgVid := RoundTo(SmUdrgVid - SmPrt, -2);

          end else if PayTypeId < '7500' then begin
            // Удержания
            while (FieldByName('VidN').AsString = PayTypeId) and
                (FieldByName('ZaMesGod').AsDateTime = MnthYear) and
                not Eof do begin
              SmPrt := SmPrt + FieldByName('Summa').AsFloat;
              Next;
            end;

            if SmPrt >= 0 then
              SmNachVid := RoundTo(SmNachVid + SmPrt, -2)
            else
              SmUdrgVid := RoundTo(SmUdrgVid - SmPrt, -2);

          end else begin
            // Выплаты расписывать каждую в своей строке
            if FieldByName('Summa').AsFloat >= 0 then
              SmNachVid := SmNachVid + FieldByName('Summa').AsFloat
            else
              SmUdrgVid := SmUdrgVid - FieldByName('Summa').AsFloat;

            Next;
          end;

          if (Hours <> 0) or (SmNachVid <> 0) or (SmUdrgVid <> 0)
            // Эти виды идут и без часов и без сумм:
            or (PayTypeId >= '5009') and (PayTypeId <= '5012')
          then begin
            Inc(OrdNum);

            with ListTotals do begin
              SmNachTt := SmNachTt + SmNachVid;
              SmUdrgTt := SmUdrgTt + SmUdrgVid;
            end;

            MnthYearStr := DateToStr(MnthYear);
            MnthYearStr := Copy(MnthYearStr, 4, 3) + Copy(MnthYearStr, 9, 2);

            PrintRow(OrdNum, RLRow);
          end;
        end;
      end else
        Next;
    end;

    Locate('NR', SavedNr, []);
    EnableControls;

    with ListTotals do
      PrintTotals(SmNachTt, SmUdrgTt);
  end;

  CdsStornTypes.EmptyDataSet;
end;

//------------------------------------------------------------------------------
function TRaschListCmn.InitRLRow: TRaschListRow;
begin
  with Result do begin
    MnthYearStr := '';
    PayTypeId := '';
    PayTypeSh := '';
    Hours := 0;
    SmNachVid := 0;
    SmUdrgVid := 0;
  end;
end;

end.
