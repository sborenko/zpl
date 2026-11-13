unit a_ShFre2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Grids, DBGrids, ExtCtrls, DB, DBClient, StdCtrls,
  Buttons, DBCtrls;

type
  TFormShwFindRec2 = class(TForm)
    Panel1: TPanel;
    dbgrKli: TDBGrid;
    dsrcKli: TDataSource;
    cds_Kli: TClientDataSet;
    Label1: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    LabelCntRec: TLabel;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrKliEnter(Sender: TObject);
    procedure dbgrKliExit(Sender: TObject);
    procedure dbgrKliDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ShwFindRec2(var nKdKli : SmallInt; cdsKli : TClientDataSet) : boolean;

const SECTION = 'a_ShFRe2';

var
  FormShwFindRec2: TFormShwFindRec2;

implementation

uses A_Const;

{$R *.dfm}

//------------------------------------------------------------------------------
function ShwFindRec2(var nKdKli : SmallInt; cdsKli : TClientDataSet) : boolean;
begin
  Result := false;
  FormShwFindRec2 := TFormShwFindRec2.Create(Application);
  with FormShwFindRec2 do begin
    Caption := 'Результат поиска';
    cds_Kli := cdsKli;
    dsrcKli.DataSet := cds_Kli;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(cds_Kli.RecordCount);
    if ShowModal = mrOk then begin
      nKdKli := cds_Kli.FieldByName('KdKli').AsInteger;
      //nKdDgv := cds_Kli.FieldByName('KdDgv').AsInteger;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwFindRec2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 10);
    Top    := ReadInteger(SECTION, 'wT', 10);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 600);
    Free;
  end;
  if FileExists(cDirVids + 'ShFRec.vid') then
    dbgrKli.Columns.LoadFromFile(cDirVids + 'ShFRec.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwFindRec2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrKli.Columns.SaveToFile(cDirVids + 'ShFRec.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwFindRec2.dbgrKliEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShwFindRec2.dbgrKliExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormShwFindRec2.dbgrKliDblClick(Sender: TObject);
begin
  if cds_Kli.RecordCount > 0 then
    ModalResult := mrOk;
end;

end.
