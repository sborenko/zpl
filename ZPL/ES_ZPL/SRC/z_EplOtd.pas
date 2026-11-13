unit z_EplOtd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFormEPlOtd = class(TForm)
    Label1: TLabel;
    dbeFrom: TDBEdit;
    Label2: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EAGrad : boolean;

const SECTION = 'z_EPlOtd';

var
  FormEPlOtd: TFormEPlOtd;

implementation

uses a_Const, a_DM, z_Main, z_RPlOtd;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAGrad : boolean;
begin
  Result := false;
  FormEPlOtd := TFormEPlOtd.Create(Application);
  with FormEPlOtd do begin
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPlOtd.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEPlOtd.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEPlOtd.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 400);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPlOtd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEPlOtd.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and (dbeFrom.Field.IsNull or
        (dbeFrom.Field.AsString = '') or (dbeFrom.Field.AsFloat < 0)) then begin
    ModalResult := mrNone;
    CanClose := false;
    dbeFrom.SetFocus;
    ShowMessage('Значение  поля  "Сумма  начала  градации"' + #13#10 +
                 'не может быть пустым или отрицательным.');
  end;
end;

end.
