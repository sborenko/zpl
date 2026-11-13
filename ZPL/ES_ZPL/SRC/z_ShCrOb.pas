unit z_ShCrOb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, DBClient, DBTables, StdCtrls, Buttons,
  Provider, Menus, ExtCtrls;

type
  TFormShwCurObj = class(TForm)
    qrySps: TQuery;
    cdsSps: TClientDataSet;
    dsrcSps: TDataSource;
    dbgrSps: TDBGrid;
    cdsSpsTABN: TIntegerField;
    cdsSpsFAM: TStringField;
    cdsSpsIMA: TStringField;
    cdsSpsOTCH: TStringField;
    cdsSpsID: TStringField;
    cdsSpsKDBNK: TSmallintField;
    cdsSpsLICSCH: TStringField;
    cdsSpsOklad: TFloatField;
    cdsSpsShBnk: TStringField;
    dspSps: TDataSetProvider;
    qryPere: TQuery;
    pop: TPopupMenu;
    popSort: TMenuItem;
    popSortByTabN: TMenuItem;
    popSortByFIO: TMenuItem;
    cdsSpsFamIO: TStringField;
    Panel1: TPanel;
    sBtnPrt: TSpeedButton;
    LabelCntRec: TLabel;
    rBtnSortByTabN: TRadioButton;
    rBtnSortByFIO: TRadioButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    LbxColNames: TListBox;
    LbxColTitles: TListBox;
    cdsSpsKdObj: TSmallintField;
    cdsSpsDolgnost: TStringField;
    procedure cdsSpsCalcFields(DataSet: TDataSet);
    procedure rBtnSortByTabNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnPrtClick(Sender: TObject);
    procedure popSortByTabNClick(Sender: TObject);
    procedure popSortByFIOClick(Sender: TObject);
    procedure dbgrSpsTitleClick(Column: TColumn);
  private
    { Private declarations }
    n_KdObj, n_KdSps : SmallInt;
    d_DtPrc : TDateTime;
    bAllObj : boolean;
    procedure SetqryPere(dDtPrc : TDateTime);
    procedure CreOpenCdsSps(nKdObj, nKdSps : SmallInt; dDtPrc : TDateTime);
    procedure SortCdsSps;
  public
    { Public declarations }
  end;

procedure ShwSpsCurObj(nKdObj, nKdSps : SmallInt; dDtPrc : TDateTime);
procedure ShwSpsCurMes(nKdSps : SmallInt; dDtPrc : TDateTime);

const SECTION = 'z_ShCrOb';

