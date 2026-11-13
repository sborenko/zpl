unit a_UPoz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Menus, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFormUPoz = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dbgrUPoz: TDBGrid;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    sBtnPrt: TSpeedButton;
    bBtnOk: TBitBtn;
    procedure popPopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popEdtClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure dbgrUPozDblClick(Sender: TObject);
    procedure dbgrUPozEnter(Sender: TObject);
    procedure dbgrUPozExit(Sender: TObject);
  private
    { Private declarations }
    nSvKdUPoz : SmallInt;
    bVuborMode : boolean;
  public
    { Public declarations }
  end;

procedure ShowUPoz(nKdUPoz : SmallInt);
function GetUPoz(var nKdUPoz : SmallInt; var cNmUPoz : ShortString) : boolean;
function VuborUPoz(var nKdUPoz : SmallInt; var cNmUPoz, cSchet, cSchetKazn,
                              cB_Schet, cZ_schet, cF_Schet, cPSmetu, cPLimita,
                                       cPPlana, cNmKfk : ShortString) : boolean;
function CheckUPoz(var nKdUPoz : SmallInt; var cNmUPoz : ShortString) : boolean;


const SECTION = 'a_UPoz';

var
  FormUPoz: TFormUPoz;

implementation

uses a_Const, a_DM, a_EUPoz;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowUPoz(nKdUPoz : SmallInt);
begin
  FormUPoz := TFormUPoz.Create(Application);
  with FormUPoz do begin
    Caption := 'Коды учётных позиций';
    bVuborMode := false;
    bBtnOk.Visible := false;
    bBtnCancel.Caption := 'Закрыть';
    if not Form_Dm.qryUpoz.Active then
      Form_Dm.qryUpoz.Open;
    if nSvKdUPoz <> 0 then
      Form_Dm.qryUpoz.Locate('KPr', nSvKdUPoz, []);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function CheckUPoz(var nKdUPoz : SmallInt; var cNmUPoz : ShortString) : boolean;
//var nErrCode : integer;
begin
  Result := false;
  FormUPoz := TFormUPoz.Create(Application);
  with FormUPoz do begin
    if not Form_Dm.qryUpoz.Active then
      Form_Dm.qryUpoz.Open;
    if Form_Dm.qryUpoz.Locate('KPr', nKdUPoz, []) then begin
      Result := true;
      nKdUPoz := Form_Dm.qryUpoz.FieldByName('KPr').AsInteger;
      cNmUPoz := Form_Dm.qryUpoz.FieldByName('SpecNaim').AsString; end
    else begin
      Caption := 'Выберите правильную учётную позицию';
      bVuborMode := true;
      bBtnOk.Visible := true;
      bBtnCancel.Caption := 'Отказ';
      if ShowModal = mrOk then begin
        Result := true;
        nKdUPoz := Form_Dm.qryUpoz.FieldByName('KPr').AsInteger;
        cNmUPoz := Form_Dm.qryUpoz.FieldByName('SpecNaim').AsString;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function VuborUPoz(var nKdUPoz : SmallInt; var cNmUPoz, cSchet, cSchetKazn,
                              cB_Schet, cZ_schet, cF_Schet, cPSmetu, cPLimita,
                                       cPPlana, cNmKfk : ShortString) : boolean;
