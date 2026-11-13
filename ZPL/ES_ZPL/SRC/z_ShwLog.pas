unit z_ShwLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Menus, Provider, DBClient, ExtCtrls, StdCtrls, DBCtrls, DB,
  DBTables, Grids, DBGrids, Buttons;

type
  string1 = String[1];
  TFormShwLog = class(TForm)
    Panel1: TPanel;
    dbgrLog: TDBGrid;
    qryLog: TQuery;
    dsrcLog: TDataSource;
    qryLogNR: TIntegerField;
    qryLogKDUSR: TSmallintField;
    qryLogTABN: TIntegerField;
    qryLogNMUSR: TStringField;
    qryLogKDSPS: TSmallintField;
    qryLogDTEVNT: TDateTimeField;
    qryLogNMEVNT: TStringField;
    qryLogNMTBL: TStringField;
    qryLogNOTES: TStringField;
    DBMemo1: TDBMemo;
    cdsLog: TClientDataSet;
    dtpLog: TDataSetProvider;
    cdsLogNR: TIntegerField;
    cdsLogKDUSR: TSmallintField;
    cdsLogNMUSR: TStringField;
    cdsLogTABN: TIntegerField;
    cdsLogKDSPS: TSmallintField;
    cdsLogDTEVNT: TDateTimeField;
    cdsLogNMEVNT: TStringField;
    cdsLogNMTBL: TStringField;
    cdsLogNOTES: TStringField;
    pop: TPopupMenu;
    popSort: TMenuItem;
    popFilter: TMenuItem;
    popSortNR: TMenuItem;
    popSortTabN: TMenuItem;
    popSortUsr: TMenuItem;
    popFilterOff: TMenuItem;
    popFilterTabN: TMenuItem;
    popFilterUsr: TMenuItem;
    bBtnClose: TBitBtn;
    SpeedButton1: TSpeedButton;
    DBNavigator1: TDBNavigator;
    sBtnStayOnTop: TSpeedButton;
    LabelFilterMsg: TLabel;
    LabelSortMsg: TLabel;
    LabelFIO: TLabel;
    LabelCntRec: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure popSortNRClick(Sender: TObject);
    procedure popSortTabNClick(Sender: TObject);
    procedure popSortUsrClick(Sender: TObject);
    procedure popFilterOffClick(Sender: TObject);
    procedure popFilterTabNClick(Sender: TObject);
    procedure popFilterUsrClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsrcLogDataChange(Sender: TObject; Field: TField);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    n_SortCase : SmallInt;
    bByTabN : boolean;
    procedure SetFormStyle;
    procedure SetQryLog(dDtPrc : TDateTime);
    procedure SetQryLogByTabN(dDtPrc : TDateTime; nTabN : integer);
    procedure OpenCdsLog;
    procedure SetIndexState;
  public
    { Public declarations }
  end;

procedure ShowLog(dDtPrc : TDateTime);
procedure ShowLogByTabN(dDtPrc : TDateTime; nTabN : integer;
                                                    cFamIO : ShortString);

const SECTION = 'z_ShwLog';

var
  FormShwLog: TFormShwLog;

implementation

uses a_Const, a_Dm, z_Main, z_TUpi, Z_Dm;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowLog(dDtPrc : TDateTime);
begin
  if not bIsFormShwLog then begin
    FormShwLog := TFormShwLog.Create(Application);
    with FormShwLog do begin
      bIsFormShwLog := true;
      bByTabN := false;
      Caption := 'Журнал событий';
      SetQryLog(dDtPrc);
      OpenCdsLog;
      SetIndexState;
      cdsLog.Last;
      Show;
    end; end
  else begin
    if FormShwLog.WindowState = wsMinimized then
      FormShwLog.WindowState := wsNormal;
    FormShwLog.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure ShowLogByTabN(dDtPrc : TDateTime; nTabN : integer;
                                                    cFamIO : ShortString);
begin
  if not bIsFormShwLogByTabN then begin
    FormShwLog := TFormShwLog.Create(Application);
    with FormShwLog do begin
      dbgrLog.PopupMenu := nil;
      bIsFormShwLogByTabN := true;
      bByTabN := true;
      Caption := 'Журнал событий (Таб.Н-р = ' + IntToStr(nTabN) +
                                                           '  ' + cFamIO + ')';
      SetQryLogByTabN(dDtPrc, nTabN);
      OpenCdsLog;
      SetIndexState;
      cdsLog.Last;
      Show;
    end; end
  else begin
    if FormShwLog.WindowState = wsMinimized then
      FormShwLog.WindowState := wsNormal;
    FormShwLog.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.SetQryLog(dDtPrc: TDateTime);
var nY, nM, nD : word;
begin
  dDtPrc := dDtPrc - 95;
  DecodeDate(dDtPrc, nY, nM, nD);
