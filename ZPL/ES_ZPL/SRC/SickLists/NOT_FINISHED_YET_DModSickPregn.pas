unit DModSickPregn;

interface

uses
  SysUtils, Classes, DBTables, DB, BlnDkrCommon;

type
  TDmSickPregn = class(TDataModule)
    QryVBln: TQuery;
    QryVBlnNR: TIntegerField;
    QryVBlnKDSPS: TSmallintField;
    QryVBlnDTPROC: TDateTimeField;
    QryVBlnTABN: TIntegerField;
    QryVBlnALGRASCH: TSmallintField;
    QryVBlnNCHBUDMES: TStringField;
    QryVBlnSERLIST: TStringField;
    QryVBlnNRLIST: TStringField;
    QryVBlnDTLIST: TDateTimeField;
    QryVBlnDTBEG: TDateTimeField;
    QryVBlnDTEND: TDateTimeField;
    QryVBlnCNTDAYS: TSmallintField;
    QryVBlnCNTCHAS: TFloatField;
    QryVBlnVIDN: TStringField;
    QryVBlnShVidN: TStringField;
    QryVBlnPROCOPL: TFloatField;
    QryVBlnKDTEMU: TSmallintField;
    QryVBlnNmTemu: TStringField;
    QryVBlnKDOBJ: TSmallintField;
    QryVBlnShObj: TStringField;
    QryVBlnKDKATP: TSmallintField;
    QryVBlnShKatP: TStringField;
    QryVBlnNOTES: TStringField;
    QryVBlnSMSRDN: TFloatField;
    QryVBlnSPEC_NR: TIntegerField;
    QryVBlnSMBLN: TFloatField;
    QryVBlnKDSPZ: TSmallintField;
    QryVBlnSPZ: TStringField;
    QryVBlnDAY5FIRST: TStringField;
    QryVBlnLISTCONT: TStringField;
    QryVBlnPREDSPEC_NR: TIntegerField;
    QryVBlnPredNr: TStringField;
    QryVBlnPredDt: TDateField;
    QryVBlnLNKSTOTP: TIntegerField;
    QryVBlnPRBLN: TSmallintField;
    QryVBlnNmPrBln: TStringField;
    QryVBlnSHEMA: TSmallintField;
    QryVBlnOLDKDVIDN: TSmallintField;
    QryVBlnSTGCMN: TFloatField;
    QryVBlnSTG12: TFloatField;
    QryVBlnDTZ: TDateTimeField;
    QryVBlnNRZ: TIntegerField;
    QryVBlnDIGITAL: TStringField;
    UpdVBln: TUpdateSQL;
    QryRBln: TQuery;
    QryRBlnNR: TIntegerField;
    QryRBlnTABN: TIntegerField;
    QryRBlnSPEC_NR: TIntegerField;
    QryRBlnZAMESGOD: TDateTimeField;
    QryRBlnRusMesGod: TStringField;
    QryRBlnSMZARABOTKA: TFloatField;
    QryRBlnCNTDAYS: TFloatField;
    QryRBlnKOEFZP: TFloatField;
    QryRBlnSmZpKoef: TFloatField;
    QryRBlnKDSPS: TSmallintField;
    QryRBlnMYFOXFLD: TSmallintField;
    QryRBlnNMPOKAZ: TStringField;
    QryRBlnVIDN: TStringField;
    QryRBlnShVidN: TStringField;
    QryRBlnSUMPROC: TFloatField;
    QryRBlnSP: TStringField;
    QryRBlnSMVZACHET: TFloatField;
    QryRBlnSM_SVM: TFloatField;
    QryRBlnCNTDAYS_SVM: TFloatField;
    QryRBlnSMVZACHET_SVM: TFloatField;
    QryRBlnSMVZACHET_CMN: TFloatField;
    UpdRBln: TUpdateSQL;
    QryViNu: TQuery;
    QryViNuVIDN: TStringField;
    QryViNuSHVIDN: TStringField;
    QryViNuTABN: TIntegerField;
    QryViNuKDSPS: TSmallintField;
    QryViNuPSCH: TStringField;
    QryViNuLVL: TSmallintField;
    QryViNuSCHBU: TStringField;
    QryViNuDTPROC: TDateTimeField;
    QryViNuZAMESGOD: TDateTimeField;
    QryViNuCHAS: TFloatField;
    QryViNuSUMMA: TFloatField;
    QryViNuVID_KDSPZ: TSmallintField;
    QryViNuVID_SPZ: TStringField;
    QryViNuVID_KDSCHDT: TSmallintField;
    QryViNuVID_SCHDT: TStringField;
    QryViNuVID_KDSCHKT: TSmallintField;
    QryViNuVID_SCHKT: TStringField;
    QryViNuVID_KEKV: TStringField;
    QryViNuNR: TIntegerField;
    QryViNuDT_BEG: TDateTimeField;
    QryViNuDT_END: TDateTimeField;
    QryViNuKDOBJ: TSmallintField;
    QryViNuKDKATP: TSmallintField;
    QryViNuKDSPZ: TSmallintField;
    QryViNuPDN: TSmallintField;
    QryViNuOZN_PILG: TStringField;
    QryViNuNOTES: TStringField;
    QryViNuPRR: TSmallintField;
    QryViNuPRPV: TSmallintField;
    QryViNuKTO: TSmallintField;
    QryViNuPRKR: TSmallintField;
    QryViNuMYNOTES: TStringField;
    QryViNuSPECPS: TIntegerField;
    QryViNuSPEC_NR: TIntegerField;
    QryViNuDTVDPV: TDateTimeField;
    QryViNuNRVDPV: TIntegerField;
    QryViNuKDBNK: TSmallintField;
    QryViNuSTORN: TStringField;
    QryViNuZP13: TStringField;
    QryViNuOTP: TStringField;
    QryViNuBLN: TStringField;
    QryViNuDKR: TStringField;
    QryViNuOTPUSKN: TStringField;
    QryViNuBOLNIC: TStringField;
    QryViNuSPRM: TStringField;
    QryViNuSSRK: TStringField;
    QryViNuCPRM: TStringField;
    QryViNuDETI: TStringField;
    QryViNuDETIM: TStringField;
    QryViNuDETIK: TStringField;
    QryViNuDETIG: TStringField;
    QryViNuIND: TStringField;
    QryViNuDHD: TStringField;
    QryViNuOKLFND: TStringField;
    QryViNuCBUDG: TStringField;
    QryViNuSNDB: TStringField;
    QryViNuSPDN: TStringField;
    QryViNuSWSB: TStringField;
    QryViNuSPRF: TStringField;
    QryViNuSPENS: TStringField;
    QryViNuSALIM: TStringField;
    QryViNuCNDB: TStringField;
    QryViNuSSOCSTRAH: TStringField;
    QryViNuSBZR: TStringField;
    QryViNuSP_PF: TStringField;
    QryViNuSP_FSTVP: TStringField;
    QryViNuSP_FSNV: TStringField;
    QryViNuSP_FZ: TStringField;
    QryViNuSOVM: TStringField;
    QryViNuSPOV: TStringField;
    QryViNuNdbDtBeg: TDateTimeField;
    QryViNuNdbDtEnd: TDateTimeField;
    TblRBln: TTable;
    TblRBlnDtProc: TDateField;
    TblRBlnVIDN: TStringField;
    TblRBlnShVidN: TStringField;
    TblRBlnDtBeg: TDateField;
    TblRBlnDtEnd: TDateField;
    TblRBlnCntDays: TSmallintField;
    TblRBlnCntChas: TFloatField;
    TblRBlnSmm: TFloatField;
    TblRBlnSmmSovm: TFloatField;
    TblRBlnNotes: TStringField;
    TblRBlnSpec_NR: TIntegerField;
    QryPeek: TQuery;
    QryOtkl: TQuery;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure QryVBlnDTBEGChange(Sender: TField);
    procedure QryVBlnDTENDChange(Sender: TField);
  private
    ErrList: TStringList;

    procedure OpenQryVBln(SpecNR: integer);
    procedure OpenQryRBln(SpecNR: integer);

    function Get12Mnth: boolean;
    function GetAllSps: boolean;

    procedure Set12Mnth(Value: boolean);
    procedure SetAllSps(Value: boolean);

    procedure AutoComplete;
    function CheckData: boolean;
    procedure SaveQryRBln;
    procedure AddTblRBlnToOtkl;
    procedure WriteLog;
  public
    constructor Create(SpecNr: integer); reintroduce;

    procedure AddNewSickList(TabN: integer; VidN: ShortString;
      KdSpz: integer; Use12Mnth, UsrListAll, Digital: boolean);
    procedure EditSickList;
    procedure Save;

    function GetTabN: integer;
    function GetFamIO: ShortString;
    function GetPrevSpecNr: integer;
    function GetAverages: TSrednDnevn;
    function GetErrors: TStringList;

    property Use12Mnth: boolean read Get12Mnth write Set12Mnth;
    property AllSps: boolean read GetAllSps write SetAllSps;
  end;

