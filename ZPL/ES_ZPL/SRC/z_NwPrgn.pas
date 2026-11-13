unit z_NwPrgn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, Grids, DBGrids, DB, DBTables, StdCtrls, ComCtrls,
  ExtCtrls;

type
  string1  = string[1];
  string4  = string[4];
  string10 = string[10];
  string15 = string[15];
  TFormNewPeregonu = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    qryUpiPere: TQuery;
    dsrcUpiPere: TDataSource;
    dbgrUpiPere: TDBGrid;
    Panel2: TPanel;
    sBtnClearNewBD: TSpeedButton;
    sBtnOpenOldUpiPere: TSpeedButton;
    qryTmp: TQuery;
    PanelWait: TPanel;
    sBtnFillNewBD: TSpeedButton;
    qryUpiPereTABN: TBCDField;
    qryUpiPereOBJ: TBCDField;
    qryUpiPereVED: TBCDField;
    qryUpiPereBRIG: TBCDField;
    qryUpiPereKATPREM: TBCDField;
    qryUpiPereFAM: TStringField;
    qryUpiPereIMA: TStringField;
    qryUpiPereOTCH: TStringField;
    qryUpiPereDOLGNOST: TStringField;
    qryUpiPereRAZR: TBCDField;
    qryUpiPereRANG: TBCDField;
    qryUpiPereINVALID: TBCDField;
    qryUpiPerePR_PENS: TBCDField;
    qryUpiPerePOL: TStringField;
    qryUpiPereSOVM: TBCDField;
    qryUpiPereSZATRO: TStringField;
    qryUpiPereSO: TBCDField;
    qryUpiPereOKLTRFOLD: TBCDField;
    qryUpiPereOKLTRF: TBCDField;
    qryUpiPereAVANS: TBCDField;
    qryUpiPereND: TBCDField;
    qryUpiPerePDNLG: TBCDField;
    qryUpiPereKOLMIN: TBCDField;
    qryUpiPereMSNLG: TBCDField;
    qryUpiPereSTR: TBCDField;
    qryUpiPereSBERK: TBCDField;
    qryUpiPereKRD: TBCDField;
    qryUpiPereALM: TBCDField;
    qryUpiPereISPL: TBCDField;
    qryUpiPerePEREVOD: TBCDField;
    qryUpiPereSSUDA: TBCDField;
    qryUpiPerePRFS: TBCDField;
    qryUpiPerePRUDERG: TBCDField;
    qryUpiPereDPRIEM: TDateField;
    qryUpiPereDUVOLN: TDateField;
    qryUpiPerePRUV: TBCDField;
    qryUpiPereD13ZP: TDateField;
    qryUpiPereDVUSL: TDateField;
    qryUpiPereSRDPRM91: TBCDField;
    qryUpiPereNR_PRIKP: TStringField;
    qryUpiPereDT_PRIKP: TDateField;
    qryUpiPereNR_PRIKU: TStringField;
    qryUpiPereDT_PRIKU: TDateField;
    qryUpiPereIDENT: TStringField;
    qryUpiPereDROJD: TDateField;
    qryUpiPereDEKR: TBCDField;
    qryUpiPereLS: TStringField;
    qryUpiPereLGOTA: TBCDField;
    qryUpiPereTABN_1: TBCDField;
    qryUpiPereDT_BEG: TDateField;
    qryUpiPereDT_END: TDateField;
    qryUpiPereOBJ_1: TBCDField;
    qryUpiPereVED_1: TBCDField;
    qryUpiPereSO_1: TBCDField;
    qryUpiPereOKLTRF_1: TBCDField;
    qryUpiPereSZATR: TStringField;
    qryUpiPereKAT: TBCDField;
    qryUpiPereDOLGNOST_1: TStringField;
    qryUpiPereNR_PRIKAZA: TStringField;
    qryUpiPereDT_PRIKAZA: TDateField;
    qryPere: TQuery;
    updPere: TUpdateSQL;
    qryPereNR: TIntegerField;
    qryPereKDSPS: TSmallintField;
    qryPereTABN: TIntegerField;
    qryPereDT_BEG: TDateTimeField;
    qryPereKDOBJ: TSmallintField;
    qryPereKDKATP: TSmallintField;
    qryPerePRCWRKTIME: TFloatField;
    qryPereSO: TSmallintField;
    qryPereOKLTRF: TFloatField;
    qryPereAVANS: TFloatField;
    qryPereSP_AV: TStringField;
    qryPereKDDOLGN: TSmallintField;
    qryPereDOLGNOST: TStringField;
    qryPereKDSPZ: TSmallintField;
    qryPerePR_PENS: TSmallintField;
    qryPereSOVM: TSmallintField;
    qryPerePDNLG: TSmallintField;
    qryPerePROCLG: TFloatField;
    qryPereKOLMIN: TSmallintField;
    qryPerePRFS: TSmallintField;
    qryPereNR_PRIKAZA: TStringField;
    qryPereDT_PRIKAZA: TDateTimeField;
    qryPereNOTES: TStringField;
    qryPereINV: TSmallintField;
    qryPereRANG: TSmallintField;
    qryPereRAZR: TSmallintField;
    qryPereDT_END: TDateTimeField;
    qryPereOLDKDOBJ: TSmallintField;
    qryPerePRDEKR: TStringField;
    qryPereCMBOKL: TStringField;
    qryPereSPEC_NR: TIntegerField;
    qryUpi: TQuery;
    updUpi: TUpdateSQL;
    qryPrmUv: TQuery;
    updPrmUv: TUpdateSQL;
    qryOldNadb: TQuery;
    dsrcOldNadb: TDataSource;
    dbgrOldNadb: TDBGrid;
    qryNadb: TQuery;
    updNadb: TUpdateSQL;
    Panel3: TPanel;
    sBtnNadbDbf: TSpeedButton;
    sBtnClearZNadb: TSpeedButton;
    sBtnFillZNadb: TSpeedButton;
    qryOldNadbTABN: TBCDField;
    qryOldNadbVIDN: TBCDField;
    qryOldNadbSUMPROC: TBCDField;
    qryOldNadbSP: TStringField;
    qryOldNadbDT_BEG: TDateField;
    qryOldNadbDT_END: TDateField;
    qryOldNadbSZATR: TStringField;
    qryOldNadbOBJ: TBCDField;
    qryOldNadbVED: TBCDField;
    qryOldNadbKAT: TBCDField;
    qryOldNadbDOLGNOST: TStringField;
    qryOldNadbNR_PRIKAZA: TStringField;
    qryOldNadbDT_PRIKAZA: TDateField;
    qryOldNadbNR_PRIKEND: TStringField;
    qryOldNadbDT_PRIKEND: TDateField;
    qryOZS: TQuery;
    qryOZSNR: TIntegerField;
    qryOZSSZATR: TStringField;
    qryOZSKDSBU: TIntegerField;
    qryOZSSCHBU: TStringField;
    qryOZSNOTE: TStringField;
    Panel4: TPanel;
    sBtnOpenNU: TSpeedButton;
    sBtnClearZNU: TSpeedButton;
    sBtnFillZNU: TSpeedButton;
    dbgrOldNU: TDBGrid;
    qryOldNU: TQuery;
    dsrcOldNU: TDataSource;
    qryZNu: TQuery;
    updZNu: TUpdateSQL;
    qryZNuNR: TIntegerField;
    qryZNuKDSPS: TSmallintField;
    qryZNuDTPROC: TDateTimeField;
    qryZNuZAMESGOD: TDateTimeField;
    qryZNuTABN: TIntegerField;
    qryZNuVIDN: TStringField;
    qryZNuOLDKDVIDN: TSmallintField;
    qryZNuKDVIDN: TSmallintField;
    qryZNuCHAS: TFloatField;
    qryZNuSUMMA: TFloatField;
    qryZNuOLDKDOBJ: TSmallintField;
    qryZNuKDOBJ: TSmallintField;
    qryZNuKDKATP: TSmallintField;
    qryZNuDT_BEG: TDateTimeField;
    qryZNuDT_END: TDateTimeField;
    qryZNuKDSPZ: TSmallintField;
    qryZNuPDN: TSmallintField;
    qryZNuNOTES: TStringField;
    qryZNuPRR: TSmallintField;
    qryZNuPRPV: TSmallintField;
    qryZNuKTO: TSmallintField;
    qryZNuPRKR: TSmallintField;
    qryZNuMYNOTES: TStringField;
    qryZNuSPECPS: TIntegerField;
    qryZNuSPEC_NR: TIntegerField;
    sBtnUpdUpi: TSpeedButton;
    qryOldNUNuDb: TStringField;
    qryOldNUFileNu: TStringField;
    qryOldNUTABN: TFloatField;
    qryOldNUOBJ: TSmallintField;
    qryOldNUVED: TSmallintField;
    qryOldNUKAT: TSmallintField;
    qryOldNUDT_BEG: TDateField;
    qryOldNUDT_END: TDateField;
    qryOldNUVIDN: TSmallintField;
    qryOldNUPDN: TSmallintField;
    qryOldNUGODN: TSmallintField;
    qryOldNUMESN: TSmallintField;
    qryOldNUCHAS: TFloatField;
    qryOldNUSUMMA: TFloatField;
    qryOldNUSUM8DR: TFloatField;
    qryOldNUSZATR: TStringField;
    qryOldNUOTKUDA: TStringField;
    qryOldNUPRR: TSmallintField;
    qryOldNUPRPV: TSmallintField;
    qryOldNUKTO: TSmallintField;
    qryOldNUPRKR: TSmallintField;
    sBtnSetYear: TSpeedButton;
    LabelYearNU: TLabel;
    qryOldSps: TQuery;
    dsrcOldSps: TDataSource;
    dbgrOldSps: TDBGrid;
    Panel5: TPanel;
    sBtNOpenOldSps: TSpeedButton;
    sBtnClearSps: TSpeedButton;
    sBtnFillSps: TSpeedButton;
    sBtnYearSps: TSpeedButton;
    LabelYearSps: TLabel;
    qryZSps: TQuery;
    updZSps: TUpdateSQL;
    Panel6: TPanel;
    sBtNOpenOldOtkl: TSpeedButton;
    SpeedButton2: TSpeedButton;
    sBtnFillZOtkl: TSpeedButton;
    sBtnYearOtkl: TSpeedButton;
    LabelYearOtkl: TLabel;
    dbgrOldOtkl: TDBGrid;
    qryOldOtkl: TQuery;
    dsrcOldOtkl: TDataSource;
    qryZOtkl: TQuery;
    updZOtkl: TUpdateSQL;
    TabSheet1: TTabSheet;
    qryOldGrOtp: TQuery;
    qryZVOtp: TQuery;
    updZVOtp: TUpdateSQL;
    dsrcOldGrOtp: TDataSource;
    dbgrOldGrOtp: TDBGrid;
    Panel7: TPanel;
    sBtnOpenGrOtp: TSpeedButton;
    sBtnClearZOtp: TSpeedButton;
    sBtnFillZVOtp: TSpeedButton;
    procedure sBtnClearNewBDClick(Sender: TObject);
    procedure sBtnOpenOldUpiPereClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sBtnFillNewBDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnNadbDbfClick(Sender: TObject);
    procedure sBtnClearZNadbClick(Sender: TObject);
    procedure sBtnFillZNadbClick(Sender: TObject);
    procedure sBtnOpenNUClick(Sender: TObject);
    procedure sBtnClearZNUClick(Sender: TObject);
    procedure sBtnFillZNUClick(Sender: TObject);
    procedure sBtnUpdUpiClick(Sender: TObject);
    procedure sBtnSetYearClick(Sender: TObject);
    procedure sBtnYearSpsClick(Sender: TObject);
    procedure sBtNOpenOldSpsClick(Sender: TObject);
    procedure sBtnClearSpsClick(Sender: TObject);
    procedure sBtnFillSpsClick(Sender: TObject);
    procedure sBtnYearOtklClick(Sender: TObject);
    procedure sBtNOpenOldOtklClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sBtnFillZOtklClick(Sender: TObject);
    procedure sBtnOpenGrOtpClick(Sender: TObject);
    procedure sBtnClearZOtpClick(Sender: TObject);
    procedure sBtnFillZVOtpClick(Sender: TObject);
  private
    { Private declarations }
    cYearNu : string;
    nYearNU : word;
    dDtBegNU, dDtEndNU : TDateTime;
    function OldSZatr2KdSbu(nVidN : integer; cSZatr : string) : integer;
    procedure AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj,
                                              nOldKdObj, nKdDolgn : integer;
                        dDt_Beg : TDateTime;
                      cKdKatP, cSO, cOklTrf, cAvans, cSpAv, cNmDolgn, cPrPens,
                    cSovm, cPdNlg, cProcLg, cKolMin, cPrfs,
                  cNrPrikaza, cDtPrikaza, cNotes, cInv, cRang, cRazr : string);
    procedure AddRecUpi(nTabN : integer; cFam, cIma, cOtch,  cDtRogd : string;
                                               cPol : String1; cID : string10);
    procedure AddRecPrmUv(nKdSps, nTabN : integer;
                                    dDtPrm, dDtUv : TDateTime; cNotes : string);
    procedure AddRecNadb(nKdSps, nTabN, nKdObj, nOldKdObj, nSpsRsch,
                                          nKdSpZ : integer; cVidN : string4;
                    cOldKdVidN, cSumProc, cSP, cDt_Beg, cDt_End, cKat : string);
    procedure AddRecToZNu(dDtProc, dZaMesGod : TDateTime;
                              nKdSps, nTabN, nKdObj, nKdSpZ,
                                         nOldKdObj, nOldVidN : integer;
                            cVidN, cKdKatP, cChas, cSumma, cDt_Beg, cDt_End,
                    cPdn, cNotes, cPrr, cPrPv, cKto, cPrKr, cMyNotes : string);
    procedure AddRecToZSps(dDtProc : TDateTime;
                                    nKdSps, nTabN, nKdObj, nOldKdObj : integer;
                                                               cNotes : string);
    procedure AddRecToZOtkl(dDtProc, dZaMesGod : TDateTime;
                              nKdSps, nTabN, nKdObj, nKdSpZ,
                                         nOldKdObj, nOldVidN : integer;
                            cVidN, cKdKatP, cChas, cSumma, cDt_Beg, cDt_End,
                    cPdn, cNotes, cPrr, cPrPv, cKto, cPrKr, cMyNotes : string);
    procedure AddRecToZVOtp(nKdSps, nTabN : integer;
               cVidN, cRK, cNrPrik, cDtPrik, cDtBeg, cCntDays, cNotes : string);
  public
    { Public declarations }
  end;

