unit z_OldPe2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables;

type
  String1 = string[1];
  String10 = string[10];

  TFormRemontPere = class(TForm)
    qryOldPere: TQuery;
    dsrcOldPere: TDataSource;
    dbgrOldPere: TDBGrid;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnGo: TSpeedButton;
    Label1: TLabel;
    qryTmp: TQuery;
    qryOZS: TQuery;
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
    qryOVK: TQuery;
    qryOVKOBJ: TSmallintField;
    qryOVKVED: TSmallintField;
    qryOVKKDOBJ: TSmallintField;
    qryOVKNEWKDOBJ: TSmallintField;
    qryOVKNAIMENOV: TStringField;
    qryOVKSOKRNAIM: TStringField;
    qryMetka: TQuery;
    qryOldPereNR: TFloatField;
    qryOldPereTABN: TFloatField;
    qryOldPereDT_BEG: TDateField;
    qryOldPereDT_END: TDateField;
    qryOldPereOBJ: TSmallintField;
    qryOldPereVED: TSmallintField;
    qryOldPereSO: TSmallintField;
    qryOldPereOKLTRF: TFloatField;
    qryOldPereSZATR: TStringField;
    qryOldPereKAT: TSmallintField;
    qryOldPereDOLGNOST: TStringField;
    qryOldPereNR_PRIKAZA: TStringField;
    qryOldPereDT_PRIKAZA: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnGoClick(Sender: TObject);
  private
    { Private declarations }
    c_Alias : string;
    function OpenQryUpiPere(cAlias : string) : boolean;
    function OldSZatr2KdSbu(nVidN : integer; cSZatr : string) : integer;
    function OldOV2KdObj(nOldObj, nOldVed : integer) : integer;
    procedure AddRecUpi(nTabN : integer;
                                        cFam, cIma, cOtch,  cDtRogd : string;
                                            cPol : String1; cID : string10);
    procedure AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj, nOldKdObj,
                                 nKdDolgn, nKdKatP, nSO, nPrPens, nSovm,
                                 nPdNlg, nProcLg, nKolMin, nPrfs, nInv, nRang,
                                 nRazr : integer; dDt_Beg : TDateTime;
                                 nOklTrf, nAvans : double; cSpAv, cNmDolgn,
                                 cNrPrikaza, cDtPrikaza, cNotes : string);
{
    procedure AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj,
                                              nOldKdObj, nKdDolgn : integer;
                        dDt_Beg : TDateTime;
                      cKdKatP, cSO, cOklTrf, cAvans, cSpAv, cNmDolgn, cPrPens,
                    cSovm, cPdNlg, cProcLg, cKolMin, cPrfs,
                  cNrPrikaza, cDtPrikaza, cNotes, cInv, cRang, cRazr : string);
}
    procedure AddRecPrmUv(nKdSps, nTabN : integer;
                                    dDtPrm, dDtUv : TDateTime; cNotes : string);
    procedure MetkaInOldUpi(nTabN : integer; dDate : TDateTime);
  public
    { Public declarations }
  end;

procedure RemontPere(cAlias : string);

const SECTION = 'z_OldPe2';

var
  FormRemontPere: TFormRemontPere;

implementation

uses a_Const, a_DM, z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure RemontPere(cAlias : string);
begin
  FormRemontPere := TFormRemontPere.Create(Application);
  with FormRemontPere do begin
    c_Alias := cAlias;
    if not OpenQryUpiPere(cAlias) then
      ShowMessage('Не получилось открыть UpiPere в Alias = ' + cAlias)
    else begin
      Caption := 'Подключение к новой зарплате сведений из Upi.dbf и Pere.dbf';
      ShowModal;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRemontPere.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 480);
    Width  := ReadInteger(SECTION, 'wW', 750);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRemontPere.FormClose(Sender: TObject; var Action: TCloseAction);
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
function TFormRemontPere.OpenQryUpiPere(cAlias : string) : boolean;
begin
  Result := true;
  Screen.Cursor := crSQLWait;
  with qryOldPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cAlias;
    SQL.Add('select * from "pere2.dbf" where tabn > 0 ' +
            ' order by TabN, Dt_Beg, NR ');
    TRY
      Open;
    EXCEPT
      ShowMessage('Не найдена таблица Pere.dbf');
      Result := false;
    END;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRemontPere.sBtnGoClick(Sender: TObject);
