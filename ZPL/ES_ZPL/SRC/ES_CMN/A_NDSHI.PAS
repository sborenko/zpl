unit A_NdsHi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables;

type
  TFormNdsHi = class(TForm)
    dbgrNdsHist: TDBGrid;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowNdsHistory;

const SECTION = 'A_NdsHi';

var
  FormNdsHi: TFormNdsHi;

implementation

uses A_Const, A_Dm;

{$R *.DFM}

//--------------------------------------------------------------------
procedure ShowNdsHistory;
begin
  FormNdsHi := TFormNdsHi.Create(Application);
  with FormNdsHi do begin
    Caption := 'История НДС';
    with dbgrNdsHist.DataSource.DataSet as TQuery do begin
      if not Active then Open;
      CachedUpdates := true;
      ShowModal;
      CachedUpdates := false;
    end;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormNdsHi.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 195);
    Width  := ReadInteger(SECTION, 'wW', 335);
    Free;
  end;
  if FileExists(cDirVids + 'NdsHistr.vid') then
    dbgrNdsHist.Columns.LoadFromFile(cDirVids + 'NdsHistr.vid');
  dbgrNdsHist.ReadOnly := nAppUsrKat > 3;  
end;
//--------------------------------------------------------------------
procedure TFormNdsHi.FormClose(Sender: TObject;
                                            var Action: TCloseAction);
begin
  dbgrNdsHist.Columns.SaveToFile(cDirVids + 'NdsHistr.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;

end.
