unit z_ViPere;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, StdCtrls, Buttons, DB, Grids, DBGrids, DBTables, ExtCtrls;

type
  TFormViPere = class(TForm)
    Panel1: TPanel;
    qryPere: TQuery;
    dsrcPere: TDataSource;
    dbgrPere: TDBGrid;
    qryPereNR: TIntegerField;
    qryPereBM: TStringField;
    qryPereDTBM: TDateTimeField;
    qryPereKDSPS: TSmallintField;
    qryPereTABN: TIntegerField;
    qryPereDT_BEG: TDateTimeField;
    qryPereKDTEMU: TSmallintField;
    qryPereKDOBJ: TSmallintField;
    qryPereKDKATP: TSmallintField;
    qryPereNPD: TSmallintField;
    qryPerePRCWRKTIME: TFloatField;
    qryPereSO: TSmallintField;
    qryPereOKLTRF: TFloatField;
    qryPereAVANS: TFloatField;
    qryPereSP_AV: TStringField;
    qryPereCODE: TStringField;
    qryPereZ_KPP: TStringField;
    qryPereKDDOLGN: TSmallintField;
    qryPereDOLGNOST: TStringField;
    qryPereKDSPZ: TSmallintField;
    qryPerePR_PENS: TSmallintField;
    qryPereSOVM: TSmallintField;
    qryPerePDNLG: TSmallintField;
    qryPerePROCLG: TFloatField;
    qryPereKOLMIN: TSmallintField;
    qryPerePRFS: TSmallintField;
    qryPereNR_PRIKAZA: TStringField;
    qryPereDT_PRIKAZA: TDateTimeField;
    qryPereNOTES: TStringField;
    qryPereINV: TSmallintField;
    qryPereRANG: TSmallintField;
    qryPereRAZR: TSmallintField;
    qryPereDT_END: TDateTimeField;
    qryPereOLDKDOBJ: TSmallintField;
    qryPerePRDEKR: TStringField;
    qryPereCMBOKL: TStringField;
    qryPereSPEC_NR: TIntegerField;
    qryPereNRPKT: TIntegerField;
    qryPereDTVPKT: TDateTimeField;
    qryPereNOINDX: TStringField;
    qryPereOLDKDOK: TSmallintField;
    qryPereNEWKDOK: TSmallintField;
    bBtnCancel: TBitBtn;
    LabelSort: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrPereDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure OpenQryPere(nTabN : integer);
  public
    { Public declarations }
  end;

procedure ViewPere(nTabN : integer; cFamIO : ShortString);

const SECTION = 'z_ViPere';

var
  FormViPere: TFormViPere;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, a_Lib;


{$R *.dfm}

//------------------------------------------------------------------------------
procedure ViewPere(nTabN : integer; cFamIO : ShortString);
begin
  FormViPere := TFormViPere.Create(Application);
  with FormViPere do begin
    Caption := 'Перемещения по ТабНр ' + IntToStr(nTabN) +
                                        ' ('  + cFamIO + ')';
    LabelSort.Caption := ' Сортировка по полю "Начиная с" в обратном порядке.';
    OpenQryPere(nTabN);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormViPere.FormCreate(Sender: TObject);
var nSortP, nSortO : Smallint;
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 400);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 580);
    Width  := ReadInteger(SECTION, 'wW', 825);
    nSortP := ReadInteger(SECTION, 'nSortP', 1);
    nSortO := ReadInteger(SECTION, 'nSortO', 1);
    Free;
  end;
  if FileExists(cDirVids + 'ViPere0.vdi') then
    dbgrPere.Columns.LoadFromFile(cDirVids + 'ViPere0.vdi');
end;
//------------------------------------------------------------------------------
procedure TFormViPere.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
  dbgrPere.Columns.SaveToFile(cDirVids + 'ViPere0.vdi');
end;
//------------------------------------------------------------------------------
procedure TFormViPere.OpenQryPere(nTabN: integer);
begin
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select first 10 * from Z_Pere ' +
            ' where TabN = :nTabN order by Dt_Beg desc ' );
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormViPere.dbgrPereDrawColumnCell(Sender: TObject; const Rect: TRect;
                    DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrPere.Canvas do begin
    if not (gdFocused in State) then begin
      cFldNm := UpperCase(Column.FieldName);
      if (cFldNm = 'PRCWRKTIME') and (not Column.Field.IsNull) and
                                            (Column.Field.AsFloat <> 100) then
        Font.Color := clRed
      else begin                         {оклад из нескольких частей}
        if dbgrPere.DataSource.DataSet.FieldByName('CmbOkl').AsString = '1' then
          Font.Color := clBlue
        else
          Font.Color := clWindowText;
      end;
      if (cFldNm = 'BM') and
           (not Column.Field.IsNull and (Column.Field.AsString = 'Y')) then
        Brush.Color := clLime; //clFuchsia;

      if (cFldNm = 'DTBM') and
           (not Column.Field.IsNull) then
        Brush.Color := clLime; //clFuchsia;
      if cFldNm = 'SMCMBOKL' then
        Font.Color := clMaroon;
      if (cFldNm = 'SMCMBOKL') and
         (dbgrPere.DataSource.DataSet.FieldByName('NoIndx').AsString = '1') then
        Brush.Color := clLime;
    end;
  end;
  dbgrPere.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
