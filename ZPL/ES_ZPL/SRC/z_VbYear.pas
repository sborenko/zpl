unit z_VbYear;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, DB, DBClient, Grids, DBGrids,
  ExtCtrls;

type
  TFormVbYear = class(TForm)
    cdsYears: TClientDataSet;
    dsrcYears: TDataSource;
    dbgrYears: TDBGrid;
    cdsYearsGod: TSmallintField;
    PanelButtons: TPanel;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrYearsEnter(Sender: TObject);
    procedure dbgrYearsExit(Sender: TObject);
    procedure dbgrYearsDblClick(Sender: TObject);
  private
    { Private declarations }
    nSvGod : SmallInt;
    procedure CreOpenCdsYears;
  public
    { Public declarations }
  end;

function VuborGoda(var nGod : SmallInt) : boolean;

const SECTION = 'z_VbYear';

var
  FormVbYear: TFormVbYear;

implementation

uses A_Const, A_DM, Z_DM, Z_Main, A_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
function VuborGoda(var nGod : SmallInt) : boolean;
begin
  Result := false;
  FormVbYear := TFormVbYear.Create(Application);
  with FormVbYear do begin
    nGod := 0;
    CreOpenCdsYears;
    if nSvGod > 0 then
      cdsYears.Locate('God', nSvGod, [])
    else
      cdsYears.Last;
    Caption := 'Выберите год';
    if ShowModal = mrOk then begin
      nGod := cdsYearsGod.AsInteger;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbYear.CreOpenCdsYears;
var nGod, nY, nM, nD : word; dDtPrc : TDateTime;
begin
  with cdsYears do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with DmMain.qryMesSps do begin
    if not Active then
      Open;
    First;
    while not Eof do begin
      dDtPrc := FieldByName('DtProc').AsDateTime;
      DecodeDate(dDtPrc, nY, nM, nD);
      nGod := nY;
      if not cdsYears.Locate('God', nGod, []) then begin
        cdsYears.Append;
        cdsYears.FieldByName('God').AsInteger := nGod;
        cdsYears.Post;
      end;
      Next;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbYear.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 400);
    nSvGod := ReadInteger(SECTION, 'SvGod', 0);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbYear.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    if cdsYears.Active and (ModalResult = mrOk) then
      WriteInteger(SECTION, 'SvGod', cdsYearsGod.AsInteger);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormVbYear.dbgrYearsEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clInfoBk;
end;
//------------------------------------------------------------------------------
procedure TFormVbYear.dbgrYearsExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormVbYear.dbgrYearsDblClick(Sender: TObject);
begin
  if cdsYears.RecordCount > 0 then
    ModalResult := mrOk;
end;

end.
