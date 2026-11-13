unit z_IspSlg;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
      Forms, IniFiles, Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
      Menus, DB, DBTables;

type
  TFormIspSlg = class(TForm)
    Panel1: TPanel;
    LabelCountRec: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    dbgrIsp: TDBGrid;
    qryIsp: TQuery;
    updIsp: TUpdateSQL;
    qryIspNR: TIntegerField;
    qryIspKDSLG: TSmallintField;
    qryIspNMSLG: TStringField;
    qryIspNOTES: TStringField;
    qryIspADRES: TStringField;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popAdd: TMenuItem;
    popEdt: TMenuItem;
    popDel: TMenuItem;
    dsrcIsp: TDataSource;
    qryTmp: TQuery;
    procedure popAddClick(Sender: TObject);
    procedure qryIspAfterPost(DataSet: TDataSet);
    procedure qryIspBeforePost(DataSet: TDataSet);
    procedure qryIspNewRecord(DataSet: TDataSet);
    procedure popEdtClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure qryIspAfterDelete(DataSet: TDataSet);
    procedure popPopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrIspEnter(Sender: TObject);
    procedure dbgrIspExit(Sender: TObject);
    procedure dbgrIspDblClick(Sender: TObject);
  private
    { Private declarations }
    nSvKdSlg : SmallInt;
    bVuborMode : Boolean;
    procedure OpenQryIsp;
  public
    { Public declarations }
  end;

const SECTION = 'z_IspSlg';

procedure ShowIspSlg;

function GetKdSlg(var nKdSlg : SmallInt;
                                   var cNmSlg, cAdres : ShortString) : boolean;

var
  FormIspSlg: TFormIspSlg;

implementation

uses A_Const, a_Dm, Z_DM, Z_Main, z_EIspSl;


{$R *.dfm}
//------------------------------------------------------------------------------
procedure ShowIspSlg;
begin
  FormIspSlg := TFormIspSlg.Create(Application);
  with FormIspSlg do begin
    bVuborMode := false;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Закрыть';
    OpenQryISp;
    LabelCountRec.Caption := 'Записей : ' + IntToStr(qryIsp.RecordCount);
    if nSvKdSlg > 0 then
      qryIsp.Locate('KdSlg', nSvKdSlg, []);
    Caption    := 'Список исполнительных служб';

    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetKdSlg(var nKdSlg : SmallInt;
                                   var cNmSlg, cAdres : ShortString) : boolean;
begin
  Result := false;
  FormIspSlg := TFormIspSlg.Create(Application);
  with FormIspSlg do begin
    bVuborMode := true;
    OpenQryISp;
    LabelCountRec.Caption := 'Записей : ' + IntToStr(qryIsp.RecordCount);
    if (nKdSlg > 0) then
      qryIsp.Locate('KdSlg', nKdSlg, [])
    else if nSvKdSlg > 0 then
      qryIsp.Locate('KdSlg', nSvKdSlg, []);
    Caption    := 'Выбор из списка исполнительных служб';

    if ShowModal = mrOk then begin
      nKdSlg := qryIspKdSlg.AsInteger;
      cNmSlg := qryIspNmSlg.AsString;
      cAdres := qryIspAdres.AsString;
      Result := true;
    end;
    Free;
  end;
end;


//------------------------------------------------------------------------------
procedure TFormIspSlg.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 150);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 430);
    Width  := ReadInteger(SECTION, 'wW', 732);
    nSvKdSlg := ReadInteger(SECTION, 'nSvKdSlg', 0);
    Free;
  end;
  if FileExists(cDirVids + 'Z_IspSl01.vid') then
    dbgrIsp.Columns.LoadFromFile(cDirVids + 'Z_IspSl01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrIsp.Columns.SaveToFile(cDirVids + 'Z_IspSl01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvKdSlg', qryIspKdSlg.AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.OpenQryIsp;
begin
  with qryIsp do begin
    if Active then Close;
    SQL.Clear;
    DatabaseName := CESMAIN;
    SQL.Add('Select * from z_IspSlg order by KdSlg');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.popAddClick(Sender: TObject);
var nSvNr: integer;
begin
  with qryIsp do begin
    nSvNr  := qryIspNr.AsInteger;
    Append;
    If EA_IspSlg then begin
      Post;
      LabelCountRec.Caption := 'Записей : ' + IntToStr(RecordCount); end
    else begin
      Cancel;
      Locate('NR',nSvNr,[]);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.qryIspAfterPost(DataSet: TDataSet);
begin
 If qryIsp.UpdatesPending then
   Form_DM.DbMain.ApplyUpdates([qryIsp]);
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.qryIspBeforePost(DataSet: TDataSet);
begin
 If qryIspNr.IsNull or (qryIspNr.Value = 0) then
   qryIspNr.AsInteger := Form_DM.GetNewIspSlg;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.qryIspNewRecord(DataSet: TDataSet);
var nNewKd : smallInt;
begin
 with qryTMP do begin
    if Active then Close;
    SQL.Clear;
    DatabaseName := CESMAIN;
    SQL.Add('Select Max(KdSlg) MaxKd from z_IspSlg');
    Open;
    nNewKd := FieldByName('MaxKd').AsInteger + 1;
    Close;
    SQL.Clear;
    DatabaseName := '';
 end;
 qryIspKdSlg.AsInteger := nNewKd;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.popEdtClick(Sender: TObject);
begin
  with qryIsp do begin
    Edit;
    If EA_IspSlg then begin
      Post; end
    else begin
      Cancel;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.popDelClick(Sender: TObject);
var nDelNr : integer;
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны ?:',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    nDelNr := qryIspNR.AsInteger;
    updIsp.DeleteSQL.Text :=
                      'Delete from Z_IspSlg where NR = ' + IntToStr(nDelNr);
    qryIsp.Delete;
    LabelCountRec.Caption := 'Записей : ' + IntToStr(qryIsp.RecordCount);

  end;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.qryIspAfterDelete(DataSet: TDataSet);
begin
 If qryIsp.UpdatesPending then
   Form_DM.DbMain.ApplyUpdates([qryIsp]);
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.popPopup(Sender: TObject);
begin
  popedt.Enabled := qryIsp.RecordCount > 0;
  popdel.Enabled := popedt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.dbgrIspEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.dbgrIspExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormIspSlg.dbgrIspDblClick(Sender: TObject);
begin
  if bVuborMode and (qryIsp.RecordCount > 0) then
    bBtnOk.Click;
end;

end.
