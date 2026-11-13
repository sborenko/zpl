unit z_FFInd2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBClient, DBTables, DBCtrls;

type
  TFormCreFIndx2 = class(TForm)
    Panel1: TPanel;
    bBtnClose: TBitBtn;
    qryTmp: TQuery;
    cdsFix: TClientDataSet;
    dstcFix: TDataSource;
    dbgrFix: TDBGrid;
    sBtnStep1: TSpeedButton;
    sBtnStep2: TSpeedButton;
    sBtnStep3: TSpeedButton;
    sBtnStep4: TSpeedButton;
    LabelCntFixRec: TLabel;
    DBNavigator1: TDBNavigator;
    sBtnSaveToBD: TSpeedButton;
    sBtnPrt: TSpeedButton;
    cdsFixNR: TAutoIncField;
    cdsFixTabN: TIntegerField;
    cdsFixFamIO: TStringField;
    cdsFixDtPriem: TDateField;
    cdsFixDtUvoln: TDateField;
    cdsFixKdObj: TSmallintField;
    cdsFixKdKatP: TSmallintField;
    cdsFixSO: TSmallintField;
    cdsFixCmbOkl: TStringField;
    cdsFixDtBeg_0: TDateField;
    cdsFixOklNdb_0: TFloatField;
    cdsFixDtBeg_1: TDateField;
    cdsFixOklNdb_1: TFloatField;
    cdsFixSmDelta: TFloatField;
    cdsFixSmFixIndx: TFloatField;
    cdsFixOklTrf_0: TFloatField;
    cdsFixOklTrf_1: TFloatField;
    cdsFixSmDeltaON: TFloatField;
    qryON: TQuery;
    qryOtkl: TQuery;
    cdsFixSmOldIndx: TFloatField;
    cdsFixIndxNotes: TStringField;
    sBtnGoToTabN: TSpeedButton;
    qrySps: TQuery;
    sBtnLoadCds: TSpeedButton;
    sBtnSaveCds: TSpeedButton;
    qryFIndx: TQuery;
    updFIndx: TUpdateSQL;
    qryFIndxNR: TIntegerField;
    qryFIndxTABN: TIntegerField;
    qryFIndxLASTDTUV: TDateTimeField;
    qryFIndxFIXMES: TDateTimeField;
    qryFIndxFIXSMM: TFloatField;
    qryFIndxNOTES: TStringField;
    qryFIndxF_SMM: TFloatField;
    qryFIndxD_OKLNDB: TFloatField;
    qryFIndxDEL: TStringField;
    qryFIndxMYFLD: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrFixEnter(Sender: TObject);
    procedure dbgrFixExit(Sender: TObject);
    procedure sBtnStep1Click(Sender: TObject);
    procedure sBtnStep2Click(Sender: TObject);
    procedure sBtnStep3Click(Sender: TObject);
    procedure dbgrFixDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnStep4Click(Sender: TObject);
    procedure bBtnCloseClick(Sender: TObject);
    procedure sBtnGoToTabNClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sBtnLoadCdsClick(Sender: TObject);
    procedure sBtnSaveCdsClick(Sender: TObject);
    procedure sBtnSaveToBDClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    nSvTabN : integer;
    procedure CreOpenCdsFix;
    procedure AddRecInCdsFix_1;
    function SumOklNdb(nTabN : integer) : double;
    procedure AddRecInQryFIndx;
  public
    { Public declarations }
  end;

procedure ShwFixIndx2;

const SECTION = 'z_FFInd2';

var
  FormCreFIndx2: TFormCreFIndx2;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwFixIndx2;
begin
  if not bIsFormCreFIndx2 then begin
    FormCreFIndx2 := TFormCreFIndx2.Create(Application);
    with FormCreFIndx2 do begin
      Caption := 'Создание таблицы фиксированной индексации_2';
      LabelCntFixRec.Caption := '';
      CreOpenCdsFix;
      bIsFormCreFIndx2 := true;
      Show;
    end; end
  else begin
    if FormCreFIndx2.WindowState = wsMinimized then
      FormCreFIndx2.WindowState := wsNormal;
    FormCreFIndx2.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.CreOpenCdsFix;
