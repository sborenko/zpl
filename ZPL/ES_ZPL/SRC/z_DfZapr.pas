unit z_DfZapr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles;

type
  TFormDfZapros = class(TForm)
    Label1: TLabel;
    bBtnAsIs: TBitBtn;
    bBtnReBuild: TBitBtn;
    bBtnCancel: TBitBtn;
    Bevel1: TBevel;
    procedure bBtnAsIsClick(Sender: TObject);
    procedure bBtnReBuildClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    n_Result : word;
  public
    { Public declarations }
  end;

procedure WhatDfDo(var nResult : word);

const SECTION = 'z_dfZapr';

var
  FormDfZapros: TFormDfZapros;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure WhatDfDo(var nResult : word);
begin
  nResult := 0;
  FormDfZapros := TFormDfZapros.Create(Application);
  with FormDfZapros do begin
    n_Result := 0;
    if ShowModal = mrOk then begin
      nResult := n_Result;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfZapros.bBtnAsIsClick(Sender: TObject);
begin
  n_Result := 1;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormDfZapros.bBtnReBuildClick(Sender: TObject);
begin
  n_Result := 2;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormDfZapros.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 50);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDfZapros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
