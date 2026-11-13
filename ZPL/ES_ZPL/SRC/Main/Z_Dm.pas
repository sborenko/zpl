unit Z_DM;

// База данных отдела кадров
// логин - buch
// пароль - buch2008
// таблица должностей - o_dk0032010

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Math, Dialogs, Db, DBClient, DBTables, Provider, Variants, ExtCtrls,
  SickPregCmn;

type

  string1 = string[1];
  string3 = string[3];
  string4 = string[4];
  string10 = string[10];

  TDmMain = class(TDataModule)
    QryTmp: TQuery;
    dspTmp: TDataSetProvider;
    qryNadb: TQuery;
    dsrcNadb: TDataSource;
    updNadb: TUpdateSQL;
    QryPere: TQuery;
    QryPereNR: TIntegerField;
    QryPereTABN: TIntegerField;
    QryPereDT_BEG: TDateTimeField;
    QryPereDT_END: TDateTimeField;
    QryPereKDKATP: TSmallintField;
    QryPereSO: TSmallintField;
    QryPereOKLTRF: TFloatField;
    QryPereAVANS: TFloatField;
    QryPereSP_AV: TStringField;
    QryPereDOLGNOST: TStringField;
    QryPereNR_PRIKAZA: TStringField;
    QryPereDT_PRIKAZA: TDateTimeField;
    QryPerePR_PENS: TSmallintField;
    QryPereSOVM: TSmallintField;
    QryPerePDNLG: TSmallintField;
    QryPereKOLMIN: TSmallintField;
    QryPereShSO: TStringField;
    QryPereShPdNlg: TStringField;
    QryPereKDOBJ: TSmallintField;
    QryPereShKatP: TStringField;
    dsrcPere: TDataSource;
    updPere: TUpdateSQL;
    qryUdrg: TQuery;
    qryUdrgNR: TIntegerField;
    qryUdrgTABN: TIntegerField;
    qryUdrgSUMDOLG: TFloatField;
    qryUdrgSUMVZN: TFloatField;
    qryUdrgSP: TStringField;
    qryUdrgNOMDOK: TStringField;
    qryUdrgDT_BEG: TDateTimeField;
    qryUdrgDT_END: TDateTimeField;
    qryUdrgKDRSSCH: TIntegerField;
    qryUdrgKOMU: TStringField;
    qryUdrgShVidN: TStringField;
    dsrcUdrg: TDataSource;
    updUdrg: TUpdateSQL;
    qryOtkl: TQuery;
    qryOtklNR: TIntegerField;
    qryOtklDTPROC: TDateTimeField;
    qryOtklTABN: TIntegerField;
    qryOtklKDOBJ: TSmallintField;
    qryOtklKDKATP: TSmallintField;
    qryOtklDT_BEG: TDateTimeField;
    qryOtklDT_END: TDateTimeField;
    qryOtklPDN: TSmallintField;
    qryOtklCHAS: TFloatField;
    qryOtklSUMMA: TFloatField;
    qryOtklNOTES: TStringField;
    qryOtklPRR: TSmallintField;
    qryOtklPRPV: TSmallintField;
    qryOtklKTO: TSmallintField;
    qryOtklPRKR: TSmallintField;
    qryOtklShVidN: TStringField;
    qryOtklShKatP: TStringField;
    dsrcOtkl: TDataSource;
    updOtkl: TUpdateSQL;
    QryNuCmn: TQuery;
    UpdNu: TUpdateSQL;
    qrySysOpl_LU: TQuery;
    qryShPdn_LU: TQuery;
    qryKatPers_LU: TQuery;
    cdsPdN: TClientDataSet;
    qryOtklZAMESGOD: TDateTimeField;
    qryEDays: TQuery;
    cdsEDays: TClientDataSet;
    cdsPF: TClientDataSet;
    qryObjLU: TQuery;
    dsrcObjLU: TDataSource;
    qryVidN_LU: TQuery;
    QryPereShObj: TStringField;
    qryOtklShObj: TStringField;
    qryOtklSPEC_NR: TIntegerField;
    qryKoefOtp: TQuery;
    dsrcKoefOtp: TDataSource;
    updKoefOtp: TUpdateSQL;
    qryKoefOtpNR: TIntegerField;
    qryKoefOtpMESGOD: TDateTimeField;
    qryKoefOtpKOEFOTP: TFloatField;
    qryKoefOtpNOTES: TStringField;
    qryBanki: TQuery;
    dsrcBanki: TDataSource;
    updBanki: TUpdateSQL;
    qryBankiNR: TIntegerField;
    qryBankiKDBNK: TSmallintField;
    qryBankiSHBNK: TStringField;
    qryBankiNMBNK: TStringField;
    qryBankiNOTES: TStringField;
    qryKatVN: TQuery;
    dsrcKatVN: TDataSource;
    updKatVN: TUpdateSQL;
    qryKatVNNR: TIntegerField;
    qryKatVNKDKATVN: TSmallintField;
    qryKatVNNMKATVN: TStringField;
    qryKatVNNOTES: TStringField;
    QryPereNOTES: TStringField;
    QryPerePRCWRKTIME: TFloatField;
    qryMesSps: TQuery;
    qryMesSpsDTPROC: TDateTimeField;
    qryMesSpsRusMes: TStringField;
    qryDolgn: TQuery;
    qryDolgnNR: TIntegerField;
    qryDolgnKDDOLGN: TSmallintField;
    qryDolgnSHDOLGN: TStringField;
    qryDolgnNMDOLGN: TStringField;
    qryDolgnNOTES: TStringField;
    dsrcDolgn: TDataSource;
    updDolgn: TUpdateSQL;
    QryPereKDSPZ: TSmallintField;
    QryPerePRFS: TSmallintField;
    qryUdrgKDSPZ: TSmallintField;
    qryOtklKDSPZ: TSmallintField;
    qrySBU_LU: TQuery;
    qryOtklSchBU: TStringField;
    qryUdrgSpz: TStringField;
    QryPereSpz: TStringField;
    tblTmp: TTable;
    QryPereOLDKDOBJ: TSmallintField;
    QryPereRAZR: TSmallintField;
    QryPereRANG: TSmallintField;
    QryPereINV: TSmallintField;
    qryTmpPere: TQuery;
    QryPrmUv: TQuery;
    dsrcPrmUv: TDataSource;
    updPrmUv: TUpdateSQL;
    QryPrmUvNR: TIntegerField;
    QryPrmUvTABN: TIntegerField;
    QryPrmUvDT_PRIEM: TDateTimeField;
    QryPrmUvDT_UVOLN: TDateTimeField;
    QryPrmUvNR_PRIKAZA: TStringField;
    QryPrmUvDT_PRIKAZA: TDateTimeField;
    QryPrmUvNOTES: TStringField;
    qryTPdn: TQuery;
    qryTPdnNR: TIntegerField;
    qryTPdnDTBEG: TDateTimeField;
    qryTPdnPRCPDN: TFloatField;
    qryTPdnMINZP: TFloatField;
    qryTPdnPROGMIN: TFloatField;
    qryTPdnPOROGLG: TFloatField;
    qryTPdnPROCLG: TFloatField;
    qryTPdnSMLG100: TFloatField;
    qryTPdnSMLG150: TFloatField;
    qryTPdnSMLG200: TFloatField;
    qryTPdnNOTES: TStringField;
    updTPdn: TUpdateSQL;
    QryPerePROCLG: TFloatField;
    qryTPdnSM2660: TFloatField;
    qryUdrgVIDN: TStringField;
    qryOtklVIDN: TStringField;
    qryUdrgADRES: TStringField;
    qryUdrgPOSTA: TStringField;
    qryUdrgNOTES: TStringField;
    QryPerePRDEKR: TStringField;
    qryUdrgNOMSBERBANK: TStringField;
    qryUdrgLICSCHET: TStringField;
    qryUdrgRSCHET: TStringField;
    qryUdrgBANK: TStringField;
    qryUdrgOKPOBANKA: TStringField;
    qryUdrgPROC_PSB: TFloatField;
    QryPereCMBOKL: TStringField;
    QryPereSPEC_NR: TIntegerField;
    qryDPere: TQuery;
    dsrcDPere: TDataSource;
    updDPere: TUpdateSQL;
    qryDPereNR: TIntegerField;
    qryDPereTABN: TIntegerField;
    qryDPereSPEC_NR: TIntegerField;
    qryDPereOKLTRF: TFloatField;
    qryDPereKDSPZ: TSmallintField;
    qryDPereNOTES: TStringField;
    qryDPerePRCOKL: TFloatField;
    qryDPereSpz: TStringField;
    qryTPdnMINZP2: TFloatField;
    qryTPdnPROGMIN2: TFloatField;
    QryPereKDDOLGN: TSmallintField;
    QryPrmUvKDSPS: TSmallintField;
    QryPereKDSPS: TSmallintField;
    qryUdrgKDSPS: TSmallintField;
    qryOtklKDSPS: TSmallintField;
    QryPereSmCmbOkl: TFloatField;
    QryPrmUvNR_PRUVOLN: TStringField;
    QryPrmUvDT_PRUVOLN: TDateTimeField;
    qryLog: TQuery;
    cdsBankiLsLU: TClientDataSet;
    qryOtklDTVDPV: TDateTimeField;
    qryOtklNRVDPV: TIntegerField;
    qryOtklMYNOTES: TStringField;
    QryPereShSovm: TStringField;
    cdsSovm: TClientDataSet;
    dsrcSovm: TDataSource;
    cdsSovmNR: TIntegerField;
    cdsSovmKDSOVM: TSmallintField;
    cdsSovmSHSOVM: TStringField;
    cdsSovmNMSOVM: TStringField;
    cdsSovmNOTES: TStringField;
    qryOtklSPECPS: TIntegerField;
    qryUdrgSPSRSCH: TSmallintField;
    qryUdrgSPEC_NR: TIntegerField;
    qryUdrgKDPST: TIntegerField;
    qryUdrgShPst: TStringField;
    qryUdrgNmPst: TStringField;
    qryPst: TQuery;
    qryPstNR: TIntegerField;
    qryPstKDPST: TSmallintField;
    qryPstSHPST: TStringField;
    qryPstNMPST: TStringField;
    qryPstNOTES: TStringField;
    dsrcPst: TDataSource;
    updPst: TUpdateSQL;
    qryPsb: TQuery;
    qryPsbNR: TIntegerField;
    qryPsbKDPST: TSmallintField;
    qryPsbDTBEG: TDateTimeField;
    qryPsbPRCPSB: TFloatField;
    qryPsbNOTES: TStringField;
    dsrcPsb: TDataSource;
    qryPsbSHKALA: TSmallintField;
    updPsb: TUpdateSQL;
    qryUdrgS_P: TStringField;
    qryPstShk: TQuery;
    dsrcPstShk: TDataSource;
    updPstShk: TUpdateSQL;
    qryPstShkNR: TIntegerField;
    qryPstShkKDPST: TSmallintField;
    qryPstShkDTBEG: TDateTimeField;
    qryPstShkSMFROM: TFloatField;
    qryPstShkSMTOINC: TFloatField;
    qryPstShkSMCONST: TFloatField;
    qryPstShkPRC: TFloatField;
    qryPstShkONSMBOLEE: TFloatField;
    qryPstShkNOTES: TStringField;
    cdsShkPps: TClientDataSet;
    cdsSBU: TClientDataSet;
    qryTPrp: TQuery;
    updTPrp: TUpdateSQL;
    qryTPrpNR: TIntegerField;
    qryTPrpDTBEG: TDateTimeField;
    qryTPrpPRCPFCMN: TFloatField;
    qryTPrpPRCPFINV: TFloatField;
    qryTPrpPRCSS1BLN: TFloatField;
    qryTPrpPRCSS2NSL: TFloatField;
    qryTPrpNOTES: TStringField;
    qryOtklFamIO: TStringField;
    qryOtklNDbe: TStringField;
    qryOtklPBNK: TSmallintField;
    qryNewTabN: TQuery;
    qryUpiLS: TQuery;
    qryAllowSps: TQuery;
    qryUpi: TQuery;
    dsrcUpi: TDataSource;
    updUpi: TUpdateSQL;
    qryUpiNR: TIntegerField;
    qryUpiTABN: TIntegerField;
    qryUpiID: TStringField;
    qryUpiFAM: TStringField;
    qryUpiIMA: TStringField;
    qryUpiOTCH: TStringField;
    qryUpiDOB: TDateTimeField;
    qryUpiPOL: TStringField;
    qryUpiPRUV: TSmallintField;
    qryUpiOBJFROM: TSmallintField;
    qryUpiOLDTABN: TIntegerField;
    qryUpiLASTDTPRM: TDateTimeField;
    qryUpiLASTDTUVL: TDateTimeField;
    qryUpiMYNOTES: TStringField;
    qryUpiPRARC: TSmallintField;
    qryUpiFamIO: TStringField;
    qryUpiShBnk: TStringField;
    qryUpiLicSch: TStringField;
    QryPereShSps: TStringField;
    qryOtklSTORN: TStringField;
    qryDPereKDSPS: TSmallintField;
    qryDPereShSps: TStringField;
    qryTmp2: TQuery;
    qryOtklDTSTORN: TDateTimeField;
    qryTPrpPRCFZ: TFloatField;
    qryTPrpPRCFZ1006: TFloatField;
    qryTSs: TQuery;
    updTSs: TUpdateSQL;
    qryTSsNR: TIntegerField;
    qryTSsDTBEG: TDateTimeField;
    qryTSsPRCDOMIN: TFloatField;
    qryTSsPRCDOMAX: TFloatField;
    qryTSsNOTES: TStringField;
    qryTFz: TQuery;
    updTFz: TUpdateSQL;
    qryTFzNR: TIntegerField;
    qryTFzDTBEG: TDateTimeField;
    qryTFzPRCDOMIN: TFloatField;
    qryTFzPRCDOMAX: TFloatField;
    qryTFzNOTES: TStringField;
    qryBLS: TQuery;
    qryUpiDtBegLS: TDateField;
    qryOtklKDBNK: TSmallintField;
    qryEsv: TQuery;
    qryEsvNR: TIntegerField;
    qryEsvDTBEG: TDateTimeField;
    qryEsvPRCCMN: TFloatField;
    qryEsvSMCMN: TFloatField;
    qryEsvPRCPPS: TFloatField;
    qryEsvSMPPS: TFloatField;
    qryEsvPRCBLN: TFloatField;
    qryEsvSMBLN: TFloatField;
    qryEsvPRCGPD: TFloatField;
    qryEsvSMGPD: TFloatField;
    qryEsvNOTES: TStringField;
    dsrcEsv: TDataSource;
    updEsv: TUpdateSQL;
    qryEsvP: TQuery;
    dsrcEsvP: TDataSource;
    updEsvP: TUpdateSQL;
    qryEsvPNR: TIntegerField;
    qryEsvPDTBEG: TDateTimeField;
    qryEsvPPRCCMN: TFloatField;
    qryEsvPSMCMN: TFloatField;
    qryEsvPPRCBLN: TFloatField;
    qryEsvPSMBLN: TFloatField;
    qryEsvPPRCGPD: TFloatField;
    qryEsvPSMGPD: TFloatField;
    qryEsvPNOTES: TStringField;
    qryEsvPPRCINV: TFloatField;
    qryEsvPSMINV: TFloatField;
    qryTPdnPRCPDN2: TFloatField;
    QryPrmUvKDPIDZV: TSmallintField;
    QryPrmUvPidZviln: TStringField;
    qryEsvPPRCBLNINV: TFloatField;
    qryEsvPRCBLNINV: TFloatField;
    qryEsvSMBLNINV: TFloatField;
    qryEsvPSMBLNINV: TFloatField;
    QryPereNRPKT: TIntegerField;
    QryPereDTVPKT: TDateTimeField;
    QryPereNOINDX: TStringField;
    qrySpecBLS: TQuery;
    qryTmp3: TQuery;
    qryEsvPRCDEKR: TFloatField;
    qryEsvSMDEKR: TFloatField;
    qryEsvSMDEKRINV: TFloatField;
    qryEsvPRCDEKRINV: TFloatField;
    qryEsvPPRCDEKR: TFloatField;
    qryEsvPSMDEKR: TFloatField;
    qryEsvPPRCDEKRINV: TFloatField;
    qryEsvPSMDEKRINV: TFloatField;
    qryTPdnPRCWSB: TFloatField;
    QryPereNPD: TSmallintField;
    qryUdrgNRPOST: TStringField;
    qryUdrgDTPOST: TDateTimeField;
    qryUdrgDTDOK: TDateTimeField;
    qryUdrgTargetInn: TStringField;
    qryOtklKDTEMU: TSmallintField;
    qryOtklNMTEMU: TStringField;
    QryPereKDTEMU: TSmallintField;
    QryPereNmTemu: TStringField;
    qryCalcF: TQuery;
    QryPereOLDKDOK: TSmallintField;
    QryPereNEWKDOK: TSmallintField;
    QryPereOldCode: TStringField;
    QryPereOldD_zkpp: TStringField;
    QryPereOldNameD: TStringField;
    QryPereOldNameFull: TStringField;
    QryPereNewCode: TStringField;
    QryPereNewD_zkpp: TStringField;
    QryPereNewNameD: TStringField;
    QryPereNewNameFull: TStringField;
    QryPereOldDolgnOK: TStringField;
    QryPereNewDolgnOK: TStringField;
    timerPG: TTimer;
    DbOKTest: TDatabase;
    qryUdrgKDSLG: TSmallintField;
    qryUdrgNmSlg: TStringField;
    qryIspSlg: TQuery;
    qryIspSlgNR: TIntegerField;
    qryIspSlgKDSLG: TSmallintField;
    qryIspSlgNMSLG: TStringField;
    qryIspSlgNOTES: TStringField;
    qryIspSlgADRES: TStringField;
    qryOtklCBUDG: TStringField;
    qryNadbNR: TIntegerField;
    qryNadbKDSPS: TSmallintField;
    qryNadbSPSRSCH: TSmallintField;
    qryNadbTABN: TIntegerField;
    qryNadbVIDN: TStringField;
    qryNadbSHVIDN: TStringField;
    qryNadbGRP: TSmallintField;
    qryNadbSUMPROC: TFloatField;
    qryNadbSP: TStringField;
    qryNadbPRCSOVM: TFloatField;
    qryNadbDT_BEG: TDateTimeField;
    qryNadbDT_END: TDateTimeField;
    qryNadbKDTEMU: TSmallintField;
    qryNadbKDOBJ: TSmallintField;
    qryNadbSHOBJ: TStringField;
    qryNadbKDKATP: TSmallintField;
    qryNadbSHKATP: TStringField;
    qryNadbPRCHS: TStringField;
    qryNadbPRSMM: TStringField;
    qryNadbKDSPZ: TSmallintField;
    qryNadbSCHBU: TStringField;
    qryNadbSPEC_NR: TIntegerField;
    qryNadbNOTES: TStringField;
    qryNadbNRPRBEG: TStringField;
    qryNadbDTPRBEG: TDateTimeField;
    qryNadbNRPREND: TStringField;
    qryNadbDTPREND: TDateTimeField;
    qryNadbNRPKT: TIntegerField;
    qryNadbDTVPKT: TDateTimeField;
    qryNadbPRC_WT: TFloatField;
    qryNadbZP13: TStringField;
    qryNadbOTP: TStringField;
    qryNadbBLN: TStringField;
    qryNadbDKR: TStringField;
    qryNadbOTPUSKN: TStringField;
    qryNadbBOLNIC: TStringField;
    qryNadbSPRM: TStringField;
    qryNadbCPRM: TStringField;
    qryNadbSSRK: TStringField;
    qryNadbDETI: TStringField;
    qryNadbDETIM: TStringField;
    qryNadbDETIK: TStringField;
    qryNadbDETIG: TStringField;
    qryNadbIND: TStringField;
    qryNadbDHD: TStringField;
    qryNadbOKLFND: TStringField;
    qryNadbCBUDG: TStringField;
    qryNadbSNDB: TStringField;
    qryNadbSPDN: TStringField;
    qryNadbSWSB: TStringField;
    qryNadbSPRF: TStringField;
    qryNadbSPENS: TStringField;
    qryNadbSALIM: TStringField;
    qryNadbCNDB: TStringField;
    qryNadbSSOCSTRAH: TStringField;
    qryNadbSBZR: TStringField;
    qryNadbSP_PF: TStringField;
    qryNadbSP_FSTVP: TStringField;
    qryNadbSP_FSNV: TStringField;
    qryNadbSP_FZ: TStringField;
    qryNadbSOVM: TStringField;
    qryNadbSPOV: TStringField;
    qryNadbKEKV: TStringField;
    qryNadbKDSCHDT: TSmallintField;
    qryNadbKDSCHKT: TSmallintField;
    QryPereBM: TStringField;
    QryPereDTBM: TDateTimeField;
    qryDPereKDOBJ: TSmallintField;
    qryDPereShObj: TStringField;
    qryAmz: TQuery;
    qryPstIS_PST: TStringField;
    qryNadbKD_DLZHN: TSmallintField;
    qryNadbKD_SOVM: TSmallintField;
    qryNadbIS_PERE: TStringField;
    qryNadbDLZHN: TStringField;
    qryNadbSHSOVM: TStringField;
    QryPereIS_PERE: TStringField;
    qryNadbKD_PROF: TStringField;
    tblCreSpsState: TTable;
    qryOtklOTKL_SOVM: TStringField;
    QryPeek: TQuery;
    CdsPmnts: TClientDataSet;
    CdsPmntsNR: TIntegerField;
    CdsPmntsKDSPS: TSmallintField;
    CdsPmntsDTPROC: TDateTimeField;
    CdsPmntsZAMESGOD: TDateTimeField;
    CdsPmntsTABN: TIntegerField;
    CdsPmntsDT_BEG: TDateTimeField;
    CdsPmntsDT_END: TDateTimeField;
    CdsPmntsVIDN: TStringField;
    CdsPmntsOldVidN: TSmallintField;
    CdsPmntsShVidN: TStringField;
    CdsPmntsGRP: TSmallintField;
    CdsPmntsPDN: TSmallintField;
    CdsPmntsCHAS: TFloatField;
    CdsPmntsSUMMA: TFloatField;
    CdsPmntsSmN: TFloatField;
    CdsPmntsSmU: TFloatField;
    CdsPmntsKDKATP: TSmallintField;
    CdsPmntsShKatP: TStringField;
    CdsPmntsKDOBJ: TSmallintField;
    CdsPmntsShObj: TStringField;
    CdsPmntsKDSPZ: TSmallintField;
    CdsPmntsPSCH: TStringField;
    CdsPmntsSCHBU: TStringField;
    CdsPmntsSPEC_NR: TIntegerField;
    CdsPmntsPRR: TSmallintField;
    CdsPmntsPRPV: TSmallintField;
    CdsPmntsPRKR: TSmallintField;
    CdsPmntsKTO: TSmallintField;
    CdsPmntsSPECPS: TIntegerField;
    CdsPmntsDTVDPV: TDateTimeField;
    CdsPmntsNRVDPV: TIntegerField;
    CdsPmntsKDBNK: TSmallintField;
    CdsPmntsKDTEMU: TSmallintField;
    CdsPmntsNMTEMU: TStringField;
    CdsPmntsSOVM: TStringField;
    DsrcPmnts: TDataSource;
    PmntsProvider: TDataSetProvider;
    qryUpiUKRCITIZ: TStringField;
    qryNadbSPOV_MERGE: TStringField;
    qryNadbPartSalId: TIntegerField;
    qryNadbIgnNoPayVac: TStringField;
    CdsPmntsNuSovm: TStringField;
    CdsPmntsStorn: TStringField;
    qryUdrgOznDoh: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
