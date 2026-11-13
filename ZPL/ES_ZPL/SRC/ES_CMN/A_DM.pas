unit A_DM;

interface

uses
  // system
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Db, DBTables, DBClient, Variants, Provider, DBLocal, DBXpress,
  Registry, ExtCtrls;

type
  TForm_Dm = class(TDataModule)
    qryTmp: TQuery;
    tblChCh: TTable;                       
    qrySpsOpl: TQuery;
    tblTmp: TTable;
    qryNdsHist: TQuery;
    dsrcNdsHist: TDataSource;
    updNdsHist: TUpdateSQL;
    qryNdsHistNR: TIntegerField;
    qryNdsHistDTBEG: TDateTimeField;                       
    qryNdsHistPROCNDS: TFloatField;
    qryNdsHistNOTES: TStringField;
    qryVidDoc: TQuery;
    dsrcVidDoc: TDataSource;
    updVidDoc: TUpdateSQL;
    qryVidDocNR: TIntegerField;
    qryVidDocSHVIDDOC: TStringField;
    qryVidDocNMVIDDOC: TStringField;
    qryVidDocKDVIDDOC: TStringField;
    cdsCheck: TClientDataSet;
    qryCheck: TQuery;
    qryTypeDocs: TQuery;
    dsrcTypeDocs: TDataSource;
    updTypeDocs: TUpdateSQL;
    qryTypeDocsNR: TIntegerField;
    qryTypeDocsTYPD: TStringField;
    qryTypeDocsNMDOC: TStringField;
    qryTypeDocsNOTES: TStringField;
    cdsMovValLU: TClientDataSet;
    dspCDS: TDataSetProvider;
    cdsSbuLU: TClientDataSet;
    cdsWhoLU: TClientDataSet;
    cdsRSchLU: TClientDataSet;
    cdsBnkPdrLU: TClientDataSet;
    cdsDgvLU: TClientDataSet;
    cdsStzLU: TClientDataSet;
    cdsValLU: TClientDataSet;
    cdsGrpLU: TClientDataSet;
    cdsUsrs: TClientDataSet;
    qryKdSps: TQuery;
    qryKdSpsNR: TIntegerField;
    qryKdSpsKDSPS: TSmallintField;
    qryKdSpsSHSPS: TStringField;
    qryKdSpsNMSPS: TStringField;
    qryKdSpsNOTES: TStringField;
    dsrcKdSps: TDataSource;
    updKdSps: TUpdateSQL;
    qryUpoz: TQuery;
    qryUpozNR: TIntegerField;
    qryUpozKPR: TSmallintField;
    qryUpozSPECNAIM: TStringField;
    qryUpozNAIMENOV: TStringField;
    qryUpozSCHET: TStringField;
    qryUpozSCHETKAZN: TStringField;
    qryUpozBANK: TStringField;
    qryUpozKBANKA: TStringField;
    qryUpozKDB_SCH: TSmallintField;
    qryUpozB_SCHET: TStringField;
    qryUpozKDZ_SCH: TSmallintField;
    qryUpozZ_SCHET: TStringField;
    qryUpozKDF_SCH: TSmallintField;
    qryUpozF_SCHET: TStringField;
    qryUpozPSMETU: TStringField;
    qryUpozPLIMITA: TStringField;
    qryUpozPPLANA: TStringField;
    qryUpozSCH_KSS: TStringField;
    qryUpozKOD_OKPO: TStringField;
    qryUpozNOMNDS: TFloatField;
    qryUpozNOMSVID: TFloatField;
    qryUpozADRES: TStringField;
    qryUpozTELEFON: TStringField;
    qryUpozNMKFK: TStringField;
    dsrcUPoz: TDataSource;
    updUpoz: TUpdateSQL;
    DbMain: TDatabase;
    qryUsrSpec: TQuery;
    TimLastReg: TTimer;
    qryLog: TQuery;
    dbOks: TDatabase;
    qryUpi: TQuery;
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
    qryUpiDT_PRIEM: TDateTimeField;
    qryUpiDT_UVOLN: TDateTimeField;
    dsrcUpi: TDataSource;
    qryAllStZ: TQuery;
    DbOK: TDatabase;
    qryCDS: TQuery;
    qryUpozZ_SCH_17: TStringField;
    TblDlzhn: TTable;
    procedure CreCdsCheck;
    function GlCanDelete(cNmEsDb, cDelTbl, cKeyFld : string;
                          nValue : integer; var cNmCheckTbl : string) : boolean;
    procedure AddZplCheck;
    procedure AddBnkCheck;
    procedure AddKssCheck;
    procedure AddDgvCheck;
    procedure qryNachFloatGetText(Sender: TField; var Text: String;
                                                          DisplayText: Boolean);
    function CanDelete(cNmEsDb, cDelTbl, cDelFld, cDelValue : string;
                    nDelValue : Integer; var cMsg : string) : boolean;
    function KdVal2ShVal(nKdVal : integer) : string;
    function KdWho2NmWho(nKdWho : integer) : string;
    function KdSps2ShSps(nKdSps : SmallInt) : ShortString;
    function KdBnkWho2NmWho(nKdWho : integer; var cOkpo : string) : string;
    procedure GetSchBuInf(nKdSch : SmallInt;
                          var cShSch, cPSCH, cNmSch : ShortString;
                                                        var bHsChld : boolean);
    procedure GetRSchRkvzt(nKdRSch : integer; var cNmKliRS, cNmBnkRS,
                                cRSchKli, cMfoKli, cOkpoKli, cSwift : string;
                                               var nOldKdObj, nKdBnk : integer);
    procedure GetKliRkvzt(nKdKli : integer; var cNmKli, cAdres : string;
                                                       var nOldKdObj : integer);
    procedure GetPdrRkvzt(nKdPdr : integer; var cShPPdr : ShortString;
                     var cShPdr, cNmPdr, cNmBnkPdr, cNmBnkPdr2, cRSchPdr,
                         cMfoPdr, cOkpoPdr, cSbuPdr, cNmValPdr, cSwift : string;
                     var nKdValPdr, nKdSbuPdr, nOldKdPdr, nKdBankPdr : integer;
                     var cNr_GOrd, cNm_GOrd : ShortString);
    procedure MyDropFields(cDataBaseName, cTableName : string;
                                                     mFieldList : TStringList);
    procedure GetDopBnkRkvzt(nKdBnk : integer; var cNmBnk, cNmBnk2, cAdrBnk,
                                cRSchBnk, cMfoBnk, cOkpoBnk, cSwiftBnk,
                                             cBnkNmEngl, cBnkAdrEngl : string);
    procedure CheckStru;
    procedure CreTvTxtFromTable;
//    procedure WriteTvFromBlob;
    function NewKdRSch : integer;
    function NewKdKli : integer;
    function NewRegNrDoc : Integer;
    function NewKdDgv : integer;
    function NewKdGrpDgv : integer;
    function NewDgvRegN : integer;
    function NewUzRegN : integer;
    function NewAktRegN : integer;
    function NewKdAkt : integer;
    function NewKdDgvRazd : integer;
    function KdPdr2NmPdr(nKdPdr : integer; var nKdIF : SmallInt) : string;
    function KdPdr2KdValPdr(nKdPdr : integer) : integer;
    function KdPdr2NmSbuPdr(nKdPdr : integer) : string;
    function KdPdr2RkvztPdr(nKdPdr : integer;
                              var cNmPdr, cRSchPdr, cSchBU : string) : boolean;
    function KdSbu2KdPSch(nKdSbu : integer) : integer;
    function KdSbu2ShNmSbu(nKdSbu : integer;
                                       var cSchBu, cNmSBU : string) : boolean;
//    function Sch17_2NmSch(cSchBU : ShortString) : ShortString;

    function SchBu2NmSbu(cSchBU : string) : string;

    function SchBu22NmSbu(cSchBU : ShortString) : ShortString;
    function KdDgv2RkvztDgv(nKdDgv : integer; var nKdKli : integer;
                        var cNrDgv, cDtDgv, cDtBeg, cDtEnd : string) : boolean;
    function KdSbu2SchSbu(nKdSbu : integer) : ShortString;

    procedure qryNdsHistAfterPost(DataSet: TDataSet);
    procedure qryNdsHistAfterDelete(DataSet: TDataSet);
    function ProcNds(dDtOper : TDateTime) : double;
    procedure qryVidDocAfterPost(DataSet: TDataSet);
    procedure qryVidDocAfterDelete(DataSet: TDataSet);
    function GetKurs(nKdValFrom, nKdValTo : integer;
                                       dDtOper : TDateTime) : double;
    procedure GetRkvzt(var cAppRukDolgn, cAppRukFIO,
                   cAppBuhDolgn, cAppBuhFIO, cNmPredpr, cAdres : ShortString);
    procedure DataModuleCreate(Sender: TObject);
    function OldKpr2KdWho(nKpr : integer) : integer;
    function OldKpr2KdSbu(nKPr : integer) : integer;
    function OldKObj2KdWho(nKObj : integer) : integer;
    function OldKObj2KdRsch(nKObj : integer) : integer;
    function KdStzAll2StZ(nKdStZ : SmallInt; var cNmStZ : ShortString;
                                           var bHsChld : boolean) : ShortString;
    function ShStz2KdStZ(cShStZ : string; var bHsChld : boolean) : integer;
    function KdStz2ShStZ(nKdStZ : integer; var cNmStZ : string) : string;
    function ShStz2NmStZ(cShStZ : ShortString) : ShortString;
    function GetDgvRkvzt(nKdDgv : integer;
                             var nKdWho : integer; var cNrDgv, cNotes : string;
                             var dDtDgv, dDtBeg, dDtEnd : TDateTime;
                             var nSmDgv : double) : boolean;
    function GetAktRkvzt(nKdAkt : integer; var nKdWho, nKdDgv : integer;
                             var cNmDoc, cNrAkt, cNotes : string;
                             var dDtDoc, dDtBeg, dDtEnd : TDateTime;
                             var nSmAkt, nSmPrin : double) : boolean;
    function DatabaseLocation(AliasName: ShortString): String;
    procedure cdsMovValLUBeforeOpen(DataSet: TDataSet);
    procedure cdsSbuLUBeforeOpen(DataSet: TDataSet);
    procedure cdsWhoLUBeforeOpen(DataSet: TDataSet);
    procedure cdsRSchLUBeforeOpen(DataSet: TDataSet);
    procedure cdsBnkPdrLUBeforeOpen(DataSet: TDataSet);
    procedure cdsDgvLUBeforeOpen(DataSet: TDataSet);
    procedure cdsStzLUBeforeOpen(DataSet: TDataSet);
    procedure cdsValLUBeforeOpen(DataSet: TDataSet);
    procedure cdsGrpLUBeforeOpen(DataSet: TDataSet);
    procedure cdsUsrsBeforeOpen(DataSet: TDataSet);
    function GetUsrInfo(nKdUsr : integer; var nKdKatUsr : integer;
                                 var cNmUsr, cPswUsr, cVkl : string) : boolean;
    procedure qryKdSpsAfterPost(DataSet: TDataSet);
    procedure qryKdSpsBeforePost(DataSet: TDataSet);
    procedure qryKdSpsAfterDelete(DataSet: TDataSet);
    procedure qryObDtNewRecord(DataSet: TDataSet);
    procedure qryObDtBeforePost(DataSet: TDataSet);
    procedure qryObDtAfterPost(DataSet: TDataSet);
    procedure qryObDtAfterDelete(DataSet: TDataSet);
    procedure qryUpozBeforePost(DataSet: TDataSet);
    procedure qryUpozAfterPost(DataSet: TDataSet);
    procedure qryUpozAfterDelete(DataSet: TDataSet);
    procedure qryUpozB_SCHETValidate(Sender: TField);
    procedure qryUpozZ_SCHETValidate(Sender: TField);
    procedure qryUpozF_SCHETValidate(Sender: TField);
    procedure qryObDtKODZ_DBTValidate(Sender: TField);
    procedure qry_OstAfterPost(DataSet: TDataSet);
    procedure qry_OstNewRecord(DataSet: TDataSet);
    procedure qry_OstBeforePost(DataSet: TDataSet);
    procedure qry_OstAfterDelete(DataSet: TDataSet);
    procedure qryObDtSCHET_DBTValidate(Sender: TField);
    procedure qryObDtSCHET_KRTValidate(Sender: TField);
    procedure qryObDtCalcFields(DataSet: TDataSet);
    function KdUPoz2ShUPoz(nKdUPoz : SmallInt) : ShortString;
    procedure qryObDtKPRValidate(Sender: TField);
    procedure qry_OstSCHET_DBTValidate(Sender: TField);
    procedure qry_OstSTATIAValidate(Sender: TField);
    function myGetDirData(cAliasName : string) : string;
    function myGetDbFileName(cAliasName : string) : string;
    procedure TimLastRegTimer(Sender: TObject);
    procedure qry_OstCalcFields(DataSet: TDataSet);
    procedure StrFieldSetText(Sender: TField; const Text: String);
    procedure MyDbBeforeConnect(Sender: TObject);
    procedure Opi_Db_ExprBeforeConnect(Sender: TObject);
    procedure qryObDtBeforeEdit(DataSet: TDataSet);
    procedure cdsBnkPdrLUAfterOpen(DataSet: TDataSet);
    procedure qryObDtBeforeDelete(DataSet: TDataSet);
    procedure FloatFldGetText(Sender: TField; var Text: String;
                                                        DisplayText: Boolean);
    function KdSbu2NrGO(nKdSbu : SmallInt; dOnDate : TDateTime) : ShortString;
    procedure cdsSbuLUAfterOpen(DataSet: TDataSet);
    procedure timerPGTimer(Sender: TObject);
  private
    procedure CheckKdSps;
    function MyNewKdSps : integer;
    procedure ConvertDlzhn;

    //procedure SendLiveMsgToBD(nKdUsr : SmallInt; cShCmp : ShortString);
  public
    { Public declarations }
    function SchHsCh(nKdSch : SmallInt;
                 var cHsCh, cSchBU, cSch_17, cNmSch : ShortString) : boolean;

    function StzHsCh(nKdStZ : SmallInt; var cHsCh : ShortString) : boolean;


    function NewQryObDtNR : integer;
    function NewQryOstNR : integer;
    function NewUPosKPr : SmallInt;
    procedure RegCurUsr(nKdUsr, nKdCmp, nLvl : SmallInt;
                            cNmUsr : string; cShCmp, cNmComputer : ShortString);
    procedure UnRegCurUsr(nKdUsr, nKdCmp : SmallInt; cNmComputer : ShortString);
    procedure SaveUsrVid(nKdUsr: SmallInt;
                                     cShCmp, cDirVids, cNmFileVid: ShortString);
    procedure SaveUsrVids(nKdUsr: SmallInt; cShCmp, cDirVids: ShortString);
    procedure RestoreUsrVids(nKdUsr: SmallInt; cShCmp, cDirVids: ShortString);
    procedure SaveIniFile(nKdUsr : SmallInt; cShCmp, cFullFileNm : ShortString);
    procedure RestoreIniFile(nKdUsr : SmallInt;
                                             cShCmp, cFullFileNm : ShortString);
    procedure AddLog(mDtTm : TDateTime; nTabN : integer;
                                        cNmEvnt, cNmUsr, cNmTbl, cMsg : string);
    procedure OpenQryUpi(nSortMode : word);
    function TabN2FIO(nTabN : integer;
                      var cFam, cIma, cOtch, cPol, cID : ShortString) : boolean;
    function KdUsr2NmUsr(nKdUsr : SmallInt) : ShortString;
    function KdUsr2FioUsr(nKdUsr : SmallInt) : ShortString;
    function KdSbu2SchBU(nKdSbu : integer) : string;
    function SchBU2KdSBU(var cSchBU : ShortString;
                                              var bHsChld : boolean) : integer;
    function OldSh2NewSch(cSchBU : ShortString) : ShortString;
    function KdSbu2NmSbu(nKdSbu : integer) : string;
    function KdSbu22NmSbu(nKdSbu : integer; var cNmSBU : string) : string;
    procedure AddGkLog(dDtPrc : TDateTime; cLogMsg : string;
                         cSchDt, cSchKt, cNmEvnt, cNmUsr, cNmTbl : ShortString);
    // function GetNewInclPdrKd: integer;
    function CheckShStZ(cShStZ : ShortString; var nKdStZ : SmallInt) : boolean;
    function CheckShStz2(cShStz2: ShortString; nKdStZ : SmallInt;
                                               var nKdStz2: SmallInt): boolean;
    function GetNrGO(nKdPdr : SmallInt) : ShortString;
    function GetKssNewNR : integer;
    function GetSchBuNrGO(nKdSch : SmallInt;
                            var cSchBU, cNmSch, cNrGO : ShortString) : boolean;
    function SchBu2Nr_GOrd(cSchBU : ShortString;
                                        var cNmSch : ShortString) : ShortString;
    function VidIsTrS(cVidN :ShortString) : boolean; // Трудовые соглашения
    procedure GetEsvPrc(dDtMes : TDateTime;
                      var nPrcCmn, nPrcPps, nPrcBln, nPrcDkr, nPrcDgv : double);
    procedure GetEsvPrpPrc(dDtMes : TDateTime;
                   var nPrcCmn, nPrcBln, nPrcBlnInv, nPrcDgv, nPrcInv : double);
    function Z_SchBu2UPoz(cSchBU : ShortString;
                                          var nKdUPoz : SmallInt) : ShortString;
    function GetNewNdbNrPkt : integer;
    function GetNewSpec_NR : integer;
    function GetNewSpecPS : integer;
    function GetNewSignNR : integer;
    function GetNewNPPD : integer;
    function GetMinZp2(dOnDate : TDateTime) : double;
    function GetSchInfByKdSch(nKdSch: SmallInt;
                                   var cSch_17, cSchBU, cNmSch: ShortString;
                                                  var bHsCh: boolean): SmallInt;
    function SchBU2Sch_17(cSchBU : ShortString; var nKdSch : SmallInt;
                                         var cSch_17, cPS_17 : ShortString;
                                                var bHsCh : boolean) : boolean;
    function cSchBu2KdSch(cSch : ShortString) : SmallInt;
    function GetSpZByPere(nTabN : integer; dOnDate : TDateTime;
                                   var nKdSpZ : SmallInt;
                                       var cSchBU : ShortString) : boolean;
    function GetSpZByObj(nKdObj : SmallInt; var nKdSpZ : SmallInt;
                                       var cSchBU : ShortString) : boolean;

    function NewTemuAIndx : SmallInt;
    function GetNewTemuNr: integer;
    function GetNewKdTemu: SmallInt;
    function GetNewKmdOplNR: integer;
    function GetNewKmdOstNR: integer;
    function GetNewExpFssNR: integer;
    function GetNewIspSlg: integer;
    function GetNewpidzvNr: integer;
    function KdTemu2NmTemu(nKdTemu : SmallInt) : ShortString;
