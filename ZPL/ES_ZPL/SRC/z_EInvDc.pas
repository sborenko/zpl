unit z_EInvDc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TFormEAInvDocs = class(TForm)
    Label2: TLabel;
    dbeNmDoc: TDBEdit;
    Label3: TLabel;
    dbeNrDoc: TDBEdit;
    Label4: TLabel;
    dbeDtBeg: TDBEdit;
    Label5: TLabel;
    dbeDtEnd: TDBEdit;
    Label6: TLabel;
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
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function EAInvDoc(nTabN : integer; cFamIO : ShortString) : boolean;

const SECTION = 'z_EInvDc';

var
  FormEAInvDocs: TFormEAInvDocs;

implementation

uses a_Dm, a_Const, z_Dm, z_Main, z_InvDoc, a_Lib, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAInvDoc(nTabN : integer; cFamIO : ShortString) : boolean;
begin
  Result := false;
  FormEAInvDocs := TFormEAInvDocs.Create(Application);
  with FormEAInvDocs do begin
    if dbeNmDoc.DataSource.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAInvDocs.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAInvDocs.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAInvDocs.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAInvDocs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormEAInvDocs.CheckVvod: boolean;
var mListErr : TStringList;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  if dbeNmDoc.Field.IsNull or (dbeNmDoc.Field.AsString = '') then
    mListErr.Add('Нет названия документа');
  if dbeNrDoc.Field.IsNull or (dbeNrDoc.Field.AsString = '') then
    mListErr.Add('Нет номера документа');
  if dbeDtBeg.Field.IsNull or MyEmptyDate(dbeDtBeg.Field.AsString) then
    mListErr.Add('Нет даты начала');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEAInvDocs.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and not CheckVvod then begin
    ModalResult := mrNone;
    CanClose := false;
    dbeNmDoc.SetFocus;
  end;
end;

end.
