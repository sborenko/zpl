unit z_EATFz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB;

type
  TFormEATFz = class(TForm)
    Label1: TLabel;
    dbeDtBeg: TDBEdit;
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

function EATFz(dsrcTFz : TDataSource) : boolean;

const SECTION = 'z_EATFz';

var
  FormEATFz: TFormEATFz;

implementation

uses a_Const, a_DM, z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function EATFz(dsrcTFz : TDataSource) : boolean;
begin
  Result := false;
  FormEATFz := TFormEATFz.Create(Application);
  with FormEATFz do begin
    dbeDtBeg.DataSource    := dsrcTFz;
    dbePrcDoMax.DataSource := dsrcTFz;
    dbeNotes.DataSource    := dsrcTFz;
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
procedure TFormEATFz.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 50);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATFz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEATFz.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEATFz.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEATFz.dbeDtBegExit(Sender: TObject);
begin
  if MyEmptyDate(dbeDtBeg.Text) then begin
    ShowMessage('Дата начала не может быть пустой');
    dbeDtBeg.SetFocus; end
  else
    (Sender as TDBEdit).Color := clWindow;
end;

end.
