unit z_VedFBK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons;

type
  TFormFilterBK = class(TForm)
    dbgrFBK: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsrcFBK: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrFBKDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetFilterBK(cdsFBK : TDataSet; var nKdBnk : SmallInt) : boolean;

const SECTION = 'z_VedFBK';

var
  FormFilterBK: TFormFilterBK;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetFilterBK(cdsFBK : TDataSet; var nKdBnk : SmallInt) : boolean;
begin
  Result := false;
  FormFilterBK := TFormFilterBK.Create(Application);
  with FormFilterBK do begin
    Caption := 'Выбор банка для фильтра';
    dsrcFBK.DataSet := cdsFBK;
    if ShowModal = mrOk then begin
      nKdBnk := cdsFBK.FieldByName('KdBnk').AsInteger;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFilterBK.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 250);
    Width  := ReadInteger(SECTION, 'wW', 355);
    Free;
  end;
  if FileExists(cDirVids + 'VdFbk01.vid') then
    dbgrFBK.Columns.LoadFromFile(cDirVids + 'VdFbk01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormFilterBK.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrFBK.Columns.SaveToFile(cDirVids + 'VdFbk01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFilterBK.dbgrFBKDblClick(Sender: TObject);
begin
  if dsrcFBK.DataSet.RecordCount > 0 then
    ModalResult := mrOk;
end;

end.
