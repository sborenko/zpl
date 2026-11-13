unit Z_UpiLS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, IniFiles, DB, DBTables, Menus,
  Buttons, ExtCtrls, StdCtrls, DBCtrls, DBClient, ComCtrls, Provider;

type
  TFormUpiLS = class(TForm)
    Panel1: TPanel;
    qryUpi: TQuery;
    dsrcUpi: TDataSource;
    qryLS: TQuery;
    dsrcLS: TDataSource;
    popMnu: TPopupMenu;
    popLsHead: TMenuItem;
    updLS: TUpdateSQL;
    bBtnCancel: TBitBtn;
    DBNavigator1: TDBNavigator;
    sBtnPrt: TSpeedButton;
    qryLSNR: TIntegerField;
    qryLSTABN: TIntegerField;
    qryLSDTBEG: TDateTimeField;
    qryLSLICSCH: TStringField;
    qryLSKDBNK: TSmallintField;
    qryLSNmBnk: TStringField;
    qryUpiNR: TIntegerField;
    qryUpiTABN: TIntegerField;
    qryUpiFAM: TStringField;
    qryUpiIMA: TStringField;
    qryUpiOTCH: TStringField;
    qryUpiDOB: TDateTimeField;
    qryUpiPOL: TStringField;
    qryUpiPRUV: TSmallintField;
    qryUpiID: TStringField;
    qryUpiLSTN: TIntegerField;
    qryUpiLICSCH: TStringField;
    qryLSNOTES: TStringField;
    qryUpiSHBNK: TStringField;
    popPrt: TPopupMenu;
    popPrtHead: TMenuItem;
    popPrtLS: TMenuItem;
    popPrtAll: TMenuItem;
    popLsSep1: TMenuItem;
    popLsPoisk: TMenuItem;
    popLsPoiskFIO: TMenuItem;
    popLsPoiskTabN: TMenuItem;
    popLsOrder: TMenuItem;
    popLsOrderByFIO: TMenuItem;
    popLsOrderByTabN: TMenuItem;
    LabelCntRec: TLabel;
    opLsFilter: TMenuItem;
    popLsFilterAll: TMenuItem;
    popLsFilterLS: TMenuItem;
    popLsFilterID: TMenuItem;
    LabelUpiFilter: TLabel;
    qryUpiDTBEG: TDateTimeField;
    qryUpiKDBNK: TSmallintField;
    popLS: TMenuItem;
    sBtnLS: TSpeedButton;
    cdsBanki: TClientDataSet;
    dsrcBanki: TDataSource;
    qryTmp: TQuery;
    dspTmp: TDataSetProvider;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrBanki: TDBGrid;
    dbgrUpi: TDBGrid;
    Splitter1: TSplitter;
    dbgrSps: TDBGrid;
    qrySps: TQuery;
    dsrcSps: TDataSource;
    qrySpsTABN: TIntegerField;
    qrySpsFAM: TStringField;
    qrySpsIMA: TStringField;
    qrySpsOTCH: TStringField;
    qrySpsID: TStringField;
    qrySpsDTBEG: TDateTimeField;
    qrySpsKDBNK: TSmallintField;
    qrySpsSHBNK: TStringField;
    qrySpsNMBNK: TStringField;
    qrySpsFamIO: TStringField;
    qrySpsLICSCH: TStringField;
    sBtnSps: TSpeedButton;
    LabelCntSpsRec: TLabel;
    cdsBankiKDBNK: TSmallintField;
    cdsBankiSHBNK: TStringField;
    cdsBankiNMBNK: TStringField;
    popSps: TPopupMenu;
    popSpsOrderByFIO: TMenuItem;
    popSpsOrderByTabN: TMenuItem;
    popSpsOrderHead: TMenuItem;
    popSpsOrderByLS: TMenuItem;
    popSpsOrderByID: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure popLSAddEdtClick(Sender: TObject);
    procedure qryLSAfterPost(DataSet: TDataSet);
