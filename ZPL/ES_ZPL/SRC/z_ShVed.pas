unit z_ShVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Provider, DB, DBClient, DBTables, ExtCtrls, Grids, DBGrids,
  Buttons, StdCtrls, Menus;

type
  TFormShowVeds = class(TForm)
    Panel1: TPanel;
    bBtnClose: TBitBtn;
    SpeedButton1: TSpeedButton;
    sBtnPrt: TSpeedButton;
    dbgrLst: TDBGrid;
    Splitter1: TSplitter;
    dbgrVed: TDBGrid;
    qryTmp: TQuery;
    cdsLst: TClientDataSet;
    cdsVed: TClientDataSet;
    dsrcVed: TDataSource;
    dsrcLst: TDataSource;
    cdsLstNR: TAutoIncField;
    cdsLstDtProc: TDateField;
    cdsLstVedNr: TIntegerField;
    cdsLstTypeVed: TStringField;
    cdsLstVedDate: TDateField;
    cdsLstNotes: TStringField;
    cdsVedKdSps: TSmallintField;
    cdsVedTabN: TIntegerField;
    cdsVedVidN: TStringField;
    cdsVedSumma: TFloatField;
    cdsVedKdSpZ: TSmallintField;
    cdsVedKdObj: TIntegerField;
    cdsVedkdKatP: TIntegerField;
    cdsVedFamIO: TStringField;
    qryVed: TQuery;
    LbxF8: TListBox;
    cdsLstSmKss: TFloatField;
    cdsLstSmBnk: TFloatField;
    cdsLstSmOther: TFloatField;
    cdsVedShSpZ: TStringField;
    cdsVedNrInVidN: TIntegerField;
    procedure cdsLstAfterScroll(DataSet: TDataSet);
    procedure dbgrLstDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsVedCalcFields(DataSet: TDataSet);
    procedure dbgrVedDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrLstDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrLstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sBtnPrtClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    n_KdSps : integer;
    bCdsLstReady : boolean;
    dDtProcSelVed : TDateTime;
    procedure CreOpenCdsLst(nKdSps : integer);
    procedure PrepareQryVed;
    procedure CreOpenCdsVed(dDtProc : TDateTime;
                                      nKdSps, nVedNr : integer);
  public
    { Public declarations }
  end;

procedure ShowVeds(nKdSps : integer; dDtProc : TDateTime);

const SECTION = 'z_ShVed';

var
  FormShowVeds: TFormShowVeds;

implementation

uses a_Const, a_Dm, z_Dm, z_Main, z_MkVed2, a_Lib, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure ShowVeds(nKdSps : integer; dDtProc : TDateTime);
begin
  FormShowVeds := TFormShowVeds.Create(Application);
  with FormShowVeds do begin
    Caption := 'Ведомости выплат по зарплате';
    n_KdSps := nKdSps;
    dDtProcSelVed := 0;
    bCdsLstReady := false;
    CreOpenCdsLst(nKdSps);  // пока не выбираю по месяцам (без DtProc)
    PrepareQryVed;
    CreOpenCdsVed(cdsLst.FieldByName('DtProc').AsDateTime, n_KdSps,
                              cdsLst.FieldByName('VedNr').AsInteger);
    ShowModal;
    if qryVed.Prepared then
      qryVed.UnPrepare;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.CreOpenCdsLst(nKdSps : integer);
var nVedNr : integer; nSmKss, nSmBnk, nSmOther : double;
    dDtProc, dVedDate : TDateTime; cVidN, cTypeVed : string;
begin
  bCdsLstReady := false;
  with cdsLst do begin
    if Active then Close;
    CreateDataSet;
    Open;
  end;
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;

