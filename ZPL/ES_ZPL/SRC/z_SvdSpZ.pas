unit z_SvdSpZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, DBTables, Grids,
  DBGrids, Menus, Provider, DBClient;

type
  string4 = string[4];
  string10 = string[10];
  PTreeRec = ^TTreeRec;
  TTreeRec = record
    KdSBU : SmallInt;
    SchBU : string10;
    PSCH  : String10;
  end;
  TFormSvdSPZ = class(TForm)
    qryTmp: TQuery;
    cdsSPZ: TClientDataSet;
    dspTmp: TDataSetProvider;
    cdsSPZVNU: TSmallintField;
    cdsSPZKDOBJ: TSmallintField;
    cdsSPZKDSPZ: TSmallintField;
    cdsSPZSCHBU: TStringField;
    cdsSPZVIDN: TStringField;
    cdsSPZNMVIDN: TStringField;
    cdsSPZSHVIDN: TStringField;
    cdsSPZSMM: TFloatField;
    cdsSPZVid_SpZ: TStringField;
    cdsSPZVid_KdSpZ: TSmallintField;
    cdsSPZPSCH: TStringField;
    dsrcSPZ: TDataSource;
    qryTvNu: TQuery;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    Bevel1: TBevel;
    Panel4: TPanel;
    sBtnGo: TSpeedButton;
    LabelCntSelSch: TLabel;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    PanelRight2: TPanel;
    ts2: TTabSheet;
    Panel1: TPanel;
    sBtnBack2: TSpeedButton;
    LabelMsgTs2: TLabel;
    sBtnPrt: TSpeedButton;
    BitBtn1: TBitBtn;
    dbgrSpZ: TDBGrid;
    TV: TTreeView;
    LbxSchBU: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    rBtnTtsAllAndCmn: TRadioButton;
    rBtnTtsOnlyCmn: TRadioButton;
    LabelSelMsg2: TLabel;
    sBtnSel: TSpeedButton;
    sBtnSelAll: TSpeedButton;
    sBtnUnSelAll: TSpeedButton;
    cdsSPZVID_KEKV: TStringField;
    cdsSPZCNT: TIntegerField;
    cdsSPZKRSCH: TStringField;
    cdsSPZPRR: TSmallintField;
    sBtnProverki: TSpeedButton;
    pop2: TPopupMenu;
    pop2details: TMenuItem;
    LabelDbg: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBtnGoClick(Sender: TObject);
    procedure sBtnBack2Click(Sender: TObject);
    procedure sBtnSelClick(Sender: TObject);
    procedure sBtnSelAllClick(Sender: TObject);
    procedure sBtnUnSelAllClick(Sender: TObject);
    procedure sBtnPrtClick(Sender: TObject);
    procedure cdsSPZCalcFields(DataSet: TDataSet);
    procedure TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
                             State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sBtnProverkiClick(Sender: TObject);
    procedure pop2detailsClick(Sender: TObject);
  private
    { Private declarations }
    d_MesDate : TDateTime;
    bTvReady : boolean;
    bSintBold, bAnalitBold : boolean;
    nCaseReport : word;
    procedure CreTvSpZ(dMesDate : TDateTime);
    //procedure CreOpenCdsSpZ(d_MesDate : TDateTime);
    procedure CreOpenCdsSpZ(cSQL : string; d_MesDate : TDateTime);
  public
    { Public declarations }
  end;

procedure SvdSpZ(dMesDate : TDateTime);

const SECTION = 'z_SvdSpZ';

var
  FormSvdSPZ: TFormSvdSPZ;

implementation

uses a_Const, A_DM, a_Lib, Z_Dm, z_Main, z_CmnPrt, z_SvdPrv, z_ShMoDt;

{$R *.dfm}

