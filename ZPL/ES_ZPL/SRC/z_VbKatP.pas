unit z_VbKatP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Buttons, Grids, DBGrids, DBTables,
  ExtCtrls;

type
  TFormVbKatP = class(TForm)
    qryKatP: TQuery;
    dsrcKatP: TDataSource;
    dbgrKatP: TDBGrid;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryKatPNR: TIntegerField;
    qryKatPKDKATP: TSmallintField;
    qryKatPSHKATP: TStringField;
    qryKatPNMKATP: TStringField;
    PanelMsg: TPanel;
    Label1: TLabel;
    sBtnF8: TSpeedButton;
    Label2: TLabel;
    sBtnUnSelectAll: TSpeedButton;
    sBtnSelectAll: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnF8Click(Sender: TObject);
    procedure dbgrKatPDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrKatPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure sBtnSelectAllClick(Sender: TObject);
    procedure sBtnUnSelectAllClick(Sender: TObject);
  private
    { Private declarations }
    m_ListKatP : TStringList;
    procedure OpenQryKatP;
  public
    { Public declarations }
  end;

function VuborKdKatP(mListKatP : TStringList) : boolean;

const SECTION = 'z_VbKatP';

var
  FormVbKatP: TFormVbKatP;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function VuborKdKatP(mListKatP : TStringList) : boolean;
begin
  Result := false;
  FormVbKatP := TFormVbKatP.Create(Application);
  with FormVbKatP do begin
    Caption := 'Выбор категорий персонала';
    m_ListKatP := mListKatP;
    OpenQryKatP;
    if ShowModal = mrOk then begin
//      with qryKatP do begin

      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbKatP.OpenQryKatP;
begin
  with qryKatP do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KatPers order by NmKatP');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbKatP.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 345);
    Free;
  end;
  if FileExists(cDirVids + 'VbKatP_1.vid') then
    dbgrKatP.Columns.LoadFromFile(cDirVids + 'VbKatP_1.vid');
end;
//------------------------------------------------------------------------------
procedure TFormVbKatP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrKatP.Columns.SaveToFile(cDirVids + 'VbKatP_1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbKatP.sBtnF8Click(Sender: TObject);
var i : integer;
begin
  i := m_ListKatP.IndexOf(qryKatPKdKatP.AsString);
  if i >= 0 then
    m_ListKatP.Delete(i)
  else
    m_ListKatP.Add(qryKatPKdKatP.AsString);
  if not qryKatP.Eof then
    qryKatP.Next
  else
    dbgrKatP.Refresh;
  sBtNSelectAll.Enabled := m_ListKatP.Count < qryKatP.RecordCount;
  sBtnUnSelectAll.Enabled := m_ListKatP.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVbKatP.dbgrKatPDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrKatP.Canvas do begin
    if not (gdFocused in State) then begin
      if m_ListKatP.IndexOf(qryKatPKdKatP.AsString) >= 0 then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrKatP.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormVbKatP.dbgrKatPKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnF8.Click;
end;
//------------------------------------------------------------------------------
procedure TFormVbKatP.FormResize(Sender: TObject);
begin
  PanelMsg.Top := Round((Height - PanelMsg.Height) / 2) - 40;
end;
//------------------------------------------------------------------------------
procedure TFormVbKatP.sBtnSelectAllClick(Sender: TObject);
var nSvNR : integer;
begin
  m_ListKatp.Clear;
  with qryKatP do begin
    nSvNR := qryKatPNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      m_ListKatP.Add(qryKatPKdKatP.AsString);
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
    dbgrKatP.Refresh;
  end;
  sBtNSelectAll.Enabled := m_ListKatP.Count < qryKatP.RecordCount;
  sBtnUnSelectAll.Enabled := m_ListKatP.Count > 0;
end;
//------------------------------------------------------------------------------
procedure TFormVbKatP.sBtnUnSelectAllClick(Sender: TObject);
begin
  m_ListKatP.Clear;
  dbgrKatP.Refresh;
  sBtNSelectAll.Enabled := m_ListKatP.Count < qryKatP.RecordCount;
  sBtnUnSelectAll.Enabled := m_ListKatP.Count > 0;
end;

end.
