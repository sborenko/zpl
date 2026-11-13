unit A_ShwAdm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Db, Grids, DBGrids, DBTables, IniFiles, StdCtrls, Buttons,
  ComCtrls;

type
  TFormAdm = class(TForm)
    tblPsw: TTable;
    dsrcPsw: TDataSource;
    bBtnClose: TBitBtn;
    tblPswNR: TAutoIncField;
    tblPswUSRNAME: TStringField;
    tblPswUSRPSW: TStringField;
    tblPswUSRLVL: TSmallintField;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrPsw: TDBGrid;
    Memo1: TMemo;
    sBtnEdt: TSpeedButton;
    procedure tblPswBeforeOpen(DataSet: TDataSet);
    procedure tblPswBeforeClose(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnEdtClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure dbgrPswKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowModalFormAdmin;

const SECTION = 'A_ShwAdm';

var
  FormAdm: TFormAdm;

implementation

uses A_Const;

{$R *.DFM}

//--------------------------------------------------------------------
procedure ShowModalFormAdmin;
begin
  FormAdm := TFormAdm.Create(Application);
  with FormAdm do begin
    Caption := 'Уголок администратора';
    tblPsw.Open;
    ShowModal;
    tblPsw.Close;
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormAdm.tblPswBeforeOpen(DataSet: TDataSet);
begin
  Session.AddPassword('SECTION');
end;
//--------------------------------------------------------------------
procedure TFormAdm.tblPswBeforeClose(DataSet: TDataSet);
begin
  Session.RemoveAllPasswords;
end;
//--------------------------------------------------------------------
procedure TFormAdm.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Height := ReadInteger(SECTION, 'wH', 200);
    Width  := ReadInteger(SECTION, 'wW', 275);
    Free;
  end;
  PageControl1.ActivePage := ts1;
  dbgrPsw.ReadOnly := true;
  dbgrPsw.Color := clBtnFace;
end;
//--------------------------------------------------------------------
procedure TFormAdm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//--------------------------------------------------------------------
procedure TFormAdm.sBtnEdtClick(Sender: TObject);
begin
  if sBtnEdt.Down then begin
    dbgrPsw.ReadOnly := false;
    dbgrPsw.Color := clWindow; end
  else begin
    dbgrPsw.ReadOnly := true;
    dbgrPsw.Color := clBtnFace;
  end;
end;
//--------------------------------------------------------------------
procedure TFormAdm.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = ts1 then
    sBtnEdt.Visible := true
  else
    sBtnEdt.Visible := false;
end;
//--------------------------------------------------------------------
procedure TFormAdm.dbgrPswKeyDown(Sender: TObject; var Key: Word;
                                                 Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_F9) then
    sBtnEdt.Down := not sBtnEdt.Down;
  if sBtnEdt.Down then begin
    dbgrPsw.ReadOnly := false;
    dbgrPsw.Color := clWindow; end
  else begin
    dbgrPsw.ReadOnly := true;
    dbgrPsw.Color := clBtnFace;
  end;
end;

end.