procedure NewPeregonuShow;

const SECTION = 'z_NwPrgn';

var
  FormNewPeregonu: TFormNewPeregonu;

implementation


{$R *.dfm}

//------------------------------------------------------------------------------
procedure NewPeregonuShow;
begin
  FormNewPeregonu := TFormNewPeregonu.Create(Application);
  with FormNewPeregonu do begin
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.FormResize(Sender: TObject);
begin
  PanelWait.Top  := Round((Height - PanelWait.Height) / 2) - 30;
  PanelWait.Left := Round((Width - PanelWait.Width) / 2);
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnOpenOldUpiPereClick(Sender: TObject);
begin
  PanelWait.Visible := true;
  Application.ProcessMessages;
  qryUpiPere.Open;
  PanelWait.Visible := false;
  Application.ProcessMessages;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnClearNewBDClick(Sender: TObject);
begin
  ShowMessage('Не забыть после выполнения сделать ' +
                                    ' BackUp и Restore BD Es_Zpl.gdb');
  PanelWait.Visible := true;
  Application.ProcessMessages;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Delete from Z_UPI');  // при этом триггер почистит все Z_Alimenty,
      // Z_Nadb, Z_Pere, Z_Sps, Uderg, Z_Otkl, Z_VOtp, Z_VBln, z_Nu
      // where TabN = Z_Upi.TabN;
    ExecSQL;
    SQL.Clear;
    SQL.Add('Set generator NR_ZUPI TO 0');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  PanelWait.Visible := false;
  Application.ProcessMessages;
  ShowMessage('Надо сделать BackUp и Restore BD Es_Zpl.gdb');
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnFillNewBDClick(Sender: TObject);
var nKdSps, nTabN, nKdSpZ, nKdObj, nOldKdObj, nOldObj, nOldVed, nKdDolgn : integer;
    cFam, cIma, cOtch, cDtRogd, cKdKatP, cSO, cOklTrf, cAvans, cSpAv,
       cNmDolgn, cPrPens, cSovm, cPdNlg, cProcLg, cKolMin, cPrfs,
         cNrPrikaza, cDtPrikaza, cNotes, cInv, cRang, cRazr : string;
    cPol : string1;
    cID : string10;
    cLicSch : string15;
    dDtPrm, dDtUv, dDt_Beg : TDateTime;
    bIsDtPrm : boolean;
    nOklTrf, nAvans : double;