//    procedure CreOpenCdsSBU;
    procedure CreOpenCdsPdN;
    procedure CreOpenCdsShkPPS;
    procedure CreOpenCdsPF;
    procedure CreOpenCdsEDays;
    procedure CreOpenCdsSovm;
    procedure CreOpenCdsBankiLsLU(dOnDate : TDateTime);
    procedure qryNadbAfterDelete(DataSet: TDataSet);
    procedure qryNadbAfterPost(DataSet: TDataSet);
    procedure qryNadbNewRecord(DataSet: TDataSet);
    procedure QryPereAfterDelete(DataSet: TDataSet);
    procedure QryPereAfterPost(DataSet: TDataSet);
    procedure QryPereBeforeInsert(DataSet: TDataSet);
    procedure QryPereNewRecord(DataSet: TDataSet);
    procedure qryUdrgAfterDelete(DataSet: TDataSet);
    procedure qryUdrgAfterPost(DataSet: TDataSet);
    procedure qryUdrgNewRecord(DataSet: TDataSet);
    procedure DateFieldSetText(Sender: TField; const Text: String);
    procedure qryOtklAfterDelete(DataSet: TDataSet);
    procedure qryOtklAfterPost(DataSet: TDataSet);
    procedure qryOtklNewRecord(DataSet: TDataSet);
    procedure qryOtklZAMESGODValidate(Sender: TField);
    procedure qryOtklDT_BEGValidate(Sender: TField);
    procedure qryOtklDT_ENDValidate(Sender: TField);
    function MyDtEndOtp(dDtBeg : TDateTime; nCntDays : integer;
                                                  cRK : string) : TDateTime;
    function CountWorkChas(d_DtB, d_DtE : TDateTime) : double;
    function CountWorkDays(d_DtB, d_DtE : TDateTime) : double;
    function Budget(nGod, nMes : integer;
                       var nCntDay, nCntWorkDay : integer) : double;
    function GetCntWorkChas(nTabN : integer; dDtZaMG : TDateTime;
                                                   bIsCmbOkl: boolean) : double;
    function NewSpec_NR : integer;
    function NewKdSovm : integer;
    function NewKdPst : integer;
    function CntWrkChs(dAnyDate : TDateTime) : double;
    function GetBankiLS(nTabN : integer; dOnDate : TDateTime;
                                                var nKdBnk : SmallInt) : string;
    function KdBnk2NmBnk(nKdBnk : integer;
                                        var cShBnk : ShortString) : ShortString;

    function GetLastPriemUvolnInfo(nTabN: integer; var dDtPriem, dDtUvoln: TDateTime): boolean;

    procedure GetPereInf(nTabN : integer; dProcDate : TDateTime;
                              var nKdObj, nKdKatP, nSO, nPdNlg,
                                  nKolMin, nKdSpz, nRang, nRazr : integer;
                              var nOklTrf, nAvans, nProcLG : double;
                              var cSpAv : string1;
                              var cDolgnost, cNrPrikaza : string;
                              var dDtPrikaza : TDateTime;
                              var bPens, bSovm, bPrfs : boolean;
                              var nInv : SmallInt);
    procedure GetShkPps(dAnyDate : TDateTime; nSmDohoda : double;
                           var nSmConst, nPrc, nSmPoroga, nMaxPorog : double;
                                                          var cVidN : string4);
    procedure GetShkNePps(dAnyDate : TDateTime; nSmDohoda : double;
                           var nSmConst, nPrc, nSmPoroga, nMaxPorog : double;
                                                          var cVidN : string4);
    procedure qryOtklSUMMAValidate(Sender: TField);
//    procedure qryVidN_LUAfterPost(DataSet: TDataSet);
//    procedure qryVidN_LUAfterDelete(DataSet: TDataSet);
    procedure CheckStru;
    procedure CreOtklCurMes(nZpCurY, nZpCurM : word);
    procedure qryKoefOtpAfterPost(DataSet: TDataSet);
    procedure qryKoefOtpAfterDelete(DataSet: TDataSet);
    procedure qryBankiAfterPost(DataSet: TDataSet);
    procedure qryBankiAfterDelete(DataSet: TDataSet);
    procedure qryBankiBeforePost(DataSet: TDataSet);
    function myNewKdBnk : integer;
    procedure qryKatVNAfterPost(DataSet: TDataSet);
    procedure qryKatVNBeforePost(DataSet: TDataSet);
    procedure qryKatVNAfterDelete(DataSet: TDataSet);
    procedure qryOtklZAMESGODSetText(Sender: TField; const Text: String);
    procedure QryNuCmnCalcFields(DataSet: TDataSet);
    procedure qryOtklCalcFields(DataSet: TDataSet);
    procedure qryMesSpsCalcFields(DataSet: TDataSet);
    procedure qryDolgnBeforePost(DataSet: TDataSet);
    procedure qryDolgnAfterPost(DataSet: TDataSet);
    procedure qryDolgnAfterDelete(DataSet: TDataSet);
    procedure QryPrmUvAfterPost(DataSet: TDataSet);
    procedure QryPrmUvAfterDelete(DataSet: TDataSet);
    function OldVidN2VidN(nOldVidN : integer) : string4;
    function OldOV2KdObj(nOldObj, nOldVed : integer) : integer;
    function GetKdSpzVida(cVidN : string4) : integer;
    procedure qryTPdnAfterPost(DataSet: TDataSet);
    procedure qryTPdnNewRecord(DataSet: TDataSet);
    procedure qryDPereNewRecord(DataSet: TDataSet);
    procedure QryPereCalcFields(DataSet: TDataSet);
//    procedure qryPrmUvSpsAfterPost(DataSet: TDataSet);
//    procedure qryPrmUvSpsAfterDelete(DataSet: TDataSet);
    function MySredneMes(nCntMes : word; nTabN : integer;
                                                   dDtBeg : TDateTime) : double;
    procedure qryOtklBeforePost(DataSet: TDataSet);
    procedure qryUdrgBeforePost(DataSet: TDataSet);
    procedure qryNadbBeforePost(DataSet: TDataSet);
    procedure AddPSToOtkl(cVidN : ShortString; nTabN : integer;
                                                  dDtPrc, dMesPS : TDateTime);
    procedure AddPereschetInOtkl(nKdSps, nTabN : integer;
                                                 dDtProc, dDtBeg : TDateTime);
    function Dolgn2KdDolgn(cDolgn : string) : integer;
    procedure qryUdrgCalcFields(DataSet: TDataSet);

    procedure PmntsSpecNrGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure PmntsHoursGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure PmntsSumGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure PmntsDtEndGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CdsPmntsKdTemuGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
      
    procedure OpenQryPst;
    procedure OpenQryPsb;
    procedure OpenQryPstShk;
    procedure qryPstBeforePost(DataSet: TDataSet);
    procedure qryPstAfterPost(DataSet: TDataSet);
    procedure qryPsbAfterPost(DataSet: TDataSet);
    procedure qryPstShkAfterPost(DataSet: TDataSet);
    procedure CheckDayForBln(dAnyDate : TDateTime; var nCntBlnDay : integer;
                                 var nCntWrkChas : double; cCase : ShortString);
    procedure CheckDayForOtp(dAnyDate : TDateTime; var nCntOtpDay : integer;
                                 var nCntWrkChas : double; cCase : ShortString);
    procedure GetCntWrkDaysBln(dDtB, dDtE : TDateTime;
                                   var nCntWorkDays, nCntWorkChas : double;
                                                         cCase : ShortString);
    procedure GetCntWrkDaysOtp(dDtB, dDtE : TDateTime;
                                   var nCntWorkDays, nCntWorkChas : double;
                                                         cCase : ShortString);
    function SchBU2KdSBU(var cSchBU : ShortString; var nKdSbu : SmallInt;
                                               var bHsChld : boolean) : boolean;
    function KdSbu2SchBU(nKdSbu : integer) : string;
    function KdSbu2KdPSch(nKdSbu : integer) : integer;



  //  function KdSbu2SchBU(nKdSbu : integer) : string;
    function KdTemu2NmTemu(nKdTemu : SmallInt) : ShortString;
    function KdSbu2NmSbu(nKdSbu : integer) : string;
    function KdSbu22NmSbu(nKdSbu : integer; var cPSch, cNmSBU : string) : string;
    procedure cdsSBUBeforeOpen(DataSet: TDataSet);
    procedure cdsSBUAfterOpen(DataSet: TDataSet);
    procedure qryDPereCalcFields(DataSet: TDataSet);
    procedure qryNadbCalcFields(DataSet: TDataSet);
    procedure qryTPrpNewRecord(DataSet: TDataSet);
    procedure qryTPrpAfterPost(DataSet: TDataSet);
    procedure qryTPrpBeforeInsert(DataSet: TDataSet);
    procedure qryTPrpBeforePost(DataSet: TDataSet);
    procedure GetPrpInfo(dDtMes : TDateTime; var nPrcPfCmn, nPrcPfInv,
                             nPrcSsBln, nPrcSsNsl, nPrcFz, nPrcFz1006 : double);
    procedure GetPdnInfo(dAnyDate : TDateTime;
                        var nPrcPdn, nPrcPdn2,
                            nMinZpNG, nMinZpCM, nProgMinNG, nProgMinCM,
                                nPorogLg, nProcLg, nSm2660,
                                    nSmLg100, nSmLg150, nSmLg200 : double);
    procedure GetSmMin10(dRMes : TDateTime; var nSmMin10 : double);
    function NewVedNR : integer;
    function NewUpiTabN : integer;
    procedure FldKdObjValidate(Sender: TField);
    procedure FldVidNValidate(Sender: TField);
    procedure tblUpiBeforeOpen(DataSet: TDataSet);
    procedure qryTPdnMINZPValidate(Sender: TField);
    procedure qryTPdnPROCLGValidate(Sender: TField);
    procedure qryUpiCalcFields(DataSet: TDataSet);
    procedure qryUpiAfterPost(DataSet: TDataSet);
    procedure qryUpiBeforePost(DataSet: TDataSet);
    function GetNewUpiNR : integer;
    function GetCmbOkl(nSpec_NR : integer) : double;
    procedure FldKdKatPValidate(Sender: TField);
    procedure FldSovmValidate(Sender: TField);
    procedure FldPdNlgValidate(Sender: TField);
    procedure FldSoValidate(Sender: TField);
    procedure qryTSsBeforeInsert(DataSet: TDataSet);
    procedure qryTSsNewRecord(DataSet: TDataSet);
    procedure qryTSsBeforePost(DataSet: TDataSet);
    procedure qryTFzBeforeInsert(DataSet: TDataSet);
    procedure qryTFzNewRecord(DataSet: TDataSet);
    procedure qryTFzBeforePost(DataSet: TDataSet);
    procedure PrepareQryBLS;
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryOtklVIDNSetText(Sender: TField; const Text: String);
    procedure qryOtklKDOBJValidate(Sender: TField);
    procedure qryOtklKDKATPValidate(Sender: TField);
    procedure qryOtklSchBUSetText(Sender: TField; const Text: String);
    procedure qryEsvNewRecord(DataSet: TDataSet);
    procedure qryEsvAfterPost(DataSet: TDataSet);
    procedure qryEsvAfterDelete(DataSet: TDataSet);
    procedure qryEsvPAfterPost(DataSet: TDataSet);
    procedure qryEsvPAfterDelete(DataSet: TDataSet);
    procedure qryEsvPNewRecord(DataSet: TDataSet);
    procedure QryPrmUvCalcFields(DataSet: TDataSet);
    function GetCntBudgChas(dDtBeg, dDtEnd : TDateTime) : double;
    procedure QryPereNPDValidate(Sender: TField);
    function VidIsSovm(cVidN : ShortString) : boolean;
    procedure timerPGTimer(Sender: TObject);
    procedure QryPrmUvAfterOpen(DataSet: TDataSet);
    procedure CdsPmntsCalcFields(DataSet: TDataSet);
    procedure qryUdrgOznDohValidate(Sender: TField);
  private
    cSvObj, cSvKdKatP, cSvSO, cSvOklTrf, cSvAvans, cSvPrcWrkTime, cSvProcLG,
    cSvSpAv, cSvDolgnost, cSvKdSpz, cSvPrPens, cSvSovm, cSvPdNlg,
    cSvKolMin, cSvPrfs, {cSvDtPriem, cSvDtUvoln,} cSvNrPrikaza,
    cSvDtPrikaza, cSvNotes, cSvInv, cSvRang, cSvRazr,
    cSvOldKdOK, cSvNewKdOk : shortstring;
    // все вышележашее будем сохранять для ввода в новую запись в Z_PERE

    bOtklNewRec, bOtklVvodInZaMesGod,
    bOtklVvodInDtBeg, bOtklVvodInDtEnd : boolean;

    nTabelTabN, nTabelKdVidN : integer; // Для ввода новой строки
    dTabelDtBeg : TDateTime;            // в табель (qryTab)
    nFalsNrForDPere : integer;
    cPrcPfCmn, cPrcPfInv, cPrcSs1Bln, cPrcSs2NSl, cPrcFz,
                                                  cPrcFz1006 : ShortString;
    cPrcDoMinSs, cPrcDoMaxSs, cPrcDoMaxFz : ShortString;

    function NewKatVN : integer;
    function NewKdDolgn : integer;

    procedure PreparePmntsDataSet;
  public
    function GetOkRkvzt(nKdOK: SmallInt; var cDolgnOK, cCode, cD_zkpp,
                          cNameD, cNameFull: ShortString) : boolean;
    function ShKatP2KdKatP(var cShKatP : ShortString) : SmallInt;
    function KdKatP2NmKatP(nKdKatP : integer; var cShKatP : string) : string;
    function KdObj2ShObj(nKdObj : integer; var cNmObj : string) : string;
    function VidN2KdSpZVida(cVidN : string4) : integer;
    function VidN2ShVidN(cVidN : string4; var cNmVidN : string) : string;
    function TabN2FamIO(nTabN : integer) : string;
    procedure GetUpiLsInf(nTabN : integer; var dDtBeg : TDateTime;
                                             var cShBnk, cLicSch : ShortString);
    function GetUpiInfo(nTabN : integer;
                             var cFamIO, cFam, cIma, cOtch, cPol, cID : string;
                                  var dDOB : TDateTime) : boolean;
    procedure Get_VidInfo(cVidN : string4; var p_KEKV : string4;
                 var p_ShVidN : string10;    {p_OklFnd понимать, как входит ли}
                 var p_zp13,                 {в расчет суммы для доплат к минЗП}
                     p_Otp, p_Bln, p_Dkr, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf,
                     p_SPens, p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                 var p_KdSpZ : integer);
    procedure GetObjInfo(nKdObj : integer;
                              var cShObj, cNmObj, cFioUpoln : string;
                              var nKdUPos, nKassa, nKdSpZ : integer);

    procedure LogAddAllow(Rec: TDataSet);

    procedure AddLog(mDtTm : TDateTime; nTabN : integer;
                                cNmEvnt, cNmUsr, cNmTbl, cMsg : string);
    procedure CheckCopyTbl(cNmTbl : ShortString);
    function GetPdrKdSpZ(nKdObj : integer) : integer;
    function IsKdObjInDic(nKdObj : SmallInt; var cShObj: ShortString) : boolean;
    function IsKdKatPInDic(nKdKatP : SmallInt;
                                           var cShKatP : ShortString) : boolean;
    function IsOplInDic(nKdOpl : SmallInt) : boolean;
    function IsPdNlgInDic(nKdSh : SmallInt) : boolean;
    function IsSovmInDic(nKdSovm : SmallInt) : boolean;
    function IsVidNInDic(cVidN : ShortString) : boolean;
    function KdSovm2ShSovm(nKdSovm : SmallInt) : ShortString;
    function KdSo2ShSo(nKdSo : SmallInt) : ShortString;
    function KdShPdn2ShShPdn(nKdSh : SmallInt) : ShortString;
    function mySmCmbOkl(nSpec_NR : integer) : double;
    procedure SetUpdTblMsg(cNmTbl : ShortString; nKdUsr : integer;
                                                      var nNewUpdNR : integer);
    function CheckTabNInSps(nTabN : integer; dDtPrc : TDateTime) : boolean;
    function SmmPF(nTabN : integer; bIsPPS : boolean; dZaMG, dRMes : TDateTime;
                      nSmForXX : double; var nSmSvPorog : double;
                                                 var cVidN : string4) : double;
    function SmmPF_Prp(nTabN : integer; bIsPPS, bIsInv : boolean;
                              dZaMG, dRMes : TDateTime; nSmForXX : double;
                              var nSmPorog, nSmSvPorog, nPrcPfCmn : double;
                                                 var cVidN : string4) : double;
    function GetPrcFz(dZaMG : TDateTime) : double;
    function GetPrcFzDgv(dZaMG : TDateTime) : double;
    procedure GetPrcSS(dZaMG : TDateTime; var nPrcDoMin, nPrcDoMax : double);
    procedure GetBankLS(nTabN : integer; dOnDate : tDateTime;
                               var dDtBeg : TDateTime; var nKdBnk : SmallInt;
                                    var cShBnk, cNmBnk, cLicSch : ShortString;
                                              var bSpbLS, bIsClosed : boolean);
    procedure GetBankSpecLS(nTabN : integer; dOnDate : tDateTime;
                               var dDtBeg : TDateTime; var nKdBnk : SmallInt;
                                    var cShBnk, cNmBnk, cLicSch : ShortString;
                                                          var bSpbLS : boolean);
    procedure GetSmPrcLgt(nTabN : integer; dDtPrc : TDateTime;
                                  var nCntChld10_11 : SmallInt;
                   var nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11 : double;
                                                    var cOznPilg : ShortString);
    function GetPidZviln(nKdPidZv : Smallint) : ShortString;
    function GetMinDtProcDekr(nTabN: integer; dOnDtPrc: TDateTime) : TDateTime;
    function GetCountWrkChas : double;
    function GetNdbDates(nNdbSpecNR : integer;
                               var dNdbDtBeg, dNdbDtEnd : TDateTime) : boolean;
    function NdbClosed(nSpecNR : integer; dOnDate : TDateTime) : boolean;
    function NdbFromFirstDay(nSpecNR : integer; dZaMG : TDateTime) : boolean;
    function FirstWrkDayInMes(dDtPrc : TDateTime) : TDateTime;
    function GetKdSpZ(nKdObj : SmallInt; var cLnkSch : ShortString) : SmallInt;
    function KdSlg2NmSlg(nKdSlg : SmallInt) : ShortString;
    procedure SetAmzDate;

    function CreSpsInProgress: boolean;
    procedure LockCreSps;
    procedure UnlockCreSps;
    function PrBln2NmPrBln(eBlnType: TBlnType; nPrBln : SmallInt) : ShortString;

    procedure LoadPayments(ShowSpecVids, NewShortMode: boolean);
    procedure ChangePmntsSort(SortByMnth: Boolean);

    procedure PrepareQryPrmUv(DsrcSps: TDataSource);
    procedure OpenQryPrmUv;

    procedure PrepareQryPere(DsrcSps: TDataSource; Ascending: Boolean);
    procedure OpenQryPere(Ascending: Boolean);

    procedure OpenQryNadb(DsrcSps: TDataSource; Actual: Boolean;
      EmplLists: TStrings);

    procedure OpenPmntsQry(Query: TQuery; EmplId: Integer; DtProc: TDateTime;
      ShowNich, ShowTaxes, ForPrint, NewShortMode: Boolean);
    procedure PreparePmntsQry(Query: TQuery; ShowNich, ShowTaxes,
      ForPrint, NewShortMode: Boolean);
    procedure ComposePmntsQry(Qry: TQuery; ConsiderNich, ShowTaxes,
      ForPrint: Boolean);
    procedure ComposeShortPmnts(Query: TQuery; ShowNich, ShowTaxes,
      ForPrint: Boolean);

    function EmplIsInMainList(EmplId: Integer; DtProc: TDateTime): Boolean;

    function QryPmnts: TQuery;

    function InCtrlMes: Boolean;       // находимся ли в РАБОЧЕМ периоде
  end;

var
  DmMain: TDmMain;

procedure InitQuery(query: TQuery);
procedure ReleaseQuery(query: TQuery);
function CopyRecord(src, dst: TDataSet): boolean;

implementation

uses
  A_Const, A_DM, Z_Main, A_Lib, a_SBU, z_PrBln, z_TUpi,
  QryUtils, CdsLib, DsLib, SalaryLib, TextLib;

{$R *.DFM}


//------------------------------------------------------------------------------
procedure TDmMain.CheckCopyTbl(cNmTbl : ShortString);
var nCmnUpdNR, nLocalUpdNR : integer;
begin
  nCmnUpdNR := -1;
  nLocalUpdNR := -1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select LastUpdNR from UpdCopyTbl where NmTbl = :cNmTbl');
    ParamByName('cNmTbl').AsString := cNmTbl;
    Open;
    if RecordCount > 0 then
      nCmnUpdNR := FieldByName('LastUpdNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select LastUpdNR from UpdCopyTbl where NmTbl = :cNmTbl');
    ParamByName('cNmTbl').AsString := cNmTbl;
    Open;
    if RecordCount > 0 then
      nLocalUpdNR := FieldByName('LastUpdNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
    if (nCmnUpdNR > -1) and (nLocalUpdNR > -1) and
                   (nCmnUpdNR > nLocalUpdNR) then begin
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Update UpdCopyTbl set LastUpdNR = :nCmnUpdNR ' +
              ' where NmTbl = :cNmTbl');
      ParamByName('cNmTbl').AsString := cNmTbl;
      ParamByName('nCmnUpdNR').AsInteger := nCmnUpdNR;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.SmmPF(nTabN : integer; bIsPPS : boolean;
                                           dZaMG, dRMes : TDateTime;
                                    nSmForXX : double; var nSmSvPorog : double;
                                                 var cVidN : string4) : double;
var nSmConst, nPrc, nSmPorog, nMaxPorog : double;
begin
  // Сказано ПрошлМес (dZaMG) считать по нормам ТМ {dRMes}, но порог определять
  // по месяцу dZaMG, поэтому в GetShk'алы надо обращаться два раза -
  // 1-й раз для определения "пороговых" дел,
  // 2-й - для определения nSmConst, nPrc
  // (надо разобраться и согласовать с Ольгой)        TYTYTYT
  if bIsPPS then begin   // ППС (по шкале)
    GetShkPps(dZaMG, nSmForXX, nSmConst, nPrc, nSmPorog, nMaxPorog, cVidN);
    nSmSvPorog := nSmForXX - nMaxPorog;
    Result := RoundTo(nSmConst + nPrc * (nSmForXX - nSmPorog) / 100, -2); end
  else begin
    GetShkNePps(dZaMG, nSmForXX, nSmConst, nPrc, nSmPorog, nMaxPorog, cVidN);
    nSmSvPorog := nSmForXX - nMaxPorog;
    Result := RoundTo(nSmConst + nPrc * nSmForXX / 100, -2);
  end;
  if nSmSvPorog < 0 then
    nSmSvPorog := 0;
end;
//------------------------------------------------------------------------------
function TDmMain.SmmPF_Prp(nTabN : integer; bIsPPS, bIsInv : boolean;
                              dZaMG, dRMes : TDateTime; nSmForXX : double;
                              var nSmPorog, nSmSvPorog, nPrcPfCmn : double;
                                                 var cVidN : string4) : double;
var nPrcPfInv, nPrcSsBln, nPrcSsNsl, nPrcFz, nPrcFz1006, nPrcPdn, nPrcPdn2,
    nMinZpNG, nMinZpCM, nProgMinNG, nProgMinCM,
    nPorogLg, nProcLg, nSm2660, nSmLg100, nSmLg150, nSmLg200 : double;
