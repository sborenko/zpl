unit z_EPrBln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TFormEAPrBln = class(TForm)
    Label1: TLabel;
    dbePrBln: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dbeNmPrBln: TDBEdit;
    procedure dbeDtExit(Sender: TObject);
    procedure dbeDtEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bBtnOkClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function CheckVvod: boolean;
  public
    { Public declarations }
  end;

function EAPrBln : boolean;

const SECTION = 'z_EPrBln';

var
  FormEAPrBln: TFormEAPrBln;

implementation

uses A_Const, A_Dm, z_Main, A_ShwErr;

{$R *.dfm}
//------------------------------------------------------------------------------
function EAPrBln : boolean;
var cCaption     : ShortString;
begin
  FormEAPrBln :=  TFormEAPrBln.Create(Application);
  with FormEAPrBln do begin
    result  := false;
    cCaption:= 'Причина ';
    if dbeprbln.DataSource.State = dsInsert then
       cCaption:= cCaption + ' (Новая)'
                                            else
       cCaption:= cCaption + ' (Редактирование)';
    Caption := cCaption;
    If ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrBln.dbeDtExit(Sender: TObject);
begin
 (sender as tDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrBln.dbeDtEnter(Sender: TObject);
begin
 (sender as tDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrBln.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 350);
    Top    := ReadInteger(SECTION, 'wT', 350);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrBln.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

procedure TFormEAPrBln.bBtnOkClick(Sender: TObject);
begin

end;
//------------------------------------------------------------------------------
function TFormEAPrBln.CheckVvod: boolean;
var mListErr : TStringList;
    cVidN    : ShortString;
begin
  Result     := true;
  dbeNotes.SetFocus;
  mListErr   := TStringList.Create;
  mListErr.Clear;
  if dbeNmPrBln.Field.IsNull or (Trim(dbeNmPrBln.Field.AsString) = '') then
    mListErr.Add('Нет наименования причины нетрудоспособности');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormEAPrBln.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if (ModalResult = mrOk) and (not CheckVvod) then begin
   ModalResult := mrNone;
   CanClose    := false;
   dbeNmPrBln.SetFocus;
 end;
end;

end.
