unit z_prtPvd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, ExtCtrls,
  Math, DBClient;

type
  TFormPrtPvd = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qryPvd: TQuery;
    dsrcPvd: TDataSource;
    dbgrPvd: TDBGrid;
    sBtnPrt: TSpeedButton;
    qryPvdFAM: TStringField;
    qryPvdIMA: TStringField;
    qryPvdOTCH: TStringField;
    qryPvdKDPST: TIntegerField;
    qryPvdADRES: TStringField;
    qryPvdNOMDOK: TStringField;
    qryPvdKOMU: TStringField;
    qryPvdVIDN: TStringField;
    qryPvdSHVIDN: TStringField;
    qryPvdTABN: TIntegerField;
    qryPvdKDSPS: TSmallintField;
    qryPvdPSCH: TStringField;
    qryPvdSCHBU: TStringField;
    qryPvdDTPROC: TDateTimeField;
    qryPvdZAMESGOD: TDateTimeField;
    qryPvdCHAS: TFloatField;
    qryPvdSUMMA: TFloatField;
    qryPvdVID_KDSPZ: TSmallintField;
    qryPvdVID_SPZ: TStringField;
    qryPvdVID_KDSCHDT: TSmallintField;
    qryPvdVID_SCHDT: TStringField;
    qryPvdVID_KDSCHKT: TSmallintField;
    qryPvdVID_SCHKT: TStringField;
    qryPvdVID_KEKV: TStringField;
    qryPvdNR: TIntegerField;
    qryPvdDT_BEG: TDateTimeField;
    qryPvdDT_END: TDateTimeField;
    qryPvdKDOBJ: TSmallintField;
    qryPvdKDKATP: TSmallintField;
    qryPvdKDSPZ: TSmallintField;
    qryPvdPDN: TSmallintField;
    qryPvdNOTES: TStringField;
    qryPvdPRR: TSmallintField;
    qryPvdPRPV: TSmallintField;
    qryPvdKTO: TSmallintField;
    qryPvdPRKR: TSmallintField;
    qryPvdMYNOTES: TStringField;
    qryPvdSPECPS: TIntegerField;
    qryPvdSPEC_NR: TIntegerField;
    qryPvdDTVDPV: TDateTimeField;
    qryPvdNRVDPV: TIntegerField;
    qryPvdSTORN: TStringField;
    qryPvdZP13: TStringField;
    qryPvdOTP: TStringField;
    qryPvdBLN: TStringField;
    qryPvdOTPUSKN: TStringField;
    qryPvdBOLNIC: TStringField;
    qryPvdSPRM: TStringField;
    qryPvdCPRM: TStringField;
    qryPvdDETI: TStringField;
    qryPvdDETIM: TStringField;
    qryPvdDETIK: TStringField;
    qryPvdDETIG: TStringField;
    qryPvdIND: TStringField;
    qryPvdDHD: TStringField;
    qryPvdOKLFND: TStringField;
    qryPvdCBUDG: TStringField;
    qryPvdSNDB: TStringField;
    qryPvdSPDN: TStringField;
    qryPvdSPRF: TStringField;
    qryPvdSPENS: TStringField;
    qryPvdSALIM: TStringField;
    qryPvdCNDB: TStringField;
    qryPvdSSOCSTRAH: TStringField;
    qryPvdSBZR: TStringField;
    qryPvdSP_PF: TStringField;
    qryPvdSP_FSTVP: TStringField;
    qryPvdSP_FSNV: TStringField;
    qryPvdSP_FZ: TStringField;
    qryPvdSOVM: TStringField;
    qryPvdSPOV: TStringField;
    cdsPrt: TClientDataSet;
    cdsPrtNR: TAutoIncField;
    cdsPrtKdPst: TSmallintField;
    cdsPrtTabN: TIntegerField;
    cdsPrtKuda: TStringField;
    cdsPrtKomu: TStringField;
    cdsPrtSmPerevoda: TFloatField;
    cdsPrtSmPSB: TFloatField;
    cdsPrtSmNDS: TFloatField;
    cdsPrtSmBezNDS: TFloatField;
    cdsPrtSpecNR: TIntegerField;
    cdsPrtPSch: TStringField;
    dsrcPrt: TDataSource;
    Splitter1: TSplitter;
    dbgrPrt: TDBGrid;
    cdsPrtFamIO: TStringField;
    cdsPrtFam: TStringField;
    cdsPrtIma: TStringField;
    cdsPrtOtch: TStringField;
    qryPvdIsPst: TStringField;
    Is_Pst: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    procedure OpenQryPvd(dDtPrc : TDateTime);
    procedure CreCdsPrt;
  public
    { Public declarations }
  end;

procedure PrtPostPvd(dDtPrc : TDateTime);

const SECTION = 'z_PrtPvd';

