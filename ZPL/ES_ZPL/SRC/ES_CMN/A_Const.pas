unit A_Const;

interface
uses
  SysUtils;


const CESMAIN = 'DbMain';
      CESOK   = 'EsDbOk';  // из БД УПО (основная) Должна быть
      CESOKS  = 'EsDbOks';
      CESUCH  = 'EsDbOks'; // из копии, находящейся в БД EsOks   одна из трех
      cMyString = 'abcdefghijklmnopqrstuvwxyz';
      cBukovki  = 'абвгдежзийклмнопрстуфхцчшщюэя'; // cyrl 29 букв
                  // для подКекв'ов в "Дебиторы / Кредиторы"
      STROKANUMB = '0123456789';

      DRIVE_FOR_REPORTS = 'K:';
      DRIVE_FOR_REPORTS_DEBUG = 'L:';

const DECIMALSEPARATOR = '.';
      SECTION = 'Main';

      WHO_MIN_SKL  = 101;
      WHO_MIN_PDR  = 2501;
      WHO_MIN_KLI  = 5001;
      WHO_MIN_REA  = 20001;

      // константы для обозначения типов WHO (поле PrWho в таблице tbl_KdWho)
      WHO_TYPE_SLG = -5;    // служебные (остатки, акты списания, переоценки)
      WHO_TYPE_SLGBNK = -1; // то же, но для программы БАНК
      WHO_TYPE_SBU = 1;     // подразд.-банковские счета (в УМЦ не показывать)
      WHO_TYPE_SKL = 5;     // для складов
      WHO_TYPE_PDR = 6;     // для подразд.общих
      WHO_TYPE_MBP = 7;     // для подразд.малоценки (МБП)
      WHO_TYPE_KLI = 10;    // для клиентов
      WHO_TYPE_REA = 30;    // для клиентов-реализаторов

      // константы для обозначения CaseForm - форм ввода
      CF_VHOST     = -2;    // как правило, на начало работы программы)
      CF_PRHNAKL   =  1;    // ПрихНакл (только для СклПдр и всегда
                            //   со стороны)
      CF_RSHNAKL   =  2;    // РасхНакл
                            //   (на сторону, при внутр.перемещении,
                            //     кл-Реализатору)
      CF_AKTSPIS   = -3;    // акт списания (только для СклПдр)
      CF_PCUCH     = -6;    // изменение уч. цен на СклПдр
      CF_PCREA     = -5;    // изменение цен реализации у кл-реализ.
      CF_VZVTOSKL  =  3;    // возврат от кл-реализатора на СклПдр
      CF_VZVPOK    =  4;    // возврат от покупателя на СклПдр или
                            //                 клиенту-реализатору
      CF_REALIZ    = -4;    // реализация (продажа) от кл-реализ.

      // константы для обозначения типов документов в БД (поле VidDok)
      VD_VHOST    = 'VhOst'; // на начало работы программы)
      VD_PHOST    = 'PhOst'; // переходящие остатки (на начало года).
                             // создаются автоматом и не редактируются
      VD_OSTBY    = 'OstBY'; // Остаток на начало года
      VD_PRHN     = 'PrhN';     // ПрихНакл (на СклПдр со стороны)
      VD_RSHN     = 'RshN';     // РасхНакл на сторону

      VD_VNRSH    = 'VnRsh';    // Внутр перемещ (расход)
      VD_VNPRH    = 'VnPrh';    // Внутр перемещ (приход)
      VD_REARSH   = 'ReaRsh';   // Отгрузка реализатору (расход)
      VD_REAPRH   = 'ReaPrh';   // Отгрузка реализатору (приход)
      VD_VZSKLRSH = 'VzSklRsh'; // возврат от кл-реал на СклПдр (rsh)
      VD_VZSKLPRH = 'VzSklPrh'; // возврат от кл-реал на СклПдр (prh)

      VD_REALIZ   = 'Realiz';   // реализация (продажа) от кл-реализ.
      VD_VZPOK    = 'VzPok';    // возврат от покупателя на СклПдр или
                               //   клиенту-реализатору

      VD_PCUCH    = 'PcUch';    // изменение уч. цен на СклПдр
      VD_PCU_2    = 'PCU_2';    // изменение уч. цен на СклПдр
      VD_PCREA    = 'PcRea';    // изменение ЦРП у кл-реализ.
      VD_PCR_2    = 'PCR_2';    // изменение ЦРП у кл-реализ.

      VD_AKTSPIS  = 'AktSpis';  // акт списания (только для СклПдр)
      VD_STORN    = 'Storn';    // документ о сторнировании

      ARRMONTH : array[1..12] of string =
                              ('Январь', 'Февраль', 'Март',
                               'Апрель', 'Май', 'Июнь',
                               'Июль', 'Август', 'Сентябрь',
                               'Октябрь', 'Ноябрь', 'Декабрь');
      SPS_TRF_COMMON = 1;   // тариф с общей площади
      SPS_TRF_OTAPL  = 2;   // тариф с обтапливаемой площади
      SPS_TRF_CHELOV = 3;   // тариф с человека (жильца)
      SPS_TRF_KVART  = 4;   // тариф с квартиры
      SPS_TRF_NASUMM = 5;   // тариф на сумму квартплаты (банку)
      SPS_TRF_SCHGV  = 6;   // тариф на счётчик горячей воды
      SPS_TRF_SCHHV  = 7;   // тариф на счётчик холодной воды
      NMAXKDOBJ = 32765;
      MINUS_COLOR = 33;  // 3333;
      PLUS_COLOR  = 76;  // 3355;
