unit z_ChNU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls;

type
  TFormCheckNU = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    dbgrNu: TDBGrid;
    qryNu: TQuery;
    dsrcNu: TDataSource;
    qryNuFAM: TStringField;
    qryNuIMA: TStringField;
    qryNuOTCH: TStringField;
    qryNuKDSPS: TSmallintField;
    qryNuNCH: TStringField;
    qryNuDTPROC: TDateTimeField;
    qryNuTABN: TIntegerField;
    qryNuKDOBJ: TSmallintField;
    qryNuKDKATP: TSmallintField;
    qryNuNOTES: TStringField;
    qryNuFamIO: TStringField;
    sBtnGoTo: TSpeedButton;
    sBtnStayOnTop: TSpeedButton;
    qryNuSMPLUS: TFloatField;
    qryNuSMMINUS: TFloatField;
    sBtnPrt: TSpeedButton;
    sBtnReOpen: TSpeedButton;
    procedure qryNuCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure dbgrNuDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bBtnCancelClick(Sender: TObject);
    procedure sBtnGoToClick(Sender: TObject);
    procedure sBtnReOpenClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    procedure OpenQryNu(dDtPrc : TDateTime);
    procedure SetFormStyle;
  public
    { Public declarations }
  end;

const SECTION = 'z_ChONU';

procedure CheckNu(dDtPrc : TDateTime);

var
  FormCheckNU: TFormCheckNU;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure CheckNu(dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  if not bIsFormCheckNu then begin
    FormCheckNu := TFormCheckNu.Create(Application);
    with FormCheckNu do begin
      d_DtPrc := dDtPrc;
      DecodeDate(dDtPrc, nY, nM, nD);
      Caption := 'Сотрудники, оставшиеся без начислений / удержаний в ' +
                 MesPredlogn(nM) + ' ' + IntToStr(nY) + ' г.';
      OpenQryNu(dDtPrc);
      bIsFormCheckNu := true;
      SetFormStyle;
      Show;
    end; end
  else begin
    if FormCheckNu.WindowState = wsMinimized then
      FormCheckNu.WindowState := wsNormal;
    FormCheckNu.SetFocus;
  end;
end;
{  Пожалуй, лучше будет так:
Select u.Fam, u.Ima, u.Otch, s.TabN, s.DtProc, s.KdObj, KdSps, s.NCH,
       s.KdKatP, s.Notes, Sum(o.Summa) as SmPlus, Sum(o2.Summa) as SmMinus
from z_sps s
     Left outer join z_UPI u on u.TabN = s.TabN
     Left outer join z_Otkl o on
        o.TabN = s.TabN and o.DtProc = s.DtProc and o.Summa > 0
     Left outer join z_Otkl o2 on
        o2.TabN = s.TabN and o2.DtProc = s.DtProc and o2.Summa < 0
 where s.DtProc = '09/01/2008' and not
                 Exists (Select Tabn from z_NU where z_NU.TabN = s.TabN and
                                 z_NU.DtProc = s.DtProc)
group by u.Fam, u.Ima, u.Otch, s.TabN, s.DtProc, s.KdObj, KdSps, s.NCH,
       s.KdKatP, s.Notes
Тогда меньше шансов напороться на случай "+" = "-"}

//------------------------------------------------------------------------------
procedure TFormCheckNU.OpenQryNu(dDtPrc: TDateTime);
begin
  with qryNU do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select s.TabN, s.KdSps, s.KdObj, u.Fam, u.Ima, u.Otch, ' +
            ' s.DtProc, s.NCH, s.KdKatP, s.Notes, ' +
            ' Sum(o.Summa) as SmPlus, Sum(o2.Summa) as SmMinus' +
            ' from z_sps s Left outer join z_UPI u on u.TabN = s.TabN ' +
            ' Left outer join z_Otkl o on o.TabN = s.TabN and ' +
            ' o.DtProc = s.DtProc and o.Summa >= 0 ' +
            ' Left outer join z_Otkl o2 on o2.TabN = s.TabN and ' +
            ' o2.DtProc = s.DtProc and o2.Summa < 0 ' +
            ' where s.DtProc = :dDtPrc and not Exists ' +
            '  (Select First 1 Tabn from z_NU where z_NU.TabN = s.TabN and ' +
            '   z_NU.DtProc = s.DtProc) ' +
            ' group by s.TabN, s.KdSps, s.KdObj, u.Fam, u.Ima, u.Otch, ' +
            ' s.DtProc, s.NCH, s.KdKatP, s.Notes');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.qryNuCalcFields(DataSet: TDataSet);
begin
  qryNuFamIO.AsString := MyFamIO(qryNuFam.AsString, qryNuIma.AsString,
                                                           qryNuOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 455);
    Width  := ReadInteger(SECTION, 'wW', 675);
    sBtnStayOnTop.Down := ReadBool(SECTION, 'bStOnTop', true);
    Free;
  end;
  if FileExists(cDirVids + 'ChkNu_02.vid') then
    dbgrNu.Columns.LoadFromFile(cDirVids + 'ChkNu_02.vid');
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  bIsFormCheckNu := false;
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bStOnTop', sBtnStayOnTop.Down);
    Free;
  end;
  if qryNU.Active then
    dbgrNu.Columns.SaveToFile(cDirVids   + 'ChkNu_02.vid');
  bIsFormCheckNu := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.sBtnStayOnTopClick(Sender: TObject);
begin
  SetFormStyle;
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.SetFormStyle;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.dbgrNuDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrNu.Canvas do begin
    if not (gdFocused in State) then begin
      if (not qryNuSmPlus.IsNull) or not (qryNuSmMinus.IsNull) then begin
        Font.Style := [fsBold];
        Font.Color := clMaroon;
      end;
    end;
  end;
  dbgrNu.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.bBtnCancelClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.sBtnGoToClick(Sender: TObject);
var nTabN : integer; nKdObj : SmallInt;
begin
  if (qryNu.RecordCount = 0) or (qryNuTabN.IsNull) or
                                   (qryNuTabN.AsInteger <= 0) then
    Exit;
  nTabN  := qryNuTabN.AsInteger;
  nKdObj := qryNuKdObj.AsInteger;
  if FormZpMain.qrySpsKDOBJ.AsInteger <> nKdObj then
    FormZpMain.MyTVLocateKdObj(nKdObj);
  FormZpMain.qrySps.Locate('TabN', nTabN, []);
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.sBtnReOpenClick(Sender: TObject);
var nSvTabN, nSvNextTabN : integer; bEof : boolean;
begin
  bEof := false;
  nSvNextTabN := 0;
  with qryNu do begin
    DisableControls;
    nSvTabN := qryNuTabN.AsInteger;
    Next;
    if Eof then
      bEof := true
    else
      nSvNextTabN := qryNuTabN.AsInteger;
    OpenQryNu(d_DtPrc);
    if not Locate('TabN', nSvTabN, []) then begin
      if bEof then
        Last
      else if nSvNextTabN > 0 then begin
        if not Locate('TabN', nSvNextTabN, []) then
          Last;
      end;
    end;
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormCheckNU.sBtnPrtClick(Sender: TObject);
var nY, nM, nD : word; cTitle : string;
begin
  if qryNu.RecordCount = 0 then
    ShowMessage('Нечего печатать')
  else begin
    DecodeDate(d_DtPrc, nY, nM, nD);
    cTitle := 'Сотрудники, оставшиеся без начислений / удержаний в ' +
                 MesPredlogn(nM) + ' ' + IntToStr(nY) + ' г.';
    F6UniPrt(cTitle, qryNU);
  end;
end;

end.
