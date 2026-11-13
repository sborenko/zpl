unit z_BnkLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Grids, DBGrids, Menus, StdCtrls, Buttons, DB, DBTables,
  ExtCtrls;

type
  TFormBnkLS = class(TForm)
    dbgrLS: TDBGrid;
    qryLS: TQuery;
    dsrcLS: TDataSource;
    qryLSNR: TIntegerField;
    qryLSTABN: TIntegerField;
    qryLSDTBEG: TDateTimeField;
    qryLSLICSCH: TStringField;
    qryLSKDBNK: TSmallintField;
    qryLSNOTES: TStringField;
    pop: TPopupMenu;
    popEdt: TMenuItem;
    popAdd: TMenuItem;
    popDel: TMenuItem;
    popHead: TMenuItem;
    updLS: TUpdateSQL;
    qryLSNmBnk: TStringField;
    popCloseLS: TMenuItem;
    qryLSSPB: TStringField;
    popAddSpB: TMenuItem;
    qryLSCLS: TStringField;
    popOpenLS: TMenuItem;
    PanelButtons: TPanel;
    chBoxSaveValues: TCheckBox;
    LabelMsg: TLabel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrLSEnter(Sender: TObject);
    procedure dbgrLSExit(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popEdtClick(Sender: TObject);
    procedure popDelClick(Sender: TObject);
    procedure popCloseLSClick(Sender: TObject);
    procedure dbgrLSDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popPopup(Sender: TObject);
    procedure popAddSpBClick(Sender: TObject);
    procedure popOpenLSClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    n_TabN : integer;
    d_OnDate : TDateTime;
    c_FamIO : ShortString;
    bOnlySpb, bVuborMode, b_WasUpdated : boolean;
    dSvDtBeg : TDateTime;
    nSvKdBnk : SmallInt;
    procedure OpenQryLS(nTabN : integer);
    procedure OpenQrySpecLS(nTabN : integer);
  public
    { Public declarations }
  end;

procedure ShowBnkLS(nTabN : integer; dOnDate : TDateTime; cFamIO : ShortString;
                                                    var bWasUpdated : boolean);
function GetBnkSpecLS(nTabN : integer; dOnDate : TDateTime;
                                    cFamIO : ShortString; var nKdBnk : SmallInt;
                                       var cNmBnk, cLS : ShortString;
                                           var bWasUpdated : boolean) : boolean;

const SECTION = 'z_BnkLS';

var
  FormBnkLS: TFormBnkLS;

implementation

uses a_Const, a_DM, z_Dm, z_Main, Z_eLS, z_UpiLS;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetBnkSpecLS(nTabN : integer; dOnDate : TDateTime;
                                    cFamIO : ShortString; var nKdBnk : SmallInt;
                                       var cNmBnk, cLS : ShortString;
                                           var bWasUpdated : boolean) : boolean;
begin
  Result := false;
  FormBnkLS := TFormBnkLS.Create(Application);
  with FormBnkLS do begin
    n_TabN  := nTabN;
    d_OnDate := dOnDate;
    c_FamIO := cFamIO;
    bOnlySpb   := true;
    bVuborMode := true;
    b_WasUpdated := false;
    Caption := 'ТабНр ' + IntToStr(nTabN) + ' ' + cFamIO +
                                                  ' (только "СпецСчета")';
    chBoxSaveValues.Visible := false;
    LabelMsg.Caption := ' Выбирается запись, актуальная на дату ведомости (' +
                        DateToStr(dOnDate) + ')';
    LabelMsg.Visible := true;
    bBtnCancel.Caption := 'Отказ';
    //popCloseLS.Visible := false;
    OpenQrySpecLS(nTabN);
    if (nKdBnk > 0) and (cLS > '') then
      qryLs.Locate('KdBnk;LicSch', VarArrayOf([nKdBnk, cLS]), [])
    else if nKdBnk > 0 then
      qryLs.Locate('KdBnk', nKdBnk, []);
    if ShowModal = mrOk then begin
      nKdBnk := qryLsKdBnk.AsInteger;
      cNmBnk := qryLsNmBnk.AsString;
      cLS    := qryLsLicSch.AsString;
      Result := true;
      bWasUpdated := b_WasUpdated;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShowBnkLS(nTabN : integer; dOnDate : TDateTime; cFamIO : ShortString;
                                                     var bWasUpdated : boolean);
begin
  FormBnkLS := TFormBnkLS.Create(Application);
  with FormBnkLS do begin
    n_TabN  := nTabN;
    d_OnDate := dOnDate;
    c_FamIO := cFamIO;
    bOnlySpb := false;
    bVuborMode := false;
    b_WasUpdated := false;
    bBtnOk.Visible := false;
    Caption := 'ТабНр ' + IntToStr(nTabN) + ' ' + cFamIO;
    OpenQryLS(nTabN);
    ShowModal;
    bWasUpdated := b_WasUpdated;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.OpenQryLS(nTabN: integer);
begin
  with qryLS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select ls.* from Z_BankiLS ls ' +
            ' where ls.TabN = :nTabN order by ls.DtBeg, ls.NR');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.OpenQrySpecLS(nTabN: integer);