(*
  нельзя пытаться word-переменной присвоить значение < 0
  nM := nM - 3;
  if nM < 1 then begin
    nY := nY - 1;
    if nM = 0 then
      nM := 12
    else if nM = -1 then
      nM := 11
    else if nM = -2 then
      nM := 10
    else if nM = -3 then
      nM := 9;
  end;
*)
  dDtPrc := EncodeDate(nY, nM, 1);
  with qryLog do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from DbLog where DtEvnt >= :dDtPrc order by NR');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.SetQryLogByTabN(dDtPrc: TDateTime; nTabN: integer);
begin
  with qryLog do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from DbLog where (TabN = :nTabN or ' +
            ' Notes containing("TabN = ' +
            IntToStr(nTabN) + ',")) order by NR');
    ParamByName('nTabN').AsInteger := nTabN;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.OpenCdsLog;
begin
  dtpLog.DataSet := qryLog;
  with cdsLog do begin
    if Active then Close;
    IndexName := '';
    IndexDefs.Clear;
    ProviderName := 'dtpLog';
    Open;
    AddIndex('OnNR', 'NR', []);
    AddIndex('OnTabN', 'TabN;NR', []);
    AddIndex('OnKdUsr', 'KdUsr;NR', []);
    //SetIndexState;
    Last;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    LabelCntRec.Left := bBtnClose.Left - LabelCntRec.Width - 5;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.SpeedButton1Click(Sender: TObject);
