unit z_DtChMO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Math, DBTables, DBClient, DBCtrls;

type
  TFormChDatMO = class(TForm)
    dbgrTmp: TDBGrid;
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    cdsTmp: TClientDataSet;
    cdsTmpTabN: TIntegerField;
    cdsTmpPSch: TStringField;
    cdsTmpSm_Nach: TFloatField;
    cdsTmpSm_Udrg: TFloatField;
    cdsTmpSm_Vupl: TFloatField;
    cdsTmpSm_Ost: TFloatField;
    dsrcTmp: TDataSource;
    qrySps: TQuery;
    cdsTmpNR: TAutoIncField;
    DBNavigator1: TDBNavigator;
    LabelCntRec: TLabel;
    sBtnFilter: TSpeedButton;
    cdsSvd: TClientDataSet;
    cdsSvdNR: TAutoIncField;
    cdsSvdPSch: TStringField;
    cdsSvdSm_Nach: TFloatField;
    cdsSvdSm_Udrg: TFloatField;
    cdsSvdSm_Vupl: TFloatField;
    cdsSvdSm_Ost: TFloatField;
    sBtnPrt: TSpeedButton;
    cdsTmpSm_VDlg: TFloatField;
    cdsTmpSm_Vzvr: TFloatField;
    cdsSvdSm_VDlg: TFloatField;
    cdsSvdSm_Vzvr: TFloatField;
    sBtnFilter2: TSpeedButton;
    qryNach: TQuery;
    qryUdrg: TQuery;
    qryVupl: TQuery;
    qryVDlg: TQuery;
    qryVzvr: TQuery;
    LabelFamio: TLabel;
    qryFamIO: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dnGridEnter(Sender: TObject);
    procedure dnGridExit(Sender: TObject);
    procedure dbgrTmpDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnFilterClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure cdsTmpTabNGetText(Sender: TField; var Text: String;
                                                          DisplayText: Boolean);
    procedure sBtnFilter2Click(Sender: TObject);
    procedure SetFilter2;
    procedure cdsTmpAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    d_DtPrc : TDateTime;
    bFormIsReady : boolean;
    procedure CreOpenCdsTmp(dDtPrc : TDateTime);
    function ShwFamIO(nTabN : integer) : ShortString;
  public
    { Public declarations }
  end;

procedure ChDatForMO(dDtPrc : TDateTime);

const SECTION = 'z_DtChMo';

var
  FormChDatMO: TFormChDatMO;

implementation

uses A_Const, A_Lib, A_DM, Z_DM, z_DtChSF, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ChDatForMO(dDtPrc : TDateTime);
var nY, nM, nD : word;
begin
  FormChDatMO := TFormChDatMO.Create(Application);
  with FormChDatMO do begin
    d_DtPrc := dDtPrc;
    bFormIsReady := false;
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Проверка м/о за ' +
              MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    CreOpenCdsTmp(dDtPrc);
    ShwFamIO(-1);
    SetFilter2;
    bFormIsReady := true;
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.CreOpenCdsTmp(dDtPrc: TDateTime);
var nSmNach, nSmUdrg, nSmVupl, nSmOst, nSmVDlg, nSmVzvr : double;
    nSmNachTt, nSmUdrgTt, nSmVuplTt, nSmOstTt, nSmVDlgTt, nSmVzvrTt : double;
    cPSch : ShortString;
    nTabN, nCdsTabN : integer;
