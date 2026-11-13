unit z_Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, DateUtils;

type
  TFormSplash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    LabelOpi: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSplash: TFormSplash;

implementation

uses a_Const;

{$R *.DFM}

procedure TFormSplash.FormCreate(Sender: TObject);
var cTmp : string;
begin
  cTmp := IntToStr(MilliSecondOfTheHour(Now));
  cTmp := Copy(cTmp, 6, 1);
  if cTmp = '5' then begin
    //Image2.Visible := true;
    //Image3.Visible := true;
  end;
end;

end.
