unit z_GtPrSp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, DBTables;

type
  TFormGtPredSps = class(TForm)
    dbgrYear: TDBGrid;
    dsrcYear: TDataSource;
    rBtnCopyPred: TRadioButton;
    rBtnCreFromPred: TRadioButton;
    bBtnOk: TBitBtn;
    bBtnCancel: TBitBtn;
    qryTmp: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsrcYearDataChange(Sender: TObject; Field: TField);
    procedure dbgrYearDblClick(Sender: TObject);
    procedure dbgrYearEnter(Sender: TObject);
    procedure dbgrYearExit(Sender: TObject);
  private
    { Private declarations }
    nSvCreCase : SmallInt;
    procedure CreNewCopySps(nMaxGod, nNewGod : SmallInt);
    procedure CreNewNuSps(nMaxGod, nNewGod : SmallInt);
  public
    { Public declarations }
  end;

function GetPredSps(cdsYear : TDataSet; nMaxGod : SmallInt;
                                                var nYear : SmallInt) : boolean;

const SECTION = 'z_GtPrSp';

var
  FormGtPredSps: TFormGtPredSps;

implementation

uses a_Const, a_Lib, a_Dm, z_Dm, z_Main, z_PrSps;

{$R *.dfm}

//------------------------------------------------------------------------------
function GetPredSps(cdsYear : TDataSet; nMaxGod : SmallInt;
                                                var nYear : SmallInt) : boolean;
begin
  Result := false;
  FormGtPredSps := TFormGtPredSps.Create(Application);
  with FormGtPredSps do begin
    Caption := 'Выбор года';
    dsrcYear.DataSet := cdsYear;
    if nYear > 0 then
      dsrcYear.DataSet.Locate('YearInt', nYear, []);
    rBtnCopyPred.Caption := 'Копировать ' + IntToStr(nMaxGod) + ' год';
    rBtnCopyPred.Hint := 'Создать новый копированием списка ' +
                                                    IntToStr(nMaxGod) + ' года';
    rBtnCreFromPred.Caption :=
                        'Создать из данных за ' + IntToStr(nMaxGod) + ' год';
    rBtnCreFromPred.Hint := 'Создать из данных о начислениях по виду 1005 за ' +
                                                  IntToStr(nMaxGod) + ' год';
    if ShowModal = mrOk then begin
      nYear := cdsYear.FieldByName('YearInt').AsInteger;
      if nYear = 9999 then begin
        // тут же создать новый список
        if rBtnCopyPred.Checked then
          CreNewCopySps(nMaxGod, nMaxGod+1)
        else
          CreNewNuSps(nMaxGod, nMaxGod+1);
        nYear := nMaxGod + 1; end
      else begin
        ;
      end;
      Result := true;
    end;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtPredSps.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 225);
    Width  := ReadInteger(SECTION, 'wW', 245);
    nSvCreCase := ReadInteger(SECTION, 'nSvCreCase', 1);
    Free;
  end;
  if nSvCreCase = 1 then
    rBtnCopyPred.Checked := true
  else
    rBtnCreFromPred.Checked := true;
  if FileExists(cDirVids + 'GtPrSps.vid') then
    dbgrYear.Columns.LoadFromFile(cDirVids + 'GtPrSps.vid');
end;
//------------------------------------------------------------------------------
procedure TFormGtPredSps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrYear.Columns.SaveToFile(cDirVids + 'GtPrSps.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    if rBtnCopyPred.Checked then
      WriteInteger(SECTION, 'nSvCreCase', 1)
    else
      WriteInteger(SECTION, 'nSvCreCase', 2);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtPredSps.dsrcYearDataChange(Sender: TObject; Field: TField);
begin
  rBtnCopyPred.Enabled :=
                  dsrcYear.DataSet.FieldByName('YearInt').AsInteger = 9999;
  rBtnCreFromPred.Enabled := rBtnCopyPred.Enabled;
end;
//------------------------------------------------------------------------------
procedure TFormGtPredSps.CreNewCopySps(nMaxGod, nNewGod: SmallInt);
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_PredSps (KdUsr, KdObj, TabN, WYear) ' +
            ' Select KdUsr, KdObj, TabN, :nNewGod from Z_PredSps ' +
            ' where WYear = :nMaxGod');
    ParamByName('nNewGod').AsInteger := nNewGod;
    ParamByName('nMaxGod').AsInteger := nMaxGod;
    ExecSQL;
    SQL.Clear;
    SQL.Add('Select Count( * ) CNT from Z_PredSps ' +
            ' where WYear = :nNewGod');
    ParamByName('nNewGod').AsInteger := nNewGod;
    Open;
    ShowMessage('Введено ' + FieldByName('Cnt').AsString + ' с годом ' +
                        IntToStr(nNewGod));
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtPredSps.CreNewNuSps(nMaxGod, nNewGod: SmallInt);
var dDtPrcB, dDtPrcE : TDateTime;
begin
  dDtPrcB := EncodeDate(nMaxGod, 1, 1);
  dDtPrcE := EncodeDate(nMaxGod, 12, 1);
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into Z_PredSps (KdUsr, KdObj, TabN, WYear) ' +
            ' Select distinct :nKdUsr, KdObj, TabN, :nNewGod ' +
            ' from Z_NU where DtProc >= :dDtPrcB and DtProc <= :dDtPrcE and ' +
            ' VidN = "1005"');
    ParamByName('nKdUsr').AsInteger  := nAppKdUsr;
    ParamByName('nNewGod').AsInteger := nNewGod;
    ParamByName('dDtPrcB').AsDateTime := dDtPrcB;
    ParamByName('dDtPrcE').AsDateTime := dDtPrcE;
    ExecSQL;
    SQL.Clear;
    SQL.Add('Select Count( * ) CNT from Z_PredSps ' +
            ' where WYear = :nNewGod');
    ParamByName('nNewGod').AsInteger := nNewGod;
    Open;
    ShowMessage('Введено записей: ' + FieldByName('Cnt').AsString + ' с годом ' +
                        IntToStr(nNewGod));
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormGtPredSps.dbgrYearDblClick(Sender: TObject);
begin
  if dsrcYear.DataSet.RecordCount > 0 then
    ModalResult := mrOk;
end;
//------------------------------------------------------------------------------
procedure TFormGtPredSps.dbgrYearEnter(Sender: TObject);
begin
  dbgrYear.FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormGtPredSps.dbgrYearExit(Sender: TObject);
begin
  dbgrYear.FixedColor := clBtnFace;
end;

end.
