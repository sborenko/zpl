unit z_Mo2Gk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBClient, DBTables, Grids,
  Math, DBGrids, ComCtrls;

type
  TFormZpl2Gk = class(TForm)
    Panel1: TPanel;
    sBtnPrt: TSpeedButton;
    sBtnStayOnTop: TSpeedButton;
    sBtnDetails: TSpeedButton;
    bBtnCancel: TBitBtn;
    PageControl: TPageControl;
    tsNachislenija: TTabSheet;
    LabelPrh: TLabel;
    dbgrPrh: TDBGrid;
    tsUderganija: TTabSheet;
    LabelRsh: TLabel;
    dbgrRsh: TDBGrid;
    qryTmp: TQuery;
    cdsPrh: TClientDataSet;
    dsrcPrh: TDataSource;
    cdsRsh: TClientDataSet;
    dsrcRsh: TDataSource;
    Panel2: TPanel;
    cdsPrhPSCH: TStringField;
    cdsPrhSchDt: TStringField;
    cdsPrhNmSchDt: TStringField;
    cdsPrhSchKt: TStringField;
    cdsPrhNmSchKt: TStringField;
    cdsPrhKEKV: TStringField;
    cdsPrhKdIF: TSmallintField;
    cdsPrhUPoz: TStringField;
    cdsPrhSumma: TFloatField;
    cdsRshPSch: TStringField;
    cdsRshSchDt: TStringField;
    cdsRshNmSchDt: TStringField;
    cdsRshSchKt: TStringField;
    cdsRshNmSchKt: TStringField;
    cdsRshKEKV: TStringField;
    cdsRshKdIF: TSmallintField;
    cdsRshUPoz: TStringField;
    cdsRshSumma: TFloatField;
    cdsPrhMyFld: TStringField;
    cdsRshMyFld: TStringField;
    cdsPrhVnu: TSmallintField;
    cdsRshVnu: TSmallintField;
    LabelCntSelRec: TLabel;
    LabelSmSelRec: TLabel;
    qryObDt: TQuery;
    qryObDtNR: TIntegerField;
    qryObDtDTPROC: TDateTimeField;
    qryObDtSCHORD: TStringField;
    qryObDtSCHET_DBT: TStringField;
    qryObDtKODZ_DBT: TStringField;
    qryObDtSCHET_KRT: TStringField;
    qryObDtKODZ_KRT: TStringField;
    qryObDtKPR: TSmallintField;
    qryObDtSUM_DBT: TFloatField;
    qryObDtOTKUDA: TStringField;
    qryObDtDATAISP: TDateTimeField;
    qryObDtNDOK: TStringField;
    qryObDtDTDOK: TDateTimeField;
    qryObDtKOBJ: TSmallintField;
    qryObDtPPODKL: TStringField;
    qryObDtFILENM: TStringField;
    qryObDtNMOPER: TStringField;
    qryObDtKDSCHDBT: TSmallintField;
    qryObDtKDSTZDBT: TSmallintField;
    qryObDtKDSCHKRT: TSmallintField;
    qryObDtKDSTZKRT: TSmallintField;
    qryObDtPVOZV: TStringField;
    cdsPrp: TClientDataSet;
    tsCdsPrp: TTabSheet;
    dsrcPrp: TDataSource;
    dbgrPrp: TDBGrid;
    cdsPrpNR: TAutoIncField;
    cdsPrpGrp: TSmallintField;
    cdsPrpPSch: TStringField;
    cdsPrpSchBU: TStringField;
    cdsPrpForVidN: TStringField;
    cdsPrpVidNotes: TStringField;
    cdsPrpSmFor: TFloatField;
    cdsPrpSmSvPrg: TFloatField;
    cdsPrpSmToInBD: TFloatField;
    cdsPrpPrcToEsv: TFloatField;
    cdsPrpSmToRasch: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBtnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure dbgrPrhDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrRshDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
//    procedure dbgrPrhDblClick(Sender: TObject);
//    procedure dbgrRshDblClick(Sender: TObject);
    procedure dbgrPrhKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure GetCntSmSelRecPrh;
    procedure GetCntSmSelRecRsh;
    procedure GetCntSmSelRecPrp;
    procedure dbgrRshKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
    procedure cdsPrhAfterScroll(DataSet: TDataSet);
    procedure cdsRshAfterScroll(DataSet: TDataSet);
    procedure sBtnPrtClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure dbgrPrpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsPrpAfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    d_20111201 : TDateTime; // появился вид 8686 - ЕсвПрпБлнИнв
                            // (ЕСВ предприятия с Блн инвалидов)
    d_20130701 : TDateTime; // Изменился подход к декретным в ЕСВ
    d_20131001 : TDateTime; // Появился вид 6212 - ЕСВ с декретных
    bIsPrh, bIsRsh : boolean; // есть ли сведения по приходу и по расходу
    n_SmTtPrh, n_SmTtRsh : double;
    n_SvTabIndex : SmallInt;
    nCntDblClickOnPrh, nCntDblClickOnRsh : word;
    c_PSch, c_NmPSch, c_NrGO : ShortString;
    nPrcCmn, nPrcPps, nPrcCmnInv, nPrcPpsInv, {проценты удержаний в ЕсвПрп}
             nPrcBln, nPrcBlnInv, nPrcDkr, nPrcDkrInv, nPrcGPD : double;
    procedure SetFormStyle;
    procedure GetPrcEsvPrp(dDtPrc : TDateTime);
    procedure CreOpenCdsPrhRsh(dDtPrc : TDateTime; cPSch : ShortString);
    procedure CreOpenCdsPrhRsh811(dDtPrc : TDateTime; cPSch : ShortString);
    procedure DoSverka;
    procedure SetDbGridsColumnsVisible;
    procedure AddInCdsPrh(cPSch, cSchDt, cNmSchDt, cSchKt, cNmSchKt, cKEKV,
                   cUPoz : ShortString; nVnu, nKdIf :SmallInt; nSumma : double);
    procedure AddInCdsRsh(cPSch, cSchDt, cNmSchDt, cSchKt, cNmSchKt, cKEKV,
                   cUPoz : ShortString; nVnu, nKdIf :SmallInt; nSumma : double);
    procedure AddToCdsPrpESV(b811 : boolean);
    procedure RaschetPrpEsv;
    procedure KorrSmEsvPrp(b811 : boolean);
  public
    { Public declarations }
  end;