begin
  with qryOZS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_OZS');
    Open;
  end;
  with qryUpi do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_Upi');
    Open;
  end;
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_Pere');
    Open;
  end;
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_PrmUv');
    Open;
  end;
  with qryUpiPere do begin
    if not Active then Open;
    First;
    while not Eof do begin
      nKdSps  := 1;
      nTabN   := FieldByName('TabN').AsInteger;
      cFam    := FieldByName('Fam').AsString;
      cIma    := FieldByName('Ima').AsString;
      cOtch   := FieldByName('Otch').AsString;
      cDtRogd := FieldByName('DRojd').AsString;
      if not MyEmptyDate(FieldByName('DPriem').AsString) then
        dDtPrm  := FieldByName('DPriem').AsDateTime
      else
        dDtPrm := 0;
      dDtUv   := FieldByName('DUvoln').AsDateTime;
      if (FieldByName('Pol').AsString = 'М') or
                       (FieldByName('Pol').AsString = 'Ч') then
        cPol := 'М'
      else if (FieldByName('Pol').AsString = 'Ж') then
        cPol := 'Ж'
      else
        cPol := '';
      cID := FieldByName('Ident').AsString;
      cLicSch := FieldByName('LS').AsString;
      // Это уже можно записать в Z_UPI
      bIsDtPrm := (dDtPrm <> 0);
      if not Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.StartTransaction;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        if not bIsDtPrm and not
                         MyEmptyDate(FieldByName('Dt_Beg').AsString) then begin
          dDtPrm := FieldByName('Dt_Beg').AsDateTime;
          bIsDtPrm := true;
        end;
        nOldObj    := FieldByName('Obj_1').AsInteger;
        nOldVed    := FieldByName('Ved_1').AsInteger;
        if (FieldByName('Obj_1').AsInteger < 10) then
          nOldKdObj  := FieldByName('Obj_1').AsInteger * 1000 +
                                           FieldByName('Ved_1').AsInteger
        else
          nOldKdObj  := FieldByName('Obj_1').AsInteger;
        nKdObj     := DmMain.OldOV2KdObj(nOldObj, nOldVed);
        nKdSpZ     := OldSZatr2KdSbu(0, FieldByName('SZatr').AsString);
        dDt_Beg    := FieldByName('Dt_Beg').AsDateTime;
        cKdKatP    := FieldByName('Kat').AsString;
        cSO        := FieldByName('SO_1').AsString;
        cOklTrf    := FieldByName('OklTrf_1').AsString;
        cAvans     := FieldByName('Avans').AsString;
        if (cAvans <> '') and (cAvans <> '0') then
          cSpAv := '%'
        else
          cSpAv := '';
        cNmDolgn   := FieldByName('Dolgnost_1').AsString;
        nKdDolgn   := DmMain.Dolgn2KdDolgn(cNmDolgn);
        cPrPens    := FieldByName('Pr_Pens').AsString;
        cSovm      := FieldByName('Sovm').AsString;
        cPdNlg     := FieldByName('PdNlg').AsString;
        cProcLg    := FieldByName('Lgota').AsString;
        cKolMin    := FieldByName('KolMin').AsString;
        cPrfs      := FieldByName('Prfs').AsString;
        cNrPrikaza := FieldByName('Nr_Prikaza').AsString;
        cDtPrikaza := FieldByName('Dt_Prikaza').AsString;
        cNotes     := 'FromOldZp';
        cInv       := FieldByName('Invalid').AsString;
        cRang      := FieldByName('Rang').AsString;
        cRazr      := FieldByName('Razr').AsString;
        AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj, nOldKdObj, nKdDolgn,
                   dDt_Beg, cKdKatP, cSO, cOklTrf,
                     cAvans, cSpAv, cNmDolgn, cPrPens, cSovm,
                       cPdNlg, cProcLg, cKolMin, cPrfs, cNrPrikaza, cDtPrikaza,
                          cNotes, cInv, cRang, cRazr);
        Next;
      end;
      AddRecUpi(nTabN, cFam, cIma, cOtch, cDtRogd, cPol, cID);
      AddRecPrmUv(0, nTabN, dDtPrm, dDtUv, cNotes);
      AddRecPrmUv(nKdSps, nTabN, dDtPrm, dDtUv, cNotes);
      qryPere.ApplyUpdates;
      qryPrmUv.ApplyUpdates;
      qryUpi.ApplyUpdates;
      if Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.Commit;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnUpdUpiClick(Sender: TObject);
