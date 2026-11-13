unit z_PidZv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  DB, DBTables, Menus;

type
  TFormPidZviln = class(TForm)
    Panel1: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dbgrPidZv: TDBGrid;
    qryPidZv: TQuery;
    dsrcPidZv: TDataSource;
    qryPidZvCODE: TIntegerField;
    qryPidZvNUM: TStringField;
    qryPidZvNAME: TStringField;
    qryPidZvREASONS: TStringField;
    LabelCntRec: TLabel;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    Pop: TPopupMenu;
    popHead: TMenuItem;
    popAdd: TMenuItem;
    popEDt: TMenuItem;
    popDel: TMenuItem;
    qryPidZvNR: TIntegerField;
    updPidZv: TUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrPidZvDblClick(Sender: TObject);
    procedure PopPopup(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure qryPidZvAfterPost(DataSet: TDataSet);
    procedure qryPidZvAfterDelete(DataSet: TDataSet);
    procedure qryPidZvAfterInsert(DataSet: TDataSet);
    procedure popEDtClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
  private
    { Private declarations }
    nSvCode : integer;
    bVuborMode : boolean;
    procedure OpenQryPidZv;
  public
    { Public declarations }
  end;

procedure ShwPidZviln;
function GetPidZviln(var nCode : integer; var cPidZv : ShortString) : boolean;
function CheckKdPidZv(nCode : SmallInt; var cPidZv : ShortString) : boolean;

const SECTION = 'z_PidZv';

var
  FormPidZviln: TFormPidZviln;

implementation

uses a_Const, A_Dm, z_DM, z_Main, z_EPidZv;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwPidZviln;
begin
  FormPidZviln := TFormPidZviln.Create(Application);
  with FormPidZviln do begin
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Выход';
    bVuborMode := false;
    OpenQryPidZv;
    if nSvCode > 0 then
      qryPidZv.Locate('Code', nSvCode, []);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetPidZviln(var nCode : integer; var cPidZv : ShortString) : boolean;
begin
  Result := false;
  FormPidZviln := TFormPidZviln.Create(Application);
  with FormPidZviln do begin
    bVuborMode := true;
    bBtnOk.Visible := true;
    OpenQryPidZv;
    if nCode > 0 then
      qryPidZv.Locate('Code', nCode, [])
    else if nSvCode > 0 then
      qryPidZv.Locate('Code', nSvCode, []);
    if ShowModal = mrOk then begin
      nCode := qryPidZvCode.AsInteger;
      cPidZv := qryPidZvReasons.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function CheckKdPidZv(nCode : SmallInt; var cPidZv : ShortString) : boolean;
begin
  Result := false;
  cPidZv := '';
  FormPidZviln := TFormPidZviln.Create(Application);
  with FormPidZviln do begin
    OpenQryPidZv;
    if qryPidZv.Locate('Code', nCode, []) then begin
      cPidZv := qryPidZvReasons.AsString;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.OpenQryPidZv;
begin
  with qryPidZv do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Select * from z_PidZviln');
    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.FormCreate(Sender: TObject);
begin
  Caption := 'Причины увольнения';
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 151);
	  Top    := ReadInteger(SECTION, 'wT', 390);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 650);
    nSvCode := ReadInteger(SECTION, 'nSvCode', 0);
	  Free;
  end;
  if FileExists(cDirVids + 'z_PidZv.vid') then
    dbgrPidZv.Columns.LoadFromFile(cDirVids + 'z_PidZv.vid');
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPidZv.Columns.SaveToFile(cDirVids + 'z_PidZv.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvCode', qryPidZvCode.AsInteger);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.dbgrPidZvDblClick(Sender: TObject);
begin
  if bVuborMode and (qryPidZv.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.PopPopup(Sender: TObject);
begin
 popDEl.Enabled := qryPidZv.RecordCount > 0;
 popEdt.Enabled := popDEl.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.popAddClick(Sender: TObject);
var nSvNr : integer;
begin
  with qryPidZv do begin
    nSvNr := FieldByName('NR').AsInteger;
    Append;
    If AEPidZv {z_EPidZv} then
      Post
    else begin
      Cancel;
      Locate('Nr', nSvNr, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.popEDtClick(Sender: TObject);
begin
  with qryPidZv do begin
    Edit;
    If AEPidZv {z_EPidZv} then
      Post
    else begin
      Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.popDelClick(Sender: TObject);
begin
  if (MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
     [mbYes, mbNo], 0) = mrYes) then
       qryPidzv.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.qryPidZvAfterPost(DataSet: TDataSet);
begin
  if qryPidZv.UpdatesPending then
    Form_DM.DbMain.ApplyUpdates([qryPidZv]);
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.qryPidZvAfterDelete(DataSet: TDataSet);
begin
  if qryPidZv.UpdatesPending then
    Form_DM.DbMain.ApplyUpdates([qryPidZv]);
end;
//------------------------------------------------------------------------------
procedure TFormPidZviln.qryPidZvAfterInsert(DataSet: TDataSet);
begin
  qryPidZvNR.AsInteger := Form_DM.GetNewpidzvNr;
end;


end.
