unit z_GtSrK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, ExtCtrls, DBClient, DB, Grids, DBGrids, DBTables,
  Math, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFormGtSrK = class(TForm)
    Panel1: TPanel;
    qryNU: TQuery;
    dsrcNU: TDataSource;
    dbgrNU: TDBGrid;
    qryNUSSRK: TStringField;
    qryNUVIDN: TStringField;
    qryNUSHVIDN: TStringField;
    qryNUDTPROC: TDateTimeField;
    qryNUZAMESGOD: TDateTimeField;
    qryNUDT_BEG: TDateTimeField;
    qryNUDT_END: TDateTimeField;
    qryNUCHAS: TFloatField;
    qryNUSUMMA: TFloatField;
    cdsNU: TClientDataSet;
    cdsNUSSRK: TStringField;
    cdsNUVIDN: TStringField;
    cdsNUSHVIDN: TStringField;
    cdsNUDTPROC: TDateTimeField;
    cdsNUZAMESGOD: TDateTimeField;
    cdsNUDT_BEG: TDateTimeField;
    cdsNUDT_END: TDateTimeField;
    cdsNUCHAS: TFloatField;
    cdsNUSUMMA: TFloatField;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    PanelRight: TPanel;
    Bevel1: TBevel;
    cdsRS: TClientDataSet;
    dsrcRS: TDataSource;
    cdsRSGrVid: TSmallintField;
    cdsRSShGrV: TStringField;
    cdsRSSmGrV: TFloatField;
    cdsRSSmDSrK: TFloatField;
    PanelR2: TPanel;
    dbgrRS: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelMes1: TLabel;
    LabelMes2: TLabel;
    LabelBudg1: TLabel;
    LabelBudg2: TLabel;
    Label9: TLabel;
    LabelProp1: TLabel;
    LabelProp2: TLabel;
    Label12: TLabel;
    LabelZachet1: TLabel;
    LabelZachet2: TLabel;
    cdsPrDn: TClientDataSet;
    cdsPrDnDtBeg: TDateField;
    cdsPrDnDtEnd: TDateField;
    cdsPrDnCntPrDn: TSmallintField;
    cdsRSnMes: TSmallintField;
    cdsRScMes: TStringField;
    sBtnDbg: TSpeedButton;
    dsrcPrDn: TDataSource;
    dbgrPrDn: TDBGrid;
    sBtnCalendar: TSpeedButton;
    cdsTmp: TClientDataSet;
    cdsTmpKoefOkl1: TFloatField;
    cdsTmpKoefOkl2: TFloatField;
    cdsTmpCntDnDSrdn: TSmallintField;
    cdsTmpSmDSrdn: TFloatField;
    cdsTmpSmSrdn: TFloatField;
    dbeCntDnDSrdn: TDBEdit;
    dsrcTmp: TDataSource;
    dbeSmDSrdn: TDBEdit;
    dbeSmSrdn: TDBEdit;
    cdsMes: TClientDataSet;
    dsrcMes: TDataSource;
    dbgrMes: TDBGrid;
    cdsMesDtMes: TDateField;
    qryEDays: TQuery;
    cdsMesPropDay: TStringField;
    cdsMesStep: TSmallintField;
    cdsMesWrkDay: TStringField;
    cdsMesUvoln: TStringField;
    qryTmp: TQuery;
    LabelBlock: TLabel;
    Label5: TLabel;
    dbeKoefOkl1: TDBEdit;
    dbeKoefOkl2: TDBEdit;
    LabelSm1206: TLabel;
    cdsTmpDnejKmd: TFloatField;
    cdsTmpSm1206: TFloatField;
    Label6: TLabel;
    dbeDnejKmd: TDBEdit;
    dbeSm1206: TDBEdit;
    Label7: TLabel;
    dbeSrdnInMesKmd: TDBEdit;
    cdsTmpSmSrdnInMesKmd: TFloatField;
    qryOklNdb: TQuery;
    cdsRSZaMG: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PanelRightResize(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure sBtnCalendarClick(Sender: TObject);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure cdsTmpCntDnDSrdnValidate(Sender: TField);
    procedure cdsTmpSmDSrdnValidate(Sender: TField);
    procedure sBtnDbgClick(Sender: TObject);
    procedure cdsTmpKoefOklValidate(Sender: TField);
  private
    { Private declarations }
    n_TabN : integer;
    nY, nM, nD, nMes, nCntMes, nStep : word;
    bIsWrk1, bIsWrk2, bCdsRSReady : boolean;
    nKoefOkl1, nKoefOkl2, nSmDSrdn, nSmSrdn, nFloatDummy : double;
    nDnBdg1, nDnBdg2, nDnBdg, nDnPrp1, nDnPrp2, nDnPrp,
                      nDnZch1, nDnZch2, nDnZch{, nDummy} : integer;
    dDtB1, dDtE1, dDtB2, dDtE2, dZaMG : TDateTime;
    d_ZaMg1, d_ZaMg2 : TDateTime;
    d_DtBeg, d_DtEnd : TDateTime;
    nSumma, n_RetSmSrdn : double;
    {nCntDayInMes,} nCntWrkDayInMes, nCntWrkDayInKmd : double;
    nCntWrkChInMes, nCntWrkChInKmd : double;
    procedure CreOpenCdsNU(nTabN : integer; dDtBP, dDtEP : TDateTime);
    procedure AddRecIntoCdsNU;
    procedure FillCdsMes(nStep : word; dDtBP, dDtEP : TDateTime);
    procedure AddInfInCdsMes(dDtBP, dDtEP : TDateTime);
    function DayIsWork(dDtMes : TDateTime) : boolean;
    procedure CheckPrmUv(nTabN : integer; dDtB1, dDtE2 : TDateTime);
    procedure RaschetKoefOkl(nTabN : integer; dDtB1, dDtB2 : TDateTime);
    function GetOklTrf(nTabN : integer; dDtMes : TDateTime) : double;
    function GetOklNdb(nTabN : integer; dDtMes : TDateTime) : double;
    procedure SchetSrD;
    procedure HideFirstMonth;
    procedure HideSecondMonth;
  public
    { Public declarations }
  end;

function GetSrDnKmd(nTabN : integer; dDtBeg, dDtEnd, dDtBP, dDtEP : TDateTime;
                              bBlock : boolean; var nSmSrK : double) : boolean;

const SECTION = 'z_GtSrK';

var
  FormGtSrK: TFormGtSrK;

implementation

uses A_Const, A_Lib, Z_DM, Z_Main, z_Calend, z_DmSpan;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetSrDnKmd(nTabN : integer; dDtBeg, dDtEnd, dDtBP, dDtEP : TDateTime;
                               bBlock : boolean; var nSmSrK : double) : boolean;
var {nY, nM, nD : word;} cCaption : ShortString;
begin
  Result := false;
  FormGtSrK := TFormGtSrK.Create(Application);
  nSmSrK := 0;
  with FormGtSrK do begin
    bCdsRSReady := false;
    n_TabN  := nTabN;
    d_DtBeg := dDtBeg;
    d_DtEnd := dDtEnd;
    d_ZaMg1 := dDtBP;
    d_ZaMg2 := dDtEP;
    if bBlock then begin
      LabelBlock.Caption := 'Расчет текущего сотрудника заблокирован';
      bBtnOk.Enabled := false; end
    else begin
      LabelBlock.Caption := '';
      bBtnOk.Enabled := true;
    end;
    cCaption := 'Расчет среднего для командировок (';
    DecodeDate(dDtBP, nY, nM, nD);
    cCaption := cCaption + MesRus(nM) + ' ' + IntToStr(nY) + ' - ';
    DecodeDate(dDtEP, nY, nM, nD);
    cCaption := cCaption + MesRus(nM) + ' ' + IntToStr(nY) + ')';
    Caption := cCaption;
    CreOpenCdsNU(nTabN, dDtBP, dDtEP);
    if (ShowModal = mrOk) and not bBlock then begin
      nSmSrK := n_RetSmSrdn;
      //nSmSrK := cdsTmpSmSrdn.AsFloat;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.CheckPrmUv(nTabN: integer; dDtB1, dDtE2: TDateTime);
var dDtPrm, dDtUv : TDateTime;
begin
  dDtUv := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from z_PrmUv where TabN = :nTabN and ' +
            ' Dt_Priem <= :dDtE2 order by Dt_Priem desc, Dt_Uvoln desc');
    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('dDtE2').AsDateTime := dDtE2;
    Open;
    dDtPrm := FieldByName('dT_Priem').AsDateTime;
    if not FieldByName('Dt_Uvoln').IsNull then
      dDtUv := FieldByName('Dt_Uvoln').AsDateTime;
    Close;
  end;
  with cdsMes do begin
    if dDtPrm >= dDtB1 then begin
      First;
      while not Eof do begin
        if cdsMesDtMes.AsDateTime < dDtPrm then begin
          Edit;
          cdsMesUvoln.AsString := 'Y';
          Post;
        end;
        Next;
      end;
    end;
    if (dDtUv > 0) and (dDtUv <= dDtE2) then begin
      First;
      while not Eof do begin
        if cdsMesDtMes.AsDateTime > dDtUv then begin
          Edit;
          cdsMesUvoln.AsString := 'Y';
          Post;
        end;
        Next;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormGtSrK.GetOklTrf(nTabN: integer; dDtMes: TDateTime): double;
