unit z_GtMPkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Mask, Buttons, ComCtrls;

type
  TFormGtMesPkt = class(TForm)
    Label1: TLabel;
    MaskEdZaMG: TMaskEdit;
    Label2: TLabel;
    UpDown: TUpDown;
    edZaMesFakt: TEdit;
    Label3: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label4: TLabel;
    edSpZ: TEdit;
    sBtnSPZ: TSpeedButton;
    edKdSpZ: TEdit;
    procedure MaskEdZaMGEnter(Sender: TObject);
    procedure MaskEdZaMGExit(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure EeZaMesFaktExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnSPZClick(Sender: TObject);
    procedure edSpZExit(Sender: TObject);
    procedure edSpZKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    cMes, cGod, c_SvMes, c_SvGod : ShortString;
    n_SvZaMes, nMes, nGod : SmallInt;
    c_SvSpZ, c_SvKdSpZ : ShortString;
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function DlgVubZaMes(nWYear : SmallInt; var nZaMesFakt, nKdSpZ : SmallInt;
                    var cSpZ : ShortString; var dZaMGPkt : TDateTime) : boolean;

const SECTION = 'z_GtMPkt';

var
  FormGtMesPkt: TFormGtMesPkt;

implementation

uses a_Const, a_Lib, a_Dm, a_Sbu, A_ShwErr, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function DlgVubZaMes(nWYear : SmallInt; var nZaMesFakt, nKdSpZ : SmallInt;
                    var cSpZ : ShortString; var dZaMGPkt : TDateTime) : boolean;
var nY, nM, nD : word;
begin
  Result := false;
  FormGtMesPkt := TFormGtMesPkt.Create(Application);
  with FormGtMesPkt do begin
    DecodeDate(dDtProc, nY, nM, nD);
    Caption := 'Отклонения в ' + MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    Label1.Caption := 'Формирование по данным за ' + IntToStr(nWYear) +
                                ' год пакета отклонений к текущему месяцу';
    if n_SvZaMes > 0 then
      UpDown.Position := n_SvZaMes;
    if c_SvSpZ > '' then
      edSpZ.Text := c_SvSpZ;
    if c_SvKdSpZ > '' then
      edKdSpZ.Text := c_SvKdSpZ;
    if (c_SvMes > '') and (c_SvGod > '') then
      MaskEdZaMG.Text := c_SvMes + '-' + c_SvGod;
    if ShowModal = mrOk then begin
      nZaMesFakt := UpDown.Position;
      cSpZ := c_SvSpZ;
      nKdSpZ := StrToInt(edKdSpZ.Text);
      nMes := StrToInt(c_SvMes);
      nGod := StrToInt(c_SvGod);
      dZaMGPkt := EncodeDate(nGod, nMes, 1);
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.MaskEdZaMGEnter(Sender: TObject);
begin
  (Sender as TMaskEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.MaskEdZaMGExit(Sender: TObject);
var cText : ShortString;
    bPravimMes, bPravimGod : boolean;
begin
  if ModalResult = mrCancel then Exit;
  cText := MaskEdZaMG.Text;
  bPravimMes := false;
  bPravimGod := false;
  if (cText <> '  -    ') then begin
    cMes := Trim(Copy(cText, 1, 2));
    cGod := Trim(Copy(cText, 4, 4));
    nMes := StrToInt(cMes);
    nGod := StrToInt(cGod);
    if (nGod >= 0) and (nGod < 80) then begin
      bPravimGod := true;
      cGod := '20' + cGod; end
    else if (nGod >= 80) and (nGod <= 99) then begin
      bPravimGod := true;
      cGod := '19' + cGod;
    end;
    if (Length(cMes) = 1) and (nMes >= 1) and (nMes < 10) then begin
      cMes := '0' + cMes;
      bPravimMes := true;
    end;
    if bPravimMes or bPravimGod then
      MaskEdZaMG.Text := cMes + '-' + cGod;
    if (cMes < '01') or (cMes > '12') or
                        (cGod < '2000') or (cGod > '2030') then begin
      ShowMessage('Плохой месяц: ' + cMes + '-' + cGod);
      MaskEdZaMG.SetFocus; end
    else begin
      nMes := StrToInt(cMes);
      nGod := StrToInt(cGod);
      c_SvMes := cMes;
      c_SvGod := cGod;
      (Sender as TMaskEdit).Color := clWindow;
    end;
    (Sender as TMaskEdit).Color := clWindow;
  end;
  (Sender as TMaskEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.EditEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.EeZaMesFaktExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.edSpZExit(Sender: TObject);
var cSpZ : ShortString; nKdSpZ : SmallInt; bHsCh : boolean;
begin
  cSpZ := edSpZ.Text;
  if cSpz = '' then begin
    edKdSpz.Text := '';
    (Sender as TEdit).Color := clWindow; end
  else begin
    nKdSpZ := Form_Dm.SchBU2KdSBU(cSpZ, bHsCh);
    if nKdSpZ <= 0 then
      Raise Exception.
              Create('Нет в плане счетов счета "' + cSpZ + '"')
    else if bHsCh then
      Raise Exception.
              Create('Тут должен быть аналитический счет');
    edKdSpZ.Text := intToStr(nKdSpZ);
    c_SvSpZ := edSpZ.Text;
    c_SvKdSpZ := edKdSpZ.Text;
    (Sender as TEdit).Color := clWindow;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    n_SvZaMes := ReadInteger(SECTION, 'nSvZaM', 1);
    c_SvMes := ReadString(SECTION, 'cSvMes', '');
    c_SvGod := ReadString(SECTION, 'cSvGod', '');
    c_SvSpZ := ReadString(SECTION, 'cSvSpZ', '');
    c_SvKdSpZ := ReadString(SECTION, 'cSvKdSpZ', '');
    Free;
  end;
  edKdSpZ.Visible := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nSvZaM', UpDown.Position);
    WriteString(SECTION, 'cSvMes', c_SvMes);
    WriteString(SECTION, 'cSvGod', c_SvGod);
    WriteString(SECTION, 'cSvSpZ', c_SvSpZ);
    WriteString(SECTION, 'cSvKdSpZ', c_SvKdSpZ);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      edZaMesFakt.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.sBtnSPZClick(Sender: TObject);
var nKdSPZ : integer; cSpZ, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  edSPZ.SetFocus;
  if edKdSpz.Text > '' then
    nKdSpZ := StrToInt(edKdSpZ.Text)
  else
    nKdSpZ := 0;
  cSpZ := edSpZ.Text;
  if GetSBU(nKdSpZ, cSpZ, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
    if bHsCh then begin
      ShowMessage('Выбранный счёт имеет СубСчета - на него относить нельзя');
      edSpZ.SetFocus;
      Exit;
    end;
    edSpZ.Text := cSpZ;
    edKdSpZ.Text := IntToStr(nKdSpZ);
    c_SvSpZ := edSpZ.Text;
    c_SvKdSpZ := edKdSpZ.Text;
    bBtnOk.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
function TFormGtMesPkt.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (edZaMesFakt.Text = '') then
    mListErr.Add('Не введен месяц, за который выбираются данные');
  if (MaskEdZaMG.Text = '') or (MaskEdZaMG.Text = '__-____') then
    mListErr.Add('Не введено значение для поля "ЗаМесяц"');
  if (edSpZ.Text = '') then
    mListErr.Add('Не выбран счёт, на который относятся записи пакета');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormGtMesPkt.edSpZKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    sBtnSPZ.Click;
end;

end.
