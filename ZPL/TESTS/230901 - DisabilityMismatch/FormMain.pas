unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmMain = class(TForm)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses DModMain, FormProgress;

{$R *.dfm}

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  TFrmProgress.Run(DmMain, DmMain.Start);
end;

end.
