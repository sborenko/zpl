unit A_InpPsw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormMyInputPsw = class(TForm)
    EditValue: TEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelPrompt: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MyInputPsw(cCaption, cPrompt : string;
                                      var cValue : string) : boolean;

var
  FormMyInputPsw: TFormMyInputPsw;

implementation

{$R *.DFM}

function MyInputPsw(cCaption, cPrompt : string;
                                      var cValue : string) : boolean;
begin
  Result := false;
  FormMyInputPsw := TFormMyInputPsw.Create(Application);
  with FormMyInputPsw do begin
    Caption := cCaption;
    LabelPrompt.Caption := cPrompt;
    if ShowModal = mrOk then begin
      cValue := EditValue.Text;
      Result := true;
    end;
    Free;
  end;
end;

end.
