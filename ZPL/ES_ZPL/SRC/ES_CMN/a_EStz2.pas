unit a_EStz2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, DBTables;

type
  TFormEAStz2 = class(TForm)
    Label1: TLabel;
    dbeKdStZ: TDBEdit;
    Label2: TLabel;
    dbeShStZ: TDBEdit;
    Label3: TLabel;
    dbeKdStz2: TDBEdit;
    Label4: TLabel;
    dbeShStz2: TDBEdit;
    Label5: TLabel;
    dbeNmStz2: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    b_EditMode : boolean;
  public
    { Public declarations }
  end;

function EAStz2 : boolean;

const SECTION = 'a_EStz2';

var
  FormEAStz2: TFormEAStz2;

implementation

uses a_Const, A_DM, a_Stz_2;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAStz2 : boolean;
begin
  Result := false;
  FormEAStz2 := TFormEAStz2.Create(Application);
  with FormEAStz2 do begin
    //Label1.Visible := bFlagDbg;
    //Label3.Visible := bFlagDbg;
    //dbeKdStZ.Visible := bFlagDbg;
    //dbeKdStz2.Visible := bFlagDbg;
    if dbeKdStZ.DataSource.State = dsEdit then begin
      Caption := 'Редактирование записи';
      b_EditMode := true; end
    else begin
      Caption := 'Новая запись';
      b_EditMode := false;
    end;
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAStz2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Top  := ReadInteger(SECTION, 'wT', 100);
    Left := ReadInteger(SECTION, 'wL', 100);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAStz2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wL', Left);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAStz2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and (Trim(dbeNmStz2.Field.AsString) = '') then begin
    ModalResult := mrNone;
    dbeNmStz2.SetFocus;
    CanClose := false;
    ShowMessage('Наименование расхода не должно быть пустым');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAStz2.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAStz2.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
