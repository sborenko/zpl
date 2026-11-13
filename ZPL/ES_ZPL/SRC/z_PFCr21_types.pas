unit z_PFCr21_types;

interface

type

  TRecD5T5 = record
    PERIOD_M,
    PERIOD_Y: word;
    // UKR_GROMAD,
    ZO,
    DOG_CPH: integer;
    NUMIDENT,
    LN,
    NM,
    FTN: string;
    START_DT,
    END_DT: TDateTime;
    // NRM_DT,
    PID_ZV,
    // PNR,
    // PROF,
    // POS,
    PID: string;
    // VZV: string;
    VS,
    PIR: integer
    // OZN: integer;
  end;

  TRecD1T6 = record
    PERIOD_M,
    PERIOD_Y: word;
    UKR_GROMAD,
    ST: integer;
    NUMIDENT,
    LN,
    NM,
    FTN: string;
    ZO,
    PAY_TP,
    PAY_MNTH,
    PAY_YEAR,
    KD_NP,
    KD_NZP,
    KD_PTV,
    KD_VP: integer;
    SUM_TOTAL,
    SUM_MAX,
    SUM_DIFF,
    SUM_INS,
    SUM_NARAH: double;
    OTK,
    EXP,
    NRC,
    NRM,
    OZN: integer;
  end;

  TRecTotals = record
    nSmCmn,
    nSmDCmn,
    nSmPmCmn,
    nSmPmDCmn,
    nSmPCmn,
    nSvPCmn,
    nSmPrpCmn,

    nSmPps,
    nSmDPps,
    nSmPmPps,
    nSmPmDPps,
    nSmPPps,
    nSvPPps,
    nSmPrpPps,

    nSmOtp,
    nSmDOtp,
    nSmPOtp,

    nSmOtpCmn,
    nSmDOtpCmn,
    nSmPrpInvCmn,
    nSmOtpPps,
    nSmDOtpPps,
    nSmPrpInvPps,

    nSmBln,
    nSmDBln,
    nSmPBln,
    nSvPBln,
    nSmPrpBln,

    nSmDekr,
    nSmDDekr,
    nSmPDekr,
    nSvPDekr,
    nSmPrpDekr,

    nSmDgv,
    nSmDDgv,
    nSmPDgv,
    nSvPDgv,
    nSmPrpDgv,

    // nSmPmPrpInvCmn,

    nSmVozvr,
    nSmDVozvr,
    nSmPVozvr,

    nSm1210,

    nSm8711,
    nSm8712,
    nSm8713,
    nSm8715,
    nSm8716,
    nSm8717: double;

    cPidZv: string;

    nKdNpBln,
    nKdNpDkr,
    nKdNzp,
    nKdPTV: integer;

    bIsWrk,
    bIsInv,
    bIsBln,
    bIsOtp,
    bIsDekr,
    bIsOtp3,
    bIsOtp6,
    bIsPps: boolean;

    nOTK: integer;
    nNPC: integer;

    dDtBDekr, dDtEDekr,
    dDtBOtp3, dDtEOtp3,
    dDtBOtp6, dDtEOtp6,
    dDPR, dDZR: TDateTime;
  end;

function InitTotals: TRecTotals;
  
implementation

//------------------------------------------------------------------------------
function InitTotals: TRecTotals;
begin
  Result.nOTK := 0;
  Result.nNPC := 0;

  Result.nSm1210 := 0;
  Result.nSmCmn := 0;
  Result.nSmDCmn := 0;
  Result.nSmOtpCmn := 0;
  Result.nSmDOtpCmn := 0;
  Result.nSmPCmn := 0;
  Result.nSvPCmn := 0;
  Result.nSmPrpCmn := 0;
  Result.nSmPrpInvCmn := 0;
  Result.nSmPps := 0;
  Result.nSmDPps := 0;
  Result.nSmOtpPps := 0;
  Result.nSmDOtpPps := 0;
  Result.nSmPPps := 0;
  Result.nSvPPps := 0;
  Result.nSmPrpPps := 0;
  Result.nSmPrpInvPps := 0;

  Result.nSmPmCmn := 0;
  Result.nSmPmDCmn := 0;
  // Result.nSmPmPCmn := 0;
  // Result.nPmSvPCmn := 0;
  // Result.nSmPmPrpCmn := 0;
  // Result.nSmPmPrpInvCmn := 0;

  Result.nSmPmPps := 0;
  Result.nSmPmDPps := 0;
  // Result.nSmPmPPps := 0;
  // Result.nPmSvPPps := 0;
  // Result.nSmPmPrpPps := 0;
  // Result.nSmPmPrpInvPps := 0;

  Result.nSmBln := 0;
  Result.nSmDBln := 0;
  Result.nSmPBln := 0;
  Result.nSvPBln := 0;
  Result.nSmPrpBln := 0;

  Result.nSmDDekr := 0;
  Result.nSmPDekr := 0;
  Result.nSvPDekr := 0;
  Result.nSmPrpDekr := 0;

  Result.nSmDgv := 0;
  Result.nSmDDgv := 0;
  Result.nSmPDgv := 0;
  Result.nSvPDgv := 0;
  Result.nSmPrpDgv := 0;
  Result.nSmOtp := 0;
  Result.nSmDOtp := 0;
  Result.nSmPOtp := 0;

  Result.nSmVozvr := 0;
  Result.nSmDVozvr := 0;
  Result.nSmPVozvr := 0;

  Result.nSmDekr := 0;

  Result.nSm8711 := 0;
  Result.nSm8712 := 0;
  Result.nSm8713 := 0;
  Result.nSm8715 := 0;
  Result.nSm8716 := 0;
  Result.nSm8717 := 0;

  Result.bIsWrk := false;
  Result.bIsInv := false;
  Result.bIsBln  := false;
  Result.bIsOtp  := false;
  Result.bIsDekr := false;
  Result.bIsOtp3 := false;
  Result.bIsOtp6 := false;
  Result.bIsPps := false;

  Result.cPidZv := '';

  Result.nKdNpBln := 0;
  Result.nKdNpDkr := 0;
  Result.nKdNzp := 0;
  Result.nKdPTV := 0;

  Result.dDtBDekr := 0;
  Result.dDtEDekr := 0;

  Result.dDtBOtp3 := 0;
  Result.dDtEOtp3 := 0;
  Result.dDtBOtp6 := 0;
  Result.dDtEOtp6 := 0;
  Result.dDPR := 0;
  Result.dDZR := 0;
end;

end.