begin
  with cdsSvd do begin
    If Active then Close;
    CreateDataSet;
    Open;
  end;
  with cdsTmp do begin
    If Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryFamIO do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select Fam, Ima, Otch from Z_UPI where TabN = :nTabN');
    Prepare;
  end;
  with qryNach do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSCH, Round(Sum(Summa),2) SMM ' +
            ' from ViNuMain where TabN = :nTabN and ' +
            ' DtProc = :dDtPrc and VidN <= "2705" group by PSCH');
                // вид 2705 Прх1ВКассу должны увидеть (как в м/о)
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Prepare;
  end;
  with qryUdrg do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSCH, Round(Sum(Summa),2) SMM from ViNuMain ' +
              ' where TabN = :nTabN and DtProc = :dDtPrc  and ' +
              ' VidN > "5000" and VidN < "7500" and not ' +
              ' (VidN >= "6623" and VidN <= "6626") ' +
              ' group by PSCH');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Prepare;
  end;
  with qryVupl do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSch, Round(Sum(Summa),2) SMM from ViNuMain ' +
              ' where TabN = :nTabN and DtProc = :dDtPrc and ' +
              ' VidN > "7500" and VidN < "8600"  group by PSCH');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Prepare;
  end;
  with qryVDlg do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSch, Round(Sum(Summa),2) SMM from ViNuMain ' +
              ' where TabN = :nTabN and DtProc = :dDtPrc and ' +
              ' VidN = "2724" group by PSCH');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Prepare;
  end;
  with qryVzvr do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select PSch, Round(Sum(Summa),2) SMM from ViNuMain ' +
              ' where TabN = :nTabN and DtProc = :dDtPrc and ' +
              ' VidN = "6624" group by PSCH');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Prepare;
  end;
  with qrySps do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct TabN from Z_NU where DtProc = :dDtPrc');
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    while not Eof do begin
      nTabN := FieldByName('TabN').AsInteger;
      qryNach.Close;                     // Выбор приходов
      qryNach.ParamByName('nTabN').AsInteger := nTabN;
      qryNach.Open;
      while not qryNach.Eof do begin
        cdsTmp.Append;
        cdsTmpTabN.AsInteger    := nTabN;
        cdsTmpPSch.AsString     := qryNach.FieldByName('PSch').AsString;
        cdsTmpSm_Nach.AsString  := qryNach.FieldByName('SMM').AsString;
        cdsTmpSm_Udrg.AsFloat   := 0;
        cdsTmpSm_Vupl.AsFloat   := 0;
        cdsTmpSm_Ost.AsFloat    := 0;
        cdsTmpSm_VDlg.AsFloat   := 0;
        cdsTmpSm_Vzvr.AsFloat   := 0;
        cdsTmp.Post;
        qryNach.Next;
      end;
      qryUdrg.Close;               // Выбор удержаний
      qryUdrg.ParamByName('nTabN').AsInteger := nTabN;
      qryUdrg.Open;
      while not qryUdrg.Eof do begin
        cPSch := qryUdrg.FieldByName('PSch').AsString;
        if not cdsTmp.Locate('TabN;PSch',
                                   VarArrayOf([nTabN,cPSch]), []) then begin
          cdsTmp.Append;
          cdsTmpTabN.AsInteger := nTabN;
          cdsTmpPSch.AsString  := cPSch; end
        else
          cdsTmp.Edit;
        cdsTmpSm_Udrg.AsFloat := cdsTmpSm_Udrg.AsFloat +
                                             qryUdrg.FieldByName('SMM').AsFloat;
        cdsTmpSm_Vupl.AsFloat := 0;
        cdsTmpSm_Ost.AsFloat  := 0;
        cdsTmpSm_VDlg.AsFloat := 0;
        cdsTmpSm_Vzvr.AsFloat := 0;
        cdsTmp.Post;
        qryUdrg.Next;
      end;
      qryVupl.Close;                  // Выбор выплат
      qryVupl.ParamByName('nTabN').AsInteger := nTabN;
      qryVupl.Open;
      while not qryVupl.Eof do begin
        cPSch := qryVupl.FieldByName('PSch').AsString;
        if not cdsTmp.Locate('TabN;PSch',
                                   VarArrayOf([nTabN, cPSch]),[]) then begin
          cdsTmp.Append;
          cdsTmpTabN.AsInteger := nTabN;
          cdsTmpPSch.AsString  := cPSch; end
        else
          cdsTmp.Edit;
        cdsTmpSm_Vupl.AsFloat := cdsTmpSm_Vupl.AsFloat +
                                             qryVupl.FieldByName('SMM').AsFloat;
        cdsTmp.Post;
        qryVupl.Next;
      end;
      qryVDlg.Close;          // Выбор сумм долгов ТМ
      qryVDlg.ParamByName('nTabN').AsInteger := nTabN;
      qryVDlg.Open;
      while not qryVDlg.Eof do begin
        cPSch := qryVDlg.FieldByName('PSch').AsString;
        if not cdsTmp.Locate('TabN;PSch',
                                   VarArrayOf([nTabN, cPSch]),[]) then begin
          cdsTmp.Append;
          cdsTmpTabN.AsInteger := nTabN;
          cdsTmpPSch.AsString  := cPSch; end
        else
          cdsTmp.Edit;
        cdsTmpSm_VDlg.AsFloat := cdsTmpSm_VDlg.AsFloat +
                                             qryVDlg.FieldByName('SMM').AsFloat;
        cdsTmp.Post;
        qryVDlg.Next;
      end;
      qryVzvr.Close;     // Выбор возвратов долгов ПМ
      qryVzvr.ParamByName('nTabN').AsInteger := nTabN;
      qryVzvr.Open;
      while not qryVzvr.Eof do begin
        cPSch := qryVzvr.FieldByName('PSch').AsString;
        if not cdsTmp.Locate('TabN;PSch',
                                   VarArrayOf([nTabN, cPSch]),[]) then begin
          cdsTmp.Append;
          cdsTmpTabN.AsInteger := nTabN;
          cdsTmpPSch.AsString  := cPSch; end
        else
          cdsTmp.Edit;
        cdsTmpSm_Vzvr.AsFloat := cdsTmpSm_Vzvr.AsFloat +
                                             qryVzvr.FieldByName('SMM').AsFloat;
        cdsTmp.Post;
        qryVzvr.Next;
      end;
      Next; {qrySps}
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
    with qryFamIO do begin
      if Active then Close;
      if Prepared then
        UnPrepare;
    end;
    qryNach.Close;
    if qryNach.Prepared then
      qryNach.UnPrepare;
    qryUdrg.Close;
    if qryUdrg.Prepared then
      qryUdrg.UnPrepare;
    qryVupl.Close;
    if qryVupl.Prepared then
      qryVupl.UnPrepare;
    qryVDlg.Close;
    if qryVDlg.Prepared then
      qryVDlg.UnPrepare;
    qryVzvr.Close;
    if qryVzvr.Prepared then
      qryVzvr.UnPrepare;
  end;
  with cdsTmp do begin
    First;
    while not Eof do begin
      nCdsTabN := cdsTmpTabN.AsInteger;
      nSmNach := 0;
      nSmUdrg := 0;
      nSmVupl := 0;
      nSmOst  := 0;
      nSmVDlg := 0;
      nSmVzvr := 0;
      while (cdsTmpTabN.AsInteger = nCdsTabN) and not Eof do begin
        Edit;
        cdsTmpSm_Ost.AsFloat := MyRound(cdsTmpSm_Nach.AsFloat +
                                            cdsTmpSm_Udrg.AsFloat +
                                              cdsTmpSm_Vupl.AsFloat, 2);
        Post;
        nSmNach := nSmNach + cdsTmpSm_Nach.AsFloat;
        nSmUdrg := nSmUdrg + cdsTmpSm_Udrg.AsFloat;
        nSmVupl := nSmVupl + cdsTmpSm_Vupl.AsFloat;
        nSmOst  := nSmOst  + cdsTmpSm_Ost.AsFloat;
        nSmVDlg := nSmVDlg + cdsTmpSm_VDlg.AsFloat;
        nSmVzvr := nSmVzvr + cdsTmpSm_Vzvr.AsFloat;
        Next;
      end;
    end;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
    IndexName := 'OnPSch';
    First;
    nSmNachTt := 0;
    nSmUdrgTt := 0;
    nSmVuplTt := 0;
    nSmOstTt  := 0;
    nSmVDlgTt := 0;
    nSmVzvrTt := 0;
    while not Eof do begin
      cPSch   := cdsTmpPSch.AsString;
      nSmNach := 0;
      nSmUdrg := 0;
      nSmVupl := 0;
      nSmOst  := 0;
      nSmVDlg := 0;
      nSmVzvr := 0;
      while (cdsTmpPSch.AsString = cPSch) and not Eof do begin
        nSmNachTt := nSmNachTt + cdsTmpSm_Nach.AsFloat;
        nSmUdrgTt := nSmUdrgTt + cdsTmpSm_Udrg.AsFloat;
        nSmVuplTt := nSmVuplTt + cdsTmpSm_Vupl.AsFloat;
        nSmOstTt  := nSmOstTt  + cdsTmpSm_Ost.AsFloat;
        nSmVDlgTt := nSmVDlgTt + cdsTmpSm_VDlg.AsFloat;
        nSmVzvrTt := nSmVzvrTt + cdsTmpSm_Vzvr.AsFloat;
        nSmNach := nSmNach + cdsTmpSm_Nach.AsFloat;
        nSmUdrg := nSmUdrg + cdsTmpSm_Udrg.AsFloat;
        nSmVupl := nSmVupl + cdsTmpSm_Vupl.AsFloat;
        nSmOst  := nSmOst  + cdsTmpSm_Ost.AsFloat;
        nSmVDlg := nSmVDlg + cdsTmpSm_VDlg.AsFloat;
        nSmVzvr := nSmVzvr + cdsTmpSm_Vzvr.AsFloat;
        Next;
      end;
      cdsSvd.Append;
      cdsSvdPSch.AsString := cPSch;
      cdsSvdSm_Nach.AsFloat := RoundTo(nSmNach, -2);
      cdsSvdSm_Udrg.AsFloat := RoundTo(nSmUdrg, -2);
      cdsSvdSm_Vupl.AsFloat := RoundTo(nSmVupl, -2);
      cdsSvdSm_Ost.AsFloat  := RoundTo(nSmOst, -2);
      cdsSvdSm_VDlg.AsFloat := RoundTo(nSmVDlg, -2);
      cdsSvdSm_Vzvr.AsFloat := RoundTo(nSmVzvr, -2);
      cdsSvd.Post;
    end;
    IndexName := 'OnTabNPSchNR';
    First;
  end;
  with cdsSvd do begin
    if bFlagDbg then
      SaveToFile(cDirTemp + 'dtChSvd.cds');
    First;
    while not Eof do begin
      cdsTmp.Append;
      cdsTmpTabN.AsInteger := 9999001;
      cdsTmpPSch.AsString  := cdsSvdPSch.AsString;
      cdsTmpSm_Nach.AsFloat := cdsSvdSm_Nach.AsFloat;
      cdsTmpSm_Udrg.AsFloat := cdsSvdSm_Udrg.AsFloat;
      cdsTmpSm_Vupl.AsFloat := cdsSvdSm_Vupl.AsFloat;
      cdsTmpSm_Ost.AsFloat  := cdsSvdSm_Ost.AsFloat;
      cdsTmpSm_VDlg.AsFloat := cdsSvdSm_VDlg.AsFloat;
      cdsTmpSm_Vzvr.AsFloat := cdsSvdSm_Vzvr.AsFloat;
      cdsTmp.Post;
      Next;
    end;
  end;
  cdsTmp.Append;
  cdsTmpTabN.AsInteger := 9999011;
  cdsTmpPSch.AsString  := 'Итог:';
  cdsTmpSm_Nach.AsFloat := nSmNachTt;
  cdsTmpSm_Udrg.AsFloat := nSmUdrgTt;
  cdsTmpSm_Vupl.AsFloat := nSmVuplTt;
  cdsTmpSm_Ost.AsFloat  := nSmOstTt;
  cdsTmpSm_VDlg.AsFloat := nSmVDlgTt;
  cdsTmpSm_Vzvr.AsFloat := nSmVzvrTt;
  cdsTmp.Post;
  cdsTmp.First;
  if bFlagDbg then
    cdsTmp.SaveToFile(cDirTemp + 'dtChMo.cds');
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 250);
    Width  := ReadInteger(SECTION, 'wW', 600);
    sBtnFilter2.Down := ReadBool(SECTION, 'bFilter', false);
    Free;
  end;
  if FileExists(cDirVids + 'DtChMo01.vid') then
    dbgrTmp.Columns.LoadFromFile(cDirVids + 'DtChMo01.vid');
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrTmp.Columns.SaveToFile(cDirVids + 'DtChMo01.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bFilter', sBtnFilter2.Down);
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
      if cdsTmpTabN.AsInteger = 9999001 then
        Brush.Color := clBtnFace
      else if cdsTmpTabN.AsInteger = 9999011 then
        Brush.Color := clMoneyGreen;
    end;
  end;
  dbgrTmp.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.sBtnFilterClick(Sender: TObject);