implementation

uses
  Math, a_Const, z_Dm, CustDateUtils, Logger, QryUtils;

{$R *.dfm}

//------------------------------------------------------------------------------
constructor TDmSickPregn.Create(SpecNr: integer);
begin
  OpenQryVBln(SpecNr);
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.DataModuleCreate(Sender: TObject);
begin
  ErrList := TStringList.Create;
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.DataModuleDestroy(Sender: TObject);
begin
  ErrList.Free;
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.AddNewSickList(
  TabN: integer; VidN: ShortString; KdSpz: integer;
  Use12Mnth, UsrListAll, Digital: boolean);
var
  DtBeg, DtEnd: TDateTime;
begin
  with QryVBln do begin
    Append;

    QryVBlnTabN.AsInteger := TabN;
    QryVBlnVidN.AsString  := VidN;

    if Digital then
      QryVBlnDIGITAL.AsString := 'Y'
    else
      QryVBlnDIGITAL.AsString := 'N';

    with TBlnUtils do
      QryVBlnPrBln.AsInteger :=
        GetBlnReason(DigitalToBlnType(QryVBlnDIGITAL.AsString), PREGNANCY);

    if UsrListAll then
      QryVBlnKdSps.AsInteger := 0
    else
      QryVBlnKdSps.AsInteger := gl_nAppKdSpsUsr;

    with TDateUtils do begin
      DtBeg := ThisMonth;
      DtEnd := EndOfMonth(DtBeg);
    end;

    QryVBlnDtList.AsDateTime := DtBeg;
    QryVBlnNrList.AsString   := 'xxx';

    QryVBlnDtProc.AsDateTime := DtBeg;
    QryVBlnDtBeg.AsDateTime  := DtBeg;
    QryVBlnDtEnd.AsDateTime  := DtEnd;

    QryVBlnListCont.AsString := '0';

    if TQryUtils.PeekPere(QryPeek, TabN, QryVBlnDtBeg.AsDateTime, false) then
    with QryPeek do begin
      qryVBlnKdObj.AsInteger    := FieldByName('KdObj').AsInteger;
      qryVBlnKdKatP.AsInteger   := FieldByName('KdKatP').AsInteger;
      qryVBlnKdSPZ.AsInteger    := FieldByName('KdSpz').AsInteger;
    end;

    qryVBlnProcOpl.AsFloat    := 100;
    qryVBlnNchBudMes.AsString := '0';
  end;
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.EditSickList;
begin
  QryVBln.Edit;
