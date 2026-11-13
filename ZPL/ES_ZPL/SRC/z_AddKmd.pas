unit z_AddKmd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, Buttons, ExtCtrls,
  Menus, ComCtrls, DBCtrls, DBClient;

type
  TFormAddKmd = class(TForm)
    Panel1: TPanel;
    bBtnCancel: TBitBtn;
    qryKmd: TQuery;
    dsrcKmd: TDataSource;
    dbgrKmd: TDBGrid;
    qryKmdNR: TIntegerField;
    qryKmdDTPROC: TDateTimeField;
    qryKmdDTBEG: TDateTimeField;
    qryKmdDTEND: TDateTimeField;
    qryKmdPRZSP: TStringField;
    qryKmdTABN: TFloatField;
    qryKmdU_POZ: TSmallintField;
    qryKmdKPR: TSmallintField;
    qryKmdKDRSH: TSmallintField;
    qryKmdSUMMA: TFloatField;
    qryKmdDTDOK: TDateTimeField;
    qryKmdNDOK: TStringField;
    qryKmdNOTES: TStringField;
    qryKmdSPEC_NR: TIntegerField;
    qryKmdFAM: TStringField;
    qryKmdIMA: TStringField;
    qryKmdOTCH: TStringField;
    qryKmdFamIO: TStringField;
    qryKmdVIDN: TStringField;
    qryKmdDT_BEG: TDateTimeField;
    qryKmdDT_END: TDateTimeField;
    qryTmp: TQuery;
    qryPere: TQuery;
    sBtnPodkl: TSpeedButton;
    pop: TPopupMenu;
    popSort: TMenuItem;
    popSortByTabN: TMenuItem;
    popSortByFIO: TMenuItem;
    popFilter: TMenuItem;
    popFilterBez: TMenuItem;
    popFilterOnlyCurMes: TMenuItem;
    popFilterOnlyNePodkl: TMenuItem;
    StatusBar: TStatusBar;
    qryKmdBLOCK: TStringField;
    DBNavigator1: TDBNavigator;
    qryKmdO_DTPROC: TDateTimeField;
    popOtklRecord: TMenuItem;
    popSep1: TMenuItem;
    popPodklRecord: TMenuItem;
    qryKmdSPEC_NRZP: TIntegerField;
    sBtnPrt: TSpeedButton;
    qryKmdO_ZAMESGOD: TDateTimeField;
    sBtnInf: TSpeedButton;
    sBtnCheckKmd: TSpeedButton;
    PanelInf: TPanel;
    Memo1: TMemo;
    sBtnInfClose: TSpeedButton;
    qryKmdKDSCHDBT: TSmallintField;
    qryKmdKDSCHKRT: TSmallintField;
    qryKmdSCHDBT: TStringField;
    qryKmdSCHKRT: TStringField;
    qryKmdKDTEMU: TSmallintField;
    procedure qryKmdCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrKmdDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sBtnPodklClick(Sender: TObject);
    procedure popSortByTabNClick(Sender: TObject);
    procedure popSortByFIOClick(Sender: TObject);
    procedure popFilterOnlyNePodklClick(Sender: TObject);
    procedure popOtklRecordClick(Sender: TObject);
    procedure popPopup(Sender: TObject);
    procedure dbgrKmdEnter(Sender: TObject);
    procedure dbgrKmdExit(Sender: TObject);
    procedure popPodklRecordClick(Sender: TObject);
    procedure popFilterBezClick(Sender: TObject);
    procedure popFilterOnlyCurMesClick(Sender: TObject);
    procedure dbgrKmdDblClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure sBtnCheckKmdClick(Sender: TObject);
    procedure sBtnInfClick(Sender: TObject);
    procedure sBtnInfCloseClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    n_SvNR  : integer;
    d_DtPrc : TDateTime;
    n_CaseFilter : SmallInt;
    nPredTabN : integer;
    dPredDtB, dPredDtE : TDateTime;
    procedure OpenQryKmd(dDtPrc : TDateTime);
    procedure SetKmdFilter;
    procedure PodklCurKmdRec(bBlock : boolean);
    procedure GetPereInf(nTabN : integer; dDtBeg : TDateTime;
                                 var nKdObj, nKdKatP, nKdSpZ : SmallInt);
    procedure AddRecIntoOtkl(nKmdNR, nTabN, nSpec_NR : integer;
                                    nKdObj, nKdKatP, nKdSpZ, nKdTemu: SmallInt;
                                    dDtPrc, dDtZaMG, dDtBeg, dDtEnd: TDateTime;
                                    nChas, nSumma : double;
                                    cVidN, cNotes : ShortString);
  public
    { Public declarations }
  end;

