unit z_VdMsg0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons;

type
  TFormVdMsg00 = class(TForm)
    bBtnCancel: TBitBtn;
    Memo1: TMemo;
    sBtnSaveMemo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnSaveMemoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowVedMsg00;

const SECTION = 'z_VdMsg0';

var
  FormVdMsg00: TFormVdMsg00;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowVedMsg00;
begin
  FormVdMsg00 := TFormVdMsg00.Create(Application);
  with FormVdMsg00 do begin
    Caption := 'Пояснения';
    ShowModal;
    Free;
  end
end;
//------------------------------------------------------------------------------
procedure TFormVdMsg00.FormCreate(Sender: TObject);
begin
  sBtnSaveMemo.Visible := bFlagDbg;
  Memo1.ReadOnly := not sBtnSaveMemo.Visible;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 558);
    Width  := ReadInteger(SECTION, 'wW', 635);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdMsg00.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdMsg00.sBtnSaveMemoClick(Sender: TObject);
begin
  Memo1.Lines.SaveToFile(cDirTemp + 'MemoMsg.txt');
end;

end.
