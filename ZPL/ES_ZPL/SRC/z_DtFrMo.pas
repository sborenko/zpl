unit z_DtFrMo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  DBTables, DBClient, ComCtrls;

type
  TFormDatForMO = class(TForm)
    qryTmp: TQuery;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    cdsDet: TClientDataSet;
    cdsDetTabN: TIntegerField;
    cdsDetDtProc: TDateField;
    cdsDetZaMesGod: TDateField;
    cdsDetPSch: TStringField;
    cdsDetSm_Nach: TFloatField;
    cdsDetSm_Udrg: TFloatField;
    cdsDetSm_Vupl: TFloatField;
    cdsDetSm_Ost: TFloatField;
    dsrcDet: TDataSource;
    cdsShort: TClientDataSet;
    dsrcShort: TDataSource;
    cdsShortTabN: TIntegerField;
    cdsShortDtProc: TDateField;
    cdsShortPSch: TStringField;
    cdsShortSm_Nach: TFloatField;
    cdsShortSm_Udrg: TFloatField;
    cdsShortSm_Vupl: TFloatField;
    cdsShortSm_Ost: TFloatField;
    dbgrShort: TDBGrid;
    dbgrDet: TDBGrid;
    Splitter1: TSplitter;
    cdsShortSm_VDlg: TFloatField;
    cdsShortSm_Vzvr: TFloatField;
    cdsDetSm_VDlg: TFloatField;
    cdsDetSm_Vzvr: TFloatField;
    LabelSort: TLabel;
    rBtnSortByPSch: TRadioButton;
    rBtnSortByZaMG: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dnGridEnter(Sender: TObject);
    procedure dnGridExit(Sender: TObject);
    procedure dbgrDetDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrShortDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rBtnSortClick(Sender: TObject);
    procedure cdsDetZaMesGodGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure CreOpenCdsShortDet(nTabN : integer; dDtPrc : TDateTime);
    procedure AddInShortSmNach(cPSch : ShortString; nSmNach : double);
    procedure AddInShortSmUdrg(cPSch : ShortString; nSmUdrg : double);
    procedure AddInShortSmVupl(cPSch : ShortString; nSmVupl : double);
    procedure AddInShortSmVDlg(cPSch : ShortString; nSmVDlg : double);
    procedure AddInShortSmVzvr(cPSch : ShortString; nSmVzvr : double);
  public
    { Public declarations }
  end;

procedure ShDatForMO(nTabN : integer; dDtPrc : TDateTime; cFamIO : ShortString);

const SECTION = 'z_DtFrMo';

var
  FormDatForMO: TFormDatForMO;

implementation

