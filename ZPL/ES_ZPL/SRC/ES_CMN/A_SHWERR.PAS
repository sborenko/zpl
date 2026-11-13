unit A_ShwErr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls;

type
  TFormShowErrors = class(TForm)
    LBxErrors: TListBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Image: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ImageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowErrors(Issues : TStringList; Warning: boolean = false);

const SECTION = 'A_ShwErr';

var
  FormShowErrors: TFormShowErrors;

implementation

uses A_Const;

{$R *.DFM}

//--------------------------------------------------------------------
procedure ShowErrors(Issues: TStringList; Warning: boolean = false);
begin
  FormShowErrors := TFormShowErrors.Create(Application);

  with FormShowErrors do begin
    LBxErrors.Items.Assign(Issues);
    if Warning then begin
      Caption := 'Предупреждение!';
      Color := clYellow;
      Image.Visible := false;
    end else
      Caption := 'Ошибки ввода';
    ShowModal;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormShowErrors.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
  	Left   := ReadInteger(SECTION, 'wL', 100);
	  Top    := ReadInteger(SECTION, 'wT', 250);
  	Height := ReadInteger(SECTION, 'wH', 150);
	  Width  := ReadInteger(SECTION, 'wW', 265);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormShowErrors.FormClose(Sender: TObject;
                                          var Action: TCloseAction);
begin
	with TIniFile.Create(cNmIniFile) do begin
  	WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
  	WriteInteger(SECTION, 'wH', Height);
	  WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormShowErrors.ImageClick(Sender: TObject);
begin
  Close;
end;

end.