var nSpec_NR : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from z_Pere where TabN = :nTabN and ' +
            ' Dt_Beg <= :dDtMes order by Dt_Beg desc, NR desc');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtMes').AsDateTime := dDtMes;
    Open;
    if FieldByName('CmbOkl').IsNull or
                           (FieldByName('CmbOkl').AsString = '') then
      { SB Result := FieldByName('OklTrf').AsFloat }
      Result := DMSpan.GetOklTrf(nTabN, dDtMes) { SB }
    else begin
      nSpec_NR := FieldByName('Spec_NR').AsInteger;
      Close;
      SQL.Clear;
      SQL.Add('Select * from z_CmbOkl where Spec_NR = :nSpec_NR');
      ParamByName('nSpec_NR').AsInteger := nSpec_NR;
      Open;
      Result := 0;
      while not Eof do begin
        Result := Result + FieldByName('OklTrf').AsFloat;
        Next;
      end;
    end;
    Close;
    SQL.Clear;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormGtSrK.RaschetKoefOkl(nTabN: integer; dDtB1, dDtB2: TDateTime);
var dDtKmd : TDateTime; nY, nM, nD : word;
    nOklMesKmd, nOklMes1, nOklMes2 : double;
    //nSpec_NR : integer;
begin
  DecodeDate(dDtB2, nY, nM, nD);
  Inc(nM);
  if nM > 12 then begin
    nM := 1;
    Inc(nY);
  end;
  dDtKmd := EncodeDate(nY, nM, 1);
  nOklMesKmd := GetOklTrf(nTabN, dDtKmd);
  nOklMes2   := GetOklTrf(nTabN, dDtB2);
  nOklMes1   := GetOklTrf(nTabN, dDtB1);

  // 26.10.2026 Оксана: Коэфф. не учитывать (брать всегда 1)
  // if nOklMes1 > 0 then
  //   nKoefOkl1 := RoundTo(nOklMesKmd / nOklMes1, -2)
  // else
    nKoefOkl1 := 1;

  if dDtB1 = 0 then begin
    // HideFirstMonth;
    nKoefOkl1 := 0;
  end;
  cdsTmpKoefOkl1.AsFloat := nKoefOkl1;

  // 26.10.2026 Оксана: Коэфф. не учитывать (брать всегда 1)
  // if nOklMes2 > 0 then
  //   nKoefOkl2 := RoundTo(nOklMesKmd / nOklMes2, -2)
  // else
    nKoefOkl2 := 1;

  if dDtB2 = 0 then begin
    // HideSecondMonth;
    nKoefOkl2 := 0;
  end;

  cdsTmpKoefOkl2.AsFloat := nKoefOkl2;
