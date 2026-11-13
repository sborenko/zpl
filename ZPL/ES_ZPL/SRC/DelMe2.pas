unit DelMe2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AxCtrls, OleCtrls, VCF1;

type
  TFormDelMe2 = class(TForm)
    F1Book1: TF1Book;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DelMe_2;

var
  FormDelMe2: TFormDelMe2;

implementation

{$R *.dfm}

procedure DelMe_2;
begin
  FormDelMe2 := TFormDelMe2.Create(Application);
  with FormDelMe2 do begin
    ShowModal;
    Free;
  end;
end;

end.
