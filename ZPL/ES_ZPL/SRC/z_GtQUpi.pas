unit z_GtQUpi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, StdCtrls, Buttons, Grids, DBGrids, Provider, DBClient,
  DBTables, ExtCtrls;

type
  TFormQuickUpi = class(TForm)
    qryUpi: TQuery;
    cdsUPI: TClientDataSet;
    dsrcUPI: TDataSource;
    dspUPI: TDataSetProvider;
    dbgrUpi: TDBGrid;
    cdsUPINR: TIntegerField;
    cdsUPITABN: TIntegerField;
    cdsUPIID: TStringField;
    cdsUPIFAM: TStringField;
    cdsUPIIMA: TStringField;
    cdsUPIOTCH: TStringField;
    cdsUPIDOB: TDateTimeField;
    cdsUPIPOL: TStringField;
    cdsUPIPRUV: TSmallintField;
    cdsUPIOBJFROM: TSmallintField;
    cdsUPIOLDTABN: TIntegerField;
    cdsUPIFamIO: TStringField;
    qryTmp: TQuery;
    PanelButtons: TPanel;
    Label1: TLabel;
    rBtnFIO: TRadioButton;
    rBtnTabN: TRadioButton;
    rBtnTin: TRadioButton;
    sBtnPoisk: TSpeedButton;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsUPICalcFields(DataSet: TDataSet);
    procedure rBtnFioClick(Sender: TObject);
    procedure dbgrUpiDblClick(Sender: TObject);
    procedure dbgrUpiKeyDown(Sender: TObject; var Key: Word;
                                                     Shift: TShiftState);
    procedure sBtnPoiskClick(Sender: TObject);
    procedure rBtnTabNClick(Sender: TObject);
    procedure rBtnTinClick(Sender: TObject);
  private
    { Private declarations }
    nSvTabN : integer;
    procedure CreOpenCdsUpi;

    procedure CallNewEmplSrch;
    procedure CallOldEmplSrch;
  public
    { Public declarations }
  end;

function GetUpiTabN(var nTabN : integer;
                    var cFam, cIma, cOtch, cFamIO, cTIN : string) : boolean;

const SECTION = 'z_GtQUpi';

var
  FormQuickUpi: TFormQuickUpi;

implementation

uses
  a_Const, a_DM, z_DM, Z_Main, z_TUpi, a_Lib, z_VvFmTn,
  FormSrchEmpl, DModUsrSetts;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetUpiTabN(var nTabN : integer;
                    var cFam, cIma, cOtch, cFamIO, cTIN : string) : boolean;
begin
  Result := false;
  cFam   := '';
  cIma   := '';
  cOtch  := '';
  cFamIO := '';
  cTIN   := '';
  FormQuickUpi := TFormQuickUpi.Create(Application);
  with FormQuickUpi do begin
    Caption := 'Выбор из справочника "Сотрудники"';
    CreOpenCdsUpi;
    if nTabN <> 0 then
      cdsUpi.Locate('TabN', nTabN, [])
    else if nSvTabN <> 0 then
      cdsUpi.Locate('TabN', nSvTabN, []);
    if ShowModal = mrOk then begin
      nTabN  := cdsUpiTabN.AsInteger;
      cFam   := cdsUpiFam.AsString;
      cIma   := cdsUpiIma.AsString;
      cOtch  := cdsUpiOtch.AsString;
      cFamIO := cdsUpiFamIO.AsString;
      cTIN   := cdsUpiId.AsString;
      Result := true;
    end;
    cdsUpi.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQuickUpi.CreOpenCdsUpi;
var nSvTabN : integer;
begin
  if cdsUPI.Active then
    nSvTabN := cdsUpiTabN.AsInteger
  else nSvTabN := 0;
  with qryUpi do begin
    if Active then Close;
    DataBaseName := CESMAIN;
    SQL.Clear;
    SQL.Add('Select * from z_UPI ');
    SQL.Add(' order by Fam, Ima, Otch')
{
    if rBtnFIO.Checked then
      SQL.Add(' order by Fam, Ima, Otch')
    else if rBtnTabN.Checked then
      SQL.Add('order by TabN')
    else
      SQL.Add('order by ID');
}
  end;
  with cdsUpi do begin
    Close;
    IndexDefs.Clear;
    Open;
    AddIndex('UpiByFIO', 'Fam;Ima;Otch', []);
    AddIndex('UpiByTabN', 'TabN', []);
    AddIndex('UpiByID', 'ID', []);
    if rBtnFIO.Checked then
      IndexName := 'UpiByFIO'
    else if rBtnTabN.Checked then
      IndexName := 'UpiByTabN'
    else
      IndexName := 'UpiByID';
    if nSvTabN <> 0 then
      Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQuickUpi.FormCreate(Sender: TObject);