end;

//------------------------------------------------------------------------------
function TFormGtSrK.DayIsWork(dDtMes: TDateTime): boolean;
var nDayOfWeek : word;
begin
  Result := false;
  if qryEDays.Locate('E_Day', dDtMes, []) then begin
    if qryEDays.FieldByName('Rab_Chas').AsFloat > 0 then
      Result := true; end
  else begin
    nDayOfWeek := DayOfWeek(dDtMes);
    if (nDayOfWeek > 1) and (nDayOfWeek < 7) then
      Result := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.FillCdsMes(nStep : word; dDtBP, dDtEP : TDateTime);
var dDtMes : TDateTime; bDayIsWork : boolean;
begin
  dDtMes := dDtBP;
  while dDtMes <= dDtEP do begin
    with cdsMes do begin
      Append;
      cdsMesStep.AsInteger := nStep;
      bDayIsWork := DayIsWork(dDtMes);
      cdsMesDtMes.AsDateTime := dDtMes;
      if bDayIsWork then
        cdsMesWrkDay.AsString := 'Y';
      Post;
      dDtMes := dDtMes + 1;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.AddInfInCdsMes(dDtBP, dDtEP: TDateTime);
var dDtMes : TDateTime; bDayIsWork : boolean;
    nDayOfWeek : word;