begin
  Result     := false;
  cNmUPoz    := '';
  cSchet     := '';
  cSchetKazn := '';
  cB_Schet   := '';
  cZ_schet   := '';
  cF_Schet   := '';
  cPSmetu    := '';
  cPLimita   := '';
  cPPlana    := '';
  cNmKfk     := '';
  FormUPoz := TFormUPoz.Create(Application);
  with FormUPoz do begin
    Caption := 'Выбор учётной позиции';
    bVuborMode := true;
    bBtnOk.Visible := true;
    bBtnCancel.Caption := 'Отказ';
    with Form_Dm.qryUpoz do begin
      if not Active then
        Open;
      if nKdUPoz <> 0 then
        Locate('KPr', nKdUPoz, [])
      else if nSvKdUPoz <> 0 then
        Locate('KPr', nSvKdUPoz, []);
      if ShowModal = mrOk then begin
        Result := true;
        nKdUPoz    := FieldByName('KPr').AsInteger;
        cNmUPoz    := FieldByName('SpecNaim').AsString;
        cSchet     := FieldByName('Schet').AsString;
        cSchetKazn := FieldByName('SchetKazn').AsString;
        cB_Schet   := FieldByName('B_Schet').AsString;
        cZ_Schet   := FieldByName('Z_Schet').AsString;
        cF_Schet   := FieldByName('F_Schet').AsString;
        cPSmetu    := FieldByName('pSmetu').AsString;
        cPLimita   := FieldByName('pLimita').AsString;
        cPPlana    := FieldByName('pPlana').AsString;
        cNmKfk     := FieldByName('NmKfk').AsString;
      end;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetUPoz(var nKdUPoz : SmallInt; var cNmUPoz : ShortString) : boolean;
begin
  Result := false;
  cNmUPoz := '';
  FormUPoz := TFormUPoz.Create(Application);
  with FormUPoz do begin
    Caption := 'Коды учётных позиций';
    bVuborMode := true;
    bBtnOk.Visible := true;
    bBtnCancel.Caption := 'Отказ';
    if not Form_Dm.qryUpoz.Active then
      Form_Dm.qryUpoz.Open;
    if nKdUPoz <> 0 then
      Form_Dm.qryUpoz.Locate('KPr', nKdUPoz, [])
    else if nSvKdUPoz <> 0 then
      Form_Dm.qryUpoz.Locate('KPr', nSvKdUPoz, []);
    if ShowModal = mrOk then begin
      Result := true;
      nKdUPoz := Form_Dm.qryUpoz.FieldByName('KPr').AsInteger;
      cNmUPoz := Form_Dm.qryUpoz.FieldByName('SpecNaim').AsString;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Width  := ReadInteger(SECTION, 'wW', 675);
    Height := ReadInteger(SECTION, 'wH', 553);
    nSvKdUPoz := ReadInteger(SECTION, 'SvKdUP', 0);
    Free;
  end;
  if FileExists(cDirVids + 'GrUPoz01.vid') then
    dbgrUPoz.Columns.LoadFromFile(cDirVids + 'GrUPoz01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrUPoz.Columns.SaveToFile(cDirVids + 'GrUPoz01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'wH', Height);
    if Form_Dm.qryUpoz.Active then
      WriteInteger(SECTION, 'SvKdUP',
                             Form_Dm.qryUpoz.FieldByName('KPr').AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.popPopup(Sender: TObject);
begin
  popEdt.Enabled := dbgrUPoz.DataSource.DataSet.Active and
                      (dbgrUPoz.DataSource.DataSet.RecordCount <> 0);
  popDel.Enabled := popEdt.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.popEdtClick(Sender: TObject);
begin
  with dbgrUPoz.DataSource.DataSet do begin
    Edit;
    if EAUPoz {a_EUPoz} then
      Post
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.popAddClick(Sender: TObject);
var nSvNR : integer;
begin
  with dbgrUPoz.DataSource.DataSet do begin
    nSvNR := FieldByName('NR').AsInteger;
    Append;
    if EAUPoz {a_EUPoz} then
      Post
    else begin
      Cancel;
      Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.sBtnPrtClick(Sender: TObject);
begin
  ShowMessage('Sorry... Не готово');
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.popDelClick(Sender: TObject);
begin
  // Сделать проверку ссылочной целостности !!!!    TYTYTYT
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                                            [mbYes, mbNo], 0) = mrYes then
    dbgrUPoz.DataSource.DataSet.Delete;
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.dbgrUPozDblClick(Sender: TObject);
begin
  if bVuborMode and (dbgrUPoz.DataSource.DataSet.RecordCount <> 0) then
    ModalResult := mrOk
  else if not bVuborMode and (dbgrUPoz.DataSource.DataSet.RecordCount <> 0) then
    popEdt.Click;
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.dbgrUPozEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormUPoz.dbgrUPozExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