begin
  // Сказано ПрошлМес (dZaMG) считать по нормам ТМ {dRMes}, но порог определять
  // по месяцу dZaMG, поэтому для GetPrpInfo использую dRMes,
  // а для GetPdnInfo (откуда берется "пороговая" информация) использую dZaMG
  nSmSvPorog := 0;
  GetPrpInfo(dRMes, nPrcPfCmn, nPrcPfInv, nPrcSsBln, nPrcSsNsl,
                                                          nPrcFz, nPrcFz1006);
  GetPdnInfo(dZaMG, nPrcPdn, nPrcPdn2, nMinZpNG, nMinZpCM, nProgMinNG,
          nProgMinCM, nPorogLg, nProcLg, nSm2660, nSmLg100, nSmLg150, nSmLg200);
  // (Сверить - как тут, с предприятия,
  //                      учитываются ППСность, инвалидность, шкалы ППС/НеППС)
  nSmPorog := nSm2660;
  // с nPrcPfCmn ничего не нужно делать - идентификаторы совпадают
  if not bIsInv then begin   // не инвалид
    cVidN := '8611';
    if nSmForXX > nSm2660 then begin
      nSmSvPorog := nSmForXX - nSm2660;
      nSmForXX := nSm2660;
      nSmPorog := nSm2660;
    end;
    Result := nSmForXX * nPrcPfCmn / 100; end
  else begin                 // инвалид
    cVidN := '8612';
    Result := nSmForXX * nPrcPfInv / 100;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.CheckTabNInSps(nTabN : integer; dDtPrc : TDateTime) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_SPS ' +
              ' where (DtProc = :dDtPrc) and (TabN = :nTabN)');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Result := RecordCount > 0;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.OpenQryPst;
begin
  with qryPst do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_PST order by KdPst');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.OpenQryPsb;
begin
  with qryPsb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPst;
    SQL.Add('Select * from Z_PST_PSB where KdPst = :KdPst order by DtBeg');
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.OpenQryPstShk;
begin
  with qryPstShk do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcPsb;
    SQL.Add('Select * from Z_PST_SHK where KdPst = :KdPst and DtBeg = :DtBeg ' +
            ' order by SmFrom');
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.NewVedNR : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from GetNewVedNr');
    Open;
    Result := FieldByName('NewVedNr').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.ShKatP2KdKatP(var cShKatP : ShortString) : SmallInt;
var bMore : boolean; cTmp : ShortString;
begin
  Result  := 0;
  cShKatP := AnsiUpperCase(cShKatP);
  with qryKatPers_LU do begin
    First;
    bMore := true;
    while bMore and not Eof do begin
      cTmp := Copy(AnsiUpperCase(FieldByName('ShKatP').AsString),
                                                        1, Length(cShKatP));
      if cTmp = cShKatP then begin
        cShKatP := FieldByName('ShKatP').AsString;
        Result  := FieldByName('KdKatP').AsInteger;
        bMore := false;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.KdKatP2NmKatP(nKdKatP : integer; var cShKatP : string) : string;
begin
  Result  := '';
  cShKatP := '';
  if qryKatPers_LU.Locate('KdKatP', nKdKatP, []) then begin
    cShKatP := qryKatPers_LU.FieldByName('ShKatP').AsString;
    Result  := qryKatPers_LU.FieldByName('NmKatP').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.Dolgn2KdDolgn(cDolgn : string) : integer;
begin
  Result := -1;
  with qryDolgn do begin
    if not Active then Open;
    if Locate('NmDolgn', cDolgn, []) then
      Result := FieldByName('KdDolgn').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.KdObj2ShObj(nKdObj : integer; var cNmObj : string) : string;
begin
  Result := '';
  cNmObj := '';
  if qryObjLU.Locate('KdObj', nKdObj, []) then begin
    cNmObj := qryObjLU.FieldByName('NmObj').AsString;
    Result := qryObjLU.FieldByName('ShObj').AsString;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.LogAddAllow(Rec: TDataSet);
var
  EmplId: Integer;
  Msg: String;
begin
  with Rec do begin
    EmplId := FieldByName('TabN').AsInteger;

    Msg :=
      'TabN = ' + IntToStr(EmplId) +
      ', KdSps = ' + FieldByName('KdSps').AsString +
      ', DtBeg = ' + FieldByName('Dt_Beg').AsString +
      ', VidN = ' + FieldByName('VidN').AsString +
      ', SpsRsch = ' + FieldByName('SpsRsch').AsString +
      ', См_% = ' + FieldByName('SP').AsString +
      ', SmPrc = ' + FieldByName('SumProc').AsString +
      ', KdObj = ' + FieldByName('KdObj').AsString +
      ', KdKatP = ' + FieldByName('KdKatP').AsString +
      ', KdSBU = ' + FieldByName('KdSpZ').AsString;

    if not FieldByName('NrPrBeg').IsNull
        and (FieldByName('NrPrBeg').AsString > '') then
      Msg := Msg + ',  №_ПрНач = ' + FieldByName('NrPrBeg').AsString;

    if not FieldByName('DtPrBeg').IsNull
        and (FieldByName('NrPrBeg').AsString > '') then
      Msg := Msg + ',  ДтПрНач = ' + FieldByName('DtPrBeg').AsString;

    if not FieldByName('NrPrEnd').IsNull
        and (FieldByName('NrPrEnd').AsString > '') then
      Msg := Msg + ',  №_ПрКнц = ' + FieldByName('NrPrEnd').AsString;

    if not FieldByName('DtPrEnd').IsNull
        and (FieldByName('DtPrEnd').AsString > '') then
      Msg := Msg + ',  ДтПрКнц = ' + FieldByName('DtPrEnd').AsString;

    if not FieldByName('Notes').IsNull
        and (FieldByName('Notes').AsString > '') then
      Msg := Msg + ';  Примеч: = ' + FieldByName('Notes').AsString;

    AddLog(Now, EmplId, 'Ввод надбавки', gc_AppNmUsr, 'Z_Nadb', Msg);
  end;
end;

//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
procedure TDmMain.AddLog(mDtTm : TDateTime; nTabN : integer;
                                cNmEvnt, cNmUsr, cNmTbl, cMsg : string);
begin
  if Length(cMsg) > 250 then
    cMsg := Copy(cMsg, 1, 250);
  with qryLog do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into DBLOG (DtEvnt, NmEvnt, TabN, KdUsr, NmUsr, NmTbl, ' +
            ' Notes) values ("NOW", :cNmEvnt, :nTabN, :nKdUsr, :cNmUsr, ' +
            ' :cNmTbl, :cMsg)');
                           // В DtEvnt будет вводиться "NOW" - серверное время}
    ParamByName('cNmEvnt').AsString := cNmEvnt;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('nKdUsr').AsInteger := nAppKdUsr; // он виден отовсюду
    ParamByName('cNmUsr').AsString := cNmUsr;
    ParamByName('cNmTbl').AsString := cNmTbl;
    ParamByName('cMsg').AsString := cMsg;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.AddPSToOtkl(cVidN : ShortString; nTabN : integer;
                                                   dDtPrc, dMesPS : TDateTime);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_Otkl (KdSps, DtProc, ZaMesGod, TabN, VidN, PDN) ' +
            ' values (1, :dDtPrc, :dMesPS, :nTabN, :cVidN, 1)');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('dMesPS').AsDateTime := dMesPS;
    ParamByName('cVidN').AsString    := cVidN;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.AddPereschetInOtkl(nKdSps, nTabN : integer;
                                                 dDtProc, dDtBeg : TDateTime);
//var nY, nM, nD : word; dDtTmp, dDtZaMG, dDt_Beg, dDt_End : TDateTime;
begin
{         Выключено до лучших времен 12-09-2006
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from SetPereschet (:nKdSps, :nTabN, :cVidN, ' +
            ' :dDtProc, :dZaMG, null, null, :cNotes)');
    Prepare;
  end;
  DecodeDate(dDtBeg, nY, nM, nD);
  dDtTmp := EncodeDate(nY, nM, 1);
  while true do begin
    with qryTmp do begin
      ParamByName('nKdSps').AsInteger   := nKdSps;
      ParamByName('nTabN').AsInteger    := nTabN;
      ParamByName('cVidN').AsString     := '8801';    // Вид пересчета ПМ
      ParamByName('dDtProc').AsDateTime := dDtProc;
      ParamByName('dZaMG').AsDateTime   := dDtTmp;
      ParamByName('cNotes').AsString    := 'НеТрогать!';
      Open;
      Close;
    end;
    nM := nM + 1;
    if nM > 12 then begin
      nM := 1;
      nY := nY + 1;
    end;
    dDtTmp := EncodeDate(nY, nM, 1);
    if dDtTmp >= dDtProc then
      Break;
  end;
  with qryTmp do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
    DataBaseName := '';
  end;
}
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetObjInfo(nKdObj : integer;
                              var cShObj, cNmObj, cFioUpoln : string;
                              var nKdUPos, nKassa, nKdSpZ : integer);
begin
  cShObj := '';
  cNmObj := '';
  cFioUpoln := '';
  nKdUPos := 0;
  nKassa := 0;
  nKdSpZ := 0;
  with qryObjLU do begin
    if not Active then begin
      DataBaseName := CESMAIN;
      Open;
    end;
    if Locate('KdObj', nKdObj, []) then begin
      cShObj    := qryObjLU.FieldByName('ShObj').AsString;
      cNmObj    := qryObjLU.FieldByName('NmObj').AsString;
      cFioUpoln := qryObjLU.FieldByName('FioUpoln').AsString;
      nKdUPos   := qryObjLU.FieldByName('KdUPos').AsInteger;
      nKassa    := qryObjLU.FieldByName('Kassa').AsInteger;
      nKdSpZ    := qryObjLU.FieldByName('KdSpZ').AsInteger;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.TabN2FamIO(nTabN : integer) : string;
//var nSvTabN : integer;
begin
  // Переделать на протой вызов из Z_UPI
  Result := '';
  with qryTmp3 do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_UPI where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    if RecordCount > 0 then
      Result := MyFamIO(FieldByName('Fam').AsString,
                               FieldByName('Ima').AsString,
                                      FieldByName('Otch').AsString);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetUpiInfo(nTabN : integer;
                             var cFamIO, cFam, cIma, cOtch, cPol, cID : string;
                                  var dDOB : TDateTime) : boolean;
begin
  Result := false;
  cFamIO := '';
  cFam   := '';
  cIma   := '';
  cOtch  := '';
  cPol   := '';
  cID    := '';
  dDOB   := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Upi where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    if RecordCount > 0 then begin
      cFamIO := MyFamIO(FieldByName('Fam').AsString,
                    FieldByName('Ima').AsString, FieldByName('Otch').AsString);
      cFam   := FieldByName('Fam').AsString;
      cIma   := FieldByName('Ima').AsString;
      cOtch  := FieldByName('Otch').AsString;
      cPol   := FieldByName('Pol').AsString;
      cID    := FieldByName('ID').AsString;
      dDOB   := FieldByName('DOB').AsDateTime;
      Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.CreOtklCurMes(nZpCurY, nZpCurM : word);
begin
(*
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cAppWorkDB;
    SQL.Add(' select nu.TabN, nu.KdVidN, vn.shVidN, nu.DtProc, nu.GodN, ' +
           ' nu.MesN, nu.ZaMesGod, nu.Summa, nu.Notes, nu.Prr from Z_NU ' +
           ' nu, z_KdVidN vn where (nu.dtProc >= :dDt_6) and ' +
           ' (nu.dtProc <= :dDt_1) and ' +
           ' (nu.KdVidN in (28,30,38,46,47,48,49)) and (vn.KdVidN = nu.KdVidN) ' +
           ' order by tabN, dtProc, zaMesGod ');
    Open;
{
// Так плохо - почти 3 минуты
select nu.TabN, nu.KdVidN, vn.shVidN, nu.DtProc, nu.GodN,
       nu.MesN, nu.ZaMesGod, nu.Summa, nu.Notes, nu.Prr
  from Z_NU nu, z_KdVidN vn
  where (nu.dtProc >= '01/01/2003') and
        (nu.dtProc <= '08/01/2003') and
         (nu.KdVidN in (28,30,38,46,47,48,49)) and
          (vn.KdVidN = nu.KdVidN)
  order by tabN, dtProc, zaMesGod

// Так хорошо - менее 2 сек.
select nu.TabN, nu.KdVidN, vn.shVidN, nu.DtProc, nu.GodN,
       nu.MesN, nu.ZaMesGod, nu.Summa, nu.Notes, nu.Prr
  from Z_NU nu
    left outer join z_KdVidN vn on (vn.KdVidN = nu.KdVidN)
  where (nu.dtProc >= '01/01/2003') and
        (nu.dtProc <= '08/01/2003') and
         (nu.KdVidN in (28,30,38,46,47,48,49))
  order by tabN, dtProc, zaMesGod
}
{
select *
  from Z_NU
  where (ZaMesGod = '01/01/2004')
}
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TDmMain.SetUpdTblMsg(cNmTbl : ShortString; nKdUsr : integer;
                                                      var nNewUpdNR : integer);
var bIsRecord : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from GetNewUpdNR');
    Open;
    nNewUpdNR := FieldByName('NewUpdNr').AsInteger;
    Close;
    SQL.Clear;
    SQL.Add('Select * from Z_UpdTables where NmTbl = :cNmTbl');
    ParamByName('cNmTbl').AsString := cNmTbl;
    Open;
    bIsRecord := (RecordCount > 0) and not FieldByName('NmTbl').IsNull;
    Close;
    if not bIsRecord then begin
      SQL.Clear;
      SQL.Add('Insert Into Z_UpdTables values (:cNmTbl, :nKdUsr, :nNewUpdNR)');
      ParamByName('cNmTbl').AsString := cNmTbl;
      ParamByName('nKdUsr').AsInteger := nKdUsr;
      ParamByName('nNewUpdNR').AsInteger := nNewUpdNr;
      ExecSQL; end
    else begin
      SQL.Clear;
      SQL.Add('Update Z_UpdTables set LastUpdNR = :nNewUpdNR, ' +
              ' KdUsr = :nKdUsr where NmTbl = :cNmTbl');
      ParamByName('cNmTbl').AsString := cNmTbl;
      ParamByName('nKdUsr').AsInteger := nKdUsr;
      ParamByName('nNewUpdNR').AsInteger := nNewUpdNr;
      ExecSQL;
    end;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.CheckStru;
var {bExists,} bIsPole : boolean;
begin
  //Form_Dm.CheckStru; // запустить похожую процедуру в модуле a_DM
  with qryTmp do begin  // и теперь "местную"
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from E_Days');
    Open;
    bIsPole := IsPole('XOtp', qryTmp);
    Close;
    if not bIsPole then begin
      SQL.Clear;
      SQL.Add('Alter table E_Days add XOtp Char(1), ' +
              ' add XBln Char(1)');
      TRY ExecSQL; EXCEPT END;
      SQL.Clear;
    end;
    SQL.Clear;
    DataBaseName := '';
  end;
(*
  with qryTmp do begin  // и теперь "местную"
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 1 * from z_HIndx');
    Open;
    bIsPole := IsPole('KdUsr', qryTmp);
    Close;
    if not bIsPole then begin
      SQL.Clear;
      SQL.Add('Alter table z_HIndx add NrVdPv Integer, ' +
              ' add DtVdPv TimeStamp, add KdUsr SmallInt');
      TRY ExecSQL; EXCEPT END;
      SQL.Clear;
    end;
    SQL.Clear;
    DataBaseName := '';
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TDmMain.DataModuleCreate(Sender: TObject);
begin
  nFalsNrForDPere := -1000;
//  CreOpenCdsVidN;
  CheckStru;
//  CreOpenCdsSBU;
  CreOpenCdsPdN;
  PrepareQryBLS;  // для "быстрого" доступа к банковским ЛС
  CreOpenCdsShkPPS;
  CreOpenCdsPF;
  CreOpenCdsEDays;
  CreOpenCdsSovm;
  CreOpenCdsBankiLsLU(Date);

  qryKoefOtp.Open;
  bOtklNewRec := false;
  bOtklVvodInZaMesGod := false;
  bOtklVvodInDtBeg := false;
  bOtklVvodInDtEnd := false;
  nTabelTabN := 0;
  nTabelKdVidN := 0;
  dTabelDtBeg := 0;
end;
//------------------------------------------------------------------------------
function TDmMain.NewSpec_NR : integer;
begin
    {Такая же функция есть и в других программах (напр. ES_KMD). Не вынесена в
     A_DM, чтобы не перегружать тамошнюю qryTmp и не влететь в ситуацию, когда
     Form_Dm.qryTmp не окончив одну работу, вызывается для другой}
  // Тут (в ES_ZPL) Spec_NR используется при расчетах больничных, отпускных,
  // в связке Z_Pere с z_CmbOkl при сборных окладах,
  // в Z_Nadb, z_Udrg, чтобы на него сослаться при расчетах
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select NewSpecNr as Spec_Nr from GetNewSpecNr');
    Open;
    Result := FieldByName('Spec_NR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.NewKdSovm : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdSovm) as MaxNr from Z_KdSovm');
    Open;
    if (RecordCount > 0) and (not FieldByName('MaxNR').IsNull) then
      Result := FieldByName('MaxNR').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.NewKdPst : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdPst) as MaxKd from Z_Pst');
    Open;
    if (RecordCount > 0) and (not FieldByName('MaxKd').IsNull) then
      Result := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.cdsSBUBeforeOpen(DataSet: TDataSet);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_Sbu order by AIndx');
    Open;
  end;
  dspTmp.DataSet := qryTmp;
  cdsSBU.ProviderName := 'dspTmp';
end;
//------------------------------------------------------------------------------
procedure TDmMain.cdsSBUAfterOpen(DataSet: TDataSet);
begin
  qryTmp.Close;
  dspTmp.DataSet := NIL;
  cdsSBU.ProviderName := '';
end;
//------------------------------------------------------------------------------
function TDmMain.SchBU2KdSBU(var cSchBU : ShortString; var nKdSbu : SmallInt;
                                               var bHsChld : boolean) : boolean;
begin
  Result := false;
  with cdsSBU do begin
    if not Active then begin
      Open;
      if bFlagDbg then
        SaveToFile(cDirTemp + 'cdsSbu.cds');
    end;
{
    IndexName := 'cdsSbuSchBU';
    EditKey;
    FieldByName('Sch_17').AsString := cSchBU;
    if GoToKey then begin
}
    if Locate('Sch_17',cSchBU, []) then begin
      Result := true;
      cSchBU := FieldByName('Sch_17').AsString;
      nKdSbu := FieldByName('KdSch').AsInteger;
      bHsChld := FieldByName('HsCh').AsString = 'T';
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.KdSbu2SchBU(nKdSbu : integer) : string;
begin
  Result := '';
  with cdsSBU do begin
    if not Active then
      Open;
    IndexName := 'cdsSbuKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSbu;
    if GoToKey then
//      Result := FieldByName('SchBU').AsString;
      Result := FieldByName('Sch_17').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.KdSbu2KdPSch(nKdSbu : integer) : integer;
var nPIndx, nLvl : integer;
begin
  Result := 0;
  with cdsSBU do begin
    if not Active then begin
      Open;
      if bFlagDbg then
        SaveToFile(cDirTemp + 'cdsSbu.cds');
    end;
    IndexName := 'cdsSbuKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSbu;
    if GoToKey then begin
      nLvl := FieldByName('Lvl').AsInteger;
      nPIndx := FieldByName('PIndx').AsInteger;
      if (nPIndx >= 0) and
                   Locate('Lvl;Indx', VarArrayOf([nLvl-1, nPIndx]), []) then
        Result := FieldByName('KdSch').AsInteger;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.KdSbu2NmSbu(nKdSbu : integer) : string;
begin
  Result := '';
  with cdsSbu do begin
    if not Active then Open;
    IndexName := 'cdsSbuKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSbu;
    if GoToKey then
      Result := FieldByName('NmSch').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.KdSbu22NmSbu(nKdSbu : integer;
                                       var cPSch, cNmSBU : string) : string;
begin
  Result := '';
  cPSch  := '';
  cNmSBU := '';
  with cdsSbu do begin
    if not Active then Open;
    IndexName := 'cdsSbuKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSbu;
    if GoToKey then begin
      cPSch  := FieldByName('PSch').AsString;
      cNmSBU := FieldByName('NmSch').AsString;
      Result := FieldByName('SchBU').AsString;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.CreOpenCdsPdN;
begin
  if cdsPdN.Active then cdsPdN.Close;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_TblPdN order by dtProc desc, Porog desc');
    Open;
  end;
  dspTmp.DataSet := qryTmp;
  cdsPdN.ProviderName := 'dspTmp';
  cdsPdN.Open;
  cdsPdN.IndexName := 'cdsPdN_DtProcPorogDesc';
  qryTmp.Close;
  dspTmp.DataSet := NIL;
  cdsPdN.ProviderName := '';
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetShkPps(dAnyDate : TDateTime; nSmDohoda : double;
                            var nSmConst, nPrc, nSmPoroga, nMaxPorog : double;
                                                           var cVidN : string4);
var nCntRec, i : integer;
begin
  nSmConst := 0;
  nPrc := 0;
  nSmPoroga := 0;
  cVidN := '';
  with cdsShkPPS do begin
    if not Active then
      CreOpenCdsShkPPS;
    // сортирован by dtProc desc, Porog desc
    nCntRec := RecordCount;
    i := 0;
    First;
    while not Eof do begin
      Inc(i);
      if (FieldByName('DtProc').AsDateTime <= dAnyDate) or {в случае непопадания
                           никуда - беру из последней} (i = nCntRec) then begin
        nMaxPorog := Max(nMaxPorog,FieldByName('Porog').AsFloat);
        if (FieldByName('Porog').AsFloat < nSmDohoda) then begin
          nSmConst  := FieldByName('Smm').AsFloat;
          nPrc      := FieldByName('Prc').AsFloat;
          nSmPoroga := FieldByName('Porog').AsFloat;
          Break;
        end;
      end;
      Next;
    end;
  end;
  if (nPrc = 5) or (nPrc = 0) then
    cVidN := '6415'
  else if nPrc = 4 then
    cVidN := '6414'
  else if nPrc = 3 then
    cVidN := '6413'
  else if nPrc = 2 then
    cVidN := '6412'
  else
    cVidN := '6411';
end;
//------------------------------------------------------------------------------
procedure TDmMain.CreOpenCdsShkPPS;
begin
  if cdsShkPPS.Active then cdsShkPPS.Close;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_TblPPS order by dtProc desc, Porog desc');
    Open;
  end;
  dspTmp.DataSet := qryTmp;
  cdsShkPPS.ProviderName := 'dspTmp';
  cdsShkPPS.Open;
  cdsShkPPS.IndexName := 'cdsShkPPS_DtProcPorogDesc';
  qryTmp.Close;
  dspTmp.DataSet := NIL;
  cdsShkPPS.ProviderName := '';
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetShkNePps(dAnyDate : TDateTime; nSmDohoda : double;
                           var nSmConst, nPrc, nSmPoroga, nMaxPorog : double;
                                                         var cVidN : string4);
var nCntRec, i : integer;
begin
  nSmConst := 0;
  nPrc := 0;
  nSmPoroga := 0;
  cVidN := '';
  with cdsPF do begin
    if not Active then
      CreOpenCdsPF;
    // сортирован by dtProc desc, Porog desc
    nCntRec := RecordCount;
    i := 0;
    First;
    while not Eof do begin
      Inc(i);
      if (FieldByName('DtProc').AsDateTime <= dAnyDate) or {в случае непопадания
                   никуда беру данные последней записи} (i = nCntRec) then begin
        nMaxPorog := Max(nMaxPorog,FieldByName('Porog').AsFloat);
        if (FieldByName('Porog').AsFloat < nSmDohoda) then begin
          nSmConst  := FieldByName('Smm').AsFloat;
          nPrc      := FieldByName('Prc').AsFloat;
          nSmPoroga := FieldByName('Porog').AsFloat;
          Break;
        end;
      end;
      Next;
    end;
  end;
  if (nPrc = 2) or (nPrc = 0) then
    cVidN := '6402'
  else
    cVidN := '6401';
end;
//------------------------------------------------------------------------------
procedure TDmMain.CreOpenCdsPF;
begin
  if cdsPF.Active then
    cdsPF.Close;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_TblPF order by dtProc desc, Porog desc');
    Open;
  end;
  dspTmp.DataSet := qryTmp;
  cdsPF.ProviderName := 'dspTmp';
  cdsPF.Open;
  cdsPF.IndexName := 'cdsPF_DtProcPorogDesc';
  qryTmp.Close;
  dspTmp.DataSet := NIL;
  cdsPF.ProviderName := '';
end;
//------------------------------------------------------------------------------
procedure TDmMain.CreOpenCdsEDays;
begin
  if cdsEDays.Active then cdsEDays.Close;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from E_Days order by E_Day, NR');
    Open;
  end;
  dspTmp.DataSet := qryTmp;
  cdsEDays.ProviderName := 'dspTmp';
  cdsEDays.Open;
  cdsEDays.IndexName := 'cdsEDays_EDayDesc';
  qryTmp.Close;
  dspTmp.DataSet := NIL;
  cdsEDays.ProviderName := '';
end;
//------------------------------------------------------------------------------
function TDmMain.KdShPdn2ShShPdn(nKdSh : SmallInt) : ShortString;
begin
  Result := '';
  if not qryShPdn_LU.Active then
    qryShPdn_LU.Open;
  if qryShPdn_LU.Locate('KdSh', nKdSh, []) then
    Result := qryShPdn_LU.FieldByName('ShSh').AsString;
end;
//------------------------------------------------------------------------------
function TDmMain.KdSo2ShSo(nKdSo : SmallInt) : ShortString;
begin
  Result := '';
  if not qrySysOpl_LU.Active then
    qrySysOpl_LU.Open;
  if qrySysOpl_LU.Locate('KdOpl', nKdSo, []) then
    Result := qrySysOpl_LU.FieldByName('NmOpl').AsString;
end;
//------------------------------------------------------------------------------
function TDmMain.KdSovm2ShSovm(nKdSovm : SmallInt) : ShortString;
begin
  Result := '';
  if not cdsSovm.Active then
    CreOpenCdsSovm;
  if cdsSovm.Locate('KdSovm', nKdSovm, []) then
    Result := cdsSovm.FieldByName('ShSovm').AsString;
end;
//------------------------------------------------------------------------------
procedure TDmMain.CreOpenCdsSovm;
begin
  if cdsSovm.Active then cdsSovm.Close;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_KdSovm order by KdSovm');
    Open;
  end;
  dspTmp.DataSet := qryTmp;
  cdsSovm.ProviderName := 'dspTmp';
  cdsSovm.Open;
  qryTmp.Close;
  dspTmp.DataSet := NIL;
  cdsSovm.ProviderName := '';
end;
//------------------------------------------------------------------------------
procedure TDmMain.CreOpenCdsBankiLsLU(dOnDate : TDateTime);
begin
{
  Переделать под события с СибБанком:
Select distinct Cast(Null as integer) as NR, LS.TabN, p.DtBeg,
                                   p.LicSch, p.KdBnk, p.Notes
 from Z_BankiLS LS
 Left Outer Join Z_Get_BnkLS(ls.TabN, '04/01/2009') p on (1=1)
 where not p.KdBnk is Null
 order by ls.TabN
}

  if cdsBankiLsLU.Active then cdsBankiLsLU.Close;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
//    SQL.Add('Select * from Z_BankiLS order by TabN, DtBeg'); до того !!!
    SQL.Add('Select distinct Cast(Null as integer) as NR, LS.TabN, p.DtBeg, ' +
            ' p.LicSch, p.KdBnk, p.Notes from Z_BankiLS LS ' +
            ' Left Outer Join Z_Get_BnkLS(ls.TabN, :dOnDate) p on (1=1) ' +
            ' where not p.KdBnk is Null order by ls.TabN');
    ParamByName('dOnDate').AsDateTime := dOnDate;
    Open;
  end;
  dspTmp.DataSet := qryTmp;
  cdsBankiLsLU.ProviderName := 'dspTmp';
  cdsBankiLsLU.Open;
  qryTmp.Close;
  dspTmp.DataSet := NIL;
  cdsBankiLsLU.ProviderName := '';
end;
//------------------------------------------------------------------------------
function TDmMain.KdBnk2NmBnk(nKdBnk : integer;
                                        var cShBnk : ShortString) : ShortString;
begin
  Result := '';
  cShBnk := '';
  with qryBanki do begin
    if not Active then Open;
    if Locate('KdBnk', nKdBnk, []) then begin
      Result := FieldByName('NmBnk').AsString;
      cShBnk := FieldByName('ShBnk').AsString;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetBankiLS(nTabN : integer; dOnDate : TDateTime;
                                             var nKdBnk : SmallInt) : string;
begin
  Result := '';
  nKdBnk := 0;          // TYTYTYT учесть дату dDtMes
  if not cdsBankiLsLU.Active then
    CreOpenCdsBankiLsLU(dOnDate);
  if cdsBankiLsLU.Locate('TabN', nTabN, []) then begin
    nKdBnk := cdsBankiLsLU.FieldByName('KdBnk').AsInteger;
    Result := cdsBankiLsLU.FieldByName('LicSch').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.Budget(nGod, nMes : integer;
                       var nCntDay, nCntWorkDay : integer) : double;
var dTmp, dDtFirst, dDtLast : TDateTime; bIsEDays, bMore : boolean;
    nDayOfWeek : integer;
begin
  // рассчитать бюджет заданного месяца
  // TYTYTYTYTYTYT  переделать на CdsEDays (он все равно уже создан)
  dDtFirst := EncodeDate(nGod, nMes, 1);
  dDtLast := myLastDOM(dDtFirst + 27);
  Result := 0;
  nCntDay := 0;
  nCntWorkDay := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from E_Days ' +
            ' where (E_Day >= :dDtFirst) and (E_Day <= :dDtLast)');
    ParamByName('dDtFirst').AsDateTime := dDtFirst;
    ParamByName('dDtLast').AsDateTime := dDtLast;
    Open;
    bIsEDays := RecordCount <> 0;
    bMore := true;
    dTmp := dDtFirst;
    while bMore do begin
      Inc(nCntDay);
      if bIsEDays and Locate('E_Day', dTmp, []) then begin
        Result := Result + FieldByName('Rab_Chas').AsFloat;
        if FieldByName('Rab_Chas').AsFloat <> 0 then
          Inc(nCntWorkDay);
        end
      else begin
        nDayOfWeek := DayOfWeek(dTmp);
        if (nDayOfWeek > 1) and (nDayOfWeek < 7) then begin
          Result := Result + nAppCnrWrkChasInDay;
          Inc(nCntWorkDay);
        end;
      end;
      dTmp := dTmp + 1;
      if dTmp > dDtLast then
        bMore := false;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.CountWorkChas(d_DtB, d_DtE : TDateTime) : double;
