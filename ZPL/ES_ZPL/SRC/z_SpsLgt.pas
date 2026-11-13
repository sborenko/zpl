unit z_SpsLgt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Buttons, StdCtrls, ExtCtrls, DB, DBClient, Provider,
  DBTables, Grids, DBGrids, DBCtrls, Menus;

type
  TFormSpsLgt = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    sBtnPrt: TSpeedButton;
    dbgrLgt: TDBGrid;
    qryLgt: TQuery;
    dspLgt: TDataSetProvider;
    cdsLgt: TClientDataSet;
    dsrcLgt: TDataSource;
    cdsLgtTABN: TIntegerField;
    cdsLgtFAM: TStringField;
    cdsLgtIMA: TStringField;
    cdsLgtOTCH: TStringField;
    cdsLgtOZN_PILG: TSmallintField;
    cdsLgtCNT: TSmallintField;
    cdsLgtPRCLGT: TFloatField;
    DBNavigator1: TDBNavigator;
    pop: TPopupMenu;
    popHead: TMenuItem;
    popOrderByTabN: TMenuItem;
    popOrderByFIO: TMenuItem;
    popOrderByPrcFIO: TMenuItem;
    LabelCntRec: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popOrderByPrcFIOClick(Sender: TObject);
    procedure popOrderByTabNClick(Sender: TObject);
    procedure popOrderByFIOClick(Sender: TObject);
    procedure dbgrLgtEnter(Sender: TObject);
    procedure dbgrLgtExit(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
  private
    { Private declarations }
    n_SvTabN : integer;
    d_DtBeg : TDateTime;
    procedure CreOpenCdsLgt(dDtBeg, dDtEnd : TDateTime);
    procedure SetLgtIndex;
  public
    { Public declarations }
  end;

procedure ShwLgt(dDtBeg, dDtEnd : TDateTime);

const SECTION = 'z_SpsLgt';

var
  FormSpsLgt: TFormSpsLgt;

implementation

uses a_Const, z_Dm, z_Main, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwLgt(dDtBeg, dDtEnd : TDateTime);
var nY, nM, nD : word;
begin
  FormSpsLgt := TFormSpsLgt.Create(Application);
  with FormSpsLgt do begin
    d_DtBeg := dDtBeg;
    DecodeDate(dDtBeg, nY, nM, nD);
    Caption := 'Список льготников в ' +
                              MesPredlogn(nM) + ' ' + IntToStr(nY) + ' г.';
    CreOpenCdsLgt(dDtBeg, dDtEnd);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.CreOpenCdsLgt(dDtBeg, dDtEnd : TDateTime);
begin
  with qryLgt do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct s.TabN, u.Fam, u.Ima, u.Otch, p.* ' +
            ' from z_Sps s Left Outer Join z_Upi u on u.TabN = s.Tabn ' +
            ' Left Outer Join Get_Lgota(s.TabN, :dDtBeg, :dDtEnd) p on 1=1 ' +
            ' where s.DtProc = :dDtBeg and p.PrcLgt > 0 ' +
            ' order by p.PrcLgt, s.TabN');
    ParamByName('dDtBeg').AsDateTime := dDtBeg;
    ParamByName('dDtEnd').AsDateTime := dDtEnd;
  end;
  with cdsLgt do begin
    if Active then Close;
    Open;
    SetLgtIndex;
    if n_SvTabN > 0 then
      Locate('TabN', n_SvTabN, []);
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.FormCreate(Sender: TObject);
var nSortCase : SmallInt;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 50);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 450);
    Width  := ReadInteger(SECTION, 'wW', 500);
    n_SvTabN := ReadInteger(SECTION, 'SvTabN', 0);
    nSortCase := ReadInteger(SECTION, 'SortCase', 1);
    Free;
  end;
  if nSortCase = 1 then begin
    popOrderByPrcFIO.Checked := true;
    popOrderByTabN.Checked   := false;
    popOrderByFIO.Checked    := false; end
  else if nSortCase = 2 then begin
    popOrderByPrcFIO.Checked := false;
    popOrderByTabN.Checked   := true;
    popOrderByFIO.Checked    := false; end
  else begin
    popOrderByPrcFIO.Checked := false;
    popOrderByTabN.Checked   := false;
    popOrderByFIO.Checked    := true;
  end;
  if FileExists(cDirVids + 'SpsLgt.Vid') then
    dbgrLgt.Columns.LoadFromFile(cDirVids + 'SpsLgt.Vid');
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.FormClose(Sender: TObject; var Action: TCloseAction);
var nSortCase : SmallInt;
begin
  dbgrLgt.Columns.SaveToFile(cDirVids   + 'SpsLgt.vid');
  if popOrderByPrcFIO.Checked then
    nSortCase := 1
  else if popOrderByTabN.Checked then
    nSortCase := 2
  else
    nSortCase := 3;
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'SvTabN', cdsLgtTabN.AsInteger);
    WriteInteger(SECTION, 'SortCase', nSortCase);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.popOrderByPrcFIOClick(Sender: TObject);
begin
  if not popOrderByPrcFIO.Checked then begin
    popOrderByPrcFIO.Checked := true;
    popOrderByTabN.Checked   := false;
    popOrderByFIO.Checked    := false;
    SetLgtIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.popOrderByTabNClick(Sender: TObject);
begin
  if not popOrderByTabN.Checked then begin
    popOrderByPrcFIO.Checked := false;
    popOrderByTabN.Checked   := true;
    popOrderByFIO.Checked    := false;
    SetLgtIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.popOrderByFIOClick(Sender: TObject);
begin
  if not popOrderByFIO.Checked then begin
    popOrderByPrcFIO.Checked := false;
    popOrderByTabN.Checked   := false;
    popOrderByFIO.Checked    := true;
    SetLgtIndex;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.SetLgtIndex;
var nSvTabN : integer;
begin
  with cdsLgt do begin
    nSvTabN := cdsLgtTabN.AsInteger;
    if popOrderByPrcFIO.Checked then
      IndexName := 'OnPrcFIO'
    else if popOrderByTabN.Checked then
      IndexName := 'OnTabN'
    else
      IndexName := 'OnFIO';
    if (nSvTabN <> 0) and (cdsLgtTabN.AsInteger <> nSvTabN) then
      Locate('TabN', nSvTabN, []);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.dbgrLgtEnter(Sender: TObject);
begin
  dbgrLgt.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.dbgrLgtExit(Sender: TObject);
begin
  dbgrLgt.FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormSpsLgt.sBtnPrtClick(Sender: TObject);
var cSvIndex : ShortString; nSvTabN : integer;
begin
  with cdsLgt do begin
    cSvIndex := IndexName;
    nSvTabN := cdsLgtTabN.AsInteger;
    IndexName := 'OnPrcFIO';
    F6PrtSpsLgt(d_DtBeg, cdsLgt);  {z_CnmPrt}
    IndexName := cSvIndex;
    Locate('TabN', nSvTabN, []);
  end;
end;

end.
