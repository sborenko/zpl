unit z_ZaMG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, StdCtrls, Buttons, DB, DBClient;

type
  TFormZaMG = class(TForm)
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dbgrZaMG: TDBGrid;
    dsrcZaMG: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrZaMGDblClick(Sender: TObject);
    procedure dbgrZaMGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetZaMG(X, Y : integer; cdsZaMG : TClientDataSet) : boolean;

const SECTION = 'z_ZaMG';

var
  FormZaMG: TFormZaMG;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetZaMG(X, Y : integer; cdsZaMG : TClientDataSet) : boolean;
begin
  Result := false;
  FormZaMG := TFormZaMG.Create(Application);
  with FormZaMG do begin
    Caption := 'Âûבמנ לוסÿצא';
    Left := X - Width + 5;
    Top  := Y + 8;
    dsrcZaMG.DataSet := cdsZaMG;
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZaMG.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Width  := ReadInteger(SECTION, 'wW', 140);
    Height := ReadInteger(SECTION, 'wH', 320);
    Free;
  end;
  If FileExists(cDirVids + 'Z_ZaMG.vid') then
    dbgrZaMG.Columns.LoadFromFile(cDirVids + 'Z_ZaMG.vid');
end;
//------------------------------------------------------------------------------
procedure TFormZaMG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrZaMG.Columns.SaveToFile(cDirVids + 'Z_ZaMG.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'wH', Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormZaMG.dbgrZaMGDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormZaMG.dbgrZaMGKeyDown(Sender: TObject; var Key: Word;
                                                          Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    ModalResult := mrOk;
end;

end.