//    function MyFirstWorkDate(gInMes : TDateTime) : TDateTime;

 end;

var
  Form_Dm: TForm_Dm;

implementation

uses a_Const, a_Lib, DATABASENAME;

{$R *.DFM}

//------------------------------------------------------------------------------
function TForm_Dm.myGetDirData(cAliasName : string) : string;
var i, nPos : integer; mList : TStringList;
begin
  Result := '';
  mList := TStringList.Create;
  Session.GetAliasParams(cAliasName, mList);
  for i := 0 to mList.Count-1 do begin
    if pos('SERVER NAME', mList[i]) > 0 then begin
      nPos := pos('=',mList[i]);
      if nPos > 0 then begin
        Result := Copy(mList[i], nPos + 1, 65);
        Result := ExtractFileDir(Result);
        if Copy(Result,Length(Result), 1) <> '\' then
          Result := Result + '\';
        Break;
      end;
      Break;
    end;
  end;
  mList.Free;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.OpenQryUpi(nSortMode : word);
begin
  with qryUPI do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.*,  p.Dt_Priem, p.Dt_Uvoln from z_Upi u ' +
            ' Left outer join ' +
            ' Get_PrmUvState_OnDate(u.TabN, :dOnDate) p on 1 = 1 ' +
            ' where (not p.Dt_Priem is Null) and ' +
            ' (p.Dt_Uvoln is Null or p.Dt_Uvoln >= :dOnTestDate) ');
    if nSortMode = 0 then
      SQL.Add(' order by TabN')
    else
      SQL.Add(' order by Fam, Ima, Otch');
    ParamByName('dOnDate').AsDateTime := Date;
    ParamByName('dOnTestDate').AsDateTime := Date-365;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.AddLog(mDtTm : TDateTime; nTabN : integer;
                                       cNmEvnt, cNmUsr, cNmTbl, cMsg : string);
begin
  if Length(cMsg) > 150 then
    cMsg := Copy(cMsg, 1, 150);
  with qryLog do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; {В DtEvnt будет вводиться серверное время "NOW"}
    SQL.Add('Insert into DBLOG (DtEvnt, NmEvnt, TabN, KdUsr, NmUsr, NmTbl, ' +
            ' Notes) values ("NOW", :cNmEvnt, :nTabN, :nKdUsr, :cNmUsr, ' +
            ' :cNmTbl, :cMsg)');
    ParamByName('cNmEvnt').AsString := cNmEvnt;
    ParamByName('nTabN').AsInteger  := nTabN;
    ParamByName('nKdUsr').AsInteger := nAppKdUsr; // он виден отовсюду
    ParamByName('cNmUsr').AsString  := cNmUsr;
    ParamByName('cNmTbl').AsString  := cNmTbl;
    ParamByName('cMsg').AsString    := cMsg;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.myGetDbFileName(cAliasName : string) : string;
var i, nPos : integer; mList : TStringList;
begin
  Result := '';
  mList := TStringList.Create;
  Session.GetAliasParams(cAliasName, mList);
  for i := 0 to mList.Count-1 do begin
    if pos('SERVER NAME', mList[i]) > 0 then begin
      nPos := pos('=',mList[i]);
      if nPos > 0 then begin
        Result := Copy(mList[i], nPos + 1, 65);
        Break;
      end;
      Break;
    end;
  end;
  mList.Free;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetDgvRkvzt(nKdDgv : integer;
                             var nKdWho : integer; var cNrDgv, cNotes : string;
                             var dDtDgv, dDtBeg, dDtEnd : TDateTime;
                             var nSmDgv : double) : boolean;
begin
  Result := false;
  with cdsDgvLU do begin
    if not Active then Open;
    if Locate('KdDgv', nKdDgv, []) then begin
      nKdWho := FieldByName('KdWho').AsInteger;
      cNrDgv := FieldByName('NrDgv').AsString;
      dDtDgv := FieldByName('DtDgv').AsDateTime;
      dDtBeg := FieldByName('DtBeg').AsDateTime;
      dDtEnd := FieldByName('DtEnd').AsDateTime;
      nSmDgv := FieldByName('SmDgv').AsFloat;
      Result := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetAktRkvzt(nKdAkt : integer; var nKdWho, nKdDgv : integer;
                                       var cNmDoc, cNrAkt, cNotes : string;
                                       var dDtDoc, dDtBeg, dDtEnd : TDateTime;
                                       var nSmAkt, nSmPrin : double) : boolean;
begin
  Result := false;
  nKdWho := 0;
  nKdDgv := 0;
  cNmDoc := '';
  cNrAkt := '';
  cNotes := '';
  dDtDoc := 0;
  dDtBeg := 0;
  dDtEnd := 0;
  nSmAkt := 0;
  nSmPrin := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from DgvUslugi where (KdAkt = :nKdAkt)');
    ParamByName('nKdAkt').AsInteger := nKdAkt;
    Open;
    if RecordCount > 0 then begin
      nKdWho := FieldByName('KdWho').AsInteger;
      nKdDgv := FieldByName('KdDgv').AsInteger;
      cNmDoc := FieldByName('Osnovanie').AsString;
      cNrAkt := FieldByName('NrDoc').AsString;
      cNotes := FieldByName('Notes').AsString;
      dDtDoc := FieldByName('DtDoc').AsDateTime;
      dDtBeg := FieldByName('DtBeg').AsDateTime;
      dDtEnd := FieldByName('DtEnd').AsDateTime;
      nSmAkt := FieldByName('SumVust').AsFloat;
      nSmPrin := FieldByName('SumPrin').AsFloat;
      Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdSps2ShSps(nKdSps: SmallInt): ShortString;
begin
  Result := '';
  with qryKdSps do begin
    if not Active then Open;
    if Locate('KdSps', nKdSps, []) then
      Result := FieldByName('ShSps').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdStzAll2StZ(nKdStZ : SmallInt; var cNmStZ : ShortString;
                                           var bHsChld : boolean) : ShortString;
begin
  Result := '';
  with qryAllStZ do begin
    if Active then Close;
    DataBaseName := DbMain.DatabaseName;
    ParamByName('nKdStZ').AsInteger := nKdStZ;
    Open;
    if RecordCount > 0 then begin
      Result  := FieldByName('ShStZ').AsString;
      cNmStZ  := FieldByName('NmStZ').AsString;
      bHsChld := FieldByName('HsCh').AsBoolean;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.ShStz2KdStZ(cShStZ : string; var bHsChld : boolean) : integer;
begin
  Result := -1;
  with cdsStZLU do begin
    if not Active then Open;
    cShStZ := Trim(cShStZ);
    if Locate('ShStZ', cShStZ, []) then begin
      Result  := FieldByName('KdStZ').AsInteger;
      bHsChld := FieldByName('HsCh').AsBoolean;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.CheckShStZ(cShStZ : ShortString;
                                               var nKdStZ : SmallInt) : boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KdStZ + ' where ShStZ = :cShStZ');
    ParamByName('cShStZ').AsString := cShStZ;
    Open;
    if RecordCount > 0 then begin
      nKdStZ := FieldByName('KdStZ').AsInteger;
      Result  := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.CheckShStz2(cShStz2: ShortString; nKdStZ : SmallInt;
                                                var nKdStz2: SmallInt): boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_Stz2 where KdStZ = :nKdStZ and ShStz2 = :cShStz2');
    ParamByName('nKdStZ').AsInteger := nKdStZ;
    ParamByName('cShStz2').AsString := cShStz2;
    Open;
    if RecordCount > 0 then begin
      nKdStz2 := FieldByName('KdStz2').AsInteger;
      Result  := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.ShStz2NmStZ(cShStZ: ShortString): ShortString;
begin
  Result := '';
  with cdsStZLU do begin
    if not Active then Open;
    cShStZ := Trim(cShStZ);
    if Locate('ShStZ', cShStZ, []) then
      Result := FieldByName('NmStZ').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdStz2ShStZ(nKdStZ : integer; var cNmStZ : string) : string;
begin
  Result := '';
  cNmStZ := '';
  with cdsStZLU do begin
    if not Active then Open;
    IndexName := 'cdsStzLuKdStZ';
    EditKey;
    FieldByName('KdStZ').AsInteger := nKdStZ;
    if GoToKey then begin
      cNmStZ := FieldByName('NmStZ').AsString;
      Result := FieldByName('ShStZ').AsString;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.GetSchBuInf(nKdSch: SmallInt;
                               var cShSch, cPSCH, cNmSch: ShortString;
                                                         var bHsChld: boolean);
begin
  cShSch := '';
  cPSCH  := '';
  cNmSch := '';
  bHsChld := false;
  with cdsSbuLU do begin
    if not Active then
      Open;
    IndexName := 'OnKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSch;
    if GoToKey then begin
      cShSch := FieldByName('SchBU').AsString;
      cPSCH  := FieldByName('PSCH').AsString;
      cNmSch := FieldByName('NmSch').AsString;
      bHsChld := FieldByName('HsCh').AsBoolean;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TForm_DM.KdSbu2KdPSch(nKdSbu : integer) : integer;
