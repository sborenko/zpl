unit a_WrkUsr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Buttons, StdCtrls, ExtCtrls, DB, Grids, DBGrids, DBTables;

type
  TFormWrkUsrs = class(TForm)
    qryUsrs: TQuery;
    dsrcUsrs: TDataSource;
    dbgrUsrs: TDBGrid;
    qryUsrsNR: TIntegerField;
    qryUsrsDTBEG: TDateTimeField;
    qryUsrsKDUSR: TSmallintField;
    qryUsrsKDCMP: TSmallintField;
    qryUsrsNMUSR: TStringField;
    qryUsrsSHCMP: TStringField;
    qryUsrsLVL: TSmallintField;
    qryUsrsNMCOMPUTER: TStringField;
    PanelButtons: TPanel;
    sBtnRefresh: TSpeedButton;
    LabelCntUsrs: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryUsrs;
  public
    { Public declarations }
  end;

procedure ShwWrkUsrs;

const SECTION = 'a_wrkUsr';

var
  FormWrkUsrs: TFormWrkUsrs;

implementation

uses a_Const, a_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwWrkUsrs;
begin
  FormWrkUsrs := TFormWrkUsrs.Create(Application);
  with FormWrkUsrs do begin
    Caption := 'Активные пользователи';
    LabelCntUsrs.Caption := '';
    OpenQryUsrs;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWrkUsrs.OpenQryUsrs;
begin
  with qryUsrs do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from zz_WrkUsr order by DtBeg');
    Open;
    LabelCntUsrs.Caption := 'Активных пользователей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWrkUsrs.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 150);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Width  := ReadInteger(SECTION, 'wW', 495);
    Height := ReadInteger(SECTION, 'wH', 250);
    Free;
  end;
  if FileExists(cDirVids + 'wrkUsr01.vid') then
    dbgrUsrs.Columns.LoadFromFile(cDirVids + 'wrkUsr01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormWrkUsrs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryUsrs.Active then
    dbgrUsrs.Columns.SaveToFile(cDirVids + 'wrkUsr01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'wH', Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormWrkUsrs.sBtnRefreshClick(Sender: TObject);
begin   // Переоткрыть qryUsrs
  OpenQryUsrs;
end;

end.