var dTmp : TDateTime; bIsEDays, bMore : boolean; nDayOfWeek : integer;
begin
  // рассчитать к-во рабочих часов между d_DtB и d_DtE
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from E_Days ' +
            ' where (E_Day >= :d_DtB) and (E_Day <= :d_DtE)');
    ParamByName('d_DtB').AsDateTime := d_DtB;
    ParamByName('d_DtE').AsDateTime := d_DtE;
    Open;
    bIsEDays := RecordCount <> 0;
    bMore := true;
    dTmp := d_DtB;
    while bMore do begin
      if bIsEDays and Locate('E_Day', dTmp, []) then
        Result := Result + FieldByName('Rab_Chas').AsFloat
      else begin
        nDayOfWeek := DayOfWeek(dTmp);
        if (nDayOfWeek > 1) and (nDayOfWeek < 7) then
          Result := Result + nAppCnrWrkChasInDay;
      end;
      dTmp := dTmp + 1;
      if dTmp > d_DtE then
        bMore := false;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.OldVidN2VidN(nOldVidN : integer) : string4;
begin
  // nOldVidN - из старого KodVid.dbf  Result - совсем новый VidN (string4)
  Result := '';
  with qryVidN_LU do begin
    if not Active then begin
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Select * from Z_KdVidN order by VidN');
      Open;
    end;
    if Locate('OldKdVidN', nOldVidN, []) then
      Result := FieldByName('VidN').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.OldOV2KdObj(nOldObj, nOldVed : integer) : integer;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from T_OVK ' +
               ' where OldObj = :nOldObj and OldVed = :nOldVed');
    ParamByName('nOldObj').AsInteger := nOldObj;
    ParamByName('nOldVed').AsInteger := nOldVed;
    Open;
    if (RecordCount > 0) and not FieldByName('KdObj').IsNull then
      Result := FieldByName('KdObj').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.CountWorkDays(d_DtB, d_DtE : TDateTime) : double;
var dTmp : TDateTime; bIsEDays, bMore : boolean;
    nDayOfWeek : integer;
begin
  // рассчитать к-во рабочих дней между d_DtB и d_DtE
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from E_Days ' +
            ' where (E_Day >= :d_DtB) and (E_Day <= :d_DtE)');
    ParamByName('d_DtB').AsDateTime := d_DtB;
    ParamByName('d_DtE').AsDateTime := d_DtE;
    Open;
    bIsEDays := RecordCount <> 0;
    bMore := true;
    dTmp := d_DtB;
    while bMore do begin
      if bIsEDays and Locate('E_Day', dTmp, []) then begin
        if FieldByName('Rab_Chas').AsFloat > 0 then
          Result := Result + 1; end
      else begin
        nDayOfWeek := DayOfWeek(dTmp);
        if (nDayOfWeek > 1) and (nDayOfWeek < 7) then
          Result := Result + 1;
      end;
      dTmp := dTmp + 1;
      if dTmp > d_DtE then
        bMore := false;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryNadbAfterDelete(DataSet: TDataSet);
var nNR : integer; bEof : boolean;
begin
  nNR  := 0;
  bEof := false;
  with qryNadb do begin
    ApplyUpdates;
    if Eof then
      bEof := true
    else
      nNR := FieldByName('NR').AsInteger;
    Close;
    Open;
    if bEof then
      Last
    else
      Locate('NR', nNR, []);
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryNadbBeforePost(DataSet: TDataSet);
begin
  with QryNadb do
    if FieldByName('Spec_NR').IsNull
      or (FieldByName('Spec_NR').AsInteger = 0)
    then
      FieldByName('Spec_NR').AsInteger := NewSpec_NR;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryNadbAfterPost(DataSet: TDataSet);
var nNR : integer;
begin
  with qryNadb do begin
    nNR := FieldByName('NR').AsInteger;
    ApplyUpdates;
    Close;
    Open;
    if nNR <> 0 then
      Locate('NR', nNR, [])
    else
      Last;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryNadbNewRecord(DataSet: TDataSet);
begin
  // Не разрешать добавлять ПРЯМО в таблицу !
  qryNadb.Cancel;
end;

//------------------------------------------------------------------------------
procedure TDmMain.QryPrmUvAfterDelete(DataSet: TDataSet);
var nSvNR : integer; bEof : boolean;
begin
  nSvNR  := 0;
  bEof := false;
  with qryPrmUv do begin
    ApplyUpdates;
    if Eof then
      bEof := true
    else
      nSvNR := FieldByName('NR').AsInteger;
    Close;
    Open;
    if bEof then
      Last
    else
      Locate('NR', nSvNR, []);
  end;
end;

//------------------------------------------------------------------------------
function TDmMain.MySredneMes(nCntMes : word; nTabN : integer;
                                                   dDtBeg : TDateTime) : double;
var nY, nM, nD, i : word; dDtMin, dDtMax : TDateTime;
begin
  // Возвращает среднемесячный заработок по nTabN за nCntMes месяцев,
  // начиная с предшествующего месяцу, рассчитанному по dDtBeg, на nCntMes вниз
  Result := 0;
  DecodeDate(dDtBeg, nY, nM, nD);
  Inc(nM, -1);
  if nM = 0 then begin
    nM := 12;
    Inc(nY, -1);
  end;
  i := 1;
  dDtMax := EncodeDate(nY, nM, 1);
  while i < nCntMes do begin
    Inc(nM, -1);
    if nM = 0 then begin
      nM := 12;
      Inc(nY, -1);
    end;
    Inc(i);
  end;
  dDtMin := EncodeDate(nY, nM, 1);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    { Уточнить, какие виды нужно брать для расчета среднего TYTYTYT}
    SQL.Add('Select ZaMesGod, sum(Summa) as SMM from Z_NU ' +
            ' where (TabN = :nTabN) and ' +
            ' (ZaMesGod >= :dDtMin) and ' +
            ' (ZaMesGod <= :dDtMax) and ' +
            ' (VidN < "6000") and not VidN in ("1005","1006","1007","1008") ' +
            ' group by ZaMesGod');
    ParamByName('nTabN').AsInteger   := nTabN;
    ParamByName('dDtMin').AsDateTime := dDtMin;
    ParamByName('dDtMax').AsDateTime := dDtMax;
    //ParamByName('nKdSps').AsInteger  := nKdSps;
    Open;
    nCntMes := 0;
    while not Eof do begin
      Inc(nCntMes);
      Result := Result + FieldByName('SMM').AsFloat;
      Next;
    end;
    if nCntMes > 0 then
      Result := Result / nCntMes;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.QryPereAfterDelete(DataSet: TDataSet);
var nNR : integer; bEof : boolean;
begin
  nNR  := 0;
  bEof := false;
  with qryPere do begin
    ApplyUpdates;
    if Eof then
      bEof := true
    else
      nNR := FieldByName('NR').AsInteger;
    Close;
    Open;
    if bEof then
      Last
    else
      Locate('NR', nNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.QryPrmUvAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  with qryPrmUv do begin
    nSvNR := FieldByName('NR').AsInteger;
    ApplyUpdates;
    Close;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, [])
    else
      Last;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.QryPereAfterPost(DataSet: TDataSet);
var nSvNR, nSO : integer; nOklTrf : double; dDtBeg : TDateTime;
    cDolgn : string;
