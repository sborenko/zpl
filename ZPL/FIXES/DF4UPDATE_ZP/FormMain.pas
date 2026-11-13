unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BtnRun: TBitBtn;
    EdtPathName: TEdit;
    BtnBrowse: TBitBtn;
    procedure BtnRunClick(Sender: TObject);
    procedure BtnBrowseClick(Sender: TObject);
  private
    PathToFiles: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  FileCtrl, DModMain;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TForm1.BtnRunClick(Sender: TObject);
begin
  DmMain.Run(PathToFiles);
end;

//------------------------------------------------------------------------------
procedure TForm1.BtnBrowseClick(Sender: TObject);
begin
  PathToFiles := 'D:\Projects\Current\DF4UPDATE\DATA';

  if SelectDirectory('Select Directory', ExtractFileDrive(PathToFiles), PathToFiles) then
    EdtPathName.Text := PathToFiles;
end;

end.