end;

//------------------------------------------------------------------------------
function TDmSickPregn.GetTabN: integer;
begin
end;

//------------------------------------------------------------------------------
function TDmSickPregn.GetFamIO: ShortString;
begin
end;

//------------------------------------------------------------------------------
function TDmSickPregn.GetPrevSpecNr: integer;
begin
  Result := QryVBln.FieldByName('PredSpec_Nr').AsInteger;
end;

//------------------------------------------------------------------------------
function TDmSickPregn.GetAverages: TSrednDnevn;
begin
end;

//------------------------------------------------------------------------------
function TDmSickPregn.GetErrors: TStringList;
begin
  Result := ErrList;
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.OpenQryVBln(SpecNR: integer);
begin
  TQryUtils.InitQuery(qryVBln);

  with QryVBln do begin
    SQL.Add(
      'select * ' +
      'from Z_VBln ' +
      'where Spec_Nr = :SpecNr');
    ParamByName('SpecNr').AsInteger := SpecNR;
    Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.OpenQryRBln(SpecNR: integer);
begin
  TQryUtils.InitQuery(qryRBln);
  with qryRBln do begin
    SQL.Add(
      'select r.*, Cast(-1 As SmallInt) As MyFoxFld ' +
      'from Z_RBln r ' +
      'where r.Spec_NR = :SpecNR ' +
      'order by NR');
    ParamByName('SpecNR').AsInteger := SpecNR;
    Open;
  end;
