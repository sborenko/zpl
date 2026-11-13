unit z_ChkRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles;

type
  TFormChkResults = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShwChkResults;

const SECTION = 'z_ChkRes';

var
  FormChkResults: TFormChkResults;

implementation

uses a_Const, a_DM, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwChkResults;
begin
  FormChkResults := TFormChkResults.Create(Application);
  with FormChkResults do begin
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChkResults.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 455);
    Width  := ReadInteger(SECTION, 'wW', 675);
    Free;
  end;
//  if FileExists(cDirVids + 'ChkMG_01.vid') then
//    dbgrNu.Columns.LoadFromFile(cDirVids + 'ChkMG_01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormChkResults.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
//  if qryNU.Active then
//    dbgrNu.Columns.SaveToFile(cDirVids   + 'ChkMG_01.vid');
end;

end.