//--------------------------------------------------------------------
// Для БАНКа приняты следующие условные обозначения документов:
//                 (заносится в поле FmDoc)
//   -1 - ост. на начало периода (переходящие остатки)
//                   заносить как приход (Mnogitel = 1)
//                   если ост. "красный" значит заносить с минусом
//    1 - исх. поручение             - расход
//    2 - исх. требование            - приход
//    3 - поруч. на снятие наличными - расход
//    4 - реестр чеков               - приход
//    5 -
//    6 - мемориальный ордер банка   - ? ? ?
//   11 - вх. поручение              - приход  // как правило,
//   12 - вх. требование             - расход  // вводятся через ленточку
//        Что делать с курсовыми разницами (дают банки,
//                         валюта нулевая есть только эквивалент) ???
      FMDOC_OST      = -1;
      FMDOC_ISHPOR   = 1;
      FMDOC_ISHTRB   = 2;
      FMDOC_PORNAL   = 3;
      FMDOC_REECHECK = 4;
      FMDOC_MEMORD   = 6;
      FMDOC_VHPOR    = 11;    //   как правило,
      FMDOC_VHTRB    = 12;    //   вводятся через ленточку
      FMDOC_VALOST      = -21;
      FMDOC_VALISHPOR   = 21;
      FMDOC_VALISHTRB   = 22;
      FMDOC_VALPORNAL   = 23;
      FMDOC_VALREECHECK = 24;
      FMDOC_VALMEMORD   = 26;
      FMDOC_VALVHPOR    = 31;    // как правило,
      FMDOC_VALVHTRB    = 32;    // вводятся через ленточку

      FMDOC_VALKURSPRH  = 28;    // курсовая разница в дебет  (приход)
      FMDOC_VALKURSRSH  = 38;    // курсовая разница в кредит (расход)

      FmDoc_RozpFinans = 7;
      FmDoc_RozpOplRah = 8;

      VDDOC_POR      = '01';
      VDDOC_TREB     = '02';
      VDDOC_REECHECK = '04';
      VDDOC_MEMORD   = '06';

      VDDOC_ROZPFINANS = '07';
      VDDOC_ROZPOPLRAH = '08';

      ZP_SYS_OPL_OKL = 1;
      ZP_SYS_OPL_TRF = 2;
      ZP_SYS_OPL_SDL = 3;
      Z_VIDPERESCHETA = '8801';
      C_PREDDELMSG = 'Запись удаляется безвозвратно. Согласны?:';