begin
  dDtMes := dDtBP;
  while dDtMes <= dDtEP do begin
    bDayIsWork := false;
    if qryEDays.Locate('E_Day', dDtMes, []) then begin
      if qryEDays.FieldByName('Rab_Chas').AsFloat > 0 then
        bDayIsWork := true; end
    else begin
      nDayOfWeek := DayOfWeek(dDtMes);
      if (nDayOfWeek > 1) and (nDayOfWeek < 7) then
        bDayIsWork := true;
    end;
    if bDayIsWork and cdsMes.Locate('DtMes', dDtMes, []) then begin
      cdsMes.Edit;
      cdsMesPropDay.AsString := 'Y';
      cdsMes.Post;
    end;
    dDtMes := dDtMes + 1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.CreOpenCdsNU(nTabN: integer; dDtBP, dDtEP: TDateTime);
var nSmGrC, nSmGrK, nSmGrY, nSmGrCz, nSmGrKz, nSmGrYz : double;
    cVidN, cMes : ShortString;
    //nDnBdg1, nDnBdg2, nDnBdg, nDnPrp1, nDnPrp2, nDnPrp,
    //                  nDnZch1, nDnZch2, nDnZch, nDummy : integer;
    //dDtB1, dDtE1, dDtB2, dDtE2, dZaMG : TDateTime;
    //nY, nM, nD, nMes, nCntMes, nStep : word;
    //{nBudget,} nFloatDummy : double;  // bIsWrk1, bIsWrk2 : boolean;
    dDtPriem, dDtUvoln: TDateTime;
    nYPriem, nMPriem, nDPriem: Word;
begin
  bIsWrk1 := false;
  bIsWrk2 := false;
  dDtB1 := dDtBP;
  dDtE1 := MyLastDOM(dDtB1);
  dDtB2 := dDtEP;
  dDtE2 := MyLastDOM(dDtB2);
  DecodeDate(dDtB1, nY, nM, nD);
  LabelMes1.Caption := MesRus(nM);
  DecodeDate(dDtB2, nY, nM, nD);
  LabelMes2.Caption := MesRus(nM);
  with cdsNU do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select SSRK, VidN, ShVidN, DtProc, ZaMesGod, ' +
            ' Dt_Beg, Dt_End, Chas, Summa from ViNuMain ' +
            ' where TabN = :nTabN and ' +
            ' ZaMesGod >= :dDtBeg and ZaMesGod <= :dDtEnd and ' +
            ' (SSRK = "1" or VidN in ("1206","2401","2402","2403","2404",' +
            // SB 23.3.2026 По аналогии, наверное, и 2606
            '  "2405","2601","2602","2603","2604","2605", "2606", ' +
            '  "5001","5002","5003","5004","5005","5006","5009")) and ' +
            ' (not (VidN = "5002" and not Storn is Null and Storn = "Y")) ' +
            ' order by ZaMesGod, VidN, DtProc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtBeg').AsDateTime := dDtBP;
    ParamByName('dDtEnd').AsDateTime := dDtEP;
    Open;
    while not Eof do begin
      AddRecIntoCdsNU;
      Next;
    end;
  end;
  with qryEDays do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from E_Days ' +
            ' where (E_Day >= :dDtB1) and (E_Day <= :dDtE2)');
    ParamByName('dDtB1').AsDateTime := dDtB1;
    ParamByName('dDtE2').AsDateTime := dDtE2;
    Open;
  end;
  with cdsRS do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  nSmGrKz := 0;
  nSmGrYz := 0;
  with cdsMes do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with cdsNU do begin
    First;
    while not Eof do begin
      dZaMG := cdsNuZaMesGod.AsDateTime;
      if dZaMG = dDtB1 then begin
       nStep := 1;
       FillCdsMes(nStep, dDtB1, dDtE1);  end // Заполнить календарь на месяц
      else begin
        nStep := 2;
        FillCdsMes(nStep, dDtB2, dDtE2);
      end;
      while (cdsNuZaMesGod.AsDateTime = dZaMG) and not Eof do
        Next;
    end;
  end;
  CheckPrmUv(nTabN, dDtB1, dDtE2);
  with cdsMes do begin
    First;
    while not Eof do begin
      if (cdsMesStep.AsInteger = 1) then begin
        if cdsMesUvoln.IsNull then
          bIsWrk1 := true; end
      else if (cdsMesStep.AsInteger = 2) then begin
        if cdsMesUvoln.IsNull then
          bIsWrk2 := true;
      end;
      Next;
    end;
  end;
  if bIsWrk1 and bIsWrk2 then
    nCntMes := 2
  else
    nCntMes := 1;
  with cdsNU do begin
    if bFlagDbg then
      SaveToFile(cDirTemp + 'cdsNU.cds');
    First;
    nStep := 0;
    while not Eof do begin
      dZaMG := cdsNuZaMesGod.AsDateTime;
      nSmGrC  := 0;
      nSmGrCz := 0;
      nSmGrK  := 0;
      nSmGrY  := 0;
      Inc(nStep);
      while (cdsNuZaMesGod.AsDateTime = dZaMG) and not Eof do begin
        if cdsNuSSrK.AsString = '1' then begin
          cVidN := cdsNuVidN.AsString;
          if cVidN = '2206' {Премия по итогам года} then
            nSmGrY := nSmGrY + cdsNuSumma.AsFloat
          else if cVidN = '2205' {Премия по итогам квартала} then
            nSmGrK := nSmGrK + cdsNuSumma.AsFloat
          else {остальные с SSrK = '1'} begin
            nSmGrC := nSmGrC + cdsNuSumma.AsFloat;
            nSmGrCz := nSmGrCz + cdsNuSumma.AsFloat; // Сумма в зачёт
          end; // При видах "квартальных" или "годовых" для суммы "в зачёт"
        end;   // начисленные суммы делятся на 3 или 12
        Next;
      end;
