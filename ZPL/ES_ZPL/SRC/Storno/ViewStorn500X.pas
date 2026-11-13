unit ViewStorn500X;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, DB, ExtCtrls, Grids, DBGrids, DBTables,
  DBClient, Menus,
  CustDateUtils;

type
  TVieStorn500X = class(TForm)
    panelButtons: TPanel;
    btnSetStorn: TSpeedButton;
    btnDelStorn: TSpeedButton;
    BtnOk: TBitBtn;
    btnClose: TBitBtn;
    PopStorno: TPopupMenu;
    NStorno: TMenuItem;
    NUnstorno: TMenuItem;
    DBGrStorno: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrEnter(Sender: TObject);
    procedure dbgrExit(Sender: TObject);
    procedure dbgrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PopStornoPopup(Sender: TObject);
    procedure StornoClick(Sender: TObject);
    procedure UnstornoClick(Sender: TObject);
    procedure OtklDSrcDataChange(Sender: TObject; Field: TField);
  private
    procedure SetStorno;
    procedure WithdrawStorno;
  public
    class function Run(TabN: integer): boolean;
  end;

const SECTION = 'z_St5002';
const VIEW_FILE = 'storn500x.vid';

implementation

uses A_Const, A_Lib, Z_DM, DModStorn500X, FormStorn500X;

{$R *.dfm}

//------------------------------------------------------------------------------
class function TVieStorn500X.Run(TabN: integer): boolean;
var
  BegYear, BegMnth, EndYear, EndMnth, DummyWord: word;
begin
  with TVieStorn500X.Create(Application) do begin
    // DataStorn500X.LoadData(TabN);
    DataStorn500X.NewLoad(TabN);

    DecodeDate(DataStorn500X.StornScope.Start, BegYear , BegMnth, DummyWord);
    DecodeDate(DataStorn500X.StornScope.Finish, EndYear , EndMnth, DummyWord);

    Caption := 'Сторнирование неоплачиваемых видов (' +
      MesRus(BegMnth) + ' ' + IntToStr(BegYear) + ' - ' +
      MesRus(EndMnth) + ' ' + IntToStr(EndYear) + ')';

    if not DataStorn500X.StornIsAvailable then begin
      ShowMessage('Нет записей видов: ' + DataStorn500X.VidN500X + ' по Таб. Н-ру ' + IntToStr(TabN)
        + ' за период ' + MesRus(BegMnth) + ' ' + IntToStr(BegYear)
        + ' - ' + MesRus(EndMnth) + ' ' + IntToStr(EndYear));
      Result := false;
    end else
      Result := ShowModal = mrOk;

    Free;
  end; {with}
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.FormCreate(Sender: TObject);
begin
  DataStorn500X := TDataStorn500X.Create(Self);

  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 250);
    Width  := ReadInteger(SECTION, 'wW', 560);
    Free;
  end;

  if FileExists(cDirVids + VIEW_FILE) then
    dbgrStorno.Columns.LoadFromFile(cDirVids + VIEW_FILE);
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
    DataStorn500X.SaveResult;

  dbgrStorno.Columns.SaveToFile(cDirVids + VIEW_FILE);

  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.SetStorno;
begin
  TFrmStorn500X.Run;
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.WithdrawStorno;
begin
  if MessageDlg('Отменить сторнирование текущей записи?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DataStorn500X.WithdrawStorno;
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.dbgrEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.dbgrExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.dbgrDrawColumnCell(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Offset: integer;
  Text: ShortString;
  Year, Mnth, DummyWord: word;
begin
  if dbgrStorno.DataSource.DataSet.FieldByName('Storn').AsString = 'Y' then begin
    with dbgrStorno.Canvas do begin
      if gdFocused in State then begin
        Font.Color := clHighlightText;
        Font.Style := [];
      end else begin
        Font.Color := clGray {clTeal};
        Font.Style := [{fsStrikeOut}];
      end;
    end; {with}
  end;
  if (UpperCase(Column.FieldName) = 'DTPROC') or
      (UpperCase(Column.FieldName) = 'ZAMESGOD') then begin
    Offset := (Rect.Bottom - Rect.Top - 1 - Abs(Font.Height)) div 2;

    Text := '';
    DecodeDate(Column.Field.AsDateTime, Year, Mnth, DummyWord);
    if Mnth < 10 then
      Text := '0';
    Text := Text + IntToStr(Mnth) + '-' + IntToStr(Year);
    DBGrStorno.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + Offset, Text);
  end else
    dbgrStorno.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.StornoClick(Sender: TObject);
begin
  SetStorno;
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.UnstornoClick(Sender: TObject);
begin
  WithdrawStorno;
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.PopStornoPopup(Sender: TObject);
begin
  NUnstorno.Enabled :=
    dbgrStorno.DataSource.DataSet.FieldByName('Storn').AsString = 'Y';

  NStorno.Enabled := not nUnstorno.Enabled;
end;

//------------------------------------------------------------------------------
procedure TVieStorn500X.OtklDSrcDataChange(Sender: TObject; Field: TField);
begin
  BtnDelStorn.Enabled :=
    (Sender as TDataSource).DataSet.FieldByName('Storn').AsString = 'Y';

  BtnSetStorn.Enabled := not BtnDelStorn.Enabled;
end;

end.
