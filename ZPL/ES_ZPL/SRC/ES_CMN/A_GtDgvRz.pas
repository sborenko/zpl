unit A_GtDgvRz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables;

type
  TFormDgvRazdelu = class(TForm)
    dbgrDgvRazd: TDBGrid;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dsrcDgvRazd: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    bVuborMode : boolean;
  public
    { Public declarations }
  end;

procedure ShowModalDgvRazd(nKdRazd : integer);

const SECTION = 'A_GtDgRz';

var
  FormDgvRazdelu: TFormDgvRazdelu;

implementation

uses A_Const, A_Dm;

{$R *.DFM}

//--------------------------------------------------------------------
procedure ShowModalDgvRazd(nKdRazd : integer);
begin
  FormDgvRazdelu := TFormDgvRazdelu.Create(Application);
  with FormDgvRazdelu do begin
    Caption := 'Разделы договоров';
    bVuborMode := false;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    if nKdRazd <> 0 then
      (dsrcDgvRazd.DataSet as TQuery).Locate('KdRazd', nKdRazd, []);
    (dsrcDgvRazd.DataSet as TQuery).CachedUpdates := true;
    ShowModal;
    (dsrcDgvRazd.DataSet as TQuery).CachedUpdates := false;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormDgvRazdelu.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
  	Left := ReadInteger(SECTION, 'wL', 100);
	  Top  := ReadInteger(SECTION, 'wT', 100);
    Free;
  end;
  if FileExists(cDirVids + 'GrDgvRzd.vid') then
    dbgrDgvRazd.Columns.LoadFromFile(cDirVids + 'GrDgvRzd.vid');
end;
//--------------------------------------------------------------------
procedure TFormDgvRazdelu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dbgrDgvRazd.Columns.SaveToFile(cDirVids + 'GrDgvRzd.vid');
	with TIniFile.Create(cNmIniFile) do begin
  	WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    Free;
  end;
end;

end.
