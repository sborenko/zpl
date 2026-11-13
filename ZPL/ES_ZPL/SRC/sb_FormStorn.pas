unit sb_FormStorn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB, DBTables,
  z_St500X;

type
  TFormStorn = class(TForm)
    lblVidN: TLabel;
    dbtxtVidN: TDBText;
    lblVidBegin: TLabel;
    dbtxtBegin: TDBText;
    lblVidEnd: TLabel;
    dbtxtEnd: TDBText;
    bevel: TBevel;
    lblPeriod: TLabel;
    lblStornoBegin: TLabel;
    pickStornoBegin: TDateTimePicker;
    lblStornoEnd: TLabel;
    pickStornoEnd: TDateTimePicker;
    lblNotes: TLabel;
    edtNotes: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    qry: TQuery;
    dtOtklBeg, dtOktlEnd: TDateTime;
    procedure Apply;
    procedure InsertCopy(qry: TQuery);
  public
    { Public declarations }
  end;

var
  FormStorn: TFormStorn;

implementation

{$R *.dfm}

uses a_const, z_dm;

//- SB -------------------------------------------------------------------------
procedure TFormStorn.FormShow(Sender: TObject);
begin
  dtOtklBeg := dbtxtBegin.Field.AsDateTime;
  dtOktlEnd := dbtxtEnd.Field.AsDateTime;

  pickStornoBegin.DateTime := dtOtklBeg;
  pickStornoEnd.DateTime := dtOktlEnd;

  qry := dbtxtBegin.DataSource.DataSet as TQuery;

  edtNotes.Text := qry.FieldByName('NOTES').AsString
end; {FormShow}

//- SB -------------------------------------------------------------------------
procedure TFormStorn.btnOkClick(Sender: TObject);
var
  nTabN: integer;
  dDtProc, dZaMesGod: TDateTime;
  nY, nM, nD: Word;
  cMsg: string;
begin
  if (pickStornoBegin.DateTime >= dtOtklBeg)
      and (pickStornoEnd.DateTime <= dtOktlEnd)
      and (pickStornoBegin.DateTime <= pickStornoEnd.DateTime) then begin

    Apply;

    nTabN := qry.FieldByName('TABN').AsInteger;

    DecodeDate(Now, nY, nM, nD);
    dDtProc := EncodeDate(nY, nM, 1);

    dZaMesGod := qry.FieldByName('ZAMESGOD').AsDateTime;

    cMsg := 'TabN = ' + IntToStr(nTabN)
            + ', DtProc = ' + DateToStr(dDtProc)
            + ', ZaMesGod = ' + DateToStr(dZaMesGod)
            + ', VidN = 5002'
            + ', ƒтЌач. = ' + qry.FieldByName('DT_BEG').AsString
            + ', ƒтќконч. = ' + qry.FieldByName('DT_END').AsString;
    DmMain.AddLog(Now, nTabN, '—торнирована запись', gc_AppNmUsr, 'Z_Otkl', cMsg);

    FormStorn500X.Add8801Otkl(nTabN, dDtProc, dZaMesGod);

    Close;
  end
  else begin
    ShowMessage('ѕериод сторнировани€ должен быть в диапазоне '
      + dbtxtBegin.Field.AsString + ' - ' + dbtxtEnd.Field.AsString);
  end;
end; {btnOkClick}

//- SB -------------------------------------------------------------------------
procedure TFormStorn.Apply;
var
  dZaMesGod, dStornoBegin, dStornoEnd: TDateTime;