procedure SvdSpZ(dMesDate : TDateTime);
var nY, nM, nD : word;
begin
  FormSvdSPZ := TFormSvdSPZ.Create(Application);
  with FormSvdSPZ do begin
    if bFlagDbg then
      LabelDbg.Caption := 'Старая (до 01-01-2007) схема '
    else
      LabelDbg.Caption := '';
    d_MesDate := dMesDate;
    bTvReady  := false;
    bSintBold := true;
    bAnalitBold := true;
    DecodeDate(dMesDate, nY, nM, nD);
    Caption := 'Формирование задания для журнала-ордера за ' +
                                    MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    CreTvSpZ(dMesDate);
    Label1.Caption := 'Слева счета (источники финансирования), встретившиеся ' +
                      'в таблице начислений-удержаний за ' +
                      MesRus(nM) + ' ' + IntToStr(nY) + ' г.';
    ShowModal;
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.CreTvSpZ(dMesDate : TDateTime);
var F1 : TextFile;
    cNmTv, cMsg, cPSCH, cNmPSch : string;
    i, nKdPSch : integer;
    MyTreeRec : PTreeRec;
begin
  cNmTv := 'SpZ.tv1';
  AssignFile(F1, cDirTemp + cNmTV);
  Rewrite(F1);
  with qryTvNu do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    //                вроде хорошо округляет  Sum(Cast(Summa as numeric (18,2)))
    SQL.Add('Select PSch, KdSpZ, SchBU, NmSch, Sum(summa) as Summa ' +
            ' from ViNu4 where dtProc = :dMesDate ' +
            ' group by SchBU, PSch, KdSpZ, NmSch');
    ParamByName('dMesDate').AsDateTime := dMesDate;
    Open;
    while not Eof do begin
      //if FieldByName('PSCH').IsNull then begin
      //  Next;
      //  Continue;
      //end;
      cPSCH := FieldByName('PSCH').AsString;
      nKdPSch := DmMain.KdSbu2KdPSch(FieldByName('KdSpZ').AsInteger);
      cNmPSch := DmMain.KdSbu2NmSbu(nKdPSch);
      WriteLn(F1, cPSCH + ' ' + cNmPSch);
      while (FieldByName('PSCH').AsString = cPSCH) and not Eof do begin
        cMsg := ' ' + FieldByName('SchBU').AsString + '  ' +
                                   FieldByName('NmSch').AsString;
        WriteLn(F1, cMsg);
        Next;
      end;
    end;
    CloseFile(F1);
    // Загрузить дерево из только что созданного
    // текстового файла (cDirTemp + cNmTV1):
    TV.Items.BeginUpdate;
    TV.Items.Clear;
    // Заполнить связанные Objects
    TV.LoadFromFile(cDirTemp + cNmTV);
    TV.Items.EndUpdate;
    First;
    i := 0;
    while not Eof do begin
      if FieldByName('PSCH').IsNull then begin
        Next;
        Continue;
      end;
      cPSCH := FieldByName('PSch').AsString;
      New(MyTreeRec);     // Записываем корневой счет
      MyTreeRec.KdSbu  := DmMain.KdSbu2KdPSch(FieldByName('KdSpZ').AsInteger);
      MyTreeRec.SchBU  := Trim(FieldByName('PSch').AsString);
      MyTreeRec.PSCH   := Trim(FieldByName('PSch').AsString);
      TV.Items[i].Data := MyTreeRec;
      Inc(i);
      while (FieldByName('PSCH').AsString = cPSCH) and not Eof do begin
        New(MyTreeRec);     // Дочерний счет
        MyTreeRec.KdSbu  := FieldByName('KdSpZ').AsInteger;
        MyTreeRec.SchBU  := Trim(FieldByName('SchBU').AsString);
        MyTreeRec.PSCH   := Trim(FieldByName('PSch').AsString);
        TV.Items[i].Data := MyTreeRec;
        Inc(i);
        Next;
      end;
    end;
    if FileExists(cDirTemp + cNmTV) then
      DeleteFile(cDirTemp + cNmTV);
    TV.FullExpand;
    TV.Items[0].Selected := true;
    bTvReady := true;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
                             State: TCustomDrawState; var DefaultDraw: Boolean);