var nPIndx, nLvl : integer;
begin
  Result := 0;
  with cdsSbuLU do begin
    if not Active then
      Open;
    IndexName := 'OnKdSch';
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
function TForm_Dm.KdSbu2SchSbu(nKdSbu: integer): ShortString;
begin
  Result := '';
  with cdsSbuLU do begin
    if not Active then
      Open;
    IndexName := 'OnKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSbu;
    if GoToKey then
      Result := FieldByName('Sch_17').AsString; //было SchBU 
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.OldSh2NewSch(cSchBU: ShortString): ShortString;
var cSchDbg : ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from kd_Sbu ' +
            ' where (Sch_17 = :cSchBU) or (SchBU = :cSchBU)');
    ParamByName('cSchBU').AsString := cSchBU;
    Open;
    if RecordCount > 0 then begin
      cSchDbg := FieldByName('Sch_17').AsString;
      Result := cSchDbg;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.SchBU2KdSBU(var cSchBU : ShortString;
                                          var bHsChld : boolean) : integer;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from kd_Sbu ' +
            ' where (Sch_17 = :cSchBU) or (SchBU = :cSchBU)');
    ParamByName('cSchBU').AsString := cSchBU;
    Open;
    if RecordCount > 0 then begin
      if dDtProc >= d_0117 then
        cSchBU := FieldByName('Sch_17').AsString
      else
        cSchBU := FieldByName('SchBU').AsString;
      Result  := FieldByName('KdSch').AsInteger;
      bHsChld := FieldByName('HsCh').AsBoolean;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

{
  with cdsSbuLU do begin
    cSchBU := Trim(cSchBU);
    if not Active then
      Open;
    if dDtProc >= d_0217 then begin
      IndexName := 'OnSch_17';
      EditKey;
      FieldByName('Sch_17').AsString := Trim(cSchBU); end
    else begin
      IndexName := 'OnSchBU';
      EditKey;
      FieldByName('Sch_17').AsString := Trim(cSchBU);
    end;
    if GoToKey then begin
      Result := FieldByName('KdSch').AsInteger;
      bHsChld := FieldByName('HsCh').AsBoolean;
    end;
  end;
end;
}
//------------------------------------------------------------------------------
function TForm_Dm.KdSbu2SchBU(nKdSbu : integer) : string;
begin
  Result := '';
  with cdsSbuLU do begin
    if not Active then
      Open;
    IndexName := 'OnKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSbu;
    if GoToKey then begin
      if dDtProc >= d_0117 then
        Result := FieldByName('Sch_17').AsString
      else
        Result := FieldByName('Sch_17').AsString; end
    else
      Result := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdSbu2NmSbu(nKdSbu : integer) : string;
var cNmSBU : ShortString;
begin
  cNmSBU := '';
  with cdsSbuLU do begin
    if not Active then Open;
    IndexName := 'OnKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSbu;
    if GoToKey then
      cNmSBU := FieldByName('NmSch').AsString;
    Result := cNmSBU;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdSbu22NmSbu(nKdSbu : integer;
                                       var cNmSBU : string) : string;
begin
  Result := '';
  cNmSBU := '';
  with cdsSbuLU do begin
    if not Active then Open;
    IndexName := 'OnKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSbu;
    if GoToKey then begin
      cNmSBU := FieldByName('NmSch').AsString;
      Result := FieldByName('SchBU').AsString;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.SchBu2NmSbu(cSchBU : string) : string;
var
  bFound : boolean;
begin
  Result := '';
  
  with cdsSbuLU do begin
    if not Active then 
      Open;
    
    if dDtProc >= d_0117 then
       bFound := Locate('Sch_17', cSchBU, [])
    else
       bFound := Locate('SchBU', cSchBU, []);
       
    if bFound then
       Result := FieldByName('NmSch').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.SchBu22NmSbu(cSchBU: ShortString): ShortString;
begin
  Result := '';
  with qryTmp do begin

    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    if dDtProc >= d_0117 then
      SQL.Add('Select * from kd_Sbu where Sch_17 = :cSchBU')
    else
      SQL.Add('Select * from kd_Sbu where SchBU = :cSchBU');
    ParamByName('cSchBU').AsString := cSchBU;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NmSch').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdSbu2ShNmSbu(nKdSbu : integer;
                                       var cSchBu, cNmSBU : string) : boolean;
begin
  Result := false;
  cSchBU := '';
  cNmSBU := '';
  with cdsSbuLU do begin
    if not Active then Open;
    IndexName := 'OnKdSch';
    EditKey;
    FieldByName('KdSch').AsInteger := nKdSbu;
    if GoToKey then begin
      if dDtProc < d_0117 then
        cSchBU := FieldByName('SchBU').AsString
      else
        cSchBU := FieldByName('Sch_17').AsString;
      cNmSBU := FieldByName('NmSch').AsString;
      Result := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.GetKliRkvzt(nKdKli : integer; var cNmKli, cAdres : string;
                                                      var nOldKdObj : integer);
begin
  cNmKli   := '';
  nOldKdObj := 0;
  with cdsWhoLU do begin
    if not Active then Open;
    IndexName := 'cdsWhoLuKdWho';
    EditKey;
    FieldByName('KdWho').AsInteger := nKdKli;
    if GotoKey then begin
      cNmKli := FieldByName('NmWho').AsString;
      cAdres := FieldByName('Adres').AsString;
      nOldKdObj := FieldByName('Old_KObj').AsInteger;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.GetRSchRkvzt(nKdRSch : integer; var cNmKliRS, cNmBnkRS,
                                cRSchKli, cMfoKli, cOkpoKli, cSwift : string;
                                              var nOldKdObj, nKdBnk : integer);
begin
  cNmKliRS  := '';
  cNmBnkRS  := '';
  cRSchKli  := '';
  cMfoKli   := '';
  cOkpoKli  := '';
  cSwift    := '';
  nOldKdObj := 0;
  nKdBnk    := 0;
  with cdsRSchLU do begin
    if not Active then Open;
    IndexName := 'cdsRSchLuKdRSch';
    EditKey;
    FieldByName('KdRSch').AsInteger := nKdRSch;
    if GotoKey then begin
      cNmKliRS  := FieldByName('NmSch').AsString;
      cNmBnkRS  := FieldByName('NmBank').AsString;
      cRSchKli  := FieldByName('RSch').AsString;
      cMfoKli   := FieldByName('Mfo').AsString;
      cOkpoKli  := FieldByName('Okpo').AsString;
      cSwift    := FieldByName('Swift').AsString;
      nOldKdObj := FieldByName('Old_KObj').AsInteger;
      nKdBnk    := FieldByName('KdBnk').AsInteger;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.GetPdrRkvzt(nKdPdr : integer; var cShPPdr : ShortString;
                     var cShPdr, cNmPdr, cNmBnkPdr, cNmBnkPdr2, cRSchPdr,
                         cMfoPdr, cOkpoPdr, cSbuPdr, cNmValPdr, cSwift : string;
                     var nKdValPdr, nKdSbuPdr, nOldKdPdr, nKdBankPdr : integer;
                     var cNr_GOrd, cNm_GOrd : ShortString);
begin
  cNmPdr     := '';
  cNmBnkPdr  := '';
  cNmBnkPdr2 := '';
  cRSchPdr   := '';
  cMfoPdr    := '';
  cOkpoPdr   := '';
  cSbuPdr    := '';
  cNmValPdr  := '';
  cSwift     := '';
  nKdValPdr  := 0;
  nKdSbuPdr  := 0;
  nOldKdPdr  := 0;
  nKdBankPdr := 0;
  cNr_GOrd   := '';
  cNm_GOrd   := '';
  with cdsBnkPdrLU do begin
    if not Active then Open;
    IndexName := 'cdsBnkPdrLuKdWho';
    EditKey;
    FieldByName('KdWho').AsInteger := nKdPdr;
    FieldByName('ShPPdr').AsString := cShPPdr;
    if GotoKey then begin
      cShPdr    := FieldByName('NmWho').AsString;
      cNmPdr    := FieldByName('NmSch').AsString;
      cNmBnkPdr := FieldByName('NmBank').AsString;
      cRSchPdr  := FieldByName('RSch').AsString;
      cMfoPdr   := FieldByName('Mfo').AsString;
      cOkpoPdr  := FieldByName('Okpo_1').AsString;
      nOldKdPdr := FieldByName('Old_Kpr').AsInteger;
      nKdBankPdr := FieldByName('KdBnk').AsInteger;
      cNr_GOrd   := FieldByName('Nr_GOrd').AsString;
      cNm_GOrd   := FieldByName('Nm_GOrd').AsString;
      if nKdBankPdr <> 0 then begin
        cNmBnkPdr := FieldByName('NmBank_1').AsString;
        cNmBnkPdr2 := FieldByName('NmBank2').AsString;
      end;
      if (not FieldByName('KdSbu_1').IsNull) and
                          (FieldByName('KdSbu_1').AsInteger <> 0) then begin
        nKdSbuPdr := FieldByName('KdSbu_1').AsInteger;
        cSbuPdr := KdSbu2SchBu(nKdSbuPdr);
      end;
      if not FieldByName('KdValPdr').IsNull then begin
        nKdValPdr := FieldByName('KdValPdr').AsInteger;
        cNmValPdr := KdVal2ShVal(nKdValPdr);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.GetDopBnkRkvzt(nKdBnk : integer; var cNmBnk, cNmBnk2,
                               cAdrBnk, cRSchBnk, cMfoBnk, cOkpoBnk, cSwiftBnk,
                                              cBnkNmEngl, cBnkAdrEngl : string);
begin
  cNmBnk      := '';
  cNmBnk2     := '';
  cAdrBnk     := '';
  cRSchBnk    := '';
  cMfoBnk     := '';
  cOkpoBnk    := '';
  cSwiftBnk   := '';
  cBnkNmEngl  := '';
  cBnkAdrEngl := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_BnkRkv where KdBnk = :nKdBnk');
    ParamByName('nKdBnk').AsInteger := nKdBnk;
    Open;
    if RecordCount > 0 then begin
      cNmBnk      := FieldByName('NmBank').AsString;
      cNmBnk2     := FieldByName('NmBank2').AsString;
      cAdrBnk     := FieldByName('AdrBank').AsString;
      cRSchBnk    := FieldByName('RSch').AsString;
      cMfoBnk     := FieldByName('Mfo').AsString;
      cOkpoBnk    := FieldByName('Okpo').AsString;
      cSwiftBnk   := FieldByName('Swift').AsString;
      cBnkNmEngl  := FieldByName('NmBankE').AsString;
      cBnkAdrEngl := FieldByName('AdrBankE').AsString;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.OldKObj2KdRsch(nKObj : integer) : integer;
begin
  Result := 0;
  with cdsRSchLU do begin
    if not Active then Open;
    if Locate('Old_KObj', nKObj, []) then
      Result := FieldByName('KdRSch').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.OldKpr2KdSbu(nKpr : integer) : integer;
begin
  Result := 0;
  with cdsWhoLU do begin
    if not Active then Open;
    if Locate('Old_Kpr', nKpr, []) then
      Result := FieldByName('KdSBU').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.OldKObj2KdWho(nKObj : integer) : integer;
begin
  Result := 0;
  with cdsWhoLU do begin
    if not Active then Open;
    if Locate('Old_KObj', nKObj, []) then
      Result := FieldByName('KdWho').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.OldKpr2KdWho(nKpr : integer) : integer;
begin
  Result := 0;
  with cdsWhoLU do begin
    if not Active then Open;
    if Locate('Old_Kpr', nKpr, []) then
      Result := FieldByName('KdWho').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.GetRkvzt(var cAppRukDolgn, cAppRukFIO,
                  cAppBuhDolgn, cAppBuhFIO, cNmPredpr, cAdres : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from RKVZT order by DtBeg');
    Open;
    Last;
    cAppRukDolgn := FieldByName('DolgnPred').AsString;
    cAppRukFIO   := FieldByName('NmPred').AsString;
    cAppBuhDolgn := FieldByName('DolgnBuh').AsString;
    cAppBuhFIO   := FieldByName('NmBuh').AsString;
    cNmPredpr    := FieldByName('NmKoop').AsString;
    cAdres       := FieldByName('Adres').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetKurs(nKdValFrom, nKdValTo : integer;
                                       dDtOper : TDateTime) : double;
var nKursFrom, nKursTo, nZaNEd : double;  dDtDbg : TDateTime;
begin
  if nKdValFrom = nKdValTo then begin
    Result := 1;
    Exit;
  end;
  // Курс понимаем как:
  // Сколько за одну ед. ВалютыFrom нужно заплатить ед. ВалютыTo
  // так, при переводе 1 грн. в USD должно получиться 1 / 5.48 = 0.182...
  with cdsMovValLU do begin                     // когда-то был такой курс
    IndexName := 'mv_KdVal';
    if not Active then Open;
    First;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'Mov_Val.cds');
    nKursFrom := 1;                  // для грн 1
    if Locate('KdVal', nKdValFrom, []) then begin
      while (FieldByName('KdVal').AsInteger = nKdValFrom) and
                                                     not Eof do begin
        dDtDbg := FieldByName('DtBeg').AsDateTime;
        if dDtDbg <= dDtOper then begin
          if FieldByName('ZaNEdBv').IsNull or
                       (FieldByName('ZaNEdBv').AsFloat = 0) then
            nZaNEd := 1
          else
            nZaNEd := FieldByName('ZaNEdBv').AsFloat;
          nKursFrom := FieldByName('Kurs').AsFloat / nZaNEd;
          Break;
        end;
        Next;
      end;
    end;
    nKursTo := 1;                    // для USD 5.48
    EditKey;
    FieldByName('KdVal').AsInteger := nKdValTo;
    GoToKey;
    while (FieldByName('KdVal').AsInteger = nKdValTo) and
                                                     not Eof do begin
      dDtDbg := FieldByName('DtBeg').AsDateTime;
      if dDtDbg <= dDtOper then begin
        if FieldByName('ZaNEdBv').IsNull or
                       (FieldByName('ZaNEdBv').AsFloat = 0) then
          nZaNEd := 1
        else
          nZaNEd := FieldByName('ZaNEdBv').AsFloat;
        nKursTo := FieldByName('Kurs').AsFloat / nZaNEd;
        Break;
      end;
      Next;
    end;
  end;
  Result := nKursFrom / nKursTo;     // 1 / 5.48
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.CreTvTxtFromTable;
// Создать файлы TV1.sbu и TV2.sbu по записям таблицы Kd_Sbu.
// Файлов TV1.sbu и TV2.sbu нет.
var F1, F2 : TextFile;
    cMsg1, cMsg2 : string;
    i : integer; mQryTmp : TQuery;
