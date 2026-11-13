unit z_ChDtMO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  DBTables, DBClient;

type
  TFormChDatMO = class(TForm)
    qryTmp: TQuery;
    dbgrTmp: TDBGrid;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    cdsTmp: TClientDataSet;
    cdsTmpTabN: TIntegerField;
    cdsTmpDtProc: TDateField;
    cdsTmpZaMesGod: TDateField;
    cdsTmpPSch: TStringField;
    cdsTmpSm_Nach: TFloatField;
    cdsTmpSm_Udrg: TFloatField;
    cdsTmpSm_Vupl: TFloatField;
    cdsTmpSm_Ost: TFloatField;
    dsrcTmp: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dnGridEnter(Sender: TObject);
    procedure dnGridExit(Sender: TObject);
    procedure dbgrTmpDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure CreOpenCdsTmp(nTabN : integer; dDtPrc : TDateTime);
  public
    { Public declarations }
  end;

procedure ChDatForMO(nTabN : integer; dDtPrc : TDateTime; cFamIO : ShortString);

const SECTION = 'z_ChDtMo';

var
  FormChDatMO: TFormChDatMO;

implementation

uses A_Const, A_Lib, A_DM, Z_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ChDatForMO(nTabN : integer; dDtPrc : TDateTime; cFamIO : ShortString);
var nY, nM, nD : word;
begin
  FormChDatMO := TFormChDatMO.Create(Application);
  with FormChDatMO do begin
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'ТабН ' + IntToStr(nTabN) + '  [ ' + cFamIO + ' ]  в ' +
              MesPredlogn(nM) + ' ' + IntToStr(nY) + ' г.';
    CreOpenCdsTmp(nTabN, dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.CreOpenCdsTmp(nTabN: integer; dDtPrc: TDateTime);
var nSmNach, nSmUdrg, nSmVupl, nSmOst : double;
begin
  with cdsTmp do begin
    If Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select TabN, PSCH, DtProc, ZaMesGod, Round(Sum(Summa),2) SMM ' +
            ' from ViNuMain ' +
            ' where TabN = :nTabN and DtProc = :dDtPrc  and ' +
            ' VidN < "2700" group by TabN, PSCH, DtProc, ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      cdsTmp.Append;
      cdsTmpTabN.AsString     := FieldByName('TabN').AsString;
      cdsTmpDtProc.AsString   := FieldByName('DtProc').AsString;
      cdsTmpZaMesGod.AsString := FieldByName('ZaMesGod').AsString;
      cdsTmpPSch.AsString     := FieldByName('PSch').AsString;
      cdsTmpSm_Nach.AsString  := FieldByName('SMM').AsString;
      cdsTmpSm_Udrg.AsFloat   := 0;
      cdsTmpSm_Vupl.AsFloat   := 0;
      cdsTmpSm_Ost.AsFloat    := 0;
      cdsTmp.Post;
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select TabN, PSCH, DtProc, ZaMesGod, Round(Sum(Summa),2) SMM ' +
            ' from ViNuMain ' +
            ' where TabN = :nTabN and DtProc = :dDtPrc  and ' +
            ' VidN > "5000" and VidN < "7500" and not ' +
            ' (VidN >= "6623" and VidN <= "6626") ' +
            ' group by TabN, PSCH, DtProc, ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if not cdsTmp.Locate('PSch;ZaMesGod',
                    VarArrayOf([FieldByName('PSch').AsString,
                               FieldByName('ZaMesGod').AsDateTime]),
                                                                 []) then begin
        cdsTmp.Append;
        cdsTmpTabN.AsString     := FieldByName('TabN').AsString;
        cdsTmpDtProc.AsString   := FieldByName('DtProc').AsString;
        cdsTmpZaMesGod.AsString := FieldByName('ZaMesGod').AsString;
        cdsTmpPSch.AsString     := FieldByName('PSch').AsString; end
      else
        cdsTmp.Edit;
      cdsTmpSm_Udrg.AsFloat := cdsTmpSm_Udrg.AsFloat +
                                              FieldByName('SMM').AsFloat;
      cdsTmp.Post;
      Next;
    end;
    Close;
    SQL.Clear;
    SQL.Add('Select TabN, PSCH, DtProc, ZaMesGod, Round(Sum(Summa),2) SMM ' +
            ' from ViNuMain ' +
            ' where TabN = :nTabN and DtProc = :dDtPrc and ' +
            ' VidN > "7500" and VidN < "8600"  ' +
            ' group by TabN, PSCH, DtProc, ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if not cdsTmp.Locate('PSch;ZaMesGod',
                    VarArrayOf([FieldByName('PSch').AsString,
                               FieldByName('ZaMesGod').AsDateTime]),
                                                                 []) then begin
        cdsTmp.Append;
        cdsTmpTabN.AsString     := FieldByName('TabN').AsString;
        cdsTmpDtProc.AsString   := FieldByName('DtProc').AsString;
        cdsTmpZaMesGod.AsString := FieldByName('ZaMesGod').AsString;
        cdsTmpPSch.AsString     := FieldByName('PSch').AsString; end
      else
        cdsTmp.Edit;
      cdsTmpSm_Vupl.AsFloat := cdsTmpSm_Vupl.AsFloat +
                                              FieldByName('SMM').AsFloat;
      cdsTmp.Post;
      Next;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  nSmNach := 0;
  nSmUdrg := 0;
  nSmVupl := 0;
  nSmOst  := 0;
  with cdsTmp do begin
    First;
    while not Eof do begin
      Edit;
      cdsTmpSm_Ost.AsFloat := cdsTmpSm_Nach.AsFloat + cdsTmpSm_Udrg.AsFloat +
                                            cdsTmpSm_Vupl.AsFloat;
      Post;
      nSmNach := nSmNach + cdsTmpSm_Nach.AsFloat;
      nSmUdrg := nSmUdrg + cdsTmpSm_Udrg.AsFloat;
      nSmVupl := nSmVupl + cdsTmpSm_Vupl.AsFloat;
      nSmOst  := nSmOst  + cdsTmpSm_Ost.AsFloat;
      Next;
    end;
    Append;
    cdsTmpPSch.AsString := 'Итого';
    cdsTmpSm_Nach.AsFloat := nSmNach;
    cdsTmpSm_Udrg.AsFloat := nSmUdrg;
    cdsTmpSm_Vupl.AsFloat := nSmVupl;
    cdsTmpSm_Ost.AsFloat  := nSmOst;
    Post;
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 250);
    Width  := ReadInteger(SECTION, 'wW', 600);
    Free;
  end;
  if FileExists(cDirVids + 'DtFrMo.vid') then
    dbgrTmp.Columns.LoadFromFile(cDirVids + 'DtFrMo.vid');
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrTmp.Columns.SaveToFile(cDirVids + 'DtFrMo.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.dnGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.dnGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.dbgrTmpDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrTmp.Canvas do begin
    if not (gdFocused in State) then begin
      if cdsTmpPSch.AsString = 'Итого' then
        Brush.Color := clBtnFace;
    end;
  end;
  dbgrTmp.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
