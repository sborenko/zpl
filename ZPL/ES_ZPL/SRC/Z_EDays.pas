unit Z_EDays;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, Menus,
  IniFiles, DBTables, DBCtrls;

type
  TFormEDays = class(TForm)
    dsrcEDays: TDataSource;
    dbgrEDays: TDBGrid;
    PanelRight: TPanel;
    PanelRB: TPanel;
    bBtnCancel: TBitBtn;
    popMnu: TPopupMenu;
    popMnuEdt: TMenuItem;
    popMnuAdd: TMenuItem;
    popMnuDel: TMenuItem;
    qryTmp: TQuery;
    PanelMsg: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sBtnCalendar: TSpeedButton;
    dbNavEDays: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popMnuEdtClick(Sender: TObject);
    procedure popMnuAddClick(Sender: TObject);
    procedure popMnuDelClick(Sender: TObject);
    procedure dbgrEDaysDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popMnuPopup(Sender: TObject);
    procedure PanelRightResize(Sender: TObject);
    procedure sBtnCalendarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure EDaysShowModal;

const SECTION = 'Z_EDays';

var
  FormEDays: TFormEDays;

implementation

uses A_Const, A_DM, Z_DM, Z_Main, Z_EEDay;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure EDaysShowModal;
begin
  FormEDays := TFormEDays.Create(Application);
  with FormEDays do begin
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDays.FormCreate(Sender: TObject);
var nSvNr : integer;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 430);
    Width  := ReadInteger(SECTION, 'wW', 400);
    nSvNr  := ReadInteger(SECTION, 'NR', 0);
    Free;
  end;
  Caption := 'Нестандартные дни';
  if not dsrcEDays.DataSet.Active then
    dsrcEDays.DataSet.Open;
  if nSvNr <> 0 then
    dsrcEDays.DataSet.Locate('NR', nSvNr, []);
  if FileExists(cDirVids + 'z_EDay3.vid') then
    dbgrEDays.Columns.LoadFromFile(cDirVids + 'z_EDay3.vid');
end;
//------------------------------------------------------------------------------
procedure TFormEDays.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrEDays.Columns.SaveToFile(cDirVids + 'z_EDay3.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'NR', dsrcEDays.DataSet.FieldByName('NR').AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDays.popMnuPopup(Sender: TObject);
begin
  popMnuEdt.Enabled := dsrcEDays.DataSet.RecordCount <> 0;
  popMnuDel.Enabled := popMnuEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormEDays.popMnuEdtClick(Sender: TObject);
var nSvNr : integer; dEDate, dOldEDate : TDateTime;
    nCntHours, nOldCntHours : double;
    bIsOtp, bIsBln, bOldIsOtp, bOldIsBln : boolean;
    cNotes, cLogMsg : ShortString;
begin
  with dsrcEDays.DataSet do begin
    dEDate := FieldByName('E_Day').AsDateTime;
    dOldEDate := dEDate;
    nSvNr := FieldByName('NR').AsInteger;
    nCntHours := FieldByName('Rab_Chas').AsFloat;
    nOldCntHours := nCntHours;
    cNotes := FieldByName('Primechan').AsString;
    bIsOtp := FieldByName('XOtp').AsString = 'Y';
    bIsBln := FieldByName('XBln').AsString = 'Y';
    bOldIsOtp := bIsOtp;
    bOldIsBln := bIsBln;
  end;
  if EdtEDay(nSvNr, dEDate, nCntHours, cNotes,
                                       bIsOtp, bIsBln) {Z_EEDay} then begin
    cLogMsg := 'Редакт. даты ' + DateToStr(dOldEDate) + ' на ' +
                                  DateToStr(dEDate) + ', часы с ' +
                                  FloatToStr(nOldCntHours) + ' на ' +
                                  FloatToStr(nCntHours);
    if bIsOtp <> bOldIsOtp then begin
      cLogMsg := cLogMsg + ', XOtp с ';
      if bOldIsOtp then
        cLogMsg := cLogMsg + 'Y на '
      else
        cLogMsg := cLogMsg + 'N на ';
      if bIsOtp then
        cLogMsg := cLogMsg + 'Y'
      else
        cLogMsg := cLogMsg + 'N';
    end;
    if bIsBln <> bOldIsBln then begin
      cLogMsg := cLogMsg + ', XBln с ';
      if bOldIsBln then
        cLogMsg := cLogMsg + 'Y на '
      else
        cLogMsg := cLogMsg + 'N на ';
      if bIsBln then
        cLogMsg := cLogMsg + 'Y'
      else
        cLogMsg := cLogMsg + 'N';
    end;
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Update E_Days set E_Day = :dEDate, ' +
              ' Rab_Chas = :nCntHours, Primechan = :cNotes, ' +
              ' XOtp = :cXOtp, XBln = :cXBln ' +
              ' where NR = :nSvNr');
      ParamByName('dEDate').AsDateTime := dEDate;
      ParamByName('nCntHours').AsFloat := nCntHours;
      ParamByName('cNotes').AsString := cNotes;
      if bIsOtp then
        ParamByName('cXOtp').AsString := 'Y'
      else
        ParamByName('cXOtp').AsString := '';
      if bIsBln then
        ParamByName('cXBln').AsString := 'Y'
      else
        ParamByName('cXBln').AsString := '';
      ParamByName('nSvNr').AsInteger := nSvNr;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    DmMain.AddLog(Now, 0, 'Редакт. E_Days', gc_AppNmUsr, 'E_Days', cLogMsg);
    with dsrcEDays.DataSet do begin
      Close;
      Open;
      Locate('NR', nSvNr, []);
    end;
    DmMain.CreOpenCdsEDays;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDays.popMnuAddClick(Sender: TObject);
