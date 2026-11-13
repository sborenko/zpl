unit A_About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TFormAbout = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    btnOk: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure AboutShowModal;

var
  FormAbout: TFormAbout;

implementation

uses
  VersionInfo;

{$R *.DFM}


procedure AboutShowModal;
begin
  FormAbout := TFormAbout.Create(Application);
  with FormAbout do begin
    ShowModal;
    Free;
  end;
end;

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  Version.Caption := Version.Caption + GetAppVersion; 
end;

end.

