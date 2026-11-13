unit a_EZUSps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, StdCtrls, Mask, DBCtrls;

type
  TFormEAUsrSps = class(TForm)
    LabelKdUsr: TLabel;
    dbeKdUsr: TDBEdit;
    LabelKdSps: TLabel;
    dbeKdSps: TDBEdit;
    Label3: TLabel;
    dbeKdObj: TDBEdit;
    Label4: TLabel;
    dbeTabN: TDBEdit;
    Label5: TLabel;
    dbeDtBProc: TDBEdit;
    Label6: TLabel;
    dbeDtEProc: TDBEdit;
    Label7: TLabel;
    EdtFamIO: TEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    sBtnTabN: TSpeedButton;
    procedure sBtnTabNClick(Sender: TObject);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeTabNExit(Sender: TObject);
  public
    class function Run(FamIO: ShortString): Boolean;
  end;

const SECTION = 'a_EZUSps';

var
  FormEAUsrSps: TFormEAUsrSps;

implementation

uses
  a_Const, a_Dm, a_Lib, a_ShUpiZ, a_ZUObj;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TFormEAUsrSps.Run(FamIO: ShortString): Boolean;
begin
  Result := false;
  FormEAUsrSps := TFormEAUsrSps.Create(Application);
  with FormEAUsrSps do begin
    if dbeTabN.Field.Value > 0 then
      Caption := 'Редактирование записи'
    else
      Caption := 'Новая запись';

    LabelKdUsr.Visible := bFlagDbg;
    dbeKdUsr.Visible := bFlagDbg;
    LabelKdSps.Visible := bFlagDbg;
    dbeKdSps.Visible := bFlagDbg;
    
    EdtFamIO.Text := FamIO;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEAUsrSps.sBtnTabNClick(Sender: TObject);
var
  TabN, KdObj, KdKatP: Integer;
  Fam, Ima, Otch: ShortString;
begin
  TabN := dbeTabN.Field.AsInteger;
  
  Application.ProcessMessages;
  // a_ShUpiZ
  if Get_FromUpi(TabN, Fam, Ima, Otch) then begin
    DbeTabN.Field.AsInteger := TabN;
    EdtFamIO.Text := MyFamIO(Fam, Ima, Otch);
    DbeDtBProc.SetFocus;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormEAUsrSps.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrSps.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrSps.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left := ReadInteger(SECTION, 'wL', 50);
	  Top  := ReadInteger(SECTION, 'wT', 50);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrSps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAUsrSps.dbeTabNExit(Sender: TObject);
var
  TabN: Integer;
  Fam, Ima, Otch, Pol, ID: ShortString;
begin
  if not dbeTabN.Field.IsNull and (dbeTabN.Field.AsString > '') then begin
    TabN := dbeTabN.Field.AsInteger;
    if Form_DM.TabN2FIO(TabN, Fam, Ima, Otch, Pol, ID) then begin
      EdtFamIO.Text := MyFamIO(Fam, Ima, Otch);
    end else begin
      EdtFamIO.Text := '';
    end;
  end;
  
  (Sender as TDBEdit).Color := clWindow;
end;

end.