var nSvNr : integer; cSvIndexName : ShortString;
begin
  if MessageDlg('Переоткрыть журнал событий?:', mtConfirmation,
                            [mbYes, mbNo], 0) = mrYes then with cdsLog do begin
    Application.ProcessMessages;
    cSvIndexName := IndexName;
    nSvNR := cdsLogNR.AsInteger;
    OpenCdsLog;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    IndexName := cSvIndexName;
    Locate('NR', nSvNR, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.FormCreate(Sender: TObject);
begin
  LabelFIO.Caption := '';
  LabelSortMsg.Caption := '';
  LabelFilterMsg.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Top    := ReadInteger(SECTION, 'wT', 250);
    Left   := ReadInteger(SECTION, 'wL', 100);
    Height := ReadInteger(SECTION, 'wH', 460);
    Width  := ReadInteger(SECTION, 'wW', 600);
    sBtnStayOnTop.Down := ReadBool(SECTION, 'bStOnTp', true);
    n_SortCase   := ReadInteger(SECTION, 'nSrt', 0);
    Free;
  end;
  SetFormStyle;
  if n_SortCase = 2 then begin
    popSortNR.Checked   := false;
    popSortTabN.Checked := false;
    popSortUsr.Checked  := true; end
  else if n_SortCase = 1 then begin
    popSortNR.Checked   := false;
    popSortTabN.Checked := true;
    popSortUsr.Checked  := false; end
  else begin
    popSortNR.Checked   := true;
    popSortTabN.Checked := false;
    popSortUsr.Checked  := false;
  end;
  if FileExists(cDirVids + 'dbLog01.vid') then
    dbgrLog.Columns.LoadFromFile(cDirVids + 'dbLog01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.sBtnStayOnTopClick(Sender: TObject);
begin
  SetFormStyle;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.SetFormStyle;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrLog.Columns.SaveToFile(cDirVids + 'dbLog01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bStOnTp', sBtnStayOnTop.Down);
    if popSortUsr.Checked then
      WriteInteger(SECTION, 'nSrt', 2)
    else if popSortTabN.Checked then
      WriteInteger(SECTION, 'nSrt', 1)
    else
      WriteInteger(SECTION, 'nSrt', 0);
    Free;
  end;
  bIsFormShwLog := false;
  bIsFormShwLogByTabN := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormShwLog := false;
  bIsFormShwLogByTabN := false;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.SetIndexState;
begin
  if popSortUsr.Checked then begin
    cdsLog.IndexName := 'OnKdUsr';
    LabelSortMsg.Caption := 'Сортировка по коду пользователя'; end
  else if popSortTabN.Checked then begin
    cdsLog.IndexName := 'OnTabN';
    LabelSortMsg.Caption := 'Сортировка по табельному номеру'; end
  else begin
    cdsLog.IndexName := 'OnNR';
    LabelSortMsg.Caption := 'Без сортировки (в порядке поступления)';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.popSortNRClick(Sender: TObject);
begin
  if not popSortNR.Checked then begin
    popSortNR.Checked   := true;
    popSortTabN.Checked := false;
    popSortUsr.Checked  := false;
    SetIndexState;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.popSortTabNClick(Sender: TObject);
begin
  if not popSortTabN.Checked then begin
    popSortNR.Checked   := false;
    popSortTabN.Checked := true;
    popSortUsr.Checked  := false;
    SetIndexState;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.popSortUsrClick(Sender: TObject);
begin
  if not popSortUsr.Checked then begin
    popSortNR.Checked   := false;
    popSortTabN.Checked := false;
    popSortUsr.Checked  := true;
    SetIndexState;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.popFilterOffClick(Sender: TObject);
begin
  popFilterOff.Checked  := true;
  popFilterTabN.Checked := false;
  popFilterUsr.Checked  := false;
  cdsLog.Filter := '';
  cdsLog.Filtered := false;
  LabelFilterMsg.Caption := '';
  LabelCntRec.Caption := 'Записей: ' + IntToStr(cdsLog.RecordCount);
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.popFilterTabNClick(Sender: TObject);
var cTabN : string; cErrMsg : ShortString; cChar : string1;
    nLen, i : SmallInt; nTabN : integer;
begin
  cErrMsg := '';
  if InputQuery('Ввод табельного номера',
                    'Введите табельный н-р для фильтра', cTabN) then begin
    cTabN := Trim(cTabN);
    if cTabN = '' then begin
      popFilterOff.Checked  := true;
      popFilterTabN.Checked := false;
      popFilterUsr.Checked  := false;
      LabelFilterMsg.Caption := '';
      cdsLog.Filter := '';
      cdsLog.Filtered := false;
      Exit;
    end;
    nLen := Length(cTabN);
    if nLen > 5 then
      cErrMsg := 'У нас нет таких табельных номеров'
    else begin
      for i := 1 to nLen do begin
        cChar := cTabN[i];
        if (cChar < '0') or (cChar > '9') then begin
          cErrMsg := 'В табельном номере должны быть только цифры';
          Break;
        end;
      end;
    end;
    if cErrMsg = '' then begin
      nTabN := StrToInt(cTabN);
      if nTabN <= 0 then
        cErrMsg := 'Табельный номер должен быть положительным и не нулевым';
    end;
    if cErrMsg > '' then begin
      ShowMessage(cErrMsg);
      popFilterOff.Checked  := true;
      popFilterTabN.Checked := false;
      popFilterUsr.Checked  := false;
      LabelFilterMsg.Caption := '';
      cdsLog.Filter := '';
      cdsLog.Filtered := false;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(cdsLog.RecordCount); end
    else begin
      cdsLog.Filtered := false;
      cdsLog.Filter := 'TabN=' + cTabN;
      cdsLog.Filtered := true;
      popFilterOff.Checked  := false;
      popFilterTabN.Checked := true;
      popFilterUsr.Checked  := false;
      LabelFilterMsg.Caption := 'Фильтр ТабНр = ' + cTabN;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(cdsLog.RecordCount);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.popFilterUsrClick(Sender: TObject);
var cKdUsr : string; cErrMsg : ShortString; cChar : string1;
    nLen, i : SmallInt; nKdUsr : integer;
begin
  cErrMsg := '';
  if InputQuery('Ввод кода пользователя',
                    'Введите код пользователя для фильтра', cKdUsr) then begin
    cKdUsr := Trim(cKdUsr);
    if cKdUsr = '' then begin
      popFilterOff.Checked  := true;
      popFilterTabN.Checked := false;
      popFilterUsr.Checked  := false;
      LabelFilterMsg.Caption := '';
      cdsLog.Filter := '';
      cdsLog.Filtered := false;
      Exit;
    end;
    nLen := Length(cKdUsr);
    if nLen > 3 then
      cErrMsg := 'У нас нет таких кодов пользователей'
    else begin
      for i := 1 to nLen do begin
        cChar := cKdUsr[i];
        if (cChar < '0') or (cChar > '9') then begin
          cErrMsg := 'В коде пользователя должны быть только цифры';
          Break;
        end;
      end;
    end;
    if cErrMsg = '' then begin
      nKdUsr := StrToInt(cKdUsr);
      if nKdUsr < 0 then
        cErrMsg := 'Код пользователя должен быть положительным';
    end;
    if cErrMsg > '' then begin
      ShowMessage(cErrMsg);
      popFilterOff.Checked  := true;
      popFilterTabN.Checked := false;
      popFilterUsr.Checked  := false;
      LabelFilterMsg.Caption := '';
      cdsLog.Filter := '';
      cdsLog.Filtered := false;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(cdsLog.RecordCount); end
    else begin
      cdsLog.Filtered := false;
      cdsLog.Filter := 'KdUsr=' + cKdUsr;
      cdsLog.Filtered := true;
      popFilterOff.Checked  := false;
      popFilterTabN.Checked := false;
      popFilterUsr.Checked  := true;
      LabelFilterMsg.Caption := 'Фильтр КодПольз. = ' + cKdUsr;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(cdsLog.RecordCount);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then begin
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где нужно, пользуйтесь контекстными меню');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwLog.dsrcLogDataChange(Sender: TObject; Field: TField);
begin
  if not bByTabN and (cdsLog.State = dsBrowse) then begin
    if (not cdsLogTabN.IsNull) then
      LabelFIO.Caption := DmMain.TabN2FamIO(cdsLogTabN.AsInteger)  {z_Dm}
    else
      LabelFIO.Caption := '';
  end;
end;

procedure TFormShwLog.FormResize(Sender: TObject);
begin
  LabelCntRec.Left := bBtnClose.Left - LabelCntRec.Width - 5;
end;

end.
