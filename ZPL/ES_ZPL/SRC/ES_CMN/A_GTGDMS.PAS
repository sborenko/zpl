unit A_GtGdMs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles;

type
  TFormVvodGodMes = class(TForm)
    PanelMY: TPanel;
    sBtnYMinus: TSpeedButton;
    sBtnMMinus: TSpeedButton;
    sBtnMPlus: TSpeedButton;
    sBtnYPlus: TSpeedButton;
    stTextMY: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    procedure sBtnYMinusClick(Sender: TObject);
    procedure sBtnMMinusClick(Sender: TObject);
    procedure sBtnMPlusClick(Sender: TObject);
    procedure sBtnYPlusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure stTextMYDblClick(Sender: TObject);
  private
    { Private declarations }
    n_God, n_Mes : word;
    procedure SetLabCaption(nYear, nMonth : word);
    procedure SetNow;
  public
    { Public declarations }
  end;

function VvodGodMes(var nGod, nMes : word) : boolean;

const SECTION = 'VvGdMs';

var
  FormVvodGodMes: TFormVvodGodMes;

implementation

uses A_Const{, A_Main};

{$R *.DFM}

//--------------------------------------------------------------------
function VvodGodMes(var nGod, nMes : word) : boolean;
begin
  Result := false;
  FormVvodGodMes := TFormVvodGodMes.Create(Application);
  with FormVvodGodMes do begin
    Caption := '”становка мес€ца';
    n_God := nGod;
    n_Mes := nMes;
    SetLabCaption(n_God, n_Mes);
    if ShowModal = mrOk then begin
      nGod := n_God;
      nMes := n_Mes;
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormVvodGodMes.SetLabCaption(nYear, nMonth : word);
begin
  stTextMY.Caption := arrMonth[nMonth] + ' ' + IntToStr(nYear);
end;
//--------------------------------------------------------------------
procedure TFormVvodGodMes.sBtnYMinusClick(Sender: TObject);
begin
  n_God := n_God - 1;
  SetLabCaption(n_God, n_Mes);
end;
//--------------------------------------------------------------------
procedure TFormVvodGodMes.sBtnMMinusClick(Sender: TObject);
begin
  n_Mes := n_Mes - 1;
  if n_Mes = 0 then begin
    n_Mes := 12;
    n_God := n_God - 1;
  end;
  SetLabCaption(n_God, n_Mes);
end;
//--------------------------------------------------------------------
procedure TFormVvodGodMes.sBtnMPlusClick(Sender: TObject);
begin
  n_Mes := n_Mes + 1;
  if n_Mes = 13 then begin
    n_Mes := 1;
    n_God := n_God + 1;
  end;
  SetLabCaption(n_God, n_Mes);
end;
//--------------------------------------------------------------------
procedure TFormVvodGodMes.sBtnYPlusClick(Sender: TObject);
begin
  n_God := n_God + 1;
  SetLabCaption(n_God, n_Mes);
end;
//--------------------------------------------------------------------
procedure TFormVvodGodMes.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormVvodGodMes.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormVvodGodMes.SetNow;
var dNow : TDateTime; nD : word;
begin
  dNow := SysUtils.Date;
  DecodeDate(dNow, n_God, n_Mes, nD);
end;
//--------------------------------------------------------------------
procedure TFormVvodGodMes.stTextMYDblClick(Sender: TObject);
var nSvY, nSvM : word;
begin
  nSvY := n_God;
  nSvM := n_Mes;
  SetNow;
  if (nSvY <> n_God) or (nSvM <> n_Mes) then begin
    SetLabCaption(n_God, n_Mes);
  end;
end;

end.
