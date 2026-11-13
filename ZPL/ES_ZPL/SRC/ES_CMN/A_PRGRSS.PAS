unit A_Prgrss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IniFiles, StdCtrls, ExtCtrls;

type
  TFrmListProgress = class(TForm)
    Panel1: TPanel;
    ProgressBar: TProgressBar;
    StatusBar: TStatusBar;
    LblInfo: TLabel;
    Shape1: TShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  public
    class procedure Run(Msg: String; Max, Step: Integer);
    class procedure Update;
    class procedure Finish;
  end;

const SECTION = 'Prgrss';

var
  FrmListProgress: TFrmListProgress;

implementation

uses
  a_Const;

{$R *.DFM}

//--------------------------------------------------------------------
class procedure TFrmListProgress.Run(
  Msg: String;
  Max, Step: Integer);
begin
  FrmListProgress := TFrmListProgress.Create(Application);
  with FrmListProgress do begin
    LblInfo.Caption := Msg;
    ProgressBar.Max := Max;
    ProgressBar.Step := Step;
    Show;
  end;
end;

//--------------------------------------------------------------------
class procedure TFrmListProgress.Update;
begin
  FrmListProgress.ProgressBar.StepIt;
end;

//--------------------------------------------------------------------
class procedure TFrmListProgress.Finish;
begin
  FrmListProgress.Close;
end;

//--------------------------------------------------------------------
procedure TFrmListProgress.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFrmListProgress.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
  Action := caFree;
end;

end.
