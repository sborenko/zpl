unit z_HENadb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TFormHlpENadb = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowENadbHlp;

const SECTION = 'z_HENadb';

var
  FormHlpENadb: TFormHlpENadb;

implementation

uses A_Const, Z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowENadbHlp;
begin
  // Хотя, вроде, и не обязательно, но обставить проверками на bIsForm; 
  FormHlpENadb := TFormHlpENadb.Create(Application);
  with FormHlpENadb do begin
    Show;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHlpENadb.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormHlpENadb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormHlpENadb.FormDeactivate(Sender: TObject);
begin
  Close;
end;

end.
