unit a_SbuGoT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, Buttons, ExtCtrls, IniFiles,
  ComCtrls;

type
  TFormSbuGoTo = class(TForm)
    qrySbu: TQuery;
    dsrcSbu: TDataSource;
    LabelInf: TLabel;
    Label1: TLabel;
    qrySbuNR: TIntegerField;
    qrySbuKDSCH: TSmallintField;
    qrySbuSCHBU: TStringField;
    qrySbuNMSCH: TStringField;
    qrySbuAINDX: TSmallintField;
    qrySbuPINDX: TSmallintField;
    qrySbuLVL: TSmallintField;
    qrySbuINDX: TSmallintField;
    qrySbuHSCH: TStringField;
    qrySbuTreeFld: TStringField;
    dbgrSbu: TDBGrid;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure dbgrSbuDrawColumnCell(Sender: TObject; const Rect: TRect;
                     DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrSbuDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrySbuCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure OpenQrySbu(nCurAIndx, nCurPIndx : LongInt);
    procedure Open2QrySbu(nCurAIndx, nCurPIndx : LongInt);
  public
    { Public declarations }
  end;

function SbuGoToParent(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
function SbuMoveTo(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nParentKdSBU : SmallInt;
                       var cParentSchBU : ShortString;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
                       // на самом деле это не parent, а перед которым поставить
const SECTION = 'a_SbuGoT';

var
  FormSbuGoTo: TFormSbuGoTo;

implementation

uses A_Dm, a_Const;

{$R *.dfm}

function SbuMoveTo(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nParentKdSBU : SmallInt;
                       var cParentSchBU : ShortString;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
var cShNewParent, cNmNewParent, cMsg : string;
begin
  Result := false;
  FormSbuGoTo := TFormSbuGoTo.Create(Application);
  with FormSbuGoTo do begin
    Caption := 'Расположить перед заданным узлом';
    cMsg := 'Вы можете расположить счёт "' + cShCurItem + ' ' + cNmCurItem + '"';
    if bCurHsCh then
      cMsg := cMsg + ' и всех его "детей"';
    cMsg := cMsg + ' перед заданным Вами счётом';
    LabelInf.Caption := cMsg;;
    Open2QrySbu(nCurAIndx, nCurPIndx);
    if ShowModal = mrOk then begin
      nNewPIndx := qrySbu.FieldByName('Indx').AsInteger;
      nAIndxNewParent := qrySbu.FieldByName('AIndx').AsInteger;
      nParentKdSBU := qrySbu.FieldByName('KdSch').AsInteger;
      cShNewParent := qrySbu.FieldByName('SchBu').AsString;
      cNmNewParent := qrySbu.FieldByName('NmSch').AsString;
      cParentSchBU := cShNewParent;
      cMsg := 'Хотите расположить счёт "' + cShCurItem + ' ' + cNmCurItem + '"';
      if bCurHsCh then
        cMsg := cMsg + ' и всех его "детей"';
      cMsg := cMsg + #13#10 + 'перед счётом "' + cShNewParent +
                                                  ' ' + cNmNewParent + '"?:';
      if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Result := true;
    end;
    qrySbu.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSbuGoTo.Open2QrySbu(nCurAIndx, nCurPIndx : LongInt);
begin
  with qrySbu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from ' + tbl_KdSbu + ' order by AIndx');
    Open;
    // постараться стать поближе к переносимому
    if not Locate('AIndx', nCurAIndx-5, []) then
      Locate('AIndx', nCurAIndx-6, []);
  end;
end;
//------------------------------------------------------------------------------
function SbuGoToParent(cShCurItem, cNmCurItem : string; bCurHsCh : boolean;
                       nCurAIndx, nCurPIndx : LongInt;
                       var nNewPIndx, nAIndxNewParent : LongInt) : boolean;
var cShNewParent, cNmNewParent, cMsg : string;
begin
  Result := false;
  FormSbuGoTo := TFormSbuGoTo.Create(Application);
  with FormSbuGoTo do begin
    Caption := 'Перенос в другой узел';
    cMsg := 'Вы можете перенести счёт "' + cShCurItem + ' ' + cNmCurItem + '"';
    if bCurHsCh then
      cMsg := cMsg + ' и всех его "детей"';
    cMsg := cMsg + ' внутрь одного из существующих узлов';
    LabelInf.Caption := cMsg;;
    OpenQrySbu(nCurAIndx, nCurPIndx);
    if ShowModal = mrOk then begin
      nNewPIndx := qrySbu.FieldByName('Indx').AsInteger;
      nAIndxNewParent := qrySbu.FieldByName('AIndx').AsInteger;
      cShNewParent := qrySbu.FieldByName('SchBu').AsString;
      cNmNewParent := qrySbu.FieldByName('NmSch').AsString;
      cMsg := 'Хотите перенести счёт "' + cShCurItem + ' ' + cNmCurItem + '"';
      if bCurHsCh then
        cMsg := cMsg + ' и всех его "детей"';
      cMsg := cMsg + #13#10 + 'внутрь счёта "' + cShNewParent +
                                                  ' ' + cNmNewParent + '"?:';
      if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Result := true;
    end;
    qrySbu.Close;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSbuGoTo.OpenQrySbu(nCurAIndx, nCurPIndx : LongInt);
begin
  with qrySbu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN; 
    SQL.Add('Select * from ' + tbl_KdSbu + ' where ' +
            ' (AIndx <> :nAIndx) and (Indx <> :nIndx) order by AIndx');
    ParamByName('nAIndx').AsInteger := nCurAIndx;
    ParamByName('nIndx').AsInteger := nCurPIndx;
    Open;
    // постараться стать чуть выше переносимого
    if not Locate('AIndx', nCurAIndx-5, []) then
      Locate('AIndx', nCurAIndx-6, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSbuGoTo.dbgrSbuDrawColumnCell(Sender: TObject;
                        const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                       State: TGridDrawState);
begin
  with dbgrSbu.Canvas do begin
    if not (gdFocused in State) then begin
      if qrySbu.FieldByName('HsCh').AsString = 'T' then
        Font.Color := clMaroon
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrSbu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormSbuGoTo.qrySbuCalcFields(DataSet: TDataSet);
var cMsg : string; i : integer;
begin
  cMsg := qrySbuSchBU.AsString + ' ' + qrySbuNmSch.AsString;
  for i := 1 to qrySbuLvl.AsInteger do
    cMsg := '        ' + cMsg;
  qrySbuTreeFld.AsString := cMsg;
end;
//------------------------------------------------------------------------------
procedure TFormSbuGoTo.dbgrSbuDblClick(Sender: TObject);
begin
  if (qrySbu.RecordCount > 0) then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormSbuGoTo.FormCreate(Sender: TObject);
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
procedure TFormSbuGoTo.FormClose(Sender: TObject; var Action: TCloseAction);
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
