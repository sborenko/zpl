unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BtnRun: TBitBtn;
    LblDone: TLabel;
    procedure BtnRunClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  DModMain;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TForm1.BtnRunClick(Sender: TObject);
begin
  LblDone.Caption := '';
  Application.ProcessMessages;
  BtnRun.Enabled := false;
  
  TDmMain.Run;
  
  LblDone.Caption := 'Done';
  BtnRun.Enabled := true;
  ActiveControl := BtnRun;
end;

//------------------------------------------------------------------------------
end.