var nKdSps, nTabN, nKdSpZ, nKdObj, nOldKdObj, nOldObj, nOldVed, nKdDolgn : integer;
    cFam, cIma, cOtch, cDtRogd, cKdKatP, cSO, cOklTrf, cAvans, cSpAv,
       cNmDolgn, cPrPens, cSovm, cPdNlg, cProcLg, cKolMin, cPrfs,
         cNrPrikaza, cDtPrikaza, cNotes, cInv, cRang, cRazr : string;
    cPol : string1;
    cID : string10;
    cLicSch : string15;
    dDtPrm, dDtUv, dDt_Beg : TDateTime;
    bIsDtPrm : boolean;
    nOklTrf, nAvans : double;
begin
  with qryOZS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_OZS');
    Open;
  end;
  with qryUpi do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_Upi');
    Open;
  end;
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_Pere');
    Open;
  end;
  with qryPrmUv do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_PrmUv');
    Open;
  end;
  with qryUpiPere do begin
    if not Active then Open;
    First;
    while not Eof do begin
      nTabN   := FieldByName('TabN').AsInteger;
      if qryUpi.Locate('TabN', nTabN, []) then begin
        while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
          Next;
          Continue;
        end;
      end;
      nKdSps  := 1;
      cFam    := FieldByName('Fam').AsString;
      cIma    := FieldByName('Ima').AsString;
      cOtch   := FieldByName('Otch').AsString;
      cDtRogd := FieldByName('DRojd').AsString;
      if not MyEmptyDate(FieldByName('DPriem').AsString) then
        dDtPrm  := FieldByName('DPriem').AsDateTime
      else
        dDtPrm := 0;
      dDtUv   := FieldByName('DUvoln').AsDateTime;
      if (FieldByName('Pol').AsString = 'М') or
                       (FieldByName('Pol').AsString = 'Ч') then
        cPol := 'М'
      else if (FieldByName('Pol').AsString = 'Ж') then
        cPol := 'Ж'
      else
        cPol := '';
      cID := FieldByName('Ident').AsString;
      cLicSch := FieldByName('LS').AsString;
      // Это уже можно записать в Z_UPI
      bIsDtPrm := (dDtPrm <> 0);
      if not Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.StartTransaction;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        if not bIsDtPrm and not
                         MyEmptyDate(FieldByName('Dt_Beg').AsString) then begin
          dDtPrm := FieldByName('Dt_Beg').AsDateTime;
          bIsDtPrm := true;
        end;
        nOldObj    := FieldByName('Obj_1').AsInteger;
        nOldVed    := FieldByName('Ved_1').AsInteger;
        if (FieldByName('Obj_1').AsInteger < 10) then
          nOldKdObj  := FieldByName('Obj_1').AsInteger * 1000 +
                                           FieldByName('Ved_1').AsInteger
        else
          nOldKdObj  := FieldByName('Obj_1').AsInteger;
        nKdObj     := DmMain.OldOV2KdObj(nOldObj, nOldVed);
        nKdSpZ     := OldSZatr2KdSbu(0, FieldByName('SZatr').AsString);
        dDt_Beg    := FieldByName('Dt_Beg').AsDateTime;
        cKdKatP    := FieldByName('Kat').AsString;
        cSO        := FieldByName('SO_1').AsString;
        cOklTrf    := FieldByName('OklTrf_1').AsString;
        cAvans     := FieldByName('Avans').AsString;
        if (cAvans <> '') and (cAvans <> '0') then
          cSpAv := '%'
        else
          cSpAv := '';
        cNmDolgn   := FieldByName('Dolgnost_1').AsString;
        nKdDolgn   := DmMain.Dolgn2KdDolgn(cNmDolgn);
        cPrPens    := FieldByName('Pr_Pens').AsString;
        cSovm      := FieldByName('Sovm').AsString;
        cPdNlg     := FieldByName('PdNlg').AsString;
        cProcLg    := FieldByName('Lgota').AsString;
        cKolMin    := FieldByName('KolMin').AsString;
        cPrfs      := FieldByName('Prfs').AsString;
        cNrPrikaza := FieldByName('Nr_Prikaza').AsString;
        cDtPrikaza := FieldByName('Dt_Prikaza').AsString;
        cNotes     := 'FromOldZp';
        cInv       := FieldByName('Invalid').AsString;
        cRang      := FieldByName('Rang').AsString;
        cRazr      := FieldByName('Razr').AsString;
        AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj, nOldKdObj, nKdDolgn,
                   dDt_Beg, cKdKatP, cSO, cOklTrf,
                     cAvans, cSpAv, cNmDolgn, cPrPens, cSovm,
                       cPdNlg, cProcLg, cKolMin, cPrfs, cNrPrikaza, cDtPrikaza,
                          cNotes, cInv, cRang, cRazr);
        Next;
      end;
      AddRecUpi(nTabN, cFam, cIma, cOtch, cDtRogd, cPol, cID);
      AddRecPrmUv(0, nTabN, dDtPrm, dDtUv, cNotes);
      AddRecPrmUv(nKdSps, nTabN, dDtPrm, dDtUv, cNotes);
      qryPere.ApplyUpdates;
      qryPrmUv.ApplyUpdates;
      qryUpi.ApplyUpdates;
      if Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.Commit;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.AddRecPrmUv(nKdSps, nTabN : integer;
                                    dDtPrm, dDtUv : TDateTime; cNotes : string);
begin
  with qryPrmUv do begin
    Append;
    FieldByName('KdSps').AsInteger       := nKdSps;
    FieldByName('TabN').AsInteger        := nTabN;
    FieldByName('Dt_Priem').AsDateTime   := dDtPrm;
    if dDtUv <> 0 then
      FieldByName('Dt_Uvoln').AsDateTime := dDtUv
    else
      FieldByName('Dt_Uvoln').AsString   := '';
    FieldByName('Notes').AsString        := cNotes;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.AddRecUpi(nTabN : integer;
                                        cFam, cIma, cOtch,  cDtRogd : string;
                                            cPol : String1; cID : string10);
