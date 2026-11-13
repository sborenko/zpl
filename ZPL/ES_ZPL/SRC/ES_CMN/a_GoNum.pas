unit a_GoNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, Buttons,
  ExtCtrls, DBCtrls, Menus;

type
  TFormGoNumbs = class(TForm)
    qryGo: TQuery;
    dsrcGo: TDataSource;
    dbgrGo: TDBGrid;
    qryGoNR: TIntegerField;
    qryGoDTBEG: TDateTimeField;
    qryGoKDSBU: TSmallintField;
    qryGoSCHBU: TStringField;
    qryGoGONR: TStringField;
    qryGoNOTES: TStringField;
    updGo: TUpdateSQL;
    qryTmp: TQuery;
    Panel1: TPanel;
    LabelCntRec: TLabel;
    dbNavGo: TDBNavigator;
    pop: TPopupMenu;
    popDelRec: TMenuItem;
    popEdtRec: TMenuItem;
    popAddRec: TMenuItem;
    Label1: TLabel;
    sBtnAdd: TSpeedButton;
    sBtnEdt: TSpeedButton;
    sBtnDel: TSpeedButton;
    bBtnClose: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryGoAfterPost(DataSet: TDataSet);
    procedure qryGoBeforePost(DataSet: TDataSet);
    procedure dbgrGoEditButtonClick(Sender: TObject);
    procedure qryGoSCHBUValidate(Sender: TField);
    procedure qryGoNewRecord(DataSet: TDataSet);
    procedure qryGoAfterDelete(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure popDelRecClick(Sender: TObject);
    procedure bBtnCloseClick(Sender: TObject);
    procedure popAddRecClick(Sender: TObject);
    procedure popEdtRecClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
  private
    { Private declarations }
    cLDirExe, cLDirInd, cLDirTemp, cLDirVids,
                  cTmpNmIniFile, cLNmIniFile : ShortString;
    bNeedValidate, bLocalIni : boolean;
    nKdSBU : integer;
    cSchBU, cPSch, cNmSBU : string;
    bHsCh : boolean;
    procedure OpenQryGO;
    function GetNewGoNumbsNR : integer;
    procedure SetBtnsEnabled;
  public
    { Public declarations }
  end;

procedure ShGoNumbs;

const SECTION = 'a_GoNum';

var
  FormGoNumbs: TFormGoNumbs;

implementation

{$R *.dfm}

uses A_Const, A_DM, A_Lib, a_SBU, a_EGoNum;

//------------------------------------------------------------------------------
procedure ShGoNumbs;
begin
  FormGoNumbs := TFormGoNumbs.Create(Application);
  with FormGoNumbs do begin
    Caption := 'Журналы-ордера и их номера';
    OpenQryGo;
    bNeedValidate := true;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.OpenQryGO;
begin
  with qryGo do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Go_Numbs order by SchBU, DtBeg, NR');
    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    SetBtnsEnabled;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.FormCreate(Sender: TObject);
begin
  if cNmIniFile = '' then begin
    bLocalIni := true;
    cLDirExe := ExtractFileDir(ParamStr(0)) + '\';
    if cLDirInd = '' then
      cLDirInd  := cLDirExe + 'IND\';
    if cLDirTemp = '' then
      cLDirTemp := cLDirInd + 'TEMP\';
    if cLDirVids = '' then
      cLDirVids := cLDirInd + 'VIDS\';
    cLNmIniFile := cLDirInd + 'GoNum.ini';
    if not DirectoryExists(cLDirVids) then
      ForceDirectories(cLDirVids);
    if not DirectoryExists(cLDirTemp) then
      ForceDirectories(cLDirTemp);
  end;
  if bLocalIni then
    cTmpNmIniFile := cLNmIniFile
  else
    cTmpNmIniFile := cNmIniFile;
  with TIniFile.Create(cTmpNmIniFile) do begin
    Top    := ReadInteger(SECTION, 'wT', 100);
    Left   := ReadInteger(SECTION, 'wL', 100);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 450);
    Free;
  end;
  if FileExists(cDirVids + 'GoNum01.vid') then
    dbgrGo.Columns.LoadFromFile(cDirVids + 'GoNum01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bFlagDbg then
    dbgrGo.Columns.SaveToFile(cDirVids + 'GoNum01.vid');
  if bLocalIni then
    cTmpNmIniFile := cLNmIniFile
  else
    cTmpNmIniFile := cNmIniFile;
  with TIniFile.Create(cTmpNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormGoNumbs.GetNewGoNumbsNR : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(Go_Numbs_Nr, 1) as NewNR from rdb$database');
    Open;
    Result := FieldByName('NewNR').AsInteger;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.qryGoBeforePost(DataSet: TDataSet);
begin
  if qryGoNR.IsNull then
    qryGoNR.AsInteger := GetNewGoNumbsNR;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.qryGoAfterPost(DataSet: TDataSet);
begin
  if qryGo.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryGo]);
  LabelCntRec.Caption := 'Записей: ' + IntToStr(qryGo.RecordCount);
  SetBtnsEnabled;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.qryGoAfterDelete(DataSet: TDataSet);
begin
  if qryGo.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryGo]);
  LabelCntRec.Caption := 'Записей: ' + IntToStr(qryGo.RecordCount);
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.dbgrGoEditButtonClick(Sender: TObject);
var cFldNm : ShortString;
begin
  bNeedValidate := false;
  cFldNm := UpperCase(dbgrGo.SelectedField.FieldName);
  if cFldNm = 'SCHBU' then begin
    if GetSBU(nKdSBU, cSchBU, cPSch, cNmSBU, bHsCh) {a_SBU} then begin
      if not (qryGo.State in [dsInsert, dsEdit]) then
        qryGo.Edit;
      qryGoKdSbu.AsInteger := nKdSbu;
      qryGoSchBU.AsString  := cSchBU;
    end;
  end;
  bNeedValidate := true;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.qryGoSCHBUValidate(Sender: TField);
var cText : ShortString;
begin
  cText := Trim((Sender as TField).AsString);
  if cText > '' then begin
    nKdSbu := Form_Dm.SchBu2KdSbu(cText, bHsCh);
    if nKdSbu <= 0 then
      Raise Exception.
              Create('Нет в плане счетов счёта "' + cText + '"')
    else
      qryGo.FieldByName('KdSbu').AsInteger := nKdSbu; end
  else
    qryGo.FieldByName('KdSbu').AsString := '';
  bNeedValidate := true;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.qryGoNewRecord(DataSet: TDataSet);
begin
  qryGoDtBeg.AsDateTime := Date;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>.' + #13#10 +
                'Где  нужно,  пользуйтесь  контекстными  меню.');
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.popDelRecClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                [mbYes, mbNo], 0) = mrYes then begin
    qryGo.Delete;
    SetBtnsEnabled;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.bBtnCloseClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.popAddRecClick(Sender: TObject);
var nSvNR : integer;
begin
  with qryGo do begin
    nSvNR := qryGoNR.AsInteger;
    Append;
    if EAGoNumbs(dsrcGo) {a_EGoNum} then
      Post
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.popEdtRecClick(Sender: TObject);
begin
  with qryGo do begin
    Edit;
    if EAGoNumbs(dsrcGo) {a_EGoNum} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.SetBtnsEnabled;
begin
  sBtnEdt.Enabled := qryGo.RecordCount > 0;
  sBtnDel.Enabled := sBtnEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormGoNumbs.popPopup(Sender: TObject);
begin
  popEdtRec.Enabled := qryGo.RecordCount > 0;
  popDelRec.Enabled := sBtnEdt.Enabled;
end;

end.
