unit z_EMgVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, DBCtrls, Mask, DB, DBTables,
  ExtCtrls;

type
  TFormEAMegVed = class(TForm)
    Label4: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    PanelBnk: TPanel;
    Label1: TLabel;
    dbePrtVedNr: TDBEdit;
    dbePrtVedDate: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbmVedHead: TDBMemo;
    Label5: TLabel;
    PanelKss: TPanel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure dbmVedHeadEnter(Sender: TObject);
    procedure dbmVedHeadExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddEdtMegVed : boolean;

const SECTION = 'z_EMgVed';

var
  FormEAMegVed: TFormEAMegVed;

implementation

uses a_Const, a_DM, z_DM, z_Main, a_Lib, z_MegVed;

{$R *.dfm}

//------------------------------------------------------------------------------
function AddEdtMegVed : boolean;
begin
  Result := false;
  FormEAMegVed := TFormEAMegVed.Create(Application);
  with FormEAMegVed do begin
    if dbePrtVedNR.Field.DataSet.State = dsInsert then
      Caption := 'Заголовок новой ведомости'
    else
      Caption := 'Редактирование заголовка ведомости';
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.dbmVedHeadEnter(Sender: TObject);
begin
  (Sender as TDBMemo).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.dbmVedHeadExit(Sender: TObject);
begin
  (Sender as TDBMemo).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 250);
    Top  := ReadInteger(SECTION, 'wT', 250);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAMegVed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