begin
  with qryUpi do begin
    Append;
    FieldByName('TabN').AsInteger  := nTabN;
    FieldByName('Fam').AsString    := cFam;
    FieldByName('Ima').AsString    := cIma;
    FieldByName('Otch').AsString   := cOtch;
    FieldByName('DOB').AsString    := cDtRogd;
    FieldByName('Pol').AsString    := cPol;
    FieldByName('ID').AsString     := cID;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj,
                                              nOldKdObj, nKdDolgn : integer;
                        dDt_Beg : TDateTime;
                      cKdKatP, cSO, cOklTrf, cAvans, cSpAv, cNmDolgn, cPrPens,
                    cSovm, cPdNlg, cProcLg, cKolMin, cPrfs,
                  cNrPrikaza, cDtPrikaza, cNotes, cInv, cRang, cRazr : string);
begin
  with qryPere do begin
    Append;
    FieldByName('KdSps').AsInteger     := nKdSps;
    FieldByName('TabN').AsInteger      := nTabN;
    FieldByName('KdObj').AsInteger     := nKdObj;
    FieldByName('OldKdObj').AsInteger  := nOldKdObj;
    FieldByName('KdSpZ').AsInteger     := nKdSpZ;
    if nKdDolgn > 0 then
      FieldByName('KdDolgn').AsInteger := nKdDolgn
    else
      FieldByName('KdDolgn').AsString  := '';
    FieldByName('Dt_Beg').AsDateTime   := dDt_Beg;
    FieldByName('KdKatP').AsString     := cKdKatP;
    FieldByName('SO').AsString         := cSO;
    FieldByName('OklTrf').AsString     := cOklTrf;
    FieldByName('Avans').AsString      := cAvans;
    FieldByName('Sp_Av').AsString      := cSpAv;
    FieldByName('Dolgnost').AsString   := cNmDolgn;
    FieldByName('Pr_Pens').AsString    := cPrPens;
    FieldByName('Sovm').AsString       := cSovm;
    FieldByName('PdNlg').AsString      := cPdNlg;
    FieldByName('ProcLg').AsString     := cProcLg;
    FieldByName('KolMin').AsString     := cKolMin;
    FieldByName('Prfs').AsString       := cPrfs;
    FieldByName('Nr_Prikaza').AsString := cNrPrikaza;
    FieldByName('Dt_Prikaza').AsString := cDtPrikaza;
    FieldByName('Notes').AsString      := cNotes;
    FieldByName('Inv').AsString        := cInv;
    FieldByName('Rang').AsString       := cRang;
    FieldByName('Razr').AsString       := cRazr;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.FormCreate(Sender: TObject);
begin
  LabelYearNU.Caption := '';
  LabelYearSps.Caption := '';
  LabelYearOtkl.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 480);
    Width  := ReadInteger(SECTION, 'wW', 750);
    Free;
  end;
  PanelWait.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnNadbDbfClick(Sender: TObject);
begin
  qryOldNadb.Active := not qryOldNadb.Active;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnClearZNadbClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Delete from Z_Nadb');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
function TFormNewPeregonu.OldSZatr2KdSbu(nVidN : integer;
                                                   cSZatr : string) : integer;
begin
  Result := 0;
  if (cSZatr = '641') then begin
    if (nVidN = 350) or (nVidN = 351) then begin
      cSZatr := '641/01';
      Result := 1070; end
    else if (nVidN = 376) then begin
      cSZatr := '641/07';
      Result := 1073;
    end; end
  else if qryOZS.Locate('SZATR', cSZatr, []) then
    Result := qryOzsKdSbu.AsInteger;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnFillZNadbClick(Sender: TObject);
var nKdSps, nTabN, nOldObj, nOldVed,
    nKdObj, nOldKdObj, nSpsRsch, nKdSpZ : integer;
    cVidN : string4;
    cOldKdVidN, cSumProc, cSP, cDt_Beg, cDt_End, cKat : string;
begin
  with qryNadb do begin
    if not Active then begin
      SQL.Clear;
      DataBaseName := CESZPL;
      SQL.Add('Select * from Z_Nadb');
      Open;
    end;
  end;
  with qryOZS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_OZS');
    Open;
  end;
  with qryOldNadb do begin
    First;
    while not Eof do begin
      if not Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.StartTransaction;
      nTabN := FieldByName('TabN').AsInteger;
      nKdSps := 1;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        cVidN := DmMain.OldVidN2VidN(FieldByName('VidN').AsInteger);
        cOldKdVidN := FieldByName('VidN').AsString;
        cSumProc := FieldByName('SumProc').AsString;
        cSP := FieldByName('SP').AsString;
        if cSP = '%' then
          nSpsRsch := 2
        else
          nSpsRsch := 1;
        cDt_Beg := FieldByName('Dt_Beg').AsString;
        cDt_End := FieldByName('Dt_End').AsString;
        nOldObj := FieldByName('Obj').AsInteger;
        nOldVed := FieldByName('Ved').AsInteger;
        nKdSpZ := OldSZatr2KdSbu(FieldByName('VidN').AsInteger,
                                              FieldByName('SZatr').AsString);
        if (FieldByName('Obj').AsInteger < 10) then
          nOldKdObj := FieldByName('Obj').AsInteger * 1000 +
                                           FieldByName('Ved').AsInteger
        else
          nOldKdObj := FieldByName('Obj').AsInteger;
        nKdObj      := DmMain.OldOV2KdObj(nOldObj, nOldVed);
        cKat := FieldByName('Kat').AsString;
        AddRecNadb(nKdSps, nTabN, nKdObj, nOldKdObj, nSpsRsch, nKdSpZ,
                     cVidN, cOldKdVidN, cSumProc, cSP, cDt_Beg, cDt_End, cKat);
        Next;
      end;
      qryNadb.ApplyUpdates;
      if Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.Commit;
    end;
  end;
end;
{
  NR INTEGER,
  KDSPS SMALLINT,
  SPSRSCH SMALLINT,
  TABN INTEGER,
  VIDN CHAR(4),
  OLDKDVIDN SMALLINT,
  KDVIDN SMALLINT,
  SUMPROC DOUBLE PRECISION,
  SP VARCHAR(1),
  PRCSOVM DOUBLE PRECISION,
  DT_BEG TIMESTAMP,
  DT_END TIMESTAMP,
  OLDKDOBJ SMALLINT,
  KDOBJ SMALLINT,
  KDKATP SMALLINT,
  PRCHS VARCHAR(1),
  PRSMM VARCHAR(1),
  KDSPZ SMALLINT,
  SPEC_NR INTEGER
}
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.AddRecNadb(nKdSps, nTabN, nKdObj, nOldKdObj,
                                   nSpsRsch, nKdSpZ : integer; cVidN : string4;
                    cOldKdVidN, cSumProc, cSP, cDt_Beg, cDt_End, cKat : string);
