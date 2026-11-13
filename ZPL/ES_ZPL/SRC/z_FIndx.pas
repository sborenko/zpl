unit z_FIndx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DBCtrls, StdCtrls, DB, Grids, DBGrids, DBTables, Buttons,
  ExtCtrls, Menus;

type
  TFormFixIndx = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qryFIndx: TQuery;
    dsrcFIndx: TDataSource;
    updFIndx: TUpdateSQL;
    dbgrFIndx: TDBGrid;
    qryFIndxFAM: TStringField;
    qryFIndxIMA: TStringField;
    qryFIndxOTCH: TStringField;
    qryFIndxNR: TIntegerField;
    qryFIndxTABN: TIntegerField;
    qryFIndxFIXMES: TDateTimeField;
    qryFIndxFIXSMM: TFloatField;
    qryFIndxNOTES: TStringField;
    qryFIndxFamIO: TStringField;
    LabelCntRec: TLabel;
    DBNavigator1: TDBNavigator;
    qryTmp: TQuery;
    qryFIndxF_SMM: TFloatField;
    qryFIndxD_OKLNDB: TFloatField;
    qryFIndxLASTDTUV: TDateTimeField;
    sBtnPrt: TSpeedButton;
    pop: TPopupMenu;
    popSort: TMenuItem;
    popSortBySm: TMenuItem;
    popSortByTabN: TMenuItem;
    popSortByFIO: TMenuItem;
    popDelRec: TMenuItem;
    popDelUvoln: TMenuItem;
    popSep1: TMenuItem;
    qryFIndxDEL: TStringField;
    qryFIndxDT_PRIEM: TDateTimeField;
    qryFIndxMYFLD: TStringField;
    procedure qryFIndxCalcFields(DataSet: TDataSet);
    procedure dbgrFIndxEnter(Sender: TObject);
    procedure dbgrFIndxExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryFIndxAfterPost(DataSet: TDataSet);
    procedure qryFIndxAfterDelete(DataSet: TDataSet);
    procedure qryFIndxBeforePost(DataSet: TDataSet);
    procedure dbgrFIndxDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popSortBySmClick(Sender: TObject);
    procedure popSortByTabNClick(Sender: TObject);
    procedure popSortByFIOClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure popDelUvolnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure popDelRecClick(Sender: TObject);
  private
    { Private declarations }
    n_SvTabN : integer;
    n_SortCase : SmallInt;
    procedure QpenQryFIndx;
    function GetFIndxNextNR : integer;
    function GetFIO(nTabN : integer;
                            var cFam, cIma, cOtch : ShortString) : boolean;
  public
    { Public declarations }
  end;

procedure ShwFxIndx;

const SECTION = 'z_FIndx';

var
  FormFixIndx: TFormFixIndx;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, z_GtDate, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwFxIndx;
begin
  FormFixIndx := TFormFixIndx.Create(Application);
  with FormFixIndx do begin
    Caption := 'Таблица фиксированных сумм индексации';
    QpenQryFIndx;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.QpenQryFIndx;
var nSvTabN : integer;
begin
  nSvTabN := 0;
  with qryFIndx do begin
    if Active then begin
      nSvTabN := qryFIndxTabN.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, pu.Dt_Priem, pu.Dt_Uvoln LastDtUv, ' +
            ' f.NR, f.TabN, f.FixMes, f.FixSmm, f.Notes, f.F_SMM, ' +
            ' f.D_OklNdb, f.Del, f.MyFld from z_FixIndx f ' +
            ' Left Outer Join z_Upi u on u.TabN = f.TabN ' +
            ' Left Outer Join z_LastPrmUv (f.TabN) pu on 1=1 ');
    if n_SortCase = 0 then
      SQL.Add(' order by f.F_Smm, f.TabN, f.FixMes')
    else if n_SortCase = 1 then
      SQL.Add(' order by f.TabN, f.FixMes')
    else
      SQL.Add(' order by u.Fam, u.Ima, u.Otch, f.TabN, f.FixMes');
    Open;
    if nSvTabN <> 0 then
      Locate('TabN', nSvTabN, [])
    else
      Locate('TabN', n_SvTabN, []);
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.qryFIndxCalcFields(DataSet: TDataSet);
begin
  qryFIndxFamIO.AsString := MyFamIO(qryFIndxFam.AsString, qryFIndxIma.AsString,
                                                         qryFIndxOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.dbgrFIndxEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.dbgrFIndxExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 430);
    Width  := ReadInteger(SECTION, 'wW', 485);
    n_SvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    n_SortCase := ReadInteger(SECTION, 'nSortCase', 1);
    Free;
  end;
  if n_SortCase = 0 then begin
    popSortBySm.Checked   := true;
    popSortByTabN.Checked := false;
    popSortByFIO.Checked  := false; end
  else if n_SortCase = 1 then begin
    popSortBySm.Checked   := false;
    popSortByTabN.Checked := true;
    popSortByFIO.Checked  := false; end
  else {if n_SortCase = 2 then} begin
    popSortBySm.Checked   := false;
    popSortByTabN.Checked := false;
    popSortByFIO.Checked  := true;
  end;
  if FileExists(cDirVids + 'FIndx_05.vid') then
    dbgrFIndx.Columns.LoadFromFile(cDirVids + 'FIndx_05.vid');
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrFIndx.Columns.SaveToFile(cDirVids + 'FIndx_05.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvTabN', qryFIndxTabN.AsInteger);
    WriteInteger(SECTION, 'nSortCase', n_SortCase);
    Free;
  end;