end;

//------------------------------------------------------------------------------
function TDmSickPregn.Get12Mnth: boolean;
begin
  Result := QryVBln.FieldByName('AlgRasch').AsInteger = 12;
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.Set12Mnth(Value: boolean);
begin
  if Value then
    QryVBlnAlgRasch.AsInteger := 12
  else
    QryVBln.FieldByName('AlgRasch').AsInteger := 1;
end;

//------------------------------------------------------------------------------
function TDmSickPregn.GetAllSps: boolean;
begin
end;


//------------------------------------------------------------------------------
procedure TDmSickPregn.SetAllSps(Value: boolean);
begin
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.Save;

begin
  AutoComplete;
  CheckData;

  if ErrList.Count = 0 then begin
    QryVBln.Post; // Становится известным значение SpecNR

    if QryVBlnListCont.AsString <> '1' then
      SaveQryRBln;

    AddTblRBlnToOtkl;

    WriteLog;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.WriteLog;
var
  Msg: ShortString;
begin
  Msg := 'TabN = ' + QryVBlnTabN.AsString +
    ', VidN = ' + QryVBlnVidN.AsString +
    ', DtProc = ' + QryVBlnDtProc.AsString +
    ', DtBeg = ' + QryVBlnDtBeg.AsString +
    ', CntDays = ' + QryVBlnCntDays.AsString +
    ', SrDnevn = ' + QryVBlnSmSrDn.AsString;

  Log.Write('Ввод декретных', 'Z_vBln', QryVBlnTabN.AsInteger, Msg);
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.AutoComplete;
var
  Days, Hours: double;
begin
  QryVBlnSmBln.AsFloat := QryVBlnCntDays.AsInteger *
    RoundTo(QryVBlnSmSrdn.AsFloat * QryVBlnProcOpl.AsFloat / 100, -2);

  QryVBlnShema.AsInteger := 2;

end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.SaveQryRBln;
begin
  with QryRBln do begin
    DisableControls;

    First;
    while not Eof do begin
      Edit;
      QryRBlnSpec_NR.AsInteger := QryVBlnSpec_Nr.AsInteger;
      Post;

      Next;
    end;

    if qryRBln.UpdatesPending then
      qryRBln.ApplyUpdates;

    EnableControls;
  end; {with}
end; {SaveQryRBln}

//------------------------------------------------------------------------------
function TDmSickPregn.CheckData : boolean;
begin
  Result := true;

  ErrList.Clear;

  if QryVBlnTabN.AsInteger = 0 then
    ErrList.Add('Не заполнено поле "Табельный номер"');
  if QryVBlnPrBln.AsInteger = 0 then
    ErrList.Add('Не указана причина нетрудоспособности');
  if (QryVBlnDtBeg.AsDateTime = 0) or (QryVBlnDtBeg.AsDateTime > QryVBlnDtEnd.AsDateTime) then
    ErrList.Add('Неправильная дата начала/окончания больничного');
  if (Trim(QryVBlnNrList.Text) = '') then
    ErrList.Add('Нет номера б/листка');
  if QryVBlnProcOpl.AsFloat <= 0 then
    ErrList.Add('Не указан процент оплаты');
  if (QryVBlnListCont.AsString = '1') and (QryVBlnPredSpec_Nr.AsInteger = 0) then
    ErrList.Add('Не выбран предыдущий больничный лист');
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.QryVBlnDTBEGChange(Sender: TField);
var
  Days, Hours: double;
begin
  DmMain.GetCntWrkDaysBln(Sender.AsDateTime, QryVBlnDtEnd.AsDateTime,
    Days, Hours, 'dkr');

  QryVBlnCntDays.AsInteger := Round(Days);
  QryVBlnCntChas.AsFloat   := Hours;
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.QryVBlnDTENDChange(Sender: TField);
var
  Days, Hours: double;