procedure AddZplGO(dDtPrc : TDateTime; cPSCH, cNmPSch, cNrGO : ShortString);

const SECTION = 'z_Mo2Gk';

var
  FormZpl2Gk: TFormZpl2Gk;

implementation

uses a_Const, a_Dm, a_Lib, z_Main, z_DM, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddZplGO(dDtPrc : TDateTime; cPSCH, cNmPSch, cNrGO : ShortString);
var nY, nM, nD : word; cCaption : ShortString;
begin
  if bIsFormZpl2Gk then begin
    if FormZpl2Gk.WindowState = wsMinimized then
      FormZpl2Gk.WindowState := wsNormal;
    FormZpl2Gk.SetFocus; end
  else begin
    FormZpl2Gk := TFormZpl2Gk.Create(Application);
    with FormZpl2Gk do begin
      d_20111201 := EncodeDate(2011,12, 1);
      d_20130701 := EncodeDate(2013, 7, 1);
      d_20131001 := EncodeDate(2013,10, 1);
      nCntDblClickOnPrh := 0;
      nCntDblClickOnRsh := 0;
      LabelCntSelRec.Caption := '';
      LabelSmSelRec.Caption  := '';
      d_DtPrc  := dDtPrc;
      c_PSch   := cPSch;
      c_NmPSch := cNmPSch;
      c_NrGO   := cNrGO;
      DecodeDate(dDtPrc, nY, nM, nD);
      cCaption := '"Зарплата" за ' + MesRus(nM) + ' ' +
                   IntToStr(nY) + ' г.  (Счёт ' + cPSch + ')';
      Caption  := cCaption;

      Panel2.Caption := 'Журнал-ордер № ' + cNrGO;
      GetPrcEsvPrp(dDtPrc);
      if (cPSch = '811') or (cPSch = '812') then
        CreOpenCdsPrhRsh811(dDtPrc, cPSch)
      else
        CreOpenCdsPrhRsh(dDtPrc, cPSch);
      if not bIsPrh and not bIsRsh then
        ShowMessage('Нет сведений по зарплате')
      else begin
        SetFormStyle;
        DoSverka;
        bIsFormZpl2Gk := true;
        tsCdsPrp.TabVisible := bFlagDbg;
        if n_SvTabIndex > 1 then
          n_SvTabIndex := 1;
        PageControl.TabIndex := n_SvTabIndex;
        SetDbGridsColumnsVisible;
        Show;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.CreOpenCdsPrhRsh(dDtPrc: TDateTime; cPSch : ShortString);
var nSumma, nSmTtPrh, nSmTtRsh,
                      nSmNach, nSmUdrg, nSmPdn, nSmSaldo : double;
    nKdIF, nVNU : SmallInt;
    cShUPoz, cKrSch, cKrrSchBU, cVidN, cSchDt, cSchKt, cKekv,
                                  cNmSchDt, cNmSchKt : ShortString;
    b811 : boolean;