//      if ((nStep = 1) and bIsWrk1) or ((nStep = 2) and bIsWrk2) then begin
      if ((cdsNuZaMesGod.AsDateTime = d_ZaMg1) and bIsWrk1) or
                 ((cdsNuZaMesGod.AsDateTime = d_ZaMg2) and bIsWrk2) then begin
        DecodeDate(dZaMG, nY, nM, nD);
        cMes := Copy(MesRus(nM), 1, 3);
        if nSmGrC <> 0 then
          cdsRS.AppendRecord([dZaMG, nM, cMes, 1, 'Общие', nSmGrC, nSmGrCz]);
        if nSmGrK <> 0 then
          cdsRS.AppendRecord([dZaMG, nM, cMes, 2, 'Квартальные', nSmGrK, nSmGrKz]);
        if nSmGrY <> 0 then
          cdsRS.AppendRecord([dZaMG, nM, cMes, 3, 'Годовые', nSmGrY, nSmGrYz]);
      end;
    end;
  end;
  with cdsPrDn do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with cdsNu do begin
    First; // Заполнить cdsPrDn ("пропущенных" дней)
    while not Eof do begin
      cVidN := cdsNuVidN.AsString;
      if (cVidN = '1206') or (cVidN = '2401') or (cVidN = '2402') or
          (cVidN = '2403') or (cVidN = '2404') or (cVidN = '2405') or
          (cVidN = '2601') or (cVidN = '2602') or (cVidN = '2603') or
          // SB 23.3.2026 По аналогии, наверное, и 2606
          (cVidN = '2604') or (cVidN = '2605') or (cVidN = '2606') or
          (cVidN = '5001') or (cVidN = '5002') or (cVidN = '5003') or
          (cVidN = '5004') or (cVidN = '5005') or (cVidN = '5006') or
          (cVidN = '5009') or (cVidN = '5010') then
      begin
        if not cdsNuDt_Beg.IsNull and not cdsNuDt_End.IsNull and
             (cdsNuDt_Beg.AsDateTime >= dDtB1) and
               (cdsNuDt_End.AsDateTime <= dDtE2) and not
                cdsPrDn.Locate('DtBeg;DtEnd',
                          VarArrayOf([cdsNuDt_Beg.AsDateTime,
                                       cdsNuDt_End.AsDateTime]), []) then begin
          cdsPrDn.Append;
          cdsPrDnDtBeg.AsDateTime := cdsNuDt_Beg.AsDateTime;
          cdsPrDnDtEnd.AsDateTime := cdsNuDt_End.AsDateTime;
          cdsPrDn.Post;
        end;
      end;
      Next;
    end;
  end;
  with cdsPrDn do begin
    First;
    while not Eof do begin  // В календаре отметить "пропущенные" дни
      AddInfInCdsMes(cdsPrDnDtBeg.AsDateTime, cdsPrDnDtEnd.AsDateTime);
      Next;
    end;
  end;
  nDnBdg1 := 0;  // бюджетных (рабочих)
  nDnBdg2 := 0;
  nDnBdg  := 0;
  nDnPrp1 := 0;  // пропущенных
  nDnPrp2 := 0;
  nDnPrp  := 0;
  with cdsMes do begin
    First;
    while not Eof do begin
      if cdsMesUvoln.IsNull then begin
        nStep := cdsMesStep.AsInteger;
        if cdsMesWrkDay.AsString = 'Y' then begin
          if nStep = 1 then
            Inc(nDnBdg1)
          else if nStep = 2 then
            Inc(nDnBdg2);
        end;
        if cdsMesPropDay.AsString = 'Y' then begin
          if nStep = 1 then
            Inc(nDnPrp1)
          else if nStep = 2 then
            Inc(nDnPrp2);
        end;
      end;
      Next;
    end;
  end;
  nDnZch1 := nDnBdg1 - nDnPrp1;
  nDnZch2 := nDnBdg2 - nDnPrp2;
  nDnBdg  := nDnBdg1 + nDnBdg2;
  nDnPrp  := nDnPrp1 + nDnPrp2;
  nDnZch  := nDnZch1 + nDnZch2;
  LabelBudg1.Caption := IntToStr(nDnBdg1);
  LabelBudg2.Caption := IntToStr(nDnBdg2);
  LabelProp1.Caption := IntToStr(nDnPrp1);
  LabelProp2.Caption := IntToStr(nDnPrp2);
  LabelZachet1.Caption := IntToStr(nDnZch1);
  LabelZachet2.Caption := IntToStr(nDnZch2);
  with cdsTmp do begin
    if Active then Close;
    CreateDataSet;
    Open;
    Append;

    if DmMain.GetLastPriemUvolnInfo(nTabN, dDtPriem, dDtUvoln) then begin
      DecodeDate(dDtPriem, nYPriem, nMPriem, nDPriem);
      dDtPriem := EncodeDate(nYPriem, nMPriem, 1);
      if dDtPriem > dDtBP then dDtBP := 0; { SB }
      if dDtPriem > dDtEP then dDtEP := 0; { SB }
      RaschetKoefOkl(nTabN, dDtBP, dDtEP);
    end else
      RaschetKoefOkl(nTabN, dDtB1, dDtB2);
  end;
  with cdsRS do begin
    First;
    nStep := 0;
    while not Eof do begin
      nMes := cdsRSnMes.AsInteger;
      Inc(nStep);
