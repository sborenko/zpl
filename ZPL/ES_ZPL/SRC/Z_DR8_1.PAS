unit z_Dr8_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, DBTables, IniFiles, StdCtrls, Buttons, Mask,
  ExtCtrls;

type
  TFormDr8_1 = class(TForm)
    qryPeriodu: TQuery;
    dsrcPeriodu: TDataSource;
    dbgrPeriodu: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PanelMsg: TPanel;
    LabelMsg: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    meFirmKod: TMaskEdit;
    edFirmNm: TEdit;
    meIdRuk: TMaskEdit;
    mePhoneRuk: TMaskEdit;
    edFioRuk: TEdit;
    meIdBuh: TMaskEdit;
    mePhoneBuh: TMaskEdit;
    edFioBuh: TEdit;
    meInspKod: TMaskEdit;
    meInspDPI: TMaskEdit;
    edInspNm: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    qryPerioduDTPROC: TDateTimeField;
    qryPerioduPeriod: TStringField;
    procedure qryPerioduCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function CheckVvod : boolean;
  public
    { Public declarations }
  end;

function GetDr8Periodu(mListPeriodu : TStringList;
                         var cFirmEDRPOU, cFirmNm,
                             cIdRuk, cPhRuk, cFioRuk,
                             cIdBuh, cPhBuh, cBuhFIO,
                             cInspEDRPOU, cInspDPI, cInspNm : string) : boolean;

const SECTION = 'z_Dr8_1';

var
  FormDr8_1: TFormDr8_1;

implementation

uses A_Const, Z_Main, A_Lib, A_ShwErr;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetDr8Periodu(mListPeriodu : TStringList;
                         var cFirmEDRPOU, cFirmNm,
                             cIdRuk, cPhRuk, cFioRuk,
                             cIdBuh, cPhBuh, cBuhFIO,
                             cInspEDRPOU, cInspDPI, cInspNm : string) : boolean;
var i: Integer;
begin
  Result := false;
  FormDr8_1 := TFormDr8_1.Create(nil);
  with FormDr8_1 do begin
    if (ShowModal = mrOk) and
                  (dbgrPeriodu.SelectedRows.Count > 0) then begin
      with dbgrPeriodu.DataSource.DataSet do
        for i := 0 to dbgrPeriodu.SelectedRows.Count-1 do begin
          GotoBookmark(pointer(dbgrPeriodu.SelectedRows.Items[i]));
          mListPeriodu.Add(dbgrPeriodu.DataSource.DataSet.
                               FieldByName('DtProc').AsString);
        end;
      cFirmEDRPOU := meFirmKod.Text;
      cFirmNm     := edFirmNm.Text;
      cIdRuk      := meIdRuk.Text;
      cPhRuk      := mePhoneRuk.Text;
      cFioRuk     := edFioRuk.Text;
      cIdBuh      := meIdBuh.Text;
      cPhBuh      := mePhoneBuh.Text;
      cBuhFIO     := edFioBuh.Text;
      cInspEDRPOU := meInspKod.Text;
      cInspDPI    := meInspDPI.Text;
      cInspNm     := edInspNm.Text;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormDr8_1.CheckVvod : boolean;
var mListErr, mListTmp : TStringList;
    i : integer; dDtTmp : TDateTime;
    nY1, nM1, nY2, nM2, nY3, nM3, nD : word;