begin
  b811 := false;
  with cdsPrh do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with cdsRsh do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with cdsPrp do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select p.*, u.KPr KdUPoz, u.SpecNaim UPoz ' +
            ' from Z_DelMe_GO(:dDtPrc, :cPSch) p ' +
            ' Left Outer Join KdUPoz u on u.Z_Schet = p.PSch ' +
            ' where not p.VidN in ("2723","2724","6623","6624")');
    SQL.Add('order by VNU, VidN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('cPSch').AsString    := cPSch;
    Open;
    if RecordCount > 0 then begin
      bIsRsh  := true;
      nSmNach := 0;  // Опредедить сначала сумму сальдо, чтобы потом ввести
      nSmUdrg := 0;  // её в подоходный и т.о. избавиться от ненулевого сальдо
      nSmPdn  := 0;
      while not Eof do begin
        cVidN   := FieldByName('VidN').AsString;
        if cVidN < '6000' then
          nSmNach := nSmNach + FieldByName('Summa').AsFloat
        else if cVidN < '8600' then begin
          if cVidN = '6001' then
            nSmPdn := nSmPdn - FieldByName('Summa').AsFloat;
          nSmUdrg := nSmUdrg - FieldByName('Summa').AsFloat;
        end;
        Next;
      end;
      nSmSaldo := MyRound(nSmNach - nSmUdrg, 2);
      First;
      while not Eof do begin  // Ищу "расчётные" значения удержаний в ЕсвПрп
        AddToCdsPrpESV(b811);
        Next;
      end;
      First;
      while not Eof do begin
        // Ordered by VNU, VidN, ShVidN, PSch, KdSpZ, SchBU, Vid_KdSpZ, Vid_SpZ,
        //                  Vid_SchDt, Vid_SchKt, Vid_Kekv, Sp_PF, KdKatP, PRR
        cVidN  := FieldByName('VidN').AsString;
        if (cVidN >= '8601') and (cVidN <= '8610') then // свПороги - пропускаю
          Next
        else begin
          nVnu   := FieldByName('VNU').AsInteger;
          cPSch  := FieldByName('PSch').AsString;
          cKrSch := FieldByName('Vid_SpZ').AsString;
          if (cVidN = '2601') or (cVidN = '2602') or
                                                (cVidN = '2604') then begin
            cSchDt := FieldByName('Vid_SpZ').AsString;
            cSchKt := '661'; end
          else if cVidN < '6000' then begin       // начисления
            cSchDt := FieldByName('PSch').AsString;
            cSchKt := '661'; end
          else if cVidN < '8600' then begin       // удержания
            cSchDt := '661';
            cSchKt := FieldByName('Vid_SpZ').AsString; end
          else begin
            cSchDt := FieldByName('PSch').AsString;
            cSchKt := FieldByName('Vid_SpZ').AsString;
          end;
          nSumma  := 0;
          nKdIF   := 0;
          while (FieldByName('VidN').AsString = cVidN) and not Eof do begin
            cKrrSchBU := FieldByName('Vid_SpZ').AsString;
            nKdIF     := FieldByName('KdUPoz').AsInteger;
            cShUPoz   := FieldByName('UPoz').AsString;
            cKekv     := FieldByName('Vid_Kekv').AsString;
            nSumma    := nSumma + FieldByName('Summa').AsFloat;
            Next;
          end;
          if cVidN = '6001' then
            nSumma := nSumma - nSmSaldo;
          cNmSchDt := '';
          cNmSchKt := '';
          if (cVidN < '6000') or (cVidN > '8600') then begin     // начисления и
            if (cVidN > '8600') then                 // взносы предприятия в ЕСВ
              nSumma := -nSumma;
            AddInCdsPrh(cPSch, cSchDt, cNmSchDt, cSchKt, cNmSchKt, cKEKV,
                        cShUPoz, nVnu, nKdIf, nSumma); end
          else                                                      // удержания
            AddInCdsRsh(cPSch, cSchDt, cNmSchDt, cSchKt, cNmSchKt, cKEKV,
                        cShUPoz, nVnu, nKdIf, -nSumma);
        end;
      end;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  RaschetPrpEsv;
  nSmTtPrh := 0;
  if cdsPrh.RecordCount > 0 then with cdsPrh do begin
    First;
    while not Eof do begin
      nSmTtPrh := nSmTtPrh + cdsPrhSumma.AsFloat;
      Next;
    end;
    n_SmTtPrh := nSmTtPrh;
    Append;
    cdsPrhVnu.AsInteger   := 99;
    cdsPrhSchDt.AsString  := 'Итого';
    cdsPrhUPoz.AsString   := 'Итого';
    cdsPrhSumma.AsFloat   := nSmTtPrh;
    Post;
    First;
    LabelPrh.Caption := 'Зарплата в кредит счетов  (записей: ' +
                                      IntToStr(RecordCount-1) + ')';
    if bFlagDbg then
      SaveToFile(cDirTemp + 'GkPrh.cds');
  end;
  nSmTtRsh := 0;
  if cdsRsh.RecordCount > 0 then with cdsRsh do begin
    First;
    while not Eof do begin
      nSmTtRsh := nSmTtRsh + cdsRshSumma.AsFloat;
      Next;
    end;
    n_SmTtRsh := nSmTtRsh;
    Append;
    cdsRshVnu.AsInteger   := 99;
    cdsRshSchDt.AsString  := 'Итого';
    cdsRshUPoz.AsString   := 'Итого';
    cdsRshSumma.AsFloat   := nSmTtRsh;
    Post;
    First;
    LabelRsh.Caption := 'Зарплата в кредит счетов  (записей: ' +
                                      IntToStr(RecordCount-1) + ')';
    if bFlagDbg then
      SaveToFile(cDirTemp + 'GkRsh.cds');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.AddToCdsPrpESV(b811 : boolean);
var cSpzVidN, cVidN, cVidNotes, cPSch, cSchBU, cSp_PF : ShortString;
    nVNU, nGrp, nKdKatP, nPRR : SmallInt;
    nSumma, nSmFor, nSmSvPrg, nSmTo : double;
begin  // Проходя по qryTmp, собрать выплаты и СверхПороги по кучкам для:
  // ЕсвПрпОбщ, ЕсвПрпППС, ЕсвПрпИнвОбщ, ЕсвПрпИнвППС, ЕсвПрпБлн, ЕсвПрпДгв
  // (все с предпр. (не с сотрудника)
  nVnu     := qryTmp.FieldByName('Vnu').AsInteger;
  nKdKatP  := qryTmp.FieldByName('KdKatP').AsInteger;
  cSpzVidN := qryTmp.FieldByName('VidN').AsString;
  nPRR     := qryTmp.FieldByName('PRR').AsInteger;
  cSp_PF   := qryTmp.FieldByName('Sp_PF').AsString;
  cPSch    := qryTmp.FieldByName('PSch').AsString;
  if b811 then
    cSchBU := qryTmp.FieldByName('SchBU').AsString
  else
    cSchBU := 'xxx';
  nSumma   := qryTmp.FieldByName('Summa').AsFloat;
  nSmFor   := 0;
  nSmSvPrg := 0;
  nSmTo    := 0;
  nGrp := 0;
  if (nVnu <= 1) and (cSp_PF = '1') {начисления} then begin
    if (cSpzVidN = '1005') or (cSpzVidN = '1006') or
                                      (cSpzVidN = '1008') {договоры} then begin
      nSmFor := nSmFor + nSumma;
      cVidN := '8691'; {для EsvПрп с ГПД}
      nGrp := 8;
      cVidNotes := '12.В ЕСВ ГПД'; end
    else if ((d_DtPrc < d_20130701) and (cSpzVidN > '2600') and
             (cSpzVidN < '2700') and (cSpzVidN <> '2602')) {больничные,
                                                 кроме декретных} or
            ((d_DtPrc >= d_20130701) and (cSpzVidN > '2600') and
                      (cSpzVidN < '2700')) {больничные с декретными} then begin
      if d_DtPrc < (d_20111201-35) then begin // до появл. вида 8686 - ЕсвПрпБлнИнв
        nSmFor := nSmFor + nSumma;  {-35 чтобы начать с ноября 2011}
        cVidN := '8685'; {для EsvПрп с Блн}
        nGrp := 7;
        cVidNotes := '10.В ЕСВ БлнДкр'; end
      else begin {появился вид 8686 - ЕсвПрпБлнИнв}
        if ((nPRR = 3) or (nPRR = 4)) and (d_DtPrc >= (d_20111201-35)) then begin
          nSmFor := nSmFor + nSumma; {-35 чтобы начать с ноября 2011}
          cVidN := '8686'; {для EsvПрп с БлнИнв}
          nGrp := 7;
          cVidNotes := '11.В ЕСВ БлнДкрИнв'; end
        else begin
          nSmFor := nSmFor + nSumma;
          cVidN := '8685'; {для EsvПрп с Блн}
          nGrp := 7;
          cVidNotes := '10.В ЕСВ БлнДкр';
        end;
      end; end
    else if (nKdKatP = 1) {ППС'овские} then begin
      if nPRR = 7 then begin
        nSmFor := nSmFor + nSumma;
        cVidN := '8684'; {для EsvПрп с ПпсИнв}
        nGrp := 6;
        cVidNotes := ' 9.В ЕСВ ППС инв.'; end
      else begin
        nSmFor := nSmFor + nSumma;
        cVidN := '8682'; {для EsvПрп с Ппс}
        nGrp := 5;
        cVidNotes := ' 7.В ЕСВ ППС';
      end; end
    else {общие} begin
      if nPRR = 7 then begin
        nSmFor := nSmFor + nSumma;
        cVidN := '8683'; {для EsvПрп с ОбщИнв}
        nGrp := 6;
        cVidNotes := ' 8.В ЕСВ общ.инв'; end
      else begin
        nSmFor := nSmFor + nSumma;
        cVidN := '8681'; {для EsvПрп с Общ}
        nGrp := 5;
        cVidNotes := ' 6.В ЕСВ общ.';
      end;
    end; end
  else if (nVnu = 5) {взносы в ЕСВ с предпр.} then begin
    if (cSpzVidN = '8691') then {Esv с ГПД} begin
      cVidN := cSpzVidN;
      nSmTo := nSumma;
      cVidNotes := '12.для ЕсвПрпГпд'; end
    else if (cSpzVidN = '8686') or
                    (cSpzVidN = '8688') then {Esv с БлнИнв или ДкрИнв} begin
      cVidN := '8686';
      nSmTo := nSumma;
      cVidNotes := '11.для ЕсвПрпБлнДкр'; end
    else if (cSpzVidN = '8685') or
                          (cSpzVidN = '8687') then {Esv с Блн или Дкр} begin
      cVidN := '8685';
      nSmTo := nSumma;
      cVidNotes := '10.для ЕсвПрпБлнДкрИнв'; end
    else if (cSpzVidN = '8684') then {Esv с ПпсИнв} begin
      cVidN := cSpzVidN;
      nSmTo := nSumma;
      cVidNotes := ' 9.для ЕсвПрпИнвПпс'; end
    else if (cSpzVidN = '8682') then {Esv с ППС} begin
      cVidN := cSpzVidN;
      nSmTo := nSumma;
      cVidNotes := ' 7.для ЕсвПрпПпс'; end
    else if (cSpzVidN = '8683') then {Esv с ПрпИнвОбщ} begin
      cVidN := cSpzVidN;
      nSmTo := nSumma;
      cVidNotes := ' 8.для ЕсвПрпИнвОбщ'; end
    else if (cSpzVidN = '8681') then {Esv с ПрпОбщ} begin
      cVidN := cSpzVidN;
      nSmTo := nSumma;
      cVidNotes := ' 6.для ЕсвПрпОбщ';
    end; end
  else if (nVnu = 6) {СверхПороги} then begin
    if (cSpzVidN = '8610') then {СвПрг с ГПД} begin
      nSmSvPrg := nSumma;
      cVidN := '8691';
      cVidNotes := '11.для ЕсвПрпГпд'; end
    else if (cSpzVidN = '8608') then {СвПрг с Блн} begin
      nSmSvPrg := nSumma;
      cVidN := '8685';
      cVidNotes := '10.для ЕсвПрпБлнДкр'; end
    else if (cSpzVidN = '8607') then {СвПрг с ППС} begin
      if nPRR = 7 then begin
        nSmSvPrg := nSumma;
        cVidN := '8684';
        cVidNotes := ' 9.для ЕсвПрпИнвПпс'; end
      else begin
        nSmSvPrg := nSumma;
        cVidN := '8682';
        cVidNotes := ' 7.для ЕсвПрпПпс';
      end; end
    else if (cSpzVidN = '8606') then {СвПрг с Общ} begin
      if nPRR = 7 then begin
        nSmSvPrg := nSumma;
        cVidN := '8683';
        cVidNotes := ' 8.для ЕсвПрпИнвОбщ'; end
      else begin
        nSmSvPrg := nSumma;
        cVidN := '8681';
        cVidNotes := ' 6.для ЕсвПрпОбщ';
      end;
    end;
  end;
  if (nSmFor <> 0) or (nSmTo <> 0) or (nSmSvPrg <> 0) then begin
    if not cdsPrp.Locate('PSch;SchBU;ForVidN',
                           VarArrayOf([cPSch, cSchBU, cVidN]), []) then begin
      cdsPrp.Append;
      cdsPrpGrp.AsInteger     := nGrp;
      cdsPrpPSch.AsString     := cPSch;
      cdsPrpSchBU.AsString    := cSchBU;
      cdsPrpForVidN.AsString  := cVidN;
      cdsPrpVidNotes.AsString := cVidNotes; end
    else
      cdsPrp.Edit;
    cdsPrpSmFor.AsFloat    := cdsPrpSmFor.AsFloat + nSmFor;
    cdsPrpSmSvPrg.AsFloat  := cdsPrpSmSvPrg.AsFloat + nSmSvPrg;
    cdsPrpSmToInBD.AsFloat := cdsPrpSmToInBD.AsFloat + nSmTo;
    cdsPrp.Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.CreOpenCdsPrhRsh811(dDtPrc: TDateTime;
                                                            cPSch: ShortString);
var nSumma, nSmTtPrh, nSmTtRsh,
                      nSmNach, nSmUdrg, nSmPdn, nSmSaldo : double;
    nKdIF, nVNU : SmallInt;
    cShUPoz, cVidN, cSchDt, cSchKt, cKekv, cNmSchDt, cNmSchKt : ShortString;
    cKrSch, cVidDbg, cSchBuDbg, cSchVid : ShortString;
    b811 : boolean;
begin
  b811 := true;
  with cdsPrh do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with cdsRsh do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with cdsPrp do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select p.*, u.KPr KdUPoz, u.SpecNaim UPoz ' +
            ' from Z_DelMe_GO(:dDtPrc, :cPSch) p ' +
            ' Left Outer Join KdUPoz u on u.Z_Schet = p.PSch ' +
            ' where not p.VidN in ("2723","2724","6623","6624")');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('cPSch').AsString    := cPSch;
    Open;
    if RecordCount > 0 then begin
      bIsRsh  := true;
      nSmNach := 0;
      nSmUdrg := 0;
      nSmPdn  := 0;
      while not Eof do begin
        cVidN   := FieldByName('VidN').AsString;
        if cVidN < '6000' then
          nSmNach := nSmNach + FieldByName('Summa').AsFloat
        else if cVidN < '8600' then begin
          if cVidN = '6001' then
            nSmPdn := nSmPdn - FieldByName('Summa').AsFloat;
          nSmUdrg := nSmUdrg - FieldByName('Summa').AsFloat;
        end;
        Next;
      end;
      nSmSaldo := MyRound(nSmNach - nSmUdrg, 2);
      First;
      while not Eof do begin
        AddToCdsPrpESV(b811);
        Next;
      end;
      First;
      while not Eof do begin
        cVidN   := FieldByName('VidN').AsString;
        if (cVidN >= '8601') and (cVidN <= '8610') then // свПороги - пропускаю
          Next
        else begin
          cPSch  := FieldByName('PSch').AsString;
          cKrSch := FieldByName('Vid_SpZ').AsString;
          nVnu   :=  FieldByName('Vnu').AsInteger;
          if (cVidN = '2601') or (cVidN = '2602') or (cVidN = '2604') then begin
            cSchDt := FieldByName('SchBU').AsString;
            cSchKt := '661';
            {nVnu := 0;} end
          else if cVidN < '6000' then begin
            cSchDt := FieldByName('SchBU').AsString;
            cSchKt := '661';
            {nVnu := 1;} end
          else if cVidN < '8600' then begin
            cSchDt := '661';
            cSchKt := FieldByName('Vid_SpZ').AsString;
            {nVnu := 2;} end
          else begin
            cSchDt := FieldByName('SchBU').AsString;
            cSchKt := FieldByName('Vid_SpZ').AsString;
            {nVnu := 4;}
          end;
          nSumma := 0;
          nKdIF  := 0;
          cVidDbg := FieldByName('VidN').AsString;
          cSchBuDbg := FieldByName('SchBU').AsString;
          cSchVid   := FieldByName('Vid_SpZ').AsString;
          if (cVidN < '6000') then begin
            while (FieldByName('VidN').AsString = cVidN) and
                  (FieldByName('SchBU').AsString = cSchDt) and not Eof do begin
              nKdIF   := FieldByName('KdUPoz').AsInteger;
              cShUPoz := FieldByName('UPoz').AsString;
              cKekv   := FieldByName('Vid_Kekv').AsString;
              nSumma  := nSumma + FieldByName('Summa').AsFloat;
              Next;
            end;
            cNmSchDt := '';
            cNmSchKt := '';
            AddInCdsPrh(cPSch, cSchDt, cNmSchDt, cSchKt, cNmSchKt, cKEKV,
                                             cShUPoz, nVnu, nKdIf, nSumma); end
          else if (cVidN > '6000') and (cVidN < '8600') then begin
            while (FieldByName('VidN').AsString = cVidN) and
                          (FieldByName('Vid_SpZ').AsString = cSchKt) and
                                                              not Eof do begin
              nKdIF   := FieldByName('KdUPoz').AsInteger;
              cShUPoz := FieldByName('UPoz').AsString;
              cKekv   := FieldByName('Vid_Kekv').AsString;
              nSumma  := nSumma + FieldByName('Summa').AsFloat;
              Next;
            end;
            cNmSchDt := '';
            cNmSchKt := '';
            if cVidN = '6001' then
              nSumma := nSumma - nSmSaldo;
            AddInCdsRsh(cPSch, cSchDt, cNmSchDt, cSchKt, cNmSchKt, cKEKV,
                                            cShUPoz, nVnu, nKdIf, -nSumma); end
          else if (cVidN > '8600') then begin  // в ЕСВ с предприятия
            while (FieldByName('VidN').AsString = cVidN) and
                 (FieldByName('SchBU').AsString = cSchDt) and not Eof do begin
              nKdIF   := FieldByName('KdUPoz').AsInteger;
              cShUPoz := FieldByName('UPoz').AsString;
              cKekv   := FieldByName('Vid_Kekv').AsString;
              nSumma  := nSumma + FieldByName('Summa').AsFloat;
              Next;
            end;
            cNmSchDt := '';
            cNmSchKt := '';
            AddInCdsPrh(cPSch, cSchDt, cNmSchDt, cSchKt, cNmSchKt, cKEKV,
                                              cShUPoz, nVnu, nKdIf, -nSumma);
          end;
        end;
      end;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
  end;
  RaschetPrpEsv;
  nSmTtPrh := 0;
  if cdsPrh.RecordCount > 0 then with cdsPrh do begin
    KorrSmEsvPrp(b811); // Корректировать суммы вЕсвПрп по cdsPrp
    First;
    while not Eof do begin
      nSmTtPrh := nSmTtPrh + cdsPrhSumma.AsFloat;
      Next;
    end;
    n_SmTtPrh := nSmTtPrh;
    Append;
    cdsPrhVnu.AsInteger   := 99;
    cdsPrhSchDt.AsString  := 'Итого';
    cdsPrhUPoz.AsString   := 'Итого';
    cdsPrhSumma.AsFloat   := nSmTtPrh;
    Post;
    First;
    LabelPrh.Caption := 'Зарплата в кредит счетов  (записей: ' +
                                      IntToStr(RecordCount-1) + ')';
    if bFlagDbg then
      SaveToFile(cDirTemp + 'GkPrh.cds');
  end;
  nSmTtRsh := 0;
  if cdsRsh.RecordCount > 0 then with cdsRsh do begin
    First;
    while not Eof do begin
      nSmTtRsh := nSmTtRsh + cdsRshSumma.AsFloat;
      Next;
    end;
    n_SmTtRsh := nSmTtRsh;
    Append;
    cdsRshVnu.AsInteger   := 99;
    cdsRshSchDt.AsString  := 'Итого';
    cdsRshUPoz.AsString   := 'Итого';
    cdsRshSumma.AsFloat   := nSmTtRsh;
    Post;
    First;
    LabelRsh.Caption := 'Зарплата в кредит счетов  (записей: ' +
                                      IntToStr(RecordCount-1) + ')';
    if bFlagDbg then
      SaveToFile(cDirTemp + 'GkRsh.cds');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.KorrSmEsvPrp(b811: boolean);
var cPSch, cSchDt, cSchKt : ShortString; nSmmDo, nSmm : double;
begin
  with cdsPrh do begin
    First;
    while not Eof do begin
      if cdsPrhSchKt.AsString = '651есв' then begin
        cPSch  := cdsPrhPSch.AsString;
        if b811 then
          cSchDt := cdsPrhSchDt.AsString
        else
          cSchDt := 'xxx';
        cSchKt := cdsPrhSchKt.AsString;
        nSmmDo := cdsPrhSumma.AsFloat;
        nSmm := 0;
        if cdsPrp.Locate('PSch;SchBU',
                       VarArrayOf([cPSch, cSchDt]), []) then begin
          while (cdsPrpPSch.AsString = cPSch) and
                 (cdsPrpSchBU.AsString = cSchDt) and not cdsPrp.Eof do begin
            nSmm := nSmm + cdsPrpSmToRasch.AsFloat;
            cdsPrp.Next;
          end;
        end;
        nSmm := -nSmm;
        if (nSmm <> 0) and (nSmm <> nSmmDo) then begin
//          Edit;
//          cdsPrhSumma.AsFloat := nSmm;
//          Post;
        end;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.AddInCdsPrh(cPSch, cSchDt, cNmSchDt, cSchKt,
                                     cNmSchKt, cKEKV, cUPoz: ShortString;
                                         nVnu, nKdIf: SmallInt; nSumma: double);
begin
  with cdsPrh do begin
    if not Locate('VNU;SchDt;SchKt;KEKV;KdIF',
                VarArrayOf([nVnu, cSchDt, cSchKt, cKekv, nKdIF]), []) then begin
      Append;
      cdsPrhVNU.AsInteger    := nVnu;
      cdsPrhPSch.AsString    := cPSch;
      cdsPrhSchDt.AsString   := cSchDt;
      cNmSchDt := Form_Dm.SchBu2NmSbu(cSChDt);
      cdsPrhNmSchDt.AsString := cNmSchDt;
      cdsPrhSchKt.AsString   := cSchKt;
      cNmSchkt := Form_Dm.SchBu2NmSbu(cSChkt);
      cdsPrhNmSchKt.AsString := cNmSchKt;
      cdsPrhKekv.AsString    := cKekv;
      cdsPrhUPoz.AsString    := cUPoz;
      cdsPrhKdIF.AsInteger   := nKdIF; end
    else
      Edit;
    cdsPrhSumma.AsFloat := cdsPrhSumma.AsFloat + nSumma;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.AddInCdsRsh(cPSch, cSchDt, cNmSchDt, cSchKt,
                                     cNmSchKt, cKEKV, cUPoz: ShortString;
                                         nVnu, nKdIf: SmallInt; nSumma: double);
begin
  with cdsRsh do begin
    if not Locate('VNU;SchDt;SchKt;KEKV;KdIF',
                VarArrayOf([nVnu, cSchDt, cSchKt, cKekv, nKdIF]), []) then begin
      Append;
      cdsRshVNU.AsInteger    := nVnu;
      cdsRshPSch.AsString    := cPSch;
      cdsRshSchDt.AsString   := cSchDt;
      cNmSchDt := Form_Dm.SchBu2NmSbu(cSChDt);
      cdsRshNmSchDt.AsString := cNmSchDt;
      cdsRshSchKt.AsString   := cSchKt;
      cNmSchkt := Form_Dm.SchBu2NmSbu(cSChkt);
      cdsRshNmSchKt.AsString := cNmSchKt;
      cdsRshKekv.AsString    := cKekv;
      cdsRshUPoz.AsString    := cUPoz;
      cdsRshKdIF.AsInteger   := nKdIF; end
    else
      Edit;
    cdsRshSumma.AsFloat := cdsRshSumma.AsFloat + nSumma;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 565);
    Width  := ReadInteger(SECTION, 'wW', 500);
    n_SvTabIndex := ReadInteger(SECTION, 'n_SvTabIndex', 0);
    sBtnStayOnTop.Down := true;   // ReadBool(SECTION, 'bStOnTp', true);
    Free;
  end;
  sBtnStayOnTop.Visible := bFlagDbg;
  sBtnDetails.Visible   := bFlagDbg;
  if FileExists(cDirVids + 'AdZp2Pr.vid') then
    dbgrPrh.Columns.LoadFromFile(cDirVids + 'AdZp2Pr.vid');
  if FileExists(cDirVids + 'AdZp2Rs.vid') then
    dbgrRsh.Columns.LoadFromFile(cDirVids + 'AdZp2Rs.vid');
  if FileExists(cDirVids + 'AdZpPrp.vid') then
    dbgrPrp.Columns.LoadFromFile(cDirVids + 'AdZpPrp.vid');
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormZpl2Gk := false;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPrh.Columns.SaveToFile(cDirVids + 'AdZp2Pr.vid');
  dbgrRsh.Columns.SaveToFile(cDirVids + 'AdZp2Rs.vid');
  dbgrPrp.Columns.SaveToFile(cDirVids + 'AdZpPrp.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'n_SvTabIndex', PageControl.TabIndex);
    WriteBool(SECTION, 'bStOnTp', sBtnStayOnTop.Down);
    Free;
  end;
  bIsFormZpl2Gk := false;
  Action := caFree;;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.bBtnCancelClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.sBtnStayOnTopClick(Sender: TObject);
begin
  SetFormStyle;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.SetFormStyle;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.dbgrPrhDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrPrh.Canvas do begin
    if not (gdFocused in State) then begin
      if (cFldNm = 'SUMMA') then
        Brush.Color := clCream;
    end;
    if cdsPrhMyFld.AsString = 'OK' then
      Font.Color := clBlue
    else if cdsPrhMyFld.AsString = 'Smm' then
      Font.Color := clFuchsia;
    if cdsPrhSchDt.AsString = 'Итого' then
      Brush.Color := clBtnFace;
  end;
  dbgrPrh.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.dbgrRshDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrRsh.Canvas do begin
    if not (gdFocused in State) then begin
      if (cFldNm = 'SUMMA') then
        Brush.Color := clCream;
//    end;
    if cdsRshMyFld.AsString = 'OK' then
      Font.Color := clBlue
    else if cdsRshMyFld.AsString = 'Smm' then
      Font.Color := clFuchsia;
    if cdsRshSchDt.AsString = 'Итого' then
      Brush.Color := clBtnFace;
    end;  //
  end;
  dbgrRsh.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.DoSverka;
var nUPoz : SmallInt;
    cSchDt, cSchKt, cShStZ : ShortString;
    nSmZpl, nSmGKn : double; mSvPlace : TBookMark;
begin
  with qryObDt do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMain;
    SQL.Add('Select * from get_ObDt (:dDtPrc) order by NR');
    ParamByName('dDtPrc').AsDateTime := d_DtPrc;
    Open
  end;
  if (cdsPrh.RecordCount > 0) then with cdsPrh do begin
    mSvPlace := GetBookMark;
    DisableControls;
    First;
    while not Eof do begin
      cSchDt := cdsPrhSchDt.AsString;
      cSchKt := cdsPrhSchKt.AsString;
      cShStZ := cdsPrhKEKV.AsString;
      nUPoz  := cdsPrhKdIF.AsInteger;
      //nSmZpl := RoundTo(cdsPrhSumma.AsFloat, -2);
      if qryObDt.Locate('SCHET_DBT;SCHET_KRT;KODZ_DBT;KPR',
                              VarArrayOf([cSchDt, cSchKt, cShStZ, nUPoz]),
                                                                []) then begin
        //cSchKt := cdsPrhSchKt.AsString;
        //cShStZ := cdsPrhKEKV.AsString;
        //nUPoz  := cdsPrhKdIF.AsInteger;
        nSmZpl := RoundTo(cdsPrhSumma.AsFloat, -2);
        nSmGKn := RoundTo(FormZpl2Gk.qryObDtSum_Dbt.AsFloat, -2);
        Edit;
        if nSmGKn <> nSmZpl then
          cdsPrhMyFld.AsString := 'Smm'
        else
          cdsPrhMyFld.AsString := 'OK';
        Post;
      end;
      Next;
    end;
    GotoBookmark(mSvPlace);
    FreeBookMark(mSvPlace);
    EnableControls;
  end;
  if (cdsRsh.RecordCount > 0) then with cdsRsh do begin
    mSvPlace := GetBookMark;
    DisableControls;
    First;
    while not Eof do begin
      cSchDt := cdsRshSchDt.AsString;
      cSchKt := cdsRshSchKt.AsString;
      cShStZ := cdsRshKEKV.AsString;
      nUPoz  := cdsRshKdIF.AsInteger;
      nSmZpl := RoundTo(cdsRshSumma.AsFloat, -2);
      if qryObDt.Locate('SCHET_DBT;SCHET_KRT;KODZ_DBT;KPR',
                                VarArrayOf([cSchDt, cSchKt, cShStZ, nUPoz]),
                                                                []) then begin
        nSmGKn := RoundTo(qryObDtSum_Dbt.AsFloat, -2);
        Edit;
        if nSmGKn <> nSmZpl then begin
          cdsRshMyFld.AsString := 'Smm'; end
        else
          cdsRshMyFld.AsString := 'OK';
        Post;
      end;
      Next;
    end;
    GotoBookmark(mSvPlace);
    FreeBookMark(mSvPlace);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.SetDbGridsColumnsVisible;
var i : SmallInt; cFldNm : ShortString;
begin
  for i := 0 to dbgrPrh.Columns.Count-1 do begin
    cFldNm := UpperCase(dbgrPrh.Columns[i].FieldName);
    if (cFldNm = 'KDKRRSBU') or (cFldNm = 'CNT') or (cFldNm = 'LVL') or
                                                   (cFldNm = 'SCH_PSCH') then
      dbgrPrh.Columns[i].Visible := bFlagDbg;
  end;
  for i := 0 to dbgrRsh.Columns.Count-1 do begin
    cFldNm := UpperCase(dbgrRsh.Columns[i].FieldName);
    if (cFldNm = 'KDKRRSBU') or (cFldNm = 'CNT') or (cFldNm = 'LVL') or
                      (cFldNm = 'VIDSCHDT') or (cFldNm = 'VIDSCHKT') or
                                                   (cFldNm = 'SCH_PSCH') then
      dbgrRsh.Columns[i].Visible := bFlagDbg;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.GetCntSmSelRecPrh;
var i, nCntSelRec : SmallInt; nSmSelRec : double;
begin
  nCntSelRec := 0;
  nSmSelRec  := 0;
  if dbgrPrh.SelectedRows.Count > 0 then begin
    with DbgrPrh.DataSource.DataSet do begin
      for i := 0 to dbgrPrh.SelectedRows.Count-1 do begin
        GotoBookmark(Pointer(dbgrPrh.SelectedRows.Items[i]));
        Inc(nCntSelRec);
        nSmSelRec := nSmSelRec + cdsPrhSumma.AsFloat;
      end;
    end;
    LabelCntSelRec.Caption := 'Выделено записей: ' + IntToStr(nCntSelRec);
    LabelSmSelRec.Caption  := 'На сумму: ' +
                                        FloatToStrF(nSmSelRec, ffNumber, 18, 2);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.cdsPrhAfterScroll(DataSet: TDataSet);
begin
  nCntDblClickOnPrh := 0;
  LabelCntSelRec.Caption := '';
  LabelSmSelRec.Caption  := '';
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.cdsRshAfterScroll(DataSet: TDataSet);
begin
  nCntDblClickOnRsh := 0;
  LabelCntSelRec.Caption := '';
  LabelSmSelRec.Caption  := '';
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.dbgrRshKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    GetCntSmSelRecRsh;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.dbgrPrhKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    GetCntSmSelRecPrh;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.GetCntSmSelRecRsh;
var i, nCntSelRec : SmallInt; nSmSelRec : double;
begin
  nCntSelRec := 0;
  nSmSelRec  := 0;
  if dbgrRsh.SelectedRows.Count > 0 then begin
    with DbgrRsh.DataSource.DataSet do begin
      for i := 0 to dbgrRsh.SelectedRows.Count-1 do begin
        GotoBookmark(Pointer(dbgrRsh.SelectedRows.Items[i]));
        Inc(nCntSelRec);
        nSmSelRec := nSmSelRec + cdsRshSumma.AsFloat;
      end;
    end;
    LabelCntSelRec.Caption := 'Выделено записей: ' + IntToStr(nCntSelRec);
    LabelSmSelRec.Caption  := 'На сумму: ' +
                                        FloatToStrF(nSmSelRec, ffNumber, 18, 2);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.sBtnPrtClick(Sender: TObject);
begin                                                     {z_CmnPrt}
  F6_PrtAddZpl(d_DtPrc, c_PSch, c_NmPSch, c_NrGO,  cdsPrh, cdsRsh);
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.PageControlChange(Sender: TObject);
begin
  nCntDblClickOnPrh := 0;
  nCntDblClickOnRsh := 0;
  LabelCntSelRec.Caption := '';
  LabelSmSelRec.Caption  := '';
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.RaschetPrpEsv;
var cForVidN : ShortString; nPrcEsv : double;
begin
  nPrcEsv := 0;
  with cdsPrp do begin
    First;
    while not Eof do begin
      cForVidN := cdsPrpForVidN.AsString;
      if cForVidN = '8681' then
        nPrcEsv := nPrcCmn
      else if cForVidN = '8682' then
        nPrcEsv := nPrcPps
      else if cForVidN = '8683' then
        nPrcEsv := nPrcCmnInv
      else if cForVidN = '8684' then
        nPrcEsv := nPrcPpsInv
      else if cForVidN = '8685' then
        nPrcEsv := nPrcBln
      else if cForVidN = '8686' then
        nPrcEsv := nPrcBlnInv
      else if cForVidN = '8687' then
        nPrcEsv := nPrcDkr
      else if cForVidN = '8688' then
        nPrcEsv := nPrcDkrInv
      else if cForVidN = '8691' then
        nPrcEsv := nPrcGpd;
      Edit;
      cdsPrpPrcToEsv.AsFloat := nPrcEsv;
        cdsPrpSmToRasch.AsFloat :=
                  -MyRound((cdsPrpSmFor.AsFloat - cdsPrpSmSvPrg.AsFloat) *
                                                         nPrcEsv / 100, 2);
      Post;
      Next;
    end;
    First;
    //if bFlagDbg then
    //  SaveToFile(cDirTemp + 'Prp' + c_PSch + '.cds')
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.GetPrcEsvPrp(dDtPrc: TDateTime);
begin
  nPrcCmn    := 0;
  nPrcPps    := 0;
  nPrcCmnInv := 0;
  nPrcPpsInv := 0;
  nPrcBln    := 0;
  nPrcBlnInv := 0;
  nPrcDkr    := 0;
  nPrcDkrInv := 0;
  nPrcGPD    := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from Z_TEsvP where dtBeg <= :dDtPrc ' +
            ' order by DtBeg desc');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    if RecordCount > 0 then begin
      nPrcCmn    := FieldByName ('PrcCmn').AsFloat;
      nPrcPps    := nPrcCmn;
      nPrcCmnInv := FieldByName ('PrcInv').AsFloat;
      nPrcPpsInv := nPrcCmnInv;
      nPrcBln    := FieldByName ('PrcBln').AsFloat;
      nPrcBlnInv := FieldByName ('PrcBlnInv').AsFloat;
      nPrcDkr    := FieldByName ('PrcDekr').AsFloat;
      nPrcDkrInv := FieldByName ('PrcDekrInv').AsFloat;
      nPrcGPD    := FieldByName ('PrcGpd').AsFloat;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.dbgrPrpKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    GetCntSmSelRecPrp;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.cdsPrpAfterScroll(DataSet: TDataSet);
