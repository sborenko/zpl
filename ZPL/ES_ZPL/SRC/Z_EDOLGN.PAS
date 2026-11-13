unit z_eDolgn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, IniFiles, DB, DBTables;

type
  TFormEADolgn = class(TForm)
    Label1: TLabel;
    dbeKdDolgn: TDBEdit;
    Label2: TLabel;
    dbeShDolgn: TDBEdit;
    Label3: TLabel;
    dbeNmDolgn: TDBEdit;
    Label4: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure dbeKdDolgnEnter(Sender: TObject);
    procedure dbeKdDolgnExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function AddEdtDolgn : boolean;

const SECTION = 'z_EDolgn';

var
  FormEADolgn: TFormEADolgn;

implementation

uses A_Const, Z_Main, Z_DM, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtDolgn : boolean;
begin
  Result := false;
  FormEADolgn := TFormEADolgn.Create(Application);
  with FormEADolgn do begin
    if DmMain.qryDolgn.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEADolgn.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEADolgn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEADolgn.CheckVvod : boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if (DmMain.qryDolgn.FieldByName('ShDolgn').asString = '') then
    mListErr.Add('Нет шифра должности');
  if (DmMain.qryDolgn.FieldByName('NmDolgn').asString = '') then
    mListErr.Add('Нет наименования должности');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEADolgn.dbeKdDolgnEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEADolgn.dbeKdDolgnExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEADolgn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) then begin
    bBtnOk.SetFocus;
    if not CheckVvod then begin
      ModalResult := mrNone;
      CanClose := false;
      dbeShDolgn.SetFocus;
    end;  
  end;
end;

end.