var nKdSps, nTabN, nKdSpZ, nKdObj, nOldKdObj, nOldObj, nOldVed, nKdDolgn,
    nKdKatP, nSO, nPrPens, nSovm, nPdNlg, nProcLg, nKolMin, nPrfs, nInv,
                                                        nRang, nRazr : integer;
    cFam, cIma, cOtch, cDtRogd, cSpAv, cNmDolgn,
                                       cNrPrikaza, cDtPrikaza, cNotes : string;
    nOklTrf, nAvans : double;
    cPol : string1;
    cID : string10;
    cLicSch : string15;
    dDtPrm, dDtUv, dDt_Beg : TDateTime;
    bIsDtPrm, bNeedAddInPrmUv, bNeedAddInPere : boolean;
    nDbg : integer;
    cDbgDate : string;
begin
  cDbgDate := DateToStr(Date);
  with qryOZS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := c_Alias;
    SQL.Add('Select * from Z_OZS');
    Open;
  end;
  with qryMetka do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := c_Alias;
    SQL.Add('Update UPI set d13zp = :dDate where TabN = :nTabN');
  end;
  with qryOVK do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := c_Alias;
    SQL.Add('Select * from Z_OVK');
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
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('ALTER TRIGGER ZUPI_BD INACTIVE');
    ExecSQL;
    SQL.Clear;
    SQL.Add('CREATE TRIGGER ZUPI_BD_TMP FOR Z_UPI BEFORE DELETE POSITION 0 as ');
    SQL.Add('begin ');
    SQL.Add('  Delete from Z_PrmUv where Z_PrmUv.TabN = Z_Upi.TabN;');
    SQL.Add('  Delete from Z_Pere where Z_Pere.TabN = Z_Upi.TabN;');
    SQL.Add('end');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Delete from Z_UPI where TABN = :nTabN');
  end;
  with qryUpiPere do begin // Открыто в OpenQryUpiPere(cAlias)
    First;
    nDbg := 0;
    while not Eof and (nDbg <= 500) do begin
      nTabN   := FieldByName('TabN').AsInteger;
      if not FieldByName('d13zp').IsNull then begin
        if (FieldByName('TabN').AsInteger = nTabN) and not Eof then begin
          Next;
          Continue; end
        else
          Continue;
      end;
      //if bFlagDbg then
      //  Inc(nDbg);
      bNeedAddInPrmUv := false;
      bNeedAddInPere := false;
      nKdSps  := 1;    // Связать с c_Alias
      qryTmp.ParamByName('nTabN').AsInteger := nTabN;
      qryTmp.ExecSQL;
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
      AddRecUpi(nTabN, cFam, cIma, cOtch, cDtRogd, cPol, cID);
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
        nKdObj     := OldOV2KdObj(nOldObj, nOldVed);
        nKdSpZ     := OldSZatr2KdSbu(0, FieldByName('SZatr').AsString);
        dDt_Beg    := FieldByName('Dt_Beg').AsDateTime;
        nKdKatP    := FieldByName('Kat').AsInteger;
        nSO        := FieldByName('SO_1').AsInteger;
        nOklTrf    := FieldByName('OklTrf_1').AsFloat;
        nAvans     := FieldByName('Avans').AsFloat;
        if nAvans <> 0 then
          cSpAv := '%'
        else
          cSpAv := '';
        cNmDolgn   := FieldByName('Dolgnost_1').AsString;
        nKdDolgn   := DmMain.Dolgn2KdDolgn(cNmDolgn);
        nPrPens    := FieldByName('Pr_Pens').AsInteger;
        nSovm      := FieldByName('Sovm').AsInteger;
        nPdNlg     := FieldByName('PdNlg').AsInteger;
        nProcLg    := FieldByName('Lgota').AsInteger;
        nKolMin    := FieldByName('KolMin').AsInteger;
        nPrfs      := FieldByName('Prfs').AsInteger;
        cNrPrikaza := FieldByName('Nr_Prikaza').AsString;
        cDtPrikaza := FieldByName('Dt_Prikaza').AsString;
        cNotes     := 'OldZp110 ' + DateTimeToStr(Now);
        nInv       := FieldByName('Invalid').AsInteger;
        nRang      := FieldByName('Rang').AsInteger;
        nRazr      := FieldByName('Razr').AsInteger;
        AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj, nOldKdObj, nKdDolgn,
                     nKdKatP, nSO, nPrPens, nSovm, nPdNlg, nProcLg, nKolMin,
                     nPrfs, nInv, nRang, nRazr, dDt_Beg, nOklTrf, nAvans,
                     cSpAv, cNmDolgn, cNrPrikaza, cDtPrikaza, cNotes);
        Next;
      end;
      AddRecPrmUv(0, nTabN, dDtPrm, dDtUv, cNotes);
      AddRecPrmUv(nKdSps, nTabN, dDtPrm, dDtUv, cNotes);
      MetkaInOldUpi(nTabN, Date);
      qryPere.ApplyUpdates;
      qryPrmUv.ApplyUpdates;
      if qryUpi.UpdatesPending then
        qryUpi.ApplyUpdates;
      if Form_Dm.DbZpl.InTransaction then
        Form_Dm.DbZpl.Commit;
    end;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('DROP TRIGGER ZUPI_BD_TMP');
    ExecSQL;
    SQL.Clear;
    SQL.Add('ALTER TRIGGER ZUPI_BD ACTIVE');
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRemontPere.MetkaInOldUpi(nTabN : integer; dDate : TDateTime);
begin
  with qryMetka do begin
    ParamByName('dDate').AsDateTime := dDate;
    ParamByName('nTabN').AsInteger  := nTabN;
    ExecSQL;
  end;