begin
  nSO := 0;
  nOklTrf := 0;
  cDolgn  := '';
  dDtBeg  := 0;
  with qryPere do begin
    nSvNR := FieldByName('NR').AsInteger;
    if nSvNR = 0 {значит dsInsert и NR еще пустой} then begin
      nSO := FieldByName('SO').AsInteger;
      nOklTrf := FieldByName('OklTrf').AsFloat;
      cDolgn  := FieldByName('Dolgnost').AsString;
      dDtBeg  := FieldByName('Dt_Beg').AsDateTime;
    end;
    if UpdatesPending then
      ApplyUpdates;
    Close;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, [])
    else
      Locate('Dt_Beg;Dolgnost;OklTrf;SO',
                   VarArrayOf([dDtBeg, cDolgn, nOklTrf, nSO]), []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.QryPereBeforeInsert(DataSet: TDataSet);
begin
  with qryPere do begin
    if RecordCount > 0 then begin
      if FormZpMain.PopSortPereAscend.Checked then
         Last
      else
         First;
      cSvObj        := FieldByName('KdObj').AsString;
      cSvKdKatP     := FieldByName('KdKatP').AsString;
      cSvSO         := FieldByName('SO').AsString;
      cSvOklTrf     := FieldByName('OklTrf').AsString;
      cSvAvans      := FieldByName('Avans').AsString;
      cSvPrcWrkTime := FieldByName('PrcWrkTime').AsString;
      cSvProcLG     := FieldByName('ProcLG').AsString;
      cSvSpAv       := FieldByName('Sp_Av').AsString;
      cSvDolgnost   := FieldByName('Dolgnost').AsString;
      cSvKdSpz      := FieldByName('KdSPZ').AsString;
      cSvPrPens     := FieldByName('Pr_Pens').AsString;
      cSvSovm       := FieldByName('Sovm').AsString;
      cSvPdNlg      := FieldByName('PdNlg').AsString;
      cSvKolMin     := FieldByName('KolMin').AsString;
      cSvPrfs       := FieldByName('Prfs').AsString;
      cSvNrPrikaza  := FieldByName('Nr_Prikaza').AsString;
      cSvDtPrikaza  := FieldByName('Dt_Prikaza').AsString;
      cSvNotes      := FieldByName('Notes').AsString;
      cSvInv        := FieldByName('Inv').AsString;
      cSvRang       := FieldByName('Rang').AsString;
      cSvRazr       := FieldByName('Razr').AsString;
      cSvOldKdOK    := FieldByName('OldKdOk').AsString;
      cSvNewKdOk    := FieldByName('NewKdOk').AsString;
      end
    else begin
      cSvObj        := '';
      cSvKdKatP     := '';
      cSvSO         := '';
      cSvOklTrf     := '';
      cSvAvans      := '';
      cSvPrcWrkTime := '';
      cSvProcLG     := '';
      cSvSpAv       := '';
      cSvDolgnost   := '';
      cSvKdSpz      := '';
      cSvPrPens     := '';
      cSvSovm       := '';
      cSvPdNlg      := '';
      cSvKolMin     := '';
      cSvPrfs       := '';
      cSvNrPrikaza  := '';
      cSvDtPrikaza  := '';
      cSvNotes      := '';
      cSvInv        := '';
      cSvRang       := '';
      cSvRazr       := '';
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.QryPereNewRecord(DataSet: TDataSet);
begin
  with qryPere do begin
    FieldByName('TabN').AsInteger :=
                  DataSource.DataSet.FieldByName('TabN').AsInteger;
    FieldByName('BM').AsString      := ' ';
    FieldByName('Dt_Beg').AsDateTime   := SysUtils.Date;
    FieldByName('KdObj').AsString      := cSvObj;
    FieldByName('KdKatP').AsString     := cSvKdKatP;
    FieldByName('SO').AsString         := cSvSO;
    FieldByName('OklTrf').AsString     := cSvOklTrf;
    FieldByName('Avans').AsString      := cSvAvans;
{ commented on Sept.9.2024: annoying view of 100
    if cSvPrcWrkTime = '' then
      cSvPrcWrkTime := '100';
}
    FieldByName('PrcWrkTime').AsString := cSvPrcWrkTime;
    FieldByName('ProcLG').AsString     := cSvProcLG;
    FieldByName('Sp_Av').AsString      := cSvSpAv;
    FieldByName('Dolgnost').AsString   := cSvDolgnost;
    FieldByName('KdSPZ').AsString      := cSvKdSpz;
    if FieldByName('KdSpZ').IsNull or (FieldByName('KdSpZ').AsString = '') then
      FieldByName('KdSpZ').AsInteger :=
                                   GetPdrKdSpZ(FieldByName('KdObj').AsInteger);
    FieldByName('Pr_Pens').AsString    := cSvPrPens;
    FieldByName('Sovm').AsString       := cSvSovm;
    FieldByName('PdNlg').AsString      := cSvPdNlg;
    FieldByName('KolMin').AsString     := cSvKolMin;
    FieldByName('Prfs').AsString       := cSvPrfs;
    FieldByName('Nr_Prikaza').AsString := cSvNrPrikaza;
    FieldByName('Dt_Prikaza').AsString := cSvDtPrikaza;
    FieldByName('Notes').AsString      := cSvNotes;
    FieldByName('Inv').AsString        := cSvInv;
    FieldByName('Rang').AsString       := cSvRang;
    FieldByName('Razr').AsString       := cSvRazr;
    FieldByName('OldKdOk').AsString    := cSvNewKdOk;
    FieldByName('NewKdOk').AsString    := cSvNewKdOk;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetPdrKdSpZ(nKdObj : integer) : integer;
begin
  Result := 0;
  if qryObjLU.Locate('KdObj', nKdObj, []) then
    Result := qryObjLU.FieldByName('KdSpZ').AsInteger;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryUdrgAfterDelete(DataSet: TDataSet);
var nNR : integer; bEof : boolean;
begin
  nNR  := 0;
  bEof := false;
  with qryUdrg do begin
    ApplyUpdates;
    if Eof then
      bEof := true
    else
      nNR := FieldByName('NR').AsInteger;
    Close;
    Open;
    if bEof then
      Last
    else
      Locate('NR', nNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryUdrgBeforePost(DataSet: TDataSet);
begin
  if qryUdrgSpec_NR.IsNull or (qryUdrgSpec_NR.AsInteger = 0) then
    qryUdrgSpec_NR.AsInteger := NewSpec_NR;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryUdrgAfterPost(DataSet: TDataSet);
var nNR, nKdSpZ : integer; cVidN : string4;
    nSumVzn : double; dDtBeg, dDtEnd : TDateTime; cNomDok, cKomu : string;
begin
  nNR := 0;
  cVidN := '';
  nKdSpZ  := 0;
  nSumVzn := 0;
  dDtBeg  := 0;
  dDtEnd  := 0;
  cNomDok := '';
  cKomu   := '';
  with qryUdrg do begin
    if State = dsEdit then
      nNR := FieldByName('NR').AsInteger
    else begin // значит dsInsert
      cVidN := FieldByName('VidN').AsString;
      nKdSpz  := FieldByName('KdSpZ').AsInteger;
      nSumVzn := FieldByName('SumVzn').AsFloat;
      dDtBeg  := FieldByName('Dt_Beg').AsDateTime;
      dDtEnd  := FieldByName('Dt_End').AsDateTime;
      cNomDok := FieldByName('NomDok').AsString;
      cKomu   := FieldByName('Komu').AsString;
    end;
    ApplyUpdates;
    Close;
    Open;
    if nNR <> 0 then
      Locate('NR', nNR, [])
    else
      Locate('VidN;SumVzn;Dt_Beg;Dt_End;KdSpZ;NomDok;Komu',
                   VarArrayOf([cVidN, nSumVzn, dDtBeg, dDtEnd,
                               nKdSpZ, cNomDok, cKomu]), []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryUdrgNewRecord(DataSet: TDataSet);
var nTabN, nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double;
    cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs : boolean;  nInv : SmallInt;
begin
  with qryUdrg do begin
    nTabN := DataSource.DataSet.FieldByName('TabN').AsInteger;
    GetPereInf(nTabN, dDtProc, nKdObj, nKdKatP, nSO, nPdNlg,
               nKolMin, nKdSpz, nRang, nRazr, nOklTrf, nAvans, nProcLG, cSpAv,
               cDolgnost, cNrPrikaza, dDtPrikaza, bPens, bSovm, bPrfs, nInv);
    FieldByName('TabN').AsInteger    := nTabN;
    FieldByName('Dt_Beg').AsDateTime := SysUtils.Date;
    FieldByName('Dt_End').AsString   := '';
//    FieldByName('KdObj').AsInteger   := nKdObj;
//    FieldByName('KdKatP').AsInteger  := nKdKatP;
    FieldByName('KdSPZ').AsInteger   := nKdSPZ;
//      FieldByName('Rang').AsInteger := nRang;
//      FieldByName('Razr').AsInteger := nRazr;
    FieldByName('SpsRsch').AsInteger   := 1;   // проценты
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.DateFieldSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyDate(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := Text;
end;
// --- Начало всех дел по вводу отклонений -------------------------------------
procedure TDmMain.qryOtklNewRecord(DataSet: TDataSet);
var nTabN, nKdObj, nKdKatP, nSO, nPdNlg, nKolMin, nKdSpz, nRang, nRazr : integer;
    nOklTrf, nAvans, nProcLG : double;
    cSpAv : string1;
    cDolgnost, cNrPrikaza : string;
    dDtPrikaza : TDateTime;
    bPens, bSovm, bPrfs : boolean; nInv : SmallInt;
begin
  nTabN := FormZpMain.qrySps.FieldByName('TabN').AsInteger;
  GetPereInf(nTabN, dDtProc, nKdObj, nKdKatP, nSO, nPdNlg, nKolMin,
               nKdSpZ, nRang, nRazr, nOklTrf, nAvans, nProcLG, cSpAv, cDolgnost,
               cNrPrikaza, dDtPrikaza, bPens, bSovm, bPrfs, nInv);
  bOtklNewRec         := true;
  bOtklVvodInZaMesGod := false;
  bOtklVvodInDtBeg    := false;
  bOtklVvodInDtEnd    := false;
  with qryOtkl do begin
    FieldByName('KdSps').AsInteger     := gl_nAppKdSpsUsr;
    FieldByName('TabN').AsInteger      := nTabN;
    FieldByName('DtProc').AsDateTime   := dDtProc;
    FieldByName('ZaMesGod').AsDateTime := dDtProc;
    FieldByName('Dt_Beg').AsDateTime   := dDtProc;
    FieldByName('Dt_End').AsDateTime   := myLastDOM(dDtProc + 27);
    FieldByName('Chas').AsFloat        := nCurBudget;
    FieldByName('PdN').AsInteger       := 1;
    FieldByName('Summa').AsFloat       := 0;
    FieldByName('KdObj').AsInteger     := nKdObj;
    FieldByName('KdKatP').AsInteger    := nKdKatP;
    FieldByName('KdSpZ').AsInteger     := nKdSpZ;
    qryOtklSchBU.AsString := KdSbu2SchBU(qryOtklKdSpZ.AsInteger);
  end;
  bOtklNewRec := false;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryOtklAfterPost(DataSet: TDataSet);
var nNR, nPdN, nKdSpz : integer; cVidN : string4;
    nChas, nSumma : double; dDtBeg, dDtEnd, dZaMG : TDateTime;
begin
  nNR     := 0;
  cVidN   := '';
  dDtBeg  := 0;
  dDtEnd  := 0;
  dZaMG   := 0;
  nKdSPZ  := 0;
  nPdN    := 0;
  nChas   := 0;
  nSumma  := 0;
  with qryOtkl do begin
    if State = dsEdit then
      nNR := FieldByName('NR').AsInteger
    else begin // значит dsInsert
      cVidN   := FieldByName('VidN').AsString;
      dDtBeg  := FieldByName('Dt_Beg').AsDateTime;
      dDtEnd  := FieldByName('Dt_End').AsDateTime;
      dZaMG   := FieldByName('ZaMesGod').AsDateTime;
      nKdSPZ  := FieldByName('KdSPZ').AsInteger;
      nPdN    := FieldByName('PdN').AsInteger;
      nChas   := FieldByName('Chas').AsFloat;
      nSumma  := FieldByName('Summa').AsFloat;
    end;
    ApplyUpdates;
    Close;
    Open;
    if nNR <> 0 then
      Locate('NR', nNR, [])
    else
      Locate('VidN;Dt_Beg;Dt_End;KdSPZ;PdN;ZaMesGod;Chas;Summa',
                         VarArrayOf([cVidN, dDtBeg, dDtEnd, nKdSPZ,
                                  nPdN, dZaMG, nChas, nSumma]), []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryOtklAfterDelete(DataSet: TDataSet);
var nNR : integer; bEof : boolean;
begin
  nNR  := 0;
  bEof := false;
  with qryOtkl do begin
    ApplyUpdates;
    if Eof then
      bEof := true
    else
      nNR := FieldByName('NR').AsInteger;
    Close;
    Open;
    if bEof then
      Last
    else
      Locate('NR', nNR, []);
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryOtklDT_BEGValidate(Sender: TField);
var
  DtBeg, DtEnd: TDateTime;
begin
  bOtklVvodInDtBeg    := true;
  bOtklNewRec         := false;
  bOtklVvodInZaMesGod := false;
  bOtklVvodInDtEnd    := false;

  with QryOtkl do begin
    // SB 24.9.2026, Сделано для вида 1204 - Ночные.
    // Теперь нужна возможность указывать дату начала, потому что в течение
    // месяца может быть несколько перемещений/окладов. Дата начала, т.о.,
    // указывает от какого оклада будет считаться отклонение. Можно указывать
    // либо только часы, либо дату начала и часы, либо дату начала и дату
    // окончания.
    // Поэтому неуказанная дата окончания - не повод обнулять часы:
    // if (Sender.AsString = '')
    //   or (FieldByName('Dt_End').AsString = '')
    // then
    //   FieldByName('Chas').AsFloat := 0
    // else begin

    DtBeg := Sender.AsDateTime;

    if DtBeg <> 0 then begin
      if (DtBeg > MyLastDOM(FieldByName('ZaMesGod').AsDateTime))
        or (DtBeg < MyFirstDOM(FieldByName('ZaMesGod').AsDateTime))
      then
        raise Exception.Create('Дата должна быть в пределах текущего месяца');

      DtEnd := FieldByName('Dt_End').AsDateTime;

      // SB 24.9.2026, Сделано для вида 1204 - Ночные.
      // Часы пересчитываются только если указаны даты и начала и окончания
      if DtEnd <> 0 then
        FieldByName('Chas').AsFloat := CountWorkChas(DtBeg, DtEnd);
    end;
    // end;
  end;
  
  bOtklVvodInDtBeg := false;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryOtklDT_ENDValidate(Sender: TField);
var
  DtBeg, DtEnd: TDateTime;
begin
//  if bOtklNewRec
//    or bOtklVvodInZaMesGod or bOtklVvodInDtBeg or bVvodIzZpZ then
//      Exit;

  bOtklVvodInDtEnd    := true;
  bOtklNewRec         := false;
  bOtklVvodInZaMesGod := false;
  bOtklVvodInDtBeg    := false;

  with QryOtkl do begin
    DtEnd := Sender.AsDateTime;

    if DtEnd = 0 then
      FieldByName('Chas').AsFloat := 0
    else begin
      if DtEnd < MyFirstDOM(FieldByName('ZaMesGod').AsDateTime) then
        raise Exception.Create('Дата должна быть в пределах текущего месяца');

      DtBeg := FieldByName('Dt_Beg').AsDateTime;

      if DtBeg <> 0 then
        FieldByName('Chas').AsFloat := CountWorkChas(DtBeg, DtEnd);
    end
  end;

  bOtklVvodInDtEnd := true;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryOtklZAMESGODSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyMesGod(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := '01-' + Text;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryOtklZAMESGODValidate(Sender: TField);
var
  MnthYear: TDateTime;
begin
//  if bOtklNewRec or bOtklVvodInDtBeg or bOtklVvodInDtEnd then
//    Exit;

  bOtklVvodInZaMesGod := true;
  bOtklNewRec         := false;
  bOtklVvodInDtBeg    := false;
  bOtklVvodInDtEnd    := false;

  MnthYear := Sender.AsDateTime;

  with QryOtkl do begin
    if MnthYear = dDtProc then begin
      FieldByName('Dt_Beg').AsDateTime := dDtProc;
      FieldByName('Dt_End').AsDateTime := dDtLastProcMes;
    end else begin
      FieldByName('Dt_Beg').AsDateTime := MnthYear;
      FieldByName('Dt_End').AsDateTime := MyLastDOM(MnthYear);
    end;

    FieldByName('Chas').AsFloat := CountWorkChas(
      FieldByName('Dt_Beg').AsDateTime, FieldByName('Dt_End').AsDateTime
    );
  end;

  bOtklVvodInZaMesGod := false;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryOtklSUMMAValidate(Sender: TField);
var cVidN : ShortString;
begin
  cVidN := qryOtklVidN.AsString;
  with qryOtkl do begin
    if (cVidN >= '5000') and (cVidN < '5100') and (Sender.AsFloat <> 0) then
      Raise Exception.Create(
               'По неоплачиваемым видам сумма должна быть нулевой');
    if ((cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008')) and
               not qryOtklSpecPS.IsNull and (qryOtklSpecPS.AsInteger > 0) then
      Raise Exception.Create(
               'Нельзя редактировать сумму в записях, подключённых пакетом');
  end;
end;

//------------------------------------------------------------------------------
function TDmMain.GetLastPriemUvolnInfo(nTabN: integer; var dDtPriem, dDtUvoln: TDateTime): boolean;
begin
  Result := false;
  InitQuery(qryTmp);
  with qryTmp do begin
    SQL.Text := 'select dt_Priem, dt_Uvoln from z_PrmUv where TabN = :tabN order by dt_Priem desc';
    ParamByName('tabN').AsInteger := nTabN;
    Open;
    if not EoF then begin
      dDtPriem := FieldByName('dt_Priem').AsDateTime;
      dDtUvoln := FieldByName('dt_Uvoln').AsDateTime;
      Result := true;
    end;
  end;
  ReleaseQuery(qryTmp);
end;

//------------------------------------------------------------------------------
procedure TDmMain.GetPereInf(nTabN : integer; dProcDate : TDateTime;
                              var nKdObj, nKdKatP, nSO, nPdNlg,
                                  nKolMin, nKdSpz, nRang, nRazr : integer;
                              var nOklTrf, nAvans, nProcLG : double;
                              var cSpAv : string1;
                              var cDolgnost, cNrPrikaza : string;
                              var dDtPrikaza : TDateTime;
                              var bPens, bSovm, bPrfs : boolean;
                              var nInv : SmallInt);
begin
  nKdObj  := 0;
  nKdKatP := 0;
  nSO     := 1;
  nPdNlg  := 1;
  nKolMin := 0;
  nKdSpz  := 0;
  bPens   := false;
  bSovm   := false;
  bPrfs   := false;
  nInv    := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select p.*, wp.NrDoc, wp.DtBegDoc, wp.DtEndDoc from z_Pere p ' +
            ' Left outer Join z_GetWrkPereOnDate(p.TabN, p.Dt_Beg) wp on 1=1 ' +
            'where p.TabN = :nTabN order by p.Dt_Beg desc, p.NR desc');
    ParamByName('nTabN').AsInteger  := nTabN;
    Open;
    while not Eof do begin
      nKdObj     := FieldByName('KdObj').AsInteger;
      nKdKatP    := FieldByName('KdKatP').AsInteger;
      nSO        := FieldByName('SO').AsInteger;
      nPdNlg     := FieldByName('PdNlg').AsInteger;
      nKolMin    := FieldByName('KolMin').AsInteger;
      nKdSpz     := FieldByName('KdSpz').AsInteger;
      nRang      := FieldByName('Rang').AsInteger;
      nRazr      := FieldByName('Razr').AsInteger;
      if FieldByName('CmbOkl').AsString = '1' then
        nOklTrf  := GetCmbOkl(FieldByName('Spec_NR').AsInteger)
      else
        nOklTrf  := FieldByName('OklTrf').AsFloat;
      nAvans     := FieldByName('Avans').AsFloat;
      nProcLG    := FieldByName('ProcLG').AsFloat;
      cSpAv      := FieldByName('Sp_Av').AsString;
      cDolgnost  := FieldByName('Dolgnost').AsString;
      cNrPrikaza := FieldByName('Nr_Prikaza').AsString;
      dDtPrikaza := FieldByName('Dt_Prikaza').AsDateTime;
      bPens      := FieldValues['Pr_Pens'] = 1;
      bSovm      := FieldValues['Sovm'] = 1;
      bPrfs      := FieldValues['Prfs'] = 1;
      if (not FieldByName('NrDoc').IsNull) and
                     (Trim(FieldByName('NrDoc').AsString) > '') then
        // nInv     := FieldValues['Inv']
        nInv := FieldByName('Inv').AsInteger
      else
        nInv     := 0;
      if FieldByName('Dt_Beg').IsNull or
                (FieldByName('Dt_Beg').AsDateTime <= dProcDate) then
        Break;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetCmbOkl(nSpec_NR : integer) : double;
begin
  Result := 0;
  with qryTmp2 do begin    // qryTmp в это время занята,
    if Active then Close;  // посему пришлось добавить qryTmp2.
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_CmbOkl where Spec_NR = :nSpec_NR');
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    Open;
    while not Eof do begin
      Result := Result + FieldByName('OklTrf').AsFloat;
      Next;
    end;
    Result := RoundTo(Result, -2);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.VidN2KdSpZVida(cVidN : string4) : integer;
begin
  Result := 0;
  with qryVidN_LU do begin
    if Locate('VidN', cVidN, []) then begin
      Result := FieldByName('KdSpZ').AsInteger;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.VidN2ShVidN(cVidN : string4; var cNmVidN : string) : string;
begin
  Result := '';
  cNmVidN := '';
  with qryVidN_LU do begin
    if Locate('VidN', cVidN, []) then begin
      cNmVidN := FieldByName('NmVidN').AsString;
      Result := FieldByName('ShVidN').AsString;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetKdSpzVida(cVidN : string4) : integer;
begin
  Result := 0;
  with qryVidN_LU do begin
    if Locate('VidN', cVidN, []) then begin
      Result := FieldByName('KdSpZ').AsInteger;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.Get_VidInfo(cVidN : string4; var p_KEKV : string4;
                          var p_ShVidN : string10;
                          var p_zp13, p_Otp, p_Bln, p_Dkr, p_Otpuskn, p_Bolnic,
                              p_SPrm, p_CPrm, p_Deti, p_DetiM, p_DetiK,
                              p_DetiG, p_Sovm, p_Spov, p_Ind, p_Dhd, p_OklFnd,
                              p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens, p_SAlim,
                              p_SSocStrah, p_SBzr, p_CNdb,
                              p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                          var p_KdSpZ : integer);
begin
  p_KEKV      := '';
  p_ShVidN    := '';
  p_zp13      := '';
  p_Otp       := '';
  p_Bln       := '';
  p_Dkr       := '';
  p_Otpuskn   := '';
  p_Bolnic    := '';
  p_SPrm      := '';
  p_CPrm      := '';
  p_Deti      := '';
  p_DetiM     := '';
  p_DetiK     := '';
  p_DetiG     := '';
  p_Sovm      := '';
  p_Spov      := '';
  p_Ind       := '';
  p_Dhd       := '';
  p_OklFnd    := '';  {входит ли в сумму для расчета доплат к МинЗП}
  p_CBudg     := '';
  p_SNdb      := '';
  p_SPdn      := '';
  p_SPrf      := '';
  p_SPens     := '';
  p_SAlim     := '';
  p_SSocStrah := '';
  p_SBzr      := '';
  p_CNdb      := '';
  p_Sp_PF     := '';
  p_Sp_FSTVP  := '';
  p_Sp_FSNV   := '';
  p_Sp_FZ     := '';
  p_KdSpz     := 0;
  with qryVidN_LU do begin                  {p_OklFnd понимать, как входит ли}
    if not Active then begin                {в расчет суммы для доплат к минЗП}
      DataBaseName := CESMAIN;
      Open;
    end;
    if Locate('VidN', cVidN, []) then begin
      p_KEKV      := FieldByName('KEKV').AsString;
      p_ShVidN    := FieldByName('ShVidN').AsString;
      p_zp13      := FieldByName('ZP13').AsString;
      p_Otp       := FieldByName('OTP').AsString;
      p_Bln       := FieldByName('BLN').AsString;
      p_Dkr       := FieldByName('DKR').AsString;
      p_Otpuskn   := FieldByName('OTPUSKN').AsString;
      p_Bolnic    := FieldByName('BOLNIC').AsString;
      p_SPrm      := FieldByName('SPRM').AsString;
      p_CPrm      := FieldByName('CPRM').AsString;
      p_Deti      := FieldByName('DETI').AsString;
      p_DetiM     := FieldByName('DETIM').AsString;
      p_DetiK     := FieldByName('DETIK').AsString;
      p_DetiG     := FieldByName('DETIG').AsString;
      p_Sovm      := FieldByName('SOVM').AsString;
      p_Spov      := FieldByName('SPOV').AsString;
      p_Ind       := FieldByName('IND').AsString;
      p_Dhd       := FieldByName('DHD').AsString;
      p_OklFnd    := FieldByName('OKLFND').AsString;
      p_CBudg     := FieldByName('CBUDG').AsString;
      p_SNdb      := FieldByName('SNDB').AsString;
      p_SPdn      := FieldByName('SPDN').AsString;
      p_SPrf      := FieldByName('SPRF').AsString;
      p_SPens     := FieldByName('SPENS').AsString;
      p_SAlim     := FieldByName('SALIM').AsString;
      p_SSocStrah := FieldByName('SSOCSTRAH').AsString;
      p_SBzr      := FieldByName('SBZR').AsString;
      p_CNdb      := FieldByName('CNDB').AsString;
      p_Sp_PF     := FieldByName('SP_PF').AsString;
      p_Sp_FSTVP  := FieldByName('SP_FSTVP').AsString;
      p_Sp_FSNV   := FieldByName('SP_FSNV').AsString;
      p_Sp_FZ     := FieldByName('SP_FZ').AsString;
      p_KdSpz     := FieldByName('KdSpz').AsInteger;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.CntWrkChs(dAnyDate : TDateTime) : double;
var nDOW : byte;
begin
  with cdsEDays do begin
    if Locate('E_Day', dAnyDate, []) then
      Result := FieldByName('Rab_Chas').AsFloat
    else begin
      nDOW := DayOfWeek(dAnyDate);
      if (nDOW = 1) or (nDOW = 7) {1 - вс или 7 - сб} then
        Result := 0
      else
        Result := nAppCnrWrkChasInDay;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetCntBudgChas(dDtBeg, dDtEnd: TDateTime): double;
var dDtTmp : TDateTime;
begin
  Result := 0;
  dDtTmp := dDtBeg;
  while dDtTmp <= dDtEnd do begin
    Result := Result + CntWrkChs(dDtTmp);
    dDtTmp := dDtTmp + 1;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.MyDtEndOtp(dDtBeg : TDateTime; nCntDays : integer;
                                                 cRK : string) : TDateTime;
var dTmp : TDateTime; bMore : boolean;
    nDayOfWeek, n_Cnt : integer;
begin
  // по dDtBeg и nCntDays рассчитать и вернуть дату окончания отпуска
  // для случаев расчёта в рабочих (R) или календарных (K) днях
  dTmp := dDtBeg - 1;
  Result := dTmp;
  n_Cnt := 0;
  bMore := true;
  if cRK = 'R' then begin         // счет в рабочих днях
    while bMore do begin
      dTmp := dTmp + 1;
      if cdsEDays.Locate('E_Day', dTmp, []) then begin
        if cdsEDays.FieldByName('Rab_Chas').AsFloat > 0 then
          n_Cnt := n_Cnt + 1; end
      else begin
        nDayOfWeek := DayOfWeek(dTmp);
        if (nDayOfWeek > 1) then  // не воскресенье
          n_Cnt := n_Cnt + 1;
      end;
      bMore := (n_Cnt < nCntDays);  {пока не наберем заданное nCnt}
    end;
    Result := dTmp; end
  else if cRK = 'K' then begin    // счет в календарных днях
    while bMore do begin
      dTmp := dTmp + 1;           // если день праздничный - в зачет не идет
      if cdsEDays.Locate('E_Day', dTmp, []) then begin
        if (cdsEDays.FieldByName('Rab_Chas').AsFloat > 0) or
                              cdsEDays.FieldByName('XOtp').AsBoolean then
          n_Cnt := n_Cnt + 1; end
      else
        n_Cnt := n_Cnt + 1;
      bMore := (n_Cnt < nCntDays);
    end;
    Result := dTmp;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.CheckDayForBln(dAnyDate : TDateTime;
                            var nCntBlnDay : integer; var nCntWrkChas : double;
                                                           cCase : ShortString);
// cCase может быть:
// bln - для нормальных старых больничных в рабочих днях (до 04-07-2015)
// blk - для новых больничных (с 04-07-2015) в календарных днях
// dkr - для декретных в календарных днях
// К-во часов нужно для постановки в отклонения,
// поэтому его всегда надо брать из E_Days
// При cCase = 'bln':
// nCntBlnDay  - к-во дней в зачет больничных (нормальная суббота - выходной)
// nCntWrkChas - к-во часов для зарплаты (в нормальную субботу - 0)
var nRusDOW : byte;
begin
  nCntBlnDay  := 0;
  nCntWrkChas := 0;
  if cdsEDays.Locate('E_Day', dAnyDate, []) then begin
    nCntWrkChas := cdsEDays.FieldByName('Rab_Chas').AsFloat;
    if (cCase = 'blk') or (cCase = 'dkr') then
      // Дней всё равно 1, т.к. нужны кадендарные,
      // а часов - сколько есть, т.к. нужны для отклонений
      nCntBlnDay := 1
    else begin
      if nCntWrkChas = 0 then
        nCntBlnDay := 0
      else
        nCntBlnDay := 1;
    end; end
  else begin   {в зависимости от дня недели}
    nRusDOW := RusDayOfWeek(dAnyDate);
    if (nRusDOW = 7) {по нашему воскресенье} then begin
      if (cCase = 'bln') then begin
        nCntWrkChas := 0;
        nCntBlnDay  := 0; end
      else begin
        nCntWrkChas := 0;
        nCntBlnDay  := 1;
      end; end
    else if (nRusDOW = 6) {по нашему суббота} then begin
      if (cCase = 'bln') then begin
        nCntWrkChas := 0;
        nCntBlnDay  := 0; end    // 1
      else begin
        nCntWrkChas := 0;
        nCntBlnDay  := 1;
      end; end
    else begin         {рабочие дни}
      nCntWrkChas := nAppCnrWrkChasInDay;
      nCntBlnDay  := 1;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetCntWrkDaysBln(dDtB, dDtE : TDateTime;
                                   var nCntWorkDays, nCntWorkChas : double;
                                                           cCase : ShortString);
var dTmp : TDateTime; bMore : boolean;     // рассчитать к-во раб. дней и часов
    nRusDOW : word; nCntChas : double;
    // между d_DtB и d_DtE nCntWorkChas - это количество РАБОЧИХ часов между
    // dDtB и dDtE, которое надо подставить в отклонения и которое для всех
    // случаев одинаковое - строго по календарю и E_Days
    // nCase может быть:
    //  bln - для больничных по старой схеме (до 04-07-2015)
    //  blk - календарные дни (начиная с 04-07-2015)
    //  dkr - для декретных в календарных днях
begin
   if not cdsEDays.Active then
    CreOpenCdsEDays;
  nCntWorkDays := 0;
  nCntWorkChas := 0;
  bMore := true;
  dTmp := dDtB;
  while bMore do begin
    if cdsEDays.Locate('E_Day', dTmp, []) then begin
      nCntChas := cdsEDays.FieldByName('Rab_Chas').AsFloat;
      if (cCase = 'blk') or (cCase = 'dkr') then begin
        // Дни всё равно приращиваю на  1, т.к. нужны кадендарные,
        // а часов - сколько есть в nCntChas, т.к. нужны в отклонения
        nCntWorkDays := nCntWorkDays + 1;
        nCntWorkChas := nCntWorkChas + nCntChas;  end
      else begin
        if (nCntChas = 0) then
          // дни не наращиваю, т.к. часов 0, ну и часы тоже, т.к. они нулевые
        else begin
          nCntWorkDays := nCntWorkDays + 1;
          nCntWorkChas := nCntWorkChas + nCntChas;
        end;
      end; end
    else begin   {в зависимости от дня недели}
      nRusDOW := RusDayOfWeek(dTmp);   {1 - пн ... 6 - сб, 7 - вс}
      if (nRusDOW = 7) {воскресенье} then begin
        if (cCase = 'bln') then
          // для просто больничных ни дни, ни часы не приращиваются
        else // для календарных случаев приращивается только дни
          nCntWorkDays := nCntWorkDays + 1; end
      else if (nRusDOW = 6) {суббота} then begin
        if (cCase = 'bln') then
          // часы и дни не приращиваются
          // nCntWorkDays := nCntWorkDays + 0
        else // часы не приращиваются, дни приращиваются на 1
          nCntWorkDays := nCntWorkDays + 1; end
      else {рабочие дни} begin
        // для всех случаев приращиваются и дни и часы
        nCntWorkDays := nCntWorkDays + 1;
        nCntWorkChas := nCntWorkChas + nAppCnrWrkChasInDay;
      end;
    end;
    dTmp := dTmp + 1;
    if dTmp > dDtE then
      bMore := false;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.CheckDayForOtp(
  dAnyDate : TDateTime;
  var nCntOtpDay : integer; 
  var nCntWrkChas : double; 
  cCase : ShortString
);
// nCntOtpDay  - к-во дней в зачет отпуска (суббота - засчитывается)
// nCntWrkChas - к-во часов для зарплаты (в нормальную субботу - 0)
var nDOW : byte;
begin
  nCntOtpDay  := 0;
  nCntWrkChas := 0;
  if cCase = 'otk' then begin
    if cdsEDays.Locate('E_Day', dAnyDate, []) then begin
      nCntWrkChas := cdsEDays.FieldByName('Rab_Chas').AsFloat;
      if (nCntWrkChas = 0) and
                       (not cdsEDays.FieldByName('XOtp').AsBoolean) then
        nCntOtpDay := 0
      else
        nCntOtpDay := 1; end
    else begin
      nDOW := DayOfWeek(dAnyDate);
      nCntOtpDay := 1;
      if (nDOW = 1) {воскресенье} or (nDOW = 7) {суббота} then
        nCntWrkChas := 0
      else
        nCntWrkChas := nAppCnrWrkChasInDay;
    end; end
  else begin
    if cdsEDays.Locate('E_Day', dAnyDate, []) then begin
      nCntWrkChas := cdsEDays.FieldByName('Rab_Chas').AsFloat;
      if nCntWrkChas = 0 then
        nCntOtpDay := 0
      else
        nCntOtpDay := 1; end
    else begin
      nDOW := DayOfWeek(dAnyDate);
      if (nDOW = 1) {воскресенье} then begin
        nCntWrkChas := 0;
        nCntOtpDay  := 0; end
      else if (nDOW = 7) {суббота} then begin
        nCntWrkChas := 0;
        nCntOtpDay  := 1; end
      else begin
        nCntWrkChas := nAppCnrWrkChasInDay;
        nCntOtpDay  := 1;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.GetCntWrkDaysOtp(dDtB, dDtE: TDateTime;
                                       var nCntWorkDays, nCntWorkChas: double;
                                                            cCase: ShortString);
var dTmp : TDateTime; bMore : boolean;     // рассчитать к-во раб. дней и часов
    nDayOfWeek : integer;
    // между d_DtB и d_DtE  при cCase = 'bln' или 'otp' или 'otk' (календарн.)
    // nCntWorkChas - это количество РАБОЧИХ часов между dDtB и dDtE,
    // которое надо подставить в отклонения и которое для всех случаев
    // одинаковое - строго по календарю и E_Days
    // nCase может быть:
    //  bln - для больничных по старой схеме (до 04-07-2015)
    //  blk - календарные дни (начиная с 04-07-2015)
    //  otp - для отпускных в рабочих днях
    //  otk - для отпускных в календарных днях
    //  dkr - для декретных в календарных днях
// ПОКА ПЕРЕДРАЛ СЮДА ВСЁ ИЗ БЛН !!!!!!!!!!!!!!!
begin
  if not cdsEDays.Active then
    CreOpenCdsEDays;
  nCntWorkDays := 0;
  nCntWorkChas := 0;
  bMore := true;
  dTmp := dDtB;
  while bMore do begin         // при таких cCase в E_Days не заглядываю -
    if (cCase <> 'blk') and (cCase <> 'dkr') // разбока только по nDayOfWeek
                      and cdsEDays.Locate('E_Day', dTmp, []) then begin
      if (cdsEDays.FieldByName('Rab_Chas').AsFloat > 0) or ((cCase = 'otk') and
          cdsEDays.FieldByName('XOtp').AsBoolean) or (cCase = 'dkr') then begin
        nCntWorkDays := nCntWorkDays + 1;
        nCntWorkChas := nCntWorkChas +  // с часами плохо - там при otk м.б. 0
                             cdsEDays.FieldByName('Rab_Chas').AsFloat;
      end; end
    else begin
      nDayOfWeek := DayOfWeek(dTmp);   // по аглицки 1 - воскр. ... 7 - суббота
      if  ((nDayOfWeek > 1) and (nDayOfWeek < 7)) {рабочие дни} then begin
        if (cCase = 'otk') or (cCase = 'blk') or
                           (cCase = 'dkr') {нужны календарные дни} then begin
          nCntWorkChas := nCntWorkChas + nAppCnrWrkChasInDay;
          nCntWorkDays := nCntWorkDays + 1;
        end; end
      else if (nDayOfWeek = 7) {суббота} and
                   ((cCase <> 'otp') or (cCase <> 'otk') or
                           (cCase <> 'blk') or (cCase <> 'dkr')) then
        nCntWorkDays := nCntWorkDays + 1
      else if (nDayOfWeek = 1) {воскресенье} and
                   ((cCase <> 'otk') or
                           (cCase <> 'blk') or (cCase <> 'dkr')) then
        nCntWorkDays := nCntWorkDays + 1;
      //end;
    end;
    dTmp := dTmp + 1;
    if dTmp > dDtE then
      bMore := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryKoefOtpAfterPost(DataSet: TDataSet);
var dSvMesGod : TDateTime; nSvNR : integer;
begin
  dSvMesGod := 0;
  nSvNR := 0;
  with qryKoefOtp do begin
    if State = dsInsert then
      dSvMesGod := FieldByName('MesGod').AsDateTime
    else
      nSvNR := FieldByName('NR').AsInteger;
    Form_Dm.DbMain.ApplyUpdates([qryKoefOtp]);
    Close;
    Open;
    if dSvMesGod <> 0 then
      Locate('MesGod', dSvMesGod, [])
    else
      Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryKoefOtpAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryKoefOtp]);
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryBankiAfterPost(DataSet: TDataSet);
begin
  with qryBanki do begin
    Form_Dm.DbMain.ApplyUpdates([qryBanki]);
    Close;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryBankiAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryBanki]);
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryBankiBeforePost(DataSet: TDataSet);
begin
  with qryBanki do begin
    if State = dsInsert then
      FieldByName('KdBnk').AsInteger := myNewKdBnk;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.myNewKdBnk : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdBnk) as MaxKd from Z_Banki');
    Open;
    if (RecordCount > 0) and (FieldByName('MaxKd').AsInteger > 0) then
      Result := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryKatVNAfterPost(DataSet: TDataSet);
var nSvKdKatVN : integer;
begin
  with qryKatVN do begin
    nSvKdKatVN := FieldByName('KdKatVN').AsInteger;
    Database.ApplyUpdates([qryKatVN]);
    Close;
    Open;
    if nSvKdKatVN > 0 then
      Locate('KdKatVN', nSvKdKatVN, []);
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.NewKatVN : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdKatVN) as MaxKd from Z_KatVN');
    Open;
    if (RecordCount > 0) and (FieldByName('MaxKd').AsInteger > 0) then
      Result := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryKatVNBeforePost(DataSet: TDataSet);
begin
  if qryKatVN.State = dsInsert then
    qryKatVN.FieldByName('KdKatVN').AsInteger := NewKatVN;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryKatVNAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryKatVN]);