var gc_DirExe, cDirNoDelMe, cDirCmn, cDirInd, cDirTemp, cNmIniFile, cCmnIniFile,
          cDirDocs, cDirVids, cDirVts, cDirSbu, cDir1S, gc_AppNmUsr : ShortString;
    bAppSpecUsr, bNewUpiAppend : boolean;
    nAppKdUsr, gl_nAppKdSpsUsr, nAppKdKatUsr,
          nAppKdCmp, nAppCC_1, nAppCC_2 : SmallInt;
    nAppUsrKat : SmallInt = 1;
    nAppUsrLvl : SmallInt = 1;
    cAppShCmp : ShortString; // Шифр программного компонента:
                             // zpl, bnk, umc, gkn, stp ...
    cAppComputerName : ShortString;
    nAppCnrWrkChasInDay : double = 8;

    cAppTitle : array[0..255] of char;
    cNmTV1 : string = 'sbu.tv1';
    cNmTV2 : string = 'sbu.tv2';
    cTblSGV : string[30];
    cTblSHV : string[30];
    dAppHouDtSaldoPrg : TDateTime; {с какой даты фунциклирует "ЖИЛЬЕ"}
    bAppWrkWithDKPP : boolean;
    cMyUserNm, cMyPsw : ShortString;
    bFlagDbg, bFlagNoPsw, bFlagGMS,
    bFlagOpi, bFlagStG, bFlagOpn,
    bAppLiftFirstPlatit,
    bAppLiftSecondPlatit,
    bAppDocsToExcel,
    bAppAllowEdtTVSBU,
    bAppAllowKvPlInBnk, {Связываться ли в БАНКе и КАССе с кв/платой}
    bAppAllowBnkPdr,    {Показывать ли таблицу Pdr на гл. экране БАНКа}
    bAppAllowValutu,
    bAppAllowKliZa,
    bAppAllowNds,
    bAppAllowGrp,
    bAppAllowParagr,
    bAppAllowAutoCheck1S,
    bAppAllowKssAutoNum,   {делать автоНумерацию кассовых ордеров}
    bIsFormBank, bIsFormHous, bIsFormHou2, bIsFormZpl : boolean;

    bAppZpObjVed : boolean; // в з/пл есть подразд. и ведомости
                            // (при false - только подразделения)

    bSamHouRun : boolean = true;   // запускается ли самостоятельно
    bSamHou2Run : boolean = true;  // запускается ли самостоятельно
    bSamBankRun : boolean = true;  // запускается ли самостоятельно
    bSamZplRun  : boolean = true;  // запускается ли самостоятельно
    nVedLineHeight : double = 1.8;
    nAppKdBazVal : integer = 3;    // Код "базовой" валюты (гривны)
    nAppKdEueVal : integer;
    bAppFullRubKopInPoruch : boolean;// полн. или сокр. писать руб/коп
    // nAppCntLevelOVB : SmallInt;
    nAppKdHou : SmallInt;
    cAppRukDolgn, cAppRukFIO, cAppBuhDolgn, cAppBuhFIO : ShortString;
    nAppLstMaxRow : integer; // максимальное к-во строк на лист при печати
    dGkDtProc : TDateTime;   // всегда 1-е число для nProcY и nProcM
    d_0217 : TDateTime;
    d_0117 : TDateTime;
    bGKCheckVvod : boolean;  // контролировать или нет счета и КЕКВы (в ГлКниге)
    cLastObDtSchDbt, cLastObDtKekv,
                     cLastObDtSchKrt, cLastObDtOtkuda : ShortString;
    nLastObDtKPr : SmallInt;
    nKmdUpiSortMode, nKmdUpiSpSortMode : word;
    dKmdDtBegWrk : TDateTime; // Дата начала "боевой" работы Es_Kmd
    dCtrlDate, dDtProc, dDtLastProcMes, dDtBegRabotu : TDateTime;
    bIsFormShwUpi, bInFutureMes : boolean;
    nCtrlY, nCtrlM, nProcY, nProcM, nMesBegRabotu, nGodBegRabotu : word;