begin
  with cdsFix do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 455);
    Width  := ReadInteger(SECTION, 'wW', 595);
    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    Free;
  end;
  if FileExists(cDirVids + 'FFInd2.vid') then
    dbgrFix.Columns.LoadFromFile(cDirVids + 'FFInd2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormCreFIndx2 := false;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrFix.Columns.SaveToFile(cDirVids + 'FFInd2.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvTabN', cdsFix.FieldByName('TabN').AsInteger);
    Free;
  end;
  Action := caFree;
  bIsFormCreFIndx2 := false;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.dbgrFixEnter(Sender: TObject);
begin
  dbgrFix.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.dbgrFixExit(Sender: TObject);
begin
  dbgrFix.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.sBtnStep1Click(Sender: TObject);
begin
  LabelCntFixRec.Caption := '';
  sBtnSaveCds.Enabled := false;
  sBtnGoToTabN.Enabled := false;
  sBtnSaveToBD.Enabled := false;
  sBtnPrt.Enabled := false;
  with qryON do begin {Оклады с надбавками}
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_GetOklNdb (:nTabN, "10/01/2014", "10/31/2014")');
  end;
  with qryTmp do begin;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, p.* from z_Pere p ' +
            ' Left Outer Join z_Upi u on u.TabN = p.TabN ' +
            ' where p.Dt_Beg = "10/01/2014" and p.OklTrf > 0 and ' +
            ' (p.Sovm is Null or p.Sovm = 0) order by p.TabN');
    Open;
    First;
    while not Eof do begin
      AddRecInCdsFix_1;
      Next;
    end;
    LabelCntFixRec.Caption := 'Записей: ' + IntToStr(cdsFix.RecordCount);
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  sBtnStep1.Enabled := false;
  sBtnStep2.Enabled := true;
end;
//------------------------------------------------------------------------------
function TFormCreFIndx2.SumOklNdb(nTabN: integer): double;
begin
  with qryON do begin {Оклады с надбавками}
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Result := FieldByName('SmOklNdb').AsFloat;
    Close;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.AddRecInCdsFix_1;
var cFamIO : ShortString; nSmOklNdb : double;
begin
  cFamIO := MyFamIO(qryTmp.FieldByName('Fam').AsString,
                           qryTmp.FieldByName('Ima').AsString,
                                  qryTmp.FieldByName('Otch').AsString);
  nSmOklNdb := SumOklNdb(qryTmp.FieldByName('TabN').AsInteger);
  with cdsFix do begin
    Append;
    FieldByName('TabN').AsString     := qryTmp.FieldByName('TabN').AsString;
    FieldByName('FamIO').AsString    := cFamIO;
    FieldByName('KdObj').AsString    := qryTmp.FieldByName('KdObj').AsString;
    FieldByName('KdKatP').AsString   := qryTmp.FieldByName('KdKatP').AsString;
    FieldByName('DtBeg_1').AsString  := qryTmp.FieldByName('Dt_Beg').AsString;
    FieldByName('OklNdb_1').AsFloat := nSmOklNdb;
    FieldByName('OklTrf_1').AsString := qryTmp.FieldByName('OklTrf').AsString;
    FieldByName('SO').AsString       := qryTmp.FieldByName('SO').AsString;
    FieldByName('CmbOkl').AsString   := qryTmp.FieldByName('CmbOkl').AsString;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.sBtnStep2Click(Sender: TObject);
begin
  with qryTmp do begin;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 TabN, Dt_Priem, Dt_Uvoln from z_PrmUv ' +
            ' where TabN = :nTabN order by Dt_Priem desc');
  end;
  with cdsFix do begin
    First;
    while not Eof do begin
      qryTmp.Close;
      qryTmp.ParamByName('nTabN').AsInteger := FieldByName('TabN').AsInteger;
      qryTmp.Open;
      Edit;
      FieldByName('DtPriem').AsString := qryTmp.FieldByName('Dt_Priem').AsString;
      FieldByName('DtUvoln').AsString := qryTmp.FieldByName('Dt_Uvoln').AsString;
      Post;
      Next;
    end;
  end;
  sBtnStep2.Enabled := false;
  sBtnStep3.Enabled := true;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.sBtnStep3Click(Sender: TObject);
