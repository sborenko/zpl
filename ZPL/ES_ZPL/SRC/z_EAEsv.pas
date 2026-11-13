unit z_EAEsv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  ExtCtrls;

type
  TFormEAEsv = class(TForm)
    Label1: TLabel;
    dbeDtBeg: TDBEdit;
    Label2: TLabel;
    dbePrcCmn: TDBEdit;
    dbeSmCmn: TDBEdit;
    LabelPPS: TLabel;
    dbePrcPps: TDBEdit;
    dbeSmPps: TDBEdit;
    Label6: TLabel;
    dbePrcBln: TDBEdit;
    dbeSmBln: TDBEdit;
    Label8: TLabel;
    dbePrcGpd: TDBEdit;
    dbeSmGpd: TDBEdit;
    Label10: TLabel;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    LabelDekr: TLabel;
    dbePrcDekr: TDBEdit;
    dbeSmDekr: TDBEdit;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EAEsv : boolean;

const SECTION = 'z_EAEsv';

var
  FormEAEsv: TFormEAEsv;

implementation

uses a_Const, z_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function EAEsv : boolean;
begin
  Result := false;
  FormEAEsv := TFormEAEsv.Create(Application);
  with FormEAEsv do begin
    if dbePrcCmn.DataSource.State = dsInsert then
      Caption := 'Новая запись'
    else
      Caption := 'Редактирование записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAEsv.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 400);
    Top  := ReadInteger(SECTION, 'wT', 400);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAEsv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEAEsv.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEAEsv.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;

end.
