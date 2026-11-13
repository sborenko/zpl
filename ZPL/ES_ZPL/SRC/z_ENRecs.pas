unit z_ENRecs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBClient, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFormEDtNdbRecs = class(TForm)
    dbeDtBeg: TDBEdit;
    dbeDtEnd: TDBEdit;
    dbeDtPrBeg: TDBEdit;
    dbeNrPrBeg: TDBEdit;
    dbeDtPrEnd: TDBEdit;
    dbeNrPrEnd: TDBEdit;
    dbeNotes: TDBEdit;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dsrcTmp: TDataSource;
    Label8: TLabel;
    ChBoxDtBeg: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    procedure dbEditEnter(Sender: TObject);
    procedure dbEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EdtAllNdb : boolean;

const SECTION = 'z_ENRecs';

var
  FormEDtNdbRecs: TFormEDtNdbRecs;

implementation

uses a_Const, z_Main, z_AddTSN;

{$R *.dfm}

//------------------------------------------------------------------------------
function EdtAllNdb : boolean;
begin
  Result := false;
  FormEDtNdbRecs := TFormEDtNdbRecs.Create(Application);
  with FormEDtNdbRecs do begin
    Caption := 'Изменения во все записи';
    if ShowModal = mrOk then
      Result := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDtNdbRecs.dbEditEnter(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormEDtNdbRecs.dbEditExit(Sender: TObject);
begin
  (Sender as TDBEdit).Color := clWindow;
end;
//------------------------------------------------------------------------------
procedure TFormEDtNdbRecs.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 100);
    Top  := ReadInteger(SECTION, 'wT', 300);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDtNdbRecs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
