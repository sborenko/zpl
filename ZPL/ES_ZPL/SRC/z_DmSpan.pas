unit z_DmSpan;

interface

uses
  SysUtils, Classes, DB, DBTables, DateUtils;

const MaxDayIndex = 30;

type
  TPereInf = record
      nKdSps     : integer;   // список
      dDtBeg     : TDateTime; // актуальная дата перемещения
      nKdObj     : integer;   // подразделение
      nKdKatP    : integer;   // категория персонала
      nSO        : integer;   // система оплаты
      nPrcWrkTime: double;    // процент рабочего времени
      nOklTrf    : double;    // оклад
      nAvans     : double;    // аванс
      cSpAv      : string;    // способ аванса (сумма или процент)
      nKdSpZ     : integer;   // счёт бухг.учёта
      cDolgnost  : string;    // должность
      nPdNlg     : integer;   // схема подоходного налога
      bSovm      : boolean;   // совместительство
      bPens      : boolean;   // пенсионер
      bPrfs      : boolean;   // профсоюз
      nInv       : integer;   // инвалидность
      bCmbOkl    : boolean;   // комбинированный оклад
  end;

  TDay = record
    Date: TDateTime;
    Hours: double;
    Salary: double;
  end;

  TMonth = array [0..MaxDayIndex] of TDay;

  TDMSpan = class(TDataModule)
    QryPere: TQuery;
    QrySpecDays: TQuery;
    QryHelper: TQuery;
  private
    { Private declarations }
    a_Days: TMonth;
    n_HoursTotal: double;

    procedure SplitMonth(nTabN: integer; dMonthBeg: TDateTime);
    function CalcMonthSalary: double;
  public
    { Public declarations }
    function GetOklTrf(nTabN: integer; dDtMes: TDateTime): double;

    procedure GetPereInfR(nTabN: integer; dRMes: TDateTime; var rPereInf: TPereInf);
  end;

var
  DMSpan: TDMSpan;

implementation

{$R *.dfm}

uses A_Const, A_Lib, Z_DM;

//- SB -------------------------------------------------------------------------
function TDMSpan.GetOklTrf(nTabN: integer; dDtMes: TDateTime): double;
begin
  if dDtMes = 0 then
    Result := 0
  else begin
    n_HoursTotal := 0;
    SplitMonth(nTabN, dDtMes);
    Result := CalcMonthSalary;
  end;
end;

//- SB -------------------------------------------------------------------------
procedure TDMSpan.SplitMonth(nTabN: integer; dMonthBeg: TDateTime);
var
  dMonthEnd: TDateTime;
  nDaysInMonth: integer;
  nYear, nMonth, nDay: Word;
  nIndex, nReverseIndex: Word;
  nDayOfWeek: integer;
  dDay: TDateTime;
begin
  dMonthEnd := myLastDOM(dMonthBeg);

  QryPere.DataBaseName := CESMAIN;
  QryPere.ParamByName('tabN').AsInteger := nTabN;
  QryPere.ParamByName('monthEnd').AsDateTime := dMonthEnd;
  QryPere.Open;

  QrySpecDays.DataBaseName := CESMAIN;
  QrySpecDays.ParamByName('monthBeg').AsDateTime := dMonthBeg;
  QrySpecDays.ParamByName('monthEnd').AsDateTime := dMonthEnd;
  QrySpecDays.Open;

  DecodeDate(dMonthBeg, nYear, nMonth, nDay);
  nDaysInMonth := DaysBetween(dMonthEnd, dMonthBeg) + 1;

  for nIndex := 0 to MaxDayIndex do begin
    nReverseIndex := MaxDayIndex - nIndex;
    nDay := nReverseIndex + 1;
    if nDay > nDaysInMonth then begin
      a_Days[nReverseIndex].Date := 0;
      a_Days[nReverseIndex].Hours := 0;
      a_Days[nReverseIndex].Salary := 0;
    end else begin
      dDay := EncodeDate(nYear, nMonth, nDay);
      a_Days[nReverseIndex].Date := dDay;

      nDayOfWeek := DayOfWeek(dDay);
      if (nDayOfWeek = 1) or (nDayOfWeek = 7) then
        a_Days[nReverseIndex].Hours := 0
      else
        a_Days[nReverseIndex].Hours := 8;

      if not QrySpecDays.EoF and (QrySpecDays.FieldByName('E_DAY').AsDateTime = dDay) then begin
        a_Days[nReverseIndex].Hours := QrySpecDays.FieldByName('RAB_CHAS').AsFloat;
        QrySpecDays.Next;
      end;

      n_HoursTotal := n_HoursTotal + a_Days[nReverseIndex].Hours;

      while not QryPere.Eof and (QryPere.FieldByName('DT_BEG').AsDateTime > dDay) do
        QryPere.Next;

      if not QryPere.Eof and (a_Days[nReverseIndex].Hours <> 0) then
        a_Days[nReverseIndex].Salary := QryPere.FieldByName('OKLTRF').AsFloat
      else
        a_Days[nReverseIndex].Salary := 0
    end;
  end;

  QrySpecDays.Close;
  QryPere.Close;