procedure AddKmd(dDtPrc : TDateTime);

const SECTION = 'z_AddKmd';

var
  FormAddKmd: TFormAddKmd;
  bIsFormCheckKmd : boolean;

implementation

uses A_Const, A_Lib, Z_DM, Z_Main, z_GtSrK, z_ChKmd, z_Rs5, z_CmnPrt;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure AddKmd(dDtPrc : TDateTime);
var nY, nM, nD : Word;
begin
  FormAddKmd := TFormAddKmd.Create(Application);
  with FormAddKmd do begin
    d_DtPrc := dDtPrc;
    DecodeDate(dDtPrc, nY, nM, nD);
    Caption := 'Подключение данных о командировках из ' +
               'программы "Подотчетные лица" в расчёт ' + MesRod(nM) + ' ' +
               IntToStr(nY) + ' г.';
    nPredTabN := 0;
    dPredDtB  := 0;
    dPredDtE  := 0;
    bIsFormCheckKmd := false;
    OpenQryKmd(dDtPrc);
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.OpenQryKmd(dDtPrc: TDateTime);
var nSvNR : integer;
begin
  nSvNR := 0;
  with qryKmd do begin
    if Active then begin
      nSvNR := qryKmdNR.AsInteger;
      Close;
    end;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select distinct u.Fam, u.Ima, u.Otch, k.NR, k.DtProc, ' +
            ' k.DtBeg, k.DtEnd, k.PrZSP, k.TabN, ' +
            ' k.KdSchDbt, s1.Sch_17 SchDbt, ' +
            ' k.KdSchKrt, s2.Sch_17 SchKrt,  k.U_Poz, k.KdTemu, k.KPr, ' +
            ' k.KdRsh, k.DtDok, k.NDok, k.Notes, k.Spec_NrZp, o.VidN, ' +
            ' o.DtProc as o_DtProc, o.ZaMesGod as O_ZaMesGod, ' +
            ' o.Dt_Beg, o.Dt_End, o.Summa, o.Spec_NR, sps.NCH as Block ' +
            ' from K_Opl k ' +
            ' Left Outer Join z_Upi u on u.TabN = k.TabN ' +
            ' Left Outer Join z_Otkl o on o.TabN = k.TabN and ' +
            ' o.VidN = "1206" and o.Dt_Beg = k.DtBeg ' +
            ' Left Outer Join Z_GetNCH (k.TabN, :dDtPrc) sps on 1=1 ' +
            ' Left Outer Join Kd_Sbu s1 on s1.KdSch = k.KdSchDbt ' +
            ' Left Outer Join Kd_Sbu s2 on s2.KdSch = k.KdSchKrt ' +
            ' where k.KdRsh = 1 and k.DtProc >= :d_DtB and ' +
            ' k.DtProc <= :dDtPrc and k.PrZSP = "Z" ');
{
Select distinct u.Fam, u.Ima, u.Otch, k.NR, k.DtProc,
 k.DtBeg, k.DtEnd, k.PrZSP, k.TabN, k.KdSchDbt, s1.SchBU SchDbt,
 k.KdSchKrt, s2.SchBU SchKrt, k.U_Poz, k.KdTemu, k.KPr,
 k.KdRsh, k.DtDok, k.NDok, k.Notes, k.Spec_NrZp, o.VidN,
 o.DtProc as o_DtProc, o.ZaMesGod as O_ZaMesGod,
 o.Dt_Beg, o.Dt_End, o.Summa, o.Spec_NR, sps.NCH as Block
 from K_Opl k
 Left Outer Join z_Upi u on u.TabN = k.TabN
 Left Outer Join z_Otkl o on o.TabN = k.TabN and
        o.VidN = "1206" and
        o.Dt_Beg = k.DtBeg
 Left Outer Join Z_GetNCH (k.TabN, '10/01/2013') sps on 1=1
 Left Outer Join Kd_Sbu s1 on s1.KdSch = k.KdSchDbt
 Left Outer Join Kd_Sbu s2 on s2.KdSch = k.KdSchKrt
 where k.KdRsh = 1 and k.DtProc >= '10/01/2013' -90 and
 k.DtProc <= '10/01/2013' and k.PrZSP = "Z"
 order by u.Fam, u.Ima, u.Otch, k.TabN, k.DtBeg, k.NR
 Добавить подчёркнутое и КдСчДбт брать из командировок (а не из Z_PERE)
}
    if popSortByTabN.Checked then begin
      StatusBar.Panels[2].Text := 'Сортировка по таб. номеру';
      SQL.Add(' order by k.TabN, k.DtBeg, k.NR'); end
    else begin
      StatusBar.Panels[2].Text := 'Сортировка по Фамилии И.О.';
      SQL.Add(' order by u.Fam,u.Ima, u.Otch, k.TabN, k.DtBeg, k.NR');
    end;
    ParamByName('d_DtB').AsDateTime := dDtPrc-96; // три месяца назад от dDtPrc
    ParamByName('dDtPrc').AsDateTime := dDtPrc;
    Open;
    SetKmdFilter;
    if nSvNR > 0 then
      Locate('NR', nSvNR, [])
    else
      Locate('NR', n_SvNR, []);
    StatusBar.Panels[0].Text := 'Записей: ' + IntToStr(RecordCount);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.qryKmdCalcFields(DataSet: TDataSet);
