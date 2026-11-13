unit z_MyStop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormMyStop = class(TForm)
    BitBtn1: TBitBtn;
    LabelFIO: TLabel;
    LabelTime: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GoMyStop : boolean;

var
  FormMyStop: TFormMyStop;

implementation

uses z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GoMyStop : boolean;
begin
  Result := true;
  FormMyStop := TFormMyStop.Create(Application);
  with FormMyStop do begin
    FormZpMain.bStopSchet := false;
    LabelFIO.Caption := '';
    Show;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyStop.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Прервать расчет?:', mtWarning,
                                     [mbYes, mbNo], 0) = mrYes then begin
    FormZpMain.bStopSchet := true;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormMyStop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
