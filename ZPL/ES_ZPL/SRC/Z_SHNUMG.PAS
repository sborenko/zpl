unit Z_ShNuMG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Buttons, Grids, DBGrids, DBTables,
  Math, ExtCtrls;

type
  TFormShowNuMG = class(TForm)
    QryNu: TQuery;
    DsrcNU: TDataSource;
    dbgrNU: TDBGrid;
    QryNuNR: TIntegerField;
    QryNuDTPROC: TDateTimeField;
    QryNuTABN: TIntegerField;
    QryNuKDOBJ: TSmallintField;
    QryNuKDKATP: TSmallintField;
    QryNuDT_BEG: TDateTimeField;
    QryNuDT_END: TDateTimeField;
    QryNuPDN: TSmallintField;
    QryNuCHAS: TFloatField;
    QryNuSUMMA: TFloatField;
    QryNuSPZ: TStringField;
    QryNuNOTES: TStringField;
    QryNuPRR: TSmallintField;
    QryNuPRPV: TSmallintField;
    QryNuKTO: TSmallintField;
    QryNuPRKR: TSmallintField;
    QryNuZAMESGOD: TDateTimeField;
    QryNuSPEC_NR: TIntegerField;
    QryNuVIDN: TStringField;
    QryNuSHVIDN: TStringField;
    QryNuKDSPZ: TSmallintField;
    QryNuSHOBJ: TStringField;
    QryNuSHKATP: TStringField;
    Panel1: TPanel;
    sBtnStayOnTop: TSpeedButton;
    bBtnClose: TBitBtn;
    LabelTotals: TLabel;
    QryNuPSCH: TStringField;
    QryNuSCHBU: TStringField;
    QryNuNMSCH: TStringField;
    QryNuNMVIDN: TStringField;
    QryNuOLDKDVIDN: TSmallintField;
    QryNuVID_KDSPZ: TSmallintField;
    QryNuKEKV: TStringField;
    QryNuKDSPS: TSmallintField;
    QryNuMYNOTES: TStringField;
    QryNuSPECPS: TIntegerField;
    QryNuOLDKDOBJ: TSmallintField;
    QryNuZP13: TStringField;
    QryNuOTP: TStringField;
    QryNuBLN: TStringField;
    QryNuOTPUSKN: TStringField;
    QryNuBOLNIC: TStringField;
    QryNuSPRM: TStringField;
    QryNuCPRM: TStringField;
    QryNuDETI: TStringField;
    QryNuDETIM: TStringField;
    QryNuDETIK: TStringField;
    QryNuDETIG: TStringField;
    QryNuIND: TStringField;
    QryNuDHD: TStringField;
    QryNuOKLFND: TStringField;
    QryNuCBUDG: TStringField;
    QryNuSNDB: TStringField;
    QryNuSPDN: TStringField;
    QryNuSPRF: TStringField;
    QryNuSPENS: TStringField;
    QryNuSALIM: TStringField;
    QryNuCNDB: TStringField;
    QryNuSSOCSTRAH: TStringField;
    QryNuSBZR: TStringField;
    QryNuSP_PF: TStringField;
    QryNuSP_FSTVP: TStringField;
    QryNuSP_FSNV: TStringField;
    QryNuSP_FZ: TStringField;
    QryNuSOVM: TStringField;
    QryNuSPOV: TStringField;
    QryNuKDSCHDT: TSmallintField;
    QryNuSCHDT: TStringField;
    QryNuKDSCHKT: TSmallintField;
    QryNuSCHKT: TStringField;
    QryNuDKR: TStringField;
    QryNuSSRK: TStringField;
    PanelMsg: TPanel;
    MemoMsg: TMemo;
    sBtnMsg: TSpeedButton;
    SplitMsg: TSplitter;
    sBtnNdbSvm: TSpeedButton;
    QryNuNdbDtBeg: TDateTimeField;
    QryNuNdbDtEnd: TDateTimeField;
    QryNuNuSovm: TStringField;
    ChBoxSepDetails: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBtnCloseClick(Sender: TObject);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure ShowWorkDaysInMG(dZaMesGod : TDateTime);
    procedure dbgrNUEnter(Sender: TObject);
    procedure dbgrNUExit(Sender: TObject);
    procedure dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QryNuCalcFields(DataSet: TDataSet);
    procedure sBtnMsgClick(Sender: TObject);
    procedure sBtnNdbSvmClick(Sender: TObject);
    procedure ChBoxSepDetailsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CallMode: ShortString;
    CallDtProc: TDateTime;
    CallDsrc: TDataSource;
    
    bCallFromOtp, bCallFromBln, bCallFromDkr : boolean;
    b_OtpIsSovm : boolean; // Отпуск совместителям (пока только вид 2409)
    b_Kalendarn : boolean; // Отпуск в календарных днях
    d_DtLastPrm : TDateTime;
    n_TabN : integer;
    
    procedure OpenQryNU(cCase : ShortString; nTabN : integer;
                        dMaxDtProc : TDateTime; MasterDataSource : TDataSource);
    procedure SetDbgrNuColumns;
    procedure SetStayOnTop;
  end;