begin
  DmMain.GetCntWrkDaysBln(QryVBlnDtBeg.AsDateTime, Sender.AsDateTime,
    Days, Hours, 'dkr');

  QryVBlnCntDays.AsInteger := Round(Days);
  QryVBlnCntChas.AsFloat   := Hours;
end;

//------------------------------------------------------------------------------
procedure TDmSickPregn.AddTblRBlnToOtkl;
var
  i, j, PrKr : word;
  Sum: double;
  Sovm: string;

  procedure WriteToOtkl;
  begin
    with QryOtkl do begin
      ParamByName('TabN').AsInteger := QryVBlnTabN.AsInteger;
      ParamByName('cVidN').AsString := TblRBln.FieldByName('VidN').AsString;

      ParamByName('DtProc').AsDateTime := QryVBlnDTPROC.AsDateTime;
      ParamByName('ZaMesGod').AsDateTime :=
        TDateUtils.BeginOfMonth(TblRBln.FieldByName('DtBeg').AsDateTime);
      ParamByName('Dt_Beg').AsDateTime :=
        TblRBln.FieldByName('DtBeg').AsDateTime;
      ParamByName('Dt_End').AsDateTime :=
        TblRBln.FieldByName('DtEnd').AsDateTime;

      ParamByName('Summa').AsFloat := Sum;
      ParamByName('Chas').AsFloat := TblRBlnCntChas.AsFloat;

      ParamByName('Sovm').AsString := Sovm;

      ParamByName('KdObj').AsInteger := QryVBlnKdObj.AsInteger;
      ParamByName('KdKatP').AsInteger := QryVBlnKdKatP.AsInteger;
      ParamByName('KdSPZ').AsInteger := QryVBln.FieldByName('KdSPZ').AsInteger;
      ParamByName('KdSps').AsInteger := QryVBlnKDSPS.AsInteger;

      ParamByName('Spec_Nr').AsInteger := QryVBlnSpec_Nr.AsInteger;

      ParamByName('Notes').AsString :=
        'SpNR=' + IntToStr(QryVBlnSpec_Nr.AsInteger);

      ParamByName('Pdn').AsInteger := 1;
      ParamByName('Kto').AsInteger := 0;
      ParamByName('PrPv').AsInteger := 1;
      ParamByName('PrKr').AsInteger := PrKr;

      ExecSQL;
    end;
  end;

begin
  with QryOtkl do begin
    TQryUtils.InitQuery(QryOtkl);
    SQL.Add(
      'insert into Z_Otkl (KdSps, DTPROC, TABN, KDOBJ, ' +
            ' KDKATP, DT_BEG, DT_END, VIDN, PDN, CHAS, ' +
            ' SUMMA, KDSPZ, NOTES, PRPV, KTO, PRKR, ' +
            ' ZAMESGOD, SPEC_NR, SOVM) ');
    SQL.Add(
      'values (:KdSps, :DdProc, :TabN, :KdObj, ' +
            ' :KdKatP, :Dt_Beg, :Dt_End, :VidN, :PdN, ' +
            ' :Chas, :Summa, :KdSpz, :Notes, ' +
            ' :PrPv, :Kto, :PrKr, :ZaMesGod, :Spec_Nr, :Sovm) ');
    Prepare;
  end;

  with tblRBln do begin
    First;
    i := 0;
    while not Eof do begin
      for j := 1 to 2 do begin
        if j = 1 then begin
          Sum := FieldByName('Smm').AsFloat;
          Sovm := '';
        end else begin
          Sum := FieldByName('SmmSovm').AsFloat;
          Sovm := 'Y';
        end;

        if (j = 1) or (j = 2) and (Sum <> 0) then begin
          Inc(i);
          if (i = 1) and (qryVBlnDtBeg.AsDateTime > dDtBegNextMes) and
                          dbChBoxNchBudMes.Checked and
                            (FieldByName('DtBeg').AsDateTime > dDtBegNextMes) then
            nPrKr := 1  // делать начисления от 01-ММ-ГГГГ до начала больничных
          else
            nPrKr := 0;

          WriteToOtkl;
        end;
      end;
      Next;
    end;
  end;
  with qryTmp do begin
    if Prepared then
      UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
  if qryStorn.Active and qryStorn.UpdatesPending then
    qryStorn.ApplyUpdates;
end;
end.