//    procedure popLsClearClick(Sender: TObject);
    procedure popMnuPopup(Sender: TObject);
    procedure qryLSAfterDelete(DataSet: TDataSet);
    procedure sBtnPrtClick(Sender: TObject);
    procedure popPrtLSClick(Sender: TObject);
    procedure popPrtAllClick(Sender: TObject);
    procedure popLsPoiskFIOClick(Sender: TObject);
    procedure popLsPoiskTabNClick(Sender: TObject);
    procedure popLsOrderByFIOClick(Sender: TObject);
    procedure popLsOrderByTabNClick(Sender: TObject);
    procedure popLsFilterAllClick(Sender: TObject);
    procedure popLsFilterLSClick(Sender: TObject);
    procedure popLsFilterIDClick(Sender: TObject);
    procedure dbgrUpiEditButtonClick(Sender: TObject);
    procedure dbgrUpiDblClick(Sender: TObject);
    procedure dbgrUpiKeyDown(Sender: TObject; var Key: Word;
                                                           Shift: TShiftState);
    procedure popLSClick(Sender: TObject);
    procedure sBtnSpsClick(Sender: TObject);
    procedure qrySpsCalcFields(DataSet: TDataSet);
    procedure dsrcBankiDataChange(Sender: TObject; Field: TField);
    procedure popSpsOrderByFIOClick(Sender: TObject);
    procedure popSpsOrderByTabNClick(Sender: TObject);
    procedure popSpsOrderByLSClick(Sender: TObject);
    procedure popSpsOrderByIDClick(Sender: TObject);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
  private
    { Private declarations }
    nFilter : integer;
    d_OnDate : TDateTime;
    procedure OpenQryUpi(dOnDate : tDateTime);
    procedure OpenQryLS;
    procedure SetUpiFilter;
    procedure SetPgCtrlState;
    procedure CreOpenCdsBanki;
    procedure OpenQrySps;
  public
    { Public declarations }
  end;

procedure ShowUpiLS(dOnDate : TDateTime);

const SECTION = 'Z_UpiLS';

var
  FormUpiLS: TFormUpiLS;
  nSvTabN : integer;

implementation

uses A_Const, A_DM, Z_DM, Z_Main, A_Lib, Z_VvFm, Z_VvTn, Z_CmnPrt,
                                                           Z_eLS, z_BnkLS;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowUpiLS(dOnDate : TDateTime);
begin
  FormUpiLS := TFormUpiLS.Create(Application);
  with FormUpiLS do begin
    d_OnDate := dOnDate;
    Caption := 'Список сотрудников / Лицевые счета на ' + DateToStr(dOnDate);
    OpenQryUpi(dOnDate);
    if nSvTabN <> 0 then
      qryUpi.Locate('TabN', nSvTabN, []);
    OpenQryLS; //qryLS.Open;
    ShowModal;
    qryLS.Close;
    qryUpi.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.FormCreate(Sender: TObject);