//      if ((nStep = 1) and bIsWrk1) or ((nStep = 2) and bIsWrk2) then begin
      if ((cdsRSZaMG.AsDateTime = d_ZaMg1) and bIsWrk1) or
                ((cdsRSZaMG.AsDateTime = d_ZaMg2) and bIsWrk2) then begin
        while (cdsRSnMes.AsInteger = nMes) and not Eof do begin
          if cdsRsGrVid.AsInteger = 2 {квартальная премия} then begin
            nFloatDummy := cdsRSSmGrV.AsFloat / 3 * nStep;
            if nStep = 1 then
              begin { SB }
                if nDnBdg1 <> 0 then { SB }
                  nFloatDummy := nFloatDummy / nDnBdg1 * nDnZch1;
              end { SB }
            else if nStep = 2 then
              nFloatDummy := nFloatDummy / (nDnBdg1+nDnBdg2) * (nDnZch1+nDnZch2);
            Edit;
            cdsRSSmDSrK.AsFloat := RoundTo(nFloatDummy, -2);
            Post; end
          else if cdsRsGrVid.AsInteger = 3 {годовая премия} then begin
            nFloatDummy := cdsRSSmGrV.AsFloat / 12 * nStep;
            if nStep = 1 then
              nFloatDummy := nFloatDummy / nDnBdg1 * nDnZch1
            else if nStep = 2 then
              nFloatDummy := nFloatDummy / (nDnBdg1+nDnBdg2) * nDnZch;
            Edit;
            cdsRSSmDSrK.AsFloat := RoundTo(nFloatDummy, -2);
            Post;
          end;
          Next;
        end; end
      else
        Next;
    end;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'cdsRS.cds');
  end;
  SchetSrD;
  bCdsRSReady := true;
end;
//------------------------------------------------------------------------------
function TFormGtSrK.GetOklNdb(nTabN: integer; dDtMes: TDateTime): double;
var nSpec_NR : integer; nOklTrf, nSmNdb : double; dDtEM : TDateTime;
    nCntDay, nCntWrkDay : integer;   nY, nM, nD : word;  nSmSrChas : double;
