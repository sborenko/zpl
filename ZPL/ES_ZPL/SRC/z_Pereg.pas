unit z_Pereg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBTables,
  Grids, DBGrids;

type
  String1  = string[1];
  String10 = string[10];
  String15 = string[15];
  TFormPeregonu = class(TForm)
    PageControl: TPageControl;
    tsUpi: TTabSheet;
    tsPere: TTabSheet;
    tsOtkl: TTabSheet;
    tsBln: TTabSheet;
    tsOtp: TTabSheet;
    PanelTop: TPanel;
    bBtnClose: TBitBtn;
    PanelMY: TPanel;
    sBtnYMinus: TSpeedButton;
    sBtnMMinus: TSpeedButton;
    sBtnMPlus: TSpeedButton;
    sBtnYPlus: TSpeedButton;
    stTextMY: TStaticText;
    qryOldPU: TQuery;
    dsrcOldPU: TDataSource;
    dbgrOldPU: TDBGrid;
    tsSps: TTabSheet;
    sBtnGo: TSpeedButton;
    qryOldOtkl: TQuery;
    dsrcOldOtkl: TDataSource;
    dbgrOldOtkl: TDBGrid;
    tsOVK: TTabSheet;
    qryObj: TQuery;
    qryOVK: TQuery;
    dsrcObj: TDataSource;
    dsrcOVK: TDataSource;
    dbgrObj: TDBGrid;
    Splitter1: TSplitter;
    dbgrOVK: TDBGrid;
    updOVK: TUpdateSQL;
    tsOVV: TTabSheet;
    dbgrVids: TDBGrid;
    Splitter2: TSplitter;
    dbgrOVV: TDBGrid;
    qryVids: TQuery;
    dsrcVids: TDataSource;
    qryOVV: TQuery;
    dsrcOVV: TDataSource;
    updOVV: TUpdateSQL;
    qryZOtkl: TQuery;
    updZOtkl: TUpdateSQL;
    qryTmp: TQuery;
    qryOZS: TQuery;
    qryOZSNR: TIntegerField;
    qryOZSSZATR: TStringField;
    qryOZSKDSBU: TIntegerField;
    qryOZSSCHBU: TStringField;
    qryOZSNOTE: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    sBtnOpenUpi: TSpeedButton;
    sBtnUpiGo: TSpeedButton;
    LbxNewTabN: TListBox;
    LabelCntRecPU: TLabel;
    qryUpi: TQuery;
    updUpi: TUpdateSQL;
    qryPrmUv: TQuery;
    updPrmUv: TUpdateSQL;
    qryPere: TQuery;
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
    updPere: TUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnYMinusClick(Sender: TObject);
    procedure sBtnMMinusClick(Sender: TObject);
    procedure sBtnMPlusClick(Sender: TObject);
    procedure sBtnYPlusClick(Sender: TObject);
    procedure sBtnGoClick(Sender: TObject);
    procedure qryOVKAfterPost(DataSet: TDataSet);
    procedure qryOVVAfterPost(DataSet: TDataSet);
    procedure sBtnOpenUpiClick(Sender: TObject);
    procedure sBtnUpiGoClick(Sender: TObject);
    procedure qryUpiAfterPost(DataSet: TDataSet);
    procedure qryPrmUvAfterPost(DataSet: TDataSet);
    procedure qryPereAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    n_God, n_Mes : word;
    function OldSZatr2KdSbu(nVidN : integer; cSZatr : string) : integer;
    procedure SetTextMY(nYear, nMonth : word);
    procedure AddInfToOVK(cOldKdObj, cOldKdVed, cKdObj,
                                                     cShObj, cNmObj : string);
    procedure AddInfToOVV(cOldKdVidN, cKdVidN, cShVidN, cNmVidN : string);
    procedure PrepareZOtkl(nY, nM : integer);
    procedure UnPrepareZOtkl;
    procedure AddRecToZOtkl(dDtProc, dZaMesGod : TDateTime;
                              nKdSps, nTabN, nKdObj, nKdSpZ,
                                         nOldKdObj, nOldVidN : integer;
                            cVidN, cKdKatP, cChas, cSumma, cDt_Beg, cDt_End,
                    cPdn, cNotes, cPrr, cPrPv, cKto, cPrKr, cMyNotes : string);
    procedure CheckInPere;
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
  public
    { Public declarations }
  end;