var nCaseOrderSps : word;
begin
  LabelCntRec.Caption := '';
  LabelUpiFilter.Caption := '';
  with TIniFile.Create(cNmIniFile) do begin
    Left    := ReadInteger(SECTION, 'wL', 50);
    Top     := ReadInteger(SECTION, 'wT', 50);
    Height  := ReadInteger(SECTION, 'wH', 355);
    Width   := ReadInteger(SECTION, 'wW', 555);
    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    popLsOrderByFIO.Checked := ReadBool(SECTION, 'bOrdByFIO', true);
    popLsOrderByTabN.Checked := not popLsOrderByFIO.Checked;
    nFilter := ReadInteger(SECTION, 'nFilter', 0);
    dbgrBanki.Width := ReadInteger(SECTION, 'grBnkW', 140);
    nCaseOrderSps := ReadInteger(SECTION, 'nOrderSps', 1);
    Free;
  end;
  if nFilter = 0 then begin
    popLsFilterAll.Checked := true;
    popLsFilterLS.Checked  := false;
    popLsFilterID.Checked  := false; end
  else if nFilter = 1 then begin
    popLsFilterLS.Checked  := true;
    popLsFilterAll.Checked := false;
    popLsFilterID.Checked  := false; end
  else begin
    popLsFilterID.Checked  := true;
    popLsFilterAll.Checked := false;
    popLsFilterLS.Checked  := false;
  end;
  if nCaseOrderSps = 1 then
    popSpsOrderByFIO.Checked := true
  else if nCaseOrderSps = 2 then
    popSpsOrderByTabN.Checked := true
  else if nCaseOrderSps = 3 then
    popSpsOrderByLS.Checked := true
  else
    popSpsOrderByID.Checked := true;
  if FileExists(cDirVids + 'GrUpiLs2.vid') then
    dbgrUpi.Columns.LoadFromFile(cDirVids + 'GrUpiLs2.vid');
  if FileExists(cDirVids + 'GrUpiLs3.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'GrUpiLs3.vid');
  if FileExists(cDirVids + 'GrUpiLs4.vid') then
    dbgrBanki.Columns.LoadFromFile(cDirVids + 'GrUpiLs4.vid');
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.OpenQryUpi(dOnDate : TDateTime);
begin
  with qryUpi do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select upi.*, LS.TabN as LSTN, LS.DtBeg, ' +
            ' LS.LicSch, LS.KdBnk, LS.ShBnk from Z_UPI upi ' +
            ' Left Outer Join Z_Get_BnkLS(upi.TabN, :dOnDate) LS on (1=1) ');
            //' where not ls.KdBnk is Null');
    if popLsOrderByFIO.Checked then
      SQL.Add(' order by upi.Fam, upi.Ima, upi.Otch, upi.TabN')
    else
      SQL.Add(' order by upi.TabN');
    ParamByName('dOnDate').AsDateTime := dOnDate;
    Open;
    SetUpiFilter;
    LabelCntRec.Caption := IntToStr(RecordCount);
  end;
end;
{
    SQL.Add('Select upi.*, LS.TabN as LSTN, LS.LicSch, bnk.ShBnk ');
    SQL.Add(' from Z_UPI upi ');
    SQL.Add(' Left Outer Join Z_BankiLS LS on (LS.TabN = upi.Tabn)');
    SQL.Add(' Left Outer Join Z_Banki bnk on (bnk.KdBnk = LS.KdBnk)');
}
//------------------------------------------------------------------------------
procedure TFormUpiLS.OpenQryLS;
begin
  with qryLS do begin;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUpi;
    SQL.Add('Select * from Z_BankiLS where TabN = :TabN');
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.SetUpiFilter;
var nSvTabN : integer;
begin
  with qryUpi do begin
    nSvTabN := FieldByName('TabN').AsInteger;
    Filtered := false;
    if popLsFilterLS.Checked then begin
      Filter := 'LicSch > ''''';
      Filtered := true;
      LabelUpiFilter.Caption := 'Фильтр по ЛС'; end
    else if popLsFilterID.Checked then begin
      Filter := 'ID > ''''';
      Filtered := true;
      LabelUpiFilter.Caption := 'Фильтр по ИД'; end
    else begin
      Filter := '';
      Filtered := false;
      LabelUpiFilter.Caption := 'Без фильтра';
    end;
    if (nSvTabN <> 0) and (FieldByName('TabN').AsInteger <> nSvTabN) then
      Locate('TabN', nSvTabN, []);
    LabelCntRec.Caption := IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrUpi.Columns.SaveToFile(cDirVids + 'GrUpiLs2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvTabN', qryUpi.FieldByName('TabN').AsInteger);
    WriteBool(SECTION, 'bOrdByFIO', popLsOrderByFIO.Checked);
    WriteInteger(SECTION, 'grBnkW', dbgrBanki.Width);
    if popLsFilterLS.Checked then
      WriteInteger(SECTION, 'nFilter', 1)
    else if popLsFilterID.Checked then
      WriteInteger(SECTION, 'nFilter', 1)
    else
      WriteInteger(SECTION, 'nFilter', 0);
    if popSpsOrderByFIO.Checked then
      WriteInteger(SECTION, 'nOrderSps', 1)
    else if popSpsOrderByTabN.Checked then
      WriteInteger(SECTION, 'nOrderSps', 2)
    else if popSpsOrderByLS.Checked then
      WriteInteger(SECTION, 'nOrderSps', 3)
    else
      WriteInteger(SECTION, 'nOrderSps', 4);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popMnuPopup(Sender: TObject);