var i, nAIndx : integer; bHasChild : boolean;
begin
  if bTvReady then with TV.Canvas do begin
    nAIndx := Node.AbsoluteIndex;
    bHasChild  := Node.HasChildren;
    if bHasChild then begin
      if bSintBold then
        Font.Style := [fsBold]
      else
        Font.Style := []; end
    else begin
      if bAnalitBold then
        Font.Style := [fsBold]
      else
        Font.Style := [];
    end;
    i := LbxSchBU.Items.IndexOf(IntToStr(nAIndx));
    if (cdsSelected in State) then
      Brush.Color := clAqua;
    if i >= 0 then
      Font.Color := clRed
    else
      Font.Color := clWindowText;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.FormResize(Sender: TObject);
begin
  PanelRight2.Top := Round((Height - PanelRight2.Height)/2) - 20;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.FormCreate(Sender: TObject);
begin
  ts1.TabVisible := false;
  ts2.TabVisible := false;
  PageControl1.ActivePage := ts1;
  with TIniFile.Create(cNmIniFile) do begin
    Left   := ReadInteger(SECTION, 'wL', 100);
    Top    := ReadInteger(SECTION, 'wT', 300);
    Height := ReadInteger(SECTION, 'wH', 500);
    Width  := ReadInteger(SECTION, 'wW', 750);
    rBtnTtsAllAndCmn.Checked := false; // ReadBool(SECTION, 'bTtsAll', false);
    rbtnTtsOnlyCmn.Checked := true;    // not rBtnTtsAllAndCmn.Checked;
    Free;
  end;
  if FileExists(cDirVids + 'SvdSpz_3.vid') then
    dbgrSpZ.Columns.LoadFromFile(cDirVids + 'SvdSpz_3.vid');
  LabelCntSelSch.Caption := '';
  LabelMsgTs2.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgrSpZ.Columns.SaveToFile(cDirVids + 'SvdSpz_3.vid');
  with TIniFile.Create(cNmIniFile) do begin
    WriteInteger(SECTION, 'wL', Left);
    WriteInteger(SECTION, 'wT', Top);
    WriteInteger(SECTION, 'wH', Height);
    WriteInteger(SECTION, 'wW', Width);
    WriteBool(SECTION, 'bTtsAll', rBtnTtsAllAndCmn.Checked);
    Free;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.sBtnGoClick(Sender: TObject);
var i, nAdd, nTvCount : integer;  cPSch, cSchBU : string10; bHasChild : boolean;
    cSQL : string;
