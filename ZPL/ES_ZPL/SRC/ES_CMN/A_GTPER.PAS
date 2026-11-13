unit A_GtPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Mask, ComCtrls, Buttons, ExtCtrls;

type
  TFormGetPeriod = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabelPrompt: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    UpDownMesBeg: TUpDown;
    meMesBeg: TMaskEdit;
    meGodBeg: TMaskEdit;
    UpDownGodBeg: TUpDown;
    meMesEnd: TMaskEdit;
    UpDownMesEnd: TUpDown;
    meGodEnd: TMaskEdit;
    UpDownGodEnd: TUpDown;
    Bevel1: TBevel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetPeriod(cPrompt : string; var nGodBeg, nMesBeg,
                                nGodEnd, nMesEnd : word) : boolean;

const SECTION = 'GtPer';

var
  FormGetPeriod: TFormGetPeriod;

implementation

uses A_Const;

{$R *.DFM}

//--------------------------------------------------------------------
function GetPeriod(cPrompt : string; var nGodBeg, nMesBeg,
                                  nGodEnd, nMesEnd : word) : boolean;
begin
  Result := false;
  FormGetPeriod := TFormGetPeriod.Create(Application);
  with FormGetPeriod do begin
    Caption := 'Задание периода';
    LabelPrompt.Caption := cPrompt;
    if UpDownGodBeg.Position = 0 then
      UpDownGodBeg.Position := nGodBeg;
    if UpDownMesBeg.Position = 0 then
      UpDownMesBeg.Position := nMesBeg;
    if UpDownGodEnd.Position = 0 then
      UpDownGodEnd.Position := nGodEnd;
    if UpDownMesEnd.Position = 0 then
      UpDownMesEnd.Position := nMesEnd;
    if ShowModal = mrOk then begin
      nGodBeg := UpDownGodBeg.Position;
      nMesBeg := UpDownMesBeg.Position;
      nGodEnd := UpDownGodEnd.Position;
      nMesEnd := UpDownMesEnd.Position;
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetPeriod.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    UpDownGodBeg.Position := ReadInteger(SECTION, 'nGB', 0);
    UpDownMesBeg.Position := ReadInteger(SECTION, 'nMB', 0);
    UpDownGodEnd.Position := ReadInteger(SECTION, 'nGE', 0);
    UpDownMesEnd.Position := ReadInteger(SECTION, 'nME', 0);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetPeriod.FormClose(Sender: TObject;
                                           var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'nGB', UpDownGodBeg.Position);
    WriteInteger(SECTION, 'nMB', UpDownMesBeg.Position);
    WriteInteger(SECTION, 'nGE', UpDownGodEnd.Position);
    WriteInteger(SECTION, 'nME', UpDownMesEnd.Position);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormGetPeriod.FormCloseQuery(Sender: TObject;
                                              var CanClose: Boolean);
var nGodB, nMesB, nGodE, nMesE : word;
begin
  if ModalResult = mrOk then begin
    nGodB := UpDownGodBeg.Position;
    nMesB := UpDownMesBeg.Position;
    nGodE := UpDownGodEnd.Position;
    nMesE := UpDownMesEnd.Position;
    if (nGodB*100 + nMesB) > (nGodE*100 + nMesE) then begin
      ModalResult := mrNone;
      CanClose := false;
      MessageDlg('Не корректно задан период.', mtError, [mbOk], 0);
      meMesBeg.SetFocus; end
    else if nGodE <> nGodB then begin
      ModalResult := mrNone;
      CanClose := false;
      MessageDlg('Отчет можно получать только в пределах ' +
                               'одного года.', mtError, [mbOk], 0);
      meMesBeg.SetFocus;
    end;
  end;
end;

end.