end;
//------------------------------------------------------------------------------
function TFormRemontPere.OldOV2KdObj(nOldObj, nOldVed : integer) : integer;
begin
  Result := 0;
  with qryOVK do begin
    if Locate('Obj;Ved', VarArrayOf([nOldObj, nOldVed]), []) then begin
      if not FieldByName('NewKdObj').IsNull then
        Result := FieldByName('NewKdObj').AsInteger
      else
        Result := FieldByName('KdObj').AsInteger;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRemontPere.AddRecUpi(nTabN : integer;
                                        cFam, cIma, cOtch,  cDtRogd : string;
                                            cPol : String1; cID : string10);
begin
  with qryUpi do begin
    Append;
    FieldByName('TabN').AsInteger := nTabN;
    FieldByName('Fam').AsString   := cFam;
    FieldByName('Ima').AsString   := cIma;
    FieldByName('Otch').AsString  := cOtch;
    FieldByName('DOB').AsString   := cDtRogd;
    FieldByName('Pol').AsString   := cPol;
    FieldByName('ID').AsString    := cID;
    Post;
  end;
end;
//------------------------------------------------------------------------------
function TFormRemontPere.OldSZatr2KdSbu(nVidN : integer;
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
    Result := qryOzs.FieldByName('KdSbu').AsInteger;
end;
//------------------------------------------------------------------------------
procedure TFormRemontPere.AddRecPere(nKdSps, nTabN, nKdSpZ, nKdObj, nOldKdObj,
                                 nKdDolgn, nKdKatP, nSO, nPrPens, nSovm,
                                 nPdNlg, nProcLg, nKolMin, nPrfs, nInv, nRang,
                                 nRazr : integer; dDt_Beg : TDateTime;
                                 nOklTrf, nAvans : double; cSpAv, cNmDolgn,
                                 cNrPrikaza, cDtPrikaza, cNotes : string);
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
    FieldByName('KdKatP').AsInteger    := nKdKatP;
    FieldByName('SO').AsInteger        := nSO;
    FieldByName('OklTrf').AsFloat      := nOklTrf;
    FieldByName('Avans').AsFloat       := nAvans;
    FieldByName('Sp_Av').AsString      := cSpAv;
    FieldByName('Dolgnost').AsString   := cNmDolgn;
    FieldByName('Pr_Pens').AsInteger   := nPrPens;
    FieldByName('Sovm').AsInteger      := nSovm;
    FieldByName('PdNlg').AsInteger     := nPdNlg;
    FieldByName('ProcLg').AsInteger    := nProcLg;
    FieldByName('KolMin').AsInteger    := nKolMin;
    FieldByName('Prfs').AsInteger      := nPrfs;
    FieldByName('Nr_Prikaza').AsString := cNrPrikaza;
    FieldByName('Dt_Prikaza').AsString := cDtPrikaza;
    FieldByName('Notes').AsString      := cNotes;
    FieldByName('Inv').AsInteger       := nInv;
    FieldByName('Rang').AsInteger      := nRang;
    FieldByName('Razr').AsInteger      := nRazr;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormRemontPere.AddRecPrmUv(nKdSps, nTabN : integer;
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

end.