var cFText : ShortString;
begin
  if GetDtChFilter(cFText) then with cdsTmp do begin
    if cFText <> '' then begin
      Filter := cFText;
      Filtered := true;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
      sBtnPrt.Enabled := true; end
    else begin
      Filter := '';
      Filtered := false;
      LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
      sBtnPrt.Enabled := false;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.sBtnPrtClick(Sender: TObject);
begin
  F6PrtDtChMO(d_DtPrc, cdsTmp);   {z_CmnPrt}
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.cdsTmpTabNGetText(Sender: TField; var Text: String;
                                                          DisplayText: Boolean);
begin
  if DisplayText and ((Sender as TField).IsNull or
                            ((Sender as TField).AsInteger > 9000000)) then
    Text := ''
  else
    Text := IntToStr((Sender as TField).AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.sBtnFilter2Click(Sender: TObject);
begin
  SetFilter2;
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.SetFilter2;
var cFText : ShortString; nSvNR : integer;
begin
  cFText := '(Sm_Ost<>0) or (Sm_VDlg<>0) or (Sm_Vzvr<>0) or (TabN>9000000)';
  with cdsTmp do begin
    nSvNR := cdsTmpNR.AsInteger;
    if sBtnFilter2.Down then begin
      Filter := cFText;
      Filtered := true;
      if not Locate('NR', nSvNR, []) then
        Last;  end
    else begin
      Filter := '';
      Filtered := false;
      Locate('NR', nSvNR, []);
    end;
    LabelCntRec.Caption := 'Записей: ' + IntToStr(RecordCount);
  end;
  sBtnPrt.Enabled := sBtnFilter2.Down;
end;
//------------------------------------------------------------------------------
procedure TFormChDatMO.cdsTmpAfterScroll(DataSet: TDataSet);
var nTabN : integer;
begin
  LabelFamIO.Caption := '';
  if bFormIsReady and sBtnFilter2.Down then begin
    if cdsTmpTabN.IsNull then
      nTabN := -333
    else
      nTabN := cdsTmpTabN.AsInteger;
    ShwFamIO(nTabN);
  end;
end;
//------------------------------------------------------------------------------
function TFormChDatMO.ShwFamIO(nTabN: integer): ShortString;
begin
  Result := '';
  with qryFamIO do begin
    if Active then Close;
    ParamByName('nTabN').AsInteger := nTabN;
    Open;
    Result := MyFamIO(FieldByName('Fam').AsString, FieldByName('Ima').AsString,
                                                  FieldByName('Otch').AsString);
  end;
  LabelFamIO.Caption := Result;
end;

end.
