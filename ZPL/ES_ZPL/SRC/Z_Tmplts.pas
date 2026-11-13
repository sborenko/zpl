unit z_Tmplts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  ExtCtrls;

type
  TFormTemplates = class(TForm)
    qryTmp: TQuery;
    dsrcTmp: TDataSource;
    dbgrTmp: TDBGrid;
    updTmp: TUpdateSQL;
    qryTmpNR: TIntegerField;
    qryTmpKDTMPL: TSmallintField;
    qryTmpNMTMPL: TStringField;
    qryTmpFVID: TBlobField;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    qryDop: TQuery;
    qryTmpNOTES: TStringField;
    PanelButtons: TPanel;
    sBtnLoadTmpl: TSpeedButton;
    sBtnCopyTmplTo: TSpeedButton;
    bBtnCancel: TBitBtn;
    procedure qryTmpAfterPost(DataSet: TDataSet);
    procedure qryTmpAfterDelete(DataSet: TDataSet);
    procedure qryTmpAfterEdit(DataSet: TDataSet);
    procedure sBtnLoadTmplClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnCopyTmplToClick(Sender: TObject);
    procedure qryTmpNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    cSvOpenDir, cSvSaveDir : ShortString;
    procedure OpenQryTmp;
    procedure LoadFrom(cFileNm : ShortString);
    procedure SaveTo(cFileNm : ShortString);
  public
    { Public declarations }
  end;

procedure ShwMyTemplates;

const SECTION = 'z_Tmplts';

var
  FormTemplates: TFormTemplates;

implementation

uses A_Const, A_Dm, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwMyTemplates;
begin
  FormTemplates := TFormTemplates.Create(Application);
  with FormTemplates do begin
    Caption := 'Шаблоны (Банк, Зарплата)';
    OpenQryTmp;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.OpenQryTmp;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from  Ex_Tmplts order by KdTmpl');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.qryTmpAfterPost(DataSet: TDataSet);
begin
  with qryTmp do begin
    Form_Dm.DbMain.ApplyUpdates([qryTmp]);
    Close;
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.qryTmpAfterDelete(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryTmp]);
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.qryTmpAfterEdit(DataSet: TDataSet);
begin
  Form_Dm.DbMain.ApplyUpdates([qryTmp]);
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.FormCreate(Sender: TObject);
begin
	with TIniFile.Create(cNmIniFile) do begin
	  Left   := ReadInteger(SECTION, 'wL', 450);
	  Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 275);
    Width  := ReadInteger(SECTION, 'wW', 240);
    cSvOpenDir := ReadString(SECTION, 'cOpenDir', '');
    cSvSaveDir := ReadString(SECTION, 'cSaveDir', '');
	  Free;
  end;
  if FileExists(cDirVids + 'ExTmplts.vid') then
    dbgrTmp.Columns.LoadFromFile(cDirVids + 'ExTmplts.vid');
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dbgrTmp.Columns.SaveToFile(cDirVids + 'ExTmplts.vid');
	with TIniFile.Create(cNmIniFile) do begin
	  WriteInteger(SECTION, 'wL', Left);
	  WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteString(SECTION, 'cOpenDir', cSvOpenDir);
    WriteString(SECTION, 'cSaveDir', cSvSaveDir);
	  Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.sBtnLoadTmplClick(Sender: TObject);
var cFileNm : ShortString;
begin
  if MessageDlg('Если в BLOB-поле текущей записи уже есть шаблон, ' +
                'он будет заменен новым. Продолжать?:', mtWarning,
                [mbYes, mbNo], 0) = mrYes then with OpenDialog do begin
    InitialDir := cSvOpenDir;
    if Execute then begin
      cFileNm := FileName;
      cSvOpenDir := ExtractFileDir(FileName) + '\';
      LoadFrom(cFileNm);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.LoadFrom(cFileNm : ShortString);
begin
  with qryDop do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Ex_Tmplts set FVid = :MyBlob ' +
              ' where KdTmpl = :nKdTmpl ');
    ParamByName('nKdTmpl').AsInteger := qryTmpKdTmpl.AsInteger;
    ParamByName('MyBlob').LoadFromFile(cFileNm, ftBlob);
    ExecSQL;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.sBtnCopyTmplToClick(Sender: TObject);
var cFileNm : ShortString;
begin
  with SaveDialog do begin
    InitialDir := cSvSaveDir;
    if Execute then begin
      cFileNm := FileName;
      cSvSaveDir := ExtractFileDir(FileName) + '\';
      SaveTo(cFileNm);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.SaveTo(cFileNm : ShortString);
begin
  with qryDop do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select FVid from Ex_Tmplts ' +
              ' where KdTmpl = :nKdTmpl ');
    ParamByName('nKdTmpl').AsInteger := qryTmpKdTmpl.AsInteger;
    Open;
    if RecordCount > 0 then
      (FieldByName('FVid') as TBlobField).SaveToFile(cFileNm);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormTemplates.qryTmpNewRecord(DataSet: TDataSet);
begin
  qryTmpFVID.Assign(nil);
end;

end.
