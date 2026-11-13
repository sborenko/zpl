unit VidNUtils;

interface

const

  VIDN_WAR_DAY_SUM = '1208';

  PAYTYPE_PREGN = '2602';

  VIDN_UNKNOWN = '5002';
  VIDN_REMOVED = '5006';
  VIDN_VACAT_NOPAY_PRINCIPAL = '5005';
  VIDN_VACAT_NOPAY_SUPPLMNT = '5008';
  VIDN_WAR_PRINCIPAL = '5009';
  VIDN_WAR_SUPPLMNT = '5010';

  // ≈—¬ с сотрудников
  VIDN_ESV_EMPL_CMN = '6201';
  VIDN_ESV_EMPL_PPS = '6206';
  VIDN_ESV_EMPL_BLN = '6211';
  VIDN_ESV_EMPL_DKR = '6212';
  VIDN_ESV_EMPL_CPH = '6216';

  // —верхпороги
  VIDN_SVP_CMN = '8606';
  VIDN_SVP_PPS = '8607';
  VIDN_SVP_BLN = '8608';
  VIDN_SVP_DKR = '8609';
  VIDN_SVP_CPH = '8610';

  // ≈—¬ с предпри€ти€
  VIDN_ESV_PRP_CMN      = '8681';
  VIDN_ESV_PRP_PPS      = '8682';
  VIDN_ESV_PRP_CMN_INV  = '8683';
  VIDN_ESV_PRP_PPS_INV  = '8684';
  VIDN_ESV_PRP_BLN      = '8685';
  VIDN_ESV_PRP_BLN_INV  = '8686';
  VIDN_ESV_PRP_DKR      = '8687';
  VIDN_ESV_PRP_DKR_INV  = '8688';
  VIDN_ESV_PRP_CPH      = '8691';

  // ≈—¬ и ћин«ѕ предпри€ти€
  VIDN_ESV_MIN_ZP_CMN  = '8711';
  VIDN_ESV_MIN_ZP_PPS  = '8712';
  VIDN_SUM_DO_MIN_ZP13 = '8713';
  VIDN_ESV_MIN_ZP_BLN  = '8715';
  VIDN_ESV_MIN_ZP_DKR  = '8716';
  VIDN_SUM_DO_MIN_ZP17 = '8717';

type
  // “ип рабочего времени начислени€/удержани€, подлежащего обработке
  TVidAffects = (VID_FULL_TIME, VID_PART_TIME, VID_BOTH);

  TVidNUtils = class
  public
    class function VidIsOtp(VidN: string): boolean;
    class function VidIsOtpSovm(VidN: string): boolean;
    class function VidIsOtpOsn(VidN: string): boolean;

    class function VidIsCmnDeduction(VidN: string): boolean;
    class function VidIsPPSDeduction(VidN: string): boolean;
    class function VidIsBlnDeduction(VidN: string): boolean;
    class function VidIsDkrDeduction(VidN: string): boolean;
    class function VidIsCPHDeduction(VidN: string): boolean;

    class function VidNoPayAffects(
      PayType: ShortString; PartTime: boolean): TVidAffects;
  end;

implementation

//------------------------------------------------------------------------------
// явл€етс€ ли вид отпуском вообще.
//------------------------------------------------------------------------------
class function TVidNUtils.VidIsOtp(VidN: string): boolean;
begin
  Result := (VidN = '1810') or (VidN > '2400') and (VidN < '2500') or
    (VidN = '5005') or (VidN = '5008') or (VidN = '5011') or (VidN = '5012');
end;

//------------------------------------------------------------------------------
// явл€етс€ ли вид отпуском совместитетельским.
//------------------------------------------------------------------------------
class function TVidNUtils.VidIsOtpSovm(VidN: string): boolean;
begin
  Result := (VidN = '2409') or (VidN = '2410') or (VidN = '5008');
end;

//------------------------------------------------------------------------------
// явл€етс€ ли вид отпуском основным.
//------------------------------------------------------------------------------
class function TVidNUtils.VidIsOtpOsn(VidN: string): boolean;
begin
  Result := VidIsOtp(VidN) and not VidIsOtpSovm(VidN);
end;

//------------------------------------------------------------------------------
// явл€етс€ ли вид удержанием общим.
//------------------------------------------------------------------------------
class function TVidNUtils.VidIsCmnDeduction(VidN: string): boolean;
begin
  Result := (VidN = VIDN_ESV_EMPL_CMN) or (VidN = VIDN_SVP_CMN) or
    (VidN = VIDN_ESV_PRP_CMN) or (VidN = VIDN_ESV_PRP_CMN_INV);
end;

//------------------------------------------------------------------------------
// явл€етс€ ли вид удержанием ѕѕ—.
//------------------------------------------------------------------------------
class function TVidNUtils.VidIsPPSDeduction(VidN: string): boolean;
begin
  Result := (VidN = VIDN_ESV_EMPL_PPS) or (VidN = VIDN_SVP_PPS) or
    (VidN = VIDN_ESV_PRP_PPS) or (VidN = VIDN_ESV_PRP_PPS_INV);
end;

//------------------------------------------------------------------------------
// явл€етс€ ли вид удержанием с больничных.
//------------------------------------------------------------------------------
class function TVidNUtils.VidIsBlnDeduction(VidN: string): boolean;
begin
  Result := (VidN = VIDN_ESV_EMPL_BLN) or (VidN = VIDN_SVP_BLN) or
    (VidN = VIDN_ESV_PRP_BLN) or (VidN = VIDN_ESV_PRP_BLN_INV);
end;

//------------------------------------------------------------------------------
// явл€етс€ ли вид удержанием с декретных.
//------------------------------------------------------------------------------
class function TVidNUtils.VidIsDkrDeduction(VidN: string): boolean;
begin
  Result := (VidN = VIDN_ESV_EMPL_DKR) or (VidN = VIDN_SVP_DKR) or
    (VidN = VIDN_ESV_PRP_DKR) or (VidN = VIDN_ESV_PRP_DKR_INV);
end;

//------------------------------------------------------------------------------
// явл€етс€ ли вид удержанием с договоров.
//------------------------------------------------------------------------------
class function TVidNUtils.VidIsCPHDeduction(VidN: string): boolean;
begin
  Result := (VidN = VIDN_ESV_EMPL_CPH) or (VidN = VIDN_SVP_CPH) or
    (VidN = VIDN_ESV_PRP_CPH);
end;

//------------------------------------------------------------------------------
// ¬ли€ет ли вид на обработку значений основных типов, совмест., или обоих.
//------------------------------------------------------------------------------
class function TVidNUtils.VidNoPayAffects(
  PayType: ShortString; PartTime: boolean): TVidAffects;
begin
  if PartTime then
    Result := VID_PART_TIME
  else if (PayType = VIDN_UNKNOWN) or (PayType = VIDN_REMOVED) then
    Result := VID_BOTH
  else
    Result := VID_FULL_TIME;
end;

end.
