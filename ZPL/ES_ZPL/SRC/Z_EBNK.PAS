unit Z_EBnk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, IniFiles, DB;

type
  TFormEABnk = class(TForm)
    Label1: TLabel;
    dbeKdBnk: TDBEdit;
    Label2: TLabel;
    dbeShBnk: TDBEdit;
    Label3: TLabel;
    dbeNmBnk: TDBEdit;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeEnter(Sender: TObject);
    procedure dbeExit(Sender: TObject);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EABnk(dsrcBnk : TDataSource) : boolean;

const SECTION = 'Z_EBnk';

var
  FormEABnk: TFormEABnk;

implementation

uses A_Const, Z_DM, Z_Main, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function EABnk(dsrcBnk : TDataSource) : boolean;
begin
  Result := false;
  FormEABnk := TFormEABnk.Create(Application);
  with FormEABnk do begin
    dbeKdBnk.DataSource := dsrcBnk;
    dbeShBnk.DataSource := dsrcBnk;
    dbeNmBnk.DataSource := dsrcBnk;
    dbeNotes.DataSource := dsrcBnk;
    if dbeKdBnk.DataSource.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnk.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEABnk.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dbeShBnk.Text = '') then
    mListErr.Add('Не заполнен шифр банка');
  if (dbeNmBnk.Text = '') then
    mListErr.Add('Не заполнено название банка');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEABnk.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeShBnk.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEABnk.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEABnk.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
