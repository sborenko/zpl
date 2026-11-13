unit z_EATemu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TFormEATemu = class(TForm)
    Label1: TLabel;
    dbeKdTemu: TDBEdit;
    Label2: TLabel;
    dbeNmSch: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Bevel1: TBevel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    procedure dbeNmSchEnter(Sender: TObject);
    procedure dbeNmSchExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const SECTION = 'z_EATemu';

  function EATemu : boolean;

var
  FormEATemu: TFormEATemu;

implementation

uses A_Const, a_Dm, Z_DM, Z_Main, Z_ShwTem;

{$R *.dfm}

//------------------------------------------------------------------------------
function EATemu : boolean;
begin
  Result := false;
  FormEATemu := TFormEATemu.Create(Application);
  with FormEATemu do begin
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATemu.dbeNmSchEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEATemu.dbeNmSchExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEATemu.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := 151;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATemu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATemu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  DBEdit3.SetFocus;
  if (ModalResult = mrOk) and (Trim(dbeNmSch.Text) = '') then begin
    ModalResult :=  mrNone;
    CanClose := false;
    ShowMessage('Заполните название темы');
    dbeNmSch.SetFocus;
  end;
end;

end.