begin
  popLS.Enabled := qryUpi.RecordCount > 0;
{
  popLsAdd.Enabled := qryUpi.FieldByName('LSTN').IsNull or
                                (qryUpi.FieldByName('LSTN').AsString = '');
  popLsEdt.Enabled := (qryUpi.FieldByName('LSTN').AsString <> '');
  popLsClear.Enabled := popLsEdt.Enabled;
}
end;
(*
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLSAddEdtClick(Sender: TObject);
var cFamIO : string; bCloseLS : boolean;
begin
  cFamIO := MyFamIO(qryUpi.FieldByName('Fam').AsString,
                qryUpi.FieldByName('Ima').AsString,
                  qryUpi.FieldByName('Otch').AsString);
  if qryUpi.FieldByName('LSTN').IsNull then begin
    qryLS.Append;
    qryLS.FieldByName('TabN').AsInteger :=
                                  qryUpi.FieldByName('TabN').AsInteger; end
  else
    qryLS.Edit;
  if AddEdtLS(cFamIO) {Z_eLS} then begin
    qryLS.Post;
    DmMain.CreOpenCdsBankiLsLU(d_OnDate); end
  else
    qryLS.Cancel;
end;
*)
(*
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLsClearClick(Sender: TObject);
begin
  if MessageDlg('Очистить лицевой счет?:', mtConfirmation,
                                           [mbYes, mbNo], 0) = mrYes then begin
    qryLS.Delete;
    DmMain.CreOpenCdsBankiLsLU(d_OnDate);
  end;
end;
*)
//------------------------------------------------------------------------------
procedure TFormUpiLS.qryLSAfterPost(DataSet: TDataSet);
var n_SvTabN : integer;
begin
  n_SvTabN := qryUpi.FieldByName('TabN').AsInteger;
  Form_DM.DbMain.ApplyUpdates([qryLS]);
  qryLS.Close;
  qryLS.Open;
  qryUpi.Close;
  qryUpi.Open;
  qryUpi.Locate('TabN', n_SvTabN, []);
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.qryLSAfterDelete(DataSet: TDataSet);
var n_SvTabN : integer;
begin
  Form_DM.DbMain.ApplyUpdates([qryLS]);
  n_SvTabN := qryUpi.FieldByName('TabN').AsInteger;
  qryLS.Close;
  qryLS.Open;
  qryUpi.Close;
  qryUpi.Open;
  qryUpi.Locate('TabN', n_SvTabN, []);
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.sBtnPrtClick(Sender: TObject);
var X, Y : integer; cMsg, cShBnk, cNmBnk : ShortString;
    nKdBnk : SmallInt;
begin
  if not sBtnSps.Down then begin
    X := Top + sBtnPrt.Top + 48;
    Y := Left + sBtnPrt.Left + 4;
    popPrt.Popup(Y, X); end
  else begin
    nKdBnk := cdsBankiKdBnk.AsInteger;
    cShBnk := cdsBankiShBnk.AsString;
    cNmBnk := cdsBankiNmBnk.AsString;
    cMsg := 'Распечатать список ЛС банка ' + IntToStr(nKdBnk) + ' ' +
                                       cNmBnk + '?:';
    if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      F6PrtSpsLS(nKdBnk, cNmBnk, qrySps); {z_CmnPrt}
      //ShowMessage('Тут будет печать списка ЛС банка ' + cNmBnk);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popPrtLSClick(Sender: TObject);
