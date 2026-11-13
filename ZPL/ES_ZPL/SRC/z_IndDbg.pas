unit z_IndDbg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBClient, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  TFormShIndDbg = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    DBNavigator1: TDBNavigator;
    dbgrDbg: TDBGrid;
    cdsDbg: TClientDataSet;
    dsrcDbg: TDataSource;
    cdsDbgNR: TIntegerField;
    cdsDbgLastPrm: TDateField;
    cdsDbgDa: TStringField;
    cdsDbgTabN: TIntegerField;
    cdsDbgSmOklNdbIndM: TFloatField;
    cdsDbgSmToIndx: TFloatField;
    cdsDbgDtBM: TDateField;
    cdsDbgDtRprMin: TDateField;
    cdsDbgSmOklNdbBM: TFloatField;
    cdsDbgSmProgMin: TFloatField;
    cdsDbgSmMinZpBM: TFloatField;
    cdsDbgPrcIndBM: TFloatField;
    cdsDbgPredpSmInd: TFloatField;
    cdsDbgSmDelta: TFloatField;
    cdsDbgSmIndx: TFloatField;
    cdsDbgIsMin: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrDbgEnter(Sender: TObject);
    procedure dbgrDbgExit(Sender: TObject);
    procedure dbgrDbgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    d_DtMinBM, d_DtRprMin : TDateTime;
    procedure OpenCdsDbg(cCdsDbgNm : ShortString);
  public
    { Public declarations }
  end;

procedure ShwCdsDbg(nTabN : integer; cFamIO, cCdsDbgNm : ShortString;
                                            dDtMinBM, dDtRprMin : TDateTime);

const SECTION = 'z_IndDbg';

var
  FormShIndDbg: TFormShIndDbg;

implementation

uses z_Main, a_Const;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwCdsDbg(nTabN : integer; cFamIO, cCdsDbgNm : ShortString;
                                            dDtMinBM, dDtRprMin : TDateTime);
begin
  FormShIndDbg := TFormShIndDbg.Create(Application);
  with FormShIndDbg do begin
    Caption := 'Детали расчета индексации ТабНр = ' + IntToStr(nTabN) + ' ' +
               cFamIO;
    d_DtMinBM := dDtMinBM;
    d_DtRprMin := dDtRprMin;
    OpenCdsDbg(cCdsDbgNm);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShIndDbg.OpenCdsDbg(cCdsDbgNm: ShortString);
begin
  with cdsDbg do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    LoadFromFile(cCdsDbgNm);
    AddIndex('OnBazMes', 'DtBM', []);
    IndexName := 'OnBazMes';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShIndDbg.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 350);
    Width  := ReadInteger(SECTION, 'wW', 650);
    Free;
  end;
  if FileExists(cDirVids + 'ShIndDb2.vid') then
    dbgrDbg.Columns.LoadFromFile(cDirVids + 'ShIndDb2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShIndDbg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrDbg.Columns.SaveToFile(cDirVids + 'ShIndDb2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShIndDbg.dbgrDbgEnter(Sender: TObject);
begin
  dbgrDbg.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShIndDbg.dbgrDbgExit(Sender: TObject);
begin
  dbgrDbg.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormShIndDbg.dbgrDbgDrawColumnCell(Sender: TObject;
                                           const Rect: TRect; DataCol: Integer;
                                        Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrDbg.Canvas do begin
    if (cdsDbg.FieldByName('Da').AsString = 'Да') or
        (cdsDbg.FieldByName('Da').AsString = 'Дм') or
        ((cdsDbg.FieldByName('Da').AsString = 'ДД') and
         (cdsDbg.FieldByName('SmIndx').AsFloat <> 0)) then
      Brush.Color := clLime
    else if (cdsDbg.FieldByName('Da').AsString = 'Нет') then
      Brush.Color := $00B0CAFF;

    if (cFldNm = 'DTBM') or (cFldNm = 'SMINDX') or (cFldNm = 'PREDPSMIND') or
                           (cFldNm = 'PRCINDBM') or (cFldNm = 'SMDELTA') or
                                                  (cFldNm = 'SMOKLNDBBM') then
      Font.Style := [fsBold];
    if (cFldNm = 'SMDELTA') and (cdsDbgSmDelta.AsFloat < 0) then
      Font.Color := clRed;
    if (cFldNm = 'DTBM') and (cdsDbgDtBM.AsDateTime = d_DtRprMin) then
      Brush.Color := clSilver;
  end;
  dbgrDbg.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.

