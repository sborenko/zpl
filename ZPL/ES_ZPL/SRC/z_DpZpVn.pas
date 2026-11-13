unit z_DpZpVn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, DBCtrls, Buttons, DB, Mask, DBClient;

type
  string4 = string[4];
  TFormDpZpr = class(TForm)
    Label1: TLabel;
    cdsTmp: TClientDataSet;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    rBtnDtPrc: TRadioButton;
    rBtnDtZaMG: TRadioButton;
    cdsTmpVidN: TStringField;
    dbeVidN: TDBEdit;
    dsrcTmp: TDataSource;
    sBtnVidN: TSpeedButton;
    cdsTmpShVidN: TStringField;
    dbeShVidN: TDBEdit;
    DBComboDtMes: TDBComboBox;
    Label2: TLabel;
    cdsTmpDtMes: TDateField;
    LbxFilter: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboDtMesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsTmpDtMesSetText(Sender: TField; const Text: String);
    procedure sBtnVidNClick(Sender: TObject);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure DBComboDtMesEnter(Sender: TObject);
    procedure DBComboDtMesExit(Sender: TObject);
  private
    { Private declarations }
    cSvVidN : string4;
    nSvDtMes : integer;
    nSvCaseMes : word;
  public
    { Public declarations }
  end;

function DopZapros(var cVidN : String4; var dDtMes : TDateTime;
                                                 var nCaseMes : word) : boolean;

const SECTION = 'z_dpZpVN';

var
  FormDpZpr: TFormDpZpr;

implementation

uses a_Const, a_Lib, z_Dm, z_Main, z_TVids;

{$R *.dfm}

//------------------------------------------------------------------------------
function DopZapros(var cVidN : String4; var dDtMes : TDateTime;
                                                 var nCaseMes : word) : boolean;
var cMG : ShortString; cDummy : string;
    nY, nM, nD : word; n : SmallInt;
begin
  Result := false;
  FormDpZpr := TFormDpZpr.Create(Application);
  with FormDpZpr do begin
    Caption := '¬вод задани€';
    with cdsTmp do begin
      if Active then Close;
      CreateDataSet;
      Open;
      Append;
      if cSvVidN <> '' then begin
        FieldByName('VidN').AsString := cSvVidN;
        FieldByName('ShVidN').AsString := DmMain.VidN2ShVidN(cSvVidN, cDummy);
      end;
      if nSvDtMes = 0 then begin
        DecodeDate(Date, nY, nM, nD);
        nSvDtMes := Round(EncodeDate(nY, nM, 1));
      end;
      FieldByName('DtMes').AsDateTime := nSvDtMes;
    end;
    if nSvCaseMes = 1 then
      rBtnDtPrc.Checked := true
    else
      rBtnDtZaMG.Checked := true;
    cMG := cdsTmp.FieldByName('DtMes').AsString;
    if not MyEmptyDate(cMG) then begin
      cMG := Copy(cMG, 4, 7);
      n := DBComboDtMes.Items.IndexOf(cMG);
      if n >= 0 then
        DBComboDtMes.ItemIndex := n;
    end;
    if ShowModal = mrOk then begin
      if rBtnDtPrc.Checked then
        nCaseMes := 1
      else
        nCaseMes := 2;
      cVidN := cdsTmp.FieldByName('VidN').AsString;
      dDtMes := cdsTmp.FieldByName('DtMes').AsDateTime;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDpZpr.FormCreate(Sender: TObject);
begin
  if FileExists(cDirVids + 'CmboZaMG.lbx') then
    dbComboDtMes.Items.LoadFromFile(cDirVids + 'CmboZaMG.lbx');
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 100);
    Height := 136;
    nSvDtMes   := ReadInteger(SECTION, 'nSvDtMes', 0);
    nSvCaseMes := ReadInteger(SECTION, 'nSvCsM', 1);
    cSvVidN := ReadString(SECTION, 'cSvVidN', '1003');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDpZpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nSvDtMes',
                          Round(cdsTmp.FieldByName('DtMes').AsDateTime));
    if rBtnDtPrc.Checked then
      WriteInteger(SECTION, 'nSvCsM', 1)
    else
      WriteInteger(SECTION, 'nSvCsM', 2);
    WriteString(SECTION, 'cSvVidN', cdsTmp.FieldByName('VidN').AsString);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDpZpr.DBComboDtMesKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    DBComboDtMes.Show;
end;
//------------------------------------------------------------------------------
procedure TFormDpZpr.cdsTmpDtMesSetText(Sender: TField; const Text: String);
var cText : string;
begin
  cText := Text;
  if myEmptyMesGod(cText) then
    Sender.AsString := ''
  else
    Sender.AsString := '01-' + Text;
end;
//------------------------------------------------------------------------------
procedure TFormDpZpr.sBtnVidNClick(Sender: TObject);
var cVidN, p_KEKV : string4; p_ShVidN : string15; p_NmVidN : string;
                     p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
                     p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
                     p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
                     p_SAlim, p_SSocStrah, p_SBzr, p_CNdb,
                     p_Sp_PF, p_Sp_FSTVP, p_Sp_FSNV, p_Sp_FZ : string1;
                     p_KdSpZ : integer; bWasUpdated : boolean;
begin
  dbeShVidN.SetFocus;
  with cdsTmp do begin
    cVidN := FieldByName('VidN').AsString;
    if GetVidN(cVidN, p_KEKV, p_ShVidN, p_NmVidN,
               p_zp13, p_Otp, p_Bln, p_Otpuskn, p_Bolnic, p_SPrm, p_CPrm,
               p_Deti, p_DetiM, p_DetiK, p_DetiG, p_Sovm, p_Spov, p_Ind,
               p_Dhd, p_OklFnd, p_CBudg, p_SNdb, p_SPdn, p_SPrf, p_SPens,
               p_SAlim, p_SSocStrah, p_SBzr, p_CNdb, p_Sp_PF, p_Sp_FSTVP,
               p_Sp_FSNV, p_Sp_FZ, p_KdSpZ, bWasUpdated, LbxFilter) {z_TVids}
                                                                    then begin
      if bWasUpdated then begin
        DmMain.qryVidN_LU.Close;
        DmMain.qryVidN_LU.Open;
      end;
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('VidN').AsString := cVidN;
      FieldByName('ShVidN').AsString := p_ShVidN;
      DBComboDtMes.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDpZpr.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDpZpr.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormDpZpr.DBComboDtMesEnter(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDpZpr.DBComboDtMesExit(Sender: TObject);
begin
  (Sender as TDBComboBox).Color := clWindow;
end;

end.