var
  FormPrtPvd: TFormPrtPvd;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure PrtPostPvd(dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormPrtPvd := TFormPrtPvd.Create(Application);
  with FormPrtPvd do begin
    d_DtPrc := dDtPrc;
    OpenQryPvd(dDtPrc);
    if qryPvd.RecordCount = 0 then begin
      ShowMessage('Нет сведений в таблице начислений/удержаний' + #13#10 +
                  'по  виду  6611  Почтовые  переводы.');
      qryPvd.Close; end
    else begin
      if bFlagDbg then begin
        DecodeDate(dDtPrc, nY, nM, nD);
        Caption := 'Почтовые переводы за ' + MesRus(nM) +
                                              ' ' + IntToStr(nY) + ' г.';
        ShowModal; end
      else
        sBtnPrt.Click;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtPvd.OpenQryPvd(dDtPrc: TDateTime);
begin
  with qryPvd do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select p.is_pst, u.Fam, u.Ima, u.Otch, ' +
            ' ud.KdPst, ud.ADRES, ud.NOMDOK, ud.Komu, n.* ' +
            ' from ViNuMain n ' +
            ' Left outer join z_Uderg ud on ud.Spec_NR = n.Spec_NR ' +
            ' Left outer join z_Upi u on u.TabN = n.TabN ' +
	          ' left outer join z_pst p on ud.kdpst = p.kdpst ' +
            ' where n.DtProc = :dDtPrc and n.VidN in ("6611", "6612") ' +
            ' order by n.PSCH, ud.KdPst desc, n.TabN, n.Spec_NR, n.VidN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtPvd.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 775);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrtPvd.FormClose(Sender: TObject; var Action: TCloseAction);
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
procedure TFormPrtPvd.sBtnPrtClick(Sender: TObject);
begin
  CreCdsPrt;
end;
//------------------------------------------------------------------------------
procedure TFormPrtPvd.CreCdsPrt;
var nTabN, nSpecNR, nKdPst : integer;
    nSmPerevoda, nSmPsb, nSmNDS, nSmBezNDS : double;
    cPSch : ShortString;
    cIsPst: string;
begin
  with cdsPrt do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    CreateDataSet;
    Open;
    AddIndex('OnKdPstPSchKomu', 'KdPst;PSch;TabN;SpecNR;NR', []);
    IndexName := 'OnKdPstPSchKomu'
  end;
  with qryPvd do begin
    First;
    while not Eof do begin
      nTabN   := FieldByName('TabN').AsInteger;
      nSpecNR := FieldByName('Spec_NR').AsInteger;
      nKdPst  := FieldByName('KdPst').AsInteger;
      cPSch   := FieldByName('PSch').AsString;
      cIsPst  := FieldByName('Is_Pst').AsString;
      while (FieldByName('TabN').AsInteger = nTabN) and
              (FieldByName('Spec_NR').AsInteger = nSpecNR) and
               (FieldByName('KdPst').AsInteger = nKdPst) and not Eof do begin
        if FieldByName('VidN').AsString = '6611' then begin
          nSmPerevoda := -FieldByName('Summa').AsFloat;
          nSmPsb := 0;
          nSmNDS := 0;
          nSmBezNDS := 0; end
        else begin
          nSmPerevoda := 0;
          nSmPsb := -FieldByName('Summa').AsFloat;
          nSmNDS := RoundTo(0.1666666 * nSmPsb, -2);
          nSmBezNDS := nSmPsb - nSmNDS;
        end;
        if cdsPrt.Locate('TabN;SpecNR', VarArrayOf([nTabN, nSpecNR]), []) then
          cdsPrt.Edit
        else begin
          cdsPrt.Append;
          cdsPrt.FieldByName('KdPst').AsInteger := nKdPst;
          cdsPrt.FieldByName('Is_Pst').AsString := cIsPst;
          cdsPrt.FieldByName('TabN').AsInteger := nTabN;
          cdsPrt.FieldByName('FamIO').AsString :=
                                         MyFamIO(FieldByName('Fam').AsString,
                                                 FieldByName('Ima').AsString,
                                                 FieldByName('Otch').AsString);
          cdsPrt.FieldByName('Fam').AsString := FieldByName('Fam').AsString;
          cdsPrt.FieldByName('Ima').AsString := FieldByName('Ima').AsString;
          cdsPrt.FieldByName('Otch').AsString := FieldByName('Otch').AsString;
          cdsPrt.FieldByName('SpecNR').AsInteger := nSpecNR;
          cdsPrt.FieldByName('PSch').AsString := cPSch;
          cdsPrt.FieldByName('Kuda').AsString := FieldByName('Adres').AsString;
          cdsPrt.FieldByName('Komu').AsString := FieldByName('Komu').AsString;
        end;
        cdsPrt.FieldByName('SmPerevoda').AsFloat :=
                        cdsPrt.FieldByName('SmPerevoda').AsFloat + nSmPerevoda;
        cdsPrt.FieldByName('SmPSB').AsFloat :=
                                  cdsPrt.FieldByName('SmPSB').AsFloat + nSmPSB;
        cdsPrt.FieldByName('SmNDS').AsFloat :=
                                  cdsPrt.FieldByName('SmNDS').AsFloat + nSmNDS;
        cdsPrt.FieldByName('SmBezNDS').AsFloat :=
                            cdsPrt.FieldByName('SmBezNDS').AsFloat + nSmBezNDS;
        cdsPrt.Post;
        Next;
      end;
    end;
  end;
  F6_PrtVedPvd(d_DtPrc, cdsPrt);
end;

end.
