unit Z_EKatVn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Buttons, DBCtrls, Mask;

type
  TFormAEKatVn = class(TForm)
    Label1: TLabel;
    dbeNmKatVn: TDBEdit;
    Label2: TLabel;
    dbmNotes: TDBMemo;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNmKatVnEnter(Sender: TObject);
    procedure dbeNmKatVnExit(Sender: TObject);
    procedure dbmNotesEnter(Sender: TObject);
    procedure dbmNotesExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddEdtKatVn(dsrcKatVn : TDataSource) : boolean;


const SECTION = 'Z_EKatVn';

var
  FormAEKatVn: TFormAEKatVn;

implementation

uses A_Const;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtKatVn(dsrcKatVn : TDataSource) : boolean;
begin
  Result := false;
  FormAEKatVn := TFormAEKatVn.Create(Application);
  with FormAEKatVn do begin
    dbeNmKatVn.DataSource := dsrcKatVn;
    dbmNotes.DataSource := dsrcKatVn;
    if dsrcKatVn.State = dsInsert then
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
procedure TFormAEKatVn.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 150);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatVn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatVn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and (dbeNmKatVn.Text = '') then begin
    ModalResult := mrNone;
    CanClose := false;
    ShowMessage('Наименование категории не может быть пустым');
    dbeNmKatVn.SetFocus;
  end;  
end;
//------------------------------------------------------------------------------
procedure TFormAEKatVn.dbeNmKatVnEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatVn.dbeNmKatVnExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatVn.dbmNotesEnter(Sender: TObject);
begin
  (Sender as TDBMemo).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAEKatVn.dbmNotesExit(Sender: TObject);
begin
  (Sender as TDBMemo).Color := clWindow;
end;

end.