end;
//------------------------------------------------------------------------------
procedure TDmMain.QryNuCmnCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('Summa').AsFloat >= 0 then
    DataSet.FieldByName('SmN').AsFloat := DataSet.FieldByName('Summa').AsFloat
  else
    DataSet.FieldByName('SmU').AsFloat := -DataSet.FieldByName('Summa').AsFloat;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryOtklCalcFields(DataSet: TDataSet);
begin
  //qryOtklSpz.AsString := KdSbu2SchBU(qryOtklKdSpZ.AsInteger);
  qryOtklFamIO.AsString := FormZpMain.qrySps.FieldByName('FamIO').AsString;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryMesSpsCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qryMesSpsDtProc.AsDateTime, nY, nM, nD);
  qryMesSpsRusMes.AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryDolgnBeforePost(DataSet: TDataSet);
begin
  if (qryDolgn.State = dsInsert) and (qryDolgnKdDolgn.IsNull) then
    qryDolgn.FieldByName('KdDolgn').AsInteger := NewKdDolgn;
end;
//------------------------------------------------------------------------------
function TDmMain.NewKdDolgn : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdDolgn) as MaxKd from Z_KdDolgn');
    Open;
    if (RecordCount > 0) and (FieldByName('MaxKd').AsInteger > 0) then
      Result := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryDolgnAfterPost(DataSet: TDataSet);
var nSvKdDolgn : integer;
begin
  with qryDolgn do begin
    nSvKdDolgn := FieldByName('KdDolgn').AsInteger;
    Form_Dm.DbMain.ApplyUpdates([qryDolgn]);
    Close;
    Open;
    if nSvKdDolgn <> 0 then
      Locate('KdDolgn', nSvKdDolgn, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryDolgnAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryDolgn]);
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTPdnAfterPost(DataSet: TDataSet);
var nSvNR : integer; bEof : boolean;
begin
  nSvNR := 0;
  bEof := true;
  with qryTPdn do begin
    if not FieldByName('NR').IsNull then begin
      nSvNR := FieldByName('NR').AsInteger;
      bEof := false;
    end;
    ApplyUpdates;
    Close;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, [])
    else if bEof then
      Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTPdnNewRecord(DataSet: TDataSet);
begin
  qryTPdnDtBeg.AsDateTime := Date;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryDPereNewRecord(DataSet: TDataSet);
begin
  Inc(nFalsNrForDPere, -1);
  qryDPereNr.AsInteger := nFalsNrForDPere;
  // Чтобы до ApplyUpdates присваивались какие-либо значения. При ApplyUpdates
  // запишутся правильные значения в соответствии с триггером ZCMBOKL_NR
end;
//------------------------------------------------------------------------------
procedure TDmMain.QryPereCalcFields(DataSet: TDataSet);
var nOldKdOK, nNewKDOk: SmallInt;
    cOldDolgnOK, cOldCode, cOldD_zkpp, cOldNameD, cOldNameFull,
    cNewDolgnOK, cNewCode, cNewD_zkpp, cNewNameD, cNewNameFull : ShortString;
begin
  with qryPere do begin
    if (qryPereCmbOkl.AsString = '1') and (qryPereSpec_NR.AsInteger > 0) then
      qryPereSmCmbOkl.AsFloat := mySmCmbOkl(qryPereSpec_NR.AsInteger)
    else
      qryPereSmCmbOkl.AsFloat := qryPereOklTrf.AsFloat;
    qryPereSpZ.AsString := KdSbu2SchBU(qryPereKdSpZ.AsInteger);
    qryPereShSps.AsString := Form_Dm.KdSps2ShSps(qryPereKdSps.AsInteger);
    if not qryPereKdTemu.IsNull and (qryPereKdTemu.AsInteger > 0) then
      qryPereNmTemu.AsString := KdTemu2NmTemu(qryPereKdTemu.AsInteger);


    nOldKdOK   := (DataSet as TDataSet).FieldByName('OldKdOk').AsInteger;
    nNewKdOK   := (DataSet as TDataSet).FieldByName('NewKdOk').AsInteger;
    if (nOldKdOk > 0) and GetOkRkvzt(nOldKdOK,
         cOldDolgnOK, cOldCode, cOldD_zkpp, cOldNameD, cOldNameFull) then begin
      qryPereOldDolgnOK.AsString  := cOldDolgnOK;
      qryPereOldCode.AsString     := cOldCode;
      qryPereOldD_zkpp.AsString   := cOldD_zkpp;
      qryPereOldNameD.AsString    := cOldNameD;
      qryPereOldNameFull.AsString := cOldNameFull;
    end;
    if (nNewKdOk > 0) and GetOkRkvzt(nNewKdOK,
         cNewDolgnOK, cNewCode, cNewD_zkpp, cNewNameD, cNewNameFull) then begin
      qryPereNewDolgnOK.AsString  := cNewDolgnOK;
      qryPereNewCode.AsString     := cNewCode;
      qryPereNewD_zkpp.AsString   := cNewD_zkpp;
      qryPereNewNameD.AsString    := cNewNameD;
      qryPereNewNameFull.AsString := cNewNameFull;
    end;
  end;
end;


//------------------------------------------------------------------------------
function TDmMain.GetOkRkvzt(nKdOK: SmallInt; var cDolgnOK, cCode, cD_zkpp,
             cNameD, cNameFull: ShortString) : boolean;
begin
  Result := false;
  if nKDOK <> 0 then with qryCalcF do begin
    Close;
//    Form_Dm.DbOK.Connected := false;
    Sql.Clear;
    databasename := CESMAIN;
    SQL.Add('Select * from o_Dolgnost  where kdOk = :nkdOk');
    ParamByName('nKdOk').AsInteger := nKdOK;
//    Form_Dm.DbOK.Connected := true;
    Open;
    if RecordCount > 0 then begin
      cDolgnOK  := FieldByName('nameok').AsString;
      cCode     := FieldByName('Code').AsString;
      cD_zkpp   := FieldByName('C_ZKpp').AsString;
      cNameD    := FieldByName('NameD').AsString;
      cNameFull := FieldByName('NameFull').AsString;
      Result    := true;
    end;
    Active := false;
    Sql.Clear;
    databasename := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryDPereCalcFields(DataSet: TDataSet);
var cNmObj : string;
begin
  qryDPereSpz.AsString := KdSbu2SchBU(qryDPereKdSpZ.AsInteger);
  qryDPereShObj.AsString := DmMain.KdObj2ShObj(qryDPereKdObj.AsInteger, cNmObj);
  qryDPereShSps.AsString := Form_Dm.KdSps2ShSps(qryDPereKdSps.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryNadbCalcFields(DataSet: TDataSet);
var
  nKdDlzhn, nKdSovm: integer;
  cNewDolgnOK, cNewCode, cNewD_zkpp, cNewNameD, cNewNameFull: ShortString;
  cShSovm: string;
begin
  nKdDlzhn := DataSet.FieldByName('KD_DLZHN').AsInteger;
  nKdSovm := DataSet.FieldByName('KD_SOVM').AsInteger;

  with qryNadb do begin
    if (nKdDlzhn > 0) and GetOkRkvzt(nKdDlzhn,
         cNewDolgnOK, cNewCode, cNewD_zkpp, cNewNameD, cNewNameFull) then begin
      qryNadbDLZHN.AsString  := cNewDolgnOK;
      qryNadbKD_PROF.AsString := cNewCode;
    end;

    cShSovm := '';
    if (nKdSovm > 0) then begin
      cShSovm := DmMain.KdSovm2ShSovm(nKdSovm);
      qryNadbSHSOVM.AsString := cShSovm;
    end
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.KdTemu2NmTemu(nKdTemu: SmallInt): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Kd_Temu where KdTemu = :nKdTemu');
    ParamByName('nKdTemu').AsInteger := nKdTemu;
    Open;
    if RecordCount > 0 then
      Result := FieldByName ('NmSch').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.mySmCmbOkl(nSpec_NR : integer) : double;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Sum(OklTrf) as SMM from Z_CmbOkl ' +
                                   ' where Spec_NR = :nSpec_NR');
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    Open;
    Result := FieldByName('SMM').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryOtklBeforePost(DataSet: TDataSet);
begin
  qryOtklSpecPS.AsInteger := -1; // Чтобы в случае редактирования записи откло-
                                 // нений - она перешла в разряд необработанных
//  if qryOtklDt_Beg.AsDateTime = 0 then
//    qryOtklDt_Beg.AsString := '';
//  if qryOtklDt_End.AsDateTime = 0 then
//    qryOtklDt_End.AsString := '';
//  if (qryOtklDt_Beg.AsString = '') or (qryOtklDt_End.AsString = '') then
//    qryOtklChas.AsString := '';

  //if (qryOtklPrPv.AsInteger = 7) then begin
  //  qryOtklDt_Beg.AsString := '';  //хотел, чтобы в этих записях не было
  //  qryOtklDt_End.AsString := '';  //Dt_Beg, Dt_End, Chas, но иногда нужны
  //  qryOtklChas.AsString := '';
  //end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryUdrgCalcFields(DataSet: TDataSet);
begin
  if not qryUdrgKdSlg.IsNull then
    qryUdrgNmSlg.AsString := KdSlg2NmSlg(qryUdrgKdSlg.AsInteger);
  if not qryPst.Active then qryPst.Open;
  if (not qryUdrgKdPst.IsNull) and
               (qryPst.Locate('KdPst', qryUdrgKdPst.AsInteger, [])) then begin
    qryUdrgShPst.AsString := qryPstShPst.AsString;
    qryUdrgNmPst.AsString := qryPstNmPst.AsString;
  end;
  if (qryUdrgSpsRsch.AsInteger = 1) or (qryUdrgSpsRsch.AsInteger = 3) then
    qryUdrgS_P.AsString := '%'
  else
    qryUdrgS_P.AsString := 'р';
  qryUdrgSpz.AsString := KdSbu2SchBU(qryUdrgKdSpZ.AsInteger);
end;

//------------------------------------------------------------------------------
procedure TDmMain.PmntsSpecNrGetText(Sender: TField; var Text: String;
                                                          DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsInteger = 0)) then
    Text := ''
  else
    Text := (Sender as TField).AsString;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmMain.PmntsHoursGetText(Sender: TField; var Text: String;
                                                          DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsFloat = 0)) then
    Text := ''
  else
    Text := FloatToStrF((Sender as TField).AsFloat, ffFixed, 10,2);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmMain.PmntsSumGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsFloat = 0)) then
    Text := ''
  else
    Text := FloatToStrF((Sender as TField).AsFloat, ffFixed, 18,2);
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TDmMain.PmntsDtEndGetText(Sender: TField; var Text: String;
                                                         DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsDateTime = 0)) then
    Text := ''
  else
    Text := FormatDateTime('dd/mm/yy', (Sender as TField).AsDateTime);
end;
//------------------------------------------------------------------------------
procedure TDmMain.CdsPmntsKdTemuGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if DisplayText and (Sender.AsInteger <> 0) then
    Text := IntToStr(Sender.AsInteger)
  else
    Text := '';
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryPstBeforePost(DataSet: TDataSet);
begin
  if qryPstKdPst.IsNull or (qryPstKdPst.AsInteger = 0) then
    qryPstKdPst.AsInteger := NewKdPst;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryPstAfterPost(DataSet: TDataSet);