begin
  nSmNdb  := 0;
  DecodeDate(dDtMes, nY, nM, nD);
  DmMain.Budget(nY, nM, nCntDay, nCntWrkDay);
  dDtEM   := MyLastDOM(dDtMes);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from z_Pere where TabN = :nTabN and ' +
            ' Dt_Beg <= :dDtMes order by Dt_Beg desc, NR desc');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtMes').AsDateTime := dDtMes;
    Open;
    if FieldByName('CmbOkl').IsNull or
                           (FieldByName('CmbOkl').AsString = '') then
      nOklTrf := FieldByName('OklTrf').AsFloat
    else begin
      nSpec_NR := FieldByName('Spec_NR').AsInteger;
      Close;
      SQL.Clear;
      SQL.Add('Select * from z_CmbOkl where Spec_NR = :nSpec_NR');
      ParamByName('nSpec_NR').AsInteger := nSpec_NR;
      Open;
      nOklTrf := 0;
      while not Eof do begin
        nOklTrf := nOklTrf + FieldByName('OklTrf').AsFloat;
        Next;
      end;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select * from Z_Nadb where TabN = :nTabN and ' +
            ' Dt_Beg <= :dDtEM and (dt_End is Null or Dt_End >= :dDtMes)');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtMes').AsDateTime := dDtMes;
    ParamByName('dDtEM').AsDateTime  := dDtEM;
    Open;
    while not Eof do begin
      if FieldByName('SP').AsString = '%' then
        nSmNdb := nSmNdb +
                    RoundTo(FieldByName('SumProc').AsFloat * nOklTrf / 100, -2)
      else
        nSmNdb := nSmNdb + FieldByName('SumProc').AsFloat;
      Next;
    end;
    Close;
    SQL.Clear;
  end;
  // Рассчитываю среднечасовую и её перевожу в среднедневную, если возможно.
  // Если невозможно (деление на 0) - остаётся по-старому:
  //                   Result := RoundTo(nSmSrChas / nCntWrkDay, -2);
  nSmSrChas := (nOklTrf + nSmNdb) / nCntWrkChInMes;
//  Result := nSmSrChas * nCntWrkChInMes
  if nCntWrkDayInKmd <> 0 then
    Result := MyRound(nSmSrChas * 8, 4)
  else
    Result := RoundTo((nOklTrf + nSmNdb) / nCntWrkDay, -2);
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.cdsTmpKoefOklValidate(Sender: TField);
begin
  if bCdsRSReady then
    SchetSrD;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.SchetSrD;
var nOklNdb : double; dDtMesKmd : TDateTime; nY, nM, nD : word;
begin
  DecodeDate(d_DtBeg, nY, nM, nD);
  dDtMesKmd := EncodeDate(nY, nM, 1);
  DmMain.GetCntWrkDaysBln(dDtMesKmd, MyLastDOM(dDtMesKmd),
                                        nCntWrkDayInMes, nCntWrkChInMes, 'blk');
  with cdsRS do begin
    nKoefOkl1 := cdsTmpKoefOkl1.AsFloat;
    nKoefOkl2 := cdsTmpKoefOkl2.AsFloat;
    nSmDSrdn := 0;
    nSmSrdn  := 0;
    First;
    nStep := 0;
    while not Eof do begin
      nMes := cdsRSnMes.AsInteger;
      Inc(nStep);
      while (cdsRSnMes.AsInteger = nMes) and not Eof do begin
        if ((cdsRSZaMG.AsDateTime = d_ZaMg1) and bIsWrk1) then
          nSmDSrdn := nSmDSrdn + cdsRSSmDSrK.AsFloat * nKoefOkl1
        else if ((cdsRSZaMG.AsDateTime = d_ZaMg2) and bIsWrk2) then
          nSmDSrdn := nSmDSrdn + cdsRSSmDSrK.AsFloat * nKoefOkl2;
        Next;
      end;
    end;
    if nDnZch > 0 then
      nSmSrdn := RoundTo(nSmDSrdn / nDnZch, -2)
    else
      nSmSrdn := 0;
    DmMain.GetCntWrkDaysBln(d_DtBeg, d_DtEnd,
                                        nCntWrkDayInKmd, nCntWrkChInKmd, 'bln');
    nOklNdb := GetOklNdb(n_TabN, dDtMesKmd);
    if nOklNdb <= nSmSrdn then begin
      n_RetSmSrdn := nSmSrdn;
      nSumma := nCntWrkDayInKmd * nSmSrdn;
      dbeSmSrdn.Color := clLime;
      dbeSrdnInMesKmd.Color := clBtnFace; end
    else begin
      n_RetSmSrdn := nOklNdb;
      nSumma := nCntWrkDayInKmd * nOklNdb;
      dbeSmSrdn.Color := clBtnFace;
      dbeSrdnInMesKmd.Color := clLime;
    end;
    cdsTmpCntDnDSrdn.AsInteger   := nDnZch;
    cdsTmpSmDSrdn.AsFloat        := nSmDSrdn;
    cdsTmpSmSrdnInMesKmd.AsFloat := nOklNdb;
    cdsTmpSmSrdn.AsFloat         := nSmSrdn;
    cdsTmpDnejKmd.AsFloat        := nCntWrkDayInKmd;
    cdsTmpSm1206.AsFloat         := nSumma;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.cdsTmpCntDnDSrdnValidate(Sender: TField);
