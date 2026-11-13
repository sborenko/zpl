unit Z_EKatP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, IniFiles, DB, DBTables;

type
  TFormAEKatP = class(TForm)
    Label1: TLabel;
    dbeKdKatP: TDBEdit;
    Label2: TLabel;
    dbeShKatP: TDBEdit;
    Label3: TLabel;
    dbeNmKatP: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Z_EKatPmClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
  private
    function CheckVvod : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

function AddEdtKatPers : boolean;

const SECTION = 'Z_EKatP';

var
  FormAEKatP: TFormAEKatP;

implementation

uses A_Const, {A_Main,} Z_GtPers, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtKatPers : boolean;
begin
  Result := false;
  FormAEKatP := TFormAEKatP.Create(Application);
  with FormAEKatP do begin
    if dbeKdKatP.DataSource.DataSet.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatP.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 150);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatP.Z_EKatPmClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//--------------------------------------------------------------------
function TFormAEKatP.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dbeShKatP.Text = '') then
    mListErr.Add('Шифр не может быть пустым');
  if (dbeNmKatP.Text = '') then
    mListErr.Add('Наименование не может быть пустым');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatP.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeShKatP.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatP.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatP.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
