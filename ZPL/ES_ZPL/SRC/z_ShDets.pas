unit z_ShDets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, Grids, DBGrids, DB, DBClient, DBTables, StdCtrls, Buttons,
  ExtCtrls, ComCtrls;

type
  TFormShDets = class(TForm)
    PageControl: TPageControl;
    tsBezRasch: TTabSheet;
    tsWithZapret: TTabSheet;
    tsWithDlgTM: TTabSheet;
    Panel1: TPanel;
    sBtnPrt1: TSpeedButton;
    bBtnCancel1: TBitBtn;
    Panel2: TPanel;
    sBtnPrt2: TSpeedButton;
    bBtnCancel2: TBitBtn;
    Panel3: TPanel;
    sBtnPrt3: TSpeedButton;
    bBtnCancel3: TBitBtn;
    qryTmp: TQuery;
    cds1: TClientDataSet;
    cds2: TClientDataSet;
    cds3: TClientDataSet;
    dsrc1: TDataSource;
    dsrc2: TDataSource;
    dsrc3: TDataSource;
    dbgr1: TDBGrid;
    dbgr2: TDBGrid;
    dbgr3: TDBGrid;
    cds2NR: TAutoIncField;
    cds2TabN: TIntegerField;
    cds2Fam: TStringField;
    cds2Ima: TStringField;
    cds2Otch: TStringField;
    cds2ID: TStringField;
    cds2KdObj: TSmallintField;
    cds2KdKatP: TSmallintField;
    cds2SmToVupl: TFloatField;
    cds2FamIO: TStringField;
    cds3NR: TAutoIncField;
    cds3TabN: TIntegerField;
    cds3Fam: TStringField;
    cds3Ima: TStringField;
    cds3Otch: TStringField;
    cds3ID: TStringField;
    cds3KdObj: TSmallintField;
    cds3KdKatP: TSmallintField;
    cds3SmDlg: TFloatField;
    cds3FamIO: TStringField;
    cds3ZaMesGod: TDateField;
    cds1NR: TAutoIncField;
    cds1TabN: TIntegerField;
    cds1Fam: TStringField;
    cds1Ima: TStringField;
    cds1Otch: TStringField;
    cds1ID: TStringField;
    cds1KdSps: TSmallintField;
    cds1KdObj: TSmallintField;
    cds1KdKatP: TSmallintField;
    cds1Notes: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cds2CalcFields(DataSet: TDataSet);
    procedure cds3CalcFields(DataSet: TDataSet);
    procedure dbGridEnter(Sender: TObject);
    procedure dbGridExit(Sender: TObject);
  private
    { Private declarations }
//    d_DtPrc : TDateTime;
    procedure CreOpenCds1(dDtPrc : TDateTime);
    procedure AddRecIntoCds1;
    procedure CreOpenCds2(dDtPrc : TDateTime);
    procedure AddRecIntoCds2;
    procedure CreOpenCds3(dDtPrc : TDateTime);
    procedure AddRecIntoCds3;
  public
    { Public declarations }
  end;

procedure ShwLstBezSch(dDtPrc : TDateTime);
procedure ShwLstZapret(dDtPrc : TDateTime);
procedure ShwLstDlgTM(dDtPrc : TDateTime);  {z_ShDets}

const SECTION = 'z_ShDets';

var
  FormShDets: TFormShDets;

implementation

uses a_Const, z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwLstBezSch(dDtPrc : TDateTime);
begin
  FormShDets := TFormShDets.Create(Application);
  with FormShDets do begin
    Caption := 'Список НеРассчитывавшихся сотрудников';
    CreOpenCds1(dDtPrc);
    PageControl.ActivePage := tsBezRasch;
    ActiveControl := dbgr1;
    ShowModal;
  end;
end;
//------------------------------------------------------------------------------
procedure ShwLstZapret(dDtPrc : TDateTime);
begin
  FormShDets := TFormShDets.Create(Application);
  with FormShDets do begin
    Caption := 'Список сотрудников с запретом на начисления';
    CreOpenCds2(dDtPrc);
    PageControl.ActivePage := tsWithZapret;
    ActiveControl := dbgr2;
    ShowModal;
  end;