begin
  with qry do begin
    dZaMesGod := FieldByName('ZAMESGOD').AsDateTime;
    dStornoBegin := FieldByName('DT_BEG').AsDateTime;
    dStornoEnd := FieldByName('DT_END').AsDateTime;

    Edit;
 
    if pickStornoBegin.DateTime = dtOtklBeg then begin
      FieldByName('STORN').AsString := 'Y';
      FieldByName('DTSTORN').AsDateTime := Now;
      FieldByName('DT_END').AsDateTime := pickStornoEnd.DateTime;
      FieldByName('CHAS').AsFloat := DmMain.GetCntBudgChas(
          FieldByName('DT_BEG').AsDateTime, FieldByName('DT_END').AsDateTime);
      FieldByName('NOTES').AsString := edtNotes.Text;
      Post;
    end
    else begin
      FieldByName('DT_END').AsDateTime := pickStornoBegin.DateTime - 1;
      FieldByName('CHAS').AsFloat := DmMain.GetCntBudgChas(
          FieldByName('DT_BEG').AsDateTime, FieldByName('DT_END').AsDateTime);
      Post;

      InsertCopy(qry);
      FieldByName('STORN').AsString := 'Y';
      FieldByName('DTSTORN').AsDateTime := Now;
      FieldByName('DT_BEG').AsDateTime := pickStornoBegin.DateTime;
      FieldByName('DT_END').AsDateTime := pickStornoEnd.DateTime;
      FieldByName('CHAS').AsFloat := DmMain.GetCntBudgChas(
          FieldByName('DT_BEG').AsDateTime, FieldByName('DT_END').AsDateTime);
      FieldByName('NOTES').AsString := edtNotes.Text;
      Post;

      dStornoBegin := FieldByName('DT_BEG').AsDateTime;
      dStornoEnd := FieldByName('DT_END').AsDateTime;
    end;

    if pickStornoEnd.DateTime < dtOktlEnd then begin
      InsertCopy(qry);
      FieldByName('STORN').AsString := '';
      FieldByName('DTSTORN').AsString := '';
      FieldByName('DT_BEG').AsDateTime := pickStornoEnd.DateTime + 1;
      FieldByName('DT_END').AsDateTime := dtOktlEnd;
      FieldByName('CHAS').AsFloat := DmMain.GetCntBudgChas(
          FieldByName('DT_BEG').AsDateTime, FieldByName('DT_END').AsDateTime);
      FieldByName('NOTES').AsString := edtNotes.Text;
      Post;
    end;

    ApplyUpdates;
    CommitUpdates;

    Close;
    Open;

    Locate('ZAMESGOD;DT_BEG;DT_END', VarArrayOf([dZaMesGod, dStornoBegin, dStornoEnd]), []);
  end; {with}
end; {Apply}

//- SB -------------------------------------------------------------------------
procedure TFormStorn.InsertCopy(qry: TQuery);
type
  TOtkl = record
    KDSPS    : integer;
    DTPROC   : TDateTime;
    ZAMESGOD : TDateTime;
    DTSTORN  : TDateTime;
    TABN     : integer;
    VIDN     : string;
    OLDKDVIDN: integer;
    CHAS     : double;
    SUMMA    : double;
    OLDKDOBJ : integer;
    KDOBJ    : integer;
    KDKATP   : integer;
    DT_BEG   : TDateTime;
    DT_END   : TDateTime;
    PDN      : integer;
    KDSPZ    : integer;
    NOTES    : string;
    PRR      : integer;
    PRPV     : integer;
    KTO      : integer;
    PRKR     : integer;
    SPEC_NR  : integer;
    DTVDPV   : TDateTime;
    NRVDPV   : integer;
    MYNOTES  : string;
    SPECPS   : integer;
    PBNK     : integer;
    STORN    : string;
    KDBNK    : integer;
    KDTEMU   : integer;
  end;
var
  otkl: TOtkl;