procedure ShowNuZaMGOtp(cFamIO: string; nTabN: integer;
  dDtLastPrm, dMaxDtProc: TDateTime; MasterDataSource: TDataSource;
  bKalendarn, bOtpIsSovm: boolean);

procedure ShowNuZaMGBln(cFamIO: string; nTabN: integer; dMaxDtProc: TDateTime;
  MasterDataSource: TDataSource; bKalendarn: boolean);

procedure ShowNuZaMGDkr(cFamIO: string; nTabN: integer; dMaxDtProc: TDateTime;
  MasterDataSource: TDataSource; bKalendarn: boolean);

const SECTION = 'Z_ShNuMG';

var
  FormShowNuMG: TFormShowNuMG;

implementation

uses
  a_Const, a_DM, a_Lib, DModUsrSetts, z_Dm, z_EOtp, z_EBln, z_EDkr, z_Main,
  z_NdbSvm, QryLib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowNuZaMGOtp(cFamIO : string; nTabN : integer;
                                          dDtLastPrm, dMaxDtProc : TDateTime;
                                              MasterDataSource : TDataSource;
                                              bKalendarn, bOtpIsSovm : boolean);
begin
  if not bIsFormShowNuMGOtp then begin
    FormShowNuMG := TFormShowNuMG.Create(Application);
    bIsFormShowNuMGOtp := true;
    with FormShowNuMG do begin
      n_TabN      := nTabN;
      d_DtLastPrm := dDtLastPrm;
      b_Kalendarn := bKalendarn;
      b_OtpIsSovm := bOtpIsSovm;
      bCallFromOtp := true;
      bCallFromBln := false;
      bCallFromDkr := false;
      Caption := cFamIO + ' [заработки за прошлые месяцы для отпускных]';

      CallMode := 'Otp';
      CallDtProc := dMaxDtProc;
      CallDsrc := MasterDataSource;
      ChBoxSepDetails.Checked := DMUsrSetts.SepVacatDetails;
      OpenQryNU(CallMode, n_TabN, CallDtProc, CallDsrc);

      SetDbgrNuColumns;
      ShowWorkDaysInMG(qryNU.FieldByName('ZaMesGod').asDateTime);
      dbgrNU.Hint := '"Жирным" выделены виды, включаемые в расчет суммы для ' +
      'отпускных. "Бледным" - не включаемые. Зеленым - "совместительские" виды.' +
      ' Желтым - "бюджетные" виды.';
      Show;
    end; end
  else begin
    if FormShowNuMG.WindowState = wsMinimized then
      FormShowNuMG.WindowState := wsNormal;
    FormShowNuMG.SetFocus;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure ShowNuZaMGBln(cFamIO : string; nTabN : integer;
                      dMaxDtProc : TDateTime; MasterDataSource : TDataSource;
                                                          bKalendarn : boolean);