end;
//------------------------------------------------------------------------------
procedure ShwLstDlgTM(dDtPrc : TDateTime);
begin
  FormShDets := TFormShDets.Create(Application);
  with FormShDets do begin
    Caption := 'Список сотрудников с долгами (вид 2724)';
    CreOpenCds3(dDtPrc);
    PageControl.ActivePage := tsWithDlgTM;
    ActiveControl := dbgr3;
    ShowModal;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShDets.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 250);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 425);
    Width  := ReadInteger(SECTION, 'wW', 580);
    Free;
  end;
  tsBezRasch.TabVisible   := false;
  tsWithZapret.TabVisible := false;
  tsWithDlgTM.TabVisible  := false;
  if FileExists(cDirVids + 'ShDt1.vid') then
    dbgr1.Columns.LoadFromFile(cDirVids + 'ShDt1.vid');
  if FileExists(cDirVids + 'ShDt2.vid') then
    dbgr2.Columns.LoadFromFile(cDirVids + 'ShDt2.vid');
  if FileExists(cDirVids + 'ShDt3.vid') then
    dbgr2.Columns.LoadFromFile(cDirVids + 'ShDt2.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShDets.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
  dbgr1.Columns.SaveToFile(cDirVids + 'ShDt1.vid');
  dbgr2.Columns.SaveToFile(cDirVids + 'ShDt2.vid');
  dbgr3.Columns.SaveToFile(cDirVids + 'ShDt3.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShDets.CreOpenCds1(dDtPrc: TDateTime);
begin
  with cds1 do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, u.ID, s.* from z_Sps s ' +
            ' Left Outer Join z_Upi u on u.TabN = s.TabN ' +
            ' where s.DtProc = :dDtPrc and s.Nch is NULL and s.SvNch is NULL');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      AddRecIntoCds1;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShDets.AddRecIntoCds1;
begin
  with cds1 do begin
    Append;
    FieldByName('TabN').AsString   := qryTmp.FieldByName('TabN').AsString;
    FieldByName('Fam').AsString    := qryTmp.FieldByName('Fam').AsString;
    FieldByName('Ima').AsString    := qryTmp.FieldByName('Ima').AsString;
    FieldByName('Otch').AsString   := qryTmp.FieldByName('Otch').AsString;
    FieldByName('ID').AsString     := qryTmp.FieldByName('ID').AsString;
    FieldByName('KdSps').AsString  := qryTmp.FieldByName('KdSps').AsString;
    FieldByName('KdObj').AsString  := qryTmp.FieldByName('KdObj').AsString;
    FieldByName('KdKatP').AsString := qryTmp.FieldByName('KdKatP').AsString;
    FieldByName('Notes').AsString  := qryTmp.FieldByName('Notes').AsString;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShDets.CreOpenCds2(dDtPrc: TDateTime);
begin
  with cds2 do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, u.ID, s.* from z_Sps s ' +
            ' Left Outer Join z_Upi u on u.TabN = s.TabN ' +
            ' where s.DtProc = :dDtPrc and s.NCH = "Z"');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      AddRecIntoCds2;
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select Round(Sum(Summa), 2) SMM from Z_NU ' +
            ' where TabN = :nTabN and DtProc = :dDtPrc and VidN < "8000"');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
  end;
  with cds2 do begin
    First;   // Заполнить поля "СмКВыплате"
    while not Eof do begin
      qryTmp.Close;
      qryTmp.ParamByName('nTabN').AsInteger := cds2TabN.AsInteger;
      qryTmp.Open;
      Edit;
      cds2SmToVupl.AsFloat := qryTmp.FieldByName('SMM').AsFloat;
      Post;
      Next;
    end;
    First;
  end;
  with qryTmp do begin
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShDets.AddRecIntoCds2;
begin
  with cds2 do begin
    Append;
    FieldByName('TabN').AsString   := qryTmp.FieldByName('TabN').AsString;
    FieldByName('Fam').AsString    := qryTmp.FieldByName('Fam').AsString;
    FieldByName('Ima').AsString    := qryTmp.FieldByName('Ima').AsString;
    FieldByName('Otch').AsString   := qryTmp.FieldByName('Otch').AsString;
    FieldByName('ID').AsString     := qryTmp.FieldByName('ID').AsString;
    FieldByName('KdObj').AsString  := qryTmp.FieldByName('KdObj').AsString;
    FieldByName('KdKatP').AsString := qryTmp.FieldByName('KdKatP').AsString;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShDets.cds2CalcFields(DataSet: TDataSet);
begin
  cds2FamIO.AsString := MyFamIO(cds2Fam.AsString, cds2Ima.AsString,
                                                        cds2Otch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShDets.CreOpenCds3(dDtPrc: TDateTime);
begin
  with cds3 do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, u.ID, n.TabN, n.KdObj, n.KdKatP, ' +
            ' n.ZaMesGod, n.Summa from z_NU n ' +
            ' Left Outer Join z_Upi u on u.TabN = n.TabN ' +
            ' where n.DtProc = :dDtPrc and n.VidN = "2724"');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      AddRecIntoCds3;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShDets.AddRecIntoCds3;
begin
  with cds3 do begin
    Append;
    FieldByName('TabN').AsString   := qryTmp.FieldByName('TabN').AsString;
    FieldByName('Fam').AsString    := qryTmp.FieldByName('Fam').AsString;
    FieldByName('Ima').AsString    := qryTmp.FieldByName('Ima').AsString;
    FieldByName('Otch').AsString   := qryTmp.FieldByName('Otch').AsString;
    FieldByName('ID').AsString     := qryTmp.FieldByName('ID').AsString;
    FieldByName('KdObj').AsString  := qryTmp.FieldByName('KdObj').AsString;
    FieldByName('KdKatP').AsString := qryTmp.FieldByName('KdKatP').AsString;
    FieldByName('ZaMesGod').AsString := qryTmp.FieldByName('ZaMesGod').AsString;
    FieldByName('SmDlg').AsString := qryTmp.FieldByName('Summa').AsString;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShDets.cds3CalcFields(DataSet: TDataSet);
begin
  cds3FamIO.AsString := MyFamIO(cds3Fam.AsString, cds3Ima.AsString,
                                                        cds3Otch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormShDets.dbGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormShDets.dbGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;

end.