var nSvKdPst : integer;
begin
  with qryPst do begin
    nSvKdPst := qryPstKdPst.AsInteger;
    ApplyUpdates;
    Close;
    Open;
    if nSvKdPst <> 0 then
      Locate('KdPst', nSvKdPst, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryPsbAfterPost(DataSet: TDataSet);
var dSvDtBeg : TDateTime;
begin
  with qryPsb do begin
    dSvDtBeg := qryPsbDtBeg.AsDateTime;
    ApplyUpdates;
    Close;
    Open;
    if dSvDtBeg <> 0 then
      Locate('DtBeg', dSvDtBeg, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryPstShkAfterPost(DataSet: TDataSet);
var nSvSmFrom : double;
begin
  with qryPstShk do begin
    nSvSmFrom := qryPstShkSmFrom.AsFloat;
    ApplyUpdates;
    Close;
    Open;
    if nSvSmFrom <> -1 then
      Locate('SmFrom', nSvSmFrom, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTPrpBeforeInsert(DataSet: TDataSet);
begin
  cPrcPfCmn  := qryTPrpPrcPfCmn.AsString;
  cPrcPfInv  := qryTPrpPrcPfInv.AsString;
  cPrcSs1Bln := qryTPrpPrcSs1Bln.AsString;
  cPrcSs2NSl := qryTPrpPrcSs2NSl.AsString;
  cPrcFz     := qryTPrpPrcFz.AsString;
  cPrcFz1006 := qryTPrpPrcFz1006.AsString;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTPrpNewRecord(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(Date, nY, nM, nD);
  qryTPrpDtBeg.AsDateTime := EncodeDate(nY, nM, 1);
  qryTPrpPrcPfCmn.AsString  := cPrcPfCmn;
  qryTPrpPrcPfInv.AsString  := cPrcPfInv;
  qryTPrpPrcSs1Bln.AsString := cPrcSs1Bln;
  qryTPrpPrcSs2NSl.AsString := cPrcSs2NSl;
  qryTPrpPrcFz.AsString     := cPrcFz;
  qryTPrpPrcFz1006.AsString := cPrcFz1006;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTPrpAfterPost(DataSet: TDataSet);
var nSvNR : integer; bEof : boolean;
begin
  nSvNR := 0;
  bEof := true;
  with qryTPrp do begin
    if not FieldByName('NR').IsNull then begin
      nSvNR := FieldByName('NR').AsInteger;
      bEof := false;
    end;
    ApplyUpdates;
    Close;
    Open;
    if nSvNR <> 0 then
      Locate('NR', nSvNR, [])
    else if bEof then
      Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetSmMin10(dRMes: TDateTime ; var nSmMin10 : double);
begin
  nSmMin10 := 0;
//  with ;
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetPrpInfo(dDtMes : TDateTime; var nPrcPfCmn, nPrcPfInv,
                             nPrcSsBln, nPrcSsNsl, nPrcFz, nPrcFz1006 : double);
begin
  // Такая же есть в Z_RsNew и на сервере.  При доработках сверять тексты!!!
  nPrcPfCmn  := 0;
  nPrcPfInv  := 0;
  nPrcSsBln  := 0;
  nPrcSsNsl  := 0;
  nPrcFz     := 0;
  nPrcFz1006 := 0;
  with qryTPrp do begin
    if not Active then Open;
    Last;                      // Сортировка в прямом порядке
    while not Bof do begin
      if FieldByName('DtBeg').AsDateTime <= dDtMes then begin
        nPrcPfCmn  := FieldByName('PrcPfCmn').AsFloat;
        nPrcPfInv  := FieldByName('PrcPfInv').AsFloat;
        nPrcSsBln  := FieldByName('PrcSs1Bln').AsFloat;
        nPrcSsNsl  := FieldByName('PrcSs2Nsl').AsFloat;
        nPrcFz     := FieldByName('PrcFz').AsFloat;
        nPrcFz1006 := FieldByName('PrcFz1006').AsFloat;
        Break;
      end;
      Prior;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTSsBeforeInsert(DataSet: TDataSet);
begin
  if qryTSs.Active and (qryTSs.RecordCount > 0) then begin
    cPrcDoMinSs := qryTSsPrcDoMin.AsString;
    cPrcDoMaxSs := qryTSsPrcDoMax.AsString; end
  else begin
    cPrcDoMinSs := '';
    cPrcDoMaxSs := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTSsBeforePost(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qryTSsDtBeg.AsDateTime, nY, nM, nD);
  if nD <> 1 then
    qryTSsDtBeg.AsDateTime := EncodeDate(nY, nM, 1);
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTSsNewRecord(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(Date, nY, nM, nD);
  qryTSsDtBeg.AsDateTime := EncodeDate(nY, nM, 1);
  qryTSsPrcDoMin.AsString  := cPrcDoMinSs;
  qryTSsPrcDoMax.AsString  := cPrcDoMaxSs;
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetPdnInfo(dAnyDate : TDateTime;
                        var nPrcPdn, nPrcPdn2,
                            nMinZpNG, nMinZpCM, nProgMinNG, nProgMinCM,
                                nPorogLg, nProcLg, nSm2660,
                                    nSmLg100, nSmLg150, nSmLg200 : double);
var nCntRec, i : integer;
begin
  // Такая же есть в Z_RS и на сервере.  При доработках сверять тексты!!!
  nPrcPdn    := 0;
  nPrcPdn2   := 0;
  nMinZpNG   := 0;
  nMinZpCM   := 0;
  nProgMinNG := 0;
  nProgMinCM := 0;
  nPorogLg   := 0;
  nProcLg    := 0;
  nSm2660    := 0;
  nSmLg100   := 0;
  nSmLg150   := 0;
  nSmLg200   := 0;
  i := 0;
  with qryTPdn do begin      // сортирована по DtBeg, NR в прямом порядке
    if not Active then Open; // порядок сортировки не менять, т.к. это же
    nCntRec := RecordCount;  // qryTPdn используется в спр-ке "Таблицы
    Last;                    // разных удержаний"
    while not Bof do begin
      Inc(i);
      if (FieldByName('DtBeg').AsdateTime <= dAnyDate) or {если не оказалось
           нужной записи - беру данные из верхней, т.е. самой близкой к
                          dAnyDate, записи}   (i = nCntRec) then begin
        nPrcPdn    := FieldByName('PrcPdn').AsFloat;
        nPrcPdn2   := FieldByName('PrcPdn2').AsFloat;
        nMinZpNG   := FieldByName('MinZp').AsFloat;     // на начало года
        nMinZpCM   := FieldByName('MinZp').AsFloat;     // для текущего месяца
        nProgMinNG := FieldByName('ProgMin').AsFloat;   // на начало года
        nProgMinCM := FieldByName('ProgMin2').AsFloat;  // для текущего месяца
        nPorogLg   := FieldByName('PorogLg').AsFloat;
        nProcLg    := FieldByName('ProcLg').AsFloat;
        nSm2660    := FieldByName('Sm2660').AsFloat;
        nSmLg100   := FieldByName('SmLg100').AsFloat;
        nSmLg150   := FieldByName('SmLg150').AsFloat;
        nSmLg200   := FieldByName('SmLg200').AsFloat;
        Break;
      end;
      Prior;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTPrpBeforePost(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qryTPrpDtBeg.AsDateTime, nY, nM, nD);
  if nD <> 1 then
    qryTPrpDtBeg.AsDateTime := EncodeDate(nY, nM, 1);
end;
//------------------------------------------------------------------------------
function TDmMain.NewUpiTabN: integer;
var nNewTabN : integer;
begin                     // Получить ТабНр из 1-й записи таблицы z_FreeTabs и
  nNewTabN := 0;                   // тут же удалить его из таблицы z_FreeTabs
  with qryNewTabN do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_FreeTabs');
    Open;
    while not Eof do begin
      nNewTabN := FieldByName('TabN').AsInteger;
      if FieldByName('IsFree').IsNull or
               (FieldByName('IsFree').AsString <> 'N') then
        Break;
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Delete from z_FreeTabs where TabN <= :nNewTabN');
    ParamByName('nNewTabN').AsInteger := nNewTabN;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  Result := nNewTabN;
end;
//------------------------------------------------------------------------------
procedure TDmMain.FldKdObjValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean; cShObj : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    if (cText = '1000') or (cText = '2000') or
             (cText = '3000') or (cText = '4000') then
      Raise Exception.Create('Не допускается выбор подразделения ' + cText)
    else begin
      bIsInDic := IsKdObjInDic(StrToInt(cText), cShObj);
      if not bIsInDic then
        Raise Exception.Create('Нет в справочнике подразделения ' + cText);
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.IsKdObjInDic(nKdObj : SmallInt;
                                            var cShObj : ShortString) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdObj where KdObj = :nKdObj');
    ParamByName('nKdObj').AsInteger := nKdObj;
    Open;
    Result := (RecordCount > 0) and not FieldByName('KdObj').IsNull;
    cShObj := FieldByName('ShObj').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.FldVidNValidate(Sender: TField);
// var cText : ShortString;  bIsInDic : boolean;
begin
{
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := IsVidNInDic(cText);
    if not bIsInDic then
      Raise Exception.Create('Нет в спр-ке видов начислений вида ' + cText);
  end;
}
end;

//------------------------------------------------------------------------------
procedure TDmMain.FldKdKatPValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean; cShKatP : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := IsKdKatPInDic(StrToInt(cText), cShKatP);
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике категории персонала ' + cText)
    else
      ;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.IsKdKatPInDic(nKdKatP : SmallInt;
                                           var cShKatP : ShortString) : boolean;
begin
  cShKatP := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from z_KatPers where KdKatP = :nKdKatP');
    ParamByName('nKdKatP').AsInteger := nKdKatP;
    Open;
    Result := (RecordCount > 0) and not FieldByName('KdKatP').IsNull;
    cShKatP := FieldByName('ShKatP').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.FldSoValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := IsOplInDic(StrToInt(cText));
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике системы оплаты ' + cText);
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.IsOplInDic(nKdOpl : SmallInt) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_SysOpl where KdOpl = :nKdOpl');
    ParamByName('nKdOpl').AsInteger := nKdOpl;
    Open;
    Result := (RecordCount > 0) and not FieldByName('KdOpl').IsNull;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.FldPdNlgValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := IsPdNlgInDic(StrToInt(cText));
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике схемы подоходного ' + cText);
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.IsPdNlgInDic(nKdSh : SmallInt) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_ShPdn where KdSh = :nKdSh');
    ParamByName('nKdSh').AsInteger := nKdSh;
    Open;
    Result := (RecordCount > 0) and not FieldByName('KdSh').IsNull;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.FldSovmValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := IsSovmInDic(StrToInt(cText));
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике вида совместительства ' + cText);
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.IsSovmInDic(nKdSovm : SmallInt) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdSovm where KdSovm = :nKdSovm');
    ParamByName('nKdSovm').AsInteger := nKdSovm;
    Open;
    Result := (RecordCount > 0) and not FieldByName('KdSovm').IsNull;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.IsVidNInDic(cVidN : ShortString) : boolean;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdVidN where VidN = :cVidN');
    ParamByName('cVidN').AsString := cVidN;
    Open;
    Result := (RecordCount > 0) and not FieldByName('VidN').IsNull;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetUpiLsInf(nTabN : integer; var dDtBeg : TDateTime;
                                            var cShBnk, cLicSch : ShortString);
begin
  cShBnk  := '';
  cLicSch := '';
  with qryUpiLS do begin
    if not Active then begin
      SQL.Clear;
      DataBaseName := qryUpi.DataBaseName;
      SQL.Add('Select * from z_Get_BnkLS(:nTabN, :dOnDate)')
      //SQL.Add('Select b.ShBnk, Ls.* from z_BankiLS Ls ' +
      //        ' Left outer join z_Banki b on b.KdBnk = Ls.KdBnk ' +
      //        ' where ls.tabn = :nTabN');
    end;
    Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dOnDate').AsDateTime := Date;
    Open;
    cShBnk  := FieldByName('ShBnk').AsString;
    cLicSch := FieldByName('LicSch').AsString;
    dDtBeg  := FieldByName('DtBeg').AsDateTime;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.tblUpiBeforeOpen(DataSet: TDataSet);
begin
//  tblUpi.DatabaseName := CESMAIN;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTPdnMINZPValidate(Sender: TField);
var nProcLg, nMinZp : double;
begin
  with qryTPdn do begin
    if qryTPdnProcLG.IsNull or (qryTPdnProcLG.AsFloat = 0) or
            qryTPdnMinZp.IsNull or (qryTPdnMinZp.AsFloat = 0) then begin
      qryTPdnSmLg100.AsString := '';
      qryTPdnSmLg150.AsString := '';
      qryTPdnSmLg200.AsString := ''; end
    else begin
      nProcLG := qryTPdnProcLG.AsFloat;
      nMinZp := qryTPdnMinZp.AsFloat;
      qryTPdnSmLg100.AsFloat := RoundTo(nMinZp * nProcLG / 100, -2);
      qryTPdnSmLg150.AsFloat := RoundTo(qryTPdnSmLg100.AsFloat * 1.5, -2);
      qryTPdnSmLg200.AsFloat := RoundTo(qryTPdnSmLg100.AsFloat * 2, -2);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTPdnPROCLGValidate(Sender: TField);
var nProcLg, nMinZp : double;
begin
  with qryTPdn do begin
    if qryTPdnProcLG.IsNull or (qryTPdnProcLG.AsFloat = 0) or
            qryTPdnMinZp.IsNull or (qryTPdnMinZp.AsFloat = 0) then begin
      qryTPdnSmLg100.AsString := '';
      qryTPdnSmLg150.AsString := '';
      qryTPdnSmLg200.AsString := ''; end
    else begin
      nProcLG := qryTPdnProcLG.AsFloat;
      nMinZp := qryTPdnMinZp.AsFloat;
      qryTPdnSmLg100.AsFloat := RoundTo(nMinZp * nProcLG / 100, -2);
      qryTPdnSmLg150.AsFloat := RoundTo(qryTPdnSmLg100.AsFloat * 1.5, -2);
      qryTPdnSmLg200.AsFloat := RoundTo(qryTPdnSmLg100.AsFloat * 2, -2);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryUpiCalcFields(DataSet: TDataSet);
var cShBnk, cLicSch : ShortString; dDtBeg : TDateTime;
begin
  qryUpiFamIO.AsString := MyFamIO(qryUpiFam.AsString, qryUpiIma.AsString,
                                                         qryUpiOtch.AsString);
  GetUpiLsInf(qryUpiTabN.AsInteger, dDtBeg, cShBnk, cLicSch);
  qryUpiShBnk.AsString  := cShBnk;
  qryUpiLicSch.AsString := cLicSch;
  if dDtBeg > 0 then
    qryUpiDtBegLS.AsDateTime := dDtBeg;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryUpiAfterPost(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryUpi]); // ПРОБА !!! Не делаю Close-Open, т.к.:
  // если это после Edit, то в местном DataSet'е уже все исправилось
  // если после Append или Insert - то NR и TabN я уже присвоил перед Post'ом
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryUpiBeforePost(DataSet: TDataSet);
begin
  if qryUpi.State = dsInsert then
    qryUpiNR.AsInteger := GetNewUpiNR;
end;
//------------------------------------------------------------------------------
function TDmMain.GetNewUpiNR : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from GetNewUpi_NR');
    Open;
    Result := FieldByName('NewUpi_NR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTFzBeforeInsert(DataSet: TDataSet);
begin
  if qryTFz.Active and (qryTFz.RecordCount > 0) then
    cPrcDoMaxFz := qryTFzPrcDoMax.AsString
  else
    cPrcDoMaxFz := '';
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTFzNewRecord(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(Date, nY, nM, nD);
  qryTFzDtBeg.AsDateTime := EncodeDate(nY, nM, 1);
  qryTFzPrcDoMax.AsString  := cPrcDoMaxFz;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryTFzBeforePost(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qryTFzDtBeg.AsDateTime, nY, nM, nD);
  if nD <> 1 then
    qryTFzDtBeg.AsDateTime := EncodeDate(nY, nM, 1);
end;
//------------------------------------------------------------------------------
function TDmMain.GetPrcFz(dZaMG : TDateTime) : double;
begin
  Result := 0;
  with qryTFz do begin
    if not Active then Open;
    Last;  // Сортирована по DtBeg, NR
    while not Bof do begin
      if qryTFzDtBeg.AsDateTime <= dZaMG then begin
        Result := qryTFzPrcDoMax.AsFloat;
        Break;
      end;
      Prior;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetPrcSS(dZaMG : TDateTime; var nPrcDoMin, nPrcDoMax : double);
begin
  nPrcDoMin := 0;
  nPrcDoMax := 0;
  with qryTSs do begin
    if not Active then Open;
    Last;  // Сортирована по DtBeg, NR
    while not Bof do begin
      if qryTSsDtBeg.AsDateTime <= dZaMG then begin
        nPrcDoMin := qryTSsPrcDoMin.AsFloat;
        nPrcDoMax := qryTSsPrcDoMax.AsFloat;
        Break;
      end;
      Prior;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetPrcFzDgv(dZaMG : TDateTime) : double;
begin
  Result := 0;
  with qryTPrp do begin
    if not Active then Open;
    Last;  // Сортирована по DtBeg, NR
    while not Bof do begin
      if qryTPrpDtBeg.AsDateTime <= dZaMG then begin
        Result := qryTPrpPrcFz1006.AsFloat;
        Break;
      end;
      Prior;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.PrepareQryBLS;
begin
  with qryBLS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Get_BnkLS(:nTabN, :dOnDate)');
    Prepare;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.DataModuleDestroy(Sender: TObject);
begin
  qryPrmUv.Close;
  qryPere.Close;
  qryNadb.Close;
  qryUdrg.Close;
  qryOtkl.Close;
  QryNUCmn.Close;

  with qryBLS do begin
    if Active then
      Close;
    if Prepared then
      UnPrepare;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetBankLS(nTabN : integer; dOnDate : tDateTime;
                                 var dDtBeg : TDateTime; var nKdBnk : SmallInt;
                                     var cShBnk, cNmBnk, cLicSch : ShortString;
                                              var bSpbLS, bIsClosed : boolean);
begin
  dDtBeg  := 0;
  nKdBnk  := 0;
  cShBnk  := '';
  cNmBnk  := '';
  cLicSch := '';
  bSpbLS  := false;
  bIsClosed := true;
  with qryBLS do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dOnDate').AsDateTime := dOnDate;
    Open;
    if RecordCount > 0 then begin
      dDtBeg  := FieldByName('DtBeg').AsDateTime;
      nKdBnk  := FieldByName('KdBnk').AsInteger;
      cShBnk  := FieldByName('ShBnk').AsString;
      cNmBnk  := FieldByName('NmBnk').AsString;
      cLicSch := FieldByName('LicSch').AsString;
      bSpbLS  := FieldByName('SpB').AsString = 'Y';
      bIsClosed := FieldByName('CLS').AsString = 'Y';
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.GetBankSpecLS(nTabN: integer; dOnDate: tDateTime;
                var dDtBeg: TDateTime; var nKdBnk: SmallInt; var cShBnk, cNmBnk,
                                     cLicSch: ShortString; var bSpbLS: boolean);
begin
  nKdBnk  := 0;
  cShBnk  := '';
  cNmBnk  := '';
  cLicSch := '';
  bSpbLS  := false;
  with qrySpecBLS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 LS.TabN, LS.DtBeg, LS.KdBnk, bnk.ShBnk, ' +
            ' bnk.NmBnk, LS.LicSch, LS.Notes, LS.SpB from z_BankiLS LS ' +
            ' Left Outer Join z_Banki bnk on bnk.KdBnk = LS.KdBnk ' +
            ' where LS.TabN = :nTabN and LS.SPB = "Y" and ' +
            ' (LS.CLS is NULL or LS.CLS = "") and ' +
            ' LS.DtBeg <= :dOnDate order by LS.DtBeg desc, LS.NR desc');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dOnDate').AsDateTime := dOnDate;
    Open;
    if RecordCount > 0 then begin
      dDtBeg  := FieldByName('DtBeg').AsDateTime;
      nKdBnk  := FieldByName('KdBnk').AsInteger;
      cShBnk  := FieldByName('ShBnk').AsString;
      cNmBnk  := FieldByName('NmBnk').AsString;
      cLicSch := FieldByName('LicSch').AsString;
      bSpbLS  := FieldByName('SpB').AsString = 'Y';
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryOtklVIDNSetText(Sender: TField; const Text: String);
var cText : string; cVidN : string4; cShVidN, cNmVidN : string;
begin
//  if not bReady then Exit;
  cText := Text;
  if cText <> '' then begin
    cVidN := cText;
    cShVidN := DmMain.VidN2ShVidN(cVidN, cNmVidN);
    if cShVidN <> '' then begin
      qryOtklShVidN.AsString := cShVidN;
      Sender.AsString := cText; end
    else begin
      qryOtklShVidN.AsString := '';
      Raise Exception.Create('Нет в справочнике видов начислений/удержаний ' +
                             'вида "' + cText + '"');
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryOtklKDOBJValidate(Sender: TField);
var cText : ShortString;  bIsInDic : boolean; cShObj : ShortString;
begin
  cText := Sender.AsString;
  if cText > '' then begin
    if (cText = '1000') or (cText = '2000') or
             (cText = '3000') or (cText = '4000') then
      Raise Exception.Create('Не допускается выбор подразделения ' + cText)
    else begin
      bIsInDic := IsKdObjInDic(StrToInt(cText), cShObj);
      if not bIsInDic then
        Raise Exception.Create('Нет в справочнике подразделения ' + cText)
      else
        qryOtklShObj.AsString := cShObj;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryOtklKDKATPValidate(Sender: TField);
var cText, cVidN : ShortString;  bIsInDic : boolean; cShKatP : ShortString;
begin
  cVidN := qryOtklVidN.AsString;
  if (cVidN = '8801') or (cVidN = '8802') then
    Exit;
  cText := Sender.AsString;
  if cText > '' then begin
    bIsInDic := IsKdKatPInDic(StrToInt(cText), cShKatP);
    if not bIsInDic then
      Raise Exception.Create('Нет в справочнике категории персонала ' + cText)
    else
      qryOtklShKatP.AsString := cShKatP;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryOtklSchBUSetText(Sender: TField; const Text: String);
var cSchBU, cPSch : string; nKdSbu : integer; bHsCh : boolean;
begin
  cSchBU := Text;

  if cSchBU = '' then begin
    qryOtklKdSpZ.AsString := '';
    (Sender as TField).AsString := cSchBU; end
  else {if cSchBU > '' then} begin
    if CheckSBU(nKdSbu, cSchBU, cPSch, bHsCh) {a_SBU} then begin
      if not bHsCh then begin
        qryOtklKdSpZ.AsInteger := nKdSbu;
        (Sender as TField).AsString := cSchBU; end
      else
        Raise Exception.Create(
                    'Выбранный счет имеет СубСчета - на него относить нельзя');
    end;
  end;

end;
//------------------------------------------------------------------------------
procedure TDmMain.GetSmPrcLgt(nTabN : integer; dDtPrc : TDateTime;
                                 var nCntChld10_11 : SmallInt;
                   var nSmPrcLgtSotr, nSmPrcLgtChld10, nSmPrcLgtChld11 : double;
                                                    var cOznPilg : ShortString);
var cOP : ShortString;
begin
  nCntChld10_11 := 0;
  nSmPrcLgtSotr := 0;
  nSmPrcLgtChld10 := 0;
  nSmPrcLgtChld11 := 0;
  cOznPilg := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select kd.Ozn_Pilg, Lgt.* from Z_Lgotu Lgt ' +
            ' Left Outer Join z_KdLgt Kd on Kd.KdLgt = Lgt.KdLgt ' +
            ' where Lgt.TabN = :nTabN order by Lgt.DtBeg');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    while not Eof do begin
      if (FieldByName('DtBeg').AsDateTime <= dDtPrc) and
              (FieldByName('DtEnd').IsNull or
                        (FieldByName('DtEnd').AsDateTime >= dDtPrc)) then begin
        if (FieldByName('KdLgt').AsInteger < 10) or
                                     (FieldByName('KdLgt').AsInteger = 12) then
          nSmPrcLgtSotr := nSmPrcLgtSotr + FieldByName('PrcLgt').AsFloat
        else if (FieldByName('KdLgt').AsInteger = 10) then begin
          nSmPrcLgtChld10 := nSmPrcLgtChld10 + FieldByName('PrcLgt').AsFloat;
          Inc(nCntChld10_11); end
        else if (FieldByName('KdLgt').AsInteger = 11) then begin
          nSmPrcLgtChld11 := nSmPrcLgtChld11 + FieldByName('PrcLgt').AsFloat;
          Inc(nCntChld10_11); end
        else
          {Nothing};
        cOP := Trim(FieldByName('Ozn_Pilg').AsString);
        if Pos(cOP, cOznPilg) <= 0 then
          cOznPilg := cOznPilg + cOP + ';';
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryEsvNewRecord(DataSet: TDataSet);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  qryEsvDtBeg.AsDateTime := dDtPrc;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryEsvAfterPost(DataSet: TDataSet);
var nSvNR : integer; bEof : boolean;
begin
  nSvNR := 0;
  bEof := true;
  with qryEsv do begin
    if not FieldByName('NR').IsNull then begin
      nSvNR := FieldByName('NR').AsInteger;
      bEof := false;
    end;
    if UpdatesPending then begin
      Form_Dm.DbMain.ApplyUpdates([qryEsv]);
      Close;
      Open;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, [])
      else if bEof then
        Last;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryEsvAfterDelete(DataSet: TDataSet);
begin
  with qryEsv do begin
    if UpdatesPending then
      Form_Dm.DbMain.ApplyUpdates([qryEsv]);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryEsvPNewRecord(DataSet: TDataSet);
var dDtPrc : TDateTime;
begin
  dDtPrc := dDtProc;
  qryEsvPDtBeg.AsDateTime := dDtPrc;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryEsvPAfterPost(DataSet: TDataSet);
var nSvNR : integer; bEof : boolean;
begin
  nSvNR := 0;
  bEof := true;
  with qryEsvP do begin
    if not FieldByName('NR').IsNull then begin
      nSvNR := FieldByName('NR').AsInteger;
      bEof := false;
    end;
    if UpdatesPending then begin
      Form_Dm.DbMain.ApplyUpdates([qryEsvP]);
      Close;
      Open;
      if nSvNR <> 0 then
        Locate('NR', nSvNR, [])
      else if bEof then
        Last;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.qryEsvPAfterDelete(DataSet: TDataSet);
begin
  with qryEsvP do begin
    if UpdatesPending then
      Form_Dm.DbMain.ApplyUpdates([qryEsv]);
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.QryPrmUvCalcFields(DataSet: TDataSet);
begin
  if not qryPrmUvKdPidZv.IsNull then
    qryPrmUvPidZviln.AsString := GetPidZviln(qryPrmUvKdPidZv.AsInteger);
end;
//------------------------------------------------------------------------------
function TDmMain.GetPidZviln(nKdPidZv: Smallint): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_PidZviln where (Code = :nKdPidZv)');
    ParamByName('nKdPidZv').AsInteger := nKdPidZv;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('Reasons').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetMinDtProcDekr(nTabN: integer;
                                               dOnDtPrc: TDateTime): TDateTime;
// Найти месяц MesBegDekr, в котором были расчитаны декретные, как
// минимальный DtProc за 5 месяцев назад и 5 месяцев вперед от текущего месяца.
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Min(DtProc) MesBegDekr from Z_NU where TabN = :nTabN and ' +
            ' DtProc >= :dOnDtPrc-155 and DtProc <= :dOnDtPrc+155 and ' +
            ' VidN = "2602"');
    ParamByName('nTabN').AsInteger     := nTabN;
    ParamByName('dOnDtPrc').AsDateTime := dOnDtPrc;
    Open;
    if (RecordCount > 0) and not FieldByName('MesBegDekr').IsNull then
      Result := FieldByName('MesBegDekr').AsDateTime;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetCntWorkChas(nTabN: integer; dDtZaMG: TDateTime;
                                                   bIsCmbOkl: boolean): double;
// Используется для расчёта к-ва отработанных сотрудником часов при индексации
var nChTmp : double; nKdSpZ, nKdObj : SmallInt;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if not bIsCmbOkl then begin
      SQL.Add('Select Sum(Chas) Chas from Z_NU where TabN = :nTabN and ' +
              ' ZaMesGod = :dDtZaMG and VidN = "1003" and ' +
              ' MyNotes = "ByDefault"');
      ParamByName('nTabN').AsInteger    := nTabN;
      ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
      Open;
      if (RecordCount > 0) and not FieldByName('Chas').IsNull then
        Result := FieldByName('Chas').AsFloat; end
    else begin
      SQL.Add('Select * from Z_NU where TabN = :nTabN and ' +
              ' ZaMesGod = :dDtZaMG and VidN = "1004" and ' +
              ' MyNotes = "Из_CmbOkl" order by KdSpZ, DtProc');
      ParamByName('nTabN').AsInteger    := nTabN;
      ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
      Open;
      while not Eof do begin
        nKdObj := FieldByName('KdObj').AsInteger;
        nKdSpZ := FieldByName('KdSpZ').AsInteger;
        nChTmp := 0;
        while (FieldByName('KdObj').AsInteger = nKdObj ) and
                (FieldByName('KdSpZ').AsInteger = nKdSpZ ) and not Eof do begin
          nChTmp := nChTmp + FieldByName('Chas').AsFloat;
          Next;
        end;
        Result := Max(Result, nChTmp);
      end;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.QryPereNPDValidate(Sender: TField);
var cText : ShortString;  {bIsInDic : boolean;}
begin
  cText := Sender.AsString;  // Признак неПолного рабочего дня. Ни на что не
  if cText > '' then begin   // влияет. Нужен только для отчётов в СПОВ
    if (cText <> '0') and (cText <> '1') then
      Raise Exception.Create('Поле может быть пустым ' +
                                        'либо иметь значения: 0 или 1');
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetCountWrkChas: double;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from e_Days where E_Day = :dE_Day');
    ParamByName('dE_Day').AsDateTime := EncodeDate(1901, 1, 1);
    Open;
    if RecordCount > 0 then
      Result := FieldByName('Rab_Chas').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetNdbDates(nNdbSpecNR: integer;
                                  var dNdbDtBeg, dNdbDtEnd: TDateTime): boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Nadb where Spec_NR = :nSpecNR');
    ParamByName('nSpecNR').AsInteger := nNdbSpecNR;
    Open;
    if RecordCount > 0 then begin
      Result := true;
      dNdbDtBeg := FieldByName('Dt_Beg').AsDateTime;
      dNdbDtEnd := FieldByName('Dt_End').AsDateTime;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.VidIsSovm(cVidN: ShortString): boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdVidN where VidN = :cVidN');
    ParamByName('cVidN').AsString := cVidN;
    Open;
    if (RecordCount > 0) and (FieldByName('Sovm').AsString = '1') then
      Result := true;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.NdbClosed(nSpecNR: integer; dOnDate: TDateTime): boolean;
begin
  Result := false;   // Закрыта ли надбавка на дату dOnDate
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Nadb where Spec_NR = :nSpecNR');
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    Open;
    if (RecordCount > 0) and not FieldByName('Dt_End').IsNull and
                           (FieldByName('Dt_End').AsDateTime < dOnDate) then
        Result := true;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.NdbFromFirstDay(nSpecNR: integer; dZaMG: TDateTime): boolean;
begin
  Result := true;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Nadb where Spec_NR = :nSpecNR');
    ParamByName('nSpecNR').AsInteger := nSpecNR;
    Open;
    if (RecordCount > 0) and (FieldByName('Dt_Beg').AsDateTime > dZaMG) then
      Result := false;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.FirstWrkDayInMes(dDtPrc : TDateTime): TDateTime;
var i : SmallInt; dDtTmp : TDateTime; bDayIsWrk : boolean;
begin    // Найти дату 1-го рабочего дня в месяце dDtPrc
  dDtTmp := dDtPrc;
  Result := dDtPrc;
  if not qryEDays.Active then
    qryEDays.Open;
  for i := 0 to 31 do begin
    dDtTmp := dDtTmp + i;
    if qryEDays.Locate('E_Day', dDtTmp, []) then
      bDayIsWrk := (qryEdays.FieldByName('Rab_Chas').Value > 0)
    else
      bDayIsWrk := (RusDayOfWeek(dDtTmp) < 6);
    if bDayIsWrk then begin
      Result := dDtTmp;
      Break;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TDmMain.GetKdSpZ(nKdObj: SmallInt;
                                           var cLnkSch : ShortString): SmallInt;
begin                 // должна возвратить код связанного счёта (KdSpZ)
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
//    SQL.Add('Select * from Z_KdObj where KdObj = :nKdObj');
    SQL.Add('Select s.SchBU, o.* from z_KdObj o ' +
            ' Left Outer Join Kd_Sbu s on s.KdSch = o.KdSpZ ' +
            ' where KdObj = :nKdObj');
    ParamByName('nKdObj').AsInteger := nKdObj;
    Open;
    if (RecordCount > 0) then begin
      Result := FieldByName('KdSpZ').AsInteger;
      cLnkSch := FieldByName('SchBU').AsString;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.timerPGTimer(Sender: TObject);
begin
   with DbOKTest do begin
     Connected := false;
     Connected := true;
     gb_IsConnectPG := Connected;
   end;

end;
//------------------------------------------------------------------------------
function TDmMain.KdSlg2NmSlg(nKdSlg: SmallInt): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_IspSlg where KdSlg = :nKdSlg');
    ParamByName('nKdSlg').AsInteger    := nKdSlg;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NmSlg').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TDmMain.SetAmzDate;
begin
  with qryAmz do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_BgDtAu ');
    Open;
    if RecordCount > 0 then begin
      gd_DtBegAutoDMZ := FieldByName('DtBegAuto').AsDateTime;
       FormZpMain.LabelBegDMZ.Caption :=
                           'АвтоДоМЗ с: ' + DateToStr(gd_DtBegAutoDMZ);
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';;
  end;
end;

//- SB -------------------------------------------------------------------------
procedure ResetQuery(query: TQuery);
begin
  with query do begin
    if Active then Close;
    if Prepared then UnPrepare;
    SQL.Clear;
  end;
end;

//- SB -------------------------------------------------------------------------
procedure InitQuery(query: TQuery);
begin
  ResetQuery(query);
  query.DataBaseName := CESMAIN;
end;

//- SB -------------------------------------------------------------------------
procedure ReleaseQuery(query: TQuery);
begin
  ResetQuery(query);
  query.DataBaseName := '';
end;

//- SB -------------------------------------------------------------------------
function CopyRecord(src, dst: TDataSet): boolean;
var
  count, i: integer;
  fieldName: string;
begin
  Result := src.RecordCount > 0;

  if Result then begin
    count := src.FieldDefs.Count;

    for i := 0 to count - 1 do begin
      fieldName := src.FieldDefs[i].Name;

      // Тупость ситуации в том, что, не смотря на то, что fieldName получен у src,
      // в некоторых случаях, при обращении к 'src.FieldByName(fieldName).Value',
      // оказывается, что у sкс этого поля нет. Возможно оптимизация для пустых полей.
      // Поэтому добавлена проверка 'and (src.FindField(fieldName) <> nil)'.
      if (dst.FindField(fieldName) <> nil) and (src.FindField(fieldName) <> nil) then
        dst.FieldByName(fieldName).Value := src.FieldByName(fieldName).Value;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.QryPrmUvAfterOpen(DataSet: TDataSet);
begin
  qryPrmUv.Last;
end;

//------------------------------------------------------------------------------
function TDmMain.CreSpsInProgress: boolean;
begin
  with tblCreSpsState do begin
    Open;
    Result := not Eof;
    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.LockCreSps;
begin
  with tblCreSpsState do begin
    Open;
    Insert;
    FieldByName('USR').AsString := gc_AppNmUsr;
    Post;
    Close;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.UnlockCreSps;
begin
  with tblCreSpsState do begin
    Open;
    Delete;
    Close;
  end;
end;

//------------------------------------------------------------------------------
function TDmMain.PrBln2NmPrBln(eBlnType: TBlnType; nPrBln: SmallInt): ShortString;
begin
  Result := '';

  if nPrBln > 0 then begin
    InitQuery(qryTmp);
    with qryTmp do begin
      SQL.Add(PrBlnPickStmt(eBlnType, nPrBln));
      Open;
      if RecordCount > 0 then
        Result := FieldByName('NmPrBln').AsString;
    end;
    ReleaseQuery(qryTmp);
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.CdsPmntsCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('Summa').AsFloat >= 0 then
    DataSet.FieldByName('SmN').AsFloat := DataSet.FieldByName('Summa').AsFloat
  else
    DataSet.FieldByName('SmU').AsFloat := -DataSet.FieldByName('Summa').AsFloat;
end;

//------------------------------------------------------------------------------
procedure TDmMain.PreparePmntsDataSet;
begin
  with CdsPmnts.IndexDefs do
  if Count = 0 then begin
    Add('ByPayType', 'VidN;ZaMesGod;Dt_Beg;KdObj;PSch;SchBU;KdKatP', []);
    Add('ByMnth', 'ZaMesGod;VidN;Dt_Beg;KdObj;PSch;SchBU;KdKatP', []);
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.LoadPayments(
  ShowSpecVids, NewShortMode: Boolean
);
var
  EmplId, I: Integer;
  DtProc: TDateTime;
begin
  with CdsPmnts do begin
    DisableControls;

    with FormZpMain.QrySps do begin
      EmplId := FieldByName('TabN').AsInteger;
      DtProc := FieldByName('DtProc').AsDateTime;
    end;

    OpenPmntsQry(QryPmnts, EmplId, DtProc,
      (gl_nAppKdSpsUsr > 2) and not EmplIsInMainList(EmplId, DtProc),
      ShowSpecVids, false, NewShortMode);

    // При открытии, через DataProvider данные из запроса зальются в Cds.
    Close;
    Open;

    // Назначаем NR, чтобы можно было посредством F8, F7 считать итоги
    // в нач/удерж. главной формы.
    First;
    I := 1;
    while not Eof do begin
      Edit;
      FieldByName('NR').AsInteger := I;
      Post;
      Next;
      Inc(I);
    end;

    PreparePmntsDataSet;

    if bFlagDbg then
      CdsPmnts.SaveToFile('CdsPmnts.cds');

    First;
    EnableControls;
  end;

  DsrcPmnts.DataSet := CdsPmnts;
end;

//------------------------------------------------------------------------------
procedure TDmMain.OpenQryPrmUv;
begin
  with qryPrmUv do begin
    if Active then
      Close;
    Open;
    Last;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.PrepareQryPrmUv(DsrcSps: TDataSource);
begin
  TQryUtils.InitQuery(QryPrmUv);
  
  with QryPrmUv do begin
    SQL.Add(
      'select * ' +
      'from Z_PrmUv ' +
      'where TabN = :TabN and KdSps = 0 ' +
      'order by Dt_Priem');

    Prepare;
    DataSource := DsrcSps;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.OpenQryPere(Ascending: Boolean);
begin
  with QryPere do begin
    if Active then
      Close;
    Open;

    if Ascending then
      Last
    else
      First;
  end;

  // Заодно открываем и частичные оклады.
  QryDPere.Open;
end;

//------------------------------------------------------------------------------
procedure TDmMain.OpenQryNadb(
  DsrcSps: TDataSource;
  Actual: Boolean;
  EmplLists: TStrings);
var
  SavedNr: Integer;
  EmplId, I: SmallInt;
  DtProc: TDateTime;
  AllowedLists: String;
begin
  with DmMain, QryNadb do begin
    if Active then
      SavedNr := FieldByName('Nr').AsInteger
    else
      SavedNr := 0;

    TQryUtils.InitQuery(QryNadb);
    DataSource := DsrcSps;

    with DsrcSps.DataSet do begin
      EmplId := FieldByName('TabN').AsInteger;
      DtProc := FieldByName('DtProc').AsDateTime;
    end;

    if bAppSpecUsr and not EmplIsInMainList(EmplId, DtProc) then begin
      AllowedLists := '';

      for I := 0 to EmplLists.Count - 1 do
        AllowedLists := TextUtils.ConcatStr(AllowedLists, EmplLists[I], ', ');
    end;

    if Actual then begin
      SQL.Text :=
        'select * ' +
        'from z_ViNadb ' +
        'where TabN = :TabN ' +
          'and Dt_Beg <= :dDtEnd ' +
          'and (Dt_End is null or Dt_End >= :dDtBeg)';

      if AllowedLists <> '' then
        SQL.Add(
          'and KdSps in (' + AllowedLists + ') '
        );

      SQL.Add(
        'order by Dt_Beg, VidN, Dt_End'
      );

      ParamByName('dDtBeg').AsDateTime := dDtProc;
      ParamByName('dDtEnd').AsDateTime := myLastDoM(dDtProc);
    end else begin
      SQL.Text :=
        'select * ' +
        'from z_ViNadb ' +
        'where TabN = :TabN ';

      if AllowedLists <> '' then
        SQL.Add(
          'and KdSps in (' + AllowedLists + ') '
        );

      SQL.Add(
        'order by Dt_Beg, VidN, Dt_End'
      );
    end;

    Open;

    if (SavedNr = 0) or not Locate('Nr', SavedNr, []) then
      Last;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.PrepareQryPere(DsrcSps: TDataSource; Ascending: Boolean);
begin
  TQryUtils.InitQuery(QryPere);

  with QryPere do begin
    if Ascending then begin
      SQL.Add('Select * from Z_PERE where (TabN = :TabN) ');
      SQL.Add('order by Dt_Beg, NR');
    end else begin
      SQL.Add('Select first 5 * from Z_PERE where (TabN = :TabN) ');
      SQL.Add('order by Dt_Beg desc, NR desc');
    end;

    Prepare;
    DataSource := DsrcSps;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.OpenPmntsQry(
  Query: TQuery;
  EmplId: Integer;
  DtProc: TDateTime;
  ShowNich, ShowTaxes, ForPrint, NewShortMode: Boolean
);
begin
  if NewShortMode then
    ComposeShortPmnts(Query, ShowNich, ShowTaxes, ForPrint)
  else
    ComposePmntsQry(Query, ShowNich, ShowTaxes, ForPrint);

  with Query do begin
    ParamByName('TabN').AsInteger := EmplId;
    ParamByName('DtProc').AsDateTime := DtProc;
    // Open;
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.PreparePmntsQry(
  Query: TQuery;
  ShowNich, ShowTaxes, ForPrint, NewShortMode: Boolean);
begin
  if NewShortMode then
    ComposeShortPmnts(Query, ShowNich, ShowTaxes, ForPrint)
  else
    ComposePmntsQry(Query, ShowNich, ShowTaxes, ForPrint);
    
  Query.Prepare;
end;

//------------------------------------------------------------------------------
procedure TDmMain.ComposePmntsQry(
  Qry: TQuery;
  ConsiderNich, ShowTaxes, ForPrint: Boolean);
var
  SelectNames, GroupNames: String;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  procedure AddSpsClause;
  begin
    // if (gl_nAppKdSpsUsr > 2) and not FormZpMain.TabNInOsnSps then begin
    if ConsiderNich then begin
      with Qry do begin
        SQL.Add('and KdSps = :KdSps ');
        ParamByName('KdSps').AsInteger := gl_nAppKdSpsUsr;
      end;
    end;
  end;
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
begin
  GroupNames :=
    'DtProc, ZaMesGod, TabN, VidN, ShVidN, Dt_Beg, Dt_End, KdSps, Grp, ' +
    'KdObj, KdKatP, KdTemu, NmTemu, KdSpz, PSch, SchBU, ' +
    'KdBnk, PDN, Sovm, PRR, PRPV, PRKR, KTO, SpecPS, DtVDPV, NrVDPV, NuSovm, ' +
    'Storn';

  InitQuery(Qry);

  with Qry do begin
    SelectNames := 'Nr, ' + GroupNames +
      ', Sum(Chas) Chas, Sum(Summa) Summa, 0 Spec_Nr';

    SQL.Add(
      // Первый select выбирает начисления/удержания, сделанные в текущем
      // месяце, включая пересчёты прошлых месяцев. Записи группируются, суммы
      // и часы взаимокомпенсируются.
      'select ' + SelectNames + ' ' +
      'from ViNuMain ' +
      'where TabN = :TabN and DtProc = :DtProc');

    AddSpsClause;

    // if not FormZpMain.popNuShwSpecVids.Checked then
    if not ShowTaxes then
      SQL.Add('and VidN < "8600" ');

    SQL.Add(
      'group by Nr, Spec_Nr, ' + GroupNames + ' ' +
      'having ' +
        // Выбираются записи с ненулевой суммой, либо с ненулевыми
        // часами, если записи не будущих месяцев
        'Sum(Summa) <> 0 or Sum(Chas) <> 0 and ZaMesGod <= DtProc ' +
        // Основные виды для наглядности показываем и в случае
        // нулевых сумм/часов
        'or VidN > "1000" and VidN < "1200" ' +
        // Эти виды идут и без часов и без сумм:
        'or VidN >= "5009" and VidN <= "5012" and ZaMesGod <= DtProc');

    SQL.Add('UNION');

    // Этот select выбирает отпуска и неоплачиваемые вид прошлых месяцев
    // сделанные для текущего месяца для обоснования, почему не было
    // начислений в определённые периоды.

    SelectNames := 'Nr, ' + GroupNames + ', Sum(Chas) Chas, 0 Summa, 0 Spec_Nr';

    SQL.Add(
      'select ' + SelectNames + ' ' +
      'from ViNuMain ' +
      'where TabN = :TabN and ZaMesGod = :DtProc and DtProc < :DtProc');

    if ForPrint then
      // Для печати расчётных листов выбираются и отпуска.
      SQL.Add(
        'and (VidN > "2400" and VidN < "2600" ' +
          'or VidN > "5000" and VidN < "6000") ' +
        'and (Summa <> 0 or Chas <> 0)')
    else
      // Для экрана - только неоплачиваемые виды.
      // Отпуска выберутся отдельно в следующем UNION.
      SQL.Add(
        'and VidN > "5000" and VidN < "6000" ' +
        'and Chas <> 0');

    AddSpsClause;

    SQL.Add(
      'group by NR, Spec_Nr, ' + GroupNames + ' ');

    if not ForPrint then begin
      // ПРИ ВЫВОДЕ НА ЭКРАН.
      // Этот select выбирает пересчёты отпусков, которые не должны
      // суммироваться при группировании, а показываются отдельными записями.
      SQL.Add('UNION');

      SelectNames := 'Nr, ' + GroupNames + ', Chas, Summa, 0 Spec_Nr';

      SQL.Add(
        'select ' + SelectNames + ' ' +
        'from ViNuMain ' +
        'where TabN = :TabN and DtProc = :DtProc ' +
          'and VidN > "2400" and VidN < "2600"');

      AddSpsClause;
    end;

    // Сортировка для печати расчётных листков: ВидН, ЗаМесГод.
    // Nr - чтобы переводы в банк шли в очерёдности ввода.
    SQL.Add(
      'order by 5, 3, 1');
      // 10.6.2026 Так лучше: 
      // 'order by 3, 5, 1');
      // но решил не трогать
  end;

  // Важное замечание!!!: операция UNION объединяет идентичные записи -
  // дубликатов не будет.
end;

//------------------------------------------------------------------------------
procedure TDmMain.ComposeShortPmnts(
  Query: TQuery;
  ShowNich, ShowTaxes, ForPrint: Boolean);
begin
  InitQuery(Query);

  with Query, SQL do begin
    Text :=
      'select DtProc, ZaMesGod, TabN, VidN, ShVidN, Dt_Beg, Dt_End, KdSps, ' +
        'Grp, KdObj, KdKatP, KdTemu, NmTemu, KdSpz, PSch, SchBU, ' +
        'KdBnk, PDN, Sovm, PRR, PRPV, PRKR, KTO, SpecPS, DtVDPV, NrVDPV, ' +
        'case ' +
          // Есть проблема записи: для совместительского вида не всегда
          // записывается признак совместительства NuSovm. Поэтому, если
          // установлен Sovm, устанавливаем и NuSovm
          'when Sovm = "1" then "1" ' +
          // Другая проблема - несовместительство проставляется разными
          // значениями, то пусто, то ноль. Поэтому, если ноль, ставим пусто
          'when NuSovm = "0" then "" ' +
          'else NuSovm ' +
        'end NuSovm, ' +
        'Storn, Spec_Nr, 0 Nr, ' +
        'Round(sum(summa), 2) summa, sum(chas) chas ' +
        'from ViNuMain n ' +
      'where tabn = :TabN ' +
        'and dtproc = :DtProc';

    if ShowNich then begin
      Add(
        'and KdSps = :KdSps'
      );

      ParamByName('KdSps').AsInteger := gl_nAppKdSpsUsr;
    end;

    if not ShowTaxes then
      Add(
        'and VidN < "8600"'
      );

    Add(
      'group by DtProc, ZaMesGod, TabN, VidN, ShVidN, Dt_Beg, Dt_End, KdSps, ' +
        'Grp, KdObj, KdKatP, KdTemu, NmTemu, KdSpz, PSch, SchBU, ' +
        'KdBnk, PDN, Sovm, PRR, PRPV, PRKR, KTO, SpecPS, DtVDPV, NrVDPV, ' +
        'case ' +
          'when Sovm = "1" then "1" ' +
          'when NuSovm = "0" then "" ' +
          'else NuSovm ' +
        'end, ' +
        'Storn, Spec_Nr, Nr ' +
      'having Round(sum(summa), 2) <> 0 or sum(chas) <> 0'
    );

    // Сортировка для печати расчётных листков: ВидН, ЗаМесГод.
    // Nr - чтобы переводы в банк шли в очерёдности ввода.
    SQL.Add(
      'order by ZaMesGod, VidN, Dt_Beg'
    );
  end;
end;

//------------------------------------------------------------------------------
procedure TDmMain.ChangePmntsSort(SortByMnth: Boolean);
begin
  with CdsPmnts do
    if SortByMnth then IndexName := 'ByMnth' else IndexName := 'ByPayType';
end;

//------------------------------------------------------------------------------
function TDmMain.EmplIsInMainList(EmplId: Integer; DtProc: TDateTime): Boolean;
var
  Qry: TQuery;
begin
  Result := false;
  Qry := TQuery.Create(nil);

  if TQryUtils.PeekPere(Qry, EmplId, DtProc, false) then
    Result := Qry.FieldByName('KdSps').AsInteger = gl_nAppKdSpsUsr;

  Qry.Free;
end;

//------------------------------------------------------------------------------
function TDmMain.QryPmnts: TQuery;
begin
  Result := QryNuCmn;
end;

//------------------------------------------------------------------------------
function TDmMain.InCtrlMes: Boolean;
begin
  Result := dDtProc = dCtrlDate;
end;

//------------------------------------------------------------------------------
procedure TDmMain.qryUdrgOznDohValidate(Sender: TField);
begin
  if (Sender.AsInteger <> 0)
    and not SalaryUtils.PeekOznDoh(QryPeek, Sender.AsInteger)
  then
    raise Exception.Create(
      'Ознака дохода ' + Sender.AsString + ' не найдена в справочнике.');
end;

end.
