unit z_CreSps;

(*   Идея этого дела:

1. В qrySps выбираю
       Select p.TABN, u.Fam, u.Ima, u.Otch, p.Dt_Priem, p.dt_Uvoln,
              pp.KdSps, pp.KdObj, pp.KdKatP from Z_PrmUv p
          Left Outer Join z_Upi u on (u.TabN = p.TabN)
          Left Outer Join Z_GetWrkPereOnDate (u.TabN, :dDtEndMes) pp on 1=1
       where (p.Dt_Priem <= :dDtEndMes) and
                ((p.Dt_Uvoln is Null) or (p.Dt_Uvoln >= :d_DtBegPredMes))
       order by u.TabN, p.Dt_Priem
   всех подходящих для включения в список сотрудников (принятых ранее последнего
   числа рабочего месяца и либо не уволенных вообще, либо уволенных после
   первого числа ПРОШЛОГО месяца:
       Select cast(null as SmallInt) as KdObj, Cast(null as SmallInt) as KdKatP,
              p.NR as pu_nr, p.TABN, p.KdSps, u.Fam, u.Ima, u.Otch, u.Pol, u.ID,
                      u.DOB, p.Dt_Priem, p.dt_Uvoln
         from Z_PrmUv p
              Left Outer Join z_Upi u on (u.TabN = p.TabN)
         where (dt_Priem <= :dDtEndMes) and
                ((Dt_Uvoln is Null) or (Dt_Uvoln >= :dDtBegMes))
                                                  // ПРОШЛОГО месяца
           order by TabN, KdSps, Dt_Priem
     2. Находим, в каком подразделении, с каким КдКатП он числится по Z_PERE на
        последнее число месяца:
!!!!!!!!!!!!!!
Внедрить процедуру
CREATE PROCEDURE Z_GETWRKPEREONDATE (
  NTABN INTEGER,
  DONDATE TIMESTAMP
) RETURNS (
  NR INTEGER,
  KDSPS SMALLINT,
  TABN INTEGER,
  DT_BEG TIMESTAMP,
  KDOBJ SMALLINT,
  KDKATP SMALLINT,
  PRCWRKTIME DOUBLE PRECISION,
  SO SMALLINT,
  OKLTRF DOUBLE PRECISION,
  AVANS DOUBLE PRECISION,
  SP_AV VARCHAR(1),
  KDDOLGN SMALLINT,
  DOLGNOST VARCHAR(40),
  KDSPZ SMALLINT,
  PR_PENS SMALLINT,
  SOVM SMALLINT,
  PDNLG SMALLINT,
  PROCLG DOUBLE PRECISION,
  KOLMIN SMALLINT,
  PRFS SMALLINT,
  NR_PRIKAZA VARCHAR(10),
  DT_PRIKAZA TIMESTAMP,
  NOTES VARCHAR(35),
  INV SMALLINT,
  RANG SMALLINT,
  RAZR SMALLINT,
  DT_END TIMESTAMP,
  OLDKDOBJ SMALLINT,
  PRDEKR CHAR(1),
  CMBOKL CHAR(1),
  SPEC_NR INTEGER
) AS begin
for Select First 1 NR, KDSPS, TABN, DT_BEG, KDOBJ, KDKATP, PRCWRKTIME, SO, OKLTRF,
         AVANS, SP_AV, KDDOLGN, DOLGNOST, KDSPZ, PR_PENS, SOVM, PDNLG,
         PROCLG, KOLMIN, PRFS, NR_PRIKAZA, DT_PRIKAZA, NOTES, INV, RANG,
         RAZR, DT_END, OLDKDOBJ, PRDEKR, CMBOKL, SPEC_NR
    from Z_Pere
    where (TabN = :nTabN) and (Dt_Beg <= :dOnDate)
          order by Dt_Beg Desc, NR desc
    into :NR, :KDSPS, :TABN, :DT_BEG, :KDOBJ, :KDKATP, :PRCWRKTIME, :SO, :OKLTRF,
         :AVANS, :SP_AV, :KDDOLGN, :DOLGNOST, :KDSPZ, :PR_PENS, :SOVM, :PDNLG, :PROCLG,
         :KOLMIN, :PRFS, :NR_PRIKAZA, :DT_PRIKAZA, :NOTES, :INV, :RANG, :RAZR, :DT_END,
         :OLDKDOBJ, :PRDEKR, :CMBOKL, :SPEC_NR
do
  suspend;
end
и использовать ее !!!!!!!!!!!!!
!!!!!!!!!!!!!!

         Select p1.* from z_Pere p1
           where (p1.TabN = 1) and (p1.Dt_Beg =
                   (Select Max(p2.dt_Beg) from Z_PERE p2
                     where (p2.TabN = p1.TabN) and
                            (p2.KdSps = :nKdSps) and (p2.dt_Beg <= :dDtEndMes)))
         и в список подключаем именно с данными из этой записи (если записей
           окажется больше одной, то из последней по полю NR в z_pere)
     3. Структура Z_SPS:
     NR INTEGER,
     KDSPS SMALLINT,    ***
     NCH CHAR(1),
     DTPROC TIMESTAMP,  ***
     TABN INTEGER,      ***
     KDOBJ SMALLINT,    ***
     KDKATP SMALLINT,   ***   -  эти поля надо заполнить в Z_SPS
     NOTES VARCHAR(35),
     OLDKDOBJ SMALLINT  XXX c 01-12-2007 если OldKdObj = KdObj - основная запись
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, Grids, DBGrids, DB, DBTables,
  DBClient, ExtCtrls;

type
  String3 = string[3];
  String4 = string[4];
  TFrmCreMnthList = class(TForm)
    qrySps: TQuery;
    dsrcSps: TDataSource;
    dbgrSps: TDBGrid;
    qryIns: TQuery;
    qryOldNU: TQuery;
    qryPere: TQuery;
    qryTmp: TQuery;
    qrySpsAdd: TQuery;
    qryCheck: TQuery;
    PanelButtons: TPanel;
    sBtnCreSps: TSpeedButton;
    bBtnCancel: TBitBtn;
    procedure sBtnCreSpsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    d_DtBegMes, d_DtEndMes, d_DtBegPredMes : TDateTime;
    b_SpsCreated : boolean;
    b_Repair: boolean;
    procedure OpenQrySps(dDtBegMes, dDtEndMes : TDateTime);
    procedure CreNewSps(dDtBegMes, dDtEndMes : TDateTime);
    procedure AppSpsRecord(dDtP : TDateTime;
                           nKdSps, nTabN, nKdObj, nOldKdObj, nKdKatP : integer);
    procedure AddDolgniki(d_DtBegMes : TDateTime);
    function IsInSps(dDtPrc : TDateTime; nTabN : integer) : boolean;
    procedure AddInOtkl(dDtPrc : TDateTime; cVidN : string4;
                               nKdSps, nTabN, nKdObj, nKdKatP, nKdSpZ : integer;
                               nSumma : double);
  public
    class function CreSpsMes(nY, nM : word) : boolean;
    class procedure RepairSpsMes(nY, nM : word);
    class function RunSps(nY, nM : word) : boolean;
  end;

const SECTION = 'z_CreSps';

var
  FrmCreMnthList: TFrmCreMnthList;

implementation

uses a_Const, z_Main, a_lib, A_Prgrss, CustDateUtils, Z_Dm;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFrmCreMnthList.CreSpsMes(nY, nM : word) : boolean;
begin
  FrmCreMnthList := TFrmCreMnthList.Create(Application);
  FrmCreMnthList.b_Repair := false;
  Result := RunSps(nY, nM);
end;

//------------------------------------------------------------------------------
class procedure TFrmCreMnthList.RepairSpsMes(nY, nM : word);
begin
  FrmCreMnthList := FrmCreMnthList.Create(Application);
  FrmCreMnthList.b_Repair := true;
  RunSps(nY, nM);
end;

//------------------------------------------------------------------------------
class function TFrmCreMnthList.RunSps(nY, nM : word) : boolean;
begin
  with FrmCreMnthList do begin
    b_SpsCreated := false;
    d_DtBegMes := EncodeDate(nY, nM, 1);
    d_DtEndMes := myLastDoM(d_DtBegMes);
    OpenQrySps(d_DtBegMes, d_DtEndMes);
    if bFlagDbg then
      ShowModal
    else
      sBtnCreSps.Click;
    Result := b_SpsCreated;
    with qryIns do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := '';
      if Prepared then
        Unprepare;
    end;
    with qryCheck do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := '';
      if Prepared then
        Unprepare;
    end;
    qrySps.Close;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmCreMnthList.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 385);
    Width  := ReadInteger(SECTION, 'wW', 450);
    Free;
  end;
  if FileExists(cDirVids + 'z_Cre2Sp.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'z_Cre2Sp.vid');
end;
//------------------------------------------------------------------------------
procedure TFrmCreMnthList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSps.Columns.SaveToFile(cDirVids + 'z_Cre2Sp.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFrmCreMnthList.OpenQrySps(dDtBegMes, dDtEndMes : TDateTime);
var nY, nM, nD : word;
begin
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;

    // d_DtBegPredMes := dDtBegMes - 61; //27;     // уменьшаю на один месяц назад, чтобы
    d_DtBegPredMes := TDateUtils.PrevMonth(dDtBegMes, 3);
    DecodeDate(d_DtBegPredMes, nY, nM, nD); // взять уволенных в прошлом месяце
    d_DtBegPredMes := EncodeDate(nY, nM, 1);// Получил 1-е число прошлого месяца

    SQL.Add(
      'select p.TABN, u.Fam, u.Ima, u.Otch, p.Dt_Priem, p.dt_Uvoln, ' +
        'pp.KdSps, pp.KdObj, pp.KdKatP ' +
      'from Z_PrmUv p ' +
        'Left Outer Join z_Upi u on (u.TabN = p.TabN) ' +
        'Left Outer Join Z_GetWrkPereOnDate (u.TabN, :dDtEndMes) pp on 1=1 ' +
      'where (p.Dt_Priem <= :dDtEndMes) and  ' +
        '((p.Dt_Uvoln is Null) or (p.Dt_Uvoln >= :dDtBegPredMes)) ');

    if b_Repair then
      SQL.Add('and not exists ' +
        '(select * from z_sps where DtProc = :dDtBegMes and TabN = p.TabN) ');

    SQL.Add(
        'order by u.TabN, p.Dt_Priem ');

    ParamByName('dDtBegPredMes').AsDateTime := d_DtBegPredMes;
    if b_Repair then
      ParamByName('dDtBegMes').AsDateTime := dDtBegMes;
    ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFrmCreMnthList.sBtnCreSpsClick(Sender: TObject);
begin
  sBtnCreSps.Enabled := false;

  // Блокируем повторный запуск создания списка.
  DmMain.LockCreSps;

  // Формирование
  CreNewSps(d_DtBegMes, d_DtEndMes);
  AddDolgniki(d_DtBegMes);

  // Снимаем блокировку повторного запуска.
  DmMain.UnlockCreSps;

  bBtnCancel.Caption := 'Выход';
end;

//------------------------------------------------------------------------------
procedure TFrmCreMnthList.CreNewSps(dDtBegMes, dDtEndMes : TDateTime);
var dTimeStart : TDateTime; nSvNR : integer;
    n, nCntPodkl, nCntDop, nTabN : integer;
    nKdSps, nKdObj, nKdKatP, nKdObj_Add, nKdSps_Add : SmallInt;
    nPBarMax, nPBarStep : integer;
    nY, nM, nD : word;
    cFam, cIma, cOtch : string;
    cMsg : ShortString;
begin
  DecodeDate(dDtBegMes, nY, nM, nD);
  with qryIns do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;

    if not b_Repair then begin
      SQL.Add('Delete from Z_Sps where (DtProc = :dDtProc)');
      ParamByName('dDtProc').AsDateTime := dDtBegMes;
      ExecSQL;
      SQL.Clear;
    end;

    SQL.Add('Insert into Z_Sps (KdSps,DtProc,TabN,KdObj,OldKdObj,KdKatP) ' +
           ' values (:nKdSps, :dDtPrc, :nTabN, :nKdObj, :nOldKdObj, :nKdKatP)');
    // OldKdObj с 01-12-07 использую для отметки ОСНОВНОЙ записи в Z_SPS
    // Основная запись - это та, в которой OldKdObj = KdObj
    Prepare;
  end;
  with qrySps do begin
    DisableControls;
    nPBarMax := RecordCount;
    nPBarStep := 1;
    dTimeStart := SysUtils.Time;

    TFrmListProgress.Run('Создание списка на ' +
      MesRus(nM) + ' ' + IntToStr(nY) + ' г.', nPBarMax, nPBarStep);

    nSvNR := FieldByName('TabN').AsInteger;
    First;
    n := 0;
    nCntPodkl := 0;
    while not Eof do begin
      nTabN   := FieldByName('TabN').AsInteger;
      cFam    := FieldByName('Fam').AsString;
      cIma    := FieldByName('Ima').AsString;
      cOtch   := FieldByName('Otch').AsString;
      nKdSps  := FieldByName('KdSps').AsInteger;
      nKdObj  := FieldByName('KdObj').AsInteger;
      nKdKatP := FieldByName('KdKatP').AsInteger;
      Inc(n);

      with FrmListProgress, StatusBar do begin
        Panels[0].Text := '   ' + IntToStr(nPBarMax) + ' / ' +
          IntToStr(n) + ' / ' + IntToStr(nCntPodkl);

        Panels[1].Text := '   ' +
                  'Анализируется TabN: ' + Trim(FieldByName('TabN').AsString);

        Panels[2].Text := TimeToStr(SysUtils.Time - dTimeStart);
        Update;
      end;

      Application.ProcessMessages;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        // делаю этот цикл, дабы избежать возможного дублирования одного TabN
        // из-за более одной подходящей в Z_PrmUv
        if FieldByName('KdObj').AsInteger > 0 then
          nKdObj := FieldByName('KdObj').AsInteger;
        Next;
      end;
      if nKdObj > 0 then begin
        AppSpsRecord(dDtBegMes, nKdSps, nTabN, nKdObj, nKdObj, nKdKatP);
        // Это записываются точно ОСНОВНЫЕ записи, поэтому nOldKdObj = nKdObj
        Inc(nCntPodkl);
      end;
    end;
    EnableControls;

    TFrmListProgress.Finish;

    if nSvNR <> 0 then
      Locate('TabN', nSvNR, []);
  end;
  // Подключить "списочников" по таблице Z_SpsAdd с проверкой "уволенности"
  // и с проверкой и отслеживанием, ОСНОВНАЯ это запись или нет
  // qryIns пока еще Prepared на вставку записей в Z_SPS
  with qryCheck do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;

    SQL.Add('Select * from z_Sps where TabN = :nTabN and ' +
            ' DtProc = :dDtPrc and KdObj = :nKdObj ');
    ParamByName('dDtPrc').AsDateTime := d_DtBegMes;
    Prepare;
  end;
  with qrySpsAdd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, pp.KdObj, pp.KdSps, pp.KdKatP, ' +
            ' p.Dt_Priem, p.Dt_Uvoln, ' +
            ' s.TabN, s.KdUsr, s.KdSps as KdSps_Add, s.KdObj as KdObj_Add ' +
            ' from z_SpsAdd s ' +
            ' Left Outer Join z_Upi u on u.TabN = s.TabN ' +
            ' Left Outer Join z_PrmUv p on p.TabN = s.TabN and ' +
            ' (p.Dt_Priem <= :dDtEndMes) and ' +
            ' (p.Dt_Uvoln is Null or p.Dt_Uvoln >= :dDtBegPredMes) ' +
         ' Left Outer Join Z_GetWrkPereOnDate (s.TabN, :dDtEndMes) pp on 1=1 ' +
         ' where (s.DtBProc <= :dDtBegMes and ' +
         ' (s.DtEProc is Null or s.DtEProc >= :dDtEndMes)) ' +
         ' order by s.TabN, p.Dt_Priem, s.KdSps, s.KdObj ');
    ParamByName('dDtBegMes').AsDateTime := d_DtBegMes;
    ParamByName('dDtBegPredMes').AsDateTime := d_DtBegPredMes;
    ParamByName('dDtEndMes').AsDateTime := d_DtEndMes;
    Open;
    nPBarMax := RecordCount;
    nPBarStep := 1;
    dTimeStart := SysUtils.Time;              {A_Prgrss}
    TFrmListProgress.Run('Подключение сотрудников из и для ДопСписков',
                                                          nPBarMax, nPBarStep);
    n := 0;
    nCntDop := 0;
    nKdObj := 0;
    nKdKatP := 0;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      Inc(n);
      with FrmListProgress, StatusBar do begin
        Panels[0].Text := '   ' + IntToStr(nPBarMax) + ' / ' +
          IntToStr(n) + ' / ' + IntToStr(nCntDop);
        Panels[1].Text := '   ' +
          'Анализируется TabN: ' + Trim(FieldByName('TabN').AsString);
        Panels[2].Text := TimeToStr(SysUtils.Time - dTimeStart);
        
        Update;
      end;
      Application.ProcessMessages;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        nKdSps_Add := FieldByName('KdSps_Add').AsInteger;
        while (FieldByName('TabN').AsInteger = nTabN) and
                  (nKdSps_Add = FieldByName('KdSps_Add').AsInteger) and
                                                                not Eof do begin
          nKdObj_Add := FieldByName('KdObj_Add').AsInteger;
          while (FieldByName('TabN').AsInteger = nTabN) and
                   (nKdSps_Add = FieldByName('KdSps_Add').AsInteger) and
                      (FieldByName('KdObj_Add').AsInteger = nKdObj_Add) and
                                                                not Eof do begin
            nKdObj := FieldByName('KdObj').AsInteger; // из Z_Pere для OldKdObj
            nKdKatP := FieldByName('KdKatP').AsInteger; // из Z_Pere
            Next;
          end;
          qryCheck.Close; // проверить, не подключен ли?
          qryCheck.ParamByName('nTabN').AsInteger  := nTabN;
          qryCheck.ParamByName('nKdObj').AsInteger := nKdObj_Add;
          // qryCheck.ParamByName('nKdSps').AsInteger := nKdSps_Add;
          qryCheck.Open;
          if qryCheck.RecordCount = 0 {не подключен - подключаю} then begin
            AppSpsRecord(dDtBegMes, nKdSps_Add, nTabN,
                                                nKdObj_Add, nKdObj, nKdKatP);
            Inc(nCntDop);
          end;
        end;
      end;
    end;

    TFrmListProgress.Finish;
  end;

  cMsg := 'В список на ' + MesRus(nM) + ' ' + IntToStr(nY) +
              ' г. подключено сотрудников: ' + IntToStr(nCntPodkl);
  if nCntDop > 0 then
    cMsg := cMsg + #13#10 + ' плюс по ДопСпискам: ' + IntToStr(nCntDop);
    
  ShowMessage(cMsg);
end;
//------------------------------------------------------------------------------
procedure TFrmCreMnthList.AddDolgniki(d_DtBegMes : TDateTime);
var dPredMes : TDateTime; nY, nM, nD : word;
    nCntAddRec, nCntDlgRec : SmallInt; cMsg : ShortString;
begin
  DecodeDate(d_DtBegMes, nY, nM, nD);
  nM := nM - 1;
  if nM < 1 then begin
    nM := 12;
    nY := nY - 1;
  end;
  dPredMes := EncodeDate(nY, nM, 1);
  with qryOldNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_NU where (DtProc = :dDtProc) and ' +
            ' (VidN = "2724") and (Summa > 0)');    // в_ДолгТМ
    ParamByName('dDtProc').AsDateTime := dPredMes;
    Open;
    nCntAddRec := 0;
    nCntDlgRec := 0;
    while not Eof do begin
      // Сделать проверку - не записан ли уже (с этими же данными)
      if not IsInSps(d_DtBegMes, FieldByName('TabN').AsInteger) then begin
        Inc(nCntAddRec);
        AppSpsRecord(d_DtBegMes, FieldByName('KdSps').AsInteger,
                                 FieldByName('TabN').AsInteger,
                                 FieldByName('KdObj').AsInteger,
                                 FieldByName('KdObj').AsInteger,
                                 FieldByName('KdKatP').AsInteger);
      end;
      // Сумму долга нужно записать в любом случае,
      // изменив вид на "6624" (УдржДолгаПМ) и сумму на -сумму
      Inc(nCntDlgRec);
      AddInOtkl(d_DtBegMes, '6624', FieldByName('KdSps').AsInteger,
                             FieldByName('TabN').AsInteger,
                             FieldByName('KdObj').AsInteger,
                             FieldByName('KdKatP').AsInteger,
                             FieldByName('KdSpZ').AsInteger,
                             -FieldByName('Summa').AsFloat);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
    if (nCntAddRec <> 0) or (nCntDlgRec <> 0) then begin
      cMsg := '';
      if nCntAddRec <> 0 then
        cMsg := cMsg + 'Добавлено в список записей с должниками ПМ: ' +
                                             IntToStr(nCntAddRec) + #13#10;

      if nCntDlgRec <> 0 then
        cMsg := cMsg + 'Введено в отклонения записей с долгами ПМ: ' +
                                                      IntToStr(nCntDlgRec);
      ShowMessage(cMsg);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFrmCreMnthList.AddInOtkl(dDtPrc : TDateTime; cVidN : string4;
                               nKdSps, nTabN, nKdObj, nKdKatP, nKdSpZ : integer;
                               nSumma : double);
begin
  with qryTmp do begin
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, ' +
            ' Summa, KdObj, KdKatP, Pdn, KdSpZ, Notes) ' +
            ' values (:nKdSps, :dDtPrc, :dDtPrc, :nTabN, :cVidN, ' +
            ' :nSumma, :nKdObj, :nKdKatP, :nPdn, :nKdSpZ, :cNotes)');
    ParamByName('nKdSps').AsInteger  := nKdSps;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('cVidN').AsString    := cVidN;
    ParamByName('nSumma').AsFloat    := nSumma;
    ParamByName('nKdObj').AsInteger  := nKdObj;
    ParamByName('nKdKatP').AsInteger := nKdKatP;
    ParamByName('nPdn').AsInteger    := 1;
    ParamByName('nKdSpZ').AsInteger  := nKdSpZ;
    ParamByName('cNotes').AsString   := 'ДолгПрМес';
    ExecSQL;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFrmCreMnthList.IsInSps(dDtPrc : TDateTime; nTabN : integer) : boolean;
begin
  with qryTmp do begin
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Count( * ) as CNT from Z_SPS ' +
            ' where (DtProc = :dDtPrc) and (TabN = :nTabN)');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Result := FieldByName('CNT').AsInteger > 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFrmCreMnthList.AppSpsRecord(dDtP : TDateTime;
                           nKdSps, nTabN, nKdObj, nOldKdObj, nKdKatP : integer);
begin
  with qryIns do begin
    ParamByName('nKdSps').AsInteger    := nKdSps;
    ParamByName('dDtPrc').AsDateTime   := dDtP;
    ParamByName('nTabN').AsInteger     := nTabN;
    ParamByName('nKdObj').AsInteger    := nKdObj;
    ParamByName('nOldKdObj').AsInteger := nOldKdObj;
    ParamByName('nKdKatP').AsInteger   := nKdKatP;
    ExecSQL;
    b_SpsCreated := true;
  end;
end;

end.
