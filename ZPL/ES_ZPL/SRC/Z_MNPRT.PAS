unit Z_MnPrt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls;

type
  TFormZpMnuPrt = class(TForm)
    Bevel1: TBevel;
    sBtnVedZpCurrent: TSpeedButton;
    sBtnSvodPeriod: TSpeedButton;
    sBtnSvodMes: TSpeedButton;
    sBtnDr8: TSpeedButton;
    sBtnSpiski: TSpeedButton;
    sBtnSprNOP: TSpeedButton;
    Bevel2: TBevel;
    sBtnRaschetMes: TSpeedButton;
    sBtnSprSostFamily: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnVedZpCurrentClick(Sender: TObject);
    procedure sBtnDr8Click(Sender: TObject);
  private
    { Private declarations }
    n_ZpCurY, n_ZpCurM : word;
  public
    { Public declarations }
  end;

procedure ShowModalZpMnuPrt(nZpCurY, nZpCurM : word);

const SECTION = 'Zp_MnPrt';

var
  FormZpMnuPrt: TFormZpMnuPrt;

implementation

uses A_Const, Z_MkVdZp, Z_MkDr8;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure ShowModalZpMnuPrt(nZpCurY, nZpCurM : word);
begin
  FormZpMnuPrt := TFormZpMnuPrt.Create(Application);
  with FormZpMnuPrt do begin
    n_ZpCurY := nZpCurY;
    n_ZpCurM := nZpCurM;
    Caption := 'Документы раздела "Зарплата"';
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMnuPrt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 150);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMnuPrt.FormClose(Sender: TObject;
                                           var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZpMnuPrt.sBtnVedZpCurrentClick(Sender: TObject);
begin
//  MakeZpCurrent(n_ZpCurY, n_ZpCurM);       {Z_MkVdZp}
end;
//------------------------------------------------------------------------------
procedure TFormZpMnuPrt.sBtnDr8Click(Sender: TObject);
begin
  MakeDr8;           {Z_MkDr8}
end;

end.
