unit z_InvSt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, DBClient,
  Menus, Provider, DBTables, Grids, DBGrids;

type
  TFormInvSt = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnPrt: TSpeedButton;
    DBNavigator1: TDBNavigator;
    LabelCntRec: TLabel;
    dbgrSps: TDBGrid;
    qrySps: TQuery;
    dspSps: TDataSetProvider;
    pop: TPopupMenu;
    popHed: TMenuItem;
    popSortByFIO: TMenuItem;
    popSortByKatFIO: TMenuItem;
    cdsSps: TClientDataSet;
    cdsSpsTABN: TIntegerField;
    cdsSpsFamIO: TStringField;
    cdsSpsKDKATP: TSmallintField;
    cdsSpsSHKATP: TStringField;
    cdsSpsINV: TSmallintField;
    cdsSpsFAM: TStringField;
    cdsSpsIMA: TStringField;
    cdsSpsOTCH: TStringField;
    dsrcSps: TDataSource;
    cdsSpsDTEND: TDateTimeField;
    cdsSpsMYNOTES: TStringField;
    LabelCntNotes: TLabel;
    cdsSpsMYMETKA: TStringField;
    SpeedButton1: TSpeedButton;
    cdsSpsDTBEG: TDateTimeField;
    popPrt: TPopupMenu;
    popPrtAll: TMenuItem;
    popPrtBadRecs: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsSpsCalcFields(DataSet: TDataSet);
    procedure dbgrSpsEnter(Sender: TObject);
    procedure dbgrSpsExit(Sender: TObject);
    procedure popSortByFIOClick(Sender: TObject);
    procedure popSortByKatFIOClick(Sender: TObject);
    procedure dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPrtClick(Sender: TObject);
    procedure cdsSpsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure popPrtAllClick(Sender: TObject);
    procedure popPrtBadRecsClick(Sender: TObject);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    nSvTabN : integer;
    nCntMyNotes : SmallInt;
    procedure CreOpenCdsSps(dDtPrc : TDateTime);
    procedure SetSpsIndex;
  public
    { Public declarations }
  end;

procedure CheckInvState(dDtPrc : TDateTime);

const SECTION = 'z_InvSt';

var
  FormInvSt: TFormInvSt;

implementation

uses a_Const, A_DM, a_Lib, Z_Dm, z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure CheckInvState(dDtPrc : TDateTime);
begin
  FormInvSt := TFormInvSt.Create(Application);
  with FormInvSt do begin
    Caption := 'Список инвалидов на ' + DateToStr(dDtPrc);
    d_DtPrc := dDtPrc;
    CreOpenCdsSps(dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 750);
    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    popSortByFIO.Checked := ReadBool(SECTION, 'bSortFIO', true);
    popSortByKatFIO.Checked := not popSortByFIO.Checked;
    Free;
  end;
//  if FileExists(cDirVids + 'InvStat.vid') then
//    dbgrSps.Columns.LoadFromFile(cDirVids + 'InvStat.vid');
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSps.Columns.SaveToFile(cDirVids + 'InvStat.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvTabN', cdsSpsTabN.AsInteger);
    WriteBool(SECTION, 'bSortFIO', popSortByFIO.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.CreOpenCdsSps(dDtPrc: TDateTime);
var cMyNotes : ShortString;
begin
  LabelCntNotes.Caption := '';
  nCntMyNotes := 0;
  with cdsSps do begin
    if Active then
      Close;
    IndexDefs.Clear;
    IndexName := '';
  end;
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct s.TabN, pr.KdKatP, k.ShKatP, pr.Inv, ' +
            ' u.Fam, u.Ima, u.Otch, Cast(NULL as TimeStamp) as DtBeg, ' +
            ' Cast(NULL as TimeStamp) as DtEnd, ' +
            ' Cast(Null as Char(65)) as MyNotes, ' +
            ' Cast(Null as Char(1)) as MyMetka from z_Sps s ' +
            ' Left Outer Join Z_Upi u on u.TabN = s.TabN ' +
            ' Left outer join z_GetWrkPereOnDate(s.TabN, s.DtProc) pr on 1=1 ' +
            ' Left Outer Join Z_KatPers k on k.KdKatP = pr.KdKatP ' +
            ' where s.DtProc = :dDtPrc and pr.Inv >= 1 ' +
            ' order by pr.KdKatP, s.TabN');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  with cdsSps do begin
    Open;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    AddIndex('OnFIO', 'Fam;Ima;Otch', [ixCaseInsensitive]);
    AddIndex('OnKatFIO', 'KdKatP;Fam;Ima;Otch', [ixCaseInsensitive]);
    SetSpsIndex;
    First;
    ProviderName := '';
  end;
  dspSps.DataSet := NIL;
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 * from Z_InvDocs where TabN = :TabN ' +
            ' order by DtBeg desc');
    DataSource := dsrcSps;
  end;
  with cdsSps do begin
    First;
    qrySps.Open;
    while not Eof do begin
      if (qrySps.RecordCount > 0) then begin
        Edit;
        cdsSpsDtBeg.AsString := qrySps.FieldByName('DtBeg').AsString;
        cdsSpsDtEnd.AsString := qrySps.FieldByName('DtEnd').AsString;
        cMyNotes := qrySps.FieldByName('Notes').AsString;
        if not qrySps.FieldByName('DtEnd').IsNull and
                (qrySps.FieldByName('DtEnd').AsDateTime < d_DtPrc) then begin
          Inc(nCntMyNotes);
          cdsSpsMyMetka.AsString := 'X';
        end;
        cdsSpsMyNotes.AsString := cMyNotes;
        Post;
      end;
      Next;
    end;
    if (nSvTabN > 0) and not Locate('TabN', nSvTabN, []) then
      First;
    if nCntMyNotes > 0 then
      LabelCntNotes.Caption := 'Замечаний: ' + IntToStr(nCntMyNotes)
    else
      LabelCntNotes.Caption := 'Замечаний нет.';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.SetSpsIndex;