begin
  with qry do begin
    otkl.KDSPS     := FieldByName('KDSPS')    .AsInteger;
    otkl.DTPROC    := FieldByName('DTPROC')   .AsDateTime;
    otkl.ZAMESGOD  := FieldByName('ZAMESGOD') .AsDateTime;
    otkl.DTSTORN   := FieldByName('DTSTORN')  .AsDateTime;
    otkl.TABN      := FieldByName('TABN')     .AsInteger;
    otkl.VIDN      := FieldByName('VIDN')     .AsString;
    otkl.OLDKDVIDN := FieldByName('OLDKDVIDN').AsInteger;
    otkl.CHAS      := FieldByName('CHAS')     .AsFloat;
    otkl.SUMMA     := FieldByName('SUMMA')    .AsFloat;
    otkl.OLDKDOBJ  := FieldByName('OLDKDOBJ') .AsInteger;
    otkl.KDOBJ     := FieldByName('KDOBJ')    .AsInteger;
    otkl.KDKATP    := FieldByName('KDKATP')   .AsInteger;
    otkl.DT_BEG    := FieldByName('DT_BEG')   .AsDateTime;
    otkl.DT_END    := FieldByName('DT_END')   .AsDateTime;
    otkl.PDN       := FieldByName('PDN')      .AsInteger;
    otkl.KDSPZ     := FieldByName('KDSPZ')    .AsInteger;
    otkl.NOTES     := FieldByName('NOTES')    .AsString;
    otkl.PRR       := FieldByName('PRR')      .AsInteger;
    otkl.PRPV      := FieldByName('PRPV')     .AsInteger;
    otkl.KTO       := FieldByName('KTO')      .AsInteger;
    otkl.PRKR      := FieldByName('PRKR')     .AsInteger;
    otkl.SPEC_NR   := FieldByName('SPEC_NR')  .AsInteger;
    otkl.DTVDPV    := FieldByName('DTVDPV')   .AsDateTime;
    otkl.NRVDPV    := FieldByName('NRVDPV')   .AsInteger;
    otkl.MYNOTES   := FieldByName('MYNOTES')  .AsString;
    otkl.SPECPS    := FieldByName('SPECPS')   .AsInteger;
    otkl.PBNK      := FieldByName('PBNK')     .AsInteger;
    otkl.STORN     := FieldByName('STORN')    .AsString;
    otkl.KDBNK     := FieldByName('KDBNK')    .AsInteger;
    otkl.KDTEMU    := FieldByName('KDTEMU')   .AsInteger;

    Insert;

    FieldByName('KDSPS')    .AsInteger  := otkl.KDSPS    ;
    FieldByName('DTPROC')   .AsDateTime := otkl.DTPROC   ;
    FieldByName('ZAMESGOD') .AsDateTime := otkl.ZAMESGOD ;
    FieldByName('DTSTORN')  .AsDateTime := otkl.DTSTORN  ;
    FieldByName('TABN')     .AsInteger  := otkl.TABN     ;
    FieldByName('VIDN')     .AsString   := otkl.VIDN     ;
    FieldByName('OLDKDVIDN').AsInteger  := otkl.OLDKDVIDN;
    FieldByName('CHAS')     .AsFloat    := otkl.CHAS     ;
    FieldByName('SUMMA')    .AsFloat    := otkl.SUMMA    ;
    FieldByName('OLDKDOBJ') .AsInteger  := otkl.OLDKDOBJ ;
    FieldByName('KDOBJ')    .AsInteger  := otkl.KDOBJ    ;
    FieldByName('KDKATP')   .AsInteger  := otkl.KDKATP   ;
    FieldByName('DT_BEG')   .AsDateTime := otkl.DT_BEG   ;
    FieldByName('DT_END')   .AsDateTime := otkl.DT_END   ;
    FieldByName('PDN')      .AsInteger  := otkl.PDN      ;
    FieldByName('KDSPZ')    .AsInteger  := otkl.KDSPZ    ;
    FieldByName('NOTES')    .AsString   := otkl.NOTES    ;
    FieldByName('PRR')      .AsInteger  := otkl.PRR      ;
    FieldByName('PRPV')     .AsInteger  := otkl.PRPV     ;
    FieldByName('KTO')      .AsInteger  := otkl.KTO      ;
    FieldByName('PRKR')     .AsInteger  := otkl.PRKR     ;
    FieldByName('SPEC_NR')  .AsInteger  := otkl.SPEC_NR  ;
    FieldByName('DTVDPV')   .AsDateTime := otkl.DTVDPV   ;
    FieldByName('NRVDPV')   .AsInteger  := otkl.NRVDPV   ;
    FieldByName('MYNOTES')  .AsString   := otkl.MYNOTES  ;
    FieldByName('SPECPS')   .AsInteger  := otkl.SPECPS   ;
    FieldByName('PBNK')     .AsInteger  := otkl.PBNK     ;
    FieldByName('STORN')    .AsString   := otkl.STORN    ;
    FieldByName('KDBNK')    .AsInteger  := otkl.KDBNK    ;
    FieldByName('KDTEMU')   .AsInteger  := otkl.KDTEMU   ;
  end; {with}
end; {InsertCopy}

end.