begin
  qryKmdFamIO.AsString := MyFamIO(qryKmdFam.AsString, qryKmdIma.AsString,
                                                        qryKmdOtch.AsString);
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.FormCreate(Sender: TObject);
begin
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 400);
    Height := ReadInteger(SECTION, 'wH', 300);
    Width  := ReadInteger(SECTION, 'wW', 828);
    n_SvNR := ReadInteger(SECTION, 'n_SvNR', 0);
    popSortByTabN.Checked := ReadBool(SECTION, 'SortByTabN', true);
    popSortByFIO.Checked := not popSortByTabN.Checked;
    n_CaseFilter := ReadInteger(SECTION, 'nCaseFilter', 0);
    //popFilter.Checked := ReadBool(SECTION, 'bFilter', false);
    Free;
  end;
  if n_CaseFilter = 0 then begin
    popFilterBez.Checked := true;
    popFilterOnlyCurMes.Checked := false;
    popFilterOnlyNePodkl.Checked := false; end
  else if n_CaseFilter = 1 then begin
    popFilterOnlyNePodkl.Checked := true;
    popFilterOnlyCurMes.Checked := false;
    popFilterBez.Checked := false; end
  else {if n_CaseFilter = 2 then} begin
    popFilterOnlyCurMes.Checked := true;
    popFilterBez.Checked := false;
    popFilterOnlyNePodkl.Checked := false;
  end;
  if FileExists(cDirVids + 'KmdAdd08.vid') then
    dbgrKmd.Columns.LoadFromFile(cDirVids + 'KmdAdd08.vid');
  // sBtnPrt.Visible := bFlagDbg;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrKmd.Columns.SaveToFile(cDirVids + 'KmdAdd08.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteInteger(SECTION, 'n_SvNR', qryKmdNR.AsInteger);
    WriteBool(SECTION, 'SortByTabN', popSortByTabN.Checked);
    WriteInteger(SECTION, 'nCaseFilter', n_CaseFilter);
    //WriteBool(SECTION, 'bFilter', popFilter.Checked);
    Free;
  end;
  if bIsFormCheckKmd then
    FormCheckKmd.Close;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.dbgrKmdDrawColumnCell(Sender: TObject; const Rect: TRect;
                      DataCol: Integer; Column: TColumn; State: TGridDrawState);
