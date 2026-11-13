unit z_PrcInd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, ExtCtrls, Grids, DBGrids, DBTables, StdCtrls, Buttons,
  DBClient;

type
  TFormPrcIndx = class(TForm)
    Panel1: TPanel;
    qryMes: TQuery;
    qryMesINDMES: TDateTimeField;
    qryMesCntRec: TSmallintField;
    dsrcMes: TDataSource;
    dbgrMes: TDBGrid;
    Splitter1: TSplitter;
    dbgrPrc: TDBGrid;
    qryPrc: TQuery;
    dcrcPrc: TDataSource;
    qryPrcNR: TIntegerField;
    qryPrcINDMES: TDateTimeField;
    qryPrcBAZMES: TDateTimeField;
    qryPrcPRCIND: TFloatField;
    qryPrcLASTDTBM: TDateTimeField;
    bBtnCancel: TBitBtn;
    LabelCntPrcRec: TLabel;
    updPrc: TUpdateSQL;
    qryTmp: TQuery;
    bBtnOK: TBitBtn;
    cdsMes: TClientDataSet;
    cdsMesIndMes: TDateField;
    cdsMesCntRec: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
    procedure cdsMesAfterScroll(DataSet: TDataSet);
    procedure qryPrcAfterPost(DataSet: TDataSet);
    procedure qryPrcAfterDelete(DataSet: TDataSet);
    procedure qryPrcNewRecord(DataSet: TDataSet);
    procedure qryPrcBeforePost(DataSet: TDataSet);
    procedure qryPrcBeforeInsert(DataSet: TDataSet);
    procedure dbgrPrcDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrMesDblClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    dNextBM, d_SvMesInd : TDateTime;
    bVuborMode : boolean;
    procedure CreOpenCdsMes;
    procedure OpenQryPrc;
    function GetNewPrcNR : integer;
  public
    { Public declarations }
  end;

procedure ShwTblPrcIndx;
function GetAddMes(dAddInMes : TDateTime; var dMesAdd : TDateTime) : boolean;

const SECTION = 'z_PrcInd';

var
  FormPrcIndx: TFormPrcIndx;

implementation

uses a_Const, a_DM, z_Dm, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwTblPrcIndx;
begin
  FormPrcIndx := TFormPrcIndx.Create(Application);
  with FormPrcIndx do begin
    Caption := 'По-месячные проценты индексации';
    bVuborMode := false;
    CreOpenCdsMes;
    if d_SvMesInd > 0 then
      cdsMes.Locate('IndMes', d_SvMesInd, []);
    OpenQryPrc;
    bBtnOk.Visible := false;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
function GetAddMes(dAddInMes : TDateTime; var dMesAdd : TDateTime) : boolean;
var nY, nM, nD : word;
begin
  Result := false;
  FormPrcIndx := TFormPrcIndx.Create(Application);
  with FormPrcIndx do begin
    DecodeDate(dAddInMes, nY, nM, nD);
    Caption := 'Выберите список для добавления в ' + MesRus(nM) + ' ' +
               IntToStr(nY) + ' г.';
    bVuborMode := true;
    CreOpenCdsMes;
    OpenQryPrc;
    bBtnCancel.Caption := 'Отказ';
    if ShowModal = mrOk then begin
      Result := true;
      dMesAdd := cdsMesIndMes.AsDateTime;
    end;
    Free;
  end;

end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 580);
    Width  := ReadInteger(SECTION, 'wW', 275);
    dbgrMes.Width := ReadInteger(SECTION, 'nGrMes', 113);
    d_SvMesInd := ReadDate(SECTION, 'SvIndMes', 0);
    Free;
  end;
  if FileExists(cDirVids + 'PIndM01.vid') then
    dbgrMes.Columns.LoadFromFile(cDirVids + 'PIndM01.vid');
  if FileExists(cDirVids + 'PIndP01.vid') then
    dbgrPrc.Columns.LoadFromFile(cDirVids + 'PIndP01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrMes.Columns.SaveToFile(cDirVids + 'PIndM01.vid');
  dbgrPrc.Columns.SaveToFile(cDirVids + 'PIndP01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nGrMes', dbgrMes.Width);
    WriteDate(SECTION, 'SvIndMes', cdsMesIndMes.AsDateTime);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.CreOpenCdsMes;
begin
  with cdsMes do begin
    if Active then Close;
    CreateDataset;
    Open;
  end;
  with qryMes do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select IndMes, Count(*) as CntRec from z_PrcIndx group by IndMes');
    Open;
    while not Eof do begin
      cdsMes.AppendRecord([qryMesIndMes.AsDateTime, qryMesCntRec.AsInteger]);
      Next;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.OpenQryPrc;
begin
  with qryPrc do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    DataSource := dsrcMes;
    SQL.Add('Select * from z_PrcIndx where IndMes = :IndMes ' +
            ' order by BazMes');
    Open;
    LabelCntPrcRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.cdsMesAfterScroll(DataSet: TDataSet);
begin
  if qryPrc.Active then
    LabelCntPrcRec.Caption := 'Записей: ' + IntToStr(qryPrc.RecordCount);
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.qryPrcBeforeInsert(DataSet: TDataSet);
var dDtTmp : TDateTime; nY, nM, nD : word;
begin
  if (qryPrc.RecordCount > 0) and (not qryPrcBazMes.IsNull) then begin
    dDtTmp := qryPrcBazMes.AsDateTime;
    DecodeDate(dDtTmp, nY, nM, nD);
    Inc(nM);
    if nM > 12 then begin
      nM := 1;
      Inc(nY);
    end;
    dNextBM := EncodeDate(nY, nM, 1); end
  else
    dNextBM := Date;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.qryPrcNewRecord(DataSet: TDataSet);
begin
  qryPrcBazMes.AsDateTime := dNextBM;
  qryPrcIndMes.AsDateTime := cdsMesIndMes.AsDateTime;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.qryPrcBeforePost(DataSet: TDataSet);
begin
  if not qryPrcBazMes.IsNull then
    qryPrcLastDtBM.AsDateTime := MyLastDom(qryPrcBazMes.AsDateTime);
  if qryPrcNR.IsNull then
    qryPrcNR.AsInteger := GetNewPrcNR;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.qryPrcAfterPost(DataSet: TDataSet);
begin
  if qryPrc.UpdatesPending then
    Form_DM.DbMain.ApplyUpdates([qryPrc]);
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.qryPrcAfterDelete(DataSet: TDataSet);
begin
  if qryPrc.UpdatesPending then
    Form_DM.DbMain.ApplyUpdates([qryPrc]);
end;
//------------------------------------------------------------------------------
function TFormPrcIndx.GetNewPrcNR: integer;
begin
  Result := 0;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 Gen_Id(Z_PrcIndx_NR, 1) as My_NR from Z_PrcIndx');
    Open;
    Result := FieldByName('My_NR').AsInteger;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.dbgrPrcDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrPrc.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if (cFldNm = 'PRCIND') then begin
      if not (gdFocused in State) then
        Brush.Color := clInfoBk
      else
        Brush.Color := clAqua;
    end;
  end;
  dbgrPrc.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.dbgrMesDblClick(Sender: TObject);
begin
  if bVuborMode then
    ModalResult := mrOk;;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.Splitter1Moved(Sender: TObject);
begin
  LabelCntPrcRec.Left := dbgrPrc.Left;
end;
//------------------------------------------------------------------------------
procedure TFormPrcIndx.FormResize(Sender: TObject);
begin
  LabelCntPrcRec.Left := dbgrPrc.Left;
end;

end.