begin
  if not bIsFormShowNuMGBln then begin
    FormShowNuMG := TFormShowNuMG.Create(Application);
    bIsFormShowNuMGBln := true;
    with FormShowNuMG do begin
      n_TabN      := nTabN;
      b_Kalendarn := bKalendarn;
      b_OtpIsSovm := false;
      bCallFromBln := true;
      bCallFromOtp := false;
      bCallFromDkr := false;
      Caption := cFamIO + ' [заработки за прошлые месяцы для больничных]';

      CallMode := 'Bln';
      CallDtProc := dMaxDtProc;
      CallDsrc := MasterDataSource;
      ChBoxSepDetails.Checked := DMUsrSetts.SepVacatDetails;
      OpenQryNU(CallMode, n_TabN, CallDtProc, CallDsrc);

      SetDbgrNuColumns;
      ShowWorkDaysInMG(qryNU.FieldByName('ZaMesGod').AsDateTime);
      dbgrNU.Hint := '"Жирным" выделены виды, включаемые в расчет суммы для ' +
      'больничных. "Бледным" - не включаемые. Зеленым - "совместительские" виды.' +
      ' Желтым - "бюджетные" виды.';
      Show;
    end; end
  else begin
    if FormShowNuMG.WindowState = wsMinimized then
      FormShowNuMG.WindowState := wsNormal;
    FormShowNuMG.SetFocus;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure ShowNuZaMGDkr(cFamIO : string; nTabN : integer;
                       dMaxDtProc : TDateTime; MasterDataSource : TDataSource;
                                                          bKalendarn : boolean);
begin
  if not Assigned(FormShowNuMG) then begin
    FormShowNuMG := TFormShowNuMG.Create(Application);

    with FormShowNuMG do begin
      n_TabN      := nTabN;
      b_Kalendarn := bKalendarn;
      b_OtpIsSovm := false;
      bCallFromBln := false;
      bCallFromOtp := false;
      bCallFromDkr := true;
      Caption := cFamIO + ' [заработки за прошлые месяцы для декретных]';

      CallMode := 'Dkr';
      CallDtProc := dMaxDtProc;
      CallDsrc := MasterDataSource;
      ChBoxSepDetails.Checked := DMUsrSetts.SepVacatDetails;
      OpenQryNU(CallMode, n_TabN, CallDtProc, CallDsrc);

      SetDbgrNuColumns;
      ShowWorkDaysInMG(qryNU.FieldByName('ZaMesGod').asDateTime);
      dbgrNU.Hint := '"Жирным" выделены виды, включаемые в расчет суммы для ' +
      'декретных. "Бледным" - не включаемые. Зеленым - "совместительские" виды.' +
      ' Желтым - "бюджетные" виды.';
      Show;
    end; end
  else begin
    if FormShowNuMG.WindowState = wsMinimized then
      FormShowNuMG.WindowState := wsNormal;
    FormShowNuMG.SetFocus;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormShowNuMG.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 250);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 280);
    Width  := ReadInteger(SECTION, 'wW', 435);
    PanelMsg.Height := ReadInteger(SECTION, 'PnlMsgH', 74);
    sBtnStayOnTop.Down := ReadBool(SECTION, 'bStOnTop', true);
    PanelMsg.Visible := ReadBool(SECTION, 'bPnlMsg', false);
    SplitMsg.Visible := PanelMsg.Visible;
    Free;
  end;
  if FileExists(cDirVids + 'zsNuMG_06.vid') then
    dbgrNU.Columns.LoadFromFile(cDirVids + 'zsNuMG_06.vid');

  SetStayOnTop;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormShowNuMG.FormShow(Sender: TObject);
begin
  ChBoxSepDetails.Visible := CallMode = 'Otp';
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TFormShowNuMG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DmUsrSetts.SepVacatDetails := ChBoxSepDetails.Checked;

  dbgrNU.Columns.SaveToFile(cDirVids + 'zsNuMG_06.vid');
  if bCallFromOtp then
    bIsFormShowNuMGOtp := false
  else if bCallFromBln then
    bIsFormShowNuMGBln := false
  else if bCallFromDkr then
    FormShowNuMG := nil;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'PnlMsgH', PanelMsg.Height);
    WriteBool(SECTION, 'bPnlMsg', PanelMsg.Visible);
    WriteBool(SECTION, 'bStOnTop', sBtnStayOnTop.Down);
    Free;
  end;
  Action := caFree;