var nTabN : integer; nSmOklNdb_0 : double;
    nY, nM, nD : word;  dDtBM, dDtEM : TDateTime;
begin
  with qryON do begin {Оклады с надбавками}
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from z_GetOklNdb (:nTabN, :dDtPrc, :dDtEPrc)');
  end;
  with qryTmp do begin;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 TabN, Dt_Beg, OklTrf from z_Pere ' +
            ' where TabN = :nTabN and Dt_Beg < "10/01/2014" ' +
            ' order by Dt_Beg desc');
  end;
  with cdsFix do begin
    First;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      qryTmp.Close;
      qryTmp.ParamByName('nTabN').AsInteger := nTabN;
      qryTmp.Open;
      if qryTmp.RecordCount > 0 then begin
        qryON.Close;
        qryON.ParamByName('nTabN').AsInteger := nTabN;
        dDtBM := qryTmp.FieldByName('Dt_Beg').AsDateTime;
        DecodeDate(dDtBM, nY, nM, nD);
        dDtBM := EncodeDate(nY,nM, 1);
        dDtEM := MyLastDOM(dDtBM);
        qryON.ParamByName('dDtPrc').AsDateTime := dDtBM;
        qryON.ParamByName('dDtEPrc').AsDateTime := dDtEM;
        qryON.Open;
        nSmOklNdb_0 := qryON.FieldByName('SmOklNdb').AsFloat;
        Edit;
        FieldByName('DtBeg_0').AsString  := qryTmp.FieldByName('Dt_Beg').AsString;
        FieldByName('OklTrf_0').AsString := qryTmp.FieldByName('OklTrf').AsString;
        FieldByName('SmDelta').AsFloat   := FieldByName('OklTrf_1').AsFloat -
                                           qryTmp.FieldByName('OklTrf').AsFloat;
        FieldByName('OklNdb_0').AsFloat := nSmOklNdb_0;
        FieldByName('SmDeltaON').AsFloat := FieldByName('OklNdb_1').AsFloat -
                                                                    nSmOklNdb_0;
        Post;
      end;
      Next;
    end;
  end;
  sBtnStep3.Enabled := false;
  sBtnStep4.Enabled := true;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with qryON do begin {Оклады с надбавками}
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.dbgrFixDrawColumnCell(Sender: TObject;
                          const Rect: TRect; DataCol: Integer; Column: TColumn;
                                                         State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrFix.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if ((cFldNm = 'SMDELTA') or (cFldNm = 'SMDELTAON') or
               (cFldNm = 'SMFIXIND')) and (Column.Field.AsFloat < 0) then
      Font.Color := clRed;
  end;
  dbgrFix.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.sBtnStep4Click(Sender: TObject);
var nSmOldIndx, nSmFix : double;
begin
  with qryOtkl do begin;
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Notes, Sum(Summa) SMM from Z_Otkl where TabN = :nTabN and ' +
            ' DtProc > "09/01/2014"  and ZaMesGod = "09/01/2014" and ' +
            ' VidN = "1620" and Notes Starting with "БМ =" group by Notes');
  end;
  with cdsFix do begin
    First;
    while not Eof do begin
      qryOtkl.Close;
      qryOtkl.ParamByName('nTabN').AsInteger := FieldByName('TabN').AsInteger;
      qryOtkl.Open;
      if RecordCount > 0 then begin
        nSmOldIndx := qryOtkl.FieldByName('Smm').AsFloat;
        nSmFix := nSmOldIndx - FieldByName('SmDeltaON').AsFloat;
        if nSmFix > 0 then begin
          Edit;
          FieldByName('SmFixIndx').AsFloat := nSmFix;
          FieldByName('SmOldIndx').AsFloat := nSmOldIndx;
          FieldByName('IndxNotes').AsString :=
                                 Trim(qryOtkl.FieldByName('Notes').AsString);
          Post;
        end;
      end;
      Next;
    end;
  end;
  sBtnStep4.Enabled := false;
  with qryOtkl do begin;
    if Active then Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  sBtnSaveCds.Enabled := cdsFix.RecordCount > 0;
  sBtnGoToTabN.Enabled := cdsFix.RecordCount > 0;
  sBtnSaveToBD.Enabled := cdsFix.RecordCount > 0;
  sBtnPrt.Enabled := cdsFix.RecordCount > 0;
  if bFlagDbg then
    cdsFix.SaveToFile(cDirTemp + 'Fix2.cds');
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.bBtnCloseClick(Sender: TObject);
begin
//  if cdsFix.RecordCount > 0 then
//    cdsFix.SaveToFile(cDirTemp + 'Fix2_1.cds');
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.sBtnLoadCdsClick(Sender: TObject);
begin
  if FileExists(cDirTemp + 'Fix2_1.cds') then
    cdsFix.LoadFromFile(cDirTemp + 'Fix2_1.cds');
  LabelCntFixRec.Caption := 'Записей: ' + IntToStr(cdsFix.RecordCount);
  sBtnSaveCds.Enabled := cdsFix.RecordCount > 0;
  sBtnGoToTabN.Enabled := cdsFix.RecordCount > 0;
  sBtnSaveToBD.Enabled := cdsFix.RecordCount > 0;
  sBtnPrt.Enabled := cdsFix.RecordCount > 0;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.sBtnSaveCdsClick(Sender: TObject);