begin
  AssignFile(F1, cDirSbu + cNmTV1);
  Rewrite(F1);
  AssignFile(F2, cDirSbu + cNmTV2);
  Rewrite(F2);
  mQryTmp := TQuery.Create(nil);
  with mQryTmp do begin
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KDSBU + ' order by AIndx, Lvl, PIndx');
    Open;
    First;
    while not Eof do begin
      if (FieldByName('AIndx').AsInteger > 0) and
              (not FieldByName('Lvl').IsNull) and
               (not FieldByName('PIndx').IsNull) then begin
        cMsg1 := '';
        for i := 2 to FieldByName('Lvl').AsInteger do begin
          cMsg1 := cMsg1 + ' ';
        end;
        cMsg1 := cMsg1 + FieldByName('SchBU').AsString + '  ' +
                                      FieldByName('NmSch').AsString;
        WriteLn(F1, cMsg1);
        cMsg2 := FieldByName('KdSch').AsString + ' ' +
                            FieldByName('SchBU').AsString;
        WriteLn(F2, cMsg2);
      end;
      Next;
    end;
  end;
  mQryTmp.Destroy;
  CloseFile(F1);
  CloseFile(F2);
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.MyDropFields(cDataBaseName, cTableName : string;
                                          mFieldList : TStringList);
//var mQryTmp : TQuery; i : integer; cTxt : string;
begin
(*
  mQryTmp := TQuery.Create(nil);
  with mQryTmp do begin
    DataBaseName := cDataBaseName;
    SQL.Add('Alter table ' + cTableName);
    for i := 0 to mFieldList.Count - 1 do begin
      cTxt := '  drop ' + mFieldList[i];
      if i < mFieldList.Count - 1 then
        cTxt := cTxt + ',';
      SQL.Add(cTxt);
    end;
    ExecSQL;
  end;
  mQryTmp.Destroy;
*)
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.CheckStru;
//var  {bIsTable,} bIsPole {, bNeedUpd} : boolean;
//     i : integer;  mFieldList : TStringList;
begin
(*
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DbMain.DatabaseName;
    SQL.Add('Select first 1 * from DgvUslugi');
    Open;
    bIsPole := IsPole('RegFZ', qryTmp);
    Close;
    if not bIsPole then begin
      SQL.Clear;
      SQL.Add('Alter table DgvUslugi add REGUZ Integer, add RegFZ Integer, ' +
              ' add DtRegFZ TimeStamp, add DtFZ TimeStamp, add NrFZ VarChar(14), ' +
              ' add SmFZ Double precision, add SmPred double precision, ' +
              ' add FzNotes VarChar(55)');
      TRY ExecSQL; EXCEPT END;
      SQL.Clear;
      SQL.Add('Alter table DgvUslugi alter RegUZ position 6, ' +
              ' alter RegFZ position 7, alter DtRegFZ position 8, ' +
              ' alter DtFZ position 9, alter NrFZ position 10, ' +
              ' alter SmFZ position 11, alter SmPred position 12, ' +
              ' alter Mnogitel position 13, alter FzNotes position 14, ' +
              ' alter WYear position 15');
      TRY ExecSQL; EXCEPT END;
    end;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DbMain.DatabaseName;
    SQL.Add('Select first 1 * from Dogovoru');
    Open;
    bIsPole := IsPole('RegUZ', qryTmp);
    Close;
    if not bIsPole then begin
      SQL.Clear;
      SQL.Add('Alter table Dogovoru add REGUZ Integer, add DtRegUZ TimeStamp, ' +
              ' add DtUZ TimeStamp, add NrUZ VarChar(14), ' +
              ' add SrokdUZ TimeStamp, add SmUZ Double precision, ' +
              ' add SmPred double precision, add InshUm varchar(15), ' +
              ' add DUNotes VarChar(55)');
      TRY ExecSQL; EXCEPT END;
      SQL.Clear;
      SQL.Add('Alter table Dogovoru alter TypD position 2, ' +
              ' alter KdWho position 3, alter KdPdr position 4, ' +
              ' alter KdDgv position 5, alter NrDgv position 6, ' +
              ' alter DtDgv position 7, alter DtEnd position 8, ' +
              ' alter SmDgv position 9, alter RegUZ position 10, ' +
              ' alter DtRegUZ position 11, alter NrUZ position 12, ' +
              ' alter DtUZ position 13, alter SrokDUZ position 14, ' +
              ' alter SmUZ position 15, alter SmPred position 16, ' +
              ' alter InshUm position 17, alter DUNotes position 18, ' +
              ' alter WYear position 19');
      TRY ExecSQL; EXCEPT END;
    end;
    SQL.Clear;
    DataBaseName := '';
  end;
*)
(*
  with tblTmp do begin
    DataBaseName := DbTmp.DatabaseName;
    TableName := 'K_Lent';
    bIsTable := Exists;
    DataBaseName := '';
    TableName := '';
  end;
  if not bIsTable then with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DbTmp.DatabaseName;
    SQL.Add('Create table K_Lent (');
    SQL.Add('NR INTEGER,');
    SQL.Add('FileNm VarChar(14),');
    SQL.Add('FileDt TimeStamp,');
    SQL.Add('FDat TimeStamp,');
    SQL.Add('NMK VarChar(38),');
    SQL.Add('NLS VarChar(14),');
    SQL.Add('NMS VarChar(70),');
    SQL.Add('OSTF INTEGER,');
    SQL.Add('S  Double precision,');
    SQL.Add('ND VarChar(20),');
    SQL.Add('DK SmallInt,');
    SQL.Add('REF INTEGER,');
    SQL.Add('TT Char(3),');
    SQL.Add('NAZN VarChar(165),');
    SQL.Add('DAPP TimeStamp,');
    SQL.Add('DATP TimeStamp,');
    SQL.Add('NLSK VarChar(14),');
    SQL.Add('MFO Char(6),');
    SQL.Add('NB VarChar(38),');
    SQL.Add('NAMK VarChar(70),');
    SQL.Add('OKPO VarChar(14),');
    SQL.Add('Podkl Char(1))');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Create generator LENT_NR ');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Create trigger K_LENT_NR for K_LENT before insert as begin');
    SQL.Add(' New.Nr = Gen_Id(Lent_NR, 1);');
    SQL.Add('end');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
*)
(*
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DbMain.DatabaseName;
    SQL.Add('Select first 1 * from DopInfPdr');
    Open;
    bIsPole := IsPole('IspNm', qryTmp);
    Close;
    if not bIsPole then begin
      SQL.Clear;
      SQL.Add('Alter table DopInfPdr add IspNm VarChar(35)');
      TRY ExecSQL; EXCEPT END;
      SQL.Clear;
      SQL.Add('Alter table DopInfPdr alter IspNm position 25');
      TRY ExecSQL; EXCEPT END;
    end;
    SQL.Clear;
    DataBaseName := '';
  end;
*)
(*
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DbMain.DatabaseName;
    SQL.Add('Select first 1 * from ' + tbl_KdWho);
    Open;
    bIsPole := IsPole('Nr_GOrd', qryTmp);
    Close;
    if not bIsPole then begin
      SQL.Clear;
      SQL.Add('Alter table ' + tbl_KdWho + ' add Nr_GOrd VarChar(10), ' +
              'add Nm_GOrd VarChar(65)');
      TRY ExecSQL; EXCEPT END;
    end;
    SQL.Clear;
    DataBaseName := '';
  end;
*)
(*
  with tblTmp do begin
    DataBaseName := DbMain.DatabaseName;
    TableName := 'ZZ_PCmp';
    bIsTable := Exists;
    DataBaseName := '';
    TableName := '';
  end;
  if not bIsTable then with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DbMain.DatabaseName;
    SQL.Add('Create table ZZ_PCmp (');
    SQL.Add('NR INTEGER,');
    SQL.Add('ShCmp Char(5),');
    SQL.Add('NmCmp VarChar(35),');
    SQL.Add('Notes Char(20))');
    ExecSQL;
    SQL.Clear;
    SQL.Add('CREATE INDEX ZZ_PCmp ON ZZ_PCmp (ShCmp)');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Create generator ZZ_PCmp_NR ');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Create trigger ZZ_PCmp_NR for zz_PCmp before insert as begin');
    SQL.Add(' New.Nr = Gen_Id(zz_PCmp_NR, 1);');
    SQL.Add('end');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  with tblTmp do begin
    DataBaseName := DbMain.DatabaseName;
    TableName := 'ZZ_UsrCmp';
    bIsTable := Exists;
    DataBaseName := '';
    TableName := '';
  end;
  if not bIsTable then with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DbMain.DatabaseName;
    SQL.Add('Create table ZZ_UsrCmp (');
    SQL.Add('NR INTEGER,');
    SQL.Add('KdUSR SmallInt,');
    SQL.Add('NmCmp Char(10),');
    SQL.Add('Lvl SmallInt,');
    SQL.Add('Notes Char(20))');
    ExecSQL;
    SQL.Clear;
    SQL.Add('CREATE INDEX ZZ_UsrCmp ON ZZ_UsrCmp (KdUsr, NmCmp)');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Create generator ZZ_UsrCmp_NR ');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Create trigger ZZ_UsrCmp_NR for zz_UsrCmp before insert as begin');
    SQL.Add(' New.Nr = Gen_Id(zz_UsrCmp_NR, 1);');
    SQL.Add('end');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  with tblTmp do begin
    DataBaseName := DbMain.DatabaseName;
    TableName := 'ZZ_UsrBPdr';
    bIsTable := Exists;
    DataBaseName := '';
    TableName := '';
  end;
  if not bIsTable then with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DbMain.DatabaseName;
    SQL.Add('Create table ZZ_UsrBPdr (');
    SQL.Add('NR INTEGER,');
    SQL.Add('KdUSR SmallInt,');
    SQL.Add('KdPdr SmallInt,');
    SQL.Add('Notes Char(20))');
    ExecSQL;
    SQL.Clear;
    SQL.Add('CREATE INDEX ZZ_UsrBPdr ON ZZ_UsrBPdr (KdUsr, KdPdr)');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Create generator ZZ_UsrBPdr_NR ');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Create trigger ZZ_UsrBPdr_NR for zz_UsrBPdr before insert as begin');
    SQL.Add(' New.Nr = Gen_Id(zz_UsrBPdr_NR, 1);');
    SQL.Add('end');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
*)
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdDgv2RkvztDgv(nKdDgv : integer; var nKdKli : integer;
               var cNrDgv, cDtDgv, cDtBeg, cDtEnd : string) : boolean;
begin
  Result := false;
  nKdKli := 0;
  cNrDgv := '';
  cDtDgv := '';
  cDtBeg := '';
  cDtEnd := '';
  with cdsDgvLU do begin
    if not Active then Open;
    if Locate('KdDgv', nKdDgv, []) then begin
      Result := true;
      nKdKli := FieldByName('KdWho').AsInteger;
      cNrDgv := FieldByName('NrDgv').AsString;
      cDtDgv := FieldByName('DtDgv').AsString;
      cDtBeg := FieldByName('DtBeg').AsString;
      cDtEnd := FieldByName('DtEnd').AsString;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdPdr2KdValPdr(nKdPdr : integer) : integer;
begin
  Result := 0;
  with cdsWhoLU do begin
    if not Active then Open;
    if Locate('KdWho', nKdPdr, []) then
      Result := FieldByName('KdValPdr').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdPdr2NmPdr(nKdPdr : integer; var nKdIF : SmallInt) : string;
begin
  Result := '';
  nKdIF  := -1;
  with cdsWhoLU do begin
    if not Active then
      Open;
    if Locate('KdWho', nKdPdr, []) then begin
      nKdIF := FieldByName('KdIF').AsInteger;
      Result := FieldByName('NmWho').AsString;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdPdr2NmSbuPdr(nKdPdr : integer) : string;
var nKdSbu : integer;
begin
  Result := '';
  nKdSbu := 0;
  with cdsWhoLU do begin
    if not Active then Open;
    if Locate('KdWho', nKdPdr, []) then
      nKdSbu := FieldByName('KdSbu').AsInteger;
    if nKdSbu <> 0 then
      Result := KdSbu2NmSbu(nKdSbu);
  end;
end;
//------------------------------------------------------------------------------
function TForm_DM.KdPdr2RkvztPdr(nKdPdr : integer;
                               var cNmPdr, cRSchPdr, cSchBU : string) : boolean;
begin
  Result   := false;
  cNmPdr   := '';
  cRSchPdr := '';
  cSchBU   := '';
  with Form_Dm.cdsRSchLU do begin
    if not Active then Open;
    if Locate('KdWho', nKdPdr, []) then begin
      Result   := true;
      cNmPdr   := FieldByName('NmSch').AsString;
      cRSchPdr := FieldByName('RSch').AsString;
    end;
  end;
  if Result then with Form_Dm.cdsWhoLU do begin
    if not Active then Open;
    if Locate('KdWho', nKdPdr, []) then
      cSchBU := Form_Dm.KdSbu2NmSbu(FieldByName('KdSbu').AsInteger);
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdVal2ShVal(nKdVal : integer) : string;
begin
  Result := '';
  with cdsValLU do begin
    if not Active then Open;
    IndexName := 'cdsValLuKdVal';
    EditKey;
    FieldByName('KdVal').AsInteger := nKdVal;
    if GoToKey then
      Result := FieldByName('NmValSokr').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdWho2NmWho(nKdWho : integer) : string;
begin
  Result := '';
  with cdsWhoLU do begin
    if not Active then Open;
    IndexName := 'cdsWhoLuKdWho';
    EditKey;
    FieldByName('KdWho').AsInteger := nKdWho;
    if GoToKey then
      Result := FieldByName('NmWho').AsString;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdBnkWho2NmWho(nKdWho : integer; var cOkpo : string) : string;
begin
  Result := '';
  cOkpo := '';
  with cdsWhoLU do begin
    if not Active then Open;
    IndexName := 'cdsWhoLuKdWho';
    EditKey;
    FieldByName('KdWho').AsInteger := nKdWho;
    if GoToKey then begin
      cOkpo := FieldByName('Okpo').AsString;
      Result := FieldByName('NmWho').AsString;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.CanDelete(cNmEsDb, cDelTbl, cDelFld, cDelValue : string;
                    nDelValue : Integer; var cMsg : string) : boolean;
//var cSqlMsg, cCheckFlds : string; i, nPos : integer;
begin
  Result := false;
