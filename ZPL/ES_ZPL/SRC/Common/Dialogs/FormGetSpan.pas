unit FormGetSpan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DateLib;

type
  TFrmGetSpan = class(TForm)
    PanelBottom: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    GrBoxSpan: TGroupBox;
    LblBegin: TLabel;
    LblEnd: TLabel;
    EdtBegin: TMaskEdit;
    EdtEnd: TMaskEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Span: TPeriod;
  public
    class function Run(Title: ShortString; var Period: TPeriod): Boolean;
  end;

var
  FrmGetSpan: TFrmGetSpan;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFrmGetSpan.Run(
  Title: ShortString;
  var Period: TPeriod
): Boolean;
begin
  with TFrmGetSpan.Create(nil) do begin
    Span := Period;
    GrBoxSpan.Caption := ' ' + Title + ' ';

    EdtBegin.Text := DateToStr(Span.Start);
    EdtEnd.Text := DateToStr(Span.Finish);

    Result := ShowModal = mrOk;

    if Result then
      Period := Span;
      
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFrmGetSpan.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
    with DateUtils do begin
      if Trim(EdtBegin.Text) <> '-  -' then
        Span.Start := StrToDate(EdtBegin.Text)
      else
        Span.Start := 0;

      if Trim(EdtEnd.Text) <> '-  -' then
        Span.Finish := StrToDate(EdtEnd.Text)
      else
        Span.Finish := 0;

      CanClose := not PeriodIsEmpty(Span);

      if not CanClose then
        ShowMessage('Ќачало периода не может быть больше окончани€.'); 
    end;
end;

end.
