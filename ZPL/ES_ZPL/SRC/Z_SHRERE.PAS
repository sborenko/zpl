unit Z_ShReRe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, IniFiles, DBTables;

type
  TFormSh_NU = class(TForm)
    dsrcTmp: TDataSource;
    dbgrTmp: TDBGrid;
    bBtnCancel: TBitBtn;
    tblTmp: TTable;
    tblTmpDtProc: TDateField;
    tblTmpZaMesGod: TDateField;
    tblTmpKdVidN: TSmallintField;
    tblTmpKdObj: TSmallintField;
    tblTmpKdKatP: TSmallintField;
    tblTmpPdN: TSmallintField;
    tblTmpSPZ: TStringField;
    tblTmpPrPV: TSmallintField;
    tblTmpDt_Beg: TDateTimeField;
    tblTmpDt_End: TDateTimeField;
    tblTmpOldCh: TFloatField;
    tblTmpOldSm: TFloatField;
    tblTmpChas: TFloatField;
    tblTmpSumma: TFloatField;
    tblTmpd_Ch: TFloatField;
    tblTmpd_Sm: TFloatField;
    tblTmpSpec_NR: TIntegerField;
    tblTmpNotes: TStringField;
    tblTmpNR: TAutoIncField;
    tblTmpdCh: TFloatField;
    tblTmpdSm: TFloatField;
    tblTmpShVidN: TStringField;
    bBtnOk: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblTmpCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CreOpenTblTmp(dZaMG : TDateTime; tblNU : TTable);
  public
    { Public declarations }
  end;

function ShowReRe(dZaMG : TDateTime; tblNU : TTable) : boolean;

const SECTION = 'Z_ShReRe';

var
  FormSh_NU: TFormSh_NU;
  bIsResults : boolean;

implementation

uses A_Const, Z_Main, Z_Dm;

{$R *.dfm}

//------------------------------------------------------------------------------
function ShowReRe(dZaMG : TDateTime; tblNU : TTable) : boolean;
begin
  Result := false;
  FormSh_NU := TFormSh_NU.Create(Application);
  with FormSh_NU do begin
    bIsResults := false;
    Caption := 'Результаты пересчета';
    CreOpenTblTmp(dZaMG, tblNU);
    dsrcTmp.DataSet := tblTmp;
{
    if not bIsResults then begin
      bBtnCancel.Caption := 'Закрыть';
      bBtnOk.Visible := false;
      Label1.Visible := false;
    end;
}
    if ShowModal = mrOk then
      Result := true;
    with tblTmp do begin
      if Active then Close;
      if Exists and not bFlagDbg then
        DeleteTable;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSh_NU.CreOpenTblTmp(dZaMG : TDateTime; tblNU : TTable);
begin
  with tblTmp do begin
    if Active then Close;
    DataBaseName := cDirTemp;
    if Exists then DeleteTable;
    BatchMove(tblNU, batCopy);
    Filter := 'ZaMesGod <> ' + DateToStr(dZaMG);
    Filtered := true;
    Open;
    First;
    while not Eof do begin
      if (tblTmpOldCh.AsFloat - tblTmpChas.AsFloat <> 0) or
                (tblTmpOldSm.AsFloat - tblTmpSumma.AsFloat <> 0) then begin
        bIsResults := true;
        Break;
      end;
      Next;
    end;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSh_NU.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 50);
    Height := ReadInteger(SECTION, 'wH', 480);
    Width  := ReadInteger(SECTION, 'wW', 600);
    Free;
  end;
  if FileExists(cDirVids + 'Z_ShReRe.vid') then
    dbgrTmp.Columns.LoadFromFile(cDirVids + 'Z_ShReRe.vid');
end;
//------------------------------------------------------------------------------
procedure TFormSh_NU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
  dbgrTmp.Columns.SaveToFile(cDirVids + 'Z_ShReRe.vid');
end;

procedure TFormSh_NU.tblTmpCalcFields(DataSet: TDataSet);
begin
  tblTmpdCh.AsFloat := tblTmpChas.AsFloat - tblTmpOldCh.AsFloat;
  tblTmpdSm.AsFloat := tblTmpSumma.AsFloat - tblTmpOldSm.AsFloat;
end;

end.
