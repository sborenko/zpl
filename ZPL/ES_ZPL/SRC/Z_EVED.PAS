unit Z_EVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Buttons, IniFiles;

type
  TFormEVed = class(TForm)
    Label1: TLabel;
    dbedShVed: TDBEdit;
    Label2: TLabel;
    dbedNmVed: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelNmObj: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedShVedEnter(Sender: TObject);
    procedure dbedShVedExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function AddEdtVed(cNmObj : string; dsrcVed : TDataSource) : boolean;

const SECTION = 'Z_EVed';

var
  FormEVed: TFormEVed;

implementation

uses A_Const, A_ShwErr;

{$R *.dfm}

//--------------------------------------------------------------------
function AddEdtVed(cNmObj : string; dsrcVed : TDataSource) : boolean;
begin
  Result := false;
  FormEVed := TFormEVed.Create(Application);
  with FormEVed do begin
    if dsrcVed.State = dsInsert then
      Caption := 'Новая ведомость'
    else
      Caption := 'Редактирование ведомости';
    LabelNmObj.Caption := cNmObj;  
    dbedShVed.DataSource := dsrcVed;
    dbedNmVed.DataSource := dsrcVed;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEVed.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEVed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormEVed.dbedShVedEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//--------------------------------------------------------------------
procedure TFormEVed.dbedShVedExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//--------------------------------------------------------------------
function TFormEVed.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (dbedShVed.Text = '') then
    mListErr.Add('Нет шифра');
  if (dbedNmVed.Text = '') then
    mListErr.Add('Нет наименования');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//--------------------------------------------------------------------
procedure TFormEVed.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then begin
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbedShVed.SetFocus;
    end;
  end;
end;

end.