end;

//------------------------------------------------------------------------------
procedure TFormShowNuMG.OpenQryNU(
  cCase: ShortString;
  nTabN: integer;
  dMaxDtProc: TDateTime;
  MasterDataSource: TDataSource);
begin
  QryUtils.InitQuery(QryNu);

  with QryNu, SQL do begin
    DataSource := MasterDataSource;

    Add(
      'select ob.ShObj, ' +
        'kp.ShKatP, ' +
        'nu.* ' +
      'from ViNu_Main nu ' +
        'left join z_Kdobj ob on ob.KdObj = nu.KdObj ' +
        'left join z_KatPers kp on kp.KdKatP = nu.KdKatP ' +
      'where (nu.TabN = :nTabN) ' +
        'and (nu.ZaMesGod = :ZaMesGod) ' +
        'and VidN < "6000" '
    );

    if (CallMode = 'Otp') and ChBoxSepDetails.Checked then
      if b_OtpIsSovm then
        Add('and (Sovm = "1" or NuSovm = "1" or NuSovm = "Y") ')
      else
        Add('and not (Sovm = "1" or NuSovm = "1" or NuSovm = "Y") ');

    Add(
      'order by DtProc, VidN'
    );
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.ShowWorkDaysInMG(dZaMesGod : TDateTime);
var nY, nM, nD : word; dDtBegM, dDtEndM : TDateTime;
    nCntWorkDays, nCntWorkChas, nSmTot : double;  cMsg, cVidN : ShortString;
begin
  DecodeDate(dZaMesGod, nY, nM, nD);
  dDtBegM := EncodeDate(nY, nM, 1);
  dDtEndM := myLastDOM(dDtBegM);
  if bCallFromOtp then begin
    if b_Kalendarn then begin
      dDtBegM := Max(dDtBegM, d_DtLastPrm);
      DmMain.GetCntWrkDaysOtp(dDtBegM, dDtEndM,     // переписать на Otp
                               nCntWorkDays, nCntWorkChas, 'otk'); end
    else
      DmMain.GetCntWrkDaysOtp(dDtBegM, dDtEndM,     // переписать на Otp
                               nCntWorkDays, nCntWorkChas, 'otp'); end
  else if bCallFromBln then
      DmMain.GetCntWrkDaysBln(dDtBegM, dDtEndM,
                               nCntWorkDays, nCntWorkChas, 'blk')
  else if bCallFromDkr then
    DmMain.GetCntWrkDaysBln(dDtBegM, dDtEndM,
                               nCntWorkDays, nCntWorkChas, 'dkr');
  with qryNU do begin
    DisableControls;
    First;
    nSmTot := 0;
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      if bCallFromOtp and (FieldByName('Otp').AsString = '1') then begin
        if b_OtpIsSovm and (FieldByName('Sovm').AsString = '1') then
          nSmTot := nSmTot + RoundTo(FieldByName('Summa').AsFloat, -2)
        else if not b_OtpIsSovm and
                        (FieldByName('Sovm').IsNull or
                            (FieldByName('Sovm').AsString = '0')) then
          nSmTot := nSmTot + RoundTo(FieldByName('Summa').AsFloat, -2); end
      else if bCallFromBln and ((FieldByName('Bln').AsString = '1') or
               (b_Kalendarn and (cVidN > '2400') and (cVidN < '2500'))) then
        nSmTot := nSmTot + RoundTo(FieldByName('Summa').AsFloat, -2)
      else if bCallFromDkr and (FieldByName('DKR').AsString = '1') then
        nSmTot := nSmTot + RoundTo(FieldByName('Summa').AsFloat, -2);
      Next;
    end;
    First;
    EnableControls;
  end;
  cMsg := AnsiUpperCase(MesRus(nM)) + '. ';
  if b_Kalendarn then
    cMsg := cMsg + 'Календарных '
  else
    cMsg := cMsg + 'Рабочих ';
  cMsg := cMsg + 'дней: ' + FloatToStr(nCntWorkDays) +
                   '. Сумма заработка: ' + FloatToStrF(nSmTot, ffFixed, 18, 2);
  LabelTotals.Caption := cMsg;
  if bCallFromOtp and b_OtpIsSovm then
    LabelTotals.Font.Color := clBlue
  else
    LabelTotals.Font.Color := clWindowText;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.SetDbgrNuColumns;