begin
  with qryNadb do begin
    Append;
    FieldByName('KdSps').AsInteger    := nKdSps;
    FieldByName('TabN').AsInteger     := nTabN;
    FieldByName('KdObj').AsInteger    := nKdObj;
    FieldByName('OldKdObj').AsInteger := nOldKdObj;
    FieldByName('SpsRsch').AsInteger  := nSpsRsch;
    FieldByName('VidN').AsString      := cVidN;
    FieldByName('OldKdVidN').AsString := cOldKdVidN;
    FieldByName('SumProc').AsString   := cSumProc;
    FieldByName('SP').AsString        := cSP;
    FieldByName('KdSpZ').AsInteger    := nKdSpZ;
    FieldByName('Dt_Beg').AsString    := cDt_Beg;
    FieldByName('Dt_End').AsString    := cDt_End;
    FieldByName('KdKatP').AsString    := cKat;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnSetYearClick(Sender: TObject);
begin
  if InputQuery('Выбор года (2000-2005)',
                 'Введите год для перегона NU:', cYearNU) and
                                                 (cYearNU <> '') then begin
    LabelYearNU.Caption := cYearNU;
    nYearNU := StrToInt(cYearNU);
    dDtBegNU := EncodeDate(nYearNU, 1, 1);
    dDtEndNU := EncodeDate(nYearNU, 12, 1);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnOpenNUClick(Sender: TObject);
var cNuDB : string;
begin
  cNuDB := 'Nu' + cYearNU;
  with qryOldNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := 'ZY_PDX9305';
    SQL.Add('Select * from nu_00_05 where NuDB = :cNuDB ' +
            ' order by TabN, FileNU, GodN, MesN, VidN');
    ParamByName('cNuDB').AsString := cNuDB;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnClearZNUClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Delete from Z_NU where DtProc >= :dDtBegNu and ' +
                                       ' DtProc <= :dDtEndNu');
    ParamByName('dDtBegNu').AsDateTime := dDtBegNu;
    ParamByName('dDtEndNu').AsDateTime := dDtEndNu;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnFillZNUClick(Sender: TObject);
var dDtProc, dZaMesGod : TDateTime;
    nKdSps, nTabN, nKdObj, nKdSpZ : integer;
    cVidN, cKdKatP, cChas, cSumma, cDt_Beg, cDt_End, cPdn, cNotes,
                              cPrr, cPrPv, cKto, cPrKr, cMyNotes : string;
    cNuFile : string;
    nY, nM, nD : word;
    nOldObj, nOldVed, nOldKdObj, nOldVidN : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Alter INDEX Z_NU_DTP INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_NU_DTP_TABN INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_NU_DTP2 INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_NU_DTPVIDN INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_NU_NR INACTIVE');
    ExecSQL;
  end;
  if Form_Dm.DbZpl.InTransaction then
    Form_Dm.DbZpl.Rollback;
  with qryOZS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_OZS');
    Open;
  end;
  with qryZNu do begin
    if not Active then Open;
  end;
  with qryOldNU do begin
    if not Active then Open;
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      if not Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.StartTransaction;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        cNuFile := FieldByName('FileNu').AsString;
        // Тут речь идет только о годах >= 2000
        nY := 2000 + StrToInt(Copy(cNuFile, 5, 2));
        nM := StrToInt(Copy(cNuFile, 3, 2));
        nD := 1;
        dDtProc   := EnCodeDate(nY, nM, nD);
        dZaMesGod := EnCodeDate(FieldByName('GodN').AsInteger,
                                   FieldByName('MesN').AsInteger, 1);
        nKdSps  := 1;
        nOldObj := FieldByName('Obj').AsInteger;
        nOldVed := FieldByName('Ved').AsInteger;
        if (FieldByName('Obj').AsInteger < 10) then
          nOldKdObj := FieldByName('Obj').AsInteger * 1000 +
                                           FieldByName('Ved').AsInteger
        else
          nOldKdObj := FieldByName('Obj').AsInteger;
        nKdObj      := DmMain.OldOV2KdObj(nOldObj, nOldVed);
        nKdSpZ := OldSZatr2KdSbu(FieldByName('VidN').AsInteger,
                                              FieldByName('SZatr').AsString);
        cKdKatP := FieldByName('Kat').AsString;
        cVidN := DmMain.OldVidN2VidN(FieldByName('VidN').AsInteger);
        nOldVidN  := FieldByName('VidN').AsInteger;
        cChas     := FieldByName('Chas').AsString;
        cSumma    := FieldByName('Summa').AsString;
        cDt_Beg   := FieldByName('Dt_Beg').AsString;
        cDt_End   := FieldByName('Dt_End').AsString;
        cPdn      := FieldByName('Pdn').AsString;
        cNotes    := FieldByName('Otkuda').AsString;
        cPrr      := FieldByName('Prr').AsString;
        cPrPv     := FieldByName('PrPv').AsString;
        cKto      := FieldByName('Kto').AsString;
        cPrKr     := FieldByName('PrKr').AsString;
        cMyNotes  := 'FromOldZp';
        AddRecToZNu(dDtProc, dZaMesGod, nKdSps, nTabN, nKdObj, nKdSpZ,
                      nOldKdObj, nOldVidN,
                  cVidN, cKdKatP, cChas, cSumma, cDt_Beg, cDt_End, cPdn, cNotes,
                      cPrr, cPrPv, cKto, cPrKr, cMyNotes);
        Next;
      end;
      qryZNu.ApplyUpdates;
      if Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.Commit;
    end;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Alter INDEX Z_NU_DTP ACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_NU_DTP_TABN ACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_NU_DTP2 ACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_NU_DTPVIDN ACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_NU_NR ACTIVE');
    ExecSQL;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.AddRecToZNu(dDtProc, dZaMesGod : TDateTime;
                              nKdSps, nTabN, nKdObj, nKdSpZ,
                                         nOldKdObj, nOldVidN : integer;
                            cVidN, cKdKatP, cChas, cSumma, cDt_Beg, cDt_End,
                    cPdn, cNotes, cPrr, cPrPv, cKto, cPrKr, cMyNotes : string);
begin
  with qryZNu do begin
    Append;
    FieldByName('KDSPS').AsInteger     := nKdSps;
    FieldByName('DTPROC').AsDateTime   := dDtProc;
    FieldByName('ZAMESGOD').AsDateTime := dZaMesGod;
    FieldByName('TABN').AsInteger      := nTabN;
    FieldByName('VIDN').AsString       := cVidN;
    FieldByName('OLDKDVIDN').AsInteger := nOldVidN;
    FieldByName('CHAS').AsString       := cChas;
    FieldByName('SUMMA').AsString      := cSumma;
    FieldByName('OLDKDOBJ').AsInteger  := nOldKdObj;
    FieldByName('KDOBJ').AsInteger     := nKdObj;
    FieldByName('KDKATP').AsString     := cKdKatP;
    FieldByName('DT_BEG').AsString     := cDt_Beg;
    FieldByName('DT_END').AsString     := cDt_End;
    FieldByName('KDSPZ').AsInteger     := nKdSpZ;
    FieldByName('PDN').AsString        := cPdn;
    FieldByName('NOTES').AsString      := cNotes;
    FieldByName('PRR').AsString        := cPrr;
    FieldByName('PRPV').AsString       := cPrPv;
    FieldByName('KTO').AsString        := cKto;
    FieldByName('PRKR').AsString       := cPrKr;
    FieldByName('MYNOTES').AsString    := cMyNotes;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnYearSpsClick(Sender: TObject);