begin
  cdsFix.SaveToFile(cDirTemp + 'Fix2_1.cds');
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.sBtnGoToTabNClick(Sender: TObject);
var nKdObj : SmallInt; nTabN : integer; dDtPrc : TDateTime;
begin
  if not cdsFix.Active or (cdsFix.RecordCount = 0) then
    Exit;
  nTabN := cdsFix.FieldByName('TabN').AsInteger;
  dDtPrc := dDtProc;
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Z_Sps ' +
            ' where DtProc = :dDtPrc and TabN = :nTabN order by KdObj');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    if RecordCount < 1 then
      ShowMessage('Нет табельного номера ' +
                            IntToStr(nTabN) + ' в списке текущего месяца')
    else begin
      nKdObj := FieldByName('KdObj').AsInteger;
      FormZpMain.qryObj.Locate('KdObj', nKdObj, []);
      FormZpMain.qrySps.Locate('TabN', nTabN, []);
      FormZpMain.SetFocus;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.sBtnSaveToBDClick(Sender: TObject);
var nTabN : integer; n : SmallInt;
begin
  with qryFIndx do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select * from Z_FixIndx');
    Open;
  end;
  with cdsFix do begin
    First;
    n := 0;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      if not qryFIndx.Locate('TabN', nTabN, []) then begin
        if not FieldByName('SmFixIndx').IsNull and
                          (FieldByName('SmFixIndx').AsFloat > 0) then begin
          AddRecInQryFIndx;
          Inc(n);
        end;
      end;
      Next;
    end;
  end;
  if qryFIndx.UpdatesPending then
    Form_Dm.DbMain.ApplyUpdates([qryFIndx]);
  ShowMessage('Сохранено в БД записей: ' + IntToStr(n));
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.AddRecInQryFIndx;
begin
  with qryFIndx do begin
    Append;
    FieldByName('TabN').AsString     := cdsFix.FieldByName('TabN').AsString;
    FieldByName('LastDtUv').AsString := cdsFix.FieldByName('DtUvoln').AsString;
    FieldByName('FixMes').AsString   := cdsFix.FieldByName('DtBeg_1').AsString;
    FieldByName('F_Smm').AsString    := cdsFix.FieldByName('SmOldIndx').AsString;
    FieldByName('d_OklNdb').AsString := cdsFix.FieldByName('SmDeltaON').AsString;
    FieldByName('FixSmm').AsString   := cdsFix.FieldByName('SmFixIndx').AsString;
    FieldByName('Notes').AsString    := cdsFix.FieldByName('IndxNotes').AsString;
    FieldByName('MyFld').AsString    := '222';
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCreFIndx2.sBtnPrtClick(Sender: TObject);
begin
  F6PrtFFInd2(cdsFix);   {z_CmnPrt}
end;

end.