var i : word; cFldNm : ShortString;
begin
  for i := 0 to dbgrNu.Columns.Count-1 do begin
    with dbgrNU.Columns[i] do begin
      cFldNm := UpperCase(FieldName);
      if (cFldNm = 'SOVM') or (cFldNm = 'OTP') or (cFldNm = 'BLN') or
                                                      (cFldNm = 'DKR') then
        Visible := bFlagDbg;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.bBtnCloseClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.sBtnStayOnTopClick(Sender: TObject);
begin
  SetStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.SetStayOnTop;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.dbgrNUEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.dbgrNUExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.dbgrNUDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm, cVidN : ShortString;
begin
  cVidN := qryNU.FieldByName('VidN').AsString;
  with dbgrNu.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if (bCallFromBln and ( (qryNU.FieldByName('BLN').AsString = '1') or
               ((cVidN >= '2400') and (cVidN < '2500')))) or
         (bCallFromDkr and (qryNU.FieldByName('DKR').AsString = '1')) or
         (bCallFromOtp and (qryNU.FieldByName('OTP').AsString = '1')) then
        Font.Style := [fsBold]
      else
        Font.Style := [];
      if (bCallFromOtp or bCallFromBln or bCallFromDkr)
        and ((qryNU.FieldByName('Sovm').AsString = '1')
          or (qryNU.FieldByName('NuSovm').AsString = '1')
          or (qryNU.FieldByName('NuSovm').AsString = 'Y'))
      then
        Font.Color := clTeal
      else
        Font.Color := clWindowText;
      if (qryNU.FieldByName('CBudg').AsString = '1') and
           ((cFldNm = 'VIDN') or (cFldNm = 'SHVIDN') or (cFldNm = 'CBUDG')) then
        Brush.Color := clYellow;
    end;
  end;
  dbgrNu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.QryNuCalcFields(DataSet: TDataSet);
var nNdbSpecNR : integer;  dNdbDtBeg, dNdbDtEnd : TDateTime;
begin
  if not qryNuKdSpZ.IsNull then
    qryNuSPZ.AsString := DmMain.KdSbu2SchBU(qryNuKdSpZ.AsInteger);
  if (qryNuSovm.AsString = '1') and (qryNuSpec_NR.AsInteger > 0) then begin
    nNdbSpecNR := qryNuSpec_NR.AsInteger;
    if DmMain.GetNdbDates(nNdbSpecNR, dNdbDtBeg, dNdbDtEnd) then begin
      qryNuNdbDtBeg.AsDateTime := dNdbDtBeg;
      qryNuNdbDtEnd.AsDateTime := dNdbDtEnd;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.sBtnMsgClick(Sender: TObject);
begin
  SplitMsg.Visible := not SplitMsg.Visible;
  PanelMsg.Visible := not PanelMsg.Visible;
end;
//------------------------------------------------------------------------------
procedure TFormShowNuMG.sBtnNdbSvmClick(Sender: TObject);
begin
  ShwNadbSovm(n_TabN);   {z_NdbSvm}
end;

//------------------------------------------------------------------------------
procedure TFormShowNuMG.ChBoxSepDetailsClick(Sender: TObject);
begin
  if QryNu.Active then begin
    QryNu.Close;
    OpenQryNU(CallMode, n_TabN, CallDtProc, CallDsrc);
  end;
end;

end.
