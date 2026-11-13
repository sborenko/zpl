unit z_dfGtNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, DBTables, IniFiles,
  ComCtrls;

type
  TFormGetNrFam = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryID: TQuery;
    dsrcID: TDataSource;
    LabelCntRec: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgrID: TDBGrid;
    qryTts: TQuery;
    dsrcTts: TDataSource;
    dbgrTts: TDBGrid;
    procedure dbgrIDDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrTtsDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenQryId(cDirNm, cTableNm, cFam : string);
    procedure OpenQryTts(cDirNm, cTableNm, cFam : string);
    procedure Open2QryTts(cDirNm, cTableNm : string; nTabN : integer);
  public
    { Public declarations }
  end;

function GetFamNR(var nNR : integer; cDirNm, cTableNm, cFam : string) : boolean;
function Get2FamNR(var nNR : integer; cDirNm, cTableNm, cFam : string) : boolean;
function Get3TabNNR(var nNR : integer; cDirNm, cTableNm : string;
                                                     nTabN : integer) : boolean;

const SECTION = 'z_dfGtNF';

var
  FormGetNrFam: TFormGetNrFam;

implementation

uses a_Const, z_Main;

{$R *.dfm}

//------------------------------------------------------------------------------
function Get3TabNNR(var nNR : integer; cDirNm, cTableNm : string;
                                                     nTabN : integer) : boolean;
begin
  Result := false;
  Screen.Cursor := crSQLWait;
  FormGetNrFam := TFormGetNrFam.Create(Application);
  with FormGetNrFam do begin
    TabSheet1.TabVisible := false;
    TabSheet2.TabVisible := false;
    Open2QryTts(cDirNm, cTableNm, nTabN);
    PageControl1.ActivePage := TabSheet2;
    Screen.Cursor := crDefault;
    if qryTts.RecordCount > 0 then begin
      Caption := 'Выберите нужного сотрудника';
      LabelCntRec.Caption := 'Записей: ' + IntToStr(qryTts.RecordCount);
      if ShowModal = mrOk then begin
        nNR := qryTts.FieldByName('NR').AsInteger;
        Result := true;
        qryTts.Close;
      end; end
    else
      ShowMessage('Не найдено в таблице табельного номера ' + IntToStr(nTabN));
    Free;
  end;
end;
//------------------------------------------------------------------------------
function Get2FamNR(var nNR : integer; cDirNm, cTableNm, cFam : string) : boolean;
begin
  Result := false;
  Screen.Cursor := crSQLWait;
  FormGetNrFam := TFormGetNrFam.Create(Application);
  with FormGetNrFam do begin
    TabSheet1.TabVisible := false;
    TabSheet2.TabVisible := false;
    OpenQryTts(cDirNm, cTableNm, cFam);
    PageControl1.ActivePage := TabSheet2;
    Screen.Cursor := crDefault;
    if qryTts.RecordCount > 0 then begin
      Caption := 'Выберите фамилию';
      LabelCntRec.Caption := 'Записей: ' + IntToStr(qryTts.RecordCount);
      if ShowModal = mrOk then begin
        nNR := qryTts.FieldByName('NR').AsInteger;
        Result := true;
        qryTts.Close;
      end; end
    else
      ShowMessage('Не найдено в таблице фамилии ' + cFam);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetFamNR(var nNR : integer; cDirNm, cTableNm, cFam : string) : boolean;
begin
  Result := false;
  Screen.Cursor := crSQLWait;
  FormGetNrFam := TFormGetNrFam.Create(Application);
  with FormGetNrFam do begin
    TabSheet1.TabVisible := false;
    TabSheet2.TabVisible := false;
    OpenQryId(cDirNm, cTableNm, cFam);
    PageControl1.ActivePage := TabSheet1;
    Screen.Cursor := crDefault;
    if qryId.RecordCount > 0 then begin
      Caption := 'Выберите фамилию';
      LabelCntRec.Caption := 'Записей: ' + IntToStr(qryId.RecordCount);
      if ShowModal = mrOk then begin
        nNR := qryId.FieldByName('NR').AsInteger;
        Result := true;
        qryId.Close;
      end; end
    else
      ShowMessage('Не найдено в таблице фамилии ' + cFam);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetNrFam.Open2QryTts(cDirNm, cTableNm : string; nTabN : integer);
begin
  with qryTts do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDirNm;
    SQL.Add('Select NR, TIN, Komn, TabN, FamIO from ' + cTableNm +
            ' where (TabN = :nTabN) ' +
            ' order by TIN, Komn');
    ParamByName('nTabN').AsInteger := nTabN;
    if bFlagDbg then
      SQL.SaveToFile('c:\Temp\sql.sql');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetNrFam.OpenQryTts(cDirNm, cTableNm, cFam : string);
begin
  with qryTts do begin
    cFam := AnsiUpperCase(cFam);
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDirNm;
    SQL.Add('Select NR, TIN, Komn, TabN, FamIO from ' + cTableNm +
            ' where (TabN <> -99) and (FamIO Like "%' + cFam + '%") ' +
            ' order by TIN, Komn');
    if bFlagDbg then
      SQL.SaveToFile('c:\Temp\sql.sql');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetNrFam.OpenQryId(cDirNm, cTableNm, cFam : string);
begin
  with qryId do begin
    cFam := AnsiUpperCase(cFam);
    if Active then Close;
    SQL.Clear;
    DataBaseName := cDirNm;
    SQL.Add('Select * from ' + cTableNm +
             ' where (Fam Like "%' + cFam + '%") order by Fam, Ima, Otch');
    if bFlagDbg then
      SQL.SaveToFile('c:\Temp\sql.sql');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGetNrFam.dbgrIDDblClick(Sender: TObject);
begin
  if qryId.RecordCount > 0 then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGetNrFam.dbgrTtsDblClick(Sender: TObject);
begin
  if qryTts.RecordCount > 0 then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGetNrFam.FormCreate(Sender: TObject);
begin
  LabelCntRec.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 345);
    Width  := ReadInteger(SECTION, 'wW', 575);
    Free;
  end;
  if FileExists(cDirVids + 'GtNrF.vid') then
    dbgrID.Columns.LoadFromFile(cDirVids + 'GtNrF.vid');
  if FileExists(cDirVids + 'GtNrFtts.vid') then
    dbgrTts.Columns.LoadFromFile(cDirVids + 'GtNrFtts.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGetNrFam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrId.Columns.SaveToFile(cDirVids + 'GtNrF.vid');
  dbgrTts.Columns.SaveToFile(cDirVids + 'GtNrFtts.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;


end.