var bAll : boolean;
begin
  bAll := false;
  F6_PrtSpisok(qryUpi, bAll);    {Z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popPrtAllClick(Sender: TObject);
var bAll : boolean;
begin
  bAll := true;
  F6_PrtSpisok(qryUpi, bAll);    {Z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLsPoiskFIOClick(Sender: TObject);
var nTabN : integer;
begin
  if VvodFamForUpi(nTabN) {Z_VvFm} then
    qryUpi.Locate('TabN', nTabN, []);
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLsPoiskTabNClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString;
begin
  if VvodTabN(nTabN, cFamIO) {Z_VvTn} then begin
    if not qryUpi.Locate('TabN', nTabN, []) then
      ShowMessage('Поиск не удался  -  не найден' + #13#10 +
                  'табельный номер ' + IntToStr(nTabN) + ' в списке.');
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLsOrderByFIOClick(Sender: TObject);
var nSvTabN : integer;
begin
  if not popLsOrderByFIO.Checked then begin
    nSvTabN := qryUpiTabN.AsInteger;
    popLsOrderByFIO.Checked := true;
    popLsOrderByTabN.Checked := false;
    OpenQryUpi(d_OnDate);
    if nSvTabN <> 0 then
      qryUpi.Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLsOrderByTabNClick(Sender: TObject);
var nSvTabN : integer;
begin
  if not popLsOrderByTabN.Checked then begin
    nSvTabN := qryUpiTabN.AsInteger;
    popLsOrderByTabN.Checked := true;
    popLsOrderByFIO.Checked := false;
    OpenQryUpi(d_OnDate);
    if nSvTabN <> 0 then
      qryUpi.Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLsFilterAllClick(Sender: TObject);
begin
  if not popLsFilterAll.Checked then begin
    popLsFilterAll.Checked := true;
    popLsFilterLS.Checked  := false;
    popLsFilterID.Checked  := false;
    SetUpiFilter;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLsFilterLSClick(Sender: TObject);
begin
  if not popLsFilterLS.Checked then begin
    popLsFilterLS.Checked  := true;
    popLsFilterAll.Checked := false;
    popLsFilterID.Checked  := false;
    SetUpiFilter;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLsFilterIDClick(Sender: TObject);
begin
  if not popLsFilterID.Checked then begin
    popLsFilterID.Checked  := true;
    popLsFilterAll.Checked := false;
    popLsFilterLS.Checked  := false;
    SetUpiFilter;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.dbgrUpiEditButtonClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString; bWasUpdated : boolean;
begin
  if (qryUpi.RecordCount > 0) and
        (UpperCase(dbgrUpi.SelectedField.FullName) = 'LICSCH') then begin
    nTabN := qryUpiTabN.AsInteger;
    cFamIO := MyFamIO(qryUpiFam.AsString, qryUpiIma.AsString,
                                                      qryUpiOtch.AsString);
    ShowBnkLS(nTabN, d_OnDate, cFamIO, bWasUpdated);  {z_BnkLS}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popLSClick(Sender: TObject);
var nTabN : integer; cFamIO : ShortString; bWasUpdated : boolean;
begin
  if (qryUpi.RecordCount > 0) then begin
    nTabN := qryUpiTabN.AsInteger;
    cFamIO := MyFamIO(qryUpiFam.AsString, qryUpiIma.AsString,
                                                      qryUpiOtch.AsString);
    ShowBnkLS(nTabN, d_OnDate, cFamIO, bWasUpdated);  {z_BnkLS}
    if bWasUpdated then begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      OpenQryUpi(d_OnDate);
      qryUpi.Locate('TabN', nTabN, []);
      Screen.Cursor := crDefault;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.dbgrUpiDblClick(Sender: TObject);
begin
  if (qryUpi.RecordCount > 0) and
        (UpperCase(dbgrUpi.SelectedField.FullName) = 'LICSCH') then
    popLSClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.dbgrUpiKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) and
                           (qryUpi.RecordCount > 0) and
              (UpperCase(dbgrUpi.SelectedField.FullName) = 'LICSCH') then
    popLSClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.sBtnSpsClick(Sender: TObject);
begin
  SetPgCtrlState;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.CreOpenCdsBanki;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct p.KdBnk, p.ShBnk, p.NmBnk ' +
            ' from Z_BankiLS LS ' +
            ' Left Outer Join Z_Get_BnkLS(LS.TabN, :dOnDate) p on (1=1) ' +
            ' where not p.KdBnk is Null order by p.ShBnk');
    ParamByName('dOnDate').AsDateTime := d_OnDate;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsBanki do begin
    if Active then Close;
    ProviderName := 'dspTmp';
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.SetPgCtrlState;
begin
  if sBtnSps.Down then begin
    CreOpenCdsBanki;
    OpenQrySps;
    dbNavigator1.DataSource := dsrcSps;
    LabelCntRec.Visible := false;
    LabelUpiFilter.Visible := false;
    sBtnLS.Enabled := false;
    //sBtnPrt.Enabled := false;
    LabelCntSpsRec.Visible := true;
    PageControl1.ActivePage := ts2; end
  else begin
    dbgrSps.Columns.SaveToFile(cDirVids + 'GrUpiLs3.vid');
    dbgrBanki.Columns.SaveToFile(cDirVids + 'GrUpiLs4.vid');
    qrySps.Close;
    cdsBanki.Close;
    dbNavigator1.DataSource := dsrcUpi;
    LabelCntRec.Visible := true;
    LabelUpiFilter.Visible := true;
    sBtnLS.Enabled := true;
    //sBtnPrt.Enabled := true;
    LabelCntSpsRec.Visible := false;
    PageControl1.ActivePage := ts1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.OpenQrySps;