(*
  Result := true;
  cMsg := '';
  cDelTbl := UpperCase(cDelTbl);
  cDelFld := UpperCase(cDelFld);
  with qryTmp do begin
    if Active then Close;
    DataBaseName := cNmEsDb;
    SQL.Clear;
  end;
  with qryCanDel do begin
    if Active then Close;
    DataBaseName := cNmEsDb;
    SQL.Clear;
    SQL.Add('Select CheckTbl, CheckFlds, Note from B_Del ' +
            ' where DelTbl = :cDelTbl and DelFld = :cDelFld ' +
            ' order by CheckTbl');
    ParamByName('cDelTbl').AsString := cDelTbl;
    ParamByName('cDelFld').AsString := cDelFld;
    Open;
    First;
    while not Eof do begin
      // в поле CheckFlds могут быть несколько полей, разделенных
      // точкой с запятой. Поэтому делаем разборку поля.
      i := 0;
      cCheckFlds := FieldByName('CheckFlds').AsString;
      if cCheckFlds[Length(cCheckFlds)] <> ';' then
        cCheckFlds := cCheckFlds + ';';
      cMsg := FieldByName('Note').AsString;
      cSqlMsg := '';
      while Length(cCheckFlds) > 0 do begin
        nPos := Pos(';', cCheckFlds);
        if nPos > 0 then begin
          Inc(i);
          if i > 1 then
            cSqlMsg := cSqlMsg + ' or ';
          cSqlMsg := cSqlMsg + '(' + Copy(cCheckFlds, 1, nPos-1) +
                                                  ' = :p_DelValue) ';
          cCheckFlds := Copy(cCheckFlds, nPos+1, Length(cCheckFlds));
        end;
      end;
      qryTmp.Close;
      qryTmp.SQL.Clear;
      qryTmp.SQL.Add('Select count( * ) as cnt from ' +
                      FieldByName('CheckTbl').AsString +
                     ' where ' + cSqlMsg);
      if cDelValue <> '' then
        qryTmp.ParamByName('p_DelValue').AsString := cDelValue
      else
        qryTmp.ParamByName('p_DelValue').AsInteger := nDelValue;
      qryTmp.Open;
      if qryTmp.FieldByName('Cnt').AsInteger <> 0 then begin
        Result := false;
        Break;
      end;
      Next;
    end;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryNachFloatGetText(Sender: TField; var Text: String;
                                                DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsFloat = 0)) then
    Text := ''
  else
    Text := FloatToStrF((Sender as TField).AsFloat, ffFixed, 18, 2);
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewKdRSch : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdRSch) as MaxKd from Kd_RSch');
    Open;
    if not FieldByName('MaxKd').IsNull and
                        (FieldByName('MaxKd').AsInteger <> 0) then
      Result := FieldByName('MaxKd').AsInteger + 1
    else
      Result := 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewKdKli : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdWho) as MaxKd from ' + tbl_KdWho +
                                             ' where KdWho > 3500');
    Open;
    if not FieldByName('MaxKd').IsNull and
                        (FieldByName('MaxKd').AsInteger <> 0) then
      Result := FieldByName('MaxKd').AsInteger + 1
    else
      Result := 3501;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewDgvRegN : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(RegN) as MaxKd from Bnk_Dgv');
    Open;
    if not FieldByName('MaxKd').IsNull and
                        (FieldByName('MaxKd').AsInteger <> 0) then
      Result := FieldByName('MaxKd').AsInteger + 1
    else
      Result := 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewUzRegN : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(RegUz) as MaxKd from Bnk_Uz');
    Open;
    if not FieldByName('MaxKd').IsNull and
                        (FieldByName('MaxKd').AsInteger <> 0) then
      Result := FieldByName('MaxKd').AsInteger + 1
    else
      Result := 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewAktRegN : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(RegFz) as MaxKd from Bnk_Fz');
    Open;
    if not FieldByName('MaxKd').IsNull and
                        (FieldByName('MaxKd').AsInteger <> 0) then
      Result := FieldByName('MaxKd').AsInteger + 1
    else
      Result := 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewKdDgv : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdDgv) as MaxKd from Bnk_Dgv');
    Open;
    if not FieldByName('MaxKd').IsNull and
                        (FieldByName('MaxKd').AsInteger <> 0) then
      Result := FieldByName('MaxKd').AsInteger + 1
    else
      Result := 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewKdGrpDgv : integer;
begin
  // 11-05-2008 Для группового юр.обязательства договор не нужен, поэтому в
  // Bnk_Dgv оно не регистрируется. А чтобы не нарушалась общая схема, для
  // нового ЮЗ подставляю фиктивный KdDgv (очередной минусовый из Bnk_Uz)
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Min(KdDgv) as MinKd from Bnk_Uz');
    Open;
    if not FieldByName('MinKd').IsNull and
                        (FieldByName('MinKd').AsInteger < 0) then
      Result := FieldByName('MinKd').AsInteger - 1
    else
      Result := -1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewKdAkt : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdAkt) as MaxKd from Bnk_FZ');
    Open;
    if not FieldByName('MaxKd').IsNull and
                        (FieldByName('MaxKd').AsInteger <> 0) then
      Result := FieldByName('MaxKd').AsInteger + 1
    else
      Result := 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewKdDgvRazd : integer;
begin
  Result := 1;  // не нужен
end;
//------------------------------------------------------------------------------
function TForm_Dm.ProcNds(dDtOper : TDateTime) : double;
begin
  Result := 20;
  with qryNdsHist do begin
    if not Active then Open;
    First;
    while not Eof do begin
      if FieldByName('DtBeg').AsDateTime <= dDtOper then begin
        Result := FieldByName('ProcNds').AsFloat;
        Break;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryNdsHistAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  with qryNdsHist do begin
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
procedure TForm_Dm.qryNdsHistAfterDelete(DataSet: TDataSet);
var nSvNR : integer;
begin
  with qryNdsHist do begin
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
procedure TForm_Dm.qryVidDocAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  with qryVidDoc do begin
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
procedure TForm_Dm.qryVidDocAfterDelete(DataSet: TDataSet);
var nSvNR : integer;
begin
  with qryVidDoc do begin
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
function TForm_Dm.NewRegNrDoc : Integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select NewRegNrDoc as NewNr from GetNewRegNrDoc');
    Open;
    if (RecordCount <> 0) and (FieldByName('NewNr').AsInteger <> 0) then
      Result := FieldByName('NewNr').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.DataModuleCreate(Sender: TObject);
begin
  DbMain.AliasName := DATABASE_ALIAS;
  
  if DbMain.Connected then
    DbMain.Close;
  DbMain.Params.Values['USER NAME']      := cMyUserNm;
  DbMain.Params.Values['PASSWORD']       := cMyPsw;
  if DbOks.Connected then
    DbOks.Close;
  DbOks.Params.Values['USER NAME']       := cMyUserNm;
  DbOks.Params.Values['PASSWORD']        := cMyPsw;
  CreCdsCheck; // создать таблицу с перечнем таблиц в БД
               // и списком полей, которые требуют проверок
               // перед удалением

  ConvertDlzhn()
end;

//--------------------------------------------------------------------
procedure TForm_Dm.ConvertDlzhn;
  function ReplaceChar(InStr:string; OldChar, NewChar: Char):String;
  var
    I: Integer;
  begin
    SetLength(Result,Length(InStr));

    for I := 1 to Length(InStr) do begin
      If InStr[I] = OldChar then begin
        Result[i] := NewChar;
      end else
        Result[I] := InStr[I];
    end
  end;

begin
  with TblDlzhn do begin
    Open;

    while not Eof do begin
      Edit;
      FieldByName('CODE').AsString := ReplaceChar(FieldByName('CODE').AsString, ',', '.');

      FieldByName('NAMEOK').AsString := ReplaceChar(FieldByName('NAMEOK').AsString, 'i', 'і');
      FieldByName('NAMED').AsString := ReplaceChar(FieldByName('NAMED').AsString, 'i', 'і');
      FieldByName('NAMEFULL').AsString := ReplaceChar(FieldByName('NAMEFULL').AsString, 'i', 'і');

      FieldByName('NAMEOK').AsString := ReplaceChar(FieldByName('NAMEOK').AsString, 'I', 'І');
      FieldByName('NAMED').AsString := ReplaceChar(FieldByName('NAMED').AsString, 'I', 'І');
      FieldByName('NAMEFULL').AsString := ReplaceChar(FieldByName('NAMEFULL').AsString, 'I', 'І');

      Post;
      Next;
    end;

    Close;
  end;
end;

//--------------------------------------------------------------------
function TForm_Dm.DatabaseLocation(AliasName: ShortString): String;
var i, nPos : integer; mList : TStringList;
begin
  Result := '';
  mList := TStringList.Create;
  Session.GetAliasParams(AliasName, mList);
  for i := 0 to mList.Count-1 do begin
    if pos('SERVER NAME', mList[i]) > 0 then begin
      nPos := pos('=',mList[i]);
      if nPos > 0 then begin
        Result := Copy(mList[i], nPos + 1, 135);
//      Result := ExtractFileDir(Result);               // если
//      if Copy(Result,Length(Result), 1) <> '\' then   // нужна
//        Result := Result + '\';                       // только директория
        Break;
      end;
      Break;
    end;
  end;
  mList.Free;
end;
(*
//------------------------------------------------------------------------------
procedure TForm_Dm.Opi_Db_ExprBeforeConnect(Sender: TObject);
//var cNmFileBd : string;
begin
  // не используется - оставил пока "на память"
  cNmFileBd := myGetNmFileBd(DbMain.AliasName);
  with Opi_Db_Expr do begin
    Params.Clear;
    Params.Add('DriverName=Interbase');
    Params.Add('Database=' + cNmFileBd);
    Params.Add('RoleName=RoleName');
    Params.Add('User_Name=sysdba');
    Params.Add('Password=masterkey');
    Params.Add('SQLDialect=1');
    Params.Add('LocaleCode=0000');
    Params.Add('BlobSize=-1');
    Params.Add('CommitRetain=False');
    Params.Add('WaitOnLocks=True');
    Params.Add('Interbase TransIsolation=ReadCommited');
    Params.Add('Trim Char=False');
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TForm_Dm.CreCdsCheck;
begin
//(*   Заремил 13-10-2011
  with cdsCheck do begin
    if Active then Close;
    FieldDefs.Clear;
    with FieldDefs.AddFieldDef do begin
      DataType := ftString;
      Size := 15;
      Name := 'ChckDB';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftString;
      Size := 15;
      Name := 'DelTbl';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftString;
      Size := 15;
      Name := 'KeyFld';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftString;
      Size := 15;
      Name := 'CheckTbl';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftString;
      Size := 15;
      Name := 'CheckFld';
    end;
    with FieldDefs.AddFieldDef do begin
      DataType := ftString;
      Size := 45;
      Name := 'NmCheckTbl';
    end;
    with IndexDefs.AddIndexDef do begin
      Fields := 'DelTbl;KeyFld';
      Name := 'OnTblFld';
    end;
    CreateDataSet;
    IndexName := 'OnTblFld';
    Open;
  end;
  with tblTmp do begin
    if Active then
      Close;
    DataBaseName := CESMAIN;
    TableName := 'Z_UPI';
    if Exists then
      AddZplCheck;
    DataBaseName := CESMAIN;
    TableName := 'BNK_MOV';
    if Exists then
      AddBnkCheck;
    TableName := 'Kss_MOV';
    if Exists then
      AddKssCheck;
    TableName := 'DOGOVORU';
    if Exists then
      AddDgvCheck;
    DataBaseName := '';
    TableName := '';
  end;
  //cdsCheck.SaveToFile(cDirTemp + 'check2.cds');
  CheckKdSps;
//*)
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.CheckKdSps;
var bIsTable, bIsField : boolean;
begin
  // проверка наличия таблицы Kd_Sps
  with tblChCh do begin
    DataBaseName := CESMAIN;
    TableName := 'Kd_Sps';
    bIsTable := Exists;
  end;
  if not bIsTable then with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('CREATE TABLE KD_SPS (');
    SQL.Add('NR INTEGER,');
    SQL.Add('KDSPS SMALLINT,');
    SQL.Add('SHSPS VARCHAR(15),');
    SQL.Add('NMSPS VARCHAR(65),');
    SQL.Add('NOTES VARCHAR(65))');
    ExecSQL;
    SQL.Clear;
    SQL.Add('CREATE GENERATOR NR_KdSps');
    ExecSQL;
    SQL.Clear;
    SQL.Add('CREATE TRIGGER KDSPS_NR FOR KD_SPS BEFORE INSERT POSITION 0 as');
    SQL.Add('begin');
    SQL.Add('New.Nr = Gen_Id(Nr_KdSps, 1);');
    SQL.Add('end');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Select * from USRS');
    Open;
    bIsField := myIsField('KdSps', qryTmp);
    Close;
    if not bIsField then begin
      SQL.Clear;
      SQL.Add('Alter TABLE USRS add KDSPS SMALLINT');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Alter TABLE USRS alter KDSPS position 6');
      ExecSQL;
      SQL.Clear;
    end;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GlCanDelete(cNmEsDb, cDelTbl, cKeyFld : string;
                nValue : integer; var cNmCheckTbl : string) : boolean;
begin
  Result := true;
  cNmCheckTbl := '';
  cDelTbl := UpperCase(cDelTbl);
  cKeyFld := UpperCase(cKeyFld);
  with cdsCheck do begin
    if Locate('DelTbl;KeyFld', VarArrayOf([cDelTbl, cKeyFld]), []) then
                      while (FieldByName('DelTbl').AsString = cDelTbl) and
                                                                not Eof do begin
      if qryCheck.Active then
        qryCheck.Close;
      qryCheck.SQL.Clear;
      qryCheck.DataBaseName := CESMAIN; //FieldByName('ChckDB').AsString;
      qryCheck.SQL.Add('Select count( * ) as CNT from ' +
                       FieldByName('CheckTbl').AsString +
                       ' where ' +
                       FieldByName('CheckFld').AsString +
                       ' = ' + IntToStr(nValue));
      if bFlagDbg then
        qryCheck.SQL.SaveToFile(cDirTemp + 'qryCheck.sql');
      qryCheck.Open;
      if qryCheck.FieldByName('CNT').AsInteger <> 0 then begin
        Result := false;
        cNmCheckTbl := FieldByName('NmCheckTbl').AsString;
        Break;
      end;
      Next;
    end;
    if qryCheck.Active then
      qryCheck.Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.AddZplCheck;
begin
  with cdsCheck do begin
    // Имя БД (1-е место) подставляется для проверяемой таблицы (4-е место)
    AppendRecord(['CESMAIN','Z_UPI','TABN','Z_ALIMENTY','TABN','Алименты']);
    AppendRecord(['CESMAIN','Z_UPI','TABN','Z_NADB','TABN','Надбавки']);
    AppendRecord(['CESMAIN','Z_UPI','TABN','Z_NU','TABN','Начисления и удержания']);
    AppendRecord(['CESMAIN','Z_UPI','TABN','Z_OTKL','TABN','Отклонения']);
    AppendRecord(['CESMAIN','Z_UPI','TABN','Z_PERE','TABN','Перемещения']);
    AppendRecord(['CESMAIN','Z_UPI','TABN','Z_UDERG','TABN','Удержания']);
    AppendRecord(['CESMAIN','Z_UPI','TABN','KSS_MOV','TABN','Кассовые документы']);
    AppendRecord(['CESMAIN','Z_KDVIDN','VIDN','Z_NU','VIDN','Начисления и удержания']);
    AppendRecord(['CESMAIN','Z_KDVIDN','VIDN','Z_NADB','VIDN','Надбавки']);
    AppendRecord(['CESMAIN','Z_KDVIDN','VIDN','Z_UDERG','VIDN','Удержания']);
    // продолжить !!!
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.AddBnkCheck;
begin
  // Или отречься от этой затеи или разобраться и привести в порядок !!!!!!!!
  with cdsCheck do begin
    // Имя БД (1-е место) подставляется для проверяемой таблицы (4-е место)
    AppendRecord(['CESMAIN','KD_WHO','KDWHO','BNK_MOV','KDPDR','Банковские документы']);
    AppendRecord(['CESMAIN','KD_WHO','KDWHO','BNK_MOV','KDKLI','Банковские документы']);
//    AppendRecord(['CESMAIN','KD_WHO','KDWHO','KD_RSCH','KDWHO','Расчётные счета']);
    AppendRecord(['CESMAIN','KD_RSCH','KDRSCH','BNK_MOV','KDRSSCH','Банковские документы']);

    AppendRecord(['CESMAIN','KD_VAL','KDVAL','BNK_MOV','KDVAL','Банковские документы']);
    AppendRecord(['CESMAIN','KD_VAL','KDVAL','MOV_VAL','KDVAL','Курсы валют']);
//    AppendRecord(['CESMAIN','KDSCH','BNK_MOV','KDKRRSCH','Банк']);
    AppendRecord(['CESMAIN','KD_SBU','KDSCH','KD_WHO','KDSBU','Подразделения']);
    // продолжить !!!
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.AddKssCheck;
begin
  // Или отречься от этой затеи или разобраться и привести в порядок !!!!!!!!
  with cdsCheck do begin
    // Имя БД (1-е место) подставляется для проверяемой таблицы (4-е место)
    AppendRecord(['CESMAIN','KD_WHO','KDWHO','KSS_MOV','KDPDR','Кассовые документы']);
    AppendRecord(['CESMAIN','KD_WHO','KDWHO','KSS_MOV','KDKLI','Кассовые документы']);
    AppendRecord(['CESMAIN','KD_VAL','KDVAL','KSS_MOV','KDVAL','Кассовые документы']);
    AppendRecord(['CESMAIN','KD_VAL','KDVAL','MOV_VAL','KDVAL','Курсы валют']);
//    AppendRecord(['CESMAIN','KDSCH','KSS_MOV','KDKRRSCH','Касса']);
    AppendRecord(['CESMAIN','KD_SBU','KDSCH','KD_WHO','KDSBU','Подразделения']);
    // продолжить !!!
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.AddDgvCheck;
begin
  ;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsMovValLUBeforeOpen(DataSet: TDataSet);
begin
  with qryCDS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_MovVal +
                                ' order by KdVal, DtBeg desc, NR desc');
  end;
  cdsMovValLU.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsSbuLUBeforeOpen(DataSet: TDataSet);
