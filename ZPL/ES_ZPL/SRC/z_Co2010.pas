unit z_Co2010;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, ExtCtrls, Menus, DB, DBTables, Grids, DBGrids,
  StdCtrls, Buttons;

type
  TFormCo2010 = class(TForm)
    Panel1: TPanel;
    labelCountRec: TLabel;
    bBtnCancel: TBitBtn;
    dbgrDK: TDBGrid;
    qryDK: TQuery;
    qryDKCODE: TStringField;
    qryDKC_ZKPP: TStringField;
    qryDKNAMED: TStringField;
    qryDKNAMEFULL: TStringField;
    qryDKid: TIntegerField;
    qryDKkdok: TIntegerField;
    qryDKnameok: TStringField;
    dsrcDK: TDataSource;
    popSort: TPopupMenu;
    N1: TMenuItem;
    popOrderByCode: TMenuItem;
    popOrderByNameOK: TMenuItem;
    PanelTop: TPanel;
    Splitter1: TSplitter;
    dbgrDolgn: TDBGrid;
    sBtnQryDk: TSpeedButton;
    sBtnBatchMov: TSpeedButton;
    sBtnOpenTblDolgn: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BatchMove1: TBatchMove;
    tblDolgn: TTable;
    LabelBatchRec: TLabel;
    dsrcDolgn: TDataSource;
    tblDolgnID: TIntegerField;
    tblDolgnKDOK: TIntegerField;
    tblDolgnNAMEOK: TStringField;
    tblDolgnCODE: TStringField;
    tblDolgnC_ZKPP: TStringField;
    tblDolgnNAMED: TStringField;
    tblDolgnNAMEFULL: TStringField;
    procedure dbgrEnter(Sender: TObject);
    procedure dbgrExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnQryDkClick(Sender: TObject);
    procedure sBtnBatchMovClick(Sender: TObject);
    procedure sBtnOpenTblDolgnClick(Sender: TObject);
  private
    { Private declarations }
    procedure   OpenQryDK;
  public
    { Public declarations }
  end;


  const SECTION = 'z_Co2010';

  procedure CopyDK2010;

var
  FormCo2010: TFormCo2010;

implementation

{$R *.dfm}

uses A_Const, a_Dm, Z_DM, Z_Main, DsLib;


//------------------------------------------------------------------------------
procedure CopyDK2010;
begin
  FormCO2010 := TFormCo2010.Create(Application);
  with FormCo2010 do begin

    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCo2010.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left := ReadInteger(SECTION, 'wL', 200);
    Top  := ReadInteger(SECTION, 'wT', 200);
    Width:= ReadInteger(SECTION, 'wW', 600);
    Height:= ReadInteger(SECTION, 'wH', 400);
    dbgrDK.Height := ReadInteger(SECTION, 'grDkH', 200);
    Free;
  end;
  if FileExists(cDirVids + 'CoDK_0.vid') then
    dbgrDK.Columns.LoadFromFile(cDirVids + 'CoDK_0.vid');
end;
//------------------------------------------------------------------------------
procedure TFormCo2010.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrDK.Columns.SaveToFile(cDirVids + 'CoDK_0.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'grDkH', dbgrDK.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCo2010.dbgrEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormCo2010.dbgrExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormCo2010.sBtnQryDkClick(Sender: TObject);
begin
  OpenQryDK;
  sBtnQryDK.Enabled := false;
end;
//------------------------------------------------------------------------------
procedure TFormCo2010.OpenQryDK;
begin
  with qryDk do begin
    Active := false;
    SQL.Clear;
    DatabaseName := CESOK;
    SQL.Add('Select * from o_dolgnost ');
    If popOrderByCode.Checked then begin
      SQL.Add(' order by Code, c_Zkpp, nameOk'); end
    else begin
      SQL.Add(' order by NameOK, Code, c_Zkpp');
    end;
    Active := true;
    LabelCountRec.Caption := 'in qryDK rec: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCo2010.sBtnBatchMovClick(Sender: TObject);
var nBatchRec : integer;
begin
  if not qryDK.Active then
    ShowMessage('Не открыта ДК')
  else begin
    with tblDolgn do begin
      Open;
      First;
      While not EOF do
        Delete; end;
  end;

  // При перегонке BatchMove'ом портится кодировка.
  // nBatchRec := tblDolgn.BatchMove(qryDK,batAppend);
  // Теперь перегоняем по одной записи:

  with QryDK do begin
    First;

    while not Eof do begin
      with TblDolgn do begin
        Append;
        DsUtils.CopyRecord(QryDK, TblDolgn);
        Post;
      end;

      Next;
    end;
  end;

  if nBatchRec > 0 then
    LabelBatchRec.Caption := 'Скопировано: ' + IntToStr(nBatchRec);
  sBtnBatchMov.Enabled := false;
end;
//------------------------------------------------------------------------------
procedure TFormCo2010.sBtnOpenTblDolgnClick(Sender: TObject);
begin
 dsrcDolgn.DataSet := TblDolgn;
 tblDolgn.Active := true;
 sBtnOpenTblDolgn.Enabled := false;
end;

end.
