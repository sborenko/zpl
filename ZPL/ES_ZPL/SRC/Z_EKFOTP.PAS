unit Z_EKfOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Mask, DBCtrls, DB, Buttons;

type
  TFormAEKoefOtp = class(TForm)
    dbeMesGod: TDBEdit;
    dbeKoefOtp: TDBEdit;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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

function AddEdtKoefOtp(dsrcKoefOtp : TDataSource) : boolean;

const SECTION = 'Z_EKfOtp';

var
  FormAEKoefOtp: TFormAEKoefOtp;

implementation

uses A_Const, Z_Main, A_Lib, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtKoefOtp(dsrcKoefOtp : TDataSource) : boolean;
begin
  Result := false;
  FormAEKoefOtp := TFormAEKoefOtp.Create(Application);
  with FormAEKoefOtp do begin
    dbeMesGod.DataSource  := dsrcKoefOtp;
    dbeKoefOtp.DataSource := dsrcKoefOtp;
    dbeNotes.DataSource   := dsrcKoefOtp;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEKoefOtp.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEKoefOtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormAEKoefOtp.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  bBtnOk.SetFocus;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if MyEmptyDate(dbeMesGod.Text) then
    mListErr.Add('Пустой месяц-год');
  if (dbeKoefOtp.Text = '') or (dbeKoefOtp.DataSource.DataSet.
                          FieldByName('KoefOtp').AsFloat = 0) then
    mListErr.Add('Коэффициент не может быть пустым или нулевым');
  if (dbeKoefOtp.DataSource.DataSet.
                          FieldByName('KoefOtp').AsFloat < 0) then
    mListErr.Add('Коэффициент не может быть отрицательным');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    dbeMesGod.SetFocus;
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormAEKoefOtp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    dbeMesGod.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEKoefOtp.dbeEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAEKoefOtp.dbeExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