begin
  with cdsSbuLU do begin
    IndexDefs.Clear;
    IndexDefs.Add('OnKdSch', 'KdSch', []);
    IndexDefs.Add('OnSchBU', 'SchBU', []);
    IndexDefs.Add('OnSch_17', 'Sch_17', []);
  end;
  with qryCDS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KdSbu);
  end;
  cdsSbuLU.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsSbuLUAfterOpen(DataSet: TDataSet);
begin
  if bFlagDbg then
    cdsSbuLU.SaveToFile(cDirTemp + 'SbuLu.cds');
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsWhoLUBeforeOpen(DataSet: TDataSet);
begin
  with qryCDS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KdWho);
  end;
  cdsWhoLU.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsRSchLUBeforeOpen(DataSet: TDataSet);
begin
  with qryCDS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_RSch order by KdWho, KdRsch');
  end;
  cdsRSchLU.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsBnkPdrLUBeforeOpen(DataSet: TDataSet);
begin
  with qryCDS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select w.*, rs.*, rb.* from ' + tbl_KdWho + ' w ' +
            ' Left Outer Join Kd_RSch rs on (rs.KdWho = w.KdWho) ' +
            ' Left Outer Join Kd_Bnk rb on (rb.KdBnk = rs.KdBnk) ' +
            ' where (w.shfr = "bnk") or (w.shfr = "bnr")');
         // ' and (rs.ShPPdr is NULL or rs.ShPPdr = ""'); Тут нужны все
  end;
  cdsBnkPdrLU.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsBnkPdrLUAfterOpen(DataSet: TDataSet);
begin
  if bFlagDbg then
    cdsBnkPdrLU.SaveToFile(cDirTemp + 'pdrSch.cds');
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsDgvLUBeforeOpen(DataSet: TDataSet);
begin
  with qryCDS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Bnk_Dgv');
  end;
  cdsDgvLU.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsStzLUBeforeOpen(DataSet: TDataSet);
begin
  with qryCDS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KdStZ + ' where KdStZ > 100');
  end;    // where... добавлено с 01-01-2013 вв связи с новыми КЕКВами
  cdsStzLU.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsValLUBeforeOpen(DataSet: TDataSet);
begin
  with qryCDS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KdVal);
  end;
  cdsValLU.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsGrpLUBeforeOpen(DataSet: TDataSet);
begin                        // Разобраться бы!!! О какой Grp идет речь?
  with qryCDS do begin       // То ли для ФОНДОВ, то ли для УМЦ
    if Active then Close;    // По-моему, этот cdsGrpLU вообще не используется
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_UKdGr);
  end;
  cdsGrpLU.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.cdsUsrsBeforeOpen(DataSet: TDataSet);
begin
  with qryCDS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Usrs');
  end;
  cdsUsrs.ProviderName := 'dspCDS';
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetUsrInfo(nKdUsr : integer; var nKdKatUsr : integer;
                             var cNmUsr, cPswUsr, cVkl : string) : boolean;
begin
  Result := false;
  nKdKatUsr := 0;
  cNmUsr := '';
  cPswUsr := '';
  cVkl := '';
  with cdsUsrs do begin
    if not Active then Open;
    if Locate('KdUsr', nKdUsr, []) then begin
      nKdKatUsr := FieldByName('KdKatUsr').AsInteger;
      cNmUsr := FieldByName('NmUsr').AsString;
      cPswUsr := FieldByName('PswUsr').AsString;
      cVkl := FieldByName('Vkl').AsString;
      Result := true;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryKdSpsAfterPost(DataSet: TDataSet);
var nSvKdSps : integer;
begin
  with qryKdSps do begin
    nSvKdSps := FieldByName('KdSps').AsInteger;
    Database.ApplyUpdates([qryKdSps]);
    Close;
    Open;
    if nSvKdSps > 0 then
      Locate('KdSps', nSvKdSps, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryKdSpsBeforePost(DataSet: TDataSet);
begin
  with qryKdSps do begin
    if State = dsInsert then
      FieldByName('KdSps').AsInteger := myNewKdSps;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.MyNewKdSps : integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdSps) as MaxKd from Kd_Sps');
    Open;
    if (RecordCount > 0) and (FieldByName('MaxKd').AsInteger > 0) then
      Result := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryKdSpsAfterDelete(DataSet: TDataSet);
begin
  DbMain.ApplyUpdates([qryKdSps]);
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtNewRecord(DataSet: TDataSet);
begin
{
  qryObDtPVozv.AsString := 'N';
  qryObDtDtProc.AsDateTime  := dGkDtProc;
  qryObDtSchet_Dbt.AsString := cLastObDtSchDbt;
  qryObDtKodZ_Dbt.AsString  := cLastObDtKekv;
  qryObDtSchet_Krt.AsString := cLastObDtSchKrt;
  qryObDtOtkuda.AsString    := cLastObDtOtkuda;
  if nLastObDtKPr <> 0 then
    qryObDtKPr.AsInteger := nLastObDtKPr;
}
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qry_OstNewRecord(DataSet: TDataSet);
begin
//  qryOstDtProc.AsDateTime := dGkDtProc;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtBeforeEdit(DataSet: TDataSet);
begin
{
  cOldSm    := qryObDtSum_Dbt.AsString;
  cOldSchDt := qryObDtSchDt.AsString;
  cOldSchKt := qryObDtSchKt.AsString;
  cOldKekv  := qryObDtKodZ_Dbt.AsString;
  cOldUPoz  := qryObDtKPr.AsString;
  cOldNotes := qryObDtOtkuda.AsString;
}
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtBeforePost(DataSet: TDataSet);
begin
(*
  if qryObDtNR.IsNull or (qryObDtNR.AsInteger <= 0) then
    qryObDtNR.AsInteger := NewQryObDtNR;
  if not qryObDtSchet_Dbt.IsNull and (qryObDtSchet_Dbt.AsString <> '') then
    cLastObDtSchDbt := qryObDtSchet_Dbt.AsString;
  if not qryObDtKodZ_Dbt.IsNull and (qryObDtKodZ_Dbt.AsString <> '') then
    cLastObDtKekv := qryObDtKodZ_Dbt.AsString;
  if not qryObDtSchet_Krt.IsNull and (qryObDtSchet_Krt.AsString <> '') then
    cLastObDtSchKrt := qryObDtSchet_Krt.AsString;
  if not qryObDtOtkuda.IsNull and (qryObDtOtkuda.AsString <> '') then
    cLastObDtOtkuda := qryObDtOtkuda.AsString;
  if not qryObDtKPr.IsNull and (qryObDtKPr.AsString <> '') then
    nLastObDtKPr := qryObDtKPr.AsInteger;
  cNewSm := qryObDtSum_Dbt.AsString;
  cNewSchDt := qryObDtSchDt.AsString;
  cNewSchKt := qryObDtSchKt.AsString;
  cNewKekv  := qryObDtKodZ_Dbt.AsString;
  cNewUPoz  := qryObDtKPr.AsString;
  cNewNotes := qryObDtOtkuda.AsString;
  if (qryObDt.State = dsEdit) and
       ((cNewSm <> cOldSm) or (cNewSchDt <> cOldSchDt) or
        (cNewSchDt <> cOldSchDt) or (cNewKekv <> cOldKekv) or
         (cNewUPoz <> cOldUPoz) or (cNewNotes <> cOldNotes)) then begin
    cLogMsg := 'СчДт ' + cOldSchDt;
    if cNewSchDt <> cOldSchDt then
      cLogMsg := cLogMsg + ' => '
    else
      cLogMsg := cLogMsg + ' = ';
    cLogMsg := cLogMsg + cNewSchDt;
    cLogMsg := cLogMsg + ', СчКт ' + cOldSchKt;
    if cNewSchKt <> cOldSchKt then
      cLogMsg := cLogMsg + ' => '
    else
      cLogMsg := cLogMsg + ' = ';
    cLogMsg := cLogMsg + cNewSchKt;
    cLogMsg := cLogMsg + ', Сумма: ' + cOldSm;
    if cNewSm <> cOldSm then
      cLogMsg := cLogMsg + ' => '
    else
      cLogMsg := cLogMsg + ' = ';
    cLogMsg := cLogMsg + cNewSm;
    if cNewKekv <> cOldKekv then
      cLogMsg := cLogMsg + ', Кекв ' + cOldKekv + ' => ' + cNewKekv;
    if cNewUPoz <> cOldUPoz then
      cLogMsg := cLogMsg + ', УчПоз ' + cOldUPoz + ' => ' + cNewUPoz;
    if cNewNotes <> cOldNotes then
      cLogMsg := cLogMsg + ', Журнал: ' + cOldNotes + ' => ' + cNewNotes;
    cLogMsg := Trim(cLogMsg);
    if (cLogMsg  > '') then
      AddGkLog(dGkDtProc, cLogMsg, cNewSchDt, cNewSchKt, 'Редакт. оборотов',
                                                     gc_AppNmUsr, 'Gk_ObDt'); end
  else begin
    cLogMsg := 'Сумма: ' + cNewSm + ', СчДт: ' + cNewSchDt +
               ', СчКт: ' + cNewSchKt + ', Кекв: ' + cNewKekv +
               ', УчПоз: ' + cNewUPoz;
    if cNewNotes > '' then
      cLogMsg := cLogMsg + ', Журнал: ' + cNewNotes;
    AddGkLog(dGkDtProc, cLogMsg, cNewSchDt, cNewSchKt, 'Новая в обороты',
                                                         gc_AppNmUsr, 'Gk_ObDt');
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtBeforeDelete(DataSet: TDataSet);
begin // Добавить запись в Лог-файл
{
  cNewSm := qryObDtSum_Dbt.AsString;
  cNewSchDt := qryObDtSchDt.AsString;
  cNewSchKt := qryObDtSchKt.AsString;
  cNewKekv  := qryObDtKodZ_Dbt.AsString;
  cNewUPoz  := qryObDtKPr.AsString;
  cNewNotes := qryObDtOtkuda.AsString;
  cLogMsg := 'Сумма: ' + cNewSm + ', СчДт: ' + cNewSchDt +
             ', СчКт: ' + cNewSchKt + ', Кекв: ' + cNewKekv +
             ', УчПоз: ' + cNewUPoz;
  if cNewNotes > '' then
      cLogMsg := cLogMsg + ', Журнал: ' + cNewNotes;
  AddGkLog(dGkDtProc, cLogMsg, cNewSchDt, cNewSchKt,
                      'Удалена запись в оборотах', gc_AppNmUsr, 'Gk_ObDt');
}
end;
//------------------------------------------------------------------------------
function TForm_DM.NewQryObDtNR : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select  * from GetObDtNR');
    Open;
    Result := FieldByName('NewObDtNR').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qry_OstBeforePost(DataSet: TDataSet);
begin
//  if qryOstNR.IsNull or (qryOstNR.AsInteger <= 0) then
//    qryOstNR.AsInteger := NewQryOstNR;
end;
//------------------------------------------------------------------------------
function TForm_DM.NewQryOstNR : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select  * from GetOstNR');
    Open;
    Result := FieldByName('NewOstNR').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_DM.NewUPosKPr : SmallInt;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KPR) as MaxKd from KDUPOZ');
    Open;
    if (RecordCount > 0) and (not FieldByName('MaxKd').IsNull) then
      Result := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtAfterPost(DataSet: TDataSet);
