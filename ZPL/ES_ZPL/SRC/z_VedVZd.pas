unit z_VedVZd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBClient, StdCtrls, Mask, DBCtrls, Buttons,
  ExtCtrls;

type
  TPayPercents = record
    nPrcOsnV,
    nPrcPrem,
    nPrcBoln,
    nPrcOtpTM,
    nPrcOtpBM,
    nPrcOtpNI,
    nPrcSocPsb,
    nPrcDismiss: double;
  end;

  TFormMegVedZd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbePrcOsnV: TDBEdit;
    dbePrcPrem: TDBEdit;
    dbePrcOtpTM: TDBEdit;
    dbeOtpBM: TDBEdit;
    dbePrcOtpNI: TDBEdit;
    cdsPrc: TClientDataSet;
    cdsPrcPrcOsnV: TFloatField;
    cdsPrcPrcPrem: TFloatField;
    cdsPrcPrcOtpTM: TFloatField;
    cdsPrcPrcOtpBM: TFloatField;
    cdsPrcPrcOtpNI: TFloatField;
    cdsPrcPrcDismiss: TFloatField;
    dsrcPrc: TDataSource;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    cdsPrcPrcSocPsb: TFloatField;
    Label6: TLabel;
    dbePrcSocPsb: TDBEdit;
    Label8: TLabel;
    dbePrcBoln: TDBEdit;
    cdsPrcPrcBoln: TFloatField;
    rBtnDoRound: TRadioButton;
    rBtnDoOkrugl: TRadioButton;
    Bevel1: TBevel;
    DBEditDismissed: TDBEdit;
    LblDismissed: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
  private
    nSvPrcOsnV, nSvPrcPrem, nSvPrcBoln,
    nSvPrcOtpTM, nSvPrcOtpBm, nSvPrcOtpNI, nSvPrcSocPsb, nSvPrcDismiss : double;
  public
    { Public declarations }
  end;

function GetMegVedZd(var PayPercents: TPayPercents;
                                              var bDoRound : boolean) : boolean;

const SECTION = 'z_VedVZd';

var
  FormMegVedZd: TFormMegVedZd;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetMegVedZd(
  var PayPercents: TPayPercents;
  var bDoRound : boolean): boolean;
begin
  Result := false;
  FormMegVedZd := TFormMegVedZd.Create(Application);
  with FormMegVedZd do begin
    Caption := '¬вод задани€';
    with cdsPRC do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      cdsPRCPrcOsnV.AsFloat   := nSvPrcOsnV;
      cdsPRCPrcPrem.AsFloat   := nSvPrcPrem;
      cdsPRCPrcBoln.AsFloat   := nSvPrcBoln;
      cdsPRCPrcOtpTM.AsFloat  := nSvPrcOtpTM;
      cdsPRCPrcOtpBM.AsFloat  := nSvPrcOtpBM;
      cdsPRCPrcOtpNI.AsFloat  := nSvPrcOtpNI;
      cdsPRCPrcSocPsb.AsFloat := nSvPrcSocPsb;
      cdsPrcPrcDismiss.AsFloat := nSvPrcDismiss;
      rBtnDoRound.Checked    := bDoRound;
    end;
    if ShowModal = mrOk then begin
      with PayPercents do begin
        nPrcOsnV   := cdsPRCPrcOsnV.AsFloat;
        nPrcPrem   := cdsPRCPrcPrem.AsFloat;
        nPrcBoln   := cdsPRCPrcBoln.AsFloat;
        nPrcOtpTM  := cdsPRCPrcOtpTM.AsFloat;
        nPrcOtpBM  := cdsPRCPrcOtpBM.AsFloat;
        nPrcOtpNI  := cdsPRCPrcOtpNI.AsFloat;
        nPrcSocPsb := cdsPRCPrcSocPsb.AsFloat;
        nPrcDismiss := cdsPRCPrcDismiss.AsFloat;
      end;
      bDoRound   := rBtnDoRound.Checked;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVedZd.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 650);
    Top  := ReadInteger(SECTION, 'wT', 750);
    nSvPrcOsnV   := ReadFloat(SECTION, 'nPrcOV', 50);
    nSvPrcPrem   := ReadFloat(SECTION, 'nPrcPr', 50);
    nSvPrcBoln   := ReadFloat(SECTION, 'nPrcBl', 50);
    nSvPrcOtpTM  := ReadFloat(SECTION, 'nPrcOT', 50);
    nSvPrcOtpBM  := ReadFloat(SECTION, 'nPrcOB', 50);
    nSvPrcOtpNI  := ReadFloat(SECTION, 'nPrcON', 50);
    nSvPrcSocPsb := ReadFloat(SECTION, 'nPrcSocPsb', 50);
    nSvPrcDismiss := ReadFloat(SECTION, 'nPrcDismiss', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVedZd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if cdsPRC.Active and (ModalResult = mrOK) then begin
      WriteFloat(SECTION, 'nPrcOV', cdsPRCPrcOsnV.AsFloat);
      WriteFloat(SECTION, 'nPrcPr', cdsPRCPrcPrem.AsFloat);
      WriteFloat(SECTION, 'nPrcBl', cdsPRCPrcBoln.AsFloat);
      WriteFloat(SECTION, 'nPrcOT', cdsPRCPrcOtpTM.AsFloat);
      WriteFloat(SECTION, 'nPrcOB', cdsPRCPrcOtpBM.AsFloat);
      WriteFloat(SECTION, 'nPrcON', cdsPRCPrcOtpNI.AsFloat);
      WriteFloat(SECTION, 'nPrcSocPsb', cdsPRCPrcSocPsb.AsFloat);
      WriteFloat(SECTION, 'nPrcDismiss', cdsPrcPrcDismiss.AsFloat);
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVedZd.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormMegVedZd.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