begin
  with qryLS do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select ls.* from Z_BankiLS ls ' +
            ' where ls.TabN = :nTabN and SPB = "Y" order by ls.DtBeg, ls.NR');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 205);
    Width  := ReadInteger(SECTION, 'wW', 460);
    chBoxSaveValues.Checked := false; //ReadBool(SECTION, 'bSvVals', false);
    dSvDtBeg := ReadDate(SECTION, 'dSvDtBeg', Date);
    nSvKdBnk := ReadInteger(SECTION, 'nSvKdBnk', 0);
    Free;
  end;
  if FileExists(cDirVids + 'z_BnkLs1.vid') then
    dbgrLS.Columns.LoadFromFile(cDirVids + 'z_BnkLs1.vid');
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and (qryLsCLS.AsBoolean) then begin
    ModalResult := mrNone;
    dbgrLs.SetFocus;
    ShowMessage('Нельзя выбирать закрытые счета');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrLS.Columns.SaveToFile(cDirVids + 'z_BnkLs1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bSvVals', chBoxSaveValues.Checked);
    WriteDate(SECTION, 'dSvDtBeg', dSvDtBeg);
    WriteInteger(SECTION, 'nSvKdBnk', nSvKdBnk);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.dbgrLSEnter(Sender: TObject);
begin
  dbgrLS.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.dbgrLSExit(Sender: TObject);
begin
  dbgrLS.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.popPopup(Sender: TObject);
begin
  popEdt.Enabled := qryLs.RecordCount > 0;
  popDel.Enabled := popEdt.Enabled;
  popAdd.Enabled := not bOnlySpb;
  popCloseLS.Enabled := popEdt.Enabled and not qryLsLicSch.IsNull and
              (qryLsLicSch.AsString > '') and not (qryLsCLS.AsBoolean);
  popOpenLS.Enabled := popEdt.Enabled and qryLsCLS.AsBoolean;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.popAddClick(Sender: TObject);
