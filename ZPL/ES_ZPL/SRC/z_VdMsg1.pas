unit z_VdMsg1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons;

type
  TFormVdMsg01 = class(TForm)
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowVedMsg01;

const SECTION = 'z_VdMsg1';

var
  FormVdMsg01: TFormVdMsg01;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowVedMsg01;
begin
  FormVdMsg01 := TFormVdMsg01.Create(Application);
  with FormVdMsg01 do begin
    Caption := 'Обозначения колонок';
    ShowModal;
    Free;
  end
end;
//------------------------------------------------------------------------------
procedure TFormVdMsg01.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVdMsg01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