begin
  nCntDblClickOnPrh := 0;
  LabelCntSelRec.Caption := '';
  LabelSmSelRec.Caption  := '';
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.GetCntSmSelRecPrp;
var i, nCntSelRec : SmallInt; nSmInBD, nSmRasch : double;
begin
  nCntSelRec := 0;
  nSmInBD  := 0;
  nSmRasch := 0;
  if dbgrPrp.SelectedRows.Count > 0 then begin
    with DbgrPrp.DataSource.DataSet do begin
      for i := 0 to dbgrPrp.SelectedRows.Count-1 do begin
        GotoBookmark(Pointer(dbgrPrp.SelectedRows.Items[i]));
        Inc(nCntSelRec);
        nSmInBD  := nSmInBD  + cdsPrpSmToInBD.AsFloat;
        nSmRasch := nSmRasch + cdsPrpSmToRasch.AsFloat;
      end;
    end;
    LabelCntSelRec.Caption := 'Выделено записей: ' + IntToStr(nCntSelRec);
    LabelSmSelRec.Caption  := 'См в БД: ' +
                                        FloatToStrF(nSmInBD, ffNumber, 18, 2) +
                         ';  СмРасч: ' + FloatToStrF(nSmRasch, ffNumber, 18, 2);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpl2Gk.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где  нужно,  пользуйтесь  контекстными  меню');
end;

end.