begin
  if InputQuery('Выбор года (2000-2005)',
                 'Введите год для перегона SPS:', cYearNU) and
                                                 (cYearNU <> '') then begin
    LabelYearSps.Caption := cYearNU;
    nYearNU := StrToInt(cYearNU);
    dDtBegNU := EncodeDate(nYearNU, 1, 1);
    dDtEndNU := EncodeDate(nYearNU, 12, 1);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtNOpenOldSpsClick(Sender: TObject);
var cSpsDB : string;
begin
  cSpsDB := 'sps' + cYearNU;
  with qryOldSps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := 'ZY_PDX9305';
    SQL.Add('Select * from sp_00_05 where SpsDB = :cSpsDB ' +
            ' order by FileSps, Obj, Ved, TabN');
    ParamByName('cSpsDB').AsString := cSpsDB;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnClearSpsClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    // Предварительно ДеАктивировать триггеры и индексы
    SQL.Add('Alter TRIGGER ZSPS_BD INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Delete from Z_Sps where DtProc >= :dDtBegNu and ' +
                                   ' DtProc <= :dDtEndNu');
    ParamByName('dDtBegNu').AsDateTime := dDtBegNu;
    ParamByName('dDtEndNu').AsDateTime := dDtEndNu;
    ExecSQL;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Alter INDEX Z_SPS_OBJDTPROC INACTIVE');
    ExecSQL;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnFillSpsClick(Sender: TObject);
var cFileSps, cNotes : string;
    nOldObj, nOldVed, nOldKdObj, nKdObj, nKdSps, nTabN : integer;
    nY, nM, nD : word; dDtProc : TDateTime;
begin
  if Form_Dm.DbZpl.InTransaction then
    Form_Dm.DbZpl.Rollback;
  if not qryZSps.Active then
    qryZSps.Open;
  with qryOldSps do begin
    First;
    while not Eof do begin
      nOldObj := FieldByName('Obj').AsInteger;
      nOldVed := FieldByName('Ved').AsInteger;
      if (FieldByName('Obj').AsInteger < 10) then
        nOldKdObj := FieldByName('Obj').AsInteger * 1000 +
                                           FieldByName('Ved').AsInteger
      else
        nOldKdObj := FieldByName('Obj').AsInteger;
      nKdObj      := DmMain.OldOV2KdObj(nOldObj, nOldVed);
      if not Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.StartTransaction;
      while (FieldByName('Obj').AsInteger = nOldObj) and
                   (FieldByName('Ved').AsInteger = nOldVed) and not Eof do begin
        nTabN := FieldByName('TabN').AsInteger;
        cFileSps := FieldByName('FileSps').AsString;
        // Тут речь идет только о годах >= 2000
        nY := 2000 + StrToInt(Copy(cFileSps, 6, 2));
        nM := StrToInt(Copy(cFileSps, 4, 2));
        nD := 1;
        dDtProc := EnCodeDate(nY, nM, nD);
        nKdSps  := 1;
        cNotes  := 'FromOldZpl';
        AddRecToZSps(dDtProc, nKdSps, nTabN, nKdObj, nOldKdObj, cNotes);
        Next;
      end;
      qryZSps.ApplyUpdates;
      if Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.Commit;
    end;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Alter INDEX Z_SPS_OBJDTPROC ACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter TRIGGER ZSPS_BD ACTIVE');
    ExecSQL;
    SQL.Clear;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.AddRecToZSps(dDtProc : TDateTime;
                                    nKdSps, nTabN, nKdObj, nOldKdObj : integer;
                                                               cNotes : string);
begin
  with qryZSps do begin
    Append;
    FieldByName('KdSps').AsInteger := nKdSps;
    FieldByName('NCH').AsString := '+';
    FieldByName('DtProc').AsDateTime := dDtProc;
    FieldByName('TabN').AsInteger := nTabN;
    FieldByName('KdObj').AsInteger := nKdObj;
    FieldByName('Notes').AsString := cNotes;
    FieldByName('OldKdObj').AsInteger := nOldKdObj;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnYearOtklClick(Sender: TObject);
begin
  if InputQuery('Выбор года (2000-2005)',
                 'Введите год для перегона OTKL:', cYearNU) and
                                                 (cYearNU <> '') then begin
    LabelYearOtkl.Caption := cYearNU;
    nYearNU := StrToInt(cYearNU);
    dDtBegNU := EncodeDate(nYearNU, 1, 1);
    dDtEndNU := EncodeDate(nYearNU, 12, 1);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtNOpenOldOtklClick(Sender: TObject);
