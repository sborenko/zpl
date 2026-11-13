unit FormStorn500X;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB, DBTables,
  CustDateUtils;

type
  TFrmStorn500X = class(TForm)
    LblVidN: TLabel;
    DBTxtVidN: TDBText;
    LblVidBeg: TLabel;
    DBTxtBeg: TDBText;
    LblVidEnd: TLabel;
    DBTxtEnd: TDBText;
    Bevel: TBevel;
    LblPeriod: TLabel;
    LblStornBeg: TLabel;
    PickStornBeg: TDateTimePicker;
    LblStornEnd: TLabel;
    PickStornEnd: TDateTimePicker;
    LblNotes: TLabel;
    EdtNotes: TEdit;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  public
    class function Run: boolean;
  end;

implementation

{$R *.dfm}

uses
  QryUtils, AppSettings, DModStorn500X;

//------------------------------------------------------------------------------
class function TFrmStorn500X.Run: boolean;
begin
  with TFrmStorn500X.Create(Application) do begin
    Result := ShowModal = mrOk;
    Free;
  end;
end;

//- SB -------------------------------------------------------------------------
procedure TFrmStorn500X.FormCreate(Sender: TObject);
begin
  with DataStorn500X.PartsCDS do begin
    PickStornBeg.DateTime := FieldByName('Dt_Beg').AsDateTime;
    PickStornEnd.DateTime := FieldByName('Dt_End').AsDateTime;
    EdtNotes.Text := FieldByName('NOTES').AsString;
  end;
end;

// ***
// ***
procedure TFrmStorn500X.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  OrigPeriod,
  NewPeriod: TPeriod;
begin
  if ModalResult = mrOk then
    with TDateUtils do begin
      NewPeriod := InitPeriod(pickStornBeg.DateTime, pickStornEnd.DateTime);
      OrigPeriod := TDateUtils.InitPeriod(DBTxtBeg.Field.AsDateTime, DBTxtEnd.Field.AsDateTime);

      if not PeriodIsNormalized(NewPeriod) then begin
        ShowMessage('ƒата конца периода не должла быть меньшей даты начала периода.');
        CanClose := false;

      end else if not (EventIsInPeriod(NewPeriod.Start, OrigPeriod) and
          EventIsInPeriod(NewPeriod.Finish, OrigPeriod)) then begin
        ShowMessage('ѕериод сторнировани€ должен быть в диапазоне ' +
          DateToStr(OrigPeriod.Start) + ' - ' + DateToStr(OrigPeriod.Finish));
        CanClose := false;

      end else
        DataStorn500X.SetStorno(NewPeriod, EdtNotes.Text);
    end;
end;

end.