begin
  nTvCount := TV.Items.Count;
  if bSintBold and bAnalitBold then begin // Нет помеченных
    if (TV.Selected <> nil) then begin
      i := TV.Selected.AbsoluteIndex;
      cPSch  := PTreeRec(TV.Items[i].Data)^.PSch;
      cSchBU := PTreeRec(TV.Items[i].Data)^.SchBU;
      bHasChild := TV.Items[i].HasChildren;
      if bHasChild then begin {выбран (но не помечен) синт.счет}
        cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
                ' Cast(32765 as SmallInt) as KdObj, PSch, ' +
                ' KdSpZ, PRR, SchBU, VidN, ShVidn, NmVidN, Vid_KdSpZ, ' +
                ' Vid_KEKV, Sum(Smm) as SMM, Sum(CNT) as CNT, ' +
                ' Cast(null as Char(10)) as KrSch ' +
                ' From FOR_GO4 (:dMesDate) ' +
                ' where PSCH = "' + cPSch + '" and (KdObj <> 1056) and ' +
                ' VidN < "8600" group by PSch, KdSpZ, PRR, SchBU, VidN, ' +
                ' ShVidn, NmVidN, Vid_KdSpZ, Vid_KEKV';
        nCaseReport := 1; end
      else begin {выбран (но не помечен) аналитический счет}
        cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
                ' Cast(32765 as SmallInt) as KdObj, PSch, ' +
                ' KdSpZ, PRR, SchBU, VidN, ShVidn, NmVidN, Vid_KdSpZ, ' +
                ' Vid_KEKV, Sum(Smm) as SMM, Sum(CNT) as CNT, ' +
                ' Cast(null as Char(10)) as KrSch ' +
                ' From FOR_GO4 (:dMesDate) ' +
                ' where SchBU = "' + cSchBU + '" and (KdObj <> 1056) and ' +
                ' VidN < "8600" group by PSch, KdSpZ, PRR, SchBU, VidN, ' +
                ' ShVidn, NmVidN, Vid_KdSpZ, Vid_KEKV';
        nCaseReport := 2;
      end;
    end; end
  else if bSintBold then begin // Помечен один или несколько синтетических
    cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
            ' Cast(32765 as SmallInt) as KdObj, PSch, ' +
            ' KdSpZ, PRR, SchBU, VidN, ShVidn, NmVidN, Vid_KdSpZ, ' +
            ' Vid_KEKV, Sum(Smm) as SMM, Sum(CNT) as CNT, ' +
            ' Cast(null as Char(10)) as KrSch ' +
            ' From FOR_GO4 (:dMesDate) ' +
            ' where PSCH in (';
    nAdd := 0;
    for i := 0 to nTvCount-1 do begin
      if LbxSchBU.Items.IndexOf(IntToStr(i)) >= 0 then begin
        Inc(nAdd);
        cPSch  := PTreeRec(TV.Items[i].Data)^.PSch;
        cSQL := cSQL + '"' + cPSch + '"';
        if nAdd < LbxSchBU.Count then
          cSQL := cSQL + ',';
      end;
    end;
    cSQL := cSQL + ') and (KdObj <> 1056) and ' +
                ' VidN < "8600" group by PSch, KdSpZ, PRR, SchBU, VidN, ' +
                ' ShVidn, NmVidN, Vid_KdSpZ, Vid_KEKV';
    nCaseReport := 11; end  // синтетический
  else if bAnalitBold  then begin  // Помечен один или несколько аналитических
    cSQL := 'Select Cast(1 as SmallInt) as VNU, ' +
            ' Cast(32765 as SmallInt) as KdObj, PSch, ' +
            ' KdSpZ, PRR, SchBU, VidN, ShVidn, NmVidN, Vid_KdSpZ, ' +
            ' Vid_KEKV, Sum(Smm) as SMM, Sum(CNT) as CNT, ' +
            ' Cast(null as Char(10)) as KrSch ' +
            ' From FOR_GO4 (:dMesDate) ' +
            ' where SchBU in (';
    nAdd := 0;
    for i := 0 to nTvCount-1 do begin
      if LbxSchBU.Items.IndexOf(IntToStr(i)) >= 0 then begin
        Inc(nAdd);
        cSchBU  := PTreeRec(TV.Items[i].Data)^.SchBU;
        cSQL := cSQL + '"' + cSchBU + '"';
        if nAdd < LbxSchBU.Count then
          cSQL := cSQL + ',';
      end;
    end;
    cSQL := cSQL + ') and (KdObj <> 1056) and ' +
                ' VidN < "8600" group by PSch, KdSpZ, PRR, SchBU, VidN, ' +
                ' ShVidn, NmVidN, Vid_KdSpZ, Vid_KEKV';
    nCaseReport := 22; end
  else
    // такого не может случиться
    ;
  CreOpenCdsSpZ(cSQL, d_MesDate);
  PageControl1.ActivePage := ts2;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.CreOpenCdsSpZ(cSQL : string; d_MesDate : TDateTime);
var {cPSch, cSchBU,} cKrSch : string10;
    cVidN : string4;
    //c_SQL, cWhereMsg, cPartPSCH : string;
    //bIsFirstPSCH, bIsPartSbu, bIsFirstIN : boolean;
    nVNU : integer;