var dEDate : TDateTime; nCntHours : double;
    cNotes, cLogMsg : ShortString;
    bIsOtp, bIsBln : boolean;
begin
  if AddEDay(dEDate, nCntHours, cNotes, bIsOtp, bIsBln) {Z_EAEDay} then begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Insert into E_Days (E_Day, Rab_Chas, Primechan, XOtp, XBln) ' +
              ' values (:dEDate, :nCntHours, :cNotes, :cXOtp, :cXBln)');
      ParamByName('dEDate').AsDateTime:= dEDate;
      ParamByName('nCntHours').AsFloat := nCntHours;
      ParamByName('cNotes').AsString := cNotes;
      cLogMsg := 'Ввод даты ' + DateToStr(dEDate) +
                                  ', часов ' + FloatToStr(nCntHours);
      if bIsOtp then begin
        ParamByName('cXOtp').AsString := 'Y';
        cLogMsg := cLogMsg + ', XOtp = Y'; end
      else begin
        ParamByName('cXOtp').AsString := '';
        cLogMsg := cLogMsg + ', XOtp = N';
      end;
      if bIsBln then begin
        ParamByName('cXBln').AsString := 'Y';
        cLogMsg := cLogMsg + ', XBln = Y'; end
      else begin
        ParamByName('cXBln').AsString := '';
        cLogMsg := cLogMsg + ', XBln = N';
      end;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    DmMain.AddLog(Now, 0, 'Ввод E_Days', gc_AppNmUsr, 'E_Days', cLogMsg);
    with dsrcEDays.DataSet do begin
      Close;
      Open;
      Locate('E_Day', dEDate, []);
    end;
    DmMain.CreOpenCdsEDays;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDays.popMnuDelClick(Sender: TObject);
var nSvNr, nDelNR : integer; bEof : boolean;
    cLogMsg, cDelDate : ShortString;
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                            mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    with dsrcEDays.DataSet do begin
      bEof := false;
      nSvNr := 0;
      cDelDate := FieldByName('E_Day').AsString;
      nDelNr := FieldByName('NR').AsInteger;
      DisableControls;
      Next;
      if Eof then
        bEof := true
      else
        nSvNr := FieldByName('NR').AsInteger;
    end;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      SQL.Add('Delete from E_Days ' +
              ' where NR = :nDelNr');
      ParamByName('nDelNr').AsInteger := nDelNr;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    cLogMsg := 'Удаление даты ' + cDelDate;
    DmMain.AddLog(Now, 0, 'Удал. E_Days', gc_AppNmUsr, 'E_Days', cLogMsg);
    with dsrcEDays.DataSet do begin
      Close;
      Open;
      if bEof then
        Last
      else
        Locate('NR', nSvNr, []);
      EnableControls;
    end;
    DmMain.CreOpenCdsEDays;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEDays.dbgrEDaysDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrEDays.Canvas do begin
    if not (gdFocused in State) then begin
      if dsrcEDays.DataSet.FieldByName('E_Day').AsDateTime =
                                     StrToDate('01-01-1901') then begin
        Font.Color := clRed;
        Font.Style := [fsBold]; end
      else if dsrcEDays.DataSet.FieldByName('Rab_Chas').AsFloat = 0 then begin
        Font.Color := clMaroon;
        Font.Style := []; end
      else begin
        Font.Color := clNavy;
        Font.Style := [];
      end;
      if UpperCase(Column.FieldName) = 'RAB_CHAS' then
        Font.Style := [fsBold];
    end;
  end;
  dbgrEDays.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormEDays.PanelRightResize(Sender: TObject);
begin
  PanelMsg.Top :=
         Round((PanelRight.Height - PanelMsg.Height) / 2 - PanelRB.Height) + 30;
end;
//------------------------------------------------------------------------------
procedure TFormEDays.sBtnCalendarClick(Sender: TObject);
begin
  FormZpMain.sBtnCalendar.Click;
end;

end.
