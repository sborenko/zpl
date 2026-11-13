unit a_ESign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFormEASign = class(TForm)
    Label1: TLabel;
    dbeDtBeg: TDBEdit;
    Label2: TLabel;
    dbeNmRuk: TDBEdit;
    Label3: TLabel;
    dbeFioRuk: TDBEdit;
    Label4: TLabel;
    dbeNmBuh: TDBEdit;
    Label5: TLabel;
    dbeFioBuh: TDBEdit;
    Label6: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label7: TLabel;
    dbeNmZamRuk: TDBEdit;
    Label8: TLabel;
    dbeNmZamBuh: TDBEdit;
    Label9: TLabel;
    dbeFioZamRuk: TDBEdit;
    Label10: TLabel;
    dbeFioZamBuh: TDBEdit;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EASign : boolean;

const SECTION = 'a_ESign';

var
  FormEASign: TFormEASign;

implementation

uses a_Const, s_Main, a_Lib, a_Signs, a_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function EASign : boolean;
begin
  Result := false;
  FormEASign := TFormEASign.Create(Application);
  with FormEASign do begin
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASign.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 100);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASign.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEASign.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEASign.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEASign.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeDtBeg.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TFormEASign.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if MyEmptyDate(dbeDtBeg.Text) then
    mListErr.Add('Не заполнена дата начала');
  if (Trim(dbeNmRuk.Text) = '') or (Trim(dbeFioRuk.Text) = '') or
        (Trim(dbeNmBuh.Text) = '') or (Trim(dbeFioBuh.Text) = '') then
    mListErr.Add('Должны быть заполнены должности и фамилии');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {a_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;

end.