begin
  with qryTmp do begin
    if Active then Close;
    SQL.Clear;
    DataBaseName := CESMAIN;
    SQL.Add(cSQL);
    ParamByName('dMesDate').AsDateTime := d_MesDate;
    if bFlagDbg then
      SQL.SaveToFile(cDirTemp + 'NewSql.sql');
    Open;
  end;
  dspTmp.DataSet := qryTmp;
  with cdsSpz do begin
    if Active then Close;
    IndexDefs.Clear;
    IndexName := '';
    ProviderName := 'dspTmp';
    Open;
    if (nCaseReport = 1) or (nCaseReport = 11) then // по СинтСчетам
      AddIndex('CdsIndx', 'PSch;VNU;VidN;SchBU', [])
    else                                            // по АналитСчетам
      AddIndex('CdsIndx', 'PSch;SchBU;VNU;VidN', []);
    First;
    while not Eof do begin
      cVidN := FieldByName('VidN').AsString;
      nVNU := 1;
      // больничные, кроме 1-х 5-ти дней
      // SB 23.3.2026 По аналогии, наверное, и 2606
      if (cVidN <> '2603') and (cVidN <> '2606') and
              ((cVidN >= '2600') and (cVidN < '2700')) or
            (cVidN = '1901') or (cVidN = '1909') then begin
            // 1901 - пособие ЧОО, 1909 - пособие при рожд ребенка
        nVNU := 0;
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger); end
      else if (cVidN = '2705') {приход в кассу} then begin
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 1;  end
      else if (cVidN > '2700') and
                        (cVidN < '2750') {прочие начисления} then begin
        if (nCaseReport = 1) or (nCaseReport = 11) then
          cKrSch := cdsSpzPSch.AsString
        else
          cKrSch := cdsSpzSchBU.AsString;
        // cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 1;  end
      else if (cVidN < '6000') then begin
        if (nCaseReport = 1) or (nCaseReport = 11) then
          cKrSch := cdsSpzPSch.AsString
        else
          cKrSch := cdsSpzSchBU.AsString;
        nVNU := 1; end
      else if ((cVidN >= '6000') and (cVidN < '7000')) then begin  // удержания
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 2; end
      else if ((cVidN >= '7000') and (cVidN < '7500')) then begin // прочие
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger); //(удалил все)
        nVNU := 3; end                            // теперь таких видов не стало
      else if ((cVidN >= '7500') and (cVidN < '7600')) then begin  // выплаты
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 4; end
      else if ((cVidN >= '8600') and (cVidN < '8670')) then begin // взн.предпр.
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := 5; end
      else if ((cVidN >= '8670') and (cVidN < '8680')) then begin // СвПороги
        cKrSch := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
        nVNU := -1;
      end;
      Edit;
      FieldByName('VNU').AsInteger := nVNU;
      FieldByName('KrSch').AsString := cKrSch;
      Post;
      Next;
    end;
    IndexName := 'CdsIndx';
    First;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.sBtnBack2Click(Sender: TObject);
begin
  LabelMsgTs2.Caption := '';
  PageControl1.ActivePage := ts1;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.sBtnPrtClick(Sender: TObject);
