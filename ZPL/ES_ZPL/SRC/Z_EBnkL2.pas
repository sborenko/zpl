unit Z_EBnkL2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, ExtCtrls, DB, DBTables, Grids, DBGrids, StdCtrls,
  Buttons;

type
  TFormEBnkL2 = class(TForm)
    Panel1: TPanel;
    Splitter2: TSplitter;
    dbgrUpi: TDBGrid;
    dbgrNU: TDBGrid;
    qryUpi: TQuery;
    dsrcUpi: TDataSource;
    qryNU: TQuery;
    qryNUTABN: TIntegerField;
    qryNUKDSPS: TSmallintField;
    qryNUMYMG: TDateTimeField;
    qryNUSMNACH: TFloatField;
    qryNUSMUDRG: TFloatField;
    qryNUSMVUPL: TFloatField;
    dsrcNU: TDataSource;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryUpiNR: TIntegerField;
    qryUpiTABN: TIntegerField;
    qryUpiID: TStringField;
    qryUpiFAM: TStringField;
    qryUpiIMA: TStringField;
    qryUpiOTCH: TStringField;
    qryUpiDOB: TDateTimeField;
    qryUpiPOL: TStringField;
    qryUpiPRUV: TSmallintField;
    qryUpiOBJFROM: TSmallintField;
    qryUpiOLDTABN: TIntegerField;
    qryUpiLASTDTPRM: TDateTimeField;
    qryUpiLASTDTUVL: TDateTimeField;
    qryUpiMYNOTES: TStringField;
    qryUpiPRARC: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrUpiDblClick(Sender: TObject);
    procedure dsrcUpiDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure OpenQryUpi(cID : ShortString);
    procedure OpenQryNU;
  public
    { Public declarations }
  end;

procedure VuborFromUpi(cID : ShortString; var nUpiTabN : integer;
                var cUpiFam, cUpiIma, cUpiOtch, cUpiID : ShortString;
                                                          var bOtkaz : boolean);

const SECTION = 'z_EBnkL2';

var
  FormEBnkL2: TFormEBnkL2;

implementation

uses A_Const, A_DM, A_Lib, Z_DM, Z_Main;

{$R *.dfm}


//------------------------------------------------------------------------------
procedure VuborFromUpi(cID : ShortString; var nUpiTabN : integer;
                var cUpiFam, cUpiIma, cUpiOtch, cUpiID : ShortString;
                                                         var bOtkaz : boolean);
begin
  bOtkaz := false;
  FormEBnkL2 := TFormEBnkL2.Create(Application);
  with FormEBnkL2 do begin
    Caption := 'Найдено несколько таб.номеров. Выберите один';
    OpenQryUpi(cID);
    OpenQryNU;
    if ShowModal = mrOk then begin
      nUpiTabN := qryUpi.FieldByName('TabN').AsInteger;
      cUpiFam  := qryUpi.FieldByName('Fam').AsString;
      cUpiIma  := qryUpi.FieldByName('Ima').AsString;
      cUpiOtch := qryUpi.FieldByName('Otch').AsString;
      cUpiID   := qryUpi.FieldByName('ID').AsString; end
    else
      bOtkaz := true;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEBnkL2.OpenQryUpi(cID: ShortString);
begin
  with qryUpi do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_Upi where Id = :cID order by TabN');
    ParamByName('cID').AsString := cID;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEBnkL2.OpenQryNU;
begin
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcUpi;
    SQL.Add('Select TabN, KdSps, DtProc as MyMG, SmNach, SmUdrg, SmVupl ' +
            ' from GETNU_TOTS_DTPROC (:TabN) order by DtProc, KdSps');
    Open;
    Last;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEBnkL2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 550);
    Width  := ReadInteger(SECTION, 'wW', 650);
    dbgrUpi.Width := ReadInteger(SECTION, 'grUpiW', 335);
    Free;
  end;
  if FileExists(cDirVids + 'EBnk2Upi.vid') then
    dbgrUpi.Columns.LoadFromFile(cDirVids + 'EBnk2Upi.vid');
  if FileExists(cDirVids + 'EBnk2Nu.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'EBnk2Nu.vid');
end;
//------------------------------------------------------------------------------
procedure TFormEBnkL2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrUpi.Columns.SaveToFile(cDirVids + 'EBnk2Upi.vid');
  dbgrNu.Columns.SaveToFile(cDirVids + 'EBnk2Nu.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grUpiW', dbgrUpi.Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormEBnkL2.dbgrUpiDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormEBnkL2.dsrcUpiDataChange(Sender: TObject; Field: TField);
begin
  if (qryUpi.State = dsBrowse) and qryNu.Active then
    qryNu.Last;
end;

end.
