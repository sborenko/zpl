unit z_dfGtTn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TFormGetTin = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edTin: TEdit;
    Label1: TLabel;
    procedure edTinEnter(Sender: TObject);
    procedure edTinExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    cSvTin : string;
    nSvTabN : integer;
  public
    { Public declarations }
  end;

function Get_Tin(var cTin : string) : boolean;

const SECTION = 'z_dfGtTn';

var
  FormGetTin: TFormGetTin;
  bGtTin, bGtTabN : boolean;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function Get_Tin(var cTin : string) : boolean;
begin
  Result := false;
  bGtTin := true;
  bGtTabN := false;
  cTin := '';
  FormGetTin := TFormGetTin.Create(Application);
  with FormGetTin do begin
    Caption := 'Введите ТИН';
    edTin.Text := cSvTin;
    if (ShowModal = mrOk) then begin
      if edTin.Text <> '' then begin
        cTin := edTin.Text;
        Result := true;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetTin.edTinEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGetTin.edTinExit(Sender: TObject);
var cText : string; i : integer; bIsNumber : boolean;
begin
  cText := Trim((Sender as TEdit).Text);
  bIsNumber := true;
  if bGtTabN and (cText <> '') then begin
    for i := 0 to Length(cText)-1 do begin
      if Pos(Copy(cText[i],1,1), '1,2,3,4,5,6,7,8,9,0') < 0 then begin
        bIsNumber := false;
        Break;
      end;
    end;
    if not bIsNumber then begin
      ShowMessage('В ТабНр могут быть только цифры');
      edTin.SetFocus;
    end;
  end;
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormGetTin.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 150);
    Top  := ReadInteger(SECTION, 'wT', 250);
    if bGtTin then
      cSvTin := ReadString(SECTION, 'SvTin', '');
    if bGtTabN then
      nSvTabN := ReadInteger(SECTION, 'SvTabN', 0);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetTin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if bGtTin and (edTin.Text <> '') then
      WriteString(SECTION, 'SvTin', edTin.Text);
    if bGtTabN and (edTin.Text <> '') then
      WriteString(SECTION, 'SvTabN', edTin.Text);
    Free;
  end;
end;

end.