var
  FormShwCurObj: TFormShwCurObj;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, z_CmnPrt, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwSpsCurMes(nKdSps : SmallInt; dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormShwCurObj := TFormShwCurObj.Create(Application);
  with FormShwCurObj do begin
    n_KdObj := 0;
    n_KdSps := nKdSps;
    d_DtPrc := dDtPrc;
    bAllObj := true;
    DecodeDate(dDtPrc, nY, nM, nD);
    LabelCntRec.Caption := '';
    Caption := 'Список всех сотрудников в ' +
                                  MesPredlogn(nM) + ' ' + IntToStr(nY) + ' г.';
    SetqryPere(dDtPrc);
    CreOpenCdsSps(n_KdObj, n_KdSps, d_DtPrc);
    LabelCntRec.Caption := 'Записей ' + IntToStr(cdsSps.RecordCount);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure ShwSpsCurObj(nKdObj, nKdSps : SmallInt; dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormShwCurObj := TFormShwCurObj.Create(Application);
  with FormShwCurObj do begin
    n_KdObj := nKdObj;
    n_KdSps := nKdSps;
    d_DtPrc := dDtPrc;
    bAllObj := false;
    DecodeDate(dDtPrc, nY, nM, nD);
    LabelCntRec.Caption := '';
    Caption := 'Список сотрудников подразделения ' + IntToStr(nKdObj) + ' в ' +
                                  MesPredlogn(nM) + ' ' + IntToStr(nY) + ' г.';
    SetqryPere(dDtPrc);
    CreOpenCdsSps(n_KdObj, n_KdSps, d_DtPrc);
    LabelCntRec.Caption := 'Записей ' + IntToStr(cdsSps.RecordCount);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.CreOpenCdsSps(nKdObj, nKdSps : SmallInt;
                                                          dDtPrc: TDateTime);
var dDtEndMes : TDateTime;
begin
  dDtEndMes := MyLastDOM(dDtPrc);
  with cdsSps do begin
    if Active then Close;
    IndexName := '';
  end;
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select s.TabN, s.KdObj, u.Fam, u.Ima, u.Otch, u.Id, ' +
            ' bl.KdBnk, bl.LicSch from z_Sps s ' +
            ' Left Outer Join z_Upi u on u.TabN = s.TabN ' +
            ' Left outer join Z_GET_BNKLS (s.TabN, :dDtEndMes) bl on 1 = 1 ' +
            ' where s.DtProc = :dDtPrc and ');
    if nKdObj > 0 then
      SQL.Add(' s.KdObj = :nKdObj')
    else
      SQL.Add(' s.KdObj > :nKdObj');
    SQL.Add(' and s.KdSps = :nKdSps');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nKdObj').AsInteger := nKdObj;
    ParamByName('nKdSps').AsInteger := nKdSps;
    ParamByName('dDtEndMes').AsDateTime := dDtEndMes;
  end;
  dspSps.DataSet := qrySps;
  cdsSps.ProviderName := 'dspSps';
  cdsSps.Open;
  SortCdsSps;
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.SetqryPere(dDtPrc : TDateTime);
begin
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Get_PERE (:nTabN, :dDtPrc)');
    ParamByName('dDtPrc').AsDateTime := dDtPrc + 1;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.cdsSpsCalcFields(DataSet: TDataSet);
var cShBnk, cNmBnk : ShortString;
begin
  cdsSpsFamIO.AsString := MyFamIO(cdsSpsFam.AsString, cdsSpsIma.AsString,
                                                    cdsSpsOtch.AsString);
  if not cdsSpsKdBnk.IsNull then begin
    cNmBnk := DmMain.KdBnk2NmBnk(cdsSpsKdBnk.AsInteger, cShBnk);
    cdsSpsShBnk.AsString := cShBnk;
  end;
  with qryPere do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := cdsSpsTabN.AsInteger;
    Open;
    if RecordCount > 0 then begin
      cdsSpsOklad.AsString := qryPere.FieldByName('OklTrf').AsString;
      cdsSpsDolgnost.AsString := qryPere.FieldByName('Dolgnost').AsString;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.rBtnSortByTabNClick(Sender: TObject);
begin
  SortCdsSps;
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.popSortByTabNClick(Sender: TObject);
begin
  if not popSortByTabN.Checked then begin
    rBtnSortByTabN.Checked := true;
    popSortByTabN.Checked := true;
    popSortByFIO.Checked := false;
    SortCdsSps;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.popSortByFIOClick(Sender: TObject);
begin
  if not popSortByFIO.Checked then begin
    rBtnSortByFIO.Checked := true;
    popSortByFIO.Checked := true;
    popSortByTabN.Checked := false;
    SortCdsSps;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.SortCdsSps;
begin
  if not cdsSps.Active then
    Exit;
  if rBtnSortByTabN.Checked then begin
    if bAllObj then
      cdsSps.IndexName := 'OnTabN' // 'OnKdObjTabN'
    else
      cdsSps.IndexName := 'OnTabN';
    popSortByTabN.Checked := true; end
  else begin
    if bAllObj then
      cdsSps.IndexName := 'OnFIO'  // 'OnKdObjFIO'
    else
      cdsSps.IndexName := 'OnFIO';
    popSortByFIO.Checked := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 200);
    Top    := ReadInteger(SECTION, 'wT', 200);
    Height := ReadInteger(SECTION, 'wH', 375);
    Width  := ReadInteger(SECTION, 'wW', 600);
    rBtnSortByTabN.Checked := ReadBool(SECTION, 'bSortTabN', true);
    Free;
  end;
  rBtnSortByFIO.Checked := not rBtnSortByTabN.Checked;
  if rBtnSortByFIO.Checked then
    popSortByFIO.Checked := true
  else
    popSortByTabN.Checked := true;
  if FileExists(cDirVids + 'ShCrOb03.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'ShCrOb03.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bSortTabN', rBtnSortByTabN.Checked);
    Free;
  end;
  dbgrSps.Columns.SaveToFile(cDirVids + 'ShCrOb03.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.sBtnPrtClick(Sender: TObject);
var i : SmallInt;
begin
  LbxColNames.Items.Clear;
  LbxColTitles.Items.Clear;
  for i := 0 to dbgrSps.Columns.Count - 1 do begin
    if dbgrSps.Columns[i].Title.Font.Color = clMaroon then begin
      LbxColNames.Items.Add(dbgrSps.Columns[i].FieldName);
      LbxColTitles.Items.Add(dbgrSps.Columns[i].Title.Caption);
    end;
  end;
  if LbxColNames.Items.Count = 0 then
    ShowMessage('Нет "малиновых" полей')
  else
    F6PrtSpsCurObj(n_KdObj, d_DtPrc, cdsSps, LbxColNames, LbxColTitles);
end;
//------------------------------------------------------------------------------
procedure TFormShwCurObj.dbgrSpsTitleClick(Column: TColumn);
var cColumnNm : ShortString;
begin
  cColumnNm := UpperCase(Column.FieldName);
  if Column.Title.Font.Color = clWindowText then begin
    Column.Title.Font.Color := clMaroon;
    Column.Title.Font.Style := [fsBold]; end
  else begin
    Column.Title.Font.Color := clWindowText;
    Column.Title.Font.Style := [];
  end;
end;

end.