end;
//------------------------------------------------------------------------------
function TFormFixIndx.GetFIndxNextNR: integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Gen_ID(z_FixMes_NR, 0) NextNR from rdb$database');
    Open;
    Result := FieldByName('NextNR').AsInteger;
    Close;
  end;
end;
//------------------------------------------------------------------------------
function TFormFixIndx.GetFIO(nTabN: integer;
                                  var cFam, cIma, cOtch: ShortString): boolean;
begin
  Result := false;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Fam, Ima, Otch from z_Upi where TabN = :nTabN');
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    if RecordCount > 0 then begin
      cFam  := FieldByName('Fam').AsString;
      cIma  := FieldByName('Ima').AsString;
      cOtch := FieldByName('Otch').AsString;
      Result := true;
    end;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.qryFIndxBeforePost(DataSet: TDataSet);
var nDbgNextNR, nTabN : integer;  cFam, cIma, cOtch : ShortString;
begin
  if qryFIndxTabN.IsNull or (qryFIndxTabN.AsInteger <= 0) then
    Raise Exception.Create('Плохой табельный номер');
  if qryFIndxNR.IsNull then begin
    nDbgNextNR := GetFIndxNextNR;
    qryFIndxNR.AsInteger := nDbgNextNR;
  end;
  if qryFIndxFam.IsNull then begin
    nTabN := qryFIndxTabN.AsInteger;
    if GetFIO(nTabN, cFam, cIma, cOtch) then begin
      qryFIndxFam.AsString  := cFam;
      qryFIndxIma.AsString  := cIma;
      qryFIndxOtch.AsString := cOtch;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.qryFIndxAfterPost(DataSet: TDataSet);
var nSvNR : integer;
begin
  with qryFIndx do begin
    if UpdatesPending then begin
      Form_Dm.DbMain.ApplyUpdates([qryFIndx]);
      nSvNR := qryFIndxNR.AsInteger;
      Close;
      Open;
      Locate('NR', nSvNR, []);
      LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.qryFIndxAfterDelete(DataSet: TDataSet);
begin
  if qryFIndx.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryFIndx]);
  LabelCntRec.Caption := 'Записей: ' + IntToStr(qryFIndx.RecordCount);
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.dbgrFIndxDrawColumnCell(Sender: TObject;
                         const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrFIndx.Canvas do begin
    if qryFIndxDel.AsBoolean then begin
      Font.Color := clGray;
      Font.Style := [];
    end;
    cFldNm := UpperCase(Column.FieldName);
    if ((cFldNm = 'FIXSMM') or (cFldNm = 'FIXSMM') or (cFldNm = 'D_OKLNDB')) and
                                                 (Column.Field.AsFloat < 0) then
      Font.Color := clRed;
    if (qryFIndx.FieldByName('MyFld').AsString = '222') and
                                         not (gdFocused in State) then
      Brush.Color := clCream;
  end;
  dbgrFIndx.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.popSortBySmClick(Sender: TObject);
begin
  if not popSortBySm.Checked then begin
    n_SortCase := 0;
    popSortBySm.Checked   := true;
    popSortByTabN.Checked := false;
    popSortByFIO.Checked  := false;
    QpenQryFIndx;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.popSortByTabNClick(Sender: TObject);
begin
  if not popSortByTabN.Checked then begin
    n_SortCase := 1;
    popSortBySm.Checked   := false;
    popSortByTabN.Checked := true;
    popSortByFIO.Checked  := false;
    QpenQryFIndx;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.popSortByFIOClick(Sender: TObject);
begin
  if not popSortByFIO.Checked then begin
    n_SortCase := 2;
    popSortBySm.Checked   := false;
    popSortByTabN.Checked := false;
    popSortByFIO.Checked  := true;
    QpenQryFIndx;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.sBtnPrtClick(Sender: TObject);
begin
  F6_PrtFixIndx(qryFIndx);   {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.FormKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
    ShowMessage('Нельзя использовать комбинацию <Ctrl/Delete>.' + #13#10 +
                'Где  нужно,  пользуйтесь  контекстными  меню.');
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.popDelRecClick(Sender: TObject);
begin
  if MessageDlg('Запись удаляется безвозвратно. Согласны?:', mtWarning,
                                        [mbYes, mbNo], 0) = mrYes then begin
    qryFIndx.Delete;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFixIndx.popDelUvolnClick(Sender: TObject);
var cPrompt : ShortString; dTDate : TDateTime; nSvNR : integer;
begin
  cPrompt := 'Пометить "удалёнными" записи с датами ' +
             'увольнения до (включительно):';
  dTDate := Date;
  if MyGetDate(cPrompt, dTDate) {z_GtDate} then with qryFIndx do begin
    nSvNR := qryFIndxNR.AsInteger;
    DisableControls;
    First;
    while not Eof do begin
      if not qryFIndxLastDtUv.IsNull and
                       (qryFIndxLastDtUv.AsDateTime <= dTDate) then begin
        Edit;
        qryFIndxDel.AsString := 'Y';
        Post;
      end;
      Next;
    end;
    Locate('NR', nSvNR, []);
    EnableControls;
  end;
end;

end.
