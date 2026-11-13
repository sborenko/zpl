unit A_GtDats;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Mask, ComCtrls, Buttons, ExtCtrls;

type
  TFormGetDates = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabelPrompt: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    dtPicDtBeg: TDateTimePicker;
    dtPicDtEnd: TDateTimePicker;
    chBoxSvDates: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dtPicEnter(Sender: TObject);
    procedure dtPicExit(Sender: TObject);
  private
    { Private declarations }
    d_SvDtBeg, d_SvDtEnd : TDateTime;
  public
    { Public declarations }
  end;

function GetDates(cPrompt : string;
                            var dDtBeg, dDtEnd : TDateTime) : boolean;

const SECTION = 'A_GtDats';

var
  FormGetDates: TFormGetDates;

implementation

uses A_Const;

{$R *.DFM}

//--------------------------------------------------------------------
function GetDates(cPrompt : string;
                            var dDtBeg, dDtEnd : TDateTime) : boolean;
begin
  Result := false;
  FormGetDates := TFormGetDates.Create(Application);
  with FormGetDates do begin
    Caption := 'Задание периода';
    LabelPrompt.Caption := cPrompt;
    if chBoxSvDates.Checked and (d_SvDtBeg <> 0) then
      dtPicDtBeg.Date := d_SvDtBeg
    else if dDtBeg <> 0 then
      dtPicDtBeg.Date := dDtBeg
    else
      dtPicDtBeg.Date := Date - 30;
    if chBoxSvDates.Checked and (d_SvDtEnd <> 0) then
      dtPicDtEnd.Date := d_SvDtEnd
    else if dDtBeg <> 0 then
      dtPicDtEnd.Date := dDtEnd
    else
      dtPicDtEnd.Date := Date;
    if ShowModal = mrOk then begin
      dDtBeg := dtPicDtBeg.Date;
      dDtEnd := dtPicDtEnd.Date;
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetDates.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    chBoxSvDates.Checked := ReadBool(SECTION, 'bSvDates', true);
    d_SvDtEnd := ReadDate(SECTION, 'dSvDtE', Date);
    d_SvDtBeg := ReadDate(SECTION, 'dSvDtB', Date-30);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetDates.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  d_SvDtEnd := dtPicDtEnd.Date;
  d_SvDtBeg := dtPicDtBeg.Date;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteBool(SECTION, 'bSvDates', chBoxSvDates.Checked);
    WriteDate(SECTION, 'dSvDtE', d_SvDtEnd);
    WriteDate(SECTION, 'dSvDtB', d_SvDtBeg);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetDates.FormCloseQuery(Sender: TObject;
                                              var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if dtPicDtBeg.Date > dtPicDtEnd.Date then begin
      ModalResult := mrNone;
      CanClose := false;
      MessageDlg('Не корректно заданы даты периода.',
                                                 mtError, [mbOk], 0);
      dtPicDtBeg.SetFocus;
    end;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetDates.dtPicEnter(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clYellow;
end;
//--------------------------------------------------------------------
procedure TFormGetDates.dtPicExit(Sender: TObject);
begin
  (Sender as TDateTimePicker).Color := clWindow;
end;

end.
