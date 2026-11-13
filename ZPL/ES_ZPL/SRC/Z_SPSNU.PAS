unit Z_SpsNU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB, DBTables, Buttons, StdCtrls,
  ExtCtrls, IniFiles, Menus;

type
  TFormSpsNU = class(TForm)
    PanelTools: TPanel;
    LabelMesGod: TLabel;
    qryListNU: TQuery;
    qryListNUDTPROC: TDateTimeField;
    qryListNUCNT: TIntegerField;
    qryListNUMesGod: TStringField;
    dsrcListNU: TDataSource;
    dbgrListNU: TDBGrid;
    Label1: TLabel;
    bBtnCancel: TBitBtn;
    popMnu: TPopupMenu;
    popHead: TMenuItem;
    popByVidN: TMenuItem;
    popByKatP: TMenuItem;
    popByShPZ: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    qryListNUSMM: TFloatField;
    procedure qryListNUCalcFields(DataSet: TDataSet);
    procedure dsrcListNUDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popByVidNClick(Sender: TObject);
    procedure popByKatPClick(Sender: TObject);
    procedure popByShPZClick(Sender: TObject);
  private
    { Private declarations }
    d_DtProc : TDateTime;
    procedure OpenQryListNU(dDtProc : TDateTime);
  public
    { Public declarations }
  end;

procedure ShowNuForSvodu(dDtProc : TDateTime);

const SECTION = 'Z_SpsNU';

var
  FormSpsNU: TFormSpsNU;

implementation

uses A_Const, A_Lib, Z_Main, Z_VvObj;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowNuForSvodu(dDtProc : TDateTime);
begin
  FormSpsNU := TFormSpsNU.Create(Application);
  with FormSpsNU do begin
    d_DtProc := dDtProc;
    Caption := '¬ыбор мес€ца дл€ сводов';
    OpenQryListNU(dDtProc);
    qryListNU.Locate('DtProc', dDtProc, []);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNU.OpenQryListNU(dDtProc : TDateTime);
var dDtBeg : TDateTime; nY, nM, nD : word;
begin
  // ќткрыть список мес€цев текущего и прошлого лет
  DecodeDate(dDtProc, nY, nM, nD);
  nY := nY - 1;
  dDtBeg := EnCodeDate(nY, 1, 1);
  with qryListNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select DtProc, count(NR) as Cnt, Sum(Summa) as SMM ' +
            ' from Z_NU where dtProc >= :dDtBeg and (KdSps = :nKdSps) ' +
            ' group by DtProc');
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('nKdSps').AsInteger  := nKdSps;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNU.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 325);
    Width  := ReadInteger(SECTION, 'wW', 230);
    Free;
  end;
  if FileExists(cDirVids + 'SpsNU.vid') then
    dbgrListNU.Columns.LoadFromFile(cDirVids + 'SpsNU.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSpsNU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrListNU.Columns.SaveToFile(cDirVids + 'SpsNU.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNU.qryListNUCalcFields(DataSet: TDataSet);
var nY, nM, nD : word;
begin
  with qryListNU do begin
    DecodeDate(FieldByName('DtProc').AsDateTime, nY, nM, nD);
    FieldByName('MesGod').AsString := MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNU.dsrcListNUDataChange(Sender: TObject; Field: TField);
begin
  if dsrcListNU.State = dsBrowse then
    LabelMesGod.Caption := qryListNUMesGod.AsString;
end;
//------------------------------------------------------------------------------
procedure TFormSpsNU.popByVidNClick(Sender: TObject);
var cCaption : string; nY, nM, nD : word;
begin
  DecodeDate(qryListNuDtProc.AsDateTime, nY, nM, nD);
  cCaption := '¬вод задани€ дл€ свода по видам начислени€ за ' +
              MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  VvodObj(qryListNuDtProc.AsDateTime, cCaption, 'ByVidN');  {Z_VvObj}
end;
//------------------------------------------------------------------------------
procedure TFormSpsNU.popByShPZClick(Sender: TObject);
var cCaption : string; nY, nM, nD : word;
begin
  DecodeDate(qryListNuDtProc.AsDateTime, nY, nM, nD);
  cCaption := '¬вод задани€ дл€ свода по шифрам затрат за ' +
              MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  VvodObj(qryListNuDtProc.AsDateTime, cCaption, 'ByShPZ');  {Z_VvObj}
end;
//------------------------------------------------------------------------------
procedure TFormSpsNU.popByKatPClick(Sender: TObject);
var cCaption : string; nY, nM, nD : word;
begin
  DecodeDate(qryListNuDtProc.AsDateTime, nY, nM, nD);
  cCaption := '¬вод задани€ дл€ свода по категори€м персонала за ' +
              MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
  VvodObj(qryListNuDtProc.AsDateTime, cCaption, 'ByKatP');  {Z_VvObj}
end;

end.