(*
        Можно добавить    Count(nu.NR) as CntRec  (см.ниже)

Select v.dtProc, v.VedNR, v.TypeVed, v.VedDate, nu.VidN,
 -Sum(nu.Summa) as SmVed, Сount(nu.NR) as CntRec from z_VedNR v, z_nu nu
                          ----------------------
 where (v.KdSps = 1) and
 (v.typeved containing ("vd_")) and
 (nu.DtProc = v.DtProc) and (nu.Spec_NR = v.VedNR)
 group by v.dtProc, v.VedNR, v.TypeVed, v.VedDate, nu.VidN
*)



    SQL.Add('Select v.dtProc, v.VedNR, v.TypeVed, v.VedDate, nu.VidN, ' +
            ' -Sum(nu.Summa) as SmVed from z_VedNR v, z_nu nu ' +
            ' where (v.KdSps = :nKdSps) and ' +
            ' (v.typeved containing ("vd_")) and ' +
            ' (nu.DtProc = v.DtProc) and (nu.Spec_NR = v.VedNR) ' +
            ' group by v.dtProc, v.VedNR, v.TypeVed, v.VedDate, nu.VidN');
    ParamByName('nKdSps').AsInteger := nKdSps;
    Open;
    while not Eof do begin
      nVedNr   := FieldByName('VedNr').AsInteger;
      dDtProc  := FieldByName('DtProc').AsDateTime;
      dVedDate := FieldByName('VedDate').AsDateTime;
      cTypeVed := FieldByName('TypeVed').AsString;
      nSmKss := 0;
      nSmBnk := 0;
      nSmOther := 0;
      while (FieldByName('VedNr').AsInteger = nVedNr) and not Eof do begin
        cVidN := FieldByName('VidN').AsString;
        if cVidN = '62г' then
          nSmKss := nSmKss + FieldByName('SmVed').AsFloat
        else if cVidN = '63а' then
          nSmBnk := nSmBnk + FieldByName('SmVed').AsFloat
        else
          nSmOther := nSmOther + FieldByName('SmVed').AsFloat;
        Next;
      end;
      cdsLst.Append;
      cdsLst.FieldByName('DtProc').AsDateTime := dDtProc;
      cdsLst.FieldByName('VedNr').AsInteger := nVedNr;
      cdsLst.FieldByName('TypeVed').AsString := cTypeVed;
      cdsLst.FieldByName('VedDate').AsDateTime := dVedDate;
      if nSmKss <> 0 then
        cdsLst.FieldByName('SmKss').AsFloat := nSmKss;
      if nSmBnk <> 0 then
        cdsLst.FieldByName('SmBnk').AsFloat := nSmBnk;
      if nSmOther <> 0 then
        cdsLst.FieldByName('SmOther').AsFloat := nSmOther;
      cdsLst.Post;
    end;
    Close;
    SQL.Clear;
    DataBaseName := '';
  end;
  bCdsLstReady := true;
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.cdsLstAfterScroll(DataSet: TDataSet);
begin
  if bCdsLstReady then
    CreOpenCdsVed(cdsLst.FieldByName('DtProc').AsDateTime, n_KdSps,
                              cdsLst.FieldByName('VedNr').AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.PrepareQryVed;
begin
  with qryVed do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESZPL;
    SQL.Add('Select u.Fam, u.Ima, u.Otch, nu.KdSps, nu.TabN, nu.VidN, ' +
            ' nu.Summa, nu.KdSpZ, nu.KdObj, nu.KdKatP ' +
            ' from z_NU nu Left Outer Join z_Upi u on u.TabN = nu.TabN ' +
            ' where (nu.dtProc = :dDtProc) and (nu.Spec_Nr = :nSpecNr) ' +
            ' order by nu.KdObj, nu.VidN, u.Fam, u.Ima, u.Otch, nu.KdSPZ');
    Prepare;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.CreOpenCdsVed(dDtProc : TDateTime;
                                                     nKdSps, nVedNr : integer);
var cFamIO, cVidN : string; nNrInVidN : integer;
begin
  with cdsVed do begin
    if Active then Close;
    IndexDefs.Clear;
    CreateDataSet;
    Open;
    DisableControls;
  end;
  with qryVed do begin
    Close;
    ParamByName('dDtProc').AsDateTime := cdsLst.FieldByName('DtProc').AsDateTime;
    ParamByName('nSpecNr').AsInteger := cdsLst.FieldByName('VedNr').AsInteger;
    Open;
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      nNrInVidN := 0;
      while (FieldByName('VidN').AsString = cVidN) and not Eof do begin
        Inc(nNrInVidN);
        cFamIO := MyFamIO(FieldByName('Fam').AsString,
                            FieldByName('Ima').AsString,
                              FieldByName('Otch').AsString);
        cdsVed.AppendRecord([FieldByName('KdSps').AsInteger,
                              FieldByName('TabN').AsInteger, cFamIO,
                               FieldByName('VidN').AsString,
                                -FieldByName('Summa').AsFloat,
                                  FieldByName('KdSpZ').AsInteger,
                                   FieldByName('KdObj').AsInteger,
                                    FieldByName('KdKatP').AsInteger,
                                     nNrInVidN]);
        Next;
      end;
    end;
    Close;
  end;
  with cdsVed do begin
    First;
    if bFlagDbg then
      SaveToFile(cDirTemp + 'xShVdVed.cds');
    EnableControls;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.dbgrLstDblClick(Sender: TObject);
var i : integer;
begin
  i := LbxF8.Items.IndexOf(cdsLstVedNr.AsString);
  if i < 0 then begin
    if LbxF8.Items.Count = 0 then begin
      dDtProcSelVed := cdsLstDtProc.AsDateTime; {первая выделенная ведомость}
      LbxF8.Items.Add(cdsLstVedNr.AsString);
      dbgrLst.Refresh; end
    else begin
      if (cdsLstDtProc.AsDateTime <> dDtProcSelVed) then
        ShowMessage('Можно объединять только ведомости одного месяца')
      else begin
        LbxF8.Items.Add(cdsLstVedNr.AsString);
        dbgrLst.Refresh;
      end;
    end; end
  else begin
    LbxF8.Items.Delete(i);
    if LbxF8.Items.Count = 0 then
      dDtProcSelVed := 0;
    dbgrLst.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 100);
    Height := ReadInteger(SECTION, 'wH', 485);
    Width  := ReadInteger(SECTION, 'wW', 700);
    dbgrLst.Width := ReadInteger(SECTION, 'GrLstW', 290);
    Free;
  end;
  if FileExists(cDirVids + 'shVdLst.vid') then
    dbgrLst.Columns.LoadFromFile(cDirVids + 'shVdLst.vid');
  if FileExists(cDirVids + 'shVdVed.vid') then
    dbgrVed.Columns.LoadFromFile(cDirVids + 'shVdVed.vid');
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrLst.Columns.SaveToFile(cDirVids + 'shVdLst.vid');
  dbgrVed.Columns.SaveToFile(cDirVids + 'shVdVed.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'GrLstW', dbgrLst.Width);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.cdsVedCalcFields(DataSet: TDataSet);
begin
  cdsVedShSpZ.AsString := Form_Dm.KdSbu2SchBU(cdsVedKdSpz.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.dbgrVedDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrVed.Canvas do begin
    if not (gdFocused in State) then begin
(*
      if cdsVedNrInVidN.AsInteger = 1 then
        Brush.Color := clSilver
      else
        Brush.Color := clCream;
*)
      Brush.Color := clCream;
      if cdsVedVidN.AsString = '62г' then
        Font.Color := clWindowText
      else if cdsVedVidN.AsString = '63а' then
        Font.Color := clNavy
      else
        Font.Color := clMaroon;
    end;
  end;
  dbgrVed.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.dbgrLstDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrLst.Canvas do begin
    if not (gdFocused in State) then begin
      if LbxF8.Items.IndexOf(cdsLstVedNr.AsString) >= 0 then
        Font.Color := clRed
      else
        Font.Color := clWindowText;
    end;
  end;
  dbgrLst.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.dbgrLstKeyDown(Sender: TObject; var Key: Word;
                                                            Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    dbgrLstDblClick(Self);
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.sBtnPrtClick(Sender: TObject);
var nVedCase, nNumCase, nNumFirstVed : integer;
begin
  if GetVedType(nVedCase, nNumCase, nNumFirstVed) {z_MkVed2} then begin
    if nVedCase = 1 then begin
      // раздельно в банк (одной ведомостью, но раздельно по счБУ-источникам
      // финансирования ) и в кассу (по подразд., но тоже раздельно по счБУ)
      cdsVed.AddIndex('IdxTmp', 'VidN;KdSpZ;KdObj;FamIO', []);
      cdsVed.IndexName := 'IdxTmp';
      if bFlagDbg then
        cdsVed.SaveToFile(cDirTemp + 'yShVdVed.cds');
      ; end
    else if nVedCase = 2 then begin
      // раздельно в банк (одной ведомостью, но раздельно по счБУ-источникам
      // финансирования) и в кассу (одной ведом., но тоже раздельно по счБУ)
      ; end
    else if nVedCase = 3 then begin
      // все в кассу по подразделениям и раздельно по СчБУ
      ; end
    else begin
      // все в кассу одной ведомостью, но раздельно по СчБУ
      ;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormShowVeds.N2Click(Sender: TObject);
var mBookMark : TBookMark; dDtProc : TDate;
begin
  // Только "кассовые" в кассу с разбивкой по подразделениям
  dDtProc := cdsLstDtProc.AsDateTime;
  with cdsVed do begin
    mBookMark := GetBookMark;
    DisableControls;
    IndexName := 'OnKdSpzKdObjFamIO';
    First;
    F6PrtVedZpPotokom(dDtProc, cdsVed);    {z_CmnPrt}
    IndexName := '';
    GoToBookMark(mBookMark);
    FreeBookMark(mBookMark);
    EnableControls;
  end;
end;

end.
