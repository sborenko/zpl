unit a_ShBnks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBTables,
  IniFiles;

type
  TFormShwBanks = class(TForm)
    qryBnks: TQuery;
    dsrcBnks: TDataSource;
    dbgrBnks: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    bBtnOk: TBitBtn;
    pop: TPopupMenu;
    popAdd: TMenuItem;
    popEdt: TMenuItem;
    popDel: TMenuItem;
    popHead: TMenuItem;
    bBtnCancel: TBitBtn;
    qryBnksNR: TIntegerField;
    qryBnksKDBNK: TSmallintField;
    qryBnksNMBANK: TStringField;
    qryBnksNMBANKE: TStringField;
    qryBnksADRBANK: TStringField;
    qryBnksADRBANKE: TStringField;
    qryBnksRSCH: TStringField;
    qryBnksMFO: TStringField;
    qryBnksOKPO: TStringField;
    qryBnksNOTES: TStringField;
    updBnks: TUpdateSQL;
    qryTmp: TQuery;
    qryBnksNMBANK2: TStringField;
    qryBnksSWIFT: TStringField;
    procedure popPopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure dbgrBnksDblClick(Sender: TObject);
  private
    { Private declarations }
    n_SvNR : integer;
    function NewKdBnk : integer;
  public
    { Public declarations }
  end;

procedure ShowBanki;
function GetBank(var nKdBnk : integer; var cNmBnk : string) : boolean;

const SECTION = 'a_ShBnks';

var
  FormShwBanks: TFormShwBanks;

implementation

uses a_Const, A_Dm, b_Dm, b_Main, b_EBnks;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetBank(var nKdBnk : integer; var cNmBnk : string) : boolean;
begin
  Result := false;
  FormShwBanks := TFormShwBanks.Create(Application);
  with FormShwBanks do begin
    Caption := 'Выбор банка';
    bBtnOk.Visible := true;
    bBtnCancel.Caption := 'Отказ';
    qryBnks.Open;
    if nKdBnk <> 0 then
      qryBnks.Locate('KdBnk', nKdBnk, [])
    else if n_SvNR <> 0 then
      qryBnks.Locate('NR', n_SvNR, []);
    if ShowModal = mrOk then begin
      nKdBnk := qryBnksKdBnk.AsInteger;
      cNmBnk := qryBnksNmBank.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShowBanki;
begin
  FormShwBanks := TFormShwBanks.Create(Application);
  with FormShwBanks do begin
    Caption := 'Банки';
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    qryBnks.Open;
    if n_SvNR <> 0 then
      qryBnks.Locate('NR', n_SvNR, []);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanks.popPopup(Sender: TObject);
begin
  popEdt.Enabled := qryBnks.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanks.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 100);
	  Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 550);
    n_SvNR := ReadInteger(SECTION, 'nSvNR', 0);
	  Free;
  end;
  if FileExists(cDirVids + 'grBnkRkv.vid') then
    dbgrBnks.Columns.LoadFromFile(cDirVids + 'grBnkRkv.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwBanks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrBnks.Columns.SaveToFile(cDirVids + 'grBnkRkv.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvNR', qryBnks.FieldByName('NR').AsInteger);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanks.popEdtClick(Sender: TObject);
begin
  with qryBnks do begin
    Edit;
    if EABank {b_EBnks} then begin
      Post;
      Form_Dm.DbMain.ApplyUpdates([qryBnks]); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
function TFormShwBanks.NewKdBnk : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Max(KdBnk) as MaxKd from Kd_Bnk');
    Open;
    if (RecordCount > 0) and (FieldByName('MaxKd').AsInteger > 0) then
      Result := FieldByName('MaxKd').AsInteger + 1
    else
      Result := 1;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanks.popAddClick(Sender: TObject);
var nSvNR, nNwKdBnk : integer;
begin
  with qryBnks do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    if EABank {b_EBnks} then begin
      nNwKdBnk := NewKdBnk;
      FieldByName('KdBnk').AsInteger := nNwKdBnk;
      Post;
      Form_Dm.DbMain.ApplyUpdates([qryBnks]);
      Close;
      Open;
      Locate('KdBnk', nNwKdBnk, []); end
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwBanks.dbgrBnksDblClick(Sender: TObject);
begin
  if qryBnks.RecordCount > 0 then
    ModalResult := mrOk;
end;

end.
