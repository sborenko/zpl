unit z_SpsInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, ExtCtrls, DB, Grids, DBGrids, Provider, DBClient,
  DBTables, StdCtrls, Buttons, DBCtrls, Menus;

type
  TFormSpsInv = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qrySps: TQuery;
    cdsSps: TClientDataSet;
    dsrcSps: TDataSource;
    dspSps: TDataSetProvider;
    dbgrSps: TDBGrid;
    cdsSpsTABN: TIntegerField;
    cdsSpsKDKATP: TSmallintField;
    cdsSpsSHKATP: TStringField;
    cdsSpsINV: TSmallintField;
    cdsSpsFAM: TStringField;
    cdsSpsIMA: TStringField;
    cdsSpsOTCH: TStringField;
    cdsSpsFamIO: TStringField;
    LabelCntRec: TLabel;
    sBtnPrt: TSpeedButton;
    DBNavigator1: TDBNavigator;
    pop: TPopupMenu;
    popHed: TMenuItem;
    popSortByFIO: TMenuItem;
    popSortByKatFIO: TMenuItem;
    cdsSpsNRDOC: TStringField;
    cdsSpsNMDOC: TStringField;
    cdsSpsDTBEGDOC: TDateTimeField;
    cdsSpsDTENDDOC: TDateTimeField;
    cdsSpsNOTESDOC: TStringField;
    popPrt: TPopupMenu;
    popPrtAll: TMenuItem;
    popPrtOnlyWithDoc: TMenuItem;
    procedure cdsSpsCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popSortByFIOClick(Sender: TObject);
    procedure popSortByKatFIOClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popPrtAllClick(Sender: TObject);
    procedure popPrtOnlyWithDocClick(Sender: TObject);
  private
    { Private declarations }
    nSvTabN : integer;
    d_DtPrc : TDateTime;
    procedure CreOpenCdsSps(dDtPrc : TDateTime);
    procedure SetSpsIndex;
  public
    { Public declarations }
  end;

procedure ShwInv(dDtPrc : TDateTime);

const SECTION = 'z_SpsInv';

var                             
  FormSpsInv: TFormSpsInv;

implementation

uses a_Const, A_DM, a_Lib, Z_Dm, z_Main, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwInv(dDtPrc : TDateTime);
begin
  FormSpsInv := TFormSpsInv.Create(Application);
  with FormSpsInv do begin
    Caption := 'Список инвалидов на ' + DateToStr(dDtPrc);
    d_DtPrc := dDtPrc;
    CreOpenCdsSps(dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.CreOpenCdsSps(dDtPrc: TDateTime);
begin
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
    SQL.Add('Select distinct s.TabN, pr.KdKatP, k.ShKatP, ' +
            ' pr.Inv, pr.NrDoc, pr.NmDoc, pr.DtBegDoc, pr.DtEndDoc, ' +
            ' pr.NotesDoc, u.Fam, u.Ima, u.Otch from z_Sps s ' +
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
    if nSvTabN > 0 then
      Locate('TabN', nSvTabN, [])
    else
      First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.cdsSpsCalcFields(DataSet: TDataSet);
begin
  cdsSpsFamIO.AsString := MyFamIO(cdsSpsFam.AsString, cdsSpsIma.AsString,
                                                       cdsSpsOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 500);
    nSvTabN := ReadInteger(SECTION, 'nSvTabN', 0);
    popSortByFIO.Checked := ReadBool(SECTION, 'bSortFIO', true);
    popSortByKatFIO.Checked := not popSortByFIO.Checked;
    Free;
  end;
  if FileExists(cDirVids + 'SpsInv01.vid') then
    dbgrSps.Columns.LoadFromFile(cDirVids + 'SpsInv01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSps.Columns.SaveToFile(cDirVids + 'SpsInv01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'nSvTabN', cdsSpsTabN.AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.SetSpsIndex;
begin
  with cdsSps do begin
    if popSortByFIO.Checked then
      IndexName := 'OnFIO'
    else
      IndexName := 'OnKatFIO';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.popSortByFIOClick(Sender: TObject);
begin
  if not popSortByFIO.Checked then begin
    popSortByFIO.Checked := true;
    popSortByKatFIO.Checked := false;
    SetSpsIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.popSortByKatFIOClick(Sender: TObject);
begin
  if not popSortByKatFIO.Checked then begin
    popSortByFIO.Checked := false;
    popSortByKatFIO.Checked := true;
    SetSpsIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.sBtnPrtClick(Sender: TObject);
var X, Y : integer;
begin
  X := Top + sBtnPrt.Top + 47;
  Y := Left + sBtnPrt.Left + 4;
  popPrt.Popup(Y, X);
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.dbgrSpsDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrSps.Canvas do begin
    if cFldNm = 'INV' then
      Brush.Color := clWindow;
  end;
  dbgrSps.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.popPrtAllClick(Sender: TObject);
var nSvTabN : integer; cSvIndexNm : ShortString;
begin
  with cdsSps do begin
    nSvTabN := cdsSpsTabN.AsInteger;
    cSvIndexNm := IndexName;
    DisableControls;
    IndexName := 'OnKatFIO';
    First;
    F6SpsInvalids(1, d_DtPrc, cdsSps);  {z_CmnPrt}
    IndexName := cSvIndexNm;
    Locate('TabN', nSvTabN, []);
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsInv.popPrtOnlyWithDocClick(Sender: TObject);
var nSvTabN : integer; cSvIndexNm : ShortString;
begin
  with cdsSps do begin
    nSvTabN := cdsSpsTabN.AsInteger;
    cSvIndexNm := IndexName;
    DisableControls;
    Filter := 'NrDoc > ''''';
    Filtered := true;
    IndexName := 'OnKatFIO';
    First;
    F6SpsInvalids(2, d_DtPrc, cdsSps);  {z_CmnPrt}
    Filtered := false;
    Filter := '';
    IndexName := cSvIndexNm;
    Locate('TabN', nSvTabN, []);
    EnableControls;
  end;
end;

end.
