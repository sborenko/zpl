unit a_EIncRS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFormAEInclRS = class(TForm)
    Label1: TLabel;
    dbeShPPdr: TDBEdit;
    LabelKdRSch: TLabel;
    dbeKdRSch: TDBEdit;
    dbeNmRSch: TDBEdit;
    Label4: TLabel;
    dbeRSch: TDBEdit;
    Label5: TLabel;
    dbeMfo: TDBEdit;
    Label6: TLabel;
    dbeOkpo: TDBEdit;
    Label7: TLabel;
    DeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label2: TLabel;
    dbeSchBU: TDBEdit;
    sBtnSchBU: TSpeedButton;
    LabelKdSbu: TLabel;
    dbeKdSbu: TDBEdit;
    Label3: TLabel;
    dbeNmBank: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure sBtnSchBUClick(Sender: TObject);
    procedure dbeSchBUExit(Sender: TObject);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EAInclRSch : boolean;

const SECTION = 'a_EIncRS';

var
  FormAEInclRS: TFormAEInclRS;

implementation

uses A_Const, a_Dm, a_EPdrB, A_SBU, a_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAInclRSch : boolean;
begin
  Result := false;
  FormAEInclRS := TFormAEInclRS.Create(Application);
  with FormAEInclRS do begin
    LabelKdRSch.Visible := bFlagDbg;
    dbeKdRSch.Visible := bFlagDbg;
    LabelKdSbu.Visible := bFlagDbg;
    dbeKdSbu.Visible := bFlagDbg;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEInclRS.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEInclRS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEInclRS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    dbeNmRSch.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
function TFormAEInclRS.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
//  if dbeShPPdr.Text = '' then
//    mListErr.Add('Не заполнен шифр счёта');
  if dbeNmRSch.Text = '' then
    mListErr.Add('Не заполнено название расч. счёта');
  if dbeRSch.Text = '' then
    mListErr.Add('Не введен расчётный счёт');
  if dbeMfo.Text = '' then
    mListErr.Add('Не заполнено поле МФО ');
  if dbeOkpo.Text = '' then
    mListErr.Add('Не заполнено поле ОКПО');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormAEInclRS.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAEInclRS.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAEInclRS.dbeSchBUExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormAEInclRS.sBtnSchBUClick(Sender: TObject);
var nKdSbu : integer; cSchBU, cPSch, cNmSBU : string; bHsCh : boolean;
begin
  dbeSchBU.SetFocus;
  nKdSbu := dbeKdSbu.Field.AsInteger;
  if GetSBU(nKdSbu, cSchBU, cPSch, cNmSBU, bHsCh) {A_SBU} then begin
    dbeKdSbu.Field.AsInteger := nKdSbu;
    dbeSchBU.Text := cSchBU;        // изменится и var n_KdSchBUend;
  end;
    bBtnOk.SetFocus;
end;

end.