uses A_Const, A_Lib, A_DM, Z_DM;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShDatForMO(nTabN : integer; dDtPrc : TDateTime; cFamIO : ShortString);
var nY, nM, nD : word;
begin
  FormDatForMO := TFormDatForMO.Create(Application);
  with FormDatForMO do begin
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Картика по счетам.   ТабН ' + IntToStr(nTabN) + '  [ ' +
               cFamIO + ' ]  в ' + MesPredlogn(nM) + ' ' + IntToStr(nY) + ' г.';
    CreOpenCdsShortDet(nTabN, dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.CreOpenCdsShortDet(nTabN: integer; dDtPrc: TDateTime);
var nSmNach, nSmUdrg, nSmVupl, nSmOst, nSmVDlg, nSmVzvr : double;
begin
  with cdsShort do begin
    If Active then Close;
    CreateDataSet;
    Open;
  end;
  with cdsDet do begin
    If Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;   // Выбор приходов
    SQL.Add('Select TabN, PSCH, DtProc, ZaMesGod, Round(Sum(Summa),2) SMM ' +
            ' from ViNuMain ' +
            ' where TabN = :nTabN and DtProc = :dDtPrc  and ' +
            ' VidN <= "2705" group by TabN, PSCH, DtProc, ZaMesGod');
                // вид 2705 Прх1ВКассу должны увидеть (как в м/о)
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      cdsDet.Append;
      cdsDetTabN.AsString     := FieldByName('TabN').AsString;
      cdsDetDtProc.AsString   := FieldByName('DtProc').AsString;
      cdsDetZaMesGod.AsString := FieldByName('ZaMesGod').AsString;
      cdsDetPSch.AsString     := FieldByName('PSch').AsString;
      cdsDetSm_Nach.AsString  := FieldByName('SMM').AsString;
      cdsDetSm_Udrg.AsFloat   := 0;
      cdsDetSm_Vupl.AsFloat   := 0;
      cdsDetSm_Ost.AsFloat    := 0;
      cdsDetSm_VDlg.AsFloat   := 0;
      cdsDetSm_Vzvr.AsFloat   := 0;
      cdsDet.Post;
      AddInShortSmNach(FieldByName('PSch').AsString,
                                                    FieldByName('SMM').AsFloat);
      Next;
    end;
    Close;
    SQL.Clear;                 // Выбор удержаний
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
      if not cdsDet.Locate('PSch;ZaMesGod',
                    VarArrayOf([FieldByName('PSch').AsString,
                               FieldByName('ZaMesGod').AsDateTime]),
                                                                 []) then begin
        cdsDet.Append;
        cdsDetTabN.AsString     := FieldByName('TabN').AsString;
        cdsDetDtProc.AsString   := FieldByName('DtProc').AsString;
        cdsDetZaMesGod.AsString := FieldByName('ZaMesGod').AsString;
        cdsDetPSch.AsString     := FieldByName('PSch').AsString;
        cdsDetSm_VDlg.AsFloat   := 0;
        cdsDetSm_Vzvr.AsFloat   := 0; end
      else
        cdsDet.Edit;
      cdsDetSm_Udrg.AsFloat := cdsDetSm_Udrg.AsFloat +
                                              FieldByName('SMM').AsFloat;
      cdsDet.Post;
      AddInShortSmUdrg(FieldByName('PSch').AsString,
                                                    FieldByName('SMM').AsFloat);
      Next;
    end;
    Close;
    SQL.Clear;                 // Выбор выплат
    SQL.Add('Select TabN, PSCH, DtProc, ZaMesGod, Round(Sum(Summa),2) SMM ' +
            ' from ViNuMain ' +
            ' where TabN = :nTabN and DtProc = :dDtPrc and ' +
            ' VidN > "7500" and VidN < "8600"  ' +
            ' group by TabN, PSCH, DtProc, ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if not cdsDet.Locate('PSch;ZaMesGod',
                    VarArrayOf([FieldByName('PSch').AsString,
                               FieldByName('ZaMesGod').AsDateTime]),
                                                                 []) then begin
        cdsDet.Append;
        cdsDetTabN.AsString     := FieldByName('TabN').AsString;
        cdsDetDtProc.AsString   := FieldByName('DtProc').AsString;
        cdsDetZaMesGod.AsString := FieldByName('ZaMesGod').AsString;
        cdsDetPSch.AsString     := FieldByName('PSch').AsString;
        cdsDetSm_VDlg.AsFloat   := 0;
        cdsDetSm_Vzvr.AsFloat   := 0; end
      else
        cdsDet.Edit;
      cdsDetSm_Vupl.AsFloat := cdsDetSm_Vupl.AsFloat +
                                              FieldByName('SMM').AsFloat;
      cdsDet.Post;
      AddInShortSmVupl(FieldByName('PSch').AsString,
                                                    FieldByName('SMM').AsFloat);
      Next;
    end;
    Close;
    SQL.Clear;                 // Выбор сумм в долг ТМ
    SQL.Add('Select TabN, PSCH, DtProc, ZaMesGod, Round(Sum(Summa),2) SMM ' +
            ' from ViNuMain ' +
            ' where TabN = :nTabN and DtProc = :dDtPrc and ' +
            ' VidN = "2724" group by TabN, PSCH, DtProc, ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if not cdsDet.Locate('PSch;ZaMesGod',
                    VarArrayOf([FieldByName('PSch').AsString,
                               FieldByName('ZaMesGod').AsDateTime]),
                                                                 []) then begin
        cdsDet.Append;
        cdsDetTabN.AsString     := FieldByName('TabN').AsString;
        cdsDetDtProc.AsString   := FieldByName('DtProc').AsString;
        cdsDetZaMesGod.AsString := FieldByName('ZaMesGod').AsString;
        cdsDetPSch.AsString     := FieldByName('PSch').AsString;
        cdsDetSm_Vzvr.AsFloat   := 0; end
      else
        cdsDet.Edit;
      cdsDetSm_VDlg.AsFloat := cdsDetSm_VDlg.AsFloat +
                                              FieldByName('SMM').AsFloat;
      cdsDet.Post;
      AddInShortSmVDlg(FieldByName('PSch').AsString,
                                                    FieldByName('SMM').AsFloat);
      Next;
    end;
    Close;
    SQL.Clear;                 // Выбор возвратов долга ПМ
    SQL.Add('Select TabN, PSCH, DtProc, ZaMesGod, Round(Sum(Summa),2) SMM ' +
            ' from ViNuMain ' +
            ' where TabN = :nTabN and DtProc = :dDtPrc and ' +
            ' VidN = "6624" group by TabN, PSCH, DtProc, ZaMesGod');
    ParamByName('nTabN').AsInteger := nTabN;
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      if not cdsDet.Locate('PSch;ZaMesGod',
                    VarArrayOf([FieldByName('PSch').AsString,
                               FieldByName('ZaMesGod').AsDateTime]),
                                                                 []) then begin
        cdsDet.Append;
        cdsDetTabN.AsString     := FieldByName('TabN').AsString;
        cdsDetDtProc.AsString   := FieldByName('DtProc').AsString;
        cdsDetZaMesGod.AsString := FieldByName('ZaMesGod').AsString;
        cdsDetPSch.AsString     := FieldByName('PSch').AsString; end
      else
        cdsDet.Edit;
      cdsDetSm_Vzvr.AsFloat := cdsDetSm_Vzvr.AsFloat +
                                              FieldByName('SMM').AsFloat;
      cdsDet.Post;
      AddInShortSmVzvr(FieldByName('PSch').AsString,
                                                    FieldByName('SMM').AsFloat);
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
  nSmVDlg := 0;
  nSmVzvr := 0;
  with cdsShort do begin
    First;
    while not Eof do begin
      Edit;
      cdsShortSm_Ost.AsFloat := cdsShortSm_Nach.AsFloat +
                                       cdsShortSm_Udrg.AsFloat +
                                            cdsShortSm_Vupl.AsFloat;
      Post;
      nSmNach := nSmNach + cdsShortSm_Nach.AsFloat;
      nSmUdrg := nSmUdrg + cdsShortSm_Udrg.AsFloat;
      nSmVupl := nSmVupl + cdsShortSm_Vupl.AsFloat;
      nSmOst  := nSmOst  + cdsShortSm_Ost.AsFloat;
      nSmVDlg := nSmVDlg + cdsShortSm_VDlg.AsFloat;
      nSmVzvr := nSmVzvr + cdsShortSm_Vzvr.AsFloat;
      Next;
    end;
    Append;
    cdsShortPSch.AsString := 'Итого';
    cdsShortSm_Nach.AsFloat := nSmNach;
    cdsShortSm_Udrg.AsFloat := nSmUdrg;
    cdsShortSm_Vupl.AsFloat := nSmVupl;
    cdsShortSm_Ost.AsFloat  := nSmOst;
    cdsShortSm_VDlg.AsFloat := nSmVDlg;
    cdsShortSm_Vzvr.AsFloat := nSmVzvr;
    Post;
    IndexName := 'OnPSch';
    First;
  end;
  nSmNach := 0;
  nSmUdrg := 0;
  nSmVupl := 0;
  nSmOst  := 0;
  nSmVDlg := 0;
  nSmVzvr := 0;
  with cdsDet do begin
    First;
    while not Eof do begin
      Edit;
      cdsDetSm_Ost.AsFloat := cdsDetSm_Nach.AsFloat + cdsDetSm_Udrg.AsFloat +
                                            cdsDetSm_Vupl.AsFloat;
      Post;
      nSmNach := nSmNach + cdsDetSm_Nach.AsFloat;
      nSmUdrg := nSmUdrg + cdsDetSm_Udrg.AsFloat;
      nSmVupl := nSmVupl + cdsDetSm_Vupl.AsFloat;
      nSmOst  := nSmOst  + cdsDetSm_Ost.AsFloat;
      nSmVDlg := nSmVDlg + cdsDetSm_VDlg.AsFloat;
      nSmVzvr := nSmVzvr + cdsDetSm_Vzvr.AsFloat;
      Next;
    end;
    Append;
    cdsDetPSch.AsString := 'Итого';
    cdsDetZaMesGod.AsString := '31-12-3999';
    cdsDetSm_Nach.AsFloat := nSmNach;
    cdsDetSm_Udrg.AsFloat := nSmUdrg;
    cdsDetSm_Vupl.AsFloat := nSmVupl;
    cdsDetSm_Ost.AsFloat  := nSmOst;
    cdsDetSm_VDlg.AsFloat := nSmVDlg;
    cdsDetSm_Vzvr.AsFloat := nSmVzvr;
    Post;
    IndexName := 'OnPSchZaMG';
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 420);
    Width  := ReadInteger(SECTION, 'wW', 680);
    dbgrShort.Height := ReadInteger(SECTION, 'grShH', 180);
    Free;
  end;
  if FileExists(cDirVids + 'DtFrSh01.vid') then
    dbgrShort.Columns.LoadFromFile(cDirVids + 'DtFrSh01.vid');
  if FileExists(cDirVids + 'DtFrDt01.vid') then
    dbgrDet.Columns.LoadFromFile(cDirVids + 'DtFrDt01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrShort.Columns.SaveToFile(cDirVids + 'DtFrSh01.vid');
  dbgrDet.Columns.SaveToFile(cDirVids + 'DtFrDt01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'grShH', dbgrShort.Height);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.dnGridEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.dnGridExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.dbgrShortDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrShort.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if (cFldNm = 'SM_VDLG') or (cFldNm = 'SM_VZVR') then
        Brush.Color := clWindow
      else if (cFldNm = 'SM_OST') and (cdsShortSm_Ost.AsFloat <= -0.01) then
        Font.Color := clRed;
      if cdsShortPSch.AsString = 'Итого' then
        Brush.Color := clBtnFace;
    end;
  end;
  dbgrShort.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.dbgrDetDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
begin
  with dbgrDet.Canvas do begin
    cFldNm := UpperCase(Column.FieldName);
    if not (gdFocused in State) then begin
      if (cFldNm = 'SM_VDLG') or (cFldNm = 'SM_VZVR') then
        Brush.Color := clWindow
      else if (cFldNm = 'SM_OST') and (cdsDetSm_Ost.AsFloat <= -0.01) then
        Font.Color := clRed;
      if cdsDetPSch.AsString = 'Итого' then
        Brush.Color := clBtnFace;
    end;
  end;
  dbgrDet.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.AddInShortSmNach(cPSch: ShortString; nSmNach: double);
begin
  with cdsShort do begin
    if not Locate('PSch', cPSch, []) then begin
      Append;
      cdsShortTabN.AsString   := qryTmp.FieldByName('TabN').AsString;
      cdsShortDtProc.AsString := qryTmp.FieldByName('DtProc').AsString;
      cdsShortPSch.AsString   := cPSch; end
    else
      Edit;
    cdsShortSm_Nach.AsFloat := cdsShortSm_Nach.AsFloat + nSmNach;
    cdsShortSm_Udrg.AsFloat := 0;
    cdsShortSm_Udrg.AsFloat := 0;
    cdsShortSm_Vupl.AsFloat := 0;
    cdsShortSm_Ost.AsFloat  := 0;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.AddInShortSmUdrg(cPSch: ShortString; nSmUdrg: double);
begin
  with cdsShort do begin
    if not Locate('PSch', cPSch, []) then begin
      Append;
      cdsShortTabN.AsString   := qryTmp.FieldByName('TabN').AsString;
      cdsShortDtProc.AsString := qryTmp.FieldByName('DtProc').AsString;
      cdsShortPSch.AsString   := cPSch; end
    else
      Edit;
    cdsShortSm_Udrg.AsFloat := cdsShortSm_Udrg.AsFloat + nSmUdrg;
    cdsShortSm_Vupl.AsFloat := 0;
    cdsShortSm_Ost.AsFloat  := 0;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.AddInShortSmVupl(cPSch: ShortString; nSmVupl: double);
begin
  with cdsShort do begin
    if not Locate('PSch', cPSch, []) then begin
      Append;
      cdsShortTabN.AsString   := qryTmp.FieldByName('TabN').AsString;
      cdsShortDtProc.AsString := qryTmp.FieldByName('DtProc').AsString;
      cdsShortPSch.AsString   := cPSch; end
    else
      Edit;
    cdsShortSm_Vupl.AsFloat := cdsShortSm_Vupl.AsFloat + nSmVupl;
    cdsShortSm_Ost.AsFloat  := 0;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.AddInShortSmVDlg(cPSch: ShortString; nSmVDlg: double);
begin
  with cdsShort do begin
    if not Locate('PSch', cPSch, []) then begin
      Append;
      cdsShortTabN.AsString   := qryTmp.FieldByName('TabN').AsString;
      cdsShortDtProc.AsString := qryTmp.FieldByName('DtProc').AsString;
      cdsShortPSch.AsString   := cPSch; end
    else
      Edit;
    cdsShortSm_VDlg.AsFloat := cdsShortSm_VDlg.AsFloat + nSmVDlg;
    cdsShortSm_Vzvr.AsFloat := 0;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.AddInShortSmVzvr(cPSch: ShortString; nSmVzvr: double);
begin
  with cdsShort do begin
    if not Locate('PSch', cPSch, []) then begin
      Append;
      cdsShortTabN.AsString   := qryTmp.FieldByName('TabN').AsString;
      cdsShortDtProc.AsString := qryTmp.FieldByName('DtProc').AsString;
      cdsShortPSch.AsString   := cPSch; end
    else
      Edit;
    cdsShortSm_Vzvr.AsFloat := cdsShortSm_Vzvr.AsFloat + nSmVzvr;
    Post;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.rBtnSortClick(Sender: TObject);
begin
  if rBtnSortByPSch.Checked then
    cdsDet.IndexName := 'OnPSchZaMG'
  else
    cdsDet.IndexName := 'OnZaMGPSch';
end;
//------------------------------------------------------------------------------
procedure TFormDatForMO.cdsDetZaMesGodGetText(Sender: TField;
                                        var Text: String; DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsString = '31-12-3999')) then
    Text := ''
  else
    Text := FormatDateTime('mm/yy', (Sender as TField).AsDateTime);
end;

end.
