unit z_EATSs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB;

type
  TFormEATSs = class(TForm)
    Label1: TLabel;
    dbeDtBeg: TDBEdit;
    Label2: TLabel;
    dbePrcDoMin: TDBEdit;
    Label3: TLabel;
    dbePrcDoMax: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label7: TLabel;
    dbeNotes: TDBEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure dbeDtBegExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EATSs(dsrcTSs : TDataSource) : boolean;

const SECTION = 'z_EATSs';

var
  FormEATSs: TFormEATSs;

implementation

uses a_Const, a_DM, z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function EATSs(dsrcTSs : TDataSource) : boolean;
begin
  Result := false;
  FormEATSs := TFormEATSs.Create(Application);
  with FormEATSs do begin
    dbeDtBeg.DataSource    := dsrcTSs;
    dbePrcDoMin.DataSource := dsrcTSs;
    dbePrcDoMax.DataSource := dsrcTSs;
    dbeNotes.DataSource    := dsrcTSs;
    if dbeDtBeg.DataSource.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATSs.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATSs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATSs.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEATSs.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEATSs.dbeDtBegExit(Sender: TObject);
begin
  if MyEmptyDate(dbeDtBeg.Text) then begin
    ShowMessage('Дата начала не может быть пустой');
    dbeDtBeg.SetFocus; end
  else
    (Sender as TDBEdit).Color := clWindow;
end;

end.