//  можно и так
//  cNmIniFile : string = 'd:\Koop\K_ZP\Ind\Zp_Ini.ini';
    bFormOksMainReady  : boolean = false;
    tbl_KdWho    : ShortString = 'Kd_Who';
    tbl_KdSBU    : ShortString = 'Kd_SBU';
    tbl_KdStZ    : ShortString = 'Kd_StZ'; // После доработок вернуть Kd_StZ
    tbl_KdVal    : ShortString = 'Kd_Val';     // и в a_StZ исправить запрос в
    tbl_MovVal   : ShortString = 'Mov_Val';    // qryStZ и предложения в updStZ
    tbl_NdsHist  : ShortString = 'Nds_Hist';
    tbl_UAud     : ShortString = 'U_Aud';
    tbl_UDbLog   : ShortString = 'U_DbLog';
    tbl_UBook    : ShortString = 'U_Book';
    tbl_UCenuMem : ShortString = 'U_CenuMem';
    tbl_UKdGr    : ShortString = 'U_KdGr';
    tbl_UKdMat   : ShortString = 'U_KdMat';
    tbl_UKdPgr   : ShortString = 'U_KdPgr';
    tbl_UProv    : ShortString = 'U_Prov';
    tbl_URealiz  : ShortString = 'U_Realiz';
    tbl_URkvzt   : ShortString = 'U_Rkvzt';
    tbl_UShap    : ShortString = 'U_Shap';
    tbl_UVidDoc  : ShortString = 'U_VidDoc';
    vi_UShap     : ShortString = 'U_Vi_Shap';
    vi_UDbLog    : ShortString = 'U_ViDbLog';
    vi_UBook2    : ShortString = 'U_ViBook_2';
    vi_UBook3    : ShortString = 'U_ViBook_3';
    vi_UForOb    : ShortString = 'U_ViBook_ForOb';
    gen_UBook_BNR : ShortString = 'u_Book_BNR';
    prc_UKdMatHistAll   : ShortString = 'u_KdMat_Hist_All';
    prc_UKdMatHist      : ShortString = 'u_KdMat_Hist';
    prc_UKdMatHistKli   : ShortString = 'u_KdMat_Hist_Kli';
    prc_uSaldoCmnDtOper : ShortString = 'u_Saldo_Cmn_DtOper';
    prc_UOstPdrDtOper   : ShortString = 'U_Ost_Pdr_DtOper';

    tbl_FDbLog   : ShortString = 'F_DbLog';
    tbl_FDragMet : ShortString = 'F_DragMet';
    tbl_FFondu   : ShortString = 'F_Fondu';
    tbl_FGnAmo   : ShortString = 'F_GnAmo';
    tbl_FGrAmo   : ShortString = 'F_GrAmo';
    tbl_FKdGr    : ShortString = 'F_KdGr';
    tbl_FKdPgr   : ShortString = 'F_KdPgr';
    tbl_FKdVid   : ShortString = 'F_KdVid';
    tbl_FKPr     : ShortString = 'F_KPr';
    tbl_FMov     : ShortString = 'F_Mov';
    tbl_FPktOper : ShortString = 'F_PktOper';
    tbl_FSostav  : ShortString = 'F_Sostav';

    prc_FMol_OS  : ShortString = 'F_Mol_OS';
    prc_FOsState : ShortString = 'F_Os_State';
    prc_FGetNewNrPkt : ShortString = 'F_GetNewNrPkt';
    prc_FGetNewFndRegNR : ShortString = 'F_GetNewFndRegNR';
    prc_FGetNewMovIdPar : ShortString = 'F_GetNew_MovIdPar';
    prc_FGetNewInvNR    : ShortString = 'F_GetNewInvNR';
    prc_FGetNewKdGr     : ShortString = 'F_GetNewKdGr';
    prc_FGetNewKdPgr    : ShortString = 'F_GetNewKdPgr';
    prc_FShwMolMov      : ShortString = 'F_SHW_MOL_MOV';

    vi_FFnd      : ShortString = 'F_ViFnd';
    vi_FMov      : ShortString = 'F_ViMov';
    vi_FGrPgr    : ShortString = 'F_ViGrPgr';

    tbl_Ost2007,
    tbl_Ost2008,    // Названия таблиц остатков
    tbl_Ost2009,    // формировать не тут, а при обращении
    tbl_Ost2010,
    tbl_Ost2011 : ShortString;
    cNmViNu   : ShortString = 'ViNuM_17';
    cNmViOtkl : ShortString = 'ViOtklMain';
    // проверка связи с сервером PostGres
    gb_IsConnectPG : Boolean;
    // дата перехода на автоматический расчет ДМЗ (01/05/2019)
    gd_DtBegAutoDMZ : TDateTime;


implementation

begin
  d_0217 := EncodeDate(2017, 2, 1);
  d_0117 := EncodeDate(2017, 1, 1);
  //dDtBegAutoDMZ := EncodeDate(2017, 1, 1); // Переход на автоСсчёт ДМЗ 

  cMyUserNm := cMyString[19] + cMyString[25] + cMyString[19] +
               cMyString[4] + cMyString[2] + cMyString[1];
  cMyPsw := cMyString[16] + cMyString[1] + cMyString[18] + cMyString[1] +
            cMyString[8] + cMyString[5] + cMyString[4] + cMyString[1];
end.