end;

//- SB -------------------------------------------------------------------------
function TDMSpan.CalcMonthSalary: double;
var
  nHours, nSalary: double;
  nIndex: integer;

begin
  Result := 0;

  nSalary := 0;
  nHours := 0;
  for nIndex := 0 to MaxDayIndex do begin
    if a_Days[nIndex].Hours <> 0 then begin
      if a_Days[nIndex].Salary <> nSalary then begin
        Result := Result + nSalary * nHours / n_HoursTotal;
        nSalary := a_Days[nIndex].Salary;
        nHours := 0;
      end;
      nHours := nHours + a_Days[nIndex].Hours;
    end;
  end;

  Result := MyRound(Result + nSalary * nHours / n_HoursTotal, 2);
end;

//- SB -------------------------------------------------------------------------
procedure TDMSpan.GetPereInfR(nTabN: integer; dRMes: TDateTime; var rPereInf: TPereInf);
begin
  InitQuery(QryHelper);
  
  with QryHelper do begin
    SQL.Add(
      'select * ' +
      'from z_pere p ' +
      'where TabN = :TabN ' +
        'and Dt_Beg = (' +
          'select max(Dt_Beg) ' +
          'from z_pere ' +
          'where TabN = p.TabN ' +
            'and Dt_Beg <= :Dt_Beg) ' +
        'order by Nr desc'
    );
    ParamByName('TabN').AsInteger := nTabN;
    ParamByName('Dt_Beg').AsDateTime := dRMes;
    Open;
    if RecordCount > 0 then 
      with rPereInf do begin
        nKdSps      := FieldByName('KdSps').AsInteger;
        dDtBeg      := FieldByName('Dt_Beg').AsDateTime;
        nKdObj      := FieldByName('KdObj').AsInteger;
        nKdKatP     := FieldByName('KdKatP').AsInteger;
        nSO         := FieldByName('SO').AsInteger;
        nPrcWrkTime := FieldByName('PrcWrkTime').AsFloat;
        nOklTrf     := FieldByName('OklTrf').AsFloat;
        nAvans      := FieldByName('Avans').AsFloat;
        cSpAv       := FieldByName('Sp_Av').AsString;
        nKdSpZ      := FieldByName('KdSPZ').AsInteger;
        cDolgnost   := FieldByName('Dolgnost').AsString;
        nPdNlg      := FieldByName('PdNlg').AsInteger;
        bSovm       := FieldValues['Sovm'] = 1;
        bPens       := FieldValues['Pr_Pens'] = 1;
        bPrfs       := FieldValues['Prfs'] = 1;
        nInv        := FieldByName('Inv').AsInteger;
        bCmbOkl     := FieldByName('CmbOkl').AsString = '1';

        if nPrcWrkTime = 0 then
          nPrcWrkTime := 100;
      end; {with rPereInf}
  end; {with QryHelper}

  ReleaseQuery(QryHelper);
end; {GetPereInfR}

end.

