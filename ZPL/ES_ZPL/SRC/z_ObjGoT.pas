unit z_ObjGoT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, ExtCtrls, IniFiles,
  ComCtrls;

type
  TFormObjGoTo = class(TForm)
    qryTV: TQuery;
    dsrcTV: TDataSource;
    LabelInf: TLabel;
    Label1: TLabel;
    dbgrTV: TDBGrid;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryTVNR: TIntegerField;
    qryTVKDOBJ: TSmallintField;
    qryTVSHOBJ: TStringField;
    qryTVNMOBJ: TStringField;
    qryTVAINDX: TSmallintField;
    qryTVPINDX: TSmallintField;
    qryTVLVL: TSmallintField;
    qryTVINDX: TSmallintField;
    qryTVHSCH: TStringField;
    qryTVKDSPZ: TSmallintField;
    qryTVKDUPOS: TSmallintField;
    qryTVKASSA: TSmallintField;
    qryTVFIOUPOLN: TStringField;
    qryTVTreeFld: TStringField;
    procedure dbgrTVDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrTVDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryTVCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure OpenqryTV(nCurAIndx, nCurPIndx : LongInt);
    procedure Open2qryTV(nCurAIndx, nCurPIndx : LongInt);
  public
    { Public declarations }
  end;

function ObjGoToParent(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
function ObjMoveTo(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;

const SECTION = 'a_ObjGoT';

var
  FormObjGoTo: TFormObjGoTo;

implementation

uses A_Dm, a_Const;

{$R *.dfm}

function ObjMoveTo(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
var cShNewParent, cNmNewParent, cMsg : string;
begin
  Result := false;
  FormObjGoTo := TFormObjGoTo.Create(Application);
  with FormObjGoTo do begin
    Caption := 'Расположить перед заданным узлом';
    cMsg := 'Можно расположить подразделение "' + cShCurItem +
                                            ' ' + cNmCurItem + '"';
    if bCurHsCh then
      cMsg := cMsg + ' и всех его "детей"';
    cMsg := cMsg + ' перед заданным Вами подразделением';
    LabelInf.Caption := cMsg;;
    Open2qryTV(nCurAIndx, nCurPIndx);
    if ShowModal = mrOk then begin
      nNewPIndx := qryTV.FieldByName('Indx').AsInteger;
      nAIndxNewParent := qryTV.FieldByName('AIndx').AsInteger;
      cShNewParent := qryTV.FieldByName('KdObj').AsString;
      cNmNewParent := qryTV.FieldByName('NmObj').AsString;
      cMsg := 'Хотите расположить подразделение "' + cShCurItem +
                                                ' ' + cNmCurItem + '"';
      if bCurHsCh then
        cMsg := cMsg + ' и всех его "детей"';
      cMsg := cMsg + #13#10 + 'перед подразделением "' + cShNewParent +
                                                  ' ' + cNmNewParent + '"?:';
      if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Result := true;
    end;
    qryTV.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormObjGoTo.Open2qryTV(nCurAIndx, nCurPIndx : LongInt);
begin
  with qryTV do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_KdObj order by AIndx');
    Open;
    // постараться стать поближе к переносимому
    if not Locate('AIndx', nCurAIndx-5, []) then
      Locate('AIndx', nCurAIndx-6, []);
  end;
end;
//------------------------------------------------------------------------------
function ObjGoToParent(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
var cShNewParent, cNmNewParent, cMsg : string;
begin
  Result := false;
  FormObjGoTo := TFormObjGoTo.Create(Application);
  with FormObjGoTo do begin
    Caption := 'Перенос в другой узел';
    cMsg := 'Можно перенести подразделене "' + cShCurItem +
                                         ' ' + cNmCurItem + '"';
    if bCurHsCh then
      cMsg := cMsg + ' и всех его "детей"';
    cMsg := cMsg + ' внутрь одного из существующих узлов';
    LabelInf.Caption := cMsg;;
    OpenqryTV(nCurAIndx, nCurPIndx);
    if ShowModal = mrOk then begin
      nNewPIndx := qryTV.FieldByName('Indx').AsInteger;
      nAIndxNewParent := qryTV.FieldByName('AIndx').AsInteger;
      cShNewParent := qryTV.FieldByName('KdObj').AsString;
      cNmNewParent := qryTV.FieldByName('NmObj').AsString;
      cMsg := 'Хотите перенести подразделение "' + cShCurItem +
                                             ' ' + cNmCurItem + '"';
      if bCurHsCh then
        cMsg := cMsg + ' и всех его "детей"';
      cMsg := cMsg + #13#10 + 'внутрь подразделения "' + cShNewParent +
                                                  ' ' + cNmNewParent + '"?:';
      if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Result := true;
    end;
    qryTV.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormObjGoTo.OpenQryTV(nCurAIndx, nCurPIndx : LongInt);
begin
  with qryTV do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('select * from z_KdObj where ' +
            ' (AIndx <> :nAIndx) and (Indx <> :nIndx) ' +
            ' order by AIndx, Lvl, PIndx');
    ParamByName('nAIndx').AsInteger := nCurAIndx;
    ParamByName('nIndx').AsInteger := nCurPIndx;
    Open;
    // постараться стать чуть выше переносимого
    if not Locate('AIndx', nCurAIndx-5, []) then
      Locate('AIndx', nCurAIndx-6, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormObjGoTo.dbgrTVDrawColumnCell(Sender: TObject;
                        const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                       State: TGridDrawState);
begin
  with dbgrTV.Canvas do begin
    if not (gdFocused in State) then begin
      if qryTV.FieldByName('HsCh').AsString = 'T' then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrTV.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormObjGoTo.qryTVCalcFields(DataSet: TDataSet);
var cMsg : string; i : integer;
begin
  cMsg := qryTVKdObj.AsString + ' ' + qryTVShObj.AsString +
                                ' ' + qryTVNmObj.AsString;
  for i := 1 to qryTVLvl.AsInteger do
    cMsg := '        ' + cMsg;
  qryTVTreeFld.AsString := cMsg;
end;
//------------------------------------------------------------------------------
procedure TFormObjGoTo.dbgrTVDblClick(Sender: TObject);
begin
  if (qryTV.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormObjGoTo.FormCreate(Sender: TObject);
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
procedure TFormObjGoTo.FormClose(Sender: TObject; var Action: TCloseAction);
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