begin
  Result := true;
  mListErr := TStringList.Create;
  mListErr.Clear;
  mListTmp := TStringList.Create;
  mListTmp.Clear;
  if dbgrPeriodu.SelectedRows.Count <> 3 then
    mListErr.Add('Должно быть выбрано три месяца')
  else begin
    with dbgrPeriodu.DataSource.DataSet do begin
      for i := 0 to dbgrPeriodu.SelectedRows.Count-1 do begin
        GotoBookmark(pointer(dbgrPeriodu.SelectedRows.Items[i]));
        dDtTmp := dbgrPeriodu.DataSource.DataSet.
                                   FieldByName('DtProc').AsDateTime;
        if i = 0 then
          DecodeDate(dDtTmp, nY1, nM1, nD)
        else if i = 1 then
          DecodeDate(dDtTmp, nY2, nM2, nD)
        else
          DecodeDate(dDtTmp, nY3, nM3, nD);
      end;
    end;
    if ((nY2 <> nY1) or (nY3 <> nY1)) or
                ((nM2 <> (nM1 + 1)) or (nM3 <> (nM2 + 1))) or
             ((nM1 <> 1) and (nM1 <> 4) and (nM1 <> 7) and (nM1 <> 10)) then
      mListErr.Add('Неправильно выбраны месяцы');
  end;
  if Trim(meFirmKod.Text) = '' then
    mListErr.Add('Нет кода ЕДРПОУ организации');
  if Trim(edFirmNm.Text) = '' then
    mListErr.Add('Нет названия организации');
  if Trim(meIdRuk.Text) = '' then
    mListErr.Add('Нет идентификатора руководителя');
  if Trim(mePhoneRuk.Text) = '' then
    mListErr.Add('Нет телефона руководителя');
  if Trim(edFioRuk.Text) = '' then
    mListErr.Add('Нет фамилии И.О. руководителя');
  if Trim(meIdBuh.Text) = '' then
    mListErr.Add('Нет идентификатора гл.бухгалтера');
  if Trim(mePhoneBuh.Text) = '' then
    mListErr.Add('Нет телефона гл.бухгалтера');
  if Trim(edFioBuh.Text) = '' then
    mListErr.Add('Нет фамилии И.О. гл.бухгалтера');
  if Trim(meInspKod.Text) = '' then
    mListErr.Add('Нет кода держ.податкового органу');
  if Trim(meInspDPI.Text) = '' then
    mListErr.Add('Нет ДПИ держ.податкового органу');
  if Trim(edInspNm.Text) = '' then
    mListErr.Add('Нет названия держ.податкового органу');
  if mListErr.Count > 0 then begin
    ShowErrors(mListErr);          {A_ShwErr}
    Result := false;
  end;
  mListErr.Destroy;
end;
//------------------------------------------------------------------------------
procedure TFormDr8_1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOk) and (not CheckVvod) then begin
    ModalResult := mrNone;
    CanClose := false;
    meFirmKod.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDr8_1.FormCreate(Sender: TObject);
begin
  with qryPeriodu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select distinct DtProc from z_NU where dtProc >= "01/01/2006"');
    Open;
    Last;
  end;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 340);
    meFirmKod.Text  := ReadString(SECTION, 'cFirmEDRPOU', '');
    edFirmNm.Text   := ReadString(SECTION, 'cFirmNm', cFirma);
    meIdRuk.Text    := ReadString(SECTION, 'cIdRuk', '');
    mePhoneRuk.Text := ReadString(SECTION, 'cPhRuk', '');
    edFioRuk.Text   := ReadString(SECTION, 'cFioRuk', cDirFIO);
    meIdBuh.Text    := ReadString(SECTION, 'cIdBuh', '');
    mePhoneBuh.Text := ReadString(SECTION, 'cPhBuh', '');
    edFioBuh.Text   := ReadString(SECTION, 'cFioBuh', cGlBuhFIO);
    meInspKod.Text  := ReadString(SECTION, 'cInspKod', '');
    meInspDPI.Text  := ReadString(SECTION, 'cInspDPI', '');
    edInspNm.Text   := ReadString(SECTION, 'cInspNm', '');
    Free;
  end;
  if FileExists(cDirVids  + 'z_Dr8_1.vid') then
    dbgrPeriodu.Columns.LoadFromFile(cDirVids  + 'z_Dr8_1.vid');
end;
//------------------------------------------------------------------------------
procedure TFormDr8_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrPeriodu.Columns.SaveToFile(cDirVids  + 'z_Dr8_1.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteString(SECTION, 'cFirmEDRPOU', meFirmKod.Text);
    WriteString(SECTION, 'cFirmNm', edFirmNm.Text);
    WriteString(SECTION, 'cIdRuk', meIdRuk.Text);
    WriteString(SECTION, 'cPhRuk', mePhoneRuk.Text);
    WriteString(SECTION, 'cFioRuk', edFioRuk.Text);
    WriteString(SECTION, 'cIdBuh', meIdBuh.Text);
    WriteString(SECTION, 'cPhBuh', mePhoneBuh.Text);
    WriteString(SECTION, 'cFioBuh', edFioBuh.Text);
    WriteString(SECTION, 'cInspKod', meInspKod.Text);
    WriteString(SECTION, 'cInspDPI', meInspDPI.Text);
    WriteString(SECTION, 'cInspNm', edInspNm.Text);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDr8_1.qryPerioduCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  DecodeDate(qryPerioduDtProc.AsDateTime, nY, nM, nD);
  qryPerioduPeriod.AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
end;
//------------------------------------------------------------------------------
procedure TFormDr8_1.FormResize(Sender: TObject);
begin
  PanelMsg.Top := Round((Height- PanelMsg.Height)/2) - 25;
  PanelMsg.Left := dbgrPeriodu.Width + 3;
end;

end.
