unit a_EZUObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFormEAUsrObj = class(TForm)
    Label1: TLabel;
    dbeKdUsr: TDBEdit;
    Label2: TLabel;
    dbeKdSps: TDBEdit;
    Label3: TLabel;
    dbeDtBProc: TDBEdit;
    Label4: TLabel;
    dbeDtEProc: TDBEdit;
    Label5: TLabel;
    dbeKdObj: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    DBEdit1: TDBEdit;
    sBtnUsr: TSpeedButton;
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
    procedure dbeKdObjExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnUsrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EAUsrObj : boolean;

const SECTION = 'a_EZUObj';

var
  FormEAUsrObj: TFormEAUsrObj;

implementation

uses a_Const, a_ZUObj, {z_Dm, z_Main,} a_GtUsr;

{$R *.dfm}

function EAUsrObj : boolean;
begin
  Result := false;
  FormEAUsrObj := TFormEAUsrObj.Create(Application);
  with FormEAUsrObj do begin
    if dbeKdUsr.Field.Value > 0 then
      Caption := 'Пользователь-Подразделения (Редактирование)'
    else
      Caption := 'Пользователь-Подразделения (Новая запись)';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrObj.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrObj.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrObj.dbeKdObjExit(Sender: TObject);
var cText : ShortString; nKdObj : SmallInt; cShObj, cNmObj : string;
begin
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrObj.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left := ReadInteger(SECTION, 'wL', 50);
	  Top  := ReadInteger(SECTION, 'wT', 50);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrObj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrObj.sBtnUsrClick(Sender: TObject);
var cNmCmp : ShortString; nKdUsr, nKdSps : SmallInt;
begin
  cNmCmp := 'zpl';
  nKdUsr := dbeKdUsr.Field.AsInteger;
  nKdSps := 0;
  if GetUsr(cNmCmp, nKdUsr, nKdSps) {a_GtUsr} then begin
    dbeKdUsr.Field.AsInteger := nKdUsr;
    dbeKdSps.Field.AsInteger := nKdSps;
  end;
end;

end.
