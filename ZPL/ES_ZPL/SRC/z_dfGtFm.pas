unit z_dfGtFm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TFormGetFam = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edFam: TEdit;
    Label1: TLabel;
    procedure edFamEnter(Sender: TObject);
    procedure edFamExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    cSvFam : string;
  public
    { Public declarations }
  end;

function GetFam(var cFam : string) : boolean;

const SECTION = 'z_dfGtFm';

var
  FormGetFam: TFormGetFam;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetFam(var cFam : string) : boolean;
begin
  Result := false;
  cFam := '';
  FormGetFam := TFormGetFam.Create(Application);
  with FormGetFam do begin
    Caption := '¬ведите фамилию';
    edFam.Text := cSvFam;
    if (ShowModal = mrOk) then begin
      if edFam.Text <> '' then begin
        cFam := edFam.Text;
        Result := true;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetFam.edFamEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGetFam.edFamExit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormGetFam.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 150);
    Top  := ReadInteger(SECTION, 'wT', 250);
    cSvFam := ReadString(SECTION, 'SvFam', '');
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetFam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    if edFam.Text <> '' then
      WriteString(SECTION, 'SvFam', edFam.Text);
    Free;
  end;
end;

end.