begin
{
  with qryObDt do begin
    nSvObDtNR := FieldByName('NR').AsInteger;
    DbMain.ApplyUpdates([qryObDt]);
    Close;
    Open;
    if nSvObDtNR <> 0 then
      Locate('NR', nSvObDtNR, [])
    else
      Last;
  end;
}
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtAfterDelete(DataSet: TDataSet);
begin
//  DbMain.ApplyUpdates([qryObDt]);
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qry_OstAfterDelete(DataSet: TDataSet);
begin
//  DbMain.ApplyUpdates([qryOst]);
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qry_OstAfterPost(DataSet: TDataSet);
begin
{
  with qryOst do begin
    nSvOstNR := FieldByName('NR').AsInteger;
    DbMain.ApplyUpdates([qryOst]);
    Close;
    Open;
    if nSvOstNR <> 0 then
      Locate('NR', nSvOstNR, [])
    else
      Last;
  end;
}
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryUpozBeforePost(DataSet: TDataSet);
begin
  if qryUPozKPr.IsNull or (qryUPozKPr.AsInteger = 0) then
    qryUPozKPr.AsInteger := NewUPosKPr;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryUpozAfterPost(DataSet: TDataSet);
var nKPr : integer;
begin
  with qryUPoz do begin
    nKPr := FieldByName('KPR').AsInteger;
    DbMain.ApplyUpdates([qryUPoz]);
    Close;
    Open;
    if nKPr <> 0 then
      Locate('KPR', nKPr, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryUpozAfterDelete(DataSet: TDataSet);
begin
  qryUPoz.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryUpozB_SCHETValidate(Sender: TField);
var cText : ShortString; nKdSch : SmallInt; bHsChld : boolean;
begin
  if not bGKCheckVvod then
    Exit;
  cText := Trim((Sender as TField).AsString);
  if cText > '' then begin
    nKdSch := SchBu2KdSbu(cText, bHsChld);
    if nKdSch <= 0 then
      Raise Exception.
              Create('Нет в плане счетов счёта "' + cText + '"')
    else if bHsChld and (cAppShCmp <> 'gkn')   then
      Raise Exception.
              Create('Тут должен быть аналитический счёт')
    else
      qryUPoz.FieldByName('KdB_Sch').AsInteger := nKdSch; end
  else
    qryUPoz.FieldByName('KdB_Sch').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryUpozZ_SCHETValidate(Sender: TField);
var cText : ShortString; nKdSch : SmallInt; bHsChld : boolean;
begin
  if not bGKCheckVvod then
    Exit;
  cText := Trim((Sender as TField).AsString);
  if cText > '' then begin
    nKdSch := SchBu2KdSbu(cText, bHsChld);
    if nKdSch <= 0 then
      Raise Exception.
              Create('Нет в плане счетов счёта "' + cText + '"')
//    else if bHsChld then
//      Raise Exception.
//              Create('Тут должен быть аналитический счёт')
    else
      qryUPoz.FieldByName('KdZ_Sch').AsInteger := nKdSch; end
  else
    qryUPoz.FieldByName('KdZ_Sch').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryUpozF_SCHETValidate(Sender: TField);
var cText : ShortString; nKdSch : SmallInt; bHsChld : boolean;
begin
  if not bGKCheckVvod then
    Exit;
  cText := Trim((Sender as TField).AsString);
  if cText > '' then begin
    nKdSch := SchBu2KdSbu(cText, bHsChld);
    if nKdSch <= 0 then
      Raise Exception.
              Create('Нет в плане счетов счёта "' + cText + '"')
//    else if bHsChld then
//      Raise Exception.
//              Create('Тут должен быть аналитический счёт')
    else
      qryUPoz.FieldByName('KdF_Sch').AsInteger := nKdSch; end
  else
    qryUPoz.FieldByName('KdF_Sch').AsString := '';
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.StrFieldSetText(Sender: TField; const Text: String);
var cText : ShortString;
begin  // Когда не нужны другие проверки, делаю только TRIM - очень полезно
  cText := Trim(Text);
  Sender.AsString := cText;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtKODZ_DBTValidate(Sender: TField);
begin
{
  if not bGKCheckVvod then
    Exit;
  cText := Trim((Sender as TField).AsString);
  if cText > '' then begin
    nKdStZ := ShStz2KdStZ(cText, bHsChld);
    if nKdStZ <= 0 then
      Raise Exception.
              Create('Нет в справочнике КЕКВ "' + cText + '"')
    else if bHsChld then
      Raise Exception.
              Create('Тут не должен быть "групповой" КЕКВ')
    else
      qryObDt.FieldByName('KdStzDbt').AsInteger := nKdStZ; end
  else
    qryObDt.FieldByName('KdStzDbt').AsString := '';
  qryObDtKODZ_KRT.AsString := qryObDtKODZ_DBT.AsString;
}
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qry_OstSTATIAValidate(Sender: TField);
begin
end;

//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtSCHET_DBTValidate(Sender: TField);
begin
end;

//------------------------------------------------------------------------------
procedure TForm_Dm.qry_OstSCHET_DBTValidate(Sender: TField);
begin
end;

//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtSCHET_KRTValidate(Sender: TField);
begin
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtKPRValidate(Sender: TField);
begin
end;

//------------------------------------------------------------------------------
procedure TForm_Dm.qryObDtCalcFields(DataSet: TDataSet);
begin
end;

//------------------------------------------------------------------------------
procedure TForm_Dm.qry_OstCalcFields(DataSet: TDataSet);
begin
//  qryOstSchDt.AsString := KdSbu2SchBU(qryOstKdSchDbt.AsInteger);
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdUPoz2ShUPoz(nKdUPoz : SmallInt) : ShortString;
begin
  Result := '';
  with qryUPoz do begin
    if not Active then
      Open;
    if Locate('KPR', nKdUPoz, []) then
      Result := FieldByName('SpecNaim').AsString;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.RegCurUsr(nKdUsr, nKdCmp, nLvl : SmallInt;
                           cNmUsr : string; cShCmp, cNmComputer : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Insert into ZZ_WrkUsr (DtBeg, DtLastReg, KdUsr, KdCmp, NmUsr, ' +
            ' ShCmp, Lvl, NmComputer) values ' +
            ' (:dDtBeg, "NOW", :nKdUsr, :nKdCmp, :cNmUsr, ' +
            ' :cShCmp, :nLvl, :cNmComputer)');
    ParamByName('dDtBeg').AsDateTime    := Now;
    ParamByName('nKdUsr').AsInteger     := nKdUsr;
    ParamByName('nKdCmp').AsInteger     := nKdCmp;
    ParamByName('cNmUsr').AsString      := cNmUsr;
    ParamByName('cShCmp').AsString      := cShCmp;
    ParamByName('nLvl').AsInteger       := nLvl;
    ParamByName('cNmComputer').AsString := cNmComputer;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.UnRegCurUsr(nKdUsr, nKdCmp : SmallInt;
                                                    cNmComputer : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Delete from ZZ_WrkUsr where KdUsr = :nKdUsr and ' +
            ' KdCmp = :nKdCmp and NmComputer = :cNmComputer');
    ParamByName('nKdUsr').AsInteger     := nKdUsr;
    ParamByName('nKdCmp').AsInteger     := nKdCmp;
    ParamByName('cNmComputer').AsString := cNmComputer;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.SaveUsrVid(
  nKdUsr: SmallInt;
  cShCmp, cDirVids, cNmFileVid: ShortString);
var
  bIsRecord : boolean;
begin
  if FileExists(cDirVids + cNmFileVid) then
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := dbMain.DatabaseName;
      SQL.Add(
        'select KdUsr, NmFVid from zz_UsrsVids ' +
        'where KdUsr = :nKdUsr and ' +
          'ShCmp = :cShCmp and NmFVid = :cNmFileVid');
      ParamByName('nKdUsr').AsInteger := nKdUsr;
      ParamByName('cShCmp').AsString := cShCmp;
      ParamByName('cNmFileVid').AsString := cNmFileVid;
      Open;

      bIsRecord := RecordCount > 0;
      Close;
      SQL.Clear;

      if not bIsRecord then
        SQL.Add(
          'insert into zz_UsrsVids ' +
            '(KdUsr, ShCmp, NmFVid, FVid) ' +
          'values ' +
            '(:nKdUsr, :cShCmp, :cNmFileVid, :MyBlob)')
      else
        SQL.Add(
          'update zz_UsrsVids ' +
            'set FVid = :MyBlob ' +
          'where KdUsr = :nKdUsr ' +
            'and ShCmp = :cShCmp ' +
            'and NmFVid = :cNmFileVid');
      ParamByName('nKdUsr').AsInteger := nKdUsr;
      ParamByName('cShCmp').AsString := cShCmp;
      ParamByName('cNmFileVid').AsString := cNmFileVid;
      ParamByName('MyBlob').LoadFromFile(cDirVids + cNmFileVid, ftBlob);
      ExecSQL;
      Close;
      SQL.Clear;
      DataBaseName := '';
    end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.SaveUsrVids(nKdUsr: SmallInt; cShCmp, cDirVids: ShortString);
var mSR : TSearchRec; cFullFileNm : ShortString;
begin
  if FindFirst(cDirVids + '*.*', faAnyFile, mSR) = 0 then begin
    repeat
      SaveUsrVid(nKdUsr, cShCmp, cDirVids, mSR.Name);
      cFullFileNm := cDirVids + mSR.Name;
      DeleteFile(cFullFileNm);
    until FindNext(mSR) <> 0;
    FindClose(mSR);
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.RestoreUsrVids(nKdUsr: SmallInt;
                                               cShCmp, cDirVids: ShortString);
var  cNmFileVid : ShortString;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Select * from zz_UsrsVids ' +
            ' where KdUsr = :nKdUsr and ShCmp = :cShCmp');
    ParamByName('nKdUsr').AsInteger := nKdUsr;
    ParamByName('cShCmp').AsString := cShCmp;
    Open;
    while not Eof do begin
      cNmFileVid := FieldByName('NmFVid').AsString;
      (FieldByName('FVid') as TBlobField).SaveToFile(cDirVids + cNmFileVid);
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.RestoreIniFile(nKdUsr : SmallInt;
                                             cShCmp, cFullFileNm : ShortString);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Select * from zz_UsrsIni ' +
               ' where KdUsr = :nKdUsr and ShCmp = :cShCmp');
    ParamByName('nKdUsr').AsInteger := nKdUsr;
    ParamByName('cShCmp').AsString := cShCmp;
    Open;
    if RecordCount > 0 then
      (FieldByName('UsrIni') as TBlobField).SaveToFile(cFullFileNm);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.SaveIniFile(nKdUsr : SmallInt;
                                            cShCmp, cFullFileNm : ShortString);
var bIsRecord : boolean; dDtNow : TDateTime;
begin
  if FileExists(cNmIniFile) then with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Select * from zz_UsrsIni ' +
             ' where KdUsr = :nKdUsr and ShCmp = :cShCmp');
    ParamByName('nKdUsr').AsInteger := nKdUsr;
    ParamByName('cShCmp').AsString := cShCmp;
    Open;
    bIsRecord := RecordCount > 0;
    Close;
    SQL.Clear;
    dDtNow := Now;
    if not bIsRecord then
      SQL.Add('Insert into zz_UsrsIni (KdUsr, ShCmp, LDate, UsrIni) values ' +
              ' (:nKdUsr, :cShCmp, :dDtNow, :MyBlob)')
    else
      SQL.Add('Update zz_UsrsIni ' +
              ' set LDate = :dDtNow, UsrIni = :MyBlob ' +
              ' where KdUsr = :nKdUsr and ShCmp = :cShCmp');
    ParamByName('nKdUsr').AsInteger := nKdUsr;
    ParamByName('cShCmp').AsString := cShCmp;
    ParamByName('dDtNow').AsDateTime := dDtNow;
    ParamByName('MyBlob').LoadFromFile(cFullFileNm, ftMemo);
    ExecSQL;
    Close;
    SQL.Clear;
    DataBaseName := '';
    DeleteFile(cFullFileNm); // Подумать - м.б. не удалять ???
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.TimLastRegTimer(Sender: TObject);
//var mSvCursor : TCursor;
begin
  // Каждую минуту давать в таблицу zz_WrkUsr подтверждение, что работаем с
  // программой. Если не поступит 2-3 минуты, программулька на сервере удалит
  // регистрацию в сеансе (запись в zz_WrkUsr)
////// Не тут ли виснет ???
  //SendLiveMsgToBD(nAppKdUsr, cAppShCmp);
//////
end;
(*
//------------------------------------------------------------------------------
procedure TForm_Dm.SendLiveMsgToBD(nKdUsr: SmallInt; cShCmp: ShortString);
begin
  Beep;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := DbMain.DatabaseName;
    SQL.Add('Update zz_WrkUsr set DtLastReg = "NOW" ' +
            ' where KdUsr = :nKdUsr and ShCmp = :cShCmp');
    ParamByName('nKdUsr').AsInteger := nKdUsr;
    ParamByName('cShCmp').AsString := cShCmp;
    ExecSQL;  // если даже такой записи почему-то не окажется - беды не будет
    SQL.Clear;
    DataBaseName := '';
  end;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  // Если случилось не на (popMenu или MainMenu), то и так все хорошо.
  // Иначе не помогают сии ухищрения
end;
*)
//------------------------------------------------------------------------------
function TForm_Dm.TabN2FIO(nTabN : integer;
                     var cFam, cIma, cOtch, cPol, cID : ShortString): boolean;