var cPrtCaption : string;
begin
  cPrtCaption := '';
  if (nCaseReport = 1) or (nCaseReport = 11) then begin
    if bFlagDbg then
      cPrtCaption := 'F6PrtMoBySintSPZ';  // по синтетическим счетам
    F6PrtMoBySintSPZ(cdsSPZ, dDtProc, cPrtCaption); end
  else begin
    if bFlagDbg then
      cPrtCaption := 'F6PrtMoByAnalitSPZ';  // по аналитическим счетам
    F6PrtMoByAnalitSPZ(cdsSPZ, dDtProc, cPrtCaption); {z_CmnPrt}
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.sBtnProverkiClick(Sender: TObject);
begin
  ShwSvdPrv(cdsSPZ, dDtProc);  {z_SvdPrv}
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.cdsSPZCalcFields(DataSet: TDataSet);
begin
  cdsSpzVid_SpZ.AsString := DmMain.KdSbu2SchBU(cdsSpzVid_KdSpZ.AsInteger);
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.sBtnSelClick(Sender: TObject);
var i, iSel, nTvCount, nSelCount : integer; bHasChild : boolean;
begin
  nTvCount := TV.Items.Count;
  if (TV.Selected <> nil) then begin
    iSel := TV.Selected.AbsoluteIndex;
    bHasChild := TV.Selected.HasChildren;
    i := LbxSchBU.Items.IndexOf(IntToStr(iSel));
    if (i < 0) and ((bHasChild and bSintBold) or
                    (not bHasChild and bAnalitBold)) then
      LbxSchBU.Items.Add(IntToStr(iSel))
    else if (i >= 0) then
      LbxSchBU.Items.Delete(i);
    nSelCount := LbxSchBU.Items.Count;
    if nSelCount > 0 then
      LabelCntSelSch.Caption :=
                 'Помечено счетов: ' + IntToStr(nSelCount)
    else
      LabelCntSelSch.Caption := '';
    if (nSelCount = 1) and bSintBold and bAnalitBold then begin
      if TV.Selected.HasChildren then begin
        // выключить все дочерние, включить синтетические
        bSintBold := true;
        bAnalitBold := false; end
      else begin
        // включить дочерние, выключить синтетические
        bSintBold := false;
        bAnalitBold := true;
      end;
      TV.Refresh; end
    else if nSelCount = 0 then begin
      // включить дочерние, включить синтетические
      bSintBold := true;
      bAnalitBold := true;
      TV.Refresh;
    end;
    if iSel < nTvCount-1 then
      TV.Items[iSel+1].Selected := true
    else begin
      TV.Items[iSel-1].Selected := true;
      TV.Items[iSel].Selected := true;
    end;
    sBtnSelAll.Enabled := LbxSchBU.Items.Count < nTvCount;
    sBtnUnSelAll.Enabled := LbxSchBU.Items.Count > 0;
  end;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.sBtnSelAllClick(Sender: TObject);
var i, nTvCount : integer;
begin
  nTvCount := TV.Items.Count;
  LbxSchBU.Clear;
  for i := 0 to nTvCount - 1 do begin
    LbxSchBU.Items.Add(IntToStr(i));
  end;
  TV.Refresh;
  sBtnSelAll.Enabled := false;
  sBtnUnSelAll.Enabled := LbxSchBU.Items.Count > 0;
  LabelCntSelSch.Caption :=
                 'Помечено счетов: ' + IntToStr(LbxSchBU.Items.Count);
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.sBtnUnSelAllClick(Sender: TObject);
begin
  LbxSchBU.Clear;
  bSintBold := true;
  bAnalitBold := true;
  TV.Refresh;
  sBtnSelAll.Enabled := LbxSchBU.Items.Count < TV.Items.Count;
  sBtnUnSelAll.Enabled := LbxSchBU.Items.Count > 0;
  if LbxSchBU.Items.Count > 0 then
    LabelCntSelSch.Caption :=
                      'Помечено счетов: ' + IntToStr(LbxSchBU.Items.Count)
  else
    LabelCntSelSch.Caption := '';
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.TVKeyDown(Sender: TObject; var Key: Word;
                                                         Shift: TShiftState);
begin
  if (Key = VK_F8) and (Shift = []) then
    sBtnSel.Click;
end;
//------------------------------------------------------------------------------
procedure TFormSvdSPZ.pop2detailsClick(Sender: TObject);
var cVidN : string4; cPSch, cSchBU : string10; nPRR : SmallInt;
    dZaMG : TDateTime;
begin
  cVidN  := cdsSpzVidN.AsString;
  cPSch  := cdsSpzPSch.AsString;
  cSchBU := cdsSpzSchBU.AsString;
  nPRR   := cdsSpZPRR.AsInteger;
  //dZaMG  := cdsSpZZaMesGod.AsDateTime;
//  ShowMoDetails(d_MesDate, dZaMG, cVidN, cPSch, cSchBU, nPRR);     {z_ShMoDt}
end;

end.