var cFldNm : ShortString;
    // nPredTabN : integer; dPredDtB, dPredDtE : TDateTime;
begin
  cFldNm := UpperCase(Column.FieldName);
  with dbgrKmd.Canvas do begin
    if qryKmdBlock.AsString = 'Z' then
      Font.Color := clBlue
    else if qryKmdVidN.IsNull then
      Font.Color := clMaroon
    else
      Font.Color := clGray;
    if not (gdFocused in State) and (cFldNm = 'O_DTPROC') then begin
      if (qryKmdO_DtProc.AsDateTime = d_DtPrc) then
        Brush.Color := clWindow
      else
        Brush.Color := $00B4FCE2;
    end;
  end;
  dbgrKmd.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.sBtnPodklClick(Sender: TObject);
var bBlock : boolean;
begin
  with qryKmd do begin
    bBlock := qryKmdBlock.AsString = 'Z';
    if (RecordCount > 0) and qryKmdVidN.IsNull then
      PodklCurKmdRec(bBlock);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.PodklCurKmdRec(bBlock : boolean);
var nSvNR, nKmdNR, nTabN, nSpec_NR : integer;
    dDtZaMG, dDtBeg, dDtEnd, dDtBP, dDtEP : TDateTime;
    cVidN, cNotes : ShortString;
    nYB, nMB, nDB, nYE, nME, nDE : word;
    nKdObj, nKdKatP, nKdSpZ, nKdTemu : SmallInt;
    nChas, nSmSrK, nCntWrkDay, nSumma : double;
    bSvFlagDbg : boolean;
begin
  dDtZaMG := 0;
  nChas := 0;
  dDtBeg := 0;
  dDtEnd := 0;
  if qryKmdVidN.IsNull then begin
    nKmdNR := qryKmdNR.AsInteger;
    nTabN  := qryKmdTabN.AsInteger;
    nKdTemu := qryKmdKdTemu.AsInteger;
    DecodeDate(qryKmdDtBeg.AsDateTime, nYB, nMB, nDB);
    DecodeDate(qryKmdDtEnd.AsDateTime, nYE, nME, nDE);
    if nME = nMB then begin
      dDtZaMG := EncodeDate(nYB, nMB, 1);
      dDtBeg  := qryKmdDtBeg.AsDateTime;
      dDtEnd  := qryKmdDtEnd.AsDateTime;
      nChas   := DmMain.CountWorkChas(dDtBeg, dDtEnd);
    end;
    cVidN := '1206';
    cNotes := qryKmdNotes.AsString;
    nSmSrK := 0;
    DecodeDate(dDtZaMG, nYB, nMB, nDB);   // Определить два предМесяца
    Inc(nMB, -1);
    if nMB = 0 then begin
      nMB := 12;
      Inc(nYB, -1);
    end;
    dDtEP := EncodeDate(nYB, nMB, 1);
    Inc(nMB, -1);
    if nMB = 0 then begin
      nMB := 12;
      Inc(nYB, -1);
    end;
    dDtBP := EncodeDate(nYB, nMB, 1);
    if GetSrDnKmd(nTabN, dDtBeg, dDtEnd, dDtBP, dDtEP,
                                          bBlock, nSmSrK) {z_GtSrK} then begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      GetPereInf(nTabN, dDtBeg, nKdObj, nKdKatP, nKdSpZ);
      nCntWrkDay := DmMain.CountWorkDays(dDtBeg, dDtEnd);
      nSpec_NR := DmMain.NewSpec_NR;
      nSumma := nCntWrkDay * nSmSrK;
      Screen.Cursor := crSQLWait;
      if not qryKmdKdSchDbt.IsNull then
        nKdSpZ := qryKmdKdSchDbt.AsInteger;  // т.е. подставляем тот nKdSpZ,
        // что пришёл из es_Kmd. Если в es_Kmd пусто - ставим из GetPereInf
      AddRecIntoOtkl(nKmdNR, nTabN, nSpec_NR, nKdObj, nKdKatP, nKdSpZ, nKdTemu,
               d_DtPrc, dDtZaMG, dDtBeg, dDtEnd, nChas, nSumma, cVidN, cNotes);
      bSvFlagDbg := bFlagDbg;
      bFlagDbg := false;
      Screen.Cursor := crSQLWait;
      StartRs5(false, nTabN, '', d_DtPrc);     {z_Rs5}
      with FormZpMain.qrySps do begin
        Close;
        Open;
        Locate('TabN', nTabN, []);
      end;
      bFlagDbg := bSvFlagDbg;
      nSvNR := qryKmdNR.AsInteger;
      with qryKmd do begin
        Close;
        Open;
        Locate('NR', nSvNR, []);
      end;
      Screen.Cursor := crDefault;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.popPopup(Sender: TObject);