procedure Peregonu;

const SECTION = 'z_Pereg';

var
  FormPeregonu: TFormPeregonu;

implementation

uses a_Const, a_Dm, z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure Peregonu;
begin
  FormPeregonu := TFormPeregonu.Create(Application);
  with FormPeregonu do begin
    PageControl.ActivePage := tsOtkl;
    ShowModal;
    if qryOldPU.Active then
      qryOldPU.Close;
    if qryOldOtkl.Active then
      qryOldOtkl.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 550);
    Width  := ReadInteger(SECTION, 'wW', 650);
    n_God  := ReadInteger(SECTION, 'NGod', 2005);
    n_Mes  := ReadInteger(SECTION, 'nMes', 2);
    Free;
  end;
  SetTextMY(n_God, n_Mes);
  if FileExists(cDirVids + 'p_OldPU.vid') then
    dbgrOldPU.Columns.LoadFromFile(cDirVids + 'p_OldPU.vid');
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrOldPU.Columns.SaveToFile(cDirVids + 'p_OldPU.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'NGod', n_God);
    WriteInteger(SECTION, 'nMes', n_Mes);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.SetTextMY(nYear, nMonth : word);
var bInCtrlMes : boolean;
begin
  bInCtrlMes := (nYear = nCtrlGod) and (nMonth = nCtrlMes);
  if bInCtrlMes then begin
    stTextMY.Font.Color := clMaroon;
    stTextMY.Font.Style := [fsBold]; end
  else begin
    stTextMY.Font.Color := clGreen;
    stTextMY.Font.Style := [];
  end;
  stTextMY.Caption := arrMonth[nMonth] + ' ' + IntToStr(nYear);
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.sBtnMMinusClick(Sender: TObject);
var nNewY, nNewM : word;
begin
  nNewM := n_Mes - 1;
  nNewY := n_God;
  if nNewM = 0 then begin
    nNewM := 12;
    nNewY := nNewY - 1;
  end;
  n_God := nNewY;
  n_Mes := nNewM;
  SetTextMY(n_God, n_Mes);
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.sBtnMPlusClick(Sender: TObject);
var nNewY, nNewM : word;
begin
  nNewM := n_Mes + 1;
  nNewY := n_God;
  if nNewM = 13 then begin
    nNewM := 1;
    nNewY := nNewY + 1;
  end;
  n_God := nNewY;
  n_Mes := nNewM;
  SetTextMY(n_God, n_Mes);
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.sBtnYMinusClick(Sender: TObject);
var nNewY, nNewM : word;
begin
  nNewY := n_God - 1;
  nNewM := n_Mes;
  n_God := nNewY;
  n_Mes := nNewM;
  SetTextMY(n_God, n_Mes);
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.sBtnYPlusClick(Sender: TObject);
var nNewY, nNewM : word;
begin
  nNewM := n_Mes;
  nNewY := n_God + 1;
  n_God := nNewY;
  n_Mes := nNewM;
  SetTextMY(n_God, n_Mes);
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.sBtnGoClick(Sender: TObject);
var cOldKdObj, cOldKdVed, cKdObj, cShObj, cNmObj : string;
    cOldKdVidN, cKdVidN, cShVidN, cNmVidN : string;
    nY, nM, nD : word;
    cNmOtkl : string;
    nTabN : integer;
    dZaMesGod, dDtProc : TDateTime;
    nOldObj, nOldVed, nOldKdObj, nOldVidN, nKdObj, nKdSpZ : integer;
    cKdKatP, cVidN, cChas, cSumma, cDt_Beg, cDt_End,
          cPdn, cNotes, cPrr, cPrPv, cKto, cPrKr, cMyNotes : string;
begin
(*
  if (PageControl.ActivePage = tsUPI) and
            qryOldUpi.Active and qryPere.Active then with qryUpi do begin
    First;
    while not Eof do begin
      Next;
    end;
    First; end
  else if (PageControl.ActivePage = tsOtkl) then begin
    nY := n_God;
    nM := n_Mes;
    dDtProc   := EnCodeDate(nY, nM, 1);
    cNmOtkl := 'otkl';
    if nM < 10 then
      cNmOtkl := cNmOtkl + '0';
    cNmOtkl := cNmOtkl + IntToStr(nM) + Copy(IntToStr(nY), 3, 2);
    cNmOtkl := '"' + cNmOtkl + '.dbf"';
    with qryOldOtkl do begin
      if Active then Close;
      SQL.Clear;
      SQL.Add('Select * from ' + cNmOtkl + ' order by TabN');
      Open;
      if MessageDlg('Перегнать данные из ' + cNmOtkl + '?:', mtConfirmation,
                                          [mbYes, mbNo], 0) = mrYes then begin
        PrepareZOtkl(nY, nM);
        First;
        while not Eof do begin
          nTabN := FieldByName('TabN').AsInteger;
          if not Form_Dm.DbZpl.InTransaction then
            Form_Dm.DbZpl.StartTransaction;
          while (FieldByName('TabN').AsInteger = nTabN) and not Eof do begin
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
        UnPrepareZOtkl;
      end;
    end; end
  else if (PageControl.ActivePage = tsOVK) then with qryObj do begin
    if not Active then
      Open;
    First;
    while not Eof do begin
      cKdObj := FieldByName('KdObj').AsString;
      cShObj := FieldByName('ShObj').AsString;
      cNmObj := FieldByName('NmObj').AsString;
      cOldKdObj := Copy(cKdObj, 1, 1);
      cOldKdVed := Copy(cKdObj, 2, 3);
      AddInfToOVK(cOldKdObj, cOldKdVed, cKdObj, cShObj, cNmObj);
      Next;
    end;
    First; end
  else if (PageControl.ActivePage = tsOVV) then with qryVids do begin
    if not Active then
      Open;
    First;
    while not Eof do begin
      cKdVidN := FieldByName('KdVidN').AsString;
      cShVidN := FieldByName('ShVidN').AsString;
      cNmVidN := FieldByName('NmVidN').AsString;
      cOldKdVidN := FieldByName('OldKdVidN').AsString;
      AddInfToOVV(cOldKdVidN, cKdVidN, cShVidN, cNmVidN);
      Next;
    end;
    First;
  end;
*)
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.AddRecToZOtkl(dDtProc, dZaMesGod : TDateTime;
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
function TFormPeregonu.OldSZatr2KdSbu(nVidN : integer;
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
procedure TFormPeregonu.PrepareZOtkl(nY, nM : integer);
var dDtProc : TDateTime;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('ALTER TRIGGER ZOTKL_AI InActive');
    ExecSQL;
    SQL.Clear;
    SQL.Add('ALTER TRIGGER ZOTKL_AU InActive');
    ExecSQL;
    SQL.Clear;
    SQL.Add('ALTER TRIGGER ZOTKL_BD InActive');
    ExecSQL;
    dDtProc := EncodeDate(nY, nM, 1);
    SQL.Clear;
    SQL.Add('Delete from Z_OTKL where DtProc = :dDtProc and ' +
                                       ' MyNotes = "FromOldZp"');
    ParamByName('dDtProc').AsDateTime := dDtProc;
    ExecSQL;
    SQL.Clear;
    SQL.Add('ALTER INDEX Z_OTKL_DTPROCTABN InActive');
    ExecSQL;
    SQL.Clear;
    SQL.Add('ALTER INDEX Z_OTKL_TABNDTPROC InActive');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
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
  if not qryZOtkl.Active then
    qryZOtkl.Open;
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.UnPrepareZOtkl;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('ALTER TRIGGER ZOTKL_AI Active');
    ExecSQL;
    SQL.Clear;
    SQL.Add('ALTER TRIGGER ZOTKL_AU Active');
    ExecSQL;
    SQL.Clear;
    SQL.Add('ALTER TRIGGER ZOTKL_BD Active');
    ExecSQL;
    SQL.Clear;
    SQL.Add('ALTER INDEX Z_OTKL_DTPROCTABN Active');
    ExecSQL;
    SQL.Clear;
    SQL.Add('ALTER INDEX Z_OTKL_TABNDTPROC Active');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.AddInfToOVK(cOldKdObj, cOldKdVed, cKdObj,
                                                     cShObj, cNmObj : string);
begin
  with qryOVK do begin
    if not Active then Open;
    Append;
    FieldByName('OldObj').AsString := cOldKdObj;
    FieldByName('OldVed').AsString := cOldKdVed;
    FieldByName('KdObj').AsString  := cKdObj;
    FieldByName('ShObj').AsString  := cShObj;
    FieldByName('NmObj').AsString  := cNmObj;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.qryOVKAfterPost(DataSet: TDataSet);
begin
  qryOVK.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.AddInfToOVV(cOldKdVidN, cKdVidN,
                                                  cShVidN, cNmVidN : string);
begin
  with qryOVV do begin
    if not Active then Open;
    Append;
    FieldByName('OldKdVidN').AsString := cOldKdVidN;
    FieldByName('KdVidN').AsString    := cKdVidN;
    FieldByName('ShVidN').AsString    := cShVidN;
    FieldByName('NmVidN').AsString    := cNmVidN;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.qryOVVAfterPost(DataSet: TDataSet);
begin
  qryOVV.ApplyUpdates;
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.sBtnOpenUpiClick(Sender: TObject);
begin
  with qryOldPU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := 'D_01';
    SQL.Add('Select u.*, p.* from "pere.dbf" p, "upi.dbf" u ' +
            ' where (p.Dt_beg >= "08/01/2005") and (u.TabN = p.TabN) ' +
            ' order by u.TabN, p.Dt_Beg ');
    Open;
    LabelCntRecPU.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
(*  Структура qryOldUpi
    TABN: TFloatField;
    OBJ: TSmallintField;
    VED: TSmallintField;
    BRIG: TSmallintField;
    KATPREM: TSmallintField;
    FAM: TStringField;
    IMA: TStringField;
    OTCH: TStringField;
    DOLGNOST: TStringField;
    RAZR: TSmallintField;
    RANG: TSmallintField;
    INVALID: TSmallintField;
    PR_PENS: TSmallintField;
    POL: TStringField;
    SOVM: TSmallintField;
    SZATRO: TStringField;
    SO: TSmallintField;
    OKLTRFOLD: TFloatField;
    OKLTRF: TFloatField;
    AVANS: TFloatField;
    ND: TSmallintField;
    PDNLG: TSmallintField;
    KOLMIN: TSmallintField;
    MSNLG: TSmallintField;
    STR: TSmallintField;
    SBERK: TSmallintField;
    KRD: TSmallintField;
    ALM: TSmallintField;
    ISPL: TSmallintField;
    PEREVOD: TSmallintField;
    SSUDA: TSmallintField;
    PRFS: TSmallintField;
    PRUDERG: TSmallintField;
    DPRIEM: TDateField;
    DUVOLN: TDateField;
    PRUV: TFloatField;
    D13ZP: TDateField;
    DVUSL: TDateField;
    SRDPRM91: TFloatField;
    NR_PRIKP: TStringField;
    DT_PRIKP: TDateField;
    NR_PRIKU: TStringField;
    DT_PRIKU: TDateField;
    IDENT: TStringField;
    DROJD: TDateField;
    DEKR: TSmallintField;
    LS: TStringField;
    LGOTA: TSmallintField;   // конец УПИшных полей
    TABN_1: TFloatField;           // пошли по ПЕРЕ
    DT_BEG: TDateField;
    DT_END: TDateField;
    OBJ_1: TSmallintField;
    VED_1: TSmallintField;
    SO_1: TSmallintField;
    OKLTRF_1: TFloatField;
    SZATR: TStringField;
    KAT: TSmallintField;
    DOLGNOST_1: TStringField;
    NR_PRIKAZA: TStringField;
    DT_PRIKAZA: TDateField;
*)
//------------------------------------------------------------------------------
procedure TFormPeregonu.sBtnUpiGoClick(Sender: TObject);
var nKdSps, nTabN, nKdSpZ, nKdObj, nSO, nKdKatP,
    nOldKdObj, nOldObj, nOldVed, nKdDolgn : integer;
    cMsg, cFam, cIma, cOtch, cDtRogd, cKdKatP, cSO, cOklTrf, cAvans, cSpAv,
       cNmDolgn, cPrPens, cSovm, cPdNlg, cProcLg, cKolMin, cPrfs,
         cNrPrikaza, cDtPrikaza, cNotes, cInv, cRang, cRazr : string;
    cPol : string1;
    cID : string10;
    cLicSch : string15;
    dDtPrm, dDtUv, dDt_Beg : TDateTime;
    bIsDtPrm, bFirstRec : boolean;
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
    SQL.Add('Select * from Z_Upi order by TabN');
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
  with qryOldPU do begin
    if not Active then
      sBtnOpenUpi.Click;
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      nKdSps  := 1;
      cFam    := FieldByName('Fam').AsString;
      cIma    := FieldByName('Ima').AsString;
      cOtch   := FieldByName('Otch').AsString;
      cDtRogd := FieldByName('DRojd').AsString;
      if (FieldByName('Pol').AsString = 'М') or
                 (FieldByName('Pol').AsString = 'Ч') then
        cPol := 'М'
      else if (FieldByName('Pol').AsString = 'Ж') then
        cPol := 'Ж'
      else
        cPol := '';
      if not MyEmptyDate(FieldByName('DPriem').AsString) then
        dDtPrm := FieldByName('DPriem').AsDateTime
      else
        dDtPrm := 0;
      dDtUv   := FieldByName('DUvoln').AsDateTime;
      cID     := FieldByName('Ident').AsString;
      cLicSch := FieldByName('LS').AsString;
      bIsDtPrm := (dDtPrm <> 0);
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
        nKdKatP    := FieldByName('Kat').AsInteger;
        cSO        := FieldByName('SO_1').AsString;
        nSO        := FieldByName('SO_1').AsInteger;
        cOklTrf    := FieldByName('OklTrf_1').AsString;
        nOklTrf    := FieldByName('OklTrf_1').AsFloat;
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
        if not qryPere.Locate('KDSPS;TABN;DT_BEG;KDOBJ;KDKATP;SO;OKLTRF;KDSPZ',
                               VarArrayOf([nKdSps,nTabN,dDt_Beg,nKdObj,nKdKatP,
                                   nSO,nOklTrf,nKdSpZ]), []) then
          AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj, nOldKdObj, nKdDolgn,
                   dDt_Beg, cKdKatP, cSO, cOklTrf,
                     cAvans, cSpAv, cNmDolgn, cPrPens, cSovm,
                       cPdNlg, cProcLg, cKolMin, cPrfs, cNrPrikaza, cDtPrikaza,
                          cNotes, cInv, cRang, cRazr);
        Next;
      end;
      if not qryUpi.Locate('TabN', nTabN, []) then begin
        AddRecUpi(nTabN, cFam, cIma, cOtch, cDtRogd, cPol, cID);
        AddRecPrmUv(0, nTabN, dDtPrm, dDtUv, cNotes);
        AddRecPrmUv(nKdSps, nTabN, dDtPrm, dDtUv, cNotes);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPeregonu.AddRecPrmUv(nKdSps, nTabN : integer;
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
procedure TFormPeregonu.AddRecUpi(nTabN : integer;
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
procedure TFormPeregonu.AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj,
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
procedure TFormPeregonu.CheckInPere;
begin
(*
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
*)
end;

procedure TFormPeregonu.qryUpiAfterPost(DataSet: TDataSet);
begin
  qryUpi.ApplyUpdates;
end;

procedure TFormPeregonu.qryPrmUvAfterPost(DataSet: TDataSet);
begin
  qryPrmUv.ApplyUpdates;
end;

procedure TFormPeregonu.qryPereAfterPost(DataSet: TDataSet);
begin
  qryPere.ApplyUpdates;
end;

end.