var nSvNR : integer; bSpbLS, bCloseLS : boolean;
begin
  with qryLS do begin
    bSpbLS   := false;
    bCloseLS := false;
    nSvNR := qryLSNR.AsInteger;
    Append;
    qryLSTabN.AsInteger := n_TabN;
    qryLSDtBeg.AsDateTime := Date;
    if chBoxSaveValues.Checked then begin
      qryLSDtBeg.AsDateTime := dSvDtBeg;
      if nSvKdBnk > 0 then
        qryLSKdBnk.AsInteger := nSvKdBnk;
    end;
    if AddEdtLS(c_FamIO + ' [Новая запись]', bSpbLS, bCloseLS) {Z_ELS}
                                                                      then begin
      Application.ProcessMessages;
      dSvDtBeg := qryLSDtBeg.AsDateTime;
      nSvKdBnk := qryLSKdBnk.AsInteger;
      Post;
      b_WasUpdated := true;
      Form_Dm.DbMain.ApplyUpdates([qryLS]);
      DmMain.CreOpenCdsBankiLsLU(d_OnDate);
      Close;
      Open;
      Last; end
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.popAddSpBClick(Sender: TObject);
var nSvNR : integer; bSpbLS, bCloseLS : boolean;
begin
  with qryLS do begin
    bSpbLS   := true;
    bCloseLS := false;
    nSvNR := qryLSNR.AsInteger;
    Append;
    qryLSTabN.AsInteger := n_TabN;
    qryLSDtBeg.AsDateTime := Date;
    qryLsSpB.AsString := 'Y';
    if chBoxSaveValues.Checked then begin
      qryLSDtBeg.AsDateTime := dSvDtBeg;
      if nSvKdBnk > 0 then
        qryLSKdBnk.AsInteger := nSvKdBnk;
    end;
    if AddEdtLS(c_FamIO + ' [Новая запись]', bSpbLS, bCloseLS) {Z_ELS}
                                                                      then begin
      Application.ProcessMessages;
      dSvDtBeg := qryLSDtBeg.AsDateTime;
      nSvKdBnk := qryLSKdBnk.AsInteger;
      Post;
      b_WasUpdated := true;
      Form_Dm.DbMain.ApplyUpdates([qryLS]);
      DmMain.CreOpenCdsBankiLsLU(d_OnDate);
      Close;
      Open;
      Last; end
    else begin
      Cancel;
      if nSvNR > 0 then
        Locate('NR', nSvNR, []);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.popEdtClick(Sender: TObject);
var bSpbLS, bCloseLS : boolean;  nSvNR : integer;
begin
  with qryLS do begin
    bSpbLS   := qryLsSpB.AsBoolean;
    bCloseLS := not qryLsCls.IsNull and qryLsCls.AsBoolean;
    nSvNR    := qryLsNR.AsInteger;
    Edit;
    if AddEdtLS(c_FamIO + ' [Редактирование записи]', bSpbLS, bCloseLS) {Z_eLS}
                                                                      then begin
      Application.ProcessMessages;
      // dSvDtBeg := qryLSDtBeg.AsDateTime;
      // nSvKdBnk := qryLSKdBnk.AsInteger;
      Post;
      b_WasUpdated := true;
      Form_Dm.DbMain.ApplyUpdates([qryLS]);
      DmMain.CreOpenCdsBankiLsLU(d_OnDate);
      Close;
      Open;
      Locate('NR', nSvNR, []); end
    else
      Cancel;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.popDelClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:',
                             mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    qryLs.Delete;
    Form_Dm.DbMain.ApplyUpdates([qryLS]);
    b_WasUpdated := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.popCloseLSClick(Sender: TObject);
begin
  with qryLS do begin
    if MessageDlg('Закрыть текущий счет?:',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

      Edit;
      qryLSCls.AsString := 'Y';
      Post;
      Form_Dm.DbMain.ApplyUpdates([qryLS]);
      DmMain.CreOpenCdsBankiLsLU(d_OnDate);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.popOpenLSClick(Sender: TObject);
begin
  with qryLS do begin
    if MessageDlg('Отрыть текущий счет?:',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

      Edit;
      qryLSCls.AsString := '';
      Post;
      Form_Dm.DbMain.ApplyUpdates([qryLS]);
      DmMain.CreOpenCdsBankiLsLU(d_OnDate);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.dbgrLSDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
//var cFldNm : ShortString;
begin
{
  cFldNm := UpperCase(Column.FieldName);
  with dbgrLS.Canvas do begin
    if not (gdFocused in State) then begin
      if (qryLSSpB.AsBoolean) then
        Font.Color := clFuchsia;
      if (qryLsCls.AsBoolean) then
        Brush.Color := clBtnFace;
    end;
  end;
  dbgrLS.DefaultDrawColumnCell(Rect, DataCol, Column, State);
}
end;
//------------------------------------------------------------------------------
procedure TFormBnkLS.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>' + #13#10 +
                'Где  нужно,  пользуйтесь  контекстными  меню');
end;

end.
