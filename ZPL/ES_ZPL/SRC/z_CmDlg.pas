unit z_CmDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons;

type
  TFormDlgCloseMonth = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LblCntAll: TLabel;
    LblCntWithSch: TLabel;
    LblCntBezSch: TLabel;
    LblCntZapr: TLabel;
    bBtnCancel: TBitBtn;
    bBtnDelAll: TBitBtn;
    bBtnSetAll: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LblSmDlgPrp: TLabel;
    LblCntDlgPrp: TLabel;
    LblSmDlgTM: TLabel;
    LblCntDlgTM: TLabel;
    sBtnDlgDetails: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnDlgDetailsClick(Sender: TObject);
    procedure LblCntBezSchDblClick(Sender: TObject);
    procedure LblCntZaprDblClick(Sender: TObject);
    procedure LblCntDlgTMDblClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    n_CntBezSch, n_CntZapr, n_CntDlgPrp, n_CntDlgTM : SmallInt;
    n_SmDlgPrp : double;
  public
    { Public declarations }
  end;

function SetDelZapret(nCntAll, nCntBezSch, nCntWithSch, nCntZapr,
                       nCntDlgPrp, nCntDlgTM : SmallInt;
                        nSmDlgPrp, nSmDlgTM : double;
                         dDtPrc : TDateTime; var nCaseDo : SmallInt) : boolean;

const SECTION = 'z_CmDlg';

var
  FormDlgCloseMonth: TFormDlgCloseMonth;

implementation

uses a_Const, z_Main, z_ShEndV, z_ShDets;

{$R *.dfm}

//------------------------------------------------------------------------------
function SetDelZapret(nCntAll, nCntBezSch, nCntWithSch, nCntZapr,
                       nCntDlgPrp, nCntDlgTM : SmallInt;
                        nSmDlgPrp, nSmDlgTM : double;
                         dDtPrc : TDateTime; var nCaseDo : SmallInt) : boolean;
begin
  Result := false;
  FormDlgCloseMonth := TFormDlgCloseMonth.Create(Application);
  with FormDlgCloseMonth do begin
    d_DtPrc     := dDtPrc;
    n_CntBezSch := nCntBezSch;
    n_CntZapr   := nCntZapr;
    n_CntDlgPrp := nCntDlgPrp;
    n_CntDlgTM  := nCntDlgTM;
    LblCntAll.Caption     := IntToStr(nCntAll);
    LblCntWithSch.Caption := IntToStr(nCntWithSch);
    LblCntBezSch.Caption  := IntToStr(nCntBezSch);
    if nCntBezSch > 0 then begin
      LblCntBezSch.Color := clLime;
      LblCntBezSch.Hint  := 'Двойной щелчок мышки - подробности';
      LblCntBezSch.ShowHint := true; end
    else begin
      LblCntBezSch.Color := clCream;
      LblCntBezSch.Hint  := '';
      LblCntBezSch.ShowHint := false;
    end;
    LblCntZapr.Caption    := IntToStr(nCntZapr);
    if nCntZapr > 0 then begin
      LblCntZapr.Color := clLime;
      LblCntZapr.Hint  := 'Двойной щелчок мышки - подробности';
      LblCntZapr.ShowHint := true; end
    else begin
      LblCntZapr.Color := clCream;
      LblCntZapr.Hint  := '';
      LblCntZapr.ShowHint := false;
    end;
    LblSmDlgPrp.Caption := FloatToStrF(nSmDlgPrp, ffFixed, 16, 2);
    if nCntDlgPrp < 0 then
      LblCntDlgPrp.Caption := '?'
    else
      LblCntDlgPrp.Caption := IntToStr(nCntDlgPrp);
    LblSmDlgTM.Caption := FloatToStrF(nSmDlgTM, ffFixed, 16, 2);
    LblCntDlgTM.Caption := IntToStr(nCntDlgTM);
    if nCntDlgTM > 0 then begin
      LblCntDlgTM.Color := clLime;
      LblCntDlgTM.Hint  := 'Двойной щелчок мышки - подробности';
      LblCntDlgTM.ShowHint := true; end
    else begin
      LblCntDlgTM.Color := clCream;
      LblCntDlgTM.Hint  := '';
      LblCntDlgTM.ShowHint := false;
    end;
    if nCntZapr > 0 then begin
      Caption := 'Снять запреты';
      bBtnSetAll.Enabled := false;
      bBtnDelAll.Enabled := true; end
    else begin
      Caption := 'Установить запреты';
      bBtnSetAll.Enabled := true;
      bBtnDelAll.Enabled := false;
    end;
    if ShowModal = mrOk then begin
      if bBtnDelAll.Enabled then
        nCaseDo := 1     // Разрешить расчёт всем  (снять запрет)
      else
        nCaseDo := 2;    // Запретить расчёт всем  (установить запрет)
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgCloseMonth.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgCloseMonth.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDlgCloseMonth.sBtnDlgDetailsClick(Sender: TObject);
begin
  sBtnDlgDetails.Enabled := false;
  Application.ProcessMessages;
  ShwEndVupl(d_DtPrc, n_CntDlgPrp, n_SmDlgPrp);  {z_ShEndV}
  if n_CntDlgPrp < 0 then
    LblCntDlgPrp.Caption := '?'
  else
    LblCntDlgPrp.Caption := IntToStr(n_CntDlgPrp);
  sBtnDlgDetails.Enabled := true;
end;
//------------------------------------------------------------------------------
procedure TFormDlgCloseMonth.LblCntBezSchDblClick(Sender: TObject);
begin
  if n_CntBezSch > 0 then   // Показать "безРасчётных"
    ShwLstBezSch(d_DtPrc);  {z_ShDets}
{
Select u.Fam, u.Ima, u.Otch, u.ID, s.* from z_Sps s
   Left Outer Join z_Upi u on u.TabN = s.TabN
 where s.DtProc = '06/01/2016' and s.Nch is NULL and s.SvNch is NULL
}
;
end;
//------------------------------------------------------------------------------
procedure TFormDlgCloseMonth.LblCntZaprDblClick(Sender: TObject);
begin
  if n_CntZapr > 0 then     // Показать запрещённых к расчёту
    ShwLstZapret(d_DtPrc);  {z_ShDets}
end;
//------------------------------------------------------------------------------
procedure TFormDlgCloseMonth.LblCntDlgTMDblClick(Sender: TObject);
begin
  if n_CntDlgTM > 0 then    // Показать список должников Текущего Месяца
    ShwLstDlgTM(d_DtPrc);   {z_ShDets}
end;

end.