var nSvTabN : integer;
begin
  nSvTabN := 0;
  with qrySps do begin
    if Active then begin
      nSvTabN := qrySpsTabN.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcBanki;
    SQL.Add('Select Upi.TabN, upi.Fam, upi.Ima, upi.Otch, upi.ID, ' +
            ' p.DtBeg, p.LicSch, p.KdBnk, p.ShBnk, p.NmBnk ' +
            ' from z_Upi upi ' +
            ' Left Outer Join Z_Get_BnkLS(Upi.TabN, :dOnDate) p on (1=1) ' +
            ' where p.KdBnk = :KdBnk');
    if popSpsOrderByFIO.Checked then
      SQL.Add('order by upi.Fam, upi.Ima, upi.Otch')
    else if popSpsOrderByTabN.Checked then
      SQL.Add('order by upi.TabN')
    else if popSpsOrderByLS.Checked then
      SQL.Add('order by p.LicSch')
    else
      SQL.Add('order by upi.ID');
    ParamByName('dOnDate').AsDateTime := d_OnDate;
    Open;
    if nSvTabN <> 0 then
      Locate('TabN', nSvTabN, []);
    LabelCntSpsRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.qrySpsCalcFields(DataSet: TDataSet);
begin
  qrySpsFamIO.AsString := MyFamIO(qrySpsFam.AsString, qrySpsIma.AsString,
                                                          qrySpsOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.dsrcBankiDataChange(Sender: TObject; Field: TField);
begin
  if (dsrcBanki.State = dsBrowse) and (qrySps.Active) then
    LabelCntSpsRec.Caption := 'Записей: ' + IntToStr(qrySps.RecordCount);
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popSpsOrderByFIOClick(Sender: TObject);
begin
  if not popSpsOrderByFIO.Checked then begin
    popSpsOrderByFIO.Checked := true;
    OpenQrySps;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popSpsOrderByTabNClick(Sender: TObject);
begin
  if not popSpsOrderByTabN.Checked then begin
    popSpsOrderByTabN.Checked := true;
    OpenQrySps;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popSpsOrderByLSClick(Sender: TObject);
begin
  if not popSpsOrderByLS.Checked then begin
    popSpsOrderByLS.Checked := true;
    OpenQrySps;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.popSpsOrderByIDClick(Sender: TObject);
begin
  if not popSpsOrderByID.Checked then begin
    popSpsOrderByID.Checked := true;
    OpenQrySps;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBK;
end;
//------------------------------------------------------------------------------
procedure TFormUpiLS.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