var nSortCase : word;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left    := ReadInteger(SECTION, 'wL', 100);
    Top     := ReadInteger(SECTION, 'wT', 350);
    Height  := ReadInteger(SECTION, 'wH', 500);
    Width   := ReadInteger(SECTION, 'wW', 475);
    nSvTabN := ReadInteger(SECTION, 'nSvTN', 0);
    nSortCase := ReadInteger(SECTION, 'nSort', 1);
    Free;
  end;
  if nSortCase = 1 then
    rBtnFIO.Checked := true
  else if nSortCase = 2 then
    rBtnTabN.Checked := true
  else
    rBtnTin.Checked := true;
  if FileExists(cDirVids + 'GtQUpi.vid') then
    dbgrUpi.Columns.LoadFromFile(cDirVids + 'GtQUpi.vid');
end;
//------------------------------------------------------------------------------
procedure TFormQuickUpi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrUpi.Columns.SaveToFile(cDirVids + 'GtQUpi.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvTN', cdsUpiTabN.AsInteger);
    if rBtnFIO.Checked then
      WriteInteger(SECTION, 'nSort', 1)
    else if rBtnTabN.Checked then
      WriteInteger(SECTION, 'nSort', 2)
    else
      WriteInteger(SECTION, 'nSort', 3);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormQuickUpi.cdsUPICalcFields(DataSet: TDataSet);
begin
  cdsUpiFamIO.AsString := MyFamIO(cdsUpiFam.AsString, cdsUpiIma.AsString,
                                                         cdsUpiOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormQuickUpi.rBtnFioClick(Sender: TObject);
begin
  if cdsUpi.Active then
    cdsUpi.IndexName := 'UpiByFIO';
end;
//------------------------------------------------------------------------------
procedure TFormQuickUpi.rBtnTabNClick(Sender: TObject);
begin
  if cdsUpi.Active then
    cdsUpi.IndexName := 'UpiByTabN';
end;
//------------------------------------------------------------------------------
procedure TFormQuickUpi.rBtnTinClick(Sender: TObject);
begin
  if cdsUpi.Active then
    cdsUpi.IndexName := 'UpiByID';
end;
//------------------------------------------------------------------------------
procedure TFormQuickUpi.dbgrUpiDblClick(Sender: TObject);
begin
  if cdsUpi.Active then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormQuickUpi.dbgrUpiKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if ((Key = Ord('F')) and (Shift = [ssCtrl])) then
    sBtnPoiskClick(Self);
end;

//------------------------------------------------------------------------------
procedure TFormQuickUpi.sBtnPoiskClick(Sender: TObject);
begin
  if DmUsrSetts.NewEmplSrchDlg then
    CallNewEmplSrch
  else
    CallOldEmplSrch;
end;

//------------------------------------------------------------------------------
procedure TFormQuickUpi.CallOldEmplSrch;
var nTabN, nCase : integer; cSvIndexName : ShortString;
begin
  if VvodFmTnForUpi(nTabN, nCase) {z_VvFmTn} then begin
    if nCase = 0 {по ТабН} then with cdsUpi do begin
      DisableControls;
      cSvIndexName := IndexName;
      IndexName := 'UpiByTabN';
      EditKey;
      FieldByName('TabN').AsInteger := nTabN;
      if not GoToKey then
        ShowMessage('Не найдено записей по заданному условию');
      IndexName := cSvIndexName;
      EnableControls;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TFormQuickUpi.CallNewEmplSrch;
var
  nTabN: integer;
  cSvIndexName: ShortString;
begin
  if TFrmSrchEmpl.SearchOnlyTabN(nTabN) {z_VvFmTn} then begin
    with cdsUpi do begin
      DisableControls;
      cSvIndexName := IndexName;
      IndexName := 'UpiByTabN';
      EditKey;
      FieldByName('TabN').AsInteger := nTabN;
      if not GoToKey then
        ShowMessage('Не найдено записей по заданному условию');
      IndexName := cSvIndexName;
      EnableControls;
    end;
  end;
end;

end.
