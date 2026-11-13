unit z_MgVdZd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBClient, StdCtrls, Mask, DBCtrls, Buttons;

type
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
    dsrcPrc: TDataSource;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
  private
    { Private declarations }
    nSvPrcOsnV, nSvPrcPrem,
    nSvPrcOtpTM, nSvPrcOtpBm, nSvPrcOtpNI : double;
  public
    { Public declarations }
  end;

function GetMegVedZd(var nPrcOsnV, nPrcPrem,
                           nPrcOtpTM, nPrcOtpBm, nPrcOtpNI : double) : boolean;

const SECTION = 'z_MgVdZd';

var
  FormMegVedZd: TFormMegVedZd;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetMegVedZd(var nPrcOsnV, nPrcPrem,
                           nPrcOtpTM, nPrcOtpBm, nPrcOtpNI : double) : boolean;
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
      cdsPRCPrcOsnV.AsFloat  := nSvPrcOsnV;
      cdsPRCPrcPrem.AsFloat  := nSvPrcPrem;
      cdsPRCPrcOtpTM.AsFloat := nSvPrcOtpTM;
      cdsPRCPrcOtpBM.AsFloat := nSvPrcOtpBM;
      cdsPRCPrcOtpNI.AsFloat := nSvPrcOtpNI;
    end;
    if ShowModal = mrOk then begin
      nPrcOsnV  := cdsPRCPrcOsnV.AsFloat;
      nPrcPrem  := cdsPRCPrcPrem.AsFloat;
      nPrcOtpTM := cdsPRCPrcOtpTM.AsFloat;
      nPrcOtpBM := cdsPRCPrcOtpBM.AsFloat;
      nPrcOtpNI := cdsPRCPrcOtpNI.AsFloat;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMegVedZd.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 150);
    Top  := ReadInteger(SECTION, 'wT', 150);
    nSvPrcOsnV := ReadFloat(SECTION, 'nPrcOV', 50);
    nSvPrcPrem := ReadFloat(SECTION, 'nPrcPr', 50);
    nSvPrcOtpTM := ReadFloat(SECTION, 'nPrcOT', 50);
    nSvPrcOtpBM := ReadFloat(SECTION, 'nPrcOB', 50);
    nSvPrcOtpNI := ReadFloat(SECTION, 'nPrcON', 50);
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
      WriteFloat(SECTION, 'nPrcOT', cdsPRCPrcOtpTM.AsFloat);
      WriteFloat(SECTION, 'nPrcOB', cdsPRCPrcOtpBM.AsFloat);
      WriteFloat(SECTION, 'nPrcON', cdsPRCPrcOtpNI.AsFloat);
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
