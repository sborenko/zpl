unit z_ChSps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables;

type
  TFormChkSps = class(TForm)
    qryTmp: TQuery;
    dsrcTmp: TDataSource;
    dbgrTmp: TDBGrid;
    bBtnCancel: TBitBtn;
    qryTmpTABN: TIntegerField;
    qryTmpS_KDOBJ: TSmallintField;
    qryTmpFAM: TStringField;
    qryTmpIMA: TStringField;
    qryTmpOTCH: TStringField;
    qryTmpKDOBJ: TSmallintField;
    qryTmpOLDKDOBJ: TSmallintField;
    sBtnStayOnTop: TSpeedButton;
    sBtnGoToTabN: TSpeedButton;
    sBtnReOpen: TSpeedButton;
    SpeedButton1: TSpeedButton;
    qryFiks: TQuery;
    qryTmpDTPROC: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnStayOnTopClick(Sender: TObject);
    procedure bBtnCancelClick(Sender: TObject);
    procedure sBtnGoToTabNClick(Sender: TObject);
    procedure sBtnReOpenClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    procedure OpenQryTmp(dDtPrc : TDateTime);
    procedure SetStayOnTop;
  public
    { Public declarations }
  end;

procedure ChkSps(dDtPrc : TDateTime);

const SECTION = 'z_ChSps';

var
  FormChkSps: TFormChkSps;

implementation

uses a_Const, a_DM, z_DM, Z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ChkSps(dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  if not bIsFormChkSps then begin
    bIsFormChkSps := true;
    FormChkSps := TFormChkSps.Create(Application);
    with FormChkSps do begin
      d_DtPrc := dDtPrc;
      DecodeDate(dDtPrc, nY, nM, nD);
      Caption := 'Список на ' + mesRus(nM) + ' ' + IntToStr(nY) +
                                                       ' г. (Нестыковки)';
      OpenQryTmp(dDtPrc);
      Show;
      end; end
  else begin
    if FormChkSps.WindowState = wsMinimized then
      FormChkSps.WindowState := wsNormal;
    FormChkSps.SetFocus;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChkSps.OpenQryTmp(dDtPrc: TDateTime);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct s.DtProc, s.tabN, s.KdObj as s_KdObj, ' +
            ' u.Fam, u.Ima, u.Otch, s.OldKdObj, s.KdObj ' +
            ' from z_sps s Left outer Join z_Sps s1 on s1.TabN = s.TabN and ' +
            '               s1.DtProc = s.DtProc and s1.KdObj = s1.OldKdObj ' +
            ' Left outer Join z_Upi u on u.TabN = s.TabN ' +
            ' where s.dtProc = :dDtPrc and s1.KdObj is Null ' +
            ' order by s.KdObj, s.TabN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChkSps.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 410);
    Width  := ReadInteger(SECTION, 'wW', 435);
    sBtnStayOnTop.Down := ReadBool(SECTION, 'bStOnTop', true);
    Free;
  end;
  if FileExists(cDirVids + 'ChkSps.vid') then
    dbgrTmp.Columns.LoadFromFile(cDirVids + 'ChkSps.vid');
  SetStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormChkSps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryTmp.Active then
    dbgrTmp.Columns.SaveToFile(cDirVids + 'ChkSps.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bStOnTop', sBtnStayOnTop.Down);
    Free;
  end;
  bIsFormChkSps := false;
  Action := caFree;
end;
//------------------------------------------------------------------------------
procedure TFormChkSps.sBtnStayOnTopClick(Sender: TObject);
begin
  SetStayOnTop;
end;
//------------------------------------------------------------------------------
procedure TFormChkSps.SetStayOnTop;
begin
  if sBtnStayOnTop.Down then
    FormStyle := fsStayOnTop
  else
    FormStyle := fsNormal;
end;
//------------------------------------------------------------------------------
procedure TFormChkSps.bBtnCancelClick(Sender: TObject);
begin
  Close;
end;
//------------------------------------------------------------------------------
procedure TFormChkSps.sBtnGoToTabNClick(Sender: TObject);
var nNeedObj : SmallInt; nCurTabN : integer;
begin
  if qryTmp.RecordCount = 0 then
    Exit;
  nNeedObj := qryTmpS_KdObj.AsInteger;
  nCurTabN := qryTmpTabN.AsInteger;
  if FormZpMain.qrySpsKDOBJ.AsInteger <> nNeedObj then
    FormZpMain.MyTVLocateKdObj(nNeedObj);
  FormZpMain.qrySps.Locate('TabN', nCurTabN, []);
end;
//------------------------------------------------------------------------------
procedure TFormChkSps.sBtnReOpenClick(Sender: TObject);
var nSvTabN, nSvNextTabN : integer; bEof : boolean;
begin
  bEof := false;
  nSvNextTabN := 0;
  with qryTmp do begin
    DisableControls;
    nSvTabN := qryTmpTabN.AsInteger;
    Next;
    if Eof then
      bEof := true
    else
      nSvNextTabN := qryTmpTabN.AsInteger;
    OpenQryTmp(d_DtPrc);
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
procedure TFormChkSps.SpeedButton1Click(Sender: TObject);
begin
  with qryFiks do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Update Z_SPS set OldKdObj = :nKdObj where DtProc = :dDtProc and ' +
            ' TabN = :nTabN');
    ParamByName('nKdObj').AsInteger := qryTmpS_KdObj.AsInteger;
    ParamByName('dDtProc').AsDateTime := qryTmpDtProc.AsDateTime;
    ParamByName('nTabN').AsInteger := qryTmpTabN.AsInteger;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
  sBtnReOpen.Click;
end;

end.
