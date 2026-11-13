unit z_UDpDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls;

type
  TFormUpiDopDlg = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelMsg: TLabel;
    Edit1: TEdit;
    sBtnObj: TSpeedButton;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    procedure sBtnObjClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    n_KdObj, n_KdSps : integer;
  public
    { Public declarations }
  end;

function DopDlg(cFamIO : string; dDtPriem, dDtUvoln : TDateTime; nTabN : integer;
                                        var nKdSps, nKdObj : integer) : boolean;

const SECTION = 'z_UDpDlg';

var
  FormUpiDopDlg: TFormUpiDopDlg;

implementation

uses a_Const, Z_Dm, z_Main, z_TObj;

{$R *.dfm}

//------------------------------------------------------------------------------
function DopDlg(cFamIO : string; dDtPriem, dDtUvoln : TDateTime; nTabN : integer;
                                        var nKdSps, nKdObj : integer) : boolean;
var cMsg, cShObj, cNmObj : string;
begin
  Result := false;
  FormUpiDopDlg := TFormUpiDopDlg.Create(Application);
  with FormUpiDopDlg do begin
    Caption := '¬нимание !!!';
    Label1.Caption := '';
    n_KdObj := nKdObj;
    n_KdSps := nKdSps;
    cMsg := '—отрудник ' + cFamIO + ', таб. н-р ' + IntToStr(nTabN);
    if dDtPriem <> 0 then
      cMsg := cMsg + ', дата приема ' + DateToStr(dDtPriem);
    if dDtUvoln <> 0 then
      cMsg := cMsg + ', дата увольн. ' + DateToStr(dDtUvoln);
    //cMsg  := cMsg + ' подключаетс€ в список є' + IntToStr(nKdSps) +
    //                ' текущего мес€ца в подразделение: ';
    cMsg  := cMsg + ' подключаетс€ в список текущего мес€ца в подразделение: ';
    LabelMsg.Caption := cMsg;
    Label1.Caption := IntToStr(n_KdObj);
    cShObj :=  DmMain.KdObj2ShObj(nKdObj, cNmObj);
    Edit1.Text := cNmObj;
    if ShowModal = mrOk then begin
      nKdObj := n_KdObj;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiDopDlg.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiDopDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiDopDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and ((n_KdObj = 0) or (Edit1.Text = '')) then begin
    ModalResult := mrNone;
    CanClose := false;
    ShowMessage('Ќе выбрано подразделение');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiDopDlg.sBtnObjClick(Sender: TObject);
var cShObj, cNmObj : string; bWasUpdated : boolean; nKdSpZ : integer;
begin
  Edit1.SetFocus;
  if GetKdObj(n_KdObj, nKdSpZ, cShObj, cNmObj, bWasUpdated) {z_TObj} then begin
    Edit1.Text := cNmObj;
    Label1.Caption := IntToStr(n_KdObj);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiDopDlg.Edit1Enter(Sender: TObject);
begin
  Edit1.Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormUpiDopDlg.Edit1Exit(Sender: TObject);
begin
  Edit1.Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormUpiDopDlg.Edit1KeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnObjClick(Self);
end;

end.
