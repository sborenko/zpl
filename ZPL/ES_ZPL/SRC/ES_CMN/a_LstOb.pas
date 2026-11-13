unit a_LstOb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB,
  DBTables;

type
  TFormNaborOb = class(TForm)
    Panel1: TPanel;
    dbgrOb: TDBGrid;
    bBtnCancel: TBitBtn;
    qryOb: TQuery;
    dsrcOb: TDataSource;
    qryObKDUSR: TSmallintField;
    qryObNR: TIntegerField;
    qryObKDOB: TSmallintField;
    qryObNMOB: TStringField;
    qryObNOTES: TStringField;
    LbxKdOb: TListBox;
    Label1: TLabel;
    procedure dbgrObEnter(Sender: TObject);
    procedure dbgrObExit(Sender: TObject);
    procedure dbgrObDblClick(Sender: TObject);
    procedure dbgrObDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    n_KdUsr : SmallInt;
    procedure OpenQryOb(nKdUsr : SmallInt);
  public
    { Public declarations }
  end;

procedure ShNaborOb(nKdUsr : SmallInt; cNmUsr : ShortString);

const SECTION = 'a_LstOb';

var
  FormNaborOb: TFormNaborOb;

implementation

uses a_Const, A_Dm, a_Usrs2;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShNaborOb(nKdUsr : SmallInt; cNmUsr : ShortString);
begin
  FormNaborOb := TFormNaborOb.Create(Application);
  with FormNaborOb do begin
    n_KdUsr := nKdUsr;
    Caption := 'Набор общежитий для пользователя ' + IntToStr(nKdUsr) +
               ' {' + cNmUsr + ')';
    OpenQryOb(nKdUsr);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNaborOb.dbgrObEnter(Sender: TObject);
begin
  dbgrOb.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormNaborOb.dbgrObExit(Sender: TObject);
begin
  dbgrOb.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormNaborOb.dbgrObDblClick(Sender: TObject);
var i : SmallInt;
begin
  i := LbxKdOb.Items.IndexOf(qryobKdOb.AsString);
  if i < 0 then begin
    Form_UsersNew.QryUsrObAdd(n_KdUsr, qryObKdOb.AsInteger, qryObNmOb.AsString);
    LbxKdOb.Items.Add(qryObKdOb.AsString);
    dbgrOb.Refresh; end
  else begin
    Form_UsersNew.QryUsrObDel(n_KdUsr, qryObKdOb.AsInteger);
    LbxKdOb.Items.Delete(i);
    dbgrOb.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNaborOb.OpenQryOb(nKdUsr: SmallInt);
begin
  with qryOb do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select uo.KdUsr, ob.* from sg_KdOb ob ' +
            ' Left Outer Join sg_UsrOb uo on uo.KdUsr = :nKdUsr and ' +
            ' uo.KdOb = ob.KdOb order by KdOb');
    ParamByName('nKdUsr').AsInteger := nKdUsr;
    Open;
    LbxKdOb.Clear;
    while not Eof do begin
      if not qryObKdUsr.IsNull and (qryObKdUsr.AsInteger = nKdUsr) then
        LbxKdOb.Items.Add(qryObKdOb.AsString);
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormNaborOb.dbgrObDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrOb.Canvas do begin
    if not (gdFocused in State) then begin
      if (LbxKdOb.Items.IndexOf(qryobKdOb.AsString) >= 0) then
        Font.Color := clMaroon
      else begin
        Font.Color := clWindowText;
        Font.Style := [];
      end
    end;
  end;
  dbgrOb.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormNaborOb.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 50);
	  Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 450);
	  Free;
  end;
  if FileExists(cDirVids + 'StgNbrOb.vid') then
    dbgrOb.Columns.LoadFromFile(cDirVids + 'StgNbrOb.vid');
end;
//------------------------------------------------------------------------------
procedure TFormNaborOb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrOb.Columns.SaveToFile(cDirVids + 'StgNbrOb.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
	  Free;
  end;
end;

end.