begin
  popPodklRecord.Enabled := (qryKmd.RecordCount > 0) and qryKmdVidN.IsNull;
  popOtklRecord.Enabled := (qryKmd.RecordCount > 0) and
                      not qryKmdVidN.IsNull and not qryKmdSpec_NrZp.IsNull and
                      (qryKmdBlock.AsString <> 'Z');
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.dbgrKmdDblClick(Sender: TObject);
begin
  if (qryKmd.RecordCount > 0) then begin
    if qryKmdVidN.IsNull then
      popPodklRecordClick(Self)
    else if not qryKmdVidN.IsNull and not qryKmdSpec_NrZp.IsNull and
                      (qryKmdBlock.AsString <> 'Z') then
      popOtklRecordClick(Self);
    if not qryKmd.Eof then
      qryKmd.Next
    else
      dbgrKmd.Refresh;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.popPodklRecordClick(Sender: TObject);
var bBlock : boolean;
begin
  with qryKmd do begin
    bBlock := qryKmdBlock.AsString = 'Z';
    if (RecordCount > 0) and qryKmdVidN.IsNull then
      PodklCurKmdRec(bBlock);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.popOtklRecordClick(Sender: TObject);
var cMsg : ShortString; bSvFlagDbg : boolean;
    nTabN, nSvKmdNR, nSpecNrZp : integer;