var cOtklDB : string;
begin
  cOtklDB := 'Otkl' + cYearNU;
  with qryOldOtkl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := 'ZY_PDX9305';
    SQL.Add('Select * from ot_00_05 where OtklDB = :cOtklDB ' +
            ' order by TabN, FileOtkl, VidN');
    ParamByName('cOtklDB').AsString := cOtklDB;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.SpeedButton2Click(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    // Предварительно ДеАктивировать триггеры и индексы
    SQL.Add('Alter TRIGGER ZOTKL_AI INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter TRIGGER ZOTKL_AU INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter TRIGGER ZOTKL_BD INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Delete from Z_Otkl where DtProc >= :dDtBegNu and ' +
                                           ' DtProc <= :dDtEndNu');
    ParamByName('dDtBegNu').AsDateTime := dDtBegNu;
    ParamByName('dDtEndNu').AsDateTime := dDtEndNu;
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_OTKL_DTPROCTABN INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_OTKL_TABNDTPROC INACTIVE');
    ExecSQL;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnFillZOtklClick(Sender: TObject);
var dDtProc, dZaMesGod : TDateTime;
    nKdSps, nTabN, nKdObj, nKdSpZ : integer;
    cVidN, cKdKatP, cChas, cSumma, cDt_Beg, cDt_End, cPdn, cNotes,
                              cPrr, cPrPv, cKto, cPrKr, cMyNotes : string;
    cOtklFile : string;
    nY, nM, nD : word;
    nOldObj, nOldVed, nOldKdObj, nOldVidN : integer;
begin
  if Form_Dm.DbZpl.InTransaction then
    Form_Dm.DbZpl.Rollback;
  with qryOZS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_OZS');
    Open;
  end;
  if not qryZOtkl.Active then
    qryZOtkl.Open;
  with qryOldOtkl do begin
    if not Active then Open;
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      if not Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.StartTransaction;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        cOtklFile := FieldByName('FileOtkl').AsString;
        // Тут речь идет только о годах >= 2000
        nY := 2000 + StrToInt(Copy(cOtklFile, 7, 2));
        nM := StrToInt(Copy(cOtklFile, 5, 2));
        nD := 1;
        dDtProc   := EnCodeDate(nY, nM, nD);
        dZaMesGod := EnCodeDate(FieldByName('GodN').AsInteger,
                                   FieldByName('MesN').AsInteger, 1);
        nKdSps  := 1;
        nOldObj := FieldByName('Obj').AsInteger;
        nOldVed := FieldByName('Ved').AsInteger;
        if (FieldByName('Obj').AsInteger < 10) then
          nOldKdObj := FieldByName('Obj').AsInteger * 1000 +
                                           FieldByName('Ved').AsInteger
        else
          nOldKdObj := FieldByName('Obj').AsInteger;
        nKdObj   := DmMain.OldOV2KdObj(nOldObj, nOldVed);
        nKdSpZ   := OldSZatr2KdSbu(FieldByName('VidN').AsInteger,
                                              FieldByName('SZatr').AsString);
        cKdKatP  := FieldByName('Kat').AsString;
        cVidN    := DmMain.OldVidN2VidN(FieldByName('VidN').AsInteger);
        nOldVidN := FieldByName('VidN').AsInteger;
        cChas    := FieldByName('Chas').AsString;
        cSumma   := FieldByName('Summa').AsString;
        cDt_Beg  := FieldByName('Dt_Beg').AsString;
        cDt_End  := FieldByName('Dt_End').AsString;
        cPdn     := FieldByName('Pdn').AsString;
        cNotes   := FieldByName('Otkuda').AsString;
        cPrr     := '';
        cPrPv    := FieldByName('PrPv').AsString;
        cKto     := FieldByName('Kto').AsString;
        cPrKr    := FieldByName('PrKr').AsString;
        cMyNotes := 'FromOldZp';
        AddRecToZOtkl(dDtProc, dZaMesGod, nKdSps, nTabN, nKdObj, nKdSpZ,
                      nOldKdObj, nOldVidN,
                  cVidN, cKdKatP, cChas, cSumma, cDt_Beg, cDt_End, cPdn, cNotes,
                      cPrr, cPrPv, cKto, cPrKr, cMyNotes);
        Next;
      end;
      qryZOtkl.ApplyUpdates;
      if Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.Commit;
    end;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    // Активизировать триггеры и индексы
    SQL.Add('Alter TRIGGER ZOTKL_AI ACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter TRIGGER ZOTKL_AU ACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter TRIGGER ZOTKL_BD ACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_OTKL_DTPROCTABN ACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Alter INDEX Z_OTKL_TABNDTPROC ACTIVE');
    ExecSQL;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.AddRecToZOtkl(dDtProc, dZaMesGod : TDateTime;
                              nKdSps, nTabN, nKdObj, nKdSpZ,
                                         nOldKdObj, nOldVidN : integer;
                            cVidN, cKdKatP, cChas, cSumma, cDt_Beg, cDt_End,
                    cPdn, cNotes, cPrr, cPrPv, cKto, cPrKr, cMyNotes : string);
begin
  with qryZOtkl do begin
    Append;
    FieldByName('KDSPS').AsInteger     := nKdSps;
    FieldByName('DTPROC').AsDateTime   := dDtProc;
    FieldByName('ZAMESGOD').AsDateTime := dZaMesGod;
    FieldByName('TABN').AsInteger      := nTabN;
    FieldByName('VIDN').AsString       := cVidN;
    FieldByName('OLDKDVIDN').AsInteger := nOldVidN;
    FieldByName('CHAS').AsString       := cChas;
    FieldByName('SUMMA').AsString      := cSumma;
    FieldByName('OLDKDOBJ').AsInteger  := nOldKdObj;
    FieldByName('KDOBJ').AsInteger     := nKdObj;
    FieldByName('KDKATP').AsString     := cKdKatP;
    FieldByName('DT_BEG').AsString     := cDt_Beg;
    FieldByName('DT_END').AsString     := cDt_End;
    FieldByName('KDSPZ').AsInteger     := nKdSpZ;
    FieldByName('PDN').AsString        := cPdn;
    FieldByName('NOTES').AsString      := cNotes;
    FieldByName('PRR').AsString        := cPrr;
    FieldByName('PRPV').AsString       := cPrPv;
    FieldByName('KTO').AsString        := cKto;
    FieldByName('PRKR').AsString       := cPrKr;
    FieldByName('MYNOTES').AsString    := cMyNotes;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnOpenGrOtpClick(Sender: TObject);
begin
  with qryOldGrOtp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := 'ZP_Z';
    SQL.Add('Select * from "Graf_Otp.dbf" where (not dt_Beg is Null) and ' +
            ' (dt_Beg > "01/01/1993") order by TabN, Dt_Beg');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnClearZOtpClick(Sender: TObject);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Alter trigger ZVOTP_BD INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Delete from Z_VOtp where Spec_NR is Null');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.sBtnFillZVOtpClick(Sender: TObject);
var nKdSps, nTabN : integer; cVidN : string4;
    cRK, cNrPrik, cDtPrik, cDtBeg, cCntDays, cNotes : string;
begin
  if Form_Dm.DbZpl.InTransaction then
    Form_Dm.DbZpl.Rollback;
  with qryZVOtp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select * from Z_VOtp');
    Open;
  end;
  if not qryOldGrOtp.Active then
    sBtnOpenGrOtp.Click;
  with qryOldGrOtp do begin
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      if not Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.StartTransaction;
      while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
        nKdSps   := 1;
        cVidN    := DmMain.OldVidN2VidN(FieldByName('VidN').AsInteger);
        cDtBeg   := FieldByName('Dt_Beg').AsString;
        cRK      := FieldByName('RK').AsString;
        cNrPrik  := FieldByName('Nr_Prikaza').AsString;
        cDtPrik  := FieldByName('Dt_Prikaza').AsString;
        cCntDays := FieldByName('Cnt_Day').AsString;
        cNotes   := FieldByName('Primech').AsString;
        AddRecToZVOtp(nKdSps, nTabN, cVidN,
                              cRK, cNrPrik, cDtPrik, cDtBeg, cCntDays, cNotes);
        Next;
      end;
      qryZVOtp.ApplyUpdates;
      if Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.Commit;
    end;
  end;
  qryZVOtp.Close;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Alter trigger ZVOTP_BD ACTIVE');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNewPeregonu.AddRecToZVOtp(nKdSps, nTabN : integer;
               cVidN, cRK, cNrPrik, cDtPrik, cDtBeg, cCntDays, cNotes : string);
begin
  with qryZVOtp do begin
    Append;
    FieldByName('KdSps').AsInteger  := nKdSps;
    FieldByName('TabN').AsInteger   := nTabN;
    FieldByName('VidN').AsString    := cVidN;
    FieldByName('RK').AsString      := cRK;
    FieldByName('NrPrik').AsString  := cNrPrik;
    FieldByName('DtPrik').AsString  := cDtPrik;
    FieldByName('DtBeg').AsString   := cDtBeg;
    FieldByName('CntDays').AsString := cCntDays;
    FieldByName('Notes').AsString   := cNotes;
    Post;
  end;
end;

end.
