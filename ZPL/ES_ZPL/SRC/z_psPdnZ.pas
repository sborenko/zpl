unit z_psPdnZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles;

type
  TFormPsPdnZapros = class(TForm)
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

procedure WhatPsPdnDo(var nResult : word);

const SECTION = 'z_psPdnZ';

var
  FormPsPdnZapros: TFormPsPdnZapros;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure WhatPsPdnDo(var nResult : word);
begin
  nResult := 0;
  FormPsPdnZapros := TFormPsPdnZapros.Create(Application);
  with FormPsPdnZapros do begin
    n_Result := 0;
    if ShowModal = mrOk then begin
      nResult := n_Result;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdnZapros.bBtnAsIsClick(Sender: TObject);
begin
  n_Result := 1;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdnZapros.bBtnReBuildClick(Sender: TObject);
begin
  n_Result := 2;
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdnZapros.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 50);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPsPdnZapros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
