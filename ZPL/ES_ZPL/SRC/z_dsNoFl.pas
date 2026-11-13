unit z_dsNoFl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TFormNoFiles = class(TForm)
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ShowNoFiles(mListFiles : TStringList) : boolean;

const SECTION = 'ds_NoFls';

var
  FormNoFiles: TFormNoFiles;

implementation

uses a_Const, a_DM, z_Dm, z_Main, z_dsMain;

{$R *.dfm}

//------------------------------------------------------------------------------
function ShowNoFiles(mListFiles : TStringList) : boolean;
begin
  Result := false;
  FormNoFiles := TFormNoFiles.Create(Application);
  with FormNoFiles do begin
    ListBox1.Items.Assign(mListFiles);
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNoFiles.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 325);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNoFiles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;

end.
