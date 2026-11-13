unit a_StzGoT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, ExtCtrls, IniFiles,
  ComCtrls;

type
  TFormStzGoTo = class(TForm)
    qryStz: TQuery;
    dsrcStz: TDataSource;
    LabelInf: TLabel;
    Label1: TLabel;
    dbgrStz: TDBGrid;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryStzNR: TIntegerField;
    qryStzKDSTZ: TSmallintField;
    qryStzSHSTZ: TStringField;
    qryStzNMSTZ: TStringField;
    qryStzAINDX: TSmallintField;
    qryStzPINDX: TSmallintField;
    qryStzLVL: TSmallintField;
    qryStzINDX: TSmallintField;
    qryStzHSCH: TStringField;
    qryStzPVNUTR: TStringField;
    qryStzSH_STZ: TSmallintField;
    qryStzTreeFld: TStringField;
    procedure dbgrStzDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrStzDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryStzCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure OpenQryStz(nCurAIndx, nCurPIndx : LongInt);
    procedure Open2QryStz(nCurAIndx, nCurPIndx : LongInt);
  public
    { Public declarations }
  end;

function StzGoToParent(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
function StzMoveTo(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;

const SECTION = 'a_StzGoT';

var
  FormStzGoTo: TFormStzGoTo;

implementation

uses A_Dm, a_Const;

{$R *.dfm}

function StzMoveTo(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
var cShNewParent, cNmNewParent, cMsg : string;
begin
  Result := false;
  FormStzGoTo := TFormStzGoTo.Create(Application);
  with FormStzGoTo do begin
    Caption := 'Расположить перед заданным узла';
    cMsg := 'Вы можете расположить КЕКВ "' + cShCurItem + ' ' + cNmCurItem + '"';
    if bCurHsCh then
      cMsg := cMsg + ' и всех его "детей"';
    cMsg := cMsg + ' перед выбранным Вами узлом';
    LabelInf.Caption := cMsg;;
    Open2QryStz(nCurAIndx, nCurPIndx);
    if ShowModal = mrOk then begin
      nNewPIndx := qryStz.FieldByName('Indx').AsInteger;
      nAIndxNewParent := qryStz.FieldByName('AIndx').AsInteger;
      cShNewParent := qryStz.FieldByName('ShStZ').AsString;
      cNmNewParent := qryStz.FieldByName('NmStZ').AsString;
      cMsg := 'Хотите расположить КЕКВ "' + cShCurItem + ' ' + cNmCurItem + '"';
      if bCurHsCh then
        cMsg := cMsg + ' и всех его "детей"';
      cMsg := cMsg + #13#10 + 'перед КЕКВ "' + cShNewParent +
                                                  ' ' + cNmNewParent + '"?:';
      if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Result := true;
    end;
    qryStz.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStzGoTo.Open2QryStz(nCurAIndx, nCurPIndx : LongInt);
begin
  with qryStz do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KdStZ + ' order by AIndx');
    Open;
    // постараться стать поближе к переносимому
    if not Locate('AIndx', nCurAIndx-5, []) then
      Locate('AIndx', nCurAIndx-6, []);
  end;
end;
//------------------------------------------------------------------------------
function StzGoToParent(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
var cShNewParent, cNmNewParent, cMsg : string;
begin
  Result := false;
  FormStzGoTo := TFormStzGoTo.Create(Application);
  with FormStzGoTo do begin
    Caption := 'Перенос в другой узел';
    cMsg := 'Вы можете перенести КЕКВ "' + cShCurItem + ' ' + cNmCurItem + '"';
    if bCurHsCh then
      cMsg := cMsg + ' и всех его "детей"';
    cMsg := cMsg + ' внутрь одного из существующих узлов';
    LabelInf.Caption := cMsg;;
    OpenQryStz(nCurAIndx, nCurPIndx);
    if ShowModal = mrOk then begin
      nNewPIndx := qryStz.FieldByName('Indx').AsInteger;
      nAIndxNewParent := qryStz.FieldByName('AIndx').AsInteger;
      cShNewParent := qryStz.FieldByName('ShStZ').AsString;
      cNmNewParent := qryStz.FieldByName('NmStZ').AsString;
      cMsg := 'Хотите перенести КЕКВ "' + cShCurItem + ' ' + cNmCurItem + '"';
      if bCurHsCh then
        cMsg := cMsg + ' и всех его "детей"';
      cMsg := cMsg + #13#10 + 'внутрь КЕКВ "' + cShNewParent +
                                                  ' ' + cNmNewParent + '"?:';
      if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Result := true;
    end;
    qryStz.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStzGoTo.OpenQryStz(nCurAIndx, nCurPIndx : LongInt);
begin
  with qryStz do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Select * from ' + tbl_KdStZ + ' where ' +
            ' (AIndx <> :nAIndx) and (Indx <> :nIndx) order by AIndx');
    ParamByName('nAIndx').AsInteger := nCurAIndx;
    ParamByName('nIndx').AsInteger := nCurPIndx;
    Open;
    // постараться стать поближе к переносимому
    if not Locate('AIndx', nCurAIndx-5, []) then
      Locate('AIndx', nCurAIndx-6, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStzGoTo.dbgrStzDrawColumnCell(Sender: TObject;
                        const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                       State: TGridDrawState);
begin
  with dbgrStz.Canvas do begin
    if not (gdFocused in State) then begin
      if qryStz.FieldByName('HsCh').AsString = 'T' then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrStz.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormStzGoTo.qryStzCalcFields(DataSet: TDataSet);
var cMsg : string; i : integer;
begin
  cMsg := qryStzShStZ.AsString + ' ' + qryStzNmStZ.AsString;
  for i := 1 to qryStzLvl.AsInteger do
    cMsg := '        ' + cMsg;
  qryStzTreeFld.AsString := cMsg;
end;
//------------------------------------------------------------------------------
procedure TFormStzGoTo.dbgrStzDblClick(Sender: TObject);
begin
  if (qryStz.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormStzGoTo.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Top    := ReadInteger(SECTION, 'wT', 250);
    Left   := ReadInteger(SECTION, 'wL', 100);
    Height := ReadInteger(SECTION, 'wH', 425);
    Width  := ReadInteger(SECTION, 'wW', 455);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormStzGoTo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;

end.