begin
  with cdsSps do begin
    if popSortByFIO.Checked then
      IndexName := 'OnFIO'
    else
      IndexName := 'OnKatFIO';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.cdsSpsCalcFields(DataSet: TDataSet);
begin
  cdsSpsFamIO.AsString := MyFamIO(cdsSpsFam.AsString, cdsSpsIma.AsString,
                                                       cdsSpsOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.dbgrSpsEnter(Sender: TObject);
begin
  dbgrSps.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.dbgrSpsExit(Sender: TObject);
begin
  dbgrSps.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.popSortByFIOClick(Sender: TObject);
begin
  if not popSortByFIO.Checked then begin
    popSortByFIO.Checked := true;
    popSortByKatFIO.Checked := false;
    SetSpsIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.popSortByKatFIOClick(Sender: TObject);
begin
  if not popSortByKatFIO.Checked then begin
    popSortByFIO.Checked := false;
    popSortByKatFIO.Checked := true;
    SetSpsIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrSps.Canvas do begin
    if not cdsSpsMyMetka.IsNull then
      Brush.Color := clLime;
    if cFldNm = 'INV' then
      Brush.Color := clWindow;
  end;
  dbgrSps.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.cdsSpsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := cdsSpsMyMetka.AsString = 'X';
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.SpeedButton1Click(Sender: TObject);
begin
  cdsSps.Filtered := not cdsSps.Filtered;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.sBtnPrtClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnPrt.Top + 48;
  Y := Left + sBtnPrt.Left + 3;
  popPrt.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.popPrtAllClick(Sender: TObject);
var nSvTabN : integer; cSvIndexNm : ShortString;
begin
  if cdsSps.RecordCount <= 0 then
    ShowMessage('Нет записей для печати')
  else with cdsSps do begin
    nSvTabN := cdsSpsTabN.AsInteger;
    cSvIndexNm := IndexName;
    DisableControls;
    IndexName := 'OnKatFIO';
    //cdsSps.Filtered := true;
    First;
    F6SpsInvState(d_DtPrc, cdsSps);  {z_CmnPrt}
    //F6SpsInvalids(d_DtPrc, cdsSps);
    IndexName := cSvIndexNm;
    //cdsSps.Filtered := false;
    Locate('TabN', nSvTabN, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormInvSt.popPrtBadRecsClick(Sender: TObject);
var nSvTabN : integer; cSvIndexNm : ShortString;
begin
  if nCntMyNotes <= 0 then
    ShowMessage('Нет записей с замечаниями')
  else with cdsSps do begin
    nSvTabN := cdsSpsTabN.AsInteger;
    cSvIndexNm := IndexName;
    DisableControls;
    IndexName := 'OnKatFIO';
    cdsSps.Filtered := true;
    First;
    F6SpsInvState(d_DtPrc, cdsSps);  {z_CmnPrt}
    //F6SpsInvalids(d_DtPrc, cdsSps);
    IndexName := cSvIndexNm;
    cdsSps.Filtered := false;
    Locate('TabN', nSvTabN, []);
    EnableControls;
  end;
end;

end.
