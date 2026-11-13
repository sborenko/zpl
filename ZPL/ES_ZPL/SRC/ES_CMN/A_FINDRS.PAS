unit A_FindRS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, Db, DBTables;

type
  TFormFindRSch = class(TForm)
    qryRSch: TQuery;
    dsrcRSch: TDataSource;
    dbgrRSch: TDBGrid;
    PanelBottom: TPanel;
    PanelBR: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    qryRSchNMWHO: TStringField;
    qryRSchRPA: TStringField;
    qryRSchKDWHO: TSmallintField;
    qryRSchKDSBU: TSmallintField;
    qryRSchWPA: TSmallintField;
    qryRSchKDRSCH: TSmallintField;
    qryRSchNMSCH: TStringField;
    qryRSchRSCH: TStringField;
    qryRSchMFO: TStringField;
    qryRSchOKPO: TStringField;
    qryRSchNMBANK: TStringField;
    qryRSchLDTOPER: TDateTimeField;
    qryRSchRLDTOPER: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrRSchDblClick(Sender: TObject);
    procedure dbgrRSchDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    d_LDtOper : TDateTime;
  public
    { Public declarations }
  end;

function PoiskRSch(var nKdWho, nKdRSch : SmallInt; var cNmSch, cRSch,
            cMfo, cOkpo, cNmBank : ShortString; dLDtOper : TDateTime) : boolean;

var
  FormFindRSch: TFormFindRSch;

const SECTION = 'A_FindRS';

implementation

uses A_Const, A_DM;

{$R *.DFM}

//------------------------------------------------------------------------------
function PoiskRSch(var nKdWho, nKdRSch : SmallInt; var cNmSch, cRSch,
            cMfo, cOkpo, cNmBank : ShortString; dLDtOper : TDateTime) : boolean;
var cSQL : string;
begin
  Result := false;
  FormFindRSch := TFormFindRSch.Create(Application);
  with FormFindRSch do begin
    d_LDtOper := dLDtOper;
    cSQL := 'Select w.NmWho, w.PA as WPA, rs.ShPPdr as RPA, rs.KdWho, ' +
            ' rs.KdSbu, rs.KdRSch, rs.NmSch, ' +
            ' rs.RSch, rs.Mfo, rs.Okpo, rs.NmBank, w.LDtOper, ' +
            ' rs.LDtOper as RLDtOper from Kd_RSch rs ' +
            ' Left Outer Join Kd_Who w on w.KdWho = rs.KdWho ' +
            ' where (rs.KdRSch >= 0) ';
    if cNmSch <> '' then
      cSQL := cSQL + ' and (upper(rs.NmSch) containing :cNmSch)';
    if cRSch <> '' then
      cSQL := cSQL + ' and (upper(rs.RSch) containing :cRSch)';
    if cMfo <> '' then
      cSQL := cSQL + ' and (upper(rs.Mfo) containing :cMfo)';
    if cOkpo <> '' then
      cSQL := cSQL + ' and (upper(rs.Okpo) containing :cOkpo)';
    if cNmBank <> '' then
      cSQL := cSQL + ' and (upper(rs.NmBank) containing :cNmBank)';
    cSQL := cSQL + ' order by w.NmWho, rs.NmSch, rs.RSch, rs.Mfo, rs.Okpo';
    qryRSch.Close;
    qryRSch.SQL.Clear;
    qryRSch.DataBaseName := CESMAIN;
    qryRSch.SQL.Add(cSQL);
    if cNmSch <> '' then
      qryRSch.ParamByName('cNmSch').asString := AnsiUpperCase(cNmSch);
    if cRSch <> '' then
      qryRSch.ParamByName('cRSch').asString := AnsiUpperCase(cRSch);
    if cMfo <> '' then
      qryRSch.ParamByName('cMfo').asString := AnsiUpperCase(cMfo);
    if cOkpo <> '' then
      qryRSch.ParamByName('cOkpo').asString := AnsiUpperCase(cOkpo);
    if cNmBank <> '' then
      qryRSch.ParamByName('cNmBank').asString := AnsiUpperCase(cNmBank);
    qryRSch.Open;
    if qryRSch.RecordCount = 0 then begin
        MessageDlg('Не найдены в спр-ке "Расчётные счета" записи по заданным условиям.',
                   mtInformation, [mbOk], 0); end
    else begin
      Caption := 'Результаты поиска расчётного счёта';
      Label1.Caption := 'Записей ' +
                        IntToStr(qryRSch.RecordCount) + '.   ' +
                        'Выберите нужную двойным щелчком мышки ' +
                        'или кнопкой "Выбор".';
      if ShowModal = mrOk then begin
        Result := true;
        cOkpo   := qryRSch.FieldByName('OKPO').AsString;
        nKdWho  := qryRSch.FieldByName('KdWho').AsInteger;
        nKdRSch := qryRSch.FieldByName('KdRSch').AsInteger;
      end;
    end;
    qryRSch.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFindRSch.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 250);
    Width  := ReadInteger(SECTION, 'wW', 600);
    Height := ReadInteger(SECTION, 'wH', 390);
    Free;
    if FileExists(cDirVids + 'FndRs03.vid') then
      dbgrRSch.Columns.LoadFromFile(cDirVids + 'FndRs03.vid');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFindRSch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'wH', Height);
    Free;
  end;
  dbgrRSch.Columns.SaveToFile(cDirVids + 'FndRs03.vid');
end;
//------------------------------------------------------------------------------
procedure TFormFindRSch.dbgrRSchDblClick(Sender: TObject);
begin
  if (qryRSch.FieldByName('LDtOper').AsDateTime < d_LDtOper) then
    ShowMessage('Эта запись находится за пределами временнОй' + #10#13 +
                                         '"глубины" выборки клиентов')
  else
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormFindRSch.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and
           (qryRSch.FieldByName('LDtOper').AsDateTime < d_LDtOper) then begin
    ShowMessage('Эта запись находится за пределами временнОй' + #10#13 +
                                         '"глубины" выборки клиентов');
    ModalResult := mrNone;
    CanClose := false;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFindRSch.dbgrRSchDrawColumnCell(Sender: TObject;
                         const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrRSch.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if (dsrcRSch.DataSet.FieldByName('RPA').AsString > '') then
        Brush.Color := clLime;  // это не тэ (ПА - признак "архивного" счёта)
      //else
      //  Font.Color := clWindowText;
    end;
    if (dsrcRSch.DataSet.FieldByName('LDtOper').AsDateTime >= d_LDtOper) then
      Font.Style := [fsBold];
    if (cFldNm = 'RSCH') or (cFldNm = 'OKPO') then begin
      Brush.Color := $00B4FCE2;
      Font.Style := [fsBold];
    end;
  end;
  dbgrRSch.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