begin
  cMsg := 'Удалить текущую запись из отклонений' + #13#10 +
          '(в "Подотчётных лицах" остаётся и становится' + #13#10 +
          'доступной для удаления или редактирования)?:';
  if MessageDlg(cMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    nTabN := qryKmdTabN.AsInteger;
    nSpecNrZp := qryKmdSpec_NrZp.AsInteger;
    with qryTmp do begin
      if Active then Close;
      SQL.Clear;
      DataBaseName := CESMAIN;
      // 1-е Удалить запись из отклонений (по Spec_NrZp)
      SQL.Add('Delete from Z_Otkl where TabN = :nTabN and Spec_NR = :nSpecNR');
      ParamByName('nTabN').AsInteger := nTabN;
      ParamByName('nSpecNR').AsInteger := nSpecNrZp;
      ExecSQL;
      SQL.Clear;
      // 2-е Сделать Update K_OPL (сделать Spec_NrZp = NULL)
      SQL.Add('Update K_OPL set Spec_NrZp = NULL where KdRsh = 1 and ' +
              ' Spec_NrZp = :nSpecNR');
      ParamByName('nSpecNR').AsInteger := nSpecNrZp;
      ExecSQL;
      SQL.Clear;
      DataBaseName := '';
    end;
    // 3-е Можно переРасчитать TabN
    bSvFlagDbg := bFlagDbg;
    bFlagDbg := false;
    StartRs5(false, nTabN, '', d_DtPrc);     {z_Rs5}
    with FormZpMain.qrySps do begin
      Close;
      Open;
      Locate('TabN', nTabN, []);
    end;
    bFlagDbg := bSvFlagDbg;
    with qryKmd do begin
      nSvKmdNR := qryKmdNR.AsInteger;
      Close;
      Open;
      Locate('NR', nSvKmdNR, []);
    end;
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.GetPereInf(nTabN : integer; dDtBeg : TDateTime;
                                        var nKdObj, nKdKatP, nKdSpZ : SmallInt);
begin
  nKdObj  := 0;
  nKdKatP := 0;
  nKdSpZ  := 0;
  with qryPere do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Select First 1 KdObj, KdKatP, KdSpZ from z_Pere ' +
            ' where TabN = :nTabN and Dt_Beg <= :dDtBeg order by Dt_Beg desc');
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('dDtBeg').AsDateTime  := dDtBeg;
    Open;
    if RecordCount > 0 then begin
      nKdObj  := FieldByName('KdObj').AsInteger;
      nKdKatP := FieldByName('KdKatP').AsInteger;
      nKdSpZ  := FieldByName('KdSpZ').AsInteger;
    end;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.AddRecIntoOtkl(nKmdNR, nTabN, nSpec_NR : integer;
                                 nKdObj, nKdKatP, nKdSpZ, nKdTemu : SmallInt;
                                   dDtPrc, dDtZaMG, dDtBeg, dDtEnd : TDateTime;
                                                   nChas, nSumma : double;
                                                   cVidN, cNotes : ShortString);
var cLogMsg : ShortString;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add('Insert into z_Otkl (KdSps, DtProc, ZaMesGod, TabN, Spec_NR, ' +
            ' VidN, Dt_Beg, Dt_End, Chas, Summa, Notes, KdObj, KdKatP, ' +
            ' KdSpZ, KdTemu, PdN, PrPV) values (1, :dDtPrc, :dDtZaMG, ' +
            ' :nTabN, :nSpec_NR, :cVidN, :dDtBeg, :dDtEnd, :nChas, ' +
            ' :nSumma, :cNotes, :nKdObj, :nKdKatP, :nKdSpZ, :nKdTemu, 1, 1)');
    ParamByName('dDtPrc').AsDateTime  := dDtPrc;
    ParamByName('dDtZaMG').AsDateTime := dDtZaMG;
    ParamByName('nTabN').AsInteger    := nTabN;
    ParamByName('cVidN').AsString     := cVidN;
    ParamByName('dDtBeg').AsDateTime  := dDtBeg;
    ParamByName('dDtEnd').AsDateTime  := dDtEnd;
    ParamByName('nChas').AsFloat      := nChas;
    ParamByName('nSumma').AsFloat     := nSumma;
    ParamByName('cNotes').AsString    := cNotes;
    ParamByName('nKdObj').AsInteger   := nKdObj;
    ParamByName('nKdKatP').AsInteger  := nKdKatP;

    ParamByName('nKdSpZ').AsInteger   := nKdSpZ;
    ParamByName('nKdTemu').AsInteger  := nKdTemu;
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    ExecSQL;
    cLogMsg := 'TabN = ' + IntToStr(nTabN) + ', DtProc = ' + DateToStr(dDtPrc) +
             ', ZaMesGod = ' + DateToStr(dDtZaMG) + ', VidN = ' + cVidN +
           ', Chas = ' + FloatToStr(nChas) + ', Summa = ' + FloatToStr(nSumma);
    DmMain.AddLog(Now, nTabN, 'Подкл.команд.', gc_AppNmUsr, 'Z_Otkl', cLogMsg);
    SQL.Clear;
    SQL.Add('Update K_Opl set Spec_NrZp = :nSpec_NR where NR = :nKmdNR');
    ParamByName('nSpec_NR').AsInteger := nSpec_NR;
    ParamByName('nKmdNR').AsInteger := nKmdNR;
    ExecSQL;
    SQL.Clear;
    DataBaseName := '';
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.popSortByTabNClick(Sender: TObject);
begin
  if not popSortByTabN.Checked then begin
    popSortByTabN.Checked := true;
    popSortByFIO.Checked := false;
    OpenQryKmd(d_DtPrc);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.popSortByFIOClick(Sender: TObject);