begin
  Result := false;
  if not qryUpi.Active then
    OpenQryUpi(0);
  if qryUpi.Locate('TabN', nTabN, []) then begin
    cFam  := qryUpiFam.AsString;
    cIma  := qryUpiIma.AsString;
    cOtch := qryUpiOtch.AsString;
    cPol  := qryUpiPol.AsString;
    cID   := qryUpiID.AsString;
    Result := true;
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdUsr2NmUsr(nKdUsr: SmallInt): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Select * from Usrs ' +
               ' where KdUsr = :nKdUsr');
    ParamByName('nKdUsr').AsInteger := nKdUsr;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NmUsr').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdUsr2FioUsr(nKdUsr: SmallInt): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Select * from Usrs where KdUsr = :nKdUsr');
    ParamByName('nKdUsr').AsInteger := nKdUsr;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('Notes').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.MyDbBeforeConnect(Sender: TObject);
begin
{
  with Sender as TDatabase do begin
    if LoginPrompt = False then begin
      Params.Values['User_Name'] := cMyUserNm;
      Params.Values['Password']  := cMyPsw;
    end;
  end;
}
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.Opi_Db_ExprBeforeConnect(Sender: TObject);
begin
{
  with Sender as TSQLConnection do begin
    if LoginPrompt = False then begin
      Params.Values['User_Name'] := cMyUserNm;
      Params.Values['Password']  := cMyPsw;
    end;
  end;
}
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.AddGkLog(dDtPrc : TDateTime; cLogMsg : string;
                         cSchDt, cSchKt, cNmEvnt, cNmUsr, cNmTbl : ShortString);

begin
(*
  if Length(cLogMsg) >= 245 then
    cLogMsg := Copy(cLogMsg, 1, 245);
  with qryLog do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; {В DtEvnt будет вводиться серверное время "NOW"}
    SQL.Add('Insert into GK_LOG (DtProc, SchDt, SchKt, DtEvnt, NmEvnt, ' +
            ' KdUsr, NmUsr, NmTbl, Notes) values (:dDtPrc, :cSchDt, :cSchKt, ' +
            ' "NOW", :cNmEvnt, :nKdUsr, :cNmUsr, :cNmTbl, :cLogMsg)');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('cSchDt').AsString   := cSchDt;
    ParamByName('cSchKt').AsString   := cSchKt;
    ParamByName('cNmEvnt').AsString  := cNmEvnt;
    ParamByName('nKdUsr').AsInteger  := nAppKdUsr;
    ParamByName('cNmUsr').AsString   := cNmUsr;
    ParamByName('cNmTbl').AsString   := cNmTbl;
    ParamByName('cLogMsg').AsString  := cLogMsg;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
*)
end;


{ Отказался от схемы с InclPdr. Вместо неё InclRS.  Функцию оставил на память
function TForm_Dm.GetNewInclPdrKd: integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 NR, Gen_Id(B_INCLPDR_KD, 1) as NextKd ' +
                              // прямое обращение к генератору
                              // =============================
            ' from bnk_Mov'); // из какой таблицы - все равно (Одна запись).
    Open;                     // Только надо не из пустой
    Result := FieldByName('NextKd').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

// Пример прямого обращения к генератору
// =====================================
Можно обратиться так:  Select First 1 Gen_Id(My_Gen_ID, 0) as My_NR from DbLog
Или так:  Select First 1 NR, Gen_Id(My_Gen_ID, 0) as My_NR from DbLog
Из какой таблицы - все равно (Одна запись). ТОЛЬКО НАДО НЕ ИЗ ПУСТОЙ !!!
}
//------------------------------------------------------------------------------
function TForm_Dm.GetNrGO(nKdPdr: SmallInt): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Select * from Kd_Who ' +
               ' where KdWho = :nKdPdr');
    ParamByName('nKdPdr').AsInteger := nKdPdr;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('Nr_GOrd').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetKssNewNR: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Select First 1 NR, Gen_Id(Nr_KsKss, 1) NewNR from E_Days');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetSchBuNrGO(nKdSch: SmallInt;
                               var cSchBU, cNmSch, cNrGO: ShortString): boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Select First 1 * from Kd_SBU where KdSch = :nKdSch');
    ParamByName('nKdSch').AsInteger := nKdSch;
    Open;
    if RecordCount > 0 then begin
      cSchBU := FieldByName('SchBU').AsString;
      cNmSch := FieldByName('NmSch').AsString;
      cNrGO  := FieldByName('Nr_GOrd').AsString;
      Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.VidIsTrS(cVidN: ShortString): boolean;
begin
  Result := (cVidN = '1005') or (cVidN = '1006') or (cVidN = '1008');
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.FloatFldGetText(Sender: TField; var Text: String;
                                                          DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsFloat = 0)) then
    Text := ''
  else
    Text := FloatToStrF((Sender as TField).AsFloat, ffNumber, 18, 2);
end;
//------------------------------------------------------------------------------
function TForm_Dm.SchBu2Nr_GOrd(cSchBU : ShortString;
                                        var cNmSch : ShortString) : ShortString;
begin
  Result := '';
  cNmSch := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := dbMain.DatabaseName;
    SQL.Add('Select First 1 * from Kd_SBU where SchBU = :cSchBU');
    ParamByName('cSchBU').AsString := cSchBU;
    Open;
    if RecordCount > 0 then begin
      Result := FieldByName('Nr_GOrd').AsString;
      cNmSch := FieldByName('NmSch').AsString;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.GetEsvPrc(dDtMes: TDateTime; var nPrcCmn, nPrcPps,
                                             nPrcBln, nPrcDkr, nPrcDgv: double);
begin
  nPrcCmn := 0;
  nPrcPps := 0;
  nPrcBln := 0;
  nPrcDkr := 0;
  nPrcDgv := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Z_TESV where DtBeg <= :dDtMes ' +
            ' order by DtBeg desc, NR desc');
    ParamByName('dDtMes').AsDateTime := dDtMes;
    Open;
    if RecordCount > 0 then begin
      nPrcCmn := FieldByName('PrcCmn').AsFloat;
      nPrcPps := FieldByName('PrcPps').AsFloat;
      nPrcBln := FieldByName('PrcBln').AsFloat;
      nPrcDkr := FieldByName('PrcDekr').AsFloat;
      nPrcDgv := FieldByName('PrcGpd').AsFloat;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.GetEsvPrpPrc(dDtMes: TDateTime; var nPrcCmn, nPrcBln,
                                          nPrcBlnInv, nPrcDgv, nPrcInv: double);
begin
  nPrcCmn := 0;
  nPrcBln := 0;
  nPrcDgv := 0;
  nPrcInv := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Z_TESVP where DtBeg <= :dDtMes ' +
            ' order by DtBeg desc, NR desc');
    ParamByName('dDtMes').AsDateTime := dDtMes;
    Open;
    if RecordCount > 0 then begin
      nPrcCmn    := FieldByName('PrcCmn').AsFloat;
      nPrcBln    := FieldByName('PrcBln').AsFloat;
      nPrcBlnInv := FieldByName('PrcBlnInv').AsFloat;
      nPrcDgv    := FieldByName('PrcGpd').AsFloat;
      nPrcInv    := FieldByName('PrcInv').AsFloat;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.Z_SchBu2UPoz(cSchBU: ShortString;
                                            var nKdUPoz: SmallInt): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from KdUPoz where Z_Schet = :cSchBU');
    ParamByName('cSchBU').AsString := cSchBU;
    Open;
    if RecordCount > 0 then begin
      nKdUPoz := FieldByName('KPr').AsInteger;
      Result := FieldByName('SpecNaim').AsString;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewNdbNrPkt: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(zz_NewNdbNrPKT, 1) NewNrPkt from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNrPkt').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewSpec_NR: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(Spec_NR, 1) NewSpecNR from rdb$database');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewSpecNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewSpecPS: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(Spec_PS, 1) NewSpecPS from rdb$database');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewSpecPS').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdSbu2NrGO(nKdSbu: SmallInt; dOnDate: TDateTime): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Go_Numbs where KdSbu = :nKdSbu and ' +
            ' (DtBeg is Null or DtBeg <= :dOnDate) ' +
            ' order by DtBeg desc, NR desc');
    ParamByName('nKdSbu').AsInteger   := nKdSbu;
    ParamByName('dOnDate').AsDateTime := dOnDate;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('GoNr').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewSignNR: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(Nr_All_Sign, 1) NewNR from rdb$database');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetMinZp2(dOnDate: TDateTime): double;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from z_TPdn where DtBeg <= :dOnDate ' +
            ' order by DtBeg desc');
    ParamByName('dOnDate').AsDateTime := dOnDate;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('MinZp2').AsFloat;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetSchInfByKdSch(nKdSch: SmallInt;
                                   var cSch_17, cSchBU, cNmSch: ShortString;
                                                  var bHsCh: boolean): SmallInt;
begin
  Result := -1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_Sbu where KdSch = :nKdSch');
    ParamByName('nKdSch').AsInteger := nKdSch;
    Open;
    if RecordCount > 0 then begin
      cSchBU  := FieldByName('SchBU').AsString;
      cSch_17 := FieldByName('Sch_17').AsString;
      bHsCh   := FieldByName('HsCh').AsBoolean;
      Result  := FieldByName('KdSch').AsInteger;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.SchBU2Sch_17(cSchBU: ShortString; var nKdSch: SmallInt;
  var cSch_17, cPS_17: ShortString; var bHsCh: boolean): boolean;
begin
  Result := False;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_Sbu  where Sch_17 = :cSchBU ');
    ParamByName('cSchBU').AsString := cSchBU;
    Open;
    if RecordCount > 0 then begin
      nKdSch  :=  FieldByName('KdSch').AsInteger;
      cSch_17 := FieldByName('Sch_17').AsString;
      bHsCh   := FieldByName('HsCh').AsBoolean;
      cPS_17  := FieldByName('PS_17').AsString;
      Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.cSchBu2KdSch(cSch: ShortString): SmallInt;
var nKdSch : SmallInt;
begin
  Result := -1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_Sbu where SchBU = :cSch or Sch_17 = :cSch');
    ParamByName('cSch').AsString := cSch;
    Open;
    if RecordCount > 0 then begin
      nKdSch  :=  FieldByName('KdSch').AsInteger;
      Result := nKdSch;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetSpZByPere(nTabN: integer; dOnDate: TDateTime;
                        var nKdSpZ: SmallInt; var cSchBU: ShortString): boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 p.Dt_Beg, p.KdSpZ, s.Sch_17 ' +
            ' from z_Pere p Left Outer Join Kd_Sbu s on s.KdSch = p.KdSpZ ' +
            ' where p.TabN = :nTabN and p.Dt_Beg <= :dOnDate ' +
            ' order by Dt_Beg desc ');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dOnDate').AsDateTime := dOnDate;
    Open;
    if RecordCount > 0 then begin
      nKdSpZ := FieldByName('KdSpZ').AsInteger;
      cSchBU := FieldByName('Sch_17').AsString;
      Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;

end;
//------------------------------------------------------------------------------
function TForm_Dm.GetSpZByObj(nKdObj: SmallInt; var nKdSpZ: SmallInt;
                                             var cSchBU: ShortString): boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select o.*, s.Sch_17, s.NmSch from z_KdObj o ' +
            'Left Outer Join Kd_SBU s on s.KdSch = o.KdSPZ ' +
            'where o.KdObj = :nKdObj');
    ParamByName('nKdObj').AsInteger := nKdObj;
    Open;
    if RecordCount > 0 then begin
      nKdSpZ := FieldByName('KdSpZ').AsInteger;
      cSchBU := FieldByName('Sch_17').AsString;
      Result := true;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.NewTemuAIndx: SmallInt;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(AIndx) Max_AI from Kd_Temu');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('Max_AI').AsInteger + 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewTemuNr: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(Nr_Kd_Temu, 1) as NewNr from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNr').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewKdTemu: SmallInt;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(KdTemu_Kd_Temu, 1) as NewKdTemu from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewKdTemu').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.KdTemu2NmTemu(nKdTemu: SmallInt): ShortString;
begin
  Result := '';
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Kd_Temu ' +
            ' where KdTemu = :nKdTemu order by NR');
    ParamByName('nKdTemu').AsInteger := nKdTemu;
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NmSch').AsString;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;

end;
//------------------------------------------------------------------------------
{
function TForm_Dm.MyFirstWorkDate(gInMes: TDateTime): TDateTime;
begin
;
end;
}
//------------------------------------------------------------------------------
function TForm_Dm.GetNewNPPD: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_Id(K_NRPPD, 1) NewPPD from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewPPD').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewKmdOplNR: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_Id(NR_KOpl, 1) NewNR from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewKmdOstNR: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_Id(NR_KOst, 1) NewNR from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TForm_Dm.timerPGTimer(Sender: TObject);
begin
// TRY

end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewExpFssNR: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_Id(z_Exp_Fss_NR, 1) NewNR from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewIspSlg: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_Id(z_IspSlg_NR, 1) NewNR from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.GetNewpidzvNr: integer;
begin
  Result := 1;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_Id(zPidZv, 1) NewNR from rdb$DataBase');
    Open;
    if RecordCount > 0 then
      Result := FieldByName('NewNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

//Select KdStZ, ShStZ, HsCh from kd_stz where kdstz = 164
//------------------------------------------------------------------------------
function TForm_Dm.SchHsCh(nKdSch: SmallInt;
         var cHsCh, cSchBU, cSch_17, cNmSch: ShortString): boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Kd_Sbu where KdSch = :nKdSch');
    ParamByName('nKdSch').AsInteger := nKdSch;
    Open;
    if RecordCount > 0 then begin
      Result  := true;
      cHsCh   := FieldByName('HsCh').AsString;
      cSchBU  := FieldByName('SchBU').AsString;
      cSch_17 := FieldByName('Sch_17').AsString;
      cNmSch  := FieldByName('NmSch').AsString;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TForm_Dm.StzHsCh(nKdStZ: SmallInt; var cHsCh: ShortString): boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select KdStZ, ShStZ, HsCh from kd_stz where kdstz = :nKdStZ');
    ParamByName('nKdStZ').AsInteger := nKdStZ;
    Open;
    if RecordCount > 0 then begin
      Result  := true;
      cHsCh   := FieldByName('HsCh').AsString;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;

end.

