unit A_GtDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFormGetDate = class(TForm)
    Label1: TLabel;
    dtPicDtOper: TDateTimePicker;
    Bevel1: TBevel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetDate(var dDtOper : TDateTime; cPrompt : string) : boolean;

const SECTION = 'a_GtDate';

var
  FormGetDate: TFormGetDate;

implementation

uses A_Const;

{$R *.DFM}

//--------------------------------------------------------------------
function GetDate(var dDtOper : TDateTime; cPrompt : string) : boolean;
begin
  Result := false;
  FormGetDate := TFormGetDate.Create(Application);
  with FormGetDate do begin
    Caption := '¬вод даты';
    Label1.Caption := cPrompt;
    dtPicDtOper.ShowCheckbox := true;
    if dDtOper <> 0 then
      dtPicDtOper.Date := dDtOper
    else
      dtPicDtOper.Date := SysUtils.Date;
    dtPicDtOper.ShowCheckbox := false;  
    if ShowModal = mrOk then begin
      dDtOper := dtPicDtOper.Date;
      Result  := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetDate.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 50);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetDate.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
