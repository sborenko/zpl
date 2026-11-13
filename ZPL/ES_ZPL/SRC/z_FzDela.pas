unit z_FzDela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, ExtCtrls, Grids, DBGrids, DB, DBTables, SQLMemMain,
  StdCtrls, Buttons, DBCtrls;

type
  TFormFzDela = class(TForm)
    qryTmp: TQuery;
    dbgrFz: TDBGrid;
    Panel1: TPanel;
    smtFz: TSQLMemTable;
    dsrcFz: TDataSource;
    smtFzTabN: TIntegerField;
    smtFzFam: TStringField;
    smtFzIma: TStringField;
    smtFzOtch: TStringField;
    smtFzSmFor: TFloatField;
    smtFzSmSvPrg: TFloatField;
    smtFzSmForFZ: TFloatField;
    smtFzSmFzNado: TFloatField;
    smtFzSmFzFakt: TFloatField;
    smtFzFamIO: TStringField;
    BitBtn1: TBitBtn;
    LabelCntFzRec: TLabel;
    smqTmp: TSQLMemQuery;
    DBNavigator1: TDBNavigator;
    Splitter1: TSplitter;
    dbgrTts: TDBGrid;
    dsrcTts: TDataSource;
    smqTts: TSQLMemQuery;
    smqTtsSmmFor: TFloatField;
    smqTtsSmmSvPrg: TFloatField;
    smqTtsSmmForFz: TFloatField;
    smqTtsSmmFzNado: TFloatField;
    smqTtsSmmFakt: TFloatField;
    smqTtsSmmPerebor: TFloatField;
    sBtnFilter: TSpeedButton;
    smtFzSmRazn: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure smtFzCalcFields(DataSet: TDataSet);
    procedure sBtnFilterClick(Sender: TObject);
    procedure dbgrFzDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure CreOpenSmtFz(dDtPrc : TDateTime);
    procedure SetSmtFzFilter;
  public
    { Public declarations }
  end;

procedure ShwFzDela(dDtPrc : TDateTime);

const SECTION = 'z_FzDela';

var
  FormFzDela: TFormFzDela;

implementation

uses a_Const, a_DM, z_DM, z_Main, a_Lib;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShwFzDela(dDtPrc : TDateTime);
begin
  FormFzDela := TFormFzDela.Create(Application);
  with FormFzDela do begin
    CreOpenSmtFz(dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFzDela.CreOpenSmtFz(dDtPrc: TDateTime);
begin
  dsrcTts.DataSet := nil;
  with smtFz do begin
    if Active then
      Close;
    if Exists then
      DeleteTable;
    CreateTable;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct v.TabN, u.Fam, u.Ima, u.Otch, ' +
            ' Sum(v.Summa) as SmFor from ViNuMain v ' +
            ' Left Outer Join Z_Upi u on u.TabN = v.TabN ' +
            ' where v.DtProc = :dDtPrc and v.VidN < "6000" and ' +
            ' v.Sp_FZ = "1" group by v.Tabn, u.Fam, u.Ima, u.Otch');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    smtFz.ImportTable(qryTmp);
    smtFz.Open;
    LabelCntFzRec.Caption := 'Записей: ' + IntToStr(smtFz.RecordCount);
    Close;
    SQL.Clear;
    SQL.Add('Select TabN, Sum(Summa) as SmSvPrg from Z_NU ' +
            ' where DtProc = :dDtPrc and VidN = "8674" ' +
            ' group by Tabn');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if smtFz.Locate('TabN', FieldByName('TabN').AsInteger, []) then begin
        smtFz.Edit;
        smtFzSmSvPrg.AsFloat := FieldByName('SmSvPrg').AsFloat;
        smtFZ.Post;
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select TabN, Sum(Summa) as SmFzFakt from Z_NU ' +
            ' where DtProc = :dDtPrc and VidN = "6501" ' +
            ' group by Tabn');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if smtFz.Locate('TabN', FieldByName('TabN').AsInteger, []) then begin
        smtFz.Edit;
        smtFzSmFzFakt.AsFloat := -FieldByName('SmFzFakt').AsFloat;
        smtFZ.Post;
      end;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  with smqTmp do begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('Update ' + smtFz.TableName + ' set SmSvPrg = 0 ' +
                                           ' where SmSvPrg is NULL');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Update ' + smtFz.TableName + ' set SmForFz = (smFor - SmSvPrg), ' +
            ' SmFzNado = SmForFz * 0.006');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Update ' + smtFz.TableName + ' set SmRazn = SmFzFakt - SmFzNado');
    ExecSQL;
    SQL.Clear;
  end;
  with smqTts do begin
    if Active then Close;
    SQL.Clear;
    SQL.Add('Select Sum(SmFor) as SmmFor, Sum(SmSvPrg) as SmmSvPrg, ' +
            ' Sum(SmForFz) as SmmForFz, Sum(SmFzNado) as SmmFzNado, ' +
            ' Sum(SmFzFakt) as SmmFakt, ' +
            ' Sum(SmFzFakt) - Sum(SmFzNado) as SmmPerebor from ' +
            smtFz.TableName);
    Open;
    dsrcTts.DataSet := smqTts;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFzDela.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 400);
    Width  := ReadInteger(SECTION, 'wW', 600);
    Free;
  end;
  if FileExists(cDirVids + 'z_FzDe01.vid') then
    dbgrFz.Columns.LoadFromFile(cDirVids + 'z_FzDe01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormFzDela.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrFz.Columns.SaveToFile(cDirVids + 'z_FzDe01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
  with smtFz do begin
    if Active then Close;
    if Exists then
      DeleteTable;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFzDela.smtFzCalcFields(DataSet: TDataSet);
begin
  smtFzFamIO.AsString := MyFamIO(smtFzFam.AsString, smtFzIma.AsString,
                                                       smtFzOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormFzDela.sBtnFilterClick(Sender: TObject);
begin
  SetSmtFzFilter;
end;
//------------------------------------------------------------------------------
procedure TFormFzDela.SetSmtFzFilter;
begin
  with smtFz do begin
    if sBtnFilter.Down then begin
      Filter := '(SmFzNado - SmFzFakt > 0.01) or (SmFzNado - SmFzFakt < -0.01)';
      Filtered := true; end
    else begin
      Filter := '';
      Filtered := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormFzDela.dbgrFzDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with dbgrFz.Canvas do begin
    if not (gdFocused in State) then begin
      if (smtFz.FieldByName('SmRazn').AsFloat > 0.05) or
            (smtFz.FieldByName('SmRazn').AsFloat < -0.05) then
        Font.Color := clBlue;
    end;
  end;
  dbgrFz.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