begin
  if not popSortByFIO.Checked then begin
    popSortByTabN.Checked := false;
    popSortByFIO.Checked := true;
    OpenQryKmd(d_DtPrc);
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.popFilterBezClick(Sender: TObject);
begin
  if not popFilterBez.Checked then begin
    popFilterBez.Checked := true;
    popFilterOnlyCurMes.Checked := false;
    popFilterOnlyNePodkl.Checked := false;
    n_CaseFilter := 0;
    SetKmdFilter;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.popFilterOnlyNePodklClick(Sender: TObject);
begin
  if not popFilterOnlyNePodkl.Checked then begin
    popFilterOnlyNePodkl.Checked := true;
    popFilterOnlyCurMes.Checked := false;
    popFilterBez.Checked := false;
    n_CaseFilter := 1;
    SetKmdFilter;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.popFilterOnlyCurMesClick(Sender: TObject);
begin
  if not popFilterOnlyCurMes.Checked then begin
    popFilterOnlyCurMes.Checked := true;
    popFilterBez.Checked := false;
    popFilterOnlyNePodkl.Checked := false;
    n_CaseFilter := 2;
    SetKmdFilter;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.SetKmdFilter;
var nSvNR : integer;
begin
  with qryKmd do begin
    nSvNR := qryKmdNR.AsInteger;
    if n_CaseFilter = 0 then begin
      StatusBar.Panels[1].Text := 'Без фильтра';
      Filter := '';
      Filtered := false; end
    else if n_CaseFilter = 1 then begin
      StatusBar.Panels[1].Text := 'Фильтр: "Все НеПодключённые записи"';
      Filter := 'VidN = NULL';
      Filtered := true; end
    else if n_CaseFilter = 2 then begin
      StatusBar.Panels[1].Text :=
                       'Фильтр: "Записи текущего месяца и НеПодключённые"';
      Filter := '(O_DtProc = ' + DateToStr(d_DtPrc) + ') or (VidN = NULL)';
      Filtered := true;
    end;
    Locate('NR', nSvNR, []); // then
    StatusBar.Panels[0].Text := 'Записей: ' + IntToStr(RecordCount);
  end;
  sBtnPrt.Visible := ((n_CaseFilter = 1) or (n_CaseFilter = 2));
  sBtnPrt.Enabled := ((n_CaseFilter = 1) or (n_CaseFilter = 2)) and
                     (qryKmd.RecordCount > 0);
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.dbgrKmdEnter(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clYellow;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.dbgrKmdExit(Sender: TObject);
begin
  (Sender as TDBGrid).FixedColor := clBtnFace;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.sBtnPrtClick(Sender: TObject);
var cFilterMsg : ShortString;
begin
  cFilterMsg := '';
  F6_PrtKmd(d_DtPrc, cFilterMsg, qryKmd);
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.sBtnCheckKmdClick(Sender: TObject);
begin
  ShowCheckKmd;   {z_ChKmd}
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.sBtnInfClick(Sender: TObject);
begin
  PanelInf.Visible := not PanelInf.Visible;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.sBtnInfCloseClick(Sender: TObject);
begin
  PanelInf.Visible := false;
end;
//------------------------------------------------------------------------------
procedure TFormAddKmd.FormResize(Sender: TObject);
begin
  PanelInf.Top := Round((Height - PanelInf.Height) / 2);
  PanelInf.Left := Round((Width - PanelInf.Width) / 2);
end;

end.