var nCntDay : SmallInt; nSmm : double;
begin
  nCntDay := cdsTmpCntDnDSrdn.AsInteger;
  nSmm := cdsTmpSmDSrdn.AsFloat;
  if (nCntDay > 0) and (nSmm > 0) then begin
    nSmSrdn := RoundTo(nSmm / nCntDay, -2);
    cdsTmpSmSrdn.AsFloat := nSmSrdn; end
  else begin
    nSmSrdn := 0;
    cdsTmpSmSrdn.AsString := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.cdsTmpSmDSrdnValidate(Sender: TField);
var nCntDay : SmallInt; nSmm : double;
begin
  nCntDay := cdsTmpCntDnDSrdn.AsInteger;
  nSmm := cdsTmpSmDSrdn.AsFloat;
  if (nCntDay > 0) and (nSmm > 0) then begin
    nSmSrdn := RoundTo(nSmm / nCntDay, -2);
    cdsTmpSmSrdn.AsFloat := nSmSrdn; end
  else begin
    nSmSrdn := 0;
    cdsTmpSmSrdn.AsString := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.AddRecIntoCdsNU;
begin
  with cdsNU do begin
    Append;
    cdsNuSSrk.AsString     := qryNuSSrK.AsString;
    cdsNuVidN.AsString     := qryNuVidN.AsString;
    cdsNuShVidN.AsString   := qryNuShVidN.AsString;
    cdsNuDtProc.AsString   := qryNuDtProc.AsString;
    cdsNuZaMesGod.AsString := qryNuZaMesGod.AsString;
    cdsNuDt_Beg.AsString   := qryNuDt_Beg.AsString;
    cdsNuDt_End.AsString   := qryNuDt_End.AsString;
    cdsNuChas.AsString     := qryNuChas.AsString;
    cdsNuSumma.AsString    := qryNuSumma.AsString;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 770);
    Free;
  end;
  sBtnDbg.Visible  := bFlagDbg;
  dbgrMes.Visible  := false;
  dbgrPrDn.Visible := false;
  if FileExists(cDirVids + 'KmdSrK.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'KmdSrk.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bIsFormMyCalendar then
    FormMyCalendar.Close;
  dbgrNu.Columns.SaveToFile(cDirVids + 'KmdSrK.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrNu.Canvas do begin
    if cdsNuSSrK.AsString = '1' then begin
      Font.Color := clMaroon;
      Font.Style := [fsBold];
    end;
  end;
  dbgrNu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.PanelRightResize(Sender: TObject);
begin
  PanelR2.Top := Round((PanelRight.Height - PanelR2.Height) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.sBtnCalendarClick(Sender: TObject);
begin
  if not bIsFormMyCalendar then
    ShowMyCalendar    {Z_Calend}
  else begin
    if FormMyCalendar.WindowState = wsMinimized then
      FormMyCalendar.WindowState := wsNormal;
    FormMyCalendar.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormGtSrK.sBtnDbgClick(Sender: TObject);
begin
  dbgrMes.Visible  := not dbgrMes.Visible;
  dbgrPrDn.Visible := not dbgrPrDn.Visible;
end;

procedure TFormGtSrK.HideFirstMonth;
begin
  LabelMes1.Visible := false;
  dbeKoefOkl1.Visible := false;
  LabelBudg1.Visible := false;
  LabelProp1.Visible := false;
  LabelZachet1.Visible := false;
end;

procedure TFormGtSrK.HideSecondMonth;
begin
  LabelMes2.Visible := false;
  dbeKoefOkl2.Visible := false;
  LabelBudg2.Visible := false;
  LabelProp2.Visible := false;
  LabelZachet2.Visible := false;
end;

end.
